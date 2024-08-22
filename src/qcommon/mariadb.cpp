

#include "qcommon.h"
#include <thread>
#include <mutex>
#include <deque>

cvar_t* db_enabled;
static cvar_t* db_url;
static cvar_t* db_username;
static cvar_t* db_password;

static std::thread* dbThread;

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
			requestPending = qfalse;
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

static void DB_SetOptions() {
	dbSyncedData.enabled = (qboolean)db_enabled->integer;
	dbSyncedData.url = db_url->string;
	dbSyncedData.username = db_username->string;
	dbSyncedData.password = db_password->string;
}

void DB_Init() {

	db_enabled = Cvar_Get("db_enabled", "0", CVAR_ARCHIVE);
	db_url = Cvar_Get("db_url", "", CVAR_ARCHIVE); // "jdbc:mariadb://localhost:3306/todo"
	db_username = Cvar_Get("db_username", "", CVAR_ARCHIVE);
	db_password = Cvar_Get("db_password", "", CVAR_ARCHIVE);

	if (!dbThread) {
		DB_SetOptions();
		dbThread = new std::thread(DB_BackgroundThread);
	}

	DBRequest req;
	DB_AddRequest(req);
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

