export GetIDForString
code
proc GetIDForString 8 8
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\q_shared.c"
line 14
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// q_shared.c -- stateless support routines that are included in each code dll
;4:#include "q_shared.h"
;5:
;6:/*
;7:-------------------------
;8:GetIDForString 
;9:-------------------------
;10:*/
;11:
;12:
;13:int GetIDForString ( stringID_table_t *table, const char *string )
;14:{
line 15
;15:	int	index = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $50
JUMPV
LABELV $49
line 19
;16:
;17:	while ( ( table[index].name != NULL ) &&
;18:			( table[index].name[0] != 0 ) )
;19:	{
line 20
;20:		if ( !Q_stricmp( table[index].name, string ) )
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $52
line 21
;21:			return table[index].id;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
RETI4
ADDRGP4 $48
JUMPV
LABELV $52
line 23
;22:
;23:		index++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 24
;24:	}
LABELV $50
line 17
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $54
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $49
LABELV $54
line 26
;25:
;26:	return -1;
CNSTI4 -1
RETI4
LABELV $48
endproc GetIDForString 8 8
export GetStringForID
proc GetStringForID 8 0
line 36
;27:}
;28:
;29:/*
;30:-------------------------
;31:GetStringForID
;32:-------------------------
;33:*/
;34:
;35:const char *GetStringForID( stringID_table_t *table, int id )
;36:{
line 37
;37:	int	index = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $57
JUMPV
LABELV $56
line 41
;38:
;39:	while ( ( table[index].name != NULL ) &&
;40:			( table[index].name[0] != 0 ) )
;41:	{
line 42
;42:		if ( table[index].id == id )
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $59
line 43
;43:			return table[index].name;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
RETP4
ADDRGP4 $55
JUMPV
LABELV $59
line 45
;44:
;45:		index++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 46
;46:	}
LABELV $57
line 39
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $61
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $56
LABELV $61
line 48
;47:
;48:	return NULL;
CNSTP4 0
RETP4
LABELV $55
endproc GetStringForID 8 0
export Com_Clamp
proc Com_Clamp 0 0
line 52
;49:}
;50:
;51:
;52:float Com_Clamp( float min, float max, float value ) {
line 53
;53:	if ( value < min ) {
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $63
line 54
;54:		return min;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $62
JUMPV
LABELV $63
line 56
;55:	}
;56:	if ( value > max ) {
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $65
line 57
;57:		return max;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $62
JUMPV
LABELV $65
line 59
;58:	}
;59:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $62
endproc Com_Clamp 0 0
export Com_Clampi
proc Com_Clampi 0 0
line 62
;60:}
;61:
;62:int Com_Clampi( int min, int max, int value ) {
line 63
;63:	if ( value < min ) {
ADDRFP4 8
INDIRI4
ADDRFP4 0
INDIRI4
GEI4 $68
line 64
;64:		return min;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $67
JUMPV
LABELV $68
line 66
;65:	}
;66:	if ( value > max ) {
ADDRFP4 8
INDIRI4
ADDRFP4 4
INDIRI4
LEI4 $70
line 67
;67:		return max;
ADDRFP4 4
INDIRI4
RETI4
ADDRGP4 $67
JUMPV
LABELV $70
line 69
;68:	}
;69:	return value;
ADDRFP4 8
INDIRI4
RETI4
LABELV $67
endproc Com_Clampi 0 0
export COM_SkipPath
proc COM_SkipPath 4 0
line 79
;70:}
;71:
;72:
;73:/*
;74:============
;75:COM_SkipPath
;76:============
;77:*/
;78:char *COM_SkipPath (char *pathname)
;79:{
line 82
;80:	char	*last;
;81:	
;82:	last = pathname;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $74
JUMPV
LABELV $73
line 84
;83:	while (*pathname)
;84:	{
line 85
;85:		if (*pathname=='/')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $76
line 86
;86:			last = pathname+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $76
line 87
;87:		pathname++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 88
;88:	}
LABELV $74
line 83
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $73
line 89
;89:	return last;
ADDRLP4 0
INDIRP4
RETP4
LABELV $72
endproc COM_SkipPath 4 0
export COM_StripExtension
proc COM_StripExtension 12 12
line 101
;90:}
;91:
;92:/*
;93:============
;94:COM_StripExtension
;95:
;96:R_RemapShader exploit
;97:http://www.exploit-db.com/exploits/1750/
;98:http://ioqsrc.vampireducks.com/d8/dbe/q__shared_8c-source.html#l00061
;99:============
;100:*/
;101:void COM_StripExtension(const char *in, char *out, int destsize) {
line 103
;102:	int length;
;103:	assert(out != in);
line 104
;104:	Q_strncpyz(out, in, destsize);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 105
;105:	length = (int)strlen(out) - 1;
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ADDRLP4 4
INDIRU4
CVUI4 4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $80
JUMPV
LABELV $79
line 106
;106:	while (length > 0 && out[length] != '.') {
line 107
;107:		length--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 108
;108:		if (length > 0 && out[length] == '/')
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $82
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $82
line 109
;109:			return;   // no extension
ADDRGP4 $78
JUMPV
LABELV $82
line 110
;110:	}
LABELV $80
line 106
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $84
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $79
LABELV $84
line 111
;111:	if (length > 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $85
line 112
;112:		out[length] = 0;
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $85
line 113
;113:}
LABELV $78
endproc COM_StripExtension 12 12
export COM_DefaultExtension
proc COM_DefaultExtension 76 20
line 121
;114:
;115:
;116:/*
;117:==================
;118:COM_DefaultExtension
;119:==================
;120:*/
;121:void COM_DefaultExtension (char *path, int maxSize, const char *extension ) {
line 129
;122:	char	oldPath[MAX_QPATH];
;123:	char    *src;
;124:
;125://
;126:// if path doesn't have a .EXT, append extension
;127:// (extension should include the .)
;128://
;129:	src = path + strlen(path) - 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ADDRLP4 68
INDIRU4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $89
JUMPV
LABELV $88
line 131
;130:
;131:	while (*src != '/' && src != path) {
line 132
;132:		if ( *src == '.' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $91
line 133
;133:			return;                 // it has an extension
ADDRGP4 $87
JUMPV
LABELV $91
line 135
;134:		}
;135:		src--;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 136
;136:	}
LABELV $89
line 131
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $93
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $88
LABELV $93
line 138
;137:
;138:	Q_strncpyz( oldPath, path, sizeof( oldPath ) );
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 139
;139:	Com_sprintf( path, maxSize, "%s%s", oldPath, extension );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $94
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 140
;140:}
LABELV $87
endproc COM_DefaultExtension 76 20
export ShortSwap
proc ShortSwap 2 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 172
;141:
;142:/*
;143:============================================================================
;144:
;145:					BYTE ORDER FUNCTIONS
;146:
;147:============================================================================
;148:*/
;149:/*
;150:// can't just use function pointers, or dll linkage can
;151:// mess up when qcommon is included in multiple places
;152:static short	(*_BigShort) (short l);
;153:static short	(*_LittleShort) (short l);
;154:static int		(*_BigLong) (int l);
;155:static int		(*_LittleLong) (int l);
;156:static qint64	(*_BigLong64) (qint64 l);
;157:static qint64	(*_LittleLong64) (qint64 l);
;158:static float	(*_BigFloat) (const float *l);
;159:static float	(*_LittleFloat) (const float *l);
;160:
;161:short	BigShort(short l){return _BigShort(l);}
;162:short	LittleShort(short l) {return _LittleShort(l);}
;163:int		BigLong (int l) {return _BigLong(l);}
;164:int		LittleLong (int l) {return _LittleLong(l);}
;165:qint64 	BigLong64 (qint64 l) {return _BigLong64(l);}
;166:qint64 	LittleLong64 (qint64 l) {return _LittleLong64(l);}
;167:float	BigFloat (const float *l) {return _BigFloat(l);}
;168:float	LittleFloat (const float *l) {return _LittleFloat(l);}
;169:*/
;170:
;171:short   ShortSwap (short l)
;172:{
line 175
;173:	byte    b1,b2;
;174:
;175:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 176
;176:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 178
;177:
;178:	return (b1<<8) + b2;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
ADDI4
CVII2 4
CVII4 2
RETI4
LABELV $95
endproc ShortSwap 2 0
export ShortNoSwap
proc ShortNoSwap 0 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 182
;179:}
;180:
;181:short	ShortNoSwap (short l)
;182:{
line 183
;183:	return l;
ADDRFP4 0
INDIRI2
CVII4 2
RETI4
LABELV $96
endproc ShortNoSwap 0 0
export LongSwap
proc LongSwap 4 0
line 187
;184:}
;185:
;186:int    LongSwap (int l)
;187:{
line 190
;188:	byte    b1,b2,b3,b4;
;189:
;190:	b1 = l&255;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 191
;191:	b2 = (l>>8)&255;
ADDRLP4 1
ADDRFP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 192
;192:	b3 = (l>>16)&255;
ADDRLP4 2
ADDRFP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 193
;193:	b4 = (l>>24)&255;
ADDRLP4 3
ADDRFP4 0
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 195
;194:
;195:	return ((int)b1<<24) + ((int)b2<<16) + ((int)b3<<8) + b4;
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 24
LSHI4
ADDRLP4 1
INDIRU1
CVUI4 1
CNSTI4 16
LSHI4
ADDI4
ADDRLP4 2
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
ADDI4
ADDRLP4 3
INDIRU1
CVUI4 1
ADDI4
RETI4
LABELV $97
endproc LongSwap 4 0
export LongNoSwap
proc LongNoSwap 0 0
line 199
;196:}
;197:
;198:int	LongNoSwap (int l)
;199:{
line 200
;200:	return l;
ADDRFP4 0
INDIRI4
RETI4
LABELV $98
endproc LongNoSwap 0 0
export Long64Swap
proc Long64Swap 8 0
line 204
;201:}
;202:
;203:qint64 Long64Swap (qint64 ll)
;204:{
line 207
;205:	qint64	result;
;206:
;207:	result.b0 = ll.b7;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 7
ADDP4
INDIRU1
ASGNU1
line 208
;208:	result.b1 = ll.b6;
ADDRLP4 0+1
ADDRFP4 4
INDIRP4
CNSTI4 6
ADDP4
INDIRU1
ASGNU1
line 209
;209:	result.b2 = ll.b5;
ADDRLP4 0+2
ADDRFP4 4
INDIRP4
CNSTI4 5
ADDP4
INDIRU1
ASGNU1
line 210
;210:	result.b3 = ll.b4;
ADDRLP4 0+3
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRU1
ASGNU1
line 211
;211:	result.b4 = ll.b3;
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
ASGNU1
line 212
;212:	result.b5 = ll.b2;
ADDRLP4 0+5
ADDRFP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRU1
ASGNU1
line 213
;213:	result.b6 = ll.b1;
ADDRLP4 0+6
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
ASGNU1
line 214
;214:	result.b7 = ll.b0;
ADDRLP4 0+7
ADDRFP4 4
INDIRP4
INDIRU1
ASGNU1
line 216
;215:
;216:	return result;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 8
LABELV $99
endproc Long64Swap 8 0
export Long64NoSwap
proc Long64NoSwap 0 0
line 220
;217:}
;218:
;219:qint64 Long64NoSwap (qint64 ll)
;220:{
line 221
;221:	return ll;
ADDRFP4 0
INDIRP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 8
LABELV $108
endproc Long64NoSwap 0 0
export FloatSwap
proc FloatSwap 12 4
line 229
;222:}
;223:
;224:typedef union {
;225:    float	f;
;226:    unsigned int i;
;227:} _FloatByteUnion;
;228:
;229:float FloatSwap (const float *f) {
line 233
;230:	const _FloatByteUnion *in;
;231:	_FloatByteUnion out;
;232:
;233:	in = (_FloatByteUnion *)f;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 234
;234:	out.i = LongSwap(in->i);
ADDRLP4 0
INDIRP4
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 8
ADDRGP4 LongSwap
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CVIU4 4
ASGNU4
line 236
;235:
;236:	return out.f;
ADDRLP4 4
INDIRF4
RETF4
LABELV $111
endproc FloatSwap 12 4
export FloatNoSwap
proc FloatNoSwap 0 0
line 240
;237:}
;238:
;239:float FloatNoSwap (const float *f)
;240:{
line 241
;241:	return *f;
ADDRFP4 0
INDIRP4
INDIRF4
RETF4
LABELV $112
endproc FloatNoSwap 0 0
export COM_BeginParseSession
proc COM_BeginParseSession 0 16
line 294
;242:}
;243:
;244:/*
;245:================
;246:Swap_Init
;247:================
;248:*/
;249:/*
;250:void Swap_Init (void)
;251:{
;252:	byte	swaptest[2] = {1,0};
;253:
;254:// set the byte swapping variables in a portable manner	
;255:	if ( *(short *)swaptest == 1)
;256:	{
;257:		_BigShort = ShortSwap;
;258:		_LittleShort = ShortNoSwap;
;259:		_BigLong = LongSwap;
;260:		_LittleLong = LongNoSwap;
;261:		_BigLong64 = Long64Swap;
;262:		_LittleLong64 = Long64NoSwap;
;263:		_BigFloat = FloatSwap;
;264:		_LittleFloat = FloatNoSwap;
;265:	}
;266:	else
;267:	{
;268:		_BigShort = ShortNoSwap;
;269:		_LittleShort = ShortSwap;
;270:		_BigLong = LongNoSwap;
;271:		_LittleLong = LongSwap;
;272:		_BigLong64 = Long64NoSwap;
;273:		_LittleLong64 = Long64Swap;
;274:		_BigFloat = FloatNoSwap;
;275:		_LittleFloat = FloatSwap;
;276:	}
;277:
;278:}
;279:*/
;280:
;281:/*
;282:============================================================================
;283:
;284:PARSING
;285:
;286:============================================================================
;287:*/
;288:
;289:static	char	com_token[MAX_TOKEN_CHARS];
;290:static	char	com_parsename[MAX_TOKEN_CHARS];
;291:static	int		com_lines;
;292:
;293:void COM_BeginParseSession( const char *name )
;294:{
line 295
;295:	com_lines = 0;
ADDRGP4 com_lines
CNSTI4 0
ASGNI4
line 296
;296:	Com_sprintf(com_parsename, sizeof(com_parsename), "%s", name);
ADDRGP4 com_parsename
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $114
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 297
;297:}
LABELV $113
endproc COM_BeginParseSession 0 16
export COM_GetCurrentParseLine
proc COM_GetCurrentParseLine 0 0
line 300
;298:
;299:int COM_GetCurrentParseLine( void )
;300:{
line 301
;301:	return com_lines;
ADDRGP4 com_lines
INDIRI4
RETI4
LABELV $115
endproc COM_GetCurrentParseLine 0 0
export COM_Parse
proc COM_Parse 4 8
line 305
;302:}
;303:
;304:char *COM_Parse( const char **data_p )
;305:{
line 306
;306:	return COM_ParseExt( data_p, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $116
endproc COM_Parse 4 8
bss
align 1
LABELV $118
skip 4096
export COM_ParseError
code
proc COM_ParseError 4 16
line 310
;307:}
;308:
;309:void COM_ParseError( char *format, ... )
;310:{
line 314
;311:	va_list argptr;
;312:	static char string[4096];
;313:
;314:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 315
;315:	Q_vsnprintf (string, sizeof(string), format, argptr);
ADDRGP4 $118
ARGP4
CNSTU4 4096
ARGU4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsnprintf
CALLI4
pop
line 316
;316:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 318
;317:
;318:	Com_Printf("ERROR: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $120
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $118
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 319
;319:}
LABELV $117
endproc COM_ParseError 4 16
bss
align 1
LABELV $122
skip 4096
export COM_ParseWarning
code
proc COM_ParseWarning 4 16
line 322
;320:
;321:void COM_ParseWarning( char *format, ... )
;322:{
line 326
;323:	va_list argptr;
;324:	static char string[4096];
;325:
;326:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 327
;327:	Q_vsnprintf (string, sizeof(string), format, argptr);
ADDRGP4 $122
ARGP4
CNSTU4 4096
ARGU4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsnprintf
CALLI4
pop
line 328
;328:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 330
;329:
;330:	Com_Printf("WARNING: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $124
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $122
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 331
;331:}
LABELV $121
endproc COM_ParseWarning 4 16
export SkipWhitespace
proc SkipWhitespace 8 0
line 345
;332:
;333:/*
;334:==============
;335:COM_Parse
;336:
;337:Parse a token out of a string
;338:Will never return NULL, just empty strings
;339:
;340:If "allowLineBreaks" is qtrue then an empty
;341:string will be returned if the next token is
;342:a newline.
;343:==============
;344:*/
;345:const char *SkipWhitespace( const char *data, qboolean *hasNewLines ) {
ADDRGP4 $127
JUMPV
LABELV $126
line 348
;346:	int c;
;347:
;348:	while( (c = *data) <= ' ') {
line 349
;349:		if( !c ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $129
line 350
;350:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $125
JUMPV
LABELV $129
line 352
;351:		}
;352:		if( c == '\n' ) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $131
line 353
;353:			com_lines++;
ADDRLP4 4
ADDRGP4 com_lines
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 354
;354:			*hasNewLines = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 355
;355:		}
LABELV $131
line 356
;356:		data++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 357
;357:	}
LABELV $127
line 348
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $126
line 359
;358:
;359:	return data;
ADDRFP4 0
INDIRP4
RETP4
LABELV $125
endproc SkipWhitespace 8 0
export COM_Compress
proc COM_Compress 48 0
line 362
;360:}
;361:
;362:int COM_Compress( char *data_p ) {
line 365
;363:	char *in, *out;
;364:	int c;
;365:	qboolean newline = qfalse, whitespace = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 367
;366:
;367:	in = out = data_p;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 368
;368:	if (in) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $134
ADDRGP4 $137
JUMPV
LABELV $136
line 369
;369:		while ((c = *in) != 0) {
line 371
;370:			// skip double slash comments
;371:			if ( c == '/' && in[1] == '/' ) {
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $139
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $139
ADDRGP4 $142
JUMPV
LABELV $141
line 372
;372:				while (*in && *in != '\n') {
line 373
;373:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 374
;374:				}
LABELV $142
line 372
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $144
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $141
LABELV $144
line 376
;375:				// skip /* */ comments
;376:			} else if ( c == '/' && in[1] == '*' ) {
ADDRGP4 $140
JUMPV
LABELV $139
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $145
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $145
ADDRGP4 $148
JUMPV
LABELV $147
line 378
;377:				while ( *in && ( *in != '*' || in[1] != '/' ) )
;378:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $148
line 377
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $150
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $147
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $147
LABELV $150
line 379
;379:				if ( *in )
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $146
line 380
;380:					in += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 382
;381:				// record when we hit a newline
;382:			} else if ( c == '\n' || c == '\r' ) {
ADDRGP4 $146
JUMPV
LABELV $145
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $155
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $153
LABELV $155
line 383
;383:				newline = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 384
;384:				in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 386
;385:				// record when we hit whitespace
;386:			} else if ( c == ' ' || c == '\t') {
ADDRGP4 $154
JUMPV
LABELV $153
ADDRLP4 4
INDIRI4
CNSTI4 32
EQI4 $158
ADDRLP4 4
INDIRI4
CNSTI4 9
NEI4 $156
LABELV $158
line 387
;387:				whitespace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 388
;388:				in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 390
;389:				// an actual token
;390:			} else {
ADDRGP4 $157
JUMPV
LABELV $156
line 392
;391:				// if we have a pending newline, emit it (and it counts as whitespace)
;392:				if (newline) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $159
line 393
;393:					*out++ = '\n';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 10
ASGNI1
line 394
;394:					newline = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 395
;395:					whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 396
;396:				} if (whitespace) {
LABELV $159
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $161
line 397
;397:					*out++ = ' ';
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI1 32
ASGNI1
line 398
;398:					whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 399
;399:				}
LABELV $161
line 402
;400:
;401:				// copy quoted strings unmolested
;402:				if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $163
line 403
;403:					*out++ = c;
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 404
;404:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $166
JUMPV
LABELV $165
line 405
;405:					while (1) {
line 406
;406:						c = *in;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 407
;407:						if (c && c != '"') {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $167
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $167
line 408
;408:							*out++ = c;
ADDRLP4 44
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 409
;409:							in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 410
;410:						} else {
line 411
;411:							break;
LABELV $169
line 413
;412:						}
;413:					}
LABELV $166
line 405
ADDRGP4 $165
JUMPV
LABELV $167
line 414
;414:					if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $164
line 415
;415:						*out++ = c;
ADDRLP4 40
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 416
;416:						in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 417
;417:					}
line 418
;418:				} else {
ADDRGP4 $164
JUMPV
LABELV $163
line 419
;419:					*out = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 420
;420:					out++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 421
;421:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 422
;422:				}
LABELV $164
line 423
;423:			}
LABELV $157
LABELV $154
LABELV $146
LABELV $140
line 424
;424:		}
LABELV $137
line 369
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $136
line 426
;425:
;426:		*out = 0;
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 427
;427:	}
LABELV $134
line 428
;428:	return out - data_p;
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
LABELV $133
endproc COM_Compress 48 0
export COM_ParseExt
proc COM_ParseExt 36 8
line 432
;429:}
;430:
;431:char *COM_ParseExt( const char **data_p, qboolean allowLineBreaks )
;432:{
line 433
;433:	int c = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 434
;434:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 437
;435:	const char *data;
;436:
;437:	data = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 438
;438:	len = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 439
;439:	com_token[0] = 0;
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 442
;440:
;441:	// make sure incoming data is valid
;442:	if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $176
line 443
;443:	{
line 444
;444:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 445
;445:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $172
JUMPV
LABELV $175
line 449
;446:	}
;447:
;448:	while ( 1 )
;449:	{
line 451
;450:		// skip whitespace
;451:		data = SkipWhitespace( data, &hasNewLines );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 452
;452:		if ( !data )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $178
line 453
;453:		{
line 454
;454:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 455
;455:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $172
JUMPV
LABELV $178
line 457
;456:		}
;457:		if ( hasNewLines && !allowLineBreaks )
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $180
ADDRFP4 4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $180
line 458
;458:		{
line 459
;459:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 460
;460:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $172
JUMPV
LABELV $180
line 463
;461:		}
;462:
;463:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 466
;464:
;465:		// skip double slash comments
;466:		if ( c == '/' && data[1] == '/' )
ADDRLP4 24
CNSTI4 47
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $182
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $182
line 467
;467:		{
line 468
;468:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $185
JUMPV
LABELV $184
line 469
;469:			while (*data && *data != '\n') {
line 470
;470:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 471
;471:			}
LABELV $185
line 469
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $187
ADDRLP4 28
INDIRI4
CNSTI4 10
NEI4 $184
LABELV $187
line 472
;472:		}
ADDRGP4 $183
JUMPV
LABELV $182
line 474
;473:		// skip /* */ comments
;474:		else if ( c=='/' && data[1] == '*' ) 
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $177
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $177
line 475
;475:		{
line 476
;476:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $191
JUMPV
LABELV $190
line 478
;477:			while ( *data && ( *data != '*' || data[1] != '/' ) ) 
;478:			{
line 479
;479:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 480
;480:			}
LABELV $191
line 477
ADDRLP4 32
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $193
ADDRLP4 32
INDIRI4
CNSTI4 42
NEI4 $190
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $190
LABELV $193
line 481
;481:			if ( *data ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $189
line 482
;482:			{
line 483
;483:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 484
;484:			}
line 485
;485:		}
line 487
;486:		else
;487:		{
line 488
;488:			break;
LABELV $189
LABELV $183
line 490
;489:		}
;490:	}
LABELV $176
line 448
ADDRGP4 $175
JUMPV
LABELV $177
line 493
;491:
;492:	// handle quoted strings
;493:	if (c == '\"')
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $196
line 494
;494:	{
line 495
;495:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $199
JUMPV
LABELV $198
line 497
;496:		while (1)
;497:		{
line 498
;498:			c = *data++;
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 499
;499:			if (c=='\"' || !c)
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $203
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $201
LABELV $203
line 500
;500:			{
line 501
;501:				com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 502
;502:				*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 503
;503:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $172
JUMPV
LABELV $201
line 505
;504:			}
;505:			if (len < MAX_TOKEN_CHARS - 1)
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $204
line 506
;506:			{
line 507
;507:				com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 508
;508:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 509
;509:			}
LABELV $204
line 510
;510:		}
LABELV $199
line 496
ADDRGP4 $198
JUMPV
line 511
;511:	}
LABELV $196
LABELV $206
line 515
;512:
;513:	// parse a regular word
;514:	do
;515:	{
line 516
;516:		if (len < MAX_TOKEN_CHARS - 1)
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $209
line 517
;517:		{
line 518
;518:			com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 519
;519:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 520
;520:		}
LABELV $209
line 521
;521:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 522
;522:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 523
;523:		if ( c == '\n' )
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $211
line 524
;524:			com_lines++;
ADDRLP4 16
ADDRGP4 com_lines
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $211
line 525
;525:	} while (c>32);
LABELV $207
ADDRLP4 4
INDIRI4
CNSTI4 32
GTI4 $206
line 527
;526:
;527:	com_token[len] = 0;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 529
;528:
;529:	*data_p = ( char * ) data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 530
;530:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $172
endproc COM_ParseExt 36 8
export COM_ParseString
proc COM_ParseString 4 8
line 594
;531:}
;532:
;533:
;534:#if 0
;535:// no longer used
;536:/*
;537:===============
;538:COM_ParseInfos
;539:===============
;540:*/
;541:int COM_ParseInfos( char *buf, int max, char infos[][MAX_INFO_STRING] ) {
;542:	char	*token;
;543:	int		count;
;544:	char	key[MAX_TOKEN_CHARS];
;545:
;546:	count = 0;
;547:
;548:	while ( 1 ) {
;549:		token = COM_Parse( &buf );
;550:		if ( !token[0] ) {
;551:			break;
;552:		}
;553:		if ( strcmp( token, "{" ) ) {
;554:			Com_Printf( "Missing { in info file\n" );
;555:			break;
;556:		}
;557:
;558:		if ( count == max ) {
;559:			Com_Printf( "Max infos exceeded\n" );
;560:			break;
;561:		}
;562:
;563:		infos[count][0] = 0;
;564:		while ( 1 ) {
;565:			token = COM_ParseExt( &buf, qtrue );
;566:			if ( !token[0] ) {
;567:				Com_Printf( "Unexpected end of info file\n" );
;568:				break;
;569:			}
;570:			if ( !strcmp( token, "}" ) ) {
;571:				break;
;572:			}
;573:			Q_strncpyz( key, token, sizeof( key ) );
;574:
;575:			token = COM_ParseExt( &buf, qfalse );
;576:			if ( !token[0] ) {
;577:				Q_strncpyz( token, "<NULL>" );
;578:			}
;579:			Info_SetValueForKey( infos[count], key, token );
;580:		}
;581:		count++;
;582:	}
;583:
;584:	return count;
;585:}
;586:#endif
;587:
;588:/*
;589:===============
;590:COM_ParseString
;591:===============
;592:*/
;593:qboolean COM_ParseString( const char **data, const char **s ) 
;594:{
line 596
;595://	*s = COM_ParseExt( data, qtrue );
;596:	*s = COM_ParseExt( data, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 597
;597:	if ( s[0] == 0 ) 
ADDRFP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $214
line 598
;598:	{
line 599
;599:		Com_Printf("unexpected EOF\n");
ADDRGP4 $216
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 600
;600:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $213
JUMPV
LABELV $214
line 602
;601:	}
;602:	return qfalse;
CNSTI4 0
RETI4
LABELV $213
endproc COM_ParseString 4 8
export COM_ParseInt
proc COM_ParseInt 12 8
line 611
;603:}
;604:
;605:/*
;606:===============
;607:COM_ParseInt
;608:===============
;609:*/
;610:qboolean COM_ParseInt( const char **data, int *i ) 
;611:{
line 614
;612:	const char	*token;
;613:
;614:	token = COM_ParseExt( data, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 615
;615:	if ( token[0] == 0 ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $218
line 616
;616:	{
line 617
;617:		Com_Printf( "unexpected EOF\n" );
ADDRGP4 $216
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 618
;618:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $217
JUMPV
LABELV $218
line 621
;619:	}
;620:
;621:	*i = atoi( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 622
;622:	return qfalse;
CNSTI4 0
RETI4
LABELV $217
endproc COM_ParseInt 12 8
export COM_ParseFloat
proc COM_ParseFloat 12 8
line 631
;623:}
;624:
;625:/*
;626:===============
;627:COM_ParseFloat
;628:===============
;629:*/
;630:qboolean COM_ParseFloat( const char **data, float *f ) 
;631:{
line 634
;632:	const char	*token;
;633:
;634:	token = COM_ParseExt( data, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 635
;635:	if ( token[0] == 0 ) 
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $221
line 636
;636:	{
line 637
;637:		Com_Printf( "unexpected EOF\n" );
ADDRGP4 $216
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 638
;638:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $220
JUMPV
LABELV $221
line 641
;639:	}
;640:
;641:	*f = atof( token );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRF4
ASGNF4
line 642
;642:	return qfalse;
CNSTI4 0
RETI4
LABELV $220
endproc COM_ParseFloat 12 8
export COM_ParseVec4
proc COM_ParseVec4 12 8
line 651
;643:}
;644:
;645:/*
;646:===============
;647:COM_ParseVec4
;648:===============
;649:*/
;650:qboolean COM_ParseVec4( const char **buffer, vec4_t *c) 
;651:{
line 655
;652:	int i;
;653:	float f;
;654:
;655:	for (i = 0; i < 4; i++) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $224
line 656
;656:	{
line 657
;657:		if (COM_ParseFloat(buffer, &f)) 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 COM_ParseFloat
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $228
line 658
;658:		{
line 659
;659:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $223
JUMPV
LABELV $228
line 661
;660:		}
;661:		(*c)[i] = f;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 662
;662:	}
LABELV $225
line 655
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $224
line 663
;663:	return qfalse;
CNSTI4 0
RETI4
LABELV $223
endproc COM_ParseVec4 12 8
export COM_MatchToken
proc COM_MatchToken 12 16
line 671
;664:}
;665:
;666:/*
;667:==================
;668:COM_MatchToken
;669:==================
;670:*/
;671:void COM_MatchToken( const char **buf_p, char *match ) {
line 674
;672:	char	*token;
;673:
;674:	token = COM_Parse( buf_p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 675
;675:	if ( strcmp( token, match ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $231
line 676
;676:		Com_Error( ERR_DROP, "MatchToken: %s != %s", token, match );
CNSTI4 1
ARGI4
ADDRGP4 $233
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 677
;677:	}
LABELV $231
line 678
;678:}
LABELV $230
endproc COM_MatchToken 12 16
export SkipBracedSection
proc SkipBracedSection 12 8
line 690
;679:
;680:
;681:/*
;682:=================
;683:SkipBracedSection
;684:
;685:The next token should be an open brace.
;686:Skips until a matching close brace is found.
;687:Internal brace depths are properly skipped.
;688:=================
;689:*/
;690:void SkipBracedSection (const char **program) {
line 694
;691:	char			*token;
;692:	int				depth;
;693:
;694:	depth = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $235
line 695
;695:	do {
line 696
;696:		token = COM_ParseExt( program, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 697
;697:		if( token[1] == 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $238
line 698
;698:			if( token[0] == '{' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $240
line 699
;699:				depth++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 700
;700:			}
ADDRGP4 $241
JUMPV
LABELV $240
line 701
;701:			else if( token[0] == '}' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $242
line 702
;702:				depth--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 703
;703:			}
LABELV $242
LABELV $241
line 704
;704:		}
LABELV $238
line 705
;705:	} while( depth && *program );
LABELV $236
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $244
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $235
LABELV $244
line 706
;706:}
LABELV $234
endproc SkipBracedSection 12 8
export SkipRestOfLine
proc SkipRestOfLine 8 0
line 709
;707:
;708:void SkipRestOfLine(const char **data)
;709:{
line 711
;710:	const char *p;
;711:	p = *data;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRGP4 $247
JUMPV
LABELV $246
line 713
;712:	while (p != NULL && *p != '\0')
;713:	{
line 714
;714:		if (*p == '\n')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $249
line 715
;715:		{
line 716
;716:			com_lines++;
ADDRLP4 4
ADDRGP4 com_lines
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 717
;717:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 718
;718:			break;
ADDRGP4 $248
JUMPV
LABELV $249
line 720
;719:		}
;720:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 721
;721:	}
LABELV $247
line 712
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $251
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $246
LABELV $251
LABELV $248
line 722
;722:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 723
;723:}
LABELV $245
endproc SkipRestOfLine 8 0
export Parse1DMatrix
proc Parse1DMatrix 16 8
line 725
;724:
;725:void Parse1DMatrix (const char **buf_p, int x, float *m) {
line 729
;726:	char	*token;
;727:	int		i;
;728:
;729:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 731
;730:
;731:	for (i = 0 ; i < x ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $257
JUMPV
LABELV $254
line 732
;732:		token = COM_Parse(buf_p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 733
;733:		m[i] = atof(token);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 734
;734:	}
LABELV $255
line 731
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $257
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $254
line 736
;735:
;736:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $258
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 737
;737:}
LABELV $252
endproc Parse1DMatrix 16 8
export Parse2DMatrix
proc Parse2DMatrix 8 12
line 739
;738:
;739:void Parse2DMatrix (const char **buf_p, int y, int x, float *m) {
line 742
;740:	int		i;
;741:
;742:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 744
;743:
;744:	for (i = 0 ; i < y ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $263
JUMPV
LABELV $260
line 745
;745:		Parse1DMatrix (buf_p, x, m + i * x);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse1DMatrix
CALLV
pop
line 746
;746:	}
LABELV $261
line 744
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $263
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $260
line 748
;747:
;748:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $258
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 749
;749:}
LABELV $259
endproc Parse2DMatrix 8 12
export Parse3DMatrix
proc Parse3DMatrix 12 16
line 751
;750:
;751:void Parse3DMatrix (const char **buf_p, int z, int y, int x, float *m) {
line 754
;752:	int		i;
;753:
;754:	COM_MatchToken( buf_p, "(" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 756
;755:
;756:	for (i = 0 ; i < z ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $268
JUMPV
LABELV $265
line 757
;757:		Parse2DMatrix (buf_p, y, x, m + i * x*y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse2DMatrix
CALLV
pop
line 758
;758:	}
LABELV $266
line 756
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $268
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $265
line 760
;759:
;760:	COM_MatchToken( buf_p, ")" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $258
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 761
;761:}
LABELV $264
endproc Parse3DMatrix 12 16
export Q_isprint
proc Q_isprint 4 0
line 773
;762:
;763:
;764:/*
;765:============================================================================
;766:
;767:					LIBRARY REPLACEMENT FUNCTIONS
;768:
;769:============================================================================
;770:*/
;771:
;772:int Q_isprint( int c )
;773:{
line 774
;774:	if ( c >= 0x20 && c <= 0x7E )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $270
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $270
line 775
;775:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $269
JUMPV
LABELV $270
line 776
;776:	return ( 0 );
CNSTI4 0
RETI4
LABELV $269
endproc Q_isprint 4 0
export Q_islower
proc Q_islower 4 0
line 780
;777:}
;778:
;779:int Q_islower( int c )
;780:{
line 781
;781:	if (c >= 'a' && c <= 'z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $273
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $273
line 782
;782:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $272
JUMPV
LABELV $273
line 783
;783:	return ( 0 );
CNSTI4 0
RETI4
LABELV $272
endproc Q_islower 4 0
export Q_isupper
proc Q_isupper 4 0
line 787
;784:}
;785:
;786:int Q_isupper( int c )
;787:{
line 788
;788:	if (c >= 'A' && c <= 'Z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $276
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $276
line 789
;789:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $275
JUMPV
LABELV $276
line 790
;790:	return ( 0 );
CNSTI4 0
RETI4
LABELV $275
endproc Q_isupper 4 0
export Q_isalpha
proc Q_isalpha 8 0
line 794
;791:}
;792:
;793:int Q_isalpha( int c )
;794:{
line 795
;795:	if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $282
ADDRLP4 0
INDIRI4
CNSTI4 122
LEI4 $281
LABELV $282
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $279
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $279
LABELV $281
line 796
;796:		return ( 1 );
CNSTI4 1
RETI4
ADDRGP4 $278
JUMPV
LABELV $279
line 797
;797:	return ( 0 );
CNSTI4 0
RETI4
LABELV $278
endproc Q_isalpha 8 0
export Q_strrchr
proc Q_strrchr 12 0
line 801
;798:}
;799:
;800:char* Q_strrchr( const char* string, int c )
;801:{
line 802
;802:	char cc = c;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 804
;803:	char *s;
;804:	char *sp=(char *)0;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 806
;805:
;806:	s = (char*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $285
JUMPV
LABELV $284
line 809
;807:
;808:	while (*s)
;809:	{
line 810
;810:		if (*s == cc)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI1
CVII4 1
NEI4 $287
line 811
;811:			sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $287
line 812
;812:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 813
;813:	}
LABELV $285
line 808
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $284
line 814
;814:	if (cc == 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $289
line 815
;815:		sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $289
line 817
;816:
;817:	return sp;
ADDRLP4 8
INDIRP4
RETP4
LABELV $283
endproc Q_strrchr 12 0
export Q_strncpyz
proc Q_strncpyz 0 12
line 827
;818:}
;819:
;820:/*
;821:=============
;822:Q_strncpyz
;823: 
;824:Safe strncpy that ensures a trailing zero
;825:=============
;826:*/
;827:void Q_strncpyz( char *dest, const char *src, int destsize ) {
line 829
;828:  // bk001129 - also NULL dest
;829:  if ( !dest ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $292
line 830
;830:    Com_Error( ERR_FATAL, "Q_strncpyz: NULL dest" );
CNSTI4 0
ARGI4
ADDRGP4 $294
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 831
;831:  }
LABELV $292
line 832
;832:	if ( !src ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $295
line 833
;833:		Com_Error( ERR_FATAL, "Q_strncpyz: NULL src" );
CNSTI4 0
ARGI4
ADDRGP4 $297
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 834
;834:	}
LABELV $295
line 835
;835:	if ( destsize < 1 ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $298
line 836
;836:		Com_Error(ERR_FATAL,"Q_strncpyz: destsize < 1" ); 
CNSTI4 0
ARGI4
ADDRGP4 $300
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 837
;837:	}
LABELV $298
line 839
;838:
;839:	strncpy( dest, src, destsize-1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
CVIU4 4
ARGU4
ADDRGP4 strncpy
CALLP4
pop
line 840
;840:  dest[destsize-1] = 0;
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 841
;841:}
LABELV $291
endproc Q_strncpyz 0 12
export Q_strnncpyz
proc Q_strnncpyz 0 12
line 850
;842:
;843:/*
;844:=============
;845:Q_strnncpyz
;846:
;847:Safe strncpy that ensures a trailing zero (and lets us still specify amount of chars to copy)
;848:=============
;849:*/
;850:void Q_strnncpyz(char* dest, const char* src, int charsToCopy, int destsize) {
line 852
;851:
;852:	if (!dest) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $302
line 853
;853:		Com_Error(ERR_FATAL, "Q_strncpyz: NULL dest");
CNSTI4 0
ARGI4
ADDRGP4 $294
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 854
;854:	}
LABELV $302
line 855
;855:	if (!src) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $304
line 856
;856:		Com_Error(ERR_FATAL, "Q_strncpyz: NULL src");
CNSTI4 0
ARGI4
ADDRGP4 $297
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 857
;857:	}
LABELV $304
line 858
;858:	if (destsize < 1) {
ADDRFP4 12
INDIRI4
CNSTI4 1
GEI4 $306
line 859
;859:		Com_Error(ERR_FATAL, "Q_strncpyz: destsize < 1");
CNSTI4 0
ARGI4
ADDRGP4 $300
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 860
;860:	}
LABELV $306
line 861
;861:	if (charsToCopy >= destsize) {
ADDRFP4 8
INDIRI4
ADDRFP4 12
INDIRI4
LTI4 $308
line 862
;862:		charsToCopy = destsize - 1;
ADDRFP4 8
ADDRFP4 12
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 863
;863:	}
LABELV $308
line 864
;864:	strncpy(dest, src, charsToCopy);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 strncpy
CALLP4
pop
line 865
;865:	dest[charsToCopy] = 0;
ADDRFP4 8
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 866
;866:}
LABELV $301
endproc Q_strnncpyz 0 12
export Q_stricmpn
proc Q_stricmpn 32 0
line 868
;867:                 
;868:int Q_stricmpn (const char *s1, const char *s2, int n) {
line 872
;869:	int		c1, c2;
;870:
;871:	// bk001129 - moved in 1.17 fix not in id codebase
;872:        if ( s1 == NULL ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $311
line 873
;873:           if ( s2 == NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $313
line 874
;874:             return 0;
CNSTI4 0
RETI4
ADDRGP4 $310
JUMPV
LABELV $313
line 876
;875:           else
;876:             return -1;
CNSTI4 -1
RETI4
ADDRGP4 $310
JUMPV
LABELV $311
line 878
;877:        }
;878:        else if ( s2==NULL )
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $315
line 879
;879:          return 1;
CNSTI4 1
RETI4
ADDRGP4 $310
JUMPV
LABELV $315
LABELV $317
line 883
;880:
;881:
;882:	
;883:	do {
line 884
;884:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 885
;885:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 887
;886:
;887:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $320
line 888
;888:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $310
JUMPV
LABELV $320
line 891
;889:		}
;890:		
;891:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $322
line 892
;892:			if (c1 >= 'a' && c1 <= 'z') {
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $324
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $324
line 893
;893:				c1 -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 894
;894:			}
LABELV $324
line 895
;895:			if (c2 >= 'a' && c2 <= 'z') {
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $326
ADDRLP4 4
INDIRI4
CNSTI4 122
GTI4 $326
line 896
;896:				c2 -= ('a' - 'A');
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 897
;897:			}
LABELV $326
line 898
;898:			if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $328
line 899
;899:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $331
ADDRLP4 28
CNSTI4 -1
ASGNI4
ADDRGP4 $332
JUMPV
LABELV $331
ADDRLP4 28
CNSTI4 1
ASGNI4
LABELV $332
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $310
JUMPV
LABELV $328
line 901
;900:			}
;901:		}
LABELV $322
line 902
;902:	} while (c1);
LABELV $318
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $317
line 904
;903:	
;904:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $310
endproc Q_stricmpn 32 0
export Q_strncmp
proc Q_strncmp 24 0
line 907
;905:}
;906:
;907:int Q_strncmp (const char *s1, const char *s2, int n) {
LABELV $334
line 910
;908:	int		c1, c2;
;909:	
;910:	do {
line 911
;911:		c1 = *s1++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 912
;912:		c2 = *s2++;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 914
;913:
;914:		if (!n--) {
ADDRLP4 16
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $337
line 915
;915:			return 0;		// strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $333
JUMPV
LABELV $337
line 918
;916:		}
;917:		
;918:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $339
line 919
;919:			return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $342
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRGP4 $343
JUMPV
LABELV $342
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $343
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $333
JUMPV
LABELV $339
line 921
;920:		}
;921:	} while (c1);
LABELV $335
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $334
line 923
;922:	
;923:	return 0;		// strings are equal
CNSTI4 0
RETI4
LABELV $333
endproc Q_strncmp 24 0
export Q_stricmp
proc Q_stricmp 12 12
line 926
;924:}
;925:
;926:int Q_stricmp (const char *s1, const char *s2) {
line 927
;927:	return (s1 && s2) ? Q_stricmpn (s1, s2, 99999) : -1;
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $346
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $346
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
ADDRLP4 8
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $347
JUMPV
LABELV $346
ADDRLP4 0
CNSTI4 -1
ASGNI4
LABELV $347
ADDRLP4 0
INDIRI4
RETI4
LABELV $344
endproc Q_stricmp 12 12
export Q_strlwr
proc Q_strlwr 12 4
line 931
;928:}
;929:
;930:
;931:char *Q_strlwr( char *s1 ) {
line 934
;932:    char	*s;
;933:
;934:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $350
JUMPV
LABELV $349
line 935
;935:	while ( *s ) {
line 936
;936:		*s = tolower(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 937
;937:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 938
;938:	}
LABELV $350
line 935
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $349
line 939
;939:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $348
endproc Q_strlwr 12 4
export Q_strupr
proc Q_strupr 12 4
line 942
;940:}
;941:
;942:char *Q_strupr( char *s1 ) {
line 945
;943:    char	*s;
;944:
;945:    s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $354
JUMPV
LABELV $353
line 946
;946:	while ( *s ) {
line 947
;947:		*s = toupper(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 948
;948:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 949
;949:	}
LABELV $354
line 946
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $353
line 950
;950:    return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $352
endproc Q_strupr 12 4
export Q_strcat
proc Q_strcat 12 12
line 955
;951:}
;952:
;953:
;954:// never goes past bounds or leaves without a terminating 0
;955:void Q_strcat( char *dest, int size, const char *src ) {
line 958
;956:	int		l1;
;957:
;958:	l1 = strlen( dest );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ADDRLP4 4
INDIRU4
CVUI4 4
ASGNI4
line 959
;959:	if ( l1 >= size ) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $357
line 960
;960:		Com_Error( ERR_FATAL, "Q_strcat: already overflowed" );
CNSTI4 0
ARGI4
ADDRGP4 $359
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 961
;961:	}
LABELV $357
line 962
;962:	Q_strncpyz( dest + l1, src, size - l1 );
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 963
;963:}
LABELV $356
endproc Q_strcat 12 12
export Q_PrintStrlen
proc Q_PrintStrlen 52 0
line 966
;964:
;965:
;966:int Q_PrintStrlen( const char *string, qboolean use102color, qboolean ntModColors) {
line 970
;967:	int			len;
;968:	const char	*p;
;969:
;970:	if( !string ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $361
line 971
;971:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $360
JUMPV
LABELV $361
line 974
;972:	}
;973:
;974:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 975
;975:	p = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $364
JUMPV
LABELV $363
line 976
;976:	while( *p ) {
line 977
;977:		if (Q_IsColorString(p) || (use102color && Q_IsColorString_1_02(p)) || (ntModColors && Q_IsColorStringNT(p))) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $373
ADDRLP4 12
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $373
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $373
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $373
ADDRLP4 16
INDIRI4
CNSTI4 55
GTI4 $373
ADDRLP4 16
INDIRI4
CNSTI4 48
GEI4 $374
LABELV $373
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $378
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $378
ADDRLP4 28
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
NEI4 $378
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $378
ADDRLP4 32
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $374
LABELV $378
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $366
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $366
ADDRLP4 44
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
NEI4 $366
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $366
ADDRLP4 48
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $366
ADDRLP4 48
INDIRI4
CNSTI4 127
GTI4 $366
ADDRLP4 48
INDIRI4
CNSTI4 48
LTI4 $366
LABELV $374
line 978
;978:			p += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 979
;979:			continue;
ADDRGP4 $364
JUMPV
LABELV $366
line 981
;980:		}
;981:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 982
;982:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 983
;983:	}
LABELV $364
line 976
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $363
line 985
;984:
;985:	return len;
ADDRLP4 4
INDIRI4
RETI4
LABELV $360
endproc Q_PrintStrlen 52 0
export Q_CleanStr
proc Q_CleanStr 68 0
line 989
;986:}
;987:
;988:
;989:char *Q_CleanStr( char *string, qboolean use102color, qboolean ntModColors) {
line 994
;990:	char*	d;
;991:	char*	s;
;992:	int		c;
;993:
;994:	if (!string || !*string) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $382
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $380
LABELV $382
line 995
;995:		return string;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $379
JUMPV
LABELV $380
line 998
;996:	}
;997:
;998:	s = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 999
;999:	d = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $384
JUMPV
LABELV $383
line 1000
;1000:	while ((c = *s) != 0 ) {
line 1001
;1001:		if (Q_IsColorString(s) || (use102color && Q_IsColorString_1_02(s)) || (ntModColors && Q_IsColorStringNT(s))) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $393
ADDRLP4 20
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
NEI4 $393
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $393
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $393
ADDRLP4 24
INDIRI4
CNSTI4 55
GTI4 $393
ADDRLP4 24
INDIRI4
CNSTI4 48
GEI4 $394
LABELV $393
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $398
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $398
ADDRLP4 36
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
NEI4 $398
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $398
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $394
LABELV $398
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $386
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $386
ADDRLP4 52
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
NEI4 $386
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $386
ADDRLP4 56
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $386
ADDRLP4 56
INDIRI4
CNSTI4 127
GTI4 $386
ADDRLP4 56
INDIRI4
CNSTI4 48
LTI4 $386
LABELV $394
line 1002
;1002:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1003
;1003:		}		
ADDRGP4 $387
JUMPV
LABELV $386
line 1004
;1004:		else if ( c >= 0x20 && c <= 0x7E ) {
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $399
ADDRLP4 4
INDIRI4
CNSTI4 126
GTI4 $399
line 1005
;1005:			*d++ = c;
ADDRLP4 64
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 64
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 1006
;1006:		}
LABELV $399
LABELV $387
line 1007
;1007:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1008
;1008:	}
LABELV $384
line 1000
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $383
line 1009
;1009:	*d = '\0';
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 1011
;1010:
;1011:	return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $379
endproc Q_CleanStr 68 0
export Q_CleanAsciiStr
proc Q_CleanAsciiStr 20 0
line 1014
;1012:}
;1013:
;1014:char *Q_CleanAsciiStr( char *string ) {
line 1019
;1015:	char*	d;
;1016:	char*	s;
;1017:	int		c;
;1018:
;1019:	s = string;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 1020
;1020:	d = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $403
JUMPV
LABELV $402
line 1021
;1021:	while ((c = *s) != 0 ) {
line 1022
;1022:		if ( c >= 0x20 && c <= 0x7E ) {
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $405
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $405
line 1023
;1023:			*d++ = c;
ADDRLP4 16
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 0
INDIRI4
CVII1 4
ASGNI1
line 1024
;1024:		}
LABELV $405
line 1025
;1025:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1026
;1026:	}
LABELV $403
line 1021
ADDRLP4 12
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $402
line 1027
;1027:	*d = '\0';
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 1029
;1028:
;1029:	return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $401
endproc Q_CleanAsciiStr 20 0
export Q_StripColor
proc Q_StripColor 40 0
line 1072
;1030:}
;1031:
;1032:#if defined(_MSC_VER) && _MSC_VER < 1900
;1033:/*
;1034:=============
;1035:Q_vsnprintf
;1036:/*
;1037:Q_strstrip
;1038:
;1039:Special wrapper function for Microsoft's broken _vsnprintf() function.
;1040:=============
;1041:*/
;1042:
;1043:size_t Q_vsnprintf(char *str, size_t size, const char *format, va_list ap) {
;1044:	int retval;
;1045:	retval = _vsnprintf(str, size, format, ap);
;1046:	if (retval < 0 || retval == size) {
;1047:		// Microsoft doesn't adhere to the C99 standard of vsnprintf,
;1048:		// which states that the return value must be the number of
;1049:		// bytes written if the output string had sufficient length.
;1050:		//
;1051:		// Obviously we cannot determine that value from Microsoft's
;1052:		// implementation, so we have no choice but to return size.
;1053:		str[size - 1] = '\0';
;1054:		return size;
;1055:	}
;1056:	return retval;
;1057:}
;1058:#endif
;1059:
;1060:/*
;1061:==================
;1062:Q_StripColor
;1063:
;1064:Strips coloured strings in-place using multiple passes: "fgs^^56fds" -> "fgs^6fds" -> "fgsfds"
;1065:
;1066:This function modifies INPUT (is mutable)
;1067:
;1068:(Also strips ^8 and ^9)
;1069:==================
;1070:*/
;1071:void Q_StripColor(char* text)//, qboolean doHex)
;1072:{
line 1073
;1073:	qboolean doPass = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $409
JUMPV
LABELV $408
line 1078
;1074:	char* read;
;1075:	char* write;
;1076:
;1077:	while (doPass)
;1078:	{
line 1079
;1079:		doPass = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1080
;1080:		read = write = text;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRGP4 $412
JUMPV
LABELV $411
line 1082
;1081:		while (*read)
;1082:		{
line 1083
;1083:			/*if (doHex && *read == Q_COLOR_ESCAPE && Q_IsColorStringHex(read + 1)) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $421
ADDRLP4 20
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
NEI4 $421
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $421
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $421
ADDRLP4 24
INDIRI4
CNSTI4 55
GTI4 $421
ADDRLP4 24
INDIRI4
CNSTI4 48
GEI4 $416
LABELV $421
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $414
ADDRLP4 32
CNSTI4 94
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 32
INDIRI4
NEI4 $414
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $414
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $414
LABELV $416
line 1089
;1084:				int skipCount = 0;
;1085:				Q_parseColorHex(read + 1, 0, &skipCount);
;1086:				read += 1 + skipCount;
;1087:			}
;1088:			else */if (Q_IsColorString(read) || Q_IsColorString_1_02(read))
;1089:			{
line 1090
;1090:				doPass = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1091
;1091:				read += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 1092
;1092:			}
ADDRGP4 $415
JUMPV
LABELV $414
line 1094
;1093:			else
;1094:			{
line 1096
;1095:				// Avoid writing the same data over itself
;1096:				if (write != read)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $422
line 1097
;1097:				{
line 1098
;1098:					*write = *read;
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 1099
;1099:				}
LABELV $422
line 1100
;1100:				write++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1101
;1101:				read++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1102
;1102:			}
LABELV $415
line 1103
;1103:		}
LABELV $412
line 1081
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $411
line 1104
;1104:		if (write < read)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
GEU4 $424
line 1105
;1105:		{
line 1107
;1106:			// Add trailing NUL byte if string has shortened
;1107:			*write = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1108
;1108:		}
LABELV $424
line 1109
;1109:	}
LABELV $409
line 1077
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $408
line 1110
;1110:}
LABELV $407
endproc Q_StripColor 40 0
export Q_strstrip
proc Q_strstrip 41 4
line 1125
;1111:
;1112:/*
;1113:Q_strstrip
;1114:
;1115:Description:	Replace strip[x] in string with repl[x] or remove characters entirely
;1116:Mutates:		string
;1117:Return:			--
;1118:
;1119:Examples:		Q_strstrip( "Bo\nb is h\rairy!!", "\n\r!", "123" );	// "Bo1b is h2airy33"
;1120:Q_strstrip( "Bo\nb is h\rairy!!", "\n\r!", "12" );	// "Bo1b is h2airy"
;1121:Q_strstrip( "Bo\nb is h\rairy!!", "\n\r!", NULL );	// "Bob is hairy"
;1122:*/
;1123:
;1124:void Q_strstrip( char *string, const char *strip, const char *repl )
;1125:{
line 1126
;1126:	char		*out=string, *p=string, c;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
line 1127
;1127:	const char	*s=strip;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
line 1128
;1128:	int			replaceLen = repl?strlen( repl ):0, offset=0;
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $428
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 28
ADDRLP4 32
INDIRU4
ASGNU4
ADDRGP4 $429
JUMPV
LABELV $428
ADDRLP4 28
CNSTU4 0
ASGNU4
LABELV $429
ADDRLP4 12
ADDRLP4 28
INDIRU4
CVUI4 4
ASGNI4
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1129
;1129:	qboolean	recordChar = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $431
JUMPV
LABELV $430
line 1132
;1130:
;1131:	while ( (c = *p++) != '\0' )
;1132:	{
line 1133
;1133:		recordChar = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 1134
;1134:		for ( s=strip; *s; s++ )
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $436
JUMPV
LABELV $433
line 1135
;1135:		{
line 1136
;1136:			offset = s-strip;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 1137
;1137:			if ( c == *s )
ADDRLP4 8
INDIRI1
CVII4 1
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
NEI4 $437
line 1138
;1138:			{
line 1139
;1139:				if ( !repl || offset >= replaceLen )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $441
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $439
LABELV $441
line 1140
;1140:					recordChar = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $435
JUMPV
LABELV $439
line 1142
;1141:				else
;1142:					c = repl[offset];
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 1143
;1143:				break;
ADDRGP4 $435
JUMPV
LABELV $437
line 1145
;1144:			}
;1145:		}
LABELV $434
line 1134
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $436
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $433
LABELV $435
line 1146
;1146:		if ( recordChar )
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $442
line 1147
;1147:			*out++ = c;
ADDRLP4 36
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 8
INDIRI1
ASGNI1
LABELV $442
line 1148
;1148:	}
LABELV $431
line 1131
ADDRLP4 36
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 8
ADDRLP4 40
INDIRI1
ASGNI1
ADDRLP4 40
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $430
line 1149
;1149:	*out = '\0';
ADDRLP4 24
INDIRP4
CNSTI1 0
ASGNI1
line 1150
;1150:}
LABELV $426
endproc Q_strstrip 41 4
export Q_strchrs
proc Q_strchrs 8 0
line 1162
;1151:
;1152:/*
;1153:Q_strchrs
;1154:
;1155:Description:	Find any characters in a string. Think of it as a shorthand strchr loop.
;1156:Mutates:		--
;1157:Return:			first instance of any characters found
;1158:otherwise NULL
;1159:*/
;1160:
;1161:const char *Q_strchrs( const char *string, const char *search )
;1162:{
line 1163
;1163:	const char *p = string, *s = search;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $446
JUMPV
LABELV $445
line 1166
;1164:
;1165:	while ( *p != '\0' )
;1166:	{
line 1167
;1167:		for ( s=search; *s; s++ )
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $451
JUMPV
LABELV $448
line 1168
;1168:		{
line 1169
;1169:			if ( *p == *s )
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
NEI4 $452
line 1170
;1170:				return p;
ADDRLP4 4
INDIRP4
RETP4
ADDRGP4 $444
JUMPV
LABELV $452
line 1171
;1171:		}
LABELV $449
line 1167
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $451
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $448
line 1172
;1172:		p++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1173
;1173:	}
LABELV $446
line 1165
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $445
line 1175
;1174:
;1175:	return NULL;
CNSTP4 0
RETP4
LABELV $444
endproc Q_strchrs 8 0
export Com_sprintf
proc Com_sprintf 32012 16
line 1179
;1176:}
;1177:
;1178:
;1179:void QDECL Com_sprintf( char *dest, int size, const char *fmt, ...) {
line 1184
;1180:	int		len;
;1181:	va_list		argptr;
;1182:	char	bigbuffer[32000];	// big, but small enough to fit in PPC stack
;1183:
;1184:	va_start (argptr,fmt);
ADDRLP4 32004
ADDRFP4 8+4
ASGNP4
line 1185
;1185:	len = Q_vsnprintf (bigbuffer,sizeof(bigbuffer),fmt,argptr);
ADDRLP4 0
ARGP4
CNSTU4 32000
ARGU4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 32004
INDIRP4
ARGP4
ADDRLP4 32008
ADDRGP4 vsnprintf
CALLI4
ASGNI4
ADDRLP4 32000
ADDRLP4 32008
INDIRI4
ASGNI4
line 1186
;1186:	va_end (argptr);
ADDRLP4 32004
CNSTP4 0
ASGNP4
line 1187
;1187:	if ( len >= (int)sizeof( bigbuffer ) ) {
ADDRLP4 32000
INDIRI4
CNSTI4 32000
LTI4 $456
line 1188
;1188:		Com_Error( ERR_FATAL, "Com_sprintf: overflowed bigbuffer" );
CNSTI4 0
ARGI4
ADDRGP4 $458
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1189
;1189:	}
LABELV $456
line 1190
;1190:	if (len >= size) {
ADDRLP4 32000
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $459
line 1191
;1191:		Com_Printf ("Com_sprintf: overflow of %i in %i\n", len, size);
ADDRGP4 $461
ARGP4
ADDRLP4 32000
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1199
;1192:		/*
;1193:#ifdef	_DEBUG
;1194:		__asm {
;1195:			int 3;
;1196:		}
;1197:#endif
;1198:		*/
;1199:	}
LABELV $459
line 1200
;1200:	Q_strncpyz (dest, bigbuffer, size );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1201
;1201:}
LABELV $454
endproc Com_sprintf 32012 16
bss
align 1
LABELV $463
skip 64000
data
align 4
LABELV $464
byte 4 0
export va
code
proc va 12 16
line 1215
;1202:
;1203:
;1204:/*
;1205:============
;1206:va
;1207:
;1208:does a varargs printf into a temp buffer, so I don't need to have
;1209:varargs versions of all text functions.
;1210:FIXME: make this buffer size safe someday
;1211:============
;1212:*/
;1213:#define MAX_VA_STRING 32000
;1214:#define MAX_VA_BUFFERS 2
;1215:char	* QDECL va( const char *format, ... ) {
line 1221
;1216:	va_list		argptr;
;1217:	static char		string[MAX_VA_BUFFERS][MAX_VA_STRING];	// in case va is called by nested functions
;1218:	static int		index = 0;
;1219:	char	*buf;
;1220:
;1221:	buf = string[index & 1];
ADDRLP4 4
CNSTI4 32000
ADDRGP4 $464
INDIRI4
CNSTI4 1
BANDI4
MULI4
ADDRGP4 $463
ADDP4
ASGNP4
line 1222
;1222:	index++;
ADDRLP4 8
ADDRGP4 $464
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1224
;1223:
;1224:	va_start (argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 1225
;1225:	Q_vsnprintf (buf, MAX_VA_STRING, format,argptr);
ADDRLP4 4
INDIRP4
ARGP4
CNSTU4 32000
ARGU4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsnprintf
CALLI4
pop
line 1226
;1226:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1228
;1227:
;1228:	return buf;
ADDRLP4 4
INDIRP4
RETP4
LABELV $462
endproc va 12 16
bss
align 1
LABELV $467
skip 16384
data
align 1
LABELV $468
byte 1 0
skip 8191
align 4
LABELV $469
byte 4 0
export Info_ValueForKey
code
proc Info_ValueForKey 8220 8
line 1251
;1229:}
;1230:
;1231:
;1232:
;1233:
;1234:/*
;1235:=====================================================================
;1236:
;1237:  INFO STRINGS
;1238:
;1239:=====================================================================
;1240:*/
;1241:
;1242:/*
;1243:===============
;1244:Info_ValueForKey
;1245:
;1246:Searches the string for the given
;1247:key and returns the associated value, or an empty string.
;1248:FIXME: overflow check?
;1249:===============
;1250:*/
;1251:char *Info_ValueForKey( const char *s, const char *key ) {
line 1259
;1252:	char	pkey[BIG_INFO_KEY];
;1253:	static	char value[2][BIG_INFO_VALUE];	// use two buffers so compares
;1254:											// work without stomping on each other
;1255:	static	char emptyValue[BIG_INFO_VALUE] = { '\0' };
;1256:	static	int	valueindex = 0;
;1257:	char	*o;
;1258:	
;1259:	if ( !s || !key ) {
ADDRLP4 8196
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
EQU4 $472
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
NEU4 $470
LABELV $472
line 1260
;1260:		emptyValue[0] = '\0';
ADDRGP4 $468
CNSTI1 0
ASGNI1
line 1261
;1261:		return emptyValue;
ADDRGP4 $468
RETP4
ADDRGP4 $466
JUMPV
LABELV $470
line 1264
;1262:	}
;1263:
;1264:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8200
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 8200
INDIRU4
CNSTU4 8192
LTU4 $473
line 1265
;1265:		Com_Error( ERR_DROP, "Info_ValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $475
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1266
;1266:	}
LABELV $473
line 1268
;1267:
;1268:	valueindex ^= 1;
ADDRLP4 8204
ADDRGP4 $469
ASGNP4
ADDRLP4 8204
INDIRP4
ADDRLP4 8204
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1269
;1269:	if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $479
line 1270
;1270:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $479
JUMPV
LABELV $478
line 1272
;1271:	while (1)
;1272:	{
line 1273
;1273:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $482
JUMPV
LABELV $481
line 1275
;1274:		while (*s != '\\')
;1275:		{
line 1276
;1276:			if (!*s) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $484
line 1277
;1277:				emptyValue[0] = '\0';
ADDRGP4 $468
CNSTI1 0
ASGNI1
line 1278
;1278:				return emptyValue;
ADDRGP4 $468
RETP4
ADDRGP4 $466
JUMPV
LABELV $484
line 1280
;1279:			}
;1280:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 1281
;1281:		}
LABELV $482
line 1274
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $481
line 1282
;1282:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1283
;1283:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1285
;1284:
;1285:		o = value[valueindex];
ADDRLP4 0
ADDRGP4 $469
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $467
ADDP4
ASGNP4
ADDRGP4 $487
JUMPV
LABELV $486
line 1288
;1286:
;1287:		while (*s != '\\' && *s)
;1288:		{
line 1289
;1289:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 1290
;1290:		}
LABELV $487
line 1287
ADDRLP4 8208
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8208
INDIRI4
CNSTI4 92
EQI4 $489
ADDRLP4 8208
INDIRI4
CNSTI4 0
NEI4 $486
LABELV $489
line 1291
;1291:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1293
;1292:
;1293:		if (!Q_stricmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8212
INDIRI4
CNSTI4 0
NEI4 $490
line 1294
;1294:			return value[valueindex];
ADDRGP4 $469
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $467
ADDP4
RETP4
ADDRGP4 $466
JUMPV
LABELV $490
line 1296
;1295:
;1296:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $492
line 1297
;1297:			break;
ADDRGP4 $480
JUMPV
LABELV $492
line 1298
;1298:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1299
;1299:	}
LABELV $479
line 1271
ADDRGP4 $478
JUMPV
LABELV $480
line 1301
;1300:
;1301:	emptyValue[0] = '\0';
ADDRGP4 $468
CNSTI1 0
ASGNI1
line 1302
;1302:	return emptyValue;
ADDRGP4 $468
RETP4
LABELV $466
endproc Info_ValueForKey 8220 8
data
align 4
LABELV $495
byte 4 0
export Info_HasKey
code
proc Info_HasKey 8220 8
line 1315
;1303:}
;1304:
;1305:
;1306:/*
;1307:===============
;1308:Info_HasKey
;1309:
;1310:Searches the string for the given
;1311:key and returns qtrue if found, or qfalse if not found
;1312:FIXME: overflow check?
;1313:===============
;1314:*/
;1315:qboolean Info_HasKey( const char *s, const char *key ) {
line 1320
;1316:	char	pkey[BIG_INFO_KEY];
;1317:	static	int	valueindex = 0;
;1318:	char	*o;
;1319:	
;1320:	if ( !s || !key ) {
ADDRLP4 8196
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
EQU4 $498
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 8196
INDIRU4
NEU4 $496
LABELV $498
line 1321
;1321:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $494
JUMPV
LABELV $496
line 1324
;1322:	}
;1323:
;1324:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8200
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 8200
INDIRU4
CNSTU4 8192
LTU4 $499
line 1325
;1325:		Com_Error( ERR_DROP, "Info_HasKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $501
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1326
;1326:	}
LABELV $499
line 1328
;1327:
;1328:	valueindex ^= 1;
ADDRLP4 8204
ADDRGP4 $495
ASGNP4
ADDRLP4 8204
INDIRP4
ADDRLP4 8204
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1329
;1329:	if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $505
line 1330
;1330:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $505
JUMPV
LABELV $504
line 1332
;1331:	while (1)
;1332:	{
line 1333
;1333:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $508
JUMPV
LABELV $507
line 1335
;1334:		while (*s != '\\')
;1335:		{
line 1336
;1336:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $510
line 1337
;1337:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $494
JUMPV
LABELV $510
line 1338
;1338:			*o++ = *s++;
ADDRLP4 8208
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8216
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8208
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8212
INDIRP4
ADDRLP4 8216
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8208
INDIRP4
ADDRLP4 8212
INDIRP4
INDIRI1
ASGNI1
line 1339
;1339:		}
LABELV $508
line 1334
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $507
line 1340
;1340:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1341
;1341:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $513
JUMPV
LABELV $512
line 1343
;1342:
;1343:		while (*s != '\\' && *s) {
line 1345
;1344:			/* advance pointer (ignore value) */
;1345:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1346
;1346:		}
LABELV $513
line 1343
ADDRLP4 8208
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8208
INDIRI4
CNSTI4 92
EQI4 $515
ADDRLP4 8208
INDIRI4
CNSTI4 0
NEI4 $512
LABELV $515
line 1348
;1347:
;1348:		if (!Q_stricmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 8212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8212
INDIRI4
CNSTI4 0
NEI4 $516
line 1349
;1349:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $494
JUMPV
LABELV $516
line 1351
;1350:
;1351:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $518
line 1352
;1352:			break;
ADDRGP4 $506
JUMPV
LABELV $518
line 1353
;1353:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1354
;1354:	}
LABELV $505
line 1331
ADDRGP4 $504
JUMPV
LABELV $506
line 1356
;1355:
;1356:	return qfalse;
CNSTI4 0
RETI4
LABELV $494
endproc Info_HasKey 8220 8
export Info_NextPair
proc Info_NextPair 20 0
line 1367
;1357:}
;1358:
;1359:
;1360:/*
;1361:===================
;1362:Info_NextPair
;1363:
;1364:Used to itterate through all the key/value pairs in an info string
;1365:===================
;1366:*/
;1367:void Info_NextPair( const char **head, char *key, char *value ) {
line 1371
;1368:	char	*o;
;1369:	const char	*s;
;1370:
;1371:	s = *head;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 1373
;1372:
;1373:	if ( *s == '\\' ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $521
line 1374
;1374:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1375
;1375:	}
LABELV $521
line 1376
;1376:	key[0] = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1377
;1377:	value[0] = 0;
ADDRFP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 1379
;1378:
;1379:	o = key;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $524
JUMPV
LABELV $523
line 1380
;1380:	while ( *s != '\\' ) {
line 1381
;1381:		if ( !*s ) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $526
line 1382
;1382:			*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1383
;1383:			*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1384
;1384:			return;
ADDRGP4 $520
JUMPV
LABELV $526
line 1386
;1385:		}
;1386:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1387
;1387:	}
LABELV $524
line 1380
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $523
line 1388
;1388:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1389
;1389:	s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1391
;1390:
;1391:	o = value;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $529
JUMPV
LABELV $528
line 1392
;1392:	while ( *s != '\\' && *s ) {
line 1393
;1393:		*o++ = *s++;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI1
ASGNI1
line 1394
;1394:	}
LABELV $529
line 1392
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 92
EQI4 $531
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $528
LABELV $531
line 1395
;1395:	*o = 0;
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1397
;1396:
;1397:	*head = s;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1398
;1398:}
LABELV $520
endproc Info_NextPair 20 0
export Info_RemoveKey
proc Info_RemoveKey 2076 12
line 1406
;1399:
;1400:
;1401:/*
;1402:===================
;1403:Info_RemoveKey
;1404:===================
;1405:*/
;1406:void Info_RemoveKey( char *s, const char *key ) {
line 1412
;1407:	char	*start;
;1408:	char	pkey[MAX_INFO_KEY];
;1409:	char	value[MAX_INFO_VALUE];
;1410:	char	*o;
;1411:
;1412:	if ( strlen( s ) >= MAX_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2056
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 2056
INDIRU4
CNSTU4 1024
LTU4 $533
line 1413
;1413:		Com_Error( ERR_DROP, "Info_RemoveKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $535
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1414
;1414:	}
LABELV $533
line 1416
;1415:
;1416:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 2060
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2060
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $539
line 1417
;1417:		return;
ADDRGP4 $532
JUMPV
LABELV $538
line 1421
;1418:	}
;1419:
;1420:	while (1)
;1421:	{
line 1422
;1422:		start = s;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
line 1423
;1423:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $541
line 1424
;1424:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $541
line 1425
;1425:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $544
JUMPV
LABELV $543
line 1427
;1426:		while (*s != '\\')
;1427:		{
line 1428
;1428:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $546
line 1429
;1429:				return;
ADDRGP4 $532
JUMPV
LABELV $546
line 1430
;1430:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1431
;1431:		}
LABELV $544
line 1426
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $543
line 1432
;1432:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1433
;1433:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1435
;1434:
;1435:		o = value;
ADDRLP4 0
ADDRLP4 1032
ASGNP4
ADDRGP4 $549
JUMPV
LABELV $548
line 1437
;1436:		while (*s != '\\' && *s)
;1437:		{
line 1438
;1438:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $551
line 1439
;1439:				return;
ADDRGP4 $532
JUMPV
LABELV $551
line 1440
;1440:			*o++ = *s++;
ADDRLP4 2064
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 2072
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 2068
INDIRP4
ADDRLP4 2072
INDIRI4
ADDP4
ASGNP4
ADDRLP4 2064
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI1
ASGNI1
line 1441
;1441:		}
LABELV $549
line 1436
ADDRLP4 2064
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 92
EQI4 $553
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $548
LABELV $553
line 1442
;1442:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1444
;1443:
;1444:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $554
line 1445
;1445:		{
line 1446
;1446:			memmove(start, s, strlen(s) + 1);	// remove this part
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2072
INDIRU4
CNSTU4 1
ADDU4
ARGU4
ADDRGP4 memmove
CALLP4
pop
line 1447
;1447:			return;
ADDRGP4 $532
JUMPV
LABELV $554
line 1450
;1448:		}
;1449:
;1450:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $556
line 1451
;1451:			return;
ADDRGP4 $532
JUMPV
LABELV $556
line 1452
;1452:	}
LABELV $539
line 1420
ADDRGP4 $538
JUMPV
line 1454
;1453:
;1454:}
LABELV $532
endproc Info_RemoveKey 2076 12
export Info_RemoveKey_Big
proc Info_RemoveKey_Big 16412 12
line 1461
;1455:
;1456:/*
;1457:===================
;1458:Info_RemoveKey_Big
;1459:===================
;1460:*/
;1461:void Info_RemoveKey_Big( char *s, const char *key ) {
line 1467
;1462:	char	*start;
;1463:	char	pkey[BIG_INFO_KEY];
;1464:	char	value[BIG_INFO_VALUE];
;1465:	char	*o;
;1466:
;1467:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16392
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 16392
INDIRU4
CNSTU4 8192
LTU4 $559
line 1468
;1468:		Com_Error( ERR_DROP, "Info_RemoveKey_Big: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $561
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1469
;1469:	}
LABELV $559
line 1471
;1470:
;1471:	if (strchr (key, '\\')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 16396
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 16396
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $565
line 1472
;1472:		return;
ADDRGP4 $558
JUMPV
LABELV $564
line 1476
;1473:	}
;1474:
;1475:	while (1)
;1476:	{
line 1477
;1477:		start = s;
ADDRLP4 8196
ADDRFP4 0
INDIRP4
ASGNP4
line 1478
;1478:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $567
line 1479
;1479:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $567
line 1480
;1480:		o = pkey;
ADDRLP4 0
ADDRLP4 4
ASGNP4
ADDRGP4 $570
JUMPV
LABELV $569
line 1482
;1481:		while (*s != '\\')
;1482:		{
line 1483
;1483:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $572
line 1484
;1484:				return;
ADDRGP4 $558
JUMPV
LABELV $572
line 1485
;1485:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1486
;1486:		}
LABELV $570
line 1481
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $569
line 1487
;1487:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1488
;1488:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1490
;1489:
;1490:		o = value;
ADDRLP4 0
ADDRLP4 8200
ASGNP4
ADDRGP4 $575
JUMPV
LABELV $574
line 1492
;1491:		while (*s != '\\' && *s)
;1492:		{
line 1493
;1493:			if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $577
line 1494
;1494:				return;
ADDRGP4 $558
JUMPV
LABELV $577
line 1495
;1495:			*o++ = *s++;
ADDRLP4 16400
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16408
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16400
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16404
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 16404
INDIRP4
ADDRLP4 16408
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16400
INDIRP4
ADDRLP4 16404
INDIRP4
INDIRI1
ASGNI1
line 1496
;1496:		}
LABELV $575
line 1491
ADDRLP4 16400
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16400
INDIRI4
CNSTI4 92
EQI4 $579
ADDRLP4 16400
INDIRI4
CNSTI4 0
NEI4 $574
LABELV $579
line 1497
;1497:		*o = 0;
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1499
;1498:
;1499:		if (!strcmp (key, pkey) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16404
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16404
INDIRI4
CNSTI4 0
NEI4 $580
line 1500
;1500:		{
line 1501
;1501:			memmove(start, s, strlen(s) + 1);	// remove this part
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16408
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 8196
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16408
INDIRU4
CNSTU4 1
ADDU4
ARGU4
ADDRGP4 memmove
CALLP4
pop
line 1502
;1502:			return;
ADDRGP4 $558
JUMPV
LABELV $580
line 1505
;1503:		}
;1504:
;1505:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $582
line 1506
;1506:			return;
ADDRGP4 $558
JUMPV
LABELV $582
line 1507
;1507:	}
LABELV $565
line 1475
ADDRGP4 $564
JUMPV
line 1509
;1508:
;1509:}
LABELV $558
endproc Info_RemoveKey_Big 16412 12
export Info_Validate
proc Info_Validate 8 8
line 1522
;1510:
;1511:
;1512:
;1513:
;1514:/*
;1515:==================
;1516:Info_Validate
;1517:
;1518:Some characters are illegal in info strings because they
;1519:can mess up the server's parsing
;1520:==================
;1521:*/
;1522:qboolean Info_Validate( const char *s ) {
line 1523
;1523:	if ( strchr( s, '\"' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 0
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $585
line 1524
;1524:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $584
JUMPV
LABELV $585
line 1526
;1525:	}
;1526:	if ( strchr( s, ';' ) ) {
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $587
line 1527
;1527:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $584
JUMPV
LABELV $587
line 1529
;1528:	}
;1529:	return qtrue;
CNSTI4 1
RETI4
LABELV $584
endproc Info_Validate 8 8
export Info_SetValueForKey
proc Info_SetValueForKey 1100 20
line 1539
;1530:}
;1531:
;1532:/*
;1533:==================
;1534:Info_SetValueForKey
;1535:
;1536:Changes or adds a key/value pair
;1537:==================
;1538:*/
;1539:void Info_SetValueForKey( char *s, const char *key, const char *value ) {
line 1543
;1540:	char	newi[MAX_INFO_STRING];
;1541:	int		newlen,oldlen;
;1542:
;1543:	oldlen = strlen(s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 1024
ADDRLP4 1032
INDIRU4
CVUI4 4
ASGNI4
line 1544
;1544:	if (oldlen >= MAX_INFO_STRING ) {
ADDRLP4 1024
INDIRI4
CNSTI4 1024
LTI4 $590
line 1545
;1545:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $592
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1546
;1546:	}
LABELV $590
line 1548
;1547:
;1548:	if (strchr (key, '\\') || strchr (value, '\\'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $595
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 1040
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $593
LABELV $595
line 1549
;1549:	{
line 1550
;1550:		Com_Printf ("Can't use keys or values with a \\\n");
ADDRGP4 $596
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1551
;1551:		return;
ADDRGP4 $589
JUMPV
LABELV $593
line 1554
;1552:	}
;1553:
;1554:	if (strchr (key, ';') || strchr (value, ';'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1044
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $599
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1048
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $597
LABELV $599
line 1555
;1555:	{
line 1556
;1556:		Com_Printf ("Can't use keys or values with a semicolon\n");
ADDRGP4 $600
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1557
;1557:		return;
ADDRGP4 $589
JUMPV
LABELV $597
line 1560
;1558:	}
;1559:
;1560:	if (strchr (key, '\"') || strchr (value, '\"'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1052
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $603
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1056
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1056
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $601
LABELV $603
line 1561
;1561:	{
line 1562
;1562:		Com_Printf ("Can't use keys or values with a \"\n");
ADDRGP4 $604
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1563
;1563:		return;
ADDRGP4 $589
JUMPV
LABELV $601
line 1566
;1564:	}
;1565:
;1566:	Info_RemoveKey (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey
CALLV
pop
line 1567
;1567:	if (!value || !strlen(value))
ADDRLP4 1060
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $607
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 1064
INDIRU4
CNSTU4 0
NEU4 $605
LABELV $607
line 1568
;1568:		return;
ADDRGP4 $589
JUMPV
LABELV $605
line 1570
;1569:
;1570:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $608
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1572
;1571:
;1572:	if (strlen(newi) + strlen(s) > MAX_INFO_STRING)
ADDRLP4 0
ARGP4
ADDRLP4 1068
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 1068
INDIRU4
ADDRLP4 1072
INDIRU4
ADDU4
CNSTU4 1024
LEU4 $609
line 1573
;1573:	{
line 1574
;1574:		Com_Printf ("Info string length exceeded\n");
ADDRGP4 $611
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1575
;1575:		return;
ADDRGP4 $589
JUMPV
LABELV $609
line 1578
;1576:	}
;1577:
;1578:	Q_strcat (newi, sizeof(newi), s);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1579
;1579:	newlen = strlen(newi);
ADDRLP4 0
ARGP4
ADDRLP4 1076
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 1028
ADDRLP4 1076
INDIRU4
CVUI4 4
ASGNI4
line 1580
;1580:	Q_strncpyz (s, newi, MIN(MAX(oldlen+1, newlen+1),MAX_INFO_STRING)); // this feels dangerous. what if the user doesn't respect this. but tons of places this would need to be changed TODO
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1092
CNSTI4 1
ASGNI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1092
INDIRI4
ADDI4
ADDRLP4 1028
INDIRI4
ADDRLP4 1092
INDIRI4
ADDI4
LEI4 $617
ADDRLP4 1084
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $618
JUMPV
LABELV $617
ADDRLP4 1084
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $618
ADDRLP4 1084
INDIRI4
CNSTI4 1024
GEI4 $615
ADDRLP4 1096
CNSTI4 1
ASGNI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1096
INDIRI4
ADDI4
ADDRLP4 1028
INDIRI4
ADDRLP4 1096
INDIRI4
ADDI4
LEI4 $619
ADDRLP4 1088
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $620
JUMPV
LABELV $619
ADDRLP4 1088
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $620
ADDRLP4 1080
ADDRLP4 1088
INDIRI4
ASGNI4
ADDRGP4 $616
JUMPV
LABELV $615
ADDRLP4 1080
CNSTI4 1024
ASGNI4
LABELV $616
ADDRLP4 1080
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1582
;1581:	// DEFINITELY fix this. not doing the MIN(a,b) here results in disaster cause this function is SADLY called on shorter strings than MAX_INFO_STRING. DEFINITELY fix soon. provide size param.
;1582:}
LABELV $589
endproc Info_SetValueForKey 1100 20
export Info_SetValueForKey_Big
proc Info_SetValueForKey_Big 8236 20
line 1591
;1583:
;1584:/*
;1585:==================
;1586:Info_SetValueForKey_Big
;1587:
;1588:Changes or adds a key/value pair
;1589:==================
;1590:*/
;1591:void Info_SetValueForKey_Big( char *s, const char *key, const char *value ) {
line 1594
;1592:	char	newi[BIG_INFO_STRING];
;1593:
;1594:	if ( strlen( s ) >= BIG_INFO_STRING ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8192
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 8192
INDIRU4
CNSTU4 8192
LTU4 $622
line 1595
;1595:		Com_Error( ERR_DROP, "Info_SetValueForKey: oversize infostring" );
CNSTI4 1
ARGI4
ADDRGP4 $592
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1596
;1596:	}
LABELV $622
line 1598
;1597:
;1598:	if (strchr (key, '\\') || strchr (value, '\\'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 8196
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8196
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $626
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 92
ARGI4
ADDRLP4 8200
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $624
LABELV $626
line 1599
;1599:	{
line 1600
;1600:		Com_Printf ("Can't use keys or values with a \\\n");
ADDRGP4 $596
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1601
;1601:		return;
ADDRGP4 $621
JUMPV
LABELV $624
line 1604
;1602:	}
;1603:
;1604:	if (strchr (key, ';') || strchr (value, ';'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 8204
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $629
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 8208
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $627
LABELV $629
line 1605
;1605:	{
line 1606
;1606:		Com_Printf ("Can't use keys or values with a semicolon\n");
ADDRGP4 $600
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1607
;1607:		return;
ADDRGP4 $621
JUMPV
LABELV $627
line 1610
;1608:	}
;1609:
;1610:	if (strchr (key, '\"') || strchr (value, '\"'))
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 8212
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8212
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $632
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 8216
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8216
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $630
LABELV $632
line 1611
;1611:	{
line 1612
;1612:		Com_Printf ("Can't use keys or values with a \"\n");
ADDRGP4 $604
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1613
;1613:		return;
ADDRGP4 $621
JUMPV
LABELV $630
line 1616
;1614:	}
;1615:
;1616:	Info_RemoveKey_Big (s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Info_RemoveKey_Big
CALLV
pop
line 1617
;1617:	if (!value || !strlen(value))
ADDRLP4 8220
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8220
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $635
ADDRLP4 8220
INDIRP4
ARGP4
ADDRLP4 8224
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 8224
INDIRU4
CNSTU4 0
NEU4 $633
LABELV $635
line 1618
;1618:		return;
ADDRGP4 $621
JUMPV
LABELV $633
line 1620
;1619:
;1620:	Com_sprintf (newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 0
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 $608
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1622
;1621:
;1622:	if (strlen(newi) + strlen(s) > BIG_INFO_STRING)
ADDRLP4 0
ARGP4
ADDRLP4 8228
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8232
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 8228
INDIRU4
ADDRLP4 8232
INDIRU4
ADDU4
CNSTU4 8192
LEU4 $636
line 1623
;1623:	{
line 1624
;1624:		Com_Printf ("BIG Info string length exceeded\n");
ADDRGP4 $638
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1625
;1625:		return;
ADDRGP4 $621
JUMPV
LABELV $636
line 1628
;1626:	}
;1627:
;1628:	Q_strcat (s, BIG_INFO_STRING, newi);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8192
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1629
;1629:}
LABELV $621
endproc Info_SetValueForKey_Big 8236 20
export Q_irand
proc Q_irand 8 0
line 1634
;1630:
;1631:
;1632://rww - convience function..
;1633:int Q_irand(int value1, int value2, qboolean useDefault, int defaultValue)
;1634:{
line 1643
;1635:	int r;
;1636:
;1637://#ifdef DEBUG
;1638://	// find bad calls: rand\s*\([^,]+,\s*([^,\s]+)\s*,[^,]+,\s*\1\s*\)
;1639://	if (defaultValue >= value2 || defaultValue < value1) {
;1640://		Com_Printf("Q_irand(%d,%d,%d,%d), bad call", value1, value2, useDefault, defaultValue);
;1641://	}
;1642://#endif
;1643:	if (useDefault) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $640
line 1644
;1644:		return defaultValue;
ADDRFP4 12
INDIRI4
RETI4
ADDRGP4 $639
JUMPV
LABELV $640
line 1647
;1645:	}
;1646:
;1647:	r = rand()%value2;
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
MODI4
ASGNI4
line 1648
;1648:	r += value1;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 1650
;1649:	
;1650:	return r;
ADDRLP4 0
INDIRI4
RETI4
LABELV $639
endproc Q_irand 8 0
export Q_irandExpectedIf
proc Q_irandExpectedIf 8 0
line 1654
;1651:}
;1652://rww - convience function..
;1653:int Q_irandExpectedIf(qboolean expected, int value1, int value2, qboolean useDefault, int defaultValue)
;1654:{
line 1663
;1655:	int r;
;1656:
;1657://#ifdef DEBUG
;1658://	// find bad calls: rand\s*\([^,]+,\s*([^,\s]+)\s*,[^,]+,\s*\1\s*\)
;1659://	if (defaultValue >= value2 || defaultValue < value1) {
;1660://		Com_Printf("Q_irand(%d,%d,%d,%d), bad call", value1, value2, useDefault, defaultValue);
;1661://	}
;1662://#endif
;1663:	if (useDefault) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $643
line 1664
;1664:		return defaultValue;
ADDRFP4 16
INDIRI4
RETI4
ADDRGP4 $642
JUMPV
LABELV $643
line 1667
;1665:	}
;1666:
;1667:	if (expected) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $645
line 1672
;1668:		// e.g.:
;1669:		// 100, 500: then value2 becomes 401, so addvalue becomes 0 to 400, so 100 + up to 400 = es expected
;1670:		// -300, 300: then value2 becomes 601, so addvalue becomes 0 to 600, so -300 + up to 600 = es expected
;1671:		// proof that this was their intent? check WP_SabersCheckLock2 dev comment where Q_irand was used. called with 1000,3000 and comment states 1-3 seconds
;1672:		value2 += 1 - value1;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 1673
;1673:	}
LABELV $645
line 1675
;1674:
;1675:	r = rand()%value2;
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
MODI4
ASGNI4
line 1676
;1676:	r += value1;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 1678
;1677:	
;1678:	return r;
ADDRLP4 0
INDIRI4
RETI4
LABELV $642
endproc Q_irandExpectedIf 8 0
export sanitizeFilename
proc sanitizeFilename 48 0
line 1685
;1679:}
;1680:
;1681://====================================================================
;1682:
;1683:
;1684:
;1685:void sanitizeFilename(const char* input, char* output, qboolean allowExtension) {
line 1687
;1686:
;1687:	char* lastDot = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1688
;1688:	const char* inputStart = input;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $649
JUMPV
LABELV $648
line 1689
;1689:	while (*input) {
line 1690
;1690:		if (*input == '.' && input != inputStart) { // Even tho we allow extensions (dots), we don't allow the dot at the start of the filename.
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $651
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $651
line 1691
;1691:			lastDot = output;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 1692
;1692:		}
LABELV $651
line 1694
;1693:		// stuff below 32 is special chars
;1694:		if ((*input == 32) // Don't allow ! exclamation mark. Linux doesn't like that. " is also blocked
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 32
EQI4 $669
ADDRLP4 12
INDIRI4
CNSTI4 35
LTI4 $657
ADDRLP4 12
INDIRI4
CNSTI4 42
LTI4 $669
LABELV $657
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 43
LTI4 $659
ADDRLP4 16
INDIRI4
CNSTI4 46
LTI4 $669
LABELV $659
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 48
LTI4 $661
ADDRLP4 20
INDIRI4
CNSTI4 58
LTI4 $669
LABELV $661
ADDRLP4 24
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 59
LTI4 $663
ADDRLP4 24
INDIRI4
CNSTI4 60
LTI4 $669
LABELV $663
ADDRLP4 28
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 61
EQI4 $669
ADDRLP4 28
INDIRI4
CNSTI4 64
LTI4 $666
ADDRLP4 28
INDIRI4
CNSTI4 92
LTI4 $669
LABELV $666
ADDRLP4 32
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 93
LTI4 $668
ADDRLP4 32
INDIRI4
CNSTI4 96
LTI4 $669
LABELV $668
ADDRLP4 36
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 97
LTI4 $670
ADDRLP4 36
INDIRI4
CNSTI4 124
LTI4 $669
LABELV $670
ADDRLP4 40
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 125
LTI4 $653
ADDRLP4 40
INDIRI4
CNSTI4 127
GEI4 $653
LABELV $669
line 1704
;1695:			|| (*input >= 35 && *input < 42) // block *
;1696:			|| (*input >= 43 && *input < 46) // block . /
;1697:			|| (*input >= 48 && *input < 58) // block :
;1698:			|| (*input >= 59 && *input < 60) // block <
;1699:			|| (*input == 61) // block > ?
;1700:			|| (*input >= 64 && *input < 92) // block backslash (\)
;1701:			|| (*input >= 93 && *input < 96) // Don't allow `. Linux doesn't like that either, at least not in shell scripts.
;1702:			|| (*input >= 97 && *input < 124) // block |
;1703:			|| (*input >= 125 && *input < 127)
;1704:			) {
line 1705
;1705:			*output++ = *input;
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRFP4 0
INDIRP4
INDIRI1
ASGNI1
line 1706
;1706:		}
ADDRGP4 $654
JUMPV
LABELV $653
line 1707
;1707:		else if (*input == '|') {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 124
NEI4 $671
line 1708
;1708:			*output++ = 'I';
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI1 73
ASGNI1
line 1709
;1709:		}
ADDRGP4 $672
JUMPV
LABELV $671
line 1710
;1710:		else {
line 1711
;1711:			*output++ = '-';
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 44
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI1 45
ASGNI1
line 1712
;1712:		}
LABELV $672
LABELV $654
line 1713
;1713:		input++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1714
;1714:	}
LABELV $649
line 1689
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $648
line 1715
;1715:	*output = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1717
;1716:
;1717:	if (allowExtension && lastDot) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $673
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $673
line 1718
;1718:		*lastDot = '.';
ADDRLP4 4
INDIRP4
CNSTI1 46
ASGNI1
line 1719
;1719:	}
LABELV $673
line 1720
;1720:}
LABELV $647
endproc sanitizeFilename 48 0
export safeatoi
proc safeatoi 68 0
line 1771
;1721:
;1722:
;1723:/*
;1724:==================
;1725:safeatoi
;1726:==================
;1727:This is a slightly adapted version of strtol from newlib,
;1728:specifically for 32 bit integers, so we can use it for cvar conversion.
;1729:If someone enters 9999999999999999, we want that to be a positive number in the end, not wrap around and cause extremely weird behavior
;1730:
;1731:*/
;1732:/*-
;1733: * Copyright (c) 1990 The Regents of the University of California.
;1734: * All rights reserved.
;1735: *
;1736: * Redistribution and use in source and binary forms, with or without
;1737: * modification, are permitted provided that the following conditions
;1738: * are met:
;1739: * 1. Redistributions of source code must retain the above copyright
;1740: *    notice, this list of conditions and the following disclaimer.
;1741: * 2. Redistributions in binary form must reproduce the above copyright
;1742: *    notice, this list of conditions and the following disclaimer in the
;1743: *    documentation and/or other materials provided with the distribution.
;1744: * 3. All advertising materials mentioning features or use of this software
;1745: *    must display the following acknowledgement:
;1746: *	This product includes software developed by the University of
;1747: *	California, Berkeley and its contributors.
;1748: * 4. Neither the name of the University nor the names of its contributors
;1749: *    may be used to endorse or promote products derived from this software
;1750: *    without specific prior written permission.
;1751: *
;1752: * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
;1753: * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;1754: * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;1755: * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
;1756: * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;1757: * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
;1758: * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
;1759: * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
;1760: * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
;1761: * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
;1762: * SUCH DAMAGE.
;1763: */
;1764: /*
;1765:  * Convert a string to a long integer.
;1766:  *
;1767:  * Ignores `locale' stuff.  Assumes that the upper and lower case
;1768:  * alphabets and digits are each contiguous.
;1769:  */
;1770:int safeatoi(const char* nptr, char** endptr, int base, int* error)
;1771:{
line 1772
;1772:	const unsigned char* s = (const unsigned char*)nptr;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 1776
;1773:	unsigned int acc;
;1774:	int c;
;1775:	unsigned int cutoff;
;1776:	int neg = 0, any, cutlim;
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $676
line 1783
;1777:
;1778:	/*
;1779:	 * Skip white space and pick up leading +/- sign if any.
;1780:	 * If base is 0, allow 0x for hex and 0 for octal, else
;1781:	 * assume decimal; if base is already 16, allow 0x.
;1782:	 */
;1783:	do {
line 1784
;1784:		c = *s++;
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRU1
CVUI4 1
ASGNI4
line 1785
;1785:	} while (c == ' ');
LABELV $677
ADDRLP4 0
INDIRI4
CNSTI4 32
EQI4 $676
line 1786
;1786:	if (c == '-') {
ADDRLP4 0
INDIRI4
CNSTI4 45
NEI4 $679
line 1787
;1787:		neg = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 1788
;1788:		c = *s++;
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRU1
CVUI4 1
ASGNI4
line 1789
;1789:	}
ADDRGP4 $680
JUMPV
LABELV $679
line 1790
;1790:	else if (c == '+')
ADDRLP4 0
INDIRI4
CNSTI4 43
NEI4 $681
line 1791
;1791:		c = *s++;
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRU1
CVUI4 1
ASGNI4
LABELV $681
LABELV $680
line 1792
;1792:	if ((base == 0 || base == 16) &&
ADDRLP4 32
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $685
ADDRLP4 32
INDIRI4
CNSTI4 16
NEI4 $683
LABELV $685
ADDRLP4 0
INDIRI4
CNSTI4 48
NEI4 $683
ADDRLP4 36
ADDRLP4 8
INDIRP4
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 120
EQI4 $686
ADDRLP4 36
INDIRI4
CNSTI4 88
NEI4 $683
LABELV $686
line 1793
;1793:		c == '0' && (*s == 'x' || *s == 'X')) {
line 1794
;1794:		c = s[1];
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 1795
;1795:		s += 2;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 1796
;1796:		base = 16;
ADDRFP4 8
CNSTI4 16
ASGNI4
line 1797
;1797:	}
LABELV $683
line 1798
;1798:	if (base == 0)
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $687
line 1799
;1799:		base = c == '0' ? 8 : 10;
ADDRLP4 0
INDIRI4
CNSTI4 48
NEI4 $690
ADDRLP4 40
CNSTI4 8
ASGNI4
ADDRGP4 $691
JUMPV
LABELV $690
ADDRLP4 40
CNSTI4 10
ASGNI4
LABELV $691
ADDRFP4 8
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $687
line 1819
;1800:
;1801:	/*
;1802:	 * Compute the cutoff value between legal numbers and illegal
;1803:	 * numbers.  That is the largest legal value, divided by the
;1804:	 * base.  An input number that is greater than this value, if
;1805:	 * followed by a legal input character, is too big.  One that
;1806:	 * is equal to this value may be valid or not; the limit
;1807:	 * between valid and invalid numbers is then based on the last
;1808:	 * digit.  For instance, if the range for longs is
;1809:	 * [-2147483648..2147483647] and the input base is 10,
;1810:	 * cutoff will be set to 214748364 and cutlim to either
;1811:	 * 7 (neg==0) or 8 (neg==1), meaning that if we have accumulated
;1812:	 * a value > 214748364, or equal but the next digit is > 7 (or 8),
;1813:	 * the number is too big, and we will return a range error.
;1814:	 *
;1815:	 * Set any if any `digits' consumed; make it negative to indicate
;1816:	 * overflow.
;1817:	 */
;1818:	/* use explicit casts to silence unary minus on unsigned warnings while preserving logic */
;1819:	cutoff = neg ? (unsigned int)(0u - (unsigned int)INT_MIN) : (unsigned int)INT_MAX;
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $693
ADDRLP4 44
CNSTU4 2147483648
ASGNU4
ADDRGP4 $694
JUMPV
LABELV $693
ADDRLP4 44
CNSTU4 2147483647
ASGNU4
LABELV $694
ADDRLP4 12
ADDRLP4 44
INDIRU4
ASGNU4
line 1820
;1820:	cutlim = cutoff % (unsigned int)base;
ADDRLP4 20
ADDRLP4 12
INDIRU4
ADDRFP4 8
INDIRI4
CVIU4 4
MODU4
CVUI4 4
ASGNI4
line 1821
;1821:	cutoff /= (unsigned int)base;
ADDRLP4 12
ADDRLP4 12
INDIRU4
ADDRFP4 8
INDIRI4
CVIU4 4
DIVU4
ASGNU4
line 1822
;1822:	for (acc = 0, any = 0;; c = *s++) {
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $695
line 1823
;1823:		if (c >= '0' && c <= '9')
ADDRLP4 0
INDIRI4
CNSTI4 48
LTI4 $699
ADDRLP4 0
INDIRI4
CNSTI4 57
GTI4 $699
line 1824
;1824:			c -= '0';
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 48
SUBI4
ASGNI4
ADDRGP4 $700
JUMPV
LABELV $699
line 1825
;1825:		else if (c >= 'A' && c <= 'Z')
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $701
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $701
line 1826
;1826:			c -= 'A' - 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 55
SUBI4
ASGNI4
ADDRGP4 $702
JUMPV
LABELV $701
line 1827
;1827:		else if (c >= 'a' && c <= 'z')
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $697
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $697
line 1828
;1828:			c -= 'a' - 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 87
SUBI4
ASGNI4
line 1830
;1829:		else
;1830:			break;
LABELV $704
LABELV $702
LABELV $700
line 1831
;1831:		if (c >= base)
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $705
line 1832
;1832:			break;
ADDRGP4 $697
JUMPV
LABELV $705
line 1833
;1833:		if (any < 0 || acc > cutoff || (acc == cutoff && c > cutlim))
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $710
ADDRLP4 4
INDIRU4
ADDRLP4 12
INDIRU4
GTU4 $710
ADDRLP4 4
INDIRU4
ADDRLP4 12
INDIRU4
NEU4 $707
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LEI4 $707
LABELV $710
line 1834
;1834:			any = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
ADDRGP4 $708
JUMPV
LABELV $707
line 1835
;1835:		else {
line 1836
;1836:			any = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 1837
;1837:			acc *= base;
ADDRLP4 4
ADDRLP4 4
INDIRU4
ADDRFP4 8
INDIRI4
CVIU4 4
MULU4
ASGNU4
line 1838
;1838:			acc += c;
ADDRLP4 4
ADDRLP4 4
INDIRU4
ADDRLP4 0
INDIRI4
CVIU4 4
ADDU4
ASGNU4
line 1839
;1839:		}
LABELV $708
line 1840
;1840:	}
LABELV $696
line 1822
ADDRLP4 48
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 48
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
INDIRU1
CVUI4 1
ASGNI4
ADDRGP4 $695
JUMPV
LABELV $697
line 1841
;1841:	if (any < 0) {
ADDRLP4 16
INDIRI4
CNSTI4 0
GEI4 $711
line 1842
;1842:		acc = neg ? INT_MIN : INT_MAX;
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $714
ADDRLP4 52
CNSTI4 -2147483648
ASGNI4
ADDRGP4 $715
JUMPV
LABELV $714
ADDRLP4 52
CNSTI4 2147483647
ASGNI4
LABELV $715
ADDRLP4 4
ADDRLP4 52
INDIRI4
CVIU4 4
ASGNU4
line 1843
;1843:		*error = ERANGE;
ADDRFP4 12
INDIRP4
CNSTI4 34
ASGNI4
line 1844
;1844:	}
ADDRGP4 $712
JUMPV
LABELV $711
line 1845
;1845:	else if (neg) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $716
line 1847
;1846:		/* avoid unary minus on unsigned warning (acc is unsigned int) */
;1847:		acc = (unsigned int)(0u - acc);
ADDRLP4 4
CNSTU4 0
ADDRLP4 4
INDIRU4
SUBU4
ASGNU4
line 1848
;1848:	}
LABELV $716
LABELV $712
line 1849
;1849:	if (endptr != 0)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $718
line 1850
;1850:		*endptr = (char*)(any ? (char*)s - 1 : nptr);
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $721
ADDRLP4 52
ADDRLP4 8
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $722
JUMPV
LABELV $721
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
LABELV $722
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRP4
ASGNP4
LABELV $718
line 1851
;1851:	return (acc);
ADDRLP4 4
INDIRU4
CVUI4 4
RETI4
LABELV $675
endproc safeatoi 68 0
lit
align 1
LABELV $724
byte 1 48
byte 1 49
byte 1 50
byte 1 51
byte 1 52
byte 1 53
byte 1 54
byte 1 55
byte 1 56
byte 1 57
byte 1 65
byte 1 66
byte 1 67
byte 1 68
byte 1 69
byte 1 70
data
align 1
LABELV $725
byte 1 0
skip 8
export colorToHex
code
proc colorToHex 16 0
line 1854
;1852:}
;1853:
;1854:const char* colorToHex(byte color[4]){
line 1858
;1855:	int i,a,b;
;1856:	static const char hexChars[16] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
;1857:	static char hex[9] = {0};
;1858:	char* s = hex;
ADDRLP4 4
ADDRGP4 $725
ASGNP4
line 1859
;1859:	for(i=0;i<4;i++){
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $726
line 1860
;1860:		a= color[i] % 16;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRU1
CVUI4 1
CNSTI4 16
MODI4
ASGNI4
line 1861
;1861:		b= color[i] / 16;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRU1
CVUI4 1
CNSTI4 16
DIVI4
ASGNI4
line 1862
;1862:		*s = hexChars[b];
ADDRLP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDRGP4 $724
ADDP4
INDIRI1
ASGNI1
line 1863
;1863:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1864
;1864:		*s = hexChars[a];
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDRGP4 $724
ADDP4
INDIRI1
ASGNI1
line 1865
;1865:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1866
;1866:	}
LABELV $727
line 1859
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $726
line 1867
;1867:	hex[8] = '\0';
ADDRGP4 $725+8
CNSTI1 0
ASGNI1
line 1868
;1868:	return hex;
ADDRGP4 $725
RETP4
LABELV $723
endproc colorToHex 16 0
export parseHex
proc parseHex 68 4
line 1873
;1869:}
;1870:
;1871:#define HEXTOVALUE(a) ((a) >= '0' && (a)<='9') ? ((a)-'0') : (((a) >= 'A' && (a)<='F') ? (a)-'A'+10 : 15);  
;1872:
;1873:qboolean parseHex(const char hex[9], byte outColor[4]){
line 1875
;1874:	int i,a,b;
;1875:	int len = strlen(hex);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 20
ADDRLP4 24
INDIRU4
CVUI4 4
ASGNI4
line 1876
;1876:	int pairs = len/2;
ADDRLP4 16
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1877
;1877:	const char* pair= NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 1878
;1878:	if(pairs != 4){
ADDRLP4 16
INDIRI4
CNSTI4 4
EQI4 $732
line 1879
;1879:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $731
JUMPV
LABELV $732
line 1881
;1880:	}
;1881:	for(i=0;i<pairs;i++){
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $737
JUMPV
LABELV $734
line 1882
;1882:		pair = hex+i*2;
ADDRLP4 12
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
line 1883
;1883:		a = toupper(pair[0]);
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 28
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 1884
;1884:		b = toupper(pair[1]);
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 32
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 1885
;1885:		a = HEXTOVALUE(a);
ADDRLP4 0
INDIRI4
CNSTI4 48
LTI4 $740
ADDRLP4 0
INDIRI4
CNSTI4 57
GTI4 $740
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 48
SUBI4
ASGNI4
ADDRGP4 $741
JUMPV
LABELV $740
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $742
ADDRLP4 0
INDIRI4
CNSTI4 70
GTI4 $742
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 65
SUBI4
CNSTI4 10
ADDI4
ASGNI4
ADDRGP4 $743
JUMPV
LABELV $742
ADDRLP4 40
CNSTI4 15
ASGNI4
LABELV $743
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $741
ADDRLP4 0
ADDRLP4 36
INDIRI4
ASGNI4
line 1886
;1886:		b = HEXTOVALUE(b);
ADDRLP4 4
INDIRI4
CNSTI4 48
LTI4 $746
ADDRLP4 4
INDIRI4
CNSTI4 57
GTI4 $746
ADDRLP4 52
ADDRLP4 4
INDIRI4
CNSTI4 48
SUBI4
ASGNI4
ADDRGP4 $747
JUMPV
LABELV $746
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $748
ADDRLP4 4
INDIRI4
CNSTI4 70
GTI4 $748
ADDRLP4 56
ADDRLP4 4
INDIRI4
CNSTI4 65
SUBI4
CNSTI4 10
ADDI4
ASGNI4
ADDRGP4 $749
JUMPV
LABELV $748
ADDRLP4 56
CNSTI4 15
ASGNI4
LABELV $749
ADDRLP4 52
ADDRLP4 56
INDIRI4
ASGNI4
LABELV $747
ADDRLP4 4
ADDRLP4 52
INDIRI4
ASGNI4
line 1887
;1887:		outColor[i] = a*16+b;
ADDRLP4 8
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 4
INDIRI4
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
line 1888
;1888:	}
LABELV $735
line 1881
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $737
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $734
line 1889
;1889:	return qtrue;
CNSTI4 1
RETI4
LABELV $731
endproc parseHex 68 4
bss
align 4
LABELV com_lines
skip 4
align 1
LABELV com_parsename
skip 1024
align 1
LABELV com_token
skip 1024
import clampedIntAdd
import clampedIntMult
import irand
import flrand
import Rand_Init
import Com_Printf
import Com_Error
import Info_RemoveKey_big
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
import bsearch
import copysignf
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
LABELV $638
byte 1 66
byte 1 73
byte 1 71
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
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
LABELV $611
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
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
LABELV $608
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $604
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $600
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 101
byte 1 109
byte 1 105
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $596
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 92
byte 1 10
byte 1 0
align 1
LABELV $592
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $561
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 75
byte 1 101
byte 1 121
byte 1 95
byte 1 66
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $535
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $501
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 72
byte 1 97
byte 1 115
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $475
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $461
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
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
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $458
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
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
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 105
byte 1 103
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $359
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $300
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 60
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $297
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 115
byte 1 114
byte 1 99
byte 1 0
align 1
LABELV $294
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $258
byte 1 41
byte 1 0
align 1
LABELV $253
byte 1 40
byte 1 0
align 1
LABELV $233
byte 1 77
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 33
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $216
byte 1 117
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
byte 1 69
byte 1 79
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $124
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $120
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $114
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $94
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
