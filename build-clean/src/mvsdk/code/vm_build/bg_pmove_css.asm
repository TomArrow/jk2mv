data
export pmcss_stopspeed
align 4
LABELV pmcss_stopspeed
byte 4 1120403456
export pmcss_maxspeed
align 4
LABELV pmcss_maxspeed
byte 4 1133903872
export pmcss_duckspeed
align 4
LABELV pmcss_duckspeed
byte 4 1120403456
export pmcss_accelerate
align 4
LABELV pmcss_accelerate
byte 4 1092616192
export pmcss_airaccelerate
align 4
LABELV pmcss_airaccelerate
byte 4 0
export pmcss_wateraccelerate
align 4
LABELV pmcss_wateraccelerate
byte 4 1092616192
export pmcss_friction
align 4
LABELV pmcss_friction
byte 4 1086324736
export pmcss_waterfriction
align 4
LABELV pmcss_waterfriction
byte 4 1065353216
export pmcss_waterspeed
align 4
LABELV pmcss_waterspeed
byte 4 1137180672
code
proc PMCSS_UpdateAntiLoop 16 20
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\bg_pmove_css.c"
line 80
;1:/*
;2:Copyright (C) 1997-2001 Id Software, Inc.
;3:
;4:This program is free software; you can redistribute it and/or
;5:modify it under the terms of the GNU General Public License
;6:as published by the Free Software Foundation; either version 2
;7:of the License, or (at your option) any later version.
;8:
;9:This program is distributed in the hope that it will be useful,
;10:but WITHOUT ANY WARRANTY; without even the implied warranty of
;11:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
;12:
;13:See the GNU General Public License for more details.
;14:
;15:You should have received a copy of the GNU General Public License
;16:along with this program; if not, write to the Free Software
;17:Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
;18:
;19:*/
;20:
;21:#include "../game/bg_pmove_css.h"
;22:#include "../game/bg_public.h"
;23:
;24:
;25://#define AUTHENTIC_CSSSNAP
;26:
;27:#define	STEPSIZE	18
;28:
;29:// all of the locals will be zeroed before each
;30:// pmove, just to make damn sure we don't have
;31:// any differences when running on client or server
;32:
;33:typedef struct
;34:{
;35:	vec3_t		origin;			// full float precision
;36:	vec3_t		velocity;		// full float precision
;37:
;38:
;39:	vec3_t		forward, right, up;
;40:	float		frametime;
;41:
;42:	int			msec;
;43:
;44:	//csurface_t* groundsurface;
;45:	cplane_t	groundplane;
;46:	int			groundcontents;
;47:	int			surfaceFlags;
;48:	//trace_t		groundTrace;
;49:	qboolean	groundFound;
;50:
;51:
;52:	float		forwardmove, rightmove, upmove;
;53:
;54:	vec3_t		previous_origin;
;55:	qboolean	ladder;
;56:} pmlcss_t;
;57:
;58:pmovecss_t* pmcss;
;59:pmlcss_t		pmlcss;
;60:
;61:
;62:// movement parameters
;63:float	pmcss_stopspeed = 100;
;64:float	pmcss_maxspeed = 300;
;65:float	pmcss_duckspeed = 100;
;66:float	pmcss_accelerate = 10;
;67:float	pmcss_airaccelerate = 0;
;68:float	pmcss_wateraccelerate = 10;
;69:float	pmcss_friction = 6;
;70:float	pmcss_waterfriction = 1;
;71:float	pmcss_waterspeed = 400;
;72:
;73:/*
;74:
;75:  walking up a step should kill some velocity
;76:
;77:*/
;78:
;79:extern pmove_t* pm;
;80:static void PMCSS_UpdateAntiLoop() {
line 81
;81:	DF_AntiLoop_NewAngle(pmcss->antiLoop, pm->lastAntiLoopVelocity, pmlcss.velocity, pmcss->ps->basespeed, pm->modParms.raceMode && pm->ps->duelTime);
ADDRLP4 4
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 212
ADDP4
INDIRP4
ARGP4
ADDRGP4 pm
INDIRP4
CNSTI4 544
ADDP4
ARGP4
ADDRGP4 pmlcss+12
ARGP4
ADDRLP4 4
INDIRP4
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $96
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $96
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $97
JUMPV
LABELV $96
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $97
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 DF_AntiLoop_NewAngle
CALLV
pop
line 82
;82:	VectorCopy(pmlcss.velocity, pm->lastAntiLoopVelocity);
ADDRGP4 pm
INDIRP4
CNSTI4 544
ADDP4
ADDRGP4 pmlcss+12
INDIRB
ASGNB 12
line 83
;83:}
LABELV $93
endproc PMCSS_UpdateAntiLoop 16 20
proc PMCSS_AddTouchEnt 12 0
line 90
;84:
;85:/*
;86:===============
;87:PM_AddTouchEnt
;88:===============
;89:*/
;90:static void PMCSS_AddTouchEnt(int entityNum) {
line 93
;91:	int		i;
;92:
;93:	if (entityNum == ENTITYNUM_WORLD) {
ADDRFP4 0
INDIRI4
CNSTI4 1022
NEI4 $100
line 94
;94:		return;
ADDRGP4 $99
JUMPV
LABELV $100
line 96
;95:	}
;96:	if (pmcss->numtouch == MAXTOUCH) {
ADDRGP4 pmcss
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 32
NEI4 $102
line 97
;97:		return;
ADDRGP4 $99
JUMPV
LABELV $102
line 101
;98:	}
;99:
;100:	// see if it is already added
;101:	for (i = 0; i < pmcss->numtouch; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $107
JUMPV
LABELV $104
line 102
;102:		if (pmcss->touchents[i] == entityNum) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pmcss
INDIRP4
CNSTI4 48
ADDP4
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $108
line 103
;103:			return;
ADDRGP4 $99
JUMPV
LABELV $108
line 105
;104:		}
;105:	}
LABELV $105
line 101
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $107
ADDRLP4 0
INDIRI4
ADDRGP4 pmcss
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LTI4 $104
line 108
;106:
;107:	// add it
;108:	pmcss->touchents[pmcss->numtouch] = entityNum;
ADDRLP4 4
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 48
ADDP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 109
;109:	pmcss->numtouch++;
ADDRLP4 8
ADDRGP4 pmcss
INDIRP4
CNSTI4 44
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
line 110
;110:}
LABELV $99
endproc PMCSS_AddTouchEnt 12 0
export PMCSS_ClipVelocity
proc PMCSS_ClipVelocity 36 0
line 124
;111:
;112:
;113:/*
;114:==================
;115:PMCSS_ClipVelocity
;116:
;117:Slide off of the impacting object
;118:returns the blocked flags (1 = floor, 2 = step / wall)
;119:==================
;120:*/
;121:#define	STOP_EPSILON	0.1
;122:
;123:void PMCSS_ClipVelocity(vec3_t in, vec3_t normal, vec3_t out, float overbounce)
;124:{
line 129
;125:	float	backoff;
;126:	float	change;
;127:	int		i;
;128:
;129:	backoff = DotProduct(in, normal) * overbounce;
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
line 131
;130:
;131:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $111
line 132
;132:	{
line 133
;133:		change = normal[i] * backoff;
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
line 134
;134:		out[i] = in[i] - change;
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
line 135
;135:		if (out[i] > -STOP_EPSILON && out[i] < STOP_EPSILON)
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
LEF4 $115
ADDRLP4 32
INDIRF4
CNSTF4 1036831949
GEF4 $115
line 136
;136:			out[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
LABELV $115
line 137
;137:	}
LABELV $112
line 131
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $111
line 138
;138:}
LABELV $110
endproc PMCSS_ClipVelocity 36 0
export PMCSS_StepSlideMove_
proc PMCSS_StepSlideMove_ 1220 28
line 157
;139:
;140:
;141:
;142:
;143:/*
;144:==================
;145:PMCSS_StepSlideMove
;146:
;147:Each intersection will try to step over the obstruction instead of
;148:sliding along it.
;149:
;150:Returns a new origin, velocity, and contact entity
;151:Does not modify any world state?
;152:==================
;153:*/
;154:#define	MIN_STEP_NORMAL	0.7		// can't step up onto very steep slopes
;155:#define	MAX_CLIP_PLANES	5
;156:void PMCSS_StepSlideMove_(void)
;157:{
line 169
;158:	int			bumpcount, numbumps;
;159:	vec3_t		dir;
;160:	float		d;
;161:	int			numplanes;
;162:	vec3_t		planes[MAX_CLIP_PLANES];
;163:	vec3_t		primal_velocity;
;164:	int			i, j;
;165:	trace_t	trace;
;166:	vec3_t		end;
;167:	float		time_left;
;168:
;169:	numbumps = 4;
ADDRLP4 1200
CNSTI4 4
ASGNI4
line 171
;170:
;171:	VectorCopy(pmlcss.velocity, primal_velocity);
ADDRLP4 1180
ADDRGP4 pmlcss+12
INDIRB
ASGNB 12
line 172
;172:	numplanes = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 174
;173:
;174:	time_left = pmlcss.frametime;
ADDRLP4 72
ADDRGP4 pmlcss+60
INDIRF4
ASGNF4
line 176
;175:
;176:	for (bumpcount = 0; bumpcount < numbumps; bumpcount++)
ADDRLP4 1192
CNSTI4 0
ASGNI4
ADDRGP4 $123
JUMPV
LABELV $120
line 177
;177:	{
line 178
;178:		for (i = 0; i < 3; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $124
line 179
;179:			end[i] = pmlcss.origin[i] + time_left * pmlcss.velocity[i];
ADDRLP4 1204
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1204
INDIRI4
ADDRLP4 76
ADDP4
ADDRLP4 1204
INDIRI4
ADDRGP4 pmlcss
ADDP4
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 1204
INDIRI4
ADDRGP4 pmlcss+12
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $125
line 178
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $124
line 181
;180:
;181:		pmcss->trace(&trace, pmlcss.origin, pmcss->mins, pmcss->maxs, end, pmcss->ps->clientNum, pmcss->tracemask);
ADDRLP4 88
ARGP4
ADDRGP4 pmlcss
ARGP4
ADDRLP4 1208
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 1208
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 76
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
CNSTI4 208
ADDP4
INDIRI4
ARGI4
ADDRLP4 1208
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 183
;182:
;183:		if (trace.allsolid)
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $129
line 184
;184:		{	// entity is trapped in another solid
line 185
;185:			pmlcss.velocity[2] = 0;	// don't build up falling damage
ADDRGP4 pmlcss+12+8
CNSTF4 0
ASGNF4
line 186
;186:			return;
ADDRGP4 $117
JUMPV
LABELV $129
line 189
;187:		}
;188:
;189:		if (trace.fraction > 0)
ADDRLP4 88+8
INDIRF4
CNSTF4 0
LEF4 $133
line 190
;190:		{	// actually covered some distance
line 191
;191:			VectorCopy(trace.endpos, pmlcss.origin);
ADDRGP4 pmlcss
ADDRLP4 88+12
INDIRB
ASGNB 12
line 192
;192:			numplanes = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 193
;193:		}
LABELV $133
line 195
;194:
;195:		if (trace.fraction == 1)
ADDRLP4 88+8
INDIRF4
CNSTF4 1065353216
NEF4 $137
line 196
;196:			break;		// moved the entire distance
ADDRGP4 $122
JUMPV
LABELV $137
line 199
;197:
;198:	   // save entity for contact
;199:		if (pmcss->numtouch < MAXTOUCH && trace.entityNum != ENTITYNUM_NONE)
ADDRGP4 pmcss
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 32
GEI4 $140
ADDRLP4 88+52
INDIRI4
CNSTI4 1023
EQI4 $140
line 200
;200:		{
line 201
;201:			pmcss->touchents[pmcss->numtouch] = trace.entityNum;
ADDRLP4 1212
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1212
INDIRP4
CNSTI4 48
ADDP4
ADDP4
ADDRLP4 88+52
INDIRI4
ASGNI4
line 202
;202:			pmcss->numtouch++;
ADDRLP4 1216
ADDRGP4 pmcss
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 1216
INDIRP4
ADDRLP4 1216
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 203
;203:		}
LABELV $140
line 205
;204:
;205:		time_left -= time_left * trace.fraction;
ADDRLP4 72
ADDRLP4 72
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 88+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 208
;206:
;207:		// slide along this plane
;208:		if (numplanes >= MAX_CLIP_PLANES)
ADDRLP4 68
INDIRI4
CNSTI4 5
LTI4 $145
line 209
;209:		{	// this shouldn't really happen
line 210
;210:			VectorCopy(vec3_origin, pmlcss.velocity);
ADDRGP4 pmlcss+12
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 211
;211:			break;
ADDRGP4 $122
JUMPV
LABELV $145
line 214
;212:		}
;213:
;214:		VectorCopy(trace.plane.normal, planes[numplanes]);
CNSTI4 12
ADDRLP4 68
INDIRI4
MULI4
ADDRLP4 8
ADDP4
ADDRLP4 88+24
INDIRB
ASGNB 12
line 215
;215:		numplanes++;
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 262
;216:
;217:#if 0
;218:		float		rub;
;219:
;220:		//
;221:		// modify velocity so it parallels all of the clip planes
;222:		//
;223:		if (numplanes == 1)
;224:		{	// go along this plane
;225:			VectorCopy(pmlcss.velocity, dir);
;226:			VectorNormalize(dir);
;227:			rub = 1.0 + 0.5 * DotProduct(dir, planes[0]);
;228:
;229:			// slide along the plane
;230:			PMCSS_ClipVelocity(pmlcss.velocity, planes[0], pmlcss.velocity, 1.01);
;231:			// rub some extra speed off on xy axis
;232:			// not on Z, or you can scrub down walls
;233:			pmlcss.velocity[0] *= rub;
;234:			pmlcss.velocity[1] *= rub;
;235:			pmlcss.velocity[2] *= rub;
;236:		}
;237:		else if (numplanes == 2)
;238:		{	// go along the crease
;239:			VectorCopy(pmlcss.velocity, dir);
;240:			VectorNormalize(dir);
;241:			rub = 1.0 + 0.5 * DotProduct(dir, planes[0]);
;242:
;243:			// slide along the plane
;244:			CrossProduct(planes[0], planes[1], dir);
;245:			d = DotProduct(dir, pmlcss.velocity);
;246:			VectorScale(dir, d, pmlcss.velocity);
;247:
;248:			// rub some extra speed off
;249:			VectorScale(pmlcss.velocity, rub, pmlcss.velocity);
;250:		}
;251:		else
;252:		{
;253:			//			Con_Printf ("clip velocity, numplanes == %i\n",numplanes);
;254:			VectorCopy(vec3_origin, pmlcss.velocity);
;255:			break;
;256:		}
;257:
;258:#else
;259:		//
;260:		// modify original_velocity so it parallels all of the clip planes
;261:		//
;262:		for (i = 0; i < numplanes; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $152
JUMPV
LABELV $149
line 263
;263:		{
line 264
;264:			PMCSS_ClipVelocity(pmlcss.velocity, planes[i], pmlcss.velocity, 1.01);
ADDRGP4 pmlcss+12
ARGP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
ADDP4
ARGP4
ADDRGP4 pmlcss+12
ARGP4
CNSTF4 1065437102
ARGF4
ADDRGP4 PMCSS_ClipVelocity
CALLV
pop
line 265
;265:			for (j = 0; j < numplanes; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $158
JUMPV
LABELV $155
line 266
;266:				if (j != i)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $159
line 267
;267:				{
line 268
;268:					if (DotProduct(pmlcss.velocity, planes[j]) < 0)
ADDRLP4 1216
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRGP4 pmlcss+12
INDIRF4
ADDRLP4 1216
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
MULF4
ADDRGP4 pmlcss+12+4
INDIRF4
ADDRLP4 1216
INDIRI4
ADDRLP4 8+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRGP4 pmlcss+12+8
INDIRF4
ADDRLP4 1216
INDIRI4
ADDRLP4 8+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $161
line 269
;269:						break;	// not ok
ADDRGP4 $157
JUMPV
LABELV $161
line 270
;270:				}
LABELV $159
LABELV $156
line 265
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $158
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $155
LABELV $157
line 271
;271:			if (j == numplanes)
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $170
line 272
;272:				break;
ADDRGP4 $151
JUMPV
LABELV $170
line 273
;273:		}
LABELV $150
line 262
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $152
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $149
LABELV $151
line 275
;274:
;275:		if (i != numplanes)
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $172
line 276
;276:		{	// go along this plane
line 277
;277:		}
ADDRGP4 $173
JUMPV
LABELV $172
line 279
;278:		else
;279:		{	// go along the crease
line 280
;280:			if (numplanes != 2)
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $174
line 281
;281:			{
line 283
;282:				//				Con_Printf ("clip velocity, numplanes == %i\n",numplanes);
;283:				VectorCopy(vec3_origin, pmlcss.velocity);
ADDRGP4 pmlcss+12
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 284
;284:				break;
ADDRGP4 $122
JUMPV
LABELV $174
line 286
;285:			}
;286:			CrossProduct(planes[0], planes[1], dir);
ADDRLP4 8
ARGP4
ADDRLP4 8+12
ARGP4
ADDRLP4 1168
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 287
;287:			d = DotProduct(dir, pmlcss.velocity);
ADDRLP4 1196
ADDRLP4 1168
INDIRF4
ADDRGP4 pmlcss+12
INDIRF4
MULF4
ADDRLP4 1168+4
INDIRF4
ADDRGP4 pmlcss+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1168+8
INDIRF4
ADDRGP4 pmlcss+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 288
;288:			VectorScale(dir, d, pmlcss.velocity);
ADDRGP4 pmlcss+12
ADDRLP4 1168
INDIRF4
ADDRLP4 1196
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlcss+12+4
ADDRLP4 1168+4
INDIRF4
ADDRLP4 1196
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlcss+12+8
ADDRLP4 1168+8
INDIRF4
ADDRLP4 1196
INDIRF4
MULF4
ASGNF4
line 289
;289:		}
LABELV $173
line 295
;290:#endif
;291:		//
;292:		// if velocity is against the original velocity, stop dead
;293:		// to avoid tiny occilations in sloping corners
;294:		//
;295:		if (DotProduct(pmlcss.velocity, primal_velocity) <= 0)
ADDRGP4 pmlcss+12
INDIRF4
ADDRLP4 1180
INDIRF4
MULF4
ADDRGP4 pmlcss+12+4
INDIRF4
ADDRLP4 1180+4
INDIRF4
MULF4
ADDF4
ADDRGP4 pmlcss+12+8
INDIRF4
ADDRLP4 1180+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GTF4 $192
line 296
;296:		{
line 297
;297:			VectorCopy(vec3_origin, pmlcss.velocity);
ADDRGP4 pmlcss+12
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 298
;298:			break;
ADDRGP4 $122
JUMPV
LABELV $192
line 300
;299:		}
;300:	}
LABELV $121
line 176
ADDRLP4 1192
ADDRLP4 1192
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $123
ADDRLP4 1192
INDIRI4
ADDRLP4 1200
INDIRI4
LTI4 $120
LABELV $122
line 302
;301:
;302:	if (pmcss->ps->pm_time)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $202
line 303
;303:	{
line 304
;304:		VectorCopy(primal_velocity, pmlcss.velocity);
ADDRGP4 pmlcss+12
ADDRLP4 1180
INDIRB
ASGNB 12
line 305
;305:	}
LABELV $202
line 306
;306:}
LABELV $117
endproc PMCSS_StepSlideMove_ 1220 28
export PMCSS_StepSlideMove
proc PMCSS_StepSlideMove 1176 28
line 315
;307:
;308:/*
;309:==================
;310:PMCSS_StepSlideMove
;311:
;312:==================
;313:*/
;314:void PMCSS_StepSlideMove(void)
;315:{
line 323
;316:	vec3_t		start_o, start_v;
;317:	vec3_t		down_o, down_v;
;318:	trace_t		trace;
;319:	float		down_dist, up_dist;
;320:	//	vec3_t		delta;
;321:	vec3_t		up, down;
;322:
;323:	VectorCopy(pmlcss.origin, start_o);
ADDRLP4 0
ADDRGP4 pmlcss
INDIRB
ASGNB 12
line 324
;324:	VectorCopy(pmlcss.velocity, start_v);
ADDRLP4 1140
ADDRGP4 pmlcss+12
INDIRB
ASGNB 12
line 326
;325:
;326:	PMCSS_StepSlideMove_();
ADDRGP4 PMCSS_StepSlideMove_
CALLV
pop
line 328
;327:
;328:	VectorCopy(pmlcss.origin, down_o);
ADDRLP4 24
ADDRGP4 pmlcss
INDIRB
ASGNB 12
line 329
;329:	VectorCopy(pmlcss.velocity, down_v);
ADDRLP4 1128
ADDRGP4 pmlcss+12
INDIRB
ASGNB 12
line 331
;330:
;331:	VectorCopy(start_o, up);
ADDRLP4 12
ADDRLP4 0
INDIRB
ASGNB 12
line 332
;332:	up[2] += STEPSIZE;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 334
;333:
;334:	pmcss->trace(&trace, up, pmcss->mins, pmcss->maxs, up, pmcss->ps->clientNum, pmcss->tracemask);
ADDRLP4 36
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1160
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 1160
INDIRP4
CNSTI4 188
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
CNSTI4 208
ADDP4
INDIRI4
ARGI4
ADDRLP4 1160
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 336
;335:
;336:	if (trace.allsolid)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $209
line 337
;337:		return;		// can't step up
ADDRGP4 $205
JUMPV
LABELV $209
line 340
;338:
;339:	// try sliding above
;340:	VectorCopy(up, pmlcss.origin);
ADDRGP4 pmlcss
ADDRLP4 12
INDIRB
ASGNB 12
line 341
;341:	VectorCopy(start_v, pmlcss.velocity);
ADDRGP4 pmlcss+12
ADDRLP4 1140
INDIRB
ASGNB 12
line 343
;342:
;343:	PMCSS_StepSlideMove_();
ADDRGP4 PMCSS_StepSlideMove_
CALLV
pop
line 346
;344:
;345:	// push down the final amount
;346:	VectorCopy(pmlcss.origin, down);
ADDRLP4 1116
ADDRGP4 pmlcss
INDIRB
ASGNB 12
line 347
;347:	down[2] -= STEPSIZE;
ADDRLP4 1116+8
ADDRLP4 1116+8
INDIRF4
CNSTF4 1099956224
SUBF4
ASGNF4
line 348
;348:	pmcss->trace(&trace, pmlcss.origin, pmcss->mins, pmcss->maxs, down, pmcss->ps->clientNum, pmcss->tracemask);
ADDRLP4 36
ARGP4
ADDRGP4 pmlcss
ARGP4
ADDRLP4 1164
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 1164
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1164
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1164
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ARGI4
ADDRLP4 1164
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 349
;349:	if (!trace.allsolid)
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $213
line 350
;350:	{
line 351
;351:		VectorCopy(trace.endpos, pmlcss.origin);
ADDRGP4 pmlcss
ADDRLP4 36+12
INDIRB
ASGNB 12
line 352
;352:	}
LABELV $213
line 361
;353:
;354:#if 0
;355:	VectorSubtract(pmlcss.origin, up, delta);
;356:	up_dist = DotProduct(delta, start_v);
;357:
;358:	VectorSubtract(down_o, start_o, delta);
;359:	down_dist = DotProduct(delta, start_v);
;360:#else
;361:	VectorCopy(pmlcss.origin, up);
ADDRLP4 12
ADDRGP4 pmlcss
INDIRB
ASGNB 12
line 364
;362:
;363:	// decide which one went farther
;364:	down_dist = (down_o[0] - start_o[0]) * (down_o[0] - start_o[0])
ADDRLP4 1168
ADDRLP4 24
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1152
ADDRLP4 1168
INDIRF4
ADDRLP4 1168
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
line 366
;365:		+ (down_o[1] - start_o[1]) * (down_o[1] - start_o[1]);
;366:	up_dist = (up[0] - start_o[0]) * (up[0] - start_o[0])
ADDRLP4 1172
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1156
ADDRLP4 1172
INDIRF4
ADDRLP4 1172
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
line 370
;367:		+ (up[1] - start_o[1]) * (up[1] - start_o[1]);
;368:#endif
;369:
;370:	if (down_dist > up_dist || trace.plane.normal[2] < MIN_STEP_NORMAL)
ADDRLP4 1152
INDIRF4
ADDRLP4 1156
INDIRF4
GTF4 $228
ADDRLP4 36+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $224
LABELV $228
line 371
;371:	{
line 372
;372:		VectorCopy(down_o, pmlcss.origin);
ADDRGP4 pmlcss
ADDRLP4 24
INDIRB
ASGNB 12
line 373
;373:		VectorCopy(down_v, pmlcss.velocity);
ADDRGP4 pmlcss+12
ADDRLP4 1128
INDIRB
ASGNB 12
line 374
;374:		return;
ADDRGP4 $205
JUMPV
LABELV $224
line 378
;375:	}
;376:	//!! Special case
;377:	// if we were walking along a plane, then we need to copy the Z over
;378:	pmlcss.velocity[2] = down_v[2];
ADDRGP4 pmlcss+12+8
ADDRLP4 1128+8
INDIRF4
ASGNF4
line 379
;379:}
LABELV $205
endproc PMCSS_StepSlideMove 1176 28
export PMCSS_Friction
proc PMCSS_Friction 64 4
line 390
;380:
;381:
;382:/*
;383:==================
;384:PMCSS_Friction
;385:
;386:Handles both ground friction and water friction
;387:==================
;388:*/
;389:void PMCSS_Friction(void)
;390:{
line 396
;391:	float* vel;
;392:	float	speed, newspeed, control;
;393:	float	friction;
;394:	float	drop;
;395:
;396:	vel = pmlcss.velocity;
ADDRLP4 0
ADDRGP4 pmlcss+12
ASGNP4
line 398
;397:
;398:	speed = sqrt(vel[0] * vel[0] + vel[1] * vel[1] + vel[2] * vel[2]);
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDF4
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
ADDRLP4 8
ADDRLP4 40
INDIRF4
ASGNF4
line 399
;399:	if (speed < 1)
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
GEF4 $235
line 400
;400:	{
line 401
;401:		vel[0] = 0;
ADDRLP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 402
;402:		vel[1] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 403
;403:		return;
ADDRGP4 $233
JUMPV
LABELV $235
line 406
;404:	}
;405:
;406:	drop = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 409
;407:
;408:	// apply ground friction
;409:	if ((pmcss->ps->groundEntityNum != ENTITYNUM_NONE && pmlcss.groundFound && !(pmlcss.surfaceFlags & SURF_SLICK)) || (pmlcss.ladder))
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $244
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 pmlcss+96
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $244
ADDRGP4 pmlcss+92
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 44
INDIRI4
EQI4 $242
LABELV $244
ADDRGP4 pmlcss+124
INDIRI4
CNSTI4 0
EQI4 $237
LABELV $242
line 410
;410:	{
line 411
;411:		friction = pmcss_friction;
ADDRLP4 20
ADDRGP4 pmcss_friction
INDIRF4
ASGNF4
line 412
;412:		control = speed < pmcss_stopspeed ? pmcss_stopspeed : speed;
ADDRLP4 8
INDIRF4
ADDRGP4 pmcss_stopspeed
INDIRF4
GEF4 $246
ADDRLP4 48
ADDRGP4 pmcss_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $247
JUMPV
LABELV $246
ADDRLP4 48
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $247
ADDRLP4 16
ADDRLP4 48
INDIRF4
ASGNF4
line 413
;413:		drop += control * friction * pmlcss.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
ADDF4
ASGNF4
line 414
;414:	}
LABELV $237
line 417
;415:
;416:	// apply water friction
;417:	if (pmcss->waterlevel && !pmlcss.ladder)
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRGP4 pmcss
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $249
ADDRGP4 pmlcss+124
INDIRI4
ADDRLP4 48
INDIRI4
NEI4 $249
line 418
;418:		drop += speed * pmcss_waterfriction * pmcss->waterlevel * pmlcss.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pmcss_waterfriction
INDIRF4
MULF4
ADDRGP4 pmcss
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $249
line 421
;419:
;420:	// scale the velocity
;421:	newspeed = speed - drop;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 422
;422:	if (newspeed < 0)
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $253
line 423
;423:	{
line 424
;424:		newspeed = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 425
;425:	}
LABELV $253
line 426
;426:	newspeed /= speed;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 428
;427:
;428:	vel[0] = vel[0] * newspeed;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 429
;429:	vel[1] = vel[1] * newspeed;
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 4
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
line 430
;430:	vel[2] = vel[2] * newspeed;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 431
;431:}
LABELV $233
endproc PMCSS_Friction 64 4
export PMCSS_Accelerate
proc PMCSS_Accelerate 28 0
line 442
;432:
;433:
;434:/*
;435:==============
;436:PMCSS_Accelerate
;437:
;438:Handles user intended acceleration
;439:==============
;440:*/
;441:void PMCSS_Accelerate(vec3_t wishdir, float wishspeed, float accel)
;442:{
line 446
;443:	int			i;
;444:	float		addspeed, accelspeed, currentspeed;
;445:
;446:	currentspeed = DotProduct(pmlcss.velocity, wishdir);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRGP4 pmlcss+12
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ADDRGP4 pmlcss+12+4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRGP4 pmlcss+12+8
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 447
;447:	addspeed = wishspeed - currentspeed;
ADDRLP4 8
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 448
;448:	if (addspeed <= 0)
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $261
line 449
;449:		return;
ADDRGP4 $255
JUMPV
LABELV $261
line 450
;450:	accelspeed = accel * pmlcss.frametime * wishspeed;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 451
;451:	if (accelspeed > addspeed)
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $264
line 452
;452:		accelspeed = addspeed;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $264
line 454
;453:
;454:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $266
line 455
;455:		pmlcss.velocity[i] += accelspeed * wishdir[i];
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 24
ADDRLP4 20
INDIRI4
ADDRGP4 pmlcss+12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $267
line 454
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $266
line 456
;456:}
LABELV $255
endproc PMCSS_Accelerate 28 0
export PMCSS_AirAccelerate
proc PMCSS_AirAccelerate 32 0
line 459
;457:
;458:void PMCSS_AirAccelerate(vec3_t wishdir, float wishspeed, float accel)
;459:{
line 461
;460:	int			i;
;461:	float		addspeed, accelspeed, currentspeed, wishspd = wishspeed;
ADDRLP4 12
ADDRFP4 4
INDIRF4
ASGNF4
line 463
;462:
;463:	if (wishspd > 30)
ADDRLP4 12
INDIRF4
CNSTF4 1106247680
LEF4 $272
line 464
;464:		wishspd = 30;
ADDRLP4 12
CNSTF4 1106247680
ASGNF4
LABELV $272
line 465
;465:	currentspeed = DotProduct(pmlcss.velocity, wishdir);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRGP4 pmlcss+12
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ADDRGP4 pmlcss+12+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRGP4 pmlcss+12+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 466
;466:	addspeed = wishspd - currentspeed;
ADDRLP4 8
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
line 467
;467:	if (addspeed <= 0)
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $279
line 468
;468:		return;
ADDRGP4 $271
JUMPV
LABELV $279
line 469
;469:	accelspeed = accel * wishspeed * pmlcss.frametime;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
ASGNF4
line 470
;470:	if (accelspeed > addspeed)
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $282
line 471
;471:		accelspeed = addspeed;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $282
line 473
;472:
;473:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $284
line 474
;474:		pmlcss.velocity[i] += accelspeed * wishdir[i];
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
ADDRLP4 24
INDIRI4
ADDRGP4 pmlcss+12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $285
line 473
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $284
line 475
;475:}
LABELV $271
endproc PMCSS_AirAccelerate 32 0
export PMCSS_AddCurrents
proc PMCSS_AddCurrents 20 4
line 483
;476:
;477:/*
;478:=============
;479:PMCSS_AddCurrents
;480:=============
;481:*/
;482:void PMCSS_AddCurrents(vec3_t	wishvel)
;483:{
line 491
;484:	vec3_t	v;
;485:	float	s;
;486:
;487:	//
;488:	// account for ladders
;489:	//
;490:
;491:	if (pmlcss.ladder && fabs(pmlcss.velocity[2]) <= 200)
ADDRGP4 pmlcss+124
INDIRI4
CNSTI4 0
EQI4 $290
ADDRGP4 pmlcss+12+8
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 1128792064
GTF4 $290
line 492
;492:	{
line 493
;493:		if ((pmcss->ps->viewangles[PITCH] <= -15) && (pmlcss.forwardmove > 0))
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
CNSTF4 3245342720
GTF4 $295
ADDRGP4 pmlcss+100
INDIRF4
CNSTF4 0
LEF4 $295
line 494
;494:			wishvel[2] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1128792064
ASGNF4
ADDRGP4 $296
JUMPV
LABELV $295
line 495
;495:		else if ((pmcss->ps->viewangles[PITCH] >= 15) && (pmlcss.forwardmove > 0))
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
CNSTF4 1097859072
LTF4 $298
ADDRGP4 pmlcss+100
INDIRF4
CNSTF4 0
LEF4 $298
line 496
;496:			wishvel[2] = -200;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 3276275712
ASGNF4
ADDRGP4 $299
JUMPV
LABELV $298
line 497
;497:		else if (pmlcss.upmove > 0)
ADDRGP4 pmlcss+108
INDIRF4
CNSTF4 0
LEF4 $301
line 498
;498:			wishvel[2] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1128792064
ASGNF4
ADDRGP4 $302
JUMPV
LABELV $301
line 499
;499:		else if (pmlcss.upmove < 0)
ADDRGP4 pmlcss+108
INDIRF4
CNSTF4 0
GEF4 $304
line 500
;500:			wishvel[2] = -200;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 3276275712
ASGNF4
ADDRGP4 $305
JUMPV
LABELV $304
line 502
;501:		else
;502:			wishvel[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
LABELV $305
LABELV $302
LABELV $299
LABELV $296
line 505
;503:
;504:		// limit horizontal speed when on a ladder
;505:		if (wishvel[0] < -25)
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 3251109888
GEF4 $307
line 506
;506:			wishvel[0] = -25;
ADDRFP4 0
INDIRP4
CNSTF4 3251109888
ASGNF4
ADDRGP4 $308
JUMPV
LABELV $307
line 507
;507:		else if (wishvel[0] > 25)
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1103626240
LEF4 $309
line 508
;508:			wishvel[0] = 25;
ADDRFP4 0
INDIRP4
CNSTF4 1103626240
ASGNF4
LABELV $309
LABELV $308
line 510
;509:
;510:		if (wishvel[1] < -25)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 3251109888
GEF4 $311
line 511
;511:			wishvel[1] = -25;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 3251109888
ASGNF4
ADDRGP4 $312
JUMPV
LABELV $311
line 512
;512:		else if (wishvel[1] > 25)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1103626240
LEF4 $313
line 513
;513:			wishvel[1] = 25;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1103626240
ASGNF4
LABELV $313
LABELV $312
line 514
;514:	}
LABELV $290
line 568
;515:
;516:
;517:	//
;518:	// add water currents
;519:	//
;520:	/* TA: doesn't exist in q3 engine
;521:	if (pmcss->watertype & MASK_CURRENT)
;522:	{
;523:		VectorClear(v);
;524:
;525:		if (pmcss->watertype & CONTENTS_CURRENT_0)
;526:			v[0] += 1;
;527:		if (pmcss->watertype & CONTENTS_CURRENT_90)
;528:			v[1] += 1;
;529:		if (pmcss->watertype & CONTENTS_CURRENT_180)
;530:			v[0] -= 1;
;531:		if (pmcss->watertype & CONTENTS_CURRENT_270)
;532:			v[1] -= 1;
;533:		if (pmcss->watertype & CONTENTS_CURRENT_UP)
;534:			v[2] += 1;
;535:		if (pmcss->watertype & CONTENTS_CURRENT_DOWN)
;536:			v[2] -= 1;
;537:
;538:		s = pmcss_waterspeed;
;539:		if ((pmcss->waterlevel == 1) && (pmcss->ps->groundEntityNum != ENTITYNUM_NONE))
;540:			s /= 2;
;541:
;542:		VectorMA(wishvel, s, v, wishvel);
;543:	}*/
;544:
;545:	//
;546:	// add conveyor belt velocities
;547:	//
;548:
;549:	//if (pmcss->ps->groundEntityNum != ENTITYNUM_NONE)
;550:	//{
;551:	//	VectorClear(v);
;552:
;553:	//	if (pmlcss.groundcontents & CONTENTS_CURRENT_0)
;554:	//		v[0] += 1;
;555:	//	if (pmlcss.groundcontents & CONTENTS_CURRENT_90)
;556:	//		v[1] += 1;
;557:	//	if (pmlcss.groundcontents & CONTENTS_CURRENT_180)
;558:	//		v[0] -= 1;
;559:	//	if (pmlcss.groundcontents & CONTENTS_CURRENT_270)
;560:	//		v[1] -= 1;
;561:	//	if (pmlcss.groundcontents & CONTENTS_CURRENT_UP)
;562:	//		v[2] += 1;
;563:	//	if (pmlcss.groundcontents & CONTENTS_CURRENT_DOWN)
;564:	//		v[2] -= 1;
;565:
;566:	//	VectorMA(wishvel, 100 /* pmcss->groundentity->speed */, v, wishvel);
;567:	//}
;568:}
LABELV $289
endproc PMCSS_AddCurrents 20 4
export PMCSS_WaterMove
proc PMCSS_WaterMove 48 12
line 578
;569:
;570:
;571:/*
;572:===================
;573:PMCSS_WaterMove
;574:
;575:===================
;576:*/
;577:void PMCSS_WaterMove(void)
;578:{
line 587
;579:	int		i;
;580:	vec3_t	wishvel;
;581:	float	wishspeed;
;582:	vec3_t	wishdir;
;583:
;584:	//
;585:	// user intentions
;586:	//
;587:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $316
line 588
;588:		wishvel[i] = pmlcss.forward[i] * pmlcss.forwardmove + pmlcss.right[i] * pmlcss.rightmove;
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 32
INDIRI4
ADDRGP4 pmlcss+24
ADDP4
INDIRF4
ADDRGP4 pmlcss+100
INDIRF4
MULF4
ADDRLP4 32
INDIRI4
ADDRGP4 pmlcss+36
ADDP4
INDIRF4
ADDRGP4 pmlcss+104
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $317
line 587
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $316
line 590
;589:
;590:	if (!pmlcss.forwardmove && !pmlcss.rightmove && !pmlcss.upmove)
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRGP4 pmlcss+100
INDIRF4
ADDRLP4 36
INDIRF4
NEF4 $324
ADDRGP4 pmlcss+104
INDIRF4
ADDRLP4 36
INDIRF4
NEF4 $324
ADDRGP4 pmlcss+108
INDIRF4
ADDRLP4 36
INDIRF4
NEF4 $324
line 591
;591:		wishvel[2] -= 60;		// drift towards bottom
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1114636288
SUBF4
ASGNF4
ADDRGP4 $325
JUMPV
LABELV $324
line 593
;592:	else
;593:		wishvel[2] += pmlcss.upmove;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRGP4 pmlcss+108
INDIRF4
ADDF4
ASGNF4
LABELV $325
line 595
;594:
;595:	PMCSS_AddCurrents(wishvel);
ADDRLP4 4
ARGP4
ADDRGP4 PMCSS_AddCurrents
CALLV
pop
line 597
;596:
;597:	VectorCopy(wishvel, wishdir);
ADDRLP4 20
ADDRLP4 4
INDIRB
ASGNB 12
line 598
;598:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 20
ARGP4
ADDRLP4 40
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 40
INDIRF4
ASGNF4
line 600
;599:
;600:	if (wishspeed > pmcss_maxspeed)
ADDRLP4 16
INDIRF4
ADDRGP4 pmcss_maxspeed
INDIRF4
LEF4 $332
line 601
;601:	{
line 602
;602:		VectorScale(wishvel, pmcss_maxspeed / wishspeed, wishvel);
ADDRLP4 44
ADDRGP4 pmcss_maxspeed
INDIRF4
ADDRLP4 16
INDIRF4
DIVF4
ASGNF4
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRGP4 pmcss_maxspeed
INDIRF4
ADDRLP4 16
INDIRF4
DIVF4
MULF4
ASGNF4
line 603
;603:		wishspeed = pmcss_maxspeed;
ADDRLP4 16
ADDRGP4 pmcss_maxspeed
INDIRF4
ASGNF4
line 604
;604:	}
LABELV $332
line 605
;605:	wishspeed *= 0.5;
ADDRLP4 16
CNSTF4 1056964608
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 607
;606:
;607:	PMCSS_Accelerate(wishdir, wishspeed, pmcss_wateraccelerate);
ADDRLP4 20
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 pmcss_wateraccelerate
INDIRF4
ARGF4
ADDRGP4 PMCSS_Accelerate
CALLV
pop
line 608
;608:	PMCSS_UpdateAntiLoop();
ADDRGP4 PMCSS_UpdateAntiLoop
CALLV
pop
line 610
;609:
;610:	PMCSS_StepSlideMove();
ADDRGP4 PMCSS_StepSlideMove
CALLV
pop
line 611
;611:	PMCSS_UpdateAntiLoop();
ADDRGP4 PMCSS_UpdateAntiLoop
CALLV
pop
line 612
;612:}
LABELV $315
endproc PMCSS_WaterMove 48 12
export PMCSS_AirMove
proc PMCSS_AirMove 64 12
line 622
;613:
;614:
;615:/*
;616:===================
;617:PMCSS_AirMove
;618:
;619:===================
;620:*/
;621:void PMCSS_AirMove(void)
;622:{
line 630
;623:	int			i;
;624:	vec3_t		wishvel;
;625:	float		fmove, smove;
;626:	vec3_t		wishdir;
;627:	float		wishspeed;
;628:	float		maxspeed;
;629:
;630:	fmove = pmlcss.forwardmove;
ADDRLP4 16
ADDRGP4 pmlcss+100
INDIRF4
ASGNF4
line 631
;631:	smove = pmlcss.rightmove;
ADDRLP4 20
ADDRGP4 pmlcss+104
INDIRF4
ASGNF4
line 641
;632:
;633:	//!!!!! pitch should be 1/3 so this isn't needed??!
;634:#if 0
;635:	pmlcss.forward[2] = 0;
;636:	pmlcss.right[2] = 0;
;637:	VectorNormalize(pmlcss.forward);
;638:	VectorNormalize(pmlcss.right);
;639:#endif
;640:
;641:	for (i = 0; i < 2; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $341
line 642
;642:		wishvel[i] = pmlcss.forward[i] * fmove + pmlcss.right[i] * smove;
ADDRLP4 44
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 44
INDIRI4
ADDRGP4 pmlcss+24
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 44
INDIRI4
ADDRGP4 pmlcss+36
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $342
line 641
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $341
line 643
;643:	wishvel[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 645
;644:
;645:	PMCSS_AddCurrents(wishvel);
ADDRLP4 4
ARGP4
ADDRGP4 PMCSS_AddCurrents
CALLV
pop
line 647
;646:
;647:	VectorCopy(wishvel, wishdir);
ADDRLP4 32
ADDRLP4 4
INDIRB
ASGNB 12
line 648
;648:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 32
ARGP4
ADDRLP4 48
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 48
INDIRF4
ASGNF4
line 653
;649:
;650:	//
;651:	// clamp to server defined max speed
;652:	//
;653:	maxspeed = (pmcss->ps->pm_flags & PMF_DUCKED) ? pmcss_duckspeed : pmcss_maxspeed;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $349
ADDRLP4 52
ADDRGP4 pmcss_duckspeed
INDIRF4
ASGNF4
ADDRGP4 $350
JUMPV
LABELV $349
ADDRLP4 52
ADDRGP4 pmcss_maxspeed
INDIRF4
ASGNF4
LABELV $350
ADDRLP4 28
ADDRLP4 52
INDIRF4
ASGNF4
line 655
;654:
;655:	if (wishspeed > maxspeed)
ADDRLP4 24
INDIRF4
ADDRLP4 28
INDIRF4
LEF4 $351
line 656
;656:	{
line 657
;657:		VectorScale(wishvel, maxspeed / wishspeed, wishvel);
ADDRLP4 56
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
DIVF4
ASGNF4
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
DIVF4
MULF4
ASGNF4
line 658
;658:		wishspeed = maxspeed;
ADDRLP4 24
ADDRLP4 28
INDIRF4
ASGNF4
line 659
;659:	}
LABELV $351
line 661
;660:
;661:	if (pmlcss.ladder)
ADDRGP4 pmlcss+124
INDIRI4
CNSTI4 0
EQI4 $357
line 662
;662:	{
line 663
;663:		PMCSS_Accelerate(wishdir, wishspeed, pmcss_accelerate);
ADDRLP4 32
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRGP4 pmcss_accelerate
INDIRF4
ARGF4
ADDRGP4 PMCSS_Accelerate
CALLV
pop
line 664
;664:		PMCSS_UpdateAntiLoop();
ADDRGP4 PMCSS_UpdateAntiLoop
CALLV
pop
line 665
;665:		if (!wishvel[2])
ADDRLP4 4+8
INDIRF4
CNSTF4 0
NEF4 $360
line 666
;666:		{
line 667
;667:			if (pmlcss.velocity[2] > 0)
ADDRGP4 pmlcss+12+8
INDIRF4
CNSTF4 0
LEF4 $363
line 668
;668:			{
line 669
;669:				pmlcss.velocity[2] -= pmcss->ps->gravity * pmlcss.frametime;
ADDRLP4 56
ADDRGP4 pmlcss+12+8
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
SUBF4
ASGNF4
line 670
;670:				if (pmlcss.velocity[2] < 0)
ADDRGP4 pmlcss+12+8
INDIRF4
CNSTF4 0
GEF4 $364
line 671
;671:					pmlcss.velocity[2] = 0;
ADDRGP4 pmlcss+12+8
CNSTF4 0
ASGNF4
line 672
;672:			}
ADDRGP4 $364
JUMPV
LABELV $363
line 674
;673:			else
;674:			{
line 675
;675:				pmlcss.velocity[2] += pmcss->ps->gravity * pmlcss.frametime;
ADDRLP4 56
ADDRGP4 pmlcss+12+8
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
ADDF4
ASGNF4
line 676
;676:				if (pmlcss.velocity[2] > 0)
ADDRGP4 pmlcss+12+8
INDIRF4
CNSTF4 0
LEF4 $379
line 677
;677:					pmlcss.velocity[2] = 0;
ADDRGP4 pmlcss+12+8
CNSTF4 0
ASGNF4
LABELV $379
line 678
;678:			}
LABELV $364
line 679
;679:		}
LABELV $360
line 680
;680:		PMCSS_StepSlideMove();
ADDRGP4 PMCSS_StepSlideMove
CALLV
pop
line 681
;681:		PMCSS_UpdateAntiLoop();
ADDRGP4 PMCSS_UpdateAntiLoop
CALLV
pop
line 682
;682:	}
ADDRGP4 $358
JUMPV
LABELV $357
line 683
;683:	else if (pmcss->ps->groundEntityNum != ENTITYNUM_NONE)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $385
line 684
;684:	{	// walking on ground
line 685
;685:		pmlcss.velocity[2] = 0; //!!! this is before the accel
ADDRGP4 pmlcss+12+8
CNSTF4 0
ASGNF4
line 686
;686:		PMCSS_Accelerate(wishdir, wishspeed, pmcss_accelerate);
ADDRLP4 32
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRGP4 pmcss_accelerate
INDIRF4
ARGF4
ADDRGP4 PMCSS_Accelerate
CALLV
pop
line 687
;687:		PMCSS_UpdateAntiLoop();
ADDRGP4 PMCSS_UpdateAntiLoop
CALLV
pop
line 691
;688:
;689:		// PGM	-- fix for negative trigger_gravity fields
;690:		//		pmlcss.velocity[2] = 0;
;691:		if (pmcss->ps->gravity > 0)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
LEI4 $389
line 692
;692:			pmlcss.velocity[2] = 0;
ADDRGP4 pmlcss+12+8
CNSTF4 0
ASGNF4
ADDRGP4 $390
JUMPV
LABELV $389
line 694
;693:		else
;694:			pmlcss.velocity[2] -= pmcss->ps->gravity * pmlcss.frametime;
ADDRLP4 56
ADDRGP4 pmlcss+12+8
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
SUBF4
ASGNF4
LABELV $390
line 697
;695:		// PGM
;696:
;697:		if (!pmlcss.velocity[0] && !pmlcss.velocity[1])
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRGP4 pmlcss+12
INDIRF4
ADDRLP4 60
INDIRF4
NEF4 $396
ADDRGP4 pmlcss+12+4
INDIRF4
ADDRLP4 60
INDIRF4
NEF4 $396
line 698
;698:			return;
ADDRGP4 $338
JUMPV
LABELV $396
line 699
;699:		PMCSS_StepSlideMove();
ADDRGP4 PMCSS_StepSlideMove
CALLV
pop
line 700
;700:		PMCSS_UpdateAntiLoop();
ADDRGP4 PMCSS_UpdateAntiLoop
CALLV
pop
line 701
;701:	}
ADDRGP4 $386
JUMPV
LABELV $385
line 703
;702:	else
;703:	{	// not on ground, so little effect on velocity
line 704
;704:		if (pmcss_airaccelerate)
ADDRGP4 pmcss_airaccelerate
INDIRF4
CNSTF4 0
EQF4 $401
line 705
;705:			PMCSS_AirAccelerate(wishdir, wishspeed, pmcss_accelerate);
ADDRLP4 32
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRGP4 pmcss_accelerate
INDIRF4
ARGF4
ADDRGP4 PMCSS_AirAccelerate
CALLV
pop
ADDRGP4 $402
JUMPV
LABELV $401
line 707
;706:		else
;707:			PMCSS_Accelerate(wishdir, wishspeed, 1);
ADDRLP4 32
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 PMCSS_Accelerate
CALLV
pop
LABELV $402
line 709
;708:
;709:		PMCSS_UpdateAntiLoop();
ADDRGP4 PMCSS_UpdateAntiLoop
CALLV
pop
line 712
;710:
;711:		// add gravity
;712:		pmlcss.velocity[2] -= pmcss->ps->gravity * pmlcss.frametime;
ADDRLP4 56
ADDRGP4 pmlcss+12+8
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
SUBF4
ASGNF4
line 713
;713:		PMCSS_StepSlideMove();
ADDRGP4 PMCSS_StepSlideMove
CALLV
pop
line 714
;714:		PMCSS_UpdateAntiLoop();
ADDRGP4 PMCSS_UpdateAntiLoop
CALLV
pop
line 715
;715:	}
LABELV $386
LABELV $358
line 716
;716:}
LABELV $338
endproc PMCSS_AirMove 64 12
export PMCSS_FancyGroundTrace
proc PMCSS_FancyGroundTrace 156 28
line 719
;717:
;718:
;719:void PMCSS_FancyGroundTrace(trace_t* results, const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end, int passEntityNum, int contentMask) {
line 722
;720:	vec3_t minsArr[4], maxsArr[4];
;721:	vec3_t oldEndPos;
;722:	float oldFraction = results->fraction;
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 724
;723:	int i;
;724:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $407
line 725
;725:		VectorCopy(mins,minsArr[i]);
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 52
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 726
;726:		VectorCopy(maxs,maxsArr[i]);
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRLP4 4
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 727
;727:	}
LABELV $408
line 724
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $407
line 728
;728:	maxsArr[0][0] = MIN(0, maxsArr[0][0]);
CNSTF4 0
ADDRLP4 4
INDIRF4
GEF4 $412
ADDRLP4 116
CNSTF4 0
ASGNF4
ADDRGP4 $413
JUMPV
LABELV $412
ADDRLP4 116
ADDRLP4 4
INDIRF4
ASGNF4
LABELV $413
ADDRLP4 4
ADDRLP4 116
INDIRF4
ASGNF4
line 729
;729:	maxsArr[0][1] = MIN(0, maxsArr[0][1]);
CNSTF4 0
ADDRLP4 4+4
INDIRF4
GEF4 $418
ADDRLP4 120
CNSTF4 0
ASGNF4
ADDRGP4 $419
JUMPV
LABELV $418
ADDRLP4 120
ADDRLP4 4+4
INDIRF4
ASGNF4
LABELV $419
ADDRLP4 4+4
ADDRLP4 120
INDIRF4
ASGNF4
line 730
;730:	minsArr[1][0] = MAX(0, maxsArr[1][0]);
CNSTF4 0
ADDRLP4 4+12
INDIRF4
LEF4 $424
ADDRLP4 124
CNSTF4 0
ASGNF4
ADDRGP4 $425
JUMPV
LABELV $424
ADDRLP4 124
ADDRLP4 4+12
INDIRF4
ASGNF4
LABELV $425
ADDRLP4 52+12
ADDRLP4 124
INDIRF4
ASGNF4
line 731
;731:	minsArr[1][1] = MAX(0, maxsArr[1][1]);
CNSTF4 0
ADDRLP4 4+12+4
INDIRF4
LEF4 $433
ADDRLP4 128
CNSTF4 0
ASGNF4
ADDRGP4 $434
JUMPV
LABELV $433
ADDRLP4 128
ADDRLP4 4+12+4
INDIRF4
ASGNF4
LABELV $434
ADDRLP4 52+12+4
ADDRLP4 128
INDIRF4
ASGNF4
line 732
;732:	maxsArr[2][0] = MIN(0, maxsArr[2][0]);
CNSTF4 0
ADDRLP4 4+24
INDIRF4
GEF4 $439
ADDRLP4 132
CNSTF4 0
ASGNF4
ADDRGP4 $440
JUMPV
LABELV $439
ADDRLP4 132
ADDRLP4 4+24
INDIRF4
ASGNF4
LABELV $440
ADDRLP4 4+24
ADDRLP4 132
INDIRF4
ASGNF4
line 733
;733:	minsArr[2][1] = MAX(0, minsArr[2][1]);
CNSTF4 0
ADDRLP4 52+24+4
INDIRF4
LEF4 $448
ADDRLP4 136
CNSTF4 0
ASGNF4
ADDRGP4 $449
JUMPV
LABELV $448
ADDRLP4 136
ADDRLP4 52+24+4
INDIRF4
ASGNF4
LABELV $449
ADDRLP4 52+24+4
ADDRLP4 136
INDIRF4
ASGNF4
line 734
;734:	minsArr[3][0] = MAX(0, minsArr[3][0]);
CNSTF4 0
ADDRLP4 52+36
INDIRF4
LEF4 $454
ADDRLP4 140
CNSTF4 0
ASGNF4
ADDRGP4 $455
JUMPV
LABELV $454
ADDRLP4 140
ADDRLP4 52+36
INDIRF4
ASGNF4
LABELV $455
ADDRLP4 52+36
ADDRLP4 140
INDIRF4
ASGNF4
line 735
;735:	maxsArr[3][1] = MIN(0, maxsArr[3][1]);
CNSTF4 0
ADDRLP4 4+36+4
INDIRF4
GEF4 $463
ADDRLP4 144
CNSTF4 0
ASGNF4
ADDRGP4 $464
JUMPV
LABELV $463
ADDRLP4 144
ADDRLP4 4+36+4
INDIRF4
ASGNF4
LABELV $464
ADDRLP4 4+36+4
ADDRLP4 144
INDIRF4
ASGNF4
line 736
;736:	VectorCopy(results->endpos, oldEndPos);
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 738
;737:
;738:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $465
line 739
;739:		pm->trace(results,start,minsArr[i],maxsArr[i],end,passEntityNum,contentMask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 148
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 148
INDIRI4
ADDRLP4 52
ADDP4
ARGP4
ADDRLP4 148
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 740
;740:		if (results->entityNum != ENTITYNUM_NONE && results->plane.normal[2] >= 0.7) {
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $469
ADDRLP4 152
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1060320051
LTF4 $469
line 741
;741:			goto done;
ADDRGP4 $471
JUMPV
LABELV $469
line 743
;742:		}
;743:	}
LABELV $466
line 738
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $465
LABELV $471
line 746
;744:
;745:done:
;746:	VectorCopy(oldEndPos, results->endpos);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 100
INDIRB
ASGNB 12
line 747
;747:	results->fraction = oldFraction;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 112
INDIRF4
ASGNF4
line 748
;748:	return;
LABELV $406
endproc PMCSS_FancyGroundTrace 156 28
export PMCSS_CatagorizePosition
proc PMCSS_CatagorizePosition 1164 28
line 757
;749:}
;750:
;751:/*
;752:=============
;753:PMCSS_CatagorizePosition
;754:=============
;755:*/
;756:void PMCSS_CatagorizePosition(void)
;757:{
line 769
;758:	vec3_t		point;
;759:	int			cont;
;760:	trace_t		trace;
;761:	int			sample1;
;762:	int			sample2;
;763:	vec3_t		flatforward,spot;
;764:
;765:	// if the player hull point one unit down is solid, the player
;766:	// is on ground
;767:
;768:	// see if standing on something solid	
;769:	point[0] = pmlcss.origin[0];
ADDRLP4 1080
ADDRGP4 pmlcss
INDIRF4
ASGNF4
line 770
;770:	point[1] = pmlcss.origin[1];
ADDRLP4 1080+4
ADDRGP4 pmlcss+4
INDIRF4
ASGNF4
line 775
;771:
;772:	//
;773:	// get waterlevel, accounting for ducking
;774:	//
;775:	pmcss->waterlevel = 0;
ADDRGP4 pmcss
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 776
;776:	pmcss->watertype = 0;
ADDRGP4 pmcss
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 778
;777:
;778:	sample2 = pmcss->ps->viewheight - pmcss->mins[2];
ADDRLP4 1128
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1120
ADDRLP4 1128
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 1128
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 779
;779:	sample1 = sample2 / 2;
ADDRLP4 1124
ADDRLP4 1120
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 781
;780:
;781:	point[2] = pmlcss.origin[2] + pmcss->mins[2] + 1;
ADDRLP4 1080+8
ADDRGP4 pmlcss+8
INDIRF4
ADDRGP4 pmcss
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 782
;782:	cont = pmcss->pointcontents(point, pmcss->ps->clientNum);
ADDRLP4 1080
ARGP4
ADDRLP4 1132
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1136
ADDRLP4 1132
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1104
ADDRLP4 1136
INDIRI4
ASGNI4
line 784
;783:
;784:	if (cont & MASK_WATER)
ADDRLP4 1104
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
EQI4 $477
line 785
;785:	{
line 786
;786:		pmcss->watertype = cont;
ADDRGP4 pmcss
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 1104
INDIRI4
ASGNI4
line 787
;787:		pmcss->waterlevel = 1;
ADDRGP4 pmcss
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 788
;788:		point[2] = pmlcss.origin[2] + pmcss->mins[2] + sample1;
ADDRLP4 1080+8
ADDRGP4 pmlcss+8
INDIRF4
ADDRGP4 pmcss
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ADDF4
ADDRLP4 1124
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 789
;789:		cont = pmcss->pointcontents(point, pmcss->ps->clientNum);
ADDRLP4 1080
ARGP4
ADDRLP4 1140
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1144
ADDRLP4 1140
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1104
ADDRLP4 1144
INDIRI4
ASGNI4
line 790
;790:		if (cont & MASK_WATER)
ADDRLP4 1104
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
EQI4 $481
line 791
;791:		{
line 792
;792:			pmcss->waterlevel = 2;
ADDRGP4 pmcss
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 2
ASGNI4
line 793
;793:			point[2] = pmlcss.origin[2] + pmcss->mins[2] + sample2;
ADDRLP4 1080+8
ADDRGP4 pmlcss+8
INDIRF4
ADDRGP4 pmcss
INDIRP4
CNSTI4 184
ADDP4
INDIRF4
ADDF4
ADDRLP4 1120
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 794
;794:			cont = pmcss->pointcontents(point, pmcss->ps->clientNum);
ADDRLP4 1080
ARGP4
ADDRLP4 1148
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1152
ADDRLP4 1148
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1104
ADDRLP4 1152
INDIRI4
ASGNI4
line 795
;795:			if (cont & MASK_WATER)
ADDRLP4 1104
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
EQI4 $485
line 796
;796:				pmcss->waterlevel = 3;
ADDRGP4 pmcss
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 3
ASGNI4
LABELV $485
line 797
;797:		}
LABELV $481
line 798
;798:	}
LABELV $477
line 800
;799:
;800:	if (pm->ps->pm_type == PM_SPECTATOR) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $487
line 801
;801:		return;
ADDRGP4 $472
JUMPV
LABELV $487
line 804
;802:	}
;803:
;804:	pmlcss.ladder = qfalse;
ADDRGP4 pmlcss+124
CNSTI4 0
ASGNI4
line 807
;805:
;806:	// check for ladder
;807:	flatforward[0] = pmlcss.forward[0];
ADDRLP4 1092
ADDRGP4 pmlcss+24
INDIRF4
ASGNF4
line 808
;808:	flatforward[1] = pmlcss.forward[1];
ADDRLP4 1092+4
ADDRGP4 pmlcss+24+4
INDIRF4
ASGNF4
line 809
;809:	flatforward[2] = 0;
ADDRLP4 1092+8
CNSTF4 0
ASGNF4
line 810
;810:	VectorNormalize(flatforward);
ADDRLP4 1092
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 812
;811:
;812:	VectorMA(pmlcss.origin, 1, flatforward, spot);
ADDRLP4 1140
CNSTF4 1065353216
ASGNF4
ADDRLP4 1108
ADDRGP4 pmlcss
INDIRF4
ADDRLP4 1140
INDIRF4
ADDRLP4 1092
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1108+4
ADDRGP4 pmlcss+4
INDIRF4
ADDRLP4 1140
INDIRF4
ADDRLP4 1092+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1108+8
ADDRGP4 pmlcss+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 1092+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 813
;813:	pmcss->trace(&trace, pmlcss.origin, pmcss->mins, pmcss->maxs, spot, pmcss->ps->clientNum, pmcss->tracemask);
ADDRLP4 0
ARGP4
ADDRGP4 pmlcss
ARGP4
ADDRLP4 1144
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1144
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 1144
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 1108
ARGP4
ADDRLP4 1144
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1144
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ARGI4
ADDRLP4 1144
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 814
;814:	if ((trace.fraction < 1) && (trace.contents & CONTENTS_LADDER))
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $501
ADDRLP4 0+48
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $501
line 815
;815:		pmlcss.ladder = qtrue;
ADDRGP4 pmlcss+124
CNSTI4 1
ASGNI4
LABELV $501
line 819
;816:
;817:
;818:
;819:	point[2] = pmlcss.origin[2] - 2.0;
ADDRLP4 1080+8
ADDRGP4 pmlcss+8
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
line 821
;820:
;821:	if (pmlcss.velocity[2] > 140 || pmlcss.velocity[2]>0 && pmlcss.ladder) //!!ZOID changed from 100 to 180 (ramp accel)
ADDRGP4 pmlcss+12+8
INDIRF4
CNSTF4 1124859904
GTF4 $515
ADDRGP4 pmlcss+12+8
INDIRF4
CNSTF4 0
LEF4 $508
ADDRGP4 pmlcss+124
INDIRI4
CNSTI4 0
EQI4 $508
LABELV $515
line 822
;822:	{
line 824
;823:		//pmcss->ps->pm_flags &= ~PMF_ON_GROUND;
;824:		pmcss->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 825
;825:	}
ADDRGP4 $509
JUMPV
LABELV $508
line 827
;826:	else
;827:	{
line 828
;828:		qboolean ground = qtrue;
ADDRLP4 1148
CNSTI4 1
ASGNI4
line 829
;829:		pmcss->trace(&trace, pmlcss.origin, pmcss->mins, pmcss->maxs, point, pmcss->ps->clientNum, pmcss->tracemask);
ADDRLP4 0
ARGP4
ADDRGP4 pmlcss
ARGP4
ADDRLP4 1152
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 1152
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 1080
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
CNSTI4 208
ADDP4
INDIRI4
ARGI4
ADDRLP4 1152
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 830
;830:		pmlcss.groundplane = trace.plane;
ADDRGP4 pmlcss+68
ADDRLP4 0+24
INDIRB
ASGNB 20
line 832
;831:		//pmlcss.groundsurface = trace.surface;
;832:		pmlcss.surfaceFlags = trace.surfaceFlags;
ADDRGP4 pmlcss+92
ADDRLP4 0+44
INDIRI4
ASGNI4
line 833
;833:		pmlcss.groundcontents = trace.contents;
ADDRGP4 pmlcss+88
ADDRLP4 0+48
INDIRI4
ASGNI4
line 834
;834:		pmlcss.groundFound = trace.entityNum != ENTITYNUM_NONE; // is this right?
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
EQI4 $525
ADDRLP4 1156
CNSTI4 1
ASGNI4
ADDRGP4 $526
JUMPV
LABELV $525
ADDRLP4 1156
CNSTI4 0
ASGNI4
LABELV $526
ADDRGP4 pmlcss+96
ADDRLP4 1156
INDIRI4
ASGNI4
line 836
;835:
;836:		if (trace.entityNum == ENTITYNUM_NONE || trace.plane.normal[2] < 0.7)
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
EQI4 $532
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $527
LABELV $532
line 837
;837:		{
line 838
;838:			PMCSS_FancyGroundTrace(&trace, pmlcss.origin, pmcss->mins, pmcss->maxs, point, pmcss->ps->clientNum, pmcss->tracemask);
ADDRLP4 0
ARGP4
ADDRGP4 pmlcss
ARGP4
ADDRLP4 1160
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 1160
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 1080
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
CNSTI4 208
ADDP4
INDIRI4
ARGI4
ADDRGP4 PMCSS_FancyGroundTrace
CALLV
pop
line 839
;839:			if (trace.entityNum == ENTITYNUM_NONE || trace.plane.normal[2] < 0.7)
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
EQI4 $538
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $533
LABELV $538
line 840
;840:			{
line 841
;841:				pmcss->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 842
;842:				ground = qfalse;
ADDRLP4 1148
CNSTI4 0
ASGNI4
line 843
;843:			}
LABELV $533
line 844
;844:		}
LABELV $527
line 845
;845:		if(ground)
ADDRLP4 1148
INDIRI4
CNSTI4 0
EQI4 $539
line 846
;846:		{
line 847
;847:			int oldGroundEntityNum = pmcss->ps->groundEntityNum;
ADDRLP4 1160
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 848
;848:			pmcss->ps->groundEntityNum = trace.entityNum;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 851
;849:
;850:			// hitting solid ground will end a waterjump
;851:			pmcss->ps->rocketLockTime = 0;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 853
;852:
;853:			if (pmcss->ps->groundEntityNum != ENTITYNUM_WORLD)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1022
EQI4 $542
line 854
;854:			{
line 855
;855:				PMCSS_AddTouchEnt(pmcss->ps->groundEntityNum);
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 PMCSS_AddTouchEnt
CALLV
pop
line 856
;856:			}
LABELV $542
line 857
;857:		}
LABELV $539
line 859
;858:
;859:	}
LABELV $509
line 863
;860:
;861:	
;862:
;863:}
LABELV $472
endproc PMCSS_CatagorizePosition 1164 28
export PMCSS_CheckJump
proc PMCSS_CheckJump 12 0
line 872
;864:
;865:
;866:/*
;867:=============
;868:PMCSS_CheckJump
;869:=============
;870:*/
;871:void PMCSS_CheckJump(void)
;872:{
line 873
;873:	if (pmcss->ps->pm_flags & PMF_TIME_LAND)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $545
line 874
;874:	{	// hasn't been long enough since landing to jump again
line 875
;875:		return;
ADDRGP4 $544
JUMPV
LABELV $545
line 878
;876:	}
;877:
;878:	if (pmlcss.upmove < 10)
ADDRGP4 pmlcss+108
INDIRF4
CNSTF4 1092616192
GEF4 $547
line 879
;879:	{	// not holding jump
line 880
;880:		pmcss->ps->pm_flags &= ~PMF_JUMP_HELD;
ADDRLP4 0
ADDRGP4 pmcss
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
CNSTI4 -3
BANDI4
ASGNI4
line 881
;881:		return;
ADDRGP4 $544
JUMPV
LABELV $547
line 885
;882:	}
;883:
;884:	// must wait for jump to be released
;885:	if (pmcss->ps->pm_flags & PMF_JUMP_HELD)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $550
line 886
;886:		return;
ADDRGP4 $544
JUMPV
LABELV $550
line 888
;887:
;888:	if (pmcss->ps->pm_type == PM_DEAD)
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRGP4 pmcss
INDIRP4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $552
line 889
;889:		return;
ADDRGP4 $544
JUMPV
LABELV $552
line 891
;890:
;891:	if (pmcss->waterlevel >= 2)
ADDRGP4 pmcss
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LTI4 $554
line 892
;892:	{	// swimming, not jumping
line 893
;893:		pmcss->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 895
;894:
;895:		if (pmlcss.velocity[2] <= -300)
ADDRGP4 pmlcss+12+8
INDIRF4
CNSTF4 3281387520
GTF4 $556
line 896
;896:			return;
ADDRGP4 $544
JUMPV
LABELV $556
line 898
;897:
;898:		if (pmcss->watertype == CONTENTS_WATER)
ADDRGP4 pmcss
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 4
NEI4 $560
line 899
;899:			pmlcss.velocity[2] = 100;
ADDRGP4 pmlcss+12+8
CNSTF4 1120403456
ASGNF4
ADDRGP4 $544
JUMPV
LABELV $560
line 900
;900:		else if (pmcss->watertype == CONTENTS_SLIME)
ADDRGP4 pmcss
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 131072
NEI4 $564
line 901
;901:			pmlcss.velocity[2] = 80;
ADDRGP4 pmlcss+12+8
CNSTF4 1117782016
ASGNF4
ADDRGP4 $544
JUMPV
LABELV $564
line 903
;902:		else
;903:			pmlcss.velocity[2] = 50;
ADDRGP4 pmlcss+12+8
CNSTF4 1112014848
ASGNF4
line 904
;904:		return;
ADDRGP4 $544
JUMPV
LABELV $554
line 907
;905:	}
;906:
;907:	if (pmcss->ps->groundEntityNum == ENTITYNUM_NONE)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $570
line 908
;908:		return;		// in air, so no effect
ADDRGP4 $544
JUMPV
LABELV $570
line 910
;909:
;910:	pmcss->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 4
ADDRGP4 pmcss
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
CNSTI4 2
BORI4
ASGNI4
line 912
;911:
;912:	pmcss->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 913
;913:	pmlcss.velocity[2] += 270;
ADDRLP4 8
ADDRGP4 pmlcss+12+8
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1132920832
ADDF4
ASGNF4
line 914
;914:	if (pmlcss.velocity[2] < 270)
ADDRGP4 pmlcss+12+8
INDIRF4
CNSTF4 1132920832
GEF4 $574
line 915
;915:		pmlcss.velocity[2] = 270;
ADDRGP4 pmlcss+12+8
CNSTF4 1132920832
ASGNF4
LABELV $574
line 916
;916:}
LABELV $544
endproc PMCSS_CheckJump 12 0
export PMCSS_CheckSpecialMovement
proc PMCSS_CheckSpecialMovement 1132 8
line 925
;917:
;918:
;919:/*
;920:=============
;921:PMCSS_CheckSpecialMovement
;922:=============
;923:*/
;924:void PMCSS_CheckSpecialMovement(void)
;925:{
line 931
;926:	vec3_t	spot;
;927:	int		cont;
;928:	vec3_t	flatforward;
;929:	trace_t	trace;
;930:
;931:	if (pmcss->ps->pm_time)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $581
line 932
;932:		return;
ADDRGP4 $580
JUMPV
LABELV $581
line 934
;933:
;934:	flatforward[0] = pmlcss.forward[0];
ADDRLP4 0
ADDRGP4 pmlcss+24
INDIRF4
ASGNF4
line 935
;935:	flatforward[1] = pmlcss.forward[1];
ADDRLP4 0+4
ADDRGP4 pmlcss+24+4
INDIRF4
ASGNF4
line 936
;936:	flatforward[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 937
;937:	VectorNormalize(flatforward);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 941
;938:
;939:
;940:	// check for water jump
;941:	if (pmcss->waterlevel != 2)
ADDRGP4 pmcss
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
EQI4 $588
line 942
;942:		return;
ADDRGP4 $580
JUMPV
LABELV $588
line 944
;943:
;944:	VectorMA(pmlcss.origin, 30, flatforward, spot);
ADDRLP4 1108
CNSTF4 1106247680
ASGNF4
ADDRLP4 12
ADDRGP4 pmlcss
INDIRF4
ADDRLP4 1108
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 pmlcss+4
INDIRF4
ADDRLP4 1108
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 pmlcss+8
INDIRF4
CNSTF4 1106247680
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 945
;945:	spot[2] += 4;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 946
;946:	cont = pmcss->pointcontents(spot, pmcss->ps->clientNum);
ADDRLP4 12
ARGP4
ADDRLP4 1112
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1116
ADDRLP4 1112
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 1116
INDIRI4
ASGNI4
line 947
;947:	if (!(cont & CONTENTS_SOLID))
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $597
line 948
;948:		return;
ADDRGP4 $580
JUMPV
LABELV $597
line 950
;949:
;950:	spot[2] += 16;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 951
;951:	cont = pmcss->pointcontents(spot, pmcss->ps->clientNum);
ADDRLP4 12
ARGP4
ADDRLP4 1120
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1124
ADDRLP4 1120
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 1124
INDIRI4
ASGNI4
line 952
;952:	if (cont)
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $600
line 953
;953:		return;
ADDRGP4 $580
JUMPV
LABELV $600
line 955
;954:	// jump out of water
;955:	VectorScale(flatforward, 50, pmlcss.velocity);
ADDRGP4 pmlcss+12
CNSTF4 1112014848
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlcss+12+4
CNSTF4 1112014848
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlcss+12+8
CNSTF4 1112014848
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 956
;956:	pmlcss.velocity[2] = 350;
ADDRGP4 pmlcss+12+8
CNSTF4 1135542272
ASGNF4
line 958
;957:
;958:	pmcss->ps->pm_flags |= PMF_TIME_WATERJUMP;
ADDRLP4 1128
ADDRGP4 pmcss
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
CNSTI4 256
BORI4
ASGNI4
line 959
;959:	pmcss->ps->pm_time = 255;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 255
ASGNI4
line 960
;960:}
LABELV $580
endproc PMCSS_CheckSpecialMovement 1132 8
export PMCSS_FlyMove
proc PMCSS_FlyMove 1192 28
line 969
;961:
;962:
;963:/*
;964:===============
;965:PMCSS_FlyMove
;966:===============
;967:*/
;968:void PMCSS_FlyMove(qboolean doclip)
;969:{
line 980
;970:	float	speed, drop, friction, control, newspeed;
;971:	float	currentspeed, addspeed, accelspeed;
;972:	int			i;
;973:	vec3_t		wishvel;
;974:	float		fmove, smove;
;975:	vec3_t		wishdir;
;976:	float		wishspeed;
;977:	vec3_t		end;
;978:	trace_t	trace;
;979:
;980:	pmcss->ps->viewheight = 22;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 22
ASGNI4
line 984
;981:
;982:	// friction
;983:
;984:	speed = VectorLength(pmlcss.velocity);
ADDRGP4 pmlcss+12
ARGP4
ADDRLP4 1164
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 1164
INDIRF4
ASGNF4
line 985
;985:	if (speed < 1)
ADDRLP4 56
INDIRF4
CNSTF4 1065353216
GEF4 $613
line 986
;986:	{
line 987
;987:		VectorCopy(vec3_origin, pmlcss.velocity);
ADDRGP4 pmlcss+12
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 988
;988:	}
ADDRGP4 $614
JUMPV
LABELV $613
line 990
;989:	else
;990:	{
line 991
;991:		drop = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 993
;992:
;993:		friction = pmcss_friction * 1.5;	// extra friction
ADDRLP4 76
CNSTF4 1069547520
ADDRGP4 pmcss_friction
INDIRF4
MULF4
ASGNF4
line 994
;994:		control = speed < pmcss_stopspeed ? pmcss_stopspeed : speed;
ADDRLP4 56
INDIRF4
ADDRGP4 pmcss_stopspeed
INDIRF4
GEF4 $617
ADDRLP4 1168
ADDRGP4 pmcss_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $618
JUMPV
LABELV $617
ADDRLP4 1168
ADDRLP4 56
INDIRF4
ASGNF4
LABELV $618
ADDRLP4 80
ADDRLP4 1168
INDIRF4
ASGNF4
line 995
;995:		drop += control * friction * pmlcss.frametime;
ADDRLP4 72
ADDRLP4 72
INDIRF4
ADDRLP4 80
INDIRF4
ADDRLP4 76
INDIRF4
MULF4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
ADDF4
ASGNF4
line 998
;996:
;997:		// scale the velocity
;998:		newspeed = speed - drop;
ADDRLP4 64
ADDRLP4 56
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
ASGNF4
line 999
;999:		if (newspeed < 0)
ADDRLP4 64
INDIRF4
CNSTF4 0
GEF4 $620
line 1000
;1000:			newspeed = 0;
ADDRLP4 64
CNSTF4 0
ASGNF4
LABELV $620
line 1001
;1001:		newspeed /= speed;
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRLP4 56
INDIRF4
DIVF4
ASGNF4
line 1003
;1002:
;1003:		VectorScale(pmlcss.velocity, newspeed, pmlcss.velocity);
ADDRGP4 pmlcss+12
ADDRGP4 pmlcss+12
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlcss+12+4
ADDRGP4 pmlcss+12+4
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlcss+12+8
ADDRGP4 pmlcss+12+8
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
line 1004
;1004:	}
LABELV $614
line 1007
;1005:
;1006:	// accelerate
;1007:	fmove = pmlcss.forwardmove;
ADDRLP4 32
ADDRGP4 pmlcss+100
INDIRF4
ASGNF4
line 1008
;1008:	smove = pmlcss.rightmove;
ADDRLP4 36
ADDRGP4 pmlcss+104
INDIRF4
ASGNF4
line 1010
;1009:
;1010:	VectorNormalize(pmlcss.forward);
ADDRGP4 pmlcss+24
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1011
;1011:	VectorNormalize(pmlcss.right);
ADDRGP4 pmlcss+36
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1013
;1012:
;1013:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $636
line 1014
;1014:		wishvel[i] = pmlcss.forward[i] * fmove + pmlcss.right[i] * smove;
ADDRLP4 1168
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1168
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 1168
INDIRI4
ADDRGP4 pmlcss+24
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 1168
INDIRI4
ADDRGP4 pmlcss+36
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $637
line 1013
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $636
line 1015
;1015:	wishvel[2] += pmlcss.upmove;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRGP4 pmlcss+108
INDIRF4
ADDF4
ASGNF4
line 1017
;1016:
;1017:	VectorCopy(wishvel, wishdir);
ADDRLP4 16
ADDRLP4 4
INDIRB
ASGNB 12
line 1018
;1018:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 16
ARGP4
ADDRLP4 1172
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 1172
INDIRF4
ASGNF4
line 1023
;1019:
;1020:	//
;1021:	// clamp to server defined max speed
;1022:	//
;1023:	if (wishspeed > pmcss_maxspeed)
ADDRLP4 40
INDIRF4
ADDRGP4 pmcss_maxspeed
INDIRF4
LEF4 $644
line 1024
;1024:	{
line 1025
;1025:		VectorScale(wishvel, pmcss_maxspeed / wishspeed, wishvel);
ADDRLP4 1176
ADDRGP4 pmcss_maxspeed
INDIRF4
ADDRLP4 40
INDIRF4
DIVF4
ASGNF4
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 1176
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 1176
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRGP4 pmcss_maxspeed
INDIRF4
ADDRLP4 40
INDIRF4
DIVF4
MULF4
ASGNF4
line 1026
;1026:		wishspeed = pmcss_maxspeed;
ADDRLP4 40
ADDRGP4 pmcss_maxspeed
INDIRF4
ASGNF4
line 1027
;1027:	}
LABELV $644
line 1030
;1028:
;1029:
;1030:	currentspeed = DotProduct(pmlcss.velocity, wishdir);
ADDRLP4 68
ADDRGP4 pmlcss+12
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRGP4 pmlcss+12+4
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ADDRGP4 pmlcss+12+8
INDIRF4
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1031
;1031:	addspeed = wishspeed - currentspeed;
ADDRLP4 60
ADDRLP4 40
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
ASGNF4
line 1032
;1032:	if (addspeed <= 0)
ADDRLP4 60
INDIRF4
CNSTF4 0
GTF4 $657
line 1033
;1033:		return;
ADDRGP4 $611
JUMPV
LABELV $657
line 1034
;1034:	accelspeed = pmcss_accelerate * pmlcss.frametime * wishspeed;
ADDRLP4 28
ADDRGP4 pmcss_accelerate
INDIRF4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 1035
;1035:	if (accelspeed > addspeed)
ADDRLP4 28
INDIRF4
ADDRLP4 60
INDIRF4
LEF4 $660
line 1036
;1036:		accelspeed = addspeed;
ADDRLP4 28
ADDRLP4 60
INDIRF4
ASGNF4
LABELV $660
line 1038
;1037:
;1038:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $662
line 1039
;1039:		pmlcss.velocity[i] += accelspeed * wishdir[i];
ADDRLP4 1176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1180
ADDRLP4 1176
INDIRI4
ADDRGP4 pmlcss+12
ADDP4
ASGNP4
ADDRLP4 1180
INDIRP4
ADDRLP4 1180
INDIRP4
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 1176
INDIRI4
ADDRLP4 16
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $663
line 1038
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $662
line 1041
;1040:
;1041:	if (doclip) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $667
line 1042
;1042:		for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $669
line 1043
;1043:			end[i] = pmlcss.origin[i] + pmlcss.frametime * pmlcss.velocity[i];
ADDRLP4 1184
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1184
INDIRI4
ADDRLP4 44
ADDP4
ADDRLP4 1184
INDIRI4
ADDRGP4 pmlcss
ADDP4
INDIRF4
ADDRGP4 pmlcss+60
INDIRF4
ADDRLP4 1184
INDIRI4
ADDRGP4 pmlcss+12
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $670
line 1042
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $669
line 1045
;1044:
;1045:		pmcss->trace(&trace, pmlcss.origin, pmcss->mins, pmcss->maxs, end, pmcss->ps->clientNum, pmcss->tracemask);
ADDRLP4 84
ARGP4
ADDRGP4 pmlcss
ARGP4
ADDRLP4 1188
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1188
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 1188
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 1188
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1188
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ARGI4
ADDRLP4 1188
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 1047
;1046:
;1047:		VectorCopy(trace.endpos, pmlcss.origin);
ADDRGP4 pmlcss
ADDRLP4 84+12
INDIRB
ASGNB 12
line 1048
;1048:	}
ADDRGP4 $668
JUMPV
LABELV $667
line 1049
;1049:	else {
line 1051
;1050:		// move
;1051:		VectorMA(pmlcss.origin, pmlcss.frametime, pmlcss.velocity, pmlcss.origin);
ADDRLP4 1184
ADDRGP4 pmlcss
ASGNP4
ADDRLP4 1184
INDIRP4
ADDRLP4 1184
INDIRP4
INDIRF4
ADDRGP4 pmlcss+12
INDIRF4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 pmlcss+4
ADDRGP4 pmlcss+4
INDIRF4
ADDRGP4 pmlcss+12+4
INDIRF4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 pmlcss+8
ADDRGP4 pmlcss+8
INDIRF4
ADDRGP4 pmlcss+12+8
INDIRF4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
ADDF4
ASGNF4
line 1052
;1052:	}
LABELV $668
line 1053
;1053:}
LABELV $611
endproc PMCSS_FlyMove 1192 28
export smooth0To1
proc smooth0To1 4 0
line 1055
;1054:
;1055:float smooth0To1(float input) {
line 1056
;1056:	return 3.0f * input * input - 2.0f * input * input * input;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 0
INDIRF4
MULF4
SUBF4
RETF4
LABELV $688
endproc smooth0To1 4 0
export PMCSS_SetViewHeight
proc PMCSS_SetViewHeight 4 0
line 1059
;1057:}
;1058:
;1059:void PMCSS_SetViewHeight(float ratio) {
line 1061
;1060:
;1061:	pm->ps->viewheight = 47.0f * ratio + 64.0f * (1.0f - ratio);
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTF4 1111228416
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1115684864
CNSTF4 1065353216
ADDRLP4 0
INDIRF4
SUBF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1062
;1062:}
LABELV $689
endproc PMCSS_SetViewHeight 4 0
export PMCSS_CheckDuck
proc PMCSS_CheckDuck 1120 4
line 1073
;1063:
;1064:
;1065:/*
;1066:==============
;1067:PMCSS_CheckDuck
;1068:
;1069:Sets mins, maxs, and pmcss->ps->viewheight
;1070:==============
;1071:*/
;1072:void PMCSS_CheckDuck(void)
;1073:{
line 1075
;1074:	trace_t	trace;
;1075:	int buttonsDiff = pmcss->oldbuttons ^ pmcss->cmd.buttons;
ADDRLP4 1092
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1092
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 1092
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
BXORI4
ASGNI4
line 1076
;1076:	int buttonsNew = buttonsDiff & pmcss->cmd.buttons;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 pmcss
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
BANDI4
ASGNI4
line 1077
;1077:	int buttonsOld = buttonsDiff & pmcss->oldbuttons;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRGP4 pmcss
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
BANDI4
ASGNI4
line 1080
;1078:
;1079:
;1080:	if (pm->ps->fd.forceRageRecoveryTime) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1172
ADDP4
INDIRI4
CNSTI4 0
EQI4 $691
line 1081
;1081:		int crouchTime = 1000 - pm->ps->fd.forceRageRecoveryTime;
ADDRLP4 1096
CNSTI4 1000
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1172
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1082
;1082:		if (crouchTime < 0) {
ADDRLP4 1096
INDIRI4
CNSTI4 0
GEI4 $693
line 1083
;1083:			crouchTime = 0;
ADDRLP4 1096
CNSTI4 0
ASGNI4
line 1084
;1084:		}
LABELV $693
line 1085
;1085:		if (crouchTime > 200) {
ADDRLP4 1096
INDIRI4
CNSTI4 200
LEI4 $695
line 1086
;1086:			pm->ps->fd.forceRageRecoveryTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1172
ADDP4
CNSTI4 0
ASGNI4
line 1087
;1087:			PMCSS_SetViewHeight(0);
CNSTF4 0
ARGF4
ADDRGP4 PMCSS_SetViewHeight
CALLV
pop
line 1088
;1088:		}
ADDRGP4 $696
JUMPV
LABELV $695
line 1089
;1089:		else {
line 1090
;1090:			PMCSS_SetViewHeight(smooth0To1(1.0f-((float)crouchTime/200.0f)));
CNSTF4 1065353216
ADDRLP4 1096
INDIRI4
CVIF4 4
CNSTF4 1128792064
DIVF4
SUBF4
ARGF4
ADDRLP4 1100
ADDRGP4 smooth0To1
CALLF4
ASGNF4
ADDRLP4 1100
INDIRF4
ARGF4
ADDRGP4 PMCSS_SetViewHeight
CALLV
pop
line 1091
;1091:		}
LABELV $696
line 1092
;1092:	}
LABELV $691
line 1094
;1093:
;1094:	if (pm->ps->pm_type == PM_DEAD) {
ADDRLP4 1096
CNSTI4 4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 1096
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1096
INDIRI4
NEI4 $697
line 1095
;1095:		return;
ADDRGP4 $690
JUMPV
LABELV $697
line 1098
;1096:	}
;1097:
;1098:	if (!pmcss->crouchSpeedReduced && (pm->ps->pm_flags & PMF_DUCKED) && pm->ps->groundEntityNum != ENTITYNUM_NONE) { // will this break with pmove_fixed?
ADDRLP4 1100
CNSTI4 0
ASGNI4
ADDRGP4 pmcss
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRLP4 1100
INDIRI4
NEI4 $699
ADDRLP4 1104
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1100
INDIRI4
EQI4 $699
ADDRLP4 1104
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $699
line 1099
;1099:		pmcss->cmd.forwardmove /= 3;
ADDRLP4 1108
ADDRGP4 pmcss
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI1
CVII4 1
CNSTI4 3
DIVI4
CVII1 4
ASGNI1
line 1100
;1100:		pmcss->cmd.rightmove /= 3;
ADDRLP4 1112
ADDRGP4 pmcss
INDIRP4
CNSTI4 29
ADDP4
ASGNP4
ADDRLP4 1112
INDIRP4
ADDRLP4 1112
INDIRP4
INDIRI1
CVII4 1
CNSTI4 3
DIVI4
CVII1 4
ASGNI1
line 1101
;1101:		pmcss->cmd.upmove /= 3;
ADDRLP4 1116
ADDRGP4 pmcss
INDIRP4
CNSTI4 30
ADDP4
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRI1
CVII4 1
CNSTI4 3
DIVI4
CVII1 4
ASGNI1
line 1102
;1102:		pmcss->crouchSpeedReduced = qtrue;
ADDRGP4 pmcss
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 1
ASGNI4
line 1103
;1103:	}
LABELV $699
line 1105
;1104:
;1105:	if (pmcss->cmd.buttons) {
ADDRGP4 pmcss
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $701
line 1107
;1106:
;1107:	}
LABELV $701
line 1152
;1108:
;1109:	/*
;1110:
;1111:
;1112:	pmcss->mins[0] = -16;
;1113:	pmcss->mins[1] = -16;
;1114:
;1115:	pmcss->maxs[0] = 16;
;1116:	pmcss->maxs[1] = 16;
;1117:
;1118:
;1119:	pmcss->mins[2] = -24;
;1120:
;1121:	if (pmcss->ps->pm_type == PM_DEAD)
;1122:	{
;1123:		pmcss->ps->pm_flags |= PMF_DUCKED;
;1124:	}
;1125:	//else if (pmlcss.upmove < 0 && (pmcss->ps->pm_flags & PMF_ON_GROUND))
;1126:	else if (pmlcss.upmove < 0 && (pmcss->ps->groundEntityNum != ENTITYNUM_NONE))
;1127:	{	// duck
;1128:		pmcss->ps->pm_flags |= PMF_DUCKED;
;1129:	}
;1130:	else
;1131:	{	// stand up if possible
;1132:		if (pmcss->ps->pm_flags & PMF_DUCKED)
;1133:		{
;1134:			// try to stand up
;1135:			pmcss->maxs[2] = 32;
;1136:			pmcss->trace(&trace, pmlcss.origin, pmcss->mins, pmcss->maxs, pmlcss.origin, pmcss->ps->clientNum, pmcss->tracemask);
;1137:			if (!trace.allsolid)
;1138:				pmcss->ps->pm_flags &= ~PMF_DUCKED;
;1139:		}
;1140:	}
;1141:
;1142:	if (pmcss->ps->pm_flags & PMF_DUCKED)
;1143:	{
;1144:		pmcss->maxs[2] = 4;
;1145:		pmcss->ps->viewheight = -2;
;1146:	}
;1147:	else
;1148:	{
;1149:		pmcss->maxs[2] = 32;
;1150:		pmcss->ps->viewheight = 22;
;1151:	}*/
;1152:}
LABELV $690
endproc PMCSS_CheckDuck 1120 4
export PMCSS_DeadMove
proc PMCSS_DeadMove 12 4
line 1161
;1153:
;1154:
;1155:/*
;1156:==============
;1157:PMCSS_DeadMove
;1158:==============
;1159:*/
;1160:void PMCSS_DeadMove(void)
;1161:{
line 1164
;1162:	float	forward;
;1163:
;1164:	if (pmcss->ps->groundEntityNum == ENTITYNUM_NONE)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $704
line 1165
;1165:		return;
ADDRGP4 $703
JUMPV
LABELV $704
line 1169
;1166:
;1167:	// extra friction
;1168:
;1169:	forward = VectorLength(pmlcss.velocity);
ADDRGP4 pmlcss+12
ARGP4
ADDRLP4 4
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1170
;1170:	forward -= 20;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 1171
;1171:	if (forward <= 0)
ADDRLP4 0
INDIRF4
CNSTF4 0
GTF4 $707
line 1172
;1172:	{
line 1173
;1173:		VectorClear(pmlcss.velocity);
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRGP4 pmlcss+12+8
ADDRLP4 8
INDIRF4
ASGNF4
ADDRGP4 pmlcss+12+4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRGP4 pmlcss+12
ADDRLP4 8
INDIRF4
ASGNF4
line 1174
;1174:	}
ADDRGP4 $708
JUMPV
LABELV $707
line 1176
;1175:	else
;1176:	{
line 1177
;1177:		VectorNormalize(pmlcss.velocity);
ADDRGP4 pmlcss+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1178
;1178:		VectorScale(pmlcss.velocity, forward, pmlcss.velocity);
ADDRGP4 pmlcss+12
ADDRGP4 pmlcss+12
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlcss+12+4
ADDRGP4 pmlcss+12+4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlcss+12+8
ADDRGP4 pmlcss+12+8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1179
;1179:	}
LABELV $708
line 1180
;1180:}
LABELV $703
endproc PMCSS_DeadMove 12 4
export PMCSS_GoodPosition
proc PMCSS_GoodPosition 1124 28
line 1184
;1181:
;1182:
;1183:qboolean	PMCSS_GoodPosition(void)
;1184:{
line 1189
;1185:	trace_t	trace;
;1186:	vec3_t	origin, end;
;1187:	int		i;
;1188:
;1189:	if (pmcss->ps->pm_type == PM_SPECTATOR)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $726
line 1190
;1190:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $725
JUMPV
LABELV $726
line 1192
;1191:
;1192:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $728
line 1193
;1193:		origin[i] = end[i] = pmcss->ps->origin[i];
ADDRLP4 1108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1112
ADDRLP4 1108
INDIRI4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1108
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 1112
INDIRF4
ASGNF4
ADDRLP4 1108
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 1112
INDIRF4
ASGNF4
LABELV $729
line 1192
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $728
line 1194
;1194:	pmcss->trace(&trace, origin, pmcss->mins, pmcss->maxs, end, pmcss->ps->clientNum, pmcss->tracemask);
ADDRLP4 28
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1116
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 1116
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1116
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1116
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ARGI4
ADDRLP4 1116
INDIRP4
CNSTI4 216
ADDP4
INDIRP4
CALLV
pop
line 1196
;1195:
;1196:	return !trace.allsolid;
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $733
ADDRLP4 1120
CNSTI4 1
ASGNI4
ADDRGP4 $734
JUMPV
LABELV $733
ADDRLP4 1120
CNSTI4 0
ASGNI4
LABELV $734
ADDRLP4 1120
INDIRI4
RETI4
LABELV $725
endproc PMCSS_GoodPosition 1124 28
data
align 4
LABELV $736
byte 4 0
byte 4 3187671040
byte 4 1040187392
export PMCSS_InitialSnapPosition
code
proc PMCSS_InitialSnapPosition 28 0
line 1206
;1197:}
;1198:
;1199:/*
;1200:================
;1201:PMCSS_InitialSnapPosition
;1202:
;1203:================
;1204:*/
;1205:void PMCSS_InitialSnapPosition(void)
;1206:{
line 1211
;1207:	int        x, y, z;
;1208:	float      base[3];
;1209:	static float offset[3] = { 0, -0.125, 0.125 };
;1210:
;1211:	VectorCopy(pmcss->ps->origin, base);
ADDRLP4 4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1213
;1212:
;1213:	for (z = 0; z < 3; z++) {
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $737
line 1214
;1214:		pmcss->ps->origin[2] = base[2] + offset[z];
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 4+8
INDIRF4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $736
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1215
;1215:		for (y = 0; y < 3; y++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $742
line 1216
;1216:			pmcss->ps->origin[1] = base[1] + offset[y];
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4+4
INDIRF4
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $736
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1217
;1217:			for (x = 0; x < 3; x++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $747
line 1218
;1218:				pmcss->ps->origin[0] = base[0] + offset[x];
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $736
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1219
;1219:				if (PMCSS_GoodPosition()) {
ADDRLP4 24
ADDRGP4 PMCSS_GoodPosition
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $751
line 1220
;1220:					pmlcss.origin[0] = pmcss->ps->origin[0];
ADDRGP4 pmlcss
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1221
;1221:					pmlcss.origin[1] = pmcss->ps->origin[1];
ADDRGP4 pmlcss+4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1222
;1222:					pmlcss.origin[2] = pmcss->ps->origin[2];
ADDRGP4 pmlcss+8
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 1223
;1223:					VectorCopy(pmcss->ps->origin, pmlcss.previous_origin);
ADDRGP4 pmlcss+112
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1224
;1224:					return;
ADDRGP4 $735
JUMPV
LABELV $751
line 1226
;1225:				}
;1226:			}
LABELV $748
line 1217
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $747
line 1227
;1227:		}
LABELV $743
line 1215
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 3
LTI4 $742
line 1228
;1228:	}
LABELV $738
line 1213
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 3
LTI4 $737
line 1231
;1229:
;1230:	//Com_DPrintf("Bad InitialSnapPosition\n");
;1231:}
LABELV $735
endproc PMCSS_InitialSnapPosition 28 0
export PMCSS_ClampAngles
proc PMCSS_ClampAngles 16 16
line 1241
;1232:
;1233:
;1234:/*
;1235:================
;1236:PMCSS_ClampAngles
;1237:
;1238:================
;1239:*/
;1240:void PMCSS_ClampAngles(void)
;1241:{
line 1252
;1242:	short	temp;
;1243:	int		i;
;1244:
;1245:	//if (pmcss->ps->pm_flags & PMF_TIME_TELEPORT)
;1246:	//{
;1247:	//	pmcss->ps->viewangles[YAW] = SHORT2ANGLE(pmcss->cmd.angles[YAW] + pmcss->ps->delta_angles[YAW]);
;1248:	//	pmcss->ps->viewangles[PITCH] = 0;
;1249:	//	pmcss->ps->viewangles[ROLL] = 0;
;1250:	//}
;1251:	//else
;1252:	{
line 1254
;1253:		// circularly clamp the angles with deltas
;1254:		for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $757
line 1255
;1255:		{
line 1256
;1256:			temp = pmcss->cmd.angles[i] + pmcss->ps->delta_angles[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
ADDP4
INDIRI4
ADDI4
CVII2 4
ASGNI2
line 1257
;1257:			pmcss->ps->viewangles[i] = SHORT2ANGLE(temp);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pmcss
INDIRP4
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
line 1258
;1258:		}
LABELV $758
line 1254
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $757
line 1261
;1259:
;1260:		// don't let the player look up or down more than 90 degrees
;1261:		if (pmcss->ps->viewangles[PITCH] > 89 && pmcss->ps->viewangles[PITCH] < 180)
ADDRLP4 8
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 1118961664
LEF4 $761
ADDRLP4 8
INDIRF4
CNSTF4 1127481344
GEF4 $761
line 1262
;1262:			pmcss->ps->viewangles[PITCH] = 89;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
CNSTF4 1118961664
ASGNF4
ADDRGP4 $762
JUMPV
LABELV $761
line 1263
;1263:		else if (pmcss->ps->viewangles[PITCH] < 271 && pmcss->ps->viewangles[PITCH] >= 180)
ADDRLP4 12
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 1132953600
GEF4 $763
ADDRLP4 12
INDIRF4
CNSTF4 1127481344
LTF4 $763
line 1264
;1264:			pmcss->ps->viewangles[PITCH] = 271;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
CNSTF4 1132953600
ASGNF4
LABELV $763
LABELV $762
line 1265
;1265:	}
line 1266
;1266:	AngleVectors(pmcss->ps->viewangles, pmlcss.forward, pmlcss.right, pmlcss.up);
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 pmlcss+24
ARGP4
ADDRGP4 pmlcss+36
ARGP4
ADDRGP4 pmlcss+48
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1267
;1267:}
LABELV $756
endproc PMCSS_ClampAngles 16 16
proc PMCSS_ScaleWishVel 36 4
line 1270
;1268:
;1269:
;1270:static void PMCSS_ScaleWishVel() {
line 1271
;1271:	if (pmcss->ps->pm_type != PM_NOCLIP && pmcss->ps->pm_type != PM_SPECTATOR) {
ADDRLP4 0
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $769
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $769
line 1272
;1272:		float maxSpeed = (pmcss->cmd.buttons & BUTTON_WALKING) ? 100 : 320;
ADDRGP4 pmcss
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $772
ADDRLP4 12
CNSTI4 100
ASGNI4
ADDRGP4 $773
JUMPV
LABELV $772
ADDRLP4 12
CNSTI4 320
ASGNI4
LABELV $773
ADDRLP4 4
ADDRLP4 12
INDIRI4
CVIF4 4
ASGNF4
line 1273
;1273:		float wishSpeed = sqrtf(pmlcss.forwardmove* pmlcss.forwardmove+ pmlcss.rightmove * pmlcss.rightmove + pmlcss.upmove * pmlcss.upmove);
ADDRGP4 pmlcss+100
INDIRF4
ADDRGP4 pmlcss+100
INDIRF4
MULF4
ADDRGP4 pmlcss+104
INDIRF4
ADDRGP4 pmlcss+104
INDIRF4
MULF4
ADDF4
ADDRGP4 pmlcss+108
INDIRF4
ADDRGP4 pmlcss+108
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 16
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 16
INDIRF4
ASGNF4
line 1274
;1274:		if (wishSpeed > maxSpeed) {
ADDRLP4 8
INDIRF4
ADDRLP4 4
INDIRF4
LEF4 $780
line 1275
;1275:			float ratio = maxSpeed / wishSpeed;
ADDRLP4 20
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 1276
;1276:			pmlcss.forwardmove *= ratio;
ADDRLP4 24
ADDRGP4 pmlcss+100
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 1277
;1277:			pmlcss.rightmove *= ratio;
ADDRLP4 28
ADDRGP4 pmlcss+104
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 1278
;1278:			pmlcss.upmove *= ratio;
ADDRLP4 32
ADDRGP4 pmlcss+108
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 1279
;1279:		}
LABELV $780
line 1280
;1280:	}
LABELV $769
line 1281
;1281:	if (pmcss->ps->pm_type == PM_FREEZE || pmcss->ps->pm_type == PM_DEAD) {
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 8
ADDRGP4 pmcss
INDIRP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 5
EQI4 $787
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $785
LABELV $787
line 1282
;1282:		pmlcss.forwardmove = 0;
ADDRGP4 pmlcss+100
CNSTF4 0
ASGNF4
line 1283
;1283:		pmlcss.rightmove = 0;
ADDRGP4 pmlcss+104
CNSTF4 0
ASGNF4
line 1284
;1284:		pmlcss.upmove = 0;
ADDRGP4 pmlcss+108
CNSTF4 0
ASGNF4
line 1285
;1285:	}
LABELV $785
line 1287
;1286:
;1287:}
LABELV $768
endproc PMCSS_ScaleWishVel 36 4
proc PMCSS_DropTimers 4 0
line 1296
;1288:
;1289:
;1290:
;1291:/*
;1292:================
;1293:PM_DropTimers
;1294:================
;1295:*/
;1296:static void PMCSS_DropTimers(void) {
line 1300
;1297:
;1298:	// drop misc timing counter
;1299:
;1300:	if (pmcss->ps->forceDodgeAnim) {
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $792
line 1301
;1301:		if (pmlcss.msec >= pmcss->ps->forceDodgeAnim) {
ADDRGP4 pmlcss+64
INDIRI4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
INDIRI4
LTI4 $794
line 1302
;1302:			pmcss->ps->pm_time = 0;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1303
;1303:		}
ADDRGP4 $795
JUMPV
LABELV $794
line 1304
;1304:		else {
line 1305
;1305:			pmcss->ps->forceDodgeAnim -= pmlcss.msec;
ADDRLP4 0
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 1260
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pmlcss+64
INDIRI4
SUBI4
ASGNI4
line 1306
;1306:		}
LABELV $795
line 1307
;1307:	}
LABELV $792
line 1308
;1308:	if (pmcss->ps->fd.forceRageRecoveryTime) {
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 1172
ADDP4
INDIRI4
CNSTI4 0
EQI4 $798
line 1309
;1309:		if (pmlcss.msec >= pmcss->ps->fd.forceRageRecoveryTime) {
ADDRGP4 pmlcss+64
INDIRI4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 1172
ADDP4
INDIRI4
LTI4 $800
line 1310
;1310:			pmcss->ps->pm_time = 0;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1311
;1311:		}
ADDRGP4 $801
JUMPV
LABELV $800
line 1312
;1312:		else {
line 1313
;1313:			pmcss->ps->fd.forceRageRecoveryTime -= pmlcss.msec;
ADDRLP4 0
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 1172
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pmlcss+64
INDIRI4
SUBI4
ASGNI4
line 1314
;1314:		}
LABELV $801
line 1315
;1315:	}
LABELV $798
line 1316
;1316:	if (pmcss->ps->fd.forcePowerDebounce[FP_LEVITATION]) {
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
EQI4 $804
line 1317
;1317:		if (pmlcss.msec >= pmcss->ps->fd.forcePowerDebounce[FP_LEVITATION]) {
ADDRGP4 pmlcss+64
INDIRI4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
LTI4 $806
line 1318
;1318:			pmcss->ps->pm_time = 0;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1319
;1319:		}
ADDRGP4 $807
JUMPV
LABELV $806
line 1320
;1320:		else {
line 1321
;1321:			pmcss->ps->fd.forcePowerDebounce[FP_LEVITATION] -= pmlcss.msec;
ADDRLP4 0
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 776
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pmlcss+64
INDIRI4
SUBI4
ASGNI4
line 1322
;1322:		}
LABELV $807
line 1323
;1323:	}
LABELV $804
line 1324
;1324:}
LABELV $791
endproc PMCSS_DropTimers 4 0
export PmoveCSS
proc PmoveCSS 32 16
line 1334
;1325:
;1326:/*
;1327:================
;1328:Pmove
;1329:
;1330:Can be called by either the server or the client
;1331:================
;1332:*/
;1333:void PmoveCSS(pmovecss_t* pmove)
;1334:{
line 1335
;1335:	pmcss = pmove;
ADDRGP4 pmcss
ADDRFP4 0
INDIRP4
ASGNP4
line 1338
;1336:
;1337:	// clear results
;1338:	pmcss->numtouch = 0;
ADDRGP4 pmcss
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1339
;1339:	VectorClear(pmcss->ps->viewangles);
ADDRLP4 0
ADDRGP4 pmcss
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1340
;1340:	pmcss->ps->viewheight = 0;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 0
ASGNI4
line 1341
;1341:	pmcss->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 1342
;1342:	pmcss->watertype = 0;
ADDRGP4 pmcss
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 1343
;1343:	pmcss->waterlevel = 0;
ADDRGP4 pmcss
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 1346
;1344:
;1345:	// clear all pmove local vars
;1346:	memset(&pmlcss, 0, sizeof(pmlcss));
ADDRGP4 pmlcss
ARGP4
CNSTI4 0
ARGI4
CNSTU4 128
ARGU4
ADDRGP4 memset
CALLP4
pop
line 1348
;1347:
;1348:	pmlcss.origin[0] = pmcss->ps->origin[0];
ADDRGP4 pmlcss
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1349
;1349:	pmlcss.origin[1] = pmcss->ps->origin[1];
ADDRGP4 pmlcss+4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1350
;1350:	pmlcss.origin[2] = pmcss->ps->origin[2];
ADDRGP4 pmlcss+8
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 1352
;1351:
;1352:	pmlcss.velocity[0] = pmcss->ps->velocity[0];
ADDRGP4 pmlcss+12
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 1353
;1353:	pmlcss.velocity[1] = pmcss->ps->velocity[1];
ADDRGP4 pmlcss+12+4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
line 1354
;1354:	pmlcss.velocity[2] = pmcss->ps->velocity[2];
ADDRGP4 pmlcss+12+8
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ASGNF4
line 1356
;1355:
;1356:	pmlcss.msec = pmcss->cmd.serverTime - pmcss->ps->commandTime;
ADDRLP4 8
ADDRGP4 pmcss
INDIRP4
ASGNP4
ADDRGP4 pmlcss+64
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 1357
;1357:	pmlcss.forwardmove = (int)pmcss->cmd.forwardmove * 500 / 127;//adapt from q3 range
ADDRGP4 pmlcss+100
CNSTI4 500
ADDRGP4 pmcss
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
MULI4
CNSTI4 127
DIVI4
CVIF4 4
ASGNF4
line 1358
;1358:	pmlcss.rightmove = (int)pmcss->cmd.rightmove * 500 / 127;//adapt from q3 range
ADDRGP4 pmlcss+104
CNSTI4 500
ADDRGP4 pmcss
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
MULI4
CNSTI4 127
DIVI4
CVIF4 4
ASGNF4
line 1359
;1359:	pmlcss.upmove = (int)pmcss->cmd.upmove * 500 / 127;//adapt from q3 range
ADDRGP4 pmlcss+108
CNSTI4 500
ADDRGP4 pmcss
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
MULI4
CNSTI4 127
DIVI4
CVIF4 4
ASGNF4
line 1361
;1360:
;1361:	PMCSS_ScaleWishVel();
ADDRGP4 PMCSS_ScaleWishVel
CALLV
pop
line 1364
;1362:
;1363:	// save old org in case we get stuck
;1364:	VectorCopy(pmcss->ps->origin, pmlcss.previous_origin);
ADDRGP4 pmlcss+112
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1366
;1365:
;1366:	pmlcss.frametime = pmlcss.msec * 0.001;
ADDRGP4 pmlcss+60
CNSTF4 981668463
ADDRGP4 pmlcss+64
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1368
;1367:
;1368:	PMCSS_DropTimers();
ADDRGP4 PMCSS_DropTimers
CALLV
pop
line 1370
;1369:
;1370:	PMCSS_ClampAngles();
ADDRGP4 PMCSS_ClampAngles
CALLV
pop
line 1372
;1371:
;1372:	if (pmcss->ps->pm_type == PM_SPECTATOR)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $825
line 1373
;1373:	{
line 1374
;1374:		PMCSS_FlyMove(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 PMCSS_FlyMove
CALLV
pop
line 1375
;1375:		VectorCopy(pmlcss.origin, pmcss->ps->origin);
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 pmlcss
INDIRB
ASGNB 12
line 1376
;1376:		VectorCopy(pmlcss.velocity, pmcss->ps->velocity);
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 pmlcss+12
INDIRB
ASGNB 12
line 1377
;1377:		return;
ADDRGP4 $810
JUMPV
LABELV $825
line 1380
;1378:	}
;1379:
;1380:	if (pmcss->ps->pm_type >= PM_DEAD)
ADDRLP4 12
CNSTI4 4
ASGNI4
ADDRGP4 pmcss
INDIRP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $828
line 1381
;1381:	{
line 1382
;1382:		pmlcss.forwardmove = 0;
ADDRGP4 pmlcss+100
CNSTF4 0
ASGNF4
line 1383
;1383:		pmlcss.rightmove = 0;
ADDRGP4 pmlcss+104
CNSTF4 0
ASGNF4
line 1384
;1384:		pmlcss.upmove = 0;
ADDRGP4 pmlcss+108
CNSTF4 0
ASGNF4
line 1385
;1385:	}
LABELV $828
line 1387
;1386:
;1387:	if (pmcss->ps->pm_type == PM_FREEZE)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $833
line 1388
;1388:		return;		// no movement at all
ADDRGP4 $810
JUMPV
LABELV $833
line 1391
;1389:
;1390:
;1391:	if (pmcss->snapinitial)
ADDRGP4 pmcss
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
EQI4 $835
line 1392
;1392:		PMCSS_InitialSnapPosition();
ADDRGP4 PMCSS_InitialSnapPosition
CALLV
pop
LABELV $835
line 1395
;1393:
;1394:	// set groundentity, watertype, and waterlevel
;1395:	PMCSS_CatagorizePosition();
ADDRGP4 PMCSS_CatagorizePosition
CALLV
pop
line 1399
;1396:
;1397:
;1398:	// set mins, maxs, and viewheight
;1399:	PMCSS_CheckDuck();
ADDRGP4 PMCSS_CheckDuck
CALLV
pop
line 1401
;1400:
;1401:	if (pmcss->ps->pm_type == PM_DEAD)
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRGP4 pmcss
INDIRP4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $837
line 1402
;1402:		PMCSS_DeadMove();
ADDRGP4 PMCSS_DeadMove
CALLV
pop
LABELV $837
line 1404
;1403:
;1404:	PMCSS_CheckSpecialMovement();
ADDRGP4 PMCSS_CheckSpecialMovement
CALLV
pop
line 1407
;1405:
;1406:	// drop timing counter
;1407:	if (pmcss->ps->pm_time)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $839
line 1408
;1408:	{
line 1412
;1409:		int		msec;
;1410:
;1411:		//msec = pmcss->cmd.msec >> 3;
;1412:		msec = pmlcss.msec >> 3; // why is this >> 3?
ADDRLP4 20
ADDRGP4 pmlcss+64
INDIRI4
CNSTI4 3
RSHI4
ASGNI4
line 1413
;1413:		if (!msec)
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $842
line 1414
;1414:			msec = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $842
line 1415
;1415:		if (msec >= pmcss->ps->pm_time)
ADDRLP4 20
INDIRI4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LTI4 $844
line 1416
;1416:		{
line 1417
;1417:			pmcss->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND/* | PMF_TIME_TELEPORT*/);
ADDRLP4 24
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -289
BANDI4
ASGNI4
line 1418
;1418:			pmcss->ps->pm_time = 0;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1419
;1419:		}
ADDRGP4 $845
JUMPV
LABELV $844
line 1421
;1420:		else
;1421:			pmcss->ps->pm_time -= msec;
ADDRLP4 24
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
LABELV $845
line 1422
;1422:	}
LABELV $839
line 1428
;1423:
;1424:	//if (pmcss->ps->pm_flags & PMF_TIME_TELEPORT)
;1425:	//{	// teleport pause stays exactly in place
;1426:	//}
;1427:	//else 
;1428:	if (pmcss->ps->pm_flags & PMF_TIME_WATERJUMP)
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $846
line 1429
;1429:	{	// waterjump has no control, but falls
line 1430
;1430:		pmlcss.velocity[2] -= pmcss->ps->gravity * pmlcss.frametime;
ADDRLP4 20
ADDRGP4 pmlcss+12+8
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pmlcss+60
INDIRF4
MULF4
SUBF4
ASGNF4
line 1431
;1431:		if (pmlcss.velocity[2] < 0)
ADDRGP4 pmlcss+12+8
INDIRF4
CNSTF4 0
GEF4 $851
line 1432
;1432:		{	// cancel as soon as we are falling down again
line 1433
;1433:			pmcss->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND /*| PMF_TIME_TELEPORT*/);
ADDRLP4 24
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -289
BANDI4
ASGNI4
line 1434
;1434:			pmcss->ps->pm_time = 0;
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1435
;1435:		}
LABELV $851
line 1437
;1436:
;1437:		PMCSS_StepSlideMove();
ADDRGP4 PMCSS_StepSlideMove
CALLV
pop
line 1438
;1438:		PMCSS_UpdateAntiLoop();
ADDRGP4 PMCSS_UpdateAntiLoop
CALLV
pop
line 1439
;1439:	}
ADDRGP4 $847
JUMPV
LABELV $846
line 1441
;1440:	else
;1441:	{
line 1442
;1442:		PMCSS_CheckJump();
ADDRGP4 PMCSS_CheckJump
CALLV
pop
line 1444
;1443:
;1444:		PMCSS_Friction();
ADDRGP4 PMCSS_Friction
CALLV
pop
line 1446
;1445:
;1446:		if (pmcss->waterlevel >= 2)
ADDRGP4 pmcss
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LTI4 $855
line 1447
;1447:			PMCSS_WaterMove();
ADDRGP4 PMCSS_WaterMove
CALLV
pop
ADDRGP4 $856
JUMPV
LABELV $855
line 1448
;1448:		else {
line 1451
;1449:			vec3_t	angles;
;1450:
;1451:			VectorCopy(pmcss->ps->viewangles, angles);
ADDRLP4 20
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1452
;1452:			if (angles[PITCH] > 180)
ADDRLP4 20
INDIRF4
CNSTF4 1127481344
LEF4 $857
line 1453
;1453:				angles[PITCH] = angles[PITCH] - 360;
ADDRLP4 20
ADDRLP4 20
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $857
line 1454
;1454:			angles[PITCH] /= 3;
ADDRLP4 20
ADDRLP4 20
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 1456
;1455:
;1456:			AngleVectors(angles, pmlcss.forward, pmlcss.right, pmlcss.up);
ADDRLP4 20
ARGP4
ADDRGP4 pmlcss+24
ARGP4
ADDRGP4 pmlcss+36
ARGP4
ADDRGP4 pmlcss+48
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1458
;1457:
;1458:			PMCSS_AirMove();
ADDRGP4 PMCSS_AirMove
CALLV
pop
line 1459
;1459:		}
LABELV $856
line 1460
;1460:	}
LABELV $847
line 1463
;1461:
;1462:	// set groundentity, watertype, and waterlevel for final spot
;1463:	PMCSS_CatagorizePosition();
ADDRGP4 PMCSS_CatagorizePosition
CALLV
pop
line 1465
;1464:
;1465:	VectorCopy(pmlcss.origin, pmcss->ps->origin);
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 pmlcss
INDIRB
ASGNB 12
line 1466
;1466:	VectorCopy(pmlcss.velocity, pmcss->ps->velocity);
ADDRGP4 pmcss
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 pmlcss+12
INDIRB
ASGNB 12
line 1467
;1467:}
LABELV $810
endproc PmoveCSS 32 16
bss
export pmlcss
align 4
LABELV pmlcss
skip 128
export pmcss
align 4
LABELV pmcss
skip 4
import Key_GetProtocolKey15
import Key_GetProtocolKey
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
import ammoData
import weaponData
import weaponData_1_04
import weaponData_1_03
import weaponData_1_02
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
