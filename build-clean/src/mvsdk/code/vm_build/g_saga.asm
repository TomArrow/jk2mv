export InitSagaMode
code
proc InitSagaMode 9072 16
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_saga.c"
line 23
;1:#include "g_local.h"
;2:#include "bg_saga.h"
;3:
;4:char		saga_info[MAX_SAGA_INFO_SIZE];
;5:int			saga_valid;
;6:int			saga_round_over;
;7:
;8:int			imperial_goals_required;
;9:int			imperial_goals_completed;
;10:int			rebel_goals_required;
;11:int			rebel_goals_completed;
;12:
;13:int			rebel_attackers;
;14:int			imperial_attackers;
;15:
;16:void LogExit( const char *string );
;17:
;18:int GetValueGroup(char *buf, char *group, char *outbuf);
;19:int GetPairedValue(char *buf, char *key, char *outbuf);
;20://Using the bot parsing functions on saga ini's, at least for now.
;21:
;22:void InitSagaMode(void)
;23:{
line 28
;24:	vmCvar_t		mapname;
;25:	char			levelname[512];
;26:	char			goalreq[64];
;27:	char			objectives[MAX_SAGA_INFO_SIZE];
;28:	int				len = 0;
ADDRLP4 8704
CNSTI4 0
ASGNI4
line 31
;29:	fileHandle_t	f;
;30:
;31:	if (g_gametype.integer != GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $121
line 32
;32:	{
line 33
;33:		goto failure;
ADDRGP4 $124
JUMPV
LABELV $121
line 36
;34:	}
;35:
;36:	imperial_goals_completed = 0;
ADDRGP4 imperial_goals_completed
CNSTI4 0
ASGNI4
line 37
;37:	rebel_goals_completed = 0;
ADDRGP4 rebel_goals_completed
CNSTI4 0
ASGNI4
line 39
;38:
;39:	saga_round_over = 0;
ADDRGP4 saga_round_over
CNSTI4 0
ASGNI4
line 41
;40:
;41:	trap_Cvar_Register( &mapname, "mapname", "", CVAR_SERVERINFO | CVAR_ROM );
ADDRLP4 8776
ARGP4
ADDRGP4 $125
ARGP4
ADDRGP4 $126
ARGP4
CNSTI4 68
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 43
;42:
;43:	Com_sprintf(levelname, sizeof(levelname), "maps/%s.saga", mapname.string);
ADDRLP4 0
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 $127
ARGP4
ADDRLP4 8776+16
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 45
;44:
;45:	if (!levelname[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $129
line 46
;46:	{
line 47
;47:		goto failure;
ADDRGP4 $124
JUMPV
LABELV $129
line 50
;48:	}
;49:
;50:	len = trap_FS_FOpenFile(levelname, &f, FS_READ);
ADDRLP4 0
ARGP4
ADDRLP4 8772
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 9048
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 8704
ADDRLP4 9048
INDIRI4
ASGNI4
line 52
;51:
;52:	if (!f || len >= MAX_SAGA_INFO_SIZE)
ADDRLP4 8772
INDIRI4
CNSTI4 0
EQI4 $133
ADDRLP4 8704
INDIRI4
CNSTI4 8192
LTI4 $131
LABELV $133
line 53
;53:	{
line 54
;54:		goto failure;
ADDRGP4 $124
JUMPV
LABELV $131
line 57
;55:	}
;56:
;57:	trap_FS_Read(saga_info, len, f);
ADDRGP4 saga_info
ARGP4
ADDRLP4 8704
INDIRI4
ARGI4
ADDRLP4 8772
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 59
;58:
;59:	saga_valid = 1;
ADDRGP4 saga_valid
CNSTI4 1
ASGNI4
line 61
;60:
;61:	if (GetValueGroup(saga_info, "Rebel", objectives))
ADDRGP4 saga_info
ARGP4
ADDRGP4 $136
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 9052
ADDRGP4 GetValueGroup
CALLI4
ASGNI4
ADDRLP4 9052
INDIRI4
CNSTI4 0
EQI4 $134
line 62
;62:	{
line 63
;63:		if (GetPairedValue(objectives, "RequiredObjectives", goalreq))
ADDRLP4 512
ARGP4
ADDRGP4 $139
ARGP4
ADDRLP4 8708
ARGP4
ADDRLP4 9056
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 9056
INDIRI4
CNSTI4 0
EQI4 $137
line 64
;64:		{
line 65
;65:			rebel_goals_required = atoi(goalreq);
ADDRLP4 8708
ARGP4
ADDRLP4 9060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 rebel_goals_required
ADDRLP4 9060
INDIRI4
ASGNI4
line 66
;66:		}
LABELV $137
line 67
;67:		if (GetPairedValue(objectives, "attackers", goalreq))
ADDRLP4 512
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 8708
ARGP4
ADDRLP4 9060
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 9060
INDIRI4
CNSTI4 0
EQI4 $140
line 68
;68:		{
line 69
;69:			rebel_attackers = atoi(goalreq);
ADDRLP4 8708
ARGP4
ADDRLP4 9064
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 rebel_attackers
ADDRLP4 9064
INDIRI4
ASGNI4
line 70
;70:		}
LABELV $140
line 71
;71:	}
LABELV $134
line 72
;72:	if (GetValueGroup(saga_info, "Imperial", objectives))
ADDRGP4 saga_info
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 9056
ADDRGP4 GetValueGroup
CALLI4
ASGNI4
ADDRLP4 9056
INDIRI4
CNSTI4 0
EQI4 $120
line 73
;73:	{
line 74
;74:		if (GetPairedValue(objectives, "RequiredObjectives", goalreq))
ADDRLP4 512
ARGP4
ADDRGP4 $139
ARGP4
ADDRLP4 8708
ARGP4
ADDRLP4 9060
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 9060
INDIRI4
CNSTI4 0
EQI4 $146
line 75
;75:		{
line 76
;76:			imperial_goals_required = atoi(goalreq);
ADDRLP4 8708
ARGP4
ADDRLP4 9064
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 imperial_goals_required
ADDRLP4 9064
INDIRI4
ASGNI4
line 77
;77:		}
LABELV $146
line 78
;78:		if (GetPairedValue(objectives, "attackers", goalreq))
ADDRLP4 512
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 8708
ARGP4
ADDRLP4 9064
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 9064
INDIRI4
CNSTI4 0
EQI4 $120
line 79
;79:		{
line 80
;80:			imperial_attackers = atoi(goalreq);
ADDRLP4 8708
ARGP4
ADDRLP4 9068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 imperial_attackers
ADDRLP4 9068
INDIRI4
ASGNI4
line 81
;81:		}
line 82
;82:	}
line 84
;83:
;84:	return;
ADDRGP4 $120
JUMPV
LABELV $124
line 87
;85:
;86:failure:
;87:	saga_valid = 0;
ADDRGP4 saga_valid
CNSTI4 0
ASGNI4
line 88
;88:}
LABELV $120
endproc InitSagaMode 9072 16
export UseSagaTarget
proc UseSagaTarget 32 12
line 91
;89:
;90:void UseSagaTarget(gentity_t *other, gentity_t *en, char *target)
;91:{ //actually use the player which triggered the object which triggered the saga objective to trigger the target
line 95
;92:	gentity_t		*t;
;93:	gentity_t		*ent;
;94:
;95:	if ( !en || !en->client )
ADDRLP4 8
ADDRFP4 4
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
EQU4 $153
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
NEU4 $151
LABELV $153
line 96
;96:	{ //looks like we don't have access to a player, so just use the activating entity
line 97
;97:		ent = other;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 98
;98:	}
ADDRGP4 $152
JUMPV
LABELV $151
line 100
;99:	else
;100:	{
line 101
;101:		ent = en;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 102
;102:	}
LABELV $152
line 104
;103:
;104:	if (!en)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $154
line 105
;105:	{
line 106
;106:		return;
ADDRGP4 $150
JUMPV
LABELV $154
line 109
;107:	}
;108:
;109:	if ( !target )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $156
line 110
;110:	{
line 111
;111:		return;
ADDRGP4 $150
JUMPV
LABELV $156
line 114
;112:	}
;113:
;114:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $159
JUMPV
LABELV $158
line 116
;115:	while ( (t = G_Find (t, FOFS(targetname), target)) != NULL )
;116:	{
line 117
;117:		if ( t == ent )
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $161
line 118
;118:		{
line 119
;119:			G_Printf ("WARNING: Entity used itself.\n");
ADDRGP4 $163
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 120
;120:		}
ADDRGP4 $162
JUMPV
LABELV $161
line 122
;121:		else
;122:		{
line 123
;123:			if ( t && t->use )
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $164
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $164
line 124
;124:			{
line 125
;125:				t->use (t, ent, ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CALLV
pop
line 126
;126:			}
LABELV $164
line 127
;127:		}
LABELV $162
line 128
;128:		if ( ent && !ent->inuse )
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $166
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $166
line 129
;129:		{
line 130
;130:			G_Printf("entity was removed while using targets\n");
ADDRGP4 $168
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 131
;131:			return;
ADDRGP4 $150
JUMPV
LABELV $166
line 133
;132:		}
;133:	}
LABELV $159
line 115
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 596
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
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
NEU4 $158
line 134
;134:}
LABELV $150
endproc UseSagaTarget 32 12
export SagaBroadcast_OBJECTIVECOMPLETE
proc SagaBroadcast_OBJECTIVECOMPLETE 28 8
line 137
;135:
;136:void SagaBroadcast_OBJECTIVECOMPLETE(int team, int client, int objective)
;137:{
line 141
;138:	gentity_t *te;
;139:	vec3_t nomatter;
;140:
;141:	VectorClear(nomatter);
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 4+8
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 143
;142:
;143:	te = G_TempEntity( nomatter, EV_SAGA_OBJECTIVECOMPLETE );
ADDRLP4 4
ARGP4
CNSTI4 89
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 144
;144:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 145
;145:	te->s.eventParm = team;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 146
;146:	te->s.weapon = client;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 147
;147:	te->s.trickedentindex = objective;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 148
;148:}
LABELV $169
endproc SagaBroadcast_OBJECTIVECOMPLETE 28 8
export SagaBroadcast_ROUNDOVER
proc SagaBroadcast_ROUNDOVER 28 8
line 151
;149:
;150:void SagaBroadcast_ROUNDOVER(int winningteam, int winningclient)
;151:{
line 155
;152:	gentity_t *te;
;153:	vec3_t nomatter;
;154:
;155:	VectorClear(nomatter);
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 4+8
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 157
;156:
;157:	te = G_TempEntity( nomatter, EV_SAGA_ROUNDOVER );
ADDRLP4 4
ARGP4
CNSTI4 88
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 158
;158:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 159
;159:	te->s.eventParm = winningteam;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 160
;160:	te->s.weapon = winningclient;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 161
;161:}
LABELV $172
endproc SagaBroadcast_ROUNDOVER 28 8
export BroadcastObjectiveCompletion
proc BroadcastObjectiveCompletion 12 12
line 164
;162:
;163:void BroadcastObjectiveCompletion(int team, int objective, int final, int client)
;164:{
line 165
;165:	if (client != ENTITYNUM_NONE && g_entities[client].client && (int)g_entities[client].client->sess.sessionTeam == team)
ADDRLP4 0
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1023
EQI4 $176
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $176
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $176
line 166
;166:	{ //guy who completed this objective gets points, providing he's on the opposing team
line 167
;167:		AddScore(&g_entities[client], g_entities[client].client->ps.origin, SAGA_POINTS_OBJECTIVECOMPLETED);
ADDRLP4 8
CNSTI4 2352
ADDRFP4 12
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 168
;168:	}
LABELV $176
line 170
;169:	
;170:	SagaBroadcast_OBJECTIVECOMPLETE(team, client, objective);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 SagaBroadcast_OBJECTIVECOMPLETE
CALLV
pop
line 172
;171:	//G_Printf("Broadcast goal completion team %i objective %i final %i\n", team, objective, final);
;172:}
LABELV $175
endproc BroadcastObjectiveCompletion 12 12
export AddSagaWinningTeamPoints
proc AddSagaWinningTeamPoints 24 12
line 175
;173:
;174:void AddSagaWinningTeamPoints(int team, int winner)
;175:{
line 176
;176:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $183
JUMPV
LABELV $182
line 180
;177:	gentity_t *ent;
;178:
;179:	while (i < MAX_CLIENTS)
;180:	{
line 181
;181:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 183
;182:
;183:		if (ent && ent->client && (int)ent->client->sess.sessionTeam == team)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $185
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $185
ADDRLP4 16
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $185
line 184
;184:		{
line 185
;185:			if (i == winner)
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $187
line 186
;186:			{
line 187
;187:				AddScore(ent, ent->client->ps.origin, SAGA_POINTS_TEAMWONROUND+SAGA_POINTS_FINALOBJECTIVECOMPLETED);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 188
;188:			}
ADDRGP4 $188
JUMPV
LABELV $187
line 190
;189:			else
;190:			{
line 191
;191:				AddScore(ent, ent->client->ps.origin, SAGA_POINTS_TEAMWONROUND);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 192
;192:			}
LABELV $188
line 193
;193:		}
LABELV $185
line 195
;194:
;195:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 196
;196:	}
LABELV $183
line 179
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $182
line 197
;197:}
LABELV $181
endproc AddSagaWinningTeamPoints 24 12
export SagaRoundComplete
proc SagaRoundComplete 24 8
line 200
;198:
;199:void SagaRoundComplete(int winningteam, int winningclient)
;200:{
line 203
;201:	vec3_t nomatter;
;202:
;203:	saga_round_over = 1;
ADDRGP4 saga_round_over
CNSTI4 1
ASGNI4
line 207
;204:
;205:	//G_Printf("Team %i won\n", winningteam);
;206:
;207:	if (winningclient != ENTITYNUM_NONE && g_entities[winningclient].client &&
ADDRLP4 12
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1023
EQI4 $190
ADDRLP4 16
CNSTI4 2352
ADDRLP4 12
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $190
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $190
line 209
;208:		(int)g_entities[winningclient].client->sess.sessionTeam != winningteam)
;209:	{ //this person just won the round for the other team..
line 210
;210:		winningclient = ENTITYNUM_NONE;
ADDRFP4 4
CNSTI4 1023
ASGNI4
line 211
;211:	}
LABELV $190
line 213
;212:
;213:	VectorClear(nomatter);
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 215
;214:
;215:	SagaBroadcast_ROUNDOVER(winningteam, winningclient);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 SagaBroadcast_ROUNDOVER
CALLV
pop
line 217
;216:
;217:	AddSagaWinningTeamPoints(winningteam, winningclient);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 AddSagaWinningTeamPoints
CALLV
pop
line 219
;218:
;219:	if (winningteam == SAGATEAM_IMPERIAL)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $196
line 220
;220:	{
line 221
;221:		LogExit( "The Imperials completed their final objective." );
ADDRGP4 $198
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 222
;222:	}
ADDRGP4 $197
JUMPV
LABELV $196
line 224
;223:	else
;224:	{
line 225
;225:		LogExit( "The Rebels completed their final objective." );
ADDRGP4 $199
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 226
;226:	}
LABELV $197
line 227
;227:}
LABELV $189
endproc SagaRoundComplete 24 8
export SagaObjectiveCompleted
proc SagaObjectiveCompleted 12 16
line 230
;228:
;229:void SagaObjectiveCompleted(int team, int objective, int final, int client)
;230:{
line 233
;231:	int goals_completed, goals_required;
;232:
;233:	if (saga_round_over)
ADDRGP4 saga_round_over
INDIRI4
CNSTI4 0
EQI4 $201
line 234
;234:	{
line 235
;235:		return;
ADDRGP4 $200
JUMPV
LABELV $201
line 238
;236:	}
;237:
;238:	if (final != -1)
ADDRFP4 8
INDIRI4
CNSTI4 -1
EQI4 $203
line 239
;239:	{
line 240
;240:		if (team == SAGATEAM_IMPERIAL)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $205
line 241
;241:		{
line 242
;242:			imperial_goals_completed++;
ADDRLP4 8
ADDRGP4 imperial_goals_completed
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 243
;243:		}
ADDRGP4 $206
JUMPV
LABELV $205
line 245
;244:		else
;245:		{
line 246
;246:			rebel_goals_completed++;
ADDRLP4 8
ADDRGP4 rebel_goals_completed
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 247
;247:		}
LABELV $206
line 248
;248:	}
LABELV $203
line 250
;249:
;250:	if (team == SAGATEAM_IMPERIAL)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $207
line 251
;251:	{
line 252
;252:		goals_completed = imperial_goals_completed;
ADDRLP4 0
ADDRGP4 imperial_goals_completed
INDIRI4
ASGNI4
line 253
;253:		goals_required = imperial_goals_required;
ADDRLP4 4
ADDRGP4 imperial_goals_required
INDIRI4
ASGNI4
line 254
;254:	}
ADDRGP4 $208
JUMPV
LABELV $207
line 256
;255:	else
;256:	{
line 257
;257:		goals_completed = rebel_goals_completed;
ADDRLP4 0
ADDRGP4 rebel_goals_completed
INDIRI4
ASGNI4
line 258
;258:		goals_required = rebel_goals_required;
ADDRLP4 4
ADDRGP4 rebel_goals_required
INDIRI4
ASGNI4
line 259
;259:	}
LABELV $208
line 261
;260:
;261:	if (final == 1 || goals_completed >= goals_required)
ADDRFP4 8
INDIRI4
CNSTI4 1
EQI4 $211
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $209
LABELV $211
line 262
;262:	{
line 263
;263:		SagaRoundComplete(team, client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 SagaRoundComplete
CALLV
pop
line 264
;264:	}
ADDRGP4 $210
JUMPV
LABELV $209
line 266
;265:	else
;266:	{
line 267
;267:		BroadcastObjectiveCompletion(team, objective, final, client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 BroadcastObjectiveCompletion
CALLV
pop
line 268
;268:	}
LABELV $210
line 269
;269:}
LABELV $200
endproc SagaObjectiveCompleted 12 16
export StripTabs
proc StripTabs 12 0
line 272
;270:
;271:void StripTabs(char *buf)
;272:{
line 273
;273:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 274
;274:	int i_r = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $213
line 277
;275:
;276:	while (buf[i])
;277:	{
line 278
;278:		if (buf[i] != 9)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 9
EQI4 $216
line 279
;279:		{
line 280
;280:			buf[i_r] = buf[i];
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 281
;281:			i_r++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 282
;282:		}
LABELV $216
line 284
;283:
;284:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 285
;285:	}
LABELV $214
line 276
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $213
line 286
;286:	buf[i_r] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 287
;287:}
LABELV $212
endproc StripTabs 12 0
export sagaTriggerUse
proc sagaTriggerUse 16556 16
line 290
;288:
;289:void sagaTriggerUse(gentity_t *ent, gentity_t *other, gentity_t *activator)
;290:{
line 295
;291:	char			teamstr[64];
;292:	char			objectivestr[64];
;293:	char			objectives[MAX_SAGA_INFO_SIZE];
;294:	char			desiredobjective[MAX_SAGA_INFO_SIZE];
;295:	int				clUser = ENTITYNUM_NONE;
ADDRLP4 8260
CNSTI4 1023
ASGNI4
line 296
;296:	int				final = 0;
ADDRLP4 8328
CNSTI4 0
ASGNI4
line 297
;297:	int				i = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
line 299
;298:
;299:	if (!saga_valid)
ADDRGP4 saga_valid
INDIRI4
CNSTI4 0
NEI4 $219
line 300
;300:	{
line 301
;301:		return;
ADDRGP4 $218
JUMPV
LABELV $219
line 304
;302:	}
;303:
;304:	if (activator && activator->client)
ADDRLP4 16524
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 16528
CNSTU4 0
ASGNU4
ADDRLP4 16524
INDIRP4
CVPU4 4
ADDRLP4 16528
INDIRU4
EQU4 $221
ADDRLP4 16524
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16528
INDIRU4
EQU4 $221
line 305
;305:	{ //activator will hopefully be the person who triggered this event
line 306
;306:		clUser = activator->s.number;
ADDRLP4 8260
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 307
;307:	}
LABELV $221
line 309
;308:
;309:	if (ent->side == SAGATEAM_IMPERIAL)
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
CNSTI4 1
NEI4 $223
line 310
;310:	{
line 311
;311:		Com_sprintf(teamstr, sizeof(teamstr), "Imperial");
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $145
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 312
;312:	}
ADDRGP4 $224
JUMPV
LABELV $223
line 314
;313:	else
;314:	{
line 315
;315:		Com_sprintf(teamstr, sizeof(teamstr), "Rebel");
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $136
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 316
;316:	}
LABELV $224
line 318
;317:
;318:	if (GetValueGroup(saga_info, teamstr, objectives))
ADDRGP4 saga_info
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 16532
ADDRGP4 GetValueGroup
CALLI4
ASGNI4
ADDRLP4 16532
INDIRI4
CNSTI4 0
EQI4 $225
line 319
;319:	{
line 320
;320:		Com_sprintf(objectivestr, sizeof(objectivestr), "Objective%i", ent->objective);
ADDRLP4 8264
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $227
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 322
;321:
;322:		StripTabs(objectives); //tabs confuse the parsing function
ADDRLP4 68
ARGP4
ADDRGP4 StripTabs
CALLV
pop
line 324
;323:
;324:		if (GetValueGroup(objectives, objectivestr, desiredobjective))
ADDRLP4 68
ARGP4
ADDRLP4 8264
ARGP4
ADDRLP4 8332
ARGP4
ADDRLP4 16536
ADDRGP4 GetValueGroup
CALLI4
ASGNI4
ADDRLP4 16536
INDIRI4
CNSTI4 0
EQI4 $228
line 325
;325:		{
line 326
;326:			if (GetPairedValue(desiredobjective, "final", teamstr))
ADDRLP4 8332
ARGP4
ADDRGP4 $232
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16540
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 16540
INDIRI4
CNSTI4 0
EQI4 $230
line 327
;327:			{
line 328
;328:				final = atoi(teamstr);
ADDRLP4 0
ARGP4
ADDRLP4 16544
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8328
ADDRLP4 16544
INDIRI4
ASGNI4
line 329
;329:			}
LABELV $230
line 331
;330:
;331:			if (GetPairedValue(desiredobjective, "target", teamstr))
ADDRLP4 8332
ARGP4
ADDRGP4 $235
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16544
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 16544
INDIRI4
CNSTI4 0
EQI4 $233
line 332
;332:			{
ADDRGP4 $237
JUMPV
LABELV $236
line 334
;333:				while (teamstr[i])
;334:				{
line 335
;335:					if (teamstr[i] == '\r' ||
ADDRLP4 16548
ADDRLP4 64
INDIRI4
ADDRLP4 0
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16548
INDIRI4
CNSTI4 13
EQI4 $241
ADDRLP4 16548
INDIRI4
CNSTI4 10
NEI4 $239
LABELV $241
line 337
;336:						teamstr[i] == '\n')
;337:					{
line 338
;338:						teamstr[i] = '\0';
ADDRLP4 64
INDIRI4
ADDRLP4 0
ADDP4
CNSTI1 0
ASGNI1
line 339
;339:					}
LABELV $239
line 341
;340:
;341:					i++;
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 342
;342:				}
LABELV $237
line 333
ADDRLP4 64
INDIRI4
ADDRLP4 0
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $236
line 343
;343:				UseSagaTarget(other, activator, teamstr);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 UseSagaTarget
CALLV
pop
line 344
;344:			}
LABELV $233
line 346
;345:
;346:			if (ent->target && ent->target[0])
ADDRLP4 16548
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16548
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $242
ADDRLP4 16548
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $242
line 347
;347:			{ //use this too
line 348
;348:				UseSagaTarget(other, activator, ent->target);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRGP4 UseSagaTarget
CALLV
pop
line 349
;349:			}
LABELV $242
line 351
;350:
;351:			SagaObjectiveCompleted(ent->side, ent->objective, final, clUser);
ADDRLP4 16552
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16552
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ARGI4
ADDRLP4 16552
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ARGI4
ADDRLP4 8328
INDIRI4
ARGI4
ADDRLP4 8260
INDIRI4
ARGI4
ADDRGP4 SagaObjectiveCompleted
CALLV
pop
line 352
;352:		}
LABELV $228
line 353
;353:	}
LABELV $225
line 354
;354:}
LABELV $218
endproc sagaTriggerUse 16556 16
export SP_info_saga_objective
proc SP_info_saga_objective 8 12
line 362
;355:
;356:
;357:/*QUAKED info_saga_objective (1 0 1) (-16 -16 -24) (16 16 32)
;358:"objective" - specifies the objective to complete upon activation
;359:"side" - set to 1 to specify an imperial goal, 2 to specify rebels
;360:*/
;361:void SP_info_saga_objective (gentity_t *ent)
;362:{
line 363
;363:	if (!saga_valid || g_gametype.integer != GT_SAGA)
ADDRGP4 saga_valid
INDIRI4
CNSTI4 0
EQI4 $248
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $245
LABELV $248
line 364
;364:	{
line 365
;365:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 366
;366:		return;
ADDRGP4 $244
JUMPV
LABELV $245
line 369
;367:	}
;368:
;369:	ent->use = sagaTriggerUse;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 sagaTriggerUse
ASGNP4
line 370
;370:	G_SpawnInt( "objective", "0", &ent->objective);
ADDRGP4 $249
ARGP4
ADDRGP4 $250
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 371
;371:	G_SpawnInt( "side", "0", &ent->side);
ADDRGP4 $251
ARGP4
ADDRGP4 $250
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 373
;372:
;373:	if (!ent->objective || !ent->side)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $254
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $252
LABELV $254
line 374
;374:	{ //j00 fux0red something up
line 375
;375:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 376
;376:		G_Printf("ERROR: info_saga_objective without an objective or side value\n");
ADDRGP4 $255
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 377
;377:		return;
LABELV $252
line 379
;378:	}
;379:}
LABELV $244
endproc SP_info_saga_objective 8 12
import GetPairedValue
import GetValueGroup
import LogExit
bss
export imperial_attackers
align 4
LABELV imperial_attackers
skip 4
export rebel_attackers
align 4
LABELV rebel_attackers
skip 4
export rebel_goals_completed
align 4
LABELV rebel_goals_completed
skip 4
export rebel_goals_required
align 4
LABELV rebel_goals_required
skip 4
export imperial_goals_completed
align 4
LABELV imperial_goals_completed
skip 4
export imperial_goals_required
align 4
LABELV imperial_goals_required
skip 4
export saga_round_over
align 4
LABELV saga_round_over
skip 4
export saga_valid
align 4
LABELV saga_valid
skip 4
export saga_info
align 1
LABELV saga_info
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
LABELV $255
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 115
byte 1 97
byte 1 103
byte 1 97
byte 1 95
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $251
byte 1 115
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $250
byte 1 48
byte 1 0
align 1
LABELV $249
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $235
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $232
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $227
byte 1 79
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $199
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 82
byte 1 101
byte 1 98
byte 1 101
byte 1 108
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 114
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $198
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 73
byte 1 109
byte 1 112
byte 1 101
byte 1 114
byte 1 105
byte 1 97
byte 1 108
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 114
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $168
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
LABELV $163
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
LABELV $145
byte 1 73
byte 1 109
byte 1 112
byte 1 101
byte 1 114
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $142
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $139
byte 1 82
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 114
byte 1 101
byte 1 100
byte 1 79
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $136
byte 1 82
byte 1 101
byte 1 98
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $127
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 115
byte 1 97
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $126
byte 1 0
align 1
LABELV $125
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
