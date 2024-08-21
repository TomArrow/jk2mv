
#include "qcommon.h"

cvar_t* db_enabled;
cvar_t* db_url;
cvar_t* db_username;
cvar_t* db_password;

void DB_Init() {

	db_enabled = Cvar_Get("db_enabled", "0", CVAR_ARCHIVE);
	db_url = Cvar_Get("db_url", "", CVAR_ARCHIVE); // "jdbc:mariadb://localhost:3306/todo"
	db_username = Cvar_Get("db_username", "", CVAR_ARCHIVE);
	db_password = Cvar_Get("db_password", "", CVAR_ARCHIVE);

	sql::Driver* driver = sql::mariadb::get_driver_instance();

	// Configure Connection
	sql::SQLString url(db_url->string);
	sql::Properties properties({ {"user", db_username->string}, {"password", db_password->string} });

	// Establish Connection
	std::unique_ptr<sql::Connection> conn(driver->connect(url, properties));

}
