data
export forceMasteryLevels
align 4
LABELV forceMasteryLevels
address $121
address $122
address $123
address $124
address $125
address $126
address $127
address $128
export forceMasteryPoints
align 4
LABELV forceMasteryPoints
byte 4 0
byte 4 5
byte 4 10
byte 4 20
byte 4 30
byte 4 50
byte 4 75
byte 4 100
export bgForcePowerCost
align 4
LABELV bgForcePowerCost
byte 4 0
byte 4 2
byte 4 4
byte 4 6
byte 4 0
byte 4 0
byte 4 2
byte 4 6
byte 4 0
byte 4 2
byte 4 4
byte 4 6
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 4
byte 4 6
byte 4 8
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 2
byte 4 5
byte 4 8
byte 4 0
byte 4 4
byte 4 6
byte 4 8
byte 4 0
byte 4 2
byte 4 5
byte 4 8
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 1
byte 4 3
byte 4 6
byte 4 0
byte 4 2
byte 4 4
byte 4 6
byte 4 0
byte 4 2
byte 4 5
byte 4 8
byte 4 0
byte 4 1
byte 4 5
byte 4 8
byte 4 0
byte 4 1
byte 4 5
byte 4 8
byte 4 0
byte 4 4
byte 4 6
byte 4 8
export forcePowerSorted
align 4
LABELV forcePowerSorted
byte 4 5
byte 4 0
byte 4 10
byte 4 9
byte 4 11
byte 4 1
byte 4 2
byte 4 3
byte 4 4
byte 4 14
byte 4 7
byte 4 13
byte 4 8
byte 4 6
byte 4 12
byte 4 15
byte 4 16
byte 4 17
export forcePowerDarkLight
align 4
LABELV forcePowerDarkLight
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 2
byte 4 2
byte 4 2
byte 4 1
byte 4 1
byte 4 1
byte 4 2
byte 4 2
byte 4 0
byte 4 0
byte 4 0
byte 4 0
export WeaponReadyAnim
align 4
LABELV WeaponReadyAnim
byte 4 1091
byte 4 1101
byte 4 573
byte 4 1100
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1101
byte 4 1108
byte 4 1108
byte 4 1108
byte 4 571
byte 4 1099
export WeaponAttackAnim
align 4
LABELV WeaponAttackAnim
byte 4 117
byte 4 120
byte 4 573
byte 4 118
byte 4 120
byte 4 120
byte 4 120
byte 4 120
byte 4 120
byte 4 120
byte 4 120
byte 4 137
byte 4 120
byte 4 120
byte 4 571
byte 4 117
export BG_LegalizedForcePowers
code
proc BG_LegalizedForcePowers 440 12
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\bg_misc.c"
line 176
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_misc.c -- both games misc functions, all completely stateless
;4:
;5:#include "q_shared.h"
;6:#include "bg_public.h"
;7:#include "bg_local.h"
;8:
;9:#ifdef JK2_GAME
;10:#include "../game/g_local.h"
;11:#endif
;12:
;13:#ifdef JK2_UI
;14:#include "../ui/ui_local.h"
;15:#endif
;16:
;17:#ifdef JK2_CGAME
;18:#include "../cgame/cg_local.h"
;19:#endif
;20:
;21://rww - not putting @ in front of these because
;22://we don't need them in a cgame striped lookup.
;23://Let me know if this causes problems, pat.
;24:char *forceMasteryLevels[NUM_FORCE_MASTERY_LEVELS] = 
;25:{
;26:	"MASTERY0",	//"Uninitiated",	// FORCE_MASTERY_UNINITIATED,
;27:	"MASTERY1",	//"Initiate",		// FORCE_MASTERY_INITIATE,
;28:	"MASTERY2",	//"Padawan",		// FORCE_MASTERY_PADAWAN,
;29:	"MASTERY3",	//"Jedi",			// FORCE_MASTERY_JEDI,
;30:	"MASTERY4",	//"Jedi Adept",		// FORCE_MASTERY_JEDI_GUARDIAN,
;31:	"MASTERY5",	//"Jedi Guardian",	// FORCE_MASTERY_JEDI_ADEPT,
;32:	"MASTERY6",	//"Jedi Knight",	// FORCE_MASTERY_JEDI_KNIGHT,
;33:	"MASTERY7",	//"Jedi Master"		// FORCE_MASTERY_JEDI_MASTER,
;34:};
;35:
;36:int forceMasteryPoints[NUM_FORCE_MASTERY_LEVELS] =
;37:{
;38:	0,		// FORCE_MASTERY_UNINITIATED,
;39:	5,		// FORCE_MASTERY_INITIATE,
;40:	10,		// FORCE_MASTERY_PADAWAN,
;41:	20,		// FORCE_MASTERY_JEDI,
;42:	30,		// FORCE_MASTERY_JEDI_GUARDIAN,
;43:	50,		// FORCE_MASTERY_JEDI_ADEPT,
;44:	75,		// FORCE_MASTERY_JEDI_KNIGHT,
;45:	100		// FORCE_MASTERY_JEDI_MASTER,
;46:};
;47:
;48:int bgForcePowerCost[NUM_FORCE_POWERS][NUM_FORCE_POWER_LEVELS] = //0 == neutral
;49:{
;50:	{	0,	2,	4,	6	},	// Heal			// FP_HEAL
;51:	{	0,	0,	2,	6	},	// Jump			//FP_LEVITATION,//hold/duration
;52:	{	0,	2,	4,	6	},	// Speed		//FP_SPEED,//duration
;53:	{	0,	1,	3,	6	},	// Push			//FP_PUSH,//hold/duration
;54:	{	0,	1,	3,	6	},	// Pull			//FP_PULL,//hold/duration
;55:	{	0,	4,	6,	8	},	// Mind Trick	//FP_TELEPATHY,//instant
;56:	{	0,	1,	3,	6	},	// Grip			//FP_GRIP,//hold/duration
;57:	{	0,	2,	5,	8	},	// Lightning	//FP_LIGHTNING,//hold/duration
;58:	{	0,	4,	6,	8	},	// Dark Rage	//FP_RAGE,//duration
;59:	{	0,	2,	5,	8	},	// Protection	//FP_PROTECT,//duration
;60:	{	0,	1,	3,	6	},	// Absorb		//FP_ABSORB,//duration
;61:	{	0,	1,	3,	6	},	// Team Heal	//FP_TEAM_HEAL,//instant
;62:	{	0,	1,	3,	6	},	// Team Force	//FP_TEAM_FORCE,//instant
;63:	{	0,	2,	4,	6	},	// Drain		//FP_DRAIN,//hold/duration
;64:	{	0,	2,	5,	8	},	// Sight		//FP_SEE,//duration
;65:	{	0,	1,	5,	8	},	// Saber Attack	//FP_SABERATTACK,
;66:	{	0,	1,	5,	8	},	// Saber Defend	//FP_SABERDEFEND,
;67:	{	0,	4,	6,	8	}	// Saber Throw	//FP_SABERTHROW,
;68:	//NUM_FORCE_POWERS
;69:};
;70:
;71:int forcePowerSorted[NUM_FORCE_POWERS] = 
;72:{ //rww - always use this order when drawing force powers for any reason
;73:	FP_TELEPATHY,
;74:	FP_HEAL,
;75:	FP_ABSORB,
;76:	FP_PROTECT,
;77:	FP_TEAM_HEAL,
;78:	FP_LEVITATION,
;79:	FP_SPEED,
;80:	FP_PUSH,
;81:	FP_PULL,
;82:	FP_SEE,
;83:	FP_LIGHTNING,
;84:	FP_DRAIN,
;85:	FP_RAGE,
;86:	FP_GRIP,
;87:	FP_TEAM_FORCE,
;88:	FP_SABERATTACK,
;89:	FP_SABERDEFEND,
;90:	FP_SABERTHROW
;91:};
;92:
;93:int forcePowerDarkLight[NUM_FORCE_POWERS] = //0 == neutral
;94:{ //nothing should be usable at rank 0..
;95:	FORCE_LIGHTSIDE,//FP_HEAL,//instant
;96:	0,//FP_LEVITATION,//hold/duration
;97:	0,//FP_SPEED,//duration
;98:	0,//FP_PUSH,//hold/duration
;99:	0,//FP_PULL,//hold/duration
;100:	FORCE_LIGHTSIDE,//FP_TELEPATHY,//instant
;101:	FORCE_DARKSIDE,//FP_GRIP,//hold/duration
;102:	FORCE_DARKSIDE,//FP_LIGHTNING,//hold/duration
;103:	FORCE_DARKSIDE,//FP_RAGE,//duration
;104:	FORCE_LIGHTSIDE,//FP_PROTECT,//duration
;105:	FORCE_LIGHTSIDE,//FP_ABSORB,//duration
;106:	FORCE_LIGHTSIDE,//FP_TEAM_HEAL,//instant
;107:	FORCE_DARKSIDE,//FP_TEAM_FORCE,//instant
;108:	FORCE_DARKSIDE,//FP_DRAIN,//hold/duration
;109:	0,//FP_SEE,//duration
;110:	0,//FP_SABERATTACK,
;111:	0,//FP_SABERDEFEND,
;112:	0//FP_SABERTHROW,
;113:		//NUM_FORCE_POWERS
;114:};
;115:
;116:int WeaponReadyAnim[WP_NUM_WEAPONS] =
;117:{
;118:	TORSO_DROPWEAP1,//WP_NONE,
;119:
;120:	TORSO_WEAPONREADY3,//WP_STUN_BATON,
;121:	BOTH_STAND2,//WP_SABER,
;122:	TORSO_WEAPONREADY2,//WP_BRYAR_PISTOL,
;123:	TORSO_WEAPONREADY3,//WP_BLASTER,
;124:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY4,//WP_DISRUPTOR,
;125:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY5,//WP_BOWCASTER,
;126:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY6,//WP_REPEATER,
;127:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY7,//WP_DEMP2,
;128:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY8,//WP_FLECHETTE,
;129:	TORSO_WEAPONREADY3,//TORSO_WEAPONREADY9,//WP_ROCKET_LAUNCHER,
;130:	TORSO_WEAPONREADY10,//WP_THERMAL,
;131:	TORSO_WEAPONREADY10,//TORSO_WEAPONREADY11,//WP_TRIP_MINE,
;132:	TORSO_WEAPONREADY10,//TORSO_WEAPONREADY12,//WP_DET_PACK,
;133:
;134:	//NOT VALID (e.g. should never really be used):
;135:	BOTH_STAND1,//WP_EMPLACED_GUN,
;136:	TORSO_WEAPONREADY1//WP_TURRET,
;137:};
;138:
;139:int WeaponAttackAnim[WP_NUM_WEAPONS] =
;140:{
;141:	BOTH_ATTACK1,//WP_NONE, //(shouldn't happen)
;142:
;143:	BOTH_ATTACK3,//WP_STUN_BATON,
;144:	BOTH_STAND2,//WP_SABER, //(has its own handling)
;145:	BOTH_ATTACK2,//WP_BRYAR_PISTOL,
;146:	BOTH_ATTACK3,//WP_BLASTER,
;147:	BOTH_ATTACK3,//BOTH_ATTACK4,//WP_DISRUPTOR,
;148:	BOTH_ATTACK3,//BOTH_ATTACK5,//WP_BOWCASTER,
;149:	BOTH_ATTACK3,//BOTH_ATTACK6,//WP_REPEATER,
;150:	BOTH_ATTACK3,//BOTH_ATTACK7,//WP_DEMP2,
;151:	BOTH_ATTACK3,//BOTH_ATTACK8,//WP_FLECHETTE,
;152:	BOTH_ATTACK3,//BOTH_ATTACK9,//WP_ROCKET_LAUNCHER,
;153:	BOTH_THERMAL_THROW,//WP_THERMAL,
;154:	BOTH_ATTACK3,//BOTH_ATTACK11,//WP_TRIP_MINE,
;155:	BOTH_ATTACK3,//BOTH_ATTACK12,//WP_DET_PACK,
;156:
;157:	//NOT VALID (e.g. should never really be used):
;158:	BOTH_STAND1,//WP_EMPLACED_GUN,
;159:	BOTH_ATTACK1//WP_TURRET,
;160:};
;161:
;162:
;163:/*
;164:================
;165:BG_LegalizedForcePowers
;166:
;167:The magical function to end all functions.
;168:This will take the force power string in powerOut and parse through it, then legalize
;169:it based on the supposed rank and spit it into powerOut, returning true if it was legal
;170:to begin with and false if not.
;171:fpDisabled is actually only expected (needed) from the server, because the ui disables
;172:force power selection anyway when force powers are disabled on the server.
;173:================
;174:*/
;175:qboolean BG_LegalizedForcePowers(char *powerOut, int powerOutSize, int maxRank, qboolean freeSaber, int teamForce, int gametype, int fpDisabled)
;176:{
line 179
;177:	char powerBuf[128];
;178:	char readBuf[128];
;179:	qboolean maintainsValidity = qtrue;
ADDRLP4 352
CNSTI4 1
ASGNI4
line 180
;180:	int powerLen = strlen(powerOut);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 360
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 356
ADDRLP4 360
INDIRU4
CVUI4 4
ASGNI4
line 181
;181:	int i = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 182
;182:	int c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 183
;183:	int allowedPoints = 0;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 184
;184:	int usedPoints = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 185
;185:	int countDown = 0;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 192
;186:	
;187:	int final_Side;
;188:	int final_Powers[NUM_FORCE_POWERS];
;189:
;190://	for ( i = 0; i < NUM_FORCE_POWERS; i++ ) final_Powers[i] = 0;
;191:
;192:	if (powerLen >= 128)
ADDRLP4 356
INDIRI4
CNSTI4 128
LTI4 $130
line 193
;193:	{ //This should not happen. If it does, this is obviously a bogus string.
line 195
;194:		//They can have this string. Because I said so.
;195:		Q_strncpyz(powerBuf, "7-1-032330000000001333",sizeof(powerBuf));
ADDRLP4 92
ARGP4
ADDRGP4 $132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 196
;196:		maintainsValidity = qfalse;
ADDRLP4 352
CNSTI4 0
ASGNI4
line 197
;197:	}
ADDRGP4 $131
JUMPV
LABELV $130
line 199
;198:	else
;199:	{
line 200
;200:		Q_strncpyz(powerBuf, powerOut,sizeof(powerBuf)); //copy it as the original
ADDRLP4 92
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 201
;201:	}
LABELV $131
line 204
;202:
;203:	//first of all, print the max rank into the string as the rank
;204:	Q_strncpyz(powerOut, va("%i-", maxRank), powerOutSize);
ADDRGP4 $133
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 364
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 364
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $135
JUMPV
LABELV $134
line 207
;205:
;206:	while (i < 128 && powerBuf[i] && powerBuf[i] != '-')
;207:	{
line 208
;208:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 209
;209:	}
LABELV $135
line 206
ADDRLP4 76
INDIRI4
CNSTI4 128
GEI4 $138
ADDRLP4 372
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 0
EQI4 $138
ADDRLP4 372
INDIRI4
CNSTI4 45
NEI4 $134
LABELV $138
line 210
;210:	i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $140
JUMPV
LABELV $139
line 212
;211:	while (i < 128 && powerBuf[i] && powerBuf[i] != '-')
;212:	{
line 213
;213:		readBuf[c] = powerBuf[i];
ADDRLP4 0
INDIRI4
ADDRLP4 220
ADDP4
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
ASGNI1
line 214
;214:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 215
;215:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 216
;216:	}
LABELV $140
line 211
ADDRLP4 76
INDIRI4
CNSTI4 128
GEI4 $143
ADDRLP4 380
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
EQI4 $143
ADDRLP4 380
INDIRI4
CNSTI4 45
NEI4 $139
LABELV $143
line 217
;217:	readBuf[c] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 220
ADDP4
CNSTI1 0
ASGNI1
line 218
;218:	i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 220
;219:	//at this point, readBuf contains the intended side
;220:	final_Side = atoi(readBuf);
ADDRLP4 220
ARGP4
ADDRLP4 384
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 348
ADDRLP4 384
INDIRI4
ASGNI4
line 222
;221:
;222:	if (final_Side != FORCE_LIGHTSIDE &&
ADDRLP4 348
INDIRI4
CNSTI4 1
EQI4 $144
ADDRLP4 348
INDIRI4
CNSTI4 2
EQI4 $144
line 224
;223:		final_Side != FORCE_DARKSIDE)
;224:	{ //Not a valid side. You will be dark. Because I said so. (this is something that should never actually happen unless you purposely feed in an invalid config)
line 225
;225:		final_Side = FORCE_DARKSIDE;
ADDRLP4 348
CNSTI4 2
ASGNI4
line 226
;226:		maintainsValidity = qfalse;
ADDRLP4 352
CNSTI4 0
ASGNI4
line 227
;227:	}
LABELV $144
line 229
;228:
;229:	if (teamForce)
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $146
line 230
;230:	{ //If we are under force-aligned teams, make sure we're on the right side.
line 231
;231:		if (final_Side != teamForce)
ADDRLP4 348
INDIRI4
ADDRFP4 16
INDIRI4
EQI4 $148
line 232
;232:		{
line 233
;233:			final_Side = teamForce;
ADDRLP4 348
ADDRFP4 16
INDIRI4
ASGNI4
line 236
;234:			//maintainsValidity = qfalse;
;235:			//Not doing this, for now. Let them join the team with their filtered powers.
;236:		}
LABELV $148
line 237
;237:	}
LABELV $146
line 241
;238:
;239:	//Now we have established a valid rank, and a valid side.
;240:	//Read the force powers in, and cut them down based on the various rules supplied.
;241:	c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $151
JUMPV
LABELV $150
line 243
;242:	while (i < 128 && powerBuf[i] && powerBuf[i] != '\n' && c < NUM_FORCE_POWERS)
;243:	{
line 244
;244:		readBuf[0] = powerBuf[i];
ADDRLP4 220
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
ASGNI1
line 245
;245:		readBuf[1] = 0;
ADDRLP4 220+1
CNSTI1 0
ASGNI1
line 246
;246:		final_Powers[c] = atoi(readBuf);
ADDRLP4 220
ARGP4
ADDRLP4 392
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 392
INDIRI4
ASGNI4
line 247
;247:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 248
;248:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 249
;249:	}
LABELV $151
line 242
ADDRLP4 76
INDIRI4
CNSTI4 128
GEI4 $156
ADDRLP4 396
ADDRLP4 76
INDIRI4
ADDRLP4 92
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 396
INDIRI4
CNSTI4 0
EQI4 $156
ADDRLP4 396
INDIRI4
CNSTI4 10
EQI4 $156
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $150
LABELV $156
line 253
;250:
;251:	//final_Powers now contains all the stuff from the string
;252:	//Set the maximum allowed points used based on the max rank level, and count the points actually used.
;253:	if ( maxRank < 0 || maxRank >= NUM_FORCE_MASTERY_LEVELS ) allowedPoints = (1 << 24); // Some servers set their "maxRank" to 200 to allow players to use all force powers (of one side). That is actually an invalid read - a memory bug. Let's fix that...
ADDRLP4 400
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 0
LTI4 $159
ADDRLP4 400
INDIRI4
CNSTI4 8
LTI4 $157
LABELV $159
ADDRLP4 88
CNSTI4 16777216
ASGNI4
ADDRGP4 $158
JUMPV
LABELV $157
line 254
;254:	else													  allowedPoints = forceMasteryPoints[maxRank];
ADDRLP4 88
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceMasteryPoints
ADDP4
INDIRI4
ASGNI4
LABELV $158
line 256
;255:
;256:	i = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $161
JUMPV
LABELV $160
line 258
;257:	while (i < NUM_FORCE_POWERS)
;258:	{ //if this power doesn't match the side we're on, then 0 it now.
line 259
;259:		if (final_Powers[i] &&
ADDRLP4 404
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 408
CNSTI4 0
ASGNI4
ADDRLP4 404
INDIRI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 408
INDIRI4
EQI4 $163
ADDRLP4 412
ADDRLP4 404
INDIRI4
ADDRGP4 forcePowerDarkLight
ADDP4
INDIRI4
ASGNI4
ADDRLP4 412
INDIRI4
ADDRLP4 408
INDIRI4
EQI4 $163
ADDRLP4 412
INDIRI4
ADDRLP4 348
INDIRI4
EQI4 $163
line 262
;260:			forcePowerDarkLight[i] &&
;261:			forcePowerDarkLight[i] != final_Side)
;262:		{
line 263
;263:			final_Powers[i] = 0;
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 0
ASGNI4
line 265
;264:			//This is only likely to happen with g_forceBasedTeams. Let it slide.
;265:		}
LABELV $163
line 267
;266:
;267:		if ( final_Powers[i] &&
ADDRLP4 420
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 420
INDIRI4
EQI4 $165
ADDRFP4 24
INDIRI4
CNSTI4 1
ADDRLP4 76
INDIRI4
LSHI4
BANDI4
ADDRLP4 420
INDIRI4
EQI4 $165
line 269
;268:			(fpDisabled & (1 << i)) )
;269:		{ //if this power is disabled on the server via said server option, then we don't get it.
line 270
;270:			final_Powers[i] = 0;
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 0
ASGNI4
line 271
;271:		}
LABELV $165
line 273
;272:
;273:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 274
;274:	}
LABELV $161
line 257
ADDRLP4 76
INDIRI4
CNSTI4 18
LTI4 $160
line 276
;275:
;276:	if (gametype < GT_TEAM)
ADDRFP4 20
INDIRI4
CNSTI4 5
GEI4 $167
line 277
;277:	{ //don't bother with team powers then
line 278
;278:		final_Powers[FP_TEAM_HEAL] = 0;
ADDRLP4 4+44
CNSTI4 0
ASGNI4
line 279
;279:		final_Powers[FP_TEAM_FORCE] = 0;
ADDRLP4 4+48
CNSTI4 0
ASGNI4
line 280
;280:	}
LABELV $167
line 282
;281:
;282:	usedPoints = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 283
;283:	i = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $172
JUMPV
LABELV $171
line 285
;284:	while (i < NUM_FORCE_POWERS)
;285:	{
line 286
;286:		countDown = 0;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 288
;287:
;288:		countDown = final_Powers[i];
ADDRLP4 84
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $174
line 291
;289:
;290:		while (countDown > 0)
;291:		{
line 292
;292:			usedPoints += bgForcePowerCost[i][countDown]; //[fp index][fp level]
ADDRLP4 80
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 76
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
ADDI4
ASGNI4
line 294
;293:			//if this is jump, or we have a free saber and it's offense or defense, take the level back down on level 1
;294:			if ( countDown == 1 &&
ADDRLP4 404
CNSTI4 1
ASGNI4
ADDRLP4 84
INDIRI4
ADDRLP4 404
INDIRI4
NEI4 $177
ADDRLP4 76
INDIRI4
ADDRLP4 404
INDIRI4
EQI4 $180
ADDRLP4 76
INDIRI4
CNSTI4 15
NEI4 $181
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $180
LABELV $181
ADDRLP4 76
INDIRI4
CNSTI4 16
NEI4 $177
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $177
LABELV $180
line 298
;295:				((i == FP_LEVITATION) ||
;296:				 (i == FP_SABERATTACK && freeSaber) ||
;297:				 (i == FP_SABERDEFEND && freeSaber)) )
;298:			{
line 299
;299:				usedPoints -= bgForcePowerCost[i][countDown];
ADDRLP4 80
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 76
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 300
;300:			}
LABELV $177
line 301
;301:			countDown--;
ADDRLP4 84
ADDRLP4 84
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 302
;302:		}
LABELV $175
line 290
ADDRLP4 84
INDIRI4
CNSTI4 0
GTI4 $174
line 304
;303:
;304:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 305
;305:	}
LABELV $172
line 284
ADDRLP4 76
INDIRI4
CNSTI4 18
LTI4 $171
line 307
;306:
;307:	if (usedPoints > allowedPoints)
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $182
line 308
;308:	{ //Time to do the fancy stuff. (meaning, slowly cut parts off while taking a guess at what is most or least important in the config)
line 309
;309:		int attemptedCycles = 0;
ADDRLP4 412
CNSTI4 0
ASGNI4
line 310
;310:		int powerCycle = 2;
ADDRLP4 404
CNSTI4 2
ASGNI4
line 311
;311:		int minPow = 0;
ADDRLP4 408
CNSTI4 0
ASGNI4
line 313
;312:		
;313:		if (freeSaber)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $184
line 314
;314:		{
line 315
;315:			minPow = 1;
ADDRLP4 408
CNSTI4 1
ASGNI4
line 316
;316:		}
LABELV $184
line 318
;317:
;318:		maintainsValidity = qfalse;
ADDRLP4 352
CNSTI4 0
ASGNI4
ADDRGP4 $187
JUMPV
LABELV $186
line 321
;319:
;320:		while (usedPoints > allowedPoints)
;321:		{
line 322
;322:			c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $190
JUMPV
LABELV $189
line 325
;323:
;324:			while (c < NUM_FORCE_POWERS && usedPoints > allowedPoints)
;325:			{
line 326
;326:				if (final_Powers[c] && final_Powers[c] < powerCycle)
ADDRLP4 416
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
EQI4 $192
ADDRLP4 416
INDIRI4
ADDRLP4 404
INDIRI4
GEI4 $192
line 327
;327:				{ //kill in order of lowest powers, because the higher powers are probably more important
line 328
;328:					if (c == FP_SABERATTACK &&
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $211
ADDRLP4 4+64
INDIRI4
ADDRLP4 408
INDIRI4
GTI4 $198
ADDRLP4 4+68
INDIRI4
CNSTI4 0
LEI4 $211
LABELV $198
line 330
;329:						(final_Powers[FP_SABERDEFEND] > minPow || final_Powers[FP_SABERTHROW] > 0))
;330:					{ //if we're on saber attack, only suck it down if we have no def or throw either
line 331
;331:						int whichOne = FP_SABERTHROW; //first try throw
ADDRLP4 420
CNSTI4 17
ASGNI4
line 333
;332:
;333:						if (!final_Powers[whichOne])
ADDRLP4 420
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $202
line 334
;334:						{
line 335
;335:							whichOne = FP_SABERDEFEND; //if no throw, drain defense
ADDRLP4 420
CNSTI4 16
ASGNI4
line 336
;336:						}
ADDRGP4 $202
JUMPV
LABELV $201
line 339
;337:
;338:						while (final_Powers[whichOne] > 0 && usedPoints > allowedPoints)
;339:						{
line 340
;340:							if ( final_Powers[whichOne] > 1 ||
ADDRLP4 420
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 1
GTI4 $208
ADDRLP4 420
INDIRI4
CNSTI4 15
NEI4 $207
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $195
LABELV $207
ADDRLP4 420
INDIRI4
CNSTI4 16
NEI4 $208
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $195
LABELV $208
line 343
;341:								( (whichOne != FP_SABERATTACK || !freeSaber) &&
;342:								  (whichOne != FP_SABERDEFEND || !freeSaber) ) )
;343:							{ //don't take attack or defend down on level 1 still, if it's free
line 344
;344:								usedPoints -= bgForcePowerCost[whichOne][final_Powers[whichOne]];
ADDRLP4 432
CNSTI4 2
ASGNI4
ADDRLP4 80
ADDRLP4 80
INDIRI4
ADDRLP4 420
INDIRI4
ADDRLP4 432
INDIRI4
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 432
INDIRI4
LSHI4
ADDRLP4 420
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 345
;345:								final_Powers[whichOne]--;
ADDRLP4 436
ADDRLP4 420
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ASGNP4
ADDRLP4 436
INDIRP4
ADDRLP4 436
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 346
;346:							}
line 348
;347:							else
;348:							{
line 349
;349:								break;
LABELV $205
line 351
;350:							}
;351:						}
LABELV $202
line 338
ADDRLP4 420
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 0
LEI4 $209
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
GTI4 $201
LABELV $209
line 352
;352:					}
ADDRGP4 $195
JUMPV
line 354
;353:					else
;354:					{
LABELV $210
line 356
;355:						while (final_Powers[c] > 0 && usedPoints > allowedPoints)
;356:						{
line 357
;357:							if ( final_Powers[c] > 1 ||
ADDRLP4 424
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 424
INDIRI4
GTI4 $217
ADDRLP4 0
INDIRI4
ADDRLP4 424
INDIRI4
EQI4 $212
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $216
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $212
LABELV $216
ADDRLP4 0
INDIRI4
CNSTI4 16
NEI4 $217
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $212
LABELV $217
line 361
;358:								((c != FP_LEVITATION) &&
;359:								(c != FP_SABERATTACK || !freeSaber) &&
;360:								(c != FP_SABERDEFEND || !freeSaber)) )
;361:							{
line 362
;362:								usedPoints -= bgForcePowerCost[c][final_Powers[c]];
ADDRLP4 432
CNSTI4 2
ASGNI4
ADDRLP4 80
ADDRLP4 80
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 432
INDIRI4
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 432
INDIRI4
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 bgForcePowerCost
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 363
;363:								final_Powers[c]--;
ADDRLP4 436
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ASGNP4
ADDRLP4 436
INDIRP4
ADDRLP4 436
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 364
;364:							}
line 366
;365:							else
;366:							{
line 367
;367:								break;
LABELV $214
line 369
;368:							}
;369:						}
LABELV $211
line 355
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 0
LEI4 $218
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
GTI4 $210
LABELV $218
LABELV $212
line 370
;370:					}
LABELV $195
line 371
;371:				}
LABELV $192
line 373
;372:
;373:				c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 374
;374:			}
LABELV $190
line 324
ADDRLP4 0
INDIRI4
CNSTI4 18
GEI4 $219
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
GTI4 $189
LABELV $219
line 376
;375:
;376:			powerCycle++;
ADDRLP4 404
ADDRLP4 404
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 377
;377:			attemptedCycles++;
ADDRLP4 412
ADDRLP4 412
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 379
;378:
;379:			if (attemptedCycles > NUM_FORCE_POWERS)
ADDRLP4 412
INDIRI4
CNSTI4 18
LEI4 $220
line 380
;380:			{ //I think this should be impossible. But just in case.
line 381
;381:				break;
ADDRGP4 $188
JUMPV
LABELV $220
line 383
;382:			}
;383:		}
LABELV $187
line 320
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
GTI4 $186
LABELV $188
line 385
;384:
;385:		if (usedPoints > allowedPoints)
ADDRLP4 80
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $222
line 386
;386:		{ //Still? Fine then.. we will kill all of your powers, except the freebies.
line 387
;387:			i = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $225
JUMPV
LABELV $224
line 390
;388:
;389:			while (i < NUM_FORCE_POWERS)
;390:			{
line 391
;391:				final_Powers[i] = 0;
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 0
ASGNI4
line 392
;392:				if (i == FP_LEVITATION ||
ADDRLP4 76
INDIRI4
CNSTI4 1
EQI4 $230
ADDRLP4 76
INDIRI4
CNSTI4 15
NEI4 $231
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $230
LABELV $231
ADDRLP4 76
INDIRI4
CNSTI4 16
NEI4 $227
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $227
LABELV $230
line 395
;393:					(i == FP_SABERATTACK && freeSaber) ||
;394:					(i == FP_SABERDEFEND && freeSaber))
;395:				{
line 396
;396:					final_Powers[i] = 1;
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 1
ASGNI4
line 397
;397:				}
LABELV $227
line 398
;398:				i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 399
;399:			}
LABELV $225
line 389
ADDRLP4 76
INDIRI4
CNSTI4 18
LTI4 $224
line 400
;400:			usedPoints = 0;
ADDRLP4 80
CNSTI4 0
ASGNI4
line 401
;401:		}
LABELV $222
line 402
;402:	}
LABELV $182
line 404
;403:
;404:	if (jk2gameplay == VERSION_1_02 && final_Powers[FP_SABERATTACK] < 1)
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $232
ADDRLP4 4+60
INDIRI4
CNSTI4 1
GEI4 $232
line 405
;405:	{
line 406
;406:		final_Powers[FP_SABERDEFEND] = 0;
ADDRLP4 4+64
CNSTI4 0
ASGNI4
line 407
;407:		final_Powers[FP_SABERTHROW] = 0;
ADDRLP4 4+68
CNSTI4 0
ASGNI4
line 408
;408:	}
LABELV $232
line 410
;409:
;410:	if (freeSaber)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $237
line 411
;411:	{
line 412
;412:		if (final_Powers[FP_SABERATTACK] < 1)
ADDRLP4 4+60
INDIRI4
CNSTI4 1
GEI4 $239
line 413
;413:		{
line 414
;414:			final_Powers[FP_SABERATTACK] = 1;
ADDRLP4 4+60
CNSTI4 1
ASGNI4
line 415
;415:		}
LABELV $239
line 416
;416:		if (final_Powers[FP_SABERDEFEND] < 1)
ADDRLP4 4+64
INDIRI4
CNSTI4 1
GEI4 $243
line 417
;417:		{
line 418
;418:			final_Powers[FP_SABERDEFEND] = 1;
ADDRLP4 4+64
CNSTI4 1
ASGNI4
line 419
;419:		}
LABELV $243
line 420
;420:	}
LABELV $237
line 421
;421:	if (final_Powers[FP_LEVITATION] < 1)
ADDRLP4 4+4
INDIRI4
CNSTI4 1
GEI4 $247
line 422
;422:	{
line 423
;423:		final_Powers[FP_LEVITATION] = 1;
ADDRLP4 4+4
CNSTI4 1
ASGNI4
line 424
;424:	}
LABELV $247
line 426
;425:
;426:	i = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $252
JUMPV
LABELV $251
line 428
;427:	while (i < NUM_FORCE_POWERS)
;428:	{
line 429
;429:		if (final_Powers[i] > FORCE_LEVEL_3)
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 3
LEI4 $254
line 430
;430:		{
line 431
;431:			final_Powers[i] = FORCE_LEVEL_3;
ADDRLP4 76
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 3
ASGNI4
line 432
;432:		}
LABELV $254
line 433
;433:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 434
;434:	}
LABELV $252
line 427
ADDRLP4 76
INDIRI4
CNSTI4 18
LTI4 $251
line 436
;435:
;436:	if ( jk2startversion == VERSION_1_02
ADDRGP4 jk2startversion
INDIRI4
CNSTI4 2
NEI4 $256
ADDRGP4 g_mv_forcePowerDisableMode+12
INDIRI4
CNSTI4 0
EQI4 $256
line 441
;437:#ifdef JK2_GAME
;438:		&& g_mv_forcePowerDisableMode.integer
;439:#endif //JK2_GAME
;440:		)
;441:	{ // The 1.02 client doesn't show the force selection menu if ANY force power is disabled. Some servers might be running on a power-set that disables all powers, except those three. Basejk clients might get a handicap then, cause they can't set their powers and might end up with weaker attack/defense than other players. Servers should only disable this on 1.02, if they know what they're doing.
line 442
;442:		if (fpDisabled)
ADDRFP4 24
INDIRI4
CNSTI4 0
EQI4 $257
line 443
;443:		{
line 444
;444:			final_Powers[FP_LEVITATION] = 1;
ADDRLP4 4+4
CNSTI4 1
ASGNI4
line 445
;445:			final_Powers[FP_SABERATTACK] = 3;
ADDRLP4 4+60
CNSTI4 3
ASGNI4
line 446
;446:			final_Powers[FP_SABERDEFEND] = 3;
ADDRLP4 4+64
CNSTI4 3
ASGNI4
line 447
;447:			final_Powers[FP_SABERTHROW] = 0;
ADDRLP4 4+68
CNSTI4 0
ASGNI4
line 448
;448:		}
line 449
;449:	}
ADDRGP4 $257
JUMPV
LABELV $256
line 451
;450:	else
;451:	{
line 452
;452:		if (fpDisabled)
ADDRFP4 24
INDIRI4
CNSTI4 0
EQI4 $265
line 453
;453:		{ //If we specifically have attack or def disabled, force them up to level 3. It's the way
line 456
;454:			//things work for the case of all powers disabled.
;455:			//If jump is disabled, down-cap it to level 1. Otherwise don't do a thing.
;456:			if (fpDisabled & (1 << FP_LEVITATION))
ADDRFP4 24
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $267
line 457
;457:			{
line 458
;458:				final_Powers[FP_LEVITATION] = 1;
ADDRLP4 4+4
CNSTI4 1
ASGNI4
line 459
;459:			}
LABELV $267
line 460
;460:			if (fpDisabled & (1 << FP_SABERATTACK))
ADDRFP4 24
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $270
line 461
;461:			{
line 462
;462:				final_Powers[FP_SABERATTACK] = 3;
ADDRLP4 4+60
CNSTI4 3
ASGNI4
line 463
;463:			}
LABELV $270
line 464
;464:			if (fpDisabled & (1 << FP_SABERDEFEND))
ADDRFP4 24
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $273
line 465
;465:			{
line 466
;466:				final_Powers[FP_SABERDEFEND] = 3;
ADDRLP4 4+64
CNSTI4 3
ASGNI4
line 467
;467:			}
LABELV $273
line 468
;468:		}
LABELV $265
line 470
;469:
;470:		if (final_Powers[FP_SABERATTACK] < 1)
ADDRLP4 4+60
INDIRI4
CNSTI4 1
GEI4 $276
line 471
;471:		{
line 472
;472:			final_Powers[FP_SABERDEFEND] = 0;
ADDRLP4 4+64
CNSTI4 0
ASGNI4
line 473
;473:			final_Powers[FP_SABERTHROW] = 0;
ADDRLP4 4+68
CNSTI4 0
ASGNI4
line 474
;474:		}
LABELV $276
line 475
;475:	}
LABELV $257
line 480
;476:
;477:	//We finally have all the force powers legalized and stored locally.
;478:	//Put them all into the string and return the result. We already have
;479:	//the rank there, so print the side and the powers now.
;480:	Q_strcat(powerOut, powerOutSize, va("%i-", final_Side));
ADDRGP4 $133
ARGP4
ADDRLP4 348
INDIRI4
ARGI4
ADDRLP4 404
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 404
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 482
;481:
;482:	i = strlen(powerOut);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 408
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 76
ADDRLP4 408
INDIRU4
CVUI4 4
ASGNI4
line 483
;483:	c = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $282
JUMPV
LABELV $281
line 485
;484:	while (c < NUM_FORCE_POWERS)
;485:	{
line 486
;486:		Q_strncpyz(readBuf, va("%i", final_Powers[c]),sizeof(readBuf));
ADDRGP4 $284
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 412
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 220
ARGP4
ADDRLP4 412
INDIRP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 487
;487:		powerOut[i] = readBuf[0];
ADDRLP4 76
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 220
INDIRI1
ASGNI1
line 488
;488:		c++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 489
;489:		i++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 490
;490:	}
LABELV $282
line 484
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $281
line 491
;491:	powerOut[i] = 0;
ADDRLP4 76
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 493
;492:
;493:	return maintainsValidity;
ADDRLP4 352
INDIRI4
RETI4
LABELV $129
endproc BG_LegalizedForcePowers 440 12
data
export bg_itemlist
align 4
LABELV bg_itemlist
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $285
address $285
address $286
address $287
address $288
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $289
byte 4 25
byte 4 3
byte 4 1
address $285
address $285
address $290
address $287
address $291
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $292
byte 4 100
byte 4 3
byte 4 2
address $285
address $285
address $293
address $294
address $295
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $296
byte 4 25
byte 4 4
byte 4 0
address $285
address $285
address $297
address $298
address $299
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $300
byte 4 120
byte 4 6
byte 4 1
address $285
address $285
address $301
address $298
address $302
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $303
byte 4 120
byte 4 6
byte 4 2
address $285
address $304
address $305
address $298
address $306
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $307
byte 4 25
byte 4 6
byte 4 3
address $285
address $285
address $308
address $298
address $309
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 6
byte 4 4
address $285
address $285
address $310
address $298
address $311
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $312
byte 4 60
byte 4 6
byte 4 5
address $285
address $285
address $313
address $298
address $314
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $315
byte 4 120
byte 4 6
byte 4 6
address $285
address $285
address $316
address $317
address $318
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $319
byte 4 25
byte 4 5
byte 4 12
address $285
address $285
address $320
address $317
address $321
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $322
byte 4 25
byte 4 5
byte 4 13
address $285
address $285
address $323
address $324
address $325
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $326
byte 4 25
byte 4 5
byte 4 14
address $285
address $285
address $327
address $328
address $329
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $330
byte 4 25
byte 4 5
byte 4 15
address $285
address $285
address $331
address $298
address $332
byte 4 0
byte 4 0
byte 4 0
address $333
address $334
byte 4 100
byte 4 1
byte 4 1
address $285
address $285
address $335
address $298
address $336
byte 4 0
byte 4 0
byte 4 0
address $337
address $338
byte 4 100
byte 4 1
byte 4 2
address $285
address $285
address $339
address $298
address $340
byte 4 0
byte 4 0
byte 4 0
address $341
address $342
byte 4 100
byte 4 1
byte 4 3
address $285
address $285
address $343
address $298
address $344
byte 4 0
byte 4 0
byte 4 0
address $345
address $346
byte 4 100
byte 4 1
byte 4 4
address $285
address $285
address $347
address $298
address $348
byte 4 0
byte 4 0
byte 4 0
address $349
address $350
byte 4 100
byte 4 1
byte 4 5
address $285
address $285
address $351
address $298
address $352
byte 4 0
byte 4 0
byte 4 0
address $353
address $354
byte 4 100
byte 4 1
byte 4 6
address $285
address $285
address $355
address $298
address $356
byte 4 0
byte 4 0
byte 4 0
address $357
address $358
byte 4 100
byte 4 1
byte 4 7
address $285
address $285
address $359
address $298
address $360
byte 4 0
byte 4 0
byte 4 0
address $361
address $362
byte 4 100
byte 4 1
byte 4 8
address $285
address $285
address $363
address $298
address $364
byte 4 0
byte 4 0
byte 4 0
address $365
address $366
byte 4 100
byte 4 1
byte 4 9
address $285
address $285
address $367
address $298
address $368
byte 4 0
byte 4 0
byte 4 0
address $369
address $370
byte 4 3
byte 4 1
byte 4 10
address $285
address $285
address $371
address $298
address $372
address $373
byte 4 0
byte 4 0
address $374
address $375
byte 4 4
byte 4 2
byte 4 7
address $285
address $285
address $376
address $298
address $377
address $378
byte 4 0
byte 4 0
address $379
address $380
byte 4 3
byte 4 2
byte 4 8
address $285
address $285
address $381
address $298
address $382
address $383
address $384
byte 4 0
address $385
address $386
byte 4 3
byte 4 2
byte 4 9
address $285
address $285
address $387
address $298
address $373
address $372
byte 4 0
byte 4 0
address $374
address $375
byte 4 4
byte 4 1
byte 4 11
address $285
address $285
address $388
address $298
address $378
address $377
byte 4 0
byte 4 0
address $379
address $380
byte 4 3
byte 4 1
byte 4 12
address $285
address $285
address $389
address $298
address $383
address $382
address $384
byte 4 0
address $385
address $386
byte 4 3
byte 4 1
byte 4 13
address $285
address $285
address $390
address $298
address $344
byte 4 0
byte 4 0
byte 4 0
address $345
address $346
byte 4 50
byte 4 1
byte 4 14
address $285
address $285
address $391
address $298
address $344
byte 4 0
byte 4 0
byte 4 0
address $345
address $346
byte 4 50
byte 4 1
byte 4 15
address $285
address $285
address $392
address $393
address $394
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $346
byte 4 100
byte 4 2
byte 4 1
address $285
address $285
address $395
address $393
address $394
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $396
byte 4 100
byte 4 2
byte 4 2
address $285
address $285
address $397
address $393
address $398
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $399
byte 4 100
byte 4 2
byte 4 3
address $285
address $285
address $400
address $393
address $401
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $402
byte 4 100
byte 4 2
byte 4 4
address $285
address $285
address $403
address $393
address $404
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $405
byte 4 3
byte 4 2
byte 4 5
address $285
address $285
address $406
byte 4 0
address $407
address $408
byte 4 0
byte 4 0
byte 4 0
address $409
byte 4 0
byte 4 8
byte 4 4
address $285
address $285
address $410
byte 4 0
address $411
address $412
byte 4 0
byte 4 0
byte 4 0
address $413
byte 4 0
byte 4 8
byte 4 5
address $285
address $285
address $414
byte 4 0
address $415
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $416
byte 4 0
byte 4 8
byte 4 6
address $285
address $285
address $417
address $393
address $418
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $419
byte 4 0
byte 4 8
byte 4 0
address $285
address $285
address $420
address $393
address $421
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $422
byte 4 0
byte 4 8
byte 4 0
address $285
address $285
byte 4 0
skip 48
export bg_numItems
align 4
LABELV bg_numItems
byte 4 42
export vectoyaw
code
proc vectoyaw 20 8
line 1285
;494:}
;495:
;496:/*QUAKED item_***** ( 0 0 0 ) (-16 -16 -16) (16 16 16) suspended
;497:DO NOT USE THIS CLASS, IT JUST HOLDS GENERAL INFORMATION.
;498:The suspended flag will allow items to hang in the air, otherwise they are dropped to the next surface.
;499:
;500:If an item is the target of another entity, it will not spawn in until fired.
;501:
;502:An item fires all of its targets when it is picked up.  If the toucher can't carry it, the targets won't be fired.
;503:
;504:"notfree" if set to 1, don't spawn in free for all games
;505:"notteam" if set to 1, don't spawn in team games
;506:"notsingle" if set to 1, don't spawn in single player games
;507:"wait"	override the default wait before respawning.  -1 = never respawn automatically, which can be used with targeted spawning.
;508:"random" random number of plus or minus seconds varied from the respawn time
;509:"count" override quantity or duration on most items.
;510:*/
;511:
;512:/*QUAKED misc_shield_floor_unit (1 0 0) (-16 -16 0) (16 16 40)
;513:#MODELNAME="/models/items/a_shield_converter.md3"
;514:Gives shield energy when used.
;515:
;516:"count" - max charge value (default 50)
;517:"chargerate" - rechage 1 point every this many milliseconds (default 3000)
;518:*/
;519:
;520:gitem_t	bg_itemlist[] = 
;521:{
;522:	{
;523:		NULL,				// classname	
;524:		NULL,				// pickup_sound
;525:		{	NULL,			// world_model[0]
;526:			NULL,			// world_model[1]
;527:			0, 0} ,			// world_model[2],[3]
;528:		NULL,				// view_model
;529:/* icon */		NULL,		// icon
;530:/* pickup */	//NULL,		// pickup_name
;531:		0,					// quantity
;532:		0,					// giType (IT_*)
;533:		0,					// giTag
;534:/* precache */ "",			// precaches
;535:/* sounds */ ""				// sounds
;536:	},	// leave index 0 alone
;537:
;538:	//
;539:	// Pickups
;540:	//
;541:
;542:/*QUAKED item_shield_sm_instant (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;543:Instant shield pickup, restores 25
;544:*/
;545:	{
;546:		"item_shield_sm_instant", 
;547:		"sound/player/pickupshield.wav",
;548:        { "models/map_objects/mp/psd_sm.md3",
;549:		0, 0, 0},
;550:/* view */		NULL,			
;551:/* icon */		"gfx/mp/small_shield",
;552:/* pickup *///	"Shield Small",
;553:		25,
;554:		IT_ARMOR,
;555:		1, //special for shield - max on pickup is maxhealth*tag, thus small shield goes up to 100 shield
;556:/* precache */ "",
;557:/* sounds */ ""
;558:	},
;559:
;560:/*QUAKED item_shield_lrg_instant (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;561:Instant shield pickup, restores 100
;562:*/
;563:	{
;564:		"item_shield_lrg_instant", 
;565:		"sound/player/pickupshield.wav",
;566:        { "models/map_objects/mp/psd.md3",
;567:		0, 0, 0},
;568:/* view */		NULL,			
;569:/* icon */		"gfx/mp/large_shield",
;570:/* pickup *///	"Shield Large",
;571:		100,
;572:		IT_ARMOR,
;573:		2, //special for shield - max on pickup is maxhealth*tag, thus large shield goes up to 200 shield
;574:/* precache */ "",
;575:/* sounds */ ""
;576:	},
;577:
;578:/*QUAKED item_medpak_instant (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;579:Instant medpack pickup, heals 25
;580:*/
;581:	{
;582:		"item_medpak_instant",
;583:		"sound/player/pickuphealth.wav",
;584:        { "models/map_objects/mp/medpac.md3", 
;585:		0, 0, 0 },
;586:/* view */		NULL,			
;587:/* icon */		"gfx/hud/i_icon_medkit",
;588:/* pickup *///	"Medpack",
;589:		25,
;590:		IT_HEALTH,
;591:		0,
;592:/* precache */ "",
;593:/* sounds */ ""
;594:	},
;595:
;596:
;597:	//
;598:	// ITEMS
;599:	//
;600:
;601:/*QUAKED item_seeker (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;602:30 seconds of seeker drone
;603:*/
;604:	{
;605:		"item_seeker", 
;606:		"sound/weapons/w_pkup.wav",
;607:		{ "models/items/remote.md3", 
;608:		0, 0, 0} ,
;609:/* view */		NULL,			
;610:/* icon */		"gfx/hud/i_icon_seeker",
;611:/* pickup *///	"Seeker Drone",
;612:		120,
;613:		IT_HOLDABLE,
;614:		HI_SEEKER,
;615:/* precache */ "",
;616:/* sounds */ ""
;617:	},
;618:
;619:/*QUAKED item_shield (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;620:Portable shield
;621:*/
;622:	{
;623:		"item_shield", 
;624:		"sound/weapons/w_pkup.wav",
;625:		{ "models/map_objects/mp/shield.md3", 
;626:		0, 0, 0} ,
;627:/* view */		NULL,			
;628:/* icon */		"gfx/hud/i_icon_shieldwall",
;629:/* pickup *///	"Forcefield",
;630:		120,
;631:		IT_HOLDABLE,
;632:		HI_SHIELD,
;633:/* precache */ "",
;634:/* sounds */ "sound/weapons/detpack/stick.wav sound/movers/doors/forcefield_on.wav sound/movers/doors/forcefield_off.wav sound/movers/doors/forcefield_lp.wav sound/effects/bumpfield.wav",
;635:	},
;636:
;637:/*QUAKED item_medpac (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;638:Bacta canister pickup, heals 25 on use
;639:*/
;640:	{
;641:		"item_medpac",	//should be item_bacta
;642:		"sound/weapons/w_pkup.wav",
;643:		{ "models/map_objects/mp/bacta.md3", 
;644:		0, 0, 0} ,
;645:/* view */		NULL,			
;646:/* icon */		"gfx/hud/i_icon_bacta",
;647:/* pickup *///	"Bacta Canister",
;648:		25,
;649:		IT_HOLDABLE,
;650:		HI_MEDPAC,
;651:/* precache */ "",
;652:/* sounds */ ""
;653:	},
;654:
;655:/*QUAKED item_datapad (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;656:Do not place this.
;657:*/
;658:	{
;659:		"item_datapad", 
;660:		"sound/weapons/w_pkup.wav",
;661:		{ "models/items/datapad.md3", 
;662:		0, 0, 0} ,
;663:/* view */		NULL,			
;664:/* icon */		NULL,
;665:/* pickup *///	"Datapad",
;666:		1,
;667:		IT_HOLDABLE,
;668:		HI_DATAPAD,
;669:/* precache */ "",
;670:/* sounds */ ""
;671:	},
;672:
;673:/*QUAKED item_binoculars (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;674:These will be standard equipment on the player - DO NOT PLACE
;675:*/
;676:	{
;677:		"item_binoculars", 
;678:		"sound/weapons/w_pkup.wav",
;679:		{ "models/items/binoculars.md3", 
;680:		0, 0, 0} ,
;681:/* view */		NULL,			
;682:/* icon */		"gfx/hud/i_icon_zoom",
;683:/* pickup *///	"Binoculars",
;684:		60,
;685:		IT_HOLDABLE,
;686:		HI_BINOCULARS,
;687:/* precache */ "",
;688:/* sounds */ ""
;689:	},
;690:
;691:/*QUAKED item_sentry_gun (.3 .3 1) (-8 -8 -0) (8 8 16) suspended
;692:Sentry gun inventory pickup.
;693:*/
;694:	{
;695:		"item_sentry_gun", 
;696:		"sound/weapons/w_pkup.wav",
;697:		{ "models/items/psgun.glm", 
;698:		0, 0, 0} ,
;699:/* view */		NULL,			
;700:/* icon */		"gfx/hud/i_icon_sentrygun",
;701:/* pickup *///	"Sentry Gun",
;702:		120,
;703:		IT_HOLDABLE,
;704:		HI_SENTRY_GUN,
;705:/* precache */ "",
;706:/* sounds */ ""
;707:	},
;708:
;709:/*QUAKED item_force_enlighten_light (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;710:Adds one rank to all Force powers temporarily. Only light jedi can use.
;711:*/
;712:	{
;713:		"item_force_enlighten_light",
;714:		"sound/player/enlightenment.wav",
;715:		{ "models/map_objects/mp/jedi_enlightenment.md3", 
;716:		0, 0, 0} ,
;717:/* view */		NULL,			
;718:/* icon */		"gfx/hud/mpi_jlight",
;719:/* pickup *///	"Light Force Enlightenment",
;720:		25,
;721:		IT_POWERUP,
;722:		PW_FORCE_ENLIGHTENED_LIGHT,
;723:/* precache */ "",
;724:/* sounds */ ""
;725:	},
;726:
;727:/*QUAKED item_force_enlighten_dark (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;728:Adds one rank to all Force powers temporarily. Only dark jedi can use.
;729:*/
;730:	{
;731:		"item_force_enlighten_dark",
;732:		"sound/player/enlightenment.wav",
;733:		{ "models/map_objects/mp/dk_enlightenment.md3", 
;734:		0, 0, 0} ,
;735:/* view */		NULL,			
;736:/* icon */		"gfx/hud/mpi_dklight",
;737:/* pickup *///	"Dark Force Enlightenment",
;738:		25,
;739:		IT_POWERUP,
;740:		PW_FORCE_ENLIGHTENED_DARK,
;741:/* precache */ "",
;742:/* sounds */ ""
;743:	},
;744:
;745:/*QUAKED item_force_boon (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;746:Unlimited Force Pool for a short time.
;747:*/
;748:	{
;749:		"item_force_boon",
;750:		"sound/player/boon.wav",
;751:		{ "models/map_objects/mp/force_boon.md3", 
;752:		0, 0, 0} ,
;753:/* view */		NULL,			
;754:/* icon */		"gfx/hud/mpi_fboon",
;755:/* pickup *///	"Force Boon",
;756:		25,
;757:		IT_POWERUP,
;758:		PW_FORCE_BOON,
;759:/* precache */ "",
;760:/* sounds */ ""
;761:	},
;762:
;763:/*QUAKED item_ysalimari (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;764:A small lizard carried on the player, which prevents the possessor from using any Force power.  However, he is unaffected by any Force power.
;765:*/
;766:	{
;767:		"item_ysalimari",
;768:		"sound/player/ysalimari.wav",
;769:		{ "models/map_objects/mp/ysalimari.md3", 
;770:		0, 0, 0} ,
;771:/* view */		NULL,			
;772:/* icon */		"gfx/hud/mpi_ysamari",
;773:/* pickup *///	"Ysalamiri",
;774:		25,
;775:		IT_POWERUP,
;776:		PW_YSALAMIRI,
;777:/* precache */ "",
;778:/* sounds */ ""
;779:	},
;780:
;781:	//
;782:	// WEAPONS 
;783:	//
;784:
;785:/*QUAKED weapon_stun_baton (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;786:Don't place this
;787:*/
;788:	{
;789:		"weapon_stun_baton", 
;790:		"sound/weapons/w_pkup.wav",
;791:        { "models/weapons2/stun_baton/baton_w.glm", 
;792:		0, 0, 0},
;793:/* view */		"models/weapons2/stun_baton/baton.md3", 
;794:/* icon */		"gfx/hud/w_icon_stunbaton",
;795:/* pickup *///	"Stun Baton",
;796:		100,
;797:		IT_WEAPON,
;798:		WP_STUN_BATON,
;799:/* precache */ "",
;800:/* sounds */ ""
;801:	},
;802:
;803:/*QUAKED weapon_saber (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;804:Don't place this
;805:*/
;806:	{
;807:		"weapon_saber", 
;808:		"sound/weapons/w_pkup.wav",
;809:        { "models/weapons2/saber/saber_w.glm",
;810:		0, 0, 0},
;811:/* view */		"models/weapons2/saber/saber_w.md3",
;812:/* icon */		"gfx/hud/w_icon_lightsaber",
;813:/* pickup *///	"Lightsaber",
;814:		100,
;815:		IT_WEAPON,
;816:		WP_SABER,
;817:/* precache */ "",
;818:/* sounds */ ""
;819:	},
;820:
;821:/*QUAKED weapon_bryar_pistol (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;822:Don't place this
;823:*/
;824:	{
;825:		"weapon_bryar_pistol", 
;826:		"sound/weapons/w_pkup.wav",
;827:        { "models/weapons2/briar_pistol/briar_pistol_w.glm", 
;828:		0, 0, 0},
;829:/* view */		"models/weapons2/briar_pistol/briar_pistol.md3", 
;830:/* icon */		"gfx/hud/w_icon_rifle",
;831:/* pickup *///	"Bryar Pistol",
;832:		100,
;833:		IT_WEAPON,
;834:		WP_BRYAR_PISTOL,
;835:/* precache */ "",
;836:/* sounds */ ""
;837:	},
;838:
;839:/*QUAKED weapon_blaster (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;840:*/
;841:	{
;842:		"weapon_blaster", 
;843:		"sound/weapons/w_pkup.wav",
;844:        { "models/weapons2/blaster_r/blaster_w.glm", 
;845:		0, 0, 0},
;846:/* view */		"models/weapons2/blaster_r/blaster.md3", 
;847:/* icon */		"gfx/hud/w_icon_blaster",
;848:/* pickup *///	"E11 Blaster Rifle",
;849:		100,
;850:		IT_WEAPON,
;851:		WP_BLASTER,
;852:/* precache */ "",
;853:/* sounds */ ""
;854:	},
;855:
;856:/*QUAKED weapon_disruptor (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;857:*/
;858:	{
;859:		"weapon_disruptor",
;860:		"sound/weapons/w_pkup.wav",
;861:        { "models/weapons2/disruptor/disruptor_w.glm", 
;862:		0, 0, 0},
;863:/* view */		"models/weapons2/disruptor/disruptor.md3", 
;864:/* icon */		"gfx/hud/w_icon_disruptor",
;865:/* pickup *///	"Tenloss Disruptor Rifle",
;866:		100,
;867:		IT_WEAPON,
;868:		WP_DISRUPTOR,
;869:/* precache */ "",
;870:/* sounds */ ""
;871:	},
;872:
;873:/*QUAKED weapon_bowcaster (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;874:*/
;875:	{
;876:		"weapon_bowcaster",
;877:		"sound/weapons/w_pkup.wav",
;878:        { "models/weapons2/bowcaster/bowcaster_w.glm", 
;879:		0, 0, 0},
;880:/* view */		"models/weapons2/bowcaster/bowcaster.md3", 
;881:/* icon */		"gfx/hud/w_icon_bowcaster",
;882:/* pickup *///	"Wookiee Bowcaster",
;883:		100,
;884:		IT_WEAPON,
;885:		WP_BOWCASTER,
;886:/* precache */ "",
;887:/* sounds */ ""
;888:	},
;889:
;890:/*QUAKED weapon_repeater (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;891:*/
;892:	{
;893:		"weapon_repeater", 
;894:		"sound/weapons/w_pkup.wav",
;895:        { "models/weapons2/heavy_repeater/heavy_repeater_w.glm", 
;896:		0, 0, 0},
;897:/* view */		"models/weapons2/heavy_repeater/heavy_repeater.md3", 
;898:/* icon */		"gfx/hud/w_icon_repeater",
;899:/* pickup *///	"Imperial Heavy Repeater",
;900:		100,
;901:		IT_WEAPON,
;902:		WP_REPEATER,
;903:/* precache */ "",
;904:/* sounds */ ""
;905:	},
;906:
;907:/*QUAKED weapon_demp2 (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;908:NOTENOTE This weapon is not yet complete.  Don't place it.
;909:*/
;910:	{
;911:		"weapon_demp2", 
;912:		"sound/weapons/w_pkup.wav",
;913:        { "models/weapons2/demp2/demp2_w.glm", 
;914:		0, 0, 0},
;915:/* view */		"models/weapons2/demp2/demp2.md3", 
;916:/* icon */		"gfx/hud/w_icon_demp2",
;917:/* pickup *///	"DEMP2",
;918:		100,
;919:		IT_WEAPON,
;920:		WP_DEMP2,
;921:/* precache */ "",
;922:/* sounds */ ""
;923:	},
;924:
;925:/*QUAKED weapon_flechette (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;926:*/
;927:	{
;928:		"weapon_flechette", 
;929:		"sound/weapons/w_pkup.wav",
;930:        { "models/weapons2/golan_arms/golan_arms_w.glm", 
;931:		0, 0, 0},
;932:/* view */		"models/weapons2/golan_arms/golan_arms.md3", 
;933:/* icon */		"gfx/hud/w_icon_flechette",
;934:/* pickup *///	"Golan Arms Flechette",
;935:		100,
;936:		IT_WEAPON,
;937:		WP_FLECHETTE,
;938:/* precache */ "",
;939:/* sounds */ ""
;940:	},
;941:
;942:/*QUAKED weapon_rocket_launcher (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;943:*/
;944:	{
;945:		"weapon_rocket_launcher",
;946:		"sound/weapons/w_pkup.wav",
;947:        { "models/weapons2/merr_sonn/merr_sonn_w.glm", 
;948:		0, 0, 0},
;949:/* view */		"models/weapons2/merr_sonn/merr_sonn.md3", 
;950:/* icon */		"gfx/hud/w_icon_merrsonn",
;951:/* pickup *///	"Merr-Sonn Missile System",
;952:		3,
;953:		IT_WEAPON,
;954:		WP_ROCKET_LAUNCHER,
;955:/* precache */ "",
;956:/* sounds */ ""
;957:	},
;958:
;959:/*QUAKED ammo_thermal (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;960:*/
;961:	{
;962:		"ammo_thermal",
;963:		"sound/weapons/w_pkup.wav",
;964:        { "models/weapons2/thermal/thermal_pu.md3", 
;965:		"models/weapons2/thermal/thermal_w.glm", 0, 0},
;966:/* view */		"models/weapons2/thermal/thermal.md3", 
;967:/* icon */		"gfx/hud/w_icon_thermal",
;968:/* pickup *///	"Thermal Detonators",
;969:		4,
;970:		IT_AMMO,
;971:		AMMO_THERMAL,
;972:/* precache */ "",
;973:/* sounds */ ""
;974:	},
;975:
;976:/*QUAKED ammo_tripmine (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;977:*/
;978:	{
;979:		"ammo_tripmine", 
;980:		"sound/weapons/w_pkup.wav",
;981:        { "models/weapons2/laser_trap/laser_trap_pu.md3", 
;982:		"models/weapons2/laser_trap/laser_trap_w.glm", 0, 0},
;983:/* view */		"models/weapons2/laser_trap/laser_trap.md3", 
;984:/* icon */		"gfx/hud/w_icon_tripmine",
;985:/* pickup *///	"Trip Mines",
;986:		3,
;987:		IT_AMMO,
;988:		AMMO_TRIPMINE,
;989:/* precache */ "",
;990:/* sounds */ ""
;991:	},
;992:
;993:/*QUAKED ammo_detpack (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;994:*/
;995:	{
;996:		"ammo_detpack", 
;997:		"sound/weapons/w_pkup.wav",
;998:        { "models/weapons2/detpack/det_pack_pu.md3", "models/weapons2/detpack/det_pack_proj.glm", "models/weapons2/detpack/det_pack_w.glm", 0},
;999:/* view */		"models/weapons2/detpack/det_pack.md3", 
;1000:/* icon */		"gfx/hud/w_icon_detpack",
;1001:/* pickup *///	"Det Packs",
;1002:		3,
;1003:		IT_AMMO,
;1004:		AMMO_DETPACK,
;1005:/* precache */ "",
;1006:/* sounds */ ""
;1007:	},
;1008:
;1009:/*QUAKED weapon_thermal (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1010:*/
;1011:	{
;1012:		"weapon_thermal",
;1013:		"sound/weapons/w_pkup.wav",
;1014:        { "models/weapons2/thermal/thermal_w.glm", "models/weapons2/thermal/thermal_pu.md3",
;1015:		0, 0 },
;1016:/* view */		"models/weapons2/thermal/thermal.md3", 
;1017:/* icon */		"gfx/hud/w_icon_thermal",
;1018:/* pickup *///	"Thermal Detonator",
;1019:		4,
;1020:		IT_WEAPON,
;1021:		WP_THERMAL,
;1022:/* precache */ "",
;1023:/* sounds */ ""
;1024:	},
;1025:
;1026:/*QUAKED weapon_trip_mine (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1027:*/
;1028:	{
;1029:		"weapon_trip_mine", 
;1030:		"sound/weapons/w_pkup.wav",
;1031:        { "models/weapons2/laser_trap/laser_trap_w.glm", "models/weapons2/laser_trap/laser_trap_pu.md3",
;1032:		0, 0},
;1033:/* view */		"models/weapons2/laser_trap/laser_trap.md3", 
;1034:/* icon */		"gfx/hud/w_icon_tripmine",
;1035:/* pickup *///	"Trip Mine",
;1036:		3,
;1037:		IT_WEAPON,
;1038:		WP_TRIP_MINE,
;1039:/* precache */ "",
;1040:/* sounds */ ""
;1041:	},
;1042:
;1043:/*QUAKED weapon_det_pack (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1044:*/
;1045:	{
;1046:		"weapon_det_pack", 
;1047:		"sound/weapons/w_pkup.wav",
;1048:        { "models/weapons2/detpack/det_pack_proj.glm", "models/weapons2/detpack/det_pack_pu.md3", "models/weapons2/detpack/det_pack_w.glm", 0},
;1049:/* view */		"models/weapons2/detpack/det_pack.md3", 
;1050:/* icon */		"gfx/hud/w_icon_detpack",
;1051:/* pickup *///	"Det Pack",
;1052:		3,
;1053:		IT_WEAPON,
;1054:		WP_DET_PACK,
;1055:/* precache */ "",
;1056:/* sounds */ ""
;1057:	},
;1058:
;1059:/*QUAKED weapon_emplaced (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1060:*/
;1061:	{
;1062:		"weapon_emplaced", 
;1063:		"sound/weapons/w_pkup.wav",
;1064:        { "models/weapons2/blaster_r/blaster_w.glm", 
;1065:		0, 0, 0},
;1066:/* view */		"models/weapons2/blaster_r/blaster.md3", 
;1067:/* icon */		"gfx/hud/w_icon_blaster",
;1068:/* pickup *///	"Emplaced Gun",
;1069:		50,
;1070:		IT_WEAPON,
;1071:		WP_EMPLACED_GUN,
;1072:/* precache */ "",
;1073:/* sounds */ ""
;1074:	},
;1075:
;1076:
;1077://NOTE: This is to keep things from messing up because the turret weapon type isn't real
;1078:	{
;1079:		"weapon_turretwp", 
;1080:		"sound/weapons/w_pkup.wav",
;1081:        { "models/weapons2/blaster_r/blaster_w.glm", 
;1082:		0, 0, 0},
;1083:/* view */		"models/weapons2/blaster_r/blaster.md3", 
;1084:/* icon */		"gfx/hud/w_icon_blaster",
;1085:/* pickup *///	"Turret Gun",
;1086:		50,
;1087:		IT_WEAPON,
;1088:		WP_TURRET,
;1089:/* precache */ "",
;1090:/* sounds */ ""
;1091:	},
;1092:
;1093:	//
;1094:	// AMMO ITEMS
;1095:	//
;1096:
;1097:/*QUAKED ammo_force (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1098:Don't place this
;1099:*/
;1100:	{
;1101:		"ammo_force",
;1102:		"sound/player/pickupenergy.wav",
;1103:        { "models/items/energy_cell.md3", 
;1104:		0, 0, 0},
;1105:/* view */		NULL,			
;1106:/* icon */		"gfx/hud/w_icon_blaster",
;1107:/* pickup *///	"Force??",
;1108:		100,
;1109:		IT_AMMO,
;1110:		AMMO_FORCE,
;1111:/* precache */ "",
;1112:/* sounds */ ""
;1113:	},
;1114:
;1115:/*QUAKED ammo_blaster (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1116:Ammo for the Bryar and Blaster pistols.
;1117:*/
;1118:	{
;1119:		"ammo_blaster",
;1120:		"sound/player/pickupenergy.wav",
;1121:        { "models/items/energy_cell.md3", 
;1122:		0, 0, 0},
;1123:/* view */		NULL,			
;1124:/* icon */		"gfx/hud/i_icon_battery",
;1125:/* pickup *///	"Blaster Pack",
;1126:		100,
;1127:		IT_AMMO,
;1128:		AMMO_BLASTER,
;1129:/* precache */ "",
;1130:/* sounds */ ""
;1131:	},
;1132:
;1133:/*QUAKED ammo_powercell (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1134:Ammo for Tenloss Disruptor, Wookie Bowcaster, and the Destructive Electro Magnetic Pulse (demp2 ) guns
;1135:*/
;1136:	{
;1137:		"ammo_powercell",
;1138:		"sound/player/pickupenergy.wav",
;1139:        { "models/items/power_cell.md3", 
;1140:		0, 0, 0},
;1141:/* view */		NULL,			
;1142:/* icon */		"gfx/mp/ammo_power_cell",
;1143:/* pickup *///	"Power Cell",
;1144:		100,
;1145:		IT_AMMO,
;1146:		AMMO_POWERCELL,
;1147:/* precache */ "",
;1148:/* sounds */ ""
;1149:	},
;1150:
;1151:/*QUAKED ammo_metallic_bolts (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1152:Ammo for Imperial Heavy Repeater and the Golan Arms Flechette
;1153:*/
;1154:	{
;1155:		"ammo_metallic_bolts",
;1156:		"sound/player/pickupenergy.wav",
;1157:        { "models/items/metallic_bolts.md3", 
;1158:		0, 0, 0},
;1159:/* view */		NULL,			
;1160:/* icon */		"gfx/mp/ammo_metallic_bolts",
;1161:/* pickup *///	"Metallic Bolts",
;1162:		100,
;1163:		IT_AMMO,
;1164:		AMMO_METAL_BOLTS,
;1165:/* precache */ "",
;1166:/* sounds */ ""
;1167:	},
;1168:
;1169:/*QUAKED ammo_rockets (.3 .3 1) (-16 -16 -16) (16 16 16) suspended
;1170:Ammo for Merr-Sonn portable missile launcher
;1171:*/
;1172:	{
;1173:		"ammo_rockets",
;1174:		"sound/player/pickupenergy.wav",
;1175:        { "models/items/rockets.md3", 
;1176:		0, 0, 0},
;1177:/* view */		NULL,			
;1178:/* icon */		"gfx/mp/ammo_rockets",
;1179:/* pickup *///	"Rockets",
;1180:		3,
;1181:		IT_AMMO,
;1182:		AMMO_ROCKETS,
;1183:/* precache */ "",
;1184:/* sounds */ ""
;1185:	},
;1186:
;1187:
;1188:	//
;1189:	// POWERUP ITEMS
;1190:	//
;1191:/*QUAKED team_CTF_redflag (1 0 0) (-16 -16 -16) (16 16 16)
;1192:Only in CTF games
;1193:*/
;1194:	{
;1195:		"team_CTF_redflag",
;1196:		NULL,
;1197:        { "models/flags/r_flag.md3",
;1198:		"models/flags/r_flag_ysal.md3", 0, 0 },
;1199:/* view */		NULL,			
;1200:/* icon */		"gfx/hud/mpi_rflag",
;1201:/* pickup *///	"Red Flag",
;1202:		0,
;1203:		IT_TEAM,
;1204:		PW_REDFLAG,
;1205:/* precache */ "",
;1206:/* sounds */ ""
;1207:	},
;1208:
;1209:/*QUAKED team_CTF_blueflag (0 0 1) (-16 -16 -16) (16 16 16)
;1210:Only in CTF games
;1211:*/
;1212:	{
;1213:		"team_CTF_blueflag",
;1214:		NULL,
;1215:        { "models/flags/b_flag.md3",
;1216:		"models/flags/b_flag_ysal.md3", 0, 0 },
;1217:/* view */		NULL,			
;1218:/* icon */		"gfx/hud/mpi_bflag",
;1219:/* pickup *///	"Blue Flag",
;1220:		0,
;1221:		IT_TEAM,
;1222:		PW_BLUEFLAG,
;1223:/* precache */ "",
;1224:/* sounds */ ""
;1225:	},
;1226:
;1227:	//
;1228:	// PERSISTANT POWERUP ITEMS
;1229:	//
;1230:
;1231:	/*QUAKED team_CTF_neutralflag (0 0 1) (-16 -16 -16) (16 16 16)
;1232:Only in One Flag CTF games
;1233:*/
;1234:	{
;1235:		"team_CTF_neutralflag",
;1236:		NULL,
;1237:        { "models/flags/n_flag.md3",
;1238:		0, 0, 0 },
;1239:/* view */		NULL,			
;1240:/* icon */		"icons/iconf_neutral1",
;1241:/* pickup *///	"Neutral Flag",
;1242:		0,
;1243:		IT_TEAM,
;1244:		PW_NEUTRALFLAG,
;1245:/* precache */ "",
;1246:/* sounds */ ""
;1247:	},
;1248:
;1249:	{
;1250:		"item_redcube",
;1251:		"sound/player/pickupenergy.wav",
;1252:        { "models/powerups/orb/r_orb.md3",
;1253:		0, 0, 0 },
;1254:/* view */		NULL,			
;1255:/* icon */		"icons/iconh_rorb",
;1256:/* pickup *///	"Red Cube",
;1257:		0,
;1258:		IT_TEAM,
;1259:		0,
;1260:/* precache */ "",
;1261:/* sounds */ ""
;1262:	},
;1263:
;1264:	{
;1265:		"item_bluecube",
;1266:		"sound/player/pickupenergy.wav",
;1267:        { "models/powerups/orb/b_orb.md3",
;1268:		0, 0, 0 },
;1269:/* view */		NULL,			
;1270:/* icon */		"icons/iconh_borb",
;1271:/* pickup *///	"Blue Cube",
;1272:		0,
;1273:		IT_TEAM,
;1274:		0,
;1275:/* precache */ "",
;1276:/* sounds */ ""
;1277:	},
;1278:
;1279:	// end of list marker
;1280:	{NULL}
;1281:};
;1282:
;1283:int		bg_numItems = sizeof(bg_itemlist) / sizeof(bg_itemlist[0]) - 1;
;1284:
;1285:float vectoyaw( const vec3_t vec ) {
line 1288
;1286:	float	yaw;
;1287:	
;1288:	if (vec[YAW] == 0 && vec[PITCH] == 0) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $424
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $424
line 1289
;1289:		yaw = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1290
;1290:	} else {
ADDRGP4 $425
JUMPV
LABELV $424
line 1291
;1291:		if (vec[PITCH]) {
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
EQF4 $426
line 1292
;1292:			yaw = ( atan2( vec[YAW], vec[PITCH]) * 180 / M_PI );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
INDIRP4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1127481344
ADDRLP4 16
INDIRF4
MULF4
CNSTF4 1078530011
DIVF4
ASGNF4
line 1293
;1293:		} else if (vec[YAW] > 0) {
ADDRGP4 $427
JUMPV
LABELV $426
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $428
line 1294
;1294:			yaw = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 1295
;1295:		} else {
ADDRGP4 $429
JUMPV
LABELV $428
line 1296
;1296:			yaw = 270;
ADDRLP4 0
CNSTF4 1132920832
ASGNF4
line 1297
;1297:		}
LABELV $429
LABELV $427
line 1298
;1298:		if (yaw < 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $430
line 1299
;1299:			yaw += 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 1300
;1300:		}
LABELV $430
line 1301
;1301:	}
LABELV $425
line 1303
;1302:
;1303:	return yaw;
ADDRLP4 0
INDIRF4
RETF4
LABELV $423
endproc vectoyaw 20 8
export BG_HasYsalamiri
proc BG_HasYsalamiri 8 0
line 1307
;1304:}
;1305:
;1306:qboolean BG_HasYsalamiri(int gametype, playerState_t *ps)
;1307:{
line 1308
;1308:	if (gametype == GT_CTY &&
ADDRFP4 0
INDIRI4
CNSTI4 8
NEI4 $433
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $435
ADDRLP4 0
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $433
LABELV $435
line 1310
;1309:		(ps->powerups[PW_REDFLAG] || ps->powerups[PW_BLUEFLAG]))
;1310:	{
line 1311
;1311:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $432
JUMPV
LABELV $433
line 1314
;1312:	}
;1313:
;1314:	if (ps->powerups[PW_YSALAMIRI])
ADDRFP4 4
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
CNSTI4 0
EQI4 $436
line 1315
;1315:	{
line 1316
;1316:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $432
JUMPV
LABELV $436
line 1319
;1317:	}
;1318:
;1319:	return qfalse;
CNSTI4 0
RETI4
LABELV $432
endproc BG_HasYsalamiri 8 0
export BG_CanUseFPNow
proc BG_CanUseFPNow 20 8
line 1323
;1320:}
;1321:
;1322:qboolean BG_CanUseFPNow(int gametype, playerState_t *ps, int time, forcePowers_t power)
;1323:{
line 1324
;1324:	if (BG_HasYsalamiri(gametype, ps))
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $439
line 1325
;1325:	{
line 1326
;1326:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $438
JUMPV
LABELV $439
line 1329
;1327:	}
;1328:
;1329:	if ( ps->forceRestricted || ps->trueNonJedi )
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $443
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $441
LABELV $443
line 1330
;1330:	{
line 1331
;1331:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $438
JUMPV
LABELV $441
line 1334
;1332:	}
;1333:
;1334:	if (ps->duelInProgress)
ADDRFP4 4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $444
line 1335
;1335:	{
line 1336
;1336:		if (power != FP_SABERATTACK && power != FP_SABERDEFEND && (jk2gameplay == VERSION_1_04 || power != FP_SABERTHROW) &&
ADDRLP4 12
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $446
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $446
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $448
ADDRLP4 12
INDIRI4
CNSTI4 17
EQI4 $446
LABELV $448
ADDRFP4 12
INDIRI4
CNSTI4 1
EQI4 $446
line 1338
;1337:			power != FP_LEVITATION)
;1338:		{
line 1339
;1339:			if (!ps->saberLockFrame || power != FP_PUSH)
ADDRFP4 4
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $451
ADDRFP4 12
INDIRI4
CNSTI4 3
EQI4 $449
LABELV $451
line 1340
;1340:			{
line 1341
;1341:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $438
JUMPV
LABELV $449
line 1343
;1342:			}
;1343:		}
LABELV $446
line 1344
;1344:	}
LABELV $444
line 1346
;1345:
;1346:	if (ps->saberLockFrame || ps->saberLockTime > time)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
NEI4 $454
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $452
LABELV $454
line 1347
;1347:	{
line 1348
;1348:		if (power != FP_PUSH)
ADDRFP4 12
INDIRI4
CNSTI4 3
EQI4 $455
line 1349
;1349:		{
line 1350
;1350:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $438
JUMPV
LABELV $455
line 1352
;1351:		}
;1352:	}
LABELV $452
line 1354
;1353:
;1354:	if (ps->fallingToDeath)
ADDRFP4 4
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $457
line 1355
;1355:	{
line 1356
;1356:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $438
JUMPV
LABELV $457
line 1359
;1357:	}
;1358:
;1359:	if ( power == FP_SABERTHROW && (ps->weaponstate == WEAPON_RAISING || ps->weaponstate == WEAPON_DROPPING) )
ADDRFP4 12
INDIRI4
CNSTI4 17
NEI4 $459
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $461
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $459
LABELV $461
line 1360
;1360:	{ // WP_SaberPositionUpdate doesn't handle saberthrow while in the above weaponstates. Instead the saber just flies away and never returns.
line 1362
;1361:	  // Changing WP_SaberPositionUpdate to handle saberthrow in those states would make it possible to throw the saber in situations it wasn't possible before, so instead we just disable throw in those weaponstates to prevent sabers from getting lost.
;1362:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $438
JUMPV
LABELV $459
line 1365
;1363:	}
;1364:
;1365:	return qtrue;
CNSTI4 1
RETI4
LABELV $438
endproc BG_CanUseFPNow 20 8
export BG_FindItemForPowerup
proc BG_FindItemForPowerup 8 0
line 1373
;1366:}
;1367:
;1368:/*
;1369:==============
;1370:BG_FindItemForPowerup
;1371:==============
;1372:*/
;1373:gitem_t	*BG_FindItemForPowerup( powerup_t pw ) {
line 1376
;1374:	int		i;
;1375:
;1376:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $466
JUMPV
LABELV $463
line 1377
;1377:		if ( (bg_itemlist[i].giType == IT_POWERUP || 
ADDRLP4 4
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 5
EQI4 $472
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $467
LABELV $472
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $467
line 1379
;1378:					bg_itemlist[i].giType == IT_TEAM) && 
;1379:			bg_itemlist[i].giTag == (int)pw ) {
line 1380
;1380:			return &bg_itemlist[i];
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
RETP4
ADDRGP4 $462
JUMPV
LABELV $467
line 1382
;1381:		}
;1382:	}
LABELV $464
line 1376
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $466
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $463
line 1384
;1383:
;1384:	return NULL;
CNSTP4 0
RETP4
LABELV $462
endproc BG_FindItemForPowerup 8 0
export BG_FindItemForHoldable
proc BG_FindItemForHoldable 8 8
line 1393
;1385:}
;1386:
;1387:
;1388:/*
;1389:==============
;1390:BG_FindItemForHoldable
;1391:==============
;1392:*/
;1393:gitem_t	*BG_FindItemForHoldable( holdable_t pw ) {
line 1396
;1394:	int		i;
;1395:
;1396:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $477
JUMPV
LABELV $474
line 1397
;1397:		if ( bg_itemlist[i].giType == IT_HOLDABLE && bg_itemlist[i].giTag == (int)pw ) {
ADDRLP4 4
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $478
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $478
line 1398
;1398:			return &bg_itemlist[i];
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
RETP4
ADDRGP4 $473
JUMPV
LABELV $478
line 1400
;1399:		}
;1400:	}
LABELV $475
line 1396
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $477
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $474
line 1402
;1401:
;1402:	Com_Error( ERR_DROP, "HoldableItem not found" );
CNSTI4 1
ARGI4
ADDRGP4 $482
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1404
;1403:
;1404:	return NULL;
CNSTP4 0
RETP4
LABELV $473
endproc BG_FindItemForHoldable 8 8
export BG_FindItemForWeapon
proc BG_FindItemForWeapon 8 12
line 1414
;1405:}
;1406:
;1407:
;1408:/*
;1409:===============
;1410:BG_FindItemForWeapon
;1411:
;1412:===============
;1413:*/
;1414:gitem_t	*BG_FindItemForWeapon( weapon_t weapon ) {
line 1417
;1415:	gitem_t	*it;
;1416:	
;1417:	for ( it = bg_itemlist + 1 ; it->classname ; it++) {
ADDRLP4 0
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $487
JUMPV
LABELV $484
line 1418
;1418:		if ( it->giType == IT_WEAPON && it->giTag == (int)weapon ) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $489
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $489
line 1419
;1419:			return it;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $483
JUMPV
LABELV $489
line 1421
;1420:		}
;1421:	}
LABELV $485
line 1417
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $487
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $484
line 1423
;1422:
;1423:	Com_Error( ERR_DROP, "Couldn't find item for weapon %i", weapon);
CNSTI4 1
ARGI4
ADDRGP4 $491
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 1424
;1424:	return NULL;
CNSTP4 0
RETP4
LABELV $483
endproc BG_FindItemForWeapon 8 12
export BG_FindItem
proc BG_FindItem 8 8
line 1433
;1425:}
;1426:
;1427:/*
;1428:===============
;1429:BG_FindItem
;1430:
;1431:===============
;1432:*/
;1433:gitem_t	*BG_FindItem( const char *classname ) {
line 1436
;1434:	gitem_t	*it;
;1435:	
;1436:	for ( it = bg_itemlist + 1 ; it->classname ; it++ ) {
ADDRLP4 0
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $496
JUMPV
LABELV $493
line 1437
;1437:		if ( !Q_stricmp( it->classname, classname) )
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $498
line 1438
;1438:			return it;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $492
JUMPV
LABELV $498
line 1439
;1439:	}
LABELV $494
line 1436
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $496
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $493
line 1441
;1440:
;1441:	return NULL;
CNSTP4 0
RETP4
LABELV $492
endproc BG_FindItem 8 8
export BG_PlayerTouchesItem
proc BG_PlayerTouchesItem 36 12
line 1452
;1442:}
;1443:
;1444:/*
;1445:============
;1446:BG_PlayerTouchesItem
;1447:
;1448:Items can be picked up without actually touching their physical bounds to make
;1449:grabbing them easier
;1450:============
;1451:*/
;1452:qboolean	BG_PlayerTouchesItem( playerState_t *ps, entityState_t *item, int atTime ) {
line 1455
;1453:	vec3_t		origin;
;1454:
;1455:	BG_EvaluateTrajectory( &item->pos, atTime, origin );
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1458
;1456:
;1457:	// we are ignoring ducked differences here
;1458:	if ( ps->origin[0] - origin[0] > 44
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 1110441984
GTF4 $511
ADDRLP4 16
INDIRF4
CNSTF4 3259498496
LTF4 $511
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
ADDRLP4 24
CNSTF4 1108344832
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ADDRLP4 24
INDIRF4
GTF4 $511
ADDRLP4 28
CNSTF4 3255828480
ASGNF4
ADDRLP4 20
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ADDRLP4 28
INDIRF4
LTF4 $511
ADDRLP4 32
ADDRLP4 12
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ADDRLP4 24
INDIRF4
GTF4 $511
ADDRLP4 32
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ADDRLP4 28
INDIRF4
GEF4 $501
LABELV $511
line 1463
;1459:		|| ps->origin[0] - origin[0] < -50
;1460:		|| ps->origin[1] - origin[1] > 36
;1461:		|| ps->origin[1] - origin[1] < -36
;1462:		|| ps->origin[2] - origin[2] > 36
;1463:		|| ps->origin[2] - origin[2] < -36 ) {
line 1464
;1464:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $500
JUMPV
LABELV $501
line 1467
;1465:	}
;1466:
;1467:	return qtrue;
CNSTI4 1
RETI4
LABELV $500
endproc BG_PlayerTouchesItem 36 12
export BG_ProperForceIndex
proc BG_ProperForceIndex 4 0
line 1471
;1468:}
;1469:
;1470:int BG_ProperForceIndex(int power)
;1471:{
line 1472
;1472:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $514
JUMPV
LABELV $513
line 1475
;1473:
;1474:	while (i < NUM_FORCE_POWERS)
;1475:	{
line 1476
;1476:		if (forcePowerSorted[i] == power)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $516
line 1477
;1477:		{
line 1478
;1478:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $512
JUMPV
LABELV $516
line 1481
;1479:		}
;1480:
;1481:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1482
;1482:	}
LABELV $514
line 1474
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $513
line 1484
;1483:
;1484:	return -1;
CNSTI4 -1
RETI4
LABELV $512
endproc BG_ProperForceIndex 4 0
export BG_CycleForce
proc BG_CycleForce 36 4
line 1488
;1485:}
;1486:
;1487:void BG_CycleForce(playerState_t *ps, int direction)
;1488:{
line 1489
;1489:	int i = ps->fd.forcePowerSelected;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
line 1490
;1490:	int x = i;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1491
;1491:	int presel = i;
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
line 1492
;1492:	int foundnext = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 1494
;1493:
;1494:	if ( x >= NUM_FORCE_POWERS || x == -1)
ADDRLP4 0
INDIRI4
CNSTI4 18
GEI4 $521
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $519
LABELV $521
line 1495
;1495:	{ //apparently we have no valid force powers
line 1496
;1496:		return;
ADDRGP4 $518
JUMPV
LABELV $519
line 1499
;1497:	}
;1498:
;1499:	x = BG_ProperForceIndex(x);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_ProperForceIndex
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 1500
;1500:	presel = x;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 1502
;1501:
;1502:	if (direction == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $522
line 1503
;1503:	{ //get the next power
line 1504
;1504:		x++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1505
;1505:	}
ADDRGP4 $523
JUMPV
LABELV $522
line 1507
;1506:	else
;1507:	{ //get the previous power
line 1508
;1508:		x--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1509
;1509:	}
LABELV $523
line 1511
;1510:
;1511:	if (x >= NUM_FORCE_POWERS)
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $524
line 1512
;1512:	{ //cycled off the end.. cycle around to the first
line 1513
;1513:		x = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1514
;1514:	}
LABELV $524
line 1515
;1515:	if (x < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $526
line 1516
;1516:	{ //cycled off the beginning.. cycle around to the last
line 1517
;1517:		x = NUM_FORCE_POWERS-1;
ADDRLP4 0
CNSTI4 17
ASGNI4
line 1518
;1518:	}
LABELV $526
line 1520
;1519:
;1520:	i = forcePowerSorted[x]; //the "sorted" value of this power
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $529
JUMPV
LABELV $528
line 1523
;1521:
;1522:	while (x != presel)
;1523:	{ //loop around to the current force power
line 1524
;1524:		if (ps->fd.forcePowersKnown & (1 << i) && i != ps->fd.forcePowerSelected)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $531
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
EQI4 $531
line 1525
;1525:		{ //we have the force power
line 1526
;1526:			if (i != FP_LEVITATION &&
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $533
ADDRLP4 4
INDIRI4
CNSTI4 15
EQI4 $533
ADDRLP4 4
INDIRI4
CNSTI4 16
EQI4 $533
ADDRLP4 4
INDIRI4
CNSTI4 17
EQI4 $533
line 1530
;1527:				i != FP_SABERATTACK &&
;1528:				i != FP_SABERDEFEND &&
;1529:				i != FP_SABERTHROW)
;1530:			{ //it's selectable
line 1531
;1531:				foundnext = i;
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
line 1532
;1532:				break;
ADDRGP4 $530
JUMPV
LABELV $533
line 1534
;1533:			}
;1534:		}
LABELV $531
line 1536
;1535:
;1536:		if (direction == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $535
line 1537
;1537:		{ //next
line 1538
;1538:			x++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1539
;1539:		}
ADDRGP4 $536
JUMPV
LABELV $535
line 1541
;1540:		else
;1541:		{ //previous
line 1542
;1542:			x--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1543
;1543:		}
LABELV $536
line 1545
;1544:	
;1545:		if (x >= NUM_FORCE_POWERS)
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $537
line 1546
;1546:		{ //loop around
line 1547
;1547:			x = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1548
;1548:		}
LABELV $537
line 1549
;1549:		if (x < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $539
line 1550
;1550:		{ //loop around
line 1551
;1551:			x = NUM_FORCE_POWERS-1;
ADDRLP4 0
CNSTI4 17
ASGNI4
line 1552
;1552:		}
LABELV $539
line 1554
;1553:
;1554:		i = forcePowerSorted[x]; //set to the sorted value again
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerSorted
ADDP4
INDIRI4
ASGNI4
line 1555
;1555:	}
LABELV $529
line 1522
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $528
LABELV $530
line 1557
;1556:
;1557:	if (foundnext != -1)
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $541
line 1558
;1558:	{ //found one, select it
line 1559
;1559:		ps->fd.forcePowerSelected = foundnext;
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1560
;1560:	}
LABELV $541
line 1561
;1561:}
LABELV $518
endproc BG_CycleForce 36 4
export BG_GetItemIndexByTag
proc BG_GetItemIndexByTag 8 0
line 1564
;1562:
;1563:int BG_GetItemIndexByTag(int tag, itemType_t type)
;1564:{ //Get the itemlist index from the tag and type
line 1565
;1565:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $545
JUMPV
LABELV $544
line 1568
;1566:
;1567:	while (i < bg_numItems)
;1568:	{
line 1569
;1569:		if (bg_itemlist[i].giTag == tag &&
ADDRLP4 4
CNSTI4 52
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $547
ADDRLP4 4
INDIRI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $547
line 1571
;1570:			bg_itemlist[i].giType == type)
;1571:		{
line 1572
;1572:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $543
JUMPV
LABELV $547
line 1575
;1573:		}
;1574:
;1575:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1576
;1576:	}
LABELV $545
line 1567
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $544
line 1578
;1577:
;1578:	return 0;
CNSTI4 0
RETI4
LABELV $543
endproc BG_GetItemIndexByTag 8 0
export BG_CycleInven
proc BG_CycleInven 12 8
line 1582
;1579:}
;1580:
;1581:void BG_CycleInven(playerState_t *ps, int direction)
;1582:{
line 1586
;1583:	int i;
;1584:	int original;
;1585:
;1586:	i = bg_itemlist[ps->stats[STAT_HOLDABLE_ITEM]].giTag;
ADDRLP4 0
CNSTI4 52
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 1587
;1587:	original = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 1589
;1588:
;1589:	if (direction == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $553
line 1590
;1590:	{ //next
line 1591
;1591:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1592
;1592:	}
ADDRGP4 $556
JUMPV
LABELV $553
line 1594
;1593:	else
;1594:	{ //previous
line 1595
;1595:		i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1596
;1596:	}
ADDRGP4 $556
JUMPV
LABELV $555
line 1599
;1597:
;1598:	while (i != original)
;1599:	{ //go in a full loop until hitting something, if hit nothing then select nothing
line 1600
;1600:		if (ps->stats[STAT_HOLDABLE_ITEMS] & (1 << i))
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $558
line 1601
;1601:		{ //we have it, select it.
line 1602
;1602:			ps->stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(i, IT_HOLDABLE);
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1603
;1603:			break;
ADDRGP4 $557
JUMPV
LABELV $558
line 1606
;1604:		}
;1605:
;1606:		if (direction == 1)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $560
line 1607
;1607:		{ //next
line 1608
;1608:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1609
;1609:		}
ADDRGP4 $561
JUMPV
LABELV $560
line 1611
;1610:		else
;1611:		{ //previous
line 1612
;1612:			i--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1613
;1613:		}
LABELV $561
line 1615
;1614:
;1615:		if (i < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $562
line 1616
;1616:		{ //wrap around to the last
line 1617
;1617:			i = HI_NUM_HOLDABLE;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 1618
;1618:		}
ADDRGP4 $563
JUMPV
LABELV $562
line 1619
;1619:		else if (i >= HI_NUM_HOLDABLE)
ADDRLP4 0
INDIRI4
CNSTI4 7
LTI4 $564
line 1620
;1620:		{ //wrap around to the first
line 1621
;1621:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1622
;1622:		}
LABELV $564
LABELV $563
line 1623
;1623:	}
LABELV $556
line 1598
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $555
LABELV $557
line 1624
;1624:}
LABELV $551
endproc BG_CycleInven 12 8
export BG_CanItemBeGrabbed
proc BG_CanItemBeGrabbed 56 8
line 1634
;1625:
;1626:/*
;1627:================
;1628:BG_CanItemBeGrabbed
;1629:
;1630:Returns false if the item should not be picked up.
;1631:This needs to be the same for client side prediction and server use.
;1632:================
;1633:*/
;1634:qboolean BG_CanItemBeGrabbed( int gametype, const entityState_t *ent, const playerState_t *ps, int playerMode) {
line 1637
;1635:	gitem_t	*item;
;1636:
;1637:	if ( ent->modelindex < 1 || ent->modelindex >= bg_numItems ) {
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $569
ADDRLP4 4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $567
LABELV $569
line 1638
;1638:		Com_Error( ERR_DROP, "BG_CanItemBeGrabbed: index out of range" );
CNSTI4 1
ARGI4
ADDRGP4 $570
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1639
;1639:	}
LABELV $567
line 1641
;1640:
;1641:	item = &bg_itemlist[ent->modelindex];
ADDRLP4 0
CNSTI4 52
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 1643
;1642:
;1643:	if ( ps )
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $571
line 1644
;1644:	{
line 1645
;1645:		if ( ps->trueJedi )
ADDRFP4 8
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $573
line 1646
;1646:		{//force powers and saber only
line 1647
;1647:			if ( item->giType != IT_TEAM //not a flag
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 8
EQI4 $574
ADDRLP4 12
INDIRI4
CNSTI4 3
EQI4 $574
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $577
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $574
LABELV $577
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $578
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
EQI4 $574
LABELV $578
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $579
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 15
NEI4 $574
LABELV $579
line 1652
;1648:				&& item->giType != IT_ARMOR//not shields
;1649:				&& (item->giType != IT_WEAPON || item->giTag != WP_SABER)//not a saber
;1650:				&& (item->giType != IT_HOLDABLE || item->giTag != HI_SEEKER)//not a seeker
;1651:				&& (item->giType != IT_POWERUP || item->giTag == PW_YSALAMIRI) )//not a force pick-up
;1652:			{
line 1653
;1653:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
line 1655
;1654:			}
;1655:		}
LABELV $573
line 1656
;1656:		else if ( ps->trueNonJedi )
ADDRFP4 8
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
EQI4 $580
line 1657
;1657:		{//can't pick up force powerups
line 1658
;1658:			if ( (item->giType == IT_POWERUP && item->giTag != PW_YSALAMIRI) //if a powerup, can only can pick up ysalamiri
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $585
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 15
NEI4 $586
LABELV $585
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $587
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
EQI4 $586
LABELV $587
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $582
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
NEI4 $582
LABELV $586
line 1661
;1659:				|| (item->giType == IT_HOLDABLE && item->giTag == HI_SEEKER)//if holdable, cannot pick up seeker 
;1660:				|| (item->giType == IT_WEAPON && item->giTag == WP_SABER ) )//or if it's a saber
;1661:			{
line 1662
;1662:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $582
line 1664
;1663:			}
;1664:		}
LABELV $580
LABELV $574
line 1665
;1665:		if ( ps->isJediMaster && item && (item->giType == IT_WEAPON || item->giType == IT_AMMO))
ADDRFP4 8
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $588
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $588
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $590
ADDRLP4 12
INDIRI4
CNSTI4 2
NEI4 $588
LABELV $590
line 1666
;1666:		{//jedi master cannot pick up weapons
line 1667
;1667:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $588
line 1669
;1668:		}
;1669:		if ( ps->duelInProgress )
ADDRFP4 8
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $591
line 1670
;1670:		{ //no picking stuff up while in a duel, no matter what the type is
line 1671
;1671:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $591
line 1674
;1672:		}
;1673:
;1674:		if (ps->stats[STAT_RACEMODE] && item && (item->giType != IT_POWERUP || /*(item->giTag != PW_YSALAMIRI) &&*/ (item->giTag != PW_FORCE_BOON))) // no picking up shit in racemode? disallow ysal again for now ... we handle ysal via jumplevel. if a map truly should need it ... we'll think of sth
ADDRFP4 8
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $572
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $572
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $595
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 14
EQI4 $572
LABELV $595
line 1675
;1675:		{//Maybe allow spawnflags 2 to be racemode_only ?
line 1676
;1676:			if (/*(ps->stats[STAT_RUNFLAGS] & RFL_LAVAPROTECT) ||*/ item->giType != IT_ARMOR && item->giType != IT_HEALTH && (item->giType != IT_HOLDABLE || (item->giTag != HI_MEDPAC))) { // when we dont have "godmode" (protection from lava,slime,drowning), let us pick up health/armor/medpack
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 3
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $572
ADDRLP4 24
INDIRI4
CNSTI4 4
EQI4 $572
ADDRLP4 24
INDIRI4
CNSTI4 6
NEI4 $598
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $572
LABELV $598
line 1678
;1677:				// edit: just allow always and for racemode we adjust on a per player basis whether its active
;1678:				return qfalse; 
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
line 1680
;1679:			}
;1680:		}
line 1681
;1681:	}
LABELV $571
line 1683
;1682:	else
;1683:	{//safety return since below code assumes a non-null ps
line 1684
;1684:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $572
line 1687
;1685:	}
;1686:
;1687:	switch( item->giType ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $600
ADDRLP4 8
INDIRI4
CNSTI4 8
GTI4 $600
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $663
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $663
address $661
address $602
address $612
address $615
address $618
address $628
address $658
address $600
address $638
code
LABELV $602
line 1689
;1688:	case IT_WEAPON:
;1689:		if (ent->generic1 == ps->clientNum && ent->powerups)
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $603
ADDRLP4 16
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CNSTI4 0
EQI4 $603
line 1690
;1690:		{
line 1691
;1691:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $603
line 1693
;1692:		}
;1693:		if (!(ent->eFlags & EF_DROPPEDWEAPON) && (ps->stats[STAT_WEAPONS] & (1 << item->giTag)) &&
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $605
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 24
INDIRI4
LSHI4
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $605
ADDRLP4 24
INDIRI4
CNSTI4 11
EQI4 $605
ADDRLP4 24
INDIRI4
CNSTI4 12
EQI4 $605
ADDRLP4 24
INDIRI4
CNSTI4 13
EQI4 $605
line 1695
;1694:			item->giTag != WP_THERMAL && item->giTag != WP_TRIP_MINE && item->giTag != WP_DET_PACK)
;1695:		{ //weaponstay stuff.. if this isn't dropped, and you already have it, you don't get it.
line 1696
;1696:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $605
line 1698
;1697:		}
;1698:		if (playerMode > MODE_DEFRAG) {
ADDRFP4 12
INDIRI4
CNSTI4 2
LEI4 $607
line 1699
;1699:			if (playerMode != MODE_IRONMAN || item->giTag != WP_TRIP_MINE && item->giTag != WP_TURRET && item->giTag != WP_EMPLACED_GUN) {
ADDRFP4 12
INDIRI4
CNSTI4 5
NEI4 $611
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 12
EQI4 $609
ADDRLP4 28
INDIRI4
CNSTI4 15
EQI4 $609
ADDRLP4 28
INDIRI4
CNSTI4 14
EQI4 $609
LABELV $611
line 1700
;1700:				return qfalse; // in ironman mode we can pick up mines and turrets (and emplaced gun? what even is that?). just going by the default ctf configs with weapondisable
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $609
line 1702
;1701:			}
;1702:		}
LABELV $607
line 1703
;1703:		return qtrue;	// weapons are always picked up
CNSTI4 1
RETI4
ADDRGP4 $566
JUMPV
LABELV $612
line 1706
;1704:
;1705:	case IT_AMMO:
;1706:		if ( ps->ammo[item->giTag] >= ammoData[item->giTag].max) {
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
ADDRGP4 ammoData
ADDP4
INDIRI4
LTI4 $613
line 1707
;1707:			return qfalse;		// can't hold any more
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $613
line 1709
;1708:		}
;1709:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $566
JUMPV
LABELV $615
line 1712
;1710:
;1711:	case IT_ARMOR:
;1712:		if ( ps->stats[STAT_ARMOR] >= ps->stats[STAT_MAX_HEALTH] * item->giTag ) {
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
MULI4
LTI4 $616
line 1713
;1713:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $616
line 1715
;1714:		}
;1715:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $566
JUMPV
LABELV $618
line 1720
;1716:
;1717:	case IT_HEALTH:
;1718:		// small and mega healths will go over the max, otherwise
;1719:		// don't pick up if already at max
;1720:		if ((ps->fd.forcePowersActive & (1 << FP_RAGE)))
ADDRFP4 8
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $619
line 1721
;1721:		{
line 1722
;1722:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $619
line 1725
;1723:		}
;1724:
;1725:		if ( item->quantity == 5 || item->quantity == 100 ) {
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 5
EQI4 $623
ADDRLP4 36
INDIRI4
CNSTI4 100
NEI4 $621
LABELV $623
line 1726
;1726:			if ( ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH] * 2 ) {
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LTI4 $624
line 1727
;1727:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $624
line 1729
;1728:			}
;1729:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $566
JUMPV
LABELV $621
line 1732
;1730:		}
;1731:
;1732:		if ( ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH] ) {
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LTI4 $626
line 1733
;1733:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $626
line 1735
;1734:		}
;1735:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $566
JUMPV
LABELV $628
line 1738
;1736:
;1737:	case IT_POWERUP:
;1738:		if (ps && (ps->powerups[PW_YSALAMIRI]))
ADDRLP4 44
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $629
ADDRLP4 44
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
CNSTI4 0
EQI4 $629
line 1739
;1739:		{
line 1740
;1740:			if (item->giTag != PW_YSALAMIRI)
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 15
EQI4 $631
line 1741
;1741:			{
line 1742
;1742:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $631
line 1744
;1743:			}
;1744:		}
LABELV $629
line 1745
;1745:		if (playerMode > MODE_DEFRAG) {
ADDRFP4 12
INDIRI4
CNSTI4 2
LEI4 $633
line 1746
;1746:			if (playerMode != MODE_IRONMAN || item->giTag != PW_REDFLAG && item->giTag != PW_BLUEFLAG && item->giTag != PW_NEUTRALFLAG) { // wait, ... flags arent even IT_POWERUP are they? lol
ADDRLP4 48
CNSTI4 5
ASGNI4
ADDRFP4 12
INDIRI4
ADDRLP4 48
INDIRI4
NEI4 $637
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 4
EQI4 $635
ADDRLP4 52
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $635
ADDRLP4 52
INDIRI4
CNSTI4 6
EQI4 $635
LABELV $637
line 1747
;1747:				return qfalse; // in ironman mode we can pick up flags. but nothing else. and other modes outside of normal we cant pick up anything
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $635
line 1749
;1748:			}
;1749:		}
LABELV $633
line 1750
;1750:		return qtrue;	// powerups are always picked up
CNSTI4 1
RETI4
ADDRGP4 $566
JUMPV
LABELV $638
line 1753
;1751:
;1752:	case IT_TEAM: // team items, such as flags
;1753:		if( (gametype == GT_CTF || gametype == GT_CTY) && playerMode == MODE_NORMAL ) {
ADDRLP4 48
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 7
EQI4 $641
ADDRLP4 48
INDIRI4
CNSTI4 8
NEI4 $639
LABELV $641
ADDRFP4 12
INDIRI4
CNSTI4 1
NEI4 $639
line 1757
;1754:			// ent->modelindex2 is non-zero on items if they are dropped
;1755:			// we need to know this because we can pick up our dropped flag (and return it)
;1756:			// but we can't pick up our flag at base
;1757:			if (ps->persistant[PERS_TEAM] == TEAM_RED) {
ADDRFP4 8
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 1
NEI4 $642
line 1758
;1758:				if (item->giTag == PW_BLUEFLAG ||
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 5
EQI4 $647
ADDRLP4 52
INDIRI4
CNSTI4 4
NEI4 $648
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $647
LABELV $648
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 4
NEI4 $640
ADDRFP4 8
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $640
LABELV $647
line 1761
;1759:					(item->giTag == PW_REDFLAG && ent->modelindex2) ||
;1760:					(item->giTag == PW_REDFLAG && ps->powerups[PW_BLUEFLAG]) )
;1761:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $566
JUMPV
line 1762
;1762:			} else if (ps->persistant[PERS_TEAM] == TEAM_BLUE) {
LABELV $642
ADDRFP4 8
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 2
NEI4 $640
line 1763
;1763:				if (item->giTag == PW_REDFLAG ||
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 4
EQI4 $654
ADDRLP4 52
INDIRI4
CNSTI4 5
NEI4 $655
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $654
LABELV $655
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $640
ADDRFP4 8
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $640
LABELV $654
line 1766
;1764:					(item->giTag == PW_BLUEFLAG && ent->modelindex2) ||
;1765:					(item->giTag == PW_BLUEFLAG && ps->powerups[PW_REDFLAG]) )
;1766:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $566
JUMPV
line 1767
;1767:			}
line 1768
;1768:		}
LABELV $639
line 1769
;1769:		else if (playerMode == MODE_IRONMAN && ent->modelindex2) { // allow us to "return" the flag
ADDRFP4 12
INDIRI4
CNSTI4 5
NEI4 $656
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $656
line 1770
;1770:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $566
JUMPV
LABELV $656
LABELV $640
line 1773
;1771:		}
;1772:
;1773:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $658
line 1776
;1774:
;1775:	case IT_HOLDABLE:
;1776:		if ( ps->stats[STAT_HOLDABLE_ITEMS] & (1 << item->giTag))
ADDRFP4 8
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $659
line 1777
;1777:		{
line 1778
;1778:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $566
JUMPV
LABELV $659
line 1780
;1779:		}
;1780:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $566
JUMPV
LABELV $661
line 1783
;1781:
;1782:        case IT_BAD:
;1783:            Com_Error( ERR_DROP, "BG_CanItemBeGrabbed: IT_BAD" );
CNSTI4 1
ARGI4
ADDRGP4 $662
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1790
;1784:        default:
;1785:#ifndef Q3_VM
;1786:#ifndef NDEBUG // bk0001204
;1787:          Com_Printf("BG_CanItemBeGrabbed: unknown enum %d\n", item->giType );
;1788:#endif
;1789:#endif
;1790:         break;
LABELV $600
line 1793
;1791:	}
;1792:
;1793:	return qfalse;
CNSTI4 0
RETI4
LABELV $566
endproc BG_CanItemBeGrabbed 56 8
export BG_EvaluateTrajectory
proc BG_EvaluateTrajectory 84 12
line 1804
;1794:}
;1795:
;1796://======================================================================
;1797:
;1798:/*
;1799:================
;1800:BG_EvaluateTrajectory
;1801:
;1802:================
;1803:*/
;1804:void BG_EvaluateTrajectory( const trajectory_t *tr, int atTime, vec3_t result ) {
line 1808
;1805:	float		deltaTime;
;1806:	float		phase;
;1807:
;1808:	switch( tr->trType ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $665
ADDRLP4 8
INDIRI4
CNSTI4 5
GTI4 $665
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $678
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $678
address $668
address $668
address $669
address $671
address $670
address $676
code
LABELV $668
line 1811
;1809:	case TR_STATIONARY:
;1810:	case TR_INTERPOLATE:
;1811:		VectorCopy( tr->trBase, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1812
;1812:		break;
ADDRGP4 $666
JUMPV
LABELV $669
line 1814
;1813:	case TR_LINEAR:
;1814:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1815
;1815:		VectorMA( tr->trBase, deltaTime, tr->trDelta, result );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1816
;1816:		break;
ADDRGP4 $666
JUMPV
LABELV $670
line 1818
;1817:	case TR_SINE:
;1818:		deltaTime = ( atTime - tr->trTime ) / (float) tr->trDuration;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1819
;1819:		phase = sin( deltaTime * M_PI * 2 );
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 0
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 32
INDIRF4
ASGNF4
line 1820
;1820:		VectorMA( tr->trBase, phase, tr->trDelta, result );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1821
;1821:		break;
ADDRGP4 $666
JUMPV
LABELV $671
line 1823
;1822:	case TR_LINEAR_STOP:
;1823:		if ( atTime > tr->trTime + tr->trDuration ) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
LEI4 $672
line 1824
;1824:			atTime = tr->trTime + tr->trDuration;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1825
;1825:		}
LABELV $672
line 1826
;1826:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1827
;1827:		if ( deltaTime < 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $674
line 1828
;1828:			deltaTime = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1829
;1829:		}
LABELV $674
line 1830
;1830:		VectorMA( tr->trBase, deltaTime, tr->trDelta, result );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1831
;1831:		break;
ADDRGP4 $666
JUMPV
LABELV $676
line 1833
;1832:	case TR_GRAVITY:
;1833:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 0
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1834
;1834:		VectorMA( tr->trBase, deltaTime, tr->trDelta, result );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
ADDRLP4 64
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1835
;1835:		result[2] -= 0.5 * DEFAULT_GRAVITY * deltaTime * deltaTime;		// FIXME: local gravity...
ADDRLP4 76
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 80
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTF4 1137180672
ADDRLP4 80
INDIRF4
MULF4
ADDRLP4 80
INDIRF4
MULF4
SUBF4
ASGNF4
line 1836
;1836:		break;
ADDRGP4 $666
JUMPV
LABELV $665
line 1841
;1837:	default:
;1838:#ifdef QAGAME
;1839:		Com_Error( ERR_DROP, "BG_EvaluateTrajectory: [GAME SIDE] unknown trType: %i", tr->trType );
;1840:#else
;1841:		Com_Error( ERR_DROP, "BG_EvaluateTrajectory: [CLIENTGAME SIDE] unknown trType: %i", tr->trType );
CNSTI4 1
ARGI4
ADDRGP4 $677
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 1843
;1842:#endif
;1843:		break;
LABELV $666
line 1845
;1844:	}
;1845:}
LABELV $664
endproc BG_EvaluateTrajectory 84 12
export BG_EvaluateTrajectoryDelta
proc BG_EvaluateTrajectoryDelta 44 12
line 1854
;1846:
;1847:/*
;1848:================
;1849:BG_EvaluateTrajectoryDelta
;1850:
;1851:For determining velocity at a given time
;1852:================
;1853:*/
;1854:void BG_EvaluateTrajectoryDelta( const trajectory_t *tr, int atTime, vec3_t result ) {
line 1858
;1855:	float	deltaTime;
;1856:	float	phase;
;1857:
;1858:	switch( tr->trType ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $680
ADDRLP4 8
INDIRI4
CNSTI4 5
GTI4 $680
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $691
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $691
address $683
address $683
address $684
address $686
address $685
address $689
code
LABELV $683
line 1861
;1859:	case TR_STATIONARY:
;1860:	case TR_INTERPOLATE:
;1861:		VectorClear( result );
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRF4
ASGNF4
line 1862
;1862:		break;
ADDRGP4 $681
JUMPV
LABELV $684
line 1864
;1863:	case TR_LINEAR:
;1864:		VectorCopy( tr->trDelta, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1865
;1865:		break;
ADDRGP4 $681
JUMPV
LABELV $685
line 1867
;1866:	case TR_SINE:
;1867:		deltaTime = ( atTime - tr->trTime ) / (float) tr->trDuration;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 1868
;1868:		phase = cos( deltaTime * M_PI * 2 );	// derivative of sin = cos
CNSTF4 1073741824
CNSTF4 1078530011
ADDRLP4 4
INDIRF4
MULF4
MULF4
ARGF4
ADDRLP4 28
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 1869
;1869:		phase *= 0.5;
ADDRLP4 0
CNSTF4 1056964608
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1870
;1870:		VectorScale( tr->trDelta, phase, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1871
;1871:		break;
ADDRGP4 $681
JUMPV
LABELV $686
line 1873
;1872:	case TR_LINEAR_STOP:
;1873:		if ( atTime > tr->trTime + tr->trDuration ) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
LEI4 $687
line 1874
;1874:			VectorClear( result );
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRF4
ASGNF4
line 1875
;1875:			return;
ADDRGP4 $679
JUMPV
LABELV $687
line 1877
;1876:		}
;1877:		VectorCopy( tr->trDelta, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1878
;1878:		break;
ADDRGP4 $681
JUMPV
LABELV $689
line 1880
;1879:	case TR_GRAVITY:
;1880:		deltaTime = ( atTime - tr->trTime ) * 0.001;	// milliseconds to seconds
ADDRLP4 4
CNSTF4 981668463
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 1881
;1881:		VectorCopy( tr->trDelta, result );
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1882
;1882:		result[2] -= DEFAULT_GRAVITY * deltaTime;		// FIXME: local gravity...
ADDRLP4 36
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1145569280
ADDRLP4 4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1883
;1883:		break;
ADDRGP4 $681
JUMPV
LABELV $680
line 1885
;1884:	default:
;1885:		Com_Error( ERR_DROP, "BG_EvaluateTrajectoryDelta: unknown trType: %i", tr->trTime );
CNSTI4 1
ARGI4
ADDRGP4 $690
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 1886
;1886:		break;
LABELV $681
line 1888
;1887:	}
;1888:}
LABELV $679
endproc BG_EvaluateTrajectoryDelta 44 12
data
export eventnames
align 4
LABELV eventnames
address $692
address $693
address $694
address $695
address $696
address $697
address $698
address $699
address $700
address $701
address $702
address $703
address $704
address $705
address $706
address $707
address $708
address $709
address $710
address $711
address $712
address $713
address $714
address $715
address $716
address $717
address $718
address $719
address $720
address $721
address $722
address $723
address $724
address $725
address $726
address $727
address $728
address $729
address $730
address $731
address $732
address $733
address $734
address $735
address $736
address $737
address $738
address $739
address $740
address $741
address $742
address $743
address $744
address $745
address $746
address $747
address $748
address $749
address $750
address $751
address $752
address $753
address $754
address $755
address $756
address $757
address $758
address $759
address $760
address $761
address $762
address $763
address $764
address $765
address $766
address $767
address $768
address $769
address $770
address $771
address $772
address $773
address $774
address $775
address $776
address $777
address $778
address $779
address $780
address $781
address $782
address $783
address $784
address $785
address $786
address $787
address $788
address $789
address $790
address $791
address $792
address $793
address $794
address $795
address $796
address $797
address $798
address $799
address $800
address $801
export BG_AddPredictableEventToPlayerstate
code
proc BG_AddPredictableEventToPlayerstate 12 0
line 2051
;1889:
;1890:char *eventnames[] = {
;1891:	"EV_NONE",
;1892:
;1893:	"EV_CLIENTJOIN",
;1894:
;1895:	"EV_FOOTSTEP",
;1896:	"EV_FOOTSTEP_METAL",
;1897:	"EV_FOOTSPLASH",
;1898:	"EV_FOOTWADE",
;1899:	"EV_SWIM",
;1900:
;1901:	"EV_STEP_4",
;1902:	"EV_STEP_8",
;1903:	"EV_STEP_12",
;1904:	"EV_STEP_16",
;1905:
;1906:	"EV_FALL",
;1907:
;1908:	"EV_JUMP_PAD",			// boing sound at origin", jump sound on player
;1909:
;1910:	"EV_PRIVATE_DUEL",
;1911:
;1912:	"EV_JUMP",
;1913:	"EV_ROLL",
;1914:	"EV_WATER_TOUCH",	// foot touches
;1915:	"EV_WATER_LEAVE",	// foot leaves
;1916:	"EV_WATER_UNDER",	// head touches
;1917:	"EV_WATER_CLEAR",	// head leaves
;1918:
;1919:	"EV_ITEM_PICKUP",			// normal item pickups are predictable
;1920:	"EV_GLOBAL_ITEM_PICKUP",	// powerup / team sounds are broadcast to everyone
;1921:
;1922:	"EV_NOAMMO",
;1923:	"EV_CHANGE_WEAPON",
;1924:	"EV_FIRE_WEAPON",
;1925:	"EV_ALT_FIRE",
;1926:	"EV_SABER_ATTACK",
;1927:	"EV_SABER_HIT",
;1928:	"EV_SABER_BLOCK",
;1929:	"EV_SABER_UNHOLSTER",
;1930:	"EV_BECOME_JEDIMASTER",
;1931:	"EV_DISRUPTOR_MAIN_SHOT",
;1932:	"EV_DISRUPTOR_SNIPER_SHOT",
;1933:	"EV_DISRUPTOR_SNIPER_MISS",
;1934:	"EV_DISRUPTOR_HIT",
;1935:	"EV_DISRUPTOR_ZOOMSOUND",
;1936:
;1937:	"EV_PREDEFSOUND",
;1938:
;1939:	"EV_TEAM_POWER",
;1940:
;1941:	"EV_SCREENSHAKE",
;1942:
;1943:	"EV_USE",			// +Use key
;1944:
;1945:	"EV_USE_ITEM0",
;1946:	"EV_USE_ITEM1",
;1947:	"EV_USE_ITEM2",
;1948:	"EV_USE_ITEM3",
;1949:	"EV_USE_ITEM4",
;1950:	"EV_USE_ITEM5",
;1951:	"EV_USE_ITEM6",
;1952:	"EV_USE_ITEM7",
;1953:	"EV_USE_ITEM8",
;1954:	"EV_USE_ITEM9",
;1955:	"EV_USE_ITEM10",
;1956:	"EV_USE_ITEM11",
;1957:	"EV_USE_ITEM12",
;1958:	"EV_USE_ITEM13",
;1959:	"EV_USE_ITEM14",
;1960:	"EV_USE_ITEM15",
;1961:
;1962:	"EV_ITEMUSEFAIL",
;1963:
;1964:	"EV_ITEM_RESPAWN",
;1965:	"EV_ITEM_POP",
;1966:	"EV_PLAYER_TELEPORT_IN",
;1967:	"EV_PLAYER_TELEPORT_OUT",
;1968:
;1969:	"EV_GRENADE_BOUNCE",		// eventParm will be the soundindex
;1970:	"EV_MISSILE_STICK",
;1971:
;1972:	"EV_PLAY_EFFECT",
;1973:	"EV_PLAY_EFFECT_ID", //finally gave in and added it..
;1974:
;1975:	"EV_MUTE_SOUND",
;1976:	"EV_GENERAL_SOUND",
;1977:	"EV_GLOBAL_SOUND",		// no attenuation
;1978:	"EV_GLOBAL_TEAM_SOUND",
;1979:	"EV_ENTITY_SOUND",
;1980:
;1981:	"EV_PLAY_ROFF",
;1982:
;1983:	"EV_GLASS_SHATTER",
;1984:	"EV_DEBRIS",
;1985:
;1986:	"EV_MISSILE_HIT",
;1987:	"EV_MISSILE_MISS",
;1988:	"EV_MISSILE_MISS_METAL",
;1989:	"EV_BULLET",				// otherEntity is the shooter
;1990:
;1991:	"EV_PAIN",
;1992:	"EV_DEATH1",
;1993:	"EV_DEATH2",
;1994:	"EV_DEATH3",
;1995:	"EV_OBITUARY",
;1996:
;1997:	"EV_POWERUP_QUAD",
;1998:	"EV_POWERUP_BATTLESUIT",
;1999:	//"EV_POWERUP_REGEN",
;2000:
;2001:	"EV_FORCE_DRAINED",
;2002:
;2003:	"EV_GIB_PLAYER",			// gib a previously living player
;2004:	"EV_SCOREPLUM",			// score plum
;2005:
;2006:	"EV_CTFMESSAGE",
;2007:
;2008:	"EV_SAGA_ROUNDOVER",
;2009:	"EV_SAGA_OBJECTIVECOMPLETE",
;2010:
;2011:	"EV_DESTROY_GHOUL2_INSTANCE",
;2012:
;2013:	"EV_DESTROY_WEAPON_MODEL",
;2014:
;2015:	"EV_GIVE_NEW_RANK",
;2016:	"EV_SET_FREE_SABER",
;2017:	"EV_SET_FORCE_DISABLE",
;2018:
;2019:	"EV_WEAPON_CHARGE",
;2020:	"EV_WEAPON_CHARGE_ALT",
;2021:
;2022:	"EV_SHIELD_HIT",
;2023:
;2024:	"EV_DEBUG_LINE",
;2025:	"EV_TESTLINE",
;2026:	"EV_STOPLOOPINGSOUND",
;2027:	"EV_STARTLOOPINGSOUND",
;2028:	"EV_TAUNT",
;2029:
;2030:	"EV_TAUNT_YES",
;2031:	"EV_TAUNT_NO",
;2032:	"EV_TAUNT_FOLLOWME",
;2033:	"EV_TAUNT_GETFLAG",
;2034:	"EV_TAUNT_GUARDBASE",
;2035:	"EV_TAUNT_PATROL",
;2036:
;2037:	"EV_BODY_QUEUE_COPY"
;2038:
;2039:};
;2040:
;2041:/*
;2042:===============
;2043:BG_AddPredictableEventToPlayerstate
;2044:
;2045:Handles the sequence numbers
;2046:===============
;2047:*/
;2048:
;2049:void	trap_Cvar_VariableStringBuffer( const char *var_name, char *buffer, int bufsize );
;2050:
;2051:void BG_AddPredictableEventToPlayerstate( int newEvent, int eventParm, playerState_t *ps ) {
line 2066
;2052:
;2053:#ifdef _DEBUG
;2054:	{
;2055:		char buf[256];
;2056:		trap_Cvar_VariableStringBuffer("showevents", buf, sizeof(buf));
;2057:		if ( atof(buf) != 0 ) {
;2058:#ifdef QAGAME
;2059:			Com_Printf(" game event svt %5d -> %5d: num = %20s parm %d\n", ps->pmove_framecount/*ps->commandTime*/, ps->eventSequence, eventnames[newEvent], eventParm);
;2060:#else
;2061:			Com_Printf("Cgame event svt %5d -> %5d: num = %20s parm %d\n", ps->pmove_framecount/*ps->commandTime*/, ps->eventSequence, eventnames[newEvent], eventParm);
;2062:#endif
;2063:		}
;2064:	}
;2065:#endif
;2066:	ps->events[ps->eventSequence & (MAX_PS_EVENTS-1)] = newEvent;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 2067
;2067:	ps->eventParms[ps->eventSequence & (MAX_PS_EVENTS-1)] = eventParm;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 2068
;2068:	ps->eventSequence++;
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2069
;2069:}
LABELV $802
endproc BG_AddPredictableEventToPlayerstate 12 0
export BG_UserCmdToUserStats
proc BG_UserCmdToUserStats 16 0
line 2072
;2070:
;2071:
;2072:void BG_UserCmdToUserStats(usercmd_t* ucmd, entityState_t* es) {
line 2073
;2073:	byte fw=(byte)ucmd->forwardmove, rt = (byte)ucmd->rightmove, up = (byte)ucmd->upmove;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
ADDRLP4 1
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
ADDRLP4 2
ADDRFP4 0
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
line 2074
;2074:	unsigned int fpa = (fw << 24) | (rt << 16) | (up << 8); // few extra steps here because qvm behaves weird
ADDRLP4 4
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
BORI4
ADDRLP4 2
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
BORI4
CVIU4 4
ASGNU4
line 2075
;2075:	unsigned int cl = (ucmd->weapon << 24) | (ucmd->forcesel << 16) | (ucmd->invensel << 8) | ucmd->generic_cmd;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRU1
CVUI4 1
CNSTI4 24
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 21
ADDP4
INDIRU1
CVUI4 1
CNSTI4 16
LSHI4
BORI4
ADDRLP4 12
INDIRP4
CNSTI4 22
ADDP4
INDIRU1
CVUI4 1
CNSTI4 8
LSHI4
BORI4
ADDRLP4 12
INDIRP4
CNSTI4 23
ADDP4
INDIRU1
CVUI4 1
BORI4
CVIU4 4
ASGNU4
line 2077
;2076:	//es->constantLight = (ucmd->weapon << 24) | (ucmd->forcesel << 16) | (ucmd->invensel << 8) | ucmd->generic_cmd;
;2077:	es->constantLight = (int)cl;// few extra steps here because qvm behaves weird
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 8
INDIRU4
CVUI4 4
ASGNI4
line 2080
;2078:	
;2079:	//es->forcePowersActive = ((byte)ucmd->forwardmove << 24) | ((byte)ucmd->rightmove << 16) | ((byte)ucmd->upmove << 8); // few extra steps here because qvm behaves weird
;2080:	es->forcePowersActive = (int)fpa;
ADDRFP4 4
INDIRP4
CNSTI4 240
ADDP4
ADDRLP4 4
INDIRU4
CVUI4 4
ASGNI4
line 2083
;2081:
;2082:	// do we need angles? might be a bit wasteful.
;2083:	VectorCopySafe(ucmd->angles, es->apos.trBase);
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2085
;2084:
;2085:	es->forceFrame = ucmd->buttons;
ADDRFP4 4
INDIRP4
CNSTI4 288
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 2086
;2086:}
LABELV $803
endproc BG_UserCmdToUserStats 16 0
export BG_StatsToUserCmd
proc BG_StatsToUserCmd 4 0
line 2088
;2087:
;2088:void BG_StatsToUserCmd(entityState_t* es,usercmd_t* ucmd) {
line 2090
;2089:
;2090:	ucmd->weapon = ((unsigned int)es->constantLight) >> 24;
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CVIU4 4
CNSTI4 24
RSHU4
CVUU1 4
ASGNU1
line 2091
;2091:	ucmd->forcesel = (((unsigned int)es->constantLight) >> 16) & 0xff;
ADDRFP4 4
INDIRP4
CNSTI4 21
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CVIU4 4
CNSTI4 16
RSHU4
CNSTU4 255
BANDU4
CVUU1 4
ASGNU1
line 2092
;2092:	ucmd->invensel = (((unsigned int)es->constantLight) >> 8) & 0xff;
ADDRFP4 4
INDIRP4
CNSTI4 22
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CVIU4 4
CNSTI4 8
RSHU4
CNSTU4 255
BANDU4
CVUU1 4
ASGNU1
line 2093
;2093:	ucmd->generic_cmd = (((unsigned int)es->constantLight)) & 0xff;
ADDRFP4 4
INDIRP4
CNSTI4 23
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CVIU4 4
CNSTU4 255
BANDU4
CVUU1 4
ASGNU1
line 2095
;2094:
;2095:	ucmd->forwardmove = (signed char)(((unsigned int)es->forcePowersActive) >> 24);
ADDRLP4 0
CNSTI4 24
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CVIU4 4
ADDRLP4 0
INDIRI4
RSHU4
CVUI4 4
CVII1 4
ASGNI1
line 2096
;2096:	ucmd->rightmove = (signed char)((((unsigned int)es->forcePowersActive) >> 16) & 0xff);
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CVIU4 4
CNSTI4 16
RSHU4
CNSTU4 255
BANDU4
CVUI4 4
CVII1 4
ASGNI1
line 2097
;2097:	ucmd->upmove = (signed char)((((unsigned int)es->forcePowersActive) >> 8) & 0xff);
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
CVIU4 4
CNSTI4 8
RSHU4
CNSTU4 255
BANDU4
CVUI4 4
CVII1 4
ASGNI1
line 2100
;2098:
;2099:	// do we need angles? might be a bit wasteful.
;2100:	VectorCopySafe(es->apos.trBase, ucmd->angles);
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
CVFI4 4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
CVFI4 4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 2102
;2101:
;2102:	ucmd->buttons = es->forceFrame;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
line 2103
;2103:}
LABELV $804
endproc BG_StatsToUserCmd 4 0
export BG_RaceStyleToUserStats
proc BG_RaceStyleToUserStats 20 0
line 2107
;2104:
;2105:
;2106:
;2107:void	BG_RaceStyleToUserStats(raceStyle_t* rs, entityState_t* es) {
line 2109
;2108:	unsigned int ushortMsec, ushortRunFlags;
;2109:	es->bolt1 = rs->movementStyle;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRU1
CVUI4 1
ASGNI4
line 2111
;2110:#ifdef Q3_VM
;2111:	ushortMsec = SHORT2USHORT(rs->msec); // can be negative. is this conversion safe?
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
INDIRI2
CVII4 2
CNSTI4 0
GEI4 $807
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
INDIRI2
CVII4 2
CNSTI4 65535
ADDI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $808
JUMPV
LABELV $807
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
INDIRI2
CVII4 2
ASGNI4
LABELV $808
ADDRLP4 0
ADDRLP4 8
INDIRI4
CVIU4 4
ASGNU4
line 2112
;2112:	ushortRunFlags = SHORT2USHORT(rs->runFlags); // can be negative. is this conversion safe?
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI2
CVII4 2
CNSTI4 0
GEI4 $810
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI2
CVII4 2
CNSTI4 65535
ADDI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $811
JUMPV
LABELV $810
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI2
CVII4 2
ASGNI4
LABELV $811
ADDRLP4 4
ADDRLP4 12
INDIRI4
CVIU4 4
ASGNU4
line 2117
;2113:#else
;2114:	ushortMsec = (unsigned short)rs->msec; // can be negative. is this conversion safe?
;2115:	ushortRunFlags = (unsigned short)rs->runFlags; // can be negative since im forced to use signed short. is this conversion safe?
;2116:#endif
;2117:	es->modelindex = rs->jumpLevel; // can be negative
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
line 2118
;2118:	es->powerups = rs->variant;
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 6
ADDP4
INDIRI2
CVII4 2
ASGNI4
line 2119
;2119:	es->apos.trDuration = (ushortMsec & 65535) << 16 | (ushortRunFlags & 65535); // wanted to use torsoAnim and legsAnim but MV remaps fuck it
ADDRLP4 16
CNSTU4 65535
ASGNU4
ADDRFP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDRLP4 0
INDIRU4
ADDRLP4 16
INDIRU4
BANDU4
CNSTI4 16
LSHU4
ADDRLP4 4
INDIRU4
ADDRLP4 16
INDIRU4
BANDU4
BORU4
CVUI4 4
ASGNI4
line 2120
;2120:}
LABELV $805
endproc BG_RaceStyleToUserStats 20 0
export BG_StatsToRaceStyle
proc BG_StatsToRaceStyle 16 0
line 2122
;2121:
;2122:void	BG_StatsToRaceStyle(entityState_t* es, raceStyle_t* rs) {
line 2124
;2123:
;2124:	rs->movementStyle = es->bolt1;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2126
;2125:	//rs->msec = USHORT2SHORT(es->torsoAnim); // can be negative. is this conversion safe?
;2126:	rs->msec = USHORT2SHORT((es->apos.trDuration >> 16) & 65535); // can be negative. is this conversion safe?
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 65535
BANDI4
CNSTI4 32767
LEI4 $814
ADDRLP4 4
CNSTI4 65535
ASGNI4
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 16
RSHI4
ADDRLP4 4
INDIRI4
BANDI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $815
JUMPV
LABELV $814
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 65535
BANDI4
ASGNI4
LABELV $815
ADDRFP4 4
INDIRP4
CNSTI4 2
ADDP4
ADDRLP4 0
INDIRI4
CVII2 4
ASGNI2
line 2127
;2127:	rs->jumpLevel = es->modelindex; // can be negative
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CVII1 4
ASGNI1
line 2128
;2128:	rs->variant = es->powerups;
ADDRFP4 4
INDIRP4
CNSTI4 6
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
CVII2 4
ASGNI2
line 2130
;2129:	//rs->runFlags = es->legsAnim;
;2130:	rs->runFlags = USHORT2SHORT(es->apos.trDuration & 65535);
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 65535
BANDI4
CNSTI4 32767
LEI4 $817
ADDRLP4 12
CNSTI4 65535
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
BANDI4
ADDRLP4 12
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $818
JUMPV
LABELV $817
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 65535
BANDI4
ASGNI4
LABELV $818
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRI4
CVII2 4
ASGNI2
line 2131
;2131:}
LABELV $812
endproc BG_StatsToRaceStyle 16 0
proc BG_MsecToEffectiveGravity 8 4
line 2133
;2132:
;2133:static float BG_MsecToEffectiveGravity(int referenceMsec, float gravity, movementStyle_e style) {
line 2134
;2134:	if (!referenceMsec || referenceMsec == -2) return gravity;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $822
ADDRLP4 0
INDIRI4
CNSTI4 -2
NEI4 $820
LABELV $822
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $819
JUMPV
LABELV $820
line 2135
;2135:	if (style == MV_Q2) {
ADDRFP4 8
INDIRI4
CNSTI4 9
NEI4 $823
line 2139
;2136:		// q2 has different type of snapping
;2137:		// DONT use this rn, i think its not 100% reliable
;2138:		// TODO fix this. doesn't seem to calculate things properly? 200fps (800 grav) jumps higher than 125 (under 800) on pornstar-budlight. dumb.
;2139:		return 0.125f*(int)(8.0f*(float)referenceMsec * 0.001f * gravity) * 1000.0f / (float)referenceMsec;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CVIF4 4
ASGNF4
CNSTF4 1148846080
CNSTF4 1040187392
CNSTF4 981668463
CNSTF4 1090519040
ADDRLP4 4
INDIRF4
MULF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
CVFI4 4
CVIF4 4
MULF4
MULF4
ADDRLP4 4
INDIRF4
DIVF4
RETF4
ADDRGP4 $819
JUMPV
LABELV $823
line 2141
;2140:	}
;2141:	else {
line 2142
;2142:		return roundf((float)referenceMsec * 0.001f * gravity) * 1000.0f / (float)referenceMsec;
CNSTF4 981668463
ADDRFP4 0
INDIRI4
CVIF4 4
MULF4
ADDRFP4 4
INDIRF4
MULF4
ARGF4
ADDRLP4 4
ADDRGP4 roundf
CALLF4
ASGNF4
CNSTF4 1148846080
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 0
INDIRI4
CVIF4 4
DIVF4
RETF4
LABELV $819
endproc BG_MsecToEffectiveGravity 8 4
proc BG_JumpPadMsecCompensationFactor 24 12
line 2146
;2143:	}
;2144:}
;2145:
;2146:static float BG_JumpPadMsecCompensationFactor(int msec, int referenceMsec, float gravity, movementStyle_e style) {
line 2147
;2147:	float gravcurrent = BG_MsecToEffectiveGravity(msec, gravity,style);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_MsecToEffectiveGravity
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 2148
;2148:	float gravreference = BG_MsecToEffectiveGravity(referenceMsec, gravity,MV_JK2); // the reference is always the same style
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRF4
ARGF4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 BG_MsecToEffectiveGravity
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
ASGNF4
line 2149
;2149:	return sqrtf(gravcurrent) / sqrtf(gravreference); // magically, after a few hours in excel, it turns out this is 100% accurate. a mathematician could have prolly figured that out in 2 minutes, but im not one. :)
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
DIVF4
RETF4
LABELV $825
endproc BG_JumpPadMsecCompensationFactor 24 12
export BG_TouchJumpPad
proc BG_TouchJumpPad 20 16
line 2157
;2150:}
;2151:
;2152:/*
;2153:========================
;2154:BG_TouchJumpPad
;2155:========================
;2156:*/
;2157:void BG_TouchJumpPad( playerState_t *ps, entityState_t *jumppad, int msecCompensate, int referenceMsec,movementStyle_e style) {
line 2159
;2158:	// spectators don't use jump pads
;2159:	if ( ps->pm_type != PM_NORMAL && ps->pm_type != PM_FLOAT ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $827
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $827
line 2160
;2160:		return;
ADDRGP4 $826
JUMPV
LABELV $827
line 2182
;2161:	}
;2162:
;2163:	/*
;2164:	vec3_t	angles;
;2165:	float p;
;2166:	int effectNum;
;2167:
;2168:	// if we didn't hit this same jumppad the previous frame
;2169:	// then don't play the event sound again if we are in a fat trigger
;2170:	if ( ps->jumppad_ent != jumppad->number ) {
;2171:
;2172:		vectoangles( jumppad->origin2, angles);
;2173:		p = fabs( AngleNormalize180( angles[PITCH] ) );
;2174:		if( p < 45 ) {
;2175:			effectNum = 0;
;2176:		} else {
;2177:			effectNum = 1;
;2178:		}
;2179:	}
;2180:	*/
;2181:	// remember hitting this jumppad this frame
;2182:	ps->jumppad_ent = jumppad->number;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 2183
;2183:	ps->jumppad_frame = ps->pmove_framecount;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ASGNI4
line 2185
;2184:	// give the player the velocity from the jumppad
;2185:	if (msecCompensate) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $829
line 2186
;2186:		float compensate = BG_JumpPadMsecCompensationFactor(msecCompensate, referenceMsec, ps->gravity ? ps->gravity : 800.0f,style);
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
EQI4 $832
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRGP4 $833
JUMPV
LABELV $832
ADDRLP4 12
CNSTF4 1145569280
ASGNF4
LABELV $833
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_JumpPadMsecCompensationFactor
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 16
INDIRF4
ASGNF4
line 2187
;2187:		VectorScale(jumppad->origin2, compensate, ps->velocity);
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 2188
;2188:	}
ADDRGP4 $830
JUMPV
LABELV $829
line 2189
;2189:	else {
line 2190
;2190:		VectorCopy(jumppad->origin2, ps->velocity);
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 2191
;2191:	}
LABELV $830
line 2192
;2192:}
LABELV $826
endproc BG_TouchJumpPad 20 16
export BG_TouchJumpPadTargetSpeed
proc BG_TouchJumpPadTargetSpeed 152 8
line 2197
;2193:
;2194:#define Q3BUG 1
;2195:
;2196:void BG_TouchJumpPadTargetSpeed(entityState_t* jumppad, playerState_t* ps, float compensate)
;2197:{
line 2198
;2198:	int spawnFlags = jumppad->forceFrame;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
line 2199
;2199:	float speed = jumppad->origin2[0];
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ASGNF4
line 2206
;2200:
;2201:	int i;
;2202:	vec3_t pushVelocity;
;2203:	vec3_t oldVelocity;
;2204:	vec3_t normalized;
;2205:	float oldSpeed;
;2206:	qboolean launcher = spawnFlags & Q3SPAWNFLAG_TARGET_SPEED_LAUNCHER;
ADDRLP4 28
ADDRLP4 32
INDIRI4
CNSTI4 256
BANDI4
ASGNI4
line 2207
;2207:	float launchSpeed = 0;
ADDRLP4 64
CNSTF4 0
ASGNF4
line 2213
;2208:
;2209:#define CLASSIFYSISGN(flags,plus,minus) ((flags & plus) && (flags & minus)) ? 2 : ((flags & plus) ? 1 : ((flags & minus) ? -1 : 0))
;2210://#define CLASSIFYSISGN(flags,plus,minus) ((flags & (plus|minus))>plus) ? 2 : ((flags & plus) ? 1 : ((flags & minus) ? -1 : 0)) // faster? idk.
;2211:
;2212:	float	sign[3]; // 0 == none. 1 == positive. -1 == negative. 2 = both
;2213:	sign[0] = CLASSIFYSISGN(spawnFlags, Q3SPAWNFLAG_TARGET_SPEED_POSX, Q3SPAWNFLAG_TARGET_SPEED_NEGX);
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 88
INDIRI4
EQI4 $838
ADDRLP4 32
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 88
INDIRI4
EQI4 $838
ADDRLP4 72
CNSTI4 2
ASGNI4
ADDRGP4 $839
JUMPV
LABELV $838
ADDRLP4 32
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $840
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRGP4 $841
JUMPV
LABELV $840
ADDRLP4 32
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $842
ADDRLP4 80
CNSTI4 -1
ASGNI4
ADDRGP4 $843
JUMPV
LABELV $842
ADDRLP4 80
CNSTI4 0
ASGNI4
LABELV $843
ADDRLP4 76
ADDRLP4 80
INDIRI4
ASGNI4
LABELV $841
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
LABELV $839
ADDRLP4 4
ADDRLP4 72
INDIRI4
CVIF4 4
ASGNF4
line 2214
;2214:	sign[1] = CLASSIFYSISGN(spawnFlags, Q3SPAWNFLAG_TARGET_SPEED_POSY, Q3SPAWNFLAG_TARGET_SPEED_NEGY);
ADDRLP4 108
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 108
INDIRI4
EQI4 $848
ADDRLP4 32
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 108
INDIRI4
EQI4 $848
ADDRLP4 92
CNSTI4 2
ASGNI4
ADDRGP4 $849
JUMPV
LABELV $848
ADDRLP4 32
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $850
ADDRLP4 96
CNSTI4 1
ASGNI4
ADDRGP4 $851
JUMPV
LABELV $850
ADDRLP4 32
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $852
ADDRLP4 100
CNSTI4 -1
ASGNI4
ADDRGP4 $853
JUMPV
LABELV $852
ADDRLP4 100
CNSTI4 0
ASGNI4
LABELV $853
ADDRLP4 96
ADDRLP4 100
INDIRI4
ASGNI4
LABELV $851
ADDRLP4 92
ADDRLP4 96
INDIRI4
ASGNI4
LABELV $849
ADDRLP4 4+4
ADDRLP4 92
INDIRI4
CVIF4 4
ASGNF4
line 2215
;2215:	sign[2] = CLASSIFYSISGN(spawnFlags, Q3SPAWNFLAG_TARGET_SPEED_POSZ, Q3SPAWNFLAG_TARGET_SPEED_NEGZ);
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 128
INDIRI4
EQI4 $858
ADDRLP4 32
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 128
INDIRI4
EQI4 $858
ADDRLP4 112
CNSTI4 2
ASGNI4
ADDRGP4 $859
JUMPV
LABELV $858
ADDRLP4 32
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $860
ADDRLP4 116
CNSTI4 1
ASGNI4
ADDRGP4 $861
JUMPV
LABELV $860
ADDRLP4 32
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $862
ADDRLP4 120
CNSTI4 -1
ASGNI4
ADDRGP4 $863
JUMPV
LABELV $862
ADDRLP4 120
CNSTI4 0
ASGNI4
LABELV $863
ADDRLP4 116
ADDRLP4 120
INDIRI4
ASGNI4
LABELV $861
ADDRLP4 112
ADDRLP4 116
INDIRI4
ASGNI4
LABELV $859
ADDRLP4 4+8
ADDRLP4 112
INDIRI4
CVIF4 4
ASGNF4
line 2220
;2216:
;2217:#undef CLASSIFYSISGN
;2218:
;2219:	// speed cannot be negative except when subtracting
;2220:	if (!(spawnFlags & Q3SPAWNFLAG_TARGET_SPEED_ADD))
ADDRLP4 32
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $864
line 2221
;2221:	{
line 2222
;2222:		speed = MAX(speed, 0);
ADDRLP4 48
INDIRF4
CNSTF4 0
LEF4 $867
ADDRLP4 132
ADDRLP4 48
INDIRF4
ASGNF4
ADDRGP4 $868
JUMPV
LABELV $867
ADDRLP4 132
CNSTF4 0
ASGNF4
LABELV $868
ADDRLP4 48
ADDRLP4 132
INDIRF4
ASGNF4
line 2223
;2223:	}
LABELV $864
line 2225
;2224:
;2225:	VectorCopy(ps->velocity, pushVelocity);
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2226
;2226:	VectorCopy(ps->velocity, oldVelocity);
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2228
;2227:
;2228:	for (i = 0; i < 3; ++i)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $869
line 2229
;2229:	{
line 2230
;2230:		if (launcher && sign[i] == 2) sign[i] = 0;
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $873
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 1073741824
NEF4 $873
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTF4 0
ASGNF4
LABELV $873
line 2231
;2231:		if (!sign[i]) pushVelocity[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
NEF4 $875
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
CNSTF4 0
ASGNF4
LABELV $875
line 2232
;2232:	}
LABELV $870
line 2228
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $869
line 2234
;2233:
;2234:	oldSpeed = VectorLength(pushVelocity);
ADDRLP4 16
ARGP4
ADDRLP4 132
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 132
INDIRF4
ASGNF4
line 2236
;2235:
;2236:	if (spawnFlags & Q3SPAWNFLAG_TARGET_SPEED_PERCENTAGE) {
ADDRLP4 32
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $877
line 2237
;2237:		speed = oldSpeed * speed / 100.0f;
ADDRLP4 48
ADDRLP4 68
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
CNSTF4 1120403456
DIVF4
ASGNF4
line 2241
;2238:		//if (compensate) {
;2239:		//	speed *= compensate;
;2240:		//}
;2241:	}
LABELV $877
line 2248
;2242:
;2243:#if !Q3BUG
;2244:	launchSpeed += speed;
;2245:	if (spawnFlags & Q3SPAWNFLAG_TARGET_SPEED_ADD) launchSpeed += oldSpeed;
;2246:#endif
;2247:
;2248:	for (i = 0; i < 3; ++i)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $879
line 2249
;2249:	{
line 2250
;2250:		if (((pushVelocity[i] != 0) || launcher) && (fabsf(sign[i])==1))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRF4
CNSTF4 0
NEF4 $885
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $883
LABELV $885
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 136
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 136
INDIRF4
CNSTF4 1065353216
NEF4 $883
line 2251
;2251:		{
line 2252
;2252:			if (launcher)
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $886
line 2253
;2253:			{
line 2254
;2254:				pushVelocity[i] = 1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
CNSTF4 1065353216
ASGNF4
line 2256
;2255:#if Q3BUG
;2256:				launchSpeed += speed;
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRLP4 48
INDIRF4
ADDF4
ASGNF4
line 2257
;2257:				if (spawnFlags & Q3SPAWNFLAG_TARGET_SPEED_ADD) launchSpeed += oldSpeed;
ADDRLP4 32
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $888
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ASGNF4
LABELV $888
line 2259
;2258:#endif
;2259:			}
LABELV $886
line 2261
;2260:
;2261:			pushVelocity[i] = copysignf(pushVelocity[i],sign[i]);
ADDRLP4 140
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 144
ADDRLP4 140
INDIRI4
ADDRLP4 16
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
INDIRF4
ARGF4
ADDRLP4 140
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 148
ADDRGP4 copysignf
CALLF4
ASGNF4
ADDRLP4 144
INDIRP4
ADDRLP4 148
INDIRF4
ASGNF4
line 2262
;2262:		}
LABELV $883
line 2263
;2263:	}
LABELV $880
line 2248
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $879
line 2265
;2264:
;2265:	VectorCopy(pushVelocity, normalized);
ADDRLP4 36
ADDRLP4 16
INDIRB
ASGNB 12
line 2266
;2266:	VectorNormalize(normalized);
ADDRLP4 36
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2268
;2267:
;2268:	if (compensate) {
ADDRFP4 8
INDIRF4
CNSTF4 0
EQF4 $890
line 2269
;2269:		VectorScale(normalized, compensate, normalized);
ADDRLP4 136
ADDRFP4 8
INDIRF4
ASGNF4
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 36+4
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 36+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 2270
;2270:	}
LABELV $890
line 2272
;2271:
;2272:	if (launcher)
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $896
line 2273
;2273:	{
line 2274
;2274:		VectorScale(normalized, fabs(launchSpeed), pushVelocity);
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 136
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 36
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 140
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 36+4
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ASGNF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRLP4 144
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 36+8
INDIRF4
ADDRLP4 144
INDIRF4
MULF4
ASGNF4
line 2275
;2275:	}
ADDRGP4 $897
JUMPV
LABELV $896
line 2277
;2276:	else
;2277:	{
line 2278
;2278:		if (spawnFlags & Q3SPAWNFLAG_TARGET_SPEED_ADD) {
ADDRLP4 32
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $902
line 2279
;2279:			VectorMA(oldVelocity, speed, normalized, pushVelocity);
ADDRLP4 16
ADDRLP4 52
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 52+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 52+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ASGNF4
line 2280
;2280:		}
ADDRGP4 $903
JUMPV
LABELV $902
line 2281
;2281:		else {
line 2282
;2282:			VectorScale(normalized, speed, pushVelocity);
ADDRLP4 16
ADDRLP4 36
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 36+4
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 36+8
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 2283
;2283:		}
LABELV $903
line 2284
;2284:	}
LABELV $897
line 2286
;2285:
;2286:	for (i = 0; i < 3; ++i)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $914
line 2287
;2287:	{
line 2288
;2288:		if (!sign[i]) pushVelocity[i] = oldVelocity[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
NEF4 $918
ADDRLP4 136
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 136
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 136
INDIRI4
ADDRLP4 52
ADDP4
INDIRF4
ASGNF4
LABELV $918
line 2289
;2289:	}
LABELV $915
line 2286
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $914
line 2291
;2290:
;2291:	VectorCopy(pushVelocity, ps->velocity);
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2293
;2292:
;2293:	ps->jumppad_ent = jumppad->number;
ADDRFP4 4
INDIRP4
CNSTI4 480
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2294
;2294:	ps->jumppad_frame = ps->pmove_framecount;
ADDRLP4 136
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 136
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ASGNI4
line 2295
;2295:}
LABELV $834
endproc BG_TouchJumpPadTargetSpeed 152 8
export BG_TouchJumpPadVelocity
proc BG_TouchJumpPadVelocity 60 16
line 2315
;2296:
;2297:
;2298:#define JUMPPAD_VELOCITY_SPAWNFLAG_PLAYERDIR_XY 1
;2299:#define JUMPPAD_VELOCITY_SPAWNFLAG_ADD_XY 2
;2300:#define JUMPPAD_VELOCITY_SPAWNFLAG_PLAYERDIR_Z 4
;2301:#define JUMPPAD_VELOCITY_SPAWNFLAG_ADD_Z 8
;2302:#define JUMPPAD_VELOCITY_SPAWNFLAG_BIDIRECTIONAL_XY 16
;2303:#define JUMPPAD_VELOCITY_SPAWNFLAG_BIDIRECTIONAL_Z 32
;2304:#define JUMPPAD_VELOCITY_SPAWNFLAG_CLAMP_NEGATIVE_ADDS 64
;2305:
;2306:/* Ensure legacy spawnflag names (if any) map cleanly; avoid accidental macro typos. */
;2307:#ifndef JUMPPAD_VELOCITY_SPAWNFLAG_PLAYERDIR_XY
;2308:#define JUMPPAD_VELOCITY_SPAWNFLAG_PLAYERDIR_XY 1
;2309:#endif
;2310:#ifndef JUMPPAD_VELOCITY_SPAWNFLAG_ADD_XY
;2311:#define JUMPPAD_VELOCITY_SPAWNFLAG_ADD_XY 2
;2312:#endif
;2313:
;2314:// TODO do a test of this against the other code to make sure its accurate.
;2315:void BG_TouchJumpPadVelocity(playerState_t* ps, entityState_t* jumppad, int msecCompensate, int referenceMsec, movementStyle_e style) {
line 2317
;2316:	vec3_t tmpHorz, tmpVert;
;2317:	int flags = jumppad->weapon;
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 2318
;2318:	float speedHorz = jumppad->angles2[0];
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 128
ADDP4
INDIRF4
ASGNF4
line 2319
;2319:	float speedVert = jumppad->angles2[2];
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 136
ADDP4
INDIRF4
ASGNF4
line 2320
;2320:	float compensate = 0.0f;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 2321
;2321:	qboolean isFirstFrame = ps->jumppad_ent != jumppad->number;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $922
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRGP4 $923
JUMPV
LABELV $922
ADDRLP4 44
CNSTI4 0
ASGNI4
LABELV $923
ADDRLP4 36
ADDRLP4 44
INDIRI4
ASGNI4
line 2324
;2322:
;2323:
;2324:	if (msecCompensate) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $924
line 2325
;2325:		compensate = BG_JumpPadMsecCompensationFactor(msecCompensate, referenceMsec, ps->gravity ? ps->gravity : 800.0f, style);
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
EQI4 $927
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRGP4 $928
JUMPV
LABELV $927
ADDRLP4 48
CNSTF4 1145569280
ASGNF4
LABELV $928
ADDRLP4 48
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_JumpPadMsecCompensationFactor
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 52
INDIRF4
ASGNF4
line 2326
;2326:	}
LABELV $924
line 2328
;2327:
;2328:	if (jumppad->saberInFlight) { // its a target_speed converted to a jumppad
ADDRFP4 4
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
EQI4 $929
line 2329
;2329:		BG_TouchJumpPadTargetSpeed(jumppad,ps,compensate);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRGP4 BG_TouchJumpPadTargetSpeed
CALLV
pop
line 2330
;2330:		return;
ADDRGP4 $920
JUMPV
LABELV $929
line 2352
;2331:	}
;2332:
;2333:	/*
;2334:	vec3_t	angles;
;2335:	float p;
;2336:	int effectNum;
;2337:
;2338:	// if we didn't hit this same jumppad the previous frame
;2339:	// then don't play the event sound again if we are in a fat trigger
;2340:	if ( ps->jumppad_ent != jumppad->number ) {
;2341:
;2342:		vectoangles( jumppad->origin2, angles);
;2343:		p = fabs( AngleNormalize180( angles[PITCH] ) );
;2344:		if( p < 45 ) {
;2345:			effectNum = 0;
;2346:		} else {
;2347:			effectNum = 1;
;2348:		}
;2349:	}
;2350:	*/
;2351:
;2352:	if (flags & JUMPPAD_VELOCITY_SPAWNFLAG_PLAYERDIR_XY) {
ADDRLP4 28
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $931
line 2354
;2353:
;2354:		VectorCopy(ps->velocity, tmpHorz);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2355
;2355:		tmpHorz[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2356
;2356:		VectorNormalize(tmpHorz);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2357
;2357:		VectorScale(tmpHorz, speedHorz, tmpHorz);
ADDRLP4 48
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ASGNF4
line 2358
;2358:	}
ADDRGP4 $932
JUMPV
LABELV $931
line 2359
;2359:	else {
line 2361
;2360:
;2361:		VectorCopy(jumppad->origin2, tmpHorz);
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 2362
;2362:		tmpHorz[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2363
;2363:		if (flags & JUMPPAD_VELOCITY_SPAWNFLAG_BIDIRECTIONAL_XY) {
ADDRLP4 28
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $939
line 2366
;2364:
;2365:			// Is the angle between the vectors bigger than 90 degrees? Then reverse our drection to result in increased speed.
;2366:			if (DotProduct(tmpHorz, ps->velocity) < 0) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $941
line 2367
;2367:				VectorNegate(tmpHorz, tmpHorz);
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
NEGF4
ASGNF4
line 2368
;2368:			}
LABELV $941
line 2369
;2369:		}
LABELV $939
line 2370
;2370:	}
LABELV $932
line 2372
;2371:
;2372:	if (flags & JUMPPAD_VELOCITY_SPAWNFLAG_PLAYERDIR_Z) {
ADDRLP4 28
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $949
line 2373
;2373:		float base = speedVert;
ADDRLP4 48
ADDRLP4 40
INDIRF4
ASGNF4
line 2374
;2374:		if (ps->velocity[2] < 0.0f) {
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $951
line 2375
;2375:			base = -base; /* emulate copysignf without calling it (LCC friendly) */
ADDRLP4 48
ADDRLP4 48
INDIRF4
NEGF4
ASGNF4
line 2376
;2376:		}
LABELV $951
line 2377
;2377:		VectorSet(tmpVert, 0.0f, 0.0f, base);
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 12
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 48
INDIRF4
ASGNF4
line 2378
;2378:	} else {
ADDRGP4 $950
JUMPV
LABELV $949
line 2379
;2379:		float base = jumppad->origin2[2];
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ASGNF4
line 2380
;2380:		if ((flags & JUMPPAD_VELOCITY_SPAWNFLAG_BIDIRECTIONAL_Z) && ps->velocity[2] < 0.0f) {
ADDRLP4 28
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $955
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $955
line 2381
;2381:			if (base > 0.0f) {
ADDRLP4 48
INDIRF4
CNSTF4 0
LEF4 $957
line 2382
;2382:				base = -base; /* flip sign to match velocity sign */
ADDRLP4 48
ADDRLP4 48
INDIRF4
NEGF4
ASGNF4
line 2383
;2383:			}
LABELV $957
line 2384
;2384:		}
LABELV $955
line 2385
;2385:		VectorSet(tmpVert, 0.0f, 0.0f, base);
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 12
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 48
INDIRF4
ASGNF4
line 2386
;2386:	}
LABELV $950
line 2388
;2387:
;2388:	if (compensate) {
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $961
line 2389
;2389:		VectorScale(tmpHorz, compensate, tmpHorz);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 2390
;2390:	}
LABELV $961
line 2391
;2391:	if (flags & JUMPPAD_VELOCITY_SPAWNFLAG_ADD_XY) {
ADDRLP4 28
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $967
line 2393
;2392:
;2393:		if (isFirstFrame) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $968
line 2395
;2394:
;2395:			VectorAdd(tmpHorz, ps->velocity, tmpHorz);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2396
;2396:			tmpHorz[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2398
;2397:
;2398:			if (flags & JUMPPAD_VELOCITY_SPAWNFLAG_CLAMP_NEGATIVE_ADDS && DotProduct(tmpHorz, ps->velocity) < 0) {
ADDRLP4 28
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $976
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $976
line 2400
;2399:
;2400:				VectorSet(tmpHorz, 0, 0, 0);
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 0
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2401
;2401:			}
LABELV $976
line 2403
;2402:
;2403:			ps->velocity[0] = tmpHorz[0];
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 2404
;2404:			ps->velocity[1] = tmpHorz[1];
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 2405
;2405:		}
line 2406
;2406:	}
ADDRGP4 $968
JUMPV
LABELV $967
line 2407
;2407:	else {
line 2408
;2408:		ps->velocity[0] = tmpHorz[0];
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 2409
;2409:		ps->velocity[1] = tmpHorz[1];
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 2410
;2410:	}
LABELV $968
line 2412
;2411:	
;2412:	if (compensate) {
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $984
line 2413
;2413:		VectorScale(tmpVert, compensate, tmpVert);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 2414
;2414:	}
LABELV $984
line 2415
;2415:	if (flags & JUMPPAD_VELOCITY_SPAWNFLAG_ADD_Z) {
ADDRLP4 28
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $990
line 2417
;2416:
;2417:		if (isFirstFrame) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $991
line 2419
;2418:
;2419:			tmpVert[2] += ps->velocity[2];
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2421
;2420:
;2421:			if (flags & JUMPPAD_VELOCITY_SPAWNFLAG_CLAMP_NEGATIVE_ADDS && tmpVert[2] * ps->velocity[2] < 0) {
ADDRLP4 28
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $995
ADDRLP4 12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
CNSTF4 0
GEF4 $995
line 2423
;2422:
;2423:				tmpVert[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 2424
;2424:			}
LABELV $995
line 2426
;2425:
;2426:			ps->velocity[2] = tmpVert[2];
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 12+8
INDIRF4
ASGNF4
line 2427
;2427:		}
line 2428
;2428:	}
ADDRGP4 $991
JUMPV
LABELV $990
line 2429
;2429:	else {
line 2430
;2430:		ps->velocity[2] = tmpVert[2];
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 12+8
INDIRF4
ASGNF4
line 2431
;2431:	}
LABELV $991
line 2435
;2432:
;2433:
;2434:	// remember hitting this jumppad this frame
;2435:	ps->jumppad_ent = jumppad->number;
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 2436
;2436:	ps->jumppad_frame = ps->pmove_framecount;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ASGNI4
line 2439
;2437:	// give the player the velocity from the jumppad
;2438:	//VectorCopy( jumppad->origin2, ps->velocity );
;2439:}
LABELV $920
endproc BG_TouchJumpPadVelocity 60 16
export BG_PlayerStateToEntityState
proc BG_PlayerStateToEntityState 28 0
line 2449
;2440:
;2441:/*
;2442:========================
;2443:BG_PlayerStateToEntityState
;2444:
;2445:This is done after each set of usercmd_t on the server,
;2446:and after local prediction on the client
;2447:========================
;2448:*/
;2449:void BG_PlayerStateToEntityState( playerState_t *ps, entityState_t *s, qboolean snap ) {
line 2452
;2450:	int		i;
;2451:
;2452:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPECTATOR ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 6
EQI4 $1004
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $1002
LABELV $1004
line 2453
;2453:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 2454
;2454:	} else if ( ps->stats[STAT_HEALTH] <= GIB_HEALTH ) {
ADDRGP4 $1003
JUMPV
LABELV $1002
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $1005
line 2455
;2455:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 2456
;2456:	} else {
ADDRGP4 $1006
JUMPV
LABELV $1005
line 2457
;2457:		s->eType = ET_PLAYER;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 2458
;2458:	}
LABELV $1006
LABELV $1003
line 2460
;2459:
;2460:	s->number = ps->clientNum;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 2462
;2461:
;2462:	s->pos.trType = TR_INTERPOLATE;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 2463
;2463:	VectorCopy( ps->origin, s->pos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2464
;2464:	if ( snap ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1007
line 2465
;2465:		SnapVector( s->pos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2466
;2466:	}
LABELV $1007
line 2468
;2467:	// set the trDelta for flag direction
;2468:	VectorCopy( ps->velocity, s->pos.trDelta );
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2470
;2469:
;2470:	s->apos.trType = TR_INTERPOLATE;
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 2471
;2471:	VectorCopy( ps->viewangles, s->apos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2472
;2472:	if ( snap ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1009
line 2473
;2473:		SnapVector( s->apos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2474
;2474:	}
LABELV $1009
line 2476
;2475:
;2476:	s->trickedentindex = ps->fd.forceMindtrickTargetIndex;
ADDRFP4 4
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ASGNI4
line 2477
;2477:	s->trickedentindex2 = ps->fd.forceMindtrickTargetIndex2;
ADDRFP4 4
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ASGNI4
line 2478
;2478:	s->trickedentindex3 = ps->fd.forceMindtrickTargetIndex3;
ADDRFP4 4
INDIRP4
CNSTI4 156
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ASGNI4
line 2479
;2479:	s->trickedentindex4 = ps->fd.forceMindtrickTargetIndex4;
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
INDIRI4
ASGNI4
line 2481
;2480:
;2481:	s->forceFrame = ps->saberLockFrame;
ADDRFP4 4
INDIRP4
CNSTI4 288
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 2483
;2482:
;2483:	s->emplacedOwner = ps->electrifyTime;
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ASGNI4
line 2485
;2484:
;2485:	s->speed = ps->speed;
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2487
;2486:
;2487:	s->genericenemyindex = ps->genericEnemyIndex;
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 2489
;2488:
;2489:	s->activeForcePass = ps->activeForcePass;
ADDRFP4 4
INDIRP4
CNSTI4 176
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ASGNI4
line 2491
;2490:
;2491:	s->angles2[YAW] = ps->movementDir;
ADDRFP4 4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2492
;2492:	s->legsAnim = ps->legsAnim;
ADDRFP4 4
INDIRP4
CNSTI4 280
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 2493
;2493:	s->torsoAnim = ps->torsoAnim;
ADDRFP4 4
INDIRP4
CNSTI4 284
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
line 2494
;2494:	s->clientNum = ps->clientNum;		// ET_PLAYER looks here instead of at number
ADDRFP4 4
INDIRP4
CNSTI4 220
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 2496
;2495:										// so corpses can also reference the proper config
;2496:	s->eFlags = ps->eFlags;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 2498
;2497:
;2498:	s->saberInFlight = ps->saberInFlight;
ADDRFP4 4
INDIRP4
CNSTI4 228
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ASGNI4
line 2499
;2499:	s->saberEntityNum = ps->saberEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 2500
;2500:	s->saberMove = ps->saberMove;
ADDRFP4 4
INDIRP4
CNSTI4 236
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 2501
;2501:	s->forcePowersActive = ps->fd.forcePowersActive;
ADDRFP4 4
INDIRP4
CNSTI4 240
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ASGNI4
line 2503
;2502:
;2503:	if (ps->duelInProgress)
ADDRFP4 0
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1011
line 2504
;2504:	{
line 2505
;2505:		s->bolt1 = 1;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 1
ASGNI4
line 2506
;2506:	}
ADDRGP4 $1012
JUMPV
LABELV $1011
line 2508
;2507:	else
;2508:	{
line 2509
;2509:		if (ps->stats[STAT_RACEMODE])
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1013
line 2510
;2510:			s->bolt1 = 2;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 2
ASGNI4
ADDRGP4 $1014
JUMPV
LABELV $1013
line 2512
;2511:		else
;2512:			s->bolt1 = 0;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 0
ASGNI4
LABELV $1014
line 2514
;2513:		//s->bolt1 = 0;
;2514:	}
LABELV $1012
line 2516
;2515:
;2516:	if (ps->dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1015
line 2517
;2517:	{
line 2518
;2518:		s->bolt2 = 1;
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 2519
;2519:	}
ADDRGP4 $1016
JUMPV
LABELV $1015
line 2521
;2520:	else
;2521:	{
line 2522
;2522:		s->bolt2 = 0;
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 2523
;2523:	}
LABELV $1016
line 2525
;2524:
;2525:	s->otherEntityNum2 = ps->emplacedIndex;
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 2527
;2526:
;2527:	s->shouldtarget = ps->saberHolstered; //reuse bool in entitystate for players differently
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ASGNI4
line 2528
;2528:	s->teamowner = ps->usingATST;
ADDRFP4 4
INDIRP4
CNSTI4 264
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
ASGNI4
line 2530
;2529:
;2530:	if (ps->genericEnemyIndex != -1)
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1017
line 2531
;2531:	{
line 2532
;2532:		s->eFlags |= EF_SEEKERDRONE;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1048576
BORI4
ASGNI4
line 2533
;2533:	}
LABELV $1017
line 2535
;2534:
;2535:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1019
line 2536
;2536:		s->eFlags |= EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2537
;2537:	} else {
ADDRGP4 $1020
JUMPV
LABELV $1019
line 2538
;2538:		s->eFlags &= ~EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2539
;2539:	}
LABELV $1020
line 2541
;2540:
;2541:	if ( ps->externalEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1021
line 2542
;2542:		s->event = ps->externalEvent;
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 2543
;2543:		s->eventParm = ps->externalEventParm;
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ASGNI4
line 2544
;2544:	} else if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRGP4 $1022
JUMPV
LABELV $1021
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
GEI4 $1023
line 2547
;2545:		int		seq;
;2546:
;2547:		if ( ps->entityEventSequence < ps->eventSequence - MAX_PS_EVENTS) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $1025
line 2548
;2548:			ps->entityEventSequence = ps->eventSequence - MAX_PS_EVENTS;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2549
;2549:		}
LABELV $1025
line 2550
;2550:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 2551
;2551:		s->event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 2552
;2552:		s->eventParm = ps->eventParms[ seq ];
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDP4
INDIRI4
ASGNI4
line 2553
;2553:		ps->entityEventSequence++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2554
;2554:	}
LABELV $1023
LABELV $1022
line 2557
;2555:
;2556:
;2557:	s->weapon = ps->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 2558
;2558:	s->groundEntityNum = ps->groundEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 2560
;2559:
;2560:	s->powerups = 0;
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 2561
;2561:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1027
line 2562
;2562:		if ( ps->powerups[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1031
line 2563
;2563:			s->powerups |= 1 << i;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 2564
;2564:		}
LABELV $1031
line 2565
;2565:	}
LABELV $1028
line 2561
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1027
line 2567
;2566:
;2567:	s->loopSound = ps->loopSound;
ADDRFP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
ASGNI4
line 2568
;2568:	s->generic1 = ps->generic1;
ADDRFP4 4
INDIRP4
CNSTI4 292
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
ASGNI4
line 2571
;2569:
;2570:	//NOT INCLUDED IN ENTITYSTATETOPLAYERSTATE:
;2571:	s->modelindex2 = ps->weaponstate;
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 2572
;2572:	s->constantLight = ps->weaponChargeTime;
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 2574
;2573:
;2574:	VectorCopy(ps->lastHitLoc, s->origin2);
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1368
ADDP4
INDIRB
ASGNB 12
line 2576
;2575:
;2576:	s->isJediMaster = ps->isJediMaster;
ADDRFP4 4
INDIRP4
CNSTI4 244
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 2578
;2577:
;2578:	s->time2 = ps->holocronBits;
ADDRFP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ASGNI4
line 2580
;2579:
;2580:	s->fireflag = ps->fd.saberAnimLevel;
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 2581
;2581:}
LABELV $1001
endproc BG_PlayerStateToEntityState 28 0
export BG_PlayerStateToEntityStateExtraPolate
proc BG_PlayerStateToEntityStateExtraPolate 28 0
line 2591
;2582:
;2583:/*
;2584:========================
;2585:BG_PlayerStateToEntityStateExtraPolate
;2586:
;2587:This is done after each set of usercmd_t on the server,
;2588:and after local prediction on the client
;2589:========================
;2590:*/
;2591:void BG_PlayerStateToEntityStateExtraPolate( playerState_t *ps, entityState_t *s, int time, qboolean snap ) {
line 2594
;2592:	int		i;
;2593:
;2594:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPECTATOR ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 6
EQI4 $1036
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $1034
LABELV $1036
line 2595
;2595:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 2596
;2596:	} else if ( ps->stats[STAT_HEALTH] <= GIB_HEALTH ) {
ADDRGP4 $1035
JUMPV
LABELV $1034
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $1037
line 2597
;2597:		s->eType = ET_INVISIBLE;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 2598
;2598:	} else {
ADDRGP4 $1038
JUMPV
LABELV $1037
line 2599
;2599:		s->eType = ET_PLAYER;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 2600
;2600:	}
LABELV $1038
LABELV $1035
line 2602
;2601:
;2602:	s->number = ps->clientNum;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 2604
;2603:
;2604:	s->pos.trType = TR_LINEAR_STOP;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 2605
;2605:	VectorCopy( ps->origin, s->pos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2606
;2606:	if ( snap ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1039
line 2607
;2607:		SnapVector( s->pos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2608
;2608:	}
LABELV $1039
line 2610
;2609:	// set the trDelta for flag direction and linear prediction
;2610:	VectorCopy( ps->velocity, s->pos.trDelta );
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2612
;2611:	// set the time for linear prediction
;2612:	s->pos.trTime = time;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 2614
;2613:	// set maximum extra polation time
;2614:	s->pos.trDuration = 50; // 1000 / sv_fps (default = 20)
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 50
ASGNI4
line 2616
;2615:
;2616:	s->apos.trType = TR_INTERPOLATE;
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 1
ASGNI4
line 2617
;2617:	VectorCopy( ps->viewangles, s->apos.trBase );
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2618
;2618:	if ( snap ) {
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1041
line 2619
;2619:		SnapVector( s->apos.trBase );
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2620
;2620:	}
LABELV $1041
line 2622
;2621:
;2622:	s->trickedentindex = ps->fd.forceMindtrickTargetIndex;
ADDRFP4 4
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ASGNI4
line 2623
;2623:	s->trickedentindex2 = ps->fd.forceMindtrickTargetIndex2;
ADDRFP4 4
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ASGNI4
line 2624
;2624:	s->trickedentindex3 = ps->fd.forceMindtrickTargetIndex3;
ADDRFP4 4
INDIRP4
CNSTI4 156
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ASGNI4
line 2625
;2625:	s->trickedentindex4 = ps->fd.forceMindtrickTargetIndex4;
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1168
ADDP4
INDIRI4
ASGNI4
line 2627
;2626:
;2627:	s->forceFrame = ps->saberLockFrame;
ADDRFP4 4
INDIRP4
CNSTI4 288
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 2629
;2628:
;2629:	s->emplacedOwner = ps->electrifyTime;
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ASGNI4
line 2631
;2630:
;2631:	s->speed = ps->speed;
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2633
;2632:
;2633:	s->genericenemyindex = ps->genericEnemyIndex;
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 2635
;2634:
;2635:	s->activeForcePass = ps->activeForcePass;
ADDRFP4 4
INDIRP4
CNSTI4 176
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ASGNI4
line 2637
;2636:
;2637:	s->angles2[YAW] = ps->movementDir;
ADDRFP4 4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2638
;2638:	s->legsAnim = ps->legsAnim;
ADDRFP4 4
INDIRP4
CNSTI4 280
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 2639
;2639:	s->torsoAnim = ps->torsoAnim;
ADDRFP4 4
INDIRP4
CNSTI4 284
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
line 2640
;2640:	s->clientNum = ps->clientNum;		// ET_PLAYER looks here instead of at number
ADDRFP4 4
INDIRP4
CNSTI4 220
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 2642
;2641:										// so corpses can also reference the proper config
;2642:	s->eFlags = ps->eFlags;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 2644
;2643:
;2644:	s->saberInFlight = ps->saberInFlight;
ADDRFP4 4
INDIRP4
CNSTI4 228
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ASGNI4
line 2645
;2645:	s->saberEntityNum = ps->saberEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 232
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 2646
;2646:	s->saberMove = ps->saberMove;
ADDRFP4 4
INDIRP4
CNSTI4 236
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 2647
;2647:	s->forcePowersActive = ps->fd.forcePowersActive;
ADDRFP4 4
INDIRP4
CNSTI4 240
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ASGNI4
line 2649
;2648:
;2649:	if (ps->duelInProgress)
ADDRFP4 0
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1043
line 2650
;2650:	{
line 2651
;2651:		s->bolt1 = 1;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 1
ASGNI4
line 2652
;2652:	}
ADDRGP4 $1044
JUMPV
LABELV $1043
line 2654
;2653:	else
;2654:	{
line 2655
;2655:		s->bolt1 = 0;
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 0
ASGNI4
line 2656
;2656:	}
LABELV $1044
line 2658
;2657:
;2658:	if (ps->dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1045
line 2659
;2659:	{
line 2660
;2660:		s->bolt2 = 1;
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 2661
;2661:	}
ADDRGP4 $1046
JUMPV
LABELV $1045
line 2663
;2662:	else
;2663:	{
line 2664
;2664:		s->bolt2 = 0;
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 2665
;2665:	}
LABELV $1046
line 2667
;2666:
;2667:	s->otherEntityNum2 = ps->emplacedIndex;
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 2669
;2668:
;2669:	s->shouldtarget = ps->saberHolstered; //reuse bool in entitystate for players differently
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ASGNI4
line 2670
;2670:	s->teamowner = ps->usingATST;
ADDRFP4 4
INDIRP4
CNSTI4 264
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
ASGNI4
line 2672
;2671:
;2672:	if (ps->genericEnemyIndex != -1)
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1047
line 2673
;2673:	{
line 2674
;2674:		s->eFlags |= EF_SEEKERDRONE;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1048576
BORI4
ASGNI4
line 2675
;2675:	}
LABELV $1047
line 2677
;2676:
;2677:	if ( ps->stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1049
line 2678
;2678:		s->eFlags |= EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2679
;2679:	} else {
ADDRGP4 $1050
JUMPV
LABELV $1049
line 2680
;2680:		s->eFlags &= ~EF_DEAD;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2681
;2681:	}
LABELV $1050
line 2683
;2682:
;2683:	if ( ps->externalEvent ) {
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1051
line 2684
;2684:		s->event = ps->externalEvent;
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 2685
;2685:		s->eventParm = ps->externalEventParm;
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ASGNI4
line 2686
;2686:	} else if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRGP4 $1052
JUMPV
LABELV $1051
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
GEI4 $1053
line 2689
;2687:		int		seq;
;2688:
;2689:		if ( ps->entityEventSequence < ps->eventSequence - MAX_PS_EVENTS) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $1055
line 2690
;2690:			ps->entityEventSequence = ps->eventSequence - MAX_PS_EVENTS;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 2691
;2691:		}
LABELV $1055
line 2692
;2692:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 2693
;2693:		s->event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 2694
;2694:		s->eventParm = ps->eventParms[ seq ];
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDP4
INDIRI4
ASGNI4
line 2695
;2695:		ps->entityEventSequence++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2696
;2696:	}
LABELV $1053
LABELV $1052
line 2697
;2697:	s->weapon = ps->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 2698
;2698:	s->groundEntityNum = ps->groundEntityNum;
ADDRFP4 4
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 2700
;2699:
;2700:	s->powerups = 0;
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 2701
;2701:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1057
line 2702
;2702:		if ( ps->powerups[ i ] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1061
line 2703
;2703:			s->powerups |= 1 << i;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 272
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 2704
;2704:		}
LABELV $1061
line 2705
;2705:	}
LABELV $1058
line 2701
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1057
line 2707
;2706:
;2707:	s->loopSound = ps->loopSound;
ADDRFP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
ASGNI4
line 2708
;2708:	s->generic1 = ps->generic1;
ADDRFP4 4
INDIRP4
CNSTI4 292
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
ASGNI4
line 2711
;2709:
;2710:	//NOT INCLUDED IN ENTITYSTATETOPLAYERSTATE:
;2711:	s->modelindex2 = ps->weaponstate;
ADDRFP4 4
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 2712
;2712:	s->constantLight = ps->weaponChargeTime;
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ASGNI4
line 2714
;2713:
;2714:	VectorCopy(ps->lastHitLoc, s->origin2);
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1368
ADDP4
INDIRB
ASGNB 12
line 2716
;2715:
;2716:	s->isJediMaster = ps->isJediMaster;
ADDRFP4 4
INDIRP4
CNSTI4 244
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ASGNI4
line 2718
;2717:
;2718:	s->time2 = ps->holocronBits;
ADDRFP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ASGNI4
line 2720
;2719:
;2720:	s->fireflag = ps->fd.saberAnimLevel;
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 2721
;2721:}
LABELV $1033
endproc BG_PlayerStateToEntityStateExtraPolate 28 0
data
align 4
LABELV bg_poolSize
byte 4 0
align 4
LABELV bg_poolTail
byte 4 2048000
export BG_Alloc
code
proc BG_Alloc 8 16
line 2737
;2722:
;2723:/*
;2724:=============================================================================
;2725:
;2726:PLAYER ANGLES
;2727:
;2728:=============================================================================
;2729:*/
;2730:#define MAX_POOL_SIZE	2048000 //1024000
;2731:
;2732:static char		bg_pool[MAX_POOL_SIZE];
;2733:static int		bg_poolSize = 0;
;2734:static int		bg_poolTail = MAX_POOL_SIZE;
;2735:
;2736:void *BG_Alloc ( int size )
;2737:{
line 2738
;2738:	bg_poolSize = PAD(bg_poolSize, sizeof(void *));
ADDRLP4 0
ADDRGP4 bg_poolSize
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CVIU4 4
CNSTU4 4
ADDU4
CNSTU4 1
SUBU4
CNSTU4 4294967292
BANDU4
CVUI4 4
ASGNI4
line 2740
;2739:
;2740:	if (bg_poolSize + size > bg_poolTail)
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ADDRGP4 bg_poolTail
INDIRI4
LEI4 $1064
line 2741
;2741:	{
line 2742
;2742:		Com_Error( ERR_DROP, "BG_Alloc: buffer exceeded tail (%d > %d)", bg_poolSize + size, bg_poolTail);
CNSTI4 1
ARGI4
ADDRGP4 $1066
ARGP4
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ARGI4
ADDRGP4 bg_poolTail
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 2743
;2743:		return 0;
CNSTP4 0
RETP4
ADDRGP4 $1063
JUMPV
LABELV $1064
line 2746
;2744:	}
;2745:
;2746:	bg_poolSize += size;
ADDRLP4 4
ADDRGP4 bg_poolSize
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 2748
;2747:
;2748:	return &bg_pool[bg_poolSize-size];
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ADDRGP4 bg_pool
ADDP4
RETP4
LABELV $1063
endproc BG_Alloc 8 16
export BG_AllocUnaligned
proc BG_AllocUnaligned 4 16
line 2752
;2749:}
;2750:
;2751:void *BG_AllocUnaligned ( int size )
;2752:{
line 2753
;2753:	if (bg_poolSize + size > bg_poolTail)
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ADDRGP4 bg_poolTail
INDIRI4
LEI4 $1068
line 2754
;2754:	{
line 2755
;2755:		Com_Error( ERR_DROP, "BG_AllocUnaligned: buffer exceeded tail (%d > %d)", bg_poolSize + size, bg_poolTail);
CNSTI4 1
ARGI4
ADDRGP4 $1070
ARGP4
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ARGI4
ADDRGP4 bg_poolTail
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 2756
;2756:		return 0;
CNSTP4 0
RETP4
ADDRGP4 $1067
JUMPV
LABELV $1068
line 2759
;2757:	}
;2758:
;2759:	bg_poolSize += size;
ADDRLP4 0
ADDRGP4 bg_poolSize
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 2761
;2760:
;2761:	return &bg_pool[bg_poolSize-size];
ADDRGP4 bg_poolSize
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ADDRGP4 bg_pool
ADDP4
RETP4
LABELV $1067
endproc BG_AllocUnaligned 4 16
export BG_TempAlloc
proc BG_TempAlloc 4 16
line 2765
;2762:}
;2763:
;2764:void *BG_TempAlloc( int size )
;2765:{
line 2766
;2766:	size = PAD(size, sizeof(void *));
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVIU4 4
CNSTU4 4
ADDU4
CNSTU4 1
SUBU4
CNSTU4 4294967292
BANDU4
CVUI4 4
ASGNI4
line 2768
;2767:
;2768:	if (bg_poolTail - size < bg_poolSize)
ADDRGP4 bg_poolTail
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ADDRGP4 bg_poolSize
INDIRI4
GEI4 $1072
line 2769
;2769:	{
line 2770
;2770:		Com_Error( ERR_DROP, "BG_TempAlloc: buffer exceeded head (%d > %d)", bg_poolTail - size, bg_poolSize);
CNSTI4 1
ARGI4
ADDRGP4 $1074
ARGP4
ADDRGP4 bg_poolTail
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 bg_poolSize
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 2771
;2771:		return 0;
CNSTP4 0
RETP4
ADDRGP4 $1071
JUMPV
LABELV $1072
line 2774
;2772:	}
;2773:
;2774:	bg_poolTail -= size;
ADDRLP4 0
ADDRGP4 bg_poolTail
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 2776
;2775:
;2776:	return &bg_pool[bg_poolTail];
ADDRGP4 bg_poolTail
INDIRI4
ADDRGP4 bg_pool
ADDP4
RETP4
LABELV $1071
endproc BG_TempAlloc 4 16
export BG_TempAllocTry
proc BG_TempAllocTry 4 0
line 2780
;2777:}
;2778:
;2779:void *BG_TempAllocTry( int size )
;2780:{
line 2781
;2781:	size = PAD(size, sizeof(void *));
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVIU4 4
CNSTU4 4
ADDU4
CNSTU4 1
SUBU4
CNSTU4 4294967292
BANDU4
CVUI4 4
ASGNI4
line 2783
;2782:
;2783:	if (bg_poolTail - size < bg_poolSize)
ADDRGP4 bg_poolTail
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ADDRGP4 bg_poolSize
INDIRI4
GEI4 $1076
line 2784
;2784:	{
line 2785
;2785:		return 0;
CNSTP4 0
RETP4
ADDRGP4 $1075
JUMPV
LABELV $1076
line 2788
;2786:	}
;2787:
;2788:	bg_poolTail -= size;
ADDRLP4 0
ADDRGP4 bg_poolTail
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 2790
;2789:
;2790:	return &bg_pool[bg_poolTail];
ADDRGP4 bg_poolTail
INDIRI4
ADDRGP4 bg_pool
ADDP4
RETP4
LABELV $1075
endproc BG_TempAllocTry 4 0
export BG_TempFree
proc BG_TempFree 4 16
line 2794
;2791:}
;2792:
;2793:void BG_TempFree( int size )
;2794:{
line 2795
;2795:	size = PAD(size, sizeof(void *));
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVIU4 4
CNSTU4 4
ADDU4
CNSTU4 1
SUBU4
CNSTU4 4294967292
BANDU4
CVUI4 4
ASGNI4
line 2797
;2796:
;2797:	if (bg_poolTail+size > MAX_POOL_SIZE)
ADDRGP4 bg_poolTail
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
CNSTI4 2048000
LEI4 $1079
line 2798
;2798:	{
line 2799
;2799:		Com_Error( ERR_DROP, "BG_TempFree: tail greater than size (%d > %d)", bg_poolTail+size, MAX_POOL_SIZE );
CNSTI4 1
ARGI4
ADDRGP4 $1081
ARGP4
ADDRGP4 bg_poolTail
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ARGI4
CNSTI4 2048000
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 2800
;2800:	}
LABELV $1079
line 2802
;2801:
;2802:	bg_poolTail += size;
ADDRLP4 0
ADDRGP4 bg_poolTail
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
ASGNI4
line 2803
;2803:}
LABELV $1078
endproc BG_TempFree 4 16
export BG_StringAlloc
proc BG_StringAlloc 16 12
line 2806
;2804:
;2805:char *BG_StringAlloc ( const char *source )
;2806:{
line 2808
;2807:	char *dest;
;2808:	int size = strlen(source) + 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 4
ADDRLP4 8
INDIRU4
CNSTU4 1
ADDU4
CVUI4 4
ASGNI4
line 2810
;2809:
;2810:	dest = BG_Alloc (size);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 2811
;2811:	Q_strncpyz ( dest, source, size);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2812
;2812:	return dest;
ADDRLP4 0
INDIRP4
RETP4
LABELV $1082
endproc BG_StringAlloc 16 12
export BG_OutOfMemory
proc BG_OutOfMemory 4 0
line 2816
;2813:}
;2814:
;2815:qboolean BG_OutOfMemory ( void )
;2816:{
line 2817
;2817:	return bg_poolSize >= MAX_POOL_SIZE;
ADDRGP4 bg_poolSize
INDIRI4
CNSTI4 2048000
LTI4 $1085
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $1086
JUMPV
LABELV $1085
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1086
ADDRLP4 0
INDIRI4
RETI4
LABELV $1083
endproc BG_OutOfMemory 4 0
proc BG_SwingAngles 32 8
line 2822
;2818:}
;2819:
;2820:// MVSDK: 1.03 bg_misc.c functions (restored)
;2821:static void BG_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;2822:			float speed, float *angle, qboolean *swinging, int frameTime ) {
line 2824
;2823:	float swing, move, scale;
;2824:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1088
line 2825
;2825:		swing = AngleSubtract( *angle, destination );
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 2826
;2826:		if ( swing > swingTolerance || swing < -swingTolerance ) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $1092
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $1090
LABELV $1092
line 2827
;2827:			*swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 2828
;2828:		}
LABELV $1090
line 2829
;2829:	}
LABELV $1088
line 2830
;2830:	if ( !*swinging ) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1093
line 2831
;2831:		return;
ADDRGP4 $1087
JUMPV
LABELV $1093
line 2833
;2832:	}
;2833:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 2834
;2834:	scale = fabs( swing );
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 2835
;2835:	if ( scale < swingTolerance * 0.5f ) scale = 0.5f;
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRFP4 4
INDIRF4
MULF4
GEF4 $1095
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
ADDRGP4 $1096
JUMPV
LABELV $1095
line 2836
;2836:	else if ( scale < swingTolerance ) scale = 1.0f;
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $1097
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRGP4 $1098
JUMPV
LABELV $1097
line 2837
;2837:	else scale = 2.0f;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
LABELV $1098
LABELV $1096
line 2838
;2838:	if ( swing >= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $1099
line 2839
;2839:		move = frameTime * scale * speed;
ADDRLP4 8
ADDRFP4 24
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 2840
;2840:		if ( move >= swing ) { move = swing; *swinging = qfalse; }
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $1101
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1101
line 2841
;2841:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2842
;2842:	} else {
ADDRGP4 $1100
JUMPV
LABELV $1099
line 2843
;2843:		move = frameTime * scale * -speed;
ADDRLP4 8
ADDRFP4 24
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
NEGF4
MULF4
ASGNF4
line 2844
;2844:		if ( move <= swing ) { move = swing; *swinging = qfalse; }
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $1103
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1103
line 2845
;2845:		*angle = AngleMod( *angle + move );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2846
;2846:	}
LABELV $1100
line 2847
;2847:	swing = AngleSubtract( destination, *angle );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 2848
;2848:	if ( swing > clampTolerance ) *angle = AngleMod( destination - (clampTolerance - 1) );
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $1105
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRGP4 $1106
JUMPV
LABELV $1105
line 2849
;2849:	else if ( swing < -clampTolerance ) *angle = AngleMod( destination + (clampTolerance - 1) );
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $1107
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 28
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 28
INDIRF4
ASGNF4
LABELV $1107
LABELV $1106
line 2850
;2850:}
LABELV $1087
endproc BG_SwingAngles 32 8
proc BG_AddPainTwitch 16 0
line 2853
;2851:
;2852:#define PAIN_TWITCH_TIME 200
;2853:static void BG_AddPainTwitch( int painTime, int painDirection, int currentTime, vec3_t torsoAngles ) {
line 2854
;2854:	int t = currentTime - painTime; float f; if ( t >= PAIN_TWITCH_TIME ) return; f = 1.0f - (float)t / PAIN_TWITCH_TIME; if ( painDirection ) torsoAngles[ROLL] += 20 * f; else torsoAngles[ROLL] -= 20 * f;
ADDRLP4 0
ADDRFP4 8
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $1110
ADDRGP4 $1109
JUMPV
LABELV $1110
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1128792064
DIVF4
SUBF4
ASGNF4
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1112
ADDRLP4 8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1113
JUMPV
LABELV $1112
ADDRLP4 12
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1101004800
ADDRLP4 4
INDIRF4
MULF4
SUBF4
ASGNF4
LABELV $1113
line 2855
;2855:}
LABELV $1109
endproc BG_AddPainTwitch 16 0
data
align 4
LABELV $1115
byte 4 0
byte 4 22
byte 4 45
byte 4 -22
byte 4 0
byte 4 22
byte 4 -45
byte 4 -22
export BG_G2PlayerAngles
code
proc BG_G2PlayerAngles 120 28
line 2859
;2856:
;2857:void BG_G2PlayerAngles( vec3_t startAngles, vec3_t legs[3], vec3_t legsAngles, int painTime, int painDirection, int currentTime,
;2858:		qboolean *torso_yawing, float *torso_yawAngle, qboolean *torso_pitching, float *torso_pitchAngle, qboolean *legs_yawing, float *legs_yawAngle,
;2859:		int frameTime, vec3_t velocity, int legsAnim, int torsoAnim, qboolean dead, float movementDir, void *ghoul2, qhandle_t *modelList, int weapon) {
line 2861
;2860:	vec3_t torsoAngles, headAngles; float dest; static int movementOffsets[8] = {0,22,45,-22,0,22,-45,-22}; float speed; int dir;
;2861:	VectorCopy( startAngles, headAngles ); headAngles[YAW] = AngleMod( headAngles[YAW] ); VectorClear( legsAngles ); VectorClear( torsoAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 48
INDIRF4
ASGNF4
line 2862
;2862:	if ( ( legsAnim & ~ANIM_TOGGLEBIT ) != WeaponReadyAnim[weapon] || ( torsoAnim & ~ANIM_TOGGLEBIT ) != WeaponReadyAnim[weapon] ) {
ADDRLP4 52
CNSTI4 -2049
ASGNI4
ADDRLP4 56
ADDRFP4 80
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ASGNI4
ADDRFP4 56
INDIRI4
ADDRLP4 52
INDIRI4
BANDI4
ADDRLP4 56
INDIRI4
NEI4 $1122
ADDRFP4 60
INDIRI4
ADDRLP4 52
INDIRI4
BANDI4
ADDRLP4 56
INDIRI4
EQI4 $1120
LABELV $1122
line 2863
;2863:		*torso_yawing = qtrue; *torso_pitching = qtrue; *legs_yawing = qtrue; }
ADDRFP4 24
INDIRP4
CNSTI4 1
ASGNI4
ADDRFP4 32
INDIRP4
CNSTI4 1
ASGNI4
ADDRFP4 40
INDIRP4
CNSTI4 1
ASGNI4
LABELV $1120
line 2864
;2864:	if ( dead ) dir = 0; else dir = movementDir; legsAngles[YAW] = headAngles[YAW] + movementOffsets[dir]; torsoAngles[YAW] = headAngles[YAW] + 0.25f * movementOffsets[dir];
ADDRFP4 64
INDIRI4
CNSTI4 0
EQI4 $1123
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRGP4 $1124
JUMPV
LABELV $1123
ADDRLP4 28
ADDRFP4 68
INDIRF4
CVFI4 4
ASGNI4
LABELV $1124
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12+4
INDIRF4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1115
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1115
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 2865
;2865:	BG_SwingAngles( torsoAngles[YAW], 25, 90, 0.3f, torso_yawAngle, torso_yawing, frameTime ); BG_SwingAngles( legsAngles[YAW], 40, 90, 0.3f, legs_yawAngle, legs_yawing, frameTime );
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1050253722
ARGF4
ADDRFP4 28
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 BG_SwingAngles
CALLV
pop
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1050253722
ARGF4
ADDRFP4 44
INDIRP4
ARGP4
ADDRFP4 40
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 BG_SwingAngles
CALLV
pop
line 2866
;2866:	torsoAngles[YAW] = *torso_yawAngle; legsAngles[YAW] = *legs_yawAngle;
ADDRLP4 0+4
ADDRFP4 28
INDIRP4
INDIRF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 44
INDIRP4
INDIRF4
ASGNF4
line 2867
;2867:	if ( headAngles[PITCH] > 180 ) dest = (-360 + headAngles[PITCH]) * 0.75f; else dest = headAngles[PITCH] * 0.75f; BG_SwingAngles( dest, 15, 30, 0.1f, torso_pitchAngle, torso_pitching, frameTime ); torsoAngles[PITCH] = *torso_pitchAngle;
ADDRLP4 12
INDIRF4
CNSTF4 1127481344
LEF4 $1130
ADDRLP4 32
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
ADDRGP4 $1131
JUMPV
LABELV $1130
ADDRLP4 32
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
LABELV $1131
ADDRLP4 32
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRFP4 36
INDIRP4
ARGP4
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 48
INDIRI4
ARGI4
ADDRGP4 BG_SwingAngles
CALLV
pop
ADDRLP4 0
ADDRFP4 36
INDIRP4
INDIRF4
ASGNF4
line 2868
;2868:	speed = VectorNormalize( velocity ); if ( speed ) { vec3_t axis[3]; float side; speed *= 0.05f; AnglesToAxis( legsAngles, axis ); side = speed * DotProduct( velocity, axis[1] ); legsAngles[ROLL] -= side; side = speed * DotProduct( velocity, axis[0] ); legsAngles[PITCH] += side; }
ADDRFP4 52
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $1132
ADDRLP4 24
CNSTF4 1028443341
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
ADDRLP4 104
ADDRFP4 52
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 24
INDIRF4
ADDRLP4 104
INDIRP4
INDIRF4
ADDRLP4 64+12
INDIRF4
MULF4
ADDRLP4 104
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 64+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 104
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 64+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
ADDRLP4 100
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112
ADDRFP4 52
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 24
INDIRF4
ADDRLP4 112
INDIRP4
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 64+4
INDIRF4
MULF4
ADDF4
ADDRLP4 112
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 64+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
ADDRLP4 116
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 100
INDIRF4
ADDF4
ASGNF4
LABELV $1132
line 2869
;2869:	BG_AddPainTwitch( painTime, painDirection, currentTime, torsoAngles );
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_AddPainTwitch
CALLV
pop
line 2870
;2870:	AnglesSubtract( headAngles, torsoAngles, headAngles ); AnglesSubtract( torsoAngles, legsAngles, torsoAngles ); AnglesToAxis( legsAngles, legs );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2871
;2871:}
LABELV $1114
endproc BG_G2PlayerAngles 120 28
export BG_DB_VerifyPassword
proc BG_DB_VerifyPassword 28 8
line 2873
;2872:
;2873:qboolean BG_DB_VerifyPassword(const char* password, int clientNumNotify) {
line 2874
;2874:	const char* s = password;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 2875
;2875:	int len = strlen(password);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 4
ADDRLP4 8
INDIRU4
CVUI4 4
ASGNI4
line 2876
;2876:	if (len < PASSWORD_MIN_LEN) {
ADDRLP4 4
INDIRI4
CNSTI4 6
GEI4 $1142
line 2877
;2877:		if (clientNumNotify > -2) {
ADDRFP4 4
INDIRI4
CNSTI4 -2
LEI4 $1144
line 2879
;2878:#if JK2_GAME
;2879:			trap_SendServerCommand(clientNumNotify, va("print \"^1Chosen password is too short. Minimum %d characters.\n\"", PASSWORD_MIN_LEN));
ADDRGP4 $1146
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2883
;2880:#elif JK2_CGAME
;2881:			CG_Printf("^1Chosen password is too short. Minimum %d characters.\n", PASSWORD_MIN_LEN);
;2882:#endif
;2883:		}
LABELV $1144
line 2884
;2884:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1141
JUMPV
LABELV $1142
line 2886
;2885:	}
;2886:	if (len > PASSWORD_MAX_LEN) {
ADDRLP4 4
INDIRI4
CNSTI4 50
LEI4 $1153
line 2887
;2887:		if (clientNumNotify > -2) {
ADDRFP4 4
INDIRI4
CNSTI4 -2
LEI4 $1149
line 2889
;2888:#if JK2_GAME
;2889:			trap_SendServerCommand(clientNumNotify, va("print \"^1Chosen password is too long. Maximum %d characters.\n\"", PASSWORD_MAX_LEN));
ADDRGP4 $1151
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2893
;2890:#elif JK2_CGAME
;2891:			CG_Printf("^1Chosen password is too long. Maximum %d characters.\n", PASSWORD_MAX_LEN);
;2892:#endif
;2893:		}
LABELV $1149
line 2894
;2894:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1141
JUMPV
LABELV $1152
line 2897
;2895:	}
;2896:
;2897:	while (*s != '\0') {
line 2898
;2898:		if (*s >= 'a' && *s <= 'z'
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 97
LTI4 $1158
ADDRLP4 12
INDIRI4
CNSTI4 122
LEI4 $1185
LABELV $1158
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 65
LTI4 $1160
ADDRLP4 16
INDIRI4
CNSTI4 90
LEI4 $1185
LABELV $1160
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 48
LTI4 $1162
ADDRLP4 20
INDIRI4
CNSTI4 57
LEI4 $1185
LABELV $1162
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 95
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 45
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 46
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 47
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 91
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 93
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 40
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 41
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 60
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 62
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 61
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 58
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 59
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 43
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 42
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 33
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 35
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 36
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 38
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 64
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 44
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 63
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 124
EQI4 $1185
ADDRLP4 24
INDIRI4
CNSTI4 39
NEI4 $1155
LABELV $1185
line 2925
;2899:			|| *s >= 'A' && *s <= 'Z'
;2900:			|| *s >= '0' && *s <= '9'
;2901:			|| *s == '_'
;2902:			|| *s == '-'
;2903:			|| *s == '.'
;2904:			|| *s == '/' // pws allow aa bit more leeway than usernames, as they will never be used plaintext, and more possible chars means more security
;2905:			|| *s == '[' // cant allow % because netcode wont send it properly, nor ascii codes above 127
;2906:			|| *s == ']' // cant allow " because it would break the command
;2907:			|| *s == '(' // cant allow ^ because it would be annoying to type colored passwords
;2908:			|| *s == ')' // cant allow ` or ~ because console may not allow to type them
;2909:			|| *s == '<' // someone COULD of course try it with a .cfg file but let's keep things such that they can be typed ingame
;2910:			|| *s == '>'
;2911:			|| *s == '='
;2912:			|| *s == ':'
;2913:			|| *s == ';'
;2914:			|| *s == '+'
;2915:			|| *s == '*'
;2916:			|| *s == '!'
;2917:			|| *s == '#'
;2918:			|| *s == '$'
;2919:			|| *s == '&'
;2920:			|| *s == '@'
;2921:			|| *s == ','
;2922:			|| *s == '?'
;2923:			|| *s == '|'
;2924:			|| *s == '\''
;2925:			) {
line 2927
;2926:			// whitelist. ok.
;2927:		}
ADDRGP4 $1156
JUMPV
LABELV $1155
line 2928
;2928:		else {
line 2929
;2929:			if (clientNumNotify > -2) {
ADDRFP4 4
INDIRI4
CNSTI4 -2
LEI4 $1186
line 2931
;2930:#if JK2_GAME
;2931:				trap_SendServerCommand(clientNumNotify, "print \"^1Chosen password contains invalid characters. Allowed characters: A-Z a-z 0-9 _-.,/[]()<>=:;+*!#$&@'?| and no empty spaces.\n\"");
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1188
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2935
;2932:#elif JK2_CGAME
;2933:				Com_Printf("^1Chosen password contains invalid characters. Allowed characters: A-Z a-z 0-9 _-.,/[]()<>=:;+*!#$&@'?| and no empty spaces.\n");
;2934:#endif
;2935:			}
LABELV $1186
line 2936
;2936:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1141
JUMPV
LABELV $1156
line 2938
;2937:		}
;2938:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2939
;2939:	}
LABELV $1153
line 2897
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1152
line 2940
;2940:	return qtrue;
CNSTI4 1
RETI4
LABELV $1141
endproc BG_DB_VerifyPassword 28 8
bss
align 1
LABELV bg_pool
skip 2048000
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
import PM_SetGroundEntityNum
import PM_SetForceJumpZStart
import PM_SetSaberMove
import PM_WeaponLightsaber
import PM_SetAnim
import PM_FinishWeaponChange
import PM_BeginWeaponChange
import PM_ForceLegsAnim
import PM_ContinueLegsAnim
import PM_StartTorsoAnim
import PM_StepSlideMove
import PM_SlideMove
import PM_AddEvent
import PM_AddTouchEnt
import PM_ClipVelocity
import PM_SaberJumpAttackMove
import PM_SaberFlipOverAttackMove
import PM_SomeoneInFront
import PM_GroundDistance
import PM_GetSaberStance
import PM_AnimLength
import PM_InRollComplete
import PM_InOnGroundAnim
import PM_SpinningAnim
import PM_LandingAnim
import PM_JumpingAnim
import PM_PainAnim
import PM_InKnockDown
import PM_InSaberAnim
import PM_SaberInStart
import PM_SaberInReflect
import PM_SaberInKnockaway
import PM_SaberInParry
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import forcePowerNeeded
import forcePowerNeeded_1_04
import forcePowerNeeded_1_02
import c_pmove
import pm_flightfriction
import pm_waterfriction
import pm_friction
import pm_flyaccelerate
import pm_wateraccelerate
import pm_airaccelerate
import pm_accelerate
import pm_wadeScale
import pm_swimScale
import pm_duckScale
import pm_stopspeed
import pml
import MV_SetGamePlay
import MV_BuildAnimationMappingTable
import animMappingTable_1_02_to_1_04
import animMappingTable_1_04_to_1_02
import jk2startversion
import jk2gameplay
import jk2version
import g_arenaInfosHashed
import g_numArenas
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
import BG_ParseAnimationFile
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
import saberMoveData
import Pmove
import PM_UpdateViewAngles
import pm
import bgAllAnims
import bgGlobalAnimations
import BGPAFtextLoaded
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
LABELV $1188
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
byte 1 104
byte 1 111
byte 1 115
byte 1 101
byte 1 110
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
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
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 65
byte 1 45
byte 1 90
byte 1 32
byte 1 97
byte 1 45
byte 1 122
byte 1 32
byte 1 48
byte 1 45
byte 1 57
byte 1 32
byte 1 95
byte 1 45
byte 1 46
byte 1 44
byte 1 47
byte 1 91
byte 1 93
byte 1 40
byte 1 41
byte 1 60
byte 1 62
byte 1 61
byte 1 58
byte 1 59
byte 1 43
byte 1 42
byte 1 33
byte 1 35
byte 1 36
byte 1 38
byte 1 64
byte 1 39
byte 1 63
byte 1 124
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1151
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
byte 1 104
byte 1 111
byte 1 115
byte 1 101
byte 1 110
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 77
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1146
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
byte 1 104
byte 1 111
byte 1 115
byte 1 101
byte 1 110
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 46
byte 1 32
byte 1 77
byte 1 105
byte 1 110
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1081
byte 1 66
byte 1 71
byte 1 95
byte 1 84
byte 1 101
byte 1 109
byte 1 112
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 32
byte 1 62
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $1074
byte 1 66
byte 1 71
byte 1 95
byte 1 84
byte 1 101
byte 1 109
byte 1 112
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 58
byte 1 32
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 32
byte 1 62
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $1070
byte 1 66
byte 1 71
byte 1 95
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 85
byte 1 110
byte 1 97
byte 1 108
byte 1 105
byte 1 103
byte 1 110
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 32
byte 1 62
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $1066
byte 1 66
byte 1 71
byte 1 95
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 58
byte 1 32
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 32
byte 1 62
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 0
align 1
LABELV $801
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 79
byte 1 68
byte 1 89
byte 1 95
byte 1 81
byte 1 85
byte 1 69
byte 1 85
byte 1 69
byte 1 95
byte 1 67
byte 1 79
byte 1 80
byte 1 89
byte 1 0
align 1
LABELV $800
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 80
byte 1 65
byte 1 84
byte 1 82
byte 1 79
byte 1 76
byte 1 0
align 1
LABELV $799
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 71
byte 1 85
byte 1 65
byte 1 82
byte 1 68
byte 1 66
byte 1 65
byte 1 83
byte 1 69
byte 1 0
align 1
LABELV $798
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 71
byte 1 69
byte 1 84
byte 1 70
byte 1 76
byte 1 65
byte 1 71
byte 1 0
align 1
LABELV $797
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 70
byte 1 79
byte 1 76
byte 1 76
byte 1 79
byte 1 87
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $796
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 78
byte 1 79
byte 1 0
align 1
LABELV $795
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 95
byte 1 89
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $794
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 0
align 1
LABELV $793
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 76
byte 1 79
byte 1 79
byte 1 80
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $792
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 79
byte 1 80
byte 1 76
byte 1 79
byte 1 79
byte 1 80
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $791
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 69
byte 1 83
byte 1 84
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 0
align 1
LABELV $790
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 85
byte 1 71
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 0
align 1
LABELV $789
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 72
byte 1 73
byte 1 69
byte 1 76
byte 1 68
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $788
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 71
byte 1 69
byte 1 95
byte 1 65
byte 1 76
byte 1 84
byte 1 0
align 1
LABELV $787
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 71
byte 1 69
byte 1 0
align 1
LABELV $786
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 69
byte 1 84
byte 1 95
byte 1 70
byte 1 79
byte 1 82
byte 1 67
byte 1 69
byte 1 95
byte 1 68
byte 1 73
byte 1 83
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 0
align 1
LABELV $785
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 69
byte 1 84
byte 1 95
byte 1 70
byte 1 82
byte 1 69
byte 1 69
byte 1 95
byte 1 83
byte 1 65
byte 1 66
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $784
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 73
byte 1 86
byte 1 69
byte 1 95
byte 1 78
byte 1 69
byte 1 87
byte 1 95
byte 1 82
byte 1 65
byte 1 78
byte 1 75
byte 1 0
align 1
LABELV $783
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 83
byte 1 84
byte 1 82
byte 1 79
byte 1 89
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 0
align 1
LABELV $782
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 83
byte 1 84
byte 1 82
byte 1 79
byte 1 89
byte 1 95
byte 1 71
byte 1 72
byte 1 79
byte 1 85
byte 1 76
byte 1 50
byte 1 95
byte 1 73
byte 1 78
byte 1 83
byte 1 84
byte 1 65
byte 1 78
byte 1 67
byte 1 69
byte 1 0
align 1
LABELV $781
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 65
byte 1 71
byte 1 65
byte 1 95
byte 1 79
byte 1 66
byte 1 74
byte 1 69
byte 1 67
byte 1 84
byte 1 73
byte 1 86
byte 1 69
byte 1 67
byte 1 79
byte 1 77
byte 1 80
byte 1 76
byte 1 69
byte 1 84
byte 1 69
byte 1 0
align 1
LABELV $780
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 65
byte 1 71
byte 1 65
byte 1 95
byte 1 82
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 79
byte 1 86
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $779
byte 1 69
byte 1 86
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 77
byte 1 69
byte 1 83
byte 1 83
byte 1 65
byte 1 71
byte 1 69
byte 1 0
align 1
LABELV $778
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 67
byte 1 79
byte 1 82
byte 1 69
byte 1 80
byte 1 76
byte 1 85
byte 1 77
byte 1 0
align 1
LABELV $777
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 73
byte 1 66
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $776
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 82
byte 1 67
byte 1 69
byte 1 95
byte 1 68
byte 1 82
byte 1 65
byte 1 73
byte 1 78
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $775
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 66
byte 1 65
byte 1 84
byte 1 84
byte 1 76
byte 1 69
byte 1 83
byte 1 85
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $774
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 85
byte 1 80
byte 1 95
byte 1 81
byte 1 85
byte 1 65
byte 1 68
byte 1 0
align 1
LABELV $773
byte 1 69
byte 1 86
byte 1 95
byte 1 79
byte 1 66
byte 1 73
byte 1 84
byte 1 85
byte 1 65
byte 1 82
byte 1 89
byte 1 0
align 1
LABELV $772
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 51
byte 1 0
align 1
LABELV $771
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 50
byte 1 0
align 1
LABELV $770
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 65
byte 1 84
byte 1 72
byte 1 49
byte 1 0
align 1
LABELV $769
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 65
byte 1 73
byte 1 78
byte 1 0
align 1
LABELV $768
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 85
byte 1 76
byte 1 76
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $767
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $766
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 0
align 1
LABELV $765
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $764
byte 1 69
byte 1 86
byte 1 95
byte 1 68
byte 1 69
byte 1 66
byte 1 82
byte 1 73
byte 1 83
byte 1 0
align 1
LABELV $763
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 65
byte 1 83
byte 1 83
byte 1 95
byte 1 83
byte 1 72
byte 1 65
byte 1 84
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $762
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 95
byte 1 82
byte 1 79
byte 1 70
byte 1 70
byte 1 0
align 1
LABELV $761
byte 1 69
byte 1 86
byte 1 95
byte 1 69
byte 1 78
byte 1 84
byte 1 73
byte 1 84
byte 1 89
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $760
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $759
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $758
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $757
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 85
byte 1 84
byte 1 69
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $756
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 95
byte 1 69
byte 1 70
byte 1 70
byte 1 69
byte 1 67
byte 1 84
byte 1 95
byte 1 73
byte 1 68
byte 1 0
align 1
LABELV $755
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 95
byte 1 69
byte 1 70
byte 1 70
byte 1 69
byte 1 67
byte 1 84
byte 1 0
align 1
LABELV $754
byte 1 69
byte 1 86
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 95
byte 1 83
byte 1 84
byte 1 73
byte 1 67
byte 1 75
byte 1 0
align 1
LABELV $753
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 95
byte 1 66
byte 1 79
byte 1 85
byte 1 78
byte 1 67
byte 1 69
byte 1 0
align 1
LABELV $752
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
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
byte 1 79
byte 1 85
byte 1 84
byte 1 0
align 1
LABELV $751
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
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
byte 1 73
byte 1 78
byte 1 0
align 1
LABELV $750
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 79
byte 1 80
byte 1 0
align 1
LABELV $749
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 82
byte 1 69
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 0
align 1
LABELV $748
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 85
byte 1 83
byte 1 69
byte 1 70
byte 1 65
byte 1 73
byte 1 76
byte 1 0
align 1
LABELV $747
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $746
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 52
byte 1 0
align 1
LABELV $745
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 51
byte 1 0
align 1
LABELV $744
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $743
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 49
byte 1 0
align 1
LABELV $742
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $741
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 57
byte 1 0
align 1
LABELV $740
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 56
byte 1 0
align 1
LABELV $739
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 55
byte 1 0
align 1
LABELV $738
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 54
byte 1 0
align 1
LABELV $737
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 53
byte 1 0
align 1
LABELV $736
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 52
byte 1 0
align 1
LABELV $735
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 51
byte 1 0
align 1
LABELV $734
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 50
byte 1 0
align 1
LABELV $733
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 49
byte 1 0
align 1
LABELV $732
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 48
byte 1 0
align 1
LABELV $731
byte 1 69
byte 1 86
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 0
align 1
LABELV $730
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 67
byte 1 82
byte 1 69
byte 1 69
byte 1 78
byte 1 83
byte 1 72
byte 1 65
byte 1 75
byte 1 69
byte 1 0
align 1
LABELV $729
byte 1 69
byte 1 86
byte 1 95
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 95
byte 1 80
byte 1 79
byte 1 87
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $728
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 82
byte 1 69
byte 1 68
byte 1 69
byte 1 70
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $727
byte 1 69
byte 1 86
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
byte 1 95
byte 1 90
byte 1 79
byte 1 79
byte 1 77
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $726
byte 1 69
byte 1 86
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
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $725
byte 1 69
byte 1 86
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
byte 1 95
byte 1 83
byte 1 78
byte 1 73
byte 1 80
byte 1 69
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 0
align 1
LABELV $724
byte 1 69
byte 1 86
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
byte 1 95
byte 1 83
byte 1 78
byte 1 73
byte 1 80
byte 1 69
byte 1 82
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $723
byte 1 69
byte 1 86
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
byte 1 95
byte 1 77
byte 1 65
byte 1 73
byte 1 78
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 0
align 1
LABELV $722
byte 1 69
byte 1 86
byte 1 95
byte 1 66
byte 1 69
byte 1 67
byte 1 79
byte 1 77
byte 1 69
byte 1 95
byte 1 74
byte 1 69
byte 1 68
byte 1 73
byte 1 77
byte 1 65
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $721
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 65
byte 1 66
byte 1 69
byte 1 82
byte 1 95
byte 1 85
byte 1 78
byte 1 72
byte 1 79
byte 1 76
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $720
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 65
byte 1 66
byte 1 69
byte 1 82
byte 1 95
byte 1 66
byte 1 76
byte 1 79
byte 1 67
byte 1 75
byte 1 0
align 1
LABELV $719
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 65
byte 1 66
byte 1 69
byte 1 82
byte 1 95
byte 1 72
byte 1 73
byte 1 84
byte 1 0
align 1
LABELV $718
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 65
byte 1 66
byte 1 69
byte 1 82
byte 1 95
byte 1 65
byte 1 84
byte 1 84
byte 1 65
byte 1 67
byte 1 75
byte 1 0
align 1
LABELV $717
byte 1 69
byte 1 86
byte 1 95
byte 1 65
byte 1 76
byte 1 84
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 0
align 1
LABELV $716
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 73
byte 1 82
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 0
align 1
LABELV $715
byte 1 69
byte 1 86
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 78
byte 1 71
byte 1 69
byte 1 95
byte 1 87
byte 1 69
byte 1 65
byte 1 80
byte 1 79
byte 1 78
byte 1 0
align 1
LABELV $714
byte 1 69
byte 1 86
byte 1 95
byte 1 78
byte 1 79
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 0
align 1
LABELV $713
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $712
byte 1 69
byte 1 86
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 95
byte 1 80
byte 1 73
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $711
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 67
byte 1 76
byte 1 69
byte 1 65
byte 1 82
byte 1 0
align 1
LABELV $710
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 85
byte 1 78
byte 1 68
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $709
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 76
byte 1 69
byte 1 65
byte 1 86
byte 1 69
byte 1 0
align 1
LABELV $708
byte 1 69
byte 1 86
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 84
byte 1 79
byte 1 85
byte 1 67
byte 1 72
byte 1 0
align 1
LABELV $707
byte 1 69
byte 1 86
byte 1 95
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $706
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 0
align 1
LABELV $705
byte 1 69
byte 1 86
byte 1 95
byte 1 80
byte 1 82
byte 1 73
byte 1 86
byte 1 65
byte 1 84
byte 1 69
byte 1 95
byte 1 68
byte 1 85
byte 1 69
byte 1 76
byte 1 0
align 1
LABELV $704
byte 1 69
byte 1 86
byte 1 95
byte 1 74
byte 1 85
byte 1 77
byte 1 80
byte 1 95
byte 1 80
byte 1 65
byte 1 68
byte 1 0
align 1
LABELV $703
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $702
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 49
byte 1 54
byte 1 0
align 1
LABELV $701
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $700
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 56
byte 1 0
align 1
LABELV $699
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 52
byte 1 0
align 1
LABELV $698
byte 1 69
byte 1 86
byte 1 95
byte 1 83
byte 1 87
byte 1 73
byte 1 77
byte 1 0
align 1
LABELV $697
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 87
byte 1 65
byte 1 68
byte 1 69
byte 1 0
align 1
LABELV $696
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $695
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 95
byte 1 77
byte 1 69
byte 1 84
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $694
byte 1 69
byte 1 86
byte 1 95
byte 1 70
byte 1 79
byte 1 79
byte 1 84
byte 1 83
byte 1 84
byte 1 69
byte 1 80
byte 1 0
align 1
LABELV $693
byte 1 69
byte 1 86
byte 1 95
byte 1 67
byte 1 76
byte 1 73
byte 1 69
byte 1 78
byte 1 84
byte 1 74
byte 1 79
byte 1 73
byte 1 78
byte 1 0
align 1
LABELV $692
byte 1 69
byte 1 86
byte 1 95
byte 1 78
byte 1 79
byte 1 78
byte 1 69
byte 1 0
align 1
LABELV $690
byte 1 66
byte 1 71
byte 1 95
byte 1 69
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 97
byte 1 116
byte 1 101
byte 1 84
byte 1 114
byte 1 97
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 68
byte 1 101
byte 1 108
byte 1 116
byte 1 97
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 114
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $677
byte 1 66
byte 1 71
byte 1 95
byte 1 69
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 97
byte 1 116
byte 1 101
byte 1 84
byte 1 114
byte 1 97
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 91
byte 1 67
byte 1 76
byte 1 73
byte 1 69
byte 1 78
byte 1 84
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 32
byte 1 83
byte 1 73
byte 1 68
byte 1 69
byte 1 93
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 114
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $662
byte 1 66
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 66
byte 1 101
byte 1 71
byte 1 114
byte 1 97
byte 1 98
byte 1 98
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 73
byte 1 84
byte 1 95
byte 1 66
byte 1 65
byte 1 68
byte 1 0
align 1
LABELV $570
byte 1 66
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 66
byte 1 101
byte 1 71
byte 1 114
byte 1 97
byte 1 98
byte 1 98
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $491
byte 1 67
byte 1 111
byte 1 117
byte 1 108
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
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $482
byte 1 72
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
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
byte 1 0
align 1
LABELV $422
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 104
byte 1 95
byte 1 98
byte 1 111
byte 1 114
byte 1 98
byte 1 0
align 1
LABELV $421
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 98
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $420
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 99
byte 1 117
byte 1 98
byte 1 101
byte 1 0
align 1
LABELV $419
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 104
byte 1 95
byte 1 114
byte 1 111
byte 1 114
byte 1 98
byte 1 0
align 1
LABELV $418
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 114
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $417
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 99
byte 1 117
byte 1 98
byte 1 101
byte 1 0
align 1
LABELV $416
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 49
byte 1 0
align 1
LABELV $415
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 110
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $414
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
LABELV $413
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 109
byte 1 112
byte 1 105
byte 1 95
byte 1 98
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $412
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 98
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 121
byte 1 115
byte 1 97
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $411
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 98
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $410
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
LABELV $409
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 109
byte 1 112
byte 1 105
byte 1 95
byte 1 114
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $408
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 114
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 95
byte 1 121
byte 1 115
byte 1 97
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $407
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 114
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $406
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
LABELV $405
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $404
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $403
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $402
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 99
byte 1 95
byte 1 98
byte 1 111
byte 1 108
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $401
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 99
byte 1 95
byte 1 98
byte 1 111
byte 1 108
byte 1 116
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $400
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 99
byte 1 95
byte 1 98
byte 1 111
byte 1 108
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $399
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $398
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 95
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $397
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $396
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 105
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $395
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $394
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 95
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $393
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $392
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $391
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 119
byte 1 112
byte 1 0
align 1
LABELV $390
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 101
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $389
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $388
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $387
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $386
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 119
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $385
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $384
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $383
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $382
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 112
byte 1 117
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $381
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 100
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $380
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 119
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $379
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 47
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $378
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 47
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $377
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 47
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 112
byte 1 117
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $376
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $375
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 119
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $374
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 47
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $373
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 47
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $372
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 47
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 95
byte 1 112
byte 1 117
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $371
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $370
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 119
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 101
byte 1 114
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 110
byte 1 0
align 1
LABELV $369
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 109
byte 1 101
byte 1 114
byte 1 114
byte 1 95
byte 1 115
byte 1 111
byte 1 110
byte 1 110
byte 1 47
byte 1 109
byte 1 101
byte 1 114
byte 1 114
byte 1 95
byte 1 115
byte 1 111
byte 1 110
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $368
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 109
byte 1 101
byte 1 114
byte 1 114
byte 1 95
byte 1 115
byte 1 111
byte 1 110
byte 1 110
byte 1 47
byte 1 109
byte 1 101
byte 1 114
byte 1 114
byte 1 95
byte 1 115
byte 1 111
byte 1 110
byte 1 110
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $367
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $366
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 119
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 104
byte 1 101
byte 1 116
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $365
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 103
byte 1 111
byte 1 108
byte 1 97
byte 1 110
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 115
byte 1 47
byte 1 103
byte 1 111
byte 1 108
byte 1 97
byte 1 110
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $364
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 103
byte 1 111
byte 1 108
byte 1 97
byte 1 110
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 115
byte 1 47
byte 1 103
byte 1 111
byte 1 108
byte 1 97
byte 1 110
byte 1 95
byte 1 97
byte 1 114
byte 1 109
byte 1 115
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $363
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 104
byte 1 101
byte 1 116
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $362
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 119
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 109
byte 1 112
byte 1 50
byte 1 0
align 1
LABELV $361
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 100
byte 1 101
byte 1 109
byte 1 112
byte 1 50
byte 1 47
byte 1 100
byte 1 101
byte 1 109
byte 1 112
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $360
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 100
byte 1 101
byte 1 109
byte 1 112
byte 1 50
byte 1 47
byte 1 100
byte 1 101
byte 1 109
byte 1 112
byte 1 50
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $359
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 109
byte 1 112
byte 1 50
byte 1 0
align 1
LABELV $358
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 119
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $357
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 95
byte 1 114
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 95
byte 1 114
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $356
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 95
byte 1 114
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 95
byte 1 114
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $355
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $354
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 119
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 111
byte 1 119
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $353
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 98
byte 1 111
byte 1 119
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 47
byte 1 98
byte 1 111
byte 1 119
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $352
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 98
byte 1 111
byte 1 119
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 47
byte 1 98
byte 1 111
byte 1 119
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $351
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 111
byte 1 119
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $350
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 119
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $349
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 100
byte 1 105
byte 1 115
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 111
byte 1 114
byte 1 47
byte 1 100
byte 1 105
byte 1 115
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $348
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 100
byte 1 105
byte 1 115
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 111
byte 1 114
byte 1 47
byte 1 100
byte 1 105
byte 1 115
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 111
byte 1 114
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $347
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 105
byte 1 115
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $346
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 119
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $345
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 114
byte 1 47
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $344
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 114
byte 1 47
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $343
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $342
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 119
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 105
byte 1 102
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $341
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 98
byte 1 114
byte 1 105
byte 1 97
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 47
byte 1 98
byte 1 114
byte 1 105
byte 1 97
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $340
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 98
byte 1 114
byte 1 105
byte 1 97
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 47
byte 1 98
byte 1 114
byte 1 105
byte 1 97
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $339
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 114
byte 1 121
byte 1 97
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $338
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 119
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $337
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 119
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $336
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $335
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $334
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 119
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 116
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $333
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 116
byte 1 117
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 116
byte 1 111
byte 1 110
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 111
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $332
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 116
byte 1 117
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 116
byte 1 111
byte 1 110
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 111
byte 1 110
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $331
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 116
byte 1 117
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $330
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 109
byte 1 112
byte 1 105
byte 1 95
byte 1 121
byte 1 115
byte 1 97
byte 1 109
byte 1 97
byte 1 114
byte 1 105
byte 1 0
align 1
LABELV $329
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 121
byte 1 115
byte 1 97
byte 1 108
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 105
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $328
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 121
byte 1 115
byte 1 97
byte 1 108
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $327
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 121
byte 1 115
byte 1 97
byte 1 108
byte 1 105
byte 1 109
byte 1 97
byte 1 114
byte 1 105
byte 1 0
align 1
LABELV $326
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 109
byte 1 112
byte 1 105
byte 1 95
byte 1 102
byte 1 98
byte 1 111
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $325
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 95
byte 1 98
byte 1 111
byte 1 111
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $324
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 98
byte 1 111
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $323
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 95
byte 1 98
byte 1 111
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $322
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 109
byte 1 112
byte 1 105
byte 1 95
byte 1 100
byte 1 107
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $321
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 100
byte 1 107
byte 1 95
byte 1 101
byte 1 110
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 101
byte 1 110
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $320
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 95
byte 1 101
byte 1 110
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 101
byte 1 110
byte 1 95
byte 1 100
byte 1 97
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $319
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 109
byte 1 112
byte 1 105
byte 1 95
byte 1 106
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $318
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 106
byte 1 101
byte 1 100
byte 1 105
byte 1 95
byte 1 101
byte 1 110
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 101
byte 1 110
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $317
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 101
byte 1 110
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 101
byte 1 110
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $316
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 95
byte 1 101
byte 1 110
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 101
byte 1 110
byte 1 95
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $315
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 105
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 101
byte 1 110
byte 1 116
byte 1 114
byte 1 121
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $314
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 115
byte 1 103
byte 1 117
byte 1 110
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $313
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 115
byte 1 101
byte 1 110
byte 1 116
byte 1 114
byte 1 121
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $312
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 105
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $311
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 98
byte 1 105
byte 1 110
byte 1 111
byte 1 99
byte 1 117
byte 1 108
byte 1 97
byte 1 114
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $310
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 98
byte 1 105
byte 1 110
byte 1 111
byte 1 99
byte 1 117
byte 1 108
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $309
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 112
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $308
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 112
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $307
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 105
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 98
byte 1 97
byte 1 99
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $306
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 116
byte 1 97
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $305
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 112
byte 1 97
byte 1 99
byte 1 0
align 1
LABELV $304
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 115
byte 1 116
byte 1 105
byte 1 99
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 102
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 95
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 102
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 95
byte 1 111
byte 1 102
byte 1 102
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 102
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 95
byte 1 108
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 101
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 109
byte 1 112
byte 1 102
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $303
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 105
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $302
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $301
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $300
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 105
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $299
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $298
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 119
byte 1 95
byte 1 112
byte 1 107
byte 1 117
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $297
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 115
byte 1 101
byte 1 101
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $296
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 104
byte 1 117
byte 1 100
byte 1 47
byte 1 105
byte 1 95
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $295
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 112
byte 1 97
byte 1 99
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $294
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $293
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 112
byte 1 97
byte 1 107
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $292
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 95
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $291
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 112
byte 1 115
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $290
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 95
byte 1 108
byte 1 114
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $289
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 95
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $288
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 109
byte 1 112
byte 1 47
byte 1 112
byte 1 115
byte 1 100
byte 1 95
byte 1 115
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $287
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $286
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 95
byte 1 115
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $285
byte 1 0
align 1
LABELV $284
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $133
byte 1 37
byte 1 105
byte 1 45
byte 1 0
align 1
LABELV $132
byte 1 55
byte 1 45
byte 1 49
byte 1 45
byte 1 48
byte 1 51
byte 1 50
byte 1 51
byte 1 51
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 49
byte 1 51
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $128
byte 1 77
byte 1 65
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 89
byte 1 55
byte 1 0
align 1
LABELV $127
byte 1 77
byte 1 65
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 89
byte 1 54
byte 1 0
align 1
LABELV $126
byte 1 77
byte 1 65
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 89
byte 1 53
byte 1 0
align 1
LABELV $125
byte 1 77
byte 1 65
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 89
byte 1 52
byte 1 0
align 1
LABELV $124
byte 1 77
byte 1 65
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 89
byte 1 51
byte 1 0
align 1
LABELV $123
byte 1 77
byte 1 65
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 89
byte 1 50
byte 1 0
align 1
LABELV $122
byte 1 77
byte 1 65
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 89
byte 1 49
byte 1 0
align 1
LABELV $121
byte 1 77
byte 1 65
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 89
byte 1 48
byte 1 0
