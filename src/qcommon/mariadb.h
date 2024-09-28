
#ifndef MARIADBHEADER
#define MARIADBHEADER
#include "conncpp.hpp"
#include "qcommon.h"

extern cvar_t* db_enabled;

void		DB_Init();
void		DB_CheckCvars();
void		DB_Shutdown(); 
qboolean	DB_EscapeString(char* input, int size);
qboolean	DB_AddRequest(module_t module, byte* reference, int referenceLength, int requestType, const char* request, DBRequestType_t dbRequestType);
qboolean	DB_NextResponse(module_t module, int* requestType, int* affectedRows, int* status, char* errorMessage, int errorMessageSize, byte* reference, int referenceLength);
qboolean	DB_GetReference(module_t module, byte* reference, int referenceLength);
qboolean	DB_NextRow(module_t module);
int			DB_GetInt(module_t module, int place);
float		DB_GetFloat(module_t module, int place);
qboolean	DB_GetString(module_t module, int place, char* out, int outSize);

qboolean	DB_AddPreparedStatement(module_t module, byte* reference, int referenceLength, int requestType, const char* request);
qboolean	DB_PreparedBindString(module_t module, const char* string);
qboolean	DB_PreparedBindFloat(module_t module, float number);
qboolean	DB_PreparedBindInt(module_t module, int number);
qboolean	DB_PreparedBindBinary(module_t module, byte* data, int length);
qboolean	DB_FinishAndSendPreparedStatement(module_t module); 
int			DB_GetBinary(module_t module, int place, byte* out, int outSize);
qboolean	DB_PreparedBindNull(module_t module);

enum SQLDelayedValueType {
	SQLVALUE_TYPE_NULL,
	SQLVALUE_TYPE_INTEGER,
	SQLVALUE_TYPE_REAL,
	SQLVALUE_TYPE_TEXT,
	SQLVALUE_TYPE_BINARY,
};

typedef enum SQLDelayedValue_NULL_s {
	SQLDelayedValue_NULL
}SQLDelayedValue_NULL_t;

// One could argue this is a little problematic because sometimes we may provide an integer to a double field and here 
// that wont result in a C++ side implicit conversion but SQLite will automatically do such conversions anyway so I guess who cares
// Does this even make sense? Would C++ even allow this? I'm not sure, I'm tired.
class SQLDelayedValue {

	SQLDelayedValueType type = SQLVALUE_TYPE_NULL;
	union {
		std::string* stringValue = NULL;
		std::vector<byte>* binaryData;
		int64_t intValue;
		double doubleValue;
	};
	std::string* columnNameValue = NULL;
public:

	int getInt() {
		switch (type) {
		case SQLVALUE_TYPE_NULL:
			return 0;
			break;
		case SQLVALUE_TYPE_INTEGER:
			return (int)intValue;
			break;
		case SQLVALUE_TYPE_REAL:
			return (int)doubleValue;
			break;
		case SQLVALUE_TYPE_TEXT:
			return stringValue ? atoi(stringValue->c_str()) : 0;
			break;
		default:
			throw std::invalid_argument("cannot get as int");
			break;
		}
	}
	float getFloat() {
		switch (type) {
		case SQLVALUE_TYPE_NULL:
			return 0.0f;
			break;
		case SQLVALUE_TYPE_INTEGER:
			return (float)intValue;
			break;
		case SQLVALUE_TYPE_REAL:
			return (float)doubleValue;
			break;
		case SQLVALUE_TYPE_TEXT:
			return stringValue ? atof(stringValue->c_str()) : 0;
			break;
		default:
			throw std::invalid_argument("cannot get as float");
			break;
		}
	}
	const std::string getString() {
		switch (type) {
		case SQLVALUE_TYPE_NULL:
			return "NULL";
			break;
		case SQLVALUE_TYPE_INTEGER:
			return va("%d",intValue);
			break;
		case SQLVALUE_TYPE_REAL:
			return va("%f", (float)doubleValue);
			break;
		case SQLVALUE_TYPE_TEXT:
			return stringValue ? *stringValue : "";
			break;
		default:
			throw std::invalid_argument("cannot get as string");
			break;
		}
	}
	const std::vector<byte> getBinary() {
		switch (type) {
		case SQLVALUE_TYPE_BINARY:
			return binaryData ? *binaryData : std::vector<byte>();
			break;
		default:
			throw std::invalid_argument("cannot get as binary");
			break;
		}
	}

	template<class T>
	SQLDelayedValue(const char* columnName, T valueA) {
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
		else if constexpr (std::is_same<T, sql::Blob*>()) {
			type = SQLVALUE_TYPE_BINARY;
			sql::Blob* blob = (sql::Blob*)valueA;
			if (!blob) {
				binaryData = NULL;
			}
			else {
				blob->seekg(0, std::ios::end);
				size_t size = blob->tellg();
				blob->seekg(0, std::ios::beg);
				binaryData = new std::vector<byte>();
				binaryData->reserve(size);
				blob->read((char*)binaryData->data(), size);
				binaryData->resize(blob->tellg());
			}
		}
		else {
			throw std::invalid_argument("Invalid SQLDelayedValue constructor type");
		}
		columnNameValue = new std::string(columnName);
	}

	// special constructor for binary data since we can't guess the length
	SQLDelayedValue(const char* columnName, void* data, int length) {
		binaryData = data ? new std::vector<byte>((byte*)data, (byte*)data + length) : NULL; // is + length correct? TODO
		type = SQLVALUE_TYPE_BINARY;
	}


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
			stringValue = movedFrom.stringValue ? new std::string(std::move(*movedFrom.stringValue)) : NULL; // uh why not just keep the same pointer tho?
			movedFrom.stringValue = NULL;
			break;
		case SQLVALUE_TYPE_BINARY:
			binaryData = movedFrom.binaryData ? new std::vector<byte>(std::move(*movedFrom.binaryData)) : NULL;// uh why not just keep the same pointer tho?
			movedFrom.binaryData = NULL;
			break;
		}
		columnNameValue = new std::string(std::move(*movedFrom.columnNameValue));
		movedFrom.columnNameValue = NULL;
	}
	SQLDelayedValue(SQLDelayedValue&& movedFrom)
	{
		*this = std::move(movedFrom);
	}

	inline void bind(sql::PreparedStatement* statement, int index) {
		if (index == 0) {
			return; // Sometimes we have same set of binds for multiple statements but with different values being used or not being used. So if index not found, just discard. It doesn't seem like sqlite throws an error even if we use 0 as an index but whatever, safe is safe. (this was a comment for sqlite version, not sure if it applies, too lazy to read and understand it again)
		}
		switch (type) {
		case SQLVALUE_TYPE_NULL:
			statement->setNull(index, sql::Types::SQLNULL);
			break;
		case SQLVALUE_TYPE_INTEGER:
			statement->setInt64(index,intValue);
			break;
		case SQLVALUE_TYPE_REAL:
			statement->setDouble(index,doubleValue);
			break;
		case SQLVALUE_TYPE_TEXT:
			if (stringValue) {
				statement->setString(index, *stringValue); // TODO correcT?
			}
			else {
				statement->setString(index, NULL); // TODO correcT?
			}
			break;
		case SQLVALUE_TYPE_BINARY:
			if (binaryData) {
				sql::bytes* theData = new sql::bytes(binaryData->size());
				memcpy(theData->arr, binaryData->data(), binaryData->size());
				statement->setBytes(index, theData); // TODO correcT?
				delete theData; // TODO is this safe?! i think its copying the stuff internally but im not certain
			}
			else {
				statement->setNull(index, sql::Types::SQLNULL);
			}
			break;
		default:
			throw std::invalid_argument("tried to bind SQLDelayedValue with invalid type");
			break;
		}
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
		if (type == SQLVALUE_TYPE_BINARY && binaryData) {
			delete binaryData;
		}
		if (columnNameValue) {
			delete columnNameValue;
		}
	}
};

class SQLDelayedValues {
	qboolean invalidated = qfalse;
	std::vector<SQLDelayedValue*> values;
	// The added SQLDelayedValue object will be automatically deleted when this object is destroyed.
	//void add(SQLDelayedValue* value) {
	//	values.push_back(value);
	//}
public:
	template<class T>
	void inline add(const char* name, T value) {
		values.push_back(new SQLDelayedValue(name, value));
	}
	void inline add(const char* name, byte* data, int length) {
		values.push_back(new SQLDelayedValue(name, data, length));
	}
	int size() {
		return values.size();
	}
	SQLDelayedValue* getValue(int place) {
		if (place >= values.size()) return NULL;
		return values[place];
	}
	SQLDelayedValues() {

	}
	SQLDelayedValues(sql::ResultSet* sourceRow) {
		std::unique_ptr<sql::ResultSetMetaData> meta(sourceRow->getMetaData());
		int columnCount = meta->getColumnCount();
		for (int i = 1; i <= columnCount; i++) {
			sql::Types columnType = (sql::Types)meta->getColumnType(i);

			switch (columnType) {
			case sql::Types::BIGINT:
			case sql::Types::BOOLEAN:
			case sql::Types::SMALLINT:
			case sql::Types::TINYINT:
			case sql::Types::INTEGER:
			case sql::Types::ROWID:
				add(meta->getColumnName(i).c_str(), sourceRow->getInt64(i));
				break;

			case sql::Types::DECIMAL:
			case sql::Types::NUMERIC:
			case sql::Types::DOUBLE:
			case sql::Types::FLOAT:
			case sql::Types::REAL:
				add(meta->getColumnName(i).c_str(), sourceRow->getDouble(i));
				break;

			case sql::Types::CHAR:
			case sql::Types::LONGNVARCHAR:
			case sql::Types::LONGVARCHAR:
			case sql::Types::NCHAR:
			case sql::Types::NVARCHAR:
			case sql::Types::VARCHAR:
			case sql::Types::CLOB:
			case sql::Types::NCLOB:
				add(meta->getColumnName(i).c_str(), sourceRow->getString(i).c_str());
				break;

			case sql::Types::_NULL:
				add(meta->getColumnName(i).c_str(), SQLDelayedValue_NULL);
				break;

			case sql::Types::DATE:
			case sql::Types::TIME:
			case sql::Types::TIME_WITH_TIMEZONE:
			case sql::Types::TIMESTAMP:
			case sql::Types::TIMESTAMP_WITH_TIMEZONE:
				add(meta->getColumnName(i).c_str(), sourceRow->getString(i).c_str());// keep as string for now. maybe do something nicer later.
				break;

			case sql::Types::BINARY:
			case sql::Types::VARBINARY:
			case sql::Types::BLOB:
			case sql::Types::LONGVARBINARY:
			{
				// TODO actually test this... no idea if it works.
				sql::Blob* blob = sourceRow->getBlob(i);
				add(meta->getColumnName(i).c_str(), blob); 
				delete blob; // is this right?
				break;
			}
			case sql::Types::ARRAY:
			case sql::Types::BIT:
			case sql::Types::DATALINK:
			case sql::Types::DISTINCT:
			case sql::Types::JAVA_OBJECT:
			case sql::Types::OTHER:
			case sql::Types::REF:
			case sql::Types::REF_CURSOR:
			case sql::Types::_SQLXML:
			case sql::Types::STRUCT:
				add(meta->getColumnName(i).c_str(), SQLDelayedValue_NULL); // not supported rn
				break;
			}
		}
	}
	auto operator=(SQLDelayedValues&& other) {
		values = std::move(other.values);
		other.invalidated = qtrue;
	}
	SQLDelayedValues(SQLDelayedValues&& movedOne) {
		*this = std::move(movedOne);
	}
	/*inline void bind(sqlite3_stmt* statement) {
		int count = values.size();
		for (int i = 0; i < count; i++) {
			values[i]->bind(statement);
		}
	}*/
	~SQLDelayedValues() {
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
	int errorCode =0;
	std::string errorMessage = "";
	int affectedRowCount = 0;
	DBRequestType_t dbRequestType = DBREQUESTTYPE_REQUEST; // could be something else that we wanna do on a different thread
	qboolean isPreparedStatement;
	SQLDelayedValues preparedValues;

	module_t module = MODULE_MAIN;		// the requesting module
	std::string requestString;			// sql instruction
	int requestType = -1;				// so the module can have a different type of reference data struct for each request type
	std::vector<byte> moduleReference;	// any sequence of bytes (probably a module struct) that the module gave us to remember what this request is
	std::vector<SQLDelayedValues> responseData;
	int currentResponseRow = -1;
};



#endif
