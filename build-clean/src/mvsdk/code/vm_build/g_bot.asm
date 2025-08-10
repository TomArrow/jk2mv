data
export g_botInfosHashTable
align 4
LABELV g_botInfosHashTable
byte 4 0
skip 4092
export g_arenaInfosHashTable
align 4
LABELV g_arenaInfosHashTable
byte 4 0
skip 4092
export g_blacklistedMapsHashTable
align 4
LABELV g_blacklistedMapsHashTable
byte 4 0
skip 4092
export trap_Cvar_VariableValue
code
proc trap_Cvar_VariableValue 132 12
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_bot.c"
line 40
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_bot.c
;4:
;5:#include "g_local.h"
;6:
;7:
;8:static int		g_numBots;
;9:infoHashed_t	g_botInfosHashed[MAX_BOTS];
;10:infoHashed_t*	g_botInfosHashTable[INFO_HASH_SIZE] = {NULL};
;11:
;12:int					g_numArenas;
;13:infoHashed_t		g_arenaInfosHashed[MAX_ARENAS];
;14:infoHashed_t*		g_arenaInfosHashTable[INFO_HASH_SIZE] = { NULL };
;15:
;16:int					g_numBlacklistedMaps;
;17:infoHashed_t		g_blacklistedMaps[MAX_ARENAS];
;18:infoHashed_t*		g_blacklistedMapsHashTable[INFO_HASH_SIZE] = { NULL };
;19:
;20:
;21:#define BOT_BEGIN_DELAY_BASE		2000
;22:#define BOT_BEGIN_DELAY_INCREMENT	1500
;23:
;24:#define BOT_SPAWN_QUEUE_DEPTH	16
;25:
;26:typedef struct {
;27:	int		clientNum;
;28:	int		spawnTime;
;29:} botSpawnQueue_t;
;30:
;31://static int			botBeginDelay = 0;  // bk001206 - unused, init
;32:static botSpawnQueue_t	botSpawnQueue[BOT_SPAWN_QUEUE_DEPTH];
;33:
;34:vmCvar_t bot_minplayers;
;35:
;36:extern gentity_t	*podium1;
;37:extern gentity_t	*podium2;
;38:extern gentity_t	*podium3;
;39:
;40:float trap_Cvar_VariableValue( const char *var_name ) {
line 43
;41:	char buf[128];
;42:
;43:	trap_Cvar_VariableStringBuffer(var_name, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 44
;44:	return atof(buf);
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
RETF4
LABELV $123
endproc trap_Cvar_VariableValue 132 12
export G_ParseInfos
proc G_ParseInfos 2128 12
line 55
;45:}
;46:
;47:
;48:
;49:
;50:/*
;51:===============
;52:G_ParseInfos
;53:===============
;54:*/
;55:int G_ParseInfos( char *buf, int max, infoHashed_t infos[], infoHashed_t *hashTable[], const char* hashKey, const char* bspList, int bspCount) {
line 63
;56:	char		*token;
;57:	int			count;
;58:	char		key[MAX_TOKEN_CHARS];
;59:	char		info[MAX_INFO_STRING];
;60:	const char* keyValue;
;61:	int			hash;
;62:
;63:	count = 0;
ADDRLP4 2056
CNSTI4 0
ASGNI4
ADDRGP4 $126
JUMPV
LABELV $125
line 65
;64:
;65:	while ( 1 ) {
line 66
;66:		token = COM_Parse( (const char **)(&buf) );
ADDRFP4 0
ARGP4
ADDRLP4 2064
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ASGNP4
line 67
;67:		if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $128
line 68
;68:			break;
ADDRGP4 $127
JUMPV
LABELV $128
line 70
;69:		}
;70:		if ( strcmp( token, "{" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
EQI4 $130
line 71
;71:			Com_Printf( "Missing { in info file\n" );
ADDRGP4 $133
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 72
;72:			break;
ADDRGP4 $127
JUMPV
LABELV $130
line 75
;73:		}
;74:
;75:		if ( count == max ) {
ADDRLP4 2056
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $134
line 76
;76:			Com_Printf( "Max infos exceeded\n" );
ADDRGP4 $136
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 77
;77:			break;
ADDRGP4 $127
JUMPV
LABELV $134
line 80
;78:		}
;79:
;80:		info[0] = '\0';
ADDRLP4 1028
CNSTI1 0
ASGNI1
ADDRGP4 $138
JUMPV
LABELV $137
line 81
;81:		while ( 1 ) {
line 82
;82:			token = COM_ParseExt( (const char **)(&buf), qtrue );
ADDRFP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 2072
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2072
INDIRP4
ASGNP4
line 83
;83:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $140
line 84
;84:				Com_Printf( "Unexpected end of info file\n" );
ADDRGP4 $142
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 85
;85:				break;
ADDRGP4 $139
JUMPV
LABELV $140
line 87
;86:			}
;87:			if ( !strcmp( token, "}" ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 2076
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $143
line 88
;88:				break;
ADDRGP4 $139
JUMPV
LABELV $143
line 90
;89:			}
;90:			Q_strncpyz( key, token, sizeof( key ) );
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 92
;91:
;92:			token = COM_ParseExt( (const char **)(&buf), qfalse );
ADDRFP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 2080
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2080
INDIRP4
ASGNP4
line 93
;93:			if ( !token[0] ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $146
line 94
;94:				Q_strncpyz( token, "<NULL>", MAX_TOKEN_CHARS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $148
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 95
;95:			}
LABELV $146
line 96
;96:			Info_SetValueForKey( info, key, token );
ADDRLP4 1028
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 97
;97:		}
LABELV $138
line 81
ADDRGP4 $137
JUMPV
LABELV $139
line 100
;98:
;99:		// check that the bsp exists
;100:		if (bspList) {
ADDRFP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $149
line 101
;101:			const char* bspptr = bspList;
ADDRLP4 2072
ADDRFP4 20
INDIRP4
ASGNP4
line 104
;102:			int bspLen;
;103:			int i;
;104:			const char* mapNameRaw =Info_ValueForKey(info, "map");
ADDRLP4 1028
ARGP4
ADDRGP4 $151
ARGP4
ADDRLP4 2092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2088
ADDRLP4 2092
INDIRP4
ASGNP4
line 105
;105:			const char* mapName = va("%s.bsp", mapNameRaw);
ADDRGP4 $152
ARGP4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRLP4 2096
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2084
ADDRLP4 2096
INDIRP4
ASGNP4
line 106
;106:			if (!strstr(mapName, "/")) { // that bsp list only returns files in the maps folder, not subfolders. just allow it then whatever
ADDRLP4 2084
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 2100
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 2100
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $153
line 107
;107:				qboolean found = qfalse;
ADDRLP4 2104
CNSTI4 0
ASGNI4
line 108
;108:				for (i = 0; i < bspCount; i++, bspptr += bspLen + 1) {
ADDRLP4 2076
CNSTI4 0
ASGNI4
ADDRGP4 $159
JUMPV
LABELV $156
line 109
;109:					bspLen = strlen(bspptr);
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2108
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 2080
ADDRLP4 2108
INDIRU4
CVUI4 4
ASGNI4
line 110
;110:					if (!Q_stricmp(bspptr, mapName)) {
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRLP4 2112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2112
INDIRI4
CNSTI4 0
NEI4 $160
line 111
;111:						found = qtrue;
ADDRLP4 2104
CNSTI4 1
ASGNI4
line 112
;112:						break;
ADDRGP4 $158
JUMPV
LABELV $160
line 114
;113:					}
;114:				}
LABELV $157
line 108
ADDRLP4 2108
CNSTI4 1
ASGNI4
ADDRLP4 2076
ADDRLP4 2076
INDIRI4
ADDRLP4 2108
INDIRI4
ADDI4
ASGNI4
ADDRLP4 2072
ADDRLP4 2080
INDIRI4
ADDRLP4 2108
INDIRI4
ADDI4
ADDRLP4 2072
INDIRP4
ADDP4
ASGNP4
LABELV $159
ADDRLP4 2076
INDIRI4
ADDRFP4 24
INDIRI4
LTI4 $156
LABELV $158
line 115
;115:				if (!found) {
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $162
line 116
;116:					if (g_developer.integer) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
EQI4 $126
line 117
;117:						Com_Printf("^3Arenas: Did not find %s. Skipping %s.\n", mapName, mapNameRaw);
ADDRGP4 $167
ARGP4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 118
;118:					}
line 119
;119:					continue; // skip this map, it doesn't exist anymore
ADDRGP4 $126
JUMPV
LABELV $162
line 121
;120:				}
;121:			}
LABELV $153
line 123
;122:
;123:			if (G_IsMapBlacklisted(mapNameRaw)) {
ADDRLP4 2088
INDIRP4
ARGP4
ADDRLP4 2104
ADDRGP4 G_IsMapBlacklisted
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
EQI4 $168
line 124
;124:				continue;
ADDRGP4 $126
JUMPV
LABELV $168
line 126
;125:			}
;126:		}
LABELV $149
line 129
;127:
;128:		//NOTE: extra space for arena number
;129:		keyValue = Info_ValueForKey(info, hashKey);
ADDRLP4 1028
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2052
ADDRLP4 2072
INDIRP4
ASGNP4
line 130
;130:		hash = generateHashValue(keyValue,INFO_HASH_SIZE);
ADDRLP4 2052
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2076
ADDRGP4 generateHashValue
CALLI4
ASGNI4
ADDRLP4 2060
ADDRLP4 2076
INDIRI4
ASGNI4
line 131
;131:		infos[count].name = G_Alloc(strlen(keyValue) + 1);
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 2080
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 2080
INDIRU4
CNSTU4 1
ADDU4
CVUI4 4
ARGI4
ADDRLP4 2084
ADDRGP4 G_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 2056
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 2084
INDIRP4
ASGNP4
line 132
;132:		if (infos[count].name) {
CNSTI4 12
ADDRLP4 2056
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $170
line 133
;133:			int infoLen = strlen(info) + strlen("\\num\\") + strlen(va("%d", MAX_ARENAS)) + 1;
ADDRLP4 1028
ARGP4
ADDRLP4 2092
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRGP4 $172
ARGP4
ADDRLP4 2096
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRGP4 $173
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 2100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2100
INDIRP4
ARGP4
ADDRLP4 2104
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 2088
ADDRLP4 2092
INDIRU4
ADDRLP4 2096
INDIRU4
ADDU4
ADDRLP4 2104
INDIRU4
ADDU4
CNSTU4 1
ADDU4
CVUI4 4
ASGNI4
line 134
;134:			Q_strncpyz(infos[count].name, keyValue, strlen(keyValue) + 1);
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 2108
ADDRGP4 strlen
CALLU4
ASGNU4
CNSTI4 12
ADDRLP4 2056
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 2108
INDIRU4
CNSTU4 1
ADDU4
CVUI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 135
;135:			infos[count].info = G_Alloc(infoLen);
ADDRLP4 2088
INDIRI4
ARGI4
ADDRLP4 2112
ADDRGP4 G_Alloc
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 2056
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 2112
INDIRP4
ASGNP4
line 136
;136:			if (infos[count].info) {
CNSTI4 12
ADDRLP4 2056
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $174
line 138
;137:				infoHashed_t* cmp;
;138:				qboolean dupe = qfalse;
ADDRLP4 2120
CNSTI4 0
ASGNI4
line 139
;139:				Q_strncpyz(infos[count].info, info, infoLen);
CNSTI4 12
ADDRLP4 2056
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 2088
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 142
;140:
;141:				// check for dupes
;142:				for (cmp = hashTable[hash]; cmp; cmp = cmp->next) {
ADDRLP4 2116
ADDRLP4 2060
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $179
JUMPV
LABELV $176
line 144
;143:					//if( Q_stricmp( Info_ValueForKey( g_arenaInfos[n], "map" ), map ) == 0 ) {
;144:					if (Q_stricmp(cmp->name, keyValue) == 0) {
ADDRLP4 2116
INDIRP4
INDIRP4
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 2124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2124
INDIRI4
CNSTI4 0
NEI4 $180
line 145
;145:						dupe = qtrue;
ADDRLP4 2120
CNSTI4 1
ASGNI4
line 146
;146:						break;
ADDRGP4 $178
JUMPV
LABELV $180
line 148
;147:					}
;148:				}
LABELV $177
line 142
ADDRLP4 2116
ADDRLP4 2116
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ASGNP4
LABELV $179
ADDRLP4 2116
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $176
LABELV $178
line 150
;149:
;150:				if (!dupe) {
ADDRLP4 2120
INDIRI4
CNSTI4 0
NEI4 $182
line 151
;151:					infos[count].next = hashTable[hash];
CNSTI4 12
ADDRLP4 2056
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 2060
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 152
;152:					hashTable[hash] = &infos[count];
ADDRLP4 2060
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
CNSTI4 12
ADDRLP4 2056
INDIRI4
MULI4
ADDRFP4 8
INDIRP4
ADDP4
ASGNP4
line 153
;153:					count++;
ADDRLP4 2056
ADDRLP4 2056
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 154
;154:				}
ADDRGP4 $171
JUMPV
LABELV $182
line 155
;155:				else {
line 156
;156:					if (g_developer.integer) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
EQI4 $171
line 157
;157:						Com_Printf("^3G_ParseInfos: %s is a dupe. Skipping.\n", keyValue);
ADDRGP4 $187
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 158
;158:					}
line 159
;159:				}
line 160
;160:			}
ADDRGP4 $171
JUMPV
LABELV $174
line 161
;161:			else {
line 162
;162:				if (g_developer.integer) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
EQI4 $171
line 163
;163:					Com_Printf("^3G_ParseInfos: Failed to alloc string for %s.\n", keyValue);
ADDRGP4 $191
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 164
;164:				}
line 165
;165:			}
line 166
;166:		}
ADDRGP4 $171
JUMPV
LABELV $170
line 167
;167:		else {
line 168
;168:			if (g_developer.integer) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
EQI4 $192
line 169
;169:				Com_Printf("^3G_ParseInfos: Failed to alloc name string for %s.\n", keyValue);
ADDRGP4 $195
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 170
;170:			}
LABELV $192
line 171
;171:		}
LABELV $171
line 172
;172:	}
LABELV $126
line 65
ADDRGP4 $125
JUMPV
LABELV $127
line 173
;173:	return count;
ADDRLP4 2056
INDIRI4
RETI4
LABELV $124
endproc G_ParseInfos 2128 12
bss
align 1
LABELV $197
skip 16384
code
proc G_LoadArenasFromFile 32 28
line 181
;174:}
;175:
;176:/*
;177:===============
;178:G_LoadArenasFromFile
;179:===============
;180:*/
;181:static void G_LoadArenasFromFile( char *filename, const char* bspList, int bspCount ) {
line 187
;182:	int				len;
;183:	fileHandle_t	f;
;184:	static char		buf[MAX_ARENAS_TEXT];
;185:	int				countHere;
;186:
;187:	if (g_developer.integer) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
EQI4 $198
line 188
;188:		trap_Printf(va("Arenas: opening %s; ", filename));
ADDRGP4 $201
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 189
;189:	}
LABELV $198
line 191
;190:
;191:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 192
;192:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $202
line 193
;193:		trap_Printf( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $204
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 194
;194:		return;
ADDRGP4 $196
JUMPV
LABELV $202
line 196
;195:	}
;196:	if ( len >= MAX_ARENAS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 16384
LTI4 $205
line 197
;197:		trap_Printf( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_ARENAS_TEXT ) );
ADDRGP4 $207
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 16384
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 198
;198:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 199
;199:		return;
ADDRGP4 $196
JUMPV
LABELV $205
line 202
;200:	}
;201:
;202:	trap_FS_Read( buf, len, f );
ADDRGP4 $197
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 203
;203:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $197
ADDP4
CNSTI1 0
ASGNI1
line 204
;204:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 206
;205:
;206:	countHere = G_ParseInfos(buf, MAX_ARENAS - g_numArenas, &g_arenaInfosHashed[g_numArenas],g_arenaInfosHashTable,"map", bspList, bspCount);
ADDRGP4 $197
ARGP4
ADDRLP4 16
ADDRGP4 g_numArenas
INDIRI4
ASGNI4
CNSTI4 4096
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
CNSTI4 12
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 g_arenaInfosHashed
ADDP4
ARGP4
ADDRGP4 g_arenaInfosHashTable
ARGP4
ADDRGP4 $151
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 G_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 207
;207:	g_numArenas += countHere;
ADDRLP4 24
ADDRGP4 g_numArenas
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 209
;208:
;209:	if (g_developer.integer) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
EQI4 $208
line 210
;210:		trap_Printf(va("%d arenas found\n", countHere));
ADDRGP4 $211
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 211
;211:	}
LABELV $208
line 212
;212:}
LABELV $196
endproc G_LoadArenasFromFile 32 28
export G_GetMapTypeBits
proc G_GetMapTypeBits 32 8
line 215
;213:
;214:int G_GetMapTypeBits(char *type)
;215:{
line 216
;216:	int typeBits = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 218
;217:
;218:	if( *type ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $213
line 219
;219:		if( strstr( type, "ffa" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 4
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $215
line 220
;220:			typeBits |= (1 << GT_FFA);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 221
;221:			typeBits |= (1 << GT_TEAM);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 222
;222:		}
LABELV $215
line 223
;223:		if( strstr( type, "holocron" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $220
ARGP4
ADDRLP4 8
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $218
line 224
;224:			typeBits |= (1 << GT_HOLOCRON);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 225
;225:		}
LABELV $218
line 226
;226:		if( strstr( type, "jedimaster" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $223
ARGP4
ADDRLP4 12
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $221
line 227
;227:			typeBits |= (1 << GT_JEDIMASTER);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 228
;228:		}
LABELV $221
line 229
;229:		if( strstr( type, "duel" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $226
ARGP4
ADDRLP4 16
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $224
line 230
;230:			typeBits |= (1 << GT_TOURNAMENT);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 231
;231:		}
LABELV $224
line 232
;232:		if( strstr( type, "saga" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $229
ARGP4
ADDRLP4 20
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $227
line 233
;233:			typeBits |= (1 << GT_SAGA);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 234
;234:		}
LABELV $227
line 235
;235:		if( strstr( type, "ctf" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $232
ARGP4
ADDRLP4 24
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $230
line 236
;236:			typeBits |= (1 << GT_CTF);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 237
;237:		}
LABELV $230
line 238
;238:		if( strstr( type, "cty" ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $235
ARGP4
ADDRLP4 28
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $214
line 239
;239:			typeBits |= (1 << GT_CTY);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 240
;240:		}
line 241
;241:	} else {
ADDRGP4 $214
JUMPV
LABELV $213
line 242
;242:		typeBits |= (1 << GT_FFA);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 243
;243:	}
LABELV $214
line 245
;244:
;245:	return typeBits;
ADDRLP4 0
INDIRI4
RETI4
LABELV $212
endproc G_GetMapTypeBits 32 8
export G_DoesMapSupportGametype
proc G_DoesMapSupportGametype 36 8
line 249
;246:}
;247:
;248:qboolean G_DoesMapSupportGametype(const char *mapname, int gametype)
;249:{
line 250
;250:	int				typeBits = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 252
;251:	//int				thisLevel = -1;
;252:	int				n = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 253
;253:	char			*type = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 256
;254:	infoHashed_t*	mapInfo;
;255:
;256:	if (!g_arenaInfosHashed[0].info)
ADDRGP4 g_arenaInfosHashed+4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $237
line 257
;257:	{
line 258
;258:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $236
JUMPV
LABELV $237
line 261
;259:	}
;260:
;261:	if (!mapname || !mapname[0])
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $242
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $240
LABELV $242
line 262
;262:	{
line 263
;263:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $236
JUMPV
LABELV $240
line 266
;264:	}
;265:
;266:	mapInfo = G_GetArenaInfoByMap(mapname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 279
;267:	//for( n = 0; n < g_numArenas; n++ )
;268:	//{
;269:	//	//type = Info_ValueForKey( g_arenaInfos[n], "map" );
;270:	//	type = g_arenaInfosHashed[n].name;
;271:
;272:	//	if (Q_stricmp(mapname, type) == 0)
;273:	//	{
;274:	//		thisLevel = n;
;275:	//		break;
;276:	//	}
;277:	//}
;278:
;279:	if (!mapInfo)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $243
line 280
;280:	{
line 281
;281:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $236
JUMPV
LABELV $243
line 284
;282:	}
;283:
;284:	if (!g_defrag.integer && gametype == GT_FFA) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $245
ADDRFP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $245
line 285
;285:		return qtrue; // fair? no map that doesnt support ffa is there? it would have to have no spawn at all. wait, will we even get this far if it has no arena file?
CNSTI4 1
RETI4
ADDRGP4 $236
JUMPV
LABELV $245
line 288
;286:	}
;287:
;288:	type = Info_ValueForKey(mapInfo->info, "type");
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
ASGNP4
line 290
;289:
;290:	typeBits = G_GetMapTypeBits(type);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 G_GetMapTypeBits
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32
INDIRI4
ASGNI4
line 291
;291:	if (typeBits & (1 << gametype))
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $249
line 292
;292:	{ //the map in question supports the gametype in question, so..
line 293
;293:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $236
JUMPV
LABELV $249
line 296
;294:	}
;295:
;296:	return qfalse;
CNSTI4 0
RETI4
LABELV $236
endproc G_DoesMapSupportGametype 36 8
export G_DoesMapHaveArena
proc G_DoesMapHaveArena 16 8
line 299
;297:}
;298:qboolean G_DoesMapHaveArena(const char *mapname)
;299:{
line 300
;300:	int			n = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 301
;301:	char		*type = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 303
;302:
;303:	if (!g_arenaInfosHashed[0].info)
ADDRGP4 g_arenaInfosHashed+4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $252
line 304
;304:	{
line 305
;305:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $251
JUMPV
LABELV $252
line 308
;306:	}
;307:
;308:	if (!mapname || !mapname[0])
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $257
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $255
LABELV $257
line 309
;309:	{
line 310
;310:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $251
JUMPV
LABELV $255
line 313
;311:	}
;312:
;313:	for( n = 0; n < g_numArenas; n++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $261
JUMPV
LABELV $258
line 314
;314:	{
line 316
;315:		//type = Info_ValueForKey( g_arenaInfos[n], "map" );
;316:		type = g_arenaInfosHashed[n].name;
ADDRLP4 4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaInfosHashed
ADDP4
INDIRP4
ASGNP4
line 318
;317:
;318:		if (Q_stricmp(mapname, type) == 0)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $262
line 319
;319:		{
line 320
;320:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $251
JUMPV
line 321
;321:			break;
LABELV $262
line 323
;322:		}
;323:	}
LABELV $259
line 313
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $261
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $258
line 324
;324:	return qfalse;
CNSTI4 0
RETI4
LABELV $251
endproc G_DoesMapHaveArena 16 8
export G_RefreshNextMap
proc G_RefreshNextMap 312 16
line 329
;325:}
;326:
;327://rww - auto-obtain nextmap. I could've sworn Q3 had something like this, but I guess not.
;328:const char *G_RefreshNextMap(int gametype, qboolean forced)
;329:{
line 330
;330:	int			typeBits = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 331
;331:	int			thisLevel = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 332
;332:	int			desiredMap = 0;
ADDRLP4 292
CNSTI4 0
ASGNI4
line 333
;333:	int			n = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 334
;334:	char		*type = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 335
;335:	qboolean	loopingUp = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 338
;336:	vmCvar_t	mapname;
;337:
;338:	if (!g_autoMapCycle.integer && !forced)
ADDRLP4 296
CNSTI4 0
ASGNI4
ADDRGP4 g_autoMapCycle+12
INDIRI4
ADDRLP4 296
INDIRI4
NEI4 $265
ADDRFP4 4
INDIRI4
ADDRLP4 296
INDIRI4
NEI4 $265
line 339
;339:	{
line 340
;340:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $264
JUMPV
LABELV $265
line 343
;341:	}
;342:
;343:	if (!g_arenaInfosHashed[0].info)
ADDRGP4 g_arenaInfosHashed+4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $268
line 344
;344:	{
line 345
;345:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $264
JUMPV
LABELV $268
line 348
;346:	}
;347:
;348:	trap_Cvar_Register( &mapname, "mapname", "", CVAR_SERVERINFO | CVAR_ROM );
ADDRLP4 20
ARGP4
ADDRGP4 $271
ARGP4
ADDRGP4 $272
ARGP4
CNSTI4 68
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 349
;349:	for( n = 0; n < g_numArenas; n++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $273
line 350
;350:	{
line 352
;351:		//type = Info_ValueForKey( g_arenaInfos[n], "map" );
;352:		type = g_arenaInfosHashed[n].name;
ADDRLP4 4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaInfosHashed
ADDP4
INDIRP4
ASGNP4
line 354
;353:
;354:		if (Q_stricmp(mapname.string, type) == 0)
ADDRLP4 20+16
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
NEI4 $277
line 355
;355:		{
line 356
;356:			thisLevel = n;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 357
;357:			level.hasArenaInfo = qtrue;
ADDRGP4 level+29500
CNSTI4 1
ASGNI4
line 358
;358:			break;
ADDRGP4 $275
JUMPV
LABELV $277
line 360
;359:		}
;360:	}
LABELV $274
line 349
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $276
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $273
LABELV $275
line 362
;361:
;362:	desiredMap = thisLevel;
ADDRLP4 292
ADDRLP4 12
INDIRI4
ASGNI4
line 364
;363:
;364:	n = thisLevel+1;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $282
JUMPV
LABELV $281
line 366
;365:	while (n != thisLevel)
;366:	{ //now cycle through the arena list and find the next map that matches the gametype we're in
line 367
;367:		if (!g_arenaInfosHashed[n].info || n >= g_numArenas)
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaInfosHashed+4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $287
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $284
LABELV $287
line 368
;368:		{
line 369
;369:			if (loopingUp)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $288
line 370
;370:			{ //this shouldn't happen, but if it does we have a null entry break in the arena file
line 372
;371:			  //if this is the case just break out of the loop instead of sticking in an infinite loop
;372:				break;
ADDRGP4 $283
JUMPV
LABELV $288
line 374
;373:			}
;374:			n = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 375
;375:			loopingUp = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 376
;376:		}
LABELV $284
line 378
;377:
;378:		type = Info_ValueForKey(g_arenaInfosHashed[n].info, "type");
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaInfosHashed+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 304
INDIRP4
ASGNP4
line 380
;379:		
;380:		typeBits = G_GetMapTypeBits(type);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 G_GetMapTypeBits
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 308
INDIRI4
ASGNI4
line 381
;381:		if (typeBits & (1 << gametype))
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $291
line 382
;382:		{
line 383
;383:			desiredMap = n;
ADDRLP4 292
ADDRLP4 0
INDIRI4
ASGNI4
line 384
;384:			break;
ADDRGP4 $283
JUMPV
LABELV $291
line 387
;385:		}
;386:
;387:		n++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 388
;388:	}
LABELV $282
line 365
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $281
LABELV $283
line 390
;389:
;390:	if (desiredMap == thisLevel)
ADDRLP4 292
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $293
line 391
;391:	{ //If this is the only level for this game mode or we just can't find a map for this game mode, then nextmap
line 393
;392:	  //will always restart.
;393:		trap_Cvar_Set( "nextmap", "map_restart 0");
ADDRGP4 $295
ARGP4
ADDRGP4 $296
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 394
;394:	}
ADDRGP4 $294
JUMPV
LABELV $293
line 396
;395:	else
;396:	{ //otherwise we have a valid nextmap to cycle to, so use it.
line 398
;397:		//type = Info_ValueForKey( g_arenaInfos[desiredMap], "map" );
;398:		type = g_arenaInfosHashed[desiredMap].name;
ADDRLP4 4
CNSTI4 12
ADDRLP4 292
INDIRI4
MULI4
ADDRGP4 g_arenaInfosHashed
ADDP4
INDIRP4
ASGNP4
line 399
;399:		trap_Cvar_Set( "nextmap", va("map %s", type));
ADDRGP4 $297
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $295
ARGP4
ADDRLP4 300
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 400
;400:	}
LABELV $294
line 403
;401:
;402:	//return Info_ValueForKey( g_arenaInfos[desiredMap], "map" );
;403:	return g_arenaInfosHashed[desiredMap].name;
CNSTI4 12
ADDRLP4 292
INDIRI4
MULI4
ADDRGP4 g_arenaInfosHashed
ADDP4
INDIRP4
RETP4
LABELV $264
endproc G_RefreshNextMap 312 16
export G_CheckMapHasArenaInfo
proc G_CheckMapHasArenaInfo 284 16
line 408
;404:}
;405:
;406:
;407:void G_CheckMapHasArenaInfo()
;408:{
line 409
;409:	int			n = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 410
;410:	char* type = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 413
;411:	vmCvar_t	mapname;
;412:
;413:	level.hasArenaInfo = qfalse;
ADDRGP4 level+29500
CNSTI4 0
ASGNI4
line 415
;414:
;415:	if (!g_arenaInfosHashed[0].info)
ADDRGP4 g_arenaInfosHashed+4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $300
line 416
;416:	{
line 417
;417:		return;
ADDRGP4 $298
JUMPV
LABELV $300
line 420
;418:	}
;419:
;420:	trap_Cvar_Register(&mapname, "mapname", "", CVAR_SERVERINFO | CVAR_ROM);
ADDRLP4 8
ARGP4
ADDRGP4 $271
ARGP4
ADDRGP4 $272
ARGP4
CNSTI4 68
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 421
;421:	for (n = 0; n < g_numArenas; n++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $306
JUMPV
LABELV $303
line 422
;422:	{
line 424
;423:		//type = Info_ValueForKey(g_arenaInfos[n], "map");
;424:		type = g_arenaInfosHashed[n].name;
ADDRLP4 4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaInfosHashed
ADDP4
INDIRP4
ASGNP4
line 426
;425:
;426:		if (Q_stricmp(mapname.string, type) == 0)
ADDRLP4 8+16
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $307
line 427
;427:		{
line 428
;428:			level.hasArenaInfo = qtrue;
ADDRGP4 level+29500
CNSTI4 1
ASGNI4
line 429
;429:			return;
ADDRGP4 $298
JUMPV
LABELV $307
line 431
;430:		}
;431:	}
LABELV $304
line 421
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $306
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $303
line 433
;432:
;433:	G_Printf("^3Map is missing an arena info.\n");
ADDRGP4 $311
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 434
;434:}
LABELV $298
endproc G_CheckMapHasArenaInfo 284 16
export arenasort
proc arenasort 12 8
line 444
;435:
;436://int arenasort(void const* a, void const* b) {
;437://	char const* aa = *(char const**)a;
;438://	char const* bb = *(char const**)b;
;439://	const char* map1 = Info_ValueForKey(aa, "map");
;440://	const char* map2 = Info_ValueForKey(bb, "map");
;441://
;442://	return strcmp(map1,map2);
;443://}
;444:int arenasort(void const* a, void const* b) {
line 445
;445:	infoHashed_t* aa = (infoHashed_t*)a;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 446
;446:	infoHashed_t* bb = (infoHashed_t*)b;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 448
;447:
;448:	return strcmp(aa->name, bb->name);
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $312
endproc arenasort 12 8
export G_IsMapBlacklisted
proc G_IsMapBlacklisted 20 8
line 451
;449:}
;450:
;451:qboolean G_IsMapBlacklisted(const char* map) {
line 453
;452:	int				n;
;453:	int				hash = generateHashValue(map, INFO_HASH_SIZE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 12
ADDRGP4 generateHashValue
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 456
;454:	infoHashed_t* info;
;455:
;456:	for (info = g_blacklistedMapsHashTable[hash]; info; info = info->next) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_blacklistedMapsHashTable
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $317
JUMPV
LABELV $314
line 457
;457:		if (Q_stricmp(info->name, map) == 0) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $318
line 458
;458:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $313
JUMPV
LABELV $318
line 460
;459:		}
;460:	}
LABELV $315
line 456
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ASGNP4
LABELV $317
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $314
line 462
;461:
;462:	return qfalse;
CNSTI4 0
RETI4
LABELV $313
endproc G_IsMapBlacklisted 20 8
proc G_AddMapToBlacklist 32 12
line 465
;463:}
;464:
;465:static void G_AddMapToBlacklist(const char* mapname) {
line 469
;466:	infoHashed_t* blMap;
;467:	int				nameLen;
;468:	int				hash;
;469:	if (G_IsMapBlacklisted(mapname)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_IsMapBlacklisted
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $321
line 471
;470:		// already in the blacklist, dont dupe.
;471:		return;
ADDRGP4 $320
JUMPV
LABELV $321
line 473
;472:	}
;473:	blMap = &g_blacklistedMaps[g_numBlacklistedMaps];
ADDRLP4 0
CNSTI4 12
ADDRGP4 g_numBlacklistedMaps
INDIRI4
MULI4
ADDRGP4 g_blacklistedMaps
ADDP4
ASGNP4
line 474
;474:	nameLen = strlen(mapname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 4
ADDRLP4 16
INDIRU4
CVUI4 4
ASGNI4
line 475
;475:	blMap->name = G_Alloc(nameLen + 1);
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 20
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRP4
ASGNP4
line 476
;476:	if (blMap->name) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $323
line 477
;477:		Q_strncpyz(blMap->name, mapname, nameLen + 1);
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 478
;478:		blMap->info = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTP4 0
ASGNP4
line 479
;479:		hash = generateHashValue(blMap->name, INFO_HASH_SIZE);
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 24
ADDRGP4 generateHashValue
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 480
;480:		blMap->next = g_blacklistedMapsHashTable[hash];
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_blacklistedMapsHashTable
ADDP4
INDIRP4
ASGNP4
line 481
;481:		g_blacklistedMapsHashTable[hash] = blMap;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_blacklistedMapsHashTable
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 482
;482:		g_numBlacklistedMaps++;
ADDRLP4 28
ADDRGP4 g_numBlacklistedMaps
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 483
;483:	}
LABELV $323
line 484
;484:}
LABELV $320
endproc G_AddMapToBlacklist 32 12
bss
align 1
LABELV $326
skip 16384
code
proc G_LoadMapBlacklist 152 12
line 486
;485:
;486:static void G_LoadMapBlacklist(const char* mapBlacklistFile) {
line 490
;487:	fileHandle_t	f;
;488:	static char		buf[MAX_ARENAS_TEXT];
;489:	char			mapname[128];
;490:	const char		*s = buf;
ADDRLP4 4
ADDRGP4 $326
ASGNP4
line 494
;491:	const char		*token;
;492:	int				fileLen;
;493:
;494:	fileLen = trap_FS_FOpenFile(mapBlacklistFile, &f, FS_READ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 144
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 144
INDIRI4
ASGNI4
line 495
;495:	if (!f) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $327
line 496
;496:		return;
ADDRGP4 $325
JUMPV
LABELV $327
line 499
;497:	}
;498:
;499:	trap_FS_Read(buf, sizeof(buf), f);
ADDRGP4 $326
ARGP4
CNSTI4 16384
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 500
;500:	buf[fileLen] = 0;
ADDRLP4 12
INDIRI4
ADDRGP4 $326
ADDP4
CNSTI1 0
ASGNI1
ADDRGP4 $330
JUMPV
LABELV $329
line 502
;501:
;502:	while (s) {
line 503
;503:		token = COM_ParseExt(&s, qtrue);
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 148
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 148
INDIRP4
ASGNP4
line 504
;504:		if (*token) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $332
line 505
;505:			G_AddMapToBlacklist(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 506
;506:		}
LABELV $332
line 507
;507:	}
LABELV $330
line 502
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $329
line 509
;508:
;509:	trap_FS_FCloseFile(f);
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 510
;510:}
LABELV $325
endproc G_LoadMapBlacklist 152 12
bss
align 1
LABELV $335
skip 32768
code
proc G_LoadMapBlacklists 160 16
line 512
;511:
;512:static void G_LoadMapBlacklists() {
line 521
;513:
;514:	int			numdirs;
;515:	int			numBsps;
;516:	static char		dirlist[32768];
;517:	char* dirptr;
;518:	int i;
;519:	int			dirlen;
;520:	char		filename[128];
;521:	int			numBlacklists = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 523
;522:
;523:	g_numBlacklistedMaps = 0;
ADDRGP4 g_numBlacklistedMaps
CNSTI4 0
ASGNI4
line 525
;524:
;525:	numdirs = trap_FS_GetFileList("mapblacklists", ".txt", dirlist, sizeof(dirlist));
ADDRGP4 $336
ARGP4
ADDRGP4 $337
ARGP4
ADDRGP4 $335
ARGP4
CNSTI4 32768
ARGI4
ADDRLP4 152
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 152
INDIRI4
ASGNI4
line 526
;526:	dirptr = dirlist;
ADDRLP4 128
ADDRGP4 $335
ASGNP4
line 527
;527:	for (i = 0; i < numdirs; i++, dirptr += dirlen + 1) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $341
JUMPV
LABELV $338
line 528
;528:		dirlen = strlen(dirptr);
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 136
ADDRLP4 156
INDIRU4
CVUI4 4
ASGNI4
line 529
;529:		Q_strncpyz(filename, "mapblacklists/",sizeof(filename));
ADDRLP4 0
ARGP4
ADDRGP4 $342
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 530
;530:		Q_strcat(filename,sizeof(filename), dirptr);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 531
;531:		G_LoadMapBlacklist(filename);
ADDRLP4 0
ARGP4
ADDRGP4 G_LoadMapBlacklist
CALLV
pop
line 532
;532:		numBlacklists++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 533
;533:	}
LABELV $339
line 527
ADDRLP4 156
CNSTI4 1
ASGNI4
ADDRLP4 132
ADDRLP4 132
INDIRI4
ADDRLP4 156
INDIRI4
ADDI4
ASGNI4
ADDRLP4 128
ADDRLP4 136
INDIRI4
ADDRLP4 156
INDIRI4
ADDI4
ADDRLP4 128
INDIRP4
ADDP4
ASGNP4
LABELV $341
ADDRLP4 132
INDIRI4
ADDRLP4 144
INDIRI4
LTI4 $338
line 535
;534:
;535:	if (numBlacklists) {
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $343
line 536
;536:		Com_Printf("%d blacklist files were parsed.\n", numBlacklists);
ADDRGP4 $345
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 537
;537:	}
LABELV $343
line 539
;538:
;539:	if (g_defrag.integer) {
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
EQI4 $346
line 542
;540:
;541:		// don't show normal mp maps in defrag mode
;542:		G_AddMapToBlacklist("ctf_bespin");
ADDRGP4 $349
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 543
;543:		G_AddMapToBlacklist("ctf_imperial");
ADDRGP4 $350
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 544
;544:		G_AddMapToBlacklist("ctf_ns_streets");
ADDRGP4 $351
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 545
;545:		G_AddMapToBlacklist("ctf_yavin");
ADDRGP4 $352
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 546
;546:		G_AddMapToBlacklist("duel_bay");
ADDRGP4 $353
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 547
;547:		G_AddMapToBlacklist("duel_bespin");
ADDRGP4 $354
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 548
;548:		G_AddMapToBlacklist("duel_carbon");
ADDRGP4 $355
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 549
;549:		G_AddMapToBlacklist("duel_hangar");
ADDRGP4 $356
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 550
;550:		G_AddMapToBlacklist("duel_jedi");
ADDRGP4 $357
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 551
;551:		G_AddMapToBlacklist("duel_pit");
ADDRGP4 $358
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 552
;552:		G_AddMapToBlacklist("duel_temple");
ADDRGP4 $359
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 553
;553:		G_AddMapToBlacklist("duel_training");
ADDRGP4 $360
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 554
;554:		G_AddMapToBlacklist("ffa_bespin");
ADDRGP4 $361
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 555
;555:		G_AddMapToBlacklist("ffa_deathstar");
ADDRGP4 $362
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 556
;556:		G_AddMapToBlacklist("ffa_imperial");
ADDRGP4 $363
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 557
;557:		G_AddMapToBlacklist("ffa_ns_hideout");
ADDRGP4 $364
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 558
;558:		G_AddMapToBlacklist("ffa_ns_streets");
ADDRGP4 $365
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 559
;559:		G_AddMapToBlacklist("ffa_raven");
ADDRGP4 $366
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 560
;560:		G_AddMapToBlacklist("ffa_yavin");
ADDRGP4 $367
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 561
;561:	}
LABELV $346
line 564
;562:
;563:	// block sp maps from maplist by default (unless we have some cool way to deal with them?)
;564:	G_AddMapToBlacklist("artus_detention");
ADDRGP4 $368
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 565
;565:	G_AddMapToBlacklist("artus_mine");
ADDRGP4 $369
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 566
;566:	G_AddMapToBlacklist("artus_topside");
ADDRGP4 $370
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 567
;567:	G_AddMapToBlacklist("bespin_platform");
ADDRGP4 $371
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 568
;568:	G_AddMapToBlacklist("bespin_streets");
ADDRGP4 $372
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 569
;569:	G_AddMapToBlacklist("bespin_undercity");
ADDRGP4 $373
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 570
;570:	G_AddMapToBlacklist("cairn_assembly");
ADDRGP4 $374
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 571
;571:	G_AddMapToBlacklist("cairn_bay");
ADDRGP4 $375
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 572
;572:	G_AddMapToBlacklist("cairn_dock1");
ADDRGP4 $376
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 573
;573:	G_AddMapToBlacklist("cairn_reactor");
ADDRGP4 $377
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 574
;574:	G_AddMapToBlacklist("doom_comm");
ADDRGP4 $378
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 575
;575:	G_AddMapToBlacklist("doom_detention");
ADDRGP4 $379
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 576
;576:	G_AddMapToBlacklist("doom_shields");
ADDRGP4 $380
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 577
;577:	G_AddMapToBlacklist("kejim_base");
ADDRGP4 $381
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 578
;578:	G_AddMapToBlacklist("kejim_post");
ADDRGP4 $382
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 579
;579:	G_AddMapToBlacklist("ns_hideout");
ADDRGP4 $383
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 580
;580:	G_AddMapToBlacklist("ns_starpad");
ADDRGP4 $384
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 581
;581:	G_AddMapToBlacklist("ns_streets");
ADDRGP4 $385
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 582
;582:	G_AddMapToBlacklist("pit");
ADDRGP4 $386
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 583
;583:	G_AddMapToBlacklist("valley");
ADDRGP4 $387
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 584
;584:	G_AddMapToBlacklist("yavin_canyon");
ADDRGP4 $388
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 585
;585:	G_AddMapToBlacklist("yavin_courtyard");
ADDRGP4 $389
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 586
;586:	G_AddMapToBlacklist("yavin_final");
ADDRGP4 $390
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 587
;587:	G_AddMapToBlacklist("yavin_swamp");
ADDRGP4 $391
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 588
;588:	G_AddMapToBlacklist("yavin_temple");
ADDRGP4 $392
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 589
;589:	G_AddMapToBlacklist("yavin_trial");
ADDRGP4 $393
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 592
;590:	
;591:
;592:	level.blacklistsLoaded = qtrue;
ADDRGP4 level+29520
CNSTI4 1
ASGNI4
line 593
;593:}
LABELV $334
endproc G_LoadMapBlacklists 160 16
bss
align 1
LABELV $396
skip 16384
export G_BlacklistMap
code
proc G_BlacklistMap 316 20
line 603
;594:
;595:
;596:#define BLACKLIST_NAME "_blacklist" // changed back to _ from 0. doesnt affect ordering anyway
;597:/*
;598:=============
;599:G_BlacklistMap
;600:=============
;601:*/
;602:void G_BlacklistMap(const char* thisMapName)
;603:{
line 605
;604:	vmCvar_t		mapname;
;605:	int				len = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 609
;606:	fileHandle_t	f;
;607:	static char		arenaText[MAX_ARENAS_TEXT];
;608:	int				arenaTextLength;
;609:	int				arenaFileIndex = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 612
;610:	const char* tmp;
;611:
;612:	if (!level.blacklistsLoaded) {
ADDRGP4 level+29520
INDIRI4
CNSTI4 0
NEI4 $397
line 613
;613:		G_SendServerCommand(-1, va("print \"^1Can't add to blacklist, blacklists weren't loaded (can't avoid dupes).\n\"", thisMapName), qtrue);
ADDRGP4 $400
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 292
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 292
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 614
;614:		return;
ADDRGP4 $395
JUMPV
LABELV $397
line 618
;615:	}
;616:
;617:
;618:	Q_strncpyz(arenaText, va("\n%s", thisMapName), sizeof(arenaText));
ADDRGP4 $401
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 292
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $396
ARGP4
ADDRLP4 292
INDIRP4
ARGP4
CNSTI4 16384
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 620
;619:
;620:	arenaTextLength = strlen(arenaText);
ADDRGP4 $396
ARGP4
ADDRLP4 296
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 8
ADDRLP4 296
INDIRU4
CVUI4 4
ASGNI4
ADDRGP4 $403
JUMPV
LABELV $402
line 621
;621:	while (((len = trap_FS_FOpenFile(va("mapblacklists/" BLACKLIST_NAME "%d.txt", arenaFileIndex), &f, FS_READ)) + arenaTextLength + 2) > MAX_ARENAS_TEXT) {
line 622
;622:		if (!f) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $406
line 625
;623:
;624:			// file doesnt exist yet. good. wait, we would prolly never get here then. oh well
;625:			break;
ADDRGP4 $404
JUMPV
LABELV $406
line 627
;626:		}
;627:		trap_FS_FCloseFile(f);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 628
;628:		f = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 629
;629:		arenaFileIndex++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 630
;630:	}
LABELV $403
line 621
ADDRGP4 $405
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 300
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 300
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 304
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 304
INDIRI4
ASGNI4
ADDRLP4 304
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 2
ADDI4
CNSTI4 16384
GTI4 $402
LABELV $404
line 631
;631:	if (f) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $408
line 632
;632:		trap_FS_FCloseFile(f); // we need to close and reopen it. the first open was in FS_READ mode to get the filesize. second open is in FS_APPEND mode. if the file doesnt yet exist thats fine, we will create it.
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 633
;633:		f = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 634
;634:	}
LABELV $408
line 636
;635:
;636:	trap_FS_FOpenFile(va("mapblacklists/" BLACKLIST_NAME "%d.txt", arenaFileIndex), &f, FS_APPEND);
ADDRGP4 $405
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 308
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 308
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 638
;637:
;638:	if (!f) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $410
line 639
;639:		G_SendServerCommand(-1, va("print \"^1Blacklist addition failed, cannot open mapblacklists/" BLACKLIST_NAME "%d.txt for writing.\n\"", arenaFileIndex), qtrue);
ADDRGP4 $412
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 312
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 312
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 640
;640:		return;
ADDRGP4 $395
JUMPV
LABELV $410
line 642
;641:	}
;642:	else {
line 643
;643:		G_AddMapToBlacklist(thisMapName);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_AddMapToBlacklist
CALLV
pop
line 644
;644:		G_SendServerCommand(-1, va("print \"^2Adding to blacklist for %s (length %d) in mapblacklists/" BLACKLIST_NAME "%d.txt (length %d).\n\"", thisMapName, arenaTextLength, arenaFileIndex, len), qtrue);
ADDRGP4 $413
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 312
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 312
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 645
;645:	}
line 647
;646:
;647:	trap_FS_Write(arenaText, arenaTextLength, f);
ADDRGP4 $396
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 649
;648:
;649:	trap_FS_FCloseFile(f);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 650
;650:}
LABELV $395
endproc G_BlacklistMap 316 20
bss
align 1
LABELV $415
skip 32768
align 1
LABELV $416
skip 32768
code
proc G_LoadArenas 448 16
line 658
;651:
;652:
;653:/*
;654:===============
;655:G_LoadArenas
;656:===============
;657:*/
;658:static void G_LoadArenas( void ) {
line 670
;659:	int			numdirs;
;660:	int			numBsps;
;661:	vmCvar_t	arenasFile;
;662:	char		filename[128];
;663:	char*		dirptr;
;664:	static char	dirlistBsp[32768];
;665:	static char	dirlist[32768];
;666:	int			i, n;
;667:	int			dirlen;
;668:	int			hash;
;669:
;670:	g_numArenas = 0;
ADDRGP4 g_numArenas
CNSTI4 0
ASGNI4
line 672
;671:
;672:	numBsps = trap_FS_GetFileList("maps", ".bsp", dirlistBsp, sizeof(dirlistBsp));
ADDRGP4 $417
ARGP4
ADDRGP4 $418
ARGP4
ADDRGP4 $415
ARGP4
CNSTI4 32768
ARGI4
ADDRLP4 428
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 428
INDIRI4
ASGNI4
line 674
;673:
;674:	trap_Cvar_Register( &arenasFile, "g_arenasFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 156
ARGP4
ADDRGP4 $419
ARGP4
ADDRGP4 $272
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 675
;675:	if( *arenasFile.string ) {
ADDRLP4 156+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $420
line 676
;676:		G_LoadArenasFromFile(arenasFile.string, dirlistBsp, numBsps);
ADDRLP4 156+16
ARGP4
ADDRGP4 $415
ARGP4
ADDRLP4 148
INDIRI4
ARGI4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 677
;677:	}
ADDRGP4 $421
JUMPV
LABELV $420
line 678
;678:	else {
line 679
;679:		G_LoadArenasFromFile("scripts/arenas.txt", dirlistBsp, numBsps);
ADDRGP4 $424
ARGP4
ADDRGP4 $415
ARGP4
ADDRLP4 148
INDIRI4
ARGI4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 680
;680:	}
LABELV $421
line 683
;681:
;682:	// get all arenas from .arena files
;683:	numdirs = trap_FS_GetFileList("scripts", ".arena", dirlist, sizeof(dirlist));
ADDRGP4 $425
ARGP4
ADDRGP4 $426
ARGP4
ADDRGP4 $416
ARGP4
CNSTI4 32768
ARGI4
ADDRLP4 432
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 152
ADDRLP4 432
INDIRI4
ASGNI4
line 684
;684:	dirptr  = dirlist;
ADDRLP4 132
ADDRGP4 $416
ASGNP4
line 685
;685:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $430
JUMPV
LABELV $427
line 686
;686:		dirlen = strlen(dirptr);
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 436
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 144
ADDRLP4 436
INDIRU4
CVUI4 4
ASGNI4
line 687
;687:		Q_strncpyz(filename, "scripts/",sizeof(filename));
ADDRLP4 4
ARGP4
ADDRGP4 $431
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 688
;688:		Q_strcat(filename,sizeof(filename), dirptr);
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 689
;689:		G_LoadArenasFromFile(filename, dirlistBsp, numBsps);
ADDRLP4 4
ARGP4
ADDRGP4 $415
ARGP4
ADDRLP4 148
INDIRI4
ARGI4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 690
;690:	}
LABELV $428
line 685
ADDRLP4 436
CNSTI4 1
ASGNI4
ADDRLP4 140
ADDRLP4 140
INDIRI4
ADDRLP4 436
INDIRI4
ADDI4
ASGNI4
ADDRLP4 132
ADDRLP4 144
INDIRI4
ADDRLP4 436
INDIRI4
ADDI4
ADDRLP4 132
INDIRP4
ADDP4
ASGNP4
LABELV $430
ADDRLP4 140
INDIRI4
ADDRLP4 152
INDIRI4
LTI4 $427
line 691
;691:	trap_Printf( va( "%i arenas parsed\n", g_numArenas ) );
ADDRGP4 $432
ARGP4
ADDRGP4 g_numArenas
INDIRI4
ARGI4
ADDRLP4 440
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 440
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 693
;692:	
;693:	for( n = 0; n < g_numArenas; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $436
JUMPV
LABELV $433
line 695
;694:		//Info_SetValueForKey( g_arenaInfos[n], "num", va( "%i", n ) );
;695:		Info_SetValueForKey( g_arenaInfosHashed[n].info, "num", va( "%i", n ) );
ADDRGP4 $439
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 444
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaInfosHashed+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 $438
ARGP4
ADDRLP4 444
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 696
;696:	}
LABELV $434
line 693
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $436
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $433
line 698
;697:
;698:	level.arenasLoaded = qtrue;
ADDRGP4 level+29516
CNSTI4 1
ASGNI4
line 700
;699:
;700:	qsort((void*)g_arenaInfosHashed, g_numArenas, sizeof(g_arenaInfosHashed[0]), arenasort);
ADDRGP4 g_arenaInfosHashed
ARGP4
ADDRGP4 g_numArenas
INDIRI4
CVIU4 4
ARGU4
CNSTU4 12
ARGU4
ADDRGP4 arenasort
ARGP4
ADDRGP4 qsort
CALLV
pop
line 703
;701:
;702:	// after qsort we need to redo the hash table
;703:	memset(g_arenaInfosHashTable, 0, sizeof(g_arenaInfosHashTable));
ADDRGP4 g_arenaInfosHashTable
ARGP4
CNSTI4 0
ARGI4
CNSTU4 4096
ARGU4
ADDRGP4 memset
CALLP4
pop
line 704
;704:	for (n = 0; n < g_numArenas; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $444
JUMPV
LABELV $441
line 705
;705:		hash = generateHashValue(g_arenaInfosHashed[n].name, INFO_HASH_SIZE);
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaInfosHashed
ADDP4
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 444
ADDRGP4 generateHashValue
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 444
INDIRI4
ASGNI4
line 706
;706:		g_arenaInfosHashed[n].next = g_arenaInfosHashTable[hash];
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaInfosHashed+8
ADDP4
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfosHashTable
ADDP4
INDIRP4
ASGNP4
line 707
;707:		g_arenaInfosHashTable[hash] = &g_arenaInfosHashed[n];
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfosHashTable
ADDP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_arenaInfosHashed
ADDP4
ASGNP4
line 708
;708:	}
LABELV $442
line 704
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $444
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $441
line 710
;709:
;710:	G_CheckMapHasArenaInfo();
ADDRGP4 G_CheckMapHasArenaInfo
CALLV
pop
line 712
;711:
;712:	G_RefreshNextMap(g_gametype.integer, qfalse); // this also sets level.hasArenaInfo
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_RefreshNextMap
CALLP4
pop
line 713
;713:}
LABELV $414
endproc G_LoadArenas 448 16
export G_GetArenaInfoByMap
proc G_GetArenaInfoByMap 20 8
line 721
;714:
;715:
;716:/*
;717:===============
;718:G_GetArenaInfoByNumber
;719:===============
;720:*/
;721:infoHashed_t *G_GetArenaInfoByMap( const char *map ) {
line 723
;722:	int				n;
;723:	int				hash = generateHashValue(map,INFO_HASH_SIZE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 12
ADDRGP4 generateHashValue
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 726
;724:	infoHashed_t*	info;
;725:
;726:	for (info = g_arenaInfosHashTable[hash]; info; info = info->next) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfosHashTable
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $451
JUMPV
LABELV $448
line 728
;727:		//if( Q_stricmp( Info_ValueForKey( g_arenaInfos[n], "map" ), map ) == 0 ) {
;728:		if (Q_stricmp(info->name, map) == 0) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $452
line 729
;729:			return info;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $447
JUMPV
LABELV $452
line 731
;730:		}
;731:	}
LABELV $449
line 726
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ASGNP4
LABELV $451
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $448
line 740
;732:
;733:	/*for (n = 0; n < g_numArenas; n++) {
;734:		//if( Q_stricmp( Info_ValueForKey( g_arenaInfos[n], "map" ), map ) == 0 ) {
;735:		if( Q_stricmp( g_arenaInfosHashed[n].name, map ) == 0 ) {
;736:			return &g_arenaInfosHashed[n];
;737:		}
;738:	}*/
;739:
;740:	return NULL;
CNSTP4 0
RETP4
LABELV $447
endproc G_GetArenaInfoByMap 20 8
export G_AddRandomBot
proc G_AddRandomBot 80 20
line 775
;741:}
;742:
;743:#if 0
;744:/*
;745:=================
;746:PlayerIntroSound
;747:=================
;748:*/
;749:static void PlayerIntroSound( const char *modelAndSkin ) {
;750:	char	model[MAX_QPATH];
;751:	char	*skin;
;752:
;753:	Q_strncpyz( model, modelAndSkin, sizeof(model) );
;754:	skin = Q_strrchr( model, '/' );
;755:	if ( skin ) {
;756:		*skin++ = '\0';
;757:	}
;758:	else {
;759:		skin = model;
;760:	}
;761:
;762:	if( Q_stricmp( skin, "default" ) == 0 ) {
;763:		skin = model;
;764:	}
;765:
;766:	trap_SendConsoleCommand( EXEC_APPEND, va( "play sound/player/announce/%s.wav\n", skin ) );
;767:}
;768:#endif
;769:
;770:/*
;771:===============
;772:G_AddRandomBot
;773:===============
;774:*/
;775:void G_AddRandomBot( int team ) {
line 781
;776:	int		i, n, num;
;777:	float	skill;
;778:	char	*value, netname[36], *teamstr;
;779:	gclient_t	*cl;
;780:
;781:	num = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 782
;782:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $458
JUMPV
LABELV $455
line 784
;783:		//value = Info_ValueForKey( g_botInfos[n], "name" );
;784:		value = g_botInfosHashed[n].name;
ADDRLP4 8
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_botInfosHashed
ADDP4
INDIRP4
ASGNP4
line 786
;785:		//
;786:		for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $462
JUMPV
LABELV $459
line 787
;787:			cl = level.clients + i;
ADDRLP4 4
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 788
;788:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $464
line 789
;789:				continue;
ADDRGP4 $460
JUMPV
LABELV $464
line 791
;790:			}
;791:			if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $466
line 792
;792:				continue;
ADDRGP4 $460
JUMPV
LABELV $466
line 794
;793:			}
;794:			if ( team >= 0 && (int)cl->sess.sessionTeam != team ) {
ADDRLP4 64
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
LTI4 $470
ADDRLP4 4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $470
line 795
;795:				continue;
ADDRGP4 $460
JUMPV
LABELV $470
line 797
;796:			}
;797:			if ( !Q_stricmp( value, cl->pers.netname ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $472
line 798
;798:				break;
ADDRGP4 $461
JUMPV
LABELV $472
line 800
;799:			}
;800:		}
LABELV $460
line 786
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $462
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $459
LABELV $461
line 801
;801:		if (i >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $474
line 802
;802:			num++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 803
;803:		}
LABELV $474
line 804
;804:	}
LABELV $456
line 782
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $458
ADDRLP4 12
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $455
line 805
;805:	num = random() * num;
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 64
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 806
;806:	for ( n = 0; n < g_numBots ; n++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $480
JUMPV
LABELV $477
line 808
;807:		//value = Info_ValueForKey( g_botInfos[n], "name" );
;808:		value = g_botInfosHashed[n].name;
ADDRLP4 8
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_botInfosHashed
ADDP4
INDIRP4
ASGNP4
line 810
;809:		//
;810:		for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $484
JUMPV
LABELV $481
line 811
;811:			cl = level.clients + i;
ADDRLP4 4
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 812
;812:			if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $486
line 813
;813:				continue;
ADDRGP4 $482
JUMPV
LABELV $486
line 815
;814:			}
;815:			if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $488
line 816
;816:				continue;
ADDRGP4 $482
JUMPV
LABELV $488
line 818
;817:			}
;818:			if ( team >= 0 && (int)cl->sess.sessionTeam != team ) {
ADDRLP4 68
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
LTI4 $492
ADDRLP4 4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $492
line 819
;819:				continue;
ADDRGP4 $482
JUMPV
LABELV $492
line 821
;820:			}
;821:			if ( !Q_stricmp( value, cl->pers.netname ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $494
line 822
;822:				break;
ADDRGP4 $483
JUMPV
LABELV $494
line 824
;823:			}
;824:		}
LABELV $482
line 810
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $484
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $481
LABELV $483
line 825
;825:		if (i >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $496
line 826
;826:			num--;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 827
;827:			if (num <= 0) {
ADDRLP4 16
INDIRI4
CNSTI4 0
GTI4 $499
line 828
;828:				skill = trap_Cvar_VariableValue( "g_spSkill" );
ADDRGP4 $501
ARGP4
ADDRLP4 68
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 68
INDIRF4
ASGNF4
line 829
;829:				if (team == TEAM_RED) teamstr = "red";
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $502
ADDRLP4 60
ADDRGP4 $504
ASGNP4
ADDRGP4 $503
JUMPV
LABELV $502
line 830
;830:				else if (team == TEAM_BLUE) teamstr = "blue";
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $505
ADDRLP4 60
ADDRGP4 $507
ASGNP4
ADDRGP4 $506
JUMPV
LABELV $505
line 831
;831:				else teamstr = "";
ADDRLP4 60
ADDRGP4 $272
ASGNP4
LABELV $506
LABELV $503
line 832
;832:				Q_strncpyz(netname, value, sizeof(netname));
ADDRLP4 20
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 833
;833:				netname[sizeof(netname)-1] = '\0';
ADDRLP4 20+35
CNSTI1 0
ASGNI1
line 834
;834:				Q_CleanStr(netname, (qboolean)(jk2startversion == VERSION_1_02),qtrue);
ADDRLP4 20
ARGP4
ADDRGP4 jk2startversion
INDIRI4
CNSTI4 2
NEI4 $510
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $511
JUMPV
LABELV $510
ADDRLP4 72
CNSTI4 0
ASGNI4
LABELV $511
ADDRLP4 72
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 835
;835:				trap_SendConsoleCommand( EXEC_INSERT, va("addbot %s %f %s %i\n", netname, skill, teamstr, 0) );
ADDRGP4 $512
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 60
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 836
;836:				return;
ADDRGP4 $454
JUMPV
LABELV $499
line 838
;837:			}
;838:		}
LABELV $496
line 839
;839:	}
LABELV $478
line 806
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $480
ADDRLP4 12
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $477
line 840
;840:}
LABELV $454
endproc G_AddRandomBot 80 20
export G_RemoveRandomBot
proc G_RemoveRandomBot 16 8
line 847
;841:
;842:/*
;843:===============
;844:G_RemoveRandomBot
;845:===============
;846:*/
;847:int G_RemoveRandomBot( int team ) {
line 851
;848:	int i;
;849:	gclient_t	*cl;
;850:
;851:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $517
JUMPV
LABELV $514
line 852
;852:		cl = level.clients + i;
ADDRLP4 4
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 853
;853:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $519
line 854
;854:			continue;
ADDRGP4 $515
JUMPV
LABELV $519
line 856
;855:		}
;856:		if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $521
line 857
;857:			continue;
ADDRGP4 $515
JUMPV
LABELV $521
line 859
;858:		}
;859:		if ( team >= 0 && (int)cl->sess.sessionTeam != team ) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $525
ADDRLP4 4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $525
line 860
;860:			continue;
ADDRGP4 $515
JUMPV
LABELV $525
line 864
;861:		}
;862:
;863:		// Drop the client
;864:		trap_DropClient( i, G_GetStripEdString("SVINGAME","WAS_KICKED") );
ADDRGP4 $527
ARGP4
ADDRGP4 $528
ARGP4
ADDRLP4 12
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 866
;865:
;866:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $513
JUMPV
LABELV $515
line 851
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $517
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $514
line 868
;867:	}
;868:	return qfalse;
CNSTI4 0
RETI4
LABELV $513
endproc G_RemoveRandomBot 16 8
export G_CountHumanPlayers
proc G_CountHumanPlayers 16 0
line 876
;869:}
;870:
;871:/*
;872:===============
;873:G_CountHumanPlayers
;874:===============
;875:*/
;876:int G_CountHumanPlayers( int team ) {
line 880
;877:	int i, num;
;878:	gclient_t	*cl;
;879:
;880:	num = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 881
;881:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $533
JUMPV
LABELV $530
line 882
;882:		cl = level.clients + i;
ADDRLP4 4
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 883
;883:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $535
line 884
;884:			continue;
ADDRGP4 $531
JUMPV
LABELV $535
line 886
;885:		}
;886:		if ( g_entities[i].r.svFlags & SVF_BOT ) {
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $537
line 887
;887:			continue;
ADDRGP4 $531
JUMPV
LABELV $537
line 889
;888:		}
;889:		if ( team >= 0 && (int)cl->sess.sessionTeam != team ) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $541
ADDRLP4 4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $541
line 890
;890:			continue;
ADDRGP4 $531
JUMPV
LABELV $541
line 892
;891:		}
;892:		num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 893
;893:	}
LABELV $531
line 881
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $533
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $530
line 894
;894:	return num;
ADDRLP4 8
INDIRI4
RETI4
LABELV $529
endproc G_CountHumanPlayers 16 0
export G_CountBotPlayers
proc G_CountBotPlayers 20 0
line 902
;895:}
;896:
;897:/*
;898:===============
;899:G_CountBotPlayers
;900:===============
;901:*/
;902:int G_CountBotPlayers( int team ) {
line 906
;903:	int i, n, num;
;904:	gclient_t	*cl;
;905:
;906:	num = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 907
;907:	for ( i=0 ; i< g_maxclients.integer ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $547
JUMPV
LABELV $544
line 908
;908:		cl = level.clients + i;
ADDRLP4 8
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 909
;909:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 8
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $549
line 910
;910:			continue;
ADDRGP4 $545
JUMPV
LABELV $549
line 912
;911:		}
;912:		if ( !(g_entities[i].r.svFlags & SVF_BOT) ) {
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $551
line 913
;913:			continue;
ADDRGP4 $545
JUMPV
LABELV $551
line 915
;914:		}
;915:		if ( team >= 0 && (int)cl->sess.sessionTeam != team ) {
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $555
ADDRLP4 8
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $555
line 916
;916:			continue;
ADDRGP4 $545
JUMPV
LABELV $555
line 918
;917:		}
;918:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 919
;919:	}
LABELV $545
line 907
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $547
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $544
line 920
;920:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $557
line 921
;921:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $561
line 922
;922:			continue;
ADDRGP4 $558
JUMPV
LABELV $561
line 924
;923:		}
;924:		if ( botSpawnQueue[n].spawnTime > level.time ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $564
line 925
;925:			continue;
ADDRGP4 $558
JUMPV
LABELV $564
line 927
;926:		}
;927:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 928
;928:	}
LABELV $558
line 920
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $557
line 929
;929:	return num;
ADDRLP4 12
INDIRI4
RETI4
LABELV $543
endproc G_CountBotPlayers 20 0
bss
align 4
LABELV $569
skip 4
export G_CheckMinimumPlayers
code
proc G_CheckMinimumPlayers 36 4
line 937
;930:}
;931:
;932:/*
;933:===============
;934:G_CheckMinimumPlayers
;935:===============
;936:*/
;937:void G_CheckMinimumPlayers( void ) {
line 942
;938:	int minplayers;
;939:	int humanplayers, botplayers;
;940:	static int checkminimumplayers_time;
;941:
;942:	if (level.intermissiontime) return;
ADDRGP4 level+9028
INDIRI4
CNSTI4 0
EQI4 $570
ADDRGP4 $568
JUMPV
LABELV $570
line 944
;943:	//only check once each 10 seconds
;944:	if (checkminimumplayers_time > level.time - 10000) {
ADDRGP4 $569
INDIRI4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $573
line 945
;945:		return;
ADDRGP4 $568
JUMPV
LABELV $573
line 947
;946:	}
;947:	checkminimumplayers_time = level.time;
ADDRGP4 $569
ADDRGP4 level+36
INDIRI4
ASGNI4
line 948
;948:	trap_Cvar_Update(&bot_minplayers);
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 949
;949:	minplayers = bot_minplayers.integer;
ADDRLP4 0
ADDRGP4 bot_minplayers+12
INDIRI4
ASGNI4
line 950
;950:	if (minplayers <= 0) return;
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $578
ADDRGP4 $568
JUMPV
LABELV $578
line 952
;951:
;952:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $580
line 953
;953:		if (minplayers >= g_maxclients.integer / 2) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 2
DIVI4
LTI4 $583
line 954
;954:			minplayers = (g_maxclients.integer / 2) -1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 1
SUBI4
ASGNI4
line 955
;955:		}
LABELV $583
line 957
;956:
;957:		humanplayers = G_CountHumanPlayers( TEAM_RED );
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 958
;958:		botplayers = G_CountBotPlayers(	TEAM_RED );
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 960
;959:		//
;960:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $587
line 961
;961:			G_AddRandomBot( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 962
;962:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $588
JUMPV
LABELV $587
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $589
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $589
line 963
;963:			G_RemoveRandomBot( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 964
;964:		}
LABELV $589
LABELV $588
line 966
;965:		//
;966:		humanplayers = G_CountHumanPlayers( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRLP4 24
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 967
;967:		botplayers = G_CountBotPlayers( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 969
;968:		//
;969:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $591
line 970
;970:			G_AddRandomBot( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 971
;971:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $581
JUMPV
LABELV $591
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $581
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $581
line 972
;972:			G_RemoveRandomBot( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 973
;973:		}
line 974
;974:	}
ADDRGP4 $581
JUMPV
LABELV $580
line 975
;975:	else if (g_gametype.integer == GT_TOURNAMENT ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $595
line 976
;976:		if (minplayers >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $598
line 977
;977:			minplayers = g_maxclients.integer-1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 978
;978:		}
LABELV $598
line 979
;979:		humanplayers = G_CountHumanPlayers( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 980
;980:		botplayers = G_CountBotPlayers( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 982
;981:		//
;982:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $602
line 983
;983:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 984
;984:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $596
JUMPV
LABELV $602
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $596
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $596
line 986
;985:			// try to remove spectators first
;986:			if (!G_RemoveRandomBot( TEAM_SPECTATOR )) {
CNSTI4 3
ARGI4
ADDRLP4 24
ADDRGP4 G_RemoveRandomBot
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $596
line 988
;987:				// just remove the bot that is playing
;988:				G_RemoveRandomBot( -1 );
CNSTI4 -1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 989
;989:			}
line 990
;990:		}
line 991
;991:	}
ADDRGP4 $596
JUMPV
LABELV $595
line 992
;992:	else if (g_gametype.integer == GT_FFA) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $608
line 993
;993:		if (minplayers >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $611
line 994
;994:			minplayers = g_maxclients.integer-1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 995
;995:		}
LABELV $611
line 996
;996:		humanplayers = G_CountHumanPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 997
;997:		botplayers = G_CountBotPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 999
;998:		//
;999:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $615
line 1000
;1000:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 1001
;1001:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $609
JUMPV
LABELV $615
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $609
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $609
line 1002
;1002:			G_RemoveRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 1003
;1003:		}
line 1004
;1004:	}
ADDRGP4 $609
JUMPV
LABELV $608
line 1005
;1005:	else if (g_gametype.integer == GT_HOLOCRON || g_gametype.integer == GT_JEDIMASTER) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $623
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $619
LABELV $623
line 1006
;1006:		if (minplayers >= g_maxclients.integer) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $624
line 1007
;1007:			minplayers = g_maxclients.integer-1;
ADDRLP4 0
ADDRGP4 g_maxclients+12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1008
;1008:		}
LABELV $624
line 1009
;1009:		humanplayers = G_CountHumanPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1010
;1010:		botplayers = G_CountBotPlayers( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 1012
;1011:		//
;1012:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $628
line 1013
;1013:			G_AddRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 1014
;1014:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $629
JUMPV
LABELV $628
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $630
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $630
line 1015
;1015:			G_RemoveRandomBot( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 1016
;1016:		}
LABELV $630
LABELV $629
line 1017
;1017:	}
LABELV $619
LABELV $609
LABELV $596
LABELV $581
line 1018
;1018:}
LABELV $568
endproc G_CheckMinimumPlayers 36 4
export G_CheckBotSpawn
proc G_CheckBotSpawn 4 8
line 1025
;1019:
;1020:/*
;1021:===============
;1022:G_CheckBotSpawn
;1023:===============
;1024:*/
;1025:void G_CheckBotSpawn( void ) {
line 1028
;1026:	int		n;
;1027:
;1028:	G_CheckMinimumPlayers();
ADDRGP4 G_CheckMinimumPlayers
CALLV
pop
line 1030
;1029:
;1030:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $633
line 1031
;1031:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $637
line 1032
;1032:			continue;
ADDRGP4 $634
JUMPV
LABELV $637
line 1034
;1033:		}
;1034:		if ( botSpawnQueue[n].spawnTime > level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $640
line 1035
;1035:			continue;
ADDRGP4 $634
JUMPV
LABELV $640
line 1037
;1036:		}
;1037:		ClientBegin( botSpawnQueue[n].clientNum, qfalse );
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1038
;1038:		botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 1046
;1039:
;1040:		/*
;1041:		if( g_gametype.integer == GT_SINGLE_PLAYER ) {
;1042:			trap_GetUserinfo( botSpawnQueue[n].clientNum, userinfo, sizeof(userinfo) );
;1043:			PlayerIntroSound( Info_ValueForKey (userinfo, "model") );
;1044:		}
;1045:		*/
;1046:	}
LABELV $634
line 1030
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $633
line 1047
;1047:}
LABELV $632
endproc G_CheckBotSpawn 4 8
proc AddBotToSpawnQueue 4 8
line 1055
;1048:
;1049:
;1050:/*
;1051:===============
;1052:AddBotToSpawnQueue
;1053:===============
;1054:*/
;1055:static void AddBotToSpawnQueue( int clientNum, int delay ) {
line 1058
;1056:	int		n;
;1057:
;1058:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $646
line 1059
;1059:		if( !botSpawnQueue[n].spawnTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $650
line 1060
;1060:			botSpawnQueue[n].spawnTime = level.time + delay;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 1061
;1061:			botSpawnQueue[n].clientNum = clientNum;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1062
;1062:			return;
ADDRGP4 $645
JUMPV
LABELV $650
line 1064
;1063:		}
;1064:	}
LABELV $647
line 1058
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $646
line 1066
;1065:
;1066:	G_Printf( S_COLOR_YELLOW "Unable to delay spawn\n" );
ADDRGP4 $655
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1067
;1067:	ClientBegin( clientNum, qfalse );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1068
;1068:}
LABELV $645
endproc AddBotToSpawnQueue 4 8
export G_RemoveQueuedBotBegin
proc G_RemoveQueuedBotBegin 4 0
line 1079
;1069:
;1070:
;1071:/*
;1072:===============
;1073:G_RemoveQueuedBotBegin
;1074:
;1075:Called on client disconnect to make sure the delayed spawn
;1076:doesn't happen on a freed index
;1077:===============
;1078:*/
;1079:void G_RemoveQueuedBotBegin( int clientNum ) {
line 1082
;1080:	int		n;
;1081:
;1082:	for( n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $657
line 1083
;1083:		if( botSpawnQueue[n].clientNum == clientNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $661
line 1084
;1084:			botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 1085
;1085:			return;
ADDRGP4 $656
JUMPV
LABELV $661
line 1087
;1086:		}
;1087:	}
LABELV $658
line 1082
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $657
line 1088
;1088:}
LABELV $656
endproc G_RemoveQueuedBotBegin 4 0
export G_BotConnect
proc G_BotConnect 1336 12
line 1096
;1089:
;1090:
;1091:/*
;1092:===============
;1093:G_BotConnect
;1094:===============
;1095:*/
;1096:qboolean G_BotConnect( int clientNum, qboolean restart ) {
line 1100
;1097:	bot_settings_t	settings;
;1098:	char			userinfo[MAX_INFO_STRING];
;1099:
;1100:	trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1102
;1101:
;1102:	Q_strncpyz( settings.personalityfile, Info_ValueForKey( userinfo, "personality" ), sizeof(settings.personalityfile) );
ADDRLP4 292
ARGP4
ADDRGP4 $665
ARGP4
ADDRLP4 1316
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1316
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1103
;1103:	settings.skill = atof( Info_ValueForKey( userinfo, "skill" ) );
ADDRLP4 292
ARGP4
ADDRGP4 $667
ARGP4
ADDRLP4 1320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1320
INDIRP4
ARGP4
ADDRLP4 1324
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0+144
ADDRLP4 1324
INDIRF4
ASGNF4
line 1104
;1104:	Q_strncpyz( settings.team, Info_ValueForKey( userinfo, "team" ), sizeof(settings.team) );
ADDRLP4 292
ARGP4
ADDRGP4 $669
ARGP4
ADDRLP4 1328
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0+148
ARGP4
ADDRLP4 1328
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1106
;1105:
;1106:	if (!BotAISetupClient( clientNum, &settings, restart )) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1332
ADDRGP4 BotAISetupClient
CALLI4
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 0
NEI4 $671
line 1107
;1107:		trap_DropClient( clientNum, "BotAISetupClient failed" );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $673
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 1108
;1108:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $664
JUMPV
LABELV $671
line 1111
;1109:	}
;1110:
;1111:	return qtrue;
CNSTI4 1
RETI4
LABELV $664
endproc G_BotConnect 1336 12
proc G_AddBot 1140 12
line 1120
;1112:}
;1113:
;1114:
;1115:/*
;1116:===============
;1117:G_AddBot
;1118:===============
;1119:*/
;1120:static void G_AddBot( const char *name, float skill, const char *team, int delay, char *altname) {
line 1133
;1121:	int				clientNum;
;1122:	infoHashed_t	*botinfo;
;1123:	gentity_t		*bot;
;1124:	char			*key;
;1125:	char			*s;
;1126:	char			*botname;
;1127:	char			*model;
;1128://	char			*headmodel;
;1129:	char			userinfo[MAX_INFO_STRING];
;1130:	team_t			preTeam;
;1131:
;1132:	// get the botinfo from bots.txt
;1133:	botinfo = G_GetBotInfoByName( name );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 G_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1056
INDIRP4
ASGNP4
line 1134
;1134:	if ( !botinfo ) {
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $675
line 1135
;1135:		G_Printf( S_COLOR_RED "Error: Bot '%s' not defined\n", name );
ADDRGP4 $677
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1136
;1136:		return;
ADDRGP4 $674
JUMPV
LABELV $675
line 1140
;1137:	}
;1138:
;1139:	// create the bot's userinfo
;1140:	userinfo[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 1142
;1141:
;1142:	botname = Info_ValueForKey( botinfo->info, "funname" );
ADDRLP4 1032
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRGP4 $678
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1060
INDIRP4
ASGNP4
line 1143
;1143:	if( !botname[0] ) {
ADDRLP4 1048
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $679
line 1144
;1144:		botname = Info_ValueForKey( botinfo->info, "name" );
ADDRLP4 1032
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRGP4 $681
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1064
INDIRP4
ASGNP4
line 1145
;1145:	}
LABELV $679
line 1147
;1146:	// check for an alternative name
;1147:	if (altname && altname[0]) {
ADDRLP4 1064
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $682
ADDRLP4 1064
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $682
line 1148
;1148:		botname = altname;
ADDRLP4 1048
ADDRFP4 16
INDIRP4
ASGNP4
line 1149
;1149:	}
LABELV $682
line 1150
;1150:	Info_SetValueForKey( userinfo, "name", botname );
ADDRLP4 0
ARGP4
ADDRGP4 $681
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1151
;1151:	Info_SetValueForKey( userinfo, "rate", "25000" );
ADDRLP4 0
ARGP4
ADDRGP4 $684
ARGP4
ADDRGP4 $685
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1152
;1152:	Info_SetValueForKey( userinfo, "snaps", "20" );
ADDRLP4 0
ARGP4
ADDRGP4 $686
ARGP4
ADDRGP4 $687
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1153
;1153:	Info_SetValueForKey( userinfo, "skill", va("%1.2f", skill) );
ADDRGP4 $688
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $667
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1155
;1154:
;1155:	if ( skill >= 1 && skill < 2 ) {
ADDRLP4 1072
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1072
INDIRF4
CNSTF4 1065353216
LTF4 $689
ADDRLP4 1072
INDIRF4
CNSTF4 1073741824
GEF4 $689
line 1156
;1156:		Info_SetValueForKey( userinfo, "handicap", "50" );
ADDRLP4 0
ARGP4
ADDRGP4 $691
ARGP4
ADDRGP4 $692
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1157
;1157:	}
ADDRGP4 $690
JUMPV
LABELV $689
line 1158
;1158:	else if ( skill >= 2 && skill < 3 ) {
ADDRLP4 1076
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1076
INDIRF4
CNSTF4 1073741824
LTF4 $693
ADDRLP4 1076
INDIRF4
CNSTF4 1077936128
GEF4 $693
line 1159
;1159:		Info_SetValueForKey( userinfo, "handicap", "70" );
ADDRLP4 0
ARGP4
ADDRGP4 $691
ARGP4
ADDRGP4 $695
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1160
;1160:	}
ADDRGP4 $694
JUMPV
LABELV $693
line 1161
;1161:	else if ( skill >= 3 && skill < 4 ) {
ADDRLP4 1080
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1080
INDIRF4
CNSTF4 1077936128
LTF4 $696
ADDRLP4 1080
INDIRF4
CNSTF4 1082130432
GEF4 $696
line 1162
;1162:		Info_SetValueForKey( userinfo, "handicap", "90" );
ADDRLP4 0
ARGP4
ADDRGP4 $691
ARGP4
ADDRGP4 $698
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1163
;1163:	}
LABELV $696
LABELV $694
LABELV $690
line 1165
;1164:
;1165:	key = "model";
ADDRLP4 1024
ADDRGP4 $699
ASGNP4
line 1166
;1166:	model = Info_ValueForKey( botinfo->info, key );
ADDRLP4 1032
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1084
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1084
INDIRP4
ASGNP4
line 1167
;1167:	if ( !*model ) {
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $700
line 1168
;1168:		model = "visor/default";
ADDRLP4 1044
ADDRGP4 $702
ASGNP4
line 1169
;1169:	}
LABELV $700
line 1170
;1170:	Info_SetValueForKey( userinfo, key, model );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1171
;1171:	key = "team_model";
ADDRLP4 1024
ADDRGP4 $703
ASGNP4
line 1172
;1172:	Info_SetValueForKey( userinfo, key, model );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1183
;1173:
;1174:/*	key = "headmodel";
;1175:	headmodel = Info_ValueForKey( botinfo, key );
;1176:	if ( !*headmodel ) {
;1177:		headmodel = model;
;1178:	}
;1179:	Info_SetValueForKey( userinfo, key, headmodel );
;1180:	key = "team_headmodel";
;1181:	Info_SetValueForKey( userinfo, key, headmodel );
;1182:*/
;1183:	key = "gender";
ADDRLP4 1024
ADDRGP4 $704
ASGNP4
line 1184
;1184:	s = Info_ValueForKey( botinfo->info, key );
ADDRLP4 1032
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1088
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1088
INDIRP4
ASGNP4
line 1185
;1185:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $705
line 1186
;1186:		s = "male";
ADDRLP4 1028
ADDRGP4 $707
ASGNP4
line 1187
;1187:	}
LABELV $705
line 1188
;1188:	Info_SetValueForKey( userinfo, "sex", s );
ADDRLP4 0
ARGP4
ADDRGP4 $708
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1190
;1189:
;1190:	key = "color1";
ADDRLP4 1024
ADDRGP4 $709
ASGNP4
line 1191
;1191:	s = Info_ValueForKey( botinfo->info, key );
ADDRLP4 1032
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1092
INDIRP4
ASGNP4
line 1192
;1192:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $710
line 1193
;1193:		s = "4";
ADDRLP4 1028
ADDRGP4 $712
ASGNP4
line 1194
;1194:	}
LABELV $710
line 1195
;1195:	Info_SetValueForKey( userinfo, key, s );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1197
;1196:
;1197:	key = "color2";
ADDRLP4 1024
ADDRGP4 $713
ASGNP4
line 1198
;1198:	s = Info_ValueForKey( botinfo->info, key );
ADDRLP4 1032
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1096
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1096
INDIRP4
ASGNP4
line 1199
;1199:	if ( !*s ) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $714
line 1200
;1200:		s = "5";
ADDRLP4 1028
ADDRGP4 $716
ASGNP4
line 1201
;1201:	}
LABELV $714
line 1202
;1202:	Info_SetValueForKey( userinfo, key, s );
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1204
;1203:
;1204:	s = Info_ValueForKey(botinfo->info, "personality");
ADDRLP4 1032
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRGP4 $665
ARGP4
ADDRLP4 1100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1100
INDIRP4
ASGNP4
line 1205
;1205:	if (!*s )
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $717
line 1206
;1206:	{
line 1207
;1207:		Info_SetValueForKey( userinfo, "personality", "botfiles/default.jkb" );
ADDRLP4 0
ARGP4
ADDRGP4 $665
ARGP4
ADDRGP4 $719
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1208
;1208:	}
ADDRGP4 $718
JUMPV
LABELV $717
line 1210
;1209:	else
;1210:	{
line 1211
;1211:		Info_SetValueForKey( userinfo, "personality", s );
ADDRLP4 0
ARGP4
ADDRGP4 $665
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1212
;1212:	}
LABELV $718
line 1215
;1213:
;1214:	// have the server allocate a client slot
;1215:	clientNum = trap_BotAllocateClient();
ADDRLP4 1104
ADDRGP4 trap_BotAllocateClient
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1104
INDIRI4
ASGNI4
line 1216
;1216:	if ( clientNum == -1 ) {
ADDRLP4 1036
INDIRI4
CNSTI4 -1
NEI4 $720
line 1219
;1217://		G_Printf( S_COLOR_RED "Unable to add bot.  All player slots are in use.\n" );
;1218://		G_Printf( S_COLOR_RED "Start server with more 'open' slots.\n" );
;1219:		trap_SendServerCommand( -1, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "UNABLE_TO_ADD_BOT")));
ADDRGP4 $527
ARGP4
ADDRGP4 $723
ARGP4
ADDRLP4 1108
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $722
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1220
;1220:		return;
ADDRGP4 $674
JUMPV
LABELV $720
line 1224
;1221:	}
;1222:
;1223:	// initialize the bot settings
;1224:	if( !team || !*team ) {
ADDRLP4 1108
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $726
ADDRLP4 1108
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $724
LABELV $726
line 1225
;1225:		if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $727
line 1226
;1226:			if( PickTeam(clientNum) == TEAM_RED) {
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 1
NEI4 $730
line 1227
;1227:				team = "red";
ADDRFP4 8
ADDRGP4 $504
ASGNP4
line 1228
;1228:			}
ADDRGP4 $728
JUMPV
LABELV $730
line 1229
;1229:			else {
line 1230
;1230:				team = "blue";
ADDRFP4 8
ADDRGP4 $507
ASGNP4
line 1231
;1231:			}
line 1232
;1232:		}
ADDRGP4 $728
JUMPV
LABELV $727
line 1233
;1233:		else {
line 1234
;1234:			team = "red";
ADDRFP4 8
ADDRGP4 $504
ASGNP4
line 1235
;1235:		}
LABELV $728
line 1236
;1236:	}
LABELV $724
line 1238
;1237://	Info_SetValueForKey( userinfo, "characterfile", Info_ValueForKey( botinfo, "aifile" ) );
;1238:	Info_SetValueForKey( userinfo, "skill", va( "%5.2f", skill ) );
ADDRGP4 $732
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $667
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1239
;1239:	Info_SetValueForKey( userinfo, "team", team );
ADDRLP4 0
ARGP4
ADDRGP4 $669
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1241
;1240:
;1241:	bot = &g_entities[ clientNum ];
ADDRLP4 1040
CNSTI4 2352
ADDRLP4 1036
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1242
;1242:	bot->r.svFlags |= SVF_BOT;
ADDRLP4 1116
ADDRLP4 1040
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1243
;1243:	bot->inuse = qtrue;
ADDRLP4 1040
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 1246
;1244:
;1245:	// register the userinfo
;1246:	trap_SetUserinfo( clientNum, userinfo );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 1248
;1247:
;1248:	if (g_gametype.integer >= GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $733
line 1249
;1249:	{
line 1250
;1250:		if (team && Q_stricmp(team, "red") == 0)
ADDRLP4 1120
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $736
ADDRLP4 1120
INDIRP4
ARGP4
ADDRGP4 $504
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $736
line 1251
;1251:		{
line 1252
;1252:			bot->client->sess.sessionTeam = TEAM_RED;
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
CNSTI4 1
ASGNI4
line 1253
;1253:		}
ADDRGP4 $737
JUMPV
LABELV $736
line 1254
;1254:		else if (team && Q_stricmp(team, "blue") == 0)
ADDRLP4 1128
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $738
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 $507
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $738
line 1255
;1255:		{
line 1256
;1256:			bot->client->sess.sessionTeam = TEAM_BLUE;
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
CNSTI4 2
ASGNI4
line 1257
;1257:		}
ADDRGP4 $739
JUMPV
LABELV $738
line 1259
;1258:		else
;1259:		{
line 1260
;1260:			bot->client->sess.sessionTeam = PickTeam( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 1136
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
ADDRLP4 1136
INDIRI4
ASGNI4
line 1261
;1261:		}
LABELV $739
LABELV $737
line 1262
;1262:	}
LABELV $733
line 1264
;1263:
;1264:	preTeam = bot->client->sess.sessionTeam;
ADDRLP4 1052
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 1267
;1265:
;1266:	// have it connect to the game as a normal client
;1267:	if ( ClientConnect( clientNum, qtrue, qtrue ) ) {
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1120
CNSTI4 1
ASGNI4
ADDRLP4 1120
INDIRI4
ARGI4
ADDRLP4 1120
INDIRI4
ARGI4
ADDRLP4 1124
ADDRGP4 ClientConnect
CALLP4
ASGNP4
ADDRLP4 1124
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $740
line 1268
;1268:		return;
ADDRGP4 $674
JUMPV
LABELV $740
line 1271
;1269:	}
;1270:
;1271:	if (bot->client->sess.sessionTeam != preTeam)
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRLP4 1052
INDIRI4
EQI4 $742
line 1272
;1272:	{
line 1273
;1273:		trap_GetUserinfo(clientNum, userinfo, MAX_INFO_STRING);
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1275
;1274:
;1275:		if (bot->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $744
line 1276
;1276:		{
line 1277
;1277:			bot->client->sess.sessionTeam = preTeam;
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 1278
;1278:		}
LABELV $744
line 1280
;1279:
;1280:		if (bot->client->sess.sessionTeam == TEAM_RED)
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $746
line 1281
;1281:		{
line 1282
;1282:			team = "Red";
ADDRFP4 8
ADDRGP4 $748
ASGNP4
line 1283
;1283:		}
ADDRGP4 $747
JUMPV
LABELV $746
line 1285
;1284:		else
;1285:		{
line 1286
;1286:			team = "Blue";
ADDRFP4 8
ADDRGP4 $749
ASGNP4
line 1287
;1287:		}
LABELV $747
line 1289
;1288:
;1289:		Info_SetValueForKey( userinfo, "team", team );
ADDRLP4 0
ARGP4
ADDRGP4 $669
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1291
;1290:
;1291:		trap_SetUserinfo( clientNum, userinfo );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 1293
;1292:
;1293:		bot->client->ps.persistant[ PERS_TEAM ] = bot->client->sess.sessionTeam;
ADDRLP4 1128
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 1128
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 1295
;1294:
;1295:		G_ReadSessionData( bot->client );
ADDRLP4 1040
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 1296
;1296:		ClientUserinfoChanged( clientNum );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 1297
;1297:	}
LABELV $742
line 1299
;1298:
;1299:	if( delay == 0 ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $750
line 1300
;1300:		ClientBegin( clientNum, qfalse );
ADDRLP4 1036
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1301
;1301:		return;
ADDRGP4 $674
JUMPV
LABELV $750
line 1304
;1302:	}
;1303:
;1304:	AddBotToSpawnQueue( clientNum, delay );
ADDRLP4 1036
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 AddBotToSpawnQueue
CALLV
pop
line 1305
;1305:}
LABELV $674
endproc G_AddBot 1140 12
export Svcmd_AddBot_f
proc Svcmd_AddBot_f 4112 20
line 1313
;1306:
;1307:
;1308:/*
;1309:===============
;1310:Svcmd_AddBot_f
;1311:===============
;1312:*/
;1313:void Svcmd_AddBot_f( void ) {
line 1322
;1314:	float			skill;
;1315:	int				delay;
;1316:	char			name[MAX_TOKEN_CHARS];
;1317:	char			altname[MAX_TOKEN_CHARS];
;1318:	char			string[MAX_TOKEN_CHARS];
;1319:	char			team[MAX_TOKEN_CHARS];
;1320:
;1321:	// are bots enabled?
;1322:	if ( !trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $755
ARGP4
ADDRLP4 4104
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4104
INDIRI4
CNSTI4 0
NEI4 $753
line 1323
;1323:		return;
ADDRGP4 $752
JUMPV
LABELV $753
line 1327
;1324:	}
;1325:
;1326:	// name
;1327:	trap_Argv( 1, name, sizeof( name ) );
CNSTI4 1
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1328
;1328:	if ( !name[0] ) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $756
line 1329
;1329:		trap_Printf( "Usage: Addbot <botname> [skill 1-5] [team] [msec delay] [altname]\n" );
ADDRGP4 $758
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 1330
;1330:		return;
ADDRGP4 $752
JUMPV
LABELV $756
line 1334
;1331:	}
;1332:
;1333:	// skill
;1334:	trap_Argv( 2, string, sizeof( string ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1335
;1335:	if ( !string[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $759
line 1336
;1336:		skill = 4;
ADDRLP4 4096
CNSTF4 1082130432
ASGNF4
line 1337
;1337:	}
ADDRGP4 $760
JUMPV
LABELV $759
line 1338
;1338:	else {
line 1339
;1339:		skill = atof( string );
ADDRLP4 0
ARGP4
ADDRLP4 4108
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4096
ADDRLP4 4108
INDIRF4
ASGNF4
line 1340
;1340:	}
LABELV $760
line 1343
;1341:
;1342:	// team
;1343:	trap_Argv( 3, team, sizeof( team ) );
CNSTI4 3
ARGI4
ADDRLP4 3072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1346
;1344:
;1345:	// delay
;1346:	trap_Argv( 4, string, sizeof( string ) );
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1347
;1347:	if ( !string[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $761
line 1348
;1348:		delay = 0;
ADDRLP4 4100
CNSTI4 0
ASGNI4
line 1349
;1349:	}
ADDRGP4 $762
JUMPV
LABELV $761
line 1350
;1350:	else {
line 1351
;1351:		delay = atoi( string );
ADDRLP4 0
ARGP4
ADDRLP4 4108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4100
ADDRLP4 4108
INDIRI4
ASGNI4
line 1352
;1352:	}
LABELV $762
line 1355
;1353:
;1354:	// alternative name
;1355:	trap_Argv( 5, altname, sizeof( altname ) );
CNSTI4 5
ARGI4
ADDRLP4 2048
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1357
;1356:
;1357:	G_AddBot( name, skill, team, delay, altname );
ADDRLP4 1024
ARGP4
ADDRLP4 4096
INDIRF4
ARGF4
ADDRLP4 3072
ARGP4
ADDRLP4 4100
INDIRI4
ARGI4
ADDRLP4 2048
ARGP4
ADDRGP4 G_AddBot
CALLV
pop
line 1361
;1358:
;1359:	// if this was issued during gameplay and we are playing locally,
;1360:	// go ahead and load the bot's media immediately
;1361:	if ( level.time - level.startTime > 1000 &&
ADDRGP4 level+36
INDIRI4
ADDRGP4 level+48
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $763
ADDRGP4 $767
ARGP4
ADDRLP4 4108
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4108
INDIRI4
CNSTI4 0
EQI4 $763
line 1362
;1362:		trap_Cvar_VariableIntegerValue( "cl_running" ) ) {
line 1363
;1363:		trap_SendServerCommand( -1, "loaddefered\n" );	// FIXME: spelled wrong, but not changing for demo
CNSTI4 -1
ARGI4
ADDRGP4 $768
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1364
;1364:	}
LABELV $763
line 1365
;1365:}
LABELV $752
endproc Svcmd_AddBot_f 4112 20
export Svcmd_BotList_f
proc Svcmd_BotList_f 4116 20
line 1372
;1366:
;1367:/*
;1368:===============
;1369:Svcmd_BotList_f
;1370:===============
;1371:*/
;1372:void Svcmd_BotList_f( void ) {
line 1379
;1373:	int i;
;1374:	char name[MAX_TOKEN_CHARS];
;1375:	char funname[MAX_TOKEN_CHARS];
;1376:	char model[MAX_TOKEN_CHARS];
;1377:	char personality[MAX_TOKEN_CHARS];
;1378:
;1379:	trap_Printf("^1name             model            personality              funname\n");
ADDRGP4 $770
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 1380
;1380:	for (i = 0; i < g_numBots; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $774
JUMPV
LABELV $771
line 1382
;1381:		//Q_strncpyz(name, Info_ValueForKey( g_botInfos[i], "name" ));
;1382:		Q_strncpyz(name, g_botInfosHashed[i].name,sizeof(name));
ADDRLP4 4
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_botInfosHashed
ADDP4
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1383
;1383:		if ( !*name ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $775
line 1384
;1384:			Q_strncpyz(name, "Padawan", sizeof(name));
ADDRLP4 4
ARGP4
ADDRGP4 $777
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1385
;1385:		}
LABELV $775
line 1386
;1386:		Q_strncpyz(funname, Info_ValueForKey(g_botInfosHashed[i].info, "funname" ),sizeof(funname));
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_botInfosHashed+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 $678
ARGP4
ADDRLP4 4100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ARGP4
ADDRLP4 4100
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1387
;1387:		if ( !*funname ) {
ADDRLP4 1028
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $779
line 1388
;1388:			Q_strncpyz(funname, "", sizeof(funname));
ADDRLP4 1028
ARGP4
ADDRGP4 $272
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1389
;1389:		}
LABELV $779
line 1390
;1390:		Q_strncpyz(model, Info_ValueForKey(g_botInfosHashed[i].info, "model" ),sizeof(model));
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_botInfosHashed+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 $699
ARGP4
ADDRLP4 4104
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2052
ARGP4
ADDRLP4 4104
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1391
;1391:		if ( !*model ) {
ADDRLP4 2052
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $782
line 1392
;1392:			Q_strncpyz(model, "visor/default",sizeof(model));
ADDRLP4 2052
ARGP4
ADDRGP4 $702
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1393
;1393:		}
LABELV $782
line 1394
;1394:		Q_strncpyz(personality, Info_ValueForKey(g_botInfosHashed[i].info, "personality"),sizeof(personality));
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_botInfosHashed+4
ADDP4
INDIRP4
ARGP4
ADDRGP4 $665
ARGP4
ADDRLP4 4108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 3076
ARGP4
ADDRLP4 4108
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1395
;1395:		if (!*personality ) {
ADDRLP4 3076
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $785
line 1396
;1396:			Q_strncpyz(personality, "botfiles/default.jkb", sizeof(personality));
ADDRLP4 3076
ARGP4
ADDRGP4 $719
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1397
;1397:		}
LABELV $785
line 1398
;1398:		trap_Printf(va("%-16s %-16s %-20s %-20s\n", name, model, personality, funname));
ADDRGP4 $787
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2052
ARGP4
ADDRLP4 3076
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 4112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4112
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 1399
;1399:	}
LABELV $772
line 1380
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $774
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $771
line 1400
;1400:}
LABELV $769
endproc Svcmd_BotList_f 4116 20
proc G_LoadBotsFromFile 8216 28
line 1467
;1401:
;1402:#if 0
;1403:/*
;1404:===============
;1405:G_SpawnBots
;1406:===============
;1407:*/
;1408:static void G_SpawnBots( char *botList, int baseDelay ) {
;1409:	char		*bot;
;1410:	char		*p;
;1411:	float		skill;
;1412:	int			delay;
;1413:	char		bots[MAX_INFO_VALUE];
;1414:
;1415:	podium1 = NULL;
;1416:	podium2 = NULL;
;1417:	podium3 = NULL;
;1418:
;1419:	skill = trap_Cvar_VariableValue( "g_spSkill" );
;1420:	if( skill < 1 ) {
;1421:		trap_Cvar_Set( "g_spSkill", "1" );
;1422:		skill = 1;
;1423:	}
;1424:	else if ( skill > 5 ) {
;1425:		trap_Cvar_Set( "g_spSkill", "5" );
;1426:		skill = 5;
;1427:	}
;1428:
;1429:	Q_strncpyz( bots, botList, sizeof(bots) );
;1430:	p = &bots[0];
;1431:	delay = baseDelay;
;1432:	while( *p ) {
;1433:		//skip spaces
;1434:		while( *p && *p == ' ' ) {
;1435:			p++;
;1436:		}
;1437:		if( !p ) {
;1438:			break;
;1439:		}
;1440:
;1441:		// mark start of bot name
;1442:		bot = p;
;1443:
;1444:		// skip until space of null
;1445:		while( *p && *p != ' ' ) {
;1446:			p++;
;1447:		}
;1448:		if( *p ) {
;1449:			*p++ = 0;
;1450:		}
;1451:
;1452:		// we must add the bot this way, calling G_AddBot directly at this stage
;1453:		// does "Bad Things"
;1454:		trap_SendConsoleCommand( EXEC_INSERT, va("addbot %s %f free %i\n", bot, skill, delay) );
;1455:
;1456:		delay += BOT_BEGIN_DELAY_INCREMENT;
;1457:	}
;1458:}
;1459:#endif
;1460:
;1461:
;1462:/*
;1463:===============
;1464:G_LoadBotsFromFile
;1465:===============
;1466:*/
;1467:static void G_LoadBotsFromFile( char *filename ) {
line 1472
;1468:	int				len;
;1469:	fileHandle_t	f;
;1470:	char			buf[MAX_BOTS_TEXT];
;1471:
;1472:	len = trap_FS_FOpenFile( filename, &f, FS_READ );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 1473
;1473:	if ( !f ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $789
line 1474
;1474:		trap_Printf( va( S_COLOR_RED "file not found: %s\n", filename ) );
ADDRGP4 $204
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 1475
;1475:		return;
ADDRGP4 $788
JUMPV
LABELV $789
line 1477
;1476:	}
;1477:	if ( len >= MAX_BOTS_TEXT ) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $791
line 1478
;1478:		trap_Printf( va( S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_BOTS_TEXT ) );
ADDRGP4 $207
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 1479
;1479:		trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1480
;1480:		return;
ADDRGP4 $788
JUMPV
LABELV $791
line 1483
;1481:	}
;1482:
;1483:	trap_FS_Read( buf, len, f );
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 1484
;1484:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 1485
;1485:	trap_FS_FCloseFile( f );
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1487
;1486:
;1487:	g_numBots += G_ParseInfos( buf, MAX_BOTS - g_numBots, &g_botInfosHashed[g_numBots], g_botInfosHashTable, "name", NULL, 0);
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 g_numBots
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
CNSTI4 12
ADDRLP4 8208
INDIRI4
MULI4
ADDRGP4 g_botInfosHashed
ADDP4
ARGP4
ADDRGP4 g_botInfosHashTable
ARGP4
ADDRGP4 $681
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8212
ADDRGP4 G_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 1488
;1488:}
LABELV $788
endproc G_LoadBotsFromFile 8216 28
proc G_LoadBots 1456 16
line 1495
;1489:
;1490:/*
;1491:===============
;1492:G_LoadBots
;1493:===============
;1494:*/
;1495:static void G_LoadBots( void ) {
line 1504
;1496:	vmCvar_t	botsFile;
;1497:	int			numdirs;
;1498:	char		filename[128];
;1499:	char		dirlist[1024];
;1500:	char*		dirptr;
;1501:	int			i;
;1502:	int			dirlen;
;1503:
;1504:	if ( !trap_Cvar_VariableIntegerValue( "bot_enable" ) ) {
ADDRGP4 $755
ARGP4
ADDRLP4 1440
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 1440
INDIRI4
CNSTI4 0
NEI4 $794
line 1505
;1505:		return;
ADDRGP4 $793
JUMPV
LABELV $794
line 1508
;1506:	}
;1507:
;1508:	g_numBots = 0;
ADDRGP4 g_numBots
CNSTI4 0
ASGNI4
line 1510
;1509:
;1510:	trap_Cvar_Register( &botsFile, "g_botsFile", "", CVAR_INIT|CVAR_ROM );
ADDRLP4 144
ARGP4
ADDRGP4 $796
ARGP4
ADDRGP4 $272
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1511
;1511:	if( *botsFile.string ) {
ADDRLP4 144+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $797
line 1512
;1512:		G_LoadBotsFromFile(botsFile.string);
ADDRLP4 144+16
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 1513
;1513:	}
ADDRGP4 $798
JUMPV
LABELV $797
line 1514
;1514:	else {
line 1516
;1515:		//G_LoadBotsFromFile("scripts/bots.txt");
;1516:		G_LoadBotsFromFile("botfiles/bots.txt");
ADDRGP4 $801
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 1517
;1517:	}
LABELV $798
line 1520
;1518:
;1519:	// get all bots from .bot files
;1520:	numdirs = trap_FS_GetFileList("scripts", ".bot", dirlist, 1024 );
ADDRGP4 $425
ARGP4
ADDRGP4 $802
ARGP4
ADDRLP4 416
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1444
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 1444
INDIRI4
ASGNI4
line 1521
;1521:	dirptr  = dirlist;
ADDRLP4 128
ADDRLP4 416
ASGNP4
line 1522
;1522:	for (i = 0; i < numdirs; i++, dirptr += dirlen+1) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $806
JUMPV
LABELV $803
line 1523
;1523:		dirlen = strlen(dirptr);
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 1448
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 136
ADDRLP4 1448
INDIRU4
CVUI4 4
ASGNI4
line 1524
;1524:		Q_strncpyz(filename, "scripts/",sizeof(filename));
ADDRLP4 0
ARGP4
ADDRGP4 $431
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1525
;1525:		Q_strcat(filename,sizeof(filename), dirptr);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1526
;1526:		G_LoadBotsFromFile(filename);
ADDRLP4 0
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 1527
;1527:	}
LABELV $804
line 1522
ADDRLP4 1448
CNSTI4 1
ASGNI4
ADDRLP4 132
ADDRLP4 132
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ASGNI4
ADDRLP4 128
ADDRLP4 136
INDIRI4
ADDRLP4 1448
INDIRI4
ADDI4
ADDRLP4 128
INDIRP4
ADDP4
ASGNP4
LABELV $806
ADDRLP4 132
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $803
line 1528
;1528:	trap_Printf( va( "%i bots parsed\n", g_numBots ) );
ADDRGP4 $807
ARGP4
ADDRGP4 g_numBots
INDIRI4
ARGI4
ADDRLP4 1452
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 1529
;1529:}
LABELV $793
endproc G_LoadBots 1456 16
export G_GetBotInfoByNumber
proc G_GetBotInfoByNumber 8 8
line 1538
;1530:
;1531:
;1532:
;1533:/*
;1534:===============
;1535:G_GetBotInfoByNumber
;1536:===============
;1537:*/
;1538:char *G_GetBotInfoByNumber( int num ) {
line 1539
;1539:	if( num < 0 || num >= g_numBots ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $811
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $809
LABELV $811
line 1540
;1540:		trap_Printf( va( S_COLOR_RED "Invalid bot number: %i\n", num ) );
ADDRGP4 $812
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Printf
CALLV
pop
line 1541
;1541:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $808
JUMPV
LABELV $809
line 1543
;1542:	}
;1543:	return g_botInfosHashed[num].info;
CNSTI4 12
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_botInfosHashed+4
ADDP4
INDIRP4
RETP4
LABELV $808
endproc G_GetBotInfoByNumber 8 8
export G_GetBotInfoByName
proc G_GetBotInfoByName 20 8
line 1552
;1544:}
;1545:
;1546:
;1547:/*
;1548:===============
;1549:G_GetBotInfoByName
;1550:===============
;1551:*/
;1552:infoHashed_t *G_GetBotInfoByName( const char *name ) {
line 1554
;1553:	int				n;
;1554:	int				hash = generateHashValue(name, INFO_HASH_SIZE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 12
ADDRGP4 generateHashValue
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 1557
;1555:	infoHashed_t*	info;
;1556:
;1557:	for (info = g_botInfosHashTable[hash]; info; info = info->next) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfosHashTable
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $818
JUMPV
LABELV $815
line 1559
;1558:		//if( Q_stricmp( Info_ValueForKey( g_arenaInfos[n], "map" ), map ) == 0 ) {
;1559:		if (Q_stricmp(info->name, name) == 0) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $819
line 1560
;1560:			return info;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $814
JUMPV
LABELV $819
line 1562
;1561:		}
;1562:	}
LABELV $816
line 1557
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ASGNP4
LABELV $818
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $815
line 1570
;1563:	/*for (n = 0; n < g_numBots; n++) {
;1564:		value = g_botInfosHashed[n].name;
;1565:		if ( !Q_stricmp( value, name ) ) {
;1566:			return &g_botInfosHashed[n];
;1567:		}
;1568:	}*/
;1569:
;1570:	return NULL;
CNSTP4 0
RETP4
LABELV $814
endproc G_GetBotInfoByName 20 8
export G_InitBots
proc G_InitBots 0 16
line 1582
;1571:}
;1572:
;1573://rww - pd
;1574:void LoadPath_ThisLevel(void);
;1575://end rww
;1576:
;1577:/*
;1578:===============
;1579:G_InitBots
;1580:===============
;1581:*/
;1582:void G_InitBots( qboolean restart ) {
line 1583
;1583:	G_LoadBots();
ADDRGP4 G_LoadBots
CALLV
pop
line 1584
;1584:	G_LoadMapBlacklists();
ADDRGP4 G_LoadMapBlacklists
CALLV
pop
line 1585
;1585:	G_LoadArenas();
ADDRGP4 G_LoadArenas
CALLV
pop
line 1587
;1586:
;1587:	trap_Cvar_Register( &bot_minplayers, "bot_minplayers", "0", CVAR_SERVERINFO );
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 $822
ARGP4
ADDRGP4 $823
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1590
;1588:
;1589:	//rww - new bot route stuff
;1590:	LoadPath_ThisLevel();
ADDRGP4 LoadPath_ThisLevel
CALLV
pop
line 1592
;1591:	//end rww
;1592:}
LABELV $821
endproc G_InitBots 0 16
import LoadPath_ThisLevel
import podium3
import podium2
import podium1
bss
export bot_minplayers
align 4
LABELV bot_minplayers
skip 272
align 4
LABELV botSpawnQueue
skip 128
export g_blacklistedMaps
align 4
LABELV g_blacklistedMaps
skip 49152
export g_numBlacklistedMaps
align 4
LABELV g_numBlacklistedMaps
skip 4
export g_botInfosHashed
align 4
LABELV g_botInfosHashed
skip 12288
align 4
LABELV g_numBots
skip 4
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
import BotInterbreedEndMatch
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
import G_InsertRun
import trap_G_COOL_API_GetFileVersion
import trap_G_COOL_API_AttachG2Model
import trap_G_COOL_API_GetSurfaceRenderStatus
import trap_G_COOL_API_SkinlessModel
import trap_G_COOL_API_SetSkin
import trap_G_COOL_API_GiveMeVectorFromMatrix
import trap_G_COOL_API_GetLanguageName
import trap_G_COOL_API_GetNumLanguages
import G_COOL_API_DB_GetMoreResults
import G_COOL_API_DB_PreparedBindNull
import G_COOL_API_DB_GetBinary
import G_COOL_API_DB_FinishAndSendPreparedStatement
import G_COOL_API_DB_PreparedBindBinary
import G_COOL_API_DB_PreparedBindInt
import G_COOL_API_DB_PreparedBindFloat
import G_COOL_API_DB_PreparedBindString
import G_COOL_API_DB_AddPreparedStatement
import G_COOL_API_DB_GetString
import G_COOL_API_DB_GetFloat
import G_COOL_API_DB_GetInt
import G_COOL_API_DB_NextRow
import G_COOL_API_DB_GetReference
import G_COOL_API_DB_NextResponse
import G_COOL_API_DB_AddRequestTyped
import G_COOL_API_DB_AddRequest
import G_COOL_API_DB_EscapeString
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
import G_DB_Init
import G_DB_VerifyUsername
import G_DB_CheckResponses
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
export g_arenaInfosHashed
align 4
LABELV g_arenaInfosHashed
skip 49152
export g_numArenas
align 4
LABELV g_numArenas
skip 4
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
LABELV $823
byte 1 48
byte 1 0
align 1
LABELV $822
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $812
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $807
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $802
byte 1 46
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $801
byte 1 98
byte 1 111
byte 1 116
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $796
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $787
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $777
byte 1 80
byte 1 97
byte 1 100
byte 1 97
byte 1 119
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $770
byte 1 94
byte 1 49
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $768
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $767
byte 1 99
byte 1 108
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $758
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 65
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 60
byte 1 98
byte 1 111
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 32
byte 1 91
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 49
byte 1 45
byte 1 53
byte 1 93
byte 1 32
byte 1 91
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 93
byte 1 32
byte 1 91
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 93
byte 1 32
byte 1 91
byte 1 97
byte 1 108
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $755
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $749
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $748
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $732
byte 1 37
byte 1 53
byte 1 46
byte 1 50
byte 1 102
byte 1 0
align 1
LABELV $723
byte 1 85
byte 1 78
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 95
byte 1 84
byte 1 79
byte 1 95
byte 1 65
byte 1 68
byte 1 68
byte 1 95
byte 1 66
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $722
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $719
byte 1 98
byte 1 111
byte 1 116
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 106
byte 1 107
byte 1 98
byte 1 0
align 1
LABELV $716
byte 1 53
byte 1 0
align 1
LABELV $713
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $712
byte 1 52
byte 1 0
align 1
LABELV $709
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $708
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $707
byte 1 109
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $704
byte 1 103
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $703
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $702
byte 1 118
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $699
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $698
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $695
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $692
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $691
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $688
byte 1 37
byte 1 49
byte 1 46
byte 1 50
byte 1 102
byte 1 0
align 1
LABELV $687
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $686
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $685
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $684
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $681
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $678
byte 1 102
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $677
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 66
byte 1 111
byte 1 116
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $673
byte 1 66
byte 1 111
byte 1 116
byte 1 65
byte 1 73
byte 1 83
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $669
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $667
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $665
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $655
byte 1 94
byte 1 51
byte 1 85
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $528
byte 1 87
byte 1 65
byte 1 83
byte 1 95
byte 1 75
byte 1 73
byte 1 67
byte 1 75
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $527
byte 1 83
byte 1 86
byte 1 73
byte 1 78
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $512
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $507
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $504
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $501
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $439
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $438
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $432
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $431
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $426
byte 1 46
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $425
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $424
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $419
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $418
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 0
align 1
LABELV $417
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $413
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 65
byte 1 100
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 98
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 47
byte 1 95
byte 1 98
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 37
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 32
byte 1 40
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $412
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 66
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 105
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
byte 1 44
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 98
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 47
byte 1 95
byte 1 98
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 37
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $405
byte 1 109
byte 1 97
byte 1 112
byte 1 98
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 47
byte 1 95
byte 1 98
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 37
byte 1 100
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $401
byte 1 10
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $400
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
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 44
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 32
byte 1 119
byte 1 101
byte 1 114
byte 1 101
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 40
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 97
byte 1 118
byte 1 111
byte 1 105
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 112
byte 1 101
byte 1 115
byte 1 41
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $393
byte 1 121
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $392
byte 1 121
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 95
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $391
byte 1 121
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 95
byte 1 115
byte 1 119
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $390
byte 1 121
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 95
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $389
byte 1 121
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 95
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 121
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $388
byte 1 121
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 95
byte 1 99
byte 1 97
byte 1 110
byte 1 121
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $387
byte 1 118
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $386
byte 1 112
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $385
byte 1 110
byte 1 115
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 101
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $384
byte 1 110
byte 1 115
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 112
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $383
byte 1 110
byte 1 115
byte 1 95
byte 1 104
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $382
byte 1 107
byte 1 101
byte 1 106
byte 1 105
byte 1 109
byte 1 95
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $381
byte 1 107
byte 1 101
byte 1 106
byte 1 105
byte 1 109
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $380
byte 1 100
byte 1 111
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $379
byte 1 100
byte 1 111
byte 1 111
byte 1 109
byte 1 95
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $378
byte 1 100
byte 1 111
byte 1 111
byte 1 109
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 0
align 1
LABELV $377
byte 1 99
byte 1 97
byte 1 105
byte 1 114
byte 1 110
byte 1 95
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $376
byte 1 99
byte 1 97
byte 1 105
byte 1 114
byte 1 110
byte 1 95
byte 1 100
byte 1 111
byte 1 99
byte 1 107
byte 1 49
byte 1 0
align 1
LABELV $375
byte 1 99
byte 1 97
byte 1 105
byte 1 114
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $374
byte 1 99
byte 1 97
byte 1 105
byte 1 114
byte 1 110
byte 1 95
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 109
byte 1 98
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $373
byte 1 98
byte 1 101
byte 1 115
byte 1 112
byte 1 105
byte 1 110
byte 1 95
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $372
byte 1 98
byte 1 101
byte 1 115
byte 1 112
byte 1 105
byte 1 110
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 101
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $371
byte 1 98
byte 1 101
byte 1 115
byte 1 112
byte 1 105
byte 1 110
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 0
align 1
LABELV $370
byte 1 97
byte 1 114
byte 1 116
byte 1 117
byte 1 115
byte 1 95
byte 1 116
byte 1 111
byte 1 112
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $369
byte 1 97
byte 1 114
byte 1 116
byte 1 117
byte 1 115
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $368
byte 1 97
byte 1 114
byte 1 116
byte 1 117
byte 1 115
byte 1 95
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $367
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 121
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $366
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 114
byte 1 97
byte 1 118
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $365
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 110
byte 1 115
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 101
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $364
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 110
byte 1 115
byte 1 95
byte 1 104
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $363
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 101
byte 1 114
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $362
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $361
byte 1 102
byte 1 102
byte 1 97
byte 1 95
byte 1 98
byte 1 101
byte 1 115
byte 1 112
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $360
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $359
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 95
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $358
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 95
byte 1 112
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $357
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 95
byte 1 106
byte 1 101
byte 1 100
byte 1 105
byte 1 0
align 1
LABELV $356
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 95
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $355
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 114
byte 1 98
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $354
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 95
byte 1 98
byte 1 101
byte 1 115
byte 1 112
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $353
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 95
byte 1 98
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $352
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 121
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $351
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 110
byte 1 115
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 101
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $350
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 101
byte 1 114
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $349
byte 1 99
byte 1 116
byte 1 102
byte 1 95
byte 1 98
byte 1 101
byte 1 115
byte 1 112
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $345
byte 1 37
byte 1 100
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $342
byte 1 109
byte 1 97
byte 1 112
byte 1 98
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $337
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $336
byte 1 109
byte 1 97
byte 1 112
byte 1 98
byte 1 108
byte 1 97
byte 1 99
byte 1 107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $311
byte 1 94
byte 1 51
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $297
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $296
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 48
byte 1 0
align 1
LABELV $295
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $272
byte 1 0
align 1
LABELV $271
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $248
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $235
byte 1 99
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $232
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $229
byte 1 115
byte 1 97
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $226
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $223
byte 1 106
byte 1 101
byte 1 100
byte 1 105
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $220
byte 1 104
byte 1 111
byte 1 108
byte 1 111
byte 1 99
byte 1 114
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $217
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $211
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $207
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $204
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $201
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 58
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 59
byte 1 32
byte 1 0
align 1
LABELV $195
byte 1 94
byte 1 51
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 58
byte 1 32
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
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $191
byte 1 94
byte 1 51
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 58
byte 1 32
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
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $187
byte 1 94
byte 1 51
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 100
byte 1 117
byte 1 112
byte 1 101
byte 1 46
byte 1 32
byte 1 83
byte 1 107
byte 1 105
byte 1 112
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $173
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $172
byte 1 92
byte 1 110
byte 1 117
byte 1 109
byte 1 92
byte 1 0
align 1
LABELV $167
byte 1 94
byte 1 51
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 58
byte 1 32
byte 1 68
byte 1 105
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 32
byte 1 83
byte 1 107
byte 1 105
byte 1 112
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $155
byte 1 47
byte 1 0
align 1
LABELV $152
byte 1 37
byte 1 115
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 0
align 1
LABELV $151
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $148
byte 1 60
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 62
byte 1 0
align 1
LABELV $145
byte 1 125
byte 1 0
align 1
LABELV $142
byte 1 85
byte 1 110
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $136
byte 1 77
byte 1 97
byte 1 120
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $133
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $132
byte 1 123
byte 1 0
