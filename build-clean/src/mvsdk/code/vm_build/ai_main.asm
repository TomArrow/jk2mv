data
export ctfStateNames
align 4
LABELV ctfStateNames
address $127
address $128
address $129
address $130
address $131
address $132
address $133
export ctfStateDescriptions
align 4
LABELV ctfStateDescriptions
address $134
address $135
address $136
address $137
address $138
address $139
export sagaStateDescriptions
align 4
LABELV sagaStateDescriptions
address $134
address $140
address $141
export teamplayStateDescriptions
align 4
LABELV teamplayStateDescriptions
address $134
address $142
address $143
address $144
export BotStraightTPOrderCheck
code
proc BotStraightTPOrderCheck 4 0
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\ai_main.c"
line 123
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_main.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_main.c $
;10: * $Author: Mrelusive $ 
;11: * $Revision: 35 $
;12: * $Modtime: 6/06/01 1:11p $
;13: * $Date: 6/06/01 12:06p $
;14: *
;15: *****************************************************************************/
;16:
;17:
;18:#include "g_local.h"
;19:#include "q_shared.h"
;20:#include "botlib.h"		//bot lib interface
;21:#include "be_aas.h"
;22:#include "be_ea.h"
;23:#include "be_ai_char.h"
;24:#include "be_ai_chat.h"
;25:#include "be_ai_gen.h"
;26:#include "be_ai_goal.h"
;27:#include "be_ai_move.h"
;28:#include "be_ai_weap.h"
;29://
;30:#include "ai_main.h"
;31:#include "w_saber.h"
;32://
;33:#include "chars.h"
;34:#include "inv.h"
;35:#include "syn.h"
;36:
;37:/*
;38:#define BOT_CTF_DEBUG	1
;39:*/
;40:
;41:#define MAX_PATH		144
;42:
;43:#define BOT_THINK_TIME	0
;44:
;45://bot states
;46:bot_state_t	*botstates[MAX_CLIENTS];
;47://number of bots
;48:int numbots;
;49://floating point time
;50:float floattime;
;51://time to do a regular update
;52:float regularupdate_time;
;53://
;54:
;55://for saga:
;56:extern int rebel_attackers;
;57:extern int imperial_attackers;
;58:
;59:boteventtracker_t gBotEventTracker[MAX_CLIENTS];
;60:
;61://rww - new bot cvars..
;62:vmCvar_t bot_forcepowers;
;63:vmCvar_t bot_forgimmick;
;64:vmCvar_t bot_honorableduelacceptance;
;65:#ifdef _DEBUG
;66:vmCvar_t bot_nogoals;
;67:vmCvar_t bot_debugmessages;
;68:#endif
;69:
;70:vmCvar_t bot_attachments;
;71:vmCvar_t bot_camp;
;72:
;73:vmCvar_t bot_wp_info;
;74:vmCvar_t bot_wp_edit;
;75:vmCvar_t bot_wp_clearweight;
;76:vmCvar_t bot_wp_distconnect;
;77:vmCvar_t bot_wp_visconnect;
;78://end rww
;79:
;80:wpobject_t *flagRed;
;81:wpobject_t *oFlagRed;
;82:wpobject_t *flagBlue;
;83:wpobject_t *oFlagBlue;
;84:
;85:gentity_t *eFlagRed;
;86:gentity_t *droppedRedFlag;
;87:gentity_t *eFlagBlue;
;88:gentity_t *droppedBlueFlag;
;89:
;90:char *ctfStateNames[] = {
;91:	"CTFSTATE_NONE",
;92:	"CTFSTATE_ATTACKER",
;93:	"CTFSTATE_DEFENDER",
;94:	"CTFSTATE_RETRIEVAL",
;95:	"CTFSTATE_GUARDCARRIER",
;96:	"CTFSTATE_GETFLAGHOME",
;97:	"CTFSTATE_MAXCTFSTATES"
;98:};
;99:
;100:char *ctfStateDescriptions[] = {
;101:	"I'm not occupied",
;102:	"I'm attacking the enemy's base",
;103:	"I'm defending our base",
;104:	"I'm getting our flag back",
;105:	"I'm escorting our flag carrier",
;106:	"I've got the enemy's flag"
;107:};
;108:
;109:char *sagaStateDescriptions[] = {
;110:	"I'm not occupied",
;111:	"I'm attemtping to complete the current objective",
;112:	"I'm preventing the enemy from completing their objective"
;113:};
;114:
;115:char *teamplayStateDescriptions[] = {
;116:	"I'm not occupied",
;117:	"I'm following my squad commander",
;118:	"I'm assisting my commanding",
;119:	"I'm attempting to regroup and form a new squad"
;120:};
;121:
;122:void BotStraightTPOrderCheck(gentity_t *ent, int ordernum, bot_state_t *bs)
;123:{
line 124
;124:	switch (ordernum)
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $148
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $151
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $152
ADDRGP4 $146
JUMPV
line 125
;125:	{
LABELV $148
line 127
;126:	case 0:
;127:		if (bs->squadLeader == ent)
ADDRFP4 8
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $147
line 128
;128:		{
line 129
;129:			bs->teamplayState = 0;
ADDRFP4 8
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 0
ASGNI4
line 130
;130:			bs->squadLeader = NULL;
ADDRFP4 8
INDIRP4
CNSTI4 1824
ADDP4
CNSTP4 0
ASGNP4
line 131
;131:		}
line 132
;132:		break;
ADDRGP4 $147
JUMPV
LABELV $151
line 134
;133:	case TEAMPLAYSTATE_FOLLOWING:
;134:		bs->teamplayState = ordernum;
ADDRFP4 8
INDIRP4
CNSTI4 2696
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 135
;135:		bs->isSquadLeader = 0;
ADDRFP4 8
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 136
;136:		bs->squadLeader = ent;
ADDRFP4 8
INDIRP4
CNSTI4 1824
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 137
;137:		bs->wpDestSwitchTime = 0;
ADDRFP4 8
INDIRP4
CNSTI4 1980
ADDP4
CNSTF4 0
ASGNF4
line 138
;138:		break;
ADDRGP4 $147
JUMPV
LABELV $152
line 140
;139:	case TEAMPLAYSTATE_ASSISTING:
;140:		bs->teamplayState = ordernum;
ADDRFP4 8
INDIRP4
CNSTI4 2696
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 141
;141:		bs->isSquadLeader = 0;
ADDRFP4 8
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 142
;142:		bs->squadLeader = ent;
ADDRFP4 8
INDIRP4
CNSTI4 1824
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 143
;143:		bs->wpDestSwitchTime = 0;
ADDRFP4 8
INDIRP4
CNSTI4 1980
ADDP4
CNSTF4 0
ASGNF4
line 144
;144:		break;
ADDRGP4 $147
JUMPV
LABELV $146
line 146
;145:	default:
;146:		bs->teamplayState = ordernum;
ADDRFP4 8
INDIRP4
CNSTI4 2696
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 147
;147:		break;
LABELV $147
line 149
;148:	}
;149:}
LABELV $145
endproc BotStraightTPOrderCheck 4 0
export BotSelectWeapon
proc BotSelectWeapon 0 8
line 152
;150:
;151:void BotSelectWeapon(int client, int weapon)
;152:{
line 153
;153:	if (weapon <= WP_NONE)
ADDRFP4 4
INDIRI4
CNSTI4 0
GTI4 $154
line 154
;154:	{
line 155
;155:		return;
ADDRGP4 $153
JUMPV
LABELV $154
line 157
;156:	}
;157:	trap_EA_SelectWeapon(client, weapon);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 158
;158:}
LABELV $153
endproc BotSelectWeapon 0 8
export BotReportStatus
proc BotReportStatus 4 8
line 161
;159:
;160:void BotReportStatus(bot_state_t *bs)
;161:{
line 162
;162:	if (g_gametype.integer == GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $157
line 163
;163:	{
line 164
;164:		trap_EA_SayTeam(bs->client, teamplayStateDescriptions[bs->teamplayState]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamplayStateDescriptions
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 165
;165:	}
ADDRGP4 $158
JUMPV
LABELV $157
line 166
;166:	else if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $160
line 167
;167:	{
line 168
;168:		trap_EA_SayTeam(bs->client, sagaStateDescriptions[bs->sagaState]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sagaStateDescriptions
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 169
;169:	}
ADDRGP4 $161
JUMPV
LABELV $160
line 170
;170:	else if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $167
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $163
LABELV $167
line 171
;171:	{
line 172
;172:		trap_EA_SayTeam(bs->client, ctfStateDescriptions[bs->ctfState]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ctfStateDescriptions
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 173
;173:	}
LABELV $163
LABELV $161
LABELV $158
line 174
;174:}
LABELV $156
endproc BotReportStatus 4 8
export BotOrder
proc BotOrder 52 12
line 177
;175:
;176:void BotOrder(gentity_t *ent, int clientnum, int ordernum)
;177:{
line 178
;178:	int stateMin = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 179
;179:	int stateMax = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 180
;180:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 182
;181:
;182:	if (!ent || !ent->client || !ent->client->sess.teamLeader)
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $172
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $172
ADDRLP4 20
INDIRP4
CNSTI4 43480
ADDP4
INDIRI4
CNSTI4 0
NEI4 $169
LABELV $172
line 183
;183:	{
line 184
;184:		return;
ADDRGP4 $168
JUMPV
LABELV $169
line 187
;185:	}
;186:
;187:	if (clientnum != -1 && !botstates[clientnum])
ADDRLP4 24
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 -1
EQI4 $173
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $173
line 188
;188:	{
line 189
;189:		return;
ADDRGP4 $168
JUMPV
LABELV $173
line 192
;190:	}
;191:
;192:	if (clientnum != -1 && !OnSameTeam(ent, &g_entities[clientnum]))
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 -1
EQI4 $175
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 28
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $175
line 193
;193:	{
line 194
;194:		return;
ADDRGP4 $168
JUMPV
LABELV $175
line 197
;195:	}
;196:
;197:	if (g_gametype.integer != GT_CTF && g_gametype.integer != GT_CTY && g_gametype.integer != GT_SAGA &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $177
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $177
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $177
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $177
line 199
;198:		g_gametype.integer != GT_TEAM)
;199:	{
line 200
;200:		return;
ADDRGP4 $168
JUMPV
LABELV $177
line 203
;201:	}
;202:
;203:	if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $187
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $183
LABELV $187
line 204
;204:	{
line 205
;205:		stateMin = CTFSTATE_NONE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 206
;206:		stateMax = CTFSTATE_MAXCTFSTATES;
ADDRLP4 8
CNSTI4 6
ASGNI4
line 207
;207:	}
ADDRGP4 $184
JUMPV
LABELV $183
line 208
;208:	else if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $188
line 209
;209:	{
line 210
;210:		stateMin = SAGASTATE_NONE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 211
;211:		stateMax = SAGASTATE_MAXSAGASTATES;
ADDRLP4 8
CNSTI4 3
ASGNI4
line 212
;212:	}
ADDRGP4 $189
JUMPV
LABELV $188
line 213
;213:	else if (g_gametype.integer == GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $191
line 214
;214:	{
line 215
;215:		stateMin = TEAMPLAYSTATE_NONE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 216
;216:		stateMax = TEAMPLAYSTATE_MAXTPSTATES;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 217
;217:	}
LABELV $191
LABELV $189
LABELV $184
line 219
;218:
;219:	if ((ordernum < stateMin && ordernum != -1) || ordernum >= stateMax)
ADDRLP4 36
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $197
ADDRLP4 36
INDIRI4
CNSTI4 -1
NEI4 $196
LABELV $197
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $194
LABELV $196
line 220
;220:	{
line 221
;221:		return;
ADDRGP4 $168
JUMPV
LABELV $194
line 224
;222:	}
;223:
;224:	if (clientnum != -1)
ADDRFP4 4
INDIRI4
CNSTI4 -1
EQI4 $206
line 225
;225:	{
line 226
;226:		if (ordernum == -1)
ADDRFP4 8
INDIRI4
CNSTI4 -1
NEI4 $200
line 227
;227:		{
line 228
;228:			BotReportStatus(botstates[clientnum]);
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 229
;229:		}
ADDRGP4 $199
JUMPV
LABELV $200
line 231
;230:		else
;231:		{
line 232
;232:			BotStraightTPOrderCheck(ent, ordernum, botstates[clientnum]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotStraightTPOrderCheck
CALLV
pop
line 233
;233:			botstates[clientnum]->state_Forced = ordernum;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 234
;234:			botstates[clientnum]->chatObject = ent;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2244
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 235
;235:			botstates[clientnum]->chatAltObject = NULL;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 236
;236:			if (BotDoChat(botstates[clientnum], "OrderAccepted", 1))
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 $204
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 BotDoChat
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $199
line 237
;237:			{
line 238
;238:				botstates[clientnum]->chatTeam = 1;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2240
ADDP4
CNSTI4 1
ASGNI4
line 239
;239:			}
line 240
;240:		}
line 241
;241:	}
ADDRGP4 $199
JUMPV
line 243
;242:	else
;243:	{
LABELV $205
line 245
;244:		while (i < MAX_CLIENTS)
;245:		{
line 246
;246:			if (botstates[i] && OnSameTeam(ent, &g_entities[i]))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $208
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $208
line 247
;247:			{
line 248
;248:				if (ordernum == -1)
ADDRFP4 8
INDIRI4
CNSTI4 -1
NEI4 $210
line 249
;249:				{
line 250
;250:					BotReportStatus(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 251
;251:				}
ADDRGP4 $211
JUMPV
LABELV $210
line 253
;252:				else
;253:				{
line 254
;254:					BotStraightTPOrderCheck(ent, ordernum, botstates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotStraightTPOrderCheck
CALLV
pop
line 255
;255:					botstates[i]->state_Forced = ordernum;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2704
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 256
;256:					botstates[i]->chatObject = ent;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2244
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 257
;257:					botstates[i]->chatAltObject = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 258
;258:					if (BotDoChat(botstates[i], "OrderAccepted", 0))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 $204
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 48
ADDRGP4 BotDoChat
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $212
line 259
;259:					{
line 260
;260:						botstates[i]->chatTeam = 1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2240
ADDP4
CNSTI4 1
ASGNI4
line 261
;261:					}
LABELV $212
line 262
;262:				}
LABELV $211
line 263
;263:			}
LABELV $208
line 265
;264:
;265:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 266
;266:		}
LABELV $206
line 244
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $205
line 267
;267:	}
LABELV $199
line 268
;268:}
LABELV $168
endproc BotOrder 52 12
export BotMindTricked
proc BotMindTricked 4 0
line 271
;269:
;270:int BotMindTricked(int botClient, int enemyClient)
;271:{
line 274
;272:	forcedata_t *fd;
;273:
;274:	if (!g_entities[enemyClient].client)
CNSTI4 2352
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $215
line 275
;275:	{
line 276
;276:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $214
JUMPV
LABELV $215
line 279
;277:	}
;278:	
;279:	fd = &g_entities[enemyClient].client->ps.fd;
ADDRLP4 0
CNSTI4 2352
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ASGNP4
line 281
;280:
;281:	if (!fd)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $219
line 282
;282:	{
line 283
;283:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $214
JUMPV
LABELV $219
line 286
;284:	}
;285:
;286:	if (botClient > 47)
ADDRFP4 0
INDIRI4
CNSTI4 47
LEI4 $221
line 287
;287:	{
line 288
;288:		if (fd->forceMindtrickTargetIndex4 & (1 << (botClient-48)))
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
CNSTI4 48
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $222
line 289
;289:		{
line 290
;290:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $214
JUMPV
line 292
;291:		}
;292:	}
LABELV $221
line 293
;293:	else if (botClient > 31)
ADDRFP4 0
INDIRI4
CNSTI4 31
LEI4 $225
line 294
;294:	{
line 295
;295:		if (fd->forceMindtrickTargetIndex3 & (1 << (botClient-32)))
ADDRLP4 0
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
CNSTI4 32
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $226
line 296
;296:		{
line 297
;297:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $214
JUMPV
line 299
;298:		}
;299:	}
LABELV $225
line 300
;300:	else if (botClient > 15)
ADDRFP4 0
INDIRI4
CNSTI4 15
LEI4 $229
line 301
;301:	{
line 302
;302:		if (fd->forceMindtrickTargetIndex2 & (1 << (botClient-16)))
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
CNSTI4 16
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $230
line 303
;303:		{
line 304
;304:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $214
JUMPV
line 306
;305:		}
;306:	}
LABELV $229
line 308
;307:	else
;308:	{
line 309
;309:		if (fd->forceMindtrickTargetIndex & (1 << botClient))
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $233
line 310
;310:		{
line 311
;311:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $214
JUMPV
LABELV $233
line 313
;312:		}
;313:	}
LABELV $230
LABELV $226
LABELV $222
line 315
;314:
;315:	return 0;
CNSTI4 0
RETI4
LABELV $214
endproc BotMindTricked 4 0
export BotAI_Print
proc BotAI_Print 0 0
line 323
;316:}
;317:
;318:int BotGetWeaponRange(bot_state_t *bs);
;319:int PassLovedOneCheck(bot_state_t *bs, gentity_t *ent);
;320:
;321:void ExitLevel( void );
;322:
;323:void QDECL BotAI_Print(int type, char *fmt, ...) { return; }
LABELV $235
endproc BotAI_Print 0 0
export IsTeamplay
proc IsTeamplay 0 0
line 328
;324:
;325:qboolean WP_ForcePowerUsable( gentity_t *self, forcePowers_t forcePower );
;326:
;327:int IsTeamplay(void)
;328:{
line 329
;329:	if ( g_gametype.integer < GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
GEI4 $237
line 330
;330:	{
line 331
;331:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $236
JUMPV
LABELV $237
line 334
;332:	}
;333:
;334:	return 1;
CNSTI4 1
RETI4
LABELV $236
endproc IsTeamplay 0 0
export BotAI_GetClientState
proc BotAI_GetClientState 4 12
line 342
;335:}
;336:
;337:/*
;338:==================
;339:BotAI_GetClientState
;340:==================
;341:*/
;342:int BotAI_GetClientState( int clientNum, playerState_t *state ) {
line 345
;343:	gentity_t	*ent;
;344:
;345:	ent = &g_entities[clientNum];
ADDRLP4 0
CNSTI4 2352
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 346
;346:	if ( !ent->inuse ) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $241
line 347
;347:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $240
JUMPV
LABELV $241
line 349
;348:	}
;349:	if ( !ent->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $243
line 350
;350:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $240
JUMPV
LABELV $243
line 353
;351:	}
;352:
;353:	memcpy( state, &ent->client->ps, sizeof(playerState_t) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
CNSTU4 1380
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 354
;354:	return qtrue;
CNSTI4 1
RETI4
LABELV $240
endproc BotAI_GetClientState 4 12
export BotAI_GetEntityState
proc BotAI_GetEntityState 4 12
line 362
;355:}
;356:
;357:/*
;358:==================
;359:BotAI_GetEntityState
;360:==================
;361:*/
;362:int BotAI_GetEntityState( int entityNum, entityState_t *state ) {
line 365
;363:	gentity_t	*ent;
;364:
;365:	ent = &g_entities[entityNum];
ADDRLP4 0
CNSTI4 2352
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 366
;366:	memset( state, 0, sizeof(entityState_t) );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 296
ARGU4
ADDRGP4 memset
CALLP4
pop
line 367
;367:	if (!ent->inuse) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $246
CNSTI4 0
RETI4
ADDRGP4 $245
JUMPV
LABELV $246
line 368
;368:	if (!ent->r.linked) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 0
NEI4 $248
CNSTI4 0
RETI4
ADDRGP4 $245
JUMPV
LABELV $248
line 369
;369:	if (ent->r.svFlags & SVF_NOCLIENT) return qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $250
CNSTI4 0
RETI4
ADDRGP4 $245
JUMPV
LABELV $250
line 370
;370:	memcpy( state, &ent->s, sizeof(entityState_t) );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTU4 296
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 371
;371:	return qtrue;
CNSTI4 1
RETI4
LABELV $245
endproc BotAI_GetEntityState 4 12
export BotAI_GetSnapshotEntity
proc BotAI_GetSnapshotEntity 8 12
line 379
;372:}
;373:
;374:/*
;375:==================
;376:BotAI_GetSnapshotEntity
;377:==================
;378:*/
;379:int BotAI_GetSnapshotEntity( int clientNum, int sequence, entityState_t *state ) {
line 382
;380:	int		entNum;
;381:
;382:	entNum = trap_BotGetSnapshotEntity( clientNum, sequence );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_BotGetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 383
;383:	if ( entNum == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $253
line 384
;384:		memset(state, 0, sizeof(entityState_t));
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 296
ARGU4
ADDRGP4 memset
CALLP4
pop
line 385
;385:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $252
JUMPV
LABELV $253
line 388
;386:	}
;387:
;388:	BotAI_GetEntityState( entNum, state );
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 390
;389:
;390:	return sequence + 1;
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
RETI4
LABELV $252
endproc BotAI_GetSnapshotEntity 8 12
export BotEntityInfo
proc BotEntityInfo 0 8
line 398
;391:}
;392:
;393:/*
;394:==============
;395:BotEntityInfo
;396:==============
;397:*/
;398:void BotEntityInfo(int entnum, aas_entityinfo_t *info) {
line 399
;399:	trap_AAS_EntityInfo(entnum, info);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_AAS_EntityInfo
CALLV
pop
line 400
;400:}
LABELV $255
endproc BotEntityInfo 0 8
export NumBots
proc NumBots 0 0
line 407
;401:
;402:/*
;403:==============
;404:NumBots
;405:==============
;406:*/
;407:int NumBots(void) {
line 408
;408:	return numbots;
ADDRGP4 numbots
INDIRI4
RETI4
LABELV $256
endproc NumBots 0 0
export AngleDifference
proc AngleDifference 4 0
line 416
;409:}
;410:
;411:/*
;412:==============
;413:AngleDifference
;414:==============
;415:*/
;416:float AngleDifference(float ang1, float ang2) {
line 419
;417:	float diff;
;418:
;419:	diff = ang1 - ang2;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
ASGNF4
line 420
;420:	if (ang1 > ang2) {
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $258
line 421
;421:		if (diff > 180.0) diff -= 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $259
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 422
;422:	}
ADDRGP4 $259
JUMPV
LABELV $258
line 423
;423:	else {
line 424
;424:		if (diff < -180.0) diff += 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $262
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $262
line 425
;425:	}
LABELV $259
line 426
;426:	return diff;
ADDRLP4 0
INDIRF4
RETF4
LABELV $257
endproc AngleDifference 4 0
export BotChangeViewAngle
proc BotChangeViewAngle 16 4
line 434
;427:}
;428:
;429:/*
;430:==============
;431:BotChangeViewAngle
;432:==============
;433:*/
;434:float BotChangeViewAngle(float angle, float ideal_angle, float speed) {
line 437
;435:	float move;
;436:
;437:	angle = AngleMod(angle);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 438
;438:	ideal_angle = AngleMod(ideal_angle);
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 439
;439:	if (angle == ideal_angle) return angle;
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
NEF4 $265
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $264
JUMPV
LABELV $265
line 440
;440:	move = ideal_angle - angle;
ADDRLP4 0
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
SUBF4
ASGNF4
line 441
;441:	if (ideal_angle > angle) {
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
LEF4 $267
line 442
;442:		if (move > 180.0) move -= 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $268
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 443
;443:	}
ADDRGP4 $268
JUMPV
LABELV $267
line 444
;444:	else {
line 445
;445:		if (move < -180.0) move += 360.0;
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $271
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $271
line 446
;446:	}
LABELV $268
line 447
;447:	if (move > 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $273
line 448
;448:		if (move > speed) move = speed;
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $274
ADDRLP4 0
ADDRFP4 8
INDIRF4
ASGNF4
line 449
;449:	}
ADDRGP4 $274
JUMPV
LABELV $273
line 450
;450:	else {
line 451
;451:		if (move < -speed) move = -speed;
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $277
ADDRLP4 0
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $277
line 452
;452:	}
LABELV $274
line 453
;453:	return AngleMod(angle + move);
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
RETF4
LABELV $264
endproc BotChangeViewAngle 16 4
export BotChangeViewAngles
proc BotChangeViewAngles 84 8
line 461
;454:}
;455:
;456:/*
;457:==============
;458:BotChangeViewAngles
;459:==============
;460:*/
;461:void BotChangeViewAngles(bot_state_t *bs, float thinktime) {
line 465
;462:	float diff, factor, maxchange, anglespeed, disired_speed;
;463:	int i;
;464:
;465:	if (bs->ideal_viewangles[PITCH] > 180) bs->ideal_viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 1792
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $280
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 1792
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $280
line 467
;466:	
;467:	if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $282
ADDRLP4 28
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $282
line 468
;468:	{
line 469
;469:		factor = bs->skills.turnspeed_combat*bs->settings.skill;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 32
INDIRP4
CNSTI4 2328
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
MULF4
ASGNF4
line 470
;470:	}
ADDRGP4 $283
JUMPV
LABELV $282
line 472
;471:	else
;472:	{
line 473
;473:		factor = bs->skills.turnspeed;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 2324
ADDP4
INDIRF4
ASGNF4
line 474
;474:	}
LABELV $283
line 476
;475:
;476:	if (factor > 1)
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
LEF4 $284
line 477
;477:	{
line 478
;478:		factor = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 479
;479:	}
LABELV $284
line 480
;480:	if (factor < 0.001)
ADDRLP4 12
INDIRF4
CNSTF4 981668463
GEF4 $286
line 481
;481:	{
line 482
;482:		factor = 0.001f;
ADDRLP4 12
CNSTF4 981668463
ASGNF4
line 483
;483:	}
LABELV $286
line 485
;484:
;485:	maxchange = bs->skills.maxturn;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 2332
ADDP4
INDIRF4
ASGNF4
line 488
;486:
;487:	//if (maxchange < 240) maxchange = 240;
;488:	maxchange *= thinktime;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 489
;489:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $288
line 490
;490:		bs->viewangles[i] = AngleMod(bs->viewangles[i]);
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRF4
ASGNF4
line 491
;491:		bs->ideal_viewangles[i] = AngleMod(bs->ideal_viewangles[i]);
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1792
ADDP4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRF4
ASGNF4
line 492
;492:		diff = AngleDifference(bs->viewangles[i], bs->ideal_viewangles[i]);
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 1792
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 56
INDIRF4
ASGNF4
line 493
;493:		disired_speed = diff * factor;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 494
;494:		bs->viewanglespeed[i] += (bs->viewanglespeed[i] - disired_speed);
ADDRLP4 60
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRF4
ADDRLP4 64
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ADDF4
ASGNF4
line 495
;495:		if (bs->viewanglespeed[i] > 180) bs->viewanglespeed[i] = maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $292
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $292
line 496
;496:		if (bs->viewanglespeed[i] < -180) bs->viewanglespeed[i] = -maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
INDIRF4
CNSTF4 3274964992
GEF4 $294
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $294
line 497
;497:		anglespeed = bs->viewanglespeed[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
INDIRF4
ASGNF4
line 498
;498:		if (anglespeed > maxchange) anglespeed = maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $296
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $296
line 499
;499:		if (anglespeed < -maxchange) anglespeed = -maxchange;
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
NEGF4
GEF4 $298
ADDRLP4 4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $298
line 500
;500:		bs->viewangles[i] += anglespeed;
ADDRLP4 68
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 501
;501:		bs->viewangles[i] = AngleMod(bs->viewangles[i]);
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 72
INDIRP4
ADDRLP4 76
INDIRF4
ASGNF4
line 502
;502:		bs->viewanglespeed[i] *= 0.45 * (1 - factor);
ADDRLP4 80
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1804
ADDP4
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
CNSTF4 1055286886
CNSTF4 1065353216
ADDRLP4 12
INDIRF4
SUBF4
MULF4
MULF4
ASGNF4
line 503
;503:	}
LABELV $289
line 489
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $288
line 504
;504:	if (bs->viewangles[PITCH] > 180) bs->viewangles[PITCH] -= 360;
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $300
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $300
line 505
;505:	trap_EA_View(bs->client, bs->viewangles);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRGP4 trap_EA_View
CALLV
pop
line 506
;506:}
LABELV $279
endproc BotChangeViewAngles 84 8
export BotInputToUserCommand
proc BotInputToUserCommand 112 16
line 513
;507:
;508:/*
;509:==============
;510:BotInputToUserCommand
;511:==============
;512:*/
;513:void BotInputToUserCommand(bot_input_t *bi, usercmd_t *ucmd, int delta_angles[3], int time, int useTime) {
line 519
;514:	vec3_t angles, forward, right;
;515:	short temp;
;516:	int j;
;517:
;518:	//clear the whole structure
;519:	memset(ucmd, 0, sizeof(usercmd_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 28
ARGU4
ADDRGP4 memset
CALLP4
pop
line 523
;520:	//
;521:	//Com_Printf("dir = %f %f %f speed = %f\n", bi->dir[0], bi->dir[1], bi->dir[2], bi->speed);
;522:	//the duration for the user command in milli seconds
;523:	ucmd->serverTime = time;
ADDRFP4 4
INDIRP4
ADDRFP4 12
INDIRI4
ASGNI4
line 525
;524:	//
;525:	if (bi->actionflags & ACTION_DELAYEDJUMP) {
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $303
line 526
;526:		bi->actionflags |= ACTION_JUMP;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 527
;527:		bi->actionflags &= ~ACTION_DELAYEDJUMP;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 528
;528:	}
LABELV $303
line 530
;529:	//set the buttons
;530:	if (bi->actionflags & ACTION_RESPAWN) ucmd->buttons = BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $305
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 1
ASGNI4
LABELV $305
line 531
;531:	if (bi->actionflags & ACTION_ATTACK) ucmd->buttons |= BUTTON_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $307
ADDRLP4 44
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
LABELV $307
line 532
;532:	if (bi->actionflags & ACTION_ALT_ATTACK) ucmd->buttons |= BUTTON_ALT_ATTACK;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $309
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
LABELV $309
line 534
;533://	if (bi->actionflags & ACTION_TALK) ucmd->buttons |= BUTTON_TALK;
;534:	if (bi->actionflags & ACTION_GESTURE) ucmd->buttons |= BUTTON_GESTURE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $311
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $311
line 535
;535:	if (bi->actionflags & ACTION_USE) ucmd->buttons |= BUTTON_USE_HOLDABLE;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $313
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
LABELV $313
line 536
;536:	if (bi->actionflags & ACTION_WALK) ucmd->buttons |= BUTTON_WALKING;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $315
ADDRLP4 60
CNSTI4 16
ASGNI4
ADDRLP4 64
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
ADDRLP4 60
INDIRI4
BORI4
ASGNI4
LABELV $315
line 538
;537:
;538:	if (bi->actionflags & ACTION_FORCEPOWER) ucmd->buttons |= BUTTON_FORCEPOWER;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
EQI4 $317
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $317
line 540
;539:
;540:	if (useTime < level.time && Q_irand(1, 10, qfalse, 5) < 5)
ADDRFP4 16
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $319
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 72
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 5
GEI4 $319
line 541
;541:	{ //for now just hit use randomly in case there's something useable around
line 542
;542:		ucmd->buttons |= BUTTON_USE;
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 543
;543:	}
LABELV $319
line 556
;544:#if 0
;545:// Here's an interesting bit.  The bots in TA used buttons to do additional gestures.
;546:// I ripped them out because I didn't want too many buttons given the fact that I was already adding some for JK2.
;547:// We can always add some back in if we want though.
;548:	if (bi->actionflags & ACTION_AFFIRMATIVE) ucmd->buttons |= BUTTON_AFFIRMATIVE;
;549:	if (bi->actionflags & ACTION_NEGATIVE) ucmd->buttons |= BUTTON_NEGATIVE;
;550:	if (bi->actionflags & ACTION_GETFLAG) ucmd->buttons |= BUTTON_GETFLAG;
;551:	if (bi->actionflags & ACTION_GUARDBASE) ucmd->buttons |= BUTTON_GUARDBASE;
;552:	if (bi->actionflags & ACTION_PATROL) ucmd->buttons |= BUTTON_PATROL;
;553:	if (bi->actionflags & ACTION_FOLLOWME) ucmd->buttons |= BUTTON_FOLLOWME;
;554:#endif //0
;555:
;556:	if (bi->weapon == WP_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $322
line 557
;557:	{
line 561
;558:#ifdef _DEBUG
;559://		Com_Printf("WARNING: Bot tried to use WP_NONE!\n");
;560:#endif
;561:		bi->weapon = WP_BRYAR_PISTOL;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTI4 3
ASGNI4
line 562
;562:	}
LABELV $322
line 565
;563:
;564:	//
;565:	ucmd->weapon = bi->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 568
;566:	//set the view angles
;567:	//NOTE: the ucmd->angles are the angles WITHOUT the delta angles
;568:	ucmd->angles[PITCH] = ANGLE2SHORT(bi->viewangles[PITCH]);
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 569
;569:	ucmd->angles[YAW] = ANGLE2SHORT(bi->viewangles[YAW]);
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 570
;570:	ucmd->angles[ROLL] = ANGLE2SHORT(bi->viewangles[ROLL]);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1199570944
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 572
;571:	//subtract the delta angles
;572:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $324
line 573
;573:		temp = ucmd->angles[j] - delta_angles[j];
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
ADDRLP4 76
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRI4
SUBI4
CVII2 4
ASGNI2
line 574
;574:		ucmd->angles[j] = temp;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
ADDRLP4 4
INDIRI2
CVII4 2
ASGNI4
line 575
;575:	}
LABELV $325
line 572
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $324
line 579
;576:	//NOTE: movement is relative to the REAL view angles
;577:	//get the horizontal forward and right vector
;578:	//get the pitch in the range [-180, 180]
;579:	if (bi->dir[2]) angles[PITCH] = bi->viewangles[PITCH];
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 0
EQF4 $328
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $329
JUMPV
LABELV $328
line 580
;580:	else angles[PITCH] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
LABELV $329
line 581
;581:	angles[YAW] = bi->viewangles[YAW];
ADDRLP4 8+4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 582
;582:	angles[ROLL] = 0;
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 583
;583:	AngleVectors(angles, forward, right, NULL);
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 585
;584:	//bot input speed is in the range [0, 400]
;585:	bi->speed = bi->speed * 127 / 400;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTF4 1123942400
ADDRLP4 76
INDIRP4
INDIRF4
MULF4
CNSTF4 1137180672
DIVF4
ASGNF4
line 587
;586:	//set the view independent movement
;587:	ucmd->forwardmove = DotProduct(forward, bi->dir) * bi->speed;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 20
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 20+4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 20+8
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 80
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
CVFI4 4
CVII1 4
ASGNI1
line 588
;588:	ucmd->rightmove = DotProduct(right, bi->dir) * bi->speed;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
ADDRLP4 32
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 32+4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 32+8
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
MULF4
CVFI4 4
CVII1 4
ASGNI1
line 591
;589:	// This was probably a bug in original code. Uncommenting
;590:	// fabs(... line makes bots more eager to jump, kick and roll.
;591:	ucmd->upmove = 0; // fabs(forward[2]) * bi->dir[2] * bi->speed;
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 593
;592:	//normal keyboard movement
;593:	if (bi->actionflags & ACTION_MOVEFORWARD) ucmd->forwardmove += 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $336
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
ADDI4
CVII1 4
ASGNI1
LABELV $336
line 594
;594:	if (bi->actionflags & ACTION_MOVEBACK) ucmd->forwardmove -= 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $338
ADDRLP4 92
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
SUBI4
CVII1 4
ASGNI1
LABELV $338
line 595
;595:	if (bi->actionflags & ACTION_MOVELEFT) ucmd->rightmove -= 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $340
ADDRLP4 96
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
SUBI4
CVII1 4
ASGNI1
LABELV $340
line 596
;596:	if (bi->actionflags & ACTION_MOVERIGHT) ucmd->rightmove += 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $342
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
ADDI4
CVII1 4
ASGNI1
LABELV $342
line 598
;597:	//jump/moveup
;598:	if (bi->actionflags & ACTION_JUMP) ucmd->upmove += 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $344
ADDRLP4 104
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
ADDI4
CVII1 4
ASGNI1
LABELV $344
line 600
;599:	//crouch/movedown
;600:	if (bi->actionflags & ACTION_CROUCH) ucmd->upmove -= 127;
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $346
ADDRLP4 108
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
SUBI4
CVII1 4
ASGNI1
LABELV $346
line 604
;601:	//
;602:	//Com_Printf("forward = %d right = %d up = %d\n", ucmd.forwardmove, ucmd.rightmove, ucmd.upmove);
;603:	//Com_Printf("ucmd->serverTime = %d\n", ucmd->serverTime);
;604:}
LABELV $302
endproc BotInputToUserCommand 112 16
export BotUpdateInput
proc BotUpdateInput 64 20
line 611
;605:
;606:/*
;607:==============
;608:BotUpdateInput
;609:==============
;610:*/
;611:void BotUpdateInput(bot_state_t *bs, int time, int elapsed_time) {
line 616
;612:	bot_input_t bi;
;613:	int j;
;614:
;615:	//add the delta angles to the bot's current view angles
;616:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $349
line 617
;617:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 84
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ARGF4
ADDRLP4 56
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 52
INDIRP4
ADDRLP4 56
INDIRF4
ASGNF4
line 618
;618:	}
LABELV $350
line 616
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $349
line 620
;619:	//change the bot view angles
;620:	BotChangeViewAngles(bs, (float) elapsed_time / 1000);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRGP4 BotChangeViewAngles
CALLV
pop
line 622
;621:	//retrieve the bot input
;622:	trap_EA_GetInput(bs->client, (float) time / 1000, &bi);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 trap_EA_GetInput
CALLV
pop
line 624
;623:	//respawn hack
;624:	if (bi.actionflags & ACTION_RESPAWN) {
ADDRLP4 4+32
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $353
line 625
;625:		if (bs->lastucmd.buttons & BUTTON_ATTACK) bi.actionflags &= ~(ACTION_RESPAWN|ACTION_ATTACK);
ADDRFP4 0
INDIRP4
CNSTI4 1412
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $356
ADDRLP4 4+32
ADDRLP4 4+32
INDIRI4
CNSTI4 -10
BANDI4
ASGNI4
LABELV $356
line 626
;626:	}
LABELV $353
line 628
;627:	//convert the bot input to a usercmd
;628:	BotInputToUserCommand(&bi, &bs->lastucmd, bs->cur_ps.delta_angles, time, bs->noUseTime);
ADDRLP4 4
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 1396
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 84
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 4800
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotInputToUserCommand
CALLV
pop
line 630
;629:	//subtract the delta angles
;630:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $359
line 631
;631:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 84
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
SUBF4
ARGF4
ADDRLP4 60
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRF4
ASGNF4
line 632
;632:	}
LABELV $360
line 630
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $359
line 633
;633:}
LABELV $348
endproc BotUpdateInput 64 20
export BotAIRegularUpdate
proc BotAIRegularUpdate 0 0
line 640
;634:
;635:/*
;636:==============
;637:BotAIRegularUpdate
;638:==============
;639:*/
;640:void BotAIRegularUpdate(void) {
line 641
;641:	if (regularupdate_time < FloatTime()) {
ADDRGP4 regularupdate_time
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $364
line 642
;642:		trap_BotUpdateEntityItems();
ADDRGP4 trap_BotUpdateEntityItems
CALLV
pop
line 643
;643:		regularupdate_time = FloatTime() + 0.3;
ADDRGP4 regularupdate_time
ADDRGP4 floattime
INDIRF4
CNSTF4 1050253722
ADDF4
ASGNF4
line 644
;644:	}
LABELV $364
line 645
;645:}
LABELV $363
endproc BotAIRegularUpdate 0 0
export RemoveColorEscapeSequences
proc RemoveColorEscapeSequences 52 0
line 652
;646:
;647:/*
;648:==============
;649:RemoveColorEscapeSequences
;650:==============
;651:*/
;652:void RemoveColorEscapeSequences( char *text ) {
line 655
;653:	int i, l;
;654:
;655:	l = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 656
;656:	for ( i = 0; text[i]; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $370
JUMPV
LABELV $367
line 657
;657:		if ((jk2gameplay == VERSION_1_02 ? Q_IsColorString_1_02(&text[i]) : Q_IsColorString(&text[i]))) {
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $376
ADDRLP4 20
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $378
ADDRLP4 24
CNSTI4 94
ASGNI4
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $378
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $378
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $378
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $379
JUMPV
LABELV $378
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $379
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $377
JUMPV
LABELV $376
ADDRLP4 32
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $380
ADDRLP4 36
CNSTI4 94
ASGNI4
ADDRLP4 32
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
NEI4 $380
ADDRLP4 40
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $380
ADDRLP4 40
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $380
ADDRLP4 40
INDIRI4
CNSTI4 55
GTI4 $380
ADDRLP4 40
INDIRI4
CNSTI4 48
LTI4 $380
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $381
JUMPV
LABELV $380
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $381
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
LABELV $377
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $371
line 658
;658:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 659
;659:			continue;
ADDRGP4 $368
JUMPV
LABELV $371
line 661
;660:		}
;661:		if (text[i] > 0x7E)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 126
LEI4 $382
line 662
;662:			continue;
ADDRGP4 $368
JUMPV
LABELV $382
line 663
;663:		text[l++] = text[i];
ADDRLP4 44
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 44
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 664
;664:	}
LABELV $368
line 656
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $370
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $367
line 665
;665:	text[l] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 666
;666:}
LABELV $366
endproc RemoveColorEscapeSequences 52 0
export BotAI
proc BotAI 1080 12
line 674
;667:
;668:
;669:/*
;670:==============
;671:BotAI
;672:==============
;673:*/
;674:int BotAI(int client, float thinktime) {
line 683
;675:	bot_state_t *bs;
;676:	char buf[1024], *args;
;677:	int j;
;678:#ifdef _DEBUG
;679:	int start = 0;
;680:	int end = 0;
;681:#endif
;682:
;683:	trap_EA_ResetInput(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_EA_ResetInput
CALLV
pop
line 685
;684:	//
;685:	bs = botstates[client];
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 686
;686:	if (!bs || !bs->inuse) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $387
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $385
LABELV $387
line 687
;687:		BotAI_Print(PRT_FATAL, "BotAI: client %d is not setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $388
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 688
;688:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $384
JUMPV
LABELV $385
line 692
;689:	}
;690:
;691:	//retrieve the current client state
;692:	BotAI_GetClientState( client, &bs->cur_ps );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
ADDRGP4 $390
JUMPV
LABELV $389
line 695
;693:
;694:	//retrieve any waiting server commands
;695:	while( trap_BotGetServerCommand(client, buf, sizeof(buf)) ) {
line 697
;696:		//have buf point to the command and args to the command arguments
;697:		args = strchr( buf, ' ');
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1040
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1040
INDIRP4
ASGNP4
line 698
;698:		if (!args) continue;
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $392
ADDRGP4 $390
JUMPV
LABELV $392
line 699
;699:		*args++ = '\0';
ADDRLP4 1044
ADDRLP4 1032
INDIRP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1044
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI1 0
ASGNI1
line 702
;700:
;701:		//remove color espace sequences from the arguments
;702:		RemoveColorEscapeSequences( args );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 RemoveColorEscapeSequences
CALLV
pop
line 704
;703:
;704:		if (!Q_stricmp(buf, "cp "))
ADDRLP4 8
ARGP4
ADDRGP4 $396
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $394
line 705
;705:			{ /*CenterPrintf*/ }
ADDRGP4 $395
JUMPV
LABELV $394
line 706
;706:		else if (!Q_stricmp(buf, "cs"))
ADDRLP4 8
ARGP4
ADDRGP4 $399
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $397
line 707
;707:			{ /*ConfigStringModified*/ }
ADDRGP4 $398
JUMPV
LABELV $397
line 708
;708:		else if (!Q_stricmp(buf, "scores"))
ADDRLP4 8
ARGP4
ADDRGP4 $402
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $400
line 709
;709:			{ /*FIXME: parse scores?*/ }
ADDRGP4 $401
JUMPV
LABELV $400
line 710
;710:		else if (!Q_stricmp(buf, "clientLevelShot"))
ADDRLP4 8
ARGP4
ADDRGP4 $405
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $403
line 711
;711:			{ /*ignore*/ }
LABELV $403
LABELV $401
LABELV $398
LABELV $395
line 712
;712:	}
LABELV $390
line 695
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1040
ADDRGP4 trap_BotGetServerCommand
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $389
line 714
;713:	//add the delta angles to the bot's current view angles
;714:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $406
line 715
;715:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 1044
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1052
ADDRLP4 1044
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 1052
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 1044
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ARGF4
ADDRLP4 1056
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1052
INDIRP4
ADDRLP4 1056
INDIRF4
ASGNF4
line 716
;716:	}
LABELV $407
line 714
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $406
line 718
;717:	//increase the local time of the bot
;718:	bs->ltime += thinktime;
ADDRLP4 1044
ADDRLP4 4
INDIRP4
CNSTI4 1760
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRF4
ADDRFP4 4
INDIRF4
ADDF4
ASGNF4
line 720
;719:	//
;720:	bs->thinktime = thinktime;
ADDRLP4 4
INDIRP4
CNSTI4 1716
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 722
;721:	//origin of the bot
;722:	VectorCopy(bs->cur_ps.origin, bs->origin);
ADDRLP4 4
INDIRP4
CNSTI4 1720
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 724
;723:	//eye coordinates of the bot
;724:	VectorCopy(bs->cur_ps.origin, bs->eye);
ADDRLP4 4
INDIRP4
CNSTI4 1744
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 725
;725:	bs->eye[2] += bs->cur_ps.viewheight;
ADDRLP4 1060
ADDRLP4 4
INDIRP4
CNSTI4 1752
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 731
;726:	//get the area the bot is in
;727:
;728:#ifdef _DEBUG
;729:	start = trap_Milliseconds();
;730:#endif
;731:	StandardBotAI(bs, thinktime);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 StandardBotAI
CALLV
pop
line 744
;732:#ifdef _DEBUG
;733:	end = trap_Milliseconds();
;734:
;735:	trap_Cvar_Update(&bot_debugmessages);
;736:
;737:	if (bot_debugmessages.integer)
;738:	{
;739:		Com_Printf("Single AI frametime: %i\n", (end - start));
;740:	}
;741:#endif
;742:
;743:	//subtract the delta angles
;744:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $410
line 745
;745:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 1064
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1072
ADDRLP4 1064
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1780
ADDP4
ADDP4
ASGNP4
ADDRLP4 1072
INDIRP4
INDIRF4
CNSTF4 1001652224
ADDRLP4 1064
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
ADDP4
INDIRI4
CVIF4 4
MULF4
SUBF4
ARGF4
ADDRLP4 1076
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1072
INDIRP4
ADDRLP4 1076
INDIRF4
ASGNF4
line 746
;746:	}
LABELV $411
line 744
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $410
line 748
;747:	//everything was ok
;748:	return qtrue;
CNSTI4 1
RETI4
LABELV $384
endproc BotAI 1080 12
export BotScheduleBotThink
proc BotScheduleBotThink 12 0
line 756
;749:}
;750:
;751:/*
;752:==================
;753:BotScheduleBotThink
;754:==================
;755:*/
;756:void BotScheduleBotThink(void) {
line 759
;757:	int i, botnum;
;758:
;759:	botnum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 761
;760:
;761:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $415
line 762
;762:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $421
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $419
LABELV $421
line 763
;763:			continue;
ADDRGP4 $416
JUMPV
LABELV $419
line 766
;764:		}
;765:		//initialize the bot think residual time
;766:		botstates[i]->botthink_residual = BOT_THINK_TIME * botnum / numbots;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 numbots
INDIRI4
DIVI4
ASGNI4
line 767
;767:		botnum++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 768
;768:	}
LABELV $416
line 761
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $415
line 769
;769:}
LABELV $414
endproc BotScheduleBotThink 12 0
export PlayersInGame
proc PlayersInGame 24 0
line 772
;770:
;771:int PlayersInGame(void)
;772:{
line 773
;773:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 775
;774:	gentity_t *ent;
;775:	int pl = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $424
JUMPV
LABELV $423
line 778
;776:
;777:	while (i < MAX_CLIENTS)
;778:	{
line 779
;779:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 781
;780:
;781:		if (ent && ent->client && ent->client->pers.connected == CON_CONNECTED)
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $426
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $426
ADDRLP4 20
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $426
line 782
;782:		{
line 783
;783:			pl++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 784
;784:		}
LABELV $426
line 786
;785:
;786:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 787
;787:	}
LABELV $424
line 777
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $423
line 789
;788:
;789:	return pl;
ADDRLP4 8
INDIRI4
RETI4
LABELV $422
endproc PlayersInGame 24 0
export BotAISetupClient
proc BotAISetupClient 32 12
line 797
;790:}
;791:
;792:/*
;793:==============
;794:BotAISetupClient
;795:==============
;796:*/
;797:int BotAISetupClient(int client, struct bot_settings_s *settings, qboolean restart) {
line 800
;798:	bot_state_t *bs;
;799:
;800:	if (!botstates[client]) botstates[client] = B_Alloc(sizeof(bot_state_t)); //G_Alloc(sizeof(bot_state_t));
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $429
CNSTI4 4808
ARGI4
ADDRLP4 4
ADDRGP4 B_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
LABELV $429
line 803
;801:																			  //rww - G_Alloc bad! B_Alloc good.
;802:
;803:	memset(botstates[client], 0, sizeof(bot_state_t));
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 4808
ARGU4
ADDRGP4 memset
CALLP4
pop
line 805
;804:
;805:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 807
;806:
;807:	if (bs && bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $431
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $431
line 808
;808:		BotAI_Print(PRT_FATAL, "BotAISetupClient: client %d already setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $433
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 809
;809:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $428
JUMPV
LABELV $431
line 812
;810:	}
;811:
;812:	if ( !bs )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $434
line 813
;813:	{
line 814
;814:		BotAI_Print(PRT_FATAL, "BotAISetupClient: client %d has no bot_state\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $436
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 815
;815:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $428
JUMPV
LABELV $434
line 818
;816:	}
;817:
;818:	memcpy(&bs->settings, settings, sizeof(bot_settings_t));
ADDRLP4 0
INDIRP4
CNSTI4 1424
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTU4 292
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 820
;819:
;820:	bs->client = client; //need to know the client number before doing personality stuff
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 823
;821:
;822:	//initialize weapon weight defaults..
;823:	bs->botWeaponWeights[WP_NONE] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2624
ADDP4
CNSTF4 0
ASGNF4
line 824
;824:	bs->botWeaponWeights[WP_STUN_BATON] = 1;
ADDRLP4 0
INDIRP4
CNSTI4 2628
ADDP4
CNSTF4 1065353216
ASGNF4
line 825
;825:	bs->botWeaponWeights[WP_SABER] = 10;
ADDRLP4 0
INDIRP4
CNSTI4 2632
ADDP4
CNSTF4 1092616192
ASGNF4
line 826
;826:	bs->botWeaponWeights[WP_BRYAR_PISTOL] = 11;
ADDRLP4 0
INDIRP4
CNSTI4 2636
ADDP4
CNSTF4 1093664768
ASGNF4
line 827
;827:	bs->botWeaponWeights[WP_BLASTER] = 12;
ADDRLP4 0
INDIRP4
CNSTI4 2640
ADDP4
CNSTF4 1094713344
ASGNF4
line 828
;828:	bs->botWeaponWeights[WP_DISRUPTOR] = 13;
ADDRLP4 0
INDIRP4
CNSTI4 2644
ADDP4
CNSTF4 1095761920
ASGNF4
line 829
;829:	bs->botWeaponWeights[WP_BOWCASTER] = 14;
ADDRLP4 0
INDIRP4
CNSTI4 2648
ADDP4
CNSTF4 1096810496
ASGNF4
line 830
;830:	bs->botWeaponWeights[WP_REPEATER] = 15;
ADDRLP4 0
INDIRP4
CNSTI4 2652
ADDP4
CNSTF4 1097859072
ASGNF4
line 831
;831:	bs->botWeaponWeights[WP_DEMP2] = 16;
ADDRLP4 0
INDIRP4
CNSTI4 2656
ADDP4
CNSTF4 1098907648
ASGNF4
line 832
;832:	bs->botWeaponWeights[WP_FLECHETTE] = 17;
ADDRLP4 0
INDIRP4
CNSTI4 2660
ADDP4
CNSTF4 1099431936
ASGNF4
line 833
;833:	bs->botWeaponWeights[WP_ROCKET_LAUNCHER] = 18;
ADDRLP4 0
INDIRP4
CNSTI4 2664
ADDP4
CNSTF4 1099956224
ASGNF4
line 834
;834:	bs->botWeaponWeights[WP_THERMAL] = 14;
ADDRLP4 0
INDIRP4
CNSTI4 2668
ADDP4
CNSTF4 1096810496
ASGNF4
line 835
;835:	bs->botWeaponWeights[WP_TRIP_MINE] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2672
ADDP4
CNSTF4 0
ASGNF4
line 836
;836:	bs->botWeaponWeights[WP_DET_PACK] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 2676
ADDP4
CNSTF4 0
ASGNF4
line 838
;837:
;838:	BotUtilizePersonality(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotUtilizePersonality
CALLV
pop
line 840
;839:
;840:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $437
line 841
;841:	{
line 842
;842:		bs->botWeaponWeights[WP_SABER] = 13;
ADDRLP4 0
INDIRP4
CNSTI4 2632
ADDP4
CNSTF4 1095761920
ASGNF4
line 843
;843:	}
LABELV $437
line 846
;844:
;845:	//allocate a goal state
;846:	bs->gs = trap_BotAllocGoalState(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 trap_BotAllocGoalState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1772
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 849
;847:
;848:	//allocate a weapon state
;849:	bs->ws = trap_BotAllocWeaponState();
ADDRLP4 16
ADDRGP4 trap_BotAllocWeaponState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1776
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 851
;850:
;851:	bs->inuse = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 852
;852:	bs->entitynum = client;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 853
;853:	bs->setupcount = 4;
ADDRLP4 0
INDIRP4
CNSTI4 1756
ADDP4
CNSTI4 4
ASGNI4
line 854
;854:	bs->entergame_time = FloatTime();
ADDRLP4 0
INDIRP4
CNSTI4 1764
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 855
;855:	bs->ms = trap_BotAllocMoveState();
ADDRLP4 20
ADDRGP4 trap_BotAllocMoveState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1768
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 856
;856:	numbots++;
ADDRLP4 24
ADDRGP4 numbots
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 859
;857:
;858:	//NOTE: reschedule the bot thinking
;859:	BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 861
;860:
;861:	if (PlayersInGame())
ADDRLP4 28
ADDRGP4 PlayersInGame
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $440
line 862
;862:	{ //don't talk to yourself
line 863
;863:		BotDoChat(bs, "GeneralGreetings", 0);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $442
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 864
;864:	}
LABELV $440
line 866
;865:
;866:	return qtrue;
CNSTI4 1
RETI4
LABELV $428
endproc BotAISetupClient 32 12
export BotAIShutdownClient
proc BotAIShutdownClient 12 12
line 874
;867:}
;868:
;869:/*
;870:==============
;871:BotAIShutdownClient
;872:==============
;873:*/
;874:int BotAIShutdownClient(int client, qboolean restart) {
line 877
;875:	bot_state_t *bs;
;876:
;877:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 878
;878:	if (!bs || !bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $446
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $444
LABELV $446
line 880
;879:		//BotAI_Print(PRT_ERROR, "BotAIShutdownClient: client %d already shutdown\n", client);
;880:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $443
JUMPV
LABELV $444
line 883
;881:	}
;882:
;883:	trap_BotFreeMoveState(bs->ms);
ADDRLP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeMoveState
CALLV
pop
line 885
;884:	//free the goal state`			
;885:	trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 887
;886:	//free the weapon weights
;887:	trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 1776
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 890
;888:	//
;889:	//clear the bot state
;890:	memset(bs, 0, sizeof(bot_state_t));
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 4808
ARGU4
ADDRGP4 memset
CALLP4
pop
line 892
;891:	//set the inuse flag to qfalse
;892:	bs->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 894
;893:	//there's one bot less
;894:	numbots--;
ADDRLP4 8
ADDRGP4 numbots
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 896
;895:	//everything went ok
;896:	return qtrue;
CNSTI4 1
RETI4
LABELV $443
endproc BotAIShutdownClient 12 12
export BotResetState
proc BotResetState 1700 12
line 907
;897:}
;898:
;899:/*
;900:==============
;901:BotResetState
;902:
;903:called when a bot enters the intermission or observer mode and
;904:when the level is changed
;905:==============
;906:*/
;907:void BotResetState(bot_state_t *bs) {
line 915
;908:	int client, entitynum, inuse;
;909:	int movestate, goalstate, weaponstate;
;910:	bot_settings_t settings;
;911:	playerState_t ps;							//current player state
;912:	float entergame_time;
;913:
;914:	//save some things that should not be reset here
;915:	memcpy(&settings, &bs->settings, sizeof(bot_settings_t));
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1424
ADDP4
ARGP4
CNSTU4 292
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 916
;916:	memcpy(&ps, &bs->cur_ps, sizeof(playerState_t));
ADDRLP4 316
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
CNSTU4 1380
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 917
;917:	inuse = bs->inuse;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 918
;918:	client = bs->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 919
;919:	entitynum = bs->entitynum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 920
;920:	movestate = bs->ms;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
ASGNI4
line 921
;921:	goalstate = bs->gs;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
ASGNI4
line 922
;922:	weaponstate = bs->ws;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 1776
ADDP4
INDIRI4
ASGNI4
line 923
;923:	entergame_time = bs->entergame_time;
ADDRLP4 1696
ADDRFP4 0
INDIRP4
CNSTI4 1764
ADDP4
INDIRF4
ASGNF4
line 925
;924:	//reset the whole state
;925:	memset(bs, 0, sizeof(bot_state_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 4808
ARGU4
ADDRGP4 memset
CALLP4
pop
line 927
;926:	//copy back some state stuff that should not be reset
;927:	bs->ms = movestate;
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 928
;928:	bs->gs = goalstate;
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 929
;929:	bs->ws = weaponstate;
ADDRFP4 0
INDIRP4
CNSTI4 1776
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 930
;930:	memcpy(&bs->cur_ps, &ps, sizeof(playerState_t));
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 316
ARGP4
CNSTU4 1380
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 931
;931:	memcpy(&bs->settings, &settings, sizeof(bot_settings_t));
ADDRFP4 0
INDIRP4
CNSTI4 1424
ADDP4
ARGP4
ADDRLP4 24
ARGP4
CNSTU4 292
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 932
;932:	bs->inuse = inuse;
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 933
;933:	bs->client = client;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 934
;934:	bs->entitynum = entitynum;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 935
;935:	bs->entergame_time = entergame_time;
ADDRFP4 0
INDIRP4
CNSTI4 1764
ADDP4
ADDRLP4 1696
INDIRF4
ASGNF4
line 937
;936:	//reset several states
;937:	if (bs->ms) trap_BotResetMoveState(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $448
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetMoveState
CALLV
pop
LABELV $448
line 938
;938:	if (bs->gs) trap_BotResetGoalState(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
CNSTI4 0
EQI4 $450
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetGoalState
CALLV
pop
LABELV $450
line 939
;939:	if (bs->ws) trap_BotResetWeaponState(bs->ws);
ADDRFP4 0
INDIRP4
CNSTI4 1776
ADDP4
INDIRI4
CNSTI4 0
EQI4 $452
ADDRFP4 0
INDIRP4
CNSTI4 1776
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetWeaponState
CALLV
pop
LABELV $452
line 940
;940:	if (bs->gs) trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
CNSTI4 0
EQI4 $454
ADDRFP4 0
INDIRP4
CNSTI4 1772
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
LABELV $454
line 941
;941:	if (bs->ms) trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
CNSTI4 0
EQI4 $456
ADDRFP4 0
INDIRP4
CNSTI4 1768
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
LABELV $456
line 942
;942:}
LABELV $447
endproc BotResetState 1700 12
export BotAILoadMap
proc BotAILoadMap 8 4
line 949
;943:
;944:/*
;945:==============
;946:BotAILoadMap
;947:==============
;948:*/
;949:int BotAILoadMap( int restart ) {
line 952
;950:	int			i;
;951:
;952:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $459
line 953
;953:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $463
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $463
line 954
;954:			BotResetState( botstates[i] );
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotResetState
CALLV
pop
line 955
;955:			botstates[i]->setupcount = 4;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 1756
ADDP4
CNSTI4 4
ASGNI4
line 956
;956:		}
LABELV $463
line 957
;957:	}
LABELV $460
line 952
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $459
line 959
;958:
;959:	return qtrue;
CNSTI4 1
RETI4
LABELV $458
endproc BotAILoadMap 8 4
export OrgVisible
proc OrgVisible 1084 28
line 964
;960:}
;961:
;962://rww - bot ai
;963:int OrgVisible(vec3_t org1, vec3_t org2, int ignore)
;964:{
line 967
;965:	trace_t tr;
;966:
;967:	JP_Trace(&tr, org1, NULL, NULL, org2, ignore, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1080
CNSTP4 0
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 969
;968:
;969:	if (tr.fraction == 1)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $466
line 970
;970:	{
line 971
;971:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $465
JUMPV
LABELV $466
line 974
;972:	}
;973:
;974:	return 0;
CNSTI4 0
RETI4
LABELV $465
endproc OrgVisible 1084 28
export WPOrgVisible
proc WPOrgVisible 1104 28
line 978
;975:}
;976:
;977:int WPOrgVisible(gentity_t *bot, vec3_t org1, vec3_t org2, int ignore)
;978:{
line 982
;979:	trace_t tr;
;980:	gentity_t *ownent;
;981:
;982:	JP_Trace(&tr, org1, NULL, NULL, org2, ignore, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1084
CNSTP4 0
ASGNP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 984
;983:
;984:	if (tr.fraction == 1)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $470
line 985
;985:	{
line 986
;986:		JP_Trace(&tr, org1, NULL, NULL, org2, ignore, MASK_PLAYERSOLID);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1088
CNSTP4 0
ASGNP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 988
;987:
;988:		if (tr.fraction != 1 && tr.entityNum != ENTITYNUM_NONE && g_entities[tr.entityNum].s.eType == ET_SPECIAL)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $473
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
EQI4 $473
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 4
NEI4 $473
line 989
;989:		{
line 990
;990:			if (g_entities[tr.entityNum].parent && g_entities[tr.entityNum].parent->client)
ADDRLP4 1092
CNSTI4 2352
ASGNI4
ADDRLP4 1096
CNSTU4 0
ASGNU4
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+540
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1096
INDIRU4
EQU4 $479
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+540
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1096
INDIRU4
EQU4 $479
line 991
;991:			{
line 992
;992:				ownent = g_entities[tr.entityNum].parent;
ADDRLP4 1080
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+540
ADDP4
INDIRP4
ASGNP4
line 994
;993:
;994:				if (OnSameTeam(bot, ownent) || bot->s.number == ownent->s.number)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 1100
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $489
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 1080
INDIRP4
INDIRI4
NEI4 $487
LABELV $489
line 995
;995:				{
line 996
;996:					return 1;
CNSTI4 1
RETI4
ADDRGP4 $469
JUMPV
LABELV $487
line 998
;997:				}
;998:			}
LABELV $479
line 999
;999:			return 2;
CNSTI4 2
RETI4
ADDRGP4 $469
JUMPV
LABELV $473
line 1002
;1000:		}
;1001:
;1002:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $469
JUMPV
LABELV $470
line 1005
;1003:	}
;1004:
;1005:	return 0;
CNSTI4 0
RETI4
LABELV $469
endproc WPOrgVisible 1104 28
export OrgVisibleBox
proc OrgVisibleBox 1084 28
line 1009
;1006:}
;1007:
;1008:int OrgVisibleBox(vec3_t org1, vec3_t mins, vec3_t maxs, vec3_t org2, int ignore)
;1009:{
line 1012
;1010:	trace_t tr;
;1011:
;1012:	JP_Trace(&tr, org1, mins, maxs, org2, ignore, MASK_SOLID);
ADDRLP4 0
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
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1014
;1013:
;1014:	if (tr.fraction == 1 && !tr.startsolid && !tr.allsolid)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $491
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $491
ADDRLP4 0
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $491
line 1015
;1015:	{
line 1016
;1016:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $490
JUMPV
LABELV $491
line 1019
;1017:	}
;1018:
;1019:	return 0;
CNSTI4 0
RETI4
LABELV $490
endproc OrgVisibleBox 1084 28
export CheckForFunc
proc CheckForFunc 1104 28
line 1023
;1020:}
;1021:
;1022:int CheckForFunc(vec3_t org, int ignore)
;1023:{
line 1028
;1024:	gentity_t *fent;
;1025:	vec3_t under;
;1026:	trace_t tr;
;1027:
;1028:	VectorCopy(org, under);
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1030
;1029:
;1030:	under[2] -= 64;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 1032
;1031:
;1032:	JP_Trace(&tr, org, NULL, NULL, under, ignore, MASK_SOLID);
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1096
CNSTP4 0
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1034
;1033:
;1034:	if (tr.fraction == 1)
ADDRLP4 16+8
INDIRF4
CNSTF4 1065353216
NEF4 $497
line 1035
;1035:	{
line 1036
;1036:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $495
JUMPV
LABELV $497
line 1039
;1037:	}
;1038:
;1039:	fent = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 16+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1041
;1040:
;1041:	if (!fent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $501
line 1042
;1042:	{
line 1043
;1043:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $495
JUMPV
LABELV $501
line 1046
;1044:	}
;1045:
;1046:	if (strstr(fent->classname, "func_"))
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $505
ARGP4
ADDRLP4 1100
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 1100
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $503
line 1047
;1047:	{
line 1048
;1048:		return 1; //there's a func brush here
CNSTI4 1
RETI4
ADDRGP4 $495
JUMPV
LABELV $503
line 1051
;1049:	}
;1050:
;1051:	return 0;
CNSTI4 0
RETI4
LABELV $495
endproc CheckForFunc 1104 28
export GetNearestVisibleWP
proc GetNearestVisibleWP 84 20
line 1055
;1052:}
;1053:
;1054:int GetNearestVisibleWP(vec3_t org, int ignore)
;1055:{
line 1062
;1056:	int i;
;1057:	float bestdist;
;1058:	float flLen;
;1059:	int bestindex;
;1060:	vec3_t a, mins, maxs;
;1061:
;1062:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1063
;1063:	bestdist = 800;//99999;
ADDRLP4 20
CNSTF4 1145569280
ASGNF4
line 1065
;1064:			   //don't trace over 800 units away to avoid GIANT HORRIBLE SPEED HITS ^_^
;1065:	bestindex = -1;
ADDRLP4 48
CNSTI4 -1
ASGNI4
line 1067
;1066:
;1067:	mins[0] = -15;
ADDRLP4 24
CNSTF4 3245342720
ASGNF4
line 1068
;1068:	mins[1] = -15;
ADDRLP4 24+4
CNSTF4 3245342720
ASGNF4
line 1069
;1069:	mins[2] = -1;
ADDRLP4 24+8
CNSTF4 3212836864
ASGNF4
line 1070
;1070:	maxs[0] = 15;
ADDRLP4 36
CNSTF4 1097859072
ASGNF4
line 1071
;1071:	maxs[1] = 15;
ADDRLP4 36+4
CNSTF4 1097859072
ASGNF4
line 1072
;1072:	maxs[2] = 1;
ADDRLP4 36+8
CNSTF4 1065353216
ASGNF4
ADDRGP4 $512
JUMPV
LABELV $511
line 1075
;1073:
;1074:	while (i < gWPNum)
;1075:	{
line 1076
;1076:		if (gWPArray[i] && gWPArray[i]->inuse)
ADDRLP4 52
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $514
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $514
line 1077
;1077:		{
line 1078
;1078:			VectorSubtract(org, gWPArray[i]->origin, a);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 60
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64
CNSTI4 4
ASGNI4
ADDRLP4 4+4
ADDRLP4 56
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
CNSTI4 8
ASGNI4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1079
;1079:			flLen = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 72
INDIRF4
ASGNF4
line 1081
;1080:
;1081:			if (flLen < bestdist && trap_InPVS(org, gWPArray[i]->origin) && OrgVisibleBox(org, mins, maxs, gWPArray[i]->origin, ignore))
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $518
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $518
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 OrgVisibleBox
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $518
line 1082
;1082:			{
line 1083
;1083:				bestdist = flLen;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 1084
;1084:				bestindex = i;
ADDRLP4 48
ADDRLP4 0
INDIRI4
ASGNI4
line 1085
;1085:			}
LABELV $518
line 1086
;1086:		}
LABELV $514
line 1088
;1087:
;1088:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1089
;1089:	}
LABELV $512
line 1074
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $511
line 1091
;1090:
;1091:	return bestindex;
ADDRLP4 48
INDIRI4
RETI4
LABELV $506
endproc GetNearestVisibleWP 84 20
export PassWayCheck
proc PassWayCheck 32 0
line 1099
;1092:}
;1093:
;1094://wpDirection
;1095://0 == FORWARD
;1096://1 == BACKWARD
;1097:
;1098:int PassWayCheck(bot_state_t *bs, int windex)
;1099:{
line 1100
;1100:	if (!gWPArray[windex] || !gWPArray[windex]->inuse)
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $523
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $521
LABELV $523
line 1101
;1101:	{
line 1102
;1102:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $520
JUMPV
LABELV $521
line 1105
;1103:	}
;1104:
;1105:	if (bs->wpDirection && (gWPArray[windex]->flags & WPFLAG_ONEWAY_FWD))
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $524
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $524
line 1106
;1106:	{
line 1107
;1107:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $520
JUMPV
LABELV $524
line 1109
;1108:	}
;1109:	else if (!bs->wpDirection && (gWPArray[windex]->flags & WPFLAG_ONEWAY_BACK))
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $526
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $526
line 1110
;1110:	{
line 1111
;1111:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $520
JUMPV
LABELV $526
line 1114
;1112:	}
;1113:
;1114:	if (bs->wpCurrent && gWPArray[windex]->forceJumpTo &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $528
ADDRLP4 20
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $528
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
CNSTF4 1115684864
ADDF4
LEF4 $528
ADDRLP4 12
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
GEI4 $528
line 1117
;1115:		gWPArray[windex]->origin[2] > (bs->wpCurrent->origin[2]+64) &&
;1116:		bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION] < gWPArray[windex]->forceJumpTo)
;1117:	{
line 1118
;1118:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $520
JUMPV
LABELV $528
line 1121
;1119:	}
;1120:
;1121:	return 1;
CNSTI4 1
RETI4
LABELV $520
endproc PassWayCheck 32 0
export TotalTrailDistance
proc TotalTrailDistance 40 0
line 1125
;1122:}
;1123:
;1124:float TotalTrailDistance(int start, int end, bot_state_t *bs)
;1125:{
line 1129
;1126:	int beginat;
;1127:	int endat;
;1128:	float distancetotal;
;1129:	float gdif = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1131
;1130:
;1131:	distancetotal = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 1133
;1132:
;1133:	if (start > end)
ADDRFP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LEI4 $531
line 1134
;1134:	{
line 1135
;1135:		beginat = end;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 1136
;1136:		endat = start;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
line 1137
;1137:	}
ADDRGP4 $534
JUMPV
LABELV $531
line 1139
;1138:	else
;1139:	{
line 1140
;1140:		beginat = start;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
line 1141
;1141:		endat = end;
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
line 1142
;1142:	}
ADDRGP4 $534
JUMPV
LABELV $533
line 1145
;1143:
;1144:	while (beginat < endat)
;1145:	{
line 1146
;1146:		if (beginat >= gWPNum || !gWPArray[beginat] || !gWPArray[beginat]->inuse)
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
GEI4 $539
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $539
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $536
LABELV $539
line 1147
;1147:		{
line 1148
;1148:			return -1; //error
CNSTF4 3212836864
RETF4
ADDRGP4 $530
JUMPV
LABELV $536
line 1151
;1149:		}
;1150:
;1151:		if ((end > start && gWPArray[beginat]->flags & WPFLAG_ONEWAY_BACK) ||
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRI4
LEI4 $543
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
NEI4 $542
LABELV $543
ADDRFP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LEI4 $540
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $540
LABELV $542
line 1153
;1152:			(start > end && gWPArray[beginat]->flags & WPFLAG_ONEWAY_FWD))
;1153:		{
line 1154
;1154:			return -1;
CNSTF4 3212836864
RETF4
ADDRGP4 $530
JUMPV
LABELV $540
line 1157
;1155:		}
;1156:	
;1157:		if (gWPArray[beginat]->forceJumpTo)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $544
line 1158
;1158:		{
line 1159
;1159:			if (gWPArray[beginat-1] && gWPArray[beginat-1]->origin[2]+64 < gWPArray[beginat]->origin[2])
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $546
ADDRLP4 28
CNSTI4 8
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
CNSTF4 1115684864
ADDF4
ADDRLP4 24
INDIRI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
GEF4 $546
line 1160
;1160:			{
line 1161
;1161:				gdif = gWPArray[beginat]->origin[2] - gWPArray[beginat-1]->origin[2];
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 36
CNSTI4 8
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1162
;1162:			}
LABELV $546
line 1164
;1163:
;1164:			if (gdif)
ADDRLP4 12
INDIRF4
CNSTF4 0
EQF4 $551
line 1165
;1165:			{
line 1170
;1166:			//	if (bs && bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION] < gWPArray[beginat]->forceJumpTo)
;1167:			//	{
;1168:			//		return -1;
;1169:			//	}
;1170:			}
LABELV $551
line 1171
;1171:		}
LABELV $544
line 1180
;1172:		
;1173:	/*	if (bs->wpCurrent && gWPArray[windex]->forceJumpTo &&
;1174:			gWPArray[windex]->origin[2] > (bs->wpCurrent->origin[2]+64) &&
;1175:			bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION] < gWPArray[windex]->forceJumpTo)
;1176:		{
;1177:			return -1;
;1178:		}*/
;1179:
;1180:		distancetotal += gWPArray[beginat]->disttonext;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1182
;1181:
;1182:		beginat++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1183
;1183:	}
LABELV $534
line 1144
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $533
line 1185
;1184:
;1185:	return distancetotal;
ADDRLP4 4
INDIRF4
RETF4
LABELV $530
endproc TotalTrailDistance 40 0
export CheckForShorterRoutes
proc CheckForShorterRoutes 40 12
line 1189
;1186:}
;1187:
;1188:void CheckForShorterRoutes(bot_state_t *bs, int newwpindex)
;1189:{
line 1196
;1190:	float bestlen;
;1191:	float checklen;
;1192:	int bestindex;
;1193:	int i;
;1194:	int fj;
;1195:
;1196:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1197
;1197:	fj = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1199
;1198:
;1199:	if (!bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $554
line 1200
;1200:	{
line 1201
;1201:		return;
ADDRGP4 $553
JUMPV
LABELV $554
line 1204
;1202:	}
;1203:
;1204:	if (newwpindex < bs->wpDestination->index)
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
GEI4 $556
line 1205
;1205:	{
line 1206
;1206:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 1207
;1207:	}
ADDRGP4 $557
JUMPV
LABELV $556
line 1208
;1208:	else if (newwpindex > bs->wpDestination->index)
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LEI4 $558
line 1209
;1209:	{
line 1210
;1210:		bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 1211
;1211:	}
LABELV $558
LABELV $557
line 1213
;1212:
;1213:	if (bs->wpSwitchTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1984
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $560
line 1214
;1214:	{
line 1215
;1215:		return;
ADDRGP4 $553
JUMPV
LABELV $560
line 1218
;1216:	}
;1217:
;1218:	if (!gWPArray[newwpindex]->neighbornum)
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 0
NEI4 $563
line 1219
;1219:	{
line 1220
;1220:		return;
ADDRGP4 $553
JUMPV
LABELV $563
line 1223
;1221:	}
;1222:
;1223:	bestindex = newwpindex;
ADDRLP4 12
ADDRFP4 4
INDIRI4
ASGNI4
line 1224
;1224:	bestlen = TotalTrailDistance(newwpindex, bs->wpDestination->index, bs);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRGP4 $566
JUMPV
LABELV $565
line 1227
;1225:
;1226:	while (i < gWPArray[newwpindex]->neighbornum)
;1227:	{
line 1228
;1228:		checklen = TotalTrailDistance(gWPArray[newwpindex]->neighbors[i].num, bs->wpDestination->index, bs);
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 1230
;1229:
;1230:		if (checklen < bestlen-64 || bestlen == -1)
ADDRLP4 8
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1115684864
SUBF4
LTF4 $570
ADDRLP4 4
INDIRF4
CNSTF4 3212836864
NEF4 $568
LABELV $570
line 1231
;1231:		{
line 1232
;1232:			if (bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION] >= gWPArray[newwpindex]->neighbors[i].forceJumpTo)
ADDRFP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $571
line 1233
;1233:			{
line 1234
;1234:				bestlen = checklen;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 1235
;1235:				bestindex = gWPArray[newwpindex]->neighbors[i].num;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1237
;1236:
;1237:				if (gWPArray[newwpindex]->neighbors[i].forceJumpTo)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $573
line 1238
;1238:				{
line 1239
;1239:					fj = gWPArray[newwpindex]->neighbors[i].forceJumpTo;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1240
;1240:				}
ADDRGP4 $574
JUMPV
LABELV $573
line 1242
;1241:				else
;1242:				{
line 1243
;1243:					fj = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1244
;1244:				}
LABELV $574
line 1245
;1245:			}
LABELV $571
line 1246
;1246:		}
LABELV $568
line 1248
;1247:
;1248:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1249
;1249:	}
LABELV $566
line 1226
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LTI4 $565
line 1251
;1250:
;1251:	if (bestindex != newwpindex && bestindex != -1)
ADDRLP4 12
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $575
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $575
line 1252
;1252:	{
line 1253
;1253:		bs->wpCurrent = gWPArray[bestindex];
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 1254
;1254:		bs->wpSwitchTime = level.time + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 1984
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 3000
ADDI4
CVIF4 4
ASGNF4
line 1256
;1255:
;1256:		if (fj)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $578
line 1257
;1257:		{
line 1259
;1258:#ifndef FORCEJUMP_INSTANTMETHOD
;1259:			bs->forceJumpChargeTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1260
;1260:			bs->beStill = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 1261
;1261:			bs->forceJumping = bs->forceJumpChargeTime;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 2024
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1268
;1262:#else
;1263:			bs->beStill = level.time + 500;
;1264:			bs->jumpTime = level.time + fj*1200;
;1265:			bs->jDelay = level.time + 200;
;1266:			bs->forceJumping = bs->jumpTime;
;1267:#endif
;1268:		}
LABELV $578
line 1269
;1269:	}
LABELV $575
line 1270
;1270:}
LABELV $553
endproc CheckForShorterRoutes 40 12
export WPConstantRoutine
proc WPConstantRoutine 24 0
line 1273
;1271:
;1272:void WPConstantRoutine(bot_state_t *bs)
;1273:{
line 1274
;1274:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $583
line 1275
;1275:	{
line 1276
;1276:		return;
ADDRGP4 $582
JUMPV
LABELV $583
line 1279
;1277:	}
;1278:
;1279:	if (bs->wpCurrent->flags & WPFLAG_DUCK)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $585
line 1280
;1280:	{
line 1281
;1281:		bs->duckTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2008
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 1282
;1282:	}
LABELV $585
line 1285
;1283:
;1284:#ifndef FORCEJUMP_INSTANTMETHOD
;1285:	if (bs->wpCurrent->flags & WPFLAG_JUMP)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $588
line 1286
;1286:	{
line 1287
;1287:		float heightDif = (bs->wpCurrent->origin[2] - bs->origin[2]+16);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1289
;1288:
;1289:		if (bs->origin[2]+16 >= bs->wpCurrent->origin[2])
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
ADDRLP4 8
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
LTF4 $590
line 1290
;1290:		{ //then why exactly would we be force jumping?
line 1291
;1291:			heightDif = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1292
;1292:		}
LABELV $590
line 1294
;1293:
;1294:		if (heightDif > 40 && (bs->cur_ps.fd.forcePowersKnown & (1 << FP_LEVITATION)) && (bs->cur_ps.fd.forceJumpCharge < (forceJumpStrength[bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION]]-100) || bs->cur_ps.groundEntityNum == ENTITYNUM_NONE))
ADDRLP4 0
INDIRF4
CNSTF4 1109393408
LEF4 $592
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
BANDI4
CNSTI4 0
EQI4 $592
ADDRLP4 12
INDIRP4
CNSTI4 1112
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
LTF4 $594
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $592
LABELV $594
line 1295
;1295:		{
line 1296
;1296:			bs->forceJumpChargeTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1297
;1297:			if (bs->cur_ps.groundEntityNum != ENTITYNUM_NONE && bs->jumpPrep < (level.time-300))
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $596
ADDRLP4 20
INDIRP4
CNSTI4 2020
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CNSTI4 300
SUBI4
CVIF4 4
GEF4 $596
line 1298
;1298:			{
line 1299
;1299:				bs->jumpPrep = level.time + 700;
ADDRFP4 0
INDIRP4
CNSTI4 2020
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 700
ADDI4
CVIF4 4
ASGNF4
line 1300
;1300:			}
LABELV $596
line 1301
;1301:			bs->beStill = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 300
ADDI4
CVIF4 4
ASGNF4
line 1302
;1302:			bs->jumpTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
CNSTF4 0
ASGNF4
line 1304
;1303:
;1304:			if (bs->wpSeenTime < (level.time + 600))
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CNSTI4 600
ADDI4
CVIF4 4
GEF4 $593
line 1305
;1305:			{
line 1306
;1306:				bs->wpSeenTime = level.time + 600;
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 600
ADDI4
CVIF4 4
ASGNF4
line 1307
;1307:			}
line 1308
;1308:		}
ADDRGP4 $593
JUMPV
LABELV $592
line 1309
;1309:		else if (heightDif > 64 && !(bs->cur_ps.fd.forcePowersKnown & (1 << FP_LEVITATION)))
ADDRLP4 0
INDIRF4
CNSTF4 1115684864
LEF4 $605
ADDRFP4 0
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $605
line 1310
;1310:		{ //this point needs force jump to reach and we don't have it
line 1312
;1311:			//Kill the current point and turn around
;1312:			bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 1313
;1313:			if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $607
line 1314
;1314:			{
line 1315
;1315:				bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 1316
;1316:			}
ADDRGP4 $582
JUMPV
LABELV $607
line 1318
;1317:			else
;1318:			{
line 1319
;1319:				bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 1320
;1320:			}
line 1322
;1321:
;1322:			return;
ADDRGP4 $582
JUMPV
LABELV $605
LABELV $593
line 1324
;1323:		}
;1324:	}
LABELV $588
line 1327
;1325:#endif
;1326:
;1327:	if (bs->wpCurrent->forceJumpTo)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $609
line 1328
;1328:	{
line 1335
;1329:#ifdef FORCEJUMP_INSTANTMETHOD
;1330:		if (bs->origin[2]+16 < bs->wpCurrent->origin[2])
;1331:		{
;1332:			bs->jumpTime = level.time + 100;
;1333:		}
;1334:#else
;1335:		if (bs->cur_ps.fd.forceJumpCharge < (forceJumpStrength[bs->cur_ps.fd.forcePowerLevel[FP_LEVITATION]]-100))
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1112
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
GEF4 $611
line 1336
;1336:		{
line 1337
;1337:			bs->forceJumpChargeTime = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1338
;1338:		}
LABELV $611
line 1340
;1339:#endif
;1340:	}
LABELV $609
line 1341
;1341:}
LABELV $582
endproc WPConstantRoutine 24 0
export BotCTFGuardDuty
proc BotCTFGuardDuty 0 0
line 1344
;1342:
;1343:qboolean BotCTFGuardDuty(bot_state_t *bs)
;1344:{
line 1345
;1345:	if (g_gametype.integer != GT_CTF &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $615
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $615
line 1347
;1346:		g_gametype.integer != GT_CTY)
;1347:	{
line 1348
;1348:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $614
JUMPV
LABELV $615
line 1351
;1349:	}
;1350:
;1351:	if (bs->ctfState == CTFSTATE_DEFENDER)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 2
NEI4 $619
line 1352
;1352:	{
line 1353
;1353:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $614
JUMPV
LABELV $619
line 1356
;1354:	}
;1355:
;1356:	return qfalse;
CNSTI4 0
RETI4
LABELV $614
endproc BotCTFGuardDuty 0 0
export WPTouchRoutine
proc WPTouchRoutine 56 8
line 1360
;1357:}
;1358:
;1359:void WPTouchRoutine(bot_state_t *bs)
;1360:{
line 1363
;1361:	int lastNum;
;1362:
;1363:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $622
line 1364
;1364:	{
line 1365
;1365:		return;
ADDRGP4 $621
JUMPV
LABELV $622
line 1368
;1366:	}
;1367:
;1368:	bs->wpTravelTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 1976
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 1370
;1369:
;1370:	if (bs->wpCurrent->flags & WPFLAG_NOMOVEFUNC)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $625
line 1371
;1371:	{
line 1372
;1372:		bs->noUseTime = level.time + 4000;
ADDRFP4 0
INDIRP4
CNSTI4 4800
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 4000
ADDI4
ASGNI4
line 1373
;1373:	}
LABELV $625
line 1382
;1374:
;1375:#ifdef FORCEJUMP_INSTANTMETHOD
;1376:	if ((bs->wpCurrent->flags & WPFLAG_JUMP) && bs->wpCurrent->forceJumpTo)
;1377:	{ //jump if we're flagged to but not if this indicates a force jump point. Force jumping is
;1378:	  //handled elsewhere.
;1379:		bs->jumpTime = level.time + 100;
;1380:	}
;1381:#else
;1382:	if ((bs->wpCurrent->flags & WPFLAG_JUMP) && !bs->wpCurrent->forceJumpTo)
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $628
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $628
line 1383
;1383:	{ //jump if we're flagged to but not if this indicates a force jump point. Force jumping is
line 1385
;1384:	  //handled elsewhere.
;1385:		bs->jumpTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 1386
;1386:	}
LABELV $628
line 1389
;1387:#endif
;1388:
;1389:	trap_Cvar_Update(&bot_camp);
ADDRGP4 bot_camp
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1391
;1390:
;1391:	if (bs->isCamper && bot_camp.integer && (BotIsAChickenWuss(bs) || BotCTFGuardDuty(bs) || bs->isCamper == 2) && ((bs->wpCurrent->flags & WPFLAG_SNIPEORCAMP) || (bs->wpCurrent->flags & WPFLAG_SNIPEORCAMPSTAND)) &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 2060
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $631
ADDRGP4 bot_camp+12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $631
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BotIsAChickenWuss
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $635
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 BotCTFGuardDuty
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $635
ADDRFP4 0
INDIRP4
CNSTI4 2060
ADDP4
INDIRI4
CNSTI4 2
NEI4 $631
LABELV $635
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 32
INDIRI4
NEI4 $636
ADDRLP4 28
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $631
LABELV $636
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 2
EQI4 $631
ADDRLP4 36
INDIRI4
CNSTI4 1
EQI4 $631
line 1393
;1392:		bs->cur_ps.weapon != WP_SABER && bs->cur_ps.weapon != WP_STUN_BATON)
;1393:	{ //if we're a camper and a chicken then camp
line 1394
;1394:		if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $637
line 1395
;1395:		{
line 1396
;1396:			lastNum = bs->wpCurrent->index+1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1397
;1397:		}
ADDRGP4 $638
JUMPV
LABELV $637
line 1399
;1398:		else
;1399:		{
line 1400
;1400:			lastNum = bs->wpCurrent->index-1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1401
;1401:		}
LABELV $638
line 1403
;1402:
;1403:		if (gWPArray[lastNum] && gWPArray[lastNum]->inuse && gWPArray[lastNum]->index && bs->isCamping < level.time)
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $632
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $632
ADDRLP4 40
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $632
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $632
line 1404
;1404:		{
line 1405
;1405:			bs->isCamping = level.time + rand()%15000 + 30000;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 48
INDIRI4
CNSTI4 15000
MODI4
ADDI4
CNSTI4 30000
ADDI4
CVIF4 4
ASGNF4
line 1406
;1406:			bs->wpCamping = bs->wpCurrent;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 2068
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ASGNP4
line 1407
;1407:			bs->wpCampingTo = gWPArray[lastNum];
ADDRFP4 0
INDIRP4
CNSTI4 2072
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 1409
;1408:
;1409:			if (bs->wpCurrent->flags & WPFLAG_SNIPEORCAMPSTAND)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $643
line 1410
;1410:			{
line 1411
;1411:				bs->campStanding = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2076
ADDP4
CNSTI4 1
ASGNI4
line 1412
;1412:			}
ADDRGP4 $632
JUMPV
LABELV $643
line 1414
;1413:			else
;1414:			{
line 1415
;1415:				bs->campStanding = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2076
ADDP4
CNSTI4 0
ASGNI4
line 1416
;1416:			}
line 1417
;1417:		}
line 1419
;1418:
;1419:	}
ADDRGP4 $632
JUMPV
LABELV $631
line 1420
;1420:	else if ((bs->cur_ps.weapon == WP_SABER || bs->cur_ps.weapon == WP_STUN_BATON) &&
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 2
EQI4 $648
ADDRLP4 40
INDIRI4
CNSTI4 1
NEI4 $645
LABELV $648
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $645
line 1422
;1421:		bs->isCamping > level.time)
;1422:	{
line 1423
;1423:		bs->isCamping = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
CNSTF4 0
ASGNF4
line 1424
;1424:		bs->wpCampingTo = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2072
ADDP4
CNSTP4 0
ASGNP4
line 1425
;1425:		bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 1426
;1426:	}
LABELV $645
LABELV $632
line 1428
;1427:
;1428:	if (bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $649
line 1429
;1429:	{
line 1430
;1430:		if (bs->wpCurrent->index == bs->wpDestination->index)
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 16
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
NEI4 $651
line 1431
;1431:		{
line 1432
;1432:			bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 1434
;1433:
;1434:			if (bs->runningLikeASissy)
ADDRFP4 0
INDIRP4
CNSTI4 2308
ADDP4
INDIRI4
CNSTI4 0
EQI4 $653
line 1435
;1435:			{ //this obviously means we're scared and running, so we'll want to keep our navigational priorities less delayed
line 1436
;1436:				bs->destinationGrabTime = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 1437
;1437:			}
ADDRGP4 $652
JUMPV
LABELV $653
line 1439
;1438:			else
;1439:			{
line 1440
;1440:				bs->destinationGrabTime = level.time + 3500;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 3500
ADDI4
CVIF4 4
ASGNF4
line 1441
;1441:			}
line 1442
;1442:		}
ADDRGP4 $652
JUMPV
LABELV $651
line 1444
;1443:		else
;1444:		{
line 1445
;1445:			CheckForShorterRoutes(bs, bs->wpCurrent->index);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 CheckForShorterRoutes
CALLV
pop
line 1446
;1446:		}
LABELV $652
line 1447
;1447:	}
LABELV $649
line 1448
;1448:}
LABELV $621
endproc WPTouchRoutine 56 8
export MoveTowardIdealAngles
proc MoveTowardIdealAngles 4 0
line 1451
;1449:
;1450:void MoveTowardIdealAngles(bot_state_t *bs)
;1451:{
line 1452
;1452:	VectorCopy(bs->goalAngles, bs->ideal_viewangles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1792
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1896
ADDP4
INDIRB
ASGNB 12
line 1453
;1453:}
LABELV $657
endproc MoveTowardIdealAngles 4 0
lit
align 4
LABELV $659
byte 4 3245342720
byte 4 3245342720
byte 4 3238002688
align 4
LABELV $660
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
export BotTrace_Strafe
code
proc BotTrace_Strafe 1200 28
line 1462
;1454:
;1455:#define BOT_STRAFE_AVOIDANCE
;1456:
;1457:#ifdef BOT_STRAFE_AVOIDANCE
;1458:#define STRAFEAROUND_RIGHT			1
;1459:#define STRAFEAROUND_LEFT			2
;1460:
;1461:int BotTrace_Strafe(bot_state_t *bs, vec3_t traceto)
;1462:{
line 1463
;1463:	vec3_t playerMins = {-15, -15, /*DEFAULT_MINS_2*/-8};
ADDRLP4 1140
ADDRGP4 $659
INDIRB
ASGNB 12
line 1464
;1464:	vec3_t playerMaxs = {15, 15, DEFAULT_MAXS_2};
ADDRLP4 1152
ADDRGP4 $660
INDIRB
ASGNB 12
line 1470
;1465:	vec3_t from, to;
;1466:	vec3_t dirAng, dirDif;
;1467:	vec3_t forward, right;
;1468:	trace_t tr;
;1469:
;1470:	if (bs->cur_ps.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $661
line 1471
;1471:	{ //don't do this in the air, it can be.. dangerous.
line 1472
;1472:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $658
JUMPV
LABELV $661
line 1475
;1473:	}
;1474:
;1475:	VectorSubtract(traceto, bs->origin, dirAng);
ADDRLP4 1176
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 1176
INDIRP4
INDIRF4
ADDRLP4 1180
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 1176
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1180
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1476
;1476:	VectorNormalize(dirAng);
ADDRLP4 36
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1477
;1477:	vectoangles(dirAng, dirAng);
ADDRLP4 36
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1479
;1478:
;1479:	if (AngleDifference(bs->viewangles[YAW], dirAng[YAW]) > 60 ||
ADDRFP4 0
INDIRP4
CNSTI4 1784
ADDP4
INDIRF4
ARGF4
ADDRLP4 36+4
INDIRF4
ARGF4
ADDRLP4 1184
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 1184
INDIRF4
CNSTF4 1114636288
GTF4 $669
ADDRFP4 0
INDIRP4
CNSTI4 1784
ADDP4
INDIRF4
ARGF4
ADDRLP4 36+4
INDIRF4
ARGF4
ADDRLP4 1188
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 1188
INDIRF4
CNSTF4 3262119936
GEF4 $665
LABELV $669
line 1481
;1480:		AngleDifference(bs->viewangles[YAW], dirAng[YAW]) < -60)
;1481:	{ //If we aren't facing the direction we're going here, then we've got enough excuse to be too stupid to strafe around anyway
line 1482
;1482:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $658
JUMPV
LABELV $665
line 1485
;1483:	}
;1484:
;1485:	VectorCopy(bs->origin, from);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 1486
;1486:	VectorCopy(traceto, to);
ADDRLP4 12
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1488
;1487:
;1488:	VectorSubtract(to, from, dirDif);
ADDRLP4 48
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 1489
;1489:	VectorNormalize(dirDif);
ADDRLP4 48
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1490
;1490:	vectoangles(dirDif, dirDif);
ADDRLP4 48
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1492
;1491:
;1492:	AngleVectors(dirDif, forward, 0, 0);
ADDRLP4 48
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1192
CNSTP4 0
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1494
;1493:
;1494:	to[0] = from[0] + forward[0]*32;
ADDRLP4 12
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
ADDRLP4 1164
INDIRF4
MULF4
ADDF4
ASGNF4
line 1495
;1495:	to[1] = from[1] + forward[1]*32;
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 1164+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1496
;1496:	to[2] = from[2] + forward[2]*32;
ADDRLP4 12+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
ADDRLP4 1164+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1498
;1497:
;1498:	JP_Trace(&tr, from, playerMins, playerMaxs, to, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1500
;1499:
;1500:	if (tr.fraction == 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
NEF4 $682
line 1501
;1501:	{
line 1502
;1502:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $658
JUMPV
LABELV $682
line 1505
;1503:	}
;1504:
;1505:	AngleVectors(dirAng, 0, right, 0);
ADDRLP4 36
ARGP4
ADDRLP4 1196
CNSTP4 0
ASGNP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1507
;1506:
;1507:	from[0] += right[0]*32;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1508
;1508:	from[1] += right[1]*32;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1509
;1509:	from[2] += right[2]*16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1511
;1510:
;1511:	to[0] += right[0]*32;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1107296256
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1512
;1512:	to[1] += right[1]*32;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1513
;1513:	to[2] += right[2]*32;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1107296256
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1515
;1514:
;1515:	JP_Trace(&tr, from, playerMins, playerMaxs, to, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1517
;1516:
;1517:	if (tr.fraction == 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
NEF4 $693
line 1518
;1518:	{
line 1519
;1519:		return STRAFEAROUND_RIGHT;
CNSTI4 1
RETI4
ADDRGP4 $658
JUMPV
LABELV $693
line 1522
;1520:	}
;1521:
;1522:	from[0] -= right[0]*64;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1115684864
ADDRLP4 24
INDIRF4
MULF4
SUBF4
ASGNF4
line 1523
;1523:	from[1] -= right[1]*64;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1115684864
ADDRLP4 24+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1524
;1524:	from[2] -= right[2]*64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 24+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 1526
;1525:
;1526:	to[0] -= right[0]*64;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1115684864
ADDRLP4 24
INDIRF4
MULF4
SUBF4
ASGNF4
line 1527
;1527:	to[1] -= right[1]*64;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1115684864
ADDRLP4 24+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1528
;1528:	to[2] -= right[2]*64;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 24+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 1530
;1529:
;1530:	JP_Trace(&tr, from, playerMins, playerMaxs, to, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1532
;1531:
;1532:	if (tr.fraction == 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
NEF4 $704
line 1533
;1533:	{
line 1534
;1534:		return STRAFEAROUND_LEFT;
CNSTI4 2
RETI4
ADDRGP4 $658
JUMPV
LABELV $704
line 1537
;1535:	}
;1536:
;1537:	return 0;
CNSTI4 0
RETI4
LABELV $658
endproc BotTrace_Strafe 1200 28
export BotTrace_Jump
proc BotTrace_Jump 1196 28
line 1542
;1538:}
;1539:#endif
;1540:
;1541:int BotTrace_Jump(bot_state_t *bs, vec3_t traceto)
;1542:{
line 1547
;1543:	vec3_t mins, maxs, a, fwd, traceto_mod, tracefrom_mod;
;1544:	trace_t tr;
;1545:	int orTr;
;1546:
;1547:	VectorSubtract(traceto, bs->origin, a);
ADDRLP4 1156
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1156
INDIRP4
INDIRF4
ADDRLP4 1160
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 1156
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1160
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1548
;1548:	vectoangles(a, a);
ADDRLP4 24
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1550
;1549:
;1550:	AngleVectors(a, fwd, NULL, NULL);
ADDRLP4 24
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1164
CNSTP4 0
ASGNP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1552
;1551:
;1552:	traceto_mod[0] = bs->origin[0] + fwd[0]*4;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 1128
INDIRF4
MULF4
ADDF4
ASGNF4
line 1553
;1553:	traceto_mod[1] = bs->origin[1] + fwd[1]*4;
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 1128+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1554
;1554:	traceto_mod[2] = bs->origin[2] + fwd[2]*4;
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 1128+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1556
;1555:
;1556:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 1557
;1557:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 1558
;1558:	mins[2] = -18;
ADDRLP4 0+8
CNSTF4 3247439872
ASGNF4
line 1559
;1559:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 1560
;1560:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 1561
;1561:	maxs[2] = 32;
ADDRLP4 12+8
CNSTF4 1107296256
ASGNF4
line 1563
;1562:
;1563:	JP_Trace(&tr, bs->origin, mins, maxs, traceto_mod, bs->client, MASK_PLAYERSOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1168
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 1168
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1565
;1564:
;1565:	if (tr.fraction == 1)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
NEF4 $718
line 1566
;1566:	{
line 1567
;1567:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $718
line 1570
;1568:	}
;1569:
;1570:	orTr = tr.entityNum;
ADDRLP4 1140
ADDRLP4 48+52
INDIRI4
ASGNI4
line 1572
;1571:
;1572:	VectorCopy(bs->origin, tracefrom_mod);
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 1574
;1573:
;1574:	tracefrom_mod[2] += 41;
ADDRLP4 1144+8
ADDRLP4 1144+8
INDIRF4
CNSTF4 1109655552
ADDF4
ASGNF4
line 1575
;1575:	traceto_mod[2] += 41;
ADDRLP4 36+8
ADDRLP4 36+8
INDIRF4
CNSTF4 1109655552
ADDF4
ASGNF4
line 1577
;1576:
;1577:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 1578
;1578:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 1579
;1579:	mins[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1580
;1580:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 1581
;1581:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 1582
;1582:	maxs[2] = 8;
ADDRLP4 12+8
CNSTF4 1090519040
ASGNF4
line 1584
;1583:
;1584:	JP_Trace(&tr, tracefrom_mod, mins, maxs, traceto_mod, bs->client, MASK_PLAYERSOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1144
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1586
;1585:
;1586:	if (tr.fraction == 1)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
NEF4 $728
line 1587
;1587:	{
line 1588
;1588:		if (orTr >= 0 && orTr < MAX_CLIENTS && botstates[orTr] && botstates[orTr]->jumpTime > level.time)
ADDRLP4 1140
INDIRI4
CNSTI4 0
LTI4 $731
ADDRLP4 1140
INDIRI4
CNSTI4 32
GEI4 $731
ADDRLP4 1176
ADDRLP4 1140
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1176
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $731
ADDRLP4 1176
INDIRP4
CNSTI4 2012
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $731
line 1589
;1589:		{
line 1590
;1590:			return 0; //so bots don't try to jump over each other at the same time
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $731
line 1593
;1591:		}
;1592:
;1593:		if (bs->currentEnemy && bs->currentEnemy->s.number == orTr && (BotGetWeaponRange(bs) == BWEAPONRANGE_SABER || BotGetWeaponRange(bs) == BWEAPONRANGE_MELEE))
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1184
ADDRLP4 1180
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1184
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $734
ADDRLP4 1184
INDIRP4
INDIRI4
ADDRLP4 1140
INDIRI4
NEI4 $734
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1188
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 4
EQI4 $736
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1192
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 1
NEI4 $734
LABELV $736
line 1594
;1594:		{
line 1595
;1595:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $707
JUMPV
LABELV $734
line 1598
;1596:		}
;1597:
;1598:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $707
JUMPV
LABELV $728
line 1601
;1599:	}
;1600:
;1601:	return 0;
CNSTI4 0
RETI4
LABELV $707
endproc BotTrace_Jump 1196 28
export BotTrace_Duck
proc BotTrace_Duck 1168 28
line 1605
;1602:}
;1603:
;1604:int BotTrace_Duck(bot_state_t *bs, vec3_t traceto)
;1605:{
line 1609
;1606:	vec3_t mins, maxs, a, fwd, traceto_mod, tracefrom_mod;
;1607:	trace_t tr;
;1608:
;1609:	VectorSubtract(traceto, bs->origin, a);
ADDRLP4 1152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1152
INDIRP4
INDIRF4
ADDRLP4 1156
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 1152
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1156
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1610
;1610:	vectoangles(a, a);
ADDRLP4 24
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1612
;1611:
;1612:	AngleVectors(a, fwd, NULL, NULL);
ADDRLP4 24
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 1160
CNSTP4 0
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1614
;1613:
;1614:	traceto_mod[0] = bs->origin[0] + fwd[0]*4;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
line 1615
;1615:	traceto_mod[1] = bs->origin[1] + fwd[1]*4;
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1616
;1616:	traceto_mod[2] = bs->origin[2] + fwd[2]*4;
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1618
;1617:
;1618:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 1619
;1619:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 1620
;1620:	mins[2] = -23;
ADDRLP4 0+8
CNSTF4 3250061312
ASGNF4
line 1621
;1621:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 1622
;1622:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 1623
;1623:	maxs[2] = 8;
ADDRLP4 12+8
CNSTF4 1090519040
ASGNF4
line 1625
;1624:
;1625:	JP_Trace(&tr, bs->origin, mins, maxs, traceto_mod, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 1164
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1627
;1626:
;1627:	if (tr.fraction != 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
EQF4 $748
line 1628
;1628:	{
line 1629
;1629:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $737
JUMPV
LABELV $748
line 1632
;1630:	}
;1631:
;1632:	VectorCopy(bs->origin, tracefrom_mod);
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 1634
;1633:
;1634:	tracefrom_mod[2] += 31;//33;
ADDRLP4 1140+8
ADDRLP4 1140+8
INDIRF4
CNSTF4 1106771968
ADDF4
ASGNF4
line 1635
;1635:	traceto_mod[2] += 31;//33;
ADDRLP4 36+8
ADDRLP4 36+8
INDIRF4
CNSTF4 1106771968
ADDF4
ASGNF4
line 1637
;1636:
;1637:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 1638
;1638:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 1639
;1639:	mins[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1640
;1640:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 1641
;1641:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 1642
;1642:	maxs[2] = 32;
ADDRLP4 12+8
CNSTF4 1107296256
ASGNF4
line 1644
;1643:
;1644:	JP_Trace(&tr, tracefrom_mod, mins, maxs, traceto_mod, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1646
;1645:
;1646:	if (tr.fraction != 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
EQF4 $757
line 1647
;1647:	{
line 1648
;1648:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $737
JUMPV
LABELV $757
line 1651
;1649:	}
;1650:
;1651:	return 0;
CNSTI4 0
RETI4
LABELV $737
endproc BotTrace_Duck 1168 28
export PassStandardEnemyChecks
proc PassStandardEnemyChecks 56 8
line 1655
;1652:}
;1653:
;1654:int PassStandardEnemyChecks(bot_state_t *bs, gentity_t *en)
;1655:{
line 1656
;1656:	if (!bs || !en)
ADDRLP4 0
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRU4
EQU4 $763
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRU4
NEU4 $761
LABELV $763
line 1657
;1657:	{
line 1658
;1658:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $761
line 1661
;1659:	}
;1660:
;1661:	if (!en->client)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $764
line 1662
;1662:	{
line 1663
;1663:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $764
line 1666
;1664:	}
;1665:	
;1666:	if (en->client->sess.raceMode)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $766
line 1667
;1667:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $766
line 1669
;1668:
;1669:	if (en->client->ps.pm_type == PM_NOCLIP)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $768
line 1670
;1670:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $768
line 1672
;1671:
;1672:	if (en->health < 1)
ADDRFP4 4
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $770
line 1673
;1673:	{
line 1674
;1674:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $770
line 1677
;1675:	}
;1676:
;1677:	if (!en->takedamage)
ADDRFP4 4
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
NEI4 $772
line 1678
;1678:	{
line 1679
;1679:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $772
line 1682
;1680:	}
;1681:
;1682:	if (bs->doingFallback &&
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 4804
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $774
ADDRGP4 gLevelFlags
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $774
line 1684
;1683:		(gLevelFlags & LEVELFLAG_IGNOREINFALLBACK))
;1684:	{
line 1685
;1685:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $774
line 1688
;1686:	}
;1687:
;1688:	if (en->client)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $776
line 1689
;1689:	{
line 1690
;1690:		if (en->client->ps.pm_type == PM_INTERMISSION ||
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 6
EQI4 $780
ADDRLP4 8
INDIRI4
CNSTI4 3
NEI4 $778
LABELV $780
line 1692
;1691:			en->client->ps.pm_type == PM_SPECTATOR)
;1692:		{
line 1693
;1693:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $778
line 1696
;1694:		}
;1695:
;1696:		if (en->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $781
line 1697
;1697:		{
line 1698
;1698:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $781
line 1701
;1699:		}
;1700:
;1701:		if (!en->client->pers.connected)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $783
line 1702
;1702:		{
line 1703
;1703:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $783
line 1705
;1704:		}
;1705:	}
LABELV $776
line 1707
;1706:
;1707:	if (!en->s.solid)
ADDRFP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 0
NEI4 $785
line 1708
;1708:	{
line 1709
;1709:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $785
line 1712
;1710:	}
;1711:
;1712:	if (bs->client == en->s.number)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
NEI4 $787
line 1713
;1713:	{
line 1714
;1714:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $787
line 1717
;1715:	}
;1716:
;1717:	if (OnSameTeam(&g_entities[bs->client], en))
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $789
line 1718
;1718:	{
line 1719
;1719:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $789
line 1722
;1720:	}
;1721:
;1722:	if (BotMindTricked(bs->client, en->s.number))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $791
line 1723
;1723:	{
line 1724
;1724:		if (bs->currentEnemy && bs->currentEnemy->s.number == en->s.number)
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $793
ADDRLP4 16
INDIRP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
NEI4 $793
line 1725
;1725:		{
line 1727
;1726:			vec3_t vs;
;1727:			float vLen = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 1729
;1728:
;1729:			VectorSubtract(bs->origin, en->client->ps.origin, vs);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 24
ADDRLP4 36
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 36
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1730
;1730:			vLen = VectorLength(vs);
ADDRLP4 24
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 1732
;1731:
;1732:			if (vLen > 256 && (level.time - en->client->dangerTime) > 150)
ADDRLP4 20
INDIRF4
CNSTF4 1132462080
LEF4 $797
ADDRGP4 level+36
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43800
ADDP4
INDIRI4
SUBI4
CNSTI4 150
LEI4 $797
line 1733
;1733:			{
line 1734
;1734:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $797
line 1736
;1735:			}
;1736:		}
LABELV $793
line 1737
;1737:	}
LABELV $791
line 1739
;1738:
;1739:	if (en->client->ps.duelInProgress && en->client->ps.duelIndex != bs->client)
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $800
ADDRLP4 16
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $800
line 1740
;1740:	{
line 1741
;1741:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $800
line 1744
;1742:	}
;1743:
;1744:	if (bs->cur_ps.duelInProgress && en->s.number != bs->cur_ps.duelIndex)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $802
ADDRFP4 4
INDIRP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
EQI4 $802
line 1745
;1745:	{
line 1746
;1746:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $802
line 1749
;1747:	}
;1748:
;1749:	if (g_gametype.integer == GT_JEDIMASTER && !en->client->ps.isJediMaster && !bs->cur_ps.isJediMaster)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $804
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $804
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $804
line 1750
;1750:	{ //rules for attacking non-JM in JM mode
line 1752
;1751:		vec3_t vs;
;1752:		float vLen = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1754
;1753:
;1754:		if (!g_friendlyFire.integer)
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $807
line 1755
;1755:		{ //can't harm non-JM in JM mode if FF is off
line 1756
;1756:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $807
line 1759
;1757:		}
;1758:
;1759:		VectorSubtract(bs->origin, en->client->ps.origin, vs);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 44
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 44
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1760
;1760:		vLen = VectorLength(vs);
ADDRLP4 28
ARGP4
ADDRLP4 52
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 52
INDIRF4
ASGNF4
line 1762
;1761:
;1762:		if (vLen > 350)
ADDRLP4 40
INDIRF4
CNSTF4 1135542272
LEF4 $812
line 1763
;1763:		{
line 1764
;1764:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $760
JUMPV
LABELV $812
line 1766
;1765:		}
;1766:	}
LABELV $804
line 1775
;1767:
;1768:	/*
;1769:	if (en->client && en->client->pers.connected != CON_CONNECTED)
;1770:	{
;1771:		return 0;
;1772:	}
;1773:	*/
;1774:
;1775:	return 1;
CNSTI4 1
RETI4
LABELV $760
endproc PassStandardEnemyChecks 56 8
export BotDamageNotification
proc BotDamageNotification 28 8
line 1779
;1776:}
;1777:
;1778:void BotDamageNotification(gclient_t *bot, gentity_t *attacker)
;1779:{
line 1784
;1780:	bot_state_t *bs;
;1781:	bot_state_t *bs_a;
;1782:	int i;
;1783:
;1784:	if (!bot || !attacker || !attacker->client)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $818
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $818
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
NEU4 $815
LABELV $818
line 1785
;1785:	{
line 1786
;1786:		return;
ADDRGP4 $814
JUMPV
LABELV $815
line 1789
;1787:	}
;1788:
;1789:	bs_a = botstates[attacker->s.number];
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1791
;1790:
;1791:	if (bs_a)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $819
line 1792
;1792:	{
line 1793
;1793:		bs_a->lastAttacked = &g_entities[bot->ps.clientNum];
ADDRLP4 4
INDIRP4
CNSTI4 1832
ADDP4
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1794
;1794:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $822
JUMPV
LABELV $821
line 1797
;1795:
;1796:		while (i < MAX_CLIENTS)
;1797:		{
line 1798
;1798:			if (botstates[i] &&
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $824
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $824
ADDRLP4 24
INDIRP4
CNSTI4 1832
ADDP4
INDIRP4
CVPU4 4
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
NEU4 $824
line 1801
;1799:				i != bs_a->client &&
;1800:				botstates[i]->lastAttacked == &g_entities[bot->ps.clientNum])
;1801:			{
line 1802
;1802:				botstates[i]->lastAttacked = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 1832
ADDP4
CNSTP4 0
ASGNP4
line 1803
;1803:			}
LABELV $824
line 1805
;1804:
;1805:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1806
;1806:		}
LABELV $822
line 1796
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $821
line 1807
;1807:	}
ADDRGP4 $820
JUMPV
LABELV $819
line 1809
;1808:	else //got attacked by a real client, so no one gets rights to lastAttacked
;1809:	{
line 1810
;1810:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $827
JUMPV
LABELV $826
line 1813
;1811:
;1812:		while (i < MAX_CLIENTS)
;1813:		{
line 1814
;1814:			if (botstates[i] &&
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $829
ADDRLP4 20
INDIRP4
CNSTI4 1832
ADDP4
INDIRP4
CVPU4 4
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
CVPU4 4
NEU4 $829
line 1816
;1815:				botstates[i]->lastAttacked == &g_entities[bot->ps.clientNum])
;1816:			{
line 1817
;1817:				botstates[i]->lastAttacked = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 1832
ADDP4
CNSTP4 0
ASGNP4
line 1818
;1818:			}
LABELV $829
line 1820
;1819:
;1820:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1821
;1821:		}
LABELV $827
line 1812
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $826
line 1822
;1822:	}
LABELV $820
line 1824
;1823:
;1824:	bs = botstates[bot->ps.clientNum];
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1826
;1825:
;1826:	if (!bs)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $831
line 1827
;1827:	{
line 1828
;1828:		return;
ADDRGP4 $814
JUMPV
LABELV $831
line 1831
;1829:	}
;1830:
;1831:	bs->lastHurt = attacker;
ADDRLP4 8
INDIRP4
CNSTI4 1828
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1833
;1832:
;1833:	if (bs->currentEnemy)
ADDRLP4 8
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $833
line 1834
;1834:	{
line 1835
;1835:		return;
ADDRGP4 $814
JUMPV
LABELV $833
line 1838
;1836:	}
;1837:
;1838:	if (!PassStandardEnemyChecks(bs, attacker))
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 PassStandardEnemyChecks
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $835
line 1839
;1839:	{
line 1840
;1840:		return;
ADDRGP4 $814
JUMPV
LABELV $835
line 1843
;1841:	}
;1842:
;1843:	if (PassLovedOneCheck(bs, attacker))
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $837
line 1844
;1844:	{
line 1845
;1845:		bs->currentEnemy = attacker;
ADDRLP4 8
INDIRP4
CNSTI4 1816
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1846
;1846:		bs->enemySeenTime = level.time + ENEMY_FORGET_MS;
ADDRLP4 8
INDIRP4
CNSTI4 1996
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 1847
;1847:	}
LABELV $837
line 1848
;1848:}
LABELV $814
endproc BotDamageNotification 28 8
export BotCanHear
proc BotCanHear 64 8
line 1851
;1849:
;1850:int BotCanHear(bot_state_t *bs, gentity_t *en, float endist)
;1851:{
line 1854
;1852:	float minlen;
;1853:
;1854:	if (!en || !en->client)
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $843
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $841
LABELV $843
line 1855
;1855:	{
line 1856
;1856:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $840
JUMPV
LABELV $841
line 1859
;1857:	}
;1858:
;1859:	if (en && en->client && en->client->ps.otherSoundTime > level.time)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $844
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $844
ADDRLP4 20
INDIRP4
CNSTI4 1276
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $844
line 1860
;1860:	{
line 1861
;1861:		minlen = en->client->ps.otherSoundLen;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1280
ADDP4
INDIRF4
ASGNF4
line 1862
;1862:		goto checkStep;
ADDRGP4 $847
JUMPV
LABELV $844
line 1865
;1863:	}
;1864:
;1865:	if (en && en->client && en->client->ps.footstepTime > level.time)
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $848
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $848
ADDRLP4 32
INDIRP4
CNSTI4 1272
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $848
line 1866
;1866:	{
line 1867
;1867:		minlen = 256;
ADDRLP4 0
CNSTF4 1132462080
ASGNF4
line 1868
;1868:		goto checkStep;
ADDRGP4 $847
JUMPV
LABELV $848
line 1871
;1869:	}
;1870:
;1871:	if (gBotEventTracker[en->s.number].eventTime < level.time)
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker+12
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $851
line 1872
;1872:	{
line 1873
;1873:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $840
JUMPV
LABELV $851
line 1876
;1874:	}
;1875:
;1876:	switch(gBotEventTracker[en->s.number].events[gBotEventTracker[en->s.number].eventSequence & (MAX_PS_EVENTS-1)])
ADDRLP4 40
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
ADDRLP4 36
ADDRLP4 40
INDIRI4
ADDRGP4 gBotEventTracker
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRI4
ADDRGP4 gBotEventTracker+4
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 24
EQI4 $860
ADDRLP4 36
INDIRI4
CNSTI4 25
EQI4 $860
ADDRLP4 48
CNSTI4 26
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $860
ADDRLP4 36
INDIRI4
ADDRLP4 48
INDIRI4
GTI4 $864
LABELV $863
ADDRLP4 56
CNSTI4 2
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 56
INDIRI4
LTI4 $855
ADDRLP4 36
INDIRI4
CNSTI4 15
GTI4 $855
ADDRLP4 36
INDIRI4
ADDRLP4 56
INDIRI4
LSHI4
ADDRGP4 $865-8
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $865
address $861
address $861
address $855
address $861
address $855
address $861
address $861
address $861
address $861
address $855
address $855
address $855
address $862
address $862
code
LABELV $864
ADDRLP4 36
INDIRI4
CNSTI4 67
EQI4 $859
ADDRGP4 $855
JUMPV
line 1877
;1877:	{
LABELV $859
line 1879
;1878:	case EV_GLOBAL_SOUND:
;1879:		minlen = 256;
ADDRLP4 0
CNSTF4 1132462080
ASGNF4
line 1880
;1880:		break;
ADDRGP4 $856
JUMPV
LABELV $860
line 1884
;1881:	case EV_FIRE_WEAPON:
;1882:	case EV_ALT_FIRE:
;1883:	case EV_SABER_ATTACK:
;1884:		minlen = 512;
ADDRLP4 0
CNSTF4 1140850688
ASGNF4
line 1885
;1885:		break;
ADDRGP4 $856
JUMPV
LABELV $861
line 1893
;1886:	case EV_STEP_4:
;1887:	case EV_STEP_8:
;1888:	case EV_STEP_12:
;1889:	case EV_STEP_16:
;1890:	case EV_FOOTSTEP:
;1891:	case EV_FOOTSTEP_METAL:
;1892:	case EV_FOOTWADE:
;1893:		minlen = 256;
ADDRLP4 0
CNSTF4 1132462080
ASGNF4
line 1894
;1894:		break;
ADDRGP4 $856
JUMPV
LABELV $862
line 1897
;1895:	case EV_JUMP:
;1896:	case EV_ROLL:
;1897:		minlen = 256;
ADDRLP4 0
CNSTF4 1132462080
ASGNF4
line 1898
;1898:		break;
ADDRGP4 $856
JUMPV
LABELV $855
line 1900
;1899:	default:
;1900:		minlen = 999999;
ADDRLP4 0
CNSTF4 1232348144
ASGNF4
line 1901
;1901:		break;
LABELV $856
LABELV $847
line 1904
;1902:	}
;1903:checkStep:
;1904:	if (BotMindTricked(bs->client, en->s.number))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $867
line 1905
;1905:	{ //if mindtricked by this person, cut down on the minlen
line 1906
;1906:		minlen /= 4;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
DIVF4
ASGNF4
line 1907
;1907:	}
LABELV $867
line 1909
;1908:
;1909:	if (endist <= minlen)
ADDRFP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $869
line 1910
;1910:	{
line 1911
;1911:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $840
JUMPV
LABELV $869
line 1914
;1912:	}
;1913:
;1914:	return 0;
CNSTI4 0
RETI4
LABELV $840
endproc BotCanHear 64 8
export UpdateEventTracker
proc UpdateEventTracker 20 0
line 1918
;1915:}
;1916:
;1917:void UpdateEventTracker(void)
;1918:{
line 1921
;1919:	int i;
;1920:
;1921:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $873
JUMPV
LABELV $872
line 1924
;1922:
;1923:	while (i < MAX_CLIENTS)
;1924:	{
line 1925
;1925:		if (gBotEventTracker[i].eventSequence != level.clients[i].ps.eventSequence)
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker
ADDP4
INDIRI4
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 112
ADDP4
INDIRI4
EQI4 $875
line 1926
;1926:		{ //updated event
line 1927
;1927:			gBotEventTracker[i].eventSequence = level.clients[i].ps.eventSequence;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker
ADDP4
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 112
ADDP4
INDIRI4
ASGNI4
line 1928
;1928:			gBotEventTracker[i].events[0] = level.clients[i].ps.events[0];
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker+4
ADDP4
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 116
ADDP4
INDIRI4
ASGNI4
line 1929
;1929:			gBotEventTracker[i].events[1] = level.clients[i].ps.events[1];
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker+4+4
ADDP4
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 120
ADDP4
INDIRI4
ASGNI4
line 1930
;1930:			gBotEventTracker[i].eventTime = level.time + 0.5;
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 gBotEventTracker+12
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1931
;1931:		}
LABELV $875
line 1933
;1932:
;1933:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1934
;1934:	}
LABELV $873
line 1923
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $872
line 1935
;1935:}
LABELV $871
endproc UpdateEventTracker 20 0
export InFieldOfVision
proc InFieldOfVision 24 4
line 1938
;1936:
;1937:int InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles)
;1938:{
line 1942
;1939:	int i;
;1940:	float diff, angle;
;1941:
;1942:	for (i = 0; i < 2; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $883
line 1943
;1943:	{
line 1944
;1944:		angle = AngleMod(viewangles[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
ASGNF4
line 1945
;1945:		angles[i] = AngleMod(angles[i]);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
line 1946
;1946:		diff = angles[i] - angle;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 1947
;1947:		if (angles[i] > angle)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $887
line 1948
;1948:		{
line 1949
;1949:			if (diff > 180.0)
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $888
line 1950
;1950:			{
line 1951
;1951:				diff -= 360.0;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 1952
;1952:			}
line 1953
;1953:		}
ADDRGP4 $888
JUMPV
LABELV $887
line 1955
;1954:		else
;1955:		{
line 1956
;1956:			if (diff < -180.0)
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $891
line 1957
;1957:			{
line 1958
;1958:				diff += 360.0;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 1959
;1959:			}
LABELV $891
line 1960
;1960:		}
LABELV $888
line 1961
;1961:		if (diff > 0)
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $893
line 1962
;1962:		{
line 1963
;1963:			if (diff > fov * 0.5)
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
LEF4 $894
line 1964
;1964:			{
line 1965
;1965:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $882
JUMPV
line 1967
;1966:			}
;1967:		}
LABELV $893
line 1969
;1968:		else
;1969:		{
line 1970
;1970:			if (diff < -fov * 0.5)
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
NEGF4
MULF4
GEF4 $897
line 1971
;1971:			{
line 1972
;1972:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $882
JUMPV
LABELV $897
line 1974
;1973:			}
;1974:		}
LABELV $894
line 1975
;1975:	}
LABELV $884
line 1942
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $883
line 1976
;1976:	return 1;
CNSTI4 1
RETI4
LABELV $882
endproc InFieldOfVision 24 4
export PassLovedOneCheck
proc PassLovedOneCheck 36 8
line 1980
;1977:}
;1978:
;1979:int PassLovedOneCheck(bot_state_t *bs, gentity_t *ent)
;1980:{
line 1984
;1981:	int i;
;1982:	bot_state_t *loved;
;1983:
;1984:	if (!bs->lovednum)
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $900
line 1985
;1985:	{
line 1986
;1986:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $899
JUMPV
LABELV $900
line 1989
;1987:	}
;1988:
;1989:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $902
line 1990
;1990:	{ //There is no love in 1-on-1
line 1991
;1991:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $899
JUMPV
LABELV $902
line 1994
;1992:	}
;1993:
;1994:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1996
;1995:
;1996:	if (!botstates[ent->s.number])
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $905
line 1997
;1997:	{ //not a bot
line 1998
;1998:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $899
JUMPV
LABELV $905
line 2001
;1999:	}
;2000:
;2001:	trap_Cvar_Update(&bot_attachments);
ADDRGP4 bot_attachments
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 2003
;2002:
;2003:	if (!bot_attachments.integer)
ADDRGP4 bot_attachments+12
INDIRI4
CNSTI4 0
NEI4 $907
line 2004
;2004:	{
line 2005
;2005:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $899
JUMPV
LABELV $907
line 2008
;2006:	}
;2007:
;2008:	loved = botstates[ent->s.number];
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $911
JUMPV
LABELV $910
line 2011
;2009:
;2010:	while (i < bs->lovednum)
;2011:	{
line 2012
;2012:		if (strcmp(level.clients[loved->client].pers.netname, bs->loved[i].name) == 0)
CNSTI4 53196
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $913
line 2013
;2013:		{
line 2014
;2014:			if (!IsTeamplay() && bs->loved[i].level < 2)
ADDRLP4 12
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $915
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
INDIRI4
CNSTI4 2
GEI4 $915
line 2015
;2015:			{ //if FFA and level of love is not greater than 1, just don't care
line 2016
;2016:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $899
JUMPV
LABELV $915
line 2018
;2017:			}
;2018:			else if (IsTeamplay() && !OnSameTeam(&g_entities[bs->client], &g_entities[loved->client]) && bs->loved[i].level < 2)
ADDRLP4 16
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $917
ADDRLP4 20
CNSTI4 2352
ASGNI4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 28
ADDRGP4 g_entities
ASGNP4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ARGP4
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRLP4 28
INDIRP4
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $917
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
INDIRI4
CNSTI4 2
GEI4 $917
line 2019
;2019:			{ //is teamplay, but not on same team and level < 2
line 2020
;2020:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $899
JUMPV
LABELV $917
line 2023
;2021:			}
;2022:			else
;2023:			{
line 2024
;2024:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $899
JUMPV
LABELV $913
line 2028
;2025:			}
;2026:		}
;2027:
;2028:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2029
;2029:	}
LABELV $911
line 2010
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
LTI4 $910
line 2031
;2030:
;2031:	return 1;
CNSTI4 1
RETI4
LABELV $899
endproc PassLovedOneCheck 36 8
export ScanForEnemies
proc ScanForEnemies 124 12
line 2037
;2032:}
;2033:
;2034:qboolean G_ThereIsAMaster(void);
;2035:
;2036:int ScanForEnemies(bot_state_t *bs)
;2037:{
line 2043
;2038:	vec3_t a;
;2039:	float distcheck;
;2040:	float closest;
;2041:	int bestindex;
;2042:	int i;
;2043:	float hasEnemyDist = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 2044
;2044:	qboolean noAttackNonJM = qfalse;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 2046
;2045:
;2046:	closest = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 2047
;2047:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2048
;2048:	bestindex = -1;
ADDRLP4 28
CNSTI4 -1
ASGNI4
line 2050
;2049:
;2050:	if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $920
line 2051
;2051:	{
line 2052
;2052:		hasEnemyDist = bs->frame_Enemy_Len;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
line 2053
;2053:	}
LABELV $920
line 2055
;2054:
;2055:	if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $922
ADDRLP4 44
ADDRLP4 36
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $922
ADDRLP4 44
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $922
line 2057
;2056:		bs->currentEnemy->client->ps.isJediMaster)
;2057:	{ //The Jedi Master must die.
line 2058
;2058:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $919
JUMPV
LABELV $922
line 2061
;2059:	}
;2060:
;2061:	if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $933
line 2062
;2062:	{
line 2063
;2063:		if (G_ThereIsAMaster() && !bs->cur_ps.isJediMaster)
ADDRLP4 48
ADDRGP4 G_ThereIsAMaster
CALLI4
ASGNI4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $933
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $933
line 2064
;2064:		{
line 2065
;2065:			if (!g_friendlyFire.integer)
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $929
line 2066
;2066:			{
line 2067
;2067:				noAttackNonJM = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 2068
;2068:			}
ADDRGP4 $933
JUMPV
LABELV $929
line 2070
;2069:			else
;2070:			{
line 2071
;2071:				closest = 128; //only get mad at people if they get close enough to you to anger you, or hurt you
ADDRLP4 20
CNSTF4 1124073472
ASGNF4
line 2072
;2072:			}
line 2073
;2073:		}
line 2074
;2074:	}
ADDRGP4 $933
JUMPV
LABELV $932
line 2077
;2075:
;2076:	while (i < MAX_CLIENTS)
;2077:	{
line 2078
;2078:		if (i != bs->client && g_entities[i].client && !OnSameTeam(&g_entities[bs->client], &g_entities[i]) && PassStandardEnemyChecks(bs, &g_entities[i]) && trap_InPVS(g_entities[i].client->ps.origin, bs->eye) && PassLovedOneCheck(bs, &g_entities[i]))
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $935
ADDRLP4 56
CNSTI4 2352
ASGNI4
ADDRLP4 60
ADDRLP4 56
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 60
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $935
ADDRLP4 64
ADDRGP4 g_entities
ASGNP4
ADDRLP4 56
INDIRI4
ADDRLP4 52
INDIRI4
MULI4
ADDRLP4 64
INDIRP4
ADDP4
ARGP4
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRP4
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $935
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 PassStandardEnemyChecks
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $935
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $935
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $935
line 2079
;2079:		{
line 2080
;2080:			VectorSubtract(g_entities[i].client->ps.origin, bs->eye, a);
ADDRLP4 84
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 84
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 84
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2081
;2081:			distcheck = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 92
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 92
INDIRF4
ASGNF4
line 2082
;2082:			vectoangles(a, a);
ADDRLP4 4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2084
;2083:
;2084:			if (g_entities[i].client->ps.isJediMaster)
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $944
line 2085
;2085:			{ //make us think the Jedi Master is close so we'll attack him above all
line 2086
;2086:				distcheck = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 2087
;2087:			}
LABELV $944
line 2089
;2088:
;2089:			if (distcheck < closest && ((InFieldOfVision(bs->viewangles, 90, a) && !BotMindTricked(bs->client, i)) || BotCanHear(bs, &g_entities[i], distcheck)) && OrgVisible(bs->eye, g_entities[i].client->ps.origin, -1))
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $947
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1119092736
ARGF4
ADDRLP4 4
ARGP4
ADDRLP4 96
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $951
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $950
LABELV $951
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 104
ADDRGP4 BotCanHear
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $947
LABELV $950
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 108
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $947
line 2090
;2090:			{
line 2091
;2091:				if (BotMindTricked(bs->client, i))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $952
line 2092
;2092:				{
line 2093
;2093:					if (distcheck < 256 || (level.time - g_entities[i].client->dangerTime) < 100)
ADDRLP4 16
INDIRF4
CNSTF4 1132462080
LTF4 $958
ADDRGP4 level+36
INDIRI4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43800
ADDP4
INDIRI4
SUBI4
CNSTI4 100
GEI4 $953
LABELV $958
line 2094
;2094:					{
line 2095
;2095:						if (!hasEnemyDist || distcheck < (hasEnemyDist - 128))
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $961
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1124073472
SUBF4
GEF4 $953
LABELV $961
line 2096
;2096:						{ //if we have an enemy, only switch to closer if he is 128+ closer to avoid flipping out
line 2097
;2097:							if (!noAttackNonJM || g_entities[i].client->ps.isJediMaster)
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $965
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $953
LABELV $965
line 2098
;2098:							{
line 2099
;2099:								closest = distcheck;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 2100
;2100:								bestindex = i;
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
line 2101
;2101:							}
line 2102
;2102:						}
line 2103
;2103:					}
line 2104
;2104:				}
ADDRGP4 $953
JUMPV
LABELV $952
line 2106
;2105:				else
;2106:				{
line 2107
;2107:					if (!hasEnemyDist || distcheck < (hasEnemyDist - 128))
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $968
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1124073472
SUBF4
GEF4 $966
LABELV $968
line 2108
;2108:					{ //if we have an enemy, only switch to closer if he is 128+ closer to avoid flipping out
line 2109
;2109:						if (!noAttackNonJM || g_entities[i].client->ps.isJediMaster)
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $972
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $969
LABELV $972
line 2110
;2110:						{
line 2111
;2111:							closest = distcheck;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 2112
;2112:							bestindex = i;
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
line 2113
;2113:						}
LABELV $969
line 2114
;2114:					}
LABELV $966
line 2115
;2115:				}
LABELV $953
line 2116
;2116:			}
LABELV $947
line 2117
;2117:		}
LABELV $935
line 2118
;2118:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2119
;2119:	}
LABELV $933
line 2076
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $932
line 2121
;2120:	
;2121:	return bestindex;
ADDRLP4 28
INDIRI4
RETI4
LABELV $919
endproc ScanForEnemies 124 12
export WaitingForNow
proc WaitingForNow 72 8
line 2125
;2122:}
;2123:
;2124:int WaitingForNow(bot_state_t *bs, vec3_t goalpos)
;2125:{ //checks if the bot is doing something along the lines of waiting for an elevator to raise up
line 2128
;2126:	vec3_t xybot, xywp, a;
;2127:
;2128:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $974
line 2129
;2129:	{
line 2130
;2130:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $973
JUMPV
LABELV $974
line 2133
;2131:	}
;2132:
;2133:	if ((int)goalpos[0] != (int)bs->wpCurrent->origin[0] ||
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRF4
CVFI4 4
ADDRLP4 40
INDIRP4
INDIRF4
CVFI4 4
NEI4 $979
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
CVFI4 4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
CVFI4 4
NEI4 $979
ADDRLP4 48
CNSTI4 8
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
CVFI4 4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
CVFI4 4
EQI4 $976
LABELV $979
line 2136
;2134:		(int)goalpos[1] != (int)bs->wpCurrent->origin[1] ||
;2135:		(int)goalpos[2] != (int)bs->wpCurrent->origin[2])
;2136:	{
line 2137
;2137:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $973
JUMPV
LABELV $976
line 2140
;2138:	}
;2139:
;2140:	VectorCopy(bs->origin, xybot);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 2141
;2141:	VectorCopy(bs->wpCurrent->origin, xywp);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
INDIRB
ASGNB 12
line 2143
;2142:
;2143:	xybot[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2144
;2144:	xywp[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 2146
;2145:
;2146:	VectorSubtract(xybot, xywp, a);
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 2148
;2147:
;2148:	if (VectorLength(a) < 16 && bs->frame_Waypoint_Len > 100)
ADDRLP4 24
ARGP4
ADDRLP4 52
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 52
INDIRF4
CNSTF4 1098907648
GEF4 $988
ADDRFP4 0
INDIRP4
CNSTI4 2044
ADDP4
INDIRF4
CNSTF4 1120403456
LEF4 $988
line 2149
;2149:	{
line 2150
;2150:		if (CheckForFunc(bs->origin, bs->client))
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 CheckForFunc
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $989
line 2151
;2151:		{
line 2152
;2152:			return 1; //we're probably standing on an elevator and riding up/down. Or at least we hope so.
CNSTI4 1
RETI4
ADDRGP4 $973
JUMPV
line 2154
;2153:		}
;2154:	}
LABELV $988
line 2155
;2155:	else if (VectorLength(a) < 64 && bs->frame_Waypoint_Len > 64 &&
ADDRLP4 24
ARGP4
ADDRLP4 56
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 60
CNSTF4 1115684864
ASGNF4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
GEF4 $992
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 2044
ADDP4
INDIRF4
ADDRLP4 60
INDIRF4
LEF4 $992
ADDRLP4 64
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 CheckForFunc
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $992
line 2157
;2156:		CheckForFunc(bs->origin, bs->client))
;2157:	{
line 2158
;2158:		bs->noUseTime = level.time + 2000;
ADDRFP4 0
INDIRP4
CNSTI4 4800
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2159
;2159:	}
LABELV $992
LABELV $989
line 2161
;2160:
;2161:	return 0;
CNSTI4 0
RETI4
LABELV $973
endproc WaitingForNow 72 8
export BotGetWeaponRange
proc BotGetWeaponRange 8 0
line 2165
;2162:}
;2163:
;2164:int BotGetWeaponRange(bot_state_t *bs)
;2165:{
line 2166
;2166:	switch (bs->cur_ps.weapon)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $996
ADDRLP4 0
INDIRI4
CNSTI4 13
GTI4 $996
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1012-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1012
address $999
address $1000
address $1001
address $1002
address $1003
address $1004
address $1005
address $1006
address $1007
address $1008
address $1009
address $1010
address $1011
code
line 2167
;2167:	{
LABELV $999
line 2169
;2168:	case WP_STUN_BATON:
;2169:		return BWEAPONRANGE_MELEE;
CNSTI4 1
RETI4
ADDRGP4 $995
JUMPV
LABELV $1000
line 2171
;2170:	case WP_SABER:
;2171:		return BWEAPONRANGE_SABER;
CNSTI4 4
RETI4
ADDRGP4 $995
JUMPV
LABELV $1001
line 2173
;2172:	case WP_BRYAR_PISTOL:
;2173:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
ADDRGP4 $995
JUMPV
LABELV $1002
line 2175
;2174:	case WP_BLASTER:
;2175:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
ADDRGP4 $995
JUMPV
LABELV $1003
line 2177
;2176:	case WP_DISRUPTOR:
;2177:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
ADDRGP4 $995
JUMPV
LABELV $1004
line 2179
;2178:	case WP_BOWCASTER:
;2179:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $995
JUMPV
LABELV $1005
line 2181
;2180:	case WP_REPEATER:
;2181:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
ADDRGP4 $995
JUMPV
LABELV $1006
line 2183
;2182:	case WP_DEMP2:
;2183:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $995
JUMPV
LABELV $1007
line 2185
;2184:	case WP_FLECHETTE:
;2185:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $995
JUMPV
LABELV $1008
line 2187
;2186:	case WP_ROCKET_LAUNCHER:
;2187:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $995
JUMPV
LABELV $1009
line 2189
;2188:	case WP_THERMAL:
;2189:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $995
JUMPV
LABELV $1010
line 2191
;2190:	case WP_TRIP_MINE:
;2191:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $995
JUMPV
LABELV $1011
line 2193
;2192:	case WP_DET_PACK:
;2193:		return BWEAPONRANGE_LONG;
CNSTI4 3
RETI4
ADDRGP4 $995
JUMPV
LABELV $996
line 2195
;2194:	default:
;2195:		return BWEAPONRANGE_MID;
CNSTI4 2
RETI4
LABELV $995
endproc BotGetWeaponRange 8 0
export BotIsAChickenWuss
proc BotIsAChickenWuss 32 4
line 2200
;2196:	}
;2197:}
;2198:
;2199:int BotIsAChickenWuss(bot_state_t *bs)
;2200:{
line 2203
;2201:	int bWRange;
;2202:
;2203:	if (gLevelFlags & LEVELFLAG_IMUSTNTRUNAWAY)
ADDRGP4 gLevelFlags
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1015
line 2204
;2204:	{
line 2205
;2205:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1014
JUMPV
LABELV $1015
line 2208
;2206:	}
;2207:
;2208:	if (g_gametype.integer == GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $1017
line 2209
;2209:	{
line 2210
;2210:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1014
JUMPV
LABELV $1017
line 2213
;2211:	}
;2212:
;2213:	if (g_gametype.integer == GT_JEDIMASTER && !bs->cur_ps.isJediMaster)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $1020
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1020
line 2214
;2214:	{ //Then you may know no fear.
line 2216
;2215:		//Well, unless he's strong.
;2216:		if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 1816
ADDP4
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
EQU4 $1023
ADDRLP4 16
ADDRLP4 8
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
EQU4 $1023
ADDRLP4 16
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1023
ADDRLP4 8
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 40
LEI4 $1023
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 10
GEI4 $1023
line 2220
;2217:			bs->currentEnemy->client->ps.isJediMaster &&
;2218:			bs->currentEnemy->health > 40 &&
;2219:			bs->cur_ps.weapon < WP_ROCKET_LAUNCHER)
;2220:		{ //explosive weapons are most effective against the Jedi Master
line 2221
;2221:			goto jmPass;
ADDRGP4 $1025
JUMPV
LABELV $1023
line 2223
;2222:		}
;2223:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1014
JUMPV
LABELV $1020
LABELV $1025
line 2226
;2224:	}
;2225:jmPass:
;2226:	if (bs->chickenWussCalculationTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2000
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $1026
line 2227
;2227:	{
line 2228
;2228:		return 2; //don't want to keep going between two points...
CNSTI4 2
RETI4
ADDRGP4 $1014
JUMPV
LABELV $1026
line 2231
;2229:	}
;2230:
;2231:	if (g_gametype.integer == GT_JEDIMASTER && !bs->cur_ps.isJediMaster)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $1029
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1029
line 2232
;2232:	{
line 2233
;2233:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1014
JUMPV
LABELV $1029
line 2236
;2234:	}
;2235:
;2236:	bs->chickenWussCalculationTime = level.time + MAX_CHICKENWUSS_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 2000
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 2238
;2237:
;2238:	if (g_entities[bs->client].health < BOT_RUN_HEALTH)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
CNSTI4 40
GEI4 $1033
line 2239
;2239:	{
line 2240
;2240:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1014
JUMPV
LABELV $1033
line 2243
;2241:	}
;2242:
;2243:	bWRange = BotGetWeaponRange(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2245
;2244:
;2245:	if (bWRange == BWEAPONRANGE_MELEE || bWRange == BWEAPONRANGE_SABER)
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $1038
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1036
LABELV $1038
line 2246
;2246:	{
line 2247
;2247:		if (bWRange != BWEAPONRANGE_SABER || !bs->saberSpecialist)
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1041
ADDRFP4 0
INDIRP4
CNSTI4 2088
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1039
LABELV $1041
line 2248
;2248:		{
line 2249
;2249:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1014
JUMPV
LABELV $1039
line 2251
;2250:		}
;2251:	}
LABELV $1036
line 2253
;2252:
;2253:	if (bs->cur_ps.weapon == WP_BRYAR_PISTOL)
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1042
line 2254
;2254:	{ //the bryar is a weak weapon, so just try to find a new one if it's what you're having to use
line 2255
;2255:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1014
JUMPV
LABELV $1042
line 2258
;2256:	}
;2257:
;2258:	if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $1044
ADDRLP4 24
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $1044
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1044
ADDRLP4 12
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1140850688
GEF4 $1044
ADDRLP4 12
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $1044
line 2261
;2259:		bs->currentEnemy->client->ps.weapon == WP_SABER &&
;2260:		bs->frame_Enemy_Len < 512 && bs->cur_ps.weapon != WP_SABER)
;2261:	{ //if close to an enemy with a saber and not using a saber, then try to back off
line 2262
;2262:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1014
JUMPV
LABELV $1044
line 2266
;2263:	}
;2264:
;2265:	//didn't run, reset the timer
;2266:	bs->chickenWussCalculationTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2000
ADDP4
CNSTF4 0
ASGNF4
line 2268
;2267:
;2268:	return 0;
CNSTI4 0
RETI4
LABELV $1014
endproc BotIsAChickenWuss 32 4
export GetNearestBadThing
proc GetNearestBadThing 1224 28
line 2272
;2269:}
;2270:
;2271:gentity_t *GetNearestBadThing(bot_state_t *bs)
;2272:{
line 2273
;2273:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2276
;2274:	float glen;
;2275:	vec3_t hold;
;2276:	int bestindex = 0;
ADDRLP4 1116
CNSTI4 0
ASGNI4
line 2277
;2277:	float bestdist = 800; //if not within a radius of 800, it's no threat anyway
ADDRLP4 1108
CNSTF4 1145569280
ASGNF4
line 2278
;2278:	int foundindex = 0;
ADDRLP4 1112
CNSTI4 0
ASGNI4
line 2279
;2279:	float factor = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRGP4 $1048
JUMPV
LABELV $1047
line 2284
;2280:	gentity_t *ent;
;2281:	trace_t tr;
;2282:
;2283:	while (i < MAX_GENTITIES)
;2284:	{
line 2285
;2285:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2287
;2286:
;2287:		if ( (ent &&
ADDRLP4 1124
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1124
INDIRU4
EQU4 $1058
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1124
INDIRU4
NEU4 $1058
ADDRLP4 1128
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $1058
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $1058
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $1058
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
NEI4 $1053
LABELV $1058
ADDRLP4 1136
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1136
INDIRU4
EQU4 $1050
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 1000
NEI4 $1050
ADDRLP4 1140
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
EQI4 $1050
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
LEI4 $1050
ADDRLP4 1144
ADDRLP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1144
INDIRI4
ADDRLP4 1148
INDIRI4
EQI4 $1050
ADDRLP4 1152
CNSTI4 2352
ASGNI4
ADDRLP4 1156
ADDRLP4 1152
INDIRI4
ADDRLP4 1144
INDIRI4
MULI4
ASGNI4
ADDRLP4 1156
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1136
INDIRU4
EQU4 $1050
ADDRLP4 1160
ADDRGP4 g_entities
ASGNP4
ADDRLP4 1152
INDIRI4
ADDRLP4 1148
INDIRI4
MULI4
ADDRLP4 1160
INDIRP4
ADDP4
ARGP4
ADDRLP4 1156
INDIRI4
ADDRLP4 1160
INDIRP4
ADDP4
ARGP4
ADDRLP4 1164
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $1050
LABELV $1053
line 2300
;2288:			!ent->client &&
;2289:			ent->inuse &&
;2290:			ent->damage &&
;2291:			/*(ent->s.weapon == WP_THERMAL || ent->s.weapon == WP_FLECHETTE)*/
;2292:			ent->s.weapon &&
;2293:			ent->splashDamage) ||
;2294:			(ent &&
;2295:			ent->bolt_Head == 1000 &&
;2296:			ent->inuse &&
;2297:			ent->health > 0 &&
;2298:			ent->boltpoint3 != bs->client &&
;2299:			g_entities[ent->boltpoint3].client && !OnSameTeam(&g_entities[bs->client], &g_entities[ent->boltpoint3])) )
;2300:		{ //try to escape from anything with a non-0 s.weapon and non-0 damage. This hopefully only means dangerous projectiles.
line 2302
;2301:		  //Or a sentry gun if bolt_Head == 1000. This is a terrible hack, yes.
;2302:			VectorSubtract(bs->origin, ent->r.currentOrigin, hold);
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 1168
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 1168
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2303
;2303:			glen = VectorLength(hold);
ADDRLP4 8
ARGP4
ADDRLP4 1176
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1176
INDIRF4
ASGNF4
line 2305
;2304:
;2305:			if (ent->s.weapon != WP_THERMAL && ent->s.weapon != WP_FLECHETTE &&
ADDRLP4 1180
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 11
EQI4 $1061
ADDRLP4 1180
INDIRI4
CNSTI4 9
EQI4 $1061
ADDRLP4 1180
INDIRI4
CNSTI4 13
EQI4 $1061
ADDRLP4 1180
INDIRI4
CNSTI4 12
EQI4 $1061
line 2307
;2306:				ent->s.weapon != WP_DET_PACK && ent->s.weapon != WP_TRIP_MINE)
;2307:			{
line 2308
;2308:				factor = 0.5;
ADDRLP4 24
CNSTF4 1056964608
ASGNF4
line 2310
;2309:
;2310:				if (ent->s.weapon && glen <= 256 && bs->settings.skill > 2)
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1062
ADDRLP4 20
INDIRF4
CNSTF4 1132462080
GTF4 $1062
ADDRFP4 0
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
CNSTF4 1073741824
LEF4 $1062
line 2311
;2311:				{ //it's a projectile so push it away
line 2312
;2312:					bs->doForcePush = level.time + 700;
ADDRFP4 0
INDIRP4
CNSTI4 4796
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 2314
;2313:					//G_Printf("PUSH PROJECTILE\n");
;2314:				}
line 2315
;2315:			}
ADDRGP4 $1062
JUMPV
LABELV $1061
line 2317
;2316:			else
;2317:			{
line 2318
;2318:				factor = 1;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 2319
;2319:			}
LABELV $1062
line 2321
;2320:
;2321:			if (ent->s.weapon == WP_ROCKET_LAUNCHER &&
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 10
NEI4 $1066
ADDRLP4 1188
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1192
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1188
INDIRI4
ADDRLP4 1192
INDIRI4
EQI4 $1069
ADDRLP4 1188
INDIRI4
CNSTI4 0
LTI4 $1066
ADDRLP4 1188
INDIRI4
CNSTI4 32
GEI4 $1066
ADDRLP4 1196
CNSTI4 2352
ASGNI4
ADDRLP4 1200
ADDRLP4 1196
INDIRI4
ADDRLP4 1188
INDIRI4
MULI4
ASGNI4
ADDRLP4 1200
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1066
ADDRLP4 1204
ADDRGP4 g_entities
ASGNP4
ADDRLP4 1196
INDIRI4
ADDRLP4 1192
INDIRI4
MULI4
ADDRLP4 1204
INDIRP4
ADDP4
ARGP4
ADDRLP4 1200
INDIRI4
ADDRLP4 1204
INDIRP4
ADDP4
ARGP4
ADDRLP4 1208
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1208
INDIRI4
CNSTI4 0
EQI4 $1066
LABELV $1069
line 2325
;2322:				(ent->r.ownerNum == bs->client ||
;2323:				(ent->r.ownerNum >= 0 && ent->r.ownerNum < MAX_CLIENTS &&
;2324:				g_entities[ent->r.ownerNum].client && OnSameTeam(&g_entities[bs->client], &g_entities[ent->r.ownerNum]))) )
;2325:			{ //don't be afraid of your own rockets or your teammates' rockets
line 2326
;2326:				factor = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 2327
;2327:			}
LABELV $1066
line 2329
;2328:
;2329:			if (glen < bestdist*factor && trap_InPVS(bs->origin, ent->s.pos.trBase))
ADDRLP4 20
INDIRF4
ADDRLP4 1108
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
GEF4 $1070
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1212
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
EQI4 $1070
line 2330
;2330:			{
line 2331
;2331:				JP_Trace(&tr, bs->origin, NULL, NULL, ent->s.pos.trBase, bs->client, MASK_SOLID);
ADDRLP4 28
ARGP4
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1220
CNSTP4 0
ASGNP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1216
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2333
;2332:
;2333:				if (tr.fraction == 1 || tr.entityNum == ent->s.number)
ADDRLP4 28+8
INDIRF4
CNSTF4 1065353216
EQF4 $1076
ADDRLP4 28+52
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
NEI4 $1072
LABELV $1076
line 2334
;2334:				{
line 2335
;2335:					bestindex = i;
ADDRLP4 1116
ADDRLP4 4
INDIRI4
ASGNI4
line 2336
;2336:					bestdist = glen;
ADDRLP4 1108
ADDRLP4 20
INDIRF4
ASGNF4
line 2337
;2337:					foundindex = 1;
ADDRLP4 1112
CNSTI4 1
ASGNI4
line 2338
;2338:				}
LABELV $1072
line 2339
;2339:			}
LABELV $1070
line 2340
;2340:		}
LABELV $1050
line 2342
;2341:
;2342:		if (ent && !ent->client && ent->inuse && ent->damage && ent->s.weapon && ent->r.ownerNum < MAX_CLIENTS && ent->r.ownerNum >= 0)
ADDRLP4 1172
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1172
INDIRU4
EQU4 $1077
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1172
INDIRU4
NEU4 $1077
ADDRLP4 1176
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1077
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1077
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1077
ADDRLP4 1180
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 32
GEI4 $1077
ADDRLP4 1180
INDIRI4
ADDRLP4 1176
INDIRI4
LTI4 $1077
line 2343
;2343:		{ //if we're in danger of a projectile belonging to someone and don't have an enemy, set the enemy to them
line 2344
;2344:			gentity_t *projOwner = &g_entities[ent->r.ownerNum];
ADDRLP4 1184
CNSTI4 2352
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2346
;2345:
;2346:			if (projOwner && projOwner->inuse && projOwner->client)
ADDRLP4 1192
CNSTU4 0
ASGNU4
ADDRLP4 1184
INDIRP4
CVPU4 4
ADDRLP4 1192
INDIRU4
EQU4 $1079
ADDRLP4 1184
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1079
ADDRLP4 1184
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1192
INDIRU4
EQU4 $1079
line 2347
;2347:			{
line 2348
;2348:				if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1081
line 2349
;2349:				{
line 2350
;2350:					if (PassStandardEnemyChecks(bs, projOwner))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1196
ADDRGP4 PassStandardEnemyChecks
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
EQI4 $1083
line 2351
;2351:					{
line 2352
;2352:						if (PassLovedOneCheck(bs, projOwner))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1200
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
EQI4 $1085
line 2353
;2353:						{
line 2354
;2354:							VectorSubtract(bs->origin, ent->r.currentOrigin, hold);
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 1204
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 1204
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2355
;2355:							glen = VectorLength(hold);
ADDRLP4 8
ARGP4
ADDRLP4 1212
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1212
INDIRF4
ASGNF4
line 2357
;2356:
;2357:							if (glen < 512)
ADDRLP4 20
INDIRF4
CNSTF4 1140850688
GEF4 $1089
line 2358
;2358:							{
line 2359
;2359:								bs->currentEnemy = projOwner;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
ADDRLP4 1184
INDIRP4
ASGNP4
line 2360
;2360:								bs->enemySeenTime = level.time + ENEMY_FORGET_MS;
ADDRFP4 0
INDIRP4
CNSTI4 1996
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 2361
;2361:							}
LABELV $1089
line 2362
;2362:						}
LABELV $1085
line 2363
;2363:					}
LABELV $1083
line 2364
;2364:				}
LABELV $1081
line 2365
;2365:			}
LABELV $1079
line 2366
;2366:		}
LABELV $1077
line 2368
;2367:
;2368:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2369
;2369:	}
LABELV $1048
line 2283
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $1047
line 2371
;2370:
;2371:	if (foundindex)
ADDRLP4 1112
INDIRI4
CNSTI4 0
EQI4 $1092
line 2372
;2372:	{
line 2373
;2373:		bs->dontGoBack = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 2272
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 2374
;2374:		return &g_entities[bestindex];
CNSTI4 2352
ADDRLP4 1116
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
RETP4
ADDRGP4 $1046
JUMPV
LABELV $1092
line 2377
;2375:	}
;2376:	else
;2377:	{
line 2378
;2378:		return NULL;
CNSTP4 0
RETP4
LABELV $1046
endproc GetNearestBadThing 1224 28
export BotDefendFlag
proc BotDefendFlag 28 4
line 2383
;2379:	}
;2380:}
;2381:
;2382:int BotDefendFlag(bot_state_t *bs)
;2383:{
line 2387
;2384:	wpobject_t *flagPoint;
;2385:	vec3_t a;
;2386:
;2387:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1096
line 2388
;2388:	{
line 2389
;2389:		flagPoint = flagRed;
ADDRLP4 0
ADDRGP4 flagRed
INDIRP4
ASGNP4
line 2390
;2390:	}
ADDRGP4 $1097
JUMPV
LABELV $1096
line 2391
;2391:	else if (level.clients[bs->client].sess.sessionTeam == TEAM_BLUE)
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1098
line 2392
;2392:	{
line 2393
;2393:		flagPoint = flagBlue;
ADDRLP4 0
ADDRGP4 flagBlue
INDIRP4
ASGNP4
line 2394
;2394:	}
ADDRGP4 $1099
JUMPV
LABELV $1098
line 2396
;2395:	else
;2396:	{
line 2397
;2397:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1095
JUMPV
LABELV $1099
LABELV $1097
line 2400
;2398:	}
;2399:
;2400:	if (!flagPoint)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1100
line 2401
;2401:	{
line 2402
;2402:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1095
JUMPV
LABELV $1100
line 2405
;2403:	}
;2404:
;2405:	VectorSubtract(bs->origin, flagPoint->origin, a);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2407
;2406:
;2407:	if (VectorLength(a) > BASE_GUARD_DISTANCE)
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1132462080
LEF4 $1104
line 2408
;2408:	{
line 2409
;2409:		bs->wpDestination = flagPoint;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2410
;2410:	}
LABELV $1104
line 2412
;2411:
;2412:	return 1;
CNSTI4 1
RETI4
LABELV $1095
endproc BotDefendFlag 28 4
export BotGetEnemyFlag
proc BotGetEnemyFlag 28 4
line 2416
;2413:}
;2414:
;2415:int BotGetEnemyFlag(bot_state_t *bs)
;2416:{
line 2420
;2417:	wpobject_t *flagPoint;
;2418:	vec3_t a;
;2419:
;2420:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1107
line 2421
;2421:	{
line 2422
;2422:		flagPoint = flagBlue;
ADDRLP4 0
ADDRGP4 flagBlue
INDIRP4
ASGNP4
line 2423
;2423:	}
ADDRGP4 $1108
JUMPV
LABELV $1107
line 2424
;2424:	else if (level.clients[bs->client].sess.sessionTeam == TEAM_BLUE)
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1109
line 2425
;2425:	{
line 2426
;2426:		flagPoint = flagRed;
ADDRLP4 0
ADDRGP4 flagRed
INDIRP4
ASGNP4
line 2427
;2427:	}
ADDRGP4 $1110
JUMPV
LABELV $1109
line 2429
;2428:	else
;2429:	{
line 2430
;2430:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1106
JUMPV
LABELV $1110
LABELV $1108
line 2433
;2431:	}
;2432:
;2433:	if (!flagPoint)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1111
line 2434
;2434:	{
line 2435
;2435:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1106
JUMPV
LABELV $1111
line 2438
;2436:	}
;2437:
;2438:	VectorSubtract(bs->origin, flagPoint->origin, a);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2440
;2439:
;2440:	if (VectorLength(a) > BASE_GETENEMYFLAG_DISTANCE)
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1132462080
LEF4 $1115
line 2441
;2441:	{
line 2442
;2442:		bs->wpDestination = flagPoint;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2443
;2443:	}
LABELV $1115
line 2445
;2444:
;2445:	return 1;
CNSTI4 1
RETI4
LABELV $1106
endproc BotGetEnemyFlag 28 4
export BotGetFlagBack
proc BotGetFlagBack 52 20
line 2449
;2446:}
;2447:
;2448:int BotGetFlagBack(bot_state_t *bs)
;2449:{
line 2450
;2450:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2451
;2451:	int myFlag = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2452
;2452:	int foundCarrier = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2453
;2453:	int tempInt = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2454
;2454:	gentity_t *ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2457
;2455:	vec3_t usethisvec;
;2456:
;2457:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1118
line 2458
;2458:	{
line 2459
;2459:		myFlag = PW_REDFLAG;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 2460
;2460:	}
ADDRGP4 $1121
JUMPV
LABELV $1118
line 2462
;2461:	else
;2462:	{
line 2463
;2463:		myFlag = PW_BLUEFLAG;
ADDRLP4 8
CNSTI4 5
ASGNI4
line 2464
;2464:	}
ADDRGP4 $1121
JUMPV
LABELV $1120
line 2467
;2465:
;2466:	while (i < MAX_CLIENTS)
;2467:	{
line 2468
;2468:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2470
;2469:
;2470:		if (ent && ent->client && ent->client->ps.powerups[myFlag] && !OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1123
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1123
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1123
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $1123
line 2471
;2471:		{
line 2472
;2472:			foundCarrier = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2473
;2473:			break;
ADDRGP4 $1122
JUMPV
LABELV $1123
line 2476
;2474:		}
;2475:
;2476:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2477
;2477:	}
LABELV $1121
line 2466
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1120
LABELV $1122
line 2479
;2478:
;2479:	if (!foundCarrier)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1125
line 2480
;2480:	{
line 2481
;2481:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1117
JUMPV
LABELV $1125
line 2484
;2482:	}
;2483:
;2484:	if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1127
line 2485
;2485:	{
line 2486
;2486:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1117
JUMPV
LABELV $1127
line 2489
;2487:	}
;2488:
;2489:	if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1129
line 2490
;2490:	{
line 2491
;2491:		if (ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1132
line 2492
;2492:		{
line 2493
;2493:			VectorCopy(ent->client->ps.origin, usethisvec);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2494
;2494:		}
ADDRGP4 $1133
JUMPV
LABELV $1132
line 2496
;2495:		else
;2496:		{
line 2497
;2497:			VectorCopy(ent->s.origin, usethisvec);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2498
;2498:		}
LABELV $1133
line 2500
;2499:
;2500:		tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 2502
;2501:
;2502:		if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 36
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 -1
EQI4 $1134
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 3212836864
EQF4 $1134
line 2503
;2503:		{
line 2504
;2504:			bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2505
;2505:			bs->wpDestSwitchTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 1000, 5000, qfalse, 2500);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 5000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2500
ARGI4
ADDRLP4 48
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 2506
;2506:		}
LABELV $1134
line 2507
;2507:	}
LABELV $1129
line 2509
;2508:
;2509:	return 1;
CNSTI4 1
RETI4
LABELV $1117
endproc BotGetFlagBack 52 20
export BotGuardFlagCarrier
proc BotGuardFlagCarrier 52 20
line 2513
;2510:}
;2511:
;2512:int BotGuardFlagCarrier(bot_state_t *bs)
;2513:{
line 2514
;2514:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2515
;2515:	int enemyFlag = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2516
;2516:	int foundCarrier = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2517
;2517:	int tempInt = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2518
;2518:	gentity_t *ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2521
;2519:	vec3_t usethisvec;
;2520:
;2521:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1138
line 2522
;2522:	{
line 2523
;2523:		enemyFlag = PW_BLUEFLAG;
ADDRLP4 8
CNSTI4 5
ASGNI4
line 2524
;2524:	}
ADDRGP4 $1141
JUMPV
LABELV $1138
line 2526
;2525:	else
;2526:	{
line 2527
;2527:		enemyFlag = PW_REDFLAG;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 2528
;2528:	}
ADDRGP4 $1141
JUMPV
LABELV $1140
line 2531
;2529:
;2530:	while (i < MAX_CLIENTS)
;2531:	{
line 2532
;2532:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2534
;2533:
;2534:		if (ent && ent->client && ent->client->ps.powerups[enemyFlag] && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1143
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $1143
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1143
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $1143
line 2535
;2535:		{
line 2536
;2536:			foundCarrier = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 2537
;2537:			break;
ADDRGP4 $1142
JUMPV
LABELV $1143
line 2540
;2538:		}
;2539:
;2540:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2541
;2541:	}
LABELV $1141
line 2530
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1140
LABELV $1142
line 2543
;2542:
;2543:	if (!foundCarrier)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1145
line 2544
;2544:	{
line 2545
;2545:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1145
line 2548
;2546:	}
;2547:
;2548:	if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1147
line 2549
;2549:	{
line 2550
;2550:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1137
JUMPV
LABELV $1147
line 2553
;2551:	}
;2552:
;2553:	if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1149
line 2554
;2554:	{
line 2555
;2555:		if (ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1152
line 2556
;2556:		{
line 2557
;2557:			VectorCopy(ent->client->ps.origin, usethisvec);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2558
;2558:		}
ADDRGP4 $1153
JUMPV
LABELV $1152
line 2560
;2559:		else
;2560:		{
line 2561
;2561:			VectorCopy(ent->s.origin, usethisvec);
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2562
;2562:		}
LABELV $1153
line 2564
;2563:
;2564:		tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 2566
;2565:
;2566:		if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 36
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 -1
EQI4 $1154
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 3212836864
EQF4 $1154
line 2567
;2567:		{
line 2568
;2568:			bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2569
;2569:			bs->wpDestSwitchTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 1000, 5000, qfalse, 2500);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 5000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2500
ARGI4
ADDRLP4 48
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 48
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 2570
;2570:		}
LABELV $1154
line 2571
;2571:	}
LABELV $1149
line 2573
;2572:
;2573:	return 1;
CNSTI4 1
RETI4
LABELV $1137
endproc BotGuardFlagCarrier 52 20
export BotGetFlagHome
proc BotGetFlagHome 28 4
line 2577
;2574:}
;2575:
;2576:int BotGetFlagHome(bot_state_t *bs)
;2577:{
line 2581
;2578:	wpobject_t *flagPoint;
;2579:	vec3_t a;
;2580:
;2581:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1158
line 2582
;2582:	{
line 2583
;2583:		flagPoint = flagRed;
ADDRLP4 0
ADDRGP4 flagRed
INDIRP4
ASGNP4
line 2584
;2584:	}
ADDRGP4 $1159
JUMPV
LABELV $1158
line 2585
;2585:	else if (level.clients[bs->client].sess.sessionTeam == TEAM_BLUE)
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1160
line 2586
;2586:	{
line 2587
;2587:		flagPoint = flagBlue;
ADDRLP4 0
ADDRGP4 flagBlue
INDIRP4
ASGNP4
line 2588
;2588:	}
ADDRGP4 $1161
JUMPV
LABELV $1160
line 2590
;2589:	else
;2590:	{
line 2591
;2591:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1157
JUMPV
LABELV $1161
LABELV $1159
line 2594
;2592:	}
;2593:
;2594:	if (!flagPoint)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1162
line 2595
;2595:	{
line 2596
;2596:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1157
JUMPV
LABELV $1162
line 2599
;2597:	}
;2598:
;2599:	VectorSubtract(bs->origin, flagPoint->origin, a);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2601
;2600:
;2601:	if (VectorLength(a) > BASE_FLAGWAIT_DISTANCE)
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1132462080
LEF4 $1166
line 2602
;2602:	{
line 2603
;2603:		bs->wpDestination = flagPoint;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2604
;2604:	}
LABELV $1166
line 2606
;2605:
;2606:	return 1;
CNSTI4 1
RETI4
LABELV $1157
endproc BotGetFlagHome 28 4
export GetNewFlagPoint
proc GetNewFlagPoint 1164 28
line 2610
;2607:}
;2608:
;2609:void GetNewFlagPoint(wpobject_t *wp, gentity_t *flagEnt, int team)
;2610:{ //get the nearest possible waypoint to the flag since it's not in its original position
line 2611
;2611:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2615
;2612:	vec3_t a, mins, maxs;
;2613:	float bestdist;
;2614:	float testdist;
;2615:	int bestindex = 0;
ADDRLP4 1132
CNSTI4 0
ASGNI4
line 2616
;2616:	int foundindex = 0;
ADDRLP4 1128
CNSTI4 0
ASGNI4
line 2619
;2617:	trace_t tr;
;2618:
;2619:	mins[0] = -15;
ADDRLP4 1104
CNSTF4 3245342720
ASGNF4
line 2620
;2620:	mins[1] = -15;
ADDRLP4 1104+4
CNSTF4 3245342720
ASGNF4
line 2621
;2621:	mins[2] = -5;
ADDRLP4 1104+8
CNSTF4 3231711232
ASGNF4
line 2622
;2622:	maxs[0] = 15;
ADDRLP4 1116
CNSTF4 1097859072
ASGNF4
line 2623
;2623:	maxs[1] = 15;
ADDRLP4 1116+4
CNSTF4 1097859072
ASGNF4
line 2624
;2624:	maxs[2] = 5;
ADDRLP4 1116+8
CNSTF4 1084227584
ASGNF4
line 2626
;2625:
;2626:	VectorSubtract(wp->origin, flagEnt->s.pos.trBase, a);
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 1136
INDIRP4
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 1136
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2628
;2627:
;2628:	bestdist = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 1144
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1144
INDIRF4
ASGNF4
line 2630
;2629:
;2630:	if (bestdist <= WP_KEEP_FLAG_DIST)
ADDRLP4 20
INDIRF4
CNSTF4 1124073472
GTF4 $1181
line 2631
;2631:	{
line 2632
;2632:		JP_Trace(&tr, wp->origin, mins, maxs, flagEnt->s.pos.trBase, flagEnt->s.number, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1148
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2634
;2633:
;2634:		if (tr.fraction == 1)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1181
line 2635
;2635:		{ //this point is good
line 2636
;2636:			return;
ADDRGP4 $1168
JUMPV
line 2638
;2637:		}
;2638:	}
LABELV $1180
line 2641
;2639:
;2640:	while (i < gWPNum)
;2641:	{
line 2642
;2642:		VectorSubtract(gWPArray[i]->origin, flagEnt->s.pos.trBase, a);
ADDRLP4 1148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 1152
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 1148
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 1152
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 1148
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1152
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2643
;2643:		testdist = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 1156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 1156
INDIRF4
ASGNF4
line 2645
;2644:
;2645:		if (testdist < bestdist)
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $1185
line 2646
;2646:		{
line 2647
;2647:			JP_Trace(&tr, gWPArray[i]->origin, mins, maxs, flagEnt->s.pos.trBase, flagEnt->s.number, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1160
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1160
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2649
;2648:
;2649:			if (tr.fraction == 1)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1187
line 2650
;2650:			{
line 2651
;2651:				foundindex = 1;
ADDRLP4 1128
CNSTI4 1
ASGNI4
line 2652
;2652:				bestindex = i;
ADDRLP4 1132
ADDRLP4 0
INDIRI4
ASGNI4
line 2653
;2653:				bestdist = testdist;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 2654
;2654:			}
LABELV $1187
line 2655
;2655:		}
LABELV $1185
line 2657
;2656:
;2657:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2658
;2658:	}
LABELV $1181
line 2640
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $1180
line 2660
;2659:
;2660:	if (foundindex)
ADDRLP4 1128
INDIRI4
CNSTI4 0
EQI4 $1190
line 2661
;2661:	{
line 2662
;2662:		if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1192
line 2663
;2663:		{
line 2664
;2664:			flagRed = gWPArray[bestindex];
ADDRGP4 flagRed
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2665
;2665:		}
ADDRGP4 $1193
JUMPV
LABELV $1192
line 2667
;2666:		else
;2667:		{
line 2668
;2668:			flagBlue = gWPArray[bestindex];
ADDRGP4 flagBlue
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2669
;2669:		}
LABELV $1193
line 2670
;2670:	}
LABELV $1190
line 2671
;2671:}
LABELV $1168
endproc GetNewFlagPoint 1164 28
export CTFTakesPriority
proc CTFTakesPriority 120 12
line 2674
;2672:
;2673:int CTFTakesPriority(bot_state_t *bs)
;2674:{
line 2675
;2675:	gentity_t *ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2676
;2676:	int enemyFlag = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2677
;2677:	int myFlag = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 2678
;2678:	int enemyHasOurFlag = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 2680
;2679:	// int weHaveEnemyFlag = 0;
;2680:	int numOnMyTeam = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 2681
;2681:	int numOnEnemyTeam = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 2682
;2682:	int numAttackers = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2683
;2683:	int numDefenders = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 2684
;2684:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2686
;2685:	int idleWP;
;2686:	int dosw = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 2687
;2687:	wpobject_t *dest_sw = NULL;
ADDRLP4 44
CNSTP4 0
ASGNP4
line 2694
;2688:#ifdef BOT_CTF_DEBUG
;2689:	vec3_t t;
;2690:
;2691:	G_Printf("CTFSTATE: %s\n", ctfStateNames[bs->ctfState]);
;2692:#endif
;2693:
;2694:	if (g_gametype.integer != GT_CTF && g_gametype.integer != GT_CTY)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $1195
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $1195
line 2695
;2695:	{
line 2696
;2696:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1195
line 2699
;2697:	}
;2698:
;2699:	if (bs->cur_ps.weapon == WP_BRYAR_PISTOL &&
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1199
ADDRGP4 level+36
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $1199
line 2701
;2700:		(level.time - bs->lastDeadTime) < BOT_MAX_WEAPON_GATHER_TIME)
;2701:	{ //get the nearest weapon laying around base before heading off for battle
line 2702
;2702:		idleWP = GetBestIdleGoal(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 GetBestIdleGoal
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 52
INDIRI4
ASGNI4
line 2704
;2703:
;2704:		if (idleWP != -1 && gWPArray[idleWP] && gWPArray[idleWP]->inuse)
ADDRLP4 56
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 -1
EQI4 $1200
ADDRLP4 60
ADDRLP4 56
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1200
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1200
line 2705
;2705:		{
line 2706
;2706:			if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1204
line 2707
;2707:			{
line 2708
;2708:				bs->wpDestination = gWPArray[idleWP];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2709
;2709:			}
LABELV $1204
line 2710
;2710:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1194
JUMPV
line 2712
;2711:		}
;2712:	}
LABELV $1199
line 2713
;2713:	else if (bs->cur_ps.weapon == WP_BRYAR_PISTOL &&
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1207
ADDRGP4 level+36
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
SUBI4
CNSTI4 5000
GEI4 $1207
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1207
ADDRLP4 56
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1207
line 2716
;2714:		(level.time - bs->lastDeadTime) < BOT_MAX_WEAPON_CHASE_CTF &&
;2715:		bs->wpDestination && bs->wpDestination->weight)
;2716:	{
line 2717
;2717:		dest_sw = bs->wpDestination;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
line 2718
;2718:		dosw = 1;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 2719
;2719:	}
LABELV $1207
LABELV $1200
line 2721
;2720:
;2721:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1210
line 2722
;2722:	{
line 2723
;2723:		myFlag = PW_REDFLAG;
ADDRLP4 16
CNSTI4 4
ASGNI4
line 2724
;2724:	}
ADDRGP4 $1211
JUMPV
LABELV $1210
line 2726
;2725:	else
;2726:	{
line 2727
;2727:		myFlag = PW_BLUEFLAG;
ADDRLP4 16
CNSTI4 5
ASGNI4
line 2728
;2728:	}
LABELV $1211
line 2730
;2729:
;2730:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1212
line 2731
;2731:	{
line 2732
;2732:		enemyFlag = PW_BLUEFLAG;
ADDRLP4 8
CNSTI4 5
ASGNI4
line 2733
;2733:	}
ADDRGP4 $1213
JUMPV
LABELV $1212
line 2735
;2734:	else
;2735:	{
line 2736
;2736:		enemyFlag = PW_REDFLAG;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 2737
;2737:	}
LABELV $1213
line 2739
;2738:
;2739:	if (!flagRed || !flagBlue ||
ADDRLP4 60
ADDRGP4 flagRed
INDIRP4
ASGNP4
ADDRLP4 64
CNSTU4 0
ASGNU4
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $1220
ADDRLP4 68
ADDRGP4 flagBlue
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $1220
ADDRLP4 72
CNSTI4 12
ASGNI4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $1220
ADDRLP4 68
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $1220
ADDRGP4 eFlagRed
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $1220
ADDRGP4 eFlagBlue
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
NEU4 $1214
LABELV $1220
line 2742
;2740:		!flagRed->inuse || !flagBlue->inuse ||
;2741:		!eFlagRed || !eFlagBlue)
;2742:	{
line 2743
;2743:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1214
line 2756
;2744:	}
;2745:
;2746:#ifdef BOT_CTF_DEBUG
;2747:	VectorCopy(flagRed->origin, t);
;2748:	t[2] += 128;
;2749:	G_TestLine(flagRed->origin, t, 0x0000ff, 500);
;2750:
;2751:	VectorCopy(flagBlue->origin, t);
;2752:	t[2] += 128;
;2753:	G_TestLine(flagBlue->origin, t, 0x0000ff, 500);
;2754:#endif
;2755:
;2756:	if (droppedRedFlag && (droppedRedFlag->flags & FL_DROPPED_ITEM))
ADDRLP4 80
ADDRGP4 droppedRedFlag
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1221
ADDRLP4 80
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1221
line 2757
;2757:	{
line 2758
;2758:		GetNewFlagPoint(flagRed, droppedRedFlag, TEAM_RED);
ADDRGP4 flagRed
INDIRP4
ARGP4
ADDRGP4 droppedRedFlag
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 GetNewFlagPoint
CALLV
pop
line 2759
;2759:	}
ADDRGP4 $1222
JUMPV
LABELV $1221
line 2761
;2760:	else
;2761:	{
line 2762
;2762:		flagRed = oFlagRed;
ADDRGP4 flagRed
ADDRGP4 oFlagRed
INDIRP4
ASGNP4
line 2763
;2763:	}
LABELV $1222
line 2765
;2764:
;2765:	if (droppedBlueFlag && (droppedBlueFlag->flags & FL_DROPPED_ITEM))
ADDRLP4 84
ADDRGP4 droppedBlueFlag
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1223
ADDRLP4 84
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1223
line 2766
;2766:	{
line 2767
;2767:		GetNewFlagPoint(flagBlue, droppedBlueFlag, TEAM_BLUE);
ADDRGP4 flagBlue
INDIRP4
ARGP4
ADDRGP4 droppedBlueFlag
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 GetNewFlagPoint
CALLV
pop
line 2768
;2768:	}
ADDRGP4 $1224
JUMPV
LABELV $1223
line 2770
;2769:	else
;2770:	{
line 2771
;2771:		flagBlue = oFlagBlue;
ADDRGP4 flagBlue
ADDRGP4 oFlagBlue
INDIRP4
ASGNP4
line 2772
;2772:	}
LABELV $1224
line 2774
;2773:
;2774:	if (!bs->ctfState)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1225
line 2775
;2775:	{
line 2776
;2776:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1225
line 2779
;2777:	}
;2778:
;2779:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1228
JUMPV
LABELV $1227
line 2782
;2780:
;2781:	while (i < MAX_CLIENTS)
;2782:	{
line 2783
;2783:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2785
;2784:
;2785:		if (ent && ent->client)
ADDRLP4 92
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $1230
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $1230
line 2786
;2786:		{
line 2787
;2787:			if (ent->client->ps.powerups[enemyFlag] && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1232
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $1232
line 2788
;2788:			{
line 2790
;2789:				// weHaveEnemyFlag = 1;
;2790:			}
ADDRGP4 $1233
JUMPV
LABELV $1232
line 2791
;2791:			else if (ent->client->ps.powerups[myFlag] && !OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1234
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $1234
line 2792
;2792:			{
line 2793
;2793:				enemyHasOurFlag = 1;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 2794
;2794:			}
LABELV $1234
LABELV $1233
line 2796
;2795:
;2796:			if (OnSameTeam(&g_entities[bs->client], ent))
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $1236
line 2797
;2797:			{
line 2798
;2798:				numOnMyTeam++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2799
;2799:			}
ADDRGP4 $1237
JUMPV
LABELV $1236
line 2801
;2800:			else
;2801:			{
line 2802
;2802:				numOnEnemyTeam++;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2803
;2803:			}
LABELV $1237
line 2805
;2804:
;2805:			if (botstates[ent->s.number])
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1238
line 2806
;2806:			{
line 2807
;2807:				if (botstates[ent->s.number]->ctfState == CTFSTATE_ATTACKER ||
ADDRLP4 116
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 1
EQI4 $1242
ADDRLP4 116
INDIRI4
CNSTI4 3
NEI4 $1240
LABELV $1242
line 2809
;2808:					botstates[ent->s.number]->ctfState == CTFSTATE_RETRIEVAL)
;2809:				{
line 2810
;2810:					numAttackers++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2811
;2811:				}
ADDRGP4 $1239
JUMPV
LABELV $1240
line 2813
;2812:				else
;2813:				{
line 2814
;2814:					numDefenders++;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2815
;2815:				}
line 2816
;2816:			}
ADDRGP4 $1239
JUMPV
LABELV $1238
line 2818
;2817:			else
;2818:			{ //assume real players to be attackers in our logic
line 2819
;2819:				numAttackers++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2820
;2820:			}
LABELV $1239
line 2821
;2821:		}
LABELV $1230
line 2822
;2822:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2823
;2823:	}
LABELV $1228
line 2781
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1227
line 2825
;2824:
;2825:	if (bs->cur_ps.powerups[enemyFlag])
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 360
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1243
line 2826
;2826:	{
line 2827
;2827:		if ((numOnMyTeam < 2 || !numAttackers) && enemyHasOurFlag)
ADDRLP4 20
INDIRI4
CNSTI4 2
LTI4 $1247
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1245
LABELV $1247
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $1245
line 2828
;2828:		{
line 2829
;2829:			bs->ctfState = CTFSTATE_RETRIEVAL;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 3
ASGNI4
line 2830
;2830:		}
ADDRGP4 $1244
JUMPV
LABELV $1245
line 2832
;2831:		else
;2832:		{
line 2833
;2833:			bs->ctfState = CTFSTATE_GETFLAGHOME;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 5
ASGNI4
line 2834
;2834:		}
line 2835
;2835:	}
ADDRGP4 $1244
JUMPV
LABELV $1243
line 2836
;2836:	else if (bs->ctfState == CTFSTATE_GETFLAGHOME)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1248
line 2837
;2837:	{
line 2838
;2838:		bs->ctfState = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 0
ASGNI4
line 2839
;2839:	}
LABELV $1248
LABELV $1244
line 2841
;2840:
;2841:	if (bs->state_Forced)
ADDRFP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1250
line 2842
;2842:	{
line 2843
;2843:		bs->ctfState = bs->state_Forced;
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 2688
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ASGNI4
line 2844
;2844:	}
LABELV $1250
line 2846
;2845:
;2846:	if (bs->ctfState == CTFSTATE_DEFENDER)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1252
line 2847
;2847:	{
line 2848
;2848:		if (BotDefendFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 BotDefendFlag
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $1254
line 2849
;2849:		{
line 2850
;2850:			goto success;
ADDRGP4 $1256
JUMPV
LABELV $1254
line 2852
;2851:		}
;2852:	}
LABELV $1252
line 2854
;2853:
;2854:	if (bs->ctfState == CTFSTATE_ATTACKER)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1257
line 2855
;2855:	{
line 2856
;2856:		if (BotGetEnemyFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 BotGetEnemyFlag
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $1259
line 2857
;2857:		{
line 2858
;2858:			goto success;
ADDRGP4 $1256
JUMPV
LABELV $1259
line 2860
;2859:		}
;2860:	}
LABELV $1257
line 2862
;2861:
;2862:	if (bs->ctfState == CTFSTATE_RETRIEVAL)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1261
line 2863
;2863:	{
line 2864
;2864:		if (BotGetFlagBack(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 BotGetFlagBack
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $1263
line 2865
;2865:		{
line 2866
;2866:			goto success;
ADDRGP4 $1256
JUMPV
LABELV $1263
line 2869
;2867:		}
;2868:		else
;2869:		{ //can't find anyone on another team being a carrier, so ignore this priority
line 2870
;2870:			bs->ctfState = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 0
ASGNI4
line 2871
;2871:		}
line 2872
;2872:	}
LABELV $1261
line 2874
;2873:
;2874:	if (bs->ctfState == CTFSTATE_GUARDCARRIER)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1265
line 2875
;2875:	{
line 2876
;2876:		if (BotGuardFlagCarrier(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 BotGuardFlagCarrier
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $1267
line 2877
;2877:		{
line 2878
;2878:			goto success;
ADDRGP4 $1256
JUMPV
LABELV $1267
line 2881
;2879:		}
;2880:		else
;2881:		{ //can't find anyone on our team being a carrier, so ignore this priority
line 2882
;2882:			bs->ctfState = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 0
ASGNI4
line 2883
;2883:		}
line 2884
;2884:	}
LABELV $1265
line 2886
;2885:
;2886:	if (bs->ctfState == CTFSTATE_GETFLAGHOME)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1269
line 2887
;2887:	{
line 2888
;2888:		if (BotGetFlagHome(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 BotGetFlagHome
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $1271
line 2889
;2889:		{
line 2890
;2890:			goto success;
ADDRGP4 $1256
JUMPV
LABELV $1271
line 2892
;2891:		}
;2892:	}
LABELV $1269
line 2894
;2893:
;2894:	return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1256
line 2897
;2895:
;2896:success:
;2897:	if (dosw)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1273
line 2898
;2898:	{ //allow ctf code to run, but if after a particular item then keep going after it
line 2899
;2899:		bs->wpDestination = dest_sw;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 44
INDIRP4
ASGNP4
line 2900
;2900:	}
LABELV $1273
line 2902
;2901:
;2902:	return 1;
CNSTI4 1
RETI4
LABELV $1194
endproc CTFTakesPriority 120 12
export EntityVisibleBox
proc EntityVisibleBox 1084 28
line 2906
;2903:}
;2904:
;2905:int EntityVisibleBox(vec3_t org1, vec3_t mins, vec3_t maxs, vec3_t org2, int ignore, int ignore2)
;2906:{
line 2909
;2907:	trace_t tr;
;2908:
;2909:	JP_Trace(&tr, org1, mins, maxs, org2, ignore, MASK_SOLID);
ADDRLP4 0
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
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2911
;2910:
;2911:	if (tr.fraction == 1 && !tr.startsolid && !tr.allsolid)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $1276
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $1276
ADDRLP4 0
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $1276
line 2912
;2912:	{
line 2913
;2913:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1275
JUMPV
LABELV $1276
line 2915
;2914:	}
;2915:	else if (tr.entityNum != ENTITYNUM_NONE && tr.entityNum == ignore2)
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
EQI4 $1280
ADDRLP4 0+52
INDIRI4
ADDRFP4 20
INDIRI4
NEI4 $1280
line 2916
;2916:	{
line 2917
;2917:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1275
JUMPV
LABELV $1280
line 2920
;2918:	}
;2919:
;2920:	return 0;
CNSTI4 0
RETI4
LABELV $1275
endproc EntityVisibleBox 1084 28
export Saga_TargetClosestObjective
proc Saga_TargetClosestObjective 128 24
line 2924
;2921:}
;2922:
;2923:int Saga_TargetClosestObjective(bot_state_t *bs, int flag)
;2924:{
line 2925
;2925:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2926
;2926:	int bestindex = -1;
ADDRLP4 24
CNSTI4 -1
ASGNI4
line 2927
;2927:	float testdistance = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 2933
;2928:	float bestdistance;
;2929:	gentity_t *goalent;
;2930:	vec3_t a, dif;
;2931:	vec3_t mins, maxs;
;2932:
;2933:	mins[0] = -1;
ADDRLP4 44
CNSTF4 3212836864
ASGNF4
line 2934
;2934:	mins[1] = -1;
ADDRLP4 44+4
CNSTF4 3212836864
ASGNF4
line 2935
;2935:	mins[2] = -1;
ADDRLP4 44+8
CNSTF4 3212836864
ASGNF4
line 2937
;2936:
;2937:	maxs[0] = 1;
ADDRLP4 56
CNSTF4 1065353216
ASGNF4
line 2938
;2938:	maxs[1] = 1;
ADDRLP4 56+4
CNSTF4 1065353216
ASGNF4
line 2939
;2939:	maxs[2] = 1;
ADDRLP4 56+8
CNSTF4 1065353216
ASGNF4
line 2941
;2940:
;2941:	if ( bs->wpDestination && (bs->wpDestination->flags & flag) && bs->wpDestination->associated_entity != ENTITYNUM_NONE &&
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
CNSTU4 0
ASGNU4
ADDRLP4 68
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $1294
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $1294
ADDRLP4 76
ADDRLP4 68
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 1023
EQI4 $1294
CNSTI4 2352
ADDRLP4 76
INDIRI4
MULI4
ADDRGP4 g_entities+664
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $1294
line 2943
;2942:		 g_entities[bs->wpDestination->associated_entity].use )
;2943:	{
line 2944
;2944:		goto hasPoint;
ADDRGP4 $1292
JUMPV
LABELV $1293
line 2948
;2945:	}
;2946:
;2947:	while (i < gWPNum)
;2948:	{
line 2949
;2949:		if ( gWPArray[i] && gWPArray[i]->inuse && (gWPArray[i]->flags & flag) && gWPArray[i]->associated_entity != ENTITYNUM_NONE &&
ADDRLP4 80
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
CNSTU4 0
ASGNU4
ADDRLP4 80
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $1296
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $1296
ADDRLP4 80
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
BANDI4
ADDRLP4 88
INDIRI4
EQI4 $1296
ADDRLP4 92
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 1023
EQI4 $1296
CNSTI4 2352
ADDRLP4 92
INDIRI4
MULI4
ADDRGP4 g_entities+664
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $1296
line 2951
;2950:			 g_entities[gWPArray[i]->associated_entity].use )
;2951:		{
line 2952
;2952:			VectorSubtract(gWPArray[i]->origin, bs->origin, a);
ADDRLP4 96
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 96
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 96
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2953
;2953:			testdistance = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 104
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 104
INDIRF4
ASGNF4
line 2955
;2954:
;2955:			if (bestindex == -1 || testdistance < bestdistance)
ADDRLP4 24
INDIRI4
CNSTI4 -1
EQI4 $1303
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
GEF4 $1301
LABELV $1303
line 2956
;2956:			{
line 2957
;2957:				bestdistance = testdistance;
ADDRLP4 28
ADDRLP4 16
INDIRF4
ASGNF4
line 2958
;2958:				bestindex = i;
ADDRLP4 24
ADDRLP4 0
INDIRI4
ASGNI4
line 2959
;2959:			}
LABELV $1301
line 2960
;2960:		}
LABELV $1296
line 2962
;2961:
;2962:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2963
;2963:	}
LABELV $1294
line 2947
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $1293
line 2965
;2964:
;2965:	if (bestindex != -1)
ADDRLP4 24
INDIRI4
CNSTI4 -1
EQI4 $1304
line 2966
;2966:	{
line 2967
;2967:		bs->wpDestination = gWPArray[bestindex];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2968
;2968:	}
ADDRGP4 $1305
JUMPV
LABELV $1304
line 2970
;2969:	else
;2970:	{
line 2971
;2971:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1284
JUMPV
LABELV $1305
LABELV $1292
line 2974
;2972:	}
;2973:hasPoint:
;2974:	goalent = &g_entities[bs->wpDestination->associated_entity];
ADDRLP4 20
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2976
;2975:
;2976:	if (!goalent)
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1306
line 2977
;2977:	{
line 2978
;2978:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1284
JUMPV
LABELV $1306
line 2981
;2979:	}
;2980:
;2981:	VectorSubtract(bs->origin, bs->wpDestination->origin, a);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 1888
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 80
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 80
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 88
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2983
;2982:
;2983:	testdistance = VectorLength(a);
ADDRLP4 4
ARGP4
ADDRLP4 92
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 92
INDIRF4
ASGNF4
line 2985
;2984:
;2985:	dif[0] = (goalent->r.absmax[0]+goalent->r.absmin[0])/2;
ADDRLP4 32
ADDRLP4 20
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2986
;2986:	dif[1] = (goalent->r.absmax[1]+goalent->r.absmin[1])/2;
ADDRLP4 32+4
ADDRLP4 20
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2987
;2987:	dif[2] = (goalent->r.absmax[2]+goalent->r.absmin[2])/2;
ADDRLP4 32+8
ADDRLP4 20
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2990
;2988:	//brush models can have tricky origins, so this is our hacky method of getting the center point
;2989:
;2990:	if (goalent->takedamage && testdistance < BOT_MIN_SAGA_GOAL_SHOOT &&
ADDRLP4 20
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1312
ADDRLP4 16
INDIRF4
CNSTF4 1149239296
GEF4 $1312
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 EntityVisibleBox
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $1312
line 2992
;2991:		EntityVisibleBox(bs->origin, mins, maxs, dif, bs->client, goalent->s.number))
;2992:	{
line 2993
;2993:		bs->shootGoal = goalent;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 2994
;2994:		bs->touchGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1840
ADDP4
CNSTP4 0
ASGNP4
line 2995
;2995:	}
ADDRGP4 $1313
JUMPV
LABELV $1312
line 2996
;2996:	else if (goalent->use && testdistance < BOT_MIN_SAGA_GOAL_TRAVEL)
ADDRLP4 20
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1314
ADDRLP4 16
INDIRF4
CNSTF4 1124073472
GEF4 $1314
line 2997
;2997:	{
line 2998
;2998:		bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 2999
;2999:		bs->touchGoal = goalent;
ADDRFP4 0
INDIRP4
CNSTI4 1840
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 3000
;3000:	}
ADDRGP4 $1315
JUMPV
LABELV $1314
line 3002
;3001:	else
;3002:	{ //don't know how to handle this goal object!
line 3003
;3003:		bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3004
;3004:		bs->touchGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1840
ADDP4
CNSTP4 0
ASGNP4
line 3005
;3005:	}
LABELV $1315
LABELV $1313
line 3007
;3006:
;3007:	if (BotGetWeaponRange(bs) == BWEAPONRANGE_MELEE ||
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 1
EQI4 $1318
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 4
NEI4 $1316
LABELV $1318
line 3009
;3008:		BotGetWeaponRange(bs) == BWEAPONRANGE_SABER)
;3009:	{
line 3010
;3010:		bs->shootGoal = NULL; //too risky
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3011
;3011:	}
LABELV $1316
line 3013
;3012:
;3013:	if (bs->touchGoal)
ADDRFP4 0
INDIRP4
CNSTI4 1840
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1319
line 3014
;3014:	{
line 3016
;3015:		//G_Printf("Please, master, let me touch it!\n");
;3016:		VectorCopy(dif, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 32
INDIRB
ASGNB 12
line 3017
;3017:	}
LABELV $1319
line 3019
;3018:
;3019:	return 1;
CNSTI4 1
RETI4
LABELV $1284
endproc Saga_TargetClosestObjective 128 24
export Saga_DefendFromAttackers
proc Saga_DefendFromAttackers 72 8
line 3023
;3020:}
;3021:
;3022:void Saga_DefendFromAttackers(bot_state_t *bs)
;3023:{ //this may be a little cheap, but the best way to find our defending point is probably
line 3026
;3024:  //to just find the nearest person on the opposing team since they'll most likely
;3025:  //be on offense in this situation
;3026:	int wpClose = -1;
ADDRLP4 28
CNSTI4 -1
ASGNI4
line 3027
;3027:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3028
;3028:	float testdist = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 3029
;3029:	int bestindex = -1;
ADDRLP4 32
CNSTI4 -1
ASGNI4
line 3030
;3030:	float bestdist = 999999;
ADDRLP4 24
CNSTF4 1232348144
ASGNF4
ADDRGP4 $1323
JUMPV
LABELV $1322
line 3035
;3031:	gentity_t *ent;
;3032:	vec3_t a;
;3033:
;3034:	while (i < MAX_CLIENTS)
;3035:	{
line 3036
;3036:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3038
;3037:
;3038:		if (ent && ent->client && g_entities[bs->client].client && ent->client->sess.sessionTeam != g_entities[bs->client].client->sess.sessionTeam &&
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $1325
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $1325
ADDRLP4 48
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $1325
ADDRLP4 52
CNSTI4 43440
ASGNI4
ADDRLP4 56
ADDRLP4 44
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 48
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRI4
EQI4 $1325
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1325
ADDRLP4 56
INDIRI4
CNSTI4 3
EQI4 $1325
line 3040
;3039:			ent->health > 0 && ent->client->sess.sessionTeam != TEAM_SPECTATOR)
;3040:		{
line 3041
;3041:			VectorSubtract(ent->client->ps.origin, bs->origin, a);
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 60
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 60
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3043
;3042:
;3043:			testdist = VectorLength(a);
ADDRLP4 8
ARGP4
ADDRLP4 68
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 68
INDIRF4
ASGNF4
line 3045
;3044:
;3045:			if (testdist < bestdist)
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
GEF4 $1331
line 3046
;3046:			{
line 3047
;3047:				bestindex = i;
ADDRLP4 32
ADDRLP4 4
INDIRI4
ASGNI4
line 3048
;3048:				bestdist = testdist;
ADDRLP4 24
ADDRLP4 20
INDIRF4
ASGNF4
line 3049
;3049:			}
LABELV $1331
line 3050
;3050:		}
LABELV $1325
line 3052
;3051:
;3052:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3053
;3053:	}
LABELV $1323
line 3034
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1322
line 3055
;3054:
;3055:	if (bestindex == -1)
ADDRLP4 32
INDIRI4
CNSTI4 -1
NEI4 $1333
line 3056
;3056:	{
line 3057
;3057:		return;
ADDRGP4 $1321
JUMPV
LABELV $1333
line 3060
;3058:	}
;3059:
;3060:	wpClose = GetNearestVisibleWP(g_entities[bestindex].client->ps.origin, -1);	
CNSTI4 2352
ADDRLP4 32
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 36
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 36
INDIRI4
ASGNI4
line 3062
;3061:
;3062:	if (wpClose != -1 && gWPArray[wpClose] && gWPArray[wpClose]->inuse)
ADDRLP4 28
INDIRI4
CNSTI4 -1
EQI4 $1336
ADDRLP4 44
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1336
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1336
line 3063
;3063:	{
line 3064
;3064:		bs->wpDestination = gWPArray[wpClose];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3065
;3065:		bs->destinationGrabTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 3066
;3066:	}
LABELV $1336
line 3067
;3067:}
LABELV $1321
endproc Saga_DefendFromAttackers 72 8
export Saga_CountDefenders
proc Saga_CountDefenders 28 0
line 3070
;3068:
;3069:int Saga_CountDefenders(bot_state_t *bs)
;3070:{
line 3071
;3071:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3072
;3072:	int num = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $1341
JUMPV
LABELV $1340
line 3077
;3073:	gentity_t *ent;
;3074:	bot_state_t *bot;
;3075:
;3076:	while (i < MAX_CLIENTS)
;3077:	{
line 3078
;3078:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3079
;3079:		bot = botstates[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 3081
;3080:
;3081:		if (ent && ent->client && bot && g_entities[bs->client].client)
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $1343
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $1343
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $1343
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $1343
line 3082
;3082:		{
line 3083
;3083:			if (bot->sagaState == SAGASTATE_DEFENDER &&
ADDRLP4 8
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1346
ADDRLP4 24
CNSTI4 43440
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
NEI4 $1346
line 3085
;3084:				ent->client->sess.sessionTeam == g_entities[bs->client].client->sess.sessionTeam)
;3085:			{
line 3086
;3086:				num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3087
;3087:			}
LABELV $1346
line 3088
;3088:		}
LABELV $1343
line 3090
;3089:
;3090:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3091
;3091:	}
LABELV $1341
line 3076
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1340
line 3093
;3092:
;3093:	return num;
ADDRLP4 12
INDIRI4
RETI4
LABELV $1339
endproc Saga_CountDefenders 28 0
export Saga_CountTeammates
proc Saga_CountTeammates 24 0
line 3097
;3094:}
;3095:
;3096:int Saga_CountTeammates(bot_state_t *bs)
;3097:{
line 3098
;3098:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3099
;3099:	int num = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1351
JUMPV
LABELV $1350
line 3103
;3100:	gentity_t *ent;
;3101:
;3102:	while (i < MAX_CLIENTS)
;3103:	{
line 3104
;3104:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3106
;3105:
;3106:		if (ent && ent->client && g_entities[bs->client].client)
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $1353
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $1353
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $1353
line 3107
;3107:		{
line 3108
;3108:			if (ent->client->sess.sessionTeam == g_entities[bs->client].client->sess.sessionTeam)
ADDRLP4 20
CNSTI4 43440
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
NEI4 $1356
line 3109
;3109:			{
line 3110
;3110:				num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3111
;3111:			}
LABELV $1356
line 3112
;3112:		}
LABELV $1353
line 3114
;3113:
;3114:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3115
;3115:	}
LABELV $1351
line 3102
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1350
line 3117
;3116:
;3117:	return num;
ADDRLP4 8
INDIRI4
RETI4
LABELV $1349
endproc Saga_CountTeammates 24 0
export SagaTakesPriority
proc SagaTakesPriority 1164 28
line 3121
;3118:}
;3119:
;3120:int SagaTakesPriority(bot_state_t *bs)
;3121:{
line 3127
;3122:	int attacker;
;3123:	// int flagForDefendableObjective;
;3124:	int flagForAttackableObjective;
;3125:	int defenders, teammates;
;3126:	int idleWP;
;3127:	wpobject_t *dest_sw = NULL;
ADDRLP4 20
CNSTP4 0
ASGNP4
line 3128
;3128:	int dosw = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3133
;3129:	gclient_t *bcl;
;3130:	vec3_t dif;
;3131:	trace_t tr;
;3132:
;3133:	if (g_gametype.integer != GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $1360
line 3134
;3134:	{
line 3135
;3135:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1359
JUMPV
LABELV $1360
line 3138
;3136:	}
;3137:
;3138:	bcl = g_entities[bs->client].client;
ADDRLP4 0
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ASGNP4
line 3140
;3139:
;3140:	if (!bcl)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1364
line 3141
;3141:	{
line 3142
;3142:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1359
JUMPV
LABELV $1364
line 3145
;3143:	}
;3144:
;3145:	if (bs->cur_ps.weapon == WP_BRYAR_PISTOL &&
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1366
ADDRGP4 level+36
INDIRI4
ADDRLP4 1124
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $1366
line 3147
;3146:		(level.time - bs->lastDeadTime) < BOT_MAX_WEAPON_GATHER_TIME)
;3147:	{ //get the nearest weapon laying around base before heading off for battle
line 3148
;3148:		idleWP = GetBestIdleGoal(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1128
ADDRGP4 GetBestIdleGoal
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1128
INDIRI4
ASGNI4
line 3150
;3149:
;3150:		if (idleWP != -1 && gWPArray[idleWP] && gWPArray[idleWP]->inuse)
ADDRLP4 1132
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 -1
EQI4 $1367
ADDRLP4 1136
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1367
ADDRLP4 1136
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1367
line 3151
;3151:		{
line 3152
;3152:			if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1371
line 3153
;3153:			{
line 3154
;3154:				bs->wpDestination = gWPArray[idleWP];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3155
;3155:			}
LABELV $1371
line 3156
;3156:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1359
JUMPV
line 3158
;3157:		}
;3158:	}
LABELV $1366
line 3159
;3159:	else if (bs->cur_ps.weapon == WP_BRYAR_PISTOL &&
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1374
ADDRGP4 level+36
INDIRI4
ADDRLP4 1128
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
SUBI4
CNSTI4 15000
GEI4 $1374
ADDRLP4 1132
ADDRLP4 1128
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1374
ADDRLP4 1132
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1374
line 3162
;3160:		(level.time - bs->lastDeadTime) < BOT_MAX_WEAPON_CHASE_TIME &&
;3161:		bs->wpDestination && bs->wpDestination->weight)
;3162:	{
line 3163
;3163:		dest_sw = bs->wpDestination;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
line 3164
;3164:		dosw = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3165
;3165:	}
LABELV $1374
LABELV $1367
line 3167
;3166:
;3167:	if (bcl->sess.sessionTeam == SAGATEAM_IMPERIAL)
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1377
line 3168
;3168:	{
line 3169
;3169:		attacker = imperial_attackers;
ADDRLP4 12
ADDRGP4 imperial_attackers
INDIRI4
ASGNI4
line 3171
;3170:		// flagForDefendableObjective = WPFLAG_SAGA_REBELOBJ;
;3171:		flagForAttackableObjective = WPFLAG_SAGA_IMPERIALOBJ;
ADDRLP4 16
CNSTI4 1048576
ASGNI4
line 3172
;3172:	}
ADDRGP4 $1378
JUMPV
LABELV $1377
line 3174
;3173:	else
;3174:	{
line 3175
;3175:		attacker = rebel_attackers;
ADDRLP4 12
ADDRGP4 rebel_attackers
INDIRI4
ASGNI4
line 3177
;3176:		// flagForDefendableObjective = WPFLAG_SAGA_IMPERIALOBJ;
;3177:		flagForAttackableObjective = WPFLAG_SAGA_REBELOBJ;
ADDRLP4 16
CNSTI4 524288
ASGNI4
line 3178
;3178:	}
LABELV $1378
line 3180
;3179:
;3180:	if (attacker)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1379
line 3181
;3181:	{
line 3182
;3182:		bs->sagaState = SAGASTATE_ATTACKER;
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
CNSTI4 1
ASGNI4
line 3183
;3183:	}
ADDRGP4 $1380
JUMPV
LABELV $1379
line 3185
;3184:	else
;3185:	{
line 3186
;3186:		bs->sagaState = SAGASTATE_DEFENDER;
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
CNSTI4 2
ASGNI4
line 3187
;3187:		defenders = Saga_CountDefenders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1136
ADDRGP4 Saga_CountDefenders
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 1136
INDIRI4
ASGNI4
line 3188
;3188:		teammates = Saga_CountTeammates(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 Saga_CountTeammates
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 1140
INDIRI4
ASGNI4
line 3190
;3189:
;3190:		if (defenders > teammates/3 && teammates > 1)
ADDRLP4 1144
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 1144
INDIRI4
CNSTI4 3
DIVI4
LEI4 $1381
ADDRLP4 1144
INDIRI4
CNSTI4 1
LEI4 $1381
line 3191
;3191:		{ //devote around 1/4 of our team to completing our own side goals even if we're a defender.
line 3193
;3192:		  //If we have no side goals we will realize that later on and join the defenders
;3193:			bs->sagaState = SAGASTATE_ATTACKER;
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
CNSTI4 1
ASGNI4
line 3194
;3194:		}
LABELV $1381
line 3195
;3195:	}
LABELV $1380
line 3197
;3196:
;3197:	if (bs->state_Forced)
ADDRFP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1383
line 3198
;3198:	{
line 3199
;3199:		bs->sagaState = bs->state_Forced;
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 2692
ADDP4
ADDRLP4 1136
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ASGNI4
line 3200
;3200:	}
LABELV $1383
line 3202
;3201:
;3202:	if (bs->sagaState == SAGASTATE_ATTACKER)
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1385
line 3203
;3203:	{
line 3204
;3204:		if (!Saga_TargetClosestObjective(bs, flagForAttackableObjective))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 1136
ADDRGP4 Saga_TargetClosestObjective
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $1386
line 3205
;3205:		{ //looks like we have no goals other than to keep the other team from completing objectives
line 3206
;3206:			Saga_DefendFromAttackers(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Saga_DefendFromAttackers
CALLV
pop
line 3207
;3207:			if (bs->shootGoal)
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1386
line 3208
;3208:			{
line 3209
;3209:				dif[0] = (bs->shootGoal->r.absmax[0]+bs->shootGoal->r.absmin[0])/2;
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1140
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3210
;3210:				dif[1] = (bs->shootGoal->r.absmax[1]+bs->shootGoal->r.absmin[1])/2;
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+4
ADDRLP4 1144
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 1144
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3211
;3211:				dif[2] = (bs->shootGoal->r.absmax[2]+bs->shootGoal->r.absmin[2])/2;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+8
ADDRLP4 1148
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 1148
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3213
;3212:				
;3213:				if (!trap_InPVS(bs->origin, dif))
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1152
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1393
line 3214
;3214:				{
line 3215
;3215:					bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3216
;3216:				}
ADDRGP4 $1386
JUMPV
LABELV $1393
line 3218
;3217:				else
;3218:				{
line 3219
;3219:					JP_Trace(&tr, bs->origin, NULL, NULL, dif, bs->client, MASK_SOLID);
ADDRLP4 44
ARGP4
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1160
CNSTP4 0
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1156
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3221
;3220:
;3221:					if (tr.fraction != 1 && tr.entityNum != bs->shootGoal->s.number)
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
EQF4 $1386
ADDRLP4 44+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
INDIRI4
EQI4 $1386
line 3222
;3222:					{
line 3223
;3223:						bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3224
;3224:					}
line 3225
;3225:				}
line 3226
;3226:			}
line 3227
;3227:		}
line 3228
;3228:	}
ADDRGP4 $1386
JUMPV
LABELV $1385
line 3229
;3229:	else if (bs->sagaState == SAGASTATE_DEFENDER)
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1399
line 3230
;3230:	{
line 3231
;3231:		Saga_DefendFromAttackers(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Saga_DefendFromAttackers
CALLV
pop
line 3232
;3232:		if (bs->shootGoal)
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1400
line 3233
;3233:		{
line 3234
;3234:			dif[0] = (bs->shootGoal->r.absmax[0]+bs->shootGoal->r.absmin[0])/2;
ADDRLP4 1136
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1136
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 1136
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3235
;3235:			dif[1] = (bs->shootGoal->r.absmax[1]+bs->shootGoal->r.absmin[1])/2;
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+4
ADDRLP4 1140
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3236
;3236:			dif[2] = (bs->shootGoal->r.absmax[2]+bs->shootGoal->r.absmin[2])/2;
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+8
ADDRLP4 1144
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 1144
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3238
;3237:				
;3238:			if (!trap_InPVS(bs->origin, dif))
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1148
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $1405
line 3239
;3239:			{
line 3240
;3240:				bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3241
;3241:			}
ADDRGP4 $1400
JUMPV
LABELV $1405
line 3243
;3242:			else
;3243:			{
line 3244
;3244:				JP_Trace(&tr, bs->origin, NULL, NULL, dif, bs->client, MASK_SOLID);
ADDRLP4 44
ARGP4
ADDRLP4 1152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1156
CNSTP4 0
ASGNP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1152
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3246
;3245:
;3246:				if (tr.fraction != 1 && tr.entityNum != bs->shootGoal->s.number)
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
EQF4 $1400
ADDRLP4 44+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
INDIRI4
EQI4 $1400
line 3247
;3247:				{
line 3248
;3248:					bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3249
;3249:				}
line 3250
;3250:			}
line 3251
;3251:		}
line 3252
;3252:	}
ADDRGP4 $1400
JUMPV
LABELV $1399
line 3254
;3253:	else
;3254:	{ //get busy!
line 3255
;3255:		Saga_TargetClosestObjective(bs, flagForAttackableObjective);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 Saga_TargetClosestObjective
CALLI4
pop
line 3256
;3256:		if (bs->shootGoal)
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1411
line 3257
;3257:		{
line 3258
;3258:			dif[0] = (bs->shootGoal->r.absmax[0]+bs->shootGoal->r.absmin[0])/2;
ADDRLP4 1136
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1136
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 1136
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3259
;3259:			dif[1] = (bs->shootGoal->r.absmax[1]+bs->shootGoal->r.absmin[1])/2;
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+4
ADDRLP4 1140
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3260
;3260:			dif[2] = (bs->shootGoal->r.absmax[2]+bs->shootGoal->r.absmin[2])/2;
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24+8
ADDRLP4 1144
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 1144
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3262
;3261:				
;3262:			if (!trap_InPVS(bs->origin, dif))
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1148
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $1415
line 3263
;3263:			{
line 3264
;3264:				bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3265
;3265:			}
ADDRGP4 $1416
JUMPV
LABELV $1415
line 3267
;3266:			else
;3267:			{
line 3268
;3268:				JP_Trace(&tr, bs->origin, NULL, NULL, dif, bs->client, MASK_SOLID);
ADDRLP4 44
ARGP4
ADDRLP4 1152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1156
CNSTP4 0
ASGNP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 1152
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3270
;3269:
;3270:				if (tr.fraction != 1 && tr.entityNum != bs->shootGoal->s.number)
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
EQF4 $1417
ADDRLP4 44+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
INDIRI4
EQI4 $1417
line 3271
;3271:				{
line 3272
;3272:					bs->shootGoal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
CNSTP4 0
ASGNP4
line 3273
;3273:				}
LABELV $1417
line 3274
;3274:			}
LABELV $1416
line 3275
;3275:		}
LABELV $1411
line 3276
;3276:	}
LABELV $1400
LABELV $1386
line 3278
;3277:
;3278:	if (dosw)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1421
line 3279
;3279:	{ //allow saga objective code to run, but if after a particular item then keep going after it
line 3280
;3280:		bs->wpDestination = dest_sw;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
line 3281
;3281:	}
LABELV $1421
line 3283
;3282:
;3283:	return 1;
CNSTI4 1
RETI4
LABELV $1359
endproc SagaTakesPriority 1164 28
export JMTakesPriority
proc JMTakesPriority 24 8
line 3287
;3284:}
;3285:
;3286:int JMTakesPriority(bot_state_t *bs)
;3287:{
line 3288
;3288:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3289
;3289:	int wpClose = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 3290
;3290:	gentity_t *theImportantEntity = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 3292
;3291:
;3292:	if (g_gametype.integer != GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $1424
line 3293
;3293:	{
line 3294
;3294:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1423
JUMPV
LABELV $1424
line 3297
;3295:	}
;3296:
;3297:	if (bs->cur_ps.isJediMaster)
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1427
line 3298
;3298:	{
line 3299
;3299:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1423
JUMPV
LABELV $1427
line 3304
;3300:	}
;3301:
;3302:	//jmState becomes the index for the one who carries the saber. If jmState is -1 then the saber is currently
;3303:	//without an owner
;3304:	bs->jmState = -1;
ADDRFP4 0
INDIRP4
CNSTI4 2700
ADDP4
CNSTI4 -1
ASGNI4
ADDRGP4 $1430
JUMPV
LABELV $1429
line 3307
;3305:
;3306:	while (i < MAX_CLIENTS)
;3307:	{
line 3308
;3308:		if (g_entities[i].client && g_entities[i].inuse &&
ADDRLP4 12
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1432
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1432
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1432
line 3310
;3309:			g_entities[i].client->ps.isJediMaster)
;3310:		{
line 3311
;3311:			bs->jmState = i;
ADDRFP4 0
INDIRP4
CNSTI4 2700
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 3312
;3312:			break;
ADDRGP4 $1431
JUMPV
LABELV $1432
line 3315
;3313:		}
;3314:
;3315:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3316
;3316:	}
LABELV $1430
line 3306
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1429
LABELV $1431
line 3318
;3317:
;3318:	if (bs->jmState != -1)
ADDRFP4 0
INDIRP4
CNSTI4 2700
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1437
line 3319
;3319:	{
line 3320
;3320:		theImportantEntity = &g_entities[bs->jmState];
ADDRLP4 4
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 2700
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3321
;3321:	}
ADDRGP4 $1438
JUMPV
LABELV $1437
line 3323
;3322:	else
;3323:	{
line 3324
;3324:		theImportantEntity = gJMSaberEnt;
ADDRLP4 4
ADDRGP4 gJMSaberEnt
INDIRP4
ASGNP4
line 3325
;3325:	}
LABELV $1438
line 3327
;3326:
;3327:	if (theImportantEntity && theImportantEntity->inuse && bs->destinationGrabTime < level.time)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1439
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1439
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1439
line 3328
;3328:	{
line 3329
;3329:		if (theImportantEntity->client)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1442
line 3330
;3330:		{
line 3331
;3331:			wpClose = GetNearestVisibleWP(theImportantEntity->client->ps.origin, theImportantEntity->s.number);	
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 3332
;3332:		}
ADDRGP4 $1443
JUMPV
LABELV $1442
line 3334
;3333:		else
;3334:		{
line 3335
;3335:			wpClose = GetNearestVisibleWP(theImportantEntity->r.currentOrigin, theImportantEntity->s.number);	
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 3336
;3336:		}
LABELV $1443
line 3338
;3337:
;3338:		if (wpClose != -1 && gWPArray[wpClose] && gWPArray[wpClose]->inuse)
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $1444
ADDRLP4 20
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1444
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1444
line 3339
;3339:		{
line 3352
;3340:			/*
;3341:			Com_Printf("BOT GRABBED IDEAL JM LOCATION\n");
;3342:			if (bs->wpDestination != gWPArray[wpClose])
;3343:			{
;3344:				Com_Printf("IDEAL WAS NOT ALREADY IDEAL\n");
;3345:
;3346:				if (!bs->wpDestination)
;3347:				{
;3348:					Com_Printf("IDEAL WAS NULL\n");
;3349:				}
;3350:			}
;3351:			*/
;3352:			bs->wpDestination = gWPArray[wpClose];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3353
;3353:			bs->destinationGrabTime = level.time + 4000;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 3354
;3354:		}
LABELV $1444
line 3355
;3355:	}
LABELV $1439
line 3357
;3356:
;3357:	return 1;
CNSTI4 1
RETI4
LABELV $1423
endproc JMTakesPriority 24 8
export BotHasAssociated
proc BotHasAssociated 12 0
line 3361
;3358:}
;3359:
;3360:int BotHasAssociated(bot_state_t *bs, wpobject_t *wp)
;3361:{
line 3364
;3362:	gentity_t *as;
;3363:
;3364:	if (wp->associated_entity == ENTITYNUM_NONE)
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1448
line 3365
;3365:	{ //make it think this is an item we have so we don't go after nothing
line 3366
;3366:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1447
JUMPV
LABELV $1448
line 3369
;3367:	}
;3368:
;3369:	as = &g_entities[wp->associated_entity];
ADDRLP4 0
CNSTI4 2352
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3371
;3370:
;3371:	if (!as || !as->item)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $1452
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $1450
LABELV $1452
line 3372
;3372:	{
line 3373
;3373:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1447
JUMPV
LABELV $1450
line 3376
;3374:	}
;3375:
;3376:	if (as->item->giType == IT_WEAPON)
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1453
line 3377
;3377:	{
line 3378
;3378:		if (bs->cur_ps.stats[STAT_WEAPONS] & (1 << as->item->giTag))
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1455
line 3379
;3379:		{
line 3380
;3380:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1447
JUMPV
LABELV $1455
line 3383
;3381:		}
;3382:
;3383:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1447
JUMPV
LABELV $1453
line 3385
;3384:	}
;3385:	else if (as->item->giType == IT_HOLDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $1457
line 3386
;3386:	{
line 3387
;3387:		if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << as->item->giTag))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1459
line 3388
;3388:		{
line 3389
;3389:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1447
JUMPV
LABELV $1459
line 3392
;3390:		}
;3391:
;3392:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1447
JUMPV
LABELV $1457
line 3394
;3393:	}
;3394:	else if (as->item->giType == IT_POWERUP)
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1461
line 3395
;3395:	{
line 3396
;3396:		if (bs->cur_ps.powerups[as->item->giTag])
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 360
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1463
line 3397
;3397:		{
line 3398
;3398:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1447
JUMPV
LABELV $1463
line 3401
;3399:		}
;3400:
;3401:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1447
JUMPV
LABELV $1461
line 3403
;3402:	}
;3403:	else if (as->item->giType == IT_AMMO)
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1465
line 3404
;3404:	{
line 3405
;3405:		if (bs->cur_ps.ammo[as->item->giTag] > 10) //hack
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
CNSTI4 10
LEI4 $1467
line 3406
;3406:		{
line 3407
;3407:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1447
JUMPV
LABELV $1467
line 3410
;3408:		}
;3409:
;3410:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1447
JUMPV
LABELV $1465
line 3413
;3411:	}
;3412:
;3413:	return 0;
CNSTI4 0
RETI4
LABELV $1447
endproc BotHasAssociated 12 0
export GetBestIdleGoal
proc GetBestIdleGoal 40 20
line 3417
;3414:}
;3415:
;3416:int GetBestIdleGoal(bot_state_t *bs)
;3417:{
line 3418
;3418:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3419
;3419:	int highestweight = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3420
;3420:	int desiredindex = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 3421
;3421:	int dist_to_weight = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 3424
;3422:	int traildist;
;3423:
;3424:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1470
line 3425
;3425:	{
line 3426
;3426:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $1469
JUMPV
LABELV $1470
line 3429
;3427:	}
;3428:
;3429:	if (bs->isCamper != 2)
ADDRFP4 0
INDIRP4
CNSTI4 2060
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1472
line 3430
;3430:	{
line 3431
;3431:		if (bs->randomNavTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2080
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1474
line 3432
;3432:		{
line 3433
;3433:			if (Q_irand(1, 10, qfalse, 5) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
GEI4 $1477
line 3434
;3434:			{
line 3435
;3435:				bs->randomNav = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2084
ADDP4
CNSTI4 1
ASGNI4
line 3436
;3436:			}
ADDRGP4 $1478
JUMPV
LABELV $1477
line 3438
;3437:			else
;3438:			{
line 3439
;3439:				bs->randomNav = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2084
ADDP4
CNSTI4 0
ASGNI4
line 3440
;3440:			}
LABELV $1478
line 3442
;3441:			
;3442:			bs->randomNavTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 5000, 15000, qfalse, 10000);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 5000
ARGI4
CNSTI4 15000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 10000
ARGI4
ADDRLP4 24
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2080
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
line 3443
;3443:		}
LABELV $1474
line 3444
;3444:	}
LABELV $1472
line 3446
;3445:
;3446:	if (bs->randomNav)
ADDRFP4 0
INDIRP4
CNSTI4 2084
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1483
line 3447
;3447:	{ //stop looking for items and/or camping on them
line 3448
;3448:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $1469
JUMPV
LABELV $1482
line 3452
;3449:	}
;3450:
;3451:	while (i < gWPNum)
;3452:	{
line 3453
;3453:		if (gWPArray[i] &&
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1485
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1485
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $1485
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
LEF4 $1485
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 BotHasAssociated
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1485
line 3458
;3454:			gWPArray[i]->inuse &&
;3455:			(gWPArray[i]->flags & WPFLAG_GOALPOINT) &&
;3456:			gWPArray[i]->weight > highestweight &&
;3457:			!BotHasAssociated(bs, gWPArray[i]))
;3458:		{
line 3459
;3459:			traildist = TotalTrailDistance(bs->wpCurrent->index, i, bs);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 3461
;3460:
;3461:			if (traildist != -1)
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $1487
line 3462
;3462:			{
line 3463
;3463:				dist_to_weight = (int)traildist/10000;
ADDRLP4 12
ADDRLP4 8
INDIRI4
CNSTI4 10000
DIVI4
ASGNI4
line 3464
;3464:				dist_to_weight = (gWPArray[i]->weight)-dist_to_weight;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 3466
;3465:
;3466:				if (dist_to_weight > highestweight)
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $1489
line 3467
;3467:				{
line 3468
;3468:					highestweight = dist_to_weight;
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 3469
;3469:					desiredindex = i;
ADDRLP4 16
ADDRLP4 0
INDIRI4
ASGNI4
line 3470
;3470:				}
LABELV $1489
line 3471
;3471:			}
LABELV $1487
line 3472
;3472:		}
LABELV $1485
line 3474
;3473:
;3474:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3475
;3475:	}
LABELV $1483
line 3451
ADDRLP4 0
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $1482
line 3477
;3476:
;3477:	return desiredindex;
ADDRLP4 16
INDIRI4
RETI4
LABELV $1469
endproc GetBestIdleGoal 40 20
export GetIdealDestination
proc GetIdealDestination 152 20
line 3481
;3478:}
;3479:
;3480:void GetIdealDestination(bot_state_t *bs)
;3481:{
line 3496
;3482:	int tempInt, cWPIndex, bChicken, idleWP;
;3483:	float distChange, plusLen, minusLen;
;3484:	vec3_t usethisvec, a;
;3485:	gentity_t *badthing;
;3486:
;3487:#ifdef _DEBUG
;3488:	trap_Cvar_Update(&bot_nogoals);
;3489:
;3490:	if (bot_nogoals.integer)
;3491:	{
;3492:		return;
;3493:	}
;3494:#endif
;3495:
;3496:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1492
line 3497
;3497:	{
line 3498
;3498:		return;
ADDRGP4 $1491
JUMPV
LABELV $1492
line 3501
;3499:	}
;3500:
;3501:	if ((level.time - bs->escapeDirTime) > 4000)
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRFP4 0
INDIRP4
CNSTI4 2268
ADDP4
INDIRF4
SUBF4
CNSTF4 1165623296
LEF4 $1494
line 3502
;3502:	{
line 3503
;3503:		badthing = GetNearestBadThing(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 GetNearestBadThing
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
ASGNP4
line 3504
;3504:	}
ADDRGP4 $1495
JUMPV
LABELV $1494
line 3506
;3505:	else
;3506:	{
line 3507
;3507:		badthing = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 3508
;3508:	}
LABELV $1495
line 3510
;3509:
;3510:	if (badthing && badthing->inuse &&
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1497
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1497
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
LEI4 $1497
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1497
line 3512
;3511:		badthing->health > 0 && badthing->takedamage)
;3512:	{
line 3513
;3513:		bs->dangerousObject = badthing;
ADDRFP4 0
INDIRP4
CNSTI4 1848
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3514
;3514:	}
ADDRGP4 $1498
JUMPV
LABELV $1497
line 3516
;3515:	else
;3516:	{
line 3517
;3517:		bs->dangerousObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1848
ADDP4
CNSTP4 0
ASGNP4
line 3518
;3518:	}
LABELV $1498
line 3520
;3519:
;3520:	if (!badthing && bs->wpDestIgnoreTime > level.time)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1499
ADDRFP4 0
INDIRP4
CNSTI4 1988
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $1499
line 3521
;3521:	{
line 3522
;3522:		return;
ADDRGP4 $1491
JUMPV
LABELV $1499
line 3525
;3523:	}
;3524:
;3525:	if (!badthing && bs->dontGoBack > level.time)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1502
ADDRFP4 0
INDIRP4
CNSTI4 2272
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $1502
line 3526
;3526:	{
line 3527
;3527:		if (bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1505
line 3528
;3528:		{
line 3529
;3529:			bs->wpStoreDest = bs->wpDestination;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 1892
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
line 3530
;3530:		}
LABELV $1505
line 3531
;3531:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 3532
;3532:		return;
ADDRGP4 $1491
JUMPV
LABELV $1502
line 3534
;3533:	}
;3534:	else if (!badthing && bs->wpStoreDest)
ADDRLP4 64
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
NEU4 $1507
ADDRFP4 0
INDIRP4
CNSTI4 1892
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $1507
line 3535
;3535:	{ //after we finish running away, switch back to our original destination
line 3536
;3536:		bs->wpDestination = bs->wpStoreDest;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 1892
ADDP4
INDIRP4
ASGNP4
line 3537
;3537:		bs->wpStoreDest = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1892
ADDP4
CNSTP4 0
ASGNP4
line 3538
;3538:	}
LABELV $1507
line 3540
;3539:
;3540:	if (badthing && bs->wpCamping)
ADDRLP4 68
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1509
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $1509
line 3541
;3541:	{
line 3542
;3542:		bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 3543
;3543:	}
LABELV $1509
line 3545
;3544:
;3545:	if (bs->wpCamping)
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1511
line 3546
;3546:	{
line 3547
;3547:		bs->wpDestination = bs->wpCamping;
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
ASGNP4
line 3548
;3548:		return;
ADDRGP4 $1491
JUMPV
LABELV $1511
line 3551
;3549:	}
;3550:
;3551:	if (!badthing && CTFTakesPriority(bs))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1513
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 CTFTakesPriority
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $1513
line 3552
;3552:	{
line 3553
;3553:		if (bs->ctfState)
ADDRFP4 0
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1491
line 3554
;3554:		{
line 3555
;3555:			bs->runningToEscapeThreat = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
CNSTI4 1
ASGNI4
line 3556
;3556:		}
line 3557
;3557:		return;
ADDRGP4 $1491
JUMPV
LABELV $1513
line 3559
;3558:	}
;3559:	else if (!badthing && SagaTakesPriority(bs))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1517
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 SagaTakesPriority
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $1517
line 3560
;3560:	{
line 3561
;3561:		if (bs->sagaState)
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1491
line 3562
;3562:		{
line 3563
;3563:			bs->runningToEscapeThreat = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
CNSTI4 1
ASGNI4
line 3564
;3564:		}
line 3565
;3565:		return;
ADDRGP4 $1491
JUMPV
LABELV $1517
line 3567
;3566:	}
;3567:	else if (!badthing && JMTakesPriority(bs))
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1521
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 JMTakesPriority
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $1521
line 3568
;3568:	{
line 3569
;3569:		bs->runningToEscapeThreat = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
CNSTI4 1
ASGNI4
line 3570
;3570:	}
LABELV $1521
line 3572
;3571:
;3572:	if (badthing)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1523
line 3573
;3573:	{
line 3574
;3574:		bs->runningLikeASissy = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2308
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3576
;3575:
;3576:		if (bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1526
line 3577
;3577:		{
line 3578
;3578:			bs->wpStoreDest = bs->wpDestination;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 1892
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ASGNP4
line 3579
;3579:		}
LABELV $1526
line 3580
;3580:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 3582
;3581:
;3582:		if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1528
line 3583
;3583:		{
line 3584
;3584:			tempInt = bs->wpCurrent->index+1;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3585
;3585:		}
ADDRGP4 $1529
JUMPV
LABELV $1528
line 3587
;3586:		else
;3587:		{
line 3588
;3588:			tempInt = bs->wpCurrent->index-1;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3589
;3589:		}
LABELV $1529
line 3591
;3590:
;3591:		if (gWPArray[tempInt] && gWPArray[tempInt]->inuse && bs->escapeDirTime < level.time)
ADDRLP4 84
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1491
ADDRLP4 84
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1491
ADDRFP4 0
INDIRP4
CNSTI4 2268
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1491
line 3592
;3592:		{
line 3593
;3593:			VectorSubtract(badthing->s.pos.trBase, bs->wpCurrent->origin, a);
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3594
;3594:			plusLen = VectorLength(a);
ADDRLP4 12
ARGP4
ADDRLP4 96
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 96
INDIRF4
ASGNF4
line 3595
;3595:			VectorSubtract(badthing->s.pos.trBase, gWPArray[tempInt]->origin, a);
ADDRLP4 104
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3596
;3596:			minusLen = VectorLength(a);
ADDRLP4 12
ARGP4
ADDRLP4 108
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 108
INDIRF4
ASGNF4
line 3598
;3597:
;3598:			if (plusLen < minusLen)
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
GEF4 $1491
line 3599
;3599:			{
line 3600
;3600:				if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1539
line 3601
;3601:				{
line 3602
;3602:					bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 3603
;3603:				}
ADDRGP4 $1540
JUMPV
LABELV $1539
line 3605
;3604:				else
;3605:				{
line 3606
;3606:					bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 3607
;3607:				}
LABELV $1540
line 3609
;3608:
;3609:				bs->wpCurrent = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3611
;3610:
;3611:				bs->escapeDirTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 500, 1000, qfalse, 750);//Q_irand(1000, 1400);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 750
ARGI4
ADDRLP4 112
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2268
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 112
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3614
;3612:
;3613:				//G_Printf("Escaping from scary bad thing [%s]\n", badthing->classname);
;3614:			}
line 3615
;3615:		}
line 3617
;3616:		//G_Printf("Run away run away run away!\n");
;3617:		return;
ADDRGP4 $1491
JUMPV
LABELV $1523
line 3620
;3618:	}
;3619:
;3620:	distChange = 0; //keep the compiler from complaining
ADDRLP4 24
CNSTF4 0
ASGNF4
line 3622
;3621:
;3622:	tempInt = BotGetWeaponRange(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 84
INDIRI4
ASGNI4
line 3624
;3623:
;3624:	if (tempInt == BWEAPONRANGE_MELEE)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1542
line 3625
;3625:	{
line 3626
;3626:		distChange = 1;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 3627
;3627:	}
ADDRGP4 $1543
JUMPV
LABELV $1542
line 3628
;3628:	else if (tempInt == BWEAPONRANGE_SABER)
ADDRLP4 4
INDIRI4
CNSTI4 4
NEI4 $1544
line 3629
;3629:	{
line 3630
;3630:		distChange = 1;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 3631
;3631:	}
ADDRGP4 $1545
JUMPV
LABELV $1544
line 3632
;3632:	else if (tempInt == BWEAPONRANGE_MID)
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $1546
line 3633
;3633:	{
line 3634
;3634:		distChange = 128;
ADDRLP4 24
CNSTF4 1124073472
ASGNF4
line 3635
;3635:	}
ADDRGP4 $1547
JUMPV
LABELV $1546
line 3636
;3636:	else if (tempInt == BWEAPONRANGE_LONG)
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $1548
line 3637
;3637:	{
line 3638
;3638:		distChange = 300;
ADDRLP4 24
CNSTF4 1133903872
ASGNF4
line 3639
;3639:	}
LABELV $1548
LABELV $1547
LABELV $1545
LABELV $1543
line 3641
;3640:
;3641:	if (bs->revengeEnemy && bs->revengeEnemy->health > 0 &&
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
CNSTU4 0
ASGNU4
ADDRLP4 88
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $1550
ADDRLP4 88
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1550
ADDRLP4 96
ADDRLP4 88
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $1550
ADDRLP4 96
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1550
line 3643
;3642:		bs->revengeEnemy->client && bs->revengeEnemy->client->pers.connected == CON_CONNECTED)
;3643:	{ //if we hate someone, always try to get to them
line 3644
;3644:		if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1551
line 3645
;3645:		{
line 3646
;3646:			if (bs->revengeEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1555
line 3647
;3647:			{
line 3648
;3648:				VectorCopy(bs->revengeEnemy->client->ps.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3649
;3649:			}
ADDRGP4 $1556
JUMPV
LABELV $1555
line 3651
;3650:			else
;3651:			{
line 3652
;3652:				VectorCopy(bs->revengeEnemy->s.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3653
;3653:			}
LABELV $1556
line 3655
;3654:
;3655:			tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 100
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 100
INDIRI4
ASGNI4
line 3657
;3656:
;3657:			if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $1551
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 112
INDIRF4
CNSTF4 3212836864
EQF4 $1551
line 3658
;3658:			{
line 3659
;3659:				bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3660
;3660:				bs->wpDestSwitchTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 5000, 10000, qfalse, 7500);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 5000
ARGI4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 7500
ARGI4
ADDRLP4 116
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 116
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3661
;3661:			}
line 3662
;3662:		}
line 3663
;3663:	}
ADDRGP4 $1551
JUMPV
LABELV $1550
line 3664
;3664:	else if (bs->squadLeader && bs->squadLeader->health > 0 &&
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
ASGNP4
ADDRLP4 104
CNSTU4 0
ASGNU4
ADDRLP4 100
INDIRP4
CVPU4 4
ADDRLP4 104
INDIRU4
EQU4 $1560
ADDRLP4 100
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1560
ADDRLP4 108
ADDRLP4 100
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CVPU4 4
ADDRLP4 104
INDIRU4
EQU4 $1560
ADDRLP4 108
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1560
line 3666
;3665:		bs->squadLeader->client && bs->squadLeader->client->pers.connected == CON_CONNECTED)
;3666:	{
line 3667
;3667:		if (bs->wpDestSwitchTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1561
line 3668
;3668:		{
line 3669
;3669:			if (bs->squadLeader->client)
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1565
line 3670
;3670:			{
line 3671
;3671:				VectorCopy(bs->squadLeader->client->ps.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3672
;3672:			}
ADDRGP4 $1566
JUMPV
LABELV $1565
line 3674
;3673:			else
;3674:			{
line 3675
;3675:				VectorCopy(bs->squadLeader->s.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3676
;3676:			}
LABELV $1566
line 3678
;3677:
;3678:			tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 112
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 112
INDIRI4
ASGNI4
line 3680
;3679:
;3680:			if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $1561
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 124
INDIRF4
CNSTF4 3212836864
EQF4 $1561
line 3681
;3681:			{
line 3682
;3682:				bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3683
;3683:				bs->wpDestSwitchTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 5000, 10000, qfalse, 7500);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 5000
ARGI4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 7500
ARGI4
ADDRLP4 128
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 128
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3684
;3684:			}
line 3685
;3685:		}
line 3686
;3686:	}
ADDRGP4 $1561
JUMPV
LABELV $1560
line 3687
;3687:	else if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1570
line 3688
;3688:	{
line 3689
;3689:		if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1572
line 3690
;3690:		{
line 3691
;3691:			VectorCopy(bs->currentEnemy->client->ps.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3692
;3692:		}
ADDRGP4 $1573
JUMPV
LABELV $1572
line 3694
;3693:		else
;3694:		{
line 3695
;3695:			VectorCopy(bs->currentEnemy->s.origin, usethisvec);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3696
;3696:		}
LABELV $1573
line 3698
;3697:
;3698:		bChicken = BotIsAChickenWuss(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 BotIsAChickenWuss
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 112
INDIRI4
ASGNI4
line 3699
;3699:		bs->runningToEscapeThreat = bChicken;
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 3701
;3700:
;3701:		if (bs->frame_Enemy_Len < distChange || (bChicken && bChicken != 2))
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
LTF4 $1576
ADDRLP4 116
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $1574
ADDRLP4 116
INDIRI4
CNSTI4 2
EQI4 $1574
LABELV $1576
line 3702
;3702:		{
line 3703
;3703:			cWPIndex = bs->wpCurrent->index;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 3705
;3704:
;3705:			if (bs->frame_Enemy_Len > 400)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1137180672
LEF4 $1577
line 3706
;3706:			{ //good distance away, start running toward a good place for an item or powerup or whatever
line 3707
;3707:				idleWP = GetBestIdleGoal(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 GetBestIdleGoal
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 120
INDIRI4
ASGNI4
line 3709
;3708:
;3709:				if (idleWP != -1 && gWPArray[idleWP] && gWPArray[idleWP]->inuse)
ADDRLP4 124
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 -1
EQI4 $1575
ADDRLP4 128
ADDRLP4 124
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1575
ADDRLP4 128
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1575
line 3710
;3710:				{
line 3711
;3711:					bs->wpDestination = gWPArray[idleWP];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3712
;3712:				}
line 3713
;3713:			}
ADDRGP4 $1575
JUMPV
LABELV $1577
line 3714
;3714:			else if (gWPArray[cWPIndex-1] && gWPArray[cWPIndex-1]->inuse &&
ADDRLP4 120
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 124
CNSTU4 0
ASGNU4
ADDRLP4 120
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 124
INDIRU4
EQU4 $1575
ADDRLP4 128
CNSTI4 12
ASGNI4
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRLP4 120
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
EQI4 $1575
ADDRLP4 120
INDIRI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 124
INDIRU4
EQU4 $1575
ADDRLP4 120
INDIRI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
EQI4 $1575
line 3716
;3715:				gWPArray[cWPIndex+1] && gWPArray[cWPIndex+1]->inuse)
;3716:			{
line 3717
;3717:				VectorSubtract(gWPArray[cWPIndex+1]->origin, usethisvec, a);
ADDRLP4 136
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRLP4 136
INDIRI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 136
INDIRI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 28+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 28+8
INDIRF4
SUBF4
ASGNF4
line 3718
;3718:				plusLen = VectorLength(a);
ADDRLP4 12
ARGP4
ADDRLP4 140
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 140
INDIRF4
ASGNF4
line 3719
;3719:				VectorSubtract(gWPArray[cWPIndex-1]->origin, usethisvec, a);
ADDRLP4 144
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRLP4 144
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 144
INDIRI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 28+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 28+8
INDIRF4
SUBF4
ASGNF4
line 3720
;3720:				minusLen = VectorLength(a);
ADDRLP4 12
ARGP4
ADDRLP4 148
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 148
INDIRF4
ASGNF4
line 3722
;3721:
;3722:				if (minusLen > plusLen)
ADDRLP4 48
INDIRF4
ADDRLP4 44
INDIRF4
LEF4 $1601
line 3723
;3723:				{
line 3724
;3724:					bs->wpDestination = gWPArray[cWPIndex-1];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray-4
ADDP4
INDIRP4
ASGNP4
line 3725
;3725:				}
ADDRGP4 $1575
JUMPV
LABELV $1601
line 3727
;3726:				else
;3727:				{
line 3728
;3728:					bs->wpDestination = gWPArray[cWPIndex+1];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray+4
ADDP4
INDIRP4
ASGNP4
line 3729
;3729:				}
line 3730
;3730:			}
line 3731
;3731:		}
ADDRGP4 $1575
JUMPV
LABELV $1574
line 3732
;3732:		else if (bChicken != 2 && bs->wpDestSwitchTime < level.time)
ADDRLP4 40
INDIRI4
CNSTI4 2
EQI4 $1605
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1605
line 3733
;3733:		{
line 3734
;3734:			tempInt = GetNearestVisibleWP(usethisvec, 0);
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 120
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 120
INDIRI4
ASGNI4
line 3736
;3735:
;3736:			if (tempInt != -1 && TotalTrailDistance(bs->wpCurrent->index, tempInt, bs) != -1)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $1608
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 132
INDIRF4
CNSTF4 3212836864
EQF4 $1608
line 3737
;3737:			{
line 3738
;3738:				bs->wpDestination = gWPArray[tempInt];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3740
;3739:
;3740:				if (g_gametype.integer == GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $1610
line 3741
;3741:				{ //be more aggressive
line 3742
;3742:					bs->wpDestSwitchTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 300, 1000, qfalse, 600);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 300
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 600
ARGI4
ADDRLP4 136
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 136
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3743
;3743:				}
ADDRGP4 $1611
JUMPV
LABELV $1610
line 3745
;3744:				else
;3745:				{
line 3746
;3746:					bs->wpDestSwitchTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 1000, 5000, qfalse, 3000);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 5000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 136
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 136
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 3747
;3747:				}
LABELV $1611
line 3748
;3748:			}
LABELV $1608
line 3749
;3749:		}
LABELV $1605
LABELV $1575
line 3750
;3750:	}
LABELV $1570
LABELV $1561
LABELV $1551
line 3752
;3751:
;3752:	if (!bs->wpDestination && bs->wpDestSwitchTime < level.time)
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1615
ADDRLP4 112
INDIRP4
CNSTI4 1980
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1615
line 3753
;3753:	{
line 3755
;3754:		//G_Printf("I need something to do\n");
;3755:		idleWP = GetBestIdleGoal(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 GetBestIdleGoal
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 116
INDIRI4
ASGNI4
line 3757
;3756:
;3757:		if (idleWP != -1 && gWPArray[idleWP] && gWPArray[idleWP]->inuse)
ADDRLP4 120
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 -1
EQI4 $1618
ADDRLP4 124
ADDRLP4 120
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1618
ADDRLP4 124
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1618
line 3758
;3758:		{
line 3759
;3759:			bs->wpDestination = gWPArray[idleWP];
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 3760
;3760:		}
LABELV $1618
line 3761
;3761:	}
LABELV $1615
line 3762
;3762:}
LABELV $1491
endproc GetIdealDestination 152 20
export CommanderBotCTFAI
proc CommanderBotCTFAI 216 8
line 3765
;3763:
;3764:void CommanderBotCTFAI(bot_state_t *bs)
;3765:{
line 3766
;3766:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3768
;3767:	gentity_t *ent;
;3768:	int squadmates = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 3770
;3769:	gentity_t *squad[MAX_CLIENTS];
;3770:	int defendAttackPriority = 0; //0 == attack, 1 == defend
ADDRLP4 152
CNSTI4 0
ASGNI4
line 3771
;3771:	int guardDefendPriority = 0; //0 == defend, 1 == guard
ADDRLP4 176
CNSTI4 0
ASGNI4
line 3772
;3772:	int attackRetrievePriority = 0; //0 == retrieve, 1 == attack
ADDRLP4 172
CNSTI4 0
ASGNI4
line 3773
;3773:	int myFlag = 0;
ADDRLP4 164
CNSTI4 0
ASGNI4
line 3774
;3774:	int enemyFlag = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 3775
;3775:	int enemyHasOurFlag = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 3776
;3776:	int weHaveEnemyFlag = 0;
ADDRLP4 160
CNSTI4 0
ASGNI4
line 3777
;3777:	int numOnMyTeam = 0;
ADDRLP4 156
CNSTI4 0
ASGNI4
line 3778
;3778:	int numOnEnemyTeam = 0;
ADDRLP4 168
CNSTI4 0
ASGNI4
line 3779
;3779:	int numAttackers = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 3780
;3780:	int numDefenders = 0;
ADDRLP4 180
CNSTI4 0
ASGNI4
line 3782
;3781:
;3782:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1621
line 3783
;3783:	{
line 3784
;3784:		myFlag = PW_REDFLAG;
ADDRLP4 164
CNSTI4 4
ASGNI4
line 3785
;3785:	}
ADDRGP4 $1622
JUMPV
LABELV $1621
line 3787
;3786:	else
;3787:	{
line 3788
;3788:		myFlag = PW_BLUEFLAG;
ADDRLP4 164
CNSTI4 5
ASGNI4
line 3789
;3789:	}
LABELV $1622
line 3791
;3790:
;3791:	if (level.clients[bs->client].sess.sessionTeam == TEAM_RED)
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1623
line 3792
;3792:	{
line 3793
;3793:		enemyFlag = PW_BLUEFLAG;
ADDRLP4 144
CNSTI4 5
ASGNI4
line 3794
;3794:	}
ADDRGP4 $1626
JUMPV
LABELV $1623
line 3796
;3795:	else
;3796:	{
line 3797
;3797:		enemyFlag = PW_REDFLAG;
ADDRLP4 144
CNSTI4 4
ASGNI4
line 3798
;3798:	}
ADDRGP4 $1626
JUMPV
LABELV $1625
line 3801
;3799:
;3800:	while (i < MAX_CLIENTS)
;3801:	{
line 3802
;3802:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3804
;3803:
;3804:		if (ent && ent->client)
ADDRLP4 188
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1628
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1628
line 3805
;3805:		{
line 3806
;3806:			if (ent->client->ps.powerups[enemyFlag] && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 144
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
CNSTI4 0
EQI4 $1630
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $1630
line 3807
;3807:			{
line 3808
;3808:				weHaveEnemyFlag = 1;
ADDRLP4 160
CNSTI4 1
ASGNI4
line 3809
;3809:			}
ADDRGP4 $1631
JUMPV
LABELV $1630
line 3810
;3810:			else if (ent->client->ps.powerups[myFlag] && !OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 164
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
CNSTI4 0
EQI4 $1632
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
NEI4 $1632
line 3811
;3811:			{
line 3812
;3812:				enemyHasOurFlag = 1;
ADDRLP4 148
CNSTI4 1
ASGNI4
line 3813
;3813:			}
LABELV $1632
LABELV $1631
line 3815
;3814:
;3815:			if (OnSameTeam(&g_entities[bs->client], ent))
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $1634
line 3816
;3816:			{
line 3817
;3817:				numOnMyTeam++;
ADDRLP4 156
ADDRLP4 156
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3818
;3818:			}
ADDRGP4 $1635
JUMPV
LABELV $1634
line 3820
;3819:			else
;3820:			{
line 3821
;3821:				numOnEnemyTeam++;
ADDRLP4 168
ADDRLP4 168
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3822
;3822:			}
LABELV $1635
line 3824
;3823:
;3824:			if (botstates[ent->s.number])
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1636
line 3825
;3825:			{
line 3826
;3826:				if (botstates[ent->s.number]->ctfState == CTFSTATE_ATTACKER ||
ADDRLP4 212
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 1
EQI4 $1640
ADDRLP4 212
INDIRI4
CNSTI4 3
NEI4 $1638
LABELV $1640
line 3828
;3827:					botstates[ent->s.number]->ctfState == CTFSTATE_RETRIEVAL)
;3828:				{
line 3829
;3829:					numAttackers++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3830
;3830:				}
ADDRGP4 $1637
JUMPV
LABELV $1638
line 3832
;3831:				else
;3832:				{
line 3833
;3833:					numDefenders++;
ADDRLP4 180
ADDRLP4 180
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3834
;3834:				}
line 3835
;3835:			}
ADDRGP4 $1637
JUMPV
LABELV $1636
line 3837
;3836:			else
;3837:			{ //assume real players to be attackers in our logic
line 3838
;3838:				numAttackers++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3839
;3839:			}
LABELV $1637
line 3840
;3840:		}
LABELV $1628
line 3841
;3841:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3842
;3842:	}
LABELV $1626
line 3800
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1625
line 3844
;3843:
;3844:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1642
JUMPV
LABELV $1641
line 3847
;3845:
;3846:	while (i < MAX_CLIENTS)
;3847:	{
line 3848
;3848:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3850
;3849:
;3850:		if (ent && ent->client && botstates[i] && botstates[i]->squadLeader && botstates[i]->squadLeader->s.number == bs->client && i != bs->client)
ADDRLP4 188
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1644
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1644
ADDRLP4 196
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1644
ADDRLP4 200
ADDRLP4 196
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CVPU4 4
ADDRLP4 188
INDIRU4
EQU4 $1644
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 200
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
NEI4 $1644
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
EQI4 $1644
line 3851
;3851:		{
line 3852
;3852:			squad[squadmates] = ent;
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 3853
;3853:			squadmates++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3854
;3854:		}
LABELV $1644
line 3856
;3855:
;3856:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3857
;3857:	}
LABELV $1642
line 3846
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1641
line 3859
;3858:
;3859:	squad[squadmates] = &g_entities[bs->client];
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3860
;3860:	squadmates++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3862
;3861:
;3862:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3864
;3863:
;3864:	if (enemyHasOurFlag && !weHaveEnemyFlag)
ADDRLP4 184
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRI4
ADDRLP4 184
INDIRI4
EQI4 $1649
ADDRLP4 160
INDIRI4
ADDRLP4 184
INDIRI4
NEI4 $1649
line 3865
;3865:	{ //start off with an attacker instead of a retriever if we don't have the enemy flag yet so that they can't capture it first.
line 3867
;3866:	  //after that we focus on getting our flag back.
;3867:		attackRetrievePriority = 1;
ADDRLP4 172
CNSTI4 1
ASGNI4
line 3868
;3868:	}
ADDRGP4 $1649
JUMPV
LABELV $1648
line 3871
;3869:
;3870:	while (i < squadmates)
;3871:	{
line 3872
;3872:		if (squad[i] && squad[i]->client && botstates[squad[i]->s.number])
ADDRLP4 188
CNSTI4 2
ASGNI4
ADDRLP4 192
ADDRLP4 0
INDIRI4
ADDRLP4 188
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ASGNP4
ADDRLP4 196
CNSTU4 0
ASGNU4
ADDRLP4 192
INDIRP4
CVPU4 4
ADDRLP4 196
INDIRU4
EQU4 $1651
ADDRLP4 192
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 196
INDIRU4
EQU4 $1651
ADDRLP4 192
INDIRP4
INDIRI4
ADDRLP4 188
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 196
INDIRU4
EQU4 $1651
line 3873
;3873:		{
line 3874
;3874:			if (botstates[squad[i]->s.number]->ctfState != CTFSTATE_GETFLAGHOME)
ADDRLP4 200
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 200
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 200
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
INDIRI4
CNSTI4 5
EQI4 $1653
line 3875
;3875:			{ //never tell a bot to stop trying to bring the flag to the base
line 3876
;3876:				if (defendAttackPriority)
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1655
line 3877
;3877:				{
line 3878
;3878:					if (weHaveEnemyFlag)
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $1657
line 3879
;3879:					{
line 3880
;3880:						if (guardDefendPriority)
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $1659
line 3881
;3881:						{
line 3882
;3882:							botstates[squad[i]->s.number]->ctfState = CTFSTATE_GUARDCARRIER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 4
ASGNI4
line 3883
;3883:							guardDefendPriority = 0;
ADDRLP4 176
CNSTI4 0
ASGNI4
line 3884
;3884:						}
ADDRGP4 $1658
JUMPV
LABELV $1659
line 3886
;3885:						else
;3886:						{
line 3887
;3887:							botstates[squad[i]->s.number]->ctfState = CTFSTATE_DEFENDER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
ADDRLP4 204
INDIRI4
ASGNI4
line 3888
;3888:							guardDefendPriority = 1;
ADDRLP4 176
CNSTI4 1
ASGNI4
line 3889
;3889:						}
line 3890
;3890:					}
ADDRGP4 $1658
JUMPV
LABELV $1657
line 3892
;3891:					else
;3892:					{
line 3893
;3893:						botstates[squad[i]->s.number]->ctfState = CTFSTATE_DEFENDER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
ADDRLP4 204
INDIRI4
ASGNI4
line 3894
;3894:					}
LABELV $1658
line 3895
;3895:					defendAttackPriority = 0;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 3896
;3896:				}
ADDRGP4 $1654
JUMPV
LABELV $1655
line 3898
;3897:				else
;3898:				{
line 3899
;3899:					if (enemyHasOurFlag)
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1661
line 3900
;3900:					{
line 3901
;3901:						if (attackRetrievePriority)
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $1663
line 3902
;3902:						{
line 3903
;3903:							botstates[squad[i]->s.number]->ctfState = CTFSTATE_ATTACKER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 1
ASGNI4
line 3904
;3904:							attackRetrievePriority = 0;
ADDRLP4 172
CNSTI4 0
ASGNI4
line 3905
;3905:						}
ADDRGP4 $1662
JUMPV
LABELV $1663
line 3907
;3906:						else
;3907:						{
line 3908
;3908:							botstates[squad[i]->s.number]->ctfState = CTFSTATE_RETRIEVAL;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 3
ASGNI4
line 3909
;3909:							attackRetrievePriority = 1;
ADDRLP4 172
CNSTI4 1
ASGNI4
line 3910
;3910:						}
line 3911
;3911:					}
ADDRGP4 $1662
JUMPV
LABELV $1661
line 3913
;3912:					else
;3913:					{
line 3914
;3914:						botstates[squad[i]->s.number]->ctfState = CTFSTATE_ATTACKER;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 1
ASGNI4
line 3915
;3915:					}
LABELV $1662
line 3916
;3916:					defendAttackPriority = 1;
ADDRLP4 152
CNSTI4 1
ASGNI4
line 3917
;3917:				}
line 3918
;3918:			}
ADDRGP4 $1654
JUMPV
LABELV $1653
line 3919
;3919:			else if ((numOnMyTeam < 2 || !numAttackers) && enemyHasOurFlag)
ADDRLP4 156
INDIRI4
CNSTI4 2
LTI4 $1667
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $1665
LABELV $1667
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1665
line 3920
;3920:			{ //I'm the only one on my team who will attack and the enemy has my flag, I have to go after him
line 3921
;3921:				botstates[squad[i]->s.number]->ctfState = CTFSTATE_RETRIEVAL;
ADDRLP4 204
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
INDIRI4
ADDRLP4 204
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2688
ADDP4
CNSTI4 3
ASGNI4
line 3922
;3922:			}
LABELV $1665
LABELV $1654
line 3923
;3923:		}
LABELV $1651
line 3925
;3924:
;3925:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3926
;3926:	}
LABELV $1649
line 3870
ADDRLP4 0
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $1648
line 3927
;3927:}
LABELV $1620
endproc CommanderBotCTFAI 216 8
export CommanderBotSagaAI
proc CommanderBotSagaAI 180 8
line 3930
;3928:
;3929:void CommanderBotSagaAI(bot_state_t *bs)
;3930:{
line 3931
;3931:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3932
;3932:	int squadmates = 0;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 3933
;3933:	int commanded = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 3934
;3934:	int teammates = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRGP4 $1670
JUMPV
LABELV $1669
line 3940
;3935:	gentity_t *squad[MAX_CLIENTS];
;3936:	gentity_t *ent;
;3937:	bot_state_t *bst;
;3938:
;3939:	while (i < MAX_CLIENTS)
;3940:	{
line 3941
;3941:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3943
;3942:
;3943:		if (ent && ent->client && OnSameTeam(&g_entities[bs->client], ent) && botstates[ent->s.number])
ADDRLP4 156
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 156
INDIRU4
EQU4 $1672
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 156
INDIRU4
EQU4 $1672
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $1672
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1672
line 3944
;3944:		{
line 3945
;3945:			bst = botstates[ent->s.number];
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 3947
;3946:
;3947:			if (bst && !bst->isSquadLeader && !bst->state_Forced)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1674
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
NEI4 $1674
ADDRLP4 8
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
NEI4 $1674
line 3948
;3948:			{
line 3949
;3949:				squad[squadmates] = ent;
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 3950
;3950:				squadmates++;
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3951
;3951:			}
ADDRGP4 $1675
JUMPV
LABELV $1674
line 3952
;3952:			else if (bst && !bst->isSquadLeader && bst->state_Forced)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1676
ADDRLP4 176
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
ADDRLP4 176
INDIRI4
NEI4 $1676
ADDRLP4 8
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ADDRLP4 176
INDIRI4
EQI4 $1676
line 3953
;3953:			{ //count them as commanded
line 3954
;3954:				commanded++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3955
;3955:			}
LABELV $1676
LABELV $1675
line 3956
;3956:		}
LABELV $1672
line 3958
;3957:
;3958:		if (ent && ent->client && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 168
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1678
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1678
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $1678
line 3959
;3959:		{
line 3960
;3960:			teammates++;
ADDRLP4 148
ADDRLP4 148
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3961
;3961:		}
LABELV $1678
line 3963
;3962:
;3963:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3964
;3964:	}
LABELV $1670
line 3939
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1669
line 3966
;3965:	
;3966:	if (!squadmates)
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $1680
line 3967
;3967:	{
line 3968
;3968:		return;
ADDRGP4 $1668
JUMPV
LABELV $1680
line 3972
;3969:	}
;3970:
;3971:	//tell squad mates to do what I'm doing, up to half of team, let the other half make their own decisions
;3972:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1683
JUMPV
LABELV $1682
line 3975
;3973:
;3974:	while (i < squadmates && squad[i])
;3975:	{
line 3976
;3976:		bst = botstates[squad[i]->s.number];
ADDRLP4 152
CNSTI4 2
ASGNI4
ADDRLP4 8
ADDRLP4 4
INDIRI4
ADDRLP4 152
INDIRI4
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
INDIRI4
ADDRLP4 152
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 3978
;3977:
;3978:		if (commanded > teammates/2)
ADDRLP4 140
INDIRI4
ADDRLP4 148
INDIRI4
CNSTI4 2
DIVI4
LEI4 $1685
line 3979
;3979:		{
line 3980
;3980:			break;
ADDRGP4 $1684
JUMPV
LABELV $1685
line 3983
;3981:		}
;3982:
;3983:		if (bst)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1687
line 3984
;3984:		{
line 3985
;3985:			bst->state_Forced = bs->sagaState;
ADDRLP4 8
INDIRP4
CNSTI4 2704
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2692
ADDP4
INDIRI4
ASGNI4
line 3986
;3986:			bst->sagaState = bs->sagaState;
ADDRLP4 156
CNSTI4 2692
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 3987
;3987:			commanded++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3988
;3988:		}
LABELV $1687
line 3990
;3989:
;3990:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3991
;3991:	}
LABELV $1683
line 3974
ADDRLP4 4
INDIRI4
ADDRLP4 144
INDIRI4
GEI4 $1689
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1682
LABELV $1689
LABELV $1684
line 3992
;3992:}
LABELV $1668
endproc CommanderBotSagaAI 180 8
export BotDoTeamplayAI
proc BotDoTeamplayAI 4 0
line 3995
;3993:
;3994:void BotDoTeamplayAI(bot_state_t *bs)
;3995:{
line 3996
;3996:	if (bs->state_Forced)
ADDRFP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1691
line 3997
;3997:	{
line 3998
;3998:		bs->teamplayState = bs->state_Forced;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 2696
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
ASGNI4
line 3999
;3999:	}
LABELV $1691
line 4001
;4000:
;4001:	if (bs->teamplayState == TEAMPLAYSTATE_REGROUP)
ADDRFP4 0
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1693
line 4002
;4002:	{ //force to find a new leader
line 4003
;4003:		bs->squadLeader = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
CNSTP4 0
ASGNP4
line 4004
;4004:		bs->isSquadLeader = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 4005
;4005:	}
LABELV $1693
line 4006
;4006:}
LABELV $1690
endproc BotDoTeamplayAI 4 0
export CommanderBotTeamplayAI
proc CommanderBotTeamplayAI 188 20
line 4009
;4007:
;4008:void CommanderBotTeamplayAI(bot_state_t *bs)
;4009:{
line 4010
;4010:	int i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4011
;4011:	int squadmates = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 4012
;4012:	int teammates = 0;
ADDRLP4 160
CNSTI4 0
ASGNI4
line 4013
;4013:	int teammate_indanger = -1;
ADDRLP4 144
CNSTI4 -1
ASGNI4
line 4014
;4014:	int teammate_helped = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 4015
;4015:	int foundsquadleader = 0;
ADDRLP4 156
CNSTI4 0
ASGNI4
line 4016
;4016:	int worsthealth = 50;
ADDRLP4 152
CNSTI4 50
ASGNI4
ADDRGP4 $1697
JUMPV
LABELV $1696
line 4022
;4017:	gentity_t *squad[MAX_CLIENTS];
;4018:	gentity_t *ent;
;4019:	bot_state_t *bst;
;4020:
;4021:	while (i < MAX_CLIENTS)
;4022:	{
line 4023
;4023:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4025
;4024:
;4025:		if (ent && ent->client && OnSameTeam(&g_entities[bs->client], ent) && botstates[ent->s.number])
ADDRLP4 168
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1699
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1699
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $1699
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1699
line 4026
;4026:		{
line 4027
;4027:			bst = botstates[ent->s.number];
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 4029
;4028:
;4029:			if (foundsquadleader && bst && bst->isSquadLeader)
ADDRLP4 176
CNSTI4 0
ASGNI4
ADDRLP4 156
INDIRI4
ADDRLP4 176
INDIRI4
EQI4 $1701
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1701
ADDRLP4 4
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
ADDRLP4 176
INDIRI4
EQI4 $1701
line 4030
;4030:			{ //never more than one squad leader
line 4031
;4031:				bst->isSquadLeader = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 4032
;4032:			}
LABELV $1701
line 4034
;4033:
;4034:			if (bst && !bst->isSquadLeader)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1703
ADDRLP4 4
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1703
line 4035
;4035:			{
line 4036
;4036:				squad[squadmates] = ent;
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 4037
;4037:				squadmates++;
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4038
;4038:			}
ADDRGP4 $1704
JUMPV
LABELV $1703
line 4039
;4039:			else if (bst)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1705
line 4040
;4040:			{
line 4041
;4041:				foundsquadleader = 1;
ADDRLP4 156
CNSTI4 1
ASGNI4
line 4042
;4042:			}
LABELV $1705
LABELV $1704
line 4043
;4043:		}
LABELV $1699
line 4045
;4044:
;4045:		if (ent && ent->client && OnSameTeam(&g_entities[bs->client], ent))
ADDRLP4 180
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 180
INDIRU4
EQU4 $1707
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 180
INDIRU4
EQU4 $1707
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $1707
line 4046
;4046:		{
line 4047
;4047:			teammates++;
ADDRLP4 160
ADDRLP4 160
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4049
;4048:
;4049:			if (ent->health < worsthealth)
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 152
INDIRI4
GEI4 $1709
line 4050
;4050:			{
line 4051
;4051:				teammate_indanger = ent->s.number;
ADDRLP4 144
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 4052
;4052:				worsthealth = ent->health;
ADDRLP4 152
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ASGNI4
line 4053
;4053:			}
LABELV $1709
line 4054
;4054:		}
LABELV $1707
line 4056
;4055:
;4056:		i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4057
;4057:	}
LABELV $1697
line 4021
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $1696
line 4059
;4058:	
;4059:	if (!squadmates)
ADDRLP4 140
INDIRI4
CNSTI4 0
NEI4 $1711
line 4060
;4060:	{
line 4061
;4061:		return;
ADDRGP4 $1695
JUMPV
LABELV $1711
line 4064
;4062:	}
;4063:
;4064:	i = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1714
JUMPV
LABELV $1713
line 4067
;4065:
;4066:	while (i < squadmates && squad[i])
;4067:	{
line 4068
;4068:		bst = botstates[squad[i]->s.number];
ADDRLP4 164
CNSTI4 2
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 164
INDIRI4
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
INDIRI4
ADDRLP4 164
INDIRI4
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 4070
;4069:
;4070:		if (bst && !bst->state_Forced)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1716
ADDRLP4 4
INDIRP4
CNSTI4 2704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1716
line 4071
;4071:		{ //only order if this guy is not being ordered directly by the real player team leader
line 4072
;4072:			if (teammate_indanger >= 0 && !teammate_helped)
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRI4
ADDRLP4 172
INDIRI4
LTI4 $1718
ADDRLP4 148
INDIRI4
ADDRLP4 172
INDIRI4
NEI4 $1718
line 4073
;4073:			{ //send someone out to help whoever needs help most at the moment
line 4074
;4074:				bst->teamplayState = TEAMPLAYSTATE_ASSISTING;
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 2
ASGNI4
line 4075
;4075:				bst->squadLeader = &g_entities[teammate_indanger];
ADDRLP4 4
INDIRP4
CNSTI4 1824
ADDP4
CNSTI4 2352
ADDRLP4 144
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4076
;4076:				teammate_helped = 1;
ADDRLP4 148
CNSTI4 1
ASGNI4
line 4077
;4077:			}
ADDRGP4 $1719
JUMPV
LABELV $1718
line 4078
;4078:			else if ((teammate_indanger == -1 || teammate_helped) && bst->teamplayState == TEAMPLAYSTATE_ASSISTING)
ADDRLP4 144
INDIRI4
CNSTI4 -1
EQI4 $1722
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1720
LABELV $1722
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1720
line 4079
;4079:			{ //no teammates need help badly, but this guy is trying to help them anyway, so stop
line 4080
;4080:				bst->teamplayState = TEAMPLAYSTATE_FOLLOWING;
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 1
ASGNI4
line 4081
;4081:				bst->squadLeader = &g_entities[bs->client];
ADDRLP4 4
INDIRP4
CNSTI4 1824
ADDP4
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4082
;4082:			}
LABELV $1720
LABELV $1719
line 4084
;4083:
;4084:			if (bs->squadRegroupInterval < level.time && Q_irand(1, 10, qfalse, 5) < 5)
ADDRFP4 0
INDIRP4
CNSTI4 1872
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1723
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 176
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 5
GEI4 $1723
line 4085
;4085:			{ //every so often tell the squad to regroup for the sake of variation
line 4086
;4086:				if (bst->teamplayState == TEAMPLAYSTATE_FOLLOWING)
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1726
line 4087
;4087:				{
line 4088
;4088:					bst->teamplayState = TEAMPLAYSTATE_REGROUP;
ADDRLP4 4
INDIRP4
CNSTI4 2696
ADDP4
CNSTI4 3
ASGNI4
line 4089
;4089:				}
LABELV $1726
line 4091
;4090:
;4091:				bs->isSquadLeader = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 0
ASGNI4
line 4092
;4092:				bs->squadCannotLead = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 1876
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4093
;4093:				bs->squadRegroupInterval = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 45000, 65000, qfalse, 55000);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 45000
ARGI4
CNSTI4 65000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 55000
ARGI4
ADDRLP4 180
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1872
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 180
INDIRI4
ADDI4
ASGNI4
line 4094
;4094:			}
LABELV $1723
line 4095
;4095:		}
LABELV $1716
line 4097
;4096:
;4097:		i++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4098
;4098:	}	
LABELV $1714
line 4066
ADDRLP4 8
INDIRI4
ADDRLP4 140
INDIRI4
GEI4 $1730
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1713
LABELV $1730
line 4099
;4099:}
LABELV $1695
endproc CommanderBotTeamplayAI 188 20
export CommanderBotAI
proc CommanderBotAI 0 4
line 4102
;4100:
;4101:void CommanderBotAI(bot_state_t *bs)
;4102:{
line 4103
;4103:	if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $1736
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $1732
LABELV $1736
line 4104
;4104:	{
line 4105
;4105:		CommanderBotCTFAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CommanderBotCTFAI
CALLV
pop
line 4106
;4106:	}
ADDRGP4 $1733
JUMPV
LABELV $1732
line 4107
;4107:	else if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $1737
line 4108
;4108:	{
line 4109
;4109:		CommanderBotSagaAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CommanderBotSagaAI
CALLV
pop
line 4110
;4110:	}
ADDRGP4 $1738
JUMPV
LABELV $1737
line 4111
;4111:	else if (g_gametype.integer == GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $1740
line 4112
;4112:	{
line 4113
;4113:		CommanderBotTeamplayAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CommanderBotTeamplayAI
CALLV
pop
line 4114
;4114:	}
LABELV $1740
LABELV $1738
LABELV $1733
line 4115
;4115:}
LABELV $1731
endproc CommanderBotAI 0 4
export MeleeCombatHandling
proc MeleeCombatHandling 1200 28
line 4118
;4116:
;4117:void MeleeCombatHandling(bot_state_t *bs)
;4118:{
line 4130
;4119:	vec3_t usethisvec;
;4120:	vec3_t downvec;
;4121:	vec3_t midorg;
;4122:	vec3_t a;
;4123:	vec3_t fwd;
;4124:	vec3_t mins, maxs;
;4125:	trace_t tr;
;4126:	int en_down;
;4127:	int me_down;
;4128:	int mid_down;
;4129:
;4130:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1744
line 4131
;4131:	{
line 4132
;4132:		return;
ADDRGP4 $1743
JUMPV
LABELV $1744
line 4135
;4133:	}
;4134:
;4135:	if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1746
line 4136
;4136:	{
line 4137
;4137:		VectorCopy(bs->currentEnemy->client->ps.origin, usethisvec);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4138
;4138:	}
ADDRGP4 $1747
JUMPV
LABELV $1746
line 4140
;4139:	else
;4140:	{
line 4141
;4141:		VectorCopy(bs->currentEnemy->s.origin, usethisvec);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4142
;4142:	}
LABELV $1747
line 4144
;4143:
;4144:	if (bs->meleeStrafeTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2252
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1748
line 4145
;4145:	{
line 4146
;4146:		if (bs->meleeStrafeDir)
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1751
line 4147
;4147:		{
line 4148
;4148:			bs->meleeStrafeDir = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 0
ASGNI4
line 4149
;4149:		}
ADDRGP4 $1752
JUMPV
LABELV $1751
line 4151
;4150:		else
;4151:		{
line 4152
;4152:			bs->meleeStrafeDir = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 1
ASGNI4
line 4153
;4153:		}
LABELV $1752
line 4155
;4154:
;4155:		bs->meleeStrafeTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 500, 1800, qfalse, 1100);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 500
ARGI4
CNSTI4 1800
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1100
ARGI4
ADDRLP4 1176
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2252
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 1176
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 4156
;4156:	}
LABELV $1748
line 4158
;4157:
;4158:	mins[0] = -15;
ADDRLP4 36
CNSTF4 3245342720
ASGNF4
line 4159
;4159:	mins[1] = -15;
ADDRLP4 36+4
CNSTF4 3245342720
ASGNF4
line 4160
;4160:	mins[2] = -24;
ADDRLP4 36+8
CNSTF4 3250585600
ASGNF4
line 4161
;4161:	maxs[0] = 15;
ADDRLP4 48
CNSTF4 1097859072
ASGNF4
line 4162
;4162:	maxs[1] = 15;
ADDRLP4 48+4
CNSTF4 1097859072
ASGNF4
line 4163
;4163:	maxs[2] = 32;
ADDRLP4 48+8
CNSTF4 1107296256
ASGNF4
line 4165
;4164:
;4165:	VectorCopy(usethisvec, downvec);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 4166
;4166:	downvec[2] -= 4096;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4168
;4167:
;4168:	JP_Trace(&tr, usethisvec, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 4170
;4169:
;4170:	en_down = (int)tr.endpos[2];
ADDRLP4 1164
ADDRLP4 60+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4172
;4171:
;4172:	VectorCopy(bs->origin, downvec);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 4173
;4173:	downvec[2] -= 4096;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4175
;4174:
;4175:	JP_Trace(&tr, bs->origin, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 4177
;4176:
;4177:	me_down = (int)tr.endpos[2];
ADDRLP4 1168
ADDRLP4 60+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4179
;4178:
;4179:	VectorSubtract(usethisvec, bs->origin, a);
ADDRLP4 1176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 1176
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 1176
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4180
;4180:	vectoangles(a, a);
ADDRLP4 24
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 4181
;4181:	AngleVectors(a, fwd, NULL, NULL);
ADDRLP4 24
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 1180
CNSTP4 0
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4183
;4182:
;4183:	midorg[0] = bs->origin[0] + fwd[0]*bs->frame_Enemy_Len/2;
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
ADDRLP4 1184
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1152
INDIRF4
ADDRLP4 1184
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4184
;4184:	midorg[1] = bs->origin[1] + fwd[1]*bs->frame_Enemy_Len/2;
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140+4
ADDRLP4 1188
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1152+4
INDIRF4
ADDRLP4 1188
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4185
;4185:	midorg[2] = bs->origin[2] + fwd[2]*bs->frame_Enemy_Len/2;
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140+8
ADDRLP4 1192
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 1152+8
INDIRF4
ADDRLP4 1192
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4187
;4186:
;4187:	VectorCopy(midorg, downvec);
ADDRLP4 0
ADDRLP4 1140
INDIRB
ASGNB 12
line 4188
;4188:	downvec[2] -= 4096;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4190
;4189:
;4190:	JP_Trace(&tr, midorg, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 4192
;4191:
;4192:	mid_down = (int)tr.endpos[2];
ADDRLP4 1172
ADDRLP4 60+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4194
;4193:
;4194:	if (me_down == en_down &&
ADDRLP4 1168
INDIRI4
ADDRLP4 1164
INDIRI4
NEI4 $1775
ADDRLP4 1164
INDIRI4
ADDRLP4 1172
INDIRI4
NEI4 $1775
line 4196
;4195:		en_down == mid_down)
;4196:	{
line 4197
;4197:		VectorCopy(usethisvec, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 4198
;4198:	}
LABELV $1775
line 4199
;4199:}
LABELV $1743
endproc MeleeCombatHandling 1200 28
export SaberCombatHandling
proc SaberCombatHandling 1276 28
line 4202
;4200:
;4201:void SaberCombatHandling(bot_state_t *bs)
;4202:{
line 4214
;4203:	vec3_t usethisvec;
;4204:	vec3_t downvec;
;4205:	vec3_t midorg;
;4206:	vec3_t a;
;4207:	vec3_t fwd;
;4208:	vec3_t mins, maxs;
;4209:	trace_t tr;
;4210:	int en_down;
;4211:	int me_down;
;4212:	int mid_down;
;4213:
;4214:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1778
line 4215
;4215:	{
line 4216
;4216:		return;
ADDRGP4 $1777
JUMPV
LABELV $1778
line 4219
;4217:	}
;4218:
;4219:	if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1780
line 4220
;4220:	{
line 4221
;4221:		VectorCopy(bs->currentEnemy->client->ps.origin, usethisvec);
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4222
;4222:	}
ADDRGP4 $1781
JUMPV
LABELV $1780
line 4224
;4223:	else
;4224:	{
line 4225
;4225:		VectorCopy(bs->currentEnemy->s.origin, usethisvec);
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4226
;4226:	}
LABELV $1781
line 4228
;4227:
;4228:	if (bs->meleeStrafeTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2252
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1782
line 4229
;4229:	{
line 4230
;4230:		if (bs->meleeStrafeDir)
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1785
line 4231
;4231:		{
line 4232
;4232:			bs->meleeStrafeDir = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 0
ASGNI4
line 4233
;4233:		}
ADDRGP4 $1786
JUMPV
LABELV $1785
line 4235
;4234:		else
;4235:		{
line 4236
;4236:			bs->meleeStrafeDir = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
CNSTI4 1
ASGNI4
line 4237
;4237:		}
LABELV $1786
line 4239
;4238:
;4239:		bs->meleeStrafeTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 500, 1800, qfalse, 1100);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 500
ARGI4
CNSTI4 1800
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1100
ARGI4
ADDRLP4 1176
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2252
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 1176
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 4240
;4240:	}
LABELV $1782
line 4242
;4241:
;4242:	mins[0] = -15;
ADDRLP4 1116
CNSTF4 3245342720
ASGNF4
line 4243
;4243:	mins[1] = -15;
ADDRLP4 1116+4
CNSTF4 3245342720
ASGNF4
line 4244
;4244:	mins[2] = -24;
ADDRLP4 1116+8
CNSTF4 3250585600
ASGNF4
line 4245
;4245:	maxs[0] = 15;
ADDRLP4 1128
CNSTF4 1097859072
ASGNF4
line 4246
;4246:	maxs[1] = 15;
ADDRLP4 1128+4
CNSTF4 1097859072
ASGNF4
line 4247
;4247:	maxs[2] = 32;
ADDRLP4 1128+8
CNSTF4 1107296256
ASGNF4
line 4249
;4248:
;4249:	VectorCopy(usethisvec, downvec);
ADDRLP4 1080
ADDRLP4 1092
INDIRB
ASGNB 12
line 4250
;4250:	downvec[2] -= 4096;
ADDRLP4 1080+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4252
;4251:
;4252:	JP_Trace(&tr, usethisvec, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1080
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 4254
;4253:
;4254:	en_down = (int)tr.endpos[2];
ADDRLP4 1164
ADDRLP4 0+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4256
;4255:
;4256:	if (tr.startsolid || tr.allsolid)
ADDRLP4 1176
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1176
INDIRI4
NEI4 $1798
ADDRLP4 0
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1795
LABELV $1798
line 4257
;4257:	{
line 4258
;4258:		en_down = 1;
ADDRLP4 1164
CNSTI4 1
ASGNI4
line 4259
;4259:		me_down = 2;
ADDRLP4 1168
CNSTI4 2
ASGNI4
line 4260
;4260:	}
ADDRGP4 $1796
JUMPV
LABELV $1795
line 4262
;4261:	else
;4262:	{
line 4263
;4263:		VectorCopy(bs->origin, downvec);
ADDRLP4 1080
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 4264
;4264:		downvec[2] -= 4096;
ADDRLP4 1080+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4266
;4265:
;4266:		JP_Trace(&tr, bs->origin, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1080
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 4268
;4267:
;4268:		me_down = (int)tr.endpos[2];
ADDRLP4 1168
ADDRLP4 0+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4270
;4269:
;4270:		if (tr.startsolid || tr.allsolid)
ADDRLP4 1180
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1180
INDIRI4
NEI4 $1805
ADDRLP4 0
INDIRI4
ADDRLP4 1180
INDIRI4
EQI4 $1802
LABELV $1805
line 4271
;4271:		{
line 4272
;4272:			en_down = 1;
ADDRLP4 1164
CNSTI4 1
ASGNI4
line 4273
;4273:			me_down = 2;
ADDRLP4 1168
CNSTI4 2
ASGNI4
line 4274
;4274:		}
LABELV $1802
line 4275
;4275:	}
LABELV $1796
line 4277
;4276:
;4277:	VectorSubtract(usethisvec, bs->origin, a);
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1104
ADDRLP4 1092
INDIRF4
ADDRLP4 1180
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1104+4
ADDRLP4 1092+4
INDIRF4
ADDRLP4 1180
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1104+8
ADDRLP4 1092+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4278
;4278:	vectoangles(a, a);
ADDRLP4 1104
ARGP4
ADDRLP4 1104
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 4279
;4279:	AngleVectors(a, fwd, NULL, NULL);
ADDRLP4 1104
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 1184
CNSTP4 0
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4281
;4280:
;4281:	midorg[0] = bs->origin[0] + fwd[0]*bs->frame_Enemy_Len/2;
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
ADDRLP4 1188
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1152
INDIRF4
ADDRLP4 1188
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4282
;4282:	midorg[1] = bs->origin[1] + fwd[1]*bs->frame_Enemy_Len/2;
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140+4
ADDRLP4 1192
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1152+4
INDIRF4
ADDRLP4 1192
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4283
;4283:	midorg[2] = bs->origin[2] + fwd[2]*bs->frame_Enemy_Len/2;
ADDRLP4 1196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140+8
ADDRLP4 1196
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 1152+8
INDIRF4
ADDRLP4 1196
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 4285
;4284:
;4285:	VectorCopy(midorg, downvec);
ADDRLP4 1080
ADDRLP4 1140
INDIRB
ASGNB 12
line 4286
;4286:	downvec[2] -= 4096;
ADDRLP4 1080+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4288
;4287:
;4288:	JP_Trace(&tr, midorg, mins, maxs, downvec, -1, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1140
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1080
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 4290
;4289:
;4290:	mid_down = (int)tr.endpos[2];
ADDRLP4 1172
ADDRLP4 0+12+8
INDIRF4
CVFI4 4
ASGNI4
line 4292
;4291:
;4292:	if (me_down == en_down &&
ADDRLP4 1168
INDIRI4
ADDRLP4 1164
INDIRI4
NEI4 $1817
ADDRLP4 1164
INDIRI4
ADDRLP4 1172
INDIRI4
NEI4 $1817
line 4294
;4293:		en_down == mid_down)
;4294:	{
line 4295
;4295:		if (usethisvec[2] > (bs->origin[2]+32) &&
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092+8
INDIRF4
ADDRLP4 1204
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1107296256
ADDF4
LEF4 $1819
ADDRLP4 1208
ADDRLP4 1204
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1819
ADDRLP4 1208
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1819
line 4298
;4296:			bs->currentEnemy->client &&
;4297:			bs->currentEnemy->client->ps.groundEntityNum == ENTITYNUM_NONE)
;4298:		{
line 4299
;4299:			bs->jumpTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 4300
;4300:		}
LABELV $1819
line 4302
;4301:
;4302:		if (bs->frame_Enemy_Len > 128)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1124073472
LEF4 $1823
line 4303
;4303:		{ //be ready to attack
line 4304
;4304:			bs->saberDefending = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 0
ASGNI4
line 4305
;4305:			bs->saberDefendDecideTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 1000, 2000, qfalse, 1500);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 2000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1500
ARGI4
ADDRLP4 1212
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2712
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 1212
INDIRI4
ADDI4
ASGNI4
line 4306
;4306:		}
ADDRGP4 $1824
JUMPV
LABELV $1823
line 4308
;4307:		else
;4308:		{
line 4309
;4309:			if (bs->saberDefendDecideTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2712
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1826
line 4310
;4310:			{
line 4311
;4311:				if (bs->saberDefending)
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1829
line 4312
;4312:				{
line 4313
;4313:					bs->saberDefending = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 0
ASGNI4
line 4314
;4314:				}
ADDRGP4 $1830
JUMPV
LABELV $1829
line 4316
;4315:				else
;4316:				{
line 4317
;4317:					bs->saberDefending = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 1
ASGNI4
line 4318
;4318:				}
LABELV $1830
line 4320
;4319:
;4320:				bs->saberDefendDecideTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 500, 2000, qfalse, 1250);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 500
ARGI4
CNSTI4 2000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1250
ARGI4
ADDRLP4 1212
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2712
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 1212
INDIRI4
ADDI4
ASGNI4
line 4321
;4321:			}
LABELV $1826
line 4322
;4322:		}
LABELV $1824
line 4324
;4323:
;4324:		if (bs->frame_Enemy_Len < 54)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1113063424
GEF4 $1832
line 4325
;4325:		{
line 4326
;4326:			VectorCopy(bs->origin, bs->goalPosition);
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1212
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 4327
;4327:			bs->saberBFTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2716
ADDP4
CNSTI4 0
ASGNI4
line 4328
;4328:		}
ADDRGP4 $1833
JUMPV
LABELV $1832
line 4330
;4329:		else
;4330:		{
line 4331
;4331:			VectorCopy(usethisvec, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1092
INDIRB
ASGNB 12
line 4332
;4332:		}
LABELV $1833
line 4334
;4333:
;4334:		if (bs->frame_Enemy_Len > 90 && bs->saberBFTime > level.time && bs->saberBTime > level.time && bs->beStill < level.time && bs->saberSTime < level.time)
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1119092736
LEF4 $1834
ADDRLP4 1212
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $1834
ADDRLP4 1212
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $1834
ADDRLP4 1212
INDIRP4
CNSTI4 2004
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1834
ADDRLP4 1212
INDIRP4
CNSTI4 2724
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1834
line 4335
;4335:		{
line 4336
;4336:			bs->beStill = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 500, 1000, qfalse, 750);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 750
ARGI4
ADDRLP4 1216
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 1216
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 4337
;4337:			bs->saberSTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 1200, 1800, qfalse, 1500);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 1200
ARGI4
CNSTI4 1800
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1500
ARGI4
ADDRLP4 1220
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2724
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 1220
INDIRI4
ADDI4
ASGNI4
line 4338
;4338:		}
ADDRGP4 $1818
JUMPV
LABELV $1834
line 4339
;4339:		else if (bs->currentEnemy->client && bs->currentEnemy->client->ps.weapon == WP_SABER && bs->frame_Enemy_Len < 80 && ((Q_irand(1, 10, qfalse, 5) < 8 && bs->saberBFTime < level.time) || bs->saberBTime > level.time))
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1220
ADDRLP4 1216
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1220
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1842
ADDRLP4 1220
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1842
ADDRLP4 1216
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1117782016
GEF4 $1842
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1224
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 8
GEI4 $1847
ADDRFP4 0
INDIRP4
CNSTI4 2716
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LTI4 $1846
LABELV $1847
ADDRFP4 0
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $1842
LABELV $1846
line 4340
;4340:		{
line 4344
;4341:			vec3_t vs;
;4342:			vec3_t groundcheck;
;4343:
;4344:			VectorSubtract(bs->origin, usethisvec, vs);
ADDRLP4 1252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1228
ADDRLP4 1252
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1092
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1228+4
ADDRLP4 1252
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1092+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1228+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 1092+8
INDIRF4
SUBF4
ASGNF4
line 4345
;4345:			VectorNormalize(vs);
ADDRLP4 1228
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 4347
;4346:
;4347:			bs->goalPosition[0] = bs->origin[0] + vs[0]*64;
ADDRLP4 1256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1256
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1256
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 1228
INDIRF4
MULF4
ADDF4
ASGNF4
line 4348
;4348:			bs->goalPosition[1] = bs->origin[1] + vs[1]*64;
ADDRLP4 1260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1260
INDIRP4
CNSTI4 1924
ADDP4
ADDRLP4 1260
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 1228+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4349
;4349:			bs->goalPosition[2] = bs->origin[2] + vs[2]*64;
ADDRLP4 1264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1264
INDIRP4
CNSTI4 1928
ADDP4
ADDRLP4 1264
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 1228+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4351
;4350:
;4351:			if (bs->saberBTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2720
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1854
line 4352
;4352:			{
line 4353
;4353:				bs->saberBFTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 900, 1300, qfalse, 1100);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 900
ARGI4
CNSTI4 1300
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1100
ARGI4
ADDRLP4 1268
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2716
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 1268
INDIRI4
ADDI4
ASGNI4
line 4354
;4354:				bs->saberBTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 300, 700, qfalse, 500);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 300
ARGI4
CNSTI4 700
ARGI4
CNSTI4 0
ARGI4
CNSTI4 500
ARGI4
ADDRLP4 1272
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2720
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 1272
INDIRI4
ADDI4
ASGNI4
line 4355
;4355:			}
LABELV $1854
line 4357
;4356:
;4357:			VectorCopy(bs->goalPosition, groundcheck);
ADDRLP4 1240
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
INDIRB
ASGNB 12
line 4359
;4358:
;4359:			groundcheck[2] -= 64;
ADDRLP4 1240+8
ADDRLP4 1240+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 4361
;4360:
;4361:			JP_Trace(&tr, bs->goalPosition, NULL, NULL, groundcheck, bs->client, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1268
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 1272
CNSTP4 0
ASGNP4
ADDRLP4 1272
INDIRP4
ARGP4
ADDRLP4 1272
INDIRP4
ARGP4
ADDRLP4 1240
ARGP4
ADDRLP4 1268
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 4363
;4362:			
;4363:			if (tr.fraction == 1.0)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $1818
line 4364
;4364:			{ //don't back off of a ledge
line 4365
;4365:				VectorCopy(usethisvec, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1092
INDIRB
ASGNB 12
line 4366
;4366:			}
line 4367
;4367:		}
ADDRGP4 $1818
JUMPV
LABELV $1842
line 4368
;4368:		else if (bs->currentEnemy->client && bs->currentEnemy->client->ps.weapon == WP_SABER && bs->frame_Enemy_Len >= 75)
ADDRLP4 1228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1232
ADDRLP4 1228
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1232
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1818
ADDRLP4 1232
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1818
ADDRLP4 1228
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1117126656
LTF4 $1818
line 4369
;4369:		{
line 4370
;4370:			bs->saberBFTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 700, 1300, qfalse, 1000);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 700
ARGI4
CNSTI4 1300
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 1236
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2716
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 1236
INDIRI4
ADDI4
ASGNI4
line 4371
;4371:			bs->saberBTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2720
ADDP4
CNSTI4 0
ASGNI4
line 4372
;4372:		}
line 4388
;4373:
;4374:		/*AngleVectors(bs->viewangles, NULL, fwd, NULL);
;4375:
;4376:		if (bs->meleeStrafeDir)
;4377:		{
;4378:			bs->goalPosition[0] += fwd[0]*16;
;4379:			bs->goalPosition[1] += fwd[1]*16;
;4380:			bs->goalPosition[2] += fwd[2]*16;
;4381:		}
;4382:		else
;4383:		{
;4384:			bs->goalPosition[0] -= fwd[0]*16;
;4385:			bs->goalPosition[1] -= fwd[1]*16;
;4386:			bs->goalPosition[2] -= fwd[2]*16;
;4387:		}*/
;4388:	}
ADDRGP4 $1818
JUMPV
LABELV $1817
line 4389
;4389:	else if (bs->frame_Enemy_Len <= 56)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1113587712
GTF4 $1866
line 4390
;4390:	{
line 4391
;4391:		bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4392
;4392:		bs->saberDefending = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2708
ADDP4
CNSTI4 0
ASGNI4
line 4393
;4393:	}
LABELV $1866
LABELV $1818
line 4394
;4394:}
LABELV $1777
endproc SaberCombatHandling 1276 28
export BotWeaponCanLead
proc BotWeaponCanLead 4 0
line 4397
;4395:
;4396:float BotWeaponCanLead(bot_state_t *bs)
;4397:{
line 4398
;4398:	int weap = bs->cur_ps.weapon;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
line 4400
;4399:
;4400:	if (weap == WP_BRYAR_PISTOL)
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $1869
line 4401
;4401:	{
line 4402
;4402:		return 0.5;
CNSTF4 1056964608
RETF4
ADDRGP4 $1868
JUMPV
LABELV $1869
line 4404
;4403:	}
;4404:	if (weap == WP_BLASTER)
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1871
line 4405
;4405:	{
line 4406
;4406:		return 0.35f;
CNSTF4 1051931443
RETF4
ADDRGP4 $1868
JUMPV
LABELV $1871
line 4408
;4407:	}
;4408:	if (weap == WP_BOWCASTER)
ADDRLP4 0
INDIRI4
CNSTI4 6
NEI4 $1873
line 4409
;4409:	{
line 4410
;4410:		return 0.5;
CNSTF4 1056964608
RETF4
ADDRGP4 $1868
JUMPV
LABELV $1873
line 4412
;4411:	}
;4412:	if (weap == WP_REPEATER)
ADDRLP4 0
INDIRI4
CNSTI4 7
NEI4 $1875
line 4413
;4413:	{
line 4414
;4414:		return 0.45f;
CNSTF4 1055286886
RETF4
ADDRGP4 $1868
JUMPV
LABELV $1875
line 4416
;4415:	}
;4416:	if (weap == WP_THERMAL)
ADDRLP4 0
INDIRI4
CNSTI4 11
NEI4 $1877
line 4417
;4417:	{
line 4418
;4418:		return 0.5;
CNSTF4 1056964608
RETF4
ADDRGP4 $1868
JUMPV
LABELV $1877
line 4420
;4419:	}
;4420:	if (weap == WP_DEMP2)
ADDRLP4 0
INDIRI4
CNSTI4 8
NEI4 $1879
line 4421
;4421:	{
line 4422
;4422:		return 0.35f;
CNSTF4 1051931443
RETF4
ADDRGP4 $1868
JUMPV
LABELV $1879
line 4424
;4423:	}
;4424:	if (weap == WP_ROCKET_LAUNCHER)
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1881
line 4425
;4425:	{
line 4426
;4426:		return 0.7f;
CNSTF4 1060320051
RETF4
ADDRGP4 $1868
JUMPV
LABELV $1881
line 4429
;4427:	}
;4428:	
;4429:	return 0;
CNSTF4 0
RETF4
LABELV $1868
endproc BotWeaponCanLead 4 0
export BotAimLeading
proc BotAimLeading 68 8
line 4433
;4430:}
;4431:
;4432:void BotAimLeading(bot_state_t *bs, vec3_t headlevel, float leadAmount)
;4433:{
line 4440
;4434:	int x;
;4435:	vec3_t predictedSpot;
;4436:	vec3_t movementVector;
;4437:	vec3_t a, ang;
;4438:	float vtotal;
;4439:
;4440:	if (!bs->currentEnemy ||
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
CNSTU4 0
ASGNU4
ADDRLP4 56
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
EQU4 $1886
ADDRLP4 56
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 60
INDIRU4
NEU4 $1884
LABELV $1886
line 4442
;4441:		!bs->currentEnemy->client)
;4442:	{
line 4443
;4443:		return;
ADDRGP4 $1883
JUMPV
LABELV $1884
line 4446
;4444:	}
;4445:
;4446:	if (!bs->frame_Enemy_Len)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1887
line 4447
;4447:	{
line 4448
;4448:		return;
ADDRGP4 $1883
JUMPV
LABELV $1887
line 4451
;4449:	}
;4450:
;4451:	vtotal = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4453
;4452:
;4453:	if (bs->currentEnemy->client->ps.velocity[0] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1889
line 4454
;4454:	{
line 4455
;4455:		vtotal += -bs->currentEnemy->client->ps.velocity[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 4456
;4456:	}
ADDRGP4 $1890
JUMPV
LABELV $1889
line 4458
;4457:	else
;4458:	{
line 4459
;4459:		vtotal += bs->currentEnemy->client->ps.velocity[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4460
;4460:	}
LABELV $1890
line 4462
;4461:
;4462:	if (bs->currentEnemy->client->ps.velocity[1] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1891
line 4463
;4463:	{
line 4464
;4464:		vtotal += -bs->currentEnemy->client->ps.velocity[1];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 4465
;4465:	}
ADDRGP4 $1892
JUMPV
LABELV $1891
line 4467
;4466:	else
;4467:	{
line 4468
;4468:		vtotal += bs->currentEnemy->client->ps.velocity[1];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4469
;4469:	}
LABELV $1892
line 4471
;4470:
;4471:	if (bs->currentEnemy->client->ps.velocity[2] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1893
line 4472
;4472:	{
line 4473
;4473:		vtotal += -bs->currentEnemy->client->ps.velocity[2];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 4474
;4474:	}
ADDRGP4 $1894
JUMPV
LABELV $1893
line 4476
;4475:	else
;4476:	{
line 4477
;4477:		vtotal += bs->currentEnemy->client->ps.velocity[2];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4478
;4478:	}
LABELV $1894
line 4482
;4479:
;4480:	//G_Printf("Leadin target with a velocity total of %f\n", vtotal);
;4481:
;4482:	VectorCopy(bs->currentEnemy->client->ps.velocity, movementVector);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 4484
;4483:
;4484:	VectorNormalize(movementVector);
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 4486
;4485:
;4486:	x = bs->frame_Enemy_Len*leadAmount; //hardly calculated with an exact science, but it works
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 4488
;4487:
;4488:	if (vtotal > 400)
ADDRLP4 0
INDIRF4
CNSTF4 1137180672
LEF4 $1895
line 4489
;4489:	{
line 4490
;4490:		vtotal = 400;
ADDRLP4 0
CNSTF4 1137180672
ASGNF4
line 4491
;4491:	}
LABELV $1895
line 4493
;4492:
;4493:	if (vtotal)
ADDRLP4 0
INDIRF4
CNSTF4 0
EQF4 $1897
line 4494
;4494:	{
line 4495
;4495:		x = (bs->frame_Enemy_Len*0.9)*leadAmount*(vtotal*0.0012); //hardly calculated with an exact science, but it works
ADDRLP4 16
CNSTF4 1063675494
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
ADDRFP4 8
INDIRF4
MULF4
CNSTF4 983386450
ADDRLP4 0
INDIRF4
MULF4
MULF4
CVFI4 4
ASGNI4
line 4496
;4496:	}
ADDRGP4 $1898
JUMPV
LABELV $1897
line 4498
;4497:	else
;4498:	{
line 4499
;4499:		x = (bs->frame_Enemy_Len*0.9)*leadAmount; //hardly calculated with an exact science, but it works
ADDRLP4 16
CNSTF4 1063675494
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
MULF4
ADDRFP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 4500
;4500:	}
LABELV $1898
line 4502
;4501:
;4502:	predictedSpot[0] = headlevel[0] + (movementVector[0]*x);
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 4503
;4503:	predictedSpot[1] = headlevel[1] + (movementVector[1]*x);
ADDRLP4 4+4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20+4
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 4504
;4504:	predictedSpot[2] = headlevel[2] + (movementVector[2]*x);
ADDRLP4 4+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20+8
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 4506
;4505:
;4506:	VectorSubtract(predictedSpot, bs->eye, a);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+8
ADDRLP4 4+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4507
;4507:	vectoangles(a, ang);
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 4508
;4508:	VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 44
INDIRB
ASGNB 12
line 4509
;4509:}
LABELV $1883
endproc BotAimLeading 68 8
export BotAimOffsetGoalAngles
proc BotAimOffsetGoalAngles 56 8
line 4512
;4510:
;4511:void BotAimOffsetGoalAngles(bot_state_t *bs)
;4512:{
line 4515
;4513:	int i;
;4514:	float accVal;
;4515:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4517
;4516:
;4517:	if (bs->skills.perfectaim)
ADDRFP4 0
INDIRP4
CNSTI4 2336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1908
line 4518
;4518:	{
line 4519
;4519:		return;
ADDRGP4 $1907
JUMPV
LABELV $1908
line 4522
;4520:	}
;4521:
;4522:	if (bs->aimOffsetTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2032
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $1910
line 4523
;4523:	{
line 4524
;4524:		if (bs->aimOffsetAmtYaw)
ADDRFP4 0
INDIRP4
CNSTI4 2036
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1913
line 4525
;4525:		{
line 4526
;4526:			bs->goalAngles[YAW] += bs->aimOffsetAmtYaw;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 1900
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 2036
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4527
;4527:		}
LABELV $1913
line 4529
;4528:
;4529:		if (bs->aimOffsetAmtPitch)
ADDRFP4 0
INDIRP4
CNSTI4 2040
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1918
line 4530
;4530:		{
line 4531
;4531:			bs->goalAngles[PITCH] += bs->aimOffsetAmtPitch;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 1896
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 2040
ADDP4
INDIRF4
ADDF4
ASGNF4
line 4532
;4532:		}
ADDRGP4 $1918
JUMPV
LABELV $1917
line 4535
;4533:		
;4534:		while (i <= 2)
;4535:		{
line 4536
;4536:			if (bs->goalAngles[i] > 360)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDP4
INDIRF4
CNSTF4 1135869952
LEF4 $1920
line 4537
;4537:			{
line 4538
;4538:				bs->goalAngles[i] -= 360;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 4539
;4539:			}
LABELV $1920
line 4541
;4540:
;4541:			if (bs->goalAngles[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1922
line 4542
;4542:			{
line 4543
;4543:				bs->goalAngles[i] += 360;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 4544
;4544:			}
LABELV $1922
line 4546
;4545:
;4546:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4547
;4547:		}
LABELV $1918
line 4534
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $1917
line 4548
;4548:		return;
ADDRGP4 $1907
JUMPV
LABELV $1910
line 4551
;4549:	}
;4550:
;4551:	accVal = bs->skills.accuracy/bs->settings.skill;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 2320
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
DIVF4
ASGNF4
line 4553
;4552:
;4553:	if (bs->currentEnemy && BotMindTricked(bs->client, bs->currentEnemy->s.number))
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1924
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1924
line 4554
;4554:	{ //having to judge where they are by hearing them, so we should be quite inaccurate here
line 4555
;4555:		accVal *= 7;
ADDRLP4 4
CNSTF4 1088421888
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 4557
;4556:
;4557:		if (accVal < 30)
ADDRLP4 4
INDIRF4
CNSTF4 1106247680
GEF4 $1926
line 4558
;4558:		{
line 4559
;4559:			accVal = 30;
ADDRLP4 4
CNSTF4 1106247680
ASGNF4
line 4560
;4560:		}
LABELV $1926
line 4561
;4561:	}
LABELV $1924
line 4563
;4562:
;4563:	if (bs->revengeEnemy && bs->revengeHateLevel &&
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 28
INDIRU4
CNSTU4 0
EQU4 $1928
ADDRLP4 24
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1928
ADDRLP4 24
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
NEU4 $1928
line 4565
;4564:		bs->currentEnemy == bs->revengeEnemy)
;4565:	{ //bot becomes more skilled as anger level raises
line 4566
;4566:		accVal = accVal/bs->revengeHateLevel;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 4567
;4567:	}
LABELV $1928
line 4569
;4568:
;4569:	if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1930
ADDRLP4 32
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1930
line 4570
;4570:	{ //assume our goal is aiming at the enemy, seeing as he's visible and all
line 4571
;4571:		if (!bs->currentEnemy->s.pos.trDelta[0] &&
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
NEF4 $1932
ADDRLP4 36
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
NEF4 $1932
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
NEF4 $1932
line 4574
;4572:			!bs->currentEnemy->s.pos.trDelta[1] &&
;4573:			!bs->currentEnemy->s.pos.trDelta[2])
;4574:		{
line 4575
;4575:			accVal = 0; //he's not even moving, so he shouldn't really be hard to hit.
ADDRLP4 4
CNSTF4 0
ASGNF4
line 4576
;4576:		}
ADDRGP4 $1933
JUMPV
LABELV $1932
line 4578
;4577:		else
;4578:		{
line 4579
;4579:			accVal += accVal*0.25; //if he's moving he's this much harder to hit
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1048576000
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4580
;4580:		}
LABELV $1933
line 4582
;4581:
;4582:		if (g_entities[bs->client].s.pos.trDelta[0] ||
ADDRLP4 44
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+12+24
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
NEF4 $1945
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+12+24+4
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
NEF4 $1945
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+12+24+8
ADDP4
INDIRF4
ADDRLP4 48
INDIRF4
EQF4 $1934
LABELV $1945
line 4585
;4583:			g_entities[bs->client].s.pos.trDelta[1] ||
;4584:			g_entities[bs->client].s.pos.trDelta[2])
;4585:		{
line 4586
;4586:			accVal += accVal*0.15; //make it somewhat harder to aim if we're moving also
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1041865114
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4587
;4587:		}
LABELV $1934
line 4588
;4588:	}
LABELV $1930
line 4590
;4589:
;4590:	if (accVal > 90)
ADDRLP4 4
INDIRF4
CNSTF4 1119092736
LEF4 $1946
line 4591
;4591:	{
line 4592
;4592:		accVal = 90;
ADDRLP4 4
CNSTF4 1119092736
ASGNF4
line 4593
;4593:	}
LABELV $1946
line 4594
;4594:	if (accVal < 1)
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
GEF4 $1948
line 4595
;4595:	{
line 4596
;4596:		accVal = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 4597
;4597:	}
LABELV $1948
line 4599
;4598:
;4599:	if (!accVal)
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $1950
line 4600
;4600:	{
line 4601
;4601:		bs->aimOffsetAmtYaw = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2036
ADDP4
CNSTF4 0
ASGNF4
line 4602
;4602:		bs->aimOffsetAmtPitch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2040
ADDP4
CNSTF4 0
ASGNF4
line 4603
;4603:		return;
ADDRGP4 $1907
JUMPV
LABELV $1950
line 4606
;4604:	}
;4605:
;4606:	if (rand()%10 <= 5)
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GTI4 $1952
line 4607
;4607:	{
line 4608
;4608:		bs->aimOffsetAmtYaw = rand()%(int)accVal;
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2036
ADDP4
ADDRLP4 40
INDIRI4
ADDRLP4 4
INDIRF4
CVFI4 4
MODI4
CVIF4 4
ASGNF4
line 4609
;4609:	}
ADDRGP4 $1953
JUMPV
LABELV $1952
line 4611
;4610:	else
;4611:	{
line 4612
;4612:		bs->aimOffsetAmtYaw = -(rand()%(int)accVal);
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2036
ADDP4
ADDRLP4 40
INDIRI4
ADDRLP4 4
INDIRF4
CVFI4 4
MODI4
NEGI4
CVIF4 4
ASGNF4
line 4613
;4613:	}
LABELV $1953
line 4615
;4614:
;4615:	if (rand()%10 <= 5)
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GTI4 $1954
line 4616
;4616:	{
line 4617
;4617:		bs->aimOffsetAmtPitch = rand()%(int)accVal;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2040
ADDP4
ADDRLP4 44
INDIRI4
ADDRLP4 4
INDIRF4
CVFI4 4
MODI4
CVIF4 4
ASGNF4
line 4618
;4618:	}
ADDRGP4 $1955
JUMPV
LABELV $1954
line 4620
;4619:	else
;4620:	{
line 4621
;4621:		bs->aimOffsetAmtPitch = -(rand()%(int)accVal);
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2040
ADDP4
ADDRLP4 44
INDIRI4
ADDRLP4 4
INDIRF4
CVFI4 4
MODI4
NEGI4
CVIF4 4
ASGNF4
line 4622
;4622:	}
LABELV $1955
line 4624
;4623:
;4624:	bs->aimOffsetTime = level.time + rand()%500 + 200;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2032
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 44
INDIRI4
CNSTI4 500
MODI4
ADDI4
CNSTI4 200
ADDI4
CVIF4 4
ASGNF4
line 4625
;4625:}
LABELV $1907
endproc BotAimOffsetGoalAngles 56 8
export ShouldSecondaryFire
proc ShouldSecondaryFire 28 0
line 4628
;4626:
;4627:int ShouldSecondaryFire(bot_state_t *bs)
;4628:{
line 4633
;4629:	int weap;
;4630:	int dif;
;4631:	float rTime;
;4632:
;4633:	weap = bs->cur_ps.weapon;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
line 4635
;4634:
;4635:	if (bs->cur_ps.ammo[weaponData[weap].ammoIndex] < weaponData[weap].altEnergyPerShot)
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
GEI4 $1958
line 4636
;4636:	{
line 4637
;4637:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1957
JUMPV
LABELV $1958
line 4640
;4638:	}
;4639:
;4640:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT && bs->cur_ps.weapon == WP_ROCKET_LAUNCHER)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1960
ADDRLP4 16
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 10
NEI4 $1960
line 4641
;4641:	{
line 4642
;4642:		float heldTime = (level.time - bs->cur_ps.weaponChargeTime);
ADDRLP4 20
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 4644
;4643:
;4644:		rTime = bs->cur_ps.rocketLockTime;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRF4
ASGNF4
line 4646
;4645:
;4646:		if (rTime < 1)
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
GEF4 $1963
line 4647
;4647:		{
line 4648
;4648:			rTime = bs->cur_ps.rocketLastValidTime;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRF4
ASGNF4
line 4649
;4649:		}
LABELV $1963
line 4651
;4650:
;4651:		if (heldTime > 5000)
ADDRLP4 20
INDIRF4
CNSTF4 1167867904
LEF4 $1965
line 4652
;4652:		{ //just give up and release it if we can't manage a lock in 5 seconds
line 4653
;4653:			return 2;
CNSTI4 2
RETI4
ADDRGP4 $1957
JUMPV
LABELV $1965
line 4656
;4654:		}
;4655:
;4656:		if (rTime > 0)
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $1967
line 4657
;4657:		{
line 4658
;4658:			dif = ( level.time - rTime ) / ( 1200.0f / 16.0f );
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
SUBF4
CNSTF4 1117126656
DIVF4
CVFI4 4
ASGNI4
line 4660
;4659:			
;4660:			if (dif >= 10)
ADDRLP4 8
INDIRI4
CNSTI4 10
LTI4 $1970
line 4661
;4661:			{
line 4662
;4662:				return 2;
CNSTI4 2
RETI4
ADDRGP4 $1957
JUMPV
LABELV $1970
line 4664
;4663:			}
;4664:			else if (bs->frame_Enemy_Len > 250)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132068864
LEF4 $1961
line 4665
;4665:			{
line 4666
;4666:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $1957
JUMPV
line 4668
;4667:			}
;4668:		}
LABELV $1967
line 4669
;4669:		else if (bs->frame_Enemy_Len > 250)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132068864
LEF4 $1961
line 4670
;4670:		{
line 4671
;4671:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $1957
JUMPV
line 4673
;4672:		}
;4673:	}
LABELV $1960
line 4674
;4674:	else if ((bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT) && (level.time - bs->cur_ps.weaponChargeTime) > bs->altChargeTime)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1976
ADDRGP4 level+36
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
SUBI4
ADDRLP4 20
INDIRP4
CNSTI4 2264
ADDP4
INDIRI4
LEI4 $1976
line 4675
;4675:	{
line 4676
;4676:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $1957
JUMPV
LABELV $1976
line 4678
;4677:	}
;4678:	else if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1979
line 4679
;4679:	{
line 4680
;4680:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1957
JUMPV
LABELV $1979
LABELV $1961
line 4683
;4681:	}
;4682:
;4683:	if (weap == WP_BRYAR_PISTOL && bs->frame_Enemy_Len < 300)
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $1981
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
GEF4 $1981
line 4684
;4684:	{
line 4685
;4685:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1957
JUMPV
LABELV $1981
line 4687
;4686:	}
;4687:	else if (weap == WP_BOWCASTER && bs->frame_Enemy_Len > 300)
ADDRLP4 0
INDIRI4
CNSTI4 6
NEI4 $1983
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
LEF4 $1983
line 4688
;4688:	{
line 4689
;4689:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1957
JUMPV
LABELV $1983
line 4691
;4690:	}
;4691:	else if (weap == WP_REPEATER && bs->frame_Enemy_Len < 600 && bs->frame_Enemy_Len > 250)
ADDRLP4 0
INDIRI4
CNSTI4 7
NEI4 $1985
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 1142292480
GEF4 $1985
ADDRLP4 24
INDIRF4
CNSTF4 1132068864
LEF4 $1985
line 4692
;4692:	{
line 4693
;4693:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1957
JUMPV
LABELV $1985
line 4695
;4694:	}
;4695:	else if (weap == WP_BLASTER && bs->frame_Enemy_Len < 300)
ADDRLP4 0
INDIRI4
CNSTI4 4
NEI4 $1987
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
GEF4 $1987
line 4696
;4696:	{
line 4697
;4697:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1957
JUMPV
LABELV $1987
line 4699
;4698:	}
;4699:	else if (weap == WP_ROCKET_LAUNCHER && bs->frame_Enemy_Len > 250)
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $1989
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132068864
LEF4 $1989
line 4700
;4700:	{
line 4701
;4701:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1957
JUMPV
LABELV $1989
line 4704
;4702:	}
;4703:
;4704:	return 0;
CNSTI4 0
RETI4
LABELV $1957
endproc ShouldSecondaryFire 28 0
export CombatBotAI
proc CombatBotAI 80 20
line 4708
;4705:}
;4706:
;4707:int CombatBotAI(bot_state_t *bs, float thinktime)
;4708:{
line 4713
;4709:	vec3_t eorg, a;
;4710:	int secFire;
;4711:	float fovcheck;
;4712:
;4713:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1992
line 4714
;4714:	{
line 4715
;4715:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1991
JUMPV
LABELV $1992
line 4718
;4716:	}
;4717:
;4718:	if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1994
line 4719
;4719:	{
line 4720
;4720:		VectorCopy(bs->currentEnemy->client->ps.origin, eorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4721
;4721:	}
ADDRGP4 $1995
JUMPV
LABELV $1994
line 4723
;4722:	else
;4723:	{
line 4724
;4724:		VectorCopy(bs->currentEnemy->s.origin, eorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4725
;4725:	}
LABELV $1995
line 4727
;4726:
;4727:	VectorSubtract(eorg, bs->eye, a);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4728
;4728:	vectoangles(a, a);
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 4730
;4729:
;4730:	if (BotGetWeaponRange(bs) == BWEAPONRANGE_SABER)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 4
NEI4 $2000
line 4731
;4731:	{
line 4732
;4732:		if (bs->frame_Enemy_Len <= SABER_ATTACK_RANGE)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1124073472
GTF4 $2001
line 4733
;4733:		{
line 4734
;4734:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4735
;4735:		}
line 4736
;4736:	}
ADDRGP4 $2001
JUMPV
LABELV $2000
line 4737
;4737:	else if (BotGetWeaponRange(bs) == BWEAPONRANGE_MELEE)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
NEI4 $2004
line 4738
;4738:	{
line 4739
;4739:		if (bs->frame_Enemy_Len <= MELEE_ATTACK_RANGE)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
GTF4 $2005
line 4740
;4740:		{
line 4741
;4741:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4742
;4742:		}
line 4743
;4743:	}
ADDRGP4 $2005
JUMPV
LABELV $2004
line 4745
;4744:	else
;4745:	{
line 4746
;4746:		if (bs->cur_ps.weapon == WP_THERMAL || bs->cur_ps.weapon == WP_ROCKET_LAUNCHER)
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 11
EQI4 $2010
ADDRLP4 44
INDIRI4
CNSTI4 10
NEI4 $2008
LABELV $2010
line 4747
;4747:		{ //be careful with the hurty weapons
line 4748
;4748:			fovcheck = 40;
ADDRLP4 24
CNSTF4 1109393408
ASGNF4
line 4750
;4749:
;4750:			if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT &&
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2009
ADDRLP4 48
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 10
NEI4 $2009
line 4752
;4751:				bs->cur_ps.weapon == WP_ROCKET_LAUNCHER)
;4752:			{ //if we're charging the weapon up then we can hold fire down within a normal fov
line 4753
;4753:				fovcheck = 60;
ADDRLP4 24
CNSTF4 1114636288
ASGNF4
line 4754
;4754:			}
line 4755
;4755:		}
ADDRGP4 $2009
JUMPV
LABELV $2008
line 4757
;4756:		else
;4757:		{
line 4758
;4758:			fovcheck = 60;
ADDRLP4 24
CNSTF4 1114636288
ASGNF4
line 4759
;4759:		}
LABELV $2009
line 4761
;4760:
;4761:		if (bs->cur_ps.weaponstate == WEAPON_CHARGING ||
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 4
EQI4 $2015
ADDRLP4 48
INDIRI4
CNSTI4 5
NEI4 $2013
LABELV $2015
line 4763
;4762:			bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT)
;4763:		{
line 4764
;4764:			fovcheck = 160;
ADDRLP4 24
CNSTF4 1126170624
ASGNF4
line 4765
;4765:		}
LABELV $2013
line 4767
;4766:
;4767:		if (bs->frame_Enemy_Len < 128)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1124073472
GEF4 $2016
line 4768
;4768:		{
line 4769
;4769:			fovcheck *= 2;
ADDRLP4 24
CNSTF4 1073741824
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 4770
;4770:		}
LABELV $2016
line 4772
;4771:
;4772:		if (InFieldOfVision(bs->viewangles, fovcheck, a))
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 0
ARGP4
ADDRLP4 52
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $2018
line 4773
;4773:		{
line 4774
;4774:			if (bs->cur_ps.weapon == WP_THERMAL)
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 11
NEI4 $2020
line 4775
;4775:			{
line 4776
;4776:				if (((level.time - bs->cur_ps.weaponChargeTime) < (bs->frame_Enemy_Len*2) &&
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
ADDRLP4 56
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
ADDRGP4 level+36
INDIRI4
ADDRLP4 60
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1073741824
ADDRLP4 64
INDIRF4
MULF4
GEF4 $2028
ADDRGP4 level+36
INDIRI4
ADDRLP4 60
INDIRI4
SUBI4
CNSTI4 4000
GEI4 $2028
ADDRLP4 64
INDIRF4
CNSTF4 1115684864
GTF4 $2026
LABELV $2028
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 4
EQI4 $2021
ADDRLP4 68
INDIRI4
CNSTI4 5
EQI4 $2021
LABELV $2026
line 4781
;4777:					(level.time - bs->cur_ps.weaponChargeTime) < 4000 &&
;4778:					bs->frame_Enemy_Len > 64) ||
;4779:					(bs->cur_ps.weaponstate != WEAPON_CHARGING &&
;4780:					bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT))
;4781:				{
line 4782
;4782:					if (bs->cur_ps.weaponstate != WEAPON_CHARGING && bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT)
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 4
EQI4 $2029
ADDRLP4 72
INDIRI4
CNSTI4 5
EQI4 $2029
line 4783
;4783:					{
line 4784
;4784:						if (bs->frame_Enemy_Len > 512 && bs->frame_Enemy_Len < 800)
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
ADDRLP4 76
INDIRF4
CNSTF4 1140850688
LEF4 $2031
ADDRLP4 76
INDIRF4
CNSTF4 1145569280
GEF4 $2031
line 4785
;4785:						{
line 4786
;4786:							bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 4788
;4787:							//bs->doAttack = 1;
;4788:						}
ADDRGP4 $2032
JUMPV
LABELV $2031
line 4790
;4789:						else
;4790:						{
line 4791
;4791:							bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4793
;4792:							//bs->doAltAttack = 1;
;4793:						}
LABELV $2032
line 4794
;4794:					}
LABELV $2029
line 4796
;4795:
;4796:					if (bs->cur_ps.weaponstate == WEAPON_CHARGING)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2033
line 4797
;4797:					{
line 4798
;4798:						bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4799
;4799:					}
ADDRGP4 $2021
JUMPV
LABELV $2033
line 4800
;4800:					else if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2021
line 4801
;4801:					{
line 4802
;4802:						bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 4803
;4803:					}
line 4804
;4804:				}
line 4805
;4805:			}
ADDRGP4 $2021
JUMPV
LABELV $2020
line 4807
;4806:			else
;4807:			{
line 4808
;4808:				secFire = ShouldSecondaryFire(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 ShouldSecondaryFire
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 56
INDIRI4
ASGNI4
line 4810
;4809:
;4810:				if (bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT &&
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 5
EQI4 $2037
ADDRLP4 60
INDIRI4
CNSTI4 4
EQI4 $2037
line 4812
;4811:					bs->cur_ps.weaponstate != WEAPON_CHARGING)
;4812:				{
line 4813
;4813:					bs->altChargeTime = Q_irandExpectedIf(gRandomUnlockAdd, 500, 1000, qfalse, 750);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 750
ARGI4
ADDRLP4 64
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2264
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 4814
;4814:				}
LABELV $2037
line 4816
;4815:
;4816:				if (secFire == 1)
ADDRLP4 28
INDIRI4
CNSTI4 1
NEI4 $2039
line 4817
;4817:				{
line 4818
;4818:					bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 4819
;4819:				}
ADDRGP4 $2040
JUMPV
LABELV $2039
line 4820
;4820:				else if (!secFire)
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2041
line 4821
;4821:				{
line 4822
;4822:					if (bs->cur_ps.weapon != WP_THERMAL)
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 11
EQI4 $2043
line 4823
;4823:					{
line 4824
;4824:						if (bs->cur_ps.weaponstate != WEAPON_CHARGING ||
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2048
ADDRLP4 64
INDIRP4
CNSTI4 2264
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
SUBI4
LEI4 $2044
LABELV $2048
line 4826
;4825:							bs->altChargeTime > (level.time - bs->cur_ps.weaponChargeTime))
;4826:						{
line 4827
;4827:							bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4828
;4828:						}
line 4829
;4829:					}
ADDRGP4 $2044
JUMPV
LABELV $2043
line 4831
;4830:					else
;4831:					{
line 4832
;4832:						bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 4833
;4833:					}
LABELV $2044
line 4834
;4834:				}
LABELV $2041
LABELV $2040
line 4836
;4835:
;4836:				if (secFire == 2)
ADDRLP4 28
INDIRI4
CNSTI4 2
NEI4 $2049
line 4837
;4837:				{ //released a charge
line 4838
;4838:					return 1;
CNSTI4 1
RETI4
ADDRGP4 $1991
JUMPV
LABELV $2049
line 4840
;4839:				}
;4840:			}
LABELV $2021
line 4841
;4841:		}
LABELV $2018
line 4842
;4842:	}
LABELV $2005
LABELV $2001
line 4844
;4843:
;4844:	return 0;
CNSTI4 0
RETI4
LABELV $1991
endproc CombatBotAI 80 20
export BotFallbackNavigation
proc BotFallbackNavigation 1152 28
line 4848
;4845:}
;4846:
;4847:int BotFallbackNavigation(bot_state_t *bs)
;4848:{
line 4852
;4849:	vec3_t b_angle, fwd, trto, mins, maxs;
;4850:	trace_t tr;
;4851:
;4852:	if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2052
ADDRLP4 1140
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2052
line 4853
;4853:	{
line 4854
;4854:		return 2; //we're busy
CNSTI4 2
RETI4
ADDRGP4 $2051
JUMPV
LABELV $2052
line 4857
;4855:	}
;4856:
;4857:	mins[0] = -15;
ADDRLP4 24
CNSTF4 3245342720
ASGNF4
line 4858
;4858:	mins[1] = -15;
ADDRLP4 24+4
CNSTF4 3245342720
ASGNF4
line 4859
;4859:	mins[2] = 0;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 4860
;4860:	maxs[0] = 15;
ADDRLP4 36
CNSTF4 1097859072
ASGNF4
line 4861
;4861:	maxs[1] = 15;
ADDRLP4 36+4
CNSTF4 1097859072
ASGNF4
line 4862
;4862:	maxs[2] = 32;
ADDRLP4 36+8
CNSTF4 1107296256
ASGNF4
line 4864
;4863:
;4864:	bs->goalAngles[PITCH] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
CNSTF4 0
ASGNF4
line 4865
;4865:	bs->goalAngles[ROLL] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1904
ADDP4
CNSTF4 0
ASGNF4
line 4867
;4866:
;4867:	VectorCopy(bs->goalAngles, b_angle);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
INDIRB
ASGNB 12
line 4869
;4868:
;4869:	AngleVectors(b_angle, fwd, NULL, NULL);
ADDRLP4 48
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1144
CNSTP4 0
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4871
;4870:
;4871:	trto[0] = bs->origin[0] + fwd[0]*16;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 4872
;4872:	trto[1] = bs->origin[1] + fwd[1]*16;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4873
;4873:	trto[2] = bs->origin[2] + fwd[2]*16;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4875
;4874:
;4875:	JP_Trace(&tr, bs->origin, mins, maxs, trto, -1, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 4877
;4876:
;4877:	if (tr.fraction == 1)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
NEF4 $2062
line 4878
;4878:	{
line 4879
;4879:		VectorCopy(trto, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 4880
;4880:		return 1; //success!
CNSTI4 1
RETI4
ADDRGP4 $2051
JUMPV
LABELV $2062
line 4883
;4881:	}
;4882:	else
;4883:	{
line 4884
;4884:		bs->goalAngles[YAW] = rand()%360;
ADDRLP4 1148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
ADDRLP4 1148
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 4885
;4885:	}
line 4887
;4886:
;4887:	return 0;
CNSTI4 0
RETI4
LABELV $2051
endproc BotFallbackNavigation 1152 28
export BotTryAnotherWeapon
proc BotTryAnotherWeapon 16 8
line 4891
;4888:}
;4889:
;4890:int BotTryAnotherWeapon(bot_state_t *bs)
;4891:{ //out of ammo, resort to the first weapon we come across that has ammo
line 4894
;4892:	int i;
;4893:
;4894:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2067
JUMPV
LABELV $2066
line 4897
;4895:
;4896:	while (i < WP_NUM_WEAPONS)
;4897:	{
line 4898
;4898:		if (bs->cur_ps.ammo[weaponData[i].ammoIndex] > weaponData[i].energyPerShot &&
ADDRLP4 8
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LEI4 $2069
ADDRLP4 12
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2069
line 4900
;4899:			(bs->cur_ps.stats[STAT_WEAPONS] & (1 << i)))
;4900:		{
line 4901
;4901:			bs->virtualWeapon = i;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 4902
;4902:			BotSelectWeapon(bs->client, i);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 4905
;4903:			//bs->cur_ps.weapon = i;
;4904:			//level.clients[bs->client].ps.weapon = i;
;4905:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $2065
JUMPV
LABELV $2069
line 4908
;4906:		}
;4907:
;4908:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4909
;4909:	}
LABELV $2067
line 4896
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $2066
line 4911
;4910:
;4911:	if (bs->cur_ps.weapon != 1 && bs->virtualWeapon != 1)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2071
ADDRLP4 4
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2071
line 4912
;4912:	{ //should always have this.. shouldn't we?
line 4913
;4913:		bs->virtualWeapon = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
CNSTI4 1
ASGNI4
line 4914
;4914:		BotSelectWeapon(bs->client, 1);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 4917
;4915:		//bs->cur_ps.weapon = 1;
;4916:		//level.clients[bs->client].ps.weapon = 1;
;4917:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2065
JUMPV
LABELV $2071
line 4920
;4918:	}
;4919:
;4920:	return 0;
CNSTI4 0
RETI4
LABELV $2065
endproc BotTryAnotherWeapon 16 8
export BotWeaponSelectable
proc BotWeaponSelectable 12 0
line 4924
;4921:}
;4922:
;4923:qboolean BotWeaponSelectable(bot_state_t *bs, int weapon)
;4924:{
line 4925
;4925:	if (bs->cur_ps.ammo[weaponData[weapon].ammoIndex] >= weaponData[weapon].energyPerShot &&
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $2074
ADDRLP4 8
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2074
line 4927
;4926:		(bs->cur_ps.stats[STAT_WEAPONS] & (1 << weapon)))
;4927:	{
line 4928
;4928:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2073
JUMPV
LABELV $2074
line 4931
;4929:	}
;4930:	
;4931:	return qfalse;
CNSTI4 0
RETI4
LABELV $2073
endproc BotWeaponSelectable 12 0
export BotSelectIdealWeapon
proc BotSelectIdealWeapon 64 8
line 4935
;4932:}
;4933:
;4934:int BotSelectIdealWeapon(bot_state_t *bs)
;4935:{
line 4937
;4936:	int i;
;4937:	int bestweight = -1;
ADDRLP4 4
CNSTI4 -1
ASGNI4
line 4938
;4938:	int bestweapon = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4940
;4939:
;4940:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2078
JUMPV
LABELV $2077
line 4943
;4941:
;4942:	while (i < WP_NUM_WEAPONS)
;4943:	{
line 4944
;4944:		if (bs->cur_ps.ammo[weaponData[i].ammoIndex] >= weaponData[i].energyPerShot &&
ADDRLP4 16
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 20
CNSTI4 2
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $2080
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 2624
ADDP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
LEF4 $2080
ADDRLP4 24
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2080
line 4947
;4945:			bs->botWeaponWeights[i] > bestweight &&
;4946:			(bs->cur_ps.stats[STAT_WEAPONS] & (1 << i)))
;4947:		{
line 4948
;4948:			if (i == WP_THERMAL)
ADDRLP4 0
INDIRI4
CNSTI4 11
NEI4 $2082
line 4949
;4949:			{ //special case..
line 4950
;4950:				if (bs->currentEnemy && bs->frame_Enemy_Len < 700)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2083
ADDRLP4 28
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1143930880
GEF4 $2083
line 4951
;4951:				{
line 4952
;4952:					bestweight = bs->botWeaponWeights[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 2624
ADDP4
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 4953
;4953:					bestweapon = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4954
;4954:				}
line 4955
;4955:			}
ADDRGP4 $2083
JUMPV
LABELV $2082
line 4957
;4956:			else
;4957:			{
line 4958
;4958:				bestweight = bs->botWeaponWeights[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 2624
ADDP4
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 4959
;4959:				bestweapon = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4960
;4960:			}
LABELV $2083
line 4961
;4961:		}
LABELV $2080
line 4963
;4962:
;4963:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4964
;4964:	}
LABELV $2078
line 4942
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $2077
line 4966
;4965:
;4966:	if ( bs->currentEnemy && bs->frame_Enemy_Len < 300 &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2086
ADDRLP4 12
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
GEF4 $2086
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $2089
ADDRLP4 8
INDIRI4
CNSTI4 4
EQI4 $2089
ADDRLP4 8
INDIRI4
CNSTI4 6
NEI4 $2086
LABELV $2089
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2086
line 4969
;4967:		(bestweapon == WP_BRYAR_PISTOL || bestweapon == WP_BLASTER || bestweapon == WP_BOWCASTER) &&
;4968:		(bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_SABER)) )
;4969:	{
line 4970
;4970:		bestweapon = WP_SABER;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 4971
;4971:		bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4972
;4972:	}
LABELV $2086
line 4974
;4973:
;4974:	if ( bs->currentEnemy && bs->frame_Enemy_Len > 300 &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $2090
ADDRLP4 20
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
LEF4 $2090
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $2090
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $2090
ADDRLP4 8
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $2090
line 4977
;4975:		bs->currentEnemy->client && bs->currentEnemy->client->ps.weapon != WP_SABER &&
;4976:		(bestweapon == WP_SABER) )
;4977:	{ //if the enemy is far away, and we have our saber selected, see if we have any good distance weapons instead
line 4978
;4978:		if (BotWeaponSelectable(bs, WP_DISRUPTOR))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 40
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2092
line 4979
;4979:		{
line 4980
;4980:			bestweapon = WP_DISRUPTOR;
ADDRLP4 8
CNSTI4 5
ASGNI4
line 4981
;4981:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4982
;4982:		}
ADDRGP4 $2093
JUMPV
LABELV $2092
line 4983
;4983:		else if (BotWeaponSelectable(bs, WP_ROCKET_LAUNCHER))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 44
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2094
line 4984
;4984:		{
line 4985
;4985:			bestweapon = WP_ROCKET_LAUNCHER;
ADDRLP4 8
CNSTI4 10
ASGNI4
line 4986
;4986:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4987
;4987:		}
ADDRGP4 $2095
JUMPV
LABELV $2094
line 4988
;4988:		else if (BotWeaponSelectable(bs, WP_BOWCASTER))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 48
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $2096
line 4989
;4989:		{
line 4990
;4990:			bestweapon = WP_BOWCASTER;
ADDRLP4 8
CNSTI4 6
ASGNI4
line 4991
;4991:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4992
;4992:		}
ADDRGP4 $2097
JUMPV
LABELV $2096
line 4993
;4993:		else if (BotWeaponSelectable(bs, WP_BLASTER))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 52
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $2098
line 4994
;4994:		{
line 4995
;4995:			bestweapon = WP_BLASTER;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 4996
;4996:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4997
;4997:		}
ADDRGP4 $2099
JUMPV
LABELV $2098
line 4998
;4998:		else if (BotWeaponSelectable(bs, WP_REPEATER))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 56
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $2100
line 4999
;4999:		{
line 5000
;5000:			bestweapon = WP_REPEATER;
ADDRLP4 8
CNSTI4 7
ASGNI4
line 5001
;5001:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 5002
;5002:		}
ADDRGP4 $2101
JUMPV
LABELV $2100
line 5003
;5003:		else if (BotWeaponSelectable(bs, WP_DEMP2))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 60
ADDRGP4 BotWeaponSelectable
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $2102
line 5004
;5004:		{
line 5005
;5005:			bestweapon = WP_DEMP2;
ADDRLP4 8
CNSTI4 8
ASGNI4
line 5006
;5006:			bestweight = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 5007
;5007:		}
LABELV $2102
LABELV $2101
LABELV $2099
LABELV $2097
LABELV $2095
LABELV $2093
line 5008
;5008:	}
LABELV $2090
line 5010
;5009:
;5010:	if (bestweight != -1 && bs->cur_ps.weapon != bestweapon && bs->virtualWeapon != bestweapon)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $2104
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2104
ADDRLP4 40
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2104
line 5011
;5011:	{
line 5012
;5012:		bs->virtualWeapon = bestweapon;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 5013
;5013:		BotSelectWeapon(bs->client, bestweapon);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 5016
;5014:		//bs->cur_ps.weapon = bestweapon;
;5015:		//level.clients[bs->client].ps.weapon = bestweapon;
;5016:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2076
JUMPV
LABELV $2104
line 5019
;5017:	}
;5018:
;5019:	return 0;
CNSTI4 0
RETI4
LABELV $2076
endproc BotSelectIdealWeapon 64 8
export BotSelectChoiceWeapon
proc BotSelectChoiceWeapon 20 8
line 5023
;5020:}
;5021:
;5022:int BotSelectChoiceWeapon(bot_state_t *bs, int weapon, int doselection)
;5023:{ //if !doselection then bot will only check if he has the specified weapon and return 1 (yes) or 0 (no)
line 5025
;5024:	int i;
;5025:	int hasit = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5027
;5026:
;5027:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2108
JUMPV
LABELV $2107
line 5030
;5028:
;5029:	while (i < WP_NUM_WEAPONS)
;5030:	{
line 5031
;5031:		if (bs->cur_ps.ammo[weaponData[i].ammoIndex] > weaponData[i].energyPerShot &&
ADDRLP4 12
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LEI4 $2110
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $2110
ADDRLP4 16
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2110
line 5034
;5032:			i == weapon &&
;5033:			(bs->cur_ps.stats[STAT_WEAPONS] & (1 << i)))
;5034:		{
line 5035
;5035:			hasit = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 5036
;5036:			break;
ADDRGP4 $2109
JUMPV
LABELV $2110
line 5039
;5037:		}
;5038:
;5039:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5040
;5040:	}
LABELV $2108
line 5029
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $2107
LABELV $2109
line 5042
;5041:
;5042:	if (hasit && bs->cur_ps.weapon != weapon && doselection && bs->virtualWeapon != weapon)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2112
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2112
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2112
ADDRLP4 12
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2112
line 5043
;5043:	{
line 5044
;5044:		bs->virtualWeapon = weapon;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 5045
;5045:		BotSelectWeapon(bs->client, weapon);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 5048
;5046:		//bs->cur_ps.weapon = weapon;
;5047:		//level.clients[bs->client].ps.weapon = weapon;
;5048:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $2106
JUMPV
LABELV $2112
line 5051
;5049:	}
;5050:
;5051:	if (hasit)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2114
line 5052
;5052:	{
line 5053
;5053:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2106
JUMPV
LABELV $2114
line 5056
;5054:	}
;5055:
;5056:	return 0;
CNSTI4 0
RETI4
LABELV $2106
endproc BotSelectChoiceWeapon 20 8
export BotSelectMelee
proc BotSelectMelee 8 8
line 5060
;5057:}
;5058:
;5059:int BotSelectMelee(bot_state_t *bs)
;5060:{
line 5061
;5061:	if (bs->cur_ps.weapon != 1 && bs->virtualWeapon != 1)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2117
ADDRLP4 0
INDIRP4
CNSTI4 2288
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2117
line 5062
;5062:	{
line 5063
;5063:		bs->virtualWeapon = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2288
ADDP4
CNSTI4 1
ASGNI4
line 5064
;5064:		BotSelectWeapon(bs->client, 1);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotSelectWeapon
CALLV
pop
line 5067
;5065:		//bs->cur_ps.weapon = 1;
;5066:		//level.clients[bs->client].ps.weapon = 1;
;5067:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2116
JUMPV
LABELV $2117
line 5070
;5068:	}
;5069:
;5070:	return 0;
CNSTI4 0
RETI4
LABELV $2116
endproc BotSelectMelee 8 8
export GetLoveLevel
proc GetLoveLevel 20 8
line 5074
;5071:}
;5072:
;5073:int GetLoveLevel(bot_state_t *bs, bot_state_t *love)
;5074:{
line 5075
;5075:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5076
;5076:	const char *lname = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 5078
;5077:
;5078:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $2120
line 5079
;5079:	{ //There is no love in 1-on-1
line 5080
;5080:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2119
JUMPV
LABELV $2120
line 5083
;5081:	}
;5082:
;5083:	if (!bs || !love || !g_entities[love->client].client)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $2127
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $2127
CNSTI4 2352
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $2123
LABELV $2127
line 5084
;5084:	{
line 5085
;5085:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2119
JUMPV
LABELV $2123
line 5088
;5086:	}
;5087:
;5088:	if (!bs->lovednum)
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2128
line 5089
;5089:	{
line 5090
;5090:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2119
JUMPV
LABELV $2128
line 5093
;5091:	}
;5092:
;5093:	trap_Cvar_Update(&bot_attachments);
ADDRGP4 bot_attachments
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5095
;5094:
;5095:	if (!bot_attachments.integer)
ADDRGP4 bot_attachments+12
INDIRI4
CNSTI4 0
NEI4 $2130
line 5096
;5096:	{
line 5097
;5097:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2119
JUMPV
LABELV $2130
line 5100
;5098:	}
;5099:
;5100:	lname = g_entities[love->client].client->pers.netname;
ADDRLP4 4
CNSTI4 2352
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ASGNP4
line 5102
;5101:
;5102:	if (!lname)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2137
line 5103
;5103:	{
line 5104
;5104:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2119
JUMPV
LABELV $2136
line 5108
;5105:	}
;5106:
;5107:	while (i < bs->lovednum)
;5108:	{
line 5109
;5109:		if (strcmp(bs->loved[i].name, lname) == 0)
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2139
line 5110
;5110:		{
line 5111
;5111:			return bs->loved[i].level;
CNSTI4 68
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $2119
JUMPV
LABELV $2139
line 5114
;5112:		}
;5113:
;5114:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5115
;5115:	}
LABELV $2137
line 5107
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
LTI4 $2136
line 5117
;5116:
;5117:	return 0;
CNSTI4 0
RETI4
LABELV $2119
endproc GetLoveLevel 20 8
export BotLovedOneDied
proc BotLovedOneDied 40 12
line 5121
;5118:}
;5119:
;5120:void BotLovedOneDied(bot_state_t *bs, bot_state_t *loved, int lovelevel)
;5121:{
line 5122
;5122:	if (!loved->lastHurt || !loved->lastHurt->client ||
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $2145
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $2145
ADDRLP4 4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2142
LABELV $2145
line 5124
;5123:		loved->lastHurt->s.number == loved->client)
;5124:	{
line 5125
;5125:		return;
ADDRGP4 $2141
JUMPV
LABELV $2142
line 5128
;5126:	}
;5127:
;5128:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $2146
line 5129
;5129:	{ //There is no love in 1-on-1
line 5130
;5130:		return;
ADDRGP4 $2141
JUMPV
LABELV $2146
line 5133
;5131:	}
;5132:
;5133:	if (!IsTeamplay())
ADDRLP4 12
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2149
line 5134
;5134:	{
line 5135
;5135:		if (lovelevel < 2)
ADDRFP4 8
INDIRI4
CNSTI4 2
GEI4 $2150
line 5136
;5136:		{
line 5137
;5137:			return;
ADDRGP4 $2141
JUMPV
line 5139
;5138:		}
;5139:	}
LABELV $2149
line 5140
;5140:	else if (OnSameTeam(&g_entities[bs->client], loved->lastHurt))
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2153
line 5141
;5141:	{ //don't hate teammates no matter what
line 5142
;5142:		return;
ADDRGP4 $2141
JUMPV
LABELV $2153
LABELV $2150
line 5145
;5143:	}
;5144:
;5145:	if (loved->client == loved->lastHurt->s.number)
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
INDIRI4
NEI4 $2155
line 5146
;5146:	{
line 5147
;5147:		return;
ADDRGP4 $2141
JUMPV
LABELV $2155
line 5150
;5148:	}
;5149:
;5150:	if (bs->client == loved->lastHurt->s.number)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
INDIRI4
NEI4 $2157
line 5151
;5151:	{ //oops!
line 5152
;5152:		return;
ADDRGP4 $2141
JUMPV
LABELV $2157
line 5155
;5153:	}
;5154:	
;5155:	trap_Cvar_Update(&bot_attachments);
ADDRGP4 bot_attachments
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5157
;5156:
;5157:	if (!bot_attachments.integer)
ADDRGP4 bot_attachments+12
INDIRI4
CNSTI4 0
NEI4 $2159
line 5158
;5158:	{
line 5159
;5159:		return;
ADDRGP4 $2141
JUMPV
LABELV $2159
line 5162
;5160:	}
;5161:
;5162:	if (!PassLovedOneCheck(bs, loved->lastHurt))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2162
line 5163
;5163:	{ //a loved one killed a loved one.. you cannot hate them
line 5164
;5164:		bs->chatObject = loved->lastHurt;
ADDRFP4 0
INDIRP4
CNSTI4 2244
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5165
;5165:		bs->chatAltObject = &g_entities[loved->client];
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTI4 2352
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5166
;5166:		BotDoChat(bs, "LovedOneKilledLovedOne", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2164
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5167
;5167:		return;
ADDRGP4 $2141
JUMPV
LABELV $2162
line 5170
;5168:	}
;5169:
;5170:	if (bs->revengeEnemy == loved->lastHurt)
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
CVPU4 4
NEU4 $2165
line 5171
;5171:	{
line 5172
;5172:		if (bs->revengeHateLevel < bs->loved_death_thresh)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 2616
ADDP4
INDIRI4
GEI4 $2166
line 5173
;5173:		{
line 5174
;5174:			bs->revengeHateLevel++;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5176
;5175:
;5176:			if (bs->revengeHateLevel == bs->loved_death_thresh)
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 2616
ADDP4
INDIRI4
NEI4 $2166
line 5177
;5177:			{
line 5180
;5178:				//broke into the highest anger level
;5179:				//CHAT: Hatred section
;5180:				bs->chatObject = loved->lastHurt;
ADDRFP4 0
INDIRP4
CNSTI4 2244
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5181
;5181:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 5182
;5182:				BotDoChat(bs, "Hatred", 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2171
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5183
;5183:			}
line 5184
;5184:		}
line 5185
;5185:	}
ADDRGP4 $2166
JUMPV
LABELV $2165
line 5186
;5186:	else if (bs->revengeHateLevel < bs->loved_death_thresh-1)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1864
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 2616
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $2172
line 5187
;5187:	{ //only switch hatred if we don't hate the existing revenge-enemy too much
line 5189
;5188:		//CHAT: BelovedKilled section
;5189:		bs->chatObject = &g_entities[loved->client];
ADDRFP4 0
INDIRP4
CNSTI4 2244
ADDP4
CNSTI4 2352
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5190
;5190:		bs->chatAltObject = loved->lastHurt;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5191
;5191:		BotDoChat(bs, "BelovedKilled", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2174
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5192
;5192:		bs->revengeHateLevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
CNSTI4 0
ASGNI4
line 5193
;5193:		bs->revengeEnemy = loved->lastHurt;
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5194
;5194:	}
LABELV $2172
LABELV $2166
line 5195
;5195:}
LABELV $2141
endproc BotLovedOneDied 40 12
export BotDeathNotify
proc BotDeathNotify 20 12
line 5198
;5196:
;5197:void BotDeathNotify(bot_state_t *bs)
;5198:{ //in case someone has an emotional attachment to us, we'll notify them
line 5199
;5199:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5200
;5200:	int ltest = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2177
JUMPV
LABELV $2176
line 5203
;5201:
;5202:	while (i < MAX_CLIENTS)
;5203:	{
line 5204
;5204:		if (botstates[i] && botstates[i]->lovednum)
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2179
ADDRLP4 8
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2179
line 5205
;5205:		{
line 5206
;5206:			ltest = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2182
JUMPV
LABELV $2181
line 5208
;5207:			while (ltest < botstates[i]->lovednum)
;5208:			{
line 5209
;5209:				if (strcmp(level.clients[bs->client].pers.netname, botstates[i]->loved[ltest].name) == 0)
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2184
line 5210
;5210:				{
line 5211
;5211:					BotLovedOneDied(botstates[i], bs, botstates[i]->loved[ltest].level);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 68
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 2340
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotLovedOneDied
CALLV
pop
line 5212
;5212:					break;
ADDRGP4 $2183
JUMPV
LABELV $2184
line 5215
;5213:				}
;5214:
;5215:				ltest++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5216
;5216:			}
LABELV $2182
line 5207
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2612
ADDP4
INDIRI4
LTI4 $2181
LABELV $2183
line 5217
;5217:		}
LABELV $2179
line 5219
;5218:
;5219:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5220
;5220:	}
LABELV $2177
line 5202
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2176
line 5221
;5221:}
LABELV $2175
endproc BotDeathNotify 20 12
export StrafeTracing
proc StrafeTracing 1156 28
line 5224
;5222:
;5223:void StrafeTracing(bot_state_t *bs)
;5224:{
line 5229
;5225:	vec3_t mins, maxs;
;5226:	vec3_t right, rorg, drorg;
;5227:	trace_t tr;
;5228:
;5229:	mins[0] = -15;
ADDRLP4 12
CNSTF4 3245342720
ASGNF4
line 5230
;5230:	mins[1] = -15;
ADDRLP4 12+4
CNSTF4 3245342720
ASGNF4
line 5232
;5231:	//mins[2] = -24;
;5232:	mins[2] = -22;
ADDRLP4 12+8
CNSTF4 3249537024
ASGNF4
line 5233
;5233:	maxs[0] = 15;
ADDRLP4 24
CNSTF4 1097859072
ASGNF4
line 5234
;5234:	maxs[1] = 15;
ADDRLP4 24+4
CNSTF4 1097859072
ASGNF4
line 5235
;5235:	maxs[2] = 32;
ADDRLP4 24+8
CNSTF4 1107296256
ASGNF4
line 5237
;5236:
;5237:	AngleVectors(bs->viewangles, NULL, right, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRLP4 1140
CNSTP4 0
ASGNP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 5239
;5238:
;5239:	if (bs->meleeStrafeDir)
ADDRFP4 0
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2191
line 5240
;5240:	{
line 5241
;5241:		rorg[0] = bs->origin[0] - right[0]*32;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36
INDIRF4
MULF4
SUBF4
ASGNF4
line 5242
;5242:		rorg[1] = bs->origin[1] - right[1]*32;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 5243
;5243:		rorg[2] = bs->origin[2] - right[2]*32;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 5244
;5244:	}
ADDRGP4 $2192
JUMPV
LABELV $2191
line 5246
;5245:	else
;5246:	{
line 5247
;5247:		rorg[0] = bs->origin[0] + right[0]*32;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36
INDIRF4
MULF4
ADDF4
ASGNF4
line 5248
;5248:		rorg[1] = bs->origin[1] + right[1]*32;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5249
;5249:		rorg[2] = bs->origin[2] + right[2]*32;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5250
;5250:	}
LABELV $2192
line 5252
;5251:
;5252:	JP_Trace(&tr, bs->origin, mins, maxs, rorg, bs->client, MASK_SOLID);
ADDRLP4 48
ARGP4
ADDRLP4 1144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1144
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 5254
;5253:
;5254:	if (tr.fraction != 1)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
EQF4 $2201
line 5255
;5255:	{
line 5256
;5256:		bs->meleeStrafeDisable = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 500, 1500, qfalse, 1000);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 500
ARGI4
CNSTI4 1500
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 1148
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2260
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 1148
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 5257
;5257:	}
LABELV $2201
line 5259
;5258:
;5259:	VectorCopy(rorg, drorg);
ADDRLP4 1128
ADDRLP4 0
INDIRB
ASGNB 12
line 5261
;5260:
;5261:	drorg[2] -= 32;
ADDRLP4 1128+8
ADDRLP4 1128+8
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 5263
;5262:
;5263:	JP_Trace(&tr, rorg, NULL, NULL, drorg, bs->client, MASK_SOLID);
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1148
CNSTP4 0
ASGNP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1128
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 5265
;5264:
;5265:	if (tr.fraction == 1)
ADDRLP4 48+8
INDIRF4
CNSTF4 1065353216
NEF4 $2206
line 5266
;5266:	{ //this may be a dangerous ledge, so don't strafe over it just in case
line 5267
;5267:		bs->meleeStrafeDisable = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 500, 1500, qfalse, 1000);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 500
ARGI4
CNSTI4 1500
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 1152
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2260
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 1152
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 5268
;5268:	}
LABELV $2206
line 5269
;5269:}
LABELV $2186
endproc StrafeTracing 1156 28
export PrimFiring
proc PrimFiring 8 0
line 5272
;5270:
;5271:int PrimFiring(bot_state_t *bs)
;5272:{
line 5273
;5273:	if (bs->cur_ps.weaponstate != WEAPON_CHARGING &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
EQI4 $2211
ADDRLP4 0
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2211
line 5275
;5274:		bs->doAttack)
;5275:	{
line 5276
;5276:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2210
JUMPV
LABELV $2211
line 5279
;5277:	}
;5278:
;5279:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2213
ADDRLP4 4
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2213
line 5281
;5280:		!bs->doAttack)
;5281:	{
line 5282
;5282:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2210
JUMPV
LABELV $2213
line 5285
;5283:	}
;5284:
;5285:	return 0;
CNSTI4 0
RETI4
LABELV $2210
endproc PrimFiring 8 0
export KeepPrimFromFiring
proc KeepPrimFromFiring 8 0
line 5289
;5286:}
;5287:
;5288:int KeepPrimFromFiring(bot_state_t *bs)
;5289:{
line 5290
;5290:	if (bs->cur_ps.weaponstate != WEAPON_CHARGING &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
EQI4 $2216
ADDRLP4 0
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2216
line 5292
;5291:		bs->doAttack)
;5292:	{
line 5293
;5293:		bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 5294
;5294:	}
LABELV $2216
line 5296
;5295:
;5296:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2218
ADDRLP4 4
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2218
line 5298
;5297:		!bs->doAttack)
;5298:	{
line 5299
;5299:		bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 5300
;5300:	}
LABELV $2218
line 5302
;5301:
;5302:	return 0;
CNSTI4 0
RETI4
LABELV $2215
endproc KeepPrimFromFiring 8 0
export AltFiring
proc AltFiring 8 0
line 5306
;5303:}
;5304:
;5305:int AltFiring(bot_state_t *bs)
;5306:{
line 5307
;5307:	if (bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
EQI4 $2221
ADDRLP4 0
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2221
line 5309
;5308:		bs->doAltAttack)
;5309:	{
line 5310
;5310:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2220
JUMPV
LABELV $2221
line 5313
;5311:	}
;5312:
;5313:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2223
ADDRLP4 4
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2223
line 5315
;5314:		!bs->doAltAttack)
;5315:	{
line 5316
;5316:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2220
JUMPV
LABELV $2223
line 5319
;5317:	}
;5318:
;5319:	return 0;
CNSTI4 0
RETI4
LABELV $2220
endproc AltFiring 8 0
export KeepAltFromFiring
proc KeepAltFromFiring 8 0
line 5323
;5320:}
;5321:
;5322:int KeepAltFromFiring(bot_state_t *bs)
;5323:{
line 5324
;5324:	if (bs->cur_ps.weaponstate != WEAPON_CHARGING_ALT &&
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
EQI4 $2226
ADDRLP4 0
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2226
line 5326
;5325:		bs->doAltAttack)
;5326:	{
line 5327
;5327:		bs->doAltAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 0
ASGNI4
line 5328
;5328:	}
LABELV $2226
line 5330
;5329:
;5330:	if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2228
ADDRLP4 4
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2228
line 5332
;5331:		!bs->doAltAttack)
;5332:	{
line 5333
;5333:		bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 5334
;5334:	}
LABELV $2228
line 5336
;5335:
;5336:	return 0;
CNSTI4 0
RETI4
LABELV $2225
endproc KeepAltFromFiring 8 0
export CheckForFriendInLOF
proc CheckForFriendInLOF 1172 28
line 5340
;5337:}
;5338:
;5339:gentity_t *CheckForFriendInLOF(bot_state_t *bs)
;5340:{
line 5347
;5341:	vec3_t fwd;
;5342:	vec3_t trfrom, trto;
;5343:	vec3_t mins, maxs;
;5344:	gentity_t *trent;
;5345:	trace_t tr;
;5346:
;5347:	mins[0] = -3;
ADDRLP4 36
CNSTF4 3225419776
ASGNF4
line 5348
;5348:	mins[1] = -3;
ADDRLP4 36+4
CNSTF4 3225419776
ASGNF4
line 5349
;5349:	mins[2] = -3;
ADDRLP4 36+8
CNSTF4 3225419776
ASGNF4
line 5351
;5350:
;5351:	maxs[0] = 3;
ADDRLP4 48
CNSTF4 1077936128
ASGNF4
line 5352
;5352:	maxs[1] = 3;
ADDRLP4 48+4
CNSTF4 1077936128
ASGNF4
line 5353
;5353:	maxs[2] = 3;
ADDRLP4 48+8
CNSTF4 1077936128
ASGNF4
line 5355
;5354:
;5355:	AngleVectors(bs->viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1144
CNSTP4 0
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 5357
;5356:
;5357:	VectorCopy(bs->eye, trfrom);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1744
ADDP4
INDIRB
ASGNB 12
line 5359
;5358:
;5359:	trto[0] = trfrom[0] + fwd[0]*2048;
ADDRLP4 24
ADDRLP4 0
INDIRF4
CNSTF4 1157627904
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 5360
;5360:	trto[1] = trfrom[1] + fwd[1]*2048;
ADDRLP4 24+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1157627904
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5361
;5361:	trto[2] = trfrom[2] + fwd[2]*2048;
ADDRLP4 24+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1157627904
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5363
;5362:
;5363:	JP_Trace(&tr, trfrom, mins, maxs, trto, bs->client, MASK_PLAYERSOLID);
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 5365
;5364:
;5365:	if (tr.fraction != 1 && tr.entityNum < MAX_CLIENTS)
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
EQF4 $2241
ADDRLP4 60+52
INDIRI4
CNSTI4 32
GEI4 $2241
line 5366
;5366:	{
line 5367
;5367:		trent = &g_entities[tr.entityNum];
ADDRLP4 1140
CNSTI4 2352
ADDRLP4 60+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5369
;5368:
;5369:		if (trent && trent->client)
ADDRLP4 1148
ADDRLP4 1140
INDIRP4
ASGNP4
ADDRLP4 1152
CNSTU4 0
ASGNU4
ADDRLP4 1148
INDIRP4
CVPU4 4
ADDRLP4 1152
INDIRU4
EQU4 $2246
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1152
INDIRU4
EQU4 $2246
line 5370
;5370:		{
line 5371
;5371:			if (IsTeamplay() && OnSameTeam(&g_entities[bs->client], trent))
ADDRLP4 1156
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
EQI4 $2248
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 1160
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
EQI4 $2248
line 5372
;5372:			{
line 5373
;5373:				return trent;
ADDRLP4 1140
INDIRP4
RETP4
ADDRGP4 $2230
JUMPV
LABELV $2248
line 5376
;5374:			}
;5375:
;5376:			if (botstates[trent->s.number] && GetLoveLevel(bs, botstates[trent->s.number]) > 1)
ADDRLP4 1164
ADDRLP4 1140
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2250
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 GetLoveLevel
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 1
LEI4 $2250
line 5377
;5377:			{
line 5378
;5378:				return trent;
ADDRLP4 1140
INDIRP4
RETP4
ADDRGP4 $2230
JUMPV
LABELV $2250
line 5380
;5379:			}
;5380:		}
LABELV $2246
line 5381
;5381:	}
LABELV $2241
line 5383
;5382:
;5383:	return NULL;
CNSTP4 0
RETP4
LABELV $2230
endproc CheckForFriendInLOF 1172 28
export BotScanForLeader
proc BotScanForLeader 36 8
line 5387
;5384:}
;5385:
;5386:void BotScanForLeader(bot_state_t *bs)
;5387:{ //bots will only automatically obtain a leader if it's another bot using this method.
line 5388
;5388:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5391
;5389:	gentity_t *ent;
;5390:
;5391:	if (bs->isSquadLeader)
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2256
line 5392
;5392:	{
line 5393
;5393:		return;
ADDRGP4 $2252
JUMPV
LABELV $2255
line 5397
;5394:	}
;5395:
;5396:	while (i < MAX_CLIENTS)
;5397:	{
line 5398
;5398:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5400
;5399:
;5400:		if (ent && ent->client && botstates[i] && botstates[i]->isSquadLeader && bs->client != i)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $2258
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $2258
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $2258
ADDRLP4 20
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2258
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $2258
line 5401
;5401:		{
line 5402
;5402:			if (OnSameTeam(&g_entities[bs->client], ent))
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $2260
line 5403
;5403:			{
line 5404
;5404:				bs->squadLeader = ent;
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 5405
;5405:				break;
ADDRGP4 $2257
JUMPV
LABELV $2260
line 5407
;5406:			}
;5407:			if (GetLoveLevel(bs, botstates[i]) > 1 && !IsTeamplay())
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 GetLoveLevel
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
LEI4 $2262
ADDRLP4 32
ADDRGP4 IsTeamplay
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $2262
line 5408
;5408:			{ //ignore love status regarding squad leaders if we're in teamplay
line 5409
;5409:				bs->squadLeader = ent;
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 5410
;5410:				break;
ADDRGP4 $2257
JUMPV
LABELV $2262
line 5412
;5411:			}
;5412:		}
LABELV $2258
line 5414
;5413:
;5414:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5415
;5415:	}
LABELV $2256
line 5396
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2255
LABELV $2257
line 5416
;5416:}
LABELV $2252
endproc BotScanForLeader 36 8
export BotReplyGreetings
proc BotReplyGreetings 20 12
line 5419
;5417:
;5418:void BotReplyGreetings(bot_state_t *bs)
;5419:{
line 5420
;5420:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5421
;5421:	int numhello = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2266
JUMPV
LABELV $2265
line 5424
;5422:
;5423:	while (i < MAX_CLIENTS)
;5424:	{
line 5425
;5425:		if (botstates[i] &&
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2268
ADDRLP4 12
INDIRP4
CNSTI4 2092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2268
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $2268
line 5428
;5426:			botstates[i]->canChat &&
;5427:			i != bs->client)
;5428:		{
line 5429
;5429:			botstates[i]->chatObject = &g_entities[bs->client];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2244
ADDP4
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5430
;5430:			botstates[i]->chatAltObject = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 5431
;5431:			if (BotDoChat(botstates[i], "ResponseGreetings", 0))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 $2272
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 BotDoChat
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2270
line 5432
;5432:			{
line 5433
;5433:				numhello++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5434
;5434:			}
LABELV $2270
line 5435
;5435:		}
LABELV $2268
line 5437
;5436:
;5437:		if (numhello > 3)
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $2273
line 5438
;5438:		{ //don't let more than 4 bots say hello at once
line 5439
;5439:			return;
ADDRGP4 $2264
JUMPV
LABELV $2273
line 5442
;5440:		}
;5441:
;5442:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5443
;5443:	}
LABELV $2266
line 5423
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2265
line 5444
;5444:}
LABELV $2264
endproc BotReplyGreetings 20 12
export CTFFlagMovement
proc CTFFlagMovement 1184 28
line 5447
;5445:
;5446:void CTFFlagMovement(bot_state_t *bs)
;5447:{
line 5448
;5448:	int diddrop = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 5449
;5449:	gentity_t *desiredDrop = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 5453
;5450:	vec3_t a, mins, maxs;
;5451:	trace_t tr;
;5452:
;5453:	mins[0] = -15;
ADDRLP4 0
CNSTF4 3245342720
ASGNF4
line 5454
;5454:	mins[1] = -15;
ADDRLP4 0+4
CNSTF4 3245342720
ASGNF4
line 5455
;5455:	mins[2] = -7;
ADDRLP4 0+8
CNSTF4 3235905536
ASGNF4
line 5456
;5456:	maxs[0] = 15;
ADDRLP4 12
CNSTF4 1097859072
ASGNF4
line 5457
;5457:	maxs[1] = 15;
ADDRLP4 12+4
CNSTF4 1097859072
ASGNF4
line 5458
;5458:	maxs[2] = 7;
ADDRLP4 12+8
CNSTF4 1088421888
ASGNF4
line 5460
;5459:
;5460:	if (bs->wantFlag && (bs->wantFlag->flags & FL_DROPPED_ITEM))
ADDRLP4 1124
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2280
ADDRLP4 1124
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2280
line 5461
;5461:	{
line 5462
;5462:		if (bs->staticFlagSpot[0] == bs->wantFlag->s.pos.trBase[0] &&
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
ADDRLP4 1128
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 1852
ADDP4
INDIRF4
ADDRLP4 1132
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
NEF4 $2282
ADDRLP4 1128
INDIRP4
CNSTI4 1856
ADDP4
INDIRF4
ADDRLP4 1132
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
NEF4 $2282
ADDRLP4 1128
INDIRP4
CNSTI4 1860
ADDP4
INDIRF4
ADDRLP4 1132
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
NEF4 $2282
line 5465
;5463:			bs->staticFlagSpot[1] == bs->wantFlag->s.pos.trBase[1] &&
;5464:			bs->staticFlagSpot[2] == bs->wantFlag->s.pos.trBase[2])
;5465:		{
line 5466
;5466:			VectorSubtract(bs->origin, bs->wantFlag->s.pos.trBase, a);
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
ADDRLP4 1136
INDIRP4
CNSTI4 1836
ADDP4
ASGNP4
ADDRLP4 32
ADDRLP4 1136
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 1136
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1140
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32+8
ADDRLP4 1144
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 1144
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5468
;5467:
;5468:			if (VectorLength(a) <= BOT_FLAG_GET_DISTANCE)
ADDRLP4 32
ARGP4
ADDRLP4 1148
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1148
INDIRF4
CNSTF4 1132462080
GTF4 $2286
line 5469
;5469:			{
line 5470
;5470:				VectorCopy(bs->wantFlag->s.pos.trBase, bs->goalPosition);
ADDRLP4 1152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 1152
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 5471
;5471:				return;
ADDRGP4 $2275
JUMPV
LABELV $2286
line 5474
;5472:			}
;5473:			else
;5474:			{
line 5475
;5475:				bs->wantFlag = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
CNSTP4 0
ASGNP4
line 5476
;5476:			}
line 5477
;5477:		}
ADDRGP4 $2281
JUMPV
LABELV $2282
line 5479
;5478:		else
;5479:		{
line 5480
;5480:			bs->wantFlag = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
CNSTP4 0
ASGNP4
line 5481
;5481:		}
line 5482
;5482:	}
ADDRGP4 $2281
JUMPV
LABELV $2280
line 5483
;5483:	else if (bs->wantFlag)
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2288
line 5484
;5484:	{
line 5485
;5485:		bs->wantFlag = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1836
ADDP4
CNSTP4 0
ASGNP4
line 5486
;5486:	}
LABELV $2288
LABELV $2281
line 5488
;5487:
;5488:	if (flagRed && flagBlue)
ADDRLP4 1128
CNSTU4 0
ASGNU4
ADDRGP4 flagRed
INDIRP4
CVPU4 4
ADDRLP4 1128
INDIRU4
EQU4 $2290
ADDRGP4 flagBlue
INDIRP4
CVPU4 4
ADDRLP4 1128
INDIRU4
EQU4 $2290
line 5489
;5489:	{
line 5490
;5490:		if (bs->wpDestination == flagRed ||
ADDRLP4 1132
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 1132
INDIRU4
ADDRGP4 flagRed
INDIRP4
CVPU4 4
EQU4 $2294
ADDRLP4 1132
INDIRU4
ADDRGP4 flagBlue
INDIRP4
CVPU4 4
NEU4 $2292
LABELV $2294
line 5492
;5491:			bs->wpDestination == flagBlue)
;5492:		{
line 5493
;5493:			if (bs->wpDestination == flagRed && droppedRedFlag && (droppedRedFlag->flags & FL_DROPPED_ITEM) && droppedRedFlag->classname && strcmp(droppedRedFlag->classname, "freed") != 0)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 flagRed
INDIRP4
CVPU4 4
NEU4 $2295
ADDRLP4 1136
ADDRGP4 droppedRedFlag
INDIRP4
ASGNP4
ADDRLP4 1140
CNSTU4 0
ASGNU4
ADDRLP4 1136
INDIRP4
CVPU4 4
ADDRLP4 1140
INDIRU4
EQU4 $2295
ADDRLP4 1136
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2295
ADDRLP4 1144
ADDRLP4 1136
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CVPU4 4
ADDRLP4 1140
INDIRU4
EQU4 $2295
ADDRLP4 1144
INDIRP4
ARGP4
ADDRGP4 $2297
ARGP4
ADDRLP4 1148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
EQI4 $2295
line 5494
;5494:			{
line 5495
;5495:				desiredDrop = droppedRedFlag;
ADDRLP4 24
ADDRGP4 droppedRedFlag
INDIRP4
ASGNP4
line 5496
;5496:				diddrop = 1;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 5497
;5497:			}
LABELV $2295
line 5498
;5498:			if (bs->wpDestination == flagBlue && droppedBlueFlag && (droppedBlueFlag->flags & FL_DROPPED_ITEM) && droppedBlueFlag->classname && strcmp(droppedBlueFlag->classname, "freed") != 0)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 flagBlue
INDIRP4
CVPU4 4
NEU4 $2298
ADDRLP4 1152
ADDRGP4 droppedBlueFlag
INDIRP4
ASGNP4
ADDRLP4 1156
CNSTU4 0
ASGNU4
ADDRLP4 1152
INDIRP4
CVPU4 4
ADDRLP4 1156
INDIRU4
EQU4 $2298
ADDRLP4 1152
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2298
ADDRLP4 1160
ADDRLP4 1152
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CVPU4 4
ADDRLP4 1156
INDIRU4
EQU4 $2298
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 $2297
ARGP4
ADDRLP4 1164
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
EQI4 $2298
line 5499
;5499:			{
line 5500
;5500:				desiredDrop = droppedBlueFlag;
ADDRLP4 24
ADDRGP4 droppedBlueFlag
INDIRP4
ASGNP4
line 5501
;5501:				diddrop = 1;
ADDRLP4 28
CNSTI4 1
ASGNI4
line 5502
;5502:			}
LABELV $2298
line 5504
;5503:
;5504:			if (diddrop && desiredDrop)
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2300
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2300
line 5505
;5505:			{
line 5506
;5506:				VectorSubtract(bs->origin, desiredDrop->s.pos.trBase, a);
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1172
ADDRLP4 24
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 1168
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 1172
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 1168
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 1172
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5508
;5507:
;5508:				if (VectorLength(a) <= BOT_FLAG_GET_DISTANCE)
ADDRLP4 32
ARGP4
ADDRLP4 1176
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1176
INDIRF4
CNSTF4 1132462080
GTF4 $2304
line 5509
;5509:				{
line 5510
;5510:					JP_Trace(&tr, bs->origin, mins, maxs, desiredDrop->s.pos.trBase, bs->client, MASK_SOLID);
ADDRLP4 44
ARGP4
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 1180
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 5512
;5511:
;5512:					if (tr.fraction == 1 || tr.entityNum == desiredDrop->s.number)
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
EQF4 $2310
ADDRLP4 44+52
INDIRI4
ADDRLP4 24
INDIRP4
INDIRI4
NEI4 $2306
LABELV $2310
line 5513
;5513:					{
line 5514
;5514:						VectorCopy(desiredDrop->s.pos.trBase, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 5515
;5515:						VectorCopy(desiredDrop->s.pos.trBase, bs->staticFlagSpot);
ADDRFP4 0
INDIRP4
CNSTI4 1852
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 5516
;5516:						return;
LABELV $2306
line 5518
;5517:					}
;5518:				}
LABELV $2304
line 5519
;5519:			}
LABELV $2300
line 5520
;5520:		}
LABELV $2292
line 5521
;5521:	}
LABELV $2290
line 5522
;5522:}
LABELV $2275
endproc CTFFlagMovement 1184 28
export BotCheckDetPacks
proc BotCheckDetPacks 84 12
line 5525
;5523:
;5524:void BotCheckDetPacks(bot_state_t *bs)
;5525:{
line 5526
;5526:	gentity_t *dp = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 5527
;5527:	gentity_t *myDet = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRGP4 $2313
JUMPV
LABELV $2312
line 5533
;5528:	vec3_t a;
;5529:	float enLen;
;5530:	float myLen;
;5531:
;5532:	while ( (dp = G_FindByClassNameFast( dp, "detpack") ) != NULL )
;5533:	{
line 5534
;5534:		if (dp && dp->parent && dp->parent->s.number == bs->client)
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $2316
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $2316
ADDRLP4 36
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2316
line 5535
;5535:		{
line 5536
;5536:			myDet = dp;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 5537
;5537:			break;
ADDRGP4 $2314
JUMPV
LABELV $2316
line 5539
;5538:		}
;5539:	}
LABELV $2313
line 5532
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $2315
ARGP4
ADDRLP4 28
ADDRGP4 G_FindByClassNameFast
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
NEU4 $2312
LABELV $2314
line 5541
;5540:
;5541:	if (!myDet)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2318
line 5542
;5542:	{
line 5543
;5543:		return;
ADDRGP4 $2311
JUMPV
LABELV $2318
line 5546
;5544:	}
;5545:
;5546:	if (!bs->currentEnemy || !bs->currentEnemy->client || !bs->frame_Enemy_Vis)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $2323
ADDRLP4 36
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $2323
ADDRLP4 32
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2320
LABELV $2323
line 5547
;5547:	{ //require the enemy to be visilbe just to be fair..
line 5550
;5548:
;5549:		//unless..
;5550:		if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
CNSTU4 0
ASGNU4
ADDRLP4 48
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $2311
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $2311
ADDRGP4 level+36
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 2300
ADDP4
INDIRI4
SUBI4
CNSTI4 5000
GEI4 $2311
line 5552
;5551:			(level.time - bs->plantContinue) < 5000)
;5552:		{ //it's a fresh plant (within 5 seconds) so we should be able to guess
line 5553
;5553:			goto stillmadeit;
line 5555
;5554:		}
;5555:		return;
LABELV $2320
LABELV $2327
line 5560
;5556:	}
;5557:
;5558:stillmadeit:
;5559:
;5560:	VectorSubtract(bs->currentEnemy->client->ps.origin, myDet->s.pos.trBase, a);
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 48
CNSTI4 408
ASGNI4
ADDRLP4 56
CNSTI4 24
ASGNI4
ADDRLP4 8
ADDRLP4 44
INDIRP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 44
INDIRP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5561
;5561:	enLen = VectorLength(a);
ADDRLP4 8
ARGP4
ADDRLP4 60
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 60
INDIRF4
ASGNF4
line 5563
;5562:
;5563:	VectorSubtract(bs->origin, myDet->s.pos.trBase, a);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 64
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 64
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5564
;5564:	myLen = VectorLength(a);
ADDRLP4 8
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 72
INDIRF4
ASGNF4
line 5566
;5565:
;5566:	if (enLen > myLen)
ADDRLP4 20
INDIRF4
ADDRLP4 24
INDIRF4
LEF4 $2332
line 5567
;5567:	{
line 5568
;5568:		return;
ADDRGP4 $2311
JUMPV
LABELV $2332
line 5571
;5569:	}
;5570:
;5571:	if (enLen < BOT_PLANT_BLOW_DISTANCE && OrgVisible(bs->currentEnemy->client->ps.origin, myDet->s.pos.trBase, bs->currentEnemy->s.number))
ADDRLP4 20
INDIRF4
CNSTF4 1132462080
GEF4 $2334
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $2334
line 5572
;5572:	{ //we could just call the "blow all my detpacks" function here, but I guess that's cheating.
line 5573
;5573:		bs->plantKillEmAll = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 2304
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 5574
;5574:	}
LABELV $2334
line 5575
;5575:}
LABELV $2311
endproc BotCheckDetPacks 84 12
export BotUseInventoryItem
proc BotUseInventoryItem 12 8
line 5578
;5576:
;5577:int BotUseInventoryItem(bot_state_t *bs)
;5578:{
line 5579
;5579:	if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_MEDPAC))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $2338
line 5580
;5580:	{
line 5581
;5581:		if (g_entities[bs->client].health <= 50)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2340
line 5582
;5582:		{
line 5583
;5583:			bs->cur_ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_MEDPAC, IT_HOLDABLE);
CNSTI4 3
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 0
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5584
;5584:			goto wantuseitem;
ADDRGP4 $2343
JUMPV
LABELV $2340
line 5586
;5585:		}
;5586:	}
LABELV $2338
line 5587
;5587:	if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SEEKER))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2344
line 5588
;5588:	{
line 5589
;5589:		if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2346
ADDRLP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2346
line 5590
;5590:		{
line 5591
;5591:			bs->cur_ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_SEEKER, IT_HOLDABLE);
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 4
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 5592
;5592:			goto wantuseitem;
ADDRGP4 $2343
JUMPV
LABELV $2346
line 5594
;5593:		}
;5594:	}
LABELV $2344
line 5595
;5595:	if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SENTRY_GUN))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $2348
line 5596
;5596:	{
line 5597
;5597:		if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2350
ADDRLP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2350
line 5598
;5598:		{
line 5599
;5599:			bs->cur_ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_SENTRY_GUN, IT_HOLDABLE);
ADDRLP4 4
CNSTI4 6
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 5600
;5600:			goto wantuseitem;
ADDRGP4 $2343
JUMPV
LABELV $2350
line 5602
;5601:		}
;5602:	}
LABELV $2348
line 5603
;5603:	if (bs->cur_ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SHIELD))
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2352
line 5604
;5604:	{
line 5605
;5605:		if (bs->currentEnemy && bs->frame_Enemy_Vis && bs->runningToEscapeThreat)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2354
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2354
ADDRLP4 0
INDIRP4
CNSTI4 2312
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2354
line 5606
;5606:		{ //this will (hopefully) result in the bot placing the shield down while facing
line 5608
;5607:		  //the enemy and running away
;5608:			bs->cur_ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_SHIELD, IT_HOLDABLE);
CNSTI4 2
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 5609
;5609:			goto wantuseitem;
ADDRGP4 $2343
JUMPV
LABELV $2354
line 5611
;5610:		}
;5611:	}
LABELV $2352
line 5613
;5612:
;5613:	return 0;
CNSTI4 0
RETI4
ADDRGP4 $2337
JUMPV
LABELV $2343
line 5616
;5614:
;5615:wantuseitem:
;5616:	level.clients[bs->client].ps.stats[STAT_HOLDABLE_ITEM] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM];
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 53196
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 220
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 5618
;5617:
;5618:	return 1;
CNSTI4 1
RETI4
LABELV $2337
endproc BotUseInventoryItem 12 8
export BotSurfaceNear
proc BotSurfaceNear 1104 28
line 5622
;5619:}
;5620:
;5621:int BotSurfaceNear(bot_state_t *bs)
;5622:{
line 5626
;5623:	trace_t tr;
;5624:	vec3_t fwd;
;5625:
;5626:	AngleVectors(bs->viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1092
CNSTP4 0
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 5628
;5627:
;5628:	fwd[0] = bs->origin[0]+(fwd[0]*64);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 5629
;5629:	fwd[1] = bs->origin[1]+(fwd[1]*64);
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 5630
;5630:	fwd[2] = bs->origin[2]+(fwd[2]*64);
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 5632
;5631:
;5632:	JP_Trace(&tr, bs->origin, NULL, NULL, fwd, bs->client, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 1100
CNSTP4 0
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 5634
;5633:
;5634:	if (tr.fraction != 1)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $2361
line 5635
;5635:	{
line 5636
;5636:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $2356
JUMPV
LABELV $2361
line 5639
;5637:	}
;5638:
;5639:	return 0;
CNSTI4 0
RETI4
LABELV $2356
endproc BotSurfaceNear 1104 28
export BotWeaponBlockable
proc BotWeaponBlockable 4 0
line 5643
;5640:}
;5641:
;5642:int BotWeaponBlockable(int weapon)
;5643:{
line 5644
;5644:	switch (weapon)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $2365
ADDRLP4 0
INDIRI4
CNSTI4 13
GTI4 $2365
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2374-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2374
address $2367
address $2365
address $2365
address $2365
address $2368
address $2365
address $2365
address $2369
address $2365
address $2370
address $2371
address $2372
address $2373
code
line 5645
;5645:	{
LABELV $2367
line 5647
;5646:	case WP_STUN_BATON:
;5647:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2364
JUMPV
LABELV $2368
line 5649
;5648:	case WP_DISRUPTOR:
;5649:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2364
JUMPV
LABELV $2369
line 5651
;5650:	case WP_DEMP2:
;5651:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2364
JUMPV
LABELV $2370
line 5653
;5652:	case WP_ROCKET_LAUNCHER:
;5653:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2364
JUMPV
LABELV $2371
line 5655
;5654:	case WP_THERMAL:
;5655:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2364
JUMPV
LABELV $2372
line 5657
;5656:	case WP_TRIP_MINE:
;5657:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2364
JUMPV
LABELV $2373
line 5659
;5658:	case WP_DET_PACK:
;5659:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2364
JUMPV
LABELV $2365
line 5661
;5660:	default:
;5661:		return 1;
CNSTI4 1
RETI4
LABELV $2364
endproc BotWeaponBlockable 4 0
export StandardBotAI
proc StandardBotAI 408 24
line 5669
;5662:	}
;5663:}
;5664:
;5665:void Cmd_EngageDuel_f(gentity_t *ent);
;5666:void Cmd_ToggleSaber_f(gentity_t *ent);
;5667:
;5668:void StandardBotAI(bot_state_t *bs, float thinktime)
;5669:{
line 5673
;5670:	int wp, enemy;
;5671:	int desiredIndex;
;5672:	int goalWPIndex;
;5673:	int doingFallback = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 5678
;5674:	int fjHalt;
;5675:	vec3_t a, ang, headlevel, eorg, noz_x, noz_y, dif, a_fo;
;5676:	float reaction;
;5677:	float bLeadAmount;
;5678:	int meleestrafe = 0;
ADDRLP4 92
CNSTI4 0
ASGNI4
line 5679
;5679:	int useTheForce = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 5680
;5680:	int forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5681
;5681:	gentity_t *friendInLOF = 0;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 5683
;5682:	float mLen;
;5683:	int visResult = 0;
ADDRLP4 100
CNSTI4 0
ASGNI4
line 5684
;5684:	int selResult = 0;
ADDRLP4 104
CNSTI4 0
ASGNI4
line 5685
;5685:	int mineSelect = 0;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 5686
;5686:	int detSelect = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 5688
;5687:
;5688:	if (gDeactivated)
ADDRGP4 gDeactivated
INDIRF4
CNSTF4 0
EQF4 $2377
line 5689
;5689:	{
line 5690
;5690:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 5691
;5691:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5692
;5692:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 5693
;5693:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 5694
;5694:		return;
ADDRGP4 $2376
JUMPV
LABELV $2377
line 5697
;5695:	}
;5696:
;5697:	if (g_entities[bs->client].inuse &&
ADDRLP4 164
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 164
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2379
ADDRLP4 164
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2379
ADDRLP4 164
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2379
line 5700
;5698:		g_entities[bs->client].client &&
;5699:		g_entities[bs->client].client->sess.sessionTeam == TEAM_SPECTATOR)
;5700:	{
line 5701
;5701:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 5702
;5702:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5703
;5703:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 5704
;5704:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 5705
;5705:		return;
ADDRGP4 $2376
JUMPV
LABELV $2379
line 5708
;5706:	}
;5707:
;5708:	trap_Cvar_Update(&bot_forgimmick);
ADDRGP4 bot_forgimmick
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5709
;5709:	trap_Cvar_Update(&bot_honorableduelacceptance);
ADDRGP4 bot_honorableduelacceptance
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 5711
;5710:
;5711:	if (bot_forgimmick.integer)
ADDRGP4 bot_forgimmick+12
INDIRI4
CNSTI4 0
EQI4 $2384
line 5712
;5712:	{
line 5713
;5713:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 5714
;5714:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5715
;5715:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 5716
;5716:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 5718
;5717:
;5718:		if (bot_forgimmick.integer == 2)
ADDRGP4 bot_forgimmick+12
INDIRI4
CNSTI4 2
NEI4 $2376
line 5719
;5719:		{ //for debugging saber stuff, this is handy
line 5720
;5720:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 5721
;5721:		}
line 5722
;5722:		return;
ADDRGP4 $2376
JUMPV
LABELV $2384
line 5725
;5723:	}
;5724:
;5725:	if (!bs->lastDeadTime)
ADDRFP4 0
INDIRP4
CNSTI4 1880
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2390
line 5726
;5726:	{ //just spawned in?
line 5727
;5727:		bs->lastDeadTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1880
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 5728
;5728:	}
LABELV $2390
line 5730
;5729:
;5730:	if (g_entities[bs->client].health < 1)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2393
line 5731
;5731:	{
line 5732
;5732:		bs->lastDeadTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 1880
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 5734
;5733:
;5734:		if (!bs->deathActivitiesDone && bs->lastHurt && bs->lastHurt->client && bs->lastHurt->s.number != bs->client)
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 2620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2397
ADDRLP4 172
ADDRLP4 168
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
ADDRLP4 176
CNSTU4 0
ASGNU4
ADDRLP4 172
INDIRP4
CVPU4 4
ADDRLP4 176
INDIRU4
EQU4 $2397
ADDRLP4 172
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 176
INDIRU4
EQU4 $2397
ADDRLP4 172
INDIRP4
INDIRI4
ADDRLP4 168
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
EQI4 $2397
line 5735
;5735:		{
line 5736
;5736:			BotDeathNotify(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDeathNotify
CALLV
pop
line 5737
;5737:			if (PassLovedOneCheck(bs, bs->lastHurt))
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
ARGP4
ADDRLP4 180
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $2399
line 5738
;5738:			{
line 5740
;5739:				//CHAT: Died
;5740:				bs->chatObject = bs->lastHurt;
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CNSTI4 2244
ADDP4
ADDRLP4 188
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5741
;5741:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 5742
;5742:				BotDoChat(bs, "Died", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2401
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5743
;5743:			}
ADDRGP4 $2400
JUMPV
LABELV $2399
line 5744
;5744:			else if (!PassLovedOneCheck(bs, bs->lastHurt) &&
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ARGP4
ADDRLP4 188
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
NEI4 $2402
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
ADDRLP4 196
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2402
ADDRLP4 200
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 196
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 204
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $2402
line 5747
;5745:				botstates[bs->lastHurt->s.number] &&
;5746:				PassLovedOneCheck(botstates[bs->lastHurt->s.number], &g_entities[bs->client]))
;5747:			{ //killed by a bot that I love, but that does not love me
line 5748
;5748:				bs->chatObject = bs->lastHurt;
ADDRLP4 208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
INDIRP4
CNSTI4 2244
ADDP4
ADDRLP4 208
INDIRP4
CNSTI4 1828
ADDP4
INDIRP4
ASGNP4
line 5749
;5749:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 5750
;5750:				BotDoChat(bs, "KilledOnPurposeByLove", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2404
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 5751
;5751:			}
LABELV $2402
LABELV $2400
line 5753
;5752:
;5753:			bs->deathActivitiesDone = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2620
ADDP4
CNSTI4 1
ASGNI4
line 5754
;5754:		}
LABELV $2397
line 5756
;5755:		
;5756:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 5757
;5757:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5758
;5758:		bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 5759
;5759:		bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 5760
;5760:		bs->wpCampingTo = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2072
ADDP4
CNSTP4 0
ASGNP4
line 5761
;5761:		bs->wpStoreDest = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1892
ADDP4
CNSTP4 0
ASGNP4
line 5762
;5762:		bs->wpDestIgnoreTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1988
ADDP4
CNSTF4 0
ASGNF4
line 5763
;5763:		bs->wpDestSwitchTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1980
ADDP4
CNSTF4 0
ASGNF4
line 5764
;5764:		bs->wpSeenTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
CNSTF4 0
ASGNF4
line 5765
;5765:		bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 5767
;5766:
;5767:		if (rand()%10 < 5 &&
ADDRLP4 180
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $2376
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2408
ADDRLP4 184
INDIRP4
CNSTI4 2228
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $2376
LABELV $2408
line 5769
;5768:			(!bs->doChat || bs->chatTime < level.time))
;5769:		{
line 5770
;5770:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 5771
;5771:		}
line 5773
;5772:
;5773:		return;
ADDRGP4 $2376
JUMPV
LABELV $2393
line 5776
;5774:	}
;5775:
;5776:	bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 5777
;5777:	bs->doAltAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 0
ASGNI4
line 5780
;5778:	//reset the attack states
;5779:
;5780:	if (bs->isSquadLeader)
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2409
line 5781
;5781:	{
line 5782
;5782:		CommanderBotAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CommanderBotAI
CALLV
pop
line 5783
;5783:	}
ADDRGP4 $2410
JUMPV
LABELV $2409
line 5785
;5784:	else
;5785:	{
line 5786
;5786:		BotDoTeamplayAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDoTeamplayAI
CALLV
pop
line 5787
;5787:	}
LABELV $2410
line 5789
;5788:
;5789:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2411
line 5790
;5790:	{
line 5791
;5791:		bs->frame_Enemy_Vis = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
CNSTI4 0
ASGNI4
line 5792
;5792:	}
LABELV $2411
line 5794
;5793:
;5794:	if (bs->revengeEnemy && bs->revengeEnemy->client &&
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
ASGNP4
ADDRLP4 172
CNSTU4 0
ASGNU4
ADDRLP4 168
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $2413
ADDRLP4 176
ADDRLP4 168
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $2413
ADDRLP4 176
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2413
line 5796
;5795:		bs->revengeEnemy->client->pers.connected != CON_CONNECTED)
;5796:	{
line 5797
;5797:		bs->revengeEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
CNSTP4 0
ASGNP4
line 5798
;5798:		bs->revengeHateLevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
CNSTI4 0
ASGNI4
line 5799
;5799:	}
LABELV $2413
line 5801
;5800:
;5801:	if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 180
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 184
CNSTU4 0
ASGNU4
ADDRLP4 180
INDIRP4
CVPU4 4
ADDRLP4 184
INDIRU4
EQU4 $2415
ADDRLP4 188
ADDRLP4 180
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CVPU4 4
ADDRLP4 184
INDIRU4
EQU4 $2415
ADDRLP4 188
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2415
line 5803
;5802:		bs->currentEnemy->client->pers.connected != CON_CONNECTED)
;5803:	{
line 5804
;5804:		bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 5805
;5805:	}
LABELV $2415
line 5807
;5806:
;5807:	fjHalt = 0;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 5810
;5808:
;5809:#ifndef FORCEJUMP_INSTANTMETHOD
;5810:	if (bs->forceJumpChargeTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $2417
line 5811
;5811:	{
line 5812
;5812:		useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5813
;5813:		forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5814
;5814:	}
LABELV $2417
line 5816
;5815:
;5816:	if (bs->currentEnemy && bs->currentEnemy->client && bs->frame_Enemy_Vis && bs->forceJumpChargeTime < level.time)
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
ADDRLP4 192
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 200
CNSTU4 0
ASGNU4
ADDRLP4 196
INDIRP4
CVPU4 4
ADDRLP4 200
INDIRU4
EQU4 $2420
ADDRLP4 196
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 200
INDIRU4
EQU4 $2420
ADDRLP4 192
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2420
ADDRLP4 192
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $2420
line 5820
;5817:#else
;5818:	if (bs->currentEnemy && bs->currentEnemy->client && bs->frame_Enemy_Vis)
;5819:#endif
;5820:	{
line 5821
;5821:		VectorSubtract(bs->currentEnemy->client->ps.origin, bs->eye, a_fo);
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
ADDRLP4 204
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 212
CNSTI4 408
ASGNI4
ADDRLP4 20
ADDRLP4 208
INDIRP4
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 204
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 208
INDIRP4
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 204
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20+8
ADDRLP4 216
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 216
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5822
;5822:		vectoangles(a_fo, a_fo);
ADDRLP4 20
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 5825
;5823:
;5824:		//do this above all things
;5825:		if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_PUSH)) && bs->doForcePush > level.time && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_PUSH]][FP_PUSH] && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
CNSTI4 8
ASGNI4
ADDRLP4 220
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 224
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2425
ADDRLP4 220
INDIRP4
CNSTI4 4796
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $2425
ADDRLP4 228
CNSTI4 53196
ADDRLP4 220
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 228
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $2425
ADDRLP4 220
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 232
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
EQI4 $2425
line 5826
;5826:		{
line 5827
;5827:			level.clients[bs->client].ps.fd.forcePowerSelected = FP_PUSH;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 3
ASGNI4
line 5828
;5828:			useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5829
;5829:			forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5830
;5830:		}
ADDRGP4 $2426
JUMPV
LABELV $2425
line 5831
;5831:		else if (bs->cur_ps.fd.forceSide == FORCE_DARKSIDE)
ADDRFP4 0
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2428
line 5832
;5832:		{ //try dark side powers
line 5834
;5833:		  //in order of priority top to bottom
;5834:			if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_GRIP)) && (bs->cur_ps.fd.forcePowersActive & (1 << FP_GRIP)) && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 240
CNSTI4 64
ASGNI4
ADDRLP4 244
CNSTI4 0
ASGNI4
ADDRLP4 236
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 240
INDIRI4
BANDI4
ADDRLP4 244
INDIRI4
EQI4 $2430
ADDRLP4 236
INDIRP4
CNSTI4 864
ADDP4
INDIRI4
ADDRLP4 240
INDIRI4
BANDI4
ADDRLP4 244
INDIRI4
EQI4 $2430
ADDRLP4 236
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 248
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
EQI4 $2430
line 5835
;5835:			{ //already gripping someone, so hold it
line 5836
;5836:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_GRIP;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 6
ASGNI4
line 5837
;5837:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5838
;5838:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5839
;5839:			}
ADDRGP4 $2429
JUMPV
LABELV $2430
line 5840
;5840:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_LIGHTNING)) && bs->frame_Enemy_Len < FORCE_LIGHTNING_RADIUS && level.clients[bs->client].ps.fd.forcePower > 50 && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2432
ADDRLP4 252
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1133903872
GEF4 $2432
CNSTI4 53196
ADDRLP4 252
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 50
LEI4 $2432
ADDRLP4 252
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 256
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
EQI4 $2432
line 5841
;5841:			{
line 5842
;5842:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_LIGHTNING;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 7
ASGNI4
line 5843
;5843:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5844
;5844:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5845
;5845:			}
ADDRGP4 $2429
JUMPV
LABELV $2432
line 5846
;5846:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_GRIP)) && bs->frame_Enemy_Len < MAX_GRIP_DISTANCE && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_GRIP]][FP_GRIP] && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $2434
ADDRLP4 260
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
GEF4 $2434
ADDRLP4 264
CNSTI4 53196
ADDRLP4 260
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 264
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 24
ADDP4
INDIRI4
LEI4 $2434
ADDRLP4 260
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 268
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $2434
line 5847
;5847:			{
line 5848
;5848:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_GRIP;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 6
ASGNI4
line 5849
;5849:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5850
;5850:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5851
;5851:			}
ADDRGP4 $2429
JUMPV
LABELV $2434
line 5852
;5852:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_RAGE)) && g_entities[bs->client].health < 25 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_RAGE]][FP_RAGE])
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2436
ADDRLP4 276
ADDRLP4 272
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 2352
ADDRLP4 276
INDIRI4
MULI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
CNSTI4 25
GEI4 $2436
ADDRLP4 280
CNSTI4 53196
ADDRLP4 276
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 280
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 280
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 32
ADDP4
INDIRI4
LEI4 $2436
line 5853
;5853:			{
line 5854
;5854:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_RAGE;
ADDRLP4 284
CNSTI4 8
ASGNI4
CNSTI4 53196
ADDRFP4 0
INDIRP4
ADDRLP4 284
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
ADDRLP4 284
INDIRI4
ASGNI4
line 5855
;5855:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5856
;5856:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5857
;5857:			}
ADDRGP4 $2429
JUMPV
LABELV $2436
line 5858
;5858:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_DRAIN)) && bs->frame_Enemy_Len < MAX_DRAIN_DISTANCE && level.clients[bs->client].ps.fd.forcePower > 50 && InFieldOfVision(bs->viewangles, 50, a_fo) && bs->currentEnemy->client->ps.fd.forcePower > 10 && bs->currentEnemy->client->ps.fd.forceSide == FORCE_LIGHTSIDE)
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $2429
ADDRLP4 284
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1140850688
GEF4 $2429
CNSTI4 53196
ADDRLP4 284
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 50
LEI4 $2429
ADDRLP4 284
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 288
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
EQI4 $2429
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 10
LEI4 $2429
ADDRLP4 292
INDIRP4
CNSTI4 1188
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2429
line 5859
;5859:			{
line 5860
;5860:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_DRAIN;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 13
ASGNI4
line 5861
;5861:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5862
;5862:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5863
;5863:			}
line 5864
;5864:		}
ADDRGP4 $2429
JUMPV
LABELV $2428
line 5865
;5865:		else if (bs->cur_ps.fd.forceSide == FORCE_LIGHTSIDE)
ADDRFP4 0
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2441
line 5866
;5866:		{ //try light side powers
line 5867
;5867:			if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_TELEPATHY)) && bs->frame_Enemy_Len < MAX_TRICK_DISTANCE && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TELEPATHY]][FP_TELEPATHY] && InFieldOfVision(bs->viewangles, 50, a_fo) && !(bs->currentEnemy->client->ps.fd.forcePowersActive & (1 << FP_SEE)))
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 236
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $2443
ADDRLP4 236
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1140850688
GEF4 $2443
ADDRLP4 240
CNSTI4 53196
ADDRLP4 236
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 240
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 240
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 20
ADDP4
INDIRI4
LEI4 $2443
ADDRLP4 236
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 244
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 248
CNSTI4 0
ASGNI4
ADDRLP4 244
INDIRI4
ADDRLP4 248
INDIRI4
EQI4 $2443
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 248
INDIRI4
NEI4 $2443
line 5868
;5868:			{
line 5869
;5869:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_TELEPATHY;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 5
ASGNI4
line 5870
;5870:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5871
;5871:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5872
;5872:			}
ADDRGP4 $2444
JUMPV
LABELV $2443
line 5873
;5873:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_ABSORB)) && g_entities[bs->client].health < 75 && bs->currentEnemy->client->ps.fd.forceSide == FORCE_DARKSIDE && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_ABSORB]][FP_ABSORB])
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2445
ADDRLP4 256
ADDRLP4 252
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 2352
ADDRLP4 256
INDIRI4
MULI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
CNSTI4 75
GEI4 $2445
ADDRLP4 252
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1188
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2445
ADDRLP4 260
CNSTI4 53196
ADDRLP4 256
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 260
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 40
ADDP4
INDIRI4
LEI4 $2445
line 5874
;5874:			{
line 5875
;5875:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_ABSORB;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 10
ASGNI4
line 5876
;5876:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5877
;5877:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5878
;5878:			}
ADDRGP4 $2446
JUMPV
LABELV $2445
line 5879
;5879:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_PROTECT)) && g_entities[bs->client].health < 35 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_PROTECT]][FP_PROTECT])
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2448
ADDRLP4 268
ADDRLP4 264
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 2352
ADDRLP4 268
INDIRI4
MULI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
CNSTI4 35
GEI4 $2448
ADDRLP4 272
CNSTI4 53196
ADDRLP4 268
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 272
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 36
ADDP4
INDIRI4
LEI4 $2448
line 5880
;5880:			{
line 5881
;5881:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_PROTECT;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 9
ASGNI4
line 5882
;5882:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5883
;5883:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5884
;5884:			}
LABELV $2448
LABELV $2446
LABELV $2444
line 5885
;5885:		}
LABELV $2441
LABELV $2429
LABELV $2426
line 5887
;5886:
;5887:		if (!useTheForce)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2451
line 5888
;5888:		{ //try neutral powers
line 5889
;5889:			if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_PUSH)) && bs->cur_ps.fd.forceGripBeingGripped > level.time && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_PUSH]][FP_PUSH] && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 240
CNSTI4 8
ASGNI4
ADDRLP4 236
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 240
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2453
ADDRLP4 236
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $2453
ADDRLP4 244
CNSTI4 53196
ADDRLP4 236
INDIRP4
ADDRLP4 240
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 244
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 244
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $2453
ADDRLP4 236
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 248
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
EQI4 $2453
line 5890
;5890:			{
line 5891
;5891:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_PUSH;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 3
ASGNI4
line 5892
;5892:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5893
;5893:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5894
;5894:			}
ADDRGP4 $2454
JUMPV
LABELV $2453
line 5895
;5895:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_SPEED)) && g_entities[bs->client].health < 25 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_SPEED]][FP_SPEED])
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2456
ADDRLP4 256
CNSTI4 8
ASGNI4
ADDRLP4 260
ADDRLP4 252
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRI4
ASGNI4
CNSTI4 2352
ADDRLP4 260
INDIRI4
MULI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
CNSTI4 25
GEI4 $2456
ADDRLP4 264
CNSTI4 53196
ADDRLP4 260
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 264
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRI4
LEI4 $2456
line 5896
;5896:			{
line 5897
;5897:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_SPEED;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 2
ASGNI4
line 5898
;5898:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5899
;5899:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5900
;5900:			}
ADDRGP4 $2457
JUMPV
LABELV $2456
line 5901
;5901:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_SEE)) && BotMindTricked(bs->client, bs->currentEnemy->s.number) && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_SEE]][FP_SEE])
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $2459
ADDRLP4 268
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 268
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 272
ADDRGP4 BotMindTricked
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $2459
ADDRLP4 276
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 276
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 56
ADDP4
INDIRI4
LEI4 $2459
line 5902
;5902:			{
line 5903
;5903:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_SEE;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 14
ASGNI4
line 5904
;5904:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5905
;5905:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5906
;5906:			}
ADDRGP4 $2460
JUMPV
LABELV $2459
line 5907
;5907:			else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_PULL)) && bs->frame_Enemy_Len < 256 && level.clients[bs->client].ps.fd.forcePower > 75 && InFieldOfVision(bs->viewangles, 50, a_fo))
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2461
ADDRLP4 280
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
GEF4 $2461
CNSTI4 53196
ADDRLP4 280
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 75
LEI4 $2461
ADDRLP4 280
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 284
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $2461
line 5908
;5908:			{
line 5909
;5909:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_PULL;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 4
ASGNI4
line 5910
;5910:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5911
;5911:				forceHostile = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 5912
;5912:			}
LABELV $2461
LABELV $2460
LABELV $2457
LABELV $2454
line 5913
;5913:		}
LABELV $2451
line 5914
;5914:	}
LABELV $2420
line 5916
;5915:
;5916:	if (!useTheForce)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2463
line 5917
;5917:	{ //try powers that we don't care if we have an enemy for
line 5918
;5918:		if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_HEAL)) && g_entities[bs->client].health < 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_HEAL]][FP_HEAL] && bs->cur_ps.fd.forcePowerLevel[FP_HEAL] > FORCE_LEVEL_1)
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
CNSTI4 1
ASGNI4
ADDRLP4 204
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
ADDRLP4 208
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2465
ADDRLP4 212
ADDRLP4 204
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 2352
ADDRLP4 212
INDIRI4
MULI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
CNSTI4 50
GEI4 $2465
ADDRLP4 216
CNSTI4 53196
ADDRLP4 212
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 216
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 216
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
INDIRI4
LEI4 $2465
ADDRLP4 204
INDIRP4
CNSTI4 960
ADDP4
INDIRI4
ADDRLP4 208
INDIRI4
LEI4 $2465
line 5919
;5919:		{
line 5920
;5920:			level.clients[bs->client].ps.fd.forcePowerSelected = FP_HEAL;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 0
ASGNI4
line 5921
;5921:			useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5922
;5922:			forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5923
;5923:		}
ADDRGP4 $2466
JUMPV
LABELV $2465
line 5924
;5924:		else if ((bs->cur_ps.fd.forcePowersKnown & (1 << FP_HEAL)) && g_entities[bs->client].health < 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_HEAL]][FP_HEAL] && !bs->currentEnemy && bs->isCamping > level.time)
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2468
ADDRLP4 224
ADDRLP4 220
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 2352
ADDRLP4 224
INDIRI4
MULI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
CNSTI4 50
GEI4 $2468
ADDRLP4 228
CNSTI4 53196
ADDRLP4 224
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 228
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
INDIRI4
LEI4 $2468
ADDRLP4 220
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2468
ADDRLP4 220
INDIRP4
CNSTI4 2064
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $2468
line 5925
;5925:		{ //only meditate and heal if we're camping
line 5926
;5926:			level.clients[bs->client].ps.fd.forcePowerSelected = FP_HEAL;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 0
ASGNI4
line 5927
;5927:			useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 5928
;5928:			forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5929
;5929:		}
LABELV $2468
LABELV $2466
line 5930
;5930:	}
LABELV $2463
line 5932
;5931:
;5932:	if (useTheForce && forceHostile)
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 204
INDIRI4
EQI4 $2472
ADDRLP4 16
INDIRI4
ADDRLP4 204
INDIRI4
EQI4 $2472
line 5933
;5933:	{
line 5934
;5934:		if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 212
ADDRLP4 208
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 216
CNSTU4 0
ASGNU4
ADDRLP4 212
INDIRP4
CVPU4 4
ADDRLP4 216
INDIRU4
EQU4 $2474
ADDRLP4 212
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 216
INDIRU4
EQU4 $2474
ADDRLP4 220
ADDRLP4 208
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 2352
ADDRLP4 220
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 212
INDIRP4
ARGP4
CNSTI4 53196
ADDRLP4 220
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
INDIRI4
ARGI4
ADDRLP4 224
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 0
NEI4 $2474
line 5936
;5935:			!ForcePowerUsableOn(&g_entities[bs->client], bs->currentEnemy, level.clients[bs->client].ps.fd.forcePowerSelected))
;5936:		{
line 5937
;5937:			useTheForce = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 5938
;5938:			forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 5939
;5939:		}
LABELV $2474
line 5940
;5940:	}
LABELV $2472
line 5942
;5941:
;5942:	doingFallback = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 5944
;5943:
;5944:	bs->deathActivitiesDone = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2620
ADDP4
CNSTI4 0
ASGNI4
line 5946
;5945:
;5946:	if (BotUseInventoryItem(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotUseInventoryItem
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $2476
line 5947
;5947:	{
line 5948
;5948:		if (rand()%10 < 5)
ADDRLP4 212
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $2478
line 5949
;5949:		{
line 5950
;5950:			trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 5951
;5951:		}
LABELV $2478
line 5952
;5952:	}
LABELV $2476
line 5954
;5953:
;5954:	if (bs->cur_ps.ammo[weaponData[bs->cur_ps.weapon].ammoIndex] < weaponData[bs->cur_ps.weapon].energyPerShot)
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 216
CNSTI4 56
ADDRLP4 212
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 216
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 212
INDIRP4
CNSTI4 424
ADDP4
ADDP4
INDIRI4
ADDRLP4 216
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GEI4 $2480
line 5955
;5955:	{
line 5956
;5956:		if (BotTryAnotherWeapon(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 220
ADDRGP4 BotTryAnotherWeapon
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 0
EQI4 $2481
line 5957
;5957:		{
line 5958
;5958:			return;
ADDRGP4 $2376
JUMPV
line 5960
;5959:		}
;5960:	}
LABELV $2480
line 5962
;5961:	else
;5962:	{
line 5963
;5963:		if (bs->currentEnemy && bs->lastVisibleEnemyIndex == bs->currentEnemy->s.number &&
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
ADDRLP4 220
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2484
ADDRLP4 220
INDIRP4
CNSTI4 1956
ADDP4
INDIRI4
ADDRLP4 224
INDIRP4
INDIRI4
NEI4 $2484
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRLP4 220
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $2484
ADDRLP4 220
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $2484
line 5965
;5964:			bs->frame_Enemy_Vis && bs->forceWeaponSelect /*&& bs->plantContinue < level.time*/)
;5965:		{
line 5966
;5966:			bs->forceWeaponSelect = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
CNSTI4 0
ASGNI4
line 5967
;5967:		}
LABELV $2484
line 5969
;5968:
;5969:		if (bs->plantContinue > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2300
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $2486
line 5970
;5970:		{
line 5971
;5971:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 5972
;5972:			bs->destinationGrabTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
CNSTF4 0
ASGNF4
line 5973
;5973:		}
LABELV $2486
line 5975
;5974:
;5975:		if (!bs->forceWeaponSelect && bs->cur_ps.hasDetPackPlanted && bs->plantKillEmAll > level.time)
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 236
CNSTI4 0
ASGNI4
ADDRLP4 232
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
ADDRLP4 236
INDIRI4
NEI4 $2489
ADDRLP4 232
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
ADDRLP4 236
INDIRI4
EQI4 $2489
ADDRLP4 232
INDIRP4
CNSTI4 2304
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $2489
line 5976
;5976:		{
line 5977
;5977:			bs->forceWeaponSelect = WP_DET_PACK;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
CNSTI4 13
ASGNI4
line 5978
;5978:		}
LABELV $2489
line 5980
;5979:
;5980:		if (bs->forceWeaponSelect)
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2492
line 5981
;5981:		{
line 5982
;5982:			selResult = BotSelectChoiceWeapon(bs, bs->forceWeaponSelect, 1);
ADDRLP4 240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 240
INDIRP4
ARGP4
ADDRLP4 240
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 244
ADDRGP4 BotSelectChoiceWeapon
CALLI4
ASGNI4
ADDRLP4 104
ADDRLP4 244
INDIRI4
ASGNI4
line 5983
;5983:		}
LABELV $2492
line 5985
;5984:
;5985:		if (selResult)
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $2494
line 5986
;5986:		{
line 5987
;5987:			if (selResult == 2)
ADDRLP4 104
INDIRI4
CNSTI4 2
NEI4 $2495
line 5988
;5988:			{ //newly selected
line 5989
;5989:				return;
ADDRGP4 $2376
JUMPV
line 5991
;5990:			}
;5991:		}
LABELV $2494
line 5992
;5992:		else if (BotSelectIdealWeapon(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
ADDRGP4 BotSelectIdealWeapon
CALLI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 0
EQI4 $2498
line 5993
;5993:		{
line 5994
;5994:			return;
ADDRGP4 $2376
JUMPV
LABELV $2498
LABELV $2495
line 5996
;5995:		}
;5996:	}
LABELV $2481
line 6002
;5997:	/*if (BotSelectMelee(bs))
;5998:	{
;5999:		return;
;6000:	}*/
;6001:
;6002:	reaction = bs->skills.reflex/bs->settings.skill;
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 220
INDIRP4
CNSTI4 2316
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 220
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
DIVF4
ASGNF4
line 6004
;6003:
;6004:	if (reaction < 0)
ADDRLP4 48
INDIRF4
CNSTF4 0
GEF4 $2500
line 6005
;6005:	{
line 6006
;6006:		reaction = 0;
ADDRLP4 48
CNSTF4 0
ASGNF4
line 6007
;6007:	}
LABELV $2500
line 6008
;6008:	if (reaction > 2000)
ADDRLP4 48
INDIRF4
CNSTF4 1157234688
LEF4 $2502
line 6009
;6009:	{
line 6010
;6010:		reaction = 2000;
ADDRLP4 48
CNSTF4 1157234688
ASGNF4
line 6011
;6011:	}
LABELV $2502
line 6013
;6012:
;6013:	if (!bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2504
line 6014
;6014:	{
line 6015
;6015:		bs->timeToReact = level.time + reaction;
ADDRFP4 0
INDIRP4
CNSTI4 1992
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRLP4 48
INDIRF4
ADDF4
ASGNF4
line 6016
;6016:	}
LABELV $2504
line 6018
;6017:
;6018:	if (bs->cur_ps.weapon == WP_DET_PACK && bs->cur_ps.hasDetPackPlanted && bs->plantKillEmAll > level.time)
ADDRLP4 224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 13
NEI4 $2507
ADDRLP4 224
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2507
ADDRLP4 224
INDIRP4
CNSTI4 2304
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $2507
line 6019
;6019:	{
line 6020
;6020:		bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6021
;6021:	}
LABELV $2507
line 6023
;6022:
;6023:	if (bs->wpCamping)
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2510
line 6024
;6024:	{
line 6025
;6025:		if (bs->isCamping < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $2512
line 6026
;6026:		{
line 6027
;6027:			bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 6028
;6028:			bs->isCamping = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
CNSTF4 0
ASGNF4
line 6029
;6029:		}
LABELV $2512
line 6031
;6030:
;6031:		if (bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2515
ADDRLP4 228
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2515
line 6032
;6032:		{
line 6033
;6033:			bs->wpCamping = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
CNSTP4 0
ASGNP4
line 6034
;6034:			bs->isCamping = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2064
ADDP4
CNSTF4 0
ASGNF4
line 6035
;6035:		}
LABELV $2515
line 6036
;6036:	}
LABELV $2510
line 6038
;6037:
;6038:	if (bs->wpCurrent &&
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2517
ADDRLP4 228
INDIRP4
CNSTI4 1972
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LTF4 $2521
ADDRLP4 228
INDIRP4
CNSTI4 1976
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $2517
LABELV $2521
line 6040
;6039:		(bs->wpSeenTime < level.time || bs->wpTravelTime < level.time))
;6040:	{
line 6041
;6041:		bs->wpCurrent = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
CNSTP4 0
ASGNP4
line 6042
;6042:	}
LABELV $2517
line 6044
;6043:
;6044:	if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2522
line 6045
;6045:	{
line 6046
;6046:		if (bs->enemySeenTime < level.time ||
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CNSTI4 1996
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LTF4 $2527
ADDRLP4 232
INDIRP4
ARGP4
ADDRLP4 232
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ARGP4
ADDRLP4 236
ADDRGP4 PassStandardEnemyChecks
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 0
NEI4 $2524
LABELV $2527
line 6048
;6047:			!PassStandardEnemyChecks(bs, bs->currentEnemy))
;6048:		{
line 6049
;6049:			if (bs->revengeEnemy == bs->currentEnemy &&
ADDRLP4 240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
ADDRLP4 240
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 248
ADDRLP4 244
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 240
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 248
INDIRU4
NEU4 $2528
ADDRLP4 244
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2528
ADDRLP4 252
ADDRLP4 240
INDIRP4
CNSTI4 1832
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 252
INDIRU4
CNSTU4 0
EQU4 $2528
ADDRLP4 252
INDIRU4
ADDRLP4 248
INDIRU4
NEU4 $2528
line 6052
;6050:				bs->currentEnemy->health < 1 &&
;6051:				bs->lastAttacked && bs->lastAttacked == bs->currentEnemy)
;6052:			{
line 6054
;6053:				//CHAT: Destroyed hated one [KilledHatedOne section]
;6054:				bs->chatObject = bs->revengeEnemy;
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
CNSTI4 2244
ADDP4
ADDRLP4 256
INDIRP4
CNSTI4 1820
ADDP4
INDIRP4
ASGNP4
line 6055
;6055:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 6056
;6056:				BotDoChat(bs, "KilledHatedOne", 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2530
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 6057
;6057:				bs->revengeEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1820
ADDP4
CNSTP4 0
ASGNP4
line 6058
;6058:				bs->revengeHateLevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1864
ADDP4
CNSTI4 0
ASGNI4
line 6059
;6059:			}
ADDRGP4 $2529
JUMPV
LABELV $2528
line 6060
;6060:			else if (bs->currentEnemy->health < 1 && PassLovedOneCheck(bs, bs->currentEnemy) &&
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 256
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2531
ADDRLP4 256
INDIRP4
ARGP4
ADDRLP4 260
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 PassLovedOneCheck
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $2531
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
ADDRLP4 268
INDIRP4
CNSTI4 1832
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 272
INDIRU4
CNSTU4 0
EQU4 $2531
ADDRLP4 272
INDIRU4
ADDRLP4 268
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
NEU4 $2531
line 6062
;6061:				bs->lastAttacked && bs->lastAttacked == bs->currentEnemy)
;6062:			{
line 6064
;6063:				//CHAT: Killed
;6064:				bs->chatObject = bs->currentEnemy;
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 2244
ADDP4
ADDRLP4 276
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
line 6065
;6065:				bs->chatAltObject = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 2248
ADDP4
CNSTP4 0
ASGNP4
line 6066
;6066:				BotDoChat(bs, "Killed", 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2533
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotDoChat
CALLI4
pop
line 6067
;6067:			}
LABELV $2531
LABELV $2529
line 6069
;6068:
;6069:			bs->currentEnemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTP4 0
ASGNP4
line 6070
;6070:		}
LABELV $2524
line 6071
;6071:	}
LABELV $2522
line 6073
;6072:
;6073:	if (bot_honorableduelacceptance.integer)
ADDRGP4 bot_honorableduelacceptance+12
INDIRI4
CNSTI4 0
EQI4 $2534
line 6074
;6074:	{
line 6075
;6075:		if (bs->currentEnemy && bs->currentEnemy->client &&
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 236
ADDRLP4 232
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 240
CNSTU4 0
ASGNU4
ADDRLP4 236
INDIRP4
CVPU4 4
ADDRLP4 240
INDIRU4
EQU4 $2537
ADDRLP4 244
ADDRLP4 236
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
CVPU4 4
ADDRLP4 240
INDIRU4
EQU4 $2537
ADDRLP4 248
CNSTI4 2
ASGNI4
ADDRLP4 232
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 248
INDIRI4
NEI4 $2537
ADDRLP4 252
CNSTI4 0
ASGNI4
ADDRGP4 g_privateDuel+12
INDIRI4
ADDRLP4 252
INDIRI4
EQI4 $2537
ADDRLP4 232
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 252
INDIRI4
EQI4 $2537
ADDRLP4 232
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1137180672
GEF4 $2537
ADDRLP4 244
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 248
INDIRI4
NEI4 $2537
ADDRLP4 244
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ADDRLP4 252
INDIRI4
EQI4 $2537
line 6082
;6076:			bs->cur_ps.weapon == WP_SABER &&
;6077:			g_privateDuel.integer &&
;6078:			bs->frame_Enemy_Vis &&
;6079:			bs->frame_Enemy_Len < 400 &&
;6080:			bs->currentEnemy->client->ps.weapon == WP_SABER &&
;6081:			bs->currentEnemy->client->ps.saberHolstered)
;6082:		{
line 6085
;6083:			vec3_t e_ang_vec;
;6084:
;6085:			VectorSubtract(bs->currentEnemy->client->ps.origin, bs->eye, e_ang_vec);
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
ADDRLP4 268
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 276
CNSTI4 408
ASGNI4
ADDRLP4 256
ADDRLP4 272
INDIRP4
INDIRP4
ADDRLP4 276
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 256+4
ADDRLP4 272
INDIRP4
INDIRP4
ADDRLP4 276
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256+8
ADDRLP4 280
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6087
;6086:
;6087:			if (InFieldOfVision(bs->viewangles, 100, e_ang_vec))
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
ADDRLP4 256
ARGP4
ADDRLP4 284
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
EQI4 $2542
line 6088
;6088:			{ //Our enemy has his saber holstered and has challenged us to a duel, so challenge him back
line 6089
;6089:				if (!bs->cur_ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2544
line 6090
;6090:				{
line 6091
;6091:					Cmd_ToggleSaber_f(&g_entities[bs->client]);
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_ToggleSaber_f
CALLV
pop
line 6092
;6092:				}
ADDRGP4 $2545
JUMPV
LABELV $2544
line 6094
;6093:				else
;6094:				{
line 6095
;6095:					if (bs->currentEnemy->client->ps.duelIndex == bs->client &&
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
ADDRLP4 288
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 288
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2546
ADDRLP4 292
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $2546
ADDRLP4 288
INDIRP4
CNSTI4 1320
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2546
line 6098
;6096:						bs->currentEnemy->client->ps.duelTime > level.time &&
;6097:						!bs->cur_ps.duelInProgress)
;6098:					{
line 6099
;6099:						Cmd_EngageDuel_f(&g_entities[bs->client]);
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_EngageDuel_f
CALLV
pop
line 6100
;6100:					}
LABELV $2546
line 6101
;6101:				}
LABELV $2545
line 6103
;6102:
;6103:				bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6104
;6104:				bs->doAltAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 0
ASGNI4
line 6105
;6105:				bs->botChallengingTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2740
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 6106
;6106:				bs->beStill = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 6107
;6107:			}
LABELV $2542
line 6108
;6108:		}
LABELV $2537
line 6109
;6109:	}
LABELV $2534
line 6113
;6110:	//Apparently this "allows you to cheese" when fighting against bots. I'm not sure why you'd want to con bots
;6111:	//into an easy kill, since they're bots and all. But whatever.
;6112:
;6113:	if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2551
line 6114
;6114:	{
line 6115
;6115:		wp = GetNearestVisibleWP(bs->origin, bs->client);
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 232
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 236
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 236
INDIRI4
ASGNI4
line 6117
;6116:
;6117:		if (wp != -1)
ADDRLP4 144
INDIRI4
CNSTI4 -1
EQI4 $2553
line 6118
;6118:		{
line 6119
;6119:			bs->wpCurrent = gWPArray[wp];
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 6120
;6120:			bs->wpSeenTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 6121
;6121:			bs->wpTravelTime = level.time + 10000; //never take more than 10 seconds to travel to a waypoint
ADDRFP4 0
INDIRP4
CNSTI4 1976
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6122
;6122:		}
LABELV $2553
line 6123
;6123:	}
LABELV $2551
line 6125
;6124:
;6125:	if (bs->enemySeenTime < level.time || !bs->frame_Enemy_Vis || !bs->currentEnemy ||
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CNSTI4 1996
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LTF4 $2562
ADDRLP4 232
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2562
ADDRLP4 236
ADDRLP4 232
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 240
CNSTU4 0
ASGNU4
ADDRLP4 236
INDIRU4
ADDRLP4 240
INDIRU4
EQU4 $2562
ADDRLP4 236
INDIRU4
ADDRLP4 240
INDIRU4
EQU4 $2557
LABELV $2562
line 6127
;6126:		(bs->currentEnemy /*&& bs->cur_ps.weapon == WP_SABER && bs->frame_Enemy_Len > 300*/))
;6127:	{
line 6128
;6128:		enemy = ScanForEnemies(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 244
ADDRGP4 ScanForEnemies
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 244
INDIRI4
ASGNI4
line 6130
;6129:
;6130:		if (enemy != -1)
ADDRLP4 148
INDIRI4
CNSTI4 -1
EQI4 $2563
line 6131
;6131:		{
line 6132
;6132:			bs->currentEnemy = &g_entities[enemy];
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
CNSTI4 2352
ADDRLP4 148
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 6133
;6133:			bs->enemySeenTime = level.time + ENEMY_FORGET_MS;
ADDRFP4 0
INDIRP4
CNSTI4 1996
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6134
;6134:		}
LABELV $2563
line 6135
;6135:	}
LABELV $2557
line 6137
;6136:
;6137:	if (!bs->squadLeader && !bs->isSquadLeader)
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2566
ADDRLP4 244
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2566
line 6138
;6138:	{
line 6139
;6139:		BotScanForLeader(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotScanForLeader
CALLV
pop
line 6140
;6140:	}
LABELV $2566
line 6142
;6141:
;6142:	if (!bs->squadLeader && bs->squadCannotLead < level.time)
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2568
ADDRLP4 248
INDIRP4
CNSTI4 1876
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $2568
line 6143
;6143:	{ //if still no leader after scanning, then become a squad leader
line 6144
;6144:		bs->isSquadLeader = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1868
ADDP4
CNSTI4 1
ASGNI4
line 6145
;6145:	}
LABELV $2568
line 6147
;6146:
;6147:	if (bs->isSquadLeader && bs->squadLeader)
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 1868
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2571
ADDRLP4 252
INDIRP4
CNSTI4 1824
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2571
line 6148
;6148:	{ //we don't follow anyone if we are a leader
line 6149
;6149:		bs->squadLeader = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1824
ADDP4
CNSTP4 0
ASGNP4
line 6150
;6150:	}
LABELV $2571
line 6153
;6151:
;6152:	//ESTABLISH VISIBILITIES AND DISTANCES FOR THE WHOLE FRAME HERE
;6153:	if (bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2573
line 6154
;6154:	{
line 6155
;6155:		VectorSubtract(bs->wpCurrent->origin, bs->origin, a);
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 256
INDIRP4
CNSTI4 1884
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 260
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 256
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 260
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 256
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 264
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 264
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6156
;6156:		bs->frame_Waypoint_Len = VectorLength(a);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2044
ADDP4
ADDRLP4 268
INDIRF4
ASGNF4
line 6158
;6157:
;6158:		visResult = WPOrgVisible(&g_entities[bs->client], bs->origin, bs->wpCurrent->origin, bs->client);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
ADDRLP4 272
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
CNSTI4 2352
ADDRLP4 276
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 272
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 272
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ARGP4
ADDRLP4 276
INDIRI4
ARGI4
ADDRLP4 280
ADDRGP4 WPOrgVisible
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 280
INDIRI4
ASGNI4
line 6160
;6159:
;6160:		if (visResult == 2)
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $2577
line 6161
;6161:		{
line 6162
;6162:			bs->frame_Waypoint_Vis = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2048
ADDP4
CNSTI4 0
ASGNI4
line 6163
;6163:			bs->wpSeenTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
CNSTF4 0
ASGNF4
line 6164
;6164:			bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 6165
;6165:			bs->wpDestIgnoreTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 1988
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 5000
ADDI4
CVIF4 4
ASGNF4
line 6167
;6166:
;6167:			if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2580
line 6168
;6168:			{
line 6169
;6169:				bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 6170
;6170:			}
ADDRGP4 $2578
JUMPV
LABELV $2580
line 6172
;6171:			else
;6172:			{
line 6173
;6173:				bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 6174
;6174:			}
line 6175
;6175:		}
ADDRGP4 $2578
JUMPV
LABELV $2577
line 6176
;6176:		else if (visResult)
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $2582
line 6177
;6177:		{
line 6178
;6178:			bs->frame_Waypoint_Vis = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2048
ADDP4
CNSTI4 1
ASGNI4
line 6179
;6179:		}
ADDRGP4 $2583
JUMPV
LABELV $2582
line 6181
;6180:		else
;6181:		{
line 6182
;6182:			bs->frame_Waypoint_Vis = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2048
ADDP4
CNSTI4 0
ASGNI4
line 6183
;6183:		}
LABELV $2583
LABELV $2578
line 6184
;6184:	}
LABELV $2573
line 6186
;6185:
;6186:	if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2584
line 6187
;6187:	{
line 6188
;6188:		if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2586
line 6189
;6189:		{
line 6190
;6190:			VectorCopy(bs->currentEnemy->client->ps.origin, eorg);
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 6191
;6191:			eorg[2] += bs->currentEnemy->client->ps.viewheight;
ADDRLP4 56+8
ADDRLP4 56+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
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
line 6192
;6192:		}
ADDRGP4 $2587
JUMPV
LABELV $2586
line 6194
;6193:		else
;6194:		{
line 6195
;6195:			VectorCopy(bs->currentEnemy->s.origin, eorg);
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 6196
;6196:		}
LABELV $2587
line 6198
;6197:
;6198:		VectorSubtract(eorg, bs->eye, a);
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRF4
ADDRLP4 256
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 56+4
INDIRF4
ADDRLP4 256
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 56+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6199
;6199:		bs->frame_Enemy_Len = VectorLength(a);
ADDRLP4 0
ARGP4
ADDRLP4 260
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
ADDRLP4 260
INDIRF4
ASGNF4
line 6201
;6200:
;6201:		if (OrgVisible(bs->eye, eorg, bs->client))
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 264
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 268
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $2593
line 6202
;6202:		{
line 6203
;6203:			bs->frame_Enemy_Vis = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
CNSTI4 1
ASGNI4
line 6204
;6204:			VectorCopy(eorg, bs->lastEnemySpotted);
ADDRFP4 0
INDIRP4
CNSTI4 1932
ADDP4
ADDRLP4 56
INDIRB
ASGNB 12
line 6205
;6205:			VectorCopy(bs->origin, bs->hereWhenSpotted);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 1944
ADDP4
ADDRLP4 272
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 6206
;6206:			bs->lastVisibleEnemyIndex = bs->currentEnemy->s.number;
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 1956
ADDP4
ADDRLP4 276
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
INDIRI4
ASGNI4
line 6208
;6207:			//VectorCopy(bs->eye, bs->lastEnemySpotted);
;6208:			bs->hitSpotted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1960
ADDP4
CNSTI4 0
ASGNI4
line 6209
;6209:		}
ADDRGP4 $2585
JUMPV
LABELV $2593
line 6211
;6210:		else
;6211:		{
line 6212
;6212:			bs->frame_Enemy_Vis = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
CNSTI4 0
ASGNI4
line 6213
;6213:		}
line 6214
;6214:	}
ADDRGP4 $2585
JUMPV
LABELV $2584
line 6216
;6215:	else
;6216:	{
line 6217
;6217:		bs->lastVisibleEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 1956
ADDP4
CNSTI4 1023
ASGNI4
line 6218
;6218:	}
LABELV $2585
line 6221
;6219:	//END
;6220:
;6221:	if (bs->frame_Enemy_Vis)
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2595
line 6222
;6222:	{
line 6223
;6223:		bs->enemySeenTime = level.time + ENEMY_FORGET_MS;
ADDRFP4 0
INDIRP4
CNSTI4 1996
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6224
;6224:	}
LABELV $2595
line 6226
;6225:
;6226:	if (bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2598
line 6227
;6227:	{
line 6228
;6228:		WPConstantRoutine(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WPConstantRoutine
CALLV
pop
line 6230
;6229:
;6230:		if (!bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2600
line 6231
;6231:		{ //WPConstantRoutine has the ability to nullify the waypoint if it fails certain checks, so..
line 6232
;6232:			return;
ADDRGP4 $2376
JUMPV
LABELV $2600
line 6235
;6233:		}
;6234:
;6235:		if (bs->wpCurrent->flags & WPFLAG_WAITFORFUNC)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2602
line 6236
;6236:		{
line 6237
;6237:			if (!CheckForFunc(bs->wpCurrent->origin, -1))
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 256
ADDRGP4 CheckForFunc
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $2604
line 6238
;6238:			{
line 6239
;6239:				bs->beStill = level.time + 500; //no func brush under.. wait
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 6240
;6240:			}
LABELV $2604
line 6241
;6241:		}
LABELV $2602
line 6242
;6242:		if (bs->wpCurrent->flags & WPFLAG_NOMOVEFUNC)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $2607
line 6243
;6243:		{
line 6244
;6244:			if (CheckForFunc(bs->wpCurrent->origin, -1))
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 256
ADDRGP4 CheckForFunc
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
EQI4 $2609
line 6245
;6245:			{
line 6246
;6246:				bs->beStill = level.time + 500; //func brush under.. wait
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 6247
;6247:			}
LABELV $2609
line 6248
;6248:		}
LABELV $2607
line 6250
;6249:
;6250:		if (bs->frame_Waypoint_Vis || (bs->wpCurrent->flags & WPFLAG_NOVIS))
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRLP4 256
INDIRP4
CNSTI4 2048
ADDP4
INDIRI4
ADDRLP4 260
INDIRI4
NEI4 $2614
ADDRLP4 256
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 260
INDIRI4
EQI4 $2612
LABELV $2614
line 6251
;6251:		{
line 6252
;6252:			bs->wpSeenTime = level.time + 1500; //if we lose sight of the point, we have 1.5 seconds to regain it before we drop it
ADDRFP4 0
INDIRP4
CNSTI4 1972
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 6253
;6253:		}
LABELV $2612
line 6254
;6254:		VectorCopy(bs->wpCurrent->origin, bs->goalPosition);
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 264
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
INDIRB
ASGNB 12
line 6255
;6255:		if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2616
line 6256
;6256:		{
line 6257
;6257:			goalWPIndex = bs->wpCurrent->index-1;
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 6258
;6258:		}
ADDRGP4 $2617
JUMPV
LABELV $2616
line 6260
;6259:		else
;6260:		{
line 6261
;6261:			goalWPIndex = bs->wpCurrent->index+1;
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6262
;6262:		}
LABELV $2617
line 6264
;6263:
;6264:		if (bs->wpCamping)
ADDRFP4 0
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2618
line 6265
;6265:		{
line 6266
;6266:			VectorSubtract(bs->wpCampingTo->origin, bs->origin, a);
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
ADDRLP4 268
INDIRP4
CNSTI4 2072
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 272
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 272
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 276
INDIRP4
CNSTI4 2072
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6267
;6267:			vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6268
;6268:			VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6270
;6269:
;6270:			VectorSubtract(bs->origin, bs->wpCamping->origin, a);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
ADDRLP4 280
INDIRP4
CNSTI4 2068
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 280
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 284
INDIRP4
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 280
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 284
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 288
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 288
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6271
;6271:			if (VectorLength(a) < 64)
ADDRLP4 0
ARGP4
ADDRLP4 292
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 292
INDIRF4
CNSTF4 1115684864
GEF4 $2619
line 6272
;6272:			{
line 6273
;6273:				VectorCopy(bs->wpCamping->origin, bs->goalPosition);
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 296
INDIRP4
CNSTI4 2068
ADDP4
INDIRP4
INDIRB
ASGNB 12
line 6274
;6274:				bs->beStill = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 6276
;6275:
;6276:				if (!bs->campStanding)
ADDRFP4 0
INDIRP4
CNSTI4 2076
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2619
line 6277
;6277:				{
line 6278
;6278:					bs->duckTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2008
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 6279
;6279:				}
line 6280
;6280:			}
line 6281
;6281:		}
ADDRGP4 $2619
JUMPV
LABELV $2618
line 6282
;6282:		else if (gWPArray[goalWPIndex] && gWPArray[goalWPIndex]->inuse &&
ADDRLP4 268
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2630
ADDRLP4 272
CNSTI4 0
ASGNI4
ADDRLP4 268
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 272
INDIRI4
EQI4 $2630
ADDRGP4 gLevelFlags
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 272
INDIRI4
NEI4 $2630
line 6284
;6283:			!(gLevelFlags & LEVELFLAG_NOPOINTPREDICTION))
;6284:		{
line 6285
;6285:			VectorSubtract(gWPArray[goalWPIndex]->origin, bs->origin, a);
ADDRLP4 276
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
ASGNP4
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 276
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 276
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6286
;6286:			vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6287
;6287:			VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6288
;6288:		}
ADDRGP4 $2631
JUMPV
LABELV $2630
line 6290
;6289:		else
;6290:		{
line 6291
;6291:			VectorSubtract(bs->wpCurrent->origin, bs->origin, a);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
ADDRLP4 276
INDIRP4
CNSTI4 1884
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 280
INDIRP4
INDIRP4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 280
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 276
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 284
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 284
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6292
;6292:			vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6293
;6293:			VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6294
;6294:		}
LABELV $2631
LABELV $2619
line 6296
;6295:
;6296:		if (bs->destinationGrabTime < level.time /*&& (!bs->wpDestination || (bs->currentEnemy && bs->frame_Enemy_Vis))*/)
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $2636
line 6297
;6297:		{
line 6298
;6298:			GetIdealDestination(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 GetIdealDestination
CALLV
pop
line 6299
;6299:		}
LABELV $2636
line 6301
;6300:		
;6301:		if (bs->wpCurrent && bs->wpDestination)
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
CNSTU4 0
ASGNU4
ADDRLP4 276
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 280
INDIRU4
EQU4 $2639
ADDRLP4 276
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 280
INDIRU4
EQU4 $2639
line 6302
;6302:		{
line 6303
;6303:			if (TotalTrailDistance(bs->wpCurrent->index, bs->wpDestination->index, bs) == -1)
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
CNSTI4 16
ASGNI4
ADDRLP4 284
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
ADDRLP4 288
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 284
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
ADDRLP4 288
INDIRI4
ADDP4
INDIRI4
ARGI4
ADDRLP4 284
INDIRP4
ARGP4
ADDRLP4 292
ADDRGP4 TotalTrailDistance
CALLF4
ASGNF4
ADDRLP4 292
INDIRF4
CNSTF4 3212836864
NEF4 $2641
line 6304
;6304:			{
line 6305
;6305:				bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 6306
;6306:				bs->destinationGrabTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6307
;6307:			}
LABELV $2641
line 6308
;6308:		}
LABELV $2639
line 6310
;6309:
;6310:		if (bs->frame_Waypoint_Len < BOT_WPTOUCH_DISTANCE)
ADDRFP4 0
INDIRP4
CNSTI4 2044
ADDP4
INDIRF4
CNSTF4 1107296256
GEF4 $2599
line 6311
;6311:		{
line 6312
;6312:			WPTouchRoutine(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WPTouchRoutine
CALLV
pop
line 6314
;6313:
;6314:			if (!bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2646
line 6315
;6315:			{
line 6316
;6316:				desiredIndex = bs->wpCurrent->index+1;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6317
;6317:			}
ADDRGP4 $2647
JUMPV
LABELV $2646
line 6319
;6318:			else
;6319:			{
line 6320
;6320:				desiredIndex = bs->wpCurrent->index-1;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 6321
;6321:			}
LABELV $2647
line 6323
;6322:
;6323:			if (gWPArray[desiredIndex] &&
ADDRLP4 284
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 288
ADDRLP4 284
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2648
ADDRLP4 292
CNSTI4 0
ASGNI4
ADDRLP4 288
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 292
INDIRI4
EQI4 $2648
ADDRLP4 284
INDIRI4
ADDRGP4 gWPNum
INDIRI4
GEI4 $2648
ADDRLP4 284
INDIRI4
ADDRLP4 292
INDIRI4
LTI4 $2648
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
ADDRLP4 296
ADDRGP4 PassWayCheck
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $2648
line 6328
;6324:				gWPArray[desiredIndex]->inuse &&
;6325:				desiredIndex < gWPNum &&
;6326:				desiredIndex >= 0 &&
;6327:				PassWayCheck(bs, desiredIndex))
;6328:			{
line 6329
;6329:				bs->wpCurrent = gWPArray[desiredIndex];
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
ADDRLP4 120
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 6330
;6330:			}
ADDRGP4 $2599
JUMPV
LABELV $2648
line 6332
;6331:			else
;6332:			{
line 6333
;6333:				if (bs->wpDestination)
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2650
line 6334
;6334:				{
line 6335
;6335:					bs->wpDestination = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 1888
ADDP4
CNSTP4 0
ASGNP4
line 6336
;6336:					bs->destinationGrabTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
CVIF4 4
ASGNF4
line 6337
;6337:				}
LABELV $2650
line 6339
;6338:
;6339:				if (bs->wpDirection)
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2653
line 6340
;6340:				{
line 6341
;6341:					bs->wpDirection = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 0
ASGNI4
line 6342
;6342:				}
ADDRGP4 $2599
JUMPV
LABELV $2653
line 6344
;6343:				else
;6344:				{
line 6345
;6345:					bs->wpDirection = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1964
ADDP4
CNSTI4 1
ASGNI4
line 6346
;6346:				}
line 6347
;6347:			}
line 6348
;6348:		}
line 6349
;6349:	}
ADDRGP4 $2599
JUMPV
LABELV $2598
line 6351
;6350:	else //We can't find a waypoint, going to need a fallback routine.
;6351:	{
line 6353
;6352:		/*if (g_gametype.integer == GT_TOURNAMENT)*/
;6353:		{ //helps them get out of messy situations
line 6360
;6354:			/*if ((level.time - bs->forceJumpChargeTime) > 3500)
;6355:			{
;6356:				bs->forceJumpChargeTime = level.time + 2000;
;6357:				trap_EA_MoveForward(bs->client);
;6358:			}
;6359:			*/
;6360:			bs->jumpTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 6361
;6361:			bs->jumpHoldTime = level.time + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 2016
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 6362
;6362:			bs->jDelay = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2028
ADDP4
CNSTF4 0
ASGNF4
line 6363
;6363:		}
line 6364
;6364:		doingFallback = BotFallbackNavigation(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
ADDRGP4 BotFallbackNavigation
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 256
INDIRI4
ASGNI4
line 6365
;6365:	}
LABELV $2599
line 6367
;6366:
;6367:	if (doingFallback)
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2657
line 6368
;6368:	{
line 6369
;6369:		bs->doingFallback = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 4804
ADDP4
CNSTI4 1
ASGNI4
line 6370
;6370:	}
ADDRGP4 $2658
JUMPV
LABELV $2657
line 6372
;6371:	else
;6372:	{
line 6373
;6373:		bs->doingFallback = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 4804
ADDP4
CNSTI4 0
ASGNI4
line 6374
;6374:	}
LABELV $2658
line 6376
;6375:
;6376:	if (bs->timeToReact < level.time && bs->currentEnemy && bs->enemySeenTime > level.time + (ENEMY_FORGET_MS - (ENEMY_FORGET_MS*0.2)))
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
CNSTI4 1992
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $2659
ADDRLP4 256
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2659
ADDRLP4 256
INDIRP4
CNSTI4 1996
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
CNSTF4 1174011904
ADDF4
LEF4 $2659
line 6377
;6377:	{
line 6378
;6378:		if (bs->frame_Enemy_Vis)
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2663
line 6379
;6379:		{
line 6380
;6380:			CombatBotAI(bs, thinktime);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 CombatBotAI
CALLI4
pop
line 6381
;6381:		}
ADDRGP4 $2664
JUMPV
LABELV $2663
line 6382
;6382:		else if (bs->cur_ps.weaponstate == WEAPON_CHARGING_ALT)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2665
line 6383
;6383:		{ //keep charging in case we see him again before we lose track of him
line 6384
;6384:			bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6385
;6385:		}
ADDRGP4 $2666
JUMPV
LABELV $2665
line 6386
;6386:		else if (bs->cur_ps.weaponstate == WEAPON_CHARGING)
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2667
line 6387
;6387:		{ //keep charging in case we see him again before we lose track of him
line 6388
;6388:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6389
;6389:		}
LABELV $2667
LABELV $2666
LABELV $2664
line 6391
;6390:
;6391:		if (bs->destinationGrabTime > level.time + 100)
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
LEF4 $2669
line 6392
;6392:		{
line 6393
;6393:			bs->destinationGrabTime = level.time + 100; //assures that we will continue staying within a general area of where we want to be in a combat situation
ADDRFP4 0
INDIRP4
CNSTI4 1968
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 6394
;6394:		}
LABELV $2669
line 6396
;6395:
;6396:		if (bs->currentEnemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2673
line 6397
;6397:		{
line 6398
;6398:			VectorCopy(bs->currentEnemy->client->ps.origin, headlevel);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 6399
;6399:			headlevel[2] += bs->currentEnemy->client->ps.viewheight;
ADDRLP4 108+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
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
line 6400
;6400:		}
ADDRGP4 $2674
JUMPV
LABELV $2673
line 6402
;6401:		else
;6402:		{
line 6403
;6403:			VectorCopy(bs->currentEnemy->client->ps.origin, headlevel);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 6404
;6404:		}
LABELV $2674
line 6406
;6405:
;6406:		if (!bs->frame_Enemy_Vis)
ADDRFP4 0
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2676
line 6407
;6407:		{
line 6409
;6408:			//if (!bs->hitSpotted && VectorLength(a) > 256)
;6409:			if (OrgVisible(bs->eye, bs->lastEnemySpotted, -1))
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 1744
ADDP4
ARGP4
ADDRLP4 260
INDIRP4
CNSTI4 1932
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 264
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $2677
line 6410
;6410:			{
line 6411
;6411:				VectorCopy(bs->lastEnemySpotted, headlevel);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 1932
ADDP4
INDIRB
ASGNB 12
line 6412
;6412:				VectorSubtract(headlevel, bs->eye, a);
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 108+4
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6413
;6413:				vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6414
;6414:				VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6416
;6415:
;6416:				if (bs->cur_ps.weapon == WP_FLECHETTE &&
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 9
NEI4 $2677
ADDRLP4 272
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2677
ADDRLP4 276
ADDRLP4 272
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 280
CNSTU4 0
ASGNU4
ADDRLP4 276
INDIRP4
CVPU4 4
ADDRLP4 280
INDIRU4
EQU4 $2677
ADDRLP4 276
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 280
INDIRU4
EQU4 $2677
line 6419
;6417:					bs->cur_ps.weaponstate == WEAPON_READY &&
;6418:					bs->currentEnemy && bs->currentEnemy->client)
;6419:				{
line 6420
;6420:					mLen = VectorLength(a) > 128;
ADDRLP4 0
ARGP4
ADDRLP4 288
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 288
INDIRF4
CNSTF4 1124073472
LEF4 $2687
ADDRLP4 284
CNSTI4 1
ASGNI4
ADDRGP4 $2688
JUMPV
LABELV $2687
ADDRLP4 284
CNSTI4 0
ASGNI4
LABELV $2688
ADDRLP4 160
ADDRLP4 284
INDIRI4
CVIF4 4
ASGNF4
line 6421
;6421:					if (mLen > 128 && mLen < 1024)
ADDRLP4 292
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 292
INDIRF4
CNSTF4 1124073472
LEF4 $2677
ADDRLP4 292
INDIRF4
CNSTF4 1149239296
GEF4 $2677
line 6422
;6422:					{
line 6423
;6423:						VectorSubtract(bs->currentEnemy->client->ps.origin, bs->lastEnemySpotted, a);
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
ADDRLP4 296
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 304
CNSTI4 408
ASGNI4
ADDRLP4 0
ADDRLP4 300
INDIRP4
INDIRP4
ADDRLP4 304
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 296
INDIRP4
CNSTI4 1932
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 300
INDIRP4
INDIRP4
ADDRLP4 304
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 296
INDIRP4
CNSTI4 1936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 308
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 308
INDIRP4
CNSTI4 1940
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6425
;6424:
;6425:						if (VectorLength(a) < 300)
ADDRLP4 0
ARGP4
ADDRLP4 312
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 312
INDIRF4
CNSTF4 1133903872
GEF4 $2677
line 6426
;6426:						{
line 6427
;6427:							bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6428
;6428:						}
line 6429
;6429:					}
line 6430
;6430:				}
line 6431
;6431:			}
line 6432
;6432:		}
ADDRGP4 $2677
JUMPV
LABELV $2676
line 6434
;6433:		else
;6434:		{
line 6435
;6435:			bLeadAmount = BotWeaponCanLead(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotWeaponCanLead
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 260
INDIRF4
ASGNF4
line 6436
;6436:			if ((bs->skills.accuracy/bs->settings.skill) <= 8 &&
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 2320
ADDP4
INDIRF4
ADDRLP4 264
INDIRP4
CNSTI4 1568
ADDP4
INDIRF4
DIVF4
CNSTF4 1090519040
GTF4 $2695
ADDRLP4 156
INDIRF4
CNSTF4 0
EQF4 $2695
line 6438
;6437:				bLeadAmount)
;6438:			{
line 6439
;6439:				BotAimLeading(bs, headlevel, bLeadAmount);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 156
INDIRF4
ARGF4
ADDRGP4 BotAimLeading
CALLV
pop
line 6440
;6440:			}
ADDRGP4 $2696
JUMPV
LABELV $2695
line 6442
;6441:			else
;6442:			{
line 6443
;6443:				VectorSubtract(headlevel, bs->eye, a);
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 108
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 108+4
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 108+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6444
;6444:				vectoangles(a, ang);
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6445
;6445:				VectorCopy(ang, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 6446
;6446:			}
LABELV $2696
line 6448
;6447:
;6448:			BotAimOffsetGoalAngles(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotAimOffsetGoalAngles
CALLV
pop
line 6449
;6449:		}
LABELV $2677
line 6450
;6450:	}
LABELV $2659
line 6452
;6451:
;6452:	if (bs->cur_ps.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2701
line 6453
;6453:	{
line 6454
;6454:		bs->saberThrowTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 4000, 10000, qfalse, 7000);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 4000
ARGI4
CNSTI4 10000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 7000
ARGI4
ADDRLP4 260
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2728
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 260
INDIRI4
ADDI4
ASGNI4
line 6455
;6455:	}
LABELV $2701
line 6457
;6456:
;6457:	if (bs->currentEnemy)
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2704
line 6458
;6458:	{
line 6459
;6459:		if (BotGetWeaponRange(bs) == BWEAPONRANGE_SABER)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 4
NEI4 $2706
line 6460
;6460:		{
line 6461
;6461:			int saberRange = SABER_ATTACK_RANGE;
ADDRLP4 264
CNSTI4 128
ASGNI4
line 6463
;6462:
;6463:			VectorSubtract(bs->currentEnemy->client->ps.origin, bs->eye, a_fo);
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
ADDRLP4 268
INDIRP4
CNSTI4 1816
ADDP4
ASGNP4
ADDRLP4 276
CNSTI4 408
ASGNI4
ADDRLP4 20
ADDRLP4 272
INDIRP4
INDIRP4
ADDRLP4 276
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 272
INDIRP4
INDIRP4
ADDRLP4 276
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20+8
ADDRLP4 280
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 280
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6464
;6464:			vectoangles(a_fo, a_fo);
ADDRLP4 20
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6466
;6465:
;6466:			if (bs->saberPowerTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2736
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $2710
line 6467
;6467:			{ //Don't just use strong attacks constantly, switch around a bit
line 6468
;6468:				if (Q_irand(1, 10, qfalse, 5) <= 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 284
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 5
GTI4 $2713
line 6469
;6469:				{
line 6470
;6470:					bs->saberPower = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2732
ADDP4
CNSTI4 1
ASGNI4
line 6471
;6471:				}
ADDRGP4 $2714
JUMPV
LABELV $2713
line 6473
;6472:				else
;6473:				{
line 6474
;6474:					bs->saberPower = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 2732
ADDP4
CNSTI4 0
ASGNI4
line 6475
;6475:				}
LABELV $2714
line 6477
;6476:
;6477:				bs->saberPowerTime = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 3000, 15000, qfalse, 9000);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
CNSTI4 15000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 9000
ARGI4
ADDRLP4 288
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2736
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 288
INDIRI4
ADDI4
ASGNI4
line 6478
;6478:			}
LABELV $2710
line 6480
;6479:
;6480:			if (bs->currentEnemy->health > 75 && g_entities[bs->client].client->ps.fd.forcePowerLevel[FP_SABERATTACK] > 2)
ADDRLP4 284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 75
LEI4 $2716
CNSTI4 2352
ADDRLP4 284
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 2
LEI4 $2716
line 6481
;6481:			{
line 6482
;6482:				if (g_entities[bs->client].client->ps.fd.saberAnimLevel != FORCE_LEVEL_3 && bs->saberPower)
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 2352
ADDRLP4 288
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2717
ADDRLP4 288
INDIRP4
CNSTI4 2732
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2717
line 6483
;6483:				{ //if we are up against someone with a lot of health and we have a strong attack available, then h4q them
line 6484
;6484:					Cmd_SaberAttackCycle_f(&g_entities[bs->client]);
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_SaberAttackCycle_f
CALLV
pop
line 6485
;6485:				}
line 6486
;6486:			}
ADDRGP4 $2717
JUMPV
LABELV $2716
line 6487
;6487:			else if (bs->currentEnemy->health > 40 && g_entities[bs->client].client->ps.fd.forcePowerLevel[FP_SABERATTACK] > 1)
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 40
LEI4 $2722
CNSTI4 2352
ADDRLP4 288
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2722
line 6488
;6488:			{
line 6489
;6489:				if (g_entities[bs->client].client->ps.fd.saberAnimLevel != FORCE_LEVEL_2)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2723
line 6490
;6490:				{ //they're down on health a little, use level 2 if we can
line 6491
;6491:					Cmd_SaberAttackCycle_f(&g_entities[bs->client]);
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_SaberAttackCycle_f
CALLV
pop
line 6492
;6492:				}
line 6493
;6493:			}
ADDRGP4 $2723
JUMPV
LABELV $2722
line 6495
;6494:			else
;6495:			{
line 6496
;6496:				if (g_entities[bs->client].client->ps.fd.saberAnimLevel != FORCE_LEVEL_1)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 1
EQI4 $2728
line 6497
;6497:				{ //they've gone below 40 health, go at them with quick attacks
line 6498
;6498:					Cmd_SaberAttackCycle_f(&g_entities[bs->client]);
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_SaberAttackCycle_f
CALLV
pop
line 6499
;6499:				}
LABELV $2728
line 6500
;6500:			}
LABELV $2723
LABELV $2717
line 6502
;6501:
;6502:			if (g_gametype.integer == GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $2731
line 6503
;6503:			{
line 6504
;6504:				saberRange *= 3;
ADDRLP4 264
CNSTI4 3
ADDRLP4 264
INDIRI4
MULI4
ASGNI4
line 6505
;6505:			}
LABELV $2731
line 6507
;6506:
;6507:			if (bs->frame_Enemy_Len <= saberRange)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ADDRLP4 264
INDIRI4
CVIF4 4
GTF4 $2734
line 6508
;6508:			{
line 6509
;6509:				SaberCombatHandling(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SaberCombatHandling
CALLV
pop
line 6511
;6510:
;6511:				if (bs->frame_Enemy_Len < 80)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1117782016
GEF4 $2707
line 6512
;6512:				{
line 6513
;6513:					meleestrafe = 1;
ADDRLP4 92
CNSTI4 1
ASGNI4
line 6514
;6514:				}
line 6515
;6515:			}
ADDRGP4 $2707
JUMPV
LABELV $2734
line 6516
;6516:			else if (bs->saberThrowTime < level.time && !bs->cur_ps.saberInFlight &&
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 2728
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $2738
ADDRLP4 296
CNSTI4 0
ASGNI4
ADDRLP4 292
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 296
INDIRI4
NEI4 $2738
ADDRLP4 292
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
ADDRLP4 296
INDIRI4
EQI4 $2738
ADDRLP4 292
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1106247680
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 300
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $2738
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1145569280
GEF4 $2738
line 6520
;6517:				(bs->cur_ps.fd.forcePowersKnown & (1 << FP_SABERTHROW)) &&
;6518:				InFieldOfVision(bs->viewangles, 30, a_fo) &&
;6519:				bs->frame_Enemy_Len < BOT_SABER_THROW_RANGE)
;6520:			{
line 6521
;6521:				bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6522
;6522:				bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6523
;6523:			}
ADDRGP4 $2707
JUMPV
LABELV $2738
line 6524
;6524:			else if (bs->cur_ps.saberInFlight && bs->frame_Enemy_Len > 300 && bs->frame_Enemy_Len < BOT_SABER_THROW_RANGE)
ADDRLP4 304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2707
ADDRLP4 308
ADDRLP4 304
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
ASGNF4
ADDRLP4 308
INDIRF4
CNSTF4 1133903872
LEF4 $2707
ADDRLP4 308
INDIRF4
CNSTF4 1145569280
GEF4 $2707
line 6525
;6525:			{
line 6526
;6526:				bs->doAltAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 1
ASGNI4
line 6527
;6527:				bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6528
;6528:			}
line 6529
;6529:		}
ADDRGP4 $2707
JUMPV
LABELV $2706
line 6530
;6530:		else if (BotGetWeaponRange(bs) == BWEAPONRANGE_MELEE)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 1
NEI4 $2743
line 6531
;6531:		{
line 6532
;6532:			if (bs->frame_Enemy_Len <= MELEE_ATTACK_RANGE)
ADDRFP4 0
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
GTF4 $2745
line 6533
;6533:			{
line 6534
;6534:				MeleeCombatHandling(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MeleeCombatHandling
CALLV
pop
line 6535
;6535:				meleestrafe = 1;
ADDRLP4 92
CNSTI4 1
ASGNI4
line 6536
;6536:			}
LABELV $2745
line 6537
;6537:		}
LABELV $2743
LABELV $2707
line 6538
;6538:	}
LABELV $2704
line 6540
;6539:
;6540:	if (doingFallback && bs->currentEnemy) //just stand and fire if we have no idea where we are
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2747
ADDRFP4 0
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2747
line 6541
;6541:	{
line 6542
;6542:		VectorCopy(bs->origin, bs->goalPosition);
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 1920
ADDP4
ADDRLP4 260
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 6543
;6543:	}
LABELV $2747
line 6545
;6544:
;6545:	if (bs->forceJumping > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2024
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $2749
line 6546
;6546:	{
line 6547
;6547:		VectorCopy(bs->origin, noz_x);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 6548
;6548:		VectorCopy(bs->goalPosition, noz_y);
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
INDIRB
ASGNB 12
line 6550
;6549:
;6550:		noz_x[2] = noz_y[2];
ADDRLP4 36+8
ADDRLP4 68+8
INDIRF4
ASGNF4
line 6552
;6551:
;6552:		VectorSubtract(noz_x, noz_y, noz_x);
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 36+4
INDIRF4
ADDRLP4 68+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 36+8
INDIRF4
ADDRLP4 68+8
INDIRF4
SUBF4
ASGNF4
line 6554
;6553:
;6554:		if (VectorLength(noz_x) < 32)
ADDRLP4 36
ARGP4
ADDRLP4 260
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 260
INDIRF4
CNSTF4 1107296256
GEF4 $2760
line 6555
;6555:		{
line 6556
;6556:			fjHalt = 1;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 6557
;6557:		}
LABELV $2760
line 6558
;6558:	}
LABELV $2749
line 6560
;6559:
;6560:	if (bs->doChat && bs->chatTime > level.time && (!bs->currentEnemy || !bs->frame_Enemy_Vis))
ADDRLP4 260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
CNSTI4 0
ASGNI4
ADDRLP4 260
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $2762
ADDRLP4 260
INDIRP4
CNSTI4 2228
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $2762
ADDRLP4 260
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2765
ADDRLP4 260
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 264
INDIRI4
NEI4 $2762
LABELV $2765
line 6561
;6561:	{
line 6562
;6562:		return;
ADDRGP4 $2376
JUMPV
LABELV $2762
line 6564
;6563:	}
;6564:	else if (bs->doChat && bs->currentEnemy && bs->frame_Enemy_Vis)
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
CNSTI4 0
ASGNI4
ADDRLP4 268
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
ADDRLP4 272
INDIRI4
EQI4 $2766
ADDRLP4 268
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2766
ADDRLP4 268
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 272
INDIRI4
EQI4 $2766
line 6565
;6565:	{
line 6567
;6566:		//bs->chatTime = level.time + bs->chatTime_stored;
;6567:		bs->doChat = 0; //do we want to keep the bot waiting to chat until after the enemy is gone?
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
CNSTI4 0
ASGNI4
line 6568
;6568:		bs->chatTeam = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2240
ADDP4
CNSTI4 0
ASGNI4
line 6569
;6569:	}
ADDRGP4 $2767
JUMPV
LABELV $2766
line 6570
;6570:	else if (bs->doChat && bs->chatTime <= level.time)
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2768
ADDRLP4 276
INDIRP4
CNSTI4 2228
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GTF4 $2768
line 6571
;6571:	{
line 6572
;6572:		if (bs->chatTeam)
ADDRFP4 0
INDIRP4
CNSTI4 2240
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2771
line 6573
;6573:		{
line 6574
;6574:			trap_EA_SayTeam(bs->client, bs->currentChat);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRP4
CNSTI4 2100
ADDP4
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 6575
;6575:			bs->chatTeam = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2240
ADDP4
CNSTI4 0
ASGNI4
line 6576
;6576:		}
ADDRGP4 $2772
JUMPV
LABELV $2771
line 6578
;6577:		else
;6578:		{
line 6579
;6579:			trap_EA_Say(bs->client, bs->currentChat);
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRP4
CNSTI4 2100
ADDP4
ARGP4
ADDRGP4 trap_EA_Say
CALLV
pop
line 6580
;6580:		}
LABELV $2772
line 6581
;6581:		if (bs->doChat == 2)
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2773
line 6582
;6582:		{
line 6583
;6583:			BotReplyGreetings(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotReplyGreetings
CALLV
pop
line 6584
;6584:		}
LABELV $2773
line 6585
;6585:		bs->doChat = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
CNSTI4 0
ASGNI4
line 6586
;6586:	}
LABELV $2768
LABELV $2767
line 6588
;6587:
;6588:	CTFFlagMovement(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CTFFlagMovement
CALLV
pop
line 6590
;6589:
;6590:	if (/*bs->wpDestination &&*/ bs->shootGoal &&
ADDRLP4 280
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 280
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2775
ADDRLP4 284
CNSTI4 0
ASGNI4
ADDRLP4 280
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 284
INDIRI4
LEI4 $2775
ADDRLP4 280
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 284
INDIRI4
EQI4 $2775
line 6593
;6591:		/*bs->wpDestination->associated_entity == bs->shootGoal->s.number &&*/
;6592:		bs->shootGoal->health > 0 && bs->shootGoal->takedamage)
;6593:	{
line 6594
;6594:		dif[0] = (bs->shootGoal->r.absmax[0]+bs->shootGoal->r.absmin[0])/2;
ADDRLP4 288
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 288
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 288
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 6595
;6595:		dif[1] = (bs->shootGoal->r.absmax[1]+bs->shootGoal->r.absmin[1])/2;
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80+4
ADDRLP4 292
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 292
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 6596
;6596:		dif[2] = (bs->shootGoal->r.absmax[2]+bs->shootGoal->r.absmin[2])/2;
ADDRLP4 296
ADDRFP4 0
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80+8
ADDRLP4 296
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 296
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 6598
;6597:
;6598:		if (!bs->currentEnemy || bs->frame_Enemy_Len > 256)
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2781
ADDRLP4 300
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1132462080
LEF4 $2779
LABELV $2781
line 6599
;6599:		{ //if someone is close then don't stop shooting them for this
line 6600
;6600:			VectorSubtract(dif, bs->eye, a);
ADDRLP4 304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRF4
ADDRLP4 304
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80+4
INDIRF4
ADDRLP4 304
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 80+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6601
;6601:			vectoangles(a, a);
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6602
;6602:			VectorCopy(a, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 6604
;6603:
;6604:			if (InFieldOfVision(bs->viewangles, 30, a) &&
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1106247680
ARGF4
ADDRLP4 0
ARGP4
ADDRLP4 308
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $2786
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 316
CNSTP4 0
ASGNP4
ADDRLP4 316
INDIRP4
ARGP4
ADDRLP4 316
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 312
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 320
ADDRGP4 EntityVisibleBox
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
EQI4 $2786
line 6606
;6605:				EntityVisibleBox(bs->origin, NULL, NULL, dif, bs->client, bs->shootGoal->s.number))
;6606:			{
line 6607
;6607:				bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6608
;6608:			}
LABELV $2786
line 6609
;6609:		}
LABELV $2779
line 6610
;6610:	}
LABELV $2775
line 6612
;6611:
;6612:	if (bs->cur_ps.hasDetPackPlanted)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2788
line 6613
;6613:	{ //check if our enemy gets near it and detonate if he does
line 6614
;6614:		BotCheckDetPacks(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckDetPacks
CALLV
pop
line 6615
;6615:	}
ADDRGP4 $2789
JUMPV
LABELV $2788
line 6616
;6616:	else if (bs->currentEnemy && bs->lastVisibleEnemyIndex == bs->currentEnemy->s.number && !bs->frame_Enemy_Vis && bs->plantTime < level.time &&
ADDRLP4 288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
ADDRLP4 288
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2790
ADDRLP4 288
INDIRP4
CNSTI4 1956
ADDP4
INDIRI4
ADDRLP4 292
INDIRP4
INDIRI4
NEI4 $2790
ADDRLP4 296
CNSTI4 0
ASGNI4
ADDRLP4 288
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 296
INDIRI4
NEI4 $2790
ADDRLP4 288
INDIRP4
CNSTI4 2292
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $2790
ADDRLP4 288
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
ADDRLP4 296
INDIRI4
NEI4 $2790
ADDRLP4 288
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
ADDRLP4 296
INDIRI4
NEI4 $2790
line 6618
;6617:		!bs->doAttack && !bs->doAltAttack)
;6618:	{
line 6619
;6619:		VectorSubtract(bs->origin, bs->hereWhenSpotted, a);
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 300
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 300
INDIRP4
CNSTI4 1944
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 300
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 300
INDIRP4
CNSTI4 1948
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 304
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 304
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRLP4 304
INDIRP4
CNSTI4 1952
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6621
;6620:
;6621:		if (bs->plantDecided > level.time || (bs->frame_Enemy_Len < BOT_PLANT_DISTANCE*2 && VectorLength(a) < BOT_PLANT_DISTANCE))
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CNSTI4 2296
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GTI4 $2798
ADDRLP4 308
INDIRP4
CNSTI4 2052
ADDP4
INDIRF4
CNSTF4 1140850688
GEF4 $2791
ADDRLP4 0
ARGP4
ADDRLP4 312
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 312
INDIRF4
CNSTF4 1132462080
GEF4 $2791
LABELV $2798
line 6622
;6622:		{
line 6623
;6623:			mineSelect = BotSelectChoiceWeapon(bs, WP_TRIP_MINE, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 316
ADDRGP4 BotSelectChoiceWeapon
CALLI4
ASGNI4
ADDRLP4 152
ADDRLP4 316
INDIRI4
ASGNI4
line 6624
;6624:			detSelect = BotSelectChoiceWeapon(bs, WP_DET_PACK, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 320
ADDRGP4 BotSelectChoiceWeapon
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 320
INDIRI4
ASGNI4
line 6625
;6625:			if (bs->cur_ps.hasDetPackPlanted)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2799
line 6626
;6626:			{
line 6627
;6627:				detSelect = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 6628
;6628:			}
LABELV $2799
line 6630
;6629:
;6630:			if (bs->plantDecided > level.time && bs->forceWeaponSelect &&
ADDRLP4 324
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 324
INDIRP4
CNSTI4 2296
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $2801
ADDRLP4 328
ADDRLP4 324
INDIRP4
CNSTI4 2284
ADDP4
INDIRI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $2801
ADDRLP4 324
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRLP4 328
INDIRI4
NEI4 $2801
line 6632
;6631:				bs->cur_ps.weapon == bs->forceWeaponSelect)
;6632:			{
line 6633
;6633:				bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6634
;6634:				bs->plantDecided = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2296
ADDP4
CNSTI4 0
ASGNI4
line 6635
;6635:				bs->plantTime = level.time + BOT_PLANT_INTERVAL;
ADDRFP4 0
INDIRP4
CNSTI4 2292
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 6636
;6636:				bs->plantContinue = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 2300
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 6637
;6637:				bs->beStill = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 6638
;6638:			}
ADDRGP4 $2791
JUMPV
LABELV $2801
line 6639
;6639:			else if (mineSelect || detSelect)
ADDRLP4 332
CNSTI4 0
ASGNI4
ADDRLP4 152
INDIRI4
ADDRLP4 332
INDIRI4
NEI4 $2809
ADDRLP4 140
INDIRI4
ADDRLP4 332
INDIRI4
EQI4 $2791
LABELV $2809
line 6640
;6640:			{
line 6641
;6641:				if (BotSurfaceNear(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 336
ADDRGP4 BotSurfaceNear
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
EQI4 $2791
line 6642
;6642:				{
line 6643
;6643:					if (!mineSelect)
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $2812
line 6644
;6644:					{ //if no mines use detpacks, otherwise use mines
line 6645
;6645:						mineSelect = WP_DET_PACK;
ADDRLP4 152
CNSTI4 13
ASGNI4
line 6646
;6646:					}
ADDRGP4 $2813
JUMPV
LABELV $2812
line 6648
;6647:					else
;6648:					{
line 6649
;6649:						mineSelect = WP_TRIP_MINE;
ADDRLP4 152
CNSTI4 12
ASGNI4
line 6650
;6650:					}
LABELV $2813
line 6652
;6651:
;6652:					detSelect = BotSelectChoiceWeapon(bs, mineSelect, 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 152
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 340
ADDRGP4 BotSelectChoiceWeapon
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 340
INDIRI4
ASGNI4
line 6654
;6653:
;6654:					if (detSelect && detSelect != 2)
ADDRLP4 344
ADDRLP4 140
INDIRI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $2814
ADDRLP4 344
INDIRI4
CNSTI4 2
EQI4 $2814
line 6655
;6655:					{ //We have it and it is now our weapon
line 6656
;6656:						bs->plantDecided = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2296
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 6657
;6657:						bs->forceWeaponSelect = mineSelect;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 6658
;6658:						return;
ADDRGP4 $2376
JUMPV
LABELV $2814
line 6660
;6659:					}
;6660:					else if (detSelect == 2)
ADDRLP4 140
INDIRI4
CNSTI4 2
NEI4 $2791
line 6661
;6661:					{
line 6662
;6662:						bs->forceWeaponSelect = mineSelect;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 6663
;6663:						return;
ADDRGP4 $2376
JUMPV
line 6665
;6664:					}
;6665:				}
line 6666
;6666:			}
line 6667
;6667:		}
line 6668
;6668:	}
LABELV $2790
line 6669
;6669:	else if (bs->plantContinue < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2300
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $2819
line 6670
;6670:	{
line 6671
;6671:		bs->forceWeaponSelect = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2284
ADDP4
CNSTI4 0
ASGNI4
line 6672
;6672:	}
LABELV $2819
LABELV $2791
LABELV $2789
line 6674
;6673:
;6674:	if (g_gametype.integer == GT_JEDIMASTER && !bs->cur_ps.isJediMaster && bs->jmState == -1 && gJMSaberEnt && gJMSaberEnt->inuse)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $2822
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 304
CNSTI4 0
ASGNI4
ADDRLP4 300
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
ADDRLP4 304
INDIRI4
NEI4 $2822
ADDRLP4 300
INDIRP4
CNSTI4 2700
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $2822
ADDRLP4 308
ADDRGP4 gJMSaberEnt
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2822
ADDRLP4 308
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 304
INDIRI4
EQI4 $2822
line 6675
;6675:	{
line 6677
;6676:		vec3_t saberLen;
;6677:		float fSaberLen = 0;
ADDRLP4 324
CNSTF4 0
ASGNF4
line 6679
;6678:
;6679:		VectorSubtract(bs->origin, gJMSaberEnt->r.currentOrigin, saberLen);
ADDRLP4 328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 332
ADDRGP4 gJMSaberEnt
INDIRP4
ASGNP4
ADDRLP4 312
ADDRLP4 328
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
ADDRLP4 332
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 312+4
ADDRLP4 328
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
ADDRLP4 332
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 312+8
ADDRFP4 0
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
ADDRGP4 gJMSaberEnt
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6680
;6680:		fSaberLen = VectorLength(saberLen);
ADDRLP4 312
ARGP4
ADDRLP4 336
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 324
ADDRLP4 336
INDIRF4
ASGNF4
line 6682
;6681:
;6682:		if (fSaberLen < 256)
ADDRLP4 324
INDIRF4
CNSTF4 1132462080
GEF4 $2827
line 6683
;6683:		{
line 6684
;6684:			if (OrgVisible(bs->origin, gJMSaberEnt->r.currentOrigin, bs->client))
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 340
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRGP4 gJMSaberEnt
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 340
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 344
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 0
EQI4 $2829
line 6685
;6685:			{
line 6686
;6686:				VectorCopy(gJMSaberEnt->r.currentOrigin, bs->goalPosition);
ADDRFP4 0
INDIRP4
CNSTI4 1920
ADDP4
ADDRGP4 gJMSaberEnt
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 6687
;6687:			}
LABELV $2829
line 6688
;6688:		}
LABELV $2827
line 6689
;6689:	}
LABELV $2822
line 6691
;6690:
;6691:	if (bs->beStill < level.time && !WaitingForNow(bs, bs->goalPosition) && !fjHalt)
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 312
INDIRP4
CNSTI4 2004
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $2831
ADDRLP4 312
INDIRP4
ARGP4
ADDRLP4 312
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 316
ADDRGP4 WaitingForNow
CALLI4
ASGNI4
ADDRLP4 320
CNSTI4 0
ASGNI4
ADDRLP4 316
INDIRI4
ADDRLP4 320
INDIRI4
NEI4 $2831
ADDRLP4 96
INDIRI4
ADDRLP4 320
INDIRI4
NEI4 $2831
line 6692
;6692:	{
line 6693
;6693:		VectorSubtract(bs->goalPosition, bs->origin, bs->goalMovedir);
ADDRLP4 324
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 324
INDIRP4
CNSTI4 1908
ADDP4
ADDRLP4 324
INDIRP4
CNSTI4 1920
ADDP4
INDIRF4
ADDRLP4 324
INDIRP4
CNSTI4 1720
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
CNSTI4 1912
ADDP4
ADDRLP4 328
INDIRP4
CNSTI4 1924
ADDP4
INDIRF4
ADDRLP4 328
INDIRP4
CNSTI4 1724
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 332
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 332
INDIRP4
CNSTI4 1916
ADDP4
ADDRLP4 332
INDIRP4
CNSTI4 1928
ADDP4
INDIRF4
ADDRLP4 332
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6694
;6694:		VectorNormalize(bs->goalMovedir);
ADDRFP4 0
INDIRP4
CNSTI4 1908
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6696
;6695:
;6696:		if (bs->jumpTime > level.time && bs->jDelay < level.time &&
ADDRLP4 336
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 336
INDIRP4
CNSTI4 2012
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $2834
ADDRLP4 336
INDIRP4
CNSTI4 2028
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $2834
CNSTI4 53196
ADDRLP4 336
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $2834
line 6698
;6697:			level.clients[bs->client].pers.cmd.upmove > 0)
;6698:		{
line 6700
;6699:		//	trap_EA_Move(bs->client, bs->origin, 5000);
;6700:			bs->beStill = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 2004
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 200
ADDI4
CVIF4 4
ASGNF4
line 6701
;6701:		}
ADDRGP4 $2835
JUMPV
LABELV $2834
line 6703
;6702:		else
;6703:		{
line 6704
;6704:			trap_EA_Move(bs->client, bs->goalMovedir, 5000);
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 340
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 340
INDIRP4
CNSTI4 1908
ADDP4
ARGP4
CNSTF4 1167867904
ARGF4
ADDRGP4 trap_EA_Move
CALLV
pop
line 6705
;6705:		}
LABELV $2835
line 6707
;6706:
;6707:		if (meleestrafe)
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $2839
line 6708
;6708:		{
line 6709
;6709:			StrafeTracing(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StrafeTracing
CALLV
pop
line 6710
;6710:		}
LABELV $2839
line 6712
;6711:
;6712:		if (bs->meleeStrafeDir && meleestrafe && bs->meleeStrafeDisable < level.time)
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
CNSTI4 0
ASGNI4
ADDRLP4 340
INDIRP4
CNSTI4 2256
ADDP4
INDIRI4
ADDRLP4 344
INDIRI4
EQI4 $2841
ADDRLP4 92
INDIRI4
ADDRLP4 344
INDIRI4
EQI4 $2841
ADDRLP4 340
INDIRP4
CNSTI4 2260
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $2841
line 6713
;6713:		{
line 6714
;6714:			trap_EA_MoveRight(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveRight
CALLV
pop
line 6715
;6715:		}
ADDRGP4 $2842
JUMPV
LABELV $2841
line 6716
;6716:		else if (meleestrafe && bs->meleeStrafeDisable < level.time)
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $2844
ADDRFP4 0
INDIRP4
CNSTI4 2260
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $2844
line 6717
;6717:		{
line 6718
;6718:			trap_EA_MoveLeft(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveLeft
CALLV
pop
line 6719
;6719:		}
LABELV $2844
LABELV $2842
line 6721
;6720:
;6721:		if (BotTrace_Jump(bs, bs->goalPosition))
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
ARGP4
ADDRLP4 348
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 352
ADDRGP4 BotTrace_Jump
CALLI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
EQI4 $2847
line 6722
;6722:		{
line 6723
;6723:			bs->jumpTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 6724
;6724:		}
ADDRGP4 $2848
JUMPV
LABELV $2847
line 6725
;6725:		else if (BotTrace_Duck(bs, bs->goalPosition))
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 356
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 360
ADDRGP4 BotTrace_Duck
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $2850
line 6726
;6726:		{
line 6727
;6727:			bs->duckTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 2008
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 6728
;6728:		}
ADDRGP4 $2851
JUMPV
LABELV $2850
line 6731
;6729:#ifdef BOT_STRAFE_AVOIDANCE
;6730:		else
;6731:		{
line 6732
;6732:			int strafeAround = BotTrace_Strafe(bs, bs->goalPosition);
ADDRLP4 368
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 368
INDIRP4
ARGP4
ADDRLP4 368
INDIRP4
CNSTI4 1920
ADDP4
ARGP4
ADDRLP4 372
ADDRGP4 BotTrace_Strafe
CALLI4
ASGNI4
ADDRLP4 364
ADDRLP4 372
INDIRI4
ASGNI4
line 6734
;6733:
;6734:			if (strafeAround == STRAFEAROUND_RIGHT)
ADDRLP4 364
INDIRI4
CNSTI4 1
NEI4 $2853
line 6735
;6735:			{
line 6736
;6736:				trap_EA_MoveRight(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveRight
CALLV
pop
line 6737
;6737:			}
ADDRGP4 $2854
JUMPV
LABELV $2853
line 6738
;6738:			else if (strafeAround == STRAFEAROUND_LEFT)
ADDRLP4 364
INDIRI4
CNSTI4 2
NEI4 $2855
line 6739
;6739:			{
line 6740
;6740:				trap_EA_MoveLeft(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveLeft
CALLV
pop
line 6741
;6741:			}
LABELV $2855
LABELV $2854
line 6742
;6742:		}
LABELV $2851
LABELV $2848
line 6744
;6743:#endif
;6744:	}
LABELV $2831
line 6747
;6745:
;6746:#ifndef FORCEJUMP_INSTANTMETHOD
;6747:	if (bs->forceJumpChargeTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $2857
line 6748
;6748:	{
line 6749
;6749:		bs->jumpTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2012
ADDP4
CNSTF4 0
ASGNF4
line 6750
;6750:	}
LABELV $2857
line 6753
;6751:#endif
;6752:
;6753:	if (bs->jumpPrep > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2020
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $2860
line 6754
;6754:	{
line 6755
;6755:		bs->forceJumpChargeTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
CNSTI4 0
ASGNI4
line 6756
;6756:	}
LABELV $2860
line 6758
;6757:
;6758:	if (bs->forceJumpChargeTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $2863
line 6759
;6759:	{
line 6760
;6760:		bs->jumpHoldTime = ((bs->forceJumpChargeTime - level.time)/2) + level.time;
ADDRLP4 324
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 324
INDIRP4
CNSTI4 2016
ADDP4
ADDRLP4 324
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ADDRGP4 level+36
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 6761
;6761:		bs->forceJumpChargeTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
CNSTI4 0
ASGNI4
line 6762
;6762:	}
LABELV $2863
line 6764
;6763:
;6764:	if (bs->jumpHoldTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2016
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $2868
line 6765
;6765:	{
line 6766
;6766:		bs->jumpTime = bs->jumpHoldTime;
ADDRLP4 324
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 324
INDIRP4
CNSTI4 2012
ADDP4
ADDRLP4 324
INDIRP4
CNSTI4 2016
ADDP4
INDIRF4
ASGNF4
line 6767
;6767:	}
LABELV $2868
line 6769
;6768:
;6769:	if (bs->jumpTime > level.time && bs->jDelay < level.time)
ADDRLP4 324
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 324
INDIRP4
CNSTI4 2012
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $2871
ADDRLP4 324
INDIRP4
CNSTI4 2028
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $2871
line 6770
;6770:	{
line 6771
;6771:		if (bs->jumpHoldTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2016
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $2875
line 6772
;6772:		{
line 6773
;6773:			trap_EA_Jump(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Jump
CALLV
pop
line 6774
;6774:			if (bs->wpCurrent)
ADDRFP4 0
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2878
line 6775
;6775:			{
line 6776
;6776:				if ((bs->wpCurrent->origin[2] - bs->origin[2]) < 64)
ADDRLP4 328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
CNSTI4 1884
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 328
INDIRP4
CNSTI4 1728
ADDP4
INDIRF4
SUBF4
CNSTF4 1115684864
GEF4 $2879
line 6777
;6777:				{
line 6778
;6778:					trap_EA_MoveForward(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveForward
CALLV
pop
line 6779
;6779:				}
line 6780
;6780:			}
ADDRGP4 $2879
JUMPV
LABELV $2878
line 6782
;6781:			else
;6782:			{
line 6783
;6783:				trap_EA_MoveForward(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_MoveForward
CALLV
pop
line 6784
;6784:			}
LABELV $2879
line 6785
;6785:			if (g_entities[bs->client].client->ps.groundEntityNum == ENTITYNUM_NONE)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2876
line 6786
;6786:			{
line 6787
;6787:				g_entities[bs->client].client->ps.pm_flags |= PMF_JUMP_HELD;
ADDRLP4 328
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 328
INDIRP4
ADDRLP4 328
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 6788
;6788:			}
line 6789
;6789:		}
ADDRGP4 $2876
JUMPV
LABELV $2875
line 6790
;6790:		else if (!(bs->cur_ps.pm_flags & PMF_JUMP_HELD))
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $2886
line 6791
;6791:		{
line 6792
;6792:			trap_EA_Jump(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Jump
CALLV
pop
line 6793
;6793:		}
LABELV $2886
LABELV $2876
line 6794
;6794:	}
LABELV $2871
line 6796
;6795:
;6796:	if (bs->duckTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2008
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LEF4 $2888
line 6797
;6797:	{
line 6798
;6798:		trap_EA_Crouch(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Crouch
CALLV
pop
line 6799
;6799:	}
LABELV $2888
line 6801
;6800:
;6801:	if ( bs->dangerousObject && bs->dangerousObject->inuse && bs->dangerousObject->health > 0 &&
ADDRLP4 328
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 332
ADDRLP4 328
INDIRP4
CNSTI4 1848
ADDP4
INDIRP4
ASGNP4
ADDRLP4 336
CNSTU4 0
ASGNU4
ADDRLP4 332
INDIRP4
CVPU4 4
ADDRLP4 336
INDIRU4
EQU4 $2891
ADDRLP4 340
CNSTI4 0
ASGNI4
ADDRLP4 332
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 340
INDIRI4
EQI4 $2891
ADDRLP4 332
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 340
INDIRI4
LEI4 $2891
ADDRLP4 332
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 340
INDIRI4
EQI4 $2891
ADDRLP4 328
INDIRP4
CNSTI4 2056
ADDP4
INDIRI4
ADDRLP4 340
INDIRI4
EQI4 $2893
ADDRLP4 328
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 336
INDIRU4
NEU4 $2891
LABELV $2893
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 344
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 2
EQI4 $2894
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 BotGetWeaponRange
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 3
NEI4 $2891
LABELV $2894
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
ADDRLP4 352
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 13
EQI4 $2891
ADDRLP4 356
INDIRI4
CNSTI4 12
EQI4 $2891
ADDRLP4 352
INDIRP4
CNSTI4 1844
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2891
line 6806
;6802:		bs->dangerousObject->takedamage && (!bs->frame_Enemy_Vis || !bs->currentEnemy) &&
;6803:		(BotGetWeaponRange(bs) == BWEAPONRANGE_MID || BotGetWeaponRange(bs) == BWEAPONRANGE_LONG) &&
;6804:		bs->cur_ps.weapon != WP_DET_PACK && bs->cur_ps.weapon != WP_TRIP_MINE &&
;6805:		!bs->shootGoal )
;6806:	{
line 6809
;6807:		float danLen;
;6808:
;6809:		VectorSubtract(bs->dangerousObject->r.currentOrigin, bs->eye, a);
ADDRLP4 364
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 368
ADDRLP4 364
INDIRP4
CNSTI4 1848
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 368
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 364
INDIRP4
CNSTI4 1744
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 368
INDIRP4
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 364
INDIRP4
CNSTI4 1748
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 372
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 372
INDIRP4
CNSTI4 1848
ADDP4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 1752
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6811
;6810:
;6811:		danLen = VectorLength(a);
ADDRLP4 0
ARGP4
ADDRLP4 376
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 360
ADDRLP4 376
INDIRF4
ASGNF4
line 6813
;6812:
;6813:		if (danLen > 256)
ADDRLP4 360
INDIRF4
CNSTF4 1132462080
LEF4 $2897
line 6814
;6814:		{
line 6815
;6815:			vectoangles(a, a);
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6816
;6816:			VectorCopy(a, bs->goalAngles);
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 6818
;6817:
;6818:			if (Q_irand(1, 10, qfalse, 5) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 380
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 5
GEI4 $2899
line 6819
;6819:			{
line 6820
;6820:				bs->goalAngles[YAW] += Q_irand(0, 3 + gRandomUnlockAdd, qfalse, 2);
ADDRLP4 384
CNSTI4 0
ASGNI4
ADDRLP4 384
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 384
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 388
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 392
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
ASGNP4
ADDRLP4 392
INDIRP4
ADDRLP4 392
INDIRP4
INDIRF4
ADDRLP4 388
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 6821
;6821:				bs->goalAngles[PITCH] += Q_irand(0, 3 + gRandomUnlockAdd, qfalse, 2);
ADDRLP4 396
CNSTI4 0
ASGNI4
ADDRLP4 396
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 396
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 400
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 404
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ASGNP4
ADDRLP4 404
INDIRP4
ADDRLP4 404
INDIRP4
INDIRF4
ADDRLP4 400
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 6822
;6822:			}
ADDRGP4 $2900
JUMPV
LABELV $2899
line 6824
;6823:			else
;6824:			{
line 6825
;6825:				bs->goalAngles[YAW] -= Q_irand(0, 3 + gRandomUnlockAdd, qfalse, 2);
ADDRLP4 384
CNSTI4 0
ASGNI4
ADDRLP4 384
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 384
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 388
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 392
ADDRFP4 0
INDIRP4
CNSTI4 1900
ADDP4
ASGNP4
ADDRLP4 392
INDIRP4
ADDRLP4 392
INDIRP4
INDIRF4
ADDRLP4 388
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 6826
;6826:				bs->goalAngles[PITCH] -= Q_irand(0, 3 + gRandomUnlockAdd, qfalse, 2);
ADDRLP4 396
CNSTI4 0
ASGNI4
ADDRLP4 396
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 396
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 400
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 404
ADDRFP4 0
INDIRP4
CNSTI4 1896
ADDP4
ASGNP4
ADDRLP4 404
INDIRP4
ADDRLP4 404
INDIRP4
INDIRF4
ADDRLP4 400
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 6827
;6827:			}
LABELV $2900
line 6829
;6828:
;6829:			if (InFieldOfVision(bs->viewangles, 30, a) &&
ADDRFP4 0
INDIRP4
CNSTI4 1780
ADDP4
ARGP4
CNSTF4 1106247680
ARGF4
ADDRLP4 0
ARGP4
ADDRLP4 384
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
EQI4 $2901
ADDRLP4 388
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 388
INDIRP4
CNSTI4 1720
ADDP4
ARGP4
ADDRLP4 392
CNSTP4 0
ASGNP4
ADDRLP4 392
INDIRP4
ARGP4
ADDRLP4 392
INDIRP4
ARGP4
ADDRLP4 396
ADDRLP4 388
INDIRP4
CNSTI4 1848
ADDP4
INDIRP4
ASGNP4
ADDRLP4 396
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 388
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 396
INDIRP4
INDIRI4
ARGI4
ADDRLP4 400
ADDRGP4 EntityVisibleBox
CALLI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 0
EQI4 $2901
line 6831
;6830:				EntityVisibleBox(bs->origin, NULL, NULL, bs->dangerousObject->r.currentOrigin, bs->client, bs->dangerousObject->s.number))
;6831:			{
line 6832
;6832:				bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6833
;6833:			}			
LABELV $2901
line 6834
;6834:		}
LABELV $2897
line 6835
;6835:	}
LABELV $2891
line 6837
;6836:
;6837:	if (PrimFiring(bs) ||
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 360
ADDRGP4 PrimFiring
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $2905
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 364
ADDRGP4 AltFiring
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
EQI4 $2903
LABELV $2905
line 6839
;6838:		AltFiring(bs))
;6839:	{
line 6840
;6840:		friendInLOF = CheckForFriendInLOF(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 368
ADDRGP4 CheckForFriendInLOF
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 368
INDIRP4
ASGNP4
line 6842
;6841:
;6842:		if (friendInLOF)
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2904
line 6843
;6843:		{
line 6844
;6844:			if (PrimFiring(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 372
ADDRGP4 PrimFiring
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 0
EQI4 $2908
line 6845
;6845:			{
line 6846
;6846:				KeepPrimFromFiring(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 KeepPrimFromFiring
CALLI4
pop
line 6847
;6847:			}
LABELV $2908
line 6848
;6848:			if (AltFiring(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 376
ADDRGP4 AltFiring
CALLI4
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 0
EQI4 $2910
line 6849
;6849:			{
line 6850
;6850:				KeepAltFromFiring(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 KeepAltFromFiring
CALLI4
pop
line 6851
;6851:			}
LABELV $2910
line 6852
;6852:			if (useTheForce && forceHostile)
ADDRLP4 380
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 380
INDIRI4
EQI4 $2912
ADDRLP4 16
INDIRI4
ADDRLP4 380
INDIRI4
EQI4 $2912
line 6853
;6853:			{
line 6854
;6854:				useTheForce = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 6855
;6855:			}
LABELV $2912
line 6857
;6856:
;6857:			if (!useTheForce && friendInLOF->client)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2904
ADDRLP4 52
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2904
line 6858
;6858:			{ //we have a friend here and are not currently using force powers, see if we can help them out
line 6859
;6859:				if (friendInLOF->health <= 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TEAM_HEAL]][FP_TEAM_HEAL])
ADDRLP4 52
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2916
ADDRLP4 384
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 384
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 384
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $2916
line 6860
;6860:				{
line 6861
;6861:					level.clients[bs->client].ps.fd.forcePowerSelected = FP_TEAM_HEAL;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 11
ASGNI4
line 6862
;6862:					useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 6863
;6863:					forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 6864
;6864:				}
ADDRGP4 $2904
JUMPV
LABELV $2916
line 6865
;6865:				else if (friendInLOF->client->ps.fd.forcePower <= 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TEAM_FORCE]][FP_TEAM_FORCE])
ADDRLP4 388
CNSTI4 932
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 388
INDIRI4
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2904
ADDRLP4 392
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 392
INDIRP4
ADDRLP4 388
INDIRI4
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 392
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 48
ADDP4
INDIRI4
LEI4 $2904
line 6866
;6866:				{
line 6867
;6867:					level.clients[bs->client].ps.fd.forcePowerSelected = FP_TEAM_FORCE;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 12
ASGNI4
line 6868
;6868:					useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 6869
;6869:					forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 6870
;6870:				}
line 6871
;6871:			}
line 6872
;6872:		}
line 6873
;6873:	}
ADDRGP4 $2904
JUMPV
LABELV $2903
line 6874
;6874:	else if (g_gametype.integer >= GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $2920
line 6875
;6875:	{ //still check for anyone to help..
line 6876
;6876:		friendInLOF = CheckForFriendInLOF(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 368
ADDRGP4 CheckForFriendInLOF
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 368
INDIRP4
ASGNP4
line 6878
;6877:
;6878:		if (!useTheForce && friendInLOF)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2923
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2923
line 6879
;6879:		{
line 6880
;6880:			if (friendInLOF->health <= 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TEAM_HEAL]][FP_TEAM_HEAL])
ADDRLP4 52
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2925
ADDRLP4 372
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 372
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 372
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $2925
line 6881
;6881:			{
line 6882
;6882:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_TEAM_HEAL;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 11
ASGNI4
line 6883
;6883:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 6884
;6884:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 6885
;6885:			}
ADDRGP4 $2926
JUMPV
LABELV $2925
line 6886
;6886:			else if (friendInLOF->client->ps.fd.forcePower <= 50 && level.clients[bs->client].ps.fd.forcePower > forcePowerNeeded[level.clients[bs->client].ps.fd.forcePowerLevel[FP_TEAM_FORCE]][FP_TEAM_FORCE])
ADDRLP4 376
CNSTI4 932
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 376
INDIRI4
ADDP4
INDIRI4
CNSTI4 50
GTI4 $2927
ADDRLP4 380
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 380
INDIRP4
ADDRLP4 376
INDIRI4
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 380
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 48
ADDP4
INDIRI4
LEI4 $2927
line 6887
;6887:			{
line 6888
;6888:				level.clients[bs->client].ps.fd.forcePowerSelected = FP_TEAM_FORCE;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 12
ASGNI4
line 6889
;6889:				useTheForce = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 6890
;6890:				forceHostile = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 6891
;6891:			}
LABELV $2927
LABELV $2926
line 6892
;6892:		}
LABELV $2923
line 6893
;6893:	}
LABELV $2920
LABELV $2904
line 6895
;6894:
;6895:	if (bs->doAttack && bs->cur_ps.weapon == WP_DET_PACK &&
ADDRLP4 368
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 372
CNSTI4 0
ASGNI4
ADDRLP4 368
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
ADDRLP4 372
INDIRI4
EQI4 $2929
ADDRLP4 368
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 13
NEI4 $2929
ADDRLP4 368
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
ADDRLP4 372
INDIRI4
EQI4 $2929
line 6897
;6896:		bs->cur_ps.hasDetPackPlanted)
;6897:	{ //maybe a bit hackish, but bots only want to plant one of these at any given time to avoid complications
line 6898
;6898:		bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6899
;6899:	}
LABELV $2929
line 6901
;6900:
;6901:	if (bs->doAttack && bs->cur_ps.weapon == WP_SABER &&
ADDRLP4 376
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 380
CNSTI4 0
ASGNI4
ADDRLP4 376
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
ADDRLP4 380
INDIRI4
EQI4 $2931
ADDRLP4 376
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2931
ADDRLP4 376
INDIRP4
CNSTI4 2708
ADDP4
INDIRI4
ADDRLP4 380
INDIRI4
EQI4 $2931
ADDRLP4 384
ADDRLP4 376
INDIRP4
CNSTI4 1816
ADDP4
INDIRP4
ASGNP4
ADDRLP4 388
CNSTU4 0
ASGNU4
ADDRLP4 384
INDIRP4
CVPU4 4
ADDRLP4 388
INDIRU4
EQU4 $2931
ADDRLP4 392
ADDRLP4 384
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 392
INDIRP4
CVPU4 4
ADDRLP4 388
INDIRU4
EQU4 $2931
ADDRLP4 392
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 396
ADDRGP4 BotWeaponBlockable
CALLI4
ASGNI4
ADDRLP4 396
INDIRI4
CNSTI4 0
EQI4 $2931
line 6904
;6902:		bs->saberDefending && bs->currentEnemy && bs->currentEnemy->client &&
;6903:		BotWeaponBlockable(bs->currentEnemy->client->ps.weapon) )
;6904:	{
line 6905
;6905:		bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6906
;6906:	}
LABELV $2931
line 6908
;6907:
;6908:	if (bs->cur_ps.saberLockTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $2933
line 6909
;6909:	{
line 6910
;6910:		if (rand()%10 < 5)
ADDRLP4 400
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $2936
line 6911
;6911:		{
line 6912
;6912:			bs->doAttack = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 1
ASGNI4
line 6913
;6913:		}
ADDRGP4 $2937
JUMPV
LABELV $2936
line 6915
;6914:		else
;6915:		{
line 6916
;6916:			bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6917
;6917:		}
LABELV $2937
line 6918
;6918:	}
LABELV $2933
line 6920
;6919:
;6920:	if (bs->botChallengingTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 2740
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $2938
line 6921
;6921:	{
line 6922
;6922:		bs->doAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
CNSTI4 0
ASGNI4
line 6923
;6923:		bs->doAltAttack = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
CNSTI4 0
ASGNI4
line 6924
;6924:	}
LABELV $2938
line 6926
;6925:
;6926:	if (bs->doAttack)
ADDRFP4 0
INDIRP4
CNSTI4 2276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2941
line 6927
;6927:	{
line 6928
;6928:		trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 6929
;6929:	}
ADDRGP4 $2942
JUMPV
LABELV $2941
line 6930
;6930:	else if (bs->doAltAttack)
ADDRFP4 0
INDIRP4
CNSTI4 2280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2943
line 6931
;6931:	{
line 6932
;6932:		trap_EA_Alt_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Alt_Attack
CALLV
pop
line 6933
;6933:	}
LABELV $2943
LABELV $2942
line 6935
;6934:
;6935:	if (useTheForce && forceHostile && bs->botChallengingTime > level.time)
ADDRLP4 400
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 400
INDIRI4
EQI4 $2945
ADDRLP4 16
INDIRI4
ADDRLP4 400
INDIRI4
EQI4 $2945
ADDRFP4 0
INDIRP4
CNSTI4 2740
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $2945
line 6936
;6936:	{
line 6937
;6937:		useTheForce = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 6938
;6938:	}
LABELV $2945
line 6940
;6939:
;6940:	if (useTheForce)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2948
line 6941
;6941:	{
line 6943
;6942:#ifndef FORCEJUMP_INSTANTMETHOD
;6943:		if (bs->forceJumpChargeTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 4792
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $2950
line 6944
;6944:		{
line 6945
;6945:			level.clients[bs->client].ps.fd.forcePowerSelected = FP_LEVITATION;
CNSTI4 53196
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 852
ADDP4
CNSTI4 1
ASGNI4
line 6946
;6946:			trap_EA_ForcePower(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_ForcePower
CALLV
pop
line 6947
;6947:		}
ADDRGP4 $2951
JUMPV
LABELV $2950
line 6949
;6948:		else
;6949:		{
line 6951
;6950:#endif
;6951:			if (bot_forcepowers.integer && !g_forcePowerDisable.integer)
ADDRLP4 404
CNSTI4 0
ASGNI4
ADDRGP4 bot_forcepowers+12
INDIRI4
ADDRLP4 404
INDIRI4
EQI4 $2953
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ADDRLP4 404
INDIRI4
NEI4 $2953
line 6952
;6952:			{
line 6953
;6953:				trap_EA_ForcePower(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_ForcePower
CALLV
pop
line 6954
;6954:			}
LABELV $2953
line 6956
;6955:#ifndef FORCEJUMP_INSTANTMETHOD
;6956:		}
LABELV $2951
line 6958
;6957:#endif
;6958:	}
LABELV $2948
line 6960
;6959:
;6960:	MoveTowardIdealAngles(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveTowardIdealAngles
CALLV
pop
line 6961
;6961:}
LABELV $2376
endproc StandardBotAI 408 24
bss
align 4
LABELV $2958
skip 4
align 4
LABELV $2959
skip 4
export BotAIStartFrame
code
proc BotAIStartFrame 24 12
line 6969
;6962://end rww
;6963:
;6964:/*
;6965:==================
;6966:BotAIStartFrame
;6967:==================
;6968:*/
;6969:int BotAIStartFrame(int time) {
line 6975
;6970:	int i;
;6971:	int elapsed_time, thinktime;
;6972:	static int local_time;
;6973:	static int lastbotthink_time;
;6974:
;6975:	G_CheckBotSpawn();
ADDRGP4 G_CheckBotSpawn
CALLV
pop
line 6978
;6976:
;6977:	//rww - addl bot frame functions
;6978:	if (gBotEdit)
ADDRGP4 gBotEdit
INDIRF4
CNSTF4 0
EQF4 $2960
line 6979
;6979:	{
line 6980
;6980:		trap_Cvar_Update(&bot_wp_info);
ADDRGP4 bot_wp_info
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 6981
;6981:		BotWaypointRender();
ADDRGP4 BotWaypointRender
CALLV
pop
line 6982
;6982:	}
LABELV $2960
line 6984
;6983:
;6984:	UpdateEventTracker();
ADDRGP4 UpdateEventTracker
CALLV
pop
line 6989
;6985:	//end rww
;6986:
;6987:	//cap the bot think time
;6988:	//if the bot think time changed we should reschedule the bots
;6989:	if (BOT_THINK_TIME != lastbotthink_time) {
ADDRGP4 $2959
INDIRI4
CNSTI4 0
EQI4 $2962
line 6990
;6990:		lastbotthink_time = BOT_THINK_TIME;
ADDRGP4 $2959
CNSTI4 0
ASGNI4
line 6991
;6991:		BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 6992
;6992:	}
LABELV $2962
line 6994
;6993:
;6994:	elapsed_time = time - local_time;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ADDRGP4 $2958
INDIRI4
SUBI4
ASGNI4
line 6995
;6995:	local_time = time;
ADDRGP4 $2958
ADDRFP4 0
INDIRI4
ASGNI4
line 6997
;6996:
;6997:	if (elapsed_time > BOT_THINK_TIME) thinktime = elapsed_time;
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $2964
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $2965
JUMPV
LABELV $2964
line 6998
;6998:	else thinktime = BOT_THINK_TIME;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2965
line 7001
;6999:
;7000:	// execute scheduled bot AI
;7001:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2966
line 7002
;7002:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2972
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2970
LABELV $2972
line 7003
;7003:			continue;
ADDRGP4 $2967
JUMPV
LABELV $2970
line 7006
;7004:		}
;7005:		//
;7006:		botstates[i]->botthink_residual += elapsed_time;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 7008
;7007:		//
;7008:		if ( botstates[i]->botthink_residual >= thinktime ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $2973
line 7009
;7009:			botstates[i]->botthink_residual -= thinktime;
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 7011
;7010:
;7011:			if (g_entities[i].client->pers.connected == CON_CONNECTED) {
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2975
line 7012
;7012:				BotAI(i, (float) thinktime / 1000);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1148846080
DIVF4
ARGF4
ADDRGP4 BotAI
CALLI4
pop
line 7013
;7013:			}
LABELV $2975
line 7014
;7014:		}
LABELV $2973
line 7015
;7015:	}
LABELV $2967
line 7001
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2966
line 7018
;7016:
;7017:	// execute bot user commands every frame
;7018:	for( i = 0; i < MAX_CLIENTS; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2978
line 7019
;7019:		if( !botstates[i] || !botstates[i]->inuse ) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2984
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2982
LABELV $2984
line 7020
;7020:			continue;
ADDRGP4 $2979
JUMPV
LABELV $2982
line 7022
;7021:		}
;7022:		if( g_entities[i].client->pers.connected != CON_CONNECTED ) {
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2985
line 7023
;7023:			continue;
ADDRGP4 $2979
JUMPV
LABELV $2985
line 7026
;7024:		}
;7025:
;7026:		BotUpdateInput(botstates[i], time, elapsed_time);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotUpdateInput
CALLV
pop
line 7027
;7027:		trap_BotUserCommand(botstates[i]->client, &botstates[i]->lastucmd);
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 1396
ADDP4
ARGP4
ADDRGP4 trap_BotUserCommand
CALLV
pop
line 7028
;7028:	}
LABELV $2979
line 7018
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2978
line 7030
;7029:
;7030:	return qtrue;
CNSTI4 1
RETI4
LABELV $2957
endproc BotAIStartFrame 24 12
export BotAISetup
proc BotAISetup 4 16
line 7038
;7031:}
;7032:
;7033:/*
;7034:==============
;7035:BotAISetup
;7036:==============
;7037:*/
;7038:int BotAISetup( int restart ) {
line 7040
;7039:	//rww - new bot cvars..
;7040:	trap_Cvar_Register(&bot_forcepowers, "bot_forcepowers", "1", CVAR_CHEAT);
ADDRGP4 bot_forcepowers
ARGP4
ADDRGP4 $2989
ARGP4
ADDRGP4 $2990
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7041
;7041:	trap_Cvar_Register(&bot_forgimmick, "bot_forgimmick", "0", CVAR_CHEAT);
ADDRGP4 bot_forgimmick
ARGP4
ADDRGP4 $2991
ARGP4
ADDRGP4 $2992
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7042
;7042:	trap_Cvar_Register(&bot_honorableduelacceptance, "bot_honorableduelacceptance", "0", CVAR_CHEAT);
ADDRGP4 bot_honorableduelacceptance
ARGP4
ADDRGP4 $2993
ARGP4
ADDRGP4 $2992
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7048
;7043:#ifdef _DEBUG
;7044:	trap_Cvar_Register(&bot_nogoals, "bot_nogoals", "0", CVAR_CHEAT);
;7045:	trap_Cvar_Register(&bot_debugmessages, "bot_debugmessages", "0", CVAR_CHEAT);
;7046:#endif
;7047:
;7048:	trap_Cvar_Register(&bot_attachments, "bot_attachments", "1", 0);
ADDRGP4 bot_attachments
ARGP4
ADDRGP4 $2994
ARGP4
ADDRGP4 $2990
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7049
;7049:	trap_Cvar_Register(&bot_camp, "bot_camp", "1", 0);
ADDRGP4 bot_camp
ARGP4
ADDRGP4 $2995
ARGP4
ADDRGP4 $2990
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7051
;7050:
;7051:	trap_Cvar_Register(&bot_wp_info, "bot_wp_info", "1", 0);
ADDRGP4 bot_wp_info
ARGP4
ADDRGP4 $2996
ARGP4
ADDRGP4 $2990
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7052
;7052:	trap_Cvar_Register(&bot_wp_edit, "bot_wp_edit", "0", CVAR_CHEAT);
ADDRGP4 bot_wp_edit
ARGP4
ADDRGP4 $2997
ARGP4
ADDRGP4 $2992
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7053
;7053:	trap_Cvar_Register(&bot_wp_clearweight, "bot_wp_clearweight", "1", 0);
ADDRGP4 bot_wp_clearweight
ARGP4
ADDRGP4 $2998
ARGP4
ADDRGP4 $2990
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7054
;7054:	trap_Cvar_Register(&bot_wp_distconnect, "bot_wp_distconnect", "1", 0);
ADDRGP4 bot_wp_distconnect
ARGP4
ADDRGP4 $2999
ARGP4
ADDRGP4 $2990
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7055
;7055:	trap_Cvar_Register(&bot_wp_visconnect, "bot_wp_visconnect", "1", 0);
ADDRGP4 bot_wp_visconnect
ARGP4
ADDRGP4 $3000
ARGP4
ADDRGP4 $2990
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 7057
;7056:
;7057:	trap_Cvar_Update(&bot_forcepowers);
ADDRGP4 bot_forcepowers
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 7061
;7058:	//end rww
;7059:
;7060:	//if the game is restarted for a tournament
;7061:	if (restart) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3001
line 7062
;7062:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2988
JUMPV
LABELV $3001
line 7066
;7063:	}
;7064:
;7065:	//initialize the bot states
;7066:	memset( botstates, 0, sizeof(botstates) );
ADDRGP4 botstates
ARGP4
CNSTI4 0
ARGI4
CNSTU4 128
ARGU4
ADDRGP4 memset
CALLP4
pop
line 7068
;7067:
;7068:	if (!trap_BotLibSetup())
ADDRLP4 0
ADDRGP4 trap_BotLibSetup
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $3003
line 7069
;7069:	{
line 7070
;7070:		return qfalse; //wts?!
CNSTI4 0
RETI4
ADDRGP4 $2988
JUMPV
LABELV $3003
line 7073
;7071:	}
;7072:
;7073:	return qtrue;
CNSTI4 1
RETI4
LABELV $2988
endproc BotAISetup 4 16
export BotAIShutdown
proc BotAIShutdown 8 8
line 7081
;7074:}
;7075:
;7076:/*
;7077:==============
;7078:BotAIShutdown
;7079:==============
;7080:*/
;7081:int BotAIShutdown( int restart ) {
line 7086
;7082:
;7083:	int i;
;7084:
;7085:	//if the game is restarted for a tournament
;7086:	if ( restart ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $3006
line 7088
;7087:		//shutdown all the bots in the botlib
;7088:		for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3008
line 7089
;7089:			if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3012
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $3012
line 7090
;7090:				BotAIShutdownClient(botstates[i]->client, restart);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 7091
;7091:			}
LABELV $3012
line 7092
;7092:		}
LABELV $3009
line 7088
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $3008
line 7094
;7093:		//don't shutdown the bot library
;7094:	}
ADDRGP4 $3007
JUMPV
LABELV $3006
line 7095
;7095:	else {
line 7096
;7096:		trap_BotLibShutdown();
ADDRGP4 trap_BotLibShutdown
CALLI4
pop
line 7097
;7097:	}
LABELV $3007
line 7098
;7098:	return qtrue;
CNSTI4 1
RETI4
LABELV $3005
endproc BotAIShutdown 8 8
import G_ThereIsAMaster
import WP_ForcePowerUsable
import ExitLevel
bss
export droppedBlueFlag
align 4
LABELV droppedBlueFlag
skip 4
export droppedRedFlag
align 4
LABELV droppedRedFlag
skip 4
export gBotEventTracker
align 4
LABELV gBotEventTracker
skip 512
import imperial_attackers
import rebel_attackers
export regularupdate_time
align 4
LABELV regularupdate_time
skip 4
export numbots
align 4
LABELV numbots
skip 4
export botstates
align 4
LABELV botstates
skip 128
import forceJumpStrength
import forceJumpHeightMax
import forceJumpHeight
import forcePowerNeeded
import forcePowerNeeded_1_04
import forcePowerNeeded_1_02
import g_MaxHolocronCarry
export floattime
align 4
LABELV floattime
skip 4
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
import gBotChatBuffer
export eFlagBlue
align 4
LABELV eFlagBlue
skip 4
export eFlagRed
align 4
LABELV eFlagRed
skip 4
export oFlagBlue
align 4
LABELV oFlagBlue
skip 4
export flagBlue
align 4
LABELV flagBlue
skip 4
export oFlagRed
align 4
LABELV oFlagRed
skip 4
export flagRed
align 4
LABELV flagRed
skip 4
export bot_wp_visconnect
align 4
LABELV bot_wp_visconnect
skip 272
export bot_wp_distconnect
align 4
LABELV bot_wp_distconnect
skip 272
export bot_wp_clearweight
align 4
LABELV bot_wp_clearweight
skip 272
export bot_wp_edit
align 4
LABELV bot_wp_edit
skip 272
export bot_wp_info
align 4
LABELV bot_wp_info
skip 272
export bot_camp
align 4
LABELV bot_camp
skip 272
export bot_attachments
align 4
LABELV bot_attachments
skip 272
export bot_honorableduelacceptance
align 4
LABELV bot_honorableduelacceptance
skip 272
export bot_forgimmick
align 4
LABELV bot_forgimmick
skip 272
export bot_forcepowers
align 4
LABELV bot_forcepowers
skip 272
import ConcatArgs
import BotWaypointRender
import BotDoChat
import BotUtilizePersonality
import B_Free
import B_Alloc
import B_TempFree
import B_TempAlloc
import BotResetWeaponState
import BotFreeWeaponState
import BotAllocWeaponState
import BotLoadWeaponWeights
import BotGetWeaponInfo
import BotChooseBestFightWeapon
import BotShutdownWeaponAI
import BotSetupWeaponAI
import BotShutdownMoveAI
import BotSetupMoveAI
import BotSetBrushModelTypes
import BotAddAvoidSpot
import BotInitMoveState
import BotFreeMoveState
import BotAllocMoveState
import BotPredictVisiblePosition
import BotMovementViewTarget
import BotReachabilityArea
import BotResetLastAvoidReach
import BotResetAvoidReach
import BotMoveInDirection
import BotMoveToGoal
import BotResetMoveState
import BotShutdownGoalAI
import BotSetupGoalAI
import BotFreeGoalState
import BotAllocGoalState
import BotFreeItemWeights
import BotLoadItemWeights
import BotMutateGoalFuzzyLogic
import BotSaveGoalFuzzyLogic
import BotInterbreedGoalFuzzyLogic
import BotUpdateEntityItems
import BotInitLevelItems
import BotSetAvoidGoalTime
import BotAvoidGoalTime
import BotGetMapLocationGoal
import BotGetNextCampSpotGoal
import BotGetLevelItemGoal
import BotItemGoalInVisButNotVisible
import BotTouchingGoal
import BotChooseNBGItem
import BotChooseLTGItem
import BotGetSecondGoal
import BotGetTopGoal
import BotGoalName
import BotDumpGoalStack
import BotDumpAvoidGoals
import BotEmptyGoalStack
import BotPopGoal
import BotPushGoal
import BotRemoveFromAvoidGoals
import BotResetAvoidGoals
import BotResetGoalState
import GeneticParentsAndChildSelection
import BotSetChatName
import BotSetChatGender
import BotLoadChatFile
import BotReplaceSynonyms
import UnifyWhiteSpaces
import BotMatchVariable
import BotFindMatch
import StringContains
import BotGetChatMessage
import BotEnterChat
import BotChatLength
import BotReplyChat
import BotNumInitialChats
import BotInitialChat
import BotNumConsoleMessages
import BotNextConsoleMessage
import BotRemoveConsoleMessage
import BotQueueConsoleMessage
import BotFreeChatState
import BotAllocChatState
import BotShutdownChatAI
import BotSetupChatAI
import BotShutdownCharacters
import Characteristic_String
import Characteristic_BInteger
import Characteristic_Integer
import Characteristic_BFloat
import Characteristic_Float
import BotFreeCharacter
import BotLoadCharacter
import EA_Shutdown
import EA_Setup
import EA_ResetInput
import EA_GetInput
import EA_EndRegular
import EA_View
import EA_Move
import EA_DelayedJump
import EA_Jump
import EA_SelectWeapon
import EA_Use
import EA_Gesture
import EA_Talk
import EA_Respawn
import EA_ForcePower
import EA_Alt_Attack
import EA_Attack
import EA_MoveRight
import EA_MoveLeft
import EA_MoveBack
import EA_MoveForward
import EA_MoveDown
import EA_MoveUp
import EA_Walk
import EA_Crouch
import EA_Action
import EA_Command
import EA_SayTeam
import EA_Say
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
import B_CleanupAlloc
import B_InitAlloc
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
LABELV $3000
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 119
byte 1 112
byte 1 95
byte 1 118
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $2999
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 119
byte 1 112
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $2998
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 119
byte 1 112
byte 1 95
byte 1 99
byte 1 108
byte 1 101
byte 1 97
byte 1 114
byte 1 119
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $2997
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 119
byte 1 112
byte 1 95
byte 1 101
byte 1 100
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $2996
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 119
byte 1 112
byte 1 95
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $2995
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $2994
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 97
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
LABELV $2993
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 104
byte 1 111
byte 1 110
byte 1 111
byte 1 114
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $2992
byte 1 48
byte 1 0
align 1
LABELV $2991
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 103
byte 1 105
byte 1 109
byte 1 109
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $2990
byte 1 49
byte 1 0
align 1
LABELV $2989
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $2533
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2530
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 72
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 79
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $2404
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 79
byte 1 110
byte 1 80
byte 1 117
byte 1 114
byte 1 112
byte 1 111
byte 1 115
byte 1 101
byte 1 66
byte 1 121
byte 1 76
byte 1 111
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $2401
byte 1 68
byte 1 105
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2315
byte 1 100
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $2297
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2272
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 101
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
LABELV $2174
byte 1 66
byte 1 101
byte 1 108
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2171
byte 1 72
byte 1 97
byte 1 116
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2164
byte 1 76
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 79
byte 1 110
byte 1 101
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 76
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 79
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $505
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 0
align 1
LABELV $442
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
LABELV $436
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
byte 1 58
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
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $433
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
byte 1 58
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
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $405
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $402
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $399
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $396
byte 1 99
byte 1 112
byte 1 32
byte 1 0
align 1
LABELV $388
byte 1 66
byte 1 111
byte 1 116
byte 1 65
byte 1 73
byte 1 58
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
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $204
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 65
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $144
byte 1 73
byte 1 39
byte 1 109
byte 1 32
byte 1 97
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
byte 1 114
byte 1 101
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 32
byte 1 97
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 115
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $143
byte 1 73
byte 1 39
byte 1 109
byte 1 32
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $142
byte 1 73
byte 1 39
byte 1 109
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
byte 1 121
byte 1 32
byte 1 115
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $141
byte 1 73
byte 1 39
byte 1 109
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 114
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
byte 1 0
align 1
LABELV $140
byte 1 73
byte 1 39
byte 1 109
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 116
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
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
byte 1 0
align 1
LABELV $139
byte 1 73
byte 1 39
byte 1 118
byte 1 101
byte 1 32
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 39
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $138
byte 1 73
byte 1 39
byte 1 109
byte 1 32
byte 1 101
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $137
byte 1 73
byte 1 39
byte 1 109
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $136
byte 1 73
byte 1 39
byte 1 109
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $135
byte 1 73
byte 1 39
byte 1 109
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 39
byte 1 115
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $134
byte 1 73
byte 1 39
byte 1 109
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 99
byte 1 99
byte 1 117
byte 1 112
byte 1 105
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $133
byte 1 67
byte 1 84
byte 1 70
byte 1 83
byte 1 84
byte 1 65
byte 1 84
byte 1 69
byte 1 95
byte 1 77
byte 1 65
byte 1 88
byte 1 67
byte 1 84
byte 1 70
byte 1 83
byte 1 84
byte 1 65
byte 1 84
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $132
byte 1 67
byte 1 84
byte 1 70
byte 1 83
byte 1 84
byte 1 65
byte 1 84
byte 1 69
byte 1 95
byte 1 71
byte 1 69
byte 1 84
byte 1 70
byte 1 76
byte 1 65
byte 1 71
byte 1 72
byte 1 79
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $131
byte 1 67
byte 1 84
byte 1 70
byte 1 83
byte 1 84
byte 1 65
byte 1 84
byte 1 69
byte 1 95
byte 1 71
byte 1 85
byte 1 65
byte 1 82
byte 1 68
byte 1 67
byte 1 65
byte 1 82
byte 1 82
byte 1 73
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $130
byte 1 67
byte 1 84
byte 1 70
byte 1 83
byte 1 84
byte 1 65
byte 1 84
byte 1 69
byte 1 95
byte 1 82
byte 1 69
byte 1 84
byte 1 82
byte 1 73
byte 1 69
byte 1 86
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $129
byte 1 67
byte 1 84
byte 1 70
byte 1 83
byte 1 84
byte 1 65
byte 1 84
byte 1 69
byte 1 95
byte 1 68
byte 1 69
byte 1 70
byte 1 69
byte 1 78
byte 1 68
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $128
byte 1 67
byte 1 84
byte 1 70
byte 1 83
byte 1 84
byte 1 65
byte 1 84
byte 1 69
byte 1 95
byte 1 65
byte 1 84
byte 1 84
byte 1 65
byte 1 67
byte 1 75
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $127
byte 1 67
byte 1 84
byte 1 70
byte 1 83
byte 1 84
byte 1 65
byte 1 84
byte 1 69
byte 1 95
byte 1 78
byte 1 79
byte 1 78
byte 1 69
byte 1 0
