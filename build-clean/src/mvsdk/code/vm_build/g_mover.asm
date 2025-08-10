export G_ClearEntityActivator
code
proc G_ClearEntityActivator 28 0
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_mover.c"
line 19
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:
;7:
;8:/*
;9:===============================================================================
;10:
;11:ACTIVATORS
;12:
;13:===============================================================================
;14:*/
;15:
;16:// TODO something to unlink activator once he is no longer touching the thing?
;17:// TODO what if there's weird situations like entity being its own activator and idk. will it break sth?
;18:
;19:void G_ClearEntityActivator(gentity_t* ent) {
line 20
;20:	if (ent->activatorReal) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $121
line 21
;21:		int activatedConfirmCount = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 23
;22:		// remove ourselves from any existing linkage
;23:		if (ent->activatorReal && ent->activatorReal->activatedEntities == ent) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $123
ADDRLP4 8
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $123
line 24
;24:			ent->activatorReal->activatedEntities = ent->nextActivatedEntity;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ASGNP4
line 25
;25:			activatedConfirmCount++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 26
;26:		}
ADDRGP4 $124
JUMPV
LABELV $123
line 27
;27:		else if (ent->activatorReal && ent->activatorReal->activatedEntities) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
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
EQU4 $125
ADDRLP4 12
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $125
line 28
;28:			gentity_t* actEnt = ent->activatorReal->activatedEntities;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $128
JUMPV
LABELV $127
line 30
;29:			// go through the list quick and remove ourselves.
;30:			while (actEnt) {
line 31
;31:				assert(actEnt->activator == ent->activatorReal);		// sanity checks
line 32
;32:				assert(actEnt->activatorReal == ent->activatorReal);	// sanity checks
line 33
;33:				if (actEnt->nextActivatedEntity == ent) {
ADDRLP4 20
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $130
line 34
;34:					actEnt->nextActivatedEntity = ent->nextActivatedEntity;
ADDRLP4 24
CNSTI4 772
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 35
;35:					activatedConfirmCount++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 36
;36:				}
LABELV $130
line 37
;37:				actEnt = actEnt->nextActivatedEntity;
ADDRLP4 20
ADDRLP4 20
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ASGNP4
line 38
;38:			}
LABELV $128
line 30
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $127
line 39
;39:		}
LABELV $125
LABELV $124
line 40
;40:		assert(activatedConfirmCount == 1);
line 41
;41:		ent->activatorReal = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTP4 0
ASGNP4
line 42
;42:	}
LABELV $121
line 43
;43:	ent->nextActivatedEntity = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTP4 0
ASGNP4
line 44
;44:}
LABELV $120
endproc G_ClearEntityActivator 28 0
export G_ClearActivatedEntities
proc G_ClearActivatedEntities 8 0
line 50
;45:
;46:// allow all entities linked to this activator to run on servertime again, e.g.
;47:// - player disconnect
;48:// - player lagging
;49:// dont do this actually, its probably unsafe, because some places might rely on activator not being a NULL pointer
;50:void G_ClearActivatedEntities(gentity_t* activator) {
line 52
;51:	gentity_t* tmpActEnt; // tmp var
;52:	gentity_t* actEnt = activator->activatedEntities;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $134
JUMPV
LABELV $133
line 53
;53:	while (actEnt) {
line 54
;54:		tmpActEnt = actEnt->nextActivatedEntity;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ASGNP4
line 55
;55:		assert(actEnt->activator == activator);		// sanity checks
line 56
;56:		assert(actEnt->activatorReal == activator);	// sanity checks
line 57
;57:		actEnt->activatorReal = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTP4 0
ASGNP4
line 58
;58:		actEnt->nextActivatedEntity = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTP4 0
ASGNP4
line 59
;59:		actEnt = tmpActEnt;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 60
;60:	}
LABELV $134
line 53
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $133
line 61
;61:	activator->activatedEntities = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTP4 0
ASGNP4
line 62
;62:}
LABELV $132
endproc G_ClearActivatedEntities 8 0
export G_ResetActivatorTimeDelta
proc G_ResetActivatorTimeDelta 12 0
line 64
;63:
;64:int G_ResetActivatorTimeDelta(gentity_t* ent, gentity_t* activator) {
line 65
;65:	ent->activatorLevelTimeDelta = (activator && activator->client) ?( level.time - activator->client->pers.cmd.serverTime):0;
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
EQU4 $139
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $139
ADDRLP4 0
ADDRGP4 level+36
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $140
JUMPV
LABELV $139
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $140
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 66
;66:	return level.time;//returns the correct time to use. at this point in time its just level.time. convenience feature.
ADDRGP4 level+36
INDIRI4
RETI4
LABELV $136
endproc G_ResetActivatorTimeDelta 12 0
export G_SetActivator
proc G_SetActivator 20 8
line 70
;67:}
;68:
;69:// TODO what about order of entities? preserve it? atm last activated one will run first?
;70:void G_SetActivator(gentity_t* ent, gentity_t* activator) {
line 71
;71:	if (activator != ent->activatorReal && activator && activator->client) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 4
INDIRU4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CVPU4 4
EQU4 $143
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRU4
ADDRLP4 8
INDIRU4
EQU4 $143
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $143
line 72
;72:		G_ResetActivatorTimeDelta(ent, activator); // todo: dont we have to do this anyway even if not activator->client?
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_ResetActivatorTimeDelta
CALLI4
pop
line 73
;73:	}
LABELV $143
line 74
;74:	G_ClearEntityActivator(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ClearEntityActivator
CALLV
pop
line 75
;75:	ent->activatorReal = ent->activator = activator;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 77
;76:
;77:	if (activator) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $145
line 79
;78:		// link ourselves into current activator.
;79:		ent->nextActivatedEntity = activator->activatedEntities;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ASGNP4
line 80
;80:		activator->activatedEntities = ent;
ADDRFP4 4
INDIRP4
CNSTI4 768
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 81
;81:	}
LABELV $145
line 82
;82:}
LABELV $142
endproc G_SetActivator 20 8
export G_TestEntityPosition
proc G_TestEntityPosition 1104 28
line 110
;83:
;84:
;85:/*
;86:===============================================================================
;87:
;88:PUSHMOVE
;89:
;90:===============================================================================
;91:*/
;92:
;93:void MatchTeam( gentity_t *teamLeader, int moverState, int time );
;94:
;95:typedef struct {
;96:	gentity_t	*ent;
;97:	vec3_t	origin;
;98:	vec3_t	angles;
;99:	float	deltayaw;
;100:} pushed_t;
;101:pushed_t	pushed[MAX_GENTITIES], *pushed_p;
;102:
;103:
;104:/*
;105:============
;106:G_TestEntityPosition
;107:
;108:============
;109:*/
;110:gentity_t	*G_TestEntityPosition( gentity_t *ent ) {
line 114
;111:	trace_t	tr;
;112:	int		mask;
;113:
;114:	if ( ent->clipmask ) {
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 0
EQI4 $149
line 115
;115:		mask = ent->clipmask;
ADDRLP4 1080
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 116
;116:	} else {
ADDRGP4 $150
JUMPV
LABELV $149
line 117
;117:		mask = MASK_SOLID;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 118
;118:	}
LABELV $150
line 119
;119:	if ( ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $151
line 121
;120:		vec3_t vMax;
;121:		VectorCopy(ent->r.maxs, vMax);
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRB
ASGNB 12
line 122
;122:		if (vMax[2] < 1)
ADDRLP4 1084+8
INDIRF4
CNSTF4 1065353216
GEF4 $153
line 123
;123:		{
line 124
;124:			vMax[2] = 1;
ADDRLP4 1084+8
CNSTF4 1065353216
ASGNF4
line 125
;125:		}
LABELV $153
line 126
;126:		JP_Trace( &tr, ent->client->ps.origin, ent->r.mins, vMax, ent->client->ps.origin, ent->s.number, mask );
ADDRLP4 0
ARGP4
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1096
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1080
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 127
;127:	} else {
ADDRGP4 $152
JUMPV
LABELV $151
line 128
;128:		JP_Trace( &tr, ent->s.pos.trBase, ent->r.mins, ent->r.maxs, ent->s.pos.trBase, ent->s.number, mask );
ADDRLP4 0
ARGP4
ADDRLP4 1084
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
ADDRLP4 1084
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1084
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1084
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1084
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1080
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 129
;129:	}
LABELV $152
line 131
;130:	
;131:	if (tr.startsolid)
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $157
line 132
;132:		return &g_entities[ tr.entityNum ];
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
RETP4
ADDRGP4 $148
JUMPV
LABELV $157
line 134
;133:		
;134:	return NULL;
CNSTP4 0
RETP4
LABELV $148
endproc G_TestEntityPosition 1104 28
export G_CreateRotationMatrix
proc G_CreateRotationMatrix 4 16
line 142
;135:}
;136:
;137:/*
;138:================
;139:G_CreateRotationMatrix
;140:================
;141:*/
;142:void G_CreateRotationMatrix(vec3_t angles, vec3_t matrix[3]) {
line 143
;143:	AngleVectors(angles, matrix[0], matrix[1], matrix[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 144
;144:	VectorInverse(matrix[1]);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 VectorInverse
CALLV
pop
line 145
;145:}
LABELV $161
endproc G_CreateRotationMatrix 4 16
export G_TransposeMatrix
proc G_TransposeMatrix 24 0
line 152
;146:
;147:/*
;148:================
;149:G_TransposeMatrix
;150:================
;151:*/
;152:void G_TransposeMatrix(vec3_t matrix[3], vec3_t transpose[3]) {
line 154
;153:	int i, j;
;154:	for (i = 0; i < 3; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $163
line 155
;155:		for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $167
line 156
;156:			transpose[i][j] = matrix[j][i];
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 16
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRLP4 16
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ADDP4
INDIRF4
ASGNF4
line 157
;157:		}
LABELV $168
line 155
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $167
line 158
;158:	}
LABELV $164
line 154
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $163
line 159
;159:}
LABELV $162
endproc G_TransposeMatrix 24 0
export G_RotatePoint
proc G_RotatePoint 24 0
line 166
;160:
;161:/*
;162:================
;163:G_RotatePoint
;164:================
;165:*/
;166:void G_RotatePoint(vec3_t point, vec3_t matrix[3]) {
line 169
;167:	vec3_t tvec;
;168:
;169:	VectorCopy(point, tvec);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 170
;170:	point[0] = DotProduct(matrix[0], tvec);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 171
;171:	point[1] = DotProduct(matrix[1], tvec);
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 172
;172:	point[2] = DotProduct(matrix[2], tvec);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 173
;173:}
LABELV $171
endproc G_RotatePoint 24 0
export G_TryPushingEntity
proc G_TryPushingEntity 172 32
line 182
;174:
;175:/*
;176:==================
;177:G_TryPushingEntity
;178:
;179:Returns qfalse if the move is blocked
;180:==================
;181:*/
;182:qboolean	G_TryPushingEntity( gentity_t *check, gentity_t *pusher, vec3_t move, vec3_t amove ) {
line 189
;183:	vec3_t		matrix[3], transpose[3];
;184:	vec3_t		org, org2, move2;
;185:	gentity_t	*block;
;186:
;187:	// EF_MOVER_STOP will just stop when contacting another entity
;188:	// instead of pushing it, but entities can still ride on top of it
;189:	if ( ( pusher->s.eFlags & EF_MOVER_STOP ) && 
ADDRLP4 112
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $179
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ADDRLP4 112
INDIRP4
INDIRI4
EQI4 $179
line 190
;190:		check->s.groundEntityNum != pusher->s.number ) {
line 191
;191:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $178
JUMPV
LABELV $179
line 195
;192:	}
;193:
;194:	// save off the old position
;195:	if (pushed_p > &pushed[MAX_GENTITIES]) {
ADDRGP4 pushed_p
INDIRP4
CVPU4 4
ADDRGP4 pushed+32768
CVPU4 4
LEU4 $181
line 196
;196:		G_Error( "pushed_p > &pushed[MAX_GENTITIES]" );
ADDRGP4 $184
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 197
;197:	}
LABELV $181
line 198
;198:	pushed_p->ent = check;
ADDRGP4 pushed_p
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
line 199
;199:	VectorCopy (check->s.pos.trBase, pushed_p->origin);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 200
;200:	VectorCopy (check->s.apos.trBase, pushed_p->angles);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 201
;201:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $185
line 202
;202:		pushed_p->deltayaw = check->client->ps.delta_angles[YAW];
ADDRGP4 pushed_p
INDIRP4
CNSTI4 28
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 203
;203:		VectorCopy (check->client->ps.origin, pushed_p->origin);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 204
;204:	}
LABELV $185
line 205
;205:	pushed_p++;
ADDRLP4 116
ADDRGP4 pushed_p
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
line 209
;206:
;207:	// try moving the contacted entity 
;208:	// figure movement due to the pusher's amove
;209:	G_CreateRotationMatrix( amove, transpose );
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_CreateRotationMatrix
CALLV
pop
line 210
;210:	G_TransposeMatrix( transpose, matrix );
ADDRLP4 76
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 G_TransposeMatrix
CALLV
pop
line 211
;211:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $187
line 212
;212:		VectorSubtract (check->client->ps.origin, pusher->r.currentOrigin, org);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 213
;213:	}
ADDRGP4 $188
JUMPV
LABELV $187
line 214
;214:	else {
line 215
;215:		VectorSubtract (check->s.pos.trBase, pusher->r.currentOrigin, org);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 120
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 120
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 216
;216:	}
LABELV $188
line 217
;217:	VectorCopy( org, org2 );
ADDRLP4 24
ADDRLP4 12
INDIRB
ASGNB 12
line 218
;218:	G_RotatePoint( org2, matrix );
ADDRLP4 24
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 G_RotatePoint
CALLV
pop
line 219
;219:	VectorSubtract (org2, org, move2);
ADDRLP4 0
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 221
;220:	// add movement
;221:	VectorAdd (check->s.pos.trBase, move, check->s.pos.trBase);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 222
;222:	VectorAdd (check->s.pos.trBase, move2, check->s.pos.trBase);
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 223
;223:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $201
line 224
;224:		VectorAdd (check->client->ps.origin, move, check->client->ps.origin);
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 225
;225:		VectorAdd (check->client->ps.origin, move2, check->client->ps.origin);
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 228
;226:		// make sure the client's view rotates when on a rotating mover
;227:
;228:		DF_PreDeltaAngleChange(check->client);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 DF_PreDeltaAngleChange
CALLV
pop
line 229
;229:		check->client->ps.delta_angles[YAW] += ANGLE2SHORT(amove[YAW]);
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTF4 1199570944
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 230
;230:		DF_PostDeltaAngleChange(check->client,qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 DF_PostDeltaAngleChange
CALLV
pop
line 231
;231:	}
LABELV $201
line 234
;232:
;233:	// may have pushed them off an edge
;234:	if ( check->s.groundEntityNum != pusher->s.number ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $205
line 235
;235:		check->s.groundEntityNum = ENTITYNUM_NONE;//-1;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 1023
ASGNI4
line 236
;236:	}
LABELV $205
line 238
;237:
;238:	block = G_TestEntityPosition( check );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 144
INDIRP4
ASGNP4
line 239
;239:	if (!block) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $207
line 241
;240:		// pushed ok
;241:		if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $209
line 242
;242:			VectorCopy( check->client->ps.origin, check->r.currentOrigin );
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 243
;243:		} else {
ADDRGP4 $210
JUMPV
LABELV $209
line 244
;244:			VectorCopy( check->s.pos.trBase, check->r.currentOrigin );
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 148
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 245
;245:		}
LABELV $210
line 246
;246:		trap_LinkEntity (check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 247
;247:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $178
JUMPV
LABELV $207
line 250
;248:	}
;249:
;250:	if (check->takedamage && !check->client && check->s.weapon && check->r.ownerNum < MAX_CLIENTS &&
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 152
INDIRI4
EQI4 $211
ADDRLP4 148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $211
ADDRLP4 148
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 152
INDIRI4
EQI4 $211
ADDRLP4 148
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 32
GEI4 $211
ADDRLP4 148
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 500
GEI4 $211
line 252
;251:		check->health < 500)
;252:	{
line 253
;253:		if (check->health > 0)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
LEI4 $213
line 254
;254:		{
line 255
;255:			G_Damage(check, pusher, pusher, vec3_origin, check->r.currentOrigin, 999, 0, MOD_UNKNOWN);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 160
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 999
ARGI4
ADDRLP4 164
CNSTI4 0
ASGNI4
ADDRLP4 164
INDIRI4
ARGI4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 256
;256:		}
LABELV $213
line 257
;257:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $178
JUMPV
LABELV $211
line 262
;258:	}
;259:	// if it is ok to leave in the old position, do it
;260:	// this is only relevent for riding entities, not pushed
;261:	// Sliding trapdoors can cause this.
;262:	VectorCopy( (pushed_p-1)->origin, check->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -28
ADDP4
INDIRB
ASGNB 12
line 263
;263:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $215
line 264
;264:		VectorCopy( (pushed_p-1)->origin, check->client->ps.origin);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -28
ADDP4
INDIRB
ASGNB 12
line 265
;265:	}
LABELV $215
line 266
;266:	VectorCopy( (pushed_p-1)->angles, check->s.apos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -16
ADDP4
INDIRB
ASGNB 12
line 267
;267:	block = G_TestEntityPosition (check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 156
INDIRP4
ASGNP4
line 268
;268:	if ( !block ) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $217
line 269
;269:		check->s.groundEntityNum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 -1
ASGNI4
line 270
;270:		pushed_p--;
ADDRLP4 160
ADDRGP4 pushed_p
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
line 271
;271:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $178
JUMPV
LABELV $217
line 275
;272:	}
;273:
;274:	// blocked
;275:	return qfalse;
CNSTI4 0
RETI4
LABELV $178
endproc G_TryPushingEntity 172 32
export G_MoverPush
proc G_MoverPush 4248 32
line 290
;276:}
;277:
;278:
;279:void G_ExplodeMissile( gentity_t *ent );
;280:
;281:/*
;282:============
;283:G_MoverPush
;284:
;285:Objects need to be moved back on a failed push,
;286:otherwise riders would continue to slide.
;287:If qfalse is returned, *obstacle will be the blocking entity
;288:============
;289:*/
;290:qboolean G_MoverPush( gentity_t *pusher, vec3_t move, vec3_t amove, gentity_t **obstacle ) {
line 299
;291:	int			i, e;
;292:	gentity_t	*check;
;293:	vec3_t		mins, maxs;
;294:	pushed_t	*p;
;295:	int			entityList[MAX_GENTITIES];
;296:	int			listedEntities;
;297:	vec3_t		totalMins, totalMaxs;
;298:
;299:	*obstacle = NULL;
ADDRFP4 12
INDIRP4
CNSTP4 0
ASGNP4
line 304
;300:
;301:
;302:	// mins/maxs are the bounds at the destination
;303:	// totalMins / totalMaxs are the bounds for the entire move
;304:	if ( pusher->r.currentAngles[0] || pusher->r.currentAngles[1] || pusher->r.currentAngles[2]
ADDRLP4 4164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4168
CNSTF4 0
ASGNF4
ADDRLP4 4164
INDIRP4
CNSTI4 380
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $226
ADDRLP4 4164
INDIRP4
CNSTI4 384
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $226
ADDRLP4 4164
INDIRP4
CNSTI4 388
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $226
ADDRLP4 4172
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4172
INDIRP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $226
ADDRLP4 4172
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $226
ADDRLP4 4172
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
EQF4 $220
LABELV $226
line 305
;305:		|| amove[0] || amove[1] || amove[2] ) {
line 308
;306:		float		radius;
;307:
;308:		radius = RadiusFromBounds( pusher->r.mins, pusher->r.maxs );
ADDRLP4 4180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4180
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 4180
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 4184
ADDRGP4 RadiusFromBounds
CALLF4
ASGNF4
ADDRLP4 4176
ADDRLP4 4184
INDIRF4
ASGNF4
line 309
;309:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $227
line 310
;310:			mins[i] = pusher->r.currentOrigin[i] + move[i] - radius;
ADDRLP4 4188
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4188
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 4188
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 4188
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ADDRLP4 4176
INDIRF4
SUBF4
ASGNF4
line 311
;311:			maxs[i] = pusher->r.currentOrigin[i] + move[i] + radius;
ADDRLP4 4192
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4192
INDIRI4
ADDRLP4 28
ADDP4
ADDRLP4 4192
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 4192
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ADDRLP4 4176
INDIRF4
ADDF4
ASGNF4
line 312
;312:			totalMins[i] = mins[i] - move[i];
ADDRLP4 4196
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4196
INDIRI4
ADDRLP4 4140
ADDP4
ADDRLP4 4196
INDIRI4
ADDRLP4 16
ADDP4
INDIRF4
ADDRLP4 4196
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 313
;313:			totalMaxs[i] = maxs[i] - move[i];
ADDRLP4 4200
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4200
INDIRI4
ADDRLP4 4152
ADDP4
ADDRLP4 4200
INDIRI4
ADDRLP4 28
ADDP4
INDIRF4
ADDRLP4 4200
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 314
;314:		}
LABELV $228
line 309
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 3
LTI4 $227
line 315
;315:	} else {
ADDRGP4 $221
JUMPV
LABELV $220
line 316
;316:		for (i=0 ; i<3 ; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $231
line 317
;317:			mins[i] = pusher->r.absmin[i] + move[i];
ADDRLP4 4176
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 318
;318:			maxs[i] = pusher->r.absmax[i] + move[i];
ADDRLP4 4180
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
INDIRI4
ADDRLP4 28
ADDP4
ADDRLP4 4180
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
ADDRLP4 4180
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 319
;319:		}
LABELV $232
line 316
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 3
LTI4 $231
line 321
;320:
;321:		VectorCopy( pusher->r.absmin, totalMins );
ADDRLP4 4140
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
INDIRB
ASGNB 12
line 322
;322:		VectorCopy( pusher->r.absmax, totalMaxs );
ADDRLP4 4152
ADDRFP4 0
INDIRP4
CNSTI4 356
ADDP4
INDIRB
ASGNB 12
line 323
;323:		for (i=0 ; i<3 ; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $235
line 324
;324:			if ( move[i] > 0 ) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $239
line 325
;325:				totalMaxs[i] += move[i];
ADDRLP4 4176
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
ADDRLP4 4176
INDIRI4
ADDRLP4 4152
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 326
;326:			} else {
ADDRGP4 $240
JUMPV
LABELV $239
line 327
;327:				totalMins[i] += move[i];
ADDRLP4 4176
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
ADDRLP4 4176
INDIRI4
ADDRLP4 4140
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 328
;328:			}
LABELV $240
line 329
;329:		}
LABELV $236
line 323
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 3
LTI4 $235
line 330
;330:	}
LABELV $221
line 333
;331:
;332:	// unlink the pusher so we don't get it in the entityList
;333:	trap_UnlinkEntity( pusher );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 335
;334:
;335:	listedEntities = trap_EntitiesInBox( totalMins, totalMaxs, entityList, MAX_GENTITIES );
ADDRLP4 4140
ARGP4
ADDRLP4 4152
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4176
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4136
ADDRLP4 4176
INDIRI4
ASGNI4
line 338
;336:
;337:	// move the pusher to it's final position
;338:	VectorAdd( pusher->r.currentOrigin, move, pusher->r.currentOrigin );
ADDRLP4 4180
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4184
ADDRFP4 0
INDIRP4
CNSTI4 372
ADDP4
ASGNP4
ADDRLP4 4184
INDIRP4
ADDRLP4 4184
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4188
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
ASGNP4
ADDRLP4 4188
INDIRP4
ADDRLP4 4188
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 339
;339:	VectorAdd( pusher->r.currentAngles, amove, pusher->r.currentAngles );
ADDRLP4 4192
ADDRFP4 0
INDIRP4
CNSTI4 380
ADDP4
ASGNP4
ADDRLP4 4192
INDIRP4
ADDRLP4 4192
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4196
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
ASGNP4
ADDRLP4 4196
INDIRP4
ADDRLP4 4196
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4200
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
ASGNP4
ADDRLP4 4200
INDIRP4
ADDRLP4 4200
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 340
;340:	trap_LinkEntity( pusher );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 343
;341:
;342:	// see if any solid entities are inside the final position
;343:	for ( e = 0 ; e < listedEntities ; e++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $244
JUMPV
LABELV $241
line 344
;344:		check = &g_entities[ entityList[ e ] ];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 347
;345:
;346:		// only push items and players
;347:		if ( /*check->s.eType != ET_ITEM &&*/ (check->s.eType != ET_PLAYER || check->client && check->client->noclip) && !check->physicsObject ) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $247
ADDRLP4 4208
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $245
ADDRLP4 4208
INDIRP4
CNSTI4 43600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $245
LABELV $247
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
NEI4 $245
line 348
;348:			continue;
ADDRGP4 $242
JUMPV
LABELV $245
line 352
;349:		}
;350:
;351:		// if the entity is standing on the pusher, it will definitely be moved
;352:		if ( check->s.groundEntityNum != pusher->s.number ) {
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $248
line 354
;353:			// see if the ent needs to be tested
;354:			if ( check->r.absmin[0] >= maxs[0]
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
GEF4 $260
ADDRLP4 4
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 28+4
INDIRF4
GEF4 $260
ADDRLP4 4
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDRLP4 28+8
INDIRF4
GEF4 $260
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $260
ADDRLP4 4
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
LEF4 $260
ADDRLP4 4
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
GTF4 $250
LABELV $260
line 359
;355:			|| check->r.absmin[1] >= maxs[1]
;356:			|| check->r.absmin[2] >= maxs[2]
;357:			|| check->r.absmax[0] <= mins[0]
;358:			|| check->r.absmax[1] <= mins[1]
;359:			|| check->r.absmax[2] <= mins[2] ) {
line 360
;360:				continue;
ADDRGP4 $242
JUMPV
LABELV $250
line 364
;361:			}
;362:			// see if the ent's bbox is inside the pusher's final position
;363:			// this does allow a fast moving object to pass through a thin entity...
;364:			if (!G_TestEntityPosition (check)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4216
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 4216
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $261
line 365
;365:				continue;
ADDRGP4 $242
JUMPV
LABELV $261
line 367
;366:			}
;367:		}
LABELV $248
line 369
;368:
;369:		if (check->client) {
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $263
line 370
;370:			check->client->pers.roll.segmentDisqualified = qtrue; // movers could influence rolls. disqualify from rollympics.
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43356
ADDP4
CNSTI4 1
ASGNI4
line 371
;371:		}
LABELV $263
line 374
;372:
;373:		// the entity needs to be pushed
;374:		if ( G_TryPushingEntity( check, pusher, move, amove ) ) {
ADDRLP4 4
INDIRP4
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
ADDRLP4 4212
ADDRGP4 G_TryPushingEntity
CALLI4
ASGNI4
ADDRLP4 4212
INDIRI4
CNSTI4 0
EQI4 $265
line 375
;375:			continue;
ADDRGP4 $242
JUMPV
LABELV $265
line 378
;376:		}
;377:
;378:		if (pusher->damage && check->client && (pusher->spawnflags & 32))
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4220
CNSTI4 0
ASGNI4
ADDRLP4 4216
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
ADDRLP4 4220
INDIRI4
EQI4 $267
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $267
ADDRLP4 4216
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 4220
INDIRI4
EQI4 $267
line 379
;379:		{
line 380
;380:			G_Damage( check, pusher, pusher, NULL, NULL, pusher->damage, 0, MOD_CRUSH );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4224
INDIRP4
ARGP4
ADDRLP4 4224
INDIRP4
ARGP4
ADDRLP4 4228
CNSTP4 0
ASGNP4
ADDRLP4 4228
INDIRP4
ARGP4
ADDRLP4 4228
INDIRP4
ARGP4
ADDRLP4 4224
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 381
;381:			continue;
ADDRGP4 $242
JUMPV
LABELV $267
line 387
;382:		}
;383:
;384:		// the move was blocked an entity
;385:
;386:		// bobbing entities are instant-kill and never get blocked
;387:		if ( pusher->s.pos.trType == TR_SINE || pusher->s.apos.trType == TR_SINE ) {
ADDRLP4 4224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4228
CNSTI4 4
ASGNI4
ADDRLP4 4224
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4228
INDIRI4
EQI4 $271
ADDRLP4 4224
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 4228
INDIRI4
NEI4 $269
LABELV $271
line 388
;388:			G_Damage( check, pusher, pusher, NULL, NULL, 99999, 0, MOD_CRUSH );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4232
INDIRP4
ARGP4
ADDRLP4 4232
INDIRP4
ARGP4
ADDRLP4 4236
CNSTP4 0
ASGNP4
ADDRLP4 4236
INDIRP4
ARGP4
ADDRLP4 4236
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 389
;389:			continue;
ADDRGP4 $242
JUMPV
LABELV $269
line 394
;390:		}
;391:
;392:		
;393:		// save off the obstacle so we can call the block function (crush, etc)
;394:		*obstacle = check;
ADDRFP4 12
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 399
;395:
;396:		// move back any entities we already moved
;397:		// go backwards, so if the same entity was pushed
;398:		// twice, it goes back to the original position
;399:		for ( p=pushed_p-1 ; p>=pushed ; p-- ) {
ADDRLP4 0
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
ADDRGP4 $275
JUMPV
LABELV $272
line 400
;400:			VectorCopy (p->origin, p->ent->s.pos.trBase);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 12
line 401
;401:			VectorCopy (p->angles, p->ent->s.apos.trBase);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRB
ASGNB 12
line 402
;402:			if ( p->ent->client ) {
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $276
line 403
;403:				DF_PreDeltaAngleChange(p->ent->client);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 DF_PreDeltaAngleChange
CALLV
pop
line 404
;404:				p->ent->client->ps.delta_angles[YAW] = p->deltayaw;
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 405
;405:				DF_PostDeltaAngleChange(p->ent->client, qtrue);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 DF_PostDeltaAngleChange
CALLV
pop
line 406
;406:				VectorCopy (p->origin, p->ent->client->ps.origin);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 12
line 407
;407:			}
LABELV $276
line 408
;408:			trap_LinkEntity (p->ent);
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 409
;409:		}
LABELV $273
line 399
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
LABELV $275
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 pushed
CVPU4 4
GEU4 $272
line 410
;410:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $219
JUMPV
LABELV $242
line 343
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $244
ADDRLP4 12
INDIRI4
ADDRLP4 4136
INDIRI4
LTI4 $241
line 413
;411:	}
;412:
;413:	return qtrue;
CNSTI4 1
RETI4
LABELV $219
endproc G_MoverPush 4248 32
export G_MoverTeam
proc G_MoverTeam 128 16
line 422
;414:}
;415:
;416:
;417:/*
;418:=================
;419:G_MoverTeam
;420:=================
;421:*/
;422:void G_MoverTeam( gentity_t *ent ) {
line 426
;423:	vec3_t		move, amove;
;424:	gentity_t	*part, *obstacle;
;425:	vec3_t		origin, angles;
;426:	int			nowTime = MOVERTIME_ENT(ent);
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 760
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
EQU4 $282
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $282
ADDRLP4 80
ADDRLP4 68
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $282
ADDRLP4 80
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $282
ADDRLP4 80
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $282
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $282
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 84
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 84
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $283
JUMPV
LABELV $282
ADDRLP4 64
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $283
ADDRLP4 4
ADDRLP4 64
INDIRI4
ASGNI4
line 427
;427:	int			oldTime = MOVERTIMEOLD_ENT(ent);
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
CNSTU4 0
ASGNU4
ADDRLP4 92
INDIRP4
CVPU4 4
ADDRLP4 96
INDIRU4
EQU4 $287
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $287
ADDRLP4 104
ADDRLP4 92
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CVPU4 4
ADDRLP4 96
INDIRU4
EQU4 $287
ADDRLP4 104
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $287
ADDRLP4 104
INDIRP4
INDIRI4
ADDRLP4 100
INDIRI4
LEI4 $287
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $287
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
ADDRLP4 108
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
INDIRI4
ADDRLP4 108
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $288
JUMPV
LABELV $287
ADDRLP4 88
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $288
ADDRLP4 60
ADDRLP4 88
INDIRI4
ASGNI4
line 429
;428:
;429:	obstacle = NULL;
ADDRLP4 56
CNSTP4 0
ASGNP4
line 434
;430:
;431:	// make sure all team slaves can move before commiting
;432:	// any moves or calling any think functions
;433:	// if the move is blocked, all moved objects will be backed out
;434:	pushed_p = pushed;
ADDRGP4 pushed_p
ADDRGP4 pushed
ASGNP4
line 435
;435:	for (part = ent ; part ; part=part->teamchain) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $292
JUMPV
LABELV $289
line 437
;436:		// get current position
;437:		BG_EvaluateTrajectory( &part->s.pos, nowTime, origin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 32
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 438
;438:		BG_EvaluateTrajectory( &part->s.apos, nowTime, angles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 44
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 439
;439:		VectorSubtract( origin, part->r.currentOrigin, move );
ADDRLP4 8
ADDRLP4 32
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 32+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 32+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 440
;440:		VectorSubtract( angles, part->r.currentAngles, amove );
ADDRLP4 20
ADDRLP4 44
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 44+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 44+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRF4
SUBF4
ASGNF4
line 441
;441:		if ( !G_MoverPush( part, move, amove, &obstacle ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 120
ADDRGP4 G_MoverPush
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $301
line 442
;442:			break;	// move was blocked
ADDRGP4 $291
JUMPV
LABELV $301
line 444
;443:		}
;444:	}
LABELV $290
line 435
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRP4
ASGNP4
LABELV $292
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $289
LABELV $291
line 446
;445:
;446:	if (part) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $303
line 448
;447:		// go back to the previous position
;448:		for ( part = ent ; part ; part = part->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $308
JUMPV
LABELV $305
line 449
;449:			part->s.pos.trTime += nowTime - oldTime;
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 60
INDIRI4
SUBI4
ADDI4
ASGNI4
line 450
;450:			part->s.apos.trTime += nowTime - oldTime;
ADDRLP4 116
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 60
INDIRI4
SUBI4
ADDI4
ASGNI4
line 451
;451:			BG_EvaluateTrajectory( &part->s.pos, nowTime, part->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 452
;452:			BG_EvaluateTrajectory( &part->s.apos, nowTime, part->r.currentAngles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 453
;453:			trap_LinkEntity( part );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 454
;454:		}
LABELV $306
line 448
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRP4
ASGNP4
LABELV $308
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $305
line 457
;455:
;456:		// if the pusher has a "blocked" function, call it
;457:		if (ent->blocked) {
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $278
line 458
;458:			ent->blocked( ent, obstacle );
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CALLV
pop
line 459
;459:		}
line 460
;460:		return;
ADDRGP4 $278
JUMPV
LABELV $303
line 464
;461:	}
;462:
;463:	// the move succeeded
;464:	for ( part = ent ; part ; part = part->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $314
JUMPV
LABELV $311
line 466
;465:		// call the reached function if time is at or past end point
;466:		if ( part->s.pos.trType == TR_LINEAR_STOP ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $315
line 467
;467:			if (nowTime >= part->s.pos.trTime + part->s.pos.trDuration ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDI4
LTI4 $317
line 468
;468:				if ( part->reached ) {
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $319
line 469
;469:					part->reached( part );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CALLV
pop
line 470
;470:				}
LABELV $319
line 471
;471:			}
LABELV $317
line 472
;472:		}
LABELV $315
line 473
;473:	}
LABELV $312
line 464
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRP4
ASGNP4
LABELV $314
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $311
line 474
;474:}
LABELV $278
endproc G_MoverTeam 128 16
export G_RunMover
proc G_RunMover 8 4
line 482
;475:
;476:/*
;477:================
;478:G_RunMover
;479:
;480:================
;481:*/
;482:void G_RunMover( gentity_t *ent ) {
line 485
;483:	// if not a team captain, don't do anything, because
;484:	// the captain will handle everything
;485:	if ( ent->flags & FL_TEAMSLAVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $322
line 486
;486:		return;
ADDRGP4 $321
JUMPV
LABELV $322
line 490
;487:	}
;488:
;489:	// if stationary at one of the positions, don't move anything
;490:	if ( ent->s.pos.trType != TR_STATIONARY || ent->s.apos.trType != TR_STATIONARY ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $326
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $324
LABELV $326
line 491
;491:		G_MoverTeam( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_MoverTeam
CALLV
pop
line 492
;492:	}
LABELV $324
line 495
;493:
;494:	// check think function
;495:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 496
;496:}
LABELV $321
endproc G_RunMover 8 4
export SetMoverState
proc SetMoverState 84 12
line 513
;497:
;498:/*
;499:============================================================================
;500:
;501:GENERAL MOVERS
;502:
;503:Doors, plats, and buttons are all binary (two position) movers
;504:Pos1 is "at rest", pos2 is "activated"
;505:============================================================================
;506:*/
;507:
;508:/*
;509:===============
;510:SetMoverState
;511:===============
;512:*/
;513:void SetMoverState( gentity_t *ent, moverState_t moverState, int time ) {
line 516
;514:	vec3_t			delta;
;515:	float			f; 
;516:	int				nowTime = MOVERTIME_ENT(ent);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 760
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
EQU4 $331
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $331
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
ADDRLP4 28
INDIRU4
EQU4 $331
ADDRLP4 36
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $331
ADDRLP4 36
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $331
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $331
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 40
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $332
JUMPV
LABELV $331
ADDRLP4 20
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $332
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 518
;517:
;518:	ent->moverState = moverState;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 520
;519:
;520:	ent->s.pos.trTime = time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 521
;521:	switch( moverState ) {
ADDRLP4 44
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LTI4 $333
ADDRLP4 44
INDIRI4
CNSTI4 3
GTI4 $333
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $348
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $348
address $336
address $337
address $338
address $343
code
LABELV $336
line 523
;522:	case MOVER_POS1:
;523:		VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 552
ADDP4
INDIRB
ASGNB 12
line 524
;524:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 525
;525:		break;
ADDRGP4 $334
JUMPV
LABELV $337
line 527
;526:	case MOVER_POS2:
;527:		VectorCopy( ent->pos2, ent->s.pos.trBase );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 564
ADDP4
INDIRB
ASGNB 12
line 528
;528:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 529
;529:		break;
ADDRGP4 $334
JUMPV
LABELV $338
line 531
;530:	case MOVER_1TO2:
;531:		VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 552
ADDP4
INDIRB
ASGNB 12
line 532
;532:		VectorSubtract( ent->pos2, ent->pos1, delta );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 64
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 64
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 68
INDIRP4
CNSTI4 572
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
SUBF4
ASGNF4
line 533
;533:		f = 1000.0 / ent->s.pos.trDuration;
ADDRLP4 16
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 534
;534:		VectorScale( delta, f, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 535
;535:		ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 536
;536:		break;
ADDRGP4 $334
JUMPV
LABELV $343
line 538
;537:	case MOVER_2TO1:
;538:		VectorCopy( ent->pos2, ent->s.pos.trBase );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 564
ADDP4
INDIRB
ASGNB 12
line 539
;539:		VectorSubtract( ent->pos1, ent->pos2, delta );
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 76
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 76
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 80
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 572
ADDP4
INDIRF4
SUBF4
ASGNF4
line 540
;540:		f = 1000.0 / ent->s.pos.trDuration;
ADDRLP4 16
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 541
;541:		VectorScale( delta, f, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 4+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 4+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 542
;542:		ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 543
;543:		break;
LABELV $333
LABELV $334
line 545
;544:	}
;545:	BG_EvaluateTrajectory( &ent->s.pos, nowTime, ent->r.currentOrigin );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 546
;546:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 547
;547:}
LABELV $327
endproc SetMoverState 84 12
export MatchTeam
proc MatchTeam 4 12
line 557
;548:
;549:/*
;550:================
;551:MatchTeam
;552:
;553:All entities in a mover team will move from pos1 to pos2
;554:in the same amount of time
;555:================
;556:*/
;557:void MatchTeam( gentity_t *teamLeader, int moverState, int time ) {
line 560
;558:	gentity_t		*slave;
;559:
;560:	for ( slave = teamLeader ; slave ; slave = slave->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $353
JUMPV
LABELV $350
line 561
;561:		SetMoverState( slave, moverState, time );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 562
;562:	}
LABELV $351
line 560
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRP4
ASGNP4
LABELV $353
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $350
line 563
;563:}
LABELV $349
endproc MatchTeam 4 12
export ReturnToPos1
proc ReturnToPos1 12 12
line 572
;564:
;565:
;566:
;567:/*
;568:================
;569:ReturnToPos1
;570:================
;571:*/
;572:void ReturnToPos1( gentity_t *ent ) {
line 574
;573:
;574:	G_ResetActivatorTimeDelta(ent, ent->activatorReal); // if moving on client time, reset before every mover state change
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ResetActivatorTimeDelta
CALLI4
pop
line 576
;575:
;576:	MatchTeam( ent, MOVER_2TO1, level.time); // technically we wanna use the activator (client) time if possible but since we just did the reset, it's the same as level.time
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 579
;577:
;578:	// looping sound
;579:	ent->s.loopSound = ent->soundLoop;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ASGNI4
line 582
;580:
;581:	// starting sound
;582:	if ( ent->sound2to1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $356
line 583
;583:		G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound2to1 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 584
;584:	}
LABELV $356
line 585
;585:}
LABELV $354
endproc ReturnToPos1 12 12
export Reached_BinaryMover
proc Reached_BinaryMover 24 12
line 593
;586:
;587:
;588:/*
;589:================
;590:Reached_BinaryMover
;591:================
;592:*/
;593:void Reached_BinaryMover( gentity_t *ent ) {
line 595
;594:	//int			nowTime = MOVERTIME_ENT(ent);  // technically we wanna use the activator (client) time if possible but since we will do a reset, it's the same as level.time
;595:	int				nowTime = level.time;// technically we wanna use the activator (client) time if possible but since we will do a reset, it's the same as level.time
ADDRLP4 0
ADDRGP4 level+36
INDIRI4
ASGNI4
line 598
;596:
;597:	// stop the looping sound
;598:	ent->s.loopSound = ent->soundLoop;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ASGNI4
line 600
;599:
;600:	if ( ent->moverState == MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 2
NEI4 $360
line 602
;601:		// reached pos2
;602:		nowTime = G_ResetActivatorTimeDelta(ent, ent->activatorReal); // if moving on client time, reset before every mover state change
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_ResetActivatorTimeDelta
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 603
;603:		SetMoverState( ent, MOVER_POS2, nowTime);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 606
;604:
;605:		// play sound
;606:		if ( ent->soundPos2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $362
line 607
;607:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->soundPos2 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 608
;608:		}
LABELV $362
line 610
;609:
;610:		ent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 613
;611:
;612:		// return to pos1 after a delay
;613:		ent->think = ReturnToPos1;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 ReturnToPos1
ASGNP4
line 614
;614:		ent->nextthink = nowTime + ent->wait;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 616
;615:
;616:		if (ent->delay)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $364
line 617
;617:		{
line 618
;618:			ent->think = ReturnToPos1;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 ReturnToPos1
ASGNP4
line 619
;619:			ent->nextthink = nowTime + ent->delay;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDI4
ASGNI4
line 620
;620:		}
LABELV $364
line 623
;621:
;622:		// fire targets
;623:		if ( !ent->activator ) {
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $366
line 624
;624:			G_SetActivator(ent, ent);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 626
;625:			//ent->activator = ent;
;626:		}
LABELV $366
line 627
;627:		G_UseTargets( ent, ent->activator );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 628
;628:	} else if ( ent->moverState == MOVER_2TO1 ) {
ADDRGP4 $361
JUMPV
LABELV $360
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 3
NEI4 $368
line 630
;629:		// reached pos1
;630:		nowTime = G_ResetActivatorTimeDelta(ent, ent->activatorReal); // if moving on client time, reset before every mover state change
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_ResetActivatorTimeDelta
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 631
;631:		SetMoverState( ent, MOVER_POS1, nowTime);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 634
;632:
;633:		// play sound
;634:		if ( ent->soundPos1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $370
line 635
;635:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->soundPos1 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 636
;636:		}
LABELV $370
line 638
;637:
;638:		ent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 640
;639:
;640:		if (ent->delay)
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $372
line 641
;641:		{ //it won't go back up again this way until after the delay
line 642
;642:			ent->last_move_time = nowTime + ent->delay;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 684
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDI4
ASGNI4
line 643
;643:		}
LABELV $372
line 646
;644:
;645:		// close areaportals
;646:		if ( ent->teammaster == ent || !ent->teammaster ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 756
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 20
INDIRU4
ADDRLP4 16
INDIRP4
CVPU4 4
EQU4 $376
ADDRLP4 20
INDIRU4
CNSTU4 0
NEU4 $369
LABELV $376
line 647
;647:			trap_AdjustAreaPortalState( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_AdjustAreaPortalState
CALLV
pop
line 648
;648:		}
line 649
;649:	} else {
ADDRGP4 $369
JUMPV
LABELV $368
line 650
;650:		G_Error( "Reached_BinaryMover: bad moverState" );
ADDRGP4 $377
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 651
;651:	}
LABELV $369
LABELV $361
line 652
;652:}
LABELV $358
endproc Reached_BinaryMover 24 12
export Use_BinaryMover
proc Use_BinaryMover 56 12
line 660
;653:
;654:
;655:/*
;656:================
;657:Use_BinaryMover
;658:================
;659:*/
;660:void Use_BinaryMover( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 666
;661:	int		total;
;662:	int		partial; 
;663:	int		nowTime;// = ACTIVATORTIME(ent->activatorReal);
;664:
;665:	// only the master should be used
;666:	if ( ent->flags & FL_TEAMSLAVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $379
line 667
;667:		Use_BinaryMover( ent->teammaster, other, activator );
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 668
;668:		return;
ADDRGP4 $378
JUMPV
LABELV $379
line 734
;669:	}
;670:
;671:#if 0 // japro: MAYBE do this? not sure i like it
;672:	if (activator->client &&
;673:		activator->client->sess.raceMode &&
;674:		(!other || !(other->spawnflags & 4)) &&
;675:		!(ent->spawnflags & 256) && //Let mapmaker bypass this...
;676:		((ent->pos2[2] - ent->pos1[2]) > 128) &&
;677:		(activator->client->ps.origin[2] < (ent->r.absmax[2] + 96)) &&
;678:		(activator->client->ps.origin[2] > (ent->r.absmax[2] - 96))) //We are in racemode, and the door/plat/ele moves upwawrds. Ideally could also check for angle == -1 or -2 but where is that..
;679:	{ //Turn this ele into a jumppad.  Also only do this if the trigger was not a use button
;680:		float height, time, strength;
;681:
;682:		//No good way to get bottom origin of the mover..? Could be weird geometry... so just assume the top of the ele model in starting position is the "bottom" of the ele.
;683:		/*
;684:		float jumpHeight;
;685:
;686:		switch (activator->client->sess.movementStyle)
;687:		{
;688:			case 0://Siege
;689:			case 1://JKA
;690:			case 2://QW
;691:				jumpHeight = forceJumpHeight[activator->client->ps.fd.forcePowerLevel[FP_LEVITATION]];
;692:				break;
;693:			case 3://CPM
;694:			case 4://Q3
;695:				jumpHeight = 64;//whatever
;696:				break;
;697:			case 5://PJK
;698:				jumpHeight = forceJumpHeight[activator->client->ps.fd.forcePowerLevel[FP_LEVITATION]];
;699:				break;
;700:			case 6://WSW
;701:				jumpHeight = 72;//whatever
;702:				break;
;703:			case 7://RJQ3
;704:			case 8://RJCPM
;705:				jumpHeight = 260;//whatever
;706:				break;
;707:			default:
;708:				jumpHeight = 0;
;709:				break;
;710:		}
;711:		*/
;712:
;713:		//ent->damage = 0; //Temp
;714:
;715:		//trap->Print("assumed ele starting height: %.2f, pos1: %2f, pos2: %2f, Our Height: %.2f\n", ent->r.absmax[2], ent->pos1[2], ent->pos2[2], activator->client->ps.origin[2]); //Lets assume the ele starts there...
;716:
;717:		height = ent->pos2[2] - ent->pos1[2] + 64; //Send them up a lil higher just to be safe
;718:		time = sqrt(height / (.5f * g_gravity.value));
;719:		if (!time)
;720:			return; //bua ?
;721:		strength = (height / time) * 2.0f;
;722:
;723:		activator->client->ps.velocity[0] = activator->client->ps.velocity[1] = 0; //reset our xyspeed... meh
;724:		if (strength > activator->client->ps.velocity[2]) //Only apply the jumppad if it would speed them up
;725:			activator->client->ps.velocity[2] = strength;
;726:
;727:		//trap->Print("Height: %.2f, time: %.2fstrength: %.2f\n", height, time, strength);
;728:
;729:		return;
;730:	}
;731:#endif
;732:
;733:	//ent->activator = activator;
;734:	G_SetActivator(ent, activator); 
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 735
;735:	nowTime = MOVERTIME_ENT(ent);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 760
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
EQU4 $384
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $384
ADDRLP4 28
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $384
ADDRLP4 28
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $384
ADDRLP4 28
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $384
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $384
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 32
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $385
JUMPV
LABELV $384
ADDRLP4 12
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $385
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 737
;736:
;737:	if ( ent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $386
line 741
;738:		// start moving 50 msec later, becase if this was player
;739:		// triggered, level.time hasn't been advanced yet
;740:
;741:		nowTime = G_ResetActivatorTimeDelta(ent, ent->activatorReal); // if moving on client time, reset before every mover state change
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_ResetActivatorTimeDelta
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 40
INDIRI4
ASGNI4
line 742
;742:		MatchTeam( ent, MOVER_1TO2, nowTime + 50 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 50
ADDI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 745
;743:
;744:		// starting sound
;745:		if ( ent->sound1to2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $388
line 746
;746:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound1to2 );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 747
;747:		}
LABELV $388
line 750
;748:
;749:		// looping sound
;750:		ent->s.loopSound = ent->soundLoop;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ASGNI4
line 753
;751:
;752:		// open areaportal
;753:		if ( ent->teammaster == ent || !ent->teammaster ) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
CNSTI4 756
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 52
INDIRU4
ADDRLP4 48
INDIRP4
CVPU4 4
EQU4 $392
ADDRLP4 52
INDIRU4
CNSTU4 0
NEU4 $378
LABELV $392
line 754
;754:			trap_AdjustAreaPortalState( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_AdjustAreaPortalState
CALLV
pop
line 755
;755:		}
line 756
;756:		return;
ADDRGP4 $378
JUMPV
LABELV $386
line 760
;757:	}
;758:
;759:	// if all the way up, just delay before coming down
;760:	if ( ent->moverState == MOVER_POS2 && other && other->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 1
NEI4 $393
ADDRLP4 36
ADDRFP4 4
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
EQU4 $393
ADDRLP4 36
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $393
line 762
;761:		//rww - don't delay if we're not being used by a player
;762:		ent->nextthink = nowTime + ent->wait;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 44
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 763
;763:		return;
ADDRGP4 $378
JUMPV
LABELV $393
line 767
;764:	}
;765:
;766:	// only partway down before reversing
;767:	if ( ent->moverState == MOVER_2TO1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 3
NEI4 $395
line 770
;768:		// hmm should we update the client time here? maybe not.
;769:		//nowTime = G_ResetActivatorTimeDelta(ent, ent->activatorReal); // if moving on client time, reset before every mover state change
;770:		total = ent->s.pos.trDuration;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 771
;771:		partial = nowTime - ent->s.pos.trTime;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
ASGNI4
line 772
;772:		if ( partial > total ) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $397
line 773
;773:			partial = total;
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
line 774
;774:		}
LABELV $397
line 776
;775:
;776:		MatchTeam( ent, MOVER_1TO2, nowTime - ( total - partial ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
SUBI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 778
;777:
;778:		if ( ent->sound1to2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $378
line 779
;779:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound1to2 );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 780
;780:		}
line 781
;781:		return;
ADDRGP4 $378
JUMPV
LABELV $395
line 785
;782:	}
;783:
;784:	// only partway up before reversing
;785:	if ( ent->moverState == MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 2
NEI4 $401
line 788
;786:		// hmm should we update the client time here? maybe not.
;787:		//nowTime = G_ResetActivatorTimeDelta(ent, ent->activatorReal); // if moving on client time, reset before every mover state change
;788:		total = ent->s.pos.trDuration;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 789
;789:		partial = nowTime - ent->s.pos.trTime;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
ASGNI4
line 790
;790:		if ( partial > total ) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $403
line 791
;791:			partial = total;
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
line 792
;792:		}
LABELV $403
line 794
;793:
;794:		MatchTeam( ent, MOVER_2TO1, nowTime - ( total - partial ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
SUBI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 796
;795:
;796:		if ( ent->sound2to1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $378
line 797
;797:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound2to1 );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 798
;798:		}
line 799
;799:		return;
LABELV $401
line 801
;800:	}
;801:}
LABELV $378
endproc Use_BinaryMover 56 12
export InitMover
proc InitMover 100 12
line 813
;802:
;803:
;804:
;805:/*
;806:================
;807:InitMover
;808:
;809:"pos1", "pos2", and "speed" should be set before calling,
;810:so the movement delta can be calculated
;811:================
;812:*/
;813:void InitMover( gentity_t *ent ) {
line 821
;814:	vec3_t		move;
;815:	float		distance;
;816:	float		light;
;817:	vec3_t		color;
;818:	qboolean	lightSet, colorSet;
;819:	char		*sound;
;820:
;821:	level.nonDeterministicEntities++;
ADDRLP4 44
ADDRGP4 level+9148
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 824
;822:
;823:	// Tunnel high modelindex values through time2
;824:	MV_ModelindexToTime2( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MV_ModelindexToTime2
CALLV
pop
line 828
;825:
;826:	// if the "model2" key is set, use a seperate model
;827:	// for drawing, but clip against the brushes
;828:	if ( ent->model2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $409
line 829
;829:		ent->s.modelindex2 = G_ModelIndex( ent->model2 );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 484
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 830
;830:	}
LABELV $409
line 833
;831:
;832:	// if the "loopsound" key is set, use a constant looping sound when moving
;833:	if ( G_SpawnString( "noise", "100", &sound ) ) {
ADDRGP4 $413
ARGP4
ADDRGP4 $414
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 48
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $411
line 834
;834:		ent->s.loopSound = G_SoundIndex( sound );
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 835
;835:	}
LABELV $411
line 838
;836:
;837:	// if the "color" or "light" keys are set, setup constantLight
;838:	lightSet = G_SpawnFloat( "light", "100", &light );
ADDRGP4 $415
ARGP4
ADDRGP4 $414
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 52
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 52
INDIRI4
ASGNI4
line 839
;839:	colorSet = G_SpawnVector( "color", "1 1 1", color );
ADDRGP4 $416
ARGP4
ADDRGP4 $417
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 56
ADDRGP4 G_SpawnVector
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 56
INDIRI4
ASGNI4
line 840
;840:	if ( lightSet || colorSet ) {
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $420
ADDRLP4 32
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $418
LABELV $420
line 843
;841:		int		r, g, b, i;
;842:
;843:		r = color[0] * 255;
ADDRLP4 64
CNSTF4 1132396544
ADDRLP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 844
;844:		if ( r > 255 ) {
ADDRLP4 64
INDIRI4
CNSTI4 255
LEI4 $421
line 845
;845:			r = 255;
ADDRLP4 64
CNSTI4 255
ASGNI4
line 846
;846:		}
LABELV $421
line 847
;847:		g = color[1] * 255;
ADDRLP4 68
CNSTF4 1132396544
ADDRLP4 12+4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 848
;848:		if ( g > 255 ) {
ADDRLP4 68
INDIRI4
CNSTI4 255
LEI4 $424
line 849
;849:			g = 255;
ADDRLP4 68
CNSTI4 255
ASGNI4
line 850
;850:		}
LABELV $424
line 851
;851:		b = color[2] * 255;
ADDRLP4 72
CNSTF4 1132396544
ADDRLP4 12+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 852
;852:		if ( b > 255 ) {
ADDRLP4 72
INDIRI4
CNSTI4 255
LEI4 $427
line 853
;853:			b = 255;
ADDRLP4 72
CNSTI4 255
ASGNI4
line 854
;854:		}
LABELV $427
line 855
;855:		i = light / 4;
ADDRLP4 76
ADDRLP4 36
INDIRF4
CNSTF4 1082130432
DIVF4
CVFI4 4
ASGNI4
line 856
;856:		if ( i > 255 ) {
ADDRLP4 76
INDIRI4
CNSTI4 255
LEI4 $429
line 857
;857:			i = 255;
ADDRLP4 76
CNSTI4 255
ASGNI4
line 858
;858:		}
LABELV $429
line 859
;859:		ent->s.constantLight = r | ( g << 8 ) | ( b << 16 ) | ( i << 24 );
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 72
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 76
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 860
;860:	}
LABELV $418
line 863
;861:
;862:
;863:	ent->use = Use_BinaryMover;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 Use_BinaryMover
ASGNP4
line 864
;864:	ent->reached = Reached_BinaryMover;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 Reached_BinaryMover
ASGNP4
line 866
;865:
;866:	ent->moverState = MOVER_POS1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 0
ASGNI4
line 867
;867:	ent->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 868
;868:	ent->s.eType = ET_MOVER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 6
ASGNI4
line 869
;869:	VectorCopy (ent->pos1, ent->r.currentOrigin);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 552
ADDP4
INDIRB
ASGNB 12
line 870
;870:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 872
;871:
;872:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 873
;873:	VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 552
ADDP4
INDIRB
ASGNB 12
line 876
;874:
;875:	// calculate time to reach second position from speed
;876:	VectorSubtract( ent->pos2, ent->pos1, move );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 72
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 76
INDIRP4
CNSTI4 572
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
SUBF4
ASGNF4
line 877
;877:	distance = VectorLength( move );
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 80
INDIRF4
ASGNF4
line 878
;878:	if ( ! ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
CNSTF4 0
NEF4 $433
line 879
;879:		ent->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTF4 1120403456
ASGNF4
line 880
;880:	}
LABELV $433
line 881
;881:	VectorScale( move, ent->speed, ent->s.pos.trDelta );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
MULF4
ASGNF4
line 882
;882:	ent->s.pos.trDuration = distance * 1000 / ent->speed;
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 96
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 883
;883:	if ( ent->s.pos.trDuration <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
GTI4 $437
line 884
;884:		ent->s.pos.trDuration = 1;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 885
;885:	}
LABELV $437
line 886
;886:}
LABELV $407
endproc InitMover 100 12
export Blocked_Door
proc Blocked_Door 24 32
line 905
;887:
;888:
;889:/*
;890:===============================================================================
;891:
;892:DOOR
;893:
;894:A use can be triggered either by a touch function, by being shot, or by being
;895:targeted by another entity.
;896:
;897:===============================================================================
;898:*/
;899:
;900:/*
;901:================
;902:Blocked_Door
;903:================
;904:*/
;905:void Blocked_Door( gentity_t *ent, gentity_t *other ) {
line 907
;906:	// remove anything other than a client
;907:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $440
line 909
;908:		// except CTF flags!!!!
;909:		if( other->s.eType == ET_ITEM && other->item->giType == IT_TEAM ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $442
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $442
line 910
;910:			Team_DroppedFlagThink( other );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Team_DroppedFlagThink
CALLV
pop
line 911
;911:			return;
ADDRGP4 $439
JUMPV
LABELV $442
line 913
;912:		}
;913:		if (other->physicsObject && other->health && other->takedamage && other->inuse && !other->client)
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $444
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $444
ADDRLP4 4
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $444
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $444
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $444
line 914
;914:		{ //it would otherwise just remove us, so do 99999 damage instead
line 915
;915:			G_Damage( other, ent, ent, NULL, NULL, 99999, DAMAGE_NO_ARMOR, MOD_CRUSH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
CNSTI4 2
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 916
;916:		}
ADDRGP4 $439
JUMPV
LABELV $444
line 917
;917:		else if (other->physicsObject && other->inuse && !other->client && other->s.weapon == WP_DET_PACK && other->think)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $446
ADDRLP4 12
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $446
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
NEU4 $446
ADDRLP4 12
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 13
NEI4 $446
ADDRLP4 12
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $446
line 918
;918:		{ //detpack is about to explode
line 919
;919:			return;
ADDRGP4 $439
JUMPV
LABELV $446
line 921
;920:		}
;921:		else if (other->isSaberEntity)
ADDRFP4 4
INDIRP4
CNSTI4 856
ADDP4
INDIRI4
CNSTI4 0
EQI4 $448
line 922
;922:		{
line 923
;923:			return;
ADDRGP4 $439
JUMPV
LABELV $448
line 926
;924:		}
;925:		else
;926:		{
line 927
;927:			G_TempEntity( other->s.origin, EV_ITEM_POP );
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 58
ARGI4
ADDRGP4 G_TempEntity
CALLP4
pop
line 928
;928:			G_FreeEntity( other );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 929
;929:		}
line 930
;930:		return;
ADDRGP4 $439
JUMPV
LABELV $440
line 933
;931:	}
;932:
;933:	if ( ent->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 0
EQI4 $450
line 934
;934:		if (ent->activator && ent->activator->inuse && ent->activator->client)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
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
EQU4 $452
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $452
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $452
line 935
;935:		{
line 936
;936:			G_Damage( other, ent->activator, ent->activator, NULL, NULL, ent->damage, DAMAGE_NO_ARMOR|DAMAGE_NO_PROTECTION, MOD_CRUSH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 937
;937:		}
ADDRGP4 $453
JUMPV
LABELV $452
line 939
;938:		else
;939:		{
line 940
;940:			G_Damage( other, ent, ent, NULL, NULL, ent->damage, DAMAGE_NO_ARMOR|DAMAGE_NO_PROTECTION, MOD_CRUSH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
CNSTP4 0
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 941
;941:		}
LABELV $453
line 942
;942:	}
LABELV $450
line 943
;943:	if ( ent->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $454
line 944
;944:		return;		// crushers don't reverse
ADDRGP4 $439
JUMPV
LABELV $454
line 948
;945:	}
;946:
;947:	// reverse direction
;948:	Use_BinaryMover( ent, ent, other );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 949
;949:}
LABELV $439
endproc Blocked_Door 24 32
proc Touch_DoorTriggerSpectator 80 12
line 956
;950:
;951:/*
;952:================
;953:Touch_DoorTriggerSpectator
;954:================
;955:*/
;956:static void Touch_DoorTriggerSpectator( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 959
;957:	int i, axis;
;958:	vec3_t origin, dir, angles;
;959:	int extraForBoundingBox = 15;
ADDRLP4 32
CNSTI4 15
ASGNI4
line 961
;960:
;961:	if (other->client && other->client->noclip) {
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $457
ADDRLP4 48
INDIRP4
CNSTI4 43600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $457
line 962
;962:		return;
ADDRGP4 $456
JUMPV
LABELV $457
line 965
;963:	}
;964:
;965:	axis = ent->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 966
;966:	VectorClear(dir);
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 20+8
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 52
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 967
;967:	if (axis == 2) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $461
line 968
;968:		extraForBoundingBox = 40; // TODO depending on above/below?
ADDRLP4 32
CNSTI4 40
ASGNI4
line 969
;969:	}
LABELV $461
line 970
;970:	if (fabs(other->s.origin[axis] - ent->r.absmax[axis]) <
ADDRLP4 56
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDP4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRLP4 60
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 64
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDP4
INDIRF4
ADDRLP4 64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRLP4 68
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 60
INDIRF4
ADDRLP4 68
INDIRF4
GEF4 $463
line 971
;971:		fabs(other->s.origin[axis] - ent->r.absmin[axis])) {
line 972
;972:		origin[axis] = ent->r.absmin[axis] - 10 - extraForBoundingBox;
ADDRLP4 72
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 72
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
CNSTF4 1092616192
SUBF4
ADDRLP4 32
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 973
;973:		dir[axis] = -1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
CNSTF4 3212836864
ASGNF4
line 974
;974:	}
ADDRGP4 $464
JUMPV
LABELV $463
line 975
;975:	else {
line 976
;976:		origin[axis] = ent->r.absmax[axis] + 10 + extraForBoundingBox; // TA our bounding box is 15 wide
ADDRLP4 72
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 72
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
CNSTF4 1092616192
ADDF4
ADDRLP4 32
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 977
;977:		dir[axis] = 1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
CNSTF4 1065353216
ASGNF4
line 978
;978:	}
LABELV $464
line 979
;979:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $465
line 980
;980:		if (i == axis) continue;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $469
ADDRGP4 $466
JUMPV
LABELV $469
line 981
;981:		origin[i] = (ent->r.absmin[i] + ent->r.absmax[i]) * 0.5;
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRI4
ADDRLP4 8
ADDP4
CNSTF4 1056964608
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
ADDF4
MULF4
ASGNF4
line 982
;982:	}
LABELV $466
line 979
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $465
line 983
;983:	vectoangles(dir, angles);
ADDRLP4 20
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 984
;984:	TeleportPlayer(other, origin, angles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 985
;985:}
LABELV $456
endproc Touch_DoorTriggerSpectator 80 12
export Touch_DoorTrigger
proc Touch_DoorTrigger 8 12
line 992
;986:
;987:/*
;988:================
;989:Touch_DoorTrigger
;990:================
;991:*/
;992:void Touch_DoorTrigger( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 993
;993:	if ( other->client && other->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $472
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $472
line 995
;994:		// if the door is not open and not opening
;995:		if ( ent->parent->moverState != MOVER_1TO2 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $473
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $473
line 996
;996:			ent->parent->moverState != MOVER_POS2) {
line 997
;997:			Touch_DoorTriggerSpectator( ent, other, trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Touch_DoorTriggerSpectator
CALLV
pop
line 998
;998:		}
line 999
;999:	}
ADDRGP4 $473
JUMPV
LABELV $472
line 1000
;1000:	else if ( ent->parent->moverState != MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 2
EQI4 $476
line 1001
;1001:		Use_BinaryMover( ent->parent, ent, other );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 1002
;1002:	}
LABELV $476
LABELV $473
line 1003
;1003:}
LABELV $471
endproc Touch_DoorTrigger 8 12
export Think_SpawnNewDoorTrigger
proc Think_SpawnNewDoorTrigger 88 12
line 1014
;1004:
;1005:
;1006:/*
;1007:======================
;1008:Think_SpawnNewDoorTrigger
;1009:
;1010:All of the parts of a door have been spawned, so create
;1011:a trigger that encloses all of them
;1012:======================
;1013:*/
;1014:void Think_SpawnNewDoorTrigger( gentity_t *ent ) {
line 1018
;1015:	gentity_t		*other;
;1016:	vec3_t		mins, maxs;
;1017:	int			i, best;
;1018:	int			nowTime = MOVERTIME_ENT(ent);
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
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
EQU4 $482
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $482
ADDRLP4 56
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $482
ADDRLP4 56
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $482
ADDRLP4 56
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
LEI4 $482
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $482
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 60
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 60
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $483
JUMPV
LABELV $482
ADDRLP4 40
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $483
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
line 1020
;1019:
;1020:	if ( !ent ) return;
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $484
ADDRGP4 $478
JUMPV
LABELV $484
line 1023
;1021:
;1022:	// set all of the slaves as shootable
;1023:	if (ent->takedamage)
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $486
line 1024
;1024:	{
line 1025
;1025:		for ( other = ent ; other ; other = other->teamchain )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $491
JUMPV
LABELV $488
line 1026
;1026:		{
line 1027
;1027:			other->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 1028
;1028:		}
LABELV $489
line 1025
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRP4
ASGNP4
LABELV $491
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $488
line 1029
;1029:	}
LABELV $486
line 1032
;1030:
;1031:	// find the bounds of everything on the team
;1032:	VectorCopy (ent->r.absmin, mins);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
INDIRB
ASGNB 12
line 1033
;1033:	VectorCopy (ent->r.absmax, maxs);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 356
ADDP4
INDIRB
ASGNB 12
line 1035
;1034:
;1035:	for (other = ent->teamchain ; other ; other=other->teamchain) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $495
JUMPV
LABELV $492
line 1036
;1036:		AddPointToBounds (other->r.absmin, mins, maxs);
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 AddPointToBounds
CALLV
pop
line 1037
;1037:		AddPointToBounds (other->r.absmax, mins, maxs);
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 AddPointToBounds
CALLV
pop
line 1038
;1038:	}
LABELV $493
line 1035
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRP4
ASGNP4
LABELV $495
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $492
line 1041
;1039:
;1040:	// find the thinnest axis, which will be the one we expand
;1041:	best = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 1042
;1042:	for ( i = 1 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $496
line 1043
;1043:		if ( maxs[i] - mins[i] < maxs[best] - mins[best] ) {
ADDRLP4 64
CNSTI4 2
ASGNI4
ADDRLP4 68
ADDRLP4 4
INDIRI4
ADDRLP4 64
INDIRI4
LSHI4
ASGNI4
ADDRLP4 72
ADDRLP4 32
INDIRI4
ADDRLP4 64
INDIRI4
LSHI4
ASGNI4
ADDRLP4 68
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 68
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
ADDRLP4 72
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 72
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
GEF4 $500
line 1044
;1044:			best = i;
ADDRLP4 32
ADDRLP4 4
INDIRI4
ASGNI4
line 1045
;1045:		}
LABELV $500
line 1046
;1046:	}
LABELV $497
line 1042
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $496
line 1047
;1047:	maxs[best] += 120;
ADDRLP4 64
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 1048
;1048:	mins[best] -= 120;
ADDRLP4 68
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
CNSTF4 1123024896
SUBF4
ASGNF4
line 1051
;1049:
;1050:	// create a trigger with this size
;1051:	other = G_Spawn ();
ADDRLP4 72
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
ASGNP4
line 1052
;1052:	G_SetClassName(other, "door_trigger");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $502
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 1053
;1053:	VectorCopy (mins, other->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 1054
;1054:	VectorCopy (maxs, other->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 1055
;1055:	other->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1056
;1056:	other->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 1057
;1057:	other->touch = Touch_DoorTrigger;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 Touch_DoorTrigger
ASGNP4
line 1059
;1058:	// remember the thinnest axis
;1059:	other->count = best;
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1060
;1060:	trap_LinkEntity (other);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1062
;1061:
;1062:	nowTime = G_ResetActivatorTimeDelta(ent, ent->activatorReal); // if moving on client time, reset before every mover state change
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 G_ResetActivatorTimeDelta
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 80
INDIRI4
ASGNI4
line 1063
;1063:	MatchTeam( ent, ent->moverState, nowTime);
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 1064
;1064:}
LABELV $478
endproc Think_SpawnNewDoorTrigger 88 12
export Think_MatchTeam
proc Think_MatchTeam 32 12
line 1066
;1065:
;1066:void Think_MatchTeam( gentity_t *ent ) {
line 1067
;1067:	int		nowTime = MOVERTIME_ENT(ent);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 760
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
EQU4 $507
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $507
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $507
ADDRLP4 20
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $507
ADDRLP4 20
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $507
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $507
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $508
JUMPV
LABELV $507
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $508
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1068
;1068:	MatchTeam( ent, ent->moverState, nowTime);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 1069
;1069:}
LABELV $503
endproc Think_MatchTeam 32 12
export SP_func_door
proc SP_func_door 132 12
line 1092
;1070:
;1071:
;1072:/*QUAKED func_door (0 .5 .8) ? START_OPEN x CRUSHER
;1073:TOGGLE		wait in both the start and end states for a trigger event.
;1074:START_OPEN	the door to moves to its destination when spawned, and operate in reverse.  It is used to temporarily or permanently close off an area when triggered (not useful for touch or takedamage doors).
;1075:NOMONSTER	monsters will not trigger this door
;1076:
;1077:"model2"	.md3 model to also draw
;1078:"angle"		determines the opening direction
;1079:"targetname" if set, no touch field will be spawned and a remote button or trigger field activates the door.
;1080:"speed"		movement speed (100 default)
;1081:"wait"		wait before returning (3 default, -1 = never return)
;1082:"lip"		lip remaining at end of move (8 default)
;1083:"dmg"		damage to inflict when blocked (2 default)
;1084:"color"		constantLight color
;1085:"light"		constantLight radius
;1086:"health"	if set, the door must be shot open
;1087:"soundstart"	Sound door makes when it starts
;1088:"soundmove"	Sound door makes when it starts
;1089:"soundstop"	Sound door makes when it stops
;1090:"sound"		Set to 0 to disable sounds on door, 1 to enable. Default is 1.
;1091:*/
;1092:void SP_func_door (gentity_t *ent) {
line 1098
;1093:	vec3_t	abs_movedir;
;1094:	float	distance;
;1095:	vec3_t	size;
;1096:	float	lip;
;1097:	char	*sound;
;1098:	int		soundon = 0; 
ADDRLP4 32
CNSTI4 0
ASGNI4
line 1099
;1099:	int		nowTime = MOVERTIME_ENT(ent);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 760
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
EQU4 $513
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $513
ADDRLP4 60
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $513
ADDRLP4 60
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $513
ADDRLP4 60
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
LEI4 $513
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $513
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 64
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $514
JUMPV
LABELV $513
ADDRLP4 44
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $514
ADDRLP4 40
ADDRLP4 44
INDIRI4
ASGNI4
line 1101
;1100:
;1101:	G_SpawnInt("sound", "1", &soundon);
ADDRGP4 $515
ARGP4
ADDRGP4 $516
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1103
;1102:
;1103:	if (soundon)
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $517
line 1104
;1104:	{
line 1105
;1105:		G_SpawnString("soundstart", "sound/movers/doors/door1start.wav", &sound);
ADDRGP4 $519
ARGP4
ADDRGP4 $520
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1106
;1106:		ent->sound1to2 = ent->sound2to1 = G_SoundIndex(sound);
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 1108
;1107:
;1108:		G_SpawnString("soundstop", "sound/movers/doors/door1stop.wav", &sound);
ADDRGP4 $521
ARGP4
ADDRGP4 $522
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1109
;1109:		ent->soundPos1 = ent->soundPos2 = G_SoundIndex(sound);
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 1111
;1110:
;1111:		G_SpawnString("soundmove", "sound/movers/doors/door1move.wav", &sound);
ADDRGP4 $523
ARGP4
ADDRGP4 $524
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1112
;1112:		ent->soundLoop = G_SoundIndex(sound);
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 84
INDIRI4
ASGNI4
line 1113
;1113:	}
ADDRGP4 $518
JUMPV
LABELV $517
line 1115
;1114:	else
;1115:	{
line 1116
;1116:		ent->sound1to2 = ent->sound2to1 = ent->soundPos1 = ent->soundPos2 = 0;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 1117
;1117:	}
LABELV $518
line 1119
;1118:
;1119:	ent->blocked = Blocked_Door;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 Blocked_Door
ASGNP4
line 1122
;1120:
;1121:	// default speed of 400
;1122:	if (!ent->speed)
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
CNSTF4 0
NEF4 $525
line 1123
;1123:		ent->speed = 400;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTF4 1137180672
ASGNF4
LABELV $525
line 1126
;1124:
;1125:	// default wait of 2 seconds
;1126:	if (!ent->wait)
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
NEF4 $527
line 1127
;1127:		ent->wait = 2;
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
CNSTF4 1073741824
ASGNF4
LABELV $527
line 1128
;1128:	ent->wait *= 1000;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTF4 1148846080
ADDRLP4 68
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1131
;1129:
;1130:	// default lip of 8 units
;1131:	G_SpawnFloat( "lip", "8", &lip );
ADDRGP4 $529
ARGP4
ADDRGP4 $530
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1134
;1132:
;1133:	// default damage of 2 points
;1134:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $531
ARGP4
ADDRGP4 $532
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1137
;1135:
;1136:	// first position at start
;1137:	VectorCopy( ent->s.origin, ent->pos1 );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1140
;1138:
;1139:	// calculate second position
;1140:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1142
;1141:
;1142:	G_SetMovedir (ent->s.angles, ent->movedir);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 620
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 1143
;1143:	abs_movedir[0] = fabs(ent->movedir[0]);
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ARGF4
ADDRLP4 84
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 84
INDIRF4
ASGNF4
line 1144
;1144:	abs_movedir[1] = fabs(ent->movedir[1]);
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ARGF4
ADDRLP4 88
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 88
INDIRF4
ASGNF4
line 1145
;1145:	abs_movedir[2] = fabs(ent->movedir[2]);
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ARGF4
ADDRLP4 92
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 92
INDIRF4
ASGNF4
line 1146
;1146:	VectorSubtract( ent->r.maxs, ent->r.mins, size );
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 96
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 96
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 100
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1147
;1147:	distance = DotProduct( abs_movedir, size ) - lip;
ADDRLP4 24
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
ADDRLP4 36
INDIRF4
SUBF4
ASGNF4
line 1148
;1148:	VectorMA( ent->pos1, distance, ent->movedir, ent->pos2 );
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 104
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 568
ADDP4
ADDRLP4 108
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 572
ADDP4
ADDRLP4 112
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1151
;1149:
;1150:	// if "start_open", reverse position 1 and 2
;1151:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $541
line 1154
;1152:		vec3_t	temp;
;1153:
;1154:		VectorCopy( ent->pos2, temp );
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRB
ASGNB 12
line 1155
;1155:		VectorCopy( ent->s.origin, ent->pos2 );
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 128
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1156
;1156:		VectorCopy( temp, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 116
INDIRB
ASGNB 12
line 1157
;1157:	}
LABELV $541
line 1159
;1158:
;1159:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1161
;1160:
;1161:	ent->nextthink = nowTime + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 40
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1163
;1162:
;1163:	if ( ! (ent->flags & FL_TEAMSLAVE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $543
line 1166
;1164:		int health;
;1165:
;1166:		G_SpawnInt( "health", "0", &health );
ADDRGP4 $545
ARGP4
ADDRGP4 $546
ARGP4
ADDRLP4 116
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1167
;1167:		if ( health ) {
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $547
line 1168
;1168:			ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 1169
;1169:			ent->damageindefrag = qtrue; // we can shoot-open doors in defrag. or use force lightning :)
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 1
ASGNI4
line 1170
;1170:		}
LABELV $547
line 1171
;1171:		if ( ent->targetname || health ) {
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $551
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $549
LABELV $551
line 1173
;1172:			// non touch/shoot doors
;1173:			ent->think = Think_MatchTeam;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 Think_MatchTeam
ASGNP4
line 1174
;1174:		} else {
ADDRGP4 $550
JUMPV
LABELV $549
line 1175
;1175:			ent->think = Think_SpawnNewDoorTrigger;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 Think_SpawnNewDoorTrigger
ASGNP4
line 1176
;1176:		}
LABELV $550
line 1177
;1177:	}
LABELV $543
line 1178
;1178:}
LABELV $509
endproc SP_func_door 132 12
export Touch_Plat
proc Touch_Plat 60 0
line 1195
;1179:
;1180:/*
;1181:===============================================================================
;1182:
;1183:PLAT
;1184:
;1185:===============================================================================
;1186:*/
;1187:
;1188:/*
;1189:==============
;1190:Touch_Plat
;1191:
;1192:Don't allow decent if a living player is on it
;1193:===============
;1194:*/
;1195:void Touch_Plat( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1196
;1196:	int			nowTime = MOVERTIME_ENT(ent);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 760
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
EQU4 $556
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $556
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $556
ADDRLP4 20
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $556
ADDRLP4 20
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $556
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $556
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $557
JUMPV
LABELV $556
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $557
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1197
;1197:	if ( !other->client || other->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $560
ADDRLP4 28
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $558
LABELV $560
line 1198
;1198:		return;
ADDRGP4 $552
JUMPV
LABELV $558
line 1201
;1199:	}
;1200:	
;1201:	if (other && other->client && ent->delay && ent->moverState == MOVER_POS2)
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $561
ADDRLP4 32
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $561
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $561
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 1
NEI4 $561
line 1202
;1202:	{ //This means I don't care if you're touching me, I already intend to go back down on a set interval.
line 1203
;1203:		return;
ADDRGP4 $552
JUMPV
LABELV $561
line 1205
;1204:	}
;1205:	if (other && other->client && ent->delay && ent->moverState == MOVER_POS1 && ent->nextthink >= nowTime)
ADDRLP4 44
ADDRFP4 4
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
EQU4 $563
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
EQU4 $563
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $563
ADDRLP4 52
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $563
ADDRLP4 52
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $563
line 1206
;1206:	{
line 1207
;1207:		return;
ADDRGP4 $552
JUMPV
LABELV $563
line 1211
;1208:	}
;1209:
;1210:	// delay return-to-pos1 by one second
;1211:	if ( ent->moverState == MOVER_POS2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 1
NEI4 $565
line 1212
;1212:		ent->nextthink = nowTime + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1213
;1213:	}
LABELV $565
line 1214
;1214:}
LABELV $552
endproc Touch_Plat 60 0
export Touch_PlatCenterTrigger
proc Touch_PlatCenterTrigger 36 12
line 1223
;1215:
;1216:/*
;1217:==============
;1218:Touch_PlatCenterTrigger
;1219:
;1220:If the plat is at the bottom position, start it going up
;1221:===============
;1222:*/
;1223:void Touch_PlatCenterTrigger(gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1224
;1224:	int			nowTime = MOVERTIME_ENT(ent->parent);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CNSTI4 760
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
EQU4 $571
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $571
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $571
ADDRLP4 20
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $571
ADDRLP4 20
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $571
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $571
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $572
JUMPV
LABELV $571
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $572
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1225
;1225:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $573
line 1226
;1226:		return;
ADDRGP4 $567
JUMPV
LABELV $573
line 1229
;1227:	}
;1228:
;1229:	if ( ent->parent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $575
line 1230
;1230:		if (ent->parent->delay && ent->parent->last_move_time >= nowTime)
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $577
ADDRLP4 28
INDIRP4
CNSTI4 684
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $577
line 1231
;1231:		{
line 1232
;1232:			return;
ADDRGP4 $567
JUMPV
LABELV $577
line 1235
;1233:		}
;1234:
;1235:		Use_BinaryMover( ent->parent, ent, other );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 1236
;1236:	}
LABELV $575
line 1237
;1237:}
LABELV $567
endproc Touch_PlatCenterTrigger 36 12
export SpawnPlatTrigger
proc SpawnPlatTrigger 60 8
line 1249
;1238:
;1239:
;1240:/*
;1241:================
;1242:SpawnPlatTrigger
;1243:
;1244:Spawn a trigger in the middle of the plat's low position
;1245:Elevator cars require that the trigger extend through the entire low position,
;1246:not just sit on top of it.
;1247:================
;1248:*/
;1249:void SpawnPlatTrigger( gentity_t *ent ) {
line 1255
;1250:	gentity_t	*trigger;
;1251:	vec3_t	tmin, tmax;
;1252:
;1253:	// the middle trigger will be a thin trigger just
;1254:	// above the starting position
;1255:	trigger = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1256
;1256:	G_SetClassName(trigger, "plat_trigger");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $580
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 1257
;1257:	trigger->touch = Touch_PlatCenterTrigger;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 Touch_PlatCenterTrigger
ASGNP4
line 1258
;1258:	trigger->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 1259
;1259:	trigger->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1261
;1260:	
;1261:	tmin[0] = ent->pos1[0] + ent->r.mins[0] + 33;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
ADDF4
ASGNF4
line 1262
;1262:	tmin[1] = ent->pos1[1] + ent->r.mins[1] + 33;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 36
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
ADDF4
ASGNF4
line 1263
;1263:	tmin[2] = ent->pos1[2] + ent->r.mins[2];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 40
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1265
;1264:
;1265:	tmax[0] = ent->pos1[0] + ent->r.maxs[0] - 33;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 44
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
SUBF4
ASGNF4
line 1266
;1266:	tmax[1] = ent->pos1[1] + ent->r.maxs[1] - 33;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16+4
ADDRLP4 48
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
SUBF4
ASGNF4
line 1267
;1267:	tmax[2] = ent->pos1[2] + ent->r.maxs[2] + 8;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16+8
ADDRLP4 52
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1269
;1268:
;1269:	if ( tmax[0] <= tmin[0] ) {
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
GTF4 $585
line 1270
;1270:		tmin[0] = ent->pos1[0] + (ent->r.mins[0] + ent->r.maxs[0]) *0.5;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 56
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 56
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1271
;1271:		tmax[0] = tmin[0] + 1;
ADDRLP4 16
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1272
;1272:	}
LABELV $585
line 1273
;1273:	if ( tmax[1] <= tmin[1] ) {
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
GTF4 $587
line 1274
;1274:		tmin[1] = ent->pos1[1] + (ent->r.mins[1] + ent->r.maxs[1]) *0.5;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 56
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 56
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1275
;1275:		tmax[1] = tmin[1] + 1;
ADDRLP4 16+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1276
;1276:	}
LABELV $587
line 1278
;1277:	
;1278:	VectorCopy (tmin, trigger->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1279
;1279:	VectorCopy (tmax, trigger->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 1281
;1280:
;1281:	trap_LinkEntity (trigger);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1282
;1282:}
LABELV $579
endproc SpawnPlatTrigger 60 8
export SP_func_plat
proc SP_func_plat 48 12
line 1303
;1283:
;1284:
;1285:/*QUAKED func_plat (0 .5 .8) ?
;1286:Plats are always drawn in the extended position so they will light correctly.
;1287:
;1288:"lip"		default 8, protrusion above rest position
;1289:"height"	total height of movement, defaults to model height
;1290:"speed"		overrides default 200.
;1291:"dmg"		overrides default 2
;1292:"model2"	.md3 model to also draw
;1293:"color"		constantLight color
;1294:"light"		constantLight radius
;1295:"delay"		After reaching pos2, plat will go back to pos1 after this many ms.
;1296:			Once plat goes to pos1 form pos2, it will also wait this many ms before
;1297:			it will activate and return to pos2.
;1298:"soundmove"	Sound door makes when it moves
;1299:"soundstart"	Sound door makes when it moves
;1300:"soundstop"	Sound door makes when it stops
;1301:"sound"		Set to 0 to disable sounds on door, 1 to enable. Default is 1.
;1302:*/
;1303:void SP_func_plat (gentity_t *ent) {
line 1306
;1304:	float		lip, height;
;1305:	char		*sound;
;1306:	int			soundon = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1308
;1307:
;1308:	G_SpawnInt("sound", "1", &soundon);
ADDRGP4 $515
ARGP4
ADDRGP4 $516
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1310
;1309:
;1310:	if (soundon)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $595
line 1311
;1311:	{
line 1312
;1312:		G_SpawnString("soundstart", "sound/movers/doors/door1start.wav", &sound);
ADDRGP4 $519
ARGP4
ADDRGP4 $520
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1313
;1313:		ent->sound1to2 = ent->sound2to1 = G_SoundIndex(sound);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1315
;1314:
;1315:		G_SpawnString("soundstop", "sound/movers/doors/door1stop.wav", &sound);
ADDRGP4 $521
ARGP4
ADDRGP4 $522
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1316
;1316:		ent->soundPos1 = ent->soundPos2 = G_SoundIndex(sound);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1318
;1317:
;1318:		G_SpawnString("soundmove", "sound/movers/doors/door1move.wav", &sound);
ADDRGP4 $523
ARGP4
ADDRGP4 $524
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1319
;1319:		ent->soundLoop = G_SoundIndex(sound);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1320
;1320:	}
ADDRGP4 $596
JUMPV
LABELV $595
line 1322
;1321:	else
;1322:	{
line 1323
;1323:		ent->sound1to2 = ent->sound2to1 = ent->soundPos1 = ent->soundPos2 = 0;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1324
;1324:	}
LABELV $596
line 1326
;1325:
;1326:	VectorClear (ent->s.angles);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 1328
;1327:
;1328:	G_SpawnFloat( "speed", "200", &ent->speed );
ADDRGP4 $597
ARGP4
ADDRGP4 $598
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1329
;1329:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $531
ARGP4
ADDRGP4 $532
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1330
;1330:	G_SpawnFloat( "wait", "1", &ent->wait );
ADDRGP4 $599
ARGP4
ADDRGP4 $516
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1331
;1331:	G_SpawnFloat( "lip", "8", &lip );
ADDRGP4 $529
ARGP4
ADDRGP4 $530
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1333
;1332:
;1333:	G_SpawnInt("delay", "0", &ent->delay);
ADDRGP4 $600
ARGP4
ADDRGP4 $546
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1335
;1334:
;1335:	ent->wait = 1000;
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
CNSTF4 1148846080
ASGNF4
line 1338
;1336:
;1337:	// create second position
;1338:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1340
;1339:
;1340:	if ( !G_SpawnFloat( "height", "0", &height ) ) {
ADDRGP4 $603
ARGP4
ADDRGP4 $546
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 28
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $601
line 1341
;1341:		height = (ent->r.maxs[2] - ent->r.mins[2]) - lip;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
SUBF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 1342
;1342:	}
LABELV $601
line 1345
;1343:
;1344:	// pos1 is the rest (bottom) position, pos2 is the top
;1345:	VectorCopy( ent->s.origin, ent->pos2 );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1346
;1346:	VectorCopy( ent->pos2, ent->pos1 );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 564
ADDP4
INDIRB
ASGNB 12
line 1347
;1347:	ent->pos1[2] -= height;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 1349
;1348:
;1349:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1353
;1350:
;1351:	// touch function keeps the plat from returning while
;1352:	// a live player is standing on it
;1353:	ent->touch = Touch_Plat;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 Touch_Plat
ASGNP4
line 1355
;1354:
;1355:	ent->blocked = Blocked_Door;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 Blocked_Door
ASGNP4
line 1357
;1356:
;1357:	ent->parent = ent;	// so it can be treated as a door
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 540
ADDP4
ADDRLP4 44
INDIRP4
ASGNP4
line 1360
;1358:
;1359:	// spawn the trigger if one hasn't been custom made
;1360:	if ( !ent->targetname ) {
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $604
line 1361
;1361:		SpawnPlatTrigger(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpawnPlatTrigger
CALLV
pop
line 1362
;1362:	}
LABELV $604
line 1363
;1363:}
LABELV $594
endproc SP_func_plat 48 12
export Touch_Button
proc Touch_Button 4 12
line 1380
;1364:
;1365:
;1366:/*
;1367:===============================================================================
;1368:
;1369:BUTTON
;1370:
;1371:===============================================================================
;1372:*/
;1373:
;1374:/*
;1375:==============
;1376:Touch_Button
;1377:
;1378:===============
;1379:*/
;1380:void Touch_Button(gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1381
;1381:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $607
line 1382
;1382:		return;
ADDRGP4 $606
JUMPV
LABELV $607
line 1385
;1383:	}
;1384:
;1385:	if ( ent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $609
line 1386
;1386:		Use_BinaryMover( ent, other, other );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 1387
;1387:	}
LABELV $609
line 1388
;1388:}
LABELV $606
endproc Touch_Button 4 12
export SP_func_button
proc SP_func_button 96 12
line 1407
;1389:
;1390:/*QUAKED func_button (0 .5 .8) ? USABLE FPUSHABLE
;1391:When a button is touched, it moves some distance in the direction of it's angle, triggers all of it's targets, waits some time, then returns to it's original position where it can be triggered again.
;1392:USABLE - Can activate with use button
;1393:FPUSHABLE - Can force-push it
;1394:
;1395:"model2"	.md3 model to also draw
;1396:"angle"		determines the opening direction
;1397:"target"	all entities with a matching targetname will be used
;1398:"speed"		override the default 40 speed
;1399:"wait"		override the default 1 second wait (-1 = never return)
;1400:"lip"		override the default 4 pixel lip remaining at end of move
;1401:"health"	if set, the button must be killed instead of touched
;1402:"color"		constantLight color
;1403:"light"		constantLight radius
;1404:"sounduse"	Sound when used
;1405:"sound"		Set to 0 to disable sounds on button, 1 to enable. Default is 1.
;1406:*/
;1407:void SP_func_button( gentity_t *ent ) {
line 1413
;1408:	vec3_t		abs_movedir;
;1409:	float		distance;
;1410:	vec3_t		size;
;1411:	float		lip;
;1412:	char		*sound;
;1413:	int			soundon = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 1415
;1414:
;1415:	G_SpawnInt("sound", "1", &soundon);
ADDRGP4 $515
ARGP4
ADDRGP4 $516
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1417
;1416:
;1417:	if (soundon)
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $612
line 1418
;1418:	{
line 1419
;1419:		G_SpawnString("sounduse", "sound/movers/doors/door1move.wav", &sound);
ADDRGP4 $614
ARGP4
ADDRGP4 $524
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1420
;1420:		ent->sound1to2 = G_SoundIndex(sound);
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1421
;1421:	}
ADDRGP4 $613
JUMPV
LABELV $612
line 1423
;1422:	else
;1423:	{
line 1424
;1424:		ent->sound1to2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
CNSTI4 0
ASGNI4
line 1425
;1425:	}
LABELV $613
line 1427
;1426:
;1427:	ent->sound1to2 = G_SoundIndex("sound/movers/switches/switch3.wav");
ADDRGP4 $615
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1429
;1428:	
;1429:	if ( !ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
CNSTF4 0
NEF4 $616
line 1430
;1430:		ent->speed = 40;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTF4 1109393408
ASGNF4
line 1431
;1431:	}
LABELV $616
line 1433
;1432:
;1433:	if ( !ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
NEF4 $618
line 1434
;1434:		ent->wait = 1;
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
CNSTF4 1065353216
ASGNF4
line 1435
;1435:	}
LABELV $618
line 1436
;1436:	ent->wait *= 1000;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTF4 1148846080
ADDRLP4 44
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1439
;1437:
;1438:	// first position
;1439:	VectorCopy( ent->s.origin, ent->pos1 );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1442
;1440:
;1441:	// calculate second position
;1442:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1444
;1443:
;1444:	G_SpawnFloat( "lip", "4", &lip );
ADDRGP4 $529
ARGP4
ADDRGP4 $620
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1446
;1445:
;1446:	G_SetMovedir( ent->s.angles, ent->movedir );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 620
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 1447
;1447:	abs_movedir[0] = fabs(ent->movedir[0]);
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 60
INDIRF4
ASGNF4
line 1448
;1448:	abs_movedir[1] = fabs(ent->movedir[1]);
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 64
INDIRF4
ASGNF4
line 1449
;1449:	abs_movedir[2] = fabs(ent->movedir[2]);
ADDRFP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 68
INDIRF4
ASGNF4
line 1450
;1450:	VectorSubtract( ent->r.maxs, ent->r.mins, size );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 72
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 72
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 76
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1451
;1451:	distance = abs_movedir[0] * size[0] + abs_movedir[1] * size[1] + abs_movedir[2] * size[2] - lip;
ADDRLP4 24
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
ADDRLP4 32
INDIRF4
SUBF4
ASGNF4
line 1452
;1452:	VectorMA (ent->pos1, distance, ent->movedir, ent->pos2);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 568
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 572
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1454
;1453:
;1454:	if (ent->health) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $629
line 1456
;1455:		// shootable button
;1456:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 1457
;1457:	} else {
ADDRGP4 $630
JUMPV
LABELV $629
line 1459
;1458:		// touchable button
;1459:		ent->touch = Touch_Button;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 Touch_Button
ASGNP4
line 1460
;1460:	}
LABELV $630
line 1462
;1461:
;1462:	if ( (ent->spawnflags&SPF_BUTTON_USABLE) )
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $631
line 1463
;1463:	{
line 1464
;1464:		ent->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1465
;1465:	}
LABELV $631
line 1467
;1466:
;1467:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1468
;1468:}
LABELV $611
endproc SP_func_button 96 12
export Think_BeginMoving
proc Think_BeginMoving 28 0
line 1492
;1469:
;1470:
;1471:
;1472:/*
;1473:===============================================================================
;1474:
;1475:TRAIN
;1476:
;1477:===============================================================================
;1478:*/
;1479:
;1480:
;1481:#define TRAIN_START_ON		1
;1482:#define TRAIN_TOGGLE		2
;1483:#define TRAIN_BLOCK_STOPS	4
;1484:
;1485:/*
;1486:===============
;1487:Think_BeginMoving
;1488:
;1489:The wait time at a corner has completed, so start moving again
;1490:===============
;1491:*/
;1492:void Think_BeginMoving( gentity_t *ent ) {
line 1493
;1493:	int			nowTime = MOVERTIME_ENT(ent);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 760
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
EQU4 $637
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $637
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $637
ADDRLP4 20
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $637
ADDRLP4 20
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $637
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $637
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $638
JUMPV
LABELV $637
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $638
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1494
;1494:	ent->s.pos.trTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1495
;1495:	ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 1496
;1496:}
LABELV $633
endproc Think_BeginMoving 28 0
export Reached_Train
proc Reached_Train 76 12
line 1503
;1497:
;1498:/*
;1499:===============
;1500:Reached_Train
;1501:===============
;1502:*/
;1503:void Reached_Train( gentity_t *ent ) {
line 1508
;1504:	gentity_t		*next;
;1505:	float			speed;
;1506:	vec3_t			move;
;1507:	float			length;
;1508:	int			nowTime = MOVERTIME_ENT(ent);
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $643
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $643
ADDRLP4 44
ADDRLP4 32
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $643
ADDRLP4 44
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $643
ADDRLP4 44
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
LEI4 $643
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $643
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 48
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $644
JUMPV
LABELV $643
ADDRLP4 28
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $644
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 1511
;1509:
;1510:	// copy the apropriate values
;1511:	next = ent->nextTrain;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRP4
ASGNP4
line 1512
;1512:	if ( !next || !next->nextTrain ) {
ADDRLP4 56
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 56
INDIRU4
EQU4 $647
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 56
INDIRU4
NEU4 $645
LABELV $647
line 1513
;1513:		return;		// just stop
ADDRGP4 $639
JUMPV
LABELV $645
line 1517
;1514:	}
;1515:
;1516:	// fire all other targets
;1517:	G_UseTargets( next, NULL );
ADDRLP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1520
;1518:
;1519:	// set the new trajectory
;1520:	ent->nextTrain = next->nextTrain;
ADDRLP4 60
CNSTI4 544
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 1521
;1521:	VectorCopy( next->s.origin, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1522
;1522:	VectorCopy( next->nextTrain->s.origin, ent->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1525
;1523:
;1524:	// if the path_corner has a speed, use that
;1525:	if ( next->speed ) {
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
CNSTF4 0
EQF4 $648
line 1526
;1526:		speed = next->speed;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ASGNF4
line 1527
;1527:	} else {
ADDRGP4 $649
JUMPV
LABELV $648
line 1529
;1528:		// otherwise use the train's speed
;1529:		speed = ent->speed;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ASGNF4
line 1530
;1530:	}
LABELV $649
line 1531
;1531:	if ( speed < 1 ) {
ADDRLP4 16
INDIRF4
CNSTF4 1065353216
GEF4 $650
line 1532
;1532:		speed = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1533
;1533:	}
LABELV $650
line 1536
;1534:
;1535:	// calculate duration
;1536:	VectorSubtract( ent->pos2, ent->pos1, move );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 64
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 64
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 68
INDIRP4
CNSTI4 572
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1537
;1537:	length = VectorLength( move );
ADDRLP4 4
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 72
INDIRF4
ASGNF4
line 1539
;1538:
;1539:	ent->s.pos.trDuration = length * 1000 / speed;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1542
;1540:
;1541:	// looping sound
;1542:	ent->s.loopSound = next->soundLoop;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
ASGNI4
line 1545
;1543:
;1544:	// start it going
;1545:	SetMoverState( ent, MOVER_1TO2, nowTime);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 1548
;1546:
;1547:	// if there is a "wait" value on the target, don't start moving yet
;1548:	if ( next->wait ) {
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
EQF4 $654
line 1549
;1549:		ent->nextthink = nowTime + next->wait * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 20
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1550
;1550:		ent->think = Think_BeginMoving;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 Think_BeginMoving
ASGNP4
line 1551
;1551:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1552
;1552:	}
LABELV $654
line 1553
;1553:}
LABELV $639
endproc Reached_Train 76 12
export Think_SetupTrainTargets
proc Think_SetupTrainTargets 28 12
line 1563
;1554:
;1555:
;1556:/*
;1557:===============
;1558:Think_SetupTrainTargets
;1559:
;1560:Link all the corners together
;1561:===============
;1562:*/
;1563:void Think_SetupTrainTargets( gentity_t *ent ) {
line 1566
;1564:	gentity_t		*path, *next, *start;
;1565:
;1566:	ent->nextTrain = G_Find( NULL, FOFS(targetname), ent->target );
CNSTP4 0
ARGP4
CNSTI4 596
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 1567
;1567:	if ( !ent->nextTrain ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $657
line 1568
;1568:		G_Printf( "func_train at %s with an unfound target\n",
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $659
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1570
;1569:			vtos(ent->r.absmin) );
;1570:		return;
ADDRGP4 $656
JUMPV
LABELV $657
line 1573
;1571:	}
;1572:
;1573:	start = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 1574
;1574:	for ( path = ent->nextTrain ; path != start ; path = next ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $663
JUMPV
LABELV $660
line 1575
;1575:		if ( !start ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $664
line 1576
;1576:			start = path;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
line 1577
;1577:		}
LABELV $664
line 1579
;1578:
;1579:		if ( !path->target ) {
ADDRLP4 4
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $666
line 1580
;1580:			G_Printf( "Train corner at %s without a target\n",
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $668
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1582
;1581:				vtos(path->s.origin) );
;1582:			return;
ADDRGP4 $656
JUMPV
LABELV $666
line 1588
;1583:		}
;1584:
;1585:		// find a path_corner among the targets
;1586:		// there may also be other targets that get fired when the corner
;1587:		// is reached
;1588:		next = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $669
line 1589
;1589:		do {
line 1590
;1590:			next = G_Find( next, FOFS(targetname), path->target );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 596
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1591
;1591:			if ( !next ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $672
line 1592
;1592:				G_Printf( "Train corner at %s without a target path_corner\n",
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $674
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1594
;1593:					vtos(path->s.origin) );
;1594:				return;
ADDRGP4 $656
JUMPV
LABELV $672
line 1596
;1595:			}
;1596:		} while ( strcmp( next->classname, "path_corner" ) );
LABELV $670
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $675
ARGP4
ADDRLP4 20
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $669
line 1598
;1597:
;1598:		path->nextTrain = next;
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1599
;1599:	}
LABELV $661
line 1574
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $663
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
NEU4 $660
line 1602
;1600:
;1601:	// start the train moving from the first corner
;1602:	Reached_Train( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Reached_Train
CALLV
pop
line 1603
;1603:}
LABELV $656
endproc Think_SetupTrainTargets 28 12
export SP_path_corner
proc SP_path_corner 4 8
line 1613
;1604:
;1605:
;1606:
;1607:/*QUAKED path_corner (.5 .3 0) (-8 -8 -8) (8 8 8)
;1608:Train path corners.
;1609:Target: next path corner and other targets to fire
;1610:"speed" speed to move to the next corner
;1611:"wait" seconds to wait before behining move to next corner
;1612:*/
;1613:void SP_path_corner( gentity_t *self ) {
line 1614
;1614:	if ( !self->targetname ) {
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $677
line 1615
;1615:		G_Printf ("path_corner with no targetname at %s\n", vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $679
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1616
;1616:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1617
;1617:		return;
LABELV $677
line 1620
;1618:	}
;1619:	// path corners don't need to be linked in
;1620:}
LABELV $676
endproc SP_path_corner 4 8
export SP_func_train
proc SP_func_train 40 8
line 1638
;1621:
;1622:
;1623:
;1624:/*QUAKED func_train (0 .5 .8) ? START_ON TOGGLE BLOCK_STOPS ? ? CRUSH_THROUGH
;1625:A train is a mover that moves between path_corner target points.
;1626:Trains MUST HAVE AN ORIGIN BRUSH.
;1627:The train spawns at the first target it is pointing at.
;1628:CRUSH_THROUGH spawnflag combined with a dmg value will make the train pass through
;1629:entities and damage them on contact as well.
;1630:"model2"	.md3 model to also draw
;1631:"speed"		default 100
;1632:"dmg"		default	2
;1633:"noise"		looping sound to play when the train is in motion
;1634:"target"	next path corner
;1635:"color"		constantLight color
;1636:"light"		constantLight radius
;1637:*/
;1638:void SP_func_train (gentity_t *self) {
line 1639
;1639:	int			nowTime = MOVERTIME_ENT(self);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 760
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
EQU4 $684
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $684
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $684
ADDRLP4 20
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $684
ADDRLP4 20
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $684
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $684
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $685
JUMPV
LABELV $684
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $685
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1640
;1640:	VectorClear (self->s.angles); 
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 1642
;1641:
;1642:	if (self->spawnflags & TRAIN_BLOCK_STOPS) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $686
line 1643
;1643:		self->damage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 0
ASGNI4
line 1644
;1644:	} else {
ADDRGP4 $687
JUMPV
LABELV $686
line 1645
;1645:		if (!self->damage) {
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $688
line 1646
;1646:			self->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 2
ASGNI4
line 1647
;1647:		}
LABELV $688
line 1648
;1648:	}
LABELV $687
line 1650
;1649:
;1650:	if ( !self->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
CNSTF4 0
NEF4 $690
line 1651
;1651:		self->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTF4 1120403456
ASGNF4
line 1652
;1652:	}
LABELV $690
line 1654
;1653:
;1654:	if ( !self->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $692
line 1655
;1655:		G_Printf ("func_train without a target at %s\n", vtos(self->r.absmin));
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $694
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1656
;1656:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1657
;1657:		return;
ADDRGP4 $680
JUMPV
LABELV $692
line 1660
;1658:	}
;1659:
;1660:	trap_SetBrushModel( self, self->model );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1661
;1661:	InitMover( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1663
;1662:
;1663:	self->reached = Reached_Train;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 Reached_Train
ASGNP4
line 1667
;1664:
;1665:	// start trains on the second frame, to make sure their targets have had
;1666:	// a chance to spawn
;1667:	self->nextthink = nowTime + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1668
;1668:	self->think = Think_SetupTrainTargets;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 Think_SetupTrainTargets
ASGNP4
line 1669
;1669:}
LABELV $680
endproc SP_func_train 40 8
export SP_func_static
proc SP_func_static 12 8
line 1686
;1670:
;1671:/*
;1672:===============================================================================
;1673:
;1674:STATIC
;1675:
;1676:===============================================================================
;1677:*/
;1678:
;1679:
;1680:/*QUAKED func_static (0 .5 .8) ?
;1681:A bmodel that just sits there, doing nothing.  Can be used for conditional walls and models.
;1682:"model2"	.md3 model to also draw
;1683:"color"		constantLight color
;1684:"light"		constantLight radius
;1685:*/
;1686:void SP_func_static( gentity_t *ent ) {
line 1687
;1687:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1688
;1688:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1689
;1689:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
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
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1690
;1690:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1691
;1691:}
LABELV $695
endproc SP_func_static 12 8
export SP_func_rotating
proc SP_func_rotating 16 8
line 1714
;1692:
;1693:
;1694:/*
;1695:===============================================================================
;1696:
;1697:ROTATING
;1698:
;1699:===============================================================================
;1700:*/
;1701:
;1702:
;1703:/*QUAKED func_rotating (0 .5 .8) ? START_ON - X_AXIS Y_AXIS
;1704:You need to have an origin brush as part of this entity.  The center of that brush will be
;1705:the point around which it is rotated. It will rotate around the Z axis by default.  You can
;1706:check either the X_AXIS or Y_AXIS box to change that.
;1707:
;1708:"model2"	.md3 model to also draw
;1709:"speed"		determines how fast it moves; default value is 100.
;1710:"dmg"		damage to inflict when blocked (2 default)
;1711:"color"		constantLight color
;1712:"light"		constantLight radius
;1713:*/
;1714:void SP_func_rotating (gentity_t *ent) {
line 1715
;1715:	if ( !ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
CNSTF4 0
NEF4 $697
line 1716
;1716:		ent->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTF4 1120403456
ASGNF4
line 1717
;1717:	}
LABELV $697
line 1720
;1718:
;1719:	// set the axis of rotation
;1720:	ent->s.apos.trType = TR_LINEAR;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 1721
;1721:	if ( ent->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $699
line 1722
;1722:		ent->s.apos.trDelta[2] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ASGNF4
line 1723
;1723:	} else if ( ent->spawnflags & 8 ) {
ADDRGP4 $700
JUMPV
LABELV $699
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $701
line 1724
;1724:		ent->s.apos.trDelta[0] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ASGNF4
line 1725
;1725:	} else {
ADDRGP4 $702
JUMPV
LABELV $701
line 1726
;1726:		ent->s.apos.trDelta[1] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ASGNF4
line 1727
;1727:	}
LABELV $702
LABELV $700
line 1729
;1728:
;1729:	if (!ent->damage) {
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $703
line 1730
;1730:		ent->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 2
ASGNI4
line 1731
;1731:	}
LABELV $703
line 1733
;1732:
;1733:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1734
;1734:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1736
;1735:
;1736:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
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
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1737
;1737:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1738
;1738:	VectorCopy( ent->s.apos.trBase, ent->r.currentAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 1740
;1739:
;1740:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1741
;1741:}
LABELV $696
endproc SP_func_rotating 16 8
export SP_func_bobbing
proc SP_func_bobbing 28 12
line 1763
;1742:
;1743:
;1744:/*
;1745:===============================================================================
;1746:
;1747:BOBBING
;1748:
;1749:===============================================================================
;1750:*/
;1751:
;1752:
;1753:/*QUAKED func_bobbing (0 .5 .8) ? X_AXIS Y_AXIS
;1754:Normally bobs on the Z axis
;1755:"model2"	.md3 model to also draw
;1756:"height"	amplitude of bob (32 default)
;1757:"speed"		seconds to complete a bob cycle (4 default)
;1758:"phase"		the 0.0 to 1.0 offset in the cycle to start at
;1759:"dmg"		damage to inflict when blocked (2 default)
;1760:"color"		constantLight color
;1761:"light"		constantLight radius
;1762:*/
;1763:void SP_func_bobbing (gentity_t *ent) {
line 1767
;1764:	float		height;
;1765:	float		phase;
;1766:
;1767:	G_SpawnFloat( "speed", "4", &ent->speed );
ADDRGP4 $597
ARGP4
ADDRGP4 $620
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1768
;1768:	G_SpawnFloat( "height", "32", &height );
ADDRGP4 $603
ARGP4
ADDRGP4 $706
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1769
;1769:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $531
ARGP4
ADDRGP4 $532
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1770
;1770:	G_SpawnFloat( "phase", "0", &phase );
ADDRGP4 $707
ARGP4
ADDRGP4 $546
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1772
;1771:
;1772:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1773
;1773:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1775
;1774:
;1775:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1776
;1776:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1778
;1777:
;1778:	ent->s.pos.trDuration = ent->speed * 1000;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 20
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1779
;1779:	ent->s.pos.trTime = ent->s.pos.trDuration * phase;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1780
;1780:	ent->s.pos.trType = TR_SINE;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 4
ASGNI4
line 1783
;1781:
;1782:	// set the axis of bobbing
;1783:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $708
line 1784
;1784:		ent->s.pos.trDelta[0] = height;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1785
;1785:	} else if ( ent->spawnflags & 2 ) {
ADDRGP4 $709
JUMPV
LABELV $708
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $710
line 1786
;1786:		ent->s.pos.trDelta[1] = height;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1787
;1787:	} else {
ADDRGP4 $711
JUMPV
LABELV $710
line 1788
;1788:		ent->s.pos.trDelta[2] = height;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1789
;1789:	}
LABELV $711
LABELV $709
line 1790
;1790:}
LABELV $705
endproc SP_func_bobbing 28 12
export SP_func_pendulum
proc SP_func_pendulum 44 12
line 1812
;1791:
;1792:/*
;1793:===============================================================================
;1794:
;1795:PENDULUM
;1796:
;1797:===============================================================================
;1798:*/
;1799:
;1800:
;1801:/*QUAKED func_pendulum (0 .5 .8) ?
;1802:You need to have an origin brush as part of this entity.
;1803:Pendulums always swing north / south on unrotated models.  Add an angles field to the model to allow rotation in other directions.
;1804:Pendulum frequency is a physical constant based on the length of the beam and gravity.
;1805:"model2"	.md3 model to also draw
;1806:"speed"		the number of degrees each way the pendulum swings, (30 default)
;1807:"phase"		the 0.0 to 1.0 offset in the cycle to start at
;1808:"dmg"		damage to inflict when blocked (2 default)
;1809:"color"		constantLight color
;1810:"light"		constantLight radius
;1811:*/
;1812:void SP_func_pendulum(gentity_t *ent) {
line 1818
;1813:	float		freq;
;1814:	float		length;
;1815:	float		phase;
;1816:	float		speed;
;1817:
;1818:	G_SpawnFloat( "speed", "30", &speed );
ADDRGP4 $597
ARGP4
ADDRGP4 $713
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1819
;1819:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $531
ARGP4
ADDRGP4 $532
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1820
;1820:	G_SpawnFloat( "phase", "0", &phase );
ADDRGP4 $707
ARGP4
ADDRGP4 $546
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1822
;1821:
;1822:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1825
;1823:
;1824:	// find pendulum length
;1825:	length = fabs( ent->r.mins[2] );
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1826
;1826:	if ( length < 8 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1090519040
GEF4 $714
line 1827
;1827:		length = 8;
ADDRLP4 0
CNSTF4 1090519040
ASGNF4
line 1828
;1828:	}
LABELV $714
line 1830
;1829:
;1830:	freq = 1 / ( M_PI * 2 ) * sqrt( g_gravity.value / ( 3 * length ) );
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
DIVF4
ARGF4
ADDRLP4 24
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 4
CNSTF4 1042479491
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 1832
;1831:
;1832:	ent->s.pos.trDuration = ( 1000 / freq );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1834
;1833:
;1834:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1836
;1835:
;1836:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
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
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1837
;1837:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1839
;1838:
;1839:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1841
;1840:
;1841:	ent->s.apos.trDuration = 1000 / freq;
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 1148846080
ADDRLP4 4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1842
;1842:	ent->s.apos.trTime = ent->s.apos.trDuration * phase;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1843
;1843:	ent->s.apos.trType = TR_SINE;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 4
ASGNI4
line 1844
;1844:	ent->s.apos.trDelta[2] = speed;
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1845
;1845:}
LABELV $712
endproc SP_func_pendulum 44 12
export BreakableBrushDie
proc BreakableBrushDie 48 24
line 1862
;1846:
;1847:/*
;1848:===============================================================================
;1849:
;1850:BREAKABLE BRUSH
;1851:
;1852:===============================================================================
;1853:*/
;1854:#define DEBRIS_SPECIALCASE_ROCK			-1
;1855:#define DEBRIS_SPECIALCASE_CHUNKS		-2
;1856:#define DEBRIS_SPECIALCASE_WOOD			-3
;1857:#define DEBRIS_SPECIALCASE_GLASS		-4
;1858:
;1859:int gExplSound;
;1860:
;1861:void BreakableBrushDie(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;1862:{
line 1865
;1863:	gentity_t *te;
;1864:	vec3_t dif, u;
;1865:	int defaultradius = 128;
ADDRLP4 28
CNSTI4 128
ASGNI4
line 1867
;1866:
;1867:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 1869
;1868:
;1869:	dif[0] = (self->r.absmax[0]+self->r.absmin[0])/2;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1870
;1870:	dif[1] = (self->r.absmax[1]+self->r.absmin[1])/2;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1871
;1871:	dif[2] = (self->r.absmax[2]+self->r.absmin[2])/2;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1873
;1872:
;1873:	G_SoundIndex("sound/movers/objects/objectHit.wav");
ADDRGP4 $720
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1875
;1874:
;1875:	G_UseTargets(self, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1877
;1876:
;1877:	if (self->boltpoint2)
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
CNSTI4 0
EQI4 $721
line 1878
;1878:	{
line 1879
;1879:		te = G_TempEntity( dif, EV_DEBRIS );
ADDRLP4 0
ARGP4
CNSTI4 72
ARGI4
ADDRLP4 44
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 44
INDIRP4
ASGNP4
line 1880
;1880:		te->s.eventParm = self->s.number;
ADDRLP4 12
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1881
;1881:		te->s.weapon = self->boltpoint1;
ADDRLP4 12
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ASGNI4
line 1882
;1882:		te->s.trickedentindex = self->boltpoint2; //debris model index
ADDRLP4 12
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
ASGNI4
line 1883
;1883:		VectorCopy(self->r.maxs, te->s.origin);
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRB
ASGNB 12
line 1884
;1884:		VectorCopy(self->r.mins, te->s.angles);
ADDRLP4 12
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
INDIRB
ASGNB 12
line 1885
;1885:	}
LABELV $721
line 1887
;1886:
;1887:	VectorCopy(dif, self->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 1889
;1888:
;1889:	if (self->splashDamage)
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
EQI4 $723
line 1890
;1890:	{
line 1891
;1891:		if (self->splashRadius)
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
CNSTI4 0
EQI4 $725
line 1892
;1892:		{
line 1893
;1893:			defaultradius = self->splashRadius;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 1894
;1894:		}
LABELV $725
line 1896
;1895:
;1896:		G_RadiusDamage(dif, self, self->splashDamage, defaultradius, self, MOD_UNKNOWN);
ADDRLP4 0
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 1897
;1897:		u[YAW] = 0;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 1898
;1898:		u[PITCH] = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1899
;1899:		u[ROLL] = 0;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 1900
;1900:		G_PlayEffect(EFFECT_EXPLOSION, dif, u);
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 1901
;1901:		G_Sound(self, CHAN_BODY, gExplSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 gExplSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1902
;1902:	}
LABELV $723
line 1904
;1903:
;1904:	G_Sound(self, CHAN_WEAPON, self->boltpoint3);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1906
;1905:
;1906:	G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1907
;1907:}
LABELV $717
endproc BreakableBrushDie 48 24
export BreakableBrushPain
proc BreakableBrushPain 0 0
line 1910
;1908:
;1909:void BreakableBrushPain(gentity_t *self, gentity_t *attacker, int damage)
;1910:{
line 1911
;1911:}
LABELV $729
endproc BreakableBrushPain 0 0
export BrushThink
proc BrushThink 4 20
line 1914
;1912:
;1913:void BrushThink(gentity_t *self)
;1914:{
line 1915
;1915:	self->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTP4 0
ASGNP4
line 1916
;1916:	BreakableBrushDie(self, self->enemy, self->activator, 100, MOD_UNKNOWN);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
ARGP4
CNSTI4 100
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BreakableBrushDie
CALLV
pop
line 1917
;1917:}
LABELV $730
endproc BrushThink 4 20
export BreakableBrushUse
proc BreakableBrushUse 32 8
line 1920
;1918:
;1919:void BreakableBrushUse(gentity_t *self, gentity_t *other, gentity_t *activator)
;1920:{
line 1923
;1921:	int			nowTime;// = ACTIVATORTIME(self->activatorReal);
;1922:	//self->activator = activator;
;1923:	G_SetActivator(self , activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 1924
;1924:	nowTime = MOVERTIME_ENT(self);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 760
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
EQU4 $735
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $735
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $735
ADDRLP4 20
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $735
ADDRLP4 20
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $735
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $735
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $736
JUMPV
LABELV $735
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $736
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1925
;1925:	self->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1927
;1926:
;1927:	self->think = BrushThink;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 BrushThink
ASGNP4
line 1928
;1928:	self->nextthink = nowTime + self->wait;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 1929
;1929:}
LABELV $731
endproc BreakableBrushUse 32 8
export SP_func_breakable
proc SP_func_breakable 56 12
line 1962
;1930:
;1931:/*QUAKED func_breakable (0 .5 .8) ? INVINCIBLE
;1932:Breakable brush
;1933:
;1934:INVINCIBLE		Can only be destroyed by being used
;1935:
;1936:"target"		target to fire when destroyed
;1937:"targetname"	entities with matching target will fire it
;1938:"model2"		.md3 model to also draw
;1939:"color"			constantLight color
;1940:"light"			constantLight radius
;1941:"health"		object's health
;1942:"dmg"			Specifying this will make the object explode when destroyed
;1943:"dmgrad"		Radius for explosion of dmg is set
;1944:"debrismodel"	Model of debris chunks to throw when object is destroyed.
;1945:				There are special cases for this item rather than using a
;1946:				model name also, they are:
;1947:
;1948:  rock
;1949:  chunks
;1950:  wood
;1951:  glass
;1952:  none
;1953:
;1954:  Using one of these types will throw random chunks of that type rather
;1955:  than one model, except for "none" which will make it so no debris is
;1956:  spawned.
;1957:
;1958:"debrissound"	Sound to play when debris hits a surface. Default is none.
;1959:"breaksound"	Sound to play when destroyed
;1960:"wait"			Time to wait (in ms) before activating once used
;1961:*/
;1962:void SP_func_breakable( gentity_t *ent ) {
line 1965
;1963:	char *model, *sound, *debrissound;
;1964:
;1965:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1966
;1966:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1968
;1967:
;1968:	G_SpawnInt( "health", "1", &ent->health );
ADDRGP4 $545
ARGP4
ADDRGP4 $516
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1970
;1969:
;1970:	G_SpawnInt( "dmg", "0", &ent->splashDamage);
ADDRGP4 $531
ARGP4
ADDRGP4 $546
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1971
;1971:	G_SpawnInt( "dmgrad", "0", &ent->splashRadius);
ADDRGP4 $738
ARGP4
ADDRGP4 $546
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1973
;1972:
;1973:	G_SpawnFloat( "wait", "0", &ent->wait);
ADDRGP4 $599
ARGP4
ADDRGP4 $546
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1975
;1974:
;1975:	G_SpawnString( "debrismodel", "rock", &model);
ADDRGP4 $739
ARGP4
ADDRGP4 $740
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1977
;1976:
;1977:	G_SpawnString( "debrissound", "", &debrissound);
ADDRGP4 $741
ARGP4
ADDRGP4 $742
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1979
;1978:
;1979:	G_SpawnString( "breaksound", "sound/movers/objects/objectBreak.wav", &sound);
ADDRGP4 $743
ARGP4
ADDRGP4 $744
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1981
;1980:
;1981:	ent->boltpoint3 = G_SoundIndex(sound);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1983
;1982:	
;1983:	gExplSound = G_SoundIndex("sound/weapons/explosions/cargoexplode.wav");
ADDRGP4 $745
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gExplSound
ADDRLP4 20
INDIRI4
ASGNI4
line 1985
;1984:
;1985:	if (debrissound && debrissound[0])
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $746
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $746
line 1986
;1986:	{
line 1987
;1987:		ent->boltpoint1 = G_SoundIndex(debrissound);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1988
;1988:	}
ADDRGP4 $747
JUMPV
LABELV $746
line 1990
;1989:	else
;1990:	{
line 1991
;1991:		ent->boltpoint1 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 0
ASGNI4
line 1992
;1992:	}
LABELV $747
line 1994
;1993:
;1994:	ent->boltpoint4 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 1
ASGNI4
line 1996
;1995:
;1996:	if (strcmp(model, "rock") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $740
ARGP4
ADDRLP4 28
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $748
line 1997
;1997:	{
line 1998
;1998:		G_ModelIndex("models/chunks/rock/rock1_1.md3");
ADDRGP4 $750
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 1999
;1999:		G_ModelIndex("models/chunks/rock/rock1_2.md3");
ADDRGP4 $751
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2000
;2000:		G_ModelIndex("models/chunks/rock/rock1_3.md3");
ADDRGP4 $752
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2001
;2001:		G_ModelIndex("models/chunks/rock/rock1_4.md3");
ADDRGP4 $753
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2002
;2002:		ent->boltpoint2 = DEBRIS_SPECIALCASE_ROCK;
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
CNSTI4 -1
ASGNI4
line 2003
;2003:	}
ADDRGP4 $749
JUMPV
LABELV $748
line 2004
;2004:	else if (strcmp(model, "chunks") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $756
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $754
line 2005
;2005:	{
line 2006
;2006:		G_ModelIndex("models/chunks/generic/chunks_1.md3");
ADDRGP4 $757
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2007
;2007:		G_ModelIndex("models/chunks/generic/chunks_2.md3");
ADDRGP4 $758
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2008
;2008:		ent->boltpoint2 = DEBRIS_SPECIALCASE_CHUNKS;
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
CNSTI4 -2
ASGNI4
line 2009
;2009:	}
ADDRGP4 $755
JUMPV
LABELV $754
line 2010
;2010:	else if (strcmp(model, "wood") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $761
ARGP4
ADDRLP4 36
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $759
line 2011
;2011:	{
line 2012
;2012:		G_ModelIndex("models/chunks/crate/crate1_1.md3");
ADDRGP4 $762
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2013
;2013:		G_ModelIndex("models/chunks/crate/crate1_2.md3");
ADDRGP4 $763
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2014
;2014:		G_ModelIndex("models/chunks/crate/crate1_3.md3");
ADDRGP4 $764
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2015
;2015:		G_ModelIndex("models/chunks/crate/crate1_4.md3");
ADDRGP4 $765
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2016
;2016:		G_ModelIndex("models/chunks/crate/crate2_1.md3");
ADDRGP4 $766
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2017
;2017:		G_ModelIndex("models/chunks/crate/crate2_2.md3");
ADDRGP4 $767
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2018
;2018:		G_ModelIndex("models/chunks/crate/crate2_3.md3");
ADDRGP4 $768
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2019
;2019:		G_ModelIndex("models/chunks/crate/crate2_4.md3");
ADDRGP4 $769
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2020
;2020:		ent->boltpoint2 = DEBRIS_SPECIALCASE_WOOD;
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
CNSTI4 -3
ASGNI4
line 2021
;2021:	}
ADDRGP4 $760
JUMPV
LABELV $759
line 2022
;2022:	else if (strcmp(model, "glass") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $772
ARGP4
ADDRLP4 40
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $770
line 2023
;2023:	{
line 2024
;2024:		G_ModelIndex("models/chunks/metal/metal1_1.md3");
ADDRGP4 $773
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2025
;2025:		G_ModelIndex("models/chunks/metal/metal1_2.md3");
ADDRGP4 $774
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2026
;2026:		G_ModelIndex("models/chunks/metal/metal1_3.md3");
ADDRGP4 $775
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2027
;2027:		G_ModelIndex("models/chunks/metal/metal1_4.md3");
ADDRGP4 $776
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2028
;2028:		G_ModelIndex("models/chunks/metal/metal2_1.md3");
ADDRGP4 $777
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2029
;2029:		G_ModelIndex("models/chunks/metal/metal2_2.md3");
ADDRGP4 $778
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2030
;2030:		G_ModelIndex("models/chunks/metal/metal2_3.md3");
ADDRGP4 $779
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2031
;2031:		G_ModelIndex("models/chunks/metal/metal2_4.md3");
ADDRGP4 $780
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 2032
;2032:		ent->boltpoint2 = DEBRIS_SPECIALCASE_GLASS;
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
CNSTI4 -4
ASGNI4
line 2033
;2033:	}
ADDRGP4 $771
JUMPV
LABELV $770
line 2034
;2034:	else if (strcmp(model, "none") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $783
ARGP4
ADDRLP4 44
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $781
line 2035
;2035:	{
line 2036
;2036:		ent->boltpoint2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
CNSTI4 0
ASGNI4
line 2037
;2037:	}
ADDRGP4 $782
JUMPV
LABELV $781
line 2039
;2038:	else
;2039:	{
line 2040
;2040:		ent->boltpoint2 = G_ModelIndex(model);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 2041
;2041:	}
LABELV $782
LABELV $771
LABELV $760
LABELV $755
LABELV $749
line 2043
;2042:
;2043:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2044
;2044:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2045
;2045:	if (!ent->health)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $784
line 2046
;2046:	{
line 2047
;2047:		ent->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
line 2048
;2048:	}
LABELV $784
line 2050
;2049:
;2050:	ent->moverState = MOVER_POS1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 0
ASGNI4
line 2052
;2051:
;2052:	if (ent->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $786
line 2053
;2053:	{
line 2054
;2054:		ent->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 2055
;2055:	}
ADDRGP4 $787
JUMPV
LABELV $786
line 2057
;2056:	else
;2057:	{
line 2058
;2058:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 2059
;2059:	}
LABELV $787
line 2061
;2060:
;2061:	ent->die = BreakableBrushDie;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 BreakableBrushDie
ASGNP4
line 2062
;2062:	ent->use = BreakableBrushUse;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 BreakableBrushUse
ASGNP4
line 2063
;2063:	ent->pain = BreakableBrushPain;
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRGP4 BreakableBrushPain
ASGNP4
line 2064
;2064:}
LABELV $737
endproc SP_func_breakable 56 12
export GlassDie
proc GlassDie 32 8
line 2074
;2065:
;2066:/*
;2067:===============================================================================
;2068:
;2069:GLASS
;2070:
;2071:===============================================================================
;2072:*/
;2073:void GlassDie(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;2074:{
line 2078
;2075:	gentity_t *te;
;2076:	vec3_t dif;
;2077:
;2078:	if (self->bolt_Head)
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 0
EQI4 $789
line 2079
;2079:	{ //was already destroyed, do not retrigger it
line 2080
;2080:		return;
ADDRGP4 $788
JUMPV
LABELV $789
line 2083
;2081:	}
;2082:
;2083:	if (g_defrag.integer) {
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
EQI4 $791
line 2084
;2084:		self->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
line 2085
;2085:		return; // dont destroy glass in defrag. want runs to be consistent
ADDRGP4 $788
JUMPV
LABELV $791
line 2088
;2086:	}
;2087:
;2088:	self->bolt_Head = 1;
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 1
ASGNI4
line 2090
;2089:
;2090:	dif[0] = (self->r.absmax[0]+self->r.absmin[0])/2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2091
;2091:	dif[1] = (self->r.absmax[1]+self->r.absmin[1])/2;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
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
line 2092
;2092:	dif[2] = (self->r.absmax[2]+self->r.absmin[2])/2;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 24
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2094
;2093:
;2094:	G_UseTargets(self, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 2096
;2095:
;2096:	self->splashRadius = 40; // ?? some random number, maybe it's ok?
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 40
ASGNI4
line 2098
;2097:
;2098:	te = G_TempEntity( dif, EV_GLASS_SHATTER );
ADDRLP4 4
ARGP4
CNSTI4 71
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 2099
;2099:	te->s.genericenemyindex = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2100
;2100:	VectorCopy(self->pos1, te->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRB
ASGNB 12
line 2101
;2101:	VectorCopy(self->pos2, te->s.angles);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRB
ASGNB 12
line 2102
;2102:	te->s.trickedentindex = (int)self->splashRadius;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ASGNI4
line 2103
;2103:	te->s.pos.trTime = (int)self->boltpoint3;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
ASGNI4
line 2105
;2104:
;2105:	G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2106
;2106:}
LABELV $788
endproc GlassDie 32 8
export GlassDie_Old
proc GlassDie_Old 32 8
line 2109
;2107:
;2108:void GlassDie_Old(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;2109:{
line 2113
;2110:	gentity_t *te;
;2111:	vec3_t dif;
;2112:
;2113:	dif[0] = (self->r.absmax[0]+self->r.absmin[0])/2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2114
;2114:	dif[1] = (self->r.absmax[1]+self->r.absmin[1])/2;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
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
line 2115
;2115:	dif[2] = (self->r.absmax[2]+self->r.absmin[2])/2;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 24
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2117
;2116:
;2117:	G_UseTargets(self, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 2119
;2118:
;2119:	te = G_TempEntity( dif, EV_GLASS_SHATTER );
ADDRLP4 4
ARGP4
CNSTI4 71
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 2120
;2120:	te->s.genericenemyindex = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2121
;2121:	VectorCopy(self->r.maxs, te->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRB
ASGNB 12
line 2122
;2122:	VectorCopy(self->r.mins, te->s.angles);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
INDIRB
ASGNB 12
line 2124
;2123:
;2124:	G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2125
;2125:}
LABELV $796
endproc GlassDie_Old 32 8
export GlassPain
proc GlassPain 0 0
line 2128
;2126:
;2127:void GlassPain(gentity_t *self, gentity_t *attacker, int damage)
;2128:{
line 2131
;2129:	//G_Printf("Mr. Glass says: PLZ NO IT HURTS\n");
;2130:	//Make "cracking" sound?
;2131:}
LABELV $799
endproc GlassPain 0 0
export GlassUse
proc GlassUse 60 20
line 2134
;2132:
;2133:void GlassUse(gentity_t *self, gentity_t *other, gentity_t *activator) 
;2134:{
line 2140
;2135:	// TODO Defrag allow this? Since GlassDie is blocked in defrag..
;2136:
;2137:	vec3_t temp1, temp2;
;2138:
;2139:	//no direct object to blame for the break, so fill the values with whatever
;2140:	VectorAdd( self->r.mins, self->r.maxs, temp1 );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 28
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2141
;2141:	VectorScale( temp1, 0.5f, temp1 );
ADDRLP4 32
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 32
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 32
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1056964608
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 2143
;2142:
;2143:	VectorAdd( other->r.mins, other->r.maxs, temp2 );
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 36
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 40
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2144
;2144:	VectorScale( temp2, 0.5f, temp2 );
ADDRLP4 44
CNSTF4 1056964608
ASGNF4
ADDRLP4 12
ADDRLP4 44
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 44
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
CNSTF4 1056964608
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 2146
;2145:
;2146:	VectorSubtract( temp1, temp2, self->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 2147
;2147:	VectorCopy( temp1, self->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 2149
;2148:
;2149:	VectorNormalize( self->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2150
;2150:	VectorScale( self->pos2, 390, self->pos2 );
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTF4 1136852992
ADDRLP4 48
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTF4 1136852992
ADDRLP4 52
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTF4 1136852992
ADDRLP4 56
INDIRP4
INDIRF4
MULF4
ASGNF4
line 2152
;2151:
;2152:	GlassDie(self, other, activator, 100, MOD_UNKNOWN);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 100
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 GlassDie
CALLV
pop
line 2153
;2153:}
LABELV $800
endproc GlassUse 60 20
export SP_func_glass
proc SP_func_glass 12 12
line 2162
;2154:
;2155:/*QUAKED func_glass (0 .5 .8) ?
;2156:Breakable glass
;2157:"model2"	.md3 model to also draw
;2158:"color"		constantLight color
;2159:"light"		constantLight radius
;2160:"maxshards"	Max number of shards to spawn on glass break
;2161:*/
;2162:void SP_func_glass( gentity_t *ent ) {
line 2163
;2163:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 2164
;2164:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 2166
;2165:
;2166:	ent->r.svFlags = SVF_GLASS_BRUSH;
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 134217728
ASGNI4
line 2168
;2167:
;2168:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
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
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2169
;2169:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2170
;2170:	if (!ent->health)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $818
line 2171
;2171:	{
line 2172
;2172:		ent->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
line 2173
;2173:	}
LABELV $818
line 2175
;2174:
;2175:	G_SpawnInt("maxshards", "0", &ent->boltpoint3);
ADDRGP4 $820
ARGP4
ADDRGP4 $546
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 2177
;2176:
;2177:	ent->boltpoint1 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 0
ASGNI4
line 2179
;2178:
;2179:	ent->boltpoint4 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 1
ASGNI4
line 2181
;2180:
;2181:	ent->moverState = MOVER_POS1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 0
ASGNI4
line 2183
;2182:
;2183:	if (ent->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $821
line 2184
;2184:	{
line 2185
;2185:		ent->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 2186
;2186:	}
ADDRGP4 $822
JUMPV
LABELV $821
line 2188
;2187:	else
;2188:	{
line 2189
;2189:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 2190
;2190:	}
LABELV $822
line 2192
;2191:
;2192:	ent->die = GlassDie;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 GlassDie
ASGNP4
line 2193
;2193:	ent->use = GlassUse;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 GlassUse
ASGNP4
line 2194
;2194:	ent->pain = GlassPain;
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRGP4 GlassPain
ASGNP4
line 2195
;2195:}
LABELV $817
endproc SP_func_glass 12 12
export func_wait_return_solid
proc func_wait_return_solid 56 8
line 2201
;2196:
;2197:void func_usable_use (gentity_t *self, gentity_t *other, gentity_t *activator);
;2198:
;2199:extern gentity_t	*G_TestEntityPosition( gentity_t *ent );
;2200:void func_wait_return_solid( gentity_t *self )
;2201:{
line 2202
;2202:	int			nowTime = MOVERTIME_ENT(self);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 760
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
EQU4 $827
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $827
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $827
ADDRLP4 20
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $827
ADDRLP4 20
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $827
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $827
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $828
JUMPV
LABELV $827
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $828
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2205
;2203:
;2204:	//once a frame, see if it's clear.
;2205:	self->clipmask = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 256
ASGNI4
line 2206
;2206:	if ( !(self->spawnflags&16) || G_TestEntityPosition( self ) == NULL )
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $831
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $829
LABELV $831
line 2207
;2207:	{
line 2208
;2208:		trap_SetBrushModel( self, self->model );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 2209
;2209:		InitMover( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 2210
;2210:		VectorCopy( self->s.origin, self->s.pos.trBase );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2211
;2211:		VectorCopy( self->s.origin, self->r.currentOrigin );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2212
;2212:		self->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2213
;2213:		self->s.eFlags &= ~EF_NODRAW;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 2214
;2214:		self->use = func_usable_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 func_usable_use
ASGNP4
line 2215
;2215:		self->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 2222
;2216:
;2217:		//FIXME: Animations?
;2218:		/*if ( self->s.eFlags & EF_ANIM_ONCE )
;2219:		{//Start our anim
;2220:			self->s.frame = 0;
;2221:		}*/
;2222:	}
ADDRGP4 $830
JUMPV
LABELV $829
line 2224
;2223:	else
;2224:	{
line 2225
;2225:		self->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 2226
;2226:		self->think = func_wait_return_solid;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 func_wait_return_solid
ASGNP4
line 2227
;2227:		self->nextthink = nowTime + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2228
;2228:	}
LABELV $830
line 2229
;2229:}
LABELV $823
endproc func_wait_return_solid 56 8
export func_usable_think
proc func_usable_think 4 0
line 2232
;2230:
;2231:void func_usable_think( gentity_t *self )
;2232:{
line 2233
;2233:	if ( self->spawnflags & 8 )
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $833
line 2234
;2234:	{
line 2235
;2235:		self->r.svFlags |= SVF_PLAYER_USABLE;	//Replace the usable flag
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 2236
;2236:		self->use = func_usable_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 func_usable_use
ASGNP4
line 2237
;2237:		self->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTP4 0
ASGNP4
line 2238
;2238:	}
LABELV $833
line 2239
;2239:}
LABELV $832
endproc func_usable_think 4 0
export func_usable_use
proc func_usable_use 40 8
line 2242
;2240:
;2241:void func_usable_use (gentity_t *self, gentity_t *other, gentity_t *activator)
;2242:{
line 2243
;2243:	int			nowTime = MOVERTIME_ENT(self); // todo need any reset here?
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 760
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
EQU4 $839
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $839
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $839
ADDRLP4 20
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $839
ADDRLP4 20
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $839
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $839
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 760
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $840
JUMPV
LABELV $839
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $840
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2260
;2244:	//Toggle on and off
;2245:	//FIXME: Animation?
;2246:	/*
;2247:	if ( self->s.eFlags & EF_SHADER_ANIM )
;2248:	{//animate shader when used
;2249:		self->s.frame++;//inc frame
;2250:		if ( self->s.frame > self->endFrame )
;2251:		{//wrap around
;2252:			self->s.frame = 0;
;2253:		}
;2254:		if ( self->target && self->target[0] )
;2255:		{
;2256:			G_UseTargets( self, activator );
;2257:		}
;2258:	}
;2259:	else*/
;2260:	if ( self->spawnflags & 8 )
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $841
line 2261
;2261:	{//ALWAYS_ON
line 2263
;2262:		//Remove the ability to use the entity directly
;2263:		self->r.svFlags &= ~SVF_PLAYER_USABLE;
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
CNSTI4 -17
BANDI4
ASGNI4
line 2265
;2264:		//also remove ability to call any use func at all!
;2265:		self->use = 0;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
CNSTP4 0
ASGNP4
line 2267
;2266:		
;2267:		if(self->target && self->target[0])
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $843
ADDRLP4 32
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $843
line 2268
;2268:		{
line 2269
;2269:			G_UseTargets(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 2270
;2270:		}
LABELV $843
line 2272
;2271:		
;2272:		if ( self->wait )
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
EQF4 $835
line 2273
;2273:		{
line 2274
;2274:			self->think = func_usable_think;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 func_usable_think
ASGNP4
line 2275
;2275:			self->nextthink = nowTime + ( self->wait * 1000 );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 640
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 36
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2276
;2276:		}
line 2278
;2277:
;2278:		return;
ADDRGP4 $835
JUMPV
LABELV $841
line 2280
;2279:	}
;2280:	else if ( !self->count )
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
NEI4 $847
line 2281
;2281:	{//become solid again
line 2282
;2282:		self->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 1
ASGNI4
line 2283
;2283:		func_wait_return_solid( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 func_wait_return_solid
CALLV
pop
line 2284
;2284:	}
ADDRGP4 $848
JUMPV
LABELV $847
line 2286
;2285:	else
;2286:	{
line 2287
;2287:		self->s.solid = 0;
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 0
ASGNI4
line 2288
;2288:		self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 2289
;2289:		self->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 2290
;2290:		self->r.svFlags |= SVF_NOCLIENT;
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
CNSTI4 1
BORI4
ASGNI4
line 2291
;2291:		self->s.eFlags |= EF_NODRAW;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2292
;2292:		self->count = 0;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 0
ASGNI4
line 2294
;2293:
;2294:		if(self->target && self->target[0])
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $849
ADDRLP4 36
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $849
line 2295
;2295:		{
line 2296
;2296:			G_UseTargets(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 2297
;2297:		}
LABELV $849
line 2298
;2298:		self->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTP4 0
ASGNP4
line 2299
;2299:		self->nextthink = -1;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 -1
ASGNI4
line 2300
;2300:	}
LABELV $848
line 2301
;2301:}
LABELV $835
endproc func_usable_use 40 8
export func_usable_pain
proc func_usable_pain 8 12
line 2304
;2302:
;2303:void func_usable_pain(gentity_t *self, gentity_t *attacker, int damage)
;2304:{
line 2305
;2305:	self->use(self, attacker, attacker);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
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
line 2306
;2306:}
LABELV $851
endproc func_usable_pain 8 12
export func_usable_die
proc func_usable_die 4 12
line 2309
;2307:
;2308:void func_usable_die(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;2309:{
line 2310
;2310:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 2311
;2311:	self->use(self, inflictor, attacker);
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
line 2312
;2312:}
LABELV $852
endproc func_usable_die 4 12
export SP_func_usable
proc SP_func_usable 20 8
line 2332
;2313:
;2314:/*QUAKED func_usable (0 .5 .8) ? STARTOFF x x ALWAYS_ON x x x x
;2315:START_OFF - the wall will not be there
;2316:ALWAYS_ON - Doesn't toggle on and off when used, just runs usescript and fires target
;2317:
;2318:A bmodel that just sits there, doing nothing.  Can be used for conditional walls and models.
;2319:"targetname" - When used, will toggle on and off
;2320:"target"	Will fire this target every time it is toggled OFF
;2321:"model2"	.md3 model to also draw
;2322:"color"		constantLight color
;2323:"light"		constantLight radius
;2324:"usescript" script to run when turned on
;2325:"deathscript"  script to run when turned off
;2326:"wait"		amount of time before the object is usable again (only valid with ALWAYS_ON flag)
;2327:"health"	if it has health, it will be used whenever shot at/killed - if you want it to only be used once this way, set health to 1
;2328:"endframe"	Will make it animate to next shader frame when used, not turn on/off... set this to number of frames in the shader, minus 1
;2329:*/
;2330:
;2331:void SP_func_usable( gentity_t *self ) 
;2332:{
line 2333
;2333:	trap_SetBrushModel( self, self->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 2334
;2334:	InitMover( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 2335
;2335:	VectorCopy( self->s.origin, self->s.pos.trBase );
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
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2336
;2336:	VectorCopy( self->s.origin, self->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2338
;2337:
;2338:	self->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 1
ASGNI4
line 2339
;2339:	if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $854
line 2340
;2340:	{
line 2341
;2341:		self->s.solid = 0;
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 0
ASGNI4
line 2342
;2342:		self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 2343
;2343:		self->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 2344
;2344:		self->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2345
;2345:		self->s.eFlags |= EF_NODRAW;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2346
;2346:		self->count = 0;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 0
ASGNI4
line 2347
;2347:	}
LABELV $854
line 2362
;2348:
;2349:	//FIXME: Animation?
;2350:	/*
;2351:	if (self->spawnflags & 2)
;2352:	{
;2353:		self->s.eFlags |= EF_ANIM_ALLFAST;
;2354:	}
;2355:
;2356:	if (self->spawnflags & 4)
;2357:	{//FIXME: need to be able to do change to something when it's done?  Or not be usable until it's done?
;2358:		self->s.eFlags |= EF_ANIM_ONCE;
;2359:	}
;2360:	*/
;2361:
;2362:	self->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 2364
;2363:
;2364:	self->use = func_usable_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 func_usable_use
ASGNP4
line 2366
;2365:
;2366:	if ( self->health )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $856
line 2367
;2367:	{
line 2368
;2368:		self->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 2369
;2369:		self->die = func_usable_die;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 func_usable_die
ASGNP4
line 2370
;2370:		self->pain = func_usable_pain;
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRGP4 func_usable_pain
ASGNP4
line 2371
;2371:	}
LABELV $856
line 2381
;2372:
;2373:	//FIXME: Animation?
;2374:	/*if ( self->endFrame > 0 )
;2375:	{
;2376:		self->s.frame = self->startFrame = 0;
;2377:		self->s.eFlags |= EF_SHADER_ANIM;
;2378:		self->s.time = self->endFrame + 1;
;2379:	}*/
;2380:
;2381:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2382
;2382:}
LABELV $853
endproc SP_func_usable 20 8
bss
export gExplSound
align 4
LABELV gExplSound
skip 4
export pushed_p
align 4
LABELV pushed_p
skip 4
export pushed
align 4
LABELV pushed
skip 32768
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
LABELV $820
byte 1 109
byte 1 97
byte 1 120
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $783
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $780
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 50
byte 1 95
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $779
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 50
byte 1 95
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $778
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 50
byte 1 95
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $777
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 50
byte 1 95
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $776
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 49
byte 1 95
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $775
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 49
byte 1 95
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $774
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 49
byte 1 95
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $773
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 47
byte 1 109
byte 1 101
byte 1 116
byte 1 97
byte 1 108
byte 1 49
byte 1 95
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $772
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $769
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 50
byte 1 95
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $768
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 50
byte 1 95
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $767
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 50
byte 1 95
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $766
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 50
byte 1 95
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $765
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 49
byte 1 95
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $764
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 49
byte 1 95
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $763
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 49
byte 1 95
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $762
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 47
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 49
byte 1 95
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $761
byte 1 119
byte 1 111
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $758
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 105
byte 1 99
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 95
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $757
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 105
byte 1 99
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 95
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $756
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $753
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 49
byte 1 95
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $752
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 49
byte 1 95
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $751
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 49
byte 1 95
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $750
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 117
byte 1 110
byte 1 107
byte 1 115
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 49
byte 1 95
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $745
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
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 99
byte 1 97
byte 1 114
byte 1 103
byte 1 111
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 100
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $744
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
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $743
byte 1 98
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $742
byte 1 0
align 1
LABELV $741
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $740
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $739
byte 1 100
byte 1 101
byte 1 98
byte 1 114
byte 1 105
byte 1 115
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $738
byte 1 100
byte 1 109
byte 1 103
byte 1 114
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $720
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
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 72
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $713
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $707
byte 1 112
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $706
byte 1 51
byte 1 50
byte 1 0
align 1
LABELV $694
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
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
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $679
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $675
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $674
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
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
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $668
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
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
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $659
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 117
byte 1 110
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $620
byte 1 52
byte 1 0
align 1
LABELV $615
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
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 47
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $614
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $603
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $600
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $599
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $598
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $597
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $580
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $546
byte 1 48
byte 1 0
align 1
LABELV $545
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $532
byte 1 50
byte 1 0
align 1
LABELV $531
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $530
byte 1 56
byte 1 0
align 1
LABELV $529
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $524
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
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 49
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $523
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $522
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
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 49
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
LABELV $521
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $520
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
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 49
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $519
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $516
byte 1 49
byte 1 0
align 1
LABELV $515
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $502
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $417
byte 1 49
byte 1 32
byte 1 49
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $416
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $415
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $414
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $413
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $377
byte 1 82
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 95
byte 1 66
byte 1 105
byte 1 110
byte 1 97
byte 1 114
byte 1 121
byte 1 77
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $184
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 95
byte 1 112
byte 1 32
byte 1 62
byte 1 32
byte 1 38
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 91
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 84
byte 1 73
byte 1 84
byte 1 73
byte 1 69
byte 1 83
byte 1 93
byte 1 0
