export Team_InitGame
code
proc Team_InitGame 4 12
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_team.c"
line 22
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:#include "bg_saga.h"
;6:
;7:
;8:typedef struct teamgame_s {
;9:	float			last_flag_capture;
;10:	int				last_capture_team;
;11:	flagStatus_t	redStatus;	// CTF
;12:	flagStatus_t	blueStatus;	// CTF
;13:	flagStatus_t	flagStatus;	// One Flag CTF
;14:	int				redTakenTime;
;15:	int				blueTakenTime;
;16:} teamgame_t;
;17:
;18:teamgame_t teamgame;
;19:
;20:void Team_SetFlagStatus( int team, flagStatus_t status );
;21:
;22:void Team_InitGame( void ) {
line 23
;23:	memset(&teamgame, 0, sizeof teamgame);
ADDRGP4 teamgame
ARGP4
CNSTI4 0
ARGI4
CNSTU4 28
ARGU4
ADDRGP4 memset
CALLP4
pop
line 25
;24:
;25:	switch( g_gametype.integer ) {
ADDRLP4 0
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 7
EQI4 $124
ADDRLP4 0
INDIRI4
CNSTI4 8
EQI4 $124
ADDRGP4 $122
JUMPV
LABELV $124
line 29
;26:	case GT_CTF:
;27:	case GT_CTY:
;28:		// Initialize the status for both flags
;29:		teamgame.redStatus = FLAG_ATBASE;
ADDRGP4 teamgame+8
CNSTI4 0
ASGNI4
line 30
;30:		teamgame.blueStatus = FLAG_DROPPED; // DROPPED, so Team_SetFlagStatus updates the configstring
ADDRGP4 teamgame+12
CNSTI4 4
ASGNI4
line 32
;31:
;32:		Team_SetFlagStatus( TEAM_BLUE, FLAG_ATBASE );
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 33
;33:		break;
line 35
;34:	default:
;35:		break;
LABELV $122
line 37
;36:	}
;37:}
LABELV $120
endproc Team_InitGame 4 12
export OtherTeam
proc OtherTeam 0 0
line 39
;38:
;39:team_t OtherTeam(team_t team) {
line 40
;40:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $128
line 41
;41:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $127
JUMPV
LABELV $128
line 42
;42:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $130
line 43
;43:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $127
JUMPV
LABELV $130
line 44
;44:	return team;
ADDRFP4 0
INDIRI4
RETI4
LABELV $127
endproc OtherTeam 0 0
export TeamName
proc TeamName 0 0
line 47
;45:}
;46:
;47:const char *TeamName(team_t team)  {
line 48
;48:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $133
line 49
;49:		return "RED";
ADDRGP4 $135
RETP4
ADDRGP4 $132
JUMPV
LABELV $133
line 50
;50:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $136
line 51
;51:		return "BLUE";
ADDRGP4 $138
RETP4
ADDRGP4 $132
JUMPV
LABELV $136
line 52
;52:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $139
line 53
;53:		return "SPECTATOR";
ADDRGP4 $141
RETP4
ADDRGP4 $132
JUMPV
LABELV $139
line 54
;54:	return "FREE";
ADDRGP4 $142
RETP4
LABELV $132
endproc TeamName 0 0
export OtherTeamName
proc OtherTeamName 0 0
line 57
;55:}
;56:
;57:const char *OtherTeamName(team_t team) {
line 58
;58:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $144
line 59
;59:		return "BLUE";
ADDRGP4 $138
RETP4
ADDRGP4 $143
JUMPV
LABELV $144
line 60
;60:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $146
line 61
;61:		return "RED";
ADDRGP4 $135
RETP4
ADDRGP4 $143
JUMPV
LABELV $146
line 62
;62:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $148
line 63
;63:		return "SPECTATOR";
ADDRGP4 $141
RETP4
ADDRGP4 $143
JUMPV
LABELV $148
line 64
;64:	return "FREE";
ADDRGP4 $142
RETP4
LABELV $143
endproc OtherTeamName 0 0
export TeamColorString
proc TeamColorString 0 0
line 67
;65:}
;66:
;67:const char *TeamColorString(team_t team) {
line 68
;68:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $151
line 69
;69:		return S_COLOR_RED;
ADDRGP4 $153
RETP4
ADDRGP4 $150
JUMPV
LABELV $151
line 70
;70:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $154
line 71
;71:		return S_COLOR_BLUE;
ADDRGP4 $156
RETP4
ADDRGP4 $150
JUMPV
LABELV $154
line 72
;72:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $157
line 73
;73:		return S_COLOR_YELLOW;
ADDRGP4 $159
RETP4
ADDRGP4 $150
JUMPV
LABELV $157
line 74
;74:	return S_COLOR_WHITE;
ADDRGP4 $160
RETP4
LABELV $150
endproc TeamColorString 0 0
export PrintCTFMessage
proc PrintCTFMessage 12 8
line 103
;75:}
;76:
;77:// NULL for everyone
;78:/*
;79:void QDECL PrintMsg( gentity_t *ent, const char *fmt, ... ) {
;80:	char		msg[1024];
;81:	va_list		argptr;
;82:	char		*p;
;83:	
;84:	va_start (argptr,fmt);
;85:	if (Q_vsnprintf (msg, sizeof(msg), fmt, argptr) > sizeof(msg)) {
;86:		G_Error ( "PrintMsg overrun" );
;87:	}
;88:	va_end (argptr);
;89:
;90:	// double quotes are bad
;91:	while ((p = strchr(msg, '"')) != NULL)
;92:		*p = '\'';
;93:
;94:	trap_SendServerCommand ( ( (ent == NULL) ? -1 : ent-g_entities ), va("print \"%s\"", msg ));
;95:}
;96:*/
;97://Printing messages to players via this method is no longer done, StripEd stuff is client only.
;98:
;99:
;100://plIndex used to print pl->client->pers.netname
;101://teamIndex used to print team name
;102:gentity_t* PrintCTFMessage(int plIndex, int teamIndex, int ctfMessage)
;103:{
line 106
;104:	gentity_t *te;
;105:
;106:	if (plIndex == -1)
ADDRFP4 0
INDIRI4
CNSTI4 -1
NEI4 $162
line 107
;107:	{
line 108
;108:		plIndex = MAX_CLIENTS+1;
ADDRFP4 0
CNSTI4 33
ASGNI4
line 109
;109:	}
LABELV $162
line 110
;110:	if (teamIndex == -1)
ADDRFP4 4
INDIRI4
CNSTI4 -1
NEI4 $164
line 111
;111:	{
line 112
;112:		teamIndex = 50;
ADDRFP4 4
CNSTI4 50
ASGNI4
line 113
;113:	}
LABELV $164
line 115
;114:
;115:	te = G_TempEntity(vec3_origin, EV_CTFMESSAGE);
ADDRGP4 vec3_origin
ARGP4
CNSTI4 87
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 116
;116:	te->r.svFlags |= SVF_BROADCAST;
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
line 117
;117:	te->s.eventParm = ctfMessage;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 118
;118:	te->s.trickedentindex = plIndex;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 119
;119:	if (ctfMessage == CTFMESSAGE_PLAYER_CAPTURED_FLAG)
ADDRFP4 8
INDIRI4
CNSTI4 3
NEI4 $166
line 120
;120:	{
line 121
;121:		if (teamIndex == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $168
line 122
;122:		{
line 123
;123:			te->s.trickedentindex2 = TEAM_BLUE;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 2
ASGNI4
line 124
;124:		}
ADDRGP4 $167
JUMPV
LABELV $168
line 126
;125:		else
;126:		{
line 127
;127:			te->s.trickedentindex2 = TEAM_RED;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 1
ASGNI4
line 128
;128:		}
line 129
;129:	}
ADDRGP4 $167
JUMPV
LABELV $166
line 131
;130:	else
;131:	{
line 132
;132:		te->s.trickedentindex2 = teamIndex;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 133
;133:	}
LABELV $167
line 135
;134:
;135:	return te;
ADDRLP4 0
INDIRP4
RETP4
LABELV $161
endproc PrintCTFMessage 12 8
export AddTeamScore
proc AddTeamScore 16 8
line 146
;136:}
;137:
;138:/*
;139:==============
;140:AddTeamScore
;141:
;142: used for gametype > GT_TEAM
;143: for gametype GT_TEAM the level.teamScores is updated in AddScore in g_combat.c
;144:==============
;145:*/
;146:void AddTeamScore(vec3_t origin, int team, int score) {
line 149
;147:	gentity_t	*te;
;148:
;149:	te = G_TempEntity(origin, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 68
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 150
;150:	te->r.svFlags |= SVF_BROADCAST;
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
line 152
;151:
;152:	if ( team == TEAM_RED ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $171
line 153
;153:		if ( level.teamScores[ TEAM_RED ] + score == level.teamScores[ TEAM_BLUE ] ) {
ADDRGP4 level+52+4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+52+8
INDIRI4
NEI4 $173
line 155
;154:			//teams are tied sound
;155:			te->s.eventParm = GTS_TEAMS_ARE_TIED;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 10
ASGNI4
line 156
;156:		}
ADDRGP4 $172
JUMPV
LABELV $173
line 157
;157:		else if ( level.teamScores[ TEAM_RED ] <= level.teamScores[ TEAM_BLUE ] &&
ADDRGP4 level+52+4
INDIRI4
ADDRGP4 level+52+8
INDIRI4
GTI4 $179
ADDRGP4 level+52+4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+52+8
INDIRI4
LEI4 $179
line 158
;158:					level.teamScores[ TEAM_RED ] + score > level.teamScores[ TEAM_BLUE ]) {
line 160
;159:			// red took the lead sound
;160:			te->s.eventParm = GTS_REDTEAM_TOOK_LEAD;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 8
ASGNI4
line 161
;161:		}
ADDRGP4 $172
JUMPV
LABELV $179
line 162
;162:		else {
line 164
;163:			// red scored sound
;164:			te->s.eventParm = GTS_REDTEAM_SCORED;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 6
ASGNI4
line 165
;165:		}
line 166
;166:	}
ADDRGP4 $172
JUMPV
LABELV $171
line 167
;167:	else {
line 168
;168:		if ( level.teamScores[ TEAM_BLUE ] + score == level.teamScores[ TEAM_RED ] ) {
ADDRGP4 level+52+8
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+52+4
INDIRI4
NEI4 $189
line 170
;169:			//teams are tied sound
;170:			te->s.eventParm = GTS_TEAMS_ARE_TIED;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 10
ASGNI4
line 171
;171:		}
ADDRGP4 $190
JUMPV
LABELV $189
line 172
;172:		else if ( level.teamScores[ TEAM_BLUE ] <= level.teamScores[ TEAM_RED ] &&
ADDRGP4 level+52+8
INDIRI4
ADDRGP4 level+52+4
INDIRI4
GTI4 $195
ADDRGP4 level+52+8
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+52+4
INDIRI4
LEI4 $195
line 173
;173:					level.teamScores[ TEAM_BLUE ] + score > level.teamScores[ TEAM_RED ]) {
line 175
;174:			// blue took the lead sound
;175:			te->s.eventParm = GTS_BLUETEAM_TOOK_LEAD;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 9
ASGNI4
line 176
;176:		}
ADDRGP4 $196
JUMPV
LABELV $195
line 177
;177:		else {
line 179
;178:			// blue scored sound
;179:			te->s.eventParm = GTS_BLUETEAM_SCORED;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 7
ASGNI4
line 180
;180:		}
LABELV $196
LABELV $190
line 181
;181:	}
LABELV $172
line 182
;182:	level.teamScores[ team ] += score;
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+52
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 183
;183:}
LABELV $170
endproc AddTeamScore 16 8
export OnSameTeam
proc OnSameTeam 24 0
line 190
;184:
;185:/*
;186:==============
;187:OnSameTeam
;188:==============
;189:*/
;190:qboolean OnSameTeam( gentity_t *ent1, gentity_t *ent2 ) {
line 191
;191:	if ( !ent1->client || !ent2->client ) {
ADDRLP4 0
CNSTI4 408
ASGNI4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $209
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $207
LABELV $209
line 192
;192:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $207
line 195
;193:	}
;194:
;195:	if (g_gametype.integer == GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $210
line 196
;196:	{
line 197
;197:		qboolean ent1IsBot = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 198
;198:		qboolean ent2IsBot = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 200
;199:
;200:		if (ent1->r.svFlags & SVF_BOT)
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $213
line 201
;201:		{
line 202
;202:			ent1IsBot = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 203
;203:		}
LABELV $213
line 204
;204:		if (ent2->r.svFlags & SVF_BOT)
ADDRFP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $215
line 205
;205:		{
line 206
;206:			ent2IsBot = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 207
;207:		}
LABELV $215
line 209
;208:
;209:		if ((ent1IsBot && ent2IsBot) || (!ent1IsBot && !ent2IsBot))
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $220
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $219
LABELV $220
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $217
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $217
LABELV $219
line 210
;210:		{
line 211
;211:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $206
JUMPV
LABELV $217
line 213
;212:		}
;213:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $210
line 216
;214:	}
;215:
;216:	if ( g_gametype.integer < GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
GEI4 $221
line 217
;217:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $206
JUMPV
LABELV $221
line 220
;218:	}
;219:
;220:	if ( ent1->client->sess.sessionTeam == ent2->client->sess.sessionTeam ) {
ADDRLP4 8
CNSTI4 408
ASGNI4
ADDRLP4 12
CNSTI4 43440
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
NEI4 $224
line 221
;221:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $206
JUMPV
LABELV $224
line 224
;222:	}
;223:
;224:	return qfalse;
CNSTI4 0
RETI4
LABELV $206
endproc OnSameTeam 24 0
data
align 1
LABELV ctfFlagStatusRemap
byte 1 48
byte 1 49
byte 1 42
byte 1 42
byte 1 50
export Team_SetFlagStatus
code
proc Team_SetFlagStatus 12 8
line 230
;225:}
;226:
;227:
;228:static char ctfFlagStatusRemap[] = { '0', '1', '*', '*', '2' };
;229:
;230:void Team_SetFlagStatus( int team, flagStatus_t status ) {
line 231
;231:	qboolean modified = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 233
;232:
;233:	switch( team ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $239
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $229
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $234
ADDRGP4 $227
JUMPV
LABELV $229
line 235
;234:	case TEAM_RED:	// CTF
;235:		if( teamgame.redStatus != status ) {
ADDRGP4 teamgame+8
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $228
line 236
;236:			teamgame.redStatus = status;
ADDRGP4 teamgame+8
ADDRFP4 4
INDIRI4
ASGNI4
line 237
;237:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 238
;238:		}
line 239
;239:		break;
ADDRGP4 $228
JUMPV
LABELV $234
line 242
;240:
;241:	case TEAM_BLUE:	// CTF
;242:		if( teamgame.blueStatus != status ) {
ADDRGP4 teamgame+12
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $228
line 243
;243:			teamgame.blueStatus = status;
ADDRGP4 teamgame+12
ADDRFP4 4
INDIRI4
ASGNI4
line 244
;244:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 245
;245:		}
line 246
;246:		break;
ADDRGP4 $228
JUMPV
LABELV $239
line 249
;247:
;248:	case TEAM_FREE:	// One Flag CTF
;249:		if( teamgame.flagStatus != status ) {
ADDRGP4 teamgame+16
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $228
line 250
;250:			teamgame.flagStatus = status;
ADDRGP4 teamgame+16
ADDRFP4 4
INDIRI4
ASGNI4
line 251
;251:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 252
;252:		}
line 253
;253:		break;
LABELV $227
LABELV $228
line 256
;254:	}
;255:
;256:	if( modified ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $244
line 259
;257:		char st[4];
;258:
;259:		if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $250
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $246
LABELV $250
line 260
;260:			st[0] = ctfFlagStatusRemap[teamgame.redStatus];
ADDRLP4 8
ADDRGP4 teamgame+8
INDIRI4
ADDRGP4 ctfFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 261
;261:			st[1] = ctfFlagStatusRemap[teamgame.blueStatus];
ADDRLP4 8+1
ADDRGP4 teamgame+12
INDIRI4
ADDRGP4 ctfFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 262
;262:			st[2] = 0;
ADDRLP4 8+2
CNSTI1 0
ASGNI1
line 263
;263:		}
LABELV $246
line 265
;264:
;265:		trap_SetConfigstring( CS_FLAGSTATUS, st );
CNSTI4 23
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 266
;266:	}
LABELV $244
line 267
;267:}
LABELV $226
endproc Team_SetFlagStatus 12 8
export Team_CheckDroppedItem
proc Team_CheckDroppedItem 0 8
line 269
;268:
;269:void Team_CheckDroppedItem( gentity_t *dropped ) {
line 270
;270:	if( dropped->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 4
NEI4 $256
line 271
;271:		Team_SetFlagStatus( TEAM_RED, FLAG_DROPPED );
CNSTI4 1
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 272
;272:	}
ADDRGP4 $257
JUMPV
LABELV $256
line 273
;273:	else if( dropped->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $258
line 274
;274:		Team_SetFlagStatus( TEAM_BLUE, FLAG_DROPPED );
CNSTI4 2
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 275
;275:	}
ADDRGP4 $259
JUMPV
LABELV $258
line 276
;276:	else if( dropped->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
NEI4 $260
line 277
;277:		Team_SetFlagStatus( TEAM_FREE, FLAG_DROPPED );
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 278
;278:	}
LABELV $260
LABELV $259
LABELV $257
line 279
;279:}
LABELV $255
endproc Team_CheckDroppedItem 0 8
export Team_ForceGesture
proc Team_ForceGesture 12 0
line 286
;280:
;281:/*
;282:================
;283:Team_ForceGesture
;284:================
;285:*/
;286:void Team_ForceGesture(team_t team) {
line 290
;287:	int i;
;288:	gentity_t *ent;
;289:
;290:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $263
line 291
;291:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 292
;292:		if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $267
line 293
;293:			continue;
ADDRGP4 $264
JUMPV
LABELV $267
line 294
;294:		if (!ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $269
line 295
;295:			continue;
ADDRGP4 $264
JUMPV
LABELV $269
line 296
;296:		if (ent->client->sess.sessionTeam != team)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $271
line 297
;297:			continue;
ADDRGP4 $264
JUMPV
LABELV $271
line 299
;298:		//
;299:		ent->flags |= FL_FORCE_GESTURE;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 300
;300:	}
LABELV $264
line 290
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $263
line 301
;301:}
LABELV $262
endproc Team_ForceGesture 12 0
export Team_FragBonuses
proc Team_FragBonuses 308 12
line 313
;302:
;303:/*
;304:================
;305:Team_FragBonuses
;306:
;307:Calculate the bonuses for flag defense, flag carrier defense, etc.
;308:Note that bonuses are not cumulative.  You get one, they are in importance
;309:order.
;310:================
;311:*/
;312:void Team_FragBonuses(gentity_t *targ, gentity_t *inflictor, gentity_t *attacker)
;313:{
line 319
;314:	int i;
;315:	gentity_t *ent;
;316:	int flag_pw, enemy_flag_pw;
;317:	team_t otherteam;
;318:	int tokens;
;319:	gentity_t *flag, *carrier = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 323
;320:	char *c;
;321:	vec3_t v1, v2;
;322:	int team;
;323:	int nowTime = LEVELTIME(targ->client);
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $278
ADDRLP4 80
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $278
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $280
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $281
JUMPV
LABELV $280
ADDRLP4 76
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $281
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
ADDRGP4 $279
JUMPV
LABELV $278
ADDRLP4 72
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $279
ADDRLP4 64
ADDRLP4 72
INDIRI4
ASGNI4
line 324
;324:	int nowTimeAttacker = LEVELTIME(attacker->client);
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $286
ADDRLP4 92
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $286
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $288
ADDRLP4 88
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $289
JUMPV
LABELV $288
ADDRLP4 88
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $289
ADDRLP4 84
ADDRLP4 88
INDIRI4
ASGNI4
ADDRGP4 $287
JUMPV
LABELV $286
ADDRLP4 84
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $287
ADDRLP4 52
ADDRLP4 84
INDIRI4
ASGNI4
line 327
;325:
;326:	// no bonus for fragging yourself or team mates
;327:	if (!targ->client || !attacker->client || targ == attacker || OnSameTeam(targ, attacker))
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
CNSTI4 408
ASGNI4
ADDRLP4 104
CNSTU4 0
ASGNU4
ADDRLP4 96
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 104
INDIRU4
EQU4 $294
ADDRLP4 108
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 104
INDIRU4
EQU4 $294
ADDRLP4 96
INDIRP4
CVPU4 4
ADDRLP4 108
INDIRP4
CVPU4 4
EQU4 $294
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $290
LABELV $294
line 328
;328:		return;
ADDRGP4 $273
JUMPV
LABELV $290
line 330
;329:
;330:	team = targ->client->sess.sessionTeam;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 331
;331:	otherteam = OtherTeam(targ->client->sess.sessionTeam);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 116
INDIRI4
ASGNI4
line 332
;332:	if (otherteam == targ->client->sess.sessionTeam)
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
NEI4 $295
line 333
;333:		return; // whoever died isn't on a team
ADDRGP4 $273
JUMPV
LABELV $295
line 336
;334:
;335:	// same team, if the flag at base, check to he has the enemy flag
;336:	if (team == TEAM_RED) {
ADDRLP4 56
INDIRI4
CNSTI4 1
NEI4 $297
line 337
;337:		flag_pw = PW_REDFLAG;
ADDRLP4 16
CNSTI4 4
ASGNI4
line 338
;338:		enemy_flag_pw = PW_BLUEFLAG;
ADDRLP4 68
CNSTI4 5
ASGNI4
line 339
;339:	} else {
ADDRGP4 $298
JUMPV
LABELV $297
line 340
;340:		flag_pw = PW_BLUEFLAG;
ADDRLP4 16
CNSTI4 5
ASGNI4
line 341
;341:		enemy_flag_pw = PW_REDFLAG;
ADDRLP4 68
CNSTI4 4
ASGNI4
line 342
;342:	}
LABELV $298
line 345
;343:
;344:	// did the attacker frag the flag carrier?
;345:	tokens = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 346
;346:	if (targ->client->ps.powerups[enemy_flag_pw]) {
ADDRLP4 68
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $299
line 347
;347:		attacker->client->pers.teamState.lastfraggedcarrier = nowTimeAttacker;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
ADDRLP4 52
INDIRI4
CVIF4 4
ASGNF4
line 348
;348:		AddScore(attacker, targ->r.currentOrigin, CTF_FRAG_CARRIER_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 349
;349:		attacker->client->pers.teamState.fragcarrier++;
ADDRLP4 120
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1664
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 352
;350:		//PrintMsg(NULL, "%s" S_COLOR_WHITE " fragged %s's flag carrier!\n",
;351:		//	attacker->client->pers.netname, TeamName(team));
;352:		PrintCTFMessage(attacker->s.number, team, CTFMESSAGE_FRAGGED_FLAG_CARRIER);
ADDRFP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PrintCTFMessage
CALLP4
pop
line 356
;353:
;354:		// the target had the flag, clear the hurt carrier
;355:		// field on the other team
;356:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $304
JUMPV
LABELV $301
line 357
;357:			ent = g_entities + i;
ADDRLP4 12
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 358
;358:			if (ent->inuse && ent->client->sess.sessionTeam == otherteam)
ADDRLP4 12
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $306
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $306
line 359
;359:				ent->client->pers.teamState.lasthurtcarrier = 0;
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
CNSTF4 0
ASGNF4
LABELV $306
line 360
;360:		}
LABELV $302
line 356
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $304
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $301
line 361
;361:		return;
ADDRGP4 $273
JUMPV
LABELV $299
line 365
;362:	}
;363:
;364:	// did the attacker frag a head carrier? other->client->ps.generic1
;365:	if (tokens) {
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $308
line 366
;366:		attacker->client->pers.teamState.lastfraggedcarrier = nowTimeAttacker;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
ADDRLP4 52
INDIRI4
CVIF4 4
ASGNF4
line 367
;367:		AddScore(attacker, targ->r.currentOrigin, CTF_FRAG_CARRIER_BONUS * tokens * tokens);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 20
ADDRLP4 60
INDIRI4
MULI4
ADDRLP4 60
INDIRI4
MULI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 368
;368:		attacker->client->pers.teamState.fragcarrier++;
ADDRLP4 124
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1664
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 374
;369:		//PrintMsg(NULL, "%s" S_COLOR_WHITE " fragged %s's skull carrier!\n",
;370:		//	attacker->client->pers.netname, TeamName(team));
;371:
;372:		// the target had the flag, clear the hurt carrier
;373:		// field on the other team
;374:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $313
JUMPV
LABELV $310
line 375
;375:			ent = g_entities + i;
ADDRLP4 12
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 376
;376:			if (ent->inuse && ent->client->sess.sessionTeam == otherteam)
ADDRLP4 12
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $315
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $315
line 377
;377:				ent->client->pers.teamState.lasthurtcarrier = 0;
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
CNSTF4 0
ASGNF4
LABELV $315
line 378
;378:		}
LABELV $311
line 374
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $313
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $310
line 379
;379:		return;
ADDRGP4 $273
JUMPV
LABELV $308
line 382
;380:	}
;381:
;382:	if (targ->client->pers.teamState.lasthurtcarrier &&
ADDRLP4 120
CNSTI4 408
ASGNI4
ADDRLP4 124
ADDRFP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
INDIRF4
ASGNF4
ADDRLP4 124
INDIRF4
CNSTF4 0
EQF4 $317
ADDRLP4 64
INDIRI4
CVIF4 4
ADDRLP4 124
INDIRF4
SUBF4
CNSTF4 1174011904
GEF4 $317
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $317
line 384
;383:		nowTime - targ->client->pers.teamState.lasthurtcarrier < CTF_CARRIER_DANGER_PROTECT_TIMEOUT &&
;384:		!attacker->client->ps.powerups[flag_pw]) {
line 387
;385:		// attacker is on the same team as the flag carrier and
;386:		// fragged a guy who hurt our flag carrier
;387:		AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_DANGER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 389
;388:
;389:		attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 128
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1656
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 390
;390:		targ->client->pers.teamState.lasthurtcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
CNSTF4 0
ASGNF4
line 392
;391:
;392:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 393
;393:		team = attacker->client->sess.sessionTeam;
ADDRLP4 56
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 395
;394:		// add the sprite over the player's head
;395:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 136
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 396
;396:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 140
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 397
;397:		attacker->client->rewardTime = nowTimeAttacker + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43708
ADDP4
ADDRLP4 52
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 399
;398:
;399:		return;
ADDRGP4 $273
JUMPV
LABELV $317
line 403
;400:	}
;401:
;402:	// uh this is the same as above?
;403:	if (targ->client->pers.teamState.lasthurtcarrier &&
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
INDIRF4
ASGNF4
ADDRLP4 128
INDIRF4
CNSTF4 0
EQF4 $319
ADDRLP4 64
INDIRI4
CVIF4 4
ADDRLP4 128
INDIRF4
SUBF4
CNSTF4 1174011904
GEF4 $319
line 404
;404:		nowTime - targ->client->pers.teamState.lasthurtcarrier < CTF_CARRIER_DANGER_PROTECT_TIMEOUT) {
line 406
;405:		// attacker is on the same team as the skull carrier and
;406:		AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_DANGER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 408
;407:
;408:		attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1656
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 409
;409:		targ->client->pers.teamState.lasthurtcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
CNSTF4 0
ASGNF4
line 411
;410:
;411:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 136
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 412
;412:		team = attacker->client->sess.sessionTeam;
ADDRLP4 56
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 414
;413:		// add the sprite over the player's head
;414:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 140
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 415
;415:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 144
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 416
;416:		attacker->client->rewardTime = nowTimeAttacker + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43708
ADDP4
ADDRLP4 52
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 418
;417:
;418:		return;
ADDRGP4 $273
JUMPV
LABELV $319
line 426
;419:	}
;420:
;421:	// flag and flag carrier area defense bonuses
;422:
;423:	// we have to find the flag and carrier entities
;424:
;425:	// find the flag
;426:	switch (attacker->client->sess.sessionTeam) {
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 1
EQI4 $324
ADDRLP4 132
INDIRI4
CNSTI4 2
EQI4 $326
ADDRGP4 $273
JUMPV
LABELV $324
line 428
;427:	case TEAM_RED:
;428:		c = "team_CTF_redflag";
ADDRLP4 24
ADDRGP4 $325
ASGNP4
line 429
;429:		break;
ADDRGP4 $322
JUMPV
LABELV $326
line 431
;430:	case TEAM_BLUE:
;431:		c = "team_CTF_blueflag";
ADDRLP4 24
ADDRGP4 $327
ASGNP4
line 432
;432:		break;		
line 434
;433:	default:
;434:		return;
LABELV $322
line 437
;435:	}
;436:	// find attacker's team's flag carrier
;437:	for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $331
JUMPV
LABELV $328
line 438
;438:		carrier = g_entities + i;
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 439
;439:		if (carrier->inuse && carrier->client->ps.powerups[flag_pw])
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
EQI4 $333
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
EQI4 $333
line 440
;440:			break;
ADDRGP4 $330
JUMPV
LABELV $333
line 441
;441:		carrier = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 442
;442:	}
LABELV $329
line 437
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $331
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $328
LABELV $330
line 443
;443:	flag = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRGP4 $336
JUMPV
LABELV $335
line 444
;444:	while ((flag = G_FindByClassNameFast(flag, c)) != NULL) {
line 445
;445:		if (!(flag->flags & FL_DROPPED_ITEM))
ADDRLP4 8
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $338
line 446
;446:			break;
ADDRGP4 $337
JUMPV
LABELV $338
line 447
;447:	}
LABELV $336
line 444
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 140
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $335
LABELV $337
line 449
;448:
;449:	if (!flag)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $340
line 450
;450:		return; // can't find attacker's flag
ADDRGP4 $273
JUMPV
LABELV $340
line 455
;451:
;452:	// ok we have the attackers flag and a pointer to the carrier
;453:
;454:	// check to see if we are defending the base's flag
;455:	VectorSubtract(targ->r.currentOrigin, flag->r.currentOrigin, v1);
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
CNSTI4 368
ASGNI4
ADDRLP4 28
ADDRLP4 144
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 156
CNSTI4 372
ASGNI4
ADDRLP4 28+4
ADDRLP4 144
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160
CNSTI4 376
ASGNI4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 456
;456:	VectorSubtract(attacker->r.currentOrigin, flag->r.currentOrigin, v2);
ADDRLP4 164
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 168
CNSTI4 368
ASGNI4
ADDRLP4 40
ADDRLP4 164
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 176
CNSTI4 372
ASGNI4
ADDRLP4 40+4
ADDRLP4 164
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 180
CNSTI4 376
ASGNI4
ADDRLP4 40+8
ADDRFP4 8
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 458
;457:
;458:	if ( ( ( VectorLength(v1) < CTF_TARGET_PROTECT_RADIUS &&
ADDRLP4 28
ARGP4
ADDRLP4 184
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 184
INDIRF4
CNSTF4 1148846080
GEF4 $349
ADDRLP4 188
CNSTI4 368
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 188
INDIRI4
ADDP4
ARGP4
ADDRLP4 192
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
NEI4 $348
LABELV $349
ADDRLP4 40
ARGP4
ADDRLP4 196
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 196
INDIRF4
CNSTF4 1148846080
GEF4 $346
ADDRLP4 200
CNSTI4 368
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
ARGP4
ADDRLP4 204
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $346
LABELV $348
ADDRLP4 208
CNSTI4 408
ASGNI4
ADDRLP4 212
CNSTI4 43440
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRI4
EQI4 $346
line 462
;459:		trap_InPVS(flag->r.currentOrigin, targ->r.currentOrigin ) ) ||
;460:		( VectorLength(v2) < CTF_TARGET_PROTECT_RADIUS &&
;461:		trap_InPVS(flag->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;462:		attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam) {
line 465
;463:
;464:		// we defended the base flag
;465:		AddScore(attacker, targ->r.currentOrigin, CTF_FLAG_DEFENSE_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 466
;466:		attacker->client->pers.teamState.basedefense++;
ADDRLP4 216
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1652
ADDP4
ASGNP4
ADDRLP4 216
INDIRP4
ADDRLP4 216
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 468
;467:
;468:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 220
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 220
INDIRP4
ADDRLP4 220
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 470
;469:		// add the sprite over the player's head
;470:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 224
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 224
INDIRP4
ADDRLP4 224
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 471
;471:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 228
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
ADDRLP4 228
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 472
;472:		attacker->client->rewardTime = nowTimeAttacker + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43708
ADDP4
ADDRLP4 52
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 474
;473:
;474:		return;
ADDRGP4 $273
JUMPV
LABELV $346
line 477
;475:	}
;476:
;477:	if (carrier && carrier != attacker) {
ADDRLP4 216
ADDRLP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 216
INDIRU4
CNSTU4 0
EQU4 $350
ADDRLP4 216
INDIRU4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $350
line 478
;478:		VectorSubtract(targ->r.currentOrigin, carrier->r.currentOrigin, v1);
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
CNSTI4 368
ASGNI4
ADDRLP4 28
ADDRLP4 220
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 232
CNSTI4 372
ASGNI4
ADDRLP4 28+4
ADDRLP4 220
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 236
CNSTI4 376
ASGNI4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
ADDRLP4 236
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 236
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 479
;479:		VectorSubtract(attacker->r.currentOrigin, carrier->r.currentOrigin, v1);
ADDRLP4 240
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 244
CNSTI4 368
ASGNI4
ADDRLP4 28
ADDRLP4 240
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 252
CNSTI4 372
ASGNI4
ADDRLP4 28+4
ADDRLP4 240
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 256
CNSTI4 376
ASGNI4
ADDRLP4 28+8
ADDRFP4 8
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 481
;480:
;481:		if ( ( ( VectorLength(v1) < CTF_ATTACKER_PROTECT_RADIUS &&
ADDRLP4 28
ARGP4
ADDRLP4 260
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 260
INDIRF4
CNSTF4 1148846080
GEF4 $359
ADDRLP4 264
CNSTI4 368
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 264
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 264
INDIRI4
ADDP4
ARGP4
ADDRLP4 268
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $358
LABELV $359
ADDRLP4 40
ARGP4
ADDRLP4 272
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 272
INDIRF4
CNSTF4 1148846080
GEF4 $356
ADDRLP4 276
CNSTI4 368
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 276
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 276
INDIRI4
ADDP4
ARGP4
ADDRLP4 280
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $356
LABELV $358
ADDRLP4 284
CNSTI4 408
ASGNI4
ADDRLP4 288
CNSTI4 43440
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 284
INDIRI4
ADDP4
INDIRP4
ADDRLP4 288
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 284
INDIRI4
ADDP4
INDIRP4
ADDRLP4 288
INDIRI4
ADDP4
INDIRI4
EQI4 $356
line 485
;482:			trap_InPVS(carrier->r.currentOrigin, targ->r.currentOrigin ) ) ||
;483:			( VectorLength(v2) < CTF_ATTACKER_PROTECT_RADIUS &&
;484:				trap_InPVS(carrier->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;485:			attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam) {
line 486
;486:			AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 487
;487:			attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 292
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1656
ADDP4
ASGNP4
ADDRLP4 292
INDIRP4
ADDRLP4 292
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 489
;488:
;489:			attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 296
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 296
INDIRP4
ADDRLP4 296
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 491
;490:			// add the sprite over the player's head
;491:			attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 300
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 300
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 492
;492:			attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 304
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 304
INDIRP4
ADDRLP4 304
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 493
;493:			attacker->client->rewardTime = nowTimeAttacker + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43708
ADDP4
ADDRLP4 52
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 495
;494:
;495:			return;
LABELV $356
line 497
;496:		}
;497:	}
LABELV $350
line 498
;498:}
LABELV $273
endproc Team_FragBonuses 308 12
export Team_CheckHurtCarrier
proc Team_CheckHurtCarrier 60 0
line 509
;499:
;500:/*
;501:================
;502:Team_CheckHurtCarrier
;503:
;504:Check to see if attacker hurt the flag carrier.  Needed when handing out bonuses for assistance to flag
;505:carrier defense.
;506:================
;507:*/
;508:void Team_CheckHurtCarrier(gentity_t *targ, gentity_t *attacker)
;509:{
line 512
;510:	int flag_pw;
;511:
;512:	if (!targ->client || !attacker->client)
ADDRLP4 4
CNSTI4 408
ASGNI4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $363
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $361
LABELV $363
line 513
;513:		return;
ADDRGP4 $360
JUMPV
LABELV $361
line 515
;514:
;515:	if (targ->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $364
line 516
;516:		flag_pw = PW_BLUEFLAG;
ADDRLP4 0
CNSTI4 5
ASGNI4
ADDRGP4 $365
JUMPV
LABELV $364
line 518
;517:	else
;518:		flag_pw = PW_REDFLAG;
ADDRLP4 0
CNSTI4 4
ASGNI4
LABELV $365
line 521
;519:
;520:	// flags
;521:	if (targ->client->ps.powerups[flag_pw] &&
ADDRLP4 12
CNSTI4 408
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $366
ADDRLP4 20
CNSTI4 43440
ASGNI4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $366
line 523
;522:		targ->client->sess.sessionTeam != attacker->client->sess.sessionTeam)
;523:		attacker->client->pers.teamState.lasthurtcarrier = LEVELTIME(attacker->client);
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $372
ADDRLP4 32
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $372
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $374
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $375
JUMPV
LABELV $374
ADDRLP4 28
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $375
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $373
JUMPV
LABELV $372
ADDRLP4 24
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $373
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
ADDRLP4 24
INDIRI4
CVIF4 4
ASGNF4
LABELV $366
line 526
;524:
;525:	// skulls
;526:	if (targ->client->ps.generic1 &&
ADDRLP4 36
CNSTI4 408
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $376
ADDRLP4 44
CNSTI4 43440
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
EQI4 $376
line 528
;527:		targ->client->sess.sessionTeam != attacker->client->sess.sessionTeam)
;528:		attacker->client->pers.teamState.lasthurtcarrier = LEVELTIME(attacker->client);
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $382
ADDRLP4 56
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $382
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $384
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $385
JUMPV
LABELV $384
ADDRLP4 52
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $385
ADDRLP4 48
ADDRLP4 52
INDIRI4
ASGNI4
ADDRGP4 $383
JUMPV
LABELV $382
ADDRLP4 48
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $383
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
LABELV $376
line 529
;529:}
LABELV $360
endproc Team_CheckHurtCarrier 60 0
export Team_ResetFlag
proc Team_ResetFlag 20 8
line 532
;530:
;531:
;532:gentity_t *Team_ResetFlag( int team ) {
line 534
;533:	char *c;
;534:	gentity_t *ent, *rent = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 536
;535:
;536:	switch (team) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $391
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $389
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $390
ADDRGP4 $387
JUMPV
LABELV $389
line 538
;537:	case TEAM_RED:
;538:		c = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $325
ASGNP4
line 539
;539:		break;
ADDRGP4 $388
JUMPV
LABELV $390
line 541
;540:	case TEAM_BLUE:
;541:		c = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $327
ASGNP4
line 542
;542:		break;
ADDRGP4 $388
JUMPV
LABELV $391
line 544
;543:	case TEAM_FREE:
;544:		c = "team_CTF_neutralflag";
ADDRLP4 4
ADDRGP4 $392
ASGNP4
line 545
;545:		break;
ADDRGP4 $388
JUMPV
LABELV $387
line 547
;546:	default:
;547:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $386
JUMPV
LABELV $388
line 550
;548:	}
;549:
;550:	ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $394
JUMPV
LABELV $393
line 551
;551:	while ((ent = G_FindByClassName(ent, c)) != NULL) {
line 552
;552:		if (ent->flags & FL_DROPPED_ITEM)
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $396
line 553
;553:			G_FreeEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
ADDRGP4 $397
JUMPV
LABELV $396
line 554
;554:		else {
line 555
;555:			rent = ent;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 556
;556:			RespawnItem(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 557
;557:		}
LABELV $397
line 558
;558:	}
LABELV $394
line 551
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_FindByClassName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $393
line 560
;559:
;560:	Team_SetFlagStatus( team, FLAG_ATBASE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 562
;561:
;562:	return rent;
ADDRLP4 8
INDIRP4
RETP4
LABELV $386
endproc Team_ResetFlag 20 8
export Team_ResetFlags
proc Team_ResetFlags 0 4
line 565
;563:}
;564:
;565:void Team_ResetFlags( void ) {
line 566
;566:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $403
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $399
LABELV $403
line 567
;567:		Team_ResetFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ResetFlag
CALLP4
pop
line 568
;568:		Team_ResetFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ResetFlag
CALLP4
pop
line 569
;569:	}
LABELV $399
line 570
;570:}
LABELV $398
endproc Team_ResetFlags 0 4
export Team_ReturnFlagSound
proc Team_ReturnFlagSound 12 8
line 572
;571:
;572:void Team_ReturnFlagSound( gentity_t *ent, int team ) {
line 575
;573:	gentity_t	*te;
;574:
;575:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $405
line 576
;576:		G_Printf ("Warning:  NULL passed to Team_ReturnFlagSound\n");
ADDRGP4 $407
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 577
;577:		return;
ADDRGP4 $404
JUMPV
LABELV $405
line 580
;578:	}
;579:
;580:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 68
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 581
;581:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $408
line 582
;582:		te->s.eventParm = GTS_RED_RETURN;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 2
ASGNI4
line 583
;583:	}
ADDRGP4 $409
JUMPV
LABELV $408
line 584
;584:	else {
line 585
;585:		te->s.eventParm = GTS_BLUE_RETURN;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 3
ASGNI4
line 586
;586:	}
LABELV $409
line 587
;587:	te->r.svFlags |= SVF_BROADCAST;
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
line 588
;588:}
LABELV $404
endproc Team_ReturnFlagSound 12 8
export Team_TakeFlagSound
proc Team_TakeFlagSound 16 8
line 590
;589:
;590:void Team_TakeFlagSound( gentity_t *ent, int team ) {
line 593
;591:	gentity_t	*te;
;592:
;593:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $411
line 594
;594:		G_Printf ("Warning:  NULL passed to Team_TakeFlagSound\n");
ADDRGP4 $413
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 595
;595:		return;
ADDRGP4 $410
JUMPV
LABELV $411
line 600
;596:	}
;597:
;598:	// only play sound when the flag was at the base
;599:	// or not picked up the last 10 seconds
;600:	switch(team) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $416
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $426
ADDRGP4 $414
JUMPV
LABELV $416
line 602
;601:		case TEAM_RED:
;602:			if( teamgame.blueStatus != FLAG_ATBASE ) {
ADDRGP4 teamgame+12
INDIRI4
CNSTI4 0
EQI4 $417
line 603
;603:				if (teamgame.blueTakenTime > level.time - 10000)
ADDRGP4 teamgame+24
INDIRI4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $420
line 604
;604:					return;
ADDRGP4 $410
JUMPV
LABELV $420
line 605
;605:			}
LABELV $417
line 606
;606:			teamgame.blueTakenTime = level.time;
ADDRGP4 teamgame+24
ADDRGP4 level+36
INDIRI4
ASGNI4
line 607
;607:			break;
ADDRGP4 $415
JUMPV
LABELV $426
line 610
;608:
;609:		case TEAM_BLUE:	// CTF
;610:			if( teamgame.redStatus != FLAG_ATBASE ) {
ADDRGP4 teamgame+8
INDIRI4
CNSTI4 0
EQI4 $427
line 611
;611:				if (teamgame.redTakenTime > level.time - 10000)
ADDRGP4 teamgame+20
INDIRI4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $430
line 612
;612:					return;
ADDRGP4 $410
JUMPV
LABELV $430
line 613
;613:			}
LABELV $427
line 614
;614:			teamgame.redTakenTime = level.time;
ADDRGP4 teamgame+20
ADDRGP4 level+36
INDIRI4
ASGNI4
line 615
;615:			break;
LABELV $414
LABELV $415
line 618
;616:	}
;617:
;618:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 68
ARGI4
ADDRLP4 8
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 619
;619:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $436
line 620
;620:		te->s.eventParm = GTS_RED_TAKEN;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 4
ASGNI4
line 621
;621:	}
ADDRGP4 $437
JUMPV
LABELV $436
line 622
;622:	else {
line 623
;623:		te->s.eventParm = GTS_BLUE_TAKEN;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 5
ASGNI4
line 624
;624:	}
LABELV $437
line 625
;625:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 626
;626:}
LABELV $410
endproc Team_TakeFlagSound 16 8
export Team_CaptureFlagSound
proc Team_CaptureFlagSound 12 8
line 628
;627:
;628:void Team_CaptureFlagSound( gentity_t *ent, int team ) {
line 631
;629:	gentity_t	*te;
;630:
;631:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $439
line 632
;632:		G_Printf ("Warning:  NULL passed to Team_CaptureFlagSound\n");
ADDRGP4 $441
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 633
;633:		return;
ADDRGP4 $438
JUMPV
LABELV $439
line 636
;634:	}
;635:
;636:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 68
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 637
;637:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $442
line 638
;638:		te->s.eventParm = GTS_BLUE_CAPTURE;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 639
;639:	}
ADDRGP4 $443
JUMPV
LABELV $442
line 640
;640:	else {
line 641
;641:		te->s.eventParm = GTS_RED_CAPTURE;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 642
;642:	}
LABELV $443
line 643
;643:	te->r.svFlags |= SVF_BROADCAST;
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
line 644
;644:}
LABELV $438
endproc Team_CaptureFlagSound 12 8
export Team_ReturnFlag
proc Team_ReturnFlag 4 12
line 646
;645:
;646:void Team_ReturnFlag( int team ) {
line 647
;647:	Team_ReturnFlagSound(Team_ResetFlag(team), team);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 648
;648:	if( team == TEAM_FREE ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $445
line 650
;649:		//PrintMsg(NULL, "The flag has returned!\n" );
;650:	}
ADDRGP4 $446
JUMPV
LABELV $445
line 651
;651:	else { //flag should always have team in normal CTF
line 653
;652:		//PrintMsg(NULL, "The %s flag has returned!\n", TeamName(team));
;653:		PrintCTFMessage(-1, team, CTFMESSAGE_FLAG_RETURNED);
CNSTI4 -1
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 PrintCTFMessage
CALLP4
pop
line 654
;654:	}
LABELV $446
line 655
;655:}
LABELV $444
endproc Team_ReturnFlag 4 12
export Team_FreeEntity
proc Team_FreeEntity 0 4
line 657
;656:
;657:void Team_FreeEntity( gentity_t *ent ) {
line 658
;658:	if( ent->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 4
NEI4 $448
line 659
;659:		Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 660
;660:	}
ADDRGP4 $449
JUMPV
LABELV $448
line 661
;661:	else if( ent->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $450
line 662
;662:		Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 663
;663:	}
ADDRGP4 $451
JUMPV
LABELV $450
line 664
;664:	else if( ent->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
NEI4 $452
line 665
;665:		Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 666
;666:	}
LABELV $452
LABELV $451
LABELV $449
line 667
;667:}
LABELV $447
endproc Team_FreeEntity 0 4
export Team_DroppedFlagThink
proc Team_DroppedFlagThink 8 8
line 678
;668:
;669:/*
;670:==============
;671:Team_DroppedFlagThink
;672:
;673:Automatically set in Launch_Item if the item is one of the flags
;674:
;675:Flags are unique in that if they are dropped, the base flag must be respawned when they time out
;676:==============
;677:*/
;678:void Team_DroppedFlagThink(gentity_t *ent) {
line 679
;679:	int		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 681
;680:
;681:	if( ent->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 4
NEI4 $455
line 682
;682:		team = TEAM_RED;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 683
;683:	}
ADDRGP4 $456
JUMPV
LABELV $455
line 684
;684:	else if( ent->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $457
line 685
;685:		team = TEAM_BLUE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 686
;686:	}
ADDRGP4 $458
JUMPV
LABELV $457
line 687
;687:	else if( ent->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
NEI4 $459
line 688
;688:		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 689
;689:	}
LABELV $459
LABELV $458
LABELV $456
line 691
;690:
;691:	Team_ReturnFlagSound( Team_ResetFlag( team ), team );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 693
;692:	// Reset Flag will delete this entity
;693:}
LABELV $454
endproc Team_DroppedFlagThink 8 8
export Team_TouchOurFlag
proc Team_TouchOurFlag 84 12
line 701
;694:
;695:
;696:/*
;697:==============
;698:Team_DroppedFlagThink
;699:==============
;700:*/
;701:int Team_TouchOurFlag( gentity_t *ent, gentity_t *other, int team ) {
line 704
;702:	int			i;
;703:	gentity_t	*player;
;704:	gclient_t	*cl = other->client;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 708
;705:	int			enemy_flag;
;706:	int			nowTimePlayer;
;707:
;708:	if (cl->sess.sessionTeam == TEAM_RED) {
ADDRLP4 8
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $462
line 709
;709:		enemy_flag = PW_BLUEFLAG;
ADDRLP4 16
CNSTI4 5
ASGNI4
line 710
;710:	} else {
ADDRGP4 $463
JUMPV
LABELV $462
line 711
;711:		enemy_flag = PW_REDFLAG;
ADDRLP4 16
CNSTI4 4
ASGNI4
line 712
;712:	}
LABELV $463
line 714
;713:
;714:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $464
line 715
;715:		if (other->client->sess.mode == MODE_IRONMAN) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
CNSTI4 5
NEI4 $466
line 719
;716:			// hey, its not home.  return it by teleporting it back
;717:			//PrintMsg( NULL, "%s" S_COLOR_WHITE " returned the %s flag!\n", 
;718:			//	cl->pers.netname, TeamName(team));
;719:			PrintCTFMessage(other->s.number, team, CTFMESSAGE_PLAYER_RETURNED_FLAG);
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 PrintCTFMessage
CALLP4
pop
line 721
;720:
;721:			AddScore(other, ent->r.currentOrigin, CTF_RECOVERY_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 723
;722:
;723:			G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 724
;724:			Team_ReturnFlagSound(other, team);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 725
;725:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $461
JUMPV
LABELV $466
line 727
;726:		}
;727:		else {
line 731
;728:			// hey, its not home.  return it by teleporting it back
;729:			//PrintMsg( NULL, "%s" S_COLOR_WHITE " returned the %s flag!\n", 
;730:			//	cl->pers.netname, TeamName(team));
;731:			PrintCTFMessage(other->s.number, team, CTFMESSAGE_PLAYER_RETURNED_FLAG);
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 PrintCTFMessage
CALLP4
pop
line 733
;732:
;733:			AddScore(other, ent->r.currentOrigin, CTF_RECOVERY_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 734
;734:			other->client->pers.teamState.flagrecovery++;
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1660
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 735
;735:			other->client->pers.teamState.lastreturnedflag = LEVELTIME(other->client);
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $472
ADDRLP4 32
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $472
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $474
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $475
JUMPV
LABELV $474
ADDRLP4 28
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $475
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $473
JUMPV
LABELV $472
ADDRLP4 24
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $473
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1676
ADDP4
ADDRLP4 24
INDIRI4
CVIF4 4
ASGNF4
line 737
;736:			//ResetFlag will remove this entity!  We must return zero
;737:			Team_ReturnFlagSound(Team_ResetFlag(team), team);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 738
;738:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $461
JUMPV
LABELV $464
line 744
;739:		}
;740:	}
;741:
;742:	// the flag is at home base.  if the player has the enemy
;743:	// flag, he's just won!
;744:	if (!cl->ps.powerups[enemy_flag])
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $476
line 745
;745:		return 0; // We don't have the flag
CNSTI4 0
RETI4
ADDRGP4 $461
JUMPV
LABELV $476
line 747
;746:	//PrintMsg( NULL, "%s" S_COLOR_WHITE " captured the %s flag!\n", cl->pers.netname, TeamName(OtherTeam(team)));
;747:	PrintCTFMessage(other->s.number, team, CTFMESSAGE_PLAYER_CAPTURED_FLAG);
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 PrintCTFMessage
CALLP4
pop
line 749
;748:
;749:	cl->ps.powerups[enemy_flag] = 0;
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 344
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 751
;750:
;751:	teamgame.last_flag_capture = level.time;
ADDRGP4 teamgame
ADDRGP4 level+36
INDIRI4
CVIF4 4
ASGNF4
line 752
;752:	teamgame.last_capture_team = team;
ADDRGP4 teamgame+4
ADDRFP4 8
INDIRI4
ASGNI4
line 755
;753:
;754:	// Increase the team's score
;755:	AddTeamScore(ent->s.pos.trBase, other->client->sess.sessionTeam, 1);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 AddTeamScore
CALLV
pop
line 759
;756://	Team_ForceGesture(other->client->sess.sessionTeam);
;757:	//rww - don't really want to do this now. Mainly because performing a gesture disables your upper torso animations until it's done and you can't fire
;758:
;759:	other->client->pers.teamState.captures++;
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1648
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 761
;760:	// add the sprite over the player's head
;761:	other->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 762
;762:	other->client->ps.eFlags |= EF_AWARD_CAP;
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 763
;763:	other->client->rewardTime = LEVELTIME(other->client) + REWARD_SPRITE_TIME;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $484
ADDRLP4 40
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $484
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $486
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $487
JUMPV
LABELV $486
ADDRLP4 36
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $487
ADDRLP4 32
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 $485
JUMPV
LABELV $484
ADDRLP4 32
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $485
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43708
ADDP4
ADDRLP4 32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 764
;764:	other->client->ps.persistant[PERS_CAPTURES]++;
ADDRLP4 44
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 767
;765:
;766:	// other gets another 10 frag bonus
;767:	AddScore(other, ent->r.currentOrigin, CTF_CAPTURE_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 769
;768:
;769:	Team_CaptureFlagSound( ent, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_CaptureFlagSound
CALLV
pop
line 772
;770:
;771:	// Ok, let's do the player loop, hand out the bonuses
;772:	for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $491
JUMPV
LABELV $488
line 773
;773:		player = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 774
;774:		if (!player->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $493
line 775
;775:			continue;
ADDRGP4 $489
JUMPV
LABELV $493
line 776
;776:		nowTimePlayer = LEVELTIME(player->client);
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $499
ADDRLP4 56
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $499
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $501
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $502
JUMPV
LABELV $501
ADDRLP4 52
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $502
ADDRLP4 48
ADDRLP4 52
INDIRI4
ASGNI4
ADDRGP4 $500
JUMPV
LABELV $499
ADDRLP4 48
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $500
ADDRLP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 778
;777:
;778:		if (player->client->sess.sessionTeam !=
ADDRLP4 60
CNSTI4 43440
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRI4
EQI4 $503
line 779
;779:			cl->sess.sessionTeam) {
line 780
;780:			player->client->pers.teamState.lasthurtcarrier = -5;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1672
ADDP4
CNSTF4 3231711232
ASGNF4
line 781
;781:		} else if (player->client->sess.sessionTeam ==
ADDRGP4 $504
JUMPV
LABELV $503
ADDRLP4 64
CNSTI4 43440
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
NEI4 $505
line 782
;782:			cl->sess.sessionTeam) {
line 783
;783:			if (player != other)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $507
line 784
;784:				AddScore(player, ent->r.currentOrigin, CTF_TEAM_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 25
ARGI4
ADDRGP4 AddScore
CALLV
pop
LABELV $507
line 786
;785:			// award extra points for capture assists
;786:			if (player->client->pers.teamState.lastreturnedflag + 
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1676
ADDP4
INDIRF4
CNSTF4 1176256512
ADDF4
ADDRLP4 12
INDIRI4
CVIF4 4
LEF4 $509
line 787
;787:				CTF_RETURN_FLAG_ASSIST_TIMEOUT > nowTimePlayer) {
line 788
;788:				AddScore (player, ent->r.currentOrigin, CTF_RETURN_FLAG_ASSIST_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 789
;789:				other->client->pers.teamState.assists++;
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1668
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 791
;790:
;791:				player->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 72
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 328
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 793
;792:				// add the sprite over the player's head
;793:				player->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 794
;794:				player->client->ps.eFlags |= EF_AWARD_ASSIST;
ADDRLP4 80
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
line 795
;795:				player->client->rewardTime = nowTimePlayer + REWARD_SPRITE_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43708
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 797
;796:
;797:			} else if (player->client->pers.teamState.lastfraggedcarrier + 
ADDRGP4 $510
JUMPV
LABELV $509
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
INDIRF4
CNSTF4 1176256512
ADDF4
ADDRLP4 12
INDIRI4
CVIF4 4
LEF4 $511
line 798
;798:				CTF_FRAG_CARRIER_ASSIST_TIMEOUT > nowTimePlayer) {
line 799
;799:				AddScore(player, ent->r.currentOrigin, CTF_FRAG_CARRIER_ASSIST_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 800
;800:				other->client->pers.teamState.assists++;
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1668
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 801
;801:				player->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 72
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 328
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 803
;802:				// add the sprite over the player's head
;803:				player->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 804
;804:				player->client->ps.eFlags |= EF_AWARD_ASSIST;
ADDRLP4 80
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
line 805
;805:				player->client->rewardTime = nowTimePlayer + REWARD_SPRITE_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43708
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 806
;806:			}
LABELV $511
LABELV $510
line 807
;807:		}
LABELV $505
LABELV $504
line 808
;808:	}
LABELV $489
line 772
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $491
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $488
line 809
;809:	Team_ResetFlags();
ADDRGP4 Team_ResetFlags
CALLV
pop
line 811
;810:
;811:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 813
;812:
;813:	return 0; // Do not respawn this automatically
CNSTI4 0
RETI4
LABELV $461
endproc Team_TouchOurFlag 84 12
export Team_TouchEnemyFlag
proc Team_TouchEnemyFlag 4 12
line 816
;814:}
;815:
;816:int Team_TouchEnemyFlag( gentity_t *ent, gentity_t *other, int team ) {
line 817
;817:	gclient_t *cl = other->client;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 821
;818:
;819:	//PrintMsg (NULL, "%s" S_COLOR_WHITE " got the %s flag!\n",
;820:	//	other->client->pers.netname, TeamName(team));
;821:	PrintCTFMessage(other->s.number, team, CTFMESSAGE_PLAYER_GOT_FLAG);
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 PrintCTFMessage
CALLP4
pop
line 823
;822:
;823:	if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $514
line 824
;824:		cl->ps.powerups[PW_REDFLAG] = INT_MAX; // flags never expire
ADDRLP4 0
INDIRP4
CNSTI4 360
ADDP4
CNSTI4 2147483647
ASGNI4
ADDRGP4 $515
JUMPV
LABELV $514
line 826
;825:	else
;826:		cl->ps.powerups[PW_BLUEFLAG] = INT_MAX; // flags never expire
ADDRLP4 0
INDIRP4
CNSTI4 364
ADDP4
CNSTI4 2147483647
ASGNI4
LABELV $515
line 828
;827:
;828:	Team_SetFlagStatus( team, FLAG_TAKEN );
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 830
;829:
;830:	AddScore(other, ent->r.currentOrigin, CTF_FLAG_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 831
;831:	cl->pers.teamState.flagsince = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 1680
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
ASGNF4
line 832
;832:	Team_TakeFlagSound( ent, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_TakeFlagSound
CALLV
pop
line 834
;833:
;834:	return -1; // Do not respawn this automatically, but do delete it if it was FL_DROPPED
CNSTI4 -1
RETI4
LABELV $513
endproc Team_TouchEnemyFlag 4 12
export Pickup_Team
proc Pickup_Team 28 12
line 837
;835:}
;836:
;837:int Pickup_Team( gentity_t *ent, gentity_t *other ) {
line 839
;838:	team_t team;
;839:	gclient_t *cl = other->client;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 842
;840:
;841:	// figure out what team this flag is
;842:	if( strcmp(ent->classname, "team_CTF_redflag") == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $325
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $518
line 843
;843:		team = TEAM_RED;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 844
;844:	}
ADDRGP4 $519
JUMPV
LABELV $518
line 845
;845:	else if( strcmp(ent->classname, "team_CTF_blueflag") == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $327
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $520
line 846
;846:		team = TEAM_BLUE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 847
;847:	}
ADDRGP4 $521
JUMPV
LABELV $520
line 848
;848:	else if( strcmp(ent->classname, "team_CTF_neutralflag") == 0  ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $392
ARGP4
ADDRLP4 16
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $522
line 849
;849:		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 850
;850:	}
ADDRGP4 $523
JUMPV
LABELV $522
line 851
;851:	else {
line 853
;852://		PrintMsg ( other, "Don't know what team the flag is on.\n");
;853:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $517
JUMPV
LABELV $523
LABELV $521
LABELV $519
line 856
;854:	}
;855:	// GT_CTF
;856:	if( team == cl->sess.sessionTeam || cl->sess.mode == MODE_IRONMAN) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
EQI4 $526
ADDRLP4 4
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
CNSTI4 5
NEI4 $524
LABELV $526
line 857
;857:		return Team_TouchOurFlag( ent, other, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Team_TouchOurFlag
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $517
JUMPV
LABELV $524
line 859
;858:	}
;859:	return Team_TouchEnemyFlag( ent, other, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Team_TouchEnemyFlag
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
LABELV $517
endproc Pickup_Team 28 12
export Team_GetLocation
proc Team_GetLocation 48 8
line 870
;860:}
;861:
;862:/*
;863:===========
;864:Team_GetLocation
;865:
;866:Report a location for the player. Uses placed nearby target_location entities
;867:============
;868:*/
;869:gentity_t *Team_GetLocation(gentity_t *ent)
;870:{
line 875
;871:	gentity_t		*eloc, *best;
;872:	float			bestlen, len;
;873:	vec3_t			origin;
;874:
;875:	best = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 876
;876:	bestlen = 3*8192.0*8192.0;
ADDRLP4 20
CNSTF4 1296039936
ASGNF4
line 878
;877:
;878:	VectorCopy( ent->r.currentOrigin, origin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 880
;879:
;880:	for (eloc = level.locationHead; eloc; eloc = eloc->nextTrain) {
ADDRLP4 0
ADDRGP4 level+9072
INDIRP4
ASGNP4
ADDRGP4 $531
JUMPV
LABELV $528
line 881
;881:		len = ( origin[0] - eloc->r.currentOrigin[0] ) * ( origin[0] - eloc->r.currentOrigin[0] )
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ASGNF4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 885
;882:			+ ( origin[1] - eloc->r.currentOrigin[1] ) * ( origin[1] - eloc->r.currentOrigin[1] )
;883:			+ ( origin[2] - eloc->r.currentOrigin[2] ) * ( origin[2] - eloc->r.currentOrigin[2] );
;884:
;885:		if ( len > bestlen ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
LEF4 $537
line 886
;886:			continue;
ADDRGP4 $529
JUMPV
LABELV $537
line 889
;887:		}
;888:
;889:		if ( !trap_InPVS( origin, eloc->r.currentOrigin ) ) {
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $539
line 890
;890:			continue;
ADDRGP4 $529
JUMPV
LABELV $539
line 893
;891:		}
;892:
;893:		bestlen = len;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 894
;894:		best = eloc;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 895
;895:	}
LABELV $529
line 880
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRP4
ASGNP4
LABELV $531
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $528
line 897
;896:
;897:	return best;
ADDRLP4 24
INDIRP4
RETP4
LABELV $527
endproc Team_GetLocation 48 8
export Team_GetLocationMsg
proc Team_GetLocationMsg 12 24
line 909
;898:}
;899:
;900:
;901:/*
;902:===========
;903:Team_GetLocation
;904:
;905:Report a location for the player. Uses placed nearby target_location entities
;906:============
;907:*/
;908:qboolean Team_GetLocationMsg(gentity_t *ent, char *loc, int loclen)
;909:{
line 912
;910:	gentity_t *best;
;911:
;912:	best = Team_GetLocation( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 914
;913:	
;914:	if (!best)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $542
line 915
;915:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $541
JUMPV
LABELV $542
line 917
;916:
;917:	if (best->count) {
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
EQI4 $544
line 918
;918:		if (best->count < 0)
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
GEI4 $546
line 919
;919:			best->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 0
ASGNI4
LABELV $546
line 920
;920:		if (best->count > 7)
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 7
LEI4 $548
line 921
;921:			best->count = 7;
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 7
ASGNI4
LABELV $548
line 922
;922:		Com_sprintf(loc, loclen, "%c%c%s" S_COLOR_WHITE, Q_COLOR_ESCAPE, best->count + '0', best->message );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $550
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 48
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 923
;923:	} else
ADDRGP4 $545
JUMPV
LABELV $544
line 924
;924:		Com_sprintf(loc, loclen, "%s", best->message);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $551
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $545
line 926
;925:
;926:	return qtrue;
CNSTI4 1
RETI4
LABELV $541
endproc Team_GetLocationMsg 12 24
export SelectRandomTeamSpawnPoint
proc SelectRandomTeamSpawnPoint 152 8
line 940
;927:}
;928:
;929:
;930:/*---------------------------------------------------------------------------*/
;931:
;932:/*
;933:================
;934:SelectRandomDeathmatchSpawnPoint
;935:
;936:go to a random point that doesn't telefrag
;937:================
;938:*/
;939:#define	MAX_TEAM_SPAWN_POINTS	32
;940:gentity_t *SelectRandomTeamSpawnPoint(gentity_t* spawningEnt, int teamstate, team_t team ) {
line 947
;941:	gentity_t	*spot;
;942:	int			count;
;943:	int			selection;
;944:	gentity_t	*spots[MAX_TEAM_SPAWN_POINTS];
;945:	char		*classname;
;946:
;947:	if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $553
line 948
;948:	{
line 949
;949:		if (team == SAGATEAM_IMPERIAL)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $556
line 950
;950:		{
line 951
;951:			classname = "info_player_imperial";
ADDRLP4 8
ADDRGP4 $558
ASGNP4
line 952
;952:		}
ADDRGP4 $554
JUMPV
LABELV $556
line 954
;953:		else
;954:		{
line 955
;955:			classname = "info_player_rebel";
ADDRLP4 8
ADDRGP4 $559
ASGNP4
line 956
;956:		}
line 957
;957:	}
ADDRGP4 $554
JUMPV
LABELV $553
line 959
;958:	else
;959:	{
line 960
;960:		if (teamstate == TEAM_BEGIN) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $560
line 961
;961:			if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $562
line 962
;962:				classname = "team_CTF_redplayer";
ADDRLP4 8
ADDRGP4 $564
ASGNP4
ADDRGP4 $561
JUMPV
LABELV $562
line 963
;963:			else if (team == TEAM_BLUE)
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $565
line 964
;964:				classname = "team_CTF_blueplayer";
ADDRLP4 8
ADDRGP4 $567
ASGNP4
ADDRGP4 $561
JUMPV
LABELV $565
line 966
;965:			else
;966:				return NULL;
CNSTP4 0
RETP4
ADDRGP4 $552
JUMPV
line 967
;967:		} else {
LABELV $560
line 968
;968:			if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $568
line 969
;969:				classname = "team_CTF_redspawn";
ADDRLP4 8
ADDRGP4 $570
ASGNP4
ADDRGP4 $569
JUMPV
LABELV $568
line 970
;970:			else if (team == TEAM_BLUE)
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $571
line 971
;971:				classname = "team_CTF_bluespawn";
ADDRLP4 8
ADDRGP4 $573
ASGNP4
ADDRGP4 $572
JUMPV
LABELV $571
line 973
;972:			else
;973:				return NULL;
CNSTP4 0
RETP4
ADDRGP4 $552
JUMPV
LABELV $572
LABELV $569
line 974
;974:		}
LABELV $561
line 975
;975:	}
LABELV $554
line 976
;976:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 978
;977:
;978:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $575
JUMPV
LABELV $574
line 980
;979:
;980:	while ((spot = G_FindByClassNameFast(spot,  classname)) != NULL) {
line 981
;981:		if ( SpotWouldTelefrag( spot->s.origin, spawningEnt) ) {
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $577
line 982
;982:			continue;
ADDRGP4 $575
JUMPV
LABELV $577
line 984
;983:		}
;984:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 985
;985:		if (++count == MAX_TEAM_SPAWN_POINTS)
ADDRLP4 148
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 32
NEI4 $579
line 986
;986:			break;
ADDRGP4 $576
JUMPV
LABELV $579
line 987
;987:	}
LABELV $575
line 980
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 144
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $574
LABELV $576
line 989
;988:
;989:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $581
line 990
;990:		spot = G_FindByClassNameFast( NULL, classname);
CNSTP4 0
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 148
INDIRP4
ASGNP4
line 992
;991:		// can we bubble spawn here somehow? meh
;992:		return spot;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $552
JUMPV
LABELV $581
line 995
;993:	}
;994:
;995:	selection = rand() % count;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 148
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 996
;996:	return spots[ selection ];
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
RETP4
LABELV $552
endproc SelectRandomTeamSpawnPoint 152 8
export SelectCTFSpawnPoint
proc SelectCTFSpawnPoint 24 16
line 1006
;997:}
;998:
;999:
;1000:/*
;1001:===========
;1002:SelectCTFSpawnPoint
;1003:
;1004:============
;1005:*/
;1006:gentity_t *SelectCTFSpawnPoint (gentity_t* spawningEnt, team_t team, int teamstate, vec3_t origin, vec3_t angles ) {
line 1009
;1007:	gentity_t	*spot;
;1008:
;1009:	spot = SelectRandomTeamSpawnPoint (spawningEnt,teamstate, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 SelectRandomTeamSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1011
;1010:
;1011:	if (!spot) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $584
line 1012
;1012:		return SelectSpawnPoint(spawningEnt,vec3_origin, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $583
JUMPV
LABELV $584
line 1014
;1013:	}
;1014:	VectorCopy(spot->s.origin, origin);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1015
;1015:	if (g_bubbleSpawn.integer && !(spawningEnt->client && spawningEnt->client->sess.raceMode) && SpotWouldTelefrag(origin, spawningEnt)) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 g_bubbleSpawn+12
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $586
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
EQU4 $589
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $586
LABELV $589
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $586
line 1016
;1016:		WiggleSpotTelefrag(origin,spawningEnt);
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WiggleSpotTelefrag
CALLI4
pop
line 1017
;1017:	}
LABELV $586
line 1018
;1018:	origin[2] += 9;
ADDRLP4 20
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 1019
;1019:	VectorCopy (spot->s.angles, angles);
ADDRFP4 16
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1021
;1020:
;1021:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $583
endproc SelectCTFSpawnPoint 24 16
export SelectSagaSpawnPoint
proc SelectSagaSpawnPoint 24 16
line 1030
;1022:}
;1023:
;1024:/*
;1025:===========
;1026:SelectSagaSpawnPoint
;1027:
;1028:============
;1029:*/
;1030:gentity_t *SelectSagaSpawnPoint (gentity_t* spawningEnt, team_t team, int teamstate, vec3_t origin, vec3_t angles ) {
line 1033
;1031:	gentity_t	*spot;
;1032:
;1033:	spot = SelectRandomTeamSpawnPoint (spawningEnt, teamstate, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 SelectRandomTeamSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1035
;1034:
;1035:	if (!spot) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $591
line 1036
;1036:		return SelectSpawnPoint(spawningEnt,vec3_origin, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $590
JUMPV
LABELV $591
line 1038
;1037:	}
;1038:	VectorCopy(spot->s.origin, origin);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1039
;1039:	if (g_bubbleSpawn.integer && !(spawningEnt->client && spawningEnt->client->sess.raceMode) && SpotWouldTelefrag(origin, spawningEnt)) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 g_bubbleSpawn+12
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $593
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
EQU4 $596
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $593
LABELV $596
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $593
line 1040
;1040:		WiggleSpotTelefrag(origin, spawningEnt);
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WiggleSpotTelefrag
CALLI4
pop
line 1041
;1041:	}
LABELV $593
line 1042
;1042:	origin[2] += 9;
ADDRLP4 20
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 1043
;1043:	VectorCopy (spot->s.angles, angles);
ADDRFP4 16
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1045
;1044:
;1045:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $590
endproc SelectSagaSpawnPoint 24 16
proc SortClients 0 0
line 1050
;1046:}
;1047:
;1048:/*---------------------------------------------------------------------------*/
;1049:
;1050:static int QDECL SortClients( const void *a, const void *b ) {
line 1051
;1051:	return *(int *)a - *(int *)b;
ADDRFP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
SUBI4
RETI4
LABELV $597
endproc SortClients 0 0
export TeamplayInfoMessage
proc TeamplayInfoMessage 9408 36
line 1064
;1052:}
;1053:
;1054:
;1055:/*
;1056:==================
;1057:TeamplayLocationsMessage
;1058:
;1059:Format:
;1060:	clientNum location health armor weapon powerups
;1061:
;1062:==================
;1063:*/
;1064:void TeamplayInfoMessage( gentity_t *ent ) {
line 1074
;1065:	char		entry[1024];
;1066:	char		string[8192];
;1067:	int			stringlength;
;1068:	int			i, j;
;1069:	gentity_t	*player;
;1070:	int			cnt;
;1071:	int			h, a;
;1072:	int			clients[TEAM_MAXOVERLAY];
;1073:
;1074:	if ( ! ent->client->pers.teamInfo )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1700
ADDP4
INDIRI4
CNSTI4 0
NEI4 $599
line 1075
;1075:		return;
ADDRGP4 $598
JUMPV
LABELV $599
line 1080
;1076:
;1077:	// figure out what client should be on the display
;1078:	// we are limited to 8, but we want to use the top eight players
;1079:	// but in client order (so they don't keep changing position on the overlay)
;1080:	for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9372
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9372
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9372
INDIRI4
ASGNI4
ADDRGP4 $604
JUMPV
LABELV $601
line 1081
;1081:		player = g_entities + level.sortedClients[i];
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
line 1082
;1082:		if (player->inuse && player->client->sess.sessionTeam == 
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $607
ADDRLP4 9380
CNSTI4 408
ASGNI4
ADDRLP4 9384
CNSTI4 43440
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRI4
NEI4 $607
line 1083
;1083:			ent->client->sess.sessionTeam ) {
line 1084
;1084:			clients[cnt++] = level.sortedClients[i];
ADDRLP4 9388
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9388
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 9392
CNSTI4 2
ASGNI4
ADDRLP4 9388
INDIRI4
ADDRLP4 9392
INDIRI4
LSHI4
ADDRLP4 9244
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 9392
INDIRI4
LSHI4
ADDRGP4 level+96
ADDP4
INDIRI4
ASGNI4
line 1085
;1085:		}
LABELV $607
line 1086
;1086:	}
LABELV $602
line 1080
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $604
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $610
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $601
LABELV $610
line 1089
;1087:
;1088:	// We have the top eight players, sort them by clientNum
;1089:	qsort( clients, cnt, sizeof( clients[0] ), SortClients );
ADDRLP4 9244
ARGP4
ADDRLP4 8
INDIRI4
CVIU4 4
ARGU4
CNSTU4 4
ARGU4
ADDRGP4 SortClients
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1092
;1090:
;1091:	// send the latest information on all clients
;1092:	string[0] = 0;
ADDRLP4 1048
CNSTI1 0
ASGNI1
line 1093
;1093:	stringlength = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1095
;1094:
;1095:	for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9376
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9376
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9376
INDIRI4
ASGNI4
ADDRGP4 $614
JUMPV
LABELV $611
line 1096
;1096:		player = g_entities + i;
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1097
;1097:		if (player->inuse && player->client->sess.sessionTeam == 
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $616
ADDRLP4 9384
CNSTI4 408
ASGNI4
ADDRLP4 9388
CNSTI4 43440
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRI4
NEI4 $616
line 1098
;1098:			ent->client->sess.sessionTeam ) {
line 1100
;1099:
;1100:			h = player->client->ps.stats[STAT_HEALTH];
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 1101
;1101:			a = player->client->ps.stats[STAT_ARMOR];
ADDRLP4 1044
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 1102
;1102:			if (h < 0) h = 0;
ADDRLP4 1040
INDIRI4
CNSTI4 0
GEI4 $618
ADDRLP4 1040
CNSTI4 0
ASGNI4
LABELV $618
line 1103
;1103:			if (a < 0) a = 0;
ADDRLP4 1044
INDIRI4
CNSTI4 0
GEI4 $620
ADDRLP4 1044
CNSTI4 0
ASGNI4
LABELV $620
line 1105
;1104:
;1105:			Com_sprintf (entry, sizeof(entry),
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $622
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 9396
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9396
INDIRP4
CNSTI4 1644
ADDP4
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 9396
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1110
;1106:				" %i %i %i %i %i %i", 
;1107://				level.sortedClients[i], player->client->pers.teamState.location, h, a, 
;1108:				i, player->client->pers.teamState.location, h, a, 
;1109:				player->client->ps.weapon, player->s.powerups);
;1110:			j = strlen(entry);
ADDRLP4 16
ARGP4
ADDRLP4 9400
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 9240
ADDRLP4 9400
INDIRU4
CVUI4 4
ASGNI4
line 1111
;1111:			if (stringlength + j > (int)sizeof(string))
ADDRLP4 12
INDIRI4
ADDRLP4 9240
INDIRI4
ADDI4
CNSTI4 8192
LEI4 $623
line 1112
;1112:				break;
ADDRGP4 $613
JUMPV
LABELV $623
line 1113
;1113:			Q_strncpyz (string + stringlength, entry,sizeof(string)- stringlength);
ADDRLP4 12
INDIRI4
ADDRLP4 1048
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTU4 8192
ADDRLP4 12
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1114
;1114:			stringlength += j;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 9240
INDIRI4
ADDI4
ASGNI4
line 1115
;1115:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1116
;1116:		}
LABELV $616
line 1117
;1117:	}
LABELV $612
line 1095
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $614
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $625
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $611
LABELV $625
LABELV $613
line 1119
;1118:
;1119:	trap_SendServerCommand( ent-g_entities, va("tinfo %i %s", cnt, string) );
ADDRGP4 $626
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1048
ARGP4
ADDRLP4 9380
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 9380
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1120
;1120:}
LABELV $598
endproc TeamplayInfoMessage 9408 36
export CheckTeamStatus
proc CheckTeamStatus 24 4
line 1122
;1121:
;1122:void CheckTeamStatus(void) {
line 1126
;1123:	int i;
;1124:	gentity_t *loc, *ent;
;1125:
;1126:	if (level.time - level.lastTeamLocationTime > TEAM_LOCATION_UPDATE_TIME) {
ADDRGP4 level+36
INDIRI4
ADDRGP4 level+68
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $628
line 1128
;1127:
;1128:		level.lastTeamLocationTime = level.time;
ADDRGP4 level+68
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1130
;1129:
;1130:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $637
JUMPV
LABELV $634
line 1131
;1131:			ent = g_entities + i;
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1133
;1132:
;1133:			if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $639
line 1134
;1134:				continue;
ADDRGP4 $635
JUMPV
LABELV $639
line 1137
;1135:			}
;1136:
;1137:			if (ent->inuse && (ent->client->sess.sessionTeam == TEAM_RED ||	ent->client->sess.sessionTeam == TEAM_BLUE)) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $641
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $643
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $641
LABELV $643
line 1138
;1138:				loc = Team_GetLocation( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 1139
;1139:				if (loc)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $644
line 1140
;1140:					ent->client->pers.teamState.location = loc->health;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1644
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $645
JUMPV
LABELV $644
line 1142
;1141:				else
;1142:					ent->client->pers.teamState.location = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1644
ADDP4
CNSTI4 0
ASGNI4
LABELV $645
line 1143
;1143:			}
LABELV $641
line 1144
;1144:		}
LABELV $635
line 1130
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $637
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $634
line 1149
;1145:
;1146:		// Previously only sent for TEAM_RED/TEAM_BLUE in team gametypes.
;1147:		// We now always send to any in-use connected client that is not a pure spectator
;1148:		// so that health/armor information is propagated universally (all gametypes).
;1149:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $649
JUMPV
LABELV $646
line 1150
;1150:			ent = g_entities + i;
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1151
;1151:			if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $651
line 1152
;1152:				continue;
ADDRGP4 $647
JUMPV
LABELV $651
line 1154
;1153:			}
;1154:			if (!ent->inuse) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $653
line 1155
;1155:				continue;
ADDRGP4 $647
JUMPV
LABELV $653
line 1158
;1156:			}
;1157:			// Skip true spectators
;1158:			if (ent->client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $655
line 1159
;1159:				continue;
ADDRGP4 $647
JUMPV
LABELV $655
line 1161
;1160:			}
;1161:			TeamplayInfoMessage( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 TeamplayInfoMessage
CALLV
pop
line 1162
;1162:		}
LABELV $647
line 1149
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $649
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $646
line 1163
;1163:	}
LABELV $628
line 1164
;1164:}
LABELV $627
endproc CheckTeamStatus 24 4
export SP_team_CTF_redplayer
proc SP_team_CTF_redplayer 0 0
line 1171
;1165:
;1166:/*-----------------------------------------------------------------*/
;1167:
;1168:/*QUAKED team_CTF_redplayer (1 0 0) (-16 -16 -16) (16 16 32)
;1169:Only in CTF games.  Red players spawn here at game start.
;1170:*/
;1171:void SP_team_CTF_redplayer( gentity_t *ent ) {
line 1172
;1172:}
LABELV $657
endproc SP_team_CTF_redplayer 0 0
export SP_team_CTF_blueplayer
proc SP_team_CTF_blueplayer 0 0
line 1178
;1173:
;1174:
;1175:/*QUAKED team_CTF_blueplayer (0 0 1) (-16 -16 -16) (16 16 32)
;1176:Only in CTF games.  Blue players spawn here at game start.
;1177:*/
;1178:void SP_team_CTF_blueplayer( gentity_t *ent ) {
line 1179
;1179:}
LABELV $658
endproc SP_team_CTF_blueplayer 0 0
export SP_team_CTF_redspawn
proc SP_team_CTF_redspawn 0 0
line 1186
;1180:
;1181:
;1182:/*QUAKED team_CTF_redspawn (1 0 0) (-16 -16 -24) (16 16 32)
;1183:potential spawning position for red team in CTF games.
;1184:Targets will be fired when someone spawns in on them.
;1185:*/
;1186:void SP_team_CTF_redspawn(gentity_t *ent) {
line 1187
;1187:}
LABELV $659
endproc SP_team_CTF_redspawn 0 0
export SP_team_CTF_bluespawn
proc SP_team_CTF_bluespawn 0 0
line 1193
;1188:
;1189:/*QUAKED team_CTF_bluespawn (0 0 1) (-16 -16 -24) (16 16 32)
;1190:potential spawning position for blue team in CTF games.
;1191:Targets will be fired when someone spawns in on them.
;1192:*/
;1193:void SP_team_CTF_bluespawn(gentity_t *ent) {
line 1194
;1194:}
LABELV $660
endproc SP_team_CTF_bluespawn 0 0
bss
export teamgame
align 4
LABELV teamgame
skip 28
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
import clampedIntAdd
import clampedIntMult
import parseHex
import colorToHex
import safeatoi
import sanitizeFilename
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
LABELV $626
byte 1 116
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $622
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $573
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $570
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $567
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $564
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $559
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 114
byte 1 101
byte 1 98
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $558
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
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
LABELV $551
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $550
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $441
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $413
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 84
byte 1 97
byte 1 107
byte 1 101
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $407
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 82
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $392
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $327
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $325
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $160
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $159
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $156
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $153
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $142
byte 1 70
byte 1 82
byte 1 69
byte 1 69
byte 1 0
align 1
LABELV $141
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 84
byte 1 65
byte 1 84
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $138
byte 1 66
byte 1 76
byte 1 85
byte 1 69
byte 1 0
align 1
LABELV $135
byte 1 82
byte 1 69
byte 1 68
byte 1 0
