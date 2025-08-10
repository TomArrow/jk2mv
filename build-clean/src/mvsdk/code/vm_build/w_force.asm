data
export speedLoopSound
align 4
LABELV speedLoopSound
byte 4 0
export rageLoopSound
align 4
LABELV rageLoopSound
byte 4 0
export protectLoopSound
align 4
LABELV protectLoopSound
byte 4 0
export absorbLoopSound
align 4
LABELV absorbLoopSound
byte 4 0
export seeLoopSound
align 4
LABELV seeLoopSound
byte 4 0
export ysalamiriLoopSound
align 4
LABELV ysalamiriLoopSound
byte 4 0
export G_PreDefSound
code
proc G_PreDefSound 8 8
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\w_force.c"
line 27
;1:#include "g_local.h"
;2:#include "w_saber.h"
;3:#include "ai_main.h"
;4:#include "../ghoul2/G2.h"
;5:
;6:#define METROID_JUMP 1
;7:
;8:extern bot_state_t *botstates[MAX_CLIENTS];
;9:
;10:int speedLoopSound = 0;
;11: 
;12:int rageLoopSound = 0;
;13:
;14:int protectLoopSound = 0;
;15:
;16:int absorbLoopSound = 0;
;17:
;18:int seeLoopSound = 0;
;19:
;20:int	ysalamiriLoopSound = 0;
;21:
;22:#define FORCE_VELOCITY_DAMAGE 0
;23:
;24:int ForceShootDrain( gentity_t *self );
;25:
;26:gentity_t *G_PreDefSound(vec3_t org, int pdSound)
;27:{
line 30
;28:	gentity_t	*te;
;29:
;30:	te = G_TempEntity( org, EV_PREDEFSOUND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 31
;31:	te->s.eventParm = pdSound;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 32
;32:	VectorCopy(org, te->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 34
;33:
;34:	return te;
ADDRLP4 0
INDIRP4
RETP4
LABELV $124
endproc G_PreDefSound 8 8
export InFront
proc InFront 64 16
line 38
;35:}
;36:
;37:qboolean InFront( vec3_t spot, vec3_t from, vec3_t fromAngles, float threshHold )
;38:{
line 42
;39:	vec3_t	dir, forward, angles;
;40:	float	dot;
;41:
;42:	VectorSubtract( spot, from, dir );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 44
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 0+4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
CNSTI4 8
ASGNI4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 43
;43:	dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 44
;44:	VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 46
;45:
;46:	VectorCopy( fromAngles, angles );
ADDRLP4 24
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 47
;47:	angles[0] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 48
;48:	AngleVectors( angles, forward, NULL, NULL );
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 56
CNSTP4 0
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 50
;49:
;50:	dot = DotProduct( dir, forward );
ADDRLP4 36
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 52
;51:
;52:	return (dot > threshHold);
ADDRLP4 36
INDIRF4
ADDRFP4 12
INDIRF4
LEF4 $134
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRGP4 $135
JUMPV
LABELV $134
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $135
ADDRLP4 60
INDIRI4
RETI4
LABELV $125
endproc InFront 64 16
data
export forcePowerMinRank
align 4
LABELV forcePowerMinRank
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
byte 4 10
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 10
byte 4 15
byte 4 10
byte 4 15
byte 4 15
byte 4 15
byte 4 10
byte 4 10
byte 4 10
byte 4 5
byte 4 0
byte 4 0
byte 4 0
byte 4 10
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 10
byte 4 15
byte 4 10
byte 4 15
byte 4 15
byte 4 15
byte 4 10
byte 4 10
byte 4 10
byte 4 5
byte 4 5
byte 4 5
byte 4 5
byte 4 10
byte 4 0
byte 4 0
byte 4 0
byte 4 0
byte 4 10
byte 4 15
byte 4 10
byte 4 15
byte 4 15
byte 4 15
byte 4 10
byte 4 10
byte 4 10
byte 4 5
byte 4 10
byte 4 10
byte 4 10
export WP_InitForcePowers
code
proc WP_InitForcePowers 1652 28
line 144
;53:}
;54:
;55:int forcePowerMinRank[NUM_FORCE_POWER_LEVELS][NUM_FORCE_POWERS] = //0 == neutral
;56:{
;57:	{
;58:		999,//FP_HEAL,//instant
;59:		999,//FP_LEVITATION,//hold/duration
;60:		999,//FP_SPEED,//duration
;61:		999,//FP_PUSH,//hold/duration
;62:		999,//FP_PULL,//hold/duration
;63:		999,//FP_TELEPATHY,//instant
;64:		999,//FP_GRIP,//hold/duration
;65:		999,//FP_LIGHTNING,//hold/duration
;66:		999,//FP_RAGE,//duration
;67:		999,//FP_PROTECT,//duration
;68:		999,//FP_ABSORB,//duration
;69:		999,//FP_TEAM_HEAL,//instant
;70:		999,//FP_TEAM_FORCE,//instant
;71:		999,//FP_DRAIN,//hold/duration
;72:		999,//FP_SEE,//duration
;73:		999,//FP_SABERATTACK,
;74:		999,//FP_SABERDEFEND,
;75:		999//FP_SABERTHROW,
;76:		//NUM_FORCE_POWERS
;77:	},
;78:	{
;79:		10,//FP_HEAL,//instant
;80:		0,//FP_LEVITATION,//hold/duration
;81:		0,//FP_SPEED,//duration
;82:		0,//FP_PUSH,//hold/duration
;83:		0,//FP_PULL,//hold/duration
;84:		10,//FP_TELEPATHY,//instant
;85:		15,//FP_GRIP,//hold/duration
;86:		10,//FP_LIGHTNING,//hold/duration
;87:		15,//FP_RAGE,//duration
;88:		15,//FP_PROTECT,//duration
;89:		15,//FP_ABSORB,//duration
;90:		10,//FP_TEAM_HEAL,//instant
;91:		10,//FP_TEAM_FORCE,//instant
;92:		10,//FP_DRAIN,//hold/duration
;93:		5,//FP_SEE,//duration
;94:		0,//FP_SABERATTACK,
;95:		0,//FP_SABERDEFEND,
;96:		0//FP_SABERTHROW,
;97:		//NUM_FORCE_POWERS
;98:	},
;99:	{
;100:		10,//FP_HEAL,//instant
;101:		0,//FP_LEVITATION,//hold/duration
;102:		0,//FP_SPEED,//duration
;103:		0,//FP_PUSH,//hold/duration
;104:		0,//FP_PULL,//hold/duration
;105:		10,//FP_TELEPATHY,//instant
;106:		15,//FP_GRIP,//hold/duration
;107:		10,//FP_LIGHTNING,//hold/duration
;108:		15,//FP_RAGE,//duration
;109:		15,//FP_PROTECT,//duration
;110:		15,//FP_ABSORB,//duration
;111:		10,//FP_TEAM_HEAL,//instant
;112:		10,//FP_TEAM_FORCE,//instant
;113:		10,//FP_DRAIN,//hold/duration
;114:		5,//FP_SEE,//duration
;115:		5,//FP_SABERATTACK,
;116:		5,//FP_SABERDEFEND,
;117:		5//FP_SABERTHROW,
;118:		//NUM_FORCE_POWERS
;119:	},
;120:	{
;121:		10,//FP_HEAL,//instant
;122:		0,//FP_LEVITATION,//hold/duration
;123:		0,//FP_SPEED,//duration
;124:		0,//FP_PUSH,//hold/duration
;125:		0,//FP_PULL,//hold/duration
;126:		10,//FP_TELEPATHY,//instant
;127:		15,//FP_GRIP,//hold/duration
;128:		10,//FP_LIGHTNING,//hold/duration
;129:		15,//FP_RAGE,//duration
;130:		15,//FP_PROTECT,//duration
;131:		15,//FP_ABSORB,//duration
;132:		10,//FP_TEAM_HEAL,//instant
;133:		10,//FP_TEAM_FORCE,//instant
;134:		10,//FP_DRAIN,//hold/duration
;135:		5,//FP_SEE,//duration
;136:		10,//FP_SABERATTACK,
;137:		10,//FP_SABERDEFEND,
;138:		10//FP_SABERTHROW,
;139:		//NUM_FORCE_POWERS
;140:	}
;141:};
;142:
;143:void WP_InitForcePowers( gentity_t *ent )
;144:{
line 147
;145:	int i;
;146:	int i_r;
;147:	int maxRank = g_maxForceRank.integer;
ADDRLP4 1544
ADDRGP4 g_maxForceRank+12
INDIRI4
ASGNI4
line 148
;148:	qboolean warnClient = qfalse;
ADDRLP4 1552
CNSTI4 0
ASGNI4
line 149
;149:	qboolean warnClientLimit = qfalse;
ADDRLP4 1560
CNSTI4 0
ASGNI4
line 153
;150:	char userinfo[MAX_INFO_STRING];
;151:	char forcePowers[256];
;152:	char readBuf[256];
;153:	int lastFPKnown = -1;
ADDRLP4 1548
CNSTI4 -1
ASGNI4
line 154
;154:	qboolean didEvent = qfalse;
ADDRLP4 1556
CNSTI4 0
ASGNI4
line 156
;155:
;156:	if (!maxRank)
ADDRLP4 1544
INDIRI4
CNSTI4 0
NEI4 $138
line 157
;157:	{ //if server has no max rank, default to max (50)
line 158
;158:		maxRank = FORCE_MASTERY_JEDI_MASTER;
ADDRLP4 1544
CNSTI4 7
ASGNI4
line 159
;159:	}
LABELV $138
line 169
;160:
;161:	/*
;162:	if (g_forcePowerDisable.integer)
;163:	{
;164:		maxRank = FORCE_MASTERY_UNINITIATED;
;165:	}
;166:	*/
;167:	//rww - don't do this
;168:
;169:	if ( !ent || !ent->client )
ADDRLP4 1564
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1568
CNSTU4 0
ASGNU4
ADDRLP4 1564
INDIRP4
CVPU4 4
ADDRLP4 1568
INDIRU4
EQU4 $142
ADDRLP4 1564
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1568
INDIRU4
NEU4 $140
LABELV $142
line 170
;170:	{
line 171
;171:		return;
ADDRGP4 $136
JUMPV
LABELV $140
line 174
;172:	}
;173:
;174:	ent->client->ps.fd.saberAnimLevel = ent->client->sess.saberLevel;
ADDRLP4 1572
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1572
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 1572
INDIRP4
CNSTI4 43468
ADDP4
INDIRI4
ASGNI4
line 176
;175:
;176:	if (ent->client->ps.fd.saberAnimLevel < FORCE_LEVEL_1 ||
ADDRLP4 1576
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1576
INDIRI4
CNSTI4 1
LTI4 $145
ADDRLP4 1576
INDIRI4
CNSTI4 3
LEI4 $143
LABELV $145
line 178
;177:		ent->client->ps.fd.saberAnimLevel > FORCE_LEVEL_3)
;178:	{
line 179
;179:		ent->client->ps.fd.saberAnimLevel = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 1
ASGNI4
line 180
;180:	}
LABELV $143
line 182
;181:
;182:	if (!speedLoopSound)
ADDRGP4 speedLoopSound
INDIRI4
CNSTI4 0
NEI4 $146
line 183
;183:	{ //so that the client configstring is already modified with this when we need it
line 184
;184:		speedLoopSound = G_SoundIndex("sound/weapons/force/speedloop.wav");
ADDRGP4 $148
ARGP4
ADDRLP4 1580
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 speedLoopSound
ADDRLP4 1580
INDIRI4
ASGNI4
line 185
;185:	}
LABELV $146
line 187
;186:
;187:	if (!rageLoopSound)
ADDRGP4 rageLoopSound
INDIRI4
CNSTI4 0
NEI4 $149
line 188
;188:	{
line 189
;189:		rageLoopSound = G_SoundIndex("sound/weapons/force/rageloop.wav");
ADDRGP4 $151
ARGP4
ADDRLP4 1580
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 rageLoopSound
ADDRLP4 1580
INDIRI4
ASGNI4
line 190
;190:	}
LABELV $149
line 192
;191:
;192:	if (!absorbLoopSound)
ADDRGP4 absorbLoopSound
INDIRI4
CNSTI4 0
NEI4 $152
line 193
;193:	{
line 194
;194:		absorbLoopSound = G_SoundIndex("sound/weapons/force/absorbloop.wav");
ADDRGP4 $154
ARGP4
ADDRLP4 1580
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 absorbLoopSound
ADDRLP4 1580
INDIRI4
ASGNI4
line 195
;195:	}
LABELV $152
line 197
;196:
;197:	if (!protectLoopSound)
ADDRGP4 protectLoopSound
INDIRI4
CNSTI4 0
NEI4 $155
line 198
;198:	{
line 199
;199:		protectLoopSound = G_SoundIndex("sound/weapons/force/protectloop.wav");
ADDRGP4 $157
ARGP4
ADDRLP4 1580
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 protectLoopSound
ADDRLP4 1580
INDIRI4
ASGNI4
line 200
;200:	}
LABELV $155
line 202
;201:
;202:	if (!seeLoopSound)
ADDRGP4 seeLoopSound
INDIRI4
CNSTI4 0
NEI4 $158
line 203
;203:	{
line 204
;204:		seeLoopSound = G_SoundIndex("sound/weapons/force/seeloop.wav");
ADDRGP4 $160
ARGP4
ADDRLP4 1580
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 seeLoopSound
ADDRLP4 1580
INDIRI4
ASGNI4
line 205
;205:	}
LABELV $158
line 207
;206:
;207:	if (!ysalamiriLoopSound)
ADDRGP4 ysalamiriLoopSound
INDIRI4
CNSTI4 0
NEI4 $161
line 208
;208:	{
line 209
;209:		ysalamiriLoopSound = G_SoundIndex("sound/player/nullifyloop.wav");
ADDRGP4 $163
ARGP4
ADDRLP4 1580
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 ysalamiriLoopSound
ADDRLP4 1580
INDIRI4
ASGNI4
line 210
;210:	}
LABELV $161
line 212
;211:
;212:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $165
JUMPV
LABELV $164
line 214
;213:	while (i < NUM_FORCE_POWERS)
;214:	{
line 215
;215:		ent->client->ps.fd.forcePowerLevel[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 216
;216:		ent->client->ps.fd.forcePowersKnown &= ~(1 << i);
ADDRLP4 1580
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 1580
INDIRP4
ADDRLP4 1580
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 217
;217:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 218
;218:	}
LABELV $165
line 213
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $164
line 220
;219:
;220:	ent->client->ps.fd.forcePowerSelected = -1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
CNSTI4 -1
ASGNI4
line 222
;221:
;222:	ent->client->ps.fd.forceSide = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1188
ADDP4
CNSTI4 0
ASGNI4
line 224
;223:
;224:	trap_GetUserinfo( ent->s.number, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 520
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 226
;225:
;226:	Q_strncpyz( forcePowers, Info_ValueForKey (userinfo, "forcepowers"), sizeof( forcePowers ) );
ADDRLP4 520
ARGP4
ADDRGP4 $167
ARGP4
ADDRLP4 1580
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 1580
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 228
;227:
;228:	if ( ent->r.svFlags & SVF_BOT && botstates[ent->s.number] )
ADDRLP4 1584
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1584
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $168
ADDRLP4 1584
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $168
line 229
;229:	{ //if it's a bot just copy the info directly from its personality
line 230
;230:		Q_strncpyz(forcePowers, botstates[ent->s.number]->forceinfo, sizeof(forcePowers));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 2744
ADDP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 231
;231:	}
LABELV $168
line 234
;232:	
;233:	// ForceCrashFix
;234:	if (!strlen(forcePowers))
ADDRLP4 4
ARGP4
ADDRLP4 1588
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 1588
INDIRU4
CNSTU4 0
NEU4 $170
line 235
;235:	{ // Empty forcePowers
line 236
;236:		Q_strncpyz( forcePowers, "7-1-032330000000001333", sizeof(forcePowers) );
ADDRLP4 4
ARGP4
ADDRGP4 $172
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 237
;237:		G_LogPrintf( "WP_InitForcePowers: client %i (%s) has no force powers.\n", ent->client->ps.clientNum, ent->client->pers.netname );
ADDRGP4 $173
ARGP4
ADDRLP4 1592
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1592
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1592
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 239
;238:			
;239:		Info_RemoveKey(userinfo, "forcepowers");
ADDRLP4 520
ARGP4
ADDRGP4 $167
ARGP4
ADDRGP4 Info_RemoveKey
CALLV
pop
line 240
;240:		Info_SetValueForKey(userinfo, "forcepowers", forcePowers);
ADDRLP4 520
ARGP4
ADDRGP4 $167
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 241
;241:		trap_SetUserinfo(ent->s.number, userinfo);
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 520
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 242
;242:	}
ADDRGP4 $171
JUMPV
LABELV $170
line 244
;243:	else
;244:	{ // Got forcePowers, let's check if they're valid
line 245
;245:		qboolean	validForcePowers = qtrue;
ADDRLP4 1600
CNSTI4 1
ASGNI4
line 246
;246:		int		step = 0;
ADDRLP4 1596
CNSTI4 0
ASGNI4
line 247
;247:		int		count = 0;
ADDRLP4 1592
CNSTI4 0
ASGNI4
line 250
;248:
;249:		// Check if the forcePowers follow this layout: '####-#-##################', with '####' being any amount of numbers
;250:		for ( i = 0; i < (int)strlen(forcePowers); i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $177
JUMPV
LABELV $174
line 251
;251:		{
line 252
;252:			if ( forcePowers[i] >= '0' && forcePowers[i] <= '9' )
ADDRLP4 1604
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1604
INDIRI4
CNSTI4 48
LTI4 $178
ADDRLP4 1604
INDIRI4
CNSTI4 57
GTI4 $178
line 253
;253:			{
line 254
;254:				count++;
ADDRLP4 1592
ADDRLP4 1592
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 255
;255:				if ( step == 1 && count > 1 ) validForcePowers = qfalse;
ADDRLP4 1608
CNSTI4 1
ASGNI4
ADDRLP4 1596
INDIRI4
ADDRLP4 1608
INDIRI4
NEI4 $180
ADDRLP4 1592
INDIRI4
ADDRLP4 1608
INDIRI4
LEI4 $180
ADDRLP4 1600
CNSTI4 0
ASGNI4
LABELV $180
line 256
;256:				if ( step == 2 && count == NUM_FORCE_POWERS && (int)strlen(forcePowers)-1 > i )
ADDRLP4 1596
INDIRI4
CNSTI4 2
NEI4 $182
ADDRLP4 1592
INDIRI4
CNSTI4 18
NEI4 $182
ADDRLP4 4
ARGP4
ADDRLP4 1612
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 1612
INDIRU4
CVUI4 4
CNSTI4 1
SUBI4
ADDRLP4 0
INDIRI4
LEI4 $182
line 257
;257:				{ // We seem to have a too long forceString, but the beginning is valid so cut off the rest
line 258
;258:					forcePowers[i+i] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 259
;259:					break;
ADDRGP4 $176
JUMPV
LABELV $182
line 261
;260:				}
;261:				if ( step == 2 && count > NUM_FORCE_POWERS ) validForcePowers = qfalse;
ADDRLP4 1596
INDIRI4
CNSTI4 2
NEI4 $179
ADDRLP4 1592
INDIRI4
CNSTI4 18
LEI4 $179
ADDRLP4 1600
CNSTI4 0
ASGNI4
line 262
;262:			}
ADDRGP4 $179
JUMPV
LABELV $178
line 263
;263:			else if ( forcePowers[i] == '-' )
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $186
line 264
;264:			{
line 265
;265:				count = 0;
ADDRLP4 1592
CNSTI4 0
ASGNI4
line 266
;266:				step++;
ADDRLP4 1596
ADDRLP4 1596
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 268
;267:
;268:				if ( step > 2 ) validForcePowers = qfalse;
ADDRLP4 1596
INDIRI4
CNSTI4 2
LEI4 $187
ADDRLP4 1600
CNSTI4 0
ASGNI4
line 269
;269:			}
ADDRGP4 $187
JUMPV
LABELV $186
line 271
;270:			else
;271:			{
line 272
;272:				validForcePowers = qfalse;
ADDRLP4 1600
CNSTI4 0
ASGNI4
line 273
;273:			}
LABELV $187
LABELV $179
line 275
;274:
;275:			if ( !validForcePowers ) break;
ADDRLP4 1600
INDIRI4
CNSTI4 0
NEI4 $190
ADDRGP4 $176
JUMPV
LABELV $190
line 276
;276:		}
LABELV $175
line 250
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $177
ADDRLP4 4
ARGP4
ADDRLP4 1604
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
INDIRI4
ADDRLP4 1604
INDIRU4
CVUI4 4
LTI4 $174
LABELV $176
line 277
;277:		if ( step != 2 ) validForcePowers = qfalse;
ADDRLP4 1596
INDIRI4
CNSTI4 2
EQI4 $192
ADDRLP4 1600
CNSTI4 0
ASGNI4
LABELV $192
line 278
;278:		if ( count < NUM_FORCE_POWERS ) validForcePowers = qfalse;
ADDRLP4 1592
INDIRI4
CNSTI4 18
GEI4 $194
ADDRLP4 1600
CNSTI4 0
ASGNI4
LABELV $194
line 280
;279:
;280:		if ( !validForcePowers )
ADDRLP4 1600
INDIRI4
CNSTI4 0
NEI4 $196
line 281
;281:		{
line 282
;282:			G_LogPrintf( "WP_InitForcePowers: client %i (%s) has invalid force powers (%s).\n", ent->client->ps.clientNum, ent->client->pers.netname, forcePowers );
ADDRGP4 $198
ARGP4
ADDRLP4 1608
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1608
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1608
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 283
;283:			Q_strncpyz( forcePowers, "7-1-032330000000001333", sizeof(forcePowers) );
ADDRLP4 4
ARGP4
ADDRGP4 $172
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 285
;284:			
;285:			Info_RemoveKey(userinfo, "forcepowers");
ADDRLP4 520
ARGP4
ADDRGP4 $167
ARGP4
ADDRGP4 Info_RemoveKey
CALLV
pop
line 286
;286:			Info_SetValueForKey(userinfo, "forcepowers", forcePowers);
ADDRLP4 520
ARGP4
ADDRGP4 $167
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 287
;287:			trap_SetUserinfo(ent->s.number, userinfo);
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 520
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 288
;288:		}
LABELV $196
line 289
;289:	}
LABELV $171
line 292
;290:
;291:	//rww - parse through the string manually and eat out all the appropriate data
;292:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 294
;293:
;294:	if (g_forceBasedTeams.integer)
ADDRGP4 g_forceBasedTeams+12
INDIRI4
CNSTI4 0
EQI4 $199
line 295
;295:	{
line 296
;296:		if (ent->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $202
line 297
;297:		{
line 298
;298:			warnClient = !(BG_LegalizedForcePowers(forcePowers,sizeof(forcePowers), maxRank, HasSetSaberOnly(), FORCE_DARKSIDE, g_gametype.integer, g_forcePowerDisable.integer));
ADDRLP4 1596
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 1544
INDIRI4
ARGI4
ADDRLP4 1596
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ARGI4
ADDRLP4 1600
ADDRGP4 BG_LegalizedForcePowers
CALLI4
ASGNI4
ADDRLP4 1600
INDIRI4
CNSTI4 0
NEI4 $207
ADDRLP4 1592
CNSTI4 1
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $207
ADDRLP4 1592
CNSTI4 0
ASGNI4
LABELV $208
ADDRLP4 1552
ADDRLP4 1592
INDIRI4
ASGNI4
line 299
;299:		}
ADDRGP4 $200
JUMPV
LABELV $202
line 300
;300:		else if (ent->client->sess.sessionTeam == TEAM_BLUE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 2
NEI4 $209
line 301
;301:		{
line 302
;302:			warnClient = !(BG_LegalizedForcePowers(forcePowers, sizeof(forcePowers), maxRank, HasSetSaberOnly(), FORCE_LIGHTSIDE, g_gametype.integer, g_forcePowerDisable.integer));
ADDRLP4 1596
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 1544
INDIRI4
ARGI4
ADDRLP4 1596
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ARGI4
ADDRLP4 1600
ADDRGP4 BG_LegalizedForcePowers
CALLI4
ASGNI4
ADDRLP4 1600
INDIRI4
CNSTI4 0
NEI4 $214
ADDRLP4 1592
CNSTI4 1
ASGNI4
ADDRGP4 $215
JUMPV
LABELV $214
ADDRLP4 1592
CNSTI4 0
ASGNI4
LABELV $215
ADDRLP4 1552
ADDRLP4 1592
INDIRI4
ASGNI4
line 303
;303:		}
ADDRGP4 $200
JUMPV
LABELV $209
line 305
;304:		else
;305:		{
line 306
;306:			warnClient = !(BG_LegalizedForcePowers(forcePowers, sizeof(forcePowers), maxRank, HasSetSaberOnly(), 0, g_gametype.integer, g_forcePowerDisable.integer));
ADDRLP4 1596
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 1544
INDIRI4
ARGI4
ADDRLP4 1596
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ARGI4
ADDRLP4 1600
ADDRGP4 BG_LegalizedForcePowers
CALLI4
ASGNI4
ADDRLP4 1600
INDIRI4
CNSTI4 0
NEI4 $219
ADDRLP4 1592
CNSTI4 1
ASGNI4
ADDRGP4 $220
JUMPV
LABELV $219
ADDRLP4 1592
CNSTI4 0
ASGNI4
LABELV $220
ADDRLP4 1552
ADDRLP4 1592
INDIRI4
ASGNI4
line 307
;307:		}
line 308
;308:	}
ADDRGP4 $200
JUMPV
LABELV $199
line 310
;309:	else
;310:	{
line 311
;311:		warnClient = !(BG_LegalizedForcePowers(forcePowers, sizeof(forcePowers), maxRank, HasSetSaberOnly(), 0, g_gametype.integer, g_forcePowerDisable.integer));
ADDRLP4 1596
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 1544
INDIRI4
ARGI4
ADDRLP4 1596
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ARGI4
ADDRLP4 1600
ADDRGP4 BG_LegalizedForcePowers
CALLI4
ASGNI4
ADDRLP4 1600
INDIRI4
CNSTI4 0
NEI4 $224
ADDRLP4 1592
CNSTI4 1
ASGNI4
ADDRGP4 $225
JUMPV
LABELV $224
ADDRLP4 1592
CNSTI4 0
ASGNI4
LABELV $225
ADDRLP4 1552
ADDRLP4 1592
INDIRI4
ASGNI4
line 312
;312:	}
LABELV $200
line 314
;313:
;314:	i_r = 0;
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRGP4 $227
JUMPV
LABELV $226
line 316
;315:	while (forcePowers[i] && forcePowers[i] != '-')
;316:	{
line 317
;317:		readBuf[i_r] = forcePowers[i];
ADDRLP4 260
INDIRI4
ADDRLP4 264
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
ASGNI1
line 318
;318:		i_r++;
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 319
;319:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 320
;320:	}
LABELV $227
line 315
ADDRLP4 1592
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1592
INDIRI4
CNSTI4 0
EQI4 $229
ADDRLP4 1592
INDIRI4
CNSTI4 45
NEI4 $226
LABELV $229
line 321
;321:	readBuf[i_r] = 0;
ADDRLP4 260
INDIRI4
ADDRLP4 264
ADDP4
CNSTI1 0
ASGNI1
line 323
;322:	//THE RANK
;323:	ent->client->ps.fd.forceRank = atoi(readBuf);
ADDRLP4 264
ARGP4
ADDRLP4 1596
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1192
ADDP4
ADDRLP4 1596
INDIRI4
ASGNI4
line 324
;324:	i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 326
;325:
;326:	i_r = 0;
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $230
line 328
;327:	while (forcePowers[i] && forcePowers[i] != '-')
;328:	{
line 329
;329:		readBuf[i_r] = forcePowers[i];
ADDRLP4 260
INDIRI4
ADDRLP4 264
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
ASGNI1
line 330
;330:		i_r++;
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 331
;331:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 332
;332:	}
LABELV $231
line 327
ADDRLP4 1600
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1600
INDIRI4
CNSTI4 0
EQI4 $233
ADDRLP4 1600
INDIRI4
CNSTI4 45
NEI4 $230
LABELV $233
line 333
;333:	readBuf[i_r] = 0;
ADDRLP4 260
INDIRI4
ADDRLP4 264
ADDP4
CNSTI1 0
ASGNI1
line 335
;334:	//THE SIDE
;335:	ent->client->ps.fd.forceSide = atoi(readBuf);
ADDRLP4 264
ARGP4
ADDRLP4 1604
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1188
ADDP4
ADDRLP4 1604
INDIRI4
ASGNI4
line 336
;336:	i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 338
;337:
;338:	i_r = 0;
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRGP4 $235
JUMPV
LABELV $234
line 341
;339:	while (forcePowers[i] && forcePowers[i] != '\n' &&
;340:		i_r < NUM_FORCE_POWERS)
;341:	{
line 342
;342:		readBuf[0] = forcePowers[i];
ADDRLP4 264
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
ASGNI1
line 343
;343:		readBuf[1] = 0;
ADDRLP4 264+1
CNSTI1 0
ASGNI1
line 345
;344:
;345:		ent->client->ps.fd.forcePowerLevel[i_r] = atoi(readBuf);
ADDRLP4 264
ARGP4
ADDRLP4 1608
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 1608
INDIRI4
ASGNI4
line 346
;346:		if (ent->client->ps.fd.forcePowerLevel[i_r])
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $238
line 347
;347:		{
line 348
;348:			ent->client->ps.fd.forcePowersKnown |= (1 << i_r);
ADDRLP4 1612
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 1612
INDIRP4
ADDRLP4 1612
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 260
INDIRI4
LSHI4
BORI4
ASGNI4
line 349
;349:		}
ADDRGP4 $239
JUMPV
LABELV $238
line 351
;350:		else
;351:		{
line 352
;352:			ent->client->ps.fd.forcePowersKnown &= ~(1 << i_r);
ADDRLP4 1612
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 1612
INDIRP4
ADDRLP4 1612
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 260
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 353
;353:		}
LABELV $239
line 354
;354:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 355
;355:		i_r++;
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 356
;356:	}
LABELV $235
line 339
ADDRLP4 1608
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1608
INDIRI4
CNSTI4 0
EQI4 $241
ADDRLP4 1608
INDIRI4
CNSTI4 10
EQI4 $241
ADDRLP4 260
INDIRI4
CNSTI4 18
LTI4 $234
LABELV $241
line 359
;357:	//THE POWERS
;358:
;359:	if (HasSetSaberOnly())
ADDRLP4 1612
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 1612
INDIRI4
CNSTI4 0
EQI4 $242
line 360
;360:	{
line 361
;361:		gentity_t *te = G_TempEntity( vec3_origin, EV_SET_FREE_SABER );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 93
ARGI4
ADDRLP4 1620
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1616
ADDRLP4 1620
INDIRP4
ASGNP4
line 362
;362:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 1624
ADDRLP4 1616
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1624
INDIRP4
ADDRLP4 1624
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 363
;363:		te->s.eventParm = 1;
ADDRLP4 1616
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 364
;364:	}
ADDRGP4 $243
JUMPV
LABELV $242
line 366
;365:	else
;366:	{
line 367
;367:		gentity_t *te = G_TempEntity( vec3_origin, EV_SET_FREE_SABER );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 93
ARGI4
ADDRLP4 1620
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1616
ADDRLP4 1620
INDIRP4
ASGNP4
line 368
;368:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 1624
ADDRLP4 1616
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1624
INDIRP4
ADDRLP4 1624
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 369
;369:		te->s.eventParm = 0;
ADDRLP4 1616
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 370
;370:	}
LABELV $243
line 372
;371:
;372:	if (g_forcePowerDisable.integer)
ADDRGP4 g_forcePowerDisable+12
INDIRI4
CNSTI4 0
EQI4 $244
line 373
;373:	{
line 374
;374:		gentity_t *te = G_TempEntity( vec3_origin, EV_SET_FORCE_DISABLE );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 1620
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1616
ADDRLP4 1620
INDIRP4
ASGNP4
line 375
;375:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 1624
ADDRLP4 1616
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1624
INDIRP4
ADDRLP4 1624
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 376
;376:		te->s.eventParm = 1;
ADDRLP4 1616
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 377
;377:	}
ADDRGP4 $245
JUMPV
LABELV $244
line 379
;378:	else
;379:	{
line 380
;380:		gentity_t *te = G_TempEntity( vec3_origin, EV_SET_FORCE_DISABLE );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 1620
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1616
ADDRLP4 1620
INDIRP4
ASGNP4
line 381
;381:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 1624
ADDRLP4 1616
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1624
INDIRP4
ADDRLP4 1624
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 382
;382:		te->s.eventParm = 0;
ADDRLP4 1616
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 383
;383:	}
LABELV $245
line 387
;384:
;385:	//rww - It seems we currently want to always do this, even if the player isn't exceeding the max
;386:	//rank, so..
;387:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $247
line 388
;388:	{ //totally messes duel up to force someone into spec mode, and besides, each "round" is
line 390
;389:	  //counted as a full restart
;390:		ent->client->sess.setForce = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43472
ADDP4
CNSTI4 1
ASGNI4
line 391
;391:	}
LABELV $247
line 393
;392:
;393:	if (warnClient || !ent->client->sess.setForce)
ADDRLP4 1616
CNSTI4 0
ASGNI4
ADDRLP4 1552
INDIRI4
ADDRLP4 1616
INDIRI4
NEI4 $252
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43472
ADDP4
INDIRI4
ADDRLP4 1616
INDIRI4
NEI4 $250
LABELV $252
line 394
;394:	{ //the client's rank is too high for the server and has been autocapped, so tell them
line 395
;395:		if (g_gametype.integer != GT_HOLOCRON && g_gametype.integer != GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $253
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $253
line 396
;396:		{
line 405
;397:#ifdef EVENT_FORCE_RANK
;398:			gentity_t *te = G_TempEntity( vec3_origin, EV_GIVE_NEW_RANK );
;399:
;400:			te->r.svFlags |= SVF_BROADCAST;
;401:			te->s.trickedentindex = ent->s.number;
;402:			te->s.eventParm = maxRank;
;403:			te->s.bolt1 = 0;
;404:#endif
;405:			didEvent = qtrue;
ADDRLP4 1556
CNSTI4 1
ASGNI4
line 407
;406:
;407:			if (!(ent->r.svFlags & SVF_BOT) && g_gametype.integer != GT_TOURNAMENT)
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $257
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $257
line 408
;408:			{
line 409
;409:				if (g_gametype.integer < GT_TEAM || !g_teamAutoJoin.integer)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $264
ADDRGP4 g_teamAutoJoin+12
INDIRI4
CNSTI4 0
NEI4 $260
LABELV $264
line 410
;410:				{
line 411
;411:					team_t	team = ent->client->sess.sessionTeam;
ADDRLP4 1620
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 414
;412:
;413:					//Make them a spectator so they can set their powerups up without being bothered.
;414:					ent->client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
CNSTI4 3
ASGNI4
line 415
;415:					ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43448
ADDP4
CNSTI4 1
ASGNI4
line 416
;416:					ent->client->sess.spectatorClient = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43452
ADDP4
CNSTI4 0
ASGNI4
line 418
;417:
;418:					ent->client->pers.teamState.state = TEAM_BEGIN;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1640
ADDP4
CNSTI4 0
ASGNI4
line 420
;419:
;420:					if (team != TEAM_SPECTATOR)
ADDRLP4 1620
INDIRI4
CNSTI4 3
EQI4 $265
line 421
;421:						ClientUserinfoChanged( ent->s.number );
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
LABELV $265
line 422
;422:				}
LABELV $260
line 423
;423:			}
LABELV $257
line 430
;424:
;425:#ifdef EVENT_FORCE_RANK
;426:			te->s.bolt2 = ent->client->sess.sessionTeam;
;427:#else
;428:			//Event isn't very reliable, I made it a string. This way I can send it to just one
;429:			//client also, as opposed to making a broadcast event.
;430:			trap_SendServerCommand(ent->s.number, va("nfr %i %i %i", maxRank, 1, ent->client->sess.sessionTeam));
ADDRGP4 $267
ARGP4
ADDRLP4 1544
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ARGI4
ADDRLP4 1620
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1620
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 433
;431:			//Arg1 is new max rank, arg2 is non-0 if force menu should be shown, arg3 is the current team
;432:#endif
;433:		}
LABELV $253
line 434
;434:		ent->client->sess.setForce = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43472
ADDP4
CNSTI4 1
ASGNI4
line 435
;435:	}
LABELV $250
line 437
;436:
;437:	if (!didEvent)
ADDRLP4 1556
INDIRI4
CNSTI4 0
NEI4 $268
line 438
;438:	{
line 448
;439:#ifdef EVENT_FORCE_RANK
;440:		gentity_t *te = G_TempEntity( vec3_origin, EV_GIVE_NEW_RANK );
;441:
;442:		te->r.svFlags |= SVF_BROADCAST;
;443:		te->s.trickedentindex = ent->s.number;
;444:		te->s.eventParm = maxRank;
;445:		te->s.bolt1 = 1;
;446:		te->s.bolt2 = ent->client->sess.sessionTeam;
;447:#else
;448:		trap_SendServerCommand(ent->s.number, va("nfr %i %i %i", maxRank, 0, ent->client->sess.sessionTeam));
ADDRGP4 $267
ARGP4
ADDRLP4 1544
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ARGI4
ADDRLP4 1620
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1620
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 450
;449:#endif
;450:	}
LABELV $268
line 452
;451:
;452:	if (warnClientLimit)
ADDRLP4 1560
INDIRI4
CNSTI4 0
EQI4 $270
line 453
;453:	{ //the server has one or more force powers disabled and the client is using them in his config
line 455
;454:		//trap_SendServerCommand(ent-g_entities, va("print \"The server has one or more force powers that you have chosen disabled.\nYou will not be able to use the disable force power(s) while playing on this server.\n\""));
;455:	}
LABELV $270
line 457
;456:
;457:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $273
JUMPV
LABELV $272
line 459
;458:	while (i < NUM_FORCE_POWERS)
;459:	{
line 460
;460:		if ((ent->client->ps.fd.forcePowersKnown & (1 << i)) &&
ADDRLP4 1620
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1628
CNSTI4 0
ASGNI4
ADDRLP4 1620
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
ADDRLP4 1628
INDIRI4
EQI4 $275
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1620
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
ADDRLP4 1628
INDIRI4
NEI4 $275
line 462
;461:			!ent->client->ps.fd.forcePowerLevel[i])
;462:		{ //err..
line 463
;463:			ent->client->ps.fd.forcePowersKnown &= ~(1 << i);
ADDRLP4 1632
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 1632
INDIRP4
ADDRLP4 1632
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 464
;464:		}
ADDRGP4 $276
JUMPV
LABELV $275
line 466
;465:		else
;466:		{
line 467
;467:			if (i != FP_LEVITATION && i != FP_SABERATTACK && i != FP_SABERDEFEND && i != FP_SABERTHROW)
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $277
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $277
ADDRLP4 0
INDIRI4
CNSTI4 16
EQI4 $277
ADDRLP4 0
INDIRI4
CNSTI4 17
EQI4 $277
line 468
;468:			{
line 469
;469:				lastFPKnown = i;
ADDRLP4 1548
ADDRLP4 0
INDIRI4
ASGNI4
line 470
;470:			}
LABELV $277
line 471
;471:		}
LABELV $276
line 473
;472:
;473:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 474
;474:	}
LABELV $273
line 458
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $272
line 476
;475:
;476:	if (ent->client->ps.fd.forcePowersKnown & ent->client->sess.selectedFP)
ADDRLP4 1620
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1620
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ADDRLP4 1620
INDIRP4
CNSTI4 43464
ADDP4
INDIRI4
BANDI4
CNSTI4 0
EQI4 $279
line 477
;477:	{
line 478
;478:		ent->client->ps.fd.forcePowerSelected = ent->client->sess.selectedFP;
ADDRLP4 1624
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1624
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 1624
INDIRP4
CNSTI4 43464
ADDP4
INDIRI4
ASGNI4
line 479
;479:	}
LABELV $279
line 481
;480:
;481:	if (!(ent->client->ps.fd.forcePowersKnown & (1 << ent->client->ps.fd.forcePowerSelected)))
ADDRLP4 1624
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1624
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 1624
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $281
line 482
;482:	{
line 483
;483:		if (lastFPKnown != -1)
ADDRLP4 1548
INDIRI4
CNSTI4 -1
EQI4 $283
line 484
;484:		{
line 485
;485:			ent->client->ps.fd.forcePowerSelected = lastFPKnown;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 1548
INDIRI4
ASGNI4
line 486
;486:		}
ADDRGP4 $284
JUMPV
LABELV $283
line 488
;487:		else
;488:		{
line 489
;489:			ent->client->ps.fd.forcePowerSelected = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
CNSTI4 0
ASGNI4
line 490
;490:		}
LABELV $284
line 491
;491:	}
LABELV $281
line 493
;492:
;493:	if ( jk2gameplay != VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $285
line 494
;494:	{
ADDRGP4 $288
JUMPV
LABELV $287
line 496
;495:		while (i < NUM_FORCE_POWERS)
;496:		{
line 497
;497:			ent->client->ps.fd.forcePowerBaseLevel[i] = ent->client->ps.fd.forcePowerLevel[i];
ADDRLP4 1628
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1632
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1628
INDIRI4
ADDRLP4 1632
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
ADDRLP4 1628
INDIRI4
ADDRLP4 1632
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
ASGNI4
line 498
;498:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 499
;499:		}
LABELV $288
line 495
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $287
line 500
;500:		ent->client->ps.fd.forceUsingAdded = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1088
ADDP4
CNSTI4 0
ASGNI4
line 501
;501:	}
LABELV $285
line 504
;502:
;503:
;504:	if (ent->client->sess.mode == MODE_DUEL || ent->client->sess.mode == MODE_IRONMAN) {
ADDRLP4 1628
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1628
INDIRI4
CNSTI4 3
EQI4 $292
ADDRLP4 1628
INDIRI4
CNSTI4 5
NEI4 $290
LABELV $292
line 506
;505:		// saber attack/defend is level 3, jump is level 1, rest is 0
;506:		i = 0; 
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $294
JUMPV
LABELV $293
line 508
;507:		while (i < NUM_FORCE_POWERS)
;508:		{
line 509
;509:			if (i == FP_SABERATTACK || i == FP_SABERDEFEND) {
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $298
ADDRLP4 0
INDIRI4
CNSTI4 16
NEI4 $296
LABELV $298
line 510
;510:				ent->client->ps.fd.forcePowerBaseLevel[i] = ent->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 1636
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1640
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1644
CNSTI4 3
ASGNI4
ADDRLP4 1636
INDIRI4
ADDRLP4 1640
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 1644
INDIRI4
ASGNI4
ADDRLP4 1636
INDIRI4
ADDRLP4 1640
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
ADDRLP4 1644
INDIRI4
ASGNI4
line 511
;511:				ent->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 1648
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 1648
INDIRP4
ADDRLP4 1648
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 512
;512:			}
ADDRGP4 $297
JUMPV
LABELV $296
line 513
;513:			else if (i == FP_LEVITATION) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $299
line 514
;514:				ent->client->ps.fd.forcePowerBaseLevel[i] = ent->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_1;
ADDRLP4 1636
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1640
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1644
CNSTI4 1
ASGNI4
ADDRLP4 1636
INDIRI4
ADDRLP4 1640
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 1644
INDIRI4
ASGNI4
ADDRLP4 1636
INDIRI4
ADDRLP4 1640
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
ADDRLP4 1644
INDIRI4
ASGNI4
line 515
;515:				ent->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 1648
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 1648
INDIRP4
ADDRLP4 1648
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 516
;516:			}
ADDRGP4 $300
JUMPV
LABELV $299
line 517
;517:			else {
line 518
;518:				ent->client->ps.fd.forcePowerBaseLevel[i] = ent->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_0;
ADDRLP4 1636
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1640
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1644
CNSTI4 0
ASGNI4
ADDRLP4 1636
INDIRI4
ADDRLP4 1640
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 1644
INDIRI4
ASGNI4
ADDRLP4 1636
INDIRI4
ADDRLP4 1640
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
ADDRLP4 1644
INDIRI4
ASGNI4
line 519
;519:				ent->client->ps.fd.forcePowersKnown &= ~(1 << i);
ADDRLP4 1648
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 1648
INDIRP4
ADDRLP4 1648
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 520
;520:			}
LABELV $300
LABELV $297
line 521
;521:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 522
;522:		}
LABELV $294
line 507
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $293
line 523
;523:	}
ADDRGP4 $291
JUMPV
LABELV $290
line 524
;524:	else if (ent->client->sess.mode == MODE_ALLFORCE) { 
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
CNSTI4 4
NEI4 $301
line 526
;525:		// just give us all of everything
;526:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $304
JUMPV
LABELV $303
line 528
;527:		while (i < NUM_FORCE_POWERS)
;528:		{
line 529
;529:			ent->client->ps.fd.forcePowerBaseLevel[i] = ent->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 1632
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1636
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1640
CNSTI4 3
ASGNI4
ADDRLP4 1632
INDIRI4
ADDRLP4 1636
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 1640
INDIRI4
ASGNI4
ADDRLP4 1632
INDIRI4
ADDRLP4 1636
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
ADDRLP4 1640
INDIRI4
ASGNI4
line 530
;530:			ent->client->ps.fd.forcePowersKnown |= (1<<i);
ADDRLP4 1644
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 1644
INDIRP4
ADDRLP4 1644
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 531
;531:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 532
;532:		}
LABELV $304
line 527
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $303
line 533
;533:	}
LABELV $301
LABELV $291
line 535
;534:
;535:}
LABELV $136
endproc WP_InitForcePowers 1652 28
export WP_SpawnInitForcePowers
proc WP_SpawnInitForcePowers 28 8
line 538
;536:
;537:void WP_SpawnInitForcePowers( gentity_t *ent )
;538:{
line 539
;539:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 541
;540:
;541:	ent->client->ps.saberAttackChainCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1308
ADDP4
CNSTI4 0
ASGNI4
line 543
;542:
;543:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $308
JUMPV
LABELV $307
line 546
;544:
;545:	while (i < NUM_FORCE_POWERS)
;546:	{
line 547
;547:		if (ent->client->ps.fd.forcePowersActive & (1 << i))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $310
line 548
;548:		{
line 549
;549:			WP_ForcePowerStop(ent, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 550
;550:		}
LABELV $310
line 552
;551:
;552:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 553
;553:	}
LABELV $308
line 545
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $307
line 555
;554:
;555:	ent->client->ps.fd.forceDeactivateAll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1196
ADDP4
CNSTI4 0
ASGNI4
line 557
;556:
;557:	ent->client->ps.fd.forcePower = ent->client->ps.fd.forcePowerMax = FORCE_POWER_MAX;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 100
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 936
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 932
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 558
;558:	ent->client->ps.fd.forcePowerRegenDebounceTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 940
ADDP4
CNSTI4 0
ASGNI4
line 559
;559:	ent->client->ps.fd.forceGripEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
CNSTI4 1023
ASGNI4
line 560
;560:	ent->client->ps.fd.forceMindtrickTargetIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1156
ADDP4
CNSTI4 0
ASGNI4
line 561
;561:	ent->client->ps.fd.forceMindtrickTargetIndex2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1160
ADDP4
CNSTI4 0
ASGNI4
line 562
;562:	ent->client->ps.fd.forceMindtrickTargetIndex3 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1164
ADDP4
CNSTI4 0
ASGNI4
line 563
;563:	ent->client->ps.fd.forceMindtrickTargetIndex4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1168
ADDP4
CNSTI4 0
ASGNI4
line 565
;564:
;565:	ent->client->ps.holocronBits = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 0
ASGNI4
line 567
;566:
;567:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $313
JUMPV
LABELV $312
line 569
;568:	while (i < NUM_FORCE_POWERS)
;569:	{
line 570
;570:		ent->client->ps.holocronsCarried[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 571
;571:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 572
;572:	}
LABELV $313
line 568
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $312
line 574
;573:
;574:	if (g_gametype.integer == GT_HOLOCRON)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $315
line 575
;575:	{
line 576
;576:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $319
JUMPV
LABELV $318
line 578
;577:		while (i < NUM_FORCE_POWERS)
;578:		{
line 579
;579:			ent->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 580
;580:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 581
;581:		}
LABELV $319
line 577
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $318
line 583
;582:
;583:		if (HasSetSaberOnly())
ADDRLP4 12
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $321
line 584
;584:		{
line 585
;585:			if (ent->client->ps.fd.forcePowerLevel[FP_SABERATTACK] < FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 1
GEI4 $323
line 586
;586:			{
line 587
;587:				ent->client->ps.fd.forcePowerLevel[FP_SABERATTACK] = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
CNSTI4 1
ASGNI4
line 588
;588:			}
LABELV $323
line 589
;589:			if (ent->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] < FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 1
GEI4 $325
line 590
;590:			{
line 591
;591:				ent->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 1
ASGNI4
line 592
;592:			}
LABELV $325
line 593
;593:		}
LABELV $321
line 594
;594:	}
LABELV $315
line 596
;595:
;596:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $328
JUMPV
LABELV $327
line 599
;597:
;598:	while (i < NUM_FORCE_POWERS)
;599:	{
line 600
;600:		ent->client->ps.fd.forcePowerDebounce[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 601
;601:		ent->client->ps.fd.forcePowerDuration[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 603
;602:
;603:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 604
;604:	}
LABELV $328
line 598
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $327
line 606
;605:
;606:	ent->client->ps.fd.forcePowerRegenDebounceTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 940
ADDP4
CNSTI4 0
ASGNI4
line 607
;607:	if ( jk2gameplay == VERSION_1_02 ) ent->client->ps.fd.forceUsingAdded = 0;
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $330
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1088
ADDP4
CNSTI4 0
ASGNI4
LABELV $330
line 608
;608:	ent->client->ps.fd.forceJumpZStart = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1092
ADDP4
CNSTF4 0
ASGNF4
line 609
;609:	ent->client->ps.fd.forceJumpCharge = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
CNSTF4 0
ASGNF4
line 610
;610:	ent->client->ps.fd.forceJumpSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 0
ASGNI4
line 611
;611:	ent->client->ps.fd.forceGripDamageDebounceTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1112
ADDP4
CNSTI4 0
ASGNI4
line 612
;612:	ent->client->ps.fd.forceGripBeingGripped = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
CNSTF4 0
ASGNF4
line 613
;613:	ent->client->ps.fd.forceGripCripple = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
CNSTI4 0
ASGNI4
line 614
;614:	ent->client->ps.fd.forceGripUseTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1124
ADDP4
CNSTI4 0
ASGNI4
line 615
;615:	ent->client->ps.fd.forceGripSoundTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1128
ADDP4
CNSTF4 0
ASGNF4
line 616
;616:	ent->client->ps.fd.forceGripStarted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
CNSTF4 0
ASGNF4
line 617
;617:	ent->client->ps.fd.forceSpeedSmash = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1136
ADDP4
CNSTF4 0
ASGNF4
line 618
;618:	ent->client->ps.fd.forceSpeedDoDamage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1140
ADDP4
CNSTF4 0
ASGNF4
line 619
;619:	ent->client->ps.fd.forceSpeedHitIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1144
ADDP4
CNSTI4 0
ASGNI4
line 620
;620:	ent->client->ps.fd.forceHealTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1148
ADDP4
CNSTI4 0
ASGNI4
line 621
;621:	ent->client->ps.fd.forceHealAmount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1152
ADDP4
CNSTI4 0
ASGNI4
line 622
;622:	ent->client->ps.fd.forceRageRecoveryTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1172
ADDP4
CNSTI4 0
ASGNI4
line 623
;623:	ent->client->ps.fd.forceDrainEntNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1176
ADDP4
CNSTI4 1023
ASGNI4
line 624
;624:	ent->client->ps.fd.forceDrainTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1180
ADDP4
CNSTF4 0
ASGNF4
line 626
;625:
;626:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $333
JUMPV
LABELV $332
line 628
;627:	while (i < NUM_FORCE_POWERS)
;628:	{
line 629
;629:		if ((ent->client->ps.fd.forcePowersKnown & (1 << i)) &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $335
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $335
line 631
;630:			!ent->client->ps.fd.forcePowerLevel[i])
;631:		{ //err..
line 632
;632:			ent->client->ps.fd.forcePowersKnown &= ~(1 << i);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 633
;633:		}
LABELV $335
line 635
;634:
;635:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 636
;636:	}
LABELV $333
line 627
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $332
line 637
;637:}
LABELV $306
endproc WP_SpawnInitForcePowers 28 8
export ForcePowerUsableOn
proc ForcePowerUsableOn 112 16
line 640
;638:
;639:int ForcePowerUsableOn(gentity_t *attacker, gentity_t *other, forcePowers_t forcePower)
;640:{
line 641
;641:	int		nowTime = LEVELTIME(attacker->client);
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
EQU4 $342
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $342
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $344
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $345
JUMPV
LABELV $344
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $345
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $343
JUMPV
LABELV $342
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $343
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 642
;642:	if (other && other->client && other->client->ps.usingATST)
ADDRLP4 16
ADDRFP4 4
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
EQU4 $346
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
EQU4 $346
ADDRLP4 24
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $346
line 643
;643:	{
line 644
;644:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $337
JUMPV
LABELV $346
line 647
;645:	}
;646:
;647:	if (other && other->client && BG_HasYsalamiri(g_gametype.integer, &other->client->ps))
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $348
ADDRLP4 36
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $348
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $348
line 648
;648:	{
line 649
;649:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $337
JUMPV
LABELV $348
line 652
;650:	}
;651:
;652:	if (attacker && attacker->client && !BG_CanUseFPNow(g_gametype.integer, &attacker->client->ps, nowTime, forcePower))
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTU4 0
ASGNU4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $351
ADDRLP4 52
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $351
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $351
line 653
;653:	{
line 654
;654:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $337
JUMPV
LABELV $351
line 658
;655:	}
;656:
;657:	//Dueling fighters cannot use force powers on others, with the exception of force push when locked with each other
;658:	if (attacker && attacker->client && (attacker->client->ps.duelInProgress || (attacker->client->sess.raceMode && (forcePower != FP_LIGHTNING || other->client))))
ADDRLP4 60
ADDRFP4 0
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
EQU4 $354
ADDRLP4 68
CNSTI4 408
ASGNI4
ADDRLP4 72
ADDRLP4 60
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $354
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $357
ADDRLP4 72
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $354
ADDRFP4 8
INDIRI4
CNSTI4 7
NEI4 $357
ADDRFP4 4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $354
LABELV $357
line 659
;659:	{
line 660
;660:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $337
JUMPV
LABELV $354
line 663
;661:	}
;662:
;663:	if (other && other->client && (other->client->ps.duelInProgress || other->client->sess.raceMode || (attacker && attacker->client && other->client->sess.mode != attacker->client->sess.mode)))
ADDRLP4 80
ADDRFP4 4
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
EQU4 $358
ADDRLP4 88
CNSTI4 408
ASGNI4
ADDRLP4 92
ADDRLP4 80
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $358
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $361
ADDRLP4 92
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 96
INDIRI4
NEI4 $361
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $358
ADDRLP4 104
ADDRLP4 100
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $358
ADDRLP4 108
CNSTI4 43484
ASGNI4
ADDRLP4 92
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRI4
ADDRLP4 104
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRI4
EQI4 $358
LABELV $361
line 664
;664:	{
line 665
;665:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $337
JUMPV
LABELV $358
line 668
;666:	}
;667:
;668:	return 1;
CNSTI4 1
RETI4
LABELV $337
endproc ForcePowerUsableOn 112 16
export WP_ForcePowerAvailable
proc WP_ForcePowerAvailable 8 0
line 672
;669:}
;670:
;671:qboolean WP_ForcePowerAvailable( gentity_t *self, forcePowers_t forcePower )
;672:{
line 673
;673:	int	drain = forcePowerNeeded[self->client->ps.fd.forcePowerLevel[forcePower]][forcePower];
ADDRLP4 4
ADDRFP4 4
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
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
line 675
;674:
;675:	if (self->client->ps.fd.forcePowersActive & (1 << forcePower))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $363
line 676
;676:	{ //we're probably going to deactivate it..
line 677
;677:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $362
JUMPV
LABELV $363
line 680
;678:	}
;679:
;680:	if ( forcePower == FP_LEVITATION )
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $365
line 681
;681:	{
line 682
;682:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $362
JUMPV
LABELV $365
line 684
;683:	}
;684:	if ( !drain )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $367
line 685
;685:	{
line 686
;686:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $362
JUMPV
LABELV $367
line 688
;687:	}
;688:	if ( self->client->ps.fd.forcePower < drain )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $369
line 689
;689:	{
line 690
;690:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $362
JUMPV
LABELV $369
line 692
;691:	}
;692:	return qtrue;
CNSTI4 1
RETI4
LABELV $362
endproc WP_ForcePowerAvailable 8 0
export WP_ForcePowerInUse
proc WP_ForcePowerInUse 0 0
line 696
;693:}
;694:
;695:qboolean WP_ForcePowerInUse( gentity_t *self, forcePowers_t forcePower )
;696:{
line 697
;697:	if ( (self->client->ps.fd.forcePowersActive & ( 1 << forcePower )) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $372
line 698
;698:	{//already using this power
line 699
;699:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $371
JUMPV
LABELV $372
line 702
;700:	}
;701:
;702:	return qfalse;
CNSTI4 0
RETI4
LABELV $371
endproc WP_ForcePowerInUse 0 0
export WP_ForcePowerUsable
proc WP_ForcePowerUsable 56 16
line 706
;703:}
;704:
;705:qboolean WP_ForcePowerUsable( gentity_t *self, forcePowers_t forcePower )
;706:{
line 707
;707:	int		nowTime = LEVELTIME(self->client);
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
EQU4 $379
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $379
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $381
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $382
JUMPV
LABELV $381
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $382
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $380
JUMPV
LABELV $379
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $380
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 709
;708:
;709:	if (self->client && self->client->sess.raceMode && forcePower != FP_LEVITATION) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $383
ADDRLP4 16
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $383
ADDRFP4 4
INDIRI4
CNSTI4 1
EQI4 $383
line 710
;710:		if (self->client->sess.raceStyle.movementStyle == MV_FORCE && (forcePower == FP_RAGE || forcePower == FP_SPEED)) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
CNSTI4 10
NEI4 $385
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 8
EQI4 $387
ADDRLP4 20
INDIRI4
CNSTI4 2
NEI4 $385
LABELV $387
line 711
;711:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $374
JUMPV
LABELV $385
line 713
;712:		}
;713:		else if (forcePower == FP_LIGHTNING) { // allow us to "shoot open" doors
ADDRFP4 4
INDIRI4
CNSTI4 7
NEI4 $388
line 714
;714:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $374
JUMPV
LABELV $388
line 716
;715:		}
;716:		else {
line 717
;717:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $374
JUMPV
LABELV $383
line 721
;718:		}
;719:	}
;720:
;721:	if (BG_HasYsalamiri(g_gametype.integer, &self->client->ps))
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $390
line 722
;722:	{
line 723
;723:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $374
JUMPV
LABELV $390
line 726
;724:	}
;725:
;726:	if (self->health <= 0 || self->client->ps.stats[STAT_HEALTH] <= 0 ||
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $396
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $396
ADDRLP4 32
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 28
INDIRI4
EQI4 $393
LABELV $396
line 728
;727:		(self->client->ps.eFlags & EF_DEAD))
;728:	{
line 729
;729:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $374
JUMPV
LABELV $393
line 732
;730:	}
;731:
;732:	if (self->client->ps.pm_flags & PMF_FOLLOW)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $397
line 733
;733:	{ //specs can't use powers through people
line 734
;734:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $374
JUMPV
LABELV $397
line 736
;735:	}
;736:	if (self->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $399
line 737
;737:	{
line 738
;738:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $374
JUMPV
LABELV $399
line 741
;739:	}
;740:
;741:	if (!BG_CanUseFPNow(g_gametype.integer, &self->client->ps, nowTime, forcePower))
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $401
line 742
;742:	{
line 743
;743:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $374
JUMPV
LABELV $401
line 746
;744:	}
;745:
;746:	if ( !(self->client->ps.fd.forcePowersKnown & ( 1 << forcePower )) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $404
line 747
;747:	{//don't know this power
line 748
;748:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $374
JUMPV
LABELV $404
line 751
;749:	}
;750:	
;751:	if ( (self->client->ps.fd.forcePowersActive & ( 1 << forcePower )) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $406
line 752
;752:	{//already using this power
line 753
;753:		if (forcePower != FP_LEVITATION)
ADDRFP4 4
INDIRI4
CNSTI4 1
EQI4 $408
line 754
;754:		{
line 755
;755:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $374
JUMPV
LABELV $408
line 757
;756:		}
;757:	}
LABELV $406
line 759
;758:
;759:	if (forcePower == FP_LEVITATION && self->client->fjDidJump)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $410
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $410
line 760
;760:	{
line 761
;761:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $374
JUMPV
LABELV $410
line 764
;762:	}
;763:
;764:	if (!self->client->ps.fd.forcePowerLevel[forcePower])
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $412
line 765
;765:	{
line 766
;766:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $374
JUMPV
LABELV $412
line 769
;767:	}
;768:
;769:	if (g_debugMelee.integer && self->client->sess.raceMode && (self->client->sess.raceStyle.runFlags & RFL_CLIMBTECH))
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 g_debugMelee+12
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $414
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $414
ADDRLP4 44
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 256
BANDI4
ADDRLP4 40
INDIRI4
EQI4 $414
line 770
;770:	{
line 771
;771:		if ((self->client->ps.pm_flags & PMF_STUCK_TO_WALL))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $417
line 772
;772:		{//no offensive force powers when stuck to wall
line 773
;773:			switch (forcePower)
ADDRLP4 48
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 6
LTI4 $420
ADDRLP4 48
INDIRI4
CNSTI4 17
GTI4 $420
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $423-24
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $423
address $422
address $422
address $420
address $420
address $420
address $420
address $420
address $422
address $420
address $422
address $422
address $422
code
line 774
;774:			{
LABELV $422
line 783
;775:			case FP_GRIP:
;776:			case FP_LIGHTNING:
;777:			case FP_DRAIN:
;778:			//case FP_SABER_OFFENSE:
;779:			//case FP_SABER_DEFENSE:
;780:			case FP_SABERATTACK:
;781:			case FP_SABERDEFEND:
;782:			case FP_SABERTHROW:
;783:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $374
JUMPV
line 784
;784:				break;
line 786
;785:			default:
;786:				break;
LABELV $420
line 788
;787:			}
;788:		}
LABELV $417
line 789
;789:	}
LABELV $414
line 791
;790:
;791:	return WP_ForcePowerAvailable( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 WP_ForcePowerAvailable
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
RETI4
LABELV $374
endproc WP_ForcePowerUsable 56 16
export WP_AbsorbConversion
proc WP_AbsorbConversion 44 8
line 795
;792:}
;793:
;794:int WP_AbsorbConversion(gentity_t *attacked, int atdAbsLevel, gentity_t *attacker, int atPower, int atPowerLevel, int atForceSpent)
;795:{
line 796
;796:	int getLevel = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 797
;797:	int addTot = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 799
;798:	gentity_t *abSound;
;799:	int nowTime = LEVELTIME(attacked->client);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $430
ADDRLP4 24
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $430
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $432
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $433
JUMPV
LABELV $432
ADDRLP4 20
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $433
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $431
JUMPV
LABELV $430
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $431
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 801
;800:
;801:	if (atPower != FP_LIGHTNING &&
ADDRLP4 28
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 7
EQI4 $434
ADDRLP4 28
INDIRI4
CNSTI4 13
EQI4 $434
ADDRLP4 28
INDIRI4
CNSTI4 6
EQI4 $434
ADDRLP4 28
INDIRI4
CNSTI4 3
EQI4 $434
ADDRLP4 28
INDIRI4
CNSTI4 4
EQI4 $434
line 806
;802:		atPower != FP_DRAIN &&
;803:		atPower != FP_GRIP &&
;804:		atPower != FP_PUSH &&
;805:		atPower != FP_PULL)
;806:	{ //Only these powers can be absorbed
line 807
;807:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $425
JUMPV
LABELV $434
line 810
;808:	}
;809:
;810:	if (!atdAbsLevel)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $436
line 811
;811:	{ //looks like attacker doesn't have any absorb power
line 812
;812:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $425
JUMPV
LABELV $436
line 815
;813:	}
;814:
;815:	if (!(attacked->client->ps.fd.forcePowersActive & (1 << FP_ABSORB)))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $438
line 816
;816:	{ //absorb is not active
line 817
;817:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $425
JUMPV
LABELV $438
line 821
;818:	}
;819:
;820:	//Subtract absorb power level from the offensive force power
;821:	getLevel = atPowerLevel;
ADDRLP4 0
ADDRFP4 16
INDIRI4
ASGNI4
line 822
;822:	getLevel -= atdAbsLevel;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
SUBI4
ASGNI4
line 824
;823:
;824:	if (getLevel < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $440
line 825
;825:	{
line 826
;826:		getLevel = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 827
;827:	}
LABELV $440
line 830
;828:
;829:	//let the attacker absorb an amount of force used in this attack based on his level of absorb
;830:	addTot = (atForceSpent/3)*attacked->client->ps.fd.forcePowerLevel[FP_ABSORB];
ADDRLP4 4
ADDRFP4 20
INDIRI4
CNSTI4 3
DIVI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
MULI4
ASGNI4
line 832
;831:
;832:	if (addTot < 1 && atForceSpent >= 1)
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
GEI4 $442
ADDRFP4 20
INDIRI4
ADDRLP4 32
INDIRI4
LTI4 $442
line 833
;833:	{
line 834
;834:		addTot = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 835
;835:	}
LABELV $442
line 836
;836:	attacked->client->ps.fd.forcePower += addTot;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 837
;837:	if (attacked->client->ps.fd.forcePower > 100)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 100
LEI4 $444
line 838
;838:	{
line 839
;839:		attacked->client->ps.fd.forcePower = 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 100
ASGNI4
line 840
;840:	}
LABELV $444
line 843
;841:
;842:	//play sound indicating that attack was absorbed
;843:	if (attacked->client->forcePowerSoundDebounce < nowTime && jk2gameplay != VERSION_1_02)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43804
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $446
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $446
line 844
;844:	{
line 845
;845:		abSound = G_PreDefSound(attacked->client->ps.origin, PDSOUND_ABSORBHIT);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 40
ADDRGP4 G_PreDefSound
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 40
INDIRP4
ASGNP4
line 846
;846:		abSound->s.trickedentindex = attacked->s.number;
ADDRLP4 12
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 848
;847:
;848:		attacked->client->forcePowerSoundDebounce = nowTime + 400;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43804
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 400
ADDI4
ASGNI4
line 849
;849:	}
LABELV $446
line 851
;850:
;851:	if ( jk2gameplay == VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $448
line 852
;852:	{
line 853
;853:		G_PreDefSound(attacker->client->ps.origin, PDSOUND_ABSORBHIT);
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 854
;854:	}
LABELV $448
line 856
;855:
;856:	return getLevel;
ADDRLP4 0
INDIRI4
RETI4
LABELV $425
endproc WP_AbsorbConversion 44 8
export WP_ForcePowerRegenerate
proc WP_ForcePowerRegenerate 8 0
line 860
;857:}
;858:
;859:void WP_ForcePowerRegenerate( gentity_t *self, int overrideAmt )
;860:{ //called on a regular interval to regenerate force power.
line 861
;861:	if ( !self->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $451
line 862
;862:	{
line 863
;863:		return;
ADDRGP4 $450
JUMPV
LABELV $451
line 866
;864:	}
;865:
;866:	if ( overrideAmt )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $453
line 867
;867:	{ //custom regen amount
line 868
;868:		self->client->ps.fd.forcePower += overrideAmt;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 869
;869:	}
ADDRGP4 $454
JUMPV
LABELV $453
line 871
;870:	else
;871:	{ //otherwise, just 1
line 872
;872:		self->client->ps.fd.forcePower++;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 873
;873:	}
LABELV $454
line 875
;874:
;875:	if ( self->client->ps.fd.forcePower > self->client->ps.fd.forcePowerMax )
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 936
ADDP4
INDIRI4
LEI4 $455
line 876
;876:	{ //cap it off at the max (default 100)
line 877
;877:		self->client->ps.fd.forcePower = self->client->ps.fd.forcePowerMax;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 932
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 936
ADDP4
INDIRI4
ASGNI4
line 878
;878:	}
LABELV $455
line 879
;879:}
LABELV $450
endproc WP_ForcePowerRegenerate 8 0
export WP_ForcePowerStart
proc WP_ForcePowerStart 96 12
line 882
;880:
;881:void WP_ForcePowerStart( gentity_t *self, forcePowers_t forcePower, int overrideAmt )
;882:{ //activate the given force power
line 883
;883:	int	duration = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 884
;884:	qboolean hearable = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 885
;885:	float hearDist = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 886
;886:	int		nowTime = LEVELTIME(self->client);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $462
ADDRLP4 24
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $462
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $464
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $465
JUMPV
LABELV $464
ADDRLP4 20
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $465
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $463
JUMPV
LABELV $462
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $463
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 888
;887:
;888:	if (!WP_ForcePowerAvailable( self, forcePower ))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 WP_ForcePowerAvailable
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $466
line 889
;889:	{
line 890
;890:		return;
ADDRGP4 $457
JUMPV
LABELV $466
line 895
;891:	}
;892:
;893:	//hearable and hearDist are merely for the benefit of bots, and not related to if a sound is actually played.
;894:	//If duration is set, the force power will assume to be timer-based.
;895:	switch( (int)forcePower )
ADDRLP4 32
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $469
ADDRLP4 32
INDIRI4
CNSTI4 17
GTI4 $469
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $515
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $515
address $471
address $472
address $473
address $482
address $483
address $484
address $491
address $492
address $493
address $500
address $501
address $502
address $503
address $504
address $505
address $469
address $469
address $469
code
line 896
;896:	{
LABELV $471
line 898
;897:	case FP_HEAL:
;898:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 899
;899:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 900
;900:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 901
;901:		break;
ADDRGP4 $469
JUMPV
LABELV $472
line 903
;902:	case FP_LEVITATION:
;903:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 904
;904:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 905
;905:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 906
;906:		break;
ADDRGP4 $469
JUMPV
LABELV $473
line 908
;907:	case FP_SPEED:
;908:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 909
;909:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 910
;910:		if (self->client->ps.fd.forcePowerLevel[FP_SPEED] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
CNSTI4 1
NEI4 $474
line 911
;911:		{
line 912
;912:			duration = 10000;
ADDRLP4 4
CNSTI4 10000
ASGNI4
line 913
;913:		}
ADDRGP4 $475
JUMPV
LABELV $474
line 914
;914:		else if (self->client->ps.fd.forcePowerLevel[FP_SPEED] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
CNSTI4 2
NEI4 $476
line 915
;915:		{
line 916
;916:			duration = 15000;
ADDRLP4 4
CNSTI4 15000
ASGNI4
line 917
;917:		}
ADDRGP4 $477
JUMPV
LABELV $476
line 918
;918:		else if (self->client->ps.fd.forcePowerLevel[FP_SPEED] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
CNSTI4 3
NEI4 $469
line 919
;919:		{
line 920
;920:			duration = 20000;
ADDRLP4 4
CNSTI4 20000
ASGNI4
line 921
;921:		}
line 923
;922:		else //shouldn't get here
;923:		{
line 924
;924:			break;
LABELV $479
LABELV $477
LABELV $475
line 927
;925:		}
;926:
;927:		if (overrideAmt)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $480
line 928
;928:		{
line 929
;929:			duration = overrideAmt;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
line 930
;930:		}
LABELV $480
line 932
;931:
;932:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 933
;933:		break;
ADDRGP4 $469
JUMPV
LABELV $482
line 935
;934:	case FP_PUSH:
;935:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 936
;936:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 937
;937:		break;
ADDRGP4 $469
JUMPV
LABELV $483
line 939
;938:	case FP_PULL:
;939:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 940
;940:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 941
;941:		break;
ADDRGP4 $469
JUMPV
LABELV $484
line 943
;942:	case FP_TELEPATHY:
;943:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 944
;944:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 945
;945:		if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 1
NEI4 $485
line 946
;946:		{
line 947
;947:			duration = 20000;
ADDRLP4 4
CNSTI4 20000
ASGNI4
line 948
;948:		}
ADDRGP4 $486
JUMPV
LABELV $485
line 949
;949:		else if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 2
NEI4 $487
line 950
;950:		{
line 951
;951:			duration = 25000;
ADDRLP4 4
CNSTI4 25000
ASGNI4
line 952
;952:		}
ADDRGP4 $488
JUMPV
LABELV $487
line 953
;953:		else if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 3
NEI4 $469
line 954
;954:		{
line 955
;955:			duration = 30000;
ADDRLP4 4
CNSTI4 30000
ASGNI4
line 956
;956:		}
line 958
;957:		else //shouldn't get here
;958:		{
line 959
;959:			break;
LABELV $490
LABELV $488
LABELV $486
line 962
;960:		}
;961:
;962:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 963
;963:		break;
ADDRGP4 $469
JUMPV
LABELV $491
line 965
;964:	case FP_GRIP:
;965:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 966
;966:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 967
;967:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 968
;968:		self->client->ps.powerups[PW_DISINT_4] = nowTime + 60000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 60000
ADDI4
ASGNI4
line 969
;969:		break;
ADDRGP4 $469
JUMPV
LABELV $492
line 971
;970:	case FP_LIGHTNING:
;971:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 972
;972:		hearDist = 512;
ADDRLP4 8
CNSTF4 1140850688
ASGNF4
line 973
;973:		duration = overrideAmt;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
line 974
;974:		overrideAmt = 0;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 975
;975:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 976
;976:		self->client->ps.activeForcePass = self->client->ps.fd.forcePowerLevel[FP_LIGHTNING];
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
ASGNI4
line 977
;977:		break;
ADDRGP4 $469
JUMPV
LABELV $493
line 979
;978:	case FP_RAGE:
;979:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 980
;980:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 981
;981:		if (self->client->ps.fd.forcePowerLevel[FP_RAGE] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 1
NEI4 $494
line 982
;982:		{
line 983
;983:			duration = 8000;
ADDRLP4 4
CNSTI4 8000
ASGNI4
line 984
;984:		}
ADDRGP4 $495
JUMPV
LABELV $494
line 985
;985:		else if (self->client->ps.fd.forcePowerLevel[FP_RAGE] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 2
NEI4 $496
line 986
;986:		{
line 987
;987:			duration = 14000;
ADDRLP4 4
CNSTI4 14000
ASGNI4
line 988
;988:		}
ADDRGP4 $497
JUMPV
LABELV $496
line 989
;989:		else if (self->client->ps.fd.forcePowerLevel[FP_RAGE] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 3
NEI4 $469
line 990
;990:		{
line 991
;991:			duration = 20000;
ADDRLP4 4
CNSTI4 20000
ASGNI4
line 992
;992:		}
line 994
;993:		else //shouldn't get here
;994:		{
line 995
;995:			break;
LABELV $499
LABELV $497
LABELV $495
line 998
;996:		}
;997:
;998:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 999
;999:		break;
ADDRGP4 $469
JUMPV
LABELV $500
line 1001
;1000:	case FP_PROTECT:
;1001:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1002
;1002:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 1003
;1003:		duration = 20000;
ADDRLP4 4
CNSTI4 20000
ASGNI4
line 1004
;1004:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 1005
;1005:		break;
ADDRGP4 $469
JUMPV
LABELV $501
line 1007
;1006:	case FP_ABSORB:
;1007:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1008
;1008:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 1009
;1009:		duration = 20000;
ADDRLP4 4
CNSTI4 20000
ASGNI4
line 1010
;1010:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 1011
;1011:		break;
ADDRGP4 $469
JUMPV
LABELV $502
line 1013
;1012:	case FP_TEAM_HEAL:
;1013:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1014
;1014:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 1015
;1015:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 1016
;1016:		break;
ADDRGP4 $469
JUMPV
LABELV $503
line 1018
;1017:	case FP_TEAM_FORCE:
;1018:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1019
;1019:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 1020
;1020:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 1021
;1021:		break;
ADDRGP4 $469
JUMPV
LABELV $504
line 1023
;1022:	case FP_DRAIN:
;1023:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1024
;1024:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 1025
;1025:		duration = overrideAmt;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
line 1026
;1026:		overrideAmt = 0;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1027
;1027:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 1029
;1028:		//self->client->ps.activeForcePass = self->client->ps.fd.forcePowerLevel[FP_DRAIN];
;1029:		break;
ADDRGP4 $469
JUMPV
LABELV $505
line 1031
;1030:	case FP_SEE:
;1031:		hearable = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1032
;1032:		hearDist = 256;
ADDRLP4 8
CNSTF4 1132462080
ASGNF4
line 1033
;1033:		if (self->client->ps.fd.forcePowerLevel[FP_SEE] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 1
NEI4 $506
line 1034
;1034:		{
line 1035
;1035:			duration = 10000;
ADDRLP4 4
CNSTI4 10000
ASGNI4
line 1036
;1036:		}
ADDRGP4 $507
JUMPV
LABELV $506
line 1037
;1037:		else if (self->client->ps.fd.forcePowerLevel[FP_SEE] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 2
NEI4 $508
line 1038
;1038:		{
line 1039
;1039:			duration = 20000;
ADDRLP4 4
CNSTI4 20000
ASGNI4
line 1040
;1040:		}
ADDRGP4 $509
JUMPV
LABELV $508
line 1041
;1041:		else if (self->client->ps.fd.forcePowerLevel[FP_SEE] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 3
NEI4 $469
line 1042
;1042:		{
line 1043
;1043:			duration = 30000;
ADDRLP4 4
CNSTI4 30000
ASGNI4
line 1044
;1044:		}
line 1046
;1045:		else //shouldn't get here
;1046:		{
line 1047
;1047:			break;
LABELV $511
LABELV $509
LABELV $507
line 1050
;1048:		}
;1049:
;1050:		self->client->ps.fd.forcePowersActive |= ( 1 << forcePower );
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 1051
;1051:		break;
line 1053
;1052:	case FP_SABERATTACK:
;1053:		break;
line 1055
;1054:	case FP_SABERDEFEND:
;1055:		break;
line 1057
;1056:	case FP_SABERTHROW:
;1057:		break;
line 1059
;1058:	default:
;1059:		break;
LABELV $469
line 1062
;1060:	}
;1061:
;1062:	if ( duration )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $516
line 1063
;1063:	{
line 1064
;1064:		self->client->ps.fd.forcePowerDuration[forcePower] = nowTime + duration;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1065
;1065:	}
ADDRGP4 $517
JUMPV
LABELV $516
line 1067
;1066:	else
;1067:	{
line 1068
;1068:		self->client->ps.fd.forcePowerDuration[forcePower] = 0;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1069
;1069:	}
LABELV $517
line 1071
;1070:
;1071:	if (hearable)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $518
line 1072
;1072:	{
line 1073
;1073:		self->client->ps.otherSoundLen = hearDist;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1280
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 1074
;1074:		self->client->ps.otherSoundTime = nowTime + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1276
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1075
;1075:	}
LABELV $518
line 1077
;1076:	
;1077:	self->client->ps.fd.forcePowerDebounce[forcePower] = 0;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1079
;1078:
;1079:	if ((int)forcePower == FP_SPEED && overrideAmt)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $520
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $520
line 1080
;1080:	{
line 1081
;1081:		BG_ForcePowerDrain( &self->client->ps, forcePower, overrideAmt*0.025 );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTF4 1020054733
ADDRFP4 8
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1082
;1082:	}
ADDRGP4 $521
JUMPV
LABELV $520
line 1083
;1083:	else if ((int)forcePower != FP_GRIP && (int)forcePower != FP_DRAIN)
ADDRLP4 40
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 6
EQI4 $522
ADDRLP4 40
INDIRI4
CNSTI4 13
EQI4 $522
line 1084
;1084:	{ //grip and drain drain as damage is done
line 1085
;1085:		BG_ForcePowerDrain( &self->client->ps, forcePower, overrideAmt );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1086
;1086:	}
LABELV $522
LABELV $521
line 1087
;1087:}
LABELV $457
endproc WP_ForcePowerStart 96 12
export ForceHeal
proc ForceHeal 24 12
line 1090
;1088:
;1089:void ForceHeal( gentity_t *self )
;1090:{
line 1091
;1091:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $525
line 1092
;1092:	{
line 1093
;1093:		return;
ADDRGP4 $524
JUMPV
LABELV $525
line 1096
;1094:	}
;1095:
;1096:	if ( !WP_ForcePowerUsable( self, FP_HEAL ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $527
line 1097
;1097:	{
line 1098
;1098:		return;
ADDRGP4 $524
JUMPV
LABELV $527
line 1101
;1099:	}
;1100:
;1101:	if ( self->health >= self->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LTI4 $529
line 1102
;1102:	{
line 1103
;1103:		return;
ADDRGP4 $524
JUMPV
LABELV $529
line 1106
;1104:	}
;1105:
;1106:	if (self->client->ps.fd.forcePowerLevel[FP_HEAL] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 3
NEI4 $531
line 1107
;1107:	{
line 1108
;1108:		self->health += (jk2gameplay == VERSION_1_02 ? 50 : 25); //This was 50, but that angered the Balance God.
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $534
ADDRLP4 8
CNSTI4 50
ASGNI4
ADDRGP4 $535
JUMPV
LABELV $534
ADDRLP4 8
CNSTI4 25
ASGNI4
LABELV $535
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1110
;1109:		
;1110:		if (self->health > self->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $536
line 1111
;1111:		{
line 1112
;1112:			self->health = self->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1113
;1113:		}
LABELV $536
line 1114
;1114:		BG_ForcePowerDrain( &self->client->ps, FP_HEAL, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1115
;1115:	}
ADDRGP4 $532
JUMPV
LABELV $531
line 1116
;1116:	else if (self->client->ps.fd.forcePowerLevel[FP_HEAL] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 2
NEI4 $538
line 1117
;1117:	{
line 1118
;1118:		self->health += (jk2gameplay == VERSION_1_02 ? 25 : 10);
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $541
ADDRLP4 8
CNSTI4 25
ASGNI4
ADDRGP4 $542
JUMPV
LABELV $541
ADDRLP4 8
CNSTI4 10
ASGNI4
LABELV $542
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1120
;1119:		
;1120:		if (self->health > self->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $543
line 1121
;1121:		{
line 1122
;1122:			self->health = self->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1123
;1123:		}
LABELV $543
line 1124
;1124:		BG_ForcePowerDrain( &self->client->ps, FP_HEAL, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1125
;1125:	}
ADDRGP4 $539
JUMPV
LABELV $538
line 1127
;1126:	else
;1127:	{
line 1128
;1128:		self->health += (jk2gameplay == VERSION_1_02 ? 10 : 5);
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $546
ADDRLP4 8
CNSTI4 10
ASGNI4
ADDRGP4 $547
JUMPV
LABELV $546
ADDRLP4 8
CNSTI4 5
ASGNI4
LABELV $547
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1130
;1129:		
;1130:		if (self->health > self->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $548
line 1131
;1131:		{
line 1132
;1132:			self->health = self->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1133
;1133:		}
LABELV $548
line 1134
;1134:		BG_ForcePowerDrain( &self->client->ps, FP_HEAL, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1135
;1135:	}
LABELV $539
LABELV $532
line 1144
;1136:	/*
;1137:	else
;1138:	{
;1139:		WP_ForcePowerStart( self, FP_HEAL, 0 );
;1140:	}
;1141:	*/
;1142:	//NOTE: Decided to make all levels instant.
;1143:
;1144:	G_Sound( self, CHAN_ITEM, G_SoundIndex("sound/weapons/force/heal.wav") );
ADDRGP4 $550
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1145
;1145:}
LABELV $524
endproc ForceHeal 24 12
export WP_AddToClientBitflags
proc WP_AddToClientBitflags 4 0
line 1148
;1146:
;1147:void WP_AddToClientBitflags(gentity_t *ent, int entNum)
;1148:{
line 1149
;1149:	if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $552
line 1150
;1150:	{
line 1151
;1151:		return;
ADDRGP4 $551
JUMPV
LABELV $552
line 1154
;1152:	}
;1153:
;1154:	if (entNum > 47)
ADDRFP4 4
INDIRI4
CNSTI4 47
LEI4 $554
line 1155
;1155:	{
line 1156
;1156:		ent->s.trickedentindex4 |= (1 << (entNum-48));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 48
SUBI4
LSHI4
BORI4
ASGNI4
line 1157
;1157:	}
ADDRGP4 $555
JUMPV
LABELV $554
line 1158
;1158:	else if (entNum > 31)
ADDRFP4 4
INDIRI4
CNSTI4 31
LEI4 $556
line 1159
;1159:	{
line 1160
;1160:		ent->s.trickedentindex3 |= (1 << (entNum-32));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 32
SUBI4
LSHI4
BORI4
ASGNI4
line 1161
;1161:	}
ADDRGP4 $557
JUMPV
LABELV $556
line 1162
;1162:	else if (entNum > 15)
ADDRFP4 4
INDIRI4
CNSTI4 15
LEI4 $558
line 1163
;1163:	{
line 1164
;1164:		ent->s.trickedentindex2 |= (1 << (entNum-16));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 16
SUBI4
LSHI4
BORI4
ASGNI4
line 1165
;1165:	}
ADDRGP4 $559
JUMPV
LABELV $558
line 1167
;1166:	else
;1167:	{
line 1168
;1168:		ent->s.trickedentindex |= (1 << entNum);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 1169
;1169:	}
LABELV $559
LABELV $557
LABELV $555
line 1170
;1170:}
LABELV $551
endproc WP_AddToClientBitflags 4 0
export ForceTeamHeal
proc ForceTeamHeal 252 12
line 1173
;1171:
;1172:void ForceTeamHeal( gentity_t *self )
;1173:{
line 1174
;1174:	float radius = 256;
ADDRLP4 156
CNSTF4 1132462080
ASGNF4
line 1175
;1175:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1178
;1176:	gentity_t *ent;
;1177:	vec3_t a;
;1178:	int numpl = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 1180
;1179:	int pl[MAX_CLIENTS];
;1180:	int healthadd = 0;
ADDRLP4 160
CNSTI4 0
ASGNI4
line 1181
;1181:	gentity_t *te = NULL;
ADDRLP4 152
CNSTP4 0
ASGNP4
line 1183
;1182:
;1183:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $561
line 1184
;1184:	{
line 1185
;1185:		return;
ADDRGP4 $560
JUMPV
LABELV $561
line 1188
;1186:	}
;1187:
;1188:	if ( !WP_ForcePowerUsable( self, FP_TEAM_HEAL ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRLP4 164
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $563
line 1189
;1189:	{
line 1190
;1190:		return;
ADDRGP4 $560
JUMPV
LABELV $563
line 1193
;1191:	}
;1192:
;1193:	if (self->client->ps.fd.forcePowerLevel[FP_TEAM_HEAL] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
CNSTI4 2
NEI4 $565
line 1194
;1194:	{
line 1195
;1195:		radius *= 1.5;
ADDRLP4 156
CNSTF4 1069547520
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
line 1196
;1196:	}
LABELV $565
line 1197
;1197:	if (self->client->ps.fd.forcePowerLevel[FP_TEAM_HEAL] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 988
ADDP4
INDIRI4
CNSTI4 3
NEI4 $570
line 1198
;1198:	{
line 1199
;1199:		radius *= 2;
ADDRLP4 156
CNSTF4 1073741824
ADDRLP4 156
INDIRF4
MULF4
ASGNF4
line 1200
;1200:	}
ADDRGP4 $570
JUMPV
LABELV $569
line 1203
;1201:
;1202:	while (i < MAX_CLIENTS)
;1203:	{
line 1204
;1204:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1206
;1205:
;1206:		if (ent && ent->client && self != ent && OnSameTeam(self, ent) && ent->client->ps.stats[STAT_HEALTH] < ent->client->ps.stats[STAT_MAX_HEALTH] && ent->client->ps.stats[STAT_HEALTH] > 0 && ForcePowerUsableOn(self, ent, FP_TEAM_HEAL) &&
ADDRLP4 172
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 176
CNSTU4 0
ASGNU4
ADDRLP4 172
INDIRU4
ADDRLP4 176
INDIRU4
EQU4 $572
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 176
INDIRU4
EQU4 $572
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $572
ADDRLP4 180
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 188
CNSTI4 0
ASGNI4
ADDRLP4 184
INDIRI4
ADDRLP4 188
INDIRI4
EQI4 $572
ADDRLP4 196
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 200
ADDRLP4 196
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 200
INDIRI4
ADDRLP4 196
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
GEI4 $572
ADDRLP4 200
INDIRI4
ADDRLP4 188
INDIRI4
LEI4 $572
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRLP4 204
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $572
ADDRLP4 208
CNSTI4 408
ASGNI4
ADDRLP4 212
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
ARGP4
ADDRLP4 216
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
EQI4 $572
line 1208
;1207:			trap_InPVS(self->client->ps.origin, ent->client->ps.origin))
;1208:		{
line 1209
;1209:			VectorSubtract(self->client->ps.origin, ent->client->ps.origin, a);
ADDRLP4 220
CNSTI4 408
ASGNI4
ADDRLP4 224
ADDRFP4 0
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
ASGNP4
ADDRLP4 228
CNSTI4 20
ASGNI4
ADDRLP4 232
ADDRLP4 0
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
ASGNP4
ADDRLP4 136
ADDRLP4 224
INDIRP4
INDIRP4
ADDRLP4 228
INDIRI4
ADDP4
INDIRF4
ADDRLP4 232
INDIRP4
INDIRP4
ADDRLP4 228
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 236
CNSTI4 24
ASGNI4
ADDRLP4 136+4
ADDRLP4 224
INDIRP4
INDIRP4
ADDRLP4 236
INDIRI4
ADDP4
INDIRF4
ADDRLP4 232
INDIRP4
INDIRP4
ADDRLP4 236
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 240
CNSTI4 408
ASGNI4
ADDRLP4 244
CNSTI4 28
ASGNI4
ADDRLP4 136+8
ADDRFP4 0
INDIRP4
ADDRLP4 240
INDIRI4
ADDP4
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 240
INDIRI4
ADDP4
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1211
;1210:
;1211:			if (VectorLength(a) <= radius)
ADDRLP4 136
ARGP4
ADDRLP4 248
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 248
INDIRF4
ADDRLP4 156
INDIRF4
GTF4 $576
line 1212
;1212:			{
line 1213
;1213:				pl[numpl] = i;
ADDRLP4 148
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1214
;1214:				numpl++;
ADDRLP4 148
ADDRLP4 148
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1215
;1215:			}
LABELV $576
line 1216
;1216:		}
LABELV $572
line 1218
;1217:
;1218:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1219
;1219:	}
LABELV $570
line 1202
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $569
line 1221
;1220:
;1221:	if (numpl < 1)
ADDRLP4 148
INDIRI4
CNSTI4 1
GEI4 $578
line 1222
;1222:	{
line 1223
;1223:		return;
ADDRGP4 $560
JUMPV
LABELV $578
line 1226
;1224:	}
;1225:
;1226:	if (numpl == 1)
ADDRLP4 148
INDIRI4
CNSTI4 1
NEI4 $580
line 1227
;1227:	{
line 1228
;1228:		healthadd = 50;
ADDRLP4 160
CNSTI4 50
ASGNI4
line 1229
;1229:	}
ADDRGP4 $581
JUMPV
LABELV $580
line 1230
;1230:	else if (numpl == 2)
ADDRLP4 148
INDIRI4
CNSTI4 2
NEI4 $582
line 1231
;1231:	{
line 1232
;1232:		healthadd = 33;
ADDRLP4 160
CNSTI4 33
ASGNI4
line 1233
;1233:	}
ADDRGP4 $583
JUMPV
LABELV $582
line 1235
;1234:	else
;1235:	{
line 1236
;1236:		healthadd = 25;
ADDRLP4 160
CNSTI4 25
ASGNI4
line 1237
;1237:	}
LABELV $583
LABELV $581
line 1239
;1238:
;1239:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $585
JUMPV
LABELV $584
line 1242
;1240:
;1241:	while (i < numpl)
;1242:	{
line 1243
;1243:		if (g_entities[pl[i]].client->ps.stats[STAT_HEALTH] > 0 &&
ADDRLP4 168
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 168
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
LEI4 $587
ADDRLP4 168
INDIRI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
LEI4 $587
line 1245
;1244:			g_entities[pl[i]].health > 0)
;1245:		{
line 1246
;1246:			g_entities[pl[i]].client->ps.stats[STAT_HEALTH] += healthadd;
ADDRLP4 176
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
ADDRLP4 160
INDIRI4
ADDI4
ASGNI4
line 1247
;1247:			if (g_entities[pl[i]].client->ps.stats[STAT_HEALTH] > g_entities[pl[i]].client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 180
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 180
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 180
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $592
line 1248
;1248:			{
line 1249
;1249:				g_entities[pl[i]].client->ps.stats[STAT_HEALTH] = g_entities[pl[i]].client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 184
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 184
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 184
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1250
;1250:			}
LABELV $592
line 1252
;1251:
;1252:			g_entities[pl[i]].health = g_entities[pl[i]].client->ps.stats[STAT_HEALTH];
ADDRLP4 184
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 184
INDIRI4
ADDRGP4 g_entities+688
ADDP4
ADDRLP4 184
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 1255
;1253:
;1254:			//At this point we know we got one, so add him into the collective event client bitflag
;1255:			if (!te)
ADDRLP4 152
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $600
line 1256
;1256:			{
line 1257
;1257:				te = G_TempEntity( self->client->ps.origin, EV_TEAM_POWER);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 37
ARGI4
ADDRLP4 188
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 152
ADDRLP4 188
INDIRP4
ASGNP4
line 1258
;1258:				te->s.eventParm = 1; //eventParm 1 is heal, eventParm 2 is force regen
ADDRLP4 152
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1261
;1259:
;1260:				//since we had an extra check above, do the drain now because we got at least one guy
;1261:				BG_ForcePowerDrain( &self->client->ps, FP_TEAM_HEAL, forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_TEAM_HEAL]][FP_TEAM_HEAL] );
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 72
ADDRLP4 192
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
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1262
;1262:			}
LABELV $600
line 1264
;1263:
;1264:			WP_AddToClientBitflags(te, pl[i]);
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 WP_AddToClientBitflags
CALLV
pop
line 1266
;1265:			//Now cramming it all into one event.. doing this many g_sound events at once was a Bad Thing.
;1266:		}
LABELV $587
line 1267
;1267:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1268
;1268:	}
LABELV $585
line 1241
ADDRLP4 4
INDIRI4
ADDRLP4 148
INDIRI4
LTI4 $584
line 1269
;1269:}
LABELV $560
endproc ForceTeamHeal 252 12
export ForceTeamForceReplenish
proc ForceTeamForceReplenish 240 12
line 1272
;1270:
;1271:void ForceTeamForceReplenish( gentity_t *self )
;1272:{
line 1273
;1273:	float radius = 256;
ADDRLP4 160
CNSTF4 1132462080
ASGNF4
line 1274
;1274:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1277
;1275:	gentity_t *ent;
;1276:	vec3_t a;
;1277:	int numpl = 0;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 1279
;1278:	int pl[MAX_CLIENTS];
;1279:	int poweradd = 0;
ADDRLP4 156
CNSTI4 0
ASGNI4
line 1280
;1280:	gentity_t *te = NULL;
ADDRLP4 136
CNSTP4 0
ASGNP4
line 1282
;1281:
;1282:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $603
line 1283
;1283:	{
line 1284
;1284:		return;
ADDRGP4 $602
JUMPV
LABELV $603
line 1287
;1285:	}
;1286:
;1287:	if ( !WP_ForcePowerUsable( self, FP_TEAM_FORCE ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 164
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $605
line 1288
;1288:	{
line 1289
;1289:		return;
ADDRGP4 $602
JUMPV
LABELV $605
line 1292
;1290:	}
;1291:
;1292:	if (self->client->ps.fd.forcePowerLevel[FP_TEAM_FORCE] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 2
NEI4 $607
line 1293
;1293:	{
line 1294
;1294:		radius *= 1.5;
ADDRLP4 160
CNSTF4 1069547520
ADDRLP4 160
INDIRF4
MULF4
ASGNF4
line 1295
;1295:	}
LABELV $607
line 1296
;1296:	if (self->client->ps.fd.forcePowerLevel[FP_TEAM_FORCE] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 3
NEI4 $612
line 1297
;1297:	{
line 1298
;1298:		radius *= 2;
ADDRLP4 160
CNSTF4 1073741824
ADDRLP4 160
INDIRF4
MULF4
ASGNF4
line 1299
;1299:	}
ADDRGP4 $612
JUMPV
LABELV $611
line 1302
;1300:
;1301:	while (i < MAX_CLIENTS)
;1302:	{
line 1303
;1303:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1305
;1304:
;1305:		if (ent && ent->client && self != ent && OnSameTeam(self, ent) && ent->client->ps.fd.forcePower < 100 && ForcePowerUsableOn(self, ent, FP_TEAM_FORCE) &&
ADDRLP4 172
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 176
CNSTU4 0
ASGNU4
ADDRLP4 172
INDIRU4
ADDRLP4 176
INDIRU4
EQU4 $614
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 176
INDIRU4
EQU4 $614
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CVPU4 4
ADDRLP4 172
INDIRU4
EQU4 $614
ADDRLP4 180
INDIRP4
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
EQI4 $614
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 100
GEI4 $614
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 192
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $614
ADDRLP4 196
CNSTI4 408
ASGNI4
ADDRLP4 200
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 196
INDIRI4
ADDP4
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 196
INDIRI4
ADDP4
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
EQI4 $614
line 1307
;1306:			trap_InPVS(self->client->ps.origin, ent->client->ps.origin))
;1307:		{
line 1308
;1308:			VectorSubtract(self->client->ps.origin, ent->client->ps.origin, a);
ADDRLP4 208
CNSTI4 408
ASGNI4
ADDRLP4 212
ADDRFP4 0
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
ASGNP4
ADDRLP4 216
CNSTI4 20
ASGNI4
ADDRLP4 220
ADDRLP4 0
INDIRP4
ADDRLP4 208
INDIRI4
ADDP4
ASGNP4
ADDRLP4 140
ADDRLP4 212
INDIRP4
INDIRP4
ADDRLP4 216
INDIRI4
ADDP4
INDIRF4
ADDRLP4 220
INDIRP4
INDIRP4
ADDRLP4 216
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 224
CNSTI4 24
ASGNI4
ADDRLP4 140+4
ADDRLP4 212
INDIRP4
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
ADDRLP4 220
INDIRP4
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 228
CNSTI4 408
ASGNI4
ADDRLP4 232
CNSTI4 28
ASGNI4
ADDRLP4 140+8
ADDRFP4 0
INDIRP4
ADDRLP4 228
INDIRI4
ADDP4
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 228
INDIRI4
ADDP4
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1310
;1309:
;1310:			if (VectorLength(a) <= radius)
ADDRLP4 140
ARGP4
ADDRLP4 236
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 236
INDIRF4
ADDRLP4 160
INDIRF4
GTF4 $618
line 1311
;1311:			{
line 1312
;1312:				pl[numpl] = i;
ADDRLP4 152
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1313
;1313:				numpl++;
ADDRLP4 152
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1314
;1314:			}
LABELV $618
line 1315
;1315:		}
LABELV $614
line 1317
;1316:
;1317:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1318
;1318:	}
LABELV $612
line 1301
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $611
line 1320
;1319:
;1320:	if (numpl < 1)
ADDRLP4 152
INDIRI4
CNSTI4 1
GEI4 $620
line 1321
;1321:	{
line 1322
;1322:		return;
ADDRGP4 $602
JUMPV
LABELV $620
line 1325
;1323:	}
;1324:
;1325:	if (numpl == 1)
ADDRLP4 152
INDIRI4
CNSTI4 1
NEI4 $622
line 1326
;1326:	{
line 1327
;1327:		poweradd = 50;
ADDRLP4 156
CNSTI4 50
ASGNI4
line 1328
;1328:	}
ADDRGP4 $623
JUMPV
LABELV $622
line 1329
;1329:	else if (numpl == 2)
ADDRLP4 152
INDIRI4
CNSTI4 2
NEI4 $624
line 1330
;1330:	{
line 1331
;1331:		poweradd = 33;
ADDRLP4 156
CNSTI4 33
ASGNI4
line 1332
;1332:	}
ADDRGP4 $625
JUMPV
LABELV $624
line 1334
;1333:	else
;1334:	{
line 1335
;1335:		poweradd = 25;
ADDRLP4 156
CNSTI4 25
ASGNI4
line 1336
;1336:	}
LABELV $625
LABELV $623
line 1338
;1337:
;1338:	BG_ForcePowerDrain( &self->client->ps, FP_TEAM_FORCE, forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_TEAM_FORCE]][FP_TEAM_FORCE] );
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
ARGP4
CNSTI4 12
ARGI4
CNSTI4 72
ADDRLP4 168
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
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1340
;1339:
;1340:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $627
JUMPV
LABELV $626
line 1343
;1341:
;1342:	while (i < numpl)
;1343:	{
line 1344
;1344:		g_entities[pl[i]].client->ps.fd.forcePower += poweradd;
ADDRLP4 172
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRI4
ADDRLP4 156
INDIRI4
ADDI4
ASGNI4
line 1345
;1345:		if (g_entities[pl[i]].client->ps.fd.forcePower > 100)
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 100
LEI4 $630
line 1346
;1346:		{
line 1347
;1347:			g_entities[pl[i]].client->ps.fd.forcePower = 100;
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 100
ASGNI4
line 1348
;1348:		}
LABELV $630
line 1351
;1349:
;1350:		//At this point we know we got one, so add him into the collective event client bitflag
;1351:		if (!te)
ADDRLP4 136
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $634
line 1352
;1352:		{
line 1353
;1353:			te = G_TempEntity( self->client->ps.origin, EV_TEAM_POWER);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 37
ARGI4
ADDRLP4 176
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 136
ADDRLP4 176
INDIRP4
ASGNP4
line 1354
;1354:			te->s.eventParm = 2; //eventParm 1 is heal, eventParm 2 is force regen
ADDRLP4 136
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 2
ASGNI4
line 1355
;1355:		}
LABELV $634
line 1357
;1356:
;1357:		WP_AddToClientBitflags(te, pl[i]);
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 WP_AddToClientBitflags
CALLV
pop
line 1360
;1358:		//Now cramming it all into one event.. doing this many g_sound events at once was a Bad Thing.
;1359:		
;1360:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1361
;1361:	}
LABELV $627
line 1342
ADDRLP4 4
INDIRI4
ADDRLP4 152
INDIRI4
LTI4 $626
line 1362
;1362:}
LABELV $602
endproc ForceTeamForceReplenish 240 12
export ForceGrip
proc ForceGrip 1188 28
line 1365
;1363:
;1364:void ForceGrip( gentity_t *self )
;1365:{
line 1368
;1366:	trace_t tr;
;1367:	vec3_t tfrom, tto, fwd;
;1368:	int		nowTime = LEVELTIME(self->client);
ADDRLP4 1128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $641
ADDRLP4 1128
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $641
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $643
ADDRLP4 1124
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $644
JUMPV
LABELV $643
ADDRLP4 1124
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $644
ADDRLP4 1120
ADDRLP4 1124
INDIRI4
ASGNI4
ADDRGP4 $642
JUMPV
LABELV $641
ADDRLP4 1120
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $642
ADDRLP4 1116
ADDRLP4 1120
INDIRI4
ASGNI4
line 1370
;1369:
;1370:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $645
line 1371
;1371:	{
line 1372
;1372:		return;
ADDRGP4 $636
JUMPV
LABELV $645
line 1375
;1373:	}
;1374:
;1375:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $647
line 1376
;1376:	{
line 1377
;1377:		return;
ADDRGP4 $636
JUMPV
LABELV $647
line 1380
;1378:	}
;1379:
;1380:	if (self->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $649
line 1381
;1381:	{
line 1382
;1382:		return;
ADDRGP4 $636
JUMPV
LABELV $649
line 1385
;1383:	}
;1384:
;1385:	if (self->client->ps.fd.forceGripUseTime > nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1124
ADDP4
INDIRI4
ADDRLP4 1116
INDIRI4
LEI4 $651
line 1386
;1386:	{
line 1387
;1387:		return;
ADDRGP4 $636
JUMPV
LABELV $651
line 1390
;1388:	}
;1389:
;1390:	if ( !WP_ForcePowerUsable( self, FP_GRIP ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1132
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $653
line 1391
;1391:	{
line 1392
;1392:		return;
ADDRGP4 $636
JUMPV
LABELV $653
line 1395
;1393:	}
;1394:
;1395:	VectorCopy(self->client->ps.origin, tfrom);
ADDRLP4 1080
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1396
;1396:	tfrom[2] += self->client->ps.viewheight;
ADDRLP4 1080+8
ADDRLP4 1080+8
INDIRF4
ADDRFP4 0
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
line 1397
;1397:	AngleVectors(self->client->ps.viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1136
CNSTP4 0
ASGNP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1398
;1398:	tto[0] = tfrom[0] + fwd[0]*MAX_GRIP_DISTANCE;
ADDRLP4 1092
ADDRLP4 1080
INDIRF4
CNSTF4 1132462080
ADDRLP4 1104
INDIRF4
MULF4
ADDF4
ASGNF4
line 1399
;1399:	tto[1] = tfrom[1] + fwd[1]*MAX_GRIP_DISTANCE;
ADDRLP4 1092+4
ADDRLP4 1080+4
INDIRF4
CNSTF4 1132462080
ADDRLP4 1104+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1400
;1400:	tto[2] = tfrom[2] + fwd[2]*MAX_GRIP_DISTANCE;
ADDRLP4 1092+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1132462080
ADDRLP4 1104+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1402
;1401:
;1402:	JP_Trace(&tr, tfrom, NULL, NULL, tto, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1080
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
ADDRLP4 1092
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1404
;1403:
;1404:	if ( tr.fraction != 1.0 &&
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $662
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
EQI4 $662
ADDRLP4 1152
CNSTI4 2352
ASGNI4
ADDRLP4 1156
CNSTU4 0
ASGNU4
ADDRLP4 1152
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1156
INDIRU4
EQU4 $662
ADDRLP4 1160
CNSTI4 0
ASGNI4
ADDRLP4 1152
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
ADDRLP4 1160
INDIRI4
NEI4 $662
ADDRLP4 1152
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1156
INDIRU4
EQU4 $687
ADDRLP4 1152
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 1160
INDIRI4
EQI4 $687
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $689
ADDRLP4 1148
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $690
JUMPV
LABELV $689
ADDRLP4 1148
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $690
ADDRLP4 1144
ADDRLP4 1148
INDIRI4
ASGNI4
ADDRGP4 $688
JUMPV
LABELV $687
ADDRLP4 1144
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $688
ADDRLP4 1152
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
INDIRF4
ADDRLP4 1144
INDIRI4
CVIF4 4
GEF4 $662
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1164
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 1168
CNSTI4 0
ASGNI4
ADDRLP4 1164
INDIRI4
ADDRLP4 1168
INDIRI4
EQI4 $662
ADDRGP4 g_friendlyFire+12
INDIRI4
ADDRLP4 1168
INDIRI4
NEI4 $691
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1172
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
NEI4 $662
LABELV $691
line 1411
;1405:		tr.entityNum != ENTITYNUM_NONE &&
;1406:		g_entities[tr.entityNum].client &&
;1407:		!g_entities[tr.entityNum].client->ps.fd.forceGripCripple &&
;1408:		g_entities[tr.entityNum].client->ps.fd.forceGripBeingGripped < LEVELTIME(g_entities[tr.entityNum].client) &&
;1409:		ForcePowerUsableOn(self, &g_entities[tr.entityNum], FP_GRIP) &&
;1410:		(g_friendlyFire.integer || !OnSameTeam(self, &g_entities[tr.entityNum])) ) //don't grip someone who's still crippled
;1411:	{
line 1412
;1412:		self->client->ps.fd.forceGripEntityNum = tr.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 1413
;1413:		g_entities[tr.entityNum].client->ps.fd.forceGripStarted = LEVELTIME(g_entities[tr.entityNum].client);
ADDRLP4 1184
CNSTI4 2352
ASGNI4
ADDRLP4 1184
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $707
ADDRLP4 1184
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $707
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $709
ADDRLP4 1180
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $710
JUMPV
LABELV $709
ADDRLP4 1180
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $710
ADDRLP4 1176
ADDRLP4 1180
INDIRI4
ASGNI4
ADDRGP4 $708
JUMPV
LABELV $707
ADDRLP4 1176
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $708
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
ADDRLP4 1176
INDIRI4
CVIF4 4
ASGNF4
line 1414
;1414:		self->client->ps.fd.forceGripDamageDebounceTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1112
ADDP4
CNSTI4 0
ASGNI4
line 1416
;1415:
;1416:		self->client->ps.forceHandExtend = HANDEXTEND_FORCEGRIP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 3
ASGNI4
line 1417
;1417:		self->client->ps.forceHandExtendTime = nowTime + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 1116
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1418
;1418:	}
ADDRGP4 $663
JUMPV
LABELV $662
line 1420
;1419:	else
;1420:	{
line 1421
;1421:		self->client->ps.fd.forceGripEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
CNSTI4 1023
ASGNI4
line 1422
;1422:		return;
LABELV $663
line 1424
;1423:	}
;1424:}
LABELV $636
endproc ForceGrip 1188 28
export ForceSpeed
proc ForceSpeed 28 12
line 1427
;1425:
;1426:void ForceSpeed( gentity_t *self, int forceDuration )
;1427:{
line 1428
;1428:	int nowTime = LEVELTIME(self->client);
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
EQU4 $716
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $716
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $718
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $719
JUMPV
LABELV $718
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $719
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $717
JUMPV
LABELV $716
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $717
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1429
;1429:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $720
line 1430
;1430:	{
line 1431
;1431:		return;
ADDRGP4 $711
JUMPV
LABELV $720
line 1434
;1432:	}
;1433:
;1434:	if (self->client->ps.forceAllowDeactivateTime < nowTime &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $722
ADDRLP4 16
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $722
line 1436
;1435:		(self->client->ps.fd.forcePowersActive & (1 << FP_SPEED)) )
;1436:	{
line 1437
;1437:		WP_ForcePowerStop( self, FP_SPEED );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1438
;1438:		return;
ADDRGP4 $711
JUMPV
LABELV $722
line 1441
;1439:	}
;1440:
;1441:	if ( !WP_ForcePowerUsable( self, FP_SPEED ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $724
line 1442
;1442:	{
line 1443
;1443:		return;
ADDRGP4 $711
JUMPV
LABELV $724
line 1446
;1444:	}
;1445:
;1446:	self->client->ps.forceAllowDeactivateTime = nowTime + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1448
;1447:
;1448:	WP_ForcePowerStart( self, FP_SPEED, forceDuration );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1449
;1449:	G_Sound( self, CHAN_BODY, G_SoundIndex("sound/weapons/force/speed.wav") );
ADDRGP4 $726
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1450
;1450:	G_Sound( self, TRACK_CHANNEL_2, speedLoopSound );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 52
ARGI4
ADDRGP4 speedLoopSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1451
;1451:	self->client->ps.fd.forceSpeedSmash = 2; //initial boost (will automax to whatever is appropriate for force level)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1136
ADDP4
CNSTF4 1073741824
ASGNF4
line 1452
;1452:	self->client->ps.fd.forceSpeedDoDamage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1140
ADDP4
CNSTF4 0
ASGNF4
line 1453
;1453:}
LABELV $711
endproc ForceSpeed 28 12
export ForceSeeing
proc ForceSeeing 28 12
line 1456
;1454:
;1455:void ForceSeeing( gentity_t *self )
;1456:{
line 1457
;1457:	int nowTime = LEVELTIME(self->client);
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
EQU4 $732
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $732
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $734
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $735
JUMPV
LABELV $734
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $735
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $733
JUMPV
LABELV $732
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $733
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1458
;1458:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $736
line 1459
;1459:	{
line 1460
;1460:		return;
ADDRGP4 $727
JUMPV
LABELV $736
line 1463
;1461:	}
;1462:
;1463:	if (self->client->ps.forceAllowDeactivateTime < nowTime &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $738
ADDRLP4 16
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $738
line 1465
;1464:		(self->client->ps.fd.forcePowersActive & (1 << FP_SEE)) )
;1465:	{
line 1466
;1466:		WP_ForcePowerStop( self, FP_SEE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1467
;1467:		return;
ADDRGP4 $727
JUMPV
LABELV $738
line 1470
;1468:	}
;1469:
;1470:	if ( !WP_ForcePowerUsable( self, FP_SEE ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
ADDRLP4 20
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $740
line 1471
;1471:	{
line 1472
;1472:		return;
ADDRGP4 $727
JUMPV
LABELV $740
line 1475
;1473:	}
;1474:
;1475:	self->client->ps.forceAllowDeactivateTime = nowTime + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1477
;1476:
;1477:	WP_ForcePowerStart( self, FP_SEE, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1479
;1478:
;1479:	G_Sound( self, CHAN_AUTO, G_SoundIndex("sound/weapons/force/see.wav") );
ADDRGP4 $742
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1480
;1480:	G_Sound( self, TRACK_CHANNEL_5, seeLoopSound );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 55
ARGI4
ADDRGP4 seeLoopSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1481
;1481:}
LABELV $727
endproc ForceSeeing 28 12
export ForceProtect
proc ForceProtect 24 12
line 1484
;1482:
;1483:void ForceProtect( gentity_t *self )
;1484:{
line 1485
;1485:	int nowTime = LEVELTIME(self->client);
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
EQU4 $748
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $748
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $750
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $751
JUMPV
LABELV $750
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $751
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $749
JUMPV
LABELV $748
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $749
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1486
;1486:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $752
line 1487
;1487:	{
line 1488
;1488:		return;
ADDRGP4 $743
JUMPV
LABELV $752
line 1491
;1489:	}
;1490:
;1491:	if (self->client->ps.forceAllowDeactivateTime < nowTime &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $754
ADDRLP4 16
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $754
line 1493
;1492:		(self->client->ps.fd.forcePowersActive & (1 << FP_PROTECT)) )
;1493:	{
line 1494
;1494:		WP_ForcePowerStop( self, FP_PROTECT );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1495
;1495:		return;
ADDRGP4 $743
JUMPV
LABELV $754
line 1498
;1496:	}
;1497:
;1498:	if ( !WP_ForcePowerUsable( self, FP_PROTECT ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRLP4 20
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $756
line 1499
;1499:	{
line 1500
;1500:		return;
ADDRGP4 $743
JUMPV
LABELV $756
line 1504
;1501:	}
;1502:
;1503:	// Make sure to turn off Force Rage and Force Absorb.
;1504:	if (self->client->ps.fd.forcePowersActive & (1 << FP_RAGE) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $758
line 1505
;1505:	{
line 1506
;1506:		WP_ForcePowerStop( self, FP_RAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1507
;1507:	}
LABELV $758
line 1508
;1508:	if (self->client->ps.fd.forcePowersActive & (1 << FP_ABSORB) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $760
line 1509
;1509:	{
line 1510
;1510:		WP_ForcePowerStop( self, FP_ABSORB );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1511
;1511:	}
LABELV $760
line 1513
;1512:
;1513:	self->client->ps.forceAllowDeactivateTime = nowTime + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1515
;1514:
;1515:	WP_ForcePowerStart( self, FP_PROTECT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1516
;1516:	G_PreDefSound(self->client->ps.origin, PDSOUND_PROTECT);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 1517
;1517:	G_Sound( self, TRACK_CHANNEL_3, protectLoopSound );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRGP4 protectLoopSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1518
;1518:}
LABELV $743
endproc ForceProtect 24 12
export ForceAbsorb
proc ForceAbsorb 24 12
line 1521
;1519:
;1520:void ForceAbsorb( gentity_t *self )
;1521:{
line 1522
;1522:	int nowTime = LEVELTIME(self->client);
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
EQU4 $767
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $767
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $769
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $770
JUMPV
LABELV $769
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $770
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $768
JUMPV
LABELV $767
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $768
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1523
;1523:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $771
line 1524
;1524:	{
line 1525
;1525:		return;
ADDRGP4 $762
JUMPV
LABELV $771
line 1528
;1526:	}
;1527:
;1528:	if (self->client->ps.forceAllowDeactivateTime < nowTime &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $773
ADDRLP4 16
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $773
line 1530
;1529:		(self->client->ps.fd.forcePowersActive & (1 << FP_ABSORB)) )
;1530:	{
line 1531
;1531:		WP_ForcePowerStop( self, FP_ABSORB );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1532
;1532:		return;
ADDRGP4 $762
JUMPV
LABELV $773
line 1535
;1533:	}
;1534:
;1535:	if ( !WP_ForcePowerUsable( self, FP_ABSORB ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 20
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $775
line 1536
;1536:	{
line 1537
;1537:		return;
ADDRGP4 $762
JUMPV
LABELV $775
line 1541
;1538:	}
;1539:
;1540:	// Make sure to turn off Force Rage and Force Protection.
;1541:	if (self->client->ps.fd.forcePowersActive & (1 << FP_RAGE) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $777
line 1542
;1542:	{
line 1543
;1543:		WP_ForcePowerStop( self, FP_RAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1544
;1544:	}
LABELV $777
line 1545
;1545:	if (self->client->ps.fd.forcePowersActive & (1 << FP_PROTECT) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $779
line 1546
;1546:	{
line 1547
;1547:		WP_ForcePowerStop( self, FP_PROTECT );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1548
;1548:	}
LABELV $779
line 1550
;1549:
;1550:	self->client->ps.forceAllowDeactivateTime = nowTime + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1552
;1551:
;1552:	WP_ForcePowerStart( self, FP_ABSORB, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1553
;1553:	G_PreDefSound(self->client->ps.origin, PDSOUND_ABSORB);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 1554
;1554:	G_Sound( self, TRACK_CHANNEL_3, absorbLoopSound );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRGP4 absorbLoopSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1555
;1555:}
LABELV $762
endproc ForceAbsorb 24 12
export ForceRage
proc ForceRage 28 12
line 1558
;1556:
;1557:void ForceRage( gentity_t *self )
;1558:{
line 1559
;1559:	int nowTime = LEVELTIME(self->client);
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
EQU4 $786
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $786
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $788
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $789
JUMPV
LABELV $788
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $789
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $787
JUMPV
LABELV $786
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $787
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1560
;1560:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $790
line 1561
;1561:	{
line 1562
;1562:		return;
ADDRGP4 $781
JUMPV
LABELV $790
line 1565
;1563:	}
;1564:
;1565:	if (self->client->ps.forceAllowDeactivateTime < nowTime &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $792
ADDRLP4 16
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $792
line 1567
;1566:		(self->client->ps.fd.forcePowersActive & (1 << FP_RAGE)) )
;1567:	{
line 1568
;1568:		WP_ForcePowerStop( self, FP_RAGE );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1569
;1569:		return;
ADDRGP4 $781
JUMPV
LABELV $792
line 1572
;1570:	}
;1571:
;1572:	if ( !WP_ForcePowerUsable( self, FP_RAGE ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 20
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $794
line 1573
;1573:	{
line 1574
;1574:		return;
ADDRGP4 $781
JUMPV
LABELV $794
line 1577
;1575:	}
;1576:
;1577:	if (self->client->ps.fd.forceRageRecoveryTime >= nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1172
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $796
line 1578
;1578:	{
line 1579
;1579:		return;
ADDRGP4 $781
JUMPV
LABELV $796
line 1582
;1580:	}
;1581:
;1582:	if (self->health < 10)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 10
GEI4 $798
line 1583
;1583:	{
line 1584
;1584:		return;
ADDRGP4 $781
JUMPV
LABELV $798
line 1588
;1585:	}
;1586:
;1587:	// Make sure to turn off Force Protection and Force Absorb.
;1588:	if (self->client->ps.fd.forcePowersActive & (1 << FP_PROTECT) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $800
line 1589
;1589:	{
line 1590
;1590:		WP_ForcePowerStop( self, FP_PROTECT );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1591
;1591:	}
LABELV $800
line 1592
;1592:	if (self->client->ps.fd.forcePowersActive & (1 << FP_ABSORB) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $802
line 1593
;1593:	{
line 1594
;1594:		WP_ForcePowerStop( self, FP_ABSORB );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 1595
;1595:	}
LABELV $802
line 1597
;1596:
;1597:	self->client->ps.forceAllowDeactivateTime = nowTime + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 1599
;1598:
;1599:	WP_ForcePowerStart( self, FP_RAGE, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1601
;1600:
;1601:	G_Sound( self, TRACK_CHANNEL_4, G_SoundIndex("sound/weapons/force/rage.wav") );
ADDRGP4 $804
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 54
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1602
;1602:	G_Sound( self, TRACK_CHANNEL_3, rageLoopSound );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 53
ARGI4
ADDRGP4 rageLoopSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1603
;1603:}
LABELV $781
endproc ForceRage 28 12
export ForceLightning
proc ForceLightning 28 12
line 1606
;1604:
;1605:void ForceLightning( gentity_t *self )
;1606:{
line 1607
;1607:	int		nowTime = LEVELTIME(self->client);
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
EQU4 $810
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $810
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $812
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $813
JUMPV
LABELV $812
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $813
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $811
JUMPV
LABELV $810
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $811
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1608
;1608:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $814
line 1609
;1609:	{
line 1610
;1610:		return;
ADDRGP4 $805
JUMPV
LABELV $814
line 1612
;1611:	}
;1612:	if ( self->client->ps.fd.forcePower < 25 || !WP_ForcePowerUsable( self, FP_LIGHTNING ) )
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 25
LTI4 $818
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 20
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $816
LABELV $818
line 1613
;1613:	{
line 1614
;1614:		return;
ADDRGP4 $805
JUMPV
LABELV $816
line 1616
;1615:	}
;1616:	if ( self->client->ps.fd.forcePowerDebounce[FP_LIGHTNING] > nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 800
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $819
line 1617
;1617:	{//stops it while using it and also after using it, up to 3 second delay
line 1618
;1618:		return;
ADDRGP4 $805
JUMPV
LABELV $819
line 1621
;1619:	}
;1620:
;1621:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $821
line 1622
;1622:	{
line 1623
;1623:		return;
ADDRGP4 $805
JUMPV
LABELV $821
line 1626
;1624:	}
;1625:
;1626:	if (self->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $823
line 1627
;1627:	{
line 1628
;1628:		return;
ADDRGP4 $805
JUMPV
LABELV $823
line 1633
;1629:	}
;1630:
;1631:	//Shoot lightning from hand
;1632:	//using grip anim now, to extend the burst time
;1633:	self->client->ps.forceHandExtend = HANDEXTEND_FORCEGRIP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 3
ASGNI4
line 1634
;1634:	self->client->ps.forceHandExtendTime = nowTime + 20000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 20000
ADDI4
ASGNI4
line 1636
;1635:
;1636:	G_Sound( self, CHAN_BODY, G_SoundIndex("sound/weapons/force/lightning.wav") );
ADDRGP4 $825
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1638
;1637:	
;1638:	WP_ForcePowerStart( self, FP_LIGHTNING, 500 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
CNSTI4 500
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1639
;1639:}
LABELV $805
endproc ForceLightning 28 12
export ForceLightningDamage
proc ForceLightningDamage 112 32
line 1642
;1640:
;1641:void ForceLightningDamage( gentity_t *self, gentity_t *traceEnt, vec3_t dir, vec3_t impactPoint )
;1642:{
line 1643
;1643:	int nowTime = LEVELTIME(self->client);
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
EQU4 $831
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $831
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $833
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $834
JUMPV
LABELV $833
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $834
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $832
JUMPV
LABELV $831
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $832
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1644
;1644:	self->client->dangerTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43800
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1645
;1645:	self->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 1646
;1646:	self->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43588
ADDP4
CNSTI4 0
ASGNI4
line 1648
;1647:
;1648:	if ( traceEnt && traceEnt->takedamage )
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $835
ADDRLP4 20
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $835
line 1649
;1649:	{
line 1650
;1650:		if (!traceEnt->client && traceEnt->s.eType == ET_GRAPPLE && !self->client->sess.raceMode)
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 408
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $837
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $837
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $837
line 1651
;1651:		{ //g2animent
line 1652
;1652:			if (traceEnt->s.genericenemyindex < level.time)
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $839
line 1653
;1653:			{
line 1654
;1654:				traceEnt->s.genericenemyindex = level.time + 2000;
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1655
;1655:			}
LABELV $839
line 1656
;1656:		}
LABELV $837
line 1657
;1657:		if ( traceEnt->client && !self->client->sess.raceMode && self->client->sess.mode == traceEnt->client->sess.mode )
ADDRLP4 32
CNSTI4 408
ASGNI4
ADDRLP4 36
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $843
ADDRLP4 40
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $843
ADDRLP4 44
CNSTI4 43484
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
NEI4 $843
line 1658
;1658:		{//an enemy or object
line 1659
;1659:			if (ForcePowerUsableOn(self, traceEnt, FP_LIGHTNING))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 48
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $844
line 1660
;1660:			{
line 1661
;1661:				int	dmg = (traceEnt->client && traceEnt->client->sess.raceMode) ? 1: Q_irand(1,2, self->client && self->client->sess.raceMode,1); //Q_irand( 1, 3 );
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $849
ADDRLP4 68
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $849
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRGP4 $850
JUMPV
LABELV $849
CNSTI4 1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $851
ADDRLP4 72
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $851
ADDRLP4 64
CNSTI4 1
ASGNI4
ADDRGP4 $852
JUMPV
LABELV $851
ADDRLP4 64
CNSTI4 0
ASGNI4
LABELV $852
ADDRLP4 64
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 76
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 76
INDIRI4
ASGNI4
LABELV $850
ADDRLP4 56
ADDRLP4 60
INDIRI4
ASGNI4
line 1663
;1662:				
;1663:				int modPowerLevel = -1;
ADDRLP4 52
CNSTI4 -1
ASGNI4
line 1665
;1664:				
;1665:				if (traceEnt->client)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $853
line 1666
;1666:				{
line 1667
;1667:					modPowerLevel = WP_AbsorbConversion(traceEnt, traceEnt->client->ps.fd.forcePowerLevel[FP_ABSORB], self, FP_LIGHTNING, self->client->ps.fd.forcePowerLevel[FP_LIGHTNING], 1);
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 84
CNSTI4 408
ASGNI4
ADDRLP4 80
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 88
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 92
ADDRGP4 WP_AbsorbConversion
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 92
INDIRI4
ASGNI4
line 1668
;1668:				}
LABELV $853
line 1670
;1669:
;1670:				if (modPowerLevel != -1)
ADDRLP4 52
INDIRI4
CNSTI4 -1
EQI4 $855
line 1671
;1671:				{
line 1672
;1672:					if (!modPowerLevel)
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $857
line 1673
;1673:					{
line 1674
;1674:						dmg = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 1675
;1675:					}
ADDRGP4 $858
JUMPV
LABELV $857
line 1676
;1676:					else if (modPowerLevel == 1)
ADDRLP4 52
INDIRI4
CNSTI4 1
NEI4 $859
line 1677
;1677:					{
line 1678
;1678:						dmg = 1;
ADDRLP4 56
CNSTI4 1
ASGNI4
line 1679
;1679:					}
ADDRGP4 $860
JUMPV
LABELV $859
line 1680
;1680:					else if (modPowerLevel == 2)
ADDRLP4 52
INDIRI4
CNSTI4 2
NEI4 $861
line 1681
;1681:					{
line 1682
;1682:						dmg = 1;
ADDRLP4 56
CNSTI4 1
ASGNI4
line 1683
;1683:					}
LABELV $861
LABELV $860
LABELV $858
line 1684
;1684:				}
LABELV $855
line 1686
;1685:
;1686:				if (dmg)
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $863
line 1687
;1687:				{
line 1689
;1688:					//rww - Shields can now absorb lightning too.
;1689:					G_Damage( traceEnt, self, self, dir, impactPoint, dmg, 0, MOD_FORCE_DARK );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1690
;1690:				}
LABELV $863
line 1691
;1691:				if ( traceEnt->client )
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $844
line 1692
;1692:				{
line 1693
;1693:					if ( !Q_irand( 0, 2 + gRandomUnlockAdd, qfalse, 1 ) )
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 84
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $867
line 1694
;1694:					{
line 1695
;1695:						G_Sound( traceEnt, CHAN_BODY, G_SoundIndex( "sound/weapons/force/lightninghit.wav" ) );
ADDRGP4 $869
ARGP4
ADDRLP4 88
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1696
;1696:					}
LABELV $867
line 1698
;1697:
;1698:					if (traceEnt->client->ps.electrifyTime < (LEVELTIME(traceEnt->client) + 400))
ADDRLP4 96
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $876
ADDRLP4 96
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $876
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $878
ADDRLP4 92
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $879
JUMPV
LABELV $878
ADDRLP4 92
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $879
ADDRLP4 88
ADDRLP4 92
INDIRI4
ASGNI4
ADDRGP4 $877
JUMPV
LABELV $876
ADDRLP4 88
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $877
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
CNSTI4 400
ADDI4
GEI4 $844
line 1699
;1699:					{ //only update every 400ms to reduce bandwidth usage (as it is passing a 32-bit time value)
line 1700
;1700:						traceEnt->client->ps.electrifyTime = LEVELTIME(traceEnt->client) + 800;
ADDRLP4 108
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $884
ADDRLP4 108
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $884
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $886
ADDRLP4 104
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $887
JUMPV
LABELV $886
ADDRLP4 104
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $887
ADDRLP4 100
ADDRLP4 104
INDIRI4
ASGNI4
ADDRGP4 $885
JUMPV
LABELV $884
ADDRLP4 100
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $885
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRLP4 100
INDIRI4
CNSTI4 800
ADDI4
ASGNI4
line 1701
;1701:					}
line 1702
;1702:				}
line 1703
;1703:			}
line 1704
;1704:		}
ADDRGP4 $844
JUMPV
LABELV $843
line 1705
;1705:		else if(self->client->sess.raceMode && traceEnt->damageindefrag){ // allow us to open doors that open when shot via force lightning
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $888
ADDRFP4 4
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $888
line 1706
;1706:			if (ForcePowerUsableOn(self, traceEnt, FP_LIGHTNING))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 52
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $890
line 1707
;1707:			{
line 1708
;1708:				G_Damage(traceEnt, self, self, dir, impactPoint, 1, DAMAGE_IN_RACEMODE, MOD_FORCE_DARK);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 4096
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1709
;1709:			}
LABELV $890
line 1710
;1710:		}
LABELV $888
LABELV $844
line 1711
;1711:	}
LABELV $835
line 1712
;1712:}
LABELV $826
endproc ForceLightningDamage 112 32
export ForceShootLightning
proc ForceShootLightning 9464 28
line 1715
;1713:
;1714:void ForceShootLightning( gentity_t *self )
;1715:{
line 1720
;1716:	trace_t	tr;
;1717:	vec3_t	end, forward;
;1718:	gentity_t	*traceEnt;
;1719:
;1720:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $893
line 1721
;1721:	{
line 1722
;1722:		return;
ADDRGP4 $892
JUMPV
LABELV $893
line 1724
;1723:	}
;1724:	AngleVectors( self->client->ps.viewangles, forward, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1108
CNSTP4 0
ASGNP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1725
;1725:	VectorNormalize( forward );
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1727
;1726:
;1727:	if ( self->client->ps.fd.forcePowerLevel[FP_LIGHTNING] > FORCE_LEVEL_2 && !self->client->sess.raceMode )
ADDRLP4 1112
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 2
LEI4 $895
ADDRLP4 1112
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $895
line 1728
;1728:	{//arc
line 1730
;1729:		vec3_t	center, mins, maxs, dir, ent_org, size, v;
;1730:		float	radius = FORCE_LIGHTNING_RADIUS, dot, dist;
ADDRLP4 1180
CNSTF4 1133903872
ASGNF4
line 1735
;1731:		gentity_t	*entityList[MAX_GENTITIES];
;1732:		int			iEntityList[MAX_GENTITIES];
;1733:		int		e, numListedEntities, i;
;1734:
;1735:		VectorCopy( self->client->ps.origin, center );
ADDRLP4 1120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1736
;1736:		for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 1116
CNSTI4 0
ASGNI4
LABELV $897
line 1737
;1737:		{
line 1738
;1738:			mins[i] = center[i] - radius;
ADDRLP4 9416
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9416
INDIRI4
ADDRLP4 5292
ADDP4
ADDRLP4 9416
INDIRI4
ADDRLP4 1120
ADDP4
INDIRF4
ADDRLP4 1180
INDIRF4
SUBF4
ASGNF4
line 1739
;1739:			maxs[i] = center[i] + radius;
ADDRLP4 9420
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9420
INDIRI4
ADDRLP4 5304
ADDP4
ADDRLP4 9420
INDIRI4
ADDRLP4 1120
ADDP4
INDIRF4
ADDRLP4 1180
INDIRF4
ADDF4
ASGNF4
line 1740
;1740:		}
LABELV $898
line 1736
ADDRLP4 1116
ADDRLP4 1116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 3
LTI4 $897
line 1741
;1741:		numListedEntities = trap_EntitiesInBox( mins, maxs, iEntityList, MAX_GENTITIES );
ADDRLP4 5292
ARGP4
ADDRLP4 5304
ARGP4
ADDRLP4 5316
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 9416
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 1188
ADDRLP4 9416
INDIRI4
ASGNI4
line 1743
;1742:
;1743:		i = 0;
ADDRLP4 1116
CNSTI4 0
ASGNI4
ADDRGP4 $902
JUMPV
LABELV $901
line 1745
;1744:		while (i < numListedEntities)
;1745:		{
line 1746
;1746:			entityList[i] = &g_entities[iEntityList[i]];
ADDRLP4 9420
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9420
INDIRI4
ADDRLP4 1196
ADDP4
CNSTI4 2352
ADDRLP4 9420
INDIRI4
ADDRLP4 5316
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1748
;1747:
;1748:			i++;
ADDRLP4 1116
ADDRLP4 1116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1749
;1749:		}
LABELV $902
line 1744
ADDRLP4 1116
INDIRI4
ADDRLP4 1188
INDIRI4
LTI4 $901
line 1751
;1750:
;1751:		for ( e = 0 ; e < numListedEntities ; e++ ) 
ADDRLP4 1184
CNSTI4 0
ASGNI4
ADDRGP4 $907
JUMPV
LABELV $904
line 1752
;1752:		{
line 1753
;1753:			traceEnt = entityList[e];
ADDRLP4 0
ADDRLP4 1184
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1196
ADDP4
INDIRP4
ASGNP4
line 1755
;1754:
;1755:			if ( !traceEnt )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $908
line 1756
;1756:				continue;
ADDRGP4 $905
JUMPV
LABELV $908
line 1757
;1757:			if ( traceEnt == self )
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $910
line 1758
;1758:				continue;
ADDRGP4 $905
JUMPV
LABELV $910
line 1759
;1759:			if ( traceEnt->r.ownerNum == self->s.number && traceEnt->s.weapon != WP_THERMAL )//can push your own thermals
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $912
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 11
EQI4 $912
line 1760
;1760:				continue;
ADDRGP4 $905
JUMPV
LABELV $912
line 1761
;1761:			if ( !traceEnt->inuse )
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $914
line 1762
;1762:				continue;
ADDRGP4 $905
JUMPV
LABELV $914
line 1763
;1763:			if ( !traceEnt->takedamage )
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
NEI4 $916
line 1764
;1764:				continue;
ADDRGP4 $905
JUMPV
LABELV $916
line 1765
;1765:			if ( traceEnt->health <= 0 )//no torturing corpses
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $918
line 1766
;1766:				continue;
ADDRGP4 $905
JUMPV
LABELV $918
line 1767
;1767:			if ( !g_friendlyFire.integer && OnSameTeam(self, traceEnt))
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $920
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 9424
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 9424
INDIRI4
CNSTI4 0
EQI4 $920
line 1768
;1768:				continue;
ADDRGP4 $905
JUMPV
LABELV $920
line 1771
;1769:			//this is all to see if we need to start a saber attack, if it's in flight, this doesn't matter
;1770:			// find the distance from the edge of the bounding box
;1771:			for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 1116
CNSTI4 0
ASGNI4
LABELV $923
line 1772
;1772:			{
line 1773
;1773:				if ( center[i] < traceEnt->r.absmin[i] ) 
ADDRLP4 9428
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9428
INDIRI4
ADDRLP4 1120
ADDP4
INDIRF4
ADDRLP4 9428
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
GEF4 $927
line 1774
;1774:				{
line 1775
;1775:					v[i] = traceEnt->r.absmin[i] - center[i];
ADDRLP4 9432
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9432
INDIRI4
ADDRLP4 1132
ADDP4
ADDRLP4 9432
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 9432
INDIRI4
ADDRLP4 1120
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1776
;1776:				} else if ( center[i] > traceEnt->r.absmax[i] ) 
ADDRGP4 $928
JUMPV
LABELV $927
ADDRLP4 9432
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9432
INDIRI4
ADDRLP4 1120
ADDP4
INDIRF4
ADDRLP4 9432
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
LEF4 $929
line 1777
;1777:				{
line 1778
;1778:					v[i] = center[i] - traceEnt->r.absmax[i];
ADDRLP4 9436
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9436
INDIRI4
ADDRLP4 1132
ADDP4
ADDRLP4 9436
INDIRI4
ADDRLP4 1120
ADDP4
INDIRF4
ADDRLP4 9436
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1779
;1779:				} else 
ADDRGP4 $930
JUMPV
LABELV $929
line 1780
;1780:				{
line 1781
;1781:					v[i] = 0;
ADDRLP4 1116
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1132
ADDP4
CNSTF4 0
ASGNF4
line 1782
;1782:				}
LABELV $930
LABELV $928
line 1783
;1783:			}
LABELV $924
line 1771
ADDRLP4 1116
ADDRLP4 1116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 3
LTI4 $923
line 1785
;1784:
;1785:			VectorSubtract( traceEnt->r.absmax, traceEnt->r.absmin, size );
ADDRLP4 1168
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1168+4
ADDRLP4 0
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1168+8
ADDRLP4 0
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1786
;1786:			VectorMA( traceEnt->r.absmin, 0.5, size, ent_org );
ADDRLP4 9440
CNSTF4 1056964608
ASGNF4
ADDRLP4 1144
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 9440
INDIRF4
ADDRLP4 1168
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1144+4
ADDRLP4 0
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 9440
INDIRF4
ADDRLP4 1168+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1144+8
ADDRLP4 0
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 1168+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1790
;1787:
;1788:			//see if they're in front of me
;1789:			//must be within the forward cone
;1790:			VectorSubtract( ent_org, center, dir );
ADDRLP4 1156
ADDRLP4 1144
INDIRF4
ADDRLP4 1120
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1156+4
ADDRLP4 1144+4
INDIRF4
ADDRLP4 1120+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1156+8
ADDRLP4 1144+8
INDIRF4
ADDRLP4 1120+8
INDIRF4
SUBF4
ASGNF4
line 1791
;1791:			VectorNormalize( dir );
ADDRLP4 1156
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1792
;1792:			if ( (dot = DotProduct( dir, forward )) < 0.5 )
ADDRLP4 9444
ADDRLP4 1156
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 1156+4
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1156+8
INDIRF4
ADDRLP4 4+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 9412
ADDRLP4 9444
INDIRF4
ASGNF4
ADDRLP4 9444
INDIRF4
CNSTF4 1056964608
GEF4 $943
line 1793
;1793:				continue;
ADDRGP4 $905
JUMPV
LABELV $943
line 1796
;1794:
;1795:			//must be close enough
;1796:			dist = VectorLength( v );
ADDRLP4 1132
ARGP4
ADDRLP4 9448
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1192
ADDRLP4 9448
INDIRF4
ASGNF4
line 1797
;1797:			if ( dist >= radius ) 
ADDRLP4 1192
INDIRF4
ADDRLP4 1180
INDIRF4
LTF4 $949
line 1798
;1798:			{
line 1799
;1799:				continue;
ADDRGP4 $905
JUMPV
LABELV $949
line 1803
;1800:			}
;1801:		
;1802:			//in PVS?
;1803:			if ( !traceEnt->r.bmodel && !trap_InPVS( ent_org, self->client->ps.origin ) )
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $951
ADDRLP4 1144
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9452
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 9452
INDIRI4
CNSTI4 0
NEI4 $951
line 1804
;1804:			{//must be in PVS
line 1805
;1805:				continue;
ADDRGP4 $905
JUMPV
LABELV $951
line 1809
;1806:			}
;1807:
;1808:			//Now check and see if we can actually hit it
;1809:			JP_Trace( &tr, self->client->ps.origin, vec3_origin, vec3_origin, ent_org, self->s.number, MASK_SHOT );
ADDRLP4 16
ARGP4
ADDRLP4 9456
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9456
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9460
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 9460
INDIRP4
ARGP4
ADDRLP4 9460
INDIRP4
ARGP4
ADDRLP4 1144
ARGP4
ADDRLP4 9456
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1810
;1810:			if ( tr.fraction < 1.0f && tr.entityNum != traceEnt->s.number )
ADDRLP4 16+8
INDIRF4
CNSTF4 1065353216
GEF4 $953
ADDRLP4 16+52
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
EQI4 $953
line 1811
;1811:			{//must have clear LOS
line 1812
;1812:				continue;
ADDRGP4 $905
JUMPV
LABELV $953
line 1816
;1813:			}
;1814:
;1815:			// ok, we are within the radius, add us to the incoming list
;1816:			ForceLightningDamage( self, traceEnt, dir, ent_org );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1156
ARGP4
ADDRLP4 1144
ARGP4
ADDRGP4 ForceLightningDamage
CALLV
pop
line 1817
;1817:		}
LABELV $905
line 1751
ADDRLP4 1184
ADDRLP4 1184
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $907
ADDRLP4 1184
INDIRI4
ADDRLP4 1188
INDIRI4
LTI4 $904
line 1818
;1818:	}
ADDRGP4 $896
JUMPV
LABELV $895
line 1820
;1819:	else
;1820:	{//trace-line
line 1821
;1821:		if (self->client->sess.raceMode) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $957
line 1822
;1822:			VectorMA( self->client->ps.origin, 8192 * 16, forward, end ); // make it more like q3 assault rifle range
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1120
CNSTF4 1207959552
ASGNF4
ADDRLP4 1096
ADDRLP4 1116
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1120
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1096+4
ADDRLP4 1116
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1120
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1096+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1207959552
ADDRLP4 4+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1823
;1823:		}
ADDRGP4 $958
JUMPV
LABELV $957
line 1824
;1824:		else {
line 1825
;1825:			VectorMA( self->client->ps.origin, 2048, forward, end );
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1120
CNSTF4 1157627904
ASGNF4
ADDRLP4 1096
ADDRLP4 1116
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1120
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1096+4
ADDRLP4 1116
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1120
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1096+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1157627904
ADDRLP4 4+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1826
;1826:		}
LABELV $958
line 1828
;1827:		
;1828:		JP_Trace( &tr, self->client->ps.origin, vec3_origin, vec3_origin, end, self->s.number, MASK_SHOT );
ADDRLP4 16
ARGP4
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1120
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1096
ARGP4
ADDRLP4 1116
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1829
;1829:		if ( tr.entityNum == ENTITYNUM_NONE || tr.fraction == 1.0 || tr.allsolid || tr.startsolid )
ADDRLP4 16+52
INDIRI4
CNSTI4 1023
EQI4 $974
ADDRLP4 16+8
INDIRF4
CNSTF4 1065353216
EQF4 $974
ADDRLP4 1124
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 1124
INDIRI4
NEI4 $974
ADDRLP4 16+4
INDIRI4
ADDRLP4 1124
INDIRI4
EQI4 $967
LABELV $974
line 1830
;1830:		{
line 1831
;1831:			return;
ADDRGP4 $892
JUMPV
LABELV $967
line 1834
;1832:		}
;1833:		
;1834:		traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 16+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1835
;1835:		ForceLightningDamage( self, traceEnt, forward, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16+12
ARGP4
ADDRGP4 ForceLightningDamage
CALLV
pop
line 1836
;1836:	}
LABELV $896
line 1837
;1837:}
LABELV $892
endproc ForceShootLightning 9464 28
export ForceDrain
proc ForceDrain 28 12
line 1840
;1838:
;1839:void ForceDrain( gentity_t *self )
;1840:{
line 1841
;1841:	int		nowTime = LEVELTIME(self->client);
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
EQU4 $982
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $982
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $984
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $985
JUMPV
LABELV $984
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $985
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $983
JUMPV
LABELV $982
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $983
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1842
;1842:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $986
line 1843
;1843:	{
line 1844
;1844:		return;
ADDRGP4 $977
JUMPV
LABELV $986
line 1847
;1845:	}
;1846:
;1847:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $988
line 1848
;1848:	{
line 1849
;1849:		return;
ADDRGP4 $977
JUMPV
LABELV $988
line 1852
;1850:	}
;1851:
;1852:	if (self->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $990
line 1853
;1853:	{
line 1854
;1854:		return;
ADDRGP4 $977
JUMPV
LABELV $990
line 1857
;1855:	}
;1856:
;1857:	if ( self->client->ps.fd.forcePower < 25 || !WP_ForcePowerUsable( self, FP_DRAIN ) )
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 25
LTI4 $994
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 20
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $992
LABELV $994
line 1858
;1858:	{
line 1859
;1859:		return;
ADDRGP4 $977
JUMPV
LABELV $992
line 1861
;1860:	}
;1861:	if ( self->client->ps.fd.forcePowerDebounce[FP_DRAIN] > nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $995
line 1862
;1862:	{//stops it while using it and also after using it, up to 3 second delay
line 1863
;1863:		return;
ADDRGP4 $977
JUMPV
LABELV $995
line 1868
;1864:	}
;1865:
;1866://	self->client->ps.forceHandExtend = HANDEXTEND_FORCEPUSH;
;1867://	self->client->ps.forceHandExtendTime = nowTime + 1000;
;1868:	self->client->ps.forceHandExtend = HANDEXTEND_FORCEGRIP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 3
ASGNI4
line 1869
;1869:	self->client->ps.forceHandExtendTime = nowTime + 20000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 20000
ADDI4
ASGNI4
line 1871
;1870:
;1871:	G_Sound( self, CHAN_BODY, G_SoundIndex("sound/weapons/force/drain.wav") );
ADDRGP4 $997
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1873
;1872:	
;1873:	WP_ForcePowerStart( self, FP_DRAIN, 500 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 500
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 1874
;1874:}
LABELV $977
endproc ForceDrain 28 12
export ForceDrainDamage
proc ForceDrainDamage 136 24
line 1877
;1875:
;1876:void ForceDrainDamage( gentity_t *self, gentity_t *traceEnt, vec3_t dir, vec3_t impactPoint )
;1877:{
line 1879
;1878:	gentity_t *tent;
;1879:	int nowTime = LEVELTIME(self->client);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1003
ADDRLP4 16
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1003
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1005
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1006
JUMPV
LABELV $1005
ADDRLP4 12
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1006
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $1004
JUMPV
LABELV $1003
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1004
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 1881
;1880:
;1881:	self->client->dangerTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43800
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1882
;1882:	self->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 1883
;1883:	self->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43588
ADDP4
CNSTI4 0
ASGNI4
line 1885
;1884:
;1885:	if ( traceEnt && traceEnt->takedamage )
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1007
ADDRLP4 24
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1007
line 1886
;1886:	{
line 1887
;1887:		if ( traceEnt->client && (!OnSameTeam(self, traceEnt) || g_friendlyFire.integer) && self->client->ps.fd.forceDrainTime < nowTime && traceEnt->client->ps.fd.forcePower )
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1009
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $1012
ADDRGP4 g_friendlyFire+12
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $1009
LABELV $1012
ADDRLP4 40
CNSTI4 408
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRP4
CNSTI4 1180
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
GEF4 $1009
ADDRFP4 4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1009
line 1888
;1888:		{//an enemy or object
line 1889
;1889:			if (!traceEnt->client && traceEnt->s.eType == ET_GRAPPLE)
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1013
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1013
line 1890
;1890:			{ //g2animent
line 1891
;1891:				if (traceEnt->s.genericenemyindex < LEVELTIME(traceEnt->client))
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
EQU4 $1021
ADDRLP4 56
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1021
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1023
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
ADDRGP4 $1024
JUMPV
LABELV $1023
ADDRLP4 52
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1024
ADDRLP4 48
ADDRLP4 52
INDIRI4
ASGNI4
ADDRGP4 $1022
JUMPV
LABELV $1021
ADDRLP4 48
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1022
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
GEI4 $1015
line 1892
;1892:				{
line 1893
;1893:					traceEnt->s.genericenemyindex = LEVELTIME(traceEnt->client) + 2000;
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1029
ADDRLP4 68
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1029
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1031
ADDRLP4 64
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1032
JUMPV
LABELV $1031
ADDRLP4 64
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1032
ADDRLP4 60
ADDRLP4 64
INDIRI4
ASGNI4
ADDRGP4 $1030
JUMPV
LABELV $1029
ADDRLP4 60
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1030
ADDRFP4 4
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 60
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 1894
;1894:				}
LABELV $1015
line 1895
;1895:			}
LABELV $1013
line 1896
;1896:			if (ForcePowerUsableOn(self, traceEnt, FP_DRAIN))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 48
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $1033
line 1897
;1897:			{
line 1898
;1898:				int modPowerLevel = -1;
ADDRLP4 56
CNSTI4 -1
ASGNI4
line 1899
;1899:				int	dmg = 0; //Q_irand( 1, 3 );
ADDRLP4 52
CNSTI4 0
ASGNI4
line 1900
;1900:				if (self->client->ps.fd.forcePowerLevel[FP_DRAIN] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1035
line 1901
;1901:				{
line 1902
;1902:					dmg = 2; //because it's one-shot
ADDRLP4 52
CNSTI4 2
ASGNI4
line 1903
;1903:				}
ADDRGP4 $1036
JUMPV
LABELV $1035
line 1904
;1904:				else if (self->client->ps.fd.forcePowerLevel[FP_DRAIN] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1037
line 1905
;1905:				{
line 1906
;1906:					dmg = 3;
ADDRLP4 52
CNSTI4 3
ASGNI4
line 1907
;1907:				}
ADDRGP4 $1038
JUMPV
LABELV $1037
line 1908
;1908:				else if (self->client->ps.fd.forcePowerLevel[FP_DRAIN] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1039
line 1909
;1909:				{
line 1910
;1910:					dmg = 4;
ADDRLP4 52
CNSTI4 4
ASGNI4
line 1911
;1911:				}
LABELV $1039
LABELV $1038
LABELV $1036
line 1913
;1912:
;1913:				modPowerLevel = WP_AbsorbConversion(traceEnt, traceEnt->client->ps.fd.forcePowerLevel[FP_ABSORB], self, FP_DRAIN, self->client->ps.fd.forcePowerLevel[FP_DRAIN], 0);
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
CNSTI4 408
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 68
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 WP_AbsorbConversion
CALLI4
ASGNI4
ADDRLP4 56
ADDRLP4 72
INDIRI4
ASGNI4
line 1916
;1914:				//Since this is drain, don't absorb any power, but nullify the affect it has
;1915:
;1916:				if (modPowerLevel != -1)
ADDRLP4 56
INDIRI4
CNSTI4 -1
EQI4 $1041
line 1917
;1917:				{
line 1918
;1918:					if (!modPowerLevel)
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $1043
line 1919
;1919:					{
line 1920
;1920:						dmg = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 1921
;1921:					}
ADDRGP4 $1044
JUMPV
LABELV $1043
line 1922
;1922:					else if (modPowerLevel == 1)
ADDRLP4 56
INDIRI4
CNSTI4 1
NEI4 $1045
line 1923
;1923:					{
line 1924
;1924:						dmg = 1;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 1925
;1925:					}
ADDRGP4 $1046
JUMPV
LABELV $1045
line 1926
;1926:					else if (modPowerLevel == 2)
ADDRLP4 56
INDIRI4
CNSTI4 2
NEI4 $1047
line 1927
;1927:					{
line 1928
;1928:						dmg = 2;
ADDRLP4 52
CNSTI4 2
ASGNI4
line 1929
;1929:					}
LABELV $1047
LABELV $1046
LABELV $1044
line 1930
;1930:				}
LABELV $1041
line 1933
;1931:				//G_Damage( traceEnt, self, self, dir, impactPoint, dmg, 0, MOD_FORCE_DARK );
;1932:
;1933:				if (dmg)
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $1049
line 1934
;1934:				{
line 1935
;1935:					traceEnt->client->ps.fd.forcePower -= (dmg);
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
ADDRLP4 52
INDIRI4
SUBI4
ASGNI4
line 1936
;1936:				}
LABELV $1049
line 1937
;1937:				if (traceEnt->client->ps.fd.forcePower < 0)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1051
line 1938
;1938:				{
line 1939
;1939:					traceEnt->client->ps.fd.forcePower = 0;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 0
ASGNI4
line 1940
;1940:				}
LABELV $1051
line 1942
;1941:
;1942:				if (self->client->ps.stats[STAT_HEALTH] < self->client->ps.stats[STAT_MAX_HEALTH] &&
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 76
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
ADDRLP4 80
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
GEI4 $1053
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $1053
ADDRLP4 84
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $1053
line 1944
;1943:					self->health > 0 && self->client->ps.stats[STAT_HEALTH] > 0)
;1944:				{
line 1945
;1945:					self->health += dmg;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
ADDRLP4 52
INDIRI4
ADDI4
ASGNI4
line 1946
;1946:					if (self->health > self->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $1055
line 1947
;1947:					{
line 1948
;1948:						self->health = self->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 100
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1949
;1949:					}
LABELV $1055
line 1950
;1950:					self->client->ps.stats[STAT_HEALTH] = self->health;
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 100
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ASGNI4
line 1951
;1951:				}
LABELV $1053
line 1953
;1952:
;1953:				traceEnt->client->ps.fd.forcePowerRegenDebounceTime = LEVELTIME(traceEnt->client) + 800; //don't let the client being drained get force power back right away
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1061
ADDRLP4 100
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1061
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1063
ADDRLP4 96
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1064
JUMPV
LABELV $1063
ADDRLP4 96
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1064
ADDRLP4 92
ADDRLP4 96
INDIRI4
ASGNI4
ADDRGP4 $1062
JUMPV
LABELV $1061
ADDRLP4 92
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1062
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 92
INDIRI4
CNSTI4 800
ADDI4
ASGNI4
line 1977
;1954:
;1955:				//Drain the standard amount since we just drained someone else
;1956:
;1957:				/*
;1958:				if (self->client->ps.fd.forcePowerLevel[FP_DRAIN] == FORCE_LEVEL_1)
;1959:				{
;1960:					BG_ForcePowerDrain( &self->client->ps, FP_DRAIN, 0 );
;1961:				}
;1962:				else
;1963:				{
;1964:					BG_ForcePowerDrain( &self->client->ps, FP_DRAIN, forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_DRAIN]][FP_DRAIN]/5 );
;1965:				}
;1966:
;1967:				if (self->client->ps.fd.forcePowerLevel[FP_DRAIN] == FORCE_LEVEL_1)
;1968:				{
;1969:					self->client->ps.fd.forceDrainTime = nowTime + 100;
;1970:				}
;1971:				else
;1972:				{
;1973:					self->client->ps.fd.forceDrainTime = nowTime + 20;
;1974:				}
;1975:				*/
;1976:
;1977:				if ( !Q_irand( 0, 2 + gRandomUnlockAdd, self->client && self->client->sess.raceMode, 1) )
CNSTI4 0
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1068
ADDRLP4 108
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1068
ADDRLP4 104
CNSTI4 1
ASGNI4
ADDRGP4 $1069
JUMPV
LABELV $1068
ADDRLP4 104
CNSTI4 0
ASGNI4
LABELV $1069
ADDRLP4 104
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 112
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $1065
line 1978
;1978:				{
line 1980
;1979:					//G_Sound( traceEnt, CHAN_BODY, G_SoundIndex( "sound/weapons/force/lightninghit.wav" ) );
;1980:				}
LABELV $1065
line 1985
;1981:				//	traceEnt->s.powerups |= ( 1 << PW_DISINT_1 );
;1982:
;1983:				//	traceEnt->client->ps.powerups[PW_DISINT_1] = nowTime + 500;
;1984:
;1985:				if (traceEnt->client->forcePowerSoundDebounce < nowTime || jk2gameplay == VERSION_1_02)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43804
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $1072
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1070
LABELV $1072
line 1986
;1986:				{
line 1987
;1987:					tent = G_TempEntity( impactPoint, EV_FORCE_DRAINED);
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 84
ARGI4
ADDRLP4 116
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 116
INDIRP4
ASGNP4
line 1988
;1988:					tent->s.eventParm = DirToByte(dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 120
INDIRI4
ASGNI4
line 1989
;1989:					tent->s.owner = traceEnt->s.number;
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1991
;1990:
;1991:					if ( jk2gameplay != VERSION_1_02 ) traceEnt->client->forcePowerSoundDebounce = LEVELTIME(traceEnt->client) + 400;
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1073
ADDRLP4 132
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1079
ADDRLP4 132
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1079
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1081
ADDRLP4 128
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1082
JUMPV
LABELV $1081
ADDRLP4 128
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1082
ADDRLP4 124
ADDRLP4 128
INDIRI4
ASGNI4
ADDRGP4 $1080
JUMPV
LABELV $1079
ADDRLP4 124
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1080
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43804
ADDP4
ADDRLP4 124
INDIRI4
CNSTI4 400
ADDI4
ASGNI4
LABELV $1073
line 1992
;1992:				}
LABELV $1070
line 1993
;1993:			}
LABELV $1033
line 1994
;1994:		}
LABELV $1009
line 1995
;1995:	}
LABELV $1007
line 1996
;1996:}
LABELV $998
endproc ForceDrainDamage 136 24
export ForceShootDrain
proc ForceShootDrain 9476 28
line 1999
;1997:
;1998:int ForceShootDrain( gentity_t *self )
;1999:{
line 2003
;2000:	trace_t	tr;
;2001:	vec3_t	end, forward;
;2002:	gentity_t	*traceEnt;
;2003:	int			gotOneOrMore = 0;
ADDRLP4 1096
CNSTI4 0
ASGNI4
line 2004
;2004:	int			nowTime = LEVELTIME(self->client);
ADDRLP4 1124
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1088
ADDRLP4 1124
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1088
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1090
ADDRLP4 1120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1091
JUMPV
LABELV $1090
ADDRLP4 1120
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1091
ADDRLP4 1116
ADDRLP4 1120
INDIRI4
ASGNI4
ADDRGP4 $1089
JUMPV
LABELV $1088
ADDRLP4 1116
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1089
ADDRLP4 1112
ADDRLP4 1116
INDIRI4
ASGNI4
line 2006
;2005:
;2006:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1092
line 2007
;2007:	{
line 2008
;2008:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1083
JUMPV
LABELV $1092
line 2010
;2009:	}
;2010:	AngleVectors( self->client->ps.viewangles, forward, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1128
CNSTP4 0
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2011
;2011:	VectorNormalize( forward );
ADDRLP4 1084
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2013
;2012:
;2013:	if ( self->client->ps.fd.forcePowerLevel[FP_DRAIN] > FORCE_LEVEL_2 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 2
LEI4 $1094
line 2014
;2014:	{//arc
line 2016
;2015:		vec3_t	center, mins, maxs, dir, ent_org, size, v;
;2016:		float	radius = MAX_DRAIN_DISTANCE, dot, dist;
ADDRLP4 1196
CNSTF4 1140850688
ASGNF4
line 2021
;2017:		gentity_t	*entityList[MAX_GENTITIES];
;2018:		int			iEntityList[MAX_GENTITIES];
;2019:		int		e, numListedEntities, i;
;2020:
;2021:		VectorCopy( self->client->ps.origin, center );
ADDRLP4 1136
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2022
;2022:		for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 1132
CNSTI4 0
ASGNI4
LABELV $1096
line 2023
;2023:		{
line 2024
;2024:			mins[i] = center[i] - radius;
ADDRLP4 9432
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9432
INDIRI4
ADDRLP4 5308
ADDP4
ADDRLP4 9432
INDIRI4
ADDRLP4 1136
ADDP4
INDIRF4
ADDRLP4 1196
INDIRF4
SUBF4
ASGNF4
line 2025
;2025:			maxs[i] = center[i] + radius;
ADDRLP4 9436
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9436
INDIRI4
ADDRLP4 5320
ADDP4
ADDRLP4 9436
INDIRI4
ADDRLP4 1136
ADDP4
INDIRF4
ADDRLP4 1196
INDIRF4
ADDF4
ASGNF4
line 2026
;2026:		}
LABELV $1097
line 2022
ADDRLP4 1132
ADDRLP4 1132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 3
LTI4 $1096
line 2027
;2027:		numListedEntities = trap_EntitiesInBox( mins, maxs, iEntityList, MAX_GENTITIES );
ADDRLP4 5308
ARGP4
ADDRLP4 5320
ARGP4
ADDRLP4 5332
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 9432
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 1204
ADDRLP4 9432
INDIRI4
ASGNI4
line 2029
;2028:
;2029:		i = 0;
ADDRLP4 1132
CNSTI4 0
ASGNI4
ADDRGP4 $1101
JUMPV
LABELV $1100
line 2031
;2030:		while (i < numListedEntities)
;2031:		{
line 2032
;2032:			entityList[i] = &g_entities[iEntityList[i]];
ADDRLP4 9436
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9436
INDIRI4
ADDRLP4 1212
ADDP4
CNSTI4 2352
ADDRLP4 9436
INDIRI4
ADDRLP4 5332
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2034
;2033:
;2034:			i++;
ADDRLP4 1132
ADDRLP4 1132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2035
;2035:		}
LABELV $1101
line 2030
ADDRLP4 1132
INDIRI4
ADDRLP4 1204
INDIRI4
LTI4 $1100
line 2037
;2036:
;2037:		for ( e = 0 ; e < numListedEntities ; e++ ) 
ADDRLP4 1200
CNSTI4 0
ASGNI4
ADDRGP4 $1106
JUMPV
LABELV $1103
line 2038
;2038:		{
line 2039
;2039:			traceEnt = entityList[e];
ADDRLP4 0
ADDRLP4 1200
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1212
ADDP4
INDIRP4
ASGNP4
line 2041
;2040:
;2041:			if ( !traceEnt )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1107
line 2042
;2042:				continue;
ADDRGP4 $1104
JUMPV
LABELV $1107
line 2043
;2043:			if ( traceEnt == self )
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $1109
line 2044
;2044:				continue;
ADDRGP4 $1104
JUMPV
LABELV $1109
line 2045
;2045:			if ( !traceEnt->inuse )
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1111
line 2046
;2046:				continue;
ADDRGP4 $1104
JUMPV
LABELV $1111
line 2047
;2047:			if ( !traceEnt->takedamage )
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1113
line 2048
;2048:				continue;
ADDRGP4 $1104
JUMPV
LABELV $1113
line 2049
;2049:			if ( traceEnt->health <= 0 )//no torturing corpses
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1115
line 2050
;2050:				continue;
ADDRGP4 $1104
JUMPV
LABELV $1115
line 2051
;2051:			if ( !traceEnt->client )
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1117
line 2052
;2052:				continue;
ADDRGP4 $1104
JUMPV
LABELV $1117
line 2053
;2053:			if ( !traceEnt->client->ps.fd.forcePower )
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1119
line 2054
;2054:				continue;
ADDRGP4 $1104
JUMPV
LABELV $1119
line 2055
;2055:			if (OnSameTeam(self, traceEnt))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 9436
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 9436
INDIRI4
CNSTI4 0
EQI4 $1121
line 2056
;2056:				continue;
ADDRGP4 $1104
JUMPV
LABELV $1121
line 2059
;2057:			//this is all to see if we need to start a saber attack, if it's in flight, this doesn't matter
;2058:			// find the distance from the edge of the bounding box
;2059:			for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 1132
CNSTI4 0
ASGNI4
LABELV $1123
line 2060
;2060:			{
line 2061
;2061:				if ( center[i] < traceEnt->r.absmin[i] ) 
ADDRLP4 9440
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9440
INDIRI4
ADDRLP4 1136
ADDP4
INDIRF4
ADDRLP4 9440
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
GEF4 $1127
line 2062
;2062:				{
line 2063
;2063:					v[i] = traceEnt->r.absmin[i] - center[i];
ADDRLP4 9444
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9444
INDIRI4
ADDRLP4 1148
ADDP4
ADDRLP4 9444
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 9444
INDIRI4
ADDRLP4 1136
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2064
;2064:				} else if ( center[i] > traceEnt->r.absmax[i] ) 
ADDRGP4 $1128
JUMPV
LABELV $1127
ADDRLP4 9444
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9444
INDIRI4
ADDRLP4 1136
ADDP4
INDIRF4
ADDRLP4 9444
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
LEF4 $1129
line 2065
;2065:				{
line 2066
;2066:					v[i] = center[i] - traceEnt->r.absmax[i];
ADDRLP4 9448
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9448
INDIRI4
ADDRLP4 1148
ADDP4
ADDRLP4 9448
INDIRI4
ADDRLP4 1136
ADDP4
INDIRF4
ADDRLP4 9448
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2067
;2067:				} else 
ADDRGP4 $1130
JUMPV
LABELV $1129
line 2068
;2068:				{
line 2069
;2069:					v[i] = 0;
ADDRLP4 1132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1148
ADDP4
CNSTF4 0
ASGNF4
line 2070
;2070:				}
LABELV $1130
LABELV $1128
line 2071
;2071:			}
LABELV $1124
line 2059
ADDRLP4 1132
ADDRLP4 1132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 3
LTI4 $1123
line 2073
;2072:
;2073:			VectorSubtract( traceEnt->r.absmax, traceEnt->r.absmin, size );
ADDRLP4 1184
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1184+4
ADDRLP4 0
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1184+8
ADDRLP4 0
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2074
;2074:			VectorMA( traceEnt->r.absmin, 0.5, size, ent_org );
ADDRLP4 9452
CNSTF4 1056964608
ASGNF4
ADDRLP4 1160
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 9452
INDIRF4
ADDRLP4 1184
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1160+4
ADDRLP4 0
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 9452
INDIRF4
ADDRLP4 1184+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1160+8
ADDRLP4 0
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 1184+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2078
;2075:
;2076:			//see if they're in front of me
;2077:			//must be within the forward cone
;2078:			VectorSubtract( ent_org, center, dir );
ADDRLP4 1172
ADDRLP4 1160
INDIRF4
ADDRLP4 1136
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1172+4
ADDRLP4 1160+4
INDIRF4
ADDRLP4 1136+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1172+8
ADDRLP4 1160+8
INDIRF4
ADDRLP4 1136+8
INDIRF4
SUBF4
ASGNF4
line 2079
;2079:			VectorNormalize( dir );
ADDRLP4 1172
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2080
;2080:			if ( (dot = DotProduct( dir, forward )) < 0.5 )
ADDRLP4 9456
ADDRLP4 1172
INDIRF4
ADDRLP4 1084
INDIRF4
MULF4
ADDRLP4 1172+4
INDIRF4
ADDRLP4 1084+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1172+8
INDIRF4
ADDRLP4 1084+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 9428
ADDRLP4 9456
INDIRF4
ASGNF4
ADDRLP4 9456
INDIRF4
CNSTF4 1056964608
GEF4 $1143
line 2081
;2081:				continue;
ADDRGP4 $1104
JUMPV
LABELV $1143
line 2084
;2082:
;2083:			//must be close enough
;2084:			dist = VectorLength( v );
ADDRLP4 1148
ARGP4
ADDRLP4 9460
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1208
ADDRLP4 9460
INDIRF4
ASGNF4
line 2085
;2085:			if ( dist >= radius ) 
ADDRLP4 1208
INDIRF4
ADDRLP4 1196
INDIRF4
LTF4 $1149
line 2086
;2086:			{
line 2087
;2087:				continue;
ADDRGP4 $1104
JUMPV
LABELV $1149
line 2091
;2088:			}
;2089:		
;2090:			//in PVS?
;2091:			if ( !traceEnt->r.bmodel && !trap_InPVS( ent_org, self->client->ps.origin ) )
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1151
ADDRLP4 1160
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9464
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 9464
INDIRI4
CNSTI4 0
NEI4 $1151
line 2092
;2092:			{//must be in PVS
line 2093
;2093:				continue;
ADDRGP4 $1104
JUMPV
LABELV $1151
line 2097
;2094:			}
;2095:
;2096:			//Now check and see if we can actually hit it
;2097:			JP_Trace( &tr, self->client->ps.origin, vec3_origin, vec3_origin, ent_org, self->s.number, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRLP4 9468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9468
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9472
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 9472
INDIRP4
ARGP4
ADDRLP4 9472
INDIRP4
ARGP4
ADDRLP4 1160
ARGP4
ADDRLP4 9468
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2098
;2098:			if ( tr.fraction < 1.0f && tr.entityNum != traceEnt->s.number )
ADDRLP4 4+8
INDIRF4
CNSTF4 1065353216
GEF4 $1153
ADDRLP4 4+52
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
EQI4 $1153
line 2099
;2099:			{//must have clear LOS
line 2100
;2100:				continue;
ADDRGP4 $1104
JUMPV
LABELV $1153
line 2104
;2101:			}
;2102:
;2103:			// ok, we are within the radius, add us to the incoming list
;2104:			ForceDrainDamage( self, traceEnt, dir, ent_org );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1172
ARGP4
ADDRLP4 1160
ARGP4
ADDRGP4 ForceDrainDamage
CALLV
pop
line 2105
;2105:			gotOneOrMore = 1;
ADDRLP4 1096
CNSTI4 1
ASGNI4
line 2106
;2106:		}
LABELV $1104
line 2037
ADDRLP4 1200
ADDRLP4 1200
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1106
ADDRLP4 1200
INDIRI4
ADDRLP4 1204
INDIRI4
LTI4 $1103
line 2107
;2107:	}
ADDRGP4 $1095
JUMPV
LABELV $1094
line 2109
;2108:	else
;2109:	{//trace-line
line 2110
;2110:		VectorMA( self->client->ps.origin, 2048, forward, end );
ADDRLP4 1132
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1136
CNSTF4 1157627904
ASGNF4
ADDRLP4 1100
ADDRLP4 1132
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 1084
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1132
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 1084+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1100+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1157627904
ADDRLP4 1084+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2112
;2111:		
;2112:		JP_Trace( &tr, self->client->ps.origin, vec3_origin, vec3_origin, end, self->s.number, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1144
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1140
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2113
;2113:		if ( tr.entityNum == ENTITYNUM_NONE || tr.fraction == 1.0 || tr.allsolid || tr.startsolid || !g_entities[tr.entityNum].client || !g_entities[tr.entityNum].inuse )
ADDRLP4 4+52
INDIRI4
CNSTI4 1023
EQI4 $1174
ADDRLP4 4+8
INDIRF4
CNSTF4 1065353216
EQF4 $1174
ADDRLP4 1148
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 1148
INDIRI4
NEI4 $1174
ADDRLP4 4+4
INDIRI4
ADDRLP4 1148
INDIRI4
NEI4 $1174
ADDRLP4 1152
CNSTI4 2352
ASGNI4
ADDRLP4 1152
INDIRI4
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1174
ADDRLP4 1152
INDIRI4
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1148
INDIRI4
NEI4 $1161
LABELV $1174
line 2114
;2114:		{
line 2115
;2115:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1083
JUMPV
LABELV $1161
line 2118
;2116:		}
;2117:		
;2118:		traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2119
;2119:		ForceDrainDamage( self, traceEnt, forward, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 4+12
ARGP4
ADDRGP4 ForceDrainDamage
CALLV
pop
line 2120
;2120:		gotOneOrMore = 1;
ADDRLP4 1096
CNSTI4 1
ASGNI4
line 2121
;2121:	}
LABELV $1095
line 2123
;2122:
;2123:	self->client->ps.activeForcePass = self->client->ps.fd.forcePowerLevel[FP_DRAIN] + FORCE_LEVEL_3;
ADDRLP4 1132
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 1132
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 2125
;2124:
;2125:	BG_ForcePowerDrain( &self->client->ps, FP_DRAIN, (jk2gameplay == VERSION_1_02 ? 1 : 5) ); //used to be 1, but this did, too, anger the God of Balance.
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1178
ADDRLP4 1136
CNSTI4 1
ASGNI4
ADDRGP4 $1179
JUMPV
LABELV $1178
ADDRLP4 1136
CNSTI4 5
ASGNI4
LABELV $1179
ADDRLP4 1136
INDIRI4
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 2127
;2126:
;2127:	self->client->ps.fd.forcePowerRegenDebounceTime = nowTime + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 1112
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2129
;2128:
;2129:	return gotOneOrMore;
ADDRLP4 1096
INDIRI4
RETI4
LABELV $1083
endproc ForceShootDrain 9476 28
export ForceJumpCharge
proc ForceJumpCharge 56 12
line 2133
;2130:}
;2131:
;2132:void ForceJumpCharge( gentity_t *self, usercmd_t *ucmd )
;2133:{ //I guess this is unused now. Was used for the "charge" jump type.
line 2134
;2134:	float forceJumpChargeInterval = forceJumpStrength[0] / (FORCE_JUMP_CHARGE_TIME/FRAMETIME);
ADDRLP4 4
ADDRGP4 forceJumpStrength
INDIRF4
CNSTF4 1115684864
DIVF4
ASGNF4
line 2135
;2135:	int nowTime = LEVELTIME(self->client);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1185
ADDRLP4 20
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1185
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1187
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1188
JUMPV
LABELV $1187
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1188
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
ADDRGP4 $1186
JUMPV
LABELV $1185
ADDRLP4 12
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1186
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 2136
;2136:	int moveStyle = MOVESTYLE(self->client);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1190
ADDRLP4 28
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1190
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRGP4 $1191
JUMPV
LABELV $1190
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $1191
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 2138
;2137:	
;2138:	if (g_mv_blockchargejump.integer && !self->client->sess.raceMode)
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRGP4 g_mv_blockchargejump+12
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1192
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $1192
line 2139
;2139:	{
line 2140
;2140:		return;
ADDRGP4 $1180
JUMPV
LABELV $1192
line 2142
;2141:	}
;2142:	if (self->client->sess.raceMode)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1195
line 2143
;2143:	{
line 2144
;2144:		return;
ADDRGP4 $1180
JUMPV
LABELV $1195
line 2147
;2145:	}
;2146:
;2147:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1197
line 2148
;2148:	{
line 2149
;2149:		return;
ADDRGP4 $1180
JUMPV
LABELV $1197
line 2152
;2150:	}
;2151:
;2152:	if (!self->client->ps.fd.forceJumpCharge && self->client->ps.groundEntityNum == ENTITYNUM_NONE)
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1199
ADDRLP4 36
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1199
line 2153
;2153:	{
line 2154
;2154:		return;
ADDRGP4 $1180
JUMPV
LABELV $1199
line 2157
;2155:	}
;2156:
;2157:	if (self->client->ps.fd.forcePower < forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_LEVITATION]][FP_LEVITATION])
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
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
GEI4 $1201
line 2158
;2158:	{
line 2159
;2159:		G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
line 2160
;2160:		return;
ADDRGP4 $1180
JUMPV
LABELV $1201
line 2163
;2161:	}
;2162:
;2163:	if (!self->client->ps.fd.forceJumpCharge)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1203
line 2164
;2164:	{
line 2165
;2165:		self->client->ps.fd.forceJumpAddTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1104
ADDP4
CNSTI4 0
ASGNI4
line 2166
;2166:	}
LABELV $1203
line 2168
;2167:
;2168:	if (self->client->ps.fd.forceJumpAddTime >= nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1104
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $1205
line 2169
;2169:	{
line 2170
;2170:		return;
ADDRGP4 $1180
JUMPV
LABELV $1205
line 2174
;2171:	}
;2172:
;2173:	//need to play sound
;2174:	if ( !self->client->ps.fd.forceJumpCharge )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1207
line 2175
;2175:	{
line 2176
;2176:		G_Sound( self, TRACK_CHANNEL_1, G_SoundIndex("sound/weapons/force/jumpbuild.wav") );
ADDRGP4 $1209
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2177
;2177:	}
LABELV $1207
line 2180
;2178:
;2179:	//Increment
;2180:	if (self->client->ps.fd.forceJumpAddTime < nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1104
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $1210
line 2181
;2181:	{
line 2182
;2182:		self->client->ps.fd.forceJumpCharge += forceJumpChargeInterval*50;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
CNSTF4 1112014848
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2183
;2183:		self->client->ps.fd.forceJumpAddTime = nowTime + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1104
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2184
;2184:	}
LABELV $1210
line 2187
;2185:
;2186:	//clamp to max strength for current level
;2187:	if ( self->client->ps.fd.forceJumpCharge > forceJumpStrength[self->client->ps.fd.forcePowerLevel[FP_LEVITATION]] )
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
LEF4 $1212
line 2188
;2188:	{
line 2189
;2189:		self->client->ps.fd.forceJumpCharge = forceJumpStrength[self->client->ps.fd.forcePowerLevel[FP_LEVITATION]];
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 1096
ADDP4
ADDRLP4 48
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
line 2190
;2190:		G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
line 2191
;2191:	}
LABELV $1212
line 2194
;2192:
;2193:	//clamp to max available force power
;2194:	if ( self->client->ps.fd.forceJumpCharge/forceJumpChargeInterval/(FORCE_JUMP_CHARGE_TIME/FRAMETIME)*forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_LEVITATION]][FP_LEVITATION] > self->client->ps.fd.forcePower )
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
DIVF4
CNSTF4 1115684864
DIVF4
CNSTI4 72
ADDRLP4 48
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
ADDRLP4 48
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CVIF4 4
LEF4 $1214
line 2195
;2195:	{//can't use more than you have
line 2196
;2196:		G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
line 2197
;2197:		self->client->ps.fd.forceJumpCharge = self->client->ps.fd.forcePower*forceJumpChargeInterval/(FORCE_JUMP_CHARGE_TIME/FRAMETIME);
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 1096
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1115684864
DIVF4
ASGNF4
line 2198
;2198:	}
LABELV $1214
line 2201
;2199:	
;2200:	//G_Printf("%f\n", self->client->ps.fd.forceJumpCharge);
;2201:}
LABELV $1180
endproc ForceJumpCharge 56 12
export WP_GetVelocityForForceJump
proc WP_GetVelocityForForceJump 92 16
line 2204
;2202:
;2203:int WP_GetVelocityForForceJump( gentity_t *self, vec3_t jumpVel, usercmd_t *ucmd )
;2204:{
line 2205
;2205:	float pushFwd = 0, pushRt = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 4
CNSTF4 0
ASGNF4
line 2207
;2206:	vec3_t	view, forward, right;
;2207:	const int moveStyle = MOVESTYLE(self->client);
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1218
ADDRLP4 56
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1218
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRGP4 $1219
JUMPV
LABELV $1218
ADDRLP4 52
CNSTI4 0
ASGNI4
LABELV $1219
ADDRLP4 44
ADDRLP4 52
INDIRI4
ASGNI4
line 2208
;2208:	int JUMP_VELOCITY_NEW = JUMP_VELOCITY;
ADDRLP4 48
CNSTI4 225
ASGNI4
line 2210
;2209:
;2210:	if (MovementIsQuake3Based(moveStyle)) {
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $1220
line 2211
;2211:		JUMP_VELOCITY_NEW = 270;
ADDRLP4 48
CNSTI4 270
ASGNI4
line 2212
;2212:	}
LABELV $1220
line 2214
;2213:
;2214:	VectorCopy( self->client->ps.viewangles, view );
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2215
;2215:	view[0] = 0;
ADDRLP4 32
CNSTF4 0
ASGNF4
line 2216
;2216:	AngleVectors( view, forward, right, NULL );
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
line 2217
;2217:	if ( ucmd->forwardmove && ucmd->rightmove )
ADDRLP4 64
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
EQI4 $1222
ADDRLP4 64
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 68
INDIRI4
EQI4 $1222
line 2218
;2218:	{
line 2219
;2219:		if ( ucmd->forwardmove > 0 )
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $1224
line 2220
;2220:		{
line 2221
;2221:			pushFwd = 50;
ADDRLP4 0
CNSTF4 1112014848
ASGNF4
line 2222
;2222:		}
ADDRGP4 $1225
JUMPV
LABELV $1224
line 2224
;2223:		else
;2224:		{
line 2225
;2225:			pushFwd = -50;
ADDRLP4 0
CNSTF4 3259498496
ASGNF4
line 2226
;2226:		}
LABELV $1225
line 2227
;2227:		if ( ucmd->rightmove > 0 )
ADDRFP4 8
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $1226
line 2228
;2228:		{
line 2229
;2229:			pushRt = 50;
ADDRLP4 4
CNSTF4 1112014848
ASGNF4
line 2230
;2230:		}
ADDRGP4 $1223
JUMPV
LABELV $1226
line 2232
;2231:		else
;2232:		{
line 2233
;2233:			pushRt = -50;
ADDRLP4 4
CNSTF4 3259498496
ASGNF4
line 2234
;2234:		}
line 2235
;2235:	}
ADDRGP4 $1223
JUMPV
LABELV $1222
line 2236
;2236:	else if ( ucmd->forwardmove || ucmd->rightmove )
ADDRLP4 72
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
ADDRLP4 76
INDIRI4
NEI4 $1230
ADDRLP4 72
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ADDRLP4 76
INDIRI4
EQI4 $1228
LABELV $1230
line 2237
;2237:	{
line 2238
;2238:		if ( ucmd->forwardmove > 0 )
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $1231
line 2239
;2239:		{
line 2240
;2240:			pushFwd = 100;
ADDRLP4 0
CNSTF4 1120403456
ASGNF4
line 2241
;2241:		}
ADDRGP4 $1232
JUMPV
LABELV $1231
line 2242
;2242:		else if ( ucmd->forwardmove < 0 )
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $1233
line 2243
;2243:		{
line 2244
;2244:			pushFwd = -100;
ADDRLP4 0
CNSTF4 3267887104
ASGNF4
line 2245
;2245:		}
ADDRGP4 $1234
JUMPV
LABELV $1233
line 2246
;2246:		else if ( ucmd->rightmove > 0 )
ADDRFP4 8
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $1235
line 2247
;2247:		{
line 2248
;2248:			pushRt = 100;
ADDRLP4 4
CNSTF4 1120403456
ASGNF4
line 2249
;2249:		}
ADDRGP4 $1236
JUMPV
LABELV $1235
line 2250
;2250:		else if ( ucmd->rightmove < 0 )
ADDRFP4 8
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $1237
line 2251
;2251:		{
line 2252
;2252:			pushRt = -100;
ADDRLP4 4
CNSTF4 3267887104
ASGNF4
line 2253
;2253:		}
LABELV $1237
LABELV $1236
LABELV $1234
LABELV $1232
line 2254
;2254:	}
LABELV $1228
LABELV $1223
line 2256
;2255:
;2256:	G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
line 2258
;2257:
;2258:	G_PreDefSound(self->client->ps.origin, PDSOUND_FORCEJUMP);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 2260
;2259:
;2260:	if (self->client->ps.fd.forceJumpCharge < JUMP_VELOCITY_NEW +40)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 48
INDIRI4
CNSTI4 40
ADDI4
CVIF4 4
GEF4 $1239
line 2261
;2261:	{ //give him at least a tiny boost from just a tap
line 2262
;2262:		self->client->ps.fd.forceJumpCharge = JUMP_VELOCITY_NEW +400; // this supposed to be 40? in v054 it was 40, but in v055 it changed to 400 but condition stayed 40?
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
ADDRLP4 48
INDIRI4
CNSTI4 400
ADDI4
CVIF4 4
ASGNF4
line 2263
;2263:	}
LABELV $1239
line 2265
;2264:
;2265:	if (self->client->ps.velocity[2] < -30)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 3253731328
GEF4 $1241
line 2266
;2266:	{ //so that we can get a good boost when force jumping in a fall
line 2267
;2267:		self->client->ps.velocity[2] = -30;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 3253731328
ASGNF4
line 2268
;2268:	}
LABELV $1241
line 2270
;2269:
;2270:	VectorMA( self->client->ps.velocity, pushFwd, forward, jumpVel );
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
line 2271
;2271:	if (moveStyle == MV_CHARGEJUMP) {
ADDRLP4 44
INDIRI4
CNSTI4 12
NEI4 $1245
line 2273
;2272:		// i think this was the intended behavior.
;2273:		VectorMA(jumpVel, pushRt, right, jumpVel);
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 20+4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRLP4 20+8
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2274
;2274:	}
ADDRGP4 $1246
JUMPV
LABELV $1245
line 2275
;2275:	else {
line 2276
;2276:		VectorMA(self->client->ps.velocity, pushRt, right, jumpVel);
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
line 2277
;2277:	}
LABELV $1246
line 2278
;2278:	jumpVel[2] += self->client->ps.fd.forceJumpCharge;
ADDRLP4 80
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2279
;2279:	if ( pushFwd > 0 && self->client->ps.fd.forceJumpCharge > 200 )
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $1251
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 1128792064
LEF4 $1251
line 2280
;2280:	{
line 2281
;2281:		return FJ_FORWARD;
CNSTI4 0
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1251
line 2283
;2282:	}
;2283:	else if ( pushFwd < 0 && self->client->ps.fd.forceJumpCharge > 200 )
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $1253
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 1128792064
LEF4 $1253
line 2284
;2284:	{
line 2285
;2285:		return FJ_BACKWARD;
CNSTI4 1
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1253
line 2287
;2286:	}
;2287:	else if ( pushRt > 0 && self->client->ps.fd.forceJumpCharge > 200 )
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $1255
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 1128792064
LEF4 $1255
line 2288
;2288:	{
line 2289
;2289:		return FJ_RIGHT;
CNSTI4 2
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1255
line 2291
;2290:	}
;2291:	else if ( pushRt < 0 && self->client->ps.fd.forceJumpCharge > 200 )
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $1257
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 1128792064
LEF4 $1257
line 2292
;2292:	{
line 2293
;2293:		return FJ_LEFT;
CNSTI4 3
RETI4
ADDRGP4 $1216
JUMPV
LABELV $1257
line 2296
;2294:	}
;2295:	else
;2296:	{
line 2297
;2297:		return FJ_UP;
CNSTI4 4
RETI4
LABELV $1216
endproc WP_GetVelocityForForceJump 92 16
export ForceJump
proc ForceJump 72 12
line 2302
;2298:	}
;2299:}
;2300:
;2301:void ForceJump( gentity_t *self, usercmd_t *ucmd )
;2302:{
line 2305
;2303:	float forceJumpChargeInterval;
;2304:	vec3_t	jumpVel;
;2305:	int nowTime = LEVELTIME(self->client);
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1264
ADDRLP4 32
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1264
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1266
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1267
JUMPV
LABELV $1266
ADDRLP4 28
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1267
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $1265
JUMPV
LABELV $1264
ADDRLP4 24
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1265
ADDRLP4 16
ADDRLP4 24
INDIRI4
ASGNI4
line 2306
;2306:	int moveStyle = MOVESTYLE(self->client);
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1269
ADDRLP4 40
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1269
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRGP4 $1270
JUMPV
LABELV $1269
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $1270
ADDRLP4 20
ADDRLP4 36
INDIRI4
ASGNI4
line 2308
;2307:
;2308:	if ( g_mv_blockchargejump.integer && !self->client->sess.raceMode)
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 g_mv_blockchargejump+12
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $1271
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $1271
line 2309
;2309:	{
line 2310
;2310:		return;
ADDRGP4 $1259
JUMPV
LABELV $1271
line 2312
;2311:	}
;2312:	if ( self->client->sess.raceMode)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1274
line 2313
;2313:	{
line 2314
;2314:		return;
ADDRGP4 $1259
JUMPV
LABELV $1274
line 2316
;2315:	}
;2316:	if ( self->client->ps.fd.forcePowerDuration[FP_LEVITATION] > nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 864
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $1276
line 2317
;2317:	{
line 2318
;2318:		return;
ADDRGP4 $1259
JUMPV
LABELV $1276
line 2320
;2319:	}
;2320:	if ( !WP_ForcePowerUsable( self, FP_LEVITATION ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 48
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $1278
line 2321
;2321:	{
line 2322
;2322:		return;
ADDRGP4 $1259
JUMPV
LABELV $1278
line 2324
;2323:	}
;2324:	if ( self->s.groundEntityNum == ENTITYNUM_NONE )
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1280
line 2325
;2325:	{
line 2326
;2326:		return;
ADDRGP4 $1259
JUMPV
LABELV $1280
line 2328
;2327:	}
;2328:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1282
line 2329
;2329:	{
line 2330
;2330:		return;
ADDRGP4 $1259
JUMPV
LABELV $1282
line 2333
;2331:	}
;2332:
;2333:	self->client->fjDidJump = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43808
ADDP4
CNSTI4 1
ASGNI4
line 2335
;2334:
;2335:	forceJumpChargeInterval = forceJumpStrength[self->client->ps.fd.forcePowerLevel[FP_LEVITATION]]/(FORCE_JUMP_CHARGE_TIME/FRAMETIME);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forceJumpStrength
ADDP4
INDIRF4
CNSTF4 1115684864
DIVF4
ASGNF4
line 2337
;2336:
;2337:	WP_GetVelocityForForceJump( self, jumpVel, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 WP_GetVelocityForForceJump
CALLI4
pop
line 2340
;2338:
;2339:	//FIXME: sound effect
;2340:	self->client->ps.fd.forceJumpZStart = self->client->ps.origin[2];//remember this for when we land
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 1092
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 2342
;2341:	
;2342:	if (self->client->ps.fd.forceJumpZStart && self->client->sess.raceMode && (self->client->sess.raceStyle.runFlags & RFL_JUMPBUGDISABLE)) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CNSTF4 0
EQF4 $1284
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1284
ADDRLP4 56
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 1
BANDI4
ADDRLP4 60
INDIRI4
EQI4 $1284
line 2343
;2343:		self->client->ps.fd.forceJumpZStart -= 0.1f;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1092
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
CNSTF4 1036831949
SUBF4
ASGNF4
line 2344
;2344:	}
LABELV $1284
line 2346
;2345:
;2346:	VectorCopy( jumpVel, self->client->ps.velocity );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2350
;2347:	//wasn't allowing them to attack when jumping, but that was annoying
;2348:	//self->client->ps.weaponTime = self->client->ps.torsoAnimTimer;
;2349:
;2350:	WP_ForcePowerStart( self, FP_LEVITATION, self->client->ps.fd.forceJumpCharge/forceJumpChargeInterval/(FORCE_JUMP_CHARGE_TIME/FRAMETIME)*forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_LEVITATION]][FP_LEVITATION] );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRLP4 64
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
DIVF4
CNSTF4 1115684864
DIVF4
CNSTI4 72
ADDRLP4 68
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
CVFI4 4
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 2352
;2351:	//self->client->ps.fd.forcePowerDuration[FP_LEVITATION] = nowTime + self->client->ps.weaponTime;
;2352:	self->client->ps.fd.forceJumpCharge = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
CNSTF4 0
ASGNF4
line 2353
;2353:	self->client->ps.forceJumpFlip = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1244
ADDP4
CNSTI4 1
ASGNI4
line 2354
;2354:}
LABELV $1259
endproc ForceJump 72 12
export WP_AddAsMindtricked
proc WP_AddAsMindtricked 4 0
line 2357
;2355:
;2356:void WP_AddAsMindtricked(forcedata_t *fd, int entNum)
;2357:{
line 2358
;2358:	if (!fd)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1287
line 2359
;2359:	{
line 2360
;2360:		return;
ADDRGP4 $1286
JUMPV
LABELV $1287
line 2363
;2361:	}
;2362:
;2363:	if (entNum > 47)
ADDRFP4 4
INDIRI4
CNSTI4 47
LEI4 $1289
line 2364
;2364:	{
line 2365
;2365:		fd->forceMindtrickTargetIndex4 |= (1 << (entNum-48));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 48
SUBI4
LSHI4
BORI4
ASGNI4
line 2366
;2366:	}
ADDRGP4 $1290
JUMPV
LABELV $1289
line 2367
;2367:	else if (entNum > 31)
ADDRFP4 4
INDIRI4
CNSTI4 31
LEI4 $1291
line 2368
;2368:	{
line 2369
;2369:		fd->forceMindtrickTargetIndex3 |= (1 << (entNum-32));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 392
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 32
SUBI4
LSHI4
BORI4
ASGNI4
line 2370
;2370:	}
ADDRGP4 $1292
JUMPV
LABELV $1291
line 2371
;2371:	else if (entNum > 15)
ADDRFP4 4
INDIRI4
CNSTI4 15
LEI4 $1293
line 2372
;2372:	{
line 2373
;2373:		fd->forceMindtrickTargetIndex2 |= (1 << (entNum-16));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 16
SUBI4
LSHI4
BORI4
ASGNI4
line 2374
;2374:	}
ADDRGP4 $1294
JUMPV
LABELV $1293
line 2376
;2375:	else
;2376:	{
line 2377
;2377:		fd->forceMindtrickTargetIndex |= (1 << entNum);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BORI4
ASGNI4
line 2378
;2378:	}
LABELV $1294
LABELV $1292
LABELV $1290
line 2379
;2379:}
LABELV $1286
endproc WP_AddAsMindtricked 4 0
export ForceTelepathy
proc ForceTelepathy 5404 28
line 2382
;2380:
;2381:void ForceTelepathy(gentity_t *self)
;2382:{
line 2393
;2383:	trace_t tr;
;2384:	vec3_t tfrom, tto, fwd, thispush_org, a;
;2385:	vec3_t mins, maxs, fwdangles, forward, right, center;
;2386:	int i, e;
;2387:	int entityList[MAX_GENTITIES];
;2388:	int numListedEntities;
;2389:	int gotatleastone;
;2390:	float visionArc;
;2391:	float radius;
;2392:	gentity_t *ent; 
;2393:	int		nowTime = LEVELTIME(self->client);
ADDRLP4 5348
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 5348
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1300
ADDRLP4 5348
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1300
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1302
ADDRLP4 5344
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1303
JUMPV
LABELV $1302
ADDRLP4 5344
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1303
ADDRLP4 5340
ADDRLP4 5344
INDIRI4
ASGNI4
ADDRGP4 $1301
JUMPV
LABELV $1300
ADDRLP4 5340
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1301
ADDRLP4 5272
ADDRLP4 5340
INDIRI4
ASGNI4
line 2395
;2394:
;2395:	visionArc = 0;
ADDRLP4 5288
CNSTF4 0
ASGNF4
line 2397
;2396:
;2397:	radius = MAX_TRICK_DISTANCE;
ADDRLP4 12
CNSTF4 1140850688
ASGNF4
line 2399
;2398:
;2399:	gotatleastone = 0;
ADDRLP4 4164
CNSTI4 0
ASGNI4
line 2401
;2400:
;2401:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1304
line 2402
;2402:	{
line 2403
;2403:		return;
ADDRGP4 $1295
JUMPV
LABELV $1304
line 2406
;2404:	}
;2405:
;2406:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1306
line 2407
;2407:	{
line 2408
;2408:		return;
ADDRGP4 $1295
JUMPV
LABELV $1306
line 2411
;2409:	}
;2410:
;2411:	if (self->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1308
line 2412
;2412:	{
line 2413
;2413:		return;
ADDRGP4 $1295
JUMPV
LABELV $1308
line 2416
;2414:	}
;2415:
;2416:	if (self->client->ps.powerups[PW_REDFLAG] ||
ADDRLP4 5352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 5356
CNSTI4 0
ASGNI4
ADDRLP4 5352
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
ADDRLP4 5356
INDIRI4
NEI4 $1312
ADDRLP4 5352
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 5356
INDIRI4
EQI4 $1310
LABELV $1312
line 2418
;2417:		self->client->ps.powerups[PW_BLUEFLAG])
;2418:	{ //can't mindtrick while carrying the flag
line 2419
;2419:		return;
ADDRGP4 $1295
JUMPV
LABELV $1310
line 2422
;2420:	}
;2421:
;2422:	if (self->client->ps.forceAllowDeactivateTime < nowTime &&
ADDRLP4 5360
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 5360
INDIRP4
CNSTI4 1328
ADDP4
INDIRI4
ADDRLP4 5272
INDIRI4
GEI4 $1313
ADDRLP4 5360
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1313
line 2424
;2423:		(self->client->ps.fd.forcePowersActive & (1 << FP_TELEPATHY)) )
;2424:	{
line 2425
;2425:		WP_ForcePowerStop( self, FP_TELEPATHY );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 2426
;2426:		return;
ADDRGP4 $1295
JUMPV
LABELV $1313
line 2429
;2427:	}
;2428:
;2429:	if ( !WP_ForcePowerUsable( self, FP_TELEPATHY ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 5364
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 5364
INDIRI4
CNSTI4 0
NEI4 $1315
line 2430
;2430:	{
line 2431
;2431:		return;
ADDRGP4 $1295
JUMPV
LABELV $1315
line 2434
;2432:	}
;2433:
;2434:	if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1317
line 2435
;2435:	{
line 2436
;2436:		visionArc = 360;
ADDRLP4 5288
CNSTF4 1135869952
ASGNF4
line 2437
;2437:	}
ADDRGP4 $1318
JUMPV
LABELV $1317
line 2438
;2438:	else if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1319
line 2439
;2439:	{
line 2440
;2440:		visionArc = 360;
ADDRLP4 5288
CNSTF4 1135869952
ASGNF4
line 2441
;2441:	}
LABELV $1319
LABELV $1318
line 2443
;2442:
;2443:	VectorCopy( self->client->ps.viewangles, fwdangles );
ADDRLP4 5304
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2444
;2444:	AngleVectors( fwdangles, forward, right, NULL );
ADDRLP4 5304
ARGP4
ADDRLP4 5316
ARGP4
ADDRLP4 5328
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2445
;2445:	VectorCopy( self->client->ps.origin, center );
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2447
;2446:
;2447:	for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1321
line 2448
;2448:	{
line 2449
;2449:		mins[i] = center[i] - radius;
ADDRLP4 5368
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 5368
INDIRI4
ADDRLP4 4128
ADDP4
ADDRLP4 5368
INDIRI4
ADDRLP4 16
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 2450
;2450:		maxs[i] = center[i] + radius;
ADDRLP4 5372
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 5372
INDIRI4
ADDRLP4 4140
ADDP4
ADDRLP4 5372
INDIRI4
ADDRLP4 16
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 2451
;2451:	}
LABELV $1322
line 2447
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1321
line 2453
;2452:
;2453:	if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1325
line 2454
;2454:	{
line 2455
;2455:		VectorCopy(self->client->ps.origin, tfrom);
ADDRLP4 5276
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2456
;2456:		tfrom[2] += self->client->ps.viewheight;
ADDRLP4 5276+8
ADDRLP4 5276+8
INDIRF4
ADDRFP4 0
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
line 2457
;2457:		AngleVectors(self->client->ps.viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 5292
ARGP4
ADDRLP4 5368
CNSTP4 0
ASGNP4
ADDRLP4 5368
INDIRP4
ARGP4
ADDRLP4 5368
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2458
;2458:		tto[0] = tfrom[0] + fwd[0]*radius/2;
ADDRLP4 4152
ADDRLP4 5276
INDIRF4
ADDRLP4 5292
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 2459
;2459:		tto[1] = tfrom[1] + fwd[1]*radius/2;
ADDRLP4 4152+4
ADDRLP4 5276+4
INDIRF4
ADDRLP4 5292+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 2460
;2460:		tto[2] = tfrom[2] + fwd[2]*radius/2;
ADDRLP4 4152+8
ADDRLP4 5276+8
INDIRF4
ADDRLP4 5292+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 2462
;2461:
;2462:		JP_Trace(&tr, tfrom, NULL, NULL, tto, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 4192
ARGP4
ADDRLP4 5276
ARGP4
ADDRLP4 5372
CNSTP4 0
ASGNP4
ADDRLP4 5372
INDIRP4
ARGP4
ADDRLP4 5372
INDIRP4
ARGP4
ADDRLP4 4152
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2464
;2463:
;2464:		if (tr.fraction != 1.0 &&
ADDRLP4 4192+8
INDIRF4
CNSTF4 1065353216
EQF4 $1295
ADDRLP4 4192+52
INDIRI4
CNSTI4 1023
EQI4 $1295
ADDRLP4 5376
CNSTI4 2352
ASGNI4
ADDRLP4 5380
CNSTI4 0
ASGNI4
ADDRLP4 5376
INDIRI4
ADDRLP4 4192+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 5380
INDIRI4
EQI4 $1295
ADDRLP4 5376
INDIRI4
ADDRLP4 4192+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1295
ADDRLP4 5376
INDIRI4
ADDRLP4 4192+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ADDRLP4 5380
INDIRI4
EQI4 $1295
ADDRLP4 5376
INDIRI4
ADDRLP4 4192+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1295
line 2470
;2465:			tr.entityNum != ENTITYNUM_NONE &&
;2466:			g_entities[tr.entityNum].inuse &&
;2467:			g_entities[tr.entityNum].client &&
;2468:			g_entities[tr.entityNum].client->pers.connected &&
;2469:			g_entities[tr.entityNum].client->sess.sessionTeam != TEAM_SPECTATOR)
;2470:		{
line 2471
;2471:			WP_AddAsMindtricked(&self->client->ps.fd, tr.entityNum);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 4192+52
INDIRI4
ARGI4
ADDRGP4 WP_AddAsMindtricked
CALLV
pop
line 2472
;2472:			WP_ForcePowerStart( self, FP_TELEPATHY, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 2474
;2473:
;2474:			G_Sound( self, CHAN_AUTO, G_SoundIndex("sound/weapons/force/distract.wav") );
ADDRGP4 $1347
ARGP4
ADDRLP4 5384
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 5384
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2476
;2475:
;2476:			self->client->ps.forceHandExtend = HANDEXTEND_FORCEPUSH;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 1
ASGNI4
line 2477
;2477:			self->client->ps.forceHandExtendTime = nowTime + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 5272
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2479
;2478:
;2479:			return;
ADDRGP4 $1295
JUMPV
line 2482
;2480:		}
;2481:		else
;2482:		{
line 2483
;2483:			return;
LABELV $1325
line 2486
;2484:		}
;2485:	}
;2486:	else if (self->client->ps.fd.forcePowerLevel[FP_TELEPATHY] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1348
line 2487
;2487:	{ //Level 3 tricks everyone on the level..
line 2489
;2488:		gentity_t *ent;
;2489:		qboolean gotAtLeastOne = qfalse;
ADDRLP4 5372
CNSTI4 0
ASGNI4
line 2491
;2490:
;2491:		e = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1351
JUMPV
LABELV $1350
line 2494
;2492:
;2493:		while (e < MAX_CLIENTS)
;2494:		{
line 2495
;2495:			ent = &g_entities[e];
ADDRLP4 5368
CNSTI4 2352
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2496
;2496:			e++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2498
;2497:
;2498:			if (ent && ent->inuse && ent->client)
ADDRLP4 5380
CNSTU4 0
ASGNU4
ADDRLP4 5368
INDIRP4
CVPU4 4
ADDRLP4 5380
INDIRU4
EQU4 $1353
ADDRLP4 5368
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1353
ADDRLP4 5368
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 5380
INDIRU4
EQU4 $1353
line 2499
;2499:			{
line 2500
;2500:				if (!ForcePowerUsableOn(self, ent, FP_TELEPATHY))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 5368
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 5384
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 5384
INDIRI4
CNSTI4 0
NEI4 $1355
line 2501
;2501:				{
line 2502
;2502:					continue;
ADDRGP4 $1351
JUMPV
LABELV $1355
line 2505
;2503:				}
;2504:				
;2505:				if (OnSameTeam(self, ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 5368
INDIRP4
ARGP4
ADDRLP4 5388
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 5388
INDIRI4
CNSTI4 0
EQI4 $1357
line 2506
;2506:				{
line 2507
;2507:					continue;
ADDRGP4 $1351
JUMPV
LABELV $1357
line 2510
;2508:				}
;2509:
;2510:				if (self == ent)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 5368
INDIRP4
CVPU4 4
NEU4 $1359
line 2511
;2511:				{
line 2512
;2512:					continue;
ADDRGP4 $1351
JUMPV
LABELV $1359
line 2515
;2513:				}
;2514:
;2515:				if (self->s.number == ent->s.number)
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 5368
INDIRP4
INDIRI4
NEI4 $1361
line 2516
;2516:				{
line 2517
;2517:					continue;
ADDRGP4 $1351
JUMPV
LABELV $1361
line 2520
;2518:				}
;2519:
;2520:				if (!ent->client->pers.connected)
ADDRLP4 5368
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1363
line 2521
;2521:				{
line 2522
;2522:					continue;
ADDRGP4 $1351
JUMPV
LABELV $1363
line 2525
;2523:				}
;2524:
;2525:				if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 5368
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1365
line 2526
;2526:				{
line 2527
;2527:					continue;
ADDRGP4 $1351
JUMPV
LABELV $1365
line 2530
;2528:				}
;2529:
;2530:				if (!trap_InPVS(self->client->ps.origin, ent->client->ps.origin))
ADDRLP4 5392
CNSTI4 408
ASGNI4
ADDRLP4 5396
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 5392
INDIRI4
ADDP4
INDIRP4
ADDRLP4 5396
INDIRI4
ADDP4
ARGP4
ADDRLP4 5368
INDIRP4
ADDRLP4 5392
INDIRI4
ADDP4
INDIRP4
ADDRLP4 5396
INDIRI4
ADDP4
ARGP4
ADDRLP4 5400
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 5400
INDIRI4
CNSTI4 0
NEI4 $1367
line 2531
;2531:				{
line 2532
;2532:					continue;
ADDRGP4 $1351
JUMPV
LABELV $1367
line 2535
;2533:				}
;2534:
;2535:				WP_AddAsMindtricked(&self->client->ps.fd, ent->s.number);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 5368
INDIRP4
INDIRI4
ARGI4
ADDRGP4 WP_AddAsMindtricked
CALLV
pop
line 2536
;2536:				gotAtLeastOne = qtrue;
ADDRLP4 5372
CNSTI4 1
ASGNI4
line 2537
;2537:			}
LABELV $1353
line 2538
;2538:		}
LABELV $1351
line 2493
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $1350
line 2540
;2539:
;2540:		if (gotAtLeastOne)
ADDRLP4 5372
INDIRI4
CNSTI4 0
EQI4 $1295
line 2541
;2541:		{
line 2542
;2542:			self->client->ps.forceAllowDeactivateTime = nowTime + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRLP4 5272
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 2544
;2543:
;2544:			WP_ForcePowerStart( self, FP_TELEPATHY, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 2546
;2545:
;2546:			G_Sound( self, CHAN_AUTO, G_SoundIndex("sound/weapons/force/distract.wav") );
ADDRGP4 $1347
ARGP4
ADDRLP4 5376
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 5376
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2548
;2547:
;2548:			self->client->ps.forceHandExtend = HANDEXTEND_FORCEPUSH;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 1
ASGNI4
line 2549
;2549:			self->client->ps.forceHandExtendTime = nowTime + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 5272
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2550
;2550:		}
line 2552
;2551:
;2552:		return;
ADDRGP4 $1295
JUMPV
LABELV $1348
line 2555
;2553:	}
;2554:	else
;2555:	{
line 2556
;2556:		numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 4128
ARGP4
ADDRLP4 4140
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 5368
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4124
ADDRLP4 5368
INDIRI4
ASGNI4
line 2558
;2557:
;2558:		e = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1372
JUMPV
LABELV $1371
line 2561
;2559:
;2560:		while (e < numListedEntities)
;2561:		{
line 2562
;2562:			ent = &g_entities[entityList[e]];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2564
;2563:
;2564:			if (ent)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1374
line 2565
;2565:			{
line 2566
;2566:				if (ent->client)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1376
line 2567
;2567:				{
line 2568
;2568:					VectorCopy(ent->client->ps.origin, thispush_org);
ADDRLP4 4180
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2569
;2569:				}
ADDRGP4 $1377
JUMPV
LABELV $1376
line 2571
;2570:				else
;2571:				{
line 2572
;2572:					VectorCopy(ent->s.pos.trBase, thispush_org);
ADDRLP4 4180
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2573
;2573:				}
LABELV $1377
line 2574
;2574:			}
LABELV $1374
line 2576
;2575:
;2576:			if (ent)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1378
line 2577
;2577:			{ //not in the arc, don't consider it
line 2578
;2578:				VectorCopy(self->client->ps.origin, tto);
ADDRLP4 4152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2579
;2579:				tto[2] += self->client->ps.viewheight;
ADDRLP4 4152+8
ADDRLP4 4152+8
INDIRF4
ADDRFP4 0
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
line 2580
;2580:				VectorSubtract(thispush_org, tto, a);
ADDRLP4 4168
ADDRLP4 4180
INDIRF4
ADDRLP4 4152
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4168+4
ADDRLP4 4180+4
INDIRF4
ADDRLP4 4152+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4168+8
ADDRLP4 4180+8
INDIRF4
ADDRLP4 4152+8
INDIRF4
SUBF4
ASGNF4
line 2581
;2581:				vectoangles(a, a);
ADDRLP4 4168
ARGP4
ADDRLP4 4168
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2583
;2582:
;2583:				if (!ent->client)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1387
line 2584
;2584:				{
line 2585
;2585:					entityList[e] = ENTITYNUM_NONE;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
ADDP4
CNSTI4 1023
ASGNI4
line 2586
;2586:				}
ADDRGP4 $1388
JUMPV
LABELV $1387
line 2587
;2587:				else if (!InFieldOfVision(self->client->ps.viewangles, visionArc, a))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 5288
INDIRF4
ARGF4
ADDRLP4 4168
ARGP4
ADDRLP4 5372
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 5372
INDIRI4
CNSTI4 0
NEI4 $1389
line 2588
;2588:				{ //only bother with arc rules if the victim is a client
line 2589
;2589:					entityList[e] = ENTITYNUM_NONE;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
ADDP4
CNSTI4 1023
ASGNI4
line 2590
;2590:				}
ADDRGP4 $1390
JUMPV
LABELV $1389
line 2591
;2591:				else if (!ForcePowerUsableOn(self, ent, FP_TELEPATHY))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 5376
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 5376
INDIRI4
CNSTI4 0
NEI4 $1391
line 2592
;2592:				{
line 2593
;2593:					entityList[e] = ENTITYNUM_NONE;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
ADDP4
CNSTI4 1023
ASGNI4
line 2594
;2594:				}
ADDRGP4 $1392
JUMPV
LABELV $1391
line 2595
;2595:				else if (OnSameTeam(self, ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 5380
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 5380
INDIRI4
CNSTI4 0
EQI4 $1393
line 2596
;2596:				{
line 2597
;2597:					entityList[e] = ENTITYNUM_NONE;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
ADDP4
CNSTI4 1023
ASGNI4
line 2598
;2598:				}
LABELV $1393
LABELV $1392
LABELV $1390
LABELV $1388
line 2599
;2599:			}
LABELV $1378
line 2600
;2600:			e++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2601
;2601:		}
LABELV $1372
line 2560
ADDRLP4 8
INDIRI4
ADDRLP4 4124
INDIRI4
LTI4 $1371
line 2602
;2602:	}
line 2604
;2603:
;2604:	e = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1396
JUMPV
LABELV $1395
line 2607
;2605:
;2606:	while (e < numListedEntities)
;2607:	{
line 2608
;2608:		ent = &g_entities[entityList[e]];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2610
;2609:
;2610:		if (ent && ent != self && ent->client)
ADDRLP4 5372
ADDRLP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 5376
CNSTU4 0
ASGNU4
ADDRLP4 5372
INDIRU4
ADDRLP4 5376
INDIRU4
EQU4 $1398
ADDRLP4 5372
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $1398
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 5376
INDIRU4
EQU4 $1398
line 2611
;2611:		{
line 2612
;2612:			gotatleastone = 1;
ADDRLP4 4164
CNSTI4 1
ASGNI4
line 2613
;2613:			WP_AddAsMindtricked(&self->client->ps.fd, ent->s.number);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRGP4 WP_AddAsMindtricked
CALLV
pop
line 2614
;2614:		}
LABELV $1398
line 2616
;2615:
;2616:		e++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2617
;2617:	}
LABELV $1396
line 2606
ADDRLP4 8
INDIRI4
ADDRLP4 4124
INDIRI4
LTI4 $1395
line 2619
;2618:
;2619:	if (gotatleastone)
ADDRLP4 4164
INDIRI4
CNSTI4 0
EQI4 $1400
line 2620
;2620:	{
line 2621
;2621:		self->client->ps.forceAllowDeactivateTime = nowTime + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1328
ADDP4
ADDRLP4 5272
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 2623
;2622:
;2623:		WP_ForcePowerStart( self, FP_TELEPATHY, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 2625
;2624:
;2625:		G_Sound( self, CHAN_AUTO, G_SoundIndex("sound/weapons/force/distract.wav") );
ADDRGP4 $1347
ARGP4
ADDRLP4 5368
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 5368
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2627
;2626:
;2627:		self->client->ps.forceHandExtend = HANDEXTEND_FORCEPUSH;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 1
ASGNI4
line 2628
;2628:		self->client->ps.forceHandExtendTime = nowTime + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 5272
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2629
;2629:	}
LABELV $1400
line 2630
;2630:}
LABELV $1295
endproc ForceTelepathy 5404 28
export GEntity_UseFunc
proc GEntity_UseFunc 4 12
line 2633
;2631:
;2632:void GEntity_UseFunc( gentity_t *self, gentity_t *other, gentity_t *activator )
;2633:{
line 2634
;2634:	self->use(self, other, activator);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CALLV
pop
line 2635
;2635:}
LABELV $1402
endproc GEntity_UseFunc 4 12
export CanCounterThrow
proc CanCounterThrow 24 8
line 2638
;2636:
;2637:qboolean CanCounterThrow(gentity_t *self, qboolean pull)
;2638:{
line 2639
;2639:	int powerUse = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2640
;2640:	int		nowTime = LEVELTIME(self->client);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1408
ADDRLP4 16
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1408
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1410
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1411
JUMPV
LABELV $1410
ADDRLP4 12
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1411
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $1409
JUMPV
LABELV $1408
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1409
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 2642
;2641:
;2642:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1412
line 2643
;2643:	{
line 2644
;2644:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1403
JUMPV
LABELV $1412
line 2647
;2645:	}
;2646:
;2647:	if (self->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1414
line 2648
;2648:	{
line 2649
;2649:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1403
JUMPV
LABELV $1414
line 2652
;2650:	}
;2651:
;2652:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1416
line 2653
;2653:	{
line 2654
;2654:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1403
JUMPV
LABELV $1416
line 2657
;2655:	}
;2656:
;2657:	if ( self->client->ps.powerups[PW_DISINT_4] > nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 380
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $1418
line 2658
;2658:	{
line 2659
;2659:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1403
JUMPV
LABELV $1418
line 2662
;2660:	}
;2661:
;2662:	if (pull)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1420
line 2663
;2663:	{
line 2664
;2664:		powerUse = FP_PULL;
ADDRLP4 0
CNSTI4 4
ASGNI4
line 2665
;2665:	}
ADDRGP4 $1421
JUMPV
LABELV $1420
line 2667
;2666:	else
;2667:	{
line 2668
;2668:		powerUse = FP_PUSH;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 2669
;2669:	}
LABELV $1421
line 2671
;2670:
;2671:	if ( !WP_ForcePowerUsable( self, powerUse ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $1422
line 2672
;2672:	{
line 2673
;2673:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1403
JUMPV
LABELV $1422
line 2676
;2674:	}
;2675:
;2676:	if (self->client->ps.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1424
line 2677
;2677:	{ //you cannot counter a push/pull if you're in the air
line 2678
;2678:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1403
JUMPV
LABELV $1424
line 2681
;2679:	}
;2680:
;2681:	return 1;
CNSTI4 1
RETI4
LABELV $1403
endproc CanCounterThrow 24 8
export G_InGetUpAnim
proc G_InGetUpAnim 16 0
line 2685
;2682:}
;2683:
;2684:qboolean G_InGetUpAnim(playerState_t *ps)
;2685:{
line 2686
;2686:	switch( (ps->legsAnim&~ANIM_TOGGLEBIT) )
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
CNSTI4 929
LTI4 $1427
ADDRLP4 0
INDIRI4
CNSTI4 942
GTI4 $1427
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1431-3716
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1431
address $1430
address $1430
address $1430
address $1430
address $1430
address $1427
address $1427
address $1430
address $1430
address $1430
address $1430
address $1430
address $1430
address $1430
code
line 2687
;2687:	{
LABELV $1430
line 2700
;2688:	case BOTH_GETUP1:
;2689:	case BOTH_GETUP2:
;2690:	case BOTH_GETUP3:
;2691:	case BOTH_GETUP4:
;2692:	case BOTH_GETUP5:
;2693:	case BOTH_FORCE_GETUP_F1:
;2694:	case BOTH_FORCE_GETUP_F2:
;2695:	case BOTH_FORCE_GETUP_B1:
;2696:	case BOTH_FORCE_GETUP_B2:
;2697:	case BOTH_FORCE_GETUP_B3:
;2698:	case BOTH_FORCE_GETUP_B4:
;2699:	case BOTH_FORCE_GETUP_B5:
;2700:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1426
JUMPV
LABELV $1427
line 2703
;2701:	}
;2702:
;2703:	switch( (ps->torsoAnim&~ANIM_TOGGLEBIT) )
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 929
LTI4 $1433
ADDRLP4 8
INDIRI4
CNSTI4 942
GTI4 $1433
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1437-3716
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1437
address $1436
address $1436
address $1436
address $1436
address $1436
address $1433
address $1433
address $1436
address $1436
address $1436
address $1436
address $1436
address $1436
address $1436
code
line 2704
;2704:	{
LABELV $1436
line 2717
;2705:	case BOTH_GETUP1:
;2706:	case BOTH_GETUP2:
;2707:	case BOTH_GETUP3:
;2708:	case BOTH_GETUP4:
;2709:	case BOTH_GETUP5:
;2710:	case BOTH_FORCE_GETUP_F1:
;2711:	case BOTH_FORCE_GETUP_F2:
;2712:	case BOTH_FORCE_GETUP_B1:
;2713:	case BOTH_FORCE_GETUP_B2:
;2714:	case BOTH_FORCE_GETUP_B3:
;2715:	case BOTH_FORCE_GETUP_B4:
;2716:	case BOTH_FORCE_GETUP_B5:
;2717:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1426
JUMPV
LABELV $1433
line 2720
;2718:	}
;2719:
;2720:	return qfalse;
CNSTI4 0
RETI4
LABELV $1426
endproc G_InGetUpAnim 16 0
export G_LetGoOfWall
proc G_LetGoOfWall 36 4
line 2724
;2721:}
;2722:
;2723:void G_LetGoOfWall(gentity_t* ent)
;2724:{
line 2725
;2725:	if (!ent || !ent->client)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $1442
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $1440
LABELV $1442
line 2726
;2726:	{
line 2727
;2727:		return;
ADDRGP4 $1439
JUMPV
LABELV $1440
line 2729
;2728:	}
;2729:	ent->client->ps.pm_flags &= ~PMF_STUCK_TO_WALL;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 2730
;2730:	if (!ent->client->sess.raceMode || !(ent->client->sess.raceStyle.runFlags & RFL_CLIMBTECH)) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1445
ADDRLP4 12
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 256
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $1443
LABELV $1445
line 2731
;2731:		return;
ADDRGP4 $1439
JUMPV
LABELV $1443
line 2733
;2732:	}
;2733:	if (BG_InReboundJump(ent->client->ps.legsAnim)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_InReboundJump
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $1448
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_InReboundHold
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1446
LABELV $1448
line 2735
;2734:		|| BG_InReboundHold(ent->client->ps.legsAnim))
;2735:	{
line 2736
;2736:		ent->client->ps.legsTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 2737
;2737:	}
LABELV $1446
line 2738
;2738:	if (BG_InReboundJump(ent->client->ps.torsoAnim)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_InReboundJump
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1451
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_InReboundHold
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1449
LABELV $1451
line 2740
;2739:		|| BG_InReboundHold(ent->client->ps.torsoAnim))
;2740:	{
line 2741
;2741:		ent->client->ps.torsoTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 2742
;2742:	}
LABELV $1449
line 2743
;2743:}
LABELV $1439
endproc G_LetGoOfWall 36 4
lit
align 4
LABELV $1453
byte 4 0
skip 8
export ForceThrow
code
proc ForceThrow 9696 28
line 2747
;2744:
;2745:extern void Touch_Button(gentity_t *ent, gentity_t *other, trace_t *trace );
;2746:void ForceThrow( gentity_t *self, qboolean pull )
;2747:{
line 2757
;2748:	//shove things in front of you away
;2749:	float		dist;
;2750:	gentity_t	*ent;
;2751:	int			entityList[MAX_GENTITIES];
;2752:	gentity_t	*push_list[MAX_GENTITIES];
;2753:	int			numListedEntities;
;2754:	vec3_t		mins, maxs;
;2755:	vec3_t		v;
;2756:	int			i, e;
;2757:	int			ent_count = 0;
ADDRLP4 9364
CNSTI4 0
ASGNI4
line 2758
;2758:	int			radius = 1024; //since it's view-based now. //350;
ADDRLP4 9360
CNSTI4 1024
ASGNI4
line 2763
;2759:	int			powerLevel;
;2760:	int			visionArc;
;2761:	int			pushPower;
;2762:	int			pushPowerMod;
;2763:	vec3_t		center, ent_org, size, forward, right, end, dir, fwdangles = {0};
ADDRLP4 9476
ADDRGP4 $1453
INDIRB
ASGNB 12
line 2770
;2764:	float		dot1;
;2765:	trace_t		tr;
;2766:	int			x;
;2767:	vec3_t		pushDir;
;2768:	vec3_t		thispush_org;
;2769:	vec3_t		tfrom, tto, fwd, a;
;2770:	int			powerUse = 0; 
ADDRLP4 9396
CNSTI4 0
ASGNI4
line 2771
;2771:	int		nowTime = LEVELTIME(self->client);
ADDRLP4 9544
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9544
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1458
ADDRLP4 9544
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1458
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1460
ADDRLP4 9540
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1461
JUMPV
LABELV $1460
ADDRLP4 9540
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1461
ADDRLP4 9536
ADDRLP4 9540
INDIRI4
ASGNI4
ADDRGP4 $1459
JUMPV
LABELV $1458
ADDRLP4 9536
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1459
ADDRLP4 9468
ADDRLP4 9536
INDIRI4
ASGNI4
line 2773
;2772:
;2773:	visionArc = 0;
ADDRLP4 9472
CNSTI4 0
ASGNI4
line 2775
;2774:
;2775:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE && ((self->client->ps.forceHandExtend != HANDEXTEND_KNOCKDOWN || !G_InGetUpAnim(&self->client->ps)) || jk2gameplay != VERSION_1_04))
ADDRLP4 9548
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9552
ADDRLP4 9548
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 9552
INDIRI4
CNSTI4 0
EQI4 $1462
ADDRLP4 9552
INDIRI4
CNSTI4 8
NEI4 $1464
ADDRLP4 9548
INDIRP4
ARGP4
ADDRLP4 9556
ADDRGP4 G_InGetUpAnim
CALLI4
ASGNI4
ADDRLP4 9556
INDIRI4
CNSTI4 0
EQI4 $1464
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $1462
LABELV $1464
line 2776
;2776:	{
line 2777
;2777:		return;
ADDRGP4 $1452
JUMPV
LABELV $1462
line 2780
;2778:	}
;2779:
;2780:	if (!g_useWhileThrowing.integer && self->client->ps.saberInFlight)
ADDRLP4 9560
CNSTI4 0
ASGNI4
ADDRGP4 g_useWhileThrowing+12
INDIRI4
ADDRLP4 9560
INDIRI4
NEI4 $1465
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 9560
INDIRI4
EQI4 $1465
line 2781
;2781:	{
line 2782
;2782:		return;
ADDRGP4 $1452
JUMPV
LABELV $1465
line 2785
;2783:	}
;2784:
;2785:	if (self->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1468
line 2786
;2786:	{
line 2787
;2787:		return;
ADDRGP4 $1452
JUMPV
LABELV $1468
line 2790
;2788:	}
;2789:
;2790:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1470
line 2791
;2791:	{
line 2792
;2792:		return;
ADDRGP4 $1452
JUMPV
LABELV $1470
line 2794
;2793:	}
;2794:	if ( self->client->ps.powerups[PW_DISINT_4] > nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 380
ADDP4
INDIRI4
ADDRLP4 9468
INDIRI4
LEI4 $1472
line 2795
;2795:	{
line 2796
;2796:		return;
ADDRGP4 $1452
JUMPV
LABELV $1472
line 2798
;2797:	}
;2798:	if (pull)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1474
line 2799
;2799:	{
line 2800
;2800:		powerUse = FP_PULL;
ADDRLP4 9396
CNSTI4 4
ASGNI4
line 2801
;2801:	}
ADDRGP4 $1475
JUMPV
LABELV $1474
line 2803
;2802:	else
;2803:	{
line 2804
;2804:		powerUse = FP_PUSH;
ADDRLP4 9396
CNSTI4 3
ASGNI4
line 2805
;2805:	}
LABELV $1475
line 2807
;2806:
;2807:	if ( !WP_ForcePowerUsable( self, powerUse ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 9396
INDIRI4
ARGI4
ADDRLP4 9564
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 9564
INDIRI4
CNSTI4 0
NEI4 $1476
line 2808
;2808:	{
line 2809
;2809:		return;
ADDRGP4 $1452
JUMPV
LABELV $1476
line 2812
;2810:	}
;2811:
;2812:	if (!pull && self->client->ps.saberLockTime > nowTime && self->client->ps.saberLockFrame)
ADDRLP4 9568
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 9568
INDIRI4
NEI4 $1478
ADDRLP4 9572
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9572
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRLP4 9468
INDIRI4
LEI4 $1478
ADDRLP4 9572
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ADDRLP4 9568
INDIRI4
EQI4 $1478
line 2813
;2813:	{
line 2814
;2814:		G_Sound( self, CHAN_BODY, G_SoundIndex( "sound/weapons/force/push.wav" ) );
ADDRGP4 $1480
ARGP4
ADDRLP4 9576
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 9576
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2815
;2815:		self->client->ps.powerups[PW_DISINT_4] = nowTime + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 9468
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 2817
;2816:
;2817:		self->client->ps.saberLockHits += self->client->ps.fd.forcePowerLevel[FP_PUSH]*2;
ADDRLP4 9580
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9584
ADDRLP4 9580
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 9584
INDIRP4
ADDRLP4 9584
INDIRP4
INDIRI4
ADDRLP4 9580
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDI4
ASGNI4
line 2819
;2818:
;2819:		WP_ForcePowerStart( self, FP_PUSH, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 2820
;2820:		return;
ADDRGP4 $1452
JUMPV
LABELV $1478
line 2823
;2821:	}
;2822:
;2823:	WP_ForcePowerStart( self, powerUse, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 9396
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 2826
;2824:
;2825:	//make sure this plays and that you cannot press fire for about 1 second after this
;2826:	if ( pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1481
line 2827
;2827:	{
line 2828
;2828:		G_Sound( self, CHAN_BODY, G_SoundIndex( "sound/weapons/force/pull.wav" ) );
ADDRGP4 $1483
ARGP4
ADDRLP4 9576
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 9576
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2829
;2829:		if (self->client->ps.forceHandExtend == HANDEXTEND_NONE || jk2gameplay != VERSION_1_04)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1486
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $1484
LABELV $1486
line 2830
;2830:		{
line 2831
;2831:			self->client->ps.forceHandExtend = HANDEXTEND_FORCEPULL;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 2
ASGNI4
line 2832
;2832:			self->client->ps.forceHandExtendTime = nowTime + 400;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 9468
INDIRI4
CNSTI4 400
ADDI4
ASGNI4
line 2833
;2833:		}
LABELV $1484
line 2834
;2834:		if ( jk2gameplay == VERSION_1_04 ) self->client->ps.powerups[PW_DISINT_4] = self->client->ps.forceHandExtendTime + 200;
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1482
ADDRLP4 9580
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9580
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 9580
INDIRP4
CNSTI4 1252
ADDP4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 2835
;2835:	}
ADDRGP4 $1482
JUMPV
LABELV $1481
line 2837
;2836:	else
;2837:	{
line 2838
;2838:		G_Sound( self, CHAN_BODY, G_SoundIndex( "sound/weapons/force/push.wav" ) );
ADDRGP4 $1480
ARGP4
ADDRLP4 9576
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 9576
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2839
;2839:		if (self->client->ps.forceHandExtend == HANDEXTEND_NONE || jk2gameplay != VERSION_1_04)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1491
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $1489
LABELV $1491
line 2840
;2840:		{
line 2841
;2841:			self->client->ps.forceHandExtend = HANDEXTEND_FORCEPUSH;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 1
ASGNI4
line 2842
;2842:			self->client->ps.forceHandExtendTime = nowTime + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 9468
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2843
;2843:		}
ADDRGP4 $1490
JUMPV
LABELV $1489
line 2844
;2844:		else if (self->client->ps.forceHandExtend == HANDEXTEND_KNOCKDOWN && G_InGetUpAnim(&self->client->ps))
ADDRLP4 9580
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9580
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1492
ADDRLP4 9580
INDIRP4
ARGP4
ADDRLP4 9584
ADDRGP4 G_InGetUpAnim
CALLI4
ASGNI4
ADDRLP4 9584
INDIRI4
CNSTI4 0
EQI4 $1492
line 2845
;2845:		{
line 2846
;2846:			if (self->client->ps.forceDodgeAnim > 4)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 4
LEI4 $1494
line 2847
;2847:			{
line 2848
;2848:				self->client->ps.forceDodgeAnim -= 8;
ADDRLP4 9588
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
ASGNP4
ADDRLP4 9588
INDIRP4
ADDRLP4 9588
INDIRP4
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 2849
;2849:			}
LABELV $1494
line 2850
;2850:			self->client->ps.forceDodgeAnim += 8; //special case, play push on upper torso, but keep playing current knockdown anim on legs
ADDRLP4 9588
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
ASGNP4
ADDRLP4 9588
INDIRP4
ADDRLP4 9588
INDIRP4
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 2851
;2851:		}
LABELV $1492
LABELV $1490
line 2852
;2852:		if ( jk2gameplay == VERSION_1_04 ) self->client->ps.powerups[PW_DISINT_4] = nowTime + 1100;
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1496
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 9468
INDIRI4
CNSTI4 1100
ADDI4
ASGNI4
LABELV $1496
line 2853
;2853:	}
LABELV $1482
line 2854
;2854:	if ( jk2gameplay != VERSION_1_04 ) self->client->ps.powerups[PW_DISINT_4] = self->client->ps.forceHandExtendTime + 200;
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $1498
ADDRLP4 9576
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9576
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 9576
INDIRP4
CNSTI4 1252
ADDP4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
LABELV $1498
line 2856
;2855:
;2856:	VectorCopy( self->client->ps.viewangles, fwdangles );
ADDRLP4 9476
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2857
;2857:	AngleVectors( fwdangles, forward, right, NULL );
ADDRLP4 9476
ARGP4
ADDRLP4 9348
ARGP4
ADDRLP4 9524
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2858
;2858:	VectorCopy( self->client->ps.origin, center );
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2860
;2859:
;2860:	for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1500
line 2861
;2861:	{
line 2862
;2862:		mins[i] = center[i] - radius;
ADDRLP4 9580
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9580
INDIRI4
ADDRLP4 9436
ADDP4
ADDRLP4 9580
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 2863
;2863:		maxs[i] = center[i] + radius;
ADDRLP4 9584
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9584
INDIRI4
ADDRLP4 9448
ADDP4
ADDRLP4 9584
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2864
;2864:	}
LABELV $1501
line 2860
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1500
line 2867
;2865:
;2866:
;2867:	if (pull)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1504
line 2868
;2868:	{
line 2869
;2869:		powerLevel = self->client->ps.fd.forcePowerLevel[FP_PULL];
ADDRLP4 9428
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 960
ADDP4
INDIRI4
ASGNI4
line 2870
;2870:		pushPower = 256*self->client->ps.fd.forcePowerLevel[FP_PULL];
ADDRLP4 9464
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 960
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ASGNI4
line 2871
;2871:	}
ADDRGP4 $1505
JUMPV
LABELV $1504
line 2873
;2872:	else
;2873:	{
line 2874
;2874:		powerLevel = self->client->ps.fd.forcePowerLevel[FP_PUSH];
ADDRLP4 9428
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
ASGNI4
line 2875
;2875:		pushPower = 256*self->client->ps.fd.forcePowerLevel[FP_PUSH];
ADDRLP4 9464
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ASGNI4
line 2876
;2876:	}
LABELV $1505
line 2878
;2877:
;2878:	if (!powerLevel)
ADDRLP4 9428
INDIRI4
CNSTI4 0
NEI4 $1506
line 2879
;2879:	{ //Shouldn't have made it here..
line 2880
;2880:		return;
ADDRGP4 $1452
JUMPV
LABELV $1506
line 2883
;2881:	}
;2882:
;2883:	if (powerLevel == FORCE_LEVEL_2)
ADDRLP4 9428
INDIRI4
CNSTI4 2
NEI4 $1508
line 2884
;2884:	{
line 2885
;2885:		visionArc = 60;
ADDRLP4 9472
CNSTI4 60
ASGNI4
line 2886
;2886:	}
ADDRGP4 $1509
JUMPV
LABELV $1508
line 2887
;2887:	else if (powerLevel == FORCE_LEVEL_3)
ADDRLP4 9428
INDIRI4
CNSTI4 3
NEI4 $1510
line 2888
;2888:	{
line 2889
;2889:		visionArc = 180;
ADDRLP4 9472
CNSTI4 180
ASGNI4
line 2890
;2890:	}
LABELV $1510
LABELV $1509
line 2892
;2891:
;2892:	if (powerLevel == FORCE_LEVEL_1)
ADDRLP4 9428
INDIRI4
CNSTI4 1
NEI4 $1512
line 2893
;2893:	{ //can only push/pull targeted things at level 1
line 2894
;2894:		VectorCopy(self->client->ps.origin, tfrom);
ADDRLP4 9488
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2895
;2895:		tfrom[2] += self->client->ps.viewheight;
ADDRLP4 9488+8
ADDRLP4 9488+8
INDIRF4
ADDRFP4 0
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
line 2896
;2896:		AngleVectors(self->client->ps.viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 9512
ARGP4
ADDRLP4 9580
CNSTP4 0
ASGNP4
ADDRLP4 9580
INDIRP4
ARGP4
ADDRLP4 9580
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2897
;2897:		tto[0] = tfrom[0] + fwd[0]*radius/2;
ADDRLP4 9416
ADDRLP4 9488
INDIRF4
ADDRLP4 9512
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 2898
;2898:		tto[1] = tfrom[1] + fwd[1]*radius/2;
ADDRLP4 9416+4
ADDRLP4 9488+4
INDIRF4
ADDRLP4 9512+4
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 2899
;2899:		tto[2] = tfrom[2] + fwd[2]*radius/2;
ADDRLP4 9416+8
ADDRLP4 9488+8
INDIRF4
ADDRLP4 9512+8
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
MULF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 2901
;2900:
;2901:		JP_Trace(&tr, tfrom, NULL, NULL, tto, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 8268
ARGP4
ADDRLP4 9488
ARGP4
ADDRLP4 9584
CNSTP4 0
ASGNP4
ADDRLP4 9584
INDIRP4
ARGP4
ADDRLP4 9584
INDIRP4
ARGP4
ADDRLP4 9416
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2903
;2902:
;2903:		if (tr.fraction != 1.0 &&
ADDRLP4 8268+8
INDIRF4
CNSTF4 1065353216
EQF4 $1452
ADDRLP4 8268+52
INDIRI4
CNSTI4 1023
EQI4 $1452
line 2905
;2904:			tr.entityNum != ENTITYNUM_NONE)
;2905:		{
line 2906
;2906:			if (!g_entities[tr.entityNum].client && g_entities[tr.entityNum].s.eType == ET_GRAPPLE)
ADDRLP4 9588
CNSTI4 2352
ASGNI4
ADDRLP4 9588
INDIRI4
ADDRLP4 8268+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1525
ADDRLP4 9588
INDIRI4
ADDRLP4 8268+52
INDIRI4
MULI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1525
line 2907
;2907:			{ //g2animent
line 2908
;2908:				if (g_entities[tr.entityNum].s.genericenemyindex < level.time)
CNSTI4 2352
ADDRLP4 8268+52
INDIRI4
MULI4
ADDRGP4 g_entities+172
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1531
line 2909
;2909:				{
line 2910
;2910:					g_entities[tr.entityNum].s.genericenemyindex = level.time + 2000;
CNSTI4 2352
ADDRLP4 8268+52
INDIRI4
MULI4
ADDRGP4 g_entities+172
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2911
;2911:				}
LABELV $1531
line 2912
;2912:			}
LABELV $1525
line 2914
;2913:
;2914:			numListedEntities = 0;
ADDRLP4 9400
CNSTI4 0
ASGNI4
line 2915
;2915:			entityList[numListedEntities] = tr.entityNum;
ADDRLP4 9400
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
ADDRLP4 8268+52
INDIRI4
ASGNI4
line 2916
;2916:			numListedEntities++;
ADDRLP4 9400
ADDRLP4 9400
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2917
;2917:		}
line 2919
;2918:		else
;2919:		{
line 2921
;2920:			//didn't get anything, so just
;2921:			return;
line 2923
;2922:		}
;2923:	}
ADDRGP4 $1513
JUMPV
LABELV $1512
line 2925
;2924:	else
;2925:	{
line 2926
;2926:		numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 9436
ARGP4
ADDRLP4 9448
ARGP4
ADDRLP4 4172
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 9580
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 9400
ADDRLP4 9580
INDIRI4
ASGNI4
line 2928
;2927:
;2928:		e = 0;
ADDRLP4 4144
CNSTI4 0
ASGNI4
ADDRGP4 $1541
JUMPV
LABELV $1540
line 2931
;2929:
;2930:		while (e < numListedEntities)
;2931:		{
line 2932
;2932:			ent = &g_entities[entityList[e]];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 4144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2934
;2933:
;2934:			if (!ent->client && ent->s.eType == ET_GRAPPLE)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1543
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1543
line 2935
;2935:			{ //g2animent
line 2936
;2936:				if (ent->s.genericenemyindex < level.time)
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1545
line 2937
;2937:				{
line 2938
;2938:					ent->s.genericenemyindex = level.time + 2000;
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2939
;2939:				}
LABELV $1545
line 2940
;2940:			}
LABELV $1543
line 2942
;2941:
;2942:			if (ent)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1549
line 2943
;2943:			{
line 2944
;2944:				if (ent->client)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1551
line 2945
;2945:				{
line 2946
;2946:					VectorCopy(ent->client->ps.origin, thispush_org);
ADDRLP4 9368
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2947
;2947:				}
ADDRGP4 $1552
JUMPV
LABELV $1551
line 2949
;2948:				else
;2949:				{
line 2950
;2950:					VectorCopy(ent->s.pos.trBase, thispush_org);
ADDRLP4 9368
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2951
;2951:				}
LABELV $1552
line 2952
;2952:			}
LABELV $1549
line 2954
;2953:
;2954:			if (ent)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1553
line 2955
;2955:			{ //not in the arc, don't consider it
line 2956
;2956:				VectorCopy(self->client->ps.origin, tto);
ADDRLP4 9416
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2957
;2957:				tto[2] += self->client->ps.viewheight;
ADDRLP4 9416+8
ADDRLP4 9416+8
INDIRF4
ADDRFP4 0
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
line 2958
;2958:				VectorSubtract(thispush_org, tto, a);
ADDRLP4 9404
ADDRLP4 9368
INDIRF4
ADDRLP4 9416
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9404+4
ADDRLP4 9368+4
INDIRF4
ADDRLP4 9416+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9404+8
ADDRLP4 9368+8
INDIRF4
ADDRLP4 9416+8
INDIRF4
SUBF4
ASGNF4
line 2959
;2959:				vectoangles(a, a);
ADDRLP4 9404
ARGP4
ADDRLP4 9404
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2961
;2960:
;2961:				if (ent->client && !InFieldOfVision(self->client->ps.viewangles, visionArc, a) &&
ADDRLP4 9588
CNSTI4 408
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 9588
INDIRI4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1562
ADDRFP4 0
INDIRP4
ADDRLP4 9588
INDIRI4
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 9472
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 9404
ARGP4
ADDRLP4 9592
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 9592
INDIRI4
CNSTI4 0
NEI4 $1562
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 9396
INDIRI4
ARGI4
ADDRLP4 9596
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 9596
INDIRI4
CNSTI4 0
EQI4 $1562
line 2963
;2962:					ForcePowerUsableOn(self, ent, powerUse))
;2963:				{ //only bother with arc rules if the victim is a client
line 2964
;2964:					entityList[e] = ENTITYNUM_NONE;
ADDRLP4 4144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
CNSTI4 1023
ASGNI4
line 2965
;2965:				}
ADDRGP4 $1563
JUMPV
LABELV $1562
line 2966
;2966:				else if (ent->client)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1564
line 2967
;2967:				{
line 2968
;2968:					if (pull)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1566
line 2969
;2969:					{
line 2970
;2970:						if (!ForcePowerUsableOn(self, ent, FP_PULL))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 9600
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 9600
INDIRI4
CNSTI4 0
NEI4 $1567
line 2971
;2971:						{
line 2972
;2972:							entityList[e] = ENTITYNUM_NONE;
ADDRLP4 4144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
CNSTI4 1023
ASGNI4
line 2973
;2973:						}
line 2974
;2974:					}
ADDRGP4 $1567
JUMPV
LABELV $1566
line 2976
;2975:					else
;2976:					{
line 2977
;2977:						if (!ForcePowerUsableOn(self, ent, FP_PUSH))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 9600
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 9600
INDIRI4
CNSTI4 0
NEI4 $1570
line 2978
;2978:						{
line 2979
;2979:							entityList[e] = ENTITYNUM_NONE;
ADDRLP4 4144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
CNSTI4 1023
ASGNI4
line 2980
;2980:						}
LABELV $1570
line 2981
;2981:					}
LABELV $1567
line 2982
;2982:				}
LABELV $1564
LABELV $1563
line 2983
;2983:			}
LABELV $1553
line 2984
;2984:			e++;
ADDRLP4 4144
ADDRLP4 4144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2985
;2985:		}
LABELV $1541
line 2930
ADDRLP4 4144
INDIRI4
ADDRLP4 9400
INDIRI4
LTI4 $1540
line 2986
;2986:	}
LABELV $1513
line 2988
;2987:
;2988:	for ( e = 0 ; e < numListedEntities ; e++ ) 
ADDRLP4 4144
CNSTI4 0
ASGNI4
ADDRGP4 $1575
JUMPV
LABELV $1572
line 2989
;2989:	{
line 2990
;2990:		if (entityList[e] != ENTITYNUM_NONE &&
ADDRLP4 9580
ADDRLP4 4144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
INDIRI4
ASGNI4
ADDRLP4 9580
INDIRI4
CNSTI4 1023
EQI4 $1576
ADDRLP4 9580
INDIRI4
CNSTI4 0
LTI4 $1576
ADDRLP4 9580
INDIRI4
CNSTI4 1024
GEI4 $1576
line 2993
;2991:			entityList[e] >= 0 &&
;2992:			entityList[e] < MAX_GENTITIES)
;2993:		{
line 2994
;2994:			ent = &g_entities[entityList[e]];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 4144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4172
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2995
;2995:		}
ADDRGP4 $1577
JUMPV
LABELV $1576
line 2997
;2996:		else
;2997:		{
line 2998
;2998:			ent = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2999
;2999:		}
LABELV $1577
line 3001
;3000:
;3001:		if (!ent)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1578
line 3002
;3002:			continue;
ADDRGP4 $1573
JUMPV
LABELV $1578
line 3003
;3003:		if (ent == self)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $1580
line 3004
;3004:			continue;
ADDRGP4 $1573
JUMPV
LABELV $1580
line 3005
;3005:		if (ent->client && OnSameTeam(ent, self))
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1582
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 9588
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 9588
INDIRI4
CNSTI4 0
EQI4 $1582
line 3006
;3006:		{
line 3007
;3007:			continue;
ADDRGP4 $1573
JUMPV
LABELV $1582
line 3009
;3008:		}
;3009:		if ( !(ent->inuse) )
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1584
line 3010
;3010:			continue;
ADDRGP4 $1573
JUMPV
LABELV $1584
line 3011
;3011:		if ( ent->s.eType != ET_MISSILE )
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1586
line 3012
;3012:		{
line 3013
;3013:			if ( ent->s.eType != ET_ITEM )
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1587
line 3014
;3014:			{
line 3016
;3015:				//FIXME: need pushable objects
;3016:				if ( Q_stricmp( "func_button", ent->classname ) == 0 )
ADDRGP4 $1592
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 9592
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 9592
INDIRI4
CNSTI4 0
NEI4 $1590
line 3017
;3017:				{//we might push it
line 3018
;3018:					if ( pull || !(ent->spawnflags&SPF_BUTTON_FPUSHABLE) )
ADDRLP4 9596
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 9596
INDIRI4
NEI4 $1595
ADDRLP4 4
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 9596
INDIRI4
NEI4 $1587
LABELV $1595
line 3019
;3019:					{//not force-pushable, never pullable
line 3020
;3020:						continue;
ADDRGP4 $1573
JUMPV
line 3022
;3021:					}
;3022:				}
LABELV $1590
line 3024
;3023:				else
;3024:				{
line 3025
;3025:					if ( ent->s.eFlags & EF_NODRAW )
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1596
line 3026
;3026:					{
line 3027
;3027:						continue;
ADDRGP4 $1573
JUMPV
LABELV $1596
line 3029
;3028:					}
;3029:					if ( !ent->client )
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1587
line 3030
;3030:					{
line 3031
;3031:						if ( Q_stricmp( "lightsaber", ent->classname ) != 0 )
ADDRGP4 $1602
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 9596
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 9596
INDIRI4
CNSTI4 0
EQI4 $1587
line 3032
;3032:						{//not a lightsaber 
line 3033
;3033:							if ( Q_stricmp( "func_door", ent->classname ) != 0 || !(ent->spawnflags & 2/*MOVER_FORCE_ACTIVATE*/) )
ADDRGP4 $1605
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 9600
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 9604
CNSTI4 0
ASGNI4
ADDRLP4 9600
INDIRI4
ADDRLP4 9604
INDIRI4
NEI4 $1606
ADDRLP4 4
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 9604
INDIRI4
NEI4 $1603
LABELV $1606
line 3034
;3034:							{//not a force-usable door
line 3035
;3035:								if ( Q_stricmp( "limb", ent->classname ) )
ADDRGP4 $1609
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 9608
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 9608
INDIRI4
CNSTI4 0
EQI4 $1587
line 3036
;3036:								{//not a limb
line 3037
;3037:									continue;
ADDRGP4 $1573
JUMPV
line 3039
;3038:								}
;3039:							}
LABELV $1603
line 3040
;3040:							else if ( ent->moverState != MOVER_POS1 && ent->moverState != MOVER_POS2 )
ADDRLP4 9608
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ASGNI4
ADDRLP4 9608
INDIRI4
CNSTI4 0
EQI4 $1587
ADDRLP4 9608
INDIRI4
CNSTI4 1
EQI4 $1587
line 3041
;3041:							{//not at rest
line 3042
;3042:								continue;
ADDRGP4 $1573
JUMPV
line 3044
;3043:							}
;3044:						}
line 3045
;3045:					}
line 3046
;3046:				}
line 3047
;3047:			}
line 3048
;3048:		}
LABELV $1586
line 3050
;3049:		else
;3050:		{
line 3051
;3051:			if ( ent->s.pos.trType == TR_STATIONARY && (ent->s.eFlags&EF_MISSILE_STICK) )
ADDRLP4 9596
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 9596
INDIRI4
NEI4 $1612
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
ADDRLP4 9596
INDIRI4
EQI4 $1612
line 3052
;3052:			{//can't force-push/pull stuck missiles (detpacks, tripmines)
line 3053
;3053:				continue;
ADDRGP4 $1573
JUMPV
LABELV $1612
line 3055
;3054:			}
;3055:			if ( ent->s.pos.trType == TR_STATIONARY && ent->s.weapon != WP_THERMAL )
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1614
ADDRLP4 4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 11
EQI4 $1614
line 3056
;3056:			{//only thermal detonators can be pushed once stopped
line 3057
;3057:				continue;
ADDRGP4 $1573
JUMPV
LABELV $1614
line 3059
;3058:			}
;3059:		}
LABELV $1587
line 3063
;3060:
;3061:		//this is all to see if we need to start a saber attack, if it's in flight, this doesn't matter
;3062:		// find the distance from the edge of the bounding box
;3063:		for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1616
line 3064
;3064:		{
line 3065
;3065:			if ( center[i] < ent->r.absmin[i] ) 
ADDRLP4 9592
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9592
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
ADDRLP4 9592
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
GEF4 $1620
line 3066
;3066:			{
line 3067
;3067:				v[i] = ent->r.absmin[i] - center[i];
ADDRLP4 9596
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9596
INDIRI4
ADDRLP4 4120
ADDP4
ADDRLP4 9596
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 9596
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3068
;3068:			} else if ( center[i] > ent->r.absmax[i] ) 
ADDRGP4 $1621
JUMPV
LABELV $1620
ADDRLP4 9596
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9596
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
ADDRLP4 9596
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
LEF4 $1622
line 3069
;3069:			{
line 3070
;3070:				v[i] = center[i] - ent->r.absmax[i];
ADDRLP4 9600
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 9600
INDIRI4
ADDRLP4 4120
ADDP4
ADDRLP4 9600
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
ADDRLP4 9600
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3071
;3071:			} else 
ADDRGP4 $1623
JUMPV
LABELV $1622
line 3072
;3072:			{
line 3073
;3073:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4120
ADDP4
CNSTF4 0
ASGNF4
line 3074
;3074:			}
LABELV $1623
LABELV $1621
line 3075
;3075:		}
LABELV $1617
line 3063
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1616
line 3077
;3076:
;3077:		VectorSubtract( ent->r.absmax, ent->r.absmin, size );
ADDRLP4 4160
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4160+4
ADDRLP4 4
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4160+8
ADDRLP4 4
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3078
;3078:		VectorMA( ent->r.absmin, 0.5, size, ent_org );
ADDRLP4 9604
CNSTF4 1056964608
ASGNF4
ADDRLP4 4132
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 9604
INDIRF4
ADDRLP4 4160
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4132+4
ADDRLP4 4
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 9604
INDIRF4
ADDRLP4 4160+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4132+8
ADDRLP4 4
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 4160+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3080
;3079:
;3080:		VectorSubtract( ent_org, center, dir );
ADDRLP4 4148
ADDRLP4 4132
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4148+4
ADDRLP4 4132+4
INDIRF4
ADDRLP4 8+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4148+8
ADDRLP4 4132+8
INDIRF4
ADDRLP4 8+8
INDIRF4
SUBF4
ASGNF4
line 3081
;3081:		VectorNormalize( dir );
ADDRLP4 4148
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3082
;3082:		if ( (dot1 = DotProduct( dir, forward )) < 0.6 )
ADDRLP4 9608
ADDRLP4 4148
INDIRF4
ADDRLP4 9348
INDIRF4
MULF4
ADDRLP4 4148+4
INDIRF4
ADDRLP4 9348+4
INDIRF4
MULF4
ADDF4
ADDRLP4 4148+8
INDIRF4
ADDRLP4 9348+8
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 9460
ADDRLP4 9608
INDIRF4
ASGNF4
ADDRLP4 9608
INDIRF4
CNSTF4 1058642330
GEF4 $1636
line 3083
;3083:			continue;
ADDRGP4 $1573
JUMPV
LABELV $1636
line 3085
;3084:
;3085:		dist = VectorLength( v );
ADDRLP4 4120
ARGP4
ADDRLP4 9612
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 9380
ADDRLP4 9612
INDIRF4
ASGNF4
line 3090
;3086:
;3087:		//Now check and see if we can actually deflect it
;3088:		//method1
;3089:		//if within a certain range, deflect it
;3090:		if ( dist >= radius ) 
ADDRLP4 9380
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
LTF4 $1642
line 3091
;3091:		{
line 3092
;3092:			continue;
ADDRGP4 $1573
JUMPV
LABELV $1642
line 3096
;3093:		}
;3094:	
;3095:		//in PVS?
;3096:		if ( !ent->r.bmodel && !trap_InPVS( ent_org, self->client->ps.origin ) )
ADDRLP4 4
INDIRP4
CNSTI4 312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1644
ADDRLP4 4132
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9616
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 9616
INDIRI4
CNSTI4 0
NEI4 $1644
line 3097
;3097:		{//must be in PVS
line 3098
;3098:			continue;
ADDRGP4 $1573
JUMPV
LABELV $1644
line 3102
;3099:		}
;3100:
;3101:		//really should have a clear LOS to this thing...
;3102:		JP_Trace( &tr, self->client->ps.origin, vec3_origin, vec3_origin, ent_org, self->s.number, MASK_SHOT );
ADDRLP4 8268
ARGP4
ADDRLP4 9620
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9620
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9624
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 9624
INDIRP4
ARGP4
ADDRLP4 9624
INDIRP4
ARGP4
ADDRLP4 4132
ARGP4
ADDRLP4 9620
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3103
;3103:		if ( tr.fraction < 1.0f && tr.entityNum != ent->s.number )
ADDRLP4 8268+8
INDIRF4
CNSTF4 1065353216
GEF4 $1646
ADDRLP4 8268+52
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
EQI4 $1646
line 3104
;3104:		{//must have clear LOS
line 3105
;3105:			continue;
ADDRGP4 $1573
JUMPV
LABELV $1646
line 3109
;3106:		}
;3107:
;3108:		// ok, we are within the radius, add us to the incoming list
;3109:		push_list[ent_count] = ent;
ADDRLP4 9364
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 3110
;3110:		ent_count++;
ADDRLP4 9364
ADDRLP4 9364
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3111
;3111:	}
LABELV $1573
line 2988
ADDRLP4 4144
ADDRLP4 4144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1575
ADDRLP4 4144
INDIRI4
ADDRLP4 9400
INDIRI4
LTI4 $1572
line 3113
;3112:
;3113:	if ( ent_count )
ADDRLP4 9364
INDIRI4
CNSTI4 0
EQI4 $1650
line 3114
;3114:	{
line 3116
;3115:		//method1:
;3116:		for ( x = 0; x < ent_count; x++ )
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $1655
JUMPV
LABELV $1652
line 3117
;3117:		{
line 3118
;3118:			int modPowerLevel = powerLevel;
ADDRLP4 9580
ADDRLP4 9428
INDIRI4
ASGNI4
line 3121
;3119:
;3120:	
;3121:			if (push_list[x]->client)
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1656
line 3122
;3122:			{
line 3123
;3123:				modPowerLevel = WP_AbsorbConversion(push_list[x], push_list[x]->client->ps.fd.forcePowerLevel[FP_ABSORB], self, powerUse, powerLevel, forcePowerNeeded[self->client->ps.fd.forcePowerLevel[powerUse]][powerUse]);
ADDRLP4 9584
CNSTI4 2
ASGNI4
ADDRLP4 9588
ADDRLP4 20
INDIRI4
ADDRLP4 9584
INDIRI4
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9588
INDIRP4
ARGP4
ADDRLP4 9592
CNSTI4 408
ASGNI4
ADDRLP4 9588
INDIRP4
ADDRLP4 9592
INDIRI4
ADDP4
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
ARGI4
ADDRLP4 9596
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9596
INDIRP4
ARGP4
ADDRLP4 9396
INDIRI4
ARGI4
ADDRLP4 9428
INDIRI4
ARGI4
ADDRLP4 9604
ADDRLP4 9396
INDIRI4
ADDRLP4 9584
INDIRI4
LSHI4
ASGNI4
ADDRLP4 9604
INDIRI4
CNSTI4 72
ADDRLP4 9604
INDIRI4
ADDRLP4 9596
INDIRP4
ADDRLP4 9592
INDIRI4
ADDP4
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
ARGI4
ADDRLP4 9608
ADDRGP4 WP_AbsorbConversion
CALLI4
ASGNI4
ADDRLP4 9580
ADDRLP4 9608
INDIRI4
ASGNI4
line 3124
;3124:				if (modPowerLevel == -1)
ADDRLP4 9580
INDIRI4
CNSTI4 -1
NEI4 $1658
line 3125
;3125:				{
line 3126
;3126:					modPowerLevel = powerLevel;
ADDRLP4 9580
ADDRLP4 9428
INDIRI4
ASGNI4
line 3127
;3127:				}
LABELV $1658
line 3128
;3128:			}
LABELV $1656
line 3130
;3129:
;3130:			pushPower = 256*modPowerLevel;
ADDRLP4 9464
ADDRLP4 9580
INDIRI4
CNSTI4 8
LSHI4
ASGNI4
line 3132
;3131:
;3132:			if (push_list[x]->client)
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1660
line 3133
;3133:			{
line 3134
;3134:				VectorCopy(push_list[x]->client->ps.origin, thispush_org);
ADDRLP4 9368
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3135
;3135:			}
ADDRGP4 $1661
JUMPV
LABELV $1660
line 3137
;3136:			else
;3137:			{
line 3138
;3138:				VectorCopy(push_list[x]->s.origin, thispush_org);
ADDRLP4 9368
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3139
;3139:			}
LABELV $1661
line 3141
;3140:
;3141:			if ( push_list[x]->client )
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1662
line 3142
;3142:			{//FIXME: make enemy jedi able to hunker down and resist this?
line 3143
;3143:				int otherPushPower = push_list[x]->client->ps.fd.forcePowerLevel[powerUse];
ADDRLP4 9596
CNSTI4 2
ASGNI4
ADDRLP4 9584
ADDRLP4 9396
INDIRI4
ADDRLP4 9596
INDIRI4
LSHI4
ADDRLP4 20
INDIRI4
ADDRLP4 9596
INDIRI4
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
ASGNI4
line 3144
;3144:				qboolean canPullWeapon = qtrue;
ADDRLP4 9592
CNSTI4 1
ASGNI4
line 3145
;3145:				float dirLen = 0;
ADDRLP4 9588
CNSTF4 0
ASGNF4
line 3147
;3146:
;3147:				if (g_debugMelee.integer && push_list[x]->client->sess.raceMode && (push_list[x]->client->sess.raceStyle.runFlags & RFL_CLIMBTECH))
ADDRLP4 9600
CNSTI4 0
ASGNI4
ADDRGP4 g_debugMelee+12
INDIRI4
ADDRLP4 9600
INDIRI4
EQI4 $1664
ADDRLP4 9604
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9604
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 9600
INDIRI4
EQI4 $1664
ADDRLP4 9604
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 256
BANDI4
ADDRLP4 9600
INDIRI4
EQI4 $1664
line 3148
;3148:				{
line 3149
;3149:					if ((push_list[x]->client->ps.pm_flags & PMF_STUCK_TO_WALL))
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $1667
line 3150
;3150:					{//no resistance if stuck to wall
line 3152
;3151:						//push/pull them off the wall
;3152:						otherPushPower = 0;
ADDRLP4 9584
CNSTI4 0
ASGNI4
line 3153
;3153:						G_LetGoOfWall(push_list[x]);
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_LetGoOfWall
CALLV
pop
line 3154
;3154:					}
LABELV $1667
line 3155
;3155:				}
LABELV $1664
line 3157
;3156:
;3157:				pushPowerMod = pushPower;
ADDRLP4 9432
ADDRLP4 9464
INDIRI4
ASGNI4
line 3159
;3158:
;3159:				if (push_list[x]->client->pers.cmd.forwardmove ||
ADDRLP4 9608
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9612
CNSTI4 0
ASGNI4
ADDRLP4 9608
INDIRP4
CNSTI4 1408
ADDP4
INDIRI1
CVII4 1
ADDRLP4 9612
INDIRI4
NEI4 $1671
ADDRLP4 9608
INDIRP4
CNSTI4 1409
ADDP4
INDIRI1
CVII4 1
ADDRLP4 9612
INDIRI4
EQI4 $1669
LABELV $1671
line 3161
;3160:					push_list[x]->client->pers.cmd.rightmove)
;3161:				{ //if you are moving, you get one less level of defense
line 3162
;3162:					otherPushPower--;
ADDRLP4 9584
ADDRLP4 9584
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3164
;3163:
;3164:					if (otherPushPower < 0)
ADDRLP4 9584
INDIRI4
CNSTI4 0
GEI4 $1672
line 3165
;3165:					{
line 3166
;3166:						otherPushPower = 0;
ADDRLP4 9584
CNSTI4 0
ASGNI4
line 3167
;3167:					}
LABELV $1672
line 3168
;3168:				}
LABELV $1669
line 3170
;3169:
;3170:				if (otherPushPower && CanCounterThrow(push_list[x], pull))
ADDRLP4 9584
INDIRI4
CNSTI4 0
EQI4 $1674
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 9616
ADDRGP4 CanCounterThrow
CALLI4
ASGNI4
ADDRLP4 9616
INDIRI4
CNSTI4 0
EQI4 $1674
line 3171
;3171:				{
line 3172
;3172:					if ( pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1676
line 3173
;3173:					{
line 3174
;3174:						G_Sound( push_list[x], CHAN_BODY, G_SoundIndex( "sound/weapons/force/pull.wav" ) );
ADDRGP4 $1483
ARGP4
ADDRLP4 9620
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 9620
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 3175
;3175:						push_list[x]->client->ps.forceHandExtend = HANDEXTEND_FORCEPULL;
ADDRLP4 9624
CNSTI4 2
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 9624
INDIRI4
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
ADDRLP4 9624
INDIRI4
ASGNI4
line 3176
;3176:						push_list[x]->client->ps.forceHandExtendTime = LEVELTIME(push_list[x]->client) + 400;
ADDRLP4 9636
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9636
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1682
ADDRLP4 9636
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1682
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1684
ADDRLP4 9632
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1685
JUMPV
LABELV $1684
ADDRLP4 9632
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1685
ADDRLP4 9628
ADDRLP4 9632
INDIRI4
ASGNI4
ADDRGP4 $1683
JUMPV
LABELV $1682
ADDRLP4 9628
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1683
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 9628
INDIRI4
CNSTI4 400
ADDI4
ASGNI4
line 3177
;3177:					}
ADDRGP4 $1677
JUMPV
LABELV $1676
line 3179
;3178:					else
;3179:					{
line 3180
;3180:						G_Sound( push_list[x], CHAN_BODY, G_SoundIndex( "sound/weapons/force/push.wav" ) );
ADDRGP4 $1480
ARGP4
ADDRLP4 9620
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 9620
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 3181
;3181:						push_list[x]->client->ps.forceHandExtend = HANDEXTEND_FORCEPUSH;
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 1
ASGNI4
line 3182
;3182:						push_list[x]->client->ps.forceHandExtendTime = LEVELTIME(push_list[x]->client) + 1000;
ADDRLP4 9632
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9632
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1690
ADDRLP4 9632
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1690
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1692
ADDRLP4 9628
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1693
JUMPV
LABELV $1692
ADDRLP4 9628
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1693
ADDRLP4 9624
ADDRLP4 9628
INDIRI4
ASGNI4
ADDRGP4 $1691
JUMPV
LABELV $1690
ADDRLP4 9624
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1691
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 9624
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 3183
;3183:					}
LABELV $1677
line 3184
;3184:					push_list[x]->client->ps.powerups[PW_DISINT_4] = push_list[x]->client->ps.forceHandExtendTime + 200;
ADDRLP4 9620
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9620
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 9620
INDIRP4
CNSTI4 1252
ADDP4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 3188
;3185:
;3186:					//Make a counter-throw effect
;3187:
;3188:					if (otherPushPower >= modPowerLevel)
ADDRLP4 9584
INDIRI4
ADDRLP4 9580
INDIRI4
LTI4 $1694
line 3189
;3189:					{
line 3190
;3190:						pushPowerMod = 0;
ADDRLP4 9432
CNSTI4 0
ASGNI4
line 3191
;3191:						canPullWeapon = qfalse;
ADDRLP4 9592
CNSTI4 0
ASGNI4
line 3192
;3192:					}
ADDRGP4 $1695
JUMPV
LABELV $1694
line 3194
;3193:					else
;3194:					{
line 3195
;3195:						int powerDif = (modPowerLevel - otherPushPower);
ADDRLP4 9624
ADDRLP4 9580
INDIRI4
ADDRLP4 9584
INDIRI4
SUBI4
ASGNI4
line 3197
;3196:
;3197:						if (powerDif >= 3)
ADDRLP4 9624
INDIRI4
CNSTI4 3
LTI4 $1696
line 3198
;3198:						{
line 3199
;3199:							pushPowerMod -= pushPowerMod*0.2;
ADDRLP4 9628
ADDRLP4 9432
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 9432
ADDRLP4 9628
INDIRF4
CNSTF4 1045220557
ADDRLP4 9628
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 3200
;3200:						}
ADDRGP4 $1697
JUMPV
LABELV $1696
line 3201
;3201:						else if (powerDif == 2)
ADDRLP4 9624
INDIRI4
CNSTI4 2
NEI4 $1698
line 3202
;3202:						{
line 3203
;3203:							pushPowerMod -= pushPowerMod*0.4;
ADDRLP4 9628
ADDRLP4 9432
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 9432
ADDRLP4 9628
INDIRF4
CNSTF4 1053609165
ADDRLP4 9628
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 3204
;3204:						}
ADDRGP4 $1699
JUMPV
LABELV $1698
line 3205
;3205:						else if (powerDif == 1)
ADDRLP4 9624
INDIRI4
CNSTI4 1
NEI4 $1700
line 3206
;3206:						{
line 3207
;3207:							pushPowerMod -= pushPowerMod*0.8;
ADDRLP4 9628
ADDRLP4 9432
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 9432
ADDRLP4 9628
INDIRF4
CNSTF4 1061997773
ADDRLP4 9628
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 3208
;3208:						}
LABELV $1700
LABELV $1699
LABELV $1697
line 3210
;3209:
;3210:						if (pushPowerMod < 0)
ADDRLP4 9432
INDIRI4
CNSTI4 0
GEI4 $1702
line 3211
;3211:						{
line 3212
;3212:							pushPowerMod = 0;
ADDRLP4 9432
CNSTI4 0
ASGNI4
line 3213
;3213:						}
LABELV $1702
line 3214
;3214:					}
LABELV $1695
line 3215
;3215:				}
LABELV $1674
line 3218
;3216:
;3217:				//shove them
;3218:				if ( pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1704
line 3219
;3219:				{
line 3220
;3220:					VectorSubtract( self->client->ps.origin, thispush_org, pushDir );
ADDRLP4 9620
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 9384
ADDRLP4 9620
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 9368
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9384+4
ADDRLP4 9620
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 9368+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9384+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 9368+8
INDIRF4
SUBF4
ASGNF4
line 3222
;3221:
;3222:					if (push_list[x]->client && VectorLength(pushDir) <= 256)
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1705
ADDRLP4 9384
ARGP4
ADDRLP4 9624
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 9624
INDIRF4
CNSTF4 1132462080
GTF4 $1705
line 3223
;3223:					{
line 3224
;3224:						int randfact = 0;
ADDRLP4 9628
CNSTI4 0
ASGNI4
line 3226
;3225:
;3226:						if (modPowerLevel == FORCE_LEVEL_1)
ADDRLP4 9580
INDIRI4
CNSTI4 1
NEI4 $1712
line 3227
;3227:						{
line 3228
;3228:							randfact = 3;
ADDRLP4 9628
CNSTI4 3
ASGNI4
line 3229
;3229:						}
ADDRGP4 $1713
JUMPV
LABELV $1712
line 3230
;3230:						else if (modPowerLevel == FORCE_LEVEL_2)
ADDRLP4 9580
INDIRI4
CNSTI4 2
NEI4 $1714
line 3231
;3231:						{
line 3232
;3232:							randfact = 7;
ADDRLP4 9628
CNSTI4 7
ASGNI4
line 3233
;3233:						}
ADDRGP4 $1715
JUMPV
LABELV $1714
line 3234
;3234:						else if (modPowerLevel == FORCE_LEVEL_3)
ADDRLP4 9580
INDIRI4
CNSTI4 3
NEI4 $1716
line 3235
;3235:						{
line 3236
;3236:							randfact = 10;
ADDRLP4 9628
CNSTI4 10
ASGNI4
line 3237
;3237:						}
LABELV $1716
LABELV $1715
LABELV $1713
line 3240
;3238:
;3239:						// TODO what about racemode? dont have to care i guess
;3240:						if (!OnSameTeam(self, push_list[x]) && Q_irand(1, 10, self->client && self->client->sess.raceMode, 5) <= randfact && canPullWeapon)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 9636
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 9640
CNSTI4 0
ASGNI4
ADDRLP4 9636
INDIRI4
ADDRLP4 9640
INDIRI4
NEI4 $1705
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 9644
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9644
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1721
ADDRLP4 9644
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 9640
INDIRI4
EQI4 $1721
ADDRLP4 9632
CNSTI4 1
ASGNI4
ADDRGP4 $1722
JUMPV
LABELV $1721
ADDRLP4 9632
CNSTI4 0
ASGNI4
LABELV $1722
ADDRLP4 9632
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 9648
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 9648
INDIRI4
ADDRLP4 9628
INDIRI4
GTI4 $1705
ADDRLP4 9592
INDIRI4
CNSTI4 0
EQI4 $1705
line 3241
;3241:						{
line 3244
;3242:							vec3_t uorg, vecnorm;
;3243:
;3244:							VectorCopy(self->client->ps.origin, uorg);
ADDRLP4 9652
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3245
;3245:							uorg[2] += 64;
ADDRLP4 9652+8
ADDRLP4 9652+8
INDIRF4
CNSTF4 1115684864
ADDF4
ASGNF4
line 3247
;3246:
;3247:							VectorSubtract(uorg, thispush_org, vecnorm);
ADDRLP4 9664
ADDRLP4 9652
INDIRF4
ADDRLP4 9368
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9664+4
ADDRLP4 9652+4
INDIRF4
ADDRLP4 9368+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9664+8
ADDRLP4 9652+8
INDIRF4
ADDRLP4 9368+8
INDIRF4
SUBF4
ASGNF4
line 3248
;3248:							VectorNormalize(vecnorm);
ADDRLP4 9664
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3250
;3249:
;3250:							TossClientWeapon(push_list[x], vecnorm, 500);
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 9664
ARGP4
CNSTF4 1140457472
ARGF4
ADDRGP4 TossClientWeapon
CALLV
pop
line 3251
;3251:						}
line 3252
;3252:					}
line 3253
;3253:				}
ADDRGP4 $1705
JUMPV
LABELV $1704
line 3255
;3254:				else
;3255:				{
line 3256
;3256:					VectorSubtract( thispush_org, self->client->ps.origin, pushDir );
ADDRLP4 9620
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 9384
ADDRLP4 9368
INDIRF4
ADDRLP4 9620
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9384+4
ADDRLP4 9368+4
INDIRF4
ADDRLP4 9620
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9384+8
ADDRLP4 9368+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3257
;3257:				}
LABELV $1705
line 3259
;3258:
;3259:				if (modPowerLevel > otherPushPower && push_list[x]->client)
ADDRLP4 9580
INDIRI4
ADDRLP4 9584
INDIRI4
LEI4 $1734
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1734
line 3260
;3260:				{
line 3261
;3261:					if (modPowerLevel == FORCE_LEVEL_3 &&
ADDRLP4 9580
INDIRI4
CNSTI4 3
NEI4 $1736
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
EQI4 $1736
line 3263
;3262:						push_list[x]->client->ps.forceHandExtend != HANDEXTEND_KNOCKDOWN)
;3263:					{
line 3264
;3264:						dirLen = VectorLength(pushDir);
ADDRLP4 9384
ARGP4
ADDRLP4 9620
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 9588
ADDRLP4 9620
INDIRF4
ASGNF4
line 3266
;3265:
;3266:						if ( (dirLen <= (64*((modPowerLevel - otherPushPower)-1)) && jk2gameplay == VERSION_1_04)
ADDRLP4 9588
INDIRF4
ADDRLP4 9580
INDIRI4
ADDRLP4 9584
INDIRI4
SUBI4
CNSTI4 6
LSHI4
CNSTI4 64
SUBI4
CVIF4 4
GTF4 $1741
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $1740
LABELV $1741
ADDRLP4 9588
INDIRF4
CNSTF4 1124073472
GTF4 $1738
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $1738
LABELV $1740
line 3268
;3267:							|| (dirLen <= 128 && jk2gameplay != VERSION_1_04))
;3268:						{ //can only do a knockdown if fairly close
line 3269
;3269:							push_list[x]->client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 8
ASGNI4
line 3270
;3270:							if ( jk2gameplay == VERSION_1_04 ) push_list[x]->client->ps.forceHandExtendTime = LEVELTIME(push_list[x]->client) + 700;
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1742
ADDRLP4 9632
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9632
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1748
ADDRLP4 9632
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1748
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1750
ADDRLP4 9628
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1751
JUMPV
LABELV $1750
ADDRLP4 9628
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1751
ADDRLP4 9624
ADDRLP4 9628
INDIRI4
ASGNI4
ADDRGP4 $1749
JUMPV
LABELV $1748
ADDRLP4 9624
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1749
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 9624
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
ADDRGP4 $1743
JUMPV
LABELV $1742
line 3271
;3271:							else							   push_list[x]->client->ps.forceHandExtendTime = LEVELTIME(push_list[x]->client) + 1100;
ADDRLP4 9644
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9644
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1756
ADDRLP4 9644
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1756
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1758
ADDRLP4 9640
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1759
JUMPV
LABELV $1758
ADDRLP4 9640
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1759
ADDRLP4 9636
ADDRLP4 9640
INDIRI4
ASGNI4
ADDRGP4 $1757
JUMPV
LABELV $1756
ADDRLP4 9636
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1757
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 9636
INDIRI4
CNSTI4 1100
ADDI4
ASGNI4
LABELV $1743
line 3272
;3272:							push_list[x]->client->ps.forceDodgeAnim = 0; //this toggles between 1 and 0, when it's 1 we should play the get up anim
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 0
ASGNI4
line 3273
;3273:							push_list[x]->client->ps.quickerGetup = qtrue;
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1264
ADDP4
CNSTI4 1
ASGNI4
line 3274
;3274:						}
LABELV $1738
line 3275
;3275:					}
LABELV $1736
line 3276
;3276:				}
LABELV $1734
line 3278
;3277:
;3278:				if (!dirLen)
ADDRLP4 9588
INDIRF4
CNSTF4 0
NEF4 $1760
line 3279
;3279:				{
line 3280
;3280:					dirLen = VectorLength(pushDir);
ADDRLP4 9384
ARGP4
ADDRLP4 9620
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 9588
ADDRLP4 9620
INDIRF4
ASGNF4
line 3281
;3281:				}
LABELV $1760
line 3283
;3282:
;3283:				VectorNormalize(pushDir);
ADDRLP4 9384
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3285
;3284:
;3285:				if (push_list[x]->client)
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1663
line 3286
;3286:				{
line 3288
;3287:					//escape a force grip if we're in one
;3288:					if (self->client->ps.fd.forceGripBeingGripped > nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
INDIRF4
ADDRLP4 9468
INDIRI4
CVIF4 4
LEF4 $1764
line 3289
;3289:					{ //force the enemy to stop gripping me if I managed to push him
line 3290
;3290:						if (push_list[x]->client->ps.fd.forceGripEntityNum == self->s.number)
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $1766
line 3291
;3291:						{
line 3292
;3292:							if (modPowerLevel >= push_list[x]->client->ps.fd.forcePowerLevel[FP_GRIP])
ADDRLP4 9580
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
LTI4 $1768
line 3293
;3293:							{ //only break the grip if our push/pull level is >= their grip level
line 3294
;3294:								WP_ForcePowerStop(push_list[x], FP_GRIP);
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3295
;3295:								self->client->ps.fd.forceGripBeingGripped = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
CNSTF4 0
ASGNF4
line 3296
;3296:								push_list[x]->client->ps.fd.forceGripUseTime = LEVELTIME(push_list[x]->client) + 1000; //since we just broke out of it..
ADDRLP4 9628
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9628
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1774
ADDRLP4 9628
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1774
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1776
ADDRLP4 9624
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1777
JUMPV
LABELV $1776
ADDRLP4 9624
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1777
ADDRLP4 9620
ADDRLP4 9624
INDIRI4
ASGNI4
ADDRGP4 $1775
JUMPV
LABELV $1774
ADDRLP4 9620
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1775
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1124
ADDP4
ADDRLP4 9620
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 3297
;3297:							}
LABELV $1768
line 3298
;3298:						}
LABELV $1766
line 3299
;3299:					}
LABELV $1764
line 3301
;3300:
;3301:					push_list[x]->client->ps.otherKiller = self->s.number;
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3302
;3302:					push_list[x]->client->ps.otherKillerTime = LEVELTIME(push_list[x]->client) + 5000;
ADDRLP4 9628
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9628
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1782
ADDRLP4 9628
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1782
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1784
ADDRLP4 9624
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1785
JUMPV
LABELV $1784
ADDRLP4 9624
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1785
ADDRLP4 9620
ADDRLP4 9624
INDIRI4
ASGNI4
ADDRGP4 $1783
JUMPV
LABELV $1782
ADDRLP4 9620
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1783
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
ADDRLP4 9620
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 3303
;3303:					push_list[x]->client->ps.otherKillerDebounceTime = LEVELTIME(push_list[x]->client) + 100;
ADDRLP4 9640
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9640
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1790
ADDRLP4 9640
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1790
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1792
ADDRLP4 9636
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1793
JUMPV
LABELV $1792
ADDRLP4 9636
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1793
ADDRLP4 9632
ADDRLP4 9636
INDIRI4
ASGNI4
ADDRGP4 $1791
JUMPV
LABELV $1790
ADDRLP4 9632
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1791
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 9632
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3305
;3304:
;3305:					pushPowerMod -= (dirLen*0.7);
ADDRLP4 9432
ADDRLP4 9432
INDIRI4
CVIF4 4
CNSTF4 1060320051
ADDRLP4 9588
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 3306
;3306:					if (pushPowerMod < 16)
ADDRLP4 9432
INDIRI4
CNSTI4 16
GEI4 $1794
line 3307
;3307:					{
line 3308
;3308:						pushPowerMod = 16;
ADDRLP4 9432
CNSTI4 16
ASGNI4
line 3309
;3309:					}
LABELV $1794
line 3311
;3310:
;3311:					push_list[x]->client->ps.velocity[0] = pushDir[0]*pushPowerMod;
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 9384
INDIRF4
ADDRLP4 9432
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 3312
;3312:					push_list[x]->client->ps.velocity[1] = pushDir[1]*pushPowerMod;
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 9384+4
INDIRF4
ADDRLP4 9432
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 3314
;3313:
;3314:					if ((int)push_list[x]->client->ps.velocity[2] == 0)
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
CNSTI4 0
NEI4 $1797
line 3315
;3315:					{ //if not going anywhere vertically, boost them up a bit
line 3316
;3316:						push_list[x]->client->ps.velocity[2] = pushDir[2]*pushPowerMod;
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 9384+8
INDIRF4
ADDRLP4 9432
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 3318
;3317:
;3318:						if (push_list[x]->client->ps.velocity[2] < 128)
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1124073472
GEF4 $1663
line 3319
;3319:						{
line 3320
;3320:							push_list[x]->client->ps.velocity[2] = 128;
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1124073472
ASGNF4
line 3321
;3321:						}
line 3322
;3322:					}
ADDRGP4 $1663
JUMPV
LABELV $1797
line 3324
;3323:					else
;3324:					{
line 3325
;3325:						push_list[x]->client->ps.velocity[2] = pushDir[2]*pushPowerMod;
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 9384+8
INDIRF4
ADDRLP4 9432
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 3326
;3326:					}
line 3327
;3327:				}
line 3328
;3328:			}
ADDRGP4 $1663
JUMPV
LABELV $1662
line 3329
;3329:			else if ( push_list[x]->s.eType == ET_MISSILE && push_list[x]->s.pos.trType != TR_STATIONARY && (push_list[x]->s.pos.trType != TR_INTERPOLATE||push_list[x]->s.weapon != WP_THERMAL) )//rolling and stationary thermal detonators are dealt with below
ADDRLP4 9584
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9584
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1803
ADDRLP4 9588
ADDRLP4 9584
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
ADDRLP4 9588
INDIRI4
CNSTI4 0
EQI4 $1803
ADDRLP4 9588
INDIRI4
CNSTI4 1
NEI4 $1805
ADDRLP4 9584
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 11
EQI4 $1803
LABELV $1805
line 3330
;3330:			{
line 3331
;3331:				if ( pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1806
line 3332
;3332:				{//deflect rather than reflect?
line 3333
;3333:				}
ADDRGP4 $1804
JUMPV
LABELV $1806
line 3335
;3334:				else 
;3335:				{
line 3336
;3336:					if (g_defrag.integer) {
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
EQI4 $1808
line 3337
;3337:						gentity_t* owner = &g_entities[push_list[x]->r.ownerNum];
ADDRLP4 9592
CNSTI4 2352
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3338
;3338:						if (owner->client && owner->client->sess.raceMode) {
ADDRLP4 9596
ADDRLP4 9592
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9596
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1811
ADDRLP4 9596
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1811
line 3339
;3339:						}
ADDRGP4 $1804
JUMPV
LABELV $1811
line 3341
;3340:						else
;3341:							G_ReflectMissile(self, push_list[x], forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 9348
ARGP4
ADDRGP4 G_ReflectMissile
CALLV
pop
line 3342
;3342:					}
ADDRGP4 $1804
JUMPV
LABELV $1808
line 3344
;3343:					else
;3344:						G_ReflectMissile( self, push_list[x], forward );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 9348
ARGP4
ADDRGP4 G_ReflectMissile
CALLV
pop
line 3345
;3345:				}
line 3346
;3346:			}
ADDRGP4 $1804
JUMPV
LABELV $1803
line 3347
;3347:			else if ( !Q_stricmp( "func_door", push_list[x]->classname ) && (push_list[x]->spawnflags&2) )
ADDRGP4 $1605
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 9592
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 9596
CNSTI4 0
ASGNI4
ADDRLP4 9592
INDIRI4
ADDRLP4 9596
INDIRI4
NEI4 $1813
ADDRLP4 9600
CNSTI4 2
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 9600
INDIRI4
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ADDRLP4 9600
INDIRI4
BANDI4
ADDRLP4 9596
INDIRI4
EQI4 $1813
line 3348
;3348:			{//push/pull the door
line 3351
;3349:				vec3_t	pos1, pos2;
;3350:
;3351:				AngleVectors( self->client->ps.viewangles, forward, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 9348
ARGP4
ADDRLP4 9628
CNSTP4 0
ASGNP4
ADDRLP4 9628
INDIRP4
ARGP4
ADDRLP4 9628
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3352
;3352:				VectorNormalize( forward );
ADDRLP4 9348
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3353
;3353:				VectorMA( self->client->ps.origin, radius, forward, end );
ADDRLP4 9632
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 9636
ADDRLP4 9360
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 9500
ADDRLP4 9632
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 9348
INDIRF4
ADDRLP4 9636
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 9500+4
ADDRLP4 9632
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 9348+4
INDIRF4
ADDRLP4 9636
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 9500+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 9348+8
INDIRF4
ADDRLP4 9360
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 3354
;3354:				JP_Trace( &tr, self->client->ps.origin, vec3_origin, vec3_origin, end, self->s.number, MASK_SHOT );
ADDRLP4 8268
ARGP4
ADDRLP4 9640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9640
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9644
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 9644
INDIRP4
ARGP4
ADDRLP4 9644
INDIRP4
ARGP4
ADDRLP4 9500
ARGP4
ADDRLP4 9640
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3355
;3355:				if ( tr.entityNum != push_list[x]->s.number || tr.fraction == 1.0 || tr.allsolid || tr.startsolid )
ADDRLP4 8268+52
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
INDIRI4
NEI4 $1826
ADDRLP4 8268+8
INDIRF4
CNSTF4 1065353216
EQF4 $1826
ADDRLP4 9648
CNSTI4 0
ASGNI4
ADDRLP4 8268
INDIRI4
ADDRLP4 9648
INDIRI4
NEI4 $1826
ADDRLP4 8268+4
INDIRI4
ADDRLP4 9648
INDIRI4
EQI4 $1819
LABELV $1826
line 3356
;3356:				{//must be pointing right at it
line 3357
;3357:					continue;
ADDRGP4 $1653
JUMPV
LABELV $1819
line 3360
;3358:				}
;3359:
;3360:				VectorSubtract( push_list[x]->r.absmax, push_list[x]->r.absmin, size );
ADDRLP4 9652
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
ASGNP4
ADDRLP4 9656
ADDRLP4 9652
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4160
ADDRLP4 9656
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 9656
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9660
ADDRLP4 9652
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4160+4
ADDRLP4 9660
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 9660
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 9664
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4160+8
ADDRLP4 9664
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 9664
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3361
;3361:				VectorMA( push_list[x]->r.absmin, 0.5, size, center );
ADDRLP4 9668
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
ASGNP4
ADDRLP4 9672
CNSTF4 1056964608
ASGNF4
ADDRLP4 8
ADDRLP4 9668
INDIRP4
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 9672
INDIRF4
ADDRLP4 4160
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 9668
INDIRP4
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 9672
INDIRF4
ADDRLP4 4160+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 4160+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3362
;3362:				VectorAdd( center, push_list[x]->pos1, pos1 );
ADDRLP4 9676
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
ASGNP4
ADDRLP4 9604
ADDRLP4 8
INDIRF4
ADDRLP4 9676
INDIRP4
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 9604+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 9676
INDIRP4
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 9604+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3363
;3363:				VectorAdd( center, push_list[x]->pos2, pos2 );
ADDRLP4 9680
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
ASGNP4
ADDRLP4 9616
ADDRLP4 8
INDIRF4
ADDRLP4 9680
INDIRP4
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 9616+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 9680
INDIRP4
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 9616+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 572
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3365
;3364:
;3365:				if ( Distance( pos1, self->client->ps.origin ) < Distance( pos2, self->client->ps.origin ) )
ADDRLP4 9604
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9684
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 9616
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 9688
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 9684
INDIRF4
ADDRLP4 9688
INDIRF4
GEF4 $1841
line 3366
;3366:				{//pos1 is closer
line 3367
;3367:					if ( push_list[x]->moverState == MOVER_POS1 )
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1843
line 3368
;3368:					{//at the closest pos
line 3369
;3369:						if ( pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1842
line 3370
;3370:						{//trying to pull, but already at closest point, so screw it
line 3371
;3371:							continue;
ADDRGP4 $1653
JUMPV
line 3373
;3372:						}
;3373:					}
LABELV $1843
line 3374
;3374:					else if ( push_list[x]->moverState == MOVER_POS2 )
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1842
line 3375
;3375:					{//at farthest pos
line 3376
;3376:						if ( !pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1842
line 3377
;3377:						{//trying to push, but already at farthest point, so screw it
line 3378
;3378:							continue;
ADDRGP4 $1653
JUMPV
line 3380
;3379:						}
;3380:					}
line 3381
;3381:				}
LABELV $1841
line 3383
;3382:				else
;3383:				{//pos2 is closer
line 3384
;3384:					if ( push_list[x]->moverState == MOVER_POS1 )
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1851
line 3385
;3385:					{//at the farthest pos
line 3386
;3386:						if ( !pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1852
line 3387
;3387:						{//trying to push, but already at farthest point, so screw it
line 3388
;3388:							continue;
ADDRGP4 $1653
JUMPV
line 3390
;3389:						}
;3390:					}
LABELV $1851
line 3391
;3391:					else if ( push_list[x]->moverState == MOVER_POS2 )
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1855
line 3392
;3392:					{//at closest pos
line 3393
;3393:						if ( pull )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1857
line 3394
;3394:						{//trying to pull, but already at closest point, so screw it
line 3395
;3395:							continue;
ADDRGP4 $1653
JUMPV
LABELV $1857
line 3397
;3396:						}
;3397:					}
LABELV $1855
LABELV $1852
line 3398
;3398:				}
LABELV $1842
line 3399
;3399:				GEntity_UseFunc( push_list[x], self, self );
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 9692
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9692
INDIRP4
ARGP4
ADDRLP4 9692
INDIRP4
ARGP4
ADDRGP4 GEntity_UseFunc
CALLV
pop
line 3400
;3400:			}
ADDRGP4 $1814
JUMPV
LABELV $1813
line 3401
;3401:			else if ( Q_stricmp( "func_button", push_list[x]->classname ) == 0 )
ADDRGP4 $1592
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 9604
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 9604
INDIRI4
CNSTI4 0
NEI4 $1859
line 3402
;3402:			{//pretend you pushed it
line 3403
;3403:				Touch_Button( push_list[x], self, NULL );
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 Touch_Button
CALLV
pop
line 3404
;3404:				continue;
LABELV $1859
LABELV $1814
LABELV $1804
LABELV $1663
line 3406
;3405:			}
;3406:		}
LABELV $1653
line 3116
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1655
ADDRLP4 20
INDIRI4
ADDRLP4 9364
INDIRI4
LTI4 $1652
line 3407
;3407:	}
LABELV $1650
line 3411
;3408:
;3409:	//attempt to break any leftover grips
;3410:	//if we're still in a current grip that wasn't broken by the push, it will still remain
;3411:	self->client->dangerTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43800
ADDP4
ADDRLP4 9468
INDIRI4
ASGNI4
line 3412
;3412:	self->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 9580
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 9580
INDIRP4
ADDRLP4 9580
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 3413
;3413:	self->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43588
ADDP4
CNSTI4 0
ASGNI4
line 3415
;3414:
;3415:	if (self->client->ps.fd.forceGripBeingGripped > nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
INDIRF4
ADDRLP4 9468
INDIRI4
CVIF4 4
LEF4 $1861
line 3416
;3416:	{
line 3417
;3417:		self->client->ps.fd.forceGripBeingGripped = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
CNSTF4 0
ASGNF4
line 3418
;3418:	}
LABELV $1861
line 3419
;3419:}
LABELV $1452
endproc ForceThrow 9696 28
export WP_ForcePowerStop
proc WP_ForcePowerStop 60 12
line 3422
;3420:
;3421:void WP_ForcePowerStop( gentity_t *self, forcePowers_t forcePower )
;3422:{
line 3423
;3423:	int wasActive = self->client->ps.fd.forcePowersActive;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ASGNI4
line 3424
;3424:	int nowTime = LEVELTIME(self->client);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1868
ADDRLP4 16
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1868
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1870
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1871
JUMPV
LABELV $1870
ADDRLP4 12
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1871
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $1869
JUMPV
LABELV $1868
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1869
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 3426
;3425:
;3426:	self->client->ps.fd.forcePowersActive &= ~( 1 << forcePower );
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 3428
;3427:
;3428:	switch( (int)forcePower )
ADDRLP4 24
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
LTI4 $1873
ADDRLP4 24
INDIRI4
CNSTI4 14
GTI4 $1873
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1937
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1937
address $1875
address $1873
address $1877
address $1873
address $1873
address $1882
address $1889
address $1918
address $1923
address $1929
address $1926
address $1873
address $1873
address $1932
address $1886
code
line 3429
;3429:	{
LABELV $1875
line 3431
;3430:	case FP_HEAL:
;3431:		self->client->ps.fd.forceHealAmount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1152
ADDP4
CNSTI4 0
ASGNI4
line 3432
;3432:		self->client->ps.fd.forceHealTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1148
ADDP4
CNSTI4 0
ASGNI4
line 3433
;3433:		break;
ADDRGP4 $1873
JUMPV
line 3435
;3434:	case FP_LEVITATION:
;3435:		break;
LABELV $1877
line 3437
;3436:	case FP_SPEED:
;3437:		if (wasActive & (1 << FP_SPEED))
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1873
line 3438
;3438:		{
line 3439
;3439:			G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_2-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1208
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 3440
;3440:		}
line 3441
;3441:		break;
ADDRGP4 $1873
JUMPV
line 3443
;3442:	case FP_PUSH:
;3443:		break;
line 3445
;3444:	case FP_PULL:
;3445:		break;
LABELV $1882
line 3447
;3446:	case FP_TELEPATHY:
;3447:		if (wasActive & (1 << FP_TELEPATHY))
ADDRLP4 0
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1883
line 3448
;3448:		{
line 3449
;3449:			G_Sound( self, CHAN_AUTO, G_SoundIndex("sound/weapons/force/distractstop.wav") );
ADDRGP4 $1885
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 3450
;3450:		}
LABELV $1883
line 3451
;3451:		self->client->ps.fd.forceMindtrickTargetIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1156
ADDP4
CNSTI4 0
ASGNI4
line 3452
;3452:		self->client->ps.fd.forceMindtrickTargetIndex2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1160
ADDP4
CNSTI4 0
ASGNI4
line 3453
;3453:		self->client->ps.fd.forceMindtrickTargetIndex3 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1164
ADDP4
CNSTI4 0
ASGNI4
line 3454
;3454:		self->client->ps.fd.forceMindtrickTargetIndex4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1168
ADDP4
CNSTI4 0
ASGNI4
line 3455
;3455:		break;
ADDRGP4 $1873
JUMPV
LABELV $1886
line 3457
;3456:	case FP_SEE:
;3457:		if (wasActive & (1 << FP_SEE))
ADDRLP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $1873
line 3458
;3458:		{
line 3459
;3459:			G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_5-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1220
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 3460
;3460:		}
line 3461
;3461:		break;
ADDRGP4 $1873
JUMPV
LABELV $1889
line 3463
;3462:	case FP_GRIP:
;3463:		self->client->ps.fd.forceGripUseTime = nowTime + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1124
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 3464
;3464:		if (self->client->ps.fd.forcePowerLevel[FP_GRIP] > FORCE_LEVEL_1 &&
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
CNSTI4 1
LEI4 $1890
ADDRLP4 44
CNSTI4 2352
ADDRLP4 40
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 48
CNSTU4 0
ASGNU4
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $1890
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $1890
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $1890
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $1904
ADDRLP4 44
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $1904
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1906
ADDRLP4 36
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1907
JUMPV
LABELV $1906
ADDRLP4 36
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1907
ADDRLP4 32
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 $1905
JUMPV
LABELV $1904
ADDRLP4 32
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1905
ADDRLP4 32
INDIRI4
CVIF4 4
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
SUBF4
CNSTF4 1140457472
LEF4 $1890
line 3469
;3465:			g_entities[self->client->ps.fd.forceGripEntityNum].client &&
;3466:			g_entities[self->client->ps.fd.forceGripEntityNum].health > 0 &&
;3467:			g_entities[self->client->ps.fd.forceGripEntityNum].inuse &&
;3468:			(LEVELTIME(g_entities[self->client->ps.fd.forceGripEntityNum].client) - g_entities[self->client->ps.fd.forceGripEntityNum].client->ps.fd.forceGripStarted) > 500)
;3469:		{ //if we had our throat crushed in for more than half a second, gasp for air when we're let go
line 3470
;3470:			if (wasActive & (1 << FP_GRIP))
ADDRLP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1908
line 3471
;3471:			{
line 3472
;3472:				G_EntitySound( &g_entities[self->client->ps.fd.forceGripEntityNum], CHAN_VOICE, G_SoundIndex("*gasp.wav") );
ADDRGP4 $1910
ARGP4
ADDRLP4 56
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 G_EntitySound
CALLV
pop
line 3473
;3473:			}
LABELV $1908
line 3474
;3474:		}
LABELV $1890
line 3476
;3475:
;3476:		if (g_entities[self->client->ps.fd.forceGripEntityNum].client &&
ADDRLP4 56
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1911
ADDRLP4 56
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1911
line 3478
;3477:			g_entities[self->client->ps.fd.forceGripEntityNum].inuse)
;3478:		{
line 3480
;3479:			
;3480:			g_entities[self->client->ps.fd.forceGripEntityNum].client->ps.forceGripChangeMovetype = PM_NORMAL;
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
CNSTI4 0
ASGNI4
line 3481
;3481:		}
LABELV $1911
line 3483
;3482:
;3483:		if (self->client->ps.forceHandExtend == HANDEXTEND_FORCEGRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1916
line 3484
;3484:		{
line 3485
;3485:			self->client->ps.forceHandExtendTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 0
ASGNI4
line 3486
;3486:		}
LABELV $1916
line 3488
;3487:
;3488:		self->client->ps.fd.forceGripEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
CNSTI4 1023
ASGNI4
line 3490
;3489:
;3490:		self->client->ps.powerups[PW_DISINT_4] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 0
ASGNI4
line 3491
;3491:		break;
ADDRGP4 $1873
JUMPV
LABELV $1918
line 3493
;3492:	case FP_LIGHTNING:
;3493:		if ( self->client->ps.fd.forcePowerLevel[FP_LIGHTNING] < FORCE_LEVEL_2 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 2
GEI4 $1919
line 3494
;3494:		{//don't do it again for 3 seconds, minimum... FIXME: this should be automatic once regeneration is slower (normal)
line 3495
;3495:			self->client->ps.fd.forcePowerDebounce[FP_LIGHTNING] = nowTime + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 3496
;3496:		}
ADDRGP4 $1920
JUMPV
LABELV $1919
line 3498
;3497:		else
;3498:		{
line 3499
;3499:			self->client->ps.fd.forcePowerDebounce[FP_LIGHTNING] = nowTime + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 3500
;3500:		}
LABELV $1920
line 3501
;3501:		if (self->client->ps.forceHandExtend == HANDEXTEND_FORCEGRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1921
line 3502
;3502:		{
line 3503
;3503:			self->client->ps.forceHandExtendTime = 0; //reset hand position
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 0
ASGNI4
line 3504
;3504:		}
LABELV $1921
line 3506
;3505:
;3506:		self->client->ps.activeForcePass = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 0
ASGNI4
line 3507
;3507:		break;
ADDRGP4 $1873
JUMPV
LABELV $1923
line 3509
;3508:	case FP_RAGE:
;3509:		self->client->ps.fd.forceRageRecoveryTime = nowTime + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1172
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 3510
;3510:		if (wasActive & (1 << FP_RAGE))
ADDRLP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1873
line 3511
;3511:		{
line 3512
;3512:			G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_3-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 3513
;3513:		}
line 3514
;3514:		break;
ADDRGP4 $1873
JUMPV
LABELV $1926
line 3516
;3515:	case FP_ABSORB:
;3516:		if (wasActive & (1 << FP_ABSORB))
ADDRLP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1873
line 3517
;3517:		{
line 3518
;3518:			G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_3-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 3519
;3519:		}
line 3520
;3520:		break;
ADDRGP4 $1873
JUMPV
LABELV $1929
line 3522
;3521:	case FP_PROTECT:
;3522:		if (wasActive & (1 << FP_PROTECT))
ADDRLP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1873
line 3523
;3523:		{
line 3524
;3524:			G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_3-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 3525
;3525:		}
line 3526
;3526:		break;
ADDRGP4 $1873
JUMPV
LABELV $1932
line 3528
;3527:	case FP_DRAIN:
;3528:		if ( self->client->ps.fd.forcePowerLevel[FP_DRAIN] < FORCE_LEVEL_2 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 2
GEI4 $1933
line 3529
;3529:		{//don't do it again for 3 seconds, minimum...
line 3530
;3530:			self->client->ps.fd.forcePowerDebounce[FP_DRAIN] = nowTime + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 3531
;3531:		}
ADDRGP4 $1934
JUMPV
LABELV $1933
line 3533
;3532:		else
;3533:		{
line 3534
;3534:			self->client->ps.fd.forcePowerDebounce[FP_DRAIN] = nowTime + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 3535
;3535:		}
LABELV $1934
line 3537
;3536:
;3537:		if (self->client->ps.forceHandExtend == HANDEXTEND_FORCEGRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1935
line 3538
;3538:		{
line 3539
;3539:			self->client->ps.forceHandExtendTime = 0; //reset hand position
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 0
ASGNI4
line 3540
;3540:		}
LABELV $1935
line 3542
;3541:
;3542:		self->client->ps.activeForcePass = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 0
ASGNI4
line 3544
;3543:	default:
;3544:		break;
LABELV $1873
line 3546
;3545:	}
;3546:}
LABELV $1863
endproc WP_ForcePowerStop 60 12
export DoGripAction
proc DoGripAction 1304 32
line 3549
;3547:
;3548:void DoGripAction(gentity_t *self, forcePowers_t forcePower)
;3549:{
line 3551
;3550:	gentity_t *gripEnt;
;3551:	int gripLevel = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3555
;3552:	trace_t tr;
;3553:	vec3_t a;
;3554:	vec3_t fwd, fwd_o, start_o, nvel; 
;3555:	int		nowTime = LEVELTIME(self->client);
ADDRLP4 1164
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1943
ADDRLP4 1164
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1943
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1945
ADDRLP4 1160
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1946
JUMPV
LABELV $1945
ADDRLP4 1160
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1946
ADDRLP4 1156
ADDRLP4 1160
INDIRI4
ASGNI4
ADDRGP4 $1944
JUMPV
LABELV $1943
ADDRLP4 1156
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1944
ADDRLP4 24
ADDRLP4 1156
INDIRI4
ASGNI4
line 3558
;3556:	int		nowTimeGripped;
;3557:
;3558:	self->client->dangerTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43800
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 3559
;3559:	self->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 1168
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1168
INDIRP4
ADDRLP4 1168
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 3560
;3560:	self->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43588
ADDP4
CNSTI4 0
ASGNI4
line 3562
;3561:
;3562:	gripEnt = &g_entities[self->client->ps.fd.forceGripEntityNum];
ADDRLP4 0
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3564
;3563:
;3564:	if (!gripEnt || !gripEnt->client || !gripEnt->inuse || gripEnt->health < 1 || !ForcePowerUsableOn(self, gripEnt, FP_GRIP))
ADDRLP4 1176
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1176
INDIRU4
EQU4 $1952
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1176
INDIRU4
EQU4 $1952
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1952
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
LTI4 $1952
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1180
ADDRGP4 ForcePowerUsableOn
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
NEI4 $1947
LABELV $1952
line 3565
;3565:	{
line 3566
;3566:		WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3567
;3567:		self->client->ps.fd.forceGripEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
CNSTI4 1023
ASGNI4
line 3569
;3568:
;3569:		if (gripEnt && gripEnt->client && gripEnt->inuse)
ADDRLP4 1188
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1188
INDIRU4
EQU4 $1938
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1188
INDIRU4
EQU4 $1938
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1938
line 3570
;3570:		{
line 3571
;3571:			gripEnt->client->ps.forceGripChangeMovetype = PM_NORMAL;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
CNSTI4 0
ASGNI4
line 3572
;3572:		}
line 3573
;3573:		return;
ADDRGP4 $1938
JUMPV
LABELV $1947
line 3575
;3574:	}
;3575:	nowTimeGripped = LEVELTIME(gripEnt->client);
ADDRLP4 1192
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1192
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1959
ADDRLP4 1192
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1959
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1961
ADDRLP4 1188
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1962
JUMPV
LABELV $1961
ADDRLP4 1188
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1962
ADDRLP4 1184
ADDRLP4 1188
INDIRI4
ASGNI4
ADDRGP4 $1960
JUMPV
LABELV $1959
ADDRLP4 1184
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1960
ADDRLP4 8
ADDRLP4 1184
INDIRI4
ASGNI4
line 3577
;3576:
;3577:	VectorSubtract(gripEnt->client->ps.origin, self->client->ps.origin, a);
ADDRLP4 1196
CNSTI4 408
ASGNI4
ADDRLP4 1200
ADDRLP4 0
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
ASGNP4
ADDRLP4 1204
CNSTI4 20
ASGNI4
ADDRLP4 1208
ADDRFP4 0
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 1200
INDIRP4
INDIRP4
ADDRLP4 1204
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1208
INDIRP4
INDIRP4
ADDRLP4 1204
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1212
CNSTI4 24
ASGNI4
ADDRLP4 12+4
ADDRLP4 1200
INDIRP4
INDIRP4
ADDRLP4 1212
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1208
INDIRP4
INDIRP4
ADDRLP4 1212
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1216
CNSTI4 408
ASGNI4
ADDRLP4 1220
CNSTI4 28
ASGNI4
ADDRLP4 12+8
ADDRLP4 0
INDIRP4
ADDRLP4 1216
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1220
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 1216
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1220
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3579
;3578:	
;3579:	JP_Trace(&tr, self->client->ps.origin, NULL, NULL, gripEnt->client->ps.origin, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 28
ARGP4
ADDRLP4 1224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1228
CNSTI4 408
ASGNI4
ADDRLP4 1232
CNSTI4 20
ASGNI4
ADDRLP4 1224
INDIRP4
ADDRLP4 1228
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1232
INDIRI4
ADDP4
ARGP4
ADDRLP4 1236
CNSTP4 0
ASGNP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 1228
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1232
INDIRI4
ADDP4
ARGP4
ADDRLP4 1224
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3581
;3580:
;3581:	gripLevel = WP_AbsorbConversion(gripEnt, gripEnt->client->ps.fd.forcePowerLevel[FP_ABSORB], self, FP_GRIP, self->client->ps.fd.forcePowerLevel[FP_GRIP], forcePowerNeeded[self->client->ps.fd.forcePowerLevel[FP_GRIP]][FP_GRIP]);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1244
CNSTI4 408
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 1244
INDIRI4
ADDP4
INDIRP4
CNSTI4 984
ADDP4
INDIRI4
ARGI4
ADDRLP4 1248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1248
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 1252
ADDRLP4 1248
INDIRP4
ADDRLP4 1244
INDIRI4
ADDP4
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1252
INDIRI4
ARGI4
CNSTI4 72
ADDRLP4 1252
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRLP4 1256
ADDRGP4 WP_AbsorbConversion
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1256
INDIRI4
ASGNI4
line 3583
;3582:
;3583:	if (gripLevel == -1)
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $1965
line 3584
;3584:	{
line 3585
;3585:		gripLevel = self->client->ps.fd.forcePowerLevel[FP_GRIP];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
ASGNI4
line 3586
;3586:	}
LABELV $1965
line 3588
;3587:
;3588:	if (!gripLevel)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1967
line 3589
;3589:	{
line 3590
;3590:		WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3591
;3591:		return;
ADDRGP4 $1938
JUMPV
LABELV $1967
line 3594
;3592:	}
;3593:
;3594:	if (VectorLength(a) > MAX_GRIP_DISTANCE)
ADDRLP4 12
ARGP4
ADDRLP4 1260
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1260
INDIRF4
CNSTF4 1132462080
LEF4 $1969
line 3595
;3595:	{
line 3596
;3596:		WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3597
;3597:		return;
ADDRGP4 $1938
JUMPV
LABELV $1969
line 3600
;3598:	}
;3599:
;3600:	if ( !InFront( gripEnt->client->ps.origin, self->client->ps.origin, self->client->ps.viewangles, 0.9f ) &&
ADDRLP4 1264
CNSTI4 408
ASGNI4
ADDRLP4 1268
CNSTI4 20
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 1264
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1268
INDIRI4
ADDP4
ARGP4
ADDRLP4 1272
ADDRFP4 0
INDIRP4
ADDRLP4 1264
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1272
INDIRP4
ADDRLP4 1268
INDIRI4
ADDP4
ARGP4
ADDRLP4 1272
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1063675494
ARGF4
ADDRLP4 1276
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 1276
INDIRI4
CNSTI4 0
NEI4 $1971
ADDRLP4 4
INDIRI4
CNSTI4 3
GEI4 $1971
line 3602
;3601:		gripLevel < FORCE_LEVEL_3)
;3602:	{
line 3603
;3603:		WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3604
;3604:		return;
ADDRGP4 $1938
JUMPV
LABELV $1971
line 3607
;3605:	}
;3606:
;3607:	if (tr.fraction != 1 &&
ADDRLP4 28+8
INDIRF4
CNSTF4 1065353216
EQF4 $1973
ADDRLP4 28+52
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
EQI4 $1973
ADDRLP4 4
INDIRI4
CNSTI4 3
GEI4 $1973
line 3610
;3608:		tr.entityNum != gripEnt->s.number &&
;3609:		gripLevel < FORCE_LEVEL_3)
;3610:	{
line 3611
;3611:		WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3612
;3612:		return;
ADDRGP4 $1938
JUMPV
LABELV $1973
line 3615
;3613:	}
;3614:
;3615:	if (self->client->ps.fd.forcePowerDebounce[FP_GRIP] < nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
GEI4 $1977
line 3616
;3616:	{ //2 damage per second while choking, resulting in 10 damage total (not including The Squeeze<tm>)
line 3617
;3617:		self->client->ps.fd.forcePowerDebounce[FP_GRIP] = nowTime + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 796
ADDP4
ADDRLP4 24
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 3618
;3618:		G_Damage(gripEnt, self, self, NULL, NULL, 2, DAMAGE_NO_ARMOR, MOD_FORCE_DARK);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1280
INDIRP4
ARGP4
ADDRLP4 1280
INDIRP4
ARGP4
ADDRLP4 1284
CNSTP4 0
ASGNP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRLP4 1288
CNSTI4 2
ASGNI4
ADDRLP4 1288
INDIRI4
ARGI4
ADDRLP4 1288
INDIRI4
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 3619
;3619:	}
LABELV $1977
line 3621
;3620:
;3621:	if (gripLevel == FORCE_LEVEL_1)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $1979
line 3622
;3622:	{
line 3623
;3623:		gripEnt->client->ps.fd.forceGripBeingGripped = nowTimeGripped + 1000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 3625
;3624:		
;3625:		if ((nowTimeGripped - gripEnt->client->ps.fd.forceGripStarted) > 5000)
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
SUBF4
CNSTF4 1167867904
LEF4 $1938
line 3626
;3626:		{
line 3627
;3627:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3628
;3628:		}
line 3629
;3629:		return;
ADDRGP4 $1938
JUMPV
LABELV $1979
line 3632
;3630:	}
;3631:
;3632:	if (gripLevel == FORCE_LEVEL_2)
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $1983
line 3633
;3633:	{
line 3634
;3634:		gripEnt->client->ps.fd.forceGripBeingGripped = nowTimeGripped + 1000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 3636
;3635:
;3636:		if (gripEnt->client->ps.forceGripMoveInterval < nowTimeGripped)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $1985
line 3637
;3637:		{
line 3638
;3638:			gripEnt->client->ps.velocity[2] = 30;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1106247680
ASGNF4
line 3640
;3639:
;3640:			gripEnt->client->ps.forceGripMoveInterval = nowTimeGripped + 300; //only update velocity every 300ms, so as to avoid heavy bandwidth usage
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1284
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 3641
;3641:		}
LABELV $1985
line 3643
;3642:
;3643:		gripEnt->client->ps.otherKiller = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3644
;3644:		gripEnt->client->ps.otherKillerTime = nowTimeGripped + 5000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 3645
;3645:		gripEnt->client->ps.otherKillerDebounceTime = nowTimeGripped + 100;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3647
;3646:
;3647:		gripEnt->client->ps.forceGripChangeMovetype = PM_FLOAT;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
CNSTI4 1
ASGNI4
line 3649
;3648:
;3649:		if ((nowTimeGripped - gripEnt->client->ps.fd.forceGripStarted) > 3000 && !self->client->ps.fd.forceGripDamageDebounceTime)
ADDRLP4 1280
CNSTI4 408
ASGNI4
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
ADDRLP4 1280
INDIRI4
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
SUBF4
CNSTF4 1161527296
LEF4 $1987
ADDRFP4 0
INDIRP4
ADDRLP4 1280
INDIRI4
ADDP4
INDIRP4
CNSTI4 1112
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1987
line 3650
;3650:		{ //if we managed to lift him into the air for 2 seconds, give him a crack
line 3651
;3651:			self->client->ps.fd.forceGripDamageDebounceTime = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1112
ADDP4
CNSTI4 1
ASGNI4
line 3652
;3652:			G_Damage(gripEnt, self, self, NULL, NULL, 20, DAMAGE_NO_ARMOR, MOD_FORCE_DARK);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRLP4 1288
CNSTP4 0
ASGNP4
ADDRLP4 1288
INDIRP4
ARGP4
ADDRLP4 1288
INDIRP4
ARGP4
CNSTI4 20
ARGI4
CNSTI4 2
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 3655
;3653:
;3654:			//Must play custom sounds on the actual entity. Don't use G_Sound (it creates a temp entity for the sound)
;3655:			G_EntitySound( gripEnt, CHAN_VOICE, G_SoundIndex(va( "*choke%d.wav", Q_irand( 1, 3, qfalse,2 ) )) );
CNSTI4 1
ARGI4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 1292
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $1989
ARGP4
ADDRLP4 1292
INDIRI4
ARGI4
ADDRLP4 1296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1296
INDIRP4
ARGP4
ADDRLP4 1300
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 1300
INDIRI4
ARGI4
ADDRGP4 G_EntitySound
CALLV
pop
line 3657
;3656:
;3657:			gripEnt->client->ps.forceHandExtend = HANDEXTEND_CHOKE;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 5
ASGNI4
line 3658
;3658:			gripEnt->client->ps.forceHandExtendTime = nowTimeGripped + 2000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 3660
;3659:
;3660:			if (gripEnt->client->ps.fd.forcePowersActive & (1 << FP_GRIP))
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1938
line 3661
;3661:			{ //choking, so don't let him keep gripping himself
line 3662
;3662:				WP_ForcePowerStop(gripEnt, FP_GRIP);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3663
;3663:			}
line 3664
;3664:		}
ADDRGP4 $1938
JUMPV
LABELV $1987
line 3665
;3665:		else if ((nowTimeGripped - gripEnt->client->ps.fd.forceGripStarted) > 4000)
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
SUBF4
CNSTF4 1165623296
LEF4 $1938
line 3666
;3666:		{
line 3667
;3667:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3668
;3668:		}
line 3669
;3669:		return;
ADDRGP4 $1938
JUMPV
LABELV $1983
line 3672
;3670:	}
;3671:
;3672:	if (gripLevel == FORCE_LEVEL_3)
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $1994
line 3673
;3673:	{
line 3674
;3674:		gripEnt->client->ps.fd.forceGripBeingGripped = nowTimeGripped + 1000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 3676
;3675:
;3676:		gripEnt->client->ps.otherKiller = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3677
;3677:		gripEnt->client->ps.otherKillerTime = nowTimeGripped + 5000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 3678
;3678:		gripEnt->client->ps.otherKillerDebounceTime = nowTimeGripped + 100;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3680
;3679:
;3680:		gripEnt->client->ps.forceGripChangeMovetype = PM_FLOAT;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
CNSTI4 1
ASGNI4
line 3682
;3681:
;3682:		if (gripEnt->client->ps.forceGripMoveInterval < nowTimeGripped)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $1996
line 3683
;3683:		{
line 3684
;3684:			float nvLen = 0;
ADDRLP4 1280
CNSTF4 0
ASGNF4
line 3686
;3685:
;3686:			VectorCopy(gripEnt->client->ps.origin, start_o);
ADDRLP4 1144
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3687
;3687:			AngleVectors(self->client->ps.viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 1132
ARGP4
ADDRLP4 1284
CNSTP4 0
ASGNP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3688
;3688:			fwd_o[0] = self->client->ps.origin[0] + fwd[0]*128;
ADDRLP4 1120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 1132
INDIRF4
MULF4
ADDF4
ASGNF4
line 3689
;3689:			fwd_o[1] = self->client->ps.origin[1] + fwd[1]*128;
ADDRLP4 1120+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 1132+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3690
;3690:			fwd_o[2] = self->client->ps.origin[2] + fwd[2]*128;
ADDRLP4 1120+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 1132+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3691
;3691:			fwd_o[2] += 16;
ADDRLP4 1120+8
ADDRLP4 1120+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 3692
;3692:			VectorSubtract(fwd_o, start_o, nvel);
ADDRLP4 1108
ADDRLP4 1120
INDIRF4
ADDRLP4 1144
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1108+4
ADDRLP4 1120+4
INDIRF4
ADDRLP4 1144+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1108+8
ADDRLP4 1120+8
INDIRF4
ADDRLP4 1144+8
INDIRF4
SUBF4
ASGNF4
line 3694
;3693:
;3694:			nvLen = VectorLength(nvel);
ADDRLP4 1108
ARGP4
ADDRLP4 1288
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1280
ADDRLP4 1288
INDIRF4
ASGNF4
line 3696
;3695:
;3696:			if (nvLen < 16)
ADDRLP4 1280
INDIRF4
CNSTF4 1098907648
GEF4 $2009
line 3697
;3697:			{ //within x units of desired spot
line 3698
;3698:				VectorNormalize(nvel);
ADDRLP4 1108
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3699
;3699:				gripEnt->client->ps.velocity[0] = nvel[0]*8;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ADDRLP4 1108
INDIRF4
MULF4
ASGNF4
line 3700
;3700:				gripEnt->client->ps.velocity[1] = nvel[1]*8;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ADDRLP4 1108+4
INDIRF4
MULF4
ASGNF4
line 3701
;3701:				gripEnt->client->ps.velocity[2] = nvel[2]*8;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ADDRLP4 1108+8
INDIRF4
MULF4
ASGNF4
line 3702
;3702:			}
ADDRGP4 $2010
JUMPV
LABELV $2009
line 3703
;3703:			else if (nvLen < 64)
ADDRLP4 1280
INDIRF4
CNSTF4 1115684864
GEF4 $2013
line 3704
;3704:			{
line 3705
;3705:				VectorNormalize(nvel);
ADDRLP4 1108
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3706
;3706:				gripEnt->client->ps.velocity[0] = nvel[0]*128;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1124073472
ADDRLP4 1108
INDIRF4
MULF4
ASGNF4
line 3707
;3707:				gripEnt->client->ps.velocity[1] = nvel[1]*128;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1124073472
ADDRLP4 1108+4
INDIRF4
MULF4
ASGNF4
line 3708
;3708:				gripEnt->client->ps.velocity[2] = nvel[2]*128;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1124073472
ADDRLP4 1108+8
INDIRF4
MULF4
ASGNF4
line 3709
;3709:			}
ADDRGP4 $2014
JUMPV
LABELV $2013
line 3710
;3710:			else if (nvLen < 128)
ADDRLP4 1280
INDIRF4
CNSTF4 1124073472
GEF4 $2017
line 3711
;3711:			{
line 3712
;3712:				VectorNormalize(nvel);
ADDRLP4 1108
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3713
;3713:				gripEnt->client->ps.velocity[0] = nvel[0]*256;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1132462080
ADDRLP4 1108
INDIRF4
MULF4
ASGNF4
line 3714
;3714:				gripEnt->client->ps.velocity[1] = nvel[1]*256;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1132462080
ADDRLP4 1108+4
INDIRF4
MULF4
ASGNF4
line 3715
;3715:				gripEnt->client->ps.velocity[2] = nvel[2]*256;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132462080
ADDRLP4 1108+8
INDIRF4
MULF4
ASGNF4
line 3716
;3716:			}
ADDRGP4 $2018
JUMPV
LABELV $2017
line 3717
;3717:			else if (nvLen < 200)
ADDRLP4 1280
INDIRF4
CNSTF4 1128792064
GEF4 $2021
line 3718
;3718:			{
line 3719
;3719:				VectorNormalize(nvel);
ADDRLP4 1108
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3720
;3720:				gripEnt->client->ps.velocity[0] = nvel[0]*512;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1140850688
ADDRLP4 1108
INDIRF4
MULF4
ASGNF4
line 3721
;3721:				gripEnt->client->ps.velocity[1] = nvel[1]*512;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1140850688
ADDRLP4 1108+4
INDIRF4
MULF4
ASGNF4
line 3722
;3722:				gripEnt->client->ps.velocity[2] = nvel[2]*512;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1140850688
ADDRLP4 1108+8
INDIRF4
MULF4
ASGNF4
line 3723
;3723:			}
ADDRGP4 $2022
JUMPV
LABELV $2021
line 3725
;3724:			else
;3725:			{
line 3726
;3726:				VectorNormalize(nvel);
ADDRLP4 1108
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3727
;3727:				gripEnt->client->ps.velocity[0] = nvel[0]*700;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1143930880
ADDRLP4 1108
INDIRF4
MULF4
ASGNF4
line 3728
;3728:				gripEnt->client->ps.velocity[1] = nvel[1]*700;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRLP4 1108+4
INDIRF4
MULF4
ASGNF4
line 3729
;3729:				gripEnt->client->ps.velocity[2] = nvel[2]*700;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRLP4 1108+8
INDIRF4
MULF4
ASGNF4
line 3730
;3730:			}
LABELV $2022
LABELV $2018
LABELV $2014
LABELV $2010
line 3732
;3731:
;3732:			gripEnt->client->ps.forceGripMoveInterval = nowTimeGripped + 300; //only update velocity every 300ms, so as to avoid heavy bandwidth usage
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1284
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 3733
;3733:		}
LABELV $1996
line 3735
;3734:
;3735:		if ((nowTimeGripped - gripEnt->client->ps.fd.forceGripStarted) > 3000 && !self->client->ps.fd.forceGripDamageDebounceTime)
ADDRLP4 1280
CNSTI4 408
ASGNI4
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
ADDRLP4 1280
INDIRI4
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
SUBF4
CNSTF4 1161527296
LEF4 $2027
ADDRFP4 0
INDIRP4
ADDRLP4 1280
INDIRI4
ADDP4
INDIRP4
CNSTI4 1112
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2027
line 3736
;3736:		{ //if we managed to lift him into the air for 2 seconds, give him a crack
line 3737
;3737:			self->client->ps.fd.forceGripDamageDebounceTime = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1112
ADDP4
CNSTI4 1
ASGNI4
line 3738
;3738:			G_Damage(gripEnt, self, self, NULL, NULL, 40, DAMAGE_NO_ARMOR, MOD_FORCE_DARK);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRLP4 1288
CNSTP4 0
ASGNP4
ADDRLP4 1288
INDIRP4
ARGP4
ADDRLP4 1288
INDIRP4
ARGP4
CNSTI4 40
ARGI4
CNSTI4 2
ARGI4
CNSTI4 27
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 3741
;3739:
;3740:			//Must play custom sounds on the actual entity. Don't use G_Sound (it creates a temp entity for the sound)
;3741:			G_EntitySound( gripEnt, CHAN_VOICE, G_SoundIndex(va( "*choke%d.wav", Q_irand( 1, 3,qfalse,2 ) )) );
CNSTI4 1
ARGI4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 1292
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $1989
ARGP4
ADDRLP4 1292
INDIRI4
ARGI4
ADDRLP4 1296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1296
INDIRP4
ARGP4
ADDRLP4 1300
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 1300
INDIRI4
ARGI4
ADDRGP4 G_EntitySound
CALLV
pop
line 3743
;3742:
;3743:			gripEnt->client->ps.forceHandExtend = HANDEXTEND_CHOKE;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 5
ASGNI4
line 3744
;3744:			gripEnt->client->ps.forceHandExtendTime = nowTimeGripped + 2000;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 3746
;3745:
;3746:			if (gripEnt->client->ps.fd.forcePowersActive & (1 << FP_GRIP))
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1938
line 3747
;3747:			{ //choking, so don't let him keep gripping himself
line 3748
;3748:				WP_ForcePowerStop(gripEnt, FP_GRIP);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3749
;3749:			}
line 3750
;3750:		}
ADDRGP4 $1938
JUMPV
LABELV $2027
line 3751
;3751:		else if ((nowTimeGripped - gripEnt->client->ps.fd.forceGripStarted) > 4000)
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1132
ADDP4
INDIRF4
SUBF4
CNSTF4 1165623296
LEF4 $1938
line 3752
;3752:		{
line 3753
;3753:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3754
;3754:		}
line 3755
;3755:		return;
LABELV $1994
line 3757
;3756:	}
;3757:}
LABELV $1938
endproc DoGripAction 1304 32
export G_IsMindTricked
proc G_IsMindTricked 24 0
line 3760
;3758:
;3759:qboolean G_IsMindTricked(forcedata_t *fd, int client)
;3760:{
line 3763
;3761:	int checkIn;
;3762:	int trickIndex1, trickIndex2, trickIndex3, trickIndex4;
;3763:	int sub = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3765
;3764:
;3765:	if (!fd)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2034
line 3766
;3766:	{
line 3767
;3767:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2033
JUMPV
LABELV $2034
line 3770
;3768:	}
;3769:
;3770:	trickIndex1 = fd->forceMindtrickTargetIndex;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
ASGNI4
line 3771
;3771:	trickIndex2 = fd->forceMindtrickTargetIndex2;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ASGNI4
line 3772
;3772:	trickIndex3 = fd->forceMindtrickTargetIndex3;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ASGNI4
line 3773
;3773:	trickIndex4 = fd->forceMindtrickTargetIndex4;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
line 3775
;3774:
;3775:	if (client > 47)
ADDRFP4 4
INDIRI4
CNSTI4 47
LEI4 $2036
line 3776
;3776:	{
line 3777
;3777:		checkIn = trickIndex4;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 3778
;3778:		sub = 48;
ADDRLP4 0
CNSTI4 48
ASGNI4
line 3779
;3779:	}
ADDRGP4 $2037
JUMPV
LABELV $2036
line 3780
;3780:	else if (client > 31)
ADDRFP4 4
INDIRI4
CNSTI4 31
LEI4 $2038
line 3781
;3781:	{
line 3782
;3782:		checkIn = trickIndex3;
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 3783
;3783:		sub = 32;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 3784
;3784:	}
ADDRGP4 $2039
JUMPV
LABELV $2038
line 3785
;3785:	else if (client > 15)
ADDRFP4 4
INDIRI4
CNSTI4 15
LEI4 $2040
line 3786
;3786:	{
line 3787
;3787:		checkIn = trickIndex2;
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
line 3788
;3788:		sub = 16;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 3789
;3789:	}
ADDRGP4 $2041
JUMPV
LABELV $2040
line 3791
;3790:	else
;3791:	{
line 3792
;3792:		checkIn = trickIndex1;
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 3793
;3793:	}
LABELV $2041
LABELV $2039
LABELV $2037
line 3795
;3794:
;3795:	if (checkIn & (1 << (client-sub)))
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2042
line 3796
;3796:	{
line 3797
;3797:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2033
JUMPV
LABELV $2042
line 3800
;3798:	}
;3799:	
;3800:	return qfalse;
CNSTI4 0
RETI4
LABELV $2033
endproc G_IsMindTricked 24 0
proc RemoveTrickedEnt 4 0
line 3804
;3801:}
;3802:
;3803:static void RemoveTrickedEnt(forcedata_t *fd, int client)
;3804:{
line 3805
;3805:	if (!fd)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2045
line 3806
;3806:	{
line 3807
;3807:		return;
ADDRGP4 $2044
JUMPV
LABELV $2045
line 3810
;3808:	}
;3809:
;3810:	if (client > 47)
ADDRFP4 4
INDIRI4
CNSTI4 47
LEI4 $2047
line 3811
;3811:	{
line 3812
;3812:		fd->forceMindtrickTargetIndex4 &= ~(1 << (client-48));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 48
SUBI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 3813
;3813:	}
ADDRGP4 $2048
JUMPV
LABELV $2047
line 3814
;3814:	else if (client > 31)
ADDRFP4 4
INDIRI4
CNSTI4 31
LEI4 $2049
line 3815
;3815:	{
line 3816
;3816:		fd->forceMindtrickTargetIndex3 &= ~(1 << (client-32));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 392
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 32
SUBI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 3817
;3817:	}
ADDRGP4 $2050
JUMPV
LABELV $2049
line 3818
;3818:	else if (client > 15)
ADDRFP4 4
INDIRI4
CNSTI4 15
LEI4 $2051
line 3819
;3819:	{
line 3820
;3820:		fd->forceMindtrickTargetIndex2 &= ~(1 << (client-16));
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
CNSTI4 16
SUBI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 3821
;3821:	}
ADDRGP4 $2052
JUMPV
LABELV $2051
line 3823
;3822:	else
;3823:	{
line 3824
;3824:		fd->forceMindtrickTargetIndex &= ~(1 << client);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 4
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 3825
;3825:	}
LABELV $2052
LABELV $2050
LABELV $2048
line 3826
;3826:}
LABELV $2044
endproc RemoveTrickedEnt 4 0
proc WP_UpdateMindtrickEnts 72 12
line 3832
;3827:
;3828:extern int g_LastFrameTime;
;3829:extern int g_TimeSinceLastFrame;
;3830:
;3831:static void WP_UpdateMindtrickEnts(gentity_t *self)
;3832:{
line 3833
;3833:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3834
;3834:	int			nowTime = LEVELTIME(self->client);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2058
ADDRLP4 16
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2058
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2060
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $2061
JUMPV
LABELV $2060
ADDRLP4 12
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $2061
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $2059
JUMPV
LABELV $2058
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $2059
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $2063
JUMPV
LABELV $2062
line 3837
;3835:
;3836:	while (i < MAX_CLIENTS)
;3837:	{
line 3838
;3838:		if (G_IsMindTricked(&self->client->ps.fd, i))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 G_IsMindTricked
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $2065
line 3839
;3839:		{
line 3840
;3840:			gentity_t *ent = &g_entities[i];
ADDRLP4 24
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3842
;3841:
;3842:			if ( !ent || !ent->client || !ent->inuse || ent->health < 1 ||
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $2072
ADDRLP4 36
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $2072
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $2072
ADDRLP4 24
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
LTI4 $2072
ADDRLP4 36
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 40
INDIRI4
EQI4 $2067
LABELV $2072
line 3844
;3843:				(ent->client->ps.fd.forcePowersActive & (1 << FP_SEE)) )
;3844:			{
line 3845
;3845:				RemoveTrickedEnt(&self->client->ps.fd, i);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 RemoveTrickedEnt
CALLV
pop
line 3846
;3846:			}
ADDRGP4 $2068
JUMPV
LABELV $2067
line 3847
;3847:			else if ((nowTime - self->client->dangerTime) < g_TimeSinceLastFrame*4)
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43800
ADDP4
INDIRI4
SUBI4
ADDRGP4 g_TimeSinceLastFrame
INDIRI4
CNSTI4 2
LSHI4
GEI4 $2073
line 3848
;3848:			{ //Untrick this entity if the tricker (self) fires while in his fov
line 3849
;3849:				if (trap_InPVS(ent->client->ps.origin, self->client->ps.origin) &&
ADDRLP4 44
CNSTI4 408
ASGNI4
ADDRLP4 48
CNSTI4 20
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $2074
ADDRLP4 60
CNSTI4 408
ASGNI4
ADDRLP4 64
CNSTI4 20
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $2074
line 3851
;3850:					OrgVisible(ent->client->ps.origin, self->client->ps.origin, ent->s.number))
;3851:				{
line 3852
;3852:					RemoveTrickedEnt(&self->client->ps.fd, i);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 RemoveTrickedEnt
CALLV
pop
line 3853
;3853:				}
line 3854
;3854:			}
ADDRGP4 $2074
JUMPV
LABELV $2073
line 3855
;3855:			else if (BG_HasYsalamiri(g_gametype.integer, &ent->client->ps))
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2077
line 3856
;3856:			{
line 3857
;3857:				RemoveTrickedEnt(&self->client->ps.fd, i);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 RemoveTrickedEnt
CALLV
pop
line 3858
;3858:			}
LABELV $2077
LABELV $2074
LABELV $2068
line 3859
;3859:		}
LABELV $2065
line 3861
;3860:
;3861:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3862
;3862:	}
LABELV $2063
line 3836
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $2062
line 3864
;3863:
;3864:	if (!self->client->ps.fd.forceMindtrickTargetIndex &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 1156
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $2080
ADDRLP4 20
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $2080
ADDRLP4 20
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $2080
ADDRLP4 20
INDIRP4
CNSTI4 1168
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $2080
line 3868
;3865:		!self->client->ps.fd.forceMindtrickTargetIndex2 &&
;3866:		!self->client->ps.fd.forceMindtrickTargetIndex3 &&
;3867:		!self->client->ps.fd.forceMindtrickTargetIndex4)
;3868:	{ //everyone who we had tricked is no longer tricked, so stop the power
line 3869
;3869:		WP_ForcePowerStop(self, FP_TELEPATHY);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3870
;3870:	}
ADDRGP4 $2081
JUMPV
LABELV $2080
line 3871
;3871:	else if (self->client->ps.powerups[PW_REDFLAG] ||
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $2084
ADDRLP4 28
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $2082
LABELV $2084
line 3873
;3872:		self->client->ps.powerups[PW_BLUEFLAG])
;3873:	{
line 3874
;3874:		WP_ForcePowerStop(self, FP_TELEPATHY);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3875
;3875:	}
LABELV $2082
LABELV $2081
line 3876
;3876:}
LABELV $2053
endproc WP_UpdateMindtrickEnts 72 12
proc WP_ForcePowerRun 88 12
line 3879
;3877:
;3878:static void WP_ForcePowerRun( gentity_t *self, forcePowers_t forcePower, usercmd_t *cmd )
;3879:{
line 3880
;3880:	int			nowTime = LEVELTIME(self->client);
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
EQU4 $2090
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2090
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2092
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $2093
JUMPV
LABELV $2092
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $2093
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $2091
JUMPV
LABELV $2090
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $2091
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 3881
;3881:	switch( (int)forcePower )
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $2095
ADDRLP4 16
INDIRI4
CNSTI4 17
GTI4 $2095
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2184
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2184
address $2097
address $2127
address $2095
address $2095
address $2095
address $2167
address $2118
address $2155
address $2130
address $2171
address $2176
address $2095
address $2095
address $2143
address $2095
address $2095
address $2095
address $2095
code
line 3882
;3882:	{
LABELV $2097
line 3884
;3883:	case FP_HEAL:
;3884:		if (self->client->ps.fd.forcePowerLevel[FP_HEAL] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2098
line 3885
;3885:		{
line 3886
;3886:			if (self->client->ps.velocity[0] || self->client->ps.velocity[1] || self->client->ps.velocity[2])
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
NEF4 $2103
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
NEF4 $2103
ADDRLP4 24
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
EQF4 $2100
LABELV $2103
line 3887
;3887:			{
line 3888
;3888:				WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3889
;3889:				break;
ADDRGP4 $2095
JUMPV
LABELV $2100
line 3891
;3890:			}
;3891:		}
LABELV $2098
line 3893
;3892:
;3893:		if (self->health < 1 || self->client->ps.stats[STAT_HEALTH] < 1)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $2106
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
GEI4 $2104
LABELV $2106
line 3894
;3894:		{
line 3895
;3895:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3896
;3896:			break;
ADDRGP4 $2095
JUMPV
LABELV $2104
line 3899
;3897:		}
;3898:
;3899:		if (self->client->ps.fd.forceHealTime > nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1148
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $2107
line 3900
;3900:		{
line 3901
;3901:			break;
ADDRGP4 $2095
JUMPV
LABELV $2107
line 3903
;3902:		}
;3903:		if ( self->health > self->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $2109
line 3904
;3904:		{ //rww - we might start out over max_health and we don't want force heal taking us down to 100 or whatever max_health is
line 3905
;3905:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3906
;3906:			break;
ADDRGP4 $2095
JUMPV
LABELV $2109
line 3908
;3907:		}
;3908:		self->client->ps.fd.forceHealTime = nowTime + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1148
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 3909
;3909:		self->health++;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3910
;3910:		self->client->ps.fd.forceHealAmount++;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1152
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3912
;3911:
;3912:		if ( self->health > self->client->ps.stats[STAT_MAX_HEALTH])	// Past max health
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $2111
line 3913
;3913:		{
line 3914
;3914:			self->health = self->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 3915
;3915:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3916
;3916:		}
LABELV $2111
line 3918
;3917:
;3918:		if ( (self->client->ps.fd.forcePowerLevel[FP_HEAL] == FORCE_LEVEL_1 && self->client->ps.fd.forceHealAmount >= 25) ||
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2116
ADDRLP4 48
INDIRP4
CNSTI4 1152
ADDP4
INDIRI4
CNSTI4 25
GEI4 $2115
LABELV $2116
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 944
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2095
ADDRLP4 52
INDIRP4
CNSTI4 1152
ADDP4
INDIRI4
CNSTI4 33
LTI4 $2095
LABELV $2115
line 3920
;3919:			(self->client->ps.fd.forcePowerLevel[FP_HEAL] == FORCE_LEVEL_2 && self->client->ps.fd.forceHealAmount >= 33))
;3920:		{
line 3921
;3921:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3922
;3922:		}
line 3923
;3923:		break;
ADDRGP4 $2095
JUMPV
line 3926
;3924:	case FP_SPEED:
;3925:		//This is handled in PM_WalkMove and PM_StepSlideMove
;3926:		break;
LABELV $2118
line 3928
;3927:	case FP_GRIP:
;3928:		if (self->client->ps.forceHandExtend != HANDEXTEND_FORCEGRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2119
line 3929
;3929:		{
line 3930
;3930:			WP_ForcePowerStop(self, FP_GRIP);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3931
;3931:			break;
ADDRGP4 $2095
JUMPV
LABELV $2119
line 3934
;3932:		}
;3933:
;3934:		if ( jk2gameplay != VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $2121
line 3935
;3935:		{
line 3936
;3936:			if (self->client->ps.fd.forcePowerDebounce[FP_PULL] < nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $2123
line 3937
;3937:			{ //This is sort of not ideal. Using the debounce value reserved for pull for this because pull doesn't need it.
line 3938
;3938:				BG_ForcePowerDrain( &self->client->ps, forcePower, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 3939
;3939:				self->client->ps.fd.forcePowerDebounce[FP_PULL] = nowTime + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 788
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3940
;3940:			}
LABELV $2123
line 3942
;3941:
;3942:			if (self->client->ps.fd.forcePower < 1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2125
line 3943
;3943:			{
line 3944
;3944:				WP_ForcePowerStop(self, FP_GRIP);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3945
;3945:				break;
ADDRGP4 $2095
JUMPV
LABELV $2125
line 3947
;3946:			}
;3947:		}
LABELV $2121
line 3949
;3948:
;3949:		DoGripAction(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 DoGripAction
CALLV
pop
line 3950
;3950:		break;
ADDRGP4 $2095
JUMPV
LABELV $2127
line 3952
;3951:	case FP_LEVITATION:
;3952:		if ( self->client->ps.groundEntityNum != ENTITYNUM_NONE && !self->client->ps.fd.forceJumpZStart )
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $2095
ADDRLP4 56
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CNSTF4 0
NEF4 $2095
line 3953
;3953:		{//done with jump
line 3954
;3954:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3955
;3955:		}
line 3956
;3956:		break;
ADDRGP4 $2095
JUMPV
LABELV $2130
line 3958
;3957:	case FP_RAGE:
;3958:		if (self->health < 1)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2131
line 3959
;3959:		{
line 3960
;3960:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3961
;3961:			break;
ADDRGP4 $2095
JUMPV
LABELV $2131
line 3963
;3962:		}
;3963:		if (self->client->ps.forceRageDrainTime < nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1256
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $2133
line 3964
;3964:		{
line 3965
;3965:			int addTime = 400;
ADDRLP4 60
CNSTI4 400
ASGNI4
line 3967
;3966:
;3967:			self->health -= 2;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 3969
;3968:
;3969:			if (self->client->ps.fd.forcePowerLevel[FP_RAGE] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2135
line 3970
;3970:			{
line 3971
;3971:				addTime = 150;
ADDRLP4 60
CNSTI4 150
ASGNI4
line 3972
;3972:			}
ADDRGP4 $2136
JUMPV
LABELV $2135
line 3973
;3973:			else if (self->client->ps.fd.forcePowerLevel[FP_RAGE] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2137
line 3974
;3974:			{
line 3975
;3975:				addTime = 300;
ADDRLP4 60
CNSTI4 300
ASGNI4
line 3976
;3976:			}
ADDRGP4 $2138
JUMPV
LABELV $2137
line 3977
;3977:			else if (self->client->ps.fd.forcePowerLevel[FP_RAGE] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2139
line 3978
;3978:			{
line 3979
;3979:				addTime = 450;
ADDRLP4 60
CNSTI4 450
ASGNI4
line 3980
;3980:			}
LABELV $2139
LABELV $2138
LABELV $2136
line 3981
;3981:			self->client->ps.forceRageDrainTime = nowTime + addTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1256
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDI4
ASGNI4
line 3982
;3982:		}
LABELV $2133
line 3984
;3983:
;3984:		if (self->health < 1)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2141
line 3985
;3985:		{
line 3986
;3986:			self->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
line 3987
;3987:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3988
;3988:		}
LABELV $2141
line 3990
;3989:
;3990:		self->client->ps.stats[STAT_HEALTH] = self->health;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ASGNI4
line 3991
;3991:		break;
ADDRGP4 $2095
JUMPV
LABELV $2143
line 3993
;3992:	case FP_DRAIN:
;3993:		if (self->client->ps.forceHandExtend != HANDEXTEND_FORCEGRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2144
line 3994
;3994:		{
line 3995
;3995:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3996
;3996:			break;
ADDRGP4 $2095
JUMPV
LABELV $2144
line 3999
;3997:		}
;3998:
;3999:		if ( self->client->ps.fd.forcePowerLevel[FP_DRAIN] > FORCE_LEVEL_1 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2146
line 4000
;4000:		{//higher than level 1
line 4001
;4001:			if ( (cmd->buttons & BUTTON_FORCE_DRAIN) || ((cmd->buttons & BUTTON_FORCEPOWER) && self->client->ps.fd.forcePowerSelected == FP_DRAIN) )
ADDRLP4 64
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 68
INDIRI4
NEI4 $2150
ADDRLP4 64
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 68
INDIRI4
EQI4 $2148
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 13
NEI4 $2148
LABELV $2150
line 4002
;4002:			{//holding it keeps it going
line 4003
;4003:				self->client->ps.fd.forcePowerDuration[FP_DRAIN] = nowTime + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 912
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4004
;4004:			}
LABELV $2148
line 4005
;4005:		}
LABELV $2146
line 4006
;4006:		if ( !WP_ForcePowerAvailable( self, forcePower ) || self->client->ps.fd.forcePowerDuration[FP_DRAIN] < nowTime ||
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 WP_ForcePowerAvailable
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $2154
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 912
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $2154
ADDRLP4 68
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 25
GEI4 $2151
LABELV $2154
line 4008
;4007:			self->client->ps.fd.forcePower < 25)
;4008:		{
line 4009
;4009:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4010
;4010:		}
ADDRGP4 $2095
JUMPV
LABELV $2151
line 4012
;4011:		else
;4012:		{
line 4013
;4013:			ForceShootDrain( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceShootDrain
CALLI4
pop
line 4014
;4014:		}
line 4015
;4015:		break;
ADDRGP4 $2095
JUMPV
LABELV $2155
line 4017
;4016:	case FP_LIGHTNING:
;4017:		if (self->client->ps.forceHandExtend != HANDEXTEND_FORCEGRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2156
line 4018
;4018:		{ //Animation for hand extend doesn't end with hand out, so we have to limit lightning intervals by animation intervals (once hand starts to go in in animation, lightning should stop)
line 4019
;4019:			WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4020
;4020:			break;
ADDRGP4 $2095
JUMPV
LABELV $2156
line 4023
;4021:		}
;4022:
;4023:		if ( self->client->ps.fd.forcePowerLevel[FP_LIGHTNING] > FORCE_LEVEL_1 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2158
line 4024
;4024:		{//higher than level 1
line 4025
;4025:			if ( (cmd->buttons & BUTTON_FORCE_LIGHTNING) || ((cmd->buttons & BUTTON_FORCEPOWER) && self->client->ps.fd.forcePowerSelected == FP_LIGHTNING) )
ADDRLP4 72
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 76
INDIRI4
NEI4 $2162
ADDRLP4 72
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 76
INDIRI4
EQI4 $2160
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 7
NEI4 $2160
LABELV $2162
line 4026
;4026:			{//holding it keeps it going
line 4027
;4027:				self->client->ps.fd.forcePowerDuration[FP_LIGHTNING] = nowTime + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 888
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4028
;4028:			}
LABELV $2160
line 4029
;4029:		}
LABELV $2158
line 4030
;4030:		if ( !WP_ForcePowerAvailable( self, forcePower ) || self->client->ps.fd.forcePowerDuration[FP_LIGHTNING] < nowTime ||
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 WP_ForcePowerAvailable
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $2166
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $2166
ADDRLP4 76
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 25
GEI4 $2163
LABELV $2166
line 4032
;4031:			self->client->ps.fd.forcePower < 25)
;4032:		{
line 4033
;4033:			WP_ForcePowerStop( self, forcePower );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4034
;4034:		}
ADDRGP4 $2095
JUMPV
LABELV $2163
line 4036
;4035:		else
;4036:		{
line 4037
;4037:			ForceShootLightning( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceShootLightning
CALLV
pop
line 4038
;4038:			BG_ForcePowerDrain( &self->client->ps, forcePower, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 4039
;4039:		}
line 4040
;4040:		break;
ADDRGP4 $2095
JUMPV
LABELV $2167
line 4042
;4041:	case FP_TELEPATHY:
;4042:		WP_UpdateMindtrickEnts(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_UpdateMindtrickEnts
CALLV
pop
line 4043
;4043:		break;
ADDRGP4 $2095
JUMPV
line 4045
;4044:	case FP_SABERATTACK:
;4045:		break;
line 4047
;4046:	case FP_SABERDEFEND:
;4047:		break;
line 4049
;4048:	case FP_SABERTHROW:
;4049:		break;
LABELV $2171
line 4051
;4050:	case FP_PROTECT:
;4051:		if (self->client->ps.fd.forcePowerDebounce[forcePower] < nowTime)
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $2095
line 4052
;4052:		{
line 4053
;4053:			BG_ForcePowerDrain( &self->client->ps, forcePower, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 4054
;4054:			if (self->client->ps.fd.forcePower < 1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2174
line 4055
;4055:			{
line 4056
;4056:				WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4057
;4057:			}
LABELV $2174
line 4059
;4058:
;4059:			self->client->ps.fd.forcePowerDebounce[forcePower] = nowTime + 300;
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 4060
;4060:		}
line 4061
;4061:		break;
ADDRGP4 $2095
JUMPV
LABELV $2176
line 4063
;4062:	case FP_ABSORB:
;4063:		if (self->client->ps.fd.forcePowerDebounce[forcePower] < nowTime)
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $2095
line 4064
;4064:		{
line 4065
;4065:			BG_ForcePowerDrain( &self->client->ps, forcePower, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 4066
;4066:			if (self->client->ps.fd.forcePower < 1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2179
line 4067
;4067:			{
line 4068
;4068:				WP_ForcePowerStop(self, forcePower);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4069
;4069:			}
LABELV $2179
line 4071
;4070:
;4071:			self->client->ps.fd.forcePowerDebounce[forcePower] = nowTime + (jk2gameplay == VERSION_1_02 ? 300 : 600);
ADDRLP4 84
CNSTI4 2
ASGNI4
ADDRGP4 jk2gameplay
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $2182
ADDRLP4 80
CNSTI4 300
ASGNI4
ADDRGP4 $2183
JUMPV
LABELV $2182
ADDRLP4 80
CNSTI4 600
ASGNI4
LABELV $2183
ADDRFP4 4
INDIRI4
ADDRLP4 84
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
ASGNI4
line 4072
;4072:		}
line 4073
;4073:		break;
line 4075
;4074:	default:
;4075:		break;
LABELV $2095
line 4077
;4076:	}
;4077:}
LABELV $2085
endproc WP_ForcePowerRun 88 12
export WP_DoSpecificPower
proc WP_DoSpecificPower 16 12
line 4080
;4078:
;4079:int WP_DoSpecificPower( gentity_t *self, usercmd_t *ucmd, forcePowers_t forcepower)
;4080:{
line 4083
;4081:	int powerSucceeded;
;4082:
;4083:	powerSucceeded = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 4085
;4084:
;4085:	if ( !WP_ForcePowerAvailable( self, forcepower ) )
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 WP_ForcePowerAvailable
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2186
line 4086
;4086:	{
line 4087
;4087:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2185
JUMPV
LABELV $2186
line 4090
;4088:	}
;4089:
;4090:	switch(forcepower)
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $2189
ADDRLP4 8
INDIRI4
CNSTI4 17
GTI4 $2189
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2239
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2239
address $2191
address $2194
address $2197
address $2208
address $2211
address $2214
address $2200
address $2207
address $2217
address $2220
address $2223
address $2226
address $2229
address $2232
address $2233
address $2189
address $2189
address $2189
code
line 4091
;4091:	{
LABELV $2191
line 4093
;4092:	case FP_HEAL:
;4093:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4094
;4094:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2192
line 4095
;4095:		{ //need to release before we can use nonhold powers again
line 4096
;4096:			break;
ADDRGP4 $2189
JUMPV
LABELV $2192
line 4098
;4097:		}
;4098:		ForceHeal(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceHeal
CALLV
pop
line 4099
;4099:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 4100
;4100:		break;
ADDRGP4 $2189
JUMPV
LABELV $2194
line 4104
;4101:	case FP_LEVITATION:
;4102:		//if leave the ground by some other means, cancel the force jump so we don't suddenly jump when we land.
;4103:		
;4104:		if ( self->client->ps.groundEntityNum == ENTITYNUM_NONE )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2195
line 4105
;4105:		{
line 4106
;4106:			self->client->ps.fd.forceJumpCharge = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
CNSTF4 0
ASGNF4
line 4107
;4107:			G_MuteSound( self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
line 4109
;4108:			//This only happens if the groundEntityNum == ENTITYNUM_NONE when the button is actually released
;4109:		}
ADDRGP4 $2189
JUMPV
LABELV $2195
line 4111
;4110:		else
;4111:		{//still on ground, so jump
line 4112
;4112:			ForceJump( self, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 ForceJump
CALLV
pop
line 4113
;4113:		}
line 4114
;4114:		break;
ADDRGP4 $2189
JUMPV
LABELV $2197
line 4116
;4115:	case FP_SPEED:
;4116:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4117
;4117:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2198
line 4118
;4118:		{ //need to release before we can use nonhold powers again
line 4119
;4119:			break;
ADDRGP4 $2189
JUMPV
LABELV $2198
line 4121
;4120:		}
;4121:		ForceSpeed(self, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ForceSpeed
CALLV
pop
line 4122
;4122:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 4123
;4123:		break;
ADDRGP4 $2189
JUMPV
LABELV $2200
line 4125
;4124:	case FP_GRIP:
;4125:		if (self->client->ps.fd.forceGripEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2201
line 4126
;4126:		{
line 4127
;4127:			ForceGrip( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceGrip
CALLV
pop
line 4128
;4128:		}
LABELV $2201
line 4130
;4129:
;4130:		if (self->client->ps.fd.forceGripEntityNum != ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1108
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $2203
line 4131
;4131:		{
line 4132
;4132:			if (!(self->client->ps.fd.forcePowersActive & (1 << FP_GRIP)))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $2189
line 4133
;4133:			{
line 4134
;4134:				WP_ForcePowerStart( self, FP_GRIP, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 WP_ForcePowerStart
CALLV
pop
line 4135
;4135:				BG_ForcePowerDrain( &self->client->ps, FP_GRIP, GRIP_DRAIN_AMOUNT );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 30
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 4136
;4136:			}
line 4137
;4137:		}
ADDRGP4 $2189
JUMPV
LABELV $2203
line 4139
;4138:		else
;4139:		{
line 4140
;4140:			powerSucceeded = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4141
;4141:		}
line 4142
;4142:		break;
ADDRGP4 $2189
JUMPV
LABELV $2207
line 4144
;4143:	case FP_LIGHTNING:
;4144:		ForceLightning(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceLightning
CALLV
pop
line 4145
;4145:		break;
ADDRGP4 $2189
JUMPV
LABELV $2208
line 4147
;4146:	case FP_PUSH:
;4147:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4148
;4148:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2209
line 4149
;4149:		{ //need to release before we can use nonhold powers again
line 4150
;4150:			break;
ADDRGP4 $2189
JUMPV
LABELV $2209
line 4152
;4151:		}
;4152:		ForceThrow(self, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ForceThrow
CALLV
pop
line 4153
;4153:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 4154
;4154:		break;
ADDRGP4 $2189
JUMPV
LABELV $2211
line 4156
;4155:	case FP_PULL:
;4156:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4157
;4157:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2212
line 4158
;4158:		{ //need to release before we can use nonhold powers again
line 4159
;4159:			break;
ADDRGP4 $2189
JUMPV
LABELV $2212
line 4161
;4160:		}
;4161:		ForceThrow(self, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ForceThrow
CALLV
pop
line 4162
;4162:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 4163
;4163:		break;
ADDRGP4 $2189
JUMPV
LABELV $2214
line 4165
;4164:	case FP_TELEPATHY:
;4165:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4166
;4166:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2215
line 4167
;4167:		{ //need to release before we can use nonhold powers again
line 4168
;4168:			break;
ADDRGP4 $2189
JUMPV
LABELV $2215
line 4170
;4169:		}
;4170:		ForceTelepathy(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTelepathy
CALLV
pop
line 4171
;4171:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 4172
;4172:		break;
ADDRGP4 $2189
JUMPV
LABELV $2217
line 4174
;4173:	case FP_RAGE:
;4174:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4175
;4175:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2218
line 4176
;4176:		{ //need to release before we can use nonhold powers again
line 4177
;4177:			break;
ADDRGP4 $2189
JUMPV
LABELV $2218
line 4179
;4178:		}
;4179:		ForceRage(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceRage
CALLV
pop
line 4180
;4180:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 4181
;4181:		break;
ADDRGP4 $2189
JUMPV
LABELV $2220
line 4183
;4182:	case FP_PROTECT:
;4183:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4184
;4184:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2221
line 4185
;4185:		{ //need to release before we can use nonhold powers again
line 4186
;4186:			break;
ADDRGP4 $2189
JUMPV
LABELV $2221
line 4188
;4187:		}
;4188:		ForceProtect(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceProtect
CALLV
pop
line 4189
;4189:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 4190
;4190:		break;
ADDRGP4 $2189
JUMPV
LABELV $2223
line 4192
;4191:	case FP_ABSORB:
;4192:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4193
;4193:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2224
line 4194
;4194:		{ //need to release before we can use nonhold powers again
line 4195
;4195:			break;
ADDRGP4 $2189
JUMPV
LABELV $2224
line 4197
;4196:		}
;4197:		ForceAbsorb(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceAbsorb
CALLV
pop
line 4198
;4198:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 4199
;4199:		break;
ADDRGP4 $2189
JUMPV
LABELV $2226
line 4201
;4200:	case FP_TEAM_HEAL:
;4201:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4202
;4202:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2227
line 4203
;4203:		{ //need to release before we can use nonhold powers again
line 4204
;4204:			break;
ADDRGP4 $2189
JUMPV
LABELV $2227
line 4206
;4205:		}
;4206:		ForceTeamHeal(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTeamHeal
CALLV
pop
line 4207
;4207:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 4208
;4208:		break;
ADDRGP4 $2189
JUMPV
LABELV $2229
line 4210
;4209:	case FP_TEAM_FORCE:
;4210:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4211
;4211:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2230
line 4212
;4212:		{ //need to release before we can use nonhold powers again
line 4213
;4213:			break;
ADDRGP4 $2189
JUMPV
LABELV $2230
line 4215
;4214:		}
;4215:		ForceTeamForceReplenish(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTeamForceReplenish
CALLV
pop
line 4216
;4216:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 4217
;4217:		break;
ADDRGP4 $2189
JUMPV
LABELV $2232
line 4219
;4218:	case FP_DRAIN:
;4219:		ForceDrain(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceDrain
CALLV
pop
line 4220
;4220:		break;
ADDRGP4 $2189
JUMPV
LABELV $2233
line 4222
;4221:	case FP_SEE:
;4222:		powerSucceeded = 0; //always 0 for nonhold powers
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4223
;4223:		if (self->client->ps.fd.forceButtonNeedRelease)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2234
line 4224
;4224:		{ //need to release before we can use nonhold powers again
line 4225
;4225:			break;
ADDRGP4 $2189
JUMPV
LABELV $2234
line 4227
;4226:		}
;4227:		ForceSeeing(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceSeeing
CALLV
pop
line 4228
;4228:		self->client->ps.fd.forceButtonNeedRelease = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 4229
;4229:		break;
line 4231
;4230:	case FP_SABERATTACK:
;4231:		break;
line 4233
;4232:	case FP_SABERDEFEND:
;4233:		break;
line 4235
;4234:	case FP_SABERTHROW:
;4235:		break;
line 4237
;4236:	default:
;4237:		break;
LABELV $2189
line 4240
;4238:	}
;4239:
;4240:	return powerSucceeded;
ADDRLP4 0
INDIRI4
RETI4
LABELV $2185
endproc WP_DoSpecificPower 16 12
export FindGenericEnemyIndex
proc FindGenericEnemyIndex 116 16
line 4244
;4241:}
;4242:
;4243:void FindGenericEnemyIndex(gentity_t *self)
;4244:{ //Find another client that would be considered a threat.
line 4245
;4245:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4248
;4246:	float tlen;
;4247:	gentity_t *ent;
;4248:	gentity_t *besten = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRGP4 $2242
JUMPV
LABELV $2241
line 4253
;4249:	float blen;
;4250:	vec3_t a;
;4251:
;4252:	while (i < MAX_CLIENTS)
;4253:	{
line 4254
;4254:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4256
;4255:
;4256:		if (ent && ent->client && ent->s.number != self->s.number && ent->health > 0 && !OnSameTeam(self, ent) && ent->client->ps.pm_type != PM_INTERMISSION && ent->client->ps.pm_type != PM_SPECTATOR)
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $2244
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $2244
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 40
INDIRP4
INDIRI4
EQI4 $2244
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2244
ADDRLP4 40
INDIRP4
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
NEI4 $2244
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 6
EQI4 $2244
ADDRLP4 48
INDIRI4
CNSTI4 3
EQI4 $2244
line 4257
;4257:		{
line 4258
;4258:			VectorSubtract(ent->client->ps.origin, self->client->ps.origin, a);
ADDRLP4 52
CNSTI4 408
ASGNI4
ADDRLP4 56
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ASGNP4
ADDRLP4 60
CNSTI4 20
ASGNI4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 56
INDIRP4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
CNSTI4 24
ASGNI4
ADDRLP4 8+4
ADDRLP4 56
INDIRP4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 72
CNSTI4 408
ASGNI4
ADDRLP4 76
CNSTI4 28
ASGNI4
ADDRLP4 8+8
ADDRLP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4259
;4259:			tlen = VectorLength(a);
ADDRLP4 8
ARGP4
ADDRLP4 80
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 80
INDIRF4
ASGNF4
line 4261
;4260:
;4261:			if ((!besten || tlen < blen) &&
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2250
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
GEF4 $2248
LABELV $2250
ADDRLP4 84
CNSTI4 408
ASGNI4
ADDRLP4 88
CNSTI4 20
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ARGP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1061997773
ARGF4
ADDRLP4 96
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $2248
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
CNSTI4 408
ASGNI4
ADDRLP4 108
CNSTI4 20
ASGNI4
ADDRLP4 100
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
ARGP4
ADDRLP4 100
INDIRP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $2248
line 4264
;4262:				InFront(ent->client->ps.origin, self->client->ps.origin, self->client->ps.viewangles, 0.8f ) &&
;4263:				OrgVisible(self->client->ps.origin, ent->client->ps.origin, self->s.number))
;4264:			{
line 4265
;4265:				blen = tlen;
ADDRLP4 28
ADDRLP4 20
INDIRF4
ASGNF4
line 4266
;4266:				besten = ent;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 4267
;4267:			}
LABELV $2248
line 4268
;4268:		}
LABELV $2244
line 4270
;4269:
;4270:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4271
;4271:	}
LABELV $2242
line 4252
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $2241
line 4273
;4272:
;4273:	if (!besten)
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2251
line 4274
;4274:	{
line 4275
;4275:		return;
ADDRGP4 $2240
JUMPV
LABELV $2251
line 4278
;4276:	}
;4277:
;4278:	self->client->ps.genericEnemyIndex = besten->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 24
INDIRP4
INDIRI4
ASGNI4
line 4279
;4279:}
LABELV $2240
endproc FindGenericEnemyIndex 116 16
export SeekerDroneUpdate
proc SeekerDroneUpdate 1236 28
line 4282
;4280:
;4281:void SeekerDroneUpdate(gentity_t *self)
;4282:{
line 4286
;4283:	vec3_t org, elevated, dir, a, endir;
;4284:	gentity_t *en;
;4285:	float angle;
;4286:	float prefig = 0;
ADDRLP4 60
CNSTF4 0
ASGNF4
line 4288
;4287:	trace_t tr;
;4288:	int			nowTime = LEVELTIME(self->client);
ADDRLP4 1164
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2258
ADDRLP4 1164
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2258
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2260
ADDRLP4 1160
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $2261
JUMPV
LABELV $2260
ADDRLP4 1160
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $2261
ADDRLP4 1156
ADDRLP4 1160
INDIRI4
ASGNI4
ADDRGP4 $2259
JUMPV
LABELV $2258
ADDRLP4 1156
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $2259
ADDRLP4 24
ADDRLP4 1156
INDIRI4
ASGNI4
line 4291
;4289:	
;4290:
;4291:	if (!(self->client->ps.eFlags & EF_SEEKERDRONE))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
NEI4 $2262
line 4292
;4292:	{
line 4293
;4293:		self->client->ps.genericEnemyIndex = -1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 -1
ASGNI4
line 4294
;4294:		return;
ADDRGP4 $2253
JUMPV
LABELV $2262
line 4297
;4295:	}
;4296:
;4297:	if (self->health < 1)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2264
line 4298
;4298:	{
line 4299
;4299:		VectorCopy(self->client->ps.origin, elevated);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4300
;4300:		elevated[2] += 40;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 4302
;4301:
;4302:		angle = ((nowTime / 12) & 255) * (M_PI * 2) / 255; //magical numbers make magic happen
ADDRLP4 40
CNSTF4 1086918619
ADDRLP4 24
INDIRI4
CNSTI4 12
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 4303
;4303:		dir[0] = cos(angle) * 20;
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 1168
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1101004800
ADDRLP4 1168
INDIRF4
MULF4
ASGNF4
line 4304
;4304:		dir[1] = sin(angle) * 20;
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 1172
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
CNSTF4 1101004800
ADDRLP4 1172
INDIRF4
MULF4
ASGNF4
line 4305
;4305:		dir[2] = cos(angle) * 5;
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 1176
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1084227584
ADDRLP4 1176
INDIRF4
MULF4
ASGNF4
line 4306
;4306:		VectorAdd(elevated, dir, org);
ADDRLP4 28
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 4308
;4307:
;4308:		a[ROLL] = 0;
ADDRLP4 48+8
CNSTF4 0
ASGNF4
line 4309
;4309:		a[YAW] = 0;
ADDRLP4 48+4
CNSTF4 0
ASGNF4
line 4310
;4310:		a[PITCH] = 1;
ADDRLP4 48
CNSTF4 1065353216
ASGNF4
line 4312
;4311:
;4312:		G_PlayEffect(EFFECT_SPARK_EXPLOSION, org, a);
CNSTI4 4
ARGI4
ADDRLP4 28
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 4314
;4313:
;4314:		self->client->ps.eFlags -= EF_SEEKERDRONE;
ADDRLP4 1180
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1180
INDIRP4
ADDRLP4 1180
INDIRP4
INDIRI4
CNSTI4 1048576
SUBI4
ASGNI4
line 4315
;4315:		self->client->ps.genericEnemyIndex = -1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 -1
ASGNI4
line 4317
;4316:
;4317:		return;
ADDRGP4 $2253
JUMPV
LABELV $2264
line 4320
;4318:	}
;4319:
;4320:	if (self->client->ps.droneExistTime >= nowTime &&
ADDRLP4 1168
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1168
INDIRF4
ADDRLP4 24
INDIRI4
CVIF4 4
LTF4 $2277
ADDRLP4 1168
INDIRF4
ADDRLP4 24
INDIRI4
CNSTI4 5000
ADDI4
CVIF4 4
GEF4 $2277
line 4322
;4321:		self->client->ps.droneExistTime < (nowTime +5000))
;4322:	{
line 4323
;4323:		self->client->ps.genericEnemyIndex = 1024+self->client->ps.droneExistTime;
ADDRLP4 1176
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1176
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 1176
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
CNSTF4 1149239296
ADDF4
CVFI4 4
ASGNI4
line 4324
;4324:		if (self->client->ps.droneFireTime < nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 24
INDIRI4
CVIF4 4
GEF4 $2253
line 4325
;4325:		{
line 4326
;4326:			G_Sound( self, CHAN_BODY, G_SoundIndex("sound/weapons/laser_trap/warning.wav") );
ADDRGP4 $2281
ARGP4
ADDRLP4 1180
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 1180
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 4327
;4327:			self->client->ps.droneFireTime = nowTime + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 628
ADDP4
ADDRLP4 24
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 4328
;4328:		}
line 4329
;4329:		return;
ADDRGP4 $2253
JUMPV
LABELV $2277
line 4331
;4330:	}
;4331:	else if (self->client->ps.droneExistTime < nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 24
INDIRI4
CVIF4 4
GEF4 $2282
line 4332
;4332:	{
line 4333
;4333:		VectorCopy(self->client->ps.origin, elevated);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4334
;4334:		elevated[2] += 40;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 4336
;4335:
;4336:		prefig = (self->client->ps.droneExistTime- nowTime)/80;
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 24
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1117782016
DIVF4
ASGNF4
line 4338
;4337:
;4338:		if (prefig > 55)
ADDRLP4 60
INDIRF4
CNSTF4 1113325568
LEF4 $2285
line 4339
;4339:		{
line 4340
;4340:			prefig = 55;
ADDRLP4 60
CNSTF4 1113325568
ASGNF4
line 4341
;4341:		}
ADDRGP4 $2286
JUMPV
LABELV $2285
line 4342
;4342:		else if (prefig < 1)
ADDRLP4 60
INDIRF4
CNSTF4 1065353216
GEF4 $2287
line 4343
;4343:		{
line 4344
;4344:			prefig = 1;
ADDRLP4 60
CNSTF4 1065353216
ASGNF4
line 4345
;4345:		}
LABELV $2287
LABELV $2286
line 4347
;4346:
;4347:		elevated[2] -= 55-prefig;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1113325568
ADDRLP4 60
INDIRF4
SUBF4
SUBF4
ASGNF4
line 4349
;4348:
;4349:		angle = ((nowTime / 12) & 255) * (M_PI * 2) / 255; //magical numbers make magic happen
ADDRLP4 40
CNSTF4 1086918619
ADDRLP4 24
INDIRI4
CNSTI4 12
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 4350
;4350:		dir[0] = cos(angle) * 20;
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 1176
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1101004800
ADDRLP4 1176
INDIRF4
MULF4
ASGNF4
line 4351
;4351:		dir[1] = sin(angle) * 20;
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 1180
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
CNSTF4 1101004800
ADDRLP4 1180
INDIRF4
MULF4
ASGNF4
line 4352
;4352:		dir[2] = cos(angle) * 5;
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 1184
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1084227584
ADDRLP4 1184
INDIRF4
MULF4
ASGNF4
line 4353
;4353:		VectorAdd(elevated, dir, org);
ADDRLP4 28
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 4355
;4354:
;4355:		a[ROLL] = 0;
ADDRLP4 48+8
CNSTF4 0
ASGNF4
line 4356
;4356:		a[YAW] = 0;
ADDRLP4 48+4
CNSTF4 0
ASGNF4
line 4357
;4357:		a[PITCH] = 1;
ADDRLP4 48
CNSTF4 1065353216
ASGNF4
line 4359
;4358:
;4359:		G_PlayEffect(EFFECT_SPARK_EXPLOSION, org, a);
CNSTI4 4
ARGI4
ADDRLP4 28
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 4361
;4360:
;4361:		self->client->ps.eFlags -= EF_SEEKERDRONE;
ADDRLP4 1188
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1188
INDIRP4
ADDRLP4 1188
INDIRP4
INDIRI4
CNSTI4 1048576
SUBI4
ASGNI4
line 4362
;4362:		self->client->ps.genericEnemyIndex = -1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 -1
ASGNI4
line 4364
;4363:
;4364:		return;
ADDRGP4 $2253
JUMPV
LABELV $2282
line 4367
;4365:	}
;4366:
;4367:	if (self->client->ps.genericEnemyIndex == -1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $2300
line 4368
;4368:	{
line 4369
;4369:		self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4370
;4370:	}
LABELV $2300
line 4372
;4371:
;4372:	if (self->client->ps.genericEnemyIndex != ENTITYNUM_NONE && self->client->ps.genericEnemyIndex != -1)
ADDRLP4 1176
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 1023
EQI4 $2302
ADDRLP4 1176
INDIRI4
CNSTI4 -1
EQI4 $2302
line 4373
;4373:	{
line 4374
;4374:		en = &g_entities[self->client->ps.genericEnemyIndex];
ADDRLP4 44
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4376
;4375:
;4376:		if (!en || !en->client)
ADDRLP4 1184
CNSTU4 0
ASGNU4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 1184
INDIRU4
EQU4 $2306
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1184
INDIRU4
NEU4 $2304
LABELV $2306
line 4377
;4377:		{
line 4378
;4378:			self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4379
;4379:		}
ADDRGP4 $2305
JUMPV
LABELV $2304
line 4380
;4380:		else if (en->s.number == self->s.number)
ADDRLP4 44
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $2307
line 4381
;4381:		{
line 4382
;4382:			self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4383
;4383:		}
ADDRGP4 $2308
JUMPV
LABELV $2307
line 4384
;4384:		else if (en->health < 1)
ADDRLP4 44
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2309
line 4385
;4385:		{
line 4386
;4386:			self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4387
;4387:		}
ADDRGP4 $2310
JUMPV
LABELV $2309
line 4388
;4388:		else if (OnSameTeam(self, en))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 1188
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 0
EQI4 $2311
line 4389
;4389:		{
line 4390
;4390:			self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4391
;4391:		}
ADDRGP4 $2312
JUMPV
LABELV $2311
line 4393
;4392:		else
;4393:		{
line 4394
;4394:			if (!InFront(en->client->ps.origin, self->client->ps.origin, self->client->ps.viewangles, 0.8f ))
ADDRLP4 1192
CNSTI4 408
ASGNI4
ADDRLP4 1196
CNSTI4 20
ASGNI4
ADDRLP4 44
INDIRP4
ADDRLP4 1192
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
ARGP4
ADDRLP4 1200
ADDRFP4 0
INDIRP4
ADDRLP4 1192
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
ARGP4
ADDRLP4 1200
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1061997773
ARGF4
ADDRLP4 1204
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 1204
INDIRI4
CNSTI4 0
NEI4 $2313
line 4395
;4395:			{
line 4396
;4396:				self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4397
;4397:			}
ADDRGP4 $2314
JUMPV
LABELV $2313
line 4398
;4398:			else if (!OrgVisible(self->client->ps.origin, en->client->ps.origin, self->s.number))
ADDRLP4 1208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
CNSTI4 408
ASGNI4
ADDRLP4 1216
CNSTI4 20
ASGNI4
ADDRLP4 1208
INDIRP4
ADDRLP4 1212
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1216
INDIRI4
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
ADDRLP4 1212
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1216
INDIRI4
ADDP4
ARGP4
ADDRLP4 1208
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1220
ADDRGP4 OrgVisible
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 0
NEI4 $2315
line 4399
;4399:			{
line 4400
;4400:				self->client->ps.genericEnemyIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 1023
ASGNI4
line 4401
;4401:			}
LABELV $2315
LABELV $2314
line 4402
;4402:		}
LABELV $2312
LABELV $2310
LABELV $2308
LABELV $2305
line 4403
;4403:	}
LABELV $2302
line 4405
;4404:
;4405:	if (self->client->ps.genericEnemyIndex == ENTITYNUM_NONE || self->client->ps.genericEnemyIndex == -1)
ADDRLP4 1180
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 1023
EQI4 $2319
ADDRLP4 1180
INDIRI4
CNSTI4 -1
NEI4 $2317
LABELV $2319
line 4406
;4406:	{
line 4407
;4407:		FindGenericEnemyIndex(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FindGenericEnemyIndex
CALLV
pop
line 4408
;4408:	}
LABELV $2317
line 4410
;4409:
;4410:	if (self->client->ps.genericEnemyIndex != ENTITYNUM_NONE && self->client->ps.genericEnemyIndex != -1)
ADDRLP4 1184
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 1023
EQI4 $2320
ADDRLP4 1184
INDIRI4
CNSTI4 -1
EQI4 $2320
line 4411
;4411:	{
line 4412
;4412:		en = &g_entities[self->client->ps.genericEnemyIndex];
ADDRLP4 44
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4414
;4413:
;4414:		VectorCopy(self->client->ps.origin, elevated);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 4415
;4415:		elevated[2] += 40;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 4417
;4416:
;4417:		angle = ((nowTime / 12) & 255) * (M_PI * 2) / 255; //magical numbers make magic happen
ADDRLP4 40
CNSTF4 1086918619
ADDRLP4 24
INDIRI4
CNSTI4 12
DIVI4
CNSTI4 255
BANDI4
CVIF4 4
MULF4
CNSTF4 1132396544
DIVF4
ASGNF4
line 4418
;4418:		dir[0] = cos(angle) * 20;
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 1188
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0
CNSTF4 1101004800
ADDRLP4 1188
INDIRF4
MULF4
ASGNF4
line 4419
;4419:		dir[1] = sin(angle) * 20;
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 1192
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
CNSTF4 1101004800
ADDRLP4 1192
INDIRF4
MULF4
ASGNF4
line 4420
;4420:		dir[2] = cos(angle) * 5;
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 1196
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1084227584
ADDRLP4 1196
INDIRF4
MULF4
ASGNF4
line 4421
;4421:		VectorAdd(elevated, dir, org);
ADDRLP4 28
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 4424
;4422:
;4423:		//org is now where the thing should be client-side because it uses the same time-based offset
;4424:		if (self->client->ps.droneFireTime < nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 24
INDIRI4
CVIF4 4
GEF4 $2331
line 4425
;4425:		{
line 4426
;4426:			JP_Trace(&tr, org, NULL, NULL, en->client->ps.origin, -1, MASK_SOLID);
ADDRLP4 64
ARGP4
ADDRLP4 28
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
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 4428
;4427:
;4428:			if (tr.fraction == 1 && !tr.startsolid && !tr.allsolid)
ADDRLP4 64+8
INDIRF4
CNSTF4 1065353216
NEF4 $2333
ADDRLP4 1204
CNSTI4 0
ASGNI4
ADDRLP4 64+4
INDIRI4
ADDRLP4 1204
INDIRI4
NEI4 $2333
ADDRLP4 64
INDIRI4
ADDRLP4 1204
INDIRI4
NEI4 $2333
line 4429
;4429:			{
line 4430
;4430:				VectorSubtract(en->client->ps.origin, org, endir);
ADDRLP4 1208
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1144
ADDRLP4 1208
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1144+4
ADDRLP4 1208
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 28+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1144+8
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 28+8
INDIRF4
SUBF4
ASGNF4
line 4431
;4431:				VectorNormalize(endir);
ADDRLP4 1144
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 4433
;4432:
;4433:				WP_FireGenericBlasterMissile(self, org, endir, 0, 15, 2000, MOD_BLASTER);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 1144
ARGP4
CNSTI4 0
ARGI4
CNSTI4 15
ARGI4
CNSTI4 2000
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 WP_FireGenericBlasterMissile
CALLV
pop
line 4434
;4434:				G_SoundAtLoc( org, CHAN_WEAPON, G_SoundIndex("sound/weapons/bryar/fire.wav") );
ADDRGP4 $2341
ARGP4
ADDRLP4 1212
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 28
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1212
INDIRI4
ARGI4
ADDRGP4 G_SoundAtLoc
CALLV
pop
line 4436
;4435:
;4436:				self->client->ps.droneFireTime = nowTime + (self->client->sess.raceMode? 550: Q_irandExpectedIf(gRandomUnlockAdd, 400, 700, self->client && self->client->sess.raceMode, 550));
ADDRLP4 1224
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2344
ADDRLP4 1216
CNSTI4 550
ASGNI4
ADDRGP4 $2345
JUMPV
LABELV $2344
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 400
ARGI4
CNSTI4 700
ARGI4
ADDRLP4 1228
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1228
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2346
ADDRLP4 1228
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2346
ADDRLP4 1220
CNSTI4 1
ASGNI4
ADDRGP4 $2347
JUMPV
LABELV $2346
ADDRLP4 1220
CNSTI4 0
ASGNI4
LABELV $2347
ADDRLP4 1220
INDIRI4
ARGI4
CNSTI4 550
ARGI4
ADDRLP4 1232
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 1216
ADDRLP4 1232
INDIRI4
ASGNI4
LABELV $2345
ADDRLP4 1224
INDIRP4
CNSTI4 628
ADDP4
ADDRLP4 24
INDIRI4
ADDRLP4 1216
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 4437
;4437:			}
LABELV $2333
line 4438
;4438:		}
LABELV $2331
line 4439
;4439:	}
LABELV $2320
line 4440
;4440:}
LABELV $2253
endproc SeekerDroneUpdate 1236 28
export HolocronUpdate
proc HolocronUpdate 28 8
line 4443
;4441:
;4442:void HolocronUpdate(gentity_t *self)
;4443:{ //keep holocron status updated in holocron mode
line 4444
;4444:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4445
;4445:	int noHRank = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4447
;4446:
;4447:	if (noHRank < FORCE_LEVEL_0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $2349
line 4448
;4448:	{
line 4449
;4449:		noHRank = FORCE_LEVEL_0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4450
;4450:	}
LABELV $2349
line 4451
;4451:	if (noHRank > FORCE_LEVEL_3)
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $2351
line 4452
;4452:	{
line 4453
;4453:		noHRank = FORCE_LEVEL_3;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 4454
;4454:	}
LABELV $2351
line 4456
;4455:
;4456:	trap_Cvar_Update(&g_MaxHolocronCarry);
ADDRGP4 g_MaxHolocronCarry
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
ADDRGP4 $2354
JUMPV
LABELV $2353
line 4459
;4457:
;4458:	while (i < NUM_FORCE_POWERS)
;4459:	{
line 4460
;4460:		if (self->client->ps.holocronsCarried[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2356
line 4461
;4461:		{ //carrying it, make sure we have the power
line 4462
;4462:			self->client->ps.holocronBits |= (1 << i);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 4463
;4463:			self->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
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
line 4464
;4464:			self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 4465
;4465:		}
ADDRGP4 $2357
JUMPV
LABELV $2356
line 4467
;4466:		else
;4467:		{ //otherwise, make sure the power is cleared from us
line 4468
;4468:			self->client->ps.fd.forcePowerLevel[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 4469
;4469:			if (self->client->ps.holocronBits & (1 << i))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2358
line 4470
;4470:			{
line 4471
;4471:				self->client->ps.holocronBits -= (1 << i);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
SUBI4
ASGNI4
line 4472
;4472:			}
LABELV $2358
line 4474
;4473:
;4474:			if ((self->client->ps.fd.forcePowersKnown & (1 << i)) && i != FP_LEVITATION && i != FP_SABERATTACK)
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2360
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $2360
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $2360
line 4475
;4475:			{
line 4476
;4476:				self->client->ps.fd.forcePowersKnown -= (1 << i);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
SUBI4
ASGNI4
line 4477
;4477:			}
LABELV $2360
line 4479
;4478:
;4479:			if ((self->client->ps.fd.forcePowersActive & (1 << i)) && i != FP_LEVITATION && i != FP_SABERATTACK)
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2362
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $2362
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $2362
line 4480
;4480:			{
line 4481
;4481:				WP_ForcePowerStop(self, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4482
;4482:			}
LABELV $2362
line 4484
;4483:
;4484:			if (i == FP_LEVITATION)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $2364
line 4485
;4485:			{
line 4486
;4486:				if (noHRank >= FORCE_LEVEL_1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $2366
line 4487
;4487:				{
line 4488
;4488:					self->client->ps.fd.forcePowerLevel[i] = noHRank;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 4489
;4489:				}
ADDRGP4 $2365
JUMPV
LABELV $2366
line 4491
;4490:				else
;4491:				{
line 4492
;4492:					self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4493
;4493:				}
line 4494
;4494:			}
ADDRGP4 $2365
JUMPV
LABELV $2364
line 4495
;4495:			else if (i == FP_SABERATTACK)
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $2368
line 4496
;4496:			{
line 4497
;4497:				self->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 4499
;4498:
;4499:				if (noHRank >= FORCE_LEVEL_1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $2370
line 4500
;4500:				{
line 4501
;4501:					self->client->ps.fd.forcePowerLevel[i] = noHRank;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 4502
;4502:				}
ADDRGP4 $2369
JUMPV
LABELV $2370
line 4504
;4503:				else
;4504:				{
line 4505
;4505:					self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4506
;4506:				}
line 4507
;4507:			}
ADDRGP4 $2369
JUMPV
LABELV $2368
line 4509
;4508:			else
;4509:			{
line 4510
;4510:				self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 4511
;4511:			}
LABELV $2369
LABELV $2365
line 4512
;4512:		}
LABELV $2357
line 4514
;4513:
;4514:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4515
;4515:	}
LABELV $2354
line 4458
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2353
line 4517
;4516:
;4517:	if (HasSetSaberOnly())
ADDRLP4 8
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $2372
line 4518
;4518:	{ //if saberonly, we get these powers no matter what (still need the holocrons for level 3)
line 4519
;4519:		if (self->client->ps.fd.forcePowerLevel[FP_SABERATTACK] < FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2374
line 4520
;4520:		{
line 4521
;4521:			self->client->ps.fd.forcePowerLevel[FP_SABERATTACK] = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
CNSTI4 1
ASGNI4
line 4522
;4522:		}
LABELV $2374
line 4523
;4523:		if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] < FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2376
line 4524
;4524:		{
line 4525
;4525:			self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 1
ASGNI4
line 4526
;4526:		}
LABELV $2376
line 4527
;4527:	}
LABELV $2372
line 4528
;4528:}
LABELV $2348
endproc HolocronUpdate 28 8
export JediMasterUpdate
proc JediMasterUpdate 20 8
line 4531
;4529:
;4530:void JediMasterUpdate(gentity_t *self)
;4531:{ //keep jedi master status updated for JM gametype
line 4532
;4532:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4534
;4533:
;4534:	trap_Cvar_Update(&g_MaxHolocronCarry);
ADDRGP4 g_MaxHolocronCarry
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
ADDRGP4 $2380
JUMPV
LABELV $2379
line 4537
;4535:
;4536:	while (i < NUM_FORCE_POWERS)
;4537:	{
line 4538
;4538:		if (self->client->ps.isJediMaster)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2382
line 4539
;4539:		{
line 4540
;4540:			self->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 4541
;4541:			self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 4543
;4542:
;4543:			if (i == FP_TEAM_HEAL || i == FP_TEAM_FORCE ||
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $2388
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $2388
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $2388
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $2384
LABELV $2388
line 4545
;4544:				i == FP_DRAIN || i == FP_ABSORB)
;4545:			{ //team powers are useless in JM, absorb is too because no one else has powers to absorb. Drain is just
line 4548
;4546:			  //relatively useless in comparison, because its main intent is not to heal, but rather to cripple others
;4547:			  //by draining their force at the same time. And no one needs force in JM except the JM himself.
;4548:				self->client->ps.fd.forcePowersKnown &= ~(1 << i);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
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
BCOMI4
BANDI4
ASGNI4
line 4549
;4549:				self->client->ps.fd.forcePowerLevel[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 4550
;4550:			}
LABELV $2384
line 4552
;4551:
;4552:			if (i == FP_TELEPATHY)
ADDRLP4 0
INDIRI4
CNSTI4 5
NEI4 $2383
line 4553
;4553:			{ //this decision was made because level 3 mindtrick allows the JM to just hide too much, and no one else has force
line 4556
;4554:			  //sight to counteract it. Since the JM himself is the focus of gameplay in this mode, having him hidden for large
;4555:			  //durations is indeed a bad thing.
;4556:				self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_2;
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 4557
;4557:			}
line 4558
;4558:		}
ADDRGP4 $2383
JUMPV
LABELV $2382
line 4560
;4559:		else
;4560:		{
line 4561
;4561:			if ((self->client->ps.fd.forcePowersKnown & (1 << i)) && i != FP_LEVITATION)
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2391
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2391
line 4562
;4562:			{
line 4563
;4563:				self->client->ps.fd.forcePowersKnown -= (1 << i);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
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
SUBI4
ASGNI4
line 4564
;4564:			}
LABELV $2391
line 4566
;4565:
;4566:			if ((self->client->ps.fd.forcePowersActive & (1 << i)) && i != FP_LEVITATION)
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2393
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $2393
line 4567
;4567:			{
line 4568
;4568:				WP_ForcePowerStop(self, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4569
;4569:			}
LABELV $2393
line 4571
;4570:
;4571:			if (i == FP_LEVITATION)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $2395
line 4572
;4572:			{
line 4573
;4573:				self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4574
;4574:			}
ADDRGP4 $2396
JUMPV
LABELV $2395
line 4576
;4575:			else
;4576:			{
line 4577
;4577:				self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 4578
;4578:			}
LABELV $2396
line 4579
;4579:		}
LABELV $2383
line 4581
;4580:
;4581:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4582
;4582:	}
LABELV $2380
line 4536
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2379
line 4583
;4583:}
LABELV $2378
endproc JediMasterUpdate 20 8
export WP_HasForcePowers
proc WP_HasForcePowers 4 0
line 4586
;4584:
;4585:qboolean WP_HasForcePowers( const playerState_t *ps )
;4586:{
line 4588
;4587:	int i;
;4588:	if ( ps )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2398
line 4589
;4589:	{
line 4590
;4590:		for ( i = 0; i < NUM_FORCE_POWERS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2400
line 4591
;4591:		{
line 4592
;4592:			if ( i == FP_LEVITATION )
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $2404
line 4593
;4593:			{
line 4594
;4594:				if ( ps->fd.forcePowerLevel[i] > FORCE_LEVEL_1 )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2405
line 4595
;4595:				{
line 4596
;4596:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2397
JUMPV
line 4598
;4597:				}
;4598:			}
LABELV $2404
line 4599
;4599:			else if ( ps->fd.forcePowerLevel[i] > FORCE_LEVEL_0 )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2408
line 4600
;4600:			{
line 4601
;4601:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2397
JUMPV
LABELV $2408
LABELV $2405
line 4603
;4602:			}
;4603:		}
LABELV $2401
line 4590
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2400
line 4604
;4604:	}
LABELV $2398
line 4605
;4605:	return qfalse;
CNSTI4 0
RETI4
LABELV $2397
endproc WP_HasForcePowers 4 0
export WP_ForcePowersUpdate
proc WP_ForcePowersUpdate 156 32
line 4609
;4606:}
;4607:
;4608:void WP_ForcePowersUpdate( gentity_t *self, usercmd_t *ucmd)
;4609:{
line 4610
;4610:	qboolean	usingForce = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 4611
;4611:	qboolean	chargeJumping = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 4614
;4612:	vec3_t		dmgdir;
;4613:	int			i, holo, holoregen;
;4614:	int			prepower = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 4615
;4615:	int			nowTime = LEVELTIME(self->client);
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2415
ADDRLP4 52
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2415
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2417
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $2418
JUMPV
LABELV $2417
ADDRLP4 48
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $2418
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
ADDRGP4 $2416
JUMPV
LABELV $2415
ADDRLP4 44
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $2416
ADDRLP4 4
ADDRLP4 44
INDIRI4
ASGNI4
line 4616
;4616:	int			moveStyle = self->client->sess.raceMode ? self->client->sess.raceStyle.movementStyle : MV_JK2;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2420
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRGP4 $2421
JUMPV
LABELV $2420
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $2421
ADDRLP4 20
ADDRLP4 56
INDIRI4
ASGNI4
line 4618
;4617:	//see if any force powers are running
;4618:	if ( !self )
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2422
line 4619
;4619:	{
line 4620
;4620:		return;
ADDRGP4 $2410
JUMPV
LABELV $2422
line 4623
;4621:	}
;4622:
;4623:	if ( !self->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2424
line 4624
;4624:	{
line 4625
;4625:		return;
ADDRGP4 $2410
JUMPV
LABELV $2424
line 4628
;4626:	}
;4627:
;4628:	if (self->client->ps.pm_flags & PMF_FOLLOW)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $2426
line 4629
;4629:	{ //not a "real" game client, it's a spectator following someone
line 4630
;4630:		return;
ADDRGP4 $2410
JUMPV
LABELV $2426
line 4632
;4631:	}
;4632:	if (self->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2428
line 4633
;4633:	{
line 4634
;4634:		return;
ADDRGP4 $2410
JUMPV
LABELV $2428
line 4637
;4635:	}
;4636:
;4637:	if (self->client->ps.fd.saberAnimLevel > self->client->ps.fd.forcePowerLevel[FP_SABERATTACK])
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ADDRLP4 60
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
LEI4 $2430
line 4638
;4638:	{
line 4639
;4639:		self->client->ps.fd.saberAnimLevel = self->client->ps.fd.forcePowerLevel[FP_SABERATTACK];
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
ASGNI4
line 4640
;4640:	}
ADDRGP4 $2431
JUMPV
LABELV $2430
line 4641
;4641:	else if (!self->client->ps.fd.saberAnimLevel)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2432
line 4642
;4642:	{
line 4643
;4643:		self->client->ps.fd.saberAnimLevel = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 1
ASGNI4
line 4644
;4644:	}
LABELV $2432
LABELV $2431
line 4646
;4645:
;4646:	if (!(self->client->ps.fd.forcePowersKnown & (1 << FP_LEVITATION)))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $2434
line 4647
;4647:	{
line 4648
;4648:		self->client->ps.fd.forcePowersKnown |= (1 << FP_LEVITATION);
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
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
line 4649
;4649:	}
LABELV $2434
line 4651
;4650:
;4651:	if (self->client->ps.fd.forcePowerLevel[FP_LEVITATION] < FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2436
line 4652
;4652:	{
line 4653
;4653:		self->client->ps.fd.forcePowerLevel[FP_LEVITATION] = FORCE_LEVEL_1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 948
ADDP4
CNSTI4 1
ASGNI4
line 4654
;4654:	}
LABELV $2436
line 4656
;4655:
;4656:	if (self->client->ps.fd.forcePowerSelected < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 0
GEI4 $2438
line 4657
;4657:	{ //bad
line 4658
;4658:		self->client->ps.fd.forcePowerSelected = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
CNSTI4 0
ASGNI4
line 4659
;4659:	}
LABELV $2438
line 4661
;4660:
;4661:	if ( ((self->client->sess.selectedFP != self->client->ps.fd.forcePowerSelected) ||
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 43464
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
NEI4 $2442
ADDRLP4 64
INDIRP4
CNSTI4 43468
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
EQI4 $2440
LABELV $2442
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $2440
line 4664
;4662:		(self->client->sess.saberLevel != self->client->ps.fd.saberAnimLevel)) &&
;4663:		!(self->r.svFlags & SVF_BOT) )
;4664:	{
line 4665
;4665:		if (self->client->sess.updateUITime < nowTime) // uh does this condition even do anything? updateUITime isnt set anywhere?
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43476
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $2443
line 4666
;4666:		{ //a bit hackish, but we don't want the client to flood with userinfo updates if they rapidly cycle
line 4669
;4667:		  //through their force powers or saber attack levels
;4668:
;4669:			self->client->sess.selectedFP = self->client->ps.fd.forcePowerSelected;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 43464
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
line 4670
;4670:			self->client->sess.saberLevel = self->client->ps.fd.saberAnimLevel;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 43468
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 4671
;4671:		}
LABELV $2443
line 4672
;4672:	}
LABELV $2440
line 4674
;4673:
;4674:	if (!g_LastFrameTime)
ADDRGP4 g_LastFrameTime
INDIRI4
CNSTI4 0
NEI4 $2445
line 4675
;4675:	{
line 4676
;4676:		g_LastFrameTime = level.time;
ADDRGP4 g_LastFrameTime
ADDRGP4 level+36
INDIRI4
ASGNI4
line 4677
;4677:	}
LABELV $2445
line 4679
;4678:
;4679:	if (self->client->ps.forceHandExtend == HANDEXTEND_KNOCKDOWN)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $2448
line 4680
;4680:	{
line 4681
;4681:		self->client->ps.zoomFov = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1344
ADDP4
CNSTF4 0
ASGNF4
line 4682
;4682:		self->client->ps.zoomMode = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 4683
;4683:		self->client->ps.zoomLocked = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 4684
;4684:		self->client->ps.zoomTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1336
ADDP4
CNSTI4 0
ASGNI4
line 4685
;4685:	}
LABELV $2448
line 4687
;4686:
;4687:	if ( jk2gameplay == VERSION_1_04 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $2450
line 4688
;4688:	{
line 4689
;4689:		if (self->client->ps.forceHandExtend == HANDEXTEND_KNOCKDOWN &&
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $2452
ADDRLP4 68
INDIRP4
CNSTI4 1252
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $2452
line 4691
;4690:			self->client->ps.forceHandExtendTime >= nowTime)
;4691:		{
line 4692
;4692:			self->client->ps.saberMove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 4693
;4693:			self->client->ps.saberBlocking = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 0
ASGNI4
line 4694
;4694:			self->client->ps.saberBlocked = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 4695
;4695:			self->client->ps.weaponTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 4696
;4696:		}
ADDRGP4 $2451
JUMPV
LABELV $2452
line 4697
;4697:		else if (self->client->ps.forceHandExtend != HANDEXTEND_NONE &&
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2451
ADDRLP4 72
INDIRP4
CNSTI4 1252
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $2451
line 4699
;4698:			self->client->ps.forceHandExtendTime < nowTime)
;4699:		{
line 4700
;4700:			if (self->client->ps.forceHandExtend == HANDEXTEND_KNOCKDOWN &&
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $2456
ADDRLP4 76
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2456
line 4702
;4701:				!self->client->ps.forceDodgeAnim)
;4702:			{
line 4703
;4703:				if (self->health < 1 || (self->client->ps.eFlags & EF_DEAD))
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
CNSTI4 1
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
LTI4 $2460
ADDRLP4 80
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
BANDI4
CNSTI4 0
EQI4 $2458
LABELV $2460
line 4704
;4704:				{
line 4705
;4705:					self->client->ps.forceHandExtend = HANDEXTEND_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 0
ASGNI4
line 4706
;4706:				}
ADDRGP4 $2451
JUMPV
LABELV $2458
line 4708
;4707:				else
;4708:				{
line 4709
;4709:					if (self->client->pers.cmd.upmove &&
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2461
ADDRLP4 88
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2461
line 4711
;4710:						self->client->ps.fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_1)
;4711:					{ //force getup
line 4712
;4712:						G_PreDefSound(self->client->ps.origin, PDSOUND_FORCEJUMP);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 4713
;4713:						self->client->ps.forceDodgeAnim = 2;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 2
ASGNI4
line 4714
;4714:						self->client->ps.forceHandExtendTime = nowTime + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4716
;4715:
;4716:						self->client->ps.velocity[2] = 400;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1137180672
ASGNF4
line 4717
;4717:					}
ADDRGP4 $2451
JUMPV
LABELV $2461
line 4718
;4718:					else if (self->client->ps.quickerGetup)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2463
line 4719
;4719:					{
line 4720
;4720:						self->client->ps.quickerGetup = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1264
ADDP4
CNSTI4 0
ASGNI4
line 4721
;4721:						G_EntitySound( self, CHAN_VOICE, G_SoundIndex("*jump1.wav") );
ADDRGP4 $2465
ARGP4
ADDRLP4 92
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 92
INDIRI4
ARGI4
ADDRGP4 G_EntitySound
CALLV
pop
line 4722
;4722:						self->client->ps.forceDodgeAnim = 3;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 3
ASGNI4
line 4723
;4723:						self->client->ps.forceHandExtendTime = nowTime + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 4724
;4724:						self->client->ps.velocity[2] = 300;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ASGNF4
line 4725
;4725:					}
ADDRGP4 $2451
JUMPV
LABELV $2463
line 4727
;4726:					else
;4727:					{
line 4728
;4728:						self->client->ps.forceDodgeAnim = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 1
ASGNI4
line 4729
;4729:						self->client->ps.forceHandExtendTime = nowTime + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 4730
;4730:					}
line 4731
;4731:				}
line 4732
;4732:			}
ADDRGP4 $2451
JUMPV
LABELV $2456
line 4734
;4733:			else
;4734:			{
line 4735
;4735:				self->client->ps.forceHandExtend = HANDEXTEND_WEAPONREADY;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 6
ASGNI4
line 4736
;4736:			}
line 4737
;4737:		}
line 4738
;4738:	}
ADDRGP4 $2451
JUMPV
LABELV $2450
line 4740
;4739:	else
;4740:	{
line 4741
;4741:		if (self->client->ps.forceHandExtend != HANDEXTEND_NONE &&
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2466
ADDRLP4 68
INDIRP4
CNSTI4 1252
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $2466
line 4743
;4742:			self->client->ps.forceHandExtendTime < nowTime)
;4743:		{
line 4744
;4744:			if (self->client->ps.forceHandExtend == HANDEXTEND_KNOCKDOWN &&
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $2468
ADDRLP4 72
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2468
line 4746
;4745:				!self->client->ps.forceDodgeAnim)
;4746:			{
line 4747
;4747:				if (self->client->pers.cmd.upmove &&
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2470
ADDRLP4 76
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2470
line 4749
;4748:					self->client->ps.fd.forcePowerLevel[FP_LEVITATION] > FORCE_LEVEL_1)
;4749:				{ //force getup
line 4750
;4750:					G_PreDefSound(self->client->ps.origin, PDSOUND_FORCEJUMP);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 4751
;4751:					self->client->ps.forceDodgeAnim = 2;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 2
ASGNI4
line 4752
;4752:					self->client->ps.forceHandExtendTime = nowTime + 800;//1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 800
ADDI4
ASGNI4
line 4754
;4753:
;4754:					self->client->ps.velocity[2] = 300;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ASGNF4
line 4755
;4755:				}
ADDRGP4 $2469
JUMPV
LABELV $2470
line 4756
;4756:				else if (self->client->ps.quickerGetup)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1264
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2472
line 4757
;4757:				{
line 4758
;4758:					self->client->ps.quickerGetup = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1264
ADDP4
CNSTI4 0
ASGNI4
line 4759
;4759:					G_EntitySound( self, CHAN_VOICE, G_SoundIndex("*jump1.wav") );
ADDRGP4 $2465
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 G_EntitySound
CALLV
pop
line 4760
;4760:					self->client->ps.forceDodgeAnim = 3;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 3
ASGNI4
line 4761
;4761:					self->client->ps.forceHandExtendTime = nowTime + 600;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 600
ADDI4
ASGNI4
line 4762
;4762:					self->client->ps.velocity[2] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1128792064
ASGNF4
line 4763
;4763:				}
ADDRGP4 $2469
JUMPV
LABELV $2472
line 4765
;4764:				else
;4765:				{
line 4766
;4766:					self->client->ps.forceDodgeAnim = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 1
ASGNI4
line 4767
;4767:					self->client->ps.forceHandExtendTime = nowTime + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 4768
;4768:				}
line 4769
;4769:			}
ADDRGP4 $2469
JUMPV
LABELV $2468
line 4771
;4770:			else
;4771:			{
line 4772
;4772:				self->client->ps.forceHandExtend = HANDEXTEND_WEAPONREADY;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 6
ASGNI4
line 4773
;4773:			}
LABELV $2469
line 4774
;4774:		}
LABELV $2466
line 4775
;4775:	}
LABELV $2451
line 4777
;4776:
;4777:	if (g_gametype.integer == GT_HOLOCRON)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $2474
line 4778
;4778:	{
line 4779
;4779:		HolocronUpdate(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HolocronUpdate
CALLV
pop
line 4780
;4780:	}
LABELV $2474
line 4781
;4781:	if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $2477
line 4782
;4782:	{
line 4783
;4783:		JediMasterUpdate(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 JediMasterUpdate
CALLV
pop
line 4784
;4784:	}
LABELV $2477
line 4786
;4785:
;4786:	SeekerDroneUpdate(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SeekerDroneUpdate
CALLV
pop
line 4788
;4787:
;4788:	if (self->client->ps.powerups[PW_FORCE_BOON])
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2480
line 4789
;4789:	{
line 4790
;4790:		prepower = self->client->ps.fd.forcePower;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ASGNI4
line 4791
;4791:	}
LABELV $2480
line 4793
;4792:
;4793:	if (self && self->client && (BG_HasYsalamiri(g_gametype.integer, &self->client->ps) ||
ADDRLP4 68
ADDRFP4 0
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
EQU4 $2482
ADDRLP4 76
ADDRLP4 68
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $2482
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $2485
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1196
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $2482
LABELV $2485
line 4795
;4794:		self->client->ps.fd.forceDeactivateAll))
;4795:	{ //has ysalamiri.. or we want to forcefully stop all his active powers
line 4796
;4796:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2487
JUMPV
LABELV $2486
line 4799
;4797:
;4798:		while (i < NUM_FORCE_POWERS)
;4799:		{
line 4800
;4800:			if ((self->client->ps.fd.forcePowersActive & (1 << i)) && i != FP_LEVITATION)
ADDRLP4 88
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2489
ADDRLP4 0
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $2489
line 4801
;4801:			{
line 4802
;4802:				WP_ForcePowerStop(self, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4803
;4803:			}
LABELV $2489
line 4805
;4804:
;4805:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4806
;4806:		}
LABELV $2487
line 4798
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2486
line 4808
;4807:
;4808:		self->client->ps.fd.forceDeactivateAll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1196
ADDP4
CNSTI4 0
ASGNI4
line 4810
;4809:
;4810:		if (self->client->ps.fd.forceJumpCharge)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2483
line 4811
;4811:		{
line 4812
;4812:			G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
line 4813
;4813:			self->client->ps.fd.forceJumpCharge = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
CNSTF4 0
ASGNF4
line 4814
;4814:		}
line 4815
;4815:	}
ADDRGP4 $2483
JUMPV
LABELV $2482
line 4817
;4816:	else
;4817:	{ //otherwise just do a check through them all to see if they need to be stopped for any reason.
line 4818
;4818:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2494
JUMPV
LABELV $2493
line 4821
;4819:
;4820:		while (i < NUM_FORCE_POWERS)
;4821:		{
line 4822
;4822:			if ((self->client->ps.fd.forcePowersActive & (1 << i)) && i != FP_LEVITATION &&
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
CNSTI4 1
ASGNI4
ADDRLP4 88
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2496
ADDRLP4 0
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $2496
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $2496
line 4824
;4823:				!BG_CanUseFPNow(g_gametype.integer, &self->client->ps, nowTime, i))
;4824:			{
line 4825
;4825:				WP_ForcePowerStop(self, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4826
;4826:			}
LABELV $2496
line 4828
;4827:
;4828:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4829
;4829:		}
LABELV $2494
line 4820
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2493
line 4830
;4830:	}
LABELV $2483
line 4832
;4831:
;4832:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4834
;4833:
;4834:	if (self->client->ps.powerups[PW_FORCE_ENLIGHTENED_LIGHT] || self->client->ps.powerups[PW_FORCE_ENLIGHTENED_DARK])
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRLP4 88
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $2501
ADDRLP4 88
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $2499
LABELV $2501
line 4835
;4835:	{ //enlightenment
line 4836
;4836:		if (!self->client->ps.fd.forceUsingAdded)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1088
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2500
line 4837
;4837:		{
line 4838
;4838:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2505
JUMPV
LABELV $2504
line 4841
;4839:
;4840:			while (i < NUM_FORCE_POWERS)
;4841:			{
line 4842
;4842:				self->client->ps.fd.forcePowerBaseLevel[i] = self->client->ps.fd.forcePowerLevel[i];
ADDRLP4 96
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRI4
ADDRLP4 100
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
ADDRLP4 96
INDIRI4
ADDRLP4 100
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
ASGNI4
line 4844
;4843:
;4844:				if (!forcePowerDarkLight[i] ||
ADDRLP4 104
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerDarkLight
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $2509
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1188
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $2507
LABELV $2509
line 4846
;4845:					self->client->ps.fd.forceSide == forcePowerDarkLight[i])
;4846:				{
line 4847
;4847:					self->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 4848
;4848:					self->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 4849
;4849:				}
LABELV $2507
line 4851
;4850:
;4851:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4852
;4852:			}
LABELV $2505
line 4840
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2504
line 4854
;4853:
;4854:			self->client->ps.fd.forceUsingAdded = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1088
ADDP4
CNSTI4 1
ASGNI4
line 4855
;4855:		}
line 4856
;4856:	}
ADDRGP4 $2500
JUMPV
LABELV $2499
line 4857
;4857:	else if (self->client->ps.fd.forceUsingAdded)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1088
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2510
line 4858
;4858:	{ //we don't have enlightenment but we're still using enlightened powers, so clear them back to how they should be.
line 4859
;4859:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2513
JUMPV
LABELV $2512
line 4862
;4860:
;4861:		while (i < NUM_FORCE_POWERS)
;4862:		{
line 4863
;4863:			self->client->ps.fd.forcePowerLevel[i] = self->client->ps.fd.forcePowerBaseLevel[i];
ADDRLP4 96
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRI4
ADDRLP4 100
INDIRP4
CNSTI4 944
ADDP4
ADDP4
ADDRLP4 96
INDIRI4
ADDRLP4 100
INDIRP4
CNSTI4 1016
ADDP4
ADDP4
INDIRI4
ASGNI4
line 4864
;4864:			if (!self->client->ps.fd.forcePowerLevel[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2515
line 4865
;4865:			{
line 4866
;4866:				if (self->client->ps.fd.forcePowersActive & (1 << i))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2517
line 4867
;4867:				{
line 4868
;4868:					WP_ForcePowerStop(self, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4869
;4869:				}
LABELV $2517
line 4870
;4870:				self->client->ps.fd.forcePowersKnown &= ~(1 << i);
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 4871
;4871:			}
LABELV $2515
line 4873
;4872:
;4873:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4874
;4874:		}
LABELV $2513
line 4861
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2512
line 4876
;4875:
;4876:		self->client->ps.fd.forceUsingAdded = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1088
ADDP4
CNSTI4 0
ASGNI4
line 4877
;4877:	}
LABELV $2510
LABELV $2500
line 4879
;4878:
;4879:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4881
;4880:
;4881:	if (!(self->client->ps.fd.forcePowersActive & (1 << FP_TELEPATHY)))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $2519
line 4882
;4882:	{ //clear the mindtrick index values
line 4883
;4883:		self->client->ps.fd.forceMindtrickTargetIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1156
ADDP4
CNSTI4 0
ASGNI4
line 4884
;4884:		self->client->ps.fd.forceMindtrickTargetIndex2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1160
ADDP4
CNSTI4 0
ASGNI4
line 4885
;4885:		self->client->ps.fd.forceMindtrickTargetIndex3 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1164
ADDP4
CNSTI4 0
ASGNI4
line 4886
;4886:		self->client->ps.fd.forceMindtrickTargetIndex4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1168
ADDP4
CNSTI4 0
ASGNI4
line 4887
;4887:	}
LABELV $2519
line 4889
;4888:	
;4889:	if (self->health < 1)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $2521
line 4890
;4890:	{
line 4891
;4891:		self->client->ps.fd.forceGripBeingGripped = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
CNSTF4 0
ASGNF4
line 4892
;4892:	}
LABELV $2521
line 4894
;4893:
;4894:	if (self->client->ps.fd.forceGripBeingGripped > nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1116
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
LEF4 $2523
line 4895
;4895:	{
line 4896
;4896:		self->client->ps.fd.forceGripCripple = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
CNSTI4 1
ASGNI4
line 4897
;4897:	}
ADDRGP4 $2524
JUMPV
LABELV $2523
line 4899
;4898:	else
;4899:	{
line 4900
;4900:		self->client->ps.fd.forceGripCripple = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
CNSTI4 0
ASGNI4
line 4901
;4901:	}
LABELV $2524
line 4903
;4902:
;4903:	if (self->client->ps.fd.forceJumpSound)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1100
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2525
line 4904
;4904:	{
line 4905
;4905:		G_PreDefSound(self->client->ps.origin, PDSOUND_FORCEJUMP);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 4906
;4906:		self->client->ps.fd.forceJumpSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 0
ASGNI4
line 4907
;4907:	}
LABELV $2525
line 4909
;4908:
;4909:	if (self->client->ps.fd.forceGripCripple)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2527
line 4910
;4910:	{
line 4911
;4911:		if (self->client->ps.fd.forceGripSoundTime < nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1128
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
GEF4 $2529
line 4912
;4912:		{
line 4913
;4913:			G_PreDefSound(self->client->ps.origin, PDSOUND_FORCEGRIP);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 4914
;4914:			self->client->ps.fd.forceGripSoundTime = nowTime + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1128
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 4915
;4915:		}
LABELV $2529
line 4916
;4916:	}
LABELV $2527
line 4918
;4917:
;4918:	if (self->client->ps.fd.forcePowersActive & (1 << FP_SPEED))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2531
line 4919
;4919:	{
line 4920
;4920:		self->client->ps.powerups[PW_SPEED] = nowTime + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 384
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 4921
;4921:	}
LABELV $2531
line 4923
;4922:
;4923:	if (self->client->ps.fd.forceSpeedDoDamage && FORCE_VELOCITY_DAMAGE) //You used to be able to run into walls and crack your face on them (like JK1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1140
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2533
ADDRGP4 $2533
JUMPV
line 4924
;4924:	{ //we set the flag somewhere to do damage for some reason, so do it
line 4925
;4925:		G_Damage (self, NULL, NULL, NULL, NULL, self->client->ps.fd.forceSpeedDoDamage, DAMAGE_NO_ARMOR, MOD_FALLING);
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
CNSTP4 0
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
CNSTP4 0
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1140
ADDP4
INDIRF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 34
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 4927
;4926:
;4927:		if (self->client->ps.fd.forceSpeedHitIndex != ENTITYNUM_NONE &&
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 1023
EQI4 $2535
CNSTI4 2352
ADDRLP4 108
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2535
line 4929
;4928:			g_entities[self->client->ps.fd.forceSpeedHitIndex].client)
;4929:		{
line 4930
;4930:			VectorSubtract(g_entities[self->client->ps.fd.forceSpeedHitIndex].client->ps.origin, self->client->ps.origin, dmgdir);
ADDRLP4 112
CNSTI4 2352
ASGNI4
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 120
ADDRLP4 116
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 124
CNSTI4 1144
ASGNI4
ADDRLP4 128
CNSTI4 20
ASGNI4
ADDRLP4 28
ADDRLP4 112
INDIRI4
ADDRLP4 120
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
ADDRLP4 120
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 132
ADDRLP4 116
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 136
CNSTI4 24
ASGNI4
ADDRLP4 28+4
ADDRLP4 112
INDIRI4
ADDRLP4 132
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
ADDRLP4 132
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 144
CNSTI4 28
ASGNI4
ADDRLP4 28+8
CNSTI4 2352
ADDRLP4 140
INDIRP4
CNSTI4 1144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
ADDRLP4 140
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4932
;4931:
;4932:			G_Damage (&g_entities[self->client->ps.fd.forceSpeedHitIndex], self, self, dmgdir, NULL, self->client->ps.fd.forceSpeedDoDamage, DAMAGE_NO_ARMOR, MOD_CRUSH);
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
ADDRLP4 148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
CNSTI4 2352
ADDRLP4 152
INDIRP4
CNSTI4 1144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 152
INDIRP4
CNSTI4 1140
ADDP4
INDIRF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 4933
;4933:			self->client->ps.fd.forceSpeedHitIndex = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1144
ADDP4
CNSTI4 1023
ASGNI4
line 4934
;4934:		}
LABELV $2535
line 4936
;4935:
;4936:		self->client->ps.fd.forceSpeedDoDamage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1140
ADDP4
CNSTF4 0
ASGNF4
line 4937
;4937:	}
LABELV $2533
line 4939
;4938:
;4939:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2543
line 4940
;4940:	{//if dead, deactivate any active force powers
line 4941
;4941:		for ( i = 0; i < NUM_FORCE_POWERS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2545
line 4942
;4942:		{
line 4943
;4943:			if ( self->client->ps.fd.forcePowerDuration[i] || (self->client->ps.fd.forcePowersActive&( 1 << i )) )
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 100
INDIRP4
CNSTI4 860
ADDP4
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $2551
ADDRLP4 100
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
ADDRLP4 104
INDIRI4
EQI4 $2549
LABELV $2551
line 4944
;4944:			{
line 4945
;4945:				WP_ForcePowerStop( self, (forcePowers_t)i );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 4946
;4946:				self->client->ps.fd.forcePowerDuration[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 4947
;4947:			}
LABELV $2549
line 4948
;4948:		}
LABELV $2546
line 4941
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2545
line 4949
;4949:		goto powersetcheck;
ADDRGP4 $2552
JUMPV
LABELV $2543
line 4952
;4950:	}
;4951:
;4952:	if (self->client->ps.groundEntityNum != ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $2553
line 4953
;4953:	{
line 4954
;4954:		self->client->fjDidJump = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43808
ADDP4
CNSTI4 0
ASGNI4
line 4955
;4955:	}
LABELV $2553
line 4957
;4956:
;4957:	if(moveStyle != MV_CHARGEJUMP){ // moved and adjusted/fixed up this part to pmove for chargejump movement style
ADDRLP4 20
INDIRI4
CNSTI4 12
EQI4 $2555
line 4959
;4958:
;4959:		if (self->client->ps.fd.forceJumpCharge && self->client->ps.groundEntityNum == ENTITYNUM_NONE && self->client->fjDidJump)
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2557
ADDRLP4 96
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2557
ADDRLP4 96
INDIRP4
CNSTI4 43808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2557
line 4960
;4960:		{ //this was for the "charge" jump method... I guess
line 4961
;4961:			if (ucmd->upmove < 10 && (!(ucmd->buttons & BUTTON_FORCEPOWER) || self->client->ps.fd.forcePowerSelected != FP_LEVITATION))
ADDRLP4 100
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $2559
ADDRLP4 100
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2561
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 1
EQI4 $2559
LABELV $2561
line 4962
;4962:			{
line 4963
;4963:				G_MuteSound(self->client->ps.fd.killSoundEntIndex[TRACK_CHANNEL_1-50], CHAN_VOICE);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
line 4964
;4964:				self->client->ps.fd.forceJumpCharge = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
CNSTF4 0
ASGNF4
line 4965
;4965:			}
LABELV $2559
line 4966
;4966:		}
LABELV $2557
line 4980
;4967:
;4968:	#ifndef METROID_JUMP
;4969:		else if ( (ucmd->upmove > 10) && (self->client->ps.pm_flags & PMF_JUMP_HELD) && self->client->ps.groundTime && (nowTime - self->client->ps.groundTime) > 150 && !BG_HasYsalamiri(g_gametype.integer, &self->client->ps) && BG_CanUseFPNow(g_gametype.integer, &self->client->ps, nowTime, FP_LEVITATION) )
;4970:		{//just charging up
;4971:			ForceJumpCharge( self, ucmd );
;4972:			usingForce = qtrue;
;4973:		}
;4974:		else if (ucmd->upmove < 10 && self->client->ps.groundEntityNum == ENTITYNUM_NONE && self->client->ps.fd.forceJumpCharge)
;4975:		{
;4976:			self->client->ps.pm_flags &= ~(PMF_JUMP_HELD);
;4977:		}
;4978:	#endif
;4979:
;4980:		if (!(self->client->ps.pm_flags & PMF_JUMP_HELD) && self->client->ps.fd.forceJumpCharge)
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $2562
ADDRLP4 100
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2562
line 4981
;4981:		{
line 4982
;4982:			if (!(ucmd->buttons & BUTTON_FORCEPOWER) ||
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2566
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 1
EQI4 $2564
LABELV $2566
line 4984
;4983:				self->client->ps.fd.forcePowerSelected != FP_LEVITATION)
;4984:			{
line 4985
;4985:				if (WP_DoSpecificPower( self, ucmd, FP_LEVITATION ))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 104
ADDRGP4 WP_DoSpecificPower
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $2567
line 4986
;4986:				{
line 4987
;4987:					usingForce = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 4988
;4988:				}
LABELV $2567
line 4989
;4989:			}
LABELV $2564
line 4990
;4990:		}
LABELV $2562
line 4991
;4991:	}
LABELV $2555
line 4993
;4992:
;4993:	if ( ucmd->buttons & BUTTON_FORCEGRIP )
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $2569
line 4994
;4994:	{ //grip is one of the powers with its own button.. if it's held, call the specific grip power function.
line 4995
;4995:		if (WP_DoSpecificPower( self, ucmd, FP_GRIP ))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 96
ADDRGP4 WP_DoSpecificPower
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $2571
line 4996
;4996:		{
line 4997
;4997:			usingForce = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 4998
;4998:		}
ADDRGP4 $2570
JUMPV
LABELV $2571
line 5000
;4999:		else
;5000:		{ //don't let recharge even if the grip misses if the player still has the button down
line 5001
;5001:			usingForce = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 5002
;5002:		}
line 5003
;5003:	}
ADDRGP4 $2570
JUMPV
LABELV $2569
line 5005
;5004:	else
;5005:	{ //see if we're using it generically.. if not, stop.
line 5006
;5006:		if (self->client->ps.fd.forcePowersActive & (1 << FP_GRIP))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $2573
line 5007
;5007:		{
line 5008
;5008:			if (!(ucmd->buttons & BUTTON_FORCEPOWER) || self->client->ps.fd.forcePowerSelected != FP_GRIP)
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2577
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 6
EQI4 $2575
LABELV $2577
line 5009
;5009:			{
line 5010
;5010:				WP_ForcePowerStop(self, FP_GRIP);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 5011
;5011:			}
LABELV $2575
line 5012
;5012:		}
LABELV $2573
line 5013
;5013:	}
LABELV $2570
line 5015
;5014:
;5015:	if ( ucmd->buttons & BUTTON_FORCE_LIGHTNING )
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2578
line 5016
;5016:	{ //lightning
line 5017
;5017:		WP_DoSpecificPower(self, ucmd, FP_LIGHTNING);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 WP_DoSpecificPower
CALLI4
pop
line 5018
;5018:		usingForce = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 5019
;5019:	}
ADDRGP4 $2579
JUMPV
LABELV $2578
line 5021
;5020:	else
;5021:	{ //see if we're using it generically.. if not, stop.
line 5022
;5022:		if (self->client->ps.fd.forcePowersActive & (1 << FP_LIGHTNING))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $2580
line 5023
;5023:		{
line 5024
;5024:			if (!(ucmd->buttons & BUTTON_FORCEPOWER) || self->client->ps.fd.forcePowerSelected != FP_LIGHTNING)
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2584
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 7
EQI4 $2582
LABELV $2584
line 5025
;5025:			{
line 5026
;5026:				WP_ForcePowerStop(self, FP_LIGHTNING);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 5027
;5027:			}
LABELV $2582
line 5028
;5028:		}
LABELV $2580
line 5029
;5029:	}
LABELV $2579
line 5031
;5030:
;5031:	if ( ucmd->buttons & BUTTON_FORCE_DRAIN )
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $2585
line 5032
;5032:	{ //drain
line 5033
;5033:		WP_DoSpecificPower(self, ucmd, FP_DRAIN);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRGP4 WP_DoSpecificPower
CALLI4
pop
line 5034
;5034:		usingForce = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 5035
;5035:	}
ADDRGP4 $2586
JUMPV
LABELV $2585
line 5037
;5036:	else
;5037:	{ //see if we're using it generically.. if not, stop.
line 5038
;5038:		if (self->client->ps.fd.forcePowersActive & (1 << FP_DRAIN))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $2587
line 5039
;5039:		{
line 5040
;5040:			if (!(ucmd->buttons & BUTTON_FORCEPOWER) || self->client->ps.fd.forcePowerSelected != FP_DRAIN)
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2591
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 13
EQI4 $2589
LABELV $2591
line 5041
;5041:			{
line 5042
;5042:				WP_ForcePowerStop(self, FP_DRAIN);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 5043
;5043:			}
LABELV $2589
line 5044
;5044:		}
LABELV $2587
line 5045
;5045:	}
LABELV $2586
line 5054
;5046:
;5047:	//if (moveStyle == MV_CHARGEJUMP &&(ucmd->buttons & BUTTON_BOUNCEPOWER) &&
;5048:	//	BG_CanUseFPNow(g_gametype.integer, &self->client->ps, nowTime, FP_LEVITATION)) {
;5049:	//	ForceJumpCharge(self, ucmd);
;5050:	//	usingForce = qtrue;
;5051:	//	chargeJumping = qtrue;
;5052:	//}
;5053:
;5054:	if ( (ucmd->buttons & BUTTON_FORCEPOWER) &&
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $2592
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 96
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $2592
ADDRLP4 20
INDIRI4
CNSTI4 12
NEI4 $2595
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 1
EQI4 $2592
LABELV $2595
line 5056
;5055:		BG_CanUseFPNow(g_gametype.integer, &self->client->ps, nowTime, self->client->ps.fd.forcePowerSelected) && (moveStyle != MV_CHARGEJUMP || self->client->ps.fd.forcePowerSelected != FP_LEVITATION))
;5056:	{
line 5057
;5057:		if (self->client->ps.fd.forcePowerSelected == FP_LEVITATION)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2596
line 5058
;5058:		{
line 5059
;5059:			ForceJumpCharge( self, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 ForceJumpCharge
CALLV
pop
line 5060
;5060:			usingForce = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 5061
;5061:		}
ADDRGP4 $2593
JUMPV
LABELV $2596
line 5062
;5062:		else if (WP_DoSpecificPower( self, ucmd, self->client->ps.fd.forcePowerSelected ))
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 WP_DoSpecificPower
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $2598
line 5063
;5063:		{
line 5064
;5064:			usingForce = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 5065
;5065:		}
ADDRGP4 $2593
JUMPV
LABELV $2598
line 5066
;5066:		else if (self->client->ps.fd.forcePowerSelected == FP_GRIP)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 6
NEI4 $2593
line 5067
;5067:		{
line 5068
;5068:			usingForce = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 5069
;5069:		}
line 5070
;5070:	}
ADDRGP4 $2593
JUMPV
LABELV $2592
line 5072
;5071:	else
;5072:	{
line 5073
;5073:		self->client->ps.fd.forceButtonNeedRelease = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 0
ASGNI4
line 5074
;5074:	}
LABELV $2593
line 5076
;5075:
;5076:	for ( i = 0; i < NUM_FORCE_POWERS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2602
line 5077
;5077:	{
line 5078
;5078:		if ( self->client->ps.fd.forcePowerDuration[i] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2606
line 5079
;5079:		{
line 5080
;5080:			if ( self->client->ps.fd.forcePowerDuration[i] < nowTime)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $2608
line 5081
;5081:			{
line 5082
;5082:				if ( (self->client->ps.fd.forcePowersActive&( 1 << i )) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2610
line 5083
;5083:				{//turn it off
line 5084
;5084:					WP_ForcePowerStop( self, (forcePowers_t)i );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 5085
;5085:				}
LABELV $2610
line 5086
;5086:				self->client->ps.fd.forcePowerDuration[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 860
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 5087
;5087:			}
LABELV $2608
line 5088
;5088:		}
LABELV $2606
line 5089
;5089:		if ( (self->client->ps.fd.forcePowersActive&( 1 << i )) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $2612
line 5090
;5090:		{
line 5091
;5091:			usingForce = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 5092
;5092:			WP_ForcePowerRun( self, (forcePowers_t)i, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 WP_ForcePowerRun
CALLV
pop
line 5093
;5093:		}
LABELV $2612
line 5094
;5094:	}
LABELV $2603
line 5076
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $2602
line 5095
;5095:	if ( self->client->ps.saberInFlight )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2614
line 5096
;5096:	{//don't regen force power while throwing saber
line 5097
;5097:		if ( self->client->ps.saberEntityNum < ENTITYNUM_NONE && self->client->ps.saberEntityNum > 0 )//player is 0
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 1023
GEI4 $2616
ADDRLP4 104
INDIRI4
CNSTI4 0
LEI4 $2616
line 5098
;5098:		{//
line 5099
;5099:			if ( g_entities[self->client->ps.saberEntityNum].s.pos.trType == TR_LINEAR )
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+12
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2618
line 5100
;5100:			{//fell to the ground and we're trying to pull it back
line 5101
;5101:				usingForce = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 5102
;5102:			}
LABELV $2618
line 5103
;5103:		}
LABELV $2616
line 5104
;5104:	}
LABELV $2614
line 5105
;5105:	if ( !self->client->ps.fd.forcePowersActive || self->client->ps.fd.forcePowersActive == (1 << FP_DRAIN) )
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $2623
ADDRLP4 104
INDIRI4
CNSTI4 8192
NEI4 $2621
LABELV $2623
line 5106
;5106:	{//when not using the force, regenerate at 1 point per half second
line 5107
;5107:		if ( !self->client->ps.saberInFlight && self->client->ps.fd.forcePowerRegenDebounceTime < nowTime)
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2624
ADDRLP4 108
INDIRP4
CNSTI4 940
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $2624
line 5108
;5108:		{
line 5109
;5109:			int regenAmt = 0;
ADDRLP4 112
CNSTI4 0
ASGNI4
line 5110
;5110:			if (g_gametype.integer != GT_HOLOCRON || g_MaxHolocronCarry.value)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $2630
ADDRGP4 g_MaxHolocronCarry+8
INDIRF4
CNSTF4 0
EQF4 $2626
LABELV $2630
line 5111
;5111:			{
line 5114
;5112:				//if (!g_trueJedi.integer || self->client->ps.weapon == WP_SABER)
;5113:				//let non-jedi force regen since we're doing a more strict jedi/non-jedi thing... this gives dark jedi something to drain
;5114:				{
line 5115
;5115:					if (self->client->ps.powerups[PW_FORCE_BOON])
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2631
line 5116
;5116:					{
line 5117
;5117:						regenAmt = 6;
ADDRLP4 112
CNSTI4 6
ASGNI4
line 5119
;5118:						//WP_ForcePowerRegenerate( self, 6 );
;5119:					}
ADDRGP4 $2627
JUMPV
LABELV $2631
line 5120
;5120:					else if (self->client->ps.isJediMaster && g_gametype.integer == GT_JEDIMASTER)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2627
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $2627
line 5121
;5121:					{
line 5122
;5122:						regenAmt = 4;
ADDRLP4 112
CNSTI4 4
ASGNI4
line 5124
;5123:						//WP_ForcePowerRegenerate( self, 4 ); //jedi master regenerates 4 times as fast
;5124:					}
line 5129
;5125:					//else
;5126:					//{
;5127:					//	WP_ForcePowerRegenerate( self, 0 );
;5128:					//}
;5129:				}
line 5136
;5130:				/*
;5131:				else if (g_trueJedi.integer && self->client->ps.weapon != WP_SABER)
;5132:				{
;5133:					self->client->ps.fd.forcePower = 0;
;5134:				}
;5135:				*/
;5136:			}
ADDRGP4 $2627
JUMPV
LABELV $2626
line 5138
;5137:			else
;5138:			{ //regenerate based on the number of holocrons carried
line 5139
;5139:				holoregen = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 5140
;5140:				holo = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2637
JUMPV
LABELV $2636
line 5142
;5141:				while (holo < NUM_FORCE_POWERS)
;5142:				{
line 5143
;5143:					if (self->client->ps.holocronsCarried[holo])
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2639
line 5144
;5144:					{
line 5145
;5145:						holoregen++;
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5146
;5146:					}
LABELV $2639
line 5147
;5147:					holo++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5148
;5148:				}
LABELV $2637
line 5141
ADDRLP4 16
INDIRI4
CNSTI4 18
LTI4 $2636
line 5150
;5149:
;5150:				regenAmt = holoregen;
ADDRLP4 112
ADDRLP4 40
INDIRI4
ASGNI4
line 5152
;5151:				//WP_ForcePowerRegenerate(self, holoregen);
;5152:			}
LABELV $2627
line 5154
;5153:
;5154:			if (self->client->sess.raceMode && self->client->pers.cmd.serverTime > self->client->ps.commandTime) { // just a lil sanity check
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2641
ADDRLP4 116
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 116
INDIRP4
INDIRI4
LEI4 $2641
line 5159
;5155:				// g_defragForceRegenFps.integer is basically how much we regenerate per second (as its traditionally 1 unit per server frame)
;5156:				// We are working in micro regen (not literally micro, just meaning its smaller increments), 
;5157:				// actually its 1000 micro force points = 1 force point. 
;5158:				// e.g. 100fps means 100 force points per second regeneration, meaning 0.1 fp per msec, meaaning 100 micro fp per msec
;5159:				int microRegenPerMillisecond = g_defragForceRegenFps.integer; 
ADDRLP4 120
ADDRGP4 g_defragForceRegenFps+12
INDIRI4
ASGNI4
line 5161
;5160:				int microRegenAmount;
;5161:				regenAmt = regenAmt == 0 ? 1 : regenAmt;
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $2645
ADDRLP4 128
CNSTI4 1
ASGNI4
ADDRGP4 $2646
JUMPV
LABELV $2645
ADDRLP4 128
ADDRLP4 112
INDIRI4
ASGNI4
LABELV $2646
ADDRLP4 112
ADDRLP4 128
INDIRI4
ASGNI4
line 5163
;5162:				//microRegenAmount = (microRegenPerMillisecond * regenAmt) * (nowTime - self->client->ps.fd.forcePowerRegenDebounceTime);
;5163:				microRegenAmount = (microRegenPerMillisecond * regenAmt) * (self->client->pers.cmd.serverTime - self->client->ps.commandTime);
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 120
INDIRI4
ADDRLP4 112
INDIRI4
MULI4
ADDRLP4 132
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 132
INDIRP4
INDIRI4
SUBI4
MULI4
ASGNI4
line 5164
;5164:				self->client->forcePowerMicroRegenBuffer += microRegenAmount;
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43936
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
ADDRLP4 124
INDIRI4
ADDI4
ASGNI4
line 5165
;5165:				if (self->client->forcePowerMicroRegenBuffer >= 1000) { // 1000 micro regen = 1 force point. we do that so we have more precision overall.
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43936
ADDP4
INDIRI4
CNSTI4 1000
LTI4 $2642
line 5166
;5166:					int fp = self->client->forcePowerMicroRegenBuffer / 1000;
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43936
ADDP4
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 5167
;5167:					self->client->forcePowerMicroRegenBuffer -= fp * 1000;
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43936
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 1000
ADDRLP4 140
INDIRI4
MULI4
SUBI4
ASGNI4
line 5168
;5168:					WP_ForcePowerRegenerate(self, fp);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerRegenerate
CALLV
pop
line 5169
;5169:				}
line 5170
;5170:			}
ADDRGP4 $2642
JUMPV
LABELV $2641
line 5171
;5171:			else {
line 5172
;5172:				WP_ForcePowerRegenerate(self, regenAmt);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerRegenerate
CALLV
pop
line 5173
;5173:			}
LABELV $2642
line 5175
;5174:
;5175:			self->client->ps.fd.forcePowerRegenDebounceTime = nowTime + (self->client->sess.raceMode ? 0 : g_forceRegenTime.integer);
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2651
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRGP4 $2652
JUMPV
LABELV $2651
ADDRLP4 120
ADDRGP4 g_forceRegenTime+12
INDIRI4
ASGNI4
LABELV $2652
ADDRLP4 124
INDIRP4
CNSTI4 940
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 120
INDIRI4
ADDI4
ASGNI4
line 5176
;5176:		}
LABELV $2624
line 5177
;5177:	}
LABELV $2621
LABELV $2552
line 5181
;5178:
;5179:powersetcheck:
;5180:
;5181:	if (prepower && self->client->ps.fd.forcePower < prepower)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2653
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
GEI4 $2653
line 5182
;5182:	{
line 5183
;5183:		int dif = ((prepower - self->client->ps.fd.forcePower)/2);
ADDRLP4 112
ADDRLP4 12
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 5184
;5184:		if (dif < 1)
ADDRLP4 112
INDIRI4
CNSTI4 1
GEI4 $2655
line 5185
;5185:		{
line 5186
;5186:			dif = 1;
ADDRLP4 112
CNSTI4 1
ASGNI4
line 5187
;5187:		}
LABELV $2655
line 5189
;5188:
;5189:		self->client->ps.fd.forcePower = (prepower-dif);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 112
INDIRI4
SUBI4
ASGNI4
line 5190
;5190:	}
LABELV $2653
line 5192
;5191:
;5192:	(void)usingForce;
line 5193
;5193:}
LABELV $2410
endproc WP_ForcePowersUpdate 156 32
export Jedi_DodgeEvasion
proc Jedi_DodgeEvasion 44 16
line 5196
;5194:
;5195:qboolean Jedi_DodgeEvasion( gentity_t *self, gentity_t *shooter, trace_t *tr, int hitLoc )
;5196:{
line 5197
;5197:	int	dodgeAnim = -1; 
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 5198
;5198:	int		nowTime = LEVELTIME(self->client);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2662
ADDRLP4 16
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2662
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2664
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $2665
JUMPV
LABELV $2664
ADDRLP4 12
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $2665
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $2663
JUMPV
LABELV $2662
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $2663
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 5200
;5199:
;5200:	if ( !self || !self->client || self->health <= 0 )
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $2669
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $2669
ADDRLP4 20
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2666
LABELV $2669
line 5201
;5201:	{
line 5202
;5202:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2657
JUMPV
LABELV $2666
line 5205
;5203:	}
;5204:
;5205:	if (!g_forceDodge.integer)
ADDRGP4 g_forceDodge+12
INDIRI4
CNSTI4 0
NEI4 $2670
line 5206
;5206:	{
line 5207
;5207:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2657
JUMPV
LABELV $2670
line 5210
;5208:	}
;5209:
;5210:	if (g_forceDodge.integer != 2)
ADDRGP4 g_forceDodge+12
INDIRI4
CNSTI4 2
EQI4 $2673
line 5211
;5211:	{
line 5212
;5212:		if (!(self->client->ps.fd.forcePowersActive & (1 << FP_SEE)))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
NEI4 $2676
line 5213
;5213:		{
line 5214
;5214:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2657
JUMPV
LABELV $2676
line 5216
;5215:		}
;5216:	}
LABELV $2673
line 5218
;5217:
;5218:	if (self->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2678
line 5219
;5219:	{
line 5220
;5220:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2657
JUMPV
LABELV $2678
line 5223
;5221:	}
;5222:
;5223:	if ( self->client->ps.groundEntityNum == ENTITYNUM_NONE )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $2680
line 5224
;5224:	{//can't dodge in mid-air
line 5225
;5225:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2657
JUMPV
LABELV $2680
line 5228
;5226:	}
;5227:
;5228:	if ( self->client->ps.weaponTime > 0 || self->client->ps.forceHandExtend != HANDEXTEND_NONE )
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
GTI4 $2684
ADDRLP4 28
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $2682
LABELV $2684
line 5229
;5229:	{//in some effect that stops me from moving on my own
line 5230
;5230:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2657
JUMPV
LABELV $2682
line 5233
;5231:	}
;5232:
;5233:	if (g_forceDodge.integer == 2)
ADDRGP4 g_forceDodge+12
INDIRI4
CNSTI4 2
NEI4 $2685
line 5234
;5234:	{
line 5235
;5235:		if (self->client->ps.fd.forcePowersActive)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2688
line 5236
;5236:		{ //for now just don't let us dodge if we're using a force power at all
line 5237
;5237:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2657
JUMPV
LABELV $2688
line 5239
;5238:		}
;5239:	}
LABELV $2685
line 5241
;5240:
;5241:	if (g_forceDodge.integer == 2)
ADDRGP4 g_forceDodge+12
INDIRI4
CNSTI4 2
NEI4 $2690
line 5242
;5242:	{
line 5243
;5243:		if ( !WP_ForcePowerUsable( self, FP_SPEED ) )
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 36
ADDRGP4 WP_ForcePowerUsable
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $2693
line 5244
;5244:		{//make sure we have it and have enough force power
line 5245
;5245:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2657
JUMPV
LABELV $2693
line 5247
;5246:		}
;5247:	}
LABELV $2690
line 5249
;5248:
;5249:	if (g_forceDodge.integer == 2)
ADDRGP4 g_forceDodge+12
INDIRI4
CNSTI4 2
NEI4 $2695
line 5250
;5250:	{
line 5252
;5251:		// dont do this check in racemode
;5252:		if ( !self->client->sess.raceMode && Q_irand( 1, 7, qfalse, 2) > self->client->ps.fd.forcePowerLevel[FP_SPEED] )
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $2696
CNSTI4 1
ARGI4
CNSTI4 7
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 40
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
LEI4 $2696
line 5253
;5253:		{//more likely to fail on lower force speed level
line 5254
;5254:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2657
JUMPV
line 5256
;5255:		}
;5256:	}
LABELV $2695
line 5258
;5257:	else
;5258:	{
line 5260
;5259:		//We now dodge all the time, but only on level 3
;5260:		if (self->client->ps.fd.forcePowerLevel[FP_SEE] < FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 3
GEI4 $2700
line 5261
;5261:		{//more likely to fail on lower force sight level
line 5262
;5262:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2657
JUMPV
LABELV $2700
line 5264
;5263:		}
;5264:	}
LABELV $2696
line 5266
;5265:
;5266:	switch( hitLoc )
ADDRLP4 36
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $2702
ADDRLP4 36
INDIRI4
CNSTI4 16
GTI4 $2702
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2714
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2714
address $2704
address $2705
address $2705
address $2705
address $2705
address $2710
address $2706
address $2708
address $2710
address $2707
address $2709
address $2710
address $2711
address $2712
address $2711
address $2712
address $2713
code
line 5267
;5267:	{
LABELV $2704
line 5269
;5268:	case HL_NONE:
;5269:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2657
JUMPV
line 5270
;5270:		break;
LABELV $2705
line 5276
;5271:
;5272:	case HL_FOOT_RT:
;5273:	case HL_FOOT_LT:
;5274:	case HL_LEG_RT:
;5275:	case HL_LEG_LT:
;5276:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2657
JUMPV
LABELV $2706
line 5279
;5277:
;5278:	case HL_BACK_RT:
;5279:		dodgeAnim = BOTH_DODGE_FL;
ADDRLP4 0
CNSTI4 897
ASGNI4
line 5280
;5280:		break;
ADDRGP4 $2703
JUMPV
LABELV $2707
line 5282
;5281:	case HL_CHEST_RT:
;5282:		dodgeAnim = BOTH_DODGE_FR;
ADDRLP4 0
CNSTI4 898
ASGNI4
line 5283
;5283:		break;
ADDRGP4 $2703
JUMPV
LABELV $2708
line 5285
;5284:	case HL_BACK_LT:
;5285:		dodgeAnim = BOTH_DODGE_FR;
ADDRLP4 0
CNSTI4 898
ASGNI4
line 5286
;5286:		break;
ADDRGP4 $2703
JUMPV
LABELV $2709
line 5288
;5287:	case HL_CHEST_LT:
;5288:		dodgeAnim = BOTH_DODGE_FR;
ADDRLP4 0
CNSTI4 898
ASGNI4
line 5289
;5289:		break;
ADDRGP4 $2703
JUMPV
LABELV $2710
line 5293
;5290:	case HL_BACK:
;5291:	case HL_CHEST:
;5292:	case HL_WAIST:
;5293:		dodgeAnim = BOTH_DODGE_FL;
ADDRLP4 0
CNSTI4 897
ASGNI4
line 5294
;5294:		break;
ADDRGP4 $2703
JUMPV
LABELV $2711
line 5297
;5295:	case HL_ARM_RT:
;5296:	case HL_HAND_RT:
;5297:		dodgeAnim = BOTH_DODGE_L;
ADDRLP4 0
CNSTI4 901
ASGNI4
line 5298
;5298:		break;
ADDRGP4 $2703
JUMPV
LABELV $2712
line 5301
;5299:	case HL_ARM_LT:
;5300:	case HL_HAND_LT:
;5301:		dodgeAnim = BOTH_DODGE_R;
ADDRLP4 0
CNSTI4 902
ASGNI4
line 5302
;5302:		break;
ADDRGP4 $2703
JUMPV
LABELV $2713
line 5304
;5303:	case HL_HEAD:
;5304:		dodgeAnim = BOTH_DODGE_FL;
ADDRLP4 0
CNSTI4 897
ASGNI4
line 5305
;5305:		break;
ADDRGP4 $2703
JUMPV
LABELV $2702
line 5307
;5306:	default:
;5307:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2657
JUMPV
LABELV $2703
line 5310
;5308:	}
;5309:
;5310:	if ( dodgeAnim != -1 )
ADDRLP4 0
INDIRI4
CNSTI4 -1
EQI4 $2715
line 5311
;5311:	{
line 5313
;5312:		//Our own happy way of forcing an anim:
;5313:		self->client->ps.forceHandExtend = HANDEXTEND_DODGE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 7
ASGNI4
line 5314
;5314:		self->client->ps.forceDodgeAnim = dodgeAnim;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 5315
;5315:		self->client->ps.forceHandExtendTime = nowTime + 300;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 5317
;5316:
;5317:		self->client->ps.powerups[PW_SPEEDBURST] = nowTime + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 5319
;5318:
;5319:		if (g_forceDodge.integer == 2)
ADDRGP4 g_forceDodge+12
INDIRI4
CNSTI4 2
NEI4 $2717
line 5320
;5320:		{
line 5321
;5321:			ForceSpeed( self, 500 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 500
ARGI4
ADDRGP4 ForceSpeed
CALLV
pop
line 5322
;5322:		}
ADDRGP4 $2718
JUMPV
LABELV $2717
line 5324
;5323:		else
;5324:		{
line 5325
;5325:			G_Sound( self, CHAN_BODY, G_SoundIndex("sound/weapons/force/speed.wav") );
ADDRGP4 $726
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 5326
;5326:		}
LABELV $2718
line 5327
;5327:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2657
JUMPV
LABELV $2715
line 5329
;5328:	}
;5329:	return qfalse;
CNSTI4 0
RETI4
LABELV $2657
endproc Jedi_DodgeEvasion 44 16
import g_TimeSinceLastFrame
import g_LastFrameTime
import Touch_Button
import botstates
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
import gBotChatBuffer
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
import BotDoChat
import BotUtilizePersonality
import NumBots
import BotResetState
import B_Free
import B_Alloc
import B_TempFree
import B_TempAlloc
import forceJumpStrength
import forceJumpHeightMax
import forceJumpHeight
import forcePowerNeeded
import forcePowerNeeded_1_04
import forcePowerNeeded_1_02
import g_MaxHolocronCarry
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
import WP_SaberInitBladeData
import WP_SaberCanBlock
import WP_SaberPositionUpdate
import MakeDeadSaber
import thrownSaberTouch
import SaberGotHit
import SaberUpdateSelf
import HasSetSaberOnly
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
LABELV $2465
byte 1 42
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2341
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
byte 1 98
byte 1 114
byte 1 121
byte 1 97
byte 1 114
byte 1 47
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2281
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
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1989
byte 1 42
byte 1 99
byte 1 104
byte 1 111
byte 1 107
byte 1 101
byte 1 37
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1910
byte 1 42
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1885
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
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1609
byte 1 108
byte 1 105
byte 1 109
byte 1 98
byte 1 0
align 1
LABELV $1605
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1602
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
LABELV $1592
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1483
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
byte 1 112
byte 1 117
byte 1 108
byte 1 108
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1480
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
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1347
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
byte 1 100
byte 1 105
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $1209
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
LABELV $997
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
byte 1 100
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $869
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
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $825
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
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $804
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
byte 1 114
byte 1 97
byte 1 103
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $742
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
byte 1 115
byte 1 101
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $726
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
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $550
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
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $267
byte 1 110
byte 1 102
byte 1 114
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
LABELV $198
byte 1 87
byte 1 80
byte 1 95
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 115
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
byte 1 105
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 104
byte 1 97
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
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $173
byte 1 87
byte 1 80
byte 1 95
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 80
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 115
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
byte 1 105
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $172
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
LABELV $167
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
LABELV $163
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
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 105
byte 1 102
byte 1 121
byte 1 108
byte 1 111
byte 1 111
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $160
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
byte 1 115
byte 1 101
byte 1 101
byte 1 108
byte 1 111
byte 1 111
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $157
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
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 108
byte 1 111
byte 1 111
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $154
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
byte 1 97
byte 1 98
byte 1 115
byte 1 111
byte 1 114
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $151
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
byte 1 114
byte 1 97
byte 1 103
byte 1 101
byte 1 108
byte 1 111
byte 1 111
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $148
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
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 108
byte 1 111
byte 1 111
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
