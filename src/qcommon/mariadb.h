
#ifndef MARIADBHEADER
#define MARIADBHEADER
#include "conncpp.hpp"
#include "qcommon.h"

extern cvar_t* db_enabled;

void DB_Init();
void DB_CheckCvars();
void DB_Shutdown();

class DBRequest {
public:
	module_t module;					// the requesting module
	std::string requestString;			// sql instruction
	int requestType;					// so the module can have a different type of reference data struct for each request type
	std::vector<byte> moduleReference;	// any sequence of bytes (probably a module struct) that the module gave us to remember what this request is
};

#endif
