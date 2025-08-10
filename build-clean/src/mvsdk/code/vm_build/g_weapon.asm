export touch_NULL
code
proc touch_NULL 0 0
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_weapon.c"
line 108
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_weapon.c 
;4:// perform the server side effects of a weapon firing
;5:
;6:#include "g_local.h"
;7:#include "g_defrag.h"
;8:#include "be_aas.h"
;9:
;10:static	float	s_quadFactor;
;11:static	vec3_t	forward, right, up;
;12:static	vec3_t	muzzle;
;13:
;14:// Bryar Pistol
;15://--------
;16:#define BRYAR_PISTOL_VEL			1600
;17:#define BRYAR_PISTOL_DAMAGE			10
;18:#define BRYAR_CHARGE_UNIT			200.0f	// bryar charging gives us one more unit every 200ms--if you change this, you'll have to do the same in bg_pmove
;19:#define BRYAR_ALT_SIZE				1.0f
;20:
;21:// E11 Blaster
;22://---------
;23:#define BLASTER_SPREAD				1.6f//1.2f
;24:#define BLASTER_VELOCITY			2300
;25:#define BLASTER_DAMAGE				20
;26:
;27:// Tenloss Disruptor
;28://----------
;29:#define DISRUPTOR_MAIN_DAMAGE			30 //40
;30:#define DISRUPTOR_NPC_MAIN_DAMAGE_CUT	0.25f
;31:
;32:#define DISRUPTOR_ALT_DAMAGE			100 //125
;33:#define DISRUPTOR_NPC_ALT_DAMAGE_CUT	0.2f
;34:#define DISRUPTOR_ALT_TRACES			3		// can go through a max of 3 damageable(sp?) entities
;35:#define DISRUPTOR_CHARGE_UNIT			50.0f	// distruptor charging gives us one more unit every 50ms--if you change this, you'll have to do the same in bg_pmove
;36:
;37:// Wookiee Bowcaster
;38://----------
;39:#define	BOWCASTER_DAMAGE			50
;40:#define	BOWCASTER_VELOCITY			1300
;41:#define BOWCASTER_SPLASH_DAMAGE		0
;42:#define BOWCASTER_SPLASH_RADIUS		0
;43:#define BOWCASTER_SIZE				2
;44:
;45:#define BOWCASTER_ALT_SPREAD		5.0f
;46:#define BOWCASTER_VEL_RANGE			0.3f
;47:#define BOWCASTER_CHARGE_UNIT		200.0f	// bowcaster charging gives us one more unit every 200ms--if you change this, you'll have to do the same in bg_pmove
;48:
;49:// Heavy Repeater
;50://----------
;51:#define REPEATER_SPREAD				1.4f
;52:#define	REPEATER_DAMAGE				14
;53:#define	REPEATER_VELOCITY			1600
;54:
;55:#define REPEATER_ALT_SIZE				3	// half of bbox size
;56:#define	REPEATER_ALT_DAMAGE				60
;57:#define REPEATER_ALT_SPLASH_DAMAGE		60
;58:#define REPEATER_ALT_SPLASH_RADIUS		128
;59:#define	REPEATER_ALT_VELOCITY			1100
;60:
;61:// DEMP2
;62://----------
;63:#define	DEMP2_DAMAGE				35
;64:#define	DEMP2_VELOCITY				1800
;65:#define	DEMP2_SIZE					2		// half of bbox size
;66:
;67:#define DEMP2_ALT_DAMAGE			8 //12		// does 12, 36, 84 at each of the 3 charge levels.
;68:#define DEMP2_CHARGE_UNIT			700.0f	// demp2 charging gives us one more unit every 700ms--if you change this, you'll have to do the same in bg_weapons
;69:#define DEMP2_ALT_RANGE				4096
;70:#define DEMP2_ALT_SPLASHRADIUS		256
;71:
;72:// Golan Arms Flechette
;73://---------
;74:#define FLECHETTE_SHOTS				5
;75:#define FLECHETTE_SPREAD			4.0f
;76:#define FLECHETTE_DAMAGE			12//15
;77:#define FLECHETTE_VEL				3500
;78:#define FLECHETTE_SIZE				1
;79:#define FLECHETTE_MINE_RADIUS_CHECK	256
;80:#define FLECHETTE_ALT_SHOTS			2
;81:#define FLECHETTE_ALT_DAMAGE		60
;82:#define FLECHETTE_ALT_SPLASH_DAM	60
;83:#define FLECHETTE_ALT_SPLASH_RAD	128
;84:
;85:// Personal Rocket Launcher
;86://---------
;87:#define	ROCKET_VELOCITY				900
;88:#define	ROCKET_DAMAGE				100
;89:#define	ROCKET_SPLASH_DAMAGE		100
;90:#define	ROCKET_SPLASH_RADIUS		160
;91:#define ROCKET_SIZE					3
;92:#define ROCKET_ALT_THINK_TIME		100
;93:
;94:// Stun Baton
;95://--------------
;96:#define STUN_BATON_DAMAGE			20
;97:#define STUN_BATON_ALT_DAMAGE		20
;98:#define STUN_BATON_RANGE			8
;99:
;100:
;101:extern qboolean G_BoxInBounds( vec3_t point, vec3_t mins, vec3_t maxs, vec3_t boundsMins, vec3_t boundsMaxs );
;102:
;103:static void WP_FireEmplaced( gentity_t *ent, qboolean altFire );
;104:
;105:void laserTrapStick( gentity_t *ent, vec3_t endpos, vec3_t normal );
;106:
;107:void touch_NULL( gentity_t *ent, gentity_t *other, trace_t *trace )
;108:{
line 110
;109:
;110:}
LABELV $123
endproc touch_NULL 0 0
export W_TraceSetStart
proc W_TraceSetStart 1140 28
line 117
;111:
;112:void laserTrapExplode( gentity_t *self );
;113:
;114://-----------------------------------------------------------------------------
;115:void W_TraceSetStart( gentity_t *ent, vec3_t start, vec3_t mins, vec3_t maxs )
;116://-----------------------------------------------------------------------------
;117:{
line 124
;118:	//make sure our start point isn't on the other side of a wall
;119:	trace_t	tr;
;120:	vec3_t	entMins;
;121:	vec3_t	entMaxs;
;122:	vec3_t	eyePoint;
;123:
;124:	VectorAdd( ent->r.currentOrigin, ent->r.mins, entMins );
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
ADDRLP4 1116
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1116
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1116
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1116
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080+8
ADDRLP4 1120
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1120
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 125
;125:	VectorAdd( ent->r.currentOrigin, ent->r.maxs, entMaxs );
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
ADDRLP4 1124
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1124
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1124
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1124
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092+8
ADDRLP4 1128
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1128
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 127
;126:
;127:	if ( G_BoxInBounds( start, mins, maxs, entMins, entMaxs ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1132
ADDRGP4 G_BoxInBounds
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
EQI4 $129
line 128
;128:	{
line 129
;129:		return;
ADDRGP4 $124
JUMPV
LABELV $129
line 132
;130:	}
;131:
;132:	if ( !ent->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $131
line 133
;133:	{
line 134
;134:		return;
ADDRGP4 $124
JUMPV
LABELV $131
line 137
;135:	}
;136:
;137:	VectorCopy( ent->s.pos.trBase, eyePoint);
ADDRLP4 1104
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 138
;138:	eyePoint[2] += ent->client->ps.viewheight;
ADDRLP4 1104+8
ADDRLP4 1104+8
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
line 140
;139:		
;140:	JP_Trace( &tr, eyePoint, mins, maxs, start, ent->s.number, MASK_SOLID|CONTENTS_SHOTCLIP );
ADDRLP4 0
ARGP4
ADDRLP4 1104
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 129
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 142
;141:
;142:	if ( tr.startsolid || tr.allsolid )
ADDRLP4 1136
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1136
INDIRI4
NEI4 $137
ADDRLP4 0
INDIRI4
ADDRLP4 1136
INDIRI4
EQI4 $134
LABELV $137
line 143
;143:	{
line 144
;144:		return;
ADDRGP4 $124
JUMPV
LABELV $134
line 147
;145:	}
;146:
;147:	if ( tr.fraction < 1.0f )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $138
line 148
;148:	{
line 149
;149:		VectorCopy( tr.endpos, start );
ADDRFP4 4
INDIRP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 150
;150:	}
LABELV $138
line 151
;151:}
LABELV $124
endproc W_TraceSetStart 1140 28
proc WP_FireBryarPistol 36 24
line 171
;152:
;153:
;154:/*
;155:----------------------------------------------
;156:	PLAYER WEAPONS
;157:----------------------------------------------
;158:*/
;159:
;160:/*
;161:======================================================================
;162:
;163:BRYAR PISTOL
;164:
;165:======================================================================
;166:*/
;167:
;168://----------------------------------------------
;169:static void WP_FireBryarPistol( gentity_t *ent, qboolean altFire )
;170://---------------------------------------------------------
;171:{
line 172
;172:	int damage = BRYAR_PISTOL_DAMAGE;
ADDRLP4 8
CNSTI4 10
ASGNI4
line 174
;173:	int count;
;174:	int nowTime = LEVELTIME(ent->client);
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
EQU4 $147
ADDRLP4 24
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $147
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $149
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
ADDRGP4 $150
JUMPV
LABELV $149
ADDRLP4 20
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $150
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $148
JUMPV
LABELV $147
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $148
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 176
;175:
;176:	gentity_t	*missile = CreateMissile( muzzle, forward, BRYAR_PISTOL_VEL, 10000, ent, altFire );
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
CNSTF4 1153957888
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 178
;177:
;178:	G_SetClassName(missile, "bryar_proj");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $151
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 179
;179:	missile->s.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 3
ASGNI4
line 181
;180:
;181:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $152
line 182
;182:	{
line 183
;183:		float boxSize = 0;
ADDRLP4 32
CNSTF4 0
ASGNF4
line 185
;184:
;185:		count = (nowTime - ent->client->ps.weaponChargeTime ) / BRYAR_CHARGE_UNIT;
ADDRLP4 4
ADDRLP4 12
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1128792064
DIVF4
CVFI4 4
ASGNI4
line 187
;186:
;187:		if ( count < 1 )
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $154
line 188
;188:		{
line 189
;189:			count = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 190
;190:		}
ADDRGP4 $155
JUMPV
LABELV $154
line 191
;191:		else if ( count > 5 )
ADDRLP4 4
INDIRI4
CNSTI4 5
LEI4 $156
line 192
;192:		{
line 193
;193:			count = 5;
ADDRLP4 4
CNSTI4 5
ASGNI4
line 194
;194:		}
LABELV $156
LABELV $155
line 196
;195:
;196:		if (count > 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
LEI4 $158
line 197
;197:		{
line 198
;198:			damage *= (count*1.7);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1071225242
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
MULF4
CVFI4 4
ASGNI4
line 199
;199:		}
ADDRGP4 $159
JUMPV
LABELV $158
line 201
;200:		else
;201:		{
line 202
;202:			damage *= (count*1.5);
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1069547520
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
MULF4
CVFI4 4
ASGNI4
line 203
;203:		}
LABELV $159
line 205
;204:
;205:		missile->s.generic1 = count; // The missile will then render according to the charge level.
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 208
;206://		missile->count = count;		// The single player stores the charge in count, which isn't accessible on the client
;207:
;208:		boxSize = BRYAR_ALT_SIZE*(count*0.5);
ADDRLP4 32
CNSTF4 1065353216
CNSTF4 1056964608
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
line 210
;209:
;210:		VectorSet( missile->r.maxs, boxSize, boxSize, boxSize );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 211
;211:		VectorSet( missile->r.mins, -boxSize, -boxSize, -boxSize );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 32
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 32
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 32
INDIRF4
NEGF4
ASGNF4
line 212
;212:	}
LABELV $152
line 214
;213:
;214:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 215
;215:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 128
ASGNI4
line 216
;216:	if (altFire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $160
line 217
;217:	{
line 218
;218:		missile->methodOfDeath = MOD_BRYAR_PISTOL_ALT;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 5
ASGNI4
line 219
;219:	}
ADDRGP4 $161
JUMPV
LABELV $160
line 221
;220:	else
;221:	{
line 222
;222:		missile->methodOfDeath = MOD_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 4
ASGNI4
line 223
;223:	}
LABELV $161
line 224
;224:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 262913
ASGNI4
line 228
;225:
;226:	// we don't want it to bounce forever
;227:	// NOTENOTE These don't bounce yet.
;228:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 8
ASGNI4
line 229
;229:}
LABELV $142
endproc WP_FireBryarPistol 36 24
export WP_FireTurretMissile
proc WP_FireTurretMissile 8 24
line 242
;230:
;231:/*
;232:======================================================================
;233:
;234:GENERIC
;235:
;236:======================================================================
;237:*/
;238:
;239://---------------------------------------------------------
;240:void WP_FireTurretMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire, int damage, int velocity, int mod, gentity_t *ignore )
;241://---------------------------------------------------------
;242:{
line 245
;243:	gentity_t *missile;
;244:
;245:	missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 247
;246:
;247:	G_SetClassName(missile, "generic_proj");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $163
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 248
;248:	missile->s.weapon = WP_TURRET;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 15
ASGNI4
line 250
;249:
;250:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 251
;251:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 128
ASGNI4
line 252
;252:	missile->methodOfDeath = mod;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRFP4 24
INDIRI4
ASGNI4
line 253
;253:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 262913
ASGNI4
line 255
;254:
;255:	if (ignore)
ADDRFP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $164
line 256
;256:	{
line 257
;257:		missile->passThroughNum = ignore->s.number+1;
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRFP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 258
;258:	}
LABELV $164
line 262
;259:
;260:	// we don't want it to bounce forever
;261:	// NOTENOTE These don't bounce yet.
;262:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 8
ASGNI4
line 263
;263:}
LABELV $162
endproc WP_FireTurretMissile 8 24
export WP_FireGenericBlasterMissile
proc WP_FireGenericBlasterMissile 8 24
line 270
;264:
;265://Currently only the seeker drone uses this, but it might be useful for other things as well.
;266:
;267://---------------------------------------------------------
;268:void WP_FireGenericBlasterMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire, int damage, int velocity, int mod )
;269://---------------------------------------------------------
;270:{
line 273
;271:	gentity_t *missile;
;272:
;273:	missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 275
;274:
;275:	G_SetClassName(missile, "generic_proj");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $163
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 276
;276:	missile->s.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 3
ASGNI4
line 278
;277:
;278:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 279
;279:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 128
ASGNI4
line 280
;280:	missile->methodOfDeath = mod;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRFP4 24
INDIRI4
ASGNI4
line 281
;281:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 262913
ASGNI4
line 285
;282:
;283:	// we don't want it to bounce forever
;284:	// NOTENOTE These don't bounce yet.
;285:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 8
ASGNI4
line 286
;286:}
LABELV $166
endproc WP_FireGenericBlasterMissile 8 24
export WP_FireBlasterMissile
proc WP_FireBlasterMissile 16 24
line 299
;287:
;288:/*
;289:======================================================================
;290:
;291:BLASTER
;292:
;293:======================================================================
;294:*/
;295:
;296://---------------------------------------------------------
;297:void WP_FireBlasterMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire )
;298://---------------------------------------------------------
;299:{
line 300
;300:	int velocity	= BLASTER_VELOCITY;
ADDRLP4 8
CNSTI4 2300
ASGNI4
line 301
;301:	int	damage		= BLASTER_DAMAGE;
ADDRLP4 4
CNSTI4 20
ASGNI4
line 304
;302:	gentity_t *missile;
;303:
;304:	if (ent->s.eType == ET_GRAPPLE)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $168
line 305
;305:	{ //animent
line 306
;306:		damage = 10;
ADDRLP4 4
CNSTI4 10
ASGNI4
line 307
;307:	}
LABELV $168
line 315
;308:	// NOTENOTE Vehicle models are not yet implemented
;309:/*	if ( ent->client && ent->client->ps.vehicleModel != 0 )
;310:	{
;311:		velocity = 10000;
;312:	}
;313:*/
;314:	
;315:	missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 317
;316:
;317:	G_SetClassName(missile, "blaster_proj");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $170
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 318
;318:	missile->s.weapon = WP_BLASTER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 327
;319:
;320:	// NOTENOTE Vehicle models are not yet implemented
;321:/*	if ( ent->client && ent->client->ps.vehicleModel != 0 )
;322:	{
;323:		damage = 250;
;324:	}
;325:	*/
;326:
;327:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 328
;328:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 128
ASGNI4
line 329
;329:	missile->methodOfDeath = MOD_BLASTER;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 6
ASGNI4
line 330
;330:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 262913
ASGNI4
line 334
;331:
;332:	// we don't want it to bounce forever
;333:	// NOTENOTE These don't bounce yet.
;334:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 8
ASGNI4
line 335
;335:}
LABELV $167
endproc WP_FireBlasterMissile 16 24
export WP_FireEmplacedMissile
proc WP_FireEmplacedMissile 16 24
line 340
;336:
;337://---------------------------------------------------------
;338:void WP_FireEmplacedMissile( gentity_t *ent, vec3_t start, vec3_t dir, qboolean altFire, gentity_t *ignore )
;339://---------------------------------------------------------
;340:{
line 341
;341:	int velocity	= BLASTER_VELOCITY;
ADDRLP4 4
CNSTI4 2300
ASGNI4
line 342
;342:	int	damage		= BLASTER_DAMAGE;
ADDRLP4 8
CNSTI4 20
ASGNI4
line 352
;343:	gentity_t *missile;
;344:
;345:	// NOTENOTE Vehicle models are not yet implemented
;346:/*	if ( ent->client && ent->client->ps.vehicleModel != 0 )
;347:	{
;348:		velocity = 10000;
;349:	}
;350:*/
;351:	
;352:	missile = CreateMissile( start, dir, velocity, 10000, ent, altFire );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 354
;353:
;354:	G_SetClassName(missile, "emplaced_gun_proj");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $172
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 355
;355:	missile->s.weapon = WP_TURRET;//WP_EMPLACED_GUN;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 15
ASGNI4
line 365
;356:
;357:	// NOTENOTE Vehicle models are not yet implemented
;358:/*	if ( ent->client && ent->client->ps.vehicleModel != 0 )
;359:	{
;360:		damage = 250;
;361:	}
;362:	*/
;363:
;364:	//missile->activator = ignore;
;365:	G_SetActivator(missile, ignore);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 367
;366:
;367:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 368
;368:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 128
ASGNI4
line 369
;369:	missile->methodOfDeath = MOD_BLASTER;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 6
ASGNI4
line 370
;370:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 262913
ASGNI4
line 372
;371:
;372:	if (ignore)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $173
line 373
;373:	{
line 374
;374:		missile->passThroughNum = ignore->s.number+1;
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRFP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 375
;375:	}
LABELV $173
line 379
;376:
;377:	// we don't want it to bounce forever
;378:	// NOTENOTE These don't bounce yet.
;379:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 8
ASGNI4
line 380
;380:}
LABELV $171
endproc WP_FireEmplacedMissile 16 24
proc WP_FireBlaster 32 16
line 385
;381:
;382://---------------------------------------------------------
;383:static void WP_FireBlaster( gentity_t *ent, qboolean altFire )
;384://---------------------------------------------------------
;385:{
line 388
;386:	vec3_t	dir, angs;
;387:
;388:	vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 390
;389:
;390:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $176
line 391
;391:	{
line 393
;392:		// add some slop to the alt-fire direction
;393:		angs[PITCH] += crandom() * BLASTER_SPREAD;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1070386381
CNSTF4 1073741824
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 394
;394:		angs[YAW]	+= crandom() * BLASTER_SPREAD;
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1070386381
CNSTF4 1073741824
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 395
;395:	}
LABELV $176
line 397
;396:
;397:	AngleVectors( angs, dir, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 400
;398:
;399:	// FIXME: if temp_org does not have clear trace to inside the bbox, don't shoot!
;400:	WP_FireBlasterMissile( ent, muzzle, dir, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBlasterMissile
CALLV
pop
line 401
;401:}
LABELV $175
endproc WP_FireBlaster 32 16
proc WP_DisruptorMainFire 1200 32
line 417
;402:
;403:
;404:
;405:int G_GetHitLocation(gentity_t *target, vec3_t ppoint);
;406:
;407:/*
;408:======================================================================
;409:
;410:DISRUPTOR
;411:
;412:======================================================================
;413:*/
;414://---------------------------------------------------------
;415:static void WP_DisruptorMainFire( gentity_t *ent )
;416://---------------------------------------------------------
;417:{
line 418
;418:	int			damage = DISRUPTOR_MAIN_DAMAGE;
ADDRLP4 1128
CNSTI4 30
ASGNI4
line 419
;419:	qboolean	render_impact = qtrue;
ADDRLP4 1124
CNSTI4 1
ASGNI4
line 423
;420:	vec3_t		start, end	/*, spot*/	;
;421:	trace_t		tr;
;422:	gentity_t	*traceEnt, *tent;
;423:	float		/*dist, */shotRange = 8192;
ADDRLP4 1120
CNSTF4 1174405120
ASGNF4
line 426
;424:	int			ignore, traces;
;425:
;426:	memset(&tr, 0, sizeof(tr)); //to shut the compiler up
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1080
ARGU4
ADDRGP4 memset
CALLP4
pop
line 428
;427:
;428:	VectorCopy( ent->client->ps.origin, start );
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 429
;429:	start[2] += ent->client->ps.viewheight;//By eyes
ADDRLP4 1084+8
ADDRLP4 1084+8
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
line 431
;430:
;431:	VectorMA( start, shotRange, forward, end );
ADDRLP4 1108
ADDRLP4 1084
INDIRF4
ADDRGP4 forward
INDIRF4
ADDRLP4 1120
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1108+4
ADDRLP4 1084+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
ADDRLP4 1120
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1108+8
ADDRLP4 1084+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
ADDRLP4 1120
INDIRF4
MULF4
ADDF4
ASGNF4
line 435
;432:
;433://	JP_Trace( &tr, start, NULL, NULL, end, ent->s.number, MASK_SHOT);
;434:
;435:	ignore = ent->s.number;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 436
;436:	traces = 0;
ADDRLP4 1100
CNSTI4 0
ASGNI4
ADDRGP4 $188
JUMPV
LABELV $187
line 438
;437:	while ( traces < 10 )
;438:	{//need to loop this in case we hit a Jedi who dodges the shot
line 439
;439:		JP_Trace( &tr, start, NULL, NULL, end, ignore, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRLP4 1084
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
ADDRLP4 1108
ARGP4
ADDRLP4 1096
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 441
;440:
;441:		traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 443
;442:
;443:		if (traceEnt && traceEnt->client && traceEnt->client->ps.duelInProgress &&
ADDRLP4 1144
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1144
INDIRU4
EQU4 $191
ADDRLP4 1148
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CVPU4 4
ADDRLP4 1144
INDIRU4
EQU4 $191
ADDRLP4 1148
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $191
ADDRLP4 1148
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $191
line 445
;444:			traceEnt->client->ps.duelIndex != ent->s.number)
;445:		{
line 446
;446:			VectorCopy( tr.endpos, start );
ADDRLP4 1084
ADDRLP4 4+12
INDIRB
ASGNB 12
line 447
;447:			ignore = tr.entityNum;
ADDRLP4 1096
ADDRLP4 4+52
INDIRI4
ASGNI4
line 448
;448:			traces++;
ADDRLP4 1100
ADDRLP4 1100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 449
;449:			continue;
ADDRGP4 $188
JUMPV
LABELV $191
line 456
;450:		}
;451:
;452:		/*if (ent->client->sess.raceMode) {
;453:
;454:		}
;455:		else */
;456:		if ( Jedi_DodgeEvasion( traceEnt, ent, &tr, G_GetHitLocation(traceEnt, tr.endpos) ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1152
ADDRGP4 G_GetHitLocation
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1152
INDIRI4
ARGI4
ADDRLP4 1156
ADDRGP4 Jedi_DodgeEvasion
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
EQI4 $195
line 457
;457:		{//act like we didn't even hit him
line 458
;458:			VectorCopy( tr.endpos, start );
ADDRLP4 1084
ADDRLP4 4+12
INDIRB
ASGNB 12
line 459
;459:			ignore = tr.entityNum;
ADDRLP4 1096
ADDRLP4 4+52
INDIRI4
ASGNI4
line 460
;460:			traces++;
ADDRLP4 1100
ADDRLP4 1100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 461
;461:			continue;
ADDRGP4 $188
JUMPV
LABELV $195
line 463
;462:		}
;463:		else if (traceEnt && traceEnt->client && traceEnt->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_3)
ADDRLP4 1164
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1164
INDIRU4
EQU4 $189
ADDRLP4 1168
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1168
INDIRP4
CVPU4 4
ADDRLP4 1164
INDIRU4
EQU4 $189
ADDRLP4 1168
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 3
LTI4 $189
line 464
;464:		{
line 465
;465:			if (WP_SaberCanBlock(traceEnt, tr.endpos, 0, MOD_DISRUPTOR, qtrue, 0))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1172
CNSTI4 0
ASGNI4
ADDRLP4 1172
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1172
INDIRI4
ARGI4
ADDRLP4 1176
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
EQI4 $189
line 466
;466:			{ //broadcast and stop the shot because it was blocked
line 467
;467:				gentity_t *te = NULL;
ADDRLP4 1180
CNSTP4 0
ASGNP4
line 469
;468:
;469:				tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_MAIN_SHOT );
ADDRLP4 4+12
ARGP4
CNSTI4 31
ARGI4
ADDRLP4 1184
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1104
ADDRLP4 1184
INDIRP4
ASGNP4
line 470
;470:				VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 1104
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 471
;471:				tent->s.eventParm = ent->s.number;
ADDRLP4 1104
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 472
;472:				tent->belongsToParent = qtrue;
ADDRLP4 1104
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 1
ASGNI4
line 473
;473:				tent->parent = ent;
ADDRLP4 1104
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 475
;474:
;475:				te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 4+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1188
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1180
ADDRLP4 1188
INDIRP4
ASGNP4
line 476
;476:				VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1180
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4+12
INDIRB
ASGNB 12
line 477
;477:				VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1180
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 4+24
INDIRB
ASGNB 12
line 478
;478:				if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1196
CNSTF4 0
ASGNF4
ADDRLP4 1180
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1196
INDIRF4
NEF4 $209
ADDRLP4 1180
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1196
INDIRF4
NEF4 $209
ADDRLP4 1180
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1196
INDIRF4
NEF4 $209
line 479
;479:				{
line 480
;480:					te->s.angles[1] = 1;
ADDRLP4 1180
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 481
;481:				}
LABELV $209
line 482
;482:				te->s.eventParm = 0;
ADDRLP4 1180
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 483
;483:				tent->belongsToParent = qtrue;
ADDRLP4 1104
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 1
ASGNI4
line 484
;484:				tent->parent = ent;
ADDRLP4 1104
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 486
;485:
;486:				return;
ADDRGP4 $179
JUMPV
line 488
;487:			}
;488:		}
line 490
;489:		//a Jedi is not dodging this shot
;490:		break;
LABELV $188
line 437
ADDRLP4 1100
INDIRI4
CNSTI4 10
LTI4 $187
LABELV $189
line 493
;491:	}
;492:
;493:	traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 495
;494:
;495:	if ( tr.surfaceFlags & SURF_NOIMPACT && !(traceEnt->damageindefrag && ent->client->sess.raceMode)) // badly converted maps can have SURF_NOIMPACT without intention (SURF_NOOB?)
ADDRLP4 1136
CNSTI4 0
ASGNI4
ADDRLP4 4+44
INDIRI4
CNSTI4 524288
BANDI4
ADDRLP4 1136
INDIRI4
EQI4 $212
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
ADDRLP4 1136
INDIRI4
EQI4 $215
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 1136
INDIRI4
NEI4 $212
LABELV $215
line 496
;496:	{
line 497
;497:		render_impact = qfalse;
ADDRLP4 1124
CNSTI4 0
ASGNI4
line 498
;498:	}
LABELV $212
line 501
;499:
;500:	// always render a shot beam, doing this the old way because I don't much feel like overriding the effect.
;501:	tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_MAIN_SHOT );
ADDRLP4 4+12
ARGP4
CNSTI4 31
ARGI4
ADDRLP4 1140
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1104
ADDRLP4 1140
INDIRP4
ASGNP4
line 502
;502:	VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 1104
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 503
;503:	tent->s.eventParm = ent->s.number;
ADDRLP4 1104
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 504
;504:	tent->belongsToParent = qtrue;
ADDRLP4 1104
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 1
ASGNI4
line 505
;505:	tent->parent = ent;
ADDRLP4 1104
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 507
;506:
;507:	if ( render_impact )
ADDRLP4 1124
INDIRI4
CNSTI4 0
EQI4 $217
line 508
;508:	{
line 509
;509:		if ( tr.entityNum < ENTITYNUM_WORLD && traceEnt->takedamage )
ADDRLP4 4+52
INDIRI4
CNSTI4 1022
GEI4 $219
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $219
line 510
;510:		{
line 514
;511:			// Create a simple impact type mark that doesn't last long in the world
;512://			G_PlayEffect( G_EffectIndex( "disruptor/flesh_impact" ), tr.endpos, tr.plane.normal );
;513:
;514:			if ( traceEnt->client && LogAccuracyHit( traceEnt, ent )) 
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $222
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1148
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
EQI4 $222
line 515
;515:			{
line 516
;516:				ent->client->accuracy_hits++;
ADDRLP4 1152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43668
ADDP4
ASGNP4
ADDRLP4 1152
INDIRP4
ADDRLP4 1152
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 517
;517:			} 
LABELV $222
line 519
;518:
;519:			G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, DAMAGE_NORMAL, MOD_DISRUPTOR );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1128
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 521
;520:			
;521:			tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1156
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1104
ADDRLP4 1156
INDIRP4
ASGNP4
line 522
;522:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1160
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1104
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1160
INDIRI4
ASGNI4
line 523
;523:			if (traceEnt->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $227
line 524
;524:			{
line 525
;525:				tent->s.weapon = 1;
ADDRLP4 1104
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 1
ASGNI4
line 526
;526:			}
LABELV $227
line 527
;527:			tent->belongsToParent = qtrue;
ADDRLP4 1104
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 1
ASGNI4
line 528
;528:			tent->parent = ent;
ADDRLP4 1104
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 529
;529:		}
ADDRGP4 $220
JUMPV
LABELV $219
line 531
;530:		else 
;531:		{
line 533
;532:			 // Hmmm, maybe don't make any marks on things that could break
;533:			tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_SNIPER_MISS );
ADDRLP4 4+12
ARGP4
CNSTI4 33
ARGI4
ADDRLP4 1144
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1104
ADDRLP4 1144
INDIRP4
ASGNP4
line 534
;534:			tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1148
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1104
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1148
INDIRI4
ASGNI4
line 535
;535:			tent->s.weapon = 1;
ADDRLP4 1104
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 1
ASGNI4
line 536
;536:			tent->belongsToParent = qtrue;
ADDRLP4 1104
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 1
ASGNI4
line 537
;537:			tent->parent = ent;
ADDRLP4 1104
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 538
;538:		}
LABELV $220
line 539
;539:	}
LABELV $217
line 540
;540:}
LABELV $179
endproc WP_DisruptorMainFire 1200 32
lit
align 4
LABELV $311
byte 4 0
skip 8
export WP_DisruptorAltFire
code
proc WP_DisruptorAltFire 1260 32
line 546
;541:
;542:
;543://---------------------------------------------------------
;544:void WP_DisruptorAltFire( gentity_t *ent )
;545://---------------------------------------------------------
;546:{
line 547
;547:	int			damage = 0, skip;
ADDRLP4 1140
CNSTI4 0
ASGNI4
line 548
;548:	qboolean	render_impact = qtrue;
ADDRLP4 1124
CNSTI4 1
ASGNI4
line 552
;549:	vec3_t		start, end;
;550:	trace_t		tr;
;551:	gentity_t	*traceEnt, *tent;
;552:	float		shotRange = 8192;
ADDRLP4 1116
CNSTF4 1174405120
ASGNF4
line 557
;553:	// float	dist, shotDist;
;554:	// vec3_t	spot, dir;
;555:	int			i;
;556:	int			count;
;557:	int			traces = DISRUPTOR_ALT_TRACES;
ADDRLP4 1132
CNSTI4 3
ASGNI4
line 558
;558:	qboolean	fullCharge = qfalse;
ADDRLP4 1128
CNSTI4 0
ASGNI4
line 559
;559:	int			nowTime = LEVELTIME(ent->client);
ADDRLP4 1156
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $236
ADDRLP4 1156
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $236
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $238
ADDRLP4 1152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $239
JUMPV
LABELV $238
ADDRLP4 1152
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $239
ADDRLP4 1148
ADDRLP4 1152
INDIRI4
ASGNI4
ADDRGP4 $237
JUMPV
LABELV $236
ADDRLP4 1148
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $237
ADDRLP4 1144
ADDRLP4 1148
INDIRI4
ASGNI4
line 561
;560:
;561:	damage = DISRUPTOR_ALT_DAMAGE-30;
ADDRLP4 1140
CNSTI4 70
ASGNI4
line 572
;562:
;563:	/*
;564:	if (ent->client->ps.zoomMode == 1 &&
;565:		ent->client->ps.zoomLocked)
;566:	{ //Scale the additional 25 damage based on the zoomFov for the client.
;567:	  //In this instance, zoomFov 1 is minimum zoom while zoomFov 50 is maximum.
;568:		damage += ent->client->ps.zoomFov/2;
;569:	}
;570:	*/
;571:
;572:	if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $240
line 573
;573:	{
line 574
;574:		VectorCopy( ent->client->ps.origin, start );
ADDRLP4 1088
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 575
;575:		start[2] += ent->client->ps.viewheight;//By eyes
ADDRLP4 1088+8
ADDRLP4 1088+8
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
line 577
;576:
;577:		count = (nowTime - ent->client->ps.weaponChargeTime ) / DISRUPTOR_CHARGE_UNIT;
ADDRLP4 1136
ADDRLP4 1144
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1112014848
DIVF4
CVFI4 4
ASGNI4
line 578
;578:	}
ADDRGP4 $241
JUMPV
LABELV $240
line 580
;579:	else
;580:	{
line 581
;581:		VectorCopy( ent->r.currentOrigin, start );
ADDRLP4 1088
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 582
;582:		start[2] += 24;
ADDRLP4 1088+8
ADDRLP4 1088+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 584
;583:
;584:		count = ( 100 ) / DISRUPTOR_CHARGE_UNIT;
ADDRLP4 1136
CNSTI4 2
ASGNI4
line 585
;585:	}
LABELV $241
line 587
;586:
;587:	count *= 2;
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 589
;588:
;589:	if ( count < 1 )
ADDRLP4 1136
INDIRI4
CNSTI4 1
GEI4 $244
line 590
;590:	{
line 591
;591:		count = 1;
ADDRLP4 1136
CNSTI4 1
ASGNI4
line 592
;592:	}
ADDRGP4 $245
JUMPV
LABELV $244
line 593
;593:	else if ( count >= 60 )
ADDRLP4 1136
INDIRI4
CNSTI4 60
LTI4 $246
line 594
;594:	{
line 595
;595:		count = 60;
ADDRLP4 1136
CNSTI4 60
ASGNI4
line 596
;596:		fullCharge = qtrue;
ADDRLP4 1128
CNSTI4 1
ASGNI4
line 597
;597:	}
LABELV $246
LABELV $245
line 600
;598:
;599:	// more powerful charges go through more things
;600:	if ( count < 10 )
ADDRLP4 1136
INDIRI4
CNSTI4 10
GEI4 $248
line 601
;601:	{
line 602
;602:		traces = 1;
ADDRLP4 1132
CNSTI4 1
ASGNI4
line 603
;603:	}
ADDRGP4 $249
JUMPV
LABELV $248
line 604
;604:	else if ( count < 20 )
ADDRLP4 1136
INDIRI4
CNSTI4 20
GEI4 $250
line 605
;605:	{
line 606
;606:		traces = 2;
ADDRLP4 1132
CNSTI4 2
ASGNI4
line 607
;607:	}
LABELV $250
LABELV $249
line 609
;608:
;609:	damage += count;
ADDRLP4 1140
ADDRLP4 1140
INDIRI4
ADDRLP4 1136
INDIRI4
ADDI4
ASGNI4
line 611
;610:
;611:	skip = ent->s.number;
ADDRLP4 1112
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 613
;612:
;613:	for (i = 0; i < traces; i++ )
ADDRLP4 1120
CNSTI4 0
ASGNI4
ADDRGP4 $255
JUMPV
LABELV $252
line 614
;614:	{
line 615
;615:		VectorMA( start, shotRange, forward, end );
ADDRLP4 1100
ADDRLP4 1088
INDIRF4
ADDRGP4 forward
INDIRF4
ADDRLP4 1116
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1088+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
ADDRLP4 1116
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1088+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
ADDRLP4 1116
INDIRF4
MULF4
ADDF4
ASGNF4
line 617
;616:
;617:		JP_Trace ( &tr, start, NULL, NULL, end, skip, MASK_SHOT);
ADDRLP4 4
ARGP4
ADDRLP4 1088
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
ADDRLP4 1100
ARGP4
ADDRLP4 1112
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 619
;618:
;619:		traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 621
;620:
;621:		if ((tr.surfaceFlags & SURF_NOIMPACT) && !(traceEnt->damageindefrag && ent->client->sess.raceMode)) // badly converted maps can have SURF_NOIMPACT without intention (SURF_NOOB?)
ADDRLP4 1168
CNSTI4 0
ASGNI4
ADDRLP4 4+44
INDIRI4
CNSTI4 524288
BANDI4
ADDRLP4 1168
INDIRI4
EQI4 $263
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
ADDRLP4 1168
INDIRI4
EQI4 $266
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 1168
INDIRI4
NEI4 $263
LABELV $266
line 622
;622:		{
line 623
;623:			render_impact = qfalse;
ADDRLP4 1124
CNSTI4 0
ASGNI4
line 624
;624:		}
LABELV $263
line 627
;625:
;626:
;627:		if (traceEnt && traceEnt->client && traceEnt->client->ps.duelInProgress &&
ADDRLP4 1176
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1176
INDIRU4
EQU4 $267
ADDRLP4 1180
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CVPU4 4
ADDRLP4 1176
INDIRU4
EQU4 $267
ADDRLP4 1180
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $267
ADDRLP4 1180
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $267
line 629
;628:			traceEnt->client->ps.duelIndex != ent->s.number)
;629:		{
line 630
;630:			skip = tr.entityNum;
ADDRLP4 1112
ADDRLP4 4+52
INDIRI4
ASGNI4
line 631
;631:			VectorCopy(tr.endpos, start);
ADDRLP4 1088
ADDRLP4 4+12
INDIRB
ASGNB 12
line 632
;632:			continue;
ADDRGP4 $253
JUMPV
LABELV $267
line 635
;633:		}
;634:
;635:		if (Jedi_DodgeEvasion(traceEnt, ent, &tr, G_GetHitLocation(traceEnt, tr.endpos)))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1184
ADDRGP4 G_GetHitLocation
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1184
INDIRI4
ARGI4
ADDRLP4 1188
ADDRGP4 Jedi_DodgeEvasion
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 0
EQI4 $271
line 636
;636:		{
line 637
;637:			skip = tr.entityNum;
ADDRLP4 1112
ADDRLP4 4+52
INDIRI4
ASGNI4
line 638
;638:			VectorCopy(tr.endpos, start);
ADDRLP4 1088
ADDRLP4 4+12
INDIRB
ASGNB 12
line 639
;639:			continue;
ADDRGP4 $253
JUMPV
LABELV $271
line 641
;640:		}
;641:		else if (traceEnt && traceEnt->client && traceEnt->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_3)
ADDRLP4 1196
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1196
INDIRU4
EQU4 $276
ADDRLP4 1200
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
CVPU4 4
ADDRLP4 1196
INDIRU4
EQU4 $276
ADDRLP4 1200
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 3
LTI4 $276
line 642
;642:		{
line 643
;643:			if (WP_SaberCanBlock(traceEnt, tr.endpos, 0, MOD_DISRUPTOR_SNIPER, qtrue, 0))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1204
CNSTI4 0
ASGNI4
ADDRLP4 1204
INDIRI4
ARGI4
CNSTI4 9
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1204
INDIRI4
ARGI4
ADDRLP4 1208
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1208
INDIRI4
CNSTI4 0
EQI4 $278
line 644
;644:			{ //broadcast and stop the shot because it was blocked
line 645
;645:				gentity_t *te = NULL;
ADDRLP4 1212
CNSTP4 0
ASGNP4
line 647
;646:
;647:				tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_SNIPER_SHOT );
ADDRLP4 4+12
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1216
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1216
INDIRP4
ASGNP4
line 648
;648:				VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 1084
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 649
;649:				tent->s.shouldtarget = fullCharge;
ADDRLP4 1084
INDIRP4
CNSTI4 268
ADDP4
ADDRLP4 1128
INDIRI4
ASGNI4
line 650
;650:				tent->s.eventParm = ent->s.number;
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 652
;651:
;652:				te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 4+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1220
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1212
ADDRLP4 1220
INDIRP4
ASGNP4
line 653
;653:				VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1212
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4+12
INDIRB
ASGNB 12
line 654
;654:				VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1212
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 4+24
INDIRB
ASGNB 12
line 655
;655:				if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1228
CNSTF4 0
ASGNF4
ADDRLP4 1212
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1228
INDIRF4
NEF4 $285
ADDRLP4 1212
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1228
INDIRF4
NEF4 $285
ADDRLP4 1212
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1228
INDIRF4
NEF4 $285
line 656
;656:				{
line 657
;657:					te->s.angles[1] = 1;
ADDRLP4 1212
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 658
;658:				}
LABELV $285
line 659
;659:				te->s.eventParm = 0;
ADDRLP4 1212
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 661
;660:
;661:				return;
ADDRGP4 $231
JUMPV
LABELV $278
line 663
;662:			}
;663:		}
LABELV $276
line 666
;664:
;665:		// always render a shot beam, doing this the old way because I don't much feel like overriding the effect.
;666:		tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_SNIPER_SHOT );
ADDRLP4 4+12
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1204
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1204
INDIRP4
ASGNP4
line 667
;667:		VectorCopy( muzzle, tent->s.origin2 );
ADDRLP4 1084
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 668
;668:		tent->s.shouldtarget = fullCharge;
ADDRLP4 1084
INDIRP4
CNSTI4 268
ADDP4
ADDRLP4 1128
INDIRI4
ASGNI4
line 669
;669:		tent->s.eventParm = ent->s.number;
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 670
;670:		tent->belongsToParent = qtrue;
ADDRLP4 1084
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 1
ASGNI4
line 671
;671:		tent->parent = ent;
ADDRLP4 1084
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 674
;672:
;673:		// If the beam hits a skybox, etc. it would look foolish to add impact effects
;674:		if ( render_impact ) 
ADDRLP4 1124
INDIRI4
CNSTI4 0
EQI4 $254
line 675
;675:		{
line 676
;676:			if ( traceEnt->takedamage && traceEnt->client )
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $290
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $290
line 677
;677:			{
line 678
;678:				tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 1084
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 682
;679:
;680:				// Create a simple impact type mark
;681://				G_PlayEffect( G_EffectIndex( "disruptor/alt_hit" ), tr.endpos, tr.plane.normal );
;682:				tent = G_TempEntity(tr.endpos, EV_MISSILE_MISS);
ADDRLP4 4+12
ARGP4
CNSTI4 74
ARGI4
ADDRLP4 1212
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1212
INDIRP4
ASGNP4
line 683
;683:				tent->s.eventParm = DirToByte(tr.plane.normal);
ADDRLP4 4+24
ARGP4
ADDRLP4 1216
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1216
INDIRI4
ASGNI4
line 684
;684:				tent->s.eFlags |= EF_ALT_FIRING;
ADDRLP4 1220
ADDRLP4 1084
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 1220
INDIRP4
ADDRLP4 1220
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 685
;685:				tent->belongsToParent = qtrue;
ADDRLP4 1084
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 1
ASGNI4
line 686
;686:				tent->parent = ent;
ADDRLP4 1084
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 688
;687:	
;688:				if ( LogAccuracyHit( traceEnt, ent )) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1224
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
EQI4 $291
line 689
;689:				{
line 690
;690:					if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $291
line 691
;691:					{
line 692
;692:						ent->client->accuracy_hits++;
ADDRLP4 1228
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43668
ADDP4
ASGNP4
ADDRLP4 1228
INDIRP4
ADDRLP4 1228
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 693
;693:					}
line 694
;694:				}
line 695
;695:			} 
ADDRGP4 $291
JUMPV
LABELV $290
line 697
;696:			else 
;697:			{
line 698
;698:				 if ( traceEnt->r.svFlags & SVF_GLASS_BRUSH 
ADDRLP4 1216
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 134217728
BANDI4
ADDRLP4 1216
INDIRI4
NEI4 $301
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 1216
INDIRI4
NEI4 $301
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $298
LABELV $301
line 701
;699:						|| traceEnt->takedamage 
;700:						|| traceEnt->s.eType == ET_MOVER )
;701:				 {
line 703
;702:					//rww - is there some reason this was doing nothing?
;703:					if ( traceEnt->takedamage )
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $254
line 704
;704:					{
line 705
;705:						G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, 
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1140
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 708
;706:								DAMAGE_NO_KNOCKBACK/*|DAMAGE_HALF_ARMOR_REDUCTION*/, MOD_DISRUPTOR_SNIPER );
;707:
;708:						tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1224
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1224
INDIRP4
ASGNP4
line 709
;709:						tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1228
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1228
INDIRI4
ASGNI4
line 710
;710:						tent->belongsToParent = qtrue;
ADDRLP4 1084
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 1
ASGNI4
line 711
;711:						tent->parent = ent;
ADDRLP4 1084
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 712
;712:					}
line 713
;713:				 }
ADDRGP4 $254
JUMPV
LABELV $298
line 715
;714:				 else
;715:				 {
line 717
;716:					 // Hmmm, maybe don't make any marks on things that could break
;717:					tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_SNIPER_MISS );
ADDRLP4 4+12
ARGP4
CNSTI4 33
ARGI4
ADDRLP4 1220
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1220
INDIRP4
ASGNP4
line 718
;718:					tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1224
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1224
INDIRI4
ASGNI4
line 719
;719:					tent->belongsToParent = qtrue;
ADDRLP4 1084
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 1
ASGNI4
line 720
;720:					tent->parent = ent;
ADDRLP4 1084
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 721
;721:				 }
line 722
;722:				break; // and don't try any more traces
ADDRGP4 $254
JUMPV
LABELV $291
line 725
;723:			}
;724:
;725:			if ( traceEnt->takedamage )
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $289
line 726
;726:			{
line 727
;727:				vec3_t preAng = { 0 };
ADDRLP4 1212
ADDRGP4 $311
INDIRB
ASGNB 12
line 728
;728:				int preHealth = traceEnt->health;
ADDRLP4 1224
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ASGNI4
line 729
;729:				int preLegs = 0;
ADDRLP4 1228
CNSTI4 0
ASGNI4
line 730
;730:				int preTorso = 0;
ADDRLP4 1232
CNSTI4 0
ASGNI4
line 732
;731:
;732:				if (traceEnt->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $312
line 733
;733:				{
line 734
;734:					preLegs = traceEnt->client->ps.legsAnim;
ADDRLP4 1228
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 735
;735:					preTorso = traceEnt->client->ps.torsoAnim;
ADDRLP4 1232
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
line 736
;736:					VectorCopy(traceEnt->client->ps.viewangles, preAng);
ADDRLP4 1212
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 737
;737:				}
LABELV $312
line 739
;738:
;739:				G_Damage( traceEnt, ent, ent, forward, tr.endpos, damage, DAMAGE_NO_KNOCKBACK, MOD_DISRUPTOR_SNIPER );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 1140
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 741
;740:
;741:				if (traceEnt->client && preHealth > 0 && traceEnt->health <= 0 && fullCharge)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $315
ADDRLP4 1244
CNSTI4 0
ASGNI4
ADDRLP4 1224
INDIRI4
ADDRLP4 1244
INDIRI4
LEI4 $315
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 1244
INDIRI4
GTI4 $315
ADDRLP4 1128
INDIRI4
ADDRLP4 1244
INDIRI4
EQI4 $315
line 742
;742:				{ //was killed by a fully charged sniper shot, so disintegrate
line 743
;743:					VectorCopy(preAng, traceEnt->client->ps.viewangles);
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 1212
INDIRB
ASGNB 12
line 745
;744:
;745:					traceEnt->client->ps.eFlags |= EF_DISINTEGRATION;
ADDRLP4 1248
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 1248
INDIRP4
ADDRLP4 1248
INDIRP4
INDIRI4
CNSTI4 33554432
BORI4
ASGNI4
line 746
;746:					VectorCopy(tr.endpos, traceEnt->client->ps.lastHitLoc);
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1368
ADDP4
ADDRLP4 4+12
INDIRB
ASGNB 12
line 748
;747:
;748:					traceEnt->client->ps.legsAnim = preLegs;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 1228
INDIRI4
ASGNI4
line 749
;749:					traceEnt->client->ps.torsoAnim = preTorso;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 1232
INDIRI4
ASGNI4
line 751
;750:
;751:					traceEnt->r.contents = 0;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 753
;752:
;753:					VectorClear(traceEnt->client->ps.velocity);
ADDRLP4 1252
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1256
CNSTF4 0
ASGNF4
ADDRLP4 1252
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1256
INDIRF4
ASGNF4
ADDRLP4 1252
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1256
INDIRF4
ASGNF4
ADDRLP4 1252
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1256
INDIRF4
ASGNF4
line 754
;754:				}
LABELV $315
line 756
;755:
;756:				tent = G_TempEntity( tr.endpos, EV_DISRUPTOR_HIT );
ADDRLP4 4+12
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1248
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1248
INDIRP4
ASGNP4
line 757
;757:				tent->s.eventParm = DirToByte( tr.plane.normal );
ADDRLP4 4+24
ARGP4
ADDRLP4 1252
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 1084
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 1252
INDIRI4
ASGNI4
line 758
;758:				tent->belongsToParent = qtrue;
ADDRLP4 1084
INDIRP4
CNSTI4 2336
ADDP4
CNSTI4 1
ASGNI4
line 759
;759:				tent->parent = ent;
ADDRLP4 1084
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 760
;760:				if (traceEnt->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $289
line 761
;761:				{
line 762
;762:					tent->s.weapon = 1;
ADDRLP4 1084
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 1
ASGNI4
line 763
;763:				}
line 764
;764:			}
line 765
;765:		}
line 767
;766:		else // not rendering impact, must be a skybox or other similar thing?
;767:		{
line 768
;768:			break; // don't try anymore traces
LABELV $289
line 772
;769:		}
;770:
;771:		// Get ready for an attempt to trace through another person
;772:		VectorCopy( tr.endpos, muzzle );
ADDRGP4 muzzle
ADDRLP4 4+12
INDIRB
ASGNB 12
line 773
;773:		VectorCopy( tr.endpos, start );
ADDRLP4 1088
ADDRLP4 4+12
INDIRB
ASGNB 12
line 774
;774:		skip = tr.entityNum;
ADDRLP4 1112
ADDRLP4 4+52
INDIRI4
ASGNI4
line 775
;775:	}
LABELV $253
line 613
ADDRLP4 1120
ADDRLP4 1120
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $255
ADDRLP4 1120
INDIRI4
ADDRLP4 1132
INDIRI4
LTI4 $252
LABELV $254
line 776
;776:}
LABELV $231
endproc WP_DisruptorAltFire 1260 32
proc WP_FireDisruptor 20 4
line 782
;777:
;778:
;779://---------------------------------------------------------
;780:static void WP_FireDisruptor( gentity_t *ent, qboolean altFire )
;781://---------------------------------------------------------
;782:{
line 783
;783:	if (!ent || !ent->client || ent->client->ps.zoomMode != 1)
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
EQU4 $329
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $329
ADDRLP4 8
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 1
EQI4 $326
LABELV $329
line 784
;784:	{ //do not ever let it do the alt fire when not zoomed
line 785
;785:		altFire = qfalse;
ADDRFP4 4
CNSTI4 0
ASGNI4
line 786
;786:	}
LABELV $326
line 788
;787:
;788:	if (ent && ent->s.eType == ET_GRAPPLE && !ent->client)
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
EQU4 $330
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $330
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $330
line 789
;789:	{ //special case for animents
line 790
;790:		WP_DisruptorAltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DisruptorAltFire
CALLV
pop
line 791
;791:		return;
ADDRGP4 $325
JUMPV
LABELV $330
line 794
;792:	}
;793:
;794:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $332
line 795
;795:	{
line 796
;796:		WP_DisruptorAltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DisruptorAltFire
CALLV
pop
line 797
;797:	}
ADDRGP4 $333
JUMPV
LABELV $332
line 799
;798:	else
;799:	{
line 800
;800:		WP_DisruptorMainFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DisruptorMainFire
CALLV
pop
line 801
;801:	}
LABELV $333
line 802
;802:}
LABELV $325
endproc WP_FireDisruptor 20 4
proc WP_BowcasterAltFire 28 24
line 814
;803:
;804:
;805:/*
;806:======================================================================
;807:
;808:BOWCASTER
;809:
;810:======================================================================
;811:*/
;812:
;813:static void WP_BowcasterAltFire( gentity_t *ent )
;814:{
line 815
;815:	int	damage	= BOWCASTER_DAMAGE;
ADDRLP4 4
CNSTI4 50
ASGNI4
line 817
;816:
;817:	gentity_t *missile = CreateMissile( muzzle, forward, BOWCASTER_VELOCITY, 10000, ent, qfalse);
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
CNSTF4 1151500288
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 819
;818:
;819:	G_SetClassName(missile, "bowcaster_proj");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $335
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 820
;820:	missile->s.weapon = WP_BOWCASTER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 6
ASGNI4
line 822
;821:
;822:	VectorSet( missile->r.maxs, BOWCASTER_SIZE, BOWCASTER_SIZE, BOWCASTER_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1073741824
ASGNF4
line 823
;823:	VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 825
;824:
;825:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 826
;826:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 128
ASGNI4
line 827
;827:	if (ent->client->sess.raceMode) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $336
line 828
;828:		missile->damage = 5;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 5
ASGNI4
line 829
;829:		missile->methodOfDeath = MOD_TARGET_LASER; //no bowcaster alt so hijackt his :/
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 36
ASGNI4
line 830
;830:	}
ADDRGP4 $337
JUMPV
LABELV $336
line 832
;831:	else
;832:		missile->methodOfDeath = MOD_BOWCASTER;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 10
ASGNI4
LABELV $337
line 833
;833:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 262913
ASGNI4
line 837
;834://	missile->splashDamage = BOWCASTER_SPLASH_DAMAGE;
;835://	missile->splashRadius = BOWCASTER_SPLASH_RADIUS;
;836:
;837:	missile->s.eFlags |= EF_BOUNCE;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 838
;838:	missile->bounceCount = 3;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 3
ASGNI4
line 839
;839:}
LABELV $334
endproc WP_BowcasterAltFire 28 24
proc WP_BowcasterMainFire 96 24
line 844
;840:
;841://---------------------------------------------------------
;842:static void WP_BowcasterMainFire( gentity_t *ent )
;843://---------------------------------------------------------
;844:{
line 845
;845:	int			damage	= BOWCASTER_DAMAGE, count;
ADDRLP4 40
CNSTI4 50
ASGNI4
line 850
;846:	float		vel;
;847:	vec3_t		angs, dir;
;848:	gentity_t	*missile;
;849:	int i;
;850:	int nowTime = LEVELTIME(ent->client);
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
EQU4 $343
ADDRLP4 56
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $343
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $345
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $346
JUMPV
LABELV $345
ADDRLP4 52
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $346
ADDRLP4 48
ADDRLP4 52
INDIRI4
ASGNI4
ADDRGP4 $344
JUMPV
LABELV $343
ADDRLP4 48
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $344
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
line 852
;851:
;852:	if (!ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $347
line 853
;853:	{
line 854
;854:		count = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 855
;855:	}
ADDRGP4 $348
JUMPV
LABELV $347
line 857
;856:	else
;857:	{
line 858
;858:		count = (nowTime - ent->client->ps.weaponChargeTime ) / BOWCASTER_CHARGE_UNIT;
ADDRLP4 20
ADDRLP4 44
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1128792064
DIVF4
CVFI4 4
ASGNI4
line 859
;859:	}
LABELV $348
line 861
;860:
;861:	if ( count < 1 )
ADDRLP4 20
INDIRI4
CNSTI4 1
GEI4 $349
line 862
;862:	{
line 863
;863:		count = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 864
;864:	}
ADDRGP4 $350
JUMPV
LABELV $349
line 865
;865:	else if ( count > 5 )
ADDRLP4 20
INDIRI4
CNSTI4 5
LEI4 $351
line 866
;866:	{
line 867
;867:		count = 5;
ADDRLP4 20
CNSTI4 5
ASGNI4
line 868
;868:	}
LABELV $351
LABELV $350
line 870
;869:
;870:	if ( !(count & 1 ))
ADDRLP4 20
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $353
line 871
;871:	{
line 873
;872:		// if we aren't odd, knock us down a level
;873:		count--;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 874
;874:	}
LABELV $353
line 877
;875:
;876:	//scale the damage down based on how many are about to be fired
;877:	if (count <= 1)
ADDRLP4 20
INDIRI4
CNSTI4 1
GTI4 $355
line 878
;878:	{
line 879
;879:		damage = 50;
ADDRLP4 40
CNSTI4 50
ASGNI4
line 880
;880:	}
ADDRGP4 $356
JUMPV
LABELV $355
line 881
;881:	else if (count == 2)
ADDRLP4 20
INDIRI4
CNSTI4 2
NEI4 $357
line 882
;882:	{
line 883
;883:		damage = 45;
ADDRLP4 40
CNSTI4 45
ASGNI4
line 884
;884:	}
ADDRGP4 $358
JUMPV
LABELV $357
line 885
;885:	else if (count == 3)
ADDRLP4 20
INDIRI4
CNSTI4 3
NEI4 $359
line 886
;886:	{
line 887
;887:		damage = 40;
ADDRLP4 40
CNSTI4 40
ASGNI4
line 888
;888:	}
ADDRGP4 $360
JUMPV
LABELV $359
line 889
;889:	else if (count == 4)
ADDRLP4 20
INDIRI4
CNSTI4 4
NEI4 $361
line 890
;890:	{
line 891
;891:		damage = 35;
ADDRLP4 40
CNSTI4 35
ASGNI4
line 892
;892:	}
ADDRGP4 $362
JUMPV
LABELV $361
line 894
;893:	else
;894:	{
line 895
;895:		damage = 30;
ADDRLP4 40
CNSTI4 30
ASGNI4
line 896
;896:	}
LABELV $362
LABELV $360
LABELV $358
LABELV $356
line 898
;897:
;898:	for (i = 0; i < count; i++ )
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $366
JUMPV
LABELV $363
line 899
;899:	{
line 901
;900:		// create a range of different velocities
;901:		if (ent->client->sess.raceMode)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $367
line 902
;902:			vel = BOWCASTER_VELOCITY;
ADDRLP4 24
CNSTF4 1151500288
ASGNF4
ADDRGP4 $368
JUMPV
LABELV $367
line 904
;903:		else
;904:			vel = BOWCASTER_VELOCITY * (crandom() * BOWCASTER_VEL_RANGE + 1.0f);
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
CNSTF4 1151500288
CNSTF4 1050253722
CNSTF4 1073741824
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
LABELV $368
line 907
;905:		
;906:
;907:		vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 910
;908:
;909:		// add some slop to the alt-fire direction
;910:		angs[PITCH] += crandom() * BOWCASTER_ALT_SPREAD * 0.2f;
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1045220557
CNSTF4 1084227584
CNSTF4 1073741824
ADDRLP4 64
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
MULF4
ADDF4
ASGNF4
line 911
;911:		angs[YAW]	+= ((i+0.5f) * BOWCASTER_ALT_SPREAD - count * 0.5f * BOWCASTER_ALT_SPREAD );
ADDRLP4 68
CNSTF4 1084227584
ASGNF4
ADDRLP4 72
CNSTF4 1056964608
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 68
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDRLP4 72
INDIRF4
ADDF4
MULF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
MULF4
MULF4
SUBF4
ADDF4
ASGNF4
line 913
;912:		
;913:		AngleVectors( angs, dir, NULL, NULL );
ADDRLP4 4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 76
CNSTP4 0
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 915
;914:
;915:		missile = CreateMissile( muzzle, dir, vel, 10000, ent, qtrue );
ADDRGP4 muzzle
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
ASGNP4
line 917
;916:
;917:		G_SetClassName(missile, "bowcaster_alt_proj");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $370
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 918
;918:		missile->s.weapon = WP_BOWCASTER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 6
ASGNI4
line 920
;919:
;920:		VectorSet( missile->r.maxs, BOWCASTER_SIZE, BOWCASTER_SIZE, BOWCASTER_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1073741824
ASGNF4
line 921
;921:		VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 923
;922:
;923:		missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 924
;924:		missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 128
ASGNI4
line 925
;925:		missile->methodOfDeath = MOD_BOWCASTER;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 10
ASGNI4
line 926
;926:		missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 262913
ASGNI4
line 931
;927://		missile->splashDamage = BOWCASTER_SPLASH_DAMAGE;
;928://		missile->splashRadius = BOWCASTER_SPLASH_RADIUS;
;929:
;930:		// we don't want it to bounce
;931:		missile->bounceCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 0
ASGNI4
line 932
;932:	}
LABELV $364
line 898
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $366
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $363
line 933
;933:}
LABELV $338
endproc WP_BowcasterMainFire 96 24
proc WP_FireBowcaster 0 4
line 938
;934:
;935://---------------------------------------------------------
;936:static void WP_FireBowcaster( gentity_t *ent, qboolean altFire )
;937://---------------------------------------------------------
;938:{
line 939
;939:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $372
line 940
;940:	{
line 941
;941:		WP_BowcasterAltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_BowcasterAltFire
CALLV
pop
line 942
;942:	}
ADDRGP4 $373
JUMPV
LABELV $372
line 944
;943:	else
;944:	{
line 945
;945:		WP_BowcasterMainFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_BowcasterMainFire
CALLV
pop
line 946
;946:	}
LABELV $373
line 947
;947:}
LABELV $371
endproc WP_FireBowcaster 0 4
proc WP_RepeaterMainFire 12 24
line 962
;948:
;949:
;950:
;951:/*
;952:======================================================================
;953:
;954:REPEATER
;955:
;956:======================================================================
;957:*/
;958:
;959://---------------------------------------------------------
;960:static void WP_RepeaterMainFire( gentity_t *ent, vec3_t dir )
;961://---------------------------------------------------------
;962:{
line 963
;963:	int	damage	= REPEATER_DAMAGE;
ADDRLP4 4
CNSTI4 14
ASGNI4
line 965
;964:
;965:	gentity_t *missile = CreateMissile( muzzle, dir, REPEATER_VELOCITY, 10000, ent, qfalse );
ADDRGP4 muzzle
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTF4 1153957888
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 967
;966:
;967:	G_SetClassName(missile, "repeater_proj");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 968
;968:	missile->s.weapon = WP_REPEATER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 7
ASGNI4
line 970
;969:
;970:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 971
;971:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 128
ASGNI4
line 972
;972:	missile->methodOfDeath = MOD_REPEATER;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 11
ASGNI4
line 973
;973:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 262913
ASGNI4
line 976
;974:
;975:	// we don't want it to bounce forever
;976:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 8
ASGNI4
line 977
;977:}
LABELV $374
endproc WP_RepeaterMainFire 12 24
proc WP_RepeaterAltFire 28 24
line 982
;978:
;979://---------------------------------------------------------
;980:static void WP_RepeaterAltFire( gentity_t *ent )
;981://---------------------------------------------------------
;982:{
line 983
;983:	int	damage	= REPEATER_ALT_DAMAGE;
ADDRLP4 4
CNSTI4 60
ASGNI4
line 985
;984:
;985:	gentity_t *missile = CreateMissile( muzzle, forward, REPEATER_ALT_VELOCITY, 10000, ent, qtrue );
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
CNSTF4 1149861888
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 987
;986:
;987:	G_SetClassName(missile, "repeater_alt_proj");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $377
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 988
;988:	missile->s.weapon = WP_REPEATER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 7
ASGNI4
line 991
;989://	missile->mass = 10;		// NOTENOTE No mass yet
;990:
;991:	VectorSet( missile->r.maxs, REPEATER_ALT_SIZE, REPEATER_ALT_SIZE, REPEATER_ALT_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 992
;992:	VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 993
;993:	missile->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 994
;994:	missile->s.pos.trDelta[2] += 40.0f; //give a slight boost in the upward direction
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 995
;995:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 996
;996:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 128
ASGNI4
line 997
;997:	missile->methodOfDeath = MOD_REPEATER_ALT;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 12
ASGNI4
line 998
;998:	missile->splashMethodOfDeath = MOD_REPEATER_ALT_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 13
ASGNI4
line 999
;999:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 262913
ASGNI4
line 1000
;1000:	missile->splashDamage = REPEATER_ALT_SPLASH_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 60
ASGNI4
line 1001
;1001:	missile->splashRadius = REPEATER_ALT_SPLASH_RADIUS;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 128
ASGNI4
line 1004
;1002:
;1003:	// we don't want it to bounce forever
;1004:	missile->bounceCount = 8;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 8
ASGNI4
line 1005
;1005:}
LABELV $376
endproc WP_RepeaterAltFire 28 24
proc WP_FireRepeater 36 16
line 1010
;1006:
;1007://---------------------------------------------------------
;1008:static void WP_FireRepeater( gentity_t *ent, qboolean altFire )
;1009://---------------------------------------------------------
;1010:{
line 1013
;1011:	vec3_t	dir, angs;
;1012:
;1013:	vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1015
;1014:
;1015:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $379
line 1016
;1016:	{
line 1017
;1017:		WP_RepeaterAltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_RepeaterAltFire
CALLV
pop
line 1018
;1018:	}
ADDRGP4 $380
JUMPV
LABELV $379
line 1020
;1019:	else
;1020:	{
line 1022
;1021:		// add some slop to the alt-fire direction
;1022:		angs[PITCH] += crandom() * REPEATER_SPREAD;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1068708659
CNSTF4 1073741824
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1023
;1023:		angs[YAW]	+= crandom() * REPEATER_SPREAD;
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1068708659
CNSTF4 1073741824
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1025
;1024:
;1025:		AngleVectors( angs, dir, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1028
;1026:
;1027:		// NOTENOTE if temp_org does not have clear trace to inside the bbox, don't shoot!
;1028:		WP_RepeaterMainFire( ent, dir );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 WP_RepeaterMainFire
CALLV
pop
line 1029
;1029:	}
LABELV $380
line 1030
;1030:}
LABELV $378
endproc WP_FireRepeater 36 16
proc WP_DEMP2_MainFire 24 24
line 1042
;1031:
;1032:
;1033:/*
;1034:======================================================================
;1035:
;1036:DEMP2
;1037:
;1038:======================================================================
;1039:*/
;1040:
;1041:static void WP_DEMP2_MainFire( gentity_t *ent )
;1042:{
line 1043
;1043:	int	damage	= DEMP2_DAMAGE;
ADDRLP4 4
CNSTI4 35
ASGNI4
line 1045
;1044:
;1045:	gentity_t *missile = CreateMissile( muzzle, forward, DEMP2_VELOCITY, 10000, ent, qfalse);
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
CNSTF4 1155596288
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1047
;1046:
;1047:	G_SetClassName(missile, "demp2_proj");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $383
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 1048
;1048:	missile->s.weapon = WP_DEMP2;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 8
ASGNI4
line 1050
;1049:
;1050:	VectorSet( missile->r.maxs, DEMP2_SIZE, DEMP2_SIZE, DEMP2_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1073741824
ASGNF4
line 1051
;1051:	VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 1052
;1052:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1053
;1053:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 128
ASGNI4
line 1054
;1054:	missile->methodOfDeath = MOD_DEMP2;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 14
ASGNI4
line 1056
;1055:	//rww - Don't want this blockable, do we?
;1056:	missile->clipmask = MASK_SHOT;// | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 769
ASGNI4
line 1059
;1057:
;1058:	// we don't want it to ever bounce
;1059:	missile->bounceCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 0
ASGNI4
line 1060
;1060:}
LABELV $382
endproc WP_DEMP2_MainFire 24 24
export DEMP2_AltRadiusDamage
proc DEMP2_AltRadiusDamage 8336 32
line 1065
;1061:
;1062:static gentity_t *ent_list[MAX_GENTITIES];
;1063:
;1064:void DEMP2_AltRadiusDamage( gentity_t *ent )
;1065:{
line 1066
;1066:	float		frac = ( level.time - ent->bolt_Head ) / 800.0f; // / 1600.0f; // synchronize with demp2 effect
ADDRLP4 8268
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1145569280
DIVF4
ASGNF4
line 1071
;1067:	float		dist, radius, fact;
;1068:	gentity_t	*gent;
;1069:	int			iEntityList[MAX_GENTITIES];
;1070:	gentity_t	*entityList[MAX_GENTITIES];
;1071:	gentity_t	*myOwner = NULL;
ADDRLP4 32
CNSTP4 0
ASGNP4
line 1076
;1072:	int			numListedEntities, i, e;
;1073:	vec3_t		mins, maxs;
;1074:	vec3_t		v, dir;
;1075:
;1076:	if (ent->r.ownerNum >= 0 &&
ADDRLP4 8276
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8276
INDIRI4
CNSTI4 0
LTI4 $386
ADDRLP4 8276
INDIRI4
CNSTI4 32
GEI4 $386
line 1078
;1077:		ent->r.ownerNum < MAX_CLIENTS)
;1078:	{
line 1079
;1079:		myOwner = &g_entities[ent->r.ownerNum];
ADDRLP4 32
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1080
;1080:	}
LABELV $386
line 1082
;1081:
;1082:	if (!myOwner || !myOwner->inuse || !myOwner->client)
ADDRLP4 8284
CNSTU4 0
ASGNU4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 8284
INDIRU4
EQU4 $391
ADDRLP4 32
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $391
ADDRLP4 32
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8284
INDIRU4
NEU4 $388
LABELV $391
line 1083
;1083:	{
line 1084
;1084:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1085
;1085:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1086
;1086:		return;
ADDRGP4 $384
JUMPV
LABELV $388
line 1089
;1087:	}
;1088:
;1089:	frac *= frac * frac; // yes, this is completely ridiculous...but it causes the shell to grow slowly then "explode" at the end
ADDRLP4 8268
ADDRLP4 8268
INDIRF4
ADDRLP4 8268
INDIRF4
ADDRLP4 8268
INDIRF4
MULF4
MULF4
ASGNF4
line 1091
;1090:	
;1091:	radius = frac * 200.0f; // 200 is max radius...the model is aprox. 100 units tall...the fx draw code mults. this by 2.
ADDRLP4 36
CNSTF4 1128792064
ADDRLP4 8268
INDIRF4
MULF4
ASGNF4
line 1093
;1092:
;1093:	fact = ent->count*0.6;
ADDRLP4 8272
CNSTF4 1058642330
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1095
;1094:
;1095:	if (fact < 1)
ADDRLP4 8272
INDIRF4
CNSTF4 1065353216
GEF4 $393
line 1096
;1096:	{
line 1097
;1097:		fact = 1;
ADDRLP4 8272
CNSTF4 1065353216
ASGNF4
line 1098
;1098:	}
LABELV $393
line 1100
;1099:
;1100:	radius *= fact;
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 8272
INDIRF4
MULF4
ASGNF4
line 1102
;1101:
;1102:	for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $395
line 1103
;1103:	{
line 1104
;1104:		mins[i] = ent->r.currentOrigin[i] - radius;
ADDRLP4 8292
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8292
INDIRI4
ADDRLP4 8244
ADDP4
ADDRLP4 8292
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ASGNF4
line 1105
;1105:		maxs[i] = ent->r.currentOrigin[i] + radius;
ADDRLP4 8296
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8296
INDIRI4
ADDRLP4 8256
ADDP4
ADDRLP4 8296
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
line 1106
;1106:	}
LABELV $396
line 1102
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $395
line 1108
;1107:
;1108:	numListedEntities = trap_EntitiesInBox( mins, maxs, iEntityList, MAX_GENTITIES );
ADDRLP4 8244
ARGP4
ADDRLP4 8256
ARGP4
ADDRLP4 4148
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8292
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 48
ADDRLP4 8292
INDIRI4
ASGNI4
line 1110
;1109:
;1110:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $400
JUMPV
LABELV $399
line 1112
;1111:	while (i < numListedEntities)
;1112:	{
line 1113
;1113:		entityList[i] = &g_entities[iEntityList[i]];
ADDRLP4 8296
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8296
INDIRI4
ADDRLP4 52
ADDP4
CNSTI4 2352
ADDRLP4 8296
INDIRI4
ADDRLP4 4148
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1114
;1114:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1115
;1115:	}
LABELV $400
line 1111
ADDRLP4 0
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $399
line 1117
;1116:
;1117:	for ( e = 0 ; e < numListedEntities ; e++ ) 
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRGP4 $405
JUMPV
LABELV $402
line 1118
;1118:	{
line 1119
;1119:		gent = entityList[ e ];
ADDRLP4 4
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 52
ADDP4
INDIRP4
ASGNP4
line 1121
;1120:
;1121:		if ( !gent || !gent->takedamage || !gent->r.contents )
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $409
ADDRLP4 8300
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 8300
INDIRI4
EQI4 $409
ADDRLP4 4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ADDRLP4 8300
INDIRI4
NEI4 $406
LABELV $409
line 1122
;1122:		{
line 1123
;1123:			continue;
ADDRGP4 $403
JUMPV
LABELV $406
line 1126
;1124:		}
;1125:		
;1126:		if (gent->client && gent->client->sess.raceMode != myOwner->client->sess.raceMode) { //racemode isolation for alt demp?
ADDRLP4 8304
CNSTI4 408
ASGNI4
ADDRLP4 8308
ADDRLP4 4
INDIRP4
ADDRLP4 8304
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8308
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $410
ADDRLP4 8312
CNSTI4 43488
ASGNI4
ADDRLP4 8308
INDIRP4
ADDRLP4 8312
INDIRI4
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
ADDRLP4 8304
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8312
INDIRI4
ADDP4
INDIRI4
EQI4 $410
line 1127
;1127:			continue;
ADDRGP4 $403
JUMPV
LABELV $410
line 1131
;1128:		}
;1129:
;1130:		// find the distance from the edge of the bounding box
;1131:		for ( i = 0 ; i < 3 ; i++ ) 
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $412
line 1132
;1132:		{
line 1133
;1133:			if ( ent->r.currentOrigin[i] < gent->r.absmin[i] ) 
ADDRLP4 8316
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8316
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 8316
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
GEF4 $416
line 1134
;1134:			{
line 1135
;1135:				v[i] = gent->r.absmin[i] - ent->r.currentOrigin[i];
ADDRLP4 8320
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8320
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 8320
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 8320
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1136
;1136:			} 
ADDRGP4 $417
JUMPV
LABELV $416
line 1137
;1137:			else if ( ent->r.currentOrigin[i] > gent->r.absmax[i] ) 
ADDRLP4 8320
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8320
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 8320
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
LEF4 $418
line 1138
;1138:			{
line 1139
;1139:				v[i] = ent->r.currentOrigin[i] - gent->r.absmax[i];
ADDRLP4 8324
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 8324
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 8324
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 8324
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1140
;1140:			} 
ADDRGP4 $419
JUMPV
LABELV $418
line 1142
;1141:			else 
;1142:			{
line 1143
;1143:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1144
;1144:			}
LABELV $419
LABELV $417
line 1145
;1145:		}
LABELV $413
line 1131
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $412
line 1148
;1146:
;1147:		// shape is an ellipsoid, so cut vertical distance in half`
;1148:		v[2] *= 0.5f;
ADDRLP4 8+8
CNSTF4 1056964608
ADDRLP4 8+8
INDIRF4
MULF4
ASGNF4
line 1150
;1149:
;1150:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 8316
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 8316
INDIRF4
ASGNF4
line 1152
;1151:
;1152:		if ( dist >= radius ) 
ADDRLP4 44
INDIRF4
ADDRLP4 36
INDIRF4
LTF4 $421
line 1153
;1153:		{
line 1155
;1154:			// shockwave hasn't hit them yet
;1155:			continue;
ADDRGP4 $403
JUMPV
LABELV $421
line 1159
;1156:		}
;1157:
;1158:		//if ( dist < ent->bolt_LArm )
;1159:		if (dist+(16*ent->count) < ent->bolt_LArm)
ADDRLP4 8320
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRF4
ADDRLP4 8320
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 4
LSHI4
CVIF4 4
ADDF4
ADDRLP4 8320
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CVIF4 4
GEF4 $423
line 1160
;1160:		{
line 1162
;1161:			// shockwave has already hit this thing...
;1162:			continue;
ADDRGP4 $403
JUMPV
LABELV $423
line 1165
;1163:		}
;1164:
;1165:		VectorCopy( gent->r.currentOrigin, v );
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1166
;1166:		VectorSubtract( v, ent->r.currentOrigin, dir);
ADDRLP4 8324
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 8
INDIRF4
ADDRLP4 8324
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 8324
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 8+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1169
;1167:
;1168:		// push the center of mass higher than the origin so players get knocked into the air more
;1169:		dir[2] += 12;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 1171
;1170:
;1171:		if (gent != myOwner)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRP4
CVPU4 4
EQU4 $430
line 1172
;1172:		{
line 1173
;1173:			G_Damage( gent, myOwner, myOwner, dir, ent->r.currentOrigin, ent->damage, DAMAGE_DEATH_KNOCKBACK, ent->splashMethodOfDeath );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 8332
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8332
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 8332
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
ARGI4
CNSTI4 128
ARGI4
ADDRLP4 8332
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1174
;1174:		}
LABELV $430
line 1175
;1175:	}
LABELV $403
line 1117
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $405
ADDRLP4 40
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $402
line 1178
;1176:
;1177:	// store the last fraction so that next time around we can test against those things that fall between that last point and where the current shockwave edge is
;1178:	ent->bolt_LArm = radius;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDRLP4 36
INDIRF4
CVFI4 4
ASGNI4
line 1180
;1179:
;1180:	if ( frac < 1.0f )
ADDRLP4 8268
INDIRF4
CNSTF4 1065353216
GEF4 $432
line 1181
;1181:	{
line 1183
;1182:		// shock is still happening so continue letting it expand
;1183:		ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1184
;1184:	}
ADDRGP4 $433
JUMPV
LABELV $432
line 1186
;1185:	else
;1186:	{ //don't just leave the entity around
line 1187
;1187:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1188
;1188:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1189
;1189:	}
LABELV $433
line 1190
;1190:}
LABELV $384
endproc DEMP2_AltRadiusDamage 8336 32
export DEMP2_AltDetonate
proc DEMP2_AltDetonate 24 12
line 1195
;1191:
;1192://---------------------------------------------------------
;1193:void DEMP2_AltDetonate( gentity_t *ent )
;1194://---------------------------------------------------------
;1195:{
line 1198
;1196:	gentity_t *efEnt;
;1197:
;1198:	G_SetOrigin( ent, ent->r.currentOrigin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1199
;1199:	if (!ent->pos1[0] && !ent->pos1[1] && !ent->pos1[2])
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $437
ADDRLP4 8
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $437
ADDRLP4 8
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $437
line 1200
;1200:	{ //don't play effect with a 0'd out directional vector
line 1201
;1201:		ent->pos1[1] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTF4 1065353216
ASGNF4
line 1202
;1202:	}
LABELV $437
line 1204
;1203:	//Let's just save ourself some bandwidth and play both the effect and sphere spawn in 1 event
;1204:	efEnt = G_PlayEffect( EFFECT_EXPLOSION_DEMP2ALT, ent->r.currentOrigin, ent->pos1 );
CNSTI4 9
ARGI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 552
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PlayEffect
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1206
;1205:
;1206:	if (efEnt)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $439
line 1207
;1207:	{
line 1208
;1208:		efEnt->s.weapon = ent->count*2;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1209
;1209:	}
LABELV $439
line 1211
;1210:
;1211:	ent->bolt_Head = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1212
;1212:	ent->bolt_LArm = 0;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
CNSTI4 0
ASGNI4
line 1213
;1213:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1214
;1214:	ent->think = DEMP2_AltRadiusDamage;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 DEMP2_AltRadiusDamage
ASGNP4
line 1215
;1215:	ent->s.eType = ET_GENERAL; // make us a missile no longer
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1216
;1216:}
LABELV $436
endproc DEMP2_AltDetonate 24 12
proc WP_DEMP2_AltFire 1168 28
line 1221
;1217:
;1218://---------------------------------------------------------
;1219:static void WP_DEMP2_AltFire( gentity_t *ent )
;1220://---------------------------------------------------------
;1221:{
line 1222
;1222:	int		damage	= DEMP2_ALT_DAMAGE;
ADDRLP4 32
CNSTI4 8
ASGNI4
line 1228
;1223:	int		count, origcount;
;1224:	float	fact;
;1225:	vec3_t	start, end;
;1226:	trace_t	tr;
;1227:	gentity_t *missile;
;1228:	int nowTime = LEVELTIME(ent->client);
ADDRLP4 1136
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $448
ADDRLP4 1136
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $448
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $450
ADDRLP4 1132
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $451
JUMPV
LABELV $450
ADDRLP4 1132
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $451
ADDRLP4 1128
ADDRLP4 1132
INDIRI4
ASGNI4
ADDRGP4 $449
JUMPV
LABELV $448
ADDRLP4 1128
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $449
ADDRLP4 1124
ADDRLP4 1128
INDIRI4
ASGNI4
line 1230
;1229:
;1230:	VectorCopy( muzzle, start );
ADDRLP4 8
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 1232
;1231:
;1232:	VectorMA( start, DEMP2_ALT_RANGE, forward, end );
ADDRLP4 1140
CNSTF4 1166016512
ASGNF4
ADDRLP4 20
ADDRLP4 8
INDIRF4
ADDRLP4 1140
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 8+4
INDIRF4
ADDRLP4 1140
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 8+8
INDIRF4
CNSTF4 1166016512
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1234
;1233:
;1234:	count = (nowTime - ent->client->ps.weaponChargeTime ) / DEMP2_CHARGE_UNIT;
ADDRLP4 4
ADDRLP4 1124
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1143930880
DIVF4
CVFI4 4
ASGNI4
line 1236
;1235:
;1236:	origcount = count;
ADDRLP4 1120
ADDRLP4 4
INDIRI4
ASGNI4
line 1238
;1237:
;1238:	if ( count < 1 )
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $458
line 1239
;1239:	{
line 1240
;1240:		count = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1241
;1241:	}
ADDRGP4 $459
JUMPV
LABELV $458
line 1242
;1242:	else if ( count > 3 )
ADDRLP4 4
INDIRI4
CNSTI4 3
LEI4 $460
line 1243
;1243:	{
line 1244
;1244:		count = 3;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 1245
;1245:	}
LABELV $460
LABELV $459
line 1247
;1246:
;1247:	fact = count*0.8;
ADDRLP4 36
CNSTF4 1061997773
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1248
;1248:	if (fact < 1)
ADDRLP4 36
INDIRF4
CNSTF4 1065353216
GEF4 $462
line 1249
;1249:	{
line 1250
;1250:		fact = 1;
ADDRLP4 36
CNSTF4 1065353216
ASGNF4
line 1251
;1251:	}
LABELV $462
line 1252
;1252:	damage *= fact;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1254
;1253:
;1254:	if (!origcount)
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $464
line 1255
;1255:	{ //this was just a tap-fire
line 1256
;1256:		damage = 1;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 1257
;1257:	}
LABELV $464
line 1261
;1258:
;1259:	//damage *= ( 1 + ( count * ( count - 1 )));// yields damage of 12,36,84...gives a higher bonus for longer charge
;1260:
;1261:	JP_Trace( &tr, start, NULL, NULL, end, ent->s.number, MASK_SHOT);
ADDRLP4 40
ARGP4
ADDRLP4 8
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
ADDRLP4 20
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1266
;1262:
;1263:	// we treat the trace fraction like it's a time value, meaning that the shot can travel a whopping 4096 units in 1 second
;1264:
;1265:	//missile = CreateMissile( start, forward, DEMP2_ALT_RANGE, tr.fraction * 1000/*time*/, ent, qtrue );
;1266:	missile = G_Spawn();
ADDRLP4 1148
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1148
INDIRP4
ASGNP4
line 1267
;1267:	G_SetOrigin(missile, tr.endpos);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1270
;1268:	//rww - I guess it's rather pointless making it a missile anyway, at least for MP.
;1269:
;1270:	VectorCopy( tr.plane.normal, missile->pos1 );
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 40+24
INDIRB
ASGNB 12
line 1272
;1271:
;1272:	missile->count = count;
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1274
;1273:
;1274:	G_SetClassName(missile, "demp2_alt_proj");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $468
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 1275
;1275:	missile->s.weapon = WP_DEMP2;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 8
ASGNI4
line 1277
;1276:
;1277:	missile->think = DEMP2_AltDetonate;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 DEMP2_AltDetonate
ASGNP4
line 1278
;1278:	missile->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1280
;1279:
;1280:	missile->splashDamage = missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1281
;1281:	missile->splashMethodOfDeath = missile->methodOfDeath = MOD_DEMP2;
ADDRLP4 1164
CNSTI4 14
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 1164
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRLP4 1164
INDIRI4
ASGNI4
line 1282
;1282:	missile->splashRadius = DEMP2_ALT_SPLASHRADIUS;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 256
ASGNI4
line 1284
;1283:
;1284:	missile->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1286
;1285:
;1286:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 128
ASGNI4
line 1287
;1287:	missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 262913
ASGNI4
line 1290
;1288:
;1289:	// we don't want it to ever bounce
;1290:	missile->bounceCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 0
ASGNI4
line 1291
;1291:}
LABELV $443
endproc WP_DEMP2_AltFire 1168 28
proc WP_FireDEMP2 0 4
line 1296
;1292:
;1293://---------------------------------------------------------
;1294:static void WP_FireDEMP2( gentity_t *ent, qboolean altFire )
;1295://---------------------------------------------------------
;1296:{
line 1297
;1297:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $471
line 1298
;1298:	{
line 1299
;1299:		WP_DEMP2_AltFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DEMP2_AltFire
CALLV
pop
line 1300
;1300:	}
ADDRGP4 $472
JUMPV
LABELV $471
line 1302
;1301:	else
;1302:	{
line 1303
;1303:		WP_DEMP2_MainFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_DEMP2_MainFire
CALLV
pop
line 1304
;1304:	}
LABELV $472
line 1305
;1305:}
LABELV $470
endproc WP_FireDEMP2 0 4
proc WP_FlechetteMainFire 68 24
line 1320
;1306:
;1307:
;1308:
;1309:/*
;1310:======================================================================
;1311:
;1312:FLECHETTE
;1313:
;1314:======================================================================
;1315:*/
;1316:
;1317://---------------------------------------------------------
;1318:static void WP_FlechetteMainFire( gentity_t *ent )
;1319://---------------------------------------------------------
;1320:{
line 1325
;1321:	vec3_t		fwd, angs;
;1322:	gentity_t	*missile;
;1323:	int i;
;1324:
;1325:	for (i = 0; i < FLECHETTE_SHOTS; i++ )
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $474
line 1326
;1326:	{
line 1327
;1327:		vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1329
;1328:
;1329:		if ( i == 0 )
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $478
line 1330
;1330:		{
line 1332
;1331:			// do nothing on the first shot, this one will hit the crosshairs
;1332:		}
ADDRGP4 $479
JUMPV
LABELV $478
line 1334
;1333:		else
;1334:		{
line 1335
;1335:			angs[PITCH] += crandom() * FLECHETTE_SPREAD;
ADDRLP4 32
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1082130432
CNSTF4 1073741824
ADDRLP4 32
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1336
;1336:			angs[YAW]	+= crandom() * FLECHETTE_SPREAD;
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8+4
ADDRLP4 8+4
INDIRF4
CNSTF4 1082130432
CNSTF4 1073741824
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1337
;1337:		}
LABELV $479
line 1339
;1338:
;1339:		AngleVectors( angs, fwd, NULL, NULL );
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1341
;1340:
;1341:		missile = CreateMissile( muzzle, fwd, FLECHETTE_VEL, 10000, ent, qfalse);
ADDRGP4 muzzle
ARGP4
ADDRLP4 20
ARGP4
CNSTF4 1163575296
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 1343
;1342:
;1343:		G_SetClassName(missile, "flech_proj");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $481
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 1344
;1344:		missile->s.weapon = WP_FLECHETTE;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 9
ASGNI4
line 1346
;1345:
;1346:		VectorSet( missile->r.maxs, FLECHETTE_SIZE, FLECHETTE_SIZE, FLECHETTE_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1065353216
ASGNF4
line 1347
;1347:		VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 1349
;1348:
;1349:		missile->damage = FLECHETTE_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 12
ASGNI4
line 1350
;1350:		missile->dflags = DAMAGE_DEATH_KNOCKBACK;// | DAMAGE_EXTRA_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 128
ASGNI4
line 1351
;1351:		missile->methodOfDeath = MOD_FLECHETTE;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 16
ASGNI4
line 1352
;1352:		missile->clipmask = MASK_SHOT | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 262913
ASGNI4
line 1355
;1353:
;1354:		// we don't want it to bounce forever
;1355:		missile->bounceCount = Q_irand(5,8 + gRandomUnlockAdd, ent->client && ent->client->sess.raceMode, 6);
CNSTI4 5
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 8
ADDI4
ARGI4
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
EQU4 $483
ADDRLP4 56
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $483
ADDRLP4 52
CNSTI4 1
ASGNI4
ADDRGP4 $484
JUMPV
LABELV $483
ADDRLP4 52
CNSTI4 0
ASGNI4
LABELV $484
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 60
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 1357
;1356:
;1357:		missile->s.eFlags |= EF_BOUNCE_SHRAPNEL;
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 8
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
line 1358
;1358:	}
LABELV $475
line 1325
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
LTI4 $474
line 1359
;1359:}
LABELV $473
endproc WP_FlechetteMainFire 68 24
export RemoveLaserTraps
proc RemoveLaserTraps 8 8
line 1362
;1360:
;1361:void RemoveLaserTraps(gentity_t* ent)
;1362:{
line 1363
;1363:	gentity_t* found = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $487
JUMPV
LABELV $486
line 1366
;1364:
;1365:	while ((found = G_FindByClassNameFast(found,  "laserTrap")) != NULL)
;1366:	{//loop through all ents and blow the crap out of them!
line 1367
;1367:		if (found->parent == ent)
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $490
line 1368
;1368:		{
line 1369
;1369:			VectorCopy(found->r.currentOrigin, found->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1370
;1370:			found->think = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1371
;1371:			found->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1373
;1372:			//	G_Sound( found, CHAN_BODY, G_SoundIndex("sound/weapons/detpack/warning.wav") );
;1373:		}
LABELV $490
line 1374
;1374:	}
LABELV $487
line 1365
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $489
ARGP4
ADDRLP4 4
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $486
line 1375
;1375:}
LABELV $485
endproc RemoveLaserTraps 8 8
export DeletePlayerProjectiles
proc DeletePlayerProjectiles 8 4
line 1377
;1376:
;1377:void DeletePlayerProjectiles(gentity_t* ent) {
line 1379
;1378:	int i;
;1379:	for (i = MAX_CLIENTS; i < MAX_GENTITIES; i++) { //can be optimized more?
ADDRLP4 0
CNSTI4 32
ASGNI4
LABELV $494
line 1380
;1380:		if (g_entities[i].inuse && g_entities[i].s.eType == ET_MISSILE && (g_entities[i].r.ownerNum == ent->s.number)) { //Delete (rocket) if its ours
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $498
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $498
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+296+100
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $498
line 1381
;1381:			G_FreeEntity(&g_entities[i]);
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1383
;1382:			//trap->Print("This only sometimes prints.. even if we have a missile in the air.  (its num: %i, our num: %i, weap type: %i) \n", hit->r.ownerNum, ent->s.number, hit->s.weapon);
;1383:		}
LABELV $498
line 1384
;1384:	}
LABELV $495
line 1379
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $494
line 1385
;1385:}
LABELV $493
endproc DeletePlayerProjectiles 8 4
export prox_mine_think
proc prox_mine_think 32 20
line 1390
;1386:
;1387://---------------------------------------------------------
;1388:void prox_mine_think( gentity_t *ent )
;1389://---------------------------------------------------------
;1390:{
line 1392
;1391:	int			count, i;
;1392:	qboolean	blow = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1395
;1393:
;1394:	// if it isn't time to auto-explode, do a small proximity check
;1395:	if ( ent->delay > level.time )
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $505
line 1396
;1396:	{
line 1397
;1397:		count = G_RadiusList( ent->r.currentOrigin, FLECHETTE_MINE_RADIUS_CHECK, ent, qtrue, ent_list );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTF4 1132462080
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ent_list
ARGP4
ADDRLP4 16
ADDRGP4 G_RadiusList
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 1399
;1398:
;1399:		for ( i = 0; i < count; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $511
JUMPV
LABELV $508
line 1400
;1400:		{
line 1401
;1401:			if ( ent_list[i]->client && ent_list[i]->health > 0 && ent->activator && ent_list[i]->s.number != ent->activator->s.number )
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ent_list
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $512
ADDRLP4 20
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
LEI4 $512
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $512
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 28
INDIRP4
INDIRI4
EQI4 $512
line 1402
;1402:			{
line 1403
;1403:				blow = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1404
;1404:				break;
ADDRGP4 $506
JUMPV
LABELV $512
line 1406
;1405:			}
;1406:		}
LABELV $509
line 1399
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $511
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $508
line 1407
;1407:	}
ADDRGP4 $506
JUMPV
LABELV $505
line 1409
;1408:	else
;1409:	{
line 1411
;1410:		// well, we must die now
;1411:		blow = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1412
;1412:	}
LABELV $506
line 1414
;1413:
;1414:	if ( blow )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $514
line 1415
;1415:	{
line 1417
;1416:		//G_Sound( ent, G_SoundIndex( "sound/weapons/flechette/warning.wav" ));
;1417:		ent->think = laserTrapExplode;//thinkF_WP_Explode;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 1418
;1418:		ent->nextthink = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1419
;1419:	}
ADDRGP4 $515
JUMPV
LABELV $514
line 1421
;1420:	else
;1421:	{
line 1423
;1422:		// we probably don't need to do this thinking logic very often...maybe this is fast enough?
;1423:		ent->nextthink = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1424
;1424:	}
LABELV $515
line 1425
;1425:}
LABELV $504
endproc prox_mine_think 32 20
proc WP_TraceSetStart 1132 28
line 1430
;1426:
;1427://-----------------------------------------------------------------------------
;1428:static void WP_TraceSetStart( gentity_t *ent, vec3_t start, vec3_t mins, vec3_t maxs )
;1429://-----------------------------------------------------------------------------
;1430:{
line 1436
;1431:	//make sure our start point isn't on the other side of a wall
;1432:	trace_t	tr;
;1433:	vec3_t	entMins;
;1434:	vec3_t	entMaxs;
;1435:
;1436:	VectorAdd( ent->r.currentOrigin, ent->r.mins, entMins );
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
ADDRLP4 1104
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1104
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1104
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1104
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080+8
ADDRLP4 1108
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1108
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1437
;1437:	VectorAdd( ent->r.currentOrigin, ent->r.maxs, entMaxs );
ADDRLP4 1112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
ADDRLP4 1112
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1112
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1112
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1112
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092+8
ADDRLP4 1116
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1116
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1439
;1438:
;1439:	if ( G_BoxInBounds( start, mins, maxs, entMins, entMaxs ) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1120
ADDRGP4 G_BoxInBounds
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
EQI4 $523
line 1440
;1440:	{
line 1441
;1441:		return;
ADDRGP4 $518
JUMPV
LABELV $523
line 1444
;1442:	}
;1443:
;1444:	if ( !ent->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $525
line 1445
;1445:	{
line 1446
;1446:		return;
ADDRGP4 $518
JUMPV
LABELV $525
line 1449
;1447:	}
;1448:
;1449:	JP_Trace( &tr, ent->client->ps.origin, mins, maxs, start, ent->s.number, MASK_SOLID|CONTENTS_SHOTCLIP );
ADDRLP4 0
ARGP4
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
INDIRI4
ARGI4
CNSTI4 129
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1451
;1450:
;1451:	if ( tr.startsolid || tr.allsolid )
ADDRLP4 1128
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1128
INDIRI4
NEI4 $530
ADDRLP4 0
INDIRI4
ADDRLP4 1128
INDIRI4
EQI4 $527
LABELV $530
line 1452
;1452:	{
line 1453
;1453:		return;
ADDRGP4 $518
JUMPV
LABELV $527
line 1456
;1454:	}
;1455:
;1456:	if ( tr.fraction < 1.0f )
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $531
line 1457
;1457:	{
line 1458
;1458:		VectorCopy( tr.endpos, start );
ADDRFP4 4
INDIRP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1459
;1459:	}
LABELV $531
line 1460
;1460:}
LABELV $518
endproc WP_TraceSetStart 1132 28
export WP_ExplosiveDie
proc WP_ExplosiveDie 0 4
line 1463
;1461:
;1462:void WP_ExplosiveDie(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;1463:{
line 1464
;1464:	laserTrapExplode(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 laserTrapExplode
CALLV
pop
line 1465
;1465:}
LABELV $535
endproc WP_ExplosiveDie 0 4
export WP_flechette_alt_blow
proc WP_flechette_alt_blow 0 4
line 1470
;1466:
;1467://----------------------------------------------
;1468:void WP_flechette_alt_blow( gentity_t *ent )
;1469://----------------------------------------------
;1470:{
line 1477
;1471:	/*BG_EvaluateTrajectory( &ent->s.pos, level.time, ent->r.currentOrigin ); // Not sure if this is even necessary, but correct origins are cool?
;1472:
;1473:	G_RadiusDamage( ent->r.currentOrigin, &g_entities[ent->r.ownerNum], ent->splashDamage, ent->splashRadius, NULL, MOD_FLECHETTE_ALT_SPLASH );
;1474:	G_PlayEffect( "flechette/alt_blow", ent->currentOrigin );
;1475:	G_FreeEntity( ent );*/
;1476:
;1477:	ent->s.pos.trDelta[0] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1065353216
ASGNF4
line 1478
;1478:	ent->s.pos.trDelta[1] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 1479
;1479:	ent->s.pos.trDelta[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 0
ASGNF4
line 1481
;1480:
;1481:	laserTrapExplode(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 laserTrapExplode
CALLV
pop
line 1482
;1482:}
LABELV $536
endproc WP_flechette_alt_blow 0 4
proc WP_CreateFlechetteBouncyThing 20 24
line 1487
;1483:
;1484://------------------------------------------------------------------------------
;1485:static void WP_CreateFlechetteBouncyThing( vec3_t start, vec3_t fwd, gentity_t *self )
;1486://------------------------------------------------------------------------------
;1487:{
line 1488
;1488:	gentity_t	*missile = CreateMissile( start, fwd, 700 + random() * 700, 1500 + random() * 2000, self, qtrue );
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTF4 1143930880
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1143930880
ADDF4
ARGF4
CNSTF4 1157234688
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1153138688
ADDF4
CVFI4 4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1490
;1489:	
;1490:	missile->think = WP_flechette_alt_blow;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 WP_flechette_alt_blow
ASGNP4
line 1493
;1491:
;1492:	//missile->activator = self;
;1493:	G_SetActivator(missile, self);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 1495
;1494:
;1495:	missile->s.weapon = WP_FLECHETTE;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 9
ASGNI4
line 1496
;1496:	G_SetClassName(missile, "flech_alt");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $538
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 1497
;1497:	missile->mass = 4;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTF4 1082130432
ASGNF4
line 1500
;1498:
;1499:	// How 'bout we give this thing a size...
;1500:	VectorSet( missile->r.mins, -3.0f, -3.0f, -3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3225419776
ASGNF4
line 1501
;1501:	VectorSet( missile->r.maxs, 3.0f, 3.0f, 3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 1502
;1502:	missile->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 769
ASGNI4
line 1504
;1503:
;1504:	missile->touch = touch_NULL;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 touch_NULL
ASGNP4
line 1507
;1505:
;1506:	// normal ones bounce, alt ones explode on impact
;1507:	missile->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1509
;1508:
;1509:	missile->s.eFlags |= (EF_BOUNCE_HALF|EF_ALT_FIRING);
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 544
BORI4
ASGNI4
line 1511
;1510:
;1511:	missile->bounceCount = 50;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 50
ASGNI4
line 1513
;1512:
;1513:	missile->damage = FLECHETTE_ALT_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 60
ASGNI4
line 1514
;1514:	missile->dflags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 0
ASGNI4
line 1515
;1515:	missile->splashDamage = FLECHETTE_ALT_SPLASH_DAM;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 60
ASGNI4
line 1516
;1516:	missile->splashRadius = FLECHETTE_ALT_SPLASH_RAD;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 128
ASGNI4
line 1518
;1517:
;1518:	missile->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 1520
;1519:
;1520:	missile->methodOfDeath = MOD_FLECHETTE_ALT_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 17
ASGNI4
line 1521
;1521:	missile->splashMethodOfDeath = MOD_FLECHETTE_ALT_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 17
ASGNI4
line 1524
;1522:	//missile->splashMethodOfDeath = MOD_UNKNOWN;//MOD_THERMAL_SPLASH;
;1523:
;1524:	VectorCopy( start, missile->pos2 );
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1525
;1525:}
LABELV $537
endproc WP_CreateFlechetteBouncyThing 20 24
proc WP_FlechetteAltFire 72 16
line 1530
;1526:
;1527://---------------------------------------------------------
;1528:static void WP_FlechetteAltFire( gentity_t *self )
;1529://---------------------------------------------------------
;1530:{
line 1534
;1531:	vec3_t 	dir, fwd, start, angs;
;1532:	int i;
;1533:
;1534:	vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1535
;1535:	VectorCopy( muzzle, start );
ADDRLP4 28
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 1537
;1536:
;1537:	WP_TraceSetStart( self, start, vec3_origin, vec3_origin );//make sure our start point isn't on the other side of a wall
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 52
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 WP_TraceSetStart
CALLV
pop
line 1539
;1538:
;1539:	for ( i = 0; i < FLECHETTE_ALT_SHOTS; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $540
line 1540
;1540:	{
line 1541
;1541:		VectorCopy( angs, dir );
ADDRLP4 0
ADDRLP4 40
INDIRB
ASGNB 12
line 1543
;1542:
;1543:		dir[PITCH] -= random() * 4 + 8; // make it fly upwards
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
CNSTF4 1090519040
ADDF4
SUBF4
ASGNF4
line 1544
;1544:		dir[YAW] += crandom() * 2;
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 64
CNSTF4 1073741824
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 64
INDIRF4
ADDRLP4 64
INDIRF4
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 1545
;1545:		AngleVectors( dir, fwd, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 68
CNSTP4 0
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1547
;1546:
;1547:		WP_CreateFlechetteBouncyThing( start, fwd, self );
ADDRLP4 28
ARGP4
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_CreateFlechetteBouncyThing
CALLV
pop
line 1548
;1548:	}
LABELV $541
line 1539
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
LTI4 $540
line 1549
;1549:}
LABELV $539
endproc WP_FlechetteAltFire 72 16
proc WP_FireFlechette 0 4
line 1554
;1550:
;1551://---------------------------------------------------------
;1552:static void WP_FireFlechette( gentity_t *ent, qboolean altFire )
;1553://---------------------------------------------------------
;1554:{
line 1555
;1555:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $546
line 1556
;1556:	{
line 1558
;1557:		//WP_FlechetteProxMine( ent );
;1558:		WP_FlechetteAltFire(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_FlechetteAltFire
CALLV
pop
line 1559
;1559:	}
ADDRGP4 $547
JUMPV
LABELV $546
line 1561
;1560:	else
;1561:	{
line 1562
;1562:		WP_FlechetteMainFire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_FlechetteMainFire
CALLV
pop
line 1563
;1563:	}
LABELV $547
line 1564
;1564:}
LABELV $545
endproc WP_FireFlechette 0 4
lit
align 4
LABELV $549
byte 4 0
byte 4 0
byte 4 1065353216
export rocketThink
code
proc rocketThink 124 12
line 1579
;1565:
;1566:
;1567:
;1568:/*
;1569:======================================================================
;1570:
;1571:ROCKET LAUNCHER
;1572:
;1573:======================================================================
;1574:*/
;1575:
;1576://---------------------------------------------------------
;1577:void rocketThink( gentity_t *ent )
;1578://---------------------------------------------------------
;1579:{
line 1581
;1580:	vec3_t newdir, targetdir, 
;1581:			up={0,0,1}, right; 
ADDRLP4 56
ADDRGP4 $549
INDIRB
ASGNB 12
line 1585
;1582:	vec3_t	org;
;1583:	float dot, dot2, dis;
;1584:	int i;
;1585:	float vel = ROCKET_VELOCITY;
ADDRLP4 40
CNSTF4 1147207680
ASGNF4
line 1587
;1586:
;1587:	if (!ent->enemy || !ent->enemy->client || ent->enemy->health < 1)
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 744
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
EQU4 $553
ADDRLP4 80
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 84
INDIRU4
EQU4 $553
ADDRLP4 80
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $550
LABELV $553
line 1588
;1588:	{
line 1589
;1589:		ent->nextthink = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1590
;1590:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1591
;1591:		return;
ADDRGP4 $548
JUMPV
LABELV $550
line 1594
;1592:	}
;1593:
;1594:	if ( ent->enemy && ent->enemy->inuse )
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $555
ADDRLP4 88
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $555
line 1595
;1595:	{	
line 1596
;1596:		VectorCopy( ent->enemy->r.currentOrigin, org );
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1597
;1597:		org[2] += (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5f;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1056964608
ADDRLP4 92
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1599
;1598:
;1599:		VectorSubtract( org, ent->r.currentOrigin, targetdir );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 28+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1600
;1600:		VectorNormalize( targetdir );
ADDRLP4 16
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1603
;1601:
;1602:		// Now the rocket can't do a 180 in space, so we'll limit the turn to about 45 degrees.
;1603:		dot = DotProduct( targetdir, ent->movedir );
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 16
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1606
;1604:
;1605:		// a dot of 1.0 means right-on-target.
;1606:		if ( dot < 0.0f )
ADDRLP4 68
INDIRF4
CNSTF4 0
GEF4 $564
line 1607
;1607:		{	
line 1609
;1608:			// Go in the direction opposite, start a 180.
;1609:			CrossProduct( ent->movedir, up, right );
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 1610
;1610:			dot2 = DotProduct( targetdir, right );
ADDRLP4 76
ADDRLP4 16
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 44+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1612
;1611:
;1612:			if ( dot2 > 0 )
ADDRLP4 76
INDIRF4
CNSTF4 0
LEF4 $570
line 1613
;1613:			{	
line 1615
;1614:				// Turn 45 degrees right.
;1615:				VectorMA( ent->movedir, 0.4f, right, newdir );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTF4 1053609165
ASGNF4
ADDRLP4 4
ADDRLP4 104
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
CNSTF4 1053609165
ADDRLP4 44+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1616
;1616:			}
ADDRGP4 $571
JUMPV
LABELV $570
line 1618
;1617:			else
;1618:			{	
line 1620
;1619:				// Turn 45 degrees left.
;1620:				VectorMA(ent->movedir, -0.4f, right, newdir);
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTF4 3201092813
ASGNF4
ADDRLP4 4
ADDRLP4 104
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 44+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
CNSTF4 3201092813
ADDRLP4 44+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1621
;1621:			}
LABELV $571
line 1624
;1622:
;1623:			// Yeah we've adjusted horizontally, but let's split the difference vertically, so we kinda try to move towards it.
;1624:			newdir[2] = ( targetdir[2] + ent->movedir[2] ) * 0.5;
ADDRLP4 4+8
CNSTF4 1056964608
ADDRLP4 16+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDF4
MULF4
ASGNF4
line 1627
;1625:
;1626:			// let's also slow down a lot
;1627:			vel *= 0.5f;
ADDRLP4 40
CNSTF4 1056964608
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 1628
;1628:		}
ADDRGP4 $565
JUMPV
LABELV $564
line 1629
;1629:		else if ( dot < 0.70f )
ADDRLP4 68
INDIRF4
CNSTF4 1060320051
GEF4 $582
line 1630
;1630:		{	
line 1632
;1631:			// Still a bit off, so we turn a bit softer
;1632:			VectorMA( ent->movedir, 0.5f, targetdir, newdir );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
ADDRLP4 104
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1633
;1633:		}
ADDRGP4 $583
JUMPV
LABELV $582
line 1635
;1634:		else
;1635:		{	
line 1637
;1636:			// getting close, so turn a bit harder
;1637:			VectorMA( ent->movedir, 0.9f, targetdir, newdir );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTF4 1063675494
ASGNF4
ADDRLP4 4
ADDRLP4 104
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
CNSTF4 1063675494
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1638
;1638:		}
LABELV $583
LABELV $565
line 1641
;1639:
;1640:		// add crazy drunkenness
;1641:		for (i = 0; i < 3; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $592
line 1642
;1642:		{
line 1643
;1643:			newdir[i] += crandom() * ent->random * 0.25f;
ADDRLP4 104
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
CNSTF4 1048576000
CNSTF4 1073741824
ADDRLP4 104
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 1644
;1644:		}
LABELV $593
line 1641
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $592
line 1647
;1645:
;1646:		// decay the randomness
;1647:		ent->random *= 0.9f;
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTF4 1063675494
ADDRLP4 104
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1650
;1648:
;1649:		// Try to crash into the ground if we get close enough to do splash damage
;1650:		dis = Distance( ent->r.currentOrigin, org );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 108
ADDRGP4 Distance
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 108
INDIRF4
ASGNF4
line 1652
;1651:
;1652:		if ( dis < 128 )
ADDRLP4 72
INDIRF4
CNSTF4 1124073472
GEF4 $596
line 1653
;1653:		{
line 1655
;1654:			// the closer we get, the more we push the rocket down, heh heh.
;1655:			newdir[2] -= (1.0f - (dis / 128.0f)) * 0.6f;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1058642330
CNSTF4 1065353216
ADDRLP4 72
INDIRF4
CNSTF4 1124073472
DIVF4
SUBF4
MULF4
SUBF4
ASGNF4
line 1656
;1656:		}
LABELV $596
line 1658
;1657:
;1658:		VectorNormalize( newdir );
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1660
;1659:
;1660:		VectorScale( newdir, vel * 0.5f, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
ADDRLP4 40
INDIRF4
MULF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4+4
INDIRF4
CNSTF4 1056964608
ADDRLP4 40
INDIRF4
MULF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4+8
INDIRF4
CNSTF4 1056964608
ADDRLP4 40
INDIRF4
MULF4
MULF4
ASGNF4
line 1661
;1661:		VectorCopy( newdir, ent->movedir );
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1662
;1662:		SnapVector( ent->s.pos.trDelta );			// save net bandwidth
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1663
;1663:		VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1664
;1664:		ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1665
;1665:	}
LABELV $555
line 1667
;1666:
;1667:	ent->nextthink = level.time + ROCKET_ALT_THINK_TIME;	// Nothing at all spectacular happened, continue.
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1668
;1668:	return;
LABELV $548
endproc rocketThink 124 12
proc WP_FireRocket 40 24
line 1674
;1669:}
;1670:
;1671://---------------------------------------------------------
;1672:static void WP_FireRocket( gentity_t *ent, qboolean altFire )
;1673://---------------------------------------------------------
;1674:{
line 1675
;1675:	int	damage	= ROCKET_DAMAGE;
ADDRLP4 16
CNSTI4 100
ASGNI4
line 1676
;1676:	int	vel = ROCKET_VELOCITY;
ADDRLP4 8
CNSTI4 900
ASGNI4
line 1677
;1677:	int dif = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1681
;1678:	float rTime;
;1679:	gentity_t *missile;
;1680:
;1681:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $604
line 1682
;1682:	{
line 1683
;1683:		vel *= 0.5f;
ADDRLP4 8
CNSTF4 1056964608
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1684
;1684:	}
LABELV $604
line 1686
;1685:
;1686:	missile = CreateMissile( muzzle, forward, vel, 10000, ent, altFire );
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTI4 10000
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 CreateMissile
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1688
;1687:
;1688:	if (ent->client && ent->client->ps.rocketLockIndex != MAX_CLIENTS)
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
EQU4 $606
ADDRLP4 24
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
CNSTI4 32
EQI4 $606
line 1689
;1689:	{
line 1690
;1690:		rTime = ent->client->ps.rocketLockTime;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 588
ADDP4
INDIRF4
ASGNF4
line 1692
;1691:
;1692:		if (rTime == -1)
ADDRLP4 12
INDIRF4
CNSTF4 3212836864
NEF4 $608
line 1693
;1693:		{
line 1694
;1694:			rTime = ent->client->ps.rocketLastValidTime;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 584
ADDP4
INDIRF4
ASGNF4
line 1695
;1695:		}
LABELV $608
line 1696
;1696:		dif = ( level.time - rTime ) / ( 1200.0f / 16.0f );
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
SUBF4
CNSTF4 1117126656
DIVF4
CVFI4 4
ASGNI4
line 1698
;1697:
;1698:		if (dif < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $611
line 1699
;1699:		{
line 1700
;1700:			dif = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1701
;1701:		}
LABELV $611
line 1704
;1702:
;1703:		//It's 10 even though it locks client-side at 8, because we want them to have a sturdy lock first, and because there's a slight difference in time between server and client
;1704:		if ( dif >= 10/* || random() * dif > 2 || random() > 0.97f*/ && rTime != -1 )
ADDRLP4 4
INDIRI4
CNSTI4 10
LTI4 $613
ADDRLP4 12
INDIRF4
CNSTF4 3212836864
EQF4 $613
line 1705
;1705:		{
line 1706
;1706:			missile->enemy = &g_entities[ent->client->ps.rocketLockIndex];
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1708
;1707:
;1708:			if (missile->enemy && missile->enemy->client && missile->enemy->health > 0 && !OnSameTeam(ent, missile->enemy))
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
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
EQU4 $615
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $615
ADDRLP4 28
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
LEI4 $615
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $615
line 1709
;1709:			{ //if enemy became invalid, died, or is on the same team, then don't seek it
line 1710
;1710:				missile->think = rocketThink;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 rocketThink
ASGNP4
line 1711
;1711:				missile->nextthink = level.time + ROCKET_ALT_THINK_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1712
;1712:			}
LABELV $615
line 1713
;1713:		}
LABELV $613
line 1715
;1714:
;1715:		ent->client->ps.rocketLockIndex = MAX_CLIENTS;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 32
ASGNI4
line 1716
;1716:		ent->client->ps.rocketLockTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 1717
;1717:		ent->client->ps.rocketTargetTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 592
ADDP4
CNSTF4 0
ASGNF4
line 1718
;1718:	}
LABELV $606
line 1720
;1719:
;1720:	G_SetClassName(missile, "rocket_proj");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $618
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 1721
;1721:	missile->s.weapon = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 10
ASGNI4
line 1727
;1722:
;1723:	// NOTENOTE No mass yet.
;1724://	missile->mass = 10;
;1725:
;1726:	// Make it easier to hit things
;1727:	VectorSet( missile->r.maxs, ROCKET_SIZE, ROCKET_SIZE, ROCKET_SIZE );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 1728
;1728:	VectorScale( missile->r.maxs, -1, missile->r.mins );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 1730
;1729:
;1730:	missile->damage = damage;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1731
;1731:	missile->dflags = DAMAGE_DEATH_KNOCKBACK;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 128
ASGNI4
line 1732
;1732:	if (altFire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $619
line 1733
;1733:	{
line 1734
;1734:		missile->methodOfDeath = MOD_ROCKET_HOMING;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 20
ASGNI4
line 1735
;1735:		missile->splashMethodOfDeath = MOD_ROCKET_HOMING_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 21
ASGNI4
line 1736
;1736:	}
ADDRGP4 $620
JUMPV
LABELV $619
line 1738
;1737:	else
;1738:	{
line 1739
;1739:		missile->methodOfDeath = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 18
ASGNI4
line 1740
;1740:		missile->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 19
ASGNI4
line 1741
;1741:	}
LABELV $620
line 1744
;1742:	
;1743:	//rww - We don't want rockets to be deflected, do we?
;1744:	missile->clipmask = MASK_SHOT;// | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 769
ASGNI4
line 1745
;1745:	missile->splashDamage = ROCKET_SPLASH_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 100
ASGNI4
line 1746
;1746:	missile->splashRadius = ROCKET_SPLASH_RADIUS;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 160
ASGNI4
line 1749
;1747:
;1748:	// we don't want it to ever bounce
;1749:	missile->bounceCount = 0;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 0
ASGNI4
line 1750
;1750:}
LABELV $603
endproc WP_FireRocket 40 24
lit
align 4
LABELV $627
byte 4 0
byte 4 0
byte 4 1065353216
export thermalDetonatorExplode
code
proc thermalDetonatorExplode 40 24
line 1780
;1751:
;1752:/*
;1753:======================================================================
;1754:
;1755:THERMAL DETONATOR
;1756:
;1757:======================================================================
;1758:*/
;1759:
;1760:#define TD_DAMAGE			70 //only do 70 on a direct impact
;1761:#define TD_SPLASH_RAD		128
;1762:#define TD_SPLASH_DAM		90
;1763:#define TD_VELOCITY			900
;1764:#define TD_MIN_CHARGE		0.15f
;1765:#define TD_TIME				3000//6000
;1766:#define TD_ALT_TIME			3000
;1767:
;1768:#define TD_ALT_DAMAGE		60//100
;1769:#define TD_ALT_SPLASH_RAD	128
;1770:#define TD_ALT_SPLASH_DAM	50//90
;1771:#define TD_ALT_VELOCITY		600
;1772:#define TD_ALT_MIN_CHARGE	0.15f
;1773:#define TD_ALT_TIME			3000
;1774:
;1775:void thermalThinkStandard(gentity_t *ent);
;1776:
;1777://---------------------------------------------------------
;1778:void thermalDetonatorExplode( gentity_t *ent )
;1779://---------------------------------------------------------
;1780:{
line 1781
;1781:	if ( !ent->count )
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
NEI4 $622
line 1782
;1782:	{
line 1783
;1783:		G_Sound( ent, CHAN_VOICE, G_SoundIndex( "sound/weapons/thermal/warning.wav" ) );
ADDRGP4 $624
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1784
;1784:		ent->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 1
ASGNI4
line 1785
;1785:		ent->bolt_Head = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1786
;1786:		ent->think = thermalThinkStandard;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 thermalThinkStandard
ASGNP4
line 1787
;1787:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1788
;1788:		ent->r.svFlags |= SVF_BROADCAST;//so everyone hears/sees the explosion?
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1789
;1789:	}
ADDRGP4 $623
JUMPV
LABELV $622
line 1791
;1790:	else
;1791:	{
line 1793
;1792:		vec3_t	origin;
;1793:		vec3_t	dir={0,0,1};
ADDRLP4 12
ADDRGP4 $627
INDIRB
ASGNB 12
line 1795
;1794:
;1795:		BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1796
;1796:		origin[2] += 8;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1797
;1797:		SnapVector( origin );
ADDRLP4 0
ADDRLP4 0
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1798
;1798:		G_SetOrigin( ent, origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1801
;1799:
;1800://		VectorSet( pos, ent->r.currentOrigin[0], ent->r.currentOrigin[1], ent->r.currentOrigin[2] + 8 );
;1801:		ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1802
;1802:		G_AddEvent( ent, EV_MISSILE_MISS, DirToByte( dir ) );
ADDRLP4 12
ARGP4
ADDRLP4 24
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 74
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1803
;1803:		ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 1
ASGNI4
line 1805
;1804:
;1805:		if (G_RadiusDamage( ent->r.currentOrigin, ent->parent,  ent->splashDamage, ent->splashRadius, 
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $634
line 1807
;1806:				ent, ent->splashMethodOfDeath))
;1807:		{
line 1808
;1808:			g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 36
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43668
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
line 1809
;1809:		}
LABELV $634
line 1811
;1810:
;1811:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1812
;1812:	}
LABELV $623
line 1813
;1813:}
LABELV $621
endproc thermalDetonatorExplode 40 24
export thermalThinkStandard
proc thermalThinkStandard 0 4
line 1816
;1814:
;1815:void thermalThinkStandard(gentity_t *ent)
;1816:{
line 1817
;1817:	if (ent->bolt_Head < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $638
line 1818
;1818:	{
line 1819
;1819:		ent->think = thermalDetonatorExplode;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 thermalDetonatorExplode
ASGNP4
line 1820
;1820:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1821
;1821:		return;
ADDRGP4 $637
JUMPV
LABELV $638
line 1824
;1822:	}
;1823:
;1824:	G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 1825
;1825:	ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1826
;1826:}
LABELV $637
endproc thermalThinkStandard 0 4
export WP_FireThermalDetonator
proc WP_FireThermalDetonator 72 16
line 1831
;1827:
;1828://---------------------------------------------------------
;1829:gentity_t *WP_FireThermalDetonator( gentity_t *ent, qboolean altFire )
;1830://---------------------------------------------------------
;1831:{
line 1834
;1832:	gentity_t	*bolt;
;1833:	vec3_t		dir, start;
;1834:	float chargeAmount = 1.0f; // default of full charge
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1835
;1835:	int nowTime = LEVELTIME(ent->client);
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $648
ADDRLP4 44
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $648
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $650
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $651
JUMPV
LABELV $650
ADDRLP4 40
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $651
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
ADDRGP4 $649
JUMPV
LABELV $648
ADDRLP4 36
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $649
ADDRLP4 32
ADDRLP4 36
INDIRI4
ASGNI4
line 1837
;1836:	
;1837:	VectorCopy( forward, dir );
ADDRLP4 20
ADDRGP4 forward
INDIRB
ASGNB 12
line 1838
;1838:	VectorCopy( muzzle, start );
ADDRLP4 8
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 1840
;1839:
;1840:	bolt = G_Spawn();
ADDRLP4 48
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
ASGNP4
line 1842
;1841:	
;1842:	bolt->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 1844
;1843:
;1844:	G_SetClassName(bolt, "thermal_detonator");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $652
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 1845
;1845:	bolt->think = thermalThinkStandard;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 thermalThinkStandard
ASGNP4
line 1846
;1846:	bolt->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1847
;1847:	bolt->touch = touch_NULL;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 touch_NULL
ASGNP4
line 1851
;1848://	bolt->mass = 10;		// NOTENOTE No mass implementation yet
;1849:
;1850:	// How 'bout we give this thing a size...
;1851:	VectorSet( bolt->r.mins, -3.0f, -3.0f, -3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3225419776
ASGNF4
line 1852
;1852:	VectorSet( bolt->r.maxs, 3.0f, 3.0f, 3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 1853
;1853:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 769
ASGNI4
line 1855
;1854:
;1855:	W_TraceSetStart( ent, start, bolt->r.mins, bolt->r.maxs );//make sure our start point isn't on the other side of a wall
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRGP4 W_TraceSetStart
CALLV
pop
line 1857
;1856:
;1857:	if ( ent->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $654
line 1858
;1858:	{
line 1859
;1859:		chargeAmount = nowTime - ent->client->ps.weaponChargeTime;
ADDRLP4 4
ADDRLP4 32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 1860
;1860:	}
LABELV $654
line 1863
;1861:
;1862:	// get charge amount
;1863:	chargeAmount = chargeAmount / (float)TD_VELOCITY;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1147207680
DIVF4
ASGNF4
line 1865
;1864:
;1865:	if ( chargeAmount > 1.0f )
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
LEF4 $656
line 1866
;1866:	{
line 1867
;1867:		chargeAmount = 1.0f;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1868
;1868:	}
ADDRGP4 $657
JUMPV
LABELV $656
line 1869
;1869:	else if ( chargeAmount < TD_MIN_CHARGE )
ADDRLP4 4
INDIRF4
CNSTF4 1041865114
GEF4 $658
line 1870
;1870:	{
line 1871
;1871:		chargeAmount = TD_MIN_CHARGE;
ADDRLP4 4
CNSTF4 1041865114
ASGNF4
line 1872
;1872:	}
LABELV $658
LABELV $657
line 1875
;1873:
;1874:	// normal ones bounce, alt ones explode on impact
;1875:	bolt->bolt_Head = level.time + TD_TIME; // How long 'til she blows
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1876
;1876:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1877
;1877:	bolt->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1878
;1878:	bolt->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1879
;1879:	VectorScale( dir, TD_VELOCITY * chargeAmount, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20
INDIRF4
CNSTF4 1147207680
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 20+4
INDIRF4
CNSTF4 1147207680
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 20+8
INDIRF4
CNSTF4 1147207680
ADDRLP4 4
INDIRF4
MULF4
MULF4
ASGNF4
line 1881
;1880:
;1881:	if ( ent->health >= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
LTI4 $663
line 1882
;1882:	{
line 1883
;1883:		bolt->s.pos.trDelta[2] += 120;
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1884
;1884:	}
LABELV $663
line 1886
;1885:
;1886:	if ( !altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $665
line 1887
;1887:	{
line 1889
;1888:		//bolt->alt_fire = qtrue;
;1889:		bolt->s.eFlags |= EF_BOUNCE_HALF;
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
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1890
;1890:	}
LABELV $665
line 1892
;1891:
;1892:	bolt->s.loopSound = G_SoundIndex( "sound/weapons/thermal/thermloop.wav" );
ADDRGP4 $667
ARGP4
ADDRLP4 56
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 1894
;1893:
;1894:	bolt->damage = TD_DAMAGE;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 70
ASGNI4
line 1895
;1895:	bolt->dflags = 0;
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 0
ASGNI4
line 1896
;1896:	bolt->splashDamage = TD_SPLASH_DAM;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 90
ASGNI4
line 1897
;1897:	bolt->splashRadius = TD_SPLASH_RAD;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 128
ASGNI4
line 1904
;1898:	//if (ent->client->sess.raceMode) {
;1899:	//	bolt->damage = 140;
;1900:	//	bolt->splashDamage = 140;
;1901:	//	bolt->splashRadius = 192;
;1902:	//}
;1903:
;1904:	bolt->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1905
;1905:	bolt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 1906
;1906:	bolt->s.weapon = WP_THERMAL;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 11
ASGNI4
line 1908
;1907:
;1908:	bolt->methodOfDeath = MOD_THERMAL;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 22
ASGNI4
line 1909
;1909:	bolt->splashMethodOfDeath = MOD_THERMAL_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 23
ASGNI4
line 1911
;1910:
;1911:	bolt->s.pos.trTime = level.time;		// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1912
;1912:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 1914
;1913:	
;1914:	SnapVector( bolt->s.pos.trDelta );			// save net bandwidth
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 64
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1915
;1915:	VectorCopy (start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 1917
;1916:
;1917:	VectorCopy( start, bolt->pos2 );
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 1919
;1918:
;1919:	bolt->bounceCount = -5;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -5
ASGNI4
line 1921
;1920:
;1921:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $643
endproc WP_FireThermalDetonator 72 16
export WP_DropThermal
proc WP_DropThermal 4 16
line 1925
;1922:}
;1923:
;1924:gentity_t *WP_DropThermal( gentity_t *ent )
;1925:{
line 1926
;1926:	AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1927
;1927:	return (WP_FireThermalDetonator( ent, qfalse ));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 WP_FireThermalDetonator
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $669
endproc WP_DropThermal 4 16
export laserTrapExplode
proc laserTrapExplode 16 24
line 1948
;1928:}
;1929:
;1930:
;1931:/*
;1932:======================================================================
;1933:
;1934:LASER TRAP / TRIP MINE
;1935:
;1936:======================================================================
;1937:*/
;1938:#define LT_DAMAGE			100
;1939:#define LT_SPLASH_RAD		256.0f
;1940:#define LT_SPLASH_DAM		105
;1941:#define LT_VELOCITY			900.0f
;1942:#define LT_SIZE				1.5f
;1943:#define LT_ALT_TIME			2000
;1944:#define	LT_ACTIVATION_DELAY	1000
;1945:#define	LT_DELAY_TIME		50
;1946:
;1947:void laserTrapExplode( gentity_t *self )
;1948:{
line 1951
;1949:	vec3_t v;
;1950:	//FIXME: damage some along line?
;1951:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 1953
;1952:
;1953:	if (self->activator)
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $671
line 1954
;1954:	{
line 1955
;1955:		G_RadiusDamage( self->r.currentOrigin, self->activator, self->splashDamage, self->splashRadius, self, MOD_TRIP_MINE_SPLASH/*MOD_LT_SPLASH*/ );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 24
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 1956
;1956:	}
LABELV $671
line 1959
;1957:	//FIXME: clear me from owner's list of tripmines?
;1958:
;1959:	if (self->s.weapon != WP_FLECHETTE)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 9
EQI4 $673
line 1960
;1960:	{
line 1961
;1961:		G_AddEvent( self, EV_MISSILE_MISS, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 74
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1962
;1962:	}
LABELV $673
line 1964
;1963:
;1964:	VectorCopy(self->s.pos.trDelta, v);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1967
;1965:	//Explode outward from the surface
;1966:
;1967:	if (self->s.time == -2)
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $675
line 1968
;1968:	{
line 1969
;1969:		v[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1970
;1970:		v[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1971
;1971:		v[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1972
;1972:	}
LABELV $675
line 1974
;1973:
;1974:	if (self->s.weapon == WP_FLECHETTE)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 9
NEI4 $679
line 1975
;1975:	{
line 1976
;1976:		G_PlayEffect(EFFECT_EXPLOSION_FLECHETTE, self->r.currentOrigin, v);
CNSTI4 7
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 1977
;1977:	}
ADDRGP4 $680
JUMPV
LABELV $679
line 1979
;1978:	else
;1979:	{
line 1980
;1980:		G_PlayEffect(EFFECT_EXPLOSION_TRIPMINE, self->r.currentOrigin, v);
CNSTI4 5
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 1981
;1981:	}
LABELV $680
line 1983
;1982:
;1983:	self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1984
;1984:	self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1985
;1985:}
LABELV $670
endproc laserTrapExplode 16 24
export laserTrapDelayedExplode
proc laserTrapDelayedExplode 0 0
line 1988
;1986:
;1987:void laserTrapDelayedExplode( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath )
;1988:{
line 1989
;1989:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1990
;1990:	self->think = laserTrapExplode;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 1991
;1991:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1992
;1992:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 2002
;1993:	/*
;1994:	if ( attacker && !attacker->s.number )
;1995:	{
;1996:		//less damage when shot by player
;1997:		self->splashDamage /= 3;
;1998:		self->splashRadius /= 3;
;1999:		//FIXME: different effect?
;2000:	}
;2001:	*/
;2002:}
LABELV $682
endproc laserTrapDelayedExplode 0 0
export touchLaserTrap
proc touchLaserTrap 8 12
line 2005
;2003:
;2004:void touchLaserTrap( gentity_t *ent, gentity_t *other, trace_t *trace )
;2005:{
line 2008
;2006:	// if the guy that touches this grenade can take damage, he's about to.
;2007:	//if ( other->takedamage )
;2008:	if (other && other->s.number < 1022)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $685
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1022
GEI4 $685
line 2009
;2009:	{ //just explode if we hit any entity. This way we don't have things happening like tripmines floating
line 2011
;2010:	  //in the air after getting stuck to a moving door
;2011:		if ( ent->activator != other )
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $686
line 2012
;2012:		{
line 2013
;2013:			ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 2014
;2014:			ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2015
;2015:			ent->think = laserTrapExplode;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 2016
;2016:			VectorCopy(trace->plane.normal, ent->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2017
;2017:		}
line 2018
;2018:	}
ADDRGP4 $686
JUMPV
LABELV $685
line 2020
;2019:	else
;2020:	{
line 2021
;2021:		ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 2022
;2022:		if (trace->entityNum != ENTITYNUM_NONE)
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $690
line 2023
;2023:		{
line 2024
;2024:			ent->enemy = &g_entities[trace->entityNum];
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 2352
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2025
;2025:		}
LABELV $690
line 2026
;2026:		laserTrapStick(ent, trace->endpos, trace->plane.normal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 laserTrapStick
CALLV
pop
line 2027
;2027:	}
LABELV $686
line 2028
;2028:}
LABELV $684
endproc touchLaserTrap 8 12
export laserTrapThink
proc laserTrapThink 1116 28
line 2031
;2029:
;2030:void laserTrapThink ( gentity_t *ent )
;2031:{
line 2037
;2032:	gentity_t	*traceEnt;
;2033:	vec3_t		end;
;2034:	trace_t		tr;
;2035:
;2036:	//G_RunObject(ent);
;2037:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2040
;2038:
;2039:	//turn on the beam effect
;2040:	if ( !(ent->s.eFlags&EF_FIRING) )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $693
line 2041
;2041:	{//arm me
line 2042
;2042:		G_Sound( ent, CHAN_VOICE, G_SoundIndex( "sound/weapons/laser_trap/warning.wav" ) );
ADDRGP4 $695
ARGP4
ADDRLP4 1096
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2043
;2043:		ent->s.eFlags |= EF_FIRING;
ADDRLP4 1100
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 1100
INDIRP4
ADDRLP4 1100
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2044
;2044:	}
LABELV $693
line 2045
;2045:	ent->think = laserTrapThink;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 laserTrapThink
ASGNP4
line 2046
;2046:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2049
;2047:
;2048:	// Find the main impact point
;2049:	VectorMA ( ent->s.pos.trBase, 1024, ent->movedir, end );
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
CNSTF4 1149239296
ASGNF4
ADDRLP4 0
ADDRLP4 1096
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1100
INDIRF4
ADDRLP4 1096
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1096
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 1100
INDIRF4
ADDRLP4 1096
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 1104
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1149239296
ADDRLP4 1104
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2050
;2050:	JP_Trace ( &tr, ent->r.currentOrigin, NULL, NULL, end, ent->s.number, MASK_SHOT);
ADDRLP4 12
ARGP4
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1112
CNSTP4 0
ASGNP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1108
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2052
;2051:	
;2052:	traceEnt = &g_entities[ tr.entityNum ];
ADDRLP4 1092
CNSTI4 2352
ADDRLP4 12+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2054
;2053:
;2054:	ent->s.time = -1; //let all clients know to draw a beam from this guy
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 -1
ASGNI4
line 2056
;2055:
;2056:	if ( traceEnt->client || tr.startsolid )
ADDRLP4 1092
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $703
ADDRLP4 12+4
INDIRI4
CNSTI4 0
EQI4 $700
LABELV $703
line 2057
;2057:	{
line 2059
;2058:		//go boom
;2059:		ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 2060
;2060:		ent->nextthink = level.time + LT_DELAY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 2061
;2061:		ent->think = laserTrapExplode;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 2062
;2062:	}
LABELV $700
line 2063
;2063:}
LABELV $692
endproc laserTrapThink 1116 28
export laserTrapStick
proc laserTrapStick 32 12
line 2066
;2064:
;2065:void laserTrapStick( gentity_t *ent, vec3_t endpos, vec3_t normal )
;2066:{
line 2071
;2067:	//vec3_t	org;
;2068:
;2069:	// Back away from the wall
;2070:	//VectorMA( endpos, -1, normal, org );
;2071:	G_SetOrigin( ent, endpos );//org );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2072
;2072:	VectorCopy( normal, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 2074
;2073:
;2074:	VectorClear( ent->s.apos.trDelta );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 2076
;2075:	// This will orient the object to face in the direction of the normal
;2076:	VectorCopy( normal, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 2078
;2077:	//VectorScale( normal, -1, ent->s.pos.trDelta );
;2078:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2082
;2079:	
;2080:	
;2081:	//This does nothing, cg_missile makes assumptions about direction of travel controlling angles
;2082:	vectoangles( normal, ent->s.apos.trBase );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2083
;2083:	VectorClear( ent->s.apos.trDelta );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 2084
;2084:	ent->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 2085
;2085:	VectorCopy( ent->s.apos.trBase, ent->s.angles );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 2086
;2086:	VectorCopy( ent->s.angles, ent->r.currentAngles );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2089
;2087:	
;2088:
;2089:	G_Sound( ent, CHAN_VOICE, G_SoundIndex( "sound/weapons/laser_trap/stick.wav" ) );
ADDRGP4 $707
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2090
;2090:	if ( ent->count )
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
EQI4 $708
line 2091
;2091:	{//a tripwire
line 2093
;2092:		//add draw line flag
;2093:		VectorCopy( normal, ent->movedir );
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 2094
;2094:		ent->think = laserTrapThink;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 laserTrapThink
ASGNP4
line 2095
;2095:		ent->nextthink = level.time + LT_ACTIVATION_DELAY;//delay the activation
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2096
;2096:		ent->touch = touch_NULL;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 touch_NULL
ASGNP4
line 2098
;2097:		//make it shootable
;2098:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 2099
;2099:		ent->health = 5;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 5
ASGNI4
line 2100
;2100:		ent->die = laserTrapDelayedExplode;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 laserTrapDelayedExplode
ASGNP4
line 2103
;2101:
;2102:		//shove the box through the wall
;2103:		VectorSet( ent->r.mins, -LT_SIZE*2, -LT_SIZE*2, -LT_SIZE*2 );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3225419776
ASGNF4
line 2104
;2104:		VectorSet( ent->r.maxs, LT_SIZE*2, LT_SIZE*2, LT_SIZE*2 );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 2107
;2105:
;2106:		//so that the owner can blow it up with projectiles
;2107:		ent->r.svFlags |= SVF_OWNERNOTSHARED;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2108
;2108:	}
ADDRGP4 $709
JUMPV
LABELV $708
line 2110
;2109:	else
;2110:	{
line 2111
;2111:		ent->touch = touchLaserTrap;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 touchLaserTrap
ASGNP4
line 2112
;2112:		ent->think = laserTrapExplode;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 laserTrapExplode
ASGNP4
line 2113
;2113:		ent->nextthink = level.time + LT_ALT_TIME; // How long 'til she blows
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2114
;2114:	}
LABELV $709
line 2115
;2115:}
LABELV $705
endproc laserTrapStick 32 12
export TrapThink
proc TrapThink 0 4
line 2118
;2116:
;2117:void TrapThink(gentity_t *ent)
;2118:{
line 2119
;2119:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 2121
;2120:
;2121:	G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 2122
;2122:}
LABELV $712
endproc TrapThink 0 4
export CreateLaserTrap
proc CreateLaserTrap 28 8
line 2125
;2123:
;2124:void CreateLaserTrap( gentity_t *laserTrap, vec3_t start, gentity_t *owner )
;2125:{
line 2126
;2126:	G_SetClassName(laserTrap, "laserTrap");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $489
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 2127
;2127:	laserTrap->s.eFlags = EF_BOUNCE_HALF;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 2128
;2128:	laserTrap->s.eFlags |= EF_MISSILE_STICK;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2097152
BORI4
ASGNI4
line 2129
;2129:	laserTrap->splashDamage = LT_SPLASH_DAM;//*2;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 105
ASGNI4
line 2130
;2130:	laserTrap->splashRadius = LT_SPLASH_RAD;//*2;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 256
ASGNI4
line 2131
;2131:	laserTrap->damage = LT_DAMAGE;//*DMG_VAR;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 100
ASGNI4
line 2132
;2132:	laserTrap->methodOfDeath = MOD_TRIP_MINE_SPLASH;//MOD_TRIP_WIRE;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 24
ASGNI4
line 2133
;2133:	laserTrap->splashMethodOfDeath = MOD_TRIP_MINE_SPLASH;//MOD_TRIP_WIRE;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 24
ASGNI4
line 2134
;2134:	laserTrap->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2135
;2135:	laserTrap->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 2136
;2136:	laserTrap->s.weapon = WP_TRIP_MINE;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 12
ASGNI4
line 2137
;2137:	laserTrap->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2138
;2138:	laserTrap->r.contents = MASK_SHOT;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 769
ASGNI4
line 2139
;2139:	laserTrap->parent = owner;
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 2141
;2140:	//laserTrap->activator = owner;
;2141:	G_SetActivator(laserTrap, owner);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 2142
;2142:	laserTrap->r.ownerNum = owner->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 2143
;2143:	VectorSet( laserTrap->r.mins, -LT_SIZE, -LT_SIZE, -LT_SIZE );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3217031168
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3217031168
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3217031168
ASGNF4
line 2144
;2144:	VectorSet( laserTrap->r.maxs, LT_SIZE, LT_SIZE, LT_SIZE );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1069547520
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1069547520
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1069547520
ASGNF4
line 2145
;2145:	laserTrap->clipmask = MASK_SHOT;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 769
ASGNI4
line 2146
;2146:	laserTrap->s.solid = 2;
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 2147
;2147:	laserTrap->s.modelindex = G_ModelIndex( "models/weapons2/laser_trap/laser_trap_w.glm" );
ADDRGP4 $715
ARGP4
ADDRLP4 4
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 2148
;2148:	laserTrap->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 2149
;2149:	laserTrap->s.g2radius = 40;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 40
ASGNI4
line 2151
;2150:
;2151:	laserTrap->s.genericenemyindex = owner->s.number+1024;
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
CNSTI4 1024
ADDI4
ASGNI4
line 2153
;2152:
;2153:	laserTrap->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
line 2155
;2154:
;2155:	laserTrap->s.time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 0
ASGNI4
line 2157
;2156:
;2157:	laserTrap->s.pos.trTime = level.time;		// move a bit on the very first frame
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2158
;2158:	VectorCopy( start, laserTrap->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2159
;2159:	SnapVector( laserTrap->s.pos.trBase );			// save net bandwidth
ADDRLP4 8
ADDRFP4 0
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
ADDRFP4 0
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
ADDRFP4 0
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
line 2161
;2160:	
;2161:	SnapVector( laserTrap->s.pos.trDelta );			// save net bandwidth
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 36
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
ADDRFP4 0
INDIRP4
CNSTI4 40
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
ADDRFP4 0
INDIRP4
CNSTI4 44
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
line 2162
;2162:	VectorCopy (start, laserTrap->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2164
;2163:
;2164:	laserTrap->s.apos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 5
ASGNI4
line 2165
;2165:	laserTrap->s.apos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2166
;2166:	laserTrap->s.apos.trBase[YAW] = rand()%360;
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2167
;2167:	laserTrap->s.apos.trBase[PITCH] = rand()%360;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2168
;2168:	laserTrap->s.apos.trBase[ROLL] = rand()%360;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2170
;2169:
;2170:	if (rand()%10 < 5)
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $718
line 2171
;2171:	{
line 2172
;2172:		laserTrap->s.apos.trBase[YAW] = -laserTrap->s.apos.trBase[YAW];
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 2173
;2173:	}
LABELV $718
line 2175
;2174:
;2175:	VectorCopy( start, laserTrap->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2176
;2176:	laserTrap->touch = touchLaserTrap;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 touchLaserTrap
ASGNP4
line 2177
;2177:	laserTrap->think = TrapThink;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 TrapThink
ASGNP4
line 2178
;2178:	laserTrap->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 2179
;2179:}
LABELV $714
endproc CreateLaserTrap 28 8
lit
align 4
LABELV $722
byte 4 1023
skip 4092
export WP_PlaceLaserTrap
code
proc WP_PlaceLaserTrap 4156 12
line 2182
;2180:
;2181:void WP_PlaceLaserTrap( gentity_t *ent, qboolean alt_fire )
;2182:{
line 2184
;2183:	gentity_t	*laserTrap;
;2184:	gentity_t	*found = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2186
;2185:	vec3_t		dir, start;
;2186:	int			trapcount = 0;
ADDRLP4 4120
CNSTI4 0
ASGNI4
line 2187
;2187:	int			foundLaserTraps[MAX_GENTITIES] = {ENTITYNUM_NONE};
ADDRLP4 8
ADDRGP4 $722
INDIRB
ASGNB 4096
line 2195
;2188:	int			trapcount_org;
;2189:	int			lowestTimeStamp;
;2190:	int			removeMe;
;2191:	int			i;
;2192:
;2193:	//FIXME: surface must be within 64
;2194:
;2195:	VectorCopy( forward, dir );
ADDRLP4 4124
ADDRGP4 forward
INDIRB
ASGNB 12
line 2196
;2196:	VectorCopy( muzzle, start );
ADDRLP4 4136
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 2198
;2197:
;2198:	laserTrap = G_Spawn();
ADDRLP4 4148
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4148
INDIRP4
ASGNP4
ADDRGP4 $724
JUMPV
LABELV $723
line 2203
;2199:	
;2200:	//limit to 10 placed at any one time
;2201:	//see how many there are now
;2202:	while ( (found = G_FindByClassNameFast( found,  "laserTrap" )) != NULL )
;2203:	{
line 2204
;2204:		if ( found->parent != ent )
ADDRLP4 4
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $726
line 2205
;2205:		{
line 2206
;2206:			continue;
ADDRGP4 $724
JUMPV
LABELV $726
line 2208
;2207:		}
;2208:		foundLaserTraps[trapcount++] = found->s.number;
ADDRLP4 4152
ADDRLP4 4120
INDIRI4
ASGNI4
ADDRLP4 4120
ADDRLP4 4152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4152
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
line 2209
;2209:	}
LABELV $724
line 2202
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $489
ARGP4
ADDRLP4 4152
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 4152
INDIRP4
ASGNP4
ADDRLP4 4152
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $723
line 2211
;2210:	//now remove first ones we find until there are only 9 left
;2211:	found = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2212
;2212:	trapcount_org = trapcount;
ADDRLP4 4112
ADDRLP4 4120
INDIRI4
ASGNI4
line 2213
;2213:	lowestTimeStamp = level.time;
ADDRLP4 4104
ADDRGP4 level+36
INDIRI4
ASGNI4
ADDRGP4 $730
JUMPV
LABELV $729
line 2215
;2214:	while ( trapcount > 9 )
;2215:	{
line 2216
;2216:		removeMe = -1;
ADDRLP4 4116
CNSTI4 -1
ASGNI4
line 2217
;2217:		for ( i = 0; i < trapcount_org; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $735
JUMPV
LABELV $732
line 2218
;2218:		{
line 2219
;2219:			if ( foundLaserTraps[i] == ENTITYNUM_NONE )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $736
line 2220
;2220:			{
line 2221
;2221:				continue;
ADDRGP4 $733
JUMPV
LABELV $736
line 2223
;2222:			}
;2223:			found = &g_entities[foundLaserTraps[i]];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2224
;2224:			if ( laserTrap && found->setTime < lowestTimeStamp )
ADDRLP4 4108
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $738
ADDRLP4 4
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRLP4 4104
INDIRI4
GEI4 $738
line 2225
;2225:			{
line 2226
;2226:				removeMe = i;
ADDRLP4 4116
ADDRLP4 0
INDIRI4
ASGNI4
line 2227
;2227:				lowestTimeStamp = found->setTime;
ADDRLP4 4104
ADDRLP4 4
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ASGNI4
line 2228
;2228:			}
LABELV $738
line 2229
;2229:		}
LABELV $733
line 2217
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $735
ADDRLP4 0
INDIRI4
ADDRLP4 4112
INDIRI4
LTI4 $732
line 2230
;2230:		if ( removeMe != -1 )
ADDRLP4 4116
INDIRI4
CNSTI4 -1
EQI4 $731
line 2231
;2231:		{
line 2233
;2232:			//remove it... or blow it?
;2233:			G_FreeEntity( &g_entities[foundLaserTraps[removeMe]] );
CNSTI4 2352
ADDRLP4 4116
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2234
;2234:			foundLaserTraps[removeMe] = ENTITYNUM_NONE;
ADDRLP4 4116
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTI4 1023
ASGNI4
line 2235
;2235:			trapcount--;
ADDRLP4 4120
ADDRLP4 4120
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2236
;2236:		}
line 2238
;2237:		else
;2238:		{
line 2239
;2239:			break;
LABELV $741
line 2241
;2240:		}
;2241:	}
LABELV $730
line 2214
ADDRLP4 4120
INDIRI4
CNSTI4 9
GTI4 $729
LABELV $731
line 2244
;2242:
;2243:	//now make the new one
;2244:	CreateLaserTrap( laserTrap, start, ent );
ADDRLP4 4108
INDIRP4
ARGP4
ADDRLP4 4136
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CreateLaserTrap
CALLV
pop
line 2247
;2245:
;2246:	//set player-created-specific fields
;2247:	laserTrap->setTime = level.time;//remember when we placed it
ADDRLP4 4108
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2249
;2248:
;2249:	if (!alt_fire)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $743
line 2250
;2250:	{//tripwire
line 2251
;2251:		laserTrap->count = 1;
ADDRLP4 4108
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 1
ASGNI4
line 2252
;2252:	}
LABELV $743
line 2255
;2253:
;2254:	//move it
;2255:	laserTrap->s.pos.trType = TR_GRAVITY;
ADDRLP4 4108
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2257
;2256:
;2257:	if (alt_fire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $745
line 2258
;2258:	{
line 2259
;2259:		VectorScale( dir, 512, laserTrap->s.pos.trDelta );
ADDRLP4 4108
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1140850688
ADDRLP4 4124
INDIRF4
MULF4
ASGNF4
ADDRLP4 4108
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1140850688
ADDRLP4 4124+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4108
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1140850688
ADDRLP4 4124+8
INDIRF4
MULF4
ASGNF4
line 2260
;2260:	}
ADDRGP4 $746
JUMPV
LABELV $745
line 2262
;2261:	else
;2262:	{
line 2263
;2263:		VectorScale( dir, 256, laserTrap->s.pos.trDelta );
ADDRLP4 4108
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1132462080
ADDRLP4 4124
INDIRF4
MULF4
ASGNF4
ADDRLP4 4108
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132462080
ADDRLP4 4124+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4108
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1132462080
ADDRLP4 4124+8
INDIRF4
MULF4
ASGNF4
line 2264
;2264:	}
LABELV $746
line 2266
;2265:
;2266:	trap_LinkEntity(laserTrap);
ADDRLP4 4108
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2267
;2267:}
LABELV $721
endproc WP_PlaceLaserTrap 4156 12
export VectorNPos
proc VectorNPos 4 0
line 2278
;2268:
;2269:
;2270:/*
;2271:======================================================================
;2272:
;2273:DET PACK
;2274:
;2275:======================================================================
;2276:*/
;2277:void VectorNPos(vec3_t in, vec3_t out)
;2278:{
line 2279
;2279:	if (in[0] < 0) { out[0] = -in[0]; } else { out[0] = in[0]; }
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
GEF4 $752
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $753
JUMPV
LABELV $752
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ASGNF4
LABELV $753
line 2280
;2280:	if (in[1] < 0) { out[1] = -in[1]; } else { out[1] = in[1]; }
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $754
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $755
JUMPV
LABELV $754
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ASGNF4
LABELV $755
line 2281
;2281:	if (in[2] < 0) { out[2] = -in[2]; } else { out[2] = in[2]; }
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 0
GEF4 $756
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $757
JUMPV
LABELV $756
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRF4
ASGNF4
LABELV $757
line 2282
;2282:}
LABELV $751
endproc VectorNPos 4 0
export charge_stick
proc charge_stick 108 24
line 2287
;2283:
;2284:void DetPackBlow(gentity_t *self);
;2285:
;2286:void charge_stick (gentity_t *self, gentity_t *other, trace_t *trace)
;2287:{
line 2290
;2288:	gentity_t	*tent;
;2289:
;2290:	if (other && other->s.number < 1022 &&
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
EQU4 $759
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1022
GEI4 $759
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $761
ADDRLP4 4
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 0
NEI4 $759
LABELV $761
line 2292
;2291:		(other->client || !other->s.weapon))
;2292:	{
line 2295
;2293:		vec3_t vNor, tN;
;2294:
;2295:		VectorCopy(trace->plane.normal, vNor);
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2296
;2296:		VectorNormalize(vNor);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2297
;2297:		VectorNPos(self->s.pos.trDelta, tN);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 VectorNPos
CALLV
pop
line 2298
;2298:		self->s.pos.trDelta[0] += vNor[0]*(tN[0]*(((float)Q_irand(1, 10, self->parent && self->parent->client && self->parent->client->sess.raceMode, 5))*0.1));
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
CNSTU4 0
ASGNU4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $763
ADDRLP4 48
ADDRLP4 40
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $763
ADDRLP4 48
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $763
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $764
JUMPV
LABELV $763
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $764
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 52
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1036831949
ADDRLP4 52
INDIRI4
CVIF4 4
MULF4
MULF4
MULF4
ADDF4
ASGNF4
line 2299
;2299:		self->s.pos.trDelta[1] += vNor[1]*(tN[1]*(((float)Q_irand(1, 10, self->parent && self->parent->client && self->parent->client->sess.raceMode, 5))*0.1));
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
CNSTU4 0
ASGNU4
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $768
ADDRLP4 72
ADDRLP4 64
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $768
ADDRLP4 72
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $768
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRGP4 $769
JUMPV
LABELV $768
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $769
ADDRLP4 60
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 76
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+4
INDIRF4
CNSTF4 1036831949
ADDRLP4 76
INDIRI4
CVIF4 4
MULF4
MULF4
MULF4
ADDF4
ASGNF4
line 2300
;2300:		self->s.pos.trDelta[2] += vNor[1]*(tN[2]*(((float)Q_irand(1, 10, self->parent && self->parent->client && self->parent->client->sess.raceMode, 5))*0.1));
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 540
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
EQU4 $773
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
EQU4 $773
ADDRLP4 96
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $773
ADDRLP4 84
CNSTI4 1
ASGNI4
ADDRGP4 $774
JUMPV
LABELV $773
ADDRLP4 84
CNSTI4 0
ASGNI4
LABELV $774
ADDRLP4 84
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 100
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+8
INDIRF4
CNSTF4 1036831949
ADDRLP4 100
INDIRI4
CVIF4 4
MULF4
MULF4
MULF4
ADDF4
ASGNF4
line 2302
;2301:
;2302:		vectoangles(vNor, self->s.angles);
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2303
;2303:		vectoangles(vNor, self->s.apos.trBase);
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2304
;2304:		self->touch = charge_stick;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 charge_stick
ASGNP4
line 2305
;2305:		return;
ADDRGP4 $758
JUMPV
LABELV $759
line 2307
;2306:	}
;2307:	else if (other && other->s.number < 1022)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $775
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1022
GEI4 $775
line 2308
;2308:	{
line 2311
;2309:		vec3_t v;
;2310:
;2311:		self->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 2312
;2312:		self->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTP4 0
ASGNP4
line 2313
;2313:		self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 2315
;2314:
;2315:		self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 2317
;2316:
;2317:		VectorClear(self->s.apos.trDelta);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 2318
;2318:		self->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 2320
;2319:
;2320:		G_RadiusDamage( self->r.currentOrigin, self->parent, self->splashDamage, self->splashRadius, self, MOD_DET_PACK_SPLASH );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 26
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 2321
;2321:		VectorCopy(trace->plane.normal, v);
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2322
;2322:		VectorCopy(v, self->pos2);
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2323
;2323:		self->count = -1;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 -1
ASGNI4
line 2324
;2324:		G_PlayEffect(EFFECT_EXPLOSION_DETPACK, self->r.currentOrigin, v);
CNSTI4 6
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 2326
;2325:
;2326:		self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2327
;2327:		self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2328
;2328:		return;
ADDRGP4 $758
JUMPV
LABELV $775
line 2334
;2329:	}
;2330:
;2331:	//self->s.eType = ET_GENERAL;
;2332:	//FIXME: once on ground, shouldn't explode if touched by someone?
;2333:	//FIXME: if owner touches it again, pick it up?  Or if he "uses" it?
;2334:	self->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 2335
;2335:	self->think = DetPackBlow;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 DetPackBlow
ASGNP4
line 2336
;2336:	self->nextthink = level.time + 30000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 2338
;2337:
;2338:	VectorClear(self->s.apos.trDelta);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 2339
;2339:	self->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 2341
;2340:
;2341:	self->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 2342
;2342:	VectorCopy( self->r.currentOrigin, self->s.origin );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2343
;2343:	VectorCopy( self->r.currentOrigin, self->s.pos.trBase );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2344
;2344:	VectorClear( self->s.pos.trDelta );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 32
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 32
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 32
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
line 2346
;2345:
;2346:	VectorClear( self->s.apos.trDelta );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 40
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 40
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 40
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
line 2348
;2347:
;2348:	VectorNormalize(trace->plane.normal);
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2350
;2349:
;2350:	vectoangles(trace->plane.normal, self->s.angles);
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2351
;2351:	VectorCopy(self->s.angles, self->r.currentAngles );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2352
;2352:	VectorCopy(self->s.angles, self->s.apos.trBase);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2354
;2353:
;2354:	VectorCopy(trace->plane.normal, self->pos2);
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2355
;2355:	self->count = -1;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 -1
ASGNI4
line 2357
;2356:
;2357:	G_Sound(self, CHAN_VOICE, G_SoundIndex("sound/weapons/detpack/stick.wav"));
ADDRGP4 $779
ARGP4
ADDRLP4 56
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2359
;2358:		
;2359:	tent = G_TempEntity( self->r.currentOrigin, EV_MISSILE_MISS );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 74
ARGI4
ADDRLP4 60
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
line 2360
;2360:	tent->s.weapon = 0;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 0
ASGNI4
line 2361
;2361:	tent->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 2362
;2362:	tent->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2365
;2363:
;2364:	//so that the owner can blow it up with projectiles
;2365:	self->r.svFlags |= SVF_OWNERNOTSHARED;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2366
;2366:}
LABELV $758
endproc charge_stick 108 24
export DetPackBlow
proc DetPackBlow 16 24
line 2369
;2367:
;2368:void DetPackBlow(gentity_t *self)
;2369:{
line 2373
;2370:	vec3_t v;
;2371:
;2372:	//self->touch = NULL;
;2373:	self->pain = 0;
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 2374
;2374:	self->die = 0;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTP4 0
ASGNP4
line 2375
;2375:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 2377
;2376:
;2377:	G_RadiusDamage( self->r.currentOrigin, self->parent, self->splashDamage, self->splashRadius, self, MOD_DET_PACK_SPLASH );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 26
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 2378
;2378:	v[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2379
;2379:	v[1] = 0;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 2380
;2380:	v[2] = 1;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 2382
;2381:
;2382:	if (self->count == -1)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $783
line 2383
;2383:	{
line 2384
;2384:		VectorCopy(self->pos2, v);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRB
ASGNB 12
line 2385
;2385:	}
LABELV $783
line 2387
;2386:
;2387:	G_PlayEffect(EFFECT_EXPLOSION_DETPACK, self->r.currentOrigin, v);
CNSTI4 6
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 2389
;2388:
;2389:	self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2390
;2390:	self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2391
;2391:}
LABELV $780
endproc DetPackBlow 16 24
export DetPackPain
proc DetPackPain 20 20
line 2394
;2392:
;2393:void DetPackPain(gentity_t *self, gentity_t *attacker, int damage)
;2394:{
line 2395
;2395:	self->think = DetPackBlow;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 DetPackBlow
ASGNP4
line 2396
;2396:	self->nextthink = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 50, 100, self->parent && self->parent->client && self->parent->client->sess.raceMode, 75);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 50
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 540
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
EQU4 $789
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $789
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $789
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $790
JUMPV
LABELV $789
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $790
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 75
ARGI4
ADDRLP4 16
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
line 2397
;2397:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 2398
;2398:}
LABELV $786
endproc DetPackPain 20 20
export DetPackDie
proc DetPackDie 20 20
line 2401
;2399:
;2400:void DetPackDie(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;2401:{
line 2402
;2402:	self->think = DetPackBlow;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 DetPackBlow
ASGNP4
line 2403
;2403:	self->nextthink = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 50, 100, self->parent && self->parent->client && self->parent->client->sess.raceMode, 75);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 50
ARGI4
CNSTI4 100
ARGI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 540
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
EQU4 $794
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $794
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $794
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $795
JUMPV
LABELV $794
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $795
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 75
ARGI4
ADDRLP4 16
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ASGNI4
line 2404
;2404:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 2405
;2405:}
LABELV $791
endproc DetPackDie 20 20
export drop_charge
proc drop_charge 32 8
line 2408
;2406:
;2407:void drop_charge (gentity_t *self, vec3_t start, vec3_t dir) 
;2408:{
line 2411
;2409:	gentity_t	*bolt;
;2410:
;2411:	VectorNormalize (dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2413
;2412:
;2413:	bolt = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 2414
;2414:	G_SetClassName(bolt, "detpack");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $797
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 2415
;2415:	bolt->nextthink = level.time + FRAMETIME;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2416
;2416:	bolt->think = G_RunObject;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_RunObject
ASGNP4
line 2417
;2417:	bolt->s.eType = ET_GENERAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2418
;2418:	bolt->s.g2radius = 100;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 100
ASGNI4
line 2419
;2419:	bolt->s.modelGhoul2 = 1;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 2420
;2420:	bolt->s.modelindex = G_ModelIndex("models/weapons2/detpack/det_pack_proj.glm"); // w.md3");
ADDRGP4 $799
ARGP4
ADDRLP4 8
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 2423
;2421:
;2422:	//bolt->playerTeam = self->client->playerTeam;
;2423:	bolt->parent = self;
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 2424
;2424:	bolt->r.ownerNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2425
;2425:	bolt->damage = 100;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 100
ASGNI4
line 2426
;2426:	bolt->splashDamage = 200;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 200
ASGNI4
line 2427
;2427:	bolt->splashRadius = 200;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 200
ASGNI4
line 2428
;2428:	bolt->methodOfDeath = MOD_DET_PACK_SPLASH;//MOD_EXPLOSIVE;
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 26
ASGNI4
line 2429
;2429:	bolt->splashMethodOfDeath = MOD_DET_PACK_SPLASH;//MOD_EXPLOSIVE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 26
ASGNI4
line 2430
;2430:	bolt->clipmask = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 769
ASGNI4
line 2431
;2431:	bolt->s.solid = 2;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 2432
;2432:	bolt->r.contents = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 769
ASGNI4
line 2433
;2433:	bolt->touch = charge_stick;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 charge_stick
ASGNP4
line 2435
;2434:
;2435:	bolt->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 2437
;2436:
;2437:	bolt->s.genericenemyindex = self->s.number+1024;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1024
ADDI4
ASGNI4
line 2442
;2438:	//rww - so client prediction knows we own this and won't hit it
;2439:
;2440://	VectorSet( bolt->r.mins, -3, -3, -3 );
;2441://	VectorSet( bolt->r.maxs, 3, 3, 3 );
;2442:	VectorSet( bolt->r.mins, -2, -2, -2 );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3221225472
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3221225472
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3221225472
ASGNF4
line 2443
;2443:	VectorSet( bolt->r.maxs, 2, 2, 2 );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1073741824
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1073741824
ASGNF4
line 2445
;2444:
;2445:	bolt->pain = DetPackPain;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRGP4 DetPackPain
ASGNP4
line 2446
;2446:	bolt->die = DetPackDie;
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 DetPackDie
ASGNP4
line 2448
;2447:
;2448:	bolt->s.weapon = WP_DET_PACK;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 13
ASGNI4
line 2450
;2449:
;2450:	bolt->setTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2452
;2451:
;2452:	G_SetOrigin(bolt, start);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2453
;2453:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2454
;2454:	VectorCopy( start, bolt->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2455
;2455:	if (self->client->sess.raceMode) { //put contents=mask_shot here?
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $801
line 2456
;2456:		VectorScale(dir, 300, bolt->s.pos.trDelta); //Launch at +300
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 2457
;2457:		VectorAdd(bolt->s.pos.trDelta, self->client->ps.velocity, bolt->s.pos.trDelta); //Inherit full velocity from player
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2458
;2458:	}
ADDRGP4 $802
JUMPV
LABELV $801
line 2459
;2459:	else {
line 2460
;2460:		bolt->health = 1;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
line 2461
;2461:		bolt->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 2462
;2462:		VectorScale(dir, 300, bolt->s.pos.trDelta);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 2463
;2463:	}
LABELV $802
line 2464
;2464:	VectorScale(dir, 300, bolt->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1133903872
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ASGNF4
line 2465
;2465:	bolt->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2467
;2466:
;2467:	bolt->s.apos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 5
ASGNI4
line 2468
;2468:	bolt->s.apos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2469
;2469:	bolt->s.apos.trBase[YAW] = rand()%360;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2470
;2470:	bolt->s.apos.trBase[PITCH] = rand()%360;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2471
;2471:	bolt->s.apos.trBase[ROLL] = rand()%360;
ADDRLP4 20
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 20
INDIRI4
CNSTI4 360
MODI4
CVIF4 4
ASGNF4
line 2473
;2472:
;2473:	if (rand()%10 < 5)
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 10
MODI4
CNSTI4 5
GEI4 $805
line 2474
;2474:	{
line 2475
;2475:		bolt->s.apos.trBase[YAW] = -bolt->s.apos.trBase[YAW];
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
NEGF4
ASGNF4
line 2476
;2476:	}
LABELV $805
line 2478
;2477:
;2478:	vectoangles(dir, bolt->s.angles);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2479
;2479:	VectorCopy(bolt->s.angles, bolt->s.apos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2480
;2480:	VectorSet(bolt->s.apos.trDelta, 300, 0, 0 );
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 1133903872
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
line 2481
;2481:	bolt->s.apos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2483
;2482:
;2483:	trap_LinkEntity(bolt);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2484
;2484:}
LABELV $796
endproc drop_charge 32 8
export BlowDetpacks
proc BlowDetpacks 16 12
line 2487
;2485:
;2486:void BlowDetpacks(gentity_t *ent)
;2487:{
line 2488
;2488:	gentity_t *found = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2490
;2489:
;2490:	if ( ent->client->ps.hasDetPackPlanted )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $809
line 2491
;2491:	{
ADDRGP4 $812
JUMPV
LABELV $811
line 2493
;2492:		while ( (found = G_FindByClassNameFast( found, "detpack") ) != NULL )
;2493:		{//loop through all ents and blow the crap out of them!
line 2494
;2494:			if ( found->parent == ent )
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $814
line 2495
;2495:			{
line 2496
;2496:				VectorCopy( found->r.currentOrigin, found->s.origin );
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2497
;2497:				found->think = DetPackBlow;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 DetPackBlow
ASGNP4
line 2498
;2498:				if (ent->client->sess.raceMode)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $816
line 2499
;2499:					found->nextthink = level.time + 100; //No randomness to racemode detpacks?
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
ADDRGP4 $817
JUMPV
LABELV $816
line 2501
;2500:				else
;2501:					found->nextthink = level.time + 100 + random() * 200;
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
CNSTF4 1128792064
ADDRLP4 8
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
MULF4
ADDF4
CVFI4 4
ASGNI4
LABELV $817
line 2502
;2502:				G_Sound( found, CHAN_BODY, G_SoundIndex("sound/weapons/detpack/warning.wav") );
ADDRGP4 $820
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2503
;2503:			}
LABELV $814
line 2504
;2504:		}
LABELV $812
line 2492
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $797
ARGP4
ADDRLP4 4
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $811
line 2505
;2505:		ent->client->ps.hasDetPackPlanted = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 2506
;2506:	}
LABELV $809
line 2507
;2507:}
LABELV $808
endproc BlowDetpacks 16 12
export RemoveDetpacks
proc RemoveDetpacks 8 8
line 2511
;2508:
;2509:
;2510:void RemoveDetpacks(gentity_t* ent)
;2511:{
line 2512
;2512:	gentity_t* found = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 2514
;2513:
;2514:	if (ent->client->ps.hasDetPackPlanted)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $822
line 2515
;2515:	{
ADDRGP4 $825
JUMPV
LABELV $824
line 2517
;2516:		while ((found = G_FindByClassNameFast(found, "detpack")) != NULL)
;2517:		{//loop through all ents and blow the crap out of them!
line 2518
;2518:			if (found->parent == ent)
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $827
line 2519
;2519:			{
line 2520
;2520:				VectorCopy(found->r.currentOrigin, found->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2521
;2521:				found->think = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2522
;2522:				found->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2524
;2523:				//	G_Sound( found, CHAN_BODY, G_SoundIndex("sound/weapons/detpack/warning.wav") );
;2524:			}
LABELV $827
line 2525
;2525:		}
LABELV $825
line 2516
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $797
ARGP4
ADDRLP4 4
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $824
line 2526
;2526:		ent->client->ps.hasDetPackPlanted = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 2527
;2527:	}
LABELV $822
line 2528
;2528:}
LABELV $821
endproc RemoveDetpacks 8 8
export CheatsOn
proc CheatsOn 0 0
line 2531
;2529:
;2530:qboolean CheatsOn(void) 
;2531:{
line 2532
;2532:	if ( !g_cheats.integer )
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $831
line 2533
;2533:	{
line 2534
;2534:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $830
JUMPV
LABELV $831
line 2536
;2535:	}
;2536:	return qtrue;
CNSTI4 1
RETI4
LABELV $830
endproc CheatsOn 0 0
lit
align 4
LABELV $835
byte 4 1023
skip 4092
export WP_DropDetPack
code
proc WP_DropDetPack 4140 20
line 2540
;2537:}
;2538:
;2539:void WP_DropDetPack( gentity_t *ent, qboolean alt_fire )
;2540:{
line 2541
;2541:	gentity_t	*found = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2542
;2542:	int			trapcount = 0;
ADDRLP4 4116
CNSTI4 0
ASGNI4
line 2543
;2543:	int			foundDetPacks[MAX_GENTITIES] = {ENTITYNUM_NONE};
ADDRLP4 8
ADDRGP4 $835
INDIRB
ASGNB 4096
line 2549
;2544:	int			trapcount_org;
;2545:	int			lowestTimeStamp;
;2546:	int			removeMe;
;2547:	int			i;
;2548:
;2549:	if ( !ent || !ent->client )
ADDRLP4 4120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4124
CNSTU4 0
ASGNU4
ADDRLP4 4120
INDIRP4
CVPU4 4
ADDRLP4 4124
INDIRU4
EQU4 $838
ADDRLP4 4120
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4124
INDIRU4
NEU4 $840
LABELV $838
line 2550
;2550:	{
line 2551
;2551:		return;
ADDRGP4 $834
JUMPV
LABELV $839
line 2562
;2552:	}
;2553:	
;2554:	/*if (ent->client->sess.raceMode && ent->client->sess.movementStyle == MV_JETPACK)
;2555:	{
;2556:		maxCount = 0;
;2557:	}*/
;2558:
;2559:	//limit to 10 placed at any one time
;2560:	//see how many there are now
;2561:	while ( (found = G_FindByClassNameFast( found, "detpack" )) != NULL )
;2562:	{
line 2563
;2563:		if ( found->parent != ent )
ADDRLP4 4
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $842
line 2564
;2564:		{
line 2565
;2565:			continue;
ADDRGP4 $840
JUMPV
LABELV $842
line 2567
;2566:		}
;2567:		foundDetPacks[trapcount++] = found->s.number;
ADDRLP4 4128
ADDRLP4 4116
INDIRI4
ASGNI4
ADDRLP4 4116
ADDRLP4 4128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4128
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
line 2568
;2568:	}
LABELV $840
line 2561
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $797
ARGP4
ADDRLP4 4128
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 4128
INDIRP4
ASGNP4
ADDRLP4 4128
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $839
line 2570
;2569:	//now remove first ones we find until there are only 9 left
;2570:	found = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2571
;2571:	trapcount_org = trapcount;
ADDRLP4 4108
ADDRLP4 4116
INDIRI4
ASGNI4
line 2572
;2572:	lowestTimeStamp = level.time;
ADDRLP4 4104
ADDRGP4 level+36
INDIRI4
ASGNI4
ADDRGP4 $846
JUMPV
LABELV $845
line 2574
;2573:	while ( trapcount > 9 )
;2574:	{
line 2575
;2575:		removeMe = -1;
ADDRLP4 4112
CNSTI4 -1
ASGNI4
line 2576
;2576:		for ( i = 0; i < trapcount_org; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $851
JUMPV
LABELV $848
line 2577
;2577:		{
line 2578
;2578:			if ( foundDetPacks[i] == ENTITYNUM_NONE )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $852
line 2579
;2579:			{
line 2580
;2580:				continue;
ADDRGP4 $849
JUMPV
LABELV $852
line 2582
;2581:			}
;2582:			found = &g_entities[foundDetPacks[i]];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2583
;2583:			if ( found->setTime < lowestTimeStamp )
ADDRLP4 4
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRLP4 4104
INDIRI4
GEI4 $854
line 2584
;2584:			{
line 2585
;2585:				removeMe = i;
ADDRLP4 4112
ADDRLP4 0
INDIRI4
ASGNI4
line 2586
;2586:				lowestTimeStamp = found->setTime;
ADDRLP4 4104
ADDRLP4 4
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ASGNI4
line 2587
;2587:			}
LABELV $854
line 2588
;2588:		}
LABELV $849
line 2576
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $851
ADDRLP4 0
INDIRI4
ADDRLP4 4108
INDIRI4
LTI4 $848
line 2589
;2589:		if ( removeMe != -1 )
ADDRLP4 4112
INDIRI4
CNSTI4 -1
EQI4 $847
line 2590
;2590:		{
line 2592
;2591:			//remove it... or blow it?
;2592:			if (!CheatsOn())
ADDRLP4 4132
ADDRGP4 CheatsOn
CALLI4
ASGNI4
ADDRLP4 4132
INDIRI4
CNSTI4 0
NEI4 $858
line 2593
;2593:			{ //Let them have unlimited if cheats are enabled
line 2594
;2594:				G_FreeEntity( &g_entities[foundDetPacks[removeMe]] );
CNSTI4 2352
ADDRLP4 4112
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2595
;2595:			}
LABELV $858
line 2596
;2596:			foundDetPacks[removeMe] = ENTITYNUM_NONE;
ADDRLP4 4112
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTI4 1023
ASGNI4
line 2597
;2597:			trapcount--;
ADDRLP4 4116
ADDRLP4 4116
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2598
;2598:		}
line 2600
;2599:		else
;2600:		{
line 2601
;2601:			break;
LABELV $857
line 2603
;2602:		}
;2603:	}
LABELV $846
line 2573
ADDRLP4 4116
INDIRI4
CNSTI4 9
GTI4 $845
LABELV $847
line 2605
;2604:
;2605:	if ( alt_fire  )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $860
line 2606
;2606:	{
line 2607
;2607:		BlowDetpacks(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BlowDetpacks
CALLV
pop
line 2608
;2608:	}
ADDRGP4 $861
JUMPV
LABELV $860
line 2610
;2609:	else
;2610:	{
line 2611
;2611:		AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2613
;2612:
;2613:		CalcMuzzlePoint( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 2615
;2614:
;2615:		VectorNormalize( forward );
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2616
;2616:		VectorMA( muzzle, -4, forward, muzzle );
ADDRLP4 4132
ADDRGP4 muzzle
ASGNP4
ADDRLP4 4136
CNSTF4 3229614080
ASGNF4
ADDRLP4 4132
INDIRP4
ADDRLP4 4132
INDIRP4
INDIRF4
ADDRLP4 4136
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 muzzle+4
ADDRGP4 muzzle+4
INDIRF4
ADDRLP4 4136
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 muzzle+8
ADDRGP4 muzzle+8
INDIRF4
CNSTF4 3229614080
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2617
;2617:		drop_charge( ent, muzzle, forward );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 drop_charge
CALLV
pop
line 2619
;2618:
;2619:		ent->client->ps.hasDetPackPlanted = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 1
ASGNI4
line 2620
;2620:	}
LABELV $861
line 2621
;2621:}
LABELV $834
endproc WP_DropDetPack 4140 20
export WP_FireStunBaton
proc WP_FireStunBaton 1184 32
line 2628
;2622:
;2623:
;2624://---------------------------------------------------------
;2625:// FireStunBaton
;2626://---------------------------------------------------------
;2627:void WP_FireStunBaton( gentity_t *ent, qboolean alt_fire )
;2628:{
line 2634
;2629:	gentity_t	*tr_ent;
;2630:	trace_t		tr;
;2631:	vec3_t		mins, maxs, end;
;2632:	vec3_t		muzzleStun;
;2633:
;2634:	if (!ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $869
line 2635
;2635:	{
line 2636
;2636:		VectorCopy(ent->r.currentOrigin, muzzleStun);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2637
;2637:		muzzleStun[2] += 8;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 2638
;2638:	}
ADDRGP4 $870
JUMPV
LABELV $869
line 2640
;2639:	else
;2640:	{
line 2641
;2641:		VectorCopy(ent->client->ps.origin, muzzleStun);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2642
;2642:		muzzleStun[2] += ent->client->ps.viewheight-6;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 6
SUBI4
CVIF4 4
ADDF4
ASGNF4
line 2643
;2643:	}
LABELV $870
line 2645
;2644:
;2645:	muzzleStun[0] += forward[0]*20;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
line 2646
;2646:	muzzleStun[1] += forward[1]*20;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1101004800
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2647
;2647:	muzzleStun[2] += forward[2]*20;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1101004800
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2649
;2648:
;2649:	muzzleStun[0] += right[0]*4;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1082130432
ADDRGP4 right
INDIRF4
MULF4
ADDF4
ASGNF4
line 2650
;2650:	muzzleStun[1] += right[1]*4;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2651
;2651:	muzzleStun[2] += right[2]*4;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1082130432
ADDRGP4 right+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2653
;2652:
;2653:	VectorMA( muzzleStun, STUN_BATON_RANGE, forward, end );
ADDRLP4 1132
CNSTF4 1090519040
ASGNF4
ADDRLP4 1120
ADDRLP4 0
INDIRF4
ADDRLP4 1132
INDIRF4
ADDRGP4 forward
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1120+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1132
INDIRF4
ADDRGP4 forward+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1120+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDRGP4 forward+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2655
;2654:
;2655:	VectorSet( maxs, 6, 6, 6 );
ADDRLP4 1136
CNSTF4 1086324736
ASGNF4
ADDRLP4 16
ADDRLP4 1136
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 1136
INDIRF4
ASGNF4
ADDRLP4 16+8
CNSTF4 1086324736
ASGNF4
line 2656
;2656:	VectorScale( maxs, -1, mins );
ADDRLP4 1140
CNSTF4 3212836864
ASGNF4
ADDRLP4 1108
ADDRLP4 1140
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 1108+4
ADDRLP4 1140
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 1108+8
CNSTF4 3212836864
ADDRLP4 16+8
INDIRF4
MULF4
ASGNF4
line 2658
;2657:
;2658:	JP_Trace ( &tr, muzzleStun, mins, maxs, end, ent->s.number, MASK_SHOT );
ADDRLP4 28
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1108
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1120
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2660
;2659:
;2660:	if ( tr.entityNum >= ENTITYNUM_WORLD )
ADDRLP4 28+52
INDIRI4
CNSTI4 1022
LTI4 $893
line 2661
;2661:	{
line 2662
;2662:		return;
ADDRGP4 $868
JUMPV
LABELV $893
line 2665
;2663:	}
;2664:
;2665:	tr_ent = &g_entities[tr.entityNum];
ADDRLP4 12
CNSTI4 2352
ADDRLP4 28+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2667
;2666:
;2667:	if (tr_ent && tr_ent->takedamage && tr_ent->client)
ADDRLP4 1148
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 1148
INDIRU4
EQU4 $897
ADDRLP4 12
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $897
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1148
INDIRU4
EQU4 $897
line 2668
;2668:	{
line 2669
;2669:		if (tr_ent->client->ps.duelInProgress &&
ADDRLP4 1152
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $899
ADDRLP4 1152
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $899
line 2671
;2670:			tr_ent->client->ps.duelIndex != ent->s.number)
;2671:		{
line 2672
;2672:			return;
ADDRGP4 $868
JUMPV
LABELV $899
line 2675
;2673:		}
;2674:
;2675:		if (ent->client &&
ADDRLP4 1156
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $901
ADDRLP4 1156
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $901
ADDRLP4 1156
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
INDIRI4
EQI4 $901
line 2678
;2676:			ent->client->ps.duelInProgress &&
;2677:			ent->client->ps.duelIndex != tr_ent->s.number)
;2678:		{
line 2679
;2679:			return;
ADDRGP4 $868
JUMPV
LABELV $901
line 2681
;2680:		}
;2681:	}
LABELV $897
line 2683
;2682:
;2683:	if ( tr_ent && tr_ent->takedamage )
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $903
ADDRLP4 12
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $903
line 2684
;2684:	{
line 2685
;2685:		G_PlayEffect( EFFECT_STUNHIT, tr.endpos, tr.plane.normal );
CNSTI4 8
ARGI4
ADDRLP4 28+12
ARGP4
ADDRLP4 28+24
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 2688
;2686:
;2687:		// TEMP!
;2688:		G_Sound( tr_ent, CHAN_WEAPON, G_SoundIndex( va("sound/weapons/melee/punch%d", Q_irand(1, 4,qfalse,2)) ) );
CNSTI4 1
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 1156
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $907
ARGP4
ADDRLP4 1156
INDIRI4
ARGI4
ADDRLP4 1160
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1164
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1164
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2690
;2689:
;2690:		G_Damage( tr_ent, ent, ent, forward, tr.endpos, STUN_BATON_DAMAGE, (DAMAGE_NO_KNOCKBACK|DAMAGE_HALF_ABSORB), MOD_STUN_BATON );
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 28+12
ARGP4
CNSTI4 20
ARGI4
CNSTI4 1028
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2693
;2691:		//alt-fire?
;2692:
;2693:		if (tr_ent->client)
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $909
line 2694
;2694:		{ //if it's a player then use the shock effect
line 2695
;2695:			tr_ent->client->ps.electrifyTime = LEVELTIME(tr_ent->client) + 700;
ADDRLP4 1180
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $915
ADDRLP4 1180
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $915
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $917
ADDRLP4 1176
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $918
JUMPV
LABELV $917
ADDRLP4 1176
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $918
ADDRLP4 1172
ADDRLP4 1176
INDIRI4
ASGNI4
ADDRGP4 $916
JUMPV
LABELV $915
ADDRLP4 1172
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $916
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRLP4 1172
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 2696
;2696:		}
LABELV $909
line 2697
;2697:	}
LABELV $903
line 2698
;2698:}
LABELV $868
endproc WP_FireStunBaton 1184 32
export SnapVectorTowards
proc SnapVectorTowards 12 0
line 2718
;2699:
;2700:
;2701:////////////////////////////////////////////////////////////////////////////
;2702:////////////////////////////////////////////////////////////////////////////
;2703:////////////////////////////////////////////////////////////////////////////
;2704:////////////////////////////////////////////////////////////////////////////
;2705:////////////////////////////////////////////////////////////////////////////
;2706:
;2707:
;2708:/*
;2709:======================
;2710:SnapVectorTowards
;2711:
;2712:Round a vector to integers for more efficient network
;2713:transmission, but make sure that it rounds towards a given point
;2714:rather than blindly truncating.  This prevents it from truncating 
;2715:into a wall.
;2716:======================
;2717:*/
;2718:void SnapVectorTowards( vec3_t v, vec3_t to ) {
line 2721
;2719:	int		i;
;2720:
;2721:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $920
line 2722
;2722:		if ( to[i] <= v[i] ) {
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
GTF4 $924
line 2723
;2723:			v[i] = (int)v[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
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
line 2724
;2724:		} else {
ADDRGP4 $925
JUMPV
LABELV $924
line 2725
;2725:			v[i] = (int)v[i] + 1;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
CNSTI4 1
ADDI4
CVIF4 4
ASGNF4
line 2726
;2726:		}
LABELV $925
line 2727
;2727:	}
LABELV $921
line 2721
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $920
line 2728
;2728:}
LABELV $919
endproc SnapVectorTowards 12 0
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 2739
;2729:
;2730:
;2731://======================================================================
;2732:
;2733:
;2734:/*
;2735:===============
;2736:LogAccuracyHit
;2737:===============
;2738:*/
;2739:qboolean LogAccuracyHit( gentity_t *target, gentity_t *attacker ) {
line 2740
;2740:	if( !target->takedamage ) {
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
NEI4 $927
line 2741
;2741:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $926
JUMPV
LABELV $927
line 2744
;2742:	}
;2743:
;2744:	if ( target == attacker ) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $929
line 2745
;2745:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $926
JUMPV
LABELV $929
line 2748
;2746:	}
;2747:
;2748:	if( !target->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $931
line 2749
;2749:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $926
JUMPV
LABELV $931
line 2752
;2750:	}
;2751:
;2752:	if( !attacker->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $933
line 2753
;2753:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $926
JUMPV
LABELV $933
line 2756
;2754:	}
;2755:
;2756:	if( target->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $935
line 2757
;2757:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $926
JUMPV
LABELV $935
line 2760
;2758:	}
;2759:
;2760:	if ( OnSameTeam( target, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $937
line 2761
;2761:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $926
JUMPV
LABELV $937
line 2764
;2762:	}
;2763:
;2764:	return qtrue;
CNSTI4 1
RETI4
LABELV $926
endproc LogAccuracyHit 4 8
export CalcMuzzlePoint
proc CalcMuzzlePoint 64 0
line 2776
;2765:}
;2766:
;2767:
;2768:/*
;2769:===============
;2770:CalcMuzzlePoint
;2771:
;2772:set muzzle location relative to pivoting eye
;2773:===============
;2774:*/
;2775:void CalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) 
;2776:{
line 2780
;2777:	int weapontype;
;2778:	vec3_t muzzleOffPoint;
;2779:
;2780:	weapontype = ent->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 2781
;2781:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2783
;2782:
;2783:	VectorCopy(WP_MuzzlePoint[weapontype], muzzleOffPoint);
ADDRLP4 0
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 WP_MuzzlePoint
ADDP4
INDIRB
ASGNB 12
line 2785
;2784:
;2785:	if (ent->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $940
line 2786
;2786:	{
line 2787
;2787:		gentity_t *headEnt = &g_entities[ent->client->damageBoxHandle_Head];
ADDRLP4 16
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43648
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2789
;2788:
;2789:		VectorClear(muzzleOffPoint);
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
line 2790
;2790:		muzzleOffPoint[0] = 16;
ADDRLP4 0
CNSTF4 1098907648
ASGNF4
line 2791
;2791:		muzzleOffPoint[2] = 128;
ADDRLP4 0+8
CNSTF4 1124073472
ASGNF4
line 2793
;2792:
;2793:		if (headEnt && headEnt->s.number >= MAX_CLIENTS)
ADDRLP4 24
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $945
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 32
LTI4 $945
line 2794
;2794:		{
line 2795
;2795:			if (headEnt->bolt_Waist)
ADDRLP4 16
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 0
EQI4 $947
line 2796
;2796:			{
line 2797
;2797:				muzzleOffPoint[1] = 3;
ADDRLP4 0+4
CNSTF4 1077936128
ASGNF4
line 2798
;2798:			}
ADDRGP4 $948
JUMPV
LABELV $947
line 2800
;2799:			else
;2800:			{
line 2801
;2801:				muzzleOffPoint[1] = -4;
ADDRLP4 0+4
CNSTF4 3229614080
ASGNF4
line 2802
;2802:			}
LABELV $948
line 2803
;2803:		}
LABELV $945
line 2804
;2804:	}
LABELV $940
line 2807
;2805:
;2806:#if 1
;2807:	if (weapontype > WP_NONE && weapontype < WP_NUM_WEAPONS)
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $951
ADDRLP4 12
INDIRI4
CNSTI4 16
GEI4 $951
line 2808
;2808:	{	// Use the table to generate the muzzlepoint;
line 2809
;2809:		{	// Crouching.  Use the add-to-Z method to adjust vertically.
line 2810
;2810:			VectorMA(muzzlePoint, muzzleOffPoint[0], forward, muzzlePoint);
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 28
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 36
ADDRFP4 16
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2811
;2811:			VectorMA(muzzlePoint, muzzleOffPoint[1], right, muzzlePoint);
ADDRLP4 40
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRLP4 48
ADDRFP4 16
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 52
CNSTI4 8
ASGNI4
ADDRLP4 56
ADDRFP4 16
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2812
;2812:			muzzlePoint[2] += ent->client->ps.viewheight + muzzleOffPoint[2];
ADDRLP4 60
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
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
ADDRLP4 0+8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 2814
;2813:			// VectorMA(muzzlePoint, ent->client->ps.viewheight + WP_MuzzlePoint[weapontype][2], up, muzzlePoint);
;2814:		}
line 2815
;2815:	}
LABELV $951
line 2824
;2816:#else	// Test code
;2817:	muzzlePoint[2] += ent->client->ps.viewheight;//By eyes
;2818:	muzzlePoint[2] += g_debugUp.value;
;2819:	VectorMA( muzzlePoint, g_debugForward.value, forward, muzzlePoint);
;2820:	VectorMA( muzzlePoint, g_debugRight.value, right, muzzlePoint);
;2821:#endif
;2822:
;2823:	// snap to integer coordinates for more efficient network bandwidth usage
;2824:	SnapVector( muzzlePoint );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 24
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2825
;2825:}
LABELV $939
endproc CalcMuzzlePoint 64 0
export CalcMuzzlePointOrigin
proc CalcMuzzlePointOrigin 36 0
line 2834
;2826:
;2827:/*
;2828:===============
;2829:CalcMuzzlePointOrigin
;2830:
;2831:set muzzle location relative to pivoting eye
;2832:===============
;2833:*/
;2834:void CalcMuzzlePointOrigin ( gentity_t *ent, vec3_t origin, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) {
line 2835
;2835:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2836
;2836:	muzzlePoint[2] += ent->client->ps.viewheight;
ADDRLP4 0
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
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
line 2837
;2837:	VectorMA( muzzlePoint, 14, forward, muzzlePoint );
ADDRLP4 4
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 12
ADDRFP4 20
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16
CNSTI4 8
ASGNI4
ADDRLP4 20
ADDRFP4 20
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CNSTF4 1096810496
ADDRFP4 8
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2839
;2838:	// snap to integer coordinates for more efficient network bandwidth usage
;2839:	SnapVector( muzzlePoint );
ADDRLP4 24
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 32
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 2840
;2840:}
LABELV $957
endproc CalcMuzzlePointOrigin 36 0
export FireWeapon
proc FireWeapon 16 20
line 2849
;2841:
;2842:
;2843:
;2844:/*
;2845:===============
;2846:FireWeapon
;2847:===============
;2848:*/
;2849:void FireWeapon( gentity_t *ent, qboolean altFire ) {
line 2850
;2850:	if (ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $959
line 2853
;2851:		//if (ent->client->pers.amfreeze)
;2852:		//	return;
;2853:		if (ent->client->sess.raceMode && !MovementStyleAllowsWeapons(ent->client->sess.raceStyle.movementStyle)) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $961
ADDRLP4 0
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 4
ADDRGP4 MovementStyleAllowsWeapons
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $961
line 2854
;2854:			if (ent->s.weapon == WP_DISRUPTOR || ent->s.weapon == WP_STUN_BATON) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 5
EQI4 $965
ADDRLP4 8
INDIRI4
CNSTI4 1
NEI4 $958
LABELV $965
line 2856
;2855:				// allow these (main weapons) to shoot open doors and such
;2856:			} else{
line 2857
;2857:				return;
LABELV $964
line 2859
;2858:			}
;2859:		}
LABELV $961
line 2860
;2860:	}
LABELV $959
line 2862
;2861:
;2862:	if (ent->client->ps.powerups[PW_QUAD] ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $966
line 2863
;2863:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 2864
;2864:	} else {
ADDRGP4 $967
JUMPV
LABELV $966
line 2865
;2865:		s_quadFactor = 1;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 2866
;2866:	}
LABELV $967
line 2869
;2867:
;2868:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;2869:	if( ent->s.weapon != WP_SABER && ent->s.weapon != WP_STUN_BATON ) 
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $969
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $969
line 2870
;2870:	{
line 2871
;2871:		if( ent->s.weapon == WP_FLECHETTE ) {
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 9
NEI4 $971
line 2872
;2872:			ent->client->accuracy_shots += altFire ? FLECHETTE_ALT_SHOTS : FLECHETTE_SHOTS;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $974
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRGP4 $975
JUMPV
LABELV $974
ADDRLP4 4
CNSTI4 5
ASGNI4
LABELV $975
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43664
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 2873
;2873:		} else {
ADDRGP4 $972
JUMPV
LABELV $971
line 2874
;2874:			ent->client->accuracy_shots++;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43664
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2875
;2875:		}
LABELV $972
line 2876
;2876:	}
LABELV $969
line 2879
;2877:
;2878:	// set aiming directions
;2879:	if (ent->s.weapon == WP_EMPLACED_GUN)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 14
NEI4 $976
line 2880
;2880:	{
line 2883
;2881:		vec3_t viewAngCap;
;2882:
;2883:		VectorCopy(ent->client->ps.viewangles, viewAngCap);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2884
;2884:		if (viewAngCap[PITCH] > 40)
ADDRLP4 4
INDIRF4
CNSTF4 1109393408
LEF4 $978
line 2885
;2885:		{
line 2886
;2886:			viewAngCap[PITCH] = 40;
ADDRLP4 4
CNSTF4 1109393408
ASGNF4
line 2887
;2887:		}
LABELV $978
line 2888
;2888:		AngleVectors( viewAngCap, forward, right, up );
ADDRLP4 4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2889
;2889:	}
ADDRGP4 $977
JUMPV
LABELV $976
line 2891
;2890:	else
;2891:	{
line 2892
;2892:		AngleVectors( ent->client->ps.viewangles, forward, right, up );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2893
;2893:	}
LABELV $977
line 2895
;2894:
;2895:	if (ent->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $980
line 2896
;2896:	{
line 2897
;2897:		gentity_t *headEnt = &g_entities[ent->client->damageBoxHandle_Head];
ADDRLP4 4
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43648
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2899
;2898:
;2899:		if (headEnt && headEnt->s.number >= MAX_CLIENTS)
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $982
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
LTI4 $982
line 2900
;2900:		{
line 2901
;2901:			if (altFire)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $984
line 2902
;2902:			{
line 2903
;2903:				headEnt->bolt_Waist = 0;
ADDRLP4 4
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 0
ASGNI4
line 2904
;2904:			}
ADDRGP4 $985
JUMPV
LABELV $984
line 2906
;2905:			else
;2906:			{
line 2907
;2907:				headEnt->bolt_Waist = 1;
ADDRLP4 4
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 1
ASGNI4
line 2908
;2908:			}
LABELV $985
line 2909
;2909:		}
LABELV $982
line 2910
;2910:	}
LABELV $980
line 2913
;2911:
;2912://	CalcMuzzlePointOrigin ( ent, ent->client->oldOrigin, forward, right, up, muzzle );
;2913:	CalcMuzzlePoint ( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePoint
CALLV
pop
line 2915
;2914:
;2915:	if (ent->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $986
line 2916
;2916:	{
line 2917
;2917:		WP_FireBryarPistol( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_FireBryarPistol
CALLV
pop
line 2918
;2918:		return;
ADDRGP4 $958
JUMPV
LABELV $986
line 2922
;2919:	}
;2920:
;2921:	// fire the specific weapon
;2922:	switch( ent->s.weapon ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $989
ADDRLP4 4
INDIRI4
CNSTI4 14
GTI4 $989
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1005-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1005
address $991
address $989
address $993
address $994
address $995
address $996
address $997
address $998
address $999
address $1000
address $1001
address $1002
address $1003
address $1004
code
LABELV $991
line 2924
;2923:	case WP_STUN_BATON:
;2924:		WP_FireStunBaton( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireStunBaton
CALLV
pop
line 2925
;2925:		break;
ADDRGP4 $989
JUMPV
line 2928
;2926:
;2927:	case WP_SABER:
;2928:		break;
LABELV $993
line 2931
;2929:
;2930:	case WP_BRYAR_PISTOL:
;2931:		WP_FireBryarPistol( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBryarPistol
CALLV
pop
line 2932
;2932:		break;
ADDRGP4 $989
JUMPV
LABELV $994
line 2935
;2933:
;2934:	case WP_BLASTER:
;2935:		WP_FireBlaster( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBlaster
CALLV
pop
line 2936
;2936:		break;
ADDRGP4 $989
JUMPV
LABELV $995
line 2939
;2937:
;2938:	case WP_DISRUPTOR:
;2939:		WP_FireDisruptor( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireDisruptor
CALLV
pop
line 2940
;2940:		break;
ADDRGP4 $989
JUMPV
LABELV $996
line 2943
;2941:
;2942:	case WP_BOWCASTER:
;2943:		WP_FireBowcaster( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBowcaster
CALLV
pop
line 2944
;2944:		break;
ADDRGP4 $989
JUMPV
LABELV $997
line 2947
;2945:
;2946:	case WP_REPEATER:
;2947:		WP_FireRepeater( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireRepeater
CALLV
pop
line 2948
;2948:		break;
ADDRGP4 $989
JUMPV
LABELV $998
line 2951
;2949:
;2950:	case WP_DEMP2:
;2951:		WP_FireDEMP2( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireDEMP2
CALLV
pop
line 2952
;2952:		break;
ADDRGP4 $989
JUMPV
LABELV $999
line 2955
;2953:
;2954:	case WP_FLECHETTE:
;2955:		WP_FireFlechette( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireFlechette
CALLV
pop
line 2956
;2956:		break;
ADDRGP4 $989
JUMPV
LABELV $1000
line 2959
;2957:
;2958:	case WP_ROCKET_LAUNCHER:
;2959:		WP_FireRocket( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireRocket
CALLV
pop
line 2960
;2960:		break;
ADDRGP4 $989
JUMPV
LABELV $1001
line 2963
;2961:
;2962:	case WP_THERMAL:
;2963:		WP_FireThermalDetonator( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireThermalDetonator
CALLP4
pop
line 2964
;2964:		break;
ADDRGP4 $989
JUMPV
LABELV $1002
line 2967
;2965:
;2966:	case WP_TRIP_MINE:
;2967:		WP_PlaceLaserTrap( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_PlaceLaserTrap
CALLV
pop
line 2968
;2968:		break;
ADDRGP4 $989
JUMPV
LABELV $1003
line 2971
;2969:
;2970:	case WP_DET_PACK:
;2971:		WP_DropDetPack( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_DropDetPack
CALLV
pop
line 2972
;2972:		break;
ADDRGP4 $989
JUMPV
LABELV $1004
line 2975
;2973:
;2974:	case WP_EMPLACED_GUN:
;2975:		WP_FireEmplaced( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireEmplaced
CALLV
pop
line 2976
;2976:		break;
line 2979
;2977:	default:
;2978:// FIXME		G_Error( "Bad ent->s.weapon" );
;2979:		break;
LABELV $989
line 2982
;2980:	}
;2981:
;2982:	G_LogWeaponFire(ent->s.number, ent->s.weapon);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponFire
CALLV
pop
line 2983
;2983:}
LABELV $958
endproc FireWeapon 16 20
export AnimEntCalcMuzzlePoint
proc AnimEntCalcMuzzlePoint 64 0
line 2986
;2984:
;2985:void AnimEntCalcMuzzlePoint ( gentity_t *ent, vec3_t forward, vec3_t right, vec3_t up, vec3_t muzzlePoint ) 
;2986:{
line 2990
;2987:	int weapontype;
;2988:	vec3_t muzzleOffPoint;
;2989:
;2990:	weapontype = ent->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 2991
;2991:	VectorCopy( ent->s.pos.trBase, muzzlePoint );
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2993
;2992:
;2993:	VectorCopy(WP_MuzzlePoint[weapontype], muzzleOffPoint);
ADDRLP4 0
CNSTI4 12
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 WP_MuzzlePoint
ADDP4
INDIRB
ASGNB 12
line 2995
;2994:
;2995:	if (weapontype > WP_NONE && weapontype < WP_NUM_WEAPONS)
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $1008
ADDRLP4 12
INDIRI4
CNSTI4 16
GEI4 $1008
line 2996
;2996:	{	// Use the table to generate the muzzlepoint;
line 2997
;2997:		{	// Crouching.  Use the add-to-Z method to adjust vertically.
line 2998
;2998:			VectorMA(muzzlePoint, muzzleOffPoint[0], forward, muzzlePoint);
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRLP4 28
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 36
ADDRFP4 16
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2999
;2999:			VectorMA(muzzlePoint, muzzleOffPoint[1], right, muzzlePoint);
ADDRLP4 40
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRLP4 48
ADDRFP4 16
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 52
CNSTI4 8
ASGNI4
ADDRLP4 56
ADDRFP4 16
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3000
;3000:			muzzlePoint[2] += 24 + muzzleOffPoint[2];
ADDRLP4 60
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
CNSTF4 1103101952
ADDF4
ADDF4
ASGNF4
line 3001
;3001:		}
line 3002
;3002:	}
LABELV $1008
line 3005
;3003:
;3004:	// snap to integer coordinates for more efficient network bandwidth usage
;3005:	SnapVector( muzzlePoint );
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 24
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 3006
;3006:}
LABELV $1007
endproc AnimEntCalcMuzzlePoint 64 0
export AnimEntFireWeapon
proc AnimEntFireWeapon 20 20
line 3009
;3007:
;3008:void AnimEntFireWeapon( gentity_t *ent, qboolean altFire )
;3009:{
line 3011
;3010:	vec3_t modifiedAngles;
;3011:	VectorCopy(ent->s.apos.trBase, modifiedAngles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 3013
;3012://	modifiedAngles[PITCH] = -modifiedAngles[PITCH];
;3013:	if (modifiedAngles[PITCH] < -180)
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $1015
line 3014
;3014:	{
line 3015
;3015:		modifiedAngles[PITCH] += 90;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 3016
;3016:	}
LABELV $1015
line 3017
;3017:	AngleVectors( modifiedAngles, forward, right, up );
ADDRLP4 0
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3019
;3018:
;3019:	AnimEntCalcMuzzlePoint ( ent, forward, right, up, muzzle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 AnimEntCalcMuzzlePoint
CALLV
pop
line 3025
;3020:
;3021:	//rww - NOTE: I have only tested the bryar, blaster, and disruptor for weapon firing.
;3022:	//Other routines will likely have a client pointer reference in them and cause a crash.
;3023:
;3024:	// fire the specific weapon
;3025:	switch( ent->s.weapon )
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LTI4 $1018
ADDRLP4 12
INDIRI4
CNSTI4 14
GTI4 $1018
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1034-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1034
address $1020
address $1018
address $1022
address $1023
address $1024
address $1025
address $1026
address $1027
address $1028
address $1029
address $1030
address $1031
address $1032
address $1033
code
line 3026
;3026:	{
LABELV $1020
line 3028
;3027:	case WP_STUN_BATON:
;3028:		WP_FireStunBaton( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireStunBaton
CALLV
pop
line 3029
;3029:		break;
ADDRGP4 $1018
JUMPV
line 3032
;3030:
;3031:	case WP_SABER:
;3032:		break;
LABELV $1022
line 3035
;3033:
;3034:	case WP_BRYAR_PISTOL:
;3035:		WP_FireBryarPistol( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBryarPistol
CALLV
pop
line 3036
;3036:		break;
ADDRGP4 $1018
JUMPV
LABELV $1023
line 3039
;3037:
;3038:	case WP_BLASTER:
;3039:		WP_FireBlaster( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBlaster
CALLV
pop
line 3040
;3040:		break;
ADDRGP4 $1018
JUMPV
LABELV $1024
line 3043
;3041:
;3042:	case WP_DISRUPTOR:
;3043:		WP_FireDisruptor( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireDisruptor
CALLV
pop
line 3044
;3044:		break;
ADDRGP4 $1018
JUMPV
LABELV $1025
line 3047
;3045:
;3046:	case WP_BOWCASTER:
;3047:		WP_FireBowcaster( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireBowcaster
CALLV
pop
line 3048
;3048:		break;
ADDRGP4 $1018
JUMPV
LABELV $1026
line 3051
;3049:
;3050:	case WP_REPEATER:
;3051:		WP_FireRepeater( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireRepeater
CALLV
pop
line 3052
;3052:		break;
ADDRGP4 $1018
JUMPV
LABELV $1027
line 3055
;3053:
;3054:	case WP_DEMP2:
;3055:		WP_FireDEMP2( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireDEMP2
CALLV
pop
line 3056
;3056:		break;
ADDRGP4 $1018
JUMPV
LABELV $1028
line 3059
;3057:
;3058:	case WP_FLECHETTE:
;3059:		WP_FireFlechette( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireFlechette
CALLV
pop
line 3060
;3060:		break;
ADDRGP4 $1018
JUMPV
LABELV $1029
line 3063
;3061:
;3062:	case WP_ROCKET_LAUNCHER:
;3063:		WP_FireRocket( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireRocket
CALLV
pop
line 3064
;3064:		break;
ADDRGP4 $1018
JUMPV
LABELV $1030
line 3067
;3065:
;3066:	case WP_THERMAL:
;3067:		WP_FireThermalDetonator( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireThermalDetonator
CALLP4
pop
line 3068
;3068:		break;
ADDRGP4 $1018
JUMPV
LABELV $1031
line 3071
;3069:
;3070:	case WP_TRIP_MINE:
;3071:		WP_PlaceLaserTrap( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_PlaceLaserTrap
CALLV
pop
line 3072
;3072:		break;
ADDRGP4 $1018
JUMPV
LABELV $1032
line 3075
;3073:
;3074:	case WP_DET_PACK:
;3075:		WP_DropDetPack( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_DropDetPack
CALLV
pop
line 3076
;3076:		break;
ADDRGP4 $1018
JUMPV
LABELV $1033
line 3079
;3077:
;3078:	case WP_EMPLACED_GUN:
;3079:		WP_FireEmplaced( ent, altFire );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 WP_FireEmplaced
CALLV
pop
line 3080
;3080:		break;
line 3082
;3081:	default:
;3082:		break;
LABELV $1018
line 3084
;3083:	}
;3084:}
LABELV $1014
endproc AnimEntFireWeapon 20 20
proc WP_FireEmplaced 64 20
line 3089
;3085:
;3086://---------------------------------------------------------
;3087:static void WP_FireEmplaced( gentity_t *ent, qboolean altFire )
;3088://---------------------------------------------------------
;3089:{
line 3095
;3090:	vec3_t	dir, angs, gunpoint; //g2r , gunaxis;
;3091:	vec3_t	right;
;3092:	gentity_t *gun;
;3093://	mdxaBone_t matrix;
;3094:
;3095:	if (!ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1037
line 3096
;3096:	{
line 3097
;3097:		return;
ADDRGP4 $1036
JUMPV
LABELV $1037
line 3100
;3098:	}
;3099:
;3100:	if (!ent->client->ps.emplacedIndex)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1039
line 3101
;3101:	{
line 3102
;3102:		return;
ADDRGP4 $1036
JUMPV
LABELV $1039
line 3105
;3103:	}
;3104:
;3105:	gun = &g_entities[ent->client->ps.emplacedIndex];
ADDRLP4 0
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3107
;3106:
;3107:	if (!gun)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1041
line 3108
;3108:	{
line 3109
;3109:		return;
ADDRGP4 $1036
JUMPV
LABELV $1041
line 3112
;3110:	}
;3111:
;3112:	VectorCopy(/*ent->client->ps.origin*/gun->s.origin, gunpoint);
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3113
;3113:	gunpoint[2] += 46;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1110966272
ADDF4
ASGNF4
line 3115
;3114:
;3115:	AngleVectors(ent->client->ps.viewangles, NULL, right, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 52
CNSTP4 0
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3117
;3116:
;3117:	if (gun->bolt_Waist)
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1044
line 3118
;3118:	{
line 3119
;3119:		gunpoint[0] += right[0]*10;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1092616192
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 3120
;3120:		gunpoint[1] += right[1]*10;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1092616192
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3121
;3121:		gunpoint[2] += right[2]*10;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1092616192
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3123
;3122:
;3123:		gun->bolt_Waist = 0;
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 0
ASGNI4
line 3124
;3124:		G_AddEvent(gun, EV_FIRE_WEAPON, 0);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 24
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 3125
;3125:	}
ADDRGP4 $1045
JUMPV
LABELV $1044
line 3127
;3126:	else
;3127:	{
line 3128
;3128:		gunpoint[0] -= right[0]*10;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1092616192
ADDRLP4 16
INDIRF4
MULF4
SUBF4
ASGNF4
line 3129
;3129:		gunpoint[1] -= right[1]*10;
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1092616192
ADDRLP4 16+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 3130
;3130:		gunpoint[2] -= right[2]*10;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1092616192
ADDRLP4 16+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 3131
;3131:		gun->bolt_Waist = 1;
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 1
ASGNI4
line 3132
;3132:		G_AddEvent(gun, EV_FIRE_WEAPON, 1);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 24
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 3133
;3133:	}
LABELV $1045
line 3135
;3134:
;3135:	vectoangles( forward, angs );
ADDRGP4 forward
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3137
;3136:
;3137:	if ( altFire )
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1054
line 3138
;3138:	{
line 3140
;3139:		// add some slop to the alt-fire direction
;3140:		angs[PITCH] += crandom() * BLASTER_SPREAD;
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 28
INDIRF4
CNSTF4 1070386381
CNSTF4 1073741824
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 3141
;3141:		angs[YAW]	+= crandom() * BLASTER_SPREAD;
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28+4
ADDRLP4 28+4
INDIRF4
CNSTF4 1070386381
CNSTF4 1073741824
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
CNSTF4 1056964608
SUBF4
MULF4
MULF4
ADDF4
ASGNF4
line 3142
;3142:	}
LABELV $1054
line 3144
;3143:
;3144:	AngleVectors( angs, dir, NULL, NULL );
ADDRLP4 28
ARGP4
ADDRLP4 40
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
line 3148
;3145:
;3146:	// FIXME: if temp_org does not have clear trace to inside the bbox, don't shoot!
;3147:	//WP_FireEmplacedMissile( ent, gunpoint, dir, altFire, gun );
;3148:	WP_FireEmplacedMissile( gun, gunpoint, dir, altFire, ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 40
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_FireEmplacedMissile
CALLV
pop
line 3150
;3149:	//WP_FireTurretMissile(gun, gunpoint, dir, altFire, 15, 2000, MOD_BLASTER, ent);
;3150:}
LABELV $1036
endproc WP_FireEmplaced 64 20
export emplaced_gun_use
proc emplaced_gun_use 124 16
line 3163
;3151:
;3152:#define EMPLACED_CANRESPAWN 1
;3153:
;3154://----------------------------------------------------------
;3155:
;3156:/*QUAKED emplaced_gun (0 0 1) (-30 -20 8) (30 20 60) CANRESPAWN
;3157:
;3158: count - if CANRESPAWN spawnflag, decides how long it is before gun respawns (in ms)
;3159:*/
;3160: 
;3161://----------------------------------------------------------
;3162:void emplaced_gun_use( gentity_t *self, gentity_t *other, trace_t *trace )
;3163:{
line 3167
;3164:	vec3_t fwd1, fwd2;
;3165:	float dot;
;3166:	int oldWeapon;
;3167:	gentity_t *activator = other;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
line 3168
;3168:	float zoffset = 50;
ADDRLP4 64
CNSTF4 1112014848
ASGNF4
line 3171
;3169:	vec3_t anglesToOwner;
;3170:	vec3_t vLen;
;3171:	float ownLen = 0;
ADDRLP4 56
CNSTF4 0
ASGNF4
line 3172
;3172:	int nowTime = LEVELTIME(activator->client);
ADDRLP4 80
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1062
ADDRLP4 80
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1062
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1064
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1065
JUMPV
LABELV $1064
ADDRLP4 76
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1065
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
ADDRGP4 $1063
JUMPV
LABELV $1062
ADDRLP4 72
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1063
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
line 3174
;3173:
;3174:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1066
line 3175
;3175:	{
line 3177
;3176:		// can't use a dead gun.
;3177:		return;
ADDRGP4 $1057
JUMPV
LABELV $1066
line 3180
;3178:	}
;3179:
;3180:	if (self->activator)
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1068
line 3181
;3181:	{
line 3182
;3182:		return;
ADDRGP4 $1057
JUMPV
LABELV $1068
line 3185
;3183:	}
;3184:
;3185:	if (!activator->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1070
line 3186
;3186:	{
line 3187
;3187:		return;
ADDRGP4 $1057
JUMPV
LABELV $1070
line 3190
;3188:	}
;3189:
;3190:	if (activator->client->ps.emplacedTime > nowTime)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 600
ADDP4
INDIRF4
ADDRLP4 68
INDIRI4
CVIF4 4
LEF4 $1072
line 3191
;3191:	{
line 3192
;3192:		return;
ADDRGP4 $1057
JUMPV
LABELV $1072
line 3195
;3193:	}
;3194:
;3195:	if (activator->client->ps.weaponTime > 0)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1074
line 3196
;3196:	{
line 3197
;3197:		return;
ADDRGP4 $1057
JUMPV
LABELV $1074
line 3200
;3198:	}
;3199:
;3200:	if (activator->client->ps.origin[2] > self->s.origin[2]+zoffset-8)
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
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 64
INDIRF4
ADDF4
CNSTF4 1090519040
SUBF4
LEF4 $1076
line 3201
;3201:	{
line 3202
;3202:		return;
ADDRGP4 $1057
JUMPV
LABELV $1076
line 3205
;3203:	} //can't use it from the top
;3204:
;3205:	if (activator->client->ps.pm_flags & PMF_DUCKED)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1078
line 3206
;3206:	{
line 3207
;3207:		return;
ADDRGP4 $1057
JUMPV
LABELV $1078
line 3210
;3208:	}
;3209:
;3210:	if (activator->client->ps.isJediMaster)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1080
line 3211
;3211:	{ //;O
line 3212
;3212:		return;
ADDRGP4 $1057
JUMPV
LABELV $1080
line 3215
;3213:	}
;3214:
;3215:	VectorSubtract(self->s.origin, activator->client->ps.origin, vLen);
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 44
ADDRLP4 84
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44+4
ADDRLP4 84
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3216
;3216:	ownLen = VectorLength(vLen);
ADDRLP4 44
ARGP4
ADDRLP4 92
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 92
INDIRF4
ASGNF4
line 3218
;3217:
;3218:	if (ownLen > 64)
ADDRLP4 56
INDIRF4
CNSTF4 1115684864
LEF4 $1084
line 3219
;3219:	{
line 3220
;3220:		return;
ADDRGP4 $1057
JUMPV
LABELV $1084
line 3224
;3221:	}
;3222:
;3223:	// Let's get some direction vectors for the users
;3224:	AngleVectors( activator->client->ps.viewangles, fwd1, NULL, NULL );
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 96
CNSTP4 0
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3227
;3225:
;3226:	// Get the guns direction vector
;3227:	AngleVectors( self->pos1, fwd2, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ARGP4
ADDRLP4 16
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
ADDRGP4 AngleVectors
CALLV
pop
line 3229
;3228:
;3229:	dot = DotProduct( fwd1, fwd2 );
ADDRLP4 40
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3232
;3230:
;3231:	// Must be reasonably facing the way the gun points ( 110 degrees or so ), otherwise we don't allow to use it.
;3232:	if ( dot < -0.2f )
ADDRLP4 40
INDIRF4
CNSTF4 3192704205
GEF4 $1090
line 3233
;3233:	{
line 3234
;3234:		return;
ADDRGP4 $1057
JUMPV
LABELV $1090
line 3237
;3235:	}
;3236:
;3237:	VectorSubtract(self->s.origin, activator->client->ps.origin, fwd1);
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 104
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 108
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 104
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 108
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3238
;3238:	VectorNormalize(fwd1);
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3240
;3239:
;3240:	dot = DotProduct( fwd1, fwd2 );
ADDRLP4 40
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3243
;3241:
;3242:	// Must be reasonably facing the way the gun points ( 110 degrees or so ), otherwise we don't allow to use it.
;3243:	if ( dot < /*-0.2f*/0.6f/*0.8f*/ )
ADDRLP4 40
INDIRF4
CNSTF4 1058642330
GEF4 $1098
line 3244
;3244:	{
line 3245
;3245:		return;
ADDRGP4 $1057
JUMPV
LABELV $1098
line 3248
;3246:	}
;3247:
;3248:	self->boltpoint1 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 1
ASGNI4
line 3253
;3249:
;3250:	// don't allow using it again for half a second
;3251://	if ( activator->s.number == 0 && self->delay + 500 < level.time )
;3252://	{
;3253:		oldWeapon = activator->s.weapon;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 3256
;3254:
;3255:		// swap the users weapon with the emplaced gun and add the ammo the gun has to the player
;3256:		activator->client->ps.weapon = self->s.weapon;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 3257
;3257:		activator->client->ps.weaponstate = WEAPON_READY;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 3258
;3258:		activator->client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_EMPLACED_GUN );
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 3262
;3259:
;3260:		//SnapVector(self->s.origin);
;3261:
;3262:		VectorCopy(activator->client->ps.origin, self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3264
;3263:
;3264:		activator->client->ps.emplacedIndex = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3266
;3265:
;3266:		self->s.emplacedOwner = activator->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 3267
;3267:		self->s.activeForcePass = NUM_FORCE_POWERS+1;
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 19
ASGNI4
line 3270
;3268:
;3269:		// the gun will track which weapon we used to have
;3270:		self->s.weapon = oldWeapon;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 3274
;3271:
;3272:		// Lock the player
;3273://		activator->client->ps.eFlags |= EF_LOCKED_TO_WEAPON;
;3274:		activator->r.ownerNum = self->s.number; // kind of dumb, but when we are locked to the weapon, we are owned by it.
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3276
;3275:		//self->activator = activator;
;3276:		G_SetActivator(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 3301
;3277://		self->delay = level.time; // can't disconnect from the thing for half a second
;3278:
;3279:		// Let the client know that we want to start our emplaced camera clamping
;3280:		// FIXME:  if you are in the gun and you switch/restart maps, emplacedClamp will still be 1 and since
;3281:		//	you can't change it from the console, you are stuck with really bad viewangles
;3282://		char	temp[32];
;3283://		gi.cvar_set("cl_emplacedClamp", "1");
;3284://		sprintf( temp, "%f", self->pos1[0] );
;3285://		gi.cvar_set("cl_emplacedPitch", temp );
;3286://		sprintf( temp, "%f", self->pos1[1] );
;3287://		gi.cvar_set("cl_emplacedYaw", temp );
;3288:
;3289:		// Let the gun be considered an enemy
;3290://		self->svFlags |= SVF_NONNPC_ENEMY;
;3291:
;3292:		// move the player to the center of the gun and make player not solid
;3293://		activator->contents = 0;
;3294://		VectorCopy( self->currentOrigin, activator->client->ps.origin );
;3295:
;3296:		// FIXME: trying to force the gun to look forward, but it seems to pick up the players viewangles....and
;3297:		//	since you usually go up to the side of the gun to use it, you end up starting with a really annoying
;3298:		//	set of viewangles.
;3299:		//G_SetAngles( activator, self->s.angles );
;3300:
;3301:		VectorSubtract(self->r.currentOrigin, activator->client->ps.origin, anglesToOwner);
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 28
ADDRLP4 116
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 116
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 120
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
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3302
;3302:		vectoangles(anglesToOwner, anglesToOwner);
ADDRLP4 28
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3312
;3303:
;3304:		//SetClientViewAngle(activator, /*self->s.angles*/anglesToOwner);
;3305:
;3306://		VectorCopy(activator->s.angles, self->pos1);
;3307:
;3308:		// Overriding these may be a bad thing....
;3309://		gi.cvar_set("cg_thirdPersonRange", "20");
;3310://		gi.cvar_set("cg_thirdPersonVertOffset", "35");
;3311://	}
;3312:}
LABELV $1057
endproc emplaced_gun_use 124 16
export emplaced_gun_realuse
proc emplaced_gun_realuse 0 12
line 3315
;3313:
;3314:void emplaced_gun_realuse( gentity_t *self, gentity_t *other, gentity_t *activator )
;3315:{
line 3316
;3316:	emplaced_gun_use(self, other, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 emplaced_gun_use
CALLV
pop
line 3317
;3317:}
LABELV $1102
endproc emplaced_gun_realuse 0 12
export emplaced_gun_pain
proc emplaced_gun_pain 0 0
line 3321
;3318:
;3319://----------------------------------------------------------
;3320:void emplaced_gun_pain( gentity_t *self, gentity_t *attacker, int damage )
;3321:{
line 3322
;3322:	if ( self->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1104
line 3323
;3323:	{
line 3325
;3324:		// play pain effect?
;3325:	}
LABELV $1104
line 3327
;3326:	else
;3327:	{
line 3335
;3328://		if ( self->paintarget )
;3329://		{
;3330://			G_UseTargets2( self, self->activator, self->paintarget );
;3331://		}
;3332:
;3333:		//Don't do script if dead
;3334://		G_ActivateBehavior( self, BSET_PAIN );
;3335:	}
LABELV $1105
line 3336
;3336:}
LABELV $1103
endproc emplaced_gun_pain 0 0
export emplaced_gun_update
proc emplaced_gun_update 104 24
line 3342
;3337:
;3338:#define EMPLACED_GUN_HEALTH 800
;3339:
;3340://----------------------------------------------------------
;3341:void emplaced_gun_update(gentity_t *self)
;3342:{
line 3345
;3343:	vec3_t	smokeOrg, puffAngle;
;3344:	int oldWeap;
;3345:	float ownLen = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 3347
;3346:
;3347:	if (self->health < 1 && !self->bolt_Head)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1107
ADDRLP4 32
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1107
line 3348
;3348:	{
line 3349
;3349:		if (self->spawnflags & EMPLACED_CANRESPAWN)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1108
line 3350
;3350:		{
line 3351
;3351:			self->bolt_Head = level.time + 4000 + self->count;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 828
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 4000
ADDI4
ADDRLP4 36
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ADDI4
ASGNI4
line 3352
;3352:		}
line 3353
;3353:	}
ADDRGP4 $1108
JUMPV
LABELV $1107
line 3354
;3354:	else if (self->health < 1 && self->bolt_Head < level.time)
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1112
ADDRLP4 36
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1112
line 3355
;3355:	{
line 3356
;3356:		self->s.time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 0
ASGNI4
line 3357
;3357:		self->boltpoint4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 0
ASGNI4
line 3358
;3358:		self->boltpoint3 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTI4 0
ASGNI4
line 3359
;3359:		self->health = EMPLACED_GUN_HEALTH*0.4;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 320
ASGNI4
line 3360
;3360:	}
LABELV $1112
LABELV $1108
line 3362
;3361:
;3362:	if (self->boltpoint4 && self->boltpoint4 < 2 && self->s.time < level.time)
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $1115
ADDRLP4 44
INDIRI4
CNSTI4 2
GEI4 $1115
ADDRLP4 40
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1115
line 3363
;3363:	{
line 3366
;3364:		vec3_t explOrg;
;3365:
;3366:		VectorSet( puffAngle, 0, 0, 1 );
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 0
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 3368
;3367:
;3368:		VectorCopy(self->r.currentOrigin, explOrg);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 3369
;3369:		explOrg[2] += 16;
ADDRLP4 48+8
ADDRLP4 48+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 3372
;3370:
;3371:		//G_PlayEffect(EFFECT_EXPLOSION, explOrg, /*self->r.currentAngles*/puffAngle);
;3372:		G_PlayEffect(EFFECT_EXPLOSION_DETPACK, explOrg, /*self->r.currentAngles*/puffAngle);
CNSTI4 6
ARGI4
ADDRLP4 48
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 3374
;3373:
;3374:		self->boltpoint3 = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 2500, 3500, g_defrag.integer, 3000);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 2500
ARGI4
CNSTI4 3500
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 64
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 64
INDIRI4
ADDI4
ASGNI4
line 3376
;3375:
;3376:		G_RadiusDamage(self->r.currentOrigin, self, self->splashDamage, self->splashRadius, self, MOD_UNKNOWN);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 68
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 3378
;3377:
;3378:		self->s.time = -1;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 -1
ASGNI4
line 3380
;3379:
;3380:		self->boltpoint4 = 2;
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 2
ASGNI4
line 3381
;3381:	}
LABELV $1115
line 3383
;3382:
;3383:	if (self->boltpoint3 > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $1123
line 3384
;3384:	{
line 3385
;3385:		if (self->boltpoint2 < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1126
line 3386
;3386:		{
line 3387
;3387:			VectorSet( puffAngle, 0, 0, 1 );
ADDRLP4 48
CNSTF4 0
ASGNF4
ADDRLP4 0
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 3388
;3388:			VectorCopy(self->r.currentOrigin, smokeOrg);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 3390
;3389:
;3390:			smokeOrg[2] += 60;
ADDRLP4 20+8
ADDRLP4 20+8
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 3393
;3391:
;3392:			//What.. was I thinking?
;3393:			G_PlayEffect(EFFECT_SMOKE, smokeOrg, puffAngle);
CNSTI4 1
ARGI4
ADDRLP4 20
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 3395
;3394:
;3395:			self->boltpoint2 = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 250, 400, qfalse, 325);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 250
ARGI4
CNSTI4 400
ARGI4
CNSTI4 0
ARGI4
CNSTI4 325
ARGI4
ADDRLP4 52
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 52
INDIRI4
ADDI4
ASGNI4
line 3399
;3396:			//This would be much better if we checked a value on the entity on the client
;3397:			//and then spawned smoke there instead of sending over a bunch of events. But
;3398:			//this will do for now, an event every 250-400ms isn't too bad.
;3399:		}
LABELV $1126
line 3400
;3400:	}
LABELV $1123
line 3402
;3401:
;3402:	if (self->activator && self->activator->client && self->activator->inuse)
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 748
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
EQU4 $1133
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $1133
ADDRLP4 48
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1133
line 3403
;3403:	{
line 3405
;3404:		vec3_t vLen;
;3405:		VectorSubtract(self->s.origin, self->activator->client->ps.origin, vLen);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
CNSTI4 748
ADDP4
ASGNP4
ADDRLP4 76
CNSTI4 408
ASGNI4
ADDRLP4 56
ADDRLP4 68
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 68
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56+8
ADDRLP4 80
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3406
;3406:		ownLen = VectorLength(vLen);
ADDRLP4 56
ARGP4
ADDRLP4 84
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 84
INDIRF4
ASGNF4
line 3408
;3407:
;3408:		if (!(self->activator->client->pers.cmd.buttons & BUTTON_USE) && self->boltpoint1)
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRLP4 88
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 92
INDIRI4
NEI4 $1137
ADDRLP4 88
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $1137
line 3409
;3409:		{
line 3410
;3410:			self->boltpoint1 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 0
ASGNI4
line 3411
;3411:		}
LABELV $1137
line 3413
;3412:
;3413:		if ((self->activator->client->pers.cmd.buttons & BUTTON_USE) && !self->boltpoint1)
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRLP4 96
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 100
INDIRI4
EQI4 $1139
ADDRLP4 96
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $1139
line 3414
;3414:		{
line 3415
;3415:			self->activator->client->ps.emplacedIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
CNSTI4 0
ASGNI4
line 3416
;3416:			self->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 3417
;3417:			return;
ADDRGP4 $1106
JUMPV
LABELV $1139
line 3419
;3418:		}
;3419:	}
LABELV $1133
line 3421
;3420:
;3421:	if ((self->activator && self->activator->client) &&
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 748
ADDP4
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
EQU4 $1142
ADDRLP4 68
ADDRLP4 60
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $1142
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $1146
ADDRLP4 68
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ADDRLP4 56
INDIRP4
INDIRI4
NEI4 $1146
ADDRLP4 56
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
NEI4 $1146
ADDRLP4 12
INDIRF4
CNSTF4 1115684864
LEF4 $1142
LABELV $1146
line 3423
;3422:		(!self->activator->inuse || self->activator->client->ps.emplacedIndex != self->s.number ||	self->boltpoint4 || ownLen > 64))
;3423:	{
line 3424
;3424:		if (self->activator->client->ps.stats[STAT_WEAPONS] & ( 1 << WP_EMPLACED_GUN ))
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $1147
line 3425
;3425:		{
line 3426
;3426:			self->activator->client->ps.stats[STAT_WEAPONS] -= ( 1 << WP_EMPLACED_GUN );
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 16384
SUBI4
ASGNI4
line 3427
;3427:		}
LABELV $1147
line 3429
;3428:		//VectorCopy(self->s.origin2, self->activator->client->ps.origin);
;3429:		oldWeap = self->activator->client->ps.weapon;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 3430
;3430:		self->activator->client->ps.weapon = self->s.weapon;
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 3431
;3431:		self->s.weapon = oldWeap;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 3432
;3432:		self->activator->r.ownerNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 1023
ASGNI4
line 3433
;3433:		self->activator->client->ps.emplacedTime = LEVELTIME(self->activator->client) + 1000;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1153
ADDRLP4 88
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1153
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1155
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1156
JUMPV
LABELV $1155
ADDRLP4 84
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1156
ADDRLP4 80
ADDRLP4 84
INDIRI4
ASGNI4
ADDRGP4 $1154
JUMPV
LABELV $1153
ADDRLP4 80
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1154
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 600
ADDP4
ADDRLP4 80
INDIRI4
CNSTI4 1000
ADDI4
CVIF4 4
ASGNF4
line 3434
;3434:		self->activator->client->ps.emplacedIndex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 596
ADDP4
CNSTI4 0
ASGNI4
line 3436
;3435:		//self->activator = NULL;
;3436:		G_SetActivator(self, NULL);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 3438
;3437:
;3438:		self->s.activeForcePass = 0;
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 0
ASGNI4
line 3439
;3439:	}
ADDRGP4 $1143
JUMPV
LABELV $1142
line 3440
;3440:	else if (self->activator && self->activator->client)
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
CNSTU4 0
ASGNU4
ADDRLP4 76
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $1157
ADDRLP4 76
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $1157
line 3441
;3441:	{
line 3442
;3442:		self->activator->client->ps.weapon = WP_EMPLACED_GUN;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 14
ASGNI4
line 3443
;3443:		self->activator->client->ps.weaponstate = WEAPON_READY;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 3444
;3444:	}
LABELV $1157
LABELV $1143
line 3445
;3445:	self->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 3446
;3446:}
LABELV $1106
endproc emplaced_gun_update 104 24
export emplaced_gun_die
proc emplaced_gun_die 0 0
line 3450
;3447:
;3448://----------------------------------------------------------
;3449:void emplaced_gun_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod )
;3450:{
line 3451
;3451:	if (self->boltpoint4)
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1161
line 3452
;3452:	{
line 3453
;3453:		return;
ADDRGP4 $1160
JUMPV
LABELV $1161
line 3456
;3454:	}
;3455:
;3456:	self->boltpoint4 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 1
ASGNI4
line 3458
;3457:
;3458:	self->s.time = level.time + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 3460
;3459:
;3460:	self->bolt_Head = 0;
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 0
ASGNI4
line 3461
;3461:}
LABELV $1160
endproc emplaced_gun_die 0 0
lit
align 1
LABELV $1165
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
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
export SP_emplaced_gun
code
proc SP_emplaced_gun 1172 28
line 3464
;3462:
;3463:void SP_emplaced_gun( gentity_t *ent )
;3464:{
line 3466
;3465:	//char name[] = "models/map_objects/imp_mine/turret_chair.glm";
;3466:	char name[] = "models/map_objects/mp/turret_chair.glm";
ADDRLP4 1092
ADDRGP4 $1165
INDIRB
ASGNB 39
line 3470
;3467:	vec3_t down;
;3468:	trace_t tr;
;3469:
;3470:	RegisterItem( BG_FindItemForWeapon(WP_BLASTER) );
CNSTI4 4
ARGI4
ADDRLP4 1132
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 3473
;3471:	//Emplaced gun uses many of the same assets as the blaster, so just precache it
;3472:
;3473:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 3474
;3474:	ent->s.solid = SOLID_BBOX;
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3476
;3475:
;3476:	ent->bolt_Head = 0;
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 0
ASGNI4
line 3478
;3477:
;3478:	VectorSet( ent->r.mins, -30, -20, 8 );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3253731328
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3248488448
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 1090519040
ASGNF4
line 3479
;3479:	VectorSet( ent->r.maxs, 30, 20, 60 );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1106247680
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1101004800
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1114636288
ASGNF4
line 3481
;3480:
;3481:	VectorCopy(ent->s.origin, down);
ADDRLP4 1080
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 3483
;3482:
;3483:	down[2] -= 1024;
ADDRLP4 1080+8
ADDRLP4 1080+8
INDIRF4
CNSTF4 1149239296
SUBF4
ASGNF4
line 3485
;3484:
;3485:	JP_Trace(&tr, ent->s.origin, ent->r.mins, ent->r.maxs, down, ent->s.number, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1136
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1136
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1136
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3487
;3486:
;3487:	if (tr.fraction != 1 && !tr.allsolid && !tr.startsolid)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $1167
ADDRLP4 1140
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1140
INDIRI4
NEI4 $1167
ADDRLP4 0+4
INDIRI4
ADDRLP4 1140
INDIRI4
NEI4 $1167
line 3488
;3488:	{
line 3489
;3489:		VectorCopy(tr.endpos, ent->s.origin);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 3490
;3490:	}
LABELV $1167
line 3492
;3491:
;3492:	ent->spawnflags |= 4; // deadsolid
ADDRLP4 1144
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
ASGNP4
ADDRLP4 1144
INDIRP4
ADDRLP4 1144
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 3494
;3493:
;3494:	ent->health = EMPLACED_GUN_HEALTH;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 800
ASGNI4
line 3496
;3495:
;3496:	if (ent->spawnflags & EMPLACED_CANRESPAWN)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1172
line 3497
;3497:	{ //make it somewhat easier to kill if it can respawn
line 3498
;3498:		ent->health *= 0.4;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTF4 1053609165
ADDRLP4 1148
INDIRP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 3499
;3499:	}
LABELV $1172
line 3501
;3500:
;3501:	ent->boltpoint4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 0
ASGNI4
line 3503
;3502:
;3503:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 3504
;3504:	ent->pain = emplaced_gun_pain;
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRGP4 emplaced_gun_pain
ASGNP4
line 3505
;3505:	ent->die = emplaced_gun_die;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 emplaced_gun_die
ASGNP4
line 3508
;3506:
;3507:	// being caught in this thing when it blows would be really bad.
;3508:	ent->splashDamage = 80;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 80
ASGNI4
line 3509
;3509:	ent->splashRadius = 128;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 128
ASGNI4
line 3515
;3510:
;3511://	G_EffectIndex( "emplaced/explode" );
;3512://	G_EffectIndex( "emplaced/dead_smoke" );
;3513:
;3514:	// amount of ammo that this little poochie has
;3515:	G_SpawnInt( "count", "600", &ent->count );
ADDRGP4 $1174
ARGP4
ADDRGP4 $1175
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3517
;3516:
;3517:	ent->s.modelindex = G_ModelIndex( name );
ADDRLP4 1092
ARGP4
ADDRLP4 1148
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 1148
INDIRI4
ASGNI4
line 3518
;3518:	ent->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 3519
;3519:	ent->s.g2radius = 110;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 110
ASGNI4
line 3530
;3520:	//trap_G2API_InitGhoul2Model( ent->s.ghoul2, name, ent->s.modelindex );
;3521://g2r	trap_G2API_InitGhoul2Model( &ent->s, name, ent->s.modelindex, 0, 0, 0, 0 );
;3522:
;3523:	// Activate our tags and bones
;3524://	ent->headBolt = gi.G2API_AddBolt( &ent->s.ghoul2[0], "*seat" );
;3525://	ent->handLBolt = gi.G2API_AddBolt( &ent->s.ghoul2[0], "*flash01" );
;3526://	ent->handRBolt = gi.G2API_AddBolt( &ent->s.ghoul2[0], "*flash02" );
;3527://	gi.G2API_SetBoneAngles( &ent->s.ghoul2[0], "swivel_bone", vec3_origin, BONE_ANGLES_POSTMULT, POSITIVE_Y, POSITIVE_Z, POSITIVE_X, NULL); 
;3528:
;3529://	RegisterItem( FindItemForWeapon( WP_EMPLACED_GUN ));
;3530:	ent->s.weapon = WP_EMPLACED_GUN;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 14
ASGNI4
line 3534
;3531:
;3532://	SnapVector(ent->s.origin);
;3533:
;3534:	G_SetOrigin( ent, ent->s.origin );
ADDRLP4 1152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1152
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 3539
;3535:	
;3536:	//G_SetAngles( ent, ent->s.angles );
;3537:
;3538:	// store base angles for later
;3539:	VectorCopy( ent->s.angles, ent->pos1 );
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 1156
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 3540
;3540:	VectorCopy( ent->s.angles, ent->r.currentAngles );
ADDRLP4 1160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 1160
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 3541
;3541:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 1164
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 3543
;3542:
;3543:	ent->think = emplaced_gun_update;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 emplaced_gun_update
ASGNP4
line 3544
;3544:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 3547
;3545:
;3546://	ent->e_UseFunc = useF_emplaced_gun_use;
;3547:	ent->use = emplaced_gun_realuse;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 emplaced_gun_realuse
ASGNP4
line 3550
;3548:	//ent->touch = emplaced_gun_use;
;3549:
;3550:	ent->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 1168
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1168
INDIRP4
ADDRLP4 1168
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 3552
;3551:
;3552:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 3554
;3553:
;3554:	ent->s.owner = MAX_CLIENTS+1;
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 33
ASGNI4
line 3555
;3555:	ent->s.shouldtarget = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
CNSTI4 1
ASGNI4
line 3556
;3556:	ent->s.teamowner = 0;
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
CNSTI4 0
ASGNI4
line 3570
;3557:
;3558:	/*
;3559:	angswiv[ROLL] = 0;
;3560:	angswiv[PITCH] = 0;
;3561:	angswiv[YAW] = 70;
;3562:	trap_G2API_SetBoneAngles(ent->s.ghoul2, 0, "swivel_bone", angswiv, BONE_ANGLES_REPLACE, POSITIVE_Z, NEGATIVE_X, NEGATIVE_Y, NULL, 0, level.time);
;3563:	*/
;3564:
;3565:
;3566://g2r	ent->s.trickedentindex = trap_G2API_AddBolt(ent->s.ghoul2, 0, "*seat");
;3567://g2r	ent->s.bolt1 = trap_G2API_AddBolt(ent->s.ghoul2, 0, "*flash01");
;3568://g2r	ent->s.bolt2 = trap_G2API_AddBolt(ent->s.ghoul2, 0, "*flash02");
;3569:
;3570:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3571
;3571:}
LABELV $1164
endproc SP_emplaced_gun 1172 28
bss
align 4
LABELV ent_list
skip 4096
import G_GetHitLocation
import G_BoxInBounds
align 4
LABELV muzzle
skip 12
align 4
LABELV up
skip 12
align 4
LABELV right
skip 12
align 4
LABELV forward
skip 12
align 4
LABELV s_quadFactor
skip 4
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
LABELV $1175
byte 1 54
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $1174
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $907
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
byte 1 109
byte 1 101
byte 1 108
byte 1 101
byte 1 101
byte 1 47
byte 1 112
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $820
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
LABELV $799
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
LABELV $797
byte 1 100
byte 1 101
byte 1 116
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $779
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
byte 1 0
align 1
LABELV $715
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
LABELV $707
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
byte 1 115
byte 1 116
byte 1 105
byte 1 99
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $695
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
LABELV $667
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
LABELV $652
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 95
byte 1 100
byte 1 101
byte 1 116
byte 1 111
byte 1 110
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $624
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
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 108
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
LABELV $618
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 0
align 1
LABELV $538
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 104
byte 1 95
byte 1 97
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $489
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 84
byte 1 114
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $481
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 104
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 0
align 1
LABELV $468
byte 1 100
byte 1 101
byte 1 109
byte 1 112
byte 1 50
byte 1 95
byte 1 97
byte 1 108
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 0
align 1
LABELV $383
byte 1 100
byte 1 101
byte 1 109
byte 1 112
byte 1 50
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 0
align 1
LABELV $377
byte 1 114
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 0
align 1
LABELV $375
byte 1 114
byte 1 101
byte 1 112
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 0
align 1
LABELV $370
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
byte 1 97
byte 1 108
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 0
align 1
LABELV $335
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
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 0
align 1
LABELV $172
byte 1 101
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 0
align 1
LABELV $170
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 0
align 1
LABELV $163
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 105
byte 1 99
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 0
align 1
LABELV $151
byte 1 98
byte 1 114
byte 1 121
byte 1 97
byte 1 114
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 106
byte 1 0
