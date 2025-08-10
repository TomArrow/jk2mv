export ObjectDie
code
proc ObjectDie 0 8
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_combat.c"
line 15
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_combat.c
;4:
;5:#include "g_local.h"
;6:#include "g_defrag.h"
;7:
;8://rww - pd
;9:void BotDamageNotification(gclient_t *bot, gentity_t *attacker);
;10://end rww
;11:
;12:void ThrowSaberToAttacker(gentity_t *self, gentity_t *attacker);
;13:
;14:void ObjectDie (gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath )
;15:{
line 16
;16:	if(self->target)
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $121
line 17
;17:	{
line 18
;18:		G_UseTargets(self, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 19
;19:	}
LABELV $121
line 22
;20:
;21:	//remove my script_targetname
;22:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 23
;23:}
LABELV $120
endproc ObjectDie 0 8
export G_GetHitLocation
proc G_GetHitLocation 152 16
line 153
;24:
;25:/*
;26:int G_GetHitLocFromSurfName( gentity_t *ent, const char *surfName, vec3_t point )
;27:{
;28:	if ( !surfName || !surfName[0] )
;29:	{
;30:		return HL_NONE;
;31:	}
;32:	if ( !Q_strncmp( "hips", surfName, 4 ) )
;33:	{//FIXME: test properly for legs
;34:		if ( Q_irand( 0, 1 ) )
;35:		{
;36:			return HL_WAIST;
;37:		}
;38:		else if ( Q_irand( 0, 1 ) )
;39:		{
;40:			return HL_LEG_RT;
;41:		}
;42:		else
;43:		{
;44:			return HL_LEG_LT;
;45:		}
;46:	}
;47:	else if ( !Q_strncmp( "torso", surfName, 5 ) )
;48:	{
;49:		if ( !ent->client )
;50:		{
;51:			return HL_CHEST;
;52:		}
;53:		else
;54:		{
;55:			vec3_t	t_fwd, t_rt, t_up, dirToImpact;
;56:			float frontSide, rightSide, upSide;
;57:			AngleVectors( ent->client->renderInfo.torsoAngles, t_fwd, t_rt, t_up );
;58:			VectorSubtract( point, ent->client->renderInfo.torsoPoint, dirToImpact );
;59:			frontSide = DotProduct( t_fwd, dirToImpact );
;60:			rightSide = DotProduct( t_rt, dirToImpact );
;61:			upSide = DotProduct( t_up, dirToImpact );
;62:			if ( upSide < 0 )
;63:			{//hit at waist
;64:				return HL_WAIST;
;65:			}
;66:			else
;67:			{//hit on upper torso
;68:				if ( rightSide > 10 )
;69:				{
;70:					return HL_ARM_RT;
;71:				}
;72:				else if ( rightSide < -10 )
;73:				{
;74:					return HL_ARM_LT;
;75:				}
;76:				else if ( rightSide > 4 )
;77:				{
;78:					if ( frontSide > 0 )
;79:					{
;80:						return HL_CHEST_RT;
;81:					}
;82:					else
;83:					{
;84:						return HL_BACK_RT;
;85:					}
;86:				}
;87:				else if ( rightSide < -4 )
;88:				{
;89:					if ( frontSide > 0 )
;90:					{
;91:						return HL_CHEST_LT;
;92:					}
;93:					else
;94:					{
;95:						return HL_BACK_LT;
;96:					}
;97:				}
;98:				else if ( upSide > 6 )
;99:				{
;100:					return HL_HEAD;
;101:				}
;102:				else if ( frontSide > 0 )
;103:				{
;104:					return HL_CHEST;
;105:				}
;106:				else
;107:				{
;108:					return HL_BACK;
;109:				}
;110:			}
;111:		}
;112:	}
;113:	else if ( !Q_strncmp( "head", surfName, 4 ) )
;114:	{
;115:		return HL_HEAD;
;116:	}
;117:	else if ( !Q_strncmp( "r_arm", surfName, 5 ) )
;118:	{
;119:		return HL_ARM_RT;
;120:	}
;121:	else if ( !Q_strncmp( "l_arm", surfName, 5 ) )
;122:	{
;123:		return HL_ARM_LT;
;124:	}
;125:	else if ( !Q_strncmp( "r_leg", surfName, 5 ) )
;126:	{
;127:		if ( ent->client && DistanceSquared( ent->client->renderInfo.crotchPoint, point ) > 144 )
;128:		{//not close enough to the pelvis to be a dismemberment hit and we don't dismember at the ankle or knee
;129:			return HL_FOOT_RT;
;130:		}
;131:		return HL_LEG_RT;
;132:	}
;133:	else if ( !Q_strncmp( "l_leg", surfName, 5 ) )
;134:	{
;135:		if ( ent->client && DistanceSquared( ent->client->renderInfo.crotchPoint, point ) > 144 )
;136:		{//not close enough to the pelvis to be a dismemberment hit and we don't dismember at the ankle or knee
;137:			return HL_FOOT_LT;
;138:		}
;139:		return HL_LEG_LT;
;140:	}
;141:	else if ( !Q_strncmp( "r_hand", surfName, 6 ) )
;142:	{
;143:		return HL_HAND_RT;
;144:	}
;145:	else if ( !Q_strncmp( "l_hand", surfName, 6 ) )
;146:	{
;147:		return HL_HAND_LT;
;148:	}
;149:	return HL_NONE;
;150:}
;151:*/
;152:int G_GetHitLocation(gentity_t *target, vec3_t ppoint)
;153:{
line 163
;154:	vec3_t			point, point_dir;
;155:	vec3_t			forward, right, up;
;156:	vec3_t			tangles, tcenter;
;157:	// float			tradius;
;158:	float			udot, fdot, rdot;
;159:	int				Vertical, Forward, Lateral;
;160:	int				HitLoc;
;161:
;162:	// Get target forward, right and up.
;163:	if(target->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $124
line 164
;164:	{
line 166
;165:		// Ignore player's pitch and roll.
;166:		VectorSet(tangles, 0, target->r.currentAngles[YAW], 0);
ADDRLP4 88
CNSTF4 0
ASGNF4
ADDRLP4 88+4
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRF4
ASGNF4
ADDRLP4 88+8
CNSTF4 0
ASGNF4
line 167
;167:	}
LABELV $124
line 169
;168:
;169:	AngleVectors(tangles, forward, right, up);
ADDRLP4 88
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 52
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 172
;170:
;171:	// Get center of target.
;172:	VectorAdd(target->r.absmin, target->r.absmax, tcenter);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 112
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 112
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 116
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDRLP4 116
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDF4
ASGNF4
line 173
;173:	VectorScale(tcenter, 0.5, tcenter);
ADDRLP4 120
CNSTF4 1056964608
ASGNF4
ADDRLP4 12
ADDRLP4 120
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 120
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
line 176
;174:
;175:	// Get impact point.
;176:	if(ppoint && !VectorCompare(ppoint, vec3_origin))
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $134
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 128
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $134
line 177
;177:	{
line 178
;178:		VectorCopy(ppoint, point);
ADDRLP4 68
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 179
;179:	}
ADDRGP4 $135
JUMPV
LABELV $134
line 181
;180:	else
;181:	{
line 182
;182:		return HL_NONE;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $135
line 207
;183:	}
;184:
;185:/*
;186:	// Get radius width of target.
;187:	tradius = (fabs(target->r.maxs[0]) + fabs(target->r.maxs[1]) + fabs(target->r.mins[0]) + fabs(target->r.mins[1]))/4;
;188:
;189://get impact dir
;190:	if(pdir && !VectorCompare(pdir, vec3_origin))
;191:	{
;192:		VectorCopy(pdir, dir);
;193:	}
;194:	else
;195:	{
;196:		return;
;197:	}
;198:
;199://put point at controlled distance from center
;200:	VectorSubtract(point, tcenter, tempvec);
;201:	tempvec[2] = 0;
;202:	hdist = VectorLength(tempvec);
;203:
;204:	VectorMA(point, hdist - tradius, dir, point);
;205:	//now a point on the surface of a cylinder with a radius of tradius
;206:*/	
;207:	VectorSubtract(point, tcenter, point_dir);
ADDRLP4 0
ADDRLP4 68
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 68+4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 68+8
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 208
;208:	VectorNormalize(point_dir);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 211
;209:
;210:	// Get bottom to top (vertical) position index
;211:	udot = DotProduct(up, point_dir);
ADDRLP4 80
ADDRLP4 52
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 52+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 52+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 212
;212:	if(udot>.800)
ADDRLP4 80
INDIRF4
CNSTF4 1061997773
LEF4 $146
line 213
;213:	{
line 214
;214:		Vertical = 4;
ADDRLP4 100
CNSTI4 4
ASGNI4
line 215
;215:	}
ADDRGP4 $147
JUMPV
LABELV $146
line 216
;216:	else if(udot>.400)
ADDRLP4 80
INDIRF4
CNSTF4 1053609165
LEF4 $148
line 217
;217:	{
line 218
;218:		Vertical = 3;
ADDRLP4 100
CNSTI4 3
ASGNI4
line 219
;219:	}
ADDRGP4 $149
JUMPV
LABELV $148
line 220
;220:	else if(udot>-.333)
ADDRLP4 80
INDIRF4
CNSTF4 3198844666
LEF4 $150
line 221
;221:	{
line 222
;222:		Vertical = 2;
ADDRLP4 100
CNSTI4 2
ASGNI4
line 223
;223:	}
ADDRGP4 $151
JUMPV
LABELV $150
line 224
;224:	else if(udot>-.666)
ADDRLP4 80
INDIRF4
CNSTF4 3207233274
LEF4 $152
line 225
;225:	{
line 226
;226:		Vertical = 1;
ADDRLP4 100
CNSTI4 1
ASGNI4
line 227
;227:	}
ADDRGP4 $153
JUMPV
LABELV $152
line 229
;228:	else
;229:	{
line 230
;230:		Vertical = 0;
ADDRLP4 100
CNSTI4 0
ASGNI4
line 231
;231:	}
LABELV $153
LABELV $151
LABELV $149
LABELV $147
line 234
;232:
;233:	// Get back to front (forward) position index.
;234:	fdot = DotProduct(forward, point_dir);
ADDRLP4 84
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 28+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 235
;235:	if(fdot>.666)
ADDRLP4 84
INDIRF4
CNSTF4 1059749626
LEF4 $158
line 236
;236:	{
line 237
;237:		Forward = 4;
ADDRLP4 104
CNSTI4 4
ASGNI4
line 238
;238:	}
ADDRGP4 $159
JUMPV
LABELV $158
line 239
;239:	else if(fdot>.333)
ADDRLP4 84
INDIRF4
CNSTF4 1051361018
LEF4 $160
line 240
;240:	{
line 241
;241:		Forward = 3;
ADDRLP4 104
CNSTI4 3
ASGNI4
line 242
;242:	}
ADDRGP4 $161
JUMPV
LABELV $160
line 243
;243:	else if(fdot>-.333)
ADDRLP4 84
INDIRF4
CNSTF4 3198844666
LEF4 $162
line 244
;244:	{
line 245
;245:		Forward = 2;
ADDRLP4 104
CNSTI4 2
ASGNI4
line 246
;246:	}
ADDRGP4 $163
JUMPV
LABELV $162
line 247
;247:	else if(fdot>-.666)
ADDRLP4 84
INDIRF4
CNSTF4 3207233274
LEF4 $164
line 248
;248:	{
line 249
;249:		Forward = 1;
ADDRLP4 104
CNSTI4 1
ASGNI4
line 250
;250:	}
ADDRGP4 $165
JUMPV
LABELV $164
line 252
;251:	else
;252:	{
line 253
;253:		Forward = 0;
ADDRLP4 104
CNSTI4 0
ASGNI4
line 254
;254:	}
LABELV $165
LABELV $163
LABELV $161
LABELV $159
line 257
;255:
;256:	// Get left to right (lateral) position index.
;257:	rdot = DotProduct(right, point_dir);
ADDRLP4 64
ADDRLP4 40
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 258
;258:	if(rdot>.666)
ADDRLP4 64
INDIRF4
CNSTF4 1059749626
LEF4 $170
line 259
;259:	{
line 260
;260:		Lateral = 4;
ADDRLP4 108
CNSTI4 4
ASGNI4
line 261
;261:	}
ADDRGP4 $171
JUMPV
LABELV $170
line 262
;262:	else if(rdot>.333)
ADDRLP4 64
INDIRF4
CNSTF4 1051361018
LEF4 $172
line 263
;263:	{
line 264
;264:		Lateral = 3;
ADDRLP4 108
CNSTI4 3
ASGNI4
line 265
;265:	}
ADDRGP4 $173
JUMPV
LABELV $172
line 266
;266:	else if(rdot>-.333)
ADDRLP4 64
INDIRF4
CNSTF4 3198844666
LEF4 $174
line 267
;267:	{
line 268
;268:		Lateral = 2;
ADDRLP4 108
CNSTI4 2
ASGNI4
line 269
;269:	}
ADDRGP4 $175
JUMPV
LABELV $174
line 270
;270:	else if(rdot>-.666)
ADDRLP4 64
INDIRF4
CNSTF4 3207233274
LEF4 $176
line 271
;271:	{
line 272
;272:		Lateral = 1;
ADDRLP4 108
CNSTI4 1
ASGNI4
line 273
;273:	}
ADDRGP4 $177
JUMPV
LABELV $176
line 275
;274:	else
;275:	{
line 276
;276:		Lateral = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 277
;277:	}
LABELV $177
LABELV $175
LABELV $173
LABELV $171
line 279
;278:
;279:	HitLoc = Vertical * 25 + Forward * 5 + Lateral;
ADDRLP4 24
CNSTI4 25
ADDRLP4 100
INDIRI4
MULI4
CNSTI4 5
ADDRLP4 104
INDIRI4
MULI4
ADDI4
ADDRLP4 108
INDIRI4
ADDI4
ASGNI4
line 281
;280:
;281:	if(HitLoc <= 10)
ADDRLP4 24
INDIRI4
CNSTI4 10
GTI4 $178
line 282
;282:	{
line 284
;283:		// Feet.
;284:		if ( rdot > 0 )
ADDRLP4 64
INDIRF4
CNSTF4 0
LEF4 $180
line 285
;285:		{
line 286
;286:			return HL_FOOT_RT;
CNSTI4 1
RETI4
ADDRGP4 $123
JUMPV
LABELV $180
line 289
;287:		}
;288:		else
;289:		{
line 290
;290:			return HL_FOOT_LT;
CNSTI4 2
RETI4
ADDRGP4 $123
JUMPV
LABELV $178
line 293
;291:		}
;292:	}
;293:	else if(HitLoc <= 50)
ADDRLP4 24
INDIRI4
CNSTI4 50
GTI4 $182
line 294
;294:	{
line 296
;295:		// Legs.
;296:		if ( rdot > 0 )
ADDRLP4 64
INDIRF4
CNSTF4 0
LEF4 $184
line 297
;297:		{
line 298
;298:			return HL_LEG_RT;
CNSTI4 3
RETI4
ADDRGP4 $123
JUMPV
LABELV $184
line 301
;299:		}
;300:		else
;301:		{
line 302
;302:			return HL_LEG_LT;
CNSTI4 4
RETI4
ADDRGP4 $123
JUMPV
LABELV $182
line 305
;303:		}
;304:	}
;305:	else if(HitLoc == 56||HitLoc == 60||HitLoc == 61||HitLoc == 65||HitLoc == 66||HitLoc == 70)
ADDRLP4 24
INDIRI4
CNSTI4 56
EQI4 $192
ADDRLP4 24
INDIRI4
CNSTI4 60
EQI4 $192
ADDRLP4 24
INDIRI4
CNSTI4 61
EQI4 $192
ADDRLP4 24
INDIRI4
CNSTI4 65
EQI4 $192
ADDRLP4 24
INDIRI4
CNSTI4 66
EQI4 $192
ADDRLP4 24
INDIRI4
CNSTI4 70
NEI4 $186
LABELV $192
line 306
;306:	{
line 308
;307:		// Hands.
;308:		if ( rdot > 0 )
ADDRLP4 64
INDIRF4
CNSTF4 0
LEF4 $193
line 309
;309:		{
line 310
;310:			return HL_HAND_RT;
CNSTI4 14
RETI4
ADDRGP4 $123
JUMPV
LABELV $193
line 313
;311:		}
;312:		else
;313:		{
line 314
;314:			return HL_HAND_LT;
CNSTI4 15
RETI4
ADDRGP4 $123
JUMPV
LABELV $186
line 317
;315:		}
;316:	}
;317:	else if(HitLoc == 83||HitLoc == 87||HitLoc == 88||HitLoc == 92||HitLoc == 93||HitLoc == 97)
ADDRLP4 24
INDIRI4
CNSTI4 83
EQI4 $201
ADDRLP4 24
INDIRI4
CNSTI4 87
EQI4 $201
ADDRLP4 24
INDIRI4
CNSTI4 88
EQI4 $201
ADDRLP4 24
INDIRI4
CNSTI4 92
EQI4 $201
ADDRLP4 24
INDIRI4
CNSTI4 93
EQI4 $201
ADDRLP4 24
INDIRI4
CNSTI4 97
NEI4 $195
LABELV $201
line 318
;318:	{
line 320
;319:		// Arms.
;320:		if ( rdot > 0 )
ADDRLP4 64
INDIRF4
CNSTF4 0
LEF4 $202
line 321
;321:		{
line 322
;322:			return HL_ARM_RT;
CNSTI4 12
RETI4
ADDRGP4 $123
JUMPV
LABELV $202
line 325
;323:		}
;324:		else
;325:		{
line 326
;326:			return HL_ARM_LT;
CNSTI4 13
RETI4
ADDRGP4 $123
JUMPV
LABELV $195
line 329
;327:		}
;328:	}
;329:	else if((HitLoc >= 107 && HitLoc <= 109)||(HitLoc >= 112 && HitLoc <= 114)||(HitLoc >= 117 && HitLoc <= 119))
ADDRLP4 24
INDIRI4
CNSTI4 107
LTI4 $207
ADDRLP4 24
INDIRI4
CNSTI4 109
LEI4 $208
LABELV $207
ADDRLP4 24
INDIRI4
CNSTI4 112
LTI4 $209
ADDRLP4 24
INDIRI4
CNSTI4 114
LEI4 $208
LABELV $209
ADDRLP4 24
INDIRI4
CNSTI4 117
LTI4 $204
ADDRLP4 24
INDIRI4
CNSTI4 119
GTI4 $204
LABELV $208
line 330
;330:	{
line 332
;331:		// Head.
;332:		return HL_HEAD;
CNSTI4 16
RETI4
ADDRGP4 $123
JUMPV
LABELV $204
line 335
;333:	}
;334:	else
;335:	{
line 336
;336:		if(udot < 0.3)
ADDRLP4 80
INDIRF4
CNSTF4 1050253722
GEF4 $210
line 337
;337:		{
line 338
;338:			return HL_WAIST;
CNSTI4 5
RETI4
ADDRGP4 $123
JUMPV
LABELV $210
line 340
;339:		}
;340:		else if(fdot < 0)
ADDRLP4 84
INDIRF4
CNSTF4 0
GEF4 $212
line 341
;341:		{
line 342
;342:			if(rdot > 0.4)
ADDRLP4 64
INDIRF4
CNSTF4 1053609165
LEF4 $214
line 343
;343:			{
line 344
;344:				return HL_BACK_RT;
CNSTI4 6
RETI4
ADDRGP4 $123
JUMPV
LABELV $214
line 346
;345:			}
;346:			else if(rdot < -0.4)
ADDRLP4 64
INDIRF4
CNSTF4 3201092813
GEF4 $216
line 347
;347:			{
line 348
;348:				return HL_BACK_LT;
CNSTI4 7
RETI4
ADDRGP4 $123
JUMPV
LABELV $216
line 350
;349:			}
;350:			else if(fdot < 0)
ADDRLP4 84
INDIRF4
CNSTF4 0
GEF4 $213
line 351
;351:			{
line 352
;352:				return HL_BACK;
CNSTI4 8
RETI4
ADDRGP4 $123
JUMPV
line 354
;353:			}
;354:		}
LABELV $212
line 356
;355:		else
;356:		{
line 357
;357:			if(rdot > 0.3)
ADDRLP4 64
INDIRF4
CNSTF4 1050253722
LEF4 $220
line 358
;358:			{
line 359
;359:				return HL_CHEST_RT;
CNSTI4 9
RETI4
ADDRGP4 $123
JUMPV
LABELV $220
line 361
;360:			}
;361:			else if(rdot < -0.3)
ADDRLP4 64
INDIRF4
CNSTF4 3197737370
GEF4 $222
line 362
;362:			{
line 363
;363:				return HL_CHEST_LT;
CNSTI4 10
RETI4
ADDRGP4 $123
JUMPV
LABELV $222
line 365
;364:			}
;365:			else if(fdot < 0)
ADDRLP4 84
INDIRF4
CNSTF4 0
GEF4 $224
line 366
;366:			{
line 367
;367:				return HL_CHEST;
CNSTI4 11
RETI4
ADDRGP4 $123
JUMPV
LABELV $224
line 369
;368:			}
;369:		}
LABELV $213
line 370
;370:	}
line 371
;371:	return HL_NONE;
CNSTI4 0
RETI4
LABELV $123
endproc G_GetHitLocation 152 16
export ExplodeDeath
proc ExplodeDeath 40 24
line 476
;372:}
;373:
;374:/*
;375:int G_PickPainAnim( gentity_t *self, vec3_t point, int damage )
;376:{
;377:	switch( G_GetHitLocation( self, point ) )
;378:	{
;379:	case HL_FOOT_RT:
;380:		return BOTH_PAIN12;
;381:		//PAIN12 = right foot
;382:		break;
;383:	case HL_FOOT_LT:
;384:		return -1;
;385:		break;
;386:	case HL_LEG_RT:
;387:		if ( !Q_irand( 0, 1 ) )
;388:		{
;389:			return BOTH_PAIN11;
;390:		}
;391:		else
;392:		{
;393:			return BOTH_PAIN13;
;394:		}
;395:		//PAIN11 = twitch right leg
;396:		//PAIN13 = right knee
;397:		break;
;398:	case HL_LEG_LT:
;399:		return BOTH_PAIN14;
;400:		//PAIN14 = twitch left leg
;401:		break;
;402:	case HL_BACK_RT:
;403:		return BOTH_PAIN7;
;404:		//PAIN7 = med left shoulder
;405:		break;
;406:	case HL_BACK_LT:
;407:		return Q_irand( BOTH_PAIN15, BOTH_PAIN16 );
;408:		//PAIN15 = med right shoulder
;409:		//PAIN16 = twitch right shoulder
;410:		break;
;411:	case HL_BACK:
;412:		if ( !Q_irand( 0, 1 ) )
;413:		{
;414:			return BOTH_PAIN1;
;415:		}
;416:		else
;417:		{
;418:			return BOTH_PAIN5;
;419:		}
;420:		//PAIN1 = back
;421:		//PAIN5 = same as 1
;422:		break;
;423:	case HL_CHEST_RT:
;424:		return BOTH_PAIN3;
;425:		//PAIN3 = long, right shoulder
;426:		break;
;427:	case HL_CHEST_LT:
;428:		return BOTH_PAIN2;
;429:		//PAIN2 = long, left shoulder
;430:		break;
;431:	case HL_WAIST:
;432:	case HL_CHEST:
;433:		if ( !Q_irand( 0, 3 ) )
;434:		{
;435:			return BOTH_PAIN6;
;436:		}
;437:		else if ( !Q_irand( 0, 2 ) )
;438:		{
;439:			return BOTH_PAIN8;
;440:		}
;441:		else if ( !Q_irand( 0, 1 ) )
;442:		{
;443:			return BOTH_PAIN17;
;444:		}
;445:		else
;446:		{
;447:			return BOTH_PAIN19;
;448:		}
;449:		//PAIN6 = gut
;450:		//PAIN8 = chest
;451:		//PAIN17 = twitch crotch
;452:		//PAIN19 = med crotch
;453:		break;
;454:	case HL_ARM_RT:
;455:	case HL_HAND_RT:
;456:		return BOTH_PAIN9;
;457:		//PAIN9 = twitch right arm
;458:		break;
;459:	case HL_ARM_LT:
;460:	case HL_HAND_LT:
;461:		return BOTH_PAIN10;
;462:		//PAIN10 = twitch left arm
;463:		break;
;464:	case HL_HEAD:
;465:		return BOTH_PAIN4;
;466:		//PAIN4 = head
;467:		break;
;468:	default:
;469:		return -1;
;470:		break;
;471:	}
;472:}
;473:*/
;474:
;475:void ExplodeDeath( gentity_t *self ) 
;476:{
line 480
;477://	gentity_t	*tent;
;478:	vec3_t		forward;
;479:
;480:	self->takedamage = qfalse;//stop chain reaction runaway loops
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 482
;481:
;482:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 484
;483:
;484:	VectorCopy( self->r.currentOrigin, self->s.pos.trBase );
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
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 487
;485:
;486://	tent = G_TempEntity( self->s.origin, EV_FX_EXPLOSION );
;487:	AngleVectors(self->s.angles, forward, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
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
ADDRGP4 AngleVectors
CALLV
pop
line 497
;488:
;489:/*	
;490:	if ( self->fxID > 0 )
;491:	{
;492:		G_PlayEffect( self->fxID, self->r.currentOrigin, forward );
;493:	}
;494:	else
;495:	*/
;496:
;497:	{
line 500
;498://		CG_SurfaceExplosion( self->r.currentOrigin, forward, 20.0f, 12.0f, ((self->spawnflags&4)==qfalse) );	//FIXME: This needs to be consistent to all exploders!
;499://		G_Sound(self, self->sounds );
;500:	}
line 502
;501:	
;502:	if(self->splashDamage > 0 && self->splashRadius > 0)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $227
ADDRLP4 20
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $227
line 503
;503:	{
line 504
;504:		gentity_t *attacker = self;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
line 505
;505:		if ( self->parent )
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $229
line 506
;506:		{
line 507
;507:			attacker = self->parent;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
line 508
;508:		}
LABELV $229
line 509
;509:		G_RadiusDamage( self->r.currentOrigin, attacker, self->splashDamage, self->splashRadius, 
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 36
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 511
;510:				attacker, MOD_UNKNOWN );
;511:	}
LABELV $227
line 513
;512:
;513:	ObjectDie( self, self, self, 20, 0 );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 20
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ObjectDie
CALLV
pop
line 514
;514:}
LABELV $226
endproc ExplodeDeath 40 24
export ScorePlum
proc ScorePlum 12 8
line 522
;515:
;516:
;517:/*
;518:============
;519:ScorePlum
;520:============
;521:*/
;522:void ScorePlum( gentity_t *ent, vec3_t origin, int score ) {
line 525
;523:	gentity_t *plum;
;524:
;525:	plum = G_TempEntity( origin, EV_SCOREPLUM );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 86
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 527
;526:	// only send this temp entity to a single client
;527:	plum->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 528
;528:	plum->r.singleClient = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 308
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 530
;529:	//
;530:	plum->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 531
;531:	plum->s.time = score;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 532
;532:}
LABELV $231
endproc ScorePlum 12 8
export AddScore
proc AddScore 8 0
line 541
;533:
;534:/*
;535:============
;536:AddScore
;537:
;538:Adds score to both the client and his team
;539:============
;540:*/
;541:void AddScore( gentity_t *ent, vec3_t origin, int score ) {
line 542
;542:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $233
line 543
;543:		return;
ADDRGP4 $232
JUMPV
LABELV $233
line 545
;544:	}
;545:	if ( ent->client->sess.raceMode ) { // dont affect points by dying or such. racemode has current racetimer as score
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $235
line 546
;546:		return;
ADDRGP4 $232
JUMPV
LABELV $235
line 549
;547:	}
;548:	// no scoring during pre-match warmup
;549:	if ( level.warmupTime ) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
EQI4 $237
line 550
;550:		return;
ADDRGP4 $232
JUMPV
LABELV $237
line 555
;551:	}
;552:	// show score plum
;553:	//ScorePlum(ent, origin, score);
;554:	//
;555:	ent->client->ps.persistant[PERS_SCORE] += score;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 556
;556:	if ( g_gametype.integer == GT_TEAM )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $240
line 557
;557:		level.teamScores[ ent->client->ps.persistant[PERS_TEAM] ] += score;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+52
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
LABELV $240
line 558
;558:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 559
;559:}
LABELV $232
endproc AddScore 8 0
export TossClientWeapon
proc TossClientWeapon 96 16
line 569
;560:
;561:/*
;562:=================
;563:TossClientItems
;564:
;565:rww - Toss the weapon away from the player in the specified direction
;566:=================
;567:*/
;568:void TossClientWeapon(gentity_t *self, vec3_t direction, float speed)
;569:{
line 573
;570:	vec3_t vel;
;571:	gitem_t *item;
;572:	gentity_t *launched;
;573:	int weapon = self->s.weapon;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 576
;574:	int ammoSub;
;575:
;576:	if (weapon <= WP_BRYAR_PISTOL)
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $245
line 577
;577:	{ //can't have this
line 578
;578:		return;
ADDRGP4 $244
JUMPV
LABELV $245
line 581
;579:	}
;580:
;581:	if (weapon == WP_EMPLACED_GUN ||
ADDRLP4 0
INDIRI4
CNSTI4 14
EQI4 $249
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $247
LABELV $249
line 583
;582:		weapon == WP_TURRET)
;583:	{
line 584
;584:		return;
ADDRGP4 $244
JUMPV
LABELV $247
line 588
;585:	}
;586:
;587:	// find the item type for this weapon
;588:	item = BG_FindItemForWeapon( weapon );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 32
INDIRP4
ASGNP4
line 590
;589:
;590:	ammoSub = (self->client->ps.ammo[weaponData[weapon].ammoIndex] - bg_itemlist[BG_GetItemIndexByTag(weapon, IT_WEAPON)].quantity);
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 40
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRLP4 44
CNSTI4 408
ASGNI4
ADDRLP4 24
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDP4
INDIRI4
CNSTI4 52
ADDRLP4 40
INDIRI4
MULI4
ADDRGP4 bg_itemlist+32
ADDP4
INDIRI4
SUBI4
ASGNI4
line 592
;591:
;592:	if (ammoSub < 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
GEI4 $251
line 593
;593:	{
line 594
;594:		int ammoQuan = item->quantity;
ADDRLP4 48
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 595
;595:		ammoQuan -= (-ammoSub);
ADDRLP4 48
ADDRLP4 48
INDIRI4
ADDRLP4 24
INDIRI4
NEGI4
SUBI4
ASGNI4
line 597
;596:
;597:		if (ammoQuan <= 0)
ADDRLP4 48
INDIRI4
CNSTI4 0
GTI4 $253
line 598
;598:		{ //no ammo
line 599
;599:			return;
ADDRGP4 $244
JUMPV
LABELV $253
line 601
;600:		}
;601:	}
LABELV $251
line 603
;602:
;603:	vel[0] = direction[0]*speed;
ADDRLP4 8
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 604
;604:	vel[1] = direction[1]*speed;
ADDRLP4 8+4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 605
;605:	vel[2] = direction[2]*speed;
ADDRLP4 8+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ASGNF4
line 607
;606:
;607:	launched = LaunchItem(self, item, self->client->ps.origin, vel);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 52
ADDRGP4 LaunchItem
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 52
INDIRP4
ASGNP4
line 609
;608:
;609:	launched->s.generic1 = self->s.number;
ADDRLP4 4
INDIRP4
CNSTI4 292
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 610
;610:	launched->s.powerups = level.time + 1500;
ADDRLP4 4
INDIRP4
CNSTI4 272
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 612
;611:
;612:	launched->count = bg_itemlist[BG_GetItemIndexByTag(weapon, IT_WEAPON)].quantity;
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 56
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 52
ADDRLP4 56
INDIRI4
MULI4
ADDRGP4 bg_itemlist+32
ADDP4
INDIRI4
ASGNI4
line 614
;613:
;614:	self->client->ps.ammo[weaponData[weapon].ammoIndex] -= bg_itemlist[BG_GetItemIndexByTag(weapon, IT_WEAPON)].quantity;
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 64
ADDRGP4 BG_GetItemIndexByTag
CALLI4
ASGNI4
ADDRLP4 68
CNSTI4 408
ASGNI4
ADDRLP4 72
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 52
ADDRLP4 64
INDIRI4
MULI4
ADDRGP4 bg_itemlist+32
ADDP4
INDIRI4
SUBI4
ASGNI4
line 616
;615:
;616:	if (self->client->ps.ammo[weaponData[weapon].ammoIndex] < 0)
ADDRLP4 76
CNSTI4 408
ASGNI4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $260
line 617
;617:	{
line 618
;618:		launched->count -= (-self->client->ps.ammo[weaponData[weapon].ammoIndex]);
ADDRLP4 80
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
ASGNP4
ADDRLP4 84
CNSTI4 408
ASGNI4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ADDP4
INDIRI4
NEGI4
SUBI4
ASGNI4
line 619
;619:		self->client->ps.ammo[weaponData[weapon].ammoIndex] = 0;
ADDRLP4 88
CNSTI4 408
ASGNI4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 620
;620:	}
LABELV $260
line 622
;621:
;622:	if ((self->client->ps.ammo[weaponData[weapon].ammoIndex] < 1 && weapon != WP_DET_PACK) ||
ADDRLP4 84
CNSTI4 408
ASGNI4
CNSTI4 56
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
ADDP4
INDIRI4
CNSTI4 1
GEI4 $265
ADDRLP4 0
INDIRI4
CNSTI4 13
NEI4 $264
LABELV $265
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $262
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $262
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $262
LABELV $264
line 624
;623:		(weapon != WP_THERMAL && weapon != WP_DET_PACK && weapon != WP_TRIP_MINE))
;624:	{
line 625
;625:		self->client->ps.stats[STAT_WEAPONS] &= ~(1 << weapon);
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 627
;626:
;627:		self->s.weapon = 0;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 0
ASGNI4
line 628
;628:		self->client->ps.weapon = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 630
;629:
;630:		G_AddEvent(self, EV_NOAMMO, weapon);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 22
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 631
;631:	}
LABELV $262
line 632
;632:}
LABELV $244
endproc TossClientWeapon 96 16
export TossClientItems
proc TossClientItems 60 12
line 641
;633:
;634:/*
;635:=================
;636:TossClientItems
;637:
;638:Toss the weapon and powerups for the killed player
;639:=================
;640:*/
;641:void TossClientItems( gentity_t *self ) {
line 647
;642:	gitem_t		*item;
;643:	int			weapon;
;644:	float		angle;
;645:	int			i;
;646:	gentity_t	*drop;
;647:	int		nowTime = LEVELTIME(self->client);
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
EQU4 $271
ADDRLP4 32
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $271
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $273
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
ADDRGP4 $274
JUMPV
LABELV $273
ADDRLP4 28
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $274
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $272
JUMPV
LABELV $271
ADDRLP4 24
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $272
ADDRLP4 16
ADDRLP4 24
INDIRI4
ASGNI4
line 649
;648:
;649:	if (self->client->sess.raceMode)//racemode
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $275
line 650
;650:		return;
ADDRGP4 $266
JUMPV
LABELV $275
line 653
;651:
;652:	// drop the weapon if not a gauntlet or machinegun
;653:	weapon = self->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
line 659
;654:
;655:	// make a special check to see if they are changing to a new
;656:	// weapon that isn't the mg or gauntlet.  Without this, a client
;657:	// can pick up a weapon, be killed, and not drop the weapon because
;658:	// their weapon change hasn't completed yet and they are still holding the MG.
;659:	if ( weapon == WP_BRYAR_PISTOL) {
ADDRLP4 12
INDIRI4
CNSTI4 3
NEI4 $277
line 660
;660:		if ( self->client->ps.weaponstate == WEAPON_DROPPING ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 2
NEI4 $279
line 661
;661:			weapon = self->client->pers.cmd.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1404
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 662
;662:		}
LABELV $279
line 663
;663:		if ( !( self->client->ps.stats[STAT_WEAPONS] & ( 1 << weapon ) ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $281
line 664
;664:			weapon = WP_NONE;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 665
;665:		}
LABELV $281
line 666
;666:	}
LABELV $277
line 668
;667:
;668:	self->s.bolt2 = weapon;
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 670
;669:
;670:	if ( weapon > WP_BRYAR_PISTOL && 
ADDRLP4 12
INDIRI4
CNSTI4 3
LEI4 $283
ADDRLP4 12
INDIRI4
CNSTI4 14
EQI4 $283
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $283
ADDRLP4 40
CNSTI4 408
ASGNI4
CNSTI4 56
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $283
line 673
;671:		weapon != WP_EMPLACED_GUN &&
;672:		weapon != WP_TURRET &&
;673:		self->client->ps.ammo[ weaponData[weapon].ammoIndex ] ) {
line 677
;674:		gentity_t *te;
;675:
;676:		// find the item type for this weapon
;677:		item = BG_FindItemForWeapon( weapon );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 48
INDIRP4
ASGNP4
line 680
;678:
;679:		// tell all clients to remove the weapon model on this guy until he respawns
;680:		te = G_TempEntity( vec3_origin, EV_DESTROY_WEAPON_MODEL );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 91
ARGI4
ADDRLP4 52
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 52
INDIRP4
ASGNP4
line 681
;681:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 56
ADDRLP4 44
INDIRP4
CNSTI4 304
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
line 682
;682:		te->s.eventParm = self->s.number;
ADDRLP4 44
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 685
;683:
;684:		// spawn the item
;685:		Drop_Item( self, item, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 Drop_Item
CALLP4
pop
line 686
;686:	}
LABELV $283
line 689
;687:
;688:	// drop all the powerups if not in teamplay
;689:	if ( g_gametype.integer != GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $285
line 690
;690:		angle = 45;
ADDRLP4 20
CNSTF4 1110704128
ASGNF4
line 691
;691:		for ( i = 1 ; i < PW_NUM_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $288
line 692
;692:			if ( self->client->ps.powerups[ i ] > nowTime ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $292
line 693
;693:				item = BG_FindItemForPowerup( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 44
INDIRP4
ASGNP4
line 694
;694:				if ( !item ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $294
line 695
;695:					continue;
ADDRGP4 $289
JUMPV
LABELV $294
line 697
;696:				}
;697:				drop = Drop_Item( self, item, angle );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 48
INDIRP4
ASGNP4
line 699
;698:				// decide how many seconds it has left
;699:				drop->count = ( self->client->ps.powerups[ i ] - nowTime ) / 1000;
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 700
;700:				if ( drop->count < 1 ) {
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 1
GEI4 $296
line 701
;701:					drop->count = 1;
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 1
ASGNI4
line 702
;702:				}
LABELV $296
line 703
;703:				angle += 45;
ADDRLP4 20
ADDRLP4 20
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 704
;704:			}
LABELV $292
line 705
;705:		}
LABELV $289
line 691
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $288
line 706
;706:	}
LABELV $285
line 707
;707:}
LABELV $266
endproc TossClientItems 60 12
export LookAtKiller
proc LookAtKiller 40 4
line 715
;708:
;709:
;710:/*
;711:==================
;712:LookAtKiller
;713:==================
;714:*/
;715:void LookAtKiller( gentity_t *self, gentity_t *inflictor, gentity_t *attacker ) {
line 718
;716:	vec3_t		dir;
;717:
;718:	if ( attacker && attacker != self ) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 12
INDIRU4
CNSTU4 0
EQU4 $299
ADDRLP4 12
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $299
line 719
;719:		VectorSubtract (attacker->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 24
ASGNI4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28
CNSTI4 28
ASGNI4
ADDRLP4 0+4
ADDRLP4 16
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
SUBF4
ASGNF4
ADDRLP4 32
CNSTI4 32
ASGNI4
ADDRLP4 0+8
ADDRFP4 8
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 720
;720:	} else if ( inflictor && inflictor != self ) {
ADDRGP4 $300
JUMPV
LABELV $299
ADDRLP4 16
ADDRFP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
CNSTU4 0
EQU4 $303
ADDRLP4 16
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $303
line 721
;721:		VectorSubtract (inflictor->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 24
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 32
CNSTI4 28
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
CNSTI4 32
ASGNI4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 722
;722:	} else {
ADDRGP4 $304
JUMPV
LABELV $303
line 723
;723:		self->client->ps.stats[STAT_DEAD_YAW] = self->s.angles[YAW];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 240
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 724
;724:		return;
ADDRGP4 $298
JUMPV
LABELV $304
LABELV $300
line 727
;725:	}
;726:
;727:	self->client->ps.stats[STAT_DEAD_YAW] = vectoyaw ( dir );
ADDRLP4 0
ARGP4
ADDRLP4 20
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 240
ADDP4
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 728
;728:}
LABELV $298
endproc LookAtKiller 40 4
export GibEntity
proc GibEntity 0 12
line 735
;729:
;730:/*
;731:==================
;732:GibEntity
;733:==================
;734:*/
;735:void GibEntity( gentity_t *self, int killer ) {
line 736
;736:	G_AddEvent( self, EV_GIB_PLAYER, killer );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 85
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 737
;737:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 738
;738:	self->s.eType = ET_INVISIBLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 739
;739:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 740
;740:}
LABELV $307
endproc GibEntity 0 12
export BodyRid
proc BodyRid 0 4
line 743
;741:
;742:void BodyRid(gentity_t *ent)
;743:{
line 744
;744:	trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 745
;745:	ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 746
;746:}
LABELV $308
endproc BodyRid 0 4
export body_die
proc body_die 24 0
line 753
;747:
;748:/*
;749:==================
;750:body_die
;751:==================
;752:*/
;753:void body_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 755
;754:	// NOTENOTE No gibbing right now, this is star wars.
;755:	qboolean doDisint = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 757
;756:
;757:	if (self->health < (GIB_HEALTH+1))
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 -39
GEI4 $310
line 758
;758:	{
line 759
;759:		self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 -39
ASGNI4
line 761
;760:
;761:		if (self->client && (LEVELTIME(self->client) - self->client->respawnTime) < 2000)
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRU4
ADDRLP4 20
INDIRU4
EQU4 $312
ADDRLP4 16
INDIRU4
ADDRLP4 20
INDIRU4
EQU4 $318
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $318
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $320
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
ADDRGP4 $321
JUMPV
LABELV $320
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $321
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $319
JUMPV
LABELV $318
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $319
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43684
ADDP4
INDIRI4
SUBI4
CNSTI4 2000
GEI4 $312
line 762
;762:		{
line 763
;763:			doDisint = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 764
;764:		}
ADDRGP4 $313
JUMPV
LABELV $312
line 766
;765:		else
;766:		{
line 767
;767:			doDisint = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 768
;768:		}
LABELV $313
line 769
;769:	}
LABELV $310
line 771
;770:
;771:	if (self->client && (self->client->ps.eFlags & EF_DISINTEGRATION))
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $322
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $322
line 772
;772:	{
line 773
;773:		return;
ADDRGP4 $309
JUMPV
LABELV $322
line 775
;774:	}
;775:	else if (self->s.eFlags & EF_DISINTEGRATION)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $324
line 776
;776:	{
line 777
;777:		return;
ADDRGP4 $309
JUMPV
LABELV $324
line 780
;778:	}
;779:
;780:	if (doDisint)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $326
line 781
;781:	{
line 782
;782:		if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $328
line 783
;783:		{
line 784
;784:			self->client->ps.eFlags |= EF_DISINTEGRATION;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 33554432
BORI4
ASGNI4
line 785
;785:			VectorCopy(self->client->ps.origin, self->client->ps.lastHitLoc);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1368
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 786
;786:		}
ADDRGP4 $309
JUMPV
LABELV $328
line 788
;787:		else
;788:		{
line 789
;789:			self->s.eFlags |= EF_DISINTEGRATION;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 33554432
BORI4
ASGNI4
line 790
;790:			VectorCopy(self->r.currentOrigin, self->s.origin2);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 793
;791:
;792:			//since it's the corpse entity, tell it to "remove" itself
;793:			self->think = BodyRid;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 BodyRid
ASGNP4
line 794
;794:			self->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 795
;795:		}
line 796
;796:		return;
LABELV $326
line 798
;797:	}
;798:}
LABELV $309
endproc body_die 24 0
data
export modNames
align 4
LABELV modNames
address $331
address $332
address $333
address $334
address $335
address $336
address $337
address $338
address $339
address $340
address $341
address $342
address $343
address $344
address $345
address $346
address $347
address $348
address $349
address $350
address $351
address $352
address $353
address $354
address $355
address $356
address $357
address $358
address $359
address $360
address $361
address $362
address $363
address $364
address $365
address $366
address $367
address $368
export CheckAlmostCapture
code
proc CheckAlmostCapture 0 0
line 849
;799:
;800:
;801:// these are just for logging, the client prints its own messages
;802:char	*modNames[] = {
;803:	"MOD_UNKNOWN",
;804:	"MOD_STUN_BATON",
;805:	"MOD_MELEE",
;806:	"MOD_SABER",
;807:	"MOD_BRYAR_PISTOL",
;808:	"MOD_BRYAR_PISTOL_ALT",
;809:	"MOD_BLASTER",
;810:	"MOD_DISRUPTOR",
;811:	"MOD_DISRUPTOR_SPLASH",
;812:	"MOD_DISRUPTOR_SNIPER",
;813:	"MOD_BOWCASTER",
;814:	"MOD_REPEATER",
;815:	"MOD_REPEATER_ALT",
;816:	"MOD_REPEATER_ALT_SPLASH",
;817:	"MOD_DEMP2",
;818:	"MOD_DEMP2_ALT",
;819:	"MOD_FLECHETTE",
;820:	"MOD_FLECHETTE_ALT_SPLASH",
;821:	"MOD_ROCKET",
;822:	"MOD_ROCKET_SPLASH",
;823:	"MOD_ROCKET_HOMING",
;824:	"MOD_ROCKET_HOMING_SPLASH",
;825:	"MOD_THERMAL",
;826:	"MOD_THERMAL_SPLASH",
;827:	"MOD_TRIP_MINE_SPLASH",
;828:	"MOD_TIMED_MINE_SPLASH",
;829:	"MOD_DET_PACK_SPLASH",
;830:	"MOD_FORCE_DARK",
;831:	"MOD_SENTRY",
;832:	"MOD_WATER",
;833:	"MOD_SLIME",
;834:	"MOD_LAVA",
;835:	"MOD_CRUSH",
;836:	"MOD_TELEFRAG",
;837:	"MOD_FALLING",
;838:	"MOD_SUICIDE",
;839:	"MOD_TARGET_LASER",
;840:	"MOD_TRIGGER_HURT"
;841:};
;842:
;843:
;844:/*
;845:==================
;846:CheckAlmostCapture
;847:==================
;848:*/
;849:void CheckAlmostCapture( gentity_t *self, gentity_t *attacker ) {
line 894
;850:#if 0
;851:	gentity_t	*ent;
;852:	vec3_t		dir;
;853:	char		*classname;
;854:
;855:	// if this player was carrying a flag
;856:	if ( self->client->ps.powerups[PW_REDFLAG] ||
;857:		self->client->ps.powerups[PW_BLUEFLAG] ||
;858:		self->client->ps.powerups[PW_NEUTRALFLAG] ) {
;859:		// get the goal flag this player should have been going for
;860:		if ( g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY ) {
;861:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
;862:				classname = "team_CTF_blueflag";
;863:			}
;864:			else {
;865:				classname = "team_CTF_redflag";
;866:			}
;867:		}
;868:		else {
;869:			if ( self->client->sess.sessionTeam == TEAM_BLUE ) {
;870:				classname = "team_CTF_redflag";
;871:			}
;872:			else {
;873:				classname = "team_CTF_blueflag";
;874:			}
;875:		}
;876:		ent = NULL;
;877:		do
;878:		{
;879:			ent = G_FindByClassNameFast(ent, classname);
;880:		} while (ent && (ent->flags & FL_DROPPED_ITEM));
;881:		// if we found the destination flag and it's not picked up
;882:		if (ent && !(ent->r.svFlags & SVF_NOCLIENT) ) {
;883:			// if the player was *very* close
;884:			VectorSubtract( self->client->ps.origin, ent->s.origin, dir );
;885:			if ( VectorLength(dir) < 200 ) {
;886:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
;887:				if ( attacker->client ) {
;888:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
;889:				}
;890:			}
;891:		}
;892:	}
;893:#endif
;894:}
LABELV $369
endproc CheckAlmostCapture 0 0
export G_InKnockDown
proc G_InKnockDown 8 0
line 897
;895:
;896:qboolean G_InKnockDown( playerState_t *ps )
;897:{
line 898
;898:	switch ( (ps->legsAnim&~ANIM_TOGGLEBIT) )
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
CNSTI4 924
LTI4 $371
ADDRLP4 0
INDIRI4
CNSTI4 942
GTI4 $371
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $376-3696
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $376
address $374
address $374
address $374
address $374
address $374
address $375
address $375
address $375
address $375
address $375
address $371
address $371
address $375
address $375
address $375
address $375
address $375
address $375
address $375
code
line 899
;899:	{
LABELV $374
line 905
;900:	case BOTH_KNOCKDOWN1:
;901:	case BOTH_KNOCKDOWN2:
;902:	case BOTH_KNOCKDOWN3:
;903:	case BOTH_KNOCKDOWN4:
;904:	case BOTH_KNOCKDOWN5:
;905:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $370
JUMPV
line 906
;906:		break;
LABELV $375
line 919
;907:	case BOTH_GETUP1:
;908:	case BOTH_GETUP2:
;909:	case BOTH_GETUP3:
;910:	case BOTH_GETUP4:
;911:	case BOTH_GETUP5:
;912:	case BOTH_FORCE_GETUP_F1:
;913:	case BOTH_FORCE_GETUP_F2:
;914:	case BOTH_FORCE_GETUP_B1:
;915:	case BOTH_FORCE_GETUP_B2:
;916:	case BOTH_FORCE_GETUP_B3:
;917:	case BOTH_FORCE_GETUP_B4:
;918:	case BOTH_FORCE_GETUP_B5:
;919:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $370
JUMPV
line 920
;920:		break;
LABELV $371
line 922
;921:	}
;922:	return qfalse;
CNSTI4 0
RETI4
LABELV $370
endproc G_InKnockDown 8 0
proc G_CheckSpecialDeathAnim 64 16
line 926
;923:}
;924:
;925:static int G_CheckSpecialDeathAnim( gentity_t *self, vec3_t point, int damage, int mod, int hitLoc )
;926:{
line 927
;927:	int deathAnim = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 929
;928:
;929:	if ( BG_InRoll( &self->client->ps, self->client->ps.legsAnim ) )
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $379
line 930
;930:	{
line 931
;931:		deathAnim = BOTH_DEATH_ROLL;		//# Death anim from a roll
ADDRLP4 0
CNSTI4 37
ASGNI4
line 932
;932:	}
ADDRGP4 $380
JUMPV
LABELV $379
line 933
;933:	else if ( BG_FlippingAnim( self->client->ps.legsAnim ) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $381
line 934
;934:	{
line 935
;935:		deathAnim = BOTH_DEATH_FLIP;		//# Death anim from a flip
ADDRLP4 0
CNSTI4 38
ASGNI4
line 936
;936:	}
ADDRGP4 $382
JUMPV
LABELV $381
line 937
;937:	else if ( G_InKnockDown( &self->client->ps ) )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_InKnockDown
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $383
line 938
;938:	{//since these happen a lot, let's handle them case by case
line 939
;939:		int animLength = bgGlobalAnimations[self->client->ps.legsAnim&~ANIM_TOGGLEBIT].numFrames * abs(bgGlobalAnimations[self->client->ps.legsAnim&~ANIM_TOGGLEBIT].frameLerp);
ADDRLP4 24
CNSTI4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
MULI4
ASGNI4
line 940
;940:		switch ( self->client->ps.legsAnim&~ANIM_TOGGLEBIT )
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 924
LTI4 $387
ADDRLP4 32
INDIRI4
CNSTI4 943
GTI4 $387
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $550-3696
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $550
address $390
address $395
address $400
address $405
address $414
address $417
address $428
address $439
address $450
address $461
address $475
address $466
address $538
address $545
address $484
address $497
address $508
address $513
address $518
address $525
code
line 941
;941:		{
LABELV $390
line 943
;942:		case BOTH_KNOCKDOWN1:
;943:			if ( animLength - self->client->ps.legsTimer > 100 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 100
LEI4 $388
line 944
;944:			{//on our way down
line 945
;945:				if ( self->client->ps.legsTimer > 600 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 600
LEI4 $393
line 946
;946:				{//still partially up
line 947
;947:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 948
;948:				}
ADDRGP4 $388
JUMPV
LABELV $393
line 950
;949:				else
;950:				{//down
line 951
;951:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 952
;952:				}
line 953
;953:			}
line 954
;954:			break;
ADDRGP4 $388
JUMPV
LABELV $395
line 956
;955:		case BOTH_KNOCKDOWN2:
;956:			if ( animLength - self->client->ps.legsTimer > 700 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 700
LEI4 $388
line 957
;957:			{//on our way down
line 958
;958:				if ( self->client->ps.legsTimer > 600 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 600
LEI4 $398
line 959
;959:				{//still partially up
line 960
;960:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 961
;961:				}
ADDRGP4 $388
JUMPV
LABELV $398
line 963
;962:				else
;963:				{//down
line 964
;964:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 965
;965:				}
line 966
;966:			}
line 967
;967:			break;
ADDRGP4 $388
JUMPV
LABELV $400
line 969
;968:		case BOTH_KNOCKDOWN3:
;969:			if ( animLength - self->client->ps.legsTimer > 100 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 100
LEI4 $388
line 970
;970:			{//on our way down
line 971
;971:				if ( self->client->ps.legsTimer > 1300 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1300
LEI4 $403
line 972
;972:				{//still partially up
line 973
;973:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 974
;974:				}
ADDRGP4 $388
JUMPV
LABELV $403
line 976
;975:				else
;976:				{//down
line 977
;977:					deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 978
;978:				}
line 979
;979:			}
line 980
;980:			break;
ADDRGP4 $388
JUMPV
LABELV $405
line 982
;981:		case BOTH_KNOCKDOWN4:
;982:			if ( animLength - self->client->ps.legsTimer > 300 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 300
LEI4 $406
line 983
;983:			{//on our way down
line 984
;984:				if ( self->client->ps.legsTimer > 350 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 350
LEI4 $408
line 985
;985:				{//still partially up
line 986
;986:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 987
;987:				}
ADDRGP4 $388
JUMPV
LABELV $408
line 989
;988:				else
;989:				{//down
line 990
;990:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 991
;991:				}
line 992
;992:			}
ADDRGP4 $388
JUMPV
LABELV $406
line 994
;993:			else
;994:			{//crouch death
line 996
;995:				vec3_t fwd;
;996:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 998
;997:
;998:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 999
;999:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1001
;1000:
;1001:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $412
line 1002
;1002:				{
line 1003
;1003:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1004
;1004:				}
ADDRGP4 $388
JUMPV
LABELV $412
line 1006
;1005:				else
;1006:				{
line 1007
;1007:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1008
;1008:				}
line 1009
;1009:			}
line 1010
;1010:			break;
ADDRGP4 $388
JUMPV
LABELV $414
line 1012
;1011:		case BOTH_KNOCKDOWN5:
;1012:			if ( self->client->ps.legsTimer < 750 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 750
GEI4 $388
line 1013
;1013:			{//flat
line 1014
;1014:				deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 1015
;1015:			}
line 1016
;1016:			break;
ADDRGP4 $388
JUMPV
LABELV $417
line 1018
;1017:		case BOTH_GETUP1:
;1018:			if ( self->client->ps.legsTimer < 350 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 350
GEI4 $418
line 1019
;1019:			{//standing up
line 1020
;1020:			}
ADDRGP4 $388
JUMPV
LABELV $418
line 1021
;1021:			else if ( self->client->ps.legsTimer < 800 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 800
GEI4 $420
line 1022
;1022:			{//crouching
line 1024
;1023:				vec3_t fwd;
;1024:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1026
;1025:
;1026:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1027
;1027:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1028
;1028:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $424
line 1029
;1029:				{
line 1030
;1030:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1031
;1031:				}
ADDRGP4 $388
JUMPV
LABELV $424
line 1033
;1032:				else
;1033:				{
line 1034
;1034:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1035
;1035:				}
line 1036
;1036:			}
ADDRGP4 $388
JUMPV
LABELV $420
line 1038
;1037:			else
;1038:			{//lying down
line 1039
;1039:				if ( animLength - self->client->ps.legsTimer > 450 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 450
LEI4 $426
line 1040
;1040:				{//partially up
line 1041
;1041:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1042
;1042:				}
ADDRGP4 $388
JUMPV
LABELV $426
line 1044
;1043:				else
;1044:				{//down
line 1045
;1045:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1046
;1046:				}
line 1047
;1047:			}
line 1048
;1048:			break;
ADDRGP4 $388
JUMPV
LABELV $428
line 1050
;1049:		case BOTH_GETUP2:
;1050:			if ( self->client->ps.legsTimer < 150 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 150
GEI4 $429
line 1051
;1051:			{//standing up
line 1052
;1052:			}
ADDRGP4 $388
JUMPV
LABELV $429
line 1053
;1053:			else if ( self->client->ps.legsTimer < 850 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 850
GEI4 $431
line 1054
;1054:			{//crouching
line 1056
;1055:				vec3_t fwd;
;1056:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1058
;1057:
;1058:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1059
;1059:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1061
;1060:
;1061:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $435
line 1062
;1062:				{
line 1063
;1063:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1064
;1064:				}
ADDRGP4 $388
JUMPV
LABELV $435
line 1066
;1065:				else
;1066:				{
line 1067
;1067:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1068
;1068:				}
line 1069
;1069:			}
ADDRGP4 $388
JUMPV
LABELV $431
line 1071
;1070:			else
;1071:			{//lying down
line 1072
;1072:				if ( animLength - self->client->ps.legsTimer > 500 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 500
LEI4 $437
line 1073
;1073:				{//partially up
line 1074
;1074:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1075
;1075:				}
ADDRGP4 $388
JUMPV
LABELV $437
line 1077
;1076:				else
;1077:				{//down
line 1078
;1078:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1079
;1079:				}
line 1080
;1080:			}
line 1081
;1081:			break;
ADDRGP4 $388
JUMPV
LABELV $439
line 1083
;1082:		case BOTH_GETUP3:
;1083:			if ( self->client->ps.legsTimer < 250 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 250
GEI4 $440
line 1084
;1084:			{//standing up
line 1085
;1085:			}
ADDRGP4 $388
JUMPV
LABELV $440
line 1086
;1086:			else if ( self->client->ps.legsTimer < 600 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 600
GEI4 $442
line 1087
;1087:			{//crouching
line 1089
;1088:				vec3_t fwd;
;1089:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1090
;1090:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1091
;1091:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1093
;1092:
;1093:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $446
line 1094
;1094:				{
line 1095
;1095:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1096
;1096:				}
ADDRGP4 $388
JUMPV
LABELV $446
line 1098
;1097:				else
;1098:				{
line 1099
;1099:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1100
;1100:				}
line 1101
;1101:			}
ADDRGP4 $388
JUMPV
LABELV $442
line 1103
;1102:			else
;1103:			{//lying down
line 1104
;1104:				if ( animLength - self->client->ps.legsTimer > 150 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 150
LEI4 $448
line 1105
;1105:				{//partially up
line 1106
;1106:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 1107
;1107:				}
ADDRGP4 $388
JUMPV
LABELV $448
line 1109
;1108:				else
;1109:				{//down
line 1110
;1110:					deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 1111
;1111:				}
line 1112
;1112:			}
line 1113
;1113:			break;
ADDRGP4 $388
JUMPV
LABELV $450
line 1115
;1114:		case BOTH_GETUP4:
;1115:			if ( self->client->ps.legsTimer < 250 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 250
GEI4 $451
line 1116
;1116:			{//standing up
line 1117
;1117:			}
ADDRGP4 $388
JUMPV
LABELV $451
line 1118
;1118:			else if ( self->client->ps.legsTimer < 600 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 600
GEI4 $453
line 1119
;1119:			{//crouching
line 1121
;1120:				vec3_t fwd;
;1121:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1123
;1122:
;1123:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1124
;1124:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1126
;1125:
;1126:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $457
line 1127
;1127:				{
line 1128
;1128:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1129
;1129:				}
ADDRGP4 $388
JUMPV
LABELV $457
line 1131
;1130:				else
;1131:				{
line 1132
;1132:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1133
;1133:				}
line 1134
;1134:			}
ADDRGP4 $388
JUMPV
LABELV $453
line 1136
;1135:			else
;1136:			{//lying down
line 1137
;1137:				if ( animLength - self->client->ps.legsTimer > 850 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 850
LEI4 $459
line 1138
;1138:				{//partially up
line 1139
;1139:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 1140
;1140:				}
ADDRGP4 $388
JUMPV
LABELV $459
line 1142
;1141:				else
;1142:				{//down
line 1143
;1143:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1144
;1144:				}
line 1145
;1145:			}
line 1146
;1146:			break;
ADDRGP4 $388
JUMPV
LABELV $461
line 1148
;1147:		case BOTH_GETUP5:
;1148:			if ( self->client->ps.legsTimer > 850 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 850
LEI4 $388
line 1149
;1149:			{//lying down
line 1150
;1150:				if ( animLength - self->client->ps.legsTimer > 1500 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 1500
LEI4 $464
line 1151
;1151:				{//partially up
line 1152
;1152:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 1153
;1153:				}
ADDRGP4 $388
JUMPV
LABELV $464
line 1155
;1154:				else
;1155:				{//down
line 1156
;1156:					deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 1157
;1157:				}
line 1158
;1158:			}
line 1159
;1159:			break;
ADDRGP4 $388
JUMPV
LABELV $466
line 1161
;1160:		case BOTH_GETUP_CROUCH_B1:
;1161:			if ( self->client->ps.legsTimer < 800 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 800
GEI4 $467
line 1162
;1162:			{//crouching
line 1164
;1163:				vec3_t fwd;
;1164:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1166
;1165:
;1166:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1167
;1167:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1169
;1168:
;1169:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $471
line 1170
;1170:				{
line 1171
;1171:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1172
;1172:				}
ADDRGP4 $388
JUMPV
LABELV $471
line 1174
;1173:				else
;1174:				{
line 1175
;1175:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1176
;1176:				}
line 1177
;1177:			}
ADDRGP4 $388
JUMPV
LABELV $467
line 1179
;1178:			else
;1179:			{//lying down
line 1180
;1180:				if ( animLength - self->client->ps.legsTimer > 400 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 400
LEI4 $473
line 1181
;1181:				{//partially up
line 1182
;1182:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1183
;1183:				}
ADDRGP4 $388
JUMPV
LABELV $473
line 1185
;1184:				else
;1185:				{//down
line 1186
;1186:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1187
;1187:				}
line 1188
;1188:			}
line 1189
;1189:			break;
ADDRGP4 $388
JUMPV
LABELV $475
line 1191
;1190:		case BOTH_GETUP_CROUCH_F1:
;1191:			if ( self->client->ps.legsTimer < 800 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 800
GEI4 $476
line 1192
;1192:			{//crouching
line 1194
;1193:				vec3_t fwd;
;1194:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1196
;1195:
;1196:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1197
;1197:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1199
;1198:
;1199:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $480
line 1200
;1200:				{
line 1201
;1201:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1202
;1202:				}
ADDRGP4 $388
JUMPV
LABELV $480
line 1204
;1203:				else
;1204:				{
line 1205
;1205:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1206
;1206:				}
line 1207
;1207:			}
ADDRGP4 $388
JUMPV
LABELV $476
line 1209
;1208:			else
;1209:			{//lying down
line 1210
;1210:				if ( animLength - self->client->ps.legsTimer > 150 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 150
LEI4 $482
line 1211
;1211:				{//partially up
line 1212
;1212:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 1213
;1213:				}
ADDRGP4 $388
JUMPV
LABELV $482
line 1215
;1214:				else
;1215:				{//down
line 1216
;1216:					deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 1217
;1217:				}
line 1218
;1218:			}
line 1219
;1219:			break;
ADDRGP4 $388
JUMPV
LABELV $484
line 1221
;1220:		case BOTH_FORCE_GETUP_B1:
;1221:			if ( self->client->ps.legsTimer < 325 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 325
GEI4 $485
line 1222
;1222:			{//standing up
line 1223
;1223:			}
ADDRGP4 $388
JUMPV
LABELV $485
line 1224
;1224:			else if ( self->client->ps.legsTimer < 725 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 725
GEI4 $487
line 1225
;1225:			{//spinning up
line 1226
;1226:				deathAnim = BOTH_DEATH_SPIN_180;	//# Death anim when facing backwards
ADDRLP4 0
CNSTI4 41
ASGNI4
line 1227
;1227:			}
ADDRGP4 $388
JUMPV
LABELV $487
line 1228
;1228:			else if ( self->client->ps.legsTimer < 900 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 900
GEI4 $489
line 1229
;1229:			{//crouching
line 1231
;1230:				vec3_t fwd;
;1231:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1233
;1232:
;1233:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1234
;1234:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1236
;1235:
;1236:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $493
line 1237
;1237:				{
line 1238
;1238:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1239
;1239:				}
ADDRGP4 $388
JUMPV
LABELV $493
line 1241
;1240:				else
;1241:				{
line 1242
;1242:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1243
;1243:				}
line 1244
;1244:			}
ADDRGP4 $388
JUMPV
LABELV $489
line 1246
;1245:			else
;1246:			{//lying down
line 1247
;1247:				if ( animLength - self->client->ps.legsTimer > 50 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 50
LEI4 $495
line 1248
;1248:				{//partially up
line 1249
;1249:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1250
;1250:				}
ADDRGP4 $388
JUMPV
LABELV $495
line 1252
;1251:				else
;1252:				{//down
line 1253
;1253:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1254
;1254:				}
line 1255
;1255:			}
line 1256
;1256:			break;
ADDRGP4 $388
JUMPV
LABELV $497
line 1258
;1257:		case BOTH_FORCE_GETUP_B2:
;1258:			if ( self->client->ps.legsTimer < 575 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 575
GEI4 $498
line 1259
;1259:			{//standing up
line 1260
;1260:			}
ADDRGP4 $388
JUMPV
LABELV $498
line 1261
;1261:			else if ( self->client->ps.legsTimer < 875 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 875
GEI4 $500
line 1262
;1262:			{//spinning up
line 1263
;1263:				deathAnim = BOTH_DEATH_SPIN_180;	//# Death anim when facing backwards
ADDRLP4 0
CNSTI4 41
ASGNI4
line 1264
;1264:			}
ADDRGP4 $388
JUMPV
LABELV $500
line 1265
;1265:			else if ( self->client->ps.legsTimer < 900 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 900
GEI4 $502
line 1266
;1266:			{//crouching
line 1268
;1267:				vec3_t fwd;
;1268:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1270
;1269:
;1270:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1271
;1271:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1273
;1272:
;1273:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $506
line 1274
;1274:				{
line 1275
;1275:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1276
;1276:				}
ADDRGP4 $388
JUMPV
LABELV $506
line 1278
;1277:				else
;1278:				{
line 1279
;1279:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1280
;1280:				}
line 1281
;1281:			}
ADDRGP4 $388
JUMPV
LABELV $502
line 1283
;1282:			else
;1283:			{//lying down
line 1285
;1284:				//partially up
;1285:				deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1286
;1286:			}
line 1287
;1287:			break;
ADDRGP4 $388
JUMPV
LABELV $508
line 1289
;1288:		case BOTH_FORCE_GETUP_B3:
;1289:			if ( self->client->ps.legsTimer < 150 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 150
GEI4 $509
line 1290
;1290:			{//standing up
line 1291
;1291:			}
ADDRGP4 $388
JUMPV
LABELV $509
line 1292
;1292:			else if ( self->client->ps.legsTimer < 775 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 775
GEI4 $511
line 1293
;1293:			{//flipping
line 1294
;1294:				deathAnim = BOTH_DEATHBACKWARD2; //backflip
ADDRLP4 0
CNSTI4 30
ASGNI4
line 1295
;1295:			}
ADDRGP4 $388
JUMPV
LABELV $511
line 1297
;1296:			else
;1297:			{//lying down
line 1299
;1298:				//partially up
;1299:				deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1300
;1300:			}
line 1301
;1301:			break;
ADDRGP4 $388
JUMPV
LABELV $513
line 1303
;1302:		case BOTH_FORCE_GETUP_B4:
;1303:			if ( self->client->ps.legsTimer < 325 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 325
GEI4 $514
line 1304
;1304:			{//standing up
line 1305
;1305:			}
ADDRGP4 $388
JUMPV
LABELV $514
line 1307
;1306:			else
;1307:			{//lying down
line 1308
;1308:				if ( animLength - self->client->ps.legsTimer > 150 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 150
LEI4 $516
line 1309
;1309:				{//partially up
line 1310
;1310:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1311
;1311:				}
ADDRGP4 $388
JUMPV
LABELV $516
line 1313
;1312:				else
;1313:				{//down
line 1314
;1314:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1315
;1315:				}
line 1316
;1316:			}
line 1317
;1317:			break;
ADDRGP4 $388
JUMPV
LABELV $518
line 1319
;1318:		case BOTH_FORCE_GETUP_B5:
;1319:			if ( self->client->ps.legsTimer < 550 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 550
GEI4 $519
line 1320
;1320:			{//standing up
line 1321
;1321:			}
ADDRGP4 $388
JUMPV
LABELV $519
line 1322
;1322:			else if ( self->client->ps.legsTimer < 1025 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1025
GEI4 $521
line 1323
;1323:			{//kicking up
line 1324
;1324:				deathAnim = BOTH_DEATHBACKWARD2; //backflip
ADDRLP4 0
CNSTI4 30
ASGNI4
line 1325
;1325:			}
ADDRGP4 $388
JUMPV
LABELV $521
line 1327
;1326:			else
;1327:			{//lying down
line 1328
;1328:				if ( animLength - self->client->ps.legsTimer > 50 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 50
LEI4 $523
line 1329
;1329:				{//partially up
line 1330
;1330:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1331
;1331:				}
ADDRGP4 $388
JUMPV
LABELV $523
line 1333
;1332:				else
;1333:				{//down
line 1334
;1334:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1335
;1335:				}
line 1336
;1336:			}
line 1337
;1337:			break;
ADDRGP4 $388
JUMPV
LABELV $525
line 1339
;1338:		case BOTH_FORCE_GETUP_B6:
;1339:			if ( self->client->ps.legsTimer < 225 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 225
GEI4 $526
line 1340
;1340:			{//standing up
line 1341
;1341:			}
ADDRGP4 $388
JUMPV
LABELV $526
line 1342
;1342:			else if ( self->client->ps.legsTimer < 425 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 425
GEI4 $528
line 1343
;1343:			{//crouching up
line 1345
;1344:				vec3_t fwd;
;1345:				float thrown = 0;
ADDRLP4 40
CNSTF4 0
ASGNF4
line 1347
;1346:
;1347:				AngleVectors( self->client->ps.viewangles, fwd, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 44
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
line 1348
;1348:				thrown = DotProduct( fwd, self->client->ps.velocity );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 60
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1350
;1349:
;1350:				if ( thrown < -150 )
ADDRLP4 40
INDIRF4
CNSTF4 3272998912
GEF4 $532
line 1351
;1351:				{
line 1352
;1352:					deathAnim = BOTH_DEATHBACKWARD1;	//# Death anim when crouched and thrown back
ADDRLP4 0
CNSTI4 29
ASGNI4
line 1353
;1353:				}
ADDRGP4 $388
JUMPV
LABELV $532
line 1355
;1354:				else
;1355:				{
line 1356
;1356:					deathAnim = BOTH_DEATH_CROUCHED;	//# Death anim when crouched
ADDRLP4 0
CNSTI4 46
ASGNI4
line 1357
;1357:				}
line 1358
;1358:			}
ADDRGP4 $388
JUMPV
LABELV $528
line 1359
;1359:			else if ( self->client->ps.legsTimer < 825 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 825
GEI4 $534
line 1360
;1360:			{//flipping up
line 1361
;1361:				deathAnim = BOTH_DEATHFORWARD3; //backflip
ADDRLP4 0
CNSTI4 28
ASGNI4
line 1362
;1362:			}
ADDRGP4 $388
JUMPV
LABELV $534
line 1364
;1363:			else
;1364:			{//lying down
line 1365
;1365:				if ( animLength - self->client->ps.legsTimer > 225 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 225
LEI4 $536
line 1366
;1366:				{//partially up
line 1367
;1367:					deathAnim = BOTH_DEATH_FALLING_UP;
ADDRLP4 0
CNSTI4 45
ASGNI4
line 1368
;1368:				}
ADDRGP4 $388
JUMPV
LABELV $536
line 1370
;1369:				else
;1370:				{//down
line 1371
;1371:					deathAnim = BOTH_DEATH_LYING_UP;
ADDRLP4 0
CNSTI4 42
ASGNI4
line 1372
;1372:				}
line 1373
;1373:			}
line 1374
;1374:			break;
ADDRGP4 $388
JUMPV
LABELV $538
line 1376
;1375:		case BOTH_FORCE_GETUP_F1:
;1376:			if ( self->client->ps.legsTimer < 275 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 275
GEI4 $539
line 1377
;1377:			{//standing up
line 1378
;1378:			}
ADDRGP4 $388
JUMPV
LABELV $539
line 1379
;1379:			else if ( self->client->ps.legsTimer < 750 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 750
GEI4 $541
line 1380
;1380:			{//flipping
line 1381
;1381:				deathAnim = BOTH_DEATH14;
ADDRLP4 0
CNSTI4 14
ASGNI4
line 1382
;1382:			}
ADDRGP4 $388
JUMPV
LABELV $541
line 1384
;1383:			else
;1384:			{//lying down
line 1385
;1385:				if ( animLength - self->client->ps.legsTimer > 100 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 100
LEI4 $543
line 1386
;1386:				{//partially up
line 1387
;1387:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 1388
;1388:				}
ADDRGP4 $388
JUMPV
LABELV $543
line 1390
;1389:				else
;1390:				{//down
line 1391
;1391:					deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 1392
;1392:				}
line 1393
;1393:			}
line 1394
;1394:			break;
ADDRGP4 $388
JUMPV
LABELV $545
line 1396
;1395:		case BOTH_FORCE_GETUP_F2:
;1396:			if ( self->client->ps.legsTimer < 1200 )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1200
GEI4 $546
line 1397
;1397:			{//standing
line 1398
;1398:			}
ADDRGP4 $388
JUMPV
LABELV $546
line 1400
;1399:			else
;1400:			{//lying down
line 1401
;1401:				if ( animLength - self->client->ps.legsTimer > 225 )
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
SUBI4
CNSTI4 225
LEI4 $548
line 1402
;1402:				{//partially up
line 1403
;1403:					deathAnim = BOTH_DEATH_FALLING_DN;
ADDRLP4 0
CNSTI4 44
ASGNI4
line 1404
;1404:				}
ADDRGP4 $388
JUMPV
LABELV $548
line 1406
;1405:				else
;1406:				{//down
line 1407
;1407:					deathAnim = BOTH_DEATH_LYING_DN;
ADDRLP4 0
CNSTI4 43
ASGNI4
line 1408
;1408:				}
line 1409
;1409:			}
line 1410
;1410:			break;
LABELV $387
LABELV $388
line 1412
;1411:		}
;1412:	}
LABELV $383
LABELV $382
LABELV $380
line 1414
;1413:
;1414:	return deathAnim;
ADDRLP4 0
INDIRI4
RETI4
LABELV $378
endproc G_CheckSpecialDeathAnim 64 16
export G_PickDeathAnim
proc G_PickDeathAnim 128 20
line 1418
;1415:}
;1416:
;1417:int G_PickDeathAnim( gentity_t *self, vec3_t point, int damage, int mod, int hitLoc )
;1418:{//FIXME: play dead flop anims on body if in an appropriate _DEAD anim when this func is called
line 1419
;1419:	int deathAnim = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1421
;1420:	int max_health;
;1421:	int legAnim = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1424
;1422:	vec3_t objVelocity;
;1423:
;1424:	if (!self || !self->client)
ADDRLP4 24
ADDRFP4 0
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
EQU4 $555
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
NEU4 $553
LABELV $555
line 1425
;1425:	{
line 1426
;1426:		if (!self || self->s.eType != ET_GRAPPLE)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $558
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
EQI4 $556
LABELV $558
line 1427
;1427:		{ //g2animent
line 1428
;1428:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $552
JUMPV
LABELV $556
line 1430
;1429:		}
;1430:	}
LABELV $553
line 1432
;1431:
;1432:	if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $559
line 1433
;1433:	{
line 1434
;1434:		max_health = self->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1435
;1435:	}
ADDRGP4 $560
JUMPV
LABELV $559
line 1437
;1436:	else
;1437:	{
line 1438
;1438:		max_health = 60;
ADDRLP4 8
CNSTI4 60
ASGNI4
line 1439
;1439:	}
LABELV $560
line 1441
;1440:
;1441:	if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $561
line 1442
;1442:	{
line 1443
;1443:		VectorCopy(self->client->ps.velocity, objVelocity);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 1444
;1444:	}
ADDRGP4 $562
JUMPV
LABELV $561
line 1446
;1445:	else
;1446:	{
line 1447
;1447:		VectorCopy(self->s.pos.trDelta, objVelocity);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1448
;1448:	}
LABELV $562
line 1450
;1449:
;1450:	if ( hitLoc == HL_NONE )
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $563
line 1451
;1451:	{
line 1452
;1452:		hitLoc = G_GetHitLocation( self, point );//self->hitLoc
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 G_GetHitLocation
CALLI4
ASGNI4
ADDRFP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 1453
;1453:	}
LABELV $563
line 1455
;1454:
;1455:	if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $565
line 1456
;1456:	{
line 1457
;1457:		legAnim = self->client->ps.legsAnim;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
line 1458
;1458:	}
ADDRGP4 $566
JUMPV
LABELV $565
line 1460
;1459:	else
;1460:	{
line 1461
;1461:		legAnim = self->s.legsAnim;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ASGNI4
line 1462
;1462:	}
LABELV $566
line 1464
;1463:
;1464:	if (gGAvoidDismember)
ADDRGP4 gGAvoidDismember
INDIRI4
CNSTI4 0
EQI4 $567
line 1465
;1465:	{
line 1466
;1466:		return BOTH_RIGHTHANDCHOPPEDOFF;
CNSTI4 952
RETI4
ADDRGP4 $552
JUMPV
LABELV $567
line 1470
;1467:	}
;1468:
;1469:	//dead flops
;1470:	switch( legAnim&~ANIM_TOGGLEBIT )
ADDRLP4 32
ADDRLP4 4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 1
LTI4 $569
ADDRLP4 32
INDIRI4
CNSTI4 79
GTI4 $569
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $576-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $576
address $572
address $572
address $575
address $575
address $575
address $575
address $575
address $572
address $575
address $573
address $575
address $575
address $572
address $572
address $573
address $572
address $575
address $575
address $575
address $569
address $569
address $569
address $569
address $569
address $569
address $575
address $575
address $569
address $575
address $575
address $575
address $575
address $575
address $575
address $575
address $575
address $569
address $569
address $569
address $569
address $569
address $569
address $569
address $569
address $569
address $569
address $572
address $572
address $575
address $575
address $575
address $575
address $575
address $572
address $575
address $573
address $575
address $575
address $572
address $572
address $573
address $572
address $575
address $575
address $575
address $569
address $569
address $569
address $569
address $569
address $569
address $573
address $573
address $572
address $572
address $575
address $575
address $575
address $574
code
line 1471
;1471:	{
LABELV $572
line 1486
;1472:	case BOTH_DEATH1:		//# First Death anim
;1473:	case BOTH_DEAD1:
;1474:	case BOTH_DEATH2:			//# Second Death anim
;1475:	case BOTH_DEAD2:
;1476:	case BOTH_DEATH8:			//# 
;1477:	case BOTH_DEAD8:
;1478:	case BOTH_DEATH13:			//# 
;1479:	case BOTH_DEAD13:
;1480:	case BOTH_DEATH14:			//# 
;1481:	case BOTH_DEAD14:
;1482:	case BOTH_DEATH16:			//# 
;1483:	case BOTH_DEAD16:
;1484:	case BOTH_DEADBACKWARD1:		//# First thrown backward death finished pose
;1485:	case BOTH_DEADBACKWARD2:		//# Second thrown backward death finished pose
;1486:		deathAnim = -2;
ADDRLP4 0
CNSTI4 -2
ASGNI4
LABELV $573
line 1507
;1487:		/*
;1488:		if ( PM_FinishedCurrentLegsAnim( self ) )
;1489:		{//done with the anim
;1490:			deathAnim = BOTH_DEADFLOP2;
;1491:		}
;1492:		else
;1493:		{
;1494:			deathAnim = -2;
;1495:		}
;1496:		break;
;1497:	case BOTH_DEADFLOP2:
;1498:		deathAnim = BOTH_DEADFLOP2;
;1499:		break;
;1500:		*/
;1501:	case BOTH_DEATH10:			//# 
;1502:	case BOTH_DEAD10:
;1503:	case BOTH_DEATH15:			//# 
;1504:	case BOTH_DEAD15:
;1505:	case BOTH_DEADFORWARD1:		//# First thrown forward death finished pose
;1506:	case BOTH_DEADFORWARD2:		//# Second thrown forward death finished pose
;1507:		deathAnim = -2;
ADDRLP4 0
CNSTI4 -2
ASGNI4
LABELV $574
line 1520
;1508:		/*
;1509:		if ( PM_FinishedCurrentLegsAnim( self ) )
;1510:		{//done with the anim
;1511:			deathAnim = BOTH_DEADFLOP1;
;1512:		}
;1513:		else
;1514:		{
;1515:			deathAnim = -2;
;1516:		}
;1517:		break;
;1518:		*/
;1519:	case BOTH_DEADFLOP1:
;1520:		deathAnim = -2;
ADDRLP4 0
CNSTI4 -2
ASGNI4
line 1522
;1521:		//deathAnim = BOTH_DEADFLOP1;
;1522:		break;
ADDRGP4 $570
JUMPV
LABELV $575
line 1558
;1523:	case BOTH_DEAD3:				//# Third Death finished pose
;1524:	case BOTH_DEAD4:				//# Fourth Death finished pose
;1525:	case BOTH_DEAD5:				//# Fifth Death finished pose
;1526:	case BOTH_DEAD6:				//# Sixth Death finished pose
;1527:	case BOTH_DEAD7:				//# Seventh Death finished pose
;1528:	case BOTH_DEAD9:				//# 
;1529:	case BOTH_DEAD11:			//#
;1530:	case BOTH_DEAD12:			//# 
;1531:	case BOTH_DEAD17:			//# 
;1532:	case BOTH_DEAD18:			//# 
;1533:	case BOTH_DEAD19:			//# 
;1534:	case BOTH_LYINGDEAD1:		//# Killed lying down death finished pose
;1535:	case BOTH_STUMBLEDEAD1:		//# Stumble forward death finished pose
;1536:	case BOTH_FALLDEAD1LAND:		//# Fall forward and splat death finished pose
;1537:	case BOTH_DEATH3:			//# Third Death anim
;1538:	case BOTH_DEATH4:			//# Fourth Death anim
;1539:	case BOTH_DEATH5:			//# Fifth Death anim
;1540:	case BOTH_DEATH6:			//# Sixth Death anim
;1541:	case BOTH_DEATH7:			//# Seventh Death anim
;1542:	case BOTH_DEATH9:			//# 
;1543:	case BOTH_DEATH11:			//#
;1544:	case BOTH_DEATH12:			//# 
;1545:	case BOTH_DEATH17:			//# 
;1546:	case BOTH_DEATH18:			//# 
;1547:	case BOTH_DEATH19:			//# 
;1548:	case BOTH_DEATHFORWARD1:		//# First Death in which they get thrown forward
;1549:	case BOTH_DEATHFORWARD2:		//# Second Death in which they get thrown forward
;1550:	case BOTH_DEATHBACKWARD1:	//# First Death in which they get thrown backward
;1551:	case BOTH_DEATHBACKWARD2:	//# Second Death in which they get thrown backward
;1552:	case BOTH_DEATH1IDLE:		//# Idle while close to death
;1553:	case BOTH_LYINGDEATH1:		//# Death to play when killed lying down
;1554:	case BOTH_STUMBLEDEATH1:		//# Stumble forward and fall face first death
;1555:	case BOTH_FALLDEATH1:		//# Fall forward off a high cliff and splat death - start
;1556:	case BOTH_FALLDEATH1INAIR:	//# Fall forward off a high cliff and splat death - loop
;1557:	case BOTH_FALLDEATH1LAND:	//# Fall forward off a high cliff and splat death - hit bottom
;1558:		deathAnim = -2;
ADDRLP4 0
CNSTI4 -2
ASGNI4
line 1559
;1559:		break;
LABELV $569
LABELV $570
line 1561
;1560:	}
;1561:	if ( deathAnim == -1 )
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $578
line 1562
;1562:	{
line 1563
;1563:		if (self->client && jk2gameplay == VERSION_1_04)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $580
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $580
line 1564
;1564:		{
line 1565
;1565:			deathAnim = G_CheckSpecialDeathAnim( self, point, damage, mod, hitLoc );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 G_CheckSpecialDeathAnim
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 40
INDIRI4
ASGNI4
line 1566
;1566:		}
LABELV $580
line 1568
;1567:
;1568:		if (deathAnim == -1)
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $582
line 1569
;1569:		{
line 1571
;1570:			//death anims
;1571:			switch( hitLoc )
ADDRLP4 40
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
LTI4 $585
ADDRLP4 40
INDIRI4
CNSTI4 16
GTI4 $585
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $655-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $655
address $586
address $586
address $593
address $598
address $640
address $610
address $625
address $603
address $610
address $625
address $640
address $610
address $625
address $610
address $625
address $652
code
line 1572
;1572:			{
LABELV $586
line 1575
;1573:			case HL_FOOT_RT:
;1574:			case HL_FOOT_LT:
;1575:				if ( mod == MOD_SABER && !Q_irand( 0, 2 + gRandomUnlockAdd, qfalse,1 ) )
ADDRFP4 12
INDIRI4
CNSTI4 3
NEI4 $587
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 48
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $587
line 1576
;1576:				{
line 1577
;1577:					return BOTH_DEATH10;//chest: back flip
CNSTI4 10
RETI4
ADDRGP4 $552
JUMPV
LABELV $587
line 1579
;1578:				}
;1579:				else if ( !Q_irand( 0, 2 + gRandomUnlockAdd,qfalse,1 ) )
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 56
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $589
line 1580
;1580:				{
line 1581
;1581:					deathAnim = BOTH_DEATH4;//back: forward
ADDRLP4 0
CNSTI4 4
ASGNI4
line 1582
;1582:				}
ADDRGP4 $585
JUMPV
LABELV $589
line 1583
;1583:				else if ( !Q_irand( 0, 1 + gRandomUnlockAdd, qfalse, 0 ) )
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $591
line 1584
;1584:				{
line 1585
;1585:					deathAnim = BOTH_DEATH5;//same as 4
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1586
;1586:				}
ADDRGP4 $585
JUMPV
LABELV $591
line 1588
;1587:				else
;1588:				{
line 1589
;1589:					deathAnim = BOTH_DEATH15;//back: forward
ADDRLP4 0
CNSTI4 15
ASGNI4
line 1590
;1590:				}
line 1591
;1591:				break;
ADDRGP4 $585
JUMPV
LABELV $593
line 1593
;1592:			case HL_LEG_RT:
;1593:				if ( !Q_irand( 0, 2 + gRandomUnlockAdd,qfalse,1 ) )
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 72
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $594
line 1594
;1594:				{
line 1595
;1595:					deathAnim = BOTH_DEATH4;//back: forward
ADDRLP4 0
CNSTI4 4
ASGNI4
line 1596
;1596:				}
ADDRGP4 $585
JUMPV
LABELV $594
line 1597
;1597:				else if ( !Q_irand( 0, 1 + gRandomUnlockAdd, qfalse, 0 ) ) // doesnt this q_irand always return 0?
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $596
line 1598
;1598:				{
line 1599
;1599:					deathAnim = BOTH_DEATH5;//same as 4
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1600
;1600:				}
ADDRGP4 $585
JUMPV
LABELV $596
line 1602
;1601:				else
;1602:				{
line 1603
;1603:					deathAnim = BOTH_DEATH15;//back: forward
ADDRLP4 0
CNSTI4 15
ASGNI4
line 1604
;1604:				}
line 1605
;1605:				break;
ADDRGP4 $585
JUMPV
LABELV $598
line 1607
;1606:			case HL_LEG_LT:
;1607:				if ( !Q_irand( 0, 2 + gRandomUnlockAdd, qfalse, 1) )
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 84
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 88
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $599
line 1608
;1608:				{
line 1609
;1609:					deathAnim = BOTH_DEATH4;//back: forward
ADDRLP4 0
CNSTI4 4
ASGNI4
line 1610
;1610:				}
ADDRGP4 $585
JUMPV
LABELV $599
line 1611
;1611:				else if ( !Q_irand( 0, 1 + gRandomUnlockAdd, qfalse, 0) )
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRLP4 92
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 92
INDIRI4
ARGI4
ADDRLP4 92
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $601
line 1612
;1612:				{
line 1613
;1613:					deathAnim = BOTH_DEATH5;//same as 4
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1614
;1614:				}
ADDRGP4 $585
JUMPV
LABELV $601
line 1616
;1615:				else
;1616:				{
line 1617
;1617:					deathAnim = BOTH_DEATH15;//back: forward
ADDRLP4 0
CNSTI4 15
ASGNI4
line 1618
;1618:				}
line 1619
;1619:				break;
ADDRGP4 $585
JUMPV
LABELV $603
line 1621
;1620:			case HL_BACK:
;1621:				if ( !VectorLengthSquared( objVelocity ) )
ADDRLP4 12
ARGP4
ADDRLP4 100
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 100
INDIRF4
CNSTF4 0
NEF4 $604
line 1622
;1622:				{
line 1623
;1623:					deathAnim = BOTH_DEATH17;//head/back: croak
ADDRLP4 0
CNSTI4 17
ASGNI4
line 1624
;1624:				}
ADDRGP4 $585
JUMPV
LABELV $604
line 1626
;1625:				else
;1626:				{
line 1627
;1627:					if ( !Q_irand( 0, 2 + gRandomUnlockAdd, qfalse, 1) )
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 108
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $606
line 1628
;1628:					{
line 1629
;1629:						deathAnim = BOTH_DEATH4;//back: forward
ADDRLP4 0
CNSTI4 4
ASGNI4
line 1630
;1630:					}
ADDRGP4 $585
JUMPV
LABELV $606
line 1631
;1631:					else if ( !Q_irand( 0, 1 + gRandomUnlockAdd, qfalse, 0) )
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $608
line 1632
;1632:					{
line 1633
;1633:						deathAnim = BOTH_DEATH5;//same as 4
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1634
;1634:					}
ADDRGP4 $585
JUMPV
LABELV $608
line 1636
;1635:					else
;1636:					{
line 1637
;1637:						deathAnim = BOTH_DEATH15;//back: forward
ADDRLP4 0
CNSTI4 15
ASGNI4
line 1638
;1638:					}
line 1639
;1639:				}
line 1640
;1640:				break;
ADDRGP4 $585
JUMPV
LABELV $610
line 1645
;1641:			case HL_CHEST_RT:
;1642:			case HL_ARM_RT:
;1643:			case HL_HAND_RT:
;1644:			case HL_BACK_RT:
;1645:				if ( damage <= max_health*0.25 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1048576000
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $611
line 1646
;1646:				{
line 1647
;1647:					deathAnim = BOTH_DEATH9;//chest right: snap, fall forward
ADDRLP4 0
CNSTI4 9
ASGNI4
line 1648
;1648:				}
ADDRGP4 $585
JUMPV
LABELV $611
line 1649
;1649:				else if ( damage <= max_health*0.5 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $613
line 1650
;1650:				{
line 1651
;1651:					deathAnim = BOTH_DEATH3;//chest right: back
ADDRLP4 0
CNSTI4 3
ASGNI4
line 1652
;1652:				}
ADDRGP4 $585
JUMPV
LABELV $613
line 1653
;1653:				else if ( damage <= max_health*0.75 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1061158912
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $615
line 1654
;1654:				{
line 1655
;1655:					deathAnim = BOTH_DEATH6;//chest right: spin
ADDRLP4 0
CNSTI4 6
ASGNI4
line 1656
;1656:				}
ADDRGP4 $585
JUMPV
LABELV $615
line 1658
;1657:				else 
;1658:				{
line 1660
;1659:					//TEMP HACK: play spinny deaths less often
;1660:					if ( Q_irand( 0, 1 + gRandomUnlockAdd, qfalse, 0) )
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $617
line 1661
;1661:					{
line 1662
;1662:						deathAnim = BOTH_DEATH8;//chest right: spin high
ADDRLP4 0
CNSTI4 8
ASGNI4
line 1663
;1663:					}
ADDRGP4 $585
JUMPV
LABELV $617
line 1665
;1664:					else
;1665:					{
line 1666
;1666:						switch ( Q_irand( 0, 2 + gRandomUnlockAdd, qfalse, 1) )
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRLP4 116
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 116
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 120
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 112
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $622
ADDRLP4 112
INDIRI4
CNSTI4 1
EQI4 $623
ADDRLP4 112
INDIRI4
CNSTI4 2
EQI4 $624
ADDRGP4 $619
JUMPV
line 1667
;1667:						{
LABELV $619
LABELV $622
line 1670
;1668:						default:
;1669:						case 0:
;1670:							deathAnim = BOTH_DEATH9;//chest right: snap, fall forward
ADDRLP4 0
CNSTI4 9
ASGNI4
line 1671
;1671:							break;
ADDRGP4 $585
JUMPV
LABELV $623
line 1673
;1672:						case 1:
;1673:							deathAnim = BOTH_DEATH3;//chest right: back
ADDRLP4 0
CNSTI4 3
ASGNI4
line 1674
;1674:							break;
ADDRGP4 $585
JUMPV
LABELV $624
line 1676
;1675:						case 2:
;1676:							deathAnim = BOTH_DEATH6;//chest right: spin
ADDRLP4 0
CNSTI4 6
ASGNI4
line 1677
;1677:							break;
line 1679
;1678:						}
;1679:					}
line 1680
;1680:				}
line 1681
;1681:				break;
ADDRGP4 $585
JUMPV
LABELV $625
line 1686
;1682:			case HL_CHEST_LT:
;1683:			case HL_ARM_LT:
;1684:			case HL_HAND_LT:
;1685:			case HL_BACK_LT:
;1686:				if ( damage <= max_health*0.25 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1048576000
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $626
line 1687
;1687:				{
line 1688
;1688:					deathAnim = BOTH_DEATH11;//chest left: snap, fall forward
ADDRLP4 0
CNSTI4 11
ASGNI4
line 1689
;1689:				}
ADDRGP4 $585
JUMPV
LABELV $626
line 1690
;1690:				else if ( damage <= max_health*0.5 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $628
line 1691
;1691:				{
line 1692
;1692:					deathAnim = BOTH_DEATH7;//chest left: back
ADDRLP4 0
CNSTI4 7
ASGNI4
line 1693
;1693:				}
ADDRGP4 $585
JUMPV
LABELV $628
line 1694
;1694:				else if ( damage <= max_health*0.75 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1061158912
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $630
line 1695
;1695:				{
line 1696
;1696:					deathAnim = BOTH_DEATH12;//chest left: spin
ADDRLP4 0
CNSTI4 12
ASGNI4
line 1697
;1697:				}
ADDRGP4 $585
JUMPV
LABELV $630
line 1699
;1698:				else
;1699:				{
line 1701
;1700:					//TEMP HACK: play spinny deaths less often
;1701:					if ( Q_irand( 0, 1 + gRandomUnlockAdd, qfalse, 0) )
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $632
line 1702
;1702:					{
line 1703
;1703:						deathAnim = BOTH_DEATH14;//chest left: spin high
ADDRLP4 0
CNSTI4 14
ASGNI4
line 1704
;1704:					}
ADDRGP4 $585
JUMPV
LABELV $632
line 1706
;1705:					else
;1706:					{
line 1707
;1707:						switch ( Q_irand( 0, 2 + gRandomUnlockAdd, qfalse, 1) )
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRLP4 116
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 116
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 120
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 112
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $637
ADDRLP4 112
INDIRI4
CNSTI4 1
EQI4 $638
ADDRLP4 112
INDIRI4
CNSTI4 2
EQI4 $639
ADDRGP4 $634
JUMPV
line 1708
;1708:						{
LABELV $634
LABELV $637
line 1711
;1709:						default:
;1710:						case 0:
;1711:							deathAnim = BOTH_DEATH11;//chest left: snap, fall forward
ADDRLP4 0
CNSTI4 11
ASGNI4
line 1712
;1712:							break;
ADDRGP4 $585
JUMPV
LABELV $638
line 1714
;1713:						case 1:
;1714:							deathAnim = BOTH_DEATH7;//chest left: back
ADDRLP4 0
CNSTI4 7
ASGNI4
line 1715
;1715:							break;
ADDRGP4 $585
JUMPV
LABELV $639
line 1717
;1716:						case 2:
;1717:							deathAnim = BOTH_DEATH12;//chest left: spin
ADDRLP4 0
CNSTI4 12
ASGNI4
line 1718
;1718:							break;
line 1720
;1719:						}
;1720:					}
line 1721
;1721:				}
line 1722
;1722:				break;
ADDRGP4 $585
JUMPV
LABELV $640
line 1725
;1723:			case HL_CHEST:
;1724:			case HL_WAIST:
;1725:				if ( damage <= max_health*0.25 || !VectorLengthSquared( objVelocity ) )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1048576000
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
LEF4 $643
ADDRLP4 12
ARGP4
ADDRLP4 104
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 104
INDIRF4
CNSTF4 0
NEF4 $641
LABELV $643
line 1726
;1726:				{
line 1727
;1727:					if ( !Q_irand( 0, 1 + gRandomUnlockAdd, qfalse, 0) )
ADDRLP4 108
CNSTI4 0
ASGNI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $644
line 1728
;1728:					{
line 1729
;1729:						deathAnim = BOTH_DEATH18;//gut: fall right
ADDRLP4 0
CNSTI4 18
ASGNI4
line 1730
;1730:					}
ADDRGP4 $585
JUMPV
LABELV $644
line 1732
;1731:					else
;1732:					{
line 1733
;1733:						deathAnim = BOTH_DEATH19;//gut: fall left
ADDRLP4 0
CNSTI4 19
ASGNI4
line 1734
;1734:					}
line 1735
;1735:				}
ADDRGP4 $585
JUMPV
LABELV $641
line 1736
;1736:				else if ( damage <= max_health*0.5 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $646
line 1737
;1737:				{
line 1738
;1738:					deathAnim = BOTH_DEATH2;//chest: backward short
ADDRLP4 0
CNSTI4 2
ASGNI4
line 1739
;1739:				}
ADDRGP4 $585
JUMPV
LABELV $646
line 1740
;1740:				else if ( damage <= max_health*0.75 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1061158912
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $648
line 1741
;1741:				{
line 1742
;1742:					if ( !Q_irand( 0, 1 + gRandomUnlockAdd, qfalse, 0) )
ADDRLP4 108
CNSTI4 0
ASGNI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $650
line 1743
;1743:					{
line 1744
;1744:						deathAnim = BOTH_DEATH1;//chest: backward med
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1745
;1745:					}
ADDRGP4 $585
JUMPV
LABELV $650
line 1747
;1746:					else
;1747:					{
line 1748
;1748:						deathAnim = BOTH_DEATH16;//same as 1
ADDRLP4 0
CNSTI4 16
ASGNI4
line 1749
;1749:					}
line 1750
;1750:				}
ADDRGP4 $585
JUMPV
LABELV $648
line 1752
;1751:				else
;1752:				{
line 1753
;1753:					deathAnim = BOTH_DEATH10;//chest: back flip
ADDRLP4 0
CNSTI4 10
ASGNI4
line 1754
;1754:				}
line 1755
;1755:				break;
ADDRGP4 $585
JUMPV
LABELV $652
line 1757
;1756:			case HL_HEAD:
;1757:				if ( damage <= max_health*0.5 )
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
GTF4 $653
line 1758
;1758:				{
line 1759
;1759:					deathAnim = BOTH_DEATH17;//head/back: croak
ADDRLP4 0
CNSTI4 17
ASGNI4
line 1760
;1760:				}
ADDRGP4 $585
JUMPV
LABELV $653
line 1762
;1761:				else
;1762:				{
line 1763
;1763:					deathAnim = BOTH_DEATH13;//head: stumble, fall back
ADDRLP4 0
CNSTI4 13
ASGNI4
line 1764
;1764:				}
line 1765
;1765:				break;
line 1767
;1766:			default:
;1767:				break;
LABELV $585
line 1769
;1768:			}
;1769:		}
LABELV $582
line 1770
;1770:	}
LABELV $578
line 1771
;1771:	return deathAnim;
ADDRLP4 0
INDIRI4
RETI4
LABELV $552
endproc G_PickDeathAnim 128 20
export G_GetJediMaster
proc G_GetJediMaster 24 0
line 1775
;1772:}
;1773:
;1774:gentity_t *G_GetJediMaster(void)
;1775:{
line 1776
;1776:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $659
JUMPV
LABELV $658
line 1780
;1777:	gentity_t *ent;
;1778:
;1779:	while (i < MAX_CLIENTS)
;1780:	{
line 1781
;1781:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1783
;1782:
;1783:		if (ent && ent->inuse && ent->client && ent->client->ps.isJediMaster)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $661
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $661
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
ADDRLP4 12
INDIRU4
EQU4 $661
ADDRLP4 20
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $661
line 1784
;1784:		{
line 1785
;1785:			return ent;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $657
JUMPV
LABELV $661
line 1788
;1786:		}
;1787:
;1788:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1789
;1789:	}
LABELV $659
line 1779
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $658
line 1791
;1790:
;1791:	return NULL;
CNSTP4 0
RETP4
LABELV $657
endproc G_GetJediMaster 24 0
bss
align 4
LABELV $904
skip 4
export player_die
code
proc player_die 252 28
line 1803
;1792:}
;1793:
;1794:/*
;1795:==================
;1796:player_die
;1797:==================
;1798:*/
;1799:extern stringID_table_t animTable[MAX_ANIMATIONS+1];
;1800:extern void DF_SegmentedRunStatusInvalidated(gentity_t* ent);
;1801:extern void DF_RaceStateInvalidated(gentity_t* ent, qboolean print);
;1802:gentity_t* PrintCTFMessage(int plIndex, int teamIndex, int ctfMessage);
;1803:void player_die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int meansOfDeath ) {
line 1810
;1804:	gentity_t	*ent;
;1805:	int			anim;
;1806:	int			contents;
;1807:	int			killer;
;1808:	int			i;
;1809:	char		*killerName, *obit;
;1810:	qboolean	wasJediMaster = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1811
;1811:	int			nowTime = LEVELTIME(self->client);
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
EQU4 $668
ADDRLP4 44
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $668
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $670
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
ADDRGP4 $671
JUMPV
LABELV $670
ADDRLP4 40
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $671
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
ADDRGP4 $669
JUMPV
LABELV $668
ADDRLP4 36
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $669
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 1813
;1812:
;1813:	if ( !self || !self->client ) return;
ADDRLP4 48
ADDRFP4 0
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
EQU4 $674
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
NEU4 $672
LABELV $674
ADDRGP4 $663
JUMPV
LABELV $672
line 1815
;1814:
;1815:	if ( self->client->ps.pm_type == PM_DEAD ) {
ADDRLP4 56
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $675
line 1816
;1816:		return;
ADDRGP4 $663
JUMPV
LABELV $675
line 1819
;1817:	}
;1818:
;1819:	if ( level.intermissiontime ) {
ADDRGP4 level+9028
INDIRI4
CNSTI4 0
EQI4 $677
line 1820
;1820:		return;
ADDRGP4 $663
JUMPV
LABELV $677
line 1823
;1821:	}
;1822:
;1823:	if (DF_ClientInSegmentedRunMode(self->client) && self->client->pers.segmented.state >= SEG_RECORDING_HAVELASTPOS && meansOfDeath != MOD_SUICIDE) { // /kill, /team, /race always ends segmented run
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 DF_ClientInSegmentedRunMode
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $680
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 22084
ADDP4
INDIRI4
CNSTI4 2
LTI4 $680
ADDRFP4 16
INDIRI4
CNSTI4 35
EQI4 $680
line 1824
;1824:		DF_SegmentedRunStatusInvalidated(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DF_SegmentedRunStatusInvalidated
CALLV
pop
line 1825
;1825:	}
ADDRGP4 $681
JUMPV
LABELV $680
line 1826
;1826:	else {
line 1827
;1827:		DF_RaceStateInvalidated(self, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 DF_RaceStateInvalidated
CALLV
pop
line 1828
;1828:	}
LABELV $681
line 1830
;1829:
;1830:	if (g_slowmoDuelEnd.integer && g_gametype.integer == GT_TOURNAMENT && attacker && attacker->inuse && attacker->client)
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 g_slowmoDuelEnd+12
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $682
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $682
ADDRLP4 68
ADDRFP4 8
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
EQU4 $682
ADDRLP4 68
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $682
ADDRLP4 68
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $682
line 1831
;1831:	{
line 1832
;1832:		if (!gDoSlowMoDuel)
ADDRGP4 gDoSlowMoDuel
INDIRI4
CNSTI4 0
NEI4 $686
line 1833
;1833:		{
line 1834
;1834:			gDoSlowMoDuel = qtrue;
ADDRGP4 gDoSlowMoDuel
CNSTI4 1
ASGNI4
line 1835
;1835:			gSlowMoDuelTime = level.time;
ADDRGP4 gSlowMoDuelTime
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1836
;1836:		}
LABELV $686
line 1837
;1837:	}
LABELV $682
line 1839
;1838:
;1839:	if (inflictor && inflictor->activator && !inflictor->client && !attacker->client &&
ADDRLP4 76
ADDRFP4 4
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
EQU4 $689
ADDRLP4 84
ADDRLP4 76
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $689
ADDRLP4 88
CNSTI4 408
ASGNI4
ADDRLP4 76
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
NEU4 $689
ADDRFP4 8
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
NEU4 $689
ADDRLP4 84
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $689
ADDRLP4 84
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $689
ADDRLP4 76
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 15
NEI4 $689
line 1842
;1840:		inflictor->activator->client && inflictor->activator->inuse &&
;1841:		inflictor->s.weapon == WP_TURRET)
;1842:	{
line 1843
;1843:		attacker = inflictor->activator;
ADDRFP4 8
ADDRFP4 4
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
ASGNP4
line 1844
;1844:	}
LABELV $689
line 1846
;1845:
;1846:	if (self->client && self->client->ps.isJediMaster)
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $691
ADDRLP4 92
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $691
line 1847
;1847:	{
line 1848
;1848:		wasJediMaster = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 1849
;1849:	}
LABELV $691
line 1852
;1850:
;1851:	//if he was charging or anything else, kill the sound
;1852:	G_MuteSound(self->s.number, CHAN_WEAPON);
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 1854
;1853:
;1854:	BlowDetpacks(self); //blow detpacks if they're planted
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BlowDetpacks
CALLV
pop
line 1856
;1855:
;1856:	self->client->ps.fd.forceDeactivateAll = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1196
ADDP4
CNSTI4 1
ASGNI4
line 1858
;1857:
;1858:	if ((self == attacker || !attacker->client) &&
ADDRLP4 96
ADDRFP4 8
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 96
INDIRP4
CVPU4 4
EQU4 $695
ADDRLP4 96
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $693
LABELV $695
ADDRLP4 100
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 32
EQI4 $700
ADDRLP4 100
INDIRI4
CNSTI4 34
EQI4 $700
ADDRLP4 100
INDIRI4
CNSTI4 37
EQI4 $700
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $700
ADDRLP4 100
INDIRI4
CNSTI4 31
EQI4 $700
ADDRLP4 100
INDIRI4
CNSTI4 30
NEI4 $693
LABELV $700
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $693
line 1861
;1859:		(meansOfDeath == MOD_CRUSH || meansOfDeath == MOD_FALLING || meansOfDeath == MOD_TRIGGER_HURT || meansOfDeath == MOD_UNKNOWN || meansOfDeath == MOD_LAVA || meansOfDeath == MOD_SLIME) && // TA: Give credit for lava/slime kills too :)
;1860:		self->client->ps.otherKillerTime > nowTime)
;1861:	{
line 1862
;1862:		attacker = &g_entities[self->client->ps.otherKiller];
ADDRFP4 8
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1863
;1863:	}
LABELV $693
line 1866
;1864:
;1865:	// check for an almost capture
;1866:	CheckAlmostCapture( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostCapture
CALLV
pop
line 1868
;1867:
;1868:	self->client->ps.pm_type = PM_DEAD;
ADDRLP4 104
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1869
;1869:	if (self->client->sess.raceMode && (self->client->sess.raceStyle.runFlags & RFL_CLIMBTECH)) {
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 108
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $701
ADDRLP4 108
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 256
BANDI4
ADDRLP4 112
INDIRI4
EQI4 $701
line 1870
;1870:		self->client->ps.pm_flags &= ~PMF_STUCK_TO_WALL;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1871
;1871:	}
LABELV $701
line 1873
;1872:
;1873:	if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $703
line 1874
;1874:		killer = attacker->s.number;
ADDRLP4 4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1875
;1875:		if ( attacker->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $705
line 1876
;1876:			killerName = attacker->client->pers.netname;
ADDRLP4 28
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ASGNP4
line 1877
;1877:		} else {
ADDRGP4 $704
JUMPV
LABELV $705
line 1878
;1878:			killerName = "<non-client>";
ADDRLP4 28
ADDRGP4 $707
ASGNP4
line 1879
;1879:		}
line 1880
;1880:	} else {
ADDRGP4 $704
JUMPV
LABELV $703
line 1881
;1881:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 1882
;1882:		killerName = "<world>";
ADDRLP4 28
ADDRGP4 $708
ASGNP4
line 1883
;1883:	}
LABELV $704
line 1885
;1884:
;1885:	if ( killer < 0 || killer >= MAX_CLIENTS ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $711
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $709
LABELV $711
line 1886
;1886:		killer = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 1887
;1887:		killerName = "<world>";
ADDRLP4 28
ADDRGP4 $708
ASGNP4
line 1888
;1888:	}
LABELV $709
line 1890
;1889:
;1890:	if ( meansOfDeath < 0 || meansOfDeath >= (int)ARRAY_LEN( modNames ) ) {
ADDRLP4 120
ADDRFP4 16
INDIRI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
LTI4 $714
ADDRLP4 120
INDIRI4
CNSTI4 38
LTI4 $712
LABELV $714
line 1891
;1891:		obit = "<bad obituary>";
ADDRLP4 32
ADDRGP4 $715
ASGNP4
line 1892
;1892:	} else {
ADDRGP4 $713
JUMPV
LABELV $712
line 1893
;1893:		obit = modNames[ meansOfDeath ];
ADDRLP4 32
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ASGNP4
line 1894
;1894:	}
LABELV $713
line 1896
;1895:
;1896:	if (!self->client->sess.raceMode || (self != attacker && attacker && (attacker - g_entities) < MAX_CLIENTS || g_developer.integer)/* || meansOfDeath != MOD_SUICIDE*/) {
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $720
ADDRLP4 128
ADDRFP4 8
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 124
INDIRP4
CVPU4 4
ADDRLP4 128
INDIRU4
EQU4 $722
ADDRLP4 128
INDIRU4
CNSTU4 0
EQU4 $722
ADDRLP4 128
INDIRU4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
CNSTI4 32
LTI4 $720
LABELV $722
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
EQI4 $716
LABELV $720
line 1897
;1897:		G_LogPrintf("Kill: %i %i %i: %s killed %s by %s\n",
ADDRGP4 $723
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1900
;1898:			killer, self->s.number, meansOfDeath, killerName,
;1899:			self->client->pers.netname, obit);
;1900:	}
LABELV $716
line 1902
;1901:
;1902:	if ( g_austrian.integer 
ADDRGP4 g_austrian+12
INDIRI4
CNSTI4 0
EQI4 $724
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $724
ADDRGP4 level+92
INDIRI4
CNSTI4 2
LTI4 $724
line 1905
;1903:		&& g_gametype.integer == GT_TOURNAMENT 
;1904:		&& level.numPlayingClients >= 2 )
;1905:	{
line 1906
;1906:		int spawnTime = (level.clients[level.sortedClients[0]].respawnTime > level.clients[level.sortedClients[1]].respawnTime) ? level.clients[level.sortedClients[0]].respawnTime : level.clients[level.sortedClients[1]].respawnTime;
ADDRLP4 140
CNSTI4 53196
ASGNI4
ADDRLP4 144
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 148
CNSTI4 43684
ASGNI4
ADDRLP4 140
INDIRI4
ADDRGP4 level+96
INDIRI4
MULI4
ADDRLP4 144
INDIRP4
ADDP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
ADDRGP4 level+96+4
INDIRI4
MULI4
ADDRLP4 144
INDIRP4
ADDP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRI4
LEI4 $736
ADDRLP4 136
CNSTI4 53196
ADDRGP4 level+96
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43684
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $737
JUMPV
LABELV $736
ADDRLP4 136
CNSTI4 53196
ADDRGP4 level+96+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43684
ADDP4
INDIRI4
ASGNI4
LABELV $737
ADDRLP4 132
ADDRLP4 136
INDIRI4
ASGNI4
line 1907
;1907:		G_LogPrintf("Duel Kill Details:\n");
ADDRGP4 $738
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1908
;1908:		G_LogPrintf("Kill Time: %d\n", level.time-spawnTime );
ADDRGP4 $739
ARGP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 132
INDIRI4
SUBI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1909
;1909:		G_LogPrintf("victim: %s, hits on enemy %d\n", self->client->pers.netname, self->client->ps.persistant[PERS_HITS] );
ADDRGP4 $741
ARGP4
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 152
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1910
;1910:		if ( attacker && attacker->client )
ADDRLP4 156
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 160
CNSTU4 0
ASGNU4
ADDRLP4 156
INDIRP4
CVPU4 4
ADDRLP4 160
INDIRU4
EQU4 $742
ADDRLP4 156
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 160
INDIRU4
EQU4 $742
line 1911
;1911:		{
line 1912
;1912:			G_LogPrintf("killer: %s, hits on enemy %d, health: %d\n", attacker->client->pers.netname, attacker->client->ps.persistant[PERS_HITS], attacker->health );
ADDRGP4 $744
ARGP4
ADDRLP4 164
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 168
ADDRLP4 164
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 168
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1914
;1913:			//also - if MOD_SABER, list the animation and saber style
;1914:			if ( meansOfDeath == MOD_SABER )
ADDRFP4 16
INDIRI4
CNSTI4 3
NEI4 $745
line 1915
;1915:			{
line 1916
;1916:				G_LogPrintf("killer saber style: %d, killer saber anim %s\n", attacker->client->ps.fd.saberAnimLevel, animTable[(attacker->client->ps.torsoAnim&~ANIM_TOGGLEBIT)].name );
ADDRGP4 $747
ARGP4
ADDRLP4 172
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ARGI4
ADDRLP4 172
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 3
LSHI4
ADDRGP4 animTable
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1917
;1917:			}
LABELV $745
line 1918
;1918:		}
LABELV $742
line 1919
;1919:	}
LABELV $724
line 1921
;1920:
;1921:	G_LogWeaponKill(killer, meansOfDeath);
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponKill
CALLV
pop
line 1922
;1922:	G_LogWeaponDeath(self->s.number, self->s.weapon);
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
INDIRI4
ARGI4
ADDRLP4 132
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponDeath
CALLV
pop
line 1923
;1923:	if (attacker && attacker->client && attacker->inuse)
ADDRLP4 136
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 140
CNSTU4 0
ASGNU4
ADDRLP4 136
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRU4
EQU4 $748
ADDRLP4 136
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRU4
EQU4 $748
ADDRLP4 136
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $748
line 1924
;1924:	{
line 1925
;1925:		G_LogWeaponFrag(killer, self->s.number);
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponFrag
CALLV
pop
line 1926
;1926:	}
LABELV $748
line 1929
;1927:
;1928:	// broadcast the death event to everyone
;1929:	if (!self->client->sess.raceMode || (self != attacker && attacker && (attacker - g_entities)<MAX_CLIENTS)/* || meansOfDeath != MOD_SUICIDE*/) {
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $752
ADDRLP4 148
ADDRFP4 8
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 148
INDIRU4
EQU4 $750
ADDRLP4 148
INDIRU4
CNSTU4 0
EQU4 $750
ADDRLP4 148
INDIRU4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
CNSTI4 32
GEI4 $750
LABELV $752
line 1930
;1930:		ent = G_TempEntity(self->r.currentOrigin, EV_OBITUARY);
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 81
ARGI4
ADDRLP4 152
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 152
INDIRP4
ASGNP4
line 1931
;1931:		ent->s.eventParm = meansOfDeath;
ADDRLP4 16
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 1932
;1932:		ent->s.otherEntityNum = self->s.number;
ADDRLP4 16
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1933
;1933:		ent->s.otherEntityNum2 = killer;
ADDRLP4 16
INDIRP4
CNSTI4 188
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1934
;1934:		ent->r.svFlags = SVF_BROADCAST;	// send to everyone
ADDRLP4 16
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 32
ASGNI4
line 1935
;1935:		ent->s.isJediMaster = wasJediMaster;
ADDRLP4 16
INDIRP4
CNSTI4 244
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1936
;1936:	}
LABELV $750
line 1937
;1937:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1939
;1938:
;1939:	self->client->ps.persistant[PERS_KILLED]++;
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1941
;1940:
;1941:	if (self == attacker)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $753
line 1942
;1942:	{
line 1943
;1943:		self->client->ps.fd.suicides++;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1236
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1944
;1944:	}
LABELV $753
line 1946
;1945:
;1946:	if (attacker && attacker->client) {
ADDRLP4 156
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 160
CNSTU4 0
ASGNU4
ADDRLP4 156
INDIRP4
CVPU4 4
ADDRLP4 160
INDIRU4
EQU4 $755
ADDRLP4 156
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 160
INDIRU4
EQU4 $755
line 1947
;1947:		attacker->client->lastkilled_client = self->s.number;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43672
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1949
;1948:
;1949:		if ( attacker == self || OnSameTeam (self, attacker ) ) {
ADDRLP4 164
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRP4
CVPU4 4
EQU4 $759
ADDRLP4 168
INDIRP4
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $757
LABELV $759
line 1950
;1950:			if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $760
line 1951
;1951:			{ //in duel, if you kill yourself, the person you are dueling against gets a kill for it
line 1952
;1952:				int otherClNum = -1;
ADDRLP4 176
CNSTI4 -1
ASGNI4
line 1953
;1953:				if (level.sortedClients[0] == self->s.number)
ADDRGP4 level+96
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $763
line 1954
;1954:				{
line 1955
;1955:					otherClNum = level.sortedClients[1];
ADDRLP4 176
ADDRGP4 level+96+4
INDIRI4
ASGNI4
line 1956
;1956:				}
ADDRGP4 $764
JUMPV
LABELV $763
line 1957
;1957:				else if (level.sortedClients[1] == self->s.number)
ADDRGP4 level+96+4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $768
line 1958
;1958:				{
line 1959
;1959:					otherClNum = level.sortedClients[0];
ADDRLP4 176
ADDRGP4 level+96
INDIRI4
ASGNI4
line 1960
;1960:				}
LABELV $768
LABELV $764
line 1962
;1961:
;1962:				if (otherClNum >= 0 && otherClNum < MAX_CLIENTS &&
ADDRLP4 180
ADDRLP4 176
INDIRI4
ASGNI4
ADDRLP4 184
CNSTI4 0
ASGNI4
ADDRLP4 180
INDIRI4
ADDRLP4 184
INDIRI4
LTI4 $773
ADDRLP4 180
INDIRI4
CNSTI4 32
GEI4 $773
ADDRLP4 188
CNSTI4 2352
ADDRLP4 180
INDIRI4
MULI4
ASGNI4
ADDRLP4 188
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 184
INDIRI4
EQI4 $773
ADDRLP4 188
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $773
ADDRLP4 180
INDIRI4
ADDRFP4 8
INDIRP4
INDIRI4
EQI4 $773
line 1965
;1963:					g_entities[otherClNum].inuse && g_entities[otherClNum].client &&
;1964:					otherClNum != attacker->s.number)
;1965:				{
line 1966
;1966:					AddScore( &g_entities[otherClNum], self->r.currentOrigin, 1 );
CNSTI4 2352
ADDRLP4 176
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1967
;1967:				}
ADDRGP4 $761
JUMPV
LABELV $773
line 1969
;1968:				else
;1969:				{
line 1970
;1970:					if (!attacker->client->sess.raceMode)
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $761
line 1971
;1971:						AddScore(attacker, self->r.currentOrigin, -1);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1972
;1972:				}
line 1973
;1973:			}
ADDRGP4 $761
JUMPV
LABELV $760
line 1975
;1974:			else
;1975:			{
line 1976
;1976:				AddScore( attacker, self->r.currentOrigin, -1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1977
;1977:				if (attacker != self) { //we did a teamkill
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $779
line 1978
;1978:					if (!attacker->client->sess.raceMode) {
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $780
line 1979
;1979:						AddScore(attacker, self->r.currentOrigin, -1);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 1982
;1980:						//if (attacker != self && attacker->client)//JAPRO STATS
;1981:							//attacker->client->pers.stats.teamKills++;
;1982:					}
line 1983
;1983:				}
ADDRGP4 $780
JUMPV
LABELV $779
line 1984
;1984:				else if (g_gametype.integer != GT_FFA && (g_gametype.integer != GT_CTF)){// || !g_fixCTFScores.integer)) {//we selfkilled
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $783
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $783
line 1985
;1985:					if (!attacker->client->sess.raceMode)
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $787
line 1986
;1986:						AddScore(attacker, self->r.currentOrigin, -1); //Only take away a point if its not FFA or CTF i guess, sure
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
LABELV $787
line 1987
;1987:				}
LABELV $783
LABELV $780
line 1988
;1988:			}
LABELV $761
line 1989
;1989:			if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $756
line 1990
;1990:			{
line 1991
;1991:				if (self->client && self->client->ps.isJediMaster)
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $756
ADDRLP4 176
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $756
line 1992
;1992:				{ //killed ourself so return the saber to the original position
line 1995
;1993:				  //(to avoid people jumping off ledges and making the saber
;1994:				  //unreachable for 60 seconds)
;1995:					ThrowSaberToAttacker(self, NULL);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 ThrowSaberToAttacker
CALLV
pop
line 1996
;1996:					self->client->ps.isJediMaster = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 1997
;1997:				}
line 1998
;1998:			}
line 1999
;1999:		} else {
ADDRGP4 $756
JUMPV
LABELV $757
line 2000
;2000:			if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $794
line 2001
;2001:			{
line 2002
;2002:				if (attacker->client->ps.isJediMaster ||
ADDRLP4 176
CNSTI4 408
ASGNI4
ADDRLP4 180
CNSTI4 604
ASGNI4
ADDRLP4 184
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRI4
ADDRLP4 184
INDIRI4
NEI4 $799
ADDRLP4 188
ADDRFP4 0
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $797
ADDRLP4 188
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRI4
ADDRLP4 184
INDIRI4
EQI4 $797
LABELV $799
line 2004
;2003:					(self->client && self->client->ps.isJediMaster))
;2004:				{
line 2005
;2005:					AddScore( attacker, self->r.currentOrigin, 1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 2007
;2006:					
;2007:					if (self->client && self->client->ps.isJediMaster)
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $795
ADDRLP4 192
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $795
line 2008
;2008:					{
line 2009
;2009:						ThrowSaberToAttacker(self, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 ThrowSaberToAttacker
CALLV
pop
line 2010
;2010:						self->client->ps.isJediMaster = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 2011
;2011:					}
line 2012
;2012:				}
ADDRGP4 $795
JUMPV
LABELV $797
line 2014
;2013:				else
;2014:				{
line 2015
;2015:					gentity_t *jmEnt = G_GetJediMaster();
ADDRLP4 196
ADDRGP4 G_GetJediMaster
CALLP4
ASGNP4
ADDRLP4 192
ADDRLP4 196
INDIRP4
ASGNP4
line 2017
;2016:
;2017:					if (jmEnt && jmEnt->client)
ADDRLP4 200
ADDRLP4 192
INDIRP4
ASGNP4
ADDRLP4 204
CNSTU4 0
ASGNU4
ADDRLP4 200
INDIRP4
CVPU4 4
ADDRLP4 204
INDIRU4
EQU4 $795
ADDRLP4 200
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 204
INDIRU4
EQU4 $795
line 2018
;2018:					{
line 2019
;2019:						AddScore( jmEnt, self->r.currentOrigin, 1 );
ADDRLP4 192
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 2020
;2020:					}
line 2021
;2021:				}
line 2022
;2022:			}
ADDRGP4 $795
JUMPV
LABELV $794
line 2024
;2023:			else
;2024:			{
line 2025
;2025:				AddScore( attacker, self->r.currentOrigin, 1 );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 2026
;2026:			}
LABELV $795
line 2028
;2027:
;2028:			if( meansOfDeath == MOD_STUN_BATON ) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $804
line 2031
;2029:				
;2030:				// play humiliation on player
;2031:				attacker->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 176
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 332
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2034
;2032:
;2033:				// add the sprite over the player's head
;2034:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 180
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 2035
;2035:				attacker->client->ps.eFlags |= EF_AWARD_GAUNTLET;
ADDRLP4 184
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 2036
;2036:				attacker->client->rewardTime = LEVELTIME(attacker->client) + REWARD_SPRITE_TIME;
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $810
ADDRLP4 196
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $810
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $812
ADDRLP4 192
ADDRFP4 8
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
ADDRLP4 192
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $813
ADDRLP4 188
ADDRLP4 192
INDIRI4
ASGNI4
ADDRGP4 $811
JUMPV
LABELV $810
ADDRLP4 188
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $811
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43708
ADDP4
ADDRLP4 188
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2039
;2037:
;2038:				// also play humiliation on target
;2039:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_GAUNTLETREWARD;
ADDRLP4 200
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 200
INDIRP4
ADDRLP4 200
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 2040
;2040:			}
LABELV $804
line 2044
;2041:
;2042:			// check for two kills in a short amount of time
;2043:			// if this is close enough to the last kill, give a reward sound
;2044:			if ( LEVELTIME(attacker->client) - attacker->client->lastKillTime < CARNAGE_REWARD_TIME ) {
ADDRLP4 184
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $820
ADDRLP4 184
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $820
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $822
ADDRLP4 180
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $823
JUMPV
LABELV $822
ADDRLP4 180
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $823
ADDRLP4 176
ADDRLP4 180
INDIRI4
ASGNI4
ADDRGP4 $821
JUMPV
LABELV $820
ADDRLP4 176
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $821
ADDRLP4 176
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43716
ADDP4
INDIRI4
SUBI4
CNSTI4 3000
GEI4 $814
line 2046
;2045:				// play excellent on player
;2046:				attacker->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 188
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 320
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2049
;2047:
;2048:				// add the sprite over the player's head
;2049:				attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 2050
;2050:				attacker->client->ps.eFlags |= EF_AWARD_EXCELLENT;
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2051
;2051:				attacker->client->rewardTime = LEVELTIME(attacker->client) + REWARD_SPRITE_TIME;
ADDRLP4 208
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 208
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $828
ADDRLP4 208
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $828
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $830
ADDRLP4 204
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $831
JUMPV
LABELV $830
ADDRLP4 204
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $831
ADDRLP4 200
ADDRLP4 204
INDIRI4
ASGNI4
ADDRGP4 $829
JUMPV
LABELV $828
ADDRLP4 200
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $829
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43708
ADDP4
ADDRLP4 200
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2052
;2052:			}
LABELV $814
line 2053
;2053:			attacker->client->lastKillTime = LEVELTIME(attacker->client);
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $836
ADDRLP4 196
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $836
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $838
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $839
JUMPV
LABELV $838
ADDRLP4 192
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $839
ADDRLP4 188
ADDRLP4 192
INDIRI4
ASGNI4
ADDRGP4 $837
JUMPV
LABELV $836
ADDRLP4 188
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $837
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43716
ADDP4
ADDRLP4 188
INDIRI4
ASGNI4
line 2055
;2054:
;2055:		}
line 2056
;2056:	} else {
ADDRGP4 $756
JUMPV
LABELV $755
line 2057
;2057:		if (self->client && self->client->ps.isJediMaster)
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $840
ADDRLP4 164
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $840
line 2058
;2058:		{ //killed ourself so return the saber to the original position
line 2061
;2059:		  //(to avoid people jumping off ledges and making the saber
;2060:		  //unreachable for 60 seconds)
;2061:			ThrowSaberToAttacker(self, NULL);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 ThrowSaberToAttacker
CALLV
pop
line 2062
;2062:			self->client->ps.isJediMaster = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 2063
;2063:		}
LABELV $840
line 2065
;2064:
;2065:		if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $842
line 2066
;2066:		{ //in duel, if you kill yourself, the person you are dueling against gets a kill for it
line 2067
;2067:			int otherClNum = -1;
ADDRLP4 168
CNSTI4 -1
ASGNI4
line 2068
;2068:			if (level.sortedClients[0] == self->s.number)
ADDRGP4 level+96
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $845
line 2069
;2069:			{
line 2070
;2070:				otherClNum = level.sortedClients[1];
ADDRLP4 168
ADDRGP4 level+96+4
INDIRI4
ASGNI4
line 2071
;2071:			}
ADDRGP4 $846
JUMPV
LABELV $845
line 2072
;2072:			else if (level.sortedClients[1] == self->s.number)
ADDRGP4 level+96+4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $850
line 2073
;2073:			{
line 2074
;2074:				otherClNum = level.sortedClients[0];
ADDRLP4 168
ADDRGP4 level+96
INDIRI4
ASGNI4
line 2075
;2075:			}
LABELV $850
LABELV $846
line 2077
;2076:
;2077:			if (otherClNum >= 0 && otherClNum < MAX_CLIENTS &&
ADDRLP4 172
ADDRLP4 168
INDIRI4
ASGNI4
ADDRLP4 176
CNSTI4 0
ASGNI4
ADDRLP4 172
INDIRI4
ADDRLP4 176
INDIRI4
LTI4 $855
ADDRLP4 172
INDIRI4
CNSTI4 32
GEI4 $855
ADDRLP4 180
CNSTI4 2352
ADDRLP4 172
INDIRI4
MULI4
ASGNI4
ADDRLP4 180
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 176
INDIRI4
EQI4 $855
ADDRLP4 180
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $855
ADDRLP4 172
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $855
line 2080
;2078:				g_entities[otherClNum].inuse && g_entities[otherClNum].client &&
;2079:				otherClNum != self->s.number)
;2080:			{
line 2081
;2081:				AddScore( &g_entities[otherClNum], self->r.currentOrigin, 1 );
CNSTI4 2352
ADDRLP4 168
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 2082
;2082:			}
ADDRGP4 $843
JUMPV
LABELV $855
line 2084
;2083:			else
;2084:			{
line 2085
;2085:				AddScore( self, self->r.currentOrigin, -1 );
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 184
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 2086
;2086:			}
line 2087
;2087:		}
ADDRGP4 $843
JUMPV
LABELV $842
line 2089
;2088:		else
;2089:		{
line 2090
;2090:			AddScore( self, self->r.currentOrigin, -1 );
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
ARGP4
ADDRLP4 168
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 2091
;2091:		}
LABELV $843
line 2092
;2092:	}
LABELV $756
line 2094
;2093:
;2094:	if ((self->client->ps.powerups[PW_REDFLAG] || self->client->ps.powerups[PW_BLUEFLAG] || self->client->ps.powerups[PW_NEUTRALFLAG]) && self->client->sess.mode == MODE_IRONMAN && self != attacker) {	// only happens in standard CTF
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 164
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
NEI4 $862
ADDRLP4 164
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
NEI4 $862
ADDRLP4 164
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
ADDRLP4 168
INDIRI4
EQI4 $859
LABELV $862
ADDRLP4 172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
CNSTI4 5
NEI4 $859
ADDRLP4 172
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $859
line 2095
;2095:		if (attacker->client) {
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $863
line 2096
;2096:			if (self->client->ps.powerups[PW_REDFLAG]) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $865
line 2097
;2097:				PrintCTFMessage(attacker->s.number, TEAM_BLUE, CTFMESSAGE_FRAGGED_FLAG_CARRIER);
ADDRFP4 8
INDIRP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PrintCTFMessage
CALLP4
pop
line 2098
;2098:			}
ADDRGP4 $866
JUMPV
LABELV $865
line 2099
;2099:			else if (self->client->ps.powerups[PW_BLUEFLAG]) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $867
line 2100
;2100:				PrintCTFMessage(attacker->s.number, TEAM_RED, CTFMESSAGE_FRAGGED_FLAG_CARRIER);
ADDRFP4 8
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PrintCTFMessage
CALLP4
pop
line 2101
;2101:			}
LABELV $867
LABELV $866
line 2102
;2102:			AddScore(attacker, self->r.currentOrigin, CTF_FRAG_CARRIER_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 2103
;2103:		}
LABELV $863
line 2104
;2104:		level.lastIronManKilled = level.time;
ADDRGP4 level+30576
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2105
;2105:	}
ADDRGP4 $860
JUMPV
LABELV $859
line 2106
;2106:	else if (self->client->sess.mode == MODE_IRONMAN && attacker && attacker->client && attacker->client->sess.mode == MODE_IRONMAN && attacker->client->isIronMan && attacker != self) {
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
CNSTI4 408
ASGNI4
ADDRLP4 184
CNSTI4 43484
ASGNI4
ADDRLP4 188
CNSTI4 5
ASGNI4
ADDRLP4 176
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRP4
ADDRLP4 184
INDIRI4
ADDP4
INDIRI4
ADDRLP4 188
INDIRI4
NEI4 $871
ADDRLP4 192
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 196
ADDRLP4 192
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 200
CNSTU4 0
ASGNU4
ADDRLP4 196
INDIRU4
ADDRLP4 200
INDIRU4
EQU4 $871
ADDRLP4 204
ADDRLP4 192
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 204
INDIRP4
CVPU4 4
ADDRLP4 200
INDIRU4
EQU4 $871
ADDRLP4 204
INDIRP4
ADDRLP4 184
INDIRI4
ADDP4
INDIRI4
ADDRLP4 188
INDIRI4
NEI4 $871
ADDRLP4 204
INDIRP4
CNSTI4 53188
ADDP4
INDIRI4
CNSTI4 0
EQI4 $871
ADDRLP4 196
INDIRU4
ADDRLP4 176
INDIRP4
CVPU4 4
EQU4 $871
line 2108
;2107:		// give shield bonus to iron man if he kills someone
;2108:		if (attacker->client->ps.stats[STAT_ARMOR] < 100) {
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 100
GEI4 $872
line 2109
;2109:			attacker->client->ps.stats[STAT_ARMOR] += 20;
ADDRLP4 208
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 236
ADDP4
ASGNP4
ADDRLP4 208
INDIRP4
ADDRLP4 208
INDIRP4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 2110
;2110:			if (attacker->client->ps.stats[STAT_ARMOR] > 100) {
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
CNSTI4 100
LEI4 $872
line 2111
;2111:				attacker->client->ps.stats[STAT_ARMOR] = 100;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 236
ADDP4
CNSTI4 100
ASGNI4
line 2112
;2112:			}
line 2113
;2113:		}
line 2114
;2114:	}
ADDRGP4 $872
JUMPV
LABELV $871
line 2115
;2115:	else {
line 2117
;2116:		// Add team bonuses
;2117:		Team_FragBonuses(self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_FragBonuses
CALLV
pop
line 2118
;2118:	}
LABELV $872
LABELV $860
line 2122
;2119:
;2120:
;2121:	// if I committed suicide, the flag does not fall, it returns.
;2122:	if (meansOfDeath == MOD_SUICIDE) {
ADDRFP4 16
INDIRI4
CNSTI4 35
NEI4 $877
line 2123
;2123:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $879
line 2124
;2124:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 2125
;2125:			self->client->ps.powerups[PW_NEUTRALFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 368
ADDP4
CNSTI4 0
ASGNI4
line 2126
;2126:		}
ADDRGP4 $880
JUMPV
LABELV $879
line 2127
;2127:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $881
line 2128
;2128:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 2129
;2129:			self->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 360
ADDP4
CNSTI4 0
ASGNI4
line 2130
;2130:		}
ADDRGP4 $882
JUMPV
LABELV $881
line 2131
;2131:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $883
line 2132
;2132:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 2133
;2133:			self->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 364
ADDP4
CNSTI4 0
ASGNI4
line 2134
;2134:		}
LABELV $883
LABELV $882
LABELV $880
line 2135
;2135:	}
LABELV $877
line 2138
;2136:
;2137:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;2138:	contents = trap_PointContents( self->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 208
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 208
INDIRI4
ASGNI4
line 2139
;2139:	if ( !( contents & CONTENTS_NODROP ) && !self->client->ps.fallingToDeath) {
ADDRLP4 212
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 212
INDIRI4
NEI4 $885
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
ADDRLP4 212
INDIRI4
NEI4 $885
line 2140
;2140:		TossClientItems( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 2141
;2141:	}
ADDRGP4 $886
JUMPV
LABELV $885
line 2142
;2142:	else {
line 2143
;2143:		if ( self->client->ps.powerups[PW_NEUTRALFLAG] ) {		// only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $887
line 2144
;2144:			Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 2145
;2145:		}
ADDRGP4 $888
JUMPV
LABELV $887
line 2146
;2146:		else if ( self->client->ps.powerups[PW_REDFLAG] ) {		// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $889
line 2147
;2147:			Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 2148
;2148:		}
ADDRGP4 $890
JUMPV
LABELV $889
line 2149
;2149:		else if ( self->client->ps.powerups[PW_BLUEFLAG] ) {	// only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $891
line 2150
;2150:			Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 2151
;2151:		}
LABELV $891
LABELV $890
LABELV $888
line 2152
;2152:	}
LABELV $886
line 2154
;2153:
;2154:	Cmd_Score_f( self );		// show scores
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 2157
;2155:	// send updated scores to any clients that are following this one,
;2156:	// or they would get stale scoreboards
;2157:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $896
JUMPV
LABELV $893
line 2160
;2158:		gclient_t	*client;
;2159:
;2160:		client = &level.clients[i];
ADDRLP4 216
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 2161
;2161:		if ( client->pers.connected != CON_CONNECTED ) {
ADDRLP4 216
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $898
line 2162
;2162:			continue;
ADDRGP4 $894
JUMPV
LABELV $898
line 2164
;2163:		}
;2164:		if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 216
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $900
line 2165
;2165:			continue;
ADDRGP4 $894
JUMPV
LABELV $900
line 2167
;2166:		}
;2167:		if ( client->sess.spectatorClient == self->s.number ) {
ADDRLP4 216
INDIRP4
CNSTI4 43452
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $902
line 2168
;2168:			Cmd_Score_f( g_entities + i );
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 2169
;2169:		}
LABELV $902
line 2170
;2170:	}
LABELV $894
line 2157
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $896
ADDRLP4 0
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $893
line 2172
;2171:
;2172:	self->takedamage = qtrue;	// can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 2174
;2173:
;2174:	self->s.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 0
ASGNI4
line 2175
;2175:	self->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 2176
;2176:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 512
ASGNI4
line 2177
;2177:	self->client->ps.zoomMode = 0;	// Turn off zooming when we die
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 2179
;2178:
;2179:	self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 2180
;2180:	self->s.angles[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 2181
;2181:	LookAtKiller (self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 LookAtKiller
CALLV
pop
line 2183
;2182:
;2183:	VectorCopy( self->s.angles, self->client->ps.viewangles );
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 216
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 216
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 2185
;2184:
;2185:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 2187
;2186:
;2187:	self->r.maxs[2] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 3238002688
ASGNF4
line 2191
;2188:
;2189:	// don't allow respawn until the death anim is done
;2190:	// g_forcerespawn may force spawning at some later time
;2191:	self->client->respawnTime = nowTime + 1700;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43684
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 1700
ADDI4
ASGNI4
line 2194
;2192:
;2193:	// remove powerups
;2194:	memset( self->client->ps.powerups, 0, sizeof(self->client->ps.powerups) );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 64
ARGU4
ADDRGP4 memset
CALLP4
pop
line 2206
;2195:
;2196:	// NOTENOTE No gib deaths right now, this is star wars.
;2197:	/*
;2198:	// never gib in a nodrop
;2199:	if ( (self->health <= GIB_HEALTH && !(contents & CONTENTS_NODROP) && g_blood.integer) || meansOfDeath == MOD_SUICIDE) 
;2200:	{
;2201:		// gib death
;2202:		GibEntity( self, killer );
;2203:	} 
;2204:	else 
;2205:	*/
;2206:	{
line 2211
;2207:		// normal death
;2208:		
;2209:		static int i;
;2210:
;2211:		switch ( i ) {
ADDRLP4 220
ADDRGP4 $904
INDIRI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 0
EQI4 $907
ADDRLP4 220
INDIRI4
CNSTI4 1
EQI4 $908
ADDRLP4 220
INDIRI4
CNSTI4 2
EQI4 $909
ADDRGP4 $905
JUMPV
LABELV $907
line 2213
;2212:		case 0:
;2213:			anim = BOTH_DEATH1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 2214
;2214:			break;
ADDRGP4 $906
JUMPV
LABELV $908
line 2216
;2215:		case 1:
;2216:			anim = BOTH_DEATH2;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 2217
;2217:			break;
ADDRGP4 $906
JUMPV
LABELV $909
LABELV $905
line 2220
;2218:		case 2:
;2219:		default:
;2220:			anim = BOTH_DEATH3;
ADDRLP4 8
CNSTI4 3
ASGNI4
line 2221
;2221:			break;
LABELV $906
line 2224
;2222:		}
;2223:		
;2224:		anim = G_PickDeathAnim(self, self->pos1, damage, meansOfDeath, HL_NONE);
ADDRLP4 224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
ARGP4
ADDRLP4 224
INDIRP4
CNSTI4 552
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 228
ADDRGP4 G_PickDeathAnim
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 228
INDIRI4
ASGNI4
line 2226
;2225:
;2226:		if (anim < 1)
ADDRLP4 8
INDIRI4
CNSTI4 1
GEI4 $910
line 2227
;2227:		{
line 2228
;2228:			anim = BOTH_DEATH1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 2229
;2229:		}
LABELV $910
line 2231
;2230:
;2231:		if (meansOfDeath == MOD_SABER)
ADDRFP4 16
INDIRI4
CNSTI4 3
NEI4 $912
line 2232
;2232:		{
line 2233
;2233:			G_CheckForDismemberment(self, self->pos1, damage, anim);
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
ARGP4
ADDRLP4 232
INDIRP4
CNSTI4 552
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_CheckForDismemberment
CALLV
pop
line 2234
;2234:		}
LABELV $912
line 2238
;2235:
;2236:		// for the no-blood option, we need to prevent the health
;2237:		// from going to gib level
;2238:		if ( self->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $914
line 2239
;2239:			self->health = GIB_HEALTH+1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 -39
ASGNI4
line 2240
;2240:		}
LABELV $914
line 2242
;2241:
;2242:		self->client->respawnTime = nowTime + 1000;//((self->client->animations[anim].numFrames*40)/(50.0f / self->client->animations[anim].frameLerp))+300;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43684
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2244
;2243:
;2244:		self->client->ps.legsAnim = 
ADDRLP4 232
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ASGNP4
ADDRLP4 236
CNSTI4 2048
ASGNI4
ADDRLP4 232
INDIRP4
ADDRLP4 232
INDIRP4
INDIRI4
ADDRLP4 236
INDIRI4
BANDI4
ADDRLP4 236
INDIRI4
BXORI4
ADDRLP4 8
INDIRI4
BORI4
ASGNI4
line 2246
;2245:			( ( self->client->ps.legsAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;2246:		self->client->ps.torsoAnim = 
ADDRLP4 240
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 244
CNSTI4 2048
ASGNI4
ADDRLP4 240
INDIRP4
ADDRLP4 240
INDIRP4
INDIRI4
ADDRLP4 244
INDIRI4
BANDI4
ADDRLP4 244
INDIRI4
BXORI4
ADDRLP4 8
INDIRI4
BORI4
ASGNI4
line 2254
;2247:			( ( self->client->ps.torsoAnim & ANIM_TOGGLEBIT ) ^ ANIM_TOGGLEBIT ) | anim;
;2248://		self->client->ps.pm_flags |= PMF_UPDATE_ANIM;		// Make sure the pmove sets up the GHOUL2 anims.
;2249:
;2250:		//rww - do this on respawn, not death
;2251:		//CopyToBodyQue (self);
;2252:
;2253:		//G_AddEvent( self, EV_DEATH1 + i, killer );
;2254:		if (wasJediMaster)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $916
line 2255
;2255:		{
line 2256
;2256:			G_AddEvent( self, EV_DEATH1 + i, 1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $904
INDIRI4
CNSTI4 78
ADDI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2257
;2257:		}
ADDRGP4 $917
JUMPV
LABELV $916
line 2259
;2258:		else
;2259:		{
line 2260
;2260:			G_AddEvent( self, EV_DEATH1 + i, 0 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $904
INDIRI4
CNSTI4 78
ADDI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2261
;2261:		}
LABELV $917
line 2264
;2262:
;2263:		// the body can still be gibbed
;2264:		self->die = body_die;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 body_die
ASGNP4
line 2267
;2265:
;2266:		//It won't gib, it will disintegrate (because this is Star Wars).
;2267:		self->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 2270
;2268:
;2269:		// globally cycle through the different death animations
;2270:		i = ( i + 1 ) % 3;
ADDRLP4 248
ADDRGP4 $904
ASGNP4
ADDRLP4 248
INDIRP4
ADDRLP4 248
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 3
MODI4
ASGNI4
line 2271
;2271:	}
line 2273
;2272:
;2273:	self->client->sess.raceStateInvalidated = qfalse; // we are respawning, reset this and allow us to do stuff again
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43516
ADDP4
CNSTI4 0
ASGNI4
line 2274
;2274:	self->client->sess.raceStateSoftInvalidated = qfalse; // we are respawning, reset this and allow us to run again
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43520
ADDP4
CNSTI4 0
ASGNI4
line 2275
;2275:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2277
;2276:
;2277:}
LABELV $663
endproc player_die 252 28
export CheckArmor
proc CheckArmor 20 4
line 2286
;2278:
;2279:
;2280:/*
;2281:================
;2282:CheckArmor
;2283:================
;2284:*/
;2285:int CheckArmor (gentity_t *ent, int damage, int dflags)
;2286:{
line 2291
;2287:	gclient_t	*client;
;2288:	int			save;
;2289:	int			count;
;2290:
;2291:	if (!damage)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $919
line 2292
;2292:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $918
JUMPV
LABELV $919
line 2294
;2293:
;2294:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 2296
;2295:
;2296:	if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $921
line 2297
;2297:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $918
JUMPV
LABELV $921
line 2299
;2298:
;2299:	if (dflags & DAMAGE_NO_ARMOR)
ADDRFP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $923
line 2300
;2300:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $918
JUMPV
LABELV $923
line 2303
;2301:
;2302:	// armor
;2303:	count = client->ps.stats[STAT_ARMOR];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 2305
;2304:
;2305:	if (dflags & DAMAGE_HALF_ABSORB)
ADDRFP4 8
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $925
line 2306
;2306:	{	// Half the damage gets absorbed by the shields, rather than 100%
line 2307
;2307:		save = ceil( damage * ARMOR_PROTECTION );
CNSTF4 1056964608
ADDRFP4 4
INDIRI4
CVIF4 4
MULF4
ARGF4
ADDRLP4 12
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 2308
;2308:	}
ADDRGP4 $926
JUMPV
LABELV $925
line 2310
;2309:	else
;2310:	{	// All the damage gets absorbed by the shields.
line 2311
;2311:		save = damage;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 2312
;2312:	}
LABELV $926
line 2315
;2313:
;2314:	// save is the most damage that the armor is elibigle to protect, of course, but it's limited by the total armor.
;2315:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $927
line 2316
;2316:		save = count;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $927
line 2318
;2317:
;2318:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $929
line 2319
;2319:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $918
JUMPV
LABELV $929
line 2321
;2320:
;2321:	if(!client->sess.raceMode || !(dflags & FAKE_DAMAGE_IN_RACEMODE)){
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $933
ADDRFP4 8
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 12
INDIRI4
NEI4 $931
LABELV $933
line 2322
;2322:		if (dflags & DAMAGE_HALF_ARMOR_REDUCTION)		// Armor isn't whittled so easily by sniper shots.
ADDRFP4 8
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $934
line 2323
;2323:		{
line 2324
;2324:			client->ps.stats[STAT_ARMOR] -= (int)(save*ARMOR_REDUCTION_FACTOR);
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 236
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTF4 1056964608
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CVFI4 4
SUBI4
ASGNI4
line 2325
;2325:		}
ADDRGP4 $935
JUMPV
LABELV $934
line 2327
;2326:		else
;2327:		{
line 2328
;2328:			client->ps.stats[STAT_ARMOR] -= save;
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 236
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 2329
;2329:		}
LABELV $935
line 2330
;2330:	}
LABELV $931
line 2332
;2331:
;2332:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $918
endproc CheckArmor 20 4
export G_ApplyKnockback
proc G_ApplyKnockback 48 0
line 2337
;2333:}
;2334:
;2335:
;2336:void G_ApplyKnockback( gentity_t *targ, vec3_t newDir, float knockback )
;2337:{
line 2341
;2338:	vec3_t	kvel;
;2339:	float	mass;
;2340:
;2341:	if ( !targ ) return;
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $937
ADDRGP4 $936
JUMPV
LABELV $937
line 2342
;2342:	if (targ && targ->client && targ->client->ps.usingATST)
ADDRLP4 16
ADDRFP4 0
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
EQU4 $939
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
EQU4 $939
ADDRLP4 24
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $939
line 2343
;2343:	{
line 2344
;2344:		return;
ADDRGP4 $936
JUMPV
LABELV $939
line 2347
;2345:	}
;2346:
;2347:	if ( targ->physicsBounce > 0 )	//overide the mass
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
CNSTF4 0
LEF4 $941
line 2348
;2348:		mass = targ->physicsBounce;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $942
JUMPV
LABELV $941
line 2350
;2349:	else
;2350:		mass = 200;
ADDRLP4 12
CNSTF4 1128792064
ASGNF4
LABELV $942
line 2352
;2351:
;2352:	if ( g_gravity.value > 0 )
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 0
LEF4 $943
line 2353
;2353:	{
line 2354
;2354:		VectorScale( newDir, g_knockback.value * (float)knockback / mass * 0.8, kvel );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 1061997773
ASGNF4
ADDRLP4 36
ADDRFP4 8
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1061997773
ADDRGP4 g_knockback+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
MULF4
ASGNF4
line 2355
;2355:		kvel[2] = newDir[2] * g_knockback.value * (float)knockback / mass * 1.5;
ADDRLP4 0+8
CNSTF4 1069547520
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
MULF4
ADDRFP4 8
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
ASGNF4
line 2356
;2356:	}
ADDRGP4 $944
JUMPV
LABELV $943
line 2358
;2357:	else
;2358:	{
line 2359
;2359:		VectorScale( newDir, g_knockback.value * (float)knockback / mass, kvel );
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 8
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
DIVF4
MULF4
ASGNF4
line 2360
;2360:	}
LABELV $944
line 2362
;2361:
;2362:	if ( targ->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $958
line 2363
;2363:	{
line 2364
;2364:		VectorAdd( targ->client->ps.velocity, kvel, targ->client->ps.velocity );
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 2365
;2365:	}
ADDRGP4 $959
JUMPV
LABELV $958
line 2366
;2366:	else if ( targ->s.pos.trType != TR_STATIONARY && targ->s.pos.trType != TR_LINEAR_STOP )
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $962
ADDRLP4 28
INDIRI4
CNSTI4 3
EQI4 $962
line 2367
;2367:	{
line 2368
;2368:		VectorAdd( targ->s.pos.trDelta, kvel, targ->s.pos.trDelta );
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 2369
;2369:		VectorCopy( targ->r.currentOrigin, targ->s.pos.trBase );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2370
;2370:		targ->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2371
;2371:	}
LABELV $962
LABELV $959
line 2375
;2372:
;2373:	// set the timer so that the other client can't cancel
;2374:	// out the movement immediately
;2375:	if ( targ->client && !targ->client->ps.pm_time ) 
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
EQU4 $967
ADDRLP4 32
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $967
line 2376
;2376:	{
line 2379
;2377:		int		t;
;2378:
;2379:		t = knockback * 2;
ADDRLP4 36
CNSTF4 1073741824
ADDRFP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 2380
;2380:		if ( t < 50 ) {
ADDRLP4 36
INDIRI4
CNSTI4 50
GEI4 $969
line 2381
;2381:			t = 50;
ADDRLP4 36
CNSTI4 50
ASGNI4
line 2382
;2382:		}
LABELV $969
line 2383
;2383:		if ( t > 200 ) {
ADDRLP4 36
INDIRI4
CNSTI4 200
LEI4 $971
line 2384
;2384:			t = 200;
ADDRLP4 36
CNSTI4 200
ASGNI4
line 2385
;2385:		}
LABELV $971
line 2386
;2386:		targ->client->ps.pm_time = t;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2387
;2387:		targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 2388
;2388:	}
LABELV $967
line 2389
;2389:}
LABELV $936
endproc G_ApplyKnockback 48 0
export RaySphereIntersections
proc RaySphereIntersections 96 4
line 2396
;2390:
;2391:/*
;2392:================
;2393:RaySphereIntersections
;2394:================
;2395:*/
;2396:int RaySphereIntersections( vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2] ) {
line 2405
;2397:	float b, c, d, t;
;2398:
;2399:	//	| origin - (point + t * dir) | = radius
;2400:	//	a = dir[0]^2 + dir[1]^2 + dir[2]^2;
;2401:	//	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
;2402:	//	c = (point[0] - origin[0])^2 + (point[1] - origin[1])^2 + (point[2] - origin[2])^2 - radius^2;
;2403:
;2404:	// normalize dir so a = 1
;2405:	VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2406
;2406:	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
ADDRLP4 16
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 4
ASGNI4
ADDRLP4 32
CNSTI4 8
ASGNI4
ADDRLP4 4
CNSTF4 1073741824
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
INDIRF4
SUBF4
MULF4
ADDRLP4 16
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
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
SUBF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
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
SUBF4
MULF4
ADDF4
MULF4
ASGNF4
line 2407
;2407:	c = (point[0] - origin[0]) * (point[0] - origin[0]) +
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRLP4 52
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56
CNSTI4 8
ASGNI4
ADDRLP4 60
ADDRLP4 36
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 44
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ADDRLP4 52
INDIRF4
ADDRLP4 52
INDIRF4
MULF4
ADDF4
ADDRLP4 60
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ADDF4
ADDRLP4 64
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
SUBF4
ASGNF4
line 2412
;2408:		(point[1] - origin[1]) * (point[1] - origin[1]) +
;2409:		(point[2] - origin[2]) * (point[2] - origin[2]) -
;2410:		radius * radius;
;2411:
;2412:	d = b * b - 4 * c;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
CNSTF4 1082130432
ADDRLP4 12
INDIRF4
MULF4
SUBF4
ASGNF4
line 2413
;2413:	if (d > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $974
line 2414
;2414:		t = (- b + sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 72
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2415
;2415:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2416
;2416:		t = (- b - sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 84
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 84
INDIRF4
SUBF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2417
;2417:		VectorMA(point, t, dir, intersections[1]);
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2418
;2418:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $973
JUMPV
LABELV $974
line 2420
;2419:	}
;2420:	else if (d == 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $976
line 2421
;2421:		t = (- b ) / 2;
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 2422
;2422:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
ADDRFP4 8
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2423
;2423:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $973
JUMPV
LABELV $976
line 2425
;2424:	}
;2425:	return 0;
CNSTI4 0
RETI4
LABELV $973
endproc RaySphereIntersections 96 4
export LimbTouch
proc LimbTouch 0 0
line 2429
;2426:}
;2427:
;2428:void LimbTouch( gentity_t *self, gentity_t *other, trace_t *trace )
;2429:{
line 2430
;2430:}
LABELV $978
endproc LimbTouch 0 0
export LimbThink
proc LimbThink 12 4
line 2433
;2431:
;2432:void LimbThink( gentity_t *ent )
;2433:{
line 2434
;2434:	if (ent->speed < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $980
line 2435
;2435:	{
line 2436
;2436:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2437
;2437:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2438
;2438:		return;
ADDRGP4 $979
JUMPV
LABELV $980
line 2441
;2439:	}
;2440:
;2441:	if (ent->s.pos.trType != TR_GRAVITY)
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
EQI4 $984
line 2442
;2442:	{
line 2443
;2443:		int addamt = (ent->speed - level.time);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 2445
;2444:
;2445:		if (addamt > 5000)
ADDRLP4 0
INDIRI4
CNSTI4 5000
LEI4 $987
line 2446
;2446:		{
line 2447
;2447:			addamt = 5000;
ADDRLP4 0
CNSTI4 5000
ASGNI4
line 2448
;2448:		}
LABELV $987
line 2449
;2449:		if (addamt < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $989
line 2450
;2450:		{
line 2451
;2451:			addamt = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2452
;2452:		}
LABELV $989
line 2454
;2453:
;2454:		VectorClear(ent->s.pos.trDelta);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 2455
;2455:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2456
;2456:		ent->nextthink = level.time + addamt;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 2457
;2457:		return;
ADDRGP4 $979
JUMPV
LABELV $984
line 2460
;2458:	}
;2459:
;2460:	G_RunMissile(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunMissile
CALLV
pop
line 2462
;2461:
;2462:	G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 2463
;2463:}
LABELV $979
endproc LimbThink 12 4
data
export hitLocName
align 4
LABELV hitLocName
address $992
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
address $1005
address $1006
address $1007
address $1008
address $1009
address $1010
address $1011
address $1012
address $1013
address $1014
export G_GetDismemberLoc
code
proc G_GetDismemberLoc 184 16
line 2496
;2464:
;2465:
;2466:char *hitLocName[HL_MAX] = 
;2467:{
;2468:	"none",	//HL_NONE = 0,
;2469:	"right foot",	//HL_FOOT_RT,
;2470:	"left foot",	//HL_FOOT_LT,
;2471:	"right leg",	//HL_LEG_RT,
;2472:	"left leg",	//HL_LEG_LT,
;2473:	"waist",	//HL_WAIST,
;2474:	"back right shoulder",	//HL_BACK_RT,
;2475:	"back left shoulder",	//HL_BACK_LT,
;2476:	"back",	//HL_BACK,
;2477:	"front right shouler",	//HL_CHEST_RT,
;2478:	"front left shoulder",	//HL_CHEST_LT,
;2479:	"chest",	//HL_CHEST,
;2480:	"right arm",	//HL_ARM_RT,
;2481:	"left arm",	//HL_ARM_LT,
;2482:	"right hand",	//HL_HAND_RT,
;2483:	"left hand",	//HL_HAND_LT,
;2484:	"head",	//HL_HEAD
;2485:	"generic1",	//HL_GENERIC1,
;2486:	"generic2",	//HL_GENERIC2,
;2487:	"generic3",	//HL_GENERIC3,
;2488:	"generic4",	//HL_GENERIC4,
;2489:	"generic5",	//HL_GENERIC5,
;2490:	"generic6"	//HL_GENERIC6
;2491:};
;2492:
;2493:void G_G2PlayerAngles( gentity_t *ent, vec3_t legs[3], vec3_t legsAngles);
;2494:
;2495:void G_GetDismemberLoc(gentity_t *self, vec3_t boltPoint, int limbType)
;2496:{ //Just get the general area without using server-side ghoul2
line 2499
;2497:	vec3_t fwd, right, up;
;2498:
;2499:	AngleVectors(self->r.currentAngles, fwd, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 380
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2501
;2500:
;2501:	VectorCopy(self->r.currentOrigin, boltPoint);
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2503
;2502:
;2503:	switch (limbType)
ADDRLP4 36
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 10
LTI4 $1015
ADDRLP4 36
INDIRI4
CNSTI4 16
GTI4 $1015
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1049-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1049
address $1018
address $1021
address $1024
address $1029
address $1034
address $1039
address $1044
code
line 2504
;2504:	{
LABELV $1018
line 2506
;2505:	case G2_MODELPART_HEAD:
;2506:		boltPoint[0] += up[0]*24;
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1103101952
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2507
;2507:		boltPoint[1] += up[1]*24;
ADDRLP4 44
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
CNSTF4 1103101952
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2508
;2508:		boltPoint[2] += up[2]*24;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
CNSTF4 1103101952
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2509
;2509:		break;
ADDRGP4 $1015
JUMPV
LABELV $1021
line 2511
;2510:	case G2_MODELPART_WAIST:
;2511:		boltPoint[0] += up[0]*4;
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2512
;2512:		boltPoint[1] += up[1]*4;
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2513
;2513:		boltPoint[2] += up[2]*4;
ADDRLP4 60
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2514
;2514:		break;
ADDRGP4 $1015
JUMPV
LABELV $1024
line 2516
;2515:	case G2_MODELPART_LARM:
;2516:		boltPoint[0] += up[0]*18;
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
CNSTF4 1099956224
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2517
;2517:		boltPoint[1] += up[1]*18;
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
CNSTF4 1099956224
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2518
;2518:		boltPoint[2] += up[2]*18;
ADDRLP4 72
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
CNSTF4 1099956224
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2520
;2519:
;2520:		boltPoint[0] -= right[0]*10;
ADDRLP4 76
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12
INDIRF4
MULF4
SUBF4
ASGNF4
line 2521
;2521:		boltPoint[1] -= right[1]*10;
ADDRLP4 80
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2522
;2522:		boltPoint[2] -= right[2]*10;
ADDRLP4 84
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 2523
;2523:		break;
ADDRGP4 $1015
JUMPV
LABELV $1029
line 2525
;2524:	case G2_MODELPART_RARM:
;2525:		boltPoint[0] += up[0]*18;
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
CNSTF4 1099956224
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2526
;2526:		boltPoint[1] += up[1]*18;
ADDRLP4 92
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
CNSTF4 1099956224
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2527
;2527:		boltPoint[2] += up[2]*18;
ADDRLP4 96
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
CNSTF4 1099956224
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2529
;2528:
;2529:		boltPoint[0] += right[0]*10;
ADDRLP4 100
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 2530
;2530:		boltPoint[1] += right[1]*10;
ADDRLP4 104
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2531
;2531:		boltPoint[2] += right[2]*10;
ADDRLP4 108
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2532
;2532:		break;
ADDRGP4 $1015
JUMPV
LABELV $1034
line 2534
;2533:	case G2_MODELPART_RHAND:
;2534:		boltPoint[0] += up[0]*8;
ADDRLP4 112
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2535
;2535:		boltPoint[1] += up[1]*8;
ADDRLP4 116
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2536
;2536:		boltPoint[2] += up[2]*8;
ADDRLP4 120
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2538
;2537:
;2538:		boltPoint[0] += right[0]*10;
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 2539
;2539:		boltPoint[1] += right[1]*10;
ADDRLP4 128
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2540
;2540:		boltPoint[2] += right[2]*10;
ADDRLP4 132
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2541
;2541:		break;
ADDRGP4 $1015
JUMPV
LABELV $1039
line 2543
;2542:	case G2_MODELPART_LLEG:
;2543:		boltPoint[0] -= up[0]*4;
ADDRLP4 136
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0
INDIRF4
MULF4
SUBF4
ASGNF4
line 2544
;2544:		boltPoint[1] -= up[1]*4;
ADDRLP4 140
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2545
;2545:		boltPoint[2] -= up[2]*4;
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 2547
;2546:
;2547:		boltPoint[0] -= right[0]*10;
ADDRLP4 148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12
INDIRF4
MULF4
SUBF4
ASGNF4
line 2548
;2548:		boltPoint[1] -= right[1]*10;
ADDRLP4 152
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2549
;2549:		boltPoint[2] -= right[2]*10;
ADDRLP4 156
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 2550
;2550:		break;
ADDRGP4 $1015
JUMPV
LABELV $1044
line 2552
;2551:	case G2_MODELPART_RLEG:
;2552:		boltPoint[0] -= up[0]*4;
ADDRLP4 160
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0
INDIRF4
MULF4
SUBF4
ASGNF4
line 2553
;2553:		boltPoint[1] -= up[1]*4;
ADDRLP4 164
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2554
;2554:		boltPoint[2] -= up[2]*4;
ADDRLP4 168
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRF4
CNSTF4 1082130432
ADDRLP4 0+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 2556
;2555:
;2556:		boltPoint[0] += right[0]*10;
ADDRLP4 172
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 2557
;2557:		boltPoint[1] += right[1]*10;
ADDRLP4 176
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2558
;2558:		boltPoint[2] += right[2]*10;
ADDRLP4 180
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRF4
CNSTF4 1092616192
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2559
;2559:		break;
line 2561
;2560:	default:
;2561:		break;
line 2564
;2562:	}
;2563:
;2564:	return;
LABELV $1015
endproc G_GetDismemberLoc 184 16
export G_GetDismemberBolt
proc G_GetDismemberBolt 176 36
line 2568
;2565:}
;2566:
;2567:void G_GetDismemberBolt(gentity_t *self, vec3_t boltPoint, int limbType)
;2568:{
line 2569
;2569:	int useBolt = self->bolt_Head;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
ASGNI4
line 2573
;2570:	vec3_t properOrigin, properAngles, addVel;
;2571:	vec3_t legAxis[3];
;2572:	mdxaBone_t	boltMatrix;
;2573:	float fVSpeed = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2574
;2574:	int nowTime = LEVELTIME(self->client);
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1056
ADDRLP4 140
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1056
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1058
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1059
JUMPV
LABELV $1058
ADDRLP4 136
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1059
ADDRLP4 132
ADDRLP4 136
INDIRI4
ASGNI4
ADDRGP4 $1057
JUMPV
LABELV $1056
ADDRLP4 132
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1057
ADDRLP4 128
ADDRLP4 132
INDIRI4
ASGNI4
line 2576
;2575:
;2576:	switch (limbType)
ADDRLP4 144
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 10
LTI4 $1060
ADDRLP4 144
INDIRI4
CNSTI4 16
GTI4 $1060
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1070-40
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1070
address $1062
address $1063
address $1064
address $1065
address $1066
address $1068
address $1069
code
line 2577
;2577:	{
LABELV $1062
line 2579
;2578:	case G2_MODELPART_HEAD:
;2579:		useBolt = self->bolt_Head;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
ASGNI4
line 2580
;2580:		break;
ADDRGP4 $1061
JUMPV
LABELV $1063
line 2582
;2581:	case G2_MODELPART_WAIST:
;2582:		useBolt = self->bolt_Waist;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ASGNI4
line 2583
;2583:		break;
ADDRGP4 $1061
JUMPV
LABELV $1064
line 2585
;2584:	case G2_MODELPART_LARM:
;2585:		useBolt = self->bolt_LArm;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
ASGNI4
line 2586
;2586:		break;
ADDRGP4 $1061
JUMPV
LABELV $1065
line 2588
;2587:	case G2_MODELPART_RARM:
;2588:		useBolt = self->bolt_RArm;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRI4
ASGNI4
line 2589
;2589:		break;
ADDRGP4 $1061
JUMPV
LABELV $1066
line 2591
;2590:	case G2_MODELPART_RHAND:
;2591:		useBolt = trap_G2API_AddBolt(self->client->ghoul2, 0, "rhand");
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $1067
ARGP4
ADDRLP4 148
ADDRGP4 trap_G2API_AddBolt
INDIRP4
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 148
INDIRI4
ASGNI4
line 2592
;2592:		break;
ADDRGP4 $1061
JUMPV
LABELV $1068
line 2594
;2593:	case G2_MODELPART_LLEG:
;2594:		useBolt = self->bolt_LLeg;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
ASGNI4
line 2595
;2595:		break;
ADDRGP4 $1061
JUMPV
LABELV $1069
line 2597
;2596:	case G2_MODELPART_RLEG:
;2597:		useBolt = self->bolt_RLeg;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
ASGNI4
line 2598
;2598:		break;
ADDRGP4 $1061
JUMPV
LABELV $1060
line 2600
;2599:	default:
;2600:		useBolt = self->bolt_Head;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
ASGNI4
line 2601
;2601:		break;
LABELV $1061
line 2604
;2602:	}
;2603:
;2604:	VectorCopy(self->client->ps.origin, properOrigin);
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
line 2605
;2605:	VectorCopy(self->client->ps.viewangles, properAngles);
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
line 2608
;2606:
;2607:	//try to predict the origin based on velocity so it's more like what the client is seeing
;2608:	VectorCopy(self->client->ps.velocity, addVel);
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2609
;2609:	VectorNormalize(addVel);
ADDRLP4 76
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2611
;2610:
;2611:	if (self->client->ps.velocity[0] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1072
line 2612
;2612:	{
line 2613
;2613:		fVSpeed += (-self->client->ps.velocity[0]);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
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
line 2614
;2614:	}
ADDRGP4 $1073
JUMPV
LABELV $1072
line 2616
;2615:	else
;2616:	{
line 2617
;2617:		fVSpeed += self->client->ps.velocity[0];
ADDRLP4 0
ADDRLP4 0
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
line 2618
;2618:	}
LABELV $1073
line 2619
;2619:	if (self->client->ps.velocity[1] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1074
line 2620
;2620:	{
line 2621
;2621:		fVSpeed += (-self->client->ps.velocity[1]);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
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
line 2622
;2622:	}
ADDRGP4 $1075
JUMPV
LABELV $1074
line 2624
;2623:	else
;2624:	{
line 2625
;2625:		fVSpeed += self->client->ps.velocity[1];
ADDRLP4 0
ADDRLP4 0
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
line 2626
;2626:	}
LABELV $1075
line 2627
;2627:	if (self->client->ps.velocity[2] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1076
line 2628
;2628:	{
line 2629
;2629:		fVSpeed += (-self->client->ps.velocity[2]);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRFP4 0
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
line 2630
;2630:	}
ADDRGP4 $1077
JUMPV
LABELV $1076
line 2632
;2631:	else
;2632:	{
line 2633
;2633:		fVSpeed += self->client->ps.velocity[2];
ADDRLP4 0
ADDRLP4 0
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
line 2634
;2634:	}
LABELV $1077
line 2636
;2635:
;2636:	fVSpeed *= 0.08f;
ADDRLP4 0
CNSTF4 1034147594
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 2638
;2637:
;2638:	properOrigin[0] += addVel[0]*fVSpeed;
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 76
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2639
;2639:	properOrigin[1] += addVel[1]*fVSpeed;
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 76+4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2640
;2640:	properOrigin[2] += addVel[2]*fVSpeed;
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 76+8
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2642
;2641:
;2642:	properAngles[0] = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 2643
;2643:	properAngles[1] = self->client->ps.viewangles[YAW];
ADDRLP4 4+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 2644
;2644:	properAngles[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 2646
;2645:
;2646:	AnglesToAxis( properAngles, legAxis );
ADDRLP4 4
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2647
;2647:	G_G2PlayerAngles( self, legAxis, properAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_G2PlayerAngles
CALLV
pop
line 2649
;2648:
;2649:	trap_G2API_GetBoltMatrix(self->client->ghoul2, 0, useBolt, &boltMatrix, properAngles, properOrigin, level.time, NULL, vec3_origin); // not using nowTime here because using it on G2 made the server have extreme hitches and idk the cause
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 2651
;2650:
;2651:	boltPoint[0] = boltMatrix.matrix[0][3];
ADDRFP4 4
INDIRP4
ADDRLP4 28+12
INDIRF4
ASGNF4
line 2652
;2652:	boltPoint[1] = boltMatrix.matrix[1][3];
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 28+16+12
INDIRF4
ASGNF4
line 2653
;2653:	boltPoint[2] = boltMatrix.matrix[2][3];
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 28+32+12
INDIRF4
ASGNF4
line 2655
;2654:
;2655:	if ( jk2gameplay != VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1090
line 2656
;2656:	{
line 2657
;2657:		trap_G2API_GetBoltMatrix(self->client->ghoul2, 1, 0, &boltMatrix, properAngles, properOrigin, level.time, NULL, vec3_origin); // not using nowTime here because using it on G2 made the server have extreme hitches and idk the cause
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 28
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 2659
;2658:
;2659:		if (self->client && limbType == G2_MODELPART_RHAND)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1093
ADDRFP4 8
INDIRI4
CNSTI4 14
NEI4 $1093
line 2660
;2660:		{ //Make some saber hit sparks over the severed wrist area
line 2664
;2661:			vec3_t boltAngles;
;2662:			gentity_t *te;
;2663:
;2664:			boltAngles[0] = -boltMatrix.matrix[0][1];
ADDRLP4 152
ADDRLP4 28+4
INDIRF4
NEGF4
ASGNF4
line 2665
;2665:			boltAngles[1] = -boltMatrix.matrix[1][1];
ADDRLP4 152+4
ADDRLP4 28+16+4
INDIRF4
NEGF4
ASGNF4
line 2666
;2666:			boltAngles[2] = -boltMatrix.matrix[2][1];
ADDRLP4 152+8
ADDRLP4 28+32+4
INDIRF4
NEGF4
ASGNF4
line 2668
;2667:
;2668:			te = G_TempEntity( boltPoint, EV_SABER_HIT );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 164
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 164
INDIRP4
ASGNP4
line 2670
;2669:
;2670:			VectorCopy(boltPoint, te->s.origin);
ADDRLP4 148
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2671
;2671:			VectorCopy(boltAngles, te->s.angles);
ADDRLP4 148
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 152
INDIRB
ASGNB 12
line 2673
;2672:		
;2673:			if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 168
ADDRLP4 148
INDIRP4
ASGNP4
ADDRLP4 172
CNSTF4 0
ASGNF4
ADDRLP4 168
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 172
INDIRF4
NEF4 $1102
ADDRLP4 168
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 172
INDIRF4
NEF4 $1102
ADDRLP4 168
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 172
INDIRF4
NEF4 $1102
line 2674
;2674:			{ //don't let it play with no direction
line 2675
;2675:				te->s.angles[1] = 1;
ADDRLP4 148
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 2676
;2676:			}
LABELV $1102
line 2678
;2677:
;2678:			te->s.eventParm = 16; //lots of sparks
ADDRLP4 148
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 16
ASGNI4
line 2679
;2679:		}
LABELV $1093
line 2680
;2680:	}
LABELV $1090
line 2681
;2681:}
LABELV $1051
endproc G_GetDismemberBolt 176 36
export G_Dismember
proc G_Dismember 128 20
line 2684
;2682:
;2683:void G_Dismember( gentity_t *ent, vec3_t point, int limbType, float limbRollBase, float limbPitchBase, int deathAnim )
;2684:{
line 2688
;2685:	vec3_t	dir, newPoint, vel;
;2686:	gentity_t *limb;
;2687:
;2688:	VectorCopy( point, newPoint );
ADDRLP4 28
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2689
;2689:	limb = G_Spawn();
ADDRLP4 40
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ASGNP4
line 2690
;2690:	G_SetClassName(limb, "playerlimb");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1105
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 2691
;2691:	G_SetOrigin( limb, newPoint );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2692
;2692:	VectorCopy( newPoint, limb->s.pos.trBase );
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRB
ASGNB 12
line 2693
;2693:	limb->think = LimbThink;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 LimbThink
ASGNP4
line 2694
;2694:	limb->touch = LimbTouch;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 LimbTouch
ASGNP4
line 2695
;2695:	limb->speed = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 4000, 8000, qfalse, 6000);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 4000
ARGI4
CNSTI4 8000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 6000
ARGI4
ADDRLP4 44
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 2696
;2696:	limb->nextthink = level.time + FRAMETIME;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2699
;2697:
;2698:	//need size, contents, clipmask
;2699:	limb->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 2700
;2700:	limb->clipmask = MASK_SOLID;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 1
ASGNI4
line 2701
;2701:	limb->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 2702
;2702:	if ( jk2gameplay != VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1108
line 2703
;2703:	{
line 2704
;2704:		VectorSet( limb->r.mins, -6.0f, -6.0f, -9.0f );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3233808384
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3233808384
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3239051264
ASGNF4
line 2705
;2705:		VectorSet( limb->r.maxs, 6.0f, 6.0f, 6.0f );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1086324736
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1086324736
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1086324736
ASGNF4
line 2706
;2706:	}
ADDRGP4 $1109
JUMPV
LABELV $1108
line 2708
;2707:	else
;2708:	{
line 2709
;2709:		VectorSet( limb->r.mins, -3.0f, -3.0f, -3.0f );
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
line 2710
;2710:		VectorSet( limb->r.maxs, 3.0f, 3.0f, 3.0f );
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
line 2711
;2711:	}
LABELV $1109
line 2716
;2712://	VectorClear(limb->r.mins);
;2713://	VectorClear(limb->r.maxs);
;2714:
;2715:	//move it
;2716:	limb->s.eType = ET_GENERAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2717
;2717:	limb->s.weapon = G2_MODEL_PART;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 50
ASGNI4
line 2719
;2718:
;2719:	if (limbType == G2_MODELPART_HEAD)
ADDRFP4 8
INDIRI4
CNSTI4 10
NEI4 $1110
line 2720
;2720:	{
line 2721
;2721:		limb->bounceCount = 2;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 2
ASGNI4
line 2722
;2722:	}
ADDRGP4 $1111
JUMPV
LABELV $1110
line 2724
;2723:	else
;2724:	{
line 2725
;2725:		limb->bounceCount = 1;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 1
ASGNI4
line 2726
;2726:	}
LABELV $1111
line 2727
;2727:	limb->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2728
;2728:	limb->s.pos.trTime = level.time;								// move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2729
;2729:	VectorSubtract( point, ent->r.currentOrigin, dir );
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2730
;2730:	VectorNormalize( dir );
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2731
;2731:	if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1115
line 2732
;2732:	{
line 2733
;2733:		VectorCopy(ent->client->ps.velocity, vel);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2734
;2734:	}
ADDRGP4 $1116
JUMPV
LABELV $1115
line 2736
;2735:	else
;2736:	{
line 2737
;2737:		VectorCopy(ent->s.pos.trDelta, vel);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 2738
;2738:	}
LABELV $1116
line 2739
;2739:	VectorMA( vel, 100, dir, limb->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 16
INDIRF4
CNSTF4 1120403456
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16+4
INDIRF4
CNSTF4 1120403456
ADDRLP4 4+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 16+8
INDIRF4
CNSTF4 1120403456
ADDRLP4 4+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2742
;2740:
;2741:	//add some vertical velocity
;2742:	if ((limbType == G2_MODELPART_HEAD ||
ADDRLP4 56
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 10
EQI4 $1123
ADDRLP4 56
INDIRI4
CNSTI4 11
NEI4 $1121
LABELV $1123
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1121
line 2744
;2743:		limbType == G2_MODELPART_WAIST) && jk2gameplay != VERSION_1_02)
;2744:	{
line 2745
;2745:		limb->s.pos.trDelta[2] += 100;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 2746
;2746:	}
LABELV $1121
line 2749
;2747:
;2748:	//make it bounce some
;2749:	limb->s.eFlags |= EF_BOUNCE_HALF;
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
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 2752
;2750:	//no trDuration?
;2751:	//spin it
;2752:	VectorClear( limb->s.apos.trBase );
ADDRLP4 68
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 68
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 68
INDIRF4
ASGNF4
line 2758
;2753:	/*
;2754:	limb->s.apos.trBase[0] = limbPitchBase;
;2755:	limb->s.apos.trBase[1] = ent->client->ps.viewangles[1];
;2756:	limb->s.apos.trBase[2] = limbRollBase;
;2757:	*/
;2758:	if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1124
line 2759
;2759:	{
line 2760
;2760:		limb->s.apos.trBase[1] = ent->client->ps.viewangles[1];
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 2761
;2761:	}
ADDRGP4 $1125
JUMPV
LABELV $1124
line 2763
;2762:	else
;2763:	{
line 2764
;2764:		limb->s.apos.trBase[1] = ent->r.currentAngles[1];
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRF4
ASGNF4
line 2765
;2765:	}
LABELV $1125
line 2767
;2766:
;2767:	VectorClear( limb->s.apos.trDelta );
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 76
INDIRF4
ASGNF4
line 2769
;2768:
;2769:	if ( jk2gameplay == VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1126
line 2770
;2770:	{
line 2771
;2771:		limb->s.apos.trDelta[0] = Q_irandExpectedIf(gRandomUnlockAdd, -300, 300, qfalse, 0 );
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 -300
ARGI4
CNSTI4 300
ARGI4
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 84
INDIRI4
CVIF4 4
ASGNF4
line 2772
;2772:		limb->s.apos.trDelta[2] = Q_irandExpectedIf(gRandomUnlockAdd, -300, 300, qfalse, 0 );
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 -300
ARGI4
CNSTI4 300
ARGI4
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 92
INDIRI4
CVIF4 4
ASGNF4
line 2773
;2773:		limb->s.apos.trDelta[1] = Q_irandExpectedIf(gRandomUnlockAdd, -300, 300, qfalse, 0 );
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 -300
ARGI4
CNSTI4 300
ARGI4
ADDRLP4 96
CNSTI4 0
ASGNI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 100
INDIRI4
CVIF4 4
ASGNF4
line 2775
;2774:
;2775:		if (limbType == G2_MODELPART_WAIST)
ADDRFP4 8
INDIRI4
CNSTI4 11
NEI4 $1127
line 2776
;2776:		{
line 2777
;2777:			limb->s.apos.trDelta[0] = Q_irandExpectedIf(gRandomUnlockAdd, -60, 60, qfalse, 0 );
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 -60
ARGI4
CNSTI4 60
ARGI4
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 108
INDIRI4
CVIF4 4
ASGNF4
line 2778
;2778:			limb->s.apos.trDelta[2] = Q_irandExpectedIf(gRandomUnlockAdd, -60, 60, qfalse, 0 );
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 -60
ARGI4
CNSTI4 60
ARGI4
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 116
INDIRI4
CVIF4 4
ASGNF4
line 2779
;2779:			limb->s.apos.trDelta[1] = Q_irandExpectedIf(gRandomUnlockAdd, -60, 60, qfalse, 0 );
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 -60
ARGI4
CNSTI4 60
ARGI4
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 124
INDIRI4
CVIF4 4
ASGNF4
line 2780
;2780:		}
line 2781
;2781:	}
ADDRGP4 $1127
JUMPV
LABELV $1126
line 2783
;2782:	else
;2783:	{
line 2784
;2784:		VectorClear(limb->s.apos.trDelta);
ADDRLP4 84
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 84
INDIRF4
ASGNF4
line 2785
;2785:	}
LABELV $1127
line 2787
;2786:
;2787:	limb->s.apos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2788
;2788:	limb->s.apos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 2790
;2789:
;2790:	limb->s.modelGhoul2 = /*limbType*/MV_VersionMagic_g2ModelParts(limbType); // MVSDK: As we don't need the "modelGhoul2" of this limb on the serverside anymore we can just convert it to the appropriate value of the jk2version we are running in, without the need to convert it back later...
ADDRGP4 jk2startversion
INDIRI4
CNSTI4 2
EQI4 $1133
ADDRLP4 80
ADDRFP4 8
INDIRI4
ASGNI4
ADDRGP4 $1134
JUMPV
LABELV $1133
ADDRFP4 8
INDIRI4
CNSTI4 14
LTI4 $1135
ADDRLP4 84
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1136
JUMPV
LABELV $1135
ADDRLP4 84
ADDRFP4 8
INDIRI4
ASGNI4
LABELV $1136
ADDRLP4 80
ADDRLP4 84
INDIRI4
ASGNI4
LABELV $1134
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 2791
;2791:	limb->s.g2radius = 200;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 200
ASGNI4
line 2792
;2792:	if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1137
line 2793
;2793:	{
line 2794
;2794:		limb->s.modelindex = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2795
;2795:		limb->s.modelindex2 = deathAnim;
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 20
INDIRI4
ASGNI4
line 2796
;2796:	}
ADDRGP4 $1138
JUMPV
LABELV $1137
line 2798
;2797:	else
;2798:	{
line 2799
;2799:		limb->s.modelindex = -1;
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 -1
ASGNI4
line 2800
;2800:		if ( jk2startversion == VERSION_1_04 ) limb->s.otherEntityNum2 = ent->s.number;
ADDRGP4 jk2startversion
INDIRI4
CNSTI4 4
NEI4 $1139
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRGP4 $1140
JUMPV
LABELV $1139
line 2801
;2801:		else								   limb->s.modelindex2 = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $1140
line 2802
;2802:	}
LABELV $1138
line 2804
;2803:
;2804:	trap_LinkEntity( limb );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2805
;2805:}
LABELV $1104
endproc G_Dismember 128 20
export DismembermentTest
proc DismembermentTest 16 24
line 2808
;2806:
;2807:void DismembermentTest(gentity_t *self)
;2808:{
line 2809
;2809:	int sect = G2_MODELPART_HEAD;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 2811
;2810:	vec3_t boltPoint;
;2811:	G_GetDismemberBolt(self, boltPoint, sect);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_GetDismemberBolt
CALLV
pop
line 2812
;2812:	G_Dismember( self, boltPoint, sect, 90, 0, BOTH_DEATH1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTF4 1119092736
ARGF4
CNSTF4 0
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 G_Dismember
CALLV
pop
line 2813
;2813:}
LABELV $1141
endproc DismembermentTest 16 24
export DismembermentByNum
proc DismembermentByNum 20 24
line 2816
;2814:
;2815:void DismembermentByNum(gentity_t *self, int num)
;2816:{
line 2817
;2817:	int sect = G2_MODELPART_HEAD;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 2820
;2818:	vec3_t boltPoint;
;2819:
;2820:	switch (num)
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $1144
ADDRLP4 16
INDIRI4
CNSTI4 6
GTI4 $1144
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1152
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1152
address $1145
address $1146
address $1147
address $1148
address $1149
address $1150
address $1151
code
line 2821
;2821:	{
LABELV $1145
line 2823
;2822:	case 0:
;2823:		sect = G2_MODELPART_HEAD;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 2824
;2824:		break;
ADDRGP4 $1144
JUMPV
LABELV $1146
line 2826
;2825:	case 1:
;2826:		sect = G2_MODELPART_WAIST;
ADDRLP4 0
CNSTI4 11
ASGNI4
line 2827
;2827:		break;
ADDRGP4 $1144
JUMPV
LABELV $1147
line 2829
;2828:	case 2:
;2829:		sect = G2_MODELPART_LARM;
ADDRLP4 0
CNSTI4 12
ASGNI4
line 2830
;2830:		break;
ADDRGP4 $1144
JUMPV
LABELV $1148
line 2832
;2831:	case 3:
;2832:		sect = G2_MODELPART_RARM;
ADDRLP4 0
CNSTI4 13
ASGNI4
line 2833
;2833:		break;
ADDRGP4 $1144
JUMPV
LABELV $1149
line 2835
;2834:	case 4:
;2835:		sect = G2_MODELPART_RHAND;
ADDRLP4 0
CNSTI4 14
ASGNI4
line 2836
;2836:		break;
ADDRGP4 $1144
JUMPV
LABELV $1150
line 2838
;2837:	case 5:
;2838:		sect = G2_MODELPART_LLEG;
ADDRLP4 0
CNSTI4 15
ASGNI4
line 2839
;2839:		break;
ADDRGP4 $1144
JUMPV
LABELV $1151
line 2841
;2840:	case 6:
;2841:		sect = G2_MODELPART_RLEG;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 2842
;2842:		break;
line 2844
;2843:	default:
;2844:		break;
LABELV $1144
line 2847
;2845:	}
;2846:
;2847:	G_GetDismemberBolt(self, boltPoint, sect);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_GetDismemberBolt
CALLV
pop
line 2848
;2848:	G_Dismember( self, boltPoint, sect, 90, 0, BOTH_DEATH1 );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTF4 1119092736
ARGF4
CNSTF4 0
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 G_Dismember
CALLV
pop
line 2849
;2849:}
LABELV $1142
endproc DismembermentByNum 20 24
lit
align 4
LABELV $1154
byte 4 0
byte 4 0
byte 4 0
export G_GetHitQuad
code
proc G_GetHitQuad 68 16
line 2852
;2850:
;2851:int G_GetHitQuad( gentity_t *self, vec3_t hitloc )
;2852:{
line 2853
;2853:	vec3_t diff, fwdangles={0,0,0}, right;
ADDRLP4 36
ADDRGP4 $1154
INDIRB
ASGNB 12
line 2857
;2854:	vec3_t clEye;
;2855:	float rightdot;
;2856:	float zdiff;
;2857:	int hitLoc = -1;
ADDRLP4 48
CNSTI4 -1
ASGNI4
line 2859
;2858:
;2859:	if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1155
line 2860
;2860:	{
line 2861
;2861:		VectorCopy(self->client->ps.origin, clEye);
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
line 2862
;2862:		clEye[2] += self->client->ps.viewheight;
ADDRLP4 12+8
ADDRLP4 12+8
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
line 2863
;2863:	}
ADDRGP4 $1156
JUMPV
LABELV $1155
line 2865
;2864:	else
;2865:	{
line 2866
;2866:		VectorCopy(self->s.pos.trBase, clEye);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2867
;2867:		clEye[2] += 16;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2868
;2868:	}
LABELV $1156
line 2870
;2869:
;2870:	VectorSubtract( hitloc, clEye, diff );
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 2871
;2871:	diff[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2872
;2872:	VectorNormalize( diff );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2874
;2873:
;2874:	if (self->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1164
line 2875
;2875:	{
line 2876
;2876:		fwdangles[1] = self->client->ps.viewangles[1];
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 2877
;2877:	}
ADDRGP4 $1165
JUMPV
LABELV $1164
line 2879
;2878:	else
;2879:	{
line 2880
;2880:		fwdangles[1] = self->s.apos.trBase[1];
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ASGNF4
line 2881
;2881:	}
LABELV $1165
line 2883
;2882:	// Ultimately we might care if the shot was ahead or behind, but for now, just quadrant is fine.
;2883:	AngleVectors( fwdangles, NULL, right, NULL );
ADDRLP4 36
ARGP4
ADDRLP4 64
CNSTP4 0
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2885
;2884:
;2885:	rightdot = DotProduct(right, diff);
ADDRLP4 56
ADDRLP4 24
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2886
;2886:	zdiff = hitloc[2] - clEye[2];
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 2888
;2887:	
;2888:	if ( zdiff > 0 )
ADDRLP4 52
INDIRF4
CNSTF4 0
LEF4 $1173
line 2889
;2889:	{
line 2890
;2890:		if ( rightdot > 0.3 )
ADDRLP4 56
INDIRF4
CNSTF4 1050253722
LEF4 $1175
line 2891
;2891:		{
line 2892
;2892:			hitLoc = G2_MODELPART_RARM;
ADDRLP4 48
CNSTI4 13
ASGNI4
line 2893
;2893:		}
ADDRGP4 $1174
JUMPV
LABELV $1175
line 2894
;2894:		else if ( rightdot < -0.3 )
ADDRLP4 56
INDIRF4
CNSTF4 3197737370
GEF4 $1177
line 2895
;2895:		{
line 2896
;2896:			hitLoc = G2_MODELPART_LARM;
ADDRLP4 48
CNSTI4 12
ASGNI4
line 2897
;2897:		}
ADDRGP4 $1174
JUMPV
LABELV $1177
line 2899
;2898:		else
;2899:		{
line 2900
;2900:			hitLoc = G2_MODELPART_HEAD;
ADDRLP4 48
CNSTI4 10
ASGNI4
line 2901
;2901:		}
line 2902
;2902:	}
ADDRGP4 $1174
JUMPV
LABELV $1173
line 2903
;2903:	else if ( zdiff > -20 )
ADDRLP4 52
INDIRF4
CNSTF4 3248488448
LEF4 $1179
line 2904
;2904:	{
line 2905
;2905:		if ( rightdot > 0.1 )
ADDRLP4 56
INDIRF4
CNSTF4 1036831949
LEF4 $1181
line 2906
;2906:		{
line 2907
;2907:			hitLoc = G2_MODELPART_RARM;
ADDRLP4 48
CNSTI4 13
ASGNI4
line 2908
;2908:		}
ADDRGP4 $1180
JUMPV
LABELV $1181
line 2909
;2909:		else if ( rightdot < -0.1 )
ADDRLP4 56
INDIRF4
CNSTF4 3184315597
GEF4 $1183
line 2910
;2910:		{
line 2911
;2911:			hitLoc = G2_MODELPART_LARM;
ADDRLP4 48
CNSTI4 12
ASGNI4
line 2912
;2912:		}
ADDRGP4 $1180
JUMPV
LABELV $1183
line 2914
;2913:		else
;2914:		{
line 2915
;2915:			hitLoc = G2_MODELPART_HEAD;
ADDRLP4 48
CNSTI4 10
ASGNI4
line 2916
;2916:		}
line 2917
;2917:	}
ADDRGP4 $1180
JUMPV
LABELV $1179
line 2919
;2918:	else
;2919:	{
line 2920
;2920:		if ( rightdot >= 0 )
ADDRLP4 56
INDIRF4
CNSTF4 0
LTF4 $1185
line 2921
;2921:		{
line 2922
;2922:			hitLoc = G2_MODELPART_RLEG;
ADDRLP4 48
CNSTI4 16
ASGNI4
line 2923
;2923:		}
ADDRGP4 $1186
JUMPV
LABELV $1185
line 2925
;2924:		else
;2925:		{
line 2926
;2926:			hitLoc = G2_MODELPART_LLEG;
ADDRLP4 48
CNSTI4 15
ASGNI4
line 2927
;2927:		}
LABELV $1186
line 2928
;2928:	}
LABELV $1180
LABELV $1174
line 2930
;2929:
;2930:	return hitLoc;
ADDRLP4 48
INDIRI4
RETI4
LABELV $1153
endproc G_GetHitQuad 68 16
data
export gGAvoidDismember
align 4
LABELV gGAvoidDismember
byte 4 0
export G_CheckForDismemberment
code
proc G_CheckForDismemberment 32 24
line 2936
;2931:}
;2932:
;2933:int gGAvoidDismember = 0;
;2934:
;2935:void G_CheckForDismemberment(gentity_t *ent, vec3_t point, int damage, int deathAnim)
;2936:{
line 2937
;2937:	int hitLoc, hitLocUse = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 2939
;2938:	vec3_t boltPoint;
;2939:	int dismember = g_dismember.integer;
ADDRLP4 4
ADDRGP4 g_dismember+12
INDIRI4
ASGNI4
line 2941
;2940:
;2941:	if (!dismember)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1189
line 2942
;2942:	{
line 2943
;2943:		return;
ADDRGP4 $1187
JUMPV
LABELV $1189
line 2946
;2944:	}
;2945:
;2946:	if (gGAvoidDismember == 1)
ADDRGP4 gGAvoidDismember
INDIRI4
CNSTI4 1
NEI4 $1191
line 2947
;2947:	{
line 2948
;2948:		return;
ADDRGP4 $1187
JUMPV
LABELV $1191
line 2952
;2949:	}
;2950:
;2951:	// if (gGAvoidDismember != 2)
;2952:	{ //this means do the dismemberment regardless of randomness and damage
line 2953
;2953:		if (Q_irand(0, 100 + gRandomUnlockAdd, qfalse, 50) > dismember)
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 100
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 50
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $1193
line 2954
;2954:		{
line 2955
;2955:			return;
ADDRGP4 $1187
JUMPV
LABELV $1193
line 2958
;2956:		}
;2957:
;2958:		if (damage < 20)
ADDRFP4 8
INDIRI4
CNSTI4 20
GEI4 $1195
line 2959
;2959:		{
line 2960
;2960:			return;
ADDRGP4 $1187
JUMPV
LABELV $1195
line 2962
;2961:		}
;2962:	}
line 2964
;2963:
;2964:	if (gGAvoidDismember == 2)
ADDRGP4 gGAvoidDismember
INDIRI4
CNSTI4 2
NEI4 $1197
line 2965
;2965:	{
line 2966
;2966:		hitLoc = HL_HAND_RT;
ADDRLP4 8
CNSTI4 14
ASGNI4
line 2967
;2967:	}
ADDRGP4 $1198
JUMPV
LABELV $1197
line 2969
;2968:	else
;2969:	{
line 2970
;2970:		hitLoc = G_GetHitLocation( ent, point );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_GetHitLocation
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 2971
;2971:	}
LABELV $1198
line 2973
;2972:
;2973:	switch(hitLoc)
ADDRLP4 24
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
LTI4 $1199
ADDRLP4 24
INDIRI4
CNSTI4 16
GTI4 $1199
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1208-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1208
address $1201
address $1202
address $1201
address $1202
address $1203
address $1199
address $1199
address $1199
address $1199
address $1199
address $1199
address $1204
address $1206
address $1205
address $1206
address $1207
code
line 2974
;2974:	{
LABELV $1201
line 2977
;2975:	case HL_FOOT_RT:
;2976:	case HL_LEG_RT:
;2977:		hitLocUse = G2_MODELPART_RLEG;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 2978
;2978:		break;
ADDRGP4 $1200
JUMPV
LABELV $1202
line 2981
;2979:	case HL_FOOT_LT:
;2980:	case HL_LEG_LT:
;2981:		hitLocUse = G2_MODELPART_LLEG;
ADDRLP4 0
CNSTI4 15
ASGNI4
line 2982
;2982:		break;
ADDRGP4 $1200
JUMPV
LABELV $1203
line 2985
;2983:		
;2984:	case HL_WAIST:
;2985:		hitLocUse = G2_MODELPART_WAIST;
ADDRLP4 0
CNSTI4 11
ASGNI4
line 2986
;2986:		break;
ADDRGP4 $1200
JUMPV
LABELV $1204
line 2997
;2987:		/*
;2988:	case HL_BACK_RT:
;2989:	case HL_BACK_LT:
;2990:	case HL_BACK:
;2991:	case HL_CHEST_RT:
;2992:	case HL_CHEST_LT:
;2993:	case HL_CHEST:
;2994:		break;
;2995:		*/
;2996:	case HL_ARM_RT:
;2997:		hitLocUse = G2_MODELPART_RARM;
ADDRLP4 0
CNSTI4 13
ASGNI4
line 2998
;2998:		break;
ADDRGP4 $1200
JUMPV
LABELV $1205
line 3000
;2999:	case HL_HAND_RT:
;3000:		hitLocUse = G2_MODELPART_RHAND;
ADDRLP4 0
CNSTI4 14
ASGNI4
line 3001
;3001:		break;
ADDRGP4 $1200
JUMPV
LABELV $1206
line 3004
;3002:	case HL_ARM_LT:
;3003:	case HL_HAND_LT:
;3004:		hitLocUse = G2_MODELPART_LARM;
ADDRLP4 0
CNSTI4 12
ASGNI4
line 3005
;3005:		break;
ADDRGP4 $1200
JUMPV
LABELV $1207
line 3007
;3006:	case HL_HEAD:
;3007:		hitLocUse = G2_MODELPART_HEAD;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 3008
;3008:		break;
ADDRGP4 $1200
JUMPV
LABELV $1199
line 3010
;3009:	default:
;3010:		hitLocUse = G_GetHitQuad(ent, point);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_GetHitQuad
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 3011
;3011:		break;
LABELV $1200
line 3014
;3012:	}
;3013:
;3014:	if (hitLocUse == -1)
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $1210
line 3015
;3015:	{
line 3016
;3016:		return;
ADDRGP4 $1187
JUMPV
LABELV $1210
line 3019
;3017:	}
;3018:
;3019:	if (ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1212
line 3020
;3020:	{
line 3021
;3021:		G_GetDismemberBolt(ent, boltPoint, hitLocUse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_GetDismemberBolt
CALLV
pop
line 3022
;3022:		if ( g_austrian.integer 
ADDRGP4 g_austrian+12
INDIRI4
CNSTI4 0
EQI4 $1213
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1213
line 3024
;3023:			&& g_gametype.integer == GT_TOURNAMENT )
;3024:		{
line 3025
;3025:			G_LogPrintf( "Duel Dismemberment: %s dismembered at %s\n", ent->client->pers.netname, hitLocName[hitLoc] );
ADDRGP4 $1218
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 hitLocName
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 3026
;3026:		}
line 3027
;3027:	}
ADDRGP4 $1213
JUMPV
LABELV $1212
line 3029
;3028:	else
;3029:	{
line 3030
;3030:		G_GetDismemberLoc(ent, boltPoint, hitLocUse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_GetDismemberLoc
CALLV
pop
line 3031
;3031:	}
LABELV $1213
line 3032
;3032:	G_Dismember(ent, boltPoint, hitLocUse, 90, 0, deathAnim);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTF4 1119092736
ARGF4
CNSTF4 0
ARGF4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 G_Dismember
CALLV
pop
line 3033
;3033:}
LABELV $1187
endproc G_CheckForDismemberment 32 24
export G_ThereIsAMaster
proc G_ThereIsAMaster 20 0
line 3036
;3034:
;3035:qboolean G_ThereIsAMaster(void)
;3036:{
line 3037
;3037:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1221
JUMPV
LABELV $1220
line 3041
;3038:	gentity_t *ent;
;3039:
;3040:	while (i < MAX_CLIENTS)
;3041:	{
line 3042
;3042:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3044
;3043:
;3044:		if (ent && ent->client && ent->client->ps.isJediMaster)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $1223
ADDRLP4 16
ADDRLP4 0
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
EQU4 $1223
ADDRLP4 16
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1223
line 3045
;3045:		{
line 3046
;3046:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1219
JUMPV
LABELV $1223
line 3049
;3047:		}
;3048:
;3049:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3050
;3050:	}
LABELV $1221
line 3040
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1220
line 3052
;3051:
;3052:	return qfalse;
CNSTI4 0
RETI4
LABELV $1219
endproc G_ThereIsAMaster 20 0
export G_Kill
proc G_Kill 16 20
line 3055
;3053:}
;3054:
;3055:void G_Kill(gentity_t* ent) {
line 3065
;3056:
;3057:	//OSP: pause
;3058:	//if (level.pause.state != PAUSE_NONE && ent->client && !ent->client->sess.raceMode) {
;3059:	//	return;
;3060:	//}
;3061:
;3062:	//if (ent->client && ent->client->sess.raceMode)
;3063:	//	DeletePlayerProjectiles(ent); //Not sure how ppl could realisticly abuse this.. but might as well add it
;3064:
;3065:	ent->flags &= ~FL_GODMODE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 3066
;3066:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 -999
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 3067
;3067:	player_die(ent, ent, ent, 100000, MOD_SUICIDE);
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
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 35
ARGI4
ADDRGP4 player_die
CALLV
pop
line 3068
;3068:}
LABELV $1225
endproc G_Kill 16 20
export G_Damage
proc G_Damage 352 32
line 3097
;3069:
;3070:/*
;3071:============
;3072:T_Damage
;3073:
;3074:targ		entity that is being damaged
;3075:inflictor	entity that is causing the damage
;3076:attacker	entity that caused the inflictor to damage targ
;3077:	example: targ=monster, inflictor=rocket, attacker=player
;3078:
;3079:dir			direction of the attack for knockback
;3080:point		point at which the damage is being inflicted, used for headshots
;3081:damage		amount of damage being inflicted
;3082:knockback	force to be applied against targ as a result of the damage
;3083:
;3084:inflictor, attacker, dir, and point can be NULL for environmental effects
;3085:
;3086:dflags		these flags are used to control how T_Damage works
;3087:	DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;3088:	DAMAGE_NO_ARMOR			armor does not protect from this damage
;3089:	DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;3090:	DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;3091:	DAMAGE_HALF_ABSORB		half shields, half health
;3092:	DAMAGE_HALF_ARMOR_REDUCTION		Any damage that shields incur is halved
;3093:============
;3094:*/
;3095:extern void G_LetGoOfWall(gentity_t* ent);
;3096:void G_Damage( gentity_t *targ, gentity_t *inflictor, gentity_t *attacker,
;3097:			   vec3_t dir, vec3_t point, int damage, int dflags, int mod ) {
line 3103
;3098:	gclient_t	*client;
;3099:	int			take;
;3100:	int			asave;
;3101:	int			knockback;
;3102:	int			max;
;3103:	int			subamt = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 3104
;3104:	float		famt = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
line 3105
;3105:	float		hamt = 0;
ADDRLP4 32
CNSTF4 0
ASGNF4
line 3106
;3106:	float		shieldAbsorbed = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 3107
;3107:	int			nowTime = inflictor ? LEVELTIME(inflictor->client) : level.time;
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1233
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
EQU4 $1235
ADDRLP4 56
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1235
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1237
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
ADDRGP4 $1238
JUMPV
LABELV $1237
ADDRLP4 52
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1238
ADDRLP4 48
ADDRLP4 52
INDIRI4
ASGNI4
ADDRGP4 $1236
JUMPV
LABELV $1235
ADDRLP4 48
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1236
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
ADDRGP4 $1234
JUMPV
LABELV $1233
ADDRLP4 44
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1234
ADDRLP4 40
ADDRLP4 44
INDIRI4
ASGNI4
line 3108
;3108:	int			nowTimeTarg = LEVELTIME(targ->client);
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1243
ADDRLP4 68
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1243
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1245
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1246
JUMPV
LABELV $1245
ADDRLP4 64
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1246
ADDRLP4 60
ADDRLP4 64
INDIRI4
ASGNI4
ADDRGP4 $1244
JUMPV
LABELV $1243
ADDRLP4 60
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1244
ADDRLP4 20
ADDRLP4 60
INDIRI4
ASGNI4
line 3110
;3109:
;3110:	if ( !targ /*|| !targ->client */) return;
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1247
ADDRGP4 $1226
JUMPV
LABELV $1247
line 3112
;3111:
;3112:	if (targ && targ->damageRedirect)
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1249
ADDRLP4 72
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1249
line 3113
;3113:	{
line 3114
;3114:		G_Damage(&g_entities[targ->damageRedirectTo], inflictor, attacker, dir, point, damage, dflags, mod);
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 864
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
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
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 3115
;3115:		return;
ADDRGP4 $1226
JUMPV
LABELV $1249
line 3118
;3116:	}
;3117:
;3118:	if (!targ->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1251
line 3119
;3119:		return;
ADDRGP4 $1226
JUMPV
LABELV $1251
line 3122
;3120:	}
;3121:
;3122:	if (targ && targ->client && targ->client->ps.duelInProgress)
ADDRLP4 76
ADDRFP4 0
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
EQU4 $1253
ADDRLP4 84
ADDRLP4 76
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $1253
ADDRLP4 84
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1253
line 3123
;3123:	{
line 3124
;3124:		if (attacker && attacker->client && attacker->s.number != targ->client->ps.duelIndex)
ADDRLP4 88
ADDRFP4 8
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
EQU4 $1255
ADDRLP4 96
CNSTI4 408
ASGNI4
ADDRLP4 88
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $1255
ADDRLP4 88
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
EQI4 $1255
line 3125
;3125:		{
line 3126
;3126:			return;
ADDRGP4 $1226
JUMPV
LABELV $1255
line 3128
;3127:		}
;3128:		else if (attacker && attacker->client && mod != MOD_SABER)
ADDRLP4 100
ADDRFP4 8
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
EQU4 $1257
ADDRLP4 100
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 104
INDIRU4
EQU4 $1257
ADDRFP4 28
INDIRI4
CNSTI4 3
EQI4 $1257
line 3129
;3129:		{
line 3130
;3130:			return;
ADDRGP4 $1226
JUMPV
LABELV $1257
line 3132
;3131:		}
;3132:	}
LABELV $1253
line 3133
;3133:	if (attacker && attacker->client && attacker->client->ps.duelInProgress)
ADDRLP4 88
ADDRFP4 8
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
EQU4 $1259
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
EQU4 $1259
ADDRLP4 96
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1259
line 3134
;3134:	{
line 3135
;3135:		if (targ && targ->client && targ->s.number != attacker->client->ps.duelIndex)
ADDRLP4 100
ADDRFP4 0
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
EQU4 $1261
ADDRLP4 108
CNSTI4 408
ASGNI4
ADDRLP4 100
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 104
INDIRU4
EQU4 $1261
ADDRLP4 100
INDIRP4
INDIRI4
ADDRFP4 8
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
EQI4 $1261
line 3136
;3136:		{
line 3137
;3137:			return;
ADDRGP4 $1226
JUMPV
LABELV $1261
line 3139
;3138:		}
;3139:		else if (targ && targ->client && mod != MOD_SABER)
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
CNSTU4 0
ASGNU4
ADDRLP4 112
INDIRP4
CVPU4 4
ADDRLP4 116
INDIRU4
EQU4 $1263
ADDRLP4 112
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 116
INDIRU4
EQU4 $1263
ADDRFP4 28
INDIRI4
CNSTI4 3
EQI4 $1263
line 3140
;3140:		{
line 3141
;3141:			return;
ADDRGP4 $1226
JUMPV
LABELV $1263
line 3143
;3142:		}
;3143:	}
LABELV $1259
line 3145
;3144:
;3145:	if (targ && targ->client && (targ->client->ps.fd.forcePowersActive & (1 << FP_RAGE)))
ADDRLP4 100
ADDRFP4 0
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
EQU4 $1265
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
EQU4 $1265
ADDRLP4 108
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1265
line 3146
;3146:	{
line 3147
;3147:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 3148
;3148:	}
LABELV $1265
line 3156
;3149:
;3150:	// japro: do i need this?
;3151:	//if ((g_gametype == GT_FFA) && !g_friendlyFire.value && (g_neutralFlag.integer && g_neutralFlag.integer < 4)) {
;3152:	//	if (attacker && attacker->client && !attacker->client->ps.duelInProgress && !attacker->client->ps.powerups[PW_NEUTRALFLAG] && targ && targ->client && !targ->client->ps.duelInProgress && !targ->client->sess.raceMode && !targ->client->ps.powerups[PW_NEUTRALFLAG])
;3153:	//		return;
;3154:	//}
;3155:
;3156:	if (attacker && attacker->client && attacker->client->sess.raceMode && !(dflags & DAMAGE_IN_RACEMODE) && !(targ && targ->damageindefrag) && !attacker->client->ps.duelInProgress) {
ADDRLP4 112
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 116
CNSTU4 0
ASGNU4
ADDRLP4 112
INDIRP4
CVPU4 4
ADDRLP4 116
INDIRU4
EQU4 $1267
ADDRLP4 120
ADDRLP4 112
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CVPU4 4
ADDRLP4 116
INDIRU4
EQU4 $1267
ADDRLP4 124
CNSTI4 0
ASGNI4
ADDRLP4 120
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $1267
ADDRFP4 24
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 124
INDIRI4
NEI4 $1267
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CVPU4 4
ADDRLP4 116
INDIRU4
EQU4 $1269
ADDRLP4 128
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
ADDRLP4 124
INDIRI4
NEI4 $1267
LABELV $1269
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1267
line 3164
;3157:		//if (attacker->client->ps.stats[STAT_MOVEMENTSTYLE] == MV_COOP_JKA) { //I think this is a bug
;3158:		//	//if (mod != MOD_BLASTER || (!targ->client || !targ->client->ps.stats[STAT_MOVEMENTSTYLE] != MV_COOP_JKA))
;3159:		//	return;
;3160:		//}
;3161:		//else 
;3162:		//if ((attacker->client->ps.stats[STAT_MOVEMENTSTYLE] != MV_RJQ3) && (attacker->client->ps.stats[STAT_MOVEMENTSTYLE] != MV_RJCPM) && (attacker->client->ps.stats[STAT_MOVEMENTSTYLE] != MV_JETPACK) && (attacker->client->ps.stats[STAT_MOVEMENTSTYLE] != MV_TRIBES)) //ignore self damage
;3163:		//	return; //ignore self damage if attacker is in racemode
;3164:		return;
ADDRGP4 $1226
JUMPV
LABELV $1267
line 3170
;3165:		//if (((attacker->client->ps.stats[STAT_MOVEMENTSTYLE] == MV_RJQ3) || (attacker->client->ps.stats[STAT_MOVEMENTSTYLE] == MV_RJCPM) || (attacker->client->ps.stats[STAT_MOVEMENTSTYLE] == MV_JETPACK) || (attacker->client->ps.stats[STAT_MOVEMENTSTYLE] == MV_TRIBES)) && targ->client && (targ != attacker)) {
;3166:		//	return; //ignore other damage if attacker is in racemode - why is this not returning for detpacking race->outof race
;3167:		//}
;3168:	}
;3169:
;3170:	if (targ && targ->client && targ->client->sess.raceMode && attacker != targ && mod != MOD_TRIGGER_HURT /*&& mod != MOD_CRUSH*/ /* && mod != MOD_LAVA */ && !(dflags & FAKE_DAMAGE_IN_RACEMODE) && (damage != Q3_INFINITE) && !targ->client->ps.duelInProgress && !(dflags & DAMAGE_IN_RACEMODE)) //Fixme, change this to get rid of dmg from doors/eles.. but only if they get made completely nonsolid first
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 132
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 140
CNSTU4 0
ASGNU4
ADDRLP4 136
INDIRU4
ADDRLP4 140
INDIRU4
EQU4 $1270
ADDRLP4 144
ADDRLP4 132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRU4
EQU4 $1270
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRLP4 144
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 148
INDIRI4
EQI4 $1270
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRLP4 136
INDIRU4
EQU4 $1270
ADDRFP4 28
INDIRI4
CNSTI4 37
EQI4 $1270
ADDRLP4 152
ADDRFP4 24
INDIRI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 148
INDIRI4
NEI4 $1270
ADDRFP4 20
INDIRI4
CNSTI4 16777216
EQI4 $1270
ADDRLP4 144
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 148
INDIRI4
NEI4 $1270
ADDRLP4 152
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 148
INDIRI4
NEI4 $1270
line 3171
;3171:		return; //ignore other damage if target is in racemode
ADDRGP4 $1226
JUMPV
LABELV $1270
line 3175
;3172:
;3173:	// the intermission has allready been qualified for, so don't
;3174:	// allow any extra scoring
;3175:	if ( level.intermissionQueued ) { //still let racers dmg themselves in the intermission delay time
ADDRGP4 level+9024
INDIRI4
CNSTI4 0
EQI4 $1272
line 3176
;3176:		if (targ->client && targ->client->sess.raceMode) {
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1226
ADDRLP4 156
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1226
line 3177
;3177:		}
line 3178
;3178:		else {
line 3179
;3179:			return;
LABELV $1276
line 3181
;3180:		}
;3181:	}
LABELV $1272
line 3182
;3182:	if ( !inflictor ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1277
line 3183
;3183:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+2403744
ASGNP4
line 3184
;3184:	}
LABELV $1277
line 3185
;3185:	if ( !attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1280
line 3186
;3186:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+2403744
ASGNP4
line 3187
;3187:	}
LABELV $1280
line 3192
;3188:
;3189:	// shootable doors / buttons don't actually have any health
;3190:
;3191:	//if boltpoint4 == 1 then it's glass or a breakable and those do have health
;3192:	if ( targ->s.eType == ET_MOVER && targ->boltpoint4 != 1 ) {
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $1283
ADDRLP4 156
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1283
line 3193
;3193:		if ( targ->use && targ->moverState == MOVER_POS1 ) {
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1226
ADDRLP4 160
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1226
line 3194
;3194:			targ->use( targ, inflictor, attacker );
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 164
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CALLV
pop
line 3195
;3195:		}
line 3196
;3196:		return;
ADDRGP4 $1226
JUMPV
LABELV $1283
line 3200
;3197:	}
;3198:	// reduce damage by the attacker's handicap value
;3199:	// unless they are rocket jumping
;3200:	if ( attacker->client && attacker != targ ) {
ADDRLP4 160
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1287
ADDRLP4 160
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $1287
line 3201
;3201:		max = attacker->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 36
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 3202
;3202:		damage = damage * max / 100;
ADDRFP4 20
ADDRFP4 20
INDIRI4
ADDRLP4 36
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 3203
;3203:	}
LABELV $1287
line 3205
;3204:
;3205:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 3207
;3206:
;3207:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1289
line 3208
;3208:		if ( client->noclip ) {
ADDRLP4 0
INDIRP4
CNSTI4 43600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1291
line 3209
;3209:			return;
ADDRGP4 $1226
JUMPV
LABELV $1291
line 3211
;3210:		}
;3211:	}
LABELV $1289
line 3213
;3212:
;3213:	if ( !dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1293
line 3214
;3214:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 3215
;3215:	} else {
ADDRGP4 $1294
JUMPV
LABELV $1293
line 3216
;3216:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3217
;3217:	}
LABELV $1294
line 3219
;3218:
;3219:	knockback = damage;
ADDRLP4 8
ADDRFP4 20
INDIRI4
ASGNI4
line 3220
;3220:	if ( knockback > 200 ) {
ADDRLP4 8
INDIRI4
CNSTI4 200
LEI4 $1295
line 3221
;3221:		knockback = 200;
ADDRLP4 8
CNSTI4 200
ASGNI4
line 3222
;3222:	}
LABELV $1295
line 3223
;3223:	if ( targ->flags & FL_NO_KNOCKBACK ) {
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1297
line 3224
;3224:		knockback = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3225
;3225:	}
LABELV $1297
line 3226
;3226:	if ( dflags & DAMAGE_NO_KNOCKBACK ) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1299
line 3227
;3227:		knockback = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3228
;3228:	}
LABELV $1299
line 3230
;3229:
;3230:	if (targ && targ->client && targ->client->ps.usingATST)
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 168
CNSTU4 0
ASGNU4
ADDRLP4 164
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1301
ADDRLP4 172
ADDRLP4 164
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CVPU4 4
ADDRLP4 168
INDIRU4
EQU4 $1301
ADDRLP4 172
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1301
line 3231
;3231:	{
line 3232
;3232:		knockback = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3233
;3233:	}
LABELV $1301
line 3236
;3234:
;3235:	// figure momentum add, even if the damage won't be taken
;3236:	if ( knockback && targ->client ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1303
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1303
line 3240
;3237:		vec3_t	kvel;
;3238:		float	mass;
;3239:
;3240:		mass = 200;
ADDRLP4 188
CNSTF4 1128792064
ASGNF4
line 3242
;3241:
;3242:		if (mod == MOD_SABER && jk2gameplay != VERSION_1_02)
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $1305
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1305
line 3243
;3243:		{
line 3244
;3244:			if (targ->client && targ->client->sess.raceMode) {
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1307
ADDRLP4 192
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1307
line 3245
;3245:				VectorScale(dir, 1000.0f * (float)knockback / mass, kvel);
ADDRLP4 196
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 200
CNSTF4 1148846080
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ADDRLP4 188
INDIRF4
DIVF4
ASGNF4
ADDRLP4 176
ADDRLP4 196
INDIRP4
INDIRF4
ADDRLP4 200
INDIRF4
MULF4
ASGNF4
ADDRLP4 176+4
ADDRLP4 196
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 200
INDIRF4
MULF4
ASGNF4
ADDRLP4 176+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1148846080
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ADDRLP4 188
INDIRF4
DIVF4
MULF4
ASGNF4
line 3246
;3246:			}
ADDRGP4 $1306
JUMPV
LABELV $1307
line 3247
;3247:			else {
line 3248
;3248:				VectorScale(dir, (g_knockback.value * (float)knockback / mass) * g_saberDmgVelocityScale.integer, kvel);
ADDRLP4 196
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 200
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 204
ADDRLP4 188
INDIRF4
ASGNF4
ADDRLP4 176
ADDRLP4 196
INDIRP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 200
INDIRF4
MULF4
ADDRLP4 204
INDIRF4
DIVF4
ADDRGP4 g_saberDmgVelocityScale+12
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
ADDRLP4 176+4
ADDRLP4 196
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 200
INDIRF4
MULF4
ADDRLP4 204
INDIRF4
DIVF4
ADDRGP4 g_saberDmgVelocityScale+12
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
ADDRLP4 176+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ADDRLP4 188
INDIRF4
DIVF4
ADDRGP4 g_saberDmgVelocityScale+12
INDIRI4
CVIF4 4
MULF4
MULF4
ASGNF4
line 3249
;3249:			}
line 3250
;3250:		}
ADDRGP4 $1306
JUMPV
LABELV $1305
line 3252
;3251:		else
;3252:		{
line 3253
;3253:			if (targ->client && targ->client->sess.raceMode)
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1319
ADDRLP4 192
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1319
line 3254
;3254:				VectorScale(dir, 1000.0f * (float)knockback / mass, kvel);
ADDRLP4 196
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 200
CNSTF4 1148846080
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ADDRLP4 188
INDIRF4
DIVF4
ASGNF4
ADDRLP4 176
ADDRLP4 196
INDIRP4
INDIRF4
ADDRLP4 200
INDIRF4
MULF4
ASGNF4
ADDRLP4 176+4
ADDRLP4 196
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 200
INDIRF4
MULF4
ASGNF4
ADDRLP4 176+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1148846080
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ADDRLP4 188
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRGP4 $1320
JUMPV
LABELV $1319
line 3256
;3255:			else
;3256:				VectorScale(dir, g_knockback.value * (float)knockback / mass, kvel);
ADDRLP4 204
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 208
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 212
ADDRLP4 188
INDIRF4
ASGNF4
ADDRLP4 176
ADDRLP4 204
INDIRP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 208
INDIRF4
MULF4
ADDRLP4 212
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 176+4
ADDRLP4 204
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 208
INDIRF4
MULF4
ADDRLP4 212
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 176+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
ADDRLP4 8
INDIRI4
CVIF4 4
MULF4
ADDRLP4 188
INDIRF4
DIVF4
MULF4
ASGNF4
LABELV $1320
line 3257
;3257:		}
LABELV $1306
line 3258
;3258:		VectorAdd (targ->client->ps.velocity, kvel, targ->client->ps.velocity);
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
ADDRLP4 176
INDIRF4
ADDF4
ASGNF4
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
ADDRLP4 176+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 200
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 200
INDIRP4
ADDRLP4 200
INDIRP4
INDIRF4
ADDRLP4 176+8
INDIRF4
ADDF4
ASGNF4
line 3260
;3259:
;3260:		if (attacker && attacker->client && attacker != targ)
ADDRLP4 204
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 208
ADDRLP4 204
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 212
CNSTU4 0
ASGNU4
ADDRLP4 208
INDIRU4
ADDRLP4 212
INDIRU4
EQU4 $1330
ADDRLP4 204
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 212
INDIRU4
EQU4 $1330
ADDRLP4 208
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $1330
line 3261
;3261:		{
line 3262
;3262:			targ->client->ps.otherKiller = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 3263
;3263:			targ->client->ps.otherKillerTime = nowTimeTarg + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
ADDRLP4 20
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 3264
;3264:			targ->client->ps.otherKillerDebounceTime = nowTimeTarg + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 20
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3265
;3265:		}
LABELV $1330
line 3268
;3266:		// set the timer so that the other client can't cancel
;3267:		// out the movement immediately
;3268:		if ( !targ->client->ps.pm_time && (g_saberDmgVelocityScale.integer || mod != MOD_SABER || jk2gameplay == VERSION_1_02) ) {
ADDRLP4 216
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 216
INDIRI4
NEI4 $1332
ADDRGP4 g_saberDmgVelocityScale+12
INDIRI4
ADDRLP4 216
INDIRI4
NEI4 $1336
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $1336
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1332
LABELV $1336
line 3271
;3269:			int		t;
;3270:
;3271:			t = knockback * 2;
ADDRLP4 220
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 3272
;3272:			if ( t < 50 ) {
ADDRLP4 220
INDIRI4
CNSTI4 50
GEI4 $1337
line 3273
;3273:				t = 50;
ADDRLP4 220
CNSTI4 50
ASGNI4
line 3274
;3274:			}
LABELV $1337
line 3275
;3275:			if ( t > 200 ) {
ADDRLP4 220
INDIRI4
CNSTI4 200
LEI4 $1339
line 3276
;3276:				t = 200;
ADDRLP4 220
CNSTI4 200
ASGNI4
line 3277
;3277:			}
LABELV $1339
line 3278
;3278:			targ->client->ps.pm_time = t;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 220
INDIRI4
ASGNI4
line 3279
;3279:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 224
INDIRP4
ADDRLP4 224
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 3280
;3280:		}
LABELV $1332
line 3281
;3281:	}
LABELV $1303
line 3283
;3282:
;3283:	if (targ->client && targ->client->sess.raceMode && mod == MOD_SABER)
ADDRLP4 176
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1341
ADDRLP4 176
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1341
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $1341
line 3284
;3284:	{ //add the shield effect and get out here (stops pain spam)
line 3285
;3285:		gentity_t* evEnt = G_TempEntity(targ->r.currentOrigin, EV_SHIELD_HIT);
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 97
ARGI4
ADDRLP4 184
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 180
ADDRLP4 184
INDIRP4
ASGNP4
line 3286
;3286:		evEnt->s.otherEntityNum = targ->s.number;
ADDRLP4 180
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3287
;3287:		evEnt->s.eventParm = DirToByte(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 188
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 180
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 188
INDIRI4
ASGNI4
line 3288
;3288:		evEnt->s.time2 = 100;
ADDRLP4 180
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 100
ASGNI4
line 3289
;3289:		return;
ADDRGP4 $1226
JUMPV
LABELV $1341
line 3292
;3290:	}
;3291:	
;3292:	if ( g_trueJedi.integer && client )
ADDRGP4 g_trueJedi+12
INDIRI4
CNSTI4 0
EQI4 $1343
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1343
line 3293
;3293:	{//less explosive damage for jedi, more saber damage for non-jedi
line 3294
;3294:		if ( client->ps.trueJedi )
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1346
line 3295
;3295:		{//if the target is a trueJedi, reduce splash and explosive damage to 1/2
line 3296
;3296:			switch ( mod )
ADDRLP4 180
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 12
LTI4 $1347
ADDRLP4 180
INDIRI4
CNSTI4 26
GTI4 $1347
ADDRLP4 180
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1354-48
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1354
address $1350
address $1350
address $1347
address $1350
address $1347
address $1350
address $1350
address $1350
address $1350
address $1350
address $1350
address $1350
address $1350
address $1350
address $1350
code
line 3297
;3297:			{
LABELV $1350
line 3311
;3298:			case MOD_REPEATER_ALT:
;3299:			case MOD_REPEATER_ALT_SPLASH:
;3300:			case MOD_DEMP2_ALT:
;3301:			case MOD_FLECHETTE_ALT_SPLASH:
;3302:			case MOD_ROCKET:
;3303:			case MOD_ROCKET_SPLASH:
;3304:			case MOD_ROCKET_HOMING:
;3305:			case MOD_ROCKET_HOMING_SPLASH:
;3306:			case MOD_THERMAL:
;3307:			case MOD_THERMAL_SPLASH:
;3308:			case MOD_TRIP_MINE_SPLASH:
;3309:			case MOD_TIMED_MINE_SPLASH:
;3310:			case MOD_DET_PACK_SPLASH:
;3311:				damage *= (jk2gameplay == VERSION_1_04 ? 0.75 : 0.5);
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1352
ADDRLP4 184
CNSTF4 1061158912
ASGNF4
ADDRGP4 $1353
JUMPV
LABELV $1352
ADDRLP4 184
CNSTF4 1056964608
ASGNF4
LABELV $1353
ADDRFP4 20
ADDRFP4 20
INDIRI4
CVIF4 4
ADDRLP4 184
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 3312
;3312:				break;
line 3314
;3313:			}
;3314:		}
ADDRGP4 $1347
JUMPV
LABELV $1346
line 3315
;3315:		else if ( client->ps.trueNonJedi && mod == MOD_SABER )
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1356
ADDRFP4 28
INDIRI4
CNSTI4 3
NEI4 $1356
line 3316
;3316:		{//if the target is a trueNonJedi, take more saber damage... combined with the 1.5 in the w_saber stuff, this is 6 times damage!
line 3317
;3317:			if ( damage < 100 )
ADDRFP4 20
INDIRI4
CNSTI4 100
GEI4 $1358
line 3318
;3318:			{
line 3319
;3319:				damage *= 4;
ADDRFP4 20
ADDRFP4 20
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 3320
;3320:				if ( damage > 100 )
ADDRFP4 20
INDIRI4
CNSTI4 100
LEI4 $1360
line 3321
;3321:				{
line 3322
;3322:					damage = 100;
ADDRFP4 20
CNSTI4 100
ASGNI4
line 3323
;3323:				}
LABELV $1360
line 3324
;3324:			}
LABELV $1358
line 3325
;3325:		}
LABELV $1356
LABELV $1347
line 3326
;3326:	}
LABELV $1343
line 3329
;3327:
;3328:	// check for completely getting out of the damage
;3329:	if ( !(dflags & DAMAGE_NO_PROTECTION) ) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $1362
line 3333
;3330:
;3331:		// if TF_NO_FRIENDLY_FIRE is set, don't do damage to the target
;3332:		// if the attacker was on the same team
;3333:		if ( targ != attacker && OnSameTeam (targ, attacker)  ) {
ADDRLP4 180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 184
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 180
INDIRP4
CVPU4 4
ADDRLP4 184
INDIRP4
CVPU4 4
EQU4 $1364
ADDRLP4 180
INDIRP4
ARGP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRLP4 188
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
EQI4 $1364
line 3334
;3334:			if ( !g_friendlyFire.integer ) {
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $1366
line 3335
;3335:				return;
ADDRGP4 $1226
JUMPV
LABELV $1366
line 3337
;3336:			}
;3337:		}
LABELV $1364
line 3339
;3338:
;3339:		if (targ->client && attacker->client && targ->client->sess.mode == MODE_IRONMAN && attacker->client->sess.mode == MODE_IRONMAN 
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
CNSTI4 408
ASGNI4
ADDRLP4 200
ADDRLP4 192
INDIRP4
ADDRLP4 196
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 204
CNSTU4 0
ASGNU4
ADDRLP4 200
INDIRP4
CVPU4 4
ADDRLP4 204
INDIRU4
EQU4 $1369
ADDRLP4 208
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 212
ADDRLP4 208
INDIRP4
ADDRLP4 196
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 212
INDIRP4
CVPU4 4
ADDRLP4 204
INDIRU4
EQU4 $1369
ADDRLP4 216
CNSTI4 43484
ASGNI4
ADDRLP4 220
CNSTI4 5
ASGNI4
ADDRLP4 200
INDIRP4
ADDRLP4 216
INDIRI4
ADDP4
INDIRI4
ADDRLP4 220
INDIRI4
NEI4 $1369
ADDRLP4 212
INDIRP4
ADDRLP4 216
INDIRI4
ADDP4
INDIRI4
ADDRLP4 220
INDIRI4
NEI4 $1369
ADDRLP4 224
CNSTI4 53188
ASGNI4
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRLP4 212
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRI4
ADDRLP4 228
INDIRI4
NEI4 $1369
ADDRLP4 200
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRI4
ADDRLP4 228
INDIRI4
NEI4 $1369
ADDRLP4 208
INDIRP4
CVPU4 4
ADDRLP4 192
INDIRP4
CVPU4 4
EQU4 $1369
line 3340
;3340:			&& !attacker->client->isIronMan && !targ->client->isIronMan && attacker != targ) {
line 3341
;3341:			return; // don't let "team mates" in iron man damage each other
ADDRGP4 $1226
JUMPV
LABELV $1369
line 3344
;3342:		}
;3343:
;3344:		if (g_gametype.integer == GT_JEDIMASTER && !g_friendlyFire.integer &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $1371
ADDRLP4 232
CNSTI4 0
ASGNI4
ADDRGP4 g_friendlyFire+12
INDIRI4
ADDRLP4 232
INDIRI4
NEI4 $1371
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 240
ADDRLP4 236
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 244
CNSTU4 0
ASGNU4
ADDRLP4 240
INDIRU4
ADDRLP4 244
INDIRU4
EQU4 $1371
ADDRLP4 248
CNSTI4 408
ASGNI4
ADDRLP4 252
ADDRLP4 236
INDIRP4
ADDRLP4 248
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CVPU4 4
ADDRLP4 244
INDIRU4
EQU4 $1371
ADDRLP4 256
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 260
ADDRLP4 256
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 260
INDIRU4
ADDRLP4 244
INDIRU4
EQU4 $1371
ADDRLP4 264
ADDRLP4 256
INDIRP4
ADDRLP4 248
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CVPU4 4
ADDRLP4 244
INDIRU4
EQU4 $1371
ADDRLP4 240
INDIRU4
ADDRLP4 260
INDIRU4
EQU4 $1371
ADDRLP4 268
CNSTI4 604
ASGNI4
ADDRLP4 252
INDIRP4
ADDRLP4 268
INDIRI4
ADDP4
INDIRI4
ADDRLP4 232
INDIRI4
NEI4 $1371
ADDRLP4 264
INDIRP4
ADDRLP4 268
INDIRI4
ADDP4
INDIRI4
ADDRLP4 232
INDIRI4
NEI4 $1371
ADDRLP4 272
ADDRGP4 G_ThereIsAMaster
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $1371
line 3348
;3345:			targ && targ->client && attacker && attacker->client &&
;3346:			targ != attacker && !targ->client->ps.isJediMaster && !attacker->client->ps.isJediMaster &&
;3347:			G_ThereIsAMaster())
;3348:		{
line 3349
;3349:			return;
ADDRGP4 $1226
JUMPV
LABELV $1371
line 3352
;3350:		}
;3351:
;3352:		if (targ->client && targ->s.shouldtarget && targ->s.teamowner &&
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 280
CNSTI4 408
ASGNI4
ADDRLP4 284
CNSTU4 0
ASGNU4
ADDRLP4 276
INDIRP4
ADDRLP4 280
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 284
INDIRU4
EQU4 $1375
ADDRLP4 288
CNSTI4 0
ASGNI4
ADDRLP4 276
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ADDRLP4 288
INDIRI4
EQI4 $1375
ADDRLP4 276
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRLP4 288
INDIRI4
EQI4 $1375
ADDRLP4 292
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CVPU4 4
ADDRLP4 284
INDIRU4
EQU4 $1375
ADDRLP4 292
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 288
INDIRI4
EQI4 $1375
ADDRLP4 292
INDIRP4
ADDRLP4 280
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 284
INDIRU4
EQU4 $1375
ADDRLP4 296
ADDRLP4 276
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ASGNI4
ADDRLP4 296
INDIRI4
ADDRLP4 288
INDIRI4
LTI4 $1375
ADDRLP4 296
INDIRI4
CNSTI4 32
GEI4 $1375
line 3354
;3353:			attacker && attacker->inuse && attacker->client && targ->s.owner >= 0 && targ->s.owner < MAX_CLIENTS)
;3354:		{
line 3355
;3355:			gentity_t *targown = &g_entities[targ->s.owner];
ADDRLP4 300
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3357
;3356:
;3357:			if (targown && targown->inuse && targown->client)
ADDRLP4 304
ADDRLP4 300
INDIRP4
ASGNP4
ADDRLP4 308
CNSTU4 0
ASGNU4
ADDRLP4 304
INDIRP4
CVPU4 4
ADDRLP4 308
INDIRU4
EQU4 $1377
ADDRLP4 304
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1377
ADDRLP4 304
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 308
INDIRU4
EQU4 $1377
line 3358
;3358:			{
line 3359
;3359:				if (OnSameTeam(targown, attacker) && !g_friendlyFire.integer)
ADDRLP4 300
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 312
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 316
CNSTI4 0
ASGNI4
ADDRLP4 312
INDIRI4
ADDRLP4 316
INDIRI4
EQI4 $1379
ADDRGP4 g_friendlyFire+12
INDIRI4
ADDRLP4 316
INDIRI4
NEI4 $1379
line 3360
;3360:				{
line 3361
;3361:					return;
ADDRGP4 $1226
JUMPV
LABELV $1379
line 3363
;3362:				}
;3363:				if (targown->client && attacker->client && targown->client->sess.mode == MODE_IRONMAN && attacker->client->sess.mode == MODE_IRONMAN
ADDRLP4 320
CNSTI4 408
ASGNI4
ADDRLP4 324
ADDRLP4 300
INDIRP4
ADDRLP4 320
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 328
CNSTU4 0
ASGNU4
ADDRLP4 324
INDIRP4
CVPU4 4
ADDRLP4 328
INDIRU4
EQU4 $1382
ADDRLP4 332
ADDRFP4 8
INDIRP4
ADDRLP4 320
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 332
INDIRP4
CVPU4 4
ADDRLP4 328
INDIRU4
EQU4 $1382
ADDRLP4 336
CNSTI4 43484
ASGNI4
ADDRLP4 340
CNSTI4 5
ASGNI4
ADDRLP4 324
INDIRP4
ADDRLP4 336
INDIRI4
ADDP4
INDIRI4
ADDRLP4 340
INDIRI4
NEI4 $1382
ADDRLP4 332
INDIRP4
ADDRLP4 336
INDIRI4
ADDP4
INDIRI4
ADDRLP4 340
INDIRI4
NEI4 $1382
ADDRLP4 344
CNSTI4 53188
ASGNI4
ADDRLP4 348
CNSTI4 0
ASGNI4
ADDRLP4 332
INDIRP4
ADDRLP4 344
INDIRI4
ADDP4
INDIRI4
ADDRLP4 348
INDIRI4
NEI4 $1382
ADDRLP4 324
INDIRP4
ADDRLP4 344
INDIRI4
ADDP4
INDIRI4
ADDRLP4 348
INDIRI4
NEI4 $1382
line 3364
;3364:					&& !attacker->client->isIronMan && !targown->client->isIronMan) {
line 3365
;3365:					return; // don't let "team mates" in iron man damage each other (does it make sense to do this here too? idk)
ADDRGP4 $1226
JUMPV
LABELV $1382
line 3367
;3366:				}
;3367:			}
LABELV $1377
line 3368
;3368:		}
LABELV $1375
line 3371
;3369:
;3370:		// check for godmode
;3371:		if ( targ->flags & FL_GODMODE ) {
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1384
line 3372
;3372:			return;
ADDRGP4 $1226
JUMPV
LABELV $1384
line 3375
;3373:		}
;3374:
;3375:		if (targ && targ->client && (targ->client->ps.eFlags & EF_INVULNERABLE) &&
ADDRLP4 300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 304
ADDRLP4 300
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 308
CNSTU4 0
ASGNU4
ADDRLP4 304
INDIRU4
ADDRLP4 308
INDIRU4
EQU4 $1386
ADDRLP4 312
CNSTI4 408
ASGNI4
ADDRLP4 316
ADDRLP4 300
INDIRP4
ADDRLP4 312
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 316
INDIRP4
CVPU4 4
ADDRLP4 308
INDIRU4
EQU4 $1386
ADDRLP4 316
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $1386
ADDRLP4 320
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 324
ADDRLP4 320
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 324
INDIRU4
ADDRLP4 308
INDIRU4
EQU4 $1386
ADDRLP4 320
INDIRP4
ADDRLP4 312
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 308
INDIRU4
EQU4 $1386
ADDRLP4 304
INDIRU4
ADDRLP4 324
INDIRU4
EQU4 $1386
line 3377
;3376:			attacker && attacker->client && targ != attacker)
;3377:		{
line 3378
;3378:			if (targ->client->invulnerableTimer <= nowTimeTarg)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43588
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
GTI4 $1226
line 3379
;3379:			{
line 3380
;3380:				targ->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 328
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 328
INDIRP4
ADDRLP4 328
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 3381
;3381:			}
line 3383
;3382:			else
;3383:			{
line 3384
;3384:				return;
LABELV $1389
line 3386
;3385:			}
;3386:		}
LABELV $1386
line 3387
;3387:	}
LABELV $1362
line 3389
;3388:
;3389:	if (attacker && attacker->client)
ADDRLP4 180
ADDRFP4 8
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
EQU4 $1390
ADDRLP4 180
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 184
INDIRU4
EQU4 $1390
line 3390
;3390:	{
line 3391
;3391:		if (targ->teamnodmg &&
ADDRLP4 188
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
ADDRLP4 192
CNSTI4 0
ASGNI4
ADDRLP4 188
INDIRI4
ADDRLP4 192
INDIRI4
EQI4 $1392
ADDRLP4 188
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
NEI4 $1392
ADDRGP4 g_ff_objectives+12
INDIRI4
ADDRLP4 192
INDIRI4
NEI4 $1392
line 3394
;3392:			targ->teamnodmg == (int)attacker->client->sess.sessionTeam &&
;3393:			!g_ff_objectives.integer)
;3394:		{
line 3395
;3395:			return;
ADDRGP4 $1226
JUMPV
LABELV $1392
line 3397
;3396:		}
;3397:	}
LABELV $1390
line 3401
;3398:
;3399:	// battlesuit protects from all radius damage (but takes knockback)
;3400:	// and protects 50% against all damage
;3401:	if ( client && client->ps.powerups[PW_BATTLESUIT] ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1395
ADDRLP4 0
INDIRP4
CNSTI4 352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1395
line 3402
;3402:		G_AddEvent( targ, EV_POWERUP_BATTLESUIT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 83
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 3403
;3403:		if ( ( dflags & DAMAGE_RADIUS ) || ( mod == MOD_FALLING ) ) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1399
ADDRFP4 28
INDIRI4
CNSTI4 34
NEI4 $1397
LABELV $1399
line 3404
;3404:			return;
ADDRGP4 $1226
JUMPV
LABELV $1397
line 3406
;3405:		}
;3406:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 3407
;3407:	}
LABELV $1395
line 3410
;3408:
;3409:	// add to the attacker's hit counter (if the target isn't a general entity like a prox mine)
;3410:	if ( attacker->client && targ != attacker && targ->health > 0
ADDRLP4 192
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 196
CNSTU4 0
ASGNU4
ADDRLP4 192
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 196
INDIRU4
EQU4 $1400
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CVPU4 4
ADDRLP4 192
INDIRP4
CVPU4 4
EQU4 $1400
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 204
INDIRI4
LEI4 $1400
ADDRLP4 208
ADDRLP4 200
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 3
EQI4 $1400
ADDRLP4 208
INDIRI4
ADDRLP4 204
INDIRI4
EQI4 $1400
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 196
INDIRU4
EQU4 $1400
line 3413
;3411:			&& targ->s.eType != ET_MISSILE
;3412:			&& targ->s.eType != ET_GENERAL
;3413:			&& client) {
line 3414
;3414:		if ( OnSameTeam( targ, attacker ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 212
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 0
EQI4 $1402
line 3415
;3415:			attacker->client->ps.persistant[PERS_HITS]--;
ADDRLP4 216
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 216
INDIRP4
ADDRLP4 216
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 3416
;3416:		} else {
ADDRGP4 $1403
JUMPV
LABELV $1402
line 3417
;3417:			attacker->client->ps.persistant[PERS_HITS]++;
ADDRLP4 216
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 216
INDIRP4
ADDRLP4 216
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3418
;3418:		}
LABELV $1403
line 3419
;3419:		attacker->client->ps.persistant[PERS_ATTACKEE_ARMOR] = (targ->health<<8)|(client->ps.stats[STAT_ARMOR]);
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 308
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 8
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
BORI4
ASGNI4
line 3420
;3420:	}
LABELV $1400
line 3424
;3421:
;3422:	// always give half damage if hurting self
;3423:	// calculated after knockback, so rocket jumping works
;3424:	if ( targ == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $1404
line 3425
;3425:		damage *= 0.5;
ADDRFP4 20
CNSTF4 1056964608
ADDRFP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 3426
;3426:	}
LABELV $1404
line 3428
;3427:
;3428:	if ( damage < 1 ) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $1406
line 3429
;3429:		damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 3430
;3430:	}
LABELV $1406
line 3431
;3431:	take = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 3434
;3432:
;3433:	// save some from armor
;3434:	asave = CheckArmor (targ, take, dflags);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 212
ADDRGP4 CheckArmor
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 212
INDIRI4
ASGNI4
line 3436
;3435:
;3436:	if (asave)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1408
line 3437
;3437:	{
line 3438
;3438:		shieldAbsorbed = asave;
ADDRLP4 16
ADDRLP4 12
INDIRI4
CVIF4 4
ASGNF4
line 3439
;3439:	}
LABELV $1408
line 3441
;3440:
;3441:	take -= asave;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 3443
;3442:
;3443:	if (mod == MOD_DEMP2 || mod == MOD_DEMP2_ALT)
ADDRLP4 216
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 14
EQI4 $1412
ADDRLP4 216
INDIRI4
CNSTI4 15
NEI4 $1410
LABELV $1412
line 3444
;3444:	{ //demp2 does full damage to shields, but only 1/3 normal damage to health
line 3445
;3445:		if (take > 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $1413
line 3446
;3446:		{
line 3447
;3447:			take /= 3;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 3
DIVI4
ASGNI4
line 3448
;3448:			if (take < 1)
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $1415
line 3449
;3449:			{
line 3450
;3450:				take = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 3451
;3451:			}
LABELV $1415
line 3452
;3452:		}
LABELV $1413
line 3453
;3453:	}
LABELV $1410
line 3455
;3454:
;3455:	if ( g_debugDamage.integer ) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $1417
line 3456
;3456:		G_Printf( "%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number,
ADDRGP4 $1420
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
INDIRP4
INDIRI4
ARGI4
ADDRLP4 220
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 3458
;3457:			targ->health, take, asave );
;3458:	}
LABELV $1417
line 3463
;3459:
;3460:	// add to the damage inflicted on a player this frame
;3461:	// the total will be turned into screen blends and view angle kicks
;3462:	// at the end of the frame
;3463:	if ( client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1422
line 3464
;3464:		if ( attacker ) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1424
line 3465
;3465:			client->ps.persistant[PERS_ATTACKER] = attacker->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 3466
;3466:		} else {
ADDRGP4 $1425
JUMPV
LABELV $1424
line 3467
;3467:			client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 1022
ASGNI4
line 3468
;3468:		}
LABELV $1425
line 3469
;3469:		client->damage_armor += asave;
ADDRLP4 220
ADDRLP4 0
INDIRP4
CNSTI4 43620
ADDP4
ASGNP4
ADDRLP4 220
INDIRP4
ADDRLP4 220
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 3470
;3470:		client->damage_blood += take;
ADDRLP4 224
ADDRLP4 0
INDIRP4
CNSTI4 43624
ADDP4
ASGNP4
ADDRLP4 224
INDIRP4
ADDRLP4 224
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 3471
;3471:		client->damage_knockback += knockback;
ADDRLP4 228
ADDRLP4 0
INDIRP4
CNSTI4 43628
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
ADDRLP4 228
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 3472
;3472:		if ( dir ) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1426
line 3473
;3473:			VectorCopy ( dir, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 43632
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 3474
;3474:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 43644
ADDP4
CNSTI4 0
ASGNI4
line 3475
;3475:		} else {
ADDRGP4 $1427
JUMPV
LABELV $1426
line 3476
;3476:			VectorCopy ( targ->r.currentOrigin, client->damage_from );
ADDRLP4 0
INDIRP4
CNSTI4 43632
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 3477
;3477:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 43644
ADDP4
CNSTI4 1
ASGNI4
line 3478
;3478:		}
LABELV $1427
line 3480
;3479:
;3480:		if (attacker && attacker->client)
ADDRLP4 232
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 236
CNSTU4 0
ASGNU4
ADDRLP4 232
INDIRP4
CVPU4 4
ADDRLP4 236
INDIRU4
EQU4 $1428
ADDRLP4 232
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 236
INDIRU4
EQU4 $1428
line 3481
;3481:		{
line 3482
;3482:			BotDamageNotification(client, attacker);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotDamageNotification
CALLV
pop
line 3483
;3483:		}
ADDRGP4 $1429
JUMPV
LABELV $1428
line 3484
;3484:		else if (inflictor && inflictor->client)
ADDRLP4 240
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 244
CNSTU4 0
ASGNU4
ADDRLP4 240
INDIRP4
CVPU4 4
ADDRLP4 244
INDIRU4
EQU4 $1430
ADDRLP4 240
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 244
INDIRU4
EQU4 $1430
line 3485
;3485:		{
line 3486
;3486:			BotDamageNotification(client, inflictor);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotDamageNotification
CALLV
pop
line 3487
;3487:		}
LABELV $1430
LABELV $1429
line 3488
;3488:	}
LABELV $1422
line 3491
;3489:
;3490:	// See if it's the player hurting the emeny flag carrier
;3491:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $1436
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $1432
LABELV $1436
line 3492
;3492:		Team_CheckHurtCarrier(targ, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_CheckHurtCarrier
CALLV
pop
line 3493
;3493:	}
LABELV $1432
line 3495
;3494:
;3495:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1437
line 3497
;3496:		// set the last client who damaged the target
;3497:		targ->client->lasthurt_client = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43676
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 3498
;3498:		targ->client->lasthurt_mod = mod;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43680
ADDP4
ADDRFP4 28
INDIRI4
ASGNI4
line 3499
;3499:	}
LABELV $1437
line 3501
;3500:
;3501:	if (take && targ->client && (targ->client->ps.fd.forcePowersActive & (1 << FP_PROTECT)))
ADDRLP4 220
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 220
INDIRI4
EQI4 $1439
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1439
ADDRLP4 224
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 220
INDIRI4
EQI4 $1439
line 3502
;3502:	{
line 3503
;3503:		if (targ->client->ps.fd.forcePower)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1441
line 3504
;3504:		{
line 3505
;3505:			int maxtake = take;
ADDRLP4 228
ADDRLP4 4
INDIRI4
ASGNI4
line 3508
;3506:
;3507:			//G_Sound(targ, CHAN_AUTO, protectHitSound);
;3508:			if (targ->client->forcePowerSoundDebounce < nowTimeTarg && jk2gameplay != VERSION_1_02)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43804
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
GEI4 $1443
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1443
line 3509
;3509:			{
line 3510
;3510:				G_PreDefSound(targ->client->ps.origin, PDSOUND_PROTECTHIT);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 3511
;3511:				targ->client->forcePowerSoundDebounce = nowTimeTarg + 400;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43804
ADDP4
ADDRLP4 20
INDIRI4
CNSTI4 400
ADDI4
ASGNI4
line 3512
;3512:			}
LABELV $1443
line 3514
;3513:
;3514:			if ( jk2gameplay == VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1445
line 3515
;3515:			{
line 3516
;3516:				G_PreDefSound(targ->client->ps.origin, PDSOUND_PROTECTHIT);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_PreDefSound
CALLP4
pop
line 3517
;3517:			}
LABELV $1445
line 3519
;3518:
;3519:			if (targ->client->ps.fd.forcePowerLevel[FP_PROTECT] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1447
line 3520
;3520:			{
line 3521
;3521:				famt = 1;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 3522
;3522:				hamt = 0.40f;
ADDRLP4 32
CNSTF4 1053609165
ASGNF4
line 3524
;3523:
;3524:				if (maxtake > 100)
ADDRLP4 228
INDIRI4
CNSTI4 100
LEI4 $1448
line 3525
;3525:				{
line 3526
;3526:					maxtake = 100;
ADDRLP4 228
CNSTI4 100
ASGNI4
line 3527
;3527:				}
line 3528
;3528:			}
ADDRGP4 $1448
JUMPV
LABELV $1447
line 3529
;3529:			else if (targ->client->ps.fd.forcePowerLevel[FP_PROTECT] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1451
line 3530
;3530:			{
line 3531
;3531:				famt = 0.5;
ADDRLP4 28
CNSTF4 1056964608
ASGNF4
line 3532
;3532:				hamt = 0.60f;
ADDRLP4 32
CNSTF4 1058642330
ASGNF4
line 3534
;3533:
;3534:				if (maxtake > 200)
ADDRLP4 228
INDIRI4
CNSTI4 200
LEI4 $1452
line 3535
;3535:				{
line 3536
;3536:					maxtake = 200;
ADDRLP4 228
CNSTI4 200
ASGNI4
line 3537
;3537:				}
line 3538
;3538:			}
ADDRGP4 $1452
JUMPV
LABELV $1451
line 3539
;3539:			else if (targ->client->ps.fd.forcePowerLevel[FP_PROTECT] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 980
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1455
line 3540
;3540:			{
line 3541
;3541:				famt = 0.25;
ADDRLP4 28
CNSTF4 1048576000
ASGNF4
line 3542
;3542:				hamt = 0.80f;
ADDRLP4 32
CNSTF4 1061997773
ASGNF4
line 3544
;3543:
;3544:				if (maxtake > 400)
ADDRLP4 228
INDIRI4
CNSTI4 400
LEI4 $1457
line 3545
;3545:				{
line 3546
;3546:					maxtake = 400;
ADDRLP4 228
CNSTI4 400
ASGNI4
line 3547
;3547:				}
LABELV $1457
line 3548
;3548:			}
LABELV $1455
LABELV $1452
LABELV $1448
line 3550
;3549:
;3550:			if (!targ->client->ps.powerups[PW_FORCE_BOON])
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1459
line 3551
;3551:			{
line 3552
;3552:				targ->client->ps.fd.forcePower -= maxtake*famt;
ADDRLP4 232
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 232
INDIRP4
ADDRLP4 232
INDIRP4
INDIRI4
CVIF4 4
ADDRLP4 228
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 3553
;3553:			}
ADDRGP4 $1460
JUMPV
LABELV $1459
line 3555
;3554:			else
;3555:			{
line 3556
;3556:				targ->client->ps.fd.forcePower -= (maxtake*famt)/2;
ADDRLP4 232
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 232
INDIRP4
ADDRLP4 232
INDIRP4
INDIRI4
CVIF4 4
ADDRLP4 228
INDIRI4
CVIF4 4
ADDRLP4 28
INDIRF4
MULF4
CNSTF4 1073741824
DIVF4
SUBF4
CVFI4 4
ASGNI4
line 3557
;3557:			}
LABELV $1460
line 3558
;3558:			subamt = (maxtake*hamt)+(take-maxtake);
ADDRLP4 232
ADDRLP4 228
INDIRI4
ASGNI4
ADDRLP4 24
ADDRLP4 232
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 4
INDIRI4
ADDRLP4 232
INDIRI4
SUBI4
CVIF4 4
ADDF4
CVFI4 4
ASGNI4
line 3559
;3559:			if (targ->client->ps.fd.forcePower < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1461
line 3560
;3560:			{
line 3561
;3561:				subamt += targ->client->ps.fd.forcePower;
ADDRLP4 24
ADDRLP4 24
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ADDI4
ASGNI4
line 3562
;3562:				targ->client->ps.fd.forcePower = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 0
ASGNI4
line 3563
;3563:			}
LABELV $1461
line 3564
;3564:			if (subamt)
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1463
line 3565
;3565:			{
line 3566
;3566:				take -= subamt;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 3568
;3567:
;3568:				if (take < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1465
line 3569
;3569:				{
line 3570
;3570:					take = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3571
;3571:				}
LABELV $1465
line 3572
;3572:			}
LABELV $1463
line 3573
;3573:		}
LABELV $1441
line 3574
;3574:	}
LABELV $1439
line 3576
;3575:
;3576:	if (shieldAbsorbed)
ADDRLP4 16
INDIRF4
CNSTF4 0
EQF4 $1467
line 3577
;3577:	{
line 3581
;3578:		gentity_t	*evEnt;
;3579:
;3580:		// Send off an event to show a shield shell on the player, pointing in the right direction.
;3581:		evEnt = G_TempEntity(targ->r.currentOrigin, EV_SHIELD_HIT);
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 97
ARGI4
ADDRLP4 232
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 228
ADDRLP4 232
INDIRP4
ASGNP4
line 3582
;3582:		evEnt->s.otherEntityNum = targ->s.number;
ADDRLP4 228
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3583
;3583:		evEnt->s.eventParm = DirToByte(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 236
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 228
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 236
INDIRI4
ASGNI4
line 3584
;3584:		evEnt->s.time2=shieldAbsorbed;
ADDRLP4 228
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 3606
;3585:/*
;3586:		shieldAbsorbed *= 20;
;3587:
;3588:		if (shieldAbsorbed > 1500)
;3589:		{
;3590:			shieldAbsorbed = 1500;
;3591:		}
;3592:		if (shieldAbsorbed < 200)
;3593:		{
;3594:			shieldAbsorbed = 200;
;3595:		}
;3596:
;3597:		if (targ->client->ps.powerups[PW_SHIELDHIT] < (nowTimeTarg + shieldAbsorbed))
;3598:		{
;3599:			targ->client->ps.powerups[PW_SHIELDHIT] = nowTimeTarg + shieldAbsorbed;
;3600:		}
;3601:		//flicker for as many ms as damage was absorbed (*20)
;3602:		//therefore 10 damage causes 1/5 of a seond of flickering, whereas
;3603:		//a full 100 causes 2 seconds (but is reduced to 1.5 seconds due to the max)
;3604:
;3605:*/
;3606:	}
LABELV $1467
line 3609
;3607:
;3608:	// do the damage
;3609:	if (take && (!(targ->client && targ->client->sess.raceMode) || !(dflags & FAKE_DAMAGE_IN_RACEMODE))) {
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $1469
ADDRLP4 232
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1471
ADDRLP4 232
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 228
INDIRI4
EQI4 $1471
ADDRFP4 24
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 228
INDIRI4
NEI4 $1469
LABELV $1471
line 3610
;3610:		if (targ->client && (targ->client->ps.fd.forcePowersActive & (1 << FP_RAGE)) && (inflictor->client || attacker->client))
ADDRLP4 236
CNSTI4 408
ASGNI4
ADDRLP4 240
ADDRFP4 0
INDIRP4
ADDRLP4 236
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 244
CNSTU4 0
ASGNU4
ADDRLP4 240
INDIRP4
CVPU4 4
ADDRLP4 244
INDIRU4
EQU4 $1472
ADDRLP4 240
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1472
ADDRFP4 4
INDIRP4
ADDRLP4 236
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 244
INDIRU4
NEU4 $1474
ADDRFP4 8
INDIRP4
ADDRLP4 236
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 244
INDIRU4
EQU4 $1472
LABELV $1474
line 3611
;3611:		{
line 3612
;3612:			take /= (targ->client->ps.fd.forcePowerLevel[FP_RAGE]+1);
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 976
ADDP4
INDIRI4
CNSTI4 1
ADDI4
DIVI4
ASGNI4
line 3613
;3613:		}
LABELV $1472
line 3615
;3614:
;3615:		targ->health = targ->health - take;
ADDRLP4 248
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 248
INDIRP4
ADDRLP4 248
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 3616
;3616:		if ( targ->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1475
line 3617
;3617:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 252
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ASGNI4
line 3618
;3618:		}
LABELV $1475
line 3620
;3619:
;3620:		if (targ->client && (targ->client->ps.fd.forcePowersActive & (1 << FP_RAGE)) && (inflictor->client || attacker->client))
ADDRLP4 252
CNSTI4 408
ASGNI4
ADDRLP4 256
ADDRFP4 0
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 260
CNSTU4 0
ASGNU4
ADDRLP4 256
INDIRP4
CVPU4 4
ADDRLP4 260
INDIRU4
EQU4 $1477
ADDRLP4 256
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1477
ADDRFP4 4
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 260
INDIRU4
NEU4 $1479
ADDRFP4 8
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 260
INDIRU4
EQU4 $1477
LABELV $1479
line 3621
;3621:		{
line 3622
;3622:			if (targ->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1480
line 3623
;3623:			{
line 3624
;3624:				targ->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
line 3625
;3625:			}
LABELV $1480
line 3626
;3626:			if (targ->client->ps.stats[STAT_HEALTH] <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1482
line 3627
;3627:			{
line 3628
;3628:				targ->client->ps.stats[STAT_HEALTH] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 1
ASGNI4
line 3629
;3629:			}
LABELV $1482
line 3630
;3630:		}
LABELV $1477
line 3632
;3631:	
;3632:		if ( targ->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1484
line 3633
;3633:			if ( client )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1486
line 3634
;3634:			{
line 3635
;3635:				targ->flags |= FL_NO_KNOCKBACK;
ADDRLP4 264
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 264
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 3637
;3636:
;3637:				if (point)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1488
line 3638
;3638:				{
line 3639
;3639:					VectorCopy( point, targ->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRFP4 16
INDIRP4
INDIRB
ASGNB 12
line 3640
;3640:				}
ADDRGP4 $1487
JUMPV
LABELV $1488
line 3642
;3641:				else
;3642:				{
line 3643
;3643:					VectorCopy(targ->client->ps.origin, targ->pos1);
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 268
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3644
;3644:				}
line 3645
;3645:			}
ADDRGP4 $1487
JUMPV
LABELV $1486
line 3646
;3646:			else if (targ->s.eType == ET_GRAPPLE)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1490
line 3647
;3647:			{ //g2animent
line 3648
;3648:				VectorCopy(point, targ->pos1);
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRFP4 16
INDIRP4
INDIRB
ASGNB 12
line 3649
;3649:			}
LABELV $1490
LABELV $1487
line 3651
;3650:
;3651:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $1492
line 3652
;3652:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 -999
ASGNI4
LABELV $1492
line 3655
;3653:
;3654:			// If we are a breaking glass brush, store the damage point so we can do cool things with it.
;3655:			if ( targ->r.svFlags & SVF_GLASS_BRUSH )
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 134217728
BANDI4
CNSTI4 0
EQI4 $1494
line 3656
;3656:			{
line 3657
;3657:				VectorCopy( point, targ->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRFP4 16
INDIRP4
INDIRB
ASGNB 12
line 3658
;3658:				VectorCopy( dir, targ->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 3659
;3659:			}
LABELV $1494
line 3661
;3660:
;3661:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 3662
;3662:			targ->die (targ, inflictor, attacker, take, mod);
ADDRLP4 264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 264
INDIRP4
CNSTI4 672
ADDP4
INDIRP4
CALLV
pop
line 3663
;3663:			return;
ADDRGP4 $1226
JUMPV
LABELV $1484
line 3665
;3664:		}
;3665:		else {
line 3666
;3666:			if (g_debugMelee.integer && targ->client && targ->client->sess.raceMode && (targ->client->sess.raceStyle.runFlags & RFL_CLIMBTECH))
ADDRLP4 264
CNSTI4 0
ASGNI4
ADDRGP4 g_debugMelee+12
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $1496
ADDRLP4 268
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1496
ADDRLP4 268
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 264
INDIRI4
EQI4 $1496
ADDRLP4 268
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 256
BANDI4
ADDRLP4 264
INDIRI4
EQI4 $1496
line 3667
;3667:			{//getting hurt makes you let go of the wall
line 3668
;3668:				if (targ->client && (targ->client->ps.pm_flags & PMF_STUCK_TO_WALL))
ADDRLP4 272
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1499
ADDRLP4 272
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $1499
line 3669
;3669:				{
line 3670
;3670:					G_LetGoOfWall(targ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_LetGoOfWall
CALLV
pop
line 3671
;3671:				}
LABELV $1499
line 3672
;3672:			}
LABELV $1496
line 3673
;3673:			if (targ->pain) {
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1501
line 3674
;3674:				targ->pain(targ, attacker, take);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 272
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
CALLV
pop
line 3675
;3675:			}
LABELV $1501
line 3676
;3676:		}
line 3678
;3677:
;3678:		G_LogWeaponDamage(attacker->s.number, mod, take);
ADDRFP4 8
INDIRP4
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponDamage
CALLV
pop
line 3679
;3679:	}
LABELV $1469
line 3681
;3680:
;3681:}
LABELV $1226
endproc G_Damage 352 32
export CanDamage
proc CanDamage 1136 28
line 3692
;3682:
;3683:
;3684:/*
;3685:============
;3686:CanDamage
;3687:
;3688:Returns qtrue if the inflictor can directly damage the target.  Used for
;3689:explosions and melee attacks.
;3690:============
;3691:*/
;3692:qboolean CanDamage (gentity_t *targ, vec3_t origin) {
line 3699
;3693:	vec3_t	dest;
;3694:	trace_t	tr;
;3695:	vec3_t	midpoint;
;3696:
;3697:	// use the midpoint of the bounds instead of the origin, because
;3698:	// bmodels may have their origin is 0,0,0
;3699:	VectorAdd (targ->r.absmin, targ->r.absmax, midpoint);
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 1104
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 1104
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 1104
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 1104
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 1108
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDRLP4 1108
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3700
;3700:	VectorScale (midpoint, 0.5, midpoint);
ADDRLP4 1112
CNSTF4 1056964608
ASGNF4
ADDRLP4 12
ADDRLP4 1112
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 1112
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
line 3702
;3701:
;3702:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 3703
;3703:	JP_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1116
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3704
;3704:	if (tr.fraction == 1.0 || tr.entityNum == targ->s.number)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
EQF4 $1514
ADDRLP4 24+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $1510
LABELV $1514
line 3705
;3705:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1503
JUMPV
LABELV $1510
line 3709
;3706:
;3707:	// this should probably check in the plane of projection, 
;3708:	// rather than in world coordinate, and also include Z
;3709:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 3710
;3710:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 3711
;3711:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 3712
;3712:	JP_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
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
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3713
;3713:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1516
line 3714
;3714:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1503
JUMPV
LABELV $1516
line 3716
;3715:
;3716:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 3717
;3717:	dest[0] += 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 3718
;3718:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 3719
;3719:	JP_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1124
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3720
;3720:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1520
line 3721
;3721:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1503
JUMPV
LABELV $1520
line 3723
;3722:
;3723:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 3724
;3724:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 3725
;3725:	dest[1] += 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
ADDF4
ASGNF4
line 3726
;3726:	JP_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1128
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3727
;3727:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1524
line 3728
;3728:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1503
JUMPV
LABELV $1524
line 3730
;3729:
;3730:	VectorCopy (midpoint, dest);
ADDRLP4 0
ADDRLP4 12
INDIRB
ASGNB 12
line 3731
;3731:	dest[0] -= 15.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 3732
;3732:	dest[1] -= 15.0;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 3733
;3733:	JP_Trace ( &tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1132
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3734
;3734:	if (tr.fraction == 1.0)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
NEF4 $1528
line 3735
;3735:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1503
JUMPV
LABELV $1528
line 3738
;3736:
;3737:
;3738:	return qfalse;
CNSTI4 0
RETI4
LABELV $1503
endproc CanDamage 1136 28
export G_RadiusDamage
proc G_RadiusDamage 4196 32
line 3748
;3739:}
;3740:
;3741:
;3742:/*
;3743:============
;3744:G_RadiusDamage
;3745:============
;3746:*/
;3747:qboolean G_RadiusDamage ( vec3_t origin, gentity_t *attacker, float damage, float radius,
;3748:					 gentity_t *ignore, int mod) {
line 3757
;3749:	float		points, dist;
;3750:	gentity_t	*ent;
;3751:	int			entityList[MAX_GENTITIES];
;3752:	int			numListedEntities;
;3753:	vec3_t		mins, maxs;
;3754:	vec3_t		v;
;3755:	vec3_t		dir;
;3756:	int			i, e;
;3757:	qboolean	hitClient = qfalse;
ADDRLP4 4168
CNSTI4 0
ASGNI4
line 3759
;3758:
;3759:	if ( radius < 1 ) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $1532
line 3760
;3760:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 3761
;3761:	}
LABELV $1532
line 3763
;3762:
;3763:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1534
line 3764
;3764:		mins[i] = origin[i] - radius;
ADDRLP4 4172
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4172
INDIRI4
ADDRLP4 4144
ADDP4
ADDRLP4 4172
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
SUBF4
ASGNF4
line 3765
;3765:		maxs[i] = origin[i] + radius;
ADDRLP4 4176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRLP4 4156
ADDP4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 3766
;3766:	}
LABELV $1535
line 3763
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1534
line 3768
;3767:
;3768:	numListedEntities = trap_EntitiesInBox( mins, maxs, entityList, MAX_GENTITIES );
ADDRLP4 4144
ARGP4
ADDRLP4 4156
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4172
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4140
ADDRLP4 4172
INDIRI4
ASGNI4
line 3770
;3769:
;3770:	for ( e = 0 ; e < numListedEntities ; e++ ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $1541
JUMPV
LABELV $1538
line 3771
;3771:		ent = &g_entities[entityList[ e ]];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3773
;3772:
;3773:		if (ent == ignore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $1542
line 3774
;3774:			continue;
ADDRGP4 $1539
JUMPV
LABELV $1542
line 3775
;3775:		if (!ent->takedamage)
ADDRLP4 4
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1544
line 3776
;3776:			continue;
ADDRGP4 $1539
JUMPV
LABELV $1544
line 3779
;3777:
;3778:		// find the distance from the edge of the bounding box
;3779:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1546
line 3780
;3780:			if ( origin[i] < ent->r.absmin[i] ) {
ADDRLP4 4176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
GEF4 $1550
line 3781
;3781:				v[i] = ent->r.absmin[i] - origin[i];
ADDRLP4 4180
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4180
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 4180
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3782
;3782:			} else if ( origin[i] > ent->r.absmax[i] ) {
ADDRGP4 $1551
JUMPV
LABELV $1550
ADDRLP4 4180
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4180
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
LEF4 $1552
line 3783
;3783:				v[i] = origin[i] - ent->r.absmax[i];
ADDRLP4 4184
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4184
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 4184
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4184
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3784
;3784:			} else {
ADDRGP4 $1553
JUMPV
LABELV $1552
line 3785
;3785:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 3786
;3786:			}
LABELV $1553
LABELV $1551
line 3787
;3787:		}
LABELV $1547
line 3779
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1546
line 3789
;3788:
;3789:		dist = VectorLength( v );
ADDRLP4 8
ARGP4
ADDRLP4 4176
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 4176
INDIRF4
ASGNF4
line 3790
;3790:		if ( dist >= radius ) {
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $1554
line 3791
;3791:			continue;
ADDRGP4 $1539
JUMPV
LABELV $1554
line 3794
;3792:		}
;3793:
;3794:		points = damage * ( 1.0 - dist / radius );
ADDRLP4 40
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
SUBF4
MULF4
ASGNF4
line 3796
;3795:
;3796:		if( CanDamage (ent, origin) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4180
ADDRGP4 CanDamage
CALLI4
ASGNI4
ADDRLP4 4180
INDIRI4
CNSTI4 0
EQI4 $1556
line 3797
;3797:			if( LogAccuracyHit( ent, attacker ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4184
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 4184
INDIRI4
CNSTI4 0
EQI4 $1558
line 3798
;3798:				hitClient = qtrue;
ADDRLP4 4168
CNSTI4 1
ASGNI4
line 3799
;3799:			}
LABELV $1558
line 3800
;3800:			VectorSubtract (ent->r.currentOrigin, origin, dir);
ADDRLP4 4192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 4
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3803
;3801:			// push the center of mass higher than the origin so players
;3802:			// get knocked into the air more
;3803:			dir[2] += 24;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3804
;3804:			G_Damage (ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRF4
CVFI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 3805
;3805:		}
LABELV $1556
line 3806
;3806:	}
LABELV $1539
line 3770
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1541
ADDRLP4 20
INDIRI4
ADDRLP4 4140
INDIRI4
LTI4 $1538
line 3808
;3807:
;3808:	return hitClient;
ADDRLP4 4168
INDIRI4
RETI4
LABELV $1531
endproc G_RadiusDamage 4196 32
import G_LetGoOfWall
import G_G2PlayerAngles
import PrintCTFMessage
import DF_RaceStateInvalidated
import DF_SegmentedRunStatusInvalidated
import animTable
import ThrowSaberToAttacker
import BotDamageNotification
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
import TossClientCubes
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
LABELV $1420
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1218
byte 1 68
byte 1 117
byte 1 101
byte 1 108
byte 1 32
byte 1 68
byte 1 105
byte 1 115
byte 1 109
byte 1 101
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 109
byte 1 101
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1105
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 108
byte 1 105
byte 1 109
byte 1 98
byte 1 0
align 1
LABELV $1067
byte 1 114
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1014
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 105
byte 1 99
byte 1 54
byte 1 0
align 1
LABELV $1013
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 105
byte 1 99
byte 1 53
byte 1 0
align 1
LABELV $1012
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 105
byte 1 99
byte 1 52
byte 1 0
align 1
LABELV $1011
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 105
byte 1 99
byte 1 51
byte 1 0
align 1
LABELV $1010
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 105
byte 1 99
byte 1 50
byte 1 0
align 1
LABELV $1009
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 105
byte 1 99
byte 1 49
byte 1 0
align 1
LABELV $1008
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1007
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1006
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $1005
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 0
align 1
LABELV $1004
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 0
align 1
LABELV $1003
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $1002
byte 1 102
byte 1 114
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1001
byte 1 102
byte 1 114
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1000
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $999
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $998
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $997
byte 1 119
byte 1 97
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $996
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 103
byte 1 0
align 1
LABELV $995
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 103
byte 1 0
align 1
LABELV $994
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $993
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $992
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $747
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $744
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $741
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $739
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $738
byte 1 68
byte 1 117
byte 1 101
byte 1 108
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 115
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $723
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $715
byte 1 60
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 111
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 62
byte 1 0
align 1
LABELV $708
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $707
byte 1 60
byte 1 110
byte 1 111
byte 1 110
byte 1 45
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 62
byte 1 0
align 1
LABELV $368
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 95
byte 1 72
byte 1 85
byte 1 82
byte 1 84
byte 1 0
align 1
LABELV $367
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 65
byte 1 82
byte 1 71
byte 1 69
byte 1 84
byte 1 95
byte 1 76
byte 1 65
byte 1 83
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $366
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 85
byte 1 73
byte 1 67
byte 1 73
byte 1 68
byte 1 69
byte 1 0
align 1
LABELV $365
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $364
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 70
byte 1 82
byte 1 65
byte 1 71
byte 1 0
align 1
LABELV $363
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 67
byte 1 82
byte 1 85
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $362
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 76
byte 1 65
byte 1 86
byte 1 65
byte 1 0
align 1
LABELV $361
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 76
byte 1 73
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $360
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $359
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 69
byte 1 78
byte 1 84
byte 1 82
byte 1 89
byte 1 0
align 1
LABELV $358
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 70
byte 1 79
byte 1 82
byte 1 67
byte 1 69
byte 1 95
byte 1 68
byte 1 65
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $357
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 68
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 65
byte 1 67
byte 1 75
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $356
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 73
byte 1 77
byte 1 69
byte 1 68
byte 1 95
byte 1 77
byte 1 73
byte 1 78
byte 1 69
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $355
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 80
byte 1 95
byte 1 77
byte 1 73
byte 1 78
byte 1 69
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $354
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 72
byte 1 69
byte 1 82
byte 1 77
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $353
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 72
byte 1 69
byte 1 82
byte 1 77
byte 1 65
byte 1 76
byte 1 0
align 1
LABELV $352
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 79
byte 1 77
byte 1 73
byte 1 78
byte 1 71
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $351
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 72
byte 1 79
byte 1 77
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $350
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $349
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $348
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 70
byte 1 76
byte 1 69
byte 1 67
byte 1 72
byte 1 69
byte 1 84
byte 1 84
byte 1 69
byte 1 95
byte 1 65
byte 1 76
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $347
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 70
byte 1 76
byte 1 69
byte 1 67
byte 1 72
byte 1 69
byte 1 84
byte 1 84
byte 1 69
byte 1 0
align 1
LABELV $346
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 68
byte 1 69
byte 1 77
byte 1 80
byte 1 50
byte 1 95
byte 1 65
byte 1 76
byte 1 84
byte 1 0
align 1
LABELV $345
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 68
byte 1 69
byte 1 77
byte 1 80
byte 1 50
byte 1 0
align 1
LABELV $344
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 69
byte 1 80
byte 1 69
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 65
byte 1 76
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $343
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 69
byte 1 80
byte 1 69
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 95
byte 1 65
byte 1 76
byte 1 84
byte 1 0
align 1
LABELV $342
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 69
byte 1 80
byte 1 69
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $341
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 79
byte 1 87
byte 1 67
byte 1 65
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $340
byte 1 77
byte 1 79
byte 1 68
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
byte 1 0
align 1
LABELV $339
byte 1 77
byte 1 79
byte 1 68
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
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $338
byte 1 77
byte 1 79
byte 1 68
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
byte 1 0
align 1
LABELV $337
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 76
byte 1 65
byte 1 83
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $336
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 82
byte 1 89
byte 1 65
byte 1 82
byte 1 95
byte 1 80
byte 1 73
byte 1 83
byte 1 84
byte 1 79
byte 1 76
byte 1 95
byte 1 65
byte 1 76
byte 1 84
byte 1 0
align 1
LABELV $335
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 82
byte 1 89
byte 1 65
byte 1 82
byte 1 95
byte 1 80
byte 1 73
byte 1 83
byte 1 84
byte 1 79
byte 1 76
byte 1 0
align 1
LABELV $334
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 65
byte 1 66
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $333
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 77
byte 1 69
byte 1 76
byte 1 69
byte 1 69
byte 1 0
align 1
LABELV $332
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 84
byte 1 85
byte 1 78
byte 1 95
byte 1 66
byte 1 65
byte 1 84
byte 1 79
byte 1 78
byte 1 0
align 1
LABELV $331
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 0
