export DB_VerifyClient
code
proc DB_VerifyClient 12 12
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_dbcmds.c"
line 24
;1:
;2:#include "g_local.h"
;3:#include "g_dbcmds.h"
;4:#include "../qcommon/crypt_blowfish.h"
;5:
;6:
;7:typedef int ip_t[4];
;8:
;9://static int IPToInt() {
;10://
;11://}
;12:
;13:
;14:static void G_CreateUserTable();
;15:static void G_CreateRunsTable();
;16:static void G_CreateCheckpointsTable();
;17:static void G_CreateSubContestsTable();
;18:static void G_CreateMapRaceDefaultsTable();
;19:static void G_CreateMetaTable();
;20:static void G_CreateMapRatingsTable();
;21:const char* DF_GetMainSubcourseName();
;22:extern void DF_SetSubContestDefaults(gclient_t* client);
;23:
;24:gentity_t* DB_VerifyClient(int clientNum, ip_t ip) {
line 27
;25:	gentity_t* ent;
;26:
;27:	if (clientNum < 0 || clientNum >= MAX_CLIENTS) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $125
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $123
LABELV $125
line 28
;28:		Com_Printf("DB_VerifyClient: client number %d invalid.\n", clientNum);
ADDRGP4 $126
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 29
;29:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $122
JUMPV
LABELV $123
line 32
;30:	}
;31:	
;32:	ent = g_entities + clientNum;
ADDRLP4 0
CNSTI4 2352
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 34
;33:
;34:	if (!ent->client) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $127
line 35
;35:		Com_Printf("DB_VerifyClient: client no longer valid.\n");
ADDRGP4 $129
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 36
;36:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $122
JUMPV
LABELV $127
line 39
;37:	}
;38:
;39:	if (memcmp(ip, mv_clientSessions[clientNum].clientIP, sizeof(ip))) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 20
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 mv_clientSessions
ADDP4
ARGP4
CNSTU4 4
ARGU4
ADDRLP4 8
ADDRGP4 memcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $130
line 40
;40:		Com_Printf("DB_VerifyClient: no longer the same client.\n");
ADDRGP4 $132
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 41
;41:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $122
JUMPV
LABELV $130
line 43
;42:	}
;43:	return ent;
ADDRLP4 0
INDIRP4
RETP4
LABELV $122
endproc DB_VerifyClient 12 12
export G_DB_VerifyUsername
proc G_DB_VerifyUsername 60 12
line 102
;44:}
;45:/* moved to bg_misc.c
;46:qboolean G_DB_VerifyPassword(const char* password, int clientNumNotify) {
;47:	const char* s = password;
;48:	int len = strlen(password);
;49:	if (len > PASSWORD_MAX_LEN) {
;50:		if (clientNumNotify > -2) {
;51:			trap_SendServerCommand(clientNumNotify,va("print \"^1Chosen password is too long. Maximum %d characters.\n\"", PASSWORD_MAX_LEN));
;52:		}
;53:		return qfalse;
;54:	}
;55:	
;56:	while (*s != '\0') {
;57:		if (*s >= 'a' && *s <= 'z'
;58:			|| *s >= 'A' && *s <= 'Z'
;59:			|| *s >= '0' && *s <= '9'
;60:			|| *s == '_'
;61:			|| *s == '-'
;62:			|| *s == '.'
;63:			|| *s == '/' // pws allow aa bit more leeway than usernames, as they will never be used plaintext, and more possible chars means more security
;64:			|| *s == '[' // cant allow % because netcode wont send it properly, nor ascii codes above 127
;65:			|| *s == ']' // cant allow " because it would break the command
;66:			|| *s == '(' // cant allow ^ because it would be annoying to type colored passwords
;67:			|| *s == ')' // cant allow ` or ~ because console may not allow to type them
;68:			|| *s == '<' // someone COULD of course try it with a .cfg file but let's keep things such that they can be typed ingame
;69:			|| *s == '>'
;70:			|| *s == '='
;71:			|| *s == ':'
;72:			|| *s == ';'
;73:			|| *s == '+'
;74:			|| *s == '*'
;75:			|| *s == '!'
;76:			|| *s == '#'
;77:			|| *s == '$'
;78:			|| *s == '&'
;79:			|| *s == '@'
;80:			|| *s == ','
;81:			|| *s == '?'
;82:			|| *s == '|'
;83:			|| *s == '\''
;84:			) {
;85:			// whitelist. ok.
;86:		}
;87:		else {
;88:			if (clientNumNotify > -2) {
;89:				trap_SendServerCommand(clientNumNotify, "print \"^1Chosen password contains invalid characters. Allowed characters: A-Z a-z 0-9 _-.,/[]()<>=:;+*!#$&@'?| and no empty spaces.\n\"");
;90:			}
;91:			return qfalse;
;92:		}
;93:		s++;
;94:	}
;95:	return qtrue;
;96:}
;97:*/
;98:
;99:// we will be creating folders based on usernames so we have to make sure we dont allow any usernames
;100:// that could cause filesystem issues.
;101:// ideally the names also dont cause any issues when printed/sent as commands
;102:qboolean G_DB_VerifyUsername(const char* username, int clientNumNotify) {
line 103
;103:	const char* s = username;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 104
;104:	int len = strlen(username);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 4
ADDRLP4 8
INDIRU4
CVUI4 4
ASGNI4
line 105
;105:	if (len < USERNAME_MIN_LEN) {
ADDRLP4 4
INDIRI4
CNSTI4 3
GEI4 $134
line 106
;106:		if (clientNumNotify > -2) {
ADDRFP4 4
INDIRI4
CNSTI4 -2
LEI4 $136
line 107
;107:			trap_SendServerCommand(clientNumNotify,va("print \"^1Chosen username is too short. Minimum %d characters.\n\"", USERNAME_MIN_LEN));
ADDRGP4 $138
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 108
;108:		}
LABELV $136
line 109
;109:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $134
line 111
;110:	}
;111:	if (len > USERNAME_MAX_LEN) {
ADDRLP4 4
INDIRI4
CNSTI4 10
LEI4 $139
line 112
;112:		if (clientNumNotify > -2) {
ADDRFP4 4
INDIRI4
CNSTI4 -2
LEI4 $141
line 113
;113:			trap_SendServerCommand(clientNumNotify,va("print \"^1Chosen username is too long. Maximum %d characters.\n\"", USERNAME_MAX_LEN));
ADDRGP4 $143
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 114
;114:		}
LABELV $141
line 115
;115:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $139
line 118
;116:	}
;117:
;118:	if (*s == '-' || *s == '.') {
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 45
EQI4 $146
ADDRLP4 12
INDIRI4
CNSTI4 46
NEI4 $151
LABELV $146
line 119
;119:		if (clientNumNotify > -2) {
ADDRFP4 4
INDIRI4
CNSTI4 -2
LEI4 $147
line 120
;120:			trap_SendServerCommand(clientNumNotify, va("print \"^1Usernames cannot start with - or a dot.\n\"", USERNAME_MAX_LEN));
ADDRGP4 $149
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 121
;121:		}
LABELV $147
line 122
;122:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $150
line 125
;123:	}
;124:	
;125:	while (*s != '\0') {
line 126
;126:		if (*s >= 'a' && *s <= 'z'
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 97
LTI4 $156
ADDRLP4 16
INDIRI4
CNSTI4 122
LEI4 $169
LABELV $156
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 65
LTI4 $158
ADDRLP4 20
INDIRI4
CNSTI4 90
LEI4 $169
LABELV $158
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 48
LTI4 $160
ADDRLP4 24
INDIRI4
CNSTI4 57
LEI4 $169
LABELV $160
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 95
EQI4 $169
ADDRLP4 28
INDIRI4
CNSTI4 45
EQI4 $169
ADDRLP4 28
INDIRI4
CNSTI4 91
EQI4 $169
ADDRLP4 28
INDIRI4
CNSTI4 93
EQI4 $169
ADDRLP4 28
INDIRI4
CNSTI4 40
EQI4 $169
ADDRLP4 28
INDIRI4
CNSTI4 41
EQI4 $169
ADDRLP4 28
INDIRI4
CNSTI4 61
EQI4 $169
ADDRLP4 28
INDIRI4
CNSTI4 59
EQI4 $169
ADDRLP4 28
INDIRI4
CNSTI4 43
EQI4 $169
ADDRLP4 28
INDIRI4
CNSTI4 64
NEI4 $153
LABELV $169
line 145
;127:			|| *s >= 'A' && *s <= 'Z'
;128:			|| *s >= '0' && *s <= '9'
;129:			|| *s == '_'
;130:			|| *s == '-'
;131:			//|| *s == '.' // could mess with filenames/paths (checkdirtraversal)
;132:			//|| *s == '/' // could mess with filenames (as it is a folder separator)
;133:			|| *s == '['
;134:			|| *s == ']'
;135:			|| *s == '('
;136:			|| *s == ')'
;137:			//|| *s == '<'	// demonames: windows wont allow this in filenames
;138:			//|| *s == '>'	// demonames: windows wont allow this in filenames
;139:			|| *s == '='
;140:			//|| *s == ':'	// demonames: windows wont allow this in filenames
;141:			|| *s == ';'
;142:			|| *s == '+'
;143:			//|| *s == '*'	// demonames: windows wont allow this in filenames
;144:			|| *s == '@'
;145:			) {
line 147
;146:			// whitelist. ok.
;147:		}
ADDRGP4 $154
JUMPV
LABELV $153
line 148
;148:		else {
line 149
;149:			if (clientNumNotify > -2) {
ADDRFP4 4
INDIRI4
CNSTI4 -2
LEI4 $170
line 150
;150:				trap_SendServerCommand(clientNumNotify, "print \"^1Chosen username contains invalid characters. Allowed characters: A-Z a-z 0-9 _-[]()=;+@ and no empty spaces.\n\"");
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $172
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 151
;151:			}
LABELV $170
line 152
;152:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $154
line 154
;153:		}
;154:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 155
;155:	}
LABELV $151
line 125
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $150
line 156
;156:	s--;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 157
;157:	if (*s == ' ' || *s == '.') { // well technically we dont allow either of these chars anyway so meh
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 32
EQI4 $175
ADDRLP4 16
INDIRI4
CNSTI4 46
NEI4 $173
LABELV $175
line 158
;158:		if (clientNumNotify > -2) {
ADDRFP4 4
INDIRI4
CNSTI4 -2
LEI4 $176
line 159
;159:			trap_SendServerCommand(clientNumNotify, "print \"^1Username must not end with a space or dot.\n\"");
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $178
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 160
;160:		}
LABELV $176
line 161
;161:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $173
line 165
;162:	}
;163:
;164:	// these are special reserved windows file/folder names that will cause mayhem if we allow them or best case, we end up losing the demos
;165:	if (len ==3 && 
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $189
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $181
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $190
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $182
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $190
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $183
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $190
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $184
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $190
LABELV $189
ADDRLP4 4
INDIRI4
CNSTI4 4
NEI4 $193
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 3
ASGNI4
ADDRLP4 44
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 48
LTI4 $193
ADDRLP4 44
INDIRI4
CNSTI4 57
GTI4 $193
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 $185
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $190
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $186
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 52
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $190
LABELV $193
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $187
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $179
LABELV $190
line 177
;166:		(!Q_stricmp(username,"CON")
;167:		|| !Q_stricmp(username, "PRN")
;168:		|| !Q_stricmp(username, "AUX")
;169:		|| !Q_stricmp(username, "NUL"))
;170:
;171:		// COM0-COM9, LPT0-LPT9
;172:		|| len == 4 && username[3] >= '0' && username[3] <= '9' &&
;173:		(!Q_stricmpn(username,"COM",3)
;174:			|| !Q_stricmpn(username, "LPT", 3))
;175:
;176:		|| !Q_stricmp(username, "CLOCK$")
;177:		) {
line 178
;178:		if (clientNumNotify > -2) {
ADDRFP4 4
INDIRI4
CNSTI4 -2
LEI4 $194
line 179
;179:			trap_SendServerCommand(clientNumNotify, "print \"^1Your chosen username is not valid because it is a reserved keyword.\n\"");
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $196
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 180
;180:		}
LABELV $194
line 181
;181:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $133
JUMPV
LABELV $179
line 184
;182:	}
;183:
;184:	return qtrue;
CNSTI4 1
RETI4
LABELV $133
endproc G_DB_VerifyUsername 60 12
lit
align 1
LABELV $198
byte 1 0
skip 1023
align 1
LABELV $199
byte 1 0
skip 49
code
proc G_DB_GetChatsResponse 1084 16
line 187
;185:}
;186:
;187:static void G_DB_GetChatsResponse(int status) {
line 188
;188:	char			text[MAX_STRING_CHARS] = { 0 };
ADDRLP4 0
ADDRGP4 $198
INDIRB
ASGNB 1024
line 189
;189:	char 			time[50] = { 0 };
ADDRLP4 1024
ADDRGP4 $199
INDIRB
ASGNB 50
line 190
;190:	if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $200
line 191
;191:		Com_Printf("Getting chats failed with status %d.\n", status);
ADDRGP4 $202
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 192
;192:		return;
ADDRGP4 $197
JUMPV
LABELV $200
line 194
;193:	}
;194:	Com_Printf("^2Recent chats:\n");
ADDRGP4 $203
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
ADDRGP4 $205
JUMPV
LABELV $204
line 195
;195:	while (G_COOL_API_DB_NextRow()) {
line 197
;196:		
;197:		int id = G_COOL_API_DB_GetInt(0);
CNSTI4 0
ARGI4
ADDRLP4 1080
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 1076
ADDRLP4 1080
INDIRI4
ASGNI4
line 198
;198:		G_COOL_API_DB_GetString(1, text,sizeof(text));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 199
;199:		G_COOL_API_DB_GetString(2, time,sizeof(time));
CNSTI4 2
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 200
;200:		Com_Printf("^2%d ^7[%s] %s\n",id, time, text);
ADDRGP4 $207
ARGP4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1024
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 201
;201:	}
LABELV $205
line 195
ADDRLP4 1076
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $204
line 202
;202:}
LABELV $197
endproc G_DB_GetChatsResponse 1084 16
bss
align 1
LABELV $215
skip 1024
align 1
LABELV $216
skip 1024
code
proc G_RegisterContinue 28 16
line 204
;203:
;204:static void G_RegisterContinue(loginRegisterStruct_t* loginData) {
line 205
;205:	const char*		request = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 206
;206:	gentity_t* ent = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 208
;207:
;208:	if (!(ent = DB_VerifyClient(loginData->clientnum, loginData->ip))) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $209
line 209
;209:		Com_Printf("^1Register from client %d failed, user no longer valid.\n", loginData->clientnum);
ADDRGP4 $211
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 210
;210:		return;
ADDRGP4 $208
JUMPV
LABELV $209
line 213
;211:	}
;212:
;213:	if (coolApi_dbVersion >= 3) {
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
LTI4 $212
line 214
;214:		G_COOL_API_DB_AddPreparedStatement((byte*)loginData, sizeof(loginRegisterStruct_t), DBREQUEST_REGISTER,
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3132
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 $214
ARGP4
ADDRGP4 G_COOL_API_DB_AddPreparedStatement
CALLI4
pop
line 216
;215:			"INSERT INTO users (username,password,created) VALUES (?,?,NOW())");
;216:		G_COOL_API_DB_PreparedBindString(loginData->username);
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 217
;217:		G_COOL_API_DB_PreparedBindString(loginData->password);
ADDRFP4 0
INDIRP4
CNSTI4 1052
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 218
;218:		G_COOL_API_DB_FinishAndSendPreparedStatement();
ADDRGP4 G_COOL_API_DB_FinishAndSendPreparedStatement
CALLI4
pop
line 219
;219:	}
ADDRGP4 $213
JUMPV
LABELV $212
line 220
;220:	else {
line 223
;221:		static char		cleanUsername[MAX_STRING_CHARS];
;222:		static char		cleanPassword[MAX_STRING_CHARS];
;223:		Q_strncpyz(cleanUsername, loginData->username, sizeof(cleanUsername));
ADDRGP4 $215
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 224
;224:		Q_strncpyz(cleanPassword, loginData->password, sizeof(cleanPassword));
ADDRGP4 $216
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1052
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 225
;225:		if (!G_COOL_API_DB_EscapeString(cleanUsername, sizeof(cleanUsername)) || !G_COOL_API_DB_EscapeString(cleanPassword, sizeof(cleanPassword))) {
ADDRGP4 $215
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 16
ADDRGP4 G_COOL_API_DB_EscapeString
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $219
ADDRGP4 $216
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 20
ADDRGP4 G_COOL_API_DB_EscapeString
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $217
LABELV $219
line 226
;226:			trap_SendServerCommand(loginData->clientnum, "print \"^1Registration failed (EscapeString failed).\n\"");
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 $220
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 227
;227:			return;
ADDRGP4 $208
JUMPV
LABELV $217
line 230
;228:		}
;229:
;230:		request = va("INSERT INTO users (username,password,created) VALUES ('%s','%s',NOW())", cleanUsername, cleanPassword);
ADDRGP4 $221
ARGP4
ADDRGP4 $215
ARGP4
ADDRGP4 $216
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 233
;231:
;232:		// check if user already exists
;233:		G_COOL_API_DB_AddRequest((byte*)loginData, sizeof(loginRegisterStruct_t), DBREQUEST_REGISTER, request);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3132
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_COOL_API_DB_AddRequest
CALLI4
pop
line 234
;234:	}
LABELV $213
line 236
;235:
;236:}
LABELV $208
endproc G_RegisterContinue 28 16
proc G_ChangePasswordContinue 20 16
line 238
;237:
;238:static void G_ChangePasswordContinue(loginRegisterStruct_t* loginData) {
line 239
;239:	const char*		request = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 240
;240:	gentity_t* ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 242
;241:
;242:	if (!(ent = DB_VerifyClient(loginData->clientnum, loginData->ip))) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $223
line 243
;243:		Com_Printf("^1Change password from client %d failed, user no longer valid.\n", loginData->clientnum);
ADDRGP4 $225
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 244
;244:		return;
ADDRGP4 $222
JUMPV
LABELV $223
line 246
;245:	}
;246:	if (ent->client->sess.login.id != loginData->userId) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43540
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
EQI4 $226
line 247
;247:		trap_SendServerCommand(loginData->clientnum, "print \"^1Password change failed, no longer logged in as same user.\n\"");
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 248
;248:		return;
ADDRGP4 $222
JUMPV
LABELV $226
line 251
;249:	}
;250:
;251:	if (!G_COOL_API_DB_AddPreparedStatement((byte*)loginData, sizeof(loginRegisterStruct_t), DBREQUEST_CHANGEPASSWORD,
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3132
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 $231
ARGP4
ADDRLP4 16
ADDRGP4 G_COOL_API_DB_AddPreparedStatement
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $229
line 252
;252:		"UPDATE users SET password=? WHERE id=?")) {
line 253
;253:		trap_SendServerCommand(loginData->clientnum, "print \"^1Password change failed for unspecified reason.\n\"");
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 $232
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 254
;254:		return;
ADDRGP4 $222
JUMPV
LABELV $229
line 256
;255:	}
;256:	G_COOL_API_DB_PreparedBindString(loginData->password);
ADDRFP4 0
INDIRP4
CNSTI4 1052
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 257
;257:	G_COOL_API_DB_PreparedBindInt(loginData->userId);
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 258
;258:	G_COOL_API_DB_FinishAndSendPreparedStatement();
ADDRGP4 G_COOL_API_DB_FinishAndSendPreparedStatement
CALLI4
pop
line 260
;259:
;260:}
LABELV $222
endproc G_ChangePasswordContinue 20 16
bss
align 4
LABELV $234
skip 3132
code
proc G_RegisterResult 12 12
line 262
;261:
;262:static void G_RegisterResult(int status, const char* errorMessage) {
line 264
;263:	static loginRegisterStruct_t loginData; 
;264:	gentity_t* ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 266
;265:
;266:	G_COOL_API_DB_GetReference((byte*)&loginData, sizeof(loginData));
ADDRGP4 $234
ARGP4
CNSTI4 3132
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 267
;267:	if (!(ent = DB_VerifyClient(loginData.clientnum, loginData.ip))) {
ADDRGP4 $234+24
INDIRI4
ARGI4
ADDRGP4 $234+8
ARGP4
ADDRLP4 4
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $235
line 268
;268:		Com_Printf("^1Register from client %d failed, user no longer valid.\n", loginData.clientnum);
ADDRGP4 $211
ARGP4
ADDRGP4 $234+24
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 269
;269:		return;
ADDRGP4 $233
JUMPV
LABELV $235
line 271
;270:	}
;271:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $240
line 273
;272:		// table doesn't exist. create it.
;273:		G_CreateUserTable();
ADDRGP4 G_CreateUserTable
CALLV
pop
line 274
;274:		trap_SendServerCommand(loginData.clientnum, "print \"^1Registration failed due to usertable not existing. Attempting to create. Please try again shortly.\n\"");
ADDRGP4 $234+24
INDIRI4
ARGI4
ADDRGP4 $243
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 275
;275:		return;
ADDRGP4 $233
JUMPV
LABELV $240
line 277
;276:	}
;277:	else if (status == 1062) {
ADDRFP4 0
INDIRI4
CNSTI4 1062
NEI4 $244
line 278
;278:		trap_SendServerCommand(loginData.clientnum, "print \"^1A user with this name already exists.\n\"");
ADDRGP4 $234+24
INDIRI4
ARGI4
ADDRGP4 $247
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 279
;279:		return;
ADDRGP4 $233
JUMPV
LABELV $244
line 281
;280:	}
;281:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $248
line 282
;282:		trap_SendServerCommand(loginData.clientnum, va("print \"^1Registration failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $251
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $234+24
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 283
;283:		return;
ADDRGP4 $233
JUMPV
LABELV $248
line 285
;284:	}
;285:	trap_SendServerCommand(loginData.clientnum, va("print \"^2Registration successful. You can now log in as '%s'.\n\"", loginData.username));
ADDRGP4 $253
ARGP4
ADDRGP4 $234+28
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $234+24
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 287
;286:
;287:}
LABELV $233
endproc G_RegisterResult 12 12
bss
align 4
LABELV $256
skip 3132
code
proc G_ChangePasswordResult 12 12
line 288
;288:static void G_ChangePasswordResult(int status, const char* errorMessage) {
line 290
;289:	static loginRegisterStruct_t loginData; 
;290:	gentity_t* ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 292
;291:
;292:	G_COOL_API_DB_GetReference((byte*)&loginData, sizeof(loginData));
ADDRGP4 $256
ARGP4
CNSTI4 3132
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 293
;293:	if (!(ent = DB_VerifyClient(loginData.clientnum, loginData.ip))) {
ADDRGP4 $256+24
INDIRI4
ARGI4
ADDRGP4 $256+8
ARGP4
ADDRLP4 4
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $257
line 294
;294:		Com_Printf("^1Change password from client %d failed, user no longer valid.\n", loginData.clientnum);
ADDRGP4 $225
ARGP4
ADDRGP4 $256+24
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 295
;295:		return;
ADDRGP4 $255
JUMPV
LABELV $257
line 297
;296:	}
;297:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $262
line 299
;298:		// table doesn't exist. create it.
;299:		G_CreateUserTable();
ADDRGP4 G_CreateUserTable
CALLV
pop
line 300
;300:		trap_SendServerCommand(loginData.clientnum, "print \"^1Change password failed due to usertable not existing. Attempting to create. Please try again shortly.\n\"");
ADDRGP4 $256+24
INDIRI4
ARGI4
ADDRGP4 $265
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 301
;301:		return;
ADDRGP4 $255
JUMPV
LABELV $262
line 303
;302:	}
;303:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $266
line 304
;304:		trap_SendServerCommand(loginData.clientnum, va("print \"^1Change password failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $269
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $256+24
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 305
;305:		return;
ADDRGP4 $255
JUMPV
LABELV $266
line 307
;306:	}
;307:	trap_SendServerCommand(loginData.clientnum, va("print \"^2Change password. You can now log in with your new password.\n\"", loginData.username));
ADDRGP4 $271
ARGP4
ADDRGP4 $256+28
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $256+24
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 309
;308:
;309:}
LABELV $255
endproc G_ChangePasswordResult 12 12
bss
align 4
LABELV $274
skip 3132
align 1
LABELV $275
skip 1024
align 1
LABELV $277
skip 1024
code
proc G_LoginFetchDataResult 32 20
line 311
;310:
;311:static void G_LoginFetchDataResult(int status, const char* errorMessage) {
line 315
;312:	static loginRegisterStruct_t loginData;
;313:	static char password[MAX_STRING_CHARS];
;314:	static char tmpUsername[sizeof(loginData.username)];
;315:	gentity_t* ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 317
;316:
;317:	G_COOL_API_DB_GetReference((byte*)&loginData, sizeof(loginData));
ADDRGP4 $274
ARGP4
CNSTI4 3132
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 319
;318:
;319:	if (!(ent = DB_VerifyClient(loginData.clientnum, loginData.ip))) {
ADDRGP4 $274+24
INDIRI4
ARGI4
ADDRGP4 $274+8
ARGP4
ADDRLP4 4
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $278
line 320
;320:		Com_Printf("^1Login from client %d failed, user no longer valid.\n", loginData.clientnum);
ADDRGP4 $282
ARGP4
ADDRGP4 $274+24
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 321
;321:		return;
ADDRGP4 $273
JUMPV
LABELV $278
line 324
;322:	}
;323:
;324:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $284
line 326
;325:		// table doesn't exist. create it.
;326:		G_CreateUserTable();
ADDRGP4 G_CreateUserTable
CALLV
pop
line 327
;327:		trap_SendServerCommand(loginData.clientnum,"print \"^1Login failed due to usertable not existing. Attempting to create. Please try again shortly.\n\"");
ADDRGP4 $274+24
INDIRI4
ARGI4
ADDRGP4 $287
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 328
;328:		return;
ADDRGP4 $273
JUMPV
LABELV $284
line 330
;329:	}
;330:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $288
line 331
;331:		trap_SendServerCommand(loginData.clientnum, va("print \"^1Login failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $291
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $274+24
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 332
;332:		return;
ADDRGP4 $273
JUMPV
LABELV $288
line 335
;333:	}
;334:
;335:	if (!G_COOL_API_DB_NextRow()) {
ADDRLP4 8
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $292
line 336
;336:		trap_SendServerCommand(loginData.clientnum, "print \"^1Login failed, username not found.\n\"");
ADDRGP4 $274+24
INDIRI4
ARGI4
ADDRGP4 $295
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 337
;337:		return;
ADDRGP4 $273
JUMPV
LABELV $292
line 339
;338:	}
;339:	if (!G_COOL_API_DB_GetString(0, loginData.dbPassword, sizeof(loginData.dbPassword))) {
CNSTI4 0
ARGI4
ADDRGP4 $274+2076
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 12
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $296
line 340
;340:		trap_SendServerCommand(loginData.clientnum, "print \"^1Login failed, error retrieving password.\n\"");
ADDRGP4 $274+24
INDIRI4
ARGI4
ADDRGP4 $301
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 341
;341:		return;
ADDRGP4 $273
JUMPV
LABELV $296
line 343
;342:	}
;343:	loginData.userFlags = G_COOL_API_DB_GetInt(1);
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRGP4 $274+3104
ADDRLP4 16
INDIRI4
ASGNI4
line 344
;344:	loginData.userId = G_COOL_API_DB_GetInt(2);
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRGP4 $274+4
ADDRLP4 20
INDIRI4
ASGNI4
line 345
;345:	if (!G_COOL_API_DB_GetString(3, tmpUsername, sizeof(tmpUsername))) {
CNSTI4 3
ARGI4
ADDRGP4 $277
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 24
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $304
line 347
;346:		// override username with how its written in DB (cuz can match different case but wanna have demo files named consistently)
;347:		trap_SendServerCommand(loginData.clientnum, "print \"^1WTF COULDN'T GRAB USERNAME, SHOULDN'T HAPPEN!!!.\n\"");
ADDRGP4 $274+24
INDIRI4
ARGI4
ADDRGP4 $307
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 348
;348:		Com_Printf("^1WTF COULDN'T GRAB USERNAME, SHOULDN'T HAPPEN!!!.\n");
ADDRGP4 $308
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 349
;349:	}
ADDRGP4 $305
JUMPV
LABELV $304
line 350
;350:	else {
line 351
;351:		Q_strncpyz(loginData.username, tmpUsername,sizeof(loginData.username));
ADDRGP4 $274+28
ARGP4
ADDRGP4 $277
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 352
;352:	}
LABELV $305
line 354
;353:
;354:	loginData.followUpType = DBREQUEST_LOGIN;
ADDRGP4 $274
CNSTI4 1
ASGNI4
line 356
;355:
;356:	if (loginData.needDoubleBcrypt) {
ADDRGP4 $274+3100
INDIRI4
CNSTI4 0
EQI4 $311
line 357
;357:		G_COOL_API_DB_AddRequestTyped((byte*)&loginData, sizeof(loginData), DBREQUEST_BCRYPTPW,
ADDRGP4 $314
ARGP4
ADDRGP4 $315
ARGP4
ADDRGP4 $274+2076
ARGP4
ADDRGP4 $274+1052
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $274
ARGP4
CNSTI4 3132
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_COOL_API_DB_AddRequestTyped
CALLI4
pop
line 360
;358:			va("2|%s|%s|%s", BCRYPT_SETTINGS, loginData.dbPassword, loginData.password)
;359:			, DBREQUESTTYPE_BCRYPT);
;360:	}
ADDRGP4 $312
JUMPV
LABELV $311
line 361
;361:	else {
line 362
;362:		G_COOL_API_DB_AddRequestTyped((byte*)&loginData, sizeof(loginData), DBREQUEST_BCRYPTPW,
ADDRGP4 $318
ARGP4
ADDRGP4 $274+2076
ARGP4
ADDRGP4 $274+1052
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $274
ARGP4
CNSTI4 3132
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_COOL_API_DB_AddRequestTyped
CALLI4
pop
line 365
;363:			va("1|%s|%s",loginData.dbPassword, loginData.password)
;364:			, DBREQUESTTYPE_BCRYPT);
;365:	}
LABELV $312
line 367
;366:
;367:}
LABELV $273
endproc G_LoginFetchDataResult 32 20
bss
align 1
LABELV $322
skip 256
align 1
LABELV $323
skip 101
align 1
LABELV $324
skip 101
align 1
LABELV $325
skip 101
export G_GenerateRunDemoName
code
proc G_GenerateRunDemoName 16 32
line 369
;368:
;369:const char* G_GenerateRunDemoName(finishedRunInfo_t* runInfo) {
line 374
;370:	static char name[MAX_OSPATH];
;371:	static char sanitizedCourseName[sizeof(runInfo->coursename)];
;372:	static char sanitizedSubCourseName[sizeof(runInfo->subcoursename)];
;373:	static char sanitizedUsername[sizeof(runInfo->subcoursename)];
;374:	sanitizeFilename(runInfo->coursename, sanitizedCourseName, qfalse); // take care of possible special cahrs the filesystem may not like
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRGP4 $323
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 sanitizeFilename
CALLV
pop
line 375
;375:	sanitizeFilename(runInfo->subcoursename, sanitizedSubCourseName, qfalse); // take care of possible special cahrs the filesystem may not like
ADDRFP4 0
INDIRP4
CNSTI4 225
ADDP4
ARGP4
ADDRGP4 $324
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 sanitizeFilename
CALLV
pop
line 376
;376:	if (runInfo->userId == -1) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $326
line 378
;377:
;378:		Com_sprintf(name, sizeof(name), "races/unlogged/%s%s-%s"
ADDRGP4 $324
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $332
ADDRGP4 $329
ARGP4
ADDRGP4 $324
ARGP4
ADDRLP4 4
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRGP4 $333
JUMPV
LABELV $332
ADDRLP4 0
ADDRGP4 $330
ASGNP4
LABELV $333
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 DF_DemoRaceStyleNamePart
CALLP4
ASGNP4
ADDRGP4 $322
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $328
ARGP4
ADDRGP4 $323
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 382
;379:			, sanitizedCourseName
;380:			, sanitizedSubCourseName[0] ? miniva("(%s)", sanitizedSubCourseName) : ""
;381:			, DF_DemoRaceStyleNamePart(&runInfo->raceStyle));
;382:	}
ADDRGP4 $327
JUMPV
LABELV $326
line 383
;383:	else {
line 384
;384:		sanitizeFilename(runInfo->username, sanitizedUsername, qfalse); // take care of possible special cahrs the filesystem may not like
ADDRFP4 0
INDIRP4
CNSTI4 326
ADDP4
ARGP4
ADDRGP4 $325
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 sanitizeFilename
CALLV
pop
line 385
;385:		Com_sprintf(name, sizeof(name), "races/logged/%s/%s-%s%s-%s", sanitizedUsername
ADDRGP4 $324
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $336
ADDRGP4 $329
ARGP4
ADDRGP4 $324
ARGP4
ADDRLP4 4
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRGP4 $337
JUMPV
LABELV $336
ADDRLP4 0
ADDRGP4 $330
ASGNP4
LABELV $337
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 DF_DemoRaceStyleNamePart
CALLP4
ASGNP4
ADDRGP4 $322
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $334
ARGP4
ADDRLP4 12
ADDRGP4 $325
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $323
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 390
;386:			, sanitizedUsername
;387:			, sanitizedCourseName
;388:			, sanitizedSubCourseName[0] ? miniva("(%s)", sanitizedSubCourseName) : ""
;389:			, DF_DemoRaceStyleNamePart(&runInfo->raceStyle));
;390:	}
LABELV $327
line 391
;391:	return name;
ADDRGP4 $322
RETP4
LABELV $321
endproc G_GenerateRunDemoName 16 32
proc G_InsertRunResult 800 16
line 396
;392:}
;393:
;394:void PrintRaceTime(finishedRunInfo_t* runInfo, qboolean preliminary, qboolean showRank, gentity_t* ent);
;395:
;396:static void G_InsertRunResult(int status, const char* errorMessage, int affectedRows) {
line 398
;397:	insertUpdateRunStruct_t runData;
;398:	gentity_t* ent = NULL;
ADDRLP4 756
CNSTP4 0
ASGNP4
line 401
;399:	//evaluatedRunInfo_t eRunInfo;
;400:
;401:	G_COOL_API_DB_GetReference((byte*)&runData, sizeof(runData));
ADDRLP4 0
ARGP4
CNSTI4 756
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 403
;402:
;403:	if (!(ent = DB_VerifyClient(runData.clientnum, runData.ip))) {
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 760
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 756
ADDRLP4 760
INDIRP4
ASGNP4
ADDRLP4 760
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $339
line 404
;404:		Com_Printf("^1Client %d run inserted, user no longer valid.\n", runData.clientnum);
ADDRGP4 $342
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 406
;405:		//return;
;406:	}
LABELV $339
line 408
;407:
;408:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $344
line 410
;409:		// table doesn't exist. create it.
;410:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 411
;411:		trap_SendServerCommand(-1,"print \"^1Run insertion failed due to runtable not existing. Attempting to create. Please try again shortly.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $346
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 412
;412:		return;
ADDRGP4 $338
JUMPV
LABELV $344
line 414
;413:	}
;414:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $347
line 415
;415:		trap_SendServerCommand(-1, va("print \"^1Run insertion failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $349
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 764
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 764
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 416
;416:		return;
ADDRGP4 $338
JUMPV
LABELV $347
line 419
;417:	}
;418:
;419:	if (coolApi_dbVersion >= 3) {
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
LTI4 $350
line 421
;420:		// first query is SET @now = NOW(). skip it.
;421:		if (!G_COOL_API_DB_GetMoreResults(&affectedRows))
ADDRFP4 8
ARGP4
ADDRLP4 764
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
ASGNI4
ADDRLP4 764
INDIRI4
CNSTI4 0
NEI4 $352
line 422
;422:		{
line 423
;423:			trap_SendServerCommand(-1, "print \"^1WTF NO MORE RESULTS\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 424
;424:		}
LABELV $352
line 425
;425:	}
LABELV $350
line 427
;426:
;427:	runData.runInfo.pbStatus = 0;
ADDRLP4 0+20+116
CNSTI4 0
ASGNI4
line 428
;428:	if (affectedRows == 0) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $357
line 431
;429:		//trap_SendServerCommand(-1, "print \"^1No new PB.\n\"");
;430:		// no new pb
;431:	}
ADDRGP4 $358
JUMPV
LABELV $357
line 432
;432:	else if (affectedRows == 1) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $359
line 434
;433:		//trap_SendServerCommand(-1, "print \"^1First run.\n\"");
;434:		runData.runInfo.pbStatus |= PB_FIRSTRUN_SPECIFICSTYLE; // first run
ADDRLP4 0+20+116
ADDRLP4 0+20+116
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 435
;435:		level.shouldUpdateMapRanks = qtrue;
ADDRGP4 level+29524
CNSTI4 1
ASGNI4
line 436
;436:	}
ADDRGP4 $360
JUMPV
LABELV $359
line 437
;437:	else if (affectedRows == 2) {
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $364
line 439
;438:		//trap_SendServerCommand(-1, "print \"^1PB!\n\"");
;439:		runData.runInfo.pbStatus |= PB_NEWPB_SPECIFICSTYLE;
ADDRLP4 0+20+116
ADDRLP4 0+20+116
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 440
;440:		level.shouldUpdateMapRanks = qtrue;
ADDRGP4 level+29524
CNSTI4 1
ASGNI4
line 441
;441:	}
ADDRGP4 $365
JUMPV
LABELV $364
line 442
;442:	else {
line 443
;443:		trap_SendServerCommand(-1, va("print \"^1WTF %d\n\"", affectedRows));
ADDRGP4 $369
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 764
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 764
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 444
;444:	}
LABELV $365
LABELV $360
LABELV $358
line 447
;445:
;446:
;447:	if (coolApi_dbVersion >= 3 && G_COOL_API_DB_GetMoreResults(NULL) && G_COOL_API_DB_NextRow())
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
LTI4 $370
CNSTP4 0
ARGP4
ADDRLP4 764
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
ASGNI4
ADDRLP4 764
INDIRI4
CNSTI4 0
EQI4 $370
ADDRLP4 768
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 768
INDIRI4
CNSTI4 0
EQI4 $370
line 448
;448:	{
line 449
;449:		if (!G_COOL_API_DB_GetInt(0)) {// SQL result returns amount of faster runs BY OURSELVES on this LB
CNSTI4 0
ARGI4
ADDRLP4 772
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 772
INDIRI4
CNSTI4 0
NEI4 $372
line 450
;450:			runData.runInfo.pbStatus |= PB_LB;
ADDRLP4 0+20+116
ADDRLP4 0+20+116
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 451
;451:		}
LABELV $372
line 452
;452:	}
LABELV $370
line 454
;453:
;454:	if (coolApi_dbVersion >= 3 && G_COOL_API_DB_GetMoreResults(NULL) && G_COOL_API_DB_NextRow())
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
LTI4 $376
CNSTP4 0
ARGP4
ADDRLP4 772
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
ASGNI4
ADDRLP4 772
INDIRI4
CNSTI4 0
EQI4 $376
ADDRLP4 776
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 776
INDIRI4
CNSTI4 0
EQI4 $376
line 455
;455:	{
line 456
;456:		runData.runInfo.rankLB = G_COOL_API_DB_GetInt(0) + 1; // SQL result returns amount of faster runs so we add 1 (0 faster runs = #1)
CNSTI4 0
ARGI4
ADDRLP4 780
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 0+20+120
ADDRLP4 780
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 457
;457:	}
LABELV $376
line 461
;458:
;459:	// SELECT (UNIX_TIMESTAMP(@now)-3000000000) as unixTimeMinus3bill
;460:	// subtracting 3 billion cuz no 64 bit support in vm
;461:	if (coolApi_dbVersion >= 3 && G_COOL_API_DB_GetMoreResults(NULL) && G_COOL_API_DB_NextRow())
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
LTI4 $380
CNSTP4 0
ARGP4
ADDRLP4 780
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
ASGNI4
ADDRLP4 780
INDIRI4
CNSTI4 0
EQI4 $380
ADDRLP4 784
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 784
INDIRI4
CNSTI4 0
EQI4 $380
line 462
;462:	{
line 463
;463:		runData.runInfo.unixTimeStampShifted = G_COOL_API_DB_GetInt(0);
CNSTI4 0
ARGI4
ADDRLP4 788
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 0+20+340
ADDRLP4 788
INDIRI4
ASGNI4
line 464
;464:	}
LABELV $380
line 466
;465:
;466:	if (runData.runInfo.tempDemoName[0]) {
ADDRLP4 0+20+416
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $384
line 467
;467:		if ((runData.runInfo.pbStatus & PB_FIRSTRUN_SPECIFICSTYLE) || (runData.runInfo.pbStatus & PB_NEWPB_SPECIFICSTYLE)) {
ADDRLP4 788
CNSTI4 0
ASGNI4
ADDRLP4 0+20+116
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 788
INDIRI4
NEI4 $394
ADDRLP4 0+20+116
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 788
INDIRI4
EQI4 $388
LABELV $394
line 484
;468:			//if (runData.runInfo.userId == -1) {
;469:			//	trap_SendConsoleCommand(EXEC_APPEND, va("svrenamedemo \"%s\" \"races_unlogged/%s%s-%s\"\n", runData.runInfo.tempDemoName
;470:			//		, runData.runInfo.coursename
;471:			//		, runData.runInfo.subcoursename[0] ? miniva("(%s)", runData.runInfo.subcoursename) : ""
;472:			//		, DF_DemoRaceStyleNamePart(&runData.runInfo.raceStyle)
;473:			//	));
;474:			//}
;475:			//else {
;476:			//	trap_SendConsoleCommand(EXEC_APPEND, va("svrenamedemo \"%s\" \"races/%s/%s-%s%s-%s\"\n", runData.runInfo.tempDemoName, runData.runInfo.username
;477:			//		,runData.runInfo.username
;478:			//		,runData.runInfo.coursename
;479:			//		, runData.runInfo.subcoursename[0] ? miniva("(%s)", runData.runInfo.subcoursename) : ""
;480:			//		,DF_DemoRaceStyleNamePart(&runData.runInfo.raceStyle)
;481:			//		));
;482:			//}
;483:
;484:			trap_SendConsoleCommand(EXEC_APPEND, va("svrenamedemo \"%s\" \"%s\"\n", runData.runInfo.tempDemoName
ADDRLP4 0+20
ARGP4
ADDRLP4 792
ADDRGP4 G_GenerateRunDemoName
CALLP4
ASGNP4
ADDRGP4 $395
ARGP4
ADDRLP4 0+20+416
ARGP4
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 796
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 796
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 487
;485:				, G_GenerateRunDemoName(&runData.runInfo)
;486:			));
;487:		}
ADDRGP4 $389
JUMPV
LABELV $388
line 488
;488:		else {
line 490
;489:			// "delete" it.
;490:			trap_SendConsoleCommand(EXEC_APPEND, va("svrenamedemo \"%s\" \"%strash/trash%d\"\n", runData.runInfo.tempDemoName, level.tempDemoNamePrefix, runData.runInfo.clientNum));
ADDRGP4 $399
ARGP4
ADDRLP4 0+20+416
ARGP4
ADDRGP4 level+32612
ARGP4
ADDRLP4 0+20+4
INDIRI4
ARGI4
ADDRLP4 792
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 792
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 491
;491:		}
LABELV $389
line 492
;492:	}
LABELV $384
line 494
;493:
;494:	PrintRaceTime(&runData.runInfo, qfalse, qtrue,ent);
ADDRLP4 0+20
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 756
INDIRP4
ARGP4
ADDRGP4 PrintRaceTime
CALLV
pop
line 496
;495:
;496:}
LABELV $338
endproc G_InsertRunResult 800 16
proc G_InsertSubcontestResult 64 12
line 497
;497:static void G_InsertSubcontestResult(int status, const char* errorMessage, int affectedRows) {
line 499
;498:	insertUpdateSubContestStruct_t runData;
;499:	gentity_t* ent = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 500
;500:	int pbStatus = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 501
;501:	int rank = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 504
;502:	//evaluatedRunInfo_t eRunInfo;
;503:
;504:	G_COOL_API_DB_GetReference((byte*)&runData, sizeof(runData));
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 506
;505:
;506:	if (!(ent = DB_VerifyClient(runData.clientnum, runData.ip))) {
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 44
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $407
line 507
;507:		Com_Printf("^1Client %d subcontest inserted, user no longer valid.\n", runData.clientnum);
ADDRGP4 $410
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 508
;508:		return;
ADDRGP4 $406
JUMPV
LABELV $407
line 511
;509:	}
;510:
;511:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $412
line 513
;512:		// table doesn't exist. create it.
;513:		G_CreateSubContestsTable();
ADDRGP4 G_CreateSubContestsTable
CALLV
pop
line 514
;514:		trap_SendServerCommand(-1,"print \"^1Subcontest insertion failed due to subcontest table not existing. Attempting to create. Please try again shortly.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $414
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 515
;515:		return;
ADDRGP4 $406
JUMPV
LABELV $412
line 517
;516:	}
;517:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $415
line 518
;518:		trap_SendServerCommand(-1, va("print \"^1Subcontest insertion failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $417
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 519
;519:		return;
ADDRGP4 $406
JUMPV
LABELV $415
line 522
;520:	}
;521:
;522:	if (coolApi_dbVersion >= 3) {
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
LTI4 $418
line 524
;523:		// first query is SET @now = NOW(). skip it.
;524:		if (!G_COOL_API_DB_GetMoreResults(&affectedRows))
ADDRFP4 8
ARGP4
ADDRLP4 48
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $420
line 525
;525:		{
line 526
;526:			trap_SendServerCommand(-1, "print \"^1WTF NO MORE RESULTS\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 527
;527:		}
LABELV $420
line 528
;528:	}
LABELV $418
line 530
;529:
;530:	pbStatus = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 531
;531:	if (affectedRows == 0) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $422
line 534
;532:		//trap_SendServerCommand(-1, "print \"^1No new PB.\n\"");
;533:		// no new pb
;534:	}
ADDRGP4 $423
JUMPV
LABELV $422
line 535
;535:	else if (affectedRows == 1) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $424
line 537
;536:		//trap_SendServerCommand(-1, "print \"^1First run.\n\"");
;537:		pbStatus |= PB_FIRSTRUN_SPECIFICSTYLE; // first run
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 538
;538:	}
ADDRGP4 $425
JUMPV
LABELV $424
line 539
;539:	else if (affectedRows == 2) {
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $426
line 541
;540:		//trap_SendServerCommand(-1, "print \"^1PB!\n\"");
;541:		pbStatus |= PB_NEWPB_SPECIFICSTYLE;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 542
;542:	}
ADDRGP4 $427
JUMPV
LABELV $426
line 543
;543:	else {
line 544
;544:		trap_SendServerCommand(-1, va("print \"^1WTF %d\n\"", affectedRows));
ADDRGP4 $369
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 545
;545:	}
LABELV $427
LABELV $425
LABELV $423
line 548
;546:
;547:
;548:	if (coolApi_dbVersion >= 3 && G_COOL_API_DB_GetMoreResults(NULL) && G_COOL_API_DB_NextRow())
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
LTI4 $428
CNSTP4 0
ARGP4
ADDRLP4 48
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $428
ADDRLP4 52
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $428
line 549
;549:	{
line 550
;550:		rank = G_COOL_API_DB_GetInt(0) + 1; // SQL result returns amount of faster runs so we add 1 (0 faster runs = #1)
CNSTI4 0
ARGI4
ADDRLP4 56
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 551
;551:	}
LABELV $428
line 553
;552:
;553:	if (rank == 1 && pbStatus) {
ADDRLP4 36
INDIRI4
CNSTI4 1
NEI4 $430
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $430
line 554
;554:		if (runData.userid == -1) {
ADDRLP4 0+24
INDIRI4
CNSTI4 -1
NEI4 $432
line 555
;555:			switch (runData.contest) {
ADDRLP4 56
ADDRLP4 0+28
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $439
ADDRGP4 $433
JUMPV
LABELV $439
line 557
;556:			case SUBCONTESTS_ROLLYMPICS:
;557:				trap_SendServerCommand(-1, va("print \"%s ^7unofficially beat the best logged roll with ^3%.2f^7ups\n\"", ent->client->pers.netname, runData.value));
ADDRGP4 $440
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 0+20
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 558
;558:				break;
line 560
;559:			}
;560:		}
ADDRGP4 $433
JUMPV
LABELV $432
line 561
;561:		else {
line 562
;562:			switch (runData.contest) {
ADDRLP4 56
ADDRLP4 0+28
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $446
ADDRGP4 $442
JUMPV
LABELV $446
line 564
;563:			case SUBCONTESTS_ROLLYMPICS:
;564:				trap_SendServerCommand(-1, va("print \"%s ^7now holds the fastest roll record with ^2%.2f^7ups\n\"", ent->client->pers.netname, runData.value));
ADDRGP4 $447
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 0+20
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 565
;565:				break;
LABELV $442
LABELV $443
line 567
;566:			}
;567:		}
LABELV $433
line 568
;568:	}
LABELV $430
line 570
;569:
;570:}
LABELV $406
endproc G_InsertSubcontestResult 64 12
proc G_InsertMapDefaultsResult 144 12
line 571
;571:static void G_InsertMapDefaultsResult(int status, const char* errorMessage, int affectedRows) {
line 573
;572:	insertUpdateMapRaceDefaultsStruct_t data;
;573:	gentity_t* ent = NULL;
ADDRLP4 132
CNSTP4 0
ASGNP4
line 576
;574:	//evaluatedRunInfo_t eRunInfo;
;575:
;576:	G_COOL_API_DB_GetReference((byte*)&data, sizeof(data));
ADDRLP4 0
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 578
;577:
;578:	if (!(ent = DB_VerifyClient(data.clientnum, data.ip))) {
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 132
ADDRLP4 136
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $450
line 579
;579:		Com_Printf("^1Map defaults by client %d inserted, user no longer valid.\n", data.clientnum);
ADDRGP4 $453
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 581
;580:		//return;
;581:	}
LABELV $450
line 583
;582:
;583:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $455
line 585
;584:		// table doesn't exist. create it.
;585:		G_CreateMapRaceDefaultsTable();
ADDRGP4 G_CreateMapRaceDefaultsTable
CALLV
pop
line 586
;586:		trap_SendServerCommand(ent - g_entities,"print \"^1Map defaults insertion failed due to map defaults table not existing. Attempting to create. Please try again shortly.\n\"");
ADDRLP4 132
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 587
;587:		return;
ADDRGP4 $449
JUMPV
LABELV $455
line 589
;588:	}
;589:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $458
line 590
;590:		trap_SendServerCommand(ent - g_entities, va("print \"^1Map defaults insertion failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $460
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 132
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 591
;591:		return;
ADDRGP4 $449
JUMPV
LABELV $458
line 594
;592:	}
;593:
;594:	trap_SendServerCommand(-1, va("print \"^1Map defaults (%s) for %s were updated\n\"",data.what,data.course));
ADDRGP4 $461
ARGP4
ADDRLP4 0+20
ARGP4
ADDRLP4 0+30
ARGP4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 596
;595:
;596:}
LABELV $449
endproc G_InsertMapDefaultsResult 144 12
proc G_LoadMapDefaultsResult 192 12
line 598
;597:
;598:static void G_LoadMapDefaultsResult(int status, const char* errorMessage, int affectedRows) {
line 603
;599:	insertUpdateMapRaceDefaultsStruct_t data;
;600:	const char* currentCoursename;
;601:	//evaluatedRunInfo_t eRunInfo;
;602:
;603:	G_COOL_API_DB_GetReference((byte*)&data, sizeof(data));
ADDRLP4 0
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 605
;604:
;605:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $465
line 607
;606:		// table doesn't exist. create it.
;607:		G_CreateMapRaceDefaultsTable();
ADDRGP4 G_CreateMapRaceDefaultsTable
CALLV
pop
line 608
;608:		trap_SendServerCommand(-1,"print \"^1Map defaults load failed due to map defaults table not existing. Attempting to create. Please try again shortly.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $467
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 609
;609:		level.mapDefaultsLoadFailed = qfalse; // we dont have a defdault so its ok
ADDRGP4 level+9132
CNSTI4 0
ASGNI4
line 610
;610:		level.mapDefaultsConfirmed = qtrue;
ADDRGP4 level+9128
CNSTI4 1
ASGNI4
line 611
;611:		return;
ADDRGP4 $464
JUMPV
LABELV $465
line 613
;612:	}
;613:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $470
line 614
;614:		trap_SendServerCommand(-1, va("print \"^1Map defaults load failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $472
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 615
;615:		level.mapDefaultsLoadFailed = qtrue;
ADDRGP4 level+9132
CNSTI4 1
ASGNI4
line 616
;616:		level.mapDefaultsConfirmed = qfalse;
ADDRGP4 level+9128
CNSTI4 0
ASGNI4
line 617
;617:		return;
ADDRGP4 $464
JUMPV
LABELV $470
line 620
;618:	}
;619:
;620:	currentCoursename = DF_GetCourseName(qfalse);
CNSTI4 0
ARGI4
ADDRLP4 136
ADDRGP4 DF_GetCourseName
CALLP4
ASGNP4
ADDRLP4 132
ADDRLP4 136
INDIRP4
ASGNP4
line 621
;621:	if (Q_stricmp(currentCoursename, data.course)) {
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 0+30
ARGP4
ADDRLP4 140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $475
line 622
;622:		if (currentCoursename[0]) {
ADDRLP4 132
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $478
line 623
;623:			trap_SendServerCommand(-1, "print \"^1Map defaults load failed; course name changed (?). Retrying.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $480
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 624
;624:			DF_LoadMapDefaults();
ADDRGP4 DF_LoadMapDefaults
CALLV
pop
line 625
;625:		}
ADDRGP4 $464
JUMPV
LABELV $478
line 626
;626:		else {
line 627
;627:			trap_SendServerCommand(-1, "print \"^1Map defaults load failed;  current coursename empty?!?!!?\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $481
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 628
;628:		}
line 629
;629:		return;
ADDRGP4 $464
JUMPV
LABELV $475
line 632
;630:	}
;631:
;632:	if (!G_COOL_API_DB_NextRow()) {
ADDRLP4 144
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $482
line 633
;633:		trap_SendServerCommand(-1, "print \"^1Map defaults load failed; no defaults found.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $484
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 634
;634:		level.mapDefaultsLoadFailed = qfalse; // we dont have a defdault so its ok
ADDRGP4 level+9132
CNSTI4 0
ASGNI4
line 635
;635:		level.mapDefaultsConfirmed = qtrue;
ADDRGP4 level+9128
CNSTI4 1
ASGNI4
line 636
;636:		return;
ADDRGP4 $464
JUMPV
LABELV $482
line 638
;637:	}
;638:	else {
line 640
;639:		raceStyle_t rs;
;640:		rs.movementStyle = MV_JK2;
ADDRLP4 148
CNSTU1 0
ASGNU1
line 641
;641:		rs.msec = G_COOL_API_DB_GetInt(0);
CNSTI4 0
ARGI4
ADDRLP4 160
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 148+2
ADDRLP4 160
INDIRI4
CVII2 4
ASGNI2
line 642
;642:		rs.jumpLevel = G_COOL_API_DB_GetInt(1);
CNSTI4 1
ARGI4
ADDRLP4 164
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 148+4
ADDRLP4 164
INDIRI4
CVII1 4
ASGNI1
line 643
;643:		rs.variant = G_COOL_API_DB_GetInt(2);
CNSTI4 2
ARGI4
ADDRLP4 168
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 148+6
ADDRLP4 168
INDIRI4
CVII2 4
ASGNI2
line 644
;644:		rs.runFlags = G_COOL_API_DB_GetInt(3);
CNSTI4 3
ARGI4
ADDRLP4 172
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 148+8
ADDRLP4 172
INDIRI4
CVII2 4
ASGNI2
line 645
;645:		DF_SetMapDefaults(rs);
ADDRLP4 176
ADDRLP4 148
INDIRB
ASGNB 12
ADDRLP4 176
ARGP4
ADDRGP4 DF_SetMapDefaults
CALLV
pop
line 646
;646:		level.mapDefaultsLoadFailed = qfalse;
ADDRGP4 level+9132
CNSTI4 0
ASGNI4
line 647
;647:		level.mapDefaultsConfirmed = qtrue;
ADDRGP4 level+9128
CNSTI4 1
ASGNI4
line 648
;648:		trap_SendServerCommand(-1, va("print \"^2Map defaults for %s were loaded.\n\"", data.course));
ADDRGP4 $493
ARGP4
ADDRLP4 0+30
ARGP4
ADDRLP4 188
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 188
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 649
;649:	}
line 651
;650:
;651:}
LABELV $464
endproc G_LoadMapDefaultsResult 192 12
proc G_SaveCheckpointsResult 40 12
line 653
;652:
;653:static void G_SaveCheckpointsResult(int status, const char* errorMessage, int affectedRows) {
line 655
;654:	checkPointSaveRequestStruct_t data;
;655:	gentity_t* ent = NULL;
ADDRLP4 20
CNSTP4 0
ASGNP4
line 657
;656:	//evaluatedRunInfo_t eRunInfo;
;657:	int deleted=0, inserted=0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 28
CNSTI4 0
ASGNI4
line 659
;658:
;659:	G_COOL_API_DB_GetReference((byte*)&data, sizeof(data));
ADDRLP4 0
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 661
;660:
;661:	if (!(ent = DB_VerifyClient(data.clientnum, data.ip))) {
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 32
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $496
line 662
;662:		Com_Printf("^1Client %d checkpoints saved, user no longer valid.\n", data.clientnum);
ADDRGP4 $499
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 663
;663:		return;
ADDRGP4 $495
JUMPV
LABELV $496
line 666
;664:	}
;665:
;666:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $501
line 668
;667:		// table doesn't exist. create it.
;668:		G_CreateCheckpointsTable();
ADDRGP4 G_CreateCheckpointsTable
CALLV
pop
line 669
;669:		G_SendServerCommand(ent-g_entities,"print \"^1Checkpoint saving failed due to checkpoints table not existing. Attempting to create. Please try again shortly.\n\"",qtrue);
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $503
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 670
;670:		return;
ADDRGP4 $495
JUMPV
LABELV $501
line 672
;671:	}
;672:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $504
line 673
;673:		G_SendServerCommand(ent - g_entities, va("print \"^1Checkpoint saving failed with status %d and error message %s.\n\"", status, errorMessage),qtrue);
ADDRGP4 $506
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 674
;674:		return;
ADDRGP4 $495
JUMPV
LABELV $504
line 677
;675:	}
;676:
;677:	deleted = affectedRows;
ADDRLP4 24
ADDRFP4 8
INDIRI4
ASGNI4
line 679
;678:
;679:	if (coolApi_dbVersion >= 3) {
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
LTI4 $507
line 681
;680:		// first query is SET @now = NOW(). skip it.
;681:		if (!G_COOL_API_DB_GetMoreResults(&inserted))
ADDRLP4 28
ARGP4
ADDRLP4 36
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $509
line 682
;682:		{
line 683
;683:			G_SendServerCommand(ent - g_entities, "print \"^1WTF NO MORE RESULTS\n\"",qtrue);
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $354
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 684
;684:		}
LABELV $509
line 685
;685:	}
LABELV $507
line 687
;686:
;687:	G_SendServerCommand(ent - g_entities, va("print \"^2%d checkpoints saved to user account, %d old saved checkpoints deleted.\n\"", inserted, deleted),qtrue);
ADDRGP4 $511
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 689
;688:
;689:}
LABELV $495
endproc G_SaveCheckpointsResult 40 12
proc G_LoadCheckpointsResult 56 12
line 691
;690:qboolean DF_CreateCustomCheckpointFromPos(vec3_t trEndpos, float anglesYaw, gentity_t* playerent);
;691:static void G_LoadCheckpointsResult(int status, const char* errorMessage, int affectedRows) {
line 693
;692:	checkPointSaveRequestStruct_t data;
;693:	gentity_t* ent = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 695
;694:	//evaluatedRunInfo_t eRunInfo;
;695:	int loaded =0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 699
;696:	vec3_t trEndpos;
;697:	float yaw;
;698:
;699:	G_COOL_API_DB_GetReference((byte*)&data, sizeof(data));
ADDRLP4 24
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 701
;700:
;701:	if (!(ent = DB_VerifyClient(data.clientnum, data.ip))) {
ADDRLP4 24+16
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 44
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 44
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $513
line 702
;702:		Com_Printf("^1Client %d checkpoints loaded, user no longer valid.\n", data.clientnum);
ADDRGP4 $516
ARGP4
ADDRLP4 24+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 703
;703:		return;
ADDRGP4 $512
JUMPV
LABELV $513
line 706
;704:	}
;705:
;706:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $518
line 708
;707:		// table doesn't exist. create it.
;708:		G_CreateCheckpointsTable();
ADDRGP4 G_CreateCheckpointsTable
CALLV
pop
line 709
;709:		G_SendServerCommand(ent-g_entities,"print \"^1Checkpoint loading failed due to checkpoints table not existing. Attempting to create. Please try again shortly.\n\"",qtrue);
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $520
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 710
;710:		return;
ADDRGP4 $512
JUMPV
LABELV $518
line 712
;711:	}
;712:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $525
line 713
;713:		G_SendServerCommand(ent - g_entities, va("print \"^1Checkpoint loading failed with status %d and error message %s.\n\"", status, errorMessage),qtrue);
ADDRGP4 $523
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 714
;714:		return;
ADDRGP4 $512
JUMPV
LABELV $524
line 717
;715:	}
;716:
;717:	while (G_COOL_API_DB_NextRow()) {
line 718
;718:		G_COOL_API_DB_GetFloat(0,&trEndpos[0]);
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 719
;719:		G_COOL_API_DB_GetFloat(1,&trEndpos[1]);
CNSTI4 1
ARGI4
ADDRLP4 0+4
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 720
;720:		G_COOL_API_DB_GetFloat(2,&trEndpos[2]);
CNSTI4 2
ARGI4
ADDRLP4 0+8
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 721
;721:		G_COOL_API_DB_GetFloat(3,&yaw);
CNSTI4 3
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 722
;722:		if (!DF_CreateCustomCheckpointFromPos(trEndpos, yaw, ent)) {
ADDRLP4 0
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 DF_CreateCustomCheckpointFromPos
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $529
line 723
;723:			G_SendServerCommand(ent - g_entities, "print \"^1Checkpoint limit reached. Can't load any more checkpoints.\n\"",qtrue);
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $531
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 724
;724:			break;
ADDRGP4 $526
JUMPV
LABELV $529
line 726
;725:		}
;726:		else {
line 727
;727:			loaded++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 728
;728:		}
line 729
;729:	}
LABELV $525
line 717
ADDRLP4 48
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $524
LABELV $526
line 731
;730:
;731:	G_SendServerCommand(ent - g_entities, va("print \"^2%d checkpoints loaded from user account.\n\"", loaded),qtrue);
ADDRGP4 $532
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 733
;732:
;733:}
LABELV $512
endproc G_LoadCheckpointsResult 56 12
bss
align 1
LABELV $534
skip 101
align 1
LABELV $535
skip 101
code
proc G_TopMapSearchResult 124 32
line 737
;734:
;735:void DF_TopRequest(gentity_t* ent, const char* coursename, const char* subcoursename, int page, int style, topRequestType_t type, mainLeaderboardType_t lbTypeIfSpecific, raceStyle_t* thisMapDefaultRaceStyle);
;736:
;737:static void G_TopMapSearchResult(int status, const char* errorMessage, int affectedRows) {
line 739
;738:	topRequestStruct_t data;
;739:	gentity_t* ent = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 741
;740:	//evaluatedRunInfo_t eRunInfo;
;741:	int loaded =0;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 745
;742:	vec3_t trEndpos;
;743:	static char courseName[COURSENAME_MAX_LEN + 1];
;744:	static char subCourseName[COURSENAME_MAX_LEN + 1];
;745:	int resultsFound = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 749
;746:	int diff, diff2;
;747:	int mapDefaultsFound;
;748:	raceStyle_t mapDefaultRaceStyle;
;749:	qboolean afterRun = qfalse; // TODO send to spectators if following guy who just got PB/WR?
ADDRLP4 68
CNSTI4 0
ASGNI4
line 751
;750:
;751:	G_COOL_API_DB_GetReference((byte*)&data, sizeof(data));
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 753
;752:
;753:	if (!(ent = DB_VerifyClient(data.clientnum, data.ip))) {
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 88
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 88
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $536
line 754
;754:		Com_Printf("^1Client %d top map search results returned, user no longer valid.\n", data.clientnum);
ADDRGP4 $539
ARGP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 755
;755:		return;
ADDRGP4 $533
JUMPV
LABELV $536
line 758
;756:	}
;757:
;758:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $541
line 760
;759:		// table doesn't exist. create it.
;760:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 761
;761:		G_SendServerCommand(ent-g_entities,"print \"^1Searching maps for top results failed due to runs table not existing. Attempting to create. Please try again shortly.\n\"", afterRun);
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $543
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 762
;762:		return;
ADDRGP4 $533
JUMPV
LABELV $541
line 764
;763:	}
;764:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $544
line 765
;765:		G_SendServerCommand(ent - g_entities, va("print \"^1Searching maps for top results failed with status %d and error message %s.\n\"", status, errorMessage), afterRun);
ADDRGP4 $546
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 766
;766:		return;
ADDRGP4 $533
JUMPV
LABELV $544
line 769
;767:	}
;768:
;769:	G_SendServerCommand(ent - g_entities, "print \"Your top result request matches the following maps/courses:\n\"", afterRun);
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $547
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 773
;770:
;771:
;772:	// first query is SET @now = NOW(). skip it.
;773:	if (!G_COOL_API_DB_GetMoreResults(&affectedRows))
ADDRFP4 8
ARGP4
ADDRLP4 92
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $551
line 774
;774:	{
line 775
;775:		trap_SendServerCommand(-1, "print \"^1WTF NO MORE RESULTS\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $354
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 776
;776:		return;
ADDRGP4 $533
JUMPV
LABELV $550
line 779
;777:	}
;778:
;779:	while (G_COOL_API_DB_NextRow()) {
line 780
;780:		G_COOL_API_DB_GetString(0, courseName,sizeof(courseName));
CNSTI4 0
ARGI4
ADDRGP4 $534
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 781
;781:		G_COOL_API_DB_GetString(1, subCourseName,sizeof(subCourseName));
CNSTI4 1
ARGI4
ADDRGP4 $535
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 782
;782:		diff = G_COOL_API_DB_GetInt(2);
CNSTI4 2
ARGI4
ADDRLP4 96
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 56
ADDRLP4 96
INDIRI4
ASGNI4
line 783
;783:		diff2 = G_COOL_API_DB_GetInt(3);
CNSTI4 3
ARGI4
ADDRLP4 100
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 100
INDIRI4
ASGNI4
line 784
;784:		if (!resultsFound) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $553
line 785
;785:			mapDefaultsFound = !G_COOL_API_DB_GetInt(4);
CNSTI4 4
ARGI4
ADDRLP4 108
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $556
ADDRLP4 104
CNSTI4 1
ASGNI4
ADDRGP4 $557
JUMPV
LABELV $556
ADDRLP4 104
CNSTI4 0
ASGNI4
LABELV $557
ADDRLP4 64
ADDRLP4 104
INDIRI4
ASGNI4
line 786
;786:			if (mapDefaultsFound) {
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $558
line 787
;787:				memset(&mapDefaultRaceStyle, 0, sizeof(mapDefaultRaceStyle));
ADDRLP4 44
ARGP4
CNSTI4 0
ARGI4
CNSTU4 12
ARGU4
ADDRGP4 memset
CALLP4
pop
line 788
;788:				mapDefaultRaceStyle.msec = G_COOL_API_DB_GetInt(5);
CNSTI4 5
ARGI4
ADDRLP4 112
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 44+2
ADDRLP4 112
INDIRI4
CVII2 4
ASGNI2
line 789
;789:				mapDefaultRaceStyle.jumpLevel = G_COOL_API_DB_GetInt(6);
CNSTI4 6
ARGI4
ADDRLP4 116
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 44+4
ADDRLP4 116
INDIRI4
CVII1 4
ASGNI1
line 790
;790:				mapDefaultRaceStyle.runFlags = G_COOL_API_DB_GetInt(7);
CNSTI4 7
ARGI4
ADDRLP4 120
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 44+8
ADDRLP4 120
INDIRI4
CVII2 4
ASGNI2
line 791
;791:			}
LABELV $558
line 792
;792:			DF_TopRequest(ent, courseName, subCourseName, data.page, data.style,data.type,data.lbTypeIfSpecific,mapDefaultsFound ? &mapDefaultRaceStyle : &defaultRaceStyle);
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 $534
ARGP4
ADDRGP4 $535
ARGP4
ADDRLP4 4+28
INDIRI4
ARGI4
ADDRLP4 4+32
INDIRI4
ARGI4
ADDRLP4 4+20
INDIRI4
ARGI4
ADDRLP4 4+24
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $568
ADDRLP4 112
ADDRLP4 44
ASGNP4
ADDRGP4 $569
JUMPV
LABELV $568
ADDRLP4 112
ADDRGP4 defaultRaceStyle
ASGNP4
LABELV $569
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 DF_TopRequest
CALLV
pop
line 793
;793:		}
LABELV $553
line 794
;794:		if (!subCourseName[0]) {
ADDRGP4 $535
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $570
line 795
;795:			if (g_developer.integer) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
EQI4 $572
line 796
;796:				G_SendServerCommand(ent - g_entities, va("print \"^3%s%s (diff %d %d)\n\"", resultsFound ? "" : "->", courseName, diff, diff2), afterRun);
ADDRGP4 $575
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $578
ADDRLP4 104
ADDRGP4 $330
ASGNP4
ADDRGP4 $579
JUMPV
LABELV $578
ADDRLP4 104
ADDRGP4 $576
ASGNP4
LABELV $579
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 $534
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 797
;797:			}
ADDRGP4 $571
JUMPV
LABELV $572
line 798
;798:			else {
line 799
;799:				G_SendServerCommand(ent - g_entities, va("print \"^3%s%s\n\"", resultsFound ? "" : "->", courseName), afterRun);
ADDRGP4 $580
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $582
ADDRLP4 104
ADDRGP4 $330
ASGNP4
ADDRGP4 $583
JUMPV
LABELV $582
ADDRLP4 104
ADDRGP4 $576
ASGNP4
LABELV $583
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 $534
ARGP4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 800
;800:			}
line 801
;801:		}
ADDRGP4 $571
JUMPV
LABELV $570
line 802
;802:		else {
line 803
;803:			if (g_developer.integer) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
EQI4 $584
line 804
;804:				G_SendServerCommand(ent - g_entities, va("print \"^3%s%s/%s  (diff %d %d)\n\"", resultsFound ? "" : "->", courseName, subCourseName, diff, diff2), afterRun);
ADDRGP4 $587
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $589
ADDRLP4 104
ADDRGP4 $330
ASGNP4
ADDRGP4 $590
JUMPV
LABELV $589
ADDRLP4 104
ADDRGP4 $576
ASGNP4
LABELV $590
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 $534
ARGP4
ADDRGP4 $535
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 805
;805:			}
ADDRGP4 $585
JUMPV
LABELV $584
line 806
;806:			else {
line 807
;807:				G_SendServerCommand(ent - g_entities, va("print \"^3%s%s/%s\n\"", resultsFound ? "" : "->", courseName, subCourseName), afterRun);
ADDRGP4 $591
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $593
ADDRLP4 104
ADDRGP4 $330
ASGNP4
ADDRGP4 $594
JUMPV
LABELV $593
ADDRLP4 104
ADDRGP4 $576
ASGNP4
LABELV $594
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 $534
ARGP4
ADDRGP4 $535
ARGP4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 808
;808:			}
LABELV $585
line 809
;809:		}
LABELV $571
line 810
;810:		resultsFound++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 812
;811:
;812:	}
LABELV $551
line 779
ADDRLP4 96
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $550
line 813
;813:	if (!resultsFound) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $595
line 814
;814:		G_SendServerCommand(ent - g_entities, "print \"^1Nothing.\n\"", afterRun);
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $597
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 815
;815:	}
LABELV $595
line 818
;816:
;817:
;818:}
LABELV $533
endproc G_TopMapSearchResult 124 32
bss
align 1
LABELV $599
skip 101
code
proc G_ArenaGenMapListResult 8 16
line 822
;819:
;820:void G_AutoGenerateArena(const char* thisMapName, qboolean checkBspExists, qboolean immediatePrint, qboolean silentSkip);
;821:
;822:static void G_ArenaGenMapListResult(int status, const char* errorMessage, int affectedRows) {
line 824
;823:	static char courseName[COURSENAME_MAX_LEN + 1];
;824:	int resultsFound = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 826
;825:
;826:	if (level.allRaceGenerationAlreadyCalled) {
ADDRGP4 level+29512
INDIRI4
CNSTI4 0
EQI4 $600
line 827
;827:		G_SendServerCommand(-1, "print \"^1Allrace arena generation already called once during this map.\n\"", qfalse);
CNSTI4 -1
ARGI4
ADDRGP4 $603
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 828
;828:	}
LABELV $600
line 830
;829:
;830:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $604
line 832
;831:		// table doesn't exist. create it.
;832:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 833
;833:		G_SendServerCommand(-1,"print \"^1Searching maps for arena generation failed due to runs table not existing. Attempting to create. Please try again shortly.\n\"",qfalse);
CNSTI4 -1
ARGI4
ADDRGP4 $606
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 834
;834:		return;
ADDRGP4 $598
JUMPV
LABELV $604
line 836
;835:	}
;836:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $611
line 837
;837:		G_SendServerCommand(-1, va("print \"^1Searching maps for arena generation failed with status %d and error message %s.\n\"", status, errorMessage),qfalse);
ADDRGP4 $609
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 838
;838:		return;
ADDRGP4 $598
JUMPV
LABELV $610
line 842
;839:	}
;840:
;841:
;842:	while (G_COOL_API_DB_NextRow()) {
line 843
;843:		G_COOL_API_DB_GetString(0, courseName,sizeof(courseName));
CNSTI4 0
ARGI4
ADDRGP4 $599
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 844
;844:		resultsFound++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 845
;845:		G_AutoGenerateArena(courseName, qtrue, qfalse, qtrue);
ADDRGP4 $599
ARGP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_AutoGenerateArena
CALLV
pop
line 846
;846:		level.allRaceGenerationAlreadyCalled = qtrue;
ADDRGP4 level+29512
CNSTI4 1
ASGNI4
line 847
;847:	}
LABELV $611
line 842
ADDRLP4 4
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $610
line 848
;848:	G_BufferedSendOrPrintFlush(NULL, qtrue);
CNSTP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_BufferedSendOrPrintFlush
CALLV
pop
line 849
;849:	if (!resultsFound) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $614
line 850
;850:		G_SendServerCommand(-1, "print \"^1No maps found for arena generation.\n\"", qtrue);
CNSTI4 -1
ARGI4
ADDRGP4 $616
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 851
;851:	}
LABELV $614
line 854
;852:
;853:
;854:}
LABELV $598
endproc G_ArenaGenMapListResult 8 16
data
align 4
LABELV topNumberStrings
address $617
address $618
address $619
address $620
address $621
address $622
address $623
address $624
address $625
address $626
address $627
bss
align 4
LABELV $629
skip 7260
align 4
LABELV $684
skip 12
code
proc G_TopResult 876 136
line 883
;855:
;856:typedef struct topLeaderBoardEntry_s {
;857:	qboolean exists;
;858:	int besttime, userid, runFlags, msec, jump, runFlagsDiff;
;859:	qboolean mainLBCompatible;
;860:	//raceStyle_t raceStyle;
;861:	float topSpeed, average,distance;
;862:	int savePosCount, resposCount, duration_ms_segmented_total;
;863:	char username[USERNAME_MAX_LEN + 1];
;864:	char time[25];
;865:	char fpsString[40];
;866:} topLeaderBoardEntry_t;
;867:
;868:// cringe :)
;869:static const char* topNumberStrings[] = {
;870:	"01", // linux doesnt like padding strings with 0 so i do it myself :(
;871:	"02",
;872:	"03",
;873:	"04",
;874:	"05",
;875:	"06",
;876:	"07",
;877:	"08",
;878:	"09",
;879:	"10",
;880:	"UL",
;881:};
;882:
;883:static void G_TopResult(int status, const char* errorMessage, int affectedRows) {
line 885
;884:	topScoresRequestStruct_t lbRequestData;
;885:	gentity_t* ent = NULL;
ADDRLP4 268
CNSTP4 0
ASGNP4
line 886
;886:	int currentType = -1;
ADDRLP4 264
CNSTI4 -1
ASGNI4
line 888
;887:	//int rank = 1;
;888:	int maxrank = 0;
ADDRLP4 260
CNSTI4 0
ASGNI4
line 894
;889:	int i;
;890:	int	offsetRank;
;891:	static topLeaderBoardEntry_t entries[11][LB_TYPES_COUNT];
;892:	//evaluatedRunInfo_t eRunInfo;
;893:
;894:	G_COOL_API_DB_GetReference((byte*)&lbRequestData, sizeof(lbRequestData));
ADDRLP4 4
ARGP4
CNSTI4 252
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 896
;895:
;896:	if (!(ent = DB_VerifyClient(lbRequestData.clientnum, lbRequestData.ip))) {
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 272
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 268
ADDRLP4 272
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $630
line 897
;897:		Com_Printf("^1Client %d top results returned, user no longer valid.\n", lbRequestData.clientnum);
ADDRGP4 $633
ARGP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 898
;898:		return;
ADDRGP4 $628
JUMPV
LABELV $630
line 901
;899:	}
;900:
;901:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $635
line 903
;902:		// table doesn't exist. create it.
;903:		G_CreateUserTable();
ADDRGP4 G_CreateUserTable
CALLV
pop
line 904
;904:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 905
;905:		trap_SendServerCommand(lbRequestData.clientnum,"print \"^1Leaderboard display failed due to table not existing. Attempting to create. Please try again shortly.\n\"");
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRGP4 $638
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 906
;906:		return;
ADDRGP4 $628
JUMPV
LABELV $635
line 908
;907:	}
;908:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $639
line 909
;909:		trap_SendServerCommand(lbRequestData.clientnum, va("print \"^1Leaderboard display failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $642
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 276
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 910
;910:		return;
ADDRGP4 $628
JUMPV
LABELV $639
line 913
;911:	}
;912:
;913:	trap_SendServerCommand(lbRequestData.clientnum, va("print \"^BTop %s times on course '%s':\n",lbRequestData.style < MV_NUMSTYLES ? moveStyleNames[lbRequestData.style].string : "UNKNOWN STYLE",lbRequestData.subcourse[0] ? multiva("%s/%s", lbRequestData.course, lbRequestData.subcourse) : lbRequestData.course));
ADDRLP4 4+145
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $655
ADDRGP4 $650
ARGP4
ADDRLP4 4+44
ARGP4
ADDRLP4 4+145
ARGP4
ADDRLP4 284
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 276
ADDRLP4 284
INDIRP4
ASGNP4
ADDRGP4 $656
JUMPV
LABELV $655
ADDRLP4 276
ADDRLP4 4+44
ASGNP4
LABELV $656
ADDRGP4 $644
ARGP4
ADDRLP4 4+248
INDIRI4
CNSTI4 13
GEI4 $657
ADDRLP4 280
ADDRLP4 4+248
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $658
JUMPV
LABELV $657
ADDRLP4 280
ADDRGP4 $647
ASGNP4
LABELV $658
ADDRLP4 280
INDIRP4
ARGP4
ADDRLP4 276
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 288
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 915
;914:
;915:	memset(entries, 0, sizeof(entries));
ADDRGP4 $629
ARGP4
CNSTI4 0
ARGI4
CNSTU4 7260
ARGU4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 $660
JUMPV
LABELV $659
line 917
;916:
;917:	while (G_COOL_API_DB_NextRow()) {
line 921
;918:		int type, userid, rankHere;
;919:		int realRank;
;920:		topLeaderBoardEntry_t* entry;
;921:		type = G_COOL_API_DB_GetInt(0);
CNSTI4 0
ARGI4
ADDRLP4 312
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 312
INDIRI4
ASGNI4
line 922
;922:		userid = G_COOL_API_DB_GetInt(3);
CNSTI4 3
ARGI4
ADDRLP4 316
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 304
ADDRLP4 316
INDIRI4
ASGNI4
line 923
;923:		realRank = G_COOL_API_DB_GetInt(14);
CNSTI4 14
ARGI4
ADDRLP4 320
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 308
ADDRLP4 320
INDIRI4
ASGNI4
line 924
;924:		if (lbRequestData.type == TOPREQUEST_SPECIFICLB && type != lbRequestData.lbTypeIfSpecific) continue;
ADDRLP4 4+20
INDIRI4
CNSTI4 1
NEI4 $662
ADDRLP4 296
INDIRI4
ADDRLP4 4+24
INDIRI4
EQI4 $662
ADDRGP4 $660
JUMPV
LABELV $662
line 925
;925:		if (type != currentType) {
ADDRLP4 296
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $666
line 926
;926:			currentType = type;
ADDRLP4 264
ADDRLP4 296
INDIRI4
ASGNI4
line 929
;927:			//rank = 1;
;928:			//trap_SendServerCommand(lbRequestData.clientnum, va("print \"\n^2Leaderboard type %d.\n\"", currentType));
;929:		}
LABELV $666
line 931
;930:		//if (rank > 9) continue;
;931:		rankHere = userid == -1 ? 10 : realRank-1-lbRequestData.page*10;
ADDRLP4 304
INDIRI4
CNSTI4 -1
NEI4 $670
ADDRLP4 324
CNSTI4 10
ASGNI4
ADDRGP4 $671
JUMPV
LABELV $670
ADDRLP4 324
ADDRLP4 308
INDIRI4
CNSTI4 1
SUBI4
CNSTI4 10
ADDRLP4 4+40
INDIRI4
MULI4
SUBI4
ASGNI4
LABELV $671
ADDRLP4 300
ADDRLP4 324
INDIRI4
ASGNI4
line 932
;932:		if (rankHere > 10 || rankHere < 0) continue;
ADDRLP4 300
INDIRI4
CNSTI4 10
GTI4 $674
ADDRLP4 300
INDIRI4
CNSTI4 0
GEI4 $672
LABELV $674
ADDRGP4 $660
JUMPV
LABELV $672
line 933
;933:		entry = &entries[rankHere][type]; // unofficial go at the end.
ADDRLP4 292
CNSTI4 132
ADDRLP4 296
INDIRI4
MULI4
CNSTI4 660
ADDRLP4 300
INDIRI4
MULI4
ADDRGP4 $629
ADDP4
ADDP4
ASGNP4
line 934
;934:		entry->exists = qtrue;
ADDRLP4 292
INDIRP4
CNSTI4 1
ASGNI4
line 935
;935:		if (userid == -1) {
ADDRLP4 304
INDIRI4
CNSTI4 -1
NEI4 $675
line 936
;936:			Q_strncpyz(entry->username, "!unlogged!", sizeof(entry->username));
ADDRLP4 292
INDIRP4
CNSTI4 56
ADDP4
ARGP4
ADDRGP4 $677
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 937
;937:		}
ADDRGP4 $676
JUMPV
LABELV $675
line 938
;938:		else {
line 939
;939:			G_COOL_API_DB_GetString(1, entry->username, sizeof(entry->username));
CNSTI4 1
ARGI4
ADDRLP4 292
INDIRP4
CNSTI4 56
ADDP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 940
;940:		}
LABELV $676
line 941
;941:		entry->besttime = G_COOL_API_DB_GetInt(2);
CNSTI4 2
ARGI4
ADDRLP4 332
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 292
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 332
INDIRI4
ASGNI4
line 942
;942:		entry->runFlags = G_COOL_API_DB_GetInt(4);
CNSTI4 4
ARGI4
ADDRLP4 336
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 336
INDIRI4
ASGNI4
line 943
;943:		entry->runFlagsDiff = (entry->runFlags ^ lbRequestData.mapDefaultRaceStyle.runFlags) & entry->runFlags; // show all that are active that are different from default
ADDRLP4 344
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
ADDRLP4 292
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 344
INDIRI4
ADDRLP4 4+28+8
INDIRI2
CVII4 2
BXORI4
ADDRLP4 344
INDIRI4
BANDI4
ASGNI4
line 944
;944:		entry->msec = G_COOL_API_DB_GetInt(5);
CNSTI4 5
ARGI4
ADDRLP4 348
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 348
INDIRI4
ASGNI4
line 945
;945:		entry->jump = G_COOL_API_DB_GetInt(6);
CNSTI4 6
ARGI4
ADDRLP4 352
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 292
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 352
INDIRI4
ASGNI4
line 946
;946:		G_COOL_API_DB_GetFloat(7,&entry->topSpeed);
CNSTI4 7
ARGI4
ADDRLP4 292
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 947
;947:		G_COOL_API_DB_GetFloat(8,&entry->average);
CNSTI4 8
ARGI4
ADDRLP4 292
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 948
;948:		G_COOL_API_DB_GetFloat(15,&entry->distance);
CNSTI4 15
ARGI4
ADDRLP4 292
INDIRP4
CNSTI4 40
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 949
;949:		G_COOL_API_DB_GetString(9,entry->time,sizeof(entry->time));
CNSTI4 9
ARGI4
ADDRLP4 292
INDIRP4
CNSTI4 67
ADDP4
ARGP4
CNSTI4 25
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 950
;950:		entry->savePosCount = G_COOL_API_DB_GetInt(10);
CNSTI4 10
ARGI4
ADDRLP4 356
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 292
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 951
;951:		entry->resposCount = G_COOL_API_DB_GetInt(11);
CNSTI4 11
ARGI4
ADDRLP4 360
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 292
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 360
INDIRI4
ASGNI4
line 952
;952:		entry->duration_ms_segmented_total = G_COOL_API_DB_GetInt(12);
CNSTI4 12
ARGI4
ADDRLP4 364
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 292
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 364
INDIRI4
ASGNI4
line 953
;953:		if (entry->msec == -1) {
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $680
line 954
;954:			G_COOL_API_DB_GetString(13, entry->fpsString, sizeof(entry->fpsString));
CNSTI4 13
ARGI4
ADDRLP4 292
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 40
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 955
;955:			Q_strncpyz(entry->fpsString, DF_FormatFpsString(entry->fpsString), sizeof(entry->fpsString));
ADDRLP4 292
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 368
ADDRGP4 DF_FormatFpsString
CALLP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 368
INDIRP4
ARGP4
CNSTI4 40
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 956
;956:		}
LABELV $680
line 957
;957:		if (type == LB_SEGMENTED) {
ADDRLP4 296
INDIRI4
CNSTI4 3
NEI4 $682
line 959
;958:			static raceStyle_t raceStyle;
;959:			memset(&raceStyle,0,sizeof(raceStyle));
ADDRGP4 $684
ARGP4
CNSTI4 0
ARGI4
CNSTU4 12
ARGU4
ADDRGP4 memset
CALLP4
pop
line 960
;960:			raceStyle.msec = entry->msec;
ADDRGP4 $684+2
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVII2 4
ASGNI2
line 961
;961:			raceStyle.runFlags = entry->runFlags;
ADDRGP4 $684+8
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVII2 4
ASGNI2
line 962
;962:			raceStyle.jumpLevel = entry->jump;
ADDRGP4 $684+4
ADDRLP4 292
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVII1 4
ASGNI1
line 963
;963:			raceStyle.runFlags &= ~RFL_SEGMENTED;
ADDRLP4 368
ADDRGP4 $684+8
ASGNP4
ADDRLP4 368
INDIRP4
ADDRLP4 368
INDIRP4
INDIRI2
CVII4 2
CNSTI4 -33
BANDI4
CVII2 4
ASGNI2
line 964
;964:			entry->mainLBCompatible = classifyLeaderBoard(&raceStyle,&lbRequestData.mapDefaultRaceStyle) == LB_MAIN;
ADDRGP4 $684
ARGP4
ADDRLP4 4+28
ARGP4
ADDRLP4 376
ADDRGP4 classifyLeaderBoard
CALLI4
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 0
NEI4 $691
ADDRLP4 372
CNSTI4 1
ASGNI4
ADDRGP4 $692
JUMPV
LABELV $691
ADDRLP4 372
CNSTI4 0
ASGNI4
LABELV $692
ADDRLP4 292
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 372
INDIRI4
ASGNI4
line 965
;965:		}
ADDRGP4 $683
JUMPV
LABELV $682
line 966
;966:		else {
line 967
;967:			entry->mainLBCompatible = qfalse;
ADDRLP4 292
INDIRP4
CNSTI4 28
ADDP4
CNSTI4 0
ASGNI4
line 968
;968:		}
LABELV $683
line 969
;969:		if (userid != -1) {
ADDRLP4 304
INDIRI4
CNSTI4 -1
EQI4 $693
line 972
;970:			//trap_SendServerCommand(lbRequestData.clientnum, va("print \"^1#%d %-10s %10s.\n\"", rank, userid == -1 ? "!unlogged!": username, DF_MsToString(besttime)));
;971:			//maxrank = MAX(maxrank, rank);
;972:			maxrank = MAX(maxrank, rankHere+1);
ADDRLP4 260
INDIRI4
ADDRLP4 300
INDIRI4
CNSTI4 1
ADDI4
LEI4 $696
ADDRLP4 368
ADDRLP4 260
INDIRI4
ASGNI4
ADDRGP4 $697
JUMPV
LABELV $696
ADDRLP4 368
ADDRLP4 300
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $697
ADDRLP4 260
ADDRLP4 368
INDIRI4
ASGNI4
line 974
;973:			//rank++;
;974:		}
LABELV $693
line 975
;975:	}
LABELV $660
line 917
ADDRLP4 292
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $659
line 992
;976:
;977:	// TODO how to not make it look bad at page 9 or so? when it goes from 99 to 100?
;978:#define TOPNUMBERSTRING (i == 10 ? "UL" : (offsetRank<10 ? topNumberStrings[i] : miniva("%d",offsetRank+1)))
;979:#define MSECSTRING(msec) ((msec) == -1 ? "togl" : ((msec) == -2 ? "flt" : ((msec) == 0 ? "unkn" : multiva("%d", 1000 / (msec)))))
;980:#define LBROW(lbType,coloration,jumpvalue) !entriesHere[lbType].exists ? ' ' :'#', !entriesHere[lbType].exists ? "  " : TOPNUMBERSTRING, coloration(entriesHere[lbType]), entriesHere[lbType].exists ? entriesHere[lbType].username : "", entriesHere[lbType].exists ? MSECSTRING(entriesHere[lbType].msec) : "" jumpvalue(entriesHere[lbType],lbType), !entriesHere[lbType].exists ? "" : DF_MsToString(entriesHere[lbType].besttime)
;981:
;982:#define LBROWFULL_STRING "  ^c%11s  %11s  %11s  %s"
;983:
;984:#define LBROWFULL(lbType,coloration,jumpvalue) LBROW(lbType,coloration,jumpvalue),!entriesHere[lbType].exists ? "" :miniva("%.2favg",entriesHere[lbType].average),!entriesHere[lbType].exists ? "" :miniva("%.2ftop",entriesHere[lbType].topSpeed),!entriesHere[lbType].exists ? "" :miniva("%ddist",(int)entriesHere[lbType].distance),!entriesHere[lbType].exists ? "" :entriesHere[lbType].time
;985:
;986:#define JUMPVALUE(a,b) ,entriesHere[b].exists ? 'j':' ' ,(entriesHere[b].exists ? miniva("%-2d",(a).jump) : "  ")
;987:#define JUMPVALUE_EMPTY(a,b) 
;988:#define TIMECOLOR_DEFAULT(a) '7'
;989:#define TIMECOLOR_CHEAT(a) ((((a).runFlags & RFL_TAS)||((a).runFlags & RFL_BOT)) ? (((a).runFlags & RFL_SEGMENTED) ? 'j':'1') : '7' )
;990:#define TIMECOLOR_CUSTOM(a) (((a).runFlagsDiff & RFL_CLIMBTECH) ? 'E':'7')
;991:#define TIMECOLOR_SEGMENTED(a) ((a).mainLBCompatible ? '2':'7')
;992:	if (lbRequestData.type == TOPREQUEST_SPECIFICLB) {
ADDRLP4 4+20
INDIRI4
CNSTI4 1
NEI4 $698
line 993
;993:		trap_SendServerCommand(lbRequestData.clientnum, va("print \"^2    %-27s\n\"", leaderboardNames[lbRequestData.lbTypeIfSpecific].string));
ADDRGP4 $702
ARGP4
ADDRLP4 4+24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 leaderboardNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 994
;994:	} 
ADDRGP4 $699
JUMPV
LABELV $698
line 995
;995:	else {
line 996
;996:		trap_SendServerCommand(lbRequestData.clientnum, va("print \"^2    %-27s^h|     ^2%-27s^h|     ^2%-31s^h|     ^2%-27s^h|     ^2%-29s\n\"", "MAIN","NOJUMPBUG","CUSTOM","SEGMENTED", "CHEAT"));
ADDRGP4 $705
ARGP4
ADDRGP4 $706
ARGP4
ADDRGP4 $707
ARGP4
ADDRGP4 $708
ARGP4
ADDRGP4 $709
ARGP4
ADDRGP4 $710
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 997
;997:	}
LABELV $699
line 998
;998:	offsetRank = lbRequestData.page * 10;
ADDRLP4 256
CNSTI4 10
ADDRLP4 4+40
INDIRI4
MULI4
ASGNI4
line 999
;999:	for (i = 0; i < 11; i++, offsetRank++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $712
line 1000
;1000:		topLeaderBoardEntry_t* entriesHere = entries[i];
ADDRLP4 296
CNSTI4 660
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 $629
ADDP4
ASGNP4
line 1001
;1001:		if (i >= maxrank && i < 10) continue;
ADDRLP4 0
INDIRI4
ADDRLP4 260
INDIRI4
LTI4 $716
ADDRLP4 0
INDIRI4
CNSTI4 10
GEI4 $716
ADDRGP4 $713
JUMPV
LABELV $716
line 1003
;1002:
;1003:		if(lbRequestData.type == TOPREQUEST_SPECIFICLB){
ADDRLP4 4+20
INDIRI4
CNSTI4 1
NEI4 $718
line 1004
;1004:			switch (lbRequestData.lbTypeIfSpecific) {
ADDRLP4 304
ADDRLP4 4+24
INDIRI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
LTI4 $719
ADDRLP4 304
INDIRI4
CNSTI4 4
GTI4 $719
ADDRLP4 304
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1018
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1018
address $725
address $782
address $829
address $897
address $956
code
LABELV $725
line 1006
;1005:			case LB_MAIN:
;1006:				trap_SendServerCommand(lbRequestData.clientnum, va("print \"%s^7"
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $752
ADDRLP4 312
ADDRGP4 $731
ASGNP4
ADDRGP4 $753
JUMPV
LABELV $752
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $754
ADDRLP4 316
ADDRGP4 $627
ASGNP4
ADDRGP4 $755
JUMPV
LABELV $754
ADDRLP4 256
INDIRI4
CNSTI4 10
GEI4 $756
ADDRLP4 320
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 topNumberStrings
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $757
JUMPV
LABELV $756
ADDRGP4 $732
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 372
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 320
ADDRLP4 372
INDIRP4
ASGNP4
LABELV $757
ADDRLP4 316
ADDRLP4 320
INDIRP4
ASGNP4
LABELV $755
ADDRLP4 312
ADDRLP4 316
INDIRP4
ASGNP4
LABELV $753
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $758
ADDRLP4 296
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $760
ADDRLP4 328
ADDRGP4 $737
ASGNP4
ADDRGP4 $761
JUMPV
LABELV $760
ADDRLP4 296
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $762
ADDRLP4 332
ADDRGP4 $738
ASGNP4
ADDRGP4 $763
JUMPV
LABELV $762
ADDRLP4 296
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $764
ADDRLP4 336
ADDRGP4 $739
ASGNP4
ADDRGP4 $765
JUMPV
LABELV $764
ADDRGP4 $732
ARGP4
CNSTI4 1000
ADDRLP4 296
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
DIVI4
ARGI4
ADDRLP4 376
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 336
ADDRLP4 376
INDIRP4
ASGNP4
LABELV $765
ADDRLP4 332
ADDRLP4 336
INDIRP4
ASGNP4
LABELV $763
ADDRLP4 328
ADDRLP4 332
INDIRP4
ASGNP4
LABELV $761
ADDRLP4 324
ADDRLP4 328
INDIRP4
ASGNP4
ADDRGP4 $759
JUMPV
LABELV $758
ADDRLP4 324
ADDRGP4 $330
ASGNP4
LABELV $759
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $766
ADDRLP4 340
ADDRGP4 $330
ASGNP4
ADDRGP4 $767
JUMPV
LABELV $766
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 380
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRLP4 340
ADDRLP4 380
INDIRP4
ASGNP4
LABELV $767
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $768
ADDRLP4 344
ADDRGP4 $330
ASGNP4
ADDRGP4 $769
JUMPV
LABELV $768
ADDRGP4 $745
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 384
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 344
ADDRLP4 384
INDIRP4
ASGNP4
LABELV $769
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $770
ADDRLP4 348
ADDRGP4 $330
ASGNP4
ADDRGP4 $771
JUMPV
LABELV $770
ADDRGP4 $747
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ARGF4
ADDRLP4 388
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 348
ADDRLP4 388
INDIRP4
ASGNP4
LABELV $771
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $772
ADDRLP4 352
ADDRGP4 $330
ASGNP4
ADDRGP4 $773
JUMPV
LABELV $772
ADDRGP4 $749
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 392
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 352
ADDRLP4 392
INDIRP4
ASGNP4
LABELV $773
ADDRGP4 $727
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $774
ADDRLP4 356
ADDRGP4 $728
ASGNP4
ADDRGP4 $775
JUMPV
LABELV $774
ADDRLP4 356
ADDRGP4 $330
ASGNP4
LABELV $775
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $776
ADDRLP4 360
CNSTI4 32
ASGNI4
ADDRGP4 $777
JUMPV
LABELV $776
ADDRLP4 360
CNSTI4 35
ASGNI4
LABELV $777
ADDRLP4 360
INDIRI4
ARGI4
ADDRLP4 312
INDIRP4
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $778
ADDRLP4 364
ADDRLP4 296
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRGP4 $779
JUMPV
LABELV $778
ADDRLP4 364
ADDRGP4 $330
ASGNP4
LABELV $779
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 324
INDIRP4
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $780
ADDRLP4 368
ADDRGP4 $330
ASGNP4
ADDRGP4 $781
JUMPV
LABELV $780
ADDRLP4 368
ADDRLP4 296
INDIRP4
CNSTI4 67
ADDP4
ASGNP4
LABELV $781
ADDRLP4 368
INDIRP4
ARGP4
ADDRLP4 396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 396
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1012
;1007:					"^J%c%02s^%c %-10s ^c%4s ^u%10s" LBROWFULL_STRING
;1008:					"\n\"",
;1009:					i == 10 ? "\n" : "",
;1010:					LBROWFULL(LB_MAIN, TIMECOLOR_DEFAULT, JUMPVALUE_EMPTY)
;1011:				));
;1012:				break;
ADDRGP4 $719
JUMPV
LABELV $782
line 1014
;1013:			case LB_NOJUMPBUG:
;1014:				trap_SendServerCommand(lbRequestData.clientnum, va("print \"%s^7"
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
NEI4 $799
ADDRLP4 400
ADDRGP4 $731
ASGNP4
ADDRGP4 $800
JUMPV
LABELV $799
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $801
ADDRLP4 404
ADDRGP4 $627
ASGNP4
ADDRGP4 $802
JUMPV
LABELV $801
ADDRLP4 256
INDIRI4
CNSTI4 10
GEI4 $803
ADDRLP4 408
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 topNumberStrings
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $804
JUMPV
LABELV $803
ADDRGP4 $732
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 460
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 408
ADDRLP4 460
INDIRP4
ASGNP4
LABELV $804
ADDRLP4 404
ADDRLP4 408
INDIRP4
ASGNP4
LABELV $802
ADDRLP4 400
ADDRLP4 404
INDIRP4
ASGNP4
LABELV $800
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
EQI4 $805
ADDRLP4 296
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $807
ADDRLP4 416
ADDRGP4 $737
ASGNP4
ADDRGP4 $808
JUMPV
LABELV $807
ADDRLP4 296
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $809
ADDRLP4 420
ADDRGP4 $738
ASGNP4
ADDRGP4 $810
JUMPV
LABELV $809
ADDRLP4 296
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
NEI4 $811
ADDRLP4 424
ADDRGP4 $739
ASGNP4
ADDRGP4 $812
JUMPV
LABELV $811
ADDRGP4 $732
ARGP4
CNSTI4 1000
ADDRLP4 296
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
DIVI4
ARGI4
ADDRLP4 464
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 424
ADDRLP4 464
INDIRP4
ASGNP4
LABELV $812
ADDRLP4 420
ADDRLP4 424
INDIRP4
ASGNP4
LABELV $810
ADDRLP4 416
ADDRLP4 420
INDIRP4
ASGNP4
LABELV $808
ADDRLP4 412
ADDRLP4 416
INDIRP4
ASGNP4
ADDRGP4 $806
JUMPV
LABELV $805
ADDRLP4 412
ADDRGP4 $330
ASGNP4
LABELV $806
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
NEI4 $813
ADDRLP4 428
ADDRGP4 $330
ASGNP4
ADDRGP4 $814
JUMPV
LABELV $813
ADDRLP4 296
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ARGI4
ADDRLP4 468
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRLP4 428
ADDRLP4 468
INDIRP4
ASGNP4
LABELV $814
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
NEI4 $815
ADDRLP4 432
ADDRGP4 $330
ASGNP4
ADDRGP4 $816
JUMPV
LABELV $815
ADDRGP4 $745
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 168
ADDP4
INDIRF4
ARGF4
ADDRLP4 472
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 432
ADDRLP4 472
INDIRP4
ASGNP4
LABELV $816
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
NEI4 $817
ADDRLP4 436
ADDRGP4 $330
ASGNP4
ADDRGP4 $818
JUMPV
LABELV $817
ADDRGP4 $747
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 164
ADDP4
INDIRF4
ARGF4
ADDRLP4 476
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 436
ADDRLP4 476
INDIRP4
ASGNP4
LABELV $818
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
NEI4 $819
ADDRLP4 440
ADDRGP4 $330
ASGNP4
ADDRGP4 $820
JUMPV
LABELV $819
ADDRGP4 $749
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 172
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 480
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 440
ADDRLP4 480
INDIRP4
ASGNP4
LABELV $820
ADDRGP4 $727
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $821
ADDRLP4 444
ADDRGP4 $728
ASGNP4
ADDRGP4 $822
JUMPV
LABELV $821
ADDRLP4 444
ADDRGP4 $330
ASGNP4
LABELV $822
ADDRLP4 444
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
NEI4 $823
ADDRLP4 448
CNSTI4 32
ASGNI4
ADDRGP4 $824
JUMPV
LABELV $823
ADDRLP4 448
CNSTI4 35
ASGNI4
LABELV $824
ADDRLP4 448
INDIRI4
ARGI4
ADDRLP4 400
INDIRP4
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
EQI4 $825
ADDRLP4 452
ADDRLP4 296
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRGP4 $826
JUMPV
LABELV $825
ADDRLP4 452
ADDRGP4 $330
ASGNP4
LABELV $826
ADDRLP4 452
INDIRP4
ARGP4
ADDRLP4 412
INDIRP4
ARGP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRLP4 432
INDIRP4
ARGP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 440
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
NEI4 $827
ADDRLP4 456
ADDRGP4 $330
ASGNP4
ADDRGP4 $828
JUMPV
LABELV $827
ADDRLP4 456
ADDRLP4 296
INDIRP4
CNSTI4 199
ADDP4
ASGNP4
LABELV $828
ADDRLP4 456
INDIRP4
ARGP4
ADDRLP4 484
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 484
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1020
;1015:					"^J%c%02s^%c %-10s ^c%4s ^u%10s" LBROWFULL_STRING
;1016:					"\n\"",
;1017:					i == 10 ? "\n" : "",
;1018:					LBROWFULL(LB_NOJUMPBUG, TIMECOLOR_DEFAULT, JUMPVALUE_EMPTY)
;1019:				));
;1020:				break;
ADDRGP4 $719
JUMPV
LABELV $829
line 1022
;1021:			case LB_CUSTOM:
;1022:				trap_SendServerCommand(lbRequestData.clientnum, va("print \"%s^7"
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
NEI4 $856
ADDRLP4 488
ADDRGP4 $731
ASGNP4
ADDRGP4 $857
JUMPV
LABELV $856
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $858
ADDRLP4 492
ADDRGP4 $627
ASGNP4
ADDRGP4 $859
JUMPV
LABELV $858
ADDRLP4 256
INDIRI4
CNSTI4 10
GEI4 $860
ADDRLP4 496
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 topNumberStrings
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $861
JUMPV
LABELV $860
ADDRGP4 $732
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 568
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 496
ADDRLP4 568
INDIRP4
ASGNP4
LABELV $861
ADDRLP4 492
ADDRLP4 496
INDIRP4
ASGNP4
LABELV $859
ADDRLP4 488
ADDRLP4 492
INDIRP4
ASGNP4
LABELV $857
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $862
ADDRLP4 296
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $864
ADDRLP4 504
ADDRGP4 $737
ASGNP4
ADDRGP4 $865
JUMPV
LABELV $864
ADDRLP4 296
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $866
ADDRLP4 508
ADDRGP4 $738
ASGNP4
ADDRGP4 $867
JUMPV
LABELV $866
ADDRLP4 296
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $868
ADDRLP4 512
ADDRGP4 $739
ASGNP4
ADDRGP4 $869
JUMPV
LABELV $868
ADDRGP4 $732
ARGP4
CNSTI4 1000
ADDRLP4 296
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
DIVI4
ARGI4
ADDRLP4 572
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 512
ADDRLP4 572
INDIRP4
ASGNP4
LABELV $869
ADDRLP4 508
ADDRLP4 512
INDIRP4
ASGNP4
LABELV $867
ADDRLP4 504
ADDRLP4 508
INDIRP4
ASGNP4
LABELV $865
ADDRLP4 500
ADDRLP4 504
INDIRP4
ASGNP4
ADDRGP4 $863
JUMPV
LABELV $862
ADDRLP4 500
ADDRGP4 $330
ASGNP4
LABELV $863
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $870
ADDRGP4 $844
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 576
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 516
ADDRLP4 576
INDIRP4
ASGNP4
ADDRGP4 $871
JUMPV
LABELV $870
ADDRLP4 516
ADDRGP4 $731
ASGNP4
LABELV $871
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
NEI4 $872
ADDRLP4 520
ADDRGP4 $330
ASGNP4
ADDRGP4 $873
JUMPV
LABELV $872
ADDRLP4 296
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ARGI4
ADDRLP4 580
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRLP4 520
ADDRLP4 580
INDIRP4
ASGNP4
LABELV $873
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
NEI4 $874
ADDRLP4 524
ADDRGP4 $330
ASGNP4
ADDRGP4 $875
JUMPV
LABELV $874
ADDRGP4 $745
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 300
ADDP4
INDIRF4
ARGF4
ADDRLP4 584
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 524
ADDRLP4 584
INDIRP4
ASGNP4
LABELV $875
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
NEI4 $876
ADDRLP4 528
ADDRGP4 $330
ASGNP4
ADDRGP4 $877
JUMPV
LABELV $876
ADDRGP4 $747
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 296
ADDP4
INDIRF4
ARGF4
ADDRLP4 588
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 588
INDIRP4
ASGNP4
LABELV $877
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
NEI4 $878
ADDRLP4 532
ADDRGP4 $330
ASGNP4
ADDRGP4 $879
JUMPV
LABELV $878
ADDRGP4 $749
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 304
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 592
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 532
ADDRLP4 592
INDIRP4
ASGNP4
LABELV $879
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
NEI4 $880
ADDRLP4 536
ADDRGP4 $330
ASGNP4
ADDRGP4 $881
JUMPV
LABELV $880
ADDRLP4 296
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRLP4 4+28+8
INDIRI2
CVII4 2
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 596
CNSTP4 0
ASGNP4
ADDRLP4 596
INDIRP4
ARGP4
ADDRLP4 596
INDIRP4
ARGP4
ADDRLP4 600
ADDRGP4 RunFlagsToString
CALLP4
ASGNP4
ADDRLP4 536
ADDRLP4 600
INDIRP4
ASGNP4
LABELV $881
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $884
ADDRLP4 296
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $882
LABELV $884
ADDRLP4 540
ADDRGP4 $330
ASGNP4
ADDRGP4 $883
JUMPV
LABELV $882
ADDRGP4 $854
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 356
ADDP4
ARGP4
ADDRLP4 608
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 540
ADDRLP4 608
INDIRP4
ASGNP4
LABELV $883
ADDRGP4 $831
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $885
ADDRLP4 544
ADDRGP4 $728
ASGNP4
ADDRGP4 $886
JUMPV
LABELV $885
ADDRLP4 544
ADDRGP4 $330
ASGNP4
LABELV $886
ADDRLP4 544
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
NEI4 $887
ADDRLP4 548
CNSTI4 32
ASGNI4
ADDRGP4 $888
JUMPV
LABELV $887
ADDRLP4 548
CNSTI4 35
ASGNI4
LABELV $888
ADDRLP4 548
INDIRI4
ARGI4
ADDRLP4 488
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $889
ADDRLP4 552
CNSTI4 69
ASGNI4
ADDRGP4 $890
JUMPV
LABELV $889
ADDRLP4 552
CNSTI4 55
ASGNI4
LABELV $890
ADDRLP4 552
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $891
ADDRLP4 556
ADDRLP4 296
INDIRP4
CNSTI4 320
ADDP4
ASGNP4
ADDRGP4 $892
JUMPV
LABELV $891
ADDRLP4 556
ADDRGP4 $330
ASGNP4
LABELV $892
ADDRLP4 556
INDIRP4
ARGP4
ADDRLP4 500
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $893
ADDRLP4 560
CNSTI4 106
ASGNI4
ADDRGP4 $894
JUMPV
LABELV $893
ADDRLP4 560
CNSTI4 32
ASGNI4
LABELV $894
ADDRLP4 560
INDIRI4
ARGI4
ADDRLP4 516
INDIRP4
ARGP4
ADDRLP4 520
INDIRP4
ARGP4
ADDRLP4 524
INDIRP4
ARGP4
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 532
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
NEI4 $895
ADDRLP4 564
ADDRGP4 $330
ASGNP4
ADDRGP4 $896
JUMPV
LABELV $895
ADDRLP4 564
ADDRLP4 296
INDIRP4
CNSTI4 331
ADDP4
ASGNP4
LABELV $896
ADDRLP4 564
INDIRP4
ARGP4
ADDRLP4 536
INDIRP4
ARGP4
ADDRLP4 540
INDIRP4
ARGP4
ADDRLP4 612
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 612
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1030
;1023:					"^J%c%02s^%c %-10s ^c%4s %c%s ^u%10s" LBROWFULL_STRING "  ^c%s%s"
;1024:					"\n\"",
;1025:					i == 10 ? "\n" : "",
;1026:					LBROWFULL(LB_CUSTOM, TIMECOLOR_CUSTOM, JUMPVALUE),
;1027:					!entriesHere[LB_CUSTOM].exists? "" : RunFlagsToString(entriesHere[LB_CUSTOM].runFlags, lbRequestData.mapDefaultRaceStyle.runFlags /*defaultRunFlags level.mapDefaultRaceStyle.runFlags*/, 1, NULL, NULL), // todo make it relative to the relevant map
;1028:					(!entriesHere[LB_CUSTOM].exists || entriesHere[LB_CUSTOM].msec != -1) ? "" : multiva(" fps:%s", entriesHere[LB_CUSTOM].fpsString)
;1029:				));
;1030:				break;
ADDRGP4 $719
JUMPV
LABELV $897
line 1032
;1031:			case LB_SEGMENTED:
;1032:				trap_SendServerCommand(lbRequestData.clientnum, va("print \"%s^7"
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
NEI4 $919
ADDRLP4 616
ADDRGP4 $731
ASGNP4
ADDRGP4 $920
JUMPV
LABELV $919
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $921
ADDRLP4 620
ADDRGP4 $627
ASGNP4
ADDRGP4 $922
JUMPV
LABELV $921
ADDRLP4 256
INDIRI4
CNSTI4 10
GEI4 $923
ADDRLP4 624
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 topNumberStrings
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $924
JUMPV
LABELV $923
ADDRGP4 $732
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 688
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 624
ADDRLP4 688
INDIRP4
ASGNP4
LABELV $924
ADDRLP4 620
ADDRLP4 624
INDIRP4
ASGNP4
LABELV $922
ADDRLP4 616
ADDRLP4 620
INDIRP4
ASGNP4
LABELV $920
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $925
ADDRLP4 296
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $927
ADDRLP4 632
ADDRGP4 $737
ASGNP4
ADDRGP4 $928
JUMPV
LABELV $927
ADDRLP4 296
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $929
ADDRLP4 636
ADDRGP4 $738
ASGNP4
ADDRGP4 $930
JUMPV
LABELV $929
ADDRLP4 296
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $931
ADDRLP4 640
ADDRGP4 $739
ASGNP4
ADDRGP4 $932
JUMPV
LABELV $931
ADDRGP4 $732
ARGP4
CNSTI4 1000
ADDRLP4 296
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
DIVI4
ARGI4
ADDRLP4 692
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 640
ADDRLP4 692
INDIRP4
ASGNP4
LABELV $932
ADDRLP4 636
ADDRLP4 640
INDIRP4
ASGNP4
LABELV $930
ADDRLP4 632
ADDRLP4 636
INDIRP4
ASGNP4
LABELV $928
ADDRLP4 628
ADDRLP4 632
INDIRP4
ASGNP4
ADDRGP4 $926
JUMPV
LABELV $925
ADDRLP4 628
ADDRGP4 $330
ASGNP4
LABELV $926
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
NEI4 $933
ADDRLP4 644
ADDRGP4 $330
ASGNP4
ADDRGP4 $934
JUMPV
LABELV $933
ADDRLP4 296
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
ARGI4
ADDRLP4 696
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRLP4 644
ADDRLP4 696
INDIRP4
ASGNP4
LABELV $934
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
NEI4 $935
ADDRLP4 648
ADDRGP4 $330
ASGNP4
ADDRGP4 $936
JUMPV
LABELV $935
ADDRGP4 $745
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 432
ADDP4
INDIRF4
ARGF4
ADDRLP4 700
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 648
ADDRLP4 700
INDIRP4
ASGNP4
LABELV $936
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
NEI4 $937
ADDRLP4 652
ADDRGP4 $330
ASGNP4
ADDRGP4 $938
JUMPV
LABELV $937
ADDRGP4 $747
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 428
ADDP4
INDIRF4
ARGF4
ADDRLP4 704
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 652
ADDRLP4 704
INDIRP4
ASGNP4
LABELV $938
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
NEI4 $939
ADDRLP4 656
ADDRGP4 $330
ASGNP4
ADDRGP4 $940
JUMPV
LABELV $939
ADDRGP4 $749
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 708
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 656
ADDRLP4 708
INDIRP4
ASGNP4
LABELV $940
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
NEI4 $941
ADDRLP4 660
ADDRGP4 $330
ASGNP4
ADDRGP4 $942
JUMPV
LABELV $941
ADDRLP4 296
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ARGI4
ADDRLP4 712
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRGP4 $916
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ARGI4
ADDRLP4 712
INDIRP4
ARGP4
ADDRLP4 720
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 660
ADDRLP4 720
INDIRP4
ASGNP4
LABELV $942
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $945
ADDRLP4 296
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $943
LABELV $945
ADDRLP4 664
ADDRGP4 $330
ASGNP4
ADDRGP4 $944
JUMPV
LABELV $943
ADDRGP4 $854
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 728
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 664
ADDRLP4 728
INDIRP4
ASGNP4
LABELV $944
ADDRGP4 $899
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $946
ADDRLP4 668
ADDRGP4 $728
ASGNP4
ADDRGP4 $947
JUMPV
LABELV $946
ADDRLP4 668
ADDRGP4 $330
ASGNP4
LABELV $947
ADDRLP4 668
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
NEI4 $948
ADDRLP4 672
CNSTI4 32
ASGNI4
ADDRGP4 $949
JUMPV
LABELV $948
ADDRLP4 672
CNSTI4 35
ASGNI4
LABELV $949
ADDRLP4 672
INDIRI4
ARGI4
ADDRLP4 616
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
EQI4 $950
ADDRLP4 676
CNSTI4 50
ASGNI4
ADDRGP4 $951
JUMPV
LABELV $950
ADDRLP4 676
CNSTI4 55
ASGNI4
LABELV $951
ADDRLP4 676
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $952
ADDRLP4 680
ADDRLP4 296
INDIRP4
CNSTI4 452
ADDP4
ASGNP4
ADDRGP4 $953
JUMPV
LABELV $952
ADDRLP4 680
ADDRGP4 $330
ASGNP4
LABELV $953
ADDRLP4 680
INDIRP4
ARGP4
ADDRLP4 628
INDIRP4
ARGP4
ADDRLP4 644
INDIRP4
ARGP4
ADDRLP4 648
INDIRP4
ARGP4
ADDRLP4 652
INDIRP4
ARGP4
ADDRLP4 656
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
NEI4 $954
ADDRLP4 684
ADDRGP4 $330
ASGNP4
ADDRGP4 $955
JUMPV
LABELV $954
ADDRLP4 684
ADDRLP4 296
INDIRP4
CNSTI4 463
ADDP4
ASGNP4
LABELV $955
ADDRLP4 684
INDIRP4
ARGP4
ADDRLP4 660
INDIRP4
ARGP4
ADDRLP4 664
INDIRP4
ARGP4
ADDRLP4 732
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 732
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1040
;1033:					"^J%c%02s^%c %-10s ^c%4s ^u%10s" LBROWFULL_STRING "  ^c%s%s"
;1034:					"\n\"",
;1035:					i == 10 ? "\n" : "",
;1036:					LBROWFULL(LB_SEGMENTED, TIMECOLOR_SEGMENTED, JUMPVALUE_EMPTY),
;1037:					!entriesHere[LB_SEGMENTED].exists ? "" : miniva("(%dSP/%dRP/%s)", entriesHere[LB_SEGMENTED].savePosCount, entriesHere[LB_SEGMENTED].resposCount, DF_MsToString(entriesHere[LB_SEGMENTED].duration_ms_segmented_total)),
;1038:					(!entriesHere[LB_SEGMENTED].exists || entriesHere[LB_SEGMENTED].msec != -1) ? "" : multiva(" fps:%s", entriesHere[LB_SEGMENTED].fpsString)
;1039:				));
;1040:				break;
ADDRGP4 $719
JUMPV
LABELV $956
line 1042
;1041:			case LB_CHEAT:
;1042:				trap_SendServerCommand(lbRequestData.clientnum, va("print \"%s^7"
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $977
ADDRLP4 736
ADDRGP4 $731
ASGNP4
ADDRGP4 $978
JUMPV
LABELV $977
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $979
ADDRLP4 740
ADDRGP4 $627
ASGNP4
ADDRGP4 $980
JUMPV
LABELV $979
ADDRLP4 256
INDIRI4
CNSTI4 10
GEI4 $981
ADDRLP4 744
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 topNumberStrings
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $982
JUMPV
LABELV $981
ADDRGP4 $732
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 812
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 744
ADDRLP4 812
INDIRP4
ASGNP4
LABELV $982
ADDRLP4 740
ADDRLP4 744
INDIRP4
ASGNP4
LABELV $980
ADDRLP4 736
ADDRLP4 740
INDIRP4
ASGNP4
LABELV $978
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $983
ADDRLP4 296
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $985
ADDRLP4 752
ADDRGP4 $737
ASGNP4
ADDRGP4 $986
JUMPV
LABELV $985
ADDRLP4 296
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $987
ADDRLP4 756
ADDRGP4 $738
ASGNP4
ADDRGP4 $988
JUMPV
LABELV $987
ADDRLP4 296
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 0
NEI4 $989
ADDRLP4 760
ADDRGP4 $739
ASGNP4
ADDRGP4 $990
JUMPV
LABELV $989
ADDRGP4 $732
ARGP4
CNSTI4 1000
ADDRLP4 296
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
DIVI4
ARGI4
ADDRLP4 816
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 760
ADDRLP4 816
INDIRP4
ASGNP4
LABELV $990
ADDRLP4 756
ADDRLP4 760
INDIRP4
ASGNP4
LABELV $988
ADDRLP4 752
ADDRLP4 756
INDIRP4
ASGNP4
LABELV $986
ADDRLP4 748
ADDRLP4 752
INDIRP4
ASGNP4
ADDRGP4 $984
JUMPV
LABELV $983
ADDRLP4 748
ADDRGP4 $330
ASGNP4
LABELV $984
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $991
ADDRLP4 764
ADDRGP4 $330
ASGNP4
ADDRGP4 $992
JUMPV
LABELV $991
ADDRLP4 296
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ARGI4
ADDRLP4 820
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRLP4 764
ADDRLP4 820
INDIRP4
ASGNP4
LABELV $992
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $993
ADDRLP4 768
ADDRGP4 $330
ASGNP4
ADDRGP4 $994
JUMPV
LABELV $993
ADDRGP4 $745
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ARGF4
ADDRLP4 824
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 768
ADDRLP4 824
INDIRP4
ASGNP4
LABELV $994
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $995
ADDRLP4 772
ADDRGP4 $330
ASGNP4
ADDRGP4 $996
JUMPV
LABELV $995
ADDRGP4 $747
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ARGF4
ADDRLP4 828
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 772
ADDRLP4 828
INDIRP4
ASGNP4
LABELV $996
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $997
ADDRLP4 776
ADDRGP4 $330
ASGNP4
ADDRGP4 $998
JUMPV
LABELV $997
ADDRGP4 $749
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 832
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 776
ADDRLP4 832
INDIRP4
ASGNP4
LABELV $998
ADDRLP4 840
CNSTI4 0
ASGNI4
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ADDRLP4 840
INDIRI4
EQI4 $1001
ADDRLP4 296
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 840
INDIRI4
NEI4 $999
LABELV $1001
ADDRLP4 780
ADDRGP4 $330
ASGNP4
ADDRGP4 $1000
JUMPV
LABELV $999
ADDRLP4 296
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ARGI4
ADDRLP4 844
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRGP4 $916
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
ARGI4
ADDRLP4 844
INDIRP4
ARGP4
ADDRLP4 852
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 780
ADDRLP4 852
INDIRP4
ASGNP4
LABELV $1000
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1004
ADDRLP4 296
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1002
LABELV $1004
ADDRLP4 784
ADDRGP4 $330
ASGNP4
ADDRGP4 $1003
JUMPV
LABELV $1002
ADDRGP4 $854
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 620
ADDP4
ARGP4
ADDRLP4 860
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 784
ADDRLP4 860
INDIRP4
ASGNP4
LABELV $1003
ADDRGP4 $899
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1005
ADDRLP4 788
ADDRGP4 $728
ASGNP4
ADDRGP4 $1006
JUMPV
LABELV $1005
ADDRLP4 788
ADDRGP4 $330
ASGNP4
LABELV $1006
ADDRLP4 788
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1007
ADDRLP4 792
CNSTI4 32
ASGNI4
ADDRGP4 $1008
JUMPV
LABELV $1007
ADDRLP4 792
CNSTI4 35
ASGNI4
LABELV $1008
ADDRLP4 792
INDIRI4
ARGI4
ADDRLP4 736
INDIRP4
ARGP4
ADDRLP4 864
ADDRLP4 296
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
ASGNI4
ADDRLP4 868
CNSTI4 0
ASGNI4
ADDRLP4 864
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 868
INDIRI4
NEI4 $1011
ADDRLP4 864
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 868
INDIRI4
EQI4 $1009
LABELV $1011
ADDRLP4 296
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1012
ADDRLP4 800
CNSTI4 106
ASGNI4
ADDRGP4 $1013
JUMPV
LABELV $1012
ADDRLP4 800
CNSTI4 49
ASGNI4
LABELV $1013
ADDRLP4 796
ADDRLP4 800
INDIRI4
ASGNI4
ADDRGP4 $1010
JUMPV
LABELV $1009
ADDRLP4 796
CNSTI4 55
ASGNI4
LABELV $1010
ADDRLP4 796
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1014
ADDRLP4 804
ADDRLP4 296
INDIRP4
CNSTI4 584
ADDP4
ASGNP4
ADDRGP4 $1015
JUMPV
LABELV $1014
ADDRLP4 804
ADDRGP4 $330
ASGNP4
LABELV $1015
ADDRLP4 804
INDIRP4
ARGP4
ADDRLP4 748
INDIRP4
ARGP4
ADDRLP4 764
INDIRP4
ARGP4
ADDRLP4 768
INDIRP4
ARGP4
ADDRLP4 772
INDIRP4
ARGP4
ADDRLP4 776
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1016
ADDRLP4 808
ADDRGP4 $330
ASGNP4
ADDRGP4 $1017
JUMPV
LABELV $1016
ADDRLP4 808
ADDRLP4 296
INDIRP4
CNSTI4 595
ADDP4
ASGNP4
LABELV $1017
ADDRLP4 808
INDIRP4
ARGP4
ADDRLP4 780
INDIRP4
ARGP4
ADDRLP4 784
INDIRP4
ARGP4
ADDRLP4 872
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 872
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1050
;1043:					"^J%c%02s^%c %-10s ^c%4s ^u%10s" LBROWFULL_STRING "  ^c%s%s"
;1044:					"\n\"",
;1045:					i == 10 ? "\n" : "",
;1046:					LBROWFULL(LB_CHEAT, TIMECOLOR_CHEAT, JUMPVALUE_EMPTY),
;1047:					(!entriesHere[LB_CHEAT].exists || !(entriesHere[LB_CHEAT].runFlags & RFL_SEGMENTED)) ? "" : miniva("(%dSP/%dRP/%s)", entriesHere[LB_CHEAT].savePosCount, entriesHere[LB_CHEAT].resposCount, DF_MsToString(entriesHere[LB_CHEAT].duration_ms_segmented_total)),
;1048:					(!entriesHere[LB_CHEAT].exists || entriesHere[LB_CHEAT].msec != -1) ? "" : multiva(" fps:%s", entriesHere[LB_CHEAT].fpsString)
;1049:				));
;1050:				break;
line 1052
;1051:			}
;1052:		}
ADDRGP4 $719
JUMPV
LABELV $718
line 1053
;1053:		else {
line 1054
;1054:			trap_SendServerCommand(lbRequestData.clientnum, va("print \"%s^7"
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1079
ADDRGP4 $1021
ARGP4
ADDRLP4 532
ADDRGP4 $330
ASGNP4
ADDRLP4 532
INDIRP4
ARGP4
ADDRLP4 532
INDIRP4
ARGP4
ADDRLP4 532
INDIRP4
ARGP4
ADDRLP4 532
INDIRP4
ARGP4
ADDRLP4 532
INDIRP4
ARGP4
ADDRLP4 536
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 304
ADDRLP4 536
INDIRP4
ASGNP4
ADDRGP4 $1080
JUMPV
LABELV $1079
ADDRLP4 304
ADDRGP4 $330
ASGNP4
LABELV $1080
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1081
ADDRLP4 308
ADDRGP4 $731
ASGNP4
ADDRGP4 $1082
JUMPV
LABELV $1081
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1083
ADDRLP4 312
ADDRGP4 $627
ASGNP4
ADDRGP4 $1084
JUMPV
LABELV $1083
ADDRLP4 256
INDIRI4
CNSTI4 10
GEI4 $1085
ADDRLP4 316
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 topNumberStrings
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1086
JUMPV
LABELV $1085
ADDRGP4 $732
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 540
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 316
ADDRLP4 540
INDIRP4
ASGNP4
LABELV $1086
ADDRLP4 312
ADDRLP4 316
INDIRP4
ASGNP4
LABELV $1084
ADDRLP4 308
ADDRLP4 312
INDIRP4
ASGNP4
LABELV $1082
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1087
ADDRLP4 296
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1089
ADDRLP4 324
ADDRGP4 $737
ASGNP4
ADDRGP4 $1090
JUMPV
LABELV $1089
ADDRLP4 296
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $1091
ADDRLP4 328
ADDRGP4 $738
ASGNP4
ADDRGP4 $1092
JUMPV
LABELV $1091
ADDRLP4 296
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1093
ADDRLP4 332
ADDRGP4 $739
ASGNP4
ADDRGP4 $1094
JUMPV
LABELV $1093
ADDRGP4 $732
ARGP4
CNSTI4 1000
ADDRLP4 296
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
DIVI4
ARGI4
ADDRLP4 544
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 332
ADDRLP4 544
INDIRP4
ASGNP4
LABELV $1094
ADDRLP4 328
ADDRLP4 332
INDIRP4
ASGNP4
LABELV $1092
ADDRLP4 324
ADDRLP4 328
INDIRP4
ASGNP4
LABELV $1090
ADDRLP4 320
ADDRLP4 324
INDIRP4
ASGNP4
ADDRGP4 $1088
JUMPV
LABELV $1087
ADDRLP4 320
ADDRGP4 $330
ASGNP4
LABELV $1088
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1095
ADDRLP4 336
ADDRGP4 $330
ASGNP4
ADDRGP4 $1096
JUMPV
LABELV $1095
ADDRLP4 296
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 548
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRLP4 336
ADDRLP4 548
INDIRP4
ASGNP4
LABELV $1096
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1097
ADDRLP4 340
ADDRGP4 $731
ASGNP4
ADDRGP4 $1098
JUMPV
LABELV $1097
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1099
ADDRLP4 344
ADDRGP4 $627
ASGNP4
ADDRGP4 $1100
JUMPV
LABELV $1099
ADDRLP4 256
INDIRI4
CNSTI4 10
GEI4 $1101
ADDRLP4 348
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 topNumberStrings
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1102
JUMPV
LABELV $1101
ADDRGP4 $732
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 552
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 348
ADDRLP4 552
INDIRP4
ASGNP4
LABELV $1102
ADDRLP4 344
ADDRLP4 348
INDIRP4
ASGNP4
LABELV $1100
ADDRLP4 340
ADDRLP4 344
INDIRP4
ASGNP4
LABELV $1098
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1103
ADDRLP4 296
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1105
ADDRLP4 356
ADDRGP4 $737
ASGNP4
ADDRGP4 $1106
JUMPV
LABELV $1105
ADDRLP4 296
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $1107
ADDRLP4 360
ADDRGP4 $738
ASGNP4
ADDRGP4 $1108
JUMPV
LABELV $1107
ADDRLP4 296
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1109
ADDRLP4 364
ADDRGP4 $739
ASGNP4
ADDRGP4 $1110
JUMPV
LABELV $1109
ADDRGP4 $732
ARGP4
CNSTI4 1000
ADDRLP4 296
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
DIVI4
ARGI4
ADDRLP4 556
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 364
ADDRLP4 556
INDIRP4
ASGNP4
LABELV $1110
ADDRLP4 360
ADDRLP4 364
INDIRP4
ASGNP4
LABELV $1108
ADDRLP4 356
ADDRLP4 360
INDIRP4
ASGNP4
LABELV $1106
ADDRLP4 352
ADDRLP4 356
INDIRP4
ASGNP4
ADDRGP4 $1104
JUMPV
LABELV $1103
ADDRLP4 352
ADDRGP4 $330
ASGNP4
LABELV $1104
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1111
ADDRLP4 368
ADDRGP4 $330
ASGNP4
ADDRGP4 $1112
JUMPV
LABELV $1111
ADDRLP4 296
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ARGI4
ADDRLP4 560
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRLP4 368
ADDRLP4 560
INDIRP4
ASGNP4
LABELV $1112
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1113
ADDRLP4 372
ADDRGP4 $731
ASGNP4
ADDRGP4 $1114
JUMPV
LABELV $1113
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1115
ADDRLP4 376
ADDRGP4 $627
ASGNP4
ADDRGP4 $1116
JUMPV
LABELV $1115
ADDRLP4 256
INDIRI4
CNSTI4 10
GEI4 $1117
ADDRLP4 380
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 topNumberStrings
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1118
JUMPV
LABELV $1117
ADDRGP4 $732
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 564
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 380
ADDRLP4 564
INDIRP4
ASGNP4
LABELV $1118
ADDRLP4 376
ADDRLP4 380
INDIRP4
ASGNP4
LABELV $1116
ADDRLP4 372
ADDRLP4 376
INDIRP4
ASGNP4
LABELV $1114
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1119
ADDRLP4 296
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1121
ADDRLP4 388
ADDRGP4 $737
ASGNP4
ADDRGP4 $1122
JUMPV
LABELV $1121
ADDRLP4 296
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $1123
ADDRLP4 392
ADDRGP4 $738
ASGNP4
ADDRGP4 $1124
JUMPV
LABELV $1123
ADDRLP4 296
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1125
ADDRLP4 396
ADDRGP4 $739
ASGNP4
ADDRGP4 $1126
JUMPV
LABELV $1125
ADDRGP4 $732
ARGP4
CNSTI4 1000
ADDRLP4 296
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
DIVI4
ARGI4
ADDRLP4 568
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 396
ADDRLP4 568
INDIRP4
ASGNP4
LABELV $1126
ADDRLP4 392
ADDRLP4 396
INDIRP4
ASGNP4
LABELV $1124
ADDRLP4 388
ADDRLP4 392
INDIRP4
ASGNP4
LABELV $1122
ADDRLP4 384
ADDRLP4 388
INDIRP4
ASGNP4
ADDRGP4 $1120
JUMPV
LABELV $1119
ADDRLP4 384
ADDRGP4 $330
ASGNP4
LABELV $1120
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1127
ADDRGP4 $844
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 572
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 400
ADDRLP4 572
INDIRP4
ASGNP4
ADDRGP4 $1128
JUMPV
LABELV $1127
ADDRLP4 400
ADDRGP4 $731
ASGNP4
LABELV $1128
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1129
ADDRLP4 404
ADDRGP4 $330
ASGNP4
ADDRGP4 $1130
JUMPV
LABELV $1129
ADDRLP4 296
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ARGI4
ADDRLP4 576
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRLP4 404
ADDRLP4 576
INDIRP4
ASGNP4
LABELV $1130
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1131
ADDRLP4 408
ADDRGP4 $731
ASGNP4
ADDRGP4 $1132
JUMPV
LABELV $1131
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1133
ADDRLP4 412
ADDRGP4 $627
ASGNP4
ADDRGP4 $1134
JUMPV
LABELV $1133
ADDRLP4 256
INDIRI4
CNSTI4 10
GEI4 $1135
ADDRLP4 416
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 topNumberStrings
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1136
JUMPV
LABELV $1135
ADDRGP4 $732
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 580
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 416
ADDRLP4 580
INDIRP4
ASGNP4
LABELV $1136
ADDRLP4 412
ADDRLP4 416
INDIRP4
ASGNP4
LABELV $1134
ADDRLP4 408
ADDRLP4 412
INDIRP4
ASGNP4
LABELV $1132
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1137
ADDRLP4 296
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1139
ADDRLP4 424
ADDRGP4 $737
ASGNP4
ADDRGP4 $1140
JUMPV
LABELV $1139
ADDRLP4 296
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $1141
ADDRLP4 428
ADDRGP4 $738
ASGNP4
ADDRGP4 $1142
JUMPV
LABELV $1141
ADDRLP4 296
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1143
ADDRLP4 432
ADDRGP4 $739
ASGNP4
ADDRGP4 $1144
JUMPV
LABELV $1143
ADDRGP4 $732
ARGP4
CNSTI4 1000
ADDRLP4 296
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
DIVI4
ARGI4
ADDRLP4 584
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 432
ADDRLP4 584
INDIRP4
ASGNP4
LABELV $1144
ADDRLP4 428
ADDRLP4 432
INDIRP4
ASGNP4
LABELV $1142
ADDRLP4 424
ADDRLP4 428
INDIRP4
ASGNP4
LABELV $1140
ADDRLP4 420
ADDRLP4 424
INDIRP4
ASGNP4
ADDRGP4 $1138
JUMPV
LABELV $1137
ADDRLP4 420
ADDRGP4 $330
ASGNP4
LABELV $1138
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1145
ADDRLP4 436
ADDRGP4 $330
ASGNP4
ADDRGP4 $1146
JUMPV
LABELV $1145
ADDRLP4 296
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
ARGI4
ADDRLP4 588
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRLP4 436
ADDRLP4 588
INDIRP4
ASGNP4
LABELV $1146
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1147
ADDRLP4 440
ADDRGP4 $731
ASGNP4
ADDRGP4 $1148
JUMPV
LABELV $1147
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1149
ADDRLP4 444
ADDRGP4 $627
ASGNP4
ADDRGP4 $1150
JUMPV
LABELV $1149
ADDRLP4 256
INDIRI4
CNSTI4 10
GEI4 $1151
ADDRLP4 448
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 topNumberStrings
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1152
JUMPV
LABELV $1151
ADDRGP4 $732
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 592
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 448
ADDRLP4 592
INDIRP4
ASGNP4
LABELV $1152
ADDRLP4 444
ADDRLP4 448
INDIRP4
ASGNP4
LABELV $1150
ADDRLP4 440
ADDRLP4 444
INDIRP4
ASGNP4
LABELV $1148
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1153
ADDRLP4 296
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1155
ADDRLP4 456
ADDRGP4 $737
ASGNP4
ADDRGP4 $1156
JUMPV
LABELV $1155
ADDRLP4 296
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $1157
ADDRLP4 460
ADDRGP4 $738
ASGNP4
ADDRGP4 $1158
JUMPV
LABELV $1157
ADDRLP4 296
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1159
ADDRLP4 464
ADDRGP4 $739
ASGNP4
ADDRGP4 $1160
JUMPV
LABELV $1159
ADDRGP4 $732
ARGP4
CNSTI4 1000
ADDRLP4 296
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
DIVI4
ARGI4
ADDRLP4 596
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 464
ADDRLP4 596
INDIRP4
ASGNP4
LABELV $1160
ADDRLP4 460
ADDRLP4 464
INDIRP4
ASGNP4
LABELV $1158
ADDRLP4 456
ADDRLP4 460
INDIRP4
ASGNP4
LABELV $1156
ADDRLP4 452
ADDRLP4 456
INDIRP4
ASGNP4
ADDRGP4 $1154
JUMPV
LABELV $1153
ADDRLP4 452
ADDRGP4 $330
ASGNP4
LABELV $1154
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1161
ADDRLP4 468
ADDRGP4 $330
ASGNP4
ADDRGP4 $1162
JUMPV
LABELV $1161
ADDRLP4 296
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ARGI4
ADDRLP4 600
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRLP4 468
ADDRLP4 600
INDIRP4
ASGNP4
LABELV $1162
ADDRGP4 $1020
ARGP4
ADDRLP4 304
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1163
ADDRLP4 472
CNSTI4 32
ASGNI4
ADDRGP4 $1164
JUMPV
LABELV $1163
ADDRLP4 472
CNSTI4 35
ASGNI4
LABELV $1164
ADDRLP4 472
INDIRI4
ARGI4
ADDRLP4 308
INDIRP4
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1165
ADDRLP4 476
ADDRLP4 296
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRGP4 $1166
JUMPV
LABELV $1165
ADDRLP4 476
ADDRGP4 $330
ASGNP4
LABELV $1166
ADDRLP4 476
INDIRP4
ARGP4
ADDRLP4 320
INDIRP4
ARGP4
ADDRLP4 336
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1167
ADDRLP4 480
CNSTI4 32
ASGNI4
ADDRGP4 $1168
JUMPV
LABELV $1167
ADDRLP4 480
CNSTI4 35
ASGNI4
LABELV $1168
ADDRLP4 480
INDIRI4
ARGI4
ADDRLP4 340
INDIRP4
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1169
ADDRLP4 484
ADDRLP4 296
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRGP4 $1170
JUMPV
LABELV $1169
ADDRLP4 484
ADDRGP4 $330
ASGNP4
LABELV $1170
ADDRLP4 484
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 368
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1171
ADDRLP4 488
CNSTI4 32
ASGNI4
ADDRGP4 $1172
JUMPV
LABELV $1171
ADDRLP4 488
CNSTI4 35
ASGNI4
LABELV $1172
ADDRLP4 488
INDIRI4
ARGI4
ADDRLP4 372
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1173
ADDRLP4 492
CNSTI4 69
ASGNI4
ADDRGP4 $1174
JUMPV
LABELV $1173
ADDRLP4 492
CNSTI4 55
ASGNI4
LABELV $1174
ADDRLP4 492
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1175
ADDRLP4 496
ADDRLP4 296
INDIRP4
CNSTI4 320
ADDP4
ASGNP4
ADDRGP4 $1176
JUMPV
LABELV $1175
ADDRLP4 496
ADDRGP4 $330
ASGNP4
LABELV $1176
ADDRLP4 496
INDIRP4
ARGP4
ADDRLP4 384
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1177
ADDRLP4 500
CNSTI4 106
ASGNI4
ADDRGP4 $1178
JUMPV
LABELV $1177
ADDRLP4 500
CNSTI4 32
ASGNI4
LABELV $1178
ADDRLP4 500
INDIRI4
ARGI4
ADDRLP4 400
INDIRP4
ARGP4
ADDRLP4 404
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1179
ADDRLP4 504
CNSTI4 32
ASGNI4
ADDRGP4 $1180
JUMPV
LABELV $1179
ADDRLP4 504
CNSTI4 35
ASGNI4
LABELV $1180
ADDRLP4 504
INDIRI4
ARGI4
ADDRLP4 408
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1181
ADDRLP4 508
CNSTI4 50
ASGNI4
ADDRGP4 $1182
JUMPV
LABELV $1181
ADDRLP4 508
CNSTI4 55
ASGNI4
LABELV $1182
ADDRLP4 508
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1183
ADDRLP4 512
ADDRLP4 296
INDIRP4
CNSTI4 452
ADDP4
ASGNP4
ADDRGP4 $1184
JUMPV
LABELV $1183
ADDRLP4 512
ADDRGP4 $330
ASGNP4
LABELV $1184
ADDRLP4 512
INDIRP4
ARGP4
ADDRLP4 420
INDIRP4
ARGP4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1185
ADDRLP4 516
CNSTI4 32
ASGNI4
ADDRGP4 $1186
JUMPV
LABELV $1185
ADDRLP4 516
CNSTI4 35
ASGNI4
LABELV $1186
ADDRLP4 516
INDIRI4
ARGI4
ADDRLP4 440
INDIRP4
ARGP4
ADDRLP4 604
ADDRLP4 296
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
ASGNI4
ADDRLP4 608
CNSTI4 0
ASGNI4
ADDRLP4 604
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 608
INDIRI4
NEI4 $1189
ADDRLP4 604
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 608
INDIRI4
EQI4 $1187
LABELV $1189
ADDRLP4 296
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1190
ADDRLP4 524
CNSTI4 106
ASGNI4
ADDRGP4 $1191
JUMPV
LABELV $1190
ADDRLP4 524
CNSTI4 49
ASGNI4
LABELV $1191
ADDRLP4 520
ADDRLP4 524
INDIRI4
ASGNI4
ADDRGP4 $1188
JUMPV
LABELV $1187
ADDRLP4 520
CNSTI4 55
ASGNI4
LABELV $1188
ADDRLP4 520
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1192
ADDRLP4 528
ADDRLP4 296
INDIRP4
CNSTI4 584
ADDP4
ASGNP4
ADDRGP4 $1193
JUMPV
LABELV $1192
ADDRLP4 528
ADDRGP4 $330
ASGNP4
LABELV $1193
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRLP4 468
INDIRP4
ARGP4
ADDRLP4 612
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 612
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1068
;1055:				"^J%c%02s^%c %-10s ^c%4s ^u%10s ^h| "
;1056:				"^J%c%02s^%c %-10s ^c%4s ^u%10s ^h| "
;1057:				"^J%c%02s^%c %-10s ^c%4s %c%s ^u%10s ^h| " // so middle (custom) column is 4 wider
;1058:				"^J%c%02s^%c %-10s ^c%4s ^u%10s ^h| "
;1059:				"^J%c%02s^%c %-10s ^c%4s ^u%10s "
;1060:				"\n\"",
;1061:				i==10 ? multiva("%31s^h|%32s^h|%36s^h|%32s^h|%32s\n","","","","","") : "",
;1062:				LBROW(LB_MAIN, TIMECOLOR_DEFAULT, JUMPVALUE_EMPTY)
;1063:				,LBROW(LB_NOJUMPBUG, TIMECOLOR_DEFAULT, JUMPVALUE_EMPTY)
;1064:				,LBROW(LB_CUSTOM, TIMECOLOR_CUSTOM, JUMPVALUE)
;1065:				,LBROW(LB_SEGMENTED, TIMECOLOR_SEGMENTED, JUMPVALUE_EMPTY)
;1066:				,LBROW(LB_CHEAT, TIMECOLOR_CHEAT, JUMPVALUE_EMPTY)
;1067:				));
;1068:		}
LABELV $719
line 1069
;1069:	}
LABELV $713
line 999
ADDRLP4 296
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 296
INDIRI4
ADDI4
ASGNI4
ADDRLP4 256
ADDRLP4 256
INDIRI4
ADDRLP4 296
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $712
line 1072
;1070:	
;1071:	//trap_SendServerCommand(lbRequestData.clientnum, va("print \"\n^7color explanation:\n^7    %-27s      ^7%-27s      ^7%-27s      ^7%-27s^      ^7%-29s\n\"", "MAIN", "NOJUMPBUG", "CUSTOM", "SEGMENTED", "CHEAT"));
;1072:	if (lbRequestData.type != TOPREQUEST_SPECIFICLB) {
ADDRLP4 4+20
INDIRI4
CNSTI4 1
EQI4 $1194
line 1073
;1073:		trap_SendServerCommand(lbRequestData.clientnum, va("print \"\n^7username color explanation: ^2%-12s ^E%-12s ^1%-12s ^j%-12s\n^7for more details, request specific leaderboard\n\"", "main leaderboard compatible settings", "climbtech", "strafebot/TAS", "strafebot/TAS+segmented"));
ADDRGP4 $1198
ARGP4
ADDRGP4 $1199
ARGP4
ADDRGP4 $1200
ARGP4
ADDRGP4 $1201
ARGP4
ADDRGP4 $1202
ARGP4
ADDRLP4 300
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 300
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1074
;1074:		trap_SendServerCommand(lbRequestData.clientnum, "print \"^7Specific leaderboard commands: ^c/topmain^7, ^c/topnojumpbug^7, ^c/topcustom^7, ^c/topsegmented^7, ^c/topcheat\n\"");
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRGP4 $1204
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1075
;1075:	}
ADDRGP4 $1195
JUMPV
LABELV $1194
line 1076
;1076:	else {
line 1077
;1077:		trap_SendServerCommand(lbRequestData.clientnum, va("print \"\n^7username color explanation: ^2%-12s ^E%-12s ^1%-12s ^j%-12s\n^7to see an overview of all leaderboards, simply use ^c/top\n\"", "main leaderboard compatible settings", "climbtech", "strafebot/TAS", "strafebot/TAS+segmented"));
ADDRGP4 $1206
ARGP4
ADDRGP4 $1199
ARGP4
ADDRGP4 $1200
ARGP4
ADDRGP4 $1201
ARGP4
ADDRGP4 $1202
ARGP4
ADDRLP4 300
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 300
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1078
;1078:	}
LABELV $1195
line 1080
;1079:
;1080:}
LABELV $628
endproc G_TopResult 876 136
proc G_RankUpdateResult 256 16
line 1081
;1081:static void G_RankUpdateResult(int status, const char* errorMessage, int affectedRows) {
line 1083
;1082:	rankUpdateRequestStruct_t lbRequestData;
;1083:	gentity_t* ent = NULL;
ADDRLP4 232
CNSTP4 0
ASGNP4
line 1085
;1084:
;1085:	G_COOL_API_DB_GetReference((byte*)&lbRequestData, sizeof(lbRequestData));
ADDRLP4 0
ARGP4
CNSTI4 232
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 1087
;1086:
;1087:	if (lbRequestData.clientnum == -1) {
ADDRLP4 0+16
INDIRI4
CNSTI4 -1
NEI4 $1208
line 1089
;1088:		//Com_Printf("^1Clientless rank update results returned.\n");
;1089:	}
ADDRGP4 $1209
JUMPV
LABELV $1208
line 1090
;1090:	else if (!(ent = DB_VerifyClient(lbRequestData.clientnum, lbRequestData.ip))) {
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 236
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 232
ADDRLP4 236
INDIRP4
ASGNP4
ADDRLP4 236
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1211
line 1091
;1091:		Com_Printf("^1Client %d rank update results returned, user no longer valid.\n", lbRequestData.clientnum);
ADDRGP4 $1214
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1092
;1092:	}
LABELV $1211
LABELV $1209
line 1094
;1093:
;1094:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $1216
line 1096
;1095:		// table doesn't exist. create it.
;1096:		G_CreateUserTable();
ADDRGP4 G_CreateUserTable
CALLV
pop
line 1097
;1097:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 1098
;1098:		G_BufferedSendOrPrint(ent, qfalse, qfalse,"^1Rank update failed due to table not existing. Attempting to create. Please try again shortly.\n");
ADDRLP4 232
INDIRP4
ARGP4
ADDRLP4 240
CNSTI4 0
ASGNI4
ADDRLP4 240
INDIRI4
ARGI4
ADDRLP4 240
INDIRI4
ARGI4
ADDRGP4 $1218
ARGP4
ADDRGP4 G_BufferedSendOrPrint
CALLV
pop
line 1099
;1099:		return;
ADDRGP4 $1207
JUMPV
LABELV $1216
line 1101
;1100:	}
;1101:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1219
line 1102
;1102:		G_BufferedSendOrPrint(ent, qfalse, qfalse, va("^1Rank update failed with status %d and error message %s.\n", status, errorMessage));
ADDRGP4 $1221
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 240
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 232
INDIRP4
ARGP4
ADDRLP4 244
CNSTI4 0
ASGNI4
ADDRLP4 244
INDIRI4
ARGI4
ADDRLP4 244
INDIRI4
ARGI4
ADDRLP4 240
INDIRP4
ARGP4
ADDRGP4 G_BufferedSendOrPrint
CALLV
pop
line 1103
;1103:		return;
ADDRGP4 $1207
JUMPV
LABELV $1219
line 1106
;1104:	}
;1105:
;1106:	if (lbRequestData.style == 0) {
ADDRLP4 0+224
INDIRI4
CNSTI4 0
NEI4 $1222
line 1108
;1107:		// first row so to speak
;1108:		G_BufferedSendOrPrint(ent, qfalse, qfalse, va("^7Rank updates for %s/%s:\n", lbRequestData.course, lbRequestData.subcourse));
ADDRGP4 $1225
ARGP4
ADDRLP4 0+20
ARGP4
ADDRLP4 0+121
ARGP4
ADDRLP4 240
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 232
INDIRP4
ARGP4
ADDRLP4 244
CNSTI4 0
ASGNI4
ADDRLP4 244
INDIRI4
ARGI4
ADDRLP4 244
INDIRI4
ARGI4
ADDRLP4 240
INDIRP4
ARGP4
ADDRGP4 G_BufferedSendOrPrint
CALLV
pop
line 1109
;1109:	}
LABELV $1222
line 1112
;1110:
;1111:	//if (affectedRows) 
;1112:	{
line 1113
;1113:		G_BufferedSendOrPrint(ent, qfalse, qfalse, va("^%cStyle %s: %d changes.\n", affectedRows ? '2' : '3',  lbRequestData.style < MV_NUMSTYLES ? moveStyleNames[lbRequestData.style].string : "UNKNOWN", affectedRows));
ADDRGP4 $1228
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1234
ADDRLP4 240
CNSTI4 50
ASGNI4
ADDRGP4 $1235
JUMPV
LABELV $1234
ADDRLP4 240
CNSTI4 51
ASGNI4
LABELV $1235
ADDRLP4 240
INDIRI4
ARGI4
ADDRLP4 0+224
INDIRI4
CNSTI4 13
GEI4 $1236
ADDRLP4 244
ADDRLP4 0+224
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1237
JUMPV
LABELV $1236
ADDRLP4 244
ADDRGP4 $1232
ASGNP4
LABELV $1237
ADDRLP4 244
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 248
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 232
INDIRP4
ARGP4
ADDRLP4 252
CNSTI4 0
ASGNI4
ADDRLP4 252
INDIRI4
ARGI4
ADDRLP4 252
INDIRI4
ARGI4
ADDRLP4 248
INDIRP4
ARGP4
ADDRGP4 G_BufferedSendOrPrint
CALLV
pop
line 1114
;1114:	}
line 1119
;1115:	//else {
;1116:	//	trap_SendServerCommand(lbRequestData.clientnum, va("print \".\"", lbRequestData.course, lbRequestData.subcourse, lbRequestData.style < MV_NUMSTYLES ? moveStyleNames[lbRequestData.style].string : "UNKNOWN", affectedRows));
;1117:	//}
;1118:
;1119:	if (lbRequestData.flush) {
ADDRLP4 0+228
INDIRI4
CNSTI4 0
EQI4 $1238
line 1120
;1120:		G_BufferedSendOrPrintFlush(ent,qfalse);
ADDRLP4 232
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_BufferedSendOrPrintFlush
CALLV
pop
line 1121
;1121:	}
LABELV $1238
line 1123
;1122:
;1123:}
LABELV $1207
endproc G_RankUpdateResult 256 16
proc G_RankUpdateMapLatestSetResult 244 12
line 1124
;1124:static void G_RankUpdateMapLatestSetResult(int status, const char* errorMessage, int affectedRows) {
line 1126
;1125:	rankUpdateRequestStruct_t lbRequestData;
;1126:	gentity_t* ent = NULL;
ADDRLP4 232
CNSTP4 0
ASGNP4
line 1128
;1127:
;1128:	G_COOL_API_DB_GetReference((byte*)&lbRequestData, sizeof(lbRequestData));
ADDRLP4 0
ARGP4
CNSTI4 232
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 1130
;1129:
;1130:	if (lbRequestData.clientnum == -1) {
ADDRLP4 0+16
INDIRI4
CNSTI4 -1
NEI4 $1242
line 1132
;1131:		//Com_Printf("^1Clientless rank update results returned.\n");
;1132:	}
ADDRGP4 $1243
JUMPV
LABELV $1242
line 1133
;1133:	else if (!(ent = DB_VerifyClient(lbRequestData.clientnum, lbRequestData.ip))) {
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 236
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 232
ADDRLP4 236
INDIRP4
ASGNP4
ADDRLP4 236
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1245
line 1134
;1134:		Com_Printf("^1Client %d rank update results returned, user no longer valid.\n", lbRequestData.clientnum);
ADDRGP4 $1214
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1135
;1135:	}
LABELV $1245
LABELV $1243
line 1138
;1136:
;1137:	// all of the spammy requests are finished now so... 
;1138:	G_BufferedSendOrPrintFlush(ent,qfalse);
ADDRLP4 232
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_BufferedSendOrPrintFlush
CALLV
pop
line 1140
;1139:
;1140:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $1249
line 1142
;1141:		// table doesn't exist. create it.
;1142:		G_CreateUserTable();
ADDRGP4 G_CreateUserTable
CALLV
pop
line 1143
;1143:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 1144
;1144:		G_SendOrPrint(ent,"^1Rank update failed due to table not existing. Attempting to create. Please try again shortly.\n");
ADDRLP4 232
INDIRP4
ARGP4
ADDRGP4 $1218
ARGP4
ADDRGP4 G_SendOrPrint
CALLV
pop
line 1145
;1145:		return;
ADDRGP4 $1241
JUMPV
LABELV $1249
line 1147
;1146:	}
;1147:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1251
line 1148
;1148:		G_SendOrPrint(ent, va("^1Rank update failed with status %d and error message %s.\n", status, errorMessage));
ADDRGP4 $1221
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 240
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 232
INDIRP4
ARGP4
ADDRLP4 240
INDIRP4
ARGP4
ADDRGP4 G_SendOrPrint
CALLV
pop
line 1149
;1149:		return;
LABELV $1251
line 1154
;1150:	}
;1151:
;1152:
;1153:
;1154:}
LABELV $1241
endproc G_RankUpdateMapLatestSetResult 244 12
proc G_LatestRunsResult 480 48
line 1155
;1155:static void G_LatestRunsResult(int status, const char* errorMessage, int affectedRows) {
line 1157
;1156:	latestRunsRequestStruct_t lbRequestData;
;1157:	gentity_t* ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1158
;1158:	int resultIndex = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1162
;1159:	char userName[USERNAME_MAX_LEN + 1];
;1160:	//evaluatedRunInfo_t eRunInfo;
;1161:
;1162:	G_COOL_API_DB_GetReference((byte*)&lbRequestData, sizeof(lbRequestData));
ADDRLP4 8
ARGP4
CNSTI4 52
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 1164
;1163:
;1164:	if (!(ent = DB_VerifyClient(lbRequestData.clientnum, lbRequestData.ip))) {
ADDRLP4 8+16
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 72
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1254
line 1165
;1165:		Com_Printf("^1Client %d latest results returned, user no longer valid.\n", lbRequestData.clientnum);
ADDRGP4 $1257
ARGP4
ADDRLP4 8+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1166
;1166:		return;
ADDRGP4 $1253
JUMPV
LABELV $1254
line 1169
;1167:	}
;1168:
;1169:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $1259
line 1171
;1170:		// table doesn't exist. create it.
;1171:		G_CreateUserTable();
ADDRGP4 G_CreateUserTable
CALLV
pop
line 1172
;1172:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 1173
;1173:		trap_SendServerCommand(lbRequestData.clientnum,"print \"^1Latest results display failed due to table not existing. Attempting to create. Please try again shortly.\n\"");
ADDRLP4 8+16
INDIRI4
ARGI4
ADDRGP4 $1262
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1174
;1174:		return;
ADDRGP4 $1253
JUMPV
LABELV $1259
line 1176
;1175:	}
;1176:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1263
line 1177
;1177:		trap_SendServerCommand(lbRequestData.clientnum, va("print \"^1Latest results failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $1266
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8+16
INDIRI4
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1178
;1178:		return;
ADDRGP4 $1253
JUMPV
LABELV $1263
line 1181
;1179:	}
;1180:
;1181:	if (lbRequestData.userResults) {
ADDRLP4 8+48
INDIRI4
CNSTI4 0
EQI4 $1267
line 1182
;1182:		G_COOL_API_DB_GetMoreResults(&affectedRows); // user search. skip first two statements. TODO check for errors here?
ADDRFP4 8
ARGP4
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
pop
line 1184
;1183:
;1184:		if (!G_COOL_API_DB_NextRow()) {
ADDRLP4 76
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $1270
line 1185
;1185:			trap_SendServerCommand(ent - g_entities, va("print \"No user found under the specified serach term '%s'.\n\"", lbRequestData.userSearchTerm));
ADDRGP4 $1272
ARGP4
ADDRLP4 8+32
ARGP4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1186
;1186:			return;
ADDRGP4 $1253
JUMPV
LABELV $1270
line 1188
;1187:		}
;1188:		G_COOL_API_DB_GetString(0, userName, sizeof(userName));
CNSTI4 0
ARGI4
ADDRLP4 60
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1190
;1189:
;1190:		G_COOL_API_DB_GetMoreResults(&affectedRows);
ADDRFP4 8
ARGP4
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
pop
line 1191
;1191:	}
ADDRGP4 $1268
JUMPV
LABELV $1267
line 1192
;1192:	else {
line 1193
;1193:		userName[0] = '\0';
ADDRLP4 60
CNSTI1 0
ASGNI1
line 1194
;1194:	}
LABELV $1268
line 1196
;1195:
;1196:	if (lbRequestData.userId == -3) {
ADDRLP4 8+20
INDIRI4
CNSTI4 -3
NEI4 $1274
line 1198
;1197:
;1198:		trap_SendServerCommand(ent - g_entities, va("print \"Latest runs for '%s':\n\"", userName));
ADDRGP4 $1277
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1199
;1199:	}else {
ADDRGP4 $1280
JUMPV
LABELV $1274
line 1201
;1200:
;1201:		trap_SendServerCommand(ent - g_entities, "print \"Latest runs:\n\"");
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $1278
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1202
;1202:	}
ADDRGP4 $1280
JUMPV
LABELV $1279
line 1204
;1203:
;1204:	while (G_COOL_API_DB_NextRow()) {
line 1216
;1205:		int userid,duration_ms,tmpRank;
;1206:		qboolean mapDefaultsFound;
;1207:		raceStyle_t raceStyle;
;1208:		raceStyle_t mapDefaultRaceStyle;
;1209:		char username[USERNAME_MAX_LEN+1+10]; // some extra buffer for !unlogged! colored
;1210:		char course[COURSENAME_MAX_LEN+1];
;1211:		char subcourse[COURSENAME_MAX_LEN +1];
;1212:		char runwhen[30];
;1213:		char colorChar;
;1214:		mainLeaderboardType_t lbType;
;1215:
;1216:		if (resultIndex == 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1282
line 1217
;1217:			trap_SendServerCommand(ent - g_entities, va("print \"^%c%12s %-7s %-10s %-23s %-4s %-4s %-4s %-10s %-20s %s\n\""
ADDRGP4 $1284
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 $330
ARGP4
ADDRGP4 $1285
ARGP4
ADDRGP4 $1286
ARGP4
ADDRGP4 $1287
ARGP4
ADDRGP4 $1288
ARGP4
ADDRGP4 $1289
ARGP4
ADDRGP4 $1290
ARGP4
ADDRGP4 $1291
ARGP4
ADDRGP4 $1292
ARGP4
ADDRGP4 $1293
ARGP4
ADDRLP4 376
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 376
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1230
;1218:				, '2'
;1219:				, ""
;1220:				, "STYLE"
;1221:				, "USERNAME"
;1222:				, "DATE"
;1223:				, "FPS"
;1224:				, "JUMP"
;1225:				, "RANK"
;1226:				, "TIME"
;1227:				, "MAP/COURSE"
;1228:				, "RUNFLAGS"
;1229:			));
;1230:		}
LABELV $1282
line 1232
;1231:
;1232:		userid = G_COOL_API_DB_GetInt(0);
CNSTI4 0
ARGI4
ADDRLP4 376
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 364
ADDRLP4 376
INDIRI4
ASGNI4
line 1233
;1233:		G_COOL_API_DB_GetString(2, course, sizeof(course));
CNSTI4 2
ARGI4
ADDRLP4 121
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1234
;1234:		G_COOL_API_DB_GetString(3, subcourse, sizeof(subcourse));
CNSTI4 3
ARGI4
ADDRLP4 222
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1235
;1235:		raceStyle.movementStyle = G_COOL_API_DB_GetInt(4);
CNSTI4 4
ARGI4
ADDRLP4 380
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 380
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 1236
;1236:		raceStyle.msec = G_COOL_API_DB_GetInt(5);
CNSTI4 5
ARGI4
ADDRLP4 384
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 76+2
ADDRLP4 384
INDIRI4
CVII2 4
ASGNI2
line 1237
;1237:		raceStyle.jumpLevel = G_COOL_API_DB_GetInt(6);
CNSTI4 6
ARGI4
ADDRLP4 388
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 76+4
ADDRLP4 388
INDIRI4
CVII1 4
ASGNI1
line 1238
;1238:		raceStyle.variant = G_COOL_API_DB_GetInt(7);
CNSTI4 7
ARGI4
ADDRLP4 392
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 76+6
ADDRLP4 392
INDIRI4
CVII2 4
ASGNI2
line 1239
;1239:		raceStyle.runFlags = G_COOL_API_DB_GetInt(8);
CNSTI4 8
ARGI4
ADDRLP4 396
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 76+8
ADDRLP4 396
INDIRI4
CVII2 4
ASGNI2
line 1240
;1240:		mapDefaultsFound = !G_COOL_API_DB_GetInt(9);
CNSTI4 9
ARGI4
ADDRLP4 404
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 404
INDIRI4
CNSTI4 0
NEI4 $1299
ADDRLP4 400
CNSTI4 1
ASGNI4
ADDRGP4 $1300
JUMPV
LABELV $1299
ADDRLP4 400
CNSTI4 0
ASGNI4
LABELV $1300
ADDRLP4 372
ADDRLP4 400
INDIRI4
ASGNI4
line 1241
;1241:		if (!mapDefaultsFound) {
ADDRLP4 372
INDIRI4
CNSTI4 0
NEI4 $1301
line 1242
;1242:			memcpy(&mapDefaultRaceStyle, &defaultRaceStyle, sizeof(mapDefaultRaceStyle));
ADDRLP4 88
ARGP4
ADDRGP4 defaultRaceStyle
ARGP4
CNSTU4 12
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 1243
;1243:		}
ADDRGP4 $1302
JUMPV
LABELV $1301
line 1244
;1244:		else {
line 1245
;1245:			mapDefaultRaceStyle.movementStyle = raceStyle.movementStyle;
ADDRLP4 88
ADDRLP4 76
INDIRU1
ASGNU1
line 1246
;1246:			mapDefaultRaceStyle.msec = G_COOL_API_DB_GetInt(10);
CNSTI4 10
ARGI4
ADDRLP4 408
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 88+2
ADDRLP4 408
INDIRI4
CVII2 4
ASGNI2
line 1247
;1247:			mapDefaultRaceStyle.jumpLevel = G_COOL_API_DB_GetInt(11);
CNSTI4 11
ARGI4
ADDRLP4 412
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 88+4
ADDRLP4 412
INDIRI4
CVII1 4
ASGNI1
line 1248
;1248:			mapDefaultRaceStyle.variant = G_COOL_API_DB_GetInt(12);
CNSTI4 12
ARGI4
ADDRLP4 416
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 88+6
ADDRLP4 416
INDIRI4
CVII2 4
ASGNI2
line 1249
;1249:			mapDefaultRaceStyle.runFlags = G_COOL_API_DB_GetInt(13);
CNSTI4 13
ARGI4
ADDRLP4 420
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 88+8
ADDRLP4 420
INDIRI4
CVII2 4
ASGNI2
line 1250
;1250:		}
LABELV $1302
line 1251
;1251:		duration_ms = G_COOL_API_DB_GetInt(14);
CNSTI4 14
ARGI4
ADDRLP4 408
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 368
ADDRLP4 408
INDIRI4
ASGNI4
line 1252
;1252:		G_COOL_API_DB_GetString(15, runwhen, sizeof(runwhen));
CNSTI4 15
ARGI4
ADDRLP4 328
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1253
;1253:		tmpRank = G_COOL_API_DB_GetInt(16);
CNSTI4 16
ARGI4
ADDRLP4 412
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 324
ADDRLP4 412
INDIRI4
ASGNI4
line 1255
;1254:
;1255:		lbType = classifyLeaderBoard(&raceStyle, &mapDefaultRaceStyle);
ADDRLP4 76
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 416
ADDRGP4 classifyLeaderBoard
CALLI4
ASGNI4
ADDRLP4 360
ADDRLP4 416
INDIRI4
ASGNI4
line 1257
;1256:
;1257:		colorChar = lbType == LB_MAIN ? '7' : 'O';
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $1308
ADDRLP4 420
CNSTI4 55
ASGNI4
ADDRGP4 $1309
JUMPV
LABELV $1308
ADDRLP4 420
CNSTI4 79
ASGNI4
LABELV $1309
ADDRLP4 358
ADDRLP4 420
INDIRI4
CVII1 4
ASGNI1
line 1259
;1258:
;1259:		if (userid == -1) {
ADDRLP4 364
INDIRI4
CNSTI4 -1
NEI4 $1310
line 1261
;1260:			//Q_strncpyz(username, "!unlogged!", sizeof(username));
;1261:			Com_sprintf(username, sizeof(username), "^1!^%cunlogged^1!^%c", colorChar, colorChar);
ADDRLP4 100
ARGP4
CNSTI4 21
ARGI4
ADDRGP4 $1312
ARGP4
ADDRLP4 424
ADDRLP4 358
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 424
INDIRI4
ARGI4
ADDRLP4 424
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1262
;1262:		}
ADDRGP4 $1311
JUMPV
LABELV $1310
line 1263
;1263:		else {
line 1264
;1264:			G_COOL_API_DB_GetString(1, username, sizeof(username));
CNSTI4 1
ARGI4
ADDRLP4 100
ARGP4
CNSTI4 21
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1265
;1265:			Com_sprintf(username, sizeof(username), "%-10s", username);
ADDRLP4 100
ARGP4
CNSTI4 21
ARGI4
ADDRGP4 $1313
ARGP4
ADDRLP4 100
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1266
;1266:		}
LABELV $1311
line 1268
;1267:
;1268:		trap_SendServerCommand(ent - g_entities, va("print \"^%c%12s %-7s %s %-23s %-4s %-4d %-4s %-10s %-20s %s\n\""
ADDRGP4 $1315
ARGP4
ADDRLP4 360
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 leaderboardNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 448
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 76+2
INDIRI2
CVII4 2
CNSTI4 -1
NEI4 $1330
ADDRLP4 424
ADDRGP4 $737
ASGNP4
ADDRGP4 $1331
JUMPV
LABELV $1330
ADDRLP4 76+2
INDIRI2
CVII4 2
CNSTI4 -2
NEI4 $1332
ADDRLP4 428
ADDRGP4 $738
ASGNP4
ADDRGP4 $1333
JUMPV
LABELV $1332
ADDRLP4 76+2
INDIRI2
CVII4 2
CNSTI4 0
NEI4 $1334
ADDRLP4 432
ADDRGP4 $739
ASGNP4
ADDRGP4 $1335
JUMPV
LABELV $1334
ADDRGP4 $732
ARGP4
CNSTI4 1000
ADDRLP4 76+2
INDIRI2
CVII4 2
DIVI4
ARGI4
ADDRLP4 452
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 432
ADDRLP4 452
INDIRP4
ASGNP4
LABELV $1335
ADDRLP4 428
ADDRLP4 432
INDIRP4
ASGNP4
LABELV $1333
ADDRLP4 424
ADDRLP4 428
INDIRP4
ASGNP4
LABELV $1331
ADDRLP4 324
INDIRI4
CNSTI4 0
EQI4 $1336
ADDRGP4 $1325
ARGP4
ADDRLP4 324
INDIRI4
ARGI4
ADDRLP4 456
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 436
ADDRLP4 456
INDIRP4
ASGNP4
ADDRGP4 $1337
JUMPV
LABELV $1336
ADDRLP4 436
ADDRGP4 $330
ASGNP4
LABELV $1337
ADDRLP4 368
INDIRI4
ARGI4
ADDRLP4 460
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRLP4 222
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1338
ADDRGP4 $650
ARGP4
ADDRLP4 121
ARGP4
ADDRLP4 222
ARGP4
ADDRLP4 464
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 440
ADDRLP4 464
INDIRP4
ASGNP4
ADDRGP4 $1339
JUMPV
LABELV $1338
ADDRLP4 440
ADDRLP4 121
ASGNP4
LABELV $1339
ADDRLP4 76+8
INDIRI2
CVII4 2
ARGI4
ADDRLP4 88+8
INDIRI2
CVII4 2
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 468
CNSTP4 0
ASGNP4
ADDRLP4 468
INDIRP4
ARGP4
ADDRLP4 468
INDIRP4
ARGP4
ADDRLP4 472
ADDRGP4 RunFlagsToString
CALLP4
ASGNP4
ADDRGP4 $1314
ARGP4
ADDRLP4 358
INDIRI1
CVII4 1
ARGI4
ADDRLP4 448
INDIRP4
ARGP4
ADDRLP4 76
INDIRU1
CVUI4 1
CNSTI4 13
GEI4 $1340
ADDRLP4 444
ADDRLP4 76
INDIRU1
CVUI4 1
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1341
JUMPV
LABELV $1340
ADDRLP4 444
ADDRGP4 $1232
ASGNP4
LABELV $1341
ADDRLP4 444
INDIRP4
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 424
INDIRP4
ARGP4
ADDRLP4 76+4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 436
INDIRP4
ARGP4
ADDRLP4 460
INDIRP4
ARGP4
ADDRLP4 440
INDIRP4
ARGP4
ADDRLP4 472
INDIRP4
ARGP4
ADDRLP4 476
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 476
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1281
;1269:			, colorChar
;1270:			, miniva("[%s]", leaderboardNames[lbType].string)
;1271:			, raceStyle.movementStyle < MV_NUMSTYLES ? moveStyleNames[raceStyle.movementStyle].string : "UNKNOWN"
;1272:			, username
;1273:			, runwhen
;1274:			, MSECSTRING(raceStyle.msec)
;1275:			, raceStyle.jumpLevel
;1276:			, tmpRank ? miniva("#%d",tmpRank) : ""
;1277:			, DF_MsToString(duration_ms)
;1278:			, subcourse[0] ? multiva("%s/%s", course, subcourse) : course
;1279:			, RunFlagsToString(raceStyle.runFlags,mapDefaultRaceStyle.runFlags,0,NULL,NULL)
;1280:		));
;1281:		resultIndex++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1282
;1282:	}
LABELV $1280
line 1204
ADDRLP4 76
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $1279
line 1284
;1283:
;1284:	trap_SendServerCommand(ent - g_entities, va("print \"\n\""));
ADDRGP4 $1342
ARGP4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1286
;1285:
;1286:	if (!lbRequestData.styleSpecified && !lbRequestData.pageSpecified) {
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 8+24
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $1343
ADDRLP4 8+28
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $1343
line 1287
;1287:		trap_SendServerCommand(ent - g_entities, va("print \"Note: You can specify movement style and page number for ^2/latest^7.\n\""));
ADDRGP4 $1347
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1288
;1288:	}
ADDRGP4 $1344
JUMPV
LABELV $1343
line 1289
;1289:	else if (!lbRequestData.pageSpecified) {
ADDRLP4 8+28
INDIRI4
CNSTI4 0
NEI4 $1348
line 1290
;1290:		trap_SendServerCommand(ent - g_entities, va("print \"Note: You can also specify page number for ^2/latest^7.\n\""));
ADDRGP4 $1351
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1291
;1291:	} else if (!lbRequestData.styleSpecified) {
ADDRGP4 $1349
JUMPV
LABELV $1348
ADDRLP4 8+24
INDIRI4
CNSTI4 0
NEI4 $1352
line 1292
;1292:		trap_SendServerCommand(ent - g_entities, va("print \"Note: You can also specify movement style for ^2/latest^7.\n\""));
ADDRGP4 $1355
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1293
;1293:	}
LABELV $1352
LABELV $1349
LABELV $1344
line 1295
;1294:
;1295:	if (lbRequestData.userId == -2) {
ADDRLP4 8+20
INDIRI4
CNSTI4 -2
NEI4 $1356
line 1297
;1296:
;1297:		trap_SendServerCommand(ent - g_entities, va("print \"When logged in, you can call ^2/latest mine^7 to see maps you played recently.\n\""));
ADDRGP4 $1359
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1298
;1298:		trap_SendServerCommand(ent - g_entities, va("print \"You can also call ^2/latest unlogged^7 to see maps recently played by unlogged players.\n\""));
ADDRGP4 $1360
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1299
;1299:	}
LABELV $1356
line 1301
;1300:
;1301:}
LABELV $1253
endproc G_LatestRunsResult 480 48
proc G_RankUpdateMapRequestResult 328 20
line 1304
;1302:void DF_UpdateRanks(gentity_t* ent, const char* coursename, const char* subcoursename, raceStyle_t* thisMapDefaultRaceStyle, qboolean flush);
;1303:
;1304:static void G_RankUpdateMapRequestResult(int status, const char* errorMessage, int affectedRows) {
line 1306
;1305:	rankUpdateMapRequestStruct_t lbRequestData;
;1306:	gentity_t* ent = NULL;
ADDRLP4 32
CNSTP4 0
ASGNP4
line 1307
;1307:	int resultIndex = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 1311
;1308:	char time[30];
;1309:	//evaluatedRunInfo_t eRunInfo;
;1310:
;1311:	G_COOL_API_DB_GetReference((byte*)&lbRequestData, sizeof(lbRequestData));
ADDRLP4 0
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 1313
;1312:
;1313:	if (lbRequestData.clientnum == -1) {
ADDRLP4 0+16
INDIRI4
CNSTI4 -1
NEI4 $1362
line 1314
;1314:		if (g_developer.integer) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
EQI4 $1363
line 1315
;1315:			Com_Printf("^3Clientless rank update map request result returned.\n", lbRequestData.clientnum);
ADDRGP4 $1368
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1316
;1316:		}
line 1317
;1317:	} else if (!(ent = DB_VerifyClient(lbRequestData.clientnum, lbRequestData.ip))) {
ADDRGP4 $1363
JUMPV
LABELV $1362
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 32
ADDRLP4 68
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1370
line 1318
;1318:		Com_Printf("^1Client %d rank update map request results returned, user no longer valid.\n", lbRequestData.clientnum);
ADDRGP4 $1373
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1319
;1319:	}
LABELV $1370
LABELV $1363
line 1321
;1320:
;1321:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $1375
line 1323
;1322:		// table doesn't exist. create it.
;1323:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 1324
;1324:		G_CreateMapRaceDefaultsTable();
ADDRGP4 G_CreateMapRaceDefaultsTable
CALLV
pop
line 1325
;1325:		G_CreateMetaTable();
ADDRGP4 G_CreateMetaTable
CALLV
pop
line 1326
;1326:		G_SendOrPrint(ent, "^1Rank update map request failed due to table not existing. Attempting to create. Please try again shortly.\n");
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 $1377
ARGP4
ADDRGP4 G_SendOrPrint
CALLV
pop
line 1327
;1327:		return;
ADDRGP4 $1361
JUMPV
LABELV $1375
line 1329
;1328:	}
;1329:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1382
line 1330
;1330:		G_SendOrPrint(ent, va("^1Rank update map request failed with status %d and error message %s.\n",status,errorMessage));
ADDRGP4 $1380
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 G_SendOrPrint
CALLV
pop
line 1331
;1331:		return;
ADDRGP4 $1361
JUMPV
LABELV $1381
line 1335
;1332:	}
;1333:
;1334:
;1335:	while (G_COOL_API_DB_NextRow()) {
line 1342
;1336:		int runCount,duration_ms;
;1337:		qboolean mapDefaultsFound;
;1338:		raceStyle_t mapDefaultRaceStyle;
;1339:		char course[COURSENAME_MAX_LEN+1];
;1340:		char subcourse[COURSENAME_MAX_LEN +1];
;1341:
;1342:		if (!resultIndex) {
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1384
line 1343
;1343:			if (!g_developer.integer && lbRequestData.clientnum == -1) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
NEI4 $1386
ADDRLP4 0+16
INDIRI4
CNSTI4 -1
NEI4 $1386
line 1345
;1344:
;1345:				Com_Printf("^3Clientless rank update map request result returned.\n", lbRequestData.clientnum);
ADDRGP4 $1368
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1346
;1346:			}
LABELV $1386
line 1347
;1347:			G_BufferedSendOrPrint(ent, qfalse, qfalse, "Requesting map rank updates:\n");
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 300
CNSTI4 0
ASGNI4
ADDRLP4 300
INDIRI4
ARGI4
ADDRLP4 300
INDIRI4
ARGI4
ADDRGP4 $1391
ARGP4
ADDRGP4 G_BufferedSendOrPrint
CALLV
pop
line 1348
;1348:		}
LABELV $1384
line 1350
;1349:
;1350:		runCount = G_COOL_API_DB_GetInt(0);
CNSTI4 0
ARGI4
ADDRLP4 300
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 292
ADDRLP4 300
INDIRI4
ASGNI4
line 1351
;1351:		G_COOL_API_DB_GetString(1, course, sizeof(course));
CNSTI4 1
ARGI4
ADDRLP4 84
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1352
;1352:		G_COOL_API_DB_GetString(2, subcourse, sizeof(subcourse));
CNSTI4 2
ARGI4
ADDRLP4 185
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1353
;1353:		mapDefaultsFound = !G_COOL_API_DB_GetInt(3);
CNSTI4 3
ARGI4
ADDRLP4 308
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
NEI4 $1393
ADDRLP4 304
CNSTI4 1
ASGNI4
ADDRGP4 $1394
JUMPV
LABELV $1393
ADDRLP4 304
CNSTI4 0
ASGNI4
LABELV $1394
ADDRLP4 288
ADDRLP4 304
INDIRI4
ASGNI4
line 1354
;1354:		if (!mapDefaultsFound) {
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $1395
line 1355
;1355:			memcpy(&mapDefaultRaceStyle, &defaultRaceStyle, sizeof(mapDefaultRaceStyle));
ADDRLP4 72
ARGP4
ADDRGP4 defaultRaceStyle
ARGP4
CNSTU4 12
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 1356
;1356:		}
ADDRGP4 $1396
JUMPV
LABELV $1395
line 1357
;1357:		else {
line 1358
;1358:			mapDefaultRaceStyle.movementStyle = MV_JK2; // TODO fix this if we ever, god forbid, do style specific rules in lb classification...
ADDRLP4 72
CNSTU1 0
ASGNU1
line 1359
;1359:			mapDefaultRaceStyle.msec = G_COOL_API_DB_GetInt(4);
CNSTI4 4
ARGI4
ADDRLP4 312
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 72+2
ADDRLP4 312
INDIRI4
CVII2 4
ASGNI2
line 1360
;1360:			mapDefaultRaceStyle.jumpLevel = G_COOL_API_DB_GetInt(5);
CNSTI4 5
ARGI4
ADDRLP4 316
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 72+4
ADDRLP4 316
INDIRI4
CVII1 4
ASGNI1
line 1361
;1361:			mapDefaultRaceStyle.variant = G_COOL_API_DB_GetInt(6);
CNSTI4 6
ARGI4
ADDRLP4 320
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 72+6
ADDRLP4 320
INDIRI4
CVII2 4
ASGNI2
line 1362
;1362:			mapDefaultRaceStyle.runFlags = G_COOL_API_DB_GetInt(7);
CNSTI4 7
ARGI4
ADDRLP4 324
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 72+8
ADDRLP4 324
INDIRI4
CVII2 4
ASGNI2
line 1363
;1363:		}
LABELV $1396
line 1364
;1364:		G_COOL_API_DB_GetString(8, time, sizeof(time)); // results are ordered from map with oldest newest time to newest newest time, so last one will be representative of how far we actually got with this.
CNSTI4 8
ARGI4
ADDRLP4 36
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1365
;1365:		if (resultIndex == 0) {
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1401
line 1366
;1366:			G_BufferedSendOrPrint(ent, qfalse, qfalse, va("%s/%s", course, subcourse));
ADDRGP4 $650
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 185
ARGP4
ADDRLP4 312
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 316
CNSTI4 0
ASGNI4
ADDRLP4 316
INDIRI4
ARGI4
ADDRLP4 316
INDIRI4
ARGI4
ADDRLP4 312
INDIRP4
ARGP4
ADDRGP4 G_BufferedSendOrPrint
CALLV
pop
line 1367
;1367:		}
ADDRGP4 $1402
JUMPV
LABELV $1401
line 1368
;1368:		else {
line 1369
;1369:			G_BufferedSendOrPrint(ent, qfalse,qfalse, va(", %s/%s", course, subcourse));
ADDRGP4 $1403
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 185
ARGP4
ADDRLP4 312
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 316
CNSTI4 0
ASGNI4
ADDRLP4 316
INDIRI4
ARGI4
ADDRLP4 316
INDIRI4
ARGI4
ADDRLP4 312
INDIRP4
ARGP4
ADDRGP4 G_BufferedSendOrPrint
CALLV
pop
line 1370
;1370:		}
LABELV $1402
line 1371
;1371:		DF_UpdateRanks(ent,course,subcourse,&mapDefaultRaceStyle, !lbRequestData.all);
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 185
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 0+24
INDIRI4
CNSTI4 0
NEI4 $1406
ADDRLP4 312
CNSTI4 1
ASGNI4
ADDRGP4 $1407
JUMPV
LABELV $1406
ADDRLP4 312
CNSTI4 0
ASGNI4
LABELV $1407
ADDRLP4 312
INDIRI4
ARGI4
ADDRGP4 DF_UpdateRanks
CALLV
pop
line 1372
;1372:		resultIndex++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1373
;1373:		if (lbRequestData.mapCountLimit && resultIndex > lbRequestData.mapCountLimit) {
ADDRLP4 0+20
INDIRI4
CNSTI4 0
EQI4 $1408
ADDRLP4 28
INDIRI4
ADDRLP4 0+20
INDIRI4
LEI4 $1408
line 1374
;1374:			break;
ADDRGP4 $1383
JUMPV
LABELV $1408
line 1376
;1375:		}
;1376:	}
LABELV $1382
line 1335
ADDRLP4 72
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $1381
LABELV $1383
line 1378
;1377:
;1378:	if (resultIndex) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $1412
line 1379
;1379:		G_BufferedSendOrPrint(ent,qfalse,qfalse, "\n");
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 $728
ARGP4
ADDRGP4 G_BufferedSendOrPrint
CALLV
pop
line 1380
;1380:		G_BufferedSendOrPrintFlush(ent, qfalse);
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_BufferedSendOrPrintFlush
CALLV
pop
line 1381
;1381:	}
LABELV $1412
line 1383
;1382:
;1383:	if (!resultIndex || !lbRequestData.all) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $1417
ADDRLP4 0+24
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $1414
LABELV $1417
line 1384
;1384:		return; // nothing was updated or we just updated a single map, therefore we don't know the correct time to set.
ADDRGP4 $1361
JUMPV
LABELV $1414
line 1387
;1385:	}
;1386:
;1387:	if (!G_COOL_API_DB_AddPreparedStatement((byte*)&lbRequestData,sizeof(lbRequestData), DBREQUEST_RANKUPDATEMAPLATESTSET,
ADDRLP4 0
ARGP4
CNSTI4 28
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 $1420
ARGP4
ADDRLP4 80
ADDRGP4 G_COOL_API_DB_AddPreparedStatement
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $1418
line 1388
;1388:		"REPLACE INTO meta (`key`,valueWhen) VALUES ('rankUpdateLatest',?)")) {
line 1390
;1389:
;1390:		G_SendOrPrint(ent, "Failed to send rank update latest time meta set request.\n");
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 $1421
ARGP4
ADDRGP4 G_SendOrPrint
CALLV
pop
line 1391
;1391:		return;
ADDRGP4 $1361
JUMPV
LABELV $1418
line 1393
;1392:	}
;1393:	G_COOL_API_DB_PreparedBindString(time);
ADDRLP4 36
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 1394
;1394:	G_COOL_API_DB_FinishAndSendPreparedStatement();
ADDRGP4 G_COOL_API_DB_FinishAndSendPreparedStatement
CALLI4
pop
line 1396
;1395:
;1396:}
LABELV $1361
endproc G_RankUpdateMapRequestResult 328 20
proc G_ShortestLongestResult 436 40
line 1398
;1397:
;1398:static void G_ShortestLongestResult(int status, const char* errorMessage, int affectedRows) {
line 1400
;1399:	mapSearchRequestStruct_t data;
;1400:	gentity_t* ent = NULL;
ADDRLP4 64
CNSTP4 0
ASGNP4
line 1401
;1401:	int resultIndex = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 1405
;1402:	char userName[USERNAME_MAX_LEN + 1];
;1403:	//evaluatedRunInfo_t eRunInfo;
;1404:
;1405:	G_COOL_API_DB_GetReference((byte*)&data, sizeof(data));
ADDRLP4 0
ARGP4
CNSTI4 60
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 1407
;1406:
;1407:	if (!(ent = DB_VerifyClient(data.clientnum, data.ip))) {
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 64
ADDRLP4 80
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1423
line 1408
;1408:		Com_Printf("^1Client %d shortest/longest map results returned, user no longer valid.\n", data.clientnum);
ADDRGP4 $1426
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1409
;1409:		return;
ADDRGP4 $1422
JUMPV
LABELV $1423
line 1412
;1410:	}
;1411:
;1412:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $1428
line 1415
;1413:		// table doesn't exist. create it.
;1414:		// TODO have i forgot one? this function keeps growing...
;1415:		G_CreateMapRaceDefaultsTable();
ADDRGP4 G_CreateMapRaceDefaultsTable
CALLV
pop
line 1416
;1416:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 1417
;1417:		G_CreateUserTable();
ADDRGP4 G_CreateUserTable
CALLV
pop
line 1418
;1418:		G_CreateMapRatingsTable();
ADDRGP4 G_CreateMapRatingsTable
CALLV
pop
line 1419
;1419:		trap_SendServerCommand(data.clientnum,"print \"^1Shortest/longest map results display failed due to table not existing. Attempting to create. Please try again shortly.\n\"");
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 $1431
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1420
;1420:		return;
ADDRGP4 $1422
JUMPV
LABELV $1428
line 1422
;1421:	}
;1422:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1432
line 1423
;1423:		trap_SendServerCommand(data.clientnum, va("print \"^1Shortest/longest map results failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $1435
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1424
;1424:		return;
ADDRGP4 $1422
JUMPV
LABELV $1432
line 1427
;1425:	}
;1426:
;1427:	userName[0] = '\0';
ADDRLP4 68
CNSTI1 0
ASGNI1
line 1429
;1428:
;1429:	if (data.type == MAPSEARCH_LONGEST) {
ADDRLP4 0+32
INDIRI4
CNSTI4 0
NEI4 $1436
line 1430
;1430:		trap_SendServerCommand(ent - g_entities, va("print \"Longest maps in style %s (based on fastest run including segmented/cheat):\n\"", data.style < MV_NUMSTYLES ? moveStyleNames[data.style].string : "UNKNOWN"));
ADDRGP4 $1439
ARGP4
ADDRLP4 0+36
INDIRI4
CNSTI4 13
GEI4 $1443
ADDRLP4 84
ADDRLP4 0+36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1444
JUMPV
LABELV $1443
ADDRLP4 84
ADDRGP4 $1232
ASGNP4
LABELV $1444
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1431
;1431:	}
ADDRGP4 $1533
JUMPV
LABELV $1436
line 1432
;1432:	else if(data.type == MAPSEARCH_SHORTEST) {
ADDRLP4 0+32
INDIRI4
CNSTI4 1
NEI4 $1445
line 1433
;1433:		trap_SendServerCommand(ent - g_entities, va("print \"Shortest maps in style %s (based on fastest run including segmented/cheat):\n\"", data.style < MV_NUMSTYLES ? moveStyleNames[data.style].string : "UNKNOWN"));
ADDRGP4 $1448
ARGP4
ADDRLP4 0+36
INDIRI4
CNSTI4 13
GEI4 $1452
ADDRLP4 84
ADDRLP4 0+36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1453
JUMPV
LABELV $1452
ADDRLP4 84
ADDRGP4 $1232
ASGNP4
LABELV $1453
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1434
;1434:	}
ADDRGP4 $1533
JUMPV
LABELV $1445
line 1435
;1435:	else if(data.type == MAPSEARCH_HARDEST) {
ADDRLP4 0+32
INDIRI4
CNSTI4 6
NEI4 $1454
line 1436
;1436:		G_COOL_API_DB_GetMoreResults(&affectedRows); // style set. skip first statement. TODO check for errors here?
ADDRFP4 8
ARGP4
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
pop
line 1437
;1437:		trap_SendServerCommand(ent - g_entities, va("print \"Hardest maps in style %s (based on average player performance):\n\"", data.style < MV_NUMSTYLES ? moveStyleNames[data.style].string : "UNKNOWN"));
ADDRGP4 $1457
ARGP4
ADDRLP4 0+36
INDIRI4
CNSTI4 13
GEI4 $1461
ADDRLP4 84
ADDRLP4 0+36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1462
JUMPV
LABELV $1461
ADDRLP4 84
ADDRGP4 $1232
ASGNP4
LABELV $1462
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1438
;1438:	}
ADDRGP4 $1533
JUMPV
LABELV $1454
line 1439
;1439:	else if(data.type == MAPSEARCH_EASIEST) {
ADDRLP4 0+32
INDIRI4
CNSTI4 7
NEI4 $1463
line 1440
;1440:		G_COOL_API_DB_GetMoreResults(&affectedRows); // style set. skip first statement. TODO check for errors here?
ADDRFP4 8
ARGP4
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
pop
line 1441
;1441:		trap_SendServerCommand(ent - g_entities, va("print \"Easiest maps in style %s (based on average player performance):\n\"", data.style < MV_NUMSTYLES ? moveStyleNames[data.style].string : "UNKNOWN"));
ADDRGP4 $1466
ARGP4
ADDRLP4 0+36
INDIRI4
CNSTI4 13
GEI4 $1470
ADDRLP4 84
ADDRLP4 0+36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1471
JUMPV
LABELV $1470
ADDRLP4 84
ADDRGP4 $1232
ASGNP4
LABELV $1471
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1442
;1442:	}
ADDRGP4 $1533
JUMPV
LABELV $1463
line 1443
;1443:	else if(data.type == MAPSEARCH_MOSTPLAYED) {
ADDRLP4 0+32
INDIRI4
CNSTI4 4
NEI4 $1472
line 1444
;1444:		trap_SendServerCommand(ent - g_entities, va("print \"Most played maps in style %s (all leaderboards):\n\"", data.style < MV_NUMSTYLES ? moveStyleNames[data.style].string : "UNKNOWN"));
ADDRGP4 $1475
ARGP4
ADDRLP4 0+36
INDIRI4
CNSTI4 13
GEI4 $1479
ADDRLP4 84
ADDRLP4 0+36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1480
JUMPV
LABELV $1479
ADDRLP4 84
ADDRGP4 $1232
ASGNP4
LABELV $1480
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1445
;1445:	}
ADDRGP4 $1533
JUMPV
LABELV $1472
line 1446
;1446:	else if(data.type == MAPSEARCH_TOPRATED) {
ADDRLP4 0+32
INDIRI4
CNSTI4 5
NEI4 $1481
line 1447
;1447:		trap_SendServerCommand(ent - g_entities, va("print \"Top rated maps (0-10) in style %s (all leaderboards):\n\"", data.style < MV_NUMSTYLES ? moveStyleNames[data.style].string : "UNKNOWN"));
ADDRGP4 $1484
ARGP4
ADDRLP4 0+36
INDIRI4
CNSTI4 13
GEI4 $1488
ADDRLP4 84
ADDRLP4 0+36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1489
JUMPV
LABELV $1488
ADDRLP4 84
ADDRGP4 $1232
ASGNP4
LABELV $1489
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1448
;1448:	}
ADDRGP4 $1533
JUMPV
LABELV $1481
line 1449
;1449:	else if(data.type == MAPSEARCH_NOTWR || data.type == MAPSEARCH_WR) {
ADDRLP4 0+32
INDIRI4
CNSTI4 2
EQI4 $1494
ADDRLP4 0+32
INDIRI4
CNSTI4 3
NEI4 $1533
LABELV $1494
line 1450
;1450:		G_COOL_API_DB_GetMoreResults(&affectedRows); // user search. skip first two statements. TODO check for errors here?
ADDRFP4 8
ARGP4
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
pop
line 1452
;1451:
;1452:		if (!G_COOL_API_DB_NextRow()) {
ADDRLP4 84
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $1495
line 1453
;1453:			trap_SendServerCommand(ent - g_entities, va("print \"No user found under the specified serach term '%s'.\n\"", data.userSearchTerm));
ADDRGP4 $1272
ARGP4
ADDRLP4 0+44
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1454
;1454:			return;
ADDRGP4 $1422
JUMPV
LABELV $1495
line 1456
;1455:		}
;1456:		G_COOL_API_DB_GetString(0, userName, sizeof(userName));
CNSTI4 0
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1458
;1457:
;1458:		G_COOL_API_DB_GetMoreResults(&affectedRows);
ADDRFP4 8
ARGP4
ADDRGP4 G_COOL_API_DB_GetMoreResults
CALLI4
pop
line 1459
;1459:		if (*data.userSearchTerm) {
ADDRLP4 0+44
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1498
line 1460
;1460:			trap_SendServerCommand(ent - g_entities, va("print \"Maps in style %s in leaderboard type %s user '%s' does%s hold WR on:\n\"", data.style < MV_NUMSTYLES ? moveStyleNames[data.style].string : "UNKNOWN", data.lbType < LB_TYPES_COUNT ? leaderboardNames[data.lbType].string : "UNKNOWN",userName,data.type == MAPSEARCH_NOTWR ? " not" : ""));
ADDRGP4 $1501
ARGP4
ADDRLP4 0+36
INDIRI4
CNSTI4 13
GEI4 $1511
ADDRLP4 88
ADDRLP4 0+36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1512
JUMPV
LABELV $1511
ADDRLP4 88
ADDRGP4 $1232
ASGNP4
LABELV $1512
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 0+40
INDIRI4
CNSTI4 5
GEI4 $1513
ADDRLP4 92
ADDRLP4 0+40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 leaderboardNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1514
JUMPV
LABELV $1513
ADDRLP4 92
ADDRGP4 $1232
ASGNP4
LABELV $1514
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 0+32
INDIRI4
CNSTI4 2
NEI4 $1515
ADDRLP4 96
ADDRGP4 $1509
ASGNP4
ADDRGP4 $1516
JUMPV
LABELV $1515
ADDRLP4 96
ADDRGP4 $330
ASGNP4
LABELV $1516
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1461
;1461:		}
ADDRGP4 $1533
JUMPV
LABELV $1498
line 1462
;1462:		else {
line 1463
;1463:			trap_SendServerCommand(ent - g_entities, va("print \"Maps in style %s in leaderboard type %s you do%s hold WR on:\n\"", data.style < MV_NUMSTYLES ? moveStyleNames[data.style].string : "UNKNOWN", data.lbType < LB_TYPES_COUNT ? leaderboardNames[data.lbType].string : "UNKNOWN",data.type == MAPSEARCH_NOTWR ? " not" : ""));
ADDRGP4 $1517
ARGP4
ADDRLP4 0+36
INDIRI4
CNSTI4 13
GEI4 $1526
ADDRLP4 88
ADDRLP4 0+36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1527
JUMPV
LABELV $1526
ADDRLP4 88
ADDRGP4 $1232
ASGNP4
LABELV $1527
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 0+40
INDIRI4
CNSTI4 5
GEI4 $1528
ADDRLP4 92
ADDRLP4 0+40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 leaderboardNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1529
JUMPV
LABELV $1528
ADDRLP4 92
ADDRGP4 $1232
ASGNP4
LABELV $1529
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 0+32
INDIRI4
CNSTI4 2
NEI4 $1530
ADDRLP4 96
ADDRGP4 $1509
ASGNP4
ADDRGP4 $1531
JUMPV
LABELV $1530
ADDRLP4 96
ADDRGP4 $330
ASGNP4
LABELV $1531
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1464
;1464:		}
line 1465
;1465:	}
line 1467
;1466:
;1467:	{
ADDRGP4 $1533
JUMPV
LABELV $1532
line 1482
;1468:
;1469:		char course[COURSENAME_MAX_LEN + 1];
;1470:		char subcourse[COURSENAME_MAX_LEN + 1];
;1471:		int time;
;1472:		int votecount,haveMyRating,shortestRun;
;1473:		int mapnum;
;1474:		infoHashed_t* infoHashed;
;1475:		mainLeaderboardType_t lbType;
;1476:		qboolean anyRuns;
;1477:		int rank;
;1478:		float deviation;
;1479:		int samples;
;1480:		float rating, myRating;
;1481:
;1482:		while (G_COOL_API_DB_NextRow()) {
line 1484
;1483:
;1484:			if (data.type == MAPSEARCH_LONGEST || data.type == MAPSEARCH_SHORTEST) {
ADDRLP4 0+32
INDIRI4
CNSTI4 0
EQI4 $1539
ADDRLP4 0+32
INDIRI4
CNSTI4 1
NEI4 $1535
LABELV $1539
line 1486
;1485:
;1486:				if (resultIndex == 0) {
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $1540
line 1487
;1487:					trap_SendServerCommand(ent - g_entities, va("print \"^%c%10s %-7s %-20s\n\""
ADDRGP4 $1542
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 $1291
ARGP4
ADDRGP4 $1543
ARGP4
ADDRGP4 $1292
ARGP4
ADDRLP4 340
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1493
;1488:						, '2'
;1489:						, "TIME"
;1490:						, "MAPNUM"
;1491:						, "MAP/COURSE"
;1492:					));
;1493:				}
LABELV $1540
line 1494
;1494:				time = G_COOL_API_DB_GetInt(0);
CNSTI4 0
ARGI4
ADDRLP4 340
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 292
ADDRLP4 340
INDIRI4
ASGNI4
line 1495
;1495:				G_COOL_API_DB_GetString(1, course, sizeof(course));
CNSTI4 1
ARGI4
ADDRLP4 84
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1496
;1496:				G_COOL_API_DB_GetString(2, subcourse, sizeof(subcourse));
CNSTI4 2
ARGI4
ADDRLP4 185
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1498
;1497:
;1498:				infoHashed = G_GetArenaInfoByMap(course);
ADDRLP4 84
ARGP4
ADDRLP4 344
ADDRGP4 G_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 288
ADDRLP4 344
INDIRP4
ASGNP4
line 1500
;1499:
;1500:				trap_SendServerCommand(ent - g_entities, va("print \"^%c%10s %-7s %-20s\n\""
ADDRLP4 292
INDIRI4
ARGI4
ADDRLP4 356
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRLP4 288
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1547
ADDRGP4 $732
ARGP4
ADDRLP4 288
INDIRP4
CVPU4 4
ADDRGP4 g_arenaInfosHashed
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 12
DIVI4
ARGI4
ADDRLP4 360
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 348
ADDRLP4 360
INDIRP4
ASGNP4
ADDRGP4 $1548
JUMPV
LABELV $1547
ADDRLP4 348
ADDRGP4 $1544
ASGNP4
LABELV $1548
ADDRLP4 185
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1549
ADDRGP4 $650
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 185
ARGP4
ADDRLP4 364
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 352
ADDRLP4 364
INDIRP4
ASGNP4
ADDRGP4 $1550
JUMPV
LABELV $1549
ADDRLP4 352
ADDRLP4 84
ASGNP4
LABELV $1550
ADDRGP4 $1542
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 368
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 368
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1506
;1501:					, '7'
;1502:					, DF_MsToString(time)
;1503:					, infoHashed ? miniva("%d", infoHashed - g_arenaInfosHashed) : "-"
;1504:					, subcourse[0] ? multiva("%s/%s", course, subcourse) : course
;1505:				));
;1506:			}
ADDRGP4 $1536
JUMPV
LABELV $1535
line 1507
;1507:			else if (data.type == MAPSEARCH_HARDEST || data.type == MAPSEARCH_EASIEST) {
ADDRLP4 0+32
INDIRI4
CNSTI4 6
EQI4 $1555
ADDRLP4 0+32
INDIRI4
CNSTI4 7
NEI4 $1551
LABELV $1555
line 1509
;1508:
;1509:				if (resultIndex == 0) {
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $1556
line 1510
;1510:					trap_SendServerCommand(ent - g_entities, va("print \"^%c%10s %11s %-7s %-7s %-20s\n\""
ADDRGP4 $1558
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 $1559
ARGP4
ADDRGP4 $1560
ARGP4
ADDRGP4 $1561
ARGP4
ADDRGP4 $1543
ARGP4
ADDRGP4 $1292
ARGP4
ADDRLP4 340
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1518
;1511:						, '2'
;1512:						, "BEST"
;1513:						, "DIFFICULTY"
;1514:						, "SAMPLES"
;1515:						, "MAPNUM"
;1516:						, "MAP/COURSE"
;1517:					));
;1518:				}
LABELV $1556
line 1519
;1519:				G_COOL_API_DB_GetString(0, course, sizeof(course));
CNSTI4 0
ARGI4
ADDRLP4 84
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1520
;1520:				G_COOL_API_DB_GetString(1, subcourse, sizeof(subcourse));
CNSTI4 1
ARGI4
ADDRLP4 185
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1521
;1521:				G_COOL_API_DB_GetFloat(2,&deviation);
CNSTI4 2
ARGI4
ADDRLP4 296
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 1522
;1522:				time = G_COOL_API_DB_GetInt(3);
CNSTI4 3
ARGI4
ADDRLP4 340
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 292
ADDRLP4 340
INDIRI4
ASGNI4
line 1523
;1523:				samples = G_COOL_API_DB_GetInt(4);
CNSTI4 4
ARGI4
ADDRLP4 344
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 300
ADDRLP4 344
INDIRI4
ASGNI4
line 1525
;1524:
;1525:				infoHashed = G_GetArenaInfoByMap(course);
ADDRLP4 84
ARGP4
ADDRLP4 348
ADDRGP4 G_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 288
ADDRLP4 348
INDIRP4
ASGNP4
line 1527
;1526:
;1527:				trap_SendServerCommand(ent - g_entities, va("print \"^%c%10s %11s %-7d %-7s %-20s\n\""
ADDRLP4 292
INDIRI4
ARGI4
ADDRLP4 360
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRGP4 $1563
ARGP4
ADDRLP4 296
INDIRF4
ARGF4
ADDRLP4 364
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 288
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1566
ADDRGP4 $732
ARGP4
ADDRLP4 288
INDIRP4
CVPU4 4
ADDRGP4 g_arenaInfosHashed
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 12
DIVI4
ARGI4
ADDRLP4 368
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 352
ADDRLP4 368
INDIRP4
ASGNP4
ADDRGP4 $1567
JUMPV
LABELV $1566
ADDRLP4 352
ADDRGP4 $1544
ASGNP4
LABELV $1567
ADDRLP4 185
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1568
ADDRGP4 $650
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 185
ARGP4
ADDRLP4 372
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 356
ADDRLP4 372
INDIRP4
ASGNP4
ADDRGP4 $1569
JUMPV
LABELV $1568
ADDRLP4 356
ADDRLP4 84
ASGNP4
LABELV $1569
ADDRGP4 $1562
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 360
INDIRP4
ARGP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 300
INDIRI4
ARGI4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 376
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 376
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1535
;1528:					, '7'
;1529:					, DF_MsToString(time)
;1530:					, miniva("%.3f", deviation)
;1531:					, samples
;1532:					, infoHashed ? miniva("%d", infoHashed - g_arenaInfosHashed) : "-"
;1533:					, subcourse[0] ? multiva("%s/%s", course, subcourse) : course
;1534:				));
;1535:			}
ADDRGP4 $1552
JUMPV
LABELV $1551
line 1536
;1536:			else if (data.type == MAPSEARCH_MOSTPLAYED ) {
ADDRLP4 0+32
INDIRI4
CNSTI4 4
NEI4 $1570
line 1538
;1537:
;1538:				if (resultIndex == 0) {
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $1573
line 1539
;1539:					trap_SendServerCommand(ent - g_entities, va("print \"^%c%7s %-7s %-20s\n\""
ADDRGP4 $1575
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 $1576
ARGP4
ADDRGP4 $1543
ARGP4
ADDRGP4 $1292
ARGP4
ADDRLP4 340
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1545
;1540:						, '2'
;1541:						, "PLAYERS"
;1542:						, "MAPNUM"
;1543:						, "MAP/COURSE"
;1544:					));
;1545:				}
LABELV $1573
line 1546
;1546:				time = G_COOL_API_DB_GetInt(0); // reuse time variable but its players
CNSTI4 0
ARGI4
ADDRLP4 340
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 292
ADDRLP4 340
INDIRI4
ASGNI4
line 1547
;1547:				G_COOL_API_DB_GetString(1, course, sizeof(course));
CNSTI4 1
ARGI4
ADDRLP4 84
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1548
;1548:				G_COOL_API_DB_GetString(2, subcourse, sizeof(subcourse));
CNSTI4 2
ARGI4
ADDRLP4 185
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1550
;1549:
;1550:				infoHashed = G_GetArenaInfoByMap(course);
ADDRLP4 84
ARGP4
ADDRLP4 344
ADDRGP4 G_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 288
ADDRLP4 344
INDIRP4
ASGNP4
line 1552
;1551:
;1552:				trap_SendServerCommand(ent - g_entities, va("print \"^%c%7s %-7s %-20s\n\""
ADDRGP4 $732
ARGP4
ADDRLP4 292
INDIRI4
ARGI4
ADDRLP4 356
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 288
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1579
ADDRGP4 $732
ARGP4
ADDRLP4 288
INDIRP4
CVPU4 4
ADDRGP4 g_arenaInfosHashed
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 12
DIVI4
ARGI4
ADDRLP4 360
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 348
ADDRLP4 360
INDIRP4
ASGNP4
ADDRGP4 $1580
JUMPV
LABELV $1579
ADDRLP4 348
ADDRGP4 $1544
ASGNP4
LABELV $1580
ADDRLP4 185
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1581
ADDRGP4 $650
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 185
ARGP4
ADDRLP4 364
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 352
ADDRLP4 364
INDIRP4
ASGNP4
ADDRGP4 $1582
JUMPV
LABELV $1581
ADDRLP4 352
ADDRLP4 84
ASGNP4
LABELV $1582
ADDRGP4 $1575
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 368
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 368
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1558
;1553:					, '7'
;1554:					, miniva("%d",time)
;1555:					, infoHashed ? miniva("%d", infoHashed - g_arenaInfosHashed) : "-"
;1556:					, subcourse[0] ? multiva("%s/%s", course, subcourse) : course
;1557:				));
;1558:			}
ADDRGP4 $1571
JUMPV
LABELV $1570
line 1559
;1559:			else if (data.type == MAPSEARCH_TOPRATED ) {
ADDRLP4 0+32
INDIRI4
CNSTI4 5
NEI4 $1583
line 1561
;1560:
;1561:				if (resultIndex == 0) {
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $1586
line 1562
;1562:					trap_SendServerCommand(ent - g_entities, va("print \"^%c%10s %-10s %-10s %-20s\n\""
ADDRGP4 $1588
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 $1589
ARGP4
ADDRGP4 $1590
ARGP4
ADDRGP4 $1543
ARGP4
ADDRGP4 $1292
ARGP4
ADDRLP4 340
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1569
;1563:						, '2'
;1564:						, "RATING"
;1565:						, "VOTECOUNT"
;1566:						, "MAPNUM"
;1567:						, "MAP/COURSE"
;1568:					));
;1569:				}
LABELV $1586
line 1570
;1570:				G_COOL_API_DB_GetFloat(0,&rating); 
CNSTI4 0
ARGI4
ADDRLP4 304
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 1571
;1571:				time = G_COOL_API_DB_GetInt(1); // reuse time variable but its vote count
CNSTI4 1
ARGI4
ADDRLP4 340
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 292
ADDRLP4 340
INDIRI4
ASGNI4
line 1572
;1572:				G_COOL_API_DB_GetString(2, course, sizeof(course));
CNSTI4 2
ARGI4
ADDRLP4 84
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1573
;1573:				subcourse[0] = '\0';
ADDRLP4 185
CNSTI1 0
ASGNI1
line 1575
;1574:
;1575:				infoHashed = G_GetArenaInfoByMap(course);
ADDRLP4 84
ARGP4
ADDRLP4 344
ADDRGP4 G_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 288
ADDRLP4 344
INDIRP4
ASGNP4
line 1577
;1576:
;1577:				trap_SendServerCommand(ent - g_entities, va("print \"^%c%10s %-10s %-10s %-20s\n\""
ADDRLP4 292
INDIRI4
CNSTI4 0
LEI4 $1596
ADDRGP4 $1591
ARGP4
ADDRLP4 304
INDIRF4
ARGF4
ADDRLP4 364
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 348
ADDRLP4 364
INDIRP4
ASGNP4
ADDRGP4 $1597
JUMPV
LABELV $1596
ADDRLP4 348
ADDRGP4 $1544
ASGNP4
LABELV $1597
ADDRLP4 292
INDIRI4
CNSTI4 0
LEI4 $1598
ADDRGP4 $732
ARGP4
ADDRLP4 292
INDIRI4
ARGI4
ADDRLP4 368
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 352
ADDRLP4 368
INDIRP4
ASGNP4
ADDRGP4 $1599
JUMPV
LABELV $1598
ADDRLP4 352
ADDRGP4 $1544
ASGNP4
LABELV $1599
ADDRLP4 288
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1600
ADDRGP4 $732
ARGP4
ADDRLP4 288
INDIRP4
CVPU4 4
ADDRGP4 g_arenaInfosHashed
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 12
DIVI4
ARGI4
ADDRLP4 372
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 356
ADDRLP4 372
INDIRP4
ASGNP4
ADDRGP4 $1601
JUMPV
LABELV $1600
ADDRLP4 356
ADDRGP4 $1544
ASGNP4
LABELV $1601
ADDRLP4 185
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1602
ADDRGP4 $650
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 185
ARGP4
ADDRLP4 376
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 360
ADDRLP4 376
INDIRP4
ASGNP4
ADDRGP4 $1603
JUMPV
LABELV $1602
ADDRLP4 360
ADDRLP4 84
ASGNP4
LABELV $1603
ADDRGP4 $1588
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 348
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 360
INDIRP4
ARGP4
ADDRLP4 380
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 380
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1584
;1578:					, '7'
;1579:					, time > 0 ? miniva("%.4f",rating) : "-"
;1580:					, time > 0 ? miniva("%d",time) : "-"
;1581:					, infoHashed ? miniva("%d", infoHashed - g_arenaInfosHashed) : "-"
;1582:					, subcourse[0] ? multiva("%s/%s", course, subcourse) : course
;1583:				));
;1584:			}
ADDRGP4 $1584
JUMPV
LABELV $1583
line 1585
;1585:			else if (data.type == MAPSEARCH_NOTWR || data.type == MAPSEARCH_WR) {
ADDRLP4 0+32
INDIRI4
CNSTI4 2
EQI4 $1608
ADDRLP4 0+32
INDIRI4
CNSTI4 3
NEI4 $1604
LABELV $1608
line 1587
;1586:
;1587:				if (resultIndex == 0) {
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $1609
line 1588
;1588:					trap_SendServerCommand(ent - g_entities, va("print \"^%c%5s %-7s %-7s %-12s %-7s %-9s %-8s %-20s\n\""
ADDRGP4 $1611
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 $1290
ARGP4
ADDRGP4 $1543
ARGP4
ADDRGP4 $1576
ARGP4
ADDRGP4 $1612
ARGP4
ADDRGP4 $1589
ARGP4
ADDRGP4 $1590
ARGP4
ADDRLP4 0+44
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1617
ADDRLP4 340
ADDRGP4 $1614
ASGNP4
ADDRGP4 $1618
JUMPV
LABELV $1617
ADDRLP4 340
ADDRGP4 $1615
ASGNP4
LABELV $1618
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 $1292
ARGP4
ADDRLP4 344
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 344
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1599
;1589:						, '2'
;1590:						, "RANK"
;1591:						, "MAPNUM"
;1592:						, "PLAYERS"
;1593:						, "TOPRUN"
;1594:						, "RATING"
;1595:						, "VOTECOUNT"
;1596:						, *data.userSearchTerm ? "PRATING" : "MYRATING"
;1597:						, "MAP/COURSE"
;1598:					));
;1599:				}
LABELV $1609
line 1601
;1600:
;1601:				G_COOL_API_DB_GetString(0, course, sizeof(course));
CNSTI4 0
ARGI4
ADDRLP4 84
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1602
;1602:				G_COOL_API_DB_GetString(1, subcourse, sizeof(subcourse));
CNSTI4 1
ARGI4
ADDRLP4 185
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1603
;1603:				anyRuns = G_COOL_API_DB_GetInt(2);
CNSTI4 2
ARGI4
ADDRLP4 340
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 320
ADDRLP4 340
INDIRI4
ASGNI4
line 1604
;1604:				rank = G_COOL_API_DB_GetInt(3);
CNSTI4 3
ARGI4
ADDRLP4 344
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 324
ADDRLP4 344
INDIRI4
ASGNI4
line 1605
;1605:				time = G_COOL_API_DB_GetInt(4); // player count, reusing vara
CNSTI4 4
ARGI4
ADDRLP4 348
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 292
ADDRLP4 348
INDIRI4
ASGNI4
line 1606
;1606:				G_COOL_API_DB_GetFloat(5,&rating);
CNSTI4 5
ARGI4
ADDRLP4 304
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 1607
;1607:				votecount = G_COOL_API_DB_GetInt(6); 
CNSTI4 6
ARGI4
ADDRLP4 352
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 308
ADDRLP4 352
INDIRI4
ASGNI4
line 1608
;1608:				G_COOL_API_DB_GetFloat(7,&myRating);
CNSTI4 7
ARGI4
ADDRLP4 328
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 1609
;1609:				haveMyRating = G_COOL_API_DB_GetInt(8);
CNSTI4 8
ARGI4
ADDRLP4 356
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 312
ADDRLP4 356
INDIRI4
ASGNI4
line 1610
;1610:				shortestRun = G_COOL_API_DB_GetInt(9);
CNSTI4 9
ARGI4
ADDRLP4 360
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 316
ADDRLP4 360
INDIRI4
ASGNI4
line 1612
;1611:
;1612:				infoHashed = G_GetArenaInfoByMap(course);
ADDRLP4 84
ARGP4
ADDRLP4 364
ADDRGP4 G_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 288
ADDRLP4 364
INDIRP4
ASGNP4
line 1614
;1613:
;1614:				trap_SendServerCommand(ent - g_entities, va("print \"^%c%5s %-7s %-7s %-12s %-7s %-9s %-8s %-20s\n\""
ADDRLP4 320
INDIRI4
CNSTI4 0
EQI4 $1627
ADDRGP4 $732
ARGP4
ADDRLP4 324
INDIRI4
ARGI4
ADDRLP4 400
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 368
ADDRLP4 400
INDIRP4
ASGNP4
ADDRGP4 $1628
JUMPV
LABELV $1627
ADDRLP4 368
ADDRGP4 $1544
ASGNP4
LABELV $1628
ADDRLP4 288
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1629
ADDRGP4 $732
ARGP4
ADDRLP4 288
INDIRP4
CVPU4 4
ADDRGP4 g_arenaInfosHashed
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 12
DIVI4
ARGI4
ADDRLP4 404
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 372
ADDRLP4 404
INDIRP4
ASGNP4
ADDRGP4 $1630
JUMPV
LABELV $1629
ADDRLP4 372
ADDRGP4 $1544
ASGNP4
LABELV $1630
ADDRLP4 292
INDIRI4
CNSTI4 0
LEI4 $1631
ADDRGP4 $732
ARGP4
ADDRLP4 292
INDIRI4
ARGI4
ADDRLP4 408
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 376
ADDRLP4 408
INDIRP4
ASGNP4
ADDRGP4 $1632
JUMPV
LABELV $1631
ADDRLP4 376
ADDRGP4 $1544
ASGNP4
LABELV $1632
ADDRLP4 292
INDIRI4
CNSTI4 0
LEI4 $1633
ADDRLP4 316
INDIRI4
ARGI4
ADDRLP4 412
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRLP4 380
ADDRLP4 412
INDIRP4
ASGNP4
ADDRGP4 $1634
JUMPV
LABELV $1633
ADDRLP4 380
ADDRGP4 $1544
ASGNP4
LABELV $1634
ADDRLP4 308
INDIRI4
CNSTI4 0
LEI4 $1635
ADDRGP4 $1591
ARGP4
ADDRLP4 304
INDIRF4
ARGF4
ADDRLP4 416
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 384
ADDRLP4 416
INDIRP4
ASGNP4
ADDRGP4 $1636
JUMPV
LABELV $1635
ADDRLP4 384
ADDRGP4 $1544
ASGNP4
LABELV $1636
ADDRLP4 308
INDIRI4
CNSTI4 0
LEI4 $1637
ADDRGP4 $732
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 420
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 388
ADDRLP4 420
INDIRP4
ASGNP4
ADDRGP4 $1638
JUMPV
LABELV $1637
ADDRLP4 388
ADDRGP4 $1544
ASGNP4
LABELV $1638
ADDRLP4 312
INDIRI4
CNSTI4 0
LEI4 $1639
ADDRGP4 $1591
ARGP4
ADDRLP4 328
INDIRF4
ARGF4
ADDRLP4 424
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 392
ADDRLP4 424
INDIRP4
ASGNP4
ADDRGP4 $1640
JUMPV
LABELV $1639
ADDRLP4 392
ADDRGP4 $1544
ASGNP4
LABELV $1640
ADDRLP4 185
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1641
ADDRGP4 $650
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 185
ARGP4
ADDRLP4 428
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 396
ADDRLP4 428
INDIRP4
ASGNP4
ADDRGP4 $1642
JUMPV
LABELV $1641
ADDRLP4 396
ADDRLP4 84
ASGNP4
LABELV $1642
ADDRGP4 $1611
ARGP4
CNSTI4 55
ARGI4
ADDRLP4 368
INDIRP4
ARGP4
ADDRLP4 372
INDIRP4
ARGP4
ADDRLP4 376
INDIRP4
ARGP4
ADDRLP4 380
INDIRP4
ARGP4
ADDRLP4 384
INDIRP4
ARGP4
ADDRLP4 388
INDIRP4
ARGP4
ADDRLP4 392
INDIRP4
ARGP4
ADDRLP4 396
INDIRP4
ARGP4
ADDRLP4 432
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 432
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1626
;1615:					, '7'
;1616:					, anyRuns? miniva("%d",rank) : "-"
;1617:					, infoHashed ? miniva("%d", infoHashed - g_arenaInfosHashed) : "-"
;1618:					, time > 0 ? miniva("%d", time) : "-"
;1619:					, time > 0 ? DF_MsToString(shortestRun) : "-"
;1620:					, votecount > 0 ? miniva("%.4f", rating) : "-"
;1621:					, votecount > 0 ? miniva("%d", votecount) : "-"
;1622:					, haveMyRating > 0 ? miniva("%.4f", myRating) : "-"
;1623:					, subcourse[0] ? multiva("%s/%s", course, subcourse) : course
;1624:				));
;1625:
;1626:			}
LABELV $1604
LABELV $1584
LABELV $1571
LABELV $1552
LABELV $1536
line 1627
;1627:			resultIndex++;
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1628
;1628:		}
LABELV $1533
line 1482
ADDRLP4 340
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
NEI4 $1532
line 1629
;1629:	}
line 1631
;1630:
;1631:	trap_SendServerCommand(ent - g_entities, va("print \"\n\""));
ADDRGP4 $1342
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1633
;1632:
;1633:	if (!data.styleSpecified && !data.pageSpecified) {
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 0+20
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $1643
ADDRLP4 0+28
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $1643
line 1634
;1634:		trap_SendServerCommand(ent - g_entities, va("print \"Note: You can specify movement style and page number.\n\""));
ADDRGP4 $1647
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1635
;1635:	}
ADDRGP4 $1644
JUMPV
LABELV $1643
line 1636
;1636:	else if (!data.pageSpecified) {
ADDRLP4 0+28
INDIRI4
CNSTI4 0
NEI4 $1648
line 1637
;1637:		trap_SendServerCommand(ent - g_entities, va("print \"Note: You can also specify page number.\n\""));
ADDRGP4 $1651
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1638
;1638:	} else if (!data.styleSpecified) {
ADDRGP4 $1649
JUMPV
LABELV $1648
ADDRLP4 0+20
INDIRI4
CNSTI4 0
NEI4 $1652
line 1639
;1639:		trap_SendServerCommand(ent - g_entities, va("print \"Note: You can also specify movement style.\n\""));
ADDRGP4 $1655
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1640
;1640:	}
LABELV $1652
LABELV $1649
LABELV $1644
line 1642
;1641:
;1642:	if (data.type == MAPSEARCH_HARDEST || data.type == MAPSEARCH_EASIEST) {
ADDRLP4 0+32
INDIRI4
CNSTI4 6
EQI4 $1660
ADDRLP4 0+32
INDIRI4
CNSTI4 7
NEI4 $1656
LABELV $1660
line 1643
;1643:		trap_SendServerCommand(ent - g_entities, va("print \"Note: Maps will only have a difficulty ratiing if enough active players played them for any given style.\n\""));
ADDRGP4 $1661
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1644
;1644:	}
LABELV $1656
line 1647
;1645:
;1646:
;1647:}
LABELV $1422
endproc G_ShortestLongestResult 436 40
proc G_RankResult 116 16
line 1648
;1648:static void G_RankResult(int status, const char* errorMessage, int affectedRows) {
line 1650
;1649:	rankRequestStruct_t data;
;1650:	gentity_t* ent = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 1651
;1651:	int resultIndex = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 1655
;1652:	char userName[USERNAME_MAX_LEN + 1];
;1653:	//evaluatedRunInfo_t eRunInfo;
;1654:
;1655:	G_COOL_API_DB_GetReference((byte*)&data, sizeof(data));
ADDRLP4 16
ARGP4
CNSTI4 40
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 1657
;1656:
;1657:	if (!(ent = DB_VerifyClient(data.clientnum, data.ip))) {
ADDRLP4 16+16
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 60
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 60
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1663
line 1658
;1658:		Com_Printf("^1Client %d rank results returned, user no longer valid.\n", data.clientnum);
ADDRGP4 $1666
ARGP4
ADDRLP4 16+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1659
;1659:		return;
ADDRGP4 $1662
JUMPV
LABELV $1663
line 1662
;1660:	}
;1661:
;1662:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $1668
line 1664
;1663:		// table doesn't exist. create it.
;1664:		G_CreateUserTable();
ADDRGP4 G_CreateUserTable
CALLV
pop
line 1665
;1665:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 1666
;1666:		trap_SendServerCommand(data.clientnum,"print \"^1Rank results display failed due to table not existing. Attempting to create. Please try again shortly.\n\"");
ADDRLP4 16+16
INDIRI4
ARGI4
ADDRGP4 $1671
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1667
;1667:		return;
ADDRGP4 $1662
JUMPV
LABELV $1668
line 1669
;1668:	}
;1669:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1672
line 1670
;1670:		trap_SendServerCommand(data.clientnum, va("print \"^1Rank map results failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $1675
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16+16
INDIRI4
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1671
;1671:		return;
ADDRGP4 $1662
JUMPV
LABELV $1672
line 1674
;1672:	}
;1673:
;1674:	userName[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 1676
;1675:
;1676:	trap_SendServerCommand(ent - g_entities, va("print \"Ranks in style %s in leaderboard type %s:\n\"", data.style < MV_NUMSTYLES ? moveStyleNames[data.style].string : "UNKNOWN", data.lbType < LB_TYPES_COUNT ? leaderboardNames[data.lbType].string : "UNKNOWN"));
ADDRGP4 $1676
ARGP4
ADDRLP4 16+32
INDIRI4
CNSTI4 13
GEI4 $1683
ADDRLP4 64
ADDRLP4 16+32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1684
JUMPV
LABELV $1683
ADDRLP4 64
ADDRGP4 $1232
ASGNP4
LABELV $1684
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 16+36
INDIRI4
CNSTI4 5
GEI4 $1685
ADDRLP4 68
ADDRLP4 16+36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 leaderboardNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1686
JUMPV
LABELV $1685
ADDRLP4 68
ADDRGP4 $1232
ASGNP4
LABELV $1686
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1678
;1677:
;1678:	{
ADDRGP4 $1688
JUMPV
LABELV $1687
line 1683
;1679:
;1680:		mainLeaderboardType_t lbType;
;1681:		int rank,golds,silvers,bronzes;
;1682:
;1683:		while (G_COOL_API_DB_NextRow()) {
line 1684
;1684:			G_COOL_API_DB_GetString(0,userName,sizeof(userName));
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1685
;1685:			golds = G_COOL_API_DB_GetInt(1);
CNSTI4 1
ARGI4
ADDRLP4 96
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 96
INDIRI4
ASGNI4
line 1686
;1686:			silvers = G_COOL_API_DB_GetInt(2);
CNSTI4 2
ARGI4
ADDRLP4 100
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 100
INDIRI4
ASGNI4
line 1687
;1687:			bronzes = G_COOL_API_DB_GetInt(3);
CNSTI4 3
ARGI4
ADDRLP4 104
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 104
INDIRI4
ASGNI4
line 1688
;1688:			rank = G_COOL_API_DB_GetInt(4);
CNSTI4 4
ARGI4
ADDRLP4 108
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 108
INDIRI4
ASGNI4
line 1690
;1689:
;1690:			trap_SendServerCommand(ent - g_entities, va("print \"#%-3d %10s: %4d world records\n\"",rank,userName,golds));
ADDRGP4 $1690
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1693
;1691:
;1692:			
;1693:			resultIndex++;
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1694
;1694:		}
LABELV $1688
line 1683
ADDRLP4 96
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $1687
line 1695
;1695:	}
line 1697
;1696:
;1697:	trap_SendServerCommand(ent - g_entities, va("print \"\n\""));
ADDRGP4 $1342
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1699
;1698:
;1699:	if (!data.styleSpecified && !data.pageSpecified) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 16+20
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $1691
ADDRLP4 16+28
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $1691
line 1700
;1700:		trap_SendServerCommand(ent - g_entities, va("print \"Note: You can specify movement style and page number.\n\""));
ADDRGP4 $1647
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1701
;1701:	}
ADDRGP4 $1692
JUMPV
LABELV $1691
line 1702
;1702:	else if (!data.pageSpecified) {
ADDRLP4 16+28
INDIRI4
CNSTI4 0
NEI4 $1695
line 1703
;1703:		trap_SendServerCommand(ent - g_entities, va("print \"Note: You can also specify page number.\n\""));
ADDRGP4 $1651
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1704
;1704:	} else if (!data.styleSpecified) {
ADDRGP4 $1696
JUMPV
LABELV $1695
ADDRLP4 16+20
INDIRI4
CNSTI4 0
NEI4 $1698
line 1705
;1705:		trap_SendServerCommand(ent - g_entities, va("print \"Note: You can also specify movement style.\n\""));
ADDRGP4 $1655
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1706
;1706:	}
LABELV $1698
LABELV $1696
LABELV $1692
line 1709
;1707:
;1708:
;1709:}
LABELV $1662
endproc G_RankResult 116 16
proc G_RateMapResult 60 20
line 1710
;1710:static void G_RateMapResult(int status, const char* errorMessage, int affectedRows) {
line 1712
;1711:	rateMapStruct_t data;
;1712:	gentity_t* ent = NULL;
ADDRLP4 28
CNSTP4 0
ASGNP4
line 1713
;1713:	int resultIndex = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 1716
;1714:	//evaluatedRunInfo_t eRunInfo;
;1715:
;1716:	G_COOL_API_DB_GetReference((byte*)&data, sizeof(data));
ADDRLP4 0
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 1718
;1717:
;1718:	if (!(ent = DB_VerifyClient(data.clientnum, data.ip))) {
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 36
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1702
line 1719
;1719:		Com_Printf("^1Client %d set map rating results returned, user no longer valid.\n", data.clientnum);
ADDRGP4 $1705
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1720
;1720:		return;
ADDRGP4 $1701
JUMPV
LABELV $1702
line 1723
;1721:	}
;1722:
;1723:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $1707
line 1725
;1724:		// table doesn't exist. create it.
;1725:		G_CreateMapRatingsTable();
ADDRGP4 G_CreateMapRatingsTable
CALLV
pop
line 1726
;1726:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 1727
;1727:		trap_SendServerCommand(data.clientnum,"print \"^1Rating map failed due to table not existing. Attempting to create. Please try again shortly.\n\"");
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 $1710
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1728
;1728:		return;
ADDRGP4 $1701
JUMPV
LABELV $1707
line 1730
;1729:	}
;1730:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1711
line 1731
;1731:		trap_SendServerCommand(data.clientnum, va("print \"^1Rating map failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $1714
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1732
;1732:		return;
ADDRGP4 $1701
JUMPV
LABELV $1711
line 1735
;1733:	}
;1734:
;1735:	trap_SendServerCommand(data.clientnum, va("print \"Thank you. You have rated this map ^%c%f/10^7 for style %s.%s\n\"", data.value > 6.5 ? '2' : (data.value > 4 ? '3' : '1'),data.value,data.style < MV_NUMSTYLES ? moveStyleNames[data.style].string : "UNKNOWN",affectedRows == 0 ? " ^3No change." : ""));
ADDRGP4 $1716
ARGP4
ADDRLP4 0+20
INDIRF4
CNSTF4 1087373312
LEF4 $1727
ADDRLP4 40
CNSTI4 50
ASGNI4
ADDRGP4 $1728
JUMPV
LABELV $1727
ADDRLP4 0+20
INDIRF4
CNSTF4 1082130432
LEF4 $1729
ADDRLP4 44
CNSTI4 51
ASGNI4
ADDRGP4 $1730
JUMPV
LABELV $1729
ADDRLP4 44
CNSTI4 49
ASGNI4
LABELV $1730
ADDRLP4 40
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $1728
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 0+20
INDIRF4
ARGF4
ADDRLP4 0+24
INDIRI4
CNSTI4 13
GEI4 $1731
ADDRLP4 48
ADDRLP4 0+24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1732
JUMPV
LABELV $1731
ADDRLP4 48
ADDRGP4 $1232
ASGNP4
LABELV $1732
ADDRLP4 48
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $1733
ADDRLP4 52
ADDRGP4 $1725
ASGNP4
ADDRGP4 $1734
JUMPV
LABELV $1733
ADDRLP4 52
ADDRGP4 $330
ASGNP4
LABELV $1734
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1737
;1736:
;1737:}
LABELV $1701
endproc G_RateMapResult 60 20
proc G_RateMapShowMineResult 68 16
line 1738
;1738:static void G_RateMapShowMineResult(int status, const char* errorMessage, int affectedRows) {
line 1740
;1739:	rateMapStruct_t data;
;1740:	gentity_t* ent = NULL;
ADDRLP4 28
CNSTP4 0
ASGNP4
line 1741
;1741:	int resultIndex = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 1744
;1742:	//evaluatedRunInfo_t eRunInfo;
;1743:
;1744:	G_COOL_API_DB_GetReference((byte*)&data, sizeof(data));
ADDRLP4 0
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 1746
;1745:
;1746:	if (!(ent = DB_VerifyClient(data.clientnum, data.ip))) {
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 36
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1736
line 1747
;1747:		Com_Printf("^1Client %d get map rating results returned, user no longer valid.\n", data.clientnum);
ADDRGP4 $1739
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1748
;1748:		return;
ADDRGP4 $1735
JUMPV
LABELV $1736
line 1751
;1749:	}
;1750:
;1751:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $1741
line 1753
;1752:		// table doesn't exist. create it.
;1753:		G_CreateMapRatingsTable();
ADDRGP4 G_CreateMapRatingsTable
CALLV
pop
line 1754
;1754:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 1755
;1755:		trap_SendServerCommand(data.clientnum,"print \"^1Getting map ratings failed due to table not existing. Attempting to create. Please try again shortly.\n\"");
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 $1744
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1756
;1756:		return;
ADDRGP4 $1735
JUMPV
LABELV $1741
line 1758
;1757:	}
;1758:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1745
line 1759
;1759:		trap_SendServerCommand(data.clientnum, va("print \"^1Getting map ratings failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $1748
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1760
;1760:		return;
ADDRGP4 $1735
JUMPV
LABELV $1745
line 1763
;1761:	}
;1762:
;1763:	trap_SendServerCommand(data.clientnum, "print \"Your current ratings for this map:\n\"");
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 $1750
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
ADDRGP4 $1752
JUMPV
LABELV $1751
line 1764
;1764:	while (G_COOL_API_DB_NextRow()) {
line 1767
;1765:		int style;
;1766:		float rating;
;1767:		style = G_COOL_API_DB_GetInt(0);
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
line 1768
;1768:		G_COOL_API_DB_GetFloat(1, &rating);
CNSTI4 1
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 1769
;1769:		trap_SendServerCommand(data.clientnum, va("print \"^%c%f/10^7 for style %s.\n\"", rating > 6.5 ? '2' : (rating > 4 ? '3' : '1'), rating, style < MV_NUMSTYLES ? moveStyleNames[style].string : "UNKNOWN"));
ADDRGP4 $1755
ARGP4
ADDRLP4 40
INDIRF4
CNSTF4 1087373312
LEF4 $1759
ADDRLP4 52
CNSTI4 50
ASGNI4
ADDRGP4 $1760
JUMPV
LABELV $1759
ADDRLP4 40
INDIRF4
CNSTF4 1082130432
LEF4 $1761
ADDRLP4 56
CNSTI4 51
ASGNI4
ADDRGP4 $1762
JUMPV
LABELV $1761
ADDRLP4 56
CNSTI4 49
ASGNI4
LABELV $1762
ADDRLP4 52
ADDRLP4 56
INDIRI4
ASGNI4
LABELV $1760
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
CNSTI4 13
GEI4 $1763
ADDRLP4 60
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1764
JUMPV
LABELV $1763
ADDRLP4 60
ADDRGP4 $1232
ASGNP4
LABELV $1764
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1770
;1770:	}
LABELV $1752
line 1764
ADDRLP4 40
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1751
line 1772
;1771:
;1772:}
LABELV $1735
endproc G_RateMapShowMineResult 68 16
proc G_MapListUnplayedResult 180 16
line 1773
;1773:static void G_MapListUnplayedResult(int status, const char* errorMessage, int affectedRows) {
line 1775
;1774:	maplistUnplayedRequestStruct_t data;
;1775:	gentity_t* ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1776
;1776:	int resultIndex = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 1779
;1777:	//evaluatedRunInfo_t eRunInfo;
;1778:
;1779:	G_COOL_API_DB_GetReference((byte*)&data, sizeof(data));
ADDRLP4 4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 1781
;1780:
;1781:	if (!(ent = DB_VerifyClient(data.clientnum, data.ip))) {
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 28
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1766
line 1782
;1782:		Com_Printf("^1Client %d unplayed maplist returned, user no longer valid.\n", data.clientnum);
ADDRGP4 $1769
ARGP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1783
;1783:		return;
ADDRGP4 $1765
JUMPV
LABELV $1766
line 1786
;1784:	}
;1785:
;1786:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $1771
line 1788
;1787:		// table doesn't exist. create it.
;1788:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 1789
;1789:		trap_SendServerCommand(data.clientnum,"print \"^1Unplayed maplist display failed due to table not existing. Attempting to create. Please try again shortly.\n\"");
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRGP4 $1774
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1790
;1790:		return;
ADDRGP4 $1765
JUMPV
LABELV $1771
line 1792
;1791:	}
;1792:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1775
line 1793
;1793:		trap_SendServerCommand(data.clientnum, va("print \"^1Unplayed maplist failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $1778
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1794
;1794:		return;
ADDRGP4 $1765
JUMPV
LABELV $1775
line 1796
;1795:	}
;1796:	else {
line 1798
;1797:
;1798:		int			mapsinmessage = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 1799
;1799:		const char*	mapName = NULL;
ADDRLP4 136
CNSTP4 0
ASGNP4
line 1804
;1800:		char		currentMap[COURSENAME_MAX_LEN + 1];
;1801:		int			mapNum;
;1802:		infoHashed_t* mapInfo;
;1803:
;1804:		G_BufferedSendOrPrint(ent, qfalse, qfalse, "^2----------^7INSTALLED MAPS (UNPLAYED)^2---------\n");
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 152
CNSTI4 0
ASGNI4
ADDRLP4 152
INDIRI4
ARGI4
ADDRLP4 152
INDIRI4
ARGI4
ADDRGP4 $1779
ARGP4
ADDRGP4 G_BufferedSendOrPrint
CALLV
pop
ADDRGP4 $1781
JUMPV
LABELV $1780
line 1806
;1805:
;1806:		while (G_COOL_API_DB_NextRow()) {
line 1807
;1807:			G_COOL_API_DB_GetString(0, currentMap, sizeof(currentMap));
CNSTI4 0
ARGI4
ADDRLP4 32
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1809
;1808:
;1809:			mapInfo = G_GetArenaInfoByMap(currentMap);
ADDRLP4 32
ARGP4
ADDRLP4 156
ADDRGP4 G_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 156
INDIRP4
ASGNP4
line 1810
;1810:			if (!mapInfo) {
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1783
line 1811
;1811:				continue;
ADDRGP4 $1781
JUMPV
LABELV $1783
line 1814
;1812:			}
;1813:
;1814:			mapName = mapInfo->name; 
ADDRLP4 136
ADDRLP4 140
INDIRP4
INDIRP4
ASGNP4
line 1815
;1815:			mapNum = mapInfo - g_arenaInfosHashed;
ADDRLP4 144
ADDRLP4 140
INDIRP4
CVPU4 4
ADDRGP4 g_arenaInfosHashed
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 12
DIVI4
ASGNI4
line 1817
;1816:
;1817:			if (strlen(mapName) < 1 || !Q_stricmp(mapName, "<NULL>")) {
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 160
INDIRU4
CNSTU4 1
LTU4 $1788
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 $1787
ARGP4
ADDRLP4 164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $1785
LABELV $1788
line 1819
;1818:
;1819:				if (mapNum == (g_numArenas - 1)) {
ADDRLP4 144
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
CNSTI4 1
SUBI4
NEI4 $1781
line 1820
;1820:					G_BufferedSendOrPrint(ent, qfalse, qfalse, "\n");
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 168
INDIRI4
ARGI4
ADDRLP4 168
INDIRI4
ARGI4
ADDRGP4 $728
ARGP4
ADDRGP4 G_BufferedSendOrPrint
CALLV
pop
line 1821
;1821:					mapsinmessage = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 1822
;1822:				}
line 1823
;1823:				continue;
ADDRGP4 $1781
JUMPV
LABELV $1785
line 1826
;1824:			}
;1825:
;1826:			Q_strncpyz(currentMap, mapName, 24);
ADDRLP4 32
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
CNSTI4 24
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1827
;1827:			G_BufferedSendOrPrint(ent, qfalse, qfalse, va("^7[^2%03i^7] %-24s", mapNum, currentMap));
ADDRGP4 $1791
ARGP4
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 32
ARGP4
ADDRLP4 168
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 172
INDIRI4
ARGI4
ADDRLP4 172
INDIRI4
ARGI4
ADDRLP4 168
INDIRP4
ARGP4
ADDRGP4 G_BufferedSendOrPrint
CALLV
pop
line 1829
;1828:
;1829:			mapsinmessage++;
ADDRLP4 148
ADDRLP4 148
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1831
;1830:
;1831:			if ((mapsinmessage >= 5) || (mapNum == (g_numArenas - 1))) {
ADDRLP4 148
INDIRI4
CNSTI4 5
GEI4 $1794
ADDRLP4 144
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
CNSTI4 1
SUBI4
NEI4 $1792
LABELV $1794
line 1832
;1832:				G_BufferedSendOrPrint(ent, qfalse, qfalse, "\n");
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 176
CNSTI4 0
ASGNI4
ADDRLP4 176
INDIRI4
ARGI4
ADDRLP4 176
INDIRI4
ARGI4
ADDRGP4 $728
ARGP4
ADDRGP4 G_BufferedSendOrPrint
CALLV
pop
line 1833
;1833:				mapsinmessage = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 1834
;1834:			}
LABELV $1792
line 1835
;1835:		}
LABELV $1781
line 1806
ADDRLP4 156
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
NEI4 $1780
line 1837
;1836:
;1837:		if ((mapsinmessage >= 1)) {
ADDRLP4 148
INDIRI4
CNSTI4 1
LTI4 $1795
line 1838
;1838:			G_BufferedSendOrPrint(ent, qfalse, qfalse, "\n");
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 160
CNSTI4 0
ASGNI4
ADDRLP4 160
INDIRI4
ARGI4
ADDRLP4 160
INDIRI4
ARGI4
ADDRGP4 $728
ARGP4
ADDRGP4 G_BufferedSendOrPrint
CALLV
pop
line 1839
;1839:			mapsinmessage = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 1840
;1840:		}
LABELV $1795
line 1842
;1841:
;1842:		G_BufferedSendOrPrintFlush(ent, qfalse);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_BufferedSendOrPrintFlush
CALLV
pop
line 1843
;1843:	}
line 1848
;1844:
;1845:
;1846:
;1847:
;1848:}
LABELV $1765
endproc G_MapListUnplayedResult 180 16
bss
align 1
LABELV $1814
skip 101
align 1
LABELV $1815
skip 20
align 1
LABELV $1816
skip 11
code
proc G_SubContestLBResult 132 28
line 1849
;1849:static void G_SubContestLBResult(int status, const char* errorMessage, int affectedRows) {
line 1851
;1850:	subContestLeaderboardRequestStruct_t lbRequestData;
;1851:	gentity_t* ent = NULL;
ADDRLP4 32
CNSTP4 0
ASGNP4
line 1853
;1852:	//int rank = 1;
;1853:	int index = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 1855
;1854:
;1855:	G_COOL_API_DB_GetReference((byte*)&lbRequestData, sizeof(lbRequestData));
ADDRLP4 0
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 1857
;1856:
;1857:	if (!(ent = DB_VerifyClient(lbRequestData.clientnum, lbRequestData.ip))) {
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 32
ADDRLP4 36
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1798
line 1858
;1858:		Com_Printf("^1Client %d subcontest results returned, user no longer valid.\n", lbRequestData.clientnum);
ADDRGP4 $1801
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1859
;1859:		return;
ADDRGP4 $1797
JUMPV
LABELV $1798
line 1862
;1860:	}
;1861:
;1862:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $1803
line 1864
;1863:		// table doesn't exist. create it.
;1864:		G_CreateUserTable();
ADDRGP4 G_CreateUserTable
CALLV
pop
line 1865
;1865:		G_CreateSubContestsTable();
ADDRGP4 G_CreateSubContestsTable
CALLV
pop
line 1866
;1866:		trap_SendServerCommand(lbRequestData.clientnum,"print \"^1Subcontest display failed due to table not existing. Attempting to create. Please try again shortly.\n\"");
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 $1806
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1867
;1867:		return;
ADDRGP4 $1797
JUMPV
LABELV $1803
line 1869
;1868:	}
;1869:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1812
line 1870
;1870:		trap_SendServerCommand(lbRequestData.clientnum, va("print \"^1Subcontest display failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $1810
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1871
;1871:		return;
ADDRGP4 $1797
JUMPV
LABELV $1811
line 1874
;1872:	}
;1873:
;1874:	while (G_COOL_API_DB_NextRow()) {
line 1882
;1875:		int userid,msec,extraValue3,extraValue4;
;1876:		float value,extraValue1,extraValue2;
;1877:		int realRank;
;1878:		static char coursename[COURSENAME_MAX_LEN + 1];
;1879:		static char when[20];
;1880:		static char username[USERNAME_MAX_LEN + 1];
;1881:
;1882:		userid = G_COOL_API_DB_GetInt(0);
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 72
INDIRI4
ASGNI4
line 1883
;1883:		realRank = G_COOL_API_DB_GetInt(10)-1;
CNSTI4 10
ARGI4
ADDRLP4 76
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 76
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1885
;1884:
;1885:		if (userid != -1 && (realRank < lbRequestData.page * 10 || realRank >= ((lbRequestData.page + 1) * 10))) continue;
ADDRLP4 40
INDIRI4
CNSTI4 -1
EQI4 $1817
ADDRLP4 84
CNSTI4 10
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 84
INDIRI4
ADDRLP4 0+24
INDIRI4
MULI4
LTI4 $1821
ADDRLP4 48
INDIRI4
ADDRLP4 84
INDIRI4
ADDRLP4 0+24
INDIRI4
MULI4
ADDRLP4 84
INDIRI4
ADDI4
LTI4 $1817
LABELV $1821
ADDRGP4 $1812
JUMPV
LABELV $1817
line 1887
;1886:
;1887:		if (!index) {
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1822
line 1888
;1888:			trap_SendServerCommand(lbRequestData.clientnum, va("print \"^2ROLLYMPICS\n"));
ADDRGP4 $1825
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1889
;1889:		}
LABELV $1822
line 1890
;1890:		G_COOL_API_DB_GetString(1, username, sizeof(username));
CNSTI4 1
ARGI4
ADDRGP4 $1816
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1891
;1891:		G_COOL_API_DB_GetFloat(2, &value);
CNSTI4 2
ARGI4
ADDRLP4 52
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 1892
;1892:		G_COOL_API_DB_GetString(3, when, sizeof(when));
CNSTI4 3
ARGI4
ADDRGP4 $1815
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1893
;1893:		G_COOL_API_DB_GetString(4, coursename, sizeof(coursename));
CNSTI4 4
ARGI4
ADDRGP4 $1814
ARGP4
CNSTI4 101
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 1894
;1894:		msec = G_COOL_API_DB_GetInt(5);
CNSTI4 5
ARGI4
ADDRLP4 88
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 88
INDIRI4
ASGNI4
line 1895
;1895:		G_COOL_API_DB_GetFloat(6, &extraValue1);
CNSTI4 6
ARGI4
ADDRLP4 64
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 1896
;1896:		G_COOL_API_DB_GetFloat(7, &extraValue2);
CNSTI4 7
ARGI4
ADDRLP4 68
ARGP4
ADDRGP4 G_COOL_API_DB_GetFloat
CALLV
pop
line 1897
;1897:		extraValue3 = G_COOL_API_DB_GetInt(8);
CNSTI4 8
ARGI4
ADDRLP4 92
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 56
ADDRLP4 92
INDIRI4
ASGNI4
line 1898
;1898:		extraValue4 = G_COOL_API_DB_GetInt(9);
CNSTI4 9
ARGI4
ADDRLP4 96
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 96
INDIRI4
ASGNI4
line 1901
;1899:
;1900:
;1901:		trap_SendServerCommand(lbRequestData.clientnum, va("print \"^3%-3s ^7%-10s  ^3%4.2f^7ups ^3%6s^7fps ^3%s ^7on ^3%s\n\"",userid==-1 ? "" : miniva("#%d",realRank+1), userid==-1 ?"!unlogged!" : username, value, MSECSTRING(msec), when, coursename));
ADDRLP4 40
INDIRI4
CNSTI4 -1
NEI4 $1833
ADDRLP4 100
ADDRGP4 $330
ASGNP4
ADDRGP4 $1834
JUMPV
LABELV $1833
ADDRGP4 $1325
ARGP4
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 120
ADDRGP4 miniva
CALLP4
ASGNP4
ADDRLP4 100
ADDRLP4 120
INDIRP4
ASGNP4
LABELV $1834
ADDRLP4 44
INDIRI4
CNSTI4 -1
NEI4 $1835
ADDRLP4 104
ADDRGP4 $737
ASGNP4
ADDRGP4 $1836
JUMPV
LABELV $1835
ADDRLP4 44
INDIRI4
CNSTI4 -2
NEI4 $1837
ADDRLP4 108
ADDRGP4 $738
ASGNP4
ADDRGP4 $1838
JUMPV
LABELV $1837
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $1839
ADDRLP4 112
ADDRGP4 $739
ASGNP4
ADDRGP4 $1840
JUMPV
LABELV $1839
ADDRGP4 $732
ARGP4
CNSTI4 1000
ADDRLP4 44
INDIRI4
DIVI4
ARGI4
ADDRLP4 124
ADDRGP4 multiva
CALLP4
ASGNP4
ADDRLP4 112
ADDRLP4 124
INDIRP4
ASGNP4
LABELV $1840
ADDRLP4 108
ADDRLP4 112
INDIRP4
ASGNP4
LABELV $1838
ADDRLP4 104
ADDRLP4 108
INDIRP4
ASGNP4
LABELV $1836
ADDRGP4 $1827
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 -1
NEI4 $1841
ADDRLP4 116
ADDRGP4 $677
ASGNP4
ADDRGP4 $1842
JUMPV
LABELV $1841
ADDRLP4 116
ADDRGP4 $1816
ASGNP4
LABELV $1842
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 $1815
ARGP4
ADDRGP4 $1814
ARGP4
ADDRLP4 128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1903
;1902:
;1903:		if (userid != -1) {
ADDRLP4 40
INDIRI4
CNSTI4 -1
EQI4 $1843
line 1905
;1904:			//rank++;
;1905:		}
LABELV $1843
line 1906
;1906:		index++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1907
;1907:	}
LABELV $1812
line 1874
ADDRLP4 40
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1811
line 1911
;1908:
;1909:	
;1910:
;1911:}
LABELV $1797
endproc G_SubContestLBResult 132 28
proc G_TimeResult 300 28
line 1917
;1912:
;1913:
;1914:void DF_RequestPlayerDefaultTime(gentity_t* ent);
;1915:
;1916:
;1917:static void G_TimeResult(int status, const char* errorMessage, int affectedRows) {
line 1919
;1918:	timeRequestStruct_t lbRequestData;
;1919:	gentity_t* ent = NULL;
ADDRLP4 248
CNSTP4 0
ASGNP4
line 1921
;1920:
;1921:	G_COOL_API_DB_GetReference((byte*)&lbRequestData, sizeof(lbRequestData));
ADDRLP4 0
ARGP4
CNSTI4 248
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 1923
;1922:
;1923:	if (!(ent = DB_VerifyClient(lbRequestData.clientnum, lbRequestData.ip))) {
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 252
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 248
ADDRLP4 252
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1846
line 1924
;1924:		Com_Printf("^1Client %d time returned, user no longer valid.\n", lbRequestData.clientnum);
ADDRGP4 $1849
ARGP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1925
;1925:		return;
ADDRGP4 $1845
JUMPV
LABELV $1846
line 1928
;1926:	}
;1927:
;1928:	if (status == 1146) {
ADDRFP4 0
INDIRI4
CNSTI4 1146
NEI4 $1851
line 1930
;1929:		// table doesn't exist. create it.
;1930:		G_CreateUserTable();
ADDRGP4 G_CreateUserTable
CALLV
pop
line 1931
;1931:		G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 1932
;1932:		trap_SendServerCommand(lbRequestData.clientnum,"print \"^1Time display failed due to table not existing. Attempting to create. Please try again shortly.\n\"");
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRGP4 $1854
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1933
;1933:		return;
ADDRGP4 $1845
JUMPV
LABELV $1851
line 1935
;1934:	}
;1935:	else if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1855
line 1936
;1936:		trap_SendServerCommand(lbRequestData.clientnum, va("print \"^1Time display failed with status %d and error message %s.\n\"", status, errorMessage));
ADDRGP4 $1858
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 256
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+16
INDIRI4
ARGI4
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1937
;1937:		return;
ADDRGP4 $1845
JUMPV
LABELV $1855
line 1940
;1938:	}
;1939:	
;1940:	if (Q_stricmp(lbRequestData.course, DF_GetCourseName(qfalse)) && lbRequestData.forUserInfo) {
CNSTI4 0
ARGI4
ADDRLP4 256
ADDRGP4 DF_GetCourseName
CALLP4
ASGNP4
ADDRLP4 0+36
ARGP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 264
CNSTI4 0
ASGNI4
ADDRLP4 260
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $1859
ADDRLP4 0+244
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $1859
line 1942
;1941:		// this isn't the correct course.
;1942:		Com_Printf("^1Coursename changed, requested time not useful. Requesting new pb for client %d",ent-g_entities);
ADDRGP4 $1863
ARGP4
ADDRLP4 248
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1943
;1943:		DF_RequestPlayerDefaultTime(ent);
ADDRLP4 248
INDIRP4
ARGP4
ADDRGP4 DF_RequestPlayerDefaultTime
CALLV
pop
line 1944
;1944:		return;
ADDRGP4 $1845
JUMPV
LABELV $1859
line 1947
;1945:	}
;1946:
;1947:	if (G_COOL_API_DB_NextRow()) {
ADDRLP4 268
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $1864
line 1949
;1948:		int time;
;1949:		time = G_COOL_API_DB_GetInt(0);
CNSTI4 0
ARGI4
ADDRLP4 276
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 272
ADDRLP4 276
INDIRI4
ASGNI4
line 1951
;1950:
;1951:		if (lbRequestData.forUserInfo) {
ADDRLP4 0+244
INDIRI4
CNSTI4 0
EQI4 $1866
line 1953
;1952:			//if (time != ent->client->pers.raceBestTime) { // dont check, this is just called from login, which doesnt do the calc, so we always do it.
;1953:				ent->client->pers.raceBestTime = time;
ADDRLP4 248
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 22076
ADDP4
ADDRLP4 272
INDIRI4
ASGNI4
line 1954
;1954:				CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1955
;1955:				ClientUserinfoChanged(ent - g_entities);
ADDRLP4 248
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1957
;1956:			//}
;1957:		}
ADDRGP4 $1865
JUMPV
LABELV $1866
line 1958
;1958:		else {
line 1960
;1959:
;1960:			if (!Q_stricmp(DF_GetCourseName(qfalse), lbRequestData.course)) {
CNSTI4 0
ARGI4
ADDRLP4 280
ADDRGP4 DF_GetCourseName
CALLP4
ASGNP4
ADDRLP4 280
INDIRP4
ARGP4
ADDRLP4 0+36
ARGP4
ADDRLP4 284
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $1869
line 1961
;1961:				if (lbRequestData.subcourse[0]) {
ADDRLP4 0+137
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1872
line 1962
;1962:					trap_SendServerCommand(-1, va("print \"%s's ^7best time on %s leaderboard in style %s on subcourse %s is %s\n\"", ent->client->pers.netname, leaderboardNames[lbRequestData.lbType].string, moveStyleNames[lbRequestData.style].string, lbRequestData.subcourse, DF_MsToString(time)));
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 288
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRGP4 $1875
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 292
CNSTI4 2
ASGNI4
ADDRLP4 0+32
INDIRI4
ADDRLP4 292
INDIRI4
LSHI4
ADDRGP4 leaderboardNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 0+240
INDIRI4
ADDRLP4 292
INDIRI4
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 0+137
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 296
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1963
;1963:				}
ADDRGP4 $1865
JUMPV
LABELV $1872
line 1965
;1964:				else
;1965:				{
line 1966
;1966:					trap_SendServerCommand(-1, va("print \"%s's ^7best time on %s leaderboard in style %s is %s\n\"", ent->client->pers.netname, leaderboardNames[lbRequestData.lbType].string, moveStyleNames[lbRequestData.style].string, DF_MsToString(time)));
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 288
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRGP4 $1879
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 292
CNSTI4 2
ASGNI4
ADDRLP4 0+32
INDIRI4
ADDRLP4 292
INDIRI4
LSHI4
ADDRGP4 leaderboardNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 0+240
INDIRI4
ADDRLP4 292
INDIRI4
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 296
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1967
;1967:				}
line 1968
;1968:			}
ADDRGP4 $1865
JUMPV
LABELV $1869
line 1969
;1969:			else {
line 1970
;1970:				if (lbRequestData.subcourse[0]) {
ADDRLP4 0+137
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1882
line 1971
;1971:					trap_SendServerCommand(-1, va("print \"%s's ^7best time on %s leaderboard in style %s on %s/%s is %s\n\"", ent->client->pers.netname, leaderboardNames[lbRequestData.lbType].string, moveStyleNames[lbRequestData.style].string, lbRequestData.course, lbRequestData.subcourse, DF_MsToString(time)));
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 288
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRGP4 $1885
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 292
CNSTI4 2
ASGNI4
ADDRLP4 0+32
INDIRI4
ADDRLP4 292
INDIRI4
LSHI4
ADDRGP4 leaderboardNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 0+240
INDIRI4
ADDRLP4 292
INDIRI4
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 0+36
ARGP4
ADDRLP4 0+137
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 296
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1972
;1972:				}
ADDRGP4 $1865
JUMPV
LABELV $1882
line 1974
;1973:				else
;1974:				{
line 1975
;1975:					trap_SendServerCommand(-1, va("print \"%s's ^7best time on %s leaderboard in style %s on %s is %s\n\"", ent->client->pers.netname, leaderboardNames[lbRequestData.lbType].string, moveStyleNames[lbRequestData.style].string, lbRequestData.course, DF_MsToString(time)));
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 288
ADDRGP4 DF_MsToString
CALLP4
ASGNP4
ADDRGP4 $1890
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 292
CNSTI4 2
ASGNI4
ADDRLP4 0+32
INDIRI4
ADDRLP4 292
INDIRI4
LSHI4
ADDRGP4 leaderboardNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 0+240
INDIRI4
ADDRLP4 292
INDIRI4
LSHI4
ADDRGP4 moveStyleNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 0+36
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 296
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1976
;1976:				}
line 1977
;1977:			}
line 1978
;1978:		}
line 1979
;1979:	}
ADDRGP4 $1865
JUMPV
LABELV $1864
line 1980
;1980:	else if (lbRequestData.forUserInfo) {
ADDRLP4 0+244
INDIRI4
CNSTI4 0
EQI4 $1894
line 1982
;1981:
;1982:		ent->client->pers.raceBestTime = 0;
ADDRLP4 248
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 22076
ADDP4
CNSTI4 0
ASGNI4
line 1983
;1983:		CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1984
;1984:	} 
LABELV $1894
LABELV $1865
line 1988
;1985:
;1986:	
;1987:
;1988:}
LABELV $1845
endproc G_TimeResult 300 28
bss
align 1
LABELV $1898
skip 1024
code
proc G_LoginContinue 36 16
line 1989
;1989:static void G_LoginContinue(loginRegisterStruct_t* loginData) {
line 1991
;1990:	static char		cryptedPw[MAX_STRING_CHARS];
;1991:	const char* request = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 1992
;1992:	gentity_t* ent = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1993
;1993:	gclient_t* client = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1995
;1994:
;1995:	if (!(ent = DB_VerifyClient(loginData->clientnum, loginData->ip))) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1899
line 1996
;1996:		Com_Printf("^1Login failed, user no longer valid (#2).\n");
ADDRGP4 $1901
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1997
;1997:		return;
ADDRGP4 $1897
JUMPV
LABELV $1899
line 1999
;1998:	}
;1999:	if (strcmp(loginData->password, loginData->dbPassword)) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1052
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 2076
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1902
line 2000
;2000:		trap_SendServerCommand(loginData->clientnum, "print \"^1Login failed, password doesn't match.\n\"");
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1904
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2001
;2001:		return;
ADDRGP4 $1897
JUMPV
LABELV $1902
line 2004
;2002:	}
;2003:
;2004:	client = ent->client;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 2006
;2005:
;2006:	Q_strncpyz(client->sess.login.name, loginData->username,sizeof(client->sess.login.name));
ADDRLP4 0
INDIRP4
CNSTI4 43548
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2007
;2007:	client->sess.login.id = loginData->userId;
ADDRLP4 0
INDIRP4
CNSTI4 43540
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2008
;2008:	client->sess.login.flags = loginData->userFlags;
ADDRLP4 0
INDIRP4
CNSTI4 43544
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 3104
ADDP4
INDIRI4
ASGNI4
line 2009
;2009:	client->sess.login.loggedIn = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 43560
ADDP4
CNSTI4 1
ASGNI4
line 2010
;2010:	client->sess.login.forceLoggedIn = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 43564
ADDP4
CNSTI4 0
ASGNI4
line 2012
;2011:	//if (client->pers.raceBestTime) {
;2012:		client->pers.raceBestTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 22076
ADDP4
CNSTI4 0
ASGNI4
line 2015
;2013:		//CalculateRanks(); // we do this in the response handler for DF_RequestPlayerDefaultTime, to avoid audio spam of rank changes
;2014:	//}
;2015:	DF_SetSubContestDefaults(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 DF_SetSubContestDefaults
CALLV
pop
line 2017
;2016:
;2017:	DF_RequestPlayerDefaultTime(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 DF_RequestPlayerDefaultTime
CALLV
pop
line 2019
;2018:
;2019:	trap_SendServerCommand(loginData->clientnum, va("print \"^2Successfully logged in as '%s'.\n\"",loginData->username));
ADDRGP4 $1905
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2022
;2020:	//trap_SendServerCommand(-1, va("print \"^2%s ^7logged in as '%s'.\n\"",client ? client->pers.netname : "", loginData->username));
;2021:
;2022:	ClientUserinfoChanged(ent - g_entities);
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2025
;2023:
;2024:	// fire and forget, not that important
;2025:	G_COOL_API_DB_AddRequest(NULL, 0, DBREQUEST_LOGIN_UPDATELASTLOGIN,
ADDRGP4 $1906
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_COOL_API_DB_AddRequest
CALLI4
pop
line 2027
;2026:		va("UPDATE users SET lastlogin=NOW() WHERE id=%d", loginData->userId));
;2027:}
LABELV $1897
endproc G_LoginContinue 36 16
bss
align 1
LABELV $1908
skip 1024
code
proc G_ForceLoginContinue 3192 16
line 2029
;2028:
;2029:static void G_ForceLoginContinue(int status, const char* errorMessage, int affectedRows) {
line 2031
;2030:	static char		cryptedPw[MAX_STRING_CHARS];
;2031:	const char* request = NULL;
ADDRLP4 3156
CNSTP4 0
ASGNP4
line 2032
;2032:	gentity_t* ent = NULL;
ADDRLP4 3148
CNSTP4 0
ASGNP4
line 2033
;2033:	gclient_t* client = NULL;
ADDRLP4 3132
CNSTP4 0
ASGNP4
line 2034
;2034:	gentity_t* adminEnt = NULL;
ADDRLP4 3152
CNSTP4 0
ASGNP4
line 2038
;2035:	loginRegisterStruct_t data;
;2036:	char usernameDb[USERNAME_MAX_LEN + 1];
;2037:
;2038:	G_COOL_API_DB_GetReference((byte*)&data, sizeof(data));
ADDRLP4 0
ARGP4
CNSTI4 3132
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 2040
;2039:
;2040:	if (!(adminEnt = DB_VerifyClient(data.clientnumAdmin, data.ipAdmin))) {
ADDRLP4 0+3128
INDIRI4
ARGI4
ADDRLP4 0+3112
ARGP4
ADDRLP4 3160
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 3152
ADDRLP4 3160
INDIRP4
ASGNP4
ADDRLP4 3160
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1909
line 2041
;2041:		Com_Printf("^1Client %d force login as %s returned, admin no longer valid.\n", data.clientnum, data.username);
ADDRGP4 $1913
ARGP4
ADDRLP4 0+24
INDIRI4
ARGI4
ADDRLP4 0+28
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2042
;2042:	}
LABELV $1909
line 2043
;2043:	if (!(ent = DB_VerifyClient(data.clientnum, data.ip))) {
ADDRLP4 0+24
INDIRI4
ARGI4
ADDRLP4 0+8
ARGP4
ADDRLP4 3164
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 3148
ADDRLP4 3164
INDIRP4
ASGNP4
ADDRLP4 3164
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1916
line 2044
;2044:		if (adminEnt) {
ADDRLP4 3152
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1920
line 2045
;2045:			trap_SendServerCommand(data.clientnumAdmin, va("print \"^1Client %d force login as %s returned, user no longer valid.\n\"", data.clientnum, data.username));
ADDRGP4 $1923
ARGP4
ADDRLP4 0+24
INDIRI4
ARGI4
ADDRLP4 0+28
ARGP4
ADDRLP4 3168
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+3128
INDIRI4
ARGI4
ADDRLP4 3168
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2046
;2046:		}
ADDRGP4 $1907
JUMPV
LABELV $1920
line 2047
;2047:		else {
line 2048
;2048:			Com_Printf("^1Client %d force login as %s returned, user no longer valid.\n", data.clientnum, data.username);
ADDRGP4 $1926
ARGP4
ADDRLP4 0+24
INDIRI4
ARGI4
ADDRLP4 0+28
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2049
;2049:		}
line 2050
;2050:		return;
ADDRGP4 $1907
JUMPV
LABELV $1916
line 2053
;2051:	}
;2052:
;2053:	if (!G_COOL_API_DB_NextRow()) {
ADDRLP4 3168
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 3168
INDIRI4
CNSTI4 0
NEI4 $1929
line 2054
;2054:		if (adminEnt) {
ADDRLP4 3152
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1931
line 2055
;2055:			trap_SendServerCommand(data.clientnumAdmin, va("print \"^1Client %d force login as %s returned, username not found.\n\"", data.clientnum, data.username));
ADDRGP4 $1934
ARGP4
ADDRLP4 0+24
INDIRI4
ARGI4
ADDRLP4 0+28
ARGP4
ADDRLP4 3172
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+3128
INDIRI4
ARGI4
ADDRLP4 3172
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2056
;2056:		}
ADDRGP4 $1907
JUMPV
LABELV $1931
line 2057
;2057:		else {
line 2058
;2058:			Com_Printf("^1Client %d force login as %s returned, username not found.\n", data.clientnum, data.username);
ADDRGP4 $1937
ARGP4
ADDRLP4 0+24
INDIRI4
ARGI4
ADDRLP4 0+28
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2059
;2059:		}
line 2060
;2060:		return;
ADDRGP4 $1907
JUMPV
LABELV $1929
line 2063
;2061:	} 
;2062:	//flags, id, username
;2063:	data.userFlags = G_COOL_API_DB_GetInt(0);
CNSTI4 0
ARGI4
ADDRLP4 3172
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 0+3104
ADDRLP4 3172
INDIRI4
ASGNI4
line 2064
;2064:	data.userId = G_COOL_API_DB_GetInt(1);
CNSTI4 1
ARGI4
ADDRLP4 3176
ADDRGP4 G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 3176
INDIRI4
ASGNI4
line 2065
;2065:	G_COOL_API_DB_GetString(2, usernameDb,sizeof(usernameDb));
CNSTI4 2
ARGI4
ADDRLP4 3136
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
pop
line 2067
;2066:
;2067:	if (Q_stricmp(usernameDb, data.username)) {
ADDRLP4 3136
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 3180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3180
INDIRI4
CNSTI4 0
EQI4 $1942
line 2068
;2068:		if (adminEnt) {
ADDRLP4 3152
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1945
line 2069
;2069:			trap_SendServerCommand(data.clientnumAdmin, va("print \"^1Client %d force login as %s returned, DB username %s does not match WTF.\n\"", data.clientnum, data.username, usernameDb));
ADDRGP4 $1948
ARGP4
ADDRLP4 0+24
INDIRI4
ARGI4
ADDRLP4 0+28
ARGP4
ADDRLP4 3136
ARGP4
ADDRLP4 3184
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+3128
INDIRI4
ARGI4
ADDRLP4 3184
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2070
;2070:		}
ADDRGP4 $1907
JUMPV
LABELV $1945
line 2071
;2071:		else {
line 2072
;2072:			Com_Printf("^1Client %d force login as %s returned, DB username %s does not match WTF.\n", data.clientnum, data.username, usernameDb);
ADDRGP4 $1951
ARGP4
ADDRLP4 0+24
INDIRI4
ARGI4
ADDRLP4 0+28
ARGP4
ADDRLP4 3136
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2073
;2073:		}
line 2074
;2074:		return;
ADDRGP4 $1907
JUMPV
LABELV $1942
line 2077
;2075:	}
;2076:
;2077:	client = ent->client;
ADDRLP4 3132
ADDRLP4 3148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 2079
;2078:
;2079:	Q_strncpyz(client->sess.login.name, usernameDb,sizeof(client->sess.login.name));
ADDRLP4 3132
INDIRP4
CNSTI4 43548
ADDP4
ARGP4
ADDRLP4 3136
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2080
;2080:	client->sess.login.id = data.userId;
ADDRLP4 3132
INDIRP4
CNSTI4 43540
ADDP4
ADDRLP4 0+4
INDIRI4
ASGNI4
line 2081
;2081:	client->sess.login.flags = data.userFlags;
ADDRLP4 3132
INDIRP4
CNSTI4 43544
ADDP4
ADDRLP4 0+3104
INDIRI4
ASGNI4
line 2082
;2082:	client->sess.login.loggedIn = qtrue;
ADDRLP4 3132
INDIRP4
CNSTI4 43560
ADDP4
CNSTI4 1
ASGNI4
line 2083
;2083:	client->sess.login.forceLoggedIn = qtrue;
ADDRLP4 3132
INDIRP4
CNSTI4 43564
ADDP4
CNSTI4 1
ASGNI4
line 2085
;2084:	//if (client->pers.raceBestTime) {
;2085:		client->pers.raceBestTime = 0;
ADDRLP4 3132
INDIRP4
CNSTI4 22076
ADDP4
CNSTI4 0
ASGNI4
line 2088
;2086:		//CalculateRanks(); // we do this in the response handler for DF_RequestPlayerDefaultTime, to avoid audio spam of rank changes
;2087:	//}
;2088:	DF_SetSubContestDefaults(client);
ADDRLP4 3132
INDIRP4
ARGP4
ADDRGP4 DF_SetSubContestDefaults
CALLV
pop
line 2090
;2089:
;2090:	DF_RequestPlayerDefaultTime(ent);
ADDRLP4 3148
INDIRP4
ARGP4
ADDRGP4 DF_RequestPlayerDefaultTime
CALLV
pop
line 2092
;2091:
;2092:	trap_SendServerCommand(data.clientnum, va("print \"^3You were force-logged in by an admin as '%s'. Change your password with /changepassword, then log out and log in again.\n\"", usernameDb));
ADDRGP4 $1957
ARGP4
ADDRLP4 3136
ARGP4
ADDRLP4 3184
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+24
INDIRI4
ARGI4
ADDRLP4 3184
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2095
;2093:	//trap_SendServerCommand(-1, va("print \"^2%s ^7logged in as '%s'.\n\"",client ? client->pers.netname : "", loginData->username));
;2094:
;2095:	if (adminEnt) {
ADDRLP4 3152
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1958
line 2096
;2096:		trap_SendServerCommand(data.clientnumAdmin, va("print \"^3Client %d was force-logged in as %s.\n\"", data.clientnum,  usernameDb));
ADDRGP4 $1961
ARGP4
ADDRLP4 0+24
INDIRI4
ARGI4
ADDRLP4 3136
ARGP4
ADDRLP4 3188
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0+3128
INDIRI4
ARGI4
ADDRLP4 3188
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2097
;2097:	}
LABELV $1958
line 2099
;2098:
;2099:	ClientUserinfoChanged(ent - g_entities);
ADDRLP4 3148
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2104
;2100:
;2101:	// fire and forget, not that important
;2102:	//G_COOL_API_DB_AddRequest(NULL, 0, DBREQUEST_LOGIN_UPDATELASTLOGIN,
;2103:	//	va("UPDATE users SET lastlogin=NOW() WHERE id=%d", data.userId));
;2104:}
LABELV $1907
endproc G_ForceLoginContinue 3192 16
bss
align 4
LABELV $1964
skip 1024
code
proc G_CreateTableResult 0 16
line 2106
;2105:
;2106:static void G_CreateTableResult(int status, const char* errorMessage) {
line 2108
;2107:	static referenceSimpleString_t tableName;
;2108:	G_COOL_API_DB_GetReference((byte*)&tableName, sizeof(tableName));
ADDRGP4 $1964
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 2109
;2109:	if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1965
line 2110
;2110:		Com_Printf("creating table %s failed with status %d and error message %s.\n", tableName.s, status, errorMessage);
ADDRGP4 $1967
ARGP4
ADDRGP4 $1964
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2111
;2111:		return;
ADDRGP4 $1963
JUMPV
LABELV $1965
line 2113
;2112:	}
;2113:	Com_Printf("creating table %s was successful.\n", tableName.s);
ADDRGP4 $1968
ARGP4
ADDRGP4 $1964
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2115
;2114:
;2115:}
LABELV $1963
endproc G_CreateTableResult 0 16
bss
align 4
LABELV $1970
skip 1024
code
proc G_UpdateColumnsResult 0 16
line 2116
;2116:static void G_UpdateColumnsResult(int status, const char* errorMessage) {
line 2118
;2117:	static referenceSimpleString_t tableName;
;2118:	G_COOL_API_DB_GetReference((byte*)&tableName, sizeof(tableName));
ADDRGP4 $1970
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 2119
;2119:	if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1971
line 2120
;2120:		Com_Printf("updating columns for table %s failed with status %d and error message %s.\n", tableName.s, status, errorMessage);
ADDRGP4 $1973
ARGP4
ADDRGP4 $1970
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2121
;2121:		return;
ADDRGP4 $1969
JUMPV
LABELV $1971
line 2123
;2122:	}
;2123:	Com_Printf("updating columns for table %s was successful.\n", tableName.s);
ADDRGP4 $1974
ARGP4
ADDRGP4 $1970
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2125
;2124:
;2125:}
LABELV $1969
endproc G_UpdateColumnsResult 0 16
bss
align 4
LABELV $1976
skip 3132
code
proc G_PWBCryptReturned 28 12
line 2127
;2126:
;2127:static void G_PWBCryptReturned(int status, const char* errorMessage) {
line 2131
;2128:	static loginRegisterStruct_t loginData;
;2129:	gentity_t* ent;
;2130:
;2131:	G_COOL_API_DB_GetReference((byte*)&loginData, sizeof(loginData));
ADDRGP4 $1976
ARGP4
CNSTI4 3132
ARGI4
ADDRGP4 G_COOL_API_DB_GetReference
CALLI4
pop
line 2133
;2132:
;2133:	if (!(ent = DB_VerifyClient(loginData.clientnum, loginData.ip))) {
ADDRGP4 $1976+24
INDIRI4
ARGI4
ADDRGP4 $1976+8
ARGP4
ADDRLP4 4
ADDRGP4 DB_VerifyClient
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1977
line 2134
;2134:		Com_Printf("^1bcrypt succeeded, but user no longer valid (#2).\n");
ADDRGP4 $1981
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2135
;2135:		return;
ADDRGP4 $1975
JUMPV
LABELV $1977
line 2138
;2136:	}
;2137:
;2138:	if (status) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1982
line 2139
;2139:		trap_SendServerCommand(loginData.clientnum,va("print \"^1Password bcrypting failed with status %d and error %s.\n\"", status, errorMessage));
ADDRGP4 $1985
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1976+24
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2140
;2140:		return;
ADDRGP4 $1975
JUMPV
LABELV $1982
line 2142
;2141:	}
;2142:	if (G_COOL_API_DB_NextRow()) {
ADDRLP4 8
ADDRGP4 G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1986
line 2143
;2143:		if (!G_COOL_API_DB_GetString(0, loginData.password, sizeof(loginData.password))) {
CNSTI4 0
ARGI4
ADDRGP4 $1976+1052
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 12
ADDRGP4 G_COOL_API_DB_GetString
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1988
line 2144
;2144:			trap_SendServerCommand(loginData.clientnum, "print \"^1Failed to get bcrypted password from DB API.\n\"");
ADDRGP4 $1976+24
INDIRI4
ARGI4
ADDRGP4 $1993
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2145
;2145:			return;
ADDRGP4 $1975
JUMPV
LABELV $1988
line 2148
;2146:		}
;2147:
;2148:		switch (loginData.followUpType) {
ADDRLP4 16
ADDRGP4 $1976
INDIRI4
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1997
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $1998
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
LTI4 $1987
LABELV $2000
ADDRLP4 16
INDIRI4
CNSTI4 17
EQI4 $1999
ADDRGP4 $1987
JUMPV
LABELV $1997
line 2150
;2149:			case DBREQUEST_REGISTER:
;2150:				G_RegisterContinue(&loginData);
ADDRGP4 $1976
ARGP4
ADDRGP4 G_RegisterContinue
CALLV
pop
line 2151
;2151:				break;
ADDRGP4 $1987
JUMPV
LABELV $1998
line 2153
;2152:			case DBREQUEST_LOGIN:
;2153:				G_LoginContinue(&loginData);
ADDRGP4 $1976
ARGP4
ADDRGP4 G_LoginContinue
CALLV
pop
line 2154
;2154:				break;
ADDRGP4 $1987
JUMPV
LABELV $1999
line 2156
;2155:			case DBREQUEST_CHANGEPASSWORD:
;2156:				G_ChangePasswordContinue(&loginData);
ADDRGP4 $1976
ARGP4
ADDRGP4 G_ChangePasswordContinue
CALLV
pop
line 2157
;2157:				break;
line 2165
;2158:		}
;2159:
;2160:#ifdef BCRYPTDEBUG
;2161:		if (g_developer.integer) {
;2162:			trap_SendServerCommand(loginData.clientnum, va("print \"G_Login_PWBCryptReturned: Client %d (user %s), Crypted pw: %s\n\"", loginData.clientnum, loginData.username, loginData.password));
;2163:		}
;2164:#endif
;2165:	}
ADDRGP4 $1987
JUMPV
LABELV $1986
line 2166
;2166:	else {
line 2167
;2167:		trap_SendServerCommand(loginData.clientnum, "print \"^1Failed to get bcrypted password from DB API (no response row).\n\"");
ADDRGP4 $1976+24
INDIRI4
ARGI4
ADDRGP4 $2002
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2168
;2168:	}
LABELV $1987
line 2169
;2169:}
LABELV $1975
endproc G_PWBCryptReturned 28 12
export G_DB_CheckResponses
proc G_DB_CheckResponses 1040 28
line 2171
;2170:
;2171:void G_DB_CheckResponses() {
line 2174
;2172:	char errorMessage[MAX_STRING_CHARS];
;2173:
;2174:	if (coolApi_dbVersion) {
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 0
EQI4 $2004
ADDRGP4 $2007
JUMPV
LABELV $2006
line 2178
;2175:		int requestType;
;2176:		int status;
;2177:		int affectedRows;
;2178:		while (G_COOL_API_DB_NextResponse(&requestType, &affectedRows, &status, errorMessage, sizeof(errorMessage), NULL, 0)) {
line 2179
;2179:			switch (requestType) {
ADDRLP4 1036
ADDRLP4 1032
INDIRI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
LTI4 $2009
ADDRLP4 1036
INDIRI4
CNSTI4 27
GTI4 $2009
ADDRLP4 1036
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2046
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2046
address $2020
address $2024
address $2045
address $2011
address $2019
address $2022
address $2023
address $2025
address $2029
address $2043
address $2040
address $2041
address $2042
address $2027
address $2028
address $2026
address $2039
address $2021
address $2044
address $2032
address $2038
address $2034
address $2030
address $2033
address $2031
address $2036
address $2037
address $2035
code
LABELV $2011
LABELV $2009
line 2182
;2180:				case DBREQUEST_LOGIN_UPDATELASTLOGIN:
;2181:				default:
;2182:					if (status) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
EQI4 $2012
line 2183
;2183:						Com_Printf("DB Request of type %d failed with status %d.\n", requestType, status);
ADDRGP4 $2014
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2184
;2184:					}
ADDRGP4 $2010
JUMPV
LABELV $2012
line 2185
;2185:					else {
line 2186
;2186:						if (g_developer.integer) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
EQI4 $2010
line 2187
;2187:							Com_Printf("DB Request of type %d returned with status %d.\n", requestType, status);
ADDRGP4 $2018
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2188
;2188:						}
line 2189
;2189:					}
line 2190
;2190:					break;
ADDRGP4 $2010
JUMPV
LABELV $2019
line 2192
;2191:				case DBREQUEST_BCRYPTPW:
;2192:					G_PWBCryptReturned(status, errorMessage);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 G_PWBCryptReturned
CALLV
pop
line 2193
;2193:					break;
ADDRGP4 $2010
JUMPV
LABELV $2020
line 2195
;2194:				case DBREQUEST_REGISTER:
;2195:					G_RegisterResult(status, errorMessage);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 G_RegisterResult
CALLV
pop
line 2196
;2196:					break;
ADDRGP4 $2010
JUMPV
LABELV $2021
line 2198
;2197:				case DBREQUEST_CHANGEPASSWORD:
;2198:					G_ChangePasswordResult(status, errorMessage);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 G_ChangePasswordResult
CALLV
pop
line 2199
;2199:					break;
ADDRGP4 $2010
JUMPV
LABELV $2022
line 2201
;2200:				case DBREQUEST_CREATETABLE:
;2201:					G_CreateTableResult(status, errorMessage);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 G_CreateTableResult
CALLV
pop
line 2202
;2202:					break;
ADDRGP4 $2010
JUMPV
LABELV $2023
line 2204
;2203:				case DBREQUEST_UPDATECOLUMNS:
;2204:					G_UpdateColumnsResult(status, errorMessage);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 G_UpdateColumnsResult
CALLV
pop
line 2205
;2205:					break;
ADDRGP4 $2010
JUMPV
LABELV $2024
line 2207
;2206:				case DBREQUEST_LOGIN:
;2207:					G_LoginFetchDataResult(status, errorMessage);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 G_LoginFetchDataResult
CALLV
pop
line 2208
;2208:					break;
ADDRGP4 $2010
JUMPV
LABELV $2025
line 2210
;2209:				case DBREQUEST_INSERTORUPDATERUN:
;2210:					G_InsertRunResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_InsertRunResult
CALLV
pop
line 2211
;2211:					break;
ADDRGP4 $2010
JUMPV
LABELV $2026
line 2213
;2212:				case DBREQUEST_INSERTORUPDATESUBCONTEST:
;2213:					G_InsertSubcontestResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_InsertSubcontestResult
CALLV
pop
line 2214
;2214:					break;
ADDRGP4 $2010
JUMPV
LABELV $2027
line 2216
;2215:				case DBREQUEST_INSERTORUPDATEMAPRACEDEFAULTS:
;2216:					G_InsertMapDefaultsResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_InsertMapDefaultsResult
CALLV
pop
line 2217
;2217:					break;
ADDRGP4 $2010
JUMPV
LABELV $2028
line 2219
;2218:				case DBREQUEST_LOADMAPRACEDEFAULTS:
;2219:					G_LoadMapDefaultsResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_LoadMapDefaultsResult
CALLV
pop
line 2220
;2220:					break;
ADDRGP4 $2010
JUMPV
LABELV $2029
line 2222
;2221:				case DBREQUEST_TOP:
;2222:					G_TopResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_TopResult
CALLV
pop
line 2223
;2223:					break;
ADDRGP4 $2010
JUMPV
LABELV $2030
line 2225
;2224:				case DBREQUEST_RANKUPDATE:
;2225:					G_RankUpdateResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_RankUpdateResult
CALLV
pop
line 2226
;2226:					break;
ADDRGP4 $2010
JUMPV
LABELV $2031
line 2228
;2227:				case DBREQUEST_RANKUPDATEMAPLATESTSET:
;2228:					G_RankUpdateMapLatestSetResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_RankUpdateMapLatestSetResult
CALLV
pop
line 2229
;2229:					break;
ADDRGP4 $2010
JUMPV
LABELV $2032
line 2231
;2230:				case DBREQUEST_GETLATESTRUNS:
;2231:					G_LatestRunsResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_LatestRunsResult
CALLV
pop
line 2232
;2232:					break;
ADDRGP4 $2010
JUMPV
LABELV $2033
line 2234
;2233:				case DBREQUEST_RANKUPDATEMAPREQUEST:
;2234:					G_RankUpdateMapRequestResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_RankUpdateMapRequestResult
CALLV
pop
line 2235
;2235:					break;
ADDRGP4 $2010
JUMPV
LABELV $2034
line 2237
;2236:				case DBREQUEST_MAPSEARCH:
;2237:					G_ShortestLongestResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_ShortestLongestResult
CALLV
pop
line 2238
;2238:					break;
ADDRGP4 $2010
JUMPV
LABELV $2035
line 2240
;2239:				case DBREQUEST_RANK:
;2240:					G_RankResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_RankResult
CALLV
pop
line 2241
;2241:					break;
ADDRGP4 $2010
JUMPV
LABELV $2036
line 2243
;2242:				case DBREQUEST_RATEMAP:
;2243:					G_RateMapResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_RateMapResult
CALLV
pop
line 2244
;2244:					break;
ADDRGP4 $2010
JUMPV
LABELV $2037
line 2246
;2245:				case DBREQUEST_RATEMAPSHOWMINE:
;2246:					G_RateMapShowMineResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_RateMapShowMineResult
CALLV
pop
line 2247
;2247:					break;
ADDRGP4 $2010
JUMPV
LABELV $2038
line 2249
;2248:				case DBREQUEST_MAPLISTUNPLAYED:
;2249:					G_MapListUnplayedResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_MapListUnplayedResult
CALLV
pop
line 2250
;2250:					break;
ADDRGP4 $2010
JUMPV
LABELV $2039
line 2252
;2251:				case DBREQUEST_SUBCONTESTLEADERBOARD:
;2252:					G_SubContestLBResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_SubContestLBResult
CALLV
pop
line 2253
;2253:					break;
ADDRGP4 $2010
JUMPV
LABELV $2040
line 2255
;2254:				case DBREQUEST_TIME:
;2255:					G_TimeResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_TimeResult
CALLV
pop
line 2256
;2256:					break;
ADDRGP4 $2010
JUMPV
LABELV $2041
line 2258
;2257:				case DBREQUEST_SAVECHECKPOINTS:
;2258:					G_SaveCheckpointsResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_SaveCheckpointsResult
CALLV
pop
line 2259
;2259:					break;
ADDRGP4 $2010
JUMPV
LABELV $2042
line 2261
;2260:				case DBREQUEST_LOADCHECKPOINTS:
;2261:					G_LoadCheckpointsResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_LoadCheckpointsResult
CALLV
pop
line 2262
;2262:					break;
ADDRGP4 $2010
JUMPV
LABELV $2043
line 2264
;2263:				case DBREQUEST_TOPMAPSEARCH:
;2264:					G_TopMapSearchResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_TopMapSearchResult
CALLV
pop
line 2265
;2265:					break;
ADDRGP4 $2010
JUMPV
LABELV $2044
line 2267
;2266:				case DBREQUEST_ARENAGENMAPLIST:
;2267:					G_ArenaGenMapListResult(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_ArenaGenMapListResult
CALLV
pop
line 2268
;2268:					break;
ADDRGP4 $2010
JUMPV
LABELV $2045
line 2270
;2269:				case DBREQUEST_FORCEDLOGIN:
;2270:					G_ForceLoginContinue(status, errorMessage, affectedRows);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRGP4 G_ForceLoginContinue
CALLV
pop
line 2271
;2271:					break;
LABELV $2010
line 2276
;2272:				//case DBREQUEST_GETCHATS:
;2273:				//	G_DB_GetChatsResponse(status);
;2274:				//	break;
;2275:			}
;2276:		}
LABELV $2007
line 2178
ADDRLP4 1032
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1036
ADDRGP4 G_COOL_API_DB_NextResponse
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $2006
line 2277
;2277:	}
LABELV $2004
line 2278
;2278:}
LABELV $2003
endproc G_DB_CheckResponses 1040 28
lit
align 1
LABELV $2048
byte 1 68
byte 1 69
byte 1 76
byte 1 69
byte 1 84
byte 1 69
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 61
byte 1 63
byte 1 59
byte 1 73
byte 1 78
byte 1 83
byte 1 69
byte 1 82
byte 1 84
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 79
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 40
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 44
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 44
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 44
byte 1 120
byte 1 44
byte 1 121
byte 1 44
byte 1 122
byte 1 44
byte 1 121
byte 1 97
byte 1 119
byte 1 41
byte 1 32
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 83
byte 1 32
byte 1 0
align 1
LABELV $2049
byte 1 40
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 41
byte 1 0
bss
align 1
LABELV $2050
skip 288
align 4
LABELV $2051
skip 20
export G_DB_SaveUserCheckpoints
code
proc G_DB_SaveUserCheckpoints 20 16
line 2310
;2279:/*
;2280:void G_DB_InsertChat(const char* chatText) {
;2281:	char		text[MAX_STRING_CHARS] = { 0 };
;2282:	const char* request;
;2283:
;2284:	if (!coolApi_dbVersion || cg.demoPlayback) return;
;2285:
;2286:	// save it to db
;2287:	Q_strncpyz(text, chatText, sizeof(text));
;2288:	if (G_COOL_API_DB_EscapeString(text, sizeof(text))) {
;2289:		request = va("INSERT INTO chats (chat,`time`) VALUES ('%s',NOW())", text);
;2290:		G_COOL_API_DB_AddRequest(NULL, 0, DBREQUEST_CHATSAVE, request);
;2291:	}
;2292:}
;2293:
;2294:void G_DB_GetChats_f(void) {
;2295:	int clientNum = -1;
;2296:	int page, first;
;2297:
;2298:	if (!coolApi_dbVersion) {
;2299:		G_Printf("getchats not possible, DB API not available\n");
;2300:		return;
;2301:	}
;2302:
;2303:	page = atoi(G_Argv(1))-1;
;2304:	page = MAX(page,0);
;2305:	first = page*10;
;2306:
;2307:	G_COOL_API_DB_AddRequest(NULL,0, DBREQUEST_GETCHATS, va("SELECT id, chat, `time` FROM chats ORDER BY time DESC, id DESC LIMIT %d,10",first));
;2308:}
;2309:*/
;2310:void G_DB_SaveUserCheckpoints(gentity_t* playerent) {
line 2314
;2311:	static const char requestBase[] = "DELETE FROM checkpoints WHERE course=? AND userid=?;INSERT INTO checkpoints (userid,course,number,x,y,z,yaw) VALUES ";
;2312:	static const char checkPointValues[] = "(?,?,?,?,?,?,?)";
;2313:	static char request[sizeof(requestBase) + (sizeof(checkPointValues)+1)*MAX_CUSTOM_CHECKPOINT_COUNT+1];
;2314:	const char* coursename = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2317
;2315:	static checkPointSaveRequestStruct_t data;
;2316:	int i;
;2317:	if (coolApi_dbVersion < 3) {
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
GEI4 $2052
line 2318
;2318:		G_SendServerCommand(playerent-g_entities,"print \"DB version too low to save checkpoints.\n\"",qtrue);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $2054
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 2319
;2319:		return;
ADDRGP4 $2047
JUMPV
LABELV $2052
line 2321
;2320:	}
;2321:	if (!playerent->client->pers.df_checkpointData.count) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43080
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2055
line 2322
;2322:		G_SendServerCommand(playerent-g_entities,"print \"No checkpoints found for saving.\n\"",qtrue);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $2057
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 2323
;2323:		return;
ADDRGP4 $2047
JUMPV
LABELV $2055
line 2325
;2324:	}
;2325:	if (!playerent->client->sess.login.loggedIn) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2058
line 2326
;2326:		G_SendServerCommand(playerent-g_entities,"print \"Can't save checkpoints unless logged in.\n\"",qtrue);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $2060
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 2327
;2327:		return;
ADDRGP4 $2047
JUMPV
LABELV $2058
line 2329
;2328:	}
;2329:	request[0] = 0;
ADDRGP4 $2050
CNSTI1 0
ASGNI1
line 2330
;2330:	Q_strcat(request, sizeof(request), requestBase);
ADDRGP4 $2050
ARGP4
CNSTI4 288
ARGI4
ADDRGP4 $2048
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 2331
;2331:	Q_strcat(request, sizeof(request), checkPointValues);
ADDRGP4 $2050
ARGP4
CNSTI4 288
ARGI4
ADDRGP4 $2049
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 2332
;2332:	for (i = 1; i < playerent->client->pers.df_checkpointData.count; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $2064
JUMPV
LABELV $2061
line 2333
;2333:		Q_strcat(request, sizeof(request), va(",%s",checkPointValues));
ADDRGP4 $2065
ARGP4
ADDRGP4 $2049
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $2050
ARGP4
CNSTI4 288
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 2334
;2334:	}
LABELV $2062
line 2332
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2064
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43080
ADDP4
INDIRI4
LTI4 $2061
line 2335
;2335:	memset(&data, 0, sizeof(data));
ADDRGP4 $2051
ARGP4
CNSTI4 0
ARGI4
CNSTU4 20
ARGU4
ADDRGP4 memset
CALLP4
pop
line 2336
;2336:	data.clientnum = playerent - g_entities;
ADDRGP4 $2051+16
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ASGNI4
line 2337
;2337:	memcpy(data.ip, mv_clientSessions[data.clientnum].clientIP, sizeof(data.ip));
ADDRGP4 $2051
ARGP4
CNSTI4 20
ADDRGP4 $2051+16
INDIRI4
MULI4
ADDRGP4 mv_clientSessions
ADDP4
ARGP4
CNSTU4 16
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 2339
;2338:
;2339:	if (!G_COOL_API_DB_AddPreparedStatement((byte*)&data,sizeof(data),DBREQUEST_SAVECHECKPOINTS,request)) {
ADDRGP4 $2051
ARGP4
CNSTI4 20
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 $2050
ARGP4
ADDRLP4 8
ADDRGP4 G_COOL_API_DB_AddPreparedStatement
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2068
line 2340
;2340:		G_SendServerCommand(playerent - g_entities, "print \"DB connection not available to save checkpoints.\n\"",qtrue);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $2070
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 2341
;2341:		return;
ADDRGP4 $2047
JUMPV
LABELV $2068
line 2343
;2342:	}
;2343:	coursename = DF_GetCourseName(qfalse);
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 DF_GetCourseName
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 2346
;2344:
;2345:	// DELETE
;2346:	G_COOL_API_DB_PreparedBindString(coursename);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 2347
;2347:	G_COOL_API_DB_PreparedBindInt(playerent->client->sess.login.id);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43540
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2350
;2348:
;2349:	// INSERT
;2350:	for (i = 0; i < playerent->client->pers.df_checkpointData.count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2074
JUMPV
LABELV $2071
line 2351
;2351:		gentity_t* check = g_entities + playerent->client->pers.df_checkpointData.checkpointNumbers[i];
ADDRLP4 16
CNSTI4 2352
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43040
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2352
;2352:		G_COOL_API_DB_PreparedBindInt(playerent->client->sess.login.id);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43540
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2353
;2353:		G_COOL_API_DB_PreparedBindString(coursename);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 2354
;2354:		G_COOL_API_DB_PreparedBindInt(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2355
;2355:		G_COOL_API_DB_PreparedBindFloat(check->checkpointSeed.trEndpos[0]);
ADDRLP4 16
INDIRP4
CNSTI4 1008
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2356
;2356:		G_COOL_API_DB_PreparedBindFloat(check->checkpointSeed.trEndpos[1]);
ADDRLP4 16
INDIRP4
CNSTI4 1012
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2357
;2357:		G_COOL_API_DB_PreparedBindFloat(check->checkpointSeed.trEndpos[2]);
ADDRLP4 16
INDIRP4
CNSTI4 1016
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2358
;2358:		G_COOL_API_DB_PreparedBindFloat(check->checkpointSeed.anglesYaw);
ADDRLP4 16
INDIRP4
CNSTI4 1020
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2359
;2359:	}
LABELV $2072
line 2350
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2074
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43080
ADDP4
INDIRI4
LTI4 $2071
line 2361
;2360:
;2361:	G_COOL_API_DB_FinishAndSendPreparedStatement();
ADDRGP4 G_COOL_API_DB_FinishAndSendPreparedStatement
CALLI4
pop
line 2362
;2362:}
LABELV $2047
endproc G_DB_SaveUserCheckpoints 20 16
bss
align 4
LABELV $2076
skip 20
export G_DB_LoadUserCheckpoints
code
proc G_DB_LoadUserCheckpoints 16 16
line 2363
;2363:void G_DB_LoadUserCheckpoints(gentity_t* playerent) {
line 2366
;2364:	static checkPointSaveRequestStruct_t data;
;2365:	int i;
;2366:	const char* coursename = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2367
;2367:	if (coolApi_dbVersion < 3) {
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
GEI4 $2077
line 2368
;2368:		G_SendServerCommand(playerent-g_entities,"print \"DB version too low to load checkpoints.\n\"",qtrue);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $2079
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 2369
;2369:		return;
ADDRGP4 $2075
JUMPV
LABELV $2077
line 2371
;2370:	}
;2371:	if (!playerent->client->sess.login.loggedIn) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43560
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2080
line 2372
;2372:		G_SendServerCommand(playerent-g_entities,"print \"Can't load checkpoints unless logged in.\n\"",qtrue);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $2082
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 2373
;2373:		return;
ADDRGP4 $2075
JUMPV
LABELV $2080
line 2375
;2374:	}
;2375:	memset(&data, 0, sizeof(data));
ADDRGP4 $2076
ARGP4
CNSTI4 0
ARGI4
CNSTU4 20
ARGU4
ADDRGP4 memset
CALLP4
pop
line 2376
;2376:	data.clientnum = playerent - g_entities;
ADDRGP4 $2076+16
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ASGNI4
line 2377
;2377:	memcpy(data.ip, mv_clientSessions[data.clientnum].clientIP, sizeof(data.ip));
ADDRGP4 $2076
ARGP4
CNSTI4 20
ADDRGP4 $2076+16
INDIRI4
MULI4
ADDRGP4 mv_clientSessions
ADDP4
ARGP4
CNSTU4 16
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 2379
;2378:
;2379:	if (!G_COOL_API_DB_AddPreparedStatement((byte*)&data,sizeof(data), DBREQUEST_LOADCHECKPOINTS, "SELECT x,y,z,yaw FROM checkpoints WHERE course=? AND userid=? ORDER BY number ASC")) {
ADDRGP4 $2076
ARGP4
CNSTI4 20
ARGI4
CNSTI4 12
ARGI4
ADDRGP4 $2087
ARGP4
ADDRLP4 8
ADDRGP4 G_COOL_API_DB_AddPreparedStatement
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2085
line 2380
;2380:		G_SendServerCommand(playerent - g_entities, "print \"DB connection not available to load checkpoints.\n\"",qtrue);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 $2088
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 2381
;2381:		return;
ADDRGP4 $2075
JUMPV
LABELV $2085
line 2384
;2382:	}
;2383:
;2384:	coursename = DF_GetCourseName(qfalse);
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 DF_GetCourseName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 2386
;2385:
;2386:	G_COOL_API_DB_PreparedBindString(coursename);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 2387
;2387:	G_COOL_API_DB_PreparedBindInt(playerent->client->sess.login.id);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43540
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2389
;2388:
;2389:	G_COOL_API_DB_FinishAndSendPreparedStatement();
ADDRGP4 G_COOL_API_DB_FinishAndSendPreparedStatement
CALLI4
pop
line 2390
;2390:}
LABELV $2075
endproc G_DB_LoadUserCheckpoints 16 16
proc G_CreateUserTable 1032 16
line 2392
;2391:
;2392:static void G_CreateUserTable() {
line 2394
;2393:	referenceSimpleString_t tableName;
;2394:	const char* userTableRequest = va("CREATE TABLE IF NOT EXISTS users(id BIGINT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(%d) UNIQUE NOT NULL, password VARCHAR(64)  NOT NULL, lastlogin DATETIME, created DATETIME NOT NULL, lastip  INT UNSIGNED, flags  INT UNSIGNED NOT NULL DEFAULT 0)",USERNAME_MAX_LEN);
ADDRGP4 $2090
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 2395
;2395:	Q_strncpyz(tableName.s, "users", sizeof(tableName.s));
ADDRLP4 0
ARGP4
ADDRGP4 $2091
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2396
;2396:	G_COOL_API_DB_AddRequest((byte*)&tableName,sizeof(referenceSimpleString_t), DBREQUEST_CREATETABLE, userTableRequest);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 G_COOL_API_DB_AddRequest
CALLI4
pop
line 2397
;2397:}
LABELV $2089
endproc G_CreateUserTable 1032 16
proc G_CreateCheckpointsTable 1028 16
line 2399
;2398:
;2399:static void G_CreateCheckpointsTable() {
line 2401
;2400:	referenceSimpleString_t tableName;
;2401:	const char* userTableRequest = "CREATE TABLE IF NOT EXISTS checkpoints(id BIGINT AUTO_INCREMENT PRIMARY KEY, userid BIGINT SIGNED NOT NULL, course VARCHAR(100) NOT NULL, number TINYINT(2) SIGNED NOT NULL, x DOUBLE NOT NULL, y DOUBLE NOT NULL, z DOUBLE NOT NULL, yaw DOUBLE NOT NULL, UNIQUE KEY checkpoint_unique (userid,course,number), INDEX i_user_map (userid,course), INDEX i_number(number))";
ADDRLP4 1024
ADDRGP4 $2093
ASGNP4
line 2402
;2402:	Q_strncpyz(tableName.s, "checkpoints", sizeof(tableName.s));
ADDRLP4 0
ARGP4
ADDRGP4 $2094
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2403
;2403:	G_COOL_API_DB_AddRequest((byte*)&tableName,sizeof(referenceSimpleString_t), DBREQUEST_CREATETABLE, userTableRequest);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 G_COOL_API_DB_AddRequest
CALLI4
pop
line 2404
;2404:}
LABELV $2092
endproc G_CreateCheckpointsTable 1028 16
proc G_CreateSubContestsTable 1028 16
line 2405
;2405:static void G_CreateSubContestsTable() {
line 2407
;2406:	referenceSimpleString_t tableName;
;2407:	const char* userTableRequest = "CREATE TABLE IF NOT EXISTS subcontests(id BIGINT AUTO_INCREMENT PRIMARY KEY, userid BIGINT SIGNED NOT NULL, course VARCHAR(100) NOT NULL, type SMALLINT NOT NULL, value DOUBLE NOT NULL, recordwhen DATETIME NOT NULL, msec SMALLINT NOT NULL, extraValue1 DOUBLE,extraValue2 DOUBLE,extraValue3 INTEGER,extraValue4 INTEGER, UNIQUE KEY user_type (userid,type),INDEX i_value(value))";
ADDRLP4 1024
ADDRGP4 $2096
ASGNP4
line 2408
;2408:	Q_strncpyz(tableName.s, "subcontests", sizeof(tableName.s));
ADDRLP4 0
ARGP4
ADDRGP4 $2097
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2409
;2409:	G_COOL_API_DB_AddRequest((byte*)&tableName,sizeof(referenceSimpleString_t), DBREQUEST_CREATETABLE, userTableRequest);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 G_COOL_API_DB_AddRequest
CALLI4
pop
line 2410
;2410:}
LABELV $2095
endproc G_CreateSubContestsTable 1028 16
proc G_CreateMapRaceDefaultsTable 1028 16
line 2411
;2411:static void G_CreateMapRaceDefaultsTable() {
line 2413
;2412:	referenceSimpleString_t tableName;
;2413:	const char* userTableRequest = "CREATE TABLE IF NOT EXISTS mapdefaults(\
ADDRLP4 1024
ADDRGP4 $2099
ASGNP4
line 2421
;2414:			course VARCHAR(100) NOT NULL, \
;2415:			subcourse VARCHAR(100) NOT NULL, \
;2416:			msec SMALLINT NOT NULL, \
;2417:			jump TINYINT NOT NULL, \
;2418:			variant SMALLINT NOT NULL,\
;2419:			runFlags INT NOT NULL,\
;2420:			PRIMARY KEY(course,subcourse))";
;2421:	Q_strncpyz(tableName.s, "mapdefaults", sizeof(tableName.s));
ADDRLP4 0
ARGP4
ADDRGP4 $2100
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2422
;2422:	G_COOL_API_DB_AddRequest((byte*)&tableName,sizeof(referenceSimpleString_t), DBREQUEST_CREATETABLE, userTableRequest);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 G_COOL_API_DB_AddRequest
CALLI4
pop
line 2423
;2423:}
LABELV $2098
endproc G_CreateMapRaceDefaultsTable 1028 16
proc G_CreateMapRatingsTable 1028 16
line 2424
;2424:static void G_CreateMapRatingsTable() {
line 2426
;2425:	referenceSimpleString_t tableName;
;2426:	const char* metaTableRequest = "CREATE TABLE IF NOT EXISTS mapratings(\
ADDRLP4 1024
ADDRGP4 $2102
ASGNP4
line 2432
;2427:			course VARCHAR(100) NOT NULL, \
;2428:			userid BIGINT SIGNED NOT NULL, \
;2429:			style SMALLINT UNSIGNED NOT NULL, \
;2430:			rating DOUBLE NOT NULL, \
;2431:			PRIMARY KEY(course,userid,style))";
;2432:	Q_strncpyz(tableName.s, "mapratings", sizeof(tableName.s));
ADDRLP4 0
ARGP4
ADDRGP4 $2103
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2433
;2433:	G_COOL_API_DB_AddRequest((byte*)&tableName,sizeof(referenceSimpleString_t), DBREQUEST_CREATETABLE, metaTableRequest);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 G_COOL_API_DB_AddRequest
CALLI4
pop
line 2434
;2434:}
LABELV $2101
endproc G_CreateMapRatingsTable 1028 16
proc G_CreateMetaTable 1028 16
line 2435
;2435:static void G_CreateMetaTable() {
line 2437
;2436:	referenceSimpleString_t tableName;
;2437:	const char* metaTableRequest = "CREATE TABLE IF NOT EXISTS meta(\
ADDRLP4 1024
ADDRGP4 $2105
ASGNP4
line 2444
;2438:			`key` VARCHAR(100) NOT NULL, \
;2439:			valueInt INT NULL, \
;2440:			valueDouble DOUBLE NULL, \
;2441:			valueWhen DATETIME NULL, \
;2442:			valueString VARCHAR(255) NULL, \
;2443:			PRIMARY KEY(`key`))";
;2444:	Q_strncpyz(tableName.s, "meta", sizeof(tableName.s));
ADDRLP4 0
ARGP4
ADDRGP4 $2106
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2445
;2445:	G_COOL_API_DB_AddRequest((byte*)&tableName,sizeof(referenceSimpleString_t), DBREQUEST_CREATETABLE, metaTableRequest);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 G_COOL_API_DB_AddRequest
CALLI4
pop
line 2446
;2446:}
LABELV $2104
endproc G_CreateMetaTable 1028 16
proc G_CreateRunsTable 1032 16
line 2447
;2447:static void G_CreateRunsTable() {
line 2461
;2448:	referenceSimpleString_t tableName;
;2449:#define SUBFUNC(a) `runFlag_ ## a` TINYINT(1)
;2450:#define SUBFUNC2(a) `runFlag_ ## a`
;2451:#define SUBFUNC3(a)  INDEX `i_ ## runFlag_ ## a` (`runFlag_ ## a`)
;2452:#define SUBFUNC4(a)  ALTER TABLE runs ADD COLUMN IF NOT EXISTS `runFlag_ ## a` TINYINT(1)
;2453:#define SUBFUNC5(a)  ALTER TABLE runs ADD INDEX IF NOT EXISTS `i_ ## runFlag_ ## a` (`runFlag_ ## a`)
;2454:#define SUBFUNC6(a)  ALTER TABLE runs ALTER COLUMN `runFlag_ ## a` DROP DEFAULT
;2455:#define RUNFLAGSFUNC(a,b,c,d,e,f) QUOTEME(SUBFUNC(a)) " NOT NULL,"
;2456:#define RUNFLAGSFUNC2(a,b,c,d,e,f) "," QUOTEME(SUBFUNC2(a))
;2457:#define RUNFLAGSFUNC3(a,b,c,d,e,f) QUOTEME(SUBFUNC3(a)) ","
;2458:#define RUNFLAGSFUNC4(a,b,c,d,e,f) QUOTEME(SUBFUNC4(a)) " NOT NULL DEFAULT 0;"
;2459:#define RUNFLAGSFUNC5(a,b,c,d,e,f) QUOTEME(SUBFUNC5(a)) ";"
;2460:#define RUNFLAGSFUNC6(a,b,c,d,e,f) QUOTEME(SUBFUNC6(a)) ";"
;2461:	const char* userTableRequest = "CREATE TABLE IF NOT EXISTS runs(\
ADDRLP4 1024
ADDRGP4 $2108
ASGNP4
line 2520
;2462:			id BIGINT AUTO_INCREMENT PRIMARY KEY, \
;2463:			userid BIGINT SIGNED NOT NULL, \
;2464:			course VARCHAR(100) NOT NULL, \
;2465:			subcourse VARCHAR(100) NOT NULL, \
;2466:			duration_ms INT UNSIGNED NOT NULL, \
;2467:			duration_ms_segmented_total INT UNSIGNED NOT NULL, \
;2468:			startLessTime INT UNSIGNED NOT NULL, \
;2469:			endLessTime INT NOT NULL, \
;2470:			saveposCount INT NOT NULL, \
;2471:			resposCount INT NOT NULL, \
;2472:			lostMsecCount INT NOT NULL, \
;2473:			lostCmdsCount INT NOT NULL, \
;2474:			topspeed DOUBLE NOT NULL, \
;2475:			rollSpeed DOUBLE NOT NULL, \
;2476:			rollTakeoffClientSpeed INT NOT NULL, \
;2477:			startTriggerSpeed DOUBLE NOT NULL, \
;2478:			average DOUBLE NOT NULL, \
;2479:			distance DOUBLE NOT NULL, \
;2480:			distanceXY DOUBLE NOT NULL, \
;2481:			style SMALLINT UNSIGNED NOT NULL, \
;2482:			msec SMALLINT NOT NULL, \
;2483:			jump TINYINT NOT NULL, \
;2484:			variant SMALLINT NOT NULL,"
;2485:			RUNFLAGS(RUNFLAGSFUNC)
;2486:			"runFlags INT NOT NULL, \
;2487:			runwhen DATETIME NOT NULL, \
;2488:			runfirst DATETIME NOT NULL, \
;2489:			warningFlags INT NOT NULL, \
;2490:			fpsString VARCHAR(255) NOT NULL, \
;2491:			server VARCHAR(255) NOT NULL, \
;2492:			semiBreakingChangeVersion INT NOT NULL, \
;2493:			hidden TINYINT(1) NOT NULL DEFAULT 0, \
;2494:			tmpRank INT, \
;2495:			tmpLB INT, \
;2496:			UNIQUE KEY user_runtype (userid,course,subcourse,style,msec,jump,variant,runFlags"
;2497:			//QUOTEME(RUNFLAGS(RUNFLAGSFUNC2))
;2498:			"), \
;2499:			INDEX i_userid (userid), INDEX i_course_subcourse (course,subcourse), INDEX i_course (course), INDEX i_subcourse (subcourse), \
;2500:			INDEX i_duration_ms (duration_ms), \
;2501:			INDEX i_distance (distance), \
;2502:			INDEX i_style (style), \
;2503:			INDEX i_msec (msec), \
;2504:			INDEX i_jump (jump), \
;2505:			INDEX i_variant (variant),"
;2506:			RUNFLAGS(RUNFLAGSFUNC3)
;2507:			"INDEX i_runflags (runFlags), \
;2508:			INDEX i_runwhen(runwhen), \
;2509:			INDEX i_runfirst (runfirst),\
;2510:			INDEX i_warningFlags (warningFlags), \
;2511:			INDEX i_hidden (hidden), \
;2512:			INDEX i_tmpRank (tmpRank), \
;2513:			INDEX i_tmpLB (tmpLB), \
;2514:			INDEX i_lbRank (tmpLB,i_tmpRank), \
;2515:			INDEX i_runtype (style,msec,jump,variant,runFlags) );"
;2516:			RUNFLAGS(RUNFLAGSFUNC4)
;2517:			//RUNFLAGS(RUNFLAGSFUNC5)
;2518:			//RUNFLAGS(RUNFLAGSFUNC6)
;2519:			"";
;2520:	const char* columnsUpdateRequest = ""
ADDRLP4 1028
ADDRGP4 $2109
ASGNP4
line 2547
;2521:			RUNFLAGS(RUNFLAGSFUNC4)
;2522:			RUNFLAGS(RUNFLAGSFUNC5)
;2523:			RUNFLAGS(RUNFLAGSFUNC6)
;2524:			"";
;2525:#undef RUNFLAGSFUNC
;2526:#undef RUNFLAGSFUNC2
;2527:#undef RUNFLAGSFUNC3
;2528:#undef RUNFLAGSFUNC4
;2529:#undef RUNFLAGSFUNC5
;2530:#undef SUBFUNC
;2531:#undef SUBFUNC2
;2532:#undef SUBFUNC3
;2533:#undef SUBFUNC4
;2534:#undef SUBFUNC5
;2535:	
;2536:	//if (g_developer.integer) {
;2537:	//	G_Printf("TABLE QUERY DEBUG: %s", userTableRequest);
;2538:	//}
;2539:	// fields without index (cuz just info/debug, dont need to search/filter by it:
;2540:	// - distanceXY
;2541:	// - startLessTime
;2542:	// - endLessTime
;2543:	// - saveposCount
;2544:	// - resposCount
;2545:	// - lostMsecCount
;2546:	// - lostCmdsCount
;2547:	Q_strncpyz(tableName.s, "runs", sizeof(tableName.s));
ADDRLP4 0
ARGP4
ADDRGP4 $2110
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2548
;2548:	G_COOL_API_DB_AddRequest((byte*)&tableName,sizeof(referenceSimpleString_t), DBREQUEST_CREATETABLE, userTableRequest);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 G_COOL_API_DB_AddRequest
CALLI4
pop
line 2549
;2549:	G_COOL_API_DB_AddRequest((byte*)&tableName,sizeof(referenceSimpleString_t), DBREQUEST_UPDATECOLUMNS, columnsUpdateRequest);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 G_COOL_API_DB_AddRequest
CALLI4
pop
line 2550
;2550:}
LABELV $2107
endproc G_CreateRunsTable 1032 16
proc G_DB_CreateTables 0 0
line 2552
;2551:
;2552:static void G_DB_CreateTables() {
line 2553
;2553:	G_CreateUserTable();
ADDRGP4 G_CreateUserTable
CALLV
pop
line 2554
;2554:	G_CreateRunsTable();
ADDRGP4 G_CreateRunsTable
CALLV
pop
line 2555
;2555:	G_CreateCheckpointsTable();
ADDRGP4 G_CreateCheckpointsTable
CALLV
pop
line 2556
;2556:	G_CreateSubContestsTable();
ADDRGP4 G_CreateSubContestsTable
CALLV
pop
line 2557
;2557:	G_CreateMapRaceDefaultsTable();
ADDRGP4 G_CreateMapRaceDefaultsTable
CALLV
pop
line 2558
;2558:	G_CreateMetaTable();
ADDRGP4 G_CreateMetaTable
CALLV
pop
line 2559
;2559:	G_CreateMapRatingsTable();
ADDRGP4 G_CreateMapRatingsTable
CALLV
pop
line 2560
;2560:}
LABELV $2111
endproc G_DB_CreateTables 0 0
export G_DB_Init
proc G_DB_Init 0 4
line 2562
;2561:
;2562:void G_DB_Init() {
line 2563
;2563:	if (coolApi_dbVersion) {
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 0
EQI4 $2113
line 2564
;2564:		G_Printf("------- DB Initialization -------\n");
ADDRGP4 $2115
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 2565
;2565:		G_DB_CreateTables();
ADDRGP4 G_DB_CreateTables
CALLV
pop
line 2566
;2566:		G_Printf("------- DB Initialization End -------\n");
ADDRGP4 $2116
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 2567
;2567:	}
LABELV $2113
line 2568
;2568:}
LABELV $2112
endproc G_DB_Init 0 4
export G_InsertRun
proc G_InsertRun 832 16
line 2571
;2569:extern const char* DF_RacePrintAppendage(finishedRunInfo_t* runInfo);
;2570://qboolean G_InsertRun(gentity_t* ent, int milliseconds, float topspeed, float average, float distance, int warningFlags, int levelTimeFinish, int commandTimeFinish, int runId) {
;2571:qboolean G_InsertRun(finishedRunInfo_t* runInfo) {
line 2576
;2572:	//gclient_t* cl = ent->client;
;2573:	insertUpdateRunStruct_t runData;
;2574:	//static char serverInfo[BIG_INFO_STRING];
;2575:	//static char course[COURSENAME_MAX_LEN+1];
;2576:	const char* insertOrUpdateRequest = NULL;
ADDRLP4 760
CNSTP4 0
ASGNP4
line 2577
;2577:	const char* lbSQLCondition = NULL;
ADDRLP4 756
CNSTP4 0
ASGNP4
line 2579
;2578:	//if (!cl || !cl->sess.raceMode) return qfalse;
;2579:	memset(&runData, 0, sizeof(runData));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTU4 756
ARGU4
ADDRGP4 memset
CALLP4
pop
line 2589
;2580:
;2581:	//runData.runInfo.runId = runId;
;2582:	//runData.runInfo.milliseconds = milliseconds;
;2583:	//runData.runInfo.topspeed = topspeed;
;2584:	//runData.runInfo.average = average;
;2585:	//runData.runInfo.distance = distance;
;2586:	//runData.runInfo.warningFlags = warningFlags;
;2587:	//runData.runInfo.levelTimeEnd = levelTimeFinish;
;2588:
;2589:	runData.runInfo = *runInfo;
ADDRLP4 0+20
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 736
line 2592
;2590:
;2591:	//runData.userId = cl->sess.login.loggedIn ? cl->sess.login.id : -1;
;2592:	runData.clientnum = runInfo->clientNum;
ADDRLP4 0+16
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2593
;2593:	memcpy(runData.ip, mv_clientSessions[runData.clientnum].clientIP, sizeof(runData.ip));
ADDRLP4 0
ARGP4
CNSTI4 20
ADDRLP4 0+16
INDIRI4
MULI4
ADDRGP4 mv_clientSessions
ADDP4
ARGP4
CNSTU4 16
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 2599
;2594:
;2595:	//trap_GetServerinfo(serverInfo, sizeof(serverInfo));
;2596:	//Q_strncpyz(course, Info_ValueForKey(serverInfo, "mapname"), sizeof(course));
;2597:
;2598:
;2599:	if (coolApi_dbVersion < 3) {
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
GEI4 $2121
line 2600
;2600:		trap_SendServerCommand(-1, va("print \"Database API version below < 3. Run cannot be saved.\n\" dfrunsavefailed %s", DF_RacePrintAppendage(runInfo)));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 764
ADDRGP4 DF_RacePrintAppendage
CALLP4
ASGNP4
ADDRGP4 $2123
ARGP4
ADDRLP4 764
INDIRP4
ARGP4
ADDRLP4 768
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 768
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2601
;2601:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2117
JUMPV
LABELV $2121
line 2612
;2602:	}
;2603:
;2604:
;2605:
;2606:#define GETCONNECTIONIP "(select host from information_schema.processlist WHERE ID=connection_id())"
;2607:#define SUBFUNC(a,b) `b ## a`
;2608:#define RUNFLAGSFUNC(a,b,c,d,e,f) QUOTEME(SUBFUNC(a,d)) "," // gotta do this cuz qvm gets confused by the comma otherwise
;2609:#define RUNFLAGSFUNC2(a,b,c,d,e,f) "?,"
;2610:#define RUNFLAGSFUNC3(a,b,c,d,e,f) `d ## a`=? AND
;2611:	
;2612:	lbSQLCondition = getLeaderboardSQLConditions(runInfo->lbType, &level.mapDefaultRaceStyle);
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ARGI4
ADDRGP4 level+9116
ARGP4
ADDRLP4 764
ADDRGP4 getLeaderboardSQLConditions
CALLP4
ASGNP4
ADDRLP4 756
ADDRLP4 764
INDIRP4
ASGNP4
line 2613
;2613:	insertOrUpdateRequest =
ADDRGP4 $2125
ARGP4
ADDRLP4 756
INDIRP4
ARGP4
ADDRLP4 756
INDIRP4
ARGP4
ADDRLP4 772
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 760
ADDRLP4 772
INDIRP4
ASGNP4
line 2654
;2614:		va("SET @now=NOW();"
;2615:			"INSERT INTO runs (userid,course,subcourse,duration_ms,duration_ms_segmented_total,topspeed,startTriggerSpeed,rollSpeed,rollTakeoffClientSpeed,average,distance,style,msec,jump,variant,runFlags,"
;2616:			RUNFLAGS(RUNFLAGSFUNC)
;2617:			"runwhen,runfirst,warningFlags,fpsString, distanceXY,startLessTime,endLessTime,saveposCount,resposCount,lostMsecCount,lostCmdsCount,server,semiBreakingChangeVersion) "
;2618:			"VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
;2619:			RUNFLAGS(RUNFLAGSFUNC2)
;2620:			"@now,@now,?,?,?,?,?,?,?,?,?," GETCONNECTIONIP "," QUOTE(SEMIBREAKINGCHANGEVERSIONDEFRAG) ") "
;2621:			"ON DUPLICATE KEY UPDATE "
;2622:			"duration_ms_segmented_total = IF(?<duration_ms,?,duration_ms_segmented_total),"
;2623:			"topspeed = IF(?<duration_ms,?,topspeed),"
;2624:			"startTriggerSpeed = IF(?<duration_ms,?,startTriggerSpeed),"
;2625:			"rollSpeed = IF(?<duration_ms,?,rollSpeed),"
;2626:			"rollTakeoffClientSpeed = IF(?<duration_ms,?,rollTakeoffClientSpeed),"
;2627:			"average = IF(?<duration_ms,?,average),"
;2628:			"distance = IF(?<duration_ms,?,distance),"
;2629:			"runwhen = IF(?<duration_ms,@now,runwhen),"
;2630:			"warningFlags = IF(?<duration_ms,?,warningFlags),"
;2631:			"fpsString = IF(?<duration_ms,?,fpsString),"
;2632:			"distanceXY = IF(?<duration_ms,?,distanceXY),"
;2633:			"startLessTime = IF(?<duration_ms,?,startLessTime),"
;2634:			"endLessTime = IF(?<duration_ms,?,endLessTime),"
;2635:			"saveposCount = IF(?<duration_ms,?,saveposCount),"
;2636:			"resposCount = IF(?<duration_ms,?,resposCount),"
;2637:			"lostMsecCount = IF(?<duration_ms,?,lostMsecCount),"
;2638:			"lostCmdsCount = IF(?<duration_ms,?,lostCmdsCount),"
;2639:			"server = IF(?<duration_ms," GETCONNECTIONIP ",server),"
;2640:			"semiBreakingChangeVersion = IF(?<duration_ms," QUOTE(SEMIBREAKINGCHANGEVERSIONDEFRAG) ",semiBreakingChangeVersion),"
;2641:			"duration_ms = IF(?<duration_ms,?,duration_ms);" // duration_ms has to be set last or else all other columns arent updated
;2642:			// check if we had a better time on this leaderboard before. (return value of INSERT OR UPDATE only tells us if it was the best with the unique key, but leaderboards accumulate ranges of race settings, especially "custom" leaderboard and such)
;2643:			"SELECT COUNT(id) AS countOwnFaster FROM runs WHERE userid=? AND course=? AND subcourse=? AND style=? AND variant=? AND %s AND (duration_ms<? OR (duration_ms=? AND runwhen<@now));"
;2644:			// check our new rank.
;2645:			"SELECT COUNT(DISTINCT userid) AS countFaster FROM runs WHERE hidden=0 AND userid !=? AND userid!=-1 AND course=? AND subcourse=? AND style=? AND variant=? AND %s AND (duration_ms<? OR (duration_ms=? AND runwhen<@now));" // if someone got the same time as you, but earlier, hes in front of u
;2646:			"SELECT (UNIX_TIMESTAMP(@now)-(?*1000000000)) as unixTimeMinus3bill", lbSQLCondition, lbSQLCondition);
;2647:	
;2648:#undef RUNFLAGSFUNC
;2649:#undef RUNFLAGSFUNC2
;2650:#undef RUNFLAGSFUNC3
;2651:		
;2652:
;2653:
;2654:	if(!G_COOL_API_DB_AddPreparedStatement((byte*)&runData, sizeof(insertUpdateRunStruct_t), DBREQUEST_INSERTORUPDATERUN,
ADDRLP4 0
ARGP4
CNSTI4 756
ARGI4
CNSTI4 7
ARGI4
ADDRLP4 760
INDIRP4
ARGP4
ADDRLP4 776
ADDRGP4 G_COOL_API_DB_AddPreparedStatement
CALLI4
ASGNI4
ADDRLP4 776
INDIRI4
CNSTI4 0
NEI4 $2126
line 2655
;2655:		insertOrUpdateRequest)) {
line 2656
;2656:		trap_SendServerCommand(-1, va("print \"Database connection not available. Run cannot be saved.\n\" dfrunsavefailed %s", DF_RacePrintAppendage(runInfo)));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 780
ADDRGP4 DF_RacePrintAppendage
CALLP4
ASGNP4
ADDRGP4 $2128
ARGP4
ADDRLP4 780
INDIRP4
ARGP4
ADDRLP4 784
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 784
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2657
;2657:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2117
JUMPV
LABELV $2126
line 2661
;2658:	}
;2659:
;2660:	// INSERT PART
;2661:	G_COOL_API_DB_PreparedBindInt(runInfo->userId);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2662
;2662:	G_COOL_API_DB_PreparedBindString(runInfo->coursename);
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 2663
;2663:	G_COOL_API_DB_PreparedBindString(runInfo->subcoursename);
ADDRFP4 0
INDIRP4
CNSTI4 225
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 2664
;2664:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2665
;2665:	G_COOL_API_DB_PreparedBindInt(runInfo->millisecondsSegmentedTotal);
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2666
;2666:	G_COOL_API_DB_PreparedBindFloat(runInfo->topspeed);
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2667
;2667:	G_COOL_API_DB_PreparedBindFloat(runInfo->startTriggerSpeed);
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2668
;2668:	G_COOL_API_DB_PreparedBindFloat(runInfo->rollSpeed);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2669
;2669:	G_COOL_API_DB_PreparedBindInt(runInfo->rollTakeoffClientSpeed);
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2670
;2670:	G_COOL_API_DB_PreparedBindFloat(runInfo->average);
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2671
;2671:	G_COOL_API_DB_PreparedBindFloat(runInfo->distance);
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2672
;2672:	G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.movementStyle);
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2673
;2673:	G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.msec);
ADDRFP4 0
INDIRP4
CNSTI4 58
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2674
;2674:	G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.jumpLevel);
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2675
;2675:	G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.variant);
ADDRFP4 0
INDIRP4
CNSTI4 62
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2677
;2676:
;2677:	G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.runFlags);
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2679
;2678:#define RUNFLAGSFUNC(a,b,c,d,e,f) G_COOL_API_DB_PreparedBindInt((int)!!((int)runInfo->raceStyle.runFlags & RFL_ ## b));
;2679:	RUNFLAGS(RUNFLAGSFUNC)
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI2
CVII4 2
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2130
ADDRLP4 780
CNSTI4 1
ASGNI4
ADDRGP4 $2131
JUMPV
LABELV $2130
ADDRLP4 780
CNSTI4 0
ASGNI4
LABELV $2131
ADDRLP4 780
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI2
CVII4 2
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2133
ADDRLP4 784
CNSTI4 1
ASGNI4
ADDRGP4 $2134
JUMPV
LABELV $2133
ADDRLP4 784
CNSTI4 0
ASGNI4
LABELV $2134
ADDRLP4 784
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI2
CVII4 2
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2136
ADDRLP4 788
CNSTI4 1
ASGNI4
ADDRGP4 $2137
JUMPV
LABELV $2136
ADDRLP4 788
CNSTI4 0
ASGNI4
LABELV $2137
ADDRLP4 788
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI2
CVII4 2
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $2139
ADDRLP4 792
CNSTI4 1
ASGNI4
ADDRGP4 $2140
JUMPV
LABELV $2139
ADDRLP4 792
CNSTI4 0
ASGNI4
LABELV $2140
ADDRLP4 792
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI2
CVII4 2
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2142
ADDRLP4 796
CNSTI4 1
ASGNI4
ADDRGP4 $2143
JUMPV
LABELV $2142
ADDRLP4 796
CNSTI4 0
ASGNI4
LABELV $2143
ADDRLP4 796
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI2
CVII4 2
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $2145
ADDRLP4 800
CNSTI4 1
ASGNI4
ADDRGP4 $2146
JUMPV
LABELV $2145
ADDRLP4 800
CNSTI4 0
ASGNI4
LABELV $2146
ADDRLP4 800
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
ADDRLP4 808
CNSTI4 64
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 808
INDIRI4
ADDP4
INDIRI2
CVII4 2
ADDRLP4 808
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2148
ADDRLP4 804
CNSTI4 1
ASGNI4
ADDRGP4 $2149
JUMPV
LABELV $2148
ADDRLP4 804
CNSTI4 0
ASGNI4
LABELV $2149
ADDRLP4 804
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI2
CVII4 2
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2151
ADDRLP4 812
CNSTI4 1
ASGNI4
ADDRGP4 $2152
JUMPV
LABELV $2151
ADDRLP4 812
CNSTI4 0
ASGNI4
LABELV $2152
ADDRLP4 812
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI2
CVII4 2
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2154
ADDRLP4 816
CNSTI4 1
ASGNI4
ADDRGP4 $2155
JUMPV
LABELV $2154
ADDRLP4 816
CNSTI4 0
ASGNI4
LABELV $2155
ADDRLP4 816
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI2
CVII4 2
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2157
ADDRLP4 820
CNSTI4 1
ASGNI4
ADDRGP4 $2158
JUMPV
LABELV $2157
ADDRLP4 820
CNSTI4 0
ASGNI4
LABELV $2158
ADDRLP4 820
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI2
CVII4 2
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2160
ADDRLP4 824
CNSTI4 1
ASGNI4
ADDRGP4 $2161
JUMPV
LABELV $2160
ADDRLP4 824
CNSTI4 0
ASGNI4
LABELV $2161
ADDRLP4 824
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI2
CVII4 2
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $2163
ADDRLP4 828
CNSTI4 1
ASGNI4
ADDRGP4 $2164
JUMPV
LABELV $2163
ADDRLP4 828
CNSTI4 0
ASGNI4
LABELV $2164
ADDRLP4 828
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2682
;2680:#undef RUNFLAGSFUNC
;2681:
;2682:	G_COOL_API_DB_PreparedBindInt(runInfo->warningFlags);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2683
;2683:	G_COOL_API_DB_PreparedBindString(runInfo->fpsString);
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 2684
;2684:	G_COOL_API_DB_PreparedBindFloat(runInfo->distanceXY);
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2685
;2685:	G_COOL_API_DB_PreparedBindInt(runInfo->startLessTime);
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2686
;2686:	G_COOL_API_DB_PreparedBindInt(runInfo->endLessTime);
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2687
;2687:	G_COOL_API_DB_PreparedBindInt(runInfo->savePosCount);
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2688
;2688:	G_COOL_API_DB_PreparedBindInt(runInfo->resposCount);
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2689
;2689:	G_COOL_API_DB_PreparedBindInt(runInfo->lostMsecCount);
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2690
;2690:	G_COOL_API_DB_PreparedBindInt(runInfo->lostPacketCount);
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2693
;2691:
;2692:	// UPDATE PART
;2693:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2694
;2694:	G_COOL_API_DB_PreparedBindInt(runInfo->millisecondsSegmentedTotal);
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2696
;2695:
;2696:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2697
;2697:	G_COOL_API_DB_PreparedBindFloat(runInfo->topspeed);
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2699
;2698:
;2699:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2700
;2700:	G_COOL_API_DB_PreparedBindFloat(runInfo->startTriggerSpeed);
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2702
;2701:
;2702:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2703
;2703:	G_COOL_API_DB_PreparedBindFloat(runInfo->rollSpeed);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2705
;2704:
;2705:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2706
;2706:	G_COOL_API_DB_PreparedBindInt(runInfo->rollTakeoffClientSpeed);
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2708
;2707:
;2708:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2709
;2709:	G_COOL_API_DB_PreparedBindFloat(runInfo->average);
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2711
;2710:
;2711:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2712
;2712:	G_COOL_API_DB_PreparedBindFloat(runInfo->distance);
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2714
;2713:
;2714:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds); // runwhen
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2716
;2715:
;2716:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2717
;2717:	G_COOL_API_DB_PreparedBindInt(runInfo->warningFlags);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2719
;2718:
;2719:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2720
;2720:	G_COOL_API_DB_PreparedBindString(runInfo->fpsString);
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 2722
;2721:
;2722:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2723
;2723:	G_COOL_API_DB_PreparedBindFloat(runInfo->distanceXY);
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
ARGF4
ADDRGP4 G_COOL_API_DB_PreparedBindFloat
CALLI4
pop
line 2725
;2724:
;2725:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2726
;2726:	G_COOL_API_DB_PreparedBindInt(runInfo->startLessTime);
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2728
;2727:
;2728:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2729
;2729:	G_COOL_API_DB_PreparedBindInt(runInfo->endLessTime);
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2731
;2730:
;2731:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2732
;2732:	G_COOL_API_DB_PreparedBindInt(runInfo->savePosCount);
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2734
;2733:
;2734:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2735
;2735:	G_COOL_API_DB_PreparedBindInt(runInfo->resposCount);
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2737
;2736:
;2737:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2738
;2738:	G_COOL_API_DB_PreparedBindInt(runInfo->lostMsecCount);
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2740
;2739:
;2740:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2741
;2741:	G_COOL_API_DB_PreparedBindInt(runInfo->lostPacketCount);
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2743
;2742:
;2743:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds); // server (value is hardcoded)
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2744
;2744:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds); // semiBreakingChangeVersion (value is hardcoded)
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2746
;2745:
;2746:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2747
;2747:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2750
;2748:
;2749:	// SECOND QUERY - SELECT OUR BEST TIME
;2750:	G_COOL_API_DB_PreparedBindInt(runInfo->userId);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2751
;2751:	G_COOL_API_DB_PreparedBindString(runInfo->coursename);
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 2752
;2752:	G_COOL_API_DB_PreparedBindString(runInfo->subcoursename);
ADDRFP4 0
INDIRP4
CNSTI4 225
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 2753
;2753:	G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.movementStyle);
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2756
;2754:	//G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.msec);
;2755:	//G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.jumpLevel);
;2756:	G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.variant);
ADDRFP4 0
INDIRP4
CNSTI4 62
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2763
;2757:
;2758:	//#define RUNFLAGSFUNC(a,b,c) G_COOL_API_DB_PreparedBindInt((int)!!((int)runInfo->raceStyle.runFlags & RFL_ ## b));
;2759:		//RUNFLAGS(RUNFLAGSFUNC)
;2760:		//G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.runFlags);
;2761:	//#undef RUNFLAGSFUNC
;2762:
;2763:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2764
;2764:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2767
;2765:
;2766:	// THIRD QUERY - SELECT RANK
;2767:	G_COOL_API_DB_PreparedBindInt(runInfo->userId);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2768
;2768:	G_COOL_API_DB_PreparedBindString(runInfo->coursename);
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 2769
;2769:	G_COOL_API_DB_PreparedBindString(runInfo->subcoursename);
ADDRFP4 0
INDIRP4
CNSTI4 225
ADDP4
ARGP4
ADDRGP4 G_COOL_API_DB_PreparedBindString
CALLI4
pop
line 2770
;2770:	G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.movementStyle);
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2773
;2771:	//G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.msec);
;2772:	//G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.jumpLevel);
;2773:	G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.variant);
ADDRFP4 0
INDIRP4
CNSTI4 62
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2780
;2774:
;2775://#define RUNFLAGSFUNC(a,b,c) G_COOL_API_DB_PreparedBindInt((int)!!((int)runInfo->raceStyle.runFlags & RFL_ ## b));
;2776:	//RUNFLAGS(RUNFLAGSFUNC)
;2777:	//G_COOL_API_DB_PreparedBindInt((int)runInfo->raceStyle.runFlags);
;2778://#undef RUNFLAGSFUNC
;2779:
;2780:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2781
;2781:	G_COOL_API_DB_PreparedBindInt(runInfo->milliseconds);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2784
;2782:
;2783:	//if (coolApi_dbVersion >= 3) {
;2784:		G_COOL_API_DB_PreparedBindInt(runInfo->unixTimeStampShiftedBillionCount);
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_COOL_API_DB_PreparedBindInt
CALLI4
pop
line 2787
;2785:	//}
;2786:
;2787:	G_COOL_API_DB_FinishAndSendPreparedStatement();
ADDRGP4 G_COOL_API_DB_FinishAndSendPreparedStatement
CALLI4
pop
line 2790
;2788:	//Q_strncpyz(tableName.s, "runs", sizeof(tableName.s));
;2789:	//G_COOL_API_DB_AddRequest((byte*)&tableName,sizeof(referenceSimpleString_t), DBREQUEST_CREATETABLE, userTableRequest);
;2790:	return qtrue;
CNSTI4 1
RETI4
LABELV $2117
endproc G_InsertRun 832 16
export G_COOL_API_DB_EscapeString
proc G_COOL_API_DB_EscapeString 4 8
line 2825
;2791:}
;2792:
;2793:
;2794:
;2795:
;2796:
;2797:
;2798:
;2799:
;2800:
;2801:
;2802:
;2803:
;2804:
;2805:qboolean	trap_G_COOL_API_DB_EscapeString(char* input, int size);
;2806:qboolean	trap_G_COOL_API_DB_AddRequest(byte* reference, int referenceLength, int requestType, const char* request);
;2807:qboolean	trap_G_COOL_API_DB_AddRequestTyped(byte* reference, int referenceLength, int requestType, const char* request, DBRequestType_t dbRequestType);
;2808:qboolean	trap_G_COOL_API_DB_NextResponse(int* requestType, int* affectedRows, int* status, char* errorMessage, int errorMessageSize, byte* reference, int referenceLength);
;2809:qboolean	trap_G_COOL_API_DB_GetReference(byte* reference, int referenceLength);
;2810:qboolean	trap_G_COOL_API_DB_NextRow();
;2811:int			trap_G_COOL_API_DB_GetInt(int place);
;2812:void		trap_G_COOL_API_DB_GetFloat(int place, float* value);
;2813:qboolean	trap_G_COOL_API_DB_GetString(int place, char* out, int outSize);
;2814:
;2815:qboolean	trap_G_COOL_API_DB_AddPreparedStatement(byte* reference, int referenceLength, int requestType, const char* request);
;2816:qboolean	trap_G_COOL_API_DB_PreparedBindString(const char* string);
;2817:qboolean	trap_G_COOL_API_DB_PreparedBindFloat(float number);
;2818:qboolean	trap_G_COOL_API_DB_PreparedBindInt(int number);
;2819:qboolean	trap_G_COOL_API_DB_PreparedBindBinary(byte* data, int dataLength);
;2820:qboolean	trap_G_COOL_API_DB_FinishAndSendPreparedStatement();
;2821:int			trap_G_COOL_API_DB_GetBinary(int place, byte* out, int outSize);
;2822:qboolean	trap_G_COOL_API_DB_PreparedBindNull();
;2823:qboolean	trap_G_COOL_API_DB_GetMoreResults(int* affectedRows);
;2824:
;2825:qboolean	G_COOL_API_DB_EscapeString(char* input, int size) {
line 2826
;2826:	if (!coolApi_dbVersion) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 0
NEI4 $2166
CNSTI4 0
RETI4
ADDRGP4 $2165
JUMPV
LABELV $2166
line 2827
;2827:	return trap_G_COOL_API_DB_EscapeString(input, size);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_EscapeString
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2165
endproc G_COOL_API_DB_EscapeString 4 8
export G_COOL_API_DB_AddRequest
proc G_COOL_API_DB_AddRequest 4 16
line 2829
;2828:}
;2829:qboolean	G_COOL_API_DB_AddRequest(byte* reference, int referenceLength, int requestType, const char* request) {
line 2830
;2830:	if (!coolApi_dbVersion) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 0
NEI4 $2169
CNSTI4 0
RETI4
ADDRGP4 $2168
JUMPV
LABELV $2169
line 2831
;2831:	return trap_G_COOL_API_DB_AddRequest( reference, referenceLength, requestType, request);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_AddRequest
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2168
endproc G_COOL_API_DB_AddRequest 4 16
export G_COOL_API_DB_AddRequestTyped
proc G_COOL_API_DB_AddRequestTyped 4 20
line 2833
;2832:}
;2833:qboolean	G_COOL_API_DB_AddRequestTyped(byte* reference, int referenceLength, int requestType, const char* request, DBRequestType_t dbRequestType){
line 2834
;2834:	if (coolApi_dbVersion < 2) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 2
GEI4 $2172
CNSTI4 0
RETI4
ADDRGP4 $2171
JUMPV
LABELV $2172
line 2835
;2835:	return trap_G_COOL_API_DB_AddRequestTyped( reference, referenceLength, requestType, request, (int)dbRequestType);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_AddRequestTyped
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2171
endproc G_COOL_API_DB_AddRequestTyped 4 20
export G_COOL_API_DB_NextResponse
proc G_COOL_API_DB_NextResponse 4 28
line 2837
;2836:}
;2837:qboolean	G_COOL_API_DB_NextResponse(int* requestType, int* affectedRows, int* status, char* errorMessage, int errorMessageSize, byte* reference, int referenceLength) {
line 2838
;2838:	if (!coolApi_dbVersion) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 0
NEI4 $2175
CNSTI4 0
RETI4
ADDRGP4 $2174
JUMPV
LABELV $2175
line 2839
;2839:	return trap_G_COOL_API_DB_NextResponse( requestType, affectedRows, status, errorMessage, errorMessageSize, reference, referenceLength);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_NextResponse
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2174
endproc G_COOL_API_DB_NextResponse 4 28
export G_COOL_API_DB_GetReference
proc G_COOL_API_DB_GetReference 4 8
line 2841
;2840:}
;2841:qboolean	G_COOL_API_DB_GetReference(byte* reference, int referenceLength) {
line 2842
;2842:	if (!coolApi_dbVersion) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 0
NEI4 $2178
CNSTI4 0
RETI4
ADDRGP4 $2177
JUMPV
LABELV $2178
line 2843
;2843:	return trap_G_COOL_API_DB_GetReference(reference, referenceLength);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_GetReference
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2177
endproc G_COOL_API_DB_GetReference 4 8
export G_COOL_API_DB_NextRow
proc G_COOL_API_DB_NextRow 4 0
line 2845
;2844:}
;2845:qboolean	G_COOL_API_DB_NextRow() {
line 2846
;2846:	if (!coolApi_dbVersion) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 0
NEI4 $2181
CNSTI4 0
RETI4
ADDRGP4 $2180
JUMPV
LABELV $2181
line 2847
;2847:	return trap_G_COOL_API_DB_NextRow();
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_NextRow
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2180
endproc G_COOL_API_DB_NextRow 4 0
export G_COOL_API_DB_GetInt
proc G_COOL_API_DB_GetInt 4 4
line 2849
;2848:}
;2849:int			G_COOL_API_DB_GetInt(int place) {
line 2850
;2850:	if (!coolApi_dbVersion) return 0;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 0
NEI4 $2184
CNSTI4 0
RETI4
ADDRGP4 $2183
JUMPV
LABELV $2184
line 2851
;2851:	return trap_G_COOL_API_DB_GetInt( place);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_GetInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2183
endproc G_COOL_API_DB_GetInt 4 4
export G_COOL_API_DB_GetFloat
proc G_COOL_API_DB_GetFloat 0 8
line 2853
;2852:}
;2853:void		G_COOL_API_DB_GetFloat(int place, float* value) {
line 2854
;2854:	if (!coolApi_dbVersion) {
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 0
NEI4 $2187
line 2855
;2855:		*value = 0;
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
line 2856
;2856:		return;
ADDRGP4 $2186
JUMPV
LABELV $2187
line 2858
;2857:	}
;2858:	trap_G_COOL_API_DB_GetFloat( place, value);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_G_COOL_API_DB_GetFloat
CALLV
pop
line 2859
;2859:}
LABELV $2186
endproc G_COOL_API_DB_GetFloat 0 8
export G_COOL_API_DB_GetString
proc G_COOL_API_DB_GetString 4 12
line 2860
;2860:qboolean	G_COOL_API_DB_GetString(int place, char* out, int outSize) {
line 2861
;2861:	if (!coolApi_dbVersion) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 0
NEI4 $2190
CNSTI4 0
RETI4
ADDRGP4 $2189
JUMPV
LABELV $2190
line 2862
;2862:	return trap_G_COOL_API_DB_GetString( place, out, outSize);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_GetString
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2189
endproc G_COOL_API_DB_GetString 4 12
export G_COOL_API_DB_AddPreparedStatement
proc G_COOL_API_DB_AddPreparedStatement 4 16
line 2867
;2863:}
;2864:
;2865:// dbApi v3
;2866:
;2867:qboolean	G_COOL_API_DB_AddPreparedStatement(byte* reference, int referenceLength, int requestType, const char* request) {
line 2868
;2868:	if (coolApi_dbVersion < 3) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
GEI4 $2193
CNSTI4 0
RETI4
ADDRGP4 $2192
JUMPV
LABELV $2193
line 2869
;2869:	return trap_G_COOL_API_DB_AddPreparedStatement( reference, referenceLength, requestType, request);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_AddPreparedStatement
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2192
endproc G_COOL_API_DB_AddPreparedStatement 4 16
export G_COOL_API_DB_PreparedBindString
proc G_COOL_API_DB_PreparedBindString 4 4
line 2871
;2870:}
;2871:qboolean	G_COOL_API_DB_PreparedBindString(const char* string) {
line 2872
;2872:	if (coolApi_dbVersion < 3) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
GEI4 $2196
CNSTI4 0
RETI4
ADDRGP4 $2195
JUMPV
LABELV $2196
line 2873
;2873:	return trap_G_COOL_API_DB_PreparedBindString( string);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_PreparedBindString
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2195
endproc G_COOL_API_DB_PreparedBindString 4 4
export G_COOL_API_DB_PreparedBindFloat
proc G_COOL_API_DB_PreparedBindFloat 4 4
line 2875
;2874:}
;2875:qboolean	G_COOL_API_DB_PreparedBindFloat(float number) {
line 2876
;2876:	if (coolApi_dbVersion < 3) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
GEI4 $2199
CNSTI4 0
RETI4
ADDRGP4 $2198
JUMPV
LABELV $2199
line 2877
;2877:	return trap_G_COOL_API_DB_PreparedBindFloat( number);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_PreparedBindFloat
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2198
endproc G_COOL_API_DB_PreparedBindFloat 4 4
export G_COOL_API_DB_PreparedBindInt
proc G_COOL_API_DB_PreparedBindInt 4 4
line 2879
;2878:}
;2879:qboolean	G_COOL_API_DB_PreparedBindInt(int number) {
line 2880
;2880:	if (coolApi_dbVersion < 3) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
GEI4 $2202
CNSTI4 0
RETI4
ADDRGP4 $2201
JUMPV
LABELV $2202
line 2881
;2881:	return trap_G_COOL_API_DB_PreparedBindInt( number);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_PreparedBindInt
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2201
endproc G_COOL_API_DB_PreparedBindInt 4 4
export G_COOL_API_DB_PreparedBindBinary
proc G_COOL_API_DB_PreparedBindBinary 4 8
line 2883
;2882:}
;2883:qboolean	G_COOL_API_DB_PreparedBindBinary(byte* data, int dataLength) {
line 2884
;2884:	if (coolApi_dbVersion < 3) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
GEI4 $2205
CNSTI4 0
RETI4
ADDRGP4 $2204
JUMPV
LABELV $2205
line 2885
;2885:	return trap_G_COOL_API_DB_PreparedBindBinary( data, dataLength);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_PreparedBindBinary
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2204
endproc G_COOL_API_DB_PreparedBindBinary 4 8
export G_COOL_API_DB_FinishAndSendPreparedStatement
proc G_COOL_API_DB_FinishAndSendPreparedStatement 4 0
line 2887
;2886:}
;2887:qboolean	G_COOL_API_DB_FinishAndSendPreparedStatement() {
line 2888
;2888:	if (coolApi_dbVersion < 3) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
GEI4 $2208
CNSTI4 0
RETI4
ADDRGP4 $2207
JUMPV
LABELV $2208
line 2889
;2889:	return trap_G_COOL_API_DB_FinishAndSendPreparedStatement();
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_FinishAndSendPreparedStatement
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2207
endproc G_COOL_API_DB_FinishAndSendPreparedStatement 4 0
export G_COOL_API_DB_GetBinary
proc G_COOL_API_DB_GetBinary 4 12
line 2891
;2890:}
;2891:int			G_COOL_API_DB_GetBinary(int place, byte* out, int outSize) {
line 2892
;2892:	if (coolApi_dbVersion < 3) return 0;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
GEI4 $2211
CNSTI4 0
RETI4
ADDRGP4 $2210
JUMPV
LABELV $2211
line 2893
;2893:	return trap_G_COOL_API_DB_GetBinary( place, out, outSize);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_GetBinary
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2210
endproc G_COOL_API_DB_GetBinary 4 12
export G_COOL_API_DB_PreparedBindNull
proc G_COOL_API_DB_PreparedBindNull 4 0
line 2895
;2894:}
;2895:qboolean	G_COOL_API_DB_PreparedBindNull() {
line 2896
;2896:	if (coolApi_dbVersion < 3) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
GEI4 $2214
CNSTI4 0
RETI4
ADDRGP4 $2213
JUMPV
LABELV $2214
line 2897
;2897:	return trap_G_COOL_API_DB_PreparedBindNull();
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_PreparedBindNull
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2213
endproc G_COOL_API_DB_PreparedBindNull 4 0
export G_COOL_API_DB_GetMoreResults
proc G_COOL_API_DB_GetMoreResults 4 4
line 2899
;2898:}
;2899:qboolean	G_COOL_API_DB_GetMoreResults(int* affectedRows) {
line 2900
;2900:	if (coolApi_dbVersion < 3) return qfalse;
ADDRGP4 coolApi_dbVersion
INDIRI4
CNSTI4 3
GEI4 $2217
CNSTI4 0
RETI4
ADDRGP4 $2216
JUMPV
LABELV $2217
line 2901
;2901:	return trap_G_COOL_API_DB_GetMoreResults( affectedRows);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_G_COOL_API_DB_GetMoreResults
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $2216
endproc G_COOL_API_DB_GetMoreResults 4 4
import trap_G_COOL_API_DB_GetMoreResults
import trap_G_COOL_API_DB_PreparedBindNull
import trap_G_COOL_API_DB_GetBinary
import trap_G_COOL_API_DB_FinishAndSendPreparedStatement
import trap_G_COOL_API_DB_PreparedBindBinary
import trap_G_COOL_API_DB_PreparedBindInt
import trap_G_COOL_API_DB_PreparedBindFloat
import trap_G_COOL_API_DB_PreparedBindString
import trap_G_COOL_API_DB_AddPreparedStatement
import trap_G_COOL_API_DB_GetString
import trap_G_COOL_API_DB_GetFloat
import trap_G_COOL_API_DB_GetInt
import trap_G_COOL_API_DB_NextRow
import trap_G_COOL_API_DB_GetReference
import trap_G_COOL_API_DB_NextResponse
import trap_G_COOL_API_DB_AddRequestTyped
import trap_G_COOL_API_DB_AddRequest
import trap_G_COOL_API_DB_EscapeString
import DF_RacePrintAppendage
import DF_RequestPlayerDefaultTime
import DF_UpdateRanks
import G_AutoGenerateArena
import DF_TopRequest
import DF_CreateCustomCheckpointFromPos
import PrintRaceTime
import DF_SetSubContestDefaults
import DF_GetMainSubcourseName
import bcrypt_errno
import _crypt_gensalt_blowfish_rn
import _crypt_blowfish_rn
import _crypt_output_magic
import ClientInactivitySpecTimerReset
import G_ResetClientVote
import generateHashValue
import DF_UpdateRanksMainRequest
import G_BufferedSendOrPrintFlushIfNeeded
import G_BufferedSendOrPrintFlush
import G_BufferedSendOrPrint
import G_SendOrPrint
import DF_KeepClientZombie
import DF_RequestSubContestLeaderboard
import DF_SetPlayerSubContestValue
import DF_ClientInSegmentedRunMode
import DF_PostDeltaAngleChange
import DF_PreDeltaAngleChange
import helpTipCount
import helpTips
import trap_G2API_SetBoneAnim
import trap_G2API_GetGLAName
import trap_G2API_SetBoneAngles
import trap_G2API_CollisionDetect
import trap_G2API_CleanGhoul2Models
import trap_G2API_RemoveGhoul2Model
import trap_G2API_HasGhoul2ModelOnIndex
import trap_G2API_DuplicateGhoul2Instance
import trap_G2API_CopySpecificGhoul2Model
import trap_G2API_CopyGhoul2Instance
import trap_G2API_SetBoltInfo
import trap_G2API_AddBolt
import trap_G2API_InitGhoul2Model
import trap_G2API_GetBoltMatrix_NoRecNoRot
import MV_PlayerStateToEngine
import MV_PlayerStateFromEngine
import MV_VersionMagic
import MV_SetGameVersion
import g_ps
import trap_MVAPI_EnableSubmodelBypass
import trap_MVAPI_EnablePlayerSnapshots
import trap_MVAPI_ResetServerTime
import trap_MVAPI_DisableStructConversion
import trap_MVAPI_LocateGameData
import trap_MVAPI_GetConnectionlessPacket
import trap_MVAPI_SendConnectionlessPacket
import trap_MVAPI_Print
import trap_MVAPI_SetVersion
import trap_FS_FLock
import trap_MVAPI_GetVersion
import trap_MVAPI_ControlFixes
import MVAPI_AfterInit
import MVAPI_Init
import mvStructConversionDisabled
import mvapi
import gRandomUnlockAdd
import coolApi_userCmdVersion
import coolApi_jkaVersion
import coolApi_dbVersion
import coolApi
import trap_ROFF_Purge_Ent
import trap_ROFF_Play
import trap_ROFF_Cache
import trap_ROFF_UpdateEntities
import trap_ROFF_Clean
import trap_SP_GetStringTextString
import trap_SP_Register
import trap_SP_RegisterServer
import trap_RealTime
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_ForcePower
import trap_EA_Alt_Attack
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import JP_TraceCustomEpsilonQ2Lite
import JP_TraceCustomEpsilonQ2
import JP_TracePrecise
import JP_Trace
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_crossServerDefragTimes
import g_crossServerChat
import g_mineSwitchFix
import g_unlockRandom
import g_randomTipInterval
import g_blockIdenticalUserSnapsMinFps
import g_blockIdenticalUserSnaps
import g_userCmdBufferSmoothen
import g_userCmdBuffer
import g_botTeamAutoBalance
import g_submodelWorkaround
import g_mv_forcePowerDisableMode
import g_connectinglimit
import g_connectionlimit
import g_mv_fixturretcrash
import g_mv_blockspeedhack
import g_mv_blockchargejump
import g_mv_fixbrokenmodels
import g_mv_fixgalaking
import g_debugMelee
import g_austrian
import g_saberDebugPrint
import g_saberDmgDelay_Wound
import g_saberDmgDelay_Idle
import g_saberDmgVelocityScale
import g_allowNameDupes
import g_fpsToggleDelay
import g_sv_fps
import g_timeouttospec
import g_forceDodge
import g_dismember
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import g_entHUDFields
import g_fixHighFPSAbuse
import g_ttFlags
import g_pmove_float
import g_pmove_msec
import g_pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_debugUp
import g_debugRight
import g_debugForward
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_slowVoteAFKThreshold
import g_slowVote
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_autoScoresInterval
import g_strafebotSlopeHandling
import g_q2Skims
import g_q2trace
import g_mapDefaultRunFlags
import g_mapDefaultJump
import g_mapDefaultMsec
import g_adaptRespawn
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_developer
import g_inactivityToSpecRacers
import g_inactivityToSpec
import g_inactivity
import g_afkCmdMinSecs
import g_startWeaponAlwaysSaber
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlySaber
import g_friendlyFire
import g_saberInterpolate
import g_capturelimit
import g_timelimit
import g_duel_fraglimit
import g_fraglimit
import g_duelWeaponDisable
import g_fraglimitVoteCorrection
import g_allowDuelSuicide
import g_weaponDisable
import g_forcePowerDisable
import g_spawnInvulnerability
import g_forceRegenTime
import g_alwaysAllowTeamChat
import g_useWhileThrowing
import g_saberDamageScale
import g_slowmoDuelEnd
import g_logClientInfo
import g_saberBoxTraceSize
import g_saberAlwaysBoxTrace
import g_saberGhoul2Collision
import g_arenaAutoGen
import g_defragArenaAutoGen
import g_defragForceRegenFps
import g_bubbleSpawn
import g_triggersRobust
import g_defragSimpleResetSpawn
import g_defragKillSafetyMinSecs
import g_defragAutoDemo
import g_defragLastDemoId
import g_defragLastRunId
import g_defrag
import g_modesDefault
import g_modes
import g_saberTraceSaberFirst
import g_saberLockFactor
import g_saberLocking
import g_privateDuel
import g_forceBasedTeams
import g_maxForceRank
import g_dmflags
import g_autoMapCycle
import g_trueJedi
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_dfv
import g_logicalents
import g_entitiesHashTableCount
import g_entitiesHashTable
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectSagaSpawnPoint
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import B_CleanupAlloc
import B_InitAlloc
import InFieldOfVision
import BotOrder
import OrgVisible
import InitSagaMode
import G_ClearClientLog
import G_LogExit
import G_LogWeaponOutput
import G_LogWeaponInit
import G_LogWeaponItem
import G_LogWeaponPowerup
import G_LogWeaponFrag
import G_LogWeaponDeath
import G_LogWeaponKill
import G_LogWeaponDamage
import G_LogWeaponFire
import G_LogWeaponPickup
import Jedi_DodgeEvasion
import ForceTelepathy
import ForceThrow
import ForceSeeing
import ForceTeamForceReplenish
import ForceTeamHeal
import ForceAbsorb
import ForceProtect
import ForceGrip
import ForceRage
import ForceSpeed
import ForceHeal
import ForcePowerUsableOn
import WP_ForcePowersUpdate
import WP_SpawnInitForcePowers
import WP_InitForcePowers
import WP_SaberInitBladeData
import WP_SaberCanBlock
import WP_SaberPositionUpdate
import WP_ForcePowerStop
import MakeDeadSaber
import thrownSaberTouch
import SaberGotHit
import SaberUpdateSelf
import HasSetSaberOnly
import G_PreDefSound
import G_RefreshNextMap
import G_DoesMapHaveArena
import G_DoesMapSupportGametype
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_IsMapBlacklisted
import G_GetArenaInfoByMap
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import MV_ReadSessionData
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_CheckDroppedItem
import OnSameTeam
import G_ResetUserCmdStore
import G_GetUserCmd
import G_RunClient
import SpectatorClientEndFrame
import ClientEndFrameInClientThink
import ClientEndFrame
import ClientThink
import G_CheckClientTimeouts
import G_SendCrossServerCommand
import G_CrossServerCommand
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientPhysicsFpsChanged
import ClientUserinfoChanged
import ClientConnect
import MV_ModelindexToTime2
import MV_BBoxToTime2
import myrand
import mysrand
import G_StringAppendSubstring
import MV_UpdateSvFlags
import MV_UpdateMvsdkConfigstring
import G_GetStripEdString
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import mv_clientSessions
import mv_entities
import g_clients
import gSlowMoDuelTime
import gDoSlowMoDuel
import g_ff_objectives
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import BlowDetpacks
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import gJMSaberEnt
import G_SendServerCommand
import G_CenterPrint
import SelectNearestDeathmatchSpawnPoint
import WiggleSpotTelefrag
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import G_Kill
import ClientSpawn
import InitPlayerStats
import InitBodyQue
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import WP_FireGenericBlasterMissile
import WP_FireTurretMissile
import G_CreateExampleAnimEnt
import G_PlayerBecomeATST
import ATST_ManageDamageBoxes
import TeleportPlayer
import trigger_teleporter_touch
import G_ResetActivatorTimeDelta
import G_SetActivator
import G_ClearActivatedEntities
import G_ClearEntityActivator
import Touch_DoorTrigger
import G_RunMover
import WP_FireBlasterMissile
import G_ExplodeMissile
import G_BounceProjectile
import CreateMissile
import G_RunMissile
import G_ReflectMissile
import gGAvoidDismember
import G_CheckForDismemberment
import ExplodeDeath
import TossClientCubes
import TossClientItems
import TossClientWeapon
import body_die
import G_RadiusDamage
import G_Damage
import CanDamage
import trap_G_COOL_API_GetFileVersion
import trap_G_COOL_API_AttachG2Model
import trap_G_COOL_API_GetSurfaceRenderStatus
import trap_G_COOL_API_SkinlessModel
import trap_G_COOL_API_SetSkin
import trap_G_COOL_API_GiveMeVectorFromMatrix
import trap_G_COOL_API_GetLanguageName
import trap_G_COOL_API_GetNumLanguages
import trap_G_COOL_API_CrossServerCommand
import trap_G_COOL_API_CustomEpsilonTraceCapsule
import trap_G_COOL_API_CustomEpsilonTrace
import trap_G_COOL_API_SendBackUCMD_GameGenerated
import trap_G_COOL_API_NonEpsilonTraceCapsule
import trap_G_COOL_API_NonEpsilonTrace
import trap_G_COOL_API_PlayerUserCmdGetCount
import trap_G_COOL_API_PlayerUserCmdGet
import trap_G_COOL_API_PlayerUserCmdClear
import trap_G_COOL_API_PlayerUserCmdRemove
import trap_G_COOL_API_PlayerUserCmdAdd
import trap_G_COOL_API_SetBrushModelContentFlags
import trap_G2API_GetBoltMatrix_NoReconstruct
import trap_G2API_GetBoltMatrix
import trap_G2_HaveWeGhoul2Models
import trap_G2_SetGhoul2ModelIndexes
import trap_G2_ListModelBones
import trap_G2_ListModelSurfaces
import G_SkinIndex
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vtos
import tv
import G_RunObject
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_KillG2Queue
import G_SendG2KillQueue
import TryUse
import G_EntitySound
import G_SoundAtLoc
import G_Sound
import G_MuteSound
import G_ScreenShake
import G_PlayEffect
import G_TempEntity
import G_SpawnLogical
import G_SpawnAfter
import G_Spawn
import G_SetClassName
import G_UnlistFromHashTable
import G_InitGentity
import G_SetAngles
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_RadiusList
import G_FindByClassNameFast
import G_FindByClassName
import G_Find
import G_KillBox
import G_TeamCommand
import G_EffectIndex
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import ItemUse_MedPack
import ItemUse_Seeker
import ItemUse_Sentry
import ItemUse_Shield
import ItemUse_Binoculars
import G_GetDuelWinner
import ConcatArgsQuoted
import G_SayTo
import Cmd_EngageDuel_f
import Cmd_ToggleSaber_f
import G_ItemUsable
import Cmd_SaberAttackCycle_f
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import gEscapeTime
import gEscaping
import g2SaberInstance
import precachedKyle
import DF_GetCourseName
import DF_CheckRaceCvarChanges
import DF_FormatFpsString
import DF_HandleUnfinishedDemos
import DF_SetMapDefaults
import DF_LoadMapDefaults
import MovementStyleDisabledRunFlags
import PlayerSnapshotRestoreValues
import PlayerSnapshotHackValues
import MovementStyleAllowsWeapons
import G_ConvertDefragTriggerTypes
import subContestParams
import nameTagTypeNames
import userCmdBuffer
import semiBreakingChangeVersionDefrag
import BG_Cmd_TokenizeString
import BG_Cmd_DropArg
import BG_Cmd_ArgsBuffer
import BG_Cmd_Cmd
import BG_Cmd_ArgsFrom
import BG_Cmd_Args
import BG_Cmd_Argv
import BG_Cmd_Argc
import MV_SetGamePlay
import MV_BuildAnimationMappingTable
import animMappingTable_1_02_to_1_04
import animMappingTable_1_04_to_1_02
import jk2startversion
import jk2gameplay
import jk2version
import BG_DB_VerifyPassword
import g_arenaInfosHashed
import g_numArenas
import forcePowerDarkLight
import WeaponAttackAnim
import WeaponReadyAnim
import WP_SetSaber
import BG_SI_DeactivateTrail
import BG_SI_ActivateTrail
import BG_SI_LengthMax
import BG_SI_Length
import BG_SI_SetLengthGradual
import BG_SI_SetDesiredLength
import BG_SI_SetLength
import BG_SI_Active
import BG_SI_BladeActivate
import BG_SI_Deactivate
import BG_SI_Activate
import BG_BLADE_DeactivateTrail
import BG_BLADE_ActivateTrail
import BG_OutOfMemory
import BG_StringAlloc
import BG_TempFree
import BG_TempAllocTry
import BG_TempAlloc
import BG_AllocUnaligned
import BG_Alloc
import BG_CanUseFPNow
import BG_HasYsalamiri
import BG_GetItemIndexByTag
import BG_ParseAnimationFile
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPadVelocity
import BG_TouchJumpPad
import BG_StatsToRaceStyle
import BG_RaceStyleToUserStats
import BG_StatsToUserCmd
import BG_UserCmdToUserStats
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_ForcePowerDrain
import BG_SaberStartTransAnim
import BG_InDeathAnim
import BG_InRoll
import BG_KnockawayForParry
import BG_BrokenParryForParry
import BG_BrokenParryForAttack
import BG_SaberInSpecialAttack
import BG_SpinningSaberAnim
import BG_FlippingAnim
import BG_SaberInIdle
import BG_SaberInSpecial
import BG_SaberInAttack
import BG_DirectFlippingAnim
import BG_InBackFlip
import BG_InReboundRelease
import BG_InReboundHold
import BG_InReboundJump
import BG_InSaberStandAnim
import BG_InSpecialJump
import BG_LegalizedForcePowers
import saberMoveData
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import vectoyaw
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import pm
import bgForcePowerCost
import forceMasteryPoints
import forceMasteryLevels
import bgAllAnims
import bgGlobalAnimations
import BGPAFtextLoaded
import forcePowerSorted
import WP_MuzzlePoint
import InitFpsTable
import fpsTableIndexToMsec
import fpsTableMsecToIndex
import DF_AntiLoop_NewAngle
import DF_DemoRaceStyleNamePart
import miniva
import multiva
import getDefaultMapRaceStyle
import getLeaderboardSQLConditions
import classifyLeaderBoard
import RaceStyleIsMainLeaderboard
import RunFlagsToString
import DF_MsToString
import MovementIsQuake3Based
import MovementStyleHasCPMOnlyJumppads
import MovementStyleHasVQ3OnlyJumppads
import MovementStyleHasQuake2Ramps
import LeaderboardNameToInteger
import RaceNameToInteger
import PlayerModeNameToInteger
import defaultRaceStyle
import leaderboardNames
import moveStyleNames
import modeNames
import runFlagsVeryShortNames
import runFlagsShortNames
import runFlagsNames
import MAX_RUN_FLAGS
import allowedMovementStyles
import allowedMapDefaultRunFlags
import allowedRunFlags
import allowedRollRunFlags
import defaultRunFlags
import ammoData
import weaponData
import weaponData_1_04
import weaponData_1_03
import weaponData_1_02
import fpclassify
import clampedIntAdd
import clampedIntMult
import parseHex
import colorToHex
import safeatoi
import sanitizeFilename
import ezDemoBuffer
import GetStringForID
import GetIDForString
import Q_irandExpectedIf
import Q_irand
import irand
import flrand
import Rand_Init
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_HasKey
import Info_ValueForKey
import va
import FloatSwap
import LongSwap
import ShortSwap
import Q_StripColor
import Q_strstrip
import Q_strchrs
import Q_CleanAsciiStr
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strnncpyz
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseVec4
import COM_ParseFloat
import COM_ParseInt
import COM_ParseString
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import SkipWhitespace
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clampi
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import ET_asin
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import Q_pown
import JK2_powf
import ClampShort
import ClampChar
import floatint
import intfloat
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table_nt
import g_color_table
import colorDkBlue
import colorLtBlue
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import colorTable
import bytedirs
import Hunk_Alloc
import forceSpeedLevels
import powf
import logf
import expf
import frexpf
import roundf
import asin
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcmp
import memcpy
import memset
import memmove
import sscanf
import vsnprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $2128
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 68
byte 1 97
byte 1 116
byte 1 97
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 46
byte 1 32
byte 1 82
byte 1 117
byte 1 110
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 32
byte 1 100
byte 1 102
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2125
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 64
byte 1 110
byte 1 111
byte 1 119
byte 1 61
byte 1 78
byte 1 79
byte 1 87
byte 1 40
byte 1 41
byte 1 59
byte 1 73
byte 1 78
byte 1 83
byte 1 69
byte 1 82
byte 1 84
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 79
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 40
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 44
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 44
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 44
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 95
byte 1 116
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 44
byte 1 116
byte 1 111
byte 1 112
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 44
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 84
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 44
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 44
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 84
byte 1 97
byte 1 107
byte 1 101
byte 1 111
byte 1 102
byte 1 102
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 44
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 97
byte 1 103
byte 1 101
byte 1 44
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 44
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 44
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 44
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 44
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 44
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 98
byte 1 117
byte 1 103
byte 1 96
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 114
byte 1 97
byte 1 109
byte 1 112
byte 1 115
byte 1 96
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 117
byte 1 99
byte 1 107
byte 1 96
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 96
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 96
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 96
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 96
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 97
byte 1 115
byte 1 96
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 99
byte 1 108
byte 1 105
byte 1 109
byte 1 98
byte 1 96
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 106
byte 1 112
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 96
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 80
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 96
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 76
byte 1 111
byte 1 111
byte 1 112
byte 1 96
byte 1 44
byte 1 114
byte 1 117
byte 1 110
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 44
byte 1 114
byte 1 117
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 44
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 44
byte 1 102
byte 1 112
byte 1 115
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 44
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 88
byte 1 89
byte 1 44
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 76
byte 1 101
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 44
byte 1 101
byte 1 110
byte 1 100
byte 1 76
byte 1 101
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 44
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 112
byte 1 111
byte 1 115
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 44
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 115
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 44
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 77
byte 1 115
byte 1 101
byte 1 99
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 44
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 67
byte 1 109
byte 1 100
byte 1 115
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 44
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 44
byte 1 115
byte 1 101
byte 1 109
byte 1 105
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 86
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 41
byte 1 32
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 83
byte 1 32
byte 1 40
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 64
byte 1 110
byte 1 111
byte 1 119
byte 1 44
byte 1 64
byte 1 110
byte 1 111
byte 1 119
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 40
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 99
byte 1 104
byte 1 101
byte 1 109
byte 1 97
byte 1 46
byte 1 112
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 73
byte 1 68
byte 1 61
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 105
byte 1 100
byte 1 40
byte 1 41
byte 1 41
byte 1 44
byte 1 51
byte 1 41
byte 1 32
byte 1 79
byte 1 78
byte 1 32
byte 1 68
byte 1 85
byte 1 80
byte 1 76
byte 1 73
byte 1 67
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 75
byte 1 69
byte 1 89
byte 1 32
byte 1 85
byte 1 80
byte 1 68
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 95
byte 1 116
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 95
byte 1 116
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 41
byte 1 44
byte 1 116
byte 1 111
byte 1 112
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 116
byte 1 111
byte 1 112
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 41
byte 1 44
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 84
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 84
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 41
byte 1 44
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 41
byte 1 44
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 84
byte 1 97
byte 1 107
byte 1 101
byte 1 111
byte 1 102
byte 1 102
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 84
byte 1 97
byte 1 107
byte 1 101
byte 1 111
byte 1 102
byte 1 102
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 41
byte 1 44
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 97
byte 1 103
byte 1 101
byte 1 41
byte 1 44
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 41
byte 1 44
byte 1 114
byte 1 117
byte 1 110
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 64
byte 1 110
byte 1 111
byte 1 119
byte 1 44
byte 1 114
byte 1 117
byte 1 110
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 41
byte 1 44
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 41
byte 1 44
byte 1 102
byte 1 112
byte 1 115
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 102
byte 1 112
byte 1 115
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 41
byte 1 44
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 88
byte 1 89
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 88
byte 1 89
byte 1 41
byte 1 44
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 76
byte 1 101
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 76
byte 1 101
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 41
byte 1 44
byte 1 101
byte 1 110
byte 1 100
byte 1 76
byte 1 101
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 101
byte 1 110
byte 1 100
byte 1 76
byte 1 101
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 41
byte 1 44
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 112
byte 1 111
byte 1 115
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 112
byte 1 111
byte 1 115
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 41
byte 1 44
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 115
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 115
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 41
byte 1 44
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 77
byte 1 115
byte 1 101
byte 1 99
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 77
byte 1 115
byte 1 101
byte 1 99
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 41
byte 1 44
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 67
byte 1 109
byte 1 100
byte 1 115
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 67
byte 1 109
byte 1 100
byte 1 115
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 41
byte 1 44
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 40
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 99
byte 1 104
byte 1 101
byte 1 109
byte 1 97
byte 1 46
byte 1 112
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 73
byte 1 68
byte 1 61
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 105
byte 1 100
byte 1 40
byte 1 41
byte 1 41
byte 1 44
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 41
byte 1 44
byte 1 115
byte 1 101
byte 1 109
byte 1 105
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 86
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 51
byte 1 44
byte 1 115
byte 1 101
byte 1 109
byte 1 105
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 86
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 41
byte 1 44
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 32
byte 1 61
byte 1 32
byte 1 73
byte 1 70
byte 1 40
byte 1 63
byte 1 60
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 44
byte 1 63
byte 1 44
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 41
byte 1 59
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 67
byte 1 79
byte 1 85
byte 1 78
byte 1 84
byte 1 40
byte 1 105
byte 1 100
byte 1 41
byte 1 32
byte 1 65
byte 1 83
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 79
byte 1 119
byte 1 110
byte 1 70
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 40
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 60
byte 1 63
byte 1 32
byte 1 79
byte 1 82
byte 1 32
byte 1 40
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 60
byte 1 64
byte 1 110
byte 1 111
byte 1 119
byte 1 41
byte 1 41
byte 1 59
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 67
byte 1 79
byte 1 85
byte 1 78
byte 1 84
byte 1 40
byte 1 68
byte 1 73
byte 1 83
byte 1 84
byte 1 73
byte 1 78
byte 1 67
byte 1 84
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 41
byte 1 32
byte 1 65
byte 1 83
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 70
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 104
byte 1 105
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 61
byte 1 48
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 32
byte 1 33
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 33
byte 1 61
byte 1 45
byte 1 49
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 40
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 60
byte 1 63
byte 1 32
byte 1 79
byte 1 82
byte 1 32
byte 1 40
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 60
byte 1 64
byte 1 110
byte 1 111
byte 1 119
byte 1 41
byte 1 41
byte 1 59
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 40
byte 1 85
byte 1 78
byte 1 73
byte 1 88
byte 1 95
byte 1 84
byte 1 73
byte 1 77
byte 1 69
byte 1 83
byte 1 84
byte 1 65
byte 1 77
byte 1 80
byte 1 40
byte 1 64
byte 1 110
byte 1 111
byte 1 119
byte 1 41
byte 1 45
byte 1 40
byte 1 63
byte 1 42
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 41
byte 1 41
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 105
byte 1 120
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 77
byte 1 105
byte 1 110
byte 1 117
byte 1 115
byte 1 51
byte 1 98
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $2123
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 68
byte 1 97
byte 1 116
byte 1 97
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 65
byte 1 80
byte 1 73
byte 1 32
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 98
byte 1 101
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 60
byte 1 32
byte 1 51
byte 1 46
byte 1 32
byte 1 82
byte 1 117
byte 1 110
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 32
byte 1 100
byte 1 102
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2116
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 68
byte 1 66
byte 1 32
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 69
byte 1 110
byte 1 100
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $2115
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 68
byte 1 66
byte 1 32
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $2110
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $2109
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 98
byte 1 117
byte 1 103
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 114
byte 1 97
byte 1 109
byte 1 112
byte 1 115
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 117
byte 1 99
byte 1 107
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 97
byte 1 115
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 99
byte 1 108
byte 1 105
byte 1 109
byte 1 98
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 106
byte 1 112
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 80
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 76
byte 1 111
byte 1 111
byte 1 112
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 98
byte 1 117
byte 1 103
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 98
byte 1 117
byte 1 103
byte 1 96
byte 1 41
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 114
byte 1 97
byte 1 109
byte 1 112
byte 1 115
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 114
byte 1 97
byte 1 109
byte 1 112
byte 1 115
byte 1 96
byte 1 41
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 117
byte 1 99
byte 1 107
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 117
byte 1 99
byte 1 107
byte 1 96
byte 1 41
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 96
byte 1 41
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 96
byte 1 41
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 96
byte 1 41
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 96
byte 1 41
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 97
byte 1 115
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 97
byte 1 115
byte 1 96
byte 1 41
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 99
byte 1 108
byte 1 105
byte 1 109
byte 1 98
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 99
byte 1 108
byte 1 105
byte 1 109
byte 1 98
byte 1 96
byte 1 41
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 106
byte 1 112
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 106
byte 1 112
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 96
byte 1 41
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 80
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 80
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 96
byte 1 41
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 76
byte 1 111
byte 1 111
byte 1 112
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 76
byte 1 111
byte 1 111
byte 1 112
byte 1 96
byte 1 41
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 98
byte 1 117
byte 1 103
byte 1 96
byte 1 32
byte 1 68
byte 1 82
byte 1 79
byte 1 80
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 114
byte 1 97
byte 1 109
byte 1 112
byte 1 115
byte 1 96
byte 1 32
byte 1 68
byte 1 82
byte 1 79
byte 1 80
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 117
byte 1 99
byte 1 107
byte 1 96
byte 1 32
byte 1 68
byte 1 82
byte 1 79
byte 1 80
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 96
byte 1 32
byte 1 68
byte 1 82
byte 1 79
byte 1 80
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 96
byte 1 32
byte 1 68
byte 1 82
byte 1 79
byte 1 80
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 96
byte 1 32
byte 1 68
byte 1 82
byte 1 79
byte 1 80
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 96
byte 1 32
byte 1 68
byte 1 82
byte 1 79
byte 1 80
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 97
byte 1 115
byte 1 96
byte 1 32
byte 1 68
byte 1 82
byte 1 79
byte 1 80
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 99
byte 1 108
byte 1 105
byte 1 109
byte 1 98
byte 1 96
byte 1 32
byte 1 68
byte 1 82
byte 1 79
byte 1 80
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 106
byte 1 112
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 96
byte 1 32
byte 1 68
byte 1 82
byte 1 79
byte 1 80
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 80
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 96
byte 1 32
byte 1 68
byte 1 82
byte 1 79
byte 1 80
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 76
byte 1 111
byte 1 111
byte 1 112
byte 1 96
byte 1 32
byte 1 68
byte 1 82
byte 1 79
byte 1 80
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 59
byte 1 0
align 1
LABELV $2108
byte 1 67
byte 1 82
byte 1 69
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 40
byte 1 9
byte 1 9
byte 1 9
byte 1 105
byte 1 100
byte 1 32
byte 1 66
byte 1 73
byte 1 71
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 65
byte 1 85
byte 1 84
byte 1 79
byte 1 95
byte 1 73
byte 1 78
byte 1 67
byte 1 82
byte 1 69
byte 1 77
byte 1 69
byte 1 78
byte 1 84
byte 1 32
byte 1 80
byte 1 82
byte 1 73
byte 1 77
byte 1 65
byte 1 82
byte 1 89
byte 1 32
byte 1 75
byte 1 69
byte 1 89
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 32
byte 1 66
byte 1 73
byte 1 71
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 83
byte 1 73
byte 1 71
byte 1 78
byte 1 69
byte 1 68
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 86
byte 1 65
byte 1 82
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 40
byte 1 49
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 86
byte 1 65
byte 1 82
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 40
byte 1 49
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 85
byte 1 78
byte 1 83
byte 1 73
byte 1 71
byte 1 78
byte 1 69
byte 1 68
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 95
byte 1 116
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 85
byte 1 78
byte 1 83
byte 1 73
byte 1 71
byte 1 78
byte 1 69
byte 1 68
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 76
byte 1 101
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 85
byte 1 78
byte 1 83
byte 1 73
byte 1 71
byte 1 78
byte 1 69
byte 1 68
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 101
byte 1 110
byte 1 100
byte 1 76
byte 1 101
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 112
byte 1 111
byte 1 115
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 115
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 77
byte 1 115
byte 1 101
byte 1 99
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 67
byte 1 109
byte 1 100
byte 1 115
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 116
byte 1 111
byte 1 112
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 84
byte 1 97
byte 1 107
byte 1 101
byte 1 111
byte 1 102
byte 1 102
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 84
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 88
byte 1 89
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 83
byte 1 77
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 85
byte 1 78
byte 1 83
byte 1 73
byte 1 71
byte 1 78
byte 1 69
byte 1 68
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 32
byte 1 83
byte 1 77
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 83
byte 1 77
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 98
byte 1 117
byte 1 103
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 114
byte 1 97
byte 1 109
byte 1 112
byte 1 115
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 117
byte 1 99
byte 1 107
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 97
byte 1 115
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 99
byte 1 108
byte 1 105
byte 1 109
byte 1 98
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 106
byte 1 112
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 80
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 76
byte 1 111
byte 1 111
byte 1 112
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 114
byte 1 117
byte 1 110
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 68
byte 1 65
byte 1 84
byte 1 69
byte 1 84
byte 1 73
byte 1 77
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 114
byte 1 117
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 68
byte 1 65
byte 1 84
byte 1 69
byte 1 84
byte 1 73
byte 1 77
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 102
byte 1 112
byte 1 115
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 86
byte 1 65
byte 1 82
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 40
byte 1 50
byte 1 53
byte 1 53
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 86
byte 1 65
byte 1 82
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 40
byte 1 50
byte 1 53
byte 1 53
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 115
byte 1 101
byte 1 109
byte 1 105
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 86
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 104
byte 1 105
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 116
byte 1 109
byte 1 112
byte 1 82
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 116
byte 1 109
byte 1 112
byte 1 76
byte 1 66
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 85
byte 1 78
byte 1 73
byte 1 81
byte 1 85
byte 1 69
byte 1 32
byte 1 75
byte 1 69
byte 1 89
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 40
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 44
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 44
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 44
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 44
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 44
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 44
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 44
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 32
byte 1 40
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 41
byte 1 44
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 95
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 40
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 44
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 41
byte 1 44
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 40
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 41
byte 1 44
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 40
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 32
byte 1 40
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 40
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 40
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 32
byte 1 40
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 32
byte 1 40
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 40
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 98
byte 1 117
byte 1 103
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 98
byte 1 117
byte 1 103
byte 1 96
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 114
byte 1 97
byte 1 109
byte 1 112
byte 1 115
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 114
byte 1 97
byte 1 109
byte 1 112
byte 1 115
byte 1 96
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 117
byte 1 99
byte 1 107
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 117
byte 1 99
byte 1 107
byte 1 96
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 96
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 96
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 96
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 96
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 97
byte 1 115
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 97
byte 1 115
byte 1 96
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 99
byte 1 108
byte 1 105
byte 1 109
byte 1 98
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 99
byte 1 108
byte 1 105
byte 1 109
byte 1 98
byte 1 96
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 106
byte 1 112
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 106
byte 1 112
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 96
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 80
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 80
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 96
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 96
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 76
byte 1 111
byte 1 111
byte 1 112
byte 1 96
byte 1 32
byte 1 40
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 76
byte 1 111
byte 1 111
byte 1 112
byte 1 96
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 32
byte 1 40
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 40
byte 1 114
byte 1 117
byte 1 110
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 40
byte 1 114
byte 1 117
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 41
byte 1 44
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 32
byte 1 40
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 104
byte 1 105
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 32
byte 1 40
byte 1 104
byte 1 105
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 116
byte 1 109
byte 1 112
byte 1 82
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 40
byte 1 116
byte 1 109
byte 1 112
byte 1 82
byte 1 97
byte 1 110
byte 1 107
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 116
byte 1 109
byte 1 112
byte 1 76
byte 1 66
byte 1 32
byte 1 40
byte 1 116
byte 1 109
byte 1 112
byte 1 76
byte 1 66
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 108
byte 1 98
byte 1 82
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 40
byte 1 116
byte 1 109
byte 1 112
byte 1 76
byte 1 66
byte 1 44
byte 1 105
byte 1 95
byte 1 116
byte 1 109
byte 1 112
byte 1 82
byte 1 97
byte 1 110
byte 1 107
byte 1 41
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 40
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 44
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 44
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 44
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 44
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 41
byte 1 32
byte 1 41
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 98
byte 1 117
byte 1 103
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 114
byte 1 97
byte 1 109
byte 1 112
byte 1 115
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 117
byte 1 99
byte 1 107
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 115
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 97
byte 1 115
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 99
byte 1 108
byte 1 105
byte 1 109
byte 1 98
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 106
byte 1 112
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 80
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 65
byte 1 76
byte 1 84
byte 1 69
byte 1 82
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 67
byte 1 79
byte 1 76
byte 1 85
byte 1 77
byte 1 78
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 96
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 116
byte 1 105
byte 1 76
byte 1 111
byte 1 111
byte 1 112
byte 1 96
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 49
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 59
byte 1 0
align 1
LABELV $2106
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $2105
byte 1 67
byte 1 82
byte 1 69
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 40
byte 1 9
byte 1 9
byte 1 9
byte 1 96
byte 1 107
byte 1 101
byte 1 121
byte 1 96
byte 1 32
byte 1 86
byte 1 65
byte 1 82
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 40
byte 1 49
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 73
byte 1 110
byte 1 116
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 87
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 68
byte 1 65
byte 1 84
byte 1 69
byte 1 84
byte 1 73
byte 1 77
byte 1 69
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 86
byte 1 65
byte 1 82
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 40
byte 1 50
byte 1 53
byte 1 53
byte 1 41
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 80
byte 1 82
byte 1 73
byte 1 77
byte 1 65
byte 1 82
byte 1 89
byte 1 32
byte 1 75
byte 1 69
byte 1 89
byte 1 40
byte 1 96
byte 1 107
byte 1 101
byte 1 121
byte 1 96
byte 1 41
byte 1 41
byte 1 0
align 1
LABELV $2103
byte 1 109
byte 1 97
byte 1 112
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $2102
byte 1 67
byte 1 82
byte 1 69
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 40
byte 1 9
byte 1 9
byte 1 9
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 86
byte 1 65
byte 1 82
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 40
byte 1 49
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 32
byte 1 66
byte 1 73
byte 1 71
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 83
byte 1 73
byte 1 71
byte 1 78
byte 1 69
byte 1 68
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 83
byte 1 77
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 85
byte 1 78
byte 1 83
byte 1 73
byte 1 71
byte 1 78
byte 1 69
byte 1 68
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 80
byte 1 82
byte 1 73
byte 1 77
byte 1 65
byte 1 82
byte 1 89
byte 1 32
byte 1 75
byte 1 69
byte 1 89
byte 1 40
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 44
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 44
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 41
byte 1 41
byte 1 0
align 1
LABELV $2100
byte 1 109
byte 1 97
byte 1 112
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2099
byte 1 67
byte 1 82
byte 1 69
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 40
byte 1 9
byte 1 9
byte 1 9
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 86
byte 1 65
byte 1 82
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 40
byte 1 49
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 86
byte 1 65
byte 1 82
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 40
byte 1 49
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 32
byte 1 83
byte 1 77
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 9
byte 1 9
byte 1 9
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 83
byte 1 77
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 9
byte 1 9
byte 1 9
byte 1 114
byte 1 117
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 9
byte 1 9
byte 1 9
byte 1 80
byte 1 82
byte 1 73
byte 1 77
byte 1 65
byte 1 82
byte 1 89
byte 1 32
byte 1 75
byte 1 69
byte 1 89
byte 1 40
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 44
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 41
byte 1 41
byte 1 0
align 1
LABELV $2097
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2096
byte 1 67
byte 1 82
byte 1 69
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 40
byte 1 105
byte 1 100
byte 1 32
byte 1 66
byte 1 73
byte 1 71
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 65
byte 1 85
byte 1 84
byte 1 79
byte 1 95
byte 1 73
byte 1 78
byte 1 67
byte 1 82
byte 1 69
byte 1 77
byte 1 69
byte 1 78
byte 1 84
byte 1 32
byte 1 80
byte 1 82
byte 1 73
byte 1 77
byte 1 65
byte 1 82
byte 1 89
byte 1 32
byte 1 75
byte 1 69
byte 1 89
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 32
byte 1 66
byte 1 73
byte 1 71
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 83
byte 1 73
byte 1 71
byte 1 78
byte 1 69
byte 1 68
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 86
byte 1 65
byte 1 82
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 40
byte 1 49
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 83
byte 1 77
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 68
byte 1 65
byte 1 84
byte 1 69
byte 1 84
byte 1 73
byte 1 77
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 32
byte 1 83
byte 1 77
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 101
byte 1 120
byte 1 116
byte 1 114
byte 1 97
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 49
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 44
byte 1 101
byte 1 120
byte 1 116
byte 1 114
byte 1 97
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 50
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 44
byte 1 101
byte 1 120
byte 1 116
byte 1 114
byte 1 97
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 51
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 69
byte 1 71
byte 1 69
byte 1 82
byte 1 44
byte 1 101
byte 1 120
byte 1 116
byte 1 114
byte 1 97
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 52
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 69
byte 1 71
byte 1 69
byte 1 82
byte 1 44
byte 1 32
byte 1 85
byte 1 78
byte 1 73
byte 1 81
byte 1 85
byte 1 69
byte 1 32
byte 1 75
byte 1 69
byte 1 89
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 40
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 44
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 41
byte 1 44
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 40
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 41
byte 1 41
byte 1 0
align 1
LABELV $2094
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2093
byte 1 67
byte 1 82
byte 1 69
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 40
byte 1 105
byte 1 100
byte 1 32
byte 1 66
byte 1 73
byte 1 71
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 65
byte 1 85
byte 1 84
byte 1 79
byte 1 95
byte 1 73
byte 1 78
byte 1 67
byte 1 82
byte 1 69
byte 1 77
byte 1 69
byte 1 78
byte 1 84
byte 1 32
byte 1 80
byte 1 82
byte 1 73
byte 1 77
byte 1 65
byte 1 82
byte 1 89
byte 1 32
byte 1 75
byte 1 69
byte 1 89
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 32
byte 1 66
byte 1 73
byte 1 71
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 83
byte 1 73
byte 1 71
byte 1 78
byte 1 69
byte 1 68
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 86
byte 1 65
byte 1 82
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 40
byte 1 49
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 84
byte 1 73
byte 1 78
byte 1 89
byte 1 73
byte 1 78
byte 1 84
byte 1 40
byte 1 50
byte 1 41
byte 1 32
byte 1 83
byte 1 73
byte 1 71
byte 1 78
byte 1 69
byte 1 68
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 120
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 121
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 122
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 32
byte 1 68
byte 1 79
byte 1 85
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 85
byte 1 78
byte 1 73
byte 1 81
byte 1 85
byte 1 69
byte 1 32
byte 1 75
byte 1 69
byte 1 89
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 95
byte 1 117
byte 1 110
byte 1 105
byte 1 113
byte 1 117
byte 1 101
byte 1 32
byte 1 40
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 44
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 44
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 41
byte 1 44
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 40
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 44
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 41
byte 1 44
byte 1 32
byte 1 73
byte 1 78
byte 1 68
byte 1 69
byte 1 88
byte 1 32
byte 1 105
byte 1 95
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 40
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 41
byte 1 41
byte 1 0
align 1
LABELV $2091
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2090
byte 1 67
byte 1 82
byte 1 69
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 73
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 69
byte 1 88
byte 1 73
byte 1 83
byte 1 84
byte 1 83
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 115
byte 1 40
byte 1 105
byte 1 100
byte 1 32
byte 1 66
byte 1 73
byte 1 71
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 65
byte 1 85
byte 1 84
byte 1 79
byte 1 95
byte 1 73
byte 1 78
byte 1 67
byte 1 82
byte 1 69
byte 1 77
byte 1 69
byte 1 78
byte 1 84
byte 1 32
byte 1 80
byte 1 82
byte 1 73
byte 1 77
byte 1 65
byte 1 82
byte 1 89
byte 1 32
byte 1 75
byte 1 69
byte 1 89
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 86
byte 1 65
byte 1 82
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 85
byte 1 78
byte 1 73
byte 1 81
byte 1 85
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 86
byte 1 65
byte 1 82
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 40
byte 1 54
byte 1 52
byte 1 41
byte 1 32
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 108
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 68
byte 1 65
byte 1 84
byte 1 69
byte 1 84
byte 1 73
byte 1 77
byte 1 69
byte 1 44
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 68
byte 1 65
byte 1 84
byte 1 69
byte 1 84
byte 1 73
byte 1 77
byte 1 69
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 44
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 105
byte 1 112
byte 1 32
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 85
byte 1 78
byte 1 83
byte 1 73
byte 1 71
byte 1 78
byte 1 69
byte 1 68
byte 1 44
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 32
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 32
byte 1 85
byte 1 78
byte 1 83
byte 1 73
byte 1 71
byte 1 78
byte 1 69
byte 1 68
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 32
byte 1 48
byte 1 41
byte 1 0
align 1
LABELV $2088
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 68
byte 1 66
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2087
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 120
byte 1 44
byte 1 121
byte 1 44
byte 1 122
byte 1 44
byte 1 121
byte 1 97
byte 1 119
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 61
byte 1 63
byte 1 32
byte 1 65
byte 1 78
byte 1 68
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 61
byte 1 63
byte 1 32
byte 1 79
byte 1 82
byte 1 68
byte 1 69
byte 1 82
byte 1 32
byte 1 66
byte 1 89
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 65
byte 1 83
byte 1 67
byte 1 0
align 1
LABELV $2082
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2079
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 68
byte 1 66
byte 1 32
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2070
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 68
byte 1 66
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2065
byte 1 44
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2060
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2057
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2054
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 68
byte 1 66
byte 1 32
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2018
byte 1 68
byte 1 66
byte 1 32
byte 1 82
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2014
byte 1 68
byte 1 66
byte 1 32
byte 1 82
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2002
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 98
byte 1 99
byte 1 114
byte 1 121
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 68
byte 1 66
byte 1 32
byte 1 65
byte 1 80
byte 1 73
byte 1 32
byte 1 40
byte 1 110
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 119
byte 1 41
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1993
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 98
byte 1 99
byte 1 114
byte 1 121
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 68
byte 1 66
byte 1 32
byte 1 65
byte 1 80
byte 1 73
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1985
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 80
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 98
byte 1 99
byte 1 114
byte 1 121
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1981
byte 1 94
byte 1 49
byte 1 98
byte 1 99
byte 1 114
byte 1 121
byte 1 112
byte 1 116
byte 1 32
byte 1 115
byte 1 117
byte 1 99
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 40
byte 1 35
byte 1 50
byte 1 41
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1974
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 110
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 117
byte 1 99
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 102
byte 1 117
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1973
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 110
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1968
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 117
byte 1 99
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 102
byte 1 117
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1967
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1961
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 45
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1957
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 45
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 46
byte 1 32
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 44
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1951
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 68
byte 1 66
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 87
byte 1 84
byte 1 70
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1948
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 68
byte 1 66
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 87
byte 1 84
byte 1 70
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1937
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1934
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1926
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1923
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1913
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1906
byte 1 85
byte 1 80
byte 1 68
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 108
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 61
byte 1 78
byte 1 79
byte 1 87
byte 1 40
byte 1 41
byte 1 32
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 105
byte 1 100
byte 1 61
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1905
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 83
byte 1 117
byte 1 99
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 121
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1904
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 76
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1901
byte 1 94
byte 1 49
byte 1 76
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 40
byte 1 35
byte 1 50
byte 1 41
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1890
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1885
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1879
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1875
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1863
byte 1 94
byte 1 49
byte 1 67
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 102
byte 1 117
byte 1 108
byte 1 46
byte 1 32
byte 1 82
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 112
byte 1 98
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1858
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1854
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1849
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1827
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 37
byte 1 45
byte 1 51
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 32
byte 1 94
byte 1 51
byte 1 37
byte 1 52
byte 1 46
byte 1 50
byte 1 102
byte 1 94
byte 1 55
byte 1 117
byte 1 112
byte 1 115
byte 1 32
byte 1 94
byte 1 51
byte 1 37
byte 1 54
byte 1 115
byte 1 94
byte 1 55
byte 1 102
byte 1 112
byte 1 115
byte 1 32
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 111
byte 1 110
byte 1 32
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1825
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 89
byte 1 77
byte 1 80
byte 1 73
byte 1 67
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $1810
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 83
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1806
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 83
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1801
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1791
byte 1 94
byte 1 55
byte 1 91
byte 1 94
byte 1 50
byte 1 37
byte 1 48
byte 1 51
byte 1 105
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 52
byte 1 115
byte 1 0
align 1
LABELV $1787
byte 1 60
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 62
byte 1 0
align 1
LABELV $1779
byte 1 94
byte 1 50
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 94
byte 1 55
byte 1 73
byte 1 78
byte 1 83
byte 1 84
byte 1 65
byte 1 76
byte 1 76
byte 1 69
byte 1 68
byte 1 32
byte 1 77
byte 1 65
byte 1 80
byte 1 83
byte 1 32
byte 1 40
byte 1 85
byte 1 78
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 68
byte 1 41
byte 1 94
byte 1 50
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $1778
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 85
byte 1 110
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1774
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 85
byte 1 110
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1769
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 117
byte 1 110
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1755
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 37
byte 1 99
byte 1 37
byte 1 102
byte 1 47
byte 1 49
byte 1 48
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1750
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1748
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 71
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1744
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 71
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1739
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1725
byte 1 32
byte 1 94
byte 1 51
byte 1 78
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $1716
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 46
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 94
byte 1 37
byte 1 99
byte 1 37
byte 1 102
byte 1 47
byte 1 49
byte 1 48
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1714
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 82
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1710
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 82
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1705
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1690
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 35
byte 1 37
byte 1 45
byte 1 51
byte 1 100
byte 1 32
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 52
byte 1 100
byte 1 32
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1676
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 97
byte 1 110
byte 1 107
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1675
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 82
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1671
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 82
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1666
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1661
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 77
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 100
byte 1 105
byte 1 102
byte 1 102
byte 1 105
byte 1 99
byte 1 117
byte 1 108
byte 1 116
byte 1 121
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 101
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 109
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1655
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1651
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1647
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1615
byte 1 77
byte 1 89
byte 1 82
byte 1 65
byte 1 84
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $1614
byte 1 80
byte 1 82
byte 1 65
byte 1 84
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $1612
byte 1 84
byte 1 79
byte 1 80
byte 1 82
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $1611
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 37
byte 1 99
byte 1 37
byte 1 53
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 55
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 55
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 55
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 57
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 56
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1591
byte 1 37
byte 1 46
byte 1 52
byte 1 102
byte 1 0
align 1
LABELV $1590
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 67
byte 1 79
byte 1 85
byte 1 78
byte 1 84
byte 1 0
align 1
LABELV $1589
byte 1 82
byte 1 65
byte 1 84
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $1588
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 37
byte 1 99
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1576
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $1575
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 37
byte 1 99
byte 1 37
byte 1 55
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 55
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1563
byte 1 37
byte 1 46
byte 1 51
byte 1 102
byte 1 0
align 1
LABELV $1562
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 37
byte 1 99
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 49
byte 1 49
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 55
byte 1 100
byte 1 32
byte 1 37
byte 1 45
byte 1 55
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1561
byte 1 83
byte 1 65
byte 1 77
byte 1 80
byte 1 76
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $1560
byte 1 68
byte 1 73
byte 1 70
byte 1 70
byte 1 73
byte 1 67
byte 1 85
byte 1 76
byte 1 84
byte 1 89
byte 1 0
align 1
LABELV $1559
byte 1 66
byte 1 69
byte 1 83
byte 1 84
byte 1 0
align 1
LABELV $1558
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 37
byte 1 99
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 49
byte 1 49
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 55
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 55
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1544
byte 1 45
byte 1 0
align 1
LABELV $1543
byte 1 77
byte 1 65
byte 1 80
byte 1 78
byte 1 85
byte 1 77
byte 1 0
align 1
LABELV $1542
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 37
byte 1 99
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 55
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1517
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 100
byte 1 111
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 87
byte 1 82
byte 1 32
byte 1 111
byte 1 110
byte 1 58
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1509
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $1501
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 87
byte 1 82
byte 1 32
byte 1 111
byte 1 110
byte 1 58
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1484
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 111
byte 1 112
byte 1 32
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 40
byte 1 48
byte 1 45
byte 1 49
byte 1 48
byte 1 41
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 41
byte 1 58
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1475
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 41
byte 1 58
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1466
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 69
byte 1 97
byte 1 115
byte 1 105
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 41
byte 1 58
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1457
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 41
byte 1 58
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1448
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 99
byte 1 108
byte 1 117
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 47
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 41
byte 1 58
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1439
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 76
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 99
byte 1 108
byte 1 117
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 47
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 41
byte 1 58
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1435
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 83
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 47
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1431
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 83
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 47
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1426
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 47
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1421
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1420
byte 1 82
byte 1 69
byte 1 80
byte 1 76
byte 1 65
byte 1 67
byte 1 69
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 79
byte 1 32
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 32
byte 1 40
byte 1 96
byte 1 107
byte 1 101
byte 1 121
byte 1 96
byte 1 44
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 87
byte 1 104
byte 1 101
byte 1 110
byte 1 41
byte 1 32
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 83
byte 1 32
byte 1 40
byte 1 39
byte 1 114
byte 1 97
byte 1 110
byte 1 107
byte 1 85
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 76
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 39
byte 1 44
byte 1 63
byte 1 41
byte 1 0
align 1
LABELV $1403
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1391
byte 1 82
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $1380
byte 1 94
byte 1 49
byte 1 82
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1377
byte 1 94
byte 1 49
byte 1 82
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1373
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1368
byte 1 94
byte 1 51
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1360
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 94
byte 1 50
byte 1 47
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1359
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 87
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 44
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 94
byte 1 50
byte 1 47
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1355
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 94
byte 1 50
byte 1 47
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 94
byte 1 55
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1351
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 94
byte 1 50
byte 1 47
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 94
byte 1 55
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1347
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 94
byte 1 50
byte 1 47
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 94
byte 1 55
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1342
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1325
byte 1 35
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1315
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 0
align 1
LABELV $1314
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 37
byte 1 99
byte 1 37
byte 1 49
byte 1 50
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 55
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 51
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 52
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 52
byte 1 100
byte 1 32
byte 1 37
byte 1 45
byte 1 52
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1313
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 0
align 1
LABELV $1312
byte 1 94
byte 1 49
byte 1 33
byte 1 94
byte 1 37
byte 1 99
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 94
byte 1 49
byte 1 33
byte 1 94
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $1293
byte 1 82
byte 1 85
byte 1 78
byte 1 70
byte 1 76
byte 1 65
byte 1 71
byte 1 83
byte 1 0
align 1
LABELV $1292
byte 1 77
byte 1 65
byte 1 80
byte 1 47
byte 1 67
byte 1 79
byte 1 85
byte 1 82
byte 1 83
byte 1 69
byte 1 0
align 1
LABELV $1291
byte 1 84
byte 1 73
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $1290
byte 1 82
byte 1 65
byte 1 78
byte 1 75
byte 1 0
align 1
LABELV $1289
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 0
align 1
LABELV $1288
byte 1 70
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $1287
byte 1 68
byte 1 65
byte 1 84
byte 1 69
byte 1 0
align 1
LABELV $1286
byte 1 85
byte 1 83
byte 1 69
byte 1 82
byte 1 78
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $1285
byte 1 83
byte 1 84
byte 1 89
byte 1 76
byte 1 69
byte 1 0
align 1
LABELV $1284
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 37
byte 1 99
byte 1 37
byte 1 49
byte 1 50
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 55
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 51
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 52
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 52
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 52
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1278
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 76
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 58
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1277
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 76
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 58
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1272
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 97
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1266
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 76
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1262
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 76
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1257
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1232
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 0
align 1
LABELV $1228
byte 1 94
byte 1 37
byte 1 99
byte 1 83
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1225
byte 1 94
byte 1 55
byte 1 82
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $1221
byte 1 94
byte 1 49
byte 1 82
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1218
byte 1 94
byte 1 49
byte 1 82
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1214
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1206
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 10
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 97
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 50
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 115
byte 1 32
byte 1 94
byte 1 69
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 115
byte 1 32
byte 1 94
byte 1 49
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 115
byte 1 32
byte 1 94
byte 1 106
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 115
byte 1 10
byte 1 94
byte 1 55
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 44
byte 1 32
byte 1 115
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 94
byte 1 99
byte 1 47
byte 1 116
byte 1 111
byte 1 112
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1204
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 99
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 99
byte 1 47
byte 1 116
byte 1 111
byte 1 112
byte 1 109
byte 1 97
byte 1 105
byte 1 110
byte 1 94
byte 1 55
byte 1 44
byte 1 32
byte 1 94
byte 1 99
byte 1 47
byte 1 116
byte 1 111
byte 1 112
byte 1 110
byte 1 111
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 98
byte 1 117
byte 1 103
byte 1 94
byte 1 55
byte 1 44
byte 1 32
byte 1 94
byte 1 99
byte 1 47
byte 1 116
byte 1 111
byte 1 112
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 94
byte 1 55
byte 1 44
byte 1 32
byte 1 94
byte 1 99
byte 1 47
byte 1 116
byte 1 111
byte 1 112
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 94
byte 1 55
byte 1 44
byte 1 32
byte 1 94
byte 1 99
byte 1 47
byte 1 116
byte 1 111
byte 1 112
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1202
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 47
byte 1 84
byte 1 65
byte 1 83
byte 1 43
byte 1 115
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1201
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 47
byte 1 84
byte 1 65
byte 1 83
byte 1 0
align 1
LABELV $1200
byte 1 99
byte 1 108
byte 1 105
byte 1 109
byte 1 98
byte 1 116
byte 1 101
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $1199
byte 1 109
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 116
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $1198
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 10
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 97
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 50
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 115
byte 1 32
byte 1 94
byte 1 69
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 115
byte 1 32
byte 1 94
byte 1 49
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 115
byte 1 32
byte 1 94
byte 1 106
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 115
byte 1 10
byte 1 94
byte 1 55
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 115
byte 1 44
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 99
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1021
byte 1 37
byte 1 51
byte 1 49
byte 1 115
byte 1 94
byte 1 104
byte 1 124
byte 1 37
byte 1 51
byte 1 50
byte 1 115
byte 1 94
byte 1 104
byte 1 124
byte 1 37
byte 1 51
byte 1 54
byte 1 115
byte 1 94
byte 1 104
byte 1 124
byte 1 37
byte 1 51
byte 1 50
byte 1 115
byte 1 94
byte 1 104
byte 1 124
byte 1 37
byte 1 51
byte 1 50
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1020
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 94
byte 1 74
byte 1 37
byte 1 99
byte 1 37
byte 1 48
byte 1 50
byte 1 115
byte 1 94
byte 1 37
byte 1 99
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 94
byte 1 99
byte 1 37
byte 1 52
byte 1 115
byte 1 32
byte 1 94
byte 1 117
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 94
byte 1 104
byte 1 124
byte 1 32
byte 1 94
byte 1 74
byte 1 37
byte 1 99
byte 1 37
byte 1 48
byte 1 50
byte 1 115
byte 1 94
byte 1 37
byte 1 99
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 94
byte 1 99
byte 1 37
byte 1 52
byte 1 115
byte 1 32
byte 1 94
byte 1 117
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 94
byte 1 104
byte 1 124
byte 1 32
byte 1 94
byte 1 74
byte 1 37
byte 1 99
byte 1 37
byte 1 48
byte 1 50
byte 1 115
byte 1 94
byte 1 37
byte 1 99
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 94
byte 1 99
byte 1 37
byte 1 52
byte 1 115
byte 1 32
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 117
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 94
byte 1 104
byte 1 124
byte 1 32
byte 1 94
byte 1 74
byte 1 37
byte 1 99
byte 1 37
byte 1 48
byte 1 50
byte 1 115
byte 1 94
byte 1 37
byte 1 99
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 94
byte 1 99
byte 1 37
byte 1 52
byte 1 115
byte 1 32
byte 1 94
byte 1 117
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 94
byte 1 104
byte 1 124
byte 1 32
byte 1 94
byte 1 74
byte 1 37
byte 1 99
byte 1 37
byte 1 48
byte 1 50
byte 1 115
byte 1 94
byte 1 37
byte 1 99
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 94
byte 1 99
byte 1 37
byte 1 52
byte 1 115
byte 1 32
byte 1 94
byte 1 117
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $916
byte 1 40
byte 1 37
byte 1 100
byte 1 83
byte 1 80
byte 1 47
byte 1 37
byte 1 100
byte 1 82
byte 1 80
byte 1 47
byte 1 37
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $899
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 94
byte 1 74
byte 1 37
byte 1 99
byte 1 37
byte 1 48
byte 1 50
byte 1 115
byte 1 94
byte 1 37
byte 1 99
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 94
byte 1 99
byte 1 37
byte 1 52
byte 1 115
byte 1 32
byte 1 94
byte 1 117
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 32
byte 1 94
byte 1 99
byte 1 37
byte 1 49
byte 1 49
byte 1 115
byte 1 32
byte 1 32
byte 1 37
byte 1 49
byte 1 49
byte 1 115
byte 1 32
byte 1 32
byte 1 37
byte 1 49
byte 1 49
byte 1 115
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 94
byte 1 99
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $854
byte 1 32
byte 1 102
byte 1 112
byte 1 115
byte 1 58
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $844
byte 1 37
byte 1 45
byte 1 50
byte 1 100
byte 1 0
align 1
LABELV $831
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 94
byte 1 74
byte 1 37
byte 1 99
byte 1 37
byte 1 48
byte 1 50
byte 1 115
byte 1 94
byte 1 37
byte 1 99
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 94
byte 1 99
byte 1 37
byte 1 52
byte 1 115
byte 1 32
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 117
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 32
byte 1 94
byte 1 99
byte 1 37
byte 1 49
byte 1 49
byte 1 115
byte 1 32
byte 1 32
byte 1 37
byte 1 49
byte 1 49
byte 1 115
byte 1 32
byte 1 32
byte 1 37
byte 1 49
byte 1 49
byte 1 115
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 94
byte 1 99
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $749
byte 1 37
byte 1 100
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $747
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $745
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 97
byte 1 118
byte 1 103
byte 1 0
align 1
LABELV $739
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 0
align 1
LABELV $738
byte 1 102
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $737
byte 1 116
byte 1 111
byte 1 103
byte 1 108
byte 1 0
align 1
LABELV $732
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $731
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $728
byte 1 10
byte 1 0
align 1
LABELV $727
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 94
byte 1 74
byte 1 37
byte 1 99
byte 1 37
byte 1 48
byte 1 50
byte 1 115
byte 1 94
byte 1 37
byte 1 99
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 94
byte 1 99
byte 1 37
byte 1 52
byte 1 115
byte 1 32
byte 1 94
byte 1 117
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 32
byte 1 32
byte 1 94
byte 1 99
byte 1 37
byte 1 49
byte 1 49
byte 1 115
byte 1 32
byte 1 32
byte 1 37
byte 1 49
byte 1 49
byte 1 115
byte 1 32
byte 1 32
byte 1 37
byte 1 49
byte 1 49
byte 1 115
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $710
byte 1 67
byte 1 72
byte 1 69
byte 1 65
byte 1 84
byte 1 0
align 1
LABELV $709
byte 1 83
byte 1 69
byte 1 71
byte 1 77
byte 1 69
byte 1 78
byte 1 84
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $708
byte 1 67
byte 1 85
byte 1 83
byte 1 84
byte 1 79
byte 1 77
byte 1 0
align 1
LABELV $707
byte 1 78
byte 1 79
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 66
byte 1 85
byte 1 71
byte 1 0
align 1
LABELV $706
byte 1 77
byte 1 65
byte 1 73
byte 1 78
byte 1 0
align 1
LABELV $705
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 55
byte 1 115
byte 1 94
byte 1 104
byte 1 124
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 94
byte 1 50
byte 1 37
byte 1 45
byte 1 50
byte 1 55
byte 1 115
byte 1 94
byte 1 104
byte 1 124
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 94
byte 1 50
byte 1 37
byte 1 45
byte 1 51
byte 1 49
byte 1 115
byte 1 94
byte 1 104
byte 1 124
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 94
byte 1 50
byte 1 37
byte 1 45
byte 1 50
byte 1 55
byte 1 115
byte 1 94
byte 1 104
byte 1 124
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 94
byte 1 50
byte 1 37
byte 1 45
byte 1 50
byte 1 57
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $702
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 55
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $677
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 33
byte 1 0
align 1
LABELV $650
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $647
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 32
byte 1 83
byte 1 84
byte 1 89
byte 1 76
byte 1 69
byte 1 0
align 1
LABELV $644
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 66
byte 1 84
byte 1 111
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $642
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 76
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $638
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 76
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $633
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $627
byte 1 85
byte 1 76
byte 1 0
align 1
LABELV $626
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $625
byte 1 48
byte 1 57
byte 1 0
align 1
LABELV $624
byte 1 48
byte 1 56
byte 1 0
align 1
LABELV $623
byte 1 48
byte 1 55
byte 1 0
align 1
LABELV $622
byte 1 48
byte 1 54
byte 1 0
align 1
LABELV $621
byte 1 48
byte 1 53
byte 1 0
align 1
LABELV $620
byte 1 48
byte 1 52
byte 1 0
align 1
LABELV $619
byte 1 48
byte 1 51
byte 1 0
align 1
LABELV $618
byte 1 48
byte 1 50
byte 1 0
align 1
LABELV $617
byte 1 48
byte 1 49
byte 1 0
align 1
LABELV $616
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 78
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $609
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 83
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $606
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 83
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $603
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 65
byte 1 108
byte 1 108
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $597
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 78
byte 1 111
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $591
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $587
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 40
byte 1 100
byte 1 105
byte 1 102
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $580
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $576
byte 1 45
byte 1 62
byte 1 0
align 1
LABELV $575
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 100
byte 1 105
byte 1 102
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $547
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 115
byte 1 58
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $546
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 83
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $543
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 83
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $539
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 112
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $532
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 37
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $531
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 46
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $523
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $520
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $516
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $511
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 37
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 44
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $506
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $503
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $499
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $493
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $484
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 59
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $481
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 59
byte 1 32
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 63
byte 1 33
byte 1 63
byte 1 33
byte 1 33
byte 1 63
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $480
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 59
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 40
byte 1 63
byte 1 41
byte 1 46
byte 1 32
byte 1 82
byte 1 101
byte 1 116
byte 1 114
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $472
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $467
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $461
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $460
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $457
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $453
byte 1 94
byte 1 49
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $447
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 119
byte 1 32
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 94
byte 1 50
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 94
byte 1 55
byte 1 117
byte 1 112
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $440
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 110
byte 1 111
byte 1 102
byte 1 102
byte 1 105
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 108
byte 1 121
byte 1 32
byte 1 98
byte 1 101
byte 1 97
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 94
byte 1 51
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 94
byte 1 55
byte 1 117
byte 1 112
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $417
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 83
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $414
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 83
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $410
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $399
byte 1 115
byte 1 118
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 115
byte 1 104
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 115
byte 1 104
byte 1 37
byte 1 100
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $395
byte 1 115
byte 1 118
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $369
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 87
byte 1 84
byte 1 70
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $354
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 87
byte 1 84
byte 1 70
byte 1 32
byte 1 78
byte 1 79
byte 1 32
byte 1 77
byte 1 79
byte 1 82
byte 1 69
byte 1 32
byte 1 82
byte 1 69
byte 1 83
byte 1 85
byte 1 76
byte 1 84
byte 1 83
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $349
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 82
byte 1 117
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $346
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 82
byte 1 117
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $342
byte 1 94
byte 1 49
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $334
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 45
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 45
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $330
byte 1 0
align 1
LABELV $329
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $328
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 115
byte 1 47
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 45
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $318
byte 1 49
byte 1 124
byte 1 37
byte 1 115
byte 1 124
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $315
byte 1 36
byte 1 50
byte 1 98
byte 1 36
byte 1 48
byte 1 54
byte 1 36
byte 1 56
byte 1 53
byte 1 74
byte 1 102
byte 1 110
byte 1 47
byte 1 53
byte 1 81
byte 1 97
byte 1 120
byte 1 112
byte 1 70
byte 1 104
byte 1 88
byte 1 113
byte 1 120
byte 1 121
byte 1 73
byte 1 117
byte 1 102
byte 1 103
byte 1 52
byte 1 0
align 1
LABELV $314
byte 1 50
byte 1 124
byte 1 37
byte 1 115
byte 1 124
byte 1 37
byte 1 115
byte 1 124
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $308
byte 1 94
byte 1 49
byte 1 87
byte 1 84
byte 1 70
byte 1 32
byte 1 67
byte 1 79
byte 1 85
byte 1 76
byte 1 68
byte 1 78
byte 1 39
byte 1 84
byte 1 32
byte 1 71
byte 1 82
byte 1 65
byte 1 66
byte 1 32
byte 1 85
byte 1 83
byte 1 69
byte 1 82
byte 1 78
byte 1 65
byte 1 77
byte 1 69
byte 1 44
byte 1 32
byte 1 83
byte 1 72
byte 1 79
byte 1 85
byte 1 76
byte 1 68
byte 1 78
byte 1 39
byte 1 84
byte 1 32
byte 1 72
byte 1 65
byte 1 80
byte 1 80
byte 1 69
byte 1 78
byte 1 33
byte 1 33
byte 1 33
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $307
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 87
byte 1 84
byte 1 70
byte 1 32
byte 1 67
byte 1 79
byte 1 85
byte 1 76
byte 1 68
byte 1 78
byte 1 39
byte 1 84
byte 1 32
byte 1 71
byte 1 82
byte 1 65
byte 1 66
byte 1 32
byte 1 85
byte 1 83
byte 1 69
byte 1 82
byte 1 78
byte 1 65
byte 1 77
byte 1 69
byte 1 44
byte 1 32
byte 1 83
byte 1 72
byte 1 79
byte 1 85
byte 1 76
byte 1 68
byte 1 78
byte 1 39
byte 1 84
byte 1 32
byte 1 72
byte 1 65
byte 1 80
byte 1 80
byte 1 69
byte 1 78
byte 1 33
byte 1 33
byte 1 33
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $301
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 76
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $295
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 76
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $291
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 76
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $287
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 76
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $282
byte 1 94
byte 1 49
byte 1 76
byte 1 111
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $271
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 46
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 110
byte 1 111
byte 1 119
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $269
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $265
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $253
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 117
byte 1 99
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 102
byte 1 117
byte 1 108
byte 1 46
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 110
byte 1 111
byte 1 119
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $251
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $247
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 65
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $243
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 108
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $232
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 80
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 110
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $231
byte 1 85
byte 1 80
byte 1 68
byte 1 65
byte 1 84
byte 1 69
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 61
byte 1 63
byte 1 32
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 105
byte 1 100
byte 1 61
byte 1 63
byte 1 0
align 1
LABELV $228
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 80
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $225
byte 1 94
byte 1 49
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $221
byte 1 73
byte 1 78
byte 1 83
byte 1 69
byte 1 82
byte 1 84
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 79
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 40
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 44
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 41
byte 1 32
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 83
byte 1 32
byte 1 40
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 44
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 44
byte 1 78
byte 1 79
byte 1 87
byte 1 40
byte 1 41
byte 1 41
byte 1 0
align 1
LABELV $220
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 40
byte 1 69
byte 1 115
byte 1 99
byte 1 97
byte 1 112
byte 1 101
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 41
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $214
byte 1 73
byte 1 78
byte 1 83
byte 1 69
byte 1 82
byte 1 84
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 79
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 40
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 44
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 41
byte 1 32
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 83
byte 1 32
byte 1 40
byte 1 63
byte 1 44
byte 1 63
byte 1 44
byte 1 78
byte 1 79
byte 1 87
byte 1 40
byte 1 41
byte 1 41
byte 1 0
align 1
LABELV $211
byte 1 94
byte 1 49
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $207
byte 1 94
byte 1 50
byte 1 37
byte 1 100
byte 1 32
byte 1 94
byte 1 55
byte 1 91
byte 1 37
byte 1 115
byte 1 93
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $203
byte 1 94
byte 1 50
byte 1 82
byte 1 101
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $202
byte 1 71
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $196
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 104
byte 1 111
byte 1 115
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 101
byte 1 99
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $187
byte 1 67
byte 1 76
byte 1 79
byte 1 67
byte 1 75
byte 1 36
byte 1 0
align 1
LABELV $186
byte 1 76
byte 1 80
byte 1 84
byte 1 0
align 1
LABELV $185
byte 1 67
byte 1 79
byte 1 77
byte 1 0
align 1
LABELV $184
byte 1 78
byte 1 85
byte 1 76
byte 1 0
align 1
LABELV $183
byte 1 65
byte 1 85
byte 1 88
byte 1 0
align 1
LABELV $182
byte 1 80
byte 1 82
byte 1 78
byte 1 0
align 1
LABELV $181
byte 1 67
byte 1 79
byte 1 78
byte 1 0
align 1
LABELV $178
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 100
byte 1 111
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $172
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 67
byte 1 104
byte 1 111
byte 1 115
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 97
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 65
byte 1 45
byte 1 90
byte 1 32
byte 1 97
byte 1 45
byte 1 122
byte 1 32
byte 1 48
byte 1 45
byte 1 57
byte 1 32
byte 1 95
byte 1 45
byte 1 91
byte 1 93
byte 1 40
byte 1 41
byte 1 61
byte 1 59
byte 1 43
byte 1 64
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $149
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 45
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 32
byte 1 100
byte 1 111
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $143
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 67
byte 1 104
byte 1 111
byte 1 115
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 77
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $138
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 67
byte 1 104
byte 1 111
byte 1 115
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 46
byte 1 32
byte 1 77
byte 1 105
byte 1 110
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $132
byte 1 68
byte 1 66
byte 1 95
byte 1 86
byte 1 101
byte 1 114
byte 1 105
byte 1 102
byte 1 121
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $129
byte 1 68
byte 1 66
byte 1 95
byte 1 86
byte 1 101
byte 1 114
byte 1 105
byte 1 102
byte 1 121
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $126
byte 1 68
byte 1 66
byte 1 95
byte 1 86
byte 1 101
byte 1 114
byte 1 105
byte 1 102
byte 1 121
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 46
byte 1 10
byte 1 0
