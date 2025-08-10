lit
align 4
LABELV $123
byte 4 0
byte 4 0
byte 4 0
export pitch_roll_for_slope
code
proc pitch_roll_for_slope 1196 28
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_object.c"
line 22
;1:// leave this line at the top for all g_xxxx.cpp files...
;2:#include "g_local.h"
;3:
;4:extern void G_MoverTouchPushTriggers( gentity_t *ent, vec3_t oldOrg );
;5:void G_StopObjectMoving( gentity_t *object );
;6:
;7:/*
;8:====================================================================
;9:void pitch_roll_for_slope (edict_t *forwhom, vec3_t *slope)
;10:
;11:MG
;12:
;13:This will adjust the pitch and roll of a monster to match
;14:a given slope - if a non-'0 0 0' slope is passed, it will
;15:use that value, otherwise it will use the ground underneath
;16:the monster.  If it doesn't find a surface, it does nothinh\g
;17:and returns.
;18:====================================================================
;19:*/
;20:
;21:void pitch_roll_for_slope( gentity_t *forwhom, vec3_t pass_slope )
;22:{
line 24
;23:	vec3_t	slope;
;24:	vec3_t	nvf, ovf, ovr, startspot, endspot, new_angles = { 0, 0, 0 };
ADDRLP4 12
ADDRGP4 $123
INDIRB
ASGNB 12
line 29
;25:	float	pitch, mod, dot;
;26:	float	oldmins2;
;27:
;28:	//if we don't have a slope, get one
;29:	if( !pass_slope || VectorCompare( vec3_origin, pass_slope ) )
ADDRLP4 100
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $126
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $124
LABELV $126
line 30
;30:	{
line 33
;31:		trace_t trace;
;32:
;33:		VectorCopy( forwhom->r.currentOrigin, startspot );
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 34
;34:		startspot[2] += forwhom->r.mins[2] + 4;
ADDRLP4 72+8
ADDRLP4 72+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
CNSTF4 1082130432
ADDF4
ADDF4
ASGNF4
line 35
;35:		VectorCopy( startspot, endspot );
ADDRLP4 84
ADDRLP4 72
INDIRB
ASGNB 12
line 36
;36:		endspot[2] -= 300;
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
CNSTF4 1133903872
SUBF4
ASGNF4
line 37
;37:		JP_Trace( &trace, forwhom->r.currentOrigin, vec3_origin, vec3_origin, endspot, forwhom->s.number, MASK_SOLID );
ADDRLP4 108
ARGP4
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1188
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1192
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 1188
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 41
;38://		if(trace_fraction>0.05&&forwhom.movetype==MOVETYPE_STEP)
;39://			forwhom.flags(-)FL_ONGROUND;
;40:
;41:		if ( trace.fraction >= 1.0 )
ADDRLP4 108+8
INDIRF4
CNSTF4 1065353216
LTF4 $129
line 42
;42:			return;
ADDRGP4 $122
JUMPV
LABELV $129
line 44
;43:
;44:		if( trace.allsolid )
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $132
line 45
;45:			return;
ADDRGP4 $122
JUMPV
LABELV $132
line 47
;46:
;47:		VectorCopy( trace.plane.normal, slope );
ADDRLP4 60
ADDRLP4 108+24
INDIRB
ASGNB 12
line 48
;48:	}
ADDRGP4 $125
JUMPV
LABELV $124
line 50
;49:	else
;50:	{
line 51
;51:		VectorCopy( pass_slope, slope );
ADDRLP4 60
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 52
;52:	}
LABELV $125
line 55
;53:
;54:
;55:	AngleVectors( forwhom->r.currentAngles, ovf, ovr, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 380
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 57
;56:
;57:	vectoangles( slope, new_angles );
ADDRLP4 60
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 58
;58:	pitch = new_angles[PITCH] + 90;
ADDRLP4 52
ADDRLP4 12
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 59
;59:	new_angles[ROLL] = new_angles[PITCH] = 0;
ADDRLP4 108
CNSTF4 0
ASGNF4
ADDRLP4 12
ADDRLP4 108
INDIRF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 108
INDIRF4
ASGNF4
line 61
;60:
;61:	AngleVectors( new_angles, nvf, NULL, NULL );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 112
CNSTP4 0
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 63
;62:
;63:	mod = DotProduct( nvf, ovr );
ADDRLP4 48
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 65
;64:
;65:	if ( mod<0 )
ADDRLP4 48
INDIRF4
CNSTF4 0
GEF4 $140
line 66
;66:		mod = -1;
ADDRLP4 48
CNSTF4 3212836864
ASGNF4
ADDRGP4 $141
JUMPV
LABELV $140
line 68
;67:	else
;68:		mod = 1;
ADDRLP4 48
CNSTF4 1065353216
ASGNF4
LABELV $141
line 70
;69:
;70:	dot = DotProduct( nvf, ovf );
ADDRLP4 56
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 72
;71:
;72:	if ( forwhom->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $146
line 73
;73:	{
line 74
;74:		forwhom->client->ps.viewangles[PITCH] = dot * pitch;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 56
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ASGNF4
line 75
;75:		forwhom->client->ps.viewangles[ROLL] = ((1-Q_fabs(dot)) * pitch * mod);
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 116
ADDRGP4 Q_fabs
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 164
ADDP4
CNSTF4 1065353216
ADDRLP4 116
INDIRF4
SUBF4
ADDRLP4 52
INDIRF4
MULF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 76
;76:		oldmins2 = forwhom->r.mins[2];
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ASGNF4
line 77
;77:		forwhom->r.mins[2] = -24 + 12 * fabs(forwhom->client->ps.viewangles[PITCH])/180.0f;
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ARGF4
ADDRLP4 124
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 120
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 1094713344
ADDRLP4 124
INDIRF4
MULF4
CNSTF4 1127481344
DIVF4
CNSTF4 3250585600
ADDF4
ASGNF4
line 79
;78:		//FIXME: if it gets bigger, move up
;79:		if ( oldmins2 > forwhom->r.mins[2] )
ADDRLP4 96
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
LEF4 $147
line 80
;80:		{//our mins is now lower, need to move up
line 82
;81:			//FIXME: trace?
;82:			forwhom->client->ps.origin[2] += (oldmins2 - forwhom->r.mins[2]);
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
ADDRLP4 128
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 96
INDIRF4
ADDRLP4 128
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
SUBF4
ADDF4
ASGNF4
line 83
;83:			forwhom->r.currentOrigin[2] = forwhom->client->ps.origin[2];
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CNSTI4 376
ADDP4
ADDRLP4 136
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 84
;84:			trap_LinkEntity( forwhom );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 85
;85:		}
line 86
;86:	}
ADDRGP4 $147
JUMPV
LABELV $146
line 88
;87:	else
;88:	{
line 89
;89:		forwhom->r.currentAngles[PITCH] = dot * pitch;
ADDRFP4 0
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 56
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ASGNF4
line 90
;90:		forwhom->r.currentAngles[ROLL] = ((1-Q_fabs(dot)) * pitch * mod);
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 116
ADDRGP4 Q_fabs
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTF4 1065353216
ADDRLP4 116
INDIRF4
SUBF4
ADDRLP4 52
INDIRF4
MULF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 91
;91:	}
LABELV $147
line 92
;92:}
LABELV $122
endproc pitch_roll_for_slope 1196 28
export G_BounceObject
proc G_BounceObject 44 12
line 101
;93:
;94:/*
;95:================
;96:G_BounceObject
;97:
;98:================
;99:*/
;100:void G_BounceObject( gentity_t *ent, trace_t *trace ) 
;101:{
line 107
;102:	vec3_t	velocity;
;103:	float	dot, bounceFactor;
;104:	int		hitTime;
;105:
;106:	// reflect the velocity on the trace plane
;107:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
ADDRLP4 20
ADDRGP4 level+40
INDIRI4
CVIF4 4
ADDRGP4 level+36
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CVIF4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 108
;108:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 109
;109:	dot = DotProduct( velocity, trace->plane.normal );
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 111
;110://	bounceFactor = 60/ent->mass;		// NOTENOTE Mass is not yet implemented
;111:	bounceFactor = 1.0f;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 112
;112:	if ( bounceFactor > 1.0f )
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
LEF4 $156
line 113
;113:	{
line 114
;114:		bounceFactor = 1.0f;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 115
;115:	}
LABELV $156
line 116
;116:	VectorMA( velocity, -2*dot*bounceFactor, trace->plane.normal, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 3221225472
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 119
;117:
;118:	//FIXME: customized or material-based impact/bounce sounds
;119:	if ( ent->s.eFlags & EF_BOUNCE_HALF ) 
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $160
line 120
;120:	{
line 121
;121:		VectorScale( ent->s.pos.trDelta, 0.5, ent->s.pos.trDelta );
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTF4 1056964608
ADDRLP4 28
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTF4 1056964608
ADDRLP4 32
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1056964608
ADDRLP4 36
INDIRP4
INDIRF4
MULF4
ASGNF4
line 124
;122:
;123:		// check for stop
;124:		if ( ((trace->plane.normal[2] > 0.7&&g_gravity.value>0) || (trace->plane.normal[2]<-0.7&&g_gravity.value<0)) && ((ent->s.pos.trDelta[2]<40&&g_gravity.value>0)||(ent->s.pos.trDelta[2]>-40&&g_gravity.value<0)) ) //this can happen even on very slightly sloped walls, so changed it from > 0 to > 0.7
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1060320051
LEF4 $169
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 0
GTF4 $168
LABELV $169
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 3207803699
GEF4 $162
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 0
GEF4 $162
LABELV $168
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 1109393408
GEF4 $171
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 0
GTF4 $170
LABELV $171
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 3256877056
LEF4 $162
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 0
GEF4 $162
LABELV $170
line 125
;125:		{
line 128
;126:			//G_SetOrigin( ent, trace->endpos );
;127:			//ent->nextthink = level.time + 500;
;128:			ent->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 129
;129:			VectorCopy( ent->r.currentAngles, ent->s.apos.trBase );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 380
ADDP4
INDIRB
ASGNB 12
line 130
;130:			VectorCopy( trace->endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 131
;131:			VectorCopy( trace->endpos, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 132
;132:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 133
;133:			return;
ADDRGP4 $150
JUMPV
LABELV $162
line 135
;134:		}
;135:	}
LABELV $160
line 140
;136:
;137:	// NEW--It would seem that we want to set our trBase to the trace endpos
;138:	//	and set the trTime to the actual time of impact....
;139:	//	FIXME: Should we still consider adding the normal though??
;140:	VectorCopy( trace->endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 141
;141:	ent->s.pos.trTime = hitTime;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 143
;142:
;143:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
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
line 144
;144:	VectorCopy( trace->plane.normal, ent->pos1 );//???
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 145
;145:}
LABELV $150
endproc G_BounceObject 44 12
export G_RunObject
proc G_RunObject 1192 28
line 159
;146:
;147:
;148:/*
;149:================
;150:G_RunObject
;151:
;152:  TODO:  When transition to 0 grav, push away from surface you were resting on
;153:  TODO:  When free-floating in air, apply some friction to your trDelta (based on mass?)
;154:================
;155:*/
;156:extern void DoImpact( gentity_t *self, gentity_t *other, qboolean damageSelf );
;157:extern void pitch_roll_for_slope( gentity_t *forwhom, vec3_t pass_slope );
;158:void G_RunObject( gentity_t *ent ) 
;159:{
line 162
;160:	vec3_t		origin, oldOrg;
;161:	trace_t		tr;
;162:	gentity_t	*traceEnt = NULL;
ADDRLP4 1080
CNSTP4 0
ASGNP4
line 165
;163:
;164:	//FIXME: floaters need to stop floating up after a while, even if gravity stays negative?
;165:	if ( ent->s.pos.trType == TR_STATIONARY )//g_gravity.value <= 0 && 
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $174
line 166
;166:	{
line 167
;167:		ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 168
;168:		VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 1108
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 169
;169:		ent->s.pos.trTime = level.previousTime;//?necc?
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+40
INDIRI4
ASGNI4
line 170
;170:		if ( !g_gravity.value )
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 0
NEF4 $177
line 171
;171:		{
line 172
;172:			ent->s.pos.trDelta[2] += 100;
ADDRLP4 1112
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 1112
INDIRP4
ADDRLP4 1112
INDIRP4
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 173
;173:		}
LABELV $177
line 174
;174:	}
LABELV $174
line 176
;175:
;176:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 178
;177:
;178:	VectorCopy( ent->r.currentOrigin, oldOrg );
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 180
;179:	// get current position
;180:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 1084
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 182
;181:	//Get current angles?
;182:	BG_EvaluateTrajectory( &ent->s.apos, level.time, ent->r.currentAngles );
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 1108
INDIRP4
CNSTI4 380
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 184
;183:
;184:	if ( VectorCompare( ent->r.currentOrigin, origin ) )
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1112
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
EQI4 $183
line 185
;185:	{//error - didn't move at all!
line 186
;186:		return;
ADDRGP4 $173
JUMPV
LABELV $183
line 190
;187:	}
;188:	// trace a line from the previous position to the current position,
;189:	// ignoring interactions with the missile owner
;190:	JP_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, 
ADDRLP4 0
ARGP4
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1120
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1120
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1120
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $186
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $187
JUMPV
LABELV $186
ADDRLP4 1116
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $187
ADDRLP4 1116
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 193
;191:		ent->parent ? ent->parent->s.number : ent->s.number, ent->clipmask );
;192:
;193:	if ( !tr.startsolid && !tr.allsolid && tr.fraction ) 
ADDRLP4 1124
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1124
INDIRI4
NEI4 $188
ADDRLP4 0
INDIRI4
ADDRLP4 1124
INDIRI4
NEI4 $188
ADDRLP4 0+8
INDIRF4
CNSTF4 0
EQF4 $188
line 194
;194:	{
line 195
;195:		VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 196
;196:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 197
;197:	}
ADDRGP4 $189
JUMPV
LABELV $188
line 200
;198:	else
;199:	//if ( tr.startsolid ) 
;200:	{
line 201
;201:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 202
;202:	}
LABELV $189
line 204
;203:
;204:	G_MoverTouchPushTriggers( ent, oldOrg );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1096
ARGP4
ADDRGP4 G_MoverTouchPushTriggers
CALLV
pop
line 220
;205:	/*
;206:	if ( !(ent->s.eFlags & EF_TELEPORT_BIT) && !(ent->svFlags & SVF_NO_TELEPORT) )
;207:	{
;208:		G_MoverTouchTeleportTriggers( ent, oldOrg );
;209:		if ( ent->s.eFlags & EF_TELEPORT_BIT )
;210:		{//was teleported
;211:			return;
;212:		}
;213:	}
;214:	else
;215:	{
;216:		ent->s.eFlags &= ~EF_TELEPORT_BIT;
;217:	}
;218:	*/
;219:
;220:	if ( tr.fraction == 1 ) 
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $194
line 221
;221:	{
line 222
;222:		if ( g_gravity.value <= 0 )
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 0
GTF4 $197
line 223
;223:		{
line 224
;224:			if ( ent->s.apos.trType == TR_STATIONARY )
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 0
NEI4 $200
line 225
;225:			{
line 226
;226:				VectorCopy( ent->r.currentAngles, ent->s.apos.trBase );
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 1128
INDIRP4
CNSTI4 380
ADDP4
INDIRB
ASGNB 12
line 227
;227:				ent->s.apos.trType = TR_LINEAR;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 228
;228:				ent->s.apos.trDelta[1] = flrand( -300, 300, ent->parent && ent->parent->client && ent->parent->client->sess.raceMode, 0 );
CNSTF4 3281387520
ARGF4
CNSTF4 1133903872
ARGF4
ADDRLP4 1136
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
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
EQU4 $203
ADDRLP4 1144
ADDRLP4 1136
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CVPU4 4
ADDRLP4 1140
INDIRU4
EQU4 $203
ADDRLP4 1144
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $203
ADDRLP4 1132
CNSTI4 1
ASGNI4
ADDRGP4 $204
JUMPV
LABELV $203
ADDRLP4 1132
CNSTI4 0
ASGNI4
LABELV $204
ADDRLP4 1132
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 1148
ADDRGP4 flrand
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 1148
INDIRF4
ASGNF4
line 229
;229:				ent->s.apos.trDelta[0] = flrand( -10, 10, ent->parent && ent->parent->client && ent->parent->client->sess.raceMode, 0);
CNSTF4 3240099840
ARGF4
CNSTF4 1092616192
ARGF4
ADDRLP4 1156
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1160
CNSTU4 0
ASGNU4
ADDRLP4 1156
INDIRP4
CVPU4 4
ADDRLP4 1160
INDIRU4
EQU4 $206
ADDRLP4 1164
ADDRLP4 1156
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CVPU4 4
ADDRLP4 1160
INDIRU4
EQU4 $206
ADDRLP4 1164
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $206
ADDRLP4 1152
CNSTI4 1
ASGNI4
ADDRGP4 $207
JUMPV
LABELV $206
ADDRLP4 1152
CNSTI4 0
ASGNI4
LABELV $207
ADDRLP4 1152
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 1168
ADDRGP4 flrand
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 1168
INDIRF4
ASGNF4
line 230
;230:				ent->s.apos.trDelta[2] = flrand( -10, 10, ent->parent && ent->parent->client && ent->parent->client->sess.raceMode, 0);
CNSTF4 3240099840
ARGF4
CNSTF4 1092616192
ARGF4
ADDRLP4 1176
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1180
CNSTU4 0
ASGNU4
ADDRLP4 1176
INDIRP4
CVPU4 4
ADDRLP4 1180
INDIRU4
EQU4 $209
ADDRLP4 1184
ADDRLP4 1176
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1184
INDIRP4
CVPU4 4
ADDRLP4 1180
INDIRU4
EQU4 $209
ADDRLP4 1184
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $209
ADDRLP4 1172
CNSTI4 1
ASGNI4
ADDRGP4 $210
JUMPV
LABELV $209
ADDRLP4 1172
CNSTI4 0
ASGNI4
LABELV $210
ADDRLP4 1172
INDIRI4
ARGI4
CNSTF4 0
ARGF4
ADDRLP4 1188
ADDRGP4 flrand
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 1188
INDIRF4
ASGNF4
line 231
;231:				ent->s.apos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 232
;232:			}
LABELV $200
line 233
;233:		}
LABELV $197
line 235
;234:		//friction in zero-G
;235:		if ( !g_gravity.value )
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 0
NEF4 $173
line 236
;236:		{
line 237
;237:			float friction = 0.975f;
ADDRLP4 1128
CNSTF4 1064933786
ASGNF4
line 239
;238:			//friction -= ent->mass/1000.0f;
;239:			if ( friction < 0.1 )
ADDRLP4 1128
INDIRF4
CNSTF4 1036831949
GEF4 $215
line 240
;240:			{
line 241
;241:				friction = 0.1f;
ADDRLP4 1128
CNSTF4 1036831949
ASGNF4
line 242
;242:			}
LABELV $215
line 244
;243:
;244:			VectorScale( ent->s.pos.trDelta, friction, ent->s.pos.trDelta );
ADDRLP4 1132
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1132
INDIRP4
ADDRLP4 1132
INDIRP4
INDIRF4
ADDRLP4 1128
INDIRF4
MULF4
ASGNF4
ADDRLP4 1136
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1136
INDIRP4
ADDRLP4 1136
INDIRP4
INDIRF4
ADDRLP4 1128
INDIRF4
MULF4
ASGNF4
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 1140
INDIRP4
ADDRLP4 1140
INDIRP4
INDIRF4
ADDRLP4 1128
INDIRF4
MULF4
ASGNF4
line 245
;245:			VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
ADDRLP4 1144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 1144
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 246
;246:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 247
;247:		}
line 248
;248:		return;
ADDRGP4 $173
JUMPV
LABELV $194
line 254
;249:	}
;250:
;251:	//hit something
;252:
;253:	//Do impact damage
;254:	traceEnt = &g_entities[tr.entityNum];
ADDRLP4 1080
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 255
;255:	if ( tr.fraction || (traceEnt && traceEnt->takedamage) )
ADDRLP4 0+8
INDIRF4
CNSTF4 0
NEF4 $222
ADDRLP4 1080
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $219
ADDRLP4 1080
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $219
LABELV $222
line 256
;256:	{
line 257
;257:		if ( !VectorCompare( ent->r.currentOrigin, oldOrg ) )
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1096
ARGP4
ADDRLP4 1132
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $223
line 258
;258:		{//moved and impacted
line 259
;259:			if ( (traceEnt && traceEnt->takedamage) )
ADDRLP4 1080
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $225
ADDRLP4 1080
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $225
line 260
;260:			{//hurt someone
line 262
;261://				G_Sound( ent, G_SoundIndex( "sound/movers/objects/objectHurt.wav" ) );
;262:			}
LABELV $225
line 264
;263://			G_Sound( ent, G_SoundIndex( "sound/movers/objects/objectHit.wav" ) );
;264:		}
LABELV $223
line 266
;265:
;266:		if (ent->s.weapon != WP_SABER || jk2gameplay == VERSION_1_02)
ADDRLP4 1136
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 1136
INDIRI4
NEI4 $229
ADDRGP4 jk2gameplay
INDIRI4
ADDRLP4 1136
INDIRI4
NEI4 $227
LABELV $229
line 267
;267:		{
line 268
;268:			DoImpact( ent, traceEnt, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 DoImpact
CALLV
pop
line 269
;269:		}
LABELV $227
line 270
;270:	}
LABELV $219
line 272
;271:
;272:	if ( !ent || (ent->takedamage&&ent->health <= 0) )
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $232
ADDRLP4 1136
CNSTI4 0
ASGNI4
ADDRLP4 1132
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 1136
INDIRI4
EQI4 $230
ADDRLP4 1132
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 1136
INDIRI4
GTI4 $230
LABELV $232
line 273
;273:	{//been destroyed by impact
line 276
;274:		//chunks?
;275://		G_Sound( ent, G_SoundIndex( "sound/movers/objects/objectBreak.wav" ) );
;276:		return;
ADDRGP4 $173
JUMPV
LABELV $230
line 280
;277:	}
;278:
;279:	//do impact physics
;280:	if ( ent->s.pos.trType == TR_GRAVITY )//tr.fraction < 1.0 && 
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
NEI4 $233
line 281
;281:	{//FIXME: only do this if no trDelta
line 282
;282:		if ( g_gravity.value <= 0 || tr.plane.normal[2] < 0.7 )
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 0
LEF4 $240
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $235
LABELV $240
line 283
;283:		{
line 284
;284:			if ( ent->s.eFlags&(EF_BOUNCE|EF_BOUNCE_HALF) )
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 48
BANDI4
CNSTI4 0
EQI4 $234
line 285
;285:			{
line 286
;286:				if ( tr.fraction <= 0.0f )
ADDRLP4 0+8
INDIRF4
CNSTF4 0
GTF4 $243
line 287
;287:				{
line 288
;288:					VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 289
;289:					VectorCopy( tr.endpos, ent->s.pos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 290
;290:					VectorClear( ent->s.pos.trDelta );
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1144
CNSTF4 0
ASGNF4
ADDRLP4 1140
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 1144
INDIRF4
ASGNF4
ADDRLP4 1140
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1144
INDIRF4
ASGNF4
ADDRLP4 1140
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1144
INDIRF4
ASGNF4
line 291
;291:					ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 292
;292:				}
ADDRGP4 $234
JUMPV
LABELV $243
line 294
;293:				else
;294:				{
line 295
;295:					G_BounceObject( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_BounceObject
CALLV
pop
line 296
;296:				}
line 297
;297:			}
line 299
;298:			else
;299:			{//slide down?
line 301
;300:				//FIXME: slide off the slope
;301:			}
line 302
;302:		}
ADDRGP4 $234
JUMPV
LABELV $235
line 304
;303:		else
;304:		{
line 305
;305:			ent->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 306
;306:			pitch_roll_for_slope( ent, tr.plane.normal );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRGP4 pitch_roll_for_slope
CALLV
pop
line 309
;307:			//ent->r.currentAngles[0] = 0;//FIXME: match to slope
;308:			//ent->r.currentAngles[2] = 0;//FIXME: match to slope
;309:			VectorCopy( ent->r.currentAngles, ent->s.apos.trBase );
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 1140
INDIRP4
CNSTI4 380
ADDP4
INDIRB
ASGNB 12
line 313
;310:			//okay, we hit the floor, might as well stop or prediction will
;311:			//make us go through the floor!
;312:			//FIXME: this means we can't fall if something is pulled out from under us...
;313:			G_StopObjectMoving( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StopObjectMoving
CALLV
pop
line 314
;314:		}
line 315
;315:	}
ADDRGP4 $234
JUMPV
LABELV $233
line 316
;316:	else if (ent->s.weapon != WP_SABER)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
EQI4 $250
line 317
;317:	{
line 318
;318:		ent->s.apos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 319
;319:		pitch_roll_for_slope( ent, tr.plane.normal );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRGP4 pitch_roll_for_slope
CALLV
pop
line 322
;320:		//ent->r.currentAngles[0] = 0;//FIXME: match to slope
;321:		//ent->r.currentAngles[2] = 0;//FIXME: match to slope
;322:		VectorCopy( ent->r.currentAngles, ent->s.apos.trBase );
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 1140
INDIRP4
CNSTI4 380
ADDP4
INDIRB
ASGNB 12
line 323
;323:	}
LABELV $250
LABELV $234
line 326
;324:
;325:	//call touch func
;326:	ent->touch( ent, &g_entities[tr.entityNum], &tr );
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1140
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CALLV
pop
line 327
;327:}
LABELV $173
endproc G_RunObject 1192 28
export G_StopObjectMoving
proc G_StopObjectMoving 16 0
line 331
;328:
;329:
;330:void G_StopObjectMoving( gentity_t *object )
;331:{
line 332
;332:	object->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 333
;333:	VectorCopy( object->r.currentOrigin, object->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
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
line 334
;334:	VectorCopy( object->r.currentOrigin, object->s.pos.trBase );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 335
;335:	VectorClear( object->s.pos.trDelta );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 12
INDIRF4
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
line 344
;336:
;337:	/*
;338:	//Stop spinning
;339:	VectorClear( self->s.apos.trDelta );
;340:	vectoangles(trace->plane.normal, self->s.angles);
;341:	VectorCopy(self->s.angles, self->r.currentAngles );
;342:	VectorCopy(self->s.angles, self->s.apos.trBase);
;343:	*/
;344:}
LABELV $254
endproc G_StopObjectMoving 16 0
export G_StartObjectMoving
proc G_StartObjectMoving 4 4
line 347
;345:
;346:void G_StartObjectMoving( gentity_t *object, vec3_t dir, float speed, trType_t trType )
;347:{
line 348
;348:	VectorNormalize (dir);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 351
;349:
;350:	//object->s.eType = ET_GENERAL;
;351:	object->s.pos.trType = trType;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 12
INDIRI4
ASGNI4
line 352
;352:	VectorCopy( object->r.currentOrigin, object->s.pos.trBase );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 353
;353:	VectorScale(dir, speed, object->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 354
;354:	object->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 365
;355:
;356:	/*
;357:	//FIXME: incorporate spin?
;358:	vectoangles(dir, object->s.angles);
;359:	VectorCopy(object->s.angles, object->s.apos.trBase);
;360:	VectorSet(object->s.apos.trDelta, 300, 0, 0 );
;361:	object->s.apos.trTime = level.time;
;362:	*/
;363:
;364:	//FIXME: make these objects go through G_RunObject automatically, like missiles do
;365:	if ( object->think == NULL )
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $257
line 366
;366:	{
line 367
;367:		object->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 368
;368:		object->think = G_RunObject;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_RunObject
ASGNP4
line 369
;369:	}
LABELV $257
line 371
;370:	else
;371:	{//You're responsible for calling RunObject
line 372
;372:	}
LABELV $258
line 373
;373:}
LABELV $255
endproc G_StartObjectMoving 4 4
import DoImpact
import G_MoverTouchPushTriggers
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
