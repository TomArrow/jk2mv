data
export pmq2_stopspeed
align 4
LABELV pmq2_stopspeed
byte 4 1120403456
export pmq2_maxspeed
align 4
LABELV pmq2_maxspeed
byte 4 1133903872
export pmq2_duckspeed
align 4
LABELV pmq2_duckspeed
byte 4 1120403456
export pmq2_accelerate
align 4
LABELV pmq2_accelerate
byte 4 1092616192
export pmq2_airaccelerate
align 4
LABELV pmq2_airaccelerate
byte 4 0
export pmq2_wateraccelerate
align 4
LABELV pmq2_wateraccelerate
byte 4 1092616192
export pmq2_friction
align 4
LABELV pmq2_friction
byte 4 1086324736
export pmq2_waterfriction
align 4
LABELV pmq2_waterfriction
byte 4 1065353216
export pmq2_waterspeed
align 4
LABELV pmq2_waterspeed
byte 4 1137180672
code
proc PMQ2_UpdateAntiLoop 16 20
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\bg_pmove_q2.c"
line 84
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
;21:#include "../game/bg_pmove_q2.h"
;22:#include "../game/bg_public.h"
;23:
;24://#define CRINGY_STUCK_DEBUG
;25:
;26:#define AUTHENTIC_Q2SNAP
;27:
;28:#define	STEPSIZE	18
;29:
;30:extern int		c_pmove;
;31:
;32:// all of the locals will be zeroed before each
;33:// pmove, just to make damn sure we don't have
;34:// any differences when running on client or server
;35:
;36:typedef struct
;37:{
;38:	vec3_t		origin;			// full float precision
;39:	vec3_t		velocity;		// full float precision
;40:
;41:
;42:	vec3_t		forward, right, up;
;43:	float		frametime;
;44:
;45:	int			msec;
;46:
;47:	//csurface_t* groundsurface;
;48:	cplane_t	groundplane;
;49:	int			groundcontents;
;50:	int			surfaceFlags;
;51:	trace_t		groundTrace;
;52:	qboolean	groundFound;
;53:	qboolean	clipped;
;54:
;55:
;56:	int			forwardmove, rightmove, upmove;
;57:
;58:	vec3_t		previous_origin;
;59:	vec3_t		previous_velocity; // TA: addition for non-standard (settable) corner skims (pmq2->cornerSkims)
;60:	qboolean	ladder;
;61:} pmlq2_t;
;62:
;63:pmoveq2_t* pmq2;
;64:pmlq2_t		pmlq2;
;65:
;66:
;67:// movement parameters
;68:float	pmq2_stopspeed = 100;
;69:float	pmq2_maxspeed = 300;
;70:float	pmq2_duckspeed = 100;
;71:float	pmq2_accelerate = 10;
;72:float	pmq2_airaccelerate = 0;
;73:float	pmq2_wateraccelerate = 10;
;74:float	pmq2_friction = 6;
;75:float	pmq2_waterfriction = 1;
;76:float	pmq2_waterspeed = 400;
;77:
;78:/*
;79:
;80:  walking up a step should kill some velocity
;81:
;82:*/
;83:extern pmove_t* pm;
;84:static void PMQ2_UpdateAntiLoop() {
line 85
;85:	DF_AntiLoop_NewAngle(pmq2->antiLoop, pm->lastAntiLoopVelocity, pmlq2.velocity, pmq2->ps->basespeed, pm->modParms.raceMode && pm->ps->duelTime);
ADDRLP4 4
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 228
ADDP4
INDIRP4
ARGP4
ADDRGP4 pm
INDIRP4
CNSTI4 544
ADDP4
ARGP4
ADDRGP4 pmlq2+12
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
line 86
;86:	VectorCopy(pmlq2.velocity, pm->lastAntiLoopVelocity);
ADDRGP4 pm
INDIRP4
CNSTI4 544
ADDP4
ADDRGP4 pmlq2+12
INDIRB
ASGNB 12
line 87
;87:}
LABELV $93
endproc PMQ2_UpdateAntiLoop 16 20
export PMQ2_ClipVelocity
proc PMQ2_ClipVelocity 36 0
line 101
;88:
;89:
;90:/*
;91:==================
;92:PMQ2_ClipVelocity
;93:
;94:Slide off of the impacting object
;95:returns the blocked flags (1 = floor, 2 = step / wall)
;96:==================
;97:*/
;98:#define	STOP_EPSILON	0.1
;99:
;100:void PMQ2_ClipVelocity(vec3_t in, vec3_t normal, vec3_t out, float overbounce)
;101:{
line 106
;102:	float	backoff;
;103:	float	change;
;104:	int		i;
;105:
;106:	backoff = DotProduct(in, normal) * overbounce;
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
line 108
;107:
;108:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $100
line 109
;109:	{
line 110
;110:		change = normal[i] * backoff;
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
line 111
;111:		out[i] = in[i] - change;
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
line 112
;112:		if (out[i] > -STOP_EPSILON && out[i] < STOP_EPSILON)
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
LEF4 $104
ADDRLP4 32
INDIRF4
CNSTF4 1036831949
GEF4 $104
line 113
;113:			out[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
LABELV $104
line 114
;114:	}
LABELV $101
line 108
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $100
line 115
;115:}
LABELV $99
endproc PMQ2_ClipVelocity 36 0
export PMQ2_StepSlideMove_
proc PMQ2_StepSlideMove_ 1220 28
line 134
;116:
;117:
;118:
;119:
;120:/*
;121:==================
;122:PMQ2_StepSlideMove
;123:
;124:Each intersection will try to step over the obstruction instead of
;125:sliding along it.
;126:
;127:Returns a new origin, velocity, and contact entity
;128:Does not modify any world state?
;129:==================
;130:*/
;131:#define	MIN_STEP_NORMAL	0.7		// can't step up onto very steep slopes
;132:#define	MAX_CLIP_PLANES	5
;133:void PMQ2_StepSlideMove_(void)
;134:{
line 149
;135:	int			bumpcount, numbumps;
;136:	vec3_t		dir;
;137:	float		d;
;138:	int			numplanes;
;139:	vec3_t		planes[MAX_CLIP_PLANES];
;140:	vec3_t		primal_velocity;
;141:#ifdef CRINGY_STUCK_DEBUG
;142:	vec3_t		preBumpVel;
;143:#endif
;144:	int			i, j;
;145:	trace_t	trace;
;146:	vec3_t		end;
;147:	float		time_left;
;148:
;149:	numbumps = 4;
ADDRLP4 1200
CNSTI4 4
ASGNI4
line 151
;150:
;151:	VectorCopy(pmlq2.velocity, primal_velocity);
ADDRLP4 1180
ADDRGP4 pmlq2+12
INDIRB
ASGNB 12
line 152
;152:	numplanes = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 154
;153:
;154:	time_left = pmlq2.frametime;
ADDRLP4 1152
ADDRGP4 pmlq2+60
INDIRF4
ASGNF4
line 156
;155:
;156:	for (bumpcount = 0; bumpcount < numbumps; bumpcount++)
ADDRLP4 1192
CNSTI4 0
ASGNI4
ADDRGP4 $112
JUMPV
LABELV $109
line 157
;157:	{
line 158
;158:		for (i = 0; i < 3; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $113
line 159
;159:			end[i] = pmlq2.origin[i] + time_left * pmlq2.velocity[i];
ADDRLP4 1204
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1204
INDIRI4
ADDRLP4 1156
ADDP4
ADDRLP4 1204
INDIRI4
ADDRGP4 pmlq2
ADDP4
INDIRF4
ADDRLP4 1152
INDIRF4
ADDRLP4 1204
INDIRI4
ADDRGP4 pmlq2+12
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $114
line 158
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $113
line 161
;160:
;161:		pmq2->trace(&trace,pmlq2.origin, pmq2->mins, pmq2->maxs, end,pmq2->ps->clientNum,pmq2->tracemask);
ADDRLP4 72
ARGP4
ADDRGP4 pmlq2
ARGP4
ADDRLP4 1208
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
CNSTI4 168
ADDP4
ARGP4
ADDRLP4 1208
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 1156
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
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 1208
INDIRP4
CNSTI4 204
ADDP4
INDIRP4
CALLV
pop
line 163
;162:
;163:		if (trace.allsolid)
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $118
line 164
;164:		{	// entity is trapped in another solid
line 165
;165:			pmlq2.velocity[2] = 0;	// don't build up falling damage
ADDRGP4 pmlq2+12+8
CNSTF4 0
ASGNF4
line 166
;166:			return;
ADDRGP4 $106
JUMPV
LABELV $118
line 169
;167:		}
;168:
;169:		if (trace.fraction > 0)
ADDRLP4 72+8
INDIRF4
CNSTF4 0
LEF4 $122
line 170
;170:		{	// actually covered some distance
line 171
;171:			VectorCopy(trace.endpos, pmlq2.origin);
ADDRGP4 pmlq2
ADDRLP4 72+12
INDIRB
ASGNB 12
line 172
;172:			numplanes = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 173
;173:		}
LABELV $122
line 175
;174:
;175:		if (trace.fraction == 1)
ADDRLP4 72+8
INDIRF4
CNSTF4 1065353216
NEF4 $126
line 176
;176:			break;		// moved the entire distance
ADDRGP4 $111
JUMPV
LABELV $126
line 179
;177:
;178:	   // save entity for contact
;179:		if (pmq2->numtouch < MAXTOUCH && trace.entityNum != ENTITYNUM_NONE)
ADDRGP4 pmq2
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 32
GEI4 $129
ADDRLP4 72+52
INDIRI4
CNSTI4 1023
EQI4 $129
line 180
;180:		{
line 181
;181:			pmq2->touchents[pmq2->numtouch] = trace.entityNum;
ADDRLP4 1212
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1212
INDIRP4
CNSTI4 40
ADDP4
ADDP4
ADDRLP4 72+52
INDIRI4
ASGNI4
line 182
;182:			pmq2->numtouch++;
ADDRLP4 1216
ADDRGP4 pmq2
INDIRP4
CNSTI4 36
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
line 183
;183:		}
LABELV $129
line 185
;184:
;185:		time_left -= time_left * trace.fraction;
ADDRLP4 1152
ADDRLP4 1152
INDIRF4
ADDRLP4 1152
INDIRF4
ADDRLP4 72+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 188
;186:
;187:		// slide along this plane
;188:		if (numplanes >= MAX_CLIP_PLANES)
ADDRLP4 68
INDIRI4
CNSTI4 5
LTI4 $134
line 189
;189:		{	// this shouldn't really happen
line 190
;190:			VectorCopy(vec3_origin, pmlq2.velocity);
ADDRGP4 pmlq2+12
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 194
;191:#ifdef CRINGY_STUCK_DEBUG
;192:			Com_Printf("numplanes >= MAX_CLIP_PLANES, nulling\n");
;193:#endif
;194:			break;
ADDRGP4 $111
JUMPV
LABELV $134
line 197
;195:		}
;196:
;197:		if (!pmq2->haveQ2StyleTrace) {
ADDRGP4 pmq2
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
NEI4 $137
line 205
;198:			//
;199:			// if this is the same plane we hit before, nudge velocity
;200:			// out along it, which fixes some epsilon issues with
;201:			// non-axial planes
;202:			//
;203:			// TA: I just couldn't properly get everything to be smooth without this. I tried adjusting trace code to make it more compatible with Q2, but it still wasn't satisfactory. 
;204:			// 
;205:			for (i = 0; i < numplanes; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $142
JUMPV
LABELV $139
line 206
;206:				if (DotProduct(trace.plane.normal, planes[i]) > 0.99) {
ADDRLP4 1216
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
ADDRLP4 72+24
INDIRF4
ADDRLP4 1216
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
MULF4
ADDRLP4 72+24+4
INDIRF4
ADDRLP4 1216
INDIRI4
ADDRLP4 8+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 72+24+8
INDIRF4
ADDRLP4 1216
INDIRI4
ADDRLP4 8+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $143
line 207
;207:					VectorAdd(trace.plane.normal, pmlq2.velocity, pmlq2.velocity);
ADDRGP4 pmlq2+12
ADDRLP4 72+24
INDIRF4
ADDRGP4 pmlq2+12
INDIRF4
ADDF4
ASGNF4
ADDRGP4 pmlq2+12+4
ADDRLP4 72+24+4
INDIRF4
ADDRGP4 pmlq2+12+4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 pmlq2+12+8
ADDRLP4 72+24+8
INDIRF4
ADDRGP4 pmlq2+12+8
INDIRF4
ADDF4
ASGNF4
line 208
;208:					break;
ADDRGP4 $141
JUMPV
LABELV $143
line 210
;209:				}
;210:			}
LABELV $140
line 205
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $142
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $139
LABELV $141
line 214
;211:			//if (i < numplanes) {
;212:			//	continue;
;213:			//}
;214:		}
LABELV $137
line 216
;215:
;216:		VectorCopy(trace.plane.normal, planes[numplanes]);
CNSTI4 12
ADDRLP4 68
INDIRI4
MULI4
ADDRLP4 8
ADDP4
ADDRLP4 72+24
INDIRB
ASGNB 12
line 217
;217:		numplanes++;
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 269
;218:
;219:#if 0
;220:		float		rub;
;221:
;222:		//
;223:		// modify velocity so it parallels all of the clip planes
;224:		//
;225:		if (numplanes == 1)
;226:		{	// go along this plane
;227:			VectorCopy(pmlq2.velocity, dir);
;228:			VectorNormalize(dir);
;229:			rub = 1.0 + 0.5 * DotProduct(dir, planes[0]);
;230:
;231:			// slide along the plane
;232:			PMQ2_ClipVelocity(pmlq2.velocity, planes[0], pmlq2.velocity, 1.01);
;233:			// rub some extra speed off on xy axis
;234:			// not on Z, or you can scrub down walls
;235:			pmlq2.velocity[0] *= rub;
;236:			pmlq2.velocity[1] *= rub;
;237:			pmlq2.velocity[2] *= rub;
;238:		}
;239:		else if (numplanes == 2)
;240:		{	// go along the crease
;241:			VectorCopy(pmlq2.velocity, dir);
;242:			VectorNormalize(dir);
;243:			rub = 1.0 + 0.5 * DotProduct(dir, planes[0]);
;244:
;245:			// slide along the plane
;246:			CrossProduct(planes[0], planes[1], dir);
;247:			d = DotProduct(dir, pmlq2.velocity);
;248:			VectorScale(dir, d, pmlq2.velocity);
;249:
;250:			// rub some extra speed off
;251:			VectorScale(pmlq2.velocity, rub, pmlq2.velocity);
;252:		}
;253:		else
;254:		{
;255:			//			Con_Printf ("clip velocity, numplanes == %i\n",numplanes);
;256:			VectorCopy(vec3_origin, pmlq2.velocity);
;257:			break;
;258:		}
;259:
;260:#else
;261:
;262:#ifdef CRINGY_STUCK_DEBUG
;263:		VectorCopy(pmlq2.velocity, preBumpVel);
;264:#endif
;265:
;266:		//
;267:		// modify original_velocity so it parallels all of the clip planes
;268:		//
;269:		for (i = 0; i < numplanes; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $171
JUMPV
LABELV $168
line 270
;270:		{
line 271
;271:			PMQ2_ClipVelocity(pmlq2.velocity, planes[i], pmlq2.velocity, 1.01);
ADDRGP4 pmlq2+12
ARGP4
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8
ADDP4
ARGP4
ADDRGP4 pmlq2+12
ARGP4
CNSTF4 1065437102
ARGF4
ADDRGP4 PMQ2_ClipVelocity
CALLV
pop
line 285
;272:#if 0//#ifdef  CRINGY_STUCK_DEBUG
;273:			{
;274:				vec3_t normVel;
;275:				float dot, angle;
;276:				VectorCopy(pmlq2.velocity, normVel);
;277:				VectorNormalize(normVel);
;278:				dot = DotProduct(planes[i], normVel);
;279:				if (dot <= 0) {
;280:					angle = acos(MIN(1.0f, MAX(0.0f, dot))) * (180.0f / M_PI);
;281:					Com_Printf("clip velocity dot <= 0 dot between newVel and normal %f angle %f fraction %f entitynum %d startsolid %d allsolid %d\n", dot, angle, trace.fraction, trace.entityNum, trace.startsolid, trace.allsolid);
;282:				}
;283:			}
;284:#endif
;285:			if (planes[i][2] >= 0.7) {
CNSTI4 12
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 8+8
ADDP4
INDIRF4
CNSTF4 1060320051
LTF4 $174
line 286
;286:				pmlq2.clipped = qtrue; // uh am i putting this the right place? idk
ADDRGP4 pmlq2+1180
CNSTI4 1
ASGNI4
line 287
;287:			}
LABELV $174
line 288
;288:			for (j = 0; j < numplanes; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $181
JUMPV
LABELV $178
line 289
;289:				if (j != i)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $182
line 290
;290:				{
line 291
;291:					if (DotProduct(pmlq2.velocity, planes[j]) < 0)
ADDRLP4 1216
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRGP4 pmlq2+12
INDIRF4
ADDRLP4 1216
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
MULF4
ADDRGP4 pmlq2+12+4
INDIRF4
ADDRLP4 1216
INDIRI4
ADDRLP4 8+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRGP4 pmlq2+12+8
INDIRF4
ADDRLP4 1216
INDIRI4
ADDRLP4 8+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $184
line 292
;292:						break;	// not ok
ADDRGP4 $180
JUMPV
LABELV $184
line 293
;293:				}
LABELV $182
LABELV $179
line 288
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $181
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $178
LABELV $180
line 294
;294:			if (j == numplanes)
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $193
line 295
;295:				break;
ADDRGP4 $170
JUMPV
LABELV $193
line 296
;296:		}
LABELV $169
line 269
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $171
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $168
LABELV $170
line 298
;297:
;298:		if (i != numplanes)
ADDRLP4 4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $195
line 299
;299:		{	// go along this plane
line 300
;300:		}
ADDRGP4 $196
JUMPV
LABELV $195
line 302
;301:		else
;302:		{	// go along the crease
line 303
;303:			if (numplanes != 2)
ADDRLP4 68
INDIRI4
CNSTI4 2
EQI4 $197
line 304
;304:			{
line 306
;305:				//				Con_Printf ("clip velocity, numplanes == %i\n",numplanes);
;306:				VectorCopy(vec3_origin, pmlq2.velocity);
ADDRGP4 pmlq2+12
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 310
;307:#ifdef CRINGY_STUCK_DEBUG
;308:				Com_Printf("i == numplanes && numplanes != 2, nulling\n");
;309:#endif
;310:				break;
ADDRGP4 $111
JUMPV
LABELV $197
line 312
;311:			}
;312:			CrossProduct(planes[0], planes[1], dir);
ADDRLP4 8
ARGP4
ADDRLP4 8+12
ARGP4
ADDRLP4 1168
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 313
;313:			d = DotProduct(dir, pmlq2.velocity);
ADDRLP4 1196
ADDRLP4 1168
INDIRF4
ADDRGP4 pmlq2+12
INDIRF4
MULF4
ADDRLP4 1168+4
INDIRF4
ADDRGP4 pmlq2+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1168+8
INDIRF4
ADDRGP4 pmlq2+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 330
;314:#ifdef CRINGY_STUCK_DEBUG
;315:			if (!d) {
;316:				vec3_t normVel,traceDir;
;317:				float dot,dot2,dot3,angle;
;318:				VectorCopy(preBumpVel, normVel);
;319:				VectorSubtract(end, pmlq2.origin, traceDir);
;320:				VectorNormalize(normVel);
;321:				dot = DotProduct(planes[0], normVel);
;322:				dot2 = DotProduct(planes[0], preBumpVel);
;323:				dot3 = DotProduct(planes[0], traceDir);
;324:				angle = acos(MIN(1.0f,MAX(0.0f,dot))) * (180.0f / M_PI);
;325:				Com_Printf("go along the crease 0 direction vel (identical planes?) dot between preBumpVel and normal %f, non norm dot %f, dirmove dot nonorm %f, angle %f fraction %f entitynum %d startsolid %d allsolid %d\n",dot,dot2,dot3,angle,trace.fraction,trace.entityNum,trace.startsolid,trace.allsolid);
;326:				// for debug: (so u can step in dev-sama)
;327:				pmq2->trace(&trace, pmlq2.origin, pmq2->mins, pmq2->maxs, end, pmq2->ps->clientNum, pmq2->tracemask);
;328:			}
;329:#endif
;330: 			VectorScale(dir, d, pmlq2.velocity);
ADDRGP4 pmlq2+12
ADDRLP4 1168
INDIRF4
ADDRLP4 1196
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlq2+12+4
ADDRLP4 1168+4
INDIRF4
ADDRLP4 1196
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlq2+12+8
ADDRLP4 1168+8
INDIRF4
ADDRLP4 1196
INDIRF4
MULF4
ASGNF4
line 331
;331:		}
LABELV $196
line 337
;332:#endif
;333:		//
;334:		// if velocity is against the original velocity, stop dead
;335:		// to avoid tiny occilations in sloping corners
;336:		//
;337:		if (DotProduct(pmlq2.velocity, primal_velocity) <= 0)
ADDRGP4 pmlq2+12
INDIRF4
ADDRLP4 1180
INDIRF4
MULF4
ADDRGP4 pmlq2+12+4
INDIRF4
ADDRLP4 1180+4
INDIRF4
MULF4
ADDF4
ADDRGP4 pmlq2+12+8
INDIRF4
ADDRLP4 1180+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GTF4 $215
line 338
;338:		{
line 342
;339:#ifdef CRINGY_STUCK_DEBUG
;340:			Com_Printf("DotProduct(pmlq2.velocity, primal_velocity) <= 0, nulling\n");
;341:#endif
;342:			VectorCopy(vec3_origin, pmlq2.velocity);
ADDRGP4 pmlq2+12
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 343
;343:			break;
ADDRGP4 $111
JUMPV
LABELV $215
line 345
;344:		}
;345:	}
LABELV $110
line 156
ADDRLP4 1192
ADDRLP4 1192
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $112
ADDRLP4 1192
INDIRI4
ADDRLP4 1200
INDIRI4
LTI4 $109
LABELV $111
line 347
;346:
;347:	if (pmq2->ps->pm_time)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $225
line 348
;348:	{
line 349
;349:		VectorCopy(primal_velocity, pmlq2.velocity);
ADDRGP4 pmlq2+12
ADDRLP4 1180
INDIRB
ASGNB 12
line 350
;350:	}
LABELV $225
line 351
;351:}
LABELV $106
endproc PMQ2_StepSlideMove_ 1220 28
export PMQ2_StepSlideMove
proc PMQ2_StepSlideMove 1176 28
line 360
;352:
;353:/*
;354:==================
;355:PMQ2_StepSlideMove
;356:
;357:==================
;358:*/
;359:void PMQ2_StepSlideMove(void)
;360:{
line 368
;361:	vec3_t		start_o, start_v;
;362:	vec3_t		down_o, down_v;
;363:	trace_t		trace;
;364:	float		down_dist, up_dist;
;365:	//	vec3_t		delta;
;366:	vec3_t		up, down;
;367:
;368:	VectorCopy(pmlq2.origin, start_o);
ADDRLP4 0
ADDRGP4 pmlq2
INDIRB
ASGNB 12
line 369
;369:	VectorCopy(pmlq2.velocity, start_v);
ADDRLP4 1140
ADDRGP4 pmlq2+12
INDIRB
ASGNB 12
line 371
;370:
;371:	PMQ2_StepSlideMove_();
ADDRGP4 PMQ2_StepSlideMove_
CALLV
pop
line 373
;372:
;373:	VectorCopy(pmlq2.origin, down_o);
ADDRLP4 24
ADDRGP4 pmlq2
INDIRB
ASGNB 12
line 374
;374:	VectorCopy(pmlq2.velocity, down_v);
ADDRLP4 1128
ADDRGP4 pmlq2+12
INDIRB
ASGNB 12
line 376
;375:
;376:	VectorCopy(start_o, up);
ADDRLP4 12
ADDRLP4 0
INDIRB
ASGNB 12
line 377
;377:	up[2] += STEPSIZE;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 379
;378:
;379:	pmq2->trace(&trace, up, pmq2->mins, pmq2->maxs, up, pmq2->ps->clientNum, pmq2->tracemask);
ADDRLP4 36
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1160
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1160
INDIRP4
CNSTI4 168
ADDP4
ARGP4
ADDRLP4 1160
INDIRP4
CNSTI4 180
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
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 1160
INDIRP4
CNSTI4 204
ADDP4
INDIRP4
CALLV
pop
line 381
;380:
;381:	if (trace.allsolid)
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $232
line 382
;382:		return;		// can't step up
ADDRGP4 $228
JUMPV
LABELV $232
line 385
;383:
;384:	// try sliding above
;385:	VectorCopy(up, pmlq2.origin);
ADDRGP4 pmlq2
ADDRLP4 12
INDIRB
ASGNB 12
line 386
;386:	VectorCopy(start_v, pmlq2.velocity);
ADDRGP4 pmlq2+12
ADDRLP4 1140
INDIRB
ASGNB 12
line 388
;387:
;388:	PMQ2_StepSlideMove_();
ADDRGP4 PMQ2_StepSlideMove_
CALLV
pop
line 391
;389:
;390:	// push down the final amount
;391:	VectorCopy(pmlq2.origin, down);
ADDRLP4 1116
ADDRGP4 pmlq2
INDIRB
ASGNB 12
line 392
;392:	down[2] -= STEPSIZE;
ADDRLP4 1116+8
ADDRLP4 1116+8
INDIRF4
CNSTF4 1099956224
SUBF4
ASGNF4
line 393
;393:	pmq2->trace(&trace, pmlq2.origin, pmq2->mins, pmq2->maxs, down, pmq2->ps->clientNum, pmq2->tracemask);
ADDRLP4 36
ARGP4
ADDRGP4 pmlq2
ARGP4
ADDRLP4 1164
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 168
ADDP4
ARGP4
ADDRLP4 1164
INDIRP4
CNSTI4 180
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
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 1164
INDIRP4
CNSTI4 204
ADDP4
INDIRP4
CALLV
pop
line 394
;394:	if (!trace.allsolid)
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $236
line 395
;395:	{
line 396
;396:		VectorCopy(trace.endpos, pmlq2.origin);
ADDRGP4 pmlq2
ADDRLP4 36+12
INDIRB
ASGNB 12
line 397
;397:	}
LABELV $236
line 406
;398:
;399:#if 0
;400:	VectorSubtract(pmlq2.origin, up, delta);
;401:	up_dist = DotProduct(delta, start_v);
;402:
;403:	VectorSubtract(down_o, start_o, delta);
;404:	down_dist = DotProduct(delta, start_v);
;405:#else
;406:	VectorCopy(pmlq2.origin, up);
ADDRLP4 12
ADDRGP4 pmlq2
INDIRB
ASGNB 12
line 409
;407:
;408:	// decide which one went farther
;409:	down_dist = (down_o[0] - start_o[0]) * (down_o[0] - start_o[0])
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
line 411
;410:		+ (down_o[1] - start_o[1]) * (down_o[1] - start_o[1]);
;411:	up_dist = (up[0] - start_o[0]) * (up[0] - start_o[0])
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
line 415
;412:		+ (up[1] - start_o[1]) * (up[1] - start_o[1]);
;413:#endif
;414:
;415:	if (down_dist > up_dist || trace.plane.normal[2] < MIN_STEP_NORMAL)
ADDRLP4 1152
INDIRF4
ADDRLP4 1156
INDIRF4
GTF4 $251
ADDRLP4 36+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $247
LABELV $251
line 416
;416:	{
line 417
;417:		VectorCopy(down_o, pmlq2.origin);
ADDRGP4 pmlq2
ADDRLP4 24
INDIRB
ASGNB 12
line 418
;418:		VectorCopy(down_v, pmlq2.velocity);
ADDRGP4 pmlq2+12
ADDRLP4 1128
INDIRB
ASGNB 12
line 419
;419:		return;
ADDRGP4 $228
JUMPV
LABELV $247
line 421
;420:	}
;421:	else {
line 425
;422:		//if (pm->debugLevel) {
;423:		//	Com_Printf("%i:stepped up\n", c_pmove);
;424:		//}
;425:	}
line 428
;426:	//!! Special case
;427:	// if we were walking along a plane, then we need to copy the Z over
;428:	pmlq2.velocity[2] = down_v[2];
ADDRGP4 pmlq2+12+8
ADDRLP4 1128+8
INDIRF4
ASGNF4
line 429
;429:}
LABELV $228
endproc PMQ2_StepSlideMove 1176 28
export PMQ2_Friction
proc PMQ2_Friction 64 4
line 440
;430:
;431:
;432:/*
;433:==================
;434:PMQ2_Friction
;435:
;436:Handles both ground friction and water friction
;437:==================
;438:*/
;439:void PMQ2_Friction(void)
;440:{
line 446
;441:	float* vel;
;442:	float	speed, newspeed, control;
;443:	float	friction;
;444:	float	drop;
;445:
;446:	vel = pmlq2.velocity;
ADDRLP4 0
ADDRGP4 pmlq2+12
ASGNP4
line 448
;447:
;448:	speed = sqrt(vel[0] * vel[0] + vel[1] * vel[1] + vel[2] * vel[2]);
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
line 449
;449:	if (speed < 1)
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
GEF4 $258
line 450
;450:	{
line 451
;451:		vel[0] = 0;
ADDRLP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 452
;452:		vel[1] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 453
;453:		return;
ADDRGP4 $256
JUMPV
LABELV $258
line 456
;454:	}
;455:
;456:	drop = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 459
;457:
;458:	// apply ground friction
;459:	if ((pmq2->ps->groundEntityNum != ENTITYNUM_NONE && pmlq2.groundFound && !(pmlq2.surfaceFlags & SURF_SLICK)) || (pmlq2.ladder))
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $267
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 pmlq2+1176
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $267
ADDRGP4 pmlq2+92
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 44
INDIRI4
EQI4 $265
LABELV $267
ADDRGP4 pmlq2+1220
INDIRI4
CNSTI4 0
EQI4 $260
LABELV $265
line 460
;460:	{
line 461
;461:		friction = pmq2_friction;
ADDRLP4 20
ADDRGP4 pmq2_friction
INDIRF4
ASGNF4
line 462
;462:		control = speed < pmq2_stopspeed ? pmq2_stopspeed : speed;
ADDRLP4 8
INDIRF4
ADDRGP4 pmq2_stopspeed
INDIRF4
GEF4 $269
ADDRLP4 48
ADDRGP4 pmq2_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $270
JUMPV
LABELV $269
ADDRLP4 48
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $270
ADDRLP4 16
ADDRLP4 48
INDIRF4
ASGNF4
line 463
;463:		drop += control * friction * pmlq2.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
ADDF4
ASGNF4
line 464
;464:	}
LABELV $260
line 467
;465:
;466:	// apply water friction
;467:	if (pmq2->waterlevel && !pmlq2.ladder)
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRGP4 pmq2
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $272
ADDRGP4 pmlq2+1220
INDIRI4
ADDRLP4 48
INDIRI4
NEI4 $272
line 468
;468:		drop += speed * pmq2_waterfriction * pmq2->waterlevel * pmlq2.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pmq2_waterfriction
INDIRF4
MULF4
ADDRGP4 pmq2
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $272
line 471
;469:
;470:	// scale the velocity
;471:	newspeed = speed - drop;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 472
;472:	if (newspeed < 0)
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $276
line 473
;473:	{
line 474
;474:		newspeed = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 475
;475:	}
LABELV $276
line 476
;476:	newspeed /= speed;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 478
;477:
;478:	vel[0] = vel[0] * newspeed;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 479
;479:	vel[1] = vel[1] * newspeed;
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
line 480
;480:	vel[2] = vel[2] * newspeed;
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
line 481
;481:}
LABELV $256
endproc PMQ2_Friction 64 4
export PMQ2_Accelerate
proc PMQ2_Accelerate 28 0
line 492
;482:
;483:
;484:/*
;485:==============
;486:PMQ2_Accelerate
;487:
;488:Handles user intended acceleration
;489:==============
;490:*/
;491:void PMQ2_Accelerate(vec3_t wishdir, float wishspeed, float accel)
;492:{
line 496
;493:	int			i;
;494:	float		addspeed, accelspeed, currentspeed;
;495:
;496:	currentspeed = DotProduct(pmlq2.velocity, wishdir);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRGP4 pmlq2+12
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ADDRGP4 pmlq2+12+4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRGP4 pmlq2+12+8
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 497
;497:	addspeed = wishspeed - currentspeed;
ADDRLP4 8
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 498
;498:	if (addspeed <= 0)
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $284
line 499
;499:		return;
ADDRGP4 $278
JUMPV
LABELV $284
line 500
;500:	accelspeed = accel * pmlq2.frametime * wishspeed;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 501
;501:	if (accelspeed > addspeed)
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $287
line 502
;502:		accelspeed = addspeed;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $287
line 504
;503:
;504:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $289
line 505
;505:		pmlq2.velocity[i] += accelspeed * wishdir[i];
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 24
ADDRLP4 20
INDIRI4
ADDRGP4 pmlq2+12
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
LABELV $290
line 504
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $289
line 506
;506:}
LABELV $278
endproc PMQ2_Accelerate 28 0
export PMQ2_AirAccelerate
proc PMQ2_AirAccelerate 32 0
line 509
;507:
;508:void PMQ2_AirAccelerate(vec3_t wishdir, float wishspeed, float accel)
;509:{
line 511
;510:	int			i;
;511:	float		addspeed, accelspeed, currentspeed, wishspd = wishspeed;
ADDRLP4 12
ADDRFP4 4
INDIRF4
ASGNF4
line 513
;512:
;513:	if (wishspd > 30)
ADDRLP4 12
INDIRF4
CNSTF4 1106247680
LEF4 $295
line 514
;514:		wishspd = 30;
ADDRLP4 12
CNSTF4 1106247680
ASGNF4
LABELV $295
line 515
;515:	currentspeed = DotProduct(pmlq2.velocity, wishdir);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRGP4 pmlq2+12
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ADDRGP4 pmlq2+12+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRGP4 pmlq2+12+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 516
;516:	addspeed = wishspd - currentspeed;
ADDRLP4 8
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
line 517
;517:	if (addspeed <= 0)
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $302
line 518
;518:		return;
ADDRGP4 $294
JUMPV
LABELV $302
line 519
;519:	accelspeed = accel * wishspeed * pmlq2.frametime;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
ASGNF4
line 520
;520:	if (accelspeed > addspeed)
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $305
line 521
;521:		accelspeed = addspeed;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $305
line 523
;522:
;523:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $307
line 524
;524:		pmlq2.velocity[i] += accelspeed * wishdir[i];
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 28
ADDRLP4 24
INDIRI4
ADDRGP4 pmlq2+12
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
LABELV $308
line 523
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $307
line 525
;525:}
LABELV $294
endproc PMQ2_AirAccelerate 32 0
export PMQ2_AddCurrents
proc PMQ2_AddCurrents 20 4
line 533
;526:
;527:/*
;528:=============
;529:PMQ2_AddCurrents
;530:=============
;531:*/
;532:void PMQ2_AddCurrents(vec3_t	wishvel)
;533:{
line 541
;534:	vec3_t	v;
;535:	float	s;
;536:
;537:	//
;538:	// account for ladders
;539:	//
;540:
;541:	if (pmlq2.ladder && fabs(pmlq2.velocity[2]) <= 200)
ADDRGP4 pmlq2+1220
INDIRI4
CNSTI4 0
EQI4 $313
ADDRGP4 pmlq2+12+8
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 1128792064
GTF4 $313
line 542
;542:	{
line 543
;543:		if ((pmq2->ps->viewangles[PITCH] <= -15) && (pmlq2.forwardmove > 0))
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
CNSTF4 3245342720
GTF4 $318
ADDRGP4 pmlq2+1184
INDIRI4
CNSTI4 0
LEI4 $318
line 544
;544:			wishvel[2] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1128792064
ASGNF4
ADDRGP4 $319
JUMPV
LABELV $318
line 545
;545:		else if ((pmq2->ps->viewangles[PITCH] >= 15) && (pmlq2.forwardmove > 0))
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
CNSTF4 1097859072
LTF4 $321
ADDRGP4 pmlq2+1184
INDIRI4
CNSTI4 0
LEI4 $321
line 546
;546:			wishvel[2] = -200;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 3276275712
ASGNF4
ADDRGP4 $322
JUMPV
LABELV $321
line 547
;547:		else if (pmlq2.upmove > 0)
ADDRGP4 pmlq2+1192
INDIRI4
CNSTI4 0
LEI4 $324
line 548
;548:			wishvel[2] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1128792064
ASGNF4
ADDRGP4 $325
JUMPV
LABELV $324
line 549
;549:		else if (pmlq2.upmove < 0)
ADDRGP4 pmlq2+1192
INDIRI4
CNSTI4 0
GEI4 $327
line 550
;550:			wishvel[2] = -200;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 3276275712
ASGNF4
ADDRGP4 $328
JUMPV
LABELV $327
line 552
;551:		else
;552:			wishvel[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
LABELV $328
LABELV $325
LABELV $322
LABELV $319
line 555
;553:
;554:		// limit horizontal speed when on a ladder
;555:		if (wishvel[0] < -25)
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 3251109888
GEF4 $330
line 556
;556:			wishvel[0] = -25;
ADDRFP4 0
INDIRP4
CNSTF4 3251109888
ASGNF4
ADDRGP4 $331
JUMPV
LABELV $330
line 557
;557:		else if (wishvel[0] > 25)
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 1103626240
LEF4 $332
line 558
;558:			wishvel[0] = 25;
ADDRFP4 0
INDIRP4
CNSTF4 1103626240
ASGNF4
LABELV $332
LABELV $331
line 560
;559:
;560:		if (wishvel[1] < -25)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 3251109888
GEF4 $334
line 561
;561:			wishvel[1] = -25;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 3251109888
ASGNF4
ADDRGP4 $335
JUMPV
LABELV $334
line 562
;562:		else if (wishvel[1] > 25)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1103626240
LEF4 $336
line 563
;563:			wishvel[1] = 25;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1103626240
ASGNF4
LABELV $336
LABELV $335
line 564
;564:	}
LABELV $313
line 618
;565:
;566:
;567:	//
;568:	// add water currents
;569:	//
;570:	/* TA: doesn't exist in q3 engine
;571:	if (pmq2->watertype & MASK_CURRENT)
;572:	{
;573:		VectorClear(v);
;574:
;575:		if (pmq2->watertype & CONTENTS_CURRENT_0)
;576:			v[0] += 1;
;577:		if (pmq2->watertype & CONTENTS_CURRENT_90)
;578:			v[1] += 1;
;579:		if (pmq2->watertype & CONTENTS_CURRENT_180)
;580:			v[0] -= 1;
;581:		if (pmq2->watertype & CONTENTS_CURRENT_270)
;582:			v[1] -= 1;
;583:		if (pmq2->watertype & CONTENTS_CURRENT_UP)
;584:			v[2] += 1;
;585:		if (pmq2->watertype & CONTENTS_CURRENT_DOWN)
;586:			v[2] -= 1;
;587:
;588:		s = pmq2_waterspeed;
;589:		if ((pmq2->waterlevel == 1) && (pmq2->ps->groundEntityNum != ENTITYNUM_NONE))
;590:			s /= 2;
;591:
;592:		VectorMA(wishvel, s, v, wishvel);
;593:	}*/
;594:
;595:	//
;596:	// add conveyor belt velocities
;597:	//
;598:
;599:	//if (pmq2->ps->groundEntityNum != ENTITYNUM_NONE)
;600:	//{
;601:	//	VectorClear(v);
;602:
;603:	//	if (pmlq2.groundcontents & CONTENTS_CURRENT_0)
;604:	//		v[0] += 1;
;605:	//	if (pmlq2.groundcontents & CONTENTS_CURRENT_90)
;606:	//		v[1] += 1;
;607:	//	if (pmlq2.groundcontents & CONTENTS_CURRENT_180)
;608:	//		v[0] -= 1;
;609:	//	if (pmlq2.groundcontents & CONTENTS_CURRENT_270)
;610:	//		v[1] -= 1;
;611:	//	if (pmlq2.groundcontents & CONTENTS_CURRENT_UP)
;612:	//		v[2] += 1;
;613:	//	if (pmlq2.groundcontents & CONTENTS_CURRENT_DOWN)
;614:	//		v[2] -= 1;
;615:
;616:	//	VectorMA(wishvel, 100 /* pmq2->groundentity->speed */, v, wishvel);
;617:	//}
;618:}
LABELV $312
endproc PMQ2_AddCurrents 20 4
export PMQ2_WaterMove
proc PMQ2_WaterMove 48 12
line 628
;619:
;620:
;621:/*
;622:===================
;623:PMQ2_WaterMove
;624:
;625:===================
;626:*/
;627:void PMQ2_WaterMove(void)
;628:{
line 637
;629:	int		i;
;630:	vec3_t	wishvel;
;631:	float	wishspeed;
;632:	vec3_t	wishdir;
;633:
;634:	//
;635:	// user intentions
;636:	//
;637:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $339
line 638
;638:		wishvel[i] = pmlq2.forward[i] * pmlq2.forwardmove + pmlq2.right[i] * pmlq2.rightmove;
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
ADDRGP4 pmlq2+24
ADDP4
INDIRF4
ADDRGP4 pmlq2+1184
INDIRI4
CVIF4 4
MULF4
ADDRLP4 32
INDIRI4
ADDRGP4 pmlq2+36
ADDP4
INDIRF4
ADDRGP4 pmlq2+1188
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
LABELV $340
line 637
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $339
line 640
;639:
;640:	if (!pmlq2.forwardmove && !pmlq2.rightmove && !pmlq2.upmove)
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 pmlq2+1184
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $347
ADDRGP4 pmlq2+1188
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $347
ADDRGP4 pmlq2+1192
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $347
line 641
;641:		wishvel[2] -= 60;		// drift towards bottom
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1114636288
SUBF4
ASGNF4
ADDRGP4 $348
JUMPV
LABELV $347
line 643
;642:	else
;643:		wishvel[2] += pmlq2.upmove;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRGP4 pmlq2+1192
INDIRI4
CVIF4 4
ADDF4
ASGNF4
LABELV $348
line 645
;644:
;645:	PMQ2_AddCurrents(wishvel);
ADDRLP4 4
ARGP4
ADDRGP4 PMQ2_AddCurrents
CALLV
pop
line 647
;646:
;647:	VectorCopy(wishvel, wishdir);
ADDRLP4 20
ADDRLP4 4
INDIRB
ASGNB 12
line 648
;648:	wishspeed = VectorNormalize(wishdir);
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
line 650
;649:
;650:	pmq2->ps->speed = pmq2_maxspeed;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 pmq2_maxspeed
INDIRF4
CVFI4 4
ASGNI4
line 652
;651:
;652:	if (wishspeed > pmq2_maxspeed)
ADDRLP4 16
INDIRF4
ADDRGP4 pmq2_maxspeed
INDIRF4
LEF4 $355
line 653
;653:	{
line 654
;654:		VectorScale(wishvel, pmq2_maxspeed / wishspeed, wishvel);
ADDRLP4 44
ADDRGP4 pmq2_maxspeed
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
ADDRGP4 pmq2_maxspeed
INDIRF4
ADDRLP4 16
INDIRF4
DIVF4
MULF4
ASGNF4
line 655
;655:		wishspeed = pmq2_maxspeed;
ADDRLP4 16
ADDRGP4 pmq2_maxspeed
INDIRF4
ASGNF4
line 656
;656:	}
LABELV $355
line 657
;657:	wishspeed *= 0.5;
ADDRLP4 16
CNSTF4 1056964608
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 659
;658:
;659:	PMQ2_Accelerate(wishdir, wishspeed, pmq2_wateraccelerate);
ADDRLP4 20
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 pmq2_wateraccelerate
INDIRF4
ARGF4
ADDRGP4 PMQ2_Accelerate
CALLV
pop
line 660
;660:	PMQ2_UpdateAntiLoop();
ADDRGP4 PMQ2_UpdateAntiLoop
CALLV
pop
line 662
;661:
;662:	PMQ2_StepSlideMove();
ADDRGP4 PMQ2_StepSlideMove
CALLV
pop
line 663
;663:	PMQ2_UpdateAntiLoop();
ADDRGP4 PMQ2_UpdateAntiLoop
CALLV
pop
line 664
;664:}
LABELV $338
endproc PMQ2_WaterMove 48 12
export PMQ2_AirMove
proc PMQ2_AirMove 64 12
line 674
;665:
;666:
;667:/*
;668:===================
;669:PMQ2_AirMove
;670:
;671:===================
;672:*/
;673:void PMQ2_AirMove(void)
;674:{
line 682
;675:	int			i;
;676:	vec3_t		wishvel;
;677:	float		fmove, smove;
;678:	vec3_t		wishdir;
;679:	float		wishspeed;
;680:	float		maxspeed;
;681:
;682:	fmove = pmlq2.forwardmove;
ADDRLP4 16
ADDRGP4 pmlq2+1184
INDIRI4
CVIF4 4
ASGNF4
line 683
;683:	smove = pmlq2.rightmove;
ADDRLP4 20
ADDRGP4 pmlq2+1188
INDIRI4
CVIF4 4
ASGNF4
line 693
;684:
;685:	//!!!!! pitch should be 1/3 so this isn't needed??!
;686:#if 0
;687:	pmlq2.forward[2] = 0;
;688:	pmlq2.right[2] = 0;
;689:	VectorNormalize(pmlq2.forward);
;690:	VectorNormalize(pmlq2.right);
;691:#endif
;692:
;693:	for (i = 0; i < 2; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $364
line 694
;694:		wishvel[i] = pmlq2.forward[i] * fmove + pmlq2.right[i] * smove;
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
ADDRGP4 pmlq2+24
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 44
INDIRI4
ADDRGP4 pmlq2+36
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $365
line 693
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $364
line 695
;695:	wishvel[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 697
;696:
;697:	PMQ2_AddCurrents(wishvel);
ADDRLP4 4
ARGP4
ADDRGP4 PMQ2_AddCurrents
CALLV
pop
line 699
;698:
;699:	VectorCopy(wishvel, wishdir);
ADDRLP4 32
ADDRLP4 4
INDIRB
ASGNB 12
line 700
;700:	wishspeed = VectorNormalize(wishdir);
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
line 705
;701:
;702:	//
;703:	// clamp to server defined max speed
;704:	//
;705:	maxspeed = (pmq2->ps->pm_flags & PMF_DUCKED) ? pmq2_duckspeed : pmq2_maxspeed;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $372
ADDRLP4 52
ADDRGP4 pmq2_duckspeed
INDIRF4
ASGNF4
ADDRGP4 $373
JUMPV
LABELV $372
ADDRLP4 52
ADDRGP4 pmq2_maxspeed
INDIRF4
ASGNF4
LABELV $373
ADDRLP4 28
ADDRLP4 52
INDIRF4
ASGNF4
line 707
;706:
;707:	pmq2->ps->speed = maxspeed;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 709
;708:
;709:	if (wishspeed > maxspeed)
ADDRLP4 24
INDIRF4
ADDRLP4 28
INDIRF4
LEF4 $374
line 710
;710:	{
line 711
;711:		VectorScale(wishvel, maxspeed / wishspeed, wishvel);
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
line 712
;712:		wishspeed = maxspeed;
ADDRLP4 24
ADDRLP4 28
INDIRF4
ASGNF4
line 713
;713:	}
LABELV $374
line 715
;714:
;715:	if (pmlq2.ladder)
ADDRGP4 pmlq2+1220
INDIRI4
CNSTI4 0
EQI4 $380
line 716
;716:	{
line 717
;717:		PMQ2_Accelerate(wishdir, wishspeed, pmq2_accelerate);
ADDRLP4 32
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRGP4 pmq2_accelerate
INDIRF4
ARGF4
ADDRGP4 PMQ2_Accelerate
CALLV
pop
line 718
;718:		PMQ2_UpdateAntiLoop();
ADDRGP4 PMQ2_UpdateAntiLoop
CALLV
pop
line 719
;719:		if (!wishvel[2])
ADDRLP4 4+8
INDIRF4
CNSTF4 0
NEF4 $383
line 720
;720:		{
line 721
;721:			if (pmlq2.velocity[2] > 0)
ADDRGP4 pmlq2+12+8
INDIRF4
CNSTF4 0
LEF4 $386
line 722
;722:			{
line 723
;723:				pmlq2.velocity[2] -= pmq2->ps->gravity * pmlq2.frametime;
ADDRLP4 56
ADDRGP4 pmlq2+12+8
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
SUBF4
ASGNF4
line 724
;724:				if (pmlq2.velocity[2] < 0)
ADDRGP4 pmlq2+12+8
INDIRF4
CNSTF4 0
GEF4 $387
line 725
;725:					pmlq2.velocity[2] = 0;
ADDRGP4 pmlq2+12+8
CNSTF4 0
ASGNF4
line 726
;726:			}
ADDRGP4 $387
JUMPV
LABELV $386
line 728
;727:			else
;728:			{
line 729
;729:				pmlq2.velocity[2] += pmq2->ps->gravity * pmlq2.frametime;
ADDRLP4 56
ADDRGP4 pmlq2+12+8
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
ADDF4
ASGNF4
line 730
;730:				if (pmlq2.velocity[2] > 0)
ADDRGP4 pmlq2+12+8
INDIRF4
CNSTF4 0
LEF4 $402
line 731
;731:					pmlq2.velocity[2] = 0;
ADDRGP4 pmlq2+12+8
CNSTF4 0
ASGNF4
LABELV $402
line 732
;732:			}
LABELV $387
line 733
;733:		}
LABELV $383
line 734
;734:		PMQ2_StepSlideMove();
ADDRGP4 PMQ2_StepSlideMove
CALLV
pop
line 735
;735:		PMQ2_UpdateAntiLoop();
ADDRGP4 PMQ2_UpdateAntiLoop
CALLV
pop
line 736
;736:	}
ADDRGP4 $381
JUMPV
LABELV $380
line 737
;737:	else if (pmq2->ps->groundEntityNum != ENTITYNUM_NONE)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $408
line 738
;738:	{	// walking on ground
line 739
;739:		pmlq2.velocity[2] = 0; //!!! this is before the accel
ADDRGP4 pmlq2+12+8
CNSTF4 0
ASGNF4
line 740
;740:		PMQ2_Accelerate(wishdir, wishspeed, pmq2_accelerate);
ADDRLP4 32
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRGP4 pmq2_accelerate
INDIRF4
ARGF4
ADDRGP4 PMQ2_Accelerate
CALLV
pop
line 741
;741:		PMQ2_UpdateAntiLoop();
ADDRGP4 PMQ2_UpdateAntiLoop
CALLV
pop
line 745
;742:
;743:		// PGM	-- fix for negative trigger_gravity fields
;744:		//		pmlq2.velocity[2] = 0;
;745:		if (pmq2->ps->gravity > 0)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 0
LEI4 $412
line 746
;746:			pmlq2.velocity[2] = 0;
ADDRGP4 pmlq2+12+8
CNSTF4 0
ASGNF4
ADDRGP4 $413
JUMPV
LABELV $412
line 748
;747:		else
;748:			pmlq2.velocity[2] -= pmq2->ps->gravity * pmlq2.frametime;
ADDRLP4 56
ADDRGP4 pmlq2+12+8
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
SUBF4
ASGNF4
LABELV $413
line 751
;749:		// PGM
;750:
;751:		if (!pmlq2.velocity[0] && !pmlq2.velocity[1])
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRGP4 pmlq2+12
INDIRF4
ADDRLP4 60
INDIRF4
NEF4 $419
ADDRGP4 pmlq2+12+4
INDIRF4
ADDRLP4 60
INDIRF4
NEF4 $419
line 752
;752:			return;
ADDRGP4 $361
JUMPV
LABELV $419
line 753
;753:		PMQ2_StepSlideMove();
ADDRGP4 PMQ2_StepSlideMove
CALLV
pop
line 754
;754:		PMQ2_UpdateAntiLoop();
ADDRGP4 PMQ2_UpdateAntiLoop
CALLV
pop
line 755
;755:	}
ADDRGP4 $409
JUMPV
LABELV $408
line 757
;756:	else
;757:	{	// not on ground, so little effect on velocity
line 758
;758:		if (pmq2_airaccelerate)
ADDRGP4 pmq2_airaccelerate
INDIRF4
CNSTF4 0
EQF4 $424
line 759
;759:			PMQ2_AirAccelerate(wishdir, wishspeed, pmq2_accelerate);
ADDRLP4 32
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRGP4 pmq2_accelerate
INDIRF4
ARGF4
ADDRGP4 PMQ2_AirAccelerate
CALLV
pop
ADDRGP4 $425
JUMPV
LABELV $424
line 761
;760:		else
;761:			PMQ2_Accelerate(wishdir, wishspeed, 1);
ADDRLP4 32
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 PMQ2_Accelerate
CALLV
pop
LABELV $425
line 763
;762:
;763:		PMQ2_UpdateAntiLoop();
ADDRGP4 PMQ2_UpdateAntiLoop
CALLV
pop
line 766
;764:
;765:		// add gravity
;766:		pmlq2.velocity[2] -= pmq2->ps->gravity * pmlq2.frametime;
ADDRLP4 56
ADDRGP4 pmlq2+12+8
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
SUBF4
ASGNF4
line 767
;767:		PMQ2_StepSlideMove();
ADDRGP4 PMQ2_StepSlideMove
CALLV
pop
line 768
;768:		PMQ2_UpdateAntiLoop();
ADDRGP4 PMQ2_UpdateAntiLoop
CALLV
pop
line 769
;769:	}
LABELV $409
LABELV $381
line 770
;770:}
LABELV $361
endproc PMQ2_AirMove 64 12
export PMQ2_CatagorizePosition
proc PMQ2_CatagorizePosition 1132 28
line 780
;771:
;772:
;773:
;774:/*
;775:=============
;776:PMQ2_CatagorizePosition
;777:=============
;778:*/
;779:void PMQ2_CatagorizePosition(int type)
;780:{
line 791
;781:	vec3_t		point;
;782:	int			cont;
;783:	trace_t		trace;
;784:	int			sample1;
;785:	int			sample2;
;786:
;787:	// if the player hull point one unit down is solid, the player
;788:	// is on ground
;789:
;790:	// see if standing on something solid	
;791:	point[0] = pmlq2.origin[0];
ADDRLP4 0
ADDRGP4 pmlq2
INDIRF4
ASGNF4
line 792
;792:	point[1] = pmlq2.origin[1];
ADDRLP4 0+4
ADDRGP4 pmlq2+4
INDIRF4
ASGNF4
line 793
;793:	point[2] = pmlq2.origin[2] - 0.25;
ADDRLP4 0+8
ADDRGP4 pmlq2+8
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 794
;794:	if (pmlq2.velocity[2] > 180) //!!ZOID changed from 100 to 180 (ramp accel)
ADDRGP4 pmlq2+12+8
INDIRF4
CNSTF4 1127481344
LEF4 $434
line 795
;795:	{
line 797
;796:		//pmq2->ps->pm_flags &= ~PMF_ON_GROUND;
;797:		pmq2->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 798
;798:	}
ADDRGP4 $435
JUMPV
LABELV $434
line 800
;799:	else
;800:	{
line 801
;801:		pmq2->trace(&trace, pmlq2.origin, pmq2->mins, pmq2->maxs, point, pmq2->ps->clientNum, pmq2->tracemask);
ADDRLP4 12
ARGP4
ADDRGP4 pmlq2
ARGP4
ADDRLP4 1104
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 168
ADDP4
ARGP4
ADDRLP4 1104
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1104
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1104
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 1104
INDIRP4
CNSTI4 204
ADDP4
INDIRP4
CALLV
pop
line 802
;802:		pmlq2.groundplane = trace.plane;
ADDRGP4 pmlq2+68
ADDRLP4 12+24
INDIRB
ASGNB 20
line 804
;803:		//pmlq2.groundsurface = trace.surface;
;804:		pmlq2.surfaceFlags = trace.surfaceFlags;
ADDRGP4 pmlq2+92
ADDRLP4 12+44
INDIRI4
ASGNI4
line 805
;805:		pmlq2.groundcontents = trace.contents;
ADDRGP4 pmlq2+88
ADDRLP4 12+48
INDIRI4
ASGNI4
line 806
;806:		pmlq2.groundFound = trace.entityNum != ENTITYNUM_NONE; // is this right?
ADDRLP4 12+52
INDIRI4
CNSTI4 1023
EQI4 $447
ADDRLP4 1108
CNSTI4 1
ASGNI4
ADDRGP4 $448
JUMPV
LABELV $447
ADDRLP4 1108
CNSTI4 0
ASGNI4
LABELV $448
ADDRGP4 pmlq2+1176
ADDRLP4 1108
INDIRI4
ASGNI4
line 815
;807:
;808:#ifdef CRINGY_STUCK_DEBUG
;809:		if (trace.allsolid) {
;810:			// step into it.
;811:			pmq2->trace(&trace, pmlq2.origin, pmq2->mins, pmq2->maxs, point, pmq2->ps->clientNum, pmq2->tracemask);
;812:		}
;813:#endif
;814:
;815:		if (trace.entityNum == ENTITYNUM_NONE || (trace.plane.normal[2] < 0.7 && !trace.startsolid))
ADDRLP4 12+52
INDIRI4
CNSTI4 1023
EQI4 $455
ADDRLP4 12+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $449
ADDRLP4 12+4
INDIRI4
CNSTI4 0
NEI4 $449
LABELV $455
line 816
;816:		{
line 817
;817:			pmq2->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 819
;818:			//pmq2->ps->pm_flags &= ~PMF_ON_GROUND;
;819:		}
ADDRGP4 $450
JUMPV
LABELV $449
line 821
;820:		else
;821:		{
line 824
;822:
;823:
;824:			int oldGroundEntityNum = pmq2->ps->groundEntityNum;
ADDRLP4 1112
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 825
;825:			pmq2->ps->groundEntityNum = trace.entityNum;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 12+52
INDIRI4
ASGNI4
line 828
;826:
;827:			// hitting solid ground will end a waterjump
;828:			if (pmq2->ps->pm_flags & PMF_TIME_WATERJUMP)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $457
line 829
;829:			{
line 830
;830:				pmq2->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND/* | PMF_TIME_TELEPORT*/);
ADDRLP4 1116
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRI4
CNSTI4 -289
BANDI4
ASGNI4
line 831
;831:				pmq2->ps->pm_time = 0;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 832
;832:			}
LABELV $457
line 835
;833:
;834:			//if (!(pmq2->ps->pm_flags & PMF_ON_GROUND))
;835:			if (oldGroundEntityNum == ENTITYNUM_NONE)
ADDRLP4 1112
INDIRI4
CNSTI4 1023
NEI4 $459
line 836
;836:			{	// just hit the ground
line 839
;837:
;838:
;839:				if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $461
line 840
;840:					Com_Printf("%i:landed, pmlq2.velocity[2] %f (call %d)\n", c_pmove, pmlq2.velocity[2],type);
ADDRGP4 $463
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 pmlq2+12+8
INDIRF4
ARGF4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 841
;841:				}
LABELV $461
line 844
;842:
;843:				// Thanks to Loda for making this fix and Daggo for pointing me to it.
;844:				if ((trace.plane.normal[0] != 0.0f || trace.plane.normal[1] != 0.0f || trace.plane.normal[2] != 1.0f))// don't count them during special predict
ADDRLP4 1116
CNSTF4 0
ASGNF4
ADDRLP4 12+24
INDIRF4
ADDRLP4 1116
INDIRF4
NEF4 $474
ADDRLP4 12+24+4
INDIRF4
ADDRLP4 1116
INDIRF4
NEF4 $474
ADDRLP4 12+24+8
INDIRF4
CNSTF4 1065353216
EQF4 $466
LABELV $474
line 845
;845:				{ // It's a ramp!
line 846
;846:					if (!pmlq2.clipped)
ADDRGP4 pmlq2+1180
INDIRI4
CNSTI4 0
NEI4 $475
line 847
;847:					{
line 852
;848:						// TODO should we do more checks here to make sure it behaves same as normal clip would? 
;849:						// the trace.plane.normal[2] != 1.0f check in particular seems sus no? since the slidemove stuff
;850:						// works more with various dot products to determine whether to clip etc. oh well. fuck it.
;851:
;852:						if (pm->modParms.runFlags & RFL_NODEADRAMPS) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $478
line 854
;853:
;854:							PMQ2_ClipVelocity(pmlq2.velocity, trace.plane.normal, pmlq2.velocity, 1.01);
ADDRGP4 pmlq2+12
ARGP4
ADDRLP4 12+24
ARGP4
ADDRGP4 pmlq2+12
ARGP4
CNSTF4 1065437102
ARGF4
ADDRGP4 PMQ2_ClipVelocity
CALLV
pop
line 855
;855:							PMQ2_UpdateAntiLoop();
ADDRGP4 PMQ2_UpdateAntiLoop
CALLV
pop
line 857
;856:
;857:							if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $476
line 858
;858:								Com_Printf("%i:Dead ramp fixed\n", c_pmove);
ADDRGP4 $485
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 859
;859:							}
line 860
;860:						}
ADDRGP4 $476
JUMPV
LABELV $478
line 861
;861:						else {
line 862
;862:							if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $476
line 863
;863:								Com_Printf("%i:Dead ramp\n", c_pmove);
ADDRGP4 $488
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 864
;864:							}
line 865
;865:						}
line 866
;866:					}
ADDRGP4 $476
JUMPV
LABELV $475
line 867
;867:					else {
line 868
;868:						if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $489
line 869
;869:							Com_Printf("%i:Good ramp\n", c_pmove);
ADDRGP4 $491
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 870
;870:						}
LABELV $489
line 871
;871:					}
LABELV $476
line 872
;872:				}
LABELV $466
line 875
;873:
;874:
;875:				if (pmq2->cornerSkims >= 5) {
ADDRGP4 pmq2
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 5
LTI4 $492
line 889
;876:					// this is NONSTANDARD q2 behavior, but in some situations it may happen as you can see below.
;877:					// the idea of the standard heavior is that you get more pm_time the faster you fall, but obviously
;878:					// that doesn't work out by default since slidemove will already take away the Z velocity most of the time
;879:					// We allow pmq2->cornerSkims to set the amount of pm_time added. the high value is supposed to be reserved
;880:					// for higher falls but gives more boost 
;881:					//
;882:					// uhm anyway in normal q3 code this all works via pml.previous_velocity which we could do here too (check -200)
;883:					// and maybe we will, so consider this just a proof of concept
;884:					// the problem with that would be that there may not be a previous_velocity due to only reaching ground as a result of 
;885:					// 1/8 origin snapping of the previous pmove at the start of the new pmove, so that would ahve to be solved as well
;886:					// but if we did that maybe we should use the logic from below (make downspeed dictate amount of pm_time)
;887:					//
;888:					// 
;889:					pmq2->ps->pm_flags |= PMF_TIME_LAND; 
ADDRLP4 1120
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1120
INDIRP4
ADDRLP4 1120
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 890
;890:					pmq2->ps->pm_time = pmq2->cornerSkims == 6 ? 25 : 18;
ADDRLP4 1128
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 6
NEI4 $495
ADDRLP4 1124
CNSTI4 25
ASGNI4
ADDRGP4 $496
JUMPV
LABELV $495
ADDRLP4 1124
CNSTI4 18
ASGNI4
LABELV $496
ADDRLP4 1128
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 1124
INDIRI4
ASGNI4
line 891
;891:					if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $493
line 892
;892:						Com_Printf("%i:PMF_TIME_LAND, cornerSkims %d, pmlq2.previous_velocity[2] %f, pmlq2.velocity[2] %f (call %d)\n", c_pmove, pmq2->cornerSkims,pmlq2.previous_velocity[2],pmlq2.velocity[2], type);
ADDRGP4 $499
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 pmq2
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 pmlq2+1208+8
INDIRF4
ARGF4
ADDRGP4 pmlq2+12+8
INDIRF4
ARGF4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 893
;893:					}
line 894
;894:				}
ADDRGP4 $493
JUMPV
LABELV $492
line 895
;895:				else if (pmq2->cornerSkims >= 1) {
ADDRGP4 pmq2
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 1
LTI4 $504
line 900
;896:					// this restores originally intended behavior (sorta) of q2 (using previous_velocity instead of velocity 
;897:					// which will usually already have killed downward speed through slidemove
;898:					// 
;899:
;900:					if (pmlq2.previous_velocity[2] < -200) {
ADDRGP4 pmlq2+1208+8
INDIRF4
CNSTF4 3276275712
GEF4 $505
line 901
;901:						pmq2->ps->pm_flags |= PMF_TIME_LAND;
ADDRLP4 1120
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1120
INDIRP4
ADDRLP4 1120
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 903
;902:						// don't allow another jump for a little while (TA: it does allow jump if rampfix is active, it just lets us skim corners)
;903:						if (pmq2->cornerSkims <= 2) { 
ADDRGP4 pmq2
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 2
GTI4 $510
line 908
;904:							// value 1 and 2 of cornerSkims restores "intended" q2 behavior based on previous_velocity
;905:							// value 1 is truly vanilla because it wont let us jump afterwards as q2 devs intended.
;906:							// value 2 will but keep the rest vanilla. 
;907:							// 
;908:							if (pmlq2.previous_velocity[2] < -400)
ADDRGP4 pmlq2+1208+8
INDIRF4
CNSTF4 3284664320
GEF4 $512
line 909
;909:								pmq2->ps->pm_time = 25;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 25
ASGNI4
ADDRGP4 $511
JUMPV
LABELV $512
line 911
;910:							else
;911:								pmq2->ps->pm_time = 18;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 18
ASGNI4
line 912
;912:						}
ADDRGP4 $511
JUMPV
LABELV $510
line 913
;913:						else {//if (pmq2->cornerSkims > 2) {
line 915
;914:							// values 3 and 4 of cornerSkims behave more like q3 with fixed pm_time no matter the actual previous_velocitty as long as its under negative 200
;915:							pmq2->ps->pm_time = pmq2->cornerSkims == 4 ? 25 : 18;
ADDRLP4 1128
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 4
NEI4 $517
ADDRLP4 1124
CNSTI4 25
ASGNI4
ADDRGP4 $518
JUMPV
LABELV $517
ADDRLP4 1124
CNSTI4 18
ASGNI4
LABELV $518
ADDRLP4 1128
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 1124
INDIRI4
ASGNI4
line 916
;916:						}
LABELV $511
line 917
;917:						if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $505
line 918
;918:							Com_Printf("%i:PMF_TIME_LAND, pm_time %d, cornerSkims %d, pmlq2.previous_velocity[2] %f (call %d)\n", c_pmove, pmq2->ps->pm_time, pmq2->cornerSkims, pmlq2.previous_velocity[2], type);
ADDRGP4 $521
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRLP4 1124
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 1124
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 pmlq2+1208+8
INDIRF4
ARGF4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 919
;919:						}
line 920
;920:					}
line 922
;921:
;922:				}
ADDRGP4 $505
JUMPV
LABELV $504
line 925
;923:				//pmq2->ps->pm_flags |= PMF_ON_GROUND;
;924:				// don't do landing time if we were just going down a slope
;925:				else if (pmlq2.velocity[2] < -200 && !(pm->modParms.runFlags & RFL_NODEADRAMPS))
ADDRGP4 pmlq2+12+8
INDIRF4
CNSTF4 3276275712
GEF4 $524
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $524
line 926
;926:				{
line 939
;927:					// rampfix removes rng-feeling vanilla behavior here by not setting pm_time ever.
;928:					// in normal gameplay pm_time is almost never set but when it IS set, it wont let us jump and feel terrible
;929:					// 
;930:					// a good example of this is com_physicsfps 142 on shitstrafe3. we constantly get stopped.
;931:					// 
;932:					// rampfix already also fixes that jump wont trigger wwhen PMF_TIME_LAND is in pm_flags
;933:					// however we still don't want it to get randomly set because it allows corner skims
;934:					// and for competitive defrag we dont want a 1-in-a-million technique to become the way 
;935:					// to win a map
;936:					// 
;937:					// See above code (pmq2->cornerSkims) for a more q3 like behavior for skimming corners
;938:
;939:					pmq2->ps->pm_flags |= PMF_TIME_LAND;
ADDRLP4 1120
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1120
INDIRP4
ADDRLP4 1120
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 941
;940:					// don't allow another jump for a little while
;941:					if (pmlq2.velocity[2] < -400)
ADDRGP4 pmlq2+12+8
INDIRF4
CNSTF4 3284664320
GEF4 $528
line 942
;942:						pmq2->ps->pm_time = 25;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 25
ASGNI4
ADDRGP4 $529
JUMPV
LABELV $528
line 944
;943:					else
;944:						pmq2->ps->pm_time = 18;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 18
ASGNI4
LABELV $529
line 946
;945:
;946:					if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $532
line 947
;947:						Com_Printf("%i:PMF_TIME_LAND, pmlq2.velocity[2] %f (call %d)\n", c_pmove, pmlq2.velocity[2],type);
ADDRGP4 $534
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 pmlq2+12+8
INDIRF4
ARGF4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 948
;948:					}
LABELV $532
line 949
;949:				}
LABELV $524
LABELV $505
LABELV $493
line 950
;950:			}
LABELV $459
line 951
;951:		}
LABELV $450
line 958
;952:
;953:#if 0
;954:		if (trace.fraction < 1.0 && trace.ent && pmlq2.velocity[2] < 0)
;955:			pmlq2.velocity[2] = 0;
;956:#endif
;957:
;958:		if (pmq2->numtouch < MAXTOUCH && trace.entityNum != ENTITYNUM_NONE)
ADDRGP4 pmq2
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 32
GEI4 $537
ADDRLP4 12+52
INDIRI4
CNSTI4 1023
EQI4 $537
line 959
;959:		{
line 960
;960:			pmq2->touchents[pmq2->numtouch] = trace.entityNum;
ADDRLP4 1112
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1112
INDIRP4
CNSTI4 40
ADDP4
ADDP4
ADDRLP4 12+52
INDIRI4
ASGNI4
line 961
;961:			pmq2->numtouch++;
ADDRLP4 1116
ADDRGP4 pmq2
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 962
;962:		}
LABELV $537
line 963
;963:	}
LABELV $435
line 968
;964:
;965:	//
;966:	// get waterlevel, accounting for ducking
;967:	//
;968:	pmq2->waterlevel = 0;
ADDRGP4 pmq2
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 0
ASGNI4
line 969
;969:	pmq2->watertype = 0;
ADDRGP4 pmq2
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 971
;970:
;971:	sample2 = pmq2->ps->viewheight - pmq2->mins[2];
ADDRLP4 1104
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1096
ADDRLP4 1104
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 1104
INDIRP4
CNSTI4 176
ADDP4
INDIRF4
SUBF4
CVFI4 4
ASGNI4
line 972
;972:	sample1 = sample2 / 2;
ADDRLP4 1100
ADDRLP4 1096
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 974
;973:
;974:	point[2] = pmlq2.origin[2] + pmq2->mins[2] + 1;
ADDRLP4 0+8
ADDRGP4 pmlq2+8
INDIRF4
ADDRGP4 pmq2
INDIRP4
CNSTI4 176
ADDP4
INDIRF4
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 975
;975:	cont = pmq2->pointcontents(point,pmq2->ps->clientNum);
ADDRLP4 0
ARGP4
ADDRLP4 1108
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1112
ADDRLP4 1108
INDIRP4
CNSTI4 208
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1092
ADDRLP4 1112
INDIRI4
ASGNI4
line 977
;976:
;977:	if (cont & MASK_WATER)
ADDRLP4 1092
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
EQI4 $543
line 978
;978:	{
line 979
;979:		pmq2->watertype = cont;
ADDRGP4 pmq2
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 1092
INDIRI4
ASGNI4
line 980
;980:		pmq2->waterlevel = 1;
ADDRGP4 pmq2
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 1
ASGNI4
line 981
;981:		point[2] = pmlq2.origin[2] + pmq2->mins[2] + sample1;
ADDRLP4 0+8
ADDRGP4 pmlq2+8
INDIRF4
ADDRGP4 pmq2
INDIRP4
CNSTI4 176
ADDP4
INDIRF4
ADDF4
ADDRLP4 1100
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 982
;982:		cont = pmq2->pointcontents(point,pmq2->ps->clientNum);
ADDRLP4 0
ARGP4
ADDRLP4 1116
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1120
ADDRLP4 1116
INDIRP4
CNSTI4 208
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1092
ADDRLP4 1120
INDIRI4
ASGNI4
line 983
;983:		if (cont & MASK_WATER)
ADDRLP4 1092
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
EQI4 $547
line 984
;984:		{
line 985
;985:			pmq2->waterlevel = 2;
ADDRGP4 pmq2
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 2
ASGNI4
line 986
;986:			point[2] = pmlq2.origin[2] + pmq2->mins[2] + sample2;
ADDRLP4 0+8
ADDRGP4 pmlq2+8
INDIRF4
ADDRGP4 pmq2
INDIRP4
CNSTI4 176
ADDP4
INDIRF4
ADDF4
ADDRLP4 1096
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 987
;987:			cont = pmq2->pointcontents(point, pmq2->ps->clientNum);
ADDRLP4 0
ARGP4
ADDRLP4 1124
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1128
ADDRLP4 1124
INDIRP4
CNSTI4 208
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1092
ADDRLP4 1128
INDIRI4
ASGNI4
line 988
;988:			if (cont & MASK_WATER)
ADDRLP4 1092
INDIRI4
CNSTI4 131078
BANDI4
CNSTI4 0
EQI4 $551
line 989
;989:				pmq2->waterlevel = 3;
ADDRGP4 pmq2
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 3
ASGNI4
LABELV $551
line 990
;990:		}
LABELV $547
line 991
;991:	}
LABELV $543
line 993
;992:
;993:}
LABELV $429
endproc PMQ2_CatagorizePosition 1132 28
export PMQ2_CheckJump
proc PMQ2_CheckJump 12 8
line 1002
;994:
;995:
;996:/*
;997:=============
;998:PMQ2_CheckJump
;999:=============
;1000:*/
;1001:void PMQ2_CheckJump(void)
;1002:{
line 1003
;1003:	if (pmq2->ps->pm_flags & PMF_TIME_LAND)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $554
line 1004
;1004:	{	// hasn't been long enough since landing to jump again
line 1006
;1005:
;1006:		if (pmq2->cornerSkims) {
ADDRGP4 pmq2
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 0
EQI4 $556
line 1007
;1007:			if (pmq2->cornerSkims == 1) {
ADDRGP4 pmq2
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
CNSTI4 1
NEI4 $557
line 1008
;1008:				return; // cornerSkims 1 == originally intended vanilla q2 behavior (feels bad, wont be able to bunnyhop)
ADDRGP4 $553
JUMPV
line 1010
;1009:			}
;1010:			else {
line 1012
;1011:				// above 1 cornerSkims we can actually skim corners regularly
;1012:			}
line 1013
;1013:		}
LABELV $556
line 1014
;1014:		else if (pm->modParms.runFlags & RFL_NODEADRAMPS) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $553
line 1021
;1015:			// kinda in the same spirit tbh. this behaves like an RNG that sometimes wont let us hop and keep speed.
;1016:			// different fps makes it behave differently as well. it feels really bad.
;1017:			// depending on whether the even floor was clipped during the slidemove,
;1018:			// PMF_TIME_LAND will be set or not, as its dependent on downward speed,
;1019:			// but the slidemove clipping will eliminate that downward speed (or not),
;1020:			// so this is essentially completely pointless RNG
;1021:		}
line 1022
;1022:		else {
line 1023
;1023:			return;
LABELV $561
LABELV $557
line 1025
;1024:		}
;1025:	}
LABELV $554
line 1027
;1026:
;1027:	if (pmlq2.upmove < 10)
ADDRGP4 pmlq2+1192
INDIRI4
CNSTI4 10
GEI4 $562
line 1028
;1028:	{	// not holding jump
line 1029
;1029:		pmq2->ps->pm_flags &= ~PMF_JUMP_HELD;
ADDRLP4 0
ADDRGP4 pmq2
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
line 1030
;1030:		return;
ADDRGP4 $553
JUMPV
LABELV $562
line 1034
;1031:	}
;1032:
;1033:	// must wait for jump to be released
;1034:	if (pmq2->ps->pm_flags & PMF_JUMP_HELD)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $565
line 1035
;1035:		return;
ADDRGP4 $553
JUMPV
LABELV $565
line 1037
;1036:
;1037:	if (pmq2->ps->pm_type == PM_DEAD)
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRGP4 pmq2
INDIRP4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $567
line 1038
;1038:		return;
ADDRGP4 $553
JUMPV
LABELV $567
line 1040
;1039:
;1040:	if (pmq2->waterlevel >= 2)
ADDRGP4 pmq2
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 2
LTI4 $569
line 1041
;1041:	{	// swimming, not jumping
line 1042
;1042:		pmq2->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 1044
;1043:
;1044:		if (pmlq2.velocity[2] <= -300)
ADDRGP4 pmlq2+12+8
INDIRF4
CNSTF4 3281387520
GTF4 $571
line 1045
;1045:			return;
ADDRGP4 $553
JUMPV
LABELV $571
line 1047
;1046:
;1047:		if (pmq2->watertype == CONTENTS_WATER)
ADDRGP4 pmq2
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 4
NEI4 $575
line 1048
;1048:			pmlq2.velocity[2] = 100;
ADDRGP4 pmlq2+12+8
CNSTF4 1120403456
ASGNF4
ADDRGP4 $553
JUMPV
LABELV $575
line 1049
;1049:		else if (pmq2->watertype == CONTENTS_SLIME)
ADDRGP4 pmq2
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 131072
NEI4 $579
line 1050
;1050:			pmlq2.velocity[2] = 80;
ADDRGP4 pmlq2+12+8
CNSTF4 1117782016
ASGNF4
ADDRGP4 $553
JUMPV
LABELV $579
line 1052
;1051:		else
;1052:			pmlq2.velocity[2] = 50;
ADDRGP4 pmlq2+12+8
CNSTF4 1112014848
ASGNF4
line 1053
;1053:		return;
ADDRGP4 $553
JUMPV
LABELV $569
line 1056
;1054:	}
;1055:
;1056:	if (pmq2->ps->groundEntityNum == ENTITYNUM_NONE)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $585
line 1057
;1057:		return;		// in air, so no effect
ADDRGP4 $553
JUMPV
LABELV $585
line 1059
;1058:
;1059:	pmq2->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 4
ADDRGP4 pmq2
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
line 1061
;1060:
;1061:	pmq2->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 1023
ASGNI4
line 1062
;1062:	pmlq2.velocity[2] += 270;
ADDRLP4 8
ADDRGP4 pmlq2+12+8
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1132920832
ADDF4
ASGNF4
line 1063
;1063:	if (pmlq2.velocity[2] < 270)
ADDRGP4 pmlq2+12+8
INDIRF4
CNSTF4 1132920832
GEF4 $589
line 1064
;1064:		pmlq2.velocity[2] = 270;
ADDRGP4 pmlq2+12+8
CNSTF4 1132920832
ASGNF4
LABELV $589
line 1066
;1065:
;1066:	if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $595
line 1067
;1067:		Com_Printf("%i:jump\n", c_pmove);
ADDRGP4 $597
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1068
;1068:	}
LABELV $595
line 1069
;1069:}
LABELV $553
endproc PMQ2_CheckJump 12 8
export PMQ2_CheckSpecialMovement
proc PMQ2_CheckSpecialMovement 1140 28
line 1078
;1070:
;1071:
;1072:/*
;1073:=============
;1074:PMQ2_CheckSpecialMovement
;1075:=============
;1076:*/
;1077:void PMQ2_CheckSpecialMovement(void)
;1078:{
line 1084
;1079:	vec3_t	spot;
;1080:	int		cont;
;1081:	vec3_t	flatforward;
;1082:	trace_t	trace;
;1083:
;1084:	if (pmq2->ps->pm_time)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $599
line 1085
;1085:		return;
ADDRGP4 $598
JUMPV
LABELV $599
line 1087
;1086:
;1087:	pmlq2.ladder = qfalse;
ADDRGP4 pmlq2+1220
CNSTI4 0
ASGNI4
line 1090
;1088:
;1089:	// check for ladder
;1090:	flatforward[0] = pmlq2.forward[0];
ADDRLP4 0
ADDRGP4 pmlq2+24
INDIRF4
ASGNF4
line 1091
;1091:	flatforward[1] = pmlq2.forward[1];
ADDRLP4 0+4
ADDRGP4 pmlq2+24+4
INDIRF4
ASGNF4
line 1092
;1092:	flatforward[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1093
;1093:	VectorNormalize(flatforward);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1095
;1094:
;1095:	VectorMA(pmlq2.origin, 1, flatforward, spot);
ADDRLP4 1108
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
ADDRGP4 pmlq2
INDIRF4
ADDRLP4 1108
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 pmlq2+4
INDIRF4
ADDRLP4 1108
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 pmlq2+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1096
;1096:	pmq2->trace(&trace, pmlq2.origin, pmq2->mins, pmq2->maxs, spot, pmq2->ps->clientNum, pmq2->tracemask);
ADDRLP4 28
ARGP4
ADDRGP4 pmlq2
ARGP4
ADDRLP4 1112
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CNSTI4 168
ADDP4
ARGP4
ADDRLP4 1112
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1112
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1112
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 1112
INDIRP4
CNSTI4 204
ADDP4
INDIRP4
CALLV
pop
line 1097
;1097:	if ((trace.fraction < 1) && (trace.contents & CONTENTS_LADDER))
ADDRLP4 28+8
INDIRF4
CNSTF4 1065353216
GEF4 $613
ADDRLP4 28+48
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $613
line 1098
;1098:		pmlq2.ladder = qtrue;
ADDRGP4 pmlq2+1220
CNSTI4 1
ASGNI4
LABELV $613
line 1101
;1099:
;1100:	// check for water jump
;1101:	if (pmq2->waterlevel != 2)
ADDRGP4 pmq2
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 2
EQI4 $618
line 1102
;1102:		return;
ADDRGP4 $598
JUMPV
LABELV $618
line 1104
;1103:
;1104:	VectorMA(pmlq2.origin, 30, flatforward, spot);
ADDRLP4 1116
CNSTF4 1106247680
ASGNF4
ADDRLP4 12
ADDRGP4 pmlq2
INDIRF4
ADDRLP4 1116
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 pmlq2+4
INDIRF4
ADDRLP4 1116
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 pmlq2+8
INDIRF4
CNSTF4 1106247680
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1105
;1105:	spot[2] += 4;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 1106
;1106:	cont = pmq2->pointcontents(spot, pmq2->ps->clientNum);
ADDRLP4 12
ARGP4
ADDRLP4 1120
ADDRGP4 pmq2
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
CNSTI4 208
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 1124
INDIRI4
ASGNI4
line 1107
;1107:	if (!(cont & CONTENTS_SOLID))
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $627
line 1108
;1108:		return;
ADDRGP4 $598
JUMPV
LABELV $627
line 1110
;1109:
;1110:	spot[2] += 16;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1111
;1111:	cont = pmq2->pointcontents(spot, pmq2->ps->clientNum);
ADDRLP4 12
ARGP4
ADDRLP4 1128
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1132
ADDRLP4 1128
INDIRP4
CNSTI4 208
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 1132
INDIRI4
ASGNI4
line 1112
;1112:	if (cont)
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $630
line 1113
;1113:		return;
ADDRGP4 $598
JUMPV
LABELV $630
line 1115
;1114:	// jump out of water
;1115:	VectorScale(flatforward, 50, pmlq2.velocity);
ADDRGP4 pmlq2+12
CNSTF4 1112014848
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlq2+12+4
CNSTF4 1112014848
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlq2+12+8
CNSTF4 1112014848
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 1116
;1116:	pmlq2.velocity[2] = 350;
ADDRGP4 pmlq2+12+8
CNSTF4 1135542272
ASGNF4
line 1118
;1117:
;1118:	pmq2->ps->pm_flags |= PMF_TIME_WATERJUMP;
ADDRLP4 1136
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1136
INDIRP4
ADDRLP4 1136
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 1119
;1119:	pmq2->ps->pm_time = 255;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 255
ASGNI4
line 1120
;1120:}
LABELV $598
endproc PMQ2_CheckSpecialMovement 1140 28
export PMQ2_FlyMove
proc PMQ2_FlyMove 1192 28
line 1129
;1121:
;1122:
;1123:/*
;1124:===============
;1125:PMQ2_FlyMove
;1126:===============
;1127:*/
;1128:void PMQ2_FlyMove(qboolean doclip)
;1129:{
line 1140
;1130:	float	speed, drop, friction, control, newspeed;
;1131:	float	currentspeed, addspeed, accelspeed;
;1132:	int			i;
;1133:	vec3_t		wishvel;
;1134:	float		fmove, smove;
;1135:	vec3_t		wishdir;
;1136:	float		wishspeed;
;1137:	vec3_t		end;
;1138:	trace_t	trace;
;1139:
;1140:	pmq2->ps->viewheight = 22;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 22
ASGNI4
line 1144
;1141:
;1142:	// friction
;1143:
;1144:	speed = VectorLength(pmlq2.velocity);
ADDRGP4 pmlq2+12
ARGP4
ADDRLP4 1164
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 1164
INDIRF4
ASGNF4
line 1145
;1145:	if (speed < 1)
ADDRLP4 56
INDIRF4
CNSTF4 1065353216
GEF4 $643
line 1146
;1146:	{
line 1147
;1147:		VectorCopy(vec3_origin, pmlq2.velocity);
ADDRGP4 pmlq2+12
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 1148
;1148:	}
ADDRGP4 $644
JUMPV
LABELV $643
line 1150
;1149:	else
;1150:	{
line 1151
;1151:		drop = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 1153
;1152:
;1153:		friction = pmq2_friction * 1.5;	// extra friction
ADDRLP4 76
CNSTF4 1069547520
ADDRGP4 pmq2_friction
INDIRF4
MULF4
ASGNF4
line 1154
;1154:		control = speed < pmq2_stopspeed ? pmq2_stopspeed : speed;
ADDRLP4 56
INDIRF4
ADDRGP4 pmq2_stopspeed
INDIRF4
GEF4 $647
ADDRLP4 1168
ADDRGP4 pmq2_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $648
JUMPV
LABELV $647
ADDRLP4 1168
ADDRLP4 56
INDIRF4
ASGNF4
LABELV $648
ADDRLP4 80
ADDRLP4 1168
INDIRF4
ASGNF4
line 1155
;1155:		drop += control * friction * pmlq2.frametime;
ADDRLP4 72
ADDRLP4 72
INDIRF4
ADDRLP4 80
INDIRF4
ADDRLP4 76
INDIRF4
MULF4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
ADDF4
ASGNF4
line 1158
;1156:
;1157:		// scale the velocity
;1158:		newspeed = speed - drop;
ADDRLP4 64
ADDRLP4 56
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
ASGNF4
line 1159
;1159:		if (newspeed < 0)
ADDRLP4 64
INDIRF4
CNSTF4 0
GEF4 $650
line 1160
;1160:			newspeed = 0;
ADDRLP4 64
CNSTF4 0
ASGNF4
LABELV $650
line 1161
;1161:		newspeed /= speed;
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRLP4 56
INDIRF4
DIVF4
ASGNF4
line 1163
;1162:
;1163:		VectorScale(pmlq2.velocity, newspeed, pmlq2.velocity);
ADDRGP4 pmlq2+12
ADDRGP4 pmlq2+12
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlq2+12+4
ADDRGP4 pmlq2+12+4
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlq2+12+8
ADDRGP4 pmlq2+12+8
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
line 1164
;1164:	}
LABELV $644
line 1167
;1165:
;1166:	// accelerate
;1167:	fmove = pmlq2.forwardmove;
ADDRLP4 32
ADDRGP4 pmlq2+1184
INDIRI4
CVIF4 4
ASGNF4
line 1168
;1168:	smove = pmlq2.rightmove;
ADDRLP4 36
ADDRGP4 pmlq2+1188
INDIRI4
CVIF4 4
ASGNF4
line 1170
;1169:
;1170:	VectorNormalize(pmlq2.forward);
ADDRGP4 pmlq2+24
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1171
;1171:	VectorNormalize(pmlq2.right);
ADDRGP4 pmlq2+36
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1173
;1172:
;1173:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $666
line 1174
;1174:		wishvel[i] = pmlq2.forward[i] * fmove + pmlq2.right[i] * smove;
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
ADDRGP4 pmlq2+24
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 1168
INDIRI4
ADDRGP4 pmlq2+36
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $667
line 1173
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $666
line 1175
;1175:	wishvel[2] += pmlq2.upmove;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRGP4 pmlq2+1192
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1177
;1176:
;1177:	VectorCopy(wishvel, wishdir);
ADDRLP4 16
ADDRLP4 4
INDIRB
ASGNB 12
line 1178
;1178:	wishspeed = VectorNormalize(wishdir);
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
line 1183
;1179:
;1180:	//
;1181:	// clamp to server defined max speed
;1182:	//
;1183:	if (wishspeed > pmq2_maxspeed)
ADDRLP4 40
INDIRF4
ADDRGP4 pmq2_maxspeed
INDIRF4
LEF4 $674
line 1184
;1184:	{
line 1185
;1185:		VectorScale(wishvel, pmq2_maxspeed / wishspeed, wishvel);
ADDRLP4 1176
ADDRGP4 pmq2_maxspeed
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
ADDRGP4 pmq2_maxspeed
INDIRF4
ADDRLP4 40
INDIRF4
DIVF4
MULF4
ASGNF4
line 1186
;1186:		wishspeed = pmq2_maxspeed;
ADDRLP4 40
ADDRGP4 pmq2_maxspeed
INDIRF4
ASGNF4
line 1187
;1187:	}
LABELV $674
line 1189
;1188:
;1189:	pmq2->ps->speed = pmq2_maxspeed;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 pmq2_maxspeed
INDIRF4
CVFI4 4
ASGNI4
line 1191
;1190:
;1191:	currentspeed = DotProduct(pmlq2.velocity, wishdir);
ADDRLP4 68
ADDRGP4 pmlq2+12
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRGP4 pmlq2+12+4
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ADDRGP4 pmlq2+12+8
INDIRF4
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1192
;1192:	addspeed = wishspeed - currentspeed;
ADDRLP4 60
ADDRLP4 40
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
ASGNF4
line 1193
;1193:	if (addspeed <= 0)
ADDRLP4 60
INDIRF4
CNSTF4 0
GTF4 $687
line 1194
;1194:		return;
ADDRGP4 $641
JUMPV
LABELV $687
line 1195
;1195:	accelspeed = pmq2_accelerate * pmlq2.frametime * wishspeed;
ADDRLP4 28
ADDRGP4 pmq2_accelerate
INDIRF4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 1196
;1196:	if (accelspeed > addspeed)
ADDRLP4 28
INDIRF4
ADDRLP4 60
INDIRF4
LEF4 $690
line 1197
;1197:		accelspeed = addspeed;
ADDRLP4 28
ADDRLP4 60
INDIRF4
ASGNF4
LABELV $690
line 1199
;1198:
;1199:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $692
line 1200
;1200:		pmlq2.velocity[i] += accelspeed * wishdir[i];
ADDRLP4 1176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1180
ADDRLP4 1176
INDIRI4
ADDRGP4 pmlq2+12
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
LABELV $693
line 1199
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $692
line 1202
;1201:
;1202:	if (doclip) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $697
line 1203
;1203:		for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $699
line 1204
;1204:			end[i] = pmlq2.origin[i] + pmlq2.frametime * pmlq2.velocity[i];
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
ADDRGP4 pmlq2
ADDP4
INDIRF4
ADDRGP4 pmlq2+60
INDIRF4
ADDRLP4 1184
INDIRI4
ADDRGP4 pmlq2+12
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $700
line 1203
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $699
line 1206
;1205:
;1206:		pmq2->trace(&trace, pmlq2.origin, pmq2->mins, pmq2->maxs, end, pmq2->ps->clientNum, pmq2->tracemask);
ADDRLP4 84
ARGP4
ADDRGP4 pmlq2
ARGP4
ADDRLP4 1188
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1188
INDIRP4
CNSTI4 168
ADDP4
ARGP4
ADDRLP4 1188
INDIRP4
CNSTI4 180
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
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 1188
INDIRP4
CNSTI4 204
ADDP4
INDIRP4
CALLV
pop
line 1208
;1207:
;1208:		VectorCopy(trace.endpos, pmlq2.origin);
ADDRGP4 pmlq2
ADDRLP4 84+12
INDIRB
ASGNB 12
line 1209
;1209:	}
ADDRGP4 $698
JUMPV
LABELV $697
line 1210
;1210:	else {
line 1212
;1211:		// move
;1212:		VectorMA(pmlq2.origin, pmlq2.frametime, pmlq2.velocity, pmlq2.origin);
ADDRLP4 1184
ADDRGP4 pmlq2
ASGNP4
ADDRLP4 1184
INDIRP4
ADDRLP4 1184
INDIRP4
INDIRF4
ADDRGP4 pmlq2+12
INDIRF4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 pmlq2+4
ADDRGP4 pmlq2+4
INDIRF4
ADDRGP4 pmlq2+12+4
INDIRF4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 pmlq2+8
ADDRGP4 pmlq2+8
INDIRF4
ADDRGP4 pmlq2+12+8
INDIRF4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
ADDF4
ASGNF4
line 1213
;1213:	}
LABELV $698
line 1214
;1214:}
LABELV $641
endproc PMQ2_FlyMove 1192 28
export PMQ2_CheckDuck
proc PMQ2_CheckDuck 1096 28
line 1225
;1215:
;1216:
;1217:/*
;1218:==============
;1219:PMQ2_CheckDuck
;1220:
;1221:Sets mins, maxs, and pmq2->ps->viewheight
;1222:==============
;1223:*/
;1224:void PMQ2_CheckDuck(void)
;1225:{
line 1228
;1226:	trace_t	trace;
;1227:
;1228:	pmq2->mins[0] = -16;
ADDRGP4 pmq2
INDIRP4
CNSTI4 168
ADDP4
CNSTF4 3246391296
ASGNF4
line 1229
;1229:	pmq2->mins[1] = -16;
ADDRGP4 pmq2
INDIRP4
CNSTI4 172
ADDP4
CNSTF4 3246391296
ASGNF4
line 1231
;1230:
;1231:	pmq2->maxs[0] = 16;
ADDRGP4 pmq2
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 1098907648
ASGNF4
line 1232
;1232:	pmq2->maxs[1] = 16;
ADDRGP4 pmq2
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 1098907648
ASGNF4
line 1243
;1233:
;1234:	/* TA: doesnt exist in jk
;1235:	if (pmq2->ps->pm_type == PMQ2_GIB)
;1236:	{
;1237:		pmq2->mins[2] = 0;
;1238:		pmq2->maxs[2] = 16;
;1239:		pmq2->ps->viewheight = 8;
;1240:		return;
;1241:	}*/
;1242:
;1243:	pmq2->mins[2] = -24;
ADDRGP4 pmq2
INDIRP4
CNSTI4 176
ADDP4
CNSTF4 3250585600
ASGNF4
line 1245
;1244:
;1245:	if (pmq2->ps->pm_type == PM_DEAD)
ADDRLP4 1080
CNSTI4 4
ASGNI4
ADDRGP4 pmq2
INDIRP4
INDIRP4
ADDRLP4 1080
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $719
line 1246
;1246:	{
line 1247
;1247:		pmq2->ps->pm_flags |= PMF_DUCKED;
ADDRLP4 1084
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1084
INDIRP4
ADDRLP4 1084
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1248
;1248:	}
ADDRGP4 $720
JUMPV
LABELV $719
line 1250
;1249:	//else if (pmlq2.upmove < 0 && (pmq2->ps->pm_flags & PMF_ON_GROUND))
;1250:	else if (pmlq2.upmove < 0 && (pmq2->ps->groundEntityNum != ENTITYNUM_NONE))
ADDRGP4 pmlq2+1192
INDIRI4
CNSTI4 0
GEI4 $721
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $721
line 1251
;1251:	{	// duck
line 1252
;1252:		pmq2->ps->pm_flags |= PMF_DUCKED;
ADDRLP4 1084
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1084
INDIRP4
ADDRLP4 1084
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1253
;1253:	}
ADDRGP4 $722
JUMPV
LABELV $721
line 1255
;1254:	else
;1255:	{	// stand up if possible
line 1256
;1256:		if (pmq2->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $724
line 1257
;1257:		{
line 1259
;1258:			// try to stand up
;1259:			pmq2->maxs[2] = 32;
ADDRGP4 pmq2
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 1107296256
ASGNF4
line 1260
;1260:			pmq2->trace(&trace, pmlq2.origin, pmq2->mins, pmq2->maxs, pmlq2.origin, pmq2->ps->clientNum, pmq2->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 1084
ADDRGP4 pmlq2
ASGNP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRLP4 1088
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1088
INDIRP4
CNSTI4 168
ADDP4
ARGP4
ADDRLP4 1088
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRLP4 1088
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 1088
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 1088
INDIRP4
CNSTI4 204
ADDP4
INDIRP4
CALLV
pop
line 1261
;1261:			if (!trace.allsolid)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $726
line 1262
;1262:				pmq2->ps->pm_flags &= ~PMF_DUCKED;
ADDRLP4 1092
ADDRGP4 pmq2
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
LABELV $726
line 1263
;1263:		}
LABELV $724
line 1264
;1264:	}
LABELV $722
LABELV $720
line 1266
;1265:
;1266:	if (pmq2->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $728
line 1267
;1267:	{
line 1268
;1268:		pmq2->maxs[2] = 4;
ADDRGP4 pmq2
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 1082130432
ASGNF4
line 1269
;1269:		pmq2->ps->viewheight = -2;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 -2
ASGNI4
line 1270
;1270:	}
ADDRGP4 $729
JUMPV
LABELV $728
line 1272
;1271:	else
;1272:	{
line 1273
;1273:		pmq2->maxs[2] = 32;
ADDRGP4 pmq2
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 1107296256
ASGNF4
line 1274
;1274:		pmq2->ps->viewheight = 22;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 22
ASGNI4
line 1275
;1275:	}
LABELV $729
line 1276
;1276:}
LABELV $718
endproc PMQ2_CheckDuck 1096 28
export PMQ2_DeadMove
proc PMQ2_DeadMove 12 4
line 1285
;1277:
;1278:
;1279:/*
;1280:==============
;1281:PMQ2_DeadMove
;1282:==============
;1283:*/
;1284:void PMQ2_DeadMove(void)
;1285:{
line 1288
;1286:	float	forward;
;1287:
;1288:	if (pmq2->ps->groundEntityNum == ENTITYNUM_NONE)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $731
line 1289
;1289:		return;
ADDRGP4 $730
JUMPV
LABELV $731
line 1293
;1290:
;1291:	// extra friction
;1292:
;1293:	forward = VectorLength(pmlq2.velocity);
ADDRGP4 pmlq2+12
ARGP4
ADDRLP4 4
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1294
;1294:	forward -= 20;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 1295
;1295:	if (forward <= 0)
ADDRLP4 0
INDIRF4
CNSTF4 0
GTF4 $734
line 1296
;1296:	{
line 1297
;1297:		VectorClear(pmlq2.velocity);
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRGP4 pmlq2+12+8
ADDRLP4 8
INDIRF4
ASGNF4
ADDRGP4 pmlq2+12+4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRGP4 pmlq2+12
ADDRLP4 8
INDIRF4
ASGNF4
line 1298
;1298:	}
ADDRGP4 $735
JUMPV
LABELV $734
line 1300
;1299:	else
;1300:	{
line 1301
;1301:		VectorNormalize(pmlq2.velocity);
ADDRGP4 pmlq2+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1302
;1302:		VectorScale(pmlq2.velocity, forward, pmlq2.velocity);
ADDRGP4 pmlq2+12
ADDRGP4 pmlq2+12
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlq2+12+4
ADDRGP4 pmlq2+12+4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRGP4 pmlq2+12+8
ADDRGP4 pmlq2+12+8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 1303
;1303:	}
LABELV $735
line 1304
;1304:}
LABELV $730
endproc PMQ2_DeadMove 12 4
export PMQ2_GoodPosition
proc PMQ2_GoodPosition 1124 28
line 1308
;1305:
;1306:
;1307:qboolean	PMQ2_GoodPosition(void)
;1308:{
line 1313
;1309:	trace_t	trace;
;1310:	vec3_t	origin, end;
;1311:	int		i;
;1312:
;1313:	if (pmq2->ps->pm_type == PM_SPECTATOR)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $753
line 1314
;1314:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $752
JUMPV
LABELV $753
line 1316
;1315:
;1316:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $755
line 1318
;1317:#ifdef AUTHENTIC_Q2SNAP
;1318:		origin[i] = end[i] = pmq2->ps->origin[i] *0.125;
ADDRLP4 1108
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 1112
CNSTF4 1040187392
ADDRLP4 1108
INDIRI4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 1108
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 1112
INDIRF4
ASGNF4
ADDRLP4 1108
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 1112
INDIRF4
ASGNF4
LABELV $756
line 1316
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $755
line 1323
;1319:#else
;1320:		origin[i] = end[i] = pmq2->ps->origin[i];
;1321:#endif
;1322:
;1323:	end[2] -= 1.0; // TA deviation from Q2: if we trace same to same position, we get stuck in oneway clips/patches. idk why :/ q2 doesnt have patches so they dont have the issue. TODO check if this is ok in general? or will this cause (barely noticable?) weirdness with epsilon?
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 1325
;1324:
;1325:	pmq2->trace(&trace, origin, pmq2->mins, pmq2->maxs, end, pmq2->ps->clientNum, pmq2->tracemask);
ADDRLP4 28
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 1116
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 168
ADDP4
ARGP4
ADDRLP4 1116
INDIRP4
CNSTI4 180
ADDP4
ARGP4
ADDRLP4 4
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
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 1116
INDIRP4
CNSTI4 204
ADDP4
INDIRP4
CALLV
pop
line 1329
;1326:
;1327:	//return !trace.allsolid; // TA deviation from Q2: if we trace same to same position, we get stuck in oneway clips/patches.
;1328:	// so do a trace to random other position a little bit away and then just return startsolid value.
;1329:	return !trace.startsolid;
ADDRLP4 28+4
INDIRI4
CNSTI4 0
NEI4 $762
ADDRLP4 1120
CNSTI4 1
ASGNI4
ADDRGP4 $763
JUMPV
LABELV $762
ADDRLP4 1120
CNSTI4 0
ASGNI4
LABELV $763
ADDRLP4 1120
INDIRI4
RETI4
LABELV $752
endproc PMQ2_GoodPosition 1124 28
data
align 4
LABELV $765
byte 4 0
byte 4 4
byte 4 1
byte 4 2
byte 4 3
byte 4 5
byte 4 6
byte 4 7
export PMQ2_SnapPosition
code
proc PMQ2_SnapPosition 48 0
line 1341
;1330:}
;1331:
;1332:/*
;1333:================
;1334:PMQ2_SnapPosition
;1335:
;1336:On exit, the origin will have a value that is pre-quantized to the 0.125
;1337:precision of the network channel and in a valid position.
;1338:================
;1339:*/
;1340:void PMQ2_SnapPosition(void)
;1341:{
line 1356
;1342:	int		sign[3];
;1343:	int		i, j, bits;
;1344:	//short	base[3];
;1345:	float	base[3]; // this isn't 100% authentic but it should be authentic in the range of short in any case and way beyond it too for a while
;1346:	// try all single bits first
;1347:	static int jitterbits[8] = { 0,4,1,2,3,5,6,7 };
;1348:
;1349:#ifndef AUTHENTIC_Q2SNAP
;1350:	return; // no need for snapping in jk2
;1351:#else
;1352:
;1353:	// we don't need this in jk but we keep it for authentic feel just in case.
;1354:
;1355:	// snap velocity to eigths
;1356:	if (pm->modParms.msecRestrict == -2) { // in float physics mode no snap
ADDRGP4 pm
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $766
line 1357
;1357:		for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $768
line 1358
;1358:			pmq2->ps->velocity[i] = pmlq2.velocity[i] * 8;
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
CNSTF4 1090519040
ADDRLP4 36
INDIRI4
ADDRGP4 pmlq2+12
ADDP4
INDIRF4
MULF4
ASGNF4
LABELV $769
line 1357
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $768
line 1359
;1359:	}
ADDRGP4 $767
JUMPV
LABELV $766
line 1360
;1360:	else {
line 1361
;1361:		for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $773
line 1362
;1362:			pmq2->ps->velocity[i] = (int)(pmlq2.velocity[i] * 8);
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
CNSTF4 1090519040
ADDRLP4 36
INDIRI4
ADDRGP4 pmlq2+12
ADDP4
INDIRF4
MULF4
CVFI4 4
CVIF4 4
ASGNF4
LABELV $774
line 1361
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $773
line 1363
;1363:	}
LABELV $767
line 1365
;1364:
;1365:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $778
line 1366
;1366:	{
line 1367
;1367:		if (pmlq2.origin[i] >= 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pmlq2
ADDP4
INDIRF4
CNSTF4 0
LTF4 $782
line 1368
;1368:			sign[i] = 1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $783
JUMPV
LABELV $782
line 1370
;1369:		else
;1370:			sign[i] = -1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTI4 -1
ASGNI4
LABELV $783
line 1371
;1371:		if (pm->modParms.msecRestrict == -2) {
ADDRGP4 pm
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $784
line 1372
;1372:			pmq2->ps->origin[i] = pmlq2.origin[i] * 8; // in float physics mode no snap
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDP4
CNSTF4 1090519040
ADDRLP4 36
INDIRI4
ADDRGP4 pmlq2
ADDP4
INDIRF4
MULF4
ASGNF4
line 1373
;1373:		}
ADDRGP4 $785
JUMPV
LABELV $784
line 1374
;1374:		else {
line 1375
;1375:			pmq2->ps->origin[i] = (int)(pmlq2.origin[i] * 8);
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDP4
CNSTF4 1090519040
ADDRLP4 36
INDIRI4
ADDRGP4 pmlq2
ADDP4
INDIRF4
MULF4
CVFI4 4
CVIF4 4
ASGNF4
line 1376
;1376:		}
LABELV $785
line 1377
;1377:		if (pmq2->ps->origin[i] * 0.125 == pmlq2.origin[i])
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
CNSTF4 1040187392
ADDRLP4 36
INDIRI4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDP4
INDIRF4
MULF4
ADDRLP4 36
INDIRI4
ADDRGP4 pmlq2
ADDP4
INDIRF4
NEF4 $786
line 1378
;1378:			sign[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTI4 0
ASGNI4
LABELV $786
line 1379
;1379:	}
LABELV $779
line 1365
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $778
line 1380
;1380:	VectorCopy(pmq2->ps->origin, base);
ADDRLP4 24
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1383
;1381:
;1382:	// try all combinations
;1383:	for (j = 0; j < 8; j++)
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $788
line 1384
;1384:	{
line 1385
;1385:		bits = jitterbits[j];
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $765
ADDP4
INDIRI4
ASGNI4
line 1386
;1386:		VectorCopy(base, pmq2->ps->origin);
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 24
INDIRB
ASGNB 12
line 1387
;1387:		for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $792
line 1388
;1388:			if (bits & (1 << i))
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $796
line 1389
;1389:				pmq2->ps->origin[i] += sign[i];
ADDRLP4 36
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 40
ADDRLP4 36
INDIRI4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 36
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
LABELV $796
LABELV $793
line 1387
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $792
line 1391
;1390:
;1391:		if (PMQ2_GoodPosition())
ADDRLP4 44
ADDRGP4 PMQ2_GoodPosition
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $798
line 1392
;1392:			return;
ADDRGP4 $764
JUMPV
LABELV $798
line 1393
;1393:	}
LABELV $789
line 1383
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 8
LTI4 $788
line 1396
;1394:
;1395:	// go back to the last position
;1396:	VectorCopy(pmlq2.previous_origin, pmq2->ps->origin);
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 pmlq2+1196
INDIRB
ASGNB 12
line 1403
;1397:#ifdef CRINGY_STUCK_DEBUG
;1398:	Com_Printf ("using previous_origin\n");
;1399:#endif
;1400:#endif
;1401:
;1402:	
;1403:}
LABELV $764
endproc PMQ2_SnapPosition 48 0
data
align 4
LABELV $802
byte 4 0
byte 4 3212836864
byte 4 1065353216
export PMQ2_InitialSnapPosition
code
proc PMQ2_InitialSnapPosition 28 0
line 1452
;1404:
;1405:#if 0
;1406://NO LONGER USED
;1407:/*
;1408:================
;1409:PMQ2_InitialSnapPosition
;1410:
;1411:================
;1412:*/
;1413:void PMQ2_InitialSnapPosition(void)
;1414:{
;1415:	int		x, y, z;
;1416:	short	base[3];
;1417:
;1418:	VectorCopy(pmq2->ps->origin, base);
;1419:
;1420:	for (z = 1; z >= -1; z--)
;1421:	{
;1422:		pmq2->ps->origin[2] = base[2] + z;
;1423:		for (y = 1; y >= -1; y--)
;1424:		{
;1425:			pmq2->ps->origin[1] = base[1] + y;
;1426:			for (x = 1; x >= -1; x--)
;1427:			{
;1428:				pmq2->ps->origin[0] = base[0] + x;
;1429:				if (PMQ2_GoodPosition())
;1430:				{
;1431:					pmlq2.origin[0] = pmq2->ps->origin[0] * 0.125;
;1432:					pmlq2.origin[1] = pmq2->ps->origin[1] * 0.125;
;1433:					pmlq2.origin[2] = pmq2->ps->origin[2] * 0.125;
;1434:					VectorCopy(pmq2->ps->origin, pmlq2.previous_origin);
;1435:					return;
;1436:				}
;1437:			}
;1438:		}
;1439:	}
;1440:#ifdef
;1441:	Com_DPrintf("Bad InitialSnapPosition\n");
;1442:#endif
;1443:}
;1444:#else
;1445:/*
;1446:================
;1447:PMQ2_InitialSnapPosition
;1448:
;1449:================
;1450:*/
;1451:void PMQ2_InitialSnapPosition(void)
;1452:{
line 1462
;1453:	int        x, y, z;
;1454:#ifdef AUTHENTIC_Q2SNAP
;1455:	float      base[3]; // we still change them to float because our origin number is a float. should still behave the same at least within the range of a short, but allows larger maps to work properly
;1456:	static float offset[3] = { 0, -1, 1 }; // should behave like integer math in smaller ranges
;1457:#else
;1458:	float      base[3];
;1459:	static float offset[3] = { 0, -0.125, 0.125 };
;1460:#endif
;1461:
;1462:	VectorCopy(pmq2->ps->origin, base);
ADDRLP4 4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1464
;1463:
;1464:	for (z = 0; z < 3; z++) {
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $803
line 1465
;1465:		pmq2->ps->origin[2] = base[2] + offset[z];
ADDRGP4 pmq2
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
ADDRGP4 $802
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1466
;1466:		for (y = 0; y < 3; y++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $808
line 1467
;1467:			pmq2->ps->origin[1] = base[1] + offset[y];
ADDRGP4 pmq2
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
ADDRGP4 $802
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1468
;1468:			for (x = 0; x < 3; x++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $813
line 1469
;1469:				pmq2->ps->origin[0] = base[0] + offset[x];
ADDRGP4 pmq2
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
ADDRGP4 $802
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1470
;1470:				if (PMQ2_GoodPosition()) {
ADDRLP4 24
ADDRGP4 PMQ2_GoodPosition
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $817
line 1472
;1471:#ifdef AUTHENTIC_Q2SNAP
;1472:					pmlq2.origin[0] = pmq2->ps->origin[0] * 0.125;
ADDRGP4 pmlq2
CNSTF4 1040187392
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
ASGNF4
line 1473
;1473:					pmlq2.origin[1] = pmq2->ps->origin[1] * 0.125;
ADDRGP4 pmlq2+4
CNSTF4 1040187392
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ASGNF4
line 1474
;1474:					pmlq2.origin[2] = pmq2->ps->origin[2] * 0.125;
ADDRGP4 pmlq2+8
CNSTF4 1040187392
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ASGNF4
line 1480
;1475:#else
;1476:					pmlq2.origin[0] = pmq2->ps->origin[0];
;1477:					pmlq2.origin[1] = pmq2->ps->origin[1];
;1478:					pmlq2.origin[2] = pmq2->ps->origin[2];
;1479:#endif
;1480:					VectorCopy(pmq2->ps->origin, pmlq2.previous_origin);
ADDRGP4 pmlq2+1196
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1481
;1481:					return;
ADDRGP4 $801
JUMPV
LABELV $817
line 1483
;1482:				}
;1483:			}
LABELV $814
line 1468
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $813
line 1484
;1484:		}
LABELV $809
line 1466
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 3
LTI4 $808
line 1485
;1485:	}
LABELV $804
line 1464
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 3
LTI4 $803
line 1489
;1486:#ifdef CRINGY_STUCK_DEBUG
;1487:	Com_Printf("Bad InitialSnapPosition\n");
;1488:#endif
;1489:}
LABELV $801
endproc PMQ2_InitialSnapPosition 28 0
export PMQ2_ClampAngles
proc PMQ2_ClampAngles 16 16
line 1500
;1490:
;1491:#endif
;1492:
;1493:/*
;1494:================
;1495:PMQ2_ClampAngles
;1496:
;1497:================
;1498:*/
;1499:void PMQ2_ClampAngles(void)
;1500:{
line 1511
;1501:	short	temp;
;1502:	int		i;
;1503:
;1504:	//if (pmq2->ps->pm_flags & PMF_TIME_TELEPORT)
;1505:	//{
;1506:	//	pmq2->ps->viewangles[YAW] = SHORT2ANGLE(pmq2->cmd.angles[YAW] + pmq2->ps->delta_angles[YAW]);
;1507:	//	pmq2->ps->viewangles[PITCH] = 0;
;1508:	//	pmq2->ps->viewangles[ROLL] = 0;
;1509:	//}
;1510:	//else
;1511:	{
line 1513
;1512:		// circularly clamp the angles with deltas
;1513:		for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $823
line 1514
;1514:		{
line 1515
;1515:			temp = pmq2->cmd.angles[i] + pmq2->ps->delta_angles[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRGP4 pmq2
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
line 1516
;1516:			pmq2->ps->viewangles[i] = SHORT2ANGLE(temp);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pmq2
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
line 1517
;1517:		}
LABELV $824
line 1513
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $823
line 1520
;1518:
;1519:		// don't let the player look up or down more than 90 degrees
;1520:		if (pmq2->ps->viewangles[PITCH] > 89 && pmq2->ps->viewangles[PITCH] < 180)
ADDRLP4 8
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 1118961664
LEF4 $827
ADDRLP4 8
INDIRF4
CNSTF4 1127481344
GEF4 $827
line 1521
;1521:			pmq2->ps->viewangles[PITCH] = 89;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
CNSTF4 1118961664
ASGNF4
ADDRGP4 $828
JUMPV
LABELV $827
line 1522
;1522:		else if (pmq2->ps->viewangles[PITCH] < 271 && pmq2->ps->viewangles[PITCH] >= 180)
ADDRLP4 12
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 1132953600
GEF4 $829
ADDRLP4 12
INDIRF4
CNSTF4 1127481344
LTF4 $829
line 1523
;1523:			pmq2->ps->viewangles[PITCH] = 271;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
CNSTF4 1132953600
ASGNF4
LABELV $829
LABELV $828
line 1524
;1524:	}
line 1525
;1525:	AngleVectors(pmq2->ps->viewangles, pmlq2.forward, pmlq2.right, pmlq2.up);
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 pmlq2+24
ARGP4
ADDRGP4 pmlq2+36
ARGP4
ADDRGP4 pmlq2+48
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1526
;1526:}
LABELV $822
endproc PMQ2_ClampAngles 16 16
export PmoveQ2
proc PmoveQ2 56 16
line 1541
;1527:
;1528:// jk2: weapon changes
;1529:void PM_BeginWeaponChange(int weapon);
;1530:void PM_FinishWeaponChange(void);
;1531:// end weapon changes
;1532:
;1533:/*
;1534:================
;1535:Pmove
;1536:
;1537:Can be called by either the server or the client
;1538:================
;1539:*/
;1540:void PmoveQ2(pmoveq2_t* pmove)
;1541:{
line 1543
;1542:
;1543:	pmq2 = pmove;
ADDRGP4 pmq2
ADDRFP4 0
INDIRP4
ASGNP4
line 1546
;1544:
;1545:	// clear results
;1546:	pmq2->numtouch = 0;
ADDRGP4 pmq2
INDIRP4
CNSTI4 36
ADDP4
CNSTI4 0
ASGNI4
line 1547
;1547:	VectorClear(pmq2->ps->viewangles);
ADDRLP4 0
ADDRGP4 pmq2
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
line 1548
;1548:	pmq2->ps->viewheight = 0;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 0
ASGNI4
line 1550
;1549:	//pmq2->ps->groundEntityNum = ENTITYNUM_NONE;
;1550:	pmq2->watertype = 0;
ADDRGP4 pmq2
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 1551
;1551:	pmq2->waterlevel = 0;
ADDRGP4 pmq2
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 0
ASGNI4
line 1554
;1552:
;1553:	// clear all pmove local vars
;1554:	memset(&pmlq2, 0, sizeof(pmlq2));
ADDRGP4 pmlq2
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1224
ARGU4
ADDRGP4 memset
CALLP4
pop
line 1558
;1555:
;1556:
;1557:#ifdef AUTHENTIC_Q2SNAP
;1558:	if (pm->modParms.msecRestrict == -2) {
ADDRGP4 pm
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 -2
NEI4 $835
line 1559
;1559:		pmq2->ps->origin[0] = (pmq2->ps->origin[0] * 8.0f);
ADDRLP4 8
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTF4 1090519040
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1560
;1560:		pmq2->ps->origin[1] = (pmq2->ps->origin[1] * 8.0f);
ADDRLP4 12
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTF4 1090519040
ADDRLP4 12
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1561
;1561:		pmq2->ps->origin[2] = (pmq2->ps->origin[2] * 8.0f);
ADDRLP4 16
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTF4 1090519040
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1563
;1562:
;1563:		pmq2->ps->velocity[0] = (pmq2->ps->velocity[0] * 8.0f);
ADDRLP4 20
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTF4 1090519040
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1564
;1564:		pmq2->ps->velocity[1] = (pmq2->ps->velocity[1] * 8.0f);
ADDRLP4 24
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1090519040
ADDRLP4 24
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1565
;1565:		pmq2->ps->velocity[2] = (pmq2->ps->velocity[2] * 8.0f);
ADDRLP4 28
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTF4 1090519040
ADDRLP4 28
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1566
;1566:	}
ADDRGP4 $836
JUMPV
LABELV $835
line 1567
;1567:	else {
line 1568
;1568:		pmq2->ps->origin[0] = (int)(pmq2->ps->origin[0] * 8.0f);
ADDRLP4 8
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTF4 1090519040
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
CVFI4 4
CVIF4 4
ASGNF4
line 1569
;1569:		pmq2->ps->origin[1] = (int)(pmq2->ps->origin[1] * 8.0f);
ADDRLP4 12
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTF4 1090519040
ADDRLP4 12
INDIRP4
INDIRF4
MULF4
CVFI4 4
CVIF4 4
ASGNF4
line 1570
;1570:		pmq2->ps->origin[2] = (int)(pmq2->ps->origin[2] * 8.0f);
ADDRLP4 16
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTF4 1090519040
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
CVFI4 4
CVIF4 4
ASGNF4
line 1572
;1571:
;1572:		pmq2->ps->velocity[0] = (int)(pmq2->ps->velocity[0] * 8.0f);
ADDRLP4 20
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTF4 1090519040
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
CVFI4 4
CVIF4 4
ASGNF4
line 1573
;1573:		pmq2->ps->velocity[1] = (int)(pmq2->ps->velocity[1] * 8.0f);
ADDRLP4 24
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1090519040
ADDRLP4 24
INDIRP4
INDIRF4
MULF4
CVFI4 4
CVIF4 4
ASGNF4
line 1574
;1574:		pmq2->ps->velocity[2] = (int)(pmq2->ps->velocity[2] * 8.0f);
ADDRLP4 28
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTF4 1090519040
ADDRLP4 28
INDIRP4
INDIRF4
MULF4
CVFI4 4
CVIF4 4
ASGNF4
line 1575
;1575:	}
LABELV $836
line 1578
;1576:
;1577:	// convert origin and velocity to float values
;1578:	pmlq2.origin[0] = pmq2->ps->origin[0] * 0.125;
ADDRGP4 pmlq2
CNSTF4 1040187392
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
MULF4
ASGNF4
line 1579
;1579:	pmlq2.origin[1] = pmq2->ps->origin[1] * 0.125;
ADDRGP4 pmlq2+4
CNSTF4 1040187392
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ASGNF4
line 1580
;1580:	pmlq2.origin[2] = pmq2->ps->origin[2] * 0.125;
ADDRGP4 pmlq2+8
CNSTF4 1040187392
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ASGNF4
line 1582
;1581:
;1582:	pmlq2.velocity[0] = pmq2->ps->velocity[0] * 0.125;
ADDRGP4 pmlq2+12
CNSTF4 1040187392
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ASGNF4
line 1583
;1583:	pmlq2.velocity[1] = pmq2->ps->velocity[1] * 0.125;
ADDRGP4 pmlq2+12+4
CNSTF4 1040187392
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ASGNF4
line 1584
;1584:	pmlq2.velocity[2] = pmq2->ps->velocity[2] * 0.125;
ADDRGP4 pmlq2+12+8
CNSTF4 1040187392
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ASGNF4
line 1596
;1585:#else
;1586:	// convert origin and velocity to float values
;1587:	pmlq2.origin[0] = pmq2->ps->origin[0];
;1588:	pmlq2.origin[1] = pmq2->ps->origin[1];
;1589:	pmlq2.origin[2] = pmq2->ps->origin[2];
;1590:
;1591:	pmlq2.velocity[0] = pmq2->ps->velocity[0];
;1592:	pmlq2.velocity[1] = pmq2->ps->velocity[1];
;1593:	pmlq2.velocity[2] = pmq2->ps->velocity[2];
;1594:#endif
;1595:
;1596:	pmlq2.msec = pmq2->cmd.serverTime - pmq2->ps->commandTime;
ADDRLP4 8
ADDRGP4 pmq2
INDIRP4
ASGNP4
ADDRGP4 pmlq2+64
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
line 1597
;1597:	pmlq2.forwardmove = (int)pmq2->cmd.forwardmove * 500 / 127;//adapt from q3 range
ADDRGP4 pmlq2+1184
CNSTI4 500
ADDRGP4 pmq2
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
MULI4
CNSTI4 127
DIVI4
ASGNI4
line 1598
;1598:	pmlq2.rightmove = (int)pmq2->cmd.rightmove * 500 / 127;//adapt from q3 range
ADDRGP4 pmlq2+1188
CNSTI4 500
ADDRGP4 pmq2
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
MULI4
CNSTI4 127
DIVI4
ASGNI4
line 1599
;1599:	pmlq2.upmove = (int)pmq2->cmd.upmove * 500 / 127;//adapt from q3 range
ADDRGP4 pmlq2+1192
CNSTI4 500
ADDRGP4 pmq2
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
MULI4
CNSTI4 127
DIVI4
ASGNI4
line 1602
;1600:
;1601:	// save old vel for corner skims (non-standard Q2 to restore originally intended behavior, controllable via pmq2->cornerSkims, default 0 = deactivated)
;1602:	VectorCopy(pmlq2.velocity, pmlq2.previous_velocity);
ADDRGP4 pmlq2+1208
ADDRGP4 pmlq2+12
INDIRB
ASGNB 12
line 1605
;1603:
;1604:	// save old org in case we get stuck
;1605:	VectorCopy(pmq2->ps->origin, pmlq2.previous_origin);
ADDRGP4 pmlq2+1196
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1607
;1606:
;1607:	pmlq2.frametime = pmlq2.msec * 0.001;
ADDRGP4 pmlq2+60
CNSTF4 981668463
ADDRGP4 pmlq2+64
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 1609
;1608:
;1609:	pmq2->ps->basespeed = pmq2->ps->speed = pmq2_maxspeed;
ADDRLP4 12
ADDRGP4 pmq2
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRGP4 pmq2_maxspeed
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1611
;1610:
;1611:	PMQ2_ClampAngles();
ADDRGP4 PMQ2_ClampAngles
CALLV
pop
line 1613
;1612:
;1613:	if (pmq2->ps->pm_type == PM_SPECTATOR)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $853
line 1614
;1614:	{
line 1615
;1615:		PMQ2_FlyMove(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 PMQ2_FlyMove
CALLV
pop
line 1617
;1616:#ifdef AUTHENTIC_Q2SNAP
;1617:		PMQ2_SnapPosition();
ADDRGP4 PMQ2_SnapPosition
CALLV
pop
line 1618
;1618:		pmq2->ps->origin[0] *= 0.125f;
ADDRLP4 20
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTF4 1040187392
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1619
;1619:		pmq2->ps->origin[1] *= 0.125f;
ADDRLP4 24
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTF4 1040187392
ADDRLP4 24
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1620
;1620:		pmq2->ps->origin[2] *= 0.125f;
ADDRLP4 28
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTF4 1040187392
ADDRLP4 28
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1621
;1621:		pmq2->ps->velocity[0] *= 0.125f;
ADDRLP4 32
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTF4 1040187392
ADDRLP4 32
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1622
;1622:		pmq2->ps->velocity[1] *= 0.125f;
ADDRLP4 36
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1040187392
ADDRLP4 36
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1623
;1623:		pmq2->ps->velocity[2] *= 0.125f;
ADDRLP4 40
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTF4 1040187392
ADDRLP4 40
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1628
;1624:#else 
;1625:		VectorCopy(pmlq2.origin, pmq2->ps->origin);
;1626:		VectorCopy(pmlq2.velocity, pmq2->ps->velocity);
;1627:#endif
;1628:		return;
ADDRGP4 $834
JUMPV
LABELV $853
line 1631
;1629:	}
;1630:
;1631:	if (pmq2->ps->pm_type >= PM_DEAD)
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRGP4 pmq2
INDIRP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $855
line 1632
;1632:	{
line 1633
;1633:		pmlq2.forwardmove = 0;
ADDRGP4 pmlq2+1184
CNSTI4 0
ASGNI4
line 1634
;1634:		pmlq2.rightmove = 0;
ADDRGP4 pmlq2+1188
CNSTI4 0
ASGNI4
line 1635
;1635:		pmlq2.upmove = 0;
ADDRGP4 pmlq2+1192
CNSTI4 0
ASGNI4
line 1636
;1636:	}
LABELV $855
line 1638
;1637:
;1638:	if (pmq2->ps->pm_type == PM_FREEZE)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $860
line 1639
;1639:		return;		// no movement at all
ADDRGP4 $834
JUMPV
LABELV $860
line 1642
;1640:
;1641:	// set mins, maxs, and viewheight
;1642:	PMQ2_CheckDuck();
ADDRGP4 PMQ2_CheckDuck
CALLV
pop
line 1644
;1643:
;1644:	if (pmq2->snapinitial)
ADDRGP4 pmq2
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $862
line 1645
;1645:		PMQ2_InitialSnapPosition();
ADDRGP4 PMQ2_InitialSnapPosition
CALLV
pop
LABELV $862
line 1649
;1646:
;1647:	//pmlq2.clipped = qtrue;
;1648:	// set groundentity, watertype, and waterlevel
;1649:	PMQ2_CatagorizePosition(0);
CNSTI4 0
ARGI4
ADDRGP4 PMQ2_CatagorizePosition
CALLV
pop
line 1652
;1650:	//pmlq2.clipped = qfalse; // dead ramp detection only after slidemove. actually nvm, this might also fix an issue where land gets detected before jump (i guess from quantizing position) and blocks rejump
;1651:
;1652:	if (pmq2->ps->pm_type == PM_DEAD)
ADDRLP4 24
CNSTI4 4
ASGNI4
ADDRGP4 pmq2
INDIRP4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $864
line 1653
;1653:		PMQ2_DeadMove();
ADDRGP4 PMQ2_DeadMove
CALLV
pop
LABELV $864
line 1655
;1654:
;1655:	PMQ2_CheckSpecialMovement();
ADDRGP4 PMQ2_CheckSpecialMovement
CALLV
pop
line 1658
;1656:
;1657:	// drop timing counter
;1658:	if (pmq2->ps->pm_time)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $866
line 1659
;1659:	{
line 1663
;1660:		int		msec;
;1661:
;1662:		//msec = pmq2->cmd.msec >> 3;
;1663:		msec = pmlq2.msec >> 3; // why is this >> 3?
ADDRLP4 28
ADDRGP4 pmlq2+64
INDIRI4
CNSTI4 3
RSHI4
ASGNI4
line 1664
;1664:		if (!msec)
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $869
line 1665
;1665:			msec = 1;
ADDRLP4 28
CNSTI4 1
ASGNI4
LABELV $869
line 1666
;1666:		if (msec >= pmq2->ps->pm_time)
ADDRLP4 28
INDIRI4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LTI4 $871
line 1667
;1667:		{
line 1668
;1668:			pmq2->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND/* | PMF_TIME_TELEPORT*/);
ADDRLP4 32
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 -289
BANDI4
ASGNI4
line 1669
;1669:			pmq2->ps->pm_time = 0;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1670
;1670:		}
ADDRGP4 $872
JUMPV
LABELV $871
line 1672
;1671:		else
;1672:			pmq2->ps->pm_time -= msec;
ADDRLP4 32
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRLP4 28
INDIRI4
SUBI4
ASGNI4
LABELV $872
line 1673
;1673:	}
LABELV $866
line 1679
;1674:
;1675:	//if (pmq2->ps->pm_flags & PMF_TIME_TELEPORT)
;1676:	//{	// teleport pause stays exactly in place
;1677:	//}
;1678:	//else 
;1679:	if (pmq2->ps->pm_flags & PMF_TIME_WATERJUMP)
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $873
line 1680
;1680:	{	// waterjump has no control, but falls
line 1681
;1681:		pmlq2.velocity[2] -= pmq2->ps->gravity * pmlq2.frametime;
ADDRLP4 28
ADDRGP4 pmlq2+12+8
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pmlq2+60
INDIRF4
MULF4
SUBF4
ASGNF4
line 1682
;1682:		if (pmlq2.velocity[2] < 0)
ADDRGP4 pmlq2+12+8
INDIRF4
CNSTF4 0
GEF4 $878
line 1683
;1683:		{	// cancel as soon as we are falling down again
line 1684
;1684:			pmq2->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND /*| PMF_TIME_TELEPORT*/);
ADDRLP4 32
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 -289
BANDI4
ASGNI4
line 1685
;1685:			pmq2->ps->pm_time = 0;
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1686
;1686:		}
LABELV $878
line 1688
;1687:
;1688:		PMQ2_StepSlideMove();
ADDRGP4 PMQ2_StepSlideMove
CALLV
pop
line 1689
;1689:		PMQ2_UpdateAntiLoop();
ADDRGP4 PMQ2_UpdateAntiLoop
CALLV
pop
line 1690
;1690:	}
ADDRGP4 $874
JUMPV
LABELV $873
line 1692
;1691:	else
;1692:	{
line 1693
;1693:		PMQ2_CheckJump();
ADDRGP4 PMQ2_CheckJump
CALLV
pop
line 1695
;1694:
;1695:		PMQ2_Friction();
ADDRGP4 PMQ2_Friction
CALLV
pop
line 1697
;1696:
;1697:		if (pmq2->waterlevel >= 2)
ADDRGP4 pmq2
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 2
LTI4 $882
line 1698
;1698:			PMQ2_WaterMove();
ADDRGP4 PMQ2_WaterMove
CALLV
pop
ADDRGP4 $883
JUMPV
LABELV $882
line 1699
;1699:		else {
line 1702
;1700:			vec3_t	angles;
;1701:
;1702:			VectorCopy(pmq2->ps->viewangles, angles);
ADDRLP4 28
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1703
;1703:			if (angles[PITCH] > 180)
ADDRLP4 28
INDIRF4
CNSTF4 1127481344
LEF4 $884
line 1704
;1704:				angles[PITCH] = angles[PITCH] - 360;
ADDRLP4 28
ADDRLP4 28
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $884
line 1705
;1705:			angles[PITCH] /= 3;
ADDRLP4 28
ADDRLP4 28
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 1707
;1706:
;1707:			AngleVectors(angles, pmlq2.forward, pmlq2.right, pmlq2.up);
ADDRLP4 28
ARGP4
ADDRGP4 pmlq2+24
ARGP4
ADDRGP4 pmlq2+36
ARGP4
ADDRGP4 pmlq2+48
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1709
;1708:
;1709:			PMQ2_AirMove();
ADDRGP4 PMQ2_AirMove
CALLV
pop
line 1710
;1710:		}
LABELV $883
line 1711
;1711:	}
LABELV $874
line 1714
;1712:
;1713:	// set groundentity, watertype, and waterlevel for final spot
;1714:	PMQ2_CatagorizePosition(1);
CNSTI4 1
ARGI4
ADDRGP4 PMQ2_CatagorizePosition
CALLV
pop
line 1721
;1715:
;1716:
;1717:	// from jk2: allow weapon changes
;1718:	// check for weapon change
;1719:	// can't change if weapon is firing, but can change
;1720:	// again if lowering or raising
;1721:	if (pm->ps->weaponTime > 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $889
line 1722
;1722:		pm->ps->weaponTime -= pmlq2.msec;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRGP4 pmlq2+64
INDIRI4
SUBI4
ASGNI4
line 1723
;1723:	}
LABELV $889
line 1724
;1724:	if (pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING) {
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $894
ADDRLP4 28
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 3
EQI4 $892
LABELV $894
line 1725
;1725:		if (pm->ps->weapon != pm->cmd.weapon) {
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
EQI4 $895
line 1726
;1726:			PM_BeginWeaponChange(pm->cmd.weapon);
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
line 1727
;1727:		}
LABELV $895
line 1728
;1728:	}
LABELV $892
line 1730
;1729:
;1730:	if (pm->ps->weaponTime > 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $897
line 1731
;1731:	}
ADDRGP4 $898
JUMPV
LABELV $897
line 1732
;1732:	else {
line 1734
;1733:		// change weapon if time
;1734:		if (pm->ps->weaponstate == WEAPON_DROPPING) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 2
NEI4 $899
line 1735
;1735:			PM_FinishWeaponChange();
ADDRGP4 PM_FinishWeaponChange
CALLV
pop
line 1736
;1736:		}
LABELV $899
line 1737
;1737:	}
LABELV $898
line 1744
;1738:
;1739:
;1740:	// end jk2: allow weapon changes
;1741:
;1742:
;1743:#ifdef AUTHENTIC_Q2SNAP
;1744:	PMQ2_SnapPosition();
ADDRGP4 PMQ2_SnapPosition
CALLV
pop
line 1745
;1745:	pmq2->ps->origin[0] *= 0.125f;
ADDRLP4 32
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTF4 1040187392
ADDRLP4 32
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1746
;1746:	pmq2->ps->origin[1] *= 0.125f;
ADDRLP4 36
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1040187392
ADDRLP4 36
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1747
;1747:	pmq2->ps->origin[2] *= 0.125f;
ADDRLP4 40
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTF4 1040187392
ADDRLP4 40
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1748
;1748:	pmq2->ps->velocity[0] *= 0.125f;
ADDRLP4 44
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTF4 1040187392
ADDRLP4 44
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1749
;1749:	pmq2->ps->velocity[1] *= 0.125f;
ADDRLP4 48
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTF4 1040187392
ADDRLP4 48
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1750
;1750:	pmq2->ps->velocity[2] *= 0.125f;
ADDRLP4 52
ADDRGP4 pmq2
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTF4 1040187392
ADDRLP4 52
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1756
;1751:#else 
;1752:	// TODO if not using authentic snap and if using q2 style trace (even if not?) we need to still nudge the final position in case its in a solid
;1753:	VectorCopy(pmlq2.origin,pmq2->ps->origin);
;1754:	VectorCopy(pmlq2.velocity,pmq2->ps->velocity);
;1755:#endif
;1756:}
LABELV $834
endproc PmoveQ2 56 16
import PM_FinishWeaponChange
import PM_BeginWeaponChange
bss
export pmlq2
align 4
LABELV pmlq2
skip 1224
export pmq2
align 4
LABELV pmq2
skip 4
import c_pmove
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
lit
align 1
LABELV $597
byte 1 37
byte 1 105
byte 1 58
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $534
byte 1 37
byte 1 105
byte 1 58
byte 1 80
byte 1 77
byte 1 70
byte 1 95
byte 1 84
byte 1 73
byte 1 77
byte 1 69
byte 1 95
byte 1 76
byte 1 65
byte 1 78
byte 1 68
byte 1 44
byte 1 32
byte 1 112
byte 1 109
byte 1 108
byte 1 113
byte 1 50
byte 1 46
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 91
byte 1 50
byte 1 93
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 40
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $521
byte 1 37
byte 1 105
byte 1 58
byte 1 80
byte 1 77
byte 1 70
byte 1 95
byte 1 84
byte 1 73
byte 1 77
byte 1 69
byte 1 95
byte 1 76
byte 1 65
byte 1 78
byte 1 68
byte 1 44
byte 1 32
byte 1 112
byte 1 109
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 83
byte 1 107
byte 1 105
byte 1 109
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 112
byte 1 109
byte 1 108
byte 1 113
byte 1 50
byte 1 46
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 105
byte 1 111
byte 1 117
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 91
byte 1 50
byte 1 93
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 40
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $499
byte 1 37
byte 1 105
byte 1 58
byte 1 80
byte 1 77
byte 1 70
byte 1 95
byte 1 84
byte 1 73
byte 1 77
byte 1 69
byte 1 95
byte 1 76
byte 1 65
byte 1 78
byte 1 68
byte 1 44
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 83
byte 1 107
byte 1 105
byte 1 109
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 112
byte 1 109
byte 1 108
byte 1 113
byte 1 50
byte 1 46
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 105
byte 1 111
byte 1 117
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 91
byte 1 50
byte 1 93
byte 1 32
byte 1 37
byte 1 102
byte 1 44
byte 1 32
byte 1 112
byte 1 109
byte 1 108
byte 1 113
byte 1 50
byte 1 46
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 91
byte 1 50
byte 1 93
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 40
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $491
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
LABELV $488
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
LABELV $485
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
LABELV $463
byte 1 37
byte 1 105
byte 1 58
byte 1 108
byte 1 97
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 112
byte 1 109
byte 1 108
byte 1 113
byte 1 50
byte 1 46
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 91
byte 1 50
byte 1 93
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 40
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 10
byte 1 0
