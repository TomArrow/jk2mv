export G_WriteClientSessionData
code
proc G_WriteClientSessionData 32 108
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_session.c"
line 28
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:// Useful when trying to store remaining time across map changes
;6:#define LevelTimeDiff( timeVal )		( timeVal > level.time ? timeVal - level.time : 0 )
;7:#define RestoreLevelTimeDiff( timeVal )	( timeVal = timeVal ? level.time + timeVal : 0 )
;8:
;9:extern void DF_CarryClientOverToNewRaceStyle(gentity_t* ent, raceStyle_t* newRs);
;10:extern void DF_SetSubContestDefaults(gclient_t* client);
;11:/*
;12:=======================================================================
;13:
;14:  SESSION DATA
;15:
;16:Session data is the only data that stays persistant across level loads
;17:and tournament restarts.
;18:=======================================================================
;19:*/
;20:
;21:/*
;22:================
;23:G_WriteClientSessionData
;24:
;25:Called on game shutdown
;26:================
;27:*/
;28:void G_WriteClientSessionData( gclient_t *client ) {
line 32
;29:	const char	*s;
;30:	const char	*var;
;31:
;32:	s = va("%i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %s",
ADDRGP4 $121
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43444
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43452
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43456
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43460
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43480
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43472
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43468
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43464
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43496
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43512
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43508
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43516
ADDP4
INDIRI4
ARGI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 43572
ADDP4
INDIRI4
SUBI4
ARGI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 43576
ADDP4
INDIRI4
SUBI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43584
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43560
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43540
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43544
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 43548
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 61
;33:		client->sess.sessionTeam,
;34:		client->sess.spectatorOrder,
;35:		client->sess.spectatorState,
;36:		client->sess.spectatorClient,
;37:		client->sess.wins,
;38:		client->sess.losses,
;39:		client->sess.teamLeader,
;40:		client->sess.setForce,
;41:		client->sess.saberLevel,
;42:		client->sess.selectedFP,
;43:		client->sess.mode,
;44:		client->sess.raceMode,
;45:		(int)client->sess.raceStyle.movementStyle,
;46:		(int)client->sess.raceStyle.runFlags,
;47:		(int)client->sess.raceStyle.jumpLevel,
;48:		(int)client->sess.raceStyle.msec,
;49:		(int)client->sess.mapStyleBaseline.runFlags,
;50:		(int)client->sess.mapStyleBaseline.jumpLevel,
;51:		client->sess.raceStateInvalidated,
;52:		(int)(level.time-client->sess.lastHereTime),
;53:		(int)(level.time-client->sess.oldbuttons_immediate),
;54:		(int)client->sess.nameTag,
;55:		client->sess.login.loggedIn,
;56:		client->sess.login.id,
;57:		client->sess.login.flags,
;58:		client->sess.login.name
;59:		);
;60:
;61:	var = va( "session%i", (int)(client - level.clients) );
ADDRGP4 $124
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 53196
DIVI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 63
;62:
;63:	trap_Cvar_Set( var, s );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 65
;64:
;65:	s = va("%i %i %i %i %i",
ADDRGP4 $125
ARGP4
ADDRLP4 20
CNSTI4 20
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_clients
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 53196
DIVI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 mv_clientSessions
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRGP4 mv_clientSessions+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRGP4 mv_clientSessions+8
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRGP4 mv_clientSessions+12
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRGP4 mv_clientSessions+16
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 72
;66:		mv_clientSessions[client-g_clients].clientIP[0],
;67:		mv_clientSessions[client-g_clients].clientIP[1],
;68:		mv_clientSessions[client-g_clients].clientIP[2],
;69:		mv_clientSessions[client-g_clients].clientIP[3],
;70:		mv_clientSessions[client-g_clients].localClient
;71:		);
;72:	var = va( "sessionmv%i", (int)(client-level.clients) );
ADDRGP4 $130
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 53196
DIVI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
ASGNP4
line 73
;73:	trap_Cvar_Set( var, s );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 74
;74:}
LABELV $120
endproc G_WriteClientSessionData 32 108
export G_ReadSessionData
proc G_ReadSessionData 1108 112
line 86
;75:
;76:
;77:void DF_RequestPlayerDefaultTime(gentity_t* ent);
;78:
;79:/*
;80:================
;81:G_ReadSessionData
;82:
;83:Called on a reconnect
;84:================
;85:*/
;86:void G_ReadSessionData( gclient_t *client ) {
line 108
;87:	char	s[MAX_STRING_CHARS];
;88:	const char	*var;
;89:
;90:	// bk001205 - format
;91:	int teamLeader;
;92:	int spectatorState;
;93:	int sessionTeam;
;94:	int setForce;
;95:	int tempMode;
;96:	int tempRaceMode;
;97:	int movementStyle;
;98:	int runFlags;
;99:	int jumpLevel;
;100:	int msec;
;101:	int baseRunFlags;
;102:	int baseJumpLevel;
;103:	int raceStateInvalidated;
;104:	int loggedIn;
;105:	int lastHereTimeOffset;
;106:	int nameTagType;
;107:
;108:	var = va( "session%i", (int)(client - level.clients) );
ADDRGP4 $124
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 53196
DIVI4
ARGI4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1092
INDIRP4
ASGNP4
line 109
;109:	trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 111
;110:
;111:	sscanf( s, "%i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %s",
ADDRLP4 0
ARGP4
ADDRGP4 $121
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 43444
ADDP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 43452
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 43456
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 43460
ADDP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1040
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 43468
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 43464
ADDP4
ARGP4
ADDRLP4 1044
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1052
ARGP4
ADDRLP4 1056
ARGP4
ADDRLP4 1060
ARGP4
ADDRLP4 1064
ARGP4
ADDRLP4 1068
ARGP4
ADDRLP4 1072
ARGP4
ADDRLP4 1088
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 43576
ADDP4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1076
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 43540
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 43544
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 43548
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 141
;112:		&sessionTeam,                 // bk010221 - format
;113:		&client->sess.spectatorOrder,
;114:		&spectatorState,              // bk010221 - format
;115:		&client->sess.spectatorClient,
;116:		&client->sess.wins,
;117:		&client->sess.losses,
;118:		&teamLeader,                   // bk010221 - format
;119:		&setForce,
;120:		&client->sess.saberLevel,
;121:		&client->sess.selectedFP,
;122:		&tempMode,
;123:		&tempRaceMode,
;124:		&movementStyle,
;125:		&runFlags,
;126:		&jumpLevel,
;127:		&msec,
;128:		&baseRunFlags,
;129:		&baseJumpLevel,
;130:		&raceStateInvalidated,
;131:		&lastHereTimeOffset,
;132:		&client->sess.oldbuttons_immediate,
;133:		&nameTagType,
;134:		&loggedIn,
;135:		&client->sess.login.id,
;136:		&client->sess.login.flags,
;137:		client->sess.login.name
;138:		);
;139:
;140:	// bk001205 - format issues
;141:	client->sess.sessionTeam = (team_t)sessionTeam;
ADDRFP4 0
INDIRP4
CNSTI4 43440
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 142
;142:	client->sess.spectatorState = (spectatorState_t)spectatorState;
ADDRFP4 0
INDIRP4
CNSTI4 43448
ADDP4
ADDRLP4 1032
INDIRI4
ASGNI4
line 143
;143:	client->sess.teamLeader = (qboolean)teamLeader;
ADDRFP4 0
INDIRP4
CNSTI4 43480
ADDP4
ADDRLP4 1028
INDIRI4
ASGNI4
line 144
;144:	client->sess.setForce = (qboolean)setForce;
ADDRFP4 0
INDIRP4
CNSTI4 43472
ADDP4
ADDRLP4 1040
INDIRI4
ASGNI4
line 145
;145:	client->sess.mode = (playerMode_e)tempMode;
ADDRFP4 0
INDIRP4
CNSTI4 43484
ADDP4
ADDRLP4 1044
INDIRI4
ASGNI4
line 146
;146:	client->sess.raceMode = (qboolean)tempRaceMode;
ADDRFP4 0
INDIRP4
CNSTI4 43488
ADDP4
ADDRLP4 1048
INDIRI4
ASGNI4
line 147
;147:	client->sess.raceStyle.movementStyle = (byte)movementStyle;
ADDRFP4 0
INDIRP4
CNSTI4 43492
ADDP4
ADDRLP4 1052
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 148
;148:	client->sess.raceStyle.runFlags = (short)runFlags;
ADDRFP4 0
INDIRP4
CNSTI4 43500
ADDP4
ADDRLP4 1056
INDIRI4
CVII2 4
ASGNI2
line 149
;149:	client->sess.raceStyle.jumpLevel = (signed char)jumpLevel;
ADDRFP4 0
INDIRP4
CNSTI4 43496
ADDP4
ADDRLP4 1060
INDIRI4
CVII1 4
ASGNI1
line 150
;150:	client->sess.raceStyle.msec = (short)msec;
ADDRFP4 0
INDIRP4
CNSTI4 43494
ADDP4
ADDRLP4 1064
INDIRI4
CVII2 4
ASGNI2
line 151
;151:	client->sess.mapStyleBaseline.runFlags = (short)baseRunFlags;
ADDRFP4 0
INDIRP4
CNSTI4 43512
ADDP4
ADDRLP4 1068
INDIRI4
CVII2 4
ASGNI2
line 152
;152:	client->sess.mapStyleBaseline.jumpLevel = (signed char)baseJumpLevel;
ADDRFP4 0
INDIRP4
CNSTI4 43508
ADDP4
ADDRLP4 1072
INDIRI4
CVII1 4
ASGNI1
line 153
;153:	client->sess.raceStateInvalidated = qtrue;//likely map change. old stuff wont be valid anymore. // (qboolean)raceStateInvalidated;
ADDRFP4 0
INDIRP4
CNSTI4 43516
ADDP4
CNSTI4 1
ASGNI4
line 154
;154:	client->sess.login.loggedIn = loggedIn;
ADDRFP4 0
INDIRP4
CNSTI4 43560
ADDP4
ADDRLP4 1076
INDIRI4
ASGNI4
line 155
;155:	client->sess.lastHereTime = level.time- lastHereTimeOffset;
ADDRFP4 0
INDIRP4
CNSTI4 43572
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 1080
INDIRI4
SUBI4
ASGNI4
line 156
;156:	client->sess.nameTag  = nameTagType;
ADDRFP4 0
INDIRP4
CNSTI4 43584
ADDP4
ADDRLP4 1084
INDIRI4
ASGNI4
line 160
;157:
;158:	//client->sess.raceStyle.msec = 7; // just default to this *shrug*// Nope, keep it so we remember floatphysics/toggle
;159:
;160:	client->ps.fd.saberAnimLevel = client->sess.saberLevel;
ADDRLP4 1100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 1100
INDIRP4
CNSTI4 43468
ADDP4
INDIRI4
ASGNI4
line 161
;161:	client->ps.fd.forcePowerSelected = client->sess.selectedFP;
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 1104
INDIRP4
CNSTI4 43464
ADDP4
INDIRI4
ASGNI4
line 163
;162:
;163:	DF_CarryClientOverToNewRaceStyle(g_entities+(client-g_clients),&level.mapDefaultRaceStyle); 
CNSTI4 2352
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_clients
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 53196
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 level+9116
ARGP4
ADDRGP4 DF_CarryClientOverToNewRaceStyle
CALLV
pop
line 165
;164:	
;165:	if (client->sess.login.loggedIn) {
ADDRFP4 0
INDIRP4
CNSTI4 43560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $134
line 166
;166:		DF_RequestPlayerDefaultTime(g_entities + (client - g_clients));
CNSTI4 2352
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_clients
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 53196
DIVI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 DF_RequestPlayerDefaultTime
CALLV
pop
line 167
;167:	}
LABELV $134
line 169
;168:
;169:	DF_SetSubContestDefaults(client); // would be nicer to keep it but lets just set defaults who cares. means a few more db requests that could be avoided, but it wont cause any issues beyond that, maybe TODO someday
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DF_SetSubContestDefaults
CALLV
pop
line 171
;170:
;171:	client->sess.sessionInitialized = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 43580
ADDP4
CNSTI4 1
ASGNI4
line 172
;172:}
LABELV $131
endproc G_ReadSessionData 1108 112
export MV_ReadSessionData
proc MV_ReadSessionData 1040 28
line 182
;173:
;174:/*
;175:==================
;176:MV_ReadSessionData
;177:
;178:Called on a reconnect
;179:==================
;180:*/
;181:void MV_ReadSessionData( int clientNum )
;182:{
line 187
;183:	char	s[MAX_STRING_CHARS];
;184:	const char	*var;
;185:	int localClient;
;186:
;187:	var = va( "sessionmv%i", clientNum );
ADDRGP4 $130
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1032
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1032
INDIRP4
ASGNP4
line 188
;188:	trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 189
;189:	sscanf( s, "%i %i %i %i %i",
ADDRLP4 0
ARGP4
ADDRGP4 $125
ARGP4
ADDRLP4 1036
CNSTI4 20
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRGP4 mv_clientSessions
ADDP4
ARGP4
ADDRLP4 1036
INDIRI4
ADDRGP4 mv_clientSessions+4
ADDP4
ARGP4
ADDRLP4 1036
INDIRI4
ADDRGP4 mv_clientSessions+8
ADDP4
ARGP4
ADDRLP4 1036
INDIRI4
ADDRGP4 mv_clientSessions+12
ADDP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 197
;190:		&mv_clientSessions[clientNum].clientIP[0],
;191:		&mv_clientSessions[clientNum].clientIP[1],
;192:		&mv_clientSessions[clientNum].clientIP[2],
;193:		&mv_clientSessions[clientNum].clientIP[3],
;194:		&localClient
;195:		);
;196:
;197:	mv_clientSessions[clientNum].localClient = (qboolean)localClient;
CNSTI4 20
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 mv_clientSessions+16
ADDP4
ADDRLP4 1028
INDIRI4
ASGNI4
line 199
;198:	//trap_Cvar_Set( var, "" ); // Causes issues, if people aren't fully ingam, but the server changes maps again.
;199:}
LABELV $136
endproc MV_ReadSessionData 1040 28
export G_InitSessionData
proc G_InitSessionData 28 8
line 210
;200:
;201:
;202:/*
;203:================
;204:G_InitSessionData
;205:
;206:Called on a first-time connect
;207:================
;208:*/
;209:extern void UpdateClientRaceVars(gclient_t* client);
;210:void G_InitSessionData( gclient_t *client, char *userinfo, qboolean isBot ) {
line 214
;211:	clientSession_t	*sess;
;212:	const char		*value;
;213:
;214:	sess = &client->sess;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 43440
ADDP4
ASGNP4
line 219
;215:	
;216:	//sess->raceStyle.movementStyle = MV_JK2;
;217:	//sess->raceStyle.jumpLevel = 1;
;218:	//sess->raceStyle.runFlags = defaultRunFlags;
;219:	sess->raceMode = g_defrag.integer; // TODO what about changing g_defrag live, should we take some care? idk
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_defrag+12
INDIRI4
ASGNI4
line 220
;220:	sess->mapStyleBaseline = level.mapDefaultRaceStyle;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 level+9116
INDIRB
ASGNB 12
line 221
;221:	sess->raceStyle = sess->mapStyleBaseline;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRB
ASGNB 12
line 222
;222:	sess->raceStyle.msec = 7; // make old client versions work nicely? maybe? probably wont work but whatever
ADDRLP4 0
INDIRP4
CNSTI4 54
ADDP4
CNSTI2 7
ASGNI2
line 223
;223:	sess->lastHereTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 224
;224:	UpdateClientRaceVars(client);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 UpdateClientRaceVars
CALLV
pop
line 228
;225:	//client->ps.fd.forcePowerLevel[FP_LEVITATION] = client->sess.raceStyle.jumpLevel;
;226:
;227:	// initial team determination
;228:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $145
line 229
;229:		if ( g_teamAutoJoin.integer ) {
ADDRGP4 g_teamAutoJoin+12
INDIRI4
CNSTI4 0
EQI4 $148
line 230
;230:			sess->sessionTeam = PickTeam( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 12
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 231
;231:			BroadcastTeamChange( client, -1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 232
;232:		} else {
ADDRGP4 $146
JUMPV
LABELV $148
line 234
;233:			// always spawn as spectator in team games
;234:			if (!isBot)
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $151
line 235
;235:			{
line 236
;236:				sess->sessionTeam = TEAM_SPECTATOR;	
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 237
;237:			}
ADDRGP4 $146
JUMPV
LABELV $151
line 239
;238:			else
;239:			{ //Bots choose their team on creation
line 240
;240:				value = Info_ValueForKey( userinfo, "team" );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 241
;241:				if (value[0] == 'r' || value[0] == 'R')
ADDRLP4 16
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 114
EQI4 $156
ADDRLP4 16
INDIRI4
CNSTI4 82
NEI4 $154
LABELV $156
line 242
;242:				{
line 243
;243:					sess->sessionTeam = TEAM_RED;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 244
;244:				}
ADDRGP4 $155
JUMPV
LABELV $154
line 245
;245:				else if (value[0] == 'b' || value[0] == 'B')
ADDRLP4 20
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 98
EQI4 $159
ADDRLP4 20
INDIRI4
CNSTI4 66
NEI4 $157
LABELV $159
line 246
;246:				{
line 247
;247:					sess->sessionTeam = TEAM_BLUE;
ADDRLP4 0
INDIRP4
CNSTI4 2
ASGNI4
line 248
;248:				}
ADDRGP4 $158
JUMPV
LABELV $157
line 250
;249:				else
;250:				{
line 251
;251:					sess->sessionTeam = PickTeam( -1 );
CNSTI4 -1
ARGI4
ADDRLP4 24
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ASGNI4
line 252
;252:				}
LABELV $158
LABELV $155
line 253
;253:				BroadcastTeamChange( client, -1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 254
;254:			}
line 255
;255:		}
line 256
;256:	} else {
ADDRGP4 $146
JUMPV
LABELV $145
line 257
;257:		value = Info_ValueForKey( userinfo, "team" );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $153
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 258
;258:		if ( value[0] == 's' ) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 115
NEI4 $160
line 260
;259:			// a willing spectator, not a waiting-in-line
;260:			sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 261
;261:		} else {
ADDRGP4 $161
JUMPV
LABELV $160
line 262
;262:			switch ( g_gametype.integer ) {
ADDRLP4 16
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $162
ADDRLP4 16
INDIRI4
CNSTI4 4
GTI4 $162
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $175
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $175
address $165
address $165
address $165
address $171
address $165
code
LABELV $162
LABELV $165
line 268
;263:			default:
;264:			case GT_FFA:
;265:			case GT_HOLOCRON:
;266:			case GT_JEDIMASTER:
;267:			case GT_SINGLE_PLAYER:
;268:				if ( g_maxGameClients.integer > 0 && 
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $166
ADDRGP4 level+88
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $166
line 269
;269:					level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 270
;270:					sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 271
;271:				} else {
ADDRGP4 $163
JUMPV
LABELV $166
line 272
;272:					sess->sessionTeam = TEAM_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 273
;273:				}
line 274
;274:				break;
ADDRGP4 $163
JUMPV
LABELV $171
line 277
;275:			case GT_TOURNAMENT:
;276:				// if the game is full, go into a waiting mode
;277:				if ( level.numNonSpectatorClients >= 2 ) {
ADDRGP4 level+88
INDIRI4
CNSTI4 2
LTI4 $172
line 278
;278:					sess->sessionTeam = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 3
ASGNI4
line 279
;279:				} else {
ADDRGP4 $163
JUMPV
LABELV $172
line 280
;280:					sess->sessionTeam = TEAM_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 281
;281:				}
line 282
;282:				break;
LABELV $163
line 284
;283:			}
;284:		}
LABELV $161
line 285
;285:	}
LABELV $146
line 287
;286:
;287:	sess->spectatorState = SPECTATOR_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 288
;288:	sess->spectatorOrder = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 290
;289:
;290:	DF_SetSubContestDefaults( client ); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DF_SetSubContestDefaults
CALLV
pop
line 292
;291:	
;292:	client->sess.sessionInitialized = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 43580
ADDP4
CNSTI4 1
ASGNI4
line 294
;293:
;294:	G_WriteClientSessionData( client );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 295
;295:}
LABELV $141
endproc G_InitSessionData 28 8
export G_InitWorldSession
proc G_InitWorldSession 1032 12
line 304
;296:
;297:
;298:/*
;299:==================
;300:G_InitWorldSession
;301:
;302:==================
;303:*/
;304:void G_InitWorldSession( void ) {
line 308
;305:	char	s[MAX_STRING_CHARS];
;306:	int			gt;
;307:
;308:	trap_Cvar_VariableStringBuffer( "session", s, sizeof(s) );
ADDRGP4 $177
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 309
;309:	gt = atoi( s );
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1028
INDIRI4
ASGNI4
line 313
;310:	
;311:	// if the gametype changed since the last session, don't use any
;312:	// client sessions
;313:	if ( g_gametype.integer != gt ) {
ADDRGP4 g_gametype+12
INDIRI4
ADDRLP4 1024
INDIRI4
EQI4 $178
line 314
;314:		level.newSession = qtrue;
ADDRGP4 level+72
CNSTI4 1
ASGNI4
line 315
;315:		G_Printf( "Gametype changed, clearing session data.\n" );
ADDRGP4 $182
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 316
;316:	}
LABELV $178
line 317
;317:}
LABELV $176
endproc G_InitWorldSession 1032 12
export G_WriteSessionData
proc G_WriteSessionData 8 8
line 325
;318:
;319:/*
;320:==================
;321:G_WriteSessionData
;322:
;323:==================
;324:*/
;325:void G_WriteSessionData( void ) {
line 328
;326:	int		i;
;327:
;328:	trap_Cvar_Set( "session", va("%i", g_gametype.integer) );
ADDRGP4 $184
ARGP4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $177
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 330
;329:
;330:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $189
JUMPV
LABELV $186
line 331
;331:		if ( level.clients[i].pers.connected == CON_CONNECTED ) {
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
NEI4 $191
line 332
;332:			G_WriteClientSessionData( &level.clients[i] );
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 333
;333:		}
LABELV $191
line 334
;334:	}
LABELV $187
line 330
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $189
ADDRLP4 0
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $186
line 335
;335:}
LABELV $183
endproc G_WriteSessionData 8 8
import UpdateClientRaceVars
import DF_RequestPlayerDefaultTime
import DF_SetSubContestDefaults
import DF_CarryClientOverToNewRaceStyle
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
LABELV $184
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $182
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
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
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $177
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $153
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $130
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 109
byte 1 118
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $125
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
LABELV $124
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $121
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
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
