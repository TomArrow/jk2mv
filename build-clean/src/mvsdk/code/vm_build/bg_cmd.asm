export BG_Cmd_Argc
code
proc BG_Cmd_Argc 0 0
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\bg_cmd.c"
line 17
;1:// vm version of the engine side command tokenization
;2:// kinda lame but i wanna examine chat for possible accidental login commands
;3:#include "../game/bg_cmd.h"
;4:
;5:static	int			cmd_argc;
;6:static	char* cmd_argv[MAX_STRING_TOKENS];		// points into cmd_tokenized
;7:static	char		cmd_tokenized[BIG_INFO_STRING + MAX_STRING_TOKENS];	// will have 0 bytes inserted
;8:// for auto-complete (copied from OpenJK)
;9:static	char		cmd_cmd[BIG_INFO_STRING]; // the original command we received (no token processing)
;10:
;11:
;12:/*
;13:============
;14:Cmd_Argc
;15:============
;16:*/
;17:int		BG_Cmd_Argc(void) {
line 18
;18:	return cmd_argc;
ADDRGP4 cmd_argc
INDIRI4
RETI4
LABELV $50
endproc BG_Cmd_Argc 0 0
export BG_Cmd_Argv
proc BG_Cmd_Argv 0 0
line 26
;19:}
;20:
;21:/*
;22:============
;23:Cmd_Argv
;24:============
;25:*/
;26:char* BG_Cmd_Argv(int arg) {
line 27
;27:	if ((unsigned)arg >= (unsigned)cmd_argc) {
ADDRFP4 0
INDIRI4
CVIU4 4
ADDRGP4 cmd_argc
INDIRI4
CVIU4 4
LTU4 $52
line 28
;28:		return "";
ADDRGP4 $54
RETP4
ADDRGP4 $51
JUMPV
LABELV $52
line 30
;29:	}
;30:	return cmd_argv[arg];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cmd_argv
ADDP4
INDIRP4
RETP4
LABELV $51
endproc BG_Cmd_Argv 0 0
bss
align 1
LABELV $56
skip 1024
export BG_Cmd_Args
code
proc BG_Cmd_Args 4 12
line 41
;31:}
;32:
;33:
;34:/*
;35:============
;36:Cmd_Args
;37:
;38:Returns a single string containing argv(1) to argv(argc()-1)
;39:============
;40:*/
;41:char* BG_Cmd_Args(void) {
line 45
;42:	static	char		cmd_args[MAX_STRING_CHARS];
;43:	int i;
;44:
;45:	cmd_args[0] = 0;
ADDRGP4 $56
CNSTI1 0
ASGNI1
line 46
;46:	for (i = 1; i < cmd_argc; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $60
JUMPV
LABELV $57
line 47
;47:		Q_strcat(cmd_args, sizeof(cmd_args), cmd_argv[i]);
ADDRGP4 $56
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cmd_argv
ADDP4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 48
;48:		if (i + 1 != cmd_argc) {
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRGP4 cmd_argc
INDIRI4
EQI4 $61
line 49
;49:			Q_strcat(cmd_args, sizeof(cmd_args), " ");
ADDRGP4 $56
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $63
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 50
;50:		}
LABELV $61
line 51
;51:	}
LABELV $58
line 46
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $60
ADDRLP4 0
INDIRI4
ADDRGP4 cmd_argc
INDIRI4
LTI4 $57
line 53
;52:
;53:	return cmd_args;
ADDRGP4 $56
RETP4
LABELV $55
endproc BG_Cmd_Args 4 12
bss
align 1
LABELV $65
skip 8192
export BG_Cmd_ArgsFrom
code
proc BG_Cmd_ArgsFrom 4 12
line 63
;54:}
;55:
;56:/*
;57:============
;58:Cmd_Args
;59:
;60:Returns a single string containing argv(arg) to argv(argc()-1)
;61:============
;62:*/
;63:char* BG_Cmd_ArgsFrom(int arg) {
line 67
;64:	static	char		cmd_args[BIG_INFO_STRING];
;65:	int i;
;66:
;67:	cmd_args[0] = 0;
ADDRGP4 $65
CNSTI1 0
ASGNI1
line 68
;68:	if (arg < 0)
ADDRFP4 0
INDIRI4
CNSTI4 0
GEI4 $66
line 69
;69:		arg = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
LABELV $66
line 70
;70:	for (i = arg; i < cmd_argc; i++) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $71
JUMPV
LABELV $68
line 71
;71:		Q_strcat(cmd_args, sizeof(cmd_args), cmd_argv[i]);
ADDRGP4 $65
ARGP4
CNSTI4 8192
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cmd_argv
ADDP4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 72
;72:		if (i + 1 != cmd_argc) {
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRGP4 cmd_argc
INDIRI4
EQI4 $72
line 73
;73:			Q_strcat(cmd_args, sizeof(cmd_args), " ");
ADDRGP4 $65
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 $63
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 74
;74:		}
LABELV $72
line 75
;75:	}
LABELV $69
line 70
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $71
ADDRLP4 0
INDIRI4
ADDRGP4 cmd_argc
INDIRI4
LTI4 $68
line 77
;76:
;77:	return cmd_args;
ADDRGP4 $65
RETP4
LABELV $64
endproc BG_Cmd_ArgsFrom 4 12
export BG_Cmd_Cmd
proc BG_Cmd_Cmd 0 0
line 80
;78:}
;79:
;80:const char* BG_Cmd_Cmd(void) {
line 81
;81:	return cmd_cmd;
ADDRGP4 cmd_cmd
RETP4
LABELV $74
endproc BG_Cmd_Cmd 0 0
export BG_Cmd_ArgsBuffer
proc BG_Cmd_ArgsBuffer 4 12
line 92
;82:}
;83:
;84:/*
;85:============
;86:Cmd_ArgsBuffer
;87:
;88:The interpreted versions use this because
;89:they can't have pointers returned to them
;90:============
;91:*/
;92:void	BG_Cmd_ArgsBuffer(char* buffer, int bufferLength) {
line 93
;93:	Q_strncpyz(buffer, BG_Cmd_Args(), bufferLength);
ADDRLP4 0
ADDRGP4 BG_Cmd_Args
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 94
;94:}
LABELV $75
endproc BG_Cmd_ArgsBuffer 4 12
export BG_Cmd_DropArg
proc BG_Cmd_DropArg 8 0
line 104
;95:
;96:/*
;97:============
;98:Cmd_DropArg
;99:
;100:Drop argument from tokenized command
;101:Doesn't update cmd_cmd
;102:============
;103:*/
;104:void	BG_Cmd_DropArg(int arg) {
line 105
;105:	if (0 <= arg && arg < cmd_argc) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
CNSTI4 0
ADDRLP4 0
INDIRI4
GTI4 $77
ADDRLP4 0
INDIRI4
ADDRGP4 cmd_argc
INDIRI4
GEI4 $77
line 106
;106:		for (; arg < cmd_argc - 1; arg++) {
ADDRGP4 $82
JUMPV
LABELV $79
line 107
;107:			cmd_argv[arg] = cmd_argv[arg + 1];
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 cmd_argv
ADDP4
ADDRLP4 4
INDIRI4
ADDRGP4 cmd_argv+4
ADDP4
INDIRP4
ASGNP4
line 108
;108:		}
LABELV $80
line 106
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $82
ADDRFP4 0
INDIRI4
ADDRGP4 cmd_argc
INDIRI4
CNSTI4 1
SUBI4
LTI4 $79
line 110
;109:
;110:		cmd_argc--;
ADDRLP4 4
ADDRGP4 cmd_argc
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 111
;111:	}
LABELV $77
line 112
;112:}
LABELV $76
endproc BG_Cmd_DropArg 8 0
proc BG_Cmd_TokenizeString2 36 12
line 129
;113:
;114:
;115:
;116:
;117:/*
;118:============
;119:Cmd_TokenizeString
;120:
;121:Parses the given string into command line tokens.
;122:The text is copied to a seperate buffer and 0 characters
;123:are inserted in the appropriate place, The argv array
;124:will point into this temporary buffer.
;125:============
;126:*/
;127:// NOTE TTimo define that to track tokenization issues
;128://#define TKN_DBG
;129:static void BG_Cmd_TokenizeString2(const char* text_in, qboolean ignoreQuotes) {
line 139
;130:	const char* text;
;131:	char* textOut;
;132:
;133:#ifdef TKN_DBG
;134:	// FIXME TTimo blunt hook to try to find the tokenization of userinfo
;135:	Com_DPrintf("Cmd_TokenizeString: %s\n", text_in);
;136:#endif
;137:
;138:	// clear previous args
;139:	cmd_argc = 0;
ADDRGP4 cmd_argc
CNSTI4 0
ASGNI4
line 141
;140:
;141:	if (!text_in) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $85
line 142
;142:		return;
ADDRGP4 $84
JUMPV
LABELV $85
line 145
;143:	}
;144:
;145:	Q_strncpyz(cmd_cmd, text_in, sizeof(cmd_cmd));
ADDRGP4 cmd_cmd
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 147
;146:
;147:	text = text_in;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 148
;148:	textOut = cmd_tokenized;
ADDRLP4 4
ADDRGP4 cmd_tokenized
ASGNP4
ADDRGP4 $88
JUMPV
LABELV $87
line 150
;149:
;150:	while (1) {
line 151
;151:		if (cmd_argc == MAX_STRING_TOKENS) {
ADDRGP4 cmd_argc
INDIRI4
CNSTI4 1024
NEI4 $93
line 152
;152:			return;			// this is usually something malicious
ADDRGP4 $84
JUMPV
line 155
;153:		}
;154:
;155:		while (1) {
LABELV $95
line 157
;156:			// skip whitespace
;157:			while (*text && *(const unsigned char* /*eurofix*/)text <= ' ') {
line 158
;158:				text++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 159
;159:			}
LABELV $96
line 157
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $98
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 32
LEI4 $95
LABELV $98
line 160
;160:			if (!*text) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $99
line 161
;161:				return;			// all tokens parsed
ADDRGP4 $84
JUMPV
LABELV $99
line 165
;162:			}
;163:
;164:			// skip // comments
;165:			if (text[0] == '/' && text[1] == '/') {
ADDRLP4 16
CNSTI4 47
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
NEI4 $101
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
NEI4 $101
line 166
;166:				return;			// all tokens parsed
ADDRGP4 $84
JUMPV
LABELV $101
line 170
;167:			}
;168:
;169:			// skip /* */ comments
;170:			if (text[0] == '/' && text[1] == '*') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $94
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $94
ADDRGP4 $106
JUMPV
LABELV $105
line 171
;171:				while (*text && (text[0] != '*' || text[1] != '/')) {
line 172
;172:					text++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 173
;173:				}
LABELV $106
line 171
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $108
ADDRLP4 28
INDIRI4
CNSTI4 42
NEI4 $105
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $105
LABELV $108
line 174
;174:				if (!*text) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $109
line 175
;175:					return;		// all tokens parsed
ADDRGP4 $84
JUMPV
LABELV $109
line 177
;176:				}
;177:				text += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 178
;178:			}
line 179
;179:			else {
line 180
;180:				break;			// we are ready to parse a token
LABELV $104
line 182
;181:			}
;182:		}
LABELV $93
line 155
ADDRGP4 $96
JUMPV
LABELV $94
line 186
;183:
;184:		// handle quoted strings
;185:	// NOTE TTimo this doesn't handle \" escaping
;186:		if (!ignoreQuotes && *text == '"') {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $111
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 34
NEI4 $111
line 187
;187:			cmd_argv[cmd_argc] = textOut;
ADDRGP4 cmd_argc
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cmd_argv
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 188
;188:			cmd_argc++;
ADDRLP4 8
ADDRGP4 cmd_argc
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 189
;189:			text++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $114
JUMPV
LABELV $113
line 190
;190:			while (*text && *text != '"') {
line 191
;191:				*textOut++ = *text++;
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ASGNP4
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI1
ASGNI1
line 192
;192:			}
LABELV $114
line 190
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $116
ADDRLP4 12
INDIRI4
CNSTI4 34
NEI4 $113
LABELV $116
line 193
;193:			*textOut++ = 0;
ADDRLP4 16
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI1 0
ASGNI1
line 194
;194:			if (!*text) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $117
line 195
;195:				return;		// all tokens parsed
ADDRGP4 $84
JUMPV
LABELV $117
line 197
;196:			}
;197:			text++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 198
;198:			continue;
ADDRGP4 $88
JUMPV
LABELV $111
line 202
;199:		}
;200:
;201:		// regular token
;202:		cmd_argv[cmd_argc] = textOut;
ADDRGP4 cmd_argc
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cmd_argv
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 203
;203:		cmd_argc++;
ADDRLP4 8
ADDRGP4 cmd_argc
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $120
JUMPV
LABELV $119
line 206
;204:
;205:		// skip until whitespace, quote, or command
;206:		while (*(const unsigned char* /*eurofix*/)text > ' ') {
line 207
;207:			if (!ignoreQuotes && text[0] == '"') {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $122
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 34
NEI4 $122
line 208
;208:				break;
ADDRGP4 $121
JUMPV
LABELV $122
line 211
;209:			}
;210:
;211:			if (text[0] == '/' && text[1] == '/') {
ADDRLP4 16
CNSTI4 47
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
NEI4 $124
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
NEI4 $124
line 212
;212:				break;
ADDRGP4 $121
JUMPV
LABELV $124
line 216
;213:			}
;214:
;215:			// skip /* */ comments
;216:			if (text[0] == '/' && text[1] == '*') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $126
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $126
line 217
;217:				break;
ADDRGP4 $121
JUMPV
LABELV $126
line 220
;218:			}
;219:
;220:			*textOut++ = *text++;
ADDRLP4 24
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI1
ASGNI1
line 221
;221:		}
LABELV $120
line 206
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 32
GTI4 $119
LABELV $121
line 223
;222:
;223:		*textOut++ = 0;
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
line 225
;224:
;225:		if (!*text) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $128
line 226
;226:			return;		// all tokens parsed
ADDRGP4 $84
JUMPV
LABELV $128
line 228
;227:		}
;228:	}
LABELV $88
line 150
ADDRGP4 $87
JUMPV
line 230
;229:
;230:}
LABELV $84
endproc BG_Cmd_TokenizeString2 36 12
export BG_Cmd_TokenizeString
proc BG_Cmd_TokenizeString 0 8
line 236
;231:/*
;232:============
;233:Cmd_TokenizeString
;234:============
;235:*/
;236:void BG_Cmd_TokenizeString(const char* text_in) {
line 237
;237:	BG_Cmd_TokenizeString2(text_in, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_Cmd_TokenizeString2
CALLV
pop
line 238
;238:}
LABELV $130
endproc BG_Cmd_TokenizeString 0 8
export Cmd_TokenizeStringIgnoreQuotes
proc Cmd_TokenizeStringIgnoreQuotes 0 8
line 245
;239:
;240:/*
;241:============
;242:Cmd_TokenizeStringIgnoreQuotes
;243:============
;244:*/
;245:void Cmd_TokenizeStringIgnoreQuotes(const char* text_in) {
line 246
;246:	BG_Cmd_TokenizeString2(text_in, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_Cmd_TokenizeString2
CALLV
pop
line 247
;247:}
LABELV $131
endproc Cmd_TokenizeStringIgnoreQuotes 0 8
bss
align 1
LABELV cmd_cmd
skip 8192
align 1
LABELV cmd_tokenized
skip 9216
align 4
LABELV cmd_argv
skip 4096
align 4
LABELV cmd_argc
skip 4
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
LABELV $63
byte 1 32
byte 1 0
align 1
LABELV $54
byte 1 0
