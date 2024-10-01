

#include "qcommon.h"
#include "mariadb.h"
#include <thread>
#include <mutex>
#include <deque>
#include <iostream>
#include <condition_variable>
#include "crypt_blowfish.h"
#include "randombytes.h"

cvar_t* db_enabled;
static cvar_t* db_url;
static cvar_t* db_username;
static cvar_t* db_password;

static std::thread* dbThread;

static DBRequest currentPreparingRequest[MODULE_MAX];
static qboolean currentPreparingRequestValid[MODULE_MAX]{ qfalse };// it doesnt initialize all to qfalse, but everyone after first to 0, but that's the same thing so its ok :)

static DBRequest currentFinishedRequest[MODULE_MAX];
static qboolean currentFinishedRequestValid[MODULE_MAX]{ qfalse };// it doesnt initialize all to qfalse, but everyone after first to 0, but that's the same thing so its ok :)

struct {
	// connection
	qboolean connectionDetailsChanged;
	qboolean enabled;
	std::string url;
	std::string username;
	std::string password;

	// data
	std::mutex syncLock;
	std::condition_variable changeNotifier;
	qboolean terminate;										// end the thread
	std::deque<DBRequest> requestsIncoming;					// incoming are all in the order they came in
	std::deque<DBRequest> requestsFinished[MODULE_MAX];		// finished are served back to the modules they came from, so each needs its own queue
} dbSyncedData;

static std::mutex bcryptMutex;

class bcryptRequest {
public:
	std::vector<std::string> settings;
	std::string input;
	std::string errorMessage;
	qboolean success;
};

static bcryptRequest parseBCryptRequest(std::string input) {
	bcryptRequest retVal;
	int segmentCount = 0;
	char string[MAX_STRING_CHARS];
	char* s = string;
	const char* start = s;
	Q_strncpyz(string, input.c_str(), sizeof(string));
	while (*s != '\0') {
		if (*s == '|' && (!segmentCount || retVal.settings.size() < segmentCount)) {
			*s = '\0';
			std::string settingSegment = std::string(start);
			if (settingSegment.size()) {
				if (!segmentCount) {
					segmentCount = atoi(settingSegment.c_str());
					if (!segmentCount) {
						retVal.success = qfalse;
						retVal.errorMessage = "parseBCryptRequest: request must start with non-0 count of settings and then |";
						return retVal; // invalid
					}
				}
				else {
					retVal.settings.push_back(std::move(settingSegment));
				}
			}
			else {
				retVal.errorMessage = "parseBCryptRequest: settings segments must not be empty";
				retVal.success = qfalse;
				return retVal; // invalid
			}
			s++;
			start = s;
		}
		else if (segmentCount && retVal.settings.size() >= segmentCount) {
			break; // quicker exit from loop when first condition can never be satisfied anymore.
		}
		else {
			s++;
		}
	}
	retVal.input = std::move(std::string(start));
	if (!retVal.input.size()) {
		retVal.success = qfalse;
		retVal.errorMessage = "parseBCryptRequest: input must not be empty";
		return retVal; // invalid
	}
	if (!retVal.settings.size()) {
		retVal.success = qfalse;
		retVal.errorMessage = "parseBCryptRequest: no settings segments found";
		return retVal; // invalid
	}
	retVal.success = qtrue;
	return retVal;
}

static std::string bcryptString(std::string input, int* status, std::string setting) {
	int clientNum = -1;
	char pw[64];
	char settings[64];
	char output[64];
	char random[20];

	if (!Q_stricmp("random", setting.c_str())) {
		if (!randombytes(random, 20)) {
			_crypt_gensalt_blowfish_rn(BCRYPT_SETTINGS, 6, random, 20, settings, sizeof(settings));
		}
		else {
			if (status) {
				*status = -1;
				return "";
			}
		}
	}
	else {
		Q_strncpyz(settings, setting.c_str(), sizeof(settings));
	}

	std::lock_guard<std::mutex> bcryptLock(bcryptMutex); // just in case aanyone tries to use this outside of the db stuff. errno is a global var :/

	pw[0] = '\0';

	Q_strncpyz(pw, input.c_str(), sizeof(output));

	bcrypt_errno = 0;
	_crypt_blowfish_rn(pw, settings, output, 64);

	if (status) {
		*status = bcrypt_errno;
	}

	return std::string(output);

	Com_Printf("db bcrypt; settings: %s\nRaw pw: %s, bcrypt: %s, bcrypt_errno: %d\n", settings, pw, output, bcrypt_errno);
}

static void DB_BackgroundThread() {

	Com_Printf("MariaDB background thread started.\n");
	sql::Driver* driver = sql::mariadb::get_driver_instance();
	sql::Connection* conn = NULL;

	qboolean requestPending = qfalse; // if a request fails (connection not working or sth), keep that one in queue.
	DBRequest requestToProcess;
	qboolean connectionChanged = qfalse;
	while (1) {
		{
			std::unique_lock<std::mutex> l(dbSyncedData.syncLock);
			while ((!dbSyncedData.enabled || dbSyncedData.requestsIncoming.empty() && !requestPending) && !dbSyncedData.terminate ) {
				dbSyncedData.changeNotifier.wait(l);
			}
			if (dbSyncedData.terminate && (dbSyncedData.requestsIncoming.empty() && !requestPending || !dbSyncedData.enabled)) {
				if (conn != NULL) {
					conn->close();
					delete conn;
					conn = NULL;
				}
				break;
			}
			if (!dbSyncedData.enabled) continue;
			if (!requestPending) { // maybe last one failed.
				requestToProcess = std::move(dbSyncedData.requestsIncoming.front());
				dbSyncedData.requestsIncoming.pop_front();
				requestPending = qtrue;
			}
			if (dbSyncedData.connectionDetailsChanged) {
				connectionChanged = qtrue;
			}
			dbSyncedData.connectionDetailsChanged = qfalse;
		}

		bool skipToDone = false;

		if (requestToProcess.dbRequestType != DBREQUESTTYPE_REQUEST) {
			// other types of async requests that arent actual db requests but that we want to run on a different thread for performance reasons.
			switch (requestToProcess.dbRequestType) {
				default:
					requestToProcess.successful = qfalse;
					requestToProcess.errorCode = -1;
					requestToProcess.errorMessage = "Invalid request type";
					break;
				case DBREQUESTTYPE_BCRYPT:
				{
				 	bcryptRequest breq=  parseBCryptRequest(requestToProcess.requestString);
					if (!breq.success) {
						requestToProcess.successful = qfalse;
						requestToProcess.errorCode = -2;
						requestToProcess.errorMessage = breq.errorMessage;
						goto requestfailed;
					}
					std::string bcrypted = breq.input;
					if (com_developer->integer) {
						Com_Printf("Bcrypt input: %s\n",bcrypted.c_str());
					}
					for (int i = 0; i < breq.settings.size(); i++) {
						bcrypted = bcryptString(bcrypted, &requestToProcess.errorCode, breq.settings[i]);
						if (com_developer->integer) {
							Com_Printf("Bcrypt pass %d: status %d, settings %s, output %s\n", i, requestToProcess.errorCode, breq.settings[i].c_str(), bcrypted.c_str());
						}
						requestToProcess.successful = (qboolean)(requestToProcess.errorCode == 0);
						if (!requestToProcess.successful) {
							break;
						}
					}
					if (requestToProcess.successful) {
						DBRequestResultSet resultSet;
						SQLDelayedValues response;
						const char* result = bcrypted.c_str();
						response.add("result", result);
						resultSet.responseData.push_back(std::move(response));
						requestToProcess.results.push(std::move(resultSet));
					}
				}
					break;
			}
			requestfailed:
			requestPending = qfalse;
			skipToDone = true;
		}

		// update connection if needed
		reconnect:
		int connectTries = 0;
		qboolean connectionEnabled = qtrue;
		qboolean terminating = qfalse;

		if (skipToDone) {
			goto requestdone;
		}

		while (!conn || connectionChanged) {
			if (connectTries) {
				if (!connectionEnabled || terminating) {
					break;
				}
				// dont do a hyper-fast endless loop when we obviously cannot connect
				using namespace std::chrono_literals;
				std::this_thread::sleep_for(1000ms);
			}
			if (connectionChanged || !conn) {
				if (conn != NULL) {
					conn->close();
					delete conn;
					conn = NULL;
				}
				std::string url;
				std::string username;
				std::string password;
				{
					std::lock_guard<std::mutex> lock(dbSyncedData.syncLock);
					url = dbSyncedData.url;
					username = dbSyncedData.username;
					password = dbSyncedData.password;
					connectionEnabled = dbSyncedData.enabled;
					terminating = dbSyncedData.terminate;
				}
				connectionChanged = qfalse;
				try {
#ifdef DEBUG
					std::cout << "Trying db connection with " << url << "," << username << "," << password << "\n";
#endif
					// Configure Connection
					sql::SQLString urlsql(url);
					sql::Properties properties({ {"user", username.c_str()}, {"password", password.c_str()}
						//,{"CLIENT_MULTI_STATEMENTS", "true"} 
						,{"useAffectedRows", "true"}
						,{"allowMultiQueries", "true"}
						});

					// Establish Connection
					conn = driver->connect(urlsql, properties);
					std::unique_ptr<sql::Statement> stmnt(conn->createStatement());
					stmnt->execute("SET CHARACTER SET latin1"); // Make sure no character set shenanigans happen. Latin1 is what jka uses it seems. Good enough.
					Com_Printf("MariaDB connection established.\n");
				}
				catch (sql::SQLException& e) {

					if (connectTries % 10 == 0) {
						// don't spam too much
						Com_Printf("MariaDB connection failed.\n");
					}
					if (conn != NULL) {
						conn->close();
						delete conn;
						conn = NULL;
					}
					if (connectTries >= 10) {
						// dont stay in this loop forever. give the caller a chance to realize his request is going nowhere.
						requestToProcess.successful = qfalse;
						requestToProcess.errorCode = e.getErrorCode();
						requestToProcess.errorMessage = e.what();
						requestPending = qfalse;
						goto requestdone;
					}
				}
			}
			connectTries++;

		}

		// process request
		if (connectionEnabled && conn) {
			try {
				if (requestToProcess.isPreparedStatement) {
					// Create a new Statement
					std::unique_ptr<sql::PreparedStatement> stmnt(conn->prepareStatement(requestToProcess.requestString));
					int valueCount = requestToProcess.preparedValues.size();
					for (int i = 0; i < valueCount; i++) {
						requestToProcess.preparedValues.getValue(i)->bind(stmnt.get(),i+1);
					}

					bool wasResultSet = stmnt->execute();
					requestToProcess.digestResults(stmnt.get(), wasResultSet);
					/*
					// Execute query
					if (stmnt->execute()) {
						std::unique_ptr<sql::ResultSet> res(stmnt->getResultSet());
						while (res->next()) {
							result.responseData.push_back(SQLDelayedValues(res.get()));
						}
					}
					else {
						result.affectedRowCount = stmnt->getUpdateCount();
					}*/
					requestPending = qfalse;
				}
				else {
					// Create a new Statement
					std::unique_ptr<sql::Statement> stmnt(conn->createStatement());

					bool wasResultSet = stmnt->execute(requestToProcess.requestString);
					requestToProcess.digestResults(stmnt.get(), wasResultSet);
					// Execute query
					/*if (stmnt->execute(requestToProcess.requestString)) {
						std::unique_ptr<sql::ResultSet> res(stmnt->getResultSet());
						while (res->next()) {
							requestToProcess.responseData.push_back(SQLDelayedValues(res.get()));
						}
					}
					else {
						requestToProcess.affectedRowCount = stmnt->getUpdateCount();
					}*/
					requestPending = qfalse;
				}
			}
			catch (sql::SQLException& e) {
				bool connectionDied = false;
				try {
					if (!conn->isValid()) {
						connectionDied = true;
					}
				}
				catch (sql::SQLException& e2) {
					connectionDied = true;
				}
				if (connectionDied) {
					Com_Printf("MariaDB connection died.\n");
					// could try ->reconnect() but its buggy. just start over.
					conn->close();
					delete conn;
					conn = NULL;
					goto reconnect; // just reconnect.
				}
				if (!e.getErrorCode()) {
					// error code 0: not an error.
					requestToProcess.errorMessage = e.what();
					requestPending = qfalse;
				}
				else {
					int errorCode = e.getErrorCode();
					const int max_tries = 10;
					qboolean fastSkip = qfalse;
					if (errorCode == 1062 // ER_DUP_ENTRY 
						|| errorCode == 1146 // table doesnt exist
						) {
						fastSkip = qtrue;
					}
					if (fastSkip) {
						Com_Printf("MariaDB error executing query: error %d, %s \n", e.getErrorCode(), e.what());
					}
					else {
						Com_Printf("MariaDB error executing query (try %d/%d): error %d, %s \n", requestToProcess.tries + 1, max_tries, e.getErrorCode(), e.what());
					}
					if (requestToProcess.tries < max_tries && !fastSkip) {

						// dont do a hyper-fast endless loop when failing
						using namespace std::chrono_literals;
						std::this_thread::sleep_for(1000ms);
						requestToProcess.tries++;
					}
					else {
						// alright, move on...
						requestToProcess.successful = qfalse;
						requestToProcess.errorCode = e.getErrorCode();
						requestToProcess.errorMessage = e.what();
						requestPending = qfalse;
					}
				}
			}
		}

		requestdone:
		if (!requestPending) {
			std::lock_guard<std::mutex> lock(dbSyncedData.syncLock);
			dbSyncedData.requestsFinished[requestToProcess.module].push_back(std::move(requestToProcess));
		}

		// if we are closing down and there's no conceivable chance we will be able to succeed, just end it all.
		if (terminating && (!connectionEnabled || !conn)) {
			if (conn != NULL) {
				conn->close();
				delete conn;
				conn = NULL;
			}
			break;
		}
	}


	/**/
}

qboolean DB_AddRequest(DBRequest&& req) {
	if (!db_enabled->integer) return qfalse;
	{
		std::lock_guard<std::mutex>(dbSyncedData.syncLock);
		dbSyncedData.requestsIncoming.push_back(std::move(req));
	}
	dbSyncedData.changeNotifier.notify_one();
	return qtrue;
}
qboolean DB_AddPreparedStatement(DBRequest&& req) {
	if (!db_enabled->integer) return qfalse;
	currentPreparingRequest[req.module] = std::move(req);
	currentPreparingRequestValid[req.module] = qtrue;
	return qtrue;
}
qboolean DB_PreparedBindString(module_t module, const char* string) {
	if (!db_enabled->integer) return qfalse;
	if (!currentPreparingRequestValid[module]) return qfalse;
	currentPreparingRequest[module].preparedValues.add("whatever",string);
	return qtrue;
}
qboolean DB_PreparedBindFloat(module_t module, float number) {
	if (!db_enabled->integer) return qfalse;
	if (!currentPreparingRequestValid[module]) return qfalse;
	currentPreparingRequest[module].preparedValues.add("whatever", number);
	return qtrue;
}
qboolean DB_PreparedBindInt(module_t module, int number) {
	if (!db_enabled->integer) return qfalse;
	if (!currentPreparingRequestValid[module]) return qfalse;
	currentPreparingRequest[module].preparedValues.add("whatever", number);
	return qtrue;
}
qboolean DB_PreparedBindNull(module_t module) {
	if (!db_enabled->integer) return qfalse;
	if (!currentPreparingRequestValid[module]) return qfalse;
	currentPreparingRequest[module].preparedValues.add("whatever", SQLDelayedValue_NULL);
	return qtrue;
}
qboolean DB_PreparedBindBinary(module_t module, byte* data, int length) { // TODO untested
	if (!db_enabled->integer) return qfalse;
	if (!currentPreparingRequestValid[module]) return qfalse;
	currentPreparingRequest[module].preparedValues.add("whatever", data, length);
	return qtrue;
}
qboolean DB_FinishAndSendPreparedStatement(module_t module) {
	if (!db_enabled->integer) return qfalse;
	if (!currentPreparingRequestValid[module]) return qfalse;
	{
		std::lock_guard<std::mutex>(dbSyncedData.syncLock);
		dbSyncedData.requestsIncoming.push_back(std::move(currentPreparingRequest[module]));
		currentPreparingRequestValid[module] = qfalse;
	}
	dbSyncedData.changeNotifier.notify_one();
	return qtrue;
}
qboolean DB_AddRequest(module_t module, byte* reference, int referenceLength, int requestType, const char* request, DBRequestType_t dbRequestType) {
	if (!db_enabled->integer) return qfalse;
	DBRequest req;
	req.requestString = request;
	req.dbRequestType = dbRequestType;
	req.requestType = requestType;
	req.module = module;
	if (reference && referenceLength) {
		req.moduleReference = std::move(std::vector<byte>(reference, reference+referenceLength));
	}
	return DB_AddRequest(std::move(req));
}
qboolean DB_AddPreparedStatement(module_t module, byte* reference, int referenceLength, int requestType, const char* request) {
	if (!db_enabled->integer) return qfalse;
	DBRequest req;
	req.isPreparedStatement = qtrue;
	req.requestString = request;
	req.dbRequestType = DBREQUESTTYPE_REQUEST;
	req.requestType = requestType;
	req.module = module;
	if (reference && referenceLength) {
		req.moduleReference = std::move(std::vector<byte>(reference, reference+referenceLength));
	}
	return DB_AddPreparedStatement(std::move(req));
}

qboolean DB_GetString(module_t module, int place, char* out, int outSize) {
	if (!currentFinishedRequestValid[module]) {
		return qfalse;
	}
	if (currentFinishedRequest[module].currentResponseRow < 0) {
		return qfalse;
	}
	if (!currentFinishedRequest[module].results.size()) {
		return qfalse;
	}
	SQLDelayedValues* row = &currentFinishedRequest[module].results.front().responseData[currentFinishedRequest[module].currentResponseRow];
	SQLDelayedValue* val = row->getValue(place);
	if (val) {
		std::string value = val->getString();
		Q_strncpyz(out, value.c_str(), outSize);
		return (qboolean)(outSize > value.size());
	}
	return qtrue;
}
int DB_GetBinary(module_t module, int place, byte* out, int outSize) {
	if (!currentFinishedRequestValid[module]) {
		return qfalse;
	}
	if (currentFinishedRequest[module].currentResponseRow < 0) {
		return qfalse;
	}
	if (!currentFinishedRequest[module].results.size()) {
		return qfalse;
	}
	SQLDelayedValues* row = &currentFinishedRequest[module].results.front().responseData[currentFinishedRequest[module].currentResponseRow];
	SQLDelayedValue* val = row->getValue(place);
	if (val) {
		std::vector<byte> value = val->getBinary();
		Com_Memcpy(out, value.data(), MIN(value.size(),outSize));
		return value.size();
	}
	return qtrue;
}
float DB_GetFloat(module_t module, int place) {
	if (!currentFinishedRequestValid[module]) {
		return qfalse;
	}
	if (currentFinishedRequest[module].currentResponseRow < 0) {
		return qfalse;
	}
	if (!currentFinishedRequest[module].results.size()) {
		return qfalse;
	}
	SQLDelayedValues* row = &currentFinishedRequest[module].results.front().responseData[currentFinishedRequest[module].currentResponseRow];
	SQLDelayedValue* val = row->getValue(place);
	if (val) {
		return val->getFloat();
	}
	return 0;
}
int DB_GetInt(module_t module, int place) {
	if (!currentFinishedRequestValid[module]) {
		return qfalse;
	}
	if (currentFinishedRequest[module].currentResponseRow < 0) {
		return qfalse;
	}
	if (!currentFinishedRequest[module].results.size()) {
		return qfalse;
	}
	SQLDelayedValues* row = &currentFinishedRequest[module].results.front().responseData[currentFinishedRequest[module].currentResponseRow];
	SQLDelayedValue* val = row->getValue(place);
	if (val) {
		return val->getInt();
	}
	return 0;
}
qboolean DB_NextRow(module_t module) {
	if (!currentFinishedRequestValid[module]) {
		return qfalse;
	}
	if (!currentFinishedRequest[module].results.size()) {
		return qfalse;
	}
	if (currentFinishedRequest[module].results.front().responseData.size() <= currentFinishedRequest[module].currentResponseRow + 1) {
		return qfalse;
	}
	currentFinishedRequest[module].currentResponseRow++;
	return qtrue;
}
qboolean DB_NextResultSet(module_t module, int* affectedRows) {
	if (affectedRows) *affectedRows = 0;
	if (!currentFinishedRequestValid[module]) {
		return qfalse;
	}
	if (currentFinishedRequest[module].results.size() <= 1) {
		return qfalse;
	}
	currentFinishedRequest[module].results.pop();
	if (affectedRows) *affectedRows = currentFinishedRequest[module].results.front().affectedRowCount;
	currentFinishedRequest[module].currentResponseRow = -1;
	return qtrue;
}
qboolean DB_GetReference(module_t module, byte* reference, int referenceLength) {
	if (!currentFinishedRequestValid[module]) {
		return qfalse;
	}
	if (reference) {
		// give back the reference
		int copyCount = MIN(currentFinishedRequest[module].moduleReference.size(), referenceLength);
		if (copyCount > 0) {
			Com_Memcpy(reference, currentFinishedRequest[module].moduleReference.data(), copyCount);
		}
		if (currentFinishedRequest[module].moduleReference.size() > referenceLength) {
			return qfalse;
		}
		return qtrue;
	}
	return qfalse;
}
qboolean DB_NextResponse(module_t module, int* requestType, int* affectedRows, int* status, char* errorMessage, int errorMessageSize, byte* reference, int referenceLength) {
	{
		std::lock_guard<std::mutex>(dbSyncedData.syncLock);
		if (!dbSyncedData.requestsFinished[module].empty()) {
			currentFinishedRequest[module] = std::move(dbSyncedData.requestsFinished[module].front());
			dbSyncedData.requestsFinished[module].pop_front();

			if (requestType) *requestType = currentFinishedRequest[module].requestType;
			if (affectedRows) *affectedRows = currentFinishedRequest[module].results.size() ? currentFinishedRequest[module].results.front().affectedRowCount : -2;
			if (status) *status = currentFinishedRequest[module].errorCode;
			if (errorMessage) {
				// error might be too long but we'll just silently cut it off then.
				Q_strncpyz(errorMessage, currentFinishedRequest[module].errorMessage.c_str(), errorMessageSize);
			}
			if (reference) {
				// give back the reference
				int copyCount = MIN(currentFinishedRequest[module].moduleReference.size(), referenceLength);
				if (copyCount > 0) {
					Com_Memcpy(reference, currentFinishedRequest[module].moduleReference.data(), copyCount);
				}
			}

			currentFinishedRequestValid[module] = qtrue;
			return qtrue;
		}
		else {
			currentFinishedRequestValid[module] = qfalse;
			return qfalse;
		}
	}
	// No notification to background thread neccessary as there is no action it needs to take.
	return qfalse;
}

static void DB_SetOptions() {
	dbSyncedData.enabled = (qboolean)db_enabled->integer;
	dbSyncedData.url = db_url->string;
	dbSyncedData.username = db_username->string;
	dbSyncedData.password = db_password->string;
}

void DB_Init() {

	db_enabled = Cvar_Get("db_enabled", "0", CVAR_ARCHIVE);
	db_url = Cvar_Get("db_url", "jdbc:mariadb://example12345.com:5509/dbname", CVAR_ARCHIVE); // "jdbc:mariadb://localhost:3306/todo"
	db_username = Cvar_Get("db_username", "", CVAR_ARCHIVE);
	db_password = Cvar_Get("db_password", "", CVAR_ARCHIVE);

	if (!dbThread) {
		DB_SetOptions();
		dbThread = new std::thread(DB_BackgroundThread);
	}

	qtime_t	time;
	char	timestamp[20];
	Com_RealTime(&time);
	Com_sprintf(timestamp, sizeof(timestamp), "[%02d:%02d:%02d] ",
		time.tm_hour, time.tm_min, time.tm_sec);
	if (DB_EscapeString(timestamp, sizeof(timestamp))) {
		DBRequest req;
		req.requestString = va("INSERT INTO test (testtext) VALUES ('%s')", timestamp);
		DB_AddRequest(std::move(req));
	}
}

// Escape stuff lifted from MariaDB because I'd need a connection to escape otherwise.
static std::string& replace(std::string& str, const std::string& _substr, const std::string& subst)
{
	size_t pos = 0, prev = 0;
	std::string& real = str;
	const std::string& realSub = subst, & substr = _substr;

	while ((pos = real.find(substr, prev)) != std::string::npos)
	{
		real.replace(pos, substr.length(), realSub);
		//prev += realSub.length();
		prev = pos + realSub.length();
	}
	return str;
}
std::string escapeString(std::string& value, bool noBackslashEscapes = false)
{
	if (!(value.find_first_of('\'') != std::string::npos)) {
		if (noBackslashEscapes) {
			return value;
		}
		if (!(value.find_first_of('\\') != std::string::npos)) {
			return value;
		}
	}
	std::string escaped = replace(value, "'", "''");
	if (noBackslashEscapes) {
		return escaped;
	}
	return replace(escaped, "\\", "\\\\");
}

qboolean DB_EscapeString(char* input, int size) {
	std::string inputstring = input;
	std::string escapedString = escapeString(inputstring);
	const char* outString = escapedString.c_str();
	if (strlen(outString) < size - 1) {
		Q_strncpyz(input, outString, size);
		return qtrue;
	}
	else {
		input[0] = '\0'; // be safe. kill this string before someone uses it by accident.
		return qfalse;
	}
}

void DB_CheckCvars() {

	if (db_enabled->modified || db_url->modified || db_username->modified || db_password->modified) {
		{
			std::lock_guard<std::mutex>(dbSyncedData.syncLock);
			dbSyncedData.connectionDetailsChanged = (qboolean)(dbSyncedData.connectionDetailsChanged || db_url->modified || db_username->modified || db_password->modified);
			DB_SetOptions();
		}
		dbSyncedData.changeNotifier.notify_one();
		db_enabled->modified = qfalse;
		db_url->modified = qfalse;
		db_username->modified = qfalse;
		db_password->modified = qfalse;
	}

}

void DB_Shutdown() {
	{
		std::lock_guard<std::mutex>(dbSyncedData.syncLock);
		dbSyncedData.terminate = qtrue;
	}
	dbSyncedData.changeNotifier.notify_one();
	dbThread->join();
	delete dbThread;
}

