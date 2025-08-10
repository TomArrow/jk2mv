code
proc StringToFilter 168 8
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_svcmds.c"
line 58
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:// this file holds commands that can be executed by the server console, but not remote clients
;5:
;6:#include "g_local.h"
;7:
;8:
;9:/*
;10:==============================================================================
;11:
;12:PACKET FILTERING
;13: 
;14:
;15:You can add or remove addresses from the filter list with:
;16:
;17:addip <ip>
;18:removeip <ip>
;19:
;20:The ip address is specified in dot format, and any unspecified digits will match any value, so you can specify an entire class C network with "addip 192.246.40".
;21:
;22:Removeip will only remove an address specified exactly the same way.  You cannot addip a subnet, then removeip a single host.
;23:
;24:listip
;25:Prints the current list of filters.
;26:
;27:g_filterban <0 or 1>
;28:
;29:If 1 (the default), then ip addresses matching the current list will be prohibited from entering the game.  This is the default setting.
;30:
;31:If 0, then only addresses matching the list will be allowed.  This lets you easily set up a private game, or a game that only allows players from your local network.
;32:
;33:
;34:==============================================================================
;35:*/
;36:
;37:// extern	vmCvar_t	g_banIPs;
;38:// extern	vmCvar_t	g_filterBan;
;39:
;40:
;41:typedef struct ipFilter_s
;42:{
;43:	unsigned	mask;
;44:	unsigned	compare;
;45:} ipFilter_t;
;46:
;47:#define	MAX_IPFILTERS	1024
;48:
;49:static ipFilter_t	ipFilters[MAX_IPFILTERS];
;50:static int			numIPFilters;
;51:
;52:/*
;53:=================
;54:StringToFilter
;55:=================
;56:*/
;57:static qboolean StringToFilter (char *s, ipFilter_t *f)
;58:{
line 61
;59:	char		num[128];
;60:	int			i, j;
;61:	unsigned	compare = 0;
ADDRLP4 144
CNSTU4 0
ASGNU4
line 62
;62:	unsigned	mask = 0;
ADDRLP4 148
CNSTU4 0
ASGNU4
line 63
;63:	byte		*c = (byte *)&compare;
ADDRLP4 136
ADDRLP4 144
ASGNP4
line 64
;64:	byte		*m = (byte *)&mask;
ADDRLP4 140
ADDRLP4 148
ASGNP4
line 66
;65:
;66:	for (i=0 ; i<4 ; i++)
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $123
line 67
;67:	{
line 68
;68:		if (*s < '0' || *s > '9')
ADDRLP4 152
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 48
LTI4 $129
ADDRLP4 152
INDIRI4
CNSTI4 57
LEI4 $127
LABELV $129
line 69
;69:		{
line 70
;70:			G_Printf( "Bad filter address: %s\n", s );
ADDRGP4 $130
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 71
;71:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $122
JUMPV
LABELV $127
line 74
;72:		}
;73:
;74:		j = 0;
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $131
line 76
;75:		while (*s >= '0' && *s <= '9')
;76:		{
line 77
;77:			num[j++] = *s++;
ADDRLP4 156
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 164
CNSTI4 1
ASGNI4
ADDRLP4 128
ADDRLP4 156
INDIRI4
ADDRLP4 164
INDIRI4
ADDI4
ASGNI4
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 160
INDIRP4
ADDRLP4 164
INDIRI4
ADDP4
ASGNP4
ADDRLP4 156
INDIRI4
ADDRLP4 0
ADDP4
ADDRLP4 160
INDIRP4
INDIRI1
ASGNI1
line 78
;78:		}
LABELV $132
line 75
ADDRLP4 156
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 48
LTI4 $134
ADDRLP4 156
INDIRI4
CNSTI4 57
LEI4 $131
LABELV $134
line 79
;79:		num[j] = 0;
ADDRLP4 128
INDIRI4
ADDRLP4 0
ADDP4
CNSTI1 0
ASGNI1
line 80
;80:		c[i] = atoi(num);
ADDRLP4 0
ARGP4
ADDRLP4 160
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRP4
ADDP4
ADDRLP4 160
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 81
;81:		if (c[i] != 0)
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRP4
ADDP4
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $135
line 82
;82:			m[i] = 255;
ADDRLP4 132
INDIRI4
ADDRLP4 140
INDIRP4
ADDP4
CNSTU1 255
ASGNU1
LABELV $135
line 84
;83:
;84:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $137
line 85
;85:			break;
ADDRGP4 $125
JUMPV
LABELV $137
line 86
;86:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 87
;87:	}
LABELV $124
line 66
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $123
LABELV $125
line 89
;88:
;89:	f->mask = mask;
ADDRFP4 4
INDIRP4
ADDRLP4 148
INDIRU4
ASGNU4
line 90
;90:	f->compare = compare;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 144
INDIRU4
ASGNU4
line 92
;91:
;92:	return qtrue;
CNSTI4 1
RETI4
LABELV $122
endproc StringToFilter 168 8
proc UpdateIPBans 1044 28
line 101
;93:}
;94:
;95:/*
;96:=================
;97:UpdateIPBans
;98:=================
;99:*/
;100:static void UpdateIPBans (void)
;101:{
line 106
;102:	byte	*b;
;103:	int		i;
;104:	char	iplist[MAX_INFO_STRING];
;105:
;106:	*iplist = 0;
ADDRLP4 4
CNSTI1 0
ASGNI1
line 107
;107:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 1028
CNSTI4 0
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $140
line 108
;108:	{
line 109
;109:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 1028
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $144
line 110
;110:			continue;
ADDRGP4 $141
JUMPV
LABELV $144
line 112
;111:
;112:		b = (byte *)&ipFilters[i].compare;
ADDRLP4 0
ADDRLP4 1028
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
ASGNP4
line 113
;113:		Com_sprintf( iplist + strlen(iplist), sizeof(iplist) - strlen(iplist), 
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 1032
INDIRU4
ADDRLP4 4
ADDP4
ARGP4
CNSTU4 1024
ADDRLP4 1036
INDIRU4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 $148
ARGP4
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 3
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 115
;114:			"%i.%i.%i.%i ", b[0], b[1], b[2], b[3]);
;115:	}
LABELV $141
line 107
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $143
ADDRLP4 1028
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $140
line 117
;116:
;117:	trap_Cvar_Set( "g_banIPs", iplist );
ADDRGP4 $149
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 118
;118:}
LABELV $139
endproc UpdateIPBans 1044 28
export G_FilterPacket
proc G_FilterPacket 28 0
line 128
;119:
;120:
;121:
;122:/*
;123:=================
;124:G_FilterPacket
;125:=================
;126:*/
;127:qboolean G_FilterPacket (char *from)
;128:{
line 130
;129:	int			i;
;130:	unsigned	mask = 0;
ADDRLP4 12
CNSTU4 0
ASGNU4
line 131
;131:	byte		*m = (byte *)&mask;
ADDRLP4 8
ADDRLP4 12
ASGNP4
line 134
;132:	char		*p;
;133:
;134:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 135
;135:	p = from;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $152
JUMPV
line 136
;136:	while (*p && i < 4) {
LABELV $154
line 137
;137:		while (*p >= '0' && *p <= '9') {
line 138
;138:			m[i] = m[i]*10 + (*p - '0');
ADDRLP4 16
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 10
ADDRLP4 16
INDIRP4
INDIRU1
CVUI4 1
MULI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
line 139
;139:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 140
;140:		}
LABELV $155
line 137
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $157
ADDRLP4 16
INDIRI4
CNSTI4 57
LEI4 $154
LABELV $157
line 141
;141:		if (!*p || *p == ':')
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $160
ADDRLP4 20
INDIRI4
CNSTI4 58
NEI4 $158
LABELV $160
line 142
;142:			break;
ADDRGP4 $153
JUMPV
LABELV $158
line 143
;143:		i++, p++;
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
line 144
;144:	}
LABELV $152
line 136
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $161
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $155
LABELV $161
LABELV $153
line 146
;145:
;146:	for (i=0 ; i<numIPFilters ; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $165
JUMPV
LABELV $162
line 147
;147:		if ( (mask & ipFilters[i].mask) == ipFilters[i].compare)
ADDRLP4 16
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 12
INDIRU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
BANDU4
ADDRLP4 16
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
NEU4 $166
line 148
;148:			return g_filterBan.integer != 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
EQI4 $171
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $172
JUMPV
LABELV $171
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $172
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $150
JUMPV
LABELV $166
LABELV $163
line 146
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $165
ADDRLP4 4
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $162
line 150
;149:
;150:	return g_filterBan.integer == 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
NEI4 $175
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $176
JUMPV
LABELV $175
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $176
ADDRLP4 24
INDIRI4
RETI4
LABELV $150
endproc G_FilterPacket 28 0
proc AddIP 8 8
line 159
;151:}
;152:
;153:/*
;154:=================
;155:AddIP
;156:=================
;157:*/
;158:static void AddIP( char *str )
;159:{
line 162
;160:	int		i;
;161:
;162:	for (i = 0 ; i < numIPFilters ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $181
JUMPV
LABELV $178
line 163
;163:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $182
line 164
;164:			break;		// free spot
ADDRGP4 $180
JUMPV
LABELV $182
LABELV $179
line 162
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $181
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $178
LABELV $180
line 165
;165:	if (i == numIPFilters)
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
NEI4 $185
line 166
;166:	{
line 167
;167:		if (numIPFilters == MAX_IPFILTERS)
ADDRGP4 numIPFilters
INDIRI4
CNSTI4 1024
NEI4 $187
line 168
;168:		{
line 169
;169:			G_Printf ("IP filter list is full\n");
ADDRGP4 $189
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 170
;170:			return;
ADDRGP4 $177
JUMPV
LABELV $187
line 172
;171:		}
;172:		numIPFilters++;
ADDRLP4 4
ADDRGP4 numIPFilters
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 173
;173:	}
LABELV $185
line 175
;174:	
;175:	if (!StringToFilter (str, &ipFilters[i]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $190
line 176
;176:		ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
LABELV $190
line 178
;177:
;178:	UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 179
;179:}
LABELV $177
endproc AddIP 8 8
export G_ProcessIPBans
proc G_ProcessIPBans 1044 12
line 187
;180:
;181:/*
;182:=================
;183:G_ProcessIPBans
;184:=================
;185:*/
;186:void G_ProcessIPBans(void) 
;187:{
line 191
;188:	char *s, *t;
;189:	char		str[MAX_TOKEN_CHARS];
;190:
;191:	Q_strncpyz( str, g_banIPs.string, sizeof(str) );
ADDRLP4 8
ARGP4
ADDRGP4 g_banIPs+16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 193
;192:
;193:	for (t = s = g_banIPs.string; *t; /* */ ) {
ADDRLP4 1032
ADDRGP4 g_banIPs+16
ASGNP4
ADDRLP4 0
ADDRLP4 1032
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 1032
INDIRP4
ASGNP4
ADDRGP4 $198
JUMPV
LABELV $195
line 194
;194:		s = strchr(s, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
line 195
;195:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $203
line 196
;196:			break;
ADDRGP4 $197
JUMPV
LABELV $202
line 198
;197:		while (*s == ' ')
;198:			*s++ = 0;
ADDRLP4 1040
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1040
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI1 0
ASGNI1
LABELV $203
line 197
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $202
line 199
;199:		if (*t)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $205
line 200
;200:			AddIP( t );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 AddIP
CALLV
pop
LABELV $205
line 201
;201:		t = s;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 202
;202:	}
LABELV $196
line 193
LABELV $198
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $195
LABELV $197
line 203
;203:}
LABELV $193
endproc G_ProcessIPBans 1044 12
export SvCmd_TestTrace_f
proc SvCmd_TestTrace_f 2176 48
line 211
;204:
;205:
;206:/*
;207:=================
;208:SvCmd_TestTrace_f
;209:=================
;210:*/
;211:void SvCmd_TestTrace_f() {
line 220
;212:	vec3_t		origin, origin2;
;213:	vec3_t		mins, maxs;
;214:	qboolean	precise;
;215:	int			contents;
;216:	char		buffer[MAX_TOKEN_CHARS];
;217:	int			i;
;218:	trace_t		trace;
;219:
;220:	if (trap_Argc() != 15) {
ADDRLP4 2164
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2164
INDIRI4
CNSTI4 15
EQI4 $208
line 221
;221:		Com_Printf("usage: testtrace x y z x y z mins[0] mins[1] mins[2] maxs[0] maxs[1] maxs[2] contents precise(0 1)\n");
ADDRGP4 $210
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 222
;222:		return;
ADDRGP4 $207
JUMPV
LABELV $208
line 225
;223:	}
;224:
;225:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $211
line 226
;226:		trap_Argv(i + 1, buffer, sizeof(buffer));
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 227
;227:		origin[i] = atof(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 2168
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2108
ADDP4
ADDRLP4 2168
INDIRF4
ASGNF4
line 228
;228:	}
LABELV $212
line 225
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $211
line 229
;229:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $215
line 230
;230:		trap_Argv(i + 4, buffer, sizeof(buffer));
ADDRLP4 0
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 231
;231:		origin2[i] = atof(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 2168
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2120
ADDP4
ADDRLP4 2168
INDIRF4
ASGNF4
line 232
;232:	}
LABELV $216
line 229
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $215
line 233
;233:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $219
line 234
;234:		trap_Argv(i + 7, buffer, sizeof(buffer));
ADDRLP4 0
INDIRI4
CNSTI4 7
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 235
;235:		mins[i] = atof(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 2168
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2132
ADDP4
ADDRLP4 2168
INDIRF4
ASGNF4
line 236
;236:	}
LABELV $220
line 233
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $219
line 237
;237:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $223
line 238
;238:		trap_Argv(i + 10, buffer, sizeof(buffer));
ADDRLP4 0
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 239
;239:		maxs[i] = atof(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 2168
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2144
ADDP4
ADDRLP4 2168
INDIRF4
ASGNF4
line 240
;240:	}
LABELV $224
line 237
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $223
line 242
;241:
;242:	trap_Argv(13, buffer, sizeof(buffer));
CNSTI4 13
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 243
;243:	contents = atoi(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 2168
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2160
ADDRLP4 2168
INDIRI4
ASGNI4
line 245
;244:
;245:	trap_Argv(14, buffer, sizeof(buffer));
CNSTI4 14
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 246
;246:	precise = atoi(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 2172
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2156
ADDRLP4 2172
INDIRI4
ASGNI4
line 248
;247:
;248:	memset(&trace, 0, sizeof(trace_t));
ADDRLP4 1028
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1080
ARGU4
ADDRGP4 memset
CALLP4
pop
line 249
;249:	if (precise) {
ADDRLP4 2156
INDIRI4
CNSTI4 0
EQI4 $227
line 250
;250:		JP_TracePrecise(&trace,origin,mins,maxs,origin2,-1,contents);
ADDRLP4 1028
ARGP4
ADDRLP4 2108
ARGP4
ADDRLP4 2132
ARGP4
ADDRLP4 2144
ARGP4
ADDRLP4 2120
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 2160
INDIRI4
ARGI4
ADDRGP4 JP_TracePrecise
CALLV
pop
line 251
;251:	}
ADDRGP4 $228
JUMPV
LABELV $227
line 252
;252:	else {
line 253
;253:		JP_Trace(&trace, origin, mins, maxs, origin2, -1, contents);
ADDRLP4 1028
ARGP4
ADDRLP4 2108
ARGP4
ADDRLP4 2132
ARGP4
ADDRLP4 2144
ARGP4
ADDRLP4 2120
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 2160
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 254
;254:	}
LABELV $228
line 256
;255:
;256:	Com_Printf("startsolid: %d, allsolid: %d, contents: %d, endpos: %f %f %f, entitynum %d, fraction %f, normal: %f %f %f\n",trace.startsolid,trace.allsolid,trace.contents,trace.endpos[0], trace.endpos[1], trace.endpos[2],trace.entityNum,trace.fraction,trace.plane.normal[0],trace.plane.normal[1],trace.plane.normal[2]);
ADDRGP4 $229
ARGP4
ADDRLP4 1028+4
INDIRI4
ARGI4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1028+48
INDIRI4
ARGI4
ADDRLP4 1028+12
INDIRF4
ARGF4
ADDRLP4 1028+12+4
INDIRF4
ARGF4
ADDRLP4 1028+12+8
INDIRF4
ARGF4
ADDRLP4 1028+52
INDIRI4
ARGI4
ADDRLP4 1028+8
INDIRF4
ARGF4
ADDRLP4 1028+24
INDIRF4
ARGF4
ADDRLP4 1028+24+4
INDIRF4
ARGF4
ADDRLP4 1028+24+8
INDIRF4
ARGF4
ADDRGP4 Com_Printf
CALLV
pop
line 258
;257:
;258:}
LABELV $207
endproc SvCmd_TestTrace_f 2176 48
export Svcmd_AddIP_f
proc Svcmd_AddIP_f 1028 12
line 266
;259:
;260:/*
;261:=================
;262:Svcmd_AddIP_f
;263:=================
;264:*/
;265:void Svcmd_AddIP_f (void)
;266:{
line 269
;267:	char		str[MAX_TOKEN_CHARS];
;268:
;269:	if ( trap_Argc() < 2 ) {
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
GEI4 $245
line 270
;270:		G_Printf("Usage:  addip <ip-mask>\n");
ADDRGP4 $247
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 271
;271:		return;
ADDRGP4 $244
JUMPV
LABELV $245
line 274
;272:	}
;273:
;274:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 276
;275:
;276:	AddIP( str );
ADDRLP4 0
ARGP4
ADDRGP4 AddIP
CALLV
pop
line 278
;277:
;278:}
LABELV $244
endproc Svcmd_AddIP_f 1028 12
export Svcmd_RemoveIP_f
proc Svcmd_RemoveIP_f 1048 12
line 286
;279:
;280:/*
;281:=================
;282:Svcmd_RemoveIP_f
;283:=================
;284:*/
;285:void Svcmd_RemoveIP_f (void)
;286:{
line 291
;287:	ipFilter_t	f;
;288:	int			i;
;289:	char		str[MAX_TOKEN_CHARS];
;290:
;291:	if ( trap_Argc() < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $249
line 292
;292:		G_Printf("Usage:  sv removeip <ip-mask>\n");
ADDRGP4 $251
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 293
;293:		return;
ADDRGP4 $248
JUMPV
LABELV $249
line 296
;294:	}
;295:
;296:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 298
;297:
;298:	if (!StringToFilter (str, &f))
ADDRLP4 12
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $252
line 299
;299:		return;
ADDRGP4 $248
JUMPV
LABELV $252
line 301
;300:
;301:	for (i=0 ; i<numIPFilters ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $257
JUMPV
LABELV $254
line 302
;302:		if (ipFilters[i].mask == f.mask	&&
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
ADDRLP4 4
INDIRU4
NEU4 $258
ADDRLP4 1044
INDIRI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ADDRLP4 4+4
INDIRU4
NEU4 $258
line 303
;303:			ipFilters[i].compare == f.compare) {
line 304
;304:			ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
line 305
;305:			G_Printf ("Removed.\n");
ADDRGP4 $263
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 307
;306:
;307:			UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 308
;308:			return;
ADDRGP4 $248
JUMPV
LABELV $258
line 310
;309:		}
;310:	}
LABELV $255
line 301
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $257
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $254
line 312
;311:
;312:	G_Printf ( "Didn't find %s.\n", str );
ADDRGP4 $264
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 313
;313:}
LABELV $248
endproc Svcmd_RemoveIP_f 1048 12
export Svcmd_EntityInfo_f
proc Svcmd_EntityInfo_f 16 16
line 321
;314:
;315:
;316:/*
;317:===================
;318:Svcmd_EntityInfo_f
;319:===================
;320:*/
;321:void	Svcmd_EntityInfo_f(void) {
line 327
;322:	int totalents;
;323:	int inuse;
;324:	int i;
;325:	gentity_t* e;
;326:
;327:	inuse = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 328
;328:	for (e = &g_entities[0], i = 0; i < level.num_entities; e++, i++) {
ADDRLP4 4
ADDRGP4 g_entities
ASGNP4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $269
JUMPV
LABELV $266
line 329
;329:		if (e->inuse) {
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $271
line 330
;330:			inuse++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 331
;331:		}
LABELV $271
line 332
;332:	}
LABELV $267
line 328
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 2352
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $269
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $266
line 333
;333:	G_Printf("Normal entity slots in use: %i/%i (%i slots allocated)\n", inuse, MAX_GENTITIES, level.num_entities);
ADDRGP4 $273
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 level+12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 334
;334:	totalents = inuse;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ASGNI4
line 336
;335:
;336:	inuse = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 337
;337:	for (e = &g_entities[MAX_GENTITIES], i = 0; i < level.num_logicalents; e++, i++) {
ADDRLP4 4
ADDRGP4 g_entities+2408448
ASGNP4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $275
line 338
;338:		if (e->inuse) {
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $281
line 339
;339:			inuse++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 340
;340:		}
LABELV $281
line 341
;341:	}
LABELV $276
line 337
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 2352
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $278
ADDRLP4 0
INDIRI4
ADDRGP4 level+16
INDIRI4
LTI4 $275
line 342
;342:	G_Printf("Logical entity slots in use: %i/%i (%i slots allocated)\n", inuse, MAX_LOGICENTITIES, level.num_logicalents);
ADDRGP4 $283
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 3072
ARGI4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 343
;343:	totalents += inuse;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 344
;344:	G_Printf("Total entity count: %i/%i\n", totalents, MAX_ENTITIESTOTAL);
ADDRGP4 $285
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 4096
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 345
;345:}
LABELV $265
endproc Svcmd_EntityInfo_f 16 16
export Svcmd_EntityList_f
proc Svcmd_EntityList_f 24 8
line 353
;346:
;347:
;348:/*
;349:===================
;350:Svcmd_EntityList_f
;351:===================
;352:*/
;353:void	Svcmd_EntityList_f (void) {
line 354
;354:	int			e=0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 356
;355:	int			i;
;356:	int			max = level.num_entities;
ADDRLP4 8
ADDRGP4 level+12
INDIRI4
ASGNI4
line 357
;357:	gentity_t		*check = g_entities;
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 359
;358:
;359:	for (i = 0; i < 2; i++) {
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $288
line 360
;360:		if (i) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $300
line 361
;361:			check = &g_entities[MAX_GENTITIES];
ADDRLP4 0
ADDRGP4 g_entities+2408448
ASGNP4
line 362
;362:			e = MAX_GENTITIES;
ADDRLP4 4
CNSTI4 1024
ASGNI4
line 363
;363:			max = MAX_GENTITIES+ level.num_logicalents;
ADDRLP4 8
ADDRGP4 level+16
INDIRI4
CNSTI4 1024
ADDI4
ASGNI4
line 365
;364:
;365:			G_Printf("\nLogical:\n");
ADDRGP4 $296
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 366
;366:		}
line 367
;367:		for (; e < max; e++, check++) {
ADDRGP4 $300
JUMPV
LABELV $297
line 368
;368:			if (!check->inuse) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $301
line 369
;369:				continue;
ADDRGP4 $298
JUMPV
LABELV $301
line 371
;370:			}
;371:			G_Printf("%3i:", e);
ADDRGP4 $303
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 372
;372:			switch (check->s.eType) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $304
ADDRLP4 16
INDIRI4
CNSTI4 13
GTI4 $304
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $332
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $332
address $307
address $309
address $311
address $313
address $304
address $304
address $315
address $317
address $319
address $321
address $323
address $325
address $327
address $329
code
LABELV $307
line 374
;373:			case ET_GENERAL:
;374:				G_Printf("ET_GENERAL          ");
ADDRGP4 $308
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 375
;375:				break;
ADDRGP4 $305
JUMPV
LABELV $309
line 377
;376:			case ET_PLAYER:
;377:				G_Printf("ET_PLAYER           ");
ADDRGP4 $310
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 378
;378:				break;
ADDRGP4 $305
JUMPV
LABELV $311
line 380
;379:			case ET_ITEM:
;380:				G_Printf("ET_ITEM             ");
ADDRGP4 $312
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 381
;381:				break;
ADDRGP4 $305
JUMPV
LABELV $313
line 383
;382:			case ET_MISSILE:
;383:				G_Printf("ET_MISSILE          ");
ADDRGP4 $314
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 384
;384:				break;
ADDRGP4 $305
JUMPV
LABELV $315
line 386
;385:			case ET_MOVER:
;386:				G_Printf("ET_MOVER            ");
ADDRGP4 $316
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 387
;387:				break;
ADDRGP4 $305
JUMPV
LABELV $317
line 389
;388:			case ET_BEAM:
;389:				G_Printf("ET_BEAM             ");
ADDRGP4 $318
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 390
;390:				break;
ADDRGP4 $305
JUMPV
LABELV $319
line 392
;391:			case ET_PORTAL:
;392:				G_Printf("ET_PORTAL           ");
ADDRGP4 $320
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 393
;393:				break;
ADDRGP4 $305
JUMPV
LABELV $321
line 395
;394:			case ET_SPEAKER:
;395:				G_Printf("ET_SPEAKER          ");
ADDRGP4 $322
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 396
;396:				break;
ADDRGP4 $305
JUMPV
LABELV $323
line 398
;397:			case ET_PUSH_TRIGGER:
;398:				G_Printf("ET_PUSH_TRIGGER     ");
ADDRGP4 $324
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 399
;399:				break;
ADDRGP4 $305
JUMPV
LABELV $325
line 401
;400:			case ET_TELEPORT_TRIGGER:
;401:				G_Printf("ET_TELEPORT_TRIGGER ");
ADDRGP4 $326
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 402
;402:				break;
ADDRGP4 $305
JUMPV
LABELV $327
line 404
;403:			case ET_INVISIBLE:
;404:				G_Printf("ET_INVISIBLE        ");
ADDRGP4 $328
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 405
;405:				break;
ADDRGP4 $305
JUMPV
LABELV $329
line 407
;406:			case ET_GRAPPLE:
;407:				G_Printf("ET_GRAPPLE          ");
ADDRGP4 $330
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 408
;408:				break;
ADDRGP4 $305
JUMPV
LABELV $304
line 410
;409:			default:
;410:				G_Printf("%3i                 ", check->s.eType);
ADDRGP4 $331
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 411
;411:				break;
LABELV $305
line 414
;412:			}
;413:
;414:			if (check->classname) {
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $333
line 415
;415:				G_Printf("%s", check->classname);
ADDRGP4 $335
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 416
;416:			}
LABELV $333
line 417
;417:			G_Printf("\n");
ADDRGP4 $336
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 418
;418:		}
LABELV $298
line 367
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
LABELV $300
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $297
line 419
;419:	}
LABELV $289
line 359
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
LTI4 $288
line 420
;420:}
LABELV $286
endproc Svcmd_EntityList_f 24 8
export ClientForString
proc ClientForString 24 8
line 422
;421:
;422:gclient_t	*ClientForString( const char *s ) {
line 428
;423:	gclient_t	*cl;
;424:	int			i;
;425:	int			idnum;
;426:
;427:	// numeric values are just slot numbers
;428:	if ( s[0] >= '0' && s[0] <= '9' ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $338
ADDRLP4 12
INDIRI4
CNSTI4 57
GTI4 $338
line 429
;429:		idnum = atoi( s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 430
;430:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 20
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $343
ADDRLP4 20
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $340
LABELV $343
line 431
;431:			Com_Printf( "Bad client slot: %i\n", idnum );
ADDRGP4 $344
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 432
;432:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $337
JUMPV
LABELV $340
line 435
;433:		}
;434:
;435:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 53196
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 436
;436:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $345
line 437
;437:			G_Printf( "Client %i is not connected\n", idnum );
ADDRGP4 $347
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 438
;438:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $337
JUMPV
LABELV $345
line 440
;439:		}
;440:		return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $337
JUMPV
LABELV $338
line 444
;441:	}
;442:
;443:	// check for a name match
;444:	for ( i=0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $351
JUMPV
LABELV $348
line 445
;445:		cl = &level.clients[i];
ADDRLP4 0
CNSTI4 53196
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 446
;446:		if ( cl->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $353
line 447
;447:			continue;
ADDRGP4 $349
JUMPV
LABELV $353
line 449
;448:		}
;449:		if ( !Q_stricmp( cl->pers.netname, s ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
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
NEI4 $355
line 450
;450:			return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $337
JUMPV
LABELV $355
line 452
;451:		}
;452:	}
LABELV $349
line 444
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $351
ADDRLP4 4
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $348
line 454
;453:
;454:	G_Printf( "User %s is not on the server\n", s );
ADDRGP4 $357
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 456
;455:
;456:	return NULL;
CNSTP4 0
RETP4
LABELV $337
endproc ClientForString 24 8
export Svcmd_ForceTeam_f
proc Svcmd_ForceTeam_f 1032 12
line 466
;457:}
;458:
;459:/*
;460:===================
;461:Svcmd_ForceTeam_f
;462:
;463:forceteam <player> <team>
;464:===================
;465:*/
;466:void	Svcmd_ForceTeam_f( void ) {
line 471
;467:	gclient_t	*cl;
;468:	char		str[MAX_TOKEN_CHARS];
;469:
;470:	// find the player
;471:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 472
;472:	cl = ClientForString( str );
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 473
;473:	if ( !cl ) {
ADDRLP4 1024
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $359
line 474
;474:		return;
ADDRGP4 $358
JUMPV
LABELV $359
line 478
;475:	}
;476:
;477:	// set the team
;478:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 479
;479:	SetTeam( &g_entities[cl - level.clients], str );
CNSTI4 2352
ADDRLP4 1024
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 53196
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 480
;480:}
LABELV $358
endproc Svcmd_ForceTeam_f 1032 12
export Svcmd_NumBehavior_f
proc Svcmd_NumBehavior_f 1108 52
line 489
;481:
;482:/*
;483:===================
;484:Svcmd_NumBehavior_f
;485:
;486:writes a debug file about number behavior things to compare qvm and libs
;487:===================
;488:*/
;489:void	Svcmd_NumBehavior_f( void ) {
line 500
;490:	gclient_t		*cl;
;491:	char			str[MAX_TOKEN_CHARS];
;492:	fileHandle_t	f;
;493:	int				i;
;494:	signed char		sb;
;495:	byte			b;
;496:	int				intn;
;497:	unsigned int	uintn;
;498:	float			fValue;
;499:
;500:	if (trap_Argc() < 2) {
ADDRLP4 1056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 2
GEI4 $362
line 501
;501:		Com_Printf("specify a filename.");
ADDRGP4 $364
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 502
;502:		return;
ADDRGP4 $361
JUMPV
LABELV $362
line 505
;503:	}
;504:
;505:	trap_Argv(1, str, sizeof(str));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 507
;506:
;507:	trap_FS_FOpenFile(str, &f, FS_WRITE);
ADDRLP4 0
ARGP4
ADDRLP4 1040
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 509
;508:
;509:	if (!f) {
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $365
line 510
;510:		Com_Printf("unable to open file for writing: %s.",str);
ADDRGP4 $367
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 511
;511:		return;
ADDRGP4 $361
JUMPV
LABELV $365
line 515
;512:	}
;513:
;514:#ifdef Q3_VM
;515:	Com_sprintf(str, sizeof(str), "\nSvcmd_NumBehavior_f (VM)\n");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $368
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 516
;516:	trap_FS_Write(str, strlen(str), f);
ADDRLP4 0
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ARGP4
ADDRLP4 1060
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 522
;517:#else
;518:	Com_sprintf(str, sizeof(str), "\nSvcmd_NumBehavior_f\n");
;519:	trap_FS_Write(str, strlen(str), f);
;520:#endif
;521:
;522:	Com_sprintf(str, sizeof(str), "\nangle2short\n");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $369
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 523
;523:	trap_FS_Write(str, strlen(str), f);
ADDRLP4 0
ARGP4
ADDRLP4 1064
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ARGP4
ADDRLP4 1064
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 525
;524:
;525:	for (i = -100000; i < 100000; i++) {
ADDRLP4 1024
CNSTI4 -100000
ASGNI4
LABELV $370
line 526
;526:		fValue = SHORT2ANGLE(i);
ADDRLP4 1048
CNSTF4 1001652224
ADDRLP4 1024
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 527
;527:		Com_sprintf(str, sizeof(str), "%d angle2short %d, float angle %f, (from float) %d\n",i,i & 65535, fValue, ANGLE2SHORT(fValue));
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $374
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1072
CNSTI4 65535
ASGNI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1072
INDIRI4
BANDI4
ARGI4
ADDRLP4 1048
INDIRF4
ARGF4
CNSTF4 1199570944
ADDRLP4 1048
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
ADDRLP4 1072
INDIRI4
BANDI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 528
;528:		trap_FS_Write(str,strlen(str),f);
ADDRLP4 0
ARGP4
ADDRLP4 1080
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ARGP4
ADDRLP4 1080
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 529
;529:	}
LABELV $371
line 525
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 100000
LTI4 $370
line 531
;530:
;531:	Com_sprintf(str, sizeof(str), "\nsbyte2byte\n");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $375
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 532
;532:	trap_FS_Write(str, strlen(str), f);
ADDRLP4 0
ARGP4
ADDRLP4 1068
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ARGP4
ADDRLP4 1068
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 535
;533:
;534:
;535:	for (i = -128; i <= 127; i++) {
ADDRLP4 1024
CNSTI4 -128
ASGNI4
LABELV $376
line 536
;536:		sb = i;
ADDRLP4 1032
ADDRLP4 1024
INDIRI4
CVII1 4
ASGNI1
line 537
;537:		intn = (int)((byte)sb << 24);
ADDRLP4 1028
ADDRLP4 1032
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
CVUI4 1
CNSTI4 24
LSHI4
ASGNI4
line 538
;538:		uintn = (unsigned int)intn;
ADDRLP4 1036
ADDRLP4 1028
INDIRI4
CVIU4 4
ASGNU4
line 539
;539:		Com_sprintf(str, sizeof(str), "%d (%d) sbyte 2 byte %d, bytecast and << 24 %d to int, bytecast and << 24 %u to uint, bytecast and << 24 %u to int and then to uint, same and >> 24 again %u, same and back to sbyte %d, int >> 24 %d, and cast to sbyte %d\n", i,(int)sb,(int)(byte)sb, intn,(unsigned int)( (byte)sb << 24), uintn, (uintn >> 24), (int)(signed char)(uintn >> 24), intn>>24, (int)(signed char)(intn>>24));
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $380
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1072
ADDRLP4 1032
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1072
INDIRI4
ARGI4
ADDRLP4 1076
ADDRLP4 1072
INDIRI4
CVIU4 4
CVUU1 4
CVUI4 1
ASGNI4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1084
CNSTI4 24
ASGNI4
ADDRLP4 1076
INDIRI4
ADDRLP4 1084
INDIRI4
LSHI4
CVIU4 4
ARGU4
ADDRLP4 1036
INDIRU4
ARGU4
ADDRLP4 1092
ADDRLP4 1036
INDIRU4
ADDRLP4 1084
INDIRI4
RSHU4
ASGNU4
ADDRLP4 1092
INDIRU4
ARGU4
ADDRLP4 1092
INDIRU4
CVUI4 4
CVII1 4
CVII4 1
ARGI4
ADDRLP4 1096
ADDRLP4 1028
INDIRI4
ADDRLP4 1084
INDIRI4
RSHI4
ASGNI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRLP4 1096
INDIRI4
CVII1 4
CVII4 1
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 540
;540:		trap_FS_Write(str, strlen(str), f);
ADDRLP4 0
ARGP4
ADDRLP4 1100
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ARGP4
ADDRLP4 1100
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 541
;541:	}
LABELV $377
line 535
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 127
LEI4 $376
line 543
;542:
;543:	Com_sprintf(str, sizeof(str), "\nsbyte2byte (using unsigned char)\n");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $381
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 544
;544:	trap_FS_Write(str, strlen(str), f);
ADDRLP4 0
ARGP4
ADDRLP4 1072
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ARGP4
ADDRLP4 1072
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 547
;545:
;546:
;547:	for (i = -128; i <= 127; i++) {
ADDRLP4 1024
CNSTI4 -128
ASGNI4
LABELV $382
line 548
;548:		sb = i;
ADDRLP4 1032
ADDRLP4 1024
INDIRI4
CVII1 4
ASGNI1
line 549
;549:		intn = (int)((unsigned char)sb << 24);
ADDRLP4 1028
ADDRLP4 1032
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
CVUI4 1
CNSTI4 24
LSHI4
ASGNI4
line 550
;550:		uintn = (unsigned int)intn;
ADDRLP4 1036
ADDRLP4 1028
INDIRI4
CVIU4 4
ASGNU4
line 551
;551:		Com_sprintf(str, sizeof(str), "%d (%d) sbyte 2 byte %d, bytecast and << 24 %d to int, bytecast and << 24 %u to uint, bytecast and << 24 %u to int and then to uint, same and >> 24 again %u, same and back to sbyte %d, int >> 24 %d, and cast to sbyte %d\n", i,(int)sb,(int)(unsigned char)sb, intn,(unsigned int)( (unsigned char)sb << 24), uintn, (uintn >> 24), (int)(signed char)(uintn >> 24), intn>>24, (int)(signed char)(intn>>24));
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $380
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1076
ADDRLP4 1032
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1076
INDIRI4
ARGI4
ADDRLP4 1080
ADDRLP4 1076
INDIRI4
CVIU4 4
CVUU1 4
CVUI4 1
ASGNI4
ADDRLP4 1080
INDIRI4
ARGI4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1088
CNSTI4 24
ASGNI4
ADDRLP4 1080
INDIRI4
ADDRLP4 1088
INDIRI4
LSHI4
CVIU4 4
ARGU4
ADDRLP4 1036
INDIRU4
ARGU4
ADDRLP4 1096
ADDRLP4 1036
INDIRU4
ADDRLP4 1088
INDIRI4
RSHU4
ASGNU4
ADDRLP4 1096
INDIRU4
ARGU4
ADDRLP4 1096
INDIRU4
CVUI4 4
CVII1 4
CVII4 1
ARGI4
ADDRLP4 1100
ADDRLP4 1028
INDIRI4
ADDRLP4 1088
INDIRI4
RSHI4
ASGNI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRLP4 1100
INDIRI4
CVII1 4
CVII4 1
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 552
;552:		trap_FS_Write(str, strlen(str), f);
ADDRLP4 0
ARGP4
ADDRLP4 1104
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ARGP4
ADDRLP4 1104
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 553
;553:	}
LABELV $383
line 547
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 127
LEI4 $382
line 555
;554:
;555:	Com_sprintf(str, sizeof(str), "\nsbyte2byte (realvar)\n");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $386
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 556
;556:	trap_FS_Write(str, strlen(str), f);
ADDRLP4 0
ARGP4
ADDRLP4 1076
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ARGP4
ADDRLP4 1076
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 559
;557:
;558:
;559:	for (i = -128; i <= 127; i++) {
ADDRLP4 1024
CNSTI4 -128
ASGNI4
LABELV $387
line 560
;560:		sb = i;
ADDRLP4 1032
ADDRLP4 1024
INDIRI4
CVII1 4
ASGNI1
line 561
;561:		b = (byte)sb;
ADDRLP4 1044
ADDRLP4 1032
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
line 562
;562:		intn = (int)(b << 24);
ADDRLP4 1028
ADDRLP4 1044
INDIRU1
CVUI4 1
CNSTI4 24
LSHI4
ASGNI4
line 563
;563:		uintn = (unsigned int)intn;
ADDRLP4 1036
ADDRLP4 1028
INDIRI4
CVIU4 4
ASGNU4
line 564
;564:		Com_sprintf(str, sizeof(str), "%d (%d) sbyte 2 byte %d, bytecast and << 24 %d to int, bytecast and << 24 %u to uint, bytecast and << 24 %u to int and then to uint, same and >> 24 again %u, same and back to sbyte %d, int >> 24 %d, and cast to sbyte %d\n", i,(int)sb,(int)b, intn,(unsigned int)( b << 24), uintn, (uintn >> 24), (int)(signed char)(uintn >> 24), intn>>24, (int)(signed char)(intn>>24));
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $380
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1032
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1080
ADDRLP4 1044
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 1080
INDIRI4
ARGI4
ADDRLP4 1028
INDIRI4
ARGI4
ADDRLP4 1088
CNSTI4 24
ASGNI4
ADDRLP4 1080
INDIRI4
ADDRLP4 1088
INDIRI4
LSHI4
CVIU4 4
ARGU4
ADDRLP4 1036
INDIRU4
ARGU4
ADDRLP4 1096
ADDRLP4 1036
INDIRU4
ADDRLP4 1088
INDIRI4
RSHU4
ASGNU4
ADDRLP4 1096
INDIRU4
ARGU4
ADDRLP4 1096
INDIRU4
CVUI4 4
CVII1 4
CVII4 1
ARGI4
ADDRLP4 1100
ADDRLP4 1028
INDIRI4
ADDRLP4 1088
INDIRI4
RSHI4
ASGNI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRLP4 1100
INDIRI4
CVII1 4
CVII4 1
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 565
;565:		trap_FS_Write(str, strlen(str), f);
ADDRLP4 0
ARGP4
ADDRLP4 1104
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ARGP4
ADDRLP4 1104
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 566
;566:	}
LABELV $388
line 559
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 127
LEI4 $387
line 568
;567:
;568:	Com_Printf("done.");
ADDRGP4 $391
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 570
;569:
;570:	trap_FS_FCloseFile(f);
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 571
;571:}
LABELV $361
endproc Svcmd_NumBehavior_f 1108 52
export Svcmd_ResetScores_f
proc Svcmd_ResetScores_f 12 8
line 573
;572:
;573:void Svcmd_ResetScores_f(void) {
line 581
;574:	int i;
;575:	//gclient_t	*cl;
;576:	gentity_t* ent;
;577:
;578:	//Respawn each player for forcepower updates?
;579:	//bg_legalizeforcepowers
;580:
;581:	for (i = 0; i < level.numConnectedClients; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $396
JUMPV
LABELV $393
line 583
;582:		//cl=&level.clients[level.sortedClients[i]];
;583:		ent = &g_entities[level.sortedClients[i]];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+96
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 585
;584:
;585:		if (ent->inuse && ent->client) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $399
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $399
line 592
;586:			//ent->client->ps.fd.forceDoInit = 1;
;587:
;588:			//if (ent->client->sess.sessionTeam != TEAM_SPECTATOR && !ent->client->sess.raceMode) {
;589:				//G_Kill( ent ); //respawn them
;590:			//}
;591:
;592:			ent->client->ps.persistant[PERS_SCORE] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 0
ASGNI4
line 593
;593:			ent->client->ps.persistant[PERS_HITS] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 0
ASGNI4
line 594
;594:			ent->client->ps.persistant[PERS_KILLED] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 312
ADDP4
CNSTI4 0
ASGNI4
line 595
;595:			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 316
ADDP4
CNSTI4 0
ASGNI4
line 596
;596:			ent->client->ps.persistant[PERS_EXCELLENT_COUNT] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 320
ADDP4
CNSTI4 0
ASGNI4
line 597
;597:			ent->client->ps.persistant[PERS_DEFEND_COUNT] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
CNSTI4 0
ASGNI4
line 598
;598:			ent->client->ps.persistant[PERS_ASSIST_COUNT] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 328
ADDP4
CNSTI4 0
ASGNI4
line 599
;599:			ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 332
ADDP4
CNSTI4 0
ASGNI4
line 600
;600:			ent->client->ps.persistant[PERS_CAPTURES] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 336
ADDP4
CNSTI4 0
ASGNI4
line 610
;601:
;602:			//ent->client->pers.stats.damageGiven = 0;
;603:			//ent->client->pers.stats.damageTaken = 0;
;604:			//ent->client->pers.stats.teamKills = 0;
;605:			//ent->client->pers.stats.kills = 0;
;606:			//ent->client->pers.stats.teamHealGiven = 0;
;607:			//ent->client->pers.stats.teamEnergizeGiven = 0;
;608:			//ent->client->pers.stats.enemyDrainDamage = 0;
;609:			//ent->client->pers.stats.teamDrainDamage = 0;
;610:			ent->client->accuracy_shots = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43664
ADDP4
CNSTI4 0
ASGNI4
line 611
;611:			ent->client->accuracy_hits = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43668
ADDP4
CNSTI4 0
ASGNI4
line 613
;612:
;613:			ent->client->ps.fd.suicides = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1236
ADDP4
CNSTI4 0
ASGNI4
line 616
;614:			//Cmd_ForceChange_f(ent);
;615:			//WP_InitForcePowers( ent );
;616:		}
LABELV $399
line 617
;617:	}
LABELV $394
line 581
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $396
ADDRLP4 4
INDIRI4
ADDRGP4 level+80
INDIRI4
LTI4 $393
line 619
;618:
;619:	level.teamScores[TEAM_RED] = 0;
ADDRGP4 level+52+4
CNSTI4 0
ASGNI4
line 620
;620:	level.teamScores[TEAM_BLUE] = 0;
ADDRGP4 level+52+8
CNSTI4 0
ASGNI4
line 621
;621:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 622
;622:	trap_SendServerCommand(-1, "print \"Scores have been reset.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $405
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 623
;623:}
LABELV $392
endproc Svcmd_ResetScores_f 12 8
export ConsoleCommand
proc ConsoleCommand 1080 12
line 634
;624:
;625:
;626:char	*ConcatArgs( int start );
;627:
;628:/*
;629:=================
;630:ConsoleCommand
;631:
;632:=================
;633:*/
;634:qboolean	ConsoleCommand( void ) {
line 637
;635:	char	cmd[MAX_TOKEN_CHARS];
;636:
;637:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 639
;638:
;639:	if ( Q_stricmp (cmd, "testtrace") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $409
ARGP4
ADDRLP4 1024
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $407
line 640
;640:		SvCmd_TestTrace_f();
ADDRGP4 SvCmd_TestTrace_f
CALLV
pop
line 641
;641:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $407
line 644
;642:	}
;643:
;644:	if ( Q_stricmp (cmd, "entitylist") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $412
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $410
line 645
;645:		Svcmd_EntityList_f();
ADDRGP4 Svcmd_EntityList_f
CALLV
pop
line 646
;646:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $410
line 649
;647:	}
;648:
;649:	if ( Q_stricmp (cmd, "entityinfo") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $415
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $413
line 650
;650:		Svcmd_EntityInfo_f();
ADDRGP4 Svcmd_EntityInfo_f
CALLV
pop
line 651
;651:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $413
line 654
;652:	}
;653:
;654:	if ( Q_stricmp (cmd, "forceteam") == 0 ) {
ADDRLP4 0
ARGP4
ADDRGP4 $418
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $416
line 655
;655:		Svcmd_ForceTeam_f();
ADDRGP4 Svcmd_ForceTeam_f
CALLV
pop
line 656
;656:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $416
line 659
;657:	}
;658:
;659:	if (Q_stricmp (cmd, "game_memory") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $421
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $419
line 660
;660:		Svcmd_GameMem_f();
ADDRGP4 Svcmd_GameMem_f
CALLV
pop
line 661
;661:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $419
line 664
;662:	}
;663:
;664:	if (Q_stricmp (cmd, "numbehavior") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $422
line 665
;665:		Svcmd_NumBehavior_f();
ADDRGP4 Svcmd_NumBehavior_f
CALLV
pop
line 666
;666:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $422
line 669
;667:	}
;668:
;669:	if (Q_stricmp (cmd, "addbot") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $427
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $425
line 670
;670:		Svcmd_AddBot_f();
ADDRGP4 Svcmd_AddBot_f
CALLV
pop
line 671
;671:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $425
line 674
;672:	}
;673:
;674:	if (Q_stricmp (cmd, "botlist") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $430
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $428
line 675
;675:		Svcmd_BotList_f();
ADDRGP4 Svcmd_BotList_f
CALLV
pop
line 676
;676:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $428
line 684
;677:	}
;678:
;679:/*	if (Q_stricmp (cmd, "abort_podium") == 0) {
;680:		Svcmd_AbortPodium_f();
;681:		return qtrue;
;682:	}
;683:*/
;684:	if (Q_stricmp (cmd, "addip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $433
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $431
line 685
;685:		Svcmd_AddIP_f();
ADDRGP4 Svcmd_AddIP_f
CALLV
pop
line 686
;686:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $431
line 689
;687:	}
;688:
;689:	if (Q_stricmp (cmd, "removeip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $434
line 690
;690:		Svcmd_RemoveIP_f();
ADDRGP4 Svcmd_RemoveIP_f
CALLV
pop
line 691
;691:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $434
line 694
;692:	}
;693:
;694:	if (Q_stricmp (cmd, "listip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $439
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $437
line 695
;695:		trap_SendConsoleCommand( EXEC_NOW, "g_banIPs\n" );
CNSTI4 0
ARGI4
ADDRGP4 $440
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 696
;696:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $437
line 726
;697:	}
;698:
;699:#if _DEBUG // Only in debug builds
;700:	if ( !Q_stricmp(cmd, "jk2gameplay") )
;701:	{
;702:		char arg1[MAX_TOKEN_CHARS];
;703:
;704:		trap_Argv( 1, arg1, sizeof(arg1) );
;705:
;706:		switch ( atoi(arg1) )
;707:		{
;708:			case VERSION_1_02:
;709:				MV_SetGamePlay(VERSION_1_02);
;710:				trap_SendServerCommand( -1, "print \"Gameplay changed to 1.02\n\"" );
;711:				break;
;712:			case VERSION_1_03:
;713:				MV_SetGamePlay(VERSION_1_03);
;714:				trap_SendServerCommand( -1, "print \"Gameplay changed to 1.03\n\"" );
;715:				break;
;716:			default:
;717:			case VERSION_1_04:
;718:				MV_SetGamePlay(VERSION_1_04);
;719:				trap_SendServerCommand( -1, "print \"Gameplay changed to 1.04\n\"" );
;720:				break;
;721:		}
;722:		return qtrue;
;723:	}
;724:#endif
;725:
;726:	if (g_dedicated.integer) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $441
line 727
;727:		if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $446
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $444
line 728
;728:			trap_SendServerCommand( -1, va("print \"server: %s\n\"", ConcatArgs(1) ) );
CNSTI4 1
ARGI4
ADDRLP4 1072
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $447
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 729
;729:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $444
line 732
;730:		}
;731:		// everything else will also be printed as a say command
;732:		trap_SendServerCommand( -1, va("print \"server: %s\n\"", ConcatArgs(0) ) );
CNSTI4 0
ARGI4
ADDRLP4 1072
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $447
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 733
;733:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $441
line 736
;734:	}
;735:
;736:	return qfalse;
CNSTI4 0
RETI4
LABELV $406
endproc ConsoleCommand 1080 12
import ConcatArgs
bss
align 4
LABELV numIPFilters
skip 4
align 4
LABELV ipFilters
skip 8192
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
LABELV $447
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $446
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $440
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $439
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $436
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $433
byte 1 97
byte 1 100
byte 1 100
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $430
byte 1 98
byte 1 111
byte 1 116
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $427
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $424
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 104
byte 1 97
byte 1 118
byte 1 105
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $421
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $418
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $415
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $412
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $409
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $405
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $391
byte 1 100
byte 1 111
byte 1 110
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $386
byte 1 10
byte 1 115
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 50
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 32
byte 1 40
byte 1 114
byte 1 101
byte 1 97
byte 1 108
byte 1 118
byte 1 97
byte 1 114
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $381
byte 1 10
byte 1 115
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 50
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 32
byte 1 40
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 117
byte 1 110
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $380
byte 1 37
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
byte 1 32
byte 1 115
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 32
byte 1 50
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 60
byte 1 60
byte 1 32
byte 1 50
byte 1 52
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 44
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 60
byte 1 60
byte 1 32
byte 1 50
byte 1 52
byte 1 32
byte 1 37
byte 1 117
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 105
byte 1 110
byte 1 116
byte 1 44
byte 1 32
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 60
byte 1 60
byte 1 32
byte 1 50
byte 1 52
byte 1 32
byte 1 37
byte 1 117
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 105
byte 1 110
byte 1 116
byte 1 44
byte 1 32
byte 1 115
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 62
byte 1 62
byte 1 32
byte 1 50
byte 1 52
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 117
byte 1 44
byte 1 32
byte 1 115
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 62
byte 1 62
byte 1 32
byte 1 50
byte 1 52
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $375
byte 1 10
byte 1 115
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 50
byte 1 98
byte 1 121
byte 1 116
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $374
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 50
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 102
byte 1 108
byte 1 111
byte 1 97
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 102
byte 1 44
byte 1 32
byte 1 40
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 102
byte 1 108
byte 1 111
byte 1 97
byte 1 116
byte 1 41
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $369
byte 1 10
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 50
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $368
byte 1 10
byte 1 83
byte 1 118
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 78
byte 1 117
byte 1 109
byte 1 66
byte 1 101
byte 1 104
byte 1 97
byte 1 118
byte 1 105
byte 1 111
byte 1 114
byte 1 95
byte 1 102
byte 1 32
byte 1 40
byte 1 86
byte 1 77
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $367
byte 1 117
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $364
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $357
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $347
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $344
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $336
byte 1 10
byte 1 0
align 1
LABELV $335
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $331
byte 1 37
byte 1 51
byte 1 105
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
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $330
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 80
byte 1 76
byte 1 69
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
byte 1 0
align 1
LABELV $328
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 86
byte 1 73
byte 1 83
byte 1 73
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $326
byte 1 69
byte 1 84
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 0
align 1
LABELV $324
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 85
byte 1 83
byte 1 72
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $322
byte 1 69
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 69
byte 1 65
byte 1 75
byte 1 69
byte 1 82
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
byte 1 0
align 1
LABELV $320
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 65
byte 1 76
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
byte 1 0
align 1
LABELV $318
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 69
byte 1 65
byte 1 77
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
byte 1 0
align 1
LABELV $316
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 86
byte 1 69
byte 1 82
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
byte 1 0
align 1
LABELV $314
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
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
byte 1 0
align 1
LABELV $312
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
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
byte 1 0
align 1
LABELV $310
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
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
byte 1 0
align 1
LABELV $308
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
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
byte 1 0
align 1
LABELV $303
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 0
align 1
LABELV $296
byte 1 10
byte 1 76
byte 1 111
byte 1 103
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $285
byte 1 84
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 47
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $283
byte 1 76
byte 1 111
byte 1 103
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 47
byte 1 37
byte 1 105
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $273
byte 1 78
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 47
byte 1 37
byte 1 105
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $264
byte 1 68
byte 1 105
byte 1 100
byte 1 110
byte 1 39
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
byte 1 10
byte 1 0
align 1
LABELV $263
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $251
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 32
byte 1 115
byte 1 118
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 105
byte 1 112
byte 1 32
byte 1 60
byte 1 105
byte 1 112
byte 1 45
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $247
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 105
byte 1 112
byte 1 32
byte 1 60
byte 1 105
byte 1 112
byte 1 45
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $229
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 112
byte 1 111
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 44
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 110
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 102
byte 1 44
byte 1 32
byte 1 110
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $210
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 120
byte 1 32
byte 1 121
byte 1 32
byte 1 122
byte 1 32
byte 1 120
byte 1 32
byte 1 121
byte 1 32
byte 1 122
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 91
byte 1 48
byte 1 93
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 91
byte 1 49
byte 1 93
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 91
byte 1 50
byte 1 93
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 115
byte 1 91
byte 1 48
byte 1 93
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 115
byte 1 91
byte 1 49
byte 1 93
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 115
byte 1 91
byte 1 50
byte 1 93
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 105
byte 1 115
byte 1 101
byte 1 40
byte 1 48
byte 1 32
byte 1 49
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $189
byte 1 73
byte 1 80
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $149
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 0
align 1
LABELV $148
byte 1 37
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $130
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
