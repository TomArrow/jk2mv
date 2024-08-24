

#include "qcommon.h"
#include "mariadb.h"
#include <thread>
#include <mutex>
#include <deque>
#include <condition_variable>

cvar_t* db_enabled;
static cvar_t* db_url;
static cvar_t* db_username;
static cvar_t* db_password;

static std::thread* dbThread;

static DBRequest currentFinishedRequest[MODULE_MAX];
static qboolean currentFinishedRequestValid[MODULE_MAX]{ 0 };

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

		// update connection if needed
		int connectTries = 0;
		qboolean connectionEnabled = qtrue;
		while (!conn || connectionChanged || !conn->isValid()) {
			if (connectTries) {
				if (!connectionEnabled) {
					break;
				}
				// dont do a hyper-fast endless loop when we obviously cannot connect
				using namespace std::chrono_literals;
				std::this_thread::sleep_for(1000ms);
			}
			if (conn && !conn->isValid()) {
				try {
					conn->reconnect();
					Com_Printf("MariaDB connection reconnected.\n");
				}
				catch (...) {
					Com_Printf("MariaDB reconnect failed.\n");
					conn->close();
					delete conn;
					conn = NULL;
				}
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
				}
				connectionChanged = qfalse;
				try {

					// Configure Connection
					sql::SQLString url(url);
					sql::Properties properties({ {"user", username}, {"password", password} });

					// Establish Connection
					conn = driver->connect(url, properties);
					Com_Printf("MariaDB connection established.\n");
				}
				catch (...) {

					Com_Printf("MariaDB connection failed.\n");
					if (conn != NULL) {
						conn->close();
						delete conn;
						conn = NULL;
					}
				}
			}
			connectTries++;

		}

		// process request
		if (connectionEnabled) {
			try {
				// Create a new Statement
				std::unique_ptr<sql::Statement> stmnt(conn->createStatement());
				// Execute query
				if (stmnt->execute(requestToProcess.requestString)) {
					std::unique_ptr<sql::ResultSet> res(stmnt->getResultSet());
					while (res->next()) {
						requestToProcess.responseData.push_back(SQLDelayedResponse(res.get()));
					}
				}
				else {
					requestToProcess.affectedRowCount = stmnt->getUpdateCount();
				}
				requestPending = qfalse;
			}
			catch (sql::SQLException& e) {
				if (!requestToProcess.errorCode) {
					// error code 0: not an error.
					requestToProcess.errorMessage = e.what();
					requestPending = qfalse;
				}
				else {
					const int max_tries = 10;
					Com_Printf("MariaDB error executing query (try %d/%d): %s \n", requestToProcess.tries + 1, max_tries, e.what());
					if (requestToProcess.tries < max_tries) {

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
		if (!requestPending) {
			std::lock_guard<std::mutex> lock(dbSyncedData.syncLock);
			dbSyncedData.requestsFinished[requestToProcess.module].push_back(std::move(requestToProcess));
		}
	}


	/**/
}

qboolean DB_AddRequest(DBRequest& req) {
	//if (!db_enabled->integer) return qfalse;
	{
		std::lock_guard<std::mutex>(dbSyncedData.syncLock);
		dbSyncedData.requestsIncoming.push_back(std::move(req));
	}
	dbSyncedData.changeNotifier.notify_one();
	return qtrue;
}
qboolean DB_GetRequestReference(module_t module, byte* reference, int referenceLength) {
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
qboolean DB_NextFinishedRequest(module_t module, int* requestType, int* affectedRows, int* status, char* errorMessage, int errorMessageSize) {
	{
		std::lock_guard<std::mutex>(dbSyncedData.syncLock);
		if (!dbSyncedData.requestsFinished[module].empty()) {
			currentFinishedRequest[module] = std::move(dbSyncedData.requestsFinished[module].front());
			dbSyncedData.requestsFinished[module].pop_front();

			if (requestType) *requestType = currentFinishedRequest[module].requestType;
			if (affectedRows) *affectedRows = currentFinishedRequest[module].affectedRowCount;
			if (status) *status = currentFinishedRequest[module].errorCode;
			if (errorMessage) {
				// error might be too long but we'll just silently cut it off then.
				Q_strncpyz(errorMessage, currentFinishedRequest[module].errorMessage.c_str(), errorMessageSize);
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
		DB_AddRequest(req);
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
		prev += realSub.length();
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

