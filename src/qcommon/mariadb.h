
#ifndef MARIADBHEADER
#define MARIADBHEADER
#include "conncpp.hpp"
#include "qcommon.h"

extern cvar_t* db_enabled;

void DB_Init();
void DB_CheckCvars();
void DB_Shutdown(); 
qboolean DB_EscapeString(char* input, int size);




enum SQLDelayedValueType {
	SQLVALUE_TYPE_NULL,
	SQLVALUE_TYPE_INTEGER,
	SQLVALUE_TYPE_REAL,
	SQLVALUE_TYPE_TEXT,
};

typedef enum SQLDelayedValue_NULL_t {
	SQLDelayedValue_NULL
};

// One could argue this is a little problematic because sometimes we may provide an integer to a double field and here 
// that wont result in a C++ side implicit conversion but SQLite will automatically do such conversions anyway so I guess who cares
// Does this even make sense? Would C++ even allow this? I'm not sure, I'm tired.
class SQLDelayedValue {

	SQLDelayedValueType type = SQLVALUE_TYPE_NULL;
	union {
		std::string* stringValue = NULL;
		int64_t intValue;
		double doubleValue;
	};
	std::string* columnNameValue = NULL;
public:

	auto operator=(SQLDelayedValue&& movedFrom) {
		type = std::move(movedFrom.type);
		switch (movedFrom.type) {
		case SQLVALUE_TYPE_INTEGER:
			intValue = movedFrom.intValue;
			break;
		case SQLVALUE_TYPE_REAL:
			doubleValue = movedFrom.doubleValue;
			break;
		case SQLVALUE_TYPE_TEXT:
			stringValue = new std::string(std::move(*movedFrom.stringValue));
			movedFrom.stringValue = NULL;
			break;
		}
		columnNameValue = new std::string(std::move(*movedFrom.columnNameValue));
		movedFrom.columnNameValue = NULL;
	}
	SQLDelayedValue(SQLDelayedValue&& movedFrom)
	{
		*this = std::move(movedFrom);
	}


	template<class T>
	SQLDelayedValue(char* columnName, T valueA) {
		if constexpr (std::is_floating_point<T>()) {
			doubleValue = valueA;
			type = SQLVALUE_TYPE_REAL;
		}
		else if constexpr (std::is_same<T, SQLDelayedValue_NULL_t>()) {
			if (valueA) {
				throw std::invalid_argument("null constructor must be called with value SQLDelayedValue_NULL (0)");
			}
			type = SQLVALUE_TYPE_NULL;
		}
		else if constexpr (std::is_integral<T>() || std::is_enum<T>() || std::is_same<T, bool>()) {
			intValue = valueA;
			type = SQLVALUE_TYPE_INTEGER;
		}
		else if constexpr (std::is_same<T, char*>() || std::is_same<T, const char*>()) {
			stringValue = valueA ? new std::string(valueA) : NULL;
			type = SQLVALUE_TYPE_TEXT;
		}
		else if constexpr (std::is_same<T, std::string>()) {
			stringValue = new std::string(valueA);
			type = SQLVALUE_TYPE_TEXT;
		}
		else if constexpr (std::is_same<T, std::string*>()) {
			stringValue = new std::string(*valueA);
			type = SQLVALUE_TYPE_TEXT;
		}
		else {
			throw std::invalid_argument("Invalid SQLDelayedValue constructor type");
		}
		columnNameValue = new std::string(columnName);
	}


	/*inline int bind(sqlite3_stmt* statement) {
		int index = sqlite3_bind_parameter_index(statement, columnNameValue->c_str());
		if (index == 0) {
			return 0; // Sometimes we have same set of binds for multiple statements but with different values being used or not being used. So if index not found, just discard. It doesn't seem like sqlite throws an error even if we use 0 as an index but whatever, safe is safe.
		}
		switch (type) {
		case SQLVALUE_TYPE_NULL:
			return SQLBIND_INDEX_NULL(statement, index);
			break;
		case SQLVALUE_TYPE_INTEGER:
			return SQLBIND_INDEX(statement, int64, index, intValue);
			break;
		case SQLVALUE_TYPE_REAL:
			return SQLBIND_INDEX(statement, double, index, doubleValue);
			break;
		case SQLVALUE_TYPE_TEXT:
			return SQLBIND_INDEX_TEXT(statement, index, stringValue ? stringValue->c_str() : NULL);
			break;
		default:
			throw std::invalid_argument("tried to bind SQLDelayedValue with invalid type");
			break;
		}
	}*/

	~SQLDelayedValue() {
		if (type == SQLVALUE_TYPE_TEXT && stringValue) {
			delete stringValue;
		}
		if (columnNameValue) {
			delete columnNameValue;
		}
	}
};

class SQLDelayedResponse {
	qboolean invalidated = qfalse;
	std::vector<SQLDelayedValue*> values;
	// The added SQLDelayedValue object will be automatically deleted when this object is destroyed.
	//void add(SQLDelayedValue* value) {
	//	values.push_back(value);
	//}
public:
	template<class T>
	void inline add(char* name, T value) {
		values.push_back(new SQLDelayedValue(name, value));
	}
	SQLDelayedResponse() {

	}
	SQLDelayedResponse(sql::ResultSet* sourceRow) {

	}
	auto operator=(SQLDelayedResponse&& other) {
		values = std::move(other.values);
		other.invalidated = qtrue;
	}
	SQLDelayedResponse(SQLDelayedResponse&& movedOne) {
		*this = std::move(movedOne);
	}
	/*inline void bind(sqlite3_stmt* statement) {
		int count = values.size();
		for (int i = 0; i < count; i++) {
			values[i]->bind(statement);
		}
	}*/
	~SQLDelayedResponse() {
		if (!invalidated) {
			int count = values.size();
			for (int i = 0; i < count; i++) {
				delete values[i];
			}
		}
	}
};






class DBRequest {
public:
	int tries = 0;
	qboolean successful = qtrue;
	int errorCode;
	std::string errorMessage;

	module_t module;					// the requesting module
	std::string requestString;			// sql instruction
	int requestType = -1;				// so the module can have a different type of reference data struct for each request type
	std::vector<byte> moduleReference;	// any sequence of bytes (probably a module struct) that the module gave us to remember what this request is
	SQLDelayedResponse responseData;
};



#endif
