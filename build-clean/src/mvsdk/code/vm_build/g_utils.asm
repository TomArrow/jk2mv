data
export remapCount
align 4
LABELV remapCount
byte 4 0
export AddRemap
code
proc AddRemap 8 12
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_utils.c"
line 18
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_utils.c -- misc utility functions for game module
;4:
;5:#include "g_local.h"
;6:
;7:typedef struct {
;8:  char oldShader[MAX_QPATH];
;9:  char newShader[MAX_QPATH];
;10:  float timeOffset;
;11:} shaderRemap_t;
;12:
;13:#define MAX_SHADER_REMAPS 128
;14:
;15:int remapCount = 0;
;16:shaderRemap_t remappedShaders[MAX_SHADER_REMAPS];
;17:
;18:void AddRemap(const char *oldShader, const char *newShader, float timeOffset) {
line 21
;19:	int i;
;20:
;21:	for (i = 0; i < remapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $127
JUMPV
LABELV $124
line 22
;22:		if (Q_stricmp(oldShader, remappedShaders[i].oldShader) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $128
line 24
;23:			// found it, just update this one
;24:			Q_strncpyz(remappedShaders[i].newShader,newShader,sizeof(remappedShaders[i].newShader));
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 25
;25:			remappedShaders[i].timeOffset = timeOffset;
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 remappedShaders+128
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 26
;26:			return;
ADDRGP4 $123
JUMPV
LABELV $128
line 28
;27:		}
;28:	}
LABELV $125
line 21
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $127
ADDRLP4 0
INDIRI4
ADDRGP4 remapCount
INDIRI4
LTI4 $124
line 29
;29:	if (remapCount < MAX_SHADER_REMAPS) {
ADDRGP4 remapCount
INDIRI4
CNSTI4 128
GEI4 $133
line 30
;30:		Q_strncpyz(remappedShaders[remapCount].newShader,newShader,sizeof(remappedShaders[remapCount].newShader));
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 31
;31:		Q_strncpyz(remappedShaders[remapCount].oldShader,oldShader,sizeof(remappedShaders[remapCount].oldShader));
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 32
;32:		remappedShaders[remapCount].timeOffset = timeOffset;
CNSTI4 132
ADDRGP4 remapCount
INDIRI4
MULI4
ADDRGP4 remappedShaders+128
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 33
;33:		remapCount++;
ADDRLP4 4
ADDRGP4 remapCount
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 34
;34:	}
LABELV $133
line 35
;35:}
LABELV $123
endproc AddRemap 8 12
bss
align 1
LABELV $139
skip 4096
export BuildShaderStateConfig
code
proc BuildShaderStateConfig 144 24
line 37
;36:
;37:const char *BuildShaderStateConfig(void) {
line 42
;38:	static char	buff[MAX_STRING_CHARS*4];
;39:	char out[(MAX_QPATH * 2) + 5];
;40:	int i;
;41:  
;42:	memset(buff, 0, MAX_STRING_CHARS);
ADDRGP4 $139
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1024
ARGU4
ADDRGP4 memset
CALLP4
pop
line 43
;43:	for (i = 0; i < remapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $140
line 44
;44:		Com_sprintf(out, (MAX_QPATH * 2) + 5, "%s=%s:%5.2f@", remappedShaders[i].oldShader, remappedShaders[i].newShader, remappedShaders[i].timeOffset);
ADDRLP4 4
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 $144
ARGP4
ADDRLP4 140
CNSTI4 132
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRLP4 140
INDIRI4
ADDRGP4 remappedShaders+128
ADDP4
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
line 45
;45:		Q_strcat( buff, sizeof( buff ), out);
ADDRGP4 $139
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 46
;46:	}
LABELV $141
line 43
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $143
ADDRLP4 0
INDIRI4
ADDRGP4 remapCount
INDIRI4
LTI4 $140
line 47
;47:	return buff;
ADDRGP4 $139
RETP4
LABELV $138
endproc BuildShaderStateConfig 144 24
export G_FindConfigstringIndex
proc G_FindConfigstringIndex 1036 12
line 64
;48:}
;49:
;50:/*
;51:=========================================================================
;52:
;53:model / sound configstring indexes
;54:
;55:=========================================================================
;56:*/
;57:
;58:/*
;59:================
;60:G_FindConfigstringIndex
;61:
;62:================
;63:*/
;64:int G_FindConfigstringIndex( char *name, int start, int max, qboolean create ) {
line 68
;65:	int		i;
;66:	char	s[MAX_STRING_CHARS];
;67:
;68:	if ( !name || !name[0] ) {
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $150
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $148
LABELV $150
line 69
;69:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $148
line 72
;70:	}
;71:
;72:	for ( i=1 ; i<max ; i++ ) {
ADDRLP4 1024
CNSTI4 1
ASGNI4
ADDRGP4 $154
JUMPV
LABELV $151
line 73
;73:		trap_GetConfigstring( start + i, s, sizeof( s ) );
ADDRFP4 4
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 74
;74:		if ( !s[0] ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $155
line 75
;75:			break;
ADDRGP4 $153
JUMPV
LABELV $155
line 77
;76:		}
;77:		if ( !strcmp( s, name ) ) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $157
line 78
;78:			return i;
ADDRLP4 1024
INDIRI4
RETI4
ADDRGP4 $147
JUMPV
LABELV $157
line 80
;79:		}
;80:	}
LABELV $152
line 72
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $154
ADDRLP4 1024
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $151
LABELV $153
line 82
;81:
;82:	if ( !create ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $159
line 83
;83:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $147
JUMPV
LABELV $159
line 86
;84:	}
;85:
;86:	if ( i == max ) {
ADDRLP4 1024
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $161
line 87
;87:		G_Error( "G_FindConfigstringIndex: overflow" );
ADDRGP4 $163
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 88
;88:	}
LABELV $161
line 90
;89:
;90:	trap_SetConfigstring( start + i, name );
ADDRFP4 4
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 92
;91:
;92:	return i;
ADDRLP4 1024
INDIRI4
RETI4
LABELV $147
endproc G_FindConfigstringIndex 1036 12
export G_SkinIndex
proc G_SkinIndex 4 16
line 99
;93:}
;94:
;95:/*
;96:Ghoul2 Insert Start
;97:*/
;98:
;99:int G_SkinIndex( char *name ) {
line 100
;100:	return G_FindConfigstringIndex (name, CS_CHARSKINS, MAX_CHARSKINS, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 576
ARGI4
CNSTI4 64
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $164
endproc G_SkinIndex 4 16
export G_ModelIndex
proc G_ModelIndex 4 16
line 106
;101:}
;102:/*
;103:Ghoul2 Insert End
;104:*/
;105:
;106:int G_ModelIndex( char *name ) {
line 107
;107:	return G_FindConfigstringIndex (name, CS_MODELS, MAX_MODELS, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
CNSTI4 256
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $165
endproc G_ModelIndex 4 16
export G_SoundIndex
proc G_SoundIndex 4 16
line 110
;108:}
;109:
;110:int G_SoundIndex( char *name ) {
line 111
;111:	return G_FindConfigstringIndex (name, CS_SOUNDS, MAX_SOUNDS, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 288
ARGI4
CNSTI4 256
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $166
endproc G_SoundIndex 4 16
export G_EffectIndex
proc G_EffectIndex 4 16
line 115
;112:}
;113:
;114:int G_EffectIndex( char *name )
;115:{
line 116
;116:	return G_FindConfigstringIndex (name, CS_EFFECTS, MAX_FX, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 768
ARGI4
CNSTI4 64
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $167
endproc G_EffectIndex 4 16
export G_TeamCommand
proc G_TeamCommand 8 12
line 129
;117:}
;118:
;119://=====================================================================
;120:
;121:
;122:/*
;123:================
;124:G_TeamCommand
;125:
;126:Broadcasts a command to only a specific team
;127:================
;128:*/
;129:void G_TeamCommand( team_t team, char *cmd ) {
line 132
;130:	int		i;
;131:
;132:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $172
JUMPV
LABELV $169
line 133
;133:		if ( level.clients[i].pers.connected == CON_CONNECTED ) {
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $174
line 134
;134:			if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $176
line 135
;135:				G_SendServerCommand( i, va("%s", cmd ),qtrue);
ADDRGP4 $178
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 136
;136:			}
LABELV $176
line 137
;137:		}
LABELV $174
line 138
;138:	}
LABELV $170
line 132
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $172
ADDRLP4 0
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $169
line 139
;139:}
LABELV $168
endproc G_TeamCommand 8 12
export G_GetClassNameHash
proc G_GetClassNameHash 4 8
line 141
;140:
;141:int G_GetClassNameHash(const char* match) {
line 142
;142:	return generateHashValue(match, ENTITY_HASH_SIZE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 0
ADDRGP4 generateHashValue
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $179
endproc G_GetClassNameHash 4 8
export G_FindByClassName
proc G_FindByClassName 24 8
line 146
;143:}
;144:
;145:// uses hashtable
;146:gentity_t* G_FindByClassName(gentity_t* from, const char* match) {
line 148
;147:	int				n;
;148:	int				hash = generateHashValue(match, ENTITY_HASH_SIZE);
ADDRFP4 4
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
line 151
;149:	gentity_t*		hashEnt;
;150:
;151:	for (hashEnt = g_entitiesHashTable[hash]; hashEnt; hashEnt = hashEnt->nextHashed) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_entitiesHashTable
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $184
JUMPV
LABELV $181
line 152
;152:		if (hashEnt > from && Q_stricmp(hashEnt->classname, match) == 0) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
LEU4 $185
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $185
line 153
;153:			return hashEnt;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $180
JUMPV
LABELV $185
line 155
;154:		}
;155:	}
LABELV $182
line 151
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2332
ADDP4
INDIRP4
ASGNP4
LABELV $184
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $181
line 157
;156:
;157:	return NULL;
CNSTP4 0
RETP4
LABELV $180
endproc G_FindByClassName 24 8
export G_FindByClassNameFast
proc G_FindByClassNameFast 16 8
line 162
;158:}
;159:
;160:// uses hashtable
;161:// call this one if you are continuing a search with the same classname (hash doesnt need to be recalculated)
;162:gentity_t* G_FindByClassNameFast(gentity_t* from, const char* match) {
line 166
;163:	int				n;
;164:	gentity_t*		hashEnt;
;165:
;166:	if (!from) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $188
line 167
;167:		int	hash = generateHashValue(match, ENTITY_HASH_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 12
ADDRGP4 generateHashValue
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 168
;168:		hashEnt = g_entitiesHashTable[hash];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_entitiesHashTable
ADDP4
INDIRP4
ASGNP4
line 169
;169:	}
ADDRGP4 $193
JUMPV
LABELV $188
line 170
;170:	else {
line 171
;171:		hashEnt = from->nextHashed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2332
ADDP4
INDIRP4
ASGNP4
line 172
;172:	}
line 174
;173:
;174:	for (; hashEnt; hashEnt = hashEnt->nextHashed) {
ADDRGP4 $193
JUMPV
LABELV $190
line 175
;175:		if (Q_stricmp(hashEnt->classname, match) == 0) {
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $194
line 176
;176:			return hashEnt;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $187
JUMPV
LABELV $194
line 178
;177:		}
;178:	}
LABELV $191
line 174
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2332
ADDP4
INDIRP4
ASGNP4
LABELV $193
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $190
line 180
;179:
;180:	return NULL;
CNSTP4 0
RETP4
LABELV $187
endproc G_FindByClassNameFast 16 8
export G_Find
proc G_Find 12 8
line 197
;181:}
;182:
;183:
;184:/*
;185:=============
;186:G_Find
;187:
;188:Searches all active entities for the next one that holds
;189:the matching string at fieldofs (use the FOFS() macro) in the structure.
;190:
;191:Searches beginning at the entity after from, or the beginning if NULL
;192:NULL will be returned if the end of the list is reached.
;193:
;194:=============
;195:*/
;196:gentity_t *G_Find (gentity_t *from, int fieldofs, const char *match)
;197:{
line 201
;198:	char	*s;
;199:	int idx;
;200:
;201:	if (!from)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $197
line 202
;202:		from = g_entities;
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $198
JUMPV
LABELV $197
line 204
;203:	else
;204:		from++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2352
ADDP4
ASGNP4
LABELV $198
line 206
;205:
;206:	idx = from - g_entities;
ADDRLP4 4
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
line 207
;207:	if (idx >= MAX_GENTITIES)
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $205
line 208
;208:		goto dological;
ADDRGP4 $216
JUMPV
line 210
;209:
;210:	for ( ; from < &g_entities[level.num_entities] ; from++)
LABELV $202
line 211
;211:	{
line 212
;212:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $207
line 213
;213:			continue;
ADDRGP4 $203
JUMPV
LABELV $207
line 214
;214:		s = *(char **) ((byte *)from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 215
;215:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $209
line 216
;216:			continue;
ADDRGP4 $203
JUMPV
LABELV $209
line 217
;217:		if (!Q_stricmp (s, match))
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $211
line 218
;218:			return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $196
JUMPV
LABELV $211
line 219
;219:	}
LABELV $203
line 210
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2352
ADDP4
ASGNP4
LABELV $205
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2352
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
LTU4 $202
line 220
;220:	from = &g_logicalents[0]; // 1st logical entity
ADDRFP4 0
ADDRGP4 g_logicalents
INDIRP4
ASGNP4
line 222
;221:dological:
;222:	for (; from < &g_logicalents[level.num_logicalents]; from++)
ADDRGP4 $216
JUMPV
LABELV $213
line 223
;223:	{
line 224
;224:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $218
line 225
;225:			continue;
ADDRGP4 $214
JUMPV
LABELV $218
line 226
;226:		s = *(char**)((byte*)from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 227
;227:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $220
line 228
;228:			continue;
ADDRGP4 $214
JUMPV
LABELV $220
line 229
;229:		if (!Q_stricmp(s, match))
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $222
line 230
;230:			return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $196
JUMPV
LABELV $222
line 231
;231:	}
LABELV $214
line 222
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2352
ADDP4
ASGNP4
LABELV $216
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTI4 2352
ADDRGP4 level+16
INDIRI4
MULI4
ADDRGP4 g_logicalents
INDIRP4
ADDP4
CVPU4 4
LTU4 $213
line 233
;232:
;233:	return NULL;
CNSTP4 0
RETP4
LABELV $196
endproc G_Find 12 8
export G_RadiusList
proc G_RadiusList 4176 16
line 244
;234:}
;235:
;236:
;237:
;238:/*
;239:============
;240:G_RadiusList - given an origin and a radius, return all entities that are in use that are within the list
;241:============
;242:*/
;243:int G_RadiusList ( vec3_t origin, float radius,	gentity_t *ignore, qboolean takeDamage, gentity_t *ent_list[MAX_GENTITIES])					  
;244:{
line 252
;245:	float		dist;
;246:	gentity_t	*ent;
;247:	int			entityList[MAX_GENTITIES];
;248:	int			numListedEntities;
;249:	vec3_t		mins, maxs;
;250:	vec3_t		v;
;251:	int			i, e;
;252:	int			ent_count = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 254
;253:
;254:	if ( radius < 1 ) 
ADDRFP4 4
INDIRF4
CNSTF4 1065353216
GEF4 $225
line 255
;255:	{
line 256
;256:		radius = 1;
ADDRFP4 4
CNSTF4 1065353216
ASGNF4
line 257
;257:	}
LABELV $225
line 259
;258:
;259:	for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $227
line 260
;260:	{
line 261
;261:		mins[i] = origin[i] - radius;
ADDRLP4 4156
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4156
INDIRI4
ADDRLP4 4132
ADDP4
ADDRLP4 4156
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
ASGNF4
line 262
;262:		maxs[i] = origin[i] + radius;
ADDRLP4 4160
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4160
INDIRI4
ADDRLP4 4144
ADDP4
ADDRLP4 4160
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 4
INDIRF4
ADDF4
ASGNF4
line 263
;263:	}
LABELV $228
line 259
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $227
line 265
;264:
;265:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 4132
ARGP4
ADDRLP4 4144
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4156
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4128
ADDRLP4 4156
INDIRI4
ASGNI4
line 267
;266:
;267:	for ( e = 0 ; e < numListedEntities ; e++ ) 
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $234
JUMPV
LABELV $231
line 268
;268:	{
line 269
;269:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 271
;270:
;271:		if ((ent == ignore) || !(ent->inuse) || ent->takedamage != takeDamage)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $238
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $238
ADDRLP4 4
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRFP4 12
INDIRI4
EQI4 $235
LABELV $238
line 272
;272:			continue;
ADDRGP4 $232
JUMPV
LABELV $235
line 275
;273:
;274:		// find the distance from the edge of the bounding box
;275:		for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $239
line 276
;276:		{
line 277
;277:			if ( origin[i] < ent->r.absmin[i] ) 
ADDRLP4 4164
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4164
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4164
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
GEF4 $243
line 278
;278:			{
line 279
;279:				v[i] = ent->r.absmin[i] - origin[i];
ADDRLP4 4168
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4168
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4168
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 4168
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 280
;280:			} else if ( origin[i] > ent->r.absmax[i] ) 
ADDRGP4 $244
JUMPV
LABELV $243
ADDRLP4 4168
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4168
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4168
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
LEF4 $245
line 281
;281:			{
line 282
;282:				v[i] = origin[i] - ent->r.absmax[i];
ADDRLP4 4172
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4172
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4172
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4172
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 283
;283:			} else 
ADDRGP4 $246
JUMPV
LABELV $245
line 284
;284:			{
line 285
;285:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 286
;286:			}
LABELV $246
LABELV $244
line 287
;287:		}
LABELV $240
line 275
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $239
line 289
;288:
;289:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 4164
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 4164
INDIRF4
ASGNF4
line 290
;290:		if ( dist >= radius ) 
ADDRLP4 28
INDIRF4
ADDRFP4 4
INDIRF4
LTF4 $247
line 291
;291:		{
line 292
;292:			continue;
ADDRGP4 $232
JUMPV
LABELV $247
line 296
;293:		}
;294:		
;295:		// ok, we are within the radius, add us to the incoming list
;296:		ent_list[ent_count] = ent;
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 297
;297:		ent_count++;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 299
;298:
;299:	}
LABELV $232
line 267
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $234
ADDRLP4 20
INDIRI4
ADDRLP4 4128
INDIRI4
LTI4 $231
line 301
;300:	// we are done, return how many we found
;301:	return(ent_count);
ADDRLP4 24
INDIRI4
RETI4
LABELV $224
endproc G_RadiusList 4176 16
export G_PickTarget
proc G_PickTarget 144 12
line 316
;302:}
;303:
;304:
;305:
;306:/*
;307:=============
;308:G_PickTarget
;309:
;310:Selects a random entity from among the targets
;311:=============
;312:*/
;313:#define MAXCHOICES	32
;314:
;315:gentity_t *G_PickTarget (char *targetname, qboolean allowRandom, int* numChoices)
;316:{
line 317
;317:	gentity_t	*ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 318
;318:	int		num_choices = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 321
;319:	gentity_t	*choice[MAXCHOICES];
;320:
;321:	if (!targetname)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $254
line 322
;322:	{
line 323
;323:		G_Printf("G_PickTarget called with NULL targetname\n");
ADDRGP4 $252
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 324
;324:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $249
JUMPV
LABELV $253
line 328
;325:	}
;326:
;327:	while(1)
;328:	{
line 329
;329:		ent = G_Find (ent, FOFS(targetname), targetname);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 596
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 136
INDIRP4
ASGNP4
line 330
;330:		if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $256
line 331
;331:			break;
ADDRGP4 $255
JUMPV
LABELV $256
line 332
;332:		choice[num_choices++] = ent;
ADDRLP4 140
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 333
;333:		if (num_choices == MAXCHOICES)
ADDRLP4 4
INDIRI4
CNSTI4 32
NEI4 $258
line 334
;334:			break;
ADDRGP4 $255
JUMPV
LABELV $258
line 335
;335:	}
LABELV $254
line 327
ADDRGP4 $253
JUMPV
LABELV $255
line 337
;336:
;337:	if (numChoices) { // inform the caller how many there were
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $260
line 338
;338:		*numChoices = num_choices;
ADDRFP4 8
INDIRP4
ADDRLP4 4
INDIRI4
ASGNI4
line 339
;339:	}
LABELV $260
line 341
;340:
;341:	if (!num_choices)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $262
line 342
;342:	{
line 343
;343:		G_Printf("G_PickTarget: target %s not found\n", targetname);
ADDRGP4 $264
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 344
;344:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $249
JUMPV
LABELV $262
line 346
;345:	}
;346:	if (!allowRandom) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $265
line 347
;347:		return choice[0];
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $249
JUMPV
LABELV $265
line 350
;348:	} 
;349:
;350:	return choice[rand() % num_choices];
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $249
endproc G_PickTarget 144 12
export G_UseTargets
proc G_UseTargets 24 12
line 365
;351:}
;352:
;353:
;354:/*
;355:==============================
;356:G_UseTargets
;357:
;358:"activator" should be set to the entity that initiated the firing.
;359:
;360:Search for (string)targetname in all entities that
;361:match (string)self.target and call their .use function
;362:
;363:==============================
;364:*/
;365:void G_UseTargets( gentity_t *ent, gentity_t *activator ) {
line 368
;366:	gentity_t		*t;
;367:	
;368:	if ( !ent ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $268
line 369
;369:		return;
ADDRGP4 $267
JUMPV
LABELV $268
line 372
;370:	}
;371:
;372:	if (ent->targetShaderName && ent->targetShaderNewName) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $270
ADDRLP4 4
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $270
line 373
;373:		float f = level.time * 0.001;
ADDRLP4 12
CNSTF4 981668463
ADDRGP4 level+36
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 374
;374:		AddRemap(ent->targetShaderName, ent->targetShaderNewName, f);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 608
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRGP4 AddRemap
CALLV
pop
line 375
;375:		trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
ADDRLP4 20
ADDRGP4 BuildShaderStateConfig
CALLP4
ASGNP4
CNSTI4 24
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 376
;376:	}
LABELV $270
line 378
;377:
;378:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $273
line 379
;379:		return;
ADDRGP4 $267
JUMPV
LABELV $273
line 382
;380:	}
;381:
;382:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $276
JUMPV
LABELV $275
line 383
;383:	while ( (t = G_Find (t, FOFS(targetname), ent->target)) != NULL ) {
line 384
;384:		if ( t == ent ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $278
line 385
;385:			G_Printf ("WARNING: Entity used itself.\n");
ADDRGP4 $280
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 386
;386:		} else {
ADDRGP4 $279
JUMPV
LABELV $278
line 387
;387:			if ( t->use ) {
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $281
line 388
;388:				t->use (t, ent, activator);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CALLV
pop
line 389
;389:			}
LABELV $281
line 390
;390:		}
LABELV $279
line 391
;391:		if ( !ent->inuse ) {
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $283
line 392
;392:			G_Printf("entity was removed while using targets\n");
ADDRGP4 $285
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 393
;393:			return;
ADDRGP4 $267
JUMPV
LABELV $283
line 395
;394:		}
;395:	}
LABELV $276
line 383
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 596
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_Find
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
NEU4 $275
line 396
;396:}
LABELV $267
endproc G_UseTargets 24 12
bss
align 4
LABELV $287
skip 4
align 4
LABELV $288
skip 96
export tv
code
proc tv 8 0
line 407
;397:
;398:
;399:/*
;400:=============
;401:TempVector
;402:
;403:This is just a convenience function
;404:for making temporary vectors for function calls
;405:=============
;406:*/
;407:float	*tv( float x, float y, float z ) {
line 414
;408:	static	int		index;
;409:	static	vec3_t	vecs[8];
;410:	float	*v;
;411:
;412:	// use an array so that multiple tempvectors won't collide
;413:	// for a while
;414:	v = vecs[index];
ADDRLP4 0
CNSTI4 12
ADDRGP4 $287
INDIRI4
MULI4
ADDRGP4 $288
ADDP4
ASGNP4
line 415
;415:	index = (index + 1)&7;
ADDRLP4 4
ADDRGP4 $287
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 7
BANDI4
ASGNI4
line 417
;416:
;417:	v[0] = x;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRF4
ASGNF4
line 418
;418:	v[1] = y;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 419
;419:	v[2] = z;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 421
;420:
;421:	return v;
ADDRLP4 0
INDIRP4
RETP4
LABELV $286
endproc tv 8 0
bss
align 4
LABELV $290
skip 4
align 1
LABELV $291
skip 256
export vtos
code
proc vtos 12 24
line 433
;422:}
;423:
;424:
;425:/*
;426:=============
;427:VectorToString
;428:
;429:This is just a convenience function
;430:for printing vectors
;431:=============
;432:*/
;433:char	*vtos( const vec3_t v ) {
line 439
;434:	static	int		index;
;435:	static	char	str[8][32];
;436:	char	*s;
;437:
;438:	// use an array so that multiple vtos won't collide
;439:	s = str[index];
ADDRLP4 0
ADDRGP4 $290
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 $291
ADDP4
ASGNP4
line 440
;440:	index = (index + 1)&7;
ADDRLP4 4
ADDRGP4 $290
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 7
BANDI4
ASGNI4
line 442
;441:
;442:	Com_sprintf (s, 32, "(%i %i %i)", (int)v[0], (int)v[1], (int)v[2]);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $292
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 444
;443:
;444:	return s;
ADDRLP4 0
INDIRP4
RETP4
LABELV $289
endproc vtos 12 24
data
align 4
LABELV $294
byte 4 0
byte 4 3212836864
byte 4 0
align 4
LABELV $295
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $296
byte 4 0
byte 4 3221225472
byte 4 0
align 4
LABELV $297
byte 4 0
byte 4 0
byte 4 3212836864
export G_SetMovedir
code
proc G_SetMovedir 16 16
line 458
;445:}
;446:
;447:
;448:/*
;449:===============
;450:G_SetMovedir
;451:
;452:The editor only specifies a single value for angles (yaw),
;453:but we have special constants to generate an up or down direction.
;454:Angles will be cleared, because it is being used to represent a direction
;455:instead of an orientation.
;456:===============
;457:*/
;458:void G_SetMovedir( vec3_t angles, vec3_t movedir ) {
line 464
;459:	static vec3_t VEC_UP		= {0, -1, 0};
;460:	static vec3_t MOVEDIR_UP	= {0, 0, 1};
;461:	static vec3_t VEC_DOWN		= {0, -2, 0};
;462:	static vec3_t MOVEDIR_DOWN	= {0, 0, -1};
;463:
;464:	if ( VectorCompare (angles, VEC_UP) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $294
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $298
line 465
;465:		VectorCopy (MOVEDIR_UP, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 $295
INDIRB
ASGNB 12
line 466
;466:	} else if ( VectorCompare (angles, VEC_DOWN) ) {
ADDRGP4 $299
JUMPV
LABELV $298
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $296
ARGP4
ADDRLP4 4
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $300
line 467
;467:		VectorCopy (MOVEDIR_DOWN, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 $297
INDIRB
ASGNB 12
line 468
;468:	} else {
ADDRGP4 $301
JUMPV
LABELV $300
line 469
;469:		AngleVectors (angles, movedir, NULL, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 470
;470:	}
LABELV $301
LABELV $299
line 471
;471:	VectorClear( angles );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 472
;472:}
LABELV $293
endproc G_SetMovedir 16 16
export G_InitGentity
proc G_InitGentity 4 8
line 474
;473:
;474:void G_InitGentity( gentity_t *e ) {
line 475
;475:	e->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 476
;476:	G_SetClassName(e, "noclass");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $303
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 477
;477:	e->s.number = e - g_entities; 
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ASGNI4
line 478
;478:	if (e->s.number < 1023) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1023
GEI4 $304
line 479
;479:		e->isLogical = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2308
ADDP4
CNSTI4 0
ASGNI4
line 480
;480:	}
ADDRGP4 $305
JUMPV
LABELV $304
line 481
;481:	else {
line 482
;482:		e->isLogical = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2308
ADDP4
CNSTI4 1
ASGNI4
line 483
;483:	}
LABELV $305
line 484
;484:	e->r.ownerNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 1023
ASGNI4
line 485
;485:	e->s.modelGhoul2 = 0; //assume not
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 486
;486:}
LABELV $302
endproc G_InitGentity 4 8
export generateHashValue
proc generateHashValue 16 4
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
line 494
;487:
;488:
;489:/*
;490:================
;491:return a hash value for the filename
;492:================
;493:*/
;494:int generateHashValue(const char* fname, const int size) {
line 499
;495:	int		i;
;496:	int		hash;
;497:	char	letter;
;498:
;499:	hash = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 500
;500:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $308
JUMPV
LABELV $307
line 501
;501:	while (fname[i] != '\0') {
line 502
;502:		letter = tolower(fname[i]);
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
CVII1 4
ASGNI1
line 503
;503:		if (letter == '.') break;				// don't include extension
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $310
ADDRGP4 $309
JUMPV
LABELV $310
line 504
;504:		if (letter == '\\') letter = '/';		// damn path names
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $312
ADDRLP4 0
CNSTI1 47
ASGNI1
LABELV $312
line 505
;505:		hash += (int)(letter) * (i + 119);
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
CNSTI4 119
ADDI4
MULI4
ADDI4
ASGNI4
line 506
;506:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 507
;507:	}
LABELV $308
line 501
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $307
LABELV $309
line 508
;508:	hash = (hash ^ (hash >> 10) ^ (hash >> 20));
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 10
RSHI4
BXORI4
ADDRLP4 8
INDIRI4
CNSTI4 20
RSHI4
BXORI4
ASGNI4
line 509
;509:	hash &= (size - 1);
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 1
SUBI4
BANDI4
ASGNI4
line 510
;510:	return hash;
ADDRLP4 8
INDIRI4
RETI4
LABELV $306
endproc generateHashValue 16 4
export G_UnlistFromHashTable
proc G_UnlistFromHashTable 28 20
line 513
;511:}
;512:
;513:void G_UnlistFromHashTable(gentity_t* ent) {
line 514
;514:	if (ent->classname) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $315
line 515
;515:		int hash = generateHashValue(ent->classname, ENTITY_HASH_SIZE);
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 16
ADDRGP4 generateHashValue
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 516
;516:		gentity_t* hashEnt, *lastHashEnt=NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 517
;517:		int found = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 519
;518:
;519:		for (hashEnt = g_entitiesHashTable[hash]; hashEnt; hashEnt = hashEnt->nextHashed) {
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_entitiesHashTable
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $320
JUMPV
LABELV $317
line 520
;520:			if (hashEnt == ent) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $321
line 521
;521:				found++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 522
;522:				if (!lastHashEnt) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $323
line 523
;523:					g_entitiesHashTable[hash] = ent->nextHashed;
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_entitiesHashTable
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2332
ADDP4
INDIRP4
ASGNP4
line 524
;524:					g_entitiesHashTableCount--;
ADDRLP4 20
ADDRGP4 g_entitiesHashTableCount
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 525
;525:				}
ADDRGP4 $324
JUMPV
LABELV $323
line 526
;526:				else {
line 527
;527:					lastHashEnt->nextHashed = ent->nextHashed;
ADDRLP4 20
CNSTI4 2332
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 528
;528:					g_entitiesHashTableCount--;
ADDRLP4 24
ADDRGP4 g_entitiesHashTableCount
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 529
;529:				}
LABELV $324
line 530
;530:			}
LABELV $321
line 531
;531:			lastHashEnt = hashEnt;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 532
;532:		}
LABELV $318
line 519
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2332
ADDP4
INDIRP4
ASGNP4
LABELV $320
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $317
line 533
;533:		ent->nextHashed = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2332
ADDP4
CNSTP4 0
ASGNP4
line 534
;534:		if (found > 1) {
ADDRLP4 8
INDIRI4
CNSTI4 1
LEI4 $325
line 535
;535:			Com_Printf("^3entity %d (%s) was found %d times in hashtable with hash %d!!",ent-g_entities,ent->classname,found, hash);
ADDRGP4 $327
ARGP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
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
ADDRLP4 20
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 536
;536:		}
LABELV $325
line 537
;537:	}
LABELV $315
line 538
;538:}
LABELV $314
endproc G_UnlistFromHashTable 28 20
export G_SetClassName
proc G_SetClassName 28 8
line 539
;539:void G_SetClassName(gentity_t* ent, char* classname) {
line 540
;540:	int hash = generateHashValue(classname, ENTITY_HASH_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8
ADDRGP4 generateHashValue
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 543
;541:	gentity_t* hashEnt;
;542:
;543:	if (ent->classname) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $329
line 544
;544:		G_UnlistFromHashTable(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnlistFromHashTable
CALLV
pop
line 545
;545:	}
LABELV $329
line 548
;546:	
;547:	// can put it in directly
;548:	if (!g_entitiesHashTable[hash] || g_entitiesHashTable[hash] > ent) {
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_entitiesHashTable
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 12
INDIRU4
CNSTU4 0
EQU4 $333
ADDRLP4 12
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
LEU4 $331
LABELV $333
line 549
;549:		ent->nextHashed = g_entitiesHashTable[hash];
ADDRFP4 0
INDIRP4
CNSTI4 2332
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_entitiesHashTable
ADDP4
INDIRP4
ASGNP4
line 550
;550:		g_entitiesHashTable[hash] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_entitiesHashTable
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 551
;551:		g_entitiesHashTableCount++;
ADDRLP4 16
ADDRGP4 g_entitiesHashTableCount
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 552
;552:	}
ADDRGP4 $332
JUMPV
LABELV $331
line 553
;553:	else {
line 555
;554:		// put it in at the right place
;555:		for (hashEnt = g_entitiesHashTable[hash]; hashEnt; hashEnt = hashEnt->nextHashed) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_entitiesHashTable
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $337
JUMPV
LABELV $334
line 556
;556:			if (!hashEnt->nextHashed || hashEnt->nextHashed > ent) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 2332
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
CNSTU4 0
EQU4 $340
ADDRLP4 16
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
LEU4 $338
LABELV $340
line 557
;557:				ent->nextHashed = hashEnt->nextHashed;
ADDRLP4 20
CNSTI4 2332
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 558
;558:				hashEnt->nextHashed = ent;
ADDRLP4 0
INDIRP4
CNSTI4 2332
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 559
;559:				g_entitiesHashTableCount++;
ADDRLP4 24
ADDRGP4 g_entitiesHashTableCount
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 560
;560:				break;
ADDRGP4 $336
JUMPV
LABELV $338
line 562
;561:			}
;562:		}
LABELV $335
line 555
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2332
ADDP4
INDIRP4
ASGNP4
LABELV $337
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $334
LABELV $336
line 563
;563:	}
LABELV $332
line 565
;564:
;565:	if (g_entitiesHashTableCount < 0 || g_entitiesHashTableCount > MAX_ENTITIESTOTAL) {
ADDRLP4 16
ADDRGP4 g_entitiesHashTableCount
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $343
ADDRLP4 16
INDIRI4
CNSTI4 4096
LEI4 $341
LABELV $343
line 566
;566:		Com_Printf("^3g_entitiesHashTableCount is %d, something went terribly wrong.", g_entitiesHashTableCount);
ADDRGP4 $344
ARGP4
ADDRGP4 g_entitiesHashTableCount
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 567
;567:	}
LABELV $341
line 569
;568:
;569:	ent->classname = classname;
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 570
;570:}
LABELV $328
endproc G_SetClassName 28 8
export G_SpawnReal
proc G_SpawnReal 40 20
line 588
;571:
;572:
;573:/*
;574:=================
;575:G_Spawn
;576:
;577:Either finds a free entity, or allocates a new one.
;578:
;579:  The slots from 0 to MAX_CLIENTS-1 are always reserved for clients, and will
;580:never be used by anything else.
;581:
;582:Try to avoid reusing an entity that was recently freed, because it
;583:can cause the client to think the entity morphed into something else
;584:instead of being removed and recreated, which can cause interpolated
;585:angles and bad trails.
;586:=================
;587:*/
;588:gentity_t *G_SpawnReal(gentity_t* after) {
line 591
;589:	int			i, force;
;590:	gentity_t	*e;
;591:	int			startNum = after ? MAX(MAX_CLIENTS, MIN(after - g_entities + 1,ENTITYNUM_MAX_NORMAL-1)) : MAX_CLIENTS;
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $350
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
CNSTI4 1
ADDI4
CNSTI4 1021
GEI4 $354
ADDRLP4 24
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $355
JUMPV
LABELV $354
ADDRLP4 24
CNSTI4 1021
ASGNI4
LABELV $355
CNSTI4 32
ADDRLP4 24
INDIRI4
LEI4 $352
ADDRLP4 20
CNSTI4 32
ASGNI4
ADDRGP4 $353
JUMPV
LABELV $352
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
CNSTI4 1
ADDI4
CNSTI4 1021
GEI4 $356
ADDRLP4 28
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $357
JUMPV
LABELV $356
ADDRLP4 28
CNSTI4 1021
ASGNI4
LABELV $357
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
LABELV $353
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $351
JUMPV
LABELV $350
ADDRLP4 16
CNSTI4 32
ASGNI4
LABELV $351
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 593
;592:
;593:	e = NULL;	// shut up warning
ADDRLP4 0
CNSTP4 0
ASGNP4
line 594
;594:	i = 0;		// shut up warning
ADDRLP4 4
CNSTI4 0
ASGNI4
line 595
;595:	for ( force = 0 ; force < 2 ; force++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $358
line 598
;596:		// if we go through all entities and can't find one to free,
;597:		// override the normal minimum times before use
;598:		e = &g_entities[startNum];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 599
;599:		for ( i = startNum; i<level.num_entities ; i++, e++) {
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $365
JUMPV
LABELV $362
line 600
;600:			if ( e->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $367
line 601
;601:				continue;
ADDRGP4 $363
JUMPV
LABELV $367
line 606
;602:			}
;603:
;604:			// the first couple seconds of server time can involve a lot of
;605:			// freeing and allocating, so relax the replacement policy
;606:			if ( !force && e->freetime > level.startTime + 2000 && level.time - e->freetime < 1000 ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $369
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 level+48
INDIRI4
CNSTI4 2000
ADDI4
LEI4 $369
ADDRGP4 level+36
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $369
line 607
;607:				continue;
ADDRGP4 $363
JUMPV
LABELV $369
line 611
;608:			}
;609:
;610:			// reuse this slot
;611:			G_InitGentity( e );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 612
;612:			return e;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $345
JUMPV
LABELV $363
line 599
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2352
ADDP4
ASGNP4
LABELV $365
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $362
line 614
;613:		}
;614:		if ( i != ENTITYNUM_MAX_NORMAL ) {
ADDRLP4 4
INDIRI4
CNSTI4 1022
EQI4 $373
line 615
;615:			break;
ADDRGP4 $360
JUMPV
LABELV $373
line 617
;616:		}
;617:	}
LABELV $359
line 595
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $358
LABELV $360
line 618
;618:	if ( i == ENTITYNUM_MAX_NORMAL )
ADDRLP4 4
INDIRI4
CNSTI4 1022
NEI4 $375
line 619
;619:	{
line 620
;620:		gentity_t *found = NULL;
ADDRLP4 32
CNSTP4 0
ASGNP4
line 621
;621:		if ( g_mv_fixturretcrash.integer )
ADDRGP4 g_mv_fixturretcrash+12
INDIRI4
CNSTI4 0
EQI4 $377
line 622
;622:		{ // TurretCrashFix - One last try!
line 623
;623:			G_Printf("G_Spawn: no free entities, trying to make room by deleting temp entities and missiles\n");
ADDRGP4 $380
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 624
;624:			for ( i = startNum; i < MAX_GENTITIES; i++ )
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $384
JUMPV
LABELV $381
line 625
;625:			{
line 626
;626:				e = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 628
;627:
;628:				if ( e && (e->s.eType == ET_EVENTS + EV_SABER_BLOCK || ((e->s.weapon == WP_TURRET || g_mv_fixturretcrash.integer == 2) && e->s.eType == ET_MISSILE)) )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $385
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 44
EQI4 $388
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 15
EQI4 $389
ADDRGP4 g_mv_fixturretcrash+12
INDIRI4
CNSTI4 2
NEI4 $385
LABELV $389
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $385
LABELV $388
line 629
;629:				{ // Delete all saber blocks and missiles...
line 632
;630:					// g_mv_fixturretcrash == 1 -> only missiles from the turret will be removed
;631:					// g_mv_fixturretcrash == 2 -> any missile will be removed
;632:					if ( !found ) found = e;
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $390
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $390
line 633
;633:					G_FreeEntity(e);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 634
;634:				}
LABELV $385
line 635
;635:			}
LABELV $382
line 624
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $384
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $381
line 636
;636:		}
LABELV $377
line 638
;637:
;638:		if ( !found )
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $392
line 639
;639:		{
line 640
;640:			for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $394
line 641
;641:				G_Printf("%4i: %s\n", i, g_entities[i].classname);
ADDRGP4 $398
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities+416
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 642
;642:			}
LABELV $395
line 640
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $394
line 643
;643:			G_Error( "G_Spawn: no free entities" );
ADDRGP4 $400
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 644
;644:		}
LABELV $392
line 647
;645:
;646:		// reuse this slot
;647:		G_InitGentity( found );
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 648
;648:		return found;
ADDRLP4 32
INDIRP4
RETP4
ADDRGP4 $345
JUMPV
LABELV $375
line 652
;649:	}
;650:	
;651:	// open up a new slot
;652:	level.num_entities++;
ADDRLP4 32
ADDRGP4 level+12
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 655
;653:
;654:	// let the server system know that there are more entities
;655:	if ( jk2version == VERSION_1_02 && !mvStructConversionDisabled )
ADDRGP4 jk2version
INDIRI4
CNSTI4 2
NEI4 $402
ADDRGP4 mvStructConversionDisabled
INDIRI4
CNSTI4 0
NEI4 $402
line 656
;656:	{ // 1.02
line 658
;657:		// initialize all clients for this game
;658:		memset( g_ps, 0, MAX_CLIENTS * sizeof(g_ps[0]) );
ADDRGP4 g_ps
ARGP4
CNSTI4 0
ARGI4
CNSTU4 43776
ARGU4
ADDRGP4 memset
CALLP4
pop
line 660
;659:
;660:		trap_LocateGameData( level.gentities, level.num_entities, sizeof( gentity_t ), 
ADDRGP4 level+4
INDIRP4
ARGP4
ADDRGP4 level+12
INDIRI4
ARGI4
CNSTI4 2352
ARGI4
ADDRGP4 g_ps
ARGP4
CNSTI4 1368
ARGI4
ADDRGP4 trap_LocateGameData
CALLV
pop
line 662
;661:			(playerState_t*)&g_ps[0], sizeof( g_ps[0] ) );
;662:	}
ADDRGP4 $403
JUMPV
LABELV $402
line 664
;663:	else
;664:	{
line 665
;665:		trap_LocateGameData( level.gentities, level.num_entities, sizeof( gentity_t ), 
ADDRGP4 level+4
INDIRP4
ARGP4
ADDRGP4 level+12
INDIRI4
ARGI4
CNSTI4 2352
ARGI4
ADDRGP4 level
INDIRP4
ARGP4
CNSTI4 53196
ARGI4
ADDRGP4 trap_LocateGameData
CALLV
pop
line 667
;666:			&level.clients[0].ps, sizeof( level.clients[0] ) );
;667:	}
LABELV $403
line 669
;668:
;669:	if ( mvapi )
ADDRGP4 mvapi
INDIRI4
CNSTI4 0
EQI4 $408
line 670
;670:	{
line 671
;671:		trap_MVAPI_LocateGameData( mv_entities, level.num_entities, sizeof( mvsharedEntity_t ) );
ADDRGP4 mv_entities
ARGP4
ADDRGP4 level+12
INDIRI4
ARGI4
CNSTI4 132
ARGI4
ADDRGP4 trap_MVAPI_LocateGameData
CALLI4
pop
line 672
;672:	}
LABELV $408
line 674
;673:
;674:	G_InitGentity( e );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 675
;675:	return e;
ADDRLP4 0
INDIRP4
RETP4
LABELV $345
endproc G_SpawnReal 40 20
export G_Spawn
proc G_Spawn 4 4
line 679
;676:}
;677:
;678:
;679:gentity_t* G_Spawn() {
line 680
;680:	return G_SpawnReal(NULL);
CNSTP4 0
ARGP4
ADDRLP4 0
ADDRGP4 G_SpawnReal
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $411
endproc G_Spawn 4 4
export G_SpawnAfter
proc G_SpawnAfter 4 4
line 683
;681:}
;682:// yuck. needed for weirdo trigger conversion.
;683:gentity_t* G_SpawnAfter(gentity_t* ent) {
line 684
;684:	return G_SpawnReal(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 G_SpawnReal
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $412
endproc G_SpawnAfter 4 4
export G_SpawnLogical
proc G_SpawnLogical 16 4
line 688
;685:}
;686:
;687:// G_SpawnLogical: Creates a logical entity (ent nums 1024 to 4097)
;688:gentity_t* G_SpawnLogical(void) {
line 692
;689:	int			i, force;
;690:	gentity_t* e;
;691:
;692:	e = NULL;	// shut up warning
ADDRLP4 0
CNSTP4 0
ASGNP4
line 693
;693:	i = 0;		// shut up warning
ADDRLP4 4
CNSTI4 0
ASGNI4
line 694
;694:	for (force = 0; force < 2; force++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $414
line 697
;695:		// if we go through all entities and can't find one to free,
;696:		// override the normal minimum times before use
;697:		e = &g_entities[MAX_GENTITIES];
ADDRLP4 0
ADDRGP4 g_entities+2408448
ASGNP4
line 698
;698:		for (i = MAX_GENTITIES; i < (MAX_GENTITIES + level.num_logicalents); i++, e++) {
ADDRLP4 4
CNSTI4 1024
ASGNI4
ADDRGP4 $422
JUMPV
LABELV $419
line 699
;699:			if (e->inuse) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $424
line 700
;700:				continue;
ADDRGP4 $420
JUMPV
LABELV $424
line 705
;701:			}
;702:
;703:			// the first couple seconds of server time can involve a lot of
;704:			// freeing and allocating, so relax the replacement policy
;705:			if (!force && e->freetime > level.startTime + 2000 && level.time - e->freetime < 1000)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $426
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 level+48
INDIRI4
CNSTI4 2000
ADDI4
LEI4 $426
ADDRGP4 level+36
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $426
line 706
;706:			{
line 707
;707:				continue;
ADDRGP4 $420
JUMPV
LABELV $426
line 711
;708:			}
;709:
;710:			// reuse this slot
;711:			G_InitGentity(e);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 712
;712:			return e;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $413
JUMPV
LABELV $420
line 698
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2352
ADDP4
ASGNP4
LABELV $422
ADDRLP4 4
INDIRI4
ADDRGP4 level+16
INDIRI4
CNSTI4 1024
ADDI4
LTI4 $419
line 714
;713:		}
;714:		if (i != MAX_ENTITIESTOTAL) {
ADDRLP4 4
INDIRI4
CNSTI4 4096
EQI4 $430
line 715
;715:			break;
ADDRGP4 $416
JUMPV
LABELV $430
line 717
;716:		}
;717:	}
LABELV $415
line 694
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $414
LABELV $416
line 718
;718:	if (i == MAX_ENTITIESTOTAL/*- 1 */ ) { // ta: surely the -1 is an error?
ADDRLP4 4
INDIRI4
CNSTI4 4096
NEI4 $432
line 726
;719:		/*
;720:		for (i = 0; i < MAX_GENTITIES; i++) {
;721:		trap->Print("%4i: %s\n", i, g_entities[i].classname);
;722:		}
;723:		*/
;724:		//G_SpewEntList();
;725:		//trap_Error(ERR_DROP, "G_SpawnLogical: no free entities");
;726:		G_Error("G_SpawnLogical: no free entities");
ADDRGP4 $434
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 727
;727:	}
LABELV $432
line 730
;728:
;729:	// open up a new slot
;730:	level.num_logicalents++;
ADDRLP4 12
ADDRGP4 level+16
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 732
;731:
;732:	G_InitGentity(e);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 733
;733:	return e;
ADDRLP4 0
INDIRP4
RETP4
LABELV $413
endproc G_SpawnLogical 16 4
export G_EntitiesFree
proc G_EntitiesFree 8 0
line 741
;734:}
;735:
;736:/*
;737:=================
;738:G_EntitiesFree
;739:=================
;740:*/
;741:qboolean G_EntitiesFree( void ) {
line 745
;742:	int			i;
;743:	gentity_t	*e;
;744:
;745:	e = &g_entities[MAX_CLIENTS];
ADDRLP4 4
ADDRGP4 g_entities+75264
ASGNP4
line 746
;746:	for ( i = MAX_CLIENTS; i < level.num_entities; i++, e++) {
ADDRLP4 0
CNSTI4 32
ASGNI4
ADDRGP4 $441
JUMPV
LABELV $438
line 747
;747:		if ( e->inuse ) {
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $443
line 748
;748:			continue;
ADDRGP4 $439
JUMPV
LABELV $443
line 751
;749:		}
;750:		// slot available
;751:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $436
JUMPV
LABELV $439
line 746
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 2352
ADDP4
ASGNP4
LABELV $441
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $438
line 753
;752:	}
;753:	return qfalse;
CNSTI4 0
RETI4
LABELV $436
endproc G_EntitiesFree 8 0
data
export gG2KillNum
align 4
LABELV gG2KillNum
byte 4 0
export G_SendG2KillQueue
code
proc G_SendG2KillQueue 1032 12
line 762
;754:}
;755:
;756:#define MAX_G2_KILL_QUEUE 64
;757:
;758:int gG2KillIndex[MAX_G2_KILL_QUEUE];
;759:int gG2KillNum = 0;
;760:
;761:void G_SendG2KillQueue(void)
;762:{
line 764
;763:	char g2KillString[1024];
;764:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 766
;765:	
;766:	if (!gG2KillNum)
ADDRGP4 gG2KillNum
INDIRI4
CNSTI4 0
NEI4 $446
line 767
;767:	{
line 768
;768:		return;
ADDRGP4 $445
JUMPV
LABELV $446
line 771
;769:	}
;770:
;771:	Com_sprintf(g2KillString, 1024, "kg2");
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $448
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $450
JUMPV
LABELV $449
line 774
;772:
;773:	while (i < gG2KillNum)
;774:	{
line 775
;775:		Q_strcat(g2KillString, 1024, va(" %i", gG2KillIndex[i]));
ADDRGP4 $452
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gG2KillIndex
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 776
;776:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 777
;777:	}
LABELV $450
line 773
ADDRLP4 0
INDIRI4
ADDRGP4 gG2KillNum
INDIRI4
LTI4 $449
line 779
;778:
;779:	trap_SendServerCommand(-1, g2KillString);
CNSTI4 -1
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 782
;780:
;781:	//Clear the count because we just sent off the whole queue
;782:	gG2KillNum = 0;
ADDRGP4 gG2KillNum
CNSTI4 0
ASGNI4
line 783
;783:}
LABELV $445
endproc G_SendG2KillQueue 1032 12
export G_KillG2Queue
proc G_KillG2Queue 4 8
line 786
;784:
;785:void G_KillG2Queue(int entNum)
;786:{
line 787
;787:	if (gG2KillNum >= MAX_G2_KILL_QUEUE)
ADDRGP4 gG2KillNum
INDIRI4
CNSTI4 64
LTI4 $454
line 788
;788:	{ //This would be considered a Bad Thing.
line 793
;789:#ifdef _DEBUG
;790:		Com_Printf("WARNING: Exceeded the MAX_G2_KILL_QUEUE count for this frame!\n");
;791:#endif
;792:		//Since we're out of queue slots, just send it now as a seperate command (eats more bandwidth, but we have no choice)
;793:		trap_SendServerCommand(-1, va("kg2 %i", entNum));
ADDRGP4 $456
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 794
;794:		return;
ADDRGP4 $453
JUMPV
LABELV $454
line 797
;795:	}
;796:
;797:	gG2KillIndex[gG2KillNum] = entNum;
ADDRGP4 gG2KillNum
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gG2KillIndex
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 798
;798:	gG2KillNum++;
ADDRLP4 0
ADDRGP4 gG2KillNum
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 799
;799:}
LABELV $453
endproc G_KillG2Queue 4 8
export G_FreeEntity
proc G_FreeEntity 20 12
line 808
;800:
;801:/*
;802:=================
;803:G_FreeEntity
;804:
;805:Marks the entity as free
;806:=================
;807:*/
;808:void G_FreeEntity( gentity_t *ed ) {
line 811
;809:	//gentity_t *te;
;810:
;811:	if (ed->isSaberEntity)
ADDRFP4 0
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $458
line 812
;812:	{
line 816
;813:#ifdef _DEBUG
;814:		Com_Printf("Tried to remove JM saber!\n");
;815:#endif
;816:		return;
ADDRGP4 $457
JUMPV
LABELV $458
line 819
;817:	}
;818:
;819:	if (!ed->isLogical) {
ADDRFP4 0
INDIRP4
CNSTI4 2308
ADDP4
INDIRI4
CNSTI4 0
NEI4 $460
line 820
;820:		trap_UnlinkEntity(ed);		// unlink from world
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 821
;821:	}
LABELV $460
line 823
;822:
;823:	if ( ed->neverFree ) {
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $462
line 824
;824:		return;
ADDRGP4 $457
JUMPV
LABELV $462
line 829
;825:	}
;826:
;827:	// clear any activation links
;828:	// what happens if an entity is its own activator or some weird combinations like that?
;829:	G_ClearEntityActivator(ed);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ClearEntityActivator
CALLV
pop
line 830
;830:	G_ClearActivatedEntities(ed); // dont do this, prolly unsafe
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ClearActivatedEntities
CALLV
pop
line 836
;831:
;832:	//rww - this may seem a bit hackish, but unfortunately we have no access
;833:	//to anything ghoul2-related on the server and thus must send a message
;834:	//to let the client know he needs to clean up all the g2 stuff for this
;835:	//now-removed entity
;836:	if (ed->s.modelGhoul2)
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
EQI4 $464
line 837
;837:	{ //force all clients to accept an event to destroy this instance, right now
line 844
;838:		/*
;839:		te = G_TempEntity( vec3_origin, EV_DESTROY_GHOUL2_INSTANCE );
;840:		te->r.svFlags |= SVF_BROADCAST;
;841:		te->s.eventParm = ed->s.number;
;842:		*/
;843:		//Or not. Events can be dropped, so that would be a bad thing.
;844:		G_KillG2Queue(ed->s.number);
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_KillG2Queue
CALLV
pop
line 845
;845:	}
LABELV $464
line 847
;846:
;847:	if (ed->s.eFlags & EF_SOUNDTRACKER)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8388608
BANDI4
CNSTI4 0
EQI4 $466
line 848
;848:	{
line 849
;849:		int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $469
JUMPV
LABELV $468
line 853
;850:		gentity_t *ent;
;851:
;852:		while (i < MAX_CLIENTS)
;853:		{
line 854
;854:			ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 856
;855:
;856:			if (ent && ent->inuse && ent->client)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $471
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $471
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $471
line 857
;857:			{
line 858
;858:				int ch = TRACK_CHANNEL_NONE-50;
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $474
JUMPV
LABELV $473
line 861
;859:
;860:				while (ch < NUM_TRACK_CHANNELS-50)
;861:				{
line 862
;862:					if (ent->client->ps.fd.killSoundEntIndex[ch] == ed->s.number)
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $476
line 863
;863:					{
line 864
;864:						ent->client->ps.fd.killSoundEntIndex[ch] = 0;
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 865
;865:					}
LABELV $476
line 867
;866:
;867:					ch++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 868
;868:				}
LABELV $474
line 860
ADDRLP4 16
INDIRI4
CNSTI4 6
LTI4 $473
line 869
;869:			}
LABELV $471
line 871
;870:
;871:			i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 872
;872:		}
LABELV $469
line 852
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $468
line 873
;873:	}
LABELV $466
line 875
;874:
;875:	if (!ed->isLogical) {
ADDRFP4 0
INDIRP4
CNSTI4 2308
ADDP4
INDIRI4
CNSTI4 0
NEI4 $478
line 876
;876:		memset(mv_entities + (ed - g_entities), 0, sizeof(mv_entities[0]));
CNSTI4 132
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
MULI4
ADDRGP4 mv_entities
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 132
ARGU4
ADDRGP4 memset
CALLP4
pop
line 877
;877:	}
LABELV $478
line 878
;878:	G_UnlistFromHashTable(ed);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnlistFromHashTable
CALLV
pop
line 879
;879:	memset (ed, 0, sizeof(*ed));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 2352
ARGU4
ADDRGP4 memset
CALLP4
pop
line 880
;880:	G_SetClassName(ed, "freed");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $480
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 881
;881:	ed->freetime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 882
;882:	ed->inuse = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 0
ASGNI4
line 911
;883:
;884:	/* do we need this? no idea.
;885:	//Logical Entities - (JKG)
;886:	// Ok, lets see if we can lower level.num_entities.
;887:	// If this entity was the last allocated slot, run back through g_entities and get the last used slots.
;888:	entnum = ed - g_entities;
;889:	if (!ed->isLogical) {
;890:		if (entnum == level.num_entities - 1) {
;891:			// Last slot, roll back
;892:			for (i = entnum; i >= MAX_CLIENTS; i--) {
;893:				if (g_entities[i].inuse)
;894:					break;
;895:			}
;896:			level.num_entities = i + 1;
;897:		}
;898:	}
;899:	else {
;900:		if (entnum == MAX_GENTITIES + level.num_logicalents - 1) {
;901:			// Last slot, roll back
;902:			for (i = entnum; i >= MAX_GENTITIES; i--) {
;903:				if (g_entities[i].inuse)
;904:					break;
;905:			}
;906:			level.num_logicalents = i + 1 - MAX_GENTITIES;
;907:		}
;908:
;909:	}
;910:	*/
;911:}
LABELV $457
endproc G_FreeEntity 20 12
export G_TempEntity
proc G_TempEntity 20 8
line 922
;912:
;913:/*
;914:=================
;915:G_TempEntity
;916:
;917:Spawns an event entity that will be auto-removed
;918:The origin will be snapped to save net bandwidth, so care
;919:must be taken if the origin is right on a surface (snap towards start vector first)
;920:=================
;921:*/
;922:gentity_t *G_TempEntity( vec3_t origin, int event ) {
line 926
;923:	gentity_t		*e;
;924:	vec3_t		snapped;
;925:
;926:	e = G_Spawn();
ADDRLP4 16
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 927
;927:	e->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 929
;928:
;929:	G_SetClassName(e, "tempEntity");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $483
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 930
;930:	e->eventTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 931
;931:	e->freeAfterEvent = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 1
ASGNI4
line 933
;932:
;933:	VectorCopy( origin, snapped );
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 934
;934:	SnapVector( snapped );		// save network bandwidth
ADDRLP4 4
ADDRLP4 4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 935
;935:	G_SetOrigin( e, snapped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 938
;936:
;937:	// find cluster for PVS
;938:	trap_LinkEntity( e );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 940
;939:
;940:	return e;
ADDRLP4 0
INDIRP4
RETP4
LABELV $482
endproc G_TempEntity 20 8
export GetTrackerEnt
proc GetTrackerEnt 12 0
line 946
;941:}
;942:
;943:
;944:
;945:gentity_t *GetTrackerEnt(int channel)
;946:{
line 947
;947:	int i = MAX_CLIENTS;
ADDRLP4 4
CNSTI4 32
ASGNI4
ADDRGP4 $491
JUMPV
LABELV $490
line 951
;948:	gentity_t *ent;
;949:
;950:	while (i < MAX_GENTITIES)
;951:	{
line 952
;952:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 954
;953:
;954:		if (ent && (ent->s.eFlags & EF_SOUNDTRACKER) && ent->s.saberEntityNum == channel)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $493
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8388608
BANDI4
CNSTI4 0
EQI4 $493
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $493
line 955
;955:		{
line 956
;956:			return ent;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $489
JUMPV
LABELV $493
line 959
;957:		}
;958:
;959:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 960
;960:	}
LABELV $491
line 950
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $490
line 962
;961:
;962:	return NULL;
CNSTP4 0
RETP4
LABELV $489
endproc GetTrackerEnt 12 0
export G_SoundTempEntity
proc G_SoundTempEntity 20 8
line 972
;963:}
;964:
;965:/*
;966:=================
;967:G_SoundTempEntity
;968:
;969:Special event entity that keeps sound trackers in mind
;970:=================
;971:*/
;972:gentity_t *G_SoundTempEntity( vec3_t origin, int event, int channel ) {
line 976
;973:	gentity_t		*e;
;974:	vec3_t		snapped;
;975:
;976:	e = G_Spawn();
ADDRLP4 16
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 978
;977:
;978:	e->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 979
;979:	e->inuse = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 981
;980:
;981:	G_SetClassName(e, "tempEntity");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $483
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 982
;982:	e->eventTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 983
;983:	e->freeAfterEvent = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 1
ASGNI4
line 985
;984:
;985:	VectorCopy( origin, snapped );
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 986
;986:	SnapVector( snapped );		// save network bandwidth
ADDRLP4 4
ADDRLP4 4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 987
;987:	G_SetOrigin( e, snapped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 990
;988:
;989:	// find cluster for PVS
;990:	trap_LinkEntity( e );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 992
;991:
;992:	return e;
ADDRLP4 0
INDIRP4
RETP4
LABELV $495
endproc G_SoundTempEntity 20 8
export G_KillBox
proc G_KillBox 4176 32
line 1014
;993:}
;994:
;995:
;996:
;997:/*
;998:==============================================================================
;999:
;1000:Kill box
;1001:
;1002:==============================================================================
;1003:*/
;1004:
;1005:/*
;1006:=================
;1007:G_KillBox
;1008:
;1009:Kills all entities that would touch the proposed new positioning
;1010:of ent.  Ent should be unlinked before calling this!
;1011:=================
;1012:*/
;1013:qboolean ShouldNotCollide(gentity_t* entity, gentity_t* other);
;1014:void G_KillBox (gentity_t *ent) {
line 1020
;1015:	int			i, num;
;1016:	int			touch[MAX_GENTITIES];
;1017:	gentity_t	*hit;
;1018:	vec3_t		mins, maxs;
;1019:
;1020:	VectorAdd( ent->client->ps.origin, ent->r.mins, mins );
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4136
ADDRLP4 4132
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4136
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4132
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4136
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4132
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108+8
ADDRLP4 4140
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4140
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1021
;1021:	VectorAdd( ent->client->ps.origin, ent->r.maxs, maxs );
ADDRLP4 4144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4148
ADDRLP4 4144
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4148
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4144
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4148
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4144
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120+8
ADDRLP4 4152
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4152
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1022
;1022:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4156
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4156
INDIRI4
ASGNI4
line 1024
;1023:
;1024:	for (i=0 ; i<num ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $509
JUMPV
LABELV $506
line 1025
;1025:		hit = &g_entities[touch[i]];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1026
;1026:		if ( !hit->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $510
line 1027
;1027:			continue;
ADDRGP4 $507
JUMPV
LABELV $510
line 1030
;1028:		}
;1029:
;1030:		if (hit->client->sess.raceMode) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $512
line 1031
;1031:			continue;
ADDRGP4 $507
JUMPV
LABELV $512
line 1034
;1032:		}
;1033:
;1034:		if (ent && ShouldNotCollide(ent, hit)) {
ADDRLP4 4160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4160
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $514
ADDRLP4 4160
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4164
ADDRGP4 ShouldNotCollide
CALLI4
ASGNI4
ADDRLP4 4164
INDIRI4
CNSTI4 0
EQI4 $514
line 1035
;1035:			continue; // they wont touch each other anyway, no need to kill
ADDRGP4 $507
JUMPV
LABELV $514
line 1039
;1036:		}
;1037:
;1038:		// nail it
;1039:		G_Damage ( hit, ent, ent, NULL, NULL,
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4168
INDIRP4
ARGP4
ADDRLP4 4168
INDIRP4
ARGP4
ADDRLP4 4172
CNSTP4 0
ASGNP4
ADDRLP4 4172
INDIRP4
ARGP4
ADDRLP4 4172
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 33
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1041
;1040:			100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG);
;1041:	}
LABELV $507
line 1024
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $509
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $506
line 1043
;1042:
;1043:}
LABELV $501
endproc G_KillBox 4176 32
export G_AddPredictableEvent
proc G_AddPredictableEvent 0 12
line 1056
;1044:
;1045://==============================================================================
;1046:
;1047:/*
;1048:===============
;1049:G_AddPredictableEvent
;1050:
;1051:Use for non-pmove events that would also be predicted on the
;1052:client side: jumppads and item pickups
;1053:Adds an event+parm and twiddles the event counter
;1054:===============
;1055:*/
;1056:void G_AddPredictableEvent( gentity_t *ent, int event, int eventParm ) {
line 1057
;1057:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $517
line 1058
;1058:		return;
ADDRGP4 $516
JUMPV
LABELV $517
line 1060
;1059:	}
;1060:	BG_AddPredictableEventToPlayerstate( event, eventParm, &ent->client->ps );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 1061
;1061:}
LABELV $516
endproc G_AddPredictableEvent 0 12
export G_AddEvent
proc G_AddEvent 16 8
line 1071
;1062:
;1063:
;1064:/*
;1065:===============
;1066:G_AddEvent
;1067:
;1068:Adds an event+parm and twiddles the event counter
;1069:===============
;1070:*/
;1071:void G_AddEvent( gentity_t *ent, int event, int eventParm ) {
line 1074
;1072:	int		bits;
;1073:
;1074:	if ( !event ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $520
line 1075
;1075:		G_Printf( "G_AddEvent: zero event added for entity %i\n", ent->s.number );
ADDRGP4 $522
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 1076
;1076:		return;
ADDRGP4 $519
JUMPV
LABELV $520
line 1080
;1077:	}
;1078:
;1079:	// clients need to add the event in playerState_t instead of entityState_t
;1080:	if ( ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $523
line 1081
;1081:		bits = ent->client->ps.externalEvent & EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 768
BANDI4
ASGNI4
line 1082
;1082:		bits = ( bits + EV_EVENT_BIT1 ) & EV_EVENT_BITS;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
CNSTI4 768
BANDI4
ASGNI4
line 1083
;1083:		ent->client->ps.externalEvent = event | bits;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 1084
;1084:		ent->client->ps.externalEventParm = eventParm;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 136
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1085
;1085:		ent->client->ps.externalEventTime = LEVELTIME(ent->client);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $529
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $529
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $531
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $532
JUMPV
LABELV $531
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $532
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $530
JUMPV
LABELV $529
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $530
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1086
;1086:	} else {
ADDRGP4 $524
JUMPV
LABELV $523
line 1087
;1087:		bits = ent->s.event & EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
CNSTI4 768
BANDI4
ASGNI4
line 1088
;1088:		bits = ( bits + EV_EVENT_BIT1 ) & EV_EVENT_BITS;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
CNSTI4 768
BANDI4
ASGNI4
line 1089
;1089:		ent->s.event = event | bits;
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 1090
;1090:		ent->s.eventParm = eventParm;
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1091
;1091:	}
LABELV $524
line 1092
;1092:	ent->eventTime = LEVELTIME(ent->client);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $537
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $537
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $539
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $540
JUMPV
LABELV $539
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $540
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $538
JUMPV
LABELV $537
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $538
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1093
;1093:}
LABELV $519
endproc G_AddEvent 16 8
export G_PlayEffect
proc G_PlayEffect 8 8
line 1101
;1094:
;1095:/*
;1096:=============
;1097:G_PlayEffect
;1098:=============
;1099:*/
;1100:gentity_t *G_PlayEffect(int fxID, vec3_t org, vec3_t ang)
;1101:{
line 1104
;1102:	gentity_t	*te;
;1103:
;1104:	te = G_TempEntity( org, EV_PLAY_EFFECT );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 63
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1105
;1105:	VectorCopy(ang, te->s.angles);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 1106
;1106:	VectorCopy(org, te->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1107
;1107:	te->s.eventParm = fxID;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1109
;1108:
;1109:	return te;
ADDRLP4 0
INDIRP4
RETP4
LABELV $541
endproc G_PlayEffect 8 8
export G_ScreenShake
proc G_ScreenShake 12 8
line 1118
;1110:}
;1111:
;1112:/*
;1113:=============
;1114:G_ScreenShake
;1115:=============
;1116:*/
;1117:gentity_t *G_ScreenShake(vec3_t org, gentity_t *target, float intensity, int duration, qboolean global)
;1118:{
line 1121
;1119:	gentity_t	*te;
;1120:
;1121:	te = G_TempEntity( org, EV_SCREENSHAKE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 38
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1122
;1122:	VectorCopy(org, te->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1123
;1123:	te->s.angles[0] = intensity;
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 1124
;1124:	te->s.time = duration;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 1126
;1125:
;1126:	if (target)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $543
line 1127
;1127:	{
line 1128
;1128:		te->s.modelindex = target->s.number+1;
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1129
;1129:	}
ADDRGP4 $544
JUMPV
LABELV $543
line 1131
;1130:	else
;1131:	{
line 1132
;1132:		te->s.modelindex = 0;
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 1133
;1133:	}
LABELV $544
line 1135
;1134:
;1135:	if (global)
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $545
line 1136
;1136:	{
line 1137
;1137:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1138
;1138:	}
LABELV $545
line 1140
;1139:
;1140:	return te;
ADDRLP4 0
INDIRP4
RETP4
LABELV $542
endproc G_ScreenShake 12 8
export G_MuteSound
proc G_MuteSound 16 8
line 1149
;1141:}
;1142:
;1143:/*
;1144:=============
;1145:G_MuteSound
;1146:=============
;1147:*/
;1148:void G_MuteSound( int entnum, int channel )
;1149:{
line 1152
;1150:	gentity_t	*te, *e;
;1151:
;1152:	te = G_TempEntity( vec3_origin, EV_MUTE_SOUND );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 65
ARGI4
ADDRLP4 8
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1153
;1153:	te->r.svFlags = SVF_BROADCAST;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 32
ASGNI4
line 1154
;1154:	te->s.trickedentindex2 = entnum;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1155
;1155:	te->s.trickedentindex = channel;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1157
;1156:
;1157:	e = &g_entities[entnum];
ADDRLP4 4
CNSTI4 2352
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1159
;1158:
;1159:	if (e && (e->s.eFlags & EF_SOUNDTRACKER))
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $548
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8388608
BANDI4
CNSTI4 0
EQI4 $548
line 1160
;1160:	{
line 1161
;1161:		G_FreeEntity(e);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1162
;1162:		e->s.eFlags = 0;
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1163
;1163:	}
LABELV $548
line 1164
;1164:}
LABELV $547
endproc G_MuteSound 16 8
export G_Sound
proc G_Sound 24 12
line 1171
;1165:
;1166:/*
;1167:=============
;1168:G_Sound
;1169:=============
;1170:*/
;1171:void G_Sound( gentity_t *ent, int channel, int soundIndex ) {
line 1174
;1172:	gentity_t	*te;
;1173:
;1174:	te = G_SoundTempEntity( ent->r.currentOrigin, EV_GENERAL_SOUND, channel );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 66
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 G_SoundTempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1175
;1175:	te->s.eventParm = soundIndex;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1177
;1176:
;1177:	if (ent && ent->client && channel > TRACK_CHANNEL_NONE)
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $551
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $551
ADDRFP4 4
INDIRI4
CNSTI4 50
LEI4 $551
line 1178
;1178:	{ //let the client remember the index of the player entity so he can kill the most recent sound on request
line 1179
;1179:		te->s.saberEntityNum = channel;
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1181
;1180:
;1181:		if (g_entities[ent->client->ps.fd.killSoundEntIndex[channel-50]].inuse &&
ADDRLP4 16
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ASGNI4
CNSTI4 2352
ADDRLP4 16
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $553
ADDRLP4 16
INDIRI4
CNSTI4 32
LTI4 $553
line 1183
;1182:			ent->client->ps.fd.killSoundEntIndex[channel-50] >= MAX_CLIENTS)
;1183:		{
line 1184
;1184:			G_MuteSound(ent->client->ps.fd.killSoundEntIndex[channel-50], CHAN_VOICE);
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 1185
;1185:			if (ent->client->ps.fd.killSoundEntIndex[channel-50] >= MAX_CLIENTS && g_entities[ent->client->ps.fd.killSoundEntIndex[channel-50]].inuse)
ADDRLP4 20
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 32
LTI4 $556
CNSTI4 2352
ADDRLP4 20
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $556
line 1186
;1186:			{
line 1187
;1187:				G_FreeEntity(&g_entities[ent->client->ps.fd.killSoundEntIndex[channel-50]]);
CNSTI4 2352
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1188
;1188:			}
LABELV $556
line 1189
;1189:			ent->client->ps.fd.killSoundEntIndex[channel-50] = 0;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1190
;1190:		}
LABELV $553
line 1192
;1191:
;1192:		ent->client->ps.fd.killSoundEntIndex[channel-50] = te->s.number;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 1193
;1193:		te->s.trickedentindex = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1194
;1194:		te->s.eFlags = EF_SOUNDTRACKER;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 8388608
ASGNI4
line 1196
;1195:		//te->freeAfterEvent = qfalse;
;1196:	}
LABELV $551
line 1197
;1197:}
LABELV $550
endproc G_Sound 24 12
export G_SoundAtLoc
proc G_SoundAtLoc 8 8
line 1204
;1198:
;1199:/*
;1200:=============
;1201:G_SoundAtLoc
;1202:=============
;1203:*/
;1204:void G_SoundAtLoc( vec3_t loc, int channel, int soundIndex ) {
line 1207
;1205:	gentity_t	*te;
;1206:
;1207:	te = G_TempEntity( loc, EV_GENERAL_SOUND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1208
;1208:	te->s.eventParm = soundIndex;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1209
;1209:}
LABELV $559
endproc G_SoundAtLoc 8 8
export G_EntitySound
proc G_EntitySound 8 8
line 1216
;1210:
;1211:/*
;1212:=============
;1213:G_EntitySound
;1214:=============
;1215:*/
;1216:void G_EntitySound( gentity_t *ent, int channel, int soundIndex ) {
line 1219
;1217:	gentity_t	*te;
;1218:
;1219:	te = G_TempEntity( ent->r.currentOrigin, EV_ENTITY_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 69
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1220
;1220:	te->s.eventParm = soundIndex;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1221
;1221:	te->s.weapon = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1222
;1222:	te->s.trickedentindex = channel;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1223
;1223:}
LABELV $560
endproc G_EntitySound 8 8
export ValidUseTarget
proc ValidUseTarget 0 0
line 1236
;1224:
;1225:
;1226://==============================================================================
;1227:
;1228:/*
;1229:==============
;1230:ValidUseTarget
;1231:
;1232:Returns whether or not the targeted entity is useable
;1233:==============
;1234:*/
;1235:qboolean ValidUseTarget( gentity_t *ent )
;1236:{
line 1237
;1237:	if ( !ent->use )
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $562
line 1238
;1238:	{
line 1239
;1239:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $561
JUMPV
LABELV $562
line 1242
;1240:	}
;1241:
;1242:	if ( !(ent->r.svFlags & SVF_PLAYER_USABLE) )
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $564
line 1243
;1243:	{//Check for flag that denotes BUTTON_USE useability
line 1244
;1244:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $561
JUMPV
LABELV $564
line 1247
;1245:	}
;1246:
;1247:	return qtrue;
CNSTI4 1
RETI4
LABELV $561
endproc ValidUseTarget 0 0
export TryUse
proc TryUse 1156 28
line 1262
;1248:}
;1249:
;1250:/*
;1251:==============
;1252:TryUse
;1253:
;1254:Try and use an entity in the world, directly ahead of us
;1255:==============
;1256:*/
;1257:
;1258:#define USE_DISTANCE	64.0f
;1259:
;1260:extern void Touch_Button(gentity_t *ent, gentity_t *other, trace_t *trace );
;1261:void TryUse( gentity_t *ent )
;1262:{
line 1268
;1263:	gentity_t	*target;
;1264:	trace_t		trace;
;1265:	vec3_t		src, dest, vf;
;1266:	vec3_t		viewspot;
;1267:
;1268:	VectorCopy(ent->client->ps.origin, viewspot);
ADDRLP4 1120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1269
;1269:	viewspot[2] += ent->client->ps.viewheight;
ADDRLP4 1120+8
ADDRLP4 1120+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1271
;1270:
;1271:	VectorCopy( viewspot, src );
ADDRLP4 0
ADDRLP4 1120
INDIRB
ASGNB 12
line 1272
;1272:	AngleVectors( ent->client->ps.viewangles, vf, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1132
CNSTP4 0
ASGNP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1274
;1273:
;1274:	VectorMA( src, USE_DISTANCE, vf, dest );
ADDRLP4 1136
CNSTF4 1115684864
ASGNF4
ADDRLP4 1092
ADDRLP4 0
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 1104
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 1104+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1092+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 1104+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1277
;1275:
;1276:	//Trace ahead to find a valid target
;1277:	JP_Trace( &trace, src, vec3_origin, vec3_origin, dest, ent->s.number, MASK_OPAQUE|CONTENTS_SOLID|CONTENTS_BODY|CONTENTS_ITEM|CONTENTS_CORPSE );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1140
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 1092
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1180419
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1279
;1278:	
;1279:	if ( trace.fraction == 1.0f || trace.entityNum < 1 )
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $578
ADDRLP4 12+52
INDIRI4
CNSTI4 1
GEI4 $574
LABELV $578
line 1280
;1280:	{
line 1281
;1281:		return;
ADDRGP4 $566
JUMPV
LABELV $574
line 1284
;1282:	}
;1283:
;1284:	target = &g_entities[trace.entityNum];
ADDRLP4 1116
CNSTI4 2352
ADDRLP4 12+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1287
;1285:
;1286:	//Check for a use command
;1287:	if ( ValidUseTarget( target ) )
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1144
ADDRGP4 ValidUseTarget
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
EQI4 $580
line 1288
;1288:	{
line 1296
;1289:		/*
;1290:		NPC_SetAnim( ent, SETANIM_TORSO, BOTH_FORCEPUSH, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD );
;1291:		if ( !VectorLengthSquared( ent->client->ps.velocity ) )
;1292:		{
;1293:			NPC_SetAnim( ent, SETANIM_LEGS, BOTH_FORCEPUSH, SETANIM_FLAG_NORMAL|SETANIM_FLAG_HOLD );
;1294:		}
;1295:		*/
;1296:		if ( target->touch == Touch_Button )
ADDRLP4 1116
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 Touch_Button
CVPU4 4
NEU4 $582
line 1297
;1297:		{//pretend we touched it
line 1298
;1298:			target->touch(target, ent, NULL);
ADDRLP4 1116
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 1116
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CALLV
pop
line 1299
;1299:		}
ADDRGP4 $566
JUMPV
LABELV $582
line 1301
;1300:		else
;1301:		{
line 1302
;1302:			target->use(target, ent, ent);
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1116
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CALLV
pop
line 1303
;1303:		}
line 1304
;1304:		return;
LABELV $580
line 1306
;1305:	}
;1306:}
LABELV $566
endproc TryUse 1156 28
export G_PointInBounds
proc G_PointInBounds 12 0
line 1309
;1307:
;1308:qboolean G_PointInBounds( vec3_t point, vec3_t mins, vec3_t maxs )
;1309:{
line 1312
;1310:	int i;
;1311:
;1312:	for(i = 0; i < 3; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $585
line 1313
;1313:	{
line 1314
;1314:		if ( point[i] < mins[i] )
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
GEF4 $589
line 1315
;1315:		{
line 1316
;1316:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $584
JUMPV
LABELV $589
line 1318
;1317:		}
;1318:		if ( point[i] > maxs[i] )
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
LEF4 $591
line 1319
;1319:		{
line 1320
;1320:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $584
JUMPV
LABELV $591
line 1322
;1321:		}
;1322:	}
LABELV $586
line 1312
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $585
line 1324
;1323:
;1324:	return qtrue;
CNSTI4 1
RETI4
LABELV $584
endproc G_PointInBounds 12 0
export G_BoxInBounds
proc G_BoxInBounds 56 0
line 1328
;1325:}
;1326:
;1327:qboolean G_BoxInBounds( vec3_t point, vec3_t mins, vec3_t maxs, vec3_t boundsMins, vec3_t boundsMaxs )
;1328:{
line 1332
;1329:	vec3_t boxMins;
;1330:	vec3_t boxMaxs;
;1331:
;1332:	VectorAdd( point, mins, boxMins );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 28
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 32
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 36
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1333
;1333:	VectorAdd( point, maxs, boxMaxs );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 44
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 12+4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 52
CNSTI4 8
ASGNI4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1335
;1334:
;1335:	if(boxMaxs[0]>boundsMaxs[0])
ADDRLP4 12
INDIRF4
ADDRFP4 16
INDIRP4
INDIRF4
LEF4 $598
line 1336
;1336:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $593
JUMPV
LABELV $598
line 1338
;1337:
;1338:	if(boxMaxs[1]>boundsMaxs[1])
ADDRLP4 12+4
INDIRF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
LEF4 $600
line 1339
;1339:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $593
JUMPV
LABELV $600
line 1341
;1340:
;1341:	if(boxMaxs[2]>boundsMaxs[2])
ADDRLP4 12+8
INDIRF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
LEF4 $603
line 1342
;1342:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $593
JUMPV
LABELV $603
line 1344
;1343:
;1344:	if(boxMins[0]<boundsMins[0])
ADDRLP4 0
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
GEF4 $606
line 1345
;1345:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $593
JUMPV
LABELV $606
line 1347
;1346:
;1347:	if(boxMins[1]<boundsMins[1])
ADDRLP4 0+4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
GEF4 $608
line 1348
;1348:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $593
JUMPV
LABELV $608
line 1350
;1349:
;1350:	if(boxMins[2]<boundsMins[2])
ADDRLP4 0+8
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
GEF4 $611
line 1351
;1351:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $593
JUMPV
LABELV $611
line 1354
;1352:
;1353:	//box is completely contained within bounds
;1354:	return qtrue;
CNSTI4 1
RETI4
LABELV $593
endproc G_BoxInBounds 56 0
export G_SetAngles
proc G_SetAngles 0 0
line 1359
;1355:}
;1356:
;1357:
;1358:void G_SetAngles( gentity_t *ent, vec3_t angles )
;1359:{
line 1360
;1360:	VectorCopy( angles, ent->r.currentAngles );
ADDRFP4 0
INDIRP4
CNSTI4 380
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1361
;1361:	VectorCopy( angles, ent->s.angles );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1362
;1362:	VectorCopy( angles, ent->s.apos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1363
;1363:}
LABELV $614
endproc G_SetAngles 0 0
bss
align 4
LABELV $616
skip 1080
export G_ClearTrace
code
proc G_ClearTrace 4 28
line 1366
;1364:
;1365:qboolean G_ClearTrace( vec3_t start, vec3_t mins, vec3_t maxs, vec3_t end, int ignore, int clipmask )
;1366:{
line 1369
;1367:	static	trace_t	tr;
;1368:
;1369:	JP_Trace( &tr, start, mins, maxs, end, ignore, clipmask );
ADDRGP4 $616
ARGP4
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
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1371
;1370:
;1371:	if ( tr.allsolid || tr.startsolid || tr.fraction < 1.0 )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $616
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $622
ADDRGP4 $616+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $622
ADDRGP4 $616+8
INDIRF4
CNSTF4 1065353216
GEF4 $617
LABELV $622
line 1372
;1372:	{
line 1373
;1373:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $615
JUMPV
LABELV $617
line 1376
;1374:	}
;1375:
;1376:	return qtrue;
CNSTI4 1
RETI4
LABELV $615
endproc G_ClearTrace 4 28
export G_SetOrigin
proc G_SetOrigin 8 0
line 1387
;1377:}
;1378:
;1379:
;1380:/*
;1381:================
;1382:G_SetOrigin
;1383:
;1384:Sets the pos trajectory for a fixed position
;1385:================
;1386:*/
;1387:void G_SetOrigin( gentity_t *ent, vec3_t origin ) {
line 1388
;1388:	VectorCopy( origin, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1389
;1389:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1390
;1390:	ent->s.pos.trTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1391
;1391:	ent->s.pos.trDuration = 0;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 1392
;1392:	VectorClear( ent->s.pos.trDelta );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1394
;1393:
;1394:	VectorCopy( origin, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1395
;1395:}
LABELV $623
endproc G_SetOrigin 8 0
lit
align 4
LABELV $625
byte 4 0
byte 4 0
byte 4 1065353216
export DebugLine
code
proc DebugLine 116 12
line 1405
;1396:
;1397:/*
;1398:================
;1399:DebugLine
;1400:
;1401:  debug polygons only work when running a local game
;1402:  with r_debugSurface set to 2
;1403:================
;1404:*/
;1405:int DebugLine(vec3_t start, vec3_t end, int color) {
line 1406
;1406:	vec3_t points[4], dir, cross, up = {0, 0, 1};
ADDRLP4 72
ADDRGP4 $625
INDIRB
ASGNB 12
line 1409
;1407:	float dot;
;1408:
;1409:	VectorCopy(start, points[0]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1410
;1410:	VectorCopy(start, points[1]);
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1412
;1411:	//points[1][2] -= 2;
;1412:	VectorCopy(end, points[2]);
ADDRLP4 0+24
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1414
;1413:	//points[2][2] -= 2;
;1414:	VectorCopy(end, points[3]);
ADDRLP4 0+36
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1417
;1415:
;1416:
;1417:	VectorSubtract(end, start, dir);
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 88
INDIRP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 96
CNSTI4 4
ASGNI4
ADDRLP4 60+4
ADDRLP4 88
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 100
CNSTI4 8
ASGNI4
ADDRLP4 60+8
ADDRFP4 4
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1418
;1418:	VectorNormalize(dir);
ADDRLP4 60
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1419
;1419:	dot = DotProduct(dir, up);
ADDRLP4 84
ADDRLP4 60
INDIRF4
ADDRLP4 72
INDIRF4
MULF4
ADDRLP4 60+4
INDIRF4
ADDRLP4 72+4
INDIRF4
MULF4
ADDF4
ADDRLP4 60+8
INDIRF4
ADDRLP4 72+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1420
;1420:	if (dot > 0.99 || dot < -0.99) VectorSet(cross, 1, 0, 0);
ADDRLP4 84
INDIRF4
CNSTF4 1065185444
GTF4 $637
ADDRLP4 84
INDIRF4
CNSTF4 3212669092
GEF4 $635
LABELV $637
ADDRLP4 48
CNSTF4 1065353216
ASGNF4
ADDRLP4 48+4
CNSTF4 0
ASGNF4
ADDRLP4 48+8
CNSTF4 0
ASGNF4
ADDRGP4 $636
JUMPV
LABELV $635
line 1421
;1421:	else CrossProduct(dir, up, cross);
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
LABELV $636
line 1423
;1422:
;1423:	VectorNormalize(cross);
ADDRLP4 48
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1425
;1424:
;1425:	VectorMA(points[0], 2, cross, points[0]);
ADDRLP4 108
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1073741824
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1426
;1426:	VectorMA(points[1], -2, cross, points[1]);
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
CNSTF4 3221225472
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+4
ADDRLP4 0+12+4
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+8
ADDRLP4 0+12+8
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1427
;1427:	VectorMA(points[2], -2, cross, points[2]);
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 3221225472
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+8
ADDRLP4 0+24+8
INDIRF4
CNSTF4 3221225472
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1428
;1428:	VectorMA(points[3], 2, cross, points[3]);
ADDRLP4 0+36
ADDRLP4 0+36
INDIRF4
CNSTF4 1073741824
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+36+4
ADDRLP4 0+36+4
INDIRF4
CNSTF4 1073741824
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+36+8
ADDRLP4 0+36+8
INDIRF4
CNSTF4 1073741824
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1430
;1429:
;1430:	return trap_DebugPolygonCreate(color, 4, points);
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 112
ADDRGP4 trap_DebugPolygonCreate
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
RETI4
LABELV $624
endproc DebugLine 116 12
export G_ROFF_NotetrackCallback
proc G_ROFF_NotetrackCallback 296 12
line 1434
;1431:}
;1432:
;1433:void G_ROFF_NotetrackCallback( gentity_t *cent, const char *notetrack)
;1434:{
line 1436
;1435:	char type[256];
;1436:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1437
;1437:	int addlArg = 0;
ADDRLP4 260
CNSTI4 0
ASGNI4
line 1439
;1438:
;1439:	if (!cent || !notetrack)
ADDRLP4 264
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 264
INDIRU4
EQU4 $685
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 264
INDIRU4
NEU4 $687
LABELV $685
line 1440
;1440:	{
line 1441
;1441:		return;
ADDRGP4 $682
JUMPV
LABELV $686
line 1445
;1442:	}
;1443:
;1444:	while (notetrack[i] && notetrack[i] != ' ')
;1445:	{
line 1446
;1446:		type[i] = notetrack[i];
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 1447
;1447:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1448
;1448:	}
LABELV $687
line 1444
ADDRLP4 268
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $689
ADDRLP4 268
INDIRI4
CNSTI4 32
NEI4 $686
LABELV $689
line 1450
;1449:
;1450:	type[i] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 1452
;1451:
;1452:	if (!i || !type[0])
ADDRLP4 272
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 272
INDIRI4
EQI4 $692
ADDRLP4 4
INDIRI1
CVII4 1
ADDRLP4 272
INDIRI4
NEI4 $690
LABELV $692
line 1453
;1453:	{
line 1454
;1454:		return;
ADDRGP4 $682
JUMPV
LABELV $690
line 1457
;1455:	}
;1456:
;1457:	if (notetrack[i] == ' ')
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $693
line 1458
;1458:	{
line 1459
;1459:		addlArg = 1;
ADDRLP4 260
CNSTI4 1
ASGNI4
line 1460
;1460:	}
LABELV $693
line 1462
;1461:
;1462:	if (strcmp(type, "loop") == 0)
ADDRLP4 4
ARGP4
ADDRGP4 $697
ARGP4
ADDRLP4 276
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $695
line 1463
;1463:	{
line 1464
;1464:		if (addlArg) //including an additional argument means reset to original position before loop
ADDRLP4 260
INDIRI4
CNSTI4 0
EQI4 $698
line 1465
;1465:		{
line 1466
;1466:			VectorCopy(cent->s.origin2, cent->s.pos.trBase);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 280
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1467
;1467:			VectorCopy(cent->s.origin2, cent->r.currentOrigin);
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 284
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1468
;1468:			VectorCopy(cent->s.angles2, cent->s.apos.trBase);
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 288
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 1469
;1469:			VectorCopy(cent->s.angles2, cent->r.currentAngles);
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 292
INDIRP4
CNSTI4 128
ADDP4
INDIRB
ASGNB 12
line 1470
;1470:		}
LABELV $698
line 1472
;1471:
;1472:		trap_ROFF_Play(cent->s.number, cent->roffid, qfalse);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
INDIRP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_ROFF_Play
CALLI4
pop
line 1473
;1473:	}
LABELV $695
line 1474
;1474:}
LABELV $682
endproc G_ROFF_NotetrackCallback 296 12
import Touch_Button
import ShouldNotCollide
bss
export gG2KillIndex
align 4
LABELV gG2KillIndex
skip 256
export remappedShaders
align 4
LABELV remappedShaders
skip 16896
import ClientInactivitySpecTimerReset
import G_ResetClientVote
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
import G_RunObject
import G_TouchSolids
import G_TouchTriggers
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
LABELV $697
byte 1 108
byte 1 111
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $522
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $483
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $480
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $456
byte 1 107
byte 1 103
byte 1 50
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $452
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $448
byte 1 107
byte 1 103
byte 1 50
byte 1 0
align 1
LABELV $434
byte 1 71
byte 1 95
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 76
byte 1 111
byte 1 103
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $400
byte 1 71
byte 1 95
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $398
byte 1 37
byte 1 52
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $380
byte 1 71
byte 1 95
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 111
byte 1 109
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $344
byte 1 94
byte 1 51
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 72
byte 1 97
byte 1 115
byte 1 104
byte 1 84
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 67
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 115
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 119
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 101
byte 1 114
byte 1 114
byte 1 105
byte 1 98
byte 1 108
byte 1 121
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 46
byte 1 0
align 1
LABELV $327
byte 1 94
byte 1 51
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 104
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 104
byte 1 32
byte 1 37
byte 1 100
byte 1 33
byte 1 33
byte 1 0
align 1
LABELV $303
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $292
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 0
align 1
LABELV $285
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $280
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $264
byte 1 71
byte 1 95
byte 1 80
byte 1 105
byte 1 99
byte 1 107
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 115
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
byte 1 10
byte 1 0
align 1
LABELV $252
byte 1 71
byte 1 95
byte 1 80
byte 1 105
byte 1 99
byte 1 107
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $178
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $163
byte 1 71
byte 1 95
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $144
byte 1 37
byte 1 115
byte 1 61
byte 1 37
byte 1 115
byte 1 58
byte 1 37
byte 1 53
byte 1 46
byte 1 50
byte 1 102
byte 1 64
byte 1 0
