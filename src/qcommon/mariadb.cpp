

#include "qcommon.h"
#include <thread>

cvar_t* db_enabled;
static cvar_t* db_url;
static cvar_t* db_username;
static cvar_t* db_password;

static std::thread* dbThread;


static void DB_BackgroundThread() {


	sql::Driver* driver = sql::mariadb::get_driver_instance();

	// Configure Connection
	sql::SQLString url(db_url->string);
	sql::Properties properties({ {"user", db_username->string}, {"password", db_password->string} });

	// Establish Connection
	std::unique_ptr<sql::Connection> conn(driver->connect(url, properties));
}

void DB_Init() {

	db_enabled = Cvar_Get("db_enabled", "0", CVAR_ARCHIVE);
	db_url = Cvar_Get("db_url", "", CVAR_ARCHIVE); // "jdbc:mariadb://localhost:3306/todo"
	db_username = Cvar_Get("db_username", "", CVAR_ARCHIVE);
	db_password = Cvar_Get("db_password", "", CVAR_ARCHIVE);

	//dbThread = new std::thread(DB_BackgroundThread);
}

