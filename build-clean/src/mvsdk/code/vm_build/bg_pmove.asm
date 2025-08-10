data
export gPMDoSlowFall
align 4
LABELV gPMDoSlowFall
byte 4 0
export pm_stopspeed
align 4
LABELV pm_stopspeed
byte 4 1120403456
export pm_duckScale
align 4
LABELV pm_duckScale
byte 4 1056964608
export pm_swimScale
align 4
LABELV pm_swimScale
byte 4 1056964608
export pm_wadeScale
align 4
LABELV pm_wadeScale
byte 4 1060320051
export pm_accelerate
align 4
LABELV pm_accelerate
byte 4 1092616192
export pm_airaccelerate
align 4
LABELV pm_airaccelerate
byte 4 1065353216
export pm_wateraccelerate
align 4
LABELV pm_wateraccelerate
byte 4 1082130432
export pm_flyaccelerate
align 4
LABELV pm_flyaccelerate
byte 4 1090519040
export pm_friction
align 4
LABELV pm_friction
byte 4 1086324736
export pm_waterfriction
align 4
LABELV pm_waterfriction
byte 4 1065353216
export pm_flightfriction
align 4
LABELV pm_flightfriction
byte 4 1077936128
export pm_spectatorfriction
align 4
LABELV pm_spectatorfriction
byte 4 1084227584
export pm_vq3_duckScale
align 4
LABELV pm_vq3_duckScale
byte 4 1048576000
export pm_vq3_friction
align 4
LABELV pm_vq3_friction
byte 4 1090519040
export pm_cpm_accelerate
align 4
LABELV pm_cpm_accelerate
byte 4 1097859072
export pm_cpm_airaccelerate
align 4
LABELV pm_cpm_airaccelerate
byte 4 1065353216
export pm_cpm_airstopaccelerate
align 4
LABELV pm_cpm_airstopaccelerate
byte 4 1075838976
export pm_cpm_airstrafeaccelerate
align 4
LABELV pm_cpm_airstrafeaccelerate
byte 4 1116471296
export pm_cpm_airstrafewishspeed
align 4
LABELV pm_cpm_airstrafewishspeed
byte 4 1106247680
export pm_sp_accelerate
align 4
LABELV pm_sp_accelerate
byte 4 1094713344
export pm_sp_airaccelerate
align 4
LABELV pm_sp_airaccelerate
byte 4 1082130432
export pm_sp_frictionModifier
align 4
LABELV pm_sp_frictionModifier
byte 4 1077936128
export pm_sp_airDecelRate
align 4
LABELV pm_sp_airDecelRate
byte 4 1068289229
export c_pmove
align 4
LABELV c_pmove
byte 4 0
export forceSpeedLevels
align 4
LABELV forceSpeedLevels
byte 4 1065353216
byte 4 1067450368
byte 4 1069547520
byte 4 1071644672
export forcePowerNeeded_1_04
align 4
LABELV forcePowerNeeded_1_04
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 65
byte 4 10
byte 4 50
byte 4 20
byte 4 20
byte 4 20
byte 4 30
byte 4 1
byte 4 50
byte 4 50
byte 4 50
byte 4 50
byte 4 50
byte 4 20
byte 4 20
byte 4 0
byte 4 2
byte 4 20
byte 4 60
byte 4 10
byte 4 50
byte 4 20
byte 4 20
byte 4 20
byte 4 30
byte 4 1
byte 4 50
byte 4 25
byte 4 25
byte 4 33
byte 4 33
byte 4 20
byte 4 20
byte 4 0
byte 4 1
byte 4 20
byte 4 50
byte 4 10
byte 4 50
byte 4 20
byte 4 20
byte 4 20
byte 4 60
byte 4 1
byte 4 50
byte 4 10
byte 4 10
byte 4 25
byte 4 25
byte 4 20
byte 4 20
byte 4 0
byte 4 0
byte 4 20
export forcePowerNeeded_1_02
align 4
LABELV forcePowerNeeded_1_02
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 999
byte 4 25
byte 4 10
byte 4 50
byte 4 20
byte 4 20
byte 4 20
byte 4 30
byte 4 1
byte 4 50
byte 4 50
byte 4 50
byte 4 50
byte 4 50
byte 4 10
byte 4 20
byte 4 0
byte 4 2
byte 4 20
byte 4 25
byte 4 10
byte 4 50
byte 4 20
byte 4 20
byte 4 20
byte 4 30
byte 4 1
byte 4 50
byte 4 25
byte 4 25
byte 4 33
byte 4 33
byte 4 10
byte 4 20
byte 4 0
byte 4 1
byte 4 20
byte 4 25
byte 4 10
byte 4 50
byte 4 20
byte 4 20
byte 4 20
byte 4 60
byte 4 1
byte 4 50
byte 4 10
byte 4 10
byte 4 25
byte 4 25
byte 4 10
byte 4 20
byte 4 0
byte 4 0
byte 4 20
export forcePowerNeeded
align 4
LABELV forcePowerNeeded
address forcePowerNeeded_1_04
export forceJumpHeight
align 4
LABELV forceJumpHeight
byte 4 1107296256
byte 4 1119879168
byte 4 1128267776
byte 4 1136656384
export forceJumpHeightMax
align 4
LABELV forceJumpHeightMax
byte 4 1115947008
byte 4 1124204544
byte 4 1130496000
byte 4 1137770496
code
proc PM_UpdateAntiLoop 24 20
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\bg_pmove.c"
line 268
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_pmove.c -- both games player movement code
;4:// takes a playerstate and a usercmd as input and returns a modifed playerstate
;5:
;6:#include "q_shared.h"
;7:#include "bg_public.h"
;8:#include "bg_local.h"
;9:#include "../qcommon/fp16.h"
;10:#include "bg_pmove_q2.h"
;11:#include "bg_pmove_css.h"
;12:
;13:#ifdef JK2_GAME
;14:#include "g_local.h"
;15:#elif JK2_CGAME
;16:#include "../cgame/cg_local.h"
;17:#endif
;18:
;19:
;20:#define MAX_WEAPON_CHARGE_TIME 5000
;21:
;22:extern qboolean PM_GroundSlideOkay(float zNormal);
;23:extern float MovementOverbounceFactor(int moveStyle, playerState_t* ps, usercmd_t* ucmd);
;24:extern void PM_CheckBounceJump(vec3_t normal, vec3_t velocity);
;25:extern vec3_t flatNormal;
;26:
;27:
;28:pmove_t		*pm;
;29:pml_t		pml;
;30:
;31:qboolean gPMDoSlowFall = qfalse;
;32:
;33:// movement parameters
;34:float	pm_stopspeed = 100.0f;
;35:float	pm_duckScale = 0.50f;
;36:float	pm_swimScale = 0.50f;
;37:float	pm_wadeScale = 0.70f;
;38:
;39:float	pm_accelerate = 10.0f;
;40:float	pm_airaccelerate = 1.0f;
;41:float	pm_wateraccelerate = 4.0f;
;42:float	pm_flyaccelerate = 8.0f;
;43:
;44:float	pm_friction = 6.0f;
;45:float	pm_waterfriction = 1.0f;
;46:float	pm_flightfriction = 3.0f;
;47:float	pm_spectatorfriction = 5.0f;
;48:
;49://japro/dfmania movement parameters
;50:const float pm_vq3_duckScale = 0.25f;
;51:const float pm_vq3_friction = 8.0f;
;52:
;53:const float	pm_cpm_accelerate = 15.0f;
;54:const float	pm_cpm_airaccelerate = 1.0f;
;55:const float	pm_cpm_airstopaccelerate = 2.5f;
;56:const float	pm_cpm_airstrafeaccelerate = 70.0f;
;57:const float	pm_cpm_airstrafewishspeed = 30.0f;
;58:
;59:const float	pm_sp_accelerate = 12.0f;
;60:const float	pm_sp_airaccelerate = 4.0f; 
;61:const float	pm_sp_frictionModifier = 3.0f;	//Used for "careful" mode (when pressing use)
;62:const float pm_sp_airDecelRate = 1.35f;	//Used for air decelleration away from current movement velocity
;63:
;64:int		c_pmove = 0;
;65:
;66:float forceSpeedLevels[4] = 
;67:{
;68:	1, //rank 0?
;69:	1.25,
;70:	1.5,
;71:	1.75
;72:};
;73:
;74:int forcePowerNeeded_1_04[NUM_FORCE_POWER_LEVELS][NUM_FORCE_POWERS] = 
;75:{
;76:	{ //nothing should be usable at rank 0..
;77:		999,//FP_HEAL,//instant
;78:		999,//FP_LEVITATION,//hold/duration
;79:		999,//FP_SPEED,//duration
;80:		999,//FP_PUSH,//hold/duration
;81:		999,//FP_PULL,//hold/duration
;82:		999,//FP_TELEPATHY,//instant
;83:		999,//FP_GRIP,//hold/duration
;84:		999,//FP_LIGHTNING,//hold/duration
;85:		999,//FP_RAGE,//duration
;86:		999,//FP_PROTECT,//duration
;87:		999,//FP_ABSORB,//duration
;88:		999,//FP_TEAM_HEAL,//instant
;89:		999,//FP_TEAM_FORCE,//instant
;90:		999,//FP_DRAIN,//hold/duration
;91:		999,//FP_SEE,//duration
;92:		999,//FP_SABERATTACK,
;93:		999,//FP_SABERDEFEND,
;94:		999//FP_SABERTHROW,
;95:		//NUM_FORCE_POWERS
;96:	},
;97:	{
;98:		65,//FP_HEAL,//instant //was 25, but that was way too little
;99:		10,//FP_LEVITATION,//hold/duration
;100:		50,//FP_SPEED,//duration
;101:		20,//FP_PUSH,//hold/duration
;102:		20,//FP_PULL,//hold/duration
;103:		20,//FP_TELEPATHY,//instant
;104:		30,//FP_GRIP,//hold/duration
;105:		1,//FP_LIGHTNING,//hold/duration
;106:		50,//FP_RAGE,//duration
;107:		50,//FP_PROTECT,//duration
;108:		50,//FP_ABSORB,//duration
;109:		50,//FP_TEAM_HEAL,//instant
;110:		50,//FP_TEAM_FORCE,//instant
;111:		20,//FP_DRAIN,//hold/duration
;112:		20,//FP_SEE,//duration
;113:		0,//FP_SABERATTACK,
;114:		2,//FP_SABERDEFEND,
;115:		20//FP_SABERTHROW,
;116:		//NUM_FORCE_POWERS
;117:	},
;118:	{
;119:		60,//FP_HEAL,//instant
;120:		10,//FP_LEVITATION,//hold/duration
;121:		50,//FP_SPEED,//duration
;122:		20,//FP_PUSH,//hold/duration
;123:		20,//FP_PULL,//hold/duration
;124:		20,//FP_TELEPATHY,//instant
;125:		30,//FP_GRIP,//hold/duration
;126:		1,//FP_LIGHTNING,//hold/duration
;127:		50,//FP_RAGE,//duration
;128:		25,//FP_PROTECT,//duration
;129:		25,//FP_ABSORB,//duration
;130:		33,//FP_TEAM_HEAL,//instant
;131:		33,//FP_TEAM_FORCE,//instant
;132:		20,//FP_DRAIN,//hold/duration
;133:		20,//FP_SEE,//duration
;134:		0,//FP_SABERATTACK,
;135:		1,//FP_SABERDEFEND,
;136:		20//FP_SABERTHROW,
;137:		//NUM_FORCE_POWERS
;138:	},
;139:	{
;140:		50,//FP_HEAL,//instant //You get 5 points of health.. for 50 force points!
;141:		10,//FP_LEVITATION,//hold/duration
;142:		50,//FP_SPEED,//duration
;143:		20,//FP_PUSH,//hold/duration
;144:		20,//FP_PULL,//hold/duration
;145:		20,//FP_TELEPATHY,//instant
;146:		60,//FP_GRIP,//hold/duration
;147:		1,//FP_LIGHTNING,//hold/duration
;148:		50,//FP_RAGE,//duration
;149:		10,//FP_PROTECT,//duration
;150:		10,//FP_ABSORB,//duration
;151:		25,//FP_TEAM_HEAL,//instant
;152:		25,//FP_TEAM_FORCE,//instant
;153:		20,//FP_DRAIN,//hold/duration
;154:		20,//FP_SEE,//duration
;155:		0,//FP_SABERATTACK,
;156:		0,//FP_SABERDEFEND,
;157:		20//FP_SABERTHROW,
;158:		//NUM_FORCE_POWERS
;159:	}
;160:};
;161:
;162:int forcePowerNeeded_1_02[NUM_FORCE_POWER_LEVELS][NUM_FORCE_POWERS] = 
;163:{
;164:	{ //nothing should be usable at rank 0..
;165:		999,//FP_HEAL,//instant
;166:		999,//FP_LEVITATION,//hold/duration
;167:		999,//FP_SPEED,//duration
;168:		999,//FP_PUSH,//hold/duration
;169:		999,//FP_PULL,//hold/duration
;170:		999,//FP_TELEPATHY,//instant
;171:		999,//FP_GRIP,//hold/duration
;172:		999,//FP_LIGHTNING,//hold/duration
;173:		999,//FP_RAGE,//duration
;174:		999,//FP_PROTECT,//duration
;175:		999,//FP_ABSORB,//duration
;176:		999,//FP_TEAM_HEAL,//instant
;177:		999,//FP_TEAM_FORCE,//instant
;178:		999,//FP_DRAIN,//hold/duration
;179:		999,//FP_SEE,//duration
;180:		999,//FP_SABERATTACK,
;181:		999,//FP_SABERDEFEND,
;182:		999//FP_SABERTHROW,
;183:		//NUM_FORCE_POWERS
;184:	},
;185:	{
;186:		25,//FP_HEAL,//instant
;187:		10,//FP_LEVITATION,//hold/duration
;188:		50,//FP_SPEED,//duration
;189:		20,//FP_PUSH,//hold/duration
;190:		20,//FP_PULL,//hold/duration
;191:		20,//FP_TELEPATHY,//instant
;192:		30,//FP_GRIP,//hold/duration
;193:		1,//FP_LIGHTNING,//hold/duration
;194:		50,//FP_RAGE,//duration
;195:		50,//FP_PROTECT,//duration
;196:		50,//FP_ABSORB,//duration
;197:		50,//FP_TEAM_HEAL,//instant
;198:		50,//FP_TEAM_FORCE,//instant
;199:		10,//FP_DRAIN,//hold/duration
;200:		20,//FP_SEE,//duration
;201:		0,//FP_SABERATTACK,
;202:		2,//FP_SABERDEFEND,
;203:		20//FP_SABERTHROW,
;204:		//NUM_FORCE_POWERS
;205:	},
;206:	{
;207:		25,//FP_HEAL,//instant
;208:		10,//FP_LEVITATION,//hold/duration
;209:		50,//FP_SPEED,//duration
;210:		20,//FP_PUSH,//hold/duration
;211:		20,//FP_PULL,//hold/duration
;212:		20,//FP_TELEPATHY,//instant
;213:		30,//FP_GRIP,//hold/duration
;214:		1,//FP_LIGHTNING,//hold/duration
;215:		50,//FP_RAGE,//duration
;216:		25,//FP_PROTECT,//duration
;217:		25,//FP_ABSORB,//duration
;218:		33,//FP_TEAM_HEAL,//instant
;219:		33,//FP_TEAM_FORCE,//instant
;220:		10,//FP_DRAIN,//hold/duration
;221:		20,//FP_SEE,//duration
;222:		0,//FP_SABERATTACK,
;223:		1,//FP_SABERDEFEND,
;224:		20//FP_SABERTHROW,
;225:		//NUM_FORCE_POWERS
;226:	},
;227:	{
;228:		25,//FP_HEAL,//instant
;229:		10,//FP_LEVITATION,//hold/duration
;230:		50,//FP_SPEED,//duration
;231:		20,//FP_PUSH,//hold/duration
;232:		20,//FP_PULL,//hold/duration
;233:		20,//FP_TELEPATHY,//instant
;234:		60,//FP_GRIP,//hold/duration
;235:		1,//FP_LIGHTNING,//hold/duration
;236:		50,//FP_RAGE,//duration
;237:		10,//FP_PROTECT,//duration
;238:		10,//FP_ABSORB,//duration
;239:		25,//FP_TEAM_HEAL,//instant
;240:		25,//FP_TEAM_FORCE,//instant
;241:		10,//FP_DRAIN,//hold/duration
;242:		20,//FP_SEE,//duration
;243:		0,//FP_SABERATTACK,
;244:		0,//FP_SABERDEFEND,
;245:		20//FP_SABERTHROW,
;246:		//NUM_FORCE_POWERS
;247:	}
;248:};
;249:
;250:int (*forcePowerNeeded)[NUM_FORCE_POWERS] = forcePowerNeeded_1_04;
;251:
;252:float forceJumpHeight[NUM_FORCE_POWER_LEVELS] = 
;253:{
;254:	32,//normal jump (+stepheight+crouchdiff = 66)
;255:	96,//(+stepheight+crouchdiff = 130)
;256:	192,//(+stepheight+crouchdiff = 226)
;257:	384//(+stepheight+crouchdiff = 418)
;258:};
;259:
;260:float forceJumpHeightMax[NUM_FORCE_POWER_LEVELS] =
;261:{
;262:	66,//normal jump (32+stepheight(18)+crouchdiff(24) = 74)
;263:	130,//(96+stepheight(18)+crouchdiff(24) = 138)
;264:	226,//(192+stepheight(18)+crouchdiff(24) = 234)
;265:	418//(384+stepheight(18)+crouchdiff(24) = 426)
;266:};
;267:
;268:static void PM_UpdateAntiLoop() {
line 269
;269:	DF_AntiLoop_NewAngle(&pm->antiLoop, pm->lastAntiLoopVelocity, pm->ps->velocity, pm->ps->basespeed, pm->modParms.raceMode && pm->ps->duelTime);
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 540
ADDP4
ARGP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $125
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $125
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $126
JUMPV
LABELV $125
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $126
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 DF_AntiLoop_NewAngle
CALLV
pop
line 270
;270:	VectorCopy(pm->ps->velocity, pm->lastAntiLoopVelocity);
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 540
ADDP4
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 271
;271:}
LABELV $123
endproc PM_UpdateAntiLoop 24 20
export PM_BGEntForNum
proc PM_BGEntForNum 8 0
line 275
;272:
;273://rww - Get a pointer to the bgEntity by the index
;274:bgEntity_t* PM_BGEntForNum(int num)
;275:{
line 278
;276:	bgEntity_t* ent;
;277:
;278:	if (!pm)
ADDRGP4 pm
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $128
line 279
;279:	{
line 280
;280:		assert(!"You cannot call PM_BGEntForNum outside of pm functions!");
line 281
;281:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $127
JUMPV
LABELV $128
line 284
;282:	}
;283:
;284:	if (!pm->baseEnt)
ADDRGP4 pm
INDIRP4
CNSTI4 464
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $130
line 285
;285:	{
line 286
;286:		assert(!"Base entity address not set");
line 287
;287:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $127
JUMPV
LABELV $130
line 290
;288:	}
;289:
;290:	if (!pm->entSize)
ADDRGP4 pm
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $132
line 291
;291:	{
line 292
;292:		assert(!"sizeof(ent) is 0, impossible (not set?)");
line 293
;293:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $127
JUMPV
LABELV $132
line 296
;294:	}
;295:
;296:	assert(num >= 0 && num < MAX_GENTITIES);
line 298
;297:
;298:	ent = (bgEntity_t*)((byte*)pm->baseEnt + pm->entSize * (num));
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
INDIRP4
ADDP4
ASGNP4
line 300
;299:
;300:	return ent;
ADDRLP4 0
INDIRP4
RETP4
LABELV $127
endproc PM_BGEntForNum 8 0
export PM_GrabWallForJump
proc PM_GrabWallForJump 4 16
line 304
;301:}
;302:
;303:void PM_GrabWallForJump(int anim)
;304:{//NOTE!!! assumes an appropriate anim is being passed in!!!
line 305
;305:	PM_SetAnim(SETANIM_BOTH, anim, SETANIM_FLAG_RESTART | SETANIM_FLAG_OVERRIDE | SETANIM_FLAG_HOLD, 100);
CNSTI4 3
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 306
;306:	PM_AddEvent(EV_JUMP);//make sound for grab
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 307
;307:	pm->ps->pm_flags |= PMF_STUCK_TO_WALL;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 308
;308:}
LABELV $134
endproc PM_GrabWallForJump 4 16
data
export forceJumpStrength
align 4
LABELV forceJumpStrength
byte 4 1130430464
byte 4 1137836032
byte 4 1142128640
byte 4 1146224640
export PM_GetSaberStance
code
proc PM_GetSaberStance 0 0
line 372
;309:
;310:float forceJumpStrength[NUM_FORCE_POWER_LEVELS] = 
;311:{
;312:	JUMP_VELOCITY,//normal jump
;313:	420,
;314:	590,
;315:	840
;316:};
;317:
;318:/*
;319:Q_INLINE int PM_GetMovePhysics(void)
;320:{
;321:	if (!pm || !pm->ps)
;322:		return MV_JK2;
;323:
;324:	if (pm->mod == SVMOD_TOMMYTERNAL && pm->ps->stats[STAT_RACEMODE]) {
;325:		return pm->ps->stats[STAT_MOVEMENTSTYLE];
;326:	}
;327:	else if(pm->mod == SVMOD_JK2PRO) {
;328:		return pm->ps->stats[STAT_MOVEMENTSTYLE];
;329:	}
;330:
;331:	return MV_JK2; // this can happen when we die in racemode too!
;332:}
;333:
;334:Q_INLINE int PM_GetRunFlags(void)
;335:{
;336:	if (!pm || !pm->ps)
;337:		return 0;
;338:
;339:	if (pm->mod == SVMOD_TOMMYTERNAL && pm->ps->stats[STAT_RACEMODE]) {
;340:		return pm->ps->stats[STAT_RUNFLAGS];
;341:	}
;342:
;343:	return 0; // this can happen when we die in racemode too!
;344:}
;345:
;346:Q_INLINE int PM_GetMsecRestrict(void)
;347:{
;348:	if (!pm || !pm->ps)
;349:		return 0;
;350:	if (pm->mod == SVMOD_TOMMYTERNAL && pm->ps->stats[STAT_RACEMODE]) {
;351:		return pm->ps->stats[STAT_MSECRESTRICT];
;352:	}
;353:
;354:	return 0; // this can happen when we die in racemode too!
;355:}
;356:
;357:
;358:Q_INLINE int PM_GetRaceMode(pmove_t* pmove)
;359:{
;360:	if (!pmove || !pmove->ps)
;361:		return 0;
;362:	if (pmove->mod == SVMOD_TOMMYTERNAL) {
;363:		return pmove->ps->stats[STAT_RACEMODE];
;364:	}
;365:	else if (pmove->mod == SVMOD_JK2PRO) {
;366:		return pmove->ps->stats[STAT_RACEMODE];
;367:	}
;368:	return 0; // this can happen when we die in racemode too!
;369:}
;370:*/
;371:int PM_GetSaberStance(void)
;372:{
line 373
;373:	if ( pm->ps->dualBlade )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $136
line 374
;374:	{
line 375
;375:		return BOTH_STAND1;
CNSTI4 571
RETI4
ADDRGP4 $135
JUMPV
LABELV $136
line 377
;376:	}
;377:	if (pm->ps->fd.saberAnimLevel == FORCE_LEVEL_2)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
NEI4 $138
line 378
;378:	{ //medium
line 379
;379:		return BOTH_STAND2;
CNSTI4 573
RETI4
ADDRGP4 $135
JUMPV
LABELV $138
line 381
;380:	}
;381:	if (pm->ps->fd.saberAnimLevel == FORCE_LEVEL_3)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $140
line 382
;382:	{ //strong
line 383
;383:		return BOTH_SABERSLOW_STANCE;
CNSTI4 563
RETI4
ADDRGP4 $135
JUMPV
LABELV $140
line 387
;384:	}
;385:
;386:	//fast
;387:	return BOTH_SABERFAST_STANCE;
CNSTI4 562
RETI4
LABELV $135
endproc PM_GetSaberStance 0 0
export PM_DoSlowFall
proc PM_DoSlowFall 4 0
line 391
;388:}
;389:
;390:qboolean PM_DoSlowFall(void)
;391:{
line 392
;392:	if ( ( (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT || (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT ) && pm->ps->legsTimer > 500 )
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 915
EQI4 $145
ADDRLP4 0
INDIRI4
CNSTI4 918
NEI4 $143
LABELV $145
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 500
LEI4 $143
line 393
;393:	{
line 394
;394:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $142
JUMPV
LABELV $143
line 397
;395:	}
;396:
;397:	return qfalse;
CNSTI4 0
RETI4
LABELV $142
endproc PM_DoSlowFall 4 0
export PM_AddEvent
proc PM_AddEvent 0 12
line 406
;398:}
;399:
;400:/*
;401:===============
;402:PM_AddEvent
;403:
;404:===============
;405:*/
;406:void PM_AddEvent( int newEvent ) {
line 407
;407:	BG_AddPredictableEventToPlayerstate( newEvent, 0, pm->ps );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 408
;408:}
LABELV $146
endproc PM_AddEvent 0 12
export PM_AddEventWithParm
proc PM_AddEventWithParm 0 12
line 411
;409:
;410:void PM_AddEventWithParm( int newEvent, int parm ) 
;411:{
line 412
;412:	BG_AddPredictableEventToPlayerstate( newEvent, parm, pm->ps );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 413
;413:}
LABELV $147
endproc PM_AddEventWithParm 0 12
export PM_AddTouchEnt
proc PM_AddTouchEnt 12 0
line 420
;414:
;415:/*
;416:===============
;417:PM_AddTouchEnt
;418:===============
;419:*/
;420:void PM_AddTouchEnt( int entityNum ) {
line 423
;421:	int		i;
;422:
;423:	if ( entityNum == ENTITYNUM_WORLD ) {
ADDRFP4 0
INDIRI4
CNSTI4 1022
NEI4 $149
line 424
;424:		return;
ADDRGP4 $148
JUMPV
LABELV $149
line 426
;425:	}
;426:	if ( pm->numtouch == MAXTOUCH ) {
ADDRGP4 pm
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 32
NEI4 $151
line 427
;427:		return;
ADDRGP4 $148
JUMPV
LABELV $151
line 431
;428:	}
;429:
;430:	// see if it is already added
;431:	for ( i = 0 ; i < pm->numtouch ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $156
JUMPV
LABELV $153
line 432
;432:		if ( pm->touchents[ i ] == entityNum ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
CNSTI4 88
ADDP4
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $157
line 433
;433:			return;
ADDRGP4 $148
JUMPV
LABELV $157
line 435
;434:		}
;435:	}
LABELV $154
line 431
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $156
ADDRLP4 0
INDIRI4
ADDRGP4 pm
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
LTI4 $153
line 438
;436:
;437:	// add it
;438:	pm->touchents[pm->numtouch] = entityNum;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 439
;439:	pm->numtouch++;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
CNSTI4 84
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
line 440
;440:}
LABELV $148
endproc PM_AddTouchEnt 12 0
export PM_ClipVelocityQ2
proc PM_ClipVelocityQ2 36 0
line 457
;441:
;442:
;443:
;444:/*
;445:==================
;446:PM_ClipVelocity
;447:
;448:Slide off of the impacting object
;449:returns the blocked flags (1 = floor, 2 = step / wall)
;450:
;451:This is the Q2 version of it. I'm not actually using it atm, not even for the Q2 ramps. Just for reference.
;452:==================
;453:*/
;454:#define	STOP_EPSILON	0.1
;455:
;456:void PM_ClipVelocityQ2(vec3_t in, vec3_t normal, vec3_t out, float overbounce)
;457:{
line 462
;458:	float	backoff;
;459:	float	change;
;460:	int		i;
;461:
;462:	backoff = DotProduct(in, normal) * overbounce;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 24
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 464
;463:
;464:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $160
line 465
;465:	{
line 466
;466:		change = normal[i] * backoff;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 467
;467:		out[i] = in[i] - change;
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 28
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 468
;468:		if (out[i] > -STOP_EPSILON && out[i] < STOP_EPSILON)
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 3184315597
LEF4 $164
ADDRLP4 32
INDIRF4
CNSTF4 1036831949
GEF4 $164
line 469
;469:			out[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
LABELV $164
line 470
;470:	}
LABELV $161
line 464
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $160
line 471
;471:}
LABELV $159
endproc PM_ClipVelocityQ2 36 0
export PM_ClipVelocity
proc PM_ClipVelocity 40 0
line 480
;472:
;473:/*
;474:==================
;475:PM_ClipVelocity
;476:
;477:Slide off of the impacting surface
;478:==================
;479:*/
;480:void PM_ClipVelocity( vec3_t in, vec3_t normal, vec3_t out, float overbounce ) {
line 485
;481:	float	backoff;
;482:	float	change;
;483:	int		i;
;484:
;485:	if ((pm->modParms.runFlags & RFL_CLIMBTECH)&& (pm->ps->pm_flags & PMF_STUCK_TO_WALL))
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 16
INDIRI4
EQI4 $167
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 16
INDIRI4
EQI4 $167
line 486
;486:	{//no sliding!
line 487
;487:		VectorCopy(in, out);
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 488
;488:		return;
ADDRGP4 $166
JUMPV
LABELV $167
line 491
;489:	}
;490:	
;491:	backoff = DotProduct (in, normal);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 493
;492:	
;493:	if ( backoff < 0 ) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $169
line 494
;494:		backoff *= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 495
;495:	} else {
ADDRGP4 $170
JUMPV
LABELV $169
line 496
;496:		backoff /= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
ASGNF4
line 497
;497:	}
LABELV $170
line 499
;498:
;499:	for ( i=0 ; i<3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $171
line 500
;500:		change = normal[i]*backoff;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 501
;501:		out[i] = in[i] - change;
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 36
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 502
;502:	}
LABELV $172
line 499
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $171
line 503
;503:}
LABELV $166
endproc PM_ClipVelocity 40 0
proc PM_Friction 60 4
line 513
;504:
;505:
;506:/*
;507:==================
;508:PM_Friction
;509:
;510:Handles both ground friction and water friction
;511:==================
;512:*/
;513:static void PM_Friction( void ) {
line 517
;514:	vec3_t	vec;
;515:	float	*vel;
;516:	float	speed, newspeed, control;
;517:	float	drop, realfriction = pm_friction; // for sp there is pm->ps->friction. is that relevant for us?
ADDRLP4 28
ADDRGP4 pm_friction
INDIRF4
ASGNF4
line 519
;518:	
;519:	vel = pm->ps->velocity;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
line 521
;520:	
;521:	VectorCopy( vel, vec );
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 12
line 522
;522:	if ( pml.walking ) { 
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $176
line 523
;523:		vec[2] = 0;	// ignore slope movement
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 524
;524:	}
LABELV $176
line 526
;525:
;526:	speed = VectorLength(vec);
ADDRLP4 16
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 36
INDIRF4
ASGNF4
line 527
;527:	if (speed < 1) {
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
GEF4 $180
line 528
;528:		if ((pm->modParms.physics == MV_BOUNCE || pm->modParms.physics == MV_PINBALL) && vel[2]) {
ADDRLP4 40
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 6
EQI4 $184
ADDRLP4 40
INDIRI4
CNSTI4 7
NEI4 $182
LABELV $184
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 0
EQF4 $182
line 529
;529:			vec[2] = vel[2]; // otherwise we stay forever in a bouncy vel[2] state on spawn and cant savespawn
ADDRLP4 16+8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 530
;530:			speed = VectorLength(vec);
ADDRLP4 16
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 44
INDIRF4
ASGNF4
line 531
;531:		}
ADDRGP4 $183
JUMPV
LABELV $182
line 532
;532:		else {
line 533
;533:			vel[0] = 0;
ADDRLP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 534
;534:			vel[1] = 0;		// allow sinking underwater
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 536
;535:			// FIXME: still have z friction underwater?
;536:			return;
ADDRGP4 $175
JUMPV
LABELV $183
line 538
;537:		}
;538:	}
LABELV $180
line 540
;539:
;540:	if (MovementIsQuake3Based(pm->modParms.physics))
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $186
line 541
;541:		realfriction = pm_vq3_friction;
ADDRLP4 28
ADDRGP4 pm_vq3_friction
INDIRF4
ASGNF4
LABELV $186
line 543
;542:
;543:	drop = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 546
;544:
;545:	// apply ground friction
;546:	if ( pm->waterlevel <= 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
GTI4 $188
line 547
;547:		if ( pml.walking && !(pml.groundTrace.surfaceFlags & SURF_SLICK) ) {
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 pml+44
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $190
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 44
INDIRI4
NEI4 $190
line 549
;548:			// if getting knocked back, no friction
;549:			if ( ! (pm->ps->pm_flags & PMF_TIME_KNOCKBACK) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $195
line 551
;550:				//If the use key is pressed. slow the player more quickly
;551:				if (pm->modParms.physics == MV_JK2SP && pm->cmd.buttons & BUTTON_USE)
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $197
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $197
line 552
;552:					realfriction *= pm_sp_frictionModifier;
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRGP4 pm_sp_frictionModifier
INDIRF4
MULF4
ASGNF4
LABELV $197
line 554
;553:
;554:				control = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 8
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $200
ADDRLP4 52
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $201
JUMPV
LABELV $200
ADDRLP4 52
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $201
ADDRLP4 32
ADDRLP4 52
INDIRF4
ASGNF4
line 555
;555:				drop += control* realfriction *pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 556
;556:			}
LABELV $195
line 557
;557:		}
LABELV $190
line 558
;558:	}
LABELV $188
line 561
;559:
;560:	// apply water friction even if just wading
;561:	if ( pm->waterlevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $203
line 562
;562:		float waterFriction = pm_waterfriction;
ADDRLP4 44
ADDRGP4 pm_waterfriction
INDIRF4
ASGNF4
line 563
;563:		if (pm->modParms.physics == MV_SICKO) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 4
NEI4 $205
line 564
;564:			waterFriction = 0.4f;
ADDRLP4 44
CNSTF4 1053609165
ASGNF4
line 565
;565:		}
ADDRGP4 $206
JUMPV
LABELV $205
line 567
;566:		else 
;567:		if (MovementIsQuake3Based(pm->modParms.physics)) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $207
line 568
;568:			waterFriction = 0.8f;
ADDRLP4 44
CNSTF4 1061997773
ASGNF4
line 569
;569:		}
LABELV $207
LABELV $206
line 570
;570:		drop += speed* waterFriction *pm->waterlevel*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 571
;571:	}
LABELV $203
line 573
;572:
;573:	if ( pm->ps->pm_type == PM_SPECTATOR || pm->ps->pm_type == PM_FLOAT )
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 3
EQI4 $212
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $210
LABELV $212
line 574
;574:	{
line 575
;575:		if (pm->ps->pm_type == PM_FLOAT)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $213
line 576
;576:		{ //almost no friction while floating
line 577
;577:			drop += speed*0.1*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1036831949
ADDRLP4 8
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 578
;578:		}
ADDRGP4 $214
JUMPV
LABELV $213
line 580
;579:		else
;580:		{
line 581
;581:			drop += speed*pm_spectatorfriction*pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_spectatorfriction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 582
;582:		}
LABELV $214
line 583
;583:	}
LABELV $210
line 586
;584:
;585:	// scale the velocity
;586:	newspeed = speed - drop;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 587
;587:	if (newspeed < 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $217
line 588
;588:		newspeed = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 589
;589:	}
LABELV $217
line 590
;590:	if (speed == 0) { // normally we wouldnt get here but since bounce has a bit of hack ... lets avoid division by 0
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $219
line 591
;591:		newspeed = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 592
;592:	}
ADDRGP4 $220
JUMPV
LABELV $219
line 593
;593:	else {
line 594
;594:		newspeed /= speed;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 595
;595:	}
LABELV $220
line 597
;596:
;597:	vel[0] = vel[0] * newspeed;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 598
;598:	vel[1] = vel[1] * newspeed;
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 599
;599:	vel[2] = vel[2] * newspeed;
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 600
;600:}
LABELV $175
endproc PM_Friction 60 4
proc PM_Accelerate 36 0
line 610
;601:
;602:
;603:/*
;604:==============
;605:PM_Accelerate
;606:
;607:Handles user intended acceleration
;608:==============
;609:*/
;610:static void PM_Accelerate( vec3_t wishdir, float wishspeed, float accel ) {
line 616
;611:#if 1
;612:	// q2 style
;613:	int			i;
;614:	float		addspeed, accelspeed, currentspeed;
;615:
;616:	currentspeed = DotProduct (pm->ps->velocity, wishdir);
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 617
;617:	addspeed = wishspeed - currentspeed;
ADDRLP4 8
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 619
;618:
;619:	accelspeed = accel * pml.frametime * wishspeed;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 621
;620:
;621:	pm->accelMiss = (addspeed- accelspeed) / accelspeed;
ADDRGP4 pm
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 8
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ADDRLP4 4
INDIRF4
DIVF4
ASGNF4
line 622
;622:	pm->wishSpeed = wishspeed;
ADDRGP4 pm
INDIRP4
CNSTI4 556
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 624
;623:
;624:	if (addspeed <= 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $223
line 625
;625:		return;
ADDRGP4 $221
JUMPV
LABELV $223
line 627
;626:	}
;627:	if (accelspeed > addspeed) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $225
line 628
;628:		accelspeed = addspeed;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 629
;629:	}
LABELV $225
line 631
;630:	
;631:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $227
line 632
;632:		pm->ps->velocity[i] += accelspeed*wishdir[i];	
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 32
ADDRLP4 28
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 28
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 633
;633:	}
LABELV $228
line 631
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
line 652
;634:#else
;635:	// proper way (avoids strafe jump maxspeed bug), but feels bad
;636:	vec3_t		wishVelocity;
;637:	vec3_t		pushDir;
;638:	float		pushLen;
;639:	float		canPush;
;640:
;641:	VectorScale( wishdir, wishspeed, wishVelocity );
;642:	VectorSubtract( wishVelocity, pm->ps->velocity, pushDir );
;643:	pushLen = VectorNormalize( pushDir );
;644:
;645:	canPush = accel*pml.frametime*wishspeed;
;646:	if (canPush > pushLen) {
;647:		canPush = pushLen;
;648:	}
;649:
;650:	VectorMA( pm->ps->velocity, canPush, pushDir, pm->ps->velocity );
;651:#endif
;652:}
LABELV $221
endproc PM_Accelerate 36 0
proc PM_SickoAccelerate 44 0
line 662
;653:
;654:
;655:/*
;656:==============
;657:PM_Accelerate
;658:
;659:Handles user intended acceleration
;660:==============
;661:*/
;662:static void PM_SickoAccelerate( vec3_t wishdir, float wishspeed, float baseAccel, float maxAccel) {
line 668
;663:	// q2 style
;664:	int			i;
;665:	float		addspeed, accelspeed, currentspeed;
;666:	float		baseInc, accel;
;667:
;668:	currentspeed = DotProduct (pm->ps->velocity, wishdir);
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
INDIRF4
MULF4
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 24
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 669
;669:	addspeed = wishspeed - currentspeed;
ADDRLP4 8
ADDRFP4 4
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ASGNF4
line 670
;670:	if (addspeed <= 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $232
line 671
;671:		return;
ADDRGP4 $231
JUMPV
LABELV $232
line 673
;672:	}
;673:	baseInc = pml.frametime * wishspeed;
ADDRLP4 16
ADDRGP4 pml+36
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 675
;674:
;675:	accel = baseInc ? (addspeed / baseInc) : 0; // avoid division by 0 just in case
ADDRLP4 16
INDIRF4
CNSTF4 0
EQF4 $236
ADDRLP4 32
ADDRLP4 8
INDIRF4
ADDRLP4 16
INDIRF4
DIVF4
ASGNF4
ADDRGP4 $237
JUMPV
LABELV $236
ADDRLP4 32
CNSTF4 0
ASGNF4
LABELV $237
ADDRLP4 12
ADDRLP4 32
INDIRF4
ASGNF4
line 677
;676:
;677:	if (accel > maxAccel) {
ADDRLP4 12
INDIRF4
ADDRFP4 12
INDIRF4
LEF4 $238
line 678
;678:		accel = maxAccel;
ADDRLP4 12
ADDRFP4 12
INDIRF4
ASGNF4
line 679
;679:	}
ADDRGP4 $239
JUMPV
LABELV $238
line 680
;680:	else if (accel < baseAccel) {
ADDRLP4 12
INDIRF4
ADDRFP4 8
INDIRF4
GEF4 $240
line 681
;681:		accel = baseAccel;
ADDRLP4 12
ADDRFP4 8
INDIRF4
ASGNF4
line 682
;682:	}
LABELV $240
LABELV $239
line 684
;683:
;684:	accelspeed = accel* baseInc;
ADDRLP4 4
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 685
;685:	if (accelspeed > addspeed) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $242
line 686
;686:		accelspeed = addspeed;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 687
;687:	}
LABELV $242
line 689
;688:	
;689:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $244
line 690
;690:		pm->ps->velocity[i] += accelspeed*wishdir[i];	
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 40
ADDRLP4 36
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 36
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 691
;691:	}
LABELV $245
line 689
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $244
line 692
;692:}
LABELV $231
endproc PM_SickoAccelerate 44 0
proc PM_QuaJKAccelerate 68 0
line 700
;693:/*
;694:==============
;695:PM_Accelerate
;696:
;697:Handles user intended acceleration
;698:==============
;699:*/
;700:static void PM_QuaJKAccelerate( vec3_t wishdir, float wishspeed, float baseAccel, float maxAccel, float maxAccelWishSpeed) {
line 709
;701:	// q2 style
;702:	int			i;
;703:	float		addspeed, accelspeed, currentspeed;
;704:	float		accel;
;705:	float		f,finalWishSpeed;
;706:	float		accelAddSlow, accelAddHigh;
;707:	float		neededSpeedSlow, neededSpeedHigh;
;708:
;709:	currentspeed = DotProduct (pm->ps->velocity, wishdir);
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 44
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRF4
MULF4
ADDRLP4 44
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 711
;710:
;711:	if (currentspeed >= wishspeed) return;
ADDRLP4 16
INDIRF4
ADDRFP4 4
INDIRF4
LTF4 $249
ADDRGP4 $248
JUMPV
LABELV $249
line 713
;712:
;713:	accelAddSlow = baseAccel * pml.frametime * wishspeed;
ADDRLP4 36
ADDRFP4 8
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 714
;714:	accelAddHigh = maxAccel * pml.frametime * maxAccelWishSpeed;
ADDRLP4 40
ADDRFP4 12
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 716
;715:
;716:	neededSpeedSlow = wishspeed - accelAddSlow;
ADDRLP4 28
ADDRFP4 4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ASGNF4
line 717
;717:	neededSpeedHigh = maxAccelWishSpeed - accelAddHigh;
ADDRLP4 24
ADDRFP4 16
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ASGNF4
line 719
;718:
;719:	if (neededSpeedSlow == neededSpeedHigh) {
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
NEF4 $253
line 721
;720:		// idk if this can happen but just to avoid division by 0
;721:		f = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 722
;722:	}
ADDRGP4 $254
JUMPV
LABELV $253
line 723
;723:	else {
line 724
;724:		f = (currentspeed - neededSpeedHigh) / (neededSpeedSlow - neededSpeedHigh);
ADDRLP4 8
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
SUBF4
DIVF4
ASGNF4
line 725
;725:	}
LABELV $254
line 727
;726:
;727:	if (f < 0) f = 0;
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $255
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRGP4 $256
JUMPV
LABELV $255
line 728
;728:	else if (f > 1) f = 1;
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
LEF4 $257
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
LABELV $257
LABELV $256
line 730
;729:
;730:	accel = (f * baseAccel) + ((1.0f - f) * maxAccel);
ADDRLP4 32
ADDRLP4 8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
CNSTF4 1065353216
ADDRLP4 8
INDIRF4
SUBF4
ADDRFP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 731
;731:	finalWishSpeed = (f * wishspeed) + ((1.0f - f) * maxAccelWishSpeed);
ADDRLP4 20
ADDRLP4 8
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
CNSTF4 1065353216
ADDRLP4 8
INDIRF4
SUBF4
ADDRFP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 733
;732:
;733:	accelspeed = accel * pml.frametime * finalWishSpeed;
ADDRLP4 4
ADDRLP4 32
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 735
;734:
;735:	addspeed = finalWishSpeed - currentspeed; 
ADDRLP4 12
ADDRLP4 20
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
line 736
;736:	if (addspeed <= 0) {
ADDRLP4 12
INDIRF4
CNSTF4 0
GTF4 $260
line 737
;737:		return;
ADDRGP4 $248
JUMPV
LABELV $260
line 762
;738:	}
;739:
;740:	/*
;741:	addspeed = wishspeed - currentspeed;
;742:	if (addspeed <= 0) {
;743:		return;
;744:	}
;745:
;746:	baseInc = pml.frametime * wishspeed;
;747:
;748:	accel = addspeed / baseInc;
;749:
;750:	if (accel > maxAccel) {
;751:		accel = maxAccel;
;752:	}
;753:	else if (accel < baseAccel) {
;754:		accel = baseAccel;
;755:	}
;756:
;757:	f = (accel - baseAccel) / (maxAccel - baseAccel);
;758:
;759:	finalWishSpeed = (f * maxAccelWishSpeed) + ((1.0f - f) * baseAccel);
;760:
;761:	accelspeed = accel* pml.frametime*finalWishSpeed;*/
;762:	if (accelspeed > addspeed) {
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
LEF4 $262
line 763
;763:		accelspeed = addspeed;
ADDRLP4 4
ADDRLP4 12
INDIRF4
ASGNF4
line 764
;764:	}
LABELV $262
line 766
;765:	
;766:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $264
line 767
;767:		pm->ps->velocity[i] += accelspeed*wishdir[i];	
ADDRLP4 60
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
ADDRLP4 60
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 60
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 768
;768:	}
LABELV $265
line 766
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $264
line 769
;769:}
LABELV $248
endproc PM_QuaJKAccelerate 68 0
lit
align 4
LABELV $269
byte 4 1084227584
code
proc PM_DreamAccelerate 204 8
line 772
;770:
;771:
;772:static void PM_DreamAccelerate( vec3_t wishdir, float wishspeed, float baseAccel, float maxAccel, float maxAccelWishSpeed) {
line 783
;773:	// q2 style
;774:	int			i;
;775:	float		addspeed, accelspeed, currentspeed;
;776:	float		accel;
;777:	float		f,finalWishSpeed;
;778:	float		accelAddSlow, accelAddHigh;
;779:	float		neededSpeedSlow, neededSpeedHigh;
;780:	float		scale;
;781:	float		maxFront;
;782:	float		tmp;
;783:	float		h = 2.0;
ADDRLP4 28
CNSTF4 1073741824
ASGNF4
line 784
;784:	float		velTotal = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 72
INDIRF4
ASGNF4
line 789
;785:	float		w;
;786:	float		idealVelRatio;
;787:	static const float backpow = 5.0f;
;788:
;789:	currentspeed = DotProduct (pm->ps->velocity, wishdir);
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 76
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
INDIRF4
MULF4
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 76
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 791
;790:
;791:	if (currentspeed >= wishspeed) return;
ADDRLP4 16
INDIRF4
ADDRFP4 4
INDIRF4
LTF4 $270
ADDRGP4 $268
JUMPV
LABELV $270
line 793
;792:
;793:	accelAddSlow = baseAccel * pml.frametime * wishspeed;
ADDRLP4 12
ADDRFP4 8
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 794
;794:	accelAddHigh = maxAccel * pml.frametime * maxAccelWishSpeed;
ADDRLP4 60
ADDRFP4 12
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 796
;795:
;796:	neededSpeedSlow = wishspeed - accelAddSlow;
ADDRLP4 68
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 797
;797:	neededSpeedHigh = maxAccelWishSpeed - accelAddHigh;
ADDRLP4 64
ADDRFP4 16
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
ASGNF4
line 799
;798:
;799:	if (currentspeed < 0) {
ADDRLP4 16
INDIRF4
CNSTF4 0
GEF4 $274
line 800
;800:		f = (-1.0f*currentspeed)/velTotal;
ADDRLP4 8
CNSTF4 3212836864
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 24
INDIRF4
DIVF4
ASGNF4
line 801
;801:		f = 1.0f - powf(1.0f - f, backpow);
ADDRLP4 84
CNSTF4 1065353216
ASGNF4
ADDRLP4 84
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ARGF4
ADDRGP4 $269
INDIRF4
ARGF4
ADDRLP4 88
ADDRGP4 powf
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 84
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
ASGNF4
line 802
;802:	}
ADDRGP4 $275
JUMPV
LABELV $274
line 803
;803:	else {
line 804
;804:		if (neededSpeedSlow == neededSpeedHigh) {
ADDRLP4 68
INDIRF4
ADDRLP4 64
INDIRF4
NEF4 $276
line 805
;805:			f = 1.0f;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 806
;806:		}
ADDRGP4 $277
JUMPV
LABELV $276
line 807
;807:		else {
line 808
;808:			f = (currentspeed - neededSpeedHigh) / (neededSpeedSlow - neededSpeedHigh);
ADDRLP4 84
ADDRLP4 64
INDIRF4
ASGNF4
ADDRLP4 8
ADDRLP4 16
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
ADDRLP4 68
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
DIVF4
ASGNF4
line 809
;809:		}
LABELV $277
line 810
;810:	}
LABELV $275
line 812
;811:
;812:	if (f < 0) f = 0;
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $278
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRGP4 $279
JUMPV
LABELV $278
line 813
;813:	else if (f > 1) f = 1;
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
LEF4 $280
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
LABELV $280
LABELV $279
line 815
;814:
;815:	accel = (f * baseAccel) + ((1.0f - f) * maxAccel);
ADDRLP4 56
ADDRLP4 8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
CNSTF4 1065353216
ADDRLP4 8
INDIRF4
SUBF4
ADDRFP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 816
;816:	finalWishSpeed = (f * wishspeed) + ((1.0f - f) * maxAccelWishSpeed);
ADDRLP4 36
ADDRLP4 8
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
CNSTF4 1065353216
ADDRLP4 8
INDIRF4
SUBF4
ADDRFP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 820
;817:
;818:
;819:
;820:	accelspeed = accel * pml.frametime * finalWishSpeed;
ADDRLP4 4
ADDRLP4 56
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 822
;821:
;822:	addspeed = finalWishSpeed - currentspeed; 
ADDRLP4 32
ADDRLP4 36
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
line 823
;823:	if (addspeed <= 0) {
ADDRLP4 32
INDIRF4
CNSTF4 0
GTF4 $283
line 824
;824:		return;
ADDRGP4 $268
JUMPV
LABELV $283
line 827
;825:	}
;826:
;827:	if (accelspeed > addspeed) {
ADDRLP4 4
INDIRF4
ADDRLP4 32
INDIRF4
LEF4 $285
line 828
;828:		accelspeed = addspeed;
ADDRLP4 4
ADDRLP4 32
INDIRF4
ASGNF4
line 829
;829:	}
LABELV $285
line 831
;830:
;831:	w = accelAddSlow + wishspeed;
ADDRLP4 48
ADDRLP4 12
INDIRF4
ADDRFP4 4
INDIRF4
ADDF4
ASGNF4
line 832
;832:	idealVelRatio = (w * w) / (velTotal*velTotal);
ADDRLP4 52
ADDRLP4 48
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDRLP4 24
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
DIVF4
ASGNF4
line 833
;833:	idealVelRatio *= accelAddSlow / (wishspeed + accelAddSlow);
ADDRLP4 52
ADDRLP4 52
INDIRF4
ADDRLP4 12
INDIRF4
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
DIVF4
MULF4
ASGNF4
line 834
;834:	maxFront = idealVelRatio * velTotal;
ADDRLP4 40
ADDRLP4 52
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 837
;835:
;836:	// don't even ask lmfao...
;837:	tmp = 2 * wishdir[0] * pm->ps->velocity[0] + 2 * wishdir[1] * pm->ps->velocity[1] + 2.0f * wishdir[2] * pm->ps->velocity[2];
ADDRLP4 104
CNSTF4 1073741824
ASGNF4
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 104
INDIRF4
ADDRLP4 108
INDIRP4
INDIRF4
MULF4
ADDRLP4 112
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 104
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 112
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 104
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDRLP4 112
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 838
;838:	scale = (-2.0f * wishdir[0] * pm->ps->velocity[0] - 2.0f * wishdir[1] * pm->ps->velocity[1] - 2.0f * wishdir[2] * pm->ps->velocity[2] + sqrtf(tmp*tmp + 4 * h * maxFront * (wishdir[0]*wishdir[0] + wishdir[1]*wishdir[1] + wishdir[2]*wishdir[2]) * (h * maxFront + 2.0f * sqrtf(pm->ps->velocity[0]* pm->ps->velocity[0] + pm->ps->velocity[1]*pm->ps->velocity[1] + pm->ps->velocity[2]*pm->ps->velocity[2])))) / (2.0 * h * (wishdir[0]*wishdir[0] + wishdir[1]*wishdir[1] + wishdir[2]*wishdir[2]));
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 116
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 124
ADDRLP4 116
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 128
ADDRLP4 116
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ASGNF4
ADDRLP4 120
INDIRF4
ADDRLP4 120
INDIRF4
MULF4
ADDRLP4 124
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ADDF4
ADDRLP4 128
INDIRF4
ADDRLP4 128
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 132
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
ADDRLP4 148
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 156
ADDRLP4 148
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 160
ADDRLP4 148
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 44
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
CNSTF4 1082130432
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 40
INDIRF4
MULF4
ADDRLP4 152
INDIRF4
ADDRLP4 152
INDIRF4
MULF4
ADDRLP4 156
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ADDF4
ADDRLP4 160
INDIRF4
ADDRLP4 160
INDIRF4
MULF4
ADDF4
MULF4
ADDRLP4 28
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
CNSTF4 1073741824
ADDRLP4 132
INDIRF4
MULF4
ADDF4
MULF4
ADDF4
ARGF4
ADDRLP4 164
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 168
CNSTF4 1073741824
ASGNF4
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
ADDRLP4 172
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 180
ADDRLP4 172
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 184
ADDRLP4 172
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20
CNSTF4 3221225472
ADDRLP4 152
INDIRF4
MULF4
ADDRLP4 120
INDIRF4
MULF4
ADDRLP4 168
INDIRF4
ADDRLP4 156
INDIRF4
MULF4
ADDRLP4 124
INDIRF4
MULF4
SUBF4
ADDRLP4 168
INDIRF4
ADDRLP4 160
INDIRF4
MULF4
ADDRLP4 128
INDIRF4
MULF4
SUBF4
ADDRLP4 164
INDIRF4
ADDF4
CNSTF4 1073741824
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 176
INDIRF4
ADDRLP4 176
INDIRF4
MULF4
ADDRLP4 180
INDIRF4
ADDRLP4 180
INDIRF4
MULF4
ADDF4
ADDRLP4 184
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDF4
MULF4
DIVF4
ASGNF4
line 840
;839:
;840:	if (scale < 0 || fpclassify(scale) == FP_NAN) {
ADDRLP4 20
INDIRF4
CNSTF4 0
LTF4 $289
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 192
ADDRGP4 fpclassify
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
NEI4 $287
LABELV $289
line 841
;841:		return;
ADDRGP4 $268
JUMPV
LABELV $287
line 843
;842:	} 
;843:	else if (scale > accelspeed)
ADDRLP4 20
INDIRF4
ADDRLP4 4
INDIRF4
LEF4 $290
line 844
;844:	{
line 845
;845:		scale = accelspeed;
ADDRLP4 20
ADDRLP4 4
INDIRF4
ASGNF4
line 846
;846:	}
LABELV $290
line 847
;847:	accelspeed = scale;
ADDRLP4 4
ADDRLP4 20
INDIRF4
ASGNF4
LABELV $292
line 851
;848:	
;849:
;850:applyaccel:
;851:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $293
line 852
;852:		pm->ps->velocity[i] += accelspeed*wishdir[i];	
ADDRLP4 196
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 200
ADDRLP4 196
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 200
INDIRP4
ADDRLP4 200
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 196
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 853
;853:	}
LABELV $294
line 851
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $293
line 854
;854:}
LABELV $268
endproc PM_DreamAccelerate 204 8
proc PM_CmdScale 48 4
line 867
;855:
;856:
;857:
;858:/*
;859:============
;860:PM_CmdScale
;861:
;862:Returns the scale factor to apply to cmd movements
;863:This allows the clients to use axial -127 to 127 values for all directions
;864:without getting a sqrt(2) distortion in speed.
;865:============
;866:*/
;867:static float PM_CmdScale( usercmd_t *cmd ) {
line 871
;868:	int		max;
;869:	float	total;
;870:	float	scale;
;871:	int		umove = 0; //cmd->upmove;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 874
;872:			//don't factor upmove into scaling speed
;873:
;874:	if (pm->modParms.physics == MV_JK2SP) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $298
line 875
;875:		umove = cmd->upmove;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ASGNI4
line 876
;876:	}
LABELV $298
line 878
;877:
;878:	max = abs( cmd->forwardmove );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 16
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 879
;879:	if ( abs( cmd->rightmove ) > max ) {
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $300
line 880
;880:		max = abs( cmd->rightmove );
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 881
;881:	}
LABELV $300
line 882
;882:	if ( abs( umove ) > max ) {
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $302
line 883
;883:		max = abs( umove );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 884
;884:	}
LABELV $302
line 885
;885:	if ( !max ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $304
line 886
;886:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $297
JUMPV
LABELV $304
line 889
;887:	}
;888:
;889:	total = sqrtf( cmd->forwardmove * cmd->forwardmove
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
ADDRLP4 28
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 32
INDIRI4
MULI4
ADDRLP4 36
INDIRI4
ADDRLP4 36
INDIRI4
MULI4
ADDI4
ADDRLP4 4
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 44
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 44
INDIRF4
ASGNF4
line 891
;890:		+ cmd->rightmove * cmd->rightmove + umove * umove );
;891:	scale = (float)pm->ps->speed * max / ( 127.0f * total );
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CNSTF4 1123942400
ADDRLP4 8
INDIRF4
MULF4
DIVF4
ASGNF4
line 893
;892:
;893:	return scale;
ADDRLP4 12
INDIRF4
RETF4
LABELV $297
endproc PM_CmdScale 48 4
proc PM_SetMovementDir 72 0
line 905
;894:}
;895:
;896:
;897:/*
;898:================
;899:PM_SetMovementDir
;900:
;901:Determine the rotation of the legs reletive
;902:to the facing dir
;903:================
;904:*/
;905:static void PM_SetMovementDir( void ) {
line 906
;906:	if ( pm->cmd.forwardmove || pm->cmd.rightmove ) {
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $309
ADDRLP4 0
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
EQI4 $307
LABELV $309
line 907
;907:		if ( pm->cmd.rightmove == 0 && pm->cmd.forwardmove > 0 ) {
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $310
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
LEI4 $310
line 908
;908:			pm->ps->movementDir = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 0
ASGNI4
line 909
;909:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove > 0 ) {
ADDRGP4 $308
JUMPV
LABELV $310
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
GEI4 $312
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
LEI4 $312
line 910
;910:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 1
ASGNI4
line 911
;911:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove == 0 ) {
ADDRGP4 $308
JUMPV
LABELV $312
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
GEI4 $314
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
NEI4 $314
line 912
;912:			pm->ps->movementDir = 2;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 2
ASGNI4
line 913
;913:		} else if ( pm->cmd.rightmove < 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $308
JUMPV
LABELV $314
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
GEI4 $316
ADDRLP4 32
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
GEI4 $316
line 914
;914:			pm->ps->movementDir = 3;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 3
ASGNI4
line 915
;915:		} else if ( pm->cmd.rightmove == 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $308
JUMPV
LABELV $316
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
NEI4 $318
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
GEI4 $318
line 916
;916:			pm->ps->movementDir = 4;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 4
ASGNI4
line 917
;917:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove < 0 ) {
ADDRGP4 $308
JUMPV
LABELV $318
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
LEI4 $320
ADDRLP4 48
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 52
INDIRI4
GEI4 $320
line 918
;918:			pm->ps->movementDir = 5;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 5
ASGNI4
line 919
;919:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove == 0 ) {
ADDRGP4 $308
JUMPV
LABELV $320
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
LEI4 $322
ADDRLP4 56
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
NEI4 $322
line 920
;920:			pm->ps->movementDir = 6;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 6
ASGNI4
line 921
;921:		} else if ( pm->cmd.rightmove > 0 && pm->cmd.forwardmove > 0 ) {
ADDRGP4 $308
JUMPV
LABELV $322
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
LEI4 $308
ADDRLP4 64
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
LEI4 $308
line 922
;922:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 7
ASGNI4
line 923
;923:		}
line 924
;924:	} else {
ADDRGP4 $308
JUMPV
LABELV $307
line 928
;925:		// if they aren't actively going directly sideways,
;926:		// change the animation to the diagonal so they
;927:		// don't stop too crooked
;928:		if ( pm->ps->movementDir == 2 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 2
NEI4 $326
line 929
;929:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 1
ASGNI4
line 930
;930:		} else if ( pm->ps->movementDir == 6 ) {
ADDRGP4 $327
JUMPV
LABELV $326
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 6
NEI4 $328
line 931
;931:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 7
ASGNI4
line 932
;932:		} 
LABELV $328
LABELV $327
line 933
;933:	}
LABELV $308
line 934
;934:}
LABELV $306
endproc PM_SetMovementDir 72 0
export PM_ForceJumpingUp
proc PM_ForceJumpingUp 44 16
line 939
;935:
;936:#define METROID_JUMP 1
;937:
;938:qboolean PM_ForceJumpingUp(void)
;939:{
line 940
;940:	if ( !(pm->ps->fd.forcePowersActive&(1<<FP_LEVITATION)) && pm->ps->fd.forceJumpCharge )
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $331
ADDRLP4 0
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
EQF4 $331
line 941
;941:	{//already jumped and let go
line 942
;942:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $330
JUMPV
LABELV $331
line 945
;943:	}
;944:
;945:	if ( BG_InSpecialJump( pm->ps->legsAnim, pm->modParms.runFlags ) )
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $333
line 946
;946:	{
line 947
;947:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $330
JUMPV
LABELV $333
line 950
;948:	}
;949:
;950:	if (BG_SaberInSpecial(pm->ps->saberMove))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $335
line 951
;951:	{
line 952
;952:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $330
JUMPV
LABELV $335
line 955
;953:	}
;954:
;955:	if (BG_SaberInSpecialAttack(pm->ps->legsAnim))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $337
line 956
;956:	{
line 957
;957:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $330
JUMPV
LABELV $337
line 960
;958:	}
;959:
;960:	if (BG_HasYsalamiri(pm->gametype, pm->ps))
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $339
line 961
;961:	{
line 962
;962:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $330
JUMPV
LABELV $339
line 965
;963:	}
;964:
;965:	if (!BG_CanUseFPNow(pm->gametype, pm->ps, pm->cmd.serverTime, FP_LEVITATION))
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 32
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $341
line 966
;966:	{
line 967
;967:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $330
JUMPV
LABELV $341
line 970
;968:	}
;969:
;970:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE && //in air
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $343
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 40
INDIRI4
EQI4 $343
ADDRLP4 36
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
LEI4 $343
ADDRLP4 36
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $343
line 974
;971:		(pm->ps->pm_flags & PMF_JUMP_HELD) && //jumped
;972:		pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_0 && //force-jump capable
;973:		pm->ps->velocity[2] > 0 )//going up
;974:	{
line 975
;975:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $330
JUMPV
LABELV $343
line 977
;976:	}
;977:	return qfalse;
CNSTI4 0
RETI4
LABELV $330
endproc PM_ForceJumpingUp 44 16
export PM_JumpForDir
proc PM_JumpForDir 8 16
line 981
;978:}
;979:
;980:void PM_JumpForDir( void )
;981:{
line 982
;982:	int anim = BOTH_JUMP1;
ADDRLP4 0
CNSTI4 856
ASGNI4
line 983
;983:	if ( pm->cmd.forwardmove > 0 ) 
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $346
line 984
;984:	{
line 985
;985:		anim = BOTH_JUMP1;
ADDRLP4 0
CNSTI4 856
ASGNI4
line 986
;986:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 987
;987:	} 
ADDRGP4 $347
JUMPV
LABELV $346
line 988
;988:	else if ( pm->cmd.forwardmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $348
line 989
;989:	{
line 990
;990:		anim = BOTH_JUMPBACK1;
ADDRLP4 0
CNSTI4 860
ASGNI4
line 991
;991:		pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 992
;992:	}
ADDRGP4 $349
JUMPV
LABELV $348
line 993
;993:	else if ( pm->cmd.rightmove > 0 ) 
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $350
line 994
;994:	{
line 995
;995:		anim = BOTH_JUMPRIGHT1;
ADDRLP4 0
CNSTI4 866
ASGNI4
line 996
;996:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 997
;997:	}
ADDRGP4 $351
JUMPV
LABELV $350
line 998
;998:	else if ( pm->cmd.rightmove < 0 ) 
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $352
line 999
;999:	{
line 1000
;1000:		anim = BOTH_JUMPLEFT1;
ADDRLP4 0
CNSTI4 863
ASGNI4
line 1001
;1001:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1002
;1002:	}
ADDRGP4 $353
JUMPV
LABELV $352
line 1004
;1003:	else
;1004:	{
line 1005
;1005:		anim = BOTH_JUMP1;
ADDRLP4 0
CNSTI4 856
ASGNI4
line 1006
;1006:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1007
;1007:	}
LABELV $353
LABELV $351
LABELV $349
LABELV $347
line 1008
;1008:	if(!BG_InDeathAnim(pm->ps->legsAnim))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $354
line 1009
;1009:	{
line 1010
;1010:		PM_SetAnim(SETANIM_LEGS,anim,SETANIM_FLAG_OVERRIDE, 100);
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1011
;1011:	}
LABELV $354
line 1012
;1012:}
LABELV $345
endproc PM_JumpForDir 8 16
export PM_SetPMViewAngle
proc PM_SetPMViewAngle 12 0
line 1015
;1013:
;1014:void PM_SetPMViewAngle(playerState_t *ps, vec3_t angle, usercmd_t *ucmd)
;1015:{
line 1018
;1016:	int			i;
;1017:
;1018:	for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $357
line 1019
;1019:	{ // set the delta angle
line 1022
;1020:		int		cmdAngle;
;1021:
;1022:		cmdAngle = ANGLE2SHORT(angle[i]);
ADDRLP4 4
CNSTF4 1199570944
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 1023
;1023:		ps->delta_angles[i] = cmdAngle - ucmd->angles[i];
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
CNSTI4 68
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1024
;1024:	}
LABELV $358
line 1018
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $357
line 1025
;1025:	VectorCopy (angle, ps->viewangles);
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 1026
;1026:}
LABELV $356
endproc PM_SetPMViewAngle 12 0
export PM_AdjustAngleForWallRun
proc PM_AdjustAngleForWallRun 1220 28
line 1029
;1027:
;1028:qboolean PM_AdjustAngleForWallRun( playerState_t *ps, usercmd_t *ucmd, qboolean doMove )
;1029:{
line 1030
;1030:	if (( (ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT || (ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT ) && ps->legsTimer > 500 )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 915
EQI4 $364
ADDRLP4 0
INDIRI4
CNSTI4 918
NEI4 $362
LABELV $364
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 500
LEI4 $362
line 1031
;1031:	{//wall-running and not at end of anim
line 1037
;1032:		//stick to wall, if there is one
;1033:		vec3_t	rt, traceTo, mins, maxs, fwdAngles;
;1034:		trace_t	trace;
;1035:		float	dist, yawAdjust;
;1036:
;1037:		VectorSet(mins, -15, -15, 0);
ADDRLP4 1152
CNSTF4 3245342720
ASGNF4
ADDRLP4 44
ADDRLP4 1152
INDIRF4
ASGNF4
ADDRLP4 44+4
ADDRLP4 1152
INDIRF4
ASGNF4
ADDRLP4 44+8
CNSTF4 0
ASGNF4
line 1038
;1038:		VectorSet(maxs, 15, 15, 24);
ADDRLP4 1156
CNSTF4 1097859072
ASGNF4
ADDRLP4 56
ADDRLP4 1156
INDIRF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 1156
INDIRF4
ASGNF4
ADDRLP4 56+8
CNSTF4 1103101952
ASGNF4
line 1039
;1039:		VectorSet(fwdAngles, 0, pm->ps->viewangles[YAW], 0);
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 20+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 20+8
CNSTF4 0
ASGNF4
line 1041
;1040:
;1041:		AngleVectors( fwdAngles, NULL, rt, NULL );
ADDRLP4 20
ARGP4
ADDRLP4 1160
CNSTP4 0
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1042
;1042:		if ( (ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT )
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 915
NEI4 $371
line 1043
;1043:		{
line 1044
;1044:			dist = 128;
ADDRLP4 16
CNSTF4 1124073472
ASGNF4
line 1045
;1045:			yawAdjust = -90;
ADDRLP4 1148
CNSTF4 3266576384
ASGNF4
line 1046
;1046:		}
ADDRGP4 $372
JUMPV
LABELV $371
line 1048
;1047:		else
;1048:		{
line 1049
;1049:			dist = -128;
ADDRLP4 16
CNSTF4 3271557120
ASGNF4
line 1050
;1050:			yawAdjust = 90;
ADDRLP4 1148
CNSTF4 1119092736
ASGNF4
line 1051
;1051:		}
LABELV $372
line 1052
;1052:		VectorMA( ps->origin, dist, rt, traceTo );
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1168
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 32
ADDRLP4 1164
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 1168
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 1164
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 1168
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+8
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 1054
;1053:		
;1054:		pm->trace( &trace, ps->origin, mins, maxs, traceTo, ps->clientNum, MASK_PLAYERSOLID );
ADDRLP4 68
ARGP4
ADDRLP4 1172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1172
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 1172
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 1056
;1055:
;1056:		if ( trace.fraction < 1.0f )
ADDRLP4 68+8
INDIRF4
CNSTF4 1065353216
GEF4 $377
line 1057
;1057:		{//still a wall there
line 1058
;1058:			if ( (ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT )
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 915
NEI4 $380
line 1059
;1059:			{
line 1060
;1060:				ucmd->rightmove = 127;
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 127
ASGNI1
line 1061
;1061:			}
ADDRGP4 $381
JUMPV
LABELV $380
line 1063
;1062:			else
;1063:			{
line 1064
;1064:				ucmd->rightmove = -127;
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 -127
ASGNI1
line 1065
;1065:			}
LABELV $381
line 1066
;1066:			if ( ucmd->upmove < 0 )
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $382
line 1067
;1067:			{
line 1068
;1068:				ucmd->upmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 1069
;1069:			}
LABELV $382
line 1073
;1070:			//make me face perpendicular to the wall
;1071:			// NOTE: Something about these 3 lines is perhaps not quite non-deterministic (or is it?) but
;1072:			// it makes replays not work properly. Why is that?
;1073:			ps->viewangles[YAW] = vectoyaw( trace.plane.normal )+yawAdjust;
ADDRLP4 68+24
ARGP4
ADDRLP4 1176
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 1176
INDIRF4
ADDRLP4 1148
INDIRF4
ADDF4
ASGNF4
line 1075
;1074:
;1075:			PM_SetPMViewAngle(ps, ps->viewangles, ucmd);
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1180
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 PM_SetPMViewAngle
CALLV
pop
line 1077
;1076:
;1077:			ucmd->angles[YAW] = ((int)(ANGLE2SHORT( ps->viewangles[YAW] ))) - (int)ps->delta_angles[YAW];
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1199570944
ADDRLP4 1184
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDRLP4 1184
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1078
;1078:			ucmd->angles[YAW] &= 65535;
ADDRLP4 1188
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 1188
INDIRP4
ADDRLP4 1188
INDIRP4
INDIRI4
CNSTI4 65535
BANDI4
ASGNI4
line 1079
;1079:			if ( doMove )
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $385
line 1080
;1080:			{
line 1083
;1081:				//push me forward
;1082:				vec3_t	fwd;
;1083:				float	zVel = ps->velocity[2];
ADDRLP4 1192
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ASGNF4
line 1084
;1084:				if ( ps->legsTimer > 500 )
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 500
LEI4 $387
line 1085
;1085:				{//not at end of anim yet
line 1086
;1086:					float speed = 175;
ADDRLP4 1208
CNSTF4 1127153664
ASGNF4
line 1088
;1087:
;1088:					fwdAngles[YAW] = ps->viewangles[YAW];
ADDRLP4 20+4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 1089
;1089:					AngleVectors( fwdAngles, fwd, NULL, NULL );
ADDRLP4 20
ARGP4
ADDRLP4 1196
ARGP4
ADDRLP4 1212
CNSTP4 0
ASGNP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1091
;1090:
;1091:					if ( ucmd->forwardmove < 0 )
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $390
line 1092
;1092:					{//slower
line 1093
;1093:						speed = 100;
ADDRLP4 1208
CNSTF4 1120403456
ASGNF4
line 1094
;1094:					}
ADDRGP4 $391
JUMPV
LABELV $390
line 1095
;1095:					else if ( ucmd->forwardmove > 0 )
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $392
line 1096
;1096:					{
line 1097
;1097:						speed = 250;//running speed
ADDRLP4 1208
CNSTF4 1132068864
ASGNF4
line 1098
;1098:					}
LABELV $392
LABELV $391
line 1099
;1099:					VectorScale( fwd, speed, ps->velocity );
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1196
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1196+4
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1196+8
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
ASGNF4
line 1100
;1100:				}
LABELV $387
line 1101
;1101:				ps->velocity[2] = zVel;//preserve z velocity
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1192
INDIRF4
ASGNF4
line 1103
;1102:				//pull me toward the wall, too
;1103:				VectorMA( ps->velocity, dist, rt, ps->velocity );
ADDRLP4 1208
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1208
INDIRP4
ADDRLP4 1208
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1212
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1212
INDIRP4
ADDRLP4 1212
INDIRP4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1216
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1216
INDIRP4
ADDRLP4 1216
INDIRP4
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 1104
;1104:			}
LABELV $385
line 1105
;1105:			ucmd->forwardmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 0
ASGNI1
line 1106
;1106:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $361
JUMPV
LABELV $377
line 1108
;1107:		}
;1108:		else if ( doMove )
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $398
line 1109
;1109:		{//stop it
line 1110
;1110:			if ( (ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT )
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 915
NEI4 $400
line 1111
;1111:			{
line 1112
;1112:				PM_SetAnim(SETANIM_BOTH, BOTH_WALL_RUN_RIGHT_STOP, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0);
ADDRLP4 1176
CNSTI4 3
ASGNI4
ADDRLP4 1176
INDIRI4
ARGI4
CNSTI4 917
ARGI4
ADDRLP4 1176
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1113
;1113:			}
ADDRGP4 $401
JUMPV
LABELV $400
line 1114
;1114:			else if ( (ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT )
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 918
NEI4 $402
line 1115
;1115:			{
line 1116
;1116:				PM_SetAnim(SETANIM_BOTH, BOTH_WALL_RUN_LEFT_STOP, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0);
ADDRLP4 1176
CNSTI4 3
ASGNI4
ADDRLP4 1176
INDIRI4
ARGI4
CNSTI4 920
ARGI4
ADDRLP4 1176
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1117
;1117:			}
LABELV $402
LABELV $401
line 1118
;1118:		}
LABELV $398
line 1119
;1119:	}
LABELV $362
line 1121
;1120:
;1121:	return qfalse;
CNSTI4 0
RETI4
LABELV $361
endproc PM_AdjustAngleForWallRun 1220 28
proc BG_ForceWallJumpStrength 0 0
line 1127
;1122:}
;1123:
;1124:#define	JUMP_OFF_WALL_SPEED	200.0f
;1125://nice...
;1126:static float BG_ForceWallJumpStrength(void)
;1127:{
line 1128
;1128:	return (forceJumpStrength[FORCE_LEVEL_3] / 2.5f);
ADDRGP4 forceJumpStrength+12
INDIRF4
CNSTF4 1075838976
DIVF4
RETF4
LABELV $404
endproc BG_ForceWallJumpStrength 0 0
export PM_AdjustAngleForWallJump
proc PM_AdjustAngleForWallJump 1240 28
line 1131
;1129:}
;1130:qboolean PM_AdjustAngleForWallJump(playerState_t* ps, usercmd_t* ucmd, qboolean doMove)
;1131:{
line 1132
;1132:	if (((BG_InReboundJump(ps->legsAnim) || BG_InReboundHold(ps->legsAnim))
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_InReboundJump
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $411
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_InReboundHold
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $410
LABELV $411
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_InReboundJump
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $409
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_InReboundHold
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $409
LABELV $410
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $407
LABELV $409
line 1135
;1133:		&& (BG_InReboundJump(ps->torsoAnim) || BG_InReboundHold(ps->torsoAnim)))
;1134:		|| (pm->ps->pm_flags & PMF_STUCK_TO_WALL))
;1135:	{//hugging wall, getting ready to jump off
line 1139
;1136:		//stick to wall, if there is one
;1137:		vec3_t	checkDir, traceTo, mins, maxs, fwdAngles;
;1138:		trace_t	trace;
;1139:		float	dist = 128.0f, yawAdjust;
ADDRLP4 28
CNSTF4 1124073472
ASGNF4
line 1141
;1140:
;1141:		VectorSet(mins, pm->mins[0], pm->mins[1], 0);
ADDRLP4 1164
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 1164
INDIRP4
CNSTI4 220
ADDP4
INDIRF4
ASGNF4
ADDRLP4 44+4
ADDRLP4 1164
INDIRP4
CNSTI4 224
ADDP4
INDIRF4
ASGNF4
ADDRLP4 44+8
CNSTF4 0
ASGNF4
line 1142
;1142:		VectorSet(maxs, pm->maxs[0], pm->maxs[1], 24);
ADDRLP4 1168
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 1168
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 1168
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56+8
CNSTF4 1103101952
ASGNF4
line 1143
;1143:		VectorSet(fwdAngles, 0, pm->ps->viewangles[YAW], 0);
ADDRLP4 1148
CNSTF4 0
ASGNF4
ADDRLP4 1148+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1148+8
CNSTF4 0
ASGNF4
line 1145
;1144:
;1145:		switch (ps->legsAnim)
ADDRLP4 1172
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 618
LTI4 $418
ADDRLP4 1172
INDIRI4
CNSTI4 626
GTI4 $433
ADDRLP4 1172
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $434-2472
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $434
address $427
address $422
address $428
address $418
address $418
address $418
address $421
address $418
address $427
code
LABELV $433
ADDRLP4 1172
INDIRI4
CNSTI4 674
EQI4 $422
ADDRLP4 1172
INDIRI4
CNSTI4 675
EQI4 $428
ADDRLP4 1172
INDIRI4
CNSTI4 676
EQI4 $421
ADDRGP4 $418
JUMPV
line 1146
;1146:		{
LABELV $421
line 1149
;1147:		case BOTH_FORCEWALLREBOUND_RIGHT:
;1148:		case BOTH_FORCEWALLHOLD_RIGHT:
;1149:			AngleVectors(fwdAngles, NULL, checkDir, NULL);
ADDRLP4 1148
ARGP4
ADDRLP4 1184
CNSTP4 0
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1150
;1150:			yawAdjust = -90;
ADDRLP4 1160
CNSTF4 3266576384
ASGNF4
line 1151
;1151:			break;
ADDRGP4 $419
JUMPV
LABELV $422
line 1154
;1152:		case BOTH_FORCEWALLREBOUND_LEFT:
;1153:		case BOTH_FORCEWALLHOLD_LEFT:
;1154:			AngleVectors(fwdAngles, NULL, checkDir, NULL);
ADDRLP4 1148
ARGP4
ADDRLP4 1188
CNSTP4 0
ASGNP4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1155
;1155:			VectorScale(checkDir, -1, checkDir);
ADDRLP4 1192
CNSTF4 3212836864
ASGNF4
ADDRLP4 16
ADDRLP4 1192
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 1192
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+8
CNSTF4 3212836864
ADDRLP4 16+8
INDIRF4
MULF4
ASGNF4
line 1156
;1156:			yawAdjust = 90;
ADDRLP4 1160
CNSTF4 1119092736
ASGNF4
line 1157
;1157:			break;
ADDRGP4 $419
JUMPV
LABELV $427
line 1160
;1158:		case BOTH_FORCEWALLREBOUND_FORWARD:
;1159:		case BOTH_FORCEWALLHOLD_FORWARD:
;1160:			AngleVectors(fwdAngles, checkDir, NULL, NULL);
ADDRLP4 1148
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1196
CNSTP4 0
ASGNP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1161
;1161:			yawAdjust = 180;
ADDRLP4 1160
CNSTF4 1127481344
ASGNF4
line 1162
;1162:			break;
ADDRGP4 $419
JUMPV
LABELV $428
line 1165
;1163:		case BOTH_FORCEWALLREBOUND_BACK:
;1164:		case BOTH_FORCEWALLHOLD_BACK:
;1165:			AngleVectors(fwdAngles, checkDir, NULL, NULL);
ADDRLP4 1148
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1200
CNSTP4 0
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1166
;1166:			VectorScale(checkDir, -1, checkDir);
ADDRLP4 1204
CNSTF4 3212836864
ASGNF4
ADDRLP4 16
ADDRLP4 1204
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 1204
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16+8
CNSTF4 3212836864
ADDRLP4 16+8
INDIRF4
MULF4
ASGNF4
line 1167
;1167:			yawAdjust = 0;
ADDRLP4 1160
CNSTF4 0
ASGNF4
line 1168
;1168:			break;
ADDRGP4 $419
JUMPV
LABELV $418
line 1171
;1169:		default:
;1170:			//WTF???
;1171:			pm->ps->pm_flags &= ~PMF_STUCK_TO_WALL;
ADDRLP4 1208
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1208
INDIRP4
ADDRLP4 1208
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1172
;1172:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $406
JUMPV
line 1173
;1173:			break;
LABELV $419
line 1177
;1174:		}
;1175:		//if (pm->debugMelee)
;1176:		//[JAPRO - Serverside + Clientside - Physics - Change g_debugmelee 1 so that it has kungfu moves but keeps normal wallgrab.  Create g_debugmelee 2 for kung fu moves and infinite wallgrab - Start]
;1177:		if (pm->debugMelee > 1) // we go directly to the JAPLUS/jaPRO behavior in jk2. why not, we're porting what ppl are using
ADDRGP4 pm
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 1
LEI4 $436
line 1178
;1178:		{//uber-skillz
line 1179
;1179:			if (ucmd->upmove > 0)
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $438
line 1180
;1180:			{//hold on until you let go manually
line 1181
;1181:				if (BG_InReboundHold(ps->legsAnim))
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 1184
ADDRGP4 BG_InReboundHold
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
EQI4 $440
line 1182
;1182:				{//keep holding
line 1183
;1183:					if (ps->legsTimer < 150)
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 150
GEI4 $441
line 1184
;1184:					{
line 1185
;1185:						ps->legsTimer = 150;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 150
ASGNI4
line 1186
;1186:					}
line 1187
;1187:				}
ADDRGP4 $441
JUMPV
LABELV $440
line 1189
;1188:				else
;1189:				{//if got to hold part of anim, play hold anim
line 1190
;1190:					if (ps->legsTimer <= 300)
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 300
GTI4 $444
line 1191
;1191:					{
line 1192
;1192:						ps->saberHolstered = 2;
ADDRFP4 0
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 2
ASGNI4
line 1193
;1193:						PM_SetAnim(SETANIM_BOTH, BOTH_FORCEWALLRELEASE_FORWARD + (ps->legsAnim - BOTH_FORCEWALLHOLD_FORWARD), SETANIM_FLAG_OVERRIDE | SETANIM_FLAG_HOLD, 0);
ADDRLP4 1188
CNSTI4 3
ASGNI4
ADDRLP4 1188
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 626
SUBI4
CNSTI4 677
ADDI4
ARGI4
ADDRLP4 1188
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1194
;1194:						ps->legsTimer = ps->torsoTimer = 150;
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
CNSTI4 150
ASGNI4
ADDRLP4 1192
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 1196
INDIRI4
ASGNI4
ADDRLP4 1192
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 1196
INDIRI4
ASGNI4
line 1195
;1195:					}
LABELV $444
line 1196
;1196:				}
LABELV $441
line 1197
;1197:			}
LABELV $438
line 1198
;1198:		}
LABELV $436
line 1200
;1199:		//[JAPRO - Serverside + Clientside - Physics - Change g_debugmelee 1 so that it has kungfu moves but keeps normal wallgrab.  Create g_debugmelee 2 for kung fu moves and infinite wallgrab - End]
;1200:		VectorMA(ps->origin, dist, checkDir, traceTo);
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1188
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 32
ADDRLP4 1184
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 1188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+4
ADDRLP4 1184
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 1188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32+8
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
line 1201
;1201:		pm->trace(&trace, ps->origin, mins, maxs, traceTo, ps->clientNum, MASK_PLAYERSOLID);
ADDRLP4 68
ARGP4
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1192
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 1192
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 1203
;1202:		if ( //ucmd->upmove <= 0 && 
;1203:			ps->legsTimer > 100 &&
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 100
LEI4 $450
ADDRLP4 68+8
INDIRF4
CNSTF4 1065353216
GEF4 $450
ADDRLP4 68+24+8
INDIRF4
ARGF4
ADDRLP4 1196
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 1196
INDIRF4
CNSTF4 1045220557
GTF4 $450
line 1206
;1204:			trace.fraction < 1.0f &&
;1205:			fabs(trace.plane.normal[2]) <= 0.2f/*MAX_WALL_GRAB_SLOPE*/)
;1206:		{//still a vertical wall there
line 1214
;1207:			//FIXME: don't pull around 90 turns
;1208:			/*
;1209:			if ( ent->s.number || !player_locked )
;1210:			{
;1211:				ucmd->forwardmove = 127;
;1212:			}
;1213:			*/
;1214:			if (ucmd->upmove < 0)
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $455
line 1215
;1215:			{
line 1216
;1216:				ucmd->upmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 1217
;1217:			}
LABELV $455
line 1219
;1218:			//align me to the wall
;1219:			ps->viewangles[YAW] = vectoyaw(trace.plane.normal) + yawAdjust;
ADDRLP4 68+24
ARGP4
ADDRLP4 1200
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 1200
INDIRF4
ADDRLP4 1160
INDIRF4
ADDF4
ASGNF4
line 1220
;1220:			PM_SetPMViewAngle(ps, ps->viewangles, ucmd);
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1204
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 PM_SetPMViewAngle
CALLV
pop
line 1227
;1221:			/*
;1222:			if ( ent->client->ps.viewEntity <= 0 || ent->client->ps.viewEntity >= ENTITYNUM_WORLD )
;1223:			{//don't clamp angles when looking through a viewEntity
;1224:				SetClientViewAngle( ent, ent->client->ps.viewangles );
;1225:			}
;1226:			*/
;1227:			ucmd->angles[YAW] = ANGLE2SHORT(ps->viewangles[YAW]) - ps->delta_angles[YAW];
ADDRLP4 1208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1199570944
ADDRLP4 1208
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDRLP4 1208
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1229
;1228:			//if ( ent->s.number || !player_locked )
;1229:			if (1)
line 1230
;1230:			{
line 1231
;1231:				if (doMove)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $460
line 1232
;1232:				{
line 1234
;1233:					//pull me toward the wall
;1234:					VectorScale(trace.plane.normal, -128.0f, ps->velocity);
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 3271557120
ADDRLP4 68+24
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 3271557120
ADDRLP4 68+24+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 3271557120
ADDRLP4 68+24+8
INDIRF4
MULF4
ASGNF4
line 1235
;1235:				}
LABELV $460
line 1236
;1236:			}
LABELV $458
line 1237
;1237:			ucmd->upmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 1238
;1238:			ps->pm_flags |= PMF_STUCK_TO_WALL;
ADDRLP4 1212
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1212
INDIRP4
ADDRLP4 1212
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1239
;1239:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $406
JUMPV
LABELV $450
line 1241
;1240:		}
;1241:		else if (doMove
ADDRLP4 1200
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 1200
INDIRI4
EQI4 $467
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 1200
INDIRI4
EQI4 $467
line 1243
;1242:			&& (ps->pm_flags & PMF_STUCK_TO_WALL))
;1243:		{//jump off
line 1245
;1244:			//push off of it!
;1245:			ps->pm_flags &= ~PMF_STUCK_TO_WALL;
ADDRLP4 1204
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1204
INDIRP4
ADDRLP4 1204
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1246
;1246:			ps->velocity[0] = ps->velocity[1] = 0;
ADDRLP4 1208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
CNSTF4 0
ASGNF4
ADDRLP4 1208
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1212
INDIRF4
ASGNF4
ADDRLP4 1208
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1212
INDIRF4
ASGNF4
line 1247
;1247:			VectorScale(checkDir, -JUMP_OFF_WALL_SPEED, ps->velocity);
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 3276275712
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 3276275712
ADDRLP4 16+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 3276275712
ADDRLP4 16+8
INDIRF4
MULF4
ASGNF4
line 1248
;1248:			ps->velocity[2] = BG_ForceWallJumpStrength();
ADDRLP4 1216
ADDRGP4 BG_ForceWallJumpStrength
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1216
INDIRF4
ASGNF4
line 1249
;1249:			ps->pm_flags |= PMF_JUMP_HELD;//PMF_JUMPING|PMF_JUMP_HELD;
ADDRLP4 1220
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1220
INDIRP4
ADDRLP4 1220
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1251
;1250:			//G_SoundOnEnt( ent, CHAN_BODY, "sound/weapons/force/jump.wav" );
;1251:			ps->fd.forceJumpSound = 1; //this is a stupid thing, i should fix it.
ADDRFP4 0
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 1
ASGNI4
line 1253
;1252:			//ent->client->ps.forcePowersActive |= (1<<FP_LEVITATION);
;1253:			if (ps->origin[2] < ps->fd.forceJumpZStart)
ADDRLP4 1224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 1224
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
GEF4 $471
line 1254
;1254:			{
line 1255
;1255:				PM_SetForceJumpZStart(ps->origin[2]);
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 1257
;1256:				//ps->fd.forceJumpZStart = ps->origin[2];
;1257:			}
LABELV $471
line 1260
;1258:			//FIXME do I need this?
;1259:
;1260:			BG_ForcePowerDrain(ps, FP_LEVITATION, 10);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1262
;1261:			//no control for half a second
;1262:			ps->pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 1228
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1228
INDIRP4
ADDRLP4 1228
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1263
;1263:			ps->pm_time = 500;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 500
ASGNI4
line 1264
;1264:			ucmd->forwardmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 0
ASGNI1
line 1265
;1265:			ucmd->rightmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 1266
;1266:			ucmd->upmove = 127;
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 127
ASGNI1
line 1268
;1267:
;1268:			if (BG_InReboundHold(ps->legsAnim))
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 1232
ADDRGP4 BG_InReboundHold
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
EQI4 $473
line 1269
;1269:			{//if was in hold pose, release now
line 1270
;1270:				PM_SetAnim(SETANIM_BOTH, BOTH_FORCEWALLRELEASE_FORWARD + (ps->legsAnim - BOTH_FORCEWALLHOLD_FORWARD), SETANIM_FLAG_OVERRIDE | SETANIM_FLAG_HOLD, 0);
ADDRLP4 1236
CNSTI4 3
ASGNI4
ADDRLP4 1236
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 626
SUBI4
CNSTI4 677
ADDI4
ARGI4
ADDRLP4 1236
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1271
;1271:			}
ADDRGP4 $474
JUMPV
LABELV $473
line 1273
;1272:			else
;1273:			{
line 1275
;1274:				//PM_JumpForDir();
;1275:				PM_SetAnim(SETANIM_LEGS, BOTH_FORCEJUMP1, SETANIM_FLAG_OVERRIDE | SETANIM_FLAG_HOLD | SETANIM_FLAG_RESTART, 0);
CNSTI4 2
ARGI4
CNSTI4 869
ARGI4
CNSTI4 7
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1276
;1276:			}
LABELV $474
line 1279
;1277:
;1278:			//return qtrue;
;1279:		}
LABELV $467
line 1280
;1280:	}
LABELV $407
line 1281
;1281:	ps->pm_flags &= ~PMF_STUCK_TO_WALL;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1282
;1282:	return qfalse;
CNSTI4 0
RETI4
LABELV $406
endproc PM_AdjustAngleForWallJump 1240 28
export PM_SetForceJumpZStart
proc PM_SetForceJumpZStart 8 0
line 1290
;1283:}
;1284:
;1285:
;1286:
;1287:
;1288://Set the height for when a force jump was started. If it's 0, nuge it up (slight hack to prevent holding jump over slopes)
;1289:void PM_SetForceJumpZStart(float value)
;1290:{
line 1291
;1291:	pm->ps->fd.forceJumpZStart = value;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1092
ADDP4
ADDRFP4 0
INDIRF4
ASGNF4
line 1292
;1292:	if (!pm->ps->fd.forceJumpZStart && (jk2gameplay == VERSION_1_04 || (pm->modParms.runFlags & RFL_JUMPBUGDISABLE) || pm->modParms.physics == MV_JK2SP))
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CNSTF4 0
NEF4 $476
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $479
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $479
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $476
LABELV $479
line 1293
;1293:	{
line 1294
;1294:		pm->ps->fd.forceJumpZStart -= 0.1f;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1092
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1036831949
SUBF4
ASGNF4
line 1295
;1295:	}
LABELV $476
line 1296
;1296:}
LABELV $475
endproc PM_SetForceJumpZStart 8 0
export PM_SetGroundEntityNum
proc PM_SetGroundEntityNum 4 0
line 1299
;1297:
;1298:void PM_SetGroundEntityNum(int num)
;1299:{
line 1300
;1300:	if (num != ENTITYNUM_NONE) {
ADDRFP4 0
INDIRI4
CNSTI4 1023
EQI4 $481
line 1301
;1301:		pm->ps->groundTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1268
ADDP4
CNSTI4 0
ASGNI4
line 1302
;1302:	}
ADDRGP4 $482
JUMPV
LABELV $481
line 1303
;1303:	else if (pm->ps->groundEntityNum != ENTITYNUM_NONE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $483
line 1304
;1304:		pm->ps->groundTime = pm->cmd.serverTime; // remember time we left ground for charge jump movement
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 1268
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1305
;1305:	}
LABELV $483
LABELV $482
line 1306
;1306:	pm->ps->groundEntityNum = num;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1308
;1307:
;1308:}
LABELV $480
endproc PM_SetGroundEntityNum 4 0
proc PM_CheckJump 1348 28
line 1316
;1309:
;1310:/*
;1311:=============
;1312:PM_CheckJump
;1313:=============
;1314:*/
;1315:static qboolean PM_CheckJump( void ) 
;1316:{
line 1317
;1317:	qboolean onlyWallGrab = qfalse; // in jk 1.02, if we are in air and not wallrunning, we skip out early. but we need to go further for wallgrab. in that case ignore all but wallgrab
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1318
;1318:	int JUMP_VELOCITY_NEW = JUMP_VELOCITY;
ADDRLP4 4
CNSTI4 225
ASGNI4
line 1320
;1319:
;1320:	if (pm->modParms.physics != MV_JK2SP) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
EQI4 $486
line 1321
;1321:		if (pm->ps->usingATST)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $488
line 1322
;1322:		{
line 1323
;1323:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $485
JUMPV
LABELV $488
line 1326
;1324:		}
;1325:
;1326:		if (pm->ps->forceHandExtend == HANDEXTEND_KNOCKDOWN)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $490
line 1327
;1327:		{
line 1328
;1328:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $485
JUMPV
LABELV $490
line 1330
;1329:		}
;1330:	}
LABELV $486
line 1333
;1331:
;1332:	//Don't allow jump until all buttons are up
;1333:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $492
line 1334
;1334:		return qfalse;		
CNSTI4 0
RETI4
ADDRGP4 $485
JUMPV
LABELV $492
line 1337
;1335:	}
;1336:
;1337:	if ( PM_InKnockDown( pm->ps ) || BG_InRoll( pm->ps, pm->ps->legsAnim ) ) 
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 PM_InKnockDown
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $496
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $494
LABELV $496
line 1338
;1338:	{//in knockdown
line 1339
;1339:		return qfalse;		
CNSTI4 0
RETI4
ADDRGP4 $485
JUMPV
LABELV $494
line 1342
;1340:	}
;1341:
;1342:	if (MovementIsQuake3Based(pm->modParms.physics)) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $497
line 1343
;1343:		JUMP_VELOCITY_NEW = 270;
ADDRLP4 4
CNSTI4 270
ASGNI4
line 1344
;1344:	}
LABELV $497
line 1346
;1345:
;1346:	if (pm->ps->groundEntityNum != ENTITYNUM_NONE || pm->ps->origin[2] < pm->ps->fd.forceJumpZStart)
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $501
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
GEF4 $499
LABELV $501
line 1347
;1347:	{
line 1348
;1348:		pm->ps->fd.forcePowersActive &= ~(1<<FP_LEVITATION);
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 1349
;1349:	}
LABELV $499
line 1351
;1350:
;1351:	if (pm->ps->fd.forcePowersActive & (1 << FP_LEVITATION))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $502
line 1352
;1352:	{ //Force jump is already active.. continue draining power appropriately until we land.
line 1353
;1353:		if (pm->ps->fd.forcePowerDebounce[FP_LEVITATION] < pm->cmd.serverTime)
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $504
line 1354
;1354:		{
line 1355
;1355:			BG_ForcePowerDrain( pm->ps, FP_LEVITATION, 5 );
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1356
;1356:			if (pm->ps->fd.forcePowerLevel[FP_LEVITATION] >= FORCE_LEVEL_2)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LTI4 $506
line 1357
;1357:			{
line 1358
;1358:				pm->ps->fd.forcePowerDebounce[FP_LEVITATION] = pm->cmd.serverTime + 300;
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1359
;1359:			}
ADDRGP4 $507
JUMPV
LABELV $506
line 1361
;1360:			else
;1361:			{
line 1362
;1362:				pm->ps->fd.forcePowerDebounce[FP_LEVITATION] = pm->cmd.serverTime + 200;
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1363
;1363:			}
LABELV $507
line 1364
;1364:		}
LABELV $504
line 1365
;1365:	}
LABELV $502
line 1367
;1366:
;1367:	if (pm->modParms.physics != MV_CHARGEJUMP && pm->ps->forceJumpFlip) // this is just for the charge jump. we're gonna set the anim in the charge jump place itself
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 12
EQI4 $508
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 1244
ADDP4
INDIRI4
CNSTI4 0
EQI4 $508
line 1368
;1368:	{ //Forced jump anim
line 1369
;1369:		int anim = BOTH_FORCEINAIR1;
ADDRLP4 32
CNSTI4 870
ASGNI4
line 1370
;1370:		int	parts = SETANIM_BOTH;
ADDRLP4 36
CNSTI4 3
ASGNI4
line 1372
;1371:
;1372:		if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $510
line 1373
;1373:		{
line 1374
;1374:			anim = BOTH_FLIP_F;
ADDRLP4 32
CNSTI4 881
ASGNI4
line 1375
;1375:		}
ADDRGP4 $511
JUMPV
LABELV $510
line 1376
;1376:		else if ( pm->cmd.forwardmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $512
line 1377
;1377:		{
line 1378
;1378:			anim = BOTH_FLIP_B;
ADDRLP4 32
CNSTI4 882
ASGNI4
line 1379
;1379:		}
ADDRGP4 $513
JUMPV
LABELV $512
line 1380
;1380:		else if ( pm->cmd.rightmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $514
line 1381
;1381:		{
line 1382
;1382:			anim = BOTH_FLIP_R;
ADDRLP4 32
CNSTI4 884
ASGNI4
line 1383
;1383:		}
ADDRGP4 $515
JUMPV
LABELV $514
line 1384
;1384:		else if ( pm->cmd.rightmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $516
line 1385
;1385:		{
line 1386
;1386:			anim = BOTH_FLIP_L;
ADDRLP4 32
CNSTI4 883
ASGNI4
line 1387
;1387:		}
LABELV $516
LABELV $515
LABELV $513
LABELV $511
line 1388
;1388:		if ( pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
EQI4 $518
line 1389
;1389:		{//FIXME: really only care if we're in a saber attack anim...
line 1390
;1390:			parts = SETANIM_LEGS;
ADDRLP4 36
CNSTI4 2
ASGNI4
line 1391
;1391:		}
LABELV $518
line 1393
;1392:
;1393:		PM_SetAnim( parts, anim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150 );
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1394
;1394:		pm->ps->forceJumpFlip = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 0
ASGNI4
line 1395
;1395:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $485
JUMPV
LABELV $508
line 1398
;1396:	}
;1397:
;1398:	if (pm->modParms.physics != MV_CHARGEJUMP) { // mirrors the old #if METROID_JUMP clause
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 12
EQI4 $520
line 1400
;1399:
;1400:		if ( pm->waterlevel < 2 ) 
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
GEI4 $522
line 1401
;1401:		{
line 1402
;1402:			if ( pm->ps->gravity > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
LEI4 $524
line 1403
;1403:			{//can't do this in zero-G
line 1404
;1404:				if ( PM_ForceJumpingUp() )
ADDRLP4 32
ADDRGP4 PM_ForceJumpingUp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $526
line 1405
;1405:				{//holding jump in air
line 1406
;1406:					float curHeight = pm->ps->origin[2] - pm->ps->fd.forceJumpZStart;
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1408
;1407:					//check for max force jump level and cap off & cut z vel
;1408:					if ( ( curHeight<=forceJumpHeight[0] ||//still below minimum jump height
ADDRLP4 36
INDIRF4
ADDRGP4 forceJumpHeight
INDIRF4
LEF4 $530
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
EQI4 $528
ADDRLP4 44
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
LTI4 $528
LABELV $530
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 2
ASGNI4
ADDRLP4 36
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
LSHI4
ADDRGP4 forceJumpHeight
ADDP4
INDIRF4
GEF4 $528
ADDRLP4 52
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CNSTF4 0
NEF4 $531
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $528
ADDRLP4 48
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $528
ADDRLP4 48
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $528
LABELV $531
line 1412
;1409:							(pm->ps->fd.forcePower&&pm->cmd.upmove>=10) ) &&////still have force power available and still trying to jump up 
;1410:						curHeight < forceJumpHeight[pm->ps->fd.forcePowerLevel[FP_LEVITATION]] &&
;1411:						(pm->ps->fd.forceJumpZStart || jk2gameplay != VERSION_1_04 && pm->modParms.physics != MV_JK2SP && !(pm->modParms.runFlags & RFL_JUMPBUGDISABLE)))//still below maximum jump height
;1412:					{//can still go up
line 1413
;1413:						if ( curHeight > forceJumpHeight[0] )
ADDRLP4 36
INDIRF4
ADDRGP4 forceJumpHeight
INDIRF4
LEF4 $532
line 1414
;1414:						{//passed normal jump height  *2?
line 1415
;1415:							if ( !(pm->ps->fd.forcePowersActive&(1<<FP_LEVITATION)) )//haven't started forcejump yet
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $534
line 1416
;1416:							{
line 1418
;1417:								//start force jump
;1418:								pm->ps->fd.forcePowersActive |= (1<<FP_LEVITATION);
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1419
;1419:								pm->ps->fd.forceJumpSound = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 1
ASGNI4
line 1421
;1420:								//play flip
;1421:								if ((pm->cmd.forwardmove || pm->cmd.rightmove) && //pushing in a dir
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
NEI4 $538
ADDRLP4 64
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
EQI4 $536
LABELV $538
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 881
EQI4 $536
ADDRLP4 72
INDIRI4
CNSTI4 882
EQI4 $536
ADDRLP4 72
INDIRI4
CNSTI4 884
EQI4 $536
ADDRLP4 72
INDIRI4
CNSTI4 883
EQI4 $536
line 1426
;1422:									(pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_FLIP_F &&//not already flipping
;1423:									(pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_FLIP_B &&
;1424:									(pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_FLIP_R &&
;1425:									(pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_FLIP_L )
;1426:								{ 
line 1427
;1427:									int anim = BOTH_FORCEINAIR1;
ADDRLP4 76
CNSTI4 870
ASGNI4
line 1428
;1428:									int	parts = SETANIM_BOTH;
ADDRLP4 80
CNSTI4 3
ASGNI4
line 1430
;1429:
;1430:									if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $539
line 1431
;1431:									{
line 1432
;1432:										anim = BOTH_FLIP_F;
ADDRLP4 76
CNSTI4 881
ASGNI4
line 1433
;1433:									}
ADDRGP4 $540
JUMPV
LABELV $539
line 1434
;1434:									else if ( pm->cmd.forwardmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $541
line 1435
;1435:									{
line 1436
;1436:										anim = BOTH_FLIP_B;
ADDRLP4 76
CNSTI4 882
ASGNI4
line 1437
;1437:									}
ADDRGP4 $542
JUMPV
LABELV $541
line 1438
;1438:									else if ( pm->cmd.rightmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $543
line 1439
;1439:									{
line 1440
;1440:										anim = BOTH_FLIP_R;
ADDRLP4 76
CNSTI4 884
ASGNI4
line 1441
;1441:									}
ADDRGP4 $544
JUMPV
LABELV $543
line 1442
;1442:									else if ( pm->cmd.rightmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $545
line 1443
;1443:									{
line 1444
;1444:										anim = BOTH_FLIP_L;
ADDRLP4 76
CNSTI4 883
ASGNI4
line 1445
;1445:									}
LABELV $545
LABELV $544
LABELV $542
LABELV $540
line 1446
;1446:									if ( pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
EQI4 $547
line 1447
;1447:									{
line 1448
;1448:										parts = SETANIM_LEGS;
ADDRLP4 80
CNSTI4 2
ASGNI4
line 1449
;1449:									}
LABELV $547
line 1451
;1450:
;1451:									PM_SetAnim( parts, anim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150 );
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1452
;1452:								}
ADDRGP4 $535
JUMPV
LABELV $536
line 1453
;1453:								else if ( pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_1 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
LEI4 $535
line 1454
;1454:								{
line 1456
;1455:									vec3_t facingFwd, facingRight, facingAngles;
;1456:									int	anim = -1;
ADDRLP4 76
CNSTI4 -1
ASGNI4
line 1459
;1457:									float dotR, dotF;
;1458:								
;1459:									VectorSet(facingAngles, 0, pm->ps->viewangles[YAW], 0);
ADDRLP4 104
CNSTF4 0
ASGNF4
ADDRLP4 104+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 104+8
CNSTF4 0
ASGNF4
line 1461
;1460:
;1461:									AngleVectors( facingAngles, facingFwd, facingRight, NULL );
ADDRLP4 104
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 92
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1462
;1462:									dotR = DotProduct( facingRight, pm->ps->velocity );
ADDRLP4 124
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 116
ADDRLP4 92
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 92+4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 92+8
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1463
;1463:									dotF = DotProduct( facingFwd, pm->ps->velocity );
ADDRLP4 128
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 80
INDIRF4
ADDRLP4 128
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 80+4
INDIRF4
ADDRLP4 128
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 80+8
INDIRF4
ADDRLP4 128
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1465
;1464:
;1465:									if ( fabs(dotR) > fabs(dotF) * 1.5 )
ADDRLP4 116
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 120
INDIRF4
ARGF4
ADDRLP4 136
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 132
INDIRF4
CNSTF4 1069547520
ADDRLP4 136
INDIRF4
MULF4
LEF4 $557
line 1466
;1466:									{
line 1467
;1467:										if ( dotR > 150 )
ADDRLP4 116
INDIRF4
CNSTF4 1125515264
LEF4 $559
line 1468
;1468:										{
line 1469
;1469:											anim = BOTH_FORCEJUMPRIGHT1;
ADDRLP4 76
CNSTI4 878
ASGNI4
line 1470
;1470:										}
ADDRGP4 $558
JUMPV
LABELV $559
line 1471
;1471:										else if ( dotR < -150 )
ADDRLP4 116
INDIRF4
CNSTF4 3272998912
GEF4 $558
line 1472
;1472:										{
line 1473
;1473:											anim = BOTH_FORCEJUMPLEFT1;
ADDRLP4 76
CNSTI4 875
ASGNI4
line 1474
;1474:										}
line 1475
;1475:									}
ADDRGP4 $558
JUMPV
LABELV $557
line 1477
;1476:									else
;1477:									{
line 1478
;1478:										if ( dotF > 150 )
ADDRLP4 120
INDIRF4
CNSTF4 1125515264
LEF4 $563
line 1479
;1479:										{
line 1480
;1480:											anim = BOTH_FORCEJUMP1;
ADDRLP4 76
CNSTI4 869
ASGNI4
line 1481
;1481:										}
ADDRGP4 $564
JUMPV
LABELV $563
line 1482
;1482:										else if ( dotF < -150 )
ADDRLP4 120
INDIRF4
CNSTF4 3272998912
GEF4 $565
line 1483
;1483:										{
line 1484
;1484:											anim = BOTH_FORCEJUMPBACK1;
ADDRLP4 76
CNSTI4 872
ASGNI4
line 1485
;1485:										}
LABELV $565
LABELV $564
line 1486
;1486:									}
LABELV $558
line 1487
;1487:									if ( anim != -1 )
ADDRLP4 76
INDIRI4
CNSTI4 -1
EQI4 $535
line 1488
;1488:									{
line 1489
;1489:										int parts = SETANIM_BOTH;
ADDRLP4 140
CNSTI4 3
ASGNI4
line 1490
;1490:										if ( pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
EQI4 $569
line 1491
;1491:										{//FIXME: really only care if we're in a saber attack anim...
line 1492
;1492:											parts = SETANIM_LEGS;
ADDRLP4 140
CNSTI4 2
ASGNI4
line 1493
;1493:										}
LABELV $569
line 1495
;1494:
;1495:										PM_SetAnim( parts, anim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150 );
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1496
;1496:									}
line 1497
;1497:								}
line 1498
;1498:							}
ADDRGP4 $535
JUMPV
LABELV $534
line 1500
;1499:							else
;1500:							{ //jump is already active (the anim has started)
line 1501
;1501:								if ( pm->ps->legsTimer < 1 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
GEI4 $571
line 1502
;1502:								{//not in the middle of a legsAnim
line 1503
;1503:									int anim = (pm->ps->legsAnim&~ANIM_TOGGLEBIT);
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 1504
;1504:									int newAnim = -1;
ADDRLP4 60
CNSTI4 -1
ASGNI4
line 1505
;1505:									switch ( anim )
ADDRLP4 68
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 72
CNSTI4 869
ASGNI4
ADDRLP4 68
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $575
ADDRLP4 68
INDIRI4
CNSTI4 872
EQI4 $576
ADDRLP4 68
INDIRI4
ADDRLP4 72
INDIRI4
LTI4 $573
LABELV $579
ADDRLP4 76
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 875
EQI4 $577
ADDRLP4 76
INDIRI4
CNSTI4 878
EQI4 $578
ADDRGP4 $573
JUMPV
line 1506
;1506:									{
LABELV $575
line 1508
;1507:									case BOTH_FORCEJUMP1:
;1508:										newAnim = BOTH_FORCELAND1;//BOTH_FORCEINAIR1;
ADDRLP4 60
CNSTI4 871
ASGNI4
line 1509
;1509:										break;
ADDRGP4 $574
JUMPV
LABELV $576
line 1511
;1510:									case BOTH_FORCEJUMPBACK1:
;1511:										newAnim = BOTH_FORCELANDBACK1;//BOTH_FORCEINAIRBACK1;
ADDRLP4 60
CNSTI4 874
ASGNI4
line 1512
;1512:										break;
ADDRGP4 $574
JUMPV
LABELV $577
line 1514
;1513:									case BOTH_FORCEJUMPLEFT1:
;1514:										newAnim = BOTH_FORCELANDLEFT1;//BOTH_FORCEINAIRLEFT1;
ADDRLP4 60
CNSTI4 877
ASGNI4
line 1515
;1515:										break;
ADDRGP4 $574
JUMPV
LABELV $578
line 1517
;1516:									case BOTH_FORCEJUMPRIGHT1:
;1517:										newAnim = BOTH_FORCELANDRIGHT1;//BOTH_FORCEINAIRRIGHT1;
ADDRLP4 60
CNSTI4 880
ASGNI4
line 1518
;1518:										break;
LABELV $573
LABELV $574
line 1520
;1519:									}
;1520:									if ( newAnim != -1 )
ADDRLP4 60
INDIRI4
CNSTI4 -1
EQI4 $580
line 1521
;1521:									{
line 1522
;1522:										int parts = SETANIM_BOTH;
ADDRLP4 80
CNSTI4 3
ASGNI4
line 1523
;1523:										if ( pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
EQI4 $582
line 1524
;1524:										{
line 1525
;1525:											parts = SETANIM_LEGS;
ADDRLP4 80
CNSTI4 2
ASGNI4
line 1526
;1526:										}
LABELV $582
line 1528
;1527:
;1528:										PM_SetAnim( parts, newAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150 );
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1529
;1529:									}
LABELV $580
line 1530
;1530:								}
LABELV $571
line 1531
;1531:							}
LABELV $535
line 1532
;1532:						}
LABELV $532
line 1536
;1533:
;1534:						//need to scale this down, start with height velocity (based on max force jump height) and scale down to regular jump vel
;1535:					
;1536:						if (MovementIsQuake3Based(pm->modParms.physics)) {//Forcejump rampjump
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $584
line 1538
;1537:							//need to scale this down, start with height velocity (based on max force jump height) and scale down to regular jump vel
;1538:							float lastJumpSpeed = pm->ps->stats[STAT_LASTJUMPSPEED];
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1543
;1539:							float realForceJumpHeight;
;1540:							//if (lastJumpSpeed == 0) {
;1541:							//	lastJumpSpeed = JUMP_VELOCITY_NEW; // avoid infinite velocity[2] which results in NaN. why does this happen anyway?
;1542:							//}
;1543:							realForceJumpHeight = forceJumpHeight[pm->ps->fd.forcePowerLevel[FP_LEVITATION]] * (lastJumpSpeed / (float)JUMP_VELOCITY_NEW);
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpHeight
ADDP4
INDIRF4
ADDRLP4 64
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
DIVF4
MULF4
ASGNF4
line 1545
;1544:
;1545:							if (!realForceJumpHeight || !lastJumpSpeed) {
ADDRLP4 72
CNSTF4 0
ASGNF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
EQF4 $588
ADDRLP4 64
INDIRF4
ADDRLP4 72
INDIRF4
NEF4 $586
LABELV $588
line 1546
;1546:								pm->ps->velocity[2] = 0; // can happen sometimes and messes everything up. this might feel weird if it happens but its a freak accident anyway. might be when pressing jump during spawn not sure.
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 1547
;1547:								Com_Printf("^3realForceJumpHeight is 0, weird.\n");
ADDRGP4 $589
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1548
;1548:							}
ADDRGP4 $585
JUMPV
LABELV $586
line 1549
;1549:							else {
line 1550
;1550:								pm->ps->velocity[2] = (realForceJumpHeight - curHeight) / realForceJumpHeight * forceJumpStrength[pm->ps->fd.forcePowerLevel[FP_LEVITATION]];//JUMP_VELOCITY;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 76
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 80
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ADDRLP4 80
INDIRF4
DIVF4
ADDRLP4 76
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
MULF4
ASGNF4
line 1551
;1551:								pm->ps->velocity[2] /= 10;//need to scale this down, start with height velocity (based on max force jump height) and scale down to regular jump vel
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
CNSTF4 1092616192
DIVF4
ASGNF4
line 1552
;1552:								pm->ps->velocity[2] += pm->ps->stats[STAT_LASTJUMPSPEED];
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
ADDRLP4 88
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1553
;1553:							}
line 1554
;1554:						}
ADDRGP4 $585
JUMPV
LABELV $584
line 1555
;1555:						else {
line 1556
;1556:							pm->ps->velocity[2] = (forceJumpHeight[pm->ps->fd.forcePowerLevel[FP_LEVITATION]]-curHeight)/forceJumpHeight[pm->ps->fd.forcePowerLevel[FP_LEVITATION]]*forceJumpStrength[pm->ps->fd.forcePowerLevel[FP_LEVITATION]];//JUMP_VELOCITY;
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
ADDRLP4 68
INDIRI4
ADDRGP4 forceJumpHeight
ADDP4
INDIRF4
ASGNF4
ADDRLP4 64
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ADDRLP4 72
INDIRF4
DIVF4
ADDRLP4 68
INDIRI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
MULF4
ASGNF4
line 1557
;1557:							pm->ps->velocity[2] /= 10;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTF4 1092616192
DIVF4
ASGNF4
line 1558
;1558:							pm->ps->velocity[2] += JUMP_VELOCITY_NEW;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1559
;1559:						}
LABELV $585
line 1560
;1560:						pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1561
;1561:					}
ADDRGP4 $529
JUMPV
LABELV $528
line 1562
;1562:					else if ( curHeight > forceJumpHeight[0] && curHeight < forceJumpHeight[pm->ps->fd.forcePowerLevel[FP_LEVITATION]] - forceJumpHeight[0] )
ADDRLP4 60
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 64
ADDRGP4 forceJumpHeight
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 60
INDIRF4
ADDRLP4 68
INDIRF4
LEF4 $590
ADDRLP4 60
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 64
INDIRP4
ADDP4
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
GEF4 $590
line 1563
;1563:					{//still have some headroom, don't totally stop it
line 1564
;1564:						if ( pm->ps->velocity[2] > JUMP_VELOCITY_NEW)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
LEF4 $591
line 1565
;1565:						{
line 1566
;1566:							pm->ps->velocity[2] = JUMP_VELOCITY_NEW;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
line 1567
;1567:						}
line 1568
;1568:					}
ADDRGP4 $591
JUMPV
LABELV $590
line 1570
;1569:					else
;1570:					{
line 1571
;1571:						if (pm->modParms.physics == MV_JK2SP) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $594
line 1572
;1572:							pm->ps->velocity[2] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 1573
;1573:						}
ADDRGP4 $595
JUMPV
LABELV $594
line 1574
;1574:						else {
line 1578
;1575:							//pm->ps->velocity[2] = 0;
;1576:							//rww - changed for the sake of balance in multiplayer
;1577:
;1578:							if (pm->ps->velocity[2] > JUMP_VELOCITY_NEW)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
LEF4 $596
line 1579
;1579:							{
line 1580
;1580:								pm->ps->velocity[2] = JUMP_VELOCITY_NEW;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
line 1581
;1581:							}
LABELV $596
line 1582
;1582:						}
LABELV $595
line 1583
;1583:					}
LABELV $591
LABELV $529
line 1584
;1584:					pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 1585
;1585:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $485
JUMPV
LABELV $526
line 1587
;1586:				}
;1587:				else if ( jk2gameplay == VERSION_1_02 && pm->modParms.physics != MV_JK2SP && pm->ps->groundEntityNum == ENTITYNUM_NONE )
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRGP4 jk2gameplay
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $598
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $598
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $598
line 1588
;1588:				{
line 1589
;1589:					int legsAnim = (pm->ps->legsAnim&~ANIM_TOGGLEBIT);
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 1590
;1590:					if ( legsAnim != BOTH_WALL_RUN_LEFT && legsAnim != BOTH_WALL_RUN_RIGHT )
ADDRLP4 48
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 918
EQI4 $600
ADDRLP4 48
INDIRI4
CNSTI4 915
EQI4 $600
line 1591
;1591:					{//special case.. these let you jump off a wall
line 1592
;1592:						if (pm->modParms.runFlags & RFL_CLIMBTECH) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $602
line 1594
;1593:							// gotta allow for wallgrab
;1594:							onlyWallGrab = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1595
;1595:						}
ADDRGP4 $603
JUMPV
LABELV $602
line 1596
;1596:						else {
line 1597
;1597:							return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $485
JUMPV
LABELV $603
line 1599
;1598:						}
;1599:					}
LABELV $600
line 1600
;1600:				}
LABELV $598
line 1602
;1601:
;1602:			}
LABELV $524
line 1603
;1603:		}
LABELV $522
line 1605
;1604:
;1605:	}
LABELV $520
line 1608
;1606:
;1607:	//Not jumping
;1608:	if ( pm->cmd.upmove < 10 && (pm->ps->groundEntityNum != ENTITYNUM_NONE || jk2gameplay == VERSION_1_02)) {
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $604
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $606
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $604
LABELV $606
line 1609
;1609:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $485
JUMPV
LABELV $604
line 1613
;1610:	}
;1611:
;1612:	// must wait for jump to be released
;1613:	if ( pm->ps->pm_flags & PMF_JUMP_HELD ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $607
line 1614
;1614:	{
line 1616
;1615:		// clear upmove so cmdscale doesn't lower running speed
;1616:		if(!onlyWallGrab){
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $609
line 1617
;1617:			pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 1618
;1618:		}
LABELV $609
line 1619
;1619:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $485
JUMPV
LABELV $607
line 1622
;1620:	}
;1621:
;1622:	if ( pm->ps->gravity <= 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
GTI4 $611
line 1623
;1623:	{//in low grav, you push in the dir you're facing as long as there is something behind you to shove off of
line 1627
;1624:		vec3_t	forward, back;
;1625:		trace_t	trace;
;1626:
;1627:		if(!onlyWallGrab){
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $612
line 1628
;1628:			AngleVectors( pm->ps->viewangles, forward, NULL, NULL );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 1140
CNSTP4 0
ASGNP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1629
;1629:			VectorMA( pm->ps->origin, -8, forward, back );
ADDRLP4 1144
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1148
CNSTF4 3238002688
ASGNF4
ADDRLP4 48
ADDRLP4 1144
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1148
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 1144
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1148
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 48+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3238002688
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1630
;1630:			pm->trace( &trace, pm->ps->origin, pm->mins, pm->maxs, back, pm->ps->clientNum, pm->tracemask );
ADDRLP4 60
ARGP4
ADDRLP4 1152
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1156
ADDRLP4 1152
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1152
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1152
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 1156
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1152
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1152
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 1632
;1631:
;1632:			if ( trace.fraction <= 1.0f )
ADDRLP4 60+8
INDIRF4
CNSTF4 1065353216
GTF4 $619
line 1633
;1633:			{
line 1634
;1634:				VectorMA( pm->ps->velocity, JUMP_VELOCITY_NEW*2, forward, pm->ps->velocity );
ADDRLP4 1160
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1160
INDIRP4
ADDRLP4 1160
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRLP4 1164
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1164
INDIRP4
ADDRLP4 1164
INDIRP4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRLP4 1168
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1168
INDIRP4
ADDRLP4 1168
INDIRP4
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 1635
;1635:				PM_SetAnim(SETANIM_LEGS,BOTH_FORCEJUMP1,SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD|SETANIM_FLAG_RESTART, 150);
CNSTI4 2
ARGI4
CNSTI4 869
ARGI4
CNSTI4 7
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1636
;1636:			}//else no surf close enough to push off of
LABELV $619
line 1637
;1637:			pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 1638
;1638:		}
line 1639
;1639:	}
ADDRGP4 $612
JUMPV
LABELV $611
line 1640
;1640:	else if ( pm->cmd.upmove > 0 && pm->waterlevel < 2 &&
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 40
INDIRI4
LEI4 $624
ADDRLP4 44
CNSTI4 2
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
GEI4 $624
ADDRLP4 48
ADDRLP4 36
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
LEI4 $624
ADDRLP4 48
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $624
ADDRLP4 48
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $624
ADDRLP4 36
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $624
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRP4
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 60
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $624
line 1646
;1641:		pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_0 &&
;1642:		!(pm->ps->pm_flags&PMF_JUMP_HELD) &&
;1643:		pm->ps->weapon == WP_SABER &&
;1644:		!BG_HasYsalamiri(pm->gametype, pm->ps) &&
;1645:		BG_CanUseFPNow(pm->gametype, pm->ps, pm->cmd.serverTime, FP_LEVITATION) )
;1646:	{
line 1647
;1647:		if ( pm->ps->groundEntityNum != ENTITYNUM_NONE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $626
line 1648
;1648:		{//on the ground
line 1650
;1649:			//check for left-wall and right-wall special jumps
;1650:			int anim = -1;
ADDRLP4 64
CNSTI4 -1
ASGNI4
line 1651
;1651:			float	vertPush = 0;
ADDRLP4 68
CNSTF4 0
ASGNF4
line 1652
;1652:			if ( pm->cmd.rightmove > 0 && pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_1 )
ADDRLP4 72
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $628
ADDRLP4 72
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
LEI4 $628
line 1653
;1653:			{//strafing right
line 1654
;1654:				if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $630
line 1655
;1655:				{//wall-run
line 1656
;1656:					vertPush = forceJumpStrength[FORCE_LEVEL_2]/2.0f;
ADDRLP4 68
ADDRGP4 forceJumpStrength+8
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1657
;1657:					anim = BOTH_WALL_RUN_RIGHT;
ADDRLP4 64
CNSTI4 915
ASGNI4
line 1658
;1658:				}
ADDRGP4 $629
JUMPV
LABELV $630
line 1659
;1659:				else if ( pm->cmd.forwardmove == 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $629
line 1660
;1660:				{//wall-flip
line 1661
;1661:					vertPush = forceJumpStrength[FORCE_LEVEL_2]/2.25f;
ADDRLP4 68
ADDRGP4 forceJumpStrength+8
INDIRF4
CNSTF4 1074790400
DIVF4
ASGNF4
line 1662
;1662:					anim = BOTH_WALL_FLIP_RIGHT;
ADDRLP4 64
CNSTI4 921
ASGNI4
line 1663
;1663:				}
line 1664
;1664:			}
ADDRGP4 $629
JUMPV
LABELV $628
line 1665
;1665:			else if ( pm->cmd.rightmove < 0 && pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_1 )
ADDRLP4 76
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $636
ADDRLP4 76
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
LEI4 $636
line 1666
;1666:			{//strafing left
line 1667
;1667:				if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $638
line 1668
;1668:				{//wall-run
line 1669
;1669:					vertPush = forceJumpStrength[FORCE_LEVEL_2]/2.0f;
ADDRLP4 68
ADDRGP4 forceJumpStrength+8
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1670
;1670:					anim = BOTH_WALL_RUN_LEFT;
ADDRLP4 64
CNSTI4 918
ASGNI4
line 1671
;1671:				}
ADDRGP4 $637
JUMPV
LABELV $638
line 1672
;1672:				else if ( pm->cmd.forwardmove == 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $637
line 1673
;1673:				{//wall-flip
line 1674
;1674:					vertPush = forceJumpStrength[FORCE_LEVEL_2]/2.25f;
ADDRLP4 68
ADDRGP4 forceJumpStrength+8
INDIRF4
CNSTF4 1074790400
DIVF4
ASGNF4
line 1675
;1675:					anim = BOTH_WALL_FLIP_LEFT;
ADDRLP4 64
CNSTI4 922
ASGNI4
line 1676
;1676:				}
line 1677
;1677:			}
ADDRGP4 $637
JUMPV
LABELV $636
line 1678
;1678:			else if ( jk2gameplay == VERSION_1_02 && pm->cmd.forwardmove > 0 && pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_1 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $644
ADDRLP4 80
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $644
ADDRLP4 80
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
LEI4 $644
line 1679
;1679:			{//run up wall, flip backwards
line 1680
;1680:				vertPush = forceJumpStrength[FORCE_LEVEL_2]/2.25f;
ADDRLP4 68
ADDRGP4 forceJumpStrength+8
INDIRF4
CNSTF4 1074790400
DIVF4
ASGNF4
line 1681
;1681:				anim = BOTH_WALL_FLIP_BACK1;
ADDRLP4 64
CNSTI4 944
ASGNI4
line 1682
;1682:			}
ADDRGP4 $645
JUMPV
LABELV $644
line 1683
;1683:			else if ( pm->cmd.forwardmove < 0 && !(pm->cmd.buttons&BUTTON_ATTACK) )
ADDRLP4 84
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 88
INDIRI4
GEI4 $647
ADDRLP4 84
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 88
INDIRI4
NEI4 $647
line 1684
;1684:			{//backflip
line 1685
;1685:				vertPush = JUMP_VELOCITY_NEW;
ADDRLP4 68
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
line 1686
;1686:				anim = BOTH_FLIP_BACK1;//PM_PickAnim( BOTH_FLIP_BACK1, BOTH_FLIP_BACK3 );
ADDRLP4 64
CNSTI4 910
ASGNI4
line 1687
;1687:			}
LABELV $647
LABELV $645
LABELV $637
LABELV $629
line 1689
;1688:
;1689:			vertPush += 128; //give them an extra shove
ADDRLP4 68
ADDRLP4 68
INDIRF4
CNSTF4 1124073472
ADDF4
ASGNF4
line 1691
;1690:
;1691:			if ( anim != -1 )
ADDRLP4 64
INDIRI4
CNSTI4 -1
EQI4 $627
line 1692
;1692:			{
line 1696
;1693:				vec3_t fwd, right, traceto, mins, maxs, fwdAngles;
;1694:				vec3_t	idealNormal;
;1695:				trace_t	trace;
;1696:				qboolean doTrace = qfalse;
ADDRLP4 92
CNSTI4 0
ASGNI4
line 1697
;1697:				int contents = MASK_PLAYERSOLID;
ADDRLP4 96
CNSTI4 273
ASGNI4
line 1699
;1698:
;1699:				VectorSet(mins, pm->mins[0],pm->mins[1],0);
ADDRLP4 1264
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1204
ADDRLP4 1264
INDIRP4
CNSTI4 220
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1204+4
ADDRLP4 1264
INDIRP4
CNSTI4 224
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1204+8
CNSTF4 0
ASGNF4
line 1700
;1700:				VectorSet(maxs, pm->maxs[0],pm->maxs[1],24);
ADDRLP4 1268
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1216
ADDRLP4 1268
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1216+4
ADDRLP4 1268
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1216+8
CNSTF4 1103101952
ASGNF4
line 1701
;1701:				VectorSet(fwdAngles, 0, pm->ps->viewangles[YAW], 0);
ADDRLP4 1192
CNSTF4 0
ASGNF4
ADDRLP4 1192+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1192+8
CNSTF4 0
ASGNF4
line 1703
;1702:
;1703:				memset(&trace, 0, sizeof(trace)); //to shut the compiler up
ADDRLP4 100
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1080
ARGU4
ADDRGP4 memset
CALLP4
pop
line 1705
;1704:
;1705:				AngleVectors( fwdAngles, fwd, right, NULL );
ADDRLP4 1192
ARGP4
ADDRLP4 1252
ARGP4
ADDRLP4 1240
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1708
;1706:
;1707:				//trace-check for a wall, if necc.
;1708:				switch ( anim )
ADDRLP4 1272
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 1272
INDIRI4
CNSTI4 915
LTI4 $657
ADDRLP4 1272
INDIRI4
CNSTI4 922
GTI4 $674
ADDRLP4 1272
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $675-3660
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $675
address $664
address $657
address $657
address $659
address $657
address $657
address $664
address $659
code
LABELV $674
ADDRLP4 64
INDIRI4
CNSTI4 944
EQI4 $669
ADDRGP4 $657
JUMPV
line 1709
;1709:				{
LABELV $659
line 1713
;1710:				case BOTH_WALL_FLIP_LEFT:
;1711:					//NOTE: purposely falls through to next case!
;1712:				case BOTH_WALL_RUN_LEFT:
;1713:					doTrace = qtrue;
ADDRLP4 92
CNSTI4 1
ASGNI4
line 1714
;1714:					VectorMA( pm->ps->origin, -16, right, traceto );
ADDRLP4 1276
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1280
CNSTF4 3246391296
ASGNF4
ADDRLP4 1228
ADDRLP4 1276
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1280
INDIRF4
ADDRLP4 1240
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1228+4
ADDRLP4 1276
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1280
INDIRF4
ADDRLP4 1240+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1228+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3246391296
ADDRLP4 1240+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1715
;1715:					break;
ADDRGP4 $658
JUMPV
LABELV $664
line 1720
;1716:
;1717:				case BOTH_WALL_FLIP_RIGHT:
;1718:					//NOTE: purposely falls through to next case!
;1719:				case BOTH_WALL_RUN_RIGHT:
;1720:					doTrace = qtrue;
ADDRLP4 92
CNSTI4 1
ASGNI4
line 1721
;1721:					VectorMA( pm->ps->origin, 16, right, traceto );
ADDRLP4 1284
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1288
CNSTF4 1098907648
ASGNF4
ADDRLP4 1228
ADDRLP4 1284
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1288
INDIRF4
ADDRLP4 1240
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1228+4
ADDRLP4 1284
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1288
INDIRF4
ADDRLP4 1240+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1228+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 1240+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1722
;1722:					break;
ADDRGP4 $658
JUMPV
LABELV $669
line 1725
;1723:
;1724:				case BOTH_WALL_FLIP_BACK1:
;1725:					doTrace = qtrue;
ADDRLP4 92
CNSTI4 1
ASGNI4
line 1726
;1726:					VectorMA( pm->ps->origin, 16, fwd, traceto );
ADDRLP4 1292
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1296
CNSTF4 1098907648
ASGNF4
ADDRLP4 1228
ADDRLP4 1292
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1296
INDIRF4
ADDRLP4 1252
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1228+4
ADDRLP4 1292
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1296
INDIRF4
ADDRLP4 1252+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1228+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 1252+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1727
;1727:					break;
LABELV $657
LABELV $658
line 1730
;1728:				}
;1729:
;1730:				if ( doTrace )
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $677
line 1731
;1731:				{
line 1732
;1732:					pm->trace( &trace, pm->ps->origin, mins, maxs, traceto, pm->ps->clientNum, contents );
ADDRLP4 100
ARGP4
ADDRLP4 1276
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1280
ADDRLP4 1276
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1280
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1204
ARGP4
ADDRLP4 1216
ARGP4
ADDRLP4 1228
ARGP4
ADDRLP4 1280
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRLP4 1276
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 1733
;1733:					VectorSubtract( pm->ps->origin, traceto, idealNormal );
ADDRLP4 1284
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1180
ADDRLP4 1284
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1228
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1180+4
ADDRLP4 1284
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1228+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1180+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 1228+8
INDIRF4
SUBF4
ASGNF4
line 1734
;1734:					VectorNormalize( idealNormal );
ADDRLP4 1180
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1735
;1735:				}
LABELV $677
line 1737
;1736:
;1737:				if ( !doTrace || (trace.fraction < 1.0f && (trace.entityNum < MAX_CLIENTS || DotProduct(trace.plane.normal,idealNormal) > 0.7f)) )
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $695
ADDRLP4 100+8
INDIRF4
CNSTF4 1065353216
GEF4 $627
ADDRLP4 100+52
INDIRI4
CNSTI4 32
LTI4 $695
ADDRLP4 100+24
INDIRF4
ADDRLP4 1180
INDIRF4
MULF4
ADDRLP4 100+24+4
INDIRF4
ADDRLP4 1180+4
INDIRF4
MULF4
ADDF4
ADDRLP4 100+24+8
INDIRF4
ADDRLP4 1180+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
LEF4 $627
LABELV $695
line 1738
;1738:				{//there is a wall there.. or hit a client
line 1741
;1739:					int parts;
;1740:					//move me to side
;1741:					if ( anim == BOTH_WALL_FLIP_LEFT )
ADDRLP4 64
INDIRI4
CNSTI4 922
NEI4 $696
line 1742
;1742:					{
line 1743
;1743:						pm->ps->velocity[0] = pm->ps->velocity[1] = 0;
ADDRLP4 1280
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1284
CNSTF4 0
ASGNF4
ADDRLP4 1280
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1284
INDIRF4
ASGNF4
ADDRLP4 1280
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1284
INDIRF4
ASGNF4
line 1744
;1744:						VectorMA( pm->ps->velocity, 150, right, pm->ps->velocity );
ADDRLP4 1288
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1288
INDIRP4
ADDRLP4 1288
INDIRP4
INDIRF4
CNSTF4 1125515264
ADDRLP4 1240
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1292
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1292
INDIRP4
ADDRLP4 1292
INDIRP4
INDIRF4
CNSTF4 1125515264
ADDRLP4 1240+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1296
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1296
INDIRP4
ADDRLP4 1296
INDIRP4
INDIRF4
CNSTF4 1125515264
ADDRLP4 1240+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1745
;1745:					}
ADDRGP4 $697
JUMPV
LABELV $696
line 1746
;1746:					else if ( anim == BOTH_WALL_FLIP_RIGHT )
ADDRLP4 64
INDIRI4
CNSTI4 921
NEI4 $700
line 1747
;1747:					{
line 1748
;1748:						pm->ps->velocity[0] = pm->ps->velocity[1] = 0;
ADDRLP4 1280
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1284
CNSTF4 0
ASGNF4
ADDRLP4 1280
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1284
INDIRF4
ASGNF4
ADDRLP4 1280
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1284
INDIRF4
ASGNF4
line 1749
;1749:						VectorMA( pm->ps->velocity, -150, right, pm->ps->velocity );
ADDRLP4 1288
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1288
INDIRP4
ADDRLP4 1288
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 1240
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1292
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1292
INDIRP4
ADDRLP4 1292
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 1240+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1296
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1296
INDIRP4
ADDRLP4 1296
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 1240+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1750
;1750:					}
ADDRGP4 $701
JUMPV
LABELV $700
line 1751
;1751:					else if ( anim == BOTH_FLIP_BACK1 
ADDRLP4 1280
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 1280
INDIRI4
CNSTI4 910
EQI4 $708
ADDRLP4 1280
INDIRI4
CNSTI4 911
EQI4 $708
ADDRLP4 1280
INDIRI4
CNSTI4 912
EQI4 $708
ADDRLP4 1280
INDIRI4
CNSTI4 944
NEI4 $704
LABELV $708
line 1755
;1752:						|| anim == BOTH_FLIP_BACK2 
;1753:						|| anim == BOTH_FLIP_BACK3 
;1754:						|| anim == BOTH_WALL_FLIP_BACK1 )
;1755:					{
line 1756
;1756:						pm->ps->velocity[0] = pm->ps->velocity[1] = 0;
ADDRLP4 1284
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1288
CNSTF4 0
ASGNF4
ADDRLP4 1284
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1288
INDIRF4
ASGNF4
ADDRLP4 1284
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1288
INDIRF4
ASGNF4
line 1757
;1757:						VectorMA( pm->ps->velocity, -150, fwd, pm->ps->velocity );
ADDRLP4 1292
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1292
INDIRP4
ADDRLP4 1292
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 1252
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1296
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1296
INDIRP4
ADDRLP4 1296
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 1252+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1300
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1300
INDIRP4
ADDRLP4 1300
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 1252+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1758
;1758:					}
LABELV $704
LABELV $701
LABELV $697
line 1760
;1759:
;1760:					if ( doTrace && anim != BOTH_WALL_RUN_LEFT && anim != BOTH_WALL_RUN_RIGHT )
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $711
ADDRLP4 1284
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 1284
INDIRI4
CNSTI4 918
EQI4 $711
ADDRLP4 1284
INDIRI4
CNSTI4 915
EQI4 $711
line 1761
;1761:					{
line 1762
;1762:						if (trace.entityNum < MAX_CLIENTS)
ADDRLP4 100+52
INDIRI4
CNSTI4 32
GEI4 $713
line 1763
;1763:						{
line 1764
;1764:							pm->ps->forceKickFlip = trace.entityNum+1; //let the server know that this person gets kicked by this client
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1292
ADDP4
ADDRLP4 100+52
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1765
;1765:						}
LABELV $713
line 1766
;1766:					}
LABELV $711
line 1769
;1767:
;1768:					//up
;1769:					if ( vertPush )
ADDRLP4 68
INDIRF4
CNSTF4 0
EQF4 $717
line 1770
;1770:					{
line 1771
;1771:						pm->ps->velocity[2] = vertPush;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 68
INDIRF4
ASGNF4
line 1772
;1772:						pm->ps->fd.forcePowersActive |= (1 << FP_LEVITATION);
ADDRLP4 1288
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 1288
INDIRP4
ADDRLP4 1288
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1773
;1773:					}
LABELV $717
line 1775
;1774:					//animate me
;1775:					parts = SETANIM_LEGS;
ADDRLP4 1276
CNSTI4 2
ASGNI4
line 1776
;1776:					if ( anim == BOTH_BUTTERFLY_LEFT )
ADDRLP4 64
INDIRI4
CNSTI4 913
NEI4 $719
line 1777
;1777:					{
line 1778
;1778:						parts = SETANIM_BOTH;
ADDRLP4 1276
CNSTI4 3
ASGNI4
line 1779
;1779:						pm->cmd.buttons&=~BUTTON_ATTACK;
ADDRLP4 1288
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 1288
INDIRP4
ADDRLP4 1288
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1780
;1780:						pm->ps->saberMove = LS_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 1781
;1781:					}
ADDRGP4 $720
JUMPV
LABELV $719
line 1782
;1782:					else if ( !pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
NEI4 $721
line 1783
;1783:					{
line 1784
;1784:						parts = SETANIM_BOTH;
ADDRLP4 1276
CNSTI4 3
ASGNI4
line 1785
;1785:					}
LABELV $721
LABELV $720
line 1786
;1786:					PM_SetAnim( parts, anim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0 );
ADDRLP4 1276
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1787
;1787:					if ( anim == BOTH_BUTTERFLY_LEFT )
ADDRLP4 64
INDIRI4
CNSTI4 913
NEI4 $723
line 1788
;1788:					{
line 1789
;1789:						pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 1288
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1288
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 1288
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1790
;1790:					}
LABELV $723
line 1791
;1791:					PM_SetForceJumpZStart(pm->ps->origin[2]);//so we don't take damage if we land at same height
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 1792
;1792:					pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 1288
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1288
INDIRP4
ADDRLP4 1288
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1793
;1793:					pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 1794
;1794:					pm->ps->fd.forceJumpSound = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 1
ASGNI4
line 1795
;1795:				}
line 1796
;1796:			}
line 1797
;1797:		}
ADDRGP4 $627
JUMPV
LABELV $626
line 1799
;1798:		else 
;1799:		{//in the air
line 1800
;1800:			int legsAnim = (pm->ps->legsAnim&~ANIM_TOGGLEBIT);
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 1801
;1801:			if ( legsAnim == BOTH_WALL_RUN_LEFT || legsAnim == BOTH_WALL_RUN_RIGHT )
ADDRLP4 68
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 918
EQI4 $727
ADDRLP4 68
INDIRI4
CNSTI4 915
NEI4 $725
LABELV $727
line 1802
;1802:			{//running on a wall
line 1805
;1803:				vec3_t right, traceto, mins, maxs, fwdAngles;
;1804:				trace_t	trace;
;1805:				int		anim = -1;
ADDRLP4 72
CNSTI4 -1
ASGNI4
line 1807
;1806:
;1807:				if (onlyWallGrab) return qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $728
CNSTI4 0
RETI4
ADDRGP4 $485
JUMPV
LABELV $728
line 1809
;1808:
;1809:				VectorSet(mins, pm->mins[0], pm->mins[0], 0);
ADDRLP4 1216
ADDRGP4 pm
INDIRP4
CNSTI4 220
ADDP4
ASGNP4
ADDRLP4 88
ADDRLP4 1216
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 88+4
ADDRLP4 1216
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 88+8
CNSTF4 0
ASGNF4
line 1810
;1810:				VectorSet(maxs, pm->maxs[0], pm->maxs[0], 24);
ADDRLP4 1220
ADDRGP4 pm
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 100
ADDRLP4 1220
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 100+4
ADDRLP4 1220
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 100+8
CNSTF4 1103101952
ASGNF4
line 1811
;1811:				VectorSet(fwdAngles, 0, pm->ps->viewangles[YAW], 0);
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 76+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 76+8
CNSTF4 0
ASGNF4
line 1813
;1812:
;1813:				AngleVectors( fwdAngles, NULL, right, NULL );
ADDRLP4 76
ARGP4
ADDRLP4 1224
CNSTP4 0
ASGNP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 1224
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1815
;1814:
;1815:				if ( legsAnim == BOTH_WALL_RUN_LEFT )
ADDRLP4 64
INDIRI4
CNSTI4 918
NEI4 $736
line 1816
;1816:				{
line 1817
;1817:					if ( pm->ps->legsTimer > 400 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 400
LEI4 $737
line 1818
;1818:					{//not at the end of the anim
line 1819
;1819:						float animLen = PM_AnimLength( 0, (animNumber_t)BOTH_WALL_RUN_LEFT );
CNSTI4 0
ARGI4
CNSTI4 918
ARGI4
ADDRLP4 1232
ADDRGP4 PM_AnimLength
CALLI4
ASGNI4
ADDRLP4 1228
ADDRLP4 1232
INDIRI4
CVIF4 4
ASGNF4
line 1820
;1820:						if ( pm->ps->legsTimer < animLen - 400 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 1228
INDIRF4
CNSTF4 1137180672
SUBF4
GEF4 $737
line 1821
;1821:						{//not at start of anim
line 1822
;1822:							VectorMA( pm->ps->origin, -16, right, traceto );
ADDRLP4 1236
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1240
CNSTF4 3246391296
ASGNF4
ADDRLP4 124
ADDRLP4 1236
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1240
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 1236
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1240
INDIRF4
ADDRLP4 112+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3246391296
ADDRLP4 112+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1823
;1823:							anim = BOTH_WALL_RUN_LEFT_FLIP;
ADDRLP4 72
CNSTI4 919
ASGNI4
line 1824
;1824:						}
line 1825
;1825:					}
line 1826
;1826:				}
ADDRGP4 $737
JUMPV
LABELV $736
line 1827
;1827:				else if ( legsAnim == BOTH_WALL_RUN_RIGHT )
ADDRLP4 64
INDIRI4
CNSTI4 915
NEI4 $746
line 1828
;1828:				{
line 1829
;1829:					if ( pm->ps->legsTimer > 400 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 400
LEI4 $748
line 1830
;1830:					{//not at the end of the anim
line 1831
;1831:						float animLen = PM_AnimLength( 0, (animNumber_t)BOTH_WALL_RUN_RIGHT );
CNSTI4 0
ARGI4
CNSTI4 915
ARGI4
ADDRLP4 1232
ADDRGP4 PM_AnimLength
CALLI4
ASGNI4
ADDRLP4 1228
ADDRLP4 1232
INDIRI4
CVIF4 4
ASGNF4
line 1832
;1832:						if ( pm->ps->legsTimer < animLen - 400 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 1228
INDIRF4
CNSTF4 1137180672
SUBF4
GEF4 $750
line 1833
;1833:						{//not at start of anim
line 1834
;1834:							VectorMA( pm->ps->origin, 16, right, traceto );
ADDRLP4 1236
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1240
CNSTF4 1098907648
ASGNF4
ADDRLP4 124
ADDRLP4 1236
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1240
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 1236
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1240
INDIRF4
ADDRLP4 112+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1098907648
ADDRLP4 112+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1835
;1835:							anim = BOTH_WALL_RUN_RIGHT_FLIP;
ADDRLP4 72
CNSTI4 916
ASGNI4
line 1836
;1836:						}
LABELV $750
line 1837
;1837:					}
LABELV $748
line 1838
;1838:				}
LABELV $746
LABELV $737
line 1839
;1839:				if ( anim != -1 )
ADDRLP4 72
INDIRI4
CNSTI4 -1
EQI4 $756
line 1840
;1840:				{
line 1841
;1841:					pm->trace( &trace, pm->ps->origin, mins, maxs, traceto, pm->ps->clientNum, CONTENTS_SOLID|CONTENTS_BODY );
ADDRLP4 136
ARGP4
ADDRLP4 1228
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1232
ADDRLP4 1228
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1232
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 124
ARGP4
ADDRLP4 1232
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 257
ARGI4
ADDRLP4 1228
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 1842
;1842:					if ( trace.fraction < 1.0f )
ADDRLP4 136+8
INDIRF4
CNSTF4 1065353216
GEF4 $758
line 1843
;1843:					{//flip off wall
line 1844
;1844:						int parts = 0;
ADDRLP4 1236
CNSTI4 0
ASGNI4
line 1846
;1845:
;1846:						if ( anim == BOTH_WALL_RUN_LEFT_FLIP )
ADDRLP4 72
INDIRI4
CNSTI4 919
NEI4 $761
line 1847
;1847:						{
line 1848
;1848:							pm->ps->velocity[0] *= 0.5f;
ADDRLP4 1240
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1240
INDIRP4
CNSTF4 1056964608
ADDRLP4 1240
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1849
;1849:							pm->ps->velocity[1] *= 0.5f;
ADDRLP4 1244
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1244
INDIRP4
CNSTF4 1056964608
ADDRLP4 1244
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1850
;1850:							VectorMA( pm->ps->velocity, 150, right, pm->ps->velocity );
ADDRLP4 1248
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1248
INDIRP4
ADDRLP4 1248
INDIRP4
INDIRF4
CNSTF4 1125515264
ADDRLP4 112
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1252
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1252
INDIRP4
ADDRLP4 1252
INDIRP4
INDIRF4
CNSTF4 1125515264
ADDRLP4 112+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1256
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1256
INDIRP4
ADDRLP4 1256
INDIRP4
INDIRF4
CNSTF4 1125515264
ADDRLP4 112+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1851
;1851:						}
ADDRGP4 $762
JUMPV
LABELV $761
line 1852
;1852:						else if ( anim == BOTH_WALL_RUN_RIGHT_FLIP )
ADDRLP4 72
INDIRI4
CNSTI4 916
NEI4 $765
line 1853
;1853:						{
line 1854
;1854:							pm->ps->velocity[0] *= 0.5f;
ADDRLP4 1240
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1240
INDIRP4
CNSTF4 1056964608
ADDRLP4 1240
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1855
;1855:							pm->ps->velocity[1] *= 0.5f;
ADDRLP4 1244
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1244
INDIRP4
CNSTF4 1056964608
ADDRLP4 1244
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1856
;1856:							VectorMA( pm->ps->velocity, -150, right, pm->ps->velocity );
ADDRLP4 1248
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1248
INDIRP4
ADDRLP4 1248
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 112
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1252
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1252
INDIRP4
ADDRLP4 1252
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 112+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1256
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1256
INDIRP4
ADDRLP4 1256
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 112+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1857
;1857:						}
LABELV $765
LABELV $762
line 1858
;1858:						parts = SETANIM_LEGS;
ADDRLP4 1236
CNSTI4 2
ASGNI4
line 1859
;1859:						if ( !pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
NEI4 $769
line 1860
;1860:						{
line 1861
;1861:							parts = SETANIM_BOTH;
ADDRLP4 1236
CNSTI4 3
ASGNI4
line 1862
;1862:						}
LABELV $769
line 1863
;1863:						PM_SetAnim( parts, anim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0 );
ADDRLP4 1236
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1864
;1864:						pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 1865
;1865:					}
LABELV $758
line 1866
;1866:				}
LABELV $756
line 1867
;1867:				if ( pm->cmd.upmove != 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $726
line 1868
;1868:				{//jump failed, so don't try to do normal jump code, just return
line 1869
;1869:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $485
JUMPV
line 1871
;1870:				}
;1871:			}
LABELV $725
line 1872
;1872:			else if ( jk2gameplay != VERSION_1_02 &&
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $773
ADDRLP4 72
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $773
ADDRLP4 76
ADDRLP4 72
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
LEI4 $773
ADDRLP4 76
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1128792064
LEF4 $773
ADDRLP4 80
ADDRGP4 PM_GroundDistance
CALLF4
ASGNF4
ADDRLP4 80
INDIRF4
CNSTF4 1117782016
GTF4 $773
ADDRLP4 84
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $773
line 1878
;1873:				pm->cmd.forwardmove > 0 //pushing forward
;1874:				&& pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_1
;1875:				&& pm->ps->velocity[2] > 200
;1876:				&& PM_GroundDistance() <= 80 //unfortunately we do not have a happy ground timer like SP (this would use up more bandwidth if we wanted prediction workign right), so we'll just use the actual ground distance.
;1877:				&& !BG_InSpecialJump(pm->ps->legsAnim, pm->modParms.runFlags) )
;1878:			{//run up wall, flip backwards
line 1883
;1879:				vec3_t fwd, traceto, mins, maxs, fwdAngles;
;1880:				trace_t	trace;
;1881:				vec3_t	idealNormal;
;1882:
;1883:				if (onlyWallGrab) return qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $775
CNSTI4 0
RETI4
ADDRGP4 $485
JUMPV
LABELV $775
line 1885
;1884:
;1885:				VectorSet(mins, pm->mins[0],pm->mins[1],pm->mins[2]);
ADDRLP4 1244
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 116
ADDRLP4 1244
INDIRP4
CNSTI4 220
ADDP4
INDIRF4
ASGNF4
ADDRLP4 116+4
ADDRLP4 1244
INDIRP4
CNSTI4 224
ADDP4
INDIRF4
ASGNF4
ADDRLP4 116+8
ADDRGP4 pm
INDIRP4
CNSTI4 228
ADDP4
INDIRF4
ASGNF4
line 1886
;1886:				VectorSet(maxs, pm->maxs[0],pm->maxs[1],pm->maxs[2]);
ADDRLP4 1248
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 128
ADDRLP4 1248
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ASGNF4
ADDRLP4 128+4
ADDRLP4 1248
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ASGNF4
ADDRLP4 128+8
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
INDIRF4
ASGNF4
line 1887
;1887:				VectorSet(fwdAngles, 0, pm->ps->viewangles[YAW], 0);
ADDRLP4 140
CNSTF4 0
ASGNF4
ADDRLP4 140+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 1889
;1888:
;1889:				AngleVectors( fwdAngles, fwd, NULL, NULL );
ADDRLP4 140
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 1252
CNSTP4 0
ASGNP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1890
;1890:				VectorMA( pm->ps->origin, 32, fwd, traceto );
ADDRLP4 1256
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1260
CNSTF4 1107296256
ASGNF4
ADDRLP4 92
ADDRLP4 1256
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1260
INDIRF4
ADDRLP4 104
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92+4
ADDRLP4 1256
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1260
INDIRF4
ADDRLP4 104+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1107296256
ADDRLP4 104+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1892
;1891:
;1892:				pm->trace( &trace, pm->ps->origin, mins, maxs, traceto, pm->ps->clientNum, MASK_PLAYERSOLID );//FIXME: clip brushes too?
ADDRLP4 164
ARGP4
ADDRLP4 1264
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1268
ADDRLP4 1264
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1268
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 116
ARGP4
ADDRLP4 128
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 1268
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRLP4 1264
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 1893
;1893:				VectorSubtract( pm->ps->origin, traceto, idealNormal );
ADDRLP4 1272
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 152
ADDRLP4 1272
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 92
INDIRF4
SUBF4
ASGNF4
ADDRLP4 152+4
ADDRLP4 1272
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 92+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 152+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 92+8
INDIRF4
SUBF4
ASGNF4
line 1894
;1894:				VectorNormalize( idealNormal );
ADDRLP4 152
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1896
;1895:				
;1896:				if ( trace.fraction < 1.0f )
ADDRLP4 164+8
INDIRF4
CNSTF4 1065353216
GEF4 $774
line 1897
;1897:				{//there is a wall there
line 1898
;1898:					int parts = SETANIM_LEGS;
ADDRLP4 1276
CNSTI4 2
ASGNI4
line 1900
;1899:
;1900:					pm->ps->velocity[0] = pm->ps->velocity[1] = 0;
ADDRLP4 1280
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1284
CNSTF4 0
ASGNF4
ADDRLP4 1280
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1284
INDIRF4
ASGNF4
ADDRLP4 1280
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1284
INDIRF4
ASGNF4
line 1901
;1901:					VectorMA( pm->ps->velocity, -150, fwd, pm->ps->velocity );
ADDRLP4 1288
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1288
INDIRP4
ADDRLP4 1288
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 104
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1292
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1292
INDIRP4
ADDRLP4 1292
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 104+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1296
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1296
INDIRP4
ADDRLP4 1296
INDIRP4
INDIRF4
CNSTF4 3272998912
ADDRLP4 104+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1902
;1902:					pm->ps->velocity[2] += 128;
ADDRLP4 1300
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1300
INDIRP4
ADDRLP4 1300
INDIRP4
INDIRF4
CNSTF4 1124073472
ADDF4
ASGNF4
line 1904
;1903:
;1904:					if ( !pm->ps->weaponTime )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
NEI4 $796
line 1905
;1905:					{
line 1906
;1906:						parts = SETANIM_BOTH;
ADDRLP4 1276
CNSTI4 3
ASGNI4
line 1907
;1907:					}
LABELV $796
line 1908
;1908:					PM_SetAnim( parts, BOTH_WALL_FLIP_BACK1, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0 );
ADDRLP4 1276
INDIRI4
ARGI4
CNSTI4 944
ARGI4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1910
;1909:
;1910:					pm->ps->legsTimer -= 600; //I force this anim to play to the end to prevent landing on your head and suddenly flipping over.
ADDRLP4 1304
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
ASGNP4
ADDRLP4 1304
INDIRP4
ADDRLP4 1304
INDIRP4
INDIRI4
CNSTI4 600
SUBI4
ASGNI4
line 1913
;1911:											  //It is a bit too long at the end though, so I'll just shorten it.
;1912:
;1913:					PM_SetForceJumpZStart(pm->ps->origin[2]);//so we don't take damage if we land at same height
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 1914
;1914:					pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 1915
;1915:					pm->ps->fd.forceJumpSound = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 1
ASGNI4
line 1916
;1916:					BG_ForcePowerDrain( pm->ps, FP_LEVITATION, 5 );
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1918
;1917:
;1918:					if (trace.entityNum < MAX_CLIENTS)
ADDRLP4 164+52
INDIRI4
CNSTI4 32
GEI4 $774
line 1919
;1919:					{
line 1920
;1920:						pm->ps->forceKickFlip = trace.entityNum+1; //let the server know that this person gets kicked by this client
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1292
ADDP4
ADDRLP4 164+52
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1921
;1921:					}
line 1922
;1922:				}
line 1923
;1923:			} 
ADDRGP4 $774
JUMPV
LABELV $773
line 1924
;1924:			else if ( (pm->modParms.runFlags & RFL_CLIMBTECH) &&
ADDRLP4 92
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $802
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 92
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $806
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BG_InReboundJump
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $806
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_InBackFlip
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $802
LABELV $806
ADDRLP4 108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 112
ADDRLP4 108
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 3298164736
LEF4 $802
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRLP4 112
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 116
INDIRI4
NEI4 $802
ADDRLP4 108
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 116
INDIRI4
NEI4 $807
ADDRLP4 108
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 116
INDIRI4
EQI4 $802
LABELV $807
ADDRLP4 120
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 120
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LEI4 $802
ADDRLP4 120
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 128
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $802
ADDRLP4 132
ADDRGP4 BG_ForceWallJumpStrength
CALLF4
ASGNF4
ADDRLP4 136
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 136
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
SUBF4
ADDRGP4 forceJumpHeightMax+12
INDIRF4
ADDRLP4 132
INDIRF4
CNSTF4 1073741824
DIVF4
SUBF4
GEF4 $802
line 1939
;1925:					(!BG_InSpecialJump( legsAnim , pm->modParms.runFlags)//not in a special jump anim
;1926:						||BG_InReboundJump( legsAnim )//we're already in a rebound
;1927:						||BG_InBackFlip( legsAnim ) )//a backflip (needed so you can jump off a wall behind you)
;1928:					//&& pm->ps->velocity[2] <= 0
;1929:					&& pm->ps->velocity[2] > -1200 //not falling down very fast
;1930:					&& !(pm->ps->pm_flags&PMF_JUMP_HELD)//have to have released jump since last press
;1931:					&& (pm->cmd.forwardmove||pm->cmd.rightmove)//pushing in a direction
;1932:					//&& pm->ps->forceRageRecoveryTime < pm->cmd.serverTime	//not in a force Rage recovery period
;1933:					&& pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_2//level 3 jump or better
;1934:					//&& WP_ForcePowerAvailable( pm->gent, FP_LEVITATION, 10 )//have enough force power to do another one
;1935:					&& BG_CanUseFPNow(pm->gametype, pm->ps, pm->cmd.serverTime, FP_LEVITATION)
;1936:					&& (pm->ps->origin[2]-pm->ps->fd.forceJumpZStart) < (forceJumpHeightMax[FORCE_LEVEL_3]-(BG_ForceWallJumpStrength()/2.0f)) //can fit at least one more wall jump in (yes, using "magic numbers"... for now)
;1937:					//&& (pm->ps->legsAnim == BOTH_JUMP1 || pm->ps->legsAnim == BOTH_INAIR1 ) )//not in a flip or spin or anything
;1938:					)
;1939:			{//see if we're pushing at a wall and jump off it if so
line 1941
;1940:				//if ( allowWallGrabs )
;1941:				if ( qtrue )
line 1942
;1942:				{
line 1951
;1943:					//FIXME: make sure we have enough force power
;1944:					//FIXME: check  to see if we can go any higher
;1945:					//FIXME: limit to a certain number of these in a row?
;1946:					//FIXME: maybe don't require a ucmd direction, just check all 4?
;1947:					//FIXME: should stick to the wall for a second, then push off...
;1948:					vec3_t checkDir, traceto, mins, maxs, fwdAngles;
;1949:					trace_t	trace;
;1950:					vec3_t	idealNormal;
;1951:					int		anim = -1;
ADDRLP4 140
CNSTI4 -1
ASGNI4
line 1953
;1952:
;1953:					VectorSet(mins, pm->mins[0], pm->mins[1], 0.0f);
ADDRLP4 1296
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1260
ADDRLP4 1296
INDIRP4
CNSTI4 220
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1260+4
ADDRLP4 1296
INDIRP4
CNSTI4 224
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1260+8
CNSTF4 0
ASGNF4
line 1954
;1954:					VectorSet(maxs, pm->maxs[0], pm->maxs[1], 24.0f);
ADDRLP4 1300
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1272
ADDRLP4 1300
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1272+4
ADDRLP4 1300
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1272+8
CNSTF4 1103101952
ASGNF4
line 1955
;1955:					VectorSet(fwdAngles, 0, pm->ps->viewangles[YAW], 0.0f);
ADDRLP4 1236
CNSTF4 0
ASGNF4
ADDRLP4 1236+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1236+8
CNSTF4 0
ASGNF4
line 1957
;1956:
;1957:					if ( pm->cmd.rightmove )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $816
line 1958
;1958:					{
line 1959
;1959:						if ( pm->cmd.rightmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $818
line 1960
;1960:						{
line 1961
;1961:							anim = BOTH_FORCEWALLREBOUND_RIGHT;
ADDRLP4 140
CNSTI4 624
ASGNI4
line 1962
;1962:							AngleVectors( fwdAngles, NULL, checkDir, NULL );
ADDRLP4 1236
ARGP4
ADDRLP4 1304
CNSTP4 0
ASGNP4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRLP4 1224
ARGP4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1963
;1963:						}
ADDRGP4 $817
JUMPV
LABELV $818
line 1964
;1964:						else if ( pm->cmd.rightmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $817
line 1965
;1965:						{
line 1966
;1966:							anim = BOTH_FORCEWALLREBOUND_LEFT;
ADDRLP4 140
CNSTI4 619
ASGNI4
line 1967
;1967:							AngleVectors( fwdAngles, NULL, checkDir, NULL );
ADDRLP4 1236
ARGP4
ADDRLP4 1304
CNSTP4 0
ASGNP4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRLP4 1224
ARGP4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1968
;1968:							VectorScale( checkDir, -1, checkDir );
ADDRLP4 1308
CNSTF4 3212836864
ASGNF4
ADDRLP4 1224
ADDRLP4 1308
INDIRF4
ADDRLP4 1224
INDIRF4
MULF4
ASGNF4
ADDRLP4 1224+4
ADDRLP4 1308
INDIRF4
ADDRLP4 1224+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 1224+8
CNSTF4 3212836864
ADDRLP4 1224+8
INDIRF4
MULF4
ASGNF4
line 1969
;1969:						}
line 1970
;1970:					}
ADDRGP4 $817
JUMPV
LABELV $816
line 1971
;1971:					else if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $826
line 1972
;1972:					{
line 1973
;1973:						anim = BOTH_FORCEWALLREBOUND_FORWARD;
ADDRLP4 140
CNSTI4 618
ASGNI4
line 1974
;1974:						AngleVectors( fwdAngles, checkDir, NULL, NULL );
ADDRLP4 1236
ARGP4
ADDRLP4 1224
ARGP4
ADDRLP4 1304
CNSTP4 0
ASGNP4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1975
;1975:					}
ADDRGP4 $827
JUMPV
LABELV $826
line 1976
;1976:					else if ( pm->cmd.forwardmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $828
line 1977
;1977:					{
line 1978
;1978:						anim = BOTH_FORCEWALLREBOUND_BACK;
ADDRLP4 140
CNSTI4 620
ASGNI4
line 1979
;1979:						AngleVectors( fwdAngles, checkDir, NULL, NULL );
ADDRLP4 1236
ARGP4
ADDRLP4 1224
ARGP4
ADDRLP4 1304
CNSTP4 0
ASGNP4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1980
;1980:						VectorScale( checkDir, -1, checkDir );
ADDRLP4 1308
CNSTF4 3212836864
ASGNF4
ADDRLP4 1224
ADDRLP4 1308
INDIRF4
ADDRLP4 1224
INDIRF4
MULF4
ASGNF4
ADDRLP4 1224+4
ADDRLP4 1308
INDIRF4
ADDRLP4 1224+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 1224+8
CNSTF4 3212836864
ADDRLP4 1224+8
INDIRF4
MULF4
ASGNF4
line 1981
;1981:					}
LABELV $828
LABELV $827
LABELV $817
line 1982
;1982:					if ( anim != -1 )
ADDRLP4 140
INDIRI4
CNSTI4 -1
EQI4 $834
line 1983
;1983:					{//trace in the dir we're pushing in and see if there's a vertical wall there
line 1986
;1984:						bgEntity_t *traceEnt;
;1985:
;1986:						VectorMA( pm->ps->origin, 8, checkDir, traceto );
ADDRLP4 1308
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1312
CNSTF4 1090519040
ASGNF4
ADDRLP4 1248
ADDRLP4 1308
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1312
INDIRF4
ADDRLP4 1224
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1248+4
ADDRLP4 1308
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1312
INDIRF4
ADDRLP4 1224+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1248+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1090519040
ADDRLP4 1224+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1987
;1987:						pm->trace( &trace, pm->ps->origin, mins, maxs, traceto, pm->ps->clientNum, CONTENTS_SOLID );//FIXME: clip brushes too?
ADDRLP4 144
ARGP4
ADDRLP4 1316
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1320
ADDRLP4 1316
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1320
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1260
ARGP4
ADDRLP4 1272
ARGP4
ADDRLP4 1248
ARGP4
ADDRLP4 1320
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1316
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 1988
;1988:						VectorSubtract( pm->ps->origin, traceto, idealNormal );
ADDRLP4 1324
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1284
ADDRLP4 1324
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1248
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1284+4
ADDRLP4 1324
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1248+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1284+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 1248+8
INDIRF4
SUBF4
ASGNF4
line 1989
;1989:						VectorNormalize( idealNormal );
ADDRLP4 1284
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1990
;1990:						traceEnt = PM_BGEntForNum(trace.entityNum);
ADDRLP4 144+52
INDIRI4
ARGI4
ADDRLP4 1328
ADDRGP4 PM_BGEntForNum
CALLP4
ASGNP4
ADDRLP4 1304
ADDRLP4 1328
INDIRP4
ASGNP4
line 1991
;1991:						if ( trace.fraction < 1.0f
ADDRLP4 144+8
INDIRF4
CNSTF4 1065353216
GEF4 $845
ADDRLP4 144+24+8
INDIRF4
ARGF4
ADDRLP4 1332
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 1332
INDIRF4
CNSTF4 1045220557
GTF4 $845
ADDRLP4 144+52
INDIRI4
CNSTI4 1022
GEI4 $860
ADDRLP4 1336
ADDRLP4 1304
INDIRP4
ASGNP4
ADDRLP4 1336
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $860
ADDRLP4 1336
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $858
LABELV $860
ADDRLP4 144+24
INDIRF4
ADDRLP4 1284
INDIRF4
MULF4
ADDRLP4 144+24+4
INDIRF4
ADDRLP4 1284+4
INDIRF4
MULF4
ADDF4
ADDRLP4 144+24+8
INDIRF4
ADDRLP4 1284+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
LEF4 $845
LABELV $858
line 1994
;1992:							&&fabs(trace.plane.normal[2]) <= 0.2f/*MAX_WALL_GRAB_SLOPE*/
;1993:							&&((trace.entityNum<ENTITYNUM_WORLD&&traceEnt&&traceEnt->s.solid!=SOLID_BMODEL)||DotProduct(trace.plane.normal,idealNormal)>0.7f) )
;1994:						{//there is a wall there
line 1995
;1995:							float dot = DotProduct( pm->ps->velocity, trace.plane.normal );
ADDRLP4 1344
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1340
ADDRLP4 1344
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 144+24
INDIRF4
MULF4
ADDRLP4 1344
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 144+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1344
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 144+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1996
;1996:							if ( dot < 1.0f )
ADDRLP4 1340
INDIRF4
CNSTF4 1065353216
GEF4 $866
line 1997
;1997:							{//can't be heading *away* from the wall!
line 1999
;1998:								//grab it!
;1999:								PM_GrabWallForJump( anim );
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 PM_GrabWallForJump
CALLV
pop
line 2000
;2000:							}
LABELV $866
line 2001
;2001:						}
LABELV $845
line 2002
;2002:					}
LABELV $834
line 2003
;2003:				}
LABELV $808
line 2004
;2004:			}
LABELV $802
LABELV $774
LABELV $726
line 2005
;2005:		}
LABELV $627
line 2006
;2006:	}
LABELV $624
LABELV $612
line 2008
;2007:
;2008:	if ( !onlyWallGrab
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $868
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 64
INDIRI4
LEI4 $868
ADDRLP4 72
ADDRLP4 68
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $868
ADDRLP4 72
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
GTI4 $870
ADDRLP4 68
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $868
LABELV $870
line 2012
;2009:		&& pm->cmd.upmove > 0 
;2010:		&& pm->ps->weapon == WP_SABER
;2011:		&& (pm->ps->weaponTime > 0||pm->cmd.buttons&BUTTON_ATTACK) )
;2012:	{//okay, we just jumped and we're in an attack
line 2013
;2013:		if ( !BG_InRoll( pm->ps, pm->ps->legsAnim )
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $871
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 PM_InKnockDown
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $871
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_InDeathAnim
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $871
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $871
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 PM_SpinningAnim
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $871
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $871
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $871
line 2020
;2014:			&& !PM_InKnockDown( pm->ps )
;2015:			&& !BG_InDeathAnim(pm->ps->legsAnim)
;2016:			&& !BG_FlippingAnim( pm->ps->legsAnim )
;2017:			&& !PM_SpinningAnim( pm->ps->legsAnim )
;2018:			&& !BG_SaberInSpecialAttack( pm->ps->torsoAnim )
;2019:			&& ( BG_SaberInAttack( pm->ps->saberMove ) ) )
;2020:		{//not in an anim we shouldn't interrupt
line 2022
;2021:			//see if it's not too late to start a special jump-attack
;2022:			float animLength = PM_AnimLength( 0, (animNumber_t)pm->ps->torsoAnim );
CNSTI4 0
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 PM_AnimLength
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 112
INDIRI4
CVIF4 4
ASGNF4
line 2023
;2023:			if ( animLength - pm->ps->torsoTimer < 500 )
ADDRLP4 108
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1140457472
GEF4 $873
line 2024
;2024:			{//just started the saberMove
line 2027
;2025:				//check for special-case jump attacks
;2026:
;2027:				if ( pm->ps->fd.saberAnimLevel == FORCE_LEVEL_2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
NEI4 $875
line 2028
;2028:				{//using medium attacks
line 2029
;2029:					if (PM_GroundDistance() < 32 &&
ADDRLP4 116
ADDRGP4 PM_GroundDistance
CALLF4
ASGNF4
ADDRLP4 116
INDIRF4
CNSTF4 1107296256
GEF4 $876
ADDRLP4 120
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 120
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
NEI4 $876
line 2031
;2030:						!BG_InSpecialJump(pm->ps->legsAnim, pm->modParms.runFlags))
;2031:					{ //FLIP AND DOWNWARD ATTACK
line 2034
;2032:						trace_t tr;
;2033:
;2034:						if (PM_SomeoneInFront(&tr))
ADDRLP4 128
ARGP4
ADDRLP4 1208
ADDRGP4 PM_SomeoneInFront
CALLI4
ASGNI4
ADDRLP4 1208
INDIRI4
CNSTI4 0
EQI4 $876
line 2035
;2035:						{
line 2036
;2036:							PM_SetSaberMove(PM_SaberFlipOverAttackMove(&tr));
ADDRLP4 128
ARGP4
ADDRLP4 1212
ADDRGP4 PM_SaberFlipOverAttackMove
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CVII2 4
CVII4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 2037
;2037:							pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 2038
;2038:							pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2039
;2039:							pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 1216
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1216
INDIRP4
ADDRLP4 1216
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 2040
;2040:							PM_SetGroundEntityNum(ENTITYNUM_NONE);
CNSTI4 1023
ARGI4
ADDRGP4 PM_SetGroundEntityNum
CALLV
pop
line 2041
;2041:							VectorClear(pml.groundTrace.plane.normal);
ADDRLP4 1220
CNSTF4 0
ASGNF4
ADDRGP4 pml+52+24+8
ADDRLP4 1220
INDIRF4
ASGNF4
ADDRGP4 pml+52+24+4
ADDRLP4 1220
INDIRF4
ASGNF4
ADDRGP4 pml+52+24
ADDRLP4 1220
INDIRF4
ASGNF4
line 2043
;2042:
;2043:							pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 1224
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 1224
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 2044
;2044:						}
line 2045
;2045:					}
line 2046
;2046:				}
ADDRGP4 $876
JUMPV
LABELV $875
line 2047
;2047:				else if ( pm->ps->fd.saberAnimLevel == FORCE_LEVEL_3 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $891
line 2048
;2048:				{//using strong attacks
line 2050
;2049:					if ( //!(runFlags & RFL_CLIMBTECH) && // using JKA dfa instead then?
;2050:						pm->cmd.forwardmove > 0 && //going forward
ADDRLP4 116
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRLP4 116
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 120
INDIRI4
LEI4 $893
ADDRLP4 116
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 120
INDIRI4
NEI4 $895
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $893
LABELV $895
ADDRLP4 124
ADDRGP4 PM_GroundDistance
CALLF4
ASGNF4
ADDRLP4 124
INDIRF4
CNSTF4 1107296256
GEF4 $893
ADDRLP4 128
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 128
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $893
line 2054
;2051:						((pm->cmd.buttons & BUTTON_ATTACK) || jk2gameplay == VERSION_1_02) && //must be holding attack still
;2052:						PM_GroundDistance() < 32 &&
;2053:						!BG_InSpecialJump(pm->ps->legsAnim, pm->modParms.runFlags))
;2054:					{//strong attack: jump-hack
line 2055
;2055:						PM_SetSaberMove( PM_SaberJumpAttackMove() );
ADDRLP4 136
ADDRGP4 PM_SaberJumpAttackMove
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CVII2 4
CVII4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 2056
;2056:						pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 2057
;2057:						pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2058
;2058:						pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 140
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 2059
;2059:						PM_SetGroundEntityNum(ENTITYNUM_NONE);
CNSTI4 1023
ARGI4
ADDRGP4 PM_SetGroundEntityNum
CALLV
pop
line 2060
;2060:						VectorClear(pml.groundTrace.plane.normal);
ADDRLP4 144
CNSTF4 0
ASGNF4
ADDRGP4 pml+52+24+8
ADDRLP4 144
INDIRF4
ASGNF4
ADDRGP4 pml+52+24+4
ADDRLP4 144
INDIRF4
ASGNF4
ADDRGP4 pml+52+24
ADDRLP4 144
INDIRF4
ASGNF4
line 2062
;2061:
;2062:						pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 148
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 148
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 2063
;2063:					}
LABELV $893
line 2064
;2064:				}
LABELV $891
LABELV $876
line 2065
;2065:			}
LABELV $873
line 2066
;2066:		}
LABELV $871
line 2067
;2067:	}
LABELV $868
line 2068
;2068:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $906
line 2069
;2069:	{
line 2070
;2070:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $485
JUMPV
LABELV $906
line 2072
;2071:	}
;2072:	if ( pm->cmd.upmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $908
line 2073
;2073:	{//no special jumps
line 2074
;2074:		if (MovementIsQuake3Based(pm->modParms.physics)) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $910
line 2076
;2075:			// TODO flood protect jumps? idk
;2076:			pm->ps->velocity[2] += JUMP_VELOCITY_NEW;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2077
;2077:			if (pm->ps->velocity[2] < 270)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1132920832
GEF4 $912
line 2078
;2078:				pm->ps->velocity[2] = 270;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132920832
ASGNF4
LABELV $912
line 2079
;2079:			pm->ps->stats[STAT_LASTJUMPSPEED] = pm->ps->velocity[2];
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 2080
;2080:		}
ADDRGP4 $911
JUMPV
LABELV $910
line 2081
;2081:		else {
line 2082
;2082:			pm->ps->velocity[2] = JUMP_VELOCITY_NEW;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
line 2083
;2083:		}
LABELV $911
line 2084
;2084:		PM_SetForceJumpZStart(pm->ps->origin[2]);//so we don't take damage if we land at same height
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 2085
;2085:		pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 2086
;2086:	}
LABELV $908
line 2089
;2087:
;2088:	//Jumping
;2089:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 2090
;2090:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2091
;2091:	pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 2092
;2092:	PM_SetGroundEntityNum(ENTITYNUM_NONE);
CNSTI4 1023
ARGI4
ADDRGP4 PM_SetGroundEntityNum
CALLV
pop
line 2093
;2093:	PM_SetForceJumpZStart(pm->ps->origin[2]);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 2095
;2094:
;2095:	PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2098
;2096:
;2097:	//Set the animations
;2098:	if ( pm->ps->gravity > 0 && !BG_InSpecialJump( pm->ps->legsAnim, pm->modParms.runFlags) )
ADDRLP4 80
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
LEI4 $916
ADDRLP4 84
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $916
line 2099
;2099:	{
line 2100
;2100:		PM_JumpForDir();
ADDRGP4 PM_JumpForDir
CALLV
pop
line 2101
;2101:	}
LABELV $916
line 2103
;2102:
;2103:	return qtrue;
CNSTI4 1
RETI4
LABELV $485
endproc PM_CheckJump 1348 28
proc PM_CheckWaterJump 56 8
line 2110
;2104:}
;2105:/*
;2106:=============
;2107:PM_CheckWaterJump
;2108:=============
;2109:*/
;2110:static qboolean	PM_CheckWaterJump( void ) {
line 2115
;2111:	vec3_t	spot;
;2112:	int		cont;
;2113:	vec3_t	flatforward;
;2114:
;2115:	if (pm->ps->pm_time) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $919
line 2116
;2116:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $918
JUMPV
LABELV $919
line 2120
;2117:	}
;2118:
;2119:	// check for water jump
;2120:	if ( pm->waterlevel != 2 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
EQI4 $921
line 2121
;2121:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $918
JUMPV
LABELV $921
line 2124
;2122:	}
;2123:
;2124:	flatforward[0] = pml.forward[0];
ADDRLP4 12
ADDRGP4 pml
INDIRF4
ASGNF4
line 2125
;2125:	flatforward[1] = pml.forward[1];
ADDRLP4 12+4
ADDRGP4 pml+4
INDIRF4
ASGNF4
line 2126
;2126:	flatforward[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 2127
;2127:	VectorNormalize (flatforward);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2129
;2128:
;2129:	VectorMA (pm->ps->origin, 30, flatforward, spot);
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 1106247680
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1106247680
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2130
;2130:	spot[2] += 4;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 2131
;2131:	cont = pm->pointcontents (spot, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 308
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRI4
ASGNI4
line 2132
;2132:	if ( !(cont & CONTENTS_SOLID) ) {
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $931
line 2133
;2133:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $918
JUMPV
LABELV $931
line 2136
;2134:	}
;2135:
;2136:	spot[2] += 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2137
;2137:	cont = pm->pointcontents (spot, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 308
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 48
INDIRI4
ASGNI4
line 2138
;2138:	if ( cont ) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $934
line 2139
;2139:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $918
JUMPV
LABELV $934
line 2143
;2140:	}
;2141:
;2142:	// jump out of water
;2143:	VectorScale (pml.forward, 200, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1128792064
ADDRGP4 pml
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1128792064
ADDRGP4 pml+4
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1128792064
ADDRGP4 pml+8
INDIRF4
MULF4
ASGNF4
line 2144
;2144:	pm->ps->velocity[2] = 350;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1135542272
ASGNF4
line 2146
;2145:
;2146:	pm->ps->pm_flags |= PMF_TIME_WATERJUMP;
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2147
;2147:	pm->ps->pm_time = 2000;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 2000
ASGNI4
line 2149
;2148:
;2149:	return qtrue;
CNSTI4 1
RETI4
LABELV $918
endproc PM_CheckWaterJump 56 8
export PM_ForcePowerAvailable
proc PM_ForcePowerAvailable 8 0
line 2163
;2150:}
;2151:
;2152://============================================================================
;2153:
;2154:/*
;2155:* 
;2156:* CHARGE JUMP MECHANICS
;2157:* Have some extra vars we need to network via stats entities: ps.groundTime, ps->fd->forcejumpcharge
;2158:* Using new PMF_FJDIDJUMP
;2159:* 
;2160:*/
;2161:
;2162:qboolean PM_ForcePowerAvailable(forcePowers_t forcePower)
;2163:{
line 2164
;2164:	int	drain = forcePowerNeeded[pm->ps->fd.forcePowerLevel[forcePower]][forcePower];
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 72
ADDRLP4 4
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
ADDP4
INDIRI4
ASGNI4
line 2166
;2165:
;2166:	if (pm->ps->fd.forcePowersActive & (1 << forcePower))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $939
line 2167
;2167:	{ //we're probably going to deactivate it..
line 2168
;2168:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $938
JUMPV
LABELV $939
line 2171
;2169:	}
;2170:
;2171:	if (forcePower == FP_LEVITATION)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $941
line 2172
;2172:	{
line 2173
;2173:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $938
JUMPV
LABELV $941
line 2175
;2174:	}
;2175:	if (!drain)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $943
line 2176
;2176:	{
line 2177
;2177:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $938
JUMPV
LABELV $943
line 2179
;2178:	}
;2179:	if (pm->ps->fd.forcePower < drain)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $945
line 2180
;2180:	{
line 2181
;2181:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $938
JUMPV
LABELV $945
line 2183
;2182:	}
;2183:	return qtrue;
CNSTI4 1
RETI4
LABELV $938
endproc PM_ForcePowerAvailable 8 0
export PM_ForcePowerUsable
proc PM_ForcePowerUsable 28 16
line 2187
;2184:}
;2185:
;2186:qboolean PM_ForcePowerUsable(forcePowers_t forcePower)
;2187:{
line 2189
;2188:
;2189:	if (BG_HasYsalamiri(pm->gametype, pm->ps))
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $948
line 2190
;2190:	{
line 2191
;2191:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $947
JUMPV
LABELV $948
line 2203
;2192:	}
;2193:
;2194:	//if (pm->ps->pm_flags & PMF_FOLLOW)
;2195:	//{ //specs can't use powers through people
;2196:	//	return qfalse;
;2197:	//}
;2198:	//if (self->client->sess.sessionTeam == TEAM_SPECTATOR)
;2199:	//{
;2200:	//	return qfalse;
;2201:	//}
;2202:
;2203:	if (!BG_CanUseFPNow(pm->gametype, pm->ps, pm->cmd.serverTime, forcePower))
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $950
line 2204
;2204:	{
line 2205
;2205:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $947
JUMPV
LABELV $950
line 2208
;2206:	}
;2207:
;2208:	if (!(pm->ps->fd.forcePowersKnown & (1 << forcePower)))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $952
line 2209
;2209:	{//don't know this power
line 2210
;2210:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $947
JUMPV
LABELV $952
line 2213
;2211:	}
;2212:
;2213:	if ((pm->ps->fd.forcePowersActive & (1 << forcePower)))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $954
line 2214
;2214:	{//already using this power
line 2215
;2215:		if (forcePower != FP_LEVITATION)
ADDRFP4 0
INDIRI4
CNSTI4 1
EQI4 $956
line 2216
;2216:		{
line 2217
;2217:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $947
JUMPV
LABELV $956
line 2219
;2218:		}
;2219:	}
LABELV $954
line 2221
;2220:
;2221:	if (forcePower == FP_LEVITATION && (pm->modParms.physics == MV_CHARGEJUMP && (pm->ps->pm_flags & PMF_FJDIDJUMP)))
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $958
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 12
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $958
ADDRLP4 16
INDIRP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $958
line 2222
;2222:	{
line 2223
;2223:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $947
JUMPV
LABELV $958
line 2226
;2224:	}
;2225:
;2226:	if (!pm->ps->fd.forcePowerLevel[forcePower])
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $960
line 2227
;2227:	{
line 2234
;2228:#if JK2_CGAME && CLIENTSIDE_PREDICTION_FIXES // actually, not really needed. this is only called with FP_LEVITATION anyway.
;2229:		if (!NONETWORK_FORCEPOWERLEVEL(pm->ps,forcePower)) {
;2230:			// ok this is likely a force powers disabled gamemode
;2231:			return qfalse;
;2232:		}
;2233:#else
;2234:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $947
JUMPV
LABELV $960
line 2238
;2235:#endif
;2236:	}
;2237:
;2238:	return PM_ForcePowerAvailable(forcePower);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 PM_ForcePowerAvailable
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
LABELV $947
endproc PM_ForcePowerUsable 28 16
export PM_ForceJumpCharge
proc PM_ForceJumpCharge 44 12
line 2244
;2239:}
;2240:
;2241:#define PM_FORCE_JUMP_CHARGE_TIME 1000.0f
;2242://#define PM_FORCE_JUMP_CHARGE_TIME_SEGMENTSLEGACY (PM_FORCE_JUMP_CHARGE_TIME/100.0f)
;2243:void PM_ForceJumpCharge()
;2244:{
line 2245
;2245:	float baseJumpStrength = forceJumpStrength[0];
ADDRLP4 0
ADDRGP4 forceJumpStrength
INDIRF4
ASGNF4
line 2246
;2246:	float jumpStrengthChargeSpeedBase = forceJumpStrength[pm->ps->fd.forcePowerLevel[FP_LEVITATION]];
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
ASGNF4
line 2247
;2247:	float forceJumpChargeInterval = (jumpStrengthChargeSpeedBase- baseJumpStrength) * pml.frametime * 1000.0f / PM_FORCE_JUMP_CHARGE_TIME;
ADDRLP4 12
CNSTF4 1148846080
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ADDRGP4 pml+36
INDIRF4
MULF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
ASGNF4
line 2249
;2248:
;2249:	if (pm->ps->pm_type == PM_DEAD)
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $964
line 2250
;2250:	{
line 2251
;2251:		return;
ADDRGP4 $962
JUMPV
LABELV $964
line 2254
;2252:	}
;2253:
;2254:	if (pm->ps->fd.forcePowerLevel[FP_LEVITATION] <= 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 0
GTI4 $966
line 2255
;2255:		return;
ADDRGP4 $962
JUMPV
LABELV $966
line 2263
;2256:	}
;2257:
;2258:	//if (!pm->ps->fd.forceJumpCharge && pm->ps->groundEntityNum == ENTITYNUM_NONE) // TA I think the original version intended for charge to be possible in air
;2259:	//{
;2260:	//	return;
;2261:	//}
;2262:
;2263:	if (pm->ps->fd.forcePower < forcePowerNeeded[pm->ps->fd.forcePowerLevel[FP_LEVITATION]][FP_LEVITATION])
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 20
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $968
line 2264
;2264:	{
line 2266
;2265:#if JK2_GAME
;2266:		G_MuteSound(pm->ps->fd.killSoundEntIndex[TRACK_CHANNEL_1 - 50], CHAN_VOICE); 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 2268
;2267:#endif
;2268:		return;
ADDRGP4 $962
JUMPV
LABELV $968
line 2282
;2269:	}
;2270:
;2271:	//if (!pm->ps->fd.forceJumpCharge)
;2272:	//{
;2273:	//	pm->ps->fd.forceJumpAddTime = 0;
;2274:	//}
;2275:
;2276:	//if (pm->ps->fd.forceJumpAddTime >= level.time)
;2277:	//{
;2278:	//	return;
;2279:	//}
;2280:
;2281:	//need to play sound
;2282:	if (!pm->ps->fd.forceJumpCharge || !(pm->ps->stats[STAT_CHARGEJUMPDATA] & CHARGEJUMPFLAG_CHARGING)) // if we interrupt our charging, restart.
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
EQF4 $972
ADDRLP4 24
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $970
LABELV $972
line 2283
;2283:	{
line 2285
;2284:#if JK2_GAME
;2285:		G_Sound(g_entities+pm->ps->clientNum, TRACK_CHANNEL_1, G_SoundIndex("sound/weapons/force/jumpbuild.wav")); 
ADDRGP4 $973
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
CNSTI4 2352
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2287
;2286:#endif
;2287:		pm->ps->fd.forceJumpCharge = baseJumpStrength; // always keep this as the basis
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1096
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 2288
;2288:	}
LABELV $970
line 2290
;2289:
;2290:	pm->ps->stats[STAT_CHARGEJUMPDATA] |= CHARGEJUMPFLAG_CHARGING;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2294
;2291:
;2292:	//Increment
;2293:	//if (pm->ps->fd.forceJumpAddTime < pm->cmd.serverTime)
;2294:	{
line 2295
;2295:		pm->ps->fd.forceJumpCharge += forceJumpChargeInterval;// *50;// TA: wtf no, why times 50!?
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1096
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ASGNF4
line 2297
;2296:		//pm->ps->fd.forceJumpAddTime = level.time + 500;
;2297:	}
line 2300
;2298:
;2299:	//clamp to max strength for current level
;2300:	if (pm->ps->fd.forceJumpCharge > forceJumpStrength[pm->ps->fd.forcePowerLevel[FP_LEVITATION]])
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
LEF4 $974
line 2301
;2301:	{
line 2302
;2302:		pm->ps->fd.forceJumpCharge = forceJumpStrength[pm->ps->fd.forcePowerLevel[FP_LEVITATION]];
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 1096
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
ASGNF4
line 2304
;2303:		//G_MuteSound(pm->ps->fd.killSoundEntIndex[TRACK_CHANNEL_1 - 50], CHAN_VOICE); // TA restore this somehow idk
;2304:	}
LABELV $974
line 2308
;2305:
;2306:
;2307:	//clamp to max available force power
;2308:	if (pm->ps->fd.forceJumpCharge / baseJumpStrength * forcePowerNeeded[pm->ps->fd.forcePowerLevel[FP_LEVITATION]][FP_LEVITATION] > pm->ps->fd.forcePower)
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
DIVF4
CNSTI4 72
ADDRLP4 36
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRLP4 36
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CVIF4 4
LEF4 $976
line 2309
;2309:	{//can't use more than you have
line 2311
;2310:#if JK2_GAME
;2311:		G_MuteSound(pm->ps->fd.killSoundEntIndex[TRACK_CHANNEL_1 - 50], CHAN_VOICE);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 2313
;2312:#endif
;2313:		pm->ps->fd.forceJumpCharge = baseJumpStrength * pm->ps->fd.forcePower / forcePowerNeeded[pm->ps->fd.forcePowerLevel[FP_LEVITATION]][FP_LEVITATION];
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1096
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CVIF4 4
MULF4
CNSTI4 72
ADDRLP4 40
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 2314
;2314:	}
LABELV $976
line 2317
;2315:
;2316:	//G_Printf("%f\n", self->client->ps.fd.forceJumpCharge);
;2317:}
LABELV $962
endproc PM_ForceJumpCharge 44 12
lit
align 4
LABELV $980
byte 4 1116564446
export PM_GetVelocityForForceJump
code
proc PM_GetVelocityForForceJump 88 16
line 2328
;2318:typedef enum
;2319:{
;2320:	PM_FJ_FORWARD,
;2321:	PM_FJ_BACKWARD,
;2322:	PM_FJ_RIGHT,
;2323:	PM_FJ_LEFT,
;2324:	PM_FJ_UP
;2325:};
;2326:
;2327:int PM_GetVelocityForForceJump( vec3_t jumpVel)
;2328:{
line 2329
;2329:	float pushFwd = 0, pushRt = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 4
CNSTF4 0
ASGNF4
line 2332
;2330:	vec3_t	view, forward, right;
;2331:	static const float sideAmt = 70.710678118654752440084436210485f;//100.0f*sqrtf(0.5f); // TA: it does 50 in vanilla but eh, then the WA/WD behavior isnt consistent with A/D behavior. sucks.
;2332:	float maxCharge = forceJumpStrength[pm->ps->fd.forcePowerLevel[FP_LEVITATION]];
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
ASGNF4
line 2333
;2333:	float baseCharge = forceJumpStrength[0];
ADDRLP4 44
ADDRGP4 forceJumpStrength
INDIRF4
ASGNF4
line 2336
;2334:	float chargePercent;
;2335:
;2336:	if (pm->ps->fd.forcePowerLevel[FP_LEVITATION]<= 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 0
GTI4 $981
line 2337
;2337:		VectorCopy(pm->ps->velocity,jumpVel);
ADDRFP4 0
INDIRP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2338
;2338:		return PM_FJ_UP;
CNSTI4 4
RETI4
ADDRGP4 $979
JUMPV
LABELV $981
line 2341
;2339:	}
;2340:
;2341:	VectorCopy(pm->ps->viewangles, view);
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2342
;2342:	view[0] = 0;
ADDRLP4 32
CNSTF4 0
ASGNF4
line 2343
;2343:	AngleVectors(view, forward, right, NULL);
ADDRLP4 32
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2344
;2344:	if (pm->cmd.forwardmove && pm->cmd.rightmove)
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
EQI4 $983
ADDRLP4 56
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 60
INDIRI4
EQI4 $983
line 2345
;2345:	{
line 2346
;2346:		if (pm->cmd.forwardmove > 0)
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $985
line 2347
;2347:		{
line 2348
;2348:			pushFwd = sideAmt;
ADDRLP4 0
ADDRGP4 $980
INDIRF4
ASGNF4
line 2349
;2349:		}
ADDRGP4 $986
JUMPV
LABELV $985
line 2351
;2350:		else
;2351:		{
line 2352
;2352:			pushFwd = -sideAmt;
ADDRLP4 0
ADDRGP4 $980
INDIRF4
NEGF4
ASGNF4
line 2353
;2353:		}
LABELV $986
line 2354
;2354:		if (pm->cmd.rightmove > 0)
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $987
line 2355
;2355:		{
line 2356
;2356:			pushRt = sideAmt;
ADDRLP4 4
ADDRGP4 $980
INDIRF4
ASGNF4
line 2357
;2357:		}
ADDRGP4 $984
JUMPV
LABELV $987
line 2359
;2358:		else
;2359:		{
line 2360
;2360:			pushRt = -sideAmt;
ADDRLP4 4
ADDRGP4 $980
INDIRF4
NEGF4
ASGNF4
line 2361
;2361:		}
line 2362
;2362:	}
ADDRGP4 $984
JUMPV
LABELV $983
line 2363
;2363:	else if (pm->cmd.forwardmove || pm->cmd.rightmove)
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
NEI4 $991
ADDRLP4 64
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
EQI4 $989
LABELV $991
line 2364
;2364:	{
line 2365
;2365:		if (pm->cmd.forwardmove > 0)
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $992
line 2366
;2366:		{
line 2367
;2367:			pushFwd = 100;
ADDRLP4 0
CNSTF4 1120403456
ASGNF4
line 2368
;2368:		}
ADDRGP4 $993
JUMPV
LABELV $992
line 2369
;2369:		else if (pm->cmd.forwardmove < 0)
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $994
line 2370
;2370:		{
line 2371
;2371:			pushFwd = -100;
ADDRLP4 0
CNSTF4 3267887104
ASGNF4
line 2372
;2372:		}
ADDRGP4 $995
JUMPV
LABELV $994
line 2373
;2373:		else if (pm->cmd.rightmove > 0)
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $996
line 2374
;2374:		{
line 2375
;2375:			pushRt = 100;
ADDRLP4 4
CNSTF4 1120403456
ASGNF4
line 2376
;2376:		}
ADDRGP4 $997
JUMPV
LABELV $996
line 2377
;2377:		else if (pm->cmd.rightmove < 0)
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $998
line 2378
;2378:		{
line 2379
;2379:			pushRt = -100;
ADDRLP4 4
CNSTF4 3267887104
ASGNF4
line 2380
;2380:		}
LABELV $998
LABELV $997
LABELV $995
LABELV $993
line 2381
;2381:	}
LABELV $989
LABELV $984
line 2384
;2382:
;2383:#if JK2_GAME
;2384:	G_MuteSound(pm->ps->fd.killSoundEntIndex[TRACK_CHANNEL_1 - 50], CHAN_VOICE);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1204
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 2386
;2385:
;2386:	G_Sound(g_entities+pm->ps->clientNum, CHAN_AUTO, G_SoundIndex("sound/weapons/force/jump.wav"));
ADDRGP4 $1000
ARGP4
ADDRLP4 72
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
CNSTI4 2352
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2395
;2387:#endif
;2388:
;2389:	// TA: We are racing. Give us detailed stepless control.
;2390:	//if (pm->ps->fd.forceJumpCharge < JUMP_VELOCITY + 40)
;2391:	//{ //give him at least a tiny boost from just a tap
;2392:	//	pm->ps->fd.forceJumpCharge = JUMP_VELOCITY + 40;
;2393:	//}
;2394:
;2395:	if (pm->ps->velocity[2] < -30)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 3253731328
GEF4 $1001
line 2396
;2396:	{ //so that we can get a good boost when force jumping in a fall
line 2397
;2397:		pm->ps->velocity[2] = -30;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 3253731328
ASGNF4
line 2398
;2398:	}
LABELV $1001
line 2400
;2399:
;2400:	VectorMA(pm->ps->velocity, pushFwd, forward, jumpVel);
ADDRFP4 0
INDIRP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 8+4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 8+8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2401
;2401:	if (pm->modParms.physics == MV_CHARGEJUMP) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 12
NEI4 $1005
line 2403
;2402:		// i think this was the intended behavior.
;2403:		VectorMA(jumpVel, pushRt, right, jumpVel);
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 20+4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 20+8
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2404
;2404:	}
ADDRGP4 $1006
JUMPV
LABELV $1005
line 2405
;2405:	else {
line 2406
;2406:		VectorMA(pm->ps->velocity, pushRt, right, jumpVel);
ADDRFP4 0
INDIRP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20+4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20+8
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2407
;2407:	}
LABELV $1006
line 2408
;2408:	jumpVel[2] += pm->ps->fd.forceJumpCharge;//forceJumpStrength;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2409
;2409:	chargePercent = (pm->ps->fd.forceJumpCharge - baseCharge)/(maxCharge - baseCharge);
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 44
INDIRF4
SUBF4
ADDRLP4 52
INDIRF4
ADDRLP4 44
INDIRF4
SUBF4
DIVF4
ASGNF4
line 2410
;2410:	if (pushFwd > 0 && chargePercent > 0.5f)// && pm->ps->fd.forceJumpCharge > 200) // TA changed this so there is a bit of variability.
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1011
ADDRLP4 48
INDIRF4
CNSTF4 1056964608
LEF4 $1011
line 2411
;2411:	{
line 2412
;2412:		return PM_FJ_FORWARD;
CNSTI4 0
RETI4
ADDRGP4 $979
JUMPV
LABELV $1011
line 2414
;2413:	}
;2414:	else if (pushFwd < 0 && chargePercent > 0.5f)//  && pm->ps->fd.forceJumpCharge > 200)
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $1013
ADDRLP4 48
INDIRF4
CNSTF4 1056964608
LEF4 $1013
line 2415
;2415:	{
line 2416
;2416:		return PM_FJ_BACKWARD;
CNSTI4 1
RETI4
ADDRGP4 $979
JUMPV
LABELV $1013
line 2418
;2417:	}
;2418:	else if (pushRt > 0 && chargePercent > 0.5f)//  && pm->ps->fd.forceJumpCharge > 200)
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $1015
ADDRLP4 48
INDIRF4
CNSTF4 1056964608
LEF4 $1015
line 2419
;2419:	{
line 2420
;2420:		return PM_FJ_RIGHT;
CNSTI4 2
RETI4
ADDRGP4 $979
JUMPV
LABELV $1015
line 2422
;2421:	}
;2422:	else if (pushRt < 0 && chargePercent > 0.5f)//  && pm->ps->fd.forceJumpCharge > 200)
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $1017
ADDRLP4 48
INDIRF4
CNSTF4 1056964608
LEF4 $1017
line 2423
;2423:	{
line 2424
;2424:		return PM_FJ_LEFT;
CNSTI4 3
RETI4
ADDRGP4 $979
JUMPV
LABELV $1017
line 2427
;2425:	}
;2426:	else
;2427:	{//FIXME: jump straight up anim
line 2428
;2428:		return PM_FJ_UP;
CNSTI4 4
RETI4
LABELV $979
endproc PM_GetVelocityForForceJump 88 16
export PM_ChargeForceJump
proc PM_ChargeForceJump 84 16
line 2437
;2429:	}
;2430:}
;2431:
;2432:#if JK2_GAME
;2433:void WP_ForcePowerStart(gentity_t* self, forcePowers_t forcePower, int overrideAmt);
;2434:#endif
;2435:
;2436:void PM_ChargeForceJump()
;2437:{
line 2441
;2438:	float jumpStrengthChargeSpeedBase;
;2439:	float forceJumpChargeInterval;
;2440:	float forceDeduction;
;2441:	int anim = BOTH_FORCEINAIR1;
ADDRLP4 4
CNSTI4 870
ASGNI4
line 2442
;2442:	int	parts = SETANIM_BOTH;
ADDRLP4 8
CNSTI4 3
ASGNI4
line 2444
;2443:	vec3_t	jumpVel; 
;2444:	float baseJumpStrength = forceJumpStrength[0];
ADDRLP4 0
ADDRGP4 forceJumpStrength
INDIRF4
ASGNF4
line 2447
;2445:	//	int	parts = SETANIM_BOTH;
;2446:
;2447:	if (pm->ps->fd.forcePowerDuration[FP_LEVITATION] > pm->cmd.serverTime)
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 864
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LEI4 $1020
line 2448
;2448:	{
line 2449
;2449:		return;
ADDRGP4 $1019
JUMPV
LABELV $1020
line 2451
;2450:	}
;2451:	if (pm->ps->fd.forcePowerLevel[FP_LEVITATION] <= 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1022
line 2452
;2452:		return;
ADDRGP4 $1019
JUMPV
LABELV $1022
line 2454
;2453:	}
;2454:	if (BG_HasYsalamiri(pm->gametype, pm->ps)) {
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $1024
line 2455
;2455:		return;
ADDRGP4 $1019
JUMPV
LABELV $1024
line 2457
;2456:	}
;2457:	if (!BG_CanUseFPNow(pm->gametype, pm->ps, pm->cmd.serverTime, FP_LEVITATION)) {
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 52
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $1026
line 2458
;2458:		return;
ADDRGP4 $1019
JUMPV
LABELV $1026
line 2460
;2459:	}
;2460:	if (!PM_ForcePowerUsable(FP_LEVITATION))
CNSTI4 1
ARGI4
ADDRLP4 56
ADDRGP4 PM_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $1028
line 2461
;2461:	{
line 2462
;2462:		return;
ADDRGP4 $1019
JUMPV
LABELV $1028
line 2465
;2463:	}
;2464:	//if (self->s.groundEntityNum == ENTITYNUM_NONE)
;2465:	if (pm->ps->groundEntityNum == ENTITYNUM_NONE)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1030
line 2466
;2466:	{
line 2467
;2467:		return;
ADDRGP4 $1019
JUMPV
LABELV $1030
line 2482
;2468:	}
;2469:	//	if ( pm->ps->pm_flags&PMF_JUMP_HELD )
;2470:	//	{
;2471:	//		return;
;2472:	//	}
;2473:	//if (self->health <= 0) // should already be excluded at this point
;2474:	//{
;2475:	//	return;
;2476:	//}
;2477:
;2478:	//G_SoundOnEnt( self, CHAN_BODY, "sound/weapons/force/jump.wav" );
;2479:	//play sound here
;2480:
;2481:	//self->client->fjDidJump = qtrue;
;2482:	pm->ps->pm_flags |= PMF_FJDIDJUMP;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 2485
;2483:
;2484:	//forceJumpChargeInterval = forceJumpStrength[pm->ps->fd.forcePowerLevel[FP_LEVITATION]] / PM_FORCE_JUMP_CHARGE_TIME_SEGMENTSLEGACY;
;2485:	jumpStrengthChargeSpeedBase = forceJumpStrength[pm->ps->fd.forcePowerLevel[FP_LEVITATION]];
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
ASGNF4
line 2486
;2486:	forceJumpChargeInterval = (jumpStrengthChargeSpeedBase- baseJumpStrength) * pml.frametime * 1000.0f / PM_FORCE_JUMP_CHARGE_TIME;
ADDRLP4 64
CNSTF4 1148846080
ASGNF4
ADDRLP4 32
ADDRLP4 64
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ADDRGP4 pml+36
INDIRF4
MULF4
MULF4
ADDRLP4 64
INDIRF4
DIVF4
ASGNF4
line 2488
;2487:
;2488:	switch (PM_GetVelocityForForceJump(jumpVel))
ADDRLP4 20
ARGP4
ADDRLP4 72
ADDRGP4 PM_GetVelocityForForceJump
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
LTI4 $1033
ADDRLP4 68
INDIRI4
CNSTI4 4
GTI4 $1033
ADDRLP4 68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1041
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1041
address $1036
address $1037
address $1038
address $1039
address $1040
code
line 2489
;2489:	{
LABELV $1036
line 2491
;2490:	case PM_FJ_FORWARD:
;2491:		anim = BOTH_FLIP_F;
ADDRLP4 4
CNSTI4 881
ASGNI4
line 2493
;2492:				//dmEvent = DM_FLIP;
;2493:		break;
ADDRGP4 $1034
JUMPV
LABELV $1037
line 2495
;2494:	case PM_FJ_BACKWARD:
;2495:		anim = BOTH_FLIP_B;
ADDRLP4 4
CNSTI4 882
ASGNI4
line 2497
;2496:				//dmEvent = DM_FLIP;
;2497:		break;
ADDRGP4 $1034
JUMPV
LABELV $1038
line 2499
;2498:	case PM_FJ_RIGHT:
;2499:		anim = BOTH_FLIP_R;
ADDRLP4 4
CNSTI4 884
ASGNI4
line 2501
;2500:				//dmEvent = DM_FLIP;
;2501:		break;
ADDRGP4 $1034
JUMPV
LABELV $1039
line 2503
;2502:	case PM_FJ_LEFT:
;2503:		anim = BOTH_FLIP_L;
ADDRLP4 4
CNSTI4 883
ASGNI4
line 2505
;2504:				//dmEvent = DM_FLIP;
;2505:		break;
ADDRGP4 $1034
JUMPV
LABELV $1033
LABELV $1040
line 2508
;2506:	default:
;2507:	case PM_FJ_UP:
;2508:		anim = BOTH_JUMP1;
ADDRLP4 4
CNSTI4 856
ASGNI4
line 2510
;2509:				//dmEvent = DM_JUMP;
;2510:		break;
LABELV $1034
line 2513
;2511:	}
;2512:
;2513:	if (pm->ps->weaponTime)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1042
line 2514
;2514:	{//FIXME: really only care if we're in a saber attack anim.. maybe trail length?
line 2515
;2515:		parts = SETANIM_LEGS;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 2516
;2516:	}
LABELV $1042
line 2518
;2517:	
;2518:	PM_SetAnim(parts, anim, SETANIM_FLAG_OVERRIDE | SETANIM_FLAG_HOLD, 150);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2526
;2519:	//NPC_SetAnim( self, parts, anim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD );
;2520:	//if (!self->s.number)
;2521:	//{
;2522:		//G_DynaMixEvent( dmEvent );
;2523:	//}
;2524:
;2525:	//FIXME: sound effect
;2526:	PM_SetForceJumpZStart(pm->ps->origin[2]);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 2528
;2527:	//pm->ps->fd.forceJumpZStart = pm->ps->origin[2];//remember this for when we land
;2528:	VectorCopy(jumpVel, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 2529
;2529:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 2530
;2530:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2531
;2531:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 2537
;2532:	//wasn't allowing them to attack when jumping, but that was annoying
;2533:	//pm->ps->weaponTime = pm->ps->torsoAnimTimer;
;2534:
;2535:	//forceDeduction = pm->ps->fd.forceJumpCharge / forceJumpChargeInterval / PM_FORCE_JUMP_CHARGE_TIME_SEGMENTSLEGACY * forcePowerNeeded[pm->ps->fd.forcePowerLevel[FP_LEVITATION]][FP_LEVITATION];
;2536:	//forceDeduction = (pm->ps->fd.forceJumpCharge - baseJumpStrength) / (jumpStrengthChargeSpeedBase - baseJumpStrength) * forcePowerNeeded[pm->ps->fd.forcePowerLevel[FP_LEVITATION]][FP_LEVITATION];
;2537:	forceDeduction = pm->ps->fd.forceJumpCharge / baseJumpStrength * forcePowerNeeded[pm->ps->fd.forcePowerLevel[FP_LEVITATION]][FP_LEVITATION];
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 80
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
DIVF4
CNSTI4 72
ADDRLP4 80
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 2540
;2538:
;2539:#if JK2_GAME
;2540:	WP_ForcePowerStart(g_entities+pm->ps->clientNum, FP_LEVITATION, forceDeduction);
CNSTI4 2352
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 16
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 2548
;2541:#else
;2542:	pm->ps->fd.forcePowersActive |= (1 << FP_LEVITATION);
;2543:	BG_ForcePowerDrain(pm->ps, FP_LEVITATION, forceDeduction);
;2544:	pm->ps->fd.forcePowerDebounce[FP_LEVITATION] = 0;
;2545:	pm->ps->fd.forcePowerDuration[FP_LEVITATION] = 0;
;2546:#endif
;2547:	//pm->ps->fd.forcePowerDuration[FP_LEVITATION] = pm->cmd.serverTime + pm->ps->weaponTime;
;2548:	pm->ps->fd.forceJumpCharge = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1096
ADDP4
CNSTF4 0
ASGNF4
line 2549
;2549:	pm->ps->forceJumpFlip = qtrue;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 1
ASGNI4
line 2550
;2550:}
LABELV $1019
endproc PM_ChargeForceJump 84 16
proc PM_CheckChargeJump 48 16
line 2559
;2551:
;2552:/*
;2553:===================
;2554:PM_CheckChargeJump
;2555:
;2556:Was in w_force but unused and rly should be predicted...
;2557:===================
;2558:*/
;2559:static void PM_CheckChargeJump( void ) {
line 2560
;2560:	qboolean usingForce = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2561
;2561:	qboolean buttonPressed = (pm->cmd.buttons & BUTTON_FORCEPOWER) &&
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1051
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1050
LABELV $1051
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1048
LABELV $1050
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $1049
JUMPV
LABELV $1048
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $1049
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2564
;2562:		pm->ps->fd.forcePowerSelected == FP_LEVITATION || (pm->cmd.buttons & BUTTON_BOUNCEPOWER);
;2563:
;2564:	if (pm->ps->groundEntityNum != ENTITYNUM_NONE)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $1052
line 2565
;2565:	{
line 2566
;2566:		pm->ps->pm_flags &= ~PMF_FJDIDJUMP;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 2568
;2567:		//self->client->fjDidJump = qfalse;
;2568:	}
LABELV $1052
line 2582
;2569:
;2570:	// feels bad. just clear when we land without anything pressed
;2571:	/*if (pm->ps->fd.forceJumpCharge && pm->ps->groundEntityNum == ENTITYNUM_NONE && (pm->ps->pm_flags & PMF_FJDIDJUMP))
;2572:	{
;2573:		if (pm->cmd.upmove < 10 && !(pm->cmd.buttons & BUTTON_BOUNCEPOWER) && (!(pm->cmd.buttons & BUTTON_FORCEPOWER) || pm->ps->fd.forcePowerSelected != FP_LEVITATION))
;2574:		{
;2575:#if JK2_GAME
;2576:			G_MuteSound(pm->ps->fd.killSoundEntIndex[TRACK_CHANNEL_1 - 50], CHAN_VOICE);
;2577:#endif
;2578: 			pm->ps->fd.forceJumpCharge = 0;
;2579:		}
;2580:	}*/
;2581:
;2582:	if (!buttonPressed) { // if no longer pressing this
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1054
line 2583
;2583:		pm->ps->stats[STAT_CHARGEJUMPDATA] &= ~CHARGEJUMPFLAG_CHARGING;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2584
;2584:	}
LABELV $1054
line 2586
;2585:
;2586:	if ( /*!self->client->fjDidJump &&*/ buttonPressed && !BG_HasYsalamiri(pm->gametype, pm->ps) && BG_CanUseFPNow(pm->gametype, pm->ps, pm->cmd.serverTime, FP_LEVITATION))
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1056
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $1056
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $1056
line 2587
;2587:	{//just charging up
line 2588
;2588:		PM_ForceJumpCharge();
ADDRGP4 PM_ForceJumpCharge
CALLV
pop
line 2589
;2589:		usingForce = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2590
;2590:	}
ADDRGP4 $1057
JUMPV
LABELV $1056
line 2601
;2591://#ifndef METROID_JUMP
;2592:#if 0 // nvm this feels weird and needs a whole extra var to network
;2593:	else if ( /*!self->client->fjDidJump &&*/ (pm->cmd.upmove > 10) && (pm->ps->pm_flags & PMF_JUMP_HELD) && pm->ps->groundTime && (pm->cmd.serverTime - pm->ps->groundTime) > 150 && !BG_HasYsalamiri(pm->gametype, pm->ps) && BG_CanUseFPNow(pm->gametype, pm->ps, pm->cmd.serverTime, FP_LEVITATION)/*&& !pm->ps->fd.forceJumpZStart*/)
;2594:	{//just charging up
;2595:
;2596:		// meh doesnt feel great/hardly noticable/weird
;2597:		//PM_ForceJumpCharge();
;2598:		//usingForce = qtrue;
;2599:	}
;2600:#endif
;2601:	else if (pm->cmd.upmove < 10 && pm->ps->groundEntityNum == ENTITYNUM_NONE && pm->ps->fd.forceJumpCharge)
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $1058
ADDRLP4 36
ADDRLP4 32
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1058
ADDRLP4 36
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1058
line 2602
;2602:	{
line 2603
;2603:		pm->ps->pm_flags &= ~(PMF_JUMP_HELD);
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2604
;2604:	}
LABELV $1058
LABELV $1057
line 2608
;2605://#endif
;2606:
;2607:
;2608:	if (!buttonPressed && !(pm->ps->pm_flags & PMF_JUMP_HELD) && pm->ps->fd.forceJumpCharge)
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $1060
ADDRLP4 44
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $1060
ADDRLP4 44
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1060
line 2609
;2609:	{
line 2614
;2610:
;2611:
;2612:		//if (!(pm->cmd.buttons & BUTTON_FORCEPOWER) ||
;2613:		//	pm->ps->fd.forcePowerSelected != FP_LEVITATION)
;2614:		{
line 2615
;2615:			if (pm->ps->groundEntityNum == ENTITYNUM_NONE)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1062
line 2616
;2616:			{
line 2625
;2617:				/* TA: Actually nvm this always feels bad pretty much
;2618:				if (pm->cmd.upmove < 10) { //  TA keep the charge if we are still keeping jump pressed, perhaps for the following jump
;2619:					pm->ps->fd.forceJumpCharge = 0;
;2620:#if JK2_GAME
;2621:					G_MuteSound(pm->ps->fd.killSoundEntIndex[TRACK_CHANNEL_1 - 50], CHAN_VOICE);
;2622:#endif
;2623:				}*/
;2624:				//This only happens if the groundEntityNum == ENTITYNUM_NONE when the button is actually released
;2625:			}
ADDRGP4 $1063
JUMPV
LABELV $1062
line 2627
;2626:			else
;2627:			{//still on ground, so jump
line 2628
;2628:				if (pm->cmd.upmove > 10) { // allow us to do delayed jumps and cool things like that.
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
LEI4 $1064
line 2629
;2629:					PM_ChargeForceJump();
ADDRGP4 PM_ChargeForceJump
CALLV
pop
line 2630
;2630:				}
LABELV $1064
line 2631
;2631:			}
LABELV $1063
line 2636
;2632:			//if (WP_DoSpecificPower(self, &pm->cmd, FP_LEVITATION))
;2633:			//{
;2634:				//usingForce = qtrue;
;2635:			//}
;2636:		}
line 2637
;2637:	}
LABELV $1060
line 2638
;2638:}
LABELV $1046
endproc PM_CheckChargeJump 48 16
proc PM_WaterJumpMove 12 4
line 2646
;2639:/*
;2640:===================
;2641:PM_WaterJumpMove
;2642:
;2643:Flying out of the water
;2644:===================
;2645:*/
;2646:static void PM_WaterJumpMove( void ) {
line 2649
;2647:	// waterjump has no control, but falls
;2648:
;2649:	PM_StepSlideMove( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 2650
;2650:	PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 2652
;2651:
;2652:	pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 2653
;2653:	if (pm->ps->velocity[2] < 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1068
line 2655
;2654:		// cancel as soon as we are falling down again
;2655:		pm->ps->pm_flags &= ~PMF_ALL_TIMES;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -353
BANDI4
ASGNI4
line 2656
;2656:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 2657
;2657:	}
LABELV $1068
line 2658
;2658:}
LABELV $1066
endproc PM_WaterJumpMove 12 4
proc PM_WaterMove 96 20
line 2666
;2659:
;2660:/*
;2661:===================
;2662:PM_WaterMove
;2663:
;2664:===================
;2665:*/
;2666:static void PM_WaterMove( void ) {
line 2673
;2667:	int		i;
;2668:	vec3_t	wishvel;
;2669:	float	wishspeed;
;2670:	vec3_t	wishdir;
;2671:	float	scale;
;2672:	float	vel;
;2673:	float	realWaterAccelerate = pm_wateraccelerate;
ADDRLP4 40
ADDRGP4 pm_wateraccelerate
INDIRF4
ASGNF4
line 2674
;2674:	float	realSwimScale = pm_swimScale;
ADDRLP4 36
ADDRGP4 pm_swimScale
INDIRF4
ASGNF4
line 2677
;2675:
;2676:
;2677:	if ( PM_CheckWaterJump() ) {
ADDRLP4 48
ADDRGP4 PM_CheckWaterJump
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $1071
line 2678
;2678:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 2679
;2679:		return;
ADDRGP4 $1070
JUMPV
LABELV $1071
line 2695
;2680:	}
;2681:#if 0
;2682:	// jump = head for surface
;2683:	if ( pm->cmd.upmove >= 10 ) {
;2684:		if (pm->ps->velocity[2] > -300) {
;2685:			if ( pm->watertype == CONTENTS_WATER ) {
;2686:				pm->ps->velocity[2] = 100;
;2687:			} else if (pm->watertype == CONTENTS_SLIME) {
;2688:				pm->ps->velocity[2] = 80;
;2689:			} else {
;2690:				pm->ps->velocity[2] = 50;
;2691:			}
;2692:		}
;2693:	}
;2694:#endif
;2695:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 2697
;2696:
;2697:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 52
INDIRF4
ASGNF4
line 2701
;2698:	//
;2699:	// user intentions
;2700:	//
;2701:	if ( !scale ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $1073
line 2702
;2702:		wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 2703
;2703:		wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 2704
;2704:		wishvel[2] = -60;		// sink towards bottom
ADDRLP4 8+8
CNSTF4 3262119936
ASGNF4
line 2705
;2705:	} else {
ADDRGP4 $1074
JUMPV
LABELV $1073
line 2706
;2706:		for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1077
line 2707
;2707:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + scale * pml.right[i]*pm->cmd.rightmove;
ADDRLP4 56
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 56
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 64
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 64
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
LABELV $1078
line 2706
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1077
line 2709
;2708:
;2709:		wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 2710
;2710:	}
LABELV $1074
line 2712
;2711:
;2712:	VectorCopy (wishvel, wishdir);
ADDRLP4 20
ADDRLP4 8
INDIRB
ASGNB 12
line 2713
;2713:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 20
ARGP4
ADDRLP4 56
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 56
INDIRF4
ASGNF4
line 2715
;2714:
;2715:	if (MovementIsQuake3Based(pm->modParms.physics)) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $1083
line 2717
;2716:		// just feels better
;2717:		realWaterAccelerate = 10.0f;
ADDRLP4 40
CNSTF4 1092616192
ASGNF4
line 2718
;2718:		realSwimScale = 0.75f; 
ADDRLP4 36
CNSTF4 1061158912
ASGNF4
line 2719
;2719:	}
LABELV $1083
line 2721
;2720:
;2721:	if ( wishspeed > pm->ps->speed * realSwimScale) {
ADDRLP4 32
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
MULF4
LEF4 $1085
line 2722
;2722:		wishspeed = pm->ps->speed * realSwimScale;
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 2723
;2723:	}
LABELV $1085
line 2725
;2724:
;2725:	if (pm->modParms.physics == MV_SICKO) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1087
line 2726
;2726:		PM_SickoAccelerate(wishdir, wishspeed, realWaterAccelerate, 200.0f);
ADDRLP4 20
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1128792064
ARGF4
ADDRGP4 PM_SickoAccelerate
CALLV
pop
line 2727
;2727:	}
ADDRGP4 $1088
JUMPV
LABELV $1087
line 2728
;2728:	else if (pm->modParms.physics == MV_QUAJK) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1089
line 2731
;2729:		float		accel;
;2730:
;2731:		if (DotProduct(pm->ps->velocity, wishdir) < 0)
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20+4
INDIRF4
MULF4
ADDF4
ADDRLP4 68
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $1091
line 2732
;2732:			accel = pm_cpm_airstopaccelerate;
ADDRLP4 64
ADDRGP4 pm_cpm_airstopaccelerate
INDIRF4
ASGNF4
ADDRGP4 $1092
JUMPV
LABELV $1091
line 2734
;2733:		else
;2734:			accel = realWaterAccelerate;
ADDRLP4 64
ADDRLP4 40
INDIRF4
ASGNF4
LABELV $1092
line 2735
;2735:		PM_QuaJKAccelerate(wishdir, wishspeed, accel, pm_cpm_airstrafeaccelerate, 30.0f);
ADDRLP4 20
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 64
INDIRF4
ARGF4
ADDRGP4 pm_cpm_airstrafeaccelerate
INDIRF4
ARGF4
CNSTF4 1106247680
ARGF4
ADDRGP4 PM_QuaJKAccelerate
CALLV
pop
line 2736
;2736:	}
ADDRGP4 $1090
JUMPV
LABELV $1089
line 2737
;2737:	else if (pm->modParms.physics == MV_DREAM) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 11
NEI4 $1095
line 2738
;2738:		PM_DreamAccelerate(wishdir, wishspeed, realWaterAccelerate, 100, 200.0f);
ADDRLP4 20
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1120403456
ARGF4
CNSTF4 1128792064
ARGF4
ADDRGP4 PM_DreamAccelerate
CALLV
pop
line 2739
;2739:	}
ADDRGP4 $1096
JUMPV
LABELV $1095
line 2740
;2740:	else {
line 2741
;2741:		PM_Accelerate(wishdir, wishspeed, realWaterAccelerate);
ADDRLP4 20
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 2742
;2742:	}
LABELV $1096
LABELV $1090
LABELV $1088
line 2743
;2743:	PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 2746
;2744:
;2745:	// make sure we can go up slopes easily under water
;2746:	if ( pml.groundPlane && DotProduct( pm->ps->velocity, pml.groundTrace.plane.normal ) < 0 ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $1097
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRLP4 64
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 64
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $1097
line 2747
;2747:		vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 68
INDIRF4
ASGNF4
line 2749
;2748:		// slide along the ground plane
;2749:		PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 72
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 MovementOverbounceFactor
CALLF4
ASGNF4
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 76
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 2752
;2750:			pm->ps->velocity, MovementOverbounceFactor(pm->modParms.physics, pm->ps, &pm->cmd));
;2751:
;2752:		VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2753
;2753:		VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
line 2754
;2754:		PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 2755
;2755:	}
LABELV $1097
line 2757
;2756:
;2757:	PM_SlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 2758
;2758:	PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 2759
;2759:}
LABELV $1070
endproc PM_WaterMove 96 20
proc PM_FlyMove 56 12
line 2768
;2760:
;2761:/*
;2762:===================
;2763:PM_FlyMove
;2764:
;2765:Only with the flight powerup
;2766:===================
;2767:*/
;2768:static void PM_FlyMove( void ) {
line 2776
;2769:	int		i;
;2770:	vec3_t	wishvel;
;2771:	float	wishspeed;
;2772:	vec3_t	wishdir;
;2773:	float	scale;
;2774:
;2775:	// normal slowdown
;2776:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 2778
;2777:
;2778:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
ASGNF4
line 2780
;2779:	
;2780:	if ( pm->ps->pm_type == PM_SPECTATOR && pm->cmd.buttons & BUTTON_ALT_ATTACK) { // MVSDK: 1.03+ feature, but let's enable it on 1.02 as well.
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1111
ADDRLP4 40
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1111
line 2782
;2781:		//turbo boost
;2782:		scale *= 10;
ADDRLP4 4
CNSTF4 1092616192
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 2783
;2783:	}
LABELV $1111
line 2784
;2784:	if (pm->cmd.buttons & BUTTON_BOUNCEPOWER) {	//turbo boost for bounce mode (comfier to use mouse2 with it)
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1113
line 2785
;2785:		scale *= 10;
ADDRLP4 4
CNSTF4 1092616192
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 2786
;2786:	}
LABELV $1113
line 2791
;2787:
;2788:	//
;2789:	// user intentions
;2790:	//
;2791:	if ( !scale ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $1115
line 2792
;2792:		wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 2793
;2793:		wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 2794
;2794:		wishvel[2] = pm->ps->speed * (pm->cmd.upmove/127.0f); // MVSDK: 1.02 originally put this to 0, but let's use 1.03+ behaviour for this as well.
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8+8
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 44
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CVIF4 4
CNSTF4 1123942400
DIVF4
MULF4
ASGNF4
line 2795
;2795:	} else {
ADDRGP4 $1116
JUMPV
LABELV $1115
line 2796
;2796:		for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1119
line 2797
;2797:			wishvel[i] = scale * pml.forward[i]*pm->cmd.forwardmove + scale * pml.right[i]*pm->cmd.rightmove;
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 52
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 44
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 44
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 2798
;2798:		}
LABELV $1120
line 2796
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1119
line 2800
;2799:
;2800:		wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 2801
;2801:	}
LABELV $1116
line 2803
;2802:
;2803:	VectorCopy (wishvel, wishdir);
ADDRLP4 20
ADDRLP4 8
INDIRB
ASGNB 12
line 2804
;2804:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 20
ARGP4
ADDRLP4 44
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 44
INDIRF4
ASGNF4
line 2806
;2805:
;2806:	PM_Accelerate (wishdir, wishspeed, pm_flyaccelerate);
ADDRLP4 20
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
ADDRGP4 pm_flyaccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 2807
;2807:	PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 2809
;2808:
;2809:	PM_StepSlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 2810
;2810:	PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 2811
;2811:}
LABELV $1110
endproc PM_FlyMove 56 12
proc PM_AirMove 116 20
line 2820
;2812:
;2813:
;2814:/*
;2815:===================
;2816:PM_AirMove
;2817:
;2818:===================
;2819:*/
;2820:static void PM_AirMove( void ) {
line 2828
;2821:	int			i;
;2822:	vec3_t		wishvel;
;2823:	float		fmove, smove;
;2824:	vec3_t		wishdir;
;2825:	float		wishspeed;
;2826:	float		scale;
;2827:	usercmd_t	cmd;
;2828:	float		overbounce = MovementOverbounceFactor(pm->modParms.physics, pm->ps, &pm->cmd);
ADDRLP4 76
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
INDIRP4
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 MovementOverbounceFactor
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 80
INDIRF4
ASGNF4
line 2830
;2829:
;2830:	if (pm->ps->pm_type != PM_SPECTATOR)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1126
line 2831
;2831:	{
line 2832
;2832:		if (pm->modParms.physics != MV_CHARGEJUMP) { // mirrors the old #if METROID_JUMP clause
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 12
EQI4 $1128
line 2834
;2833:
;2834:			PM_CheckJump();
ADDRGP4 PM_CheckJump
CALLI4
pop
line 2835
;2835:		}
ADDRGP4 $1129
JUMPV
LABELV $1128
line 2836
;2836:		else {
line 2837
;2837:			if (pm->ps->fd.forceJumpZStart &&
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1130
ADDRLP4 84
INDIRP4
CNSTI4 1244
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1130
line 2839
;2838:				pm->ps->forceJumpFlip)
;2839:			{
line 2840
;2840:				PM_CheckJump();
ADDRGP4 PM_CheckJump
CALLI4
pop
line 2841
;2841:			}
LABELV $1130
line 2842
;2842:		}
LABELV $1129
line 2843
;2843:	}
LABELV $1126
line 2844
;2844:	PM_Friction();
ADDRGP4 PM_Friction
CALLV
pop
line 2846
;2845:
;2846:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 2847
;2847:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 2849
;2848:
;2849:	cmd = pm->cmd;
ADDRLP4 40
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 28
line 2850
;2850:	scale = PM_CmdScale( &cmd );
ADDRLP4 40
ARGP4
ADDRLP4 84
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 84
INDIRF4
ASGNF4
line 2853
;2851:
;2852:	// set the movementDir so clients can rotate the legs for strafing
;2853:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 2856
;2854:
;2855:	// project moves down to flat plane
;2856:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 2857
;2857:	pml.right[2] = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 2858
;2858:	VectorNormalize (pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2859
;2859:	VectorNormalize (pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2861
;2860:
;2861:	if ( gPMDoSlowFall )
ADDRGP4 gPMDoSlowFall
INDIRI4
CNSTI4 0
EQI4 $1136
line 2862
;2862:	{//no air-control
line 2863
;2863:		VectorClear( wishvel );
ADDRLP4 88
CNSTF4 0
ASGNF4
ADDRLP4 4+8
ADDRLP4 88
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 88
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 88
INDIRF4
ASGNF4
line 2864
;2864:	}
ADDRGP4 $1137
JUMPV
LABELV $1136
line 2866
;2865:	else
;2866:	{
line 2867
;2867:		for ( i = 0 ; i < 2 ; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1140
line 2868
;2868:		{
line 2869
;2869:			wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 88
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 88
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 88
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 2870
;2870:		}
LABELV $1141
line 2867
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $1140
line 2871
;2871:		wishvel[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 2872
;2872:	}
LABELV $1137
line 2874
;2873:
;2874:	VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 4
INDIRB
ASGNB 12
line 2875
;2875:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 88
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 88
INDIRF4
ASGNF4
line 2876
;2876:	if (pm->modParms.physics != MV_JK2SP) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1146
line 2877
;2877:		wishspeed *= scale;
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 68
INDIRF4
MULF4
ASGNF4
line 2878
;2878:	}
LABELV $1146
line 2881
;2879:
;2880:	// not on ground, so little effect on velocity
;2881:	if (pm->modParms.physics == MV_SICKO) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1148
line 2882
;2882:		PM_SickoAccelerate(wishdir, wishspeed, pm_airaccelerate,200.0f);
ADDRLP4 24
ARGP4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 pm_airaccelerate
INDIRF4
ARGF4
CNSTF4 1128792064
ARGF4
ADDRGP4 PM_SickoAccelerate
CALLV
pop
line 2883
;2883:	}
ADDRGP4 $1149
JUMPV
LABELV $1148
line 2884
;2884:	else if (pm->modParms.physics == MV_QUAJK) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1150
line 2887
;2885:		float		accel;
;2886:
;2887:		if (DotProduct(pm->ps->velocity, wishdir) < 0)
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 96
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 96
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $1152
line 2888
;2888:			accel = pm_cpm_airstopaccelerate;
ADDRLP4 92
ADDRGP4 pm_cpm_airstopaccelerate
INDIRF4
ASGNF4
ADDRGP4 $1153
JUMPV
LABELV $1152
line 2890
;2889:		else
;2890:			accel = pm_airaccelerate;
ADDRLP4 92
ADDRGP4 pm_airaccelerate
INDIRF4
ASGNF4
LABELV $1153
line 2891
;2891:		PM_QuaJKAccelerate(wishdir, wishspeed, accel,pm_cpm_airstrafeaccelerate,30.0f);
ADDRLP4 24
ARGP4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 92
INDIRF4
ARGF4
ADDRGP4 pm_cpm_airstrafeaccelerate
INDIRF4
ARGF4
CNSTF4 1106247680
ARGF4
ADDRGP4 PM_QuaJKAccelerate
CALLV
pop
line 2892
;2892:	}
ADDRGP4 $1151
JUMPV
LABELV $1150
line 2893
;2893:	else if (pm->modParms.physics == MV_DREAM) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 11
NEI4 $1156
line 2894
;2894:		PM_DreamAccelerate(wishdir, wishspeed, pm_airaccelerate,100,200.0f);
ADDRLP4 24
ARGP4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 pm_airaccelerate
INDIRF4
ARGF4
CNSTF4 1120403456
ARGF4
CNSTF4 1128792064
ARGF4
ADDRGP4 PM_DreamAccelerate
CALLV
pop
line 2895
;2895:	}
ADDRGP4 $1157
JUMPV
LABELV $1156
line 2896
;2896:	else {
line 2897
;2897:		PM_Accelerate(wishdir, wishspeed, pm->modParms.physics == MV_JK2SP ? pm_sp_airaccelerate : pm_airaccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1159
ADDRLP4 92
ADDRGP4 pm_sp_airaccelerate
INDIRF4
ASGNF4
ADDRGP4 $1160
JUMPV
LABELV $1159
ADDRLP4 92
ADDRGP4 pm_airaccelerate
INDIRF4
ASGNF4
LABELV $1160
ADDRLP4 92
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 2898
;2898:	}
LABELV $1157
LABELV $1151
LABELV $1149
line 2899
;2899:	PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 2904
;2900:
;2901:	// we may have a ground plane that is very steep, even
;2902:	// though we don't have a groundentity
;2903:	// slide along the steep plane
;2904:	if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $1161
line 2905
;2905:		if (pm->modParms.runFlags & RFL_CLIMBTECH) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1164
line 2906
;2906:			if (!(pm->ps->pm_flags & PMF_STUCK_TO_WALL))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
NEI4 $1165
line 2907
;2907:			{//don't slide when stuck to a wall
line 2908
;2908:				if (PM_GroundSlideOkay(pml.groundTrace.plane.normal[2]))
ADDRGP4 pml+52+24+8
INDIRF4
ARGF4
ADDRLP4 92
ADDRGP4 PM_GroundSlideOkay
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $1165
line 2909
;2909:				{
line 2910
;2910:					PM_ClipVelocity(pm->ps->velocity, pml.groundTrace.plane.normal,
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 72
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 2912
;2911:						pm->ps->velocity, overbounce);
;2912:					PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 2913
;2913:				}
line 2914
;2914:			}
line 2915
;2915:		}
ADDRGP4 $1165
JUMPV
LABELV $1164
line 2916
;2916:		else {
line 2917
;2917:			PM_ClipVelocity(pm->ps->velocity, pml.groundTrace.plane.normal,
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 72
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 2919
;2918:				pm->ps->velocity, overbounce);
;2919:			PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 2920
;2920:		}
LABELV $1165
line 2921
;2921:	}
LABELV $1161
line 2923
;2922:
;2923:	if (pm->modParms.physics == MV_JK2SP) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1177
line 2924
;2924:		if (!pm->ps->clientNum
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $1179
ADDRLP4 92
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
LEI4 $1179
ADDRLP4 100
CNSTF4 0
ASGNF4
ADDRLP4 92
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
ADDRLP4 100
INDIRF4
EQF4 $1179
ADDRLP4 92
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 100
INDIRF4
LEF4 $1179
line 2927
;2925:			&& pm->ps->fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_0
;2926:			&& pm->ps->fd.forceJumpZStart
;2927:			&& pm->ps->velocity[2] > 0) {//I am force jumping and I'm not holding the button anymore
line 2928
;2928:			float curHeight = pm->ps->origin[2] - pm->ps->fd.forceJumpZStart + (pm->ps->velocity[2] * pml.frametime);
ADDRLP4 112
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 104
ADDRLP4 112
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
SUBF4
ADDRLP4 112
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 2929
;2929:			float maxJumpHeight = forceJumpHeight[pm->ps->fd.forcePowerLevel[FP_LEVITATION]];
ADDRLP4 108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpHeight
ADDP4
INDIRF4
ASGNF4
line 2930
;2930:			if (curHeight >= maxJumpHeight) {//reached top, cut velocity
ADDRLP4 104
INDIRF4
ADDRLP4 108
INDIRF4
LTF4 $1182
line 2931
;2931:				pm->ps->velocity[2] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 2932
;2932:			}
LABELV $1182
line 2933
;2933:		}
LABELV $1179
line 2934
;2934:	}
LABELV $1177
line 2936
;2935:
;2936:	PM_StepSlideMove ( qtrue );
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 2937
;2937:	PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 2939
;2938:
;2939:	if (pml.groundBounces) {
ADDRGP4 pml+1184
INDIRI4
CNSTI4 0
EQI4 $1184
line 2940
;2940:		PM_CheckBounceJump(flatNormal, pm->ps->velocity);
ADDRGP4 flatNormal
ARGP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 PM_CheckBounceJump
CALLV
pop
line 2941
;2941:	}
LABELV $1184
line 2942
;2942:}
LABELV $1125
endproc PM_AirMove 116 20
proc PM_WalkMove 180 16
line 2950
;2943:
;2944:/*
;2945:===================
;2946:PM_WalkMove
;2947:
;2948:===================
;2949:*/
;2950:static void PM_WalkMove( void ) {
line 2961
;2951:	int			i;
;2952:	vec3_t		wishvel;
;2953:	float		fmove, smove;
;2954:	vec3_t		wishdir;
;2955:	float		wishspeed;
;2956:	float		scale;
;2957:	usercmd_t	cmd;
;2958:	float		accelerate;
;2959:	float		vel;
;2960:	float		totalVel;
;2961:	float		overbounce = MovementOverbounceFactor(pm->modParms.physics, pm->ps, &pm->cmd);
ADDRLP4 88
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 MovementOverbounceFactor
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 92
INDIRF4
ASGNF4
line 2963
;2962:
;2963:	if (pm->ps->velocity[0] < 0)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1188
line 2964
;2964:	{
line 2965
;2965:		totalVel = -pm->ps->velocity[0];
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
NEGF4
ASGNF4
line 2966
;2966:	}
ADDRGP4 $1189
JUMPV
LABELV $1188
line 2968
;2967:	else
;2968:	{
line 2969
;2969:		totalVel = pm->ps->velocity[0];
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 2970
;2970:	}
LABELV $1189
line 2972
;2971:
;2972:	if (pm->ps->velocity[1] < 0)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1190
line 2973
;2973:	{
line 2974
;2974:		totalVel += -pm->ps->velocity[1];
ADDRLP4 48
ADDRLP4 48
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 2975
;2975:	}
ADDRGP4 $1191
JUMPV
LABELV $1190
line 2977
;2976:	else
;2977:	{
line 2978
;2978:		totalVel += pm->ps->velocity[1];
ADDRLP4 48
ADDRLP4 48
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2979
;2979:	}
LABELV $1191
line 2981
;2980:
;2981:	if (totalVel < 200)
ADDRLP4 48
INDIRF4
CNSTF4 1128792064
GEF4 $1192
line 2982
;2982:	{
line 2983
;2983:		pm->ps->fd.forceSpeedSmash = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1136
ADDP4
CNSTF4 1065353216
ASGNF4
line 2984
;2984:	}
LABELV $1192
line 2986
;2985:
;2986:	if ( pm->waterlevel > 2 && DotProduct( pml.forward, pml.groundTrace.plane.normal ) > 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
LEI4 $1194
ADDRGP4 pml
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRGP4 pml+4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRGP4 pml+8
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
LEF4 $1194
line 2988
;2987:		// begin swimming
;2988:		PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 2989
;2989:		return;
ADDRGP4 $1187
JUMPV
LABELV $1194
line 2993
;2990:	}
;2991:
;2992:
;2993:	if (pm->ps->pm_type != PM_SPECTATOR)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1206
line 2994
;2994:	{
line 2995
;2995:		if ( PM_CheckJump () ) {
ADDRLP4 96
ADDRGP4 PM_CheckJump
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $1208
line 2997
;2996:			// jumped away
;2997:			if ( pm->waterlevel > 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
LEI4 $1210
line 2998
;2998:				PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 2999
;2999:			} else {
ADDRGP4 $1187
JUMPV
LABELV $1210
line 3000
;3000:				PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 3001
;3001:			}
line 3002
;3002:			return;
ADDRGP4 $1187
JUMPV
LABELV $1208
line 3004
;3003:		}
;3004:	}
LABELV $1206
line 3006
;3005:
;3006:	PM_Friction ();
ADDRGP4 PM_Friction
CALLV
pop
line 3008
;3007:
;3008:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 3009
;3009:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 3011
;3010:
;3011:	cmd = pm->cmd;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 28
line 3012
;3012:	scale = PM_CmdScale( &cmd );
ADDRLP4 60
ARGP4
ADDRLP4 96
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 96
INDIRF4
ASGNF4
line 3015
;3013:
;3014:	// set the movementDir so clients can rotate the legs for strafing
;3015:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 3018
;3016:
;3017:	// project moves down to flat plane
;3018:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 3019
;3019:	pml.right[2] = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 3022
;3020:
;3021:	// project the forward and right directions onto the ground plane
;3022:	PM_ClipVelocity (pml.forward, pml.groundTrace.plane.normal, pml.forward, overbounce);
ADDRLP4 100
ADDRGP4 pml
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 44
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 3023
;3023:	PM_ClipVelocity (pml.right, pml.groundTrace.plane.normal, pml.right, overbounce);
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRGP4 pml+12
ARGP4
ADDRLP4 44
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 3025
;3024:	//
;3025:	VectorNormalize (pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3026
;3026:	VectorNormalize (pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3028
;3027:
;3028:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1222
line 3029
;3029:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 104
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 104
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 104
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 104
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 3030
;3030:	}
LABELV $1223
line 3028
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1222
line 3033
;3031:	// when going up or down slopes the wish velocity should Not be zero
;3032:
;3033:	VectorCopy (wishvel, wishdir);
ADDRLP4 24
ADDRLP4 4
INDIRB
ASGNB 12
line 3034
;3034:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 104
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 104
INDIRF4
ASGNF4
line 3035
;3035:	wishspeed *= scale;
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
line 3038
;3036:
;3037:	// clamp the speed lower if ducking
;3038:	if ( pm->ps->pm_flags & PMF_DUCKED && (pm->modParms.physics != MV_JK2SP || !PM_InKnockDown(pm->ps)) ) {
ADDRLP4 108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 112
ADDRLP4 108
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1227
ADDRLP4 108
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1229
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 PM_InKnockDown
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $1227
LABELV $1229
line 3039
;3039:		if ( wishspeed > pm->ps->speed * pm_duckScale ) {
ADDRLP4 36
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
LEF4 $1228
line 3040
;3040:			wishspeed = pm->ps->speed * pm_duckScale;
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
ASGNF4
line 3041
;3041:		}
line 3042
;3042:	}
ADDRGP4 $1228
JUMPV
LABELV $1227
line 3043
;3043:	else if ( (pm->ps->pm_flags & PMF_ROLLING) && !BG_InRoll(pm->ps, pm->ps->legsAnim) &&
ADDRLP4 120
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1232
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
NEI4 $1232
ADDRLP4 128
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 PM_InRollComplete
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $1232
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1232
line 3045
;3044:		!PM_InRollComplete(pm->ps, pm->ps->legsAnim) && pm->modParms.physics != MV_JK2SP)
;3045:	{
line 3046
;3046:		if ( wishspeed > pm->ps->speed * pm_duckScale ) {
ADDRLP4 36
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
LEF4 $1234
line 3047
;3047:			wishspeed = pm->ps->speed * pm_duckScale;
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
ASGNF4
line 3048
;3048:		}
LABELV $1234
line 3049
;3049:	}
LABELV $1232
LABELV $1228
line 3052
;3050:
;3051:	// clamp the speed lower if wading or walking on the bottom
;3052:	if ( pm->waterlevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1236
line 3055
;3053:		float	waterScale;
;3054:
;3055:		waterScale = pm->waterlevel / 3.0;
ADDRLP4 136
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1077936128
DIVF4
ASGNF4
line 3056
;3056:		waterScale = 1.0 - ( 1.0 - pm_swimScale ) * waterScale;
ADDRLP4 140
CNSTF4 1065353216
ASGNF4
ADDRLP4 136
ADDRLP4 140
INDIRF4
ADDRLP4 140
INDIRF4
ADDRGP4 pm_swimScale
INDIRF4
SUBF4
ADDRLP4 136
INDIRF4
MULF4
SUBF4
ASGNF4
line 3057
;3057:		if ( wishspeed > pm->ps->speed * waterScale ) {
ADDRLP4 36
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 136
INDIRF4
MULF4
LEF4 $1238
line 3058
;3058:			wishspeed = pm->ps->speed * waterScale;
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 136
INDIRF4
MULF4
ASGNF4
line 3059
;3059:		}
LABELV $1238
line 3060
;3060:	}
LABELV $1236
line 3064
;3061:
;3062:	// when a player gets hit, they temporarily lose
;3063:	// full control, which allows them to be moved a bit
;3064:	if ( ( pml.groundTrace.surfaceFlags & SURF_SLICK ) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK ) {
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 136
INDIRI4
NEI4 $1244
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 136
INDIRI4
EQI4 $1240
LABELV $1244
line 3065
;3065:		accelerate = pm_airaccelerate;
ADDRLP4 52
ADDRGP4 pm_airaccelerate
INDIRF4
ASGNF4
line 3066
;3066:		if (pm->modParms.physics == MV_JK2SP)
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1245
line 3067
;3067:			accelerate = pm_sp_airaccelerate; 
ADDRLP4 52
ADDRGP4 pm_sp_airaccelerate
INDIRF4
ASGNF4
ADDRGP4 $1241
JUMPV
LABELV $1245
line 3068
;3068:		else if (MovementIsQuake3Based(pm->modParms.physics))
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1241
line 3069
;3069:			accelerate = pm_cpm_accelerate;
ADDRLP4 52
ADDRGP4 pm_cpm_accelerate
INDIRF4
ASGNF4
line 3070
;3070:	} else {
ADDRGP4 $1241
JUMPV
LABELV $1240
line 3071
;3071:		accelerate = pm_accelerate;
ADDRLP4 52
ADDRGP4 pm_accelerate
INDIRF4
ASGNF4
line 3072
;3072:		if (pm->modParms.physics == MV_JK2SP)
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1249
line 3073
;3073:			accelerate = pm_sp_accelerate;
ADDRLP4 52
ADDRGP4 pm_sp_accelerate
INDIRF4
ASGNF4
ADDRGP4 $1250
JUMPV
LABELV $1249
line 3074
;3074:		else if (MovementIsQuake3Based(pm->modParms.physics))
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1251
line 3075
;3075:			accelerate = pm_cpm_accelerate;
ADDRLP4 52
ADDRGP4 pm_cpm_accelerate
INDIRF4
ASGNF4
LABELV $1251
LABELV $1250
line 3076
;3076:	}
LABELV $1241
line 3078
;3077:
;3078:	if (pm->modParms.physics == MV_JK2SP && (DotProduct(pm->ps->velocity, wishdir)) < 0.0f)
ADDRLP4 140
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1253
ADDRLP4 144
ADDRLP4 140
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 144
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 144
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $1253
line 3079
;3079:	{//Encourage deceleration away from the current velocity
line 3080
;3080:		wishspeed *= pm_sp_airDecelRate;
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRGP4 pm_sp_airDecelRate
INDIRF4
MULF4
ASGNF4
line 3081
;3081:	}
LABELV $1253
line 3083
;3082:
;3083:	PM_Accelerate (wishdir, wishspeed, accelerate);
ADDRLP4 24
ARGP4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 52
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 3084
;3084:	PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 3089
;3085:
;3086:	//Com_Printf("velocity = %1.1f %1.1f %1.1f\n", pm->ps->velocity[0], pm->ps->velocity[1], pm->ps->velocity[2]);
;3087:	//Com_Printf("velocity1 = %1.1f\n", VectorLength(pm->ps->velocity));
;3088:
;3089:	if ( ( pml.groundTrace.surfaceFlags & SURF_SLICK ) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK )
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 148
INDIRI4
NEI4 $1261
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 148
INDIRI4
EQI4 $1257
LABELV $1261
line 3090
;3090:	{
line 3091
;3091:		if (pm->modParms.physics == MV_JK2SP) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1262
line 3092
;3092:			if (pm->ps->gravity >= 0 && pm->ps->groundEntityNum != ENTITYNUM_NONE && !VectorLengthSquared(pm->ps->velocity) && pml.groundTrace.plane.normal[2] == 1.0)
ADDRLP4 152
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1264
ADDRLP4 152
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $1264
ADDRLP4 152
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 156
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 156
INDIRF4
CNSTF4 0
NEF4 $1264
ADDRGP4 pml+52+24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1264
line 3093
;3093:			{//on ground and not moving and on level ground, no reason to do stupid fucking gravity with the clipvelocity!!!!
line 3094
;3094:			}
ADDRGP4 $1263
JUMPV
LABELV $1264
line 3096
;3095:			else
;3096:			{
line 3098
;3097:				//if (!(pm->ps->eFlags & EF_FORCE_GRIPPED))
;3098:				if (!(pm->ps->fd.forceGripBeingGripped)) // is this correct? not that it matters in defrag anyway prolly
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1116
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1263
line 3099
;3099:				{
line 3100
;3100:					pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 160
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 164
ADDRLP4 160
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
ADDRLP4 160
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 3101
;3101:				}
line 3102
;3102:			}
line 3103
;3103:		}
ADDRGP4 $1263
JUMPV
LABELV $1262
line 3104
;3104:		else {
line 3105
;3105:			pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 152
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 156
ADDRLP4 152
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 3106
;3106:		}
LABELV $1263
line 3107
;3107:	}
LABELV $1257
line 3109
;3108:
;3109:	vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 152
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 152
INDIRF4
ASGNF4
line 3112
;3110:
;3111:	// slide along the ground plane
;3112:	PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 156
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 44
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 3114
;3113:		pm->ps->velocity, overbounce);
;3114:	PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 3115
;3115:	PM_CheckBounceJump(pml.groundTrace.plane.normal, pm->ps->velocity);// allow jump out of a bounce
ADDRGP4 pml+52+24
ARGP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 PM_CheckBounceJump
CALLV
pop
line 3118
;3116:
;3117:	// don't decrease velocity when going up or down a slope
;3118:	VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3119
;3119:	VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 160
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
ADDRLP4 164
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
ADDRLP4 168
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 3122
;3120:
;3121:	// don't do anything if standing still
;3122:	if (!pm->ps->velocity[0] && !pm->ps->velocity[1]) {
ADDRLP4 172
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 176
CNSTF4 0
ASGNF4
ADDRLP4 172
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 176
INDIRF4
NEF4 $1277
ADDRLP4 172
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 176
INDIRF4
NEF4 $1277
line 3123
;3123:		pm->ps->fd.forceSpeedSmash = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1136
ADDP4
CNSTF4 1065353216
ASGNF4
line 3124
;3124:		return;
ADDRGP4 $1187
JUMPV
LABELV $1277
line 3127
;3125:	}
;3126:
;3127:	PM_StepSlideMove( qfalse );
CNSTI4 0
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 3128
;3128:	PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 3130
;3129:
;3130:	if (pml.groundBounces) {
ADDRGP4 pml+1184
INDIRI4
CNSTI4 0
EQI4 $1279
line 3131
;3131:		PM_CheckBounceJump(flatNormal, pm->ps->velocity);
ADDRGP4 flatNormal
ARGP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 PM_CheckBounceJump
CALLV
pop
line 3132
;3132:	}
LABELV $1279
line 3135
;3133:
;3134:	//Com_Printf("velocity2 = %1.1f\n", VectorLength(pm->ps->velocity));
;3135:}
LABELV $1187
endproc PM_WalkMove 180 16
proc PM_DeadMove 20 4
line 3143
;3136:
;3137:
;3138:/*
;3139:==============
;3140:PM_DeadMove
;3141:==============
;3142:*/
;3143:static void PM_DeadMove( void ) {
line 3146
;3144:	float	forward;
;3145:
;3146:	if ( !pml.walking ) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
NEI4 $1283
line 3147
;3147:		return;
ADDRGP4 $1282
JUMPV
LABELV $1283
line 3152
;3148:	}
;3149:
;3150:	// extra friction
;3151:
;3152:	forward = VectorLength (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 3153
;3153:	forward -= 20;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 3154
;3154:	if ( forward <= 0 ) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GTF4 $1286
line 3155
;3155:		VectorClear (pm->ps->velocity);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 3156
;3156:	} else {
ADDRGP4 $1287
JUMPV
LABELV $1286
line 3157
;3157:		VectorNormalize (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3158
;3158:		VectorScale (pm->ps->velocity, forward, pm->ps->velocity);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3159
;3159:	}
LABELV $1287
line 3160
;3160:}
LABELV $1282
endproc PM_DeadMove 20 4
proc PM_NoclipMove 104 12
line 3168
;3161:
;3162:
;3163:/*
;3164:===============
;3165:PM_NoclipMove
;3166:===============
;3167:*/
;3168:static void PM_NoclipMove( void ) {
line 3177
;3169:	float	speed, drop, friction, control, newspeed;
;3170:	int			i;
;3171:	vec3_t		wishvel;
;3172:	float		fmove, smove;
;3173:	vec3_t		wishdir;
;3174:	float		wishspeed;
;3175:	float		scale;
;3176:
;3177:	pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 36
ASGNI4
line 3181
;3178:
;3179:	// friction
;3180:
;3181:	speed = VectorLength (pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 64
INDIRF4
ASGNF4
line 3182
;3182:	if (speed < 1)
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
GEF4 $1289
line 3183
;3183:	{
line 3184
;3184:		VectorCopy (vec3_origin, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 3185
;3185:	}
ADDRGP4 $1290
JUMPV
LABELV $1289
line 3187
;3186:	else
;3187:	{
line 3188
;3188:		drop = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 3190
;3189:
;3190:		friction = pm_friction*1.5;	// extra friction
ADDRLP4 56
CNSTF4 1069547520
ADDRGP4 pm_friction
INDIRF4
MULF4
ASGNF4
line 3191
;3191:		control = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 24
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $1292
ADDRLP4 68
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $1293
JUMPV
LABELV $1292
ADDRLP4 68
ADDRLP4 24
INDIRF4
ASGNF4
LABELV $1293
ADDRLP4 60
ADDRLP4 68
INDIRF4
ASGNF4
line 3192
;3192:		drop += control*friction*pml.frametime;
ADDRLP4 52
ADDRLP4 52
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 3195
;3193:
;3194:		// scale the velocity
;3195:		newspeed = speed - drop;
ADDRLP4 32
ADDRLP4 24
INDIRF4
ADDRLP4 52
INDIRF4
SUBF4
ASGNF4
line 3196
;3196:		if (newspeed < 0)
ADDRLP4 32
INDIRF4
CNSTF4 0
GEF4 $1295
line 3197
;3197:			newspeed = 0;
ADDRLP4 32
CNSTF4 0
ASGNF4
LABELV $1295
line 3198
;3198:		newspeed /= speed;
ADDRLP4 32
ADDRLP4 32
INDIRF4
ADDRLP4 24
INDIRF4
DIVF4
ASGNF4
line 3200
;3199:
;3200:		VectorScale (pm->ps->velocity, newspeed, pm->ps->velocity);
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ASGNF4
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ASGNF4
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ASGNF4
line 3201
;3201:	}
LABELV $1290
line 3204
;3202:
;3203:	// accelerate
;3204:	scale = PM_CmdScale( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 68
INDIRF4
ASGNF4
line 3205
;3205:	if (pm->cmd.buttons & BUTTON_ATTACK) {	//turbo boost
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1297
line 3206
;3206:		scale *= 10;
ADDRLP4 28
CNSTF4 1092616192
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 3207
;3207:	}
LABELV $1297
line 3208
;3208:	if (pm->cmd.buttons & BUTTON_ALT_ATTACK) {	//turbo boost
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1299
line 3209
;3209:		scale *= 10;
ADDRLP4 28
CNSTF4 1092616192
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 3210
;3210:	}
LABELV $1299
line 3211
;3211:	if (pm->cmd.buttons & BUTTON_BOUNCEPOWER) {	//turbo boost for bounce mode (comfier to use mouse2 with it)
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1301
line 3212
;3212:		scale *= 10;
ADDRLP4 28
CNSTF4 1092616192
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 3213
;3213:	}
LABELV $1301
line 3215
;3214:
;3215:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 3216
;3216:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 3218
;3217:	
;3218:	for (i=0 ; i<3 ; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1303
line 3219
;3219:		wishvel[i] = pml.forward[i]*fmove + pml.right[i]*smove;
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 72
INDIRI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 72
INDIRI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1304
line 3218
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1303
line 3220
;3220:	wishvel[2] += pm->cmd.upmove;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ADDF4
ASGNF4
line 3222
;3221:
;3222:	VectorCopy (wishvel, wishdir);
ADDRLP4 36
ADDRLP4 4
INDIRB
ASGNB 12
line 3223
;3223:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 36
ARGP4
ADDRLP4 76
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 76
INDIRF4
ASGNF4
line 3224
;3224:	wishspeed *= scale;
ADDRLP4 48
ADDRLP4 48
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 3226
;3225:
;3226:	PM_Accelerate( wishdir, wishspeed, pm_accelerate );
ADDRLP4 36
ARGP4
ADDRLP4 48
INDIRF4
ARGF4
ADDRGP4 pm_accelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 3227
;3227:	PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 3230
;3228:
;3229:	// move
;3230:	VectorMA (pm->ps->origin, pml.frametime, pm->ps->velocity, pm->ps->origin);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
ADDRLP4 88
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 96
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 3231
;3231:}
LABELV $1288
endproc PM_NoclipMove 104 12
proc PM_FootstepForSurface 0 0
line 3243
;3232:
;3233://============================================================================
;3234:
;3235:/*
;3236:================
;3237:PM_FootstepForSurface
;3238:
;3239:Returns an event number apropriate for the groundsurface
;3240:================
;3241:*/
;3242:static int PM_FootstepForSurface( void )
;3243:{
line 3244
;3244:	if ( pml.groundTrace.surfaceFlags & SURF_NOSTEPS ) 
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 4194304
BANDI4
CNSTI4 0
EQI4 $1313
line 3245
;3245:	{
line 3246
;3246:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1312
JUMPV
LABELV $1313
line 3248
;3247:	}
;3248:	if ( pml.groundTrace.surfaceFlags & SURF_METALSTEPS ) 
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $1317
line 3249
;3249:	{
line 3250
;3250:		return EV_FOOTSTEP_METAL;
CNSTI4 3
RETI4
ADDRGP4 $1312
JUMPV
LABELV $1317
line 3252
;3251:	}
;3252:	return EV_FOOTSTEP;
CNSTI4 2
RETI4
LABELV $1312
endproc PM_FootstepForSurface 0 0
proc PM_TryRoll 1212 28
line 3256
;3253:}
;3254:
;3255:static int PM_TryRoll( void )
;3256:{
line 3257
;3257:	float rollDist = 64;
ADDRLP4 0
CNSTF4 1115684864
ASGNF4
line 3259
;3258:	trace_t	trace;
;3259:	int		anim = -1;
ADDRLP4 40
CNSTI4 -1
ASGNI4
line 3262
;3260:	vec3_t fwd, right, traceto, mins, maxs, fwdAngles;
;3261:
;3262:	if (pm->modParms.physics == MV_JK2SP) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1322
line 3263
;3263:		rollDist = 192;
ADDRLP4 0
CNSTF4 1128267776
ASGNF4
line 3264
;3264:	}
LABELV $1322
line 3266
;3265:
;3266:	if ( BG_SaberInAttack( pm->ps->saberMove ) || BG_SaberInSpecialAttack( pm->ps->torsoAnim ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1160
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $1328
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 1164
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
NEI4 $1328
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 1168
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
NEI4 $1328
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1324
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1172
ADDRGP4 PM_SaberInStart
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
EQI4 $1324
LABELV $1328
line 3269
;3267:		|| BG_SpinningSaberAnim( pm->ps->legsAnim ) 
;3268:		|| (jk2gameplay != VERSION_1_02 && PM_SaberInStart( pm->ps->saberMove )) ) // MVSDK: In 1.02 everyone except client 0 could roll during SaberInStart. In 1.03 and later nobody could roll during SaberInStart. 1.02 people consider client 0 being unable to roll as client 0 bug, so let him roll, too.
;3269:	{//attacking or spinning (or, if player, starting an attack)
line 3270
;3270:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1321
JUMPV
LABELV $1324
line 3275
;3271:	}
;3272:
;3273:	// TODO MAYBE jaPRO ysal stuff here?
;3274:
;3275:	if (pm->ps->weapon != WP_SABER || BG_HasYsalamiri(pm->gametype, pm->ps) ||
ADDRLP4 1176
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1180
ADDRLP4 1176
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1332
ADDRLP4 1176
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1184
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $1332
ADDRLP4 1188
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1188
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 1188
INDIRP4
INDIRP4
ARGP4
ADDRLP4 1188
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1192
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 0
NEI4 $1329
LABELV $1332
line 3277
;3276:		!BG_CanUseFPNow(pm->gametype, pm->ps, pm->cmd.serverTime, FP_LEVITATION))
;3277:	{ //Not using saber, or can't use jump
line 3278
;3278:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1321
JUMPV
LABELV $1329
line 3281
;3279:	}
;3280:
;3281:	VectorSet(mins, pm->mins[0],pm->mins[1],pm->mins[2]+STEPSIZE);
ADDRLP4 1196
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 1196
INDIRP4
CNSTI4 220
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 1196
INDIRP4
CNSTI4 224
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16+8
ADDRGP4 pm
INDIRP4
CNSTI4 228
ADDP4
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 3282
;3282:	VectorSet(maxs, pm->maxs[0],pm->maxs[1],CROUCH_MAXS_2);
ADDRLP4 1200
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 1200
INDIRP4
CNSTI4 232
ADDP4
INDIRF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 1200
INDIRP4
CNSTI4 236
ADDP4
INDIRF4
ASGNF4
ADDRLP4 28+8
CNSTF4 1098907648
ASGNF4
line 3284
;3283:
;3284:	VectorSet(fwdAngles, 0, pm->ps->viewangles[YAW], 0);
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 3286
;3285:
;3286:	AngleVectors( fwdAngles, fwd, right, NULL );
ADDRLP4 4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 68
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3288
;3287:
;3288:	if ( pm->cmd.forwardmove )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1339
line 3289
;3289:	{ //check forward/backward rolls
line 3290
;3290:		if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1341
line 3291
;3291:		{
line 3292
;3292:			anim = BOTH_ROLL_B;
ADDRLP4 40
CNSTI4 886
ASGNI4
line 3293
;3293:			VectorMA( pm->ps->origin, -rollDist, fwd, traceto );
ADDRLP4 1204
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1208
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
ADDRLP4 44
ADDRLP4 1204
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 56
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44+4
ADDRLP4 1204
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 56+4
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 56+8
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3294
;3294:		}
ADDRGP4 $1340
JUMPV
LABELV $1341
line 3296
;3295:		else
;3296:		{
line 3297
;3297:			anim = BOTH_ROLL_F;
ADDRLP4 40
CNSTI4 885
ASGNI4
line 3298
;3298:			VectorMA( pm->ps->origin, rollDist, fwd, traceto );
ADDRLP4 1204
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 1204
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 56
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44+4
ADDRLP4 1204
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 56+4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 56+8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 3299
;3299:		}
line 3300
;3300:	}
ADDRGP4 $1340
JUMPV
LABELV $1339
line 3301
;3301:	else if ( pm->cmd.rightmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $1351
line 3302
;3302:	{ //right
line 3303
;3303:		anim = BOTH_ROLL_R;
ADDRLP4 40
CNSTI4 888
ASGNI4
line 3304
;3304:		VectorMA( pm->ps->origin, rollDist, right, traceto );
ADDRLP4 1204
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 1204
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 68
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44+4
ADDRLP4 1204
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 68+4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 68+8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 3305
;3305:	}
ADDRGP4 $1352
JUMPV
LABELV $1351
line 3306
;3306:	else if ( pm->cmd.rightmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $1357
line 3307
;3307:	{ //left
line 3308
;3308:		anim = BOTH_ROLL_L;
ADDRLP4 40
CNSTI4 887
ASGNI4
line 3309
;3309:		VectorMA( pm->ps->origin, -rollDist, right, traceto );
ADDRLP4 1204
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1208
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
ADDRLP4 44
ADDRLP4 1204
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 68
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44+4
ADDRLP4 1204
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 68+4
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 68+8
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3310
;3310:	}
LABELV $1357
LABELV $1352
LABELV $1340
line 3312
;3311:
;3312:	if ( anim != -1 )
ADDRLP4 40
INDIRI4
CNSTI4 -1
EQI4 $1363
line 3313
;3313:	{ //We want to roll. Perform a trace to see if we can, and if so, send us into one.
line 3314
;3314:		pm->trace( &trace, pm->ps->origin, mins, maxs, traceto, pm->ps->clientNum, CONTENTS_SOLID );
ADDRLP4 80
ARGP4
ADDRLP4 1204
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1208
ADDRLP4 1204
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 1208
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1204
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 3315
;3315:		if ( trace.fraction >= 1.0f )
ADDRLP4 80+8
INDIRF4
CNSTF4 1065353216
LTF4 $1365
line 3316
;3316:		{
line 3317
;3317:			pm->ps->saberMove = LS_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 3318
;3318:			return anim;
ADDRLP4 40
INDIRI4
RETI4
ADDRGP4 $1321
JUMPV
LABELV $1365
line 3320
;3319:		}
;3320:	}
LABELV $1363
line 3321
;3321:	return 0;
CNSTI4 0
RETI4
LABELV $1321
endproc PM_TryRoll 1212 28
proc PM_CrashLand 120 16
line 3331
;3322:}
;3323:
;3324:/*
;3325:=================
;3326:PM_CrashLand
;3327:
;3328:Check for hard landings that generate sound events
;3329:=================
;3330:*/
;3331:static void PM_CrashLand( void ) {
line 3337
;3332:	float		delta;
;3333:	float		dist;
;3334:	float		vel, acc;
;3335:	float		t;
;3336:	float		a, b, c, den;
;3337:	qboolean	didRoll = qfalse;
ADDRLP4 36
CNSTI4 0
ASGNI4
line 3340
;3338:
;3339:	// calculate the exact velocity on landing
;3340:	dist = pm->ps->origin[2] - pml.previous_origin[2];
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 pml+1136+8
INDIRF4
SUBF4
ASGNF4
line 3341
;3341:	vel = pml.previous_velocity[2];
ADDRLP4 8
ADDRGP4 pml+1148+8
INDIRF4
ASGNF4
line 3342
;3342:	acc = -pm->ps->gravity;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 3344
;3343:
;3344:	a = acc / 2;
ADDRLP4 16
ADDRLP4 12
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 3345
;3345:	b = vel;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 3346
;3346:	c = -dist;
ADDRLP4 32
ADDRLP4 24
INDIRF4
NEGF4
ASGNF4
line 3348
;3347:
;3348:	den =  b * b - 4 * a * c;
ADDRLP4 20
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1082130432
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
MULF4
SUBF4
ASGNF4
line 3349
;3349:	if ( den < 0 ) {
ADDRLP4 20
INDIRF4
CNSTF4 0
GEF4 $1373
line 3350
;3350:		pm->ps->inAirAnim = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
CNSTI4 0
ASGNI4
line 3351
;3351:		return;
ADDRGP4 $1368
JUMPV
LABELV $1373
line 3353
;3352:	}
;3353:	t = (-b - sqrtf( den ) ) / ( 2 * a );
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 44
INDIRF4
SUBF4
CNSTF4 1073741824
ADDRLP4 16
INDIRF4
MULF4
DIVF4
ASGNF4
line 3355
;3354:
;3355:	delta = vel + t * acc;
ADDRLP4 0
ADDRLP4 8
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 3356
;3356:	delta = delta*delta * 0.0001;
ADDRLP4 0
CNSTF4 953267991
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
MULF4
ASGNF4
line 3359
;3357:
;3358:	// ducking while falling doubles damage
;3359:	if ( pm->ps->pm_flags & PMF_DUCKED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1375
line 3360
;3360:		delta *= 2;
ADDRLP4 0
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3361
;3361:	}
LABELV $1375
line 3364
;3362:
;3363:	// decide which landing animation to use
;3364:	if (!BG_InRoll(pm->ps, pm->ps->legsAnim) && pm->ps->inAirAnim)
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $1377
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1377
line 3365
;3365:	{ //only play a land animation if we transitioned into an in-air animation while off the ground
line 3366
;3366:		if (!BG_SaberInSpecial(pm->ps->saberMove))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $1379
line 3367
;3367:		{
line 3368
;3368:			if ( pm->ps->pm_flags & PMF_BACKWARDS_JUMP ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1381
line 3369
;3369:				PM_ForceLegsAnim( BOTH_LANDBACK1 );
CNSTI4 862
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 3370
;3370:			} else {
ADDRGP4 $1382
JUMPV
LABELV $1381
line 3371
;3371:				PM_ForceLegsAnim( BOTH_LAND1 );
CNSTI4 858
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 3372
;3372:			}
LABELV $1382
line 3373
;3373:		}
LABELV $1379
line 3374
;3374:	}
LABELV $1377
line 3376
;3375:
;3376:	if (pm->ps->weapon != WP_SABER)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1383
line 3377
;3377:	{ //saber handles its own anims
line 3379
;3378:		//This will push us back into our weaponready stance from the land anim.
;3379:		if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode == 1)
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1385
ADDRLP4 64
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1385
line 3380
;3380:		{
line 3381
;3381:			PM_StartTorsoAnim( TORSO_WEAPONREADY4 );
CNSTI4 1102
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3382
;3382:		}
ADDRGP4 $1386
JUMPV
LABELV $1385
line 3384
;3383:		else
;3384:		{
line 3385
;3385:			if (pm->ps->weapon == WP_EMPLACED_GUN)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $1387
line 3386
;3386:			{
line 3387
;3387:				PM_StartTorsoAnim( BOTH_GUNSIT1 );
CNSTI4 810
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3388
;3388:			}
ADDRGP4 $1388
JUMPV
LABELV $1387
line 3390
;3389:			else
;3390:			{
line 3391
;3391:				PM_StartTorsoAnim( WeaponReadyAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 3392
;3392:			}
LABELV $1388
line 3393
;3393:		}
LABELV $1386
line 3394
;3394:	}
LABELV $1383
line 3396
;3395:
;3396:	if (!BG_InSpecialJump(pm->ps->legsAnim, pm->modParms.runFlags) ||
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $1393
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1
LTI4 $1393
ADDRLP4 76
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 918
EQI4 $1393
ADDRLP4 76
INDIRI4
CNSTI4 915
NEI4 $1389
LABELV $1393
line 3400
;3397:		pm->ps->legsTimer < 1 ||
;3398:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_LEFT ||
;3399:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_WALL_RUN_RIGHT)
;3400:	{ //Only set the timer if we're in an anim that can be interrupted (this would not be, say, a flip)
line 3401
;3401:		if (!BG_InRoll(pm->ps, pm->ps->legsAnim) && pm->ps->inAirAnim)
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $1394
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $1394
line 3402
;3402:		{
line 3403
;3403:			if (!BG_SaberInSpecial(pm->ps->saberMove) || pm->ps->weapon != WP_SABER)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $1398
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1396
LABELV $1398
line 3404
;3404:			{
line 3405
;3405:				pm->ps->legsTimer = TIMER_LAND;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 130
ASGNI4
line 3406
;3406:			}
LABELV $1396
line 3407
;3407:		}
LABELV $1394
line 3408
;3408:	}
LABELV $1389
line 3410
;3409:
;3410:	pm->ps->inAirAnim = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
CNSTI4 0
ASGNI4
line 3413
;3411:
;3412:	// never take falling damage if completely underwater
;3413:	if ( pm->waterlevel == 3 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1399
line 3414
;3414:		return;
ADDRGP4 $1368
JUMPV
LABELV $1399
line 3418
;3415:	}
;3416:
;3417:	// reduce falling damage if there is standing water
;3418:	if ( pm->waterlevel == 2 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1401
line 3419
;3419:		delta *= 0.25;
ADDRLP4 0
CNSTF4 1048576000
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3420
;3420:	}
LABELV $1401
line 3421
;3421:	if ( pm->waterlevel == 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1403
line 3422
;3422:		delta *= 0.5;
ADDRLP4 0
CNSTF4 1056964608
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 3423
;3423:	}
LABELV $1403
line 3425
;3424:
;3425:	if ( delta < 1 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $1405
line 3426
;3426:		return;
ADDRGP4 $1368
JUMPV
LABELV $1405
line 3429
;3427:	}
;3428:
;3429:	if ( pm->ps->pm_flags & PMF_DUCKED ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1407
line 3430
;3430:	{
line 3431
;3431:		if( delta >= 2 && !PM_InOnGroundAnim( pm->ps->legsAnim ) && !PM_InKnockDown( pm->ps ) && !BG_InRoll(pm->ps, pm->ps->legsAnim) &&
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
LTF4 $1409
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 PM_InOnGroundAnim
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $1409
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 PM_InKnockDown
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $1409
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $1409
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
EQI4 $1411
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $1409
LABELV $1411
line 3433
;3432:			(pm->ps->forceHandExtend == HANDEXTEND_NONE || jk2gameplay != VERSION_1_04) )
;3433:		{//roll!
line 3434
;3434:			int anim = PM_TryRoll();
ADDRLP4 104
ADDRGP4 PM_TryRoll
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 104
INDIRI4
ASGNI4
line 3436
;3435:
;3436:			if (PM_InRollComplete(pm->ps, pm->ps->legsAnim))
ADDRLP4 108
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 PM_InRollComplete
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $1412
line 3437
;3437:			{
line 3438
;3438:				anim = 0;
ADDRLP4 100
CNSTI4 0
ASGNI4
line 3439
;3439:				pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 3440
;3440:				pm->ps->legsAnim = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
line 3441
;3441:				PM_SetAnim(SETANIM_BOTH,BOTH_LAND1,SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150);
ADDRLP4 116
CNSTI4 3
ASGNI4
ADDRLP4 116
INDIRI4
ARGI4
CNSTI4 858
ARGI4
ADDRLP4 116
INDIRI4
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 3442
;3442:				pm->ps->legsTimer = TIMER_LAND;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 130
ASGNI4
line 3443
;3443:			}
LABELV $1412
line 3445
;3444:
;3445:			if ( anim )
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $1414
line 3446
;3446:			{//absorb some impact
line 3447
;3447:				pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 3448
;3448:				delta /= 3; // /= 2 just cancels out the above delta *= 2 when landing while crouched, the roll itself should absorb a little damage
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 3449
;3449:				pm->ps->legsAnim = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
line 3450
;3450:				PM_SetAnim(SETANIM_BOTH,anim,SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150);
ADDRLP4 116
CNSTI4 3
ASGNI4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 100
INDIRI4
ARGI4
ADDRLP4 116
INDIRI4
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 3451
;3451:				didRoll = qtrue;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 3452
;3452:			}
LABELV $1414
line 3453
;3453:		}
LABELV $1409
line 3454
;3454:	}
LABELV $1407
line 3458
;3455:
;3456:	// SURF_NODAMAGE is used for bounce pads where you don't ever
;3457:	// want to take damage or play a crunch sound
;3458:	if ( !(pml.groundTrace.surfaceFlags & SURF_NODAMAGE) )  {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
NEI4 $1416
line 3459
;3459:		if (delta > 7)
ADDRLP4 0
INDIRF4
CNSTF4 1088421888
LEF4 $1420
line 3460
;3460:		{
line 3461
;3461:			int delta_send = (int)delta;
ADDRLP4 80
ADDRLP4 0
INDIRF4
CVFI4 4
ASGNI4
line 3463
;3462:
;3463:			if (delta_send > 600)
ADDRLP4 80
INDIRI4
CNSTI4 600
LEI4 $1422
line 3464
;3464:			{ //will never need to know any value above this
line 3465
;3465:				delta_send = 600;
ADDRLP4 80
CNSTI4 600
ASGNI4
line 3466
;3466:			}
LABELV $1422
line 3468
;3467:
;3468:			if (pm->ps->fd.forceJumpZStart)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1424
line 3469
;3469:			{
line 3470
;3470:				if ((int)pm->ps->origin[2] >= (int)pm->ps->fd.forceJumpZStart)
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
ADDRLP4 84
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CVFI4 4
LTI4 $1426
line 3471
;3471:				{ //was force jumping, landed on higher or same level as when force jump was started
line 3472
;3472:					if (delta_send > 8)
ADDRLP4 80
INDIRI4
CNSTI4 8
LEI4 $1427
line 3473
;3473:					{
line 3474
;3474:						delta_send = 8;
ADDRLP4 80
CNSTI4 8
ASGNI4
line 3475
;3475:					}
line 3476
;3476:				}
ADDRGP4 $1427
JUMPV
LABELV $1426
line 3478
;3477:				else
;3478:				{
line 3479
;3479:					if (delta_send > 8)
ADDRLP4 80
INDIRI4
CNSTI4 8
LEI4 $1430
line 3480
;3480:					{
line 3481
;3481:						int dif = ((int)pm->ps->fd.forceJumpZStart - (int)pm->ps->origin[2]);
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
ADDRLP4 96
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CVFI4 4
ADDRLP4 96
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
SUBI4
ASGNI4
line 3482
;3482:						int dmgLess = (forceJumpHeight[pm->ps->fd.forcePowerLevel[FP_LEVITATION]] - dif);
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpHeight
ADDP4
INDIRF4
ADDRLP4 92
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 3484
;3483:
;3484:						if (dmgLess < 0)
ADDRLP4 88
INDIRI4
CNSTI4 0
GEI4 $1432
line 3485
;3485:						{
line 3486
;3486:							dmgLess = 0;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 3487
;3487:						}
LABELV $1432
line 3489
;3488:
;3489:						delta_send -= (dmgLess*0.3);
ADDRLP4 80
ADDRLP4 80
INDIRI4
CVIF4 4
CNSTF4 1050253722
ADDRLP4 88
INDIRI4
CVIF4 4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 3491
;3490:
;3491:						if (delta_send < 8)
ADDRLP4 80
INDIRI4
CNSTI4 8
GEI4 $1434
line 3492
;3492:						{
line 3493
;3493:							delta_send = 8;
ADDRLP4 80
CNSTI4 8
ASGNI4
line 3494
;3494:						}
LABELV $1434
line 3497
;3495:
;3496:						//Com_Printf("Damage sub: %i\n", (int)((dmgLess*0.1)));
;3497:					}
LABELV $1430
line 3498
;3498:				}
LABELV $1427
line 3499
;3499:			}
LABELV $1424
line 3501
;3500:
;3501:			if (didRoll)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1436
line 3502
;3502:			{ //Add the appropriate event..
line 3503
;3503:				PM_AddEventWithParm( EV_ROLL, delta_send );
CNSTI4 15
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 3504
;3504:			}
ADDRGP4 $1421
JUMPV
LABELV $1436
line 3506
;3505:			else
;3506:			{
line 3507
;3507:				PM_AddEventWithParm( EV_FALL, delta_send );
CNSTI4 11
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 3508
;3508:			}
line 3509
;3509:		}
ADDRGP4 $1421
JUMPV
LABELV $1420
line 3511
;3510:		else
;3511:		{
line 3512
;3512:			if (didRoll)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1438
line 3513
;3513:			{
line 3514
;3514:				PM_AddEventWithParm( EV_ROLL, 0 );
CNSTI4 15
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 3515
;3515:			}
ADDRGP4 $1439
JUMPV
LABELV $1438
line 3517
;3516:			else
;3517:			{
line 3518
;3518:				PM_AddEvent( PM_FootstepForSurface() );
ADDRLP4 80
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3519
;3519:			}
LABELV $1439
line 3520
;3520:		}
LABELV $1421
line 3521
;3521:	}
LABELV $1416
line 3524
;3522:
;3523:	// make sure velocity resets so we don't bounce back up again in case we miss the clear elsewhere
;3524:	if (!pml.bounceJumped && pm->modParms.physics != MV_PINBALL) {
ADDRGP4 pml+1188
INDIRI4
CNSTI4 0
NEI4 $1440
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 7
EQI4 $1440
line 3525
;3525:		pm->ps->velocity[2] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 3526
;3526:	}
LABELV $1440
line 3536
;3527:
;3528:	// nah lets not do this. this isnt a true q3 overbounce, not even close. more of a meme q3 overbounce version.
;3529:	// but q3 overbounce is also kinda lame as way too finnicky. lets do sth more fun. bouncy mode maybe
;3530:	//if ((MovementIsQuake3Based(moveStyle)) && ((int)pm->ps->fd.forceJumpZStart > pm->ps->origin[2] + 1)) {
;3531:	//	if (1 > (sqrtf(pm->ps->velocity[0] * pm->ps->velocity[0] + pm->ps->velocity[1] * pm->ps->velocity[1])))//No xyvel
;3532:	//		pm->ps->velocity[2] = -vel; //OVERBOUNCE OVER BOUNCE
;3533:	////}
;3534:
;3535:	// start footstep cycle over
;3536:	pm->ps->bobCycle = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 3537
;3537:}
LABELV $1368
endproc PM_CrashLand 120 16
proc PM_CorrectAllSolid 36 28
line 3544
;3538:
;3539:/*
;3540:=============
;3541:PM_CorrectAllSolid
;3542:=============
;3543:*/
;3544:static int PM_CorrectAllSolid( trace_t *trace ) {
line 3548
;3545:	int			i, j, k;
;3546:	vec3_t		point;
;3547:
;3548:	if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1444
line 3549
;3549:		Com_Printf("%i:allsolid\n", c_pmove);
ADDRGP4 $1446
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 3550
;3550:	}
LABELV $1444
line 3553
;3551:
;3552:	// jitter around
;3553:	for (i = -1; i <= 1; i++) {
ADDRLP4 20
CNSTI4 -1
ASGNI4
LABELV $1447
line 3554
;3554:		for (j = -1; j <= 1; j++) {
ADDRLP4 16
CNSTI4 -1
ASGNI4
LABELV $1451
line 3555
;3555:			for (k = -1; k <= 1; k++) {
ADDRLP4 12
CNSTI4 -1
ASGNI4
LABELV $1455
line 3556
;3556:				VectorCopy(pm->ps->origin, point);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3557
;3557:				point[0] += (float) i;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3558
;3558:				point[1] += (float) j;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3559
;3559:				point[2] += (float) k;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3560
;3560:				pm->trace (trace, point, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 3561
;3561:				if ( !trace->allsolid ) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1461
line 3562
;3562:					point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 3563
;3563:					point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 3564
;3564:					point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 3566
;3565:
;3566:					pm->trace (trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 3567
;3567:					pml.groundTrace = *trace;
ADDRGP4 pml+52
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 1080
line 3568
;3568:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1443
JUMPV
LABELV $1461
line 3570
;3569:				}
;3570:			}
LABELV $1456
line 3555
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LEI4 $1455
line 3571
;3571:		}
LABELV $1452
line 3554
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LEI4 $1451
line 3572
;3572:	}
LABELV $1448
line 3553
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
LEI4 $1447
line 3574
;3573:
;3574:	PM_SetGroundEntityNum(ENTITYNUM_NONE);
CNSTI4 1023
ARGI4
ADDRGP4 PM_SetGroundEntityNum
CALLV
pop
line 3575
;3575:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 3576
;3576:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 3578
;3577:
;3578:	return qfalse;
CNSTI4 0
RETI4
LABELV $1443
endproc PM_CorrectAllSolid 36 28
proc PM_GroundTraceMissed 1112 28
line 3588
;3579:}
;3580:
;3581:/*
;3582:=============
;3583:PM_GroundTraceMissed
;3584:
;3585:The ground trace didn't hit a surface, so we are in freefall
;3586:=============
;3587:*/
;3588:static void PM_GroundTraceMissed( void ) {
line 3594
;3589:	trace_t		trace;
;3590:	vec3_t		point;
;3591:
;3592:	//rww - don't want to do this when handextend_choke, because you can be standing on the ground
;3593:	//while still holding your throat.
;3594:	if ( pm->ps->pm_type == PM_FLOAT && jk2gameplay != VERSION_1_02 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1469
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1469
line 3595
;3595:	{
line 3597
;3596:		//we're assuming this is because you're being choked
;3597:		int parts = SETANIM_LEGS;
ADDRLP4 1092
CNSTI4 2
ASGNI4
line 3601
;3598:
;3599:		//rww - also don't use SETANIM_FLAG_HOLD, it will cause the legs to float around a bit before going into
;3600:		//a proper anim even when on the ground.
;3601:		PM_SetAnim(parts, BOTH_CHOKE3, SETANIM_FLAG_OVERRIDE, 100);
ADDRLP4 1092
INDIRI4
ARGI4
CNSTI4 1032
ARGI4
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 3602
;3602:	}
ADDRGP4 $1470
JUMPV
LABELV $1469
line 3604
;3603:	//If the anim is choke3, act like we just went into the air because we aren't in a float
;3604:	else if ( pm->ps->groundEntityNum != ENTITYNUM_NONE || ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_CHOKE3 && jk2gameplay != VERSION_1_02) )
ADDRLP4 1092
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1092
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1473
ADDRLP4 1092
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 1032
NEI4 $1471
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1471
LABELV $1473
line 3605
;3605:	{
line 3607
;3606:		// we just transitioned into freefall
;3607:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1474
line 3608
;3608:			Com_Printf("%i:lift\n", c_pmove);
ADDRGP4 $1476
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 3609
;3609:		}
LABELV $1474
line 3613
;3610:
;3611:		// if they aren't in a jumping animation and the ground is a ways away, force into it
;3612:		// if we didn't do the trace, the player would be backflipping down staircases
;3613:		VectorCopy( pm->ps->origin, point );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3614
;3614:		point[2] -= 64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 3616
;3615:
;3616:		pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 12
ARGP4
ADDRLP4 1096
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1096
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1100
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 3617
;3617:		if ( trace.fraction == 1.0 || pm->ps->pm_type == PM_FLOAT ) {
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $1481
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1472
LABELV $1481
line 3618
;3618:			if ( pm->ps->velocity[2] <= 0 && !(pm->ps->pm_flags&PMF_JUMP_HELD))
ADDRLP4 1104
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GTF4 $1482
ADDRLP4 1104
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $1482
line 3619
;3619:			{
line 3620
;3620:				PM_SetAnim(SETANIM_LEGS,BOTH_INAIR1,SETANIM_FLAG_OVERRIDE, 100);
CNSTI4 2
ARGI4
CNSTI4 857
ARGI4
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 3621
;3621:				pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 3622
;3622:			}
ADDRGP4 $1483
JUMPV
LABELV $1482
line 3623
;3623:			else if ( pm->cmd.forwardmove >= 0 ) 
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $1484
line 3624
;3624:			{
line 3625
;3625:				PM_SetAnim(SETANIM_LEGS,BOTH_JUMP1,SETANIM_FLAG_OVERRIDE, 100);
CNSTI4 2
ARGI4
CNSTI4 856
ARGI4
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 3626
;3626:				pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 3627
;3627:			} 
ADDRGP4 $1485
JUMPV
LABELV $1484
line 3629
;3628:			else 
;3629:			{
line 3630
;3630:				PM_SetAnim(SETANIM_LEGS,BOTH_JUMPBACK1,SETANIM_FLAG_OVERRIDE, 100);
CNSTI4 2
ARGI4
CNSTI4 860
ARGI4
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 3631
;3631:				pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 3632
;3632:			}
LABELV $1485
LABELV $1483
line 3634
;3633:
;3634:			pm->ps->inAirAnim = qtrue;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
CNSTI4 1
ASGNI4
line 3635
;3635:		}
line 3636
;3636:	}
ADDRGP4 $1472
JUMPV
LABELV $1471
line 3637
;3637:	else if (!pm->ps->inAirAnim)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1486
line 3638
;3638:	{
line 3641
;3639:		// if they aren't in a jumping animation and the ground is a ways away, force into it
;3640:		// if we didn't do the trace, the player would be backflipping down staircases
;3641:		VectorCopy( pm->ps->origin, point );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3642
;3642:		point[2] -= 64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 3644
;3643:
;3644:		pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 12
ARGP4
ADDRLP4 1096
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1096
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1100
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 3645
;3645:		if ( trace.fraction == 1.0 || pm->ps->pm_type == PM_FLOAT )
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $1492
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1489
LABELV $1492
line 3646
;3646:		{
line 3647
;3647:			pm->ps->inAirAnim = qtrue;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
CNSTI4 1
ASGNI4
line 3648
;3648:		}
LABELV $1489
line 3649
;3649:	}
LABELV $1486
LABELV $1472
LABELV $1470
line 3651
;3650:
;3651:	if (PM_InRollComplete(pm->ps, pm->ps->legsAnim))
ADDRLP4 1096
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 1100
ADDRGP4 PM_InRollComplete
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
EQI4 $1493
line 3652
;3652:	{ //Client won't catch an animation restart because it only checks frame against incoming frame, so if you roll when you land after rolling
line 3654
;3653:	  //off of something it won't replay the roll anim unless we switch it off in the air. This fixes that.
;3654:		PM_SetAnim(SETANIM_BOTH,BOTH_INAIR1,SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150);
ADDRLP4 1104
CNSTI4 3
ASGNI4
ADDRLP4 1104
INDIRI4
ARGI4
CNSTI4 857
ARGI4
ADDRLP4 1104
INDIRI4
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 3655
;3655:		pm->ps->inAirAnim = qtrue;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1360
ADDP4
CNSTI4 1
ASGNI4
line 3656
;3656:	}
LABELV $1493
line 3658
;3657:
;3658:	PM_SetGroundEntityNum(ENTITYNUM_NONE);
CNSTI4 1023
ARGI4
ADDRGP4 PM_SetGroundEntityNum
CALLV
pop
line 3659
;3659:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 3660
;3660:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 3661
;3661:}
LABELV $1468
endproc PM_GroundTraceMissed 1112 28
proc PM_GroundTrace 1144 28
line 3670
;3662:
;3663:
;3664:extern void PM_LimitedClipVelocity2(vec3_t in, vec3_t normal, vec3_t out, float overbounce, float maxSpeedNormal);
;3665:/*
;3666:=============
;3667:PM_GroundTrace
;3668:=============
;3669:*/
;3670:static void PM_GroundTrace( void ) {
line 3673
;3671:	vec3_t		point;
;3672:	trace_t		trace;
;3673:	float		overbounce = MovementOverbounceFactor(pm->modParms.physics, pm->ps, &pm->cmd);
ADDRLP4 1096
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 1100
ADDRGP4 MovementOverbounceFactor
CALLF4
ASGNF4
ADDRLP4 1092
ADDRLP4 1100
INDIRF4
ASGNF4
line 3675
;3674:
;3675:	point[0] = pm->ps->origin[0];
ADDRLP4 1080
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 3676
;3676:	point[1] = pm->ps->origin[1];
ADDRLP4 1080+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 3677
;3677:	point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 1080+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 3679
;3678:
;3679:	if (MovementStyleHasQuake2Ramps(pm->modParms.physics) && pm->ps->velocity[2] > 180) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 MovementStyleHasQuake2Ramps
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $1500
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $1500
line 3680
;3680:		if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1502
line 3681
;3681:			Com_Printf("%i:q2ramp\n", c_pmove);
ADDRGP4 $1504
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 3682
;3682:		}
LABELV $1502
line 3683
;3683:		PM_SetGroundEntityNum(ENTITYNUM_NONE);
CNSTI4 1023
ARGI4
ADDRGP4 PM_SetGroundEntityNum
CALLV
pop
line 3684
;3684:		pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 3685
;3685:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 3686
;3686:		return;
ADDRGP4 $1497
JUMPV
LABELV $1500
line 3689
;3687:	}
;3688:
;3689:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1112
ADDRLP4 1108
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1108
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1108
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1112
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1108
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1108
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 3690
;3690:	pml.groundTrace = trace;
ADDRGP4 pml+52
ADDRLP4 0
INDIRB
ASGNB 1080
line 3693
;3691:
;3692:	// do something corrective if the trace starts in a solid...
;3693:	if ( trace.allsolid ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1508
line 3694
;3694:		if ( !PM_CorrectAllSolid(&trace) )
ADDRLP4 0
ARGP4
ADDRLP4 1116
ADDRGP4 PM_CorrectAllSolid
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1510
line 3695
;3695:			return;
ADDRGP4 $1497
JUMPV
LABELV $1510
line 3696
;3696:	}
LABELV $1508
line 3698
;3697:
;3698:	if (pm->ps->pm_type == PM_FLOAT)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1512
line 3699
;3699:	{
line 3700
;3700:		PM_GroundTraceMissed();
ADDRGP4 PM_GroundTraceMissed
CALLV
pop
line 3701
;3701:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 3702
;3702:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 3703
;3703:		return;
ADDRGP4 $1497
JUMPV
LABELV $1512
line 3707
;3704:	}
;3705:
;3706:	// if the trace didn't hit anything, we are in free fall
;3707:	if ( trace.fraction == 1.0 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $1516
line 3708
;3708:		PM_GroundTraceMissed();
ADDRGP4 PM_GroundTraceMissed
CALLV
pop
line 3709
;3709:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 3710
;3710:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 3711
;3711:		return;
ADDRGP4 $1497
JUMPV
LABELV $1516
line 3715
;3712:	}
;3713:
;3714:	// check if getting thrown off the ground
;3715:	if ( pm->ps->velocity[2] > 0 && DotProduct( pm->ps->velocity, trace.plane.normal ) > 10 ) {
ADDRLP4 1116
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1120
ADDRLP4 1116
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1120
INDIRF4
CNSTF4 0
LEF4 $1521
ADDRLP4 1116
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+24
INDIRF4
MULF4
ADDRLP4 1116
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1120
INDIRF4
ADDRLP4 0+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 1092616192
LEF4 $1521
line 3716
;3716:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1528
line 3717
;3717:			Com_Printf("%i:kickoff\n", c_pmove);
ADDRGP4 $1530
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 3718
;3718:		}
LABELV $1528
line 3720
;3719:		// go into jump animation
;3720:		if ( pm->cmd.forwardmove >= 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $1531
line 3721
;3721:			PM_ForceLegsAnim( BOTH_JUMP1 );
CNSTI4 856
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 3722
;3722:			pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 1124
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1124
INDIRP4
ADDRLP4 1124
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 3723
;3723:		} else {
ADDRGP4 $1532
JUMPV
LABELV $1531
line 3724
;3724:			PM_ForceLegsAnim( BOTH_JUMPBACK1 );
CNSTI4 860
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 3725
;3725:			pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 1124
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1124
INDIRP4
ADDRLP4 1124
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 3726
;3726:		}
LABELV $1532
line 3728
;3727:
;3728:		PM_SetGroundEntityNum(ENTITYNUM_NONE);
CNSTI4 1023
ARGI4
ADDRGP4 PM_SetGroundEntityNum
CALLV
pop
line 3729
;3729:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 3730
;3730:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 3731
;3731:		return;
ADDRGP4 $1497
JUMPV
LABELV $1521
line 3735
;3732:	}
;3733:	
;3734:	// slopes that are too steep will not be considered onground
;3735:	if ( trace.plane.normal[2] < MIN_WALK_NORMAL ) {
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $1535
line 3736
;3736:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1539
line 3737
;3737:			Com_Printf("%i:steep\n", c_pmove);
ADDRGP4 $1541
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 3738
;3738:		}
LABELV $1539
line 3739
;3739:		PM_SetGroundEntityNum(ENTITYNUM_NONE);
CNSTI4 1023
ARGI4
ADDRGP4 PM_SetGroundEntityNum
CALLV
pop
line 3740
;3740:		if (pm->modParms.physics != MV_DREAM) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 11
EQI4 $1542
line 3741
;3741:			pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 3742
;3742:		}
LABELV $1542
line 3743
;3743:		pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 3744
;3744:		pm->roll.segmentDisqualified = qtrue; // we are sliding, giving us extra speed. disqualify the roll.
ADDRGP4 pm
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 1
ASGNI4
line 3745
;3745:		return;
ADDRGP4 $1497
JUMPV
LABELV $1535
line 3748
;3746:	}
;3747:
;3748:	if (!pml.bounceJumped && pm->modParms.physics != MV_PINBALL) {
ADDRGP4 pml+1188
INDIRI4
CNSTI4 0
NEI4 $1546
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 7
EQI4 $1546
line 3749
;3749:		pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 3750
;3750:		pml.walking = qtrue;
ADDRGP4 pml+44
CNSTI4 1
ASGNI4
line 3751
;3751:	}
LABELV $1546
line 3754
;3752:
;3753:	// hitting solid ground will end a waterjump
;3754:	if (pm->ps->pm_flags & PMF_TIME_WATERJUMP)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1551
line 3755
;3755:	{
line 3756
;3756:		pm->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND);
ADDRLP4 1124
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1124
INDIRP4
ADDRLP4 1124
INDIRP4
INDIRI4
CNSTI4 -289
BANDI4
ASGNI4
line 3757
;3757:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 3758
;3758:	}
LABELV $1551
line 3760
;3759:
;3760:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1553
line 3762
;3761:		// just hit the ground
;3762:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1555
line 3763
;3763:			Com_Printf("%i:Land\n", c_pmove);
ADDRGP4 $1557
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 3764
;3764:		}
LABELV $1555
line 3767
;3765:
;3766:		// Thanks to Loda for making this fix and Daggo for pointing me to it.
;3767:		if ((trace.plane.normal[0] != 0.0f || trace.plane.normal[1] != 0.0f || trace.plane.normal[2] != 1.0f))// don't count them during special predict
ADDRLP4 1124
CNSTF4 0
ASGNF4
ADDRLP4 0+24
INDIRF4
ADDRLP4 1124
INDIRF4
NEF4 $1566
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1124
INDIRF4
NEF4 $1566
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1065353216
EQF4 $1558
LABELV $1566
line 3768
;3768:		{ // It's a ramp!
line 3769
;3769:			if (!pml.clipped)
ADDRGP4 pml+1176
INDIRI4
CNSTI4 0
NEI4 $1567
line 3770
;3770:			{
line 3775
;3771:				// TODO should we do more checks here to make sure it behaves same as normal clip would? 
;3772:				// the trace.plane.normal[2] != 1.0f check in particular seems sus no? since the slidemove stuff
;3773:				// works more with various dot products to determine whether to clip etc. oh well. fuck it.
;3774:
;3775:				if (pm->modParms.runFlags & RFL_NODEADRAMPS) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1570
line 3776
;3776:					if (pm->modParms.physics == MV_PINBALL) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 7
NEI4 $1572
line 3778
;3777:						//PM_LimitedClipVelocity(pm->ps->velocity, planes[i], pm->ps->velocity, overbounce,100000.0f);
;3778:						overbounce -= trace.plane.normal[2] * 0.6f * (MIN(1600.0f, fabsf(pm->ps->velocity[2])) / 1600.0f); // dont let ground and ceiling bounce as as insanely much.
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 1132
ADDRGP4 fabs
CALLF4
ASGNF4
CNSTF4 1153957888
ADDRLP4 1132
INDIRF4
GEF4 $1577
ADDRLP4 1128
CNSTF4 1153957888
ASGNF4
ADDRGP4 $1578
JUMPV
LABELV $1577
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 1136
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 1128
ADDRLP4 1136
INDIRF4
ASGNF4
LABELV $1578
ADDRLP4 1092
ADDRLP4 1092
INDIRF4
CNSTF4 1058642330
ADDRLP4 0+24+8
INDIRF4
MULF4
ADDRLP4 1128
INDIRF4
CNSTF4 1153957888
DIVF4
MULF4
SUBF4
ASGNF4
line 3779
;3779:						PM_LimitedClipVelocity2(pm->ps->velocity, trace.plane.normal, pm->ps->velocity, overbounce, 10000.0f);
ADDRLP4 1140
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 1092
INDIRF4
ARGF4
CNSTF4 1176256512
ARGF4
ADDRGP4 PM_LimitedClipVelocity2
CALLV
pop
line 3780
;3780:					}
ADDRGP4 $1573
JUMPV
LABELV $1572
line 3781
;3781:					else {
line 3782
;3782:						PM_ClipVelocity(pm->ps->velocity, trace.plane.normal, pm->ps->velocity, overbounce);
ADDRLP4 1128
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1092
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 3783
;3783:					}
LABELV $1573
line 3784
;3784:					PM_UpdateAntiLoop();
ADDRGP4 PM_UpdateAntiLoop
CALLV
pop
line 3785
;3785:					PM_CheckBounceJump(trace.plane.normal, pm->ps->velocity); // do we need this here? not sure.
ADDRLP4 0+24
ARGP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 PM_CheckBounceJump
CALLV
pop
line 3787
;3786:
;3787:					if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1568
line 3788
;3788:						Com_Printf("%i:Dead ramp fixed\n", c_pmove);
ADDRGP4 $1584
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 3789
;3789:					}
line 3790
;3790:				}
ADDRGP4 $1568
JUMPV
LABELV $1570
line 3791
;3791:				else {
line 3792
;3792:					if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1568
line 3793
;3793:						Com_Printf("%i:Dead ramp\n", c_pmove);
ADDRGP4 $1587
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 3794
;3794:					}
line 3795
;3795:				}
line 3801
;3796:#if JK2_CGAME
;3797:				if (pm->ps->commandTime > cg_rampCountLastCmdTime && !pm->isSpecialPredict) {
;3798:					cg_deadRampsCounted++;
;3799:				}
;3800:#endif
;3801:			}
ADDRGP4 $1568
JUMPV
LABELV $1567
line 3802
;3802:			else {
line 3803
;3803:				if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1588
line 3804
;3804:					Com_Printf("%i:Good ramp\n", c_pmove);
ADDRGP4 $1590
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 3805
;3805:				}
LABELV $1588
line 3811
;3806:#if JK2_CGAME
;3807:				if (pm->ps->commandTime > cg_rampCountLastCmdTime && !pm->isSpecialPredict) {
;3808:					cg_goodRampsCounted++;
;3809:				}
;3810:#endif
;3811:			}
LABELV $1568
line 3815
;3812:#if JK2_CGAME
;3813:			if(!pm->isSpecialPredict) cg_rampCountLastCmdTime = pm->ps->commandTime;
;3814:#endif
;3815:		}
LABELV $1558
line 3827
;3816:		
;3817:		/*if (moveStyle == MV_CHARGEJUMP && pm->cmd.upmove < 10 && !(pm->ps->pm_flags & PMF_JUMP_HELD) && !(pm->cmd.buttons & BUTTON_BOUNCEPOWER)) { //  TA instead of canceling the charging in air when nothing pressed, cancel when we land if we arent pressing jump and not pressing charge.
;3818:			if (!(pm->cmd.buttons & BUTTON_FORCEPOWER) ||
;3819:				pm->ps->fd.forcePowerSelected != FP_LEVITATION) {
;3820:				pm->ps->fd.forceJumpCharge = 0;
;3821:#if JK2_GAME
;3822:				G_MuteSound(pm->ps->fd.killSoundEntIndex[TRACK_CHANNEL_1 - 50], CHAN_VOICE);
;3823:#endif
;3824:			}
;3825:		}*/
;3826:
;3827:		PM_CrashLand();
ADDRGP4 PM_CrashLand
CALLV
pop
line 3830
;3828:
;3829:		// don't do landing time if we were just going down a slope
;3830:		if ( pml.previous_velocity[2] < -200 ) {
ADDRGP4 pml+1148+8
INDIRF4
CNSTF4 3276275712
GEF4 $1591
line 3832
;3831:			// don't allow another jump for a little while
;3832:			pm->ps->pm_flags |= PMF_TIME_LAND;
ADDRLP4 1128
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1128
INDIRP4
ADDRLP4 1128
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 3833
;3833:			pm->ps->pm_time = 250;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 250
ASGNI4
line 3834
;3834:		}
LABELV $1591
line 3835
;3835:	}
LABELV $1553
line 3837
;3836:
;3837:	if (!pml.bounceJumped && pm->modParms.physics != MV_PINBALL) {
ADDRGP4 pml+1188
INDIRI4
CNSTI4 0
NEI4 $1595
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 7
EQI4 $1595
line 3838
;3838:		PM_SetGroundEntityNum(trace.entityNum);
ADDRLP4 0+52
INDIRI4
ARGI4
ADDRGP4 PM_SetGroundEntityNum
CALLV
pop
line 3839
;3839:	}
LABELV $1595
line 3840
;3840:	pm->ps->lastOnGround = pm->cmd.serverTime;
ADDRLP4 1124
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
INDIRP4
CNSTI4 500
ADDP4
ADDRLP4 1124
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 3842
;3841:
;3842:	PM_AddTouchEnt( trace.entityNum );
ADDRLP4 0+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 3843
;3843:}
LABELV $1497
endproc PM_GroundTrace 1144 28
proc PM_SetWaterLevel 48 8
line 3851
;3844:
;3845:
;3846:/*
;3847:=============
;3848:PM_SetWaterLevel
;3849:=============
;3850:*/
;3851:static void PM_SetWaterLevel( void ) {
line 3860
;3852:	vec3_t		point;
;3853:	int			cont;
;3854:	int			sample1;
;3855:	int			sample2;
;3856:
;3857:	//
;3858:	// get waterlevel, accounting for ducking
;3859:	//
;3860:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 0
ASGNI4
line 3861
;3861:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 244
ADDP4
CNSTI4 0
ASGNI4
line 3863
;3862:
;3863:	point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 3864
;3864:	point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 3865
;3865:	point[2] = pm->ps->origin[2] + MINS_Z + 1;	
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3866
;3866:	cont = pm->pointcontents( point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 308
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 3868
;3867:
;3868:	if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
EQI4 $1603
line 3869
;3869:		sample2 = pm->ps->viewheight - MINS_Z;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 -24
SUBI4
ASGNI4
line 3870
;3870:		sample1 = sample2 / 2;
ADDRLP4 20
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 3872
;3871:
;3872:		pm->watertype = cont;
ADDRGP4 pm
INDIRP4
CNSTI4 244
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 3873
;3873:		pm->waterlevel = 1;
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 1
ASGNI4
line 3874
;3874:		point[2] = pm->ps->origin[2] + MINS_Z + sample1;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3875
;3875:		cont = pm->pointcontents (point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 308
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 3876
;3876:		if ( cont & MASK_WATER ) {
ADDRLP4 12
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
EQI4 $1606
line 3877
;3877:			pm->waterlevel = 2;
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3878
;3878:			point[2] = pm->ps->origin[2] + MINS_Z + sample2;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3879
;3879:			cont = pm->pointcontents (point, pm->ps->clientNum );
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 308
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 3880
;3880:			if ( cont & MASK_WATER ){
ADDRLP4 12
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
EQI4 $1609
line 3881
;3881:				pm->waterlevel = 3;
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 3
ASGNI4
line 3882
;3882:			}
LABELV $1609
line 3883
;3883:		}
LABELV $1606
line 3884
;3884:	}
LABELV $1603
line 3886
;3885:
;3886:}
LABELV $1600
endproc PM_SetWaterLevel 48 8
proc PM_CheckDuck 1112 28
line 3896
;3887:
;3888:/*
;3889:==============
;3890:PM_CheckDuck
;3891:
;3892:Sets mins, maxs, and pm->ps->viewheight
;3893:==============
;3894:*/
;3895:static void PM_CheckDuck (void)
;3896:{
line 3899
;3897:	trace_t	trace;
;3898:
;3899:	pm->mins[0] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 220
ADDP4
CNSTF4 3245342720
ASGNF4
line 3900
;3900:	pm->mins[1] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 224
ADDP4
CNSTF4 3245342720
ASGNF4
line 3902
;3901:
;3902:	pm->maxs[0] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 232
ADDP4
CNSTF4 1097859072
ASGNF4
line 3903
;3903:	pm->maxs[1] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 236
ADDP4
CNSTF4 1097859072
ASGNF4
line 3905
;3904:
;3905:	pm->mins[2] = MINS_Z;
ADDRGP4 pm
INDIRP4
CNSTI4 228
ADDP4
CNSTF4 3250585600
ASGNF4
line 3907
;3906:
;3907:	if (pm->ps->pm_type == PM_DEAD)
ADDRLP4 1080
CNSTI4 4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 1080
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $1612
line 3908
;3908:	{
line 3909
;3909:		pm->maxs[2] = -8;
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
CNSTF4 3238002688
ASGNF4
line 3910
;3910:		pm->ps->viewheight = DEAD_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 -16
ASGNI4
line 3911
;3911:		return;
ADDRGP4 $1611
JUMPV
LABELV $1612
line 3914
;3912:	}
;3913:
;3914:	if (pm->ps->usingATST)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1614
line 3915
;3915:	{
line 3916
;3916:		if (pm->cmd.upmove < 0)
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $1616
line 3917
;3917:		{
line 3918
;3918:			pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 3919
;3919:		}
LABELV $1616
line 3920
;3920:	}
LABELV $1614
line 3922
;3921:
;3922:	if (BG_InRoll(pm->ps, pm->ps->legsAnim))
ADDRLP4 1084
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRLP4 1084
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 1088
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $1618
line 3923
;3923:	{
line 3924
;3924:		pm->maxs[2] = CROUCH_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
CNSTF4 1098907648
ASGNF4
line 3925
;3925:		pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 36
ASGNI4
line 3926
;3926:		pm->ps->pm_flags &= ~PMF_DUCKED;
ADDRLP4 1092
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 3927
;3927:		pm->ps->pm_flags |= PMF_ROLLING;
ADDRLP4 1096
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1096
INDIRP4
ADDRLP4 1096
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 3928
;3928:		return;
ADDRGP4 $1611
JUMPV
LABELV $1618
line 3930
;3929:	}
;3930:	else if (pm->ps->pm_flags & PMF_ROLLING)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1620
line 3931
;3931:	{
line 3933
;3932:		// try to stand up
;3933:		pm->maxs[2] = DEFAULT_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
CNSTF4 1109393408
ASGNF4
line 3934
;3934:		pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask );
ADDRLP4 0
ARGP4
ADDRLP4 1092
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1096
ADDRLP4 1092
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1096
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1092
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1092
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1092
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1092
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 3935
;3935:		if (!trace.allsolid)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1621
line 3936
;3936:			pm->ps->pm_flags &= ~PMF_ROLLING;
ADDRLP4 1104
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1104
INDIRP4
ADDRLP4 1104
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 3937
;3937:	}
ADDRGP4 $1621
JUMPV
LABELV $1620
line 3938
;3938:	else if (pm->cmd.upmove < 0 ||
ADDRLP4 1092
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1092
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $1626
ADDRLP4 1092
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1624
LABELV $1626
line 3940
;3939:		pm->ps->forceHandExtend == HANDEXTEND_KNOCKDOWN)
;3940:	{	// duck
line 3941
;3941:		pm->ps->pm_flags |= PMF_DUCKED;
ADDRLP4 1096
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1096
INDIRP4
ADDRLP4 1096
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 3942
;3942:	}
ADDRGP4 $1625
JUMPV
LABELV $1624
line 3944
;3943:	else
;3944:	{	// stand up if possible 
line 3945
;3945:		if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1627
line 3946
;3946:		{
line 3948
;3947:			// try to stand up
;3948:			pm->maxs[2] = DEFAULT_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
CNSTF4 1109393408
ASGNF4
line 3949
;3949:			pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask );
ADDRLP4 0
ARGP4
ADDRLP4 1096
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1096
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1104
ADDRLP4 1100
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1100
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 3950
;3950:			if (!trace.allsolid)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1629
line 3951
;3951:				pm->ps->pm_flags &= ~PMF_DUCKED;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
LABELV $1629
line 3952
;3952:		}
LABELV $1627
line 3953
;3953:	}
LABELV $1625
LABELV $1621
line 3955
;3954:
;3955:	if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1631
line 3956
;3956:	{
line 3957
;3957:		pm->maxs[2] = CROUCH_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
CNSTF4 1098907648
ASGNF4
line 3958
;3958:		pm->ps->viewheight = CROUCH_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 12
ASGNI4
line 3959
;3959:	}
ADDRGP4 $1632
JUMPV
LABELV $1631
line 3960
;3960:	else if (pm->ps->pm_flags & PMF_ROLLING)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1633
line 3961
;3961:	{
line 3962
;3962:		pm->maxs[2] = CROUCH_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
CNSTF4 1098907648
ASGNF4
line 3963
;3963:		pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 36
ASGNI4
line 3964
;3964:	}
ADDRGP4 $1634
JUMPV
LABELV $1633
line 3966
;3965:	else
;3966:	{
line 3967
;3967:		pm->maxs[2] = DEFAULT_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
CNSTF4 1109393408
ASGNF4
line 3968
;3968:		pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 36
ASGNI4
line 3969
;3969:	}
LABELV $1634
LABELV $1632
line 3971
;3970:
;3971:	if (pm->ps->usingATST)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1635
line 3972
;3972:	{
line 3973
;3973:		pm->mins[0] = ATST_MINS0;
ADDRGP4 pm
INDIRP4
CNSTI4 220
ADDP4
CNSTF4 3256877056
ASGNF4
line 3974
;3974:		pm->mins[1] = ATST_MINS1;
ADDRGP4 pm
INDIRP4
CNSTI4 224
ADDP4
CNSTF4 3256877056
ASGNF4
line 3975
;3975:		pm->mins[2] = ATST_MINS2;
ADDRGP4 pm
INDIRP4
CNSTI4 228
ADDP4
CNSTF4 3250585600
ASGNF4
line 3977
;3976:
;3977:		pm->maxs[0] = ATST_MAXS0;
ADDRGP4 pm
INDIRP4
CNSTI4 232
ADDP4
CNSTF4 1109393408
ASGNF4
line 3978
;3978:		pm->maxs[1] = ATST_MAXS1;
ADDRGP4 pm
INDIRP4
CNSTI4 236
ADDP4
CNSTF4 1109393408
ASGNF4
line 3979
;3979:		pm->maxs[2] = ATST_MAXS2;
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
CNSTF4 1131937792
ASGNF4
line 3980
;3980:	}
LABELV $1635
line 3981
;3981:}
LABELV $1611
endproc PM_CheckDuck 1112 28
export PM_Use
proc PM_Use 4 0
line 3999
;3982:
;3983:
;3984:
;3985://===================================================================
;3986:
;3987:
;3988:
;3989:/*
;3990:==============
;3991:PM_Use
;3992:
;3993:Generates a use event
;3994:==============
;3995:*/
;3996:#define USE_DELAY 2000
;3997:
;3998:void PM_Use( void ) 
;3999:{
line 4000
;4000:	if ( pm->ps->useTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1638
line 4001
;4001:		pm->ps->useTime -= 100;//pm->cmd.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
LABELV $1638
line 4003
;4002:
;4003:	if ( pm->ps->useTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1640
line 4004
;4004:		return;
ADDRGP4 $1637
JUMPV
LABELV $1640
line 4007
;4005:	}
;4006:
;4007:	if ( ! (pm->cmd.buttons & BUTTON_USE ) )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1642
line 4008
;4008:	{
line 4009
;4009:		pm->useEvent = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 0
ASGNI4
line 4010
;4010:		pm->ps->useTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 0
ASGNI4
line 4011
;4011:		return;
ADDRGP4 $1637
JUMPV
LABELV $1642
line 4014
;4012:	}
;4013:
;4014:	pm->useEvent = EV_USE;
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 39
ASGNI4
line 4015
;4015:	pm->ps->useTime = USE_DELAY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 2000
ASGNI4
line 4016
;4016:}
LABELV $1637
endproc PM_Use 4 0
export PM_RunningAnim
proc PM_RunningAnim 16 0
line 4019
;4017:
;4018:qboolean PM_RunningAnim( int anim )
;4019:{
line 4020
;4020:	switch ( (anim&~ANIM_TOGGLEBIT) )
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 8
CNSTI4 833
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1648
ADDRLP4 0
INDIRI4
CNSTI4 836
EQI4 $1648
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1645
LABELV $1649
ADDRLP4 0
INDIRI4
CNSTI4 850
EQI4 $1648
ADDRLP4 0
INDIRI4
CNSTI4 854
EQI4 $1648
ADDRLP4 0
INDIRI4
CNSTI4 855
EQI4 $1648
ADDRGP4 $1645
JUMPV
line 4021
;4021:	{
LABELV $1648
line 4027
;4022:	case BOTH_RUN1:			
;4023:	case BOTH_RUN2:			
;4024:	case BOTH_RUNBACK1:			
;4025:	case BOTH_RUNBACK2:			
;4026:	case BOTH_RUNAWAY1:			
;4027:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1644
JUMPV
line 4028
;4028:		break;
LABELV $1645
line 4030
;4029:	}
;4030:	return qfalse;
CNSTI4 0
RETI4
LABELV $1644
endproc PM_RunningAnim 16 0
proc PM_Footsteps 88 16
line 4038
;4031:}
;4032:
;4033:/*
;4034:===============
;4035:PM_Footsteps
;4036:===============
;4037:*/
;4038:static void PM_Footsteps( void ) {
line 4042
;4039:	float		bobmove;
;4040:	int			old;
;4041:	// qboolean	footstep;
;4042:	int			setAnimFlags = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4044
;4043:
;4044:	if ( ((PM_InSaberAnim( (pm->ps->legsAnim&~ANIM_TOGGLEBIT) ) && !BG_SpinningSaberAnim( (pm->ps->legsAnim&~ANIM_TOGGLEBIT) )) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 12
ADDRGP4 PM_InSaberAnim
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1654
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1663
LABELV $1654
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 571
EQI4 $1663
ADDRLP4 20
INDIRI4
CNSTI4 587
EQI4 $1663
ADDRLP4 20
INDIRI4
CNSTI4 588
EQI4 $1663
ADDRLP4 20
INDIRI4
CNSTI4 573
EQI4 $1663
ADDRLP4 20
INDIRI4
CNSTI4 562
EQI4 $1663
ADDRLP4 20
INDIRI4
CNSTI4 563
EQI4 $1663
ADDRLP4 20
INDIRI4
CNSTI4 1038
EQI4 $1663
ADDRLP4 20
INDIRI4
CNSTI4 1039
EQI4 $1663
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 PM_LandingAnim
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $1663
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 28
ADDRGP4 PM_PainAnim
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $1651
LABELV $1663
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1651
line 4056
;4045:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_STAND1 
;4046:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_STAND1TO2 
;4047:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_STAND2TO1 
;4048:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_STAND2 
;4049:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_SABERFAST_STANCE
;4050:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_SABERSLOW_STANCE
;4051:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_BUTTON_HOLD
;4052:		|| (pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_BUTTON_RELEASE
;4053:		|| PM_LandingAnim( (pm->ps->legsAnim&~ANIM_TOGGLEBIT) ) 
;4054:		|| PM_PainAnim( (pm->ps->legsAnim&~ANIM_TOGGLEBIT) ))
;4055:		&& jk2gameplay != VERSION_1_02 )
;4056:	{//legs are in a saber anim, and not spinning, be sure to override it
line 4057
;4057:		setAnimFlags |= SETANIM_FLAG_OVERRIDE;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 4058
;4058:	}
LABELV $1651
line 4064
;4059:
;4060:	//
;4061:	// calculate speed and cycle to be used for
;4062:	// all cyclic walking effects
;4063:	//
;4064:	pm->xyspeed = sqrtf( pm->ps->velocity[0] * pm->ps->velocity[0]
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 44
ADDRLP4 36
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 40
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDRLP4 44
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 48
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 32
INDIRP4
CNSTI4 264
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 4067
;4065:		+  pm->ps->velocity[1] * pm->ps->velocity[1] );
;4066:
;4067:	if ( pm->ps->groundEntityNum == ENTITYNUM_NONE ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1664
line 4070
;4068:
;4069:		// airborne leaves position in cycle intact, but doesn't advance
;4070:		if ( pm->waterlevel > 1 )
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
LEI4 $1650
line 4071
;4071:		{ // MVSDK: Swimming is broken in 1.02, but let's NOT port the brokeness back in here for 1.02-gameplay. Most 1.02 mods apply the 1.04 behaviour anyway.
line 4072
;4072:			if (pm->xyspeed > 60)
ADDRGP4 pm
INDIRP4
CNSTI4 264
ADDP4
INDIRF4
CNSTF4 1114636288
LEF4 $1668
line 4073
;4073:			{
line 4074
;4074:				PM_ContinueLegsAnim( BOTH_SWIMFORWARD );
CNSTI4 981
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4075
;4075:			}
ADDRGP4 $1650
JUMPV
LABELV $1668
line 4077
;4076:			else
;4077:			{
line 4078
;4078:				PM_ContinueLegsAnim( BOTH_SWIM_IDLE1 );
CNSTI4 980
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4079
;4079:			}
line 4080
;4080:		}
line 4081
;4081:		return;
ADDRGP4 $1650
JUMPV
LABELV $1664
line 4085
;4082:	}
;4083:
;4084:	// if not trying to move
;4085:	if ( !pm->cmd.forwardmove && !pm->cmd.rightmove ) {
ADDRLP4 52
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 56
INDIRI4
NEI4 $1670
ADDRLP4 52
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 56
INDIRI4
NEI4 $1670
line 4086
;4086:		if (  pm->xyspeed < 5 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 264
ADDP4
INDIRF4
CNSTF4 1084227584
GEF4 $1650
line 4087
;4087:			pm->ps->bobCycle = 0;	// start at beginning of cycle again
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 4088
;4088:			if ( (pm->ps->pm_flags & PMF_DUCKED) || (pm->ps->pm_flags & PMF_ROLLING) ) {
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 64
INDIRI4
NEI4 $1676
ADDRLP4 60
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 64
INDIRI4
EQI4 $1674
LABELV $1676
line 4089
;4089:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_CROUCH1IDLE && jk2gameplay != VERSION_1_02)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 797
EQI4 $1677
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1677
line 4090
;4090:				{
line 4091
;4091:					PM_SetAnim(SETANIM_LEGS, BOTH_CROUCH1IDLE, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 797
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4092
;4092:				}
ADDRGP4 $1650
JUMPV
LABELV $1677
line 4094
;4093:				else
;4094:				{
line 4095
;4095:					PM_ContinueLegsAnim( BOTH_CROUCH1IDLE );
CNSTI4 797
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4096
;4096:				}
line 4097
;4097:			} else {
ADDRGP4 $1650
JUMPV
LABELV $1674
line 4098
;4098:				if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode == 1)
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1679
ADDRLP4 68
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1679
line 4099
;4099:				{
line 4100
;4100:					PM_ContinueLegsAnim( TORSO_WEAPONREADY4 );
CNSTI4 1102
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4101
;4101:				}
ADDRGP4 $1650
JUMPV
LABELV $1679
line 4103
;4102:				else
;4103:				{
line 4104
;4104:					if (pm->ps->weapon == WP_SABER && pm->ps->saberHolstered)
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1681
ADDRLP4 72
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1681
line 4105
;4105:					{
line 4106
;4106:						PM_ContinueLegsAnim( BOTH_STAND1 );
CNSTI4 571
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4107
;4107:					}
ADDRGP4 $1650
JUMPV
LABELV $1681
line 4108
;4108:					else if ( pm->ps->weapon == WP_SABER && pm->ps->dualBlade )
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1683
ADDRLP4 76
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1683
line 4109
;4109:					{
line 4110
;4110:						PM_ContinueLegsAnim( BOTH_STAND1 );
CNSTI4 571
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4111
;4111:					}
ADDRGP4 $1650
JUMPV
LABELV $1683
line 4113
;4112:					else
;4113:					{
line 4114
;4114:						PM_ContinueLegsAnim( WeaponReadyAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4115
;4115:					}
line 4116
;4116:				}
line 4117
;4117:			}
line 4118
;4118:		}
line 4119
;4119:		return;
ADDRGP4 $1650
JUMPV
LABELV $1670
line 4125
;4120:	}
;4121:	
;4122:
;4123:	// footstep = qfalse;
;4124:
;4125:	if ( pm->ps->pm_flags & PMF_DUCKED )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1685
line 4126
;4126:	{
line 4127
;4127:		int rolled = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 4129
;4128:
;4129:		bobmove = 0.5;	// ducked characters bob much faster
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 4131
;4130:
;4131:		if ( PM_RunningAnim( pm->ps->legsAnim ) && !BG_InRoll(pm->ps, pm->ps->legsAnim) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 PM_RunningAnim
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $1687
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $1687
line 4132
;4132:		{//roll!
line 4133
;4133:			rolled = PM_TryRoll();
ADDRLP4 76
ADDRGP4 PM_TryRoll
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 76
INDIRI4
ASGNI4
line 4134
;4134:		}
LABELV $1687
line 4135
;4135:		if ( !rolled )
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $1689
line 4136
;4136:		{ //if the roll failed or didn't attempt, do standard crouching anim stuff.
line 4137
;4137:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1691
line 4138
;4138:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_CROUCH1WALKBACK && jk2gameplay != VERSION_1_02)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 799
EQI4 $1693
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1693
line 4139
;4139:				{
line 4140
;4140:					PM_SetAnim(SETANIM_LEGS, BOTH_CROUCH1WALKBACK, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 799
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4141
;4141:				}
ADDRGP4 $1686
JUMPV
LABELV $1693
line 4143
;4142:				else
;4143:				{
line 4144
;4144:					PM_ContinueLegsAnim( BOTH_CROUCH1WALKBACK );
CNSTI4 799
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4145
;4145:				}
line 4146
;4146:			}
ADDRGP4 $1686
JUMPV
LABELV $1691
line 4147
;4147:			else {
line 4148
;4148:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_CROUCH1WALK && jk2gameplay != VERSION_1_02)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 798
EQI4 $1695
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1695
line 4149
;4149:				{
line 4150
;4150:					PM_SetAnim(SETANIM_LEGS, BOTH_CROUCH1WALK, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 798
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4151
;4151:				}
ADDRGP4 $1686
JUMPV
LABELV $1695
line 4153
;4152:				else
;4153:				{
line 4154
;4154:					PM_ContinueLegsAnim( BOTH_CROUCH1WALK );
CNSTI4 798
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4155
;4155:				}
line 4156
;4156:			}
line 4157
;4157:		}
ADDRGP4 $1686
JUMPV
LABELV $1689
line 4159
;4158:		else
;4159:		{ //otherwise send us into the roll
line 4160
;4160:			pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 4161
;4161:			pm->ps->legsAnim = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 0
ASGNI4
line 4162
;4162:			PM_SetAnim(SETANIM_BOTH,rolled,SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 150);
ADDRLP4 76
CNSTI4 3
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 150
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4163
;4163:			PM_AddEventWithParm( EV_ROLL, 0 );
CNSTI4 15
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 4164
;4164:			pm->maxs[2] = CROUCH_MAXS_2;
ADDRGP4 pm
INDIRP4
CNSTI4 240
ADDP4
CNSTF4 1098907648
ASGNF4
line 4165
;4165:			pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 36
ASGNI4
line 4166
;4166:			pm->ps->pm_flags &= ~PMF_DUCKED;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 4167
;4167:			pm->ps->pm_flags |= PMF_ROLLING;
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 4168
;4168:		}
line 4169
;4169:	}
ADDRGP4 $1686
JUMPV
LABELV $1685
line 4170
;4170:	else if ((pm->ps->pm_flags & PMF_ROLLING) && !BG_InRoll(pm->ps, pm->ps->legsAnim) &&
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1697
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $1697
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 PM_InRollComplete
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $1697
line 4172
;4171:		!PM_InRollComplete(pm->ps, pm->ps->legsAnim))
;4172:	{
line 4173
;4173:		bobmove = 0.5;	// ducked characters bob much faster
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 4175
;4174:
;4175:		if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1699
line 4176
;4176:		{
line 4177
;4177:			if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_CROUCH1WALKBACK && jk2gameplay != VERSION_1_02)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 799
EQI4 $1701
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1701
line 4178
;4178:			{
line 4179
;4179:				PM_SetAnim(SETANIM_LEGS, BOTH_CROUCH1WALKBACK, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 799
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4180
;4180:			}
ADDRGP4 $1698
JUMPV
LABELV $1701
line 4182
;4181:			else
;4182:			{
line 4183
;4183:				PM_ContinueLegsAnim( BOTH_CROUCH1WALKBACK );
CNSTI4 799
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4184
;4184:			}
line 4185
;4185:		}
ADDRGP4 $1698
JUMPV
LABELV $1699
line 4187
;4186:		else
;4187:		{
line 4188
;4188:			if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_CROUCH1WALK && jk2gameplay != VERSION_1_02)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 798
EQI4 $1703
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1703
line 4189
;4189:			{
line 4190
;4190:				PM_SetAnim(SETANIM_LEGS, BOTH_CROUCH1WALK, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 798
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4191
;4191:			}
ADDRGP4 $1698
JUMPV
LABELV $1703
line 4193
;4192:			else
;4193:			{
line 4194
;4194:				PM_ContinueLegsAnim( BOTH_CROUCH1WALK );
CNSTI4 798
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4195
;4195:			}
line 4196
;4196:		}
line 4197
;4197:	}
ADDRGP4 $1698
JUMPV
LABELV $1697
line 4199
;4198:	else
;4199:	{
line 4200
;4200:		if ( !( pm->cmd.buttons & BUTTON_WALKING ) ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $1705
line 4201
;4201:			bobmove = 0.4f;	// faster speeds bob faster
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 4202
;4202:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1707
line 4203
;4203:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_RUNBACK1 && jk2gameplay != VERSION_1_02)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 854
EQI4 $1709
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1709
line 4204
;4204:				{
line 4205
;4205:					PM_SetAnim(SETANIM_LEGS, BOTH_RUNBACK1, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 854
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4206
;4206:				}
ADDRGP4 $1706
JUMPV
LABELV $1709
line 4208
;4207:				else
;4208:				{
line 4209
;4209:					PM_ContinueLegsAnim( BOTH_RUNBACK1 );
CNSTI4 854
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4210
;4210:				}
line 4211
;4211:			}
ADDRGP4 $1706
JUMPV
LABELV $1707
line 4212
;4212:			else {
line 4213
;4213:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_RUN1 && jk2gameplay != VERSION_1_02)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 833
EQI4 $1711
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1711
line 4214
;4214:				{
line 4215
;4215:					PM_SetAnim(SETANIM_LEGS, BOTH_RUN1, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 833
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4216
;4216:				}
ADDRGP4 $1706
JUMPV
LABELV $1711
line 4218
;4217:				else
;4218:				{
line 4219
;4219:					PM_ContinueLegsAnim( BOTH_RUN1 );
CNSTI4 833
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4220
;4220:				}
line 4221
;4221:			}
line 4223
;4222:			// footstep = qtrue;
;4223:		} else {
ADDRGP4 $1706
JUMPV
LABELV $1705
line 4224
;4224:			bobmove = 0.2f;	// walking bobs slow
ADDRLP4 4
CNSTF4 1045220557
ASGNF4
line 4225
;4225:			if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1713
line 4226
;4226:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_WALKBACK1 && jk2gameplay != VERSION_1_02)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 852
EQI4 $1715
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1715
line 4227
;4227:				{
line 4228
;4228:					PM_SetAnim(SETANIM_LEGS, BOTH_WALKBACK1, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 852
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4229
;4229:				}
ADDRGP4 $1714
JUMPV
LABELV $1715
line 4231
;4230:				else
;4231:				{
line 4232
;4232:					PM_ContinueLegsAnim( BOTH_WALKBACK1 );
CNSTI4 852
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4233
;4233:				}
line 4234
;4234:			}
ADDRGP4 $1714
JUMPV
LABELV $1713
line 4235
;4235:			else {
line 4236
;4236:				if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) != BOTH_WALK1 && jk2gameplay != VERSION_1_02)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 822
EQI4 $1717
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1717
line 4237
;4237:				{
line 4238
;4238:					PM_SetAnim(SETANIM_LEGS, BOTH_WALK1, setAnimFlags, 100);
CNSTI4 2
ARGI4
CNSTI4 822
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4239
;4239:				}
ADDRGP4 $1718
JUMPV
LABELV $1717
line 4241
;4240:				else
;4241:				{
line 4242
;4242:					PM_ContinueLegsAnim( BOTH_WALK1 );
CNSTI4 822
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 4243
;4243:				}
LABELV $1718
line 4244
;4244:			}
LABELV $1714
line 4245
;4245:		}
LABELV $1706
line 4246
;4246:	}
LABELV $1698
LABELV $1686
line 4249
;4247:
;4248:	// check for footstep / splash sounds
;4249:	old = pm->ps->bobCycle;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 4250
;4250:	pm->ps->bobCycle = (int)( old + bobmove * pml.msec ) & 255;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
ADDRGP4 pml+40
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
CNSTI4 255
BANDI4
ASGNI4
line 4253
;4251:
;4252:	// if we just crossed a cycle boundary, play an apropriate footstep event
;4253:	if ( ( ( old + 64 ) ^ ( pm->ps->bobCycle + 64 ) ) & 128 )
ADDRLP4 76
CNSTI4 64
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
ADDI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
ADDI4
BXORI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1720
line 4254
;4254:	{
line 4255
;4255:		pm->ps->footstepTime = pm->cmd.serverTime + 300;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
INDIRP4
CNSTI4 1272
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 4256
;4256:		if ( pm->waterlevel == 1 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1722
line 4258
;4257:			// splashing
;4258:			PM_AddEvent( EV_FOOTSPLASH );
CNSTI4 4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 4259
;4259:		} else if ( pm->waterlevel == 2 ) {
ADDRGP4 $1723
JUMPV
LABELV $1722
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1724
line 4261
;4260:			// wading / swimming at surface
;4261:			PM_AddEvent( EV_SWIM );
CNSTI4 6
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 4262
;4262:		} else if ( pm->waterlevel == 3 ) {
ADDRGP4 $1725
JUMPV
LABELV $1724
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1726
line 4264
;4263:			// no sound when completely underwater
;4264:		}
LABELV $1726
LABELV $1725
LABELV $1723
line 4265
;4265:	}
LABELV $1720
line 4266
;4266:}
LABELV $1650
endproc PM_Footsteps 88 16
proc PM_WaterEvents 16 4
line 4275
;4267:
;4268:/*
;4269:==============
;4270:PM_WaterEvents
;4271:
;4272:Generate sound events for entering and leaving water
;4273:==============
;4274:*/
;4275:static void PM_WaterEvents( void ) {		// FIXME?
line 4279
;4276:	//
;4277:	// if just entered a water volume, play a sound
;4278:	//
;4279:	if (!pml.previous_waterlevel && pm->waterlevel) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 pml+1160
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1729
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1729
line 4280
;4280:		PM_AddEvent( EV_WATER_TOUCH );
CNSTI4 16
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 4281
;4281:	}
LABELV $1729
line 4286
;4282:
;4283:	//
;4284:	// if just completely exited a water volume, play a sound
;4285:	//
;4286:	if (pml.previous_waterlevel && !pm->waterlevel) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 pml+1160
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1732
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1732
line 4287
;4287:		PM_AddEvent( EV_WATER_LEAVE );
CNSTI4 17
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 4288
;4288:	}
LABELV $1732
line 4293
;4289:
;4290:	//
;4291:	// check for head just going under water
;4292:	//
;4293:	if (pml.previous_waterlevel != 3 && pm->waterlevel == 3) {
ADDRLP4 8
CNSTI4 3
ASGNI4
ADDRGP4 pml+1160
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1735
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $1735
line 4294
;4294:		PM_AddEvent( EV_WATER_UNDER );
CNSTI4 18
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 4295
;4295:	}
LABELV $1735
line 4300
;4296:
;4297:	//
;4298:	// check for head just coming out of water
;4299:	//
;4300:	if (pml.previous_waterlevel == 3 && pm->waterlevel != 3) {
ADDRLP4 12
CNSTI4 3
ASGNI4
ADDRGP4 pml+1160
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $1738
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1738
line 4301
;4301:		PM_AddEvent( EV_WATER_CLEAR );
CNSTI4 19
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 4302
;4302:	}
LABELV $1738
line 4303
;4303:}
LABELV $1728
endproc PM_WaterEvents 16 4
export PM_BeginWeaponChange
proc PM_BeginWeaponChange 8 4
line 4311
;4304:
;4305:
;4306:/*
;4307:===============
;4308:PM_BeginWeaponChange
;4309:===============
;4310:*/
;4311:void PM_BeginWeaponChange( int weapon ) {
line 4312
;4312:	if ( weapon <= WP_NONE || weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $1744
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1742
LABELV $1744
line 4313
;4313:		return;
ADDRGP4 $1741
JUMPV
LABELV $1742
line 4316
;4314:	}
;4315:
;4316:	if ( !( pm->ps->stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $1745
line 4317
;4317:		return;
ADDRGP4 $1741
JUMPV
LABELV $1745
line 4320
;4318:	}
;4319:	
;4320:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1747
line 4321
;4321:		return;
ADDRGP4 $1741
JUMPV
LABELV $1747
line 4325
;4322:	}
;4323:
;4324:	// turn of any kind of zooming when weapon switching.
;4325:	if (pm->ps->zoomMode)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1749
line 4326
;4326:	{
line 4327
;4327:		pm->ps->zoomMode = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 4328
;4328:		pm->ps->zoomTime = pm->ps->commandTime;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1336
ADDP4
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
line 4329
;4329:	}
LABELV $1749
line 4332
;4330:
;4331:	// If the player still got the rocket launcher locked on a target remove the lock.
;4332:	if ( pm->ps->rocketLockIndex != MAX_CLIENTS )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
CNSTI4 32
EQI4 $1751
line 4333
;4333:	{
line 4334
;4334:		pm->ps->rocketLockIndex = MAX_CLIENTS;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 32
ASGNI4
line 4335
;4335:		pm->ps->rocketLockTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 4336
;4336:		pm->ps->rocketTargetTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 592
ADDP4
CNSTF4 0
ASGNF4
line 4337
;4337:	}
LABELV $1751
line 4339
;4338:
;4339:	PM_AddEvent( EV_CHANGE_WEAPON );
CNSTI4 23
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 4340
;4340:	pm->ps->weaponstate = WEAPON_DROPPING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 2
ASGNI4
line 4341
;4341:	pm->ps->weaponTime += 200;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 4342
;4342:	PM_StartTorsoAnim( TORSO_DROPWEAP1 );
CNSTI4 1091
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 4343
;4343:}
LABELV $1741
endproc PM_BeginWeaponChange 8 4
export PM_FinishWeaponChange
proc PM_FinishWeaponChange 12 4
line 4351
;4344:
;4345:
;4346:/*
;4347:===============
;4348:PM_FinishWeaponChange
;4349:===============
;4350:*/
;4351:void PM_FinishWeaponChange( void ) {
line 4354
;4352:	int		weapon;
;4353:
;4354:	weapon = pm->cmd.weapon;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 4355
;4355:	if ( weapon < WP_NONE || weapon >= WP_NUM_WEAPONS ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1756
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1754
LABELV $1756
line 4356
;4356:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4357
;4357:	}
LABELV $1754
line 4359
;4358:
;4359:	if ( !( pm->ps->stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $1757
line 4360
;4360:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4361
;4361:	}
LABELV $1757
line 4363
;4362:
;4363:	if (weapon == WP_SABER)
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $1759
line 4364
;4364:	{
line 4365
;4365:		PM_SetSaberMove(LS_DRAW);
CNSTI4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 4366
;4366:	}
ADDRGP4 $1760
JUMPV
LABELV $1759
line 4368
;4367:	else
;4368:	{
line 4369
;4369:		PM_StartTorsoAnim( TORSO_RAISEWEAP1);
CNSTI4 1095
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 4370
;4370:	}
LABELV $1760
line 4371
;4371:	pm->ps->weapon = weapon;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 4372
;4372:	pm->ps->weaponstate = WEAPON_RAISING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 1
ASGNI4
line 4373
;4373:	pm->ps->weaponTime += 250;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 4374
;4374:}
LABELV $1753
endproc PM_FinishWeaponChange 12 4
proc PM_DoChargedWeapons 1212 28
line 4381
;4375:
;4376:
;4377:
;4378://---------------------------------------
;4379:static qboolean PM_DoChargedWeapons( void )
;4380://---------------------------------------
;4381:{
line 4384
;4382:	vec3_t		ang;
;4383:	trace_t		tr;
;4384:	qboolean	charging = qfalse,
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4385
;4385:				altFire = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4388
;4386:
;4387:
;4388:	if (pm->modParms.raceMode)
ADDRGP4 pm
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1762
line 4389
;4389:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1761
JUMPV
LABELV $1762
line 4392
;4390:
;4391:	// If you want your weapon to be a charging weapon, just set this bit up
;4392:	switch( pm->ps->weapon )
ADDRLP4 1100
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 3
LTI4 $1764
ADDRLP4 1100
INDIRI4
CNSTI4 11
GTI4 $1764
ADDRLP4 1100
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1837-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1837
address $1767
address $1764
address $1832
address $1770
address $1764
address $1829
address $1764
address $1773
address $1824
code
line 4393
;4393:	{
LABELV $1767
line 4398
;4394:	//------------------
;4395:	case WP_BRYAR_PISTOL:
;4396:
;4397:		// alt-fire charges the weapon
;4398:		if ( pm->cmd.buttons & BUTTON_ALT_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1765
line 4399
;4399:		{
line 4400
;4400:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 4401
;4401:			altFire = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4402
;4402:		}
line 4403
;4403:		break;
ADDRGP4 $1765
JUMPV
LABELV $1770
line 4409
;4404:	
;4405:	//------------------
;4406:	case WP_BOWCASTER:
;4407:
;4408:		// primary fire charges the weapon
;4409:		if ( pm->cmd.buttons & BUTTON_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1765
line 4410
;4410:		{
line 4411
;4411:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 4412
;4412:		}
line 4413
;4413:		break;
ADDRGP4 $1765
JUMPV
LABELV $1773
line 4420
;4414:	
;4415:	//------------------
;4416:	case WP_ROCKET_LAUNCHER:
;4417:
;4418:		// Not really a charge weapon, but we still want to delay fire until the button comes up so that we can
;4419:		//	implement our alt-fire locking stuff
;4420:		if ( (pm->cmd.buttons & BUTTON_ALT_ATTACK) && pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] >= weaponData[pm->ps->weapon].altEnergyPerShot )
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1112
CNSTI4 20
ASGNI4
ADDRLP4 1108
INDIRP4
ADDRLP4 1112
INDIRI4
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1765
ADDRLP4 1116
ADDRLP4 1108
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1120
CNSTI4 56
ADDRLP4 1116
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1120
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1116
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 1120
INDIRP4
ADDRLP4 1112
INDIRI4
ADDP4
INDIRI4
LTI4 $1765
line 4421
;4421:		{
line 4424
;4422:			vec3_t muzzleOffPoint, muzzlePoint, forward, right, up;
;4423:
;4424:			AngleVectors( pm->ps->viewangles, forward, right, up );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 1148
ARGP4
ADDRLP4 1160
ARGP4
ADDRLP4 1172
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4426
;4425:
;4426:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 4427
;4427:			altFire = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4429
;4428:
;4429:			AngleVectors(pm->ps->viewangles, ang, NULL, NULL);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 8
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
line 4431
;4430:
;4431:			VectorCopy( pm->ps->origin, muzzlePoint );
ADDRLP4 1124
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4432
;4432:			VectorCopy(WP_MuzzlePoint[WP_ROCKET_LAUNCHER], muzzleOffPoint);
ADDRLP4 1136
ADDRGP4 WP_MuzzlePoint+120
INDIRB
ASGNB 12
line 4434
;4433:
;4434:			VectorMA(muzzlePoint, muzzleOffPoint[0], forward, muzzlePoint);
ADDRLP4 1188
ADDRLP4 1136
INDIRF4
ASGNF4
ADDRLP4 1124
ADDRLP4 1124
INDIRF4
ADDRLP4 1148
INDIRF4
ADDRLP4 1188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1124+4
ADDRLP4 1124+4
INDIRF4
ADDRLP4 1148+4
INDIRF4
ADDRLP4 1188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1124+8
ADDRLP4 1124+8
INDIRF4
ADDRLP4 1148+8
INDIRF4
ADDRLP4 1136
INDIRF4
MULF4
ADDF4
ASGNF4
line 4435
;4435:			VectorMA(muzzlePoint, muzzleOffPoint[1], right, muzzlePoint);
ADDRLP4 1124
ADDRLP4 1124
INDIRF4
ADDRLP4 1160
INDIRF4
ADDRLP4 1136+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1124+4
ADDRLP4 1124+4
INDIRF4
ADDRLP4 1160+4
INDIRF4
ADDRLP4 1136+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1124+8
ADDRLP4 1124+8
INDIRF4
ADDRLP4 1160+8
INDIRF4
ADDRLP4 1136+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4436
;4436:			muzzlePoint[2] += pm->ps->viewheight + muzzleOffPoint[2];
ADDRLP4 1124+8
ADDRLP4 1124+8
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 1136+8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 4438
;4437:
;4438:			ang[0] = muzzlePoint[0] + ang[0]*2048;
ADDRLP4 8
ADDRLP4 1124
INDIRF4
CNSTF4 1157627904
ADDRLP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4439
;4439:			ang[1] = muzzlePoint[1] + ang[1]*2048;
ADDRLP4 8+4
ADDRLP4 1124+4
INDIRF4
CNSTF4 1157627904
ADDRLP4 8+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4440
;4440:			ang[2] = muzzlePoint[2] + ang[2]*2048;
ADDRLP4 8+8
ADDRLP4 1124+8
INDIRF4
CNSTF4 1157627904
ADDRLP4 8+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4442
;4441:
;4442:			pm->trace(&tr, muzzlePoint, NULL, NULL, ang, pm->ps->clientNum, MASK_PLAYERSOLID);
ADDRLP4 20
ARGP4
ADDRLP4 1124
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
ADDRLP4 8
ARGP4
ADDRLP4 1196
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1196
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRLP4 1196
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 4444
;4443:
;4444:			if (tr.fraction != 1 && tr.entityNum < MAX_CLIENTS && tr.entityNum != pm->ps->clientNum)
ADDRLP4 20+8
INDIRF4
CNSTF4 1065353216
EQF4 $1800
ADDRLP4 20+52
INDIRI4
CNSTI4 32
GEI4 $1800
ADDRLP4 20+52
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
EQI4 $1800
line 4445
;4445:			{
line 4446
;4446:				if (pm->ps->rocketLockIndex == MAX_CLIENTS)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
CNSTI4 32
NEI4 $1805
line 4447
;4447:				{
line 4448
;4448:					pm->ps->rocketLockIndex = tr.entityNum;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
ADDRLP4 20+52
INDIRI4
ASGNI4
line 4449
;4449:					pm->ps->rocketLockTime = pm->cmd.serverTime;
ADDRLP4 1200
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
ADDRLP4 1200
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 4450
;4450:				}
ADDRGP4 $1806
JUMPV
LABELV $1805
line 4451
;4451:				else if (pm->ps->rocketLockIndex != tr.entityNum && pm->ps->rocketTargetTime < pm->cmd.serverTime)
ADDRLP4 1200
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1204
ADDRLP4 1200
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ADDRLP4 20+52
INDIRI4
EQI4 $1808
ADDRLP4 1204
INDIRP4
CNSTI4 592
ADDP4
INDIRF4
ADDRLP4 1200
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
GEF4 $1808
line 4452
;4452:				{
line 4453
;4453:					pm->ps->rocketLockIndex = tr.entityNum;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
ADDRLP4 20+52
INDIRI4
ASGNI4
line 4454
;4454:					pm->ps->rocketLockTime = pm->cmd.serverTime;
ADDRLP4 1208
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
ADDRLP4 1208
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 4455
;4455:				}
ADDRGP4 $1809
JUMPV
LABELV $1808
line 4456
;4456:				else if (pm->ps->rocketLockIndex == tr.entityNum)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ADDRLP4 20+52
INDIRI4
NEI4 $1812
line 4457
;4457:				{
line 4458
;4458:					if (pm->ps->rocketLockTime == -1)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
INDIRF4
CNSTF4 3212836864
NEF4 $1815
line 4459
;4459:					{
line 4460
;4460:						pm->ps->rocketLockTime = pm->ps->rocketLastValidTime;
ADDRLP4 1208
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
CNSTI4 588
ADDP4
ADDRLP4 1208
INDIRP4
CNSTI4 584
ADDP4
INDIRF4
ASGNF4
line 4461
;4461:					}
LABELV $1815
line 4462
;4462:				}
LABELV $1812
LABELV $1809
LABELV $1806
line 4464
;4463:
;4464:				if (pm->ps->rocketLockIndex == tr.entityNum)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ADDRLP4 20+52
INDIRI4
NEI4 $1765
line 4465
;4465:				{
line 4466
;4466:					pm->ps->rocketTargetTime = pm->cmd.serverTime + 500;
ADDRLP4 1208
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
INDIRP4
CNSTI4 592
ADDP4
ADDRLP4 1208
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 4467
;4467:				}
line 4468
;4468:			}
ADDRGP4 $1765
JUMPV
LABELV $1800
line 4469
;4469:			else if (pm->ps->rocketTargetTime < pm->cmd.serverTime)
ADDRLP4 1200
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
INDIRP4
CNSTI4 592
ADDP4
INDIRF4
ADDRLP4 1200
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CVIF4 4
GEF4 $1820
line 4470
;4470:			{
line 4471
;4471:				pm->ps->rocketLockIndex = MAX_CLIENTS;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 32
ASGNI4
line 4472
;4472:				pm->ps->rocketLockTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 4473
;4473:			}
ADDRGP4 $1765
JUMPV
LABELV $1820
line 4475
;4474:			else
;4475:			{
line 4476
;4476:				if (pm->ps->rocketLockTime != -1)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
INDIRF4
CNSTF4 3212836864
EQF4 $1822
line 4477
;4477:				{
line 4478
;4478:					pm->ps->rocketLastValidTime = pm->ps->rocketLockTime;
ADDRLP4 1204
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CNSTI4 584
ADDP4
ADDRLP4 1204
INDIRP4
CNSTI4 588
ADDP4
INDIRF4
ASGNF4
line 4479
;4479:				}
LABELV $1822
line 4480
;4480:				pm->ps->rocketLockTime = -1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 3212836864
ASGNF4
line 4481
;4481:			}
line 4482
;4482:		}
line 4483
;4483:		break;
ADDRGP4 $1765
JUMPV
LABELV $1824
line 4488
;4484:
;4485:	//------------------
;4486:	case WP_THERMAL:
;4487:
;4488:		if ( pm->cmd.buttons & BUTTON_ALT_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1825
line 4489
;4489:		{
line 4490
;4490:			altFire = qtrue; // override default of not being an alt-fire
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4491
;4491:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 4492
;4492:		}
ADDRGP4 $1765
JUMPV
LABELV $1825
line 4493
;4493:		else if ( pm->cmd.buttons & BUTTON_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1765
line 4494
;4494:		{
line 4495
;4495:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 4496
;4496:		}
line 4497
;4497:		break;
ADDRGP4 $1765
JUMPV
LABELV $1829
line 4500
;4498:
;4499:	case WP_DEMP2:
;4500:		if ( pm->cmd.buttons & BUTTON_ALT_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1765
line 4501
;4501:		{
line 4502
;4502:			altFire = qtrue; // override default of not being an alt-fire
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4503
;4503:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 4504
;4504:		}
line 4505
;4505:		break;
ADDRGP4 $1765
JUMPV
LABELV $1832
line 4508
;4506:
;4507:	case WP_DISRUPTOR:
;4508:		if ((pm->cmd.buttons & BUTTON_ATTACK) &&
ADDRLP4 1124
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1128
CNSTI4 1
ASGNI4
ADDRLP4 1132
CNSTI4 0
ASGNI4
ADDRLP4 1124
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
BANDI4
ADDRLP4 1132
INDIRI4
EQI4 $1833
ADDRLP4 1136
ADDRLP4 1124
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
ADDRLP4 1128
INDIRI4
NEI4 $1833
ADDRLP4 1136
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ADDRLP4 1132
INDIRI4
EQI4 $1833
line 4511
;4509:			pm->ps->zoomMode == 1 &&
;4510:			pm->ps->zoomLocked)
;4511:		{
line 4512
;4512:			charging = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 4513
;4513:			altFire = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4514
;4514:		}
LABELV $1833
line 4516
;4515:
;4516:		if (pm->ps->zoomMode != 1 &&
ADDRLP4 1140
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1835
ADDRLP4 1140
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1835
line 4518
;4517:			pm->ps->weaponstate == WEAPON_CHARGING_ALT)
;4518:		{
line 4519
;4519:			pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 4520
;4520:			charging = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4521
;4521:			altFire = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4522
;4522:		}
LABELV $1835
line 4524
;4523:
;4524:	} // end switch
LABELV $1764
LABELV $1765
line 4529
;4525:
;4526:
;4527:	// set up the appropriate weapon state based on the button that's down.  
;4528:	//	Note that we ALWAYS return if charging is set ( meaning the buttons are still down )
;4529:	if ( charging )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1839
line 4530
;4530:	{
line 4531
;4531:		if ( altFire )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1841
line 4532
;4532:		{
line 4533
;4533:			if ( pm->ps->weaponstate != WEAPON_CHARGING_ALT )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 5
EQI4 $1843
line 4534
;4534:			{
line 4536
;4535:				// charge isn't started, so do it now
;4536:				pm->ps->weaponstate = WEAPON_CHARGING_ALT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 5
ASGNI4
line 4537
;4537:				pm->ps->weaponChargeTime = pm->cmd.serverTime;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 1108
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 4538
;4538:				pm->ps->weaponChargeSubtractTime = pm->cmd.serverTime + weaponData[pm->ps->weapon].altChargeSubTime;
ADDRLP4 1112
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1116
ADDRLP4 1112
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 1112
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 56
ADDRLP4 1116
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
CNSTI4 36
ADDP4
INDIRI4
ADDI4
ASGNI4
line 4543
;4539:
;4540:#ifdef _DEBUG
;4541:				Com_Printf("Starting charge\n");
;4542:#endif
;4543:				assert(pm->ps->weapon > WP_NONE);
line 4544
;4544:				BG_AddPredictableEventToPlayerstate(EV_WEAPON_CHARGE_ALT, pm->ps->weapon, pm->ps);
CNSTI4 96
ARGI4
ADDRLP4 1120
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 4545
;4545:			}
LABELV $1843
line 4547
;4546:
;4547:			if (pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] < (weaponData[pm->ps->weapon].altChargeSub+weaponData[pm->ps->weapon].altEnergyPerShot))
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1112
CNSTI4 56
ADDRLP4 1108
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1112
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1108
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 1112
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 1112
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDI4
GEI4 $1845
line 4548
;4548:			{
line 4549
;4549:				pm->ps->weaponstate = WEAPON_CHARGING_ALT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 5
ASGNI4
line 4551
;4550:
;4551:				goto rest;
ADDRGP4 $1847
JUMPV
LABELV $1845
line 4553
;4552:			}
;4553:			else if ((pm->cmd.serverTime - pm->ps->weaponChargeTime) < weaponData[pm->ps->weapon].altMaxCharge)
ADDRLP4 1116
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1120
ADDRLP4 1116
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 1120
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CNSTI4 56
ADDRLP4 1120
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
CNSTI4 52
ADDP4
INDIRI4
GEI4 $1842
line 4554
;4554:			{
line 4555
;4555:				if (pm->ps->weaponChargeSubtractTime < pm->cmd.serverTime)
ADDRLP4 1124
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 1124
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $1842
line 4556
;4556:				{
line 4557
;4557:					pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] -= weaponData[pm->ps->weapon].altChargeSub;
ADDRLP4 1128
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1132
CNSTI4 56
ADDRLP4 1128
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1136
ADDRLP4 1132
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1128
INDIRP4
CNSTI4 408
ADDP4
ADDP4
ASGNP4
ADDRLP4 1136
INDIRP4
ADDRLP4 1136
INDIRP4
INDIRI4
ADDRLP4 1132
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
SUBI4
ASGNI4
line 4558
;4558:					pm->ps->weaponChargeSubtractTime = pm->cmd.serverTime + weaponData[pm->ps->weapon].altChargeSubTime;
ADDRLP4 1140
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1144
ADDRLP4 1140
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 1140
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 56
ADDRLP4 1144
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
CNSTI4 36
ADDP4
INDIRI4
ADDI4
ASGNI4
line 4559
;4559:				}
line 4560
;4560:			}
line 4561
;4561:		}
ADDRGP4 $1842
JUMPV
LABELV $1841
line 4563
;4562:		else
;4563:		{
line 4564
;4564:			if ( pm->ps->weaponstate != WEAPON_CHARGING )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 4
EQI4 $1852
line 4565
;4565:			{
line 4567
;4566:				// charge isn't started, so do it now
;4567:				pm->ps->weaponstate = WEAPON_CHARGING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 4
ASGNI4
line 4568
;4568:				pm->ps->weaponChargeTime = pm->cmd.serverTime;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
ADDRLP4 1108
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 4569
;4569:				pm->ps->weaponChargeSubtractTime = pm->cmd.serverTime + weaponData[pm->ps->weapon].chargeSubTime;
ADDRLP4 1112
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1116
ADDRLP4 1112
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 1112
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 56
ADDRLP4 1116
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
CNSTI4 32
ADDP4
INDIRI4
ADDI4
ASGNI4
line 4574
;4570:
;4571:#ifdef _DEBUG
;4572:				Com_Printf("Starting charge\n");
;4573:#endif
;4574:				BG_AddPredictableEventToPlayerstate(EV_WEAPON_CHARGE, pm->ps->weapon, pm->ps);
CNSTI4 95
ARGI4
ADDRLP4 1120
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 4575
;4575:			}
LABELV $1852
line 4577
;4576:
;4577:			if (pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] < (weaponData[pm->ps->weapon].chargeSub+weaponData[pm->ps->weapon].energyPerShot))
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1112
CNSTI4 56
ADDRLP4 1108
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1112
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1108
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 1112
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRLP4 1112
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
GEI4 $1854
line 4578
;4578:			{
line 4579
;4579:				pm->ps->weaponstate = WEAPON_CHARGING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 4
ASGNI4
line 4581
;4580:
;4581:				goto rest;
ADDRGP4 $1847
JUMPV
LABELV $1854
line 4583
;4582:			}
;4583:			else if ((pm->cmd.serverTime - pm->ps->weaponChargeTime) < weaponData[pm->ps->weapon].maxCharge)
ADDRLP4 1116
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1120
ADDRLP4 1116
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1124
CNSTI4 48
ASGNI4
ADDRLP4 1116
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 1120
INDIRP4
ADDRLP4 1124
INDIRI4
ADDP4
INDIRI4
SUBI4
CNSTI4 56
ADDRLP4 1120
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ADDRLP4 1124
INDIRI4
ADDP4
INDIRI4
GEI4 $1856
line 4584
;4584:			{
line 4585
;4585:				if (pm->ps->weaponChargeSubtractTime < pm->cmd.serverTime)
ADDRLP4 1128
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 1128
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $1858
line 4586
;4586:				{
line 4587
;4587:					pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] -= weaponData[pm->ps->weapon].chargeSub;
ADDRLP4 1132
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1136
CNSTI4 56
ADDRLP4 1132
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 1140
ADDRLP4 1136
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
ADDP4
ASGNP4
ADDRLP4 1140
INDIRP4
ADDRLP4 1140
INDIRP4
INDIRI4
ADDRLP4 1136
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
SUBI4
ASGNI4
line 4588
;4588:					pm->ps->weaponChargeSubtractTime = pm->cmd.serverTime + weaponData[pm->ps->weapon].chargeSubTime;
ADDRLP4 1144
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1148
ADDRLP4 1144
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 1144
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 56
ADDRLP4 1148
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
CNSTI4 32
ADDP4
INDIRI4
ADDI4
ASGNI4
line 4589
;4589:				}
LABELV $1858
line 4590
;4590:			}
LABELV $1856
line 4591
;4591:		}
LABELV $1842
line 4593
;4592:
;4593:		return qtrue; // short-circuit rest of weapon code
CNSTI4 1
RETI4
ADDRGP4 $1761
JUMPV
LABELV $1839
LABELV $1847
line 4598
;4594:	}
;4595:rest:
;4596:	// Only charging weapons should be able to set these states...so....
;4597:	//	let's see which fire mode we need to set up now that the buttons are up
;4598:	if ( pm->ps->weaponstate == WEAPON_CHARGING )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1860
line 4599
;4599:	{
line 4606
;4600:		// weapon has a charge, so let us do an attack
;4601:#ifdef _DEBUG
;4602:		Com_Printf("Firing.  Charge time=%d\n", pm->cmd.serverTime - pm->ps->weaponChargeTime);
;4603:#endif
;4604:
;4605:		// dumb, but since we shoot a charged weapon on button-up, we need to repress this button for now
;4606:		pm->cmd.buttons |= BUTTON_ATTACK;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 4607
;4607:		pm->ps->eFlags |= EF_FIRING;
ADDRLP4 1112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1112
INDIRP4
ADDRLP4 1112
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 4608
;4608:	}
ADDRGP4 $1861
JUMPV
LABELV $1860
line 4609
;4609:	else if ( pm->ps->weaponstate == WEAPON_CHARGING_ALT )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1862
line 4610
;4610:	{
line 4617
;4611:		// weapon has a charge, so let us do an alt-attack
;4612:#ifdef _DEBUG
;4613:		Com_Printf("Firing.  Charge time=%d\n", pm->cmd.serverTime - pm->ps->weaponChargeTime);
;4614:#endif
;4615:
;4616:		// dumb, but since we shoot a charged weapon on button-up, we need to repress this button for now
;4617:		pm->cmd.buttons |= BUTTON_ALT_ATTACK;
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 4618
;4618:		pm->ps->eFlags |= (EF_FIRING|EF_ALT_FIRING);
ADDRLP4 1112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1112
INDIRP4
ADDRLP4 1112
INDIRP4
INDIRI4
CNSTI4 768
BORI4
ASGNI4
line 4619
;4619:	}
LABELV $1862
LABELV $1861
line 4621
;4620:
;4621:	return qfalse; // continue with the rest of the weapon code
CNSTI4 0
RETI4
LABELV $1761
endproc PM_DoChargedWeapons 1212 28
export PM_ItemUsable
proc PM_ItemUsable 1236 28
line 4629
;4622:}
;4623:
;4624:
;4625:#define BOWCASTER_CHARGE_UNIT	200.0f	// bowcaster charging gives us one more unit every 200ms--if you change this, you'll have to do the same in g_weapon
;4626:#define BRYAR_CHARGE_UNIT		200.0f	// bryar charging gives us one more unit every 200ms--if you change this, you'll have to do the same in g_weapon
;4627:
;4628:int PM_ItemUsable(playerState_t *ps, int forcedUse)
;4629:{
line 4636
;4630:	vec3_t fwd, fwdorg, dest, pos;
;4631:	vec3_t yawonly;
;4632:	vec3_t mins, maxs;
;4633:	vec3_t trtest;
;4634:	trace_t tr;
;4635:
;4636:	if (ps->usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1865
line 4637
;4637:	{
line 4638
;4638:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1865
line 4641
;4639:	}
;4640:
;4641:	if (ps->pm_flags & PMF_USE_ITEM_HELD)
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1867
line 4642
;4642:	{ //force to let go first
line 4643
;4643:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1867
line 4646
;4644:	}
;4645:
;4646:	if (ps->duelInProgress && jk2gameplay == VERSION_1_04)
ADDRFP4 0
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1869
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1869
line 4647
;4647:	{ //not allowed to use holdables while in a private duel.
line 4648
;4648:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1869
line 4651
;4649:	}
;4650:
;4651:	if (!forcedUse)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1871
line 4652
;4652:	{
line 4653
;4653:		forcedUse = bg_itemlist[ps->stats[STAT_HOLDABLE_ITEM]].giTag;
ADDRFP4 4
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
line 4654
;4654:	}
LABELV $1871
line 4656
;4655:
;4656:	switch (forcedUse)
ADDRLP4 1176
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 1
LTI4 $1874
ADDRLP4 1176
INDIRI4
CNSTI4 6
GTI4 $1874
ADDRLP4 1176
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1934-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1934
address $1882
address $1912
address $1876
address $1874
address $1874
address $1885
code
line 4657
;4657:	{
LABELV $1876
line 4659
;4658:	case HI_MEDPAC:
;4659:		if (ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH])
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 1180
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LTI4 $1877
line 4660
;4660:		{
line 4661
;4661:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1877
line 4663
;4662:		}
;4663:		if (ps->stats[STAT_HEALTH] <= 0 ||
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1188
CNSTI4 0
ASGNI4
ADDRLP4 1184
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 1188
INDIRI4
LEI4 $1881
ADDRLP4 1184
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1188
INDIRI4
EQI4 $1879
LABELV $1881
line 4665
;4664:			(ps->eFlags & EF_DEAD))
;4665:		{
line 4666
;4666:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1879
line 4669
;4667:		}
;4668:
;4669:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1882
line 4671
;4670:	case HI_SEEKER:
;4671:		if (ps->eFlags & EF_SEEKERDRONE)
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
EQI4 $1883
line 4672
;4672:		{
line 4673
;4673:			PM_AddEventWithParm(EV_ITEMUSEFAIL, SEEKER_ALREADYDEPLOYED);
CNSTI4 56
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 4674
;4674:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1883
line 4677
;4675:		}
;4676:
;4677:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1885
line 4679
;4678:	case HI_SENTRY_GUN:
;4679:		if (ps->fd.sentryDeployed)
ADDRFP4 0
INDIRP4
CNSTI4 1224
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1886
line 4680
;4680:		{
line 4681
;4681:			PM_AddEventWithParm(EV_ITEMUSEFAIL, SENTRY_ALREADYPLACED);
CNSTI4 56
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 4682
;4682:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1886
line 4685
;4683:		}
;4684:
;4685:		yawonly[ROLL] = 0;
ADDRLP4 1140+8
CNSTF4 0
ASGNF4
line 4686
;4686:		yawonly[PITCH] = 0;
ADDRLP4 1140
CNSTF4 0
ASGNF4
line 4687
;4687:		yawonly[YAW] = ps->viewangles[YAW];
ADDRLP4 1140+4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 4689
;4688:
;4689:		VectorSet( mins, -8, -8, 0 );
ADDRLP4 1192
CNSTF4 3238002688
ASGNF4
ADDRLP4 1092
ADDRLP4 1192
INDIRF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1192
INDIRF4
ASGNF4
ADDRLP4 1092+8
CNSTF4 0
ASGNF4
line 4690
;4690:		VectorSet( maxs, 8, 8, 24 );
ADDRLP4 1196
CNSTF4 1090519040
ASGNF4
ADDRLP4 1104
ADDRLP4 1196
INDIRF4
ASGNF4
ADDRLP4 1104+4
ADDRLP4 1196
INDIRF4
ASGNF4
ADDRLP4 1104+8
CNSTF4 1103101952
ASGNF4
line 4692
;4691:
;4692:		AngleVectors(yawonly, fwd, NULL, NULL);
ADDRLP4 1140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1200
CNSTP4 0
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4694
;4693:
;4694:		fwdorg[0] = ps->origin[0] + fwd[0]*64;
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 4695
;4695:		fwdorg[1] = ps->origin[1] + fwd[1]*64;
ADDRLP4 1116+4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4696
;4696:		fwdorg[2] = ps->origin[2] + fwd[2]*64;
ADDRLP4 1116+8
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4698
;4697:
;4698:		trtest[0] = fwdorg[0] + fwd[0]*16;
ADDRLP4 1152
ADDRLP4 1116
INDIRF4
CNSTF4 1098907648
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 4699
;4699:		trtest[1] = fwdorg[1] + fwd[1]*16;
ADDRLP4 1152+4
ADDRLP4 1116+4
INDIRF4
CNSTF4 1098907648
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 4700
;4700:		trtest[2] = fwdorg[2] + fwd[2]*16;
ADDRLP4 1152+8
ADDRLP4 1116+8
INDIRF4
CNSTF4 1098907648
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4702
;4701:
;4702:		pm->trace(&tr, ps->origin, mins, maxs, trtest, ps->clientNum, MASK_PLAYERSOLID);
ADDRLP4 12
ARGP4
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 1204
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 4704
;4703:
;4704:		if ((tr.fraction != 1 && tr.entityNum != ps->clientNum) || tr.startsolid || tr.allsolid)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $1910
ADDRLP4 12+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $1911
LABELV $1910
ADDRLP4 1208
CNSTI4 0
ASGNI4
ADDRLP4 12+4
INDIRI4
ADDRLP4 1208
INDIRI4
NEI4 $1911
ADDRLP4 12
INDIRI4
ADDRLP4 1208
INDIRI4
EQI4 $1904
LABELV $1911
line 4705
;4705:		{
line 4706
;4706:			PM_AddEventWithParm(EV_ITEMUSEFAIL, SENTRY_NOROOM);
CNSTI4 56
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 4707
;4707:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1904
line 4710
;4708:		}
;4709:
;4710:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1912
line 4712
;4711:	case HI_SHIELD:
;4712:		mins[0] = -8;
ADDRLP4 1092
CNSTF4 3238002688
ASGNF4
line 4713
;4713:		mins[1] = -8;
ADDRLP4 1092+4
CNSTF4 3238002688
ASGNF4
line 4714
;4714:		mins[2] = 0;
ADDRLP4 1092+8
CNSTF4 0
ASGNF4
line 4716
;4715:
;4716:		maxs[0] = 8;
ADDRLP4 1104
CNSTF4 1090519040
ASGNF4
line 4717
;4717:		maxs[1] = 8;
ADDRLP4 1104+4
CNSTF4 1090519040
ASGNF4
line 4718
;4718:		maxs[2] = 8;
ADDRLP4 1104+8
CNSTF4 1090519040
ASGNF4
line 4720
;4719:
;4720:		AngleVectors (ps->viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1212
CNSTP4 0
ASGNP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRLP4 1212
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4721
;4721:		fwd[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4722
;4722:		VectorMA(ps->origin, 64, fwd, dest);
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1220
CNSTF4 1115684864
ASGNF4
ADDRLP4 1128
ADDRLP4 1216
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1220
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1128+4
ADDRLP4 1216
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1220
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1128+8
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 4723
;4723:		pm->trace(&tr, ps->origin, mins, maxs, dest, ps->clientNum, MASK_SHOT );
ADDRLP4 12
ARGP4
ADDRLP4 1224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1224
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 4724
;4724:		if (tr.fraction > 0.9 && !tr.startsolid && !tr.allsolid)
ADDRLP4 12+8
INDIRF4
CNSTF4 1063675494
LEF4 $1922
ADDRLP4 1228
CNSTI4 0
ASGNI4
ADDRLP4 12+4
INDIRI4
ADDRLP4 1228
INDIRI4
NEI4 $1922
ADDRLP4 12
INDIRI4
ADDRLP4 1228
INDIRI4
NEI4 $1922
line 4725
;4725:		{
line 4726
;4726:			VectorCopy(tr.endpos, pos);
ADDRLP4 1164
ADDRLP4 12+12
INDIRB
ASGNB 12
line 4727
;4727:			VectorSet( dest, pos[0], pos[1], pos[2] - 4096 );
ADDRLP4 1128
ADDRLP4 1164
INDIRF4
ASGNF4
ADDRLP4 1128+4
ADDRLP4 1164+4
INDIRF4
ASGNF4
ADDRLP4 1128+8
ADDRLP4 1164+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 4728
;4728:			pm->trace( &tr, pos, mins, maxs, dest, ps->clientNum, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1128
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 4729
;4729:			if ( !tr.startsolid && !tr.allsolid )
ADDRLP4 1232
CNSTI4 0
ASGNI4
ADDRLP4 12+4
INDIRI4
ADDRLP4 1232
INDIRI4
NEI4 $1931
ADDRLP4 12
INDIRI4
ADDRLP4 1232
INDIRI4
NEI4 $1931
line 4730
;4730:			{
line 4731
;4731:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1931
line 4733
;4732:			}
;4733:		}
LABELV $1922
line 4734
;4734:		PM_AddEventWithParm(EV_ITEMUSEFAIL, SHIELD_NOROOM);
CNSTI4 56
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 4735
;4735:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1864
JUMPV
LABELV $1874
line 4737
;4736:	default:
;4737:		return 1;
CNSTI4 1
RETI4
LABELV $1864
endproc PM_ItemUsable 1236 28
proc PM_Weapon 160 16
line 4749
;4738:	}
;4739:}
;4740:
;4741:/*
;4742:==============
;4743:PM_Weapon
;4744:
;4745:Generates weapon events and modifes the weapon counter
;4746:==============
;4747:*/
;4748:static void PM_Weapon( void )
;4749:{
line 4752
;4750:	int		addTime;
;4751:	int amount;
;4752:	int		killAfterItem = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4754
;4753:
;4754:	if (pm->ps->usingATST)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1937
line 4755
;4755:	{
line 4756
;4756:		if ( pm->ps->weaponTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1939
line 4757
;4757:		{
line 4758
;4758:			pm->ps->weaponTime -= pml.msec;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 4759
;4759:		}
LABELV $1939
line 4761
;4760:
;4761:		if (pm->ps->weaponTime < 1 && (pm->cmd.buttons & (BUTTON_ATTACK|BUTTON_ALT_ATTACK)))
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1936
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 129
BANDI4
CNSTI4 0
EQI4 $1936
line 4762
;4762:		{
line 4763
;4763:			pm->ps->weaponTime += 500;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4765
;4764:
;4765:			if (pm->ps->atstAltFire)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1944
line 4766
;4766:			{
line 4767
;4767:				PM_AddEvent( EV_ALT_FIRE );
CNSTI4 25
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 4768
;4768:				pm->ps->atstAltFire = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1320
ADDP4
CNSTI4 0
ASGNI4
line 4769
;4769:			}
ADDRGP4 $1936
JUMPV
LABELV $1944
line 4771
;4770:			else
;4771:			{
line 4772
;4772:				PM_AddEvent( EV_FIRE_WEAPON );
CNSTI4 24
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 4773
;4773:				pm->ps->atstAltFire = qtrue;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1320
ADDP4
CNSTI4 1
ASGNI4
line 4774
;4774:			}
line 4775
;4775:		}
line 4777
;4776:
;4777:		return;
ADDRGP4 $1936
JUMPV
LABELV $1937
line 4780
;4778:	}
;4779:
;4780:	if (pm->ps->weapon != WP_DISRUPTOR && pm->ps->weapon != WP_ROCKET_LAUNCHER)
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 5
EQI4 $1946
ADDRLP4 12
INDIRI4
CNSTI4 10
EQI4 $1946
line 4781
;4781:	{ //check for exceeding max charge time if not using disruptor or rocket launcher
line 4782
;4782:		if ( pm->ps->weaponstate == WEAPON_CHARGING_ALT )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1948
line 4783
;4783:		{
line 4784
;4784:			int timeDif = (pm->cmd.serverTime - pm->ps->weaponChargeTime);
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
ASGNI4
line 4786
;4785:
;4786:			if (timeDif > MAX_WEAPON_CHARGE_TIME)
ADDRLP4 16
INDIRI4
CNSTI4 5000
LEI4 $1950
line 4787
;4787:			{
line 4788
;4788:				pm->cmd.buttons &= ~BUTTON_ALT_ATTACK;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 4789
;4789:			}
LABELV $1950
line 4790
;4790:		}
LABELV $1948
line 4792
;4791:
;4792:		if ( pm->ps->weaponstate == WEAPON_CHARGING )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1952
line 4793
;4793:		{
line 4794
;4794:			int timeDif = (pm->cmd.serverTime - pm->ps->weaponChargeTime);
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
ASGNI4
line 4796
;4795:
;4796:			if (timeDif > MAX_WEAPON_CHARGE_TIME)
ADDRLP4 16
INDIRI4
CNSTI4 5000
LEI4 $1954
line 4797
;4797:			{
line 4798
;4798:				pm->cmd.buttons &= ~BUTTON_ATTACK;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 4799
;4799:			}
LABELV $1954
line 4800
;4800:		}
LABELV $1952
line 4801
;4801:	}
LABELV $1946
line 4803
;4802:
;4803:	if (pm->ps->forceHandExtend == HANDEXTEND_WEAPONREADY)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 6
NEI4 $1956
line 4804
;4804:	{ //reset into weapon stance
line 4805
;4805:		if (pm->ps->weapon != WP_SABER)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1958
line 4806
;4806:		{ //saber handles its own anims
line 4807
;4807:			if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode == 1)
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1960
ADDRLP4 16
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1960
line 4808
;4808:			{
line 4810
;4809:				//PM_StartTorsoAnim( TORSO_WEAPONREADY4 );
;4810:				PM_StartTorsoAnim( TORSO_RAISEWEAP1);
CNSTI4 1095
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 4811
;4811:			}
ADDRGP4 $1961
JUMPV
LABELV $1960
line 4813
;4812:			else
;4813:			{
line 4814
;4814:				if (pm->ps->weapon == WP_EMPLACED_GUN)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $1962
line 4815
;4815:				{
line 4816
;4816:					PM_StartTorsoAnim( BOTH_GUNSIT1 );
CNSTI4 810
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 4817
;4817:				}
ADDRGP4 $1963
JUMPV
LABELV $1962
line 4819
;4818:				else
;4819:				{
line 4821
;4820:					//PM_StartTorsoAnim( WeaponReadyAnim[pm->ps->weapon] );
;4821:					PM_StartTorsoAnim( TORSO_RAISEWEAP1);
CNSTI4 1095
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 4822
;4822:				}
LABELV $1963
line 4823
;4823:			}
LABELV $1961
line 4824
;4824:		}
LABELV $1958
line 4828
;4825:
;4826:		//we now go into a weapon raise anim after every force hand extend.
;4827:		//this is so that my holster-view-weapon-when-hand-extend stuff works.
;4828:		pm->ps->weaponstate = WEAPON_RAISING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 1
ASGNI4
line 4829
;4829:		pm->ps->weaponTime += 250;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 4831
;4830:
;4831:		pm->ps->forceHandExtend = HANDEXTEND_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 0
ASGNI4
line 4832
;4832:	}
ADDRGP4 $1957
JUMPV
LABELV $1956
line 4833
;4833:	else if (pm->ps->forceHandExtend != HANDEXTEND_NONE)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1964
line 4834
;4834:	{ //nothing else should be allowed to happen during this time, including weapon fire
line 4835
;4835:		int desiredAnim = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 4836
;4836:		qboolean seperateOnTorso = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 4837
;4837:		int desiredOnTorso = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 4839
;4838:
;4839:		switch(pm->ps->forceHandExtend)
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
LTI4 $1966
ADDRLP4 28
INDIRI4
CNSTI4 10
GTI4 $1966
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1990-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1990
address $1969
address $1970
address $1971
address $1972
address $1973
address $1966
address $1974
address $1975
address $1988
address $1989
code
line 4840
;4840:		{
LABELV $1969
line 4842
;4841:		case HANDEXTEND_FORCEPUSH:
;4842:			desiredAnim = BOTH_FORCEPUSH;
ADDRLP4 16
CNSTI4 1041
ASGNI4
line 4843
;4843:			break;
ADDRGP4 $1967
JUMPV
LABELV $1970
line 4845
;4844:		case HANDEXTEND_FORCEPULL:
;4845:			desiredAnim = BOTH_FORCEPULL;
ADDRLP4 16
CNSTI4 1042
ASGNI4
line 4846
;4846:			break;
ADDRGP4 $1967
JUMPV
LABELV $1971
line 4848
;4847:		case HANDEXTEND_FORCEGRIP:
;4848:			desiredAnim = BOTH_FORCEGRIP_HOLD;
ADDRLP4 16
CNSTI4 1056
ASGNI4
line 4849
;4849:			break;
ADDRGP4 $1967
JUMPV
LABELV $1972
line 4851
;4850:		case HANDEXTEND_SABERPULL:
;4851:			desiredAnim = BOTH_SABERPULL;
ADDRLP4 16
CNSTI4 1052
ASGNI4
line 4852
;4852:			break;
ADDRGP4 $1967
JUMPV
LABELV $1973
line 4854
;4853:		case HANDEXTEND_CHOKE:
;4854:			desiredAnim = BOTH_CHOKE3; //left-handed choke
ADDRLP4 16
CNSTI4 1032
ASGNI4
line 4855
;4855:			break;
ADDRGP4 $1967
JUMPV
LABELV $1974
line 4857
;4856:		case HANDEXTEND_DODGE:
;4857:			desiredAnim = pm->ps->forceDodgeAnim;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
ASGNI4
line 4858
;4858:			break;
ADDRGP4 $1967
JUMPV
LABELV $1975
line 4860
;4859:		case HANDEXTEND_KNOCKDOWN:
;4860:			if (pm->ps->forceDodgeAnim)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1976
line 4861
;4861:			{
line 4862
;4862:				if (pm->ps->forceDodgeAnim > 4 && jk2gameplay == VERSION_1_04) // MVSDK: This should be enough to have the "seperateOnTorso" behaviour only with 1.04 gameplay
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LEI4 $1978
ADDRGP4 jk2gameplay
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1978
line 4863
;4863:				{ //this means that we want to play a sepereate anim on the torso
line 4864
;4864:					int originalDAnim = pm->ps->forceDodgeAnim-8; //-8 is the original legs anim
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 4865
;4865:					if (originalDAnim == 2)
ADDRLP4 40
INDIRI4
CNSTI4 2
NEI4 $1980
line 4866
;4866:					{
line 4867
;4867:						desiredAnim = BOTH_FORCE_GETUP_B1;
ADDRLP4 16
CNSTI4 938
ASGNI4
line 4868
;4868:					}
ADDRGP4 $1981
JUMPV
LABELV $1980
line 4869
;4869:					else if (originalDAnim == 3)
ADDRLP4 40
INDIRI4
CNSTI4 3
NEI4 $1982
line 4870
;4870:					{
line 4871
;4871:						desiredAnim = BOTH_FORCE_GETUP_B3;
ADDRLP4 16
CNSTI4 940
ASGNI4
line 4872
;4872:					}
ADDRGP4 $1983
JUMPV
LABELV $1982
line 4874
;4873:					else
;4874:					{
line 4875
;4875:						desiredAnim = BOTH_GETUP1;
ADDRLP4 16
CNSTI4 929
ASGNI4
line 4876
;4876:					}
LABELV $1983
LABELV $1981
line 4879
;4877:
;4878:					//now specify the torso anim
;4879:					seperateOnTorso = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 4880
;4880:					desiredOnTorso = BOTH_FORCEPUSH;
ADDRLP4 24
CNSTI4 1041
ASGNI4
line 4881
;4881:				}
ADDRGP4 $1967
JUMPV
LABELV $1978
line 4882
;4882:				else if (pm->ps->forceDodgeAnim == 2)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1984
line 4883
;4883:				{
line 4884
;4884:					desiredAnim = BOTH_FORCE_GETUP_B1;
ADDRLP4 16
CNSTI4 938
ASGNI4
line 4885
;4885:				}
ADDRGP4 $1967
JUMPV
LABELV $1984
line 4886
;4886:				else if (pm->ps->forceDodgeAnim == 3)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1986
line 4887
;4887:				{
line 4888
;4888:					desiredAnim = BOTH_FORCE_GETUP_B3;
ADDRLP4 16
CNSTI4 940
ASGNI4
line 4889
;4889:				}
ADDRGP4 $1967
JUMPV
LABELV $1986
line 4891
;4890:				else
;4891:				{
line 4892
;4892:					desiredAnim = BOTH_GETUP1;
ADDRLP4 16
CNSTI4 929
ASGNI4
line 4893
;4893:				}
line 4894
;4894:			}
ADDRGP4 $1967
JUMPV
LABELV $1976
line 4896
;4895:			else
;4896:			{
line 4897
;4897:				desiredAnim = BOTH_KNOCKDOWN1;
ADDRLP4 16
CNSTI4 924
ASGNI4
line 4898
;4898:			}
line 4899
;4899:			break;
ADDRGP4 $1967
JUMPV
LABELV $1988
line 4901
;4900:		case HANDEXTEND_DUELCHALLENGE:
;4901:			desiredAnim = BOTH_ENGAGETAUNT;
ADDRLP4 16
CNSTI4 904
ASGNI4
line 4902
;4902:			break;
ADDRGP4 $1967
JUMPV
LABELV $1989
line 4904
;4903:		case HANDEXTEND_TAUNT:
;4904:			desiredAnim = pm->ps->forceDodgeAnim;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
ASGNI4
line 4905
;4905:			break;
ADDRGP4 $1967
JUMPV
LABELV $1966
line 4918
;4906:			//Hmm... maybe use these, too?
;4907:			//BOTH_FORCEHEAL_QUICK //quick heal (SP level 2 & 3)
;4908:			//BOTH_MINDTRICK1 // wave (maybe for mind trick 2 & 3 - whole area, and for force seeing)
;4909:			//BOTH_MINDTRICK2 // tap (maybe for mind trick 1 - one person)
;4910:			//BOTH_FORCEGRIP_START //start grip
;4911:			//BOTH_FORCEGRIP_HOLD //hold grip
;4912:			//BOTH_FORCEGRIP_RELEASE //release grip
;4913:			//BOTH_FORCELIGHTNING //quick lightning burst (level 1)
;4914:			//BOTH_FORCELIGHTNING_START //start lightning
;4915:			//BOTH_FORCELIGHTNING_HOLD //hold lightning
;4916:			//BOTH_FORCELIGHTNING_RELEASE //release lightning
;4917:		default:
;4918:			desiredAnim = BOTH_FORCEPUSH;
ADDRLP4 16
CNSTI4 1041
ASGNI4
line 4919
;4919:			break;
LABELV $1967
line 4922
;4920:		}
;4921:
;4922:		if (!seperateOnTorso)
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $1992
line 4923
;4923:		{ //of seperateOnTorso, handle it after setting the legs
line 4924
;4924:			PM_SetAnim(SETANIM_TORSO, desiredAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 100);
CNSTI4 1
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4925
;4925:			pm->ps->torsoTimer = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 1
ASGNI4
line 4926
;4926:		}
LABELV $1992
line 4928
;4927:
;4928:		if (pm->ps->forceHandExtend == HANDEXTEND_DODGE || pm->ps->forceHandExtend == HANDEXTEND_KNOCKDOWN ||
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 7
EQI4 $1997
ADDRLP4 40
INDIRI4
CNSTI4 8
EQI4 $1997
ADDRLP4 40
INDIRI4
CNSTI4 5
NEI4 $1936
ADDRLP4 36
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1936
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1936
LABELV $1997
line 4930
;4929:			((pm->ps->forceHandExtend == HANDEXTEND_CHOKE && pm->ps->groundEntityNum == ENTITYNUM_NONE) && jk2gameplay != VERSION_1_02) )
;4930:		{ //special case, play dodge anim on whole body, choke anim too if off ground
line 4931
;4931:			if (seperateOnTorso)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1998
line 4932
;4932:			{
line 4933
;4933:				PM_SetAnim(SETANIM_LEGS, desiredAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 100);
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4934
;4934:				pm->ps->legsTimer = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 4936
;4935:
;4936:				PM_SetAnim(SETANIM_TORSO, desiredOnTorso, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 100);
CNSTI4 1
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4937
;4937:				pm->ps->torsoTimer = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 1
ASGNI4
line 4938
;4938:			}
ADDRGP4 $1936
JUMPV
LABELV $1998
line 4940
;4939:			else
;4940:			{
line 4941
;4941:				PM_SetAnim(SETANIM_LEGS, desiredAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 100);
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 4942
;4942:				pm->ps->legsTimer = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 4943
;4943:			}
line 4944
;4944:		}
line 4946
;4945:
;4946:		return;
ADDRGP4 $1936
JUMPV
LABELV $1964
LABELV $1957
line 4949
;4947:	}
;4948:
;4949:	if (BG_InSpecialJump(pm->ps->legsAnim, pm->modParms.runFlags) ||
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2003
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2003
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 PM_InRollComplete
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2000
LABELV $2003
line 4952
;4950:		BG_InRoll(pm->ps, pm->ps->legsAnim) ||
;4951:		PM_InRollComplete(pm->ps, pm->ps->legsAnim))
;4952:	{
line 4953
;4953:		pm->cmd.weapon = WP_SABER;
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
CNSTU1 2
ASGNU1
line 4954
;4954:		pm->ps->weapon = WP_SABER;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 4955
;4955:	}
LABELV $2000
line 4957
;4956:
;4957:	if (pm->ps->duelInProgress)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2004
line 4958
;4958:	{
line 4959
;4959:		pm->cmd.weapon = WP_SABER;
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
CNSTU1 2
ASGNU1
line 4960
;4960:		pm->ps->weapon = WP_SABER;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 4962
;4961:
;4962:		if (pm->ps->duelTime >= pm->cmd.serverTime)
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $2006
line 4963
;4963:		{
line 4964
;4964:			pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 4965
;4965:			pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 4966
;4966:			pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 4967
;4967:		}
LABELV $2006
line 4968
;4968:	}
LABELV $2004
line 4970
;4969:
;4970:	if (pm->ps->weapon == WP_SABER && pm->ps->saberMove != LS_READY && pm->ps->saberMove != LS_NONE)
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2008
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
EQI4 $2008
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2008
line 4971
;4971:	{
line 4972
;4972:		pm->cmd.weapon = WP_SABER; //don't allow switching out mid-attack
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
CNSTU1 2
ASGNU1
line 4973
;4973:	}
LABELV $2008
line 4975
;4974:
;4975:	if (pm->ps->weapon == WP_SABER)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2010
line 4976
;4976:	{
line 4978
;4977:		//rww - we still need the item stuff, so we won't return immediately
;4978:		PM_WeaponLightsaber();
ADDRGP4 PM_WeaponLightsaber
CALLV
pop
line 4979
;4979:		killAfterItem = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 4980
;4980:	}
ADDRGP4 $2011
JUMPV
LABELV $2010
line 4982
;4981:	else
;4982:	{
line 4983
;4983:		pm->ps->saberHolstered = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 0
ASGNI4
line 4984
;4984:	}
LABELV $2011
line 4986
;4985:
;4986:	if (pm->ps->weapon == WP_THERMAL ||
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 11
EQI4 $2015
ADDRLP4 48
INDIRI4
CNSTI4 12
EQI4 $2015
ADDRLP4 48
INDIRI4
CNSTI4 13
NEI4 $2012
LABELV $2015
line 4989
;4987:		pm->ps->weapon == WP_TRIP_MINE ||
;4988:		pm->ps->weapon == WP_DET_PACK)
;4989:	{
line 4990
;4990:		if (pm->ps->weapon == WP_THERMAL)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 11
NEI4 $2016
line 4991
;4991:		{
line 4992
;4992:			if ((pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == WeaponAttackAnim[pm->ps->weapon] &&
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ADDRLP4 52
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponAttackAnim
ADDP4
INDIRI4
NEI4 $2017
ADDRLP4 52
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 200
SUBI4
CNSTI4 0
GTI4 $2017
line 4994
;4993:				(pm->ps->weaponTime-200) <= 0)
;4994:			{
line 4995
;4995:				PM_StartTorsoAnim( WeaponReadyAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 4996
;4996:			}
line 4997
;4997:		}
ADDRGP4 $2017
JUMPV
LABELV $2016
line 4999
;4998:		else
;4999:		{
line 5000
;5000:			if ((pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == WeaponAttackAnim[pm->ps->weapon] &&
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ADDRLP4 52
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponAttackAnim
ADDP4
INDIRI4
NEI4 $2020
ADDRLP4 52
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 700
SUBI4
CNSTI4 0
GTI4 $2020
line 5002
;5001:				(pm->ps->weaponTime-700) <= 0)
;5002:			{
line 5003
;5003:				PM_StartTorsoAnim( WeaponReadyAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 5004
;5004:			}
LABELV $2020
line 5005
;5005:		}
LABELV $2017
line 5006
;5006:	}
LABELV $2012
line 5009
;5007:
;5008:	// don't allow attack until all buttons are up
;5009:	if ( pm->ps->pm_flags & PMF_RESPAWNED ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2022
line 5010
;5010:		return;
ADDRGP4 $1936
JUMPV
LABELV $2022
line 5014
;5011:	}
;5012:
;5013:	// ignore if spectator
;5014:	if ( pm->ps->persistant[PERS_TEAM] == TEAM_SPECTATOR ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2024
line 5015
;5015:		return;
ADDRGP4 $1936
JUMPV
LABELV $2024
line 5019
;5016:	}
;5017:
;5018:	// check for dead player
;5019:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2026
line 5020
;5020:		pm->ps->weapon = WP_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 5021
;5021:		return;
ADDRGP4 $1936
JUMPV
LABELV $2026
line 5025
;5022:	}
;5023:
;5024:	// check for item using
;5025:	if ( pm->cmd.buttons & BUTTON_USE_HOLDABLE ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2028
line 5026
;5026:		if ( ! ( pm->ps->pm_flags & PMF_USE_ITEM_HELD ) ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $2029
line 5028
;5027:
;5028:			if (!pm->ps->stats[STAT_HOLDABLE_ITEM])
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2032
line 5029
;5029:			{
line 5030
;5030:				return;
ADDRGP4 $1936
JUMPV
LABELV $2032
line 5033
;5031:			}
;5032:
;5033:			if (!PM_ItemUsable(pm->ps, 0))
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 52
ADDRGP4 PM_ItemUsable
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $2034
line 5034
;5034:			{
line 5035
;5035:				pm->ps->pm_flags |= PMF_USE_ITEM_HELD;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 5036
;5036:				return;
ADDRGP4 $1936
JUMPV
LABELV $2034
line 5039
;5037:			}
;5038:			else
;5039:			{
line 5040
;5040:				if (pm->ps->stats[STAT_HOLDABLE_ITEMS] & (1 << bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag))
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
CNSTI4 52
ADDRLP4 56
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1936
line 5041
;5041:				{
line 5042
;5042:					if (bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag != HI_BINOCULARS)
CNSTI4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 5
EQI4 $2037
line 5043
;5043:					{ //never use up the binoculars
line 5044
;5044:						pm->ps->stats[STAT_HOLDABLE_ITEMS] -= (1 << bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag);
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
CNSTI4 52
ADDRLP4 60
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
LSHI4
SUBI4
ASGNI4
line 5045
;5045:					}
line 5046
;5046:				}
line 5048
;5047:				else
;5048:				{
line 5049
;5049:					return; //this should not happen...
LABELV $2037
line 5052
;5050:				}
;5051:
;5052:				pm->ps->pm_flags |= PMF_USE_ITEM_HELD;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 5053
;5053:				PM_AddEvent( EV_USE_ITEM0 + bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag );
CNSTI4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 40
ADDI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 5055
;5054:
;5055:				if (bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag != HI_BINOCULARS)
CNSTI4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 5
EQI4 $1936
line 5056
;5056:				{
line 5057
;5057:					pm->ps->stats[STAT_HOLDABLE_ITEM] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 0
ASGNI4
line 5058
;5058:					BG_CycleInven(pm->ps, 1);
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_CycleInven
CALLV
pop
line 5059
;5059:				}
line 5060
;5060:			}
line 5061
;5061:			return;
ADDRGP4 $1936
JUMPV
line 5063
;5062:		}
;5063:	} else {
LABELV $2028
line 5064
;5064:		pm->ps->pm_flags &= ~PMF_USE_ITEM_HELD;
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 5065
;5065:	}
LABELV $2029
line 5067
;5066:
;5067:	if (pm->ps->weapon == WP_SABER)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2047
line 5068
;5068:	{ //we can't toggle zoom while using saber (for obvious reasons) so make sure it's always off
line 5069
;5069:		pm->ps->zoomMode = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 5070
;5070:		pm->ps->zoomFov = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1344
ADDP4
CNSTF4 0
ASGNF4
line 5071
;5071:		pm->ps->zoomLocked = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 5072
;5072:		pm->ps->zoomLockTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1348
ADDP4
CNSTI4 0
ASGNI4
line 5073
;5073:	}
LABELV $2047
line 5075
;5074:
;5075:	if (killAfterItem)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $2049
line 5076
;5076:	{
line 5077
;5077:		return;
ADDRGP4 $1936
JUMPV
LABELV $2049
line 5081
;5078:	}
;5079:
;5080:	// make weapon function
;5081:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2051
line 5082
;5082:		pm->ps->weaponTime -= pml.msec;
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 5083
;5083:	}
LABELV $2051
line 5085
;5084:
;5085:	if (pm->ps->isJediMaster && pm->ps->emplacedIndex)
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $2054
ADDRLP4 52
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $2054
line 5086
;5086:	{
line 5087
;5087:		pm->ps->emplacedIndex = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 596
ADDP4
CNSTI4 0
ASGNI4
line 5088
;5088:	}
LABELV $2054
line 5090
;5089:
;5090:	if (pm->ps->duelInProgress && pm->ps->emplacedIndex)
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $2056
ADDRLP4 60
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $2056
line 5091
;5091:	{
line 5092
;5092:		pm->ps->emplacedIndex = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 596
ADDP4
CNSTI4 0
ASGNI4
line 5093
;5093:	}
LABELV $2056
line 5095
;5094:
;5095:	if (pm->ps->weapon == WP_EMPLACED_GUN && pm->ps->emplacedIndex)
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $2058
ADDRLP4 68
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2058
line 5096
;5096:	{
line 5097
;5097:		pm->cmd.weapon = WP_EMPLACED_GUN; //No switch for you!
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
CNSTU1 14
ASGNU1
line 5098
;5098:		PM_StartTorsoAnim( BOTH_GUNSIT1 );
CNSTI4 810
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 5099
;5099:	}
LABELV $2058
line 5101
;5100:
;5101:	if (pm->ps->isJediMaster || pm->ps->duelInProgress || pm->ps->trueJedi)
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $2063
ADDRLP4 72
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $2063
ADDRLP4 72
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $2060
LABELV $2063
line 5102
;5102:	{
line 5103
;5103:		pm->cmd.weapon = WP_SABER;
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
CNSTU1 2
ASGNU1
line 5104
;5104:		pm->ps->weapon = WP_SABER;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 5106
;5105:
;5106:		if (pm->ps->isJediMaster || pm->ps->trueJedi)
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $2066
ADDRLP4 80
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $2064
LABELV $2066
line 5107
;5107:		{
line 5108
;5108:			pm->ps->stats[STAT_WEAPONS] = (1 << WP_SABER);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 4
ASGNI4
line 5109
;5109:		}
LABELV $2064
line 5110
;5110:	}
LABELV $2060
line 5112
;5111:
;5112:	amount = weaponData[pm->ps->weapon].energyPerShot;
ADDRLP4 4
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 5115
;5113:
;5114:	// take an ammo away if not infinite
;5115:	if ( pm->ps->weapon != WP_NONE &&
ADDRLP4 80
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 88
ADDRLP4 84
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRLP4 88
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $2067
ADDRLP4 88
INDIRI4
ADDRLP4 80
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
NEI4 $2067
ADDRLP4 84
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
LEI4 $2069
ADDRLP4 84
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2067
LABELV $2069
line 5118
;5116:		pm->ps->weapon == pm->cmd.weapon &&
;5117:		(pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING) )
;5118:	{
line 5119
;5119:		if ( pm->ps->ammo[ weaponData[pm->ps->weapon].ammoIndex ] != -1 )
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
CNSTI4 56
ADDRLP4 96
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 96
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2070
line 5120
;5120:		{
line 5122
;5121:			// enough energy to fire this weapon?
;5122:			if (pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] < weaponData[pm->ps->weapon].energyPerShot &&
ADDRLP4 100
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 104
CNSTI4 56
ADDRLP4 100
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 108
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 100
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 108
INDIRI4
ADDRLP4 104
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GEI4 $2072
ADDRLP4 108
INDIRI4
ADDRLP4 104
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
GEI4 $2072
line 5124
;5123:				pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] < weaponData[pm->ps->weapon].altEnergyPerShot) 
;5124:			{ //the weapon is out of ammo essentially because it cannot fire primary or secondary, so do the switch
line 5126
;5125:			  //regardless of if the player is attacking or not
;5126:				PM_AddEventWithParm( EV_NOAMMO, WP_NUM_WEAPONS+pm->ps->weapon );
CNSTI4 22
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 5128
;5127:
;5128:				if (pm->ps->weaponTime < 500)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 500
GEI4 $1936
line 5129
;5129:				{
line 5130
;5130:					pm->ps->weaponTime += 500;
ADDRLP4 112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 5131
;5131:				}
line 5132
;5132:				return;
ADDRGP4 $1936
JUMPV
LABELV $2072
line 5135
;5133:			}
;5134:
;5135:			if (pm->ps->weapon == WP_DET_PACK && !pm->ps->hasDetPackPlanted && pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] < 1)
ADDRLP4 112
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 116
ADDRLP4 112
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 13
NEI4 $2076
ADDRLP4 112
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2076
CNSTI4 56
ADDRLP4 116
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 112
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2076
line 5136
;5136:			{
line 5137
;5137:				PM_AddEventWithParm( EV_NOAMMO, WP_NUM_WEAPONS+pm->ps->weapon );
CNSTI4 22
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 5139
;5138:
;5139:				if (pm->ps->weaponTime < 500)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 500
GEI4 $1936
line 5140
;5140:				{
line 5141
;5141:					pm->ps->weaponTime += 500;
ADDRLP4 120
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 5142
;5142:				}
line 5143
;5143:				return;
ADDRGP4 $1936
JUMPV
LABELV $2076
line 5145
;5144:			}
;5145:		}
LABELV $2070
line 5146
;5146:	}
LABELV $2067
line 5151
;5147:
;5148:	// check for weapon change
;5149:	// can't change if weapon is firing, but can change
;5150:	// again if lowering or raising
;5151:	if ( pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING ) {
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2082
ADDRLP4 96
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2080
LABELV $2082
line 5152
;5152:		if ( pm->ps->weapon != pm->cmd.weapon ) {
ADDRLP4 100
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 100
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
EQI4 $2083
line 5153
;5153:			PM_BeginWeaponChange( pm->cmd.weapon );
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 PM_BeginWeaponChange
CALLV
pop
line 5154
;5154:		}
LABELV $2083
line 5155
;5155:	}
LABELV $2080
line 5157
;5156:
;5157:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2085
line 5158
;5158:		return;
ADDRGP4 $1936
JUMPV
LABELV $2085
line 5162
;5159:	}
;5160:
;5161:	// change weapon if time
;5162:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2087
line 5163
;5163:		PM_FinishWeaponChange();
ADDRGP4 PM_FinishWeaponChange
CALLV
pop
line 5164
;5164:		return;
ADDRGP4 $1936
JUMPV
LABELV $2087
line 5167
;5165:	}
;5166:
;5167:	if ( pm->ps->weaponstate == WEAPON_RAISING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2089
line 5168
;5168:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 5169
;5169:		if ( pm->ps->weapon == WP_SABER ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2091
line 5170
;5170:			PM_StartTorsoAnim( PM_GetSaberStance() );
ADDRLP4 100
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 5171
;5171:		} else {
ADDRGP4 $1936
JUMPV
LABELV $2091
line 5172
;5172:			if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode == 1)
ADDRLP4 100
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2093
ADDRLP4 100
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2093
line 5173
;5173:			{
line 5174
;5174:				PM_StartTorsoAnim( TORSO_WEAPONREADY4 );
CNSTI4 1102
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 5175
;5175:			}
ADDRGP4 $1936
JUMPV
LABELV $2093
line 5177
;5176:			else
;5177:			{
line 5178
;5178:				if (pm->ps->weapon == WP_EMPLACED_GUN)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $2095
line 5179
;5179:				{
line 5180
;5180:					PM_StartTorsoAnim( BOTH_GUNSIT1 );
CNSTI4 810
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 5181
;5181:				}
ADDRGP4 $1936
JUMPV
LABELV $2095
line 5183
;5182:				else
;5183:				{
line 5184
;5184:					PM_StartTorsoAnim( WeaponReadyAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 5185
;5185:				}
line 5186
;5186:			}
line 5187
;5187:		}
line 5188
;5188:		return;
ADDRGP4 $1936
JUMPV
LABELV $2089
line 5191
;5189:	}
;5190:
;5191:	if (((pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) == TORSO_WEAPONREADY4 ||
ADDRLP4 100
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 1102
EQI4 $2099
ADDRLP4 100
INDIRI4
CNSTI4 121
NEI4 $2097
LABELV $2099
ADDRLP4 104
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2100
ADDRLP4 104
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
EQI4 $2097
LABELV $2100
line 5194
;5192:		(pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_ATTACK4) &&
;5193:		(pm->ps->weapon != WP_DISRUPTOR || pm->ps->zoomMode != 1))
;5194:	{
line 5195
;5195:		if (pm->ps->weapon == WP_EMPLACED_GUN)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $2101
line 5196
;5196:		{
line 5197
;5197:			PM_StartTorsoAnim( BOTH_GUNSIT1 );
CNSTI4 810
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 5198
;5198:		}
ADDRGP4 $2098
JUMPV
LABELV $2101
line 5200
;5199:		else
;5200:		{
line 5201
;5201:			PM_StartTorsoAnim( WeaponReadyAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 5202
;5202:		}
line 5203
;5203:	}
ADDRGP4 $2098
JUMPV
LABELV $2097
line 5204
;5204:	else if (((pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) != TORSO_WEAPONREADY4 &&
ADDRLP4 108
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 112
ADDRLP4 108
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 1102
EQI4 $2103
ADDRLP4 112
INDIRI4
CNSTI4 121
EQI4 $2103
ADDRLP4 108
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2103
ADDRLP4 108
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2103
line 5207
;5205:		(pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) != BOTH_ATTACK4) &&
;5206:		(pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode == 1))
;5207:	{
line 5208
;5208:		PM_StartTorsoAnim( TORSO_WEAPONREADY4 );
CNSTI4 1102
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 5209
;5209:	}
LABELV $2103
LABELV $2098
line 5212
;5210:
;5211:
;5212:	if (pm->ps->weapon != WP_ROCKET_LAUNCHER)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 10
EQI4 $2105
line 5213
;5213:	{
line 5214
;5214:		pm->ps->rocketLockIndex = MAX_CLIENTS;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 32
ASGNI4
line 5215
;5215:		pm->ps->rocketLockTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 5216
;5216:		pm->ps->rocketTargetTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 592
ADDP4
CNSTF4 0
ASGNF4
line 5217
;5217:	}
LABELV $2105
line 5219
;5218:
;5219:	if ( PM_DoChargedWeapons())
ADDRLP4 116
ADDRGP4 PM_DoChargedWeapons
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $2107
line 5220
;5220:	{
line 5222
;5221:		// In some cases the charged weapon code may want us to short circuit the rest of the firing code
;5222:		return;
ADDRGP4 $1936
JUMPV
LABELV $2107
line 5226
;5223:	}
;5224:
;5225:	// check for fire
;5226:	if ( ! (pm->cmd.buttons & (BUTTON_ATTACK|BUTTON_ALT_ATTACK))) 
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 129
BANDI4
CNSTI4 0
NEI4 $2109
line 5227
;5227:	{
line 5228
;5228:		pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 5229
;5229:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 5230
;5230:		return;
ADDRGP4 $1936
JUMPV
LABELV $2109
line 5233
;5231:	}
;5232:
;5233:	if (pm->ps->weapon == WP_EMPLACED_GUN)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 14
NEI4 $2111
line 5234
;5234:	{
line 5235
;5235:		addTime = weaponData[pm->ps->weapon].fireTime;
ADDRLP4 0
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 5236
;5236:		pm->ps->weaponTime += addTime;
ADDRLP4 120
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 5237
;5237:		PM_AddEvent( EV_FIRE_WEAPON );
CNSTI4 24
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 5238
;5238:		return;
ADDRGP4 $1936
JUMPV
LABELV $2111
line 5241
;5239:	}
;5240:
;5241:	if (pm->ps->weapon == WP_DISRUPTOR &&
ADDRLP4 120
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 120
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2113
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRLP4 120
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 128
INDIRI4
EQI4 $2113
ADDRLP4 124
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ADDRLP4 128
INDIRI4
NEI4 $2113
line 5244
;5242:		(pm->cmd.buttons & BUTTON_ALT_ATTACK) &&
;5243:		!pm->ps->zoomLocked)
;5244:	{
line 5245
;5245:		return;
ADDRGP4 $1936
JUMPV
LABELV $2113
line 5248
;5246:	}
;5247:
;5248:	if (pm->ps->weapon == WP_DISRUPTOR &&
ADDRLP4 132
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 132
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2115
ADDRLP4 132
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2115
ADDRLP4 136
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2115
line 5251
;5249:		(pm->cmd.buttons & BUTTON_ALT_ATTACK) &&
;5250:		pm->ps->zoomMode == 2)
;5251:	{ //can't use disruptor secondary while zoomed binoculars
line 5252
;5252:		return;
ADDRGP4 $1936
JUMPV
LABELV $2115
line 5255
;5253:	}
;5254:
;5255:	if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode == 1)
ADDRLP4 140
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2117
ADDRLP4 140
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2117
line 5256
;5256:	{
line 5257
;5257:		PM_StartTorsoAnim( BOTH_ATTACK4 );
CNSTI4 121
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 5258
;5258:	}
ADDRGP4 $2118
JUMPV
LABELV $2117
line 5404
;5259:	/*else if ((runFlags & RFL_CLIMBTECH) && pm->ps->weapon == WP_MELEE)// uh is this even actually climbtech?
;5260:	{ //special anims for standard melee attacks
;5261:		//Alternate between punches and use the anim length as weapon time.
;5262:		if (!pm->ps->m_iVehicleNum)
;5263:		{ //if riding a vehicle don't do this stuff at all
;5264:			if (pm->debugMelee &&
;5265:				(pm->cmd.buttons & BUTTON_ATTACK) &&
;5266:				(pm->cmd.buttons & BUTTON_ALT_ATTACK))
;5267:			{ //ok, grapple time
;5268:#if 0 //eh, I want to try turning the saber off, but can't do that reliably for prediction..
;5269:				qboolean icandoit = qtrue;
;5270:				if (pm->ps->weaponTime > 0)
;5271:				{ //weapon busy
;5272:					icandoit = qfalse;
;5273:				}
;5274:				if (pm->ps->forceHandExtend != HANDEXTEND_NONE)
;5275:				{ //force power or knockdown or something
;5276:					icandoit = qfalse;
;5277:				}
;5278:				if (pm->ps->weapon != WP_SABER && pm->ps->weapon != WP_MELEE)
;5279:				{
;5280:					icandoit = qfalse;
;5281:				}
;5282:
;5283:				if (icandoit)
;5284:				{
;5285:					//G_SetAnim(ent, &ent->client->pers.cmd, SETANIM_BOTH, BOTH_KYLE_GRAB, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD);
;5286:					PM_SetAnim(SETANIM_BOTH, BOTH_KYLE_GRAB, SETANIM_FLAG_OVERRIDE | SETANIM_FLAG_HOLD);
;5287:					if (pm->ps->torsoAnim == BOTH_KYLE_GRAB)
;5288:					{ //providing the anim set succeeded..
;5289:						pm->ps->torsoTimer += 500; //make the hand stick out a little longer than it normally would
;5290:						if (pm->ps->legsAnim == pm->ps->torsoAnim)
;5291:						{
;5292:							pm->ps->legsTimer = pm->ps->torsoTimer;
;5293:						}
;5294:						pm->ps->weaponTime = pm->ps->torsoTimer;
;5295:						return;
;5296:					}
;5297:				}
;5298:#else
;5299:#ifdef _GAME
;5300:				if (pm_entSelf)
;5301:				{
;5302:					if (TryGrapple((gentity_t*)pm_entSelf))
;5303:					{
;5304:						return;
;5305:					}
;5306:				}
;5307:#else
;5308:				return;
;5309:#endif
;5310:#endif
;5311:			}
;5312:			else if (pm->debugMelee && 
;5313:				(pm->cmd.buttons & BUTTON_ALT_ATTACK))
;5314:			{ //kicks
;5315:				if (!BG_KickingAnim(pm->ps->torsoAnim) &&
;5316:					!BG_KickingAnim(pm->ps->legsAnim))
;5317:				{
;5318:					int kickMove = PM_KickMoveForConditions();
;5319:					if (kickMove == LS_HILT_BASH)
;5320:					{ //yeah.. no hilt to bash with!
;5321:						kickMove = LS_KICK_F;
;5322:					}
;5323:
;5324:					if (kickMove != -1)
;5325:					{
;5326:						if (pm->ps->groundEntityNum == ENTITYNUM_NONE)
;5327:						{//if in air, convert kick to an in-air kick
;5328:							float gDist = PM_GroundDistance();
;5329:							//let's only allow air kicks if a certain distance from the ground
;5330:							//it's silly to be able to do them right as you land.
;5331:							//also looks wrong to transition from a non-complete flip anim...
;5332:							if ((!BG_FlippingAnim(pm->ps->legsAnim) || pm->ps->legsTimer <= 0) &&
;5333:								gDist > 64.0f && //strict minimum
;5334:								gDist > (-pm->ps->velocity[2]) - 64.0f //make sure we are high to ground relative to downward velocity as well
;5335:								)
;5336:							{
;5337:								switch (kickMove)
;5338:								{
;5339:								case LS_KICK_F:
;5340:									kickMove = LS_KICK_F_AIR;
;5341:									break;
;5342:								case LS_KICK_B:
;5343:									kickMove = LS_KICK_B_AIR;
;5344:									break;
;5345:								case LS_KICK_R:
;5346:									kickMove = LS_KICK_R_AIR;
;5347:									break;
;5348:								case LS_KICK_L:
;5349:									kickMove = LS_KICK_L_AIR;
;5350:									break;
;5351:								default: //oh well, can't do any other kick move while in-air
;5352:									kickMove = -1;
;5353:									break;
;5354:								}
;5355:							}
;5356:							else
;5357:							{ //off ground, but too close to ground
;5358:								kickMove = -1;
;5359:							}
;5360:						}
;5361:					}
;5362:
;5363:					if (kickMove != -1)
;5364:					{
;5365:						int kickAnim = saberMoveData[kickMove].animToUse;
;5366:
;5367:						if (kickAnim != -1)
;5368:						{
;5369:							PM_SetAnim(SETANIM_BOTH, kickAnim, SETANIM_FLAG_OVERRIDE | SETANIM_FLAG_HOLD);
;5370:							if (pm->ps->legsAnim == kickAnim)
;5371:							{
;5372:								pm->ps->weaponTime = pm->ps->legsTimer;
;5373:								return;
;5374:							}
;5375:						}
;5376:					}
;5377:				}
;5378:
;5379:				//if got here then no move to do so put torso into leg idle or whatever
;5380:				if (pm->ps->torsoAnim != pm->ps->legsAnim)
;5381:				{
;5382:					PM_SetAnim(SETANIM_BOTH, pm->ps->legsAnim, SETANIM_FLAG_OVERRIDE | SETANIM_FLAG_HOLD);
;5383:				}
;5384:				pm->ps->weaponTime = 0;
;5385:				return;
;5386:			}
;5387:			else
;5388:			{ //just punch
;5389:				int desTAnim = BOTH_MELEE1;
;5390:				if (pm->ps->torsoAnim == BOTH_MELEE1)
;5391:				{
;5392:					desTAnim = BOTH_MELEE2;
;5393:				}
;5394:				PM_StartTorsoAnim(desTAnim);
;5395:
;5396:				if (pm->ps->torsoAnim == desTAnim)
;5397:				{
;5398:					pm->ps->weaponTime = pm->ps->torsoTimer;
;5399:				}
;5400:			}
;5401:		}
;5402:	}*/
;5403:	else
;5404:	{
line 5405
;5405:		PM_StartTorsoAnim( WeaponAttackAnim[pm->ps->weapon] );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponAttackAnim
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 5406
;5406:	}
LABELV $2118
line 5408
;5407:
;5408:	if ( pm->cmd.buttons & BUTTON_ALT_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2119
line 5409
;5409:	{
line 5410
;5410:		amount = weaponData[pm->ps->weapon].altEnergyPerShot;
ADDRLP4 4
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 5411
;5411:	}
ADDRGP4 $2120
JUMPV
LABELV $2119
line 5413
;5412:	else
;5413:	{
line 5414
;5414:		amount = weaponData[pm->ps->weapon].energyPerShot;
ADDRLP4 4
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 5415
;5415:	}
LABELV $2120
line 5417
;5416:
;5417:	pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 3
ASGNI4
line 5420
;5418:
;5419:	// take an ammo away if not infinite
;5420:	if ( pm->ps->ammo[ weaponData[pm->ps->weapon].ammoIndex ] != -1 )
ADDRLP4 144
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
CNSTI4 56
ADDRLP4 144
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 144
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2121
line 5421
;5421:	{
line 5423
;5422:		// enough energy to fire this weapon?
;5423:		if ((pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] - amount) >= 0) 
ADDRLP4 148
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
CNSTI4 56
ADDRLP4 148
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 0
LTI4 $2123
line 5424
;5424:		{
line 5425
;5425:			pm->ps->ammo[weaponData[pm->ps->weapon].ammoIndex] -= amount;
ADDRLP4 152
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 156
CNSTI4 56
ADDRLP4 152
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 152
INDIRP4
CNSTI4 408
ADDP4
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 5426
;5426:		}
ADDRGP4 $2124
JUMPV
LABELV $2123
line 5428
;5427:		else	// Not enough energy
;5428:		{
line 5430
;5429:			// Switch weapons
;5430:			if (pm->ps->weapon != WP_DET_PACK || !pm->ps->hasDetPackPlanted)
ADDRLP4 152
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 13
NEI4 $2127
ADDRLP4 152
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1936
LABELV $2127
line 5431
;5431:			{
line 5432
;5432:				PM_AddEventWithParm( EV_NOAMMO, WP_NUM_WEAPONS+pm->ps->weapon );
CNSTI4 22
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 5433
;5433:				if (pm->ps->weaponTime < 500)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 500
GEI4 $1936
line 5434
;5434:				{
line 5435
;5435:					pm->ps->weaponTime += 500;
ADDRLP4 156
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 5436
;5436:				}
line 5437
;5437:			}
line 5438
;5438:			return;
ADDRGP4 $1936
JUMPV
LABELV $2124
line 5440
;5439:		}
;5440:	}
LABELV $2121
line 5442
;5441:
;5442:	if ( pm->cmd.buttons & BUTTON_ALT_ATTACK ) 	{
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2130
line 5443
;5443:		if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->zoomMode != 1)
ADDRLP4 148
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2132
ADDRLP4 148
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
EQI4 $2132
line 5444
;5444:		{
line 5445
;5445:			PM_AddEvent( EV_FIRE_WEAPON );
CNSTI4 24
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 5446
;5446:			addTime = weaponData[pm->ps->weapon].fireTime;
ADDRLP4 0
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 5447
;5447:		}
ADDRGP4 $2131
JUMPV
LABELV $2132
line 5449
;5448:		else
;5449:		{
line 5450
;5450:			PM_AddEvent( EV_ALT_FIRE );
CNSTI4 25
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 5451
;5451:			addTime = weaponData[pm->ps->weapon].altFireTime;
ADDRLP4 0
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 5452
;5452:		}
line 5453
;5453:	}
ADDRGP4 $2131
JUMPV
LABELV $2130
line 5454
;5454:	else {
line 5455
;5455:		PM_AddEvent( EV_FIRE_WEAPON );
CNSTI4 24
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 5456
;5456:		addTime = weaponData[pm->ps->weapon].fireTime;
ADDRLP4 0
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 5457
;5457:	}
LABELV $2131
line 5459
;5458:
;5459:	if ( pm->ps->powerups[PW_HASTE] ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 356
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2134
line 5460
;5460:		addTime /= 1.3;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1067869798
DIVF4
CVFI4 4
ASGNI4
line 5461
;5461:	}
LABELV $2134
line 5463
;5462:
;5463:	if (pm->ps->fd.forcePowersActive & (1 << FP_RAGE))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2136
line 5464
;5464:	{
line 5465
;5465:		addTime *= 0.75;
ADDRLP4 0
CNSTF4 1061158912
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5466
;5466:	}
ADDRGP4 $2137
JUMPV
LABELV $2136
line 5467
;5467:	else if (pm->ps->fd.forceRageRecoveryTime > pm->cmd.serverTime)
ADDRLP4 148
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
INDIRP4
CNSTI4 1172
ADDP4
INDIRI4
ADDRLP4 148
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LEI4 $2138
line 5468
;5468:	{
line 5469
;5469:		addTime *= 1.5;
ADDRLP4 0
CNSTF4 1069547520
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5470
;5470:	}
LABELV $2138
LABELV $2137
line 5472
;5471:
;5472:	pm->ps->weaponTime += addTime;
ADDRLP4 152
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 5473
;5473:}
LABELV $1936
endproc PM_Weapon 160 16
proc PM_Animate 16 4
line 5481
;5474:
;5475:/*
;5476:================
;5477:PM_Animate
;5478:================
;5479:*/
;5480:
;5481:static void PM_Animate( void ) {
line 5482
;5482:	if ( pm->cmd.buttons & BUTTON_GESTURE ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $2141
line 5483
;5483:		if ( pm->ps->torsoTimer < 1 && pm->ps->forceHandExtend == HANDEXTEND_NONE &&
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $2143
ADDRLP4 4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2143
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $2143
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $2143
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $2145
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $2143
LABELV $2145
line 5484
;5484:			pm->ps->legsTimer < 1 && pm->ps->weaponTime < 1 && (pm->ps->saberLockTime < pm->cmd.serverTime || jk2gameplay == VERSION_1_02)) {
line 5486
;5485:
;5486:			pm->ps->forceHandExtend = HANDEXTEND_TAUNT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 10
ASGNI4
line 5489
;5487:
;5488:			//FIXME: random taunt anims?
;5489:			pm->ps->forceDodgeAnim = BOTH_ENGAGETAUNT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 904
ASGNI4
line 5491
;5490:
;5491:			pm->ps->forceHandExtendTime = pm->cmd.serverTime + 1000;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 5493
;5492:			
;5493:			pm->ps->weaponTime = 100;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 100
ASGNI4
line 5495
;5494:
;5495:			PM_AddEvent( EV_TAUNT );
CNSTI4 102
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 5496
;5496:		}
LABELV $2143
line 5532
;5497:#if 0
;5498:// Here's an interesting bit.  The bots in TA used buttons to do additional gestures.
;5499:// I ripped them out because I didn't want too many buttons given the fact that I was already adding some for JK2.
;5500:// We can always add some back in if we want though.
;5501:	} else if ( pm->cmd.buttons & BUTTON_GETFLAG ) {
;5502:		if ( pm->ps->torsoTimer == 0 ) {
;5503:			PM_StartTorsoAnim( TORSO_GETFLAG );
;5504:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;5505:		}
;5506:	} else if ( pm->cmd.buttons & BUTTON_GUARDBASE ) {
;5507:		if ( pm->ps->torsoTimer == 0 ) {
;5508:			PM_StartTorsoAnim( TORSO_GUARDBASE );
;5509:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;5510:		}
;5511:	} else if ( pm->cmd.buttons & BUTTON_PATROL ) {
;5512:		if ( pm->ps->torsoTimer == 0 ) {
;5513:			PM_StartTorsoAnim( TORSO_PATROL );
;5514:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;5515:		}
;5516:	} else if ( pm->cmd.buttons & BUTTON_FOLLOWME ) {
;5517:		if ( pm->ps->torsoTimer == 0 ) {
;5518:			PM_StartTorsoAnim( TORSO_FOLLOWME );
;5519:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;5520:		}
;5521:	} else if ( pm->cmd.buttons & BUTTON_AFFIRMATIVE ) {
;5522:		if ( pm->ps->torsoTimer == 0 ) {
;5523:			PM_StartTorsoAnim( TORSO_AFFIRMATIVE);
;5524:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;5525:		}
;5526:	} else if ( pm->cmd.buttons & BUTTON_NEGATIVE ) {
;5527:		if ( pm->ps->torsoTimer == 0 ) {
;5528:			PM_StartTorsoAnim( TORSO_NEGATIVE );
;5529:			pm->ps->torsoTimer = 600;	//TIMER_GESTURE;
;5530:		}
;5531:#endif //
;5532:	}
LABELV $2141
line 5533
;5533:}
LABELV $2140
endproc PM_Animate 16 4
proc PM_DropTimers 32 0
line 5541
;5534:
;5535:
;5536:/*
;5537:================
;5538:PM_DropTimers
;5539:================
;5540:*/
;5541:static void PM_DropTimers( void ) {
line 5544
;5542:
;5543:	// drop misc timing counter
;5544:	if ( pm->ps->pm_time ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2147
line 5545
;5545:		if ( pml.msec >= pm->ps->pm_time ) {
ADDRGP4 pml+40
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LTI4 $2149
line 5546
;5546:			pm->ps->pm_flags &= ~PMF_ALL_TIMES;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -353
BANDI4
ASGNI4
line 5547
;5547:			pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 5548
;5548:		} else {
ADDRGP4 $2150
JUMPV
LABELV $2149
line 5549
;5549:			pm->ps->pm_time -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 5550
;5550:		}
LABELV $2150
line 5551
;5551:	}
LABELV $2147
line 5554
;5552:
;5553:	// drop animation counter
;5554:	if ( pm->ps->legsTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2153
line 5555
;5555:		pm->ps->legsTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 5556
;5556:		if ( pm->ps->legsTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
GEI4 $2156
line 5557
;5557:			pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 5558
;5558:		}
LABELV $2156
line 5559
;5559:	}
LABELV $2153
line 5561
;5560:
;5561:	if ( pm->ps->torsoTimer > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2158
line 5562
;5562:		pm->ps->torsoTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 5563
;5563:		if ( pm->ps->torsoTimer < 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CNSTI4 0
GEI4 $2161
line 5564
;5564:			pm->ps->torsoTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 5565
;5565:		}
LABELV $2161
line 5566
;5566:	}
LABELV $2158
line 5569
;5567:
;5568:	// handle bounce power
;5569:	if (pm->modParms.physics == MV_BOUNCE) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 6
NEI4 $2163
line 5570
;5570:		int bouncePower = pm->ps->stats[STAT_BOUNCEPOWER] & BOUNCEPOWER_POWERMASK;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
CNSTI4 511
BANDI4
ASGNI4
line 5571
;5571:		int bounceRegenTimer = (pm->ps->stats[STAT_BOUNCEPOWER] & BOUNCEPOWER_REGENMASK) >> 9;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
CNSTI4 65024
BANDI4
CNSTI4 9
RSHI4
ASGNI4
line 5572
;5572:		if (pm->cmd.buttons & BUTTON_BOUNCEPOWER) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $2165
line 5574
;5573:			// using bounce power. decrease it.
;5574:			bouncePower -= pml.msec;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 5575
;5575:			bounceRegenTimer = BOUNCEPOWER_REGEN_MAX;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 5576
;5576:		}
ADDRGP4 $2166
JUMPV
LABELV $2165
line 5577
;5577:		else {
line 5578
;5578:			bounceRegenTimer -= pml.msec;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 5579
;5579:			if (bounceRegenTimer <= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $2169
line 5580
;5580:				bouncePower += 10;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 5581
;5581:				bounceRegenTimer = BOUNCEPOWER_REGEN_MAX;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 5582
;5582:			}
LABELV $2169
line 5583
;5583:		}
LABELV $2166
line 5584
;5584:		bouncePower = MAX(0,MIN(BOUNCEPOWER_MAX,bouncePower));
CNSTI4 500
ADDRLP4 4
INDIRI4
GEI4 $2176
ADDRLP4 12
CNSTI4 500
ASGNI4
ADDRGP4 $2177
JUMPV
LABELV $2176
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $2177
CNSTI4 0
ADDRLP4 12
INDIRI4
LEI4 $2174
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $2175
JUMPV
LABELV $2174
CNSTI4 500
ADDRLP4 4
INDIRI4
GEI4 $2178
ADDRLP4 16
CNSTI4 500
ASGNI4
ADDRGP4 $2179
JUMPV
LABELV $2178
ADDRLP4 16
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $2179
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
LABELV $2175
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 5585
;5585:		bounceRegenTimer = MAX(0,MIN(BOUNCEPOWER_REGEN_MAX, bounceRegenTimer));
CNSTI4 100
ADDRLP4 0
INDIRI4
GEI4 $2185
ADDRLP4 24
CNSTI4 100
ASGNI4
ADDRGP4 $2186
JUMPV
LABELV $2185
ADDRLP4 24
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $2186
CNSTI4 0
ADDRLP4 24
INDIRI4
LEI4 $2183
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $2184
JUMPV
LABELV $2183
CNSTI4 100
ADDRLP4 0
INDIRI4
GEI4 $2187
ADDRLP4 28
CNSTI4 100
ASGNI4
ADDRGP4 $2188
JUMPV
LABELV $2187
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $2188
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
LABELV $2184
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 5586
;5586:		pm->ps->stats[STAT_BOUNCEPOWER] = (bouncePower & BOUNCEPOWER_POWERMASK) | ((bounceRegenTimer << 9) & BOUNCEPOWER_REGENMASK);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 252
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 511
BANDI4
ADDRLP4 0
INDIRI4
CNSTI4 9
LSHI4
CNSTI4 65024
BANDI4
BORI4
ASGNI4
line 5587
;5587:	}
LABELV $2163
line 5588
;5588:}
LABELV $2146
endproc PM_DropTimers 32 0
export PM_UpdateViewAngles
proc PM_UpdateViewAngles 24 0
line 5598
;5589:
;5590:/*
;5591:================
;5592:PM_UpdateViewAngles
;5593:
;5594:This can be used as another entry point when only the viewangles
;5595:are being updated isntead of a full move
;5596:================
;5597:*/
;5598:void PM_UpdateViewAngles( playerState_t *ps, const usercmd_t *cmd ) {
line 5602
;5599:	short		temp;
;5600:	int		i;
;5601:
;5602:	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 6
EQI4 $2192
ADDRLP4 8
INDIRI4
CNSTI4 7
NEI4 $2190
LABELV $2192
line 5603
;5603:		return;		// no view changes at all
ADDRGP4 $2189
JUMPV
LABELV $2190
line 5606
;5604:	}
;5605:
;5606:	if ( ps->pm_type != PM_SPECTATOR && ps->stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2193
ADDRLP4 12
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2193
line 5607
;5607:		return;		// no view changes at all
ADDRGP4 $2189
JUMPV
LABELV $2193
line 5611
;5608:	}
;5609:
;5610:	// circularly clamp the angles with deltas
;5611:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2195
line 5612
;5612:		temp = cmd->angles[i] + ps->delta_angles[i];
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDP4
INDIRI4
ADDI4
CVII2 4
ASGNI2
line 5613
;5613:		if ( i == PITCH ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2199
line 5615
;5614:			// don't let the player look up or down more than 90 degrees
;5615:			if ( temp > 16000 ) {
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 16000
LEI4 $2201
line 5616
;5616:				ps->delta_angles[i] = 16000 - cmd->angles[i];
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDP4
CNSTI4 16000
ADDRLP4 20
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 5617
;5617:				temp = 16000;
ADDRLP4 4
CNSTI2 16000
ASGNI2
line 5618
;5618:			} else if ( temp < -16000 ) {
ADDRGP4 $2202
JUMPV
LABELV $2201
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 -16000
GEI4 $2203
line 5619
;5619:				ps->delta_angles[i] = -16000 - cmd->angles[i];
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDP4
CNSTI4 -16000
ADDRLP4 20
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 5620
;5620:				temp = -16000;
ADDRLP4 4
CNSTI2 -16000
ASGNI2
line 5621
;5621:			}
LABELV $2203
LABELV $2202
line 5622
;5622:		}
LABELV $2199
line 5623
;5623:		ps->viewangles[i] = SHORT2ANGLE(temp);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDP4
CNSTF4 1001652224
ADDRLP4 4
INDIRI2
CVII4 2
CVIF4 4
MULF4
ASGNF4
line 5624
;5624:	}
LABELV $2196
line 5611
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $2195
line 5626
;5625:
;5626:}
LABELV $2189
endproc PM_UpdateViewAngles 24 0
export PM_AdjustAttackStates
proc PM_AdjustAttackStates 56 4
line 5631
;5627:
;5628://-------------------------------------------
;5629:void PM_AdjustAttackStates( pmove_t *pm )
;5630://-------------------------------------------
;5631:{
line 5635
;5632:	int amount;
;5633:
;5634:	// get ammo usage
;5635:	if ( pm->cmd.buttons & BUTTON_ALT_ATTACK )
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2206
line 5636
;5636:	{
line 5637
;5637:		amount = pm->ps->ammo[weaponData[ pm->ps->weapon ].ammoIndex] - weaponData[pm->ps->weapon].altEnergyPerShot;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 56
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
SUBI4
ASGNI4
line 5638
;5638:	}
ADDRGP4 $2207
JUMPV
LABELV $2206
line 5640
;5639:	else
;5640:	{
line 5641
;5641:		amount = pm->ps->ammo[weaponData[ pm->ps->weapon ].ammoIndex] - weaponData[pm->ps->weapon].energyPerShot;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 56
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
ASGNI4
line 5642
;5642:	}
LABELV $2207
line 5645
;5643:
;5644:	// disruptor alt-fire should toggle the zoom mode, but only bother doing this for the player?
;5645:	if ( pm->ps->weapon == WP_DISRUPTOR && pm->ps->weaponstate == WEAPON_READY )
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2208
ADDRLP4 4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2208
line 5646
;5646:	{
line 5647
;5647:		if ( !(pm->ps->eFlags & EF_ALT_FIRING) && (pm->cmd.buttons & BUTTON_ALT_ATTACK) /*&&
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 12
INDIRI4
NEI4 $2210
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 12
INDIRI4
EQI4 $2210
line 5649
;5648:			pm->cmd.upmove <= 0 && !pm->cmd.forwardmove && !pm->cmd.rightmove*/)
;5649:		{
line 5651
;5650:			// We just pressed the alt-fire key
;5651:			if ( !pm->ps->zoomMode && !pm->modParms.raceMode)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $2212
ADDRLP4 16
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $2212
line 5652
;5652:			{
line 5654
;5653:				// not already zooming, so do it now
;5654:				pm->ps->zoomMode = 1;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 1
ASGNI4
line 5655
;5655:				pm->ps->zoomLocked = qfalse;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 5656
;5656:				pm->ps->zoomFov = 80.0f;//cg_fov.value;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1344
ADDP4
CNSTF4 1117782016
ASGNF4
line 5657
;5657:				pm->ps->zoomLockTime = pm->cmd.serverTime + 50;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 1348
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 5658
;5658:				PM_AddEvent(EV_DISRUPTOR_ZOOMSOUND);
CNSTI4 35
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 5659
;5659:			}
ADDRGP4 $2211
JUMPV
LABELV $2212
line 5660
;5660:			else if (pm->ps->zoomMode == 1 && pm->ps->zoomLockTime < pm->cmd.serverTime)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2211
ADDRLP4 28
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $2211
line 5661
;5661:			{ //check for == 1 so we can't turn binoculars off with disruptor alt fire
line 5663
;5662:				// already zooming, so must be wanting to turn it off
;5663:				pm->ps->zoomMode = 0;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 5664
;5664:				pm->ps->zoomTime = pm->ps->commandTime;
ADDRLP4 32
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1336
ADDP4
ADDRLP4 32
INDIRP4
INDIRI4
ASGNI4
line 5665
;5665:				pm->ps->zoomLocked = qfalse;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 5666
;5666:				PM_AddEvent(EV_DISRUPTOR_ZOOMSOUND);
CNSTI4 35
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 5667
;5667:			}
line 5668
;5668:		}
ADDRGP4 $2211
JUMPV
LABELV $2210
line 5669
;5669:		else if ( !(pm->cmd.buttons & BUTTON_ALT_ATTACK ) && pm->ps->zoomLockTime < pm->cmd.serverTime)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $2216
ADDRLP4 16
INDIRP4
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $2216
line 5670
;5670:		{
line 5672
;5671:			// Not pressing zoom any more
;5672:			if ( pm->ps->zoomMode )
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2218
line 5673
;5673:			{
line 5674
;5674:				if (pm->ps->zoomMode == 1 && !pm->ps->zoomLocked)
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2220
ADDRLP4 20
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2220
line 5675
;5675:				{ //approximate what level the client should be zoomed at based on how long zoom was held
line 5676
;5676:					pm->ps->zoomFov = ((pm->cmd.serverTime+50) - pm->ps->zoomLockTime) * 0.035f;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1344
ADDP4
CNSTF4 1024416809
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 50
ADDI4
ADDRLP4 28
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ASGNF4
line 5677
;5677:					if (pm->ps->zoomFov > 50)
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1344
ADDP4
INDIRF4
CNSTF4 1112014848
LEF4 $2222
line 5678
;5678:					{
line 5679
;5679:						pm->ps->zoomFov = 50;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1344
ADDP4
CNSTF4 1112014848
ASGNF4
line 5680
;5680:					}
LABELV $2222
line 5681
;5681:					if (pm->ps->zoomFov < 1)
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1344
ADDP4
INDIRF4
CNSTF4 1065353216
GEF4 $2224
line 5682
;5682:					{
line 5683
;5683:						pm->ps->zoomFov = 1;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1344
ADDP4
CNSTF4 1065353216
ASGNF4
line 5684
;5684:					}
LABELV $2224
line 5685
;5685:				}
LABELV $2220
line 5687
;5686:				// were zooming in, so now lock the zoom
;5687:				pm->ps->zoomLocked = qtrue;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 1
ASGNI4
line 5688
;5688:			}
LABELV $2218
line 5689
;5689:		}
LABELV $2216
LABELV $2211
line 5700
;5690:		//This seemed like a good idea, but apparently it confuses people. So disabled for now.
;5691:		/*
;5692:		else if (!(pm->ps->eFlags & EF_ALT_FIRING) && (pm->cmd.buttons & BUTTON_ALT_ATTACK) &&
;5693:			(pm->cmd.upmove > 0 || pm->cmd.forwardmove || pm->cmd.rightmove))
;5694:		{ //if you try to zoom while moving, just convert it into a primary attack
;5695:			pm->cmd.buttons &= ~BUTTON_ALT_ATTACK;
;5696:			pm->cmd.buttons |= BUTTON_ATTACK;
;5697:		}
;5698:		*/
;5699:
;5700:		if (pm->cmd.upmove > 0 || pm->cmd.forwardmove || pm->cmd.rightmove)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
GTI4 $2229
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
NEI4 $2229
ADDRLP4 20
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRI4
EQI4 $2226
LABELV $2229
line 5701
;5701:		{
line 5702
;5702:			if (pm->ps->zoomMode == 1 && pm->ps->zoomLockTime < pm->cmd.serverTime)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2230
ADDRLP4 32
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $2230
line 5703
;5703:			{ //check for == 1 so we can't turn binoculars off with disruptor alt fire
line 5704
;5704:				pm->ps->zoomMode = 0;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 5705
;5705:				pm->ps->zoomTime = pm->ps->commandTime;
ADDRLP4 36
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 1336
ADDP4
ADDRLP4 36
INDIRP4
INDIRI4
ASGNI4
line 5706
;5706:				pm->ps->zoomLocked = qfalse;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 5707
;5707:				PM_AddEvent(EV_DISRUPTOR_ZOOMSOUND);
CNSTI4 35
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 5708
;5708:			}
LABELV $2230
line 5709
;5709:		}
LABELV $2226
line 5711
;5710:
;5711:		if ( pm->cmd.buttons & BUTTON_ATTACK )
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2232
line 5712
;5712:		{
line 5715
;5713:			// If we are zoomed, we should switch the ammo usage to the alt-fire, otherwise, we'll
;5714:			//	just use whatever ammo was selected from above
;5715:			if ( pm->ps->zoomMode )
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2209
line 5716
;5716:			{
line 5717
;5717:				amount = pm->ps->ammo[weaponData[ pm->ps->weapon ].ammoIndex] - 
ADDRLP4 28
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 56
ADDRLP4 28
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
SUBI4
ASGNI4
line 5719
;5718:							weaponData[pm->ps->weapon].altEnergyPerShot;
;5719:			}
line 5720
;5720:		}
ADDRGP4 $2209
JUMPV
LABELV $2232
line 5722
;5721:		else
;5722:		{
line 5724
;5723:			// alt-fire button pressing doesn't use any ammo
;5724:			amount = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5725
;5725:		}
line 5726
;5726:	}
ADDRGP4 $2209
JUMPV
LABELV $2208
line 5727
;5727:	else if (pm->ps->weapon == WP_DISRUPTOR) //still perform certain checks, even if the weapon is not ready
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2236
line 5728
;5728:	{
line 5729
;5729:		if (pm->cmd.upmove > 0 || pm->cmd.forwardmove || pm->cmd.rightmove)
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
GTI4 $2241
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
NEI4 $2241
ADDRLP4 8
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
EQI4 $2238
LABELV $2241
line 5730
;5730:		{
line 5731
;5731:			if (pm->ps->zoomMode == 1 && pm->ps->zoomLockTime < pm->cmd.serverTime)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2242
ADDRLP4 20
INDIRP4
CNSTI4 1348
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $2242
line 5732
;5732:			{ //check for == 1 so we can't turn binoculars off with disruptor alt fire
line 5733
;5733:				pm->ps->zoomMode = 0;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 5734
;5734:				pm->ps->zoomTime = pm->ps->commandTime;
ADDRLP4 24
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 1336
ADDP4
ADDRLP4 24
INDIRP4
INDIRI4
ASGNI4
line 5735
;5735:				pm->ps->zoomLocked = qfalse;
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 5736
;5736:				PM_AddEvent(EV_DISRUPTOR_ZOOMSOUND);
CNSTI4 35
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 5737
;5737:			}
LABELV $2242
line 5738
;5738:		}
LABELV $2238
line 5739
;5739:	}
LABELV $2236
LABELV $2209
line 5742
;5740:
;5741:	// set the firing flag for continuous beam weapons, saber will fire even if out of ammo
;5742:	if ( !(pm->ps->pm_flags & PMF_RESPAWNED) && 
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $2244
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
EQI4 $2244
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 129
BANDI4
ADDRLP4 16
INDIRI4
EQI4 $2244
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $2246
ADDRLP4 12
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2244
LABELV $2246
line 5746
;5743:			pm->ps->pm_type != PM_INTERMISSION && 
;5744:			( pm->cmd.buttons & (BUTTON_ATTACK|BUTTON_ALT_ATTACK)) && 
;5745:			( amount >= 0 || pm->ps->weapon == WP_SABER ))
;5746:	{
line 5747
;5747:		if ( pm->cmd.buttons & BUTTON_ALT_ATTACK )
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2247
line 5748
;5748:		{
line 5749
;5749:			pm->ps->eFlags |= EF_ALT_FIRING;
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 5750
;5750:		}
ADDRGP4 $2248
JUMPV
LABELV $2247
line 5752
;5751:		else
;5752:		{
line 5753
;5753:			pm->ps->eFlags &= ~EF_ALT_FIRING;
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 5754
;5754:		}
LABELV $2248
line 5757
;5755:
;5756:		// This flag should always get set, even when alt-firing
;5757:		pm->ps->eFlags |= EF_FIRING;
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 5758
;5758:	} 
ADDRGP4 $2245
JUMPV
LABELV $2244
line 5760
;5759:	else 
;5760:	{
line 5762
;5761:		// Clear 'em out
;5762:		pm->ps->eFlags &= ~(EF_FIRING|EF_ALT_FIRING);
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 5763
;5763:	}
LABELV $2245
line 5766
;5764:
;5765:	// disruptor should convert a main fire to an alt-fire if the gun is currently zoomed
;5766:	if ( pm->ps->weapon == WP_DISRUPTOR)
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2249
line 5767
;5767:	{
line 5768
;5768:		if ( pm->cmd.buttons & BUTTON_ATTACK && pm->ps->zoomMode == 1 && pm->ps->zoomLocked)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
BANDI4
ADDRLP4 28
INDIRI4
EQI4 $2251
ADDRLP4 32
ADDRLP4 20
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $2251
ADDRLP4 32
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2251
line 5769
;5769:		{
line 5771
;5770:			// converting the main fire to an alt-fire
;5771:			pm->cmd.buttons |= BUTTON_ALT_ATTACK;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 5772
;5772:			pm->ps->eFlags |= EF_ALT_FIRING;
ADDRLP4 40
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 5773
;5773:		}
ADDRGP4 $2252
JUMPV
LABELV $2251
line 5774
;5774:		else if ( pm->cmd.buttons & BUTTON_ALT_ATTACK && pm->ps->zoomMode == 1 && pm->ps->zoomLocked)
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 40
INDIRI4
EQI4 $2253
ADDRLP4 44
ADDRLP4 36
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2253
ADDRLP4 44
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $2253
line 5775
;5775:		{
line 5776
;5776:			pm->cmd.buttons &= ~BUTTON_ALT_ATTACK;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 5777
;5777:			pm->ps->eFlags &= ~EF_ALT_FIRING;
ADDRLP4 52
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 5778
;5778:		}
LABELV $2253
LABELV $2252
line 5779
;5779:	}
LABELV $2249
line 5780
;5780:}
LABELV $2205
endproc PM_AdjustAttackStates 56 4
export BG_CmdForRoll
proc BG_CmdForRoll 8 0
line 5783
;5781:
;5782:void BG_CmdForRoll( int anim, usercmd_t *pCmd )
;5783:{
line 5784
;5784:	switch ( (anim&~ANIM_TOGGLEBIT) )
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 885
LTI4 $2256
ADDRLP4 0
INDIRI4
CNSTI4 888
GTI4 $2256
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2263-3540
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2263
address $2259
address $2260
address $2262
address $2261
code
line 5785
;5785:	{
LABELV $2259
line 5787
;5786:	case BOTH_ROLL_F:
;5787:		pCmd->forwardmove = 127;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 127
ASGNI1
line 5788
;5788:		pCmd->rightmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 5789
;5789:		break;
ADDRGP4 $2257
JUMPV
LABELV $2260
line 5791
;5790:	case BOTH_ROLL_B:
;5791:		pCmd->forwardmove = -127;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 -127
ASGNI1
line 5792
;5792:		pCmd->rightmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 5793
;5793:		break;
ADDRGP4 $2257
JUMPV
LABELV $2261
line 5795
;5794:	case BOTH_ROLL_R:
;5795:		pCmd->forwardmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 0
ASGNI1
line 5796
;5796:		pCmd->rightmove = 127;
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 127
ASGNI1
line 5797
;5797:		break;
ADDRGP4 $2257
JUMPV
LABELV $2262
line 5799
;5798:	case BOTH_ROLL_L:
;5799:		pCmd->forwardmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 0
ASGNI1
line 5800
;5800:		pCmd->rightmove = -127;
ADDRFP4 4
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 -127
ASGNI1
line 5801
;5801:		break;
LABELV $2256
LABELV $2257
line 5803
;5802:	}
;5803:	pCmd->upmove = 0;
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 5804
;5804:}
LABELV $2255
endproc BG_CmdForRoll 8 0
export BG_AdjustClientSpeed
proc BG_AdjustClientSpeed 80 8
line 5809
;5805:
;5806:qboolean PM_SaberInTransition( int move );
;5807:
;5808:void BG_AdjustClientSpeed(playerState_t *ps, usercmd_t *cmd, int svTime)
;5809:{
line 5813
;5810:	//For prediction, always reset speed back to the last known server base speed
;5811:	//If we didn't do this, under lag we'd eventually dwindle speed down to 0 even though
;5812:	//that would not be the correct predicted value.
;5813:	ps->speed = ps->basespeed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 5815
;5814:
;5815:	if (ps->forceHandExtend == HANDEXTEND_DODGE)
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 7
NEI4 $2266
line 5816
;5816:	{
line 5817
;5817:		ps->speed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 0
ASGNI4
line 5818
;5818:	}
LABELV $2266
line 5820
;5819:
;5820:	if (ps->forceHandExtend == HANDEXTEND_KNOCKDOWN)
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $2268
line 5821
;5821:	{
line 5822
;5822:		ps->speed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 0
ASGNI4
line 5823
;5823:	}
LABELV $2268
line 5825
;5824:
;5825:	if (ps->usingATST && (cmd->rightmove ||
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2270
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $2272
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
EQI4 $2270
LABELV $2272
line 5827
;5826:		cmd->forwardmove))
;5827:	{
line 5828
;5828:		if (!ps->holdMoveTime)
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2271
line 5829
;5829:		{
line 5830
;5830:			ps->torsoAnim = ( ( ps->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 16
CNSTI4 2048
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 16
INDIRI4
BANDI4
ADDRLP4 16
INDIRI4
BXORI4
CNSTI4 834
BORI4
ASGNI4
line 5832
;5831:				| BOTH_RUN1START;
;5832:			ps->holdMoveTime = svTime;
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 5833
;5833:		}
line 5834
;5834:	}
ADDRGP4 $2271
JUMPV
LABELV $2270
line 5836
;5835:	else
;5836:	{
line 5837
;5837:		ps->holdMoveTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
CNSTI4 0
ASGNI4
line 5839
;5838:
;5839:		if (ps->usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2275
line 5840
;5840:		{
line 5841
;5841:			ps->torsoAnim = ( ( ps->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 16
CNSTI4 2048
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 16
INDIRI4
BANDI4
ADDRLP4 16
INDIRI4
BXORI4
CNSTI4 571
BORI4
ASGNI4
line 5843
;5842:				| BOTH_STAND1;
;5843:		}
LABELV $2275
line 5844
;5844:	}
LABELV $2271
line 5846
;5845:
;5846:	if (ps->usingATST &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2277
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
CNSTI4 500
LTI4 $2279
ADDRLP4 20
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $2277
LABELV $2279
line 5849
;5847:		((svTime - ps->holdMoveTime) < 500 ||
;5848:		!ps->holdMoveTime))
;5849:	{
line 5850
;5850:		ps->speed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 0
ASGNI4
line 5851
;5851:	}
ADDRGP4 $2278
JUMPV
LABELV $2277
line 5852
;5852:	else if (ps->usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2280
line 5853
;5853:	{
line 5854
;5854:		if ((svTime - ps->holdMoveTime) < 600)
ADDRFP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
SUBI4
CNSTI4 600
GEI4 $2282
line 5855
;5855:		{
line 5856
;5856:			ps->speed *= 0.4;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1053609165
ADDRLP4 24
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5857
;5857:		}
ADDRGP4 $2283
JUMPV
LABELV $2282
line 5858
;5858:		else if ((svTime - ps->holdMoveTime) < 1000)
ADDRFP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
GEI4 $2284
line 5859
;5859:		{
line 5860
;5860:			ps->speed *= 0.5;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1056964608
ADDRLP4 24
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5861
;5861:		}
ADDRGP4 $2285
JUMPV
LABELV $2284
line 5862
;5862:		else if ((svTime - ps->holdMoveTime) < 1400)
ADDRFP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
SUBI4
CNSTI4 1400
GEI4 $2286
line 5863
;5863:		{
line 5864
;5864:			ps->speed *= 0.6;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1058642330
ADDRLP4 24
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5865
;5865:		}
ADDRGP4 $2287
JUMPV
LABELV $2286
line 5866
;5866:		else if ((svTime - ps->holdMoveTime) < 1700)
ADDRFP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
SUBI4
CNSTI4 1700
GEI4 $2288
line 5867
;5867:		{
line 5868
;5868:			ps->speed *= 0.7;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1060320051
ADDRLP4 24
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5869
;5869:		}
ADDRGP4 $2289
JUMPV
LABELV $2288
line 5870
;5870:		else if ((svTime - ps->holdMoveTime) < 1900)
ADDRFP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1324
ADDP4
INDIRI4
SUBI4
CNSTI4 1900
GEI4 $2290
line 5871
;5871:		{
line 5872
;5872:			ps->speed *= 0.8;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1061997773
ADDRLP4 24
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5873
;5873:		}
LABELV $2290
LABELV $2289
LABELV $2287
LABELV $2285
LABELV $2283
line 5875
;5874:
;5875:		if (cmd->forwardmove < 0)
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $2292
line 5876
;5876:		{
line 5877
;5877:			ps->torsoAnim = ( ( ps->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 28
CNSTI4 2048
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 28
INDIRI4
BANDI4
ADDRLP4 28
INDIRI4
BXORI4
CNSTI4 852
BORI4
ASGNI4
line 5879
;5878:				| BOTH_WALKBACK1;
;5879:			ps->speed *= 0.6;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTF4 1058642330
ADDRLP4 32
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5880
;5880:		}
ADDRGP4 $2281
JUMPV
LABELV $2292
line 5882
;5881:		else
;5882:		{
line 5883
;5883:			ps->torsoAnim = ( ( ps->torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT )
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 28
CNSTI4 2048
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 28
INDIRI4
BANDI4
ADDRLP4 28
INDIRI4
BXORI4
CNSTI4 833
BORI4
ASGNI4
line 5885
;5884:				| BOTH_RUN1;
;5885:		}
line 5886
;5886:	}
ADDRGP4 $2281
JUMPV
LABELV $2280
line 5887
;5887:	else if ( cmd->forwardmove < 0 && !(cmd->buttons&BUTTON_WALKING) && pm->ps->groundEntityNum != ENTITYNUM_NONE && (jk2gameplay == VERSION_1_04 || pm->modParms.physics == MV_JK2SP) )
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
GEI4 $2294
ADDRLP4 32
CNSTI4 16
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
BANDI4
ADDRLP4 28
INDIRI4
NEI4 $2294
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $2294
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $2296
ADDRLP4 36
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2294
LABELV $2296
line 5888
;5888:	{//running backwards is slower than running forwards (like SP)// TA: Actually... is this even correct?! this is in a way different place in sp. and this whole func doesnt exist there
line 5889
;5889:		ps->speed *= 0.75;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTF4 1061158912
ADDRLP4 40
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5890
;5890:	}
LABELV $2294
LABELV $2281
LABELV $2278
line 5892
;5891:
;5892:	if (ps->fd.forcePowersActive & (1 << FP_GRIP) && jk2gameplay != VERSION_1_02)
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $2297
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $2297
line 5893
;5893:	{
line 5894
;5894:		ps->speed *= 0.4;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTF4 1053609165
ADDRLP4 40
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5895
;5895:	}
LABELV $2297
line 5897
;5896:
;5897:	if (ps->fd.forcePowersActive & (1 << FP_SPEED))
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2299
line 5898
;5898:	{
line 5920
;5899:		
;5900:
;5901:#if JK2_CGAME
;5902:		if (pm->haveForceSpeedSmash) { // got it tunneled. can actually predict nicely then :)
;5903:			if (ps->fd.forceSpeedSmash < 1.2)
;5904:			{
;5905:				ps->fd.forceSpeedSmash = 1.2f;
;5906:			}
;5907:			if (ps->fd.forceSpeedSmash > forceSpeedLevels[3]) //2.8
;5908:			{
;5909:				ps->fd.forceSpeedSmash = forceSpeedLevels[3];
;5910:			}
;5911:		}
;5912:		else {
;5913:			//ps->fd.forceSpeedSmash = 2.0f; // not networked. just force setting to the force level 3 level. UNLESS it is tunneled somehow TODO
;5914:			//if (ps->fd.forceSpeedSmash > forceSpeedLevels[3]) //2.8
;5915:			{
;5916:				ps->fd.forceSpeedSmash = forceSpeedLevels[3]; // it's not networked so we stutter because we predict ourselves without the actual speedgain. assume level 3 i guess, should be correct in 99% of cases of actual gameplay. 
;5917:			}
;5918:		}
;5919:#else
;5920:		if (ps->fd.forceSpeedSmash < 1.2)
ADDRFP4 0
INDIRP4
CNSTI4 1136
ADDP4
INDIRF4
CNSTF4 1067030938
GEF4 $2301
line 5921
;5921:		{
line 5922
;5922:			ps->fd.forceSpeedSmash = 1.2f;
ADDRFP4 0
INDIRP4
CNSTI4 1136
ADDP4
CNSTF4 1067030938
ASGNF4
line 5923
;5923:		}
LABELV $2301
line 5924
;5924:		if (ps->fd.forceSpeedSmash > forceSpeedLevels[ps->fd.forcePowerLevel[FP_SPEED]]) //2.8
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 1136
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceSpeedLevels
ADDP4
INDIRF4
LEF4 $2303
line 5925
;5925:		{
line 5926
;5926:			ps->fd.forceSpeedSmash = forceSpeedLevels[ps->fd.forcePowerLevel[FP_SPEED]];
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 1136
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceSpeedLevels
ADDP4
INDIRF4
ASGNF4
line 5927
;5927:		}
LABELV $2303
line 5929
;5928:#endif
;5929:		ps->speed *= ps->fd.forceSpeedSmash;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CVIF4 4
ADDRLP4 44
INDIRP4
CNSTI4 1136
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 5930
;5930:		ps->fd.forceSpeedSmash += 0.005f;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 1136
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1000593162
ADDF4
ASGNF4
line 5931
;5931:	}
LABELV $2299
line 5933
;5932:
;5933:	if (ps->fd.forcePowersActive & (1 << FP_RAGE))
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2305
line 5934
;5934:	{
line 5935
;5935:		ps->speed *= 1.3;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTF4 1067869798
ADDRLP4 40
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5936
;5936:	}
ADDRGP4 $2306
JUMPV
LABELV $2305
line 5937
;5937:	else if (ps->fd.forceRageRecoveryTime > svTime)
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $2307
line 5938
;5938:	{
line 5939
;5939:		ps->speed *= 0.75;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTF4 1061158912
ADDRLP4 40
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5940
;5940:	}
LABELV $2307
LABELV $2306
line 5942
;5941:
;5942:	if (ps->fd.forceGripCripple)
ADDRFP4 0
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2309
line 5943
;5943:	{
line 5944
;5944:		if (ps->fd.forcePowersActive & (1 << FP_RAGE))
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2311
line 5945
;5945:		{
line 5946
;5946:			ps->speed *= 0.9;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTF4 1063675494
ADDRLP4 40
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5947
;5947:		}
ADDRGP4 $2312
JUMPV
LABELV $2311
line 5948
;5948:		else if (ps->fd.forcePowersActive & (1 << FP_SPEED))
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2313
line 5949
;5949:		{ //force speed will help us escape
line 5950
;5950:			ps->speed *= 0.8;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTF4 1061997773
ADDRLP4 40
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5951
;5951:		}
ADDRGP4 $2314
JUMPV
LABELV $2313
line 5953
;5952:		else
;5953:		{
line 5954
;5954:			ps->speed *= 0.2;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTF4 1045220557
ADDRLP4 40
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5955
;5955:		}
LABELV $2314
LABELV $2312
line 5956
;5956:	}
LABELV $2309
line 5958
;5957:
;5958:	if ( BG_SaberInAttack( ps->saberMove ) && cmd->forwardmove < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $2315
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
GEI4 $2315
line 5959
;5959:	{//if running backwards while attacking, don't run as fast.
line 5960
;5960:		switch( ps->fd.saberAnimLevel )
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
EQI4 $2320
ADDRLP4 48
INDIRI4
CNSTI4 2
EQI4 $2321
ADDRLP4 48
INDIRI4
CNSTI4 3
EQI4 $2322
ADDRGP4 $2316
JUMPV
line 5961
;5961:		{
LABELV $2320
line 5963
;5962:		case FORCE_LEVEL_1:
;5963:			ps->speed *= 0.75f;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTF4 1061158912
ADDRLP4 56
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5964
;5964:			break;
ADDRGP4 $2316
JUMPV
LABELV $2321
line 5966
;5965:		case FORCE_LEVEL_2:
;5966:			ps->speed *= 0.60f;
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTF4 1058642330
ADDRLP4 60
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5967
;5967:			break;
ADDRGP4 $2316
JUMPV
LABELV $2322
line 5969
;5968:		case FORCE_LEVEL_3:
;5969:			ps->speed *= 0.45f;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTF4 1055286886
ADDRLP4 64
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5970
;5970:			break;
line 5972
;5971:		default:
;5972:			break;
line 5974
;5973:		}
;5974:	}
ADDRGP4 $2316
JUMPV
LABELV $2315
line 5975
;5975:	else if ( BG_SpinningSaberAnim( ps->legsAnim ) )
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $2323
line 5976
;5976:	{
line 5977
;5977:		if (ps->fd.saberAnimLevel == FORCE_LEVEL_3 && jk2gameplay != VERSION_1_02)
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2325
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $2325
line 5978
;5978:		{
line 5979
;5979:			ps->speed *= 0.3f;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTF4 1050253722
ADDRLP4 52
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5980
;5980:		}
ADDRGP4 $2324
JUMPV
LABELV $2325
line 5982
;5981:		else
;5982:		{
line 5983
;5983:			ps->speed *= 0.5f;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTF4 1056964608
ADDRLP4 52
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5984
;5984:		}
line 5985
;5985:	}
ADDRGP4 $2324
JUMPV
LABELV $2323
line 5986
;5986:	else if ( ps->weapon == WP_SABER && BG_SaberInAttack( ps->saberMove ) )
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2327
ADDRLP4 52
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $2327
line 5987
;5987:	{//if attacking with saber while running, drop your speed
line 5988
;5988:		switch( ps->fd.saberAnimLevel )
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 2
EQI4 $2332
ADDRLP4 60
INDIRI4
CNSTI4 3
EQI4 $2333
ADDRGP4 $2328
JUMPV
line 5989
;5989:		{
LABELV $2332
line 5991
;5990:		case FORCE_LEVEL_2:
;5991:			ps->speed *= 0.85f;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTF4 1062836634
ADDRLP4 68
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5992
;5992:			break;
ADDRGP4 $2328
JUMPV
LABELV $2333
line 5994
;5993:		case FORCE_LEVEL_3:
;5994:			ps->speed *= (jk2gameplay == VERSION_1_02 ? 0.70f : 0.55f);
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $2335
ADDRLP4 72
CNSTF4 1060320051
ASGNF4
ADDRGP4 $2336
JUMPV
LABELV $2335
ADDRLP4 72
CNSTF4 1057803469
ASGNF4
LABELV $2336
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CVIF4 4
ADDRLP4 72
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 5995
;5995:			break;
line 5997
;5996:		default:
;5997:			break;
line 5999
;5998:		}
;5999:	}
ADDRGP4 $2328
JUMPV
LABELV $2327
line 6000
;6000:	else if (ps->weapon == WP_SABER && ps->fd.saberAnimLevel == FORCE_LEVEL_3 &&
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2337
ADDRLP4 60
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2337
ADDRLP4 60
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 PM_SaberInTransition
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $2337
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $2337
line 6002
;6001:		PM_SaberInTransition(ps->saberMove) && jk2gameplay != VERSION_1_02)
;6002:	{ //Now, we want to even slow down in transitions for level 3 (since it has chains and stuff now)
line 6003
;6003:		if (cmd->forwardmove < 0)
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $2339
line 6004
;6004:		{
line 6005
;6005:			ps->speed *= 0.4f;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTF4 1053609165
ADDRLP4 68
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 6006
;6006:		}
ADDRGP4 $2340
JUMPV
LABELV $2339
line 6008
;6007:		else
;6008:		{
line 6009
;6009:			ps->speed *= 0.6f;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTF4 1058642330
ADDRLP4 68
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 6010
;6010:		}
LABELV $2340
line 6011
;6011:	}
LABELV $2337
LABELV $2328
LABELV $2324
LABELV $2316
line 6014
;6012:
;6013:
;6014:	if ( BG_InRoll( ps, ps->legsAnim ) && ps->speed > 200 )
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $2341
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 200
LEI4 $2341
line 6015
;6015:	{ //can't roll unless you're able to move normally
line 6016
;6016:		BG_CmdForRoll( ps->legsAnim, cmd );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BG_CmdForRoll
CALLV
pop
line 6017
;6017:		if ((ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_ROLL_B)
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 886
NEI4 $2343
line 6018
;6018:		{ //backwards roll is pretty fast, should also be slower
line 6019
;6019:			ps->speed = ps->legsTimer/2.5;
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1075838976
DIVF4
CVFI4 4
ASGNI4
line 6020
;6020:		}
ADDRGP4 $2344
JUMPV
LABELV $2343
line 6022
;6021:		else
;6022:		{
line 6023
;6023:			ps->speed = ps->legsTimer/1.5;//450;
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1069547520
DIVF4
CVFI4 4
ASGNI4
line 6024
;6024:		}
LABELV $2344
line 6025
;6025:		if (pm->modParms.physics == MV_DREAM) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 11
NEI4 $2345
line 6026
;6026:			ps->speed *= 1.28f;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTF4 1067702026
ADDRLP4 76
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 6027
;6027:		}
ADDRGP4 $2346
JUMPV
LABELV $2345
line 6028
;6028:		else {
line 6029
;6029:			if (ps->speed > 600)
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 600
LEI4 $2347
line 6030
;6030:			{
line 6031
;6031:				ps->speed = 600;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 600
ASGNI4
line 6032
;6032:			}
LABELV $2347
line 6033
;6033:		}
LABELV $2346
line 6035
;6034:		//Automatically slow down as the roll ends.
;6035:	}
LABELV $2341
line 6036
;6036:}
LABELV $2265
endproc BG_AdjustClientSpeed 80 8
export PM_CheckRollEnd
proc PM_CheckRollEnd 56 16
line 6038
;6037:
;6038:void PM_CheckRollEnd() {
line 6039
;6039:	qboolean inRoll = BG_InRoll(pm->ps, pm->ps->legsAnim);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 6040
;6040:	int airDuration = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 6042
;6041:
;6042:	switch (pm->roll.status) {
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $2350
ADDRLP4 16
INDIRI4
CNSTI4 4
GTI4 $2350
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2422
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2422
address $2353
address $2365
address $2379
address $2407
address $2351
code
LABELV $2353
line 6044
;6043:		case ROLL_NONE:
;6044:			if (inRoll) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $2351
line 6045
;6045:				pm->roll.status = ROLL_STARTED;
ADDRGP4 pm
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 1
ASGNI4
line 6046
;6046:				pm->roll.rollDisqualified = pm->roll.lastSpeed > 325.0f; // seems that with normal (not ultra low) fps and vsnap we can reach a maximum groundpeed of absolutely maximally 325. so, allow rollympics participation for rolls out of standing basically.
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
CNSTF4 1134723072
LEF4 $2357
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $2358
JUMPV
LABELV $2357
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $2358
ADDRLP4 28
INDIRP4
CNSTI4 480
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 6047
;6047:				pm->roll.segmentDisqualified = qfalse;
ADDRGP4 pm
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 0
ASGNI4
line 6048
;6048:				pm->roll.rollAirTime = -1;
ADDRGP4 pm
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 -1
ASGNI4
line 6049
;6049:				pm->roll.rollType = (pm->ps->legsAnim & ~ANIM_TOGGLEBIT )- BOTH_ROLL_F;
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 885
SUBI4
ASGNI4
line 6050
;6050:				pm->roll.rollSpeed = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 520
ADDP4
CNSTF4 0
ASGNF4
line 6051
;6051:				pm->roll.rollStartedInAir = pm->ps->groundEntityNum == ENTITYNUM_NONE; // shouldnt really happen but lets be safe
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2360
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $2361
JUMPV
LABELV $2360
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $2361
ADDRLP4 40
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 6052
;6052:				if (pm->debugLevel > 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2351
line 6053
;6053:					Com_Printf("%i:ROLL_NONE->ROLL_STARTED\n", c_pmove);
ADDRGP4 $2364
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 6054
;6054:				}
line 6055
;6055:			}
line 6056
;6056:			break;
ADDRGP4 $2351
JUMPV
LABELV $2365
line 6058
;6057:		case ROLL_STARTED:
;6058:			if (!inRoll) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2366
line 6059
;6059:				pm->roll.status = ROLL_NONE;
ADDRGP4 pm
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 0
ASGNI4
line 6060
;6060:				if (pm->debugLevel > 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2351
line 6061
;6061:					Com_Printf("%i:ROLL_STARTED->ROLL_NONE\n", c_pmove);
ADDRGP4 $2370
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 6062
;6062:				}
line 6063
;6063:			}
ADDRGP4 $2351
JUMPV
LABELV $2366
line 6064
;6064:			else if (pm->roll.lastFrameWasRoll && inRoll && pm->ps->groundEntityNum == ENTITYNUM_NONE) {
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2351
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2351
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2351
line 6065
;6065:				pm->roll.status = ROLL_AIR;
ADDRGP4 pm
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 2
ASGNI4
line 6066
;6066:				pm->roll.rollAirStarted = pm->ps->commandTime;
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 32
INDIRP4
INDIRP4
INDIRI4
ASGNI4
line 6067
;6067:				pm->roll.airClientSpeed = pm->roll.rollStartedInAir ? 0 : pm->roll.lastClientSpeed;
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2374
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 $2375
JUMPV
LABELV $2374
ADDRLP4 36
ADDRGP4 pm
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ASGNI4
LABELV $2375
ADDRLP4 40
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 6068
;6068:				if (pm->debugLevel > 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2351
line 6069
;6069:					Com_Printf("%i:ROLL_STARTED->ROLL_AIR\n", c_pmove);
ADDRGP4 $2378
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 6070
;6070:				}
line 6071
;6071:			}
line 6072
;6072:			break;
ADDRGP4 $2351
JUMPV
LABELV $2379
line 6074
;6073:		case ROLL_AIR:
;6074:			airDuration = MAX(0,pm->ps->commandTime - pm->roll.rollAirStarted);
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
CNSTI4 0
ADDRLP4 36
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
SUBI4
LEI4 $2381
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 $2382
JUMPV
LABELV $2381
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 40
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
SUBI4
ASGNI4
LABELV $2382
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 6075
;6075:			if (!inRoll) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2383
line 6076
;6076:				pm->roll.status = ROLL_ENDED;
ADDRGP4 pm
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 4
ASGNI4
line 6078
;6077:				//if (pm->roll.lastSpeed > pm->roll.rollSpeed) {
;6078:				if (airDuration > pm->roll.rollAirTime) { // longest air segment counts
ADDRLP4 4
INDIRI4
ADDRGP4 pm
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
LEI4 $2385
line 6079
;6079:					pm->roll.rollSpeed = pm->roll.lastSpeed;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ASGNF4
line 6080
;6080:					pm->roll.finalAirClientSpeed = pm->roll.airClientSpeed;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 6081
;6081:					pm->roll.rollAirTime = airDuration;
ADDRGP4 pm
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 6082
;6082:					if (pm->roll.segmentDisqualified) {
ADDRGP4 pm
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2387
line 6083
;6083:						pm->roll.rollDisqualified = qtrue;
ADDRGP4 pm
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 1
ASGNI4
line 6084
;6084:					}
LABELV $2387
line 6085
;6085:					if (pm->debugLevel > 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2386
line 6086
;6086:						Com_Printf("%i:ROLL_AIR->ROLL_ENDED %.2f %d (usespeed)\n", c_pmove, pm->roll.lastSpeed, pm->roll.airClientSpeed);
ADDRGP4 $2391
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 6087
;6087:					}
line 6088
;6088:				}
ADDRGP4 $2386
JUMPV
LABELV $2385
line 6089
;6089:				else {
line 6090
;6090:					if (pm->debugLevel > 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2392
line 6091
;6091:						Com_Printf("%i:ROLL_AIR->ROLL_ENDED %.2f %d\n", c_pmove, pm->roll.lastSpeed, pm->roll.airClientSpeed);
ADDRGP4 $2394
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 6092
;6092:					}
LABELV $2392
line 6093
;6093:				}
LABELV $2386
line 6094
;6094:				pm->roll.lastRollEndedTime = pm->roll.lastClientTime;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ASGNI4
line 6095
;6095:			}
ADDRGP4 $2351
JUMPV
LABELV $2383
line 6096
;6096:			else if (pm->ps->groundEntityNum != ENTITYNUM_NONE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $2351
line 6097
;6097:				pm->roll.status = ROLL_TOUCH;
ADDRGP4 pm
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 3
ASGNI4
line 6099
;6098:				//if (pm->roll.lastSpeed > pm->roll.rollSpeed) {
;6099:				if (airDuration > pm->roll.rollAirTime) {
ADDRLP4 4
INDIRI4
ADDRGP4 pm
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
LEI4 $2397
line 6100
;6100:					pm->roll.rollSpeed = pm->roll.lastSpeed;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ASGNF4
line 6101
;6101:					pm->roll.finalAirClientSpeed = pm->roll.airClientSpeed;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 6102
;6102:					pm->roll.rollAirTime = airDuration;
ADDRGP4 pm
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 6103
;6103:					if (pm->roll.segmentDisqualified) {
ADDRGP4 pm
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2399
line 6104
;6104:						pm->roll.rollDisqualified = qtrue;
ADDRGP4 pm
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 1
ASGNI4
line 6105
;6105:					}
LABELV $2399
line 6106
;6106:					if (pm->debugLevel > 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2351
line 6107
;6107:						Com_Printf("%i:ROLL_AIR->ROLL_TOUCH %.2f %d (usespeed)\n", c_pmove, pm->roll.lastSpeed, pm->roll.airClientSpeed);
ADDRGP4 $2403
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 6108
;6108:					}
line 6109
;6109:				}
ADDRGP4 $2351
JUMPV
LABELV $2397
line 6110
;6110:				else {
line 6111
;6111:					if (pm->debugLevel > 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2351
line 6112
;6112:						Com_Printf("%i:ROLL_AIR->ROLL_TOUCH %.2f %d\n", c_pmove, pm->roll.lastSpeed, pm->roll.airClientSpeed);
ADDRGP4 $2406
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 6113
;6113:					}
line 6114
;6114:				}
line 6115
;6115:			}
line 6116
;6116:			break;
ADDRGP4 $2351
JUMPV
LABELV $2407
line 6118
;6117:		case ROLL_TOUCH:
;6118:			if (!inRoll) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2408
line 6119
;6119:				pm->roll.status = ROLL_ENDED;
ADDRGP4 pm
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 4
ASGNI4
line 6120
;6120:				pm->roll.lastRollEndedTime = pm->roll.lastClientTime;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ASGNI4
line 6121
;6121:				if (pm->debugLevel > 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2351
line 6122
;6122:					Com_Printf("%i:ROLL_TOUCH->ROLL_ENDED\n", c_pmove);
ADDRGP4 $2412
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 6123
;6123:				}
line 6124
;6124:			}
ADDRGP4 $2351
JUMPV
LABELV $2408
line 6125
;6125:			else if (pm->ps->groundEntityNum == ENTITYNUM_NONE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2351
line 6126
;6126:				pm->roll.status = ROLL_AIR;
ADDRGP4 pm
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 2
ASGNI4
line 6127
;6127:				pm->roll.rollAirStarted = pm->ps->commandTime;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 44
INDIRP4
INDIRP4
INDIRI4
ASGNI4
line 6128
;6128:				pm->roll.segmentDisqualified = qtrue;
ADDRGP4 pm
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 1
ASGNI4
line 6129
;6129:				pm->roll.airClientSpeed = pm->roll.rollStartedInAir ? 0 : pm->roll.lastClientSpeed;
ADDRLP4 52
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2416
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRGP4 $2417
JUMPV
LABELV $2416
ADDRLP4 48
ADDRGP4 pm
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ASGNI4
LABELV $2417
ADDRLP4 52
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 6130
;6130:				if (pm->debugLevel > 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2351
line 6131
;6131:					Com_Printf("%i:ROLL_TOUCH->ROLL_AIR\n", c_pmove);
ADDRGP4 $2420
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 6132
;6132:				}
line 6133
;6133:			}
line 6134
;6134:			break;
line 6136
;6135:		case ROLL_ENDED:
;6136:			break;
LABELV $2350
LABELV $2351
line 6138
;6137:	}
;6138:}
LABELV $2349
endproc PM_CheckRollEnd 56 16
proc PM_SetAnimAfterQ2 64 16
line 6140
;6139:
;6140:static void PM_SetAnimAfterQ2(vec3_t oldVel) { // idk if this is right lol
line 6143
;6141:
;6142:	qboolean	duck, run;
;6143:	float xyspeed = sqrtf(pm->ps->velocity[0] * pm->ps->velocity[0] + pm->ps->velocity[1] * pm->ps->velocity[1]);
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 36
ADDRLP4 28
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 36
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 40
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 40
INDIRF4
ASGNF4
line 6144
;6144:	int currentAnim = (pm->ps->legsAnim & ~ANIM_TOGGLEBIT);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 6145
;6145:	int newAnim = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 6149
;6146:	float delta;
;6147:	qboolean	transitionFromJump;
;6148:
;6149:	if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2424
line 6150
;6150:		duck = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $2425
JUMPV
LABELV $2424
line 6152
;6151:	else
;6152:		duck = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $2425
line 6153
;6153:	if (xyspeed)
ADDRLP4 12
INDIRF4
CNSTF4 0
EQF4 $2426
line 6154
;6154:		run = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $2427
JUMPV
LABELV $2426
line 6156
;6155:	else
;6156:		run = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $2427
line 6158
;6157:
;6158:	if ((oldVel[2] < 0) && (pm->ps->velocity[2] > oldVel[2]) && (pm->ps->groundEntityNum == ENTITYNUM_NONE))
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 0
GEF4 $2428
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 44
INDIRF4
LEF4 $2428
ADDRLP4 48
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2428
line 6159
;6159:	{
line 6160
;6160:		delta = oldVel[2];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 6161
;6161:	}
ADDRGP4 $2429
JUMPV
LABELV $2428
line 6163
;6162:	else
;6163:	{
line 6164
;6164:		if (pm->ps->groundEntityNum == ENTITYNUM_NONE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2430
line 6165
;6165:			delta = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 6166
;6166:		}
ADDRGP4 $2431
JUMPV
LABELV $2430
line 6167
;6167:		else {
line 6168
;6168:			delta = pm->ps->velocity[2] - oldVel[2];
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 6169
;6169:		}
LABELV $2431
line 6170
;6170:	}
LABELV $2429
line 6171
;6171:	delta = delta * delta * 0.0001;
ADDRLP4 4
CNSTF4 953267991
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 6196
;6172:
;6173:	//// check for stand/duck and stop/go transitions
;6174:	//if (duck != client->anim_duck && client->anim_priority < ANIM_DEATH)
;6175:	//	goto newanim;
;6176:	//if (run != client->anim_run && client->anim_priority == ANIM_BASIC)
;6177:	//	goto newanim;
;6178:	//if (!ent->groundentity && client->anim_priority <= ANIM_WAVE)
;6179:	//	goto newanim;
;6180:
;6181:	//if (client->anim_priority == ANIM_REVERSE)
;6182:	//{
;6183:	//	if (ent->s.frame > client->anim_end)
;6184:	//	{
;6185:	//		ent->s.frame--;
;6186:	//		return;
;6187:	//	}
;6188:	//}
;6189:	//else if (ent->s.frame < client->anim_end)
;6190:	//{	// continue an animation
;6191:	//	ent->s.frame++;
;6192:	//	return;
;6193:	//}
;6194:
;6195:	//if (client->anim_priority == ANIM_DEATH)
;6196:	if (pm->ps->pm_flags & PM_DEAD)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2432
line 6197
;6197:		return;		// stay there
ADDRGP4 $2423
JUMPV
LABELV $2432
LABELV $2434
line 6210
;6198:	//if (client->anim_priority == ANIM_JUMP)
;6199:	//{
;6200:	//	if (!ent->groundentity)
;6201:	//		return;		// stay there
;6202:	//	ent->client->anim_priority = ANIM_WAVE;
;6203:	//	ent->s.frame = FRAME_jump3;
;6204:	//	ent->client->anim_end = FRAME_jump6;
;6205:	//	return;
;6206:	//}
;6207:
;6208:newanim:
;6209:	// return to either a running or standing frame
;6210:	newAnim = BOTH_WALK1;
ADDRLP4 0
CNSTI4 822
ASGNI4
line 6212
;6211:
;6212:	if (pm->ps->groundEntityNum != ENTITYNUM_NONE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $2435
line 6213
;6213:		if (pm->ps->fd.forceSide) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1188
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2437
line 6214
;6214:			transitionFromJump = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 6215
;6215:			pm->ps->fd.forceSide = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1188
ADDP4
CNSTI4 0
ASGNI4
line 6216
;6216:		}
ADDRGP4 $2436
JUMPV
LABELV $2437
line 6217
;6217:		else {
line 6218
;6218:			transitionFromJump = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 6219
;6219:			pm->ps->fd.forceSide = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1188
ADDP4
CNSTI4 1
ASGNI4
line 6220
;6220:		}
line 6221
;6221:	}
ADDRGP4 $2436
JUMPV
LABELV $2435
line 6222
;6222:	else {
line 6223
;6223:		pm->ps->fd.forceSide = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1188
ADDP4
CNSTI4 0
ASGNI4
line 6224
;6224:	}
LABELV $2436
line 6226
;6225:
;6226:	if (pm->ps->groundEntityNum == ENTITYNUM_NONE)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2439
line 6227
;6227:	{
line 6228
;6228:		newAnim = BOTH_JUMP1;
ADDRLP4 0
CNSTI4 856
ASGNI4
line 6229
;6229:	}
ADDRGP4 $2440
JUMPV
LABELV $2439
line 6230
;6230:	else if (run)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $2441
line 6231
;6231:	{	// running
line 6232
;6232:		if (duck)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2443
line 6233
;6233:		{
line 6234
;6234:			newAnim = BOTH_CROUCH1WALK;
ADDRLP4 0
CNSTI4 798
ASGNI4
line 6235
;6235:		}
ADDRGP4 $2442
JUMPV
LABELV $2443
line 6237
;6236:		else
;6237:		{
line 6238
;6238:			newAnim = BOTH_RUN1;
ADDRLP4 0
CNSTI4 833
ASGNI4
line 6239
;6239:		}
line 6240
;6240:	}
ADDRGP4 $2442
JUMPV
LABELV $2441
line 6242
;6241:	else
;6242:	{	// standing
line 6243
;6243:		if (duck)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $2445
line 6244
;6244:		{
line 6245
;6245:			newAnim = BOTH_CROUCH1;
ADDRLP4 0
CNSTI4 796
ASGNI4
line 6246
;6246:		}
ADDRGP4 $2446
JUMPV
LABELV $2445
line 6248
;6247:		else
;6248:		{
line 6249
;6249:			newAnim = BOTH_STAND1;
ADDRLP4 0
CNSTI4 571
ASGNI4
line 6250
;6250:		}
LABELV $2446
line 6251
;6251:	}
LABELV $2442
LABELV $2440
line 6253
;6252:
;6253:	if (newAnim != currentAnim && (currentAnim != BOTH_JUMP1 || transitionFromJump)) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2447
ADDRLP4 8
INDIRI4
CNSTI4 856
NEI4 $2449
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $2447
LABELV $2449
line 6254
;6254:		if (newAnim != BOTH_JUMP1 && currentAnim == BOTH_JUMP1) {
ADDRLP4 60
CNSTI4 856
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $2450
ADDRLP4 8
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $2450
line 6255
;6255:			PM_AddEventWithParm(EV_FALL, delta);
CNSTI4 11
ARGI4
ADDRLP4 4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 PM_AddEventWithParm
CALLV
pop
line 6256
;6256:		}
LABELV $2450
line 6257
;6257:		PM_SetAnim(SETANIM_BOTH,newAnim,SETANIM_FLAG_NORMAL,100);
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 6258
;6258:	}
LABELV $2447
line 6260
;6259:	
;6260:	if (pm->cmd.buttons & BUTTON_TALK) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2452
line 6261
;6261:		pm->ps->eFlags |= EF_TALK;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 6262
;6262:	}
ADDRGP4 $2453
JUMPV
LABELV $2452
line 6263
;6263:	else {
line 6264
;6264:		pm->ps->eFlags &= ~EF_TALK;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 6265
;6265:	}
LABELV $2453
line 6266
;6266:}
LABELV $2423
endproc PM_SetAnimAfterQ2 64 16
export PM_SetModData
proc PM_SetModData 16 12
line 6268
;6267:
;6268:void PM_SetModData(pmove_t* pmove) {
line 6269
;6269:	memset(&pmove->modParms, 0, sizeof(pmove->modParms));
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 16
ARGU4
ADDRGP4 memset
CALLP4
pop
line 6270
;6270:	if (pmove->mod == SVMOD_TOMMYTERNAL && pmove->ps->stats[STAT_RACEMODE]) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2455
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2455
line 6271
;6271:		pmove->modParms.raceMode = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
CNSTI4 1
ASGNI4
line 6272
;6272:		pmove->modParms.physics = pmove->ps->stats[STAT_MOVEMENTSTYLE];
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 284
ADDP4
ADDRLP4 4
INDIRP4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
line 6273
;6273:		pmove->modParms.runFlags = pmove->ps->stats[STAT_RUNFLAGS];
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 288
ADDP4
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ASGNI4
line 6274
;6274:		pmove->modParms.msecRestrict = pmove->ps->stats[STAT_MSECRESTRICT];
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
line 6275
;6275:	}
ADDRGP4 $2456
JUMPV
LABELV $2455
line 6276
;6276:	else if (pmove->mod == SVMOD_JK2PRO) {
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2457
line 6277
;6277:		pmove->modParms.raceMode = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
CNSTI4 1
ASGNI4
line 6278
;6278:		pmove->modParms.physics = pmove->ps->stats[STAT_MOVEMENTSTYLE];
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 284
ADDP4
ADDRLP4 4
INDIRP4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
line 6279
;6279:	}
LABELV $2457
LABELV $2456
line 6280
;6280:}
LABELV $2454
endproc PM_SetModData 16 12
lit
align 4
LABELV $2631
byte 4 0
skip 8
align 4
LABELV $2819
byte 4 0
skip 8
export PmoveSingle
code
proc PmoveSingle 536 16
line 6291
;6281:
;6282:/*
;6283:================
;6284:PmoveSingle
;6285:
;6286:================
;6287:*/
;6288:void trap_SnapVector( float *v );
;6289:void PmoveQ2(pmoveq2_t* pmove);
;6290:void PmoveCSS(pmovecss_t* pmove);
;6291:void PmoveSingle (pmove_t *pmove) {
line 6293
;6292:	int oldCmdRoll;
;6293:	pm = pmove;
ADDRGP4 pm
ADDRFP4 0
INDIRP4
ASGNP4
line 6295
;6294:
;6295:	if (pm->ps->pm_type != PM_SPECTATOR && pm->ps->pm_type != PM_NOCLIP && pm->ps->pm_type != PM_INTERMISSION) {
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $2460
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $2460
ADDRLP4 4
INDIRI4
CNSTI4 6
EQI4 $2460
line 6296
;6296:		if (pm->modParms.physics == MV_Q2) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 9
NEI4 $2462
line 6299
;6297:			pmoveq2_t pmq2;
;6298:			vec3_t oldVel;
;6299:			int oldGEN = pm->ps->groundEntityNum;
ADDRLP4 240
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 6300
;6300:			memset(&pmq2, 0, sizeof(pmq2));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTU4 232
ARGU4
ADDRGP4 memset
CALLP4
pop
line 6301
;6301:			pmq2.ps = pm->ps;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
line 6302
;6302:			pmq2.cmd = pm->cmd;
ADDRLP4 8+4
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 28
line 6303
;6303:			pmq2.tracemask = pm->tracemask;
ADDRLP4 8+200
ADDRGP4 pm
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 6304
;6304:			pmq2.trace = pm->q2trace ? pm->q2trace : pm->trace;
ADDRGP4 pm
INDIRP4
CNSTI4 304
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2468
ADDRLP4 256
ADDRGP4 pm
INDIRP4
CNSTI4 304
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $2469
JUMPV
LABELV $2468
ADDRLP4 256
ADDRGP4 pm
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
ASGNP4
LABELV $2469
ADDRLP4 8+204
ADDRLP4 256
INDIRP4
ASGNP4
line 6305
;6305:			pmq2.cornerSkims = pm->q2Skims;
ADDRLP4 8+220
ADDRGP4 pm
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
ASGNI4
line 6306
;6306:			pmq2.haveQ2StyleTrace = pm->q2TraceStyle == 2;
ADDRGP4 pm
INDIRP4
CNSTI4 312
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2473
ADDRLP4 260
CNSTI4 1
ASGNI4
ADDRGP4 $2474
JUMPV
LABELV $2473
ADDRLP4 260
CNSTI4 0
ASGNI4
LABELV $2474
ADDRLP4 8+212
ADDRLP4 260
INDIRI4
ASGNI4
line 6308
;6307:			//pmq2.trace = pm->trace;
;6308:			pmq2.snapinitial = pm->positionChangedOutsidePmove;
ADDRLP4 8+32
ADDRGP4 pm
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
ASGNI4
line 6309
;6309:			pmq2.pointcontents = pm->pointcontents;
ADDRLP4 8+208
ADDRGP4 pm
INDIRP4
CNSTI4 308
ADDP4
INDIRP4
ASGNP4
line 6310
;6310:			pmq2.debugLevel = pm->debugLevel;
ADDRLP4 8+216
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 6311
;6311:			pmq2.antiLoop = &pm->antiLoop;
ADDRLP4 8+228
ADDRGP4 pm
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
line 6312
;6312:			VectorCopy(pm->mins, pmq2.mins);
ADDRLP4 8+168
ADDRGP4 pm
INDIRP4
CNSTI4 220
ADDP4
INDIRB
ASGNB 12
line 6313
;6313:			VectorCopy(pm->maxs, pmq2.maxs);
ADDRLP4 8+180
ADDRGP4 pm
INDIRP4
CNSTI4 232
ADDP4
INDIRB
ASGNB 12
line 6314
;6314:			VectorCopy(pm->ps->velocity, oldVel);
ADDRLP4 244
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 6315
;6315:			c_pmove++;
ADDRLP4 264
ADDRGP4 c_pmove
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 264
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6316
;6316:			PmoveQ2(&pmq2);
ADDRLP4 8
ARGP4
ADDRGP4 PmoveQ2
CALLV
pop
line 6317
;6317:			PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 6318
;6318:			if (oldGEN != ENTITYNUM_NONE && pm->ps->groundEntityNum == ENTITYNUM_NONE && pm->cmd.upmove > 0) {
ADDRLP4 268
CNSTI4 1023
ASGNI4
ADDRLP4 240
INDIRI4
ADDRLP4 268
INDIRI4
EQI4 $2481
ADDRLP4 272
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDRLP4 268
INDIRI4
NEI4 $2481
ADDRLP4 272
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $2481
line 6319
;6319:				PM_AddEvent(EV_JUMP);
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 6320
;6320:			}
LABELV $2481
line 6321
;6321:			PM_SetAnimAfterQ2(oldVel);
ADDRLP4 244
ARGP4
ADDRGP4 PM_SetAnimAfterQ2
CALLV
pop
line 6322
;6322:			pm->ps->commandTime = pm->cmd.serverTime;
ADDRLP4 276
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
INDIRP4
ADDRLP4 276
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 6323
;6323:			VectorCopy(pmq2.mins, pm->mins);
ADDRGP4 pm
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 8+168
INDIRB
ASGNB 12
line 6324
;6324:			VectorCopy(pmq2.maxs, pm->maxs);
ADDRGP4 pm
INDIRP4
CNSTI4 232
ADDP4
ADDRLP4 8+180
INDIRB
ASGNB 12
line 6325
;6325:			return;
ADDRGP4 $2459
JUMPV
LABELV $2462
line 6327
;6326:		}
;6327:		else if (pm->modParms.physics == MV_CSS) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 8
NEI4 $2485
line 6330
;6328:			pmovecss_t pmcss;
;6329:			vec3_t oldVel;
;6330:			memset(&pmcss, 0, sizeof(pmcss));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTU4 224
ARGU4
ADDRGP4 memset
CALLP4
pop
line 6331
;6331:			pmcss.ps = pm->ps;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
line 6332
;6332:			pmcss.cmd = pm->cmd;
ADDRLP4 8+4
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 28
line 6333
;6333:			pmcss.tracemask = pm->tracemask;
ADDRLP4 8+208
ADDRGP4 pm
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ASGNI4
line 6334
;6334:			pmcss.trace = pm->trace;
ADDRLP4 8+216
ADDRGP4 pm
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
ASGNP4
line 6335
;6335:			pmcss.snapinitial = pm->positionChangedOutsidePmove;
ADDRLP4 8+36
ADDRGP4 pm
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
ASGNI4
line 6336
;6336:			pmcss.pointcontents = pm->pointcontents;
ADDRLP4 8+220
ADDRGP4 pm
INDIRP4
CNSTI4 308
ADDP4
INDIRP4
ASGNP4
line 6337
;6337:			pmcss.antiLoop = &pm->antiLoop;
ADDRLP4 8+212
ADDRGP4 pm
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
line 6338
;6338:			VectorCopy(pm->mins, pmcss.mins);
ADDRLP4 8+176
ADDRGP4 pm
INDIRP4
CNSTI4 220
ADDP4
INDIRB
ASGNB 12
line 6339
;6339:			VectorCopy(pm->maxs, pmcss.maxs);
ADDRLP4 8+188
ADDRGP4 pm
INDIRP4
CNSTI4 232
ADDP4
INDIRB
ASGNB 12
line 6340
;6340:			pmcss.oldbuttons = pm->oldButtons;
ADDRLP4 8+32
ADDRGP4 pm
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ASGNI4
line 6341
;6341:			VectorCopy(pm->ps->velocity, oldVel);
ADDRLP4 232
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 6342
;6342:			c_pmove++;
ADDRLP4 244
ADDRGP4 c_pmove
ASGNP4
ADDRLP4 244
INDIRP4
ADDRLP4 244
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6343
;6343:			PmoveCSS(&pmcss);
ADDRLP4 8
ARGP4
ADDRGP4 PmoveCSS
CALLV
pop
line 6344
;6344:			PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 6345
;6345:			PM_SetAnimAfterQ2(oldVel);
ADDRLP4 232
ARGP4
ADDRGP4 PM_SetAnimAfterQ2
CALLV
pop
line 6346
;6346:			pm->ps->commandTime = pm->cmd.serverTime;
ADDRLP4 248
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
INDIRP4
ADDRLP4 248
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 6347
;6347:			VectorCopy(pmcss.mins, pm->mins);
ADDRGP4 pm
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 8+176
INDIRB
ASGNB 12
line 6348
;6348:			VectorCopy(pmcss.maxs, pm->maxs);
ADDRGP4 pm
INDIRP4
CNSTI4 232
ADDP4
ADDRLP4 8+188
INDIRB
ASGNB 12
line 6349
;6349:			return;
ADDRGP4 $2459
JUMPV
LABELV $2485
line 6351
;6350:		}
;6351:	}
LABELV $2460
line 6353
;6352:
;6353:	gPMDoSlowFall = PM_DoSlowFall();
ADDRLP4 8
ADDRGP4 PM_DoSlowFall
CALLI4
ASGNI4
ADDRGP4 gPMDoSlowFall
ADDRLP4 8
INDIRI4
ASGNI4
line 6355
;6354:
;6355:	oldCmdRoll = pm->cmd.angles[ROLL];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 6356
;6356:	if (pm->modParms.runFlags & RFL_BOT) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2498
line 6357
;6357:		pm->cmd.angles[ROLL] = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 6358
;6358:	}
LABELV $2498
line 6362
;6359:
;6360:	// this counter lets us debug movement problems with a journal
;6361:	// by setting a conditional breakpoint fot the previous frame
;6362:	c_pmove++;
ADDRLP4 12
ADDRGP4 c_pmove
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 6365
;6363:
;6364:	// clear results
;6365:	pm->numtouch = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 0
ASGNI4
line 6366
;6366:	pm->watertype = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 244
ADDP4
CNSTI4 0
ASGNI4
line 6367
;6367:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 0
ASGNI4
line 6369
;6368:
;6369:	if (pm->ps->pm_type == PM_FLOAT)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2500
line 6370
;6370:	{ //You get no control over where you go in grip movement
line 6371
;6371:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 6372
;6372:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 6373
;6373:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 6374
;6374:	}
LABELV $2500
line 6376
;6375:
;6376:	if (pm->ps->eFlags & EF_DISINTEGRATION)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $2502
line 6377
;6377:	{
line 6378
;6378:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 6379
;6379:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 6380
;6380:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 6381
;6381:	}
LABELV $2502
line 6383
;6382:
;6383:	if ( pm->ps->saberMove == LS_A_LUNGE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 14
NEI4 $2504
line 6384
;6384:	{//can't move during lunge
line 6385
;6385:		pm->cmd.rightmove = pm->cmd.upmove = 0;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI1 0
ASGNI1
ADDRLP4 16
INDIRP4
CNSTI4 30
ADDP4
ADDRLP4 20
INDIRI1
ASGNI1
ADDRLP4 16
INDIRP4
CNSTI4 29
ADDP4
ADDRLP4 20
INDIRI1
ASGNI1
line 6386
;6386:		if ( pm->ps->legsTimer > 500 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 500
LEI4 $2506
line 6387
;6387:		{
line 6388
;6388:			pm->cmd.forwardmove = 127;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 127
ASGNI1
line 6389
;6389:		}
ADDRGP4 $2507
JUMPV
LABELV $2506
line 6391
;6390:		else
;6391:		{
line 6392
;6392:			pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 6393
;6393:		}
LABELV $2507
line 6394
;6394:	}
LABELV $2504
line 6396
;6395:
;6396:	if ( pm->ps->saberMove == LS_A_JUMP_T__B_ )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 15
NEI4 $2508
line 6397
;6397:	{//can't move during leap
line 6398
;6398:		if ( pm->ps->groundEntityNum != ENTITYNUM_NONE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $2510
line 6399
;6399:		{//hit the ground
line 6400
;6400:			pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 6401
;6401:		}
LABELV $2510
line 6402
;6402:		pm->cmd.rightmove = pm->cmd.upmove = 0;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI1 0
ASGNI1
ADDRLP4 16
INDIRP4
CNSTI4 30
ADDP4
ADDRLP4 20
INDIRI1
ASGNI1
ADDRLP4 16
INDIRP4
CNSTI4 29
ADDP4
ADDRLP4 20
INDIRI1
ASGNI1
line 6403
;6403:	}
LABELV $2508
line 6405
;6404:
;6405:	if ( pm->ps->saberMove == LS_A_BACK || pm->ps->saberMove == LS_A_BACK_CR 
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 12
EQI4 $2518
ADDRLP4 16
INDIRI4
CNSTI4 13
EQI4 $2518
ADDRLP4 16
INDIRI4
CNSTI4 11
EQI4 $2518
ADDRLP4 16
INDIRI4
CNSTI4 16
EQI4 $2518
ADDRLP4 16
INDIRI4
CNSTI4 17
EQI4 $2518
ADDRLP4 16
INDIRI4
CNSTI4 15
NEI4 $2512
LABELV $2518
line 6408
;6406:		|| pm->ps->saberMove == LS_A_BACKSTAB || pm->ps->saberMove == LS_A_FLIP_STAB ||
;6407:		pm->ps->saberMove == LS_A_FLIP_SLASH || pm->ps->saberMove == LS_A_JUMP_T__B_ )
;6408:	{
line 6409
;6409:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 6410
;6410:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 6411
;6411:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 6412
;6412:	}
LABELV $2512
line 6414
;6413:
;6414:	if ((pm->ps->legsAnim&~ANIM_TOGGLEBIT) == (BOTH_A2_STABBACK1) ||
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 564
EQI4 $2525
ADDRLP4 20
INDIRI4
CNSTI4 565
EQI4 $2525
ADDRLP4 20
INDIRI4
CNSTI4 570
EQI4 $2525
ADDRLP4 20
INDIRI4
CNSTI4 568
EQI4 $2525
ADDRLP4 20
INDIRI4
CNSTI4 567
EQI4 $2525
ADDRLP4 20
INDIRI4
CNSTI4 566
NEI4 $2519
LABELV $2525
line 6420
;6415:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == (BOTH_ATTACK_BACK) ||
;6416:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == (BOTH_CROUCHATTACKBACK1) ||
;6417:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == (BOTH_FORCELEAP2_T__B_) ||
;6418:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == (BOTH_JUMPFLIPSTABDOWN) ||
;6419:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == (BOTH_JUMPFLIPSLASHDOWN1))
;6420:	{
line 6421
;6421:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 6422
;6422:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 6423
;6423:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 6424
;6424:	}
LABELV $2519
line 6426
;6425:
;6426:	if (((pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_KISSER1LOOP ||
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 745
EQI4 $2528
ADDRLP4 24
INDIRI4
CNSTI4 752
NEI4 $2526
LABELV $2528
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $2526
line 6428
;6427:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_KISSEE1LOOP) && jk2gameplay == VERSION_1_04)
;6428:	{
line 6429
;6429:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 6430
;6430:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 6431
;6431:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 6432
;6432:	}
LABELV $2526
line 6434
;6433:
;6434:	if (pm->ps->emplacedIndex)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2529
line 6435
;6435:	{
line 6436
;6436:		if (pm->cmd.forwardmove < 0)
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $2531
line 6437
;6437:		{
line 6438
;6438:			pm->ps->emplacedIndex = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 596
ADDP4
CNSTI4 0
ASGNI4
line 6439
;6439:		}
ADDRGP4 $2532
JUMPV
LABELV $2531
line 6441
;6440:		else
;6441:		{
line 6442
;6442:			pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 6443
;6443:			pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 6444
;6444:			pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 6445
;6445:		}
LABELV $2532
line 6446
;6446:	}
LABELV $2529
line 6448
;6447:
;6448:	if (pm->ps->weapon == WP_DISRUPTOR && pm->ps->weaponstate == WEAPON_CHARGING_ALT)
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 5
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $2533
ADDRLP4 28
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $2533
line 6449
;6449:	{ //not allowed to move while charging the disruptor
line 6450
;6450:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 6451
;6451:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 6452
;6452:		if (pm->cmd.upmove > 0)
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $2535
line 6453
;6453:		{
line 6454
;6454:			pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 6455
;6455:		}
LABELV $2535
line 6456
;6456:	}
LABELV $2533
line 6458
;6457:
;6458:	pm->roll.lastSpeed = XYSPEED(pm->ps->velocity);
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 48
ADDRLP4 40
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 44
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 48
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 52
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 500
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
line 6459
;6459:	pm->roll.lastClientSpeed = pm->ps->speed;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 504
ADDP4
ADDRLP4 56
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ASGNI4
line 6460
;6460:	pm->roll.lastFrameWasRoll = BG_InRoll(pm->ps, pm->ps->legsAnim);
ADDRLP4 60
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 6461
;6461:	pm->roll.lastClientTime = pm->ps->commandTime;
ADDRLP4 72
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 508
ADDP4
ADDRLP4 72
INDIRP4
INDIRP4
INDIRI4
ASGNI4
line 6463
;6462:
;6463:	BG_AdjustClientSpeed(pm->ps, &pm->cmd, pm->cmd.serverTime);
ADDRLP4 76
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
INDIRP4
ARGP4
ADDRLP4 80
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
INDIRI4
ARGI4
ADDRGP4 BG_AdjustClientSpeed
CALLV
pop
line 6465
;6464:
;6465:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2537
line 6466
;6466:		pm->tracemask &= ~CONTENTS_BODY;	// corpses can fly through bodies
ADDRLP4 84
ADDRGP4 pm
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 6467
;6467:	}
LABELV $2537
line 6471
;6468:
;6469:	// make sure walking button is clear if they are running, to avoid
;6470:	// proxy no-footsteps cheats
;6471:	if ( abs( pm->cmd.forwardmove ) > 64 || abs( pm->cmd.rightmove ) > 64 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 84
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 64
GTI4 $2541
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 88
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 64
LEI4 $2539
LABELV $2541
line 6472
;6472:		pm->cmd.buttons &= ~BUTTON_WALKING;
ADDRLP4 92
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 6473
;6473:	}
LABELV $2539
line 6476
;6474:
;6475:	// set the talk balloon flag
;6476:	if ( pm->cmd.buttons & BUTTON_TALK ) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2542
line 6477
;6477:		pm->ps->eFlags |= EF_TALK;
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 6478
;6478:	} else {
ADDRGP4 $2543
JUMPV
LABELV $2542
line 6479
;6479:		pm->ps->eFlags &= ~EF_TALK;
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 6480
;6480:	}
LABELV $2543
line 6484
;6481:
;6482:	// In certain situations, we may want to control which attack buttons are pressed and what kind of functionality
;6483:	//	is attached to them
;6484:	PM_AdjustAttackStates( pm );
ADDRGP4 pm
INDIRP4
ARGP4
ADDRGP4 PM_AdjustAttackStates
CALLV
pop
line 6487
;6485:
;6486:	// clear the respawned flag if attack and use are cleared
;6487:	if ( pm->ps->stats[STAT_HEALTH] > 0 && 
ADDRLP4 92
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
LEI4 $2544
ADDRLP4 92
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 5
BANDI4
ADDRLP4 96
INDIRI4
NEI4 $2544
line 6488
;6488:		!( pm->cmd.buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE) ) ) {
line 6489
;6489:		pm->ps->pm_flags &= ~PMF_RESPAWNED;
ADDRLP4 100
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 6490
;6490:	}
LABELV $2544
line 6495
;6491:
;6492:	// if talk button is down, dissallow all other input
;6493:	// this is to prevent any possible intercept proxy from
;6494:	// adding fake talk balloons
;6495:	if ( pmove->cmd.buttons & BUTTON_TALK && jk2startversion != VERSION_1_02 ) { // MVSDK: 1.02 people are used to walk around with open console, 1.03 and 1.04 can't do that. Let's make this depending on the actual version we're running, not the gameplay...
ADDRLP4 100
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2546
ADDRGP4 jk2startversion
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $2546
line 6498
;6496:		// keep the talk button set tho for when the cmd.serverTime > 66 msec
;6497:		// and the same cmd is used multiple times in Pmove
;6498:		pmove->cmd.buttons = BUTTON_TALK;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 2
ASGNI4
line 6499
;6499:		pmove->cmd.forwardmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 6500
;6500:		pmove->cmd.rightmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 6501
;6501:		pmove->cmd.upmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 6502
;6502:	}
LABELV $2546
line 6505
;6503:
;6504:	// clear all pmove local vars
;6505:	memset (&pml, 0, sizeof(pml));
ADDRGP4 pml
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1192
ARGU4
ADDRGP4 memset
CALLP4
pop
line 6507
;6506:
;6507:	pml.randomAdd = pmove->unlockRandom ? 1 : 0;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2550
ADDRLP4 104
CNSTI4 1
ASGNI4
ADDRGP4 $2551
JUMPV
LABELV $2550
ADDRLP4 104
CNSTI4 0
ASGNI4
LABELV $2551
ADDRGP4 pml+1168
ADDRLP4 104
INDIRI4
ASGNI4
line 6510
;6508:
;6509:	// determine the time
;6510:	pml.seed = pmove->cmd.serverTime;
ADDRGP4 pml+1164
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 6511
;6511:	pml.msec = pmove->cmd.serverTime - pm->ps->commandTime;
ADDRGP4 pml+40
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 6512
;6512:	if ( pml.msec < 1 ) {
ADDRGP4 pml+40
INDIRI4
CNSTI4 1
GEI4 $2554
line 6513
;6513:		pml.msec = 1;
ADDRGP4 pml+40
CNSTI4 1
ASGNI4
line 6514
;6514:	} else if ( pml.msec > 200 && (pml.msec > pm->modParms.msecRestrict && pm->modParms.msecRestrict != -1)) { // racemode can allow higher for shits and giggles
ADDRGP4 $2555
JUMPV
LABELV $2554
ADDRGP4 pml+40
INDIRI4
CNSTI4 200
LEI4 $2558
ADDRLP4 108
ADDRGP4 pm
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ASGNI4
ADDRGP4 pml+40
INDIRI4
ADDRLP4 108
INDIRI4
LEI4 $2558
ADDRLP4 108
INDIRI4
CNSTI4 -1
EQI4 $2558
line 6515
;6515:		pml.msec = 200;
ADDRGP4 pml+40
CNSTI4 200
ASGNI4
line 6516
;6516:	}
LABELV $2558
LABELV $2555
line 6517
;6517:	pm->ps->commandTime = pmove->cmd.serverTime;
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 6521
;6518:
;6519:
;6520:	// save old org in case we get stuck
;6521:	VectorCopy (pm->ps->origin, pml.previous_origin);
ADDRGP4 pml+1136
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 6524
;6522:
;6523:	// save old velocity for crashlanding
;6524:	VectorCopy (pm->ps->velocity, pml.previous_velocity);
ADDRGP4 pml+1148
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 6526
;6525:
;6526:	pml.frametime = pml.msec * 0.001;
ADDRGP4 pml+36
CNSTF4 981668463
ADDRGP4 pml+40
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 6528
;6527:
;6528:	if (pm->modParms.runFlags & RFL_CLIMBTECH) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2567
line 6529
;6529:		PM_AdjustAngleForWallJump(pm->ps, &pm->cmd, qtrue);
ADDRLP4 112
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 PM_AdjustAngleForWallJump
CALLI4
pop
line 6530
;6530:	}
LABELV $2567
line 6531
;6531:	PM_AdjustAngleForWallRun(pm->ps, &pm->cmd, qtrue);
ADDRLP4 112
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 PM_AdjustAngleForWallRun
CALLI4
pop
line 6533
;6532:
;6533:	if ((pm->ps->saberMove == LS_A_JUMP_T__B_ || pm->ps->saberMove == LS_A_LUNGE ||
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 15
EQI4 $2572
ADDRLP4 116
INDIRI4
CNSTI4 14
EQI4 $2572
ADDRLP4 116
INDIRI4
CNSTI4 13
EQI4 $2574
ADDRLP4 116
INDIRI4
CNSTI4 12
EQI4 $2574
ADDRLP4 116
INDIRI4
CNSTI4 11
NEI4 $2569
LABELV $2574
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $2569
LABELV $2572
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $2569
line 6536
;6534:		((pm->ps->saberMove == LS_A_BACK_CR || pm->ps->saberMove == LS_A_BACK ||
;6535:		pm->ps->saberMove == LS_A_BACKSTAB) && jk2gameplay == VERSION_1_04)) && jk2gameplay != VERSION_1_02) // MVSDK: One of the place where 1.02, 1.03 and 1.04 are all different!
;6536:	{
line 6537
;6537:		PM_SetPMViewAngle(pm->ps, pm->ps->viewangles, &pm->cmd);
ADDRLP4 120
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 120
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 120
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 PM_SetPMViewAngle
CALLV
pop
line 6538
;6538:	}
LABELV $2569
line 6540
;6539:
;6540:	if (((pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_KISSER1LOOP ||
ADDRLP4 120
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 745
EQI4 $2577
ADDRLP4 120
INDIRI4
CNSTI4 752
NEI4 $2575
LABELV $2577
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $2575
line 6542
;6541:		(pm->ps->legsAnim&~ANIM_TOGGLEBIT) == BOTH_KISSEE1LOOP) && jk2gameplay == VERSION_1_04)
;6542:	{
line 6543
;6543:		pm->ps->viewangles[PITCH] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
CNSTF4 0
ASGNF4
line 6544
;6544:		PM_SetPMViewAngle(pm->ps, pm->ps->viewangles, &pm->cmd);
ADDRLP4 124
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 128
ADDRLP4 124
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 124
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 PM_SetPMViewAngle
CALLV
pop
line 6545
;6545:	}
LABELV $2575
line 6548
;6546:
;6547:	// update the viewangles
;6548:	PM_UpdateViewAngles( pm->ps, &pm->cmd );
ADDRLP4 124
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 6550
;6549:
;6550:	if (pm->modParms.runFlags & RFL_BOT) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2578
line 6552
;6551:		// in strafebot mode, we tunnel strafebot factor through ROLL value
;6552:		float oldRoll = pm->ps->viewangles[ROLL];
ADDRLP4 128
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
INDIRF4
ASGNF4
line 6553
;6553:		pm->ps->viewangles[ROLL] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTF4 0
ASGNF4
line 6554
;6554:		AngleVectors(pm->ps->viewangles, pml.forward, pml.right, pml.up);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 pml
ARGP4
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+24
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 6555
;6555:		pm->ps->viewangles[ROLL] = oldRoll;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 128
INDIRF4
ASGNF4
line 6556
;6556:	}
ADDRGP4 $2579
JUMPV
LABELV $2578
line 6557
;6557:	else {
line 6560
;6558:
;6559:#ifdef JK2_GAME
;6560:		if ( g_mv_blockspeedhack.integer )
ADDRGP4 g_mv_blockspeedhack+12
INDIRI4
CNSTI4 0
EQI4 $2582
line 6561
;6561:		{
line 6562
;6562:			float oldRoll = pm->ps->viewangles[ROLL];
ADDRLP4 128
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
INDIRF4
ASGNF4
line 6563
;6563:			pm->ps->viewangles[ROLL] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTF4 0
ASGNF4
line 6564
;6564:			AngleVectors (pm->ps->viewangles, pml.forward, pml.right, pml.up);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 pml
ARGP4
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+24
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 6565
;6565:			pm->ps->viewangles[ROLL] = oldRoll;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 128
INDIRF4
ASGNF4
line 6566
;6566:		}
ADDRGP4 $2583
JUMPV
LABELV $2582
line 6568
;6567:		else
;6568:		{
line 6570
;6569:#endif
;6570:		AngleVectors (pm->ps->viewangles, pml.forward, pml.right, pml.up);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 pml
ARGP4
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+24
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 6572
;6571:#ifdef JK2_GAME
;6572:		}
LABELV $2583
line 6574
;6573:#endif
;6574:	}
LABELV $2579
line 6576
;6575:
;6576:	if ( pm->cmd.upmove < 10 && (!(pm->modParms.runFlags & RFL_CLIMBTECH) || !(pm->ps->pm_flags & PMF_STUCK_TO_WALL))) {
ADDRLP4 128
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $2589
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRLP4 128
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 132
INDIRI4
EQI4 $2591
ADDRLP4 128
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 132
INDIRI4
NEI4 $2589
LABELV $2591
line 6578
;6577:		// not holding jump
;6578:		pm->ps->pm_flags &= ~PMF_JUMP_HELD;
ADDRLP4 136
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 6579
;6579:	}
LABELV $2589
line 6582
;6580:
;6581:	// decide if backpedaling animations should be used
;6582:	if ( pm->cmd.forwardmove < 0 ) {
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $2592
line 6583
;6583:		pm->ps->pm_flags |= PMF_BACKWARDS_RUN;
ADDRLP4 136
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 6584
;6584:	} else if ( pm->cmd.forwardmove > 0 || ( pm->cmd.forwardmove == 0 && pm->cmd.rightmove ) ) {
ADDRGP4 $2593
JUMPV
LABELV $2592
ADDRLP4 136
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 136
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRLP4 140
INDIRI4
ADDRLP4 144
INDIRI4
GTI4 $2596
ADDRLP4 140
INDIRI4
ADDRLP4 144
INDIRI4
NEI4 $2594
ADDRLP4 136
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 144
INDIRI4
EQI4 $2594
LABELV $2596
line 6585
;6585:		pm->ps->pm_flags &= ~PMF_BACKWARDS_RUN;
ADDRLP4 148
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 6586
;6586:	}
LABELV $2594
LABELV $2593
line 6588
;6587:
;6588:	if ( pm->ps->pm_type >= PM_DEAD ) {
ADDRLP4 148
CNSTI4 4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRI4
ADDRLP4 148
INDIRI4
LTI4 $2597
line 6589
;6589:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 6590
;6590:		pm->cmd.rightmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 6591
;6591:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 6592
;6592:	}
LABELV $2597
line 6594
;6593:
;6594:	if (pm->ps->saberLockTime >= pm->cmd.serverTime)
ADDRLP4 152
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRLP4 152
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $2599
line 6595
;6595:	{
line 6596
;6596:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 6597
;6597:		pm->cmd.forwardmove = 50;
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 50
ASGNI1
line 6598
;6598:		pm->cmd.rightmove = 0;//*= 0.1;
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 6599
;6599:	}
LABELV $2599
line 6601
;6600:
;6601:	if ( pm->ps->pm_type == PM_SPECTATOR ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2601
line 6602
;6602:		PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 6603
;6603:		PM_FlyMove ();
ADDRGP4 PM_FlyMove
CALLV
pop
line 6604
;6604:		PM_DropTimers ();
ADDRGP4 PM_DropTimers
CALLV
pop
line 6605
;6605:		if (pm->modParms.runFlags & RFL_BOT) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2459
line 6606
;6606:			pm->cmd.angles[ROLL] = oldCmdRoll;
ADDRGP4 pm
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 6607
;6607:		}
line 6608
;6608:		return;
ADDRGP4 $2459
JUMPV
LABELV $2601
line 6611
;6609:	}
;6610:
;6611:	if ( pm->ps->pm_type == PM_NOCLIP ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2605
line 6612
;6612:		PM_NoclipMove ();
ADDRGP4 PM_NoclipMove
CALLV
pop
line 6613
;6613:		PM_DropTimers (); 
ADDRGP4 PM_DropTimers
CALLV
pop
line 6614
;6614:		if (pm->modParms.runFlags & RFL_BOT) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2459
line 6615
;6615:			pm->cmd.angles[ROLL] = oldCmdRoll;
ADDRGP4 pm
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 6616
;6616:		}
line 6617
;6617:		return;
ADDRGP4 $2459
JUMPV
LABELV $2605
line 6620
;6618:	}
;6619:
;6620:	if (pm->ps->pm_type == PM_FREEZE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $2609
line 6621
;6621:		if (pm->modParms.runFlags & RFL_BOT) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2459
line 6622
;6622:			pm->cmd.angles[ROLL] = oldCmdRoll;
ADDRGP4 pm
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 6623
;6623:		}
line 6624
;6624:		return;		// no movement at all
ADDRGP4 $2459
JUMPV
LABELV $2609
line 6627
;6625:	}
;6626:
;6627:	if ( pm->ps->pm_type == PM_INTERMISSION || pm->ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 156
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 6
EQI4 $2615
ADDRLP4 156
INDIRI4
CNSTI4 7
NEI4 $2613
LABELV $2615
line 6628
;6628:		if (pm->modParms.runFlags & RFL_BOT) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2459
line 6629
;6629:			pm->cmd.angles[ROLL] = oldCmdRoll;
ADDRGP4 pm
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 6630
;6630:		}
line 6631
;6631:		return;		// no movement at all
ADDRGP4 $2459
JUMPV
LABELV $2613
line 6634
;6632:	}
;6633:
;6634:	if (gPMDoSlowFall)
ADDRGP4 gPMDoSlowFall
INDIRI4
CNSTI4 0
EQI4 $2618
line 6635
;6635:	{
line 6636
;6636:		pm->ps->gravity *= 0.5;
ADDRLP4 160
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTF4 1056964608
ADDRLP4 160
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 6637
;6637:	}
LABELV $2618
line 6640
;6638:
;6639:	// set watertype, and waterlevel
;6640:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 6641
;6641:	pml.previous_waterlevel = pmove->waterlevel;
ADDRGP4 pml+1160
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 6644
;6642:
;6643:	// set mins, maxs, and viewheight
;6644:	PM_CheckDuck ();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 6647
;6645:
;6646:	// set groundentity
;6647:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 6649
;6648:
;6649:	if ( pm->ps->groundEntityNum != ENTITYNUM_NONE )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $2621
line 6650
;6650:	{//on ground
line 6651
;6651:		pm->ps->fd.forceJumpZStart = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1092
ADDP4
CNSTF4 0
ASGNF4
line 6652
;6652:	}
LABELV $2621
line 6654
;6653:
;6654:	if ( pm->ps->pm_type == PM_DEAD ) {
ADDRLP4 160
CNSTI4 4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRI4
ADDRLP4 160
INDIRI4
NEI4 $2623
line 6655
;6655:		PM_DeadMove ();
ADDRGP4 PM_DeadMove
CALLV
pop
line 6656
;6656:	}
LABELV $2623
line 6658
;6657:
;6658:	PM_DropTimers();
ADDRGP4 PM_DropTimers
CALLV
pop
line 6662
;6659:
;6660:
;6661:	// TODO MAYBE jaPRO fix strafebot up.
;6662:	if (pm->modParms.raceMode && pm->ps->pm_type == PM_NORMAL && pm->cmd.buttons & BUTTON_STRAFEBOT) {
ADDRLP4 164
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 164
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
EQI4 $2625
ADDRLP4 164
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
NEI4 $2625
ADDRLP4 164
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 168
INDIRI4
EQI4 $2625
line 6663
;6663:		if (pm->ps->clientNum >= 0 && pm->ps->clientNum < MAX_CLIENTS && (pm->modParms.runFlags & RFL_BOT))
ADDRLP4 172
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 176
ADDRLP4 172
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 180
CNSTI4 0
ASGNI4
ADDRLP4 176
INDIRI4
ADDRLP4 180
INDIRI4
LTI4 $2627
ADDRLP4 176
INDIRI4
CNSTI4 32
GEI4 $2627
ADDRLP4 172
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 180
INDIRI4
EQI4 $2627
line 6664
;6664:		{
line 6665
;6665:			float realCurrentSpeed = sqrtf((pm->ps->velocity[0] * pm->ps->velocity[0]) + (pm->ps->velocity[1] * pm->ps->velocity[1]));
ADDRLP4 188
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192
ADDRLP4 188
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 196
ADDRLP4 188
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 192
INDIRF4
ADDRLP4 192
INDIRF4
MULF4
ADDRLP4 196
INDIRF4
ADDRLP4 196
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 200
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 184
ADDRLP4 200
INDIRF4
ASGNF4
line 6666
;6666:			if (realCurrentSpeed > 0) {
ADDRLP4 184
INDIRF4
CNSTF4 0
LEF4 $2629
line 6667
;6667:				vec3_t vel = { 0 }, velangle;
ADDRLP4 216
ADDRGP4 $2631
INDIRB
ASGNB 12
line 6668
;6668:				float optimalAngle1 = 0; // option A
ADDRLP4 236
CNSTF4 0
ASGNF4
line 6669
;6669:				float optimalAngle2 = 0; // option B
ADDRLP4 240
CNSTF4 0
ASGNF4
line 6670
;6670:				float optimalDeltaAngle = 0;
ADDRLP4 204
CNSTF4 0
ASGNF4
line 6671
;6671:				qboolean CJ = qtrue;
ADDRLP4 208
CNSTI4 1
ASGNI4
line 6672
;6672:				float realFriction = MovementIsQuake3Based(pm->modParms.physics) ? pm_vq3_friction : pm_friction;
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
EQI4 $2633
ADDRLP4 256
ADDRGP4 pm_vq3_friction
INDIRF4
ASGNF4
ADDRGP4 $2634
JUMPV
LABELV $2633
ADDRLP4 256
ADDRGP4 pm_friction
INDIRF4
ASGNF4
LABELV $2634
ADDRLP4 232
ADDRLP4 256
INDIRF4
ASGNF4
line 6673
;6673:				float realAccel = MovementIsQuake3Based(pm->modParms.physics) ? pm_cpm_accelerate : (pm->modParms.physics == MV_JK2SP ? pm_sp_accelerate : pm_accelerate);
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 272
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $2637
ADDRLP4 264
ADDRGP4 pm_cpm_accelerate
INDIRF4
ASGNF4
ADDRGP4 $2638
JUMPV
LABELV $2637
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2639
ADDRLP4 268
ADDRGP4 pm_sp_accelerate
INDIRF4
ASGNF4
ADDRGP4 $2640
JUMPV
LABELV $2639
ADDRLP4 268
ADDRGP4 pm_accelerate
INDIRF4
ASGNF4
LABELV $2640
ADDRLP4 264
ADDRLP4 268
INDIRF4
ASGNF4
LABELV $2638
ADDRLP4 228
ADDRLP4 264
INDIRF4
ASGNF4
line 6674
;6674:				float strafeFactor = fp16_ieee_to_fp32_value(USHORT2SHORT(oldCmdRoll))+1.0f;  // USHORT2SHORT to normalize to short range since fp16 conversion relies on it
ADDRLP4 0
INDIRI4
CNSTI4 32767
LEI4 $2642
ADDRLP4 276
ADDRLP4 0
INDIRI4
CNSTI4 65535
SUBI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $2643
JUMPV
LABELV $2642
ADDRLP4 276
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $2643
ADDRLP4 276
INDIRI4
CVII2 4
CVII4 2
ARGI4
ADDRLP4 280
ADDRGP4 fp16_ieee_to_fp32_value
CALLF4
ASGNF4
ADDRLP4 212
ADDRLP4 280
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 6675
;6675:				if (pm->ps->groundEntityNum != ENTITYNUM_WORLD || (pm->cmd.upmove > 0 && !(pm->ps->pm_flags & PMF_JUMP_HELD))) {
ADDRLP4 284
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 288
ADDRLP4 284
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1022
NEI4 $2646
ADDRLP4 292
CNSTI4 0
ASGNI4
ADDRLP4 284
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 292
INDIRI4
LEI4 $2644
ADDRLP4 288
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 292
INDIRI4
NEI4 $2644
LABELV $2646
line 6676
;6676:					realAccel = pm->modParms.physics == MV_JK2SP ? pm_sp_airaccelerate : pm_airaccelerate;
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2648
ADDRLP4 296
ADDRGP4 pm_sp_airaccelerate
INDIRF4
ASGNF4
ADDRGP4 $2649
JUMPV
LABELV $2648
ADDRLP4 296
ADDRGP4 pm_airaccelerate
INDIRF4
ASGNF4
LABELV $2649
ADDRLP4 228
ADDRLP4 296
INDIRF4
ASGNF4
line 6677
;6677:					CJ = qfalse;
ADDRLP4 208
CNSTI4 0
ASGNI4
line 6678
;6678:				}
ADDRGP4 $2645
JUMPV
LABELV $2644
line 6681
;6679:				//else if (moveStyle == MV_SLICK)
;6680:				//	CJ = qfalse;
;6681:				else if (pml.walking && pml.groundTrace.surfaceFlags & SURF_SLICK) { //Lmao fuck this bullshit. no way to tell if we are on slick i guess.
ADDRLP4 296
CNSTI4 0
ASGNI4
ADDRGP4 pml+44
INDIRI4
ADDRLP4 296
INDIRI4
EQI4 $2650
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 296
INDIRI4
EQI4 $2650
line 6682
;6682:					if (!MovementIsQuake3Based(pm->modParms.physics)) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 300
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
NEI4 $2655
line 6683
;6683:						realAccel = pm->modParms.physics == MV_JK2SP ? pm_sp_airaccelerate : pm_airaccelerate;
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2658
ADDRLP4 304
ADDRGP4 pm_sp_airaccelerate
INDIRF4
ASGNF4
ADDRGP4 $2659
JUMPV
LABELV $2658
ADDRLP4 304
ADDRGP4 pm_airaccelerate
INDIRF4
ASGNF4
LABELV $2659
ADDRLP4 228
ADDRLP4 304
INDIRF4
ASGNF4
line 6684
;6684:					}
LABELV $2655
line 6685
;6685:					realFriction = 0;
ADDRLP4 232
CNSTF4 0
ASGNF4
line 6686
;6686:				}
LABELV $2650
LABELV $2645
line 6690
;6687:				//else if (realCurrentSpeed > pm->ps->basespeed * 1.5f) //idk this is retarded, but lets us groundframe (TA: WHAT?)
;6688:				//	CJ = qfalse;
;6689:
;6690:				if (realCurrentSpeed > pm->ps->basespeed || (CJ && (realCurrentSpeed > (pm->ps->basespeed * 0.5f)))) {
ADDRLP4 300
ADDRLP4 184
INDIRF4
ASGNF4
ADDRLP4 304
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 300
INDIRF4
ADDRLP4 304
INDIRF4
GTF4 $2662
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $2660
ADDRLP4 300
INDIRF4
CNSTF4 1056964608
ADDRLP4 304
INDIRF4
MULF4
LEF4 $2660
LABELV $2662
line 6691
;6691:					float middleOffset = 0; //Idk
ADDRLP4 312
CNSTF4 0
ASGNF4
line 6692
;6692:					qboolean calculationFailed = qfalse;
ADDRLP4 308
CNSTI4 0
ASGNI4
line 6695
;6693:					qboolean wSuggestsRightWard;
;6694:
;6695:					vel[0] = pm->ps->velocity[0];
ADDRLP4 216
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 6696
;6696:					vel[1] = pm->ps->velocity[1];
ADDRLP4 216+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
line 6697
;6697:					vectoangles(vel, velangle); 
ADDRLP4 216
ARGP4
ADDRLP4 244
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 6698
;6698:					wSuggestsRightWard = AngleSubtract(velangle[YAW], pm->ps->viewangles[YAW]) > 0;
ADDRLP4 244+4
INDIRF4
ARGF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ARGF4
ADDRLP4 324
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 324
INDIRF4
CNSTF4 0
LEF4 $2666
ADDRLP4 320
CNSTI4 1
ASGNI4
ADDRGP4 $2667
JUMPV
LABELV $2666
ADDRLP4 320
CNSTI4 0
ASGNI4
LABELV $2667
ADDRLP4 316
ADDRLP4 320
INDIRI4
ASGNI4
line 6700
;6699:
;6700:					if (CJ) {//CJ)
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $2668
line 6701
;6701:						qboolean doSlopes = pm->handleStrafebotSlopes; // so i can change it in debugger. HEHE
ADDRLP4 332
ADDRGP4 pm
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
ASGNI4
line 6702
;6702:						qboolean isSlope = pml.groundTrace.plane.normal[2] != 1.0f;
ADDRGP4 pml+52+24+8
INDIRF4
CNSTF4 1065353216
EQF4 $2674
ADDRLP4 336
CNSTI4 1
ASGNI4
ADDRGP4 $2675
JUMPV
LABELV $2674
ADDRLP4 336
CNSTI4 0
ASGNI4
LABELV $2675
ADDRLP4 328
ADDRLP4 336
INDIRI4
ASGNI4
line 6708
;6703:						//if (moveStyle == MV_CPM || moveStyle == MV_RJCPM || moveStyle == MV_BOTCPM)
;6704:						//	optimalDeltaAngle = -1; //CJ //Take into account ground accel/friction.. only cpm styles turn faster?
;6705:						//else
;6706:							//optimalDeltaAngle = -6;
;6707:
;6708:						if (isSlope && pm->cmd.forwardmove > 0) {
ADDRLP4 340
CNSTI4 0
ASGNI4
ADDRLP4 328
INDIRI4
ADDRLP4 340
INDIRI4
EQI4 $2676
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 340
INDIRI4
LEI4 $2676
line 6709
;6709:							pm->cmd.rightmove = 0; // slopes make us slower if we dont go W only!!! (allow A/D tho)
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 6710
;6710:						}
LABELV $2676
line 6711
;6711:						if (isSlope && doSlopes) {
ADDRLP4 344
CNSTI4 0
ASGNI4
ADDRLP4 328
INDIRI4
ADDRLP4 344
INDIRI4
EQI4 $2678
ADDRLP4 332
INDIRI4
ADDRLP4 344
INDIRI4
EQI4 $2678
line 6718
;6712:							// sloped ground behaves differently. simulate the projection onto the slope from walkmove
;6713:							// maybe todo: duckscale
;6714:							int i;
;6715:							vec3_t velNorm,forwardTmp,rightTmp, forwardFlat, accelVec;
;6716:							float		angle,angle2,angleTmp,angleTmp2; 
;6717:							float		inverseAngleScaleFactor;
;6718:							float		overbounce = MovementOverbounceFactor(pm->modParms.physics, pm->ps, &pm->cmd);
ADDRLP4 448
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 448
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 448
INDIRP4
INDIRP4
ARGP4
ADDRLP4 448
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 452
ADDRGP4 MovementOverbounceFactor
CALLF4
ASGNF4
ADDRLP4 348
ADDRLP4 452
INDIRF4
ASGNF4
line 6722
;6719:							float		forward, right;
;6720:							float deprojectFactor;
;6721:
;6722:							realCurrentSpeed = VectorLength(pm->ps->velocity); //sloped ground movement needs 3d speed
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 456
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 184
ADDRLP4 456
INDIRF4
ASGNF4
line 6723
;6723:							angleTmp = acos((double)((pm->ps->speed - (realAccel * pm->ps->speed * pml.frametime * strafeFactor)) / (realCurrentSpeed * (1 - realFriction * (pml.frametime)))));
ADDRLP4 460
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 460
INDIRF4
ADDRLP4 228
INDIRF4
ADDRLP4 460
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRLP4 212
INDIRF4
MULF4
SUBF4
ADDRLP4 184
INDIRF4
CNSTF4 1065353216
ADDRLP4 232
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
MULF4
DIVF4
ARGF4
ADDRLP4 464
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 396
ADDRLP4 464
INDIRF4
ASGNF4
line 6725
;6724:
;6725:							if (fpclassify(angleTmp) == FP_NAN) {
ADDRLP4 396
INDIRF4
ARGF4
ADDRLP4 468
ADDRGP4 fpclassify
CALLI4
ASGNI4
ADDRLP4 468
INDIRI4
CNSTI4 0
NEI4 $2682
line 6726
;6726:								calculationFailed = qtrue;
ADDRLP4 308
CNSTI4 1
ASGNI4
line 6727
;6727:								optimalDeltaAngle = 0;
ADDRLP4 204
CNSTF4 0
ASGNF4
line 6728
;6728:							}
ADDRGP4 $2679
JUMPV
LABELV $2682
line 6729
;6729:							else {
line 6731
;6730:
;6731:								VectorCopy(pm->ps->velocity, velNorm);
ADDRLP4 380
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 6732
;6732:								VectorNormalize(velNorm);
ADDRLP4 380
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6733
;6733:								VectorCopy(velNorm, forwardTmp);
ADDRLP4 364
ADDRLP4 380
INDIRB
ASGNB 12
line 6740
;6734:								//AngleVectors(velNorm,forwardTmp,0,0);
;6735:
;6736:								// project moves down to flat plane
;6737:								//forwardTmp[2] = 0;
;6738:
;6739:								// project the forward and right directions onto the ground plane
;6740:								PM_ClipVelocity(forwardTmp, pml.groundTrace.plane.normal, forwardTmp, overbounce);
ADDRLP4 364
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 364
ARGP4
ADDRLP4 348
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 6742
;6741:								//
;6742:								VectorNormalize(forwardTmp);
ADDRLP4 364
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6745
;6743:								// when going up or down slopes the wish velocity should Not be zero
;6744:
;6745:								angle = DotProduct(forwardTmp, velNorm);
ADDRLP4 376
ADDRLP4 364
INDIRF4
ADDRLP4 380
INDIRF4
MULF4
ADDRLP4 364+4
INDIRF4
ADDRLP4 380+4
INDIRF4
MULF4
ADDF4
ADDRLP4 364+8
INDIRF4
ADDRLP4 380+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 6746
;6746:								angle = MAX(-1.0f, MIN(1.0f, angle)); // floating point imprecision can lead to 1.00000002f (not exactly that, just the idea) and then acos is NaN
CNSTF4 1065353216
ADDRLP4 376
INDIRF4
GEF4 $2695
ADDRLP4 476
CNSTF4 1065353216
ASGNF4
ADDRGP4 $2696
JUMPV
LABELV $2695
ADDRLP4 476
ADDRLP4 376
INDIRF4
ASGNF4
LABELV $2696
CNSTF4 3212836864
ADDRLP4 476
INDIRF4
LEF4 $2693
ADDRLP4 472
CNSTF4 3212836864
ASGNF4
ADDRGP4 $2694
JUMPV
LABELV $2693
CNSTF4 1065353216
ADDRLP4 376
INDIRF4
GEF4 $2697
ADDRLP4 480
CNSTF4 1065353216
ASGNF4
ADDRGP4 $2698
JUMPV
LABELV $2697
ADDRLP4 480
ADDRLP4 376
INDIRF4
ASGNF4
LABELV $2698
ADDRLP4 472
ADDRLP4 480
INDIRF4
ASGNF4
LABELV $2694
ADDRLP4 376
ADDRLP4 472
INDIRF4
ASGNF4
line 6747
;6747:								angle = acos(angle);
ADDRLP4 376
INDIRF4
ARGF4
ADDRLP4 484
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 376
ADDRLP4 484
INDIRF4
ASGNF4
line 6749
;6748:
;6749:								if (angle >= angleTmp) {
ADDRLP4 376
INDIRF4
ADDRLP4 396
INDIRF4
LTF4 $2699
line 6750
;6750:									angleTmp2 = 0;
ADDRLP4 424
CNSTF4 0
ASGNF4
line 6751
;6751:								}
ADDRGP4 $2700
JUMPV
LABELV $2699
line 6752
;6752:								else {
line 6753
;6753:									angleTmp2 = sqrtf(angleTmp * angleTmp - angle* angle);
ADDRLP4 488
ADDRLP4 396
INDIRF4
ASGNF4
ADDRLP4 492
ADDRLP4 376
INDIRF4
ASGNF4
ADDRLP4 488
INDIRF4
ADDRLP4 488
INDIRF4
MULF4
ADDRLP4 492
INDIRF4
ADDRLP4 492
INDIRF4
MULF4
SUBF4
ARGF4
ADDRLP4 496
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 424
ADDRLP4 496
INDIRF4
ASGNF4
line 6754
;6754:								}
LABELV $2700
line 6759
;6755:
;6756:								// this is the optimal delta angle ON the slope plane
;6757:								// now we need to translate it to our horizontal angle
;6758:
;6759:								CrossProduct(forwardTmp, pml.groundTrace.plane.normal, rightTmp);
ADDRLP4 364
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 404
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 6761
;6760:
;6761:								forward = cos(angleTmp2);
ADDRLP4 424
INDIRF4
ARGF4
ADDRLP4 488
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 416
ADDRLP4 488
INDIRF4
ASGNF4
line 6762
;6762:								right = sin(angleTmp2);
ADDRLP4 424
INDIRF4
ARGF4
ADDRLP4 492
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 400
ADDRLP4 492
INDIRF4
ASGNF4
line 6763
;6763:								right *= ((wSuggestsRightWard || pm->unalteredCmd.rightmove > 0) && pm->unalteredCmd.rightmove >= 0) ? 1.0f : -1.0f;
ADDRLP4 500
CNSTI4 0
ASGNI4
ADDRLP4 316
INDIRI4
ADDRLP4 500
INDIRI4
NEI4 $2706
ADDRGP4 pm
INDIRP4
CNSTI4 57
ADDP4
INDIRI1
CVII4 1
ADDRLP4 500
INDIRI4
LEI4 $2704
LABELV $2706
ADDRGP4 pm
INDIRP4
CNSTI4 57
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $2704
ADDRLP4 496
CNSTF4 1065353216
ASGNF4
ADDRGP4 $2705
JUMPV
LABELV $2704
ADDRLP4 496
CNSTF4 3212836864
ASGNF4
LABELV $2705
ADDRLP4 400
ADDRLP4 400
INDIRF4
ADDRLP4 496
INDIRF4
MULF4
ASGNF4
line 6765
;6764:
;6765:								VectorScale(forwardTmp, forward, accelVec);
ADDRLP4 504
ADDRLP4 416
INDIRF4
ASGNF4
ADDRLP4 352
ADDRLP4 364
INDIRF4
ADDRLP4 504
INDIRF4
MULF4
ASGNF4
ADDRLP4 352+4
ADDRLP4 364+4
INDIRF4
ADDRLP4 504
INDIRF4
MULF4
ASGNF4
ADDRLP4 352+8
ADDRLP4 364+8
INDIRF4
ADDRLP4 416
INDIRF4
MULF4
ASGNF4
line 6766
;6766:								VectorMA(accelVec, right, rightTmp, accelVec);
ADDRLP4 508
ADDRLP4 400
INDIRF4
ASGNF4
ADDRLP4 352
ADDRLP4 352
INDIRF4
ADDRLP4 404
INDIRF4
ADDRLP4 508
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 352+4
ADDRLP4 352+4
INDIRF4
ADDRLP4 404+4
INDIRF4
ADDRLP4 508
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 352+8
ADDRLP4 352+8
INDIRF4
ADDRLP4 404+8
INDIRF4
ADDRLP4 400
INDIRF4
MULF4
ADDF4
ASGNF4
line 6769
;6767:
;6768:								//accelVec[2] = 0;
;6769:								deprojectFactor = accelVec[2] / pml.groundTrace.plane.normal[2];
ADDRLP4 420
ADDRLP4 352+8
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
DIVF4
ASGNF4
line 6770
;6770:								VectorMA(accelVec, -deprojectFactor, pml.groundTrace.plane.normal, accelVec);
ADDRLP4 512
ADDRLP4 420
INDIRF4
NEGF4
ASGNF4
ADDRLP4 352
ADDRLP4 352
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
ADDRLP4 512
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 352+4
ADDRLP4 352+4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
ADDRLP4 512
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 352+8
ADDRLP4 352+8
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
ADDRLP4 420
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 6772
;6771:
;6772:								VectorNormalize(accelVec);
ADDRLP4 352
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6774
;6773:
;6774:								VectorCopy(velNorm, forwardTmp);
ADDRLP4 364
ADDRLP4 380
INDIRB
ASGNB 12
line 6775
;6775:								forwardTmp[2] = 0;
ADDRLP4 364+8
CNSTF4 0
ASGNF4
line 6776
;6776:								VectorNormalize(forwardTmp);
ADDRLP4 364
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 6779
;6777:
;6778:
;6779:								angle2 = DotProduct(accelVec, forwardTmp);
ADDRLP4 392
ADDRLP4 352
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ADDRLP4 352+4
INDIRF4
ADDRLP4 364+4
INDIRF4
MULF4
ADDF4
ADDRLP4 352+8
INDIRF4
ADDRLP4 364+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 6780
;6780:								angle2 = MAX(-1.0f, MIN(1.0f, angle2));
CNSTF4 1065353216
ADDRLP4 392
INDIRF4
GEF4 $2743
ADDRLP4 520
CNSTF4 1065353216
ASGNF4
ADDRGP4 $2744
JUMPV
LABELV $2743
ADDRLP4 520
ADDRLP4 392
INDIRF4
ASGNF4
LABELV $2744
CNSTF4 3212836864
ADDRLP4 520
INDIRF4
LEF4 $2741
ADDRLP4 516
CNSTF4 3212836864
ASGNF4
ADDRGP4 $2742
JUMPV
LABELV $2741
CNSTF4 1065353216
ADDRLP4 392
INDIRF4
GEF4 $2745
ADDRLP4 524
CNSTF4 1065353216
ASGNF4
ADDRGP4 $2746
JUMPV
LABELV $2745
ADDRLP4 524
ADDRLP4 392
INDIRF4
ASGNF4
LABELV $2746
ADDRLP4 516
ADDRLP4 524
INDIRF4
ASGNF4
LABELV $2742
ADDRLP4 392
ADDRLP4 516
INDIRF4
ASGNF4
line 6782
;6781:
;6782:								optimalDeltaAngle = acos(angle2);
ADDRLP4 392
INDIRF4
ARGF4
ADDRLP4 528
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 204
ADDRLP4 528
INDIRF4
ASGNF4
line 6784
;6783:
;6784:								if (fpclassify(optimalDeltaAngle) == FP_NAN) {
ADDRLP4 204
INDIRF4
ARGF4
ADDRLP4 532
ADDRGP4 fpclassify
CALLI4
ASGNI4
ADDRLP4 532
INDIRI4
CNSTI4 0
NEI4 $2679
line 6785
;6785:									calculationFailed = qtrue;
ADDRLP4 308
CNSTI4 1
ASGNI4
line 6786
;6786:									optimalDeltaAngle = 0;
ADDRLP4 204
CNSTF4 0
ASGNF4
line 6787
;6787:								}
line 6788
;6788:							}
line 6789
;6789:						}
ADDRGP4 $2679
JUMPV
LABELV $2678
line 6790
;6790:						else {
line 6791
;6791:							optimalDeltaAngle = acos((double)((pm->ps->speed - (realAccel * pm->ps->speed * pml.frametime * strafeFactor)) / (realCurrentSpeed * (1 - realFriction * (pml.frametime)))));
ADDRLP4 348
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 348
INDIRF4
ADDRLP4 228
INDIRF4
ADDRLP4 348
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRLP4 212
INDIRF4
MULF4
SUBF4
ADDRLP4 184
INDIRF4
CNSTF4 1065353216
ADDRLP4 232
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
MULF4
DIVF4
ARGF4
ADDRLP4 352
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 204
ADDRLP4 352
INDIRF4
ASGNF4
line 6792
;6792:						}
LABELV $2679
line 6793
;6793:						optimalDeltaAngle = optimalDeltaAngle * (180.0f / M_PI) - 45.0f;
ADDRLP4 204
CNSTF4 1113927393
ADDRLP4 204
INDIRF4
MULF4
CNSTF4 1110704128
SUBF4
ASGNF4
line 6794
;6794:					}
ADDRGP4 $2669
JUMPV
LABELV $2668
line 6795
;6795:					else {
line 6801
;6796:						//if (moveStyle == MV_SP)
;6797:						//	realAccel = pm_sp_airaccelerate;
;6798:						//else if (moveStyle == MV_SLICK)
;6799:						//	realAccel = pm_slick_accelerate;
;6800:						//jetpack. 1.4f ?
;6801:						optimalDeltaAngle = (acos((double)((pm->ps->speed - (realAccel * pm->ps->speed * pml.frametime * strafeFactor)) / realCurrentSpeed)) * (180.0f / M_PI) - 45.0f);
ADDRLP4 328
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 328
INDIRF4
ADDRLP4 228
INDIRF4
ADDRLP4 328
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRLP4 212
INDIRF4
MULF4
SUBF4
ADDRLP4 184
INDIRF4
DIVF4
ARGF4
ADDRLP4 332
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 204
CNSTF4 1113927393
ADDRLP4 332
INDIRF4
MULF4
CNSTF4 1110704128
SUBF4
ASGNF4
line 6802
;6802:					}
LABELV $2669
line 6803
;6803:					if (/*optimalDeltaAngle < 0 || optimalDeltaAngle > 360 || */fpclassify(optimalDeltaAngle) == FP_NAN) {
ADDRLP4 204
INDIRF4
ARGF4
ADDRLP4 328
ADDRGP4 fpclassify
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
NEI4 $2752
line 6804
;6804:						calculationFailed = qtrue;
ADDRLP4 308
CNSTI4 1
ASGNI4
line 6805
;6805:						optimalDeltaAngle = 0;
ADDRLP4 204
CNSTF4 0
ASGNF4
line 6807
;6806:
;6807:						if (pmove->debugLevel > 20) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 20
LEI4 $2754
line 6809
;6808:
;6809:							Com_Printf("strafebot: optimalDeltaAngle is NAN", pmove->accelMiss);
ADDRGP4 $2756
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ARGF4
ADDRGP4 Com_Printf
CALLV
pop
line 6810
;6810:						}
LABELV $2754
line 6812
;6811:
;6812:					}
LABELV $2752
line 6814
;6813:
;6814:					if (!calculationFailed && (!pm->isSpecialPredict || strafeFactor >= 1.0f && (strafeFactor <= 1.1f || strafeFactor <= 2.0f && !CJ))) { // strafe factors create stuttering with special predict unless very low. might have to adjust this when cpm etc. in air it can tolerate a bit more
ADDRLP4 332
CNSTI4 0
ASGNI4
ADDRLP4 308
INDIRI4
ADDRLP4 332
INDIRI4
NEI4 $2757
ADDRGP4 pm
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRLP4 332
INDIRI4
EQI4 $2760
ADDRLP4 336
ADDRLP4 212
INDIRF4
ASGNF4
ADDRLP4 336
INDIRF4
CNSTF4 1065353216
LTF4 $2757
ADDRLP4 336
INDIRF4
CNSTF4 1066192077
LEF4 $2760
ADDRLP4 336
INDIRF4
CNSTF4 1073741824
GTF4 $2757
ADDRLP4 208
INDIRI4
ADDRLP4 332
INDIRI4
NEI4 $2757
LABELV $2760
line 6815
;6815:						optimalDeltaAngle = AngleNormalize180(optimalDeltaAngle);
ADDRLP4 204
INDIRF4
ARGF4
ADDRLP4 340
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 204
ADDRLP4 340
INDIRF4
ASGNF4
line 6817
;6816:
;6817:						if (pm->cmd.forwardmove > 0 && pm->cmd.rightmove > 0) {//WD
ADDRLP4 344
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 348
CNSTI4 0
ASGNI4
ADDRLP4 344
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 348
INDIRI4
LEI4 $2761
ADDRLP4 344
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 348
INDIRI4
LEI4 $2761
line 6818
;6818:							optimalDeltaAngle = 0 - optimalDeltaAngle;
ADDRLP4 204
CNSTF4 0
ADDRLP4 204
INDIRF4
SUBF4
ASGNF4
line 6819
;6819:						}
ADDRGP4 $2762
JUMPV
LABELV $2761
line 6820
;6820:						else if (pm->cmd.forwardmove > 0 && pm->cmd.rightmove < 0) {//WA
ADDRLP4 352
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 356
CNSTI4 0
ASGNI4
ADDRLP4 352
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 356
INDIRI4
LEI4 $2763
ADDRLP4 352
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 356
INDIRI4
GEI4 $2763
line 6821
;6821:							optimalDeltaAngle = 0 + optimalDeltaAngle;
ADDRLP4 204
ADDRLP4 204
INDIRF4
CNSTF4 0
ADDF4
ASGNF4
line 6822
;6822:						}
ADDRGP4 $2764
JUMPV
LABELV $2763
line 6823
;6823:						else if (!pm->cmd.forwardmove && pm->cmd.rightmove > 0) {//D
ADDRLP4 360
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 364
CNSTI4 0
ASGNI4
ADDRLP4 360
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 364
INDIRI4
NEI4 $2765
ADDRLP4 360
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 364
INDIRI4
LEI4 $2765
line 6829
;6824:							//if (moveStyle == MV_QW || moveStyle == MV_CPM || moveStyle == MV_PJK || moveStyle == MV_WSW || moveStyle == MV_RJCPM || moveStyle == MV_BOTCPM)
;6825:							//	optimalDeltaAngle = 0 - middleOffset; //Take into account speed.
;6826:							//else
;6827:							//optimalDeltaAngle = 45 - optimalDeltaAngle;
;6828:							//if ((AngleSubtract(velangle[YAW], pm->ps->viewangles[YAW] + 90.0f) < 0 || pm->unalteredCmd.forwardmove > 0) && pm->unalteredCmd.forwardmove <= 0) {
;6829:							if (pm->unalteredCmd.forwardmove <= 0) { // only do backwards strafe if explicitly W is pressed during roll
ADDRGP4 pm
INDIRP4
CNSTI4 56
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GTI4 $2767
line 6830
;6830:								optimalDeltaAngle = 45 - optimalDeltaAngle;
ADDRLP4 204
CNSTF4 1110704128
ADDRLP4 204
INDIRF4
SUBF4
ASGNF4
line 6831
;6831:							}
ADDRGP4 $2766
JUMPV
LABELV $2767
line 6832
;6832:							else {
line 6833
;6833:								optimalDeltaAngle = 135.0f + optimalDeltaAngle;
ADDRLP4 204
ADDRLP4 204
INDIRF4
CNSTF4 1124532224
ADDF4
ASGNF4
line 6834
;6834:							}
line 6835
;6835:						}
ADDRGP4 $2766
JUMPV
LABELV $2765
line 6836
;6836:						else if (!pm->cmd.forwardmove && pm->cmd.rightmove < 0) {//A
ADDRLP4 368
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 372
CNSTI4 0
ASGNI4
ADDRLP4 368
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 372
INDIRI4
NEI4 $2769
ADDRLP4 368
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 372
INDIRI4
GEI4 $2769
line 6842
;6837:							//if (moveStyle == MV_QW || moveStyle == MV_CPM || moveStyle == MV_PJK || moveStyle == MV_WSW || moveStyle == MV_RJCPM || moveStyle == MV_BOTCPM)
;6838:							//	optimalDeltaAngle = 0 + middleOffset;
;6839:							//else
;6840:							//optimalDeltaAngle = -45 + optimalDeltaAngle;
;6841:							//if ((AngleSubtract(velangle[YAW], pm->ps->viewangles[YAW]-90.0f) < 0 || pm->unalteredCmd.forwardmove > 0) && pm->unalteredCmd.forwardmove <= 0) {
;6842:							if (pm->unalteredCmd.forwardmove <= 0) { // only do backwards strafe if explicitly W is pressed during roll
ADDRGP4 pm
INDIRP4
CNSTI4 56
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GTI4 $2771
line 6843
;6843:								optimalDeltaAngle = -45 + optimalDeltaAngle;
ADDRLP4 204
ADDRLP4 204
INDIRF4
CNSTF4 3258187776
ADDF4
ASGNF4
line 6844
;6844:							}
ADDRGP4 $2770
JUMPV
LABELV $2771
line 6845
;6845:							else { 
line 6846
;6846:								optimalDeltaAngle = 225.0f - optimalDeltaAngle; 
ADDRLP4 204
CNSTF4 1130430464
ADDRLP4 204
INDIRF4
SUBF4
ASGNF4
line 6847
;6847:							}
line 6848
;6848:						}
ADDRGP4 $2770
JUMPV
LABELV $2769
line 6849
;6849:						else if (pm->cmd.forwardmove > 0 && !pm->cmd.rightmove) {//W
ADDRLP4 376
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 380
CNSTI4 0
ASGNI4
ADDRLP4 376
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 380
INDIRI4
LEI4 $2773
ADDRLP4 376
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 380
INDIRI4
NEI4 $2773
line 6852
;6850:							//optimalAngle1 = abs(AngleSubtract(velangle[YAW] - 45 - optimalDeltaAngle, pm->ps->viewangles[YAW]));
;6851:							//optimalAngle2 = abs(AngleSubtract(velangle[YAW] + 45 + optimalDeltaAngle, pm->ps->viewangles[YAW]));
;6852:							if ((wSuggestsRightWard || pm->unalteredCmd.rightmove > 0) && pm->unalteredCmd.rightmove >= 0) { //Decide which W we want.  (Whatever is closest). this is broken for CJ (just walking basically). not sure i can fix it, but its not a huge deal i guess
ADDRLP4 384
CNSTI4 0
ASGNI4
ADDRLP4 316
INDIRI4
ADDRLP4 384
INDIRI4
NEI4 $2777
ADDRGP4 pm
INDIRP4
CNSTI4 57
ADDP4
INDIRI1
CVII4 1
ADDRLP4 384
INDIRI4
LEI4 $2775
LABELV $2777
ADDRGP4 pm
INDIRP4
CNSTI4 57
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $2775
line 6857
;6853:							//if ((optimalAngle1 < optimalAngle2 || pm->unalteredCmd.rightmove > 0) && pm->unalteredCmd.rightmove >= 0) { //Decide which W we want.  (Whatever is closest)
;6854:								//if (moveStyle == MV_QW || moveStyle == MV_CPM || moveStyle == MV_PJK || moveStyle == MV_WSW || moveStyle == MV_RJCPM || moveStyle == MV_BOTCPM) //Why the f does it switch
;6855:								//	optimalDeltaAngle = -45; //Needs good offset
;6856:								//else
;6857:								optimalDeltaAngle = -45 - optimalDeltaAngle; //rightwards
ADDRLP4 204
CNSTF4 3258187776
ADDRLP4 204
INDIRF4
SUBF4
ASGNF4
line 6858
;6858:							}
ADDRGP4 $2774
JUMPV
LABELV $2775
line 6859
;6859:							else { //Right side
line 6863
;6860:								//if (moveStyle == MV_QW || moveStyle == MV_CPM || moveStyle == MV_PJK || moveStyle == MV_WSW || moveStyle == MV_RJCPM || moveStyle == MV_BOTCPM)
;6861:								//	optimalDeltaAngle = 45; //Needs good offset
;6862:								//else
;6863:								optimalDeltaAngle = 45 + optimalDeltaAngle; //leftwards
ADDRLP4 204
ADDRLP4 204
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 6864
;6864:							}
line 6865
;6865:						}
ADDRGP4 $2774
JUMPV
LABELV $2773
line 6866
;6866:						else if (pm->cmd.forwardmove < 0 && !pm->cmd.rightmove) {//S // TODO
ADDRLP4 384
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 388
CNSTI4 0
ASGNI4
ADDRLP4 384
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 388
INDIRI4
GEI4 $2778
ADDRLP4 384
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 388
INDIRI4
NEI4 $2778
line 6873
;6867:							//if ((AngleSubtract(velangle[YAW], pm->ps->viewangles[YAW]-180.0f) > 0 || pm->unalteredCmd.rightmove > 0) && pm->unalteredCmd.rightmove >= 0) { 
;6868:							//	optimalDeltaAngle = -45 - optimalDeltaAngle; //rightwards
;6869:							//}
;6870:							//else { 
;6871:							//	optimalDeltaAngle = 45 + optimalDeltaAngle; //leftwards
;6872:							//}
;6873:						}
LABELV $2778
LABELV $2774
LABELV $2770
LABELV $2766
LABELV $2764
LABELV $2762
line 6875
;6874:
;6875:						velangle[YAW] += optimalDeltaAngle;
ADDRLP4 244+4
ADDRLP4 244+4
INDIRF4
ADDRLP4 204
INDIRF4
ADDF4
ASGNF4
line 6876
;6876:						velangle[PITCH] = pm->ps->viewangles[PITCH];
ADDRLP4 244
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ASGNF4
line 6882
;6877:
;6878:						//assert(!_isnanf(velangle[PITCH]));
;6879:						//assert(!_isnanf(velangle[YAW]));
;6880:						//assert(!_isnanf(velangle[ROLL]));
;6881:
;6882:						PM_SetPMViewAngle(pm->ps, velangle, &pm->cmd);
ADDRLP4 392
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 392
INDIRP4
INDIRP4
ARGP4
ADDRLP4 244
ARGP4
ADDRLP4 392
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 PM_SetPMViewAngle
CALLV
pop
line 6883
;6883:						AngleVectors(pm->ps->viewangles, pml.forward, pml.right, pml.up); //Have to re set this here
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 pml
ARGP4
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+24
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 6884
;6884:					}
LABELV $2757
line 6885
;6885:				}
LABELV $2660
line 6886
;6886:			}
LABELV $2629
line 6887
;6887:		}
LABELV $2627
line 6888
;6888:	}
LABELV $2625
line 6890
;6889:
;6890:	if (pm->ps->pm_type == PM_FLOAT)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2783
line 6891
;6891:	{
line 6892
;6892:		PM_FlyMove ();
ADDRGP4 PM_FlyMove
CALLV
pop
line 6893
;6893:	}
ADDRGP4 $2784
JUMPV
LABELV $2783
line 6894
;6894:	else if(pm->isSpecialPredict || pm->modParms.msecRestrict <= 0 || pm->modParms.msecRestrict == pml.msec) {
ADDRLP4 172
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 176
CNSTI4 0
ASGNI4
ADDRLP4 172
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRLP4 176
INDIRI4
NEI4 $2789
ADDRLP4 180
ADDRLP4 172
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ASGNI4
ADDRLP4 180
INDIRI4
ADDRLP4 176
INDIRI4
LEI4 $2789
ADDRLP4 180
INDIRI4
ADDRGP4 pml+40
INDIRI4
NEI4 $2785
LABELV $2789
line 6895
;6895:		if (pm->modParms.physics == MV_CHARGEJUMP) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 12
NEI4 $2790
line 6896
;6896:			PM_CheckChargeJump();
ADDRGP4 PM_CheckChargeJump
CALLV
pop
line 6897
;6897:		}
LABELV $2790
line 6898
;6898:		if (pm->ps->pm_flags & PMF_TIME_WATERJUMP) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $2792
line 6899
;6899:			PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 6900
;6900:		} else if ( pm->waterlevel > 1 ) {
ADDRGP4 $2793
JUMPV
LABELV $2792
ADDRGP4 pm
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2794
line 6902
;6901:			// swimming
;6902:			PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 6903
;6903:		} else if ( pml.walking ) {
ADDRGP4 $2795
JUMPV
LABELV $2794
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $2796
line 6905
;6904:			// walking on ground
;6905:			PM_WalkMove();
ADDRGP4 PM_WalkMove
CALLV
pop
line 6906
;6906:		} else {
ADDRGP4 $2797
JUMPV
LABELV $2796
line 6908
;6907:			// airborne
;6908:			PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 6909
;6909:		}
LABELV $2797
LABELV $2795
LABELV $2793
line 6910
;6910:	}
LABELV $2785
LABELV $2784
line 6912
;6911:
;6912:	PM_Animate();
ADDRGP4 PM_Animate
CALLV
pop
line 6915
;6913:
;6914:	// set groundentity, watertype, and waterlevel
;6915:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 6916
;6916:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 6918
;6917:
;6918:	PM_CheckRollEnd();
ADDRGP4 PM_CheckRollEnd
CALLV
pop
line 6921
;6919:
;6920:
;6921:	if (pm->cmd.forcesel != (byte)-1 && (pm->ps->fd.forcePowersKnown & (1 << pm->cmd.forcesel)))
ADDRLP4 184
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 188
ADDRLP4 184
INDIRP4
CNSTI4 25
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 188
INDIRI4
CNSTU4 4294967295
CVUU1 4
CVUI4 1
EQI4 $2799
ADDRLP4 184
INDIRP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 188
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2799
line 6922
;6922:	{
line 6923
;6923:		pm->ps->fd.forcePowerSelected = pm->cmd.forcesel;
ADDRLP4 192
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 192
INDIRP4
CNSTI4 25
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 6924
;6924:	}
LABELV $2799
line 6925
;6925:	if (pm->cmd.invensel != (byte)-1 && (pm->ps->stats[STAT_HOLDABLE_ITEMS] & (1 << pm->cmd.invensel)))
ADDRLP4 192
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 196
ADDRLP4 192
INDIRP4
CNSTI4 26
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 196
INDIRI4
CNSTU4 4294967295
CVUU1 4
CVUI4 1
EQI4 $2801
ADDRLP4 192
INDIRP4
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 196
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2801
line 6926
;6926:	{
line 6927
;6927:		pm->ps->stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(pm->cmd.invensel, IT_HOLDABLE);
ADDRLP4 200
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 26
ADDP4
INDIRU1
CVUI4 1
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 204
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRLP4 200
INDIRP4
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 204
INDIRI4
ASGNI4
line 6928
;6928:	}
LABELV $2801
line 6931
;6929:
;6930:	// weapons
;6931:	PM_Weapon();
ADDRGP4 PM_Weapon
CALLV
pop
line 6933
;6932:
;6933:	PM_Use();
ADDRGP4 PM_Use
CALLV
pop
line 6936
;6934:
;6935:	// footstep events / legs animations
;6936:	PM_Footsteps();
ADDRGP4 PM_Footsteps
CALLV
pop
line 6939
;6937:
;6938:	// entering / leaving water splashes
;6939:	PM_WaterEvents();
ADDRGP4 PM_WaterEvents
CALLV
pop
line 6950
;6940:
;6941:	//Walbug fix start, if getting stuck w/o noclip is even possible.  This should maybe be after round float? im not sure..
;6942:	// TODO MAYBE jaPRO this actually kills strafing on yavin. find better solution.
;6943:	//if ((pm->ps->persistant[PERS_TEAM] != TEAM_SPECTATOR) && pm->ps->stats[STAT_RACEMODE] && VectorCompare(pm->ps->origin, pml.previous_origin) /*&& (VectorLengthSquared(pm->ps->velocity) > VectorLengthSquared(pml.previous_velocity))*/)
;6944:	//	VectorClear(pm->ps->velocity); //Their velocity is increasing while their origin is not moving (wallbug), so prevent this..
;6945:		//VectorCopy(pml.previous_velocity, pm->ps->velocity);
;6946:	//To fix rocket wallbug, since that gets applied elsewhere, just always reset vel if origins dont match?
;6947:	//Wallbug fix end
;6948:
;6949:	// snap some parts of playerstate to save network bandwidth
;6950:	if (pm->ps->persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2803
line 6951
;6951:		trap_SnapVector( pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 6952
;6952:	}
ADDRGP4 $2804
JUMPV
LABELV $2803
line 6953
;6953:	else {
line 6954
;6954:		if (/*pm->modParms.raceMode || */pm->pmove_float > 2  && !pm->modParms.raceMode || pm->modParms.msecRestrict == -2) {
ADDRLP4 200
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LEI4 $2808
ADDRLP4 200
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2807
LABELV $2808
ADDRGP4 pm
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $2805
LABELV $2807
line 6955
;6955:		}
ADDRGP4 $2806
JUMPV
LABELV $2805
line 6956
;6956:		else if (pm->highFpsFix
ADDRLP4 204
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 208
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ADDRLP4 208
INDIRI4
EQI4 $2816
ADDRLP4 204
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRLP4 208
INDIRI4
NEI4 $2816
ADDRGP4 pml+40
INDIRI4
CNSTI4 4
LEI4 $2814
ADDRGP4 pml+40
INDIRI4
CNSTI4 25
GTI4 $2814
LABELV $2816
ADDRLP4 212
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 216
CNSTI4 0
ASGNI4
ADDRLP4 212
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRLP4 216
INDIRI4
NEI4 $2809
ADDRLP4 220
ADDRLP4 212
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ASGNI4
ADDRLP4 220
INDIRI4
ADDRLP4 216
INDIRI4
LEI4 $2809
ADDRLP4 220
INDIRI4
ADDRGP4 pml+40
INDIRI4
EQI4 $2809
LABELV $2814
line 6960
;6957:			&& !pm->modParms.raceMode
;6958:			&& (pml.msec <= 4 || pml.msec > 25)
;6959:			|| !pm->isSpecialPredict && pm->modParms.msecRestrict > 0 && pm->modParms.msecRestrict != pml.msec
;6960:			) { //do nothing above 250FPS or below 40FPS (retain other restrictions), removed requiredCmdMsec gating for instant input
line 6961
;6961:		}
ADDRGP4 $2810
JUMPV
LABELV $2809
line 6962
;6962:		else if (pm->pmove_float == 2 && !pm->modParms.raceMode) { //pmove_float 2: snaps vertical velocity only, so 125/142fps jumps are still the same height?
ADDRLP4 224
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2817
ADDRLP4 224
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2817
line 6964
;6963:			// TODO allow this option in racemode somehow too?
;6964:			vec3_t oldVelocity = { 0 };
ADDRLP4 228
ADDRGP4 $2819
INDIRB
ASGNB 12
line 6965
;6965:			VectorCopy( pm->ps->velocity, oldVelocity );
ADDRLP4 228
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 6966
;6966:			trap_SnapVector( pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 6967
;6967:			pm->ps->velocity[2] = oldVelocity[2];
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 228+8
INDIRF4
ASGNF4
line 6968
;6968:		}
ADDRGP4 $2818
JUMPV
LABELV $2817
line 6969
;6969:		else if (!pm->pmove_float || pm->modParms.raceMode && pm->modParms.msecRestrict > -2) {
ADDRLP4 228
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 232
CNSTI4 0
ASGNI4
ADDRLP4 228
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 232
INDIRI4
EQI4 $2823
ADDRLP4 228
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRLP4 232
INDIRI4
EQI4 $2821
ADDRLP4 228
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 -2
LEI4 $2821
LABELV $2823
line 6970
;6970:			trap_SnapVector( pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 6971
;6971:		}
LABELV $2821
LABELV $2818
LABELV $2810
LABELV $2806
line 6972
;6972:	}
LABELV $2804
line 6974
;6973:
;6974:	if (gPMDoSlowFall)
ADDRGP4 gPMDoSlowFall
INDIRI4
CNSTI4 0
EQI4 $2824
line 6975
;6975:	{
line 6976
;6976:		pm->ps->gravity *= 2;
ADDRLP4 200
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 200
INDIRP4
ADDRLP4 200
INDIRP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 6977
;6977:	}
LABELV $2824
line 6979
;6978:
;6979:	if (pm->modParms.runFlags & RFL_BOT) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $2826
line 6980
;6980:		pm->cmd.angles[ROLL] = oldCmdRoll;
ADDRGP4 pm
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 6981
;6981:	}
LABELV $2826
line 6982
;6982:}
LABELV $2459
endproc PmoveSingle 536 16
export Pmove
proc Pmove 32 8
line 6993
;6983:
;6984://extern Q_INLINE int PM_GetRaceMode(pmove_t* pmove);
;6985:
;6986:/*
;6987:================
;6988:Pmove
;6989:
;6990:Can be called by either the server or the client
;6991:================
;6992:*/
;6993:void Pmove (pmove_t *pmove) {
line 6995
;6994:	int			finalTime;
;6995:	int			zeroahaha = 0.0f;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 6997
;6996:
;6997:	PM_SetModData(pmove);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 PM_SetModData
CALLV
pop
line 6999
;6998:
;6999:	finalTime = pmove->cmd.serverTime;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 7001
;7000:
;7001:	VectorCopy(pmove->ps->velocity,pmove->lastAntiLoopVelocity);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 540
ADDP4
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 7004
;7002:
;7003:#ifdef Q3_VM
;7004:	pmove->accelMiss =0.0f/0.0f; // putting NaN in there.
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
DIVF4
ASGNF4
line 7009
;7005:#else
;7006:	pmove->accelMiss = 0.0f / zeroahaha; // putting NaN in there.
;7007:#endif
;7008:
;7009:	if (pmove->debugLevel> 30) {
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 30
LEI4 $2829
line 7011
;7010:
;7011:		Com_Printf("accelmiss nonvalue is %f", pmove->accelMiss);
ADDRGP4 $2831
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ARGF4
ADDRGP4 Com_Printf
CALLV
pop
line 7012
;7012:	}
LABELV $2829
line 7014
;7013:
;7014:	if ( finalTime < pmove->ps->commandTime ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
GEI4 $2832
line 7015
;7015:		return;	// should not happen
ADDRGP4 $2828
JUMPV
LABELV $2832
line 7018
;7016:	}
;7017:
;7018:	if ( finalTime > pmove->ps->commandTime + 1000 ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $2834
line 7019
;7019:		pmove->ps->commandTime = finalTime - 1000;
ADDRFP4 0
INDIRP4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 7020
;7020:	}
LABELV $2834
line 7022
;7021:
;7022:	if (pmove->ps->fallingToDeath)
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2836
line 7023
;7023:	{
line 7024
;7024:		pmove->cmd.forwardmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTI1 0
ASGNI1
line 7025
;7025:		pmove->cmd.rightmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 29
ADDP4
CNSTI1 0
ASGNI1
line 7026
;7026:		pmove->cmd.upmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 7027
;7027:		pmove->cmd.buttons = 0;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 7028
;7028:	}
LABELV $2836
line 7030
;7029:
;7030:	pmove->ps->pmove_framecount = (pmove->ps->pmove_framecount+1) & ((1<<PS_PMOVEFRAMECOUNTBITS)-1);
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 488
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 63
BANDI4
ASGNI4
line 7032
;7031:
;7032:	pmove->unalteredCmd = pmove->cmd; // so we can decide which direction to roll with strafebot (as roll overwrites keys that arent part of its direction)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 28
line 7034
;7033:
;7034:	if (pmove->roll.status == ROLL_ENDED) {
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4
NEI4 $2841
line 7035
;7035:		pmove->roll.status = ROLL_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 0
ASGNI4
line 7036
;7036:	}
ADDRGP4 $2841
JUMPV
LABELV $2840
line 7040
;7037:
;7038:	// chop the move up if it is too long, to prevent framerate
;7039:	// dependent behavior
;7040:	while ( pmove->ps->commandTime != finalTime ) {
line 7043
;7041:		int		msec;
;7042:
;7043:		msec = finalTime - pmove->ps->commandTime;
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 7045
;7044:
;7045:		if ( pmove->pmove_fixed ) {
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2843
line 7046
;7046:			if ( msec > pmove->pmove_msec ) {
ADDRLP4 24
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
LEI4 $2844
line 7047
;7047:				msec = pmove->pmove_msec;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ASGNI4
line 7048
;7048:			}
line 7049
;7049:		}
ADDRGP4 $2844
JUMPV
LABELV $2843
line 7050
;7050:		else {
line 7051
;7051:			qboolean isRaceMode = pmove->modParms.raceMode;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ASGNI4
line 7052
;7052:			if ( msec > 66 && !isRaceMode) { // if racemode, let other places handle this. we are not really concerned about someone gaining an undue advantage then. (is that even what its for? what even is the point since ppl can just send a bunch of shorter cmds at once)
ADDRLP4 24
INDIRI4
CNSTI4 66
LEI4 $2847
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $2847
line 7053
;7053:				msec = 66;
ADDRLP4 24
CNSTI4 66
ASGNI4
line 7054
;7054:			}
LABELV $2847
line 7055
;7055:		}
LABELV $2844
line 7056
;7056:		pmove->cmd.serverTime = pmove->ps->commandTime + msec;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 28
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
ADDI4
ASGNI4
line 7057
;7057:		PmoveSingle( pmove );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 PmoveSingle
CALLV
pop
line 7059
;7058:
;7059:		if ( pmove->ps->pm_flags & PMF_JUMP_HELD ) {
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2849
line 7060
;7060:			pmove->cmd.upmove = 20;
ADDRFP4 0
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 20
ASGNI1
line 7061
;7061:		}
LABELV $2849
line 7062
;7062:	}
LABELV $2841
line 7040
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $2840
line 7063
;7063:}
LABELV $2828
endproc Pmove 32 8
import fpclassify
import PmoveCSS
import PmoveQ2
import PM_SaberInTransition
import PM_LimitedClipVelocity2
import WP_ForcePowerStart
import flatNormal
import PM_CheckBounceJump
import MovementOverbounceFactor
import PM_GroundSlideOkay
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
import fp16_ieee_from_fp32_value
import fp16_ieee_to_fp32_value
import PM_SetSaberMove
import PM_WeaponLightsaber
import PM_SetAnim
import PM_ForceLegsAnim
import PM_ContinueLegsAnim
import PM_StartTorsoAnim
import BG_CycleInven
import PM_StepSlideMove
import PM_SlideMove
import PM_SaberJumpAttackMove
import PM_SaberFlipOverAttackMove
import PM_SomeoneInFront
import PM_GroundDistance
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
bss
export pml
align 4
LABELV pml
skip 1192
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
export pm
align 4
LABELV pm
skip 4
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
LABELV $2831
byte 1 97
byte 1 99
byte 1 99
byte 1 101
byte 1 108
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $2756
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 102
byte 1 101
byte 1 98
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 108
byte 1 68
byte 1 101
byte 1 108
byte 1 116
byte 1 97
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 78
byte 1 65
byte 1 78
byte 1 0
align 1
LABELV $2420
byte 1 37
byte 1 105
byte 1 58
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 84
byte 1 79
byte 1 85
byte 1 67
byte 1 72
byte 1 45
byte 1 62
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 65
byte 1 73
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $2412
byte 1 37
byte 1 105
byte 1 58
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 84
byte 1 79
byte 1 85
byte 1 67
byte 1 72
byte 1 45
byte 1 62
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 69
byte 1 78
byte 1 68
byte 1 69
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $2406
byte 1 37
byte 1 105
byte 1 58
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 65
byte 1 73
byte 1 82
byte 1 45
byte 1 62
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 84
byte 1 79
byte 1 85
byte 1 67
byte 1 72
byte 1 32
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2403
byte 1 37
byte 1 105
byte 1 58
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 65
byte 1 73
byte 1 82
byte 1 45
byte 1 62
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 84
byte 1 79
byte 1 85
byte 1 67
byte 1 72
byte 1 32
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 40
byte 1 117
byte 1 115
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $2394
byte 1 37
byte 1 105
byte 1 58
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 65
byte 1 73
byte 1 82
byte 1 45
byte 1 62
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 69
byte 1 78
byte 1 68
byte 1 69
byte 1 68
byte 1 32
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2391
byte 1 37
byte 1 105
byte 1 58
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 65
byte 1 73
byte 1 82
byte 1 45
byte 1 62
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 69
byte 1 78
byte 1 68
byte 1 69
byte 1 68
byte 1 32
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 40
byte 1 117
byte 1 115
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $2378
byte 1 37
byte 1 105
byte 1 58
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 69
byte 1 68
byte 1 45
byte 1 62
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 65
byte 1 73
byte 1 82
byte 1 10
byte 1 0
align 1
LABELV $2370
byte 1 37
byte 1 105
byte 1 58
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 69
byte 1 68
byte 1 45
byte 1 62
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 78
byte 1 79
byte 1 78
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $2364
byte 1 37
byte 1 105
byte 1 58
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 78
byte 1 79
byte 1 78
byte 1 69
byte 1 45
byte 1 62
byte 1 82
byte 1 79
byte 1 76
byte 1 76
byte 1 95
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 69
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $1590
byte 1 37
byte 1 105
byte 1 58
byte 1 71
byte 1 111
byte 1 111
byte 1 100
byte 1 32
byte 1 114
byte 1 97
byte 1 109
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $1587
byte 1 37
byte 1 105
byte 1 58
byte 1 68
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 114
byte 1 97
byte 1 109
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $1584
byte 1 37
byte 1 105
byte 1 58
byte 1 68
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 114
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1557
byte 1 37
byte 1 105
byte 1 58
byte 1 76
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1541
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 101
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $1530
byte 1 37
byte 1 105
byte 1 58
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 111
byte 1 102
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $1504
byte 1 37
byte 1 105
byte 1 58
byte 1 113
byte 1 50
byte 1 114
byte 1 97
byte 1 109
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $1476
byte 1 37
byte 1 105
byte 1 58
byte 1 108
byte 1 105
byte 1 102
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1446
byte 1 37
byte 1 105
byte 1 58
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1000
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
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $973
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
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $589
byte 1 94
byte 1 51
byte 1 114
byte 1 101
byte 1 97
byte 1 108
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 74
byte 1 117
byte 1 109
byte 1 112
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 48
byte 1 44
byte 1 32
byte 1 119
byte 1 101
byte 1 105
byte 1 114
byte 1 100
byte 1 46
byte 1 10
byte 1 0
