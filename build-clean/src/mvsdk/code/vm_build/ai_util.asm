export B_TempAlloc
code
proc B_TempAlloc 4 4
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\ai_util.c"
line 15
;1:#include "g_local.h"
;2:#include "q_shared.h"
;3:#include "botlib.h"
;4:#include "ai_main.h"
;5:
;6:#ifdef BOT_ZMALLOC
;7:#define MAX_BALLOC 8192
;8:
;9:void *BAllocList[MAX_BALLOC];
;10:#endif
;11:
;12:char gBotChatBuffer[MAX_CLIENTS][MAX_CHAT_BUFFER_SIZE];
;13:
;14:void *B_TempAlloc(int size)
;15:{
line 16
;16:	return BG_TempAlloc(size);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_TempAlloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $125
endproc B_TempAlloc 4 4
export B_TempFree
proc B_TempFree 0 4
line 20
;17:}
;18:
;19:void B_TempFree(int size)
;20:{
line 21
;21:	BG_TempFree(size);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BG_TempFree
CALLV
pop
line 22
;22:}
LABELV $126
endproc B_TempFree 0 4
export B_Alloc
proc B_Alloc 4 4
line 26
;23:
;24:
;25:void *B_Alloc(int size)
;26:{
line 77
;27:#ifdef BOT_ZMALLOC
;28:	void *ptr = NULL;
;29:	int i = 0;
;30:
;31:#ifdef BOTMEMTRACK
;32:	int free = 0;
;33:	int used = 0;
;34:
;35:	while (i < MAX_BALLOC)
;36:	{
;37:		if (!BAllocList[i])
;38:		{
;39:			free++;
;40:		}
;41:		else
;42:		{
;43:			used++;
;44:		}
;45:
;46:		i++;
;47:	}
;48:
;49:	G_Printf("Allocations used: %i\nFree allocation slots: %i\n", used, free);
;50:
;51:	i = 0;
;52:#endif
;53:
;54:	ptr = trap_BotGetMemoryGame(size);
;55:
;56:	while (i < MAX_BALLOC)
;57:	{
;58:		if (!BAllocList[i])
;59:		{
;60:			BAllocList[i] = ptr;
;61:			break;
;62:		}
;63:		i++;
;64:	}
;65:
;66:	if (i == MAX_BALLOC)
;67:	{
;68:		//If this happens we'll have to rely on this chunk being freed manually with B_Free, which it hopefully will be
;69:#ifdef DEBUG
;70:		G_Printf("WARNING: MAXIMUM B_ALLOC ALLOCATIONS EXCEEDED\n");
;71:#endif
;72:	}
;73:
;74:	return ptr;
;75:#else
;76:
;77:	return BG_Alloc(size);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $127
endproc B_Alloc 4 4
export B_Free
proc B_Free 0 0
line 83
;78:
;79:#endif
;80:}
;81:
;82:void B_Free(void *ptr)
;83:{
line 131
;84:#ifdef BOT_ZMALLOC
;85:	int i = 0;
;86:
;87:#ifdef BOTMEMTRACK
;88:	int free = 0;
;89:	int used = 0;
;90:
;91:	while (i < MAX_BALLOC)
;92:	{
;93:		if (!BAllocList[i])
;94:		{
;95:			free++;
;96:		}
;97:		else
;98:		{
;99:			used++;
;100:		}
;101:
;102:		i++;
;103:	}
;104:
;105:	G_Printf("Allocations used: %i\nFree allocation slots: %i\n", used, free);
;106:
;107:	i = 0;
;108:#endif
;109:
;110:	while (i < MAX_BALLOC)
;111:	{
;112:		if (BAllocList[i] == ptr)
;113:		{
;114:			BAllocList[i] = NULL;
;115:			break;
;116:		}
;117:
;118:		i++;
;119:	}
;120:
;121:	if (i == MAX_BALLOC)
;122:	{
;123:		//Likely because the limit was exceeded and we're now freeing the chunk manually as we hoped would happen
;124:#ifdef DEBUG
;125:		G_Printf("WARNING: Freeing allocation which is not in the allocation structure\n");
;126:#endif
;127:	}
;128:
;129:	trap_BotFreeMemoryGame(ptr);
;130:#endif
;131:}
LABELV $128
endproc B_Free 0 0
export B_InitAlloc
proc B_InitAlloc 0 12
line 134
;132:
;133:void B_InitAlloc(void)
;134:{
line 139
;135:#ifdef BOT_ZMALLOC
;136:	memset(BAllocList, 0, sizeof(BAllocList));
;137:#endif
;138:
;139:	memset(gWPArray, 0, sizeof(gWPArray));
ADDRGP4 gWPArray
ARGP4
CNSTI4 0
ARGI4
CNSTU4 16384
ARGU4
ADDRGP4 memset
CALLP4
pop
line 140
;140:}
LABELV $129
endproc B_InitAlloc 0 12
export B_CleanupAlloc
proc B_CleanupAlloc 0 0
line 143
;141:
;142:void B_CleanupAlloc(void)
;143:{
line 158
;144:#ifdef BOT_ZMALLOC
;145:	int i = 0;
;146:
;147:	while (i < MAX_BALLOC)
;148:	{
;149:		if (BAllocList[i])
;150:		{
;151:			trap_BotFreeMemoryGame(BAllocList[i]);
;152:			BAllocList[i] = NULL;
;153:		}
;154:
;155:		i++;
;156:	}
;157:#endif
;158:}
LABELV $130
endproc B_CleanupAlloc 0 0
export GetValueGroup
proc GetValueGroup 40 8
line 161
;159:
;160:int GetValueGroup(char *buf, char *group, char *outbuf)
;161:{
line 166
;162:	char *place, *placesecond;
;163:	int failure;
;164:	int i;
;165:	int startpoint, startletter;
;166:	int subg = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 168
;167:
;168:	i = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 170
;169:
;170:	place = strstr(buf, group);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
ASGNP4
line 172
;171:
;172:	if (!place)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $132
line 173
;173:	{
line 174
;174:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $132
line 177
;175:	}
;176:
;177:	startpoint = place - buf + strlen(group) + 1;
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CVIU4 4
ADDRLP4 32
INDIRU4
ADDU4
CNSTU4 1
ADDU4
CVUI4 4
ASGNI4
line 178
;178:	startletter = (place - buf) - 1;
ADDRLP4 20
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
SUBI4
ASGNI4
line 180
;179:
;180:	failure = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $135
JUMPV
LABELV $134
line 183
;181:
;182:	while (buf[startpoint+1] != '{' || buf[startletter] != '\n')
;183:	{
line 184
;184:		placesecond = strstr(place+1, group);
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 36
INDIRP4
ASGNP4
line 186
;185:
;186:		if (placesecond)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $137
line 187
;187:		{
line 188
;188:			startpoint += (placesecond - place);
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ADDI4
ASGNI4
line 189
;189:			startletter += (placesecond - place);
ADDRLP4 20
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ADDI4
ASGNI4
line 190
;190:			place = placesecond;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
line 191
;191:		}
ADDRGP4 $138
JUMPV
LABELV $137
line 193
;192:		else
;193:		{
line 194
;194:			failure = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 195
;195:			break;
ADDRGP4 $136
JUMPV
LABELV $138
line 197
;196:		}
;197:	}
LABELV $135
line 182
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 36
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $134
ADDRLP4 20
INDIRI4
ADDRLP4 36
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $134
LABELV $136
line 199
;198:
;199:	if (failure)
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $142
line 200
;200:	{
line 201
;201:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $131
JUMPV
LABELV $141
line 208
;202:	}
;203:
;204:	//we have found the proper group name if we made it here, so find the opening brace and read into the outbuf
;205:	//until hitting the end brace
;206:
;207:	while (buf[startpoint] != '{')
;208:	{
line 209
;209:		startpoint++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 210
;210:	}
LABELV $142
line 207
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $141
line 212
;211:
;212:	startpoint++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $145
JUMPV
LABELV $144
line 215
;213:
;214:	while (buf[startpoint] != '}' || subg)
;215:	{
line 216
;216:		if (buf[startpoint] == '{')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $147
line 217
;217:		{
line 218
;218:			subg++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 219
;219:		}
ADDRGP4 $148
JUMPV
LABELV $147
line 220
;220:		else if (buf[startpoint] == '}')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $149
line 221
;221:		{
line 222
;222:			subg--;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 223
;223:		}
LABELV $149
LABELV $148
line 224
;224:		outbuf[i] = buf[startpoint];
ADDRLP4 12
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 225
;225:		i++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 226
;226:		startpoint++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 227
;227:	}
LABELV $145
line 214
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $144
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $144
line 228
;228:	outbuf[i] = '\0';
ADDRLP4 12
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 230
;229:
;230:	return 1;
CNSTI4 1
RETI4
LABELV $131
endproc GetValueGroup 40 8
export GetPairedValue
proc GetPairedValue 64 8
line 234
;231:}
;232:
;233:int GetPairedValue(char *buf, char *key, char *outbuf)
;234:{
line 239
;235:	char *place, *placesecond;
;236:	int startpoint, startletter;
;237:	int i, found;
;238:
;239:	if (!buf || !key || !outbuf)
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $155
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $155
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
NEU4 $152
LABELV $155
line 240
;240:	{
line 241
;241:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $151
JUMPV
LABELV $152
line 244
;242:	}
;243:
;244:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $156
line 247
;245:
;246:	while (buf[i] && buf[i] != '\0')
;247:	{
line 248
;248:		if (buf[i] == '/')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $159
line 249
;249:		{
line 250
;250:			if (buf[i+1] && buf[i+1] != '\0' && buf[i+1] == '/')
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $161
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $161
ADDRLP4 28
INDIRI4
CNSTI4 47
NEI4 $161
line 251
;251:			{
ADDRGP4 $164
JUMPV
LABELV $163
line 253
;252:				while (buf[i] != '\n')
;253:				{
line 254
;254:					buf[i] = '/';
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 47
ASGNI1
line 255
;255:					i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 256
;256:				}
LABELV $164
line 252
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $163
line 257
;257:			}
LABELV $161
line 258
;258:		}
LABELV $159
line 259
;259:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 260
;260:	}
LABELV $157
line 246
ADDRLP4 28
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $166
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $156
LABELV $166
line 262
;261:
;262:	place = strstr(buf, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 36
INDIRP4
ASGNP4
line 264
;263:
;264:	if (!place)
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $167
line 265
;265:	{
line 266
;266:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $151
JUMPV
LABELV $167
line 269
;267:	}
;268:	//tab == 9
;269:	startpoint = place - buf + strlen(key);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CVIU4 4
ADDRLP4 40
INDIRU4
ADDU4
CVUI4 4
ASGNI4
line 270
;270:	startletter = (place - buf) - 1;
ADDRLP4 8
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
SUBI4
ASGNI4
line 272
;271:
;272:	found = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $170
JUMPV
LABELV $169
line 275
;273:
;274:	while (!found)
;275:	{
line 276
;276:		if (startletter == 0 || !buf[startletter] || buf[startletter] == '\0' || buf[startletter] == 9 || buf[startletter] == ' ' || buf[startletter] == '\n')
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $178
ADDRLP4 52
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $178
ADDRLP4 52
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $178
ADDRLP4 52
INDIRI4
CNSTI4 9
EQI4 $178
ADDRLP4 52
INDIRI4
CNSTI4 32
EQI4 $178
ADDRLP4 52
INDIRI4
CNSTI4 10
NEI4 $172
LABELV $178
line 277
;277:		{
line 278
;278:			if (buf[startpoint] == '\0' || buf[startpoint] == 9 || buf[startpoint] == ' ' || buf[startpoint] == '\n')
ADDRLP4 56
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $183
ADDRLP4 56
INDIRI4
CNSTI4 9
EQI4 $183
ADDRLP4 56
INDIRI4
CNSTI4 32
EQI4 $183
ADDRLP4 56
INDIRI4
CNSTI4 10
NEI4 $179
LABELV $183
line 279
;279:			{
line 280
;280:				found = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 281
;281:				break;
ADDRGP4 $171
JUMPV
LABELV $179
line 283
;282:			}
;283:		}
LABELV $172
line 285
;284:
;285:		placesecond = strstr(place+1, key);
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 56
INDIRP4
ASGNP4
line 287
;286:
;287:		if (placesecond)
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $184
line 288
;288:		{
line 289
;289:			startpoint += placesecond - place;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ADDI4
ASGNI4
line 290
;290:			startletter += placesecond - place;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ADDI4
ASGNI4
line 291
;291:			place = placesecond;
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 292
;292:		}
ADDRGP4 $185
JUMPV
LABELV $184
line 294
;293:		else
;294:		{
line 295
;295:			place = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 296
;296:			break;
ADDRGP4 $171
JUMPV
LABELV $185
line 299
;297:		}
;298:
;299:	}
LABELV $170
line 274
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $169
LABELV $171
line 301
;300:
;301:	if (!found || !place || !buf[startpoint] || buf[startpoint] == '\0')
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $190
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $190
ADDRLP4 48
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $190
ADDRLP4 48
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $192
LABELV $190
line 302
;302:	{
line 303
;303:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $151
JUMPV
LABELV $191
line 307
;304:	}
;305:
;306:	while (buf[startpoint] == ' ' || buf[startpoint] == 9 || buf[startpoint] == '\n')
;307:	{
line 308
;308:		startpoint++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 309
;309:	}
LABELV $192
line 306
ADDRLP4 52
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 32
EQI4 $191
ADDRLP4 52
INDIRI4
CNSTI4 9
EQI4 $191
ADDRLP4 52
INDIRI4
CNSTI4 10
EQI4 $191
line 311
;310:
;311:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $195
JUMPV
LABELV $194
line 314
;312:
;313:	while (buf[startpoint] && buf[startpoint] != '\0' && buf[startpoint] != '\n')
;314:	{
line 315
;315:		outbuf[i] = buf[startpoint];
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 316
;316:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 317
;317:		startpoint++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 318
;318:	}
LABELV $195
line 313
ADDRLP4 56
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $198
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $198
ADDRLP4 56
INDIRI4
CNSTI4 10
NEI4 $194
LABELV $198
line 320
;319:
;320:	outbuf[i] = '\0';
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 322
;321:
;322:	return 1;
CNSTI4 1
RETI4
LABELV $151
endproc GetPairedValue 64 8
export BotDoChat
proc BotDoChat 108 20
line 326
;323:}
;324:
;325:int BotDoChat(bot_state_t *bs, char *section, int always)
;326:{
line 337
;327:	char *chatgroup;
;328:	int rVal;
;329:	int inc_1;
;330:	int inc_2;
;331:	int inc_n;
;332:	int lines;
;333:	int checkedline;
;334:	int getthisline;
;335:	gentity_t *cobject;
;336:
;337:	if (!bs->canChat)
ADDRFP4 0
INDIRP4
CNSTI4 2092
ADDP4
INDIRI4
CNSTI4 0
NEI4 $200
line 338
;338:	{
line 339
;339:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $200
line 342
;340:	}
;341:
;342:	if (bs->doChat)
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $202
line 343
;343:	{ //already have a chat scheduled
line 344
;344:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $202
line 347
;345:	}
;346:
;347:	if (trap_Cvar_VariableIntegerValue("sp_language"))
ADDRGP4 $206
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $204
line 348
;348:	{ //no chatting unless English.
line 349
;349:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $204
line 352
;350:	}
;351:
;352:	if (Q_irand(1, 10, qfalse, 5) > bs->chatFrequency && !always)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 40
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2096
ADDP4
INDIRI4
LEI4 $207
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $207
line 353
;353:	{
line 354
;354:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $207
line 357
;355:	}
;356:
;357:	bs->chatTeam = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2240
ADDP4
CNSTI4 0
ASGNI4
line 359
;358:
;359:	chatgroup = (char *)B_TempAlloc(MAX_CHAT_BUFFER_SIZE);
CNSTI4 8192
ARGI4
ADDRLP4 44
ADDRGP4 B_TempAlloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
ASGNP4
line 361
;360:
;361:	rVal = GetValueGroup(gBotChatBuffer[bs->client], section, chatgroup);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 gBotChatBuffer
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 GetValueGroup
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 48
INDIRI4
ASGNI4
line 363
;362:
;363:	if (!rVal) //the bot has no group defined for the specified chat event
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $209
line 364
;364:	{
line 365
;365:		B_TempFree(MAX_CHAT_BUFFER_SIZE); //chatgroup
CNSTI4 8192
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 366
;366:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $209
line 369
;367:	}
;368:
;369:	inc_1 = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 370
;370:	inc_2 = 2;
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRGP4 $212
JUMPV
LABELV $211
line 373
;371:
;372:	while (chatgroup[inc_2] && chatgroup[inc_2] != '\0')
;373:	{
line 374
;374:		if (chatgroup[inc_2] != 13 && chatgroup[inc_2] != 9)
ADDRLP4 52
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 13
EQI4 $214
ADDRLP4 52
INDIRI4
CNSTI4 9
EQI4 $214
line 375
;375:		{
line 376
;376:			chatgroup[inc_1] = chatgroup[inc_2];
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 377
;377:			inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 378
;378:		}
LABELV $214
line 379
;379:		inc_2++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 380
;380:	}
LABELV $212
line 372
ADDRLP4 52
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $216
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $211
LABELV $216
line 381
;381:	chatgroup[inc_1] = '\0';
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 383
;382:
;383:	inc_1 = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 385
;384:
;385:	lines = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRGP4 $218
JUMPV
LABELV $217
line 388
;386:
;387:	while (chatgroup[inc_1] && chatgroup[inc_1] != '\0')
;388:	{
line 389
;389:		if (chatgroup[inc_1] == '\n')
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $220
line 390
;390:		{
line 391
;391:			lines++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 392
;392:		}
LABELV $220
line 393
;393:		inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 394
;394:	}
LABELV $218
line 387
ADDRLP4 60
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $222
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $217
LABELV $222
line 396
;395:
;396:	if (!lines)
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $223
line 397
;397:	{
line 398
;398:		B_TempFree(MAX_CHAT_BUFFER_SIZE); //chatgroup
CNSTI4 8192
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 399
;399:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $223
line 402
;400:	}
;401:
;402:	getthisline = Q_irand(0, (lines+1), qfalse, (lines+1)/2);
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 72
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRLP4 76
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 76
INDIRI4
ASGNI4
line 404
;403:
;404:	if (getthisline < 1)
ADDRLP4 20
INDIRI4
CNSTI4 1
GEI4 $225
line 405
;405:	{
line 406
;406:		getthisline = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 407
;407:	}
LABELV $225
line 408
;408:	if (getthisline > lines)
ADDRLP4 20
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $227
line 409
;409:	{
line 410
;410:		getthisline = lines;
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 411
;411:	}
LABELV $227
line 413
;412:
;413:	checkedline = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 415
;414:
;415:	inc_1 = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $230
JUMPV
LABELV $229
line 418
;416:
;417:	while (checkedline != getthisline)
;418:	{
line 419
;419:		if (chatgroup[inc_1] && chatgroup[inc_1] != '\0')
ADDRLP4 80
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $232
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $232
line 420
;420:		{
line 421
;421:			if (chatgroup[inc_1] == '\n')
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $234
line 422
;422:			{
line 423
;423:				inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 424
;424:				checkedline++;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 425
;425:			}
LABELV $234
line 426
;426:		}
LABELV $232
line 428
;427:
;428:		if (checkedline == getthisline)
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $236
line 429
;429:		{
line 430
;430:			break;
ADDRGP4 $231
JUMPV
LABELV $236
line 433
;431:		}
;432:
;433:		inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 434
;434:	}
LABELV $230
line 417
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $229
LABELV $231
line 437
;435:
;436:	//we're at the starting position of the desired line here
;437:	inc_2 = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $239
JUMPV
LABELV $238
line 440
;438:
;439:	while (chatgroup[inc_1] != '\n')
;440:	{
line 441
;441:		chatgroup[inc_2] = chatgroup[inc_1];
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 442
;442:		inc_2++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 443
;443:		inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 444
;444:	}
LABELV $239
line 439
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $238
line 445
;445:	chatgroup[inc_2] = '\0';
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 448
;446:
;447:	//trap_EA_Say(bs->client, chatgroup);
;448:	inc_1 = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 449
;449:	inc_2 = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 451
;450:
;451:	if (strlen(chatgroup) > MAX_CHAT_LINE_SIZE)
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 80
INDIRU4
CNSTU4 128
LEU4 $244
line 452
;452:	{
line 453
;453:		B_TempFree(MAX_CHAT_BUFFER_SIZE); //chatgroup
CNSTI4 8192
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 454
;454:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $199
JUMPV
LABELV $243
line 458
;455:	}
;456:
;457:	while (chatgroup[inc_1])
;458:	{
line 459
;459:		if (chatgroup[inc_1] == '%' && chatgroup[inc_1+1] != '%')
ADDRLP4 92
CNSTI4 37
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 92
INDIRI4
NEI4 $246
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 92
INDIRI4
EQI4 $246
line 460
;460:		{
line 461
;461:			inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 463
;462:
;463:			if (chatgroup[inc_1] == 's' && bs->chatObject)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 115
NEI4 $248
ADDRFP4 0
INDIRP4
CNSTI4 2244
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $248
line 464
;464:			{
line 465
;465:				cobject = bs->chatObject;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 2244
ADDP4
INDIRP4
ASGNP4
line 466
;466:			}
ADDRGP4 $249
JUMPV
LABELV $248
line 467
;467:			else if (chatgroup[inc_1] == 'a' && bs->chatAltObject)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 97
NEI4 $250
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $250
line 468
;468:			{
line 469
;469:				cobject = bs->chatAltObject;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
INDIRP4
ASGNP4
line 470
;470:			}
ADDRGP4 $251
JUMPV
LABELV $250
line 472
;471:			else
;472:			{
line 473
;473:				cobject = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 474
;474:			}
LABELV $251
LABELV $249
line 476
;475:
;476:			if (cobject && cobject->client)
ADDRLP4 100
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 100
INDIRU4
EQU4 $247
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 100
INDIRU4
EQU4 $247
line 477
;477:			{
line 478
;478:				inc_n = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $255
JUMPV
LABELV $254
line 481
;479:
;480:				while (cobject->client->pers.netname[inc_n])
;481:				{
line 482
;482:					bs->currentChat[inc_2] = cobject->client->pers.netname[inc_n];
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ADDP4
INDIRI1
ASGNI1
line 483
;483:					inc_2++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 484
;484:					inc_n++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 485
;485:				}
LABELV $255
line 480
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $254
line 486
;486:				inc_2--; //to make up for the auto-increment below
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 487
;487:			}
line 488
;488:		}
ADDRGP4 $247
JUMPV
LABELV $246
line 490
;489:		else
;490:		{
line 491
;491:			bs->currentChat[inc_2] = chatgroup[inc_1];
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 492
;492:		}
LABELV $247
line 493
;493:		inc_2++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 494
;494:		inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 495
;495:	}
LABELV $244
line 457
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $243
line 496
;496:	bs->currentChat[inc_2] = '\0';
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2100
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 498
;497:
;498:	if (strcmp(section, "GeneralGreetings") == 0)
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 84
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $257
line 499
;499:	{
line 500
;500:		bs->doChat = 2;
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
CNSTI4 2
ASGNI4
line 501
;501:	}
ADDRGP4 $258
JUMPV
LABELV $257
line 503
;502:	else
;503:	{
line 504
;504:		bs->doChat = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
CNSTI4 1
ASGNI4
line 505
;505:	}
LABELV $258
line 506
;506:	bs->chatTime_stored = (strlen(bs->currentChat)*45)+ Q_irandExpectedIf(gRandomUnlockAdd, 1300, 1500, qfalse, 1400);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 2100
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 1300
ARGI4
CNSTI4 1500
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1400
ARGI4
ADDRLP4 96
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 100
CNSTU4 45
ADDRLP4 92
INDIRU4
MULU4
ADDRLP4 96
INDIRI4
CVIU4 4
ADDU4
ASGNU4
ADDRLP4 88
INDIRP4
CNSTI4 2232
ADDP4
CNSTF4 1073741824
ADDRLP4 100
INDIRU4
CNSTI4 1
RSHU4
CVUI4 4
CVIF4 4
MULF4
ADDRLP4 100
INDIRU4
CNSTU4 1
BANDU4
CVUI4 4
CVIF4 4
ADDF4
ASGNF4
line 507
;507:	bs->chatTime = level.time + bs->chatTime_stored;
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 2228
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRLP4 104
INDIRP4
CNSTI4 2232
ADDP4
INDIRF4
ADDF4
ASGNF4
line 509
;508:
;509:	B_TempFree(MAX_CHAT_BUFFER_SIZE); //chatgroup
CNSTI4 8192
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 511
;510:
;511:	return 1;
CNSTI4 1
RETI4
LABELV $199
endproc BotDoChat 108 20
export ParseEmotionalAttachments
proc ParseEmotionalAttachments 60 4
line 515
;512:}
;513:
;514:void ParseEmotionalAttachments(bot_state_t *bs, char *buf)
;515:{
line 516
;516:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 517
;517:	int i_c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $263
JUMPV
line 521
;518:	char tbuf[16];
;519:
;520:	while (buf[i] && buf[i] != '}')
;521:	{
LABELV $265
line 523
;522:		while (buf[i] == ' ' || buf[i] == '{' || buf[i] == 9 || buf[i] == 13 || buf[i] == '\n')
;523:		{
line 524
;524:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 525
;525:		}
LABELV $266
line 522
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 32
EQI4 $265
ADDRLP4 24
INDIRI4
CNSTI4 123
EQI4 $265
ADDRLP4 24
INDIRI4
CNSTI4 9
EQI4 $265
ADDRLP4 24
INDIRI4
CNSTI4 13
EQI4 $265
ADDRLP4 24
INDIRI4
CNSTI4 10
EQI4 $265
line 527
;526:
;527:		if (buf[i] && buf[i] != '}')
ADDRLP4 28
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $264
ADDRLP4 28
INDIRI4
CNSTI4 125
EQI4 $264
line 528
;528:		{
line 529
;529:			i_c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $271
JUMPV
LABELV $270
line 531
;530:			while (buf[i] != '{' && buf[i] != 9 && buf[i] != 13 && buf[i] != '\n')
;531:			{
line 532
;532:				bs->loved[bs->lovednum].name[i_c] = buf[i];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 68
ADDRLP4 32
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
MULI4
ADDRLP4 32
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
CNSTI4 4
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 533
;533:				i_c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 534
;534:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 535
;535:			}
LABELV $271
line 530
ADDRLP4 32
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 123
EQI4 $275
ADDRLP4 32
INDIRI4
CNSTI4 9
EQI4 $275
ADDRLP4 32
INDIRI4
CNSTI4 13
EQI4 $275
ADDRLP4 32
INDIRI4
CNSTI4 10
NEI4 $270
LABELV $275
line 536
;536:			bs->loved[bs->lovednum].name[i_c] = '\0';
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 68
ADDRLP4 36
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
MULI4
ADDRLP4 36
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
CNSTI4 4
ADDP4
ADDP4
CNSTI1 0
ASGNI1
ADDRGP4 $277
JUMPV
LABELV $276
line 539
;537:
;538:			while (buf[i] == ' ' || buf[i] == '{' || buf[i] == 9 || buf[i] == 13 || buf[i] == '\n')
;539:			{
line 540
;540:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 541
;541:			}
LABELV $277
line 538
ADDRLP4 40
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 32
EQI4 $276
ADDRLP4 40
INDIRI4
CNSTI4 123
EQI4 $276
ADDRLP4 40
INDIRI4
CNSTI4 9
EQI4 $276
ADDRLP4 40
INDIRI4
CNSTI4 13
EQI4 $276
ADDRLP4 40
INDIRI4
CNSTI4 10
EQI4 $276
line 543
;542:
;543:			i_c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $280
JUMPV
LABELV $279
line 546
;544:
;545:			while (buf[i] != '{' && buf[i] != 9 && buf[i] != 13 && buf[i] != '\n')
;546:			{
line 547
;547:				tbuf[i_c] = buf[i];
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 548
;548:				i_c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 549
;549:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 550
;550:			}
LABELV $280
line 545
ADDRLP4 44
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 123
EQI4 $284
ADDRLP4 44
INDIRI4
CNSTI4 9
EQI4 $284
ADDRLP4 44
INDIRI4
CNSTI4 13
EQI4 $284
ADDRLP4 44
INDIRI4
CNSTI4 10
NEI4 $279
LABELV $284
line 551
;551:			tbuf[i_c] = '\0';
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 553
;552:
;553:			bs->loved[bs->lovednum].level = atoi(tbuf);
ADDRLP4 8
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 68
ADDRLP4 52
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
MULI4
ADDRLP4 52
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 555
;554:
;555:			bs->lovednum++;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 556
;556:		}
line 558
;557:		else
;558:		{
line 559
;559:			break;
LABELV $269
line 562
;560:		}
;561:
;562:		if (bs->lovednum >= MAX_LOVED_ONES)
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
CNSTI4 4
LTI4 $285
line 563
;563:		{
line 564
;564:			return;
ADDRGP4 $261
JUMPV
LABELV $285
line 567
;565:		}
;566:
;567:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 568
;568:	}
LABELV $263
line 520
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $287
ADDRLP4 24
INDIRI4
CNSTI4 125
NEI4 $266
LABELV $287
LABELV $264
line 569
;569:}
LABELV $261
endproc ParseEmotionalAttachments 60 4
export ReadChatGroups
proc ReadChatGroups 28 8
line 572
;570:
;571:int ReadChatGroups(bot_state_t *bs, char *buf)
;572:{
line 577
;573:	char *cgroupbegin;
;574:	int cgbplace;
;575:	int i;
;576:
;577:	cgroupbegin = strstr(buf, "BEGIN_CHAT_GROUPS");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $289
ARGP4
ADDRLP4 12
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 579
;578:
;579:	if (!cgroupbegin)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $290
line 580
;580:	{
line 581
;581:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $288
JUMPV
LABELV $290
line 584
;582:	}
;583:
;584:	if (strlen(cgroupbegin) >= MAX_CHAT_BUFFER_SIZE)
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 16
INDIRU4
CNSTU4 8192
LTU4 $292
line 585
;585:	{
line 586
;586:		G_Printf(S_COLOR_RED "Error: Personality chat section exceeds max size\n");
ADDRGP4 $294
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 587
;587:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $288
JUMPV
LABELV $292
line 590
;588:	}
;589:
;590:	cgbplace = cgroupbegin - buf+1;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $296
JUMPV
LABELV $295
line 593
;591:
;592:	while (buf[cgbplace] != '\n')
;593:	{
line 594
;594:		cgbplace++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 595
;595:	}
LABELV $296
line 592
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $295
line 597
;596:
;597:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $299
JUMPV
LABELV $298
line 600
;598:
;599:	while (buf[cgbplace] && buf[cgbplace] != '\0')
;600:	{
line 601
;601:		gBotChatBuffer[bs->client][i] = buf[cgbplace];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 gBotChatBuffer
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 602
;602:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 603
;603:		cgbplace++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 604
;604:	}
LABELV $299
line 599
ADDRLP4 20
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $301
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $298
LABELV $301
line 606
;605:
;606:	gBotChatBuffer[bs->client][i] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 gBotChatBuffer
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 608
;607:
;608:	return 1;
CNSTI4 1
RETI4
LABELV $288
endproc ReadChatGroups 28 8
export BotUtilizePersonality
proc BotUtilizePersonality 160 16
line 612
;609:}
;610:
;611:void BotUtilizePersonality(bot_state_t *bs)
;612:{
line 618
;613:	fileHandle_t f;
;614:	int len, rlen;
;615:	int failed;
;616:	int i;
;617:	//char buf[131072];
;618:	char *buf = (char *)B_TempAlloc(131072);
CNSTI4 131072
ARGI4
ADDRLP4 32
ADDRGP4 B_TempAlloc
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 621
;619:	char *readbuf, *group;
;620:
;621:	len = trap_FS_FOpenFile(bs->settings.personalityfile, &f, FS_READ);
ADDRFP4 0
INDIRP4
CNSTI4 1424
ADDP4
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 36
INDIRI4
ASGNI4
line 623
;622:
;623:	failed = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 625
;624:
;625:	if (!f)
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $303
line 626
;626:	{
line 627
;627:		G_Printf(S_COLOR_RED "Error: Specified personality not found\n");
ADDRGP4 $305
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 628
;628:		B_TempFree(131072); //buf
CNSTI4 131072
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 629
;629:		return;
ADDRGP4 $302
JUMPV
LABELV $303
line 632
;630:	}
;631:
;632:	if (len >= 131072)
ADDRLP4 0
INDIRI4
CNSTI4 131072
LTI4 $306
line 633
;633:	{
line 634
;634:		G_Printf(S_COLOR_RED "Personality file exceeds maximum length\n");
ADDRGP4 $308
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 635
;635:		B_TempFree(131072); //buf
CNSTI4 131072
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 636
;636:		return;
ADDRGP4 $302
JUMPV
LABELV $306
line 639
;637:	}
;638:
;639:	trap_FS_Read(buf, len, f);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 641
;640:
;641:	rlen = len;
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 $310
JUMPV
LABELV $309
line 644
;642:
;643:	while (len < 131072)
;644:	{ //kill all characters after the file length, since sometimes FS_Read doesn't do that entirely (or so it seems)
line 645
;645:		buf[len] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 646
;646:		len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 647
;647:	}
LABELV $310
line 643
ADDRLP4 0
INDIRI4
CNSTI4 131072
LTI4 $309
line 649
;648:
;649:	len = rlen;
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 651
;650:
;651:	readbuf = (char *)B_TempAlloc(1024);
CNSTI4 1024
ARGI4
ADDRLP4 40
ADDRGP4 B_TempAlloc
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
ASGNP4
line 652
;652:	group = (char *)B_TempAlloc(65536);
CNSTI4 65536
ARGI4
ADDRLP4 44
ADDRGP4 B_TempAlloc
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 44
INDIRP4
ASGNP4
line 654
;653:
;654:	if (!GetValueGroup(buf, "GeneralBotInfo", group))
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $314
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 GetValueGroup
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $312
line 655
;655:	{
line 656
;656:		G_Printf(S_COLOR_RED "Personality file contains no GeneralBotInfo group\n");
ADDRGP4 $315
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 657
;657:		failed = 1; //set failed so we know to set everything to default values
ADDRLP4 20
CNSTI4 1
ASGNI4
line 658
;658:	}
LABELV $312
line 660
;659:
;660:	if (!failed && GetPairedValue(group, "reflex", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $316
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $318
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $316
line 661
;661:	{
line 662
;662:		bs->skills.reflex = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2316
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 663
;663:	}
ADDRGP4 $317
JUMPV
LABELV $316
line 665
;664:	else
;665:	{
line 666
;666:		bs->skills.reflex = 100; //default
ADDRFP4 0
INDIRP4
CNSTI4 2316
ADDP4
CNSTI4 100
ASGNI4
line 667
;667:	}
LABELV $317
line 669
;668:
;669:	if (!failed && GetPairedValue(group, "accuracy", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $319
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $321
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $319
line 670
;670:	{
line 671
;671:		bs->skills.accuracy = atof(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2320
ADDP4
ADDRLP4 60
INDIRF4
ASGNF4
line 672
;672:	}
ADDRGP4 $320
JUMPV
LABELV $319
line 674
;673:	else
;674:	{
line 675
;675:		bs->skills.accuracy = 10; //default
ADDRFP4 0
INDIRP4
CNSTI4 2320
ADDP4
CNSTF4 1092616192
ASGNF4
line 676
;676:	}
LABELV $320
line 678
;677:
;678:	if (!failed && GetPairedValue(group, "turnspeed", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $322
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $324
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $322
line 679
;679:	{
line 680
;680:		bs->skills.turnspeed = atof(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2324
ADDP4
ADDRLP4 64
INDIRF4
ASGNF4
line 681
;681:	}
ADDRGP4 $323
JUMPV
LABELV $322
line 683
;682:	else
;683:	{
line 684
;684:		bs->skills.turnspeed = 0.01f; //default
ADDRFP4 0
INDIRP4
CNSTI4 2324
ADDP4
CNSTF4 1008981770
ASGNF4
line 685
;685:	}
LABELV $323
line 687
;686:
;687:	if (!failed && GetPairedValue(group, "turnspeed_combat", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $325
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $327
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $325
line 688
;688:	{
line 689
;689:		bs->skills.turnspeed_combat = atof(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2328
ADDP4
ADDRLP4 68
INDIRF4
ASGNF4
line 690
;690:	}
ADDRGP4 $326
JUMPV
LABELV $325
line 692
;691:	else
;692:	{
line 693
;693:		bs->skills.turnspeed_combat = 0.05f; //default
ADDRFP4 0
INDIRP4
CNSTI4 2328
ADDP4
CNSTF4 1028443341
ASGNF4
line 694
;694:	}
LABELV $326
line 696
;695:
;696:	if (!failed && GetPairedValue(group, "maxturn", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $328
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $330
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $328
line 697
;697:	{
line 698
;698:		bs->skills.maxturn = atof(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2332
ADDP4
ADDRLP4 72
INDIRF4
ASGNF4
line 699
;699:	}
ADDRGP4 $329
JUMPV
LABELV $328
line 701
;700:	else
;701:	{
line 702
;702:		bs->skills.maxturn = 360; //default
ADDRFP4 0
INDIRP4
CNSTI4 2332
ADDP4
CNSTF4 1135869952
ASGNF4
line 703
;703:	}
LABELV $329
line 705
;704:
;705:	if (!failed && GetPairedValue(group, "perfectaim", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $331
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $333
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $331
line 706
;706:	{
line 707
;707:		bs->skills.perfectaim = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2336
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 708
;708:	}
ADDRGP4 $332
JUMPV
LABELV $331
line 710
;709:	else
;710:	{
line 711
;711:		bs->skills.perfectaim = 0; //default
ADDRFP4 0
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 0
ASGNI4
line 712
;712:	}
LABELV $332
line 714
;713:
;714:	if (!failed && GetPairedValue(group, "chatability", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $334
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $336
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $334
line 715
;715:	{
line 716
;716:		bs->canChat = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2092
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 717
;717:	}
ADDRGP4 $335
JUMPV
LABELV $334
line 719
;718:	else
;719:	{
line 720
;720:		bs->canChat = 0; //default
ADDRFP4 0
INDIRP4
CNSTI4 2092
ADDP4
CNSTI4 0
ASGNI4
line 721
;721:	}
LABELV $335
line 723
;722:
;723:	if (!failed && GetPairedValue(group, "chatfrequency", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $337
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $339
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $337
line 724
;724:	{
line 725
;725:		bs->chatFrequency = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2096
ADDP4
ADDRLP4 84
INDIRI4
ASGNI4
line 726
;726:	}
ADDRGP4 $338
JUMPV
LABELV $337
line 728
;727:	else
;728:	{
line 729
;729:		bs->chatFrequency = 5; //default
ADDRFP4 0
INDIRP4
CNSTI4 2096
ADDP4
CNSTI4 5
ASGNI4
line 730
;730:	}
LABELV $338
line 732
;731:
;732:	if (!failed && GetPairedValue(group, "hatelevel", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $340
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $342
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $340
line 733
;733:	{
line 734
;734:		bs->loved_death_thresh = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2616
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 735
;735:	}
ADDRGP4 $341
JUMPV
LABELV $340
line 737
;736:	else
;737:	{
line 738
;738:		bs->loved_death_thresh = 3; //default
ADDRFP4 0
INDIRP4
CNSTI4 2616
ADDP4
CNSTI4 3
ASGNI4
line 739
;739:	}
LABELV $341
line 741
;740:
;741:	if (!failed && GetPairedValue(group, "camper", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $343
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $345
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $343
line 742
;742:	{
line 743
;743:		bs->isCamper = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2060
ADDP4
ADDRLP4 92
INDIRI4
ASGNI4
line 744
;744:	}
ADDRGP4 $344
JUMPV
LABELV $343
line 746
;745:	else
;746:	{
line 747
;747:		bs->isCamper = 0; //default
ADDRFP4 0
INDIRP4
CNSTI4 2060
ADDP4
CNSTI4 0
ASGNI4
line 748
;748:	}
LABELV $344
line 750
;749:
;750:	if (!failed && GetPairedValue(group, "saberspecialist", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $346
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $348
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $346
line 751
;751:	{
line 752
;752:		bs->saberSpecialist = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2088
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 753
;753:	}
ADDRGP4 $347
JUMPV
LABELV $346
line 755
;754:	else
;755:	{
line 756
;756:		bs->saberSpecialist = 0; //default
ADDRFP4 0
INDIRP4
CNSTI4 2088
ADDP4
CNSTI4 0
ASGNI4
line 757
;757:	}
LABELV $347
line 759
;758:
;759:	if (!failed && GetPairedValue(group, "forceinfo", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $349
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $351
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $349
line 760
;760:	{
line 761
;761:		Com_sprintf(bs->forceinfo, sizeof(bs->forceinfo), "%s", readbuf);
ADDRFP4 0
INDIRP4
CNSTI4 2744
ADDP4
ARGP4
CNSTI4 2048
ARGI4
ADDRGP4 $352
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 762
;762:	}
ADDRGP4 $350
JUMPV
LABELV $349
line 764
;763:	else
;764:	{
line 765
;765:		Com_sprintf(bs->forceinfo, sizeof(bs->forceinfo), "%s", DEFAULT_FORCEPOWERS);
ADDRFP4 0
INDIRP4
CNSTI4 2744
ADDP4
ARGP4
CNSTI4 2048
ARGI4
ADDRGP4 $352
ARGP4
ADDRGP4 $353
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 766
;766:	}
LABELV $350
line 768
;767:
;768:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $355
JUMPV
LABELV $354
line 771
;769:
;770:	while (i < MAX_CHAT_BUFFER_SIZE)
;771:	{ //clear out the chat buffer for this bot
line 772
;772:		gBotChatBuffer[bs->client][i] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 gBotChatBuffer
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 773
;773:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 774
;774:	}
LABELV $355
line 770
ADDRLP4 4
INDIRI4
CNSTI4 8192
LTI4 $354
line 776
;775:
;776:	if (bs->canChat)
ADDRFP4 0
INDIRP4
CNSTI4 2092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $357
line 777
;777:	{
line 778
;778:		if (!ReadChatGroups(bs, buf))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 ReadChatGroups
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $359
line 779
;779:		{
line 780
;780:			bs->canChat = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2092
ADDP4
CNSTI4 0
ASGNI4
line 781
;781:		}
LABELV $359
line 782
;782:	}
LABELV $357
line 784
;783:
;784:	if (GetValueGroup(buf, "BotWeaponWeights", group))
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $363
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 GetValueGroup
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $361
line 785
;785:	{
line 786
;786:		if (GetPairedValue(group, "WP_STUN_BATON", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $366
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $364
line 787
;787:		{
line 788
;788:			bs->botWeaponWeights[WP_STUN_BATON] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2628
ADDP4
ADDRLP4 108
INDIRI4
CVIF4 4
ASGNF4
line 789
;789:		}
LABELV $364
line 791
;790:
;791:		if (GetPairedValue(group, "WP_SABER", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $369
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $367
line 792
;792:		{
line 793
;793:			bs->botWeaponWeights[WP_SABER] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2632
ADDP4
ADDRLP4 112
INDIRI4
CVIF4 4
ASGNF4
line 794
;794:		}
LABELV $367
line 796
;795:
;796:		if (GetPairedValue(group, "WP_BRYAR_PISTOL", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $372
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $370
line 797
;797:		{
line 798
;798:			bs->botWeaponWeights[WP_BRYAR_PISTOL] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2636
ADDP4
ADDRLP4 116
INDIRI4
CVIF4 4
ASGNF4
line 799
;799:		}
LABELV $370
line 801
;800:
;801:		if (GetPairedValue(group, "WP_BLASTER", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $373
line 802
;802:		{
line 803
;803:			bs->botWeaponWeights[WP_BLASTER] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2640
ADDP4
ADDRLP4 120
INDIRI4
CVIF4 4
ASGNF4
line 804
;804:		}
LABELV $373
line 806
;805:
;806:		if (GetPairedValue(group, "WP_DISRUPTOR", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $378
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $376
line 807
;807:		{
line 808
;808:			bs->botWeaponWeights[WP_DISRUPTOR] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2644
ADDP4
ADDRLP4 124
INDIRI4
CVIF4 4
ASGNF4
line 809
;809:		}
LABELV $376
line 811
;810:
;811:		if (GetPairedValue(group, "WP_BOWCASTER", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $381
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
EQI4 $379
line 812
;812:		{
line 813
;813:			bs->botWeaponWeights[WP_BOWCASTER] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2648
ADDP4
ADDRLP4 128
INDIRI4
CVIF4 4
ASGNF4
line 814
;814:		}
LABELV $379
line 816
;815:
;816:		if (GetPairedValue(group, "WP_REPEATER", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $384
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $382
line 817
;817:		{
line 818
;818:			bs->botWeaponWeights[WP_REPEATER] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2652
ADDP4
ADDRLP4 132
INDIRI4
CVIF4 4
ASGNF4
line 819
;819:		}
LABELV $382
line 821
;820:
;821:		if (GetPairedValue(group, "WP_DEMP2", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $387
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $385
line 822
;822:		{
line 823
;823:			bs->botWeaponWeights[WP_DEMP2] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2656
ADDP4
ADDRLP4 136
INDIRI4
CVIF4 4
ASGNF4
line 824
;824:		}
LABELV $385
line 826
;825:
;826:		if (GetPairedValue(group, "WP_FLECHETTE", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $390
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $388
line 827
;827:		{
line 828
;828:			bs->botWeaponWeights[WP_FLECHETTE] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2660
ADDP4
ADDRLP4 140
INDIRI4
CVIF4 4
ASGNF4
line 829
;829:		}
LABELV $388
line 831
;830:
;831:		if (GetPairedValue(group, "WP_ROCKET_LAUNCHER", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $393
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $391
line 832
;832:		{
line 833
;833:			bs->botWeaponWeights[WP_ROCKET_LAUNCHER] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2664
ADDP4
ADDRLP4 144
INDIRI4
CVIF4 4
ASGNF4
line 834
;834:		}
LABELV $391
line 836
;835:
;836:		if (GetPairedValue(group, "WP_THERMAL", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $396
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $394
line 837
;837:		{
line 838
;838:			bs->botWeaponWeights[WP_THERMAL] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2668
ADDP4
ADDRLP4 148
INDIRI4
CVIF4 4
ASGNF4
line 839
;839:		}
LABELV $394
line 841
;840:
;841:		if (GetPairedValue(group, "WP_TRIP_MINE", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $399
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $397
line 842
;842:		{
line 843
;843:			bs->botWeaponWeights[WP_TRIP_MINE] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2672
ADDP4
ADDRLP4 152
INDIRI4
CVIF4 4
ASGNF4
line 844
;844:		}
LABELV $397
line 846
;845:
;846:		if (GetPairedValue(group, "WP_DET_PACK", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $402
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $400
line 847
;847:		{
line 848
;848:			bs->botWeaponWeights[WP_DET_PACK] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2676
ADDP4
ADDRLP4 156
INDIRI4
CVIF4 4
ASGNF4
line 849
;849:		}
LABELV $400
line 850
;850:	}
LABELV $361
line 852
;851:
;852:	bs->lovednum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
CNSTI4 0
ASGNI4
line 854
;853:
;854:	if (GetValueGroup(buf, "EmotionalAttachments", group))
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $405
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 GetValueGroup
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $403
line 855
;855:	{
line 856
;856:		ParseEmotionalAttachments(bs, group);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 ParseEmotionalAttachments
CALLV
pop
line 857
;857:	}
LABELV $403
line 859
;858:
;859:	B_TempFree(131072); //buf
CNSTI4 131072
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 860
;860:	B_TempFree(1024); //readbuf
CNSTI4 1024
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 861
;861:	B_TempFree(65536); //group
CNSTI4 65536
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 862
;862:	trap_FS_FCloseFile(f);
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 863
;863:}
LABELV $302
endproc BotUtilizePersonality 160 16
import floattime
import gLevelFlags
import nodenum
import nodetable
import gLastPrintedIndex
import gWPNum
import gWPArray
import gWPRenderedFrame
import gBotEdit
import gDeactivated
import gWPRenderTime
bss
export gBotChatBuffer
align 1
LABELV gBotChatBuffer
skip 262144
import eFlagBlue
import eFlagRed
import oFlagBlue
import flagBlue
import oFlagRed
import flagRed
import bot_wp_visconnect
import bot_wp_distconnect
import bot_wp_clearweight
import bot_wp_edit
import bot_wp_info
import bot_camp
import bot_attachments
import bot_honorableduelacceptance
import bot_forgimmick
import bot_forcepowers
import ConcatArgs
import GetBestIdleGoal
import GetNearestVisibleWP
import BotIsAChickenWuss
import OrgVisibleBox
import BotWaypointRender
import StandardBotAI
import NumBots
import BotResetState
import GetBotLibAPI
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
LABELV $405
byte 1 69
byte 1 109
byte 1 111
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 104
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $402
byte 1 87
byte 1 80
byte 1 95
byte 1 68
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 65
byte 1 67
byte 1 75
byte 1 0
align 1
LABELV $399
byte 1 87
byte 1 80
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 80
byte 1 95
byte 1 77
byte 1 73
byte 1 78
byte 1 69
byte 1 0
align 1
LABELV $396
byte 1 87
byte 1 80
byte 1 95
byte 1 84
byte 1 72
byte 1 69
byte 1 82
byte 1 77
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $393
byte 1 87
byte 1 80
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 76
byte 1 65
byte 1 85
byte 1 78
byte 1 67
byte 1 72
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $390
byte 1 87
byte 1 80
byte 1 95
byte 1 70
byte 1 76
byte 1 69
byte 1 67
byte 1 72
byte 1 69
byte 1 84
byte 1 84
byte 1 69
byte 1 0
align 1
LABELV $387
byte 1 87
byte 1 80
byte 1 95
byte 1 68
byte 1 69
byte 1 77
byte 1 80
byte 1 50
byte 1 0
align 1
LABELV $384
byte 1 87
byte 1 80
byte 1 95
byte 1 82
byte 1 69
byte 1 80
byte 1 69
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $381
byte 1 87
byte 1 80
byte 1 95
byte 1 66
byte 1 79
byte 1 87
byte 1 67
byte 1 65
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $378
byte 1 87
byte 1 80
byte 1 95
byte 1 68
byte 1 73
byte 1 83
byte 1 82
byte 1 85
byte 1 80
byte 1 84
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $375
byte 1 87
byte 1 80
byte 1 95
byte 1 66
byte 1 76
byte 1 65
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $372
byte 1 87
byte 1 80
byte 1 95
byte 1 66
byte 1 82
byte 1 89
byte 1 65
byte 1 82
byte 1 95
byte 1 80
byte 1 73
byte 1 83
byte 1 84
byte 1 79
byte 1 76
byte 1 0
align 1
LABELV $369
byte 1 87
byte 1 80
byte 1 95
byte 1 83
byte 1 65
byte 1 66
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $366
byte 1 87
byte 1 80
byte 1 95
byte 1 83
byte 1 84
byte 1 85
byte 1 78
byte 1 95
byte 1 66
byte 1 65
byte 1 84
byte 1 79
byte 1 78
byte 1 0
align 1
LABELV $363
byte 1 66
byte 1 111
byte 1 116
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 87
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $353
byte 1 53
byte 1 45
byte 1 49
byte 1 45
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $352
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $351
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $348
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $345
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $342
byte 1 104
byte 1 97
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $339
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 102
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 110
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $336
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $333
byte 1 112
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $330
byte 1 109
byte 1 97
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 0
align 1
LABELV $327
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 98
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $324
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $321
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $318
byte 1 114
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $315
byte 1 94
byte 1 49
byte 1 80
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
byte 1 102
byte 1 105
byte 1 108
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
byte 1 110
byte 1 111
byte 1 32
byte 1 71
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 108
byte 1 66
byte 1 111
byte 1 116
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $314
byte 1 71
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 108
byte 1 66
byte 1 111
byte 1 116
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $308
byte 1 94
byte 1 49
byte 1 80
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
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 10
byte 1 0
align 1
LABELV $305
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
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
LABELV $294
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 80
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
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $289
byte 1 66
byte 1 69
byte 1 71
byte 1 73
byte 1 78
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 84
byte 1 95
byte 1 71
byte 1 82
byte 1 79
byte 1 85
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $259
byte 1 71
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 108
byte 1 71
byte 1 114
byte 1 101
byte 1 101
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $206
byte 1 115
byte 1 112
byte 1 95
byte 1 108
byte 1 97
byte 1 110
byte 1 103
byte 1 117
byte 1 97
byte 1 103
byte 1 101
byte 1 0
