data
export flatNormal
align 4
LABELV flatNormal
byte 4 0
byte 4 0
byte 4 1065353216
export PM_GroundSlideOkay
code
proc PM_GroundSlideOkay 12 4
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\bg_slidemove.c"
line 21
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_slidemove.c -- part of bg_pmove functionality
;4:
;5:#include "q_shared.h"
;6:#include "bg_public.h"
;7:#include "bg_local.h"
;8:
;9:/*
;10:
;11:input: origin, velocity, bounds, groundPlane, trace function
;12:
;13:output: origin, velocity, impacts, stairup boolean
;14:
;15:*/
;16:
;17:extern float MovementOverbounceFactor(int moveStyle, playerState_t* ps, usercmd_t* ucmd);
;18:vec3_t flatNormal = {0,0,1};
;19:
;20:qboolean PM_GroundSlideOkay(float zNormal)
;21:{
line 22
;22:	int legsAnim = pm->ps->legsAnim & ~ANIM_TOGGLEBIT;
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
line 26
;23:	// nvm, already guarded in all calls
;24:	//if (!(pml.mod.runFlags & RFL_CLIMBTECH)) return qtrue;
;25:
;26:	if (zNormal > 0)
ADDRFP4 0
INDIRF4
CNSTF4 0
LEF4 $95
line 27
;27:	{
line 28
;28:		if (pm->ps->velocity[2] > 0)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $97
line 29
;29:		{
line 30
;30:			if (legsAnim == BOTH_WALL_RUN_RIGHT
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 915
EQI4 $105
ADDRLP4 4
INDIRI4
CNSTI4 918
EQI4 $105
ADDRLP4 4
INDIRI4
CNSTI4 917
EQI4 $105
ADDRLP4 4
INDIRI4
CNSTI4 920
EQI4 $105
ADDRLP4 4
INDIRI4
CNSTI4 615
EQI4 $105
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_InReboundJump
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $99
LABELV $105
line 39
;31:				|| legsAnim == BOTH_WALL_RUN_LEFT
;32:				|| legsAnim == BOTH_WALL_RUN_RIGHT_STOP
;33:				|| legsAnim == BOTH_WALL_RUN_LEFT_STOP
;34:				|| legsAnim == BOTH_FORCEWALLRUNFLIP_START
;35:				//|| pm->ps->legsAnim == BOTH_FORCELONGLEAP_START
;36:				//|| pm->ps->legsAnim == BOTH_FORCELONGLEAP_ATTACK
;37:				//|| pm->ps->legsAnim == BOTH_FORCELONGLEAP_LAND
;38:				|| BG_InReboundJump(legsAnim))
;39:			{
line 40
;40:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $94
JUMPV
LABELV $99
line 42
;41:			}
;42:		}
LABELV $97
line 43
;43:	}
LABELV $95
line 44
;44:	return qtrue;
CNSTI4 1
RETI4
LABELV $94
endproc PM_GroundSlideOkay 12 4
export PM_LimitedClipVelocity
proc PM_LimitedClipVelocity 120 4
line 58
;45:}
;46:
;47:
;48:
;49:/*
;50:==================
;51:PM_LimitedClipVelocity
;52:
;53:Slide off of the impacting surface
;54:
;55:Limit maximum velocity while keeping original direction components
;56:==================
;57:*/
;58:void PM_LimitedClipVelocity(vec3_t in, vec3_t normal, vec3_t out, float overbounce, float maxSpeed) {
line 68
;59:	float	backoff;
;60:	float	change;
;61:	int		i;
;62:	vec3_t	normalComponent;
;63:	vec3_t	nonNormalComponent;
;64:	float	maxLenOut;
;65:	float	lenOut;
;66:	float	lenNonNormal;
;67:
;68:	if ((pm->modParms.runFlags & RFL_CLIMBTECH) && (pm->ps->pm_flags & PMF_STUCK_TO_WALL))
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 52
INDIRI4
EQI4 $107
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 52
INDIRI4
EQI4 $107
line 69
;69:	{//no sliding!
line 70
;70:		VectorCopy(in, out);
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 71
;71:		return;
ADDRGP4 $106
JUMPV
LABELV $107
line 74
;72:	}
;73:
;74:	backoff = DotProduct(in, normal);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 4
ASGNI4
ADDRLP4 68
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 60
INDIRP4
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 56
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 60
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 76
;75:
;76:	VectorScale(normal, backoff, nonNormalComponent); // just reusing the var to not waste memory
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 77
;77:	VectorSubtract(in, nonNormalComponent, nonNormalComponent); // nonNormalComponent is what MUST be preserved even if we limit max velocity.
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 78
;78:	VectorSubtract(in, nonNormalComponent, normalComponent); // non
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 84
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 79
;79:	lenNonNormal = VectorLength(nonNormalComponent);
ADDRLP4 12
ARGP4
ADDRLP4 88
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 88
INDIRF4
ASGNF4
line 81
;80:
;81:	if (backoff < 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $119
line 82
;82:		backoff *= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 83
;83:	}
ADDRGP4 $120
JUMPV
LABELV $119
line 84
;84:	else {
line 85
;85:		backoff /= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
ASGNF4
line 86
;86:	}
LABELV $120
line 88
;87:
;88:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $121
line 89
;89:		change = normal[i] * backoff;
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
line 90
;90:		out[i] = normalComponent[i] - change;
ADDRLP4 92
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 92
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 92
INDIRI4
ADDRLP4 24
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 91
;91:	}
LABELV $122
line 88
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $121
line 98
;92:
;93:	// length(out*f+nonNormalComponent) < 100000
;94:	// out and nonnormal are perpendicular to each other so
;95:	// sqrt(lenOut*lenOut + lenNonNormal*lenNonNormal) = 100000
;96:	// lenOut*lenOut = 100000^2 - lenNonNormal*lenNonNormal 
;97:	// lenOut = sqrt(100000^2 - lenNonNormal*lenNonNormal)
;98:	maxLenOut = sqrtf(maxSpeed* maxSpeed - lenNonNormal* lenNonNormal);
ADDRLP4 92
ADDRFP4 16
INDIRF4
ASGNF4
ADDRLP4 92
INDIRF4
ADDRLP4 92
INDIRF4
MULF4
ADDRLP4 40
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
SUBF4
ARGF4
ADDRLP4 100
ADDRGP4 sqrtf
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 100
INDIRI4
CVIF4 4
ASGNF4
line 99
;99:	if ((lenOut = VectorLength(out)) > maxLenOut) {
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 104
INDIRF4
ASGNF4
ADDRLP4 104
INDIRF4
ADDRLP4 36
INDIRF4
LEF4 $125
line 100
;100:		VectorScale(out,maxLenOut/lenOut, out);
ADDRLP4 108
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 44
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 112
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 44
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 116
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 36
INDIRF4
ADDRLP4 44
INDIRF4
DIVF4
MULF4
ASGNF4
line 101
;101:	}
LABELV $125
line 102
;102:	VectorAdd(out, nonNormalComponent, out);
ADDRLP4 108
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
ADDRLP4 112
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 116
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDF4
ASGNF4
line 103
;103:}
LABELV $106
endproc PM_LimitedClipVelocity 120 4
export PM_LimitedClipVelocity2
proc PM_LimitedClipVelocity2 100 4
line 114
;104:
;105:/*
;106:==================
;107:PM_LimitedClipVelocity
;108:
;109:Slide off of the impacting surface
;110:
;111:Limit maximum velocity on the normal axis while keeping original direction components
;112:==================
;113:*/
;114:void PM_LimitedClipVelocity2(vec3_t in, vec3_t normal, vec3_t out, float overbounce, float maxSpeedNormal) {
line 124
;115:	float	backoff;
;116:	float	change;
;117:	int		i;
;118:	vec3_t	normalComponent;
;119:	vec3_t	nonNormalComponent;
;120:	//float	maxLenOut;
;121:	float	lenOut;
;122:	float	lenNonNormal;
;123:
;124:	if ((pm->modParms.runFlags & RFL_CLIMBTECH) && (pm->ps->pm_flags & PMF_STUCK_TO_WALL))
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 48
INDIRI4
EQI4 $130
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 48
INDIRI4
EQI4 $130
line 125
;125:	{//no sliding!
line 126
;126:		VectorCopy(in, out);
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 127
;127:		return;
ADDRGP4 $129
JUMPV
LABELV $130
line 130
;128:	}
;129:
;130:	backoff = DotProduct(in, normal);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 4
ASGNI4
ADDRLP4 64
CNSTI4 8
ASGNI4
ADDRLP4 8
ADDRLP4 52
INDIRP4
INDIRF4
ADDRLP4 56
INDIRP4
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 52
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 132
;131:
;132:	VectorScale(normal, backoff, nonNormalComponent); // just reusing the var to not waste memory
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 68
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 133
;133:	VectorSubtract(in, nonNormalComponent, nonNormalComponent); // nonNormalComponent is what MUST be preserved even if we limit max velocity.
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 134
;134:	VectorSubtract(in, nonNormalComponent, normalComponent); // non
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 80
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 136
;135:
;136:	if (backoff < 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $142
line 137
;137:		backoff *= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 138
;138:	}
ADDRGP4 $143
JUMPV
LABELV $142
line 139
;139:	else {
line 140
;140:		backoff /= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
ASGNF4
line 141
;141:	}
LABELV $143
line 143
;142:
;143:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $144
line 144
;144:		change = normal[i] * backoff;
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
line 145
;145:		out[i] = normalComponent[i] - change;
ADDRLP4 84
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 84
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 84
INDIRI4
ADDRLP4 24
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 146
;146:	}
LABELV $145
line 143
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $144
line 148
;147:
;148:	if ((lenOut = VectorLength(out)) > maxSpeedNormal) {
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 84
INDIRF4
ADDRFP4 16
INDIRF4
LEF4 $148
line 149
;149:		VectorScale(out, maxSpeedNormal /lenOut, out);
ADDRLP4 88
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRFP4 16
INDIRF4
ADDRLP4 36
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
ADDRFP4 16
INDIRF4
ADDRLP4 36
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
ADDRFP4 16
INDIRF4
ADDRLP4 36
INDIRF4
DIVF4
MULF4
ASGNF4
line 150
;150:	}
LABELV $148
line 151
;151:	VectorAdd(out, nonNormalComponent, out);
ADDRLP4 88
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDF4
ASGNF4
line 152
;152:}
LABELV $129
endproc PM_LimitedClipVelocity2 100 4
export PM_Q2StepSlideMove_
proc PM_Q2StepSlideMove_ 1280 28
line 169
;153:
;154:
;155:/*
;156:==================
;157:PM_StepSlideMove
;158:
;159:Each intersection will try to step over the obstruction instead of
;160:sliding along it.
;161:
;162:Returns a new origin, velocity, and contact entity
;163:Does not modify any world state?
;164:==================
;165:*/
;166:#define	MIN_STEP_NORMAL	0.7		// can't step up onto very steep slopes
;167:#define	MAX_CLIP_PLANES	5
;168:void PM_Q2StepSlideMove_(void)
;169:{
line 181
;170:	int			bumpcount, numbumps;
;171:	vec3_t		dir;
;172:	float		d;
;173:	int			numplanes;
;174:	vec3_t		normal,planes[MAX_CLIP_PLANES];
;175:	vec3_t		primal_velocity;
;176:	int			i, j;
;177:	trace_t	trace;
;178:	vec3_t		end;
;179:	float		time_left;
;180:	float		tmp;
;181:	float		overbounce = MovementOverbounceFactor(pm->modParms.physics, pm->ps,&pm->cmd);
ADDRLP4 1224
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1224
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 1224
INDIRP4
INDIRP4
ARGP4
ADDRLP4 1224
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 1228
ADDRGP4 MovementOverbounceFactor
CALLF4
ASGNF4
ADDRLP4 84
ADDRLP4 1228
INDIRF4
ASGNF4
line 183
;182:
;183:	if (overbounce == OVERCLIP) {
ADDRLP4 84
INDIRF4
CNSTF4 1065361605
NEF4 $153
line 184
;184:		overbounce = 1.01f; // if we arent overriding aanything, we use the q2 standard instead (1.01 instead of 1.001)
ADDRLP4 84
CNSTF4 1065437102
ASGNF4
line 185
;185:	}
LABELV $153
line 187
;186:
;187:	numbumps = 4;
ADDRLP4 1216
CNSTI4 4
ASGNI4
line 189
;188:
;189:	VectorCopy(pm->ps->velocity, primal_velocity);
ADDRLP4 1196
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 190
;190:	numplanes = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 192
;191:
;192:	time_left = pml.frametime;
ADDRLP4 88
ADDRGP4 pml+36
INDIRF4
ASGNF4
line 194
;193:
;194:	for (bumpcount = 0; bumpcount < numbumps; bumpcount++)
ADDRLP4 1208
CNSTI4 0
ASGNI4
ADDRGP4 $159
JUMPV
LABELV $156
line 195
;195:	{
line 196
;196:		for (i = 0; i < 3; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $160
line 197
;197:			end[i] = pm->ps->origin[i] + time_left * pm->ps->velocity[i];
ADDRLP4 1232
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1236
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1232
INDIRI4
ADDRLP4 92
ADDP4
ADDRLP4 1232
INDIRI4
ADDRLP4 1236
INDIRP4
CNSTI4 20
ADDP4
ADDP4
INDIRF4
ADDRLP4 88
INDIRF4
ADDRLP4 1232
INDIRI4
ADDRLP4 1236
INDIRP4
CNSTI4 32
ADDP4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $161
line 196
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $160
line 199
;198:
;199:		pm->trace(&trace,pm->ps->origin, pm->mins, pm->maxs, end, pm->ps->clientNum, pm->tracemask);
ADDRLP4 104
ARGP4
ADDRLP4 1240
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1244
ADDRLP4 1240
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1244
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1240
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1240
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 1244
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1240
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1240
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 201
;200:
;201:		if (trace.allsolid)
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $164
line 202
;202:		{	// entity is trapped in another solid
line 203
;203:			pm->ps->velocity[2] = 0;	// don't build up falling damage
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 204
;204:			return;
ADDRGP4 $152
JUMPV
LABELV $164
line 207
;205:		}
;206:
;207:		if (trace.fraction > 0)
ADDRLP4 104+8
INDIRF4
CNSTF4 0
LEF4 $166
line 208
;208:		{	// actually covered some distance
line 209
;209:			VectorCopy(trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 104+12
INDIRB
ASGNB 12
line 210
;210:			numplanes = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 211
;211:		}
LABELV $166
line 213
;212:
;213:		if (trace.fraction == 1)
ADDRLP4 104+8
INDIRF4
CNSTF4 1065353216
NEF4 $170
line 214
;214:			break;		// moved the entire distance
ADDRGP4 $158
JUMPV
LABELV $170
line 217
;215:
;216:	   // save entity for contact
;217:		if (pm->numtouch < MAXTOUCH && trace.entityNum != ENTITYNUM_WORLD)
ADDRGP4 pm
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 32
GEI4 $173
ADDRLP4 104+52
INDIRI4
CNSTI4 1022
EQI4 $173
line 218
;218:		{
line 219
;219:			pm->touchents[pm->numtouch] = trace.entityNum;
ADDRLP4 1248
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1248
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1248
INDIRP4
CNSTI4 88
ADDP4
ADDP4
ADDRLP4 104+52
INDIRI4
ASGNI4
line 220
;220:			pm->numtouch++;
ADDRLP4 1252
ADDRGP4 pm
INDIRP4
CNSTI4 84
ADDP4
ASGNP4
ADDRLP4 1252
INDIRP4
ADDRLP4 1252
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 221
;221:		}
LABELV $173
line 223
;222:
;223:		time_left -= time_left * trace.fraction;
ADDRLP4 88
ADDRLP4 88
INDIRF4
ADDRLP4 88
INDIRF4
ADDRLP4 104+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 226
;224:
;225:		// slide along this plane
;226:		if (numplanes >= MAX_CLIP_PLANES)
ADDRLP4 68
INDIRI4
CNSTI4 5
LTI4 $178
line 227
;227:		{	// this shouldn't really happen
line 228
;228:			VectorCopy(vec3_origin, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 229
;229:			break;
ADDRGP4 $158
JUMPV
LABELV $178
line 232
;230:		}
;231:
;232:		VectorCopy(trace.plane.normal,normal);
ADDRLP4 72
ADDRLP4 104+24
INDIRB
ASGNB 12
line 234
;233:
;234:		if ((pm->modParms.runFlags & RFL_CLIMBTECH) && !PM_GroundSlideOkay(normal[2]))
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $181
ADDRLP4 72+8
INDIRF4
ARGF4
ADDRLP4 1252
ADDRGP4 PM_GroundSlideOkay
CALLI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 0
NEI4 $181
line 235
;235:		{//wall-running
line 237
;236:			//never push up off a sloped wall
;237:			normal[2] = 0;
ADDRLP4 72+8
CNSTF4 0
ASGNF4
line 238
;238:			VectorNormalize(normal);
ADDRLP4 72
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 239
;239:		}
LABELV $181
line 248
;240:
;241:		//
;242:		// if this is the same plane we hit before, nudge velocity
;243:		// out along it, which fixes some epsilon issues with
;244:		// non-axial planes
;245:		// 
;246:		// TA: Copied this over from the normal jk function and it makes the movement smoother while keeping it overall nice. Nice!
;247:		//
;248:		if (!(pm->modParms.runFlags & RFL_CLIMBTECH) || !(pm->ps->pm_flags & PMF_STUCK_TO_WALL))
ADDRLP4 1256
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1260
CNSTI4 0
ASGNI4
ADDRLP4 1256
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 1260
INDIRI4
EQI4 $187
ADDRLP4 1256
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 1260
INDIRI4
NEI4 $185
LABELV $187
line 249
;249:		{//no sliding if stuck to wall!
line 250
;250:			for (i = 0; i < numplanes; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $191
JUMPV
LABELV $188
line 251
;251:				if (DotProduct(normal, planes[i]) > 0.99f) {
ADDRLP4 1264
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 72
INDIRF4
ADDRLP4 1264
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
MULF4
ADDRLP4 72+4
INDIRF4
ADDRLP4 1264
INDIRI4
ADDRLP4 8+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 72+8
INDIRF4
ADDRLP4 1264
INDIRI4
ADDRLP4 8+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $192
line 252
;252:					VectorAdd(normal, pm->ps->velocity, pm->ps->velocity);
ADDRLP4 1268
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1268
INDIRP4
ADDRLP4 72
INDIRF4
ADDRLP4 1268
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1272
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1272
INDIRP4
ADDRLP4 72+4
INDIRF4
ADDRLP4 1272
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1276
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1276
INDIRP4
ADDRLP4 72+8
INDIRF4
ADDRLP4 1276
INDIRP4
INDIRF4
ADDF4
ASGNF4
line 253
;253:					break;
ADDRGP4 $190
JUMPV
LABELV $192
line 255
;254:				}
;255:			}
LABELV $189
line 250
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $191
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $188
LABELV $190
line 256
;256:			if (i < numplanes) {
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
GEI4 $200
line 257
;257:				continue;
ADDRGP4 $157
JUMPV
LABELV $200
line 259
;258:			}
;259:		}
LABELV $185
line 261
;260:
;261:		VectorCopy(normal, planes[numplanes]);
CNSTI4 12
ADDRLP4 68
INDIRI4
MULI4
ADDRLP4 8
ADDP4
ADDRLP4 72
INDIRB
ASGNB 12
line 262
;262:		numplanes++;
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 309
;263:
;264:#if 0
;265:		float		rub;
;266:
;267:		//
;268:		// modify velocity so it parallels all of the clip planes
;269:		//
;270:		if (numplanes == 1)
;271:		{	// go along this plane
;272:			VectorCopy(pm->ps->velocity, dir);
;273:			VectorNormalize(dir);
;274:			rub = 1.0 + 0.5 * DotProduct(dir, planes[0]);
;275:
;276:			// slide along the plane
;277:			PM_ClipVelocity(pm->ps->velocity, planes[0], pm->ps->velocity, 1.01);
;278:			// rub some extra speed off on xy axis
;279:			// not on Z, or you can scrub down walls
;280:			pm->ps->velocity[0] *= rub;
;281:			pm->ps->velocity[1] *= rub;
;282:			pm->ps->velocity[2] *= rub;
;283:		}
;284:		else if (numplanes == 2)
;285:		{	// go along the crease
;286:			VectorCopy(pm->ps->velocity, dir);
;287:			VectorNormalize(dir);
;288:			rub = 1.0 + 0.5 * DotProduct(dir, planes[0]);
;289:
;290:			// slide along the plane
;291:			CrossProduct(planes[0], planes[1], dir);
;292:			d = DotProduct(dir, pm->ps->velocity);
;293:			VectorScale(dir, d, pm->ps->velocity);
;294:
;295:			// rub some extra speed off
;296:			VectorScale(pm->ps->velocity, rub, pm->ps->velocity);
;297:		}
;298:		else
;299:		{
;300:			//			Con_Printf ("clip velocity, numplanes == %i\n",numplanes);
;301:			VectorCopy(vec3_origin, pm->ps->velocity);
;302:			break;
;303:		}
;304:
;305:#else
;306:		//
;307:		// modify original_velocity so it parallels all of the clip planes
;308:		//
;309:		for (i = 0; i < numplanes; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $205
JUMPV
LABELV $202
line 310
;310:		{
line 311
;311:			if (pm->modParms.physics == MV_PINBALL) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 7
NEI4 $206
line 313
;312:				//PM_LimitedClipVelocity(pm->ps->velocity, planes[i], pm->ps->velocity, overbounce,100000.0f);
;313:				overbounce -= planes[i][2]*0.6f* (MIN(1600.0f,fabsf(pm->ps->velocity[2]))/1600.0f); // dont let ground and ceiling bounce as as insanely much unless we have no proper speed to begin wtih.
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 1268
ADDRGP4 fabsf
CALLI4
ASGNI4
CNSTF4 1153957888
ADDRLP4 1268
INDIRI4
CVIF4 4
GEF4 $210
ADDRLP4 1264
CNSTF4 1153957888
ASGNF4
ADDRGP4 $211
JUMPV
LABELV $210
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 1272
ADDRGP4 fabsf
CALLI4
ASGNI4
ADDRLP4 1264
ADDRLP4 1272
INDIRI4
CVIF4 4
ASGNF4
LABELV $211
ADDRLP4 84
ADDRLP4 84
INDIRF4
CNSTF4 1058642330
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8+8
ADDP4
INDIRF4
MULF4
ADDRLP4 1264
INDIRF4
CNSTF4 1153957888
DIVF4
MULF4
SUBF4
ASGNF4
line 314
;314:				PM_LimitedClipVelocity2(pm->ps->velocity, planes[i], pm->ps->velocity, overbounce,10000.0f);
ADDRLP4 1276
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1276
INDIRP4
ARGP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
ADDP4
ARGP4
ADDRLP4 1276
INDIRP4
ARGP4
ADDRLP4 84
INDIRF4
ARGF4
CNSTF4 1176256512
ARGF4
ADDRGP4 PM_LimitedClipVelocity2
CALLV
pop
line 315
;315:			}
ADDRGP4 $207
JUMPV
LABELV $206
line 316
;316:			else {
line 317
;317:				PM_ClipVelocity(pm->ps->velocity, planes[i], pm->ps->velocity, overbounce);
ADDRLP4 1264
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1264
INDIRP4
ARGP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
ADDP4
ARGP4
ADDRLP4 1264
INDIRP4
ARGP4
ADDRLP4 84
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 318
;318:			}
LABELV $207
line 323
;319:			//if (moveStyle == MV_PINBALL && (tmp=VectorLength(pm->ps->velocity)) > 100000.0f) { // this is bad, it loses non-bounce-direction almost immediately.
;320:			//	// limit it or we eventually get stuck in walls with velocity reaching billions
;321:			//	VectorScale(pm->ps->velocity, 100000.0f/ tmp, pm->ps->velocity);
;322:			//}
;323:			if (planes[i][2] >= MIN_WALK_NORMAL) {
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8+8
ADDP4
INDIRF4
CNSTF4 1060320051
LTF4 $212
line 324
;324:				pml.clipped = qtrue; // uh am i putting this the right place? idk
ADDRGP4 pml+1176
CNSTI4 1
ASGNI4
line 325
;325:			}
LABELV $212
line 326
;326:			for (j = 0; j < numplanes; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $219
JUMPV
LABELV $216
line 327
;327:				if (j != i)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $220
line 328
;328:				{
line 329
;329:					if (DotProduct(pm->ps->velocity, planes[j]) < 0)
ADDRLP4 1264
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1268
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1264
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 1268
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
MULF4
ADDRLP4 1264
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 1268
INDIRI4
ADDRLP4 8+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 1264
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 1268
INDIRI4
ADDRLP4 8+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $222
line 330
;330:						break;	// not ok
ADDRGP4 $218
JUMPV
LABELV $222
line 331
;331:				}
LABELV $220
LABELV $217
line 326
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $219
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $216
LABELV $218
line 332
;332:			if (j == numplanes)
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $226
line 333
;333:				break;
ADDRGP4 $204
JUMPV
LABELV $226
line 334
;334:		}
LABELV $203
line 309
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $205
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $202
LABELV $204
line 336
;335:
;336:		if (i != numplanes)
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $228
line 337
;337:		{	// go along this plane
line 338
;338:		}
ADDRGP4 $229
JUMPV
LABELV $228
line 340
;339:		else
;340:		{	// go along the crease
line 341
;341:			if (numplanes != 2)
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $230
line 342
;342:			{
line 344
;343:				//				Con_Printf ("clip velocity, numplanes == %i\n",numplanes);
;344:				VectorCopy(vec3_origin, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 345
;345:				break;
ADDRGP4 $158
JUMPV
LABELV $230
line 347
;346:			}
;347:			CrossProduct(planes[0], planes[1], dir);
ADDRLP4 8
ARGP4
ADDRLP4 8+12
ARGP4
ADDRLP4 1184
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 348
;348:			d = DotProduct(dir, pm->ps->velocity);
ADDRLP4 1264
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1212
ADDRLP4 1184
INDIRF4
ADDRLP4 1264
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 1184+4
INDIRF4
ADDRLP4 1264
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 1184+8
INDIRF4
ADDRLP4 1264
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 349
;349:			VectorScale(dir, d, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1184
INDIRF4
ADDRLP4 1212
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1184+4
INDIRF4
ADDRLP4 1212
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1184+8
INDIRF4
ADDRLP4 1212
INDIRF4
MULF4
ASGNF4
line 350
;350:		}
LABELV $229
line 356
;351:#endif
;352:		//
;353:		// if velocity is against the original velocity, stop dead
;354:		// to avoid tiny occilations in sloping corners
;355:		//
;356:		if (DotProduct(pm->ps->velocity, primal_velocity) <= 0 && pm->modParms.physics != MV_PINBALL)
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
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 1196
INDIRF4
MULF4
ADDRLP4 1268
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 1196+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1268
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 1196+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GTF4 $237
ADDRLP4 1264
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 7
EQI4 $237
line 357
;357:		{
line 358
;358:			VectorCopy(vec3_origin, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 359
;359:			break;
ADDRGP4 $158
JUMPV
LABELV $237
line 361
;360:		}
;361:	}
LABELV $157
line 194
ADDRLP4 1208
ADDRLP4 1208
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $159
ADDRLP4 1208
INDIRI4
ADDRLP4 1216
INDIRI4
LTI4 $156
LABELV $158
line 363
;362:
;363:	if (pm->ps->pm_time)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $241
line 364
;364:	{
line 365
;365:		VectorCopy(primal_velocity, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1196
INDIRB
ASGNB 12
line 366
;366:	}
LABELV $241
line 367
;367:}
LABELV $152
endproc PM_Q2StepSlideMove_ 1280 28
export PM_Q2StepSlideMove
proc PM_Q2StepSlideMove 1180 28
line 376
;368:
;369:/*
;370:==================
;371:PM_StepSlideMove
;372:
;373:==================
;374:*/
;375:void PM_Q2StepSlideMove(qboolean gravity)
;376:{
line 384
;377:	vec3_t		start_o, start_v;
;378:	vec3_t		down_o, down_v;
;379:	trace_t		trace;
;380:	float		down_dist, up_dist;
;381:	//	vec3_t		delta;
;382:	vec3_t		up, down;
;383:
;384:	if (gravity) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $244
line 388
;385:		//if (pm->ps->gravity > 0)
;386:		//	pml.velocity[2] = 0;
;387:		//else
;388:			pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 1160
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1164
ADDRLP4 1160
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1164
INDIRP4
ADDRLP4 1164
INDIRP4
INDIRF4
ADDRLP4 1160
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
line 389
;389:	}
LABELV $244
line 391
;390:
;391:	VectorCopy(pm->ps->origin, start_o);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 392
;392:	VectorCopy(pm->ps->velocity, start_v);
ADDRLP4 1140
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 394
;393:
;394:	PM_Q2StepSlideMove_();
ADDRGP4 PM_Q2StepSlideMove_
CALLV
pop
line 396
;395:
;396:	VectorCopy(pm->ps->origin, down_o);
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 397
;397:	VectorCopy(pm->ps->velocity, down_v);
ADDRLP4 1128
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 399
;398:
;399:	VectorCopy(start_o, up);
ADDRLP4 12
ADDRLP4 0
INDIRB
ASGNB 12
line 400
;400:	up[2] += STEPSIZE;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 402
;401:
;402:	pm->trace(&trace,up, pm->mins, pm->maxs, up, pm->ps->clientNum, pm->tracemask);
ADDRLP4 36
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1160
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1160
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1160
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1160
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1160
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 403
;403:	if (trace.allsolid)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $248
line 404
;404:		return;		// can't step up
ADDRGP4 $243
JUMPV
LABELV $248
line 407
;405:
;406:	// try sliding above
;407:	VectorCopy(up, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 408
;408:	VectorCopy(start_v, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1140
INDIRB
ASGNB 12
line 410
;409:
;410:	PM_Q2StepSlideMove_();
ADDRGP4 PM_Q2StepSlideMove_
CALLV
pop
line 413
;411:
;412:	// push down the final amount
;413:	VectorCopy(pm->ps->origin, down);
ADDRLP4 1116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 414
;414:	down[2] -= STEPSIZE;
ADDRLP4 1116+8
ADDRLP4 1116+8
INDIRF4
CNSTF4 1099956224
SUBF4
ASGNF4
line 415
;415:	pm->trace(&trace,pm->ps->origin, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 36
ARGP4
ADDRLP4 1164
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1168
ADDRLP4 1164
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1168
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1164
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1164
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1168
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1164
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1164
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 416
;416:	if (!trace.allsolid)
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $251
line 417
;417:	{
line 418
;418:		VectorCopy(trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 36+12
INDIRB
ASGNB 12
line 419
;419:	}
LABELV $251
line 428
;420:
;421:#if 0
;422:	VectorSubtract(pm->ps->origin, up, delta);
;423:	up_dist = DotProduct(delta, start_v);
;424:
;425:	VectorSubtract(down_o, start_o, delta);
;426:	down_dist = DotProduct(delta, start_v);
;427:#else
;428:	VectorCopy(pm->ps->origin, up);
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 431
;429:
;430:	// decide which one went farther
;431:	down_dist = (down_o[0] - start_o[0]) * (down_o[0] - start_o[0])
ADDRLP4 1172
ADDRLP4 24
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1152
ADDRLP4 1172
INDIRF4
ADDRLP4 1172
INDIRF4
MULF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 433
;432:		+ (down_o[1] - start_o[1]) * (down_o[1] - start_o[1]);
;433:	up_dist = (up[0] - start_o[0]) * (up[0] - start_o[0])
ADDRLP4 1176
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1156
ADDRLP4 1176
INDIRF4
ADDRLP4 1176
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 437
;434:		+ (up[1] - start_o[1]) * (up[1] - start_o[1]);
;435:#endif
;436:
;437:	if (down_dist > up_dist || trace.plane.normal[2] < MIN_STEP_NORMAL)
ADDRLP4 1152
INDIRF4
ADDRLP4 1156
INDIRF4
GTF4 $266
ADDRLP4 36+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $262
LABELV $266
line 438
;438:	{
line 439
;439:		VectorCopy(down_o, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 24
INDIRB
ASGNB 12
line 440
;440:		VectorCopy(down_v, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1128
INDIRB
ASGNB 12
line 441
;441:		return;
ADDRGP4 $243
JUMPV
LABELV $262
line 445
;442:	}
;443:	//!! Special case
;444:	// if we were walking along a plane, then we need to copy the Z over
;445:	pm->ps->velocity[2] = down_v[2];
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1128+8
INDIRF4
ASGNF4
line 446
;446:}
LABELV $243
endproc PM_Q2StepSlideMove 1180 28
export PM_CheckBounceJump
proc PM_CheckBounceJump 56 8
line 450
;447:
;448:
;449:extern void PM_JumpForDir(void);
;450:void PM_CheckBounceJump(vec3_t normal, vec3_t velocity) {
line 452
;451:
;452:	int JUMP_VELOCITY_NEW = JUMP_VELOCITY;
ADDRLP4 0
CNSTI4 225
ASGNI4
line 453
;453:	if (pm->modParms.physics != MV_BOUNCE || pm->cmd.upmove <= 0 || (pm->ps->pm_flags & PMF_JUMP_HELD) || normal[2] < MIN_WALK_NORMAL) {
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 6
NEI4 $273
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
LEI4 $273
ADDRLP4 4
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 8
INDIRI4
NEI4 $273
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1060320051
GEF4 $269
LABELV $273
line 454
;454:		return;
ADDRGP4 $268
JUMPV
LABELV $269
line 457
;455:	}
;456:
;457:	if (pm->ps->usingATST)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $274
line 458
;458:	{
line 459
;459:		return;
ADDRGP4 $268
JUMPV
LABELV $274
line 462
;460:	}
;461:
;462:	if (pm->ps->forceHandExtend == HANDEXTEND_KNOCKDOWN)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
NEI4 $276
line 463
;463:	{
line 464
;464:		return;
ADDRGP4 $268
JUMPV
LABELV $276
line 468
;465:	}
;466:
;467:	//Don't allow jump until all buttons are up
;468:	if (pm->ps->pm_flags & PMF_RESPAWNED) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $278
line 469
;469:		return;
ADDRGP4 $268
JUMPV
LABELV $278
line 472
;470:	}
;471:
;472:	if (PM_InKnockDown(pm->ps) || BG_InRoll(pm->ps, pm->ps->legsAnim))
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 PM_InKnockDown
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $282
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $280
LABELV $282
line 473
;473:	{//in knockdown
line 474
;474:		return;
ADDRGP4 $268
JUMPV
LABELV $280
line 476
;475:	}
;476:	if (MovementIsQuake3Based(pm->modParms.physics)) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $283
line 477
;477:		JUMP_VELOCITY_NEW = 270;
ADDRLP4 0
CNSTI4 270
ASGNI4
line 478
;478:	}
LABELV $283
line 482
;479:	
;480:	//if (pm->ps->groundEntityNum != ENTITYNUM_NONE || pm->ps->origin[2] < pm->ps->fd.forceJumpZStart) // do this always ? calling this function already implies there was a ground bounce anyway
;481:	//{
;482:		pm->ps->fd.forcePowersActive &= ~(1 << FP_LEVITATION);
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
line 485
;483:	//}
;484:
;485:  	velocity[2] += JUMP_VELOCITY_NEW;
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 486
;486:	if (velocity[2] < JUMP_VELOCITY_NEW)
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
GEF4 $285
line 487
;487:		velocity[2] = JUMP_VELOCITY_NEW;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
CVIF4 4
ASGNF4
LABELV $285
line 498
;488:	//if (MovementIsQuake3Based(moveStyle)) {
;489:	//	// TODO flood protect jumps? idk
;490:	//	pm->ps->velocity[2] += JUMP_VELOCITY_NEW;
;491:	//	if (pm->ps->velocity[2] < 270)
;492:	//		pm->ps->velocity[2] = 270;
;493:	//	pm->ps->stats[STAT_LASTJUMPSPEED] = pm->ps->velocity[2];
;494:	//}
;495:	//else {
;496:	//	pm->ps->velocity[2] = JUMP_VELOCITY_NEW;
;497:	//}
;498:	PM_SetForceJumpZStart(pm->ps->origin[2]);//so we don't take damage if we land at same height
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
line 499
;499:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 500
;500:	pml.walking = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 501
;501:	pml.bounceJumped = qtrue;
ADDRGP4 pml+1188
CNSTI4 1
ASGNI4
line 502
;502:	pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 503
;503:	PM_SetGroundEntityNum(ENTITYNUM_NONE);
CNSTI4 1023
ARGI4
ADDRGP4 PM_SetGroundEntityNum
CALLV
pop
line 504
;504:	PM_AddEvent(EV_JUMP);
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 507
;505:	
;506:	// make sure skims work
;507:	pm->ps->pm_flags |= PMF_TIME_LAND;
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
CNSTI4 32
BORI4
ASGNI4
line 508
;508:	pm->ps->pm_time = 250;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 250
ASGNI4
line 511
;509:
;510:	//Set the animations
;511:	if (pm->ps->gravity > 0 && !BG_InSpecialJump(pm->ps->legsAnim, pm->modParms.runFlags))
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
LEI4 $290
ADDRLP4 48
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $290
line 512
;512:	{
line 513
;513:		PM_JumpForDir();
ADDRGP4 PM_JumpForDir
CALLV
pop
line 514
;514:	}
LABELV $290
line 515
;515:}
LABELV $268
endproc PM_CheckBounceJump 56 8
export PM_SlideMove
proc PM_SlideMove 1388 28
line 526
;516:
;517:
;518:/*
;519:==================
;520:PM_SlideMove
;521:
;522:Returns qtrue if the velocity was clipped in some way
;523:==================
;524:*/
;525:#define	MAX_CLIP_PLANES	5
;526:qboolean	PM_SlideMove( qboolean gravity ) {
line 541
;527:	int			bumpcount, numbumps;
;528:	vec3_t		dir;
;529:	float		d;
;530:	int			numplanes;
;531:	vec3_t		normal, planes[MAX_CLIP_PLANES];
;532:	vec3_t		primal_velocity;
;533:	vec3_t		clipVelocity;
;534:	int			i, j, k;
;535:	trace_t	trace;
;536:	vec3_t		end;
;537:	float		time_left;
;538:	float		into;
;539:	vec3_t		endVelocity;
;540:	vec3_t		endClipVelocity;
;541:	float		overbounce = MovementOverbounceFactor(pm->modParms.physics, pm->ps, &pm->cmd);
ADDRLP4 1264
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1264
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 1264
INDIRP4
INDIRP4
ARGP4
ADDRLP4 1264
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 1268
ADDRGP4 MovementOverbounceFactor
CALLF4
ASGNF4
ADDRLP4 128
ADDRLP4 1268
INDIRF4
ASGNF4
line 543
;542:	
;543:	VectorClear( endVelocity );
ADDRLP4 1272
CNSTF4 0
ASGNF4
ADDRLP4 116+8
ADDRLP4 1272
INDIRF4
ASGNF4
ADDRLP4 116+4
ADDRLP4 1272
INDIRF4
ASGNF4
ADDRLP4 116
ADDRLP4 1272
INDIRF4
ASGNF4
line 544
;544:	VectorClear( endClipVelocity );
ADDRLP4 1276
CNSTF4 0
ASGNF4
ADDRLP4 104+8
ADDRLP4 1276
INDIRF4
ASGNF4
ADDRLP4 104+4
ADDRLP4 1276
INDIRF4
ASGNF4
ADDRLP4 104
ADDRLP4 1276
INDIRF4
ASGNF4
line 546
;545:
;546:	numbumps = 4;
ADDRLP4 1248
CNSTI4 4
ASGNI4
line 548
;547:
;548:	pml.groundBounces = qfalse;
ADDRGP4 pml+1184
CNSTI4 0
ASGNI4
line 550
;549:
;550:	VectorCopy (pm->ps->velocity, primal_velocity);
ADDRLP4 1252
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 552
;551:
;552:	if ( gravity ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $298
line 553
;553:		VectorCopy( pm->ps->velocity, endVelocity );
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 554
;554:		endVelocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 116+8
ADDRLP4 116+8
INDIRF4
ADDRGP4 pm
INDIRP4
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
line 555
;555:		pm->ps->velocity[2] = ( pm->ps->velocity[2] + endVelocity[2] ) * 0.5;
ADDRLP4 1280
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1280
INDIRP4
CNSTF4 1056964608
ADDRLP4 1280
INDIRP4
INDIRF4
ADDRLP4 116+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 556
;556:		primal_velocity[2] = endVelocity[2];
ADDRLP4 1252+8
ADDRLP4 116+8
INDIRF4
ASGNF4
line 557
;557:		if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $305
line 558
;558:			if(!(pm->modParms.runFlags & RFL_CLIMBTECH) || PM_GroundSlideOkay(pml.groundTrace.plane.normal[2])){
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $313
ADDRGP4 pml+52+24+8
INDIRF4
ARGF4
ADDRLP4 1284
ADDRGP4 PM_GroundSlideOkay
CALLI4
ASGNI4
ADDRLP4 1284
INDIRI4
CNSTI4 0
EQI4 $308
LABELV $313
line 560
;559:				// slide along the ground plane
;560:				PM_ClipVelocity (pm->ps->velocity, pml.groundTrace.plane.normal, 
ADDRLP4 1288
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1288
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 1288
INDIRP4
ARGP4
ADDRLP4 128
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 562
;561:					pm->ps->velocity, overbounce);
;562:				pml.groundBounces = qtrue;
ADDRGP4 pml+1184
CNSTI4 1
ASGNI4
line 564
;563:
;564:				if (pml.groundTrace.plane.normal[2] >= MIN_WALK_NORMAL) {
ADDRGP4 pml+52+24+8
INDIRF4
CNSTF4 1060320051
LTF4 $317
line 565
;565:					pml.clippedWalkable = qtrue; // uh am i putting this the right place? idk
ADDRGP4 pml+1180
CNSTI4 1
ASGNI4
line 566
;566:				}
LABELV $317
line 567
;567:			}
LABELV $308
line 568
;568:		}
LABELV $305
line 569
;569:	}
LABELV $298
line 571
;570:
;571:	time_left = pml.frametime;
ADDRLP4 1228
ADDRGP4 pml+36
INDIRF4
ASGNF4
line 574
;572:
;573:	// never turn against the ground plane
;574:	if ( pml.groundPlane ) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $324
line 575
;575:		numplanes = 1;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 576
;576:		VectorCopy( pml.groundTrace.plane.normal, planes[0] );
ADDRLP4 4
ADDRGP4 pml+52+24
INDIRB
ASGNB 12
line 577
;577:		if ((pm->modParms.runFlags & RFL_CLIMBTECH) && !PM_GroundSlideOkay(planes[0][2]))
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $325
ADDRLP4 4+8
INDIRF4
ARGF4
ADDRLP4 1280
ADDRGP4 PM_GroundSlideOkay
CALLI4
ASGNI4
ADDRLP4 1280
INDIRI4
CNSTI4 0
NEI4 $325
line 578
;578:		{
line 579
;579:			planes[0][2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 580
;580:			VectorNormalize(planes[0]);
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 581
;581:		}
line 582
;582:	} else {
ADDRGP4 $325
JUMPV
LABELV $324
line 583
;583:		numplanes = 0;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 584
;584:	}
LABELV $325
line 586
;585:
;586:	if (pm->modParms.physics != MV_BOUNCE && pm->modParms.physics != MV_PINBALL) {
ADDRLP4 1280
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1280
INDIRI4
CNSTI4 6
EQI4 $333
ADDRLP4 1280
INDIRI4
CNSTI4 7
EQI4 $333
line 588
;587:		// never turn against original velocity
;588:		VectorNormalize2(pm->ps->velocity, planes[numplanes]);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 12
ADDRLP4 96
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 589
;589:		numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 590
;590:	}
LABELV $333
line 592
;591:
;592:	for ( bumpcount=0 ; bumpcount < numbumps ; bumpcount++ ) {
ADDRLP4 1244
CNSTI4 0
ASGNI4
ADDRGP4 $338
JUMPV
LABELV $335
line 595
;593:
;594:		// calculate position we are trying to move to
;595:		VectorMA( pm->ps->origin, time_left, pm->ps->velocity, end );
ADDRLP4 1284
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1288
ADDRLP4 1284
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1232
ADDRLP4 1288
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1288
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 1228
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1296
ADDRLP4 1284
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1232+4
ADDRLP4 1296
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1296
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 1228
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1300
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1232+8
ADDRLP4 1300
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 1300
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 1228
INDIRF4
MULF4
ADDF4
ASGNF4
line 598
;596:
;597:		// see if we can make it there
;598:		pm->trace ( &trace, pm->ps->origin, pm->mins, pm->maxs, end, pm->ps->clientNum, pm->tracemask);
ADDRLP4 148
ARGP4
ADDRLP4 1304
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1308
ADDRLP4 1304
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1308
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1304
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1304
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 1232
ARGP4
ADDRLP4 1308
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1304
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1304
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 600
;599:
;600:		if (trace.allsolid) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $341
line 602
;601:			// entity is completely trapped in another solid
;602:			pm->ps->velocity[2] = 0;	// don't build up falling damage, but allow sideways acceleration
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 603
;603:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $292
JUMPV
LABELV $341
line 606
;604:		}
;605:
;606:		if (trace.fraction > 0) {
ADDRLP4 148+8
INDIRF4
CNSTF4 0
LEF4 $343
line 608
;607:			// actually covered some distance
;608:			VectorCopy (trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 148+12
INDIRB
ASGNB 12
line 609
;609:		}
LABELV $343
line 611
;610:
;611:		if (trace.fraction == 1) {
ADDRLP4 148+8
INDIRF4
CNSTF4 1065353216
NEF4 $347
line 612
;612:			 break;		// moved the entire distance
ADDRGP4 $337
JUMPV
LABELV $347
line 616
;613:		}
;614:
;615:		// save entity for contact
;616:		PM_AddTouchEnt( trace.entityNum );
ADDRLP4 148+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 618
;617:
;618:		time_left -= time_left * trace.fraction;
ADDRLP4 1228
ADDRLP4 1228
INDIRF4
ADDRLP4 1228
INDIRF4
ADDRLP4 148+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 620
;619:
;620:		if (numplanes >= MAX_CLIP_PLANES) {
ADDRLP4 96
INDIRI4
CNSTI4 5
LTI4 $352
line 622
;621:			// this shouldn't really happen
;622:			VectorClear( pm->ps->velocity );
ADDRLP4 1316
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1320
CNSTF4 0
ASGNF4
ADDRLP4 1316
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1320
INDIRF4
ASGNF4
ADDRLP4 1316
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1320
INDIRF4
ASGNF4
ADDRLP4 1316
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1320
INDIRF4
ASGNF4
line 623
;623:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $292
JUMPV
LABELV $352
line 626
;624:		}
;625:
;626:		VectorCopy(trace.plane.normal, normal);
ADDRLP4 136
ADDRLP4 148+24
INDIRB
ASGNB 12
line 628
;627:
;628:		if ((pm->modParms.runFlags & RFL_CLIMBTECH) && !PM_GroundSlideOkay(normal[2]))
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $355
ADDRLP4 136+8
INDIRF4
ARGF4
ADDRLP4 1316
ADDRGP4 PM_GroundSlideOkay
CALLI4
ASGNI4
ADDRLP4 1316
INDIRI4
CNSTI4 0
NEI4 $355
line 629
;629:		{//wall-running
line 631
;630:			//never push up off a sloped wall
;631:			normal[2] = 0;
ADDRLP4 136+8
CNSTF4 0
ASGNF4
line 632
;632:			VectorNormalize(normal);
ADDRLP4 136
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 633
;633:		}
LABELV $355
line 640
;634:
;635:		//
;636:		// if this is the same plane we hit before, nudge velocity
;637:		// out along it, which fixes some epsilon issues with
;638:		// non-axial planes
;639:		//
;640:		if (!(pm->modParms.runFlags & RFL_CLIMBTECH) || !(pm->ps->pm_flags & PMF_STUCK_TO_WALL))
ADDRLP4 1320
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1324
CNSTI4 0
ASGNI4
ADDRLP4 1320
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 1324
INDIRI4
EQI4 $361
ADDRLP4 1320
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 1324
INDIRI4
NEI4 $359
LABELV $361
line 641
;641:		{//no sliding if stuck to wall!
line 642
;642:			for (i = 0; i < numplanes; i++) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $365
JUMPV
LABELV $362
line 643
;643:				if (DotProduct(normal, planes[i]) > 0.99f) {
ADDRLP4 1328
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 136
INDIRF4
ADDRLP4 1328
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 136+4
INDIRF4
ADDRLP4 1328
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 136+8
INDIRF4
ADDRLP4 1328
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $366
line 644
;644:					VectorAdd(normal, pm->ps->velocity, pm->ps->velocity);
ADDRLP4 1332
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1332
INDIRP4
ADDRLP4 136
INDIRF4
ADDRLP4 1332
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1336
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1336
INDIRP4
ADDRLP4 136+4
INDIRF4
ADDRLP4 1336
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1340
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 1340
INDIRP4
ADDRLP4 136+8
INDIRF4
ADDRLP4 1340
INDIRP4
INDIRF4
ADDF4
ASGNF4
line 645
;645:					break;
ADDRGP4 $364
JUMPV
LABELV $366
line 647
;646:				}
;647:			}
LABELV $363
line 642
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $365
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $362
LABELV $364
line 648
;648:			if (i < numplanes) {
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
GEI4 $374
line 649
;649:				continue;
ADDRGP4 $336
JUMPV
LABELV $374
line 651
;650:			}
;651:		}
LABELV $359
line 652
;652:		VectorCopy (normal, planes[numplanes]);
CNSTI4 12
ADDRLP4 96
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ADDRLP4 136
INDIRB
ASGNB 12
line 653
;653:		numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 660
;654:
;655:		//
;656:		// modify velocity so it parallels all of the clip planes
;657:		//
;658:
;659:		// find a plane that it enters
;660:		for ( i = 0 ; i < numplanes ; i++ ) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $379
JUMPV
LABELV $376
line 661
;661:			into = DotProduct( pm->ps->velocity, planes[i] );
ADDRLP4 1328
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1332
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 132
ADDRLP4 1328
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 1332
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 1328
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 1332
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 1328
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 1332
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 662
;662:			if ( into >= 0.1 ) {
ADDRLP4 132
INDIRF4
CNSTF4 1036831949
LTF4 $382
line 663
;663:				continue;		// move doesn't interact with the plane
ADDRGP4 $377
JUMPV
LABELV $382
line 667
;664:			}
;665:
;666:			// see how hard we are hitting things
;667:			if ( -into > pml.impactSpeed ) {
ADDRLP4 132
INDIRF4
NEGF4
ADDRGP4 pml+1132
INDIRF4
LEF4 $384
line 668
;668:				pml.impactSpeed = -into;
ADDRGP4 pml+1132
ADDRLP4 132
INDIRF4
NEGF4
ASGNF4
line 669
;669:			}
LABELV $384
line 672
;670:
;671:			// slide along the plane
;672:			PM_ClipVelocity (pm->ps->velocity, planes[i], clipVelocity, overbounce);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 128
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 675
;673:
;674:			// slide along the plane
;675:			PM_ClipVelocity (endVelocity, planes[i], endClipVelocity, overbounce);
ADDRLP4 116
ARGP4
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 128
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 676
;676:			pml.groundBounces = pml.groundBounces || planes[i][2] >= MIN_WALK_NORMAL;
ADDRGP4 pml+1184
INDIRI4
CNSTI4 0
NEI4 $394
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
CNSTF4 1060320051
LTF4 $392
LABELV $394
ADDRLP4 1336
CNSTI4 1
ASGNI4
ADDRGP4 $393
JUMPV
LABELV $392
ADDRLP4 1336
CNSTI4 0
ASGNI4
LABELV $393
ADDRGP4 pml+1184
ADDRLP4 1336
INDIRI4
ASGNI4
line 678
;677:
;678:			if (planes[i][2] >= MIN_WALK_NORMAL) {
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
CNSTF4 1060320051
LTF4 $395
line 679
;679:				pml.clippedWalkable = qtrue; // uh am i putting this the right place? idk
ADDRGP4 pml+1180
CNSTI4 1
ASGNI4
line 680
;680:			}
LABELV $395
line 683
;681:
;682:			// see if there is a second plane that the new move enters
;683:			for ( j = 0 ; j < numplanes ; j++ ) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $402
JUMPV
LABELV $399
line 684
;684:				if ( j == i ) {
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $403
line 685
;685:					continue;
ADDRGP4 $400
JUMPV
LABELV $403
line 687
;686:				}
;687:				if ( DotProduct( clipVelocity, planes[j] ) >= 0.1f ) {
ADDRLP4 1340
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 1340
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 1340
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 1340
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $405
line 688
;688:					continue;		// move doesn't interact with the plane
ADDRGP4 $400
JUMPV
LABELV $405
line 692
;689:				}
;690:
;691:				// try clipping the move to the plane
;692:				PM_ClipVelocity( clipVelocity, planes[j], clipVelocity, overbounce);
ADDRLP4 64
ARGP4
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 128
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 693
;693:				PM_ClipVelocity( endClipVelocity, planes[j], endClipVelocity, overbounce);
ADDRLP4 104
ARGP4
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 128
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 694
;694:				pml.groundBounces = pml.groundBounces || planes[j][2] >= MIN_WALK_NORMAL; 
ADDRGP4 pml+1184
INDIRI4
CNSTI4 0
NEI4 $417
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
CNSTF4 1060320051
LTF4 $415
LABELV $417
ADDRLP4 1344
CNSTI4 1
ASGNI4
ADDRGP4 $416
JUMPV
LABELV $415
ADDRLP4 1344
CNSTI4 0
ASGNI4
LABELV $416
ADDRGP4 pml+1184
ADDRLP4 1344
INDIRI4
ASGNI4
line 695
;695:				if (planes[j][2] >= MIN_WALK_NORMAL) {
CNSTI4 12
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
CNSTF4 1060320051
LTF4 $418
line 696
;696:					pml.clippedWalkable = qtrue; // uh am i putting this the right place? idk
ADDRGP4 pml+1180
CNSTI4 1
ASGNI4
line 697
;697:				}
LABELV $418
line 702
;698:
;699:				// TODO MAYBE jaPRO player collision physics fix?
;700:
;701:				// see if it goes back into the first clip plane
;702:				if ( DotProduct( clipVelocity, planes[i] ) >= 0 ) {
ADDRLP4 1348
CNSTI4 12
ADDRLP4 80
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 1348
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 1348
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 1348
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
LTF4 $422
line 703
;703:					continue;
ADDRGP4 $400
JUMPV
LABELV $422
line 707
;704:				}
;705:
;706:				// slide the original velocity along the crease
;707:				CrossProduct (planes[i], planes[j], dir);
ADDRLP4 1352
CNSTI4 12
ASGNI4
ADDRLP4 1352
INDIRI4
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 1352
INDIRI4
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 708
;708:				VectorNormalize( dir );
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 709
;709:				d = DotProduct( dir, pm->ps->velocity );
ADDRLP4 1356
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 1356
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 1356
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 1356
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 710
;710:				VectorScale( dir, d, clipVelocity );
ADDRLP4 64
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 712
;711:
;712:				CrossProduct (planes[i], planes[j], dir);
ADDRLP4 1364
CNSTI4 12
ASGNI4
ADDRLP4 1364
INDIRI4
ADDRLP4 80
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 1364
INDIRI4
ADDRLP4 76
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 713
;713:				VectorNormalize( dir );
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 714
;714:				d = DotProduct( dir, endVelocity );
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 116+4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 116+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 715
;715:				VectorScale( dir, d, endClipVelocity );
ADDRLP4 104
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 718
;716:
;717:				// see if there is a third plane the the new move enters
;718:				for ( k = 0 ; k < numplanes ; k++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $445
JUMPV
LABELV $442
line 719
;719:					if ( k == i || k == j ) {
ADDRLP4 0
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $448
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $446
LABELV $448
line 720
;720:						continue;
ADDRGP4 $443
JUMPV
LABELV $446
line 722
;721:					}
;722:					if ( DotProduct( clipVelocity, planes[k] ) >= 0.1f ) {
ADDRLP4 1376
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRF4
ADDRLP4 1376
INDIRI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 1376
INDIRI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 1376
INDIRI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $449
line 723
;723:						continue;		// move doesn't interact with the plane
ADDRGP4 $443
JUMPV
LABELV $449
line 727
;724:					}
;725:
;726:					// stop dead at a tripple plane interaction
;727:					VectorClear( pm->ps->velocity ); // TODO can we make this nicer? is this why we can get stuck in sloped walls stuff?
ADDRLP4 1380
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1384
CNSTF4 0
ASGNF4
ADDRLP4 1380
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1384
INDIRF4
ASGNF4
ADDRLP4 1380
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1384
INDIRF4
ASGNF4
ADDRLP4 1380
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1384
INDIRF4
ASGNF4
line 728
;728:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $292
JUMPV
LABELV $443
line 718
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $445
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $442
line 730
;729:				}
;730:			}
LABELV $400
line 683
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $402
ADDRLP4 76
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $399
line 733
;731:
;732:			// if we have fixed all interactions, try another move
;733:			VectorCopy( clipVelocity, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 64
INDIRB
ASGNB 12
line 734
;734:			VectorCopy( endClipVelocity, endVelocity );
ADDRLP4 116
ADDRLP4 104
INDIRB
ASGNB 12
line 735
;735:			break;
ADDRGP4 $378
JUMPV
LABELV $377
line 660
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $379
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $376
LABELV $378
line 737
;736:		}
;737:	}
LABELV $336
line 592
ADDRLP4 1244
ADDRLP4 1244
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $338
ADDRLP4 1244
INDIRI4
ADDRLP4 1248
INDIRI4
LTI4 $335
LABELV $337
line 739
;738:
;739:	if ( gravity ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $455
line 740
;740:		VectorCopy( endVelocity, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 116
INDIRB
ASGNB 12
line 741
;741:	}
LABELV $455
line 744
;742:
;743:	// don't change velocity if in a timer (FIXME: is this correct?)
;744:	if ( pm->ps->pm_time ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $457
line 745
;745:		VectorCopy( primal_velocity, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1252
INDIRB
ASGNB 12
line 746
;746:	}
LABELV $457
line 748
;747:
;748:	return ( bumpcount != 0 );
ADDRLP4 1244
INDIRI4
CNSTI4 0
EQI4 $460
ADDRLP4 1284
CNSTI4 1
ASGNI4
ADDRGP4 $461
JUMPV
LABELV $460
ADDRLP4 1284
CNSTI4 0
ASGNI4
LABELV $461
ADDRLP4 1284
INDIRI4
RETI4
LABELV $292
endproc PM_SlideMove 1388 28
export PM_PredictDeadRamp
proc PM_PredictDeadRamp 1168 28
line 763
;749:}
;750:
;751:// A dumbed down version of PM_SlideMove
;752:// We only check if we freely get where we need to get and then do a check for ground under us.
;753:// The apparent cause of the bug in a nutshell:
;754:// We can freely (no clip/objects/floor in the way) travel/fall to the place where we will logically be in pml.frameTime time.
;755:// This means no ramp boost through PM_ClipVelocity happens.
;756:// Let's say we are falling straight down at effective velocity[2] == -1000 and 142 fps (pml.frametime == 0.007 which is 7msec).
;757:// That puts us traveling down at about 7 units per frame. 
;758:// If the ground is less than 7 units away from us, we will catch it in the initial PM_StepSlideMove and it will be clipped (ramp boost).
;759:// If the ground is 8 units away from us, we will catch it the same way in the next frame.
;760:// HOWEVER, if the ground is more than 7 and less than 7.25 units away from us, we will first fall the 7 units, and then the following ground check (which checks 0.25 units under new position)
;761:// will determine that we are standing on ground without giving ramp boost. Which is also the place where Loda's old ramp boost fix is applied in case the ramp boost didn't happen which he checked via
;762:// pml.clipped
;763:qboolean PM_PredictDeadRamp(qboolean gravity) {
line 771
;764:	trace_t	trace;
;765:	vec3_t		end;
;766:	vec3_t		testVelocity;
;767:	vec3_t		point;
;768:	vec3_t		newPos;
;769:	int			i, j, k;
;770:
;771:	if (pm->ps->groundEntityNum != ENTITYNUM_NONE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $463
line 772
;772:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $462
JUMPV
LABELV $463
line 775
;773:	}
;774:
;775:	VectorCopy(pm->ps->velocity, testVelocity);
ADDRLP4 1116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 776
;776:	if (gravity) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $465
line 777
;777:		testVelocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 1116+8
ADDRLP4 1116+8
INDIRF4
ADDRGP4 pm
INDIRP4
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
line 778
;778:		testVelocity[2] = (pm->ps->velocity[2] + testVelocity[2]) * 0.5;
ADDRLP4 1116+8
CNSTF4 1056964608
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 1116+8
INDIRF4
ADDF4
MULF4
ASGNF4
line 779
;779:	}
LABELV $465
line 782
;780:
;781:	// calculate position we are trying to move to
;782:	VectorMA(pm->ps->origin, pml.frametime, testVelocity, end);
ADDRLP4 1140
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1128
ADDRLP4 1140
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1116
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1128+4
ADDRLP4 1140
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1116+4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1128+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 1116+8
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 785
;783:
;784:	// see if we can make it there
;785:	pm->trace(&trace, pm->ps->origin, pm->mins, pm->maxs, end, pm->ps->clientNum, pm->tracemask);
ADDRLP4 28
ARGP4
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
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1144
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1144
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1148
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1144
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1144
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 788
;786:
;787:
;788:	if (trace.fraction == 1) {
ADDRLP4 28+8
INDIRF4
CNSTF4 1065353216
NEF4 $478
line 789
;789:		VectorCopy(trace.endpos, newPos);
ADDRLP4 16
ADDRLP4 28+12
INDIRB
ASGNB 12
line 791
;790:
;791:		point[0] = newPos[0];
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 792
;792:		point[1] = newPos[1];
ADDRLP4 0+4
ADDRLP4 16+4
INDIRF4
ASGNF4
line 793
;793:		point[2] = newPos[2] - 0.25;
ADDRLP4 0+8
ADDRLP4 16+8
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 795
;794:
;795:		pm->trace(&trace, newPos, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 28
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1152
ADDRGP4 pm
INDIRP4
ASGNP4
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
ADDRLP4 0
ARGP4
ADDRLP4 1152
INDIRP4
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
line 798
;796:
;797:		// do something corrective if the trace starts in a solid...
;798:		if (trace.allsolid) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $486
line 800
;799:			// jitter around
;800:			for (i = -1; i <= 1; i++) {
ADDRLP4 1112
CNSTI4 -1
ASGNI4
LABELV $488
line 801
;801:				for (j = -1; j <= 1; j++) {
ADDRLP4 1108
CNSTI4 -1
ASGNI4
LABELV $492
line 802
;802:					for (k = -1; k <= 1; k++) {
ADDRLP4 12
CNSTI4 -1
ASGNI4
LABELV $496
line 803
;803:						VectorCopy(newPos, point);
ADDRLP4 0
ADDRLP4 16
INDIRB
ASGNB 12
line 804
;804:						point[0] += (float)i;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 1112
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 805
;805:						point[1] += (float)j;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1108
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 806
;806:						point[2] += (float)k;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 807
;807:						pm->trace(&trace, point, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 28
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1156
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1156
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1156
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1156
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1156
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 808
;808:						if (!trace.allsolid) {
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $502
line 809
;809:							point[0] = newPos[0];
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 810
;810:							point[1] = newPos[1];
ADDRLP4 0+4
ADDRLP4 16+4
INDIRF4
ASGNF4
line 811
;811:							point[2] = newPos[2] - 0.25;
ADDRLP4 0+8
ADDRLP4 16+8
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 813
;812:
;813:							pm->trace(&trace, newPos, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 28
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1160
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1160
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1160
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1160
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1160
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 814
;814:							i = j = k = 2; // Stupid way to end the loop lol.
ADDRLP4 1164
CNSTI4 2
ASGNI4
ADDRLP4 12
ADDRLP4 1164
INDIRI4
ASGNI4
ADDRLP4 1108
ADDRLP4 1164
INDIRI4
ASGNI4
ADDRLP4 1112
ADDRLP4 1164
INDIRI4
ASGNI4
line 815
;815:						}
LABELV $502
line 816
;816:					}
LABELV $497
line 802
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LEI4 $496
line 817
;817:				}
LABELV $493
line 801
ADDRLP4 1108
ADDRLP4 1108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 1
LEI4 $492
line 818
;818:			}
LABELV $489
line 800
ADDRLP4 1112
ADDRLP4 1112
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 1
LEI4 $488
line 819
;819:		}
LABELV $486
line 821
;820:
;821:		if (trace.fraction != 1.0 && (trace.plane.normal[0] != 0.0f || trace.plane.normal[1] != 0.0f || trace.plane.normal[2] != 1.0f)) {
ADDRLP4 28+8
INDIRF4
CNSTF4 1065353216
EQF4 $508
ADDRLP4 1156
CNSTF4 0
ASGNF4
ADDRLP4 28+24
INDIRF4
ADDRLP4 1156
INDIRF4
NEF4 $517
ADDRLP4 28+24+4
INDIRF4
ADDRLP4 1156
INDIRF4
NEF4 $517
ADDRLP4 28+24+8
INDIRF4
CNSTF4 1065353216
EQF4 $508
LABELV $517
line 822
;822:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $462
JUMPV
LABELV $508
line 824
;823:		}
;824:	}
LABELV $478
line 825
;825:	return qfalse;
CNSTI4 0
RETI4
LABELV $462
endproc PM_PredictDeadRamp 1168 28
export PM_StepSlideMove
proc PM_StepSlideMove 1244 28
line 834
;826:}
;827:
;828:/*
;829:==================
;830:PM_StepSlideMove
;831:
;832:==================
;833:*/
;834:void PM_StepSlideMove( qboolean gravity ) {
line 847
;835:	vec3_t		start_o, start_v;
;836:	// vec3_t		down_o, down_v;
;837:	trace_t		trace;
;838://	float		down_dist, up_dist;
;839://	vec3_t		delta, delta2;
;840:	vec3_t		up, down;
;841:	vec3_t		nvel, prevel;
;842:	float		stepSize;
;843:	float		totalVel;
;844:	float		pre_z;
;845:	int			usingspeed;
;846:	int			i;
;847:	float		overbounce = MovementOverbounceFactor(pm->modParms.physics, pm->ps, &pm->cmd);
ADDRLP4 1180
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 1180
INDIRP4
INDIRP4
ARGP4
ADDRLP4 1180
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 1184
ADDRGP4 MovementOverbounceFactor
CALLF4
ASGNF4
ADDRLP4 1176
ADDRLP4 1184
INDIRF4
ASGNF4
line 848
;848:	int			NEW_STEPSIZE = STEPSIZE;
ADDRLP4 1140
CNSTI4 18
ASGNI4
line 850
;849:
;850:	if (MovementStyleHasQuake2Ramps(pm->modParms.physics)) {
ADDRGP4 pm
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 1188
ADDRGP4 MovementStyleHasQuake2Ramps
CALLI4
ASGNI4
ADDRLP4 1188
INDIRI4
CNSTI4 0
EQI4 $519
line 851
;851:		PM_Q2StepSlideMove(gravity);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_Q2StepSlideMove
CALLV
pop
line 852
;852:		return;
ADDRGP4 $518
JUMPV
line 853
;853:		if (pm->ps->velocity[2] > 0 && pm->cmd.upmove > 0) { // do we really need this?
ADDRLP4 1192
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1192
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $521
ADDRLP4 1192
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $521
line 854
;854:			int jumpHeight = pm->ps->origin[2] - pm->ps->fd.forceJumpZStart;
ADDRLP4 1200
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1196
ADDRLP4 1200
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 1200
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 856
;855:
;856:			if (jumpHeight > 48)
ADDRLP4 1196
INDIRI4
CNSTI4 48
LEI4 $523
line 857
;857:				jumpHeight = 48;
ADDRLP4 1196
CNSTI4 48
ASGNI4
ADDRGP4 $524
JUMPV
LABELV $523
line 858
;858:			else if (jumpHeight < 22)
ADDRLP4 1196
INDIRI4
CNSTI4 22
GEI4 $525
line 859
;859:				jumpHeight = 22;
ADDRLP4 1196
CNSTI4 22
ASGNI4
LABELV $525
LABELV $524
line 861
;860:
;861:			NEW_STEPSIZE = 48 - jumpHeight + 22;
ADDRLP4 1140
CNSTI4 48
ADDRLP4 1196
INDIRI4
SUBI4
CNSTI4 22
ADDI4
ASGNI4
line 871
;862:
;863:			//trap->SendServerCommand(-1, va("print \"new stepsize: %i, expected max end height: %i\n\"", NEW_STEPSIZE, NEW_STEPSIZE + (int)(pm->ps->origin[2] - pm->ps->fd.forceJumpZStart)));
;864:
;865:			//This means that we can always clip things up to 48 units tall, if we are moving up when we hit it and from a bhop..
;866:			//It means we can sometimes clip things up to 70 units tall, if we hit it in right part of jump
;867:			//Should it be higher..? some of the things in q3 are 56 units tall..
;868:
;869:			//NEW_STEPSIZE = 46;
;870:			//Make stepsize equal to.. our current 48 - our current jumpheight ?
;871:		}
ADDRGP4 $522
JUMPV
LABELV $521
line 873
;872:		else
;873:			NEW_STEPSIZE = 22;
ADDRLP4 1140
CNSTI4 22
ASGNI4
LABELV $522
line 874
;874:	}
LABELV $519
line 876
;875:
;876:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 878
;877:
;878:	usingspeed = 0;
ADDRLP4 1136
CNSTI4 0
ASGNI4
line 880
;879:
;880:	VectorCopy (pm->ps->origin, start_o);
ADDRLP4 1108
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 881
;881:	VectorCopy (pm->ps->velocity, start_v);
ADDRLP4 1156
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 883
;882:
;883:	if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $527
line 884
;884:		if (PM_PredictDeadRamp(gravity)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1192
ADDRGP4 PM_PredictDeadRamp
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 0
EQI4 $529
line 885
;885:			Com_Printf("%i:predicting dead ramp\n", c_pmove);
ADDRGP4 $531
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 886
;886:		}
LABELV $529
line 887
;887:	}
LABELV $527
line 889
;888:	
;889:	if (BG_InReboundHold(pm->ps->legsAnim))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 1192
ADDRGP4 BG_InReboundHold
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 0
EQI4 $532
line 890
;890:	{
line 891
;891:		gravity = qfalse;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 892
;892:	}
LABELV $532
line 894
;893:
;894:	if ( PM_SlideMove( gravity ) == 0 ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1196
ADDRGP4 PM_SlideMove
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
NEI4 $534
line 895
;895:		return;		// we got exactly where we wanted to go first try	
ADDRGP4 $518
JUMPV
LABELV $534
line 898
;896:	}
;897:
;898:	if (pm->ps->fd.forcePowersActive & (1 << FP_SPEED))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $536
line 899
;899:	{
line 900
;900:		usingspeed = 1;
ADDRLP4 1136
CNSTI4 1
ASGNI4
line 901
;901:	}
LABELV $536
line 903
;902:
;903:	VectorCopy(start_o, down);
ADDRLP4 1120
ADDRLP4 1108
INDIRB
ASGNB 12
line 904
;904:	down[2] -= NEW_STEPSIZE;
ADDRLP4 1120+8
ADDRLP4 1120+8
INDIRF4
ADDRLP4 1140
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 905
;905:	pm->trace (&trace, start_o, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 4
ARGP4
ADDRLP4 1108
ARGP4
ADDRLP4 1200
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1200
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 1120
ARGP4
ADDRLP4 1200
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1200
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1200
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 906
;906:	VectorSet(up, 0, 0, 1);
ADDRLP4 1204
CNSTF4 0
ASGNF4
ADDRLP4 1096
ADDRLP4 1204
INDIRF4
ASGNF4
ADDRLP4 1096+4
ADDRLP4 1204
INDIRF4
ASGNF4
ADDRLP4 1096+8
CNSTF4 1065353216
ASGNF4
line 908
;907:	// never step up when you still have up velocity
;908:	if ( pm->ps->velocity[2] > 0 && (trace.fraction == 1.0 ||
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $541
ADDRLP4 4+8
INDIRF4
CNSTF4 1065353216
EQF4 $551
ADDRLP4 4+24
INDIRF4
ADDRLP4 1096
INDIRF4
MULF4
ADDRLP4 4+24+4
INDIRF4
ADDRLP4 1096+4
INDIRF4
MULF4
ADDF4
ADDRLP4 4+24+8
INDIRF4
ADDRLP4 1096+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
GEF4 $541
LABELV $551
line 909
;909:										DotProduct(trace.plane.normal, up) < 0.7f)) {
line 911
;910:
;911:		if (!usingspeed)
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $552
line 912
;912:		{
line 913
;913:			return;
ADDRGP4 $518
JUMPV
LABELV $552
line 915
;914:		}
;915:	}
LABELV $541
line 920
;916:
;917:	// VectorCopy (pm->ps->origin, down_o);
;918:	// VectorCopy (pm->ps->velocity, down_v);
;919:
;920:	VectorCopy (start_o, up);
ADDRLP4 1096
ADDRLP4 1108
INDIRB
ASGNB 12
line 921
;921:	up[2] += NEW_STEPSIZE;
ADDRLP4 1096+8
ADDRLP4 1096+8
INDIRF4
ADDRLP4 1140
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 924
;922:
;923:	// test the player position if they were a stepheight higher
;924:	pm->trace (&trace, start_o, pm->mins, pm->maxs, up, pm->ps->clientNum, pm->tracemask);
ADDRLP4 4
ARGP4
ADDRLP4 1108
ARGP4
ADDRLP4 1208
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1208
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 1096
ARGP4
ADDRLP4 1208
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1208
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1208
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 925
;925:	if ( trace.allsolid ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $555
line 926
;926:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $557
line 927
;927:			Com_Printf("%i:bend can't step\n", c_pmove);
ADDRGP4 $559
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 928
;928:		}
LABELV $557
line 929
;929:		if (!usingspeed)
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $560
line 930
;930:		{
line 931
;931:			return;		// can't step up
ADDRGP4 $518
JUMPV
LABELV $560
line 933
;932:		}
;933:	}
LABELV $555
line 935
;934:
;935:	pml.clippedPre = qtrue;
ADDRGP4 pml+1172
CNSTI4 1
ASGNI4
line 937
;936:
;937:	stepSize = trace.endpos[2] - start_o[2];
ADDRLP4 1168
ADDRLP4 4+12+8
INDIRF4
ADDRLP4 1108+8
INDIRF4
SUBF4
ASGNF4
line 939
;938:	// try slidemove from this position
;939:	VectorCopy (trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 4+12
INDIRB
ASGNB 12
line 940
;940:	VectorCopy (start_v, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1156
INDIRB
ASGNB 12
line 942
;941:
;942:	VectorCopy(pm->ps->velocity, prevel);
ADDRLP4 1084
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 944
;943:
;944:	pre_z = prevel[2];
ADDRLP4 1132
ADDRLP4 1084+8
INDIRF4
ASGNF4
line 946
;945:
;946:	PM_SlideMove( gravity );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 948
;947:
;948:	if (pml.clippedWalkable) { 
ADDRGP4 pml+1180
INDIRI4
CNSTI4 0
EQI4 $568
line 951
;949:		// only mark as clipped if it was a walkable surface, thats the only thing that matters for dead ramps
;950:		// otherwise we might slide down a steep slope and still get a dead ramp because its "clipped" from the slope.
;951:		pml.clipped = qtrue;
ADDRGP4 pml+1176
CNSTI4 1
ASGNI4
line 952
;952:	}
LABELV $568
line 954
;953:
;954:	VectorSubtract(pm->ps->velocity, prevel, prevel);
ADDRLP4 1212
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1212
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 1084
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1084+4
ADDRLP4 1212
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 1084+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1084+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 1084+8
INDIRF4
SUBF4
ASGNF4
line 955
;955:	if (prevel[0] < 0)
ADDRLP4 1084
INDIRF4
CNSTF4 0
GEF4 $576
line 956
;956:	{
line 957
;957:		prevel[0] = -prevel[0];
ADDRLP4 1084
ADDRLP4 1084
INDIRF4
NEGF4
ASGNF4
line 958
;958:	}
LABELV $576
line 959
;959:	if (prevel[1] < 0)
ADDRLP4 1084+4
INDIRF4
CNSTF4 0
GEF4 $578
line 960
;960:	{
line 961
;961:		prevel[1] = -prevel[1];
ADDRLP4 1084+4
ADDRLP4 1084+4
INDIRF4
NEGF4
ASGNF4
line 962
;962:	}
LABELV $578
line 964
;963:
;964:	totalVel = prevel[0]+prevel[1];
ADDRLP4 1172
ADDRLP4 1084
INDIRF4
ADDRLP4 1084+4
INDIRF4
ADDF4
ASGNF4
line 966
;965:
;966:	if (pre_z > 480 && (pre_z - pm->ps->velocity[2]) >= 480 && pm->ps->fd.forceJumpZStart)
ADDRLP4 1220
CNSTF4 1139802112
ASGNF4
ADDRLP4 1132
INDIRF4
ADDRLP4 1220
INDIRF4
LEF4 $584
ADDRLP4 1224
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRF4
ADDRLP4 1224
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
SUBF4
ADDRLP4 1220
INDIRF4
LTF4 $584
ADDRLP4 1224
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CNSTF4 0
EQF4 $584
line 967
;967:	{ //smashed head on the ceiling during a force jump
line 968
;968:		pm->ps->fd.forceSpeedDoDamage = (pre_z - pm->ps->velocity[2])*0.04;
ADDRLP4 1228
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1228
INDIRP4
CNSTI4 1140
ADDP4
CNSTF4 1025758986
ADDRLP4 1132
INDIRF4
ADDRLP4 1228
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
SUBF4
MULF4
ASGNF4
line 969
;969:		if (pm->numtouch)
ADDRGP4 pm
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 0
EQI4 $586
line 970
;970:		{ //do damage to the other player if we hit one
ADDRGP4 $589
JUMPV
LABELV $588
line 972
;971:			while (i < pm->numtouch)
;972:			{
line 973
;973:				if (pm->touchents[i] < MAX_CLIENTS && pm->touchents[i] != pm->ps->clientNum)
ADDRLP4 1232
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1236
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1232
INDIRP4
CNSTI4 88
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 32
GEI4 $591
ADDRLP4 1236
INDIRI4
ADDRLP4 1232
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
EQI4 $591
line 974
;974:				{
line 975
;975:					pm->ps->fd.forceSpeedHitIndex = pm->touchents[i];
ADDRLP4 1240
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1240
INDIRP4
INDIRP4
CNSTI4 1144
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1240
INDIRP4
CNSTI4 88
ADDP4
ADDP4
INDIRI4
ASGNI4
line 976
;976:					break;
ADDRGP4 $590
JUMPV
LABELV $591
line 979
;977:				}
;978:
;979:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 980
;980:			}
LABELV $589
line 971
ADDRLP4 0
INDIRI4
ADDRGP4 pm
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
LTI4 $588
LABELV $590
line 981
;981:		}
LABELV $586
line 983
;982:
;983:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 984
;984:	}
LABELV $584
line 986
;985:
;986:	if (usingspeed)
ADDRLP4 1136
INDIRI4
CNSTI4 0
EQI4 $593
line 987
;987:	{
line 988
;988:		if (pm->ps->fd.forceSpeedSmash > 1.3 && totalVel > 500)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1136
ADDP4
INDIRF4
CNSTF4 1067869798
LEF4 $595
ADDRLP4 1172
INDIRF4
CNSTF4 1140457472
LEF4 $595
line 989
;989:		{ //if we were going fast enough and hadn't hit a while in a while then smash into it hard
line 992
;990:		  //the difference between our velocity pre and post colide must also be greater than 600 to do damage
;991:			//Com_Printf("SMASH %f\n", pm->ps->fd.forceSpeedSmash);
;992:			VectorCopy(start_v, nvel); //then bounce the player back a bit in the opposite of the direction he was going
ADDRLP4 1144
ADDRLP4 1156
INDIRB
ASGNB 12
line 993
;993:			nvel[0] += start_o[0];
ADDRLP4 1144
ADDRLP4 1144
INDIRF4
ADDRLP4 1108
INDIRF4
ADDF4
ASGNF4
line 994
;994:			nvel[1] += start_o[1];
ADDRLP4 1144+4
ADDRLP4 1144+4
INDIRF4
ADDRLP4 1108+4
INDIRF4
ADDF4
ASGNF4
line 995
;995:			nvel[2] += start_o[2];
ADDRLP4 1144+8
ADDRLP4 1144+8
INDIRF4
ADDRLP4 1108+8
INDIRF4
ADDF4
ASGNF4
line 996
;996:			VectorSubtract(start_o, nvel, nvel);
ADDRLP4 1144
ADDRLP4 1108
INDIRF4
ADDRLP4 1144
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1144+4
ADDRLP4 1108+4
INDIRF4
ADDRLP4 1144+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1144+8
ADDRLP4 1108+8
INDIRF4
ADDRLP4 1144+8
INDIRF4
SUBF4
ASGNF4
line 997
;997:			pm->ps->velocity[0] = nvel[0]*0.1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1036831949
ADDRLP4 1144
INDIRF4
MULF4
ASGNF4
line 998
;998:			pm->ps->velocity[1] = nvel[1]*0.1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1036831949
ADDRLP4 1144+4
INDIRF4
MULF4
ASGNF4
line 999
;999:			pm->ps->velocity[2] = 64;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1115684864
ASGNF4
line 1000
;1000:			pm->ps->fd.forceSpeedDoDamage = pm->ps->fd.forceSpeedSmash*10; //do somewhere in the range of 15-25 damage, depending on speed
ADDRLP4 1228
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1228
INDIRP4
CNSTI4 1140
ADDP4
CNSTF4 1092616192
ADDRLP4 1228
INDIRP4
CNSTI4 1136
ADDP4
INDIRF4
MULF4
ASGNF4
line 1001
;1001:			pm->ps->fd.forceSpeedSmash = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1136
ADDP4
CNSTF4 0
ASGNF4
line 1003
;1002:
;1003:			if (pm->numtouch)
ADDRGP4 pm
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 0
EQI4 $518
line 1004
;1004:			{
ADDRGP4 $611
JUMPV
LABELV $610
line 1006
;1005:				while (i < pm->numtouch)
;1006:				{
line 1007
;1007:					if (pm->touchents[i] < MAX_CLIENTS && pm->touchents[i] != pm->ps->clientNum)
ADDRLP4 1232
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1236
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1232
INDIRP4
CNSTI4 88
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 32
GEI4 $613
ADDRLP4 1236
INDIRI4
ADDRLP4 1232
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
EQI4 $613
line 1008
;1008:					{
line 1009
;1009:						pm->ps->fd.forceSpeedHitIndex = pm->touchents[i];
ADDRLP4 1240
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1240
INDIRP4
INDIRP4
CNSTI4 1144
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1240
INDIRP4
CNSTI4 88
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1010
;1010:						break;
ADDRGP4 $518
JUMPV
LABELV $613
line 1013
;1011:					}
;1012:
;1013:					i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1014
;1014:				}
LABELV $611
line 1005
ADDRLP4 0
INDIRI4
ADDRGP4 pm
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
LTI4 $610
line 1015
;1015:			}
line 1016
;1016:			return;
ADDRGP4 $518
JUMPV
LABELV $595
line 1019
;1017:		}
;1018:
;1019:		pm->ps->fd.forceSpeedSmash -= 0.1f;
ADDRLP4 1228
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1136
ADDP4
ASGNP4
ADDRLP4 1228
INDIRP4
ADDRLP4 1228
INDIRP4
INDIRF4
CNSTF4 1036831949
SUBF4
ASGNF4
line 1022
;1020:		//we hit a wall so decrease speed
;1021:
;1022:		if (pm->ps->fd.forceSpeedSmash < 1)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1136
ADDP4
INDIRF4
CNSTF4 1065353216
GEF4 $615
line 1023
;1023:		{
line 1024
;1024:			pm->ps->fd.forceSpeedSmash = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1136
ADDP4
CNSTF4 1065353216
ASGNF4
line 1025
;1025:		}
LABELV $615
line 1026
;1026:	}
LABELV $593
line 1029
;1027:
;1028:	// push down the final amount
;1029:	VectorCopy (pm->ps->origin, down);
ADDRLP4 1120
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1030
;1030:	down[2] -= stepSize;
ADDRLP4 1120+8
ADDRLP4 1120+8
INDIRF4
ADDRLP4 1168
INDIRF4
SUBF4
ASGNF4
line 1031
;1031:	pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 4
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
ADDRLP4 1228
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1228
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 1120
ARGP4
ADDRLP4 1232
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1228
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ARGI4
ADDRLP4 1228
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 1032
;1032:	if ( !trace.allsolid ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $618
line 1033
;1033:		VectorCopy (trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 4+12
INDIRB
ASGNB 12
line 1034
;1034:	}
LABELV $618
line 1035
;1035:	if ( trace.fraction < 1.0 ) {
ADDRLP4 4+8
INDIRF4
CNSTF4 1065353216
GEF4 $621
line 1036
;1036:		PM_ClipVelocity( pm->ps->velocity, trace.plane.normal, pm->ps->velocity, overbounce);
ADDRLP4 1236
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRLP4 4+24
ARGP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRLP4 1176
INDIRF4
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 1037
;1037:		pml.groundBounces = pml.groundBounces || trace.plane.normal[2] >= MIN_WALK_NORMAL;
ADDRGP4 pml+1184
INDIRI4
CNSTI4 0
NEI4 $632
ADDRLP4 4+24+8
INDIRF4
CNSTF4 1060320051
LTF4 $630
LABELV $632
ADDRLP4 1240
CNSTI4 1
ASGNI4
ADDRGP4 $631
JUMPV
LABELV $630
ADDRLP4 1240
CNSTI4 0
ASGNI4
LABELV $631
ADDRGP4 pml+1184
ADDRLP4 1240
INDIRI4
ASGNI4
line 1038
;1038:		if (trace.plane.normal[2] >= MIN_WALK_NORMAL) {
ADDRLP4 4+24+8
INDIRF4
CNSTF4 1060320051
LTF4 $633
line 1039
;1039:			pml.clippedWalkable = qtrue; // uh am i putting this the right place? idk
ADDRGP4 pml+1180
CNSTI4 1
ASGNI4
line 1040
;1040:		}
LABELV $633
line 1041
;1041:	}
LABELV $621
line 1055
;1042:
;1043:#if 0
;1044:	// if the down trace can trace back to the original position directly, don't step
;1045:	pm->trace( &trace, pm->ps->origin, pm->mins, pm->maxs, start_o, pm->ps->clientNum, pm->tracemask);
;1046:	if ( trace.fraction == 1.0 ) {
;1047:		// use the original move
;1048:		VectorCopy (down_o, pm->ps->origin);
;1049:		VectorCopy (down_v, pm->ps->velocity);
;1050:		if ( pm->debugLevel ) {
;1051:			Com_Printf("%i:bend\n", c_pmove);
;1052:		}
;1053:	} else 
;1054:#endif
;1055:	{
line 1059
;1056:		// use the step move
;1057:		float	delta;
;1058:
;1059:		delta = pm->ps->origin[2] - start_o[2];
ADDRLP4 1236
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 1108+8
INDIRF4
SUBF4
ASGNF4
line 1060
;1060:		if ( delta > 2 ) {
ADDRLP4 1236
INDIRF4
CNSTF4 1073741824
LEF4 $639
line 1061
;1061:			if ( delta < 7 ) {
ADDRLP4 1236
INDIRF4
CNSTF4 1088421888
GEF4 $641
line 1062
;1062:				PM_AddEvent( EV_STEP_4 );
CNSTI4 7
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1063
;1063:			} else if ( delta < 11 ) {
ADDRGP4 $642
JUMPV
LABELV $641
ADDRLP4 1236
INDIRF4
CNSTF4 1093664768
GEF4 $643
line 1064
;1064:				PM_AddEvent( EV_STEP_8 );
CNSTI4 8
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1065
;1065:			} else if ( delta < 15 ) {
ADDRGP4 $644
JUMPV
LABELV $643
ADDRLP4 1236
INDIRF4
CNSTF4 1097859072
GEF4 $645
line 1066
;1066:				PM_AddEvent( EV_STEP_12 );
CNSTI4 9
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1067
;1067:			} else {
ADDRGP4 $646
JUMPV
LABELV $645
line 1068
;1068:				PM_AddEvent( EV_STEP_16 );
CNSTI4 10
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1069
;1069:			}
LABELV $646
LABELV $644
LABELV $642
line 1070
;1070:		}
LABELV $639
line 1071
;1071:		if ( pm->debugLevel ) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $647
line 1072
;1072:			Com_Printf("%i:stepped\n", c_pmove);
ADDRGP4 $649
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1073
;1073:		}
LABELV $647
line 1074
;1074:	}
line 1075
;1075:}
LABELV $518
endproc PM_StepSlideMove 1244 28
import fabsf
import sqrtf
import PM_JumpForDir
import MovementOverbounceFactor
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
import BG_CycleInven
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
LABELV $649
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $559
byte 1 37
byte 1 105
byte 1 58
byte 1 98
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $531
byte 1 37
byte 1 105
byte 1 58
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
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
