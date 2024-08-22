

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

	sql::Driver* driver = sql::mariadb::get_driver_instance();
	sql::Connection* conn = NULL;
	while (1) {
		DBRequest requestToProcess;
		qboolean connectionChanged = qfalse;
		{
			std::unique_lock<std::mutex> l(dbSyncedData.syncLock);
			while ((!dbSyncedData.enabled || dbSyncedData.requestsIncoming.empty()) && !dbSyncedData.terminate ) {
				dbSyncedData.changeNotifier.wait(l);
			}
			if (dbSyncedData.terminate && (dbSyncedData.requestsIncoming.empty() || !dbSyncedData.enabled)) {
				if (conn != NULL) {
					conn->close();
					delete conn;
					conn = NULL;
				}
				break;
			}
			if (!dbSyncedData.enabled) continue;
			requestToProcess = std::move(dbSyncedData.requestsIncoming.front());
			dbSyncedData.requestsIncoming.pop_front();
			connectionChanged = dbSyncedData.connectionDetailsChanged;
			dbSyncedData.connectionDetailsChanged = qfalse;
		}

		// update connection if needed
		int connectTries = 0;
		while (!conn || connectionChanged || !conn->isValid()) {
			if (connectTries) {
				// dont do a hyper-fast endless loop when we obviously cannot connect
				using namespace std::chrono_literals;
				std::this_thread::sleep_for(1000ms);
			}
			if (conn && !conn->isValid()) {
				try {
					conn->reconnect();
				}
				catch (...) {
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
				}
				connectionChanged = qfalse;
				try {

					// Configure Connection
					sql::SQLString url(url);
					sql::Properties properties({ {"user", username}, {"password", password} });

					// Establish Connection
					conn = driver->connect(url, properties);
				}
				catch (...) {

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

	}


	/**/
}

void DB_Init() {

	db_enabled = Cvar_Get("db_enabled", "0", CVAR_ARCHIVE);
	db_url = Cvar_Get("db_url", "", CVAR_ARCHIVE); // "jdbc:mariadb://localhost:3306/todo"
	db_username = Cvar_Get("db_username", "", CVAR_ARCHIVE);
	db_password = Cvar_Get("db_password", "", CVAR_ARCHIVE);

	dbThread = new std::thread(DB_BackgroundThread);
}

void DB_CheckCvars() {

	if (db_enabled->modified || db_url->modified || db_username->modified || db_password->modified) {
		{
			std::lock_guard<std::mutex>(dbSyncedData.syncLock);
			dbSyncedData.connectionDetailsChanged = (qboolean)(dbSyncedData.connectionDetailsChanged || db_url->modified || db_username->modified || db_password->modified);
			dbSyncedData.enabled = (qboolean)db_enabled->integer;
			dbSyncedData.url = db_url->string;
			dbSyncedData.username = db_username->string;
			dbSyncedData.password = db_password->string;
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

