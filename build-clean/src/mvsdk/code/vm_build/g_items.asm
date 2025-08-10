export adjustRespawnTime
code
proc adjustRespawnTime 8 0
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_items.c"
line 36
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:/*
;6:
;7:  Items are any object that a player can touch to gain some effect.
;8:
;9:  Pickup will return the number of seconds until they should respawn.
;10:
;11:  all items should pop when dropped in lava or slime
;12:
;13:  Respawnable items don't actually go away when picked up, they are
;14:  just made invisible and untouchable.  This allows them to ride
;15:  movers and respawn apropriately.
;16:*/
;17:
;18:
;19:#define	RESPAWN_ARMOR		20
;20:#define	RESPAWN_TEAM_WEAPON	30
;21:#define	RESPAWN_HEALTH		30
;22:#define	RESPAWN_AMMO		40
;23:#define	RESPAWN_HOLDABLE	60
;24:#define	RESPAWN_MEGAHEALTH	120
;25:#define	RESPAWN_POWERUP		120
;26:
;27:extern gentity_t *droppedRedFlag;
;28:extern gentity_t *droppedBlueFlag;
;29:
;30://======================================================================
;31:#define MAX_MEDPACK_HEAL_AMOUNT		100
;32:#define MAX_SENTRY_DISTANCE			256
;33:
;34:// For more than four players, adjust the respawn times, up to 1/4.
;35:int adjustRespawnTime(float preRespawnTime, int itemType, int itemTag)
;36:{
line 37
;37:	float respawnTime = preRespawnTime;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
line 39
;38:
;39:	if (itemType == IT_WEAPON)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $123
line 40
;40:	{
line 41
;41:		if (itemTag == WP_THERMAL ||
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 11
EQI4 $128
ADDRLP4 4
INDIRI4
CNSTI4 12
EQI4 $128
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $125
LABELV $128
line 44
;42:			itemTag == WP_TRIP_MINE ||
;43:			itemTag == WP_DET_PACK)
;44:		{ //special case for these, use ammo respawn rate
line 45
;45:			respawnTime = RESPAWN_AMMO;
ADDRLP4 0
CNSTF4 1109393408
ASGNF4
line 46
;46:		}
LABELV $125
line 47
;47:	}
LABELV $123
line 49
;48:
;49:	if (!g_adaptRespawn.integer)
ADDRGP4 g_adaptRespawn+12
INDIRI4
CNSTI4 0
NEI4 $129
line 50
;50:	{
line 51
;51:		return((int)respawnTime);
ADDRLP4 0
INDIRF4
CVFI4 4
RETI4
ADDRGP4 $122
JUMPV
LABELV $129
line 54
;52:	}
;53:
;54:	if (level.numPlayingClients > 4)
ADDRGP4 level+92
INDIRI4
CNSTI4 4
LEI4 $132
line 55
;55:	{	// Start scaling the respawn times.
line 56
;56:		if (level.numPlayingClients > 32)
ADDRGP4 level+92
INDIRI4
CNSTI4 32
LEI4 $135
line 57
;57:		{	// 1/4 time minimum.
line 58
;58:			respawnTime *= 0.25;
ADDRLP4 0
CNSTF4 1048576000
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 59
;59:		}
ADDRGP4 $136
JUMPV
LABELV $135
line 60
;60:		else if (level.numPlayingClients > 12)
ADDRGP4 level+92
INDIRI4
CNSTI4 12
LEI4 $138
line 61
;61:		{	// From 12-32, scale from 0.5 to 0.25;
line 62
;62:			respawnTime *= 20.0 / (float)(level.numPlayingClients + 8);
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
ADDRGP4 level+92
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
DIVF4
MULF4
ASGNF4
line 63
;63:		}
ADDRGP4 $139
JUMPV
LABELV $138
line 65
;64:		else 
;65:		{	// From 4-12, scale from 1.0 to 0.5;
line 66
;66:			respawnTime *= 8.0 / (float)(level.numPlayingClients + 4);
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1090519040
ADDRGP4 level+92
INDIRI4
CNSTI4 4
ADDI4
CVIF4 4
DIVF4
MULF4
ASGNF4
line 67
;67:		}
LABELV $139
LABELV $136
line 68
;68:	}
LABELV $132
line 70
;69:
;70:	if (respawnTime < 1.0)
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $143
line 71
;71:	{	// No matter what, don't go lower than 1 second, or the pickups become very noisy!
line 72
;72:		respawnTime = 1.0;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 73
;73:	}
LABELV $143
line 75
;74:
;75:	return ((int)respawnTime);
ADDRLP4 0
INDIRF4
CVFI4 4
RETI4
LABELV $122
endproc adjustRespawnTime 8 0
data
align 4
LABELV shieldLoopSound
byte 4 0
align 4
LABELV shieldAttachSound
byte 4 0
align 4
LABELV shieldActivateSound
byte 4 0
align 4
LABELV shieldDeactivateSound
byte 4 0
align 4
LABELV shieldDamageSound
byte 4 0
align 4
LABELV shieldItem
byte 4 0
export ShieldRemove
code
proc ShieldRemove 0 12
line 94
;76:}
;77:
;78:
;79:#define SHIELD_HEALTH				250
;80:#define SHIELD_HEALTH_DEC			10		// 25 seconds	
;81:#define MAX_SHIELD_HEIGHT			254
;82:#define MAX_SHIELD_HALFWIDTH		255
;83:#define SHIELD_PLACEDIST			64
;84:
;85:static qhandle_t	shieldLoopSound=0;
;86:static qhandle_t	shieldAttachSound=0;
;87:static qhandle_t	shieldActivateSound=0;
;88:static qhandle_t	shieldDeactivateSound=0;
;89:static qhandle_t	shieldDamageSound=0;
;90:static gitem_t		*shieldItem=0;
;91:
;92:
;93:void ShieldRemove(gentity_t *self)
;94:{
line 95
;95:	self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 96
;96:	self->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 99
;97:
;98:	// Play kill sound...
;99:	G_AddEvent(self, EV_GENERAL_SOUND, shieldDeactivateSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRGP4 shieldDeactivateSound
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 100
;100:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 102
;101:
;102:	return;
LABELV $145
endproc ShieldRemove 0 12
export ShieldThink
proc ShieldThink 4 4
line 108
;103:}
;104:
;105:
;106:// Count down the health of the shield.
;107:void ShieldThink(gentity_t *self)
;108:{
line 109
;109:	self->s.trickedentindex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 111
;110:
;111:	self->health -= SHIELD_HEALTH_DEC;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 10
SUBI4
ASGNI4
line 112
;112:	self->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 113
;113:	if (self->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $147
line 114
;114:	{
line 115
;115:		ShieldRemove(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ShieldRemove
CALLV
pop
line 116
;116:	}
line 117
;117:	return;
LABELV $147
endproc ShieldThink 4 4
export ShieldDie
proc ShieldDie 0 12
line 123
;118:}
;119:
;120:
;121:// The shield was damaged to below zero health.
;122:void ShieldDie(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;123:{
line 125
;124:	// Play damaging sound...
;125:	G_AddEvent(self, EV_GENERAL_SOUND, shieldDamageSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRGP4 shieldDamageSound
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 127
;126:
;127:	ShieldRemove(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ShieldRemove
CALLV
pop
line 128
;128:}
LABELV $151
endproc ShieldDie 0 12
export ShieldPain
proc ShieldPain 0 12
line 133
;129:
;130:
;131:// The shield had damage done to it.  Make it flicker.
;132:void ShieldPain(gentity_t *self, gentity_t *attacker, int damage)
;133:{
line 135
;134:	// Set the itemplaceholder flag to indicate the the shield drawing that the shield pain should be drawn.
;135:	self->think = ShieldThink;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 ShieldThink
ASGNP4
line 136
;136:	self->nextthink = level.time + 400;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 400
ADDI4
ASGNI4
line 139
;137:
;138:	// Play damaging sound...
;139:	G_AddEvent(self, EV_GENERAL_SOUND, shieldDamageSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRGP4 shieldDamageSound
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 141
;140:
;141:	self->s.trickedentindex = 1;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 143
;142:
;143:	return;
LABELV $152
endproc ShieldPain 0 12
export ShieldGoSolid
proc ShieldGoSolid 1096 28
line 149
;144:}
;145:
;146:
;147:// Try to turn the shield back on after a delay.
;148:void ShieldGoSolid(gentity_t *self)
;149:{
line 153
;150:	trace_t		tr;
;151:
;152:	// see if we're valid
;153:	self->health--;
ADDRLP4 1080
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 1080
INDIRP4
ADDRLP4 1080
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 154
;154:	if (self->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $155
line 155
;155:	{
line 156
;156:		ShieldRemove(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ShieldRemove
CALLV
pop
line 157
;157:		return;
ADDRGP4 $154
JUMPV
LABELV $155
line 160
;158:	}
;159:	
;160:	JP_Trace (&tr, self->r.currentOrigin, self->r.mins, self->r.maxs, self->r.currentOrigin, self->s.number, CONTENTS_BODY );
ADDRLP4 0
ARGP4
ADDRLP4 1084
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
ADDRLP4 1084
INDIRP4
CNSTI4 368
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
CNSTI4 256
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 161
;161:	if(tr.startsolid)
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $157
line 162
;162:	{	// gah, we can't activate yet
line 163
;163:		self->nextthink = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 164
;164:		self->think = ShieldGoSolid;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 ShieldGoSolid
ASGNP4
line 165
;165:		trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 166
;166:	}
ADDRGP4 $154
JUMPV
LABELV $157
line 168
;167:	else
;168:	{ // get hard... huh-huh...
line 169
;169:		self->s.eFlags &= ~EF_NODRAW;
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 171
;170:
;171:		self->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 172
;172:		self->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 173
;173:		self->think = ShieldThink;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 ShieldThink
ASGNP4
line 174
;174:		self->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 175
;175:		trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 178
;176:
;177:		// Play raising sound...
;178:		G_AddEvent(self, EV_GENERAL_SOUND, shieldActivateSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRGP4 shieldActivateSound
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 179
;179:		self->s.loopSound = shieldLoopSound;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRGP4 shieldLoopSound
INDIRI4
ASGNI4
line 180
;180:	}
line 182
;181:
;182:	return;
LABELV $154
endproc ShieldGoSolid 1096 28
export ShieldGoNotSolid
proc ShieldGoNotSolid 4 12
line 188
;183:}
;184:
;185:
;186:// Turn the shield off to allow a friend to pass through.
;187:void ShieldGoNotSolid(gentity_t *self)
;188:{
line 190
;189:	// make the shield non-solid very briefly
;190:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 191
;191:	self->s.eFlags |= EF_NODRAW;
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
CNSTI4 128
BORI4
ASGNI4
line 193
;192:	// nextthink needs to have a large enough interval to avoid excess accumulation of Activate messages
;193:	self->nextthink = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 194
;194:	self->think = ShieldGoSolid;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 ShieldGoSolid
ASGNP4
line 195
;195:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 196
;196:	trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 199
;197:
;198:	// Play kill sound...
;199:	G_AddEvent(self, EV_GENERAL_SOUND, shieldDeactivateSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRGP4 shieldDeactivateSound
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 200
;200:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 201
;201:}
LABELV $162
endproc ShieldGoNotSolid 4 12
export ShieldTouch
proc ShieldTouch 8 4
line 206
;202:
;203:
;204:// Somebody (a player) has touched the shield.  See if it is a "friend".
;205:void ShieldTouch(gentity_t *self, gentity_t *other, trace_t *trace)
;206:{
line 207
;207:	if (g_gametype.integer >= GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $165
line 208
;208:	{ // let teammates through
line 210
;209:		// compare the parent's team to the "other's" team
;210:		if ( other->client && self->s.otherEntityNum2 == (int)other->client->sess.sessionTeam )
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
EQU4 $166
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
NEI4 $166
line 211
;211:		{
line 212
;212:			ShieldGoNotSolid(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ShieldGoNotSolid
CALLV
pop
line 213
;213:		}
line 214
;214:	}
ADDRGP4 $166
JUMPV
LABELV $165
line 216
;215:	else
;216:	{//let the person who dropped the shield through
line 217
;217:		if ((self->parent && self->parent->s.number == other->s.number) || (other->client && other->client->sess.raceMode))
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $173
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $172
LABELV $173
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $170
ADDRLP4 4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $170
LABELV $172
line 218
;218:		{
line 219
;219:			ShieldGoNotSolid(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ShieldGoNotSolid
CALLV
pop
line 220
;220:		}
LABELV $170
line 221
;221:	}
LABELV $166
line 222
;222:}
LABELV $164
endproc ShieldTouch 8 4
export CreateShield
proc CreateShield 1192 28
line 227
;223:
;224:
;225:// After a short delay, create the shield by expanding in all directions.
;226:void CreateShield(gentity_t *ent)
;227:{
line 230
;228:	trace_t		tr;
;229:	vec3_t		end, posTraceEnd, negTraceEnd, start;
;230:	int			height, posWidth, negWidth, halfWidth = 0;
ADDRLP4 1084
CNSTI4 0
ASGNI4
line 232
;231:	qboolean	xaxis;
;232:	int			paramData = 0;
ADDRLP4 1148
CNSTI4 0
ASGNI4
line 235
;233:
;234:	// trace upward to find height of shield
;235:	VectorCopy(ent->r.currentOrigin, end);
ADDRLP4 1108
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 236
;236:	end[2] += MAX_SHIELD_HEIGHT;
ADDRLP4 1108+8
ADDRLP4 1108+8
INDIRF4
CNSTF4 1132331008
ADDF4
ASGNF4
line 237
;237:	JP_Trace (&tr, ent->r.currentOrigin, NULL, NULL, end, ent->s.number, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRLP4 1152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1156
CNSTP4 0
ASGNP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRLP4 1108
ARGP4
ADDRLP4 1152
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 238
;238:	height = (int)(MAX_SHIELD_HEIGHT * tr.fraction);
ADDRLP4 1080
CNSTF4 1132331008
ADDRLP4 0+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 241
;239:
;240:	// use angles to find the proper axis along which to align the shield
;241:	VectorCopy(ent->r.currentOrigin, posTraceEnd);
ADDRLP4 1120
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 242
;242:	VectorCopy(ent->r.currentOrigin, negTraceEnd);
ADDRLP4 1132
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 244
;243:
;244:	if ((int)(ent->s.angles[YAW]) == 0) // shield runs along y-axis
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
CVFI4 4
CNSTI4 0
NEI4 $177
line 245
;245:	{
line 246
;246:		posTraceEnd[1]+=MAX_SHIELD_HALFWIDTH;
ADDRLP4 1120+4
ADDRLP4 1120+4
INDIRF4
CNSTF4 1132396544
ADDF4
ASGNF4
line 247
;247:		negTraceEnd[1]-=MAX_SHIELD_HALFWIDTH;
ADDRLP4 1132+4
ADDRLP4 1132+4
INDIRF4
CNSTF4 1132396544
SUBF4
ASGNF4
line 248
;248:		xaxis = qfalse;
ADDRLP4 1104
CNSTI4 0
ASGNI4
line 249
;249:	}
ADDRGP4 $178
JUMPV
LABELV $177
line 251
;250:	else  // shield runs along x-axis
;251:	{
line 252
;252:		posTraceEnd[0]+=MAX_SHIELD_HALFWIDTH;
ADDRLP4 1120
ADDRLP4 1120
INDIRF4
CNSTF4 1132396544
ADDF4
ASGNF4
line 253
;253:		negTraceEnd[0]-=MAX_SHIELD_HALFWIDTH;
ADDRLP4 1132
ADDRLP4 1132
INDIRF4
CNSTF4 1132396544
SUBF4
ASGNF4
line 254
;254:		xaxis = qtrue;
ADDRLP4 1104
CNSTI4 1
ASGNI4
line 255
;255:	}
LABELV $178
line 259
;256:
;257:	// trace horizontally to find extend of shield
;258:	// positive trace
;259:	VectorCopy(ent->r.currentOrigin, start);
ADDRLP4 1088
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 260
;260:	start[2] += (height>>1);
ADDRLP4 1088+8
ADDRLP4 1088+8
INDIRF4
ADDRLP4 1080
INDIRI4
CNSTI4 1
RSHI4
CVIF4 4
ADDF4
ASGNF4
line 261
;261:	JP_Trace (&tr, start, 0, 0, posTraceEnd, ent->s.number, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRLP4 1088
ARGP4
ADDRLP4 1160
CNSTP4 0
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1160
INDIRP4
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
line 262
;262:	posWidth = MAX_SHIELD_HALFWIDTH * tr.fraction;
ADDRLP4 1144
CNSTF4 1132396544
ADDRLP4 0+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 264
;263:	// negative trace
;264:	JP_Trace (&tr, start, 0, 0, negTraceEnd, ent->s.number, MASK_SHOT );
ADDRLP4 0
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
ADDRLP4 1132
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
line 265
;265:	negWidth = MAX_SHIELD_HALFWIDTH * tr.fraction;
ADDRLP4 1100
CNSTF4 1132396544
ADDRLP4 0+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 268
;266:
;267:	// kef -- monkey with dimensions and place origin in center
;268:	halfWidth = (posWidth + negWidth)>>1;
ADDRLP4 1084
ADDRLP4 1144
INDIRI4
ADDRLP4 1100
INDIRI4
ADDI4
CNSTI4 1
RSHI4
ASGNI4
line 269
;269:	if (xaxis)
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $184
line 270
;270:	{
line 271
;271:		ent->r.currentOrigin[0] = ent->r.currentOrigin[0] - negWidth + halfWidth;
ADDRLP4 1168
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ASGNP4
ADDRLP4 1168
INDIRP4
ADDRLP4 1168
INDIRP4
INDIRF4
ADDRLP4 1100
INDIRI4
CVIF4 4
SUBF4
ADDRLP4 1084
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 272
;272:	}
ADDRGP4 $185
JUMPV
LABELV $184
line 274
;273:	else
;274:	{
line 275
;275:		ent->r.currentOrigin[1] = ent->r.currentOrigin[1] - negWidth + halfWidth;
ADDRLP4 1168
ADDRFP4 0
INDIRP4
CNSTI4 372
ADDP4
ASGNP4
ADDRLP4 1168
INDIRP4
ADDRLP4 1168
INDIRP4
INDIRF4
ADDRLP4 1100
INDIRI4
CVIF4 4
SUBF4
ADDRLP4 1084
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 276
;276:	}
LABELV $185
line 277
;277:	ent->r.currentOrigin[2] += (height>>1);
ADDRLP4 1168
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
ASGNP4
ADDRLP4 1168
INDIRP4
ADDRLP4 1168
INDIRP4
INDIRF4
ADDRLP4 1080
INDIRI4
CNSTI4 1
RSHI4
CVIF4 4
ADDF4
ASGNF4
line 280
;278:
;279:	// set entity's mins and maxs to new values, make it solid, and link it
;280:	if (xaxis)
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $186
line 281
;281:	{
line 282
;282:		VectorSet(ent->r.mins, -halfWidth, -SHIELD_HALFTHICKNESS, -(height>>1));
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 1084
INDIRI4
NEGI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3229614080
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 1080
INDIRI4
CNSTI4 1
RSHI4
NEGI4
CVIF4 4
ASGNF4
line 283
;283:		VectorSet(ent->r.maxs, halfWidth, SHIELD_HALFTHICKNESS, height>>1);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 1084
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1082130432
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 1080
INDIRI4
CNSTI4 1
RSHI4
CVIF4 4
ASGNF4
line 284
;284:	}
ADDRGP4 $187
JUMPV
LABELV $186
line 286
;285:	else
;286:	{
line 287
;287:		VectorSet(ent->r.mins, -SHIELD_HALFTHICKNESS, -halfWidth, -(height>>1));
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3229614080
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 1084
INDIRI4
NEGI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 1080
INDIRI4
CNSTI4 1
RSHI4
NEGI4
CVIF4 4
ASGNF4
line 288
;288:		VectorSet(ent->r.maxs, SHIELD_HALFTHICKNESS, halfWidth, height>>1);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1082130432
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 1084
INDIRI4
CVIF4 4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 1080
INDIRI4
CNSTI4 1
RSHI4
CVIF4 4
ASGNF4
line 289
;289:	}
LABELV $187
line 290
;290:	ent->clipmask = MASK_SHOT;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 769
ASGNI4
line 299
;291:
;292:	// Information for shield rendering.
;293:
;294://	xaxis - 1 bit
;295://	height - 0-254 8 bits
;296://	posWidth - 0-255 8 bits
;297://  negWidth - 0 - 255 8 bits
;298:
;299:	paramData = (xaxis << 24) | (height << 16) | (posWidth << 8) | (negWidth);
ADDRLP4 1148
ADDRLP4 1104
INDIRI4
CNSTI4 24
LSHI4
ADDRLP4 1080
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 1144
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 1100
INDIRI4
BORI4
ASGNI4
line 300
;300:	ent->s.time2 = paramData;
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 1148
INDIRI4
ASGNI4
line 302
;301:
;302:	ent->health = ceil(SHIELD_HEALTH*1);
CNSTF4 1132068864
ARGF4
ADDRLP4 1172
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 1172
INDIRF4
CVFI4 4
ASGNI4
line 304
;303:
;304:	ent->s.time = ent->health;//???
ADDRLP4 1176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1176
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 1176
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ASGNI4
line 305
;305:	ent->pain = ShieldPain;
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRGP4 ShieldPain
ASGNP4
line 306
;306:	ent->die = ShieldDie;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 ShieldDie
ASGNP4
line 307
;307:	ent->touch = ShieldTouch;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 ShieldTouch
ASGNP4
line 310
;308:
;309:	// see if we're valid
;310:	JP_Trace (&tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, ent->s.number, CONTENTS_BODY ); 
ADDRLP4 0
ARGP4
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1184
ADDRLP4 1180
INDIRP4
CNSTI4 368
ADDP4
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1180
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1180
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1180
INDIRP4
INDIRI4
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 312
;311:
;312:	if (tr.startsolid)
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $188
line 313
;313:	{	// Something in the way!
line 315
;314:		// make the shield non-solid very briefly
;315:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 316
;316:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 1188
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 1188
INDIRP4
ADDRLP4 1188
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 318
;317:		// nextthink needs to have a large enough interval to avoid excess accumulation of Activate messages
;318:		ent->nextthink = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 319
;319:		ent->think = ShieldGoSolid;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 ShieldGoSolid
ASGNP4
line 320
;320:		ent->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 321
;321:		trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 322
;322:	}
ADDRGP4 $189
JUMPV
LABELV $188
line 324
;323:	else
;324:	{	// Get solid.
line 325
;325:		ent->r.contents = CONTENTS_PLAYERCLIP|CONTENTS_SHOTCLIP;//CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 144
ASGNI4
line 327
;326:
;327:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 328
;328:		ent->think = ShieldThink;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 ShieldThink
ASGNP4
line 330
;329:
;330:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 331
;331:		trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 334
;332:
;333:		// Play raising sound...
;334:		G_AddEvent(ent, EV_GENERAL_SOUND, shieldActivateSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRGP4 shieldActivateSound
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 335
;335:		ent->s.loopSound = shieldLoopSound;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRGP4 shieldLoopSound
INDIRI4
ASGNI4
line 336
;336:	}
LABELV $189
line 338
;337:
;338:	ShieldGoSolid(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ShieldGoSolid
CALLV
pop
line 340
;339:
;340:	return;
LABELV $174
endproc CreateShield 1192 28
lit
align 4
LABELV $194
byte 4 3229614080
byte 4 3229614080
byte 4 0
align 4
LABELV $195
byte 4 1082130432
byte 4 1082130432
byte 4 1082130432
export PlaceShield
code
proc PlaceShield 1188 28
line 344
;341:}
;342:
;343:qboolean PlaceShield(gentity_t *playerent)
;344:{
line 345
;345:	gentity_t	*shield = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 347
;346:	trace_t		tr;
;347:	vec3_t		fwd, pos, dest, mins = {-4,-4, 0}, maxs = {4,4,4};
ADDRLP4 1120
ADDRGP4 $194
INDIRB
ASGNB 12
ADDRLP4 1132
ADDRGP4 $195
INDIRB
ASGNB 12
line 349
;348:
;349:	if (shieldAttachSound==0)
ADDRGP4 shieldAttachSound
INDIRI4
CNSTI4 0
NEI4 $196
line 350
;350:	{
line 351
;351:		shieldLoopSound = G_SoundIndex("sound/movers/doors/forcefield_lp.wav");
ADDRGP4 $198
ARGP4
ADDRLP4 1144
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 shieldLoopSound
ADDRLP4 1144
INDIRI4
ASGNI4
line 352
;352:		shieldAttachSound = G_SoundIndex("sound/weapons/detpack/stick.wav");
ADDRGP4 $199
ARGP4
ADDRLP4 1148
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 shieldAttachSound
ADDRLP4 1148
INDIRI4
ASGNI4
line 353
;353:		shieldActivateSound = G_SoundIndex("sound/movers/doors/forcefield_on.wav");
ADDRGP4 $200
ARGP4
ADDRLP4 1152
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 shieldActivateSound
ADDRLP4 1152
INDIRI4
ASGNI4
line 354
;354:		shieldDeactivateSound = G_SoundIndex("sound/movers/doors/forcefield_off.wav");
ADDRGP4 $201
ARGP4
ADDRLP4 1156
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 shieldDeactivateSound
ADDRLP4 1156
INDIRI4
ASGNI4
line 355
;355:		shieldDamageSound = G_SoundIndex("sound/effects/bumpfield.wav");
ADDRGP4 $202
ARGP4
ADDRLP4 1160
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 shieldDamageSound
ADDRLP4 1160
INDIRI4
ASGNI4
line 356
;356:		shieldItem = BG_FindItemForHoldable(HI_SHIELD);
CNSTI4 2
ARGI4
ADDRLP4 1164
ADDRGP4 BG_FindItemForHoldable
CALLP4
ASGNP4
ADDRGP4 shieldItem
ADDRLP4 1164
INDIRP4
ASGNP4
line 357
;357:	}
LABELV $196
line 360
;358:
;359:	// can we place this in front of us?
;360:	AngleVectors (playerent->client->ps.viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 16
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
ADDRGP4 AngleVectors
CALLV
pop
line 361
;361:	fwd[2] = 0;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 362
;362:	VectorMA(playerent->client->ps.origin, SHIELD_PLACEDIST, fwd, dest);
ADDRLP4 1148
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1152
CNSTF4 1115684864
ASGNF4
ADDRLP4 4
ADDRLP4 1148
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1152
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 1148
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1152
INDIRF4
ADDRLP4 16+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 16+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 363
;363:	JP_Trace (&tr, playerent->client->ps.origin, mins, maxs, dest, playerent->s.number, MASK_SHOT );
ADDRLP4 28
ARGP4
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1120
ARGP4
ADDRLP4 1132
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1156
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 364
;364:	if (tr.fraction > 0.9)
ADDRLP4 28+8
INDIRF4
CNSTF4 1063675494
LEF4 $208
line 365
;365:	{//room in front
line 366
;366:		VectorCopy(tr.endpos, pos);
ADDRLP4 1108
ADDRLP4 28+12
INDIRB
ASGNB 12
line 368
;367:		// drop to floor
;368:		VectorSet( dest, pos[0], pos[1], pos[2] - 4096 );
ADDRLP4 4
ADDRLP4 1108
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 1108+4
INDIRF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 1108+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 369
;369:		JP_Trace( &tr, pos, mins, maxs, dest, playerent->s.number, MASK_SOLID );
ADDRLP4 28
ARGP4
ADDRLP4 1108
ARGP4
ADDRLP4 1120
ARGP4
ADDRLP4 1132
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 370
;370:		if ( !tr.startsolid && !tr.allsolid )
ADDRLP4 1160
CNSTI4 0
ASGNI4
ADDRLP4 28+4
INDIRI4
ADDRLP4 1160
INDIRI4
NEI4 $216
ADDRLP4 28
INDIRI4
ADDRLP4 1160
INDIRI4
NEI4 $216
line 371
;371:		{
line 373
;372:			// got enough room so place the portable shield
;373:			shield = G_Spawn();
ADDRLP4 1164
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1164
INDIRP4
ASGNP4
line 376
;374:
;375:			// Figure out what direction the shield is facing.
;376:			if (fabs(fwd[0]) > fabs(fwd[1]))
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 1168
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 16+4
INDIRF4
ARGF4
ADDRLP4 1172
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 1168
INDIRF4
ADDRLP4 1172
INDIRF4
LEF4 $219
line 377
;377:			{	// shield is north/south, facing east.
line 378
;378:				shield->s.angles[YAW] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 0
ASGNF4
line 379
;379:			}
ADDRGP4 $220
JUMPV
LABELV $219
line 381
;380:			else
;381:			{	// shield is along the east/west axis, facing north
line 382
;382:				shield->s.angles[YAW] = 90;
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1119092736
ASGNF4
line 383
;383:			}
LABELV $220
line 384
;384:			shield->think = CreateShield;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 CreateShield
ASGNP4
line 385
;385:			shield->nextthink = level.time + 500;	// power up after .5 seconds
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 386
;386:			shield->parent = playerent;
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 389
;387:
;388:			// Set team number.
;389:			shield->s.otherEntityNum2 = playerent->client->sess.sessionTeam;
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 391
;390:
;391:			shield->s.eType = ET_SPECIAL;
ADDRLP4 1176
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 1176
INDIRI4
ADDP4
ADDRLP4 1176
INDIRI4
ASGNI4
line 392
;392:			shield->s.modelindex =  HI_SHIELD;	// this'll be used in CG_Useable() for rendering.
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 2
ASGNI4
line 393
;393:			G_SetClassName(shield, shieldItem->classname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 shieldItem
INDIRP4
INDIRP4
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 395
;394:
;395:			shield->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 397
;396:
;397:			shield->touch = 0;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 399
;398:			// using an item causes it to respawn
;399:			shield->use = 0; //Use_Item;
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
CNSTP4 0
ASGNP4
line 402
;400:
;401:			// allow to ride movers
;402:			shield->s.groundEntityNum = tr.entityNum;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 28+52
INDIRI4
ASGNI4
line 404
;403:
;404:			G_SetOrigin( shield, tr.endpos );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 406
;405:
;406:			shield->s.eFlags &= ~EF_NODRAW;
ADDRLP4 1180
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 1180
INDIRP4
ADDRLP4 1180
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 407
;407:			shield->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 1184
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1184
INDIRP4
ADDRLP4 1184
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 409
;408:
;409:			trap_LinkEntity (shield);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 411
;410:
;411:			shield->s.owner = playerent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 412
;412:			shield->s.shouldtarget = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
CNSTI4 1
ASGNI4
line 413
;413:			if (g_gametype.integer >= GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $225
line 414
;414:			{
line 415
;415:				shield->s.teamowner = playerent->client->sess.sessionTeam;
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 416
;416:			}
ADDRGP4 $226
JUMPV
LABELV $225
line 418
;417:			else
;418:			{
line 419
;419:				shield->s.teamowner = 16;
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
CNSTI4 16
ASGNI4
line 420
;420:			}
LABELV $226
line 423
;421:
;422:			// Play placing sound...
;423:			G_AddEvent(shield, EV_GENERAL_SOUND, shieldAttachSound);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRGP4 shieldAttachSound
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 425
;424:
;425:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $193
JUMPV
LABELV $216
line 427
;426:		}
;427:	}
LABELV $208
line 429
;428:	// no room
;429:	return qfalse;
CNSTI4 0
RETI4
LABELV $193
endproc PlaceShield 1188 28
export ItemUse_Binoculars
proc ItemUse_Binoculars 20 0
line 433
;430:}
;431:
;432:void ItemUse_Binoculars(gentity_t *ent)
;433:{
line 434
;434:	if (!ent || !ent->client)
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
EQU4 $231
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $229
LABELV $231
line 435
;435:	{
line 436
;436:		return;
ADDRGP4 $228
JUMPV
LABELV $229
line 439
;437:	}
;438:
;439:	if (ent->client->ps.weaponstate != WEAPON_READY)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
EQI4 $232
line 440
;440:	{ //So we can't fool it and reactivate while switching to the saber or something.
line 441
;441:		return;
ADDRGP4 $228
JUMPV
LABELV $232
line 444
;442:	}
;443:
;444:	if (ent->client->ps.weapon == WP_SABER)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $234
line 445
;445:	{ //No.
line 446
;446:		return;
ADDRGP4 $228
JUMPV
LABELV $234
line 449
;447:	}
;448:
;449:	if (ent->client->ps.zoomMode == 0) // not zoomed or currently zoomed with the disruptor
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
NEI4 $236
line 450
;450:	{
line 451
;451:		ent->client->ps.zoomMode = 2;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 2
ASGNI4
line 452
;452:		ent->client->ps.zoomLocked = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 453
;453:		ent->client->ps.zoomFov = 40.0f;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1344
ADDP4
CNSTF4 1109393408
ASGNF4
line 454
;454:	}
ADDRGP4 $237
JUMPV
LABELV $236
line 455
;455:	else if (ent->client->ps.zoomMode == 2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 2
NEI4 $238
line 456
;456:	{
line 457
;457:		ent->client->ps.zoomMode = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
CNSTI4 0
ASGNI4
line 458
;458:		ent->client->ps.zoomTime = LEVELTIME(ent->client);
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
EQU4 $244
ADDRLP4 16
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $244
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $246
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
ADDRGP4 $247
JUMPV
LABELV $246
ADDRLP4 12
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $247
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $245
JUMPV
LABELV $244
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $245
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1336
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 459
;459:	}
LABELV $238
LABELV $237
line 460
;460:}
LABELV $228
endproc ItemUse_Binoculars 20 0
export ItemUse_Shield
proc ItemUse_Shield 0 4
line 463
;461:
;462:void ItemUse_Shield(gentity_t *ent)
;463:{
line 464
;464:	PlaceShield(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 PlaceShield
CALLI4
pop
line 465
;465:}
LABELV $248
endproc ItemUse_Shield 0 4
export SentryTouch
proc SentryTouch 0 0
line 474
;466:
;467://--------------------------
;468:// PERSONAL ASSAULT SENTRY
;469://--------------------------
;470:
;471:#define PAS_DAMAGE	2
;472:
;473:void SentryTouch(gentity_t *ent, gentity_t *other, trace_t *trace)
;474:{
line 475
;475:	return;
LABELV $249
endproc SentryTouch 0 0
export pas_fire
proc pas_fire 40 32
line 481
;476:}
;477:
;478://----------------------------------------------------------------
;479:void pas_fire( gentity_t *ent )
;480://----------------------------------------------------------------
;481:{
line 484
;482:	vec3_t fwd, myOrg, enOrg;
;483:
;484:	VectorCopy(ent->r.currentOrigin, myOrg);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 485
;485:	myOrg[2] += 24;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 487
;486:
;487:	VectorCopy(ent->enemy->client->ps.origin, enOrg);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 488
;488:	enOrg[2] += 24;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 490
;489:
;490:	VectorSubtract(enOrg, myOrg, fwd);
ADDRLP4 12
ADDRLP4 24
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 491
;491:	VectorNormalize(fwd);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 493
;492:	
;493:	myOrg[0] += fwd[0]*16;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1098907648
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 494
;494:	myOrg[1] += fwd[1]*16;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1098907648
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 495
;495:	myOrg[2] += fwd[2]*16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 497
;496:
;497:	WP_FireTurretMissile(&g_entities[ent->boltpoint3], myOrg, fwd, qfalse, 10, 2300, MOD_SENTRY, ent );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 2352
ADDRLP4 36
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
CNSTI4 2300
ARGI4
CNSTI4 28
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 WP_FireTurretMissile
CALLV
pop
line 499
;498:
;499:	G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 500
;500:}
LABELV $250
endproc pas_fire 40 32
export G_SetEnemy
proc G_SetEnemy 0 0
line 503
;501:
;502:void G_SetEnemy( gentity_t *self, gentity_t *enemy )
;503:{
line 504
;504:	if (!enemy->client)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $264
line 505
;505:	{
line 506
;506:		return;
ADDRGP4 $263
JUMPV
LABELV $264
line 509
;507:	}
;508:
;509:	self->enemy = enemy;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 510
;510:}
LABELV $263
endproc G_SetEnemy 0 0
proc pas_find_enemies 5296 28
line 517
;511:
;512:#define TURRET_RADIUS 800
;513:
;514://-----------------------------------------------------
;515:static qboolean pas_find_enemies( gentity_t *self )
;516://-----------------------------------------------------
;517:{
line 518
;518:	qboolean	found = qfalse;
ADDRLP4 5232
CNSTI4 0
ASGNI4
line 520
;519:	int			count, i;
;520:	float		bestDist = TURRET_RADIUS*TURRET_RADIUS;
ADDRLP4 5228
CNSTF4 1226588160
ASGNF4
line 526
;521:	float		enemyDist;
;522:	vec3_t		enemyDir, org, org2;
;523:	gentity_t	*entity_list[MAX_GENTITIES], *target;
;524:	trace_t		tr;
;525:
;526:	if ( self->aimDebounceTime > level.time ) // time since we've been shut off
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $267
line 527
;527:	{
line 529
;528:		// We were active and alert, i.e. had an enemy in the last 3 secs
;529:		if ( self->painDebounceTime < level.time )
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $270
line 530
;530:		{
line 531
;531:			G_Sound(self, CHAN_BODY, G_SoundIndex( "sound/chars/turret/ping.wav" ));
ADDRGP4 $273
ARGP4
ADDRLP4 5236
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 5236
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 532
;532:			self->painDebounceTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 533
;533:		}
LABELV $270
line 534
;534:	}
LABELV $267
line 536
;535:
;536:	VectorCopy(self->s.pos.trBase, org2);
ADDRLP4 1088
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 538
;537:
;538:	count = G_RadiusList( org2, TURRET_RADIUS, self, qtrue, entity_list );
ADDRLP4 1088
ARGP4
CNSTF4 1145569280
ARGF4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1132
ARGP4
ADDRLP4 5236
ADDRGP4 G_RadiusList
CALLI4
ASGNI4
ADDRLP4 1128
ADDRLP4 5236
INDIRI4
ASGNI4
line 540
;539:
;540:	for ( i = 0; i < count; i++ )
ADDRLP4 1084
CNSTI4 0
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $275
line 541
;541:	{
line 542
;542:		target = entity_list[i];
ADDRLP4 0
ADDRLP4 1084
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1132
ADDP4
INDIRP4
ASGNP4
line 544
;543:
;544:		if ( !target->client )
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $279
line 545
;545:		{
line 546
;546:			continue;
ADDRGP4 $276
JUMPV
LABELV $279
line 548
;547:		}
;548:		if ( target == self || !target->takedamage || target->health <= 0 || ( target->flags & FL_NOTARGET ))
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $285
ADDRLP4 5244
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 5244
INDIRI4
EQI4 $285
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 5244
INDIRI4
LEI4 $285
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 5244
INDIRI4
EQI4 $281
LABELV $285
line 549
;549:		{
line 550
;550:			continue;
ADDRGP4 $276
JUMPV
LABELV $281
line 552
;551:		}
;552:		if ( self->noDamageTeam && target->client->sess.sessionTeam == self->noDamageTeam )
ADDRLP4 5248
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
ASGNI4
ADDRLP4 5248
INDIRI4
CNSTI4 0
EQI4 $286
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRLP4 5248
INDIRI4
NEI4 $286
line 553
;553:		{ 
line 554
;554:			continue;
ADDRGP4 $276
JUMPV
LABELV $286
line 556
;555:		}
;556:		if (self->boltpoint3 == target->s.number)
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
NEI4 $288
line 557
;557:		{
line 558
;558:			continue;
ADDRGP4 $276
JUMPV
LABELV $288
line 560
;559:		}
;560:		if ( !trap_InPVS( org2, target->r.currentOrigin ))
ADDRLP4 1088
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 5252
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 5252
INDIRI4
CNSTI4 0
NEI4 $290
line 561
;561:		{
line 562
;562:			continue;
ADDRGP4 $276
JUMPV
LABELV $290
line 565
;563:		}
;564:
;565:		if ( target->client )
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $292
line 566
;566:		{
line 567
;567:			VectorCopy( target->client->ps.origin, org );
ADDRLP4 1112
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 568
;568:		}
ADDRGP4 $293
JUMPV
LABELV $292
line 570
;569:		else
;570:		{
line 571
;571:			VectorCopy( target->r.currentOrigin, org );
ADDRLP4 1112
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 572
;572:		}
LABELV $293
line 574
;573:
;574:		JP_Trace( &tr, org2, NULL, NULL, org, self->s.number, MASK_SHOT );
ADDRLP4 4
ARGP4
ADDRLP4 1088
ARGP4
ADDRLP4 5256
CNSTP4 0
ASGNP4
ADDRLP4 5256
INDIRP4
ARGP4
ADDRLP4 5256
INDIRP4
ARGP4
ADDRLP4 1112
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
line 576
;575:
;576:		if ( !tr.allsolid && !tr.startsolid && ( tr.fraction == 1.0 || tr.entityNum == target->s.number ))
ADDRLP4 5260
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 5260
INDIRI4
NEI4 $294
ADDRLP4 4+4
INDIRI4
ADDRLP4 5260
INDIRI4
NEI4 $294
ADDRLP4 4+8
INDIRF4
CNSTF4 1065353216
EQF4 $299
ADDRLP4 4+52
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
NEI4 $294
LABELV $299
line 577
;577:		{
line 579
;578:			// Only acquire if have a clear shot, Is it in range and closer than our best?
;579:			VectorSubtract( target->r.currentOrigin, self->r.currentOrigin, enemyDir );
ADDRLP4 5268
CNSTI4 368
ASGNI4
ADDRLP4 5272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 0
INDIRP4
ADDRLP4 5268
INDIRI4
ADDP4
INDIRF4
ADDRLP4 5272
INDIRP4
ADDRLP4 5268
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5276
CNSTI4 372
ASGNI4
ADDRLP4 1100+4
ADDRLP4 0
INDIRP4
ADDRLP4 5276
INDIRI4
ADDP4
INDIRF4
ADDRLP4 5272
INDIRP4
ADDRLP4 5276
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5280
CNSTI4 376
ASGNI4
ADDRLP4 1100+8
ADDRLP4 0
INDIRP4
ADDRLP4 5280
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 5280
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 580
;580:			enemyDist = VectorLengthSquared( enemyDir );
ADDRLP4 1100
ARGP4
ADDRLP4 5284
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1124
ADDRLP4 5284
INDIRF4
ASGNF4
line 582
;581:
;582:			if ( enemyDist < bestDist )// all things equal, keep current
ADDRLP4 1124
INDIRF4
ADDRLP4 5228
INDIRF4
GEF4 $302
line 583
;583:			{
line 584
;584:				if ( self->attackDebounceTime + 100 < level.time )
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 100
ADDI4
ADDRGP4 level+36
INDIRI4
GEI4 $304
line 585
;585:				{
line 587
;586:					// We haven't fired or acquired an enemy in the last 2 seconds-start-up sound
;587:					G_Sound( self, CHAN_BODY, G_SoundIndex( "sound/chars/turret/startup.wav" ));
ADDRGP4 $307
ARGP4
ADDRLP4 5288
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 5288
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 590
;588:
;589:					// Wind up turrets for a bit
;590:					self->attackDebounceTime = level.time + 900 + random() * 200;
ADDRLP4 5292
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 900
ADDI4
CVIF4 4
CNSTF4 1128792064
ADDRLP4 5292
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
line 591
;591:				}
LABELV $304
line 593
;592:
;593:				G_SetEnemy( self, target );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetEnemy
CALLV
pop
line 594
;594:				bestDist = enemyDist;
ADDRLP4 5228
ADDRLP4 1124
INDIRF4
ASGNF4
line 595
;595:				found = qtrue;
ADDRLP4 5232
CNSTI4 1
ASGNI4
line 596
;596:			}
LABELV $302
line 597
;597:		}
LABELV $294
line 598
;598:	}
LABELV $276
line 540
ADDRLP4 1084
ADDRLP4 1084
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $278
ADDRLP4 1084
INDIRI4
ADDRLP4 1128
INDIRI4
LTI4 $275
line 600
;599:
;600:	return found;
ADDRLP4 5232
INDIRI4
RETI4
LABELV $266
endproc pas_find_enemies 5296 28
export pas_adjust_enemy
proc pas_adjust_enemy 1116 28
line 606
;601:}
;602:
;603://---------------------------------
;604:void pas_adjust_enemy( gentity_t *ent )
;605://---------------------------------
;606:{
line 608
;607:	trace_t	tr;
;608:	qboolean keep = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 610
;609:
;610:	if ( ent->enemy->health <= 0 )
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
GTI4 $310
line 611
;611:	{
line 612
;612:		keep = qfalse;
ADDRLP4 1080
CNSTI4 0
ASGNI4
line 613
;613:	}
ADDRGP4 $311
JUMPV
LABELV $310
line 615
;614:	else
;615:	{
line 618
;616:		vec3_t		org, org2;
;617:
;618:		VectorCopy(ent->s.pos.trBase, org2);
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 620
;619:
;620:		if ( ent->enemy->client )
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $312
line 621
;621:		{
line 622
;622:			VectorCopy( ent->enemy->client->ps.origin, org );
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 623
;623:			org[2] -= 15;
ADDRLP4 1084+8
ADDRLP4 1084+8
INDIRF4
CNSTF4 1097859072
SUBF4
ASGNF4
line 624
;624:		}
ADDRGP4 $313
JUMPV
LABELV $312
line 626
;625:		else
;626:		{
line 627
;627:			VectorCopy( ent->enemy->r.currentOrigin, org );
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 628
;628:		}
LABELV $313
line 630
;629:
;630:		JP_Trace( &tr, org2, NULL, NULL, org, ent->s.number, MASK_SHOT );
ADDRLP4 0
ARGP4
ADDRLP4 1096
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
ADDRLP4 1084
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
line 632
;631:
;632:		if ( tr.allsolid || tr.startsolid || tr.fraction < 0.9f || tr.entityNum == ent->s.number )
ADDRLP4 1112
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1112
INDIRI4
NEI4 $322
ADDRLP4 0+4
INDIRI4
ADDRLP4 1112
INDIRI4
NEI4 $322
ADDRLP4 0+8
INDIRF4
CNSTF4 1063675494
LTF4 $322
ADDRLP4 0+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $315
LABELV $322
line 633
;633:		{
line 634
;634:			if (tr.entityNum != ent->enemy->s.number)
ADDRLP4 0+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
INDIRI4
EQI4 $323
line 635
;635:			{
line 637
;636:				// trace failed
;637:				keep = qfalse;
ADDRLP4 1080
CNSTI4 0
ASGNI4
line 638
;638:			}
LABELV $323
line 639
;639:		}
LABELV $315
line 640
;640:	}
LABELV $311
line 642
;641:
;642:	if ( keep )
ADDRLP4 1080
INDIRI4
CNSTI4 0
EQI4 $326
line 643
;643:	{
line 645
;644:		//ent->bounceCount = level.time + 500 + random() * 150;
;645:	}
ADDRGP4 $327
JUMPV
LABELV $326
line 646
;646:	else if ( ent->bounceCount < level.time && ent->enemy ) // don't ping pong on and off
ADDRLP4 1084
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1084
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $328
ADDRLP4 1084
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $328
line 647
;647:	{
line 648
;648:		ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTP4 0
ASGNP4
line 650
;649:		// shut-down sound
;650:		G_Sound( ent, CHAN_BODY, G_SoundIndex( "sound/chars/turret/shutdown.wav" ));
ADDRGP4 $331
ARGP4
ADDRLP4 1088
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 1088
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 652
;651:	
;652:		ent->bounceCount = level.time + 500 + random() * 150;
ADDRLP4 1092
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
CNSTF4 1125515264
ADDRLP4 1092
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
line 655
;653:
;654:		// make turret play ping sound for 5 seconds
;655:		ent->aimDebounceTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 656
;656:	}
LABELV $328
LABELV $327
line 657
;657:}
LABELV $309
endproc pas_adjust_enemy 1116 28
export sentryExpire
proc sentryExpire 4 20
line 665
;658:
;659:#define TURRET_DEATH_DELAY 2000
;660:#define TURRET_LIFETIME 60000
;661:
;662:void turret_die(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod);
;663:
;664:void sentryExpire(gentity_t *self)
;665:{
line 666
;666:	turret_die(self, self, self, 1000, MOD_UNKNOWN);	
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
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1000
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 turret_die
CALLV
pop
line 667
;667:}
LABELV $334
endproc sentryExpire 4 20
export pas_think
proc pas_think 4252 16
line 672
;668:
;669://---------------------------------
;670:void pas_think( gentity_t *ent )
;671://---------------------------------
;672:{
line 679
;673:	qboolean	moved;
;674:	float		diffYaw, diffPitch;
;675:	vec3_t		enemyDir, org;
;676:	vec3_t		desiredAngles;
;677:	int			iEntityList[MAX_GENTITIES];
;678:	int			numListedEntities;
;679:	int			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 680
;680:	qboolean	clTrapped = qfalse;
ADDRLP4 4104
CNSTI4 0
ASGNI4
line 683
;681:	vec3_t		testMins, testMaxs;
;682:
;683:	testMins[0] = ent->r.currentOrigin[0] + ent->r.mins[0]+4;
ADDRLP4 4180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4112
ADDRLP4 4180
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 4180
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 684
;684:	testMins[1] = ent->r.currentOrigin[1] + ent->r.mins[1]+4;
ADDRLP4 4184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4112+4
ADDRLP4 4184
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 4184
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 685
;685:	testMins[2] = ent->r.currentOrigin[2] + ent->r.mins[2]+4;
ADDRLP4 4188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4112+8
ADDRLP4 4188
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 4188
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 687
;686:
;687:	testMaxs[0] = ent->r.currentOrigin[0] + ent->r.maxs[0]-4;
ADDRLP4 4192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4124
ADDRLP4 4192
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
CNSTF4 1082130432
SUBF4
ASGNF4
line 688
;688:	testMaxs[1] = ent->r.currentOrigin[1] + ent->r.maxs[1]-4;
ADDRLP4 4196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4124+4
ADDRLP4 4196
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 4196
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
CNSTF4 1082130432
SUBF4
ASGNF4
line 689
;689:	testMaxs[2] = ent->r.currentOrigin[2] + ent->r.maxs[2]-4;
ADDRLP4 4200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4124+8
ADDRLP4 4200
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 4200
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
CNSTF4 1082130432
SUBF4
ASGNF4
line 691
;690:
;691:	numListedEntities = trap_EntitiesInBox( testMins, testMaxs, iEntityList, MAX_GENTITIES );
ADDRLP4 4112
ARGP4
ADDRLP4 4124
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4204
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4100
ADDRLP4 4204
INDIRI4
ASGNI4
ADDRGP4 $341
JUMPV
LABELV $340
line 694
;692:
;693:	while (i < numListedEntities)
;694:	{
line 695
;695:		if (iEntityList[i] < MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 32
GEI4 $343
line 696
;696:		{ //client stuck inside me. go nonsolid.
line 697
;697:			int clNum = iEntityList[i];
ADDRLP4 4208
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 699
;698:
;699:			numListedEntities = trap_EntitiesInBox( g_entities[clNum].r.absmin, g_entities[clNum].r.absmax, iEntityList, MAX_GENTITIES );
ADDRLP4 4212
CNSTI4 2352
ADDRLP4 4208
INDIRI4
MULI4
ASGNI4
ADDRLP4 4212
INDIRI4
ADDRGP4 g_entities+296+48
ADDP4
ARGP4
ADDRLP4 4212
INDIRI4
ADDRGP4 g_entities+296+60
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4216
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4100
ADDRLP4 4216
INDIRI4
ASGNI4
line 701
;700:
;701:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $350
JUMPV
LABELV $349
line 703
;702:			while (i < numListedEntities)
;703:			{
line 704
;704:				if (iEntityList[i] == ent->s.number)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $352
line 705
;705:				{
line 706
;706:					clTrapped = qtrue;
ADDRLP4 4104
CNSTI4 1
ASGNI4
line 707
;707:					break;
ADDRGP4 $342
JUMPV
LABELV $352
line 709
;708:				}
;709:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 710
;710:			}
LABELV $350
line 702
ADDRLP4 0
INDIRI4
ADDRLP4 4100
INDIRI4
LTI4 $349
line 711
;711:			break;
ADDRGP4 $342
JUMPV
LABELV $343
line 714
;712:		}
;713:
;714:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 715
;715:	}
LABELV $341
line 693
ADDRLP4 0
INDIRI4
ADDRLP4 4100
INDIRI4
LTI4 $340
LABELV $342
line 717
;716:
;717:	if (clTrapped)
ADDRLP4 4104
INDIRI4
CNSTI4 0
EQI4 $354
line 718
;718:	{
line 719
;719:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 720
;720:		ent->s.fireflag = 0;
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 0
ASGNI4
line 721
;721:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 722
;722:		return;
ADDRGP4 $335
JUMPV
LABELV $354
line 725
;723:	}
;724:	else
;725:	{
line 726
;726:		ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 727
;727:	}
line 729
;728:
;729:	if (!g_entities[ent->boltpoint3].inuse || !g_entities[ent->boltpoint3].client ||
ADDRLP4 4208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4212
CNSTI4 2352
ADDRLP4 4208
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 4212
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $363
ADDRLP4 4212
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $363
ADDRLP4 4212
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRLP4 4208
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
EQI4 $357
LABELV $363
line 731
;730:		(int)g_entities[ent->boltpoint3].client->sess.sessionTeam != ent->boltpoint2)
;731:	{
line 732
;732:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 733
;733:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 734
;734:		return;
ADDRGP4 $335
JUMPV
LABELV $357
line 739
;735:	}
;736:
;737://	G_RunObject(ent);
;738:
;739:	if ( !ent->damage )
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $365
line 740
;740:	{
line 741
;741:		ent->damage = 1;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 1
ASGNI4
line 742
;742:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 743
;743:		return;
ADDRGP4 $335
JUMPV
LABELV $365
line 746
;744:	}
;745:
;746:	if ((ent->bolt_LLeg+TURRET_LIFETIME) < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 60000
ADDI4
ADDRGP4 level+36
INDIRI4
GEI4 $368
line 747
;747:	{
line 748
;748:		G_Sound( ent, CHAN_BODY, G_SoundIndex( "sound/chars/turret/shutdown.wav" ));
ADDRGP4 $331
ARGP4
ADDRLP4 4216
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4216
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 749
;749:		ent->s.bolt2 = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1023
ASGNI4
line 750
;750:		ent->s.fireflag = 2;
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 2
ASGNI4
line 752
;751:
;752:		ent->think = sentryExpire;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 sentryExpire
ASGNP4
line 753
;753:		ent->nextthink = level.time + TURRET_DEATH_DELAY;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 754
;754:		return;
ADDRGP4 $335
JUMPV
LABELV $368
line 757
;755:	}
;756:
;757:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 759
;758:
;759:	if ( ent->enemy )
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $373
line 760
;760:	{
line 762
;761:		// make sure that the enemy is still valid
;762:		pas_adjust_enemy( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 pas_adjust_enemy
CALLV
pop
line 763
;763:	}
LABELV $373
line 765
;764:
;765:	if (ent->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $375
line 766
;766:	{
line 767
;767:		if (!ent->enemy->client)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $377
line 768
;768:		{
line 769
;769:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTP4 0
ASGNP4
line 770
;770:		}
ADDRGP4 $378
JUMPV
LABELV $377
line 771
;771:		else if (ent->enemy->s.number == ent->s.number)
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4216
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
INDIRI4
ADDRLP4 4216
INDIRP4
INDIRI4
NEI4 $379
line 772
;772:		{
line 773
;773:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTP4 0
ASGNP4
line 774
;774:		}
ADDRGP4 $380
JUMPV
LABELV $379
line 775
;775:		else if (ent->enemy->health < 1)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $381
line 776
;776:		{
line 777
;777:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTP4 0
ASGNP4
line 778
;778:		}
LABELV $381
LABELV $380
LABELV $378
line 779
;779:	}
LABELV $375
line 781
;780:
;781:	if ( !ent->enemy )
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $383
line 782
;782:	{
line 783
;783:		pas_find_enemies( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 pas_find_enemies
CALLI4
pop
line 784
;784:	}
LABELV $383
line 786
;785:
;786:	if (ent->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $385
line 787
;787:	{
line 788
;788:		ent->s.bolt2 = ent->enemy->s.number;
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4216
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 4216
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
INDIRI4
ASGNI4
line 789
;789:	}
ADDRGP4 $386
JUMPV
LABELV $385
line 791
;790:	else
;791:	{
line 792
;792:		ent->s.bolt2 = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1023
ASGNI4
line 793
;793:	}
LABELV $386
line 795
;794:
;795:	moved = qfalse;
ADDRLP4 4140
CNSTI4 0
ASGNI4
line 796
;796:	diffYaw = 0.0f; diffPitch = 0.0f;
ADDRLP4 4108
CNSTF4 0
ASGNF4
ADDRLP4 4136
CNSTF4 0
ASGNF4
line 798
;797:
;798:	ent->speed = AngleNormalize360( ent->speed );
ADDRLP4 4216
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ASGNP4
ADDRLP4 4216
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4220
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 4216
INDIRP4
ADDRLP4 4220
INDIRF4
ASGNF4
line 799
;799:	ent->random = AngleNormalize360( ent->random );
ADDRLP4 4224
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ASGNP4
ADDRLP4 4224
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4228
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 4224
INDIRP4
ADDRLP4 4228
INDIRF4
ASGNF4
line 801
;800:
;801:	if ( ent->enemy )
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $387
line 802
;802:	{
line 805
;803:		// ...then we'll calculate what new aim adjustments we should attempt to make this frame
;804:		// Aim at enemy
;805:		if ( ent->enemy->client )
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $389
line 806
;806:		{
line 807
;807:			VectorCopy( ent->enemy->client->ps.origin, org );
ADDRLP4 4156
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 808
;808:		}
ADDRGP4 $390
JUMPV
LABELV $389
line 810
;809:		else
;810:		{
line 811
;811:			VectorCopy( ent->enemy->r.currentOrigin, org );
ADDRLP4 4156
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 812
;812:		}
LABELV $390
line 814
;813:
;814:		VectorSubtract( org, ent->r.currentOrigin, enemyDir );
ADDRLP4 4232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4144
ADDRLP4 4156
INDIRF4
ADDRLP4 4232
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4144+4
ADDRLP4 4156+4
INDIRF4
ADDRLP4 4232
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4144+8
ADDRLP4 4156+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 815
;815:		vectoangles( enemyDir, desiredAngles );
ADDRLP4 4144
ARGP4
ADDRLP4 4168
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 817
;816:
;817:		diffYaw = AngleSubtract( ent->speed, desiredAngles[YAW] );
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ARGF4
ADDRLP4 4168+4
INDIRF4
ARGF4
ADDRLP4 4236
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 4108
ADDRLP4 4236
INDIRF4
ASGNF4
line 818
;818:		diffPitch = AngleSubtract( ent->random, desiredAngles[PITCH] );
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
ARGF4
ADDRLP4 4168
INDIRF4
ARGF4
ADDRLP4 4240
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 4136
ADDRLP4 4240
INDIRF4
ASGNF4
line 819
;819:	}
ADDRGP4 $388
JUMPV
LABELV $387
line 821
;820:	else
;821:	{
line 823
;822:		// no enemy, so make us slowly sweep back and forth as if searching for a new one
;823:		diffYaw = sin( level.time * 0.0001f + ent->count ) * 2.0f;
CNSTF4 953267991
ADDRGP4 level+36
INDIRI4
CVIF4 4
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRLP4 4232
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4108
CNSTF4 1073741824
ADDRLP4 4232
INDIRF4
MULF4
ASGNF4
line 824
;824:	}
LABELV $388
line 826
;825:
;826:	if ( fabs(diffYaw) > 0.25f )
ADDRLP4 4108
INDIRF4
ARGF4
ADDRLP4 4232
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4232
INDIRF4
CNSTF4 1048576000
LEF4 $397
line 827
;827:	{
line 828
;828:		moved = qtrue;
ADDRLP4 4140
CNSTI4 1
ASGNI4
line 830
;829:
;830:		if ( fabs(diffYaw) > 10.0f )
ADDRLP4 4108
INDIRF4
ARGF4
ADDRLP4 4236
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4236
INDIRF4
CNSTF4 1092616192
LEF4 $399
line 831
;831:		{
line 833
;832:			// cap max speed
;833:			ent->speed += (diffYaw > 0.0f) ? -10.0f : 10.0f;
ADDRLP4 4108
INDIRF4
CNSTF4 0
LEF4 $402
ADDRLP4 4240
CNSTF4 3240099840
ASGNF4
ADDRGP4 $403
JUMPV
LABELV $402
ADDRLP4 4240
CNSTF4 1092616192
ASGNF4
LABELV $403
ADDRLP4 4244
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ASGNP4
ADDRLP4 4244
INDIRP4
ADDRLP4 4244
INDIRP4
INDIRF4
ADDRLP4 4240
INDIRF4
ADDF4
ASGNF4
line 834
;834:		}
ADDRGP4 $400
JUMPV
LABELV $399
line 836
;835:		else
;836:		{
line 838
;837:			// small enough
;838:			ent->speed -= diffYaw;
ADDRLP4 4240
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ASGNP4
ADDRLP4 4240
INDIRP4
ADDRLP4 4240
INDIRP4
INDIRF4
ADDRLP4 4108
INDIRF4
SUBF4
ASGNF4
line 839
;839:		}
LABELV $400
line 840
;840:	}
LABELV $397
line 843
;841:
;842:
;843:	if ( fabs(diffPitch) > 0.25f )
ADDRLP4 4136
INDIRF4
ARGF4
ADDRLP4 4236
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4236
INDIRF4
CNSTF4 1048576000
LEF4 $404
line 844
;844:	{
line 845
;845:		moved = qtrue;
ADDRLP4 4140
CNSTI4 1
ASGNI4
line 847
;846:
;847:		if ( fabs(diffPitch) > 4.0f )
ADDRLP4 4136
INDIRF4
ARGF4
ADDRLP4 4240
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4240
INDIRF4
CNSTF4 1082130432
LEF4 $406
line 848
;848:		{
line 850
;849:			// cap max speed
;850:			ent->random += (diffPitch > 0.0f) ? -4.0f : 4.0f;
ADDRLP4 4136
INDIRF4
CNSTF4 0
LEF4 $409
ADDRLP4 4244
CNSTF4 3229614080
ASGNF4
ADDRGP4 $410
JUMPV
LABELV $409
ADDRLP4 4244
CNSTF4 1082130432
ASGNF4
LABELV $410
ADDRLP4 4248
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ASGNP4
ADDRLP4 4248
INDIRP4
ADDRLP4 4248
INDIRP4
INDIRF4
ADDRLP4 4244
INDIRF4
ADDF4
ASGNF4
line 851
;851:		}
ADDRGP4 $407
JUMPV
LABELV $406
line 853
;852:		else
;853:		{
line 855
;854:			// small enough
;855:			ent->random -= diffPitch;
ADDRLP4 4244
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ASGNP4
ADDRLP4 4244
INDIRP4
ADDRLP4 4244
INDIRP4
INDIRF4
ADDRLP4 4136
INDIRF4
SUBF4
ASGNF4
line 856
;856:		}
LABELV $407
line 857
;857:	}
LABELV $404
line 859
;858:
;859:	if ( moved )
ADDRLP4 4140
INDIRI4
CNSTI4 0
EQI4 $411
line 860
;860:	{
line 862
;861:	//ent->s.loopSound = G_SoundIndex( "sound/chars/turret/move.wav" );
;862:	}
ADDRGP4 $412
JUMPV
LABELV $411
line 864
;863:	else
;864:	{
line 865
;865:		ent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 866
;866:	}
LABELV $412
line 868
;867:
;868:	if ( ent->enemy && ent->attackDebounceTime < level.time )
ADDRLP4 4240
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4240
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $413
ADDRLP4 4240
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $413
line 869
;869:	{
line 870
;870:		ent->count--;
ADDRLP4 4244
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ASGNP4
ADDRLP4 4244
INDIRP4
ADDRLP4 4244
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 872
;871:
;872:		if ( ent->count )
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
EQI4 $416
line 873
;873:		{
line 874
;874:			pas_fire( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 pas_fire
CALLV
pop
line 875
;875:			ent->s.fireflag = 1;
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 1
ASGNI4
line 876
;876:			ent->attackDebounceTime = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 877
;877:		}
ADDRGP4 $414
JUMPV
LABELV $416
line 879
;878:		else
;879:		{
line 881
;880:			//ent->nextthink = 0;
;881:			G_Sound( ent, CHAN_BODY, G_SoundIndex( "sound/chars/turret/shutdown.wav" ));
ADDRGP4 $331
ARGP4
ADDRLP4 4248
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4248
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 882
;882:			ent->s.bolt2 = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1023
ASGNI4
line 883
;883:			ent->s.fireflag = 2;
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 2
ASGNI4
line 885
;884:
;885:			ent->think = sentryExpire;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 sentryExpire
ASGNP4
line 886
;886:			ent->nextthink = level.time + TURRET_DEATH_DELAY;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 887
;887:		}
line 888
;888:	}
ADDRGP4 $414
JUMPV
LABELV $413
line 890
;889:	else
;890:	{
line 891
;891:		ent->s.fireflag = 0;
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
CNSTI4 0
ASGNI4
line 892
;892:	}
LABELV $414
line 893
;893:}
LABELV $335
endproc pas_think 4252 16
export turret_die
proc turret_die 12 24
line 898
;894:
;895://------------------------------------------------------------------------------------------------------------
;896:void turret_die(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;897://------------------------------------------------------------------------------------------------------------
;898:{
line 900
;899:	// Turn off the thinking of the base & use it's targets
;900:	self->think = 0;//NULL;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTP4 0
ASGNP4
line 901
;901:	self->use = 0;//NULL;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
CNSTP4 0
ASGNP4
line 903
;902:
;903:	if ( self->target )
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $421
line 904
;904:	{
line 905
;905:		G_UseTargets( self, attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 906
;906:	}
LABELV $421
line 908
;907:
;908:	if (!g_entities[self->boltpoint3].inuse || !g_entities[self->boltpoint3].client)
ADDRLP4 0
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $427
ADDRLP4 0
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $423
LABELV $427
line 909
;909:	{
line 910
;910:		G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 911
;911:		return;
ADDRGP4 $420
JUMPV
LABELV $423
line 915
;912:	}
;913:
;914:	// clear my data
;915:	self->die  = 0;//NULL;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTP4 0
ASGNP4
line 916
;916:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 917
;917:	self->health = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 920
;918:
;919:	// hack the effect angle so that explode death can orient the effect properly
;920:	VectorSet( self->s.angles, 0, 0, 1 );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 1065353216
ASGNF4
line 922
;921:
;922:	G_PlayEffect(EFFECT_EXPLOSION_PAS, self->s.pos.trBase, self->s.angles);
CNSTI4 3
ARGI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 923
;923:	G_RadiusDamage(self->s.pos.trBase, &g_entities[self->boltpoint3], 30, 256, self, MOD_UNKNOWN);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 2352
ADDRLP4 8
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTF4 1106247680
ARGF4
CNSTF4 1132462080
ARGF4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 925
;924:
;925:	g_entities[self->boltpoint3].client->ps.fd.sentryDeployed = qfalse;
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1224
ADDP4
CNSTI4 0
ASGNI4
line 928
;926:
;927:	//ExplodeDeath( self );
;928:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 929
;929:}
LABELV $420
endproc turret_die 12 24
export SP_PAS
proc SP_PAS 4 12
line 936
;930:
;931:#define TURRET_AMMO_COUNT 40
;932:
;933://---------------------------------
;934:void SP_PAS( gentity_t *base )
;935://---------------------------------
;936:{
line 937
;937:	if ( base->count == 0 )
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
NEI4 $430
line 938
;938:	{
line 940
;939:		// give ammo
;940:		base->count = TURRET_AMMO_COUNT;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 40
ASGNI4
line 941
;941:	}
LABELV $430
line 943
;942:
;943:	base->s.bolt1 = 1; //This is a sort of hack to indicate that this model needs special turret things done to it
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
CNSTI4 1
ASGNI4
line 944
;944:	base->s.bolt2 = ENTITYNUM_NONE; //store our current enemy index
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1023
ASGNI4
line 946
;945:
;946:	base->damage = 0; // start animation flag
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 0
ASGNI4
line 948
;947:
;948:	VectorSet( base->r.mins, -8, -8, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 0
ASGNF4
line 949
;949:	VectorSet( base->r.maxs, 8, 8, 24 );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1103101952
ASGNF4
line 951
;950:
;951:	G_RunObject(base);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 953
;952:
;953:	base->think = pas_think;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 pas_think
ASGNP4
line 954
;954:	base->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 956
;955:
;956:	if ( !base->health )
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $433
line 957
;957:	{
line 958
;958:		base->health = 50;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 50
ASGNI4
line 959
;959:	}
LABELV $433
line 961
;960:
;961:	base->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 962
;962:	base->die  = turret_die;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 turret_die
ASGNP4
line 964
;963:
;964:	base->physicsObject = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 966
;965:
;966:	G_Sound( base, CHAN_BODY, G_SoundIndex( "sound/chars/turret/startup.wav" ));
ADDRGP4 $307
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 967
;967:}
LABELV $429
endproc SP_PAS 4 12
export ItemUse_Sentry
proc ItemUse_Sentry 116 16
line 972
;968:
;969://------------------------------------------------------------------------
;970:void ItemUse_Sentry( gentity_t *ent )
;971://------------------------------------------------------------------------
;972:{
line 978
;973:	vec3_t fwd, fwdorg;
;974:	vec3_t yawonly;
;975:	vec3_t mins, maxs;
;976:	gentity_t *sentry;
;977:
;978:	if (!ent || !ent->client)
ADDRLP4 64
ADDRFP4 0
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
EQU4 $438
ADDRLP4 64
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
NEU4 $436
LABELV $438
line 979
;979:	{
line 980
;980:		return;
ADDRGP4 $435
JUMPV
LABELV $436
line 983
;981:	}
;982:
;983:	VectorSet( mins, -8, -8, 0 );
ADDRLP4 72
CNSTF4 3238002688
ASGNF4
ADDRLP4 40
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 40+4
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 40+8
CNSTF4 0
ASGNF4
line 984
;984:	VectorSet( maxs, 8, 8, 24 );
ADDRLP4 76
CNSTF4 1090519040
ASGNF4
ADDRLP4 52
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRLP4 52+8
CNSTF4 1103101952
ASGNF4
line 987
;985:
;986:
;987:	yawonly[ROLL] = 0;
ADDRLP4 28+8
CNSTF4 0
ASGNF4
line 988
;988:	yawonly[PITCH] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
line 989
;989:	yawonly[YAW] = ent->client->ps.viewangles[YAW];
ADDRLP4 28+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 991
;990:
;991:	AngleVectors(yawonly, fwd, NULL, NULL);
ADDRLP4 28
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 80
CNSTP4 0
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 993
;992:
;993:	fwdorg[0] = ent->client->ps.origin[0] + fwd[0]*64;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
line 994
;994:	fwdorg[1] = ent->client->ps.origin[1] + fwd[1]*64;
ADDRLP4 16+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 4+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 995
;995:	fwdorg[2] = ent->client->ps.origin[2] + fwd[2]*64;
ADDRLP4 16+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 4+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 997
;996:
;997:	sentry = G_Spawn();
ADDRLP4 84
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 84
INDIRP4
ASGNP4
line 999
;998:
;999:	G_SetClassName(sentry, "sentryGun");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $449
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 1000
;1000:	sentry->s.modelindex = G_ModelIndex("models/items/psgun.glm"); //replace ASAP
ADDRGP4 $450
ARGP4
ADDRLP4 88
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 1002
;1001:
;1002:	sentry->s.g2radius = 30.0f;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 30
ASGNI4
line 1003
;1003:	sentry->s.modelGhoul2 = 1;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 1005
;1004:
;1005:	G_SetOrigin(sentry, fwdorg);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1006
;1006:	sentry->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1007
;1007:	sentry->r.contents = CONTENTS_SOLID;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 1008
;1008:	sentry->s.solid = 2;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 1009
;1009:	sentry->clipmask = MASK_SOLID;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 1
ASGNI4
line 1010
;1010:	VectorCopy(mins, sentry->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 40
INDIRB
ASGNB 12
line 1011
;1011:	VectorCopy(maxs, sentry->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 52
INDIRB
ASGNB 12
line 1012
;1012:	sentry->boltpoint3 = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 820
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1013
;1013:	sentry->boltpoint2 = ent->client->sess.sessionTeam; //so we can remove ourself if our owner changes teams
ADDRLP4 0
INDIRP4
CNSTI4 816
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 1014
;1014:	sentry->r.absmin[0] = sentry->s.pos.trBase[0] + sentry->r.mins[0];
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1015
;1015:	sentry->r.absmin[1] = sentry->s.pos.trBase[1] + sentry->r.mins[1];
ADDRLP4 0
INDIRP4
CNSTI4 348
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1016
;1016:	sentry->r.absmin[2] = sentry->s.pos.trBase[2] + sentry->r.mins[2];
ADDRLP4 0
INDIRP4
CNSTI4 352
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1017
;1017:	sentry->r.absmax[0] = sentry->s.pos.trBase[0] + sentry->r.maxs[0];
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1018
;1018:	sentry->r.absmax[1] = sentry->s.pos.trBase[1] + sentry->r.maxs[1];
ADDRLP4 0
INDIRP4
CNSTI4 360
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1019
;1019:	sentry->r.absmax[2] = sentry->s.pos.trBase[2] + sentry->r.maxs[2];
ADDRLP4 0
INDIRP4
CNSTI4 364
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1020
;1020:	sentry->s.eType = ET_GENERAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1021
;1021:	sentry->s.pos.trType = TR_GRAVITY;//STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1022
;1022:	sentry->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1023
;1023:	sentry->touch = SentryTouch;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 SentryTouch
ASGNP4
line 1024
;1024:	sentry->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1025
;1025:	sentry->boltpoint4 = ENTITYNUM_NONE; //boltpoint4 used as enemy index
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 1023
ASGNI4
line 1027
;1026:
;1027:	sentry->bolt_Head = 1000;
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 1000
ASGNI4
line 1029
;1028:
;1029:	sentry->bolt_LLeg = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 840
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1031
;1030:
;1031:	sentry->noDamageTeam = ent->client->sess.sessionTeam;
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 1033
;1032:
;1033:	ent->client->ps.fd.sentryDeployed = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1224
ADDP4
CNSTI4 1
ASGNI4
line 1035
;1034:
;1035:	trap_LinkEntity(sentry);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1037
;1036:
;1037:	sentry->s.owner = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1038
;1038:	sentry->s.shouldtarget = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
CNSTI4 1
ASGNI4
line 1039
;1039:	if (g_gametype.integer >= GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $454
line 1040
;1040:	{
line 1041
;1041:		sentry->s.teamowner = ent->client->sess.sessionTeam;
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 1042
;1042:	}
ADDRGP4 $455
JUMPV
LABELV $454
line 1044
;1043:	else
;1044:	{
line 1045
;1045:		sentry->s.teamowner = 16;
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
CNSTI4 16
ASGNI4
line 1046
;1046:	}
LABELV $455
line 1048
;1047:
;1048:	SP_PAS( sentry );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 SP_PAS
CALLV
pop
line 1049
;1049:}
LABELV $435
endproc ItemUse_Sentry 116 16
export ItemUse_Seeker
proc ItemUse_Seeker 20 0
line 1053
;1050:
;1051:
;1052:void ItemUse_Seeker(gentity_t *ent)
;1053:{
line 1054
;1054:	int nowTime = LEVELTIME(ent->client);
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
EQU4 $462
ADDRLP4 12
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
ADDRGP4 $465
JUMPV
LABELV $464
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $465
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $463
JUMPV
LABELV $462
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $463
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1055
;1055:	ent->client->ps.eFlags |= EF_SEEKERDRONE;
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
CNSTI4 1048576
BORI4
ASGNI4
line 1057
;1056:
;1057:	ent->client->ps.droneExistTime = nowTime + 30000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 30000
ADDI4
CVIF4 4
ASGNF4
line 1058
;1058:	ent->client->ps.droneFireTime = nowTime + 1500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 628
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1500
ADDI4
CVIF4 4
ASGNF4
line 1059
;1059:}
LABELV $457
endproc ItemUse_Seeker 20 0
export ItemUse_MedPack
proc ItemUse_MedPack 40 0
line 1062
;1060:
;1061:void ItemUse_MedPack(gentity_t *ent)
;1062:{
line 1063
;1063:	int bactaExtra = ent->client->bactaExtra;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 53192
ADDP4
INDIRI4
ASGNI4
line 1064
;1064:	if (!ent || !ent->client)
ADDRLP4 4
ADDRFP4 0
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
EQU4 $469
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $467
LABELV $469
line 1065
;1065:	{
line 1066
;1066:		return;
ADDRGP4 $466
JUMPV
LABELV $467
line 1069
;1067:	}
;1068:
;1069:	if (ent->health <= 0 ||
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $473
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $473
ADDRLP4 20
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 16
INDIRI4
EQI4 $470
LABELV $473
line 1072
;1070:		ent->client->ps.stats[STAT_HEALTH] <= 0 ||
;1071:		(ent->client->ps.eFlags & EF_DEAD))
;1072:	{
line 1073
;1073:		return;
ADDRGP4 $466
JUMPV
LABELV $470
line 1076
;1074:	}
;1075:
;1076:	if (ent->health >= ent->client->ps.stats[STAT_MAX_HEALTH] + bactaExtra)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
LTI4 $474
line 1077
;1077:	{
line 1078
;1078:		return;
ADDRGP4 $466
JUMPV
LABELV $474
line 1081
;1079:	}
;1080:
;1081:	ent->health += MAX_MEDPACK_HEAL_AMOUNT + bactaExtra;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDI4
ADDI4
ASGNI4
line 1083
;1082:
;1083:	if (ent->health > ent->client->ps.stats[STAT_MAX_HEALTH] + bactaExtra)
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
ADDRLP4 0
INDIRI4
ADDI4
LEI4 $476
line 1084
;1084:	{
line 1085
;1085:		ent->health = ent->client->ps.stats[STAT_MAX_HEALTH] + bactaExtra;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 1086
;1086:	}
LABELV $476
line 1087
;1087:}
LABELV $466
endproc ItemUse_MedPack 40 0
export Pickup_Powerup
proc Pickup_Powerup 1156 28
line 1089
;1088:
;1089:int Pickup_Powerup( gentity_t *ent, gentity_t *other ) {
line 1094
;1090:	int			quantity;
;1091:	int			i;
;1092:	gclient_t	*client;
;1093:
;1094:	if ( !other->client->ps.powerups[ent->item->giTag] ) {
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $479
line 1097
;1095:		// round timing to seconds to make multiple powerup timers
;1096:		// count in sync
;1097:		other->client->ps.powerups[ent->item->giTag] = 
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 1100
;1098:			level.time - ( level.time % 1000 );
;1099:
;1100:		G_LogWeaponPowerup(other->s.number, ent->item->giTag);
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponPowerup
CALLV
pop
line 1101
;1101:	}
LABELV $479
line 1103
;1102:
;1103:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
EQI4 $483
line 1104
;1104:		quantity = ent->count;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 1105
;1105:	} else {
ADDRGP4 $484
JUMPV
LABELV $483
line 1106
;1106:		quantity = ent->item->quantity;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 1107
;1107:	}
LABELV $484
line 1109
;1108:
;1109:	other->client->ps.powerups[ent->item->giTag] += quantity * 1000;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1000
ADDRLP4 8
INDIRI4
MULI4
ADDI4
ASGNI4
line 1111
;1110:
;1111:	if (ent->item->giTag == PW_YSALAMIRI)
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 15
NEI4 $485
line 1112
;1112:	{
line 1113
;1113:		other->client->ps.powerups[PW_FORCE_ENLIGHTENED_LIGHT] = 0;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 0
ASGNI4
line 1114
;1114:		other->client->ps.powerups[PW_FORCE_ENLIGHTENED_DARK] = 0;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 0
ASGNI4
line 1115
;1115:		other->client->ps.powerups[PW_FORCE_BOON] = 0;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 400
ADDP4
CNSTI4 0
ASGNI4
line 1116
;1116:	}
LABELV $485
line 1119
;1117:
;1118:	// give any nearby players a "denied" anti-reward
;1119:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $490
JUMPV
LABELV $487
line 1125
;1120:		vec3_t		delta;
;1121:		float		len;
;1122:		vec3_t		forward;
;1123:		trace_t		tr;
;1124:
;1125:		client = &level.clients[i];
ADDRLP4 0
CNSTI4 53196
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1126
;1126:		if ( client == other->client ) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
NEU4 $492
line 1127
;1127:			continue;
ADDRGP4 $488
JUMPV
LABELV $492
line 1129
;1128:		}
;1129:		if ( client->pers.connected == CON_DISCONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $494
line 1130
;1130:			continue;
ADDRGP4 $488
JUMPV
LABELV $494
line 1132
;1131:		}
;1132:		if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $496
line 1133
;1133:			continue;
ADDRGP4 $488
JUMPV
LABELV $496
line 1138
;1134:		}
;1135:
;1136:    // if same team in team game, no sound
;1137:    // cannot use OnSameTeam as it expects to g_entities, not clients
;1138:  	if ( g_gametype.integer >= GT_TEAM && other->client->sess.sessionTeam == client->sess.sessionTeam  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $498
ADDRLP4 1124
CNSTI4 43440
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 1124
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 1124
INDIRI4
ADDP4
INDIRI4
NEI4 $498
line 1139
;1139:      continue;
ADDRGP4 $488
JUMPV
LABELV $498
line 1143
;1140:    }
;1141:
;1142:		// if too far away, no sound
;1143:		VectorSubtract( ent->s.pos.trBase, client->ps.origin, delta );
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
CNSTI4 24
ASGNI4
ADDRLP4 16
ADDRLP4 1128
INDIRP4
ADDRLP4 1132
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 1128
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 1132
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1144
;1144:		len = VectorNormalize( delta );
ADDRLP4 16
ARGP4
ADDRLP4 1140
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 1140
INDIRF4
ASGNF4
line 1145
;1145:		if ( len > 192 ) {
ADDRLP4 40
INDIRF4
CNSTF4 1128267776
LEF4 $503
line 1146
;1146:			continue;
ADDRGP4 $488
JUMPV
LABELV $503
line 1150
;1147:		}
;1148:
;1149:		// if not facing, no sound
;1150:		AngleVectors( client->ps.viewangles, forward, NULL, NULL );
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 28
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
ADDRGP4 AngleVectors
CALLV
pop
line 1151
;1151:		if ( DotProduct( delta, forward ) < 0.4 ) {
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
MULF4
ADDF4
CNSTF4 1053609165
GEF4 $505
line 1152
;1152:			continue;
ADDRGP4 $488
JUMPV
LABELV $505
line 1156
;1153:		}
;1154:
;1155:		// if not line of sight, no sound
;1156:		JP_Trace( &tr, client->ps.origin, NULL, NULL, ent->s.pos.trBase, ENTITYNUM_NONE, CONTENTS_SOLID );
ADDRLP4 44
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1148
CNSTP4 0
ASGNP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1157
;1157:		if ( tr.fraction != 1.0 ) {
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
EQF4 $511
line 1158
;1158:			continue;
ADDRGP4 $488
JUMPV
LABELV $511
line 1162
;1159:		}
;1160:
;1161:		// anti-reward
;1162:		client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_DENIEDREWARD;
ADDRLP4 1152
ADDRLP4 0
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 1152
INDIRP4
ADDRLP4 1152
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 1163
;1163:	}
LABELV $488
line 1119
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $490
ADDRLP4 4
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $487
line 1164
;1164:	return RESPAWN_POWERUP;
CNSTI4 120
RETI4
LABELV $478
endproc Pickup_Powerup 1156 28
export Pickup_Holdable
proc Pickup_Holdable 12 12
line 1169
;1165:}
;1166:
;1167://======================================================================
;1168:
;1169:int Pickup_Holdable( gentity_t *ent, gentity_t *other ) {
line 1171
;1170:
;1171:	other->client->ps.stats[STAT_HOLDABLE_ITEM] = ent->item - bg_itemlist;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 220
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 1173
;1172:
;1173:	other->client->ps.stats[STAT_HOLDABLE_ITEMS] |= (1 << ent->item->giTag);
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BORI4
ASGNI4
line 1175
;1174:
;1175:	if (ent->item->giTag == HI_MEDPAC) {
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 3
NEI4 $515
line 1176
;1176:		other->client->bactaExtra = ent->bactaExtra; // make the client "remember" how much this bacta actually gives. q3 bactas give more. relevant for some q3df maps. or maybe just for kairos-nosf
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 53192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 2340
ADDP4
INDIRI4
ASGNI4
line 1177
;1177:	}
LABELV $515
line 1179
;1178:
;1179:	G_LogWeaponItem(other->s.number, ent->item->giTag);
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponItem
CALLV
pop
line 1181
;1180:
;1181:	return adjustRespawnTime(RESPAWN_HOLDABLE, ent->item->giType, ent->item->giTag);
CNSTF4 1114636288
ARGF4
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 adjustRespawnTime
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $514
endproc Pickup_Holdable 12 12
export Add_Ammo
proc Add_Ammo 24 0
line 1188
;1182:}
;1183:
;1184:
;1185://======================================================================
;1186:
;1187:void Add_Ammo (gentity_t *ent, int weapon, int count)
;1188:{
line 1189
;1189:	ent->client->ps.ammo[weapon] += count;
ADDRLP4 0
CNSTI4 408
ASGNI4
ADDRLP4 4
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
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
line 1190
;1190:	if ( ent->client->ps.ammo[weapon] > ammoData[weapon].max ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
CNSTI4 408
ASGNI4
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRGP4 ammoData
ADDP4
INDIRI4
LEI4 $518
line 1191
;1191:		ent->client->ps.ammo[weapon] = ammoData[weapon].max;
ADDRLP4 16
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 20
CNSTI4 408
ASGNI4
ADDRLP4 16
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDP4
ADDRLP4 16
INDIRI4
ADDRGP4 ammoData
ADDP4
INDIRI4
ASGNI4
line 1192
;1192:	}
LABELV $518
line 1193
;1193:}
LABELV $517
endproc Add_Ammo 24 0
export Pickup_Ammo
proc Pickup_Ammo 12 12
line 1196
;1194:
;1195:int Pickup_Ammo (gentity_t *ent, gentity_t *other)
;1196:{
line 1199
;1197:	int		quantity;
;1198:
;1199:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
EQI4 $521
line 1200
;1200:		quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 1201
;1201:	} else {
ADDRGP4 $522
JUMPV
LABELV $521
line 1202
;1202:		quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 1203
;1203:	}
LABELV $522
line 1205
;1204:
;1205:	Add_Ammo (other, ent->item->giTag, quantity);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Add_Ammo
CALLV
pop
line 1207
;1206:
;1207:	return adjustRespawnTime(RESPAWN_AMMO, ent->item->giType, ent->item->giTag);
CNSTF4 1109393408
ARGF4
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 adjustRespawnTime
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $520
endproc Pickup_Ammo 12 12
export Pickup_Weapon
proc Pickup_Weapon 16 12
line 1213
;1208:}
;1209:
;1210://======================================================================
;1211:
;1212:
;1213:int Pickup_Weapon (gentity_t *ent, gentity_t *other) {
line 1216
;1214:	int		quantity;
;1215:
;1216:	if ( ent->count < 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
GEI4 $524
line 1217
;1217:		quantity = 0; // None for you, sir!
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1218
;1218:	} else {
ADDRGP4 $525
JUMPV
LABELV $524
line 1219
;1219:		if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
EQI4 $526
line 1220
;1220:			quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 1221
;1221:		} else {
ADDRGP4 $527
JUMPV
LABELV $526
line 1222
;1222:			quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 1223
;1223:		}
LABELV $527
line 1226
;1224:
;1225:		// dropped items and teamplay weapons always have full ammo
;1226:		if ( ! (ent->flags & FL_DROPPED_ITEM) && g_gametype.integer != GT_TEAM ) {
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $528
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
EQI4 $528
line 1232
;1227:			// respawning rules
;1228:
;1229:			// New method:  If the player has less than half the minimum, give them the minimum, else add 1/2 the min.
;1230:
;1231:			// drop the quantity if the already have over the minimum
;1232:			if ( other->client->ps.ammo[ ent->item->giTag ] < quantity*0.5 ) {
ADDRLP4 4
CNSTI4 408
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
GEF4 $531
line 1233
;1233:				quantity = quantity - other->client->ps.ammo[ ent->item->giTag ];
ADDRLP4 8
CNSTI4 408
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1234
;1234:			} else {
ADDRGP4 $532
JUMPV
LABELV $531
line 1235
;1235:				quantity = quantity*0.5;		// only add half the value.
ADDRLP4 0
CNSTF4 1056964608
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1236
;1236:			}
LABELV $532
line 1247
;1237:
;1238:			// Old method:  If the player has less than the minimum, give them the minimum, else just add 1.
;1239:/*
;1240:			// drop the quantity if the already have over the minimum
;1241:			if ( other->client->ps.ammo[ ent->item->giTag ] < quantity ) {
;1242:				quantity = quantity - other->client->ps.ammo[ ent->item->giTag ];
;1243:			} else {
;1244:				quantity = 1;		// only add a single shot
;1245:			}
;1246:			*/
;1247:		}
LABELV $528
line 1248
;1248:	}
LABELV $525
line 1251
;1249:
;1250:	// add the weapon
;1251:	other->client->ps.stats[STAT_WEAPONS] |= ( 1 << ent->item->giTag );
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BORI4
ASGNI4
line 1254
;1252:
;1253:	//Add_Ammo( other, ent->item->giTag, quantity );
;1254:	Add_Ammo( other, weaponData[ent->item->giTag].ammoIndex, quantity );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 56
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Add_Ammo
CALLV
pop
line 1256
;1255:
;1256:	G_LogWeaponPickup(other->s.number, ent->item->giTag);
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogWeaponPickup
CALLV
pop
line 1259
;1257:	
;1258:	// team deathmatch has slow weapon respawns
;1259:	if ( g_gametype.integer == GT_TEAM ) 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $533
line 1260
;1260:	{
line 1261
;1261:		return adjustRespawnTime(RESPAWN_TEAM_WEAPON, ent->item->giType, ent->item->giTag);
CNSTF4 1106247680
ARGF4
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 adjustRespawnTime
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $523
JUMPV
LABELV $533
line 1264
;1262:	}
;1263:
;1264:	return adjustRespawnTime(g_weaponRespawn.integer, ent->item->giType, ent->item->giTag);
ADDRGP4 g_weaponRespawn+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 adjustRespawnTime
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
LABELV $523
endproc Pickup_Weapon 16 12
export Pickup_Health
proc Pickup_Health 28 12
line 1270
;1265:}
;1266:
;1267:
;1268://======================================================================
;1269:
;1270:int Pickup_Health (gentity_t *ent, gentity_t *other) {
line 1275
;1271:	int			max;
;1272:	int			quantity;
;1273:
;1274:	// small and mega healths will go over the max
;1275:	if ( ent->item->quantity != 5 && ent->item->quantity != 100 ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 5
EQI4 $538
ADDRLP4 8
INDIRI4
CNSTI4 100
EQI4 $538
line 1276
;1276:		max = other->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1277
;1277:	} else {
ADDRGP4 $539
JUMPV
LABELV $538
line 1278
;1278:		max = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1279
;1279:	}
LABELV $539
line 1281
;1280:
;1281:	if ( ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
EQI4 $540
line 1282
;1282:		quantity = ent->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 1283
;1283:	} else {
ADDRGP4 $541
JUMPV
LABELV $540
line 1284
;1284:		quantity = ent->item->quantity;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 1285
;1285:	}
LABELV $541
line 1287
;1286:
;1287:	other->health += quantity;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1289
;1288:
;1289:	if (other->health > max ) {
ADDRFP4 4
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $542
line 1290
;1290:		other->health = max;
ADDRFP4 4
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1291
;1291:	}
LABELV $542
line 1292
;1292:	other->client->ps.stats[STAT_HEALTH] = other->health;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ASGNI4
line 1294
;1293:
;1294:	if ( ent->item->quantity == 100 ) {		// mega health respawns slow
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 100
NEI4 $544
line 1295
;1295:		return RESPAWN_MEGAHEALTH;
CNSTI4 120
RETI4
ADDRGP4 $537
JUMPV
LABELV $544
line 1298
;1296:	}
;1297:
;1298:	return adjustRespawnTime(RESPAWN_HEALTH, ent->item->giType, ent->item->giTag);
CNSTF4 1106247680
ARGF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 adjustRespawnTime
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
LABELV $537
endproc Pickup_Health 28 12
export Pickup_Armor
proc Pickup_Armor 16 12
line 1304
;1299:}
;1300:
;1301://======================================================================
;1302:
;1303:int Pickup_Armor( gentity_t *ent, gentity_t *other ) 
;1304:{
line 1305
;1305:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 236
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1306
;1306:	if ( other->client->ps.stats[STAT_ARMOR] > other->client->ps.stats[STAT_MAX_HEALTH] * ent->item->giTag ) 
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
MULI4
LEI4 $547
line 1307
;1307:	{
line 1308
;1308:		other->client->ps.stats[STAT_ARMOR] = other->client->ps.stats[STAT_MAX_HEALTH] * ent->item->giTag;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
MULI4
ASGNI4
line 1309
;1309:	}
LABELV $547
line 1311
;1310:
;1311:	return adjustRespawnTime(RESPAWN_ARMOR, ent->item->giType, ent->item->giTag);
CNSTF4 1101004800
ARGF4
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 adjustRespawnTime
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
LABELV $546
endproc Pickup_Armor 16 12
export RespawnItem
proc RespawnItem 20 12
line 1321
;1312:}
;1313:
;1314://======================================================================
;1315:
;1316:/*
;1317:===============
;1318:RespawnItem
;1319:===============
;1320:*/
;1321:void RespawnItem( gentity_t *ent ) {
line 1323
;1322:	// randomly select from teamed entities
;1323:	if (ent->team) {
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $550
line 1328
;1324:		gentity_t	*master;
;1325:		int	count;
;1326:		int choice;
;1327:
;1328:		if ( !ent->teammaster ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $552
line 1329
;1329:			G_Error( "RespawnItem: bad teammaster");
ADDRGP4 $554
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 1330
;1330:		}
LABELV $552
line 1331
;1331:		master = ent->teammaster;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRP4
ASGNP4
line 1333
;1332:
;1333:		for (count = 0, ent = master; ent; ent = ent->teamchain, count++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $558
JUMPV
LABELV $555
line 1334
;1334:			;
LABELV $556
line 1333
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $558
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $555
line 1336
;1335:
;1336:		choice = rand() % count;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
ASGNI4
line 1338
;1337:
;1338:		for (count = 0, ent = master; count < choice; ent = ent->teamchain, count++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $562
JUMPV
LABELV $559
line 1339
;1339:			;
LABELV $560
line 1338
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $562
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $559
line 1340
;1340:	}
LABELV $550
line 1342
;1341:
;1342:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 1344
;1343:	//ent->s.eFlags &= ~EF_NODRAW;
;1344:	ent->s.eFlags &= ~(EF_NODRAW | EF_ITEMPLACEHOLDER);
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
CNSTI4 -4194433
BANDI4
ASGNI4
line 1345
;1345:	ent->r.svFlags &= ~SVF_NOCLIENT;
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
CNSTI4 -2
BANDI4
ASGNI4
line 1346
;1346:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1348
;1347:
;1348:	if ( ent->item->giType == IT_POWERUP ) {
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $563
line 1353
;1349:		// play powerup spawn sound to all clients
;1350:		gentity_t	*te;
;1351:
;1352:		// if the powerup respawn sound should Not be global
;1353:		if (ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
CNSTF4 0
EQF4 $565
line 1354
;1354:			te = G_TempEntity( ent->s.pos.trBase, EV_GENERAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 1355
;1355:		}
ADDRGP4 $566
JUMPV
LABELV $565
line 1356
;1356:		else {
line 1357
;1357:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 67
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 1358
;1358:		}
LABELV $566
line 1359
;1359:		te->s.eventParm = G_SoundIndex( "sound/items/respawn1" );
ADDRGP4 $567
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1360
;1360:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1361
;1361:	}
LABELV $563
line 1364
;1362:
;1363:	// play the normal respawn sound only to nearby clients
;1364:	G_AddEvent( ent, EV_ITEM_RESPAWN, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 57
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1366
;1365:
;1366:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 1367
;1367:}
LABELV $549
endproc RespawnItem 20 12
export Touch_Item
proc Touch_Item 112 16
line 1375
;1368:
;1369:
;1370:/*
;1371:===============
;1372:Touch_Item
;1373:===============
;1374:*/
;1375:void Touch_Item (gentity_t *ent, gentity_t *other, trace_t *trace) {
line 1378
;1376:	int			respawn;
;1377:	qboolean	predict;
;1378:	int	nowTime = LEVELTIME(other->client);
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $573
ADDRLP4 24
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $573
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $575
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $576
JUMPV
LABELV $575
ADDRLP4 20
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $576
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $574
JUMPV
LABELV $573
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $574
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 1379
;1379:	qboolean isRacer = other->client && other->client->sess.raceMode;
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $578
ADDRLP4 32
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $578
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $579
JUMPV
LABELV $578
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $579
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 1383
;1380:
;1381:	// defrag handling... meh
;1382:	// for wait == -1
;1383:	if (!isRacer && ent->goneForNonRacers) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $580
ADDRFP4 0
INDIRP4
CNSTI4 2344
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $580
line 1384
;1384:		return;
ADDRGP4 $568
JUMPV
LABELV $580
line 1385
;1385:	} else if (isRacer && other->client->entityStates[ent - g_entities]) {
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $582
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48036
ADDP4
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $582
line 1386
;1386:		return;
ADDRGP4 $568
JUMPV
LABELV $582
line 1389
;1387:	}
;1388:	// for normal timeouts
;1389:	if (!isRacer && ent->availableTimeForNonRacers >= level.time) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $584
ADDRFP4 0
INDIRP4
CNSTI4 2348
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LTI4 $584
line 1390
;1390:		return;
ADDRGP4 $568
JUMPV
LABELV $584
line 1391
;1391:	} else if (isRacer && other->client->triggerTimes[ent - g_entities] >= nowTime) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $587
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43940
ADDP4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $587
line 1392
;1392:		return;
ADDRGP4 $568
JUMPV
LABELV $587
line 1395
;1393:	}
;1394:
;1395:	if (ent->s.eFlags & EF_ITEMPLACEHOLDER)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4194304
BANDI4
CNSTI4 0
EQI4 $589
line 1396
;1396:	{
line 1397
;1397:		return;
ADDRGP4 $568
JUMPV
LABELV $589
line 1400
;1398:	}
;1399:
;1400:	if (ent->s.eFlags & EF_NODRAW)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $591
line 1401
;1401:	{
line 1402
;1402:		return;
ADDRGP4 $568
JUMPV
LABELV $591
line 1405
;1403:	}
;1404:
;1405:	if (ent->item->giType == IT_WEAPON &&
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $593
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $593
ADDRLP4 48
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $593
line 1408
;1406:		ent->s.powerups &&
;1407:		ent->s.powerups < level.time)
;1408:	{
line 1409
;1409:		ent->s.generic1 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
CNSTI4 0
ASGNI4
line 1410
;1410:		ent->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 1411
;1411:	}
LABELV $593
line 1413
;1412:
;1413:	if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $596
line 1414
;1414:		return;
ADDRGP4 $568
JUMPV
LABELV $596
line 1415
;1415:	if (other->health < 1)
ADDRFP4 4
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $598
line 1416
;1416:		return;		// dead people can't pickup
ADDRGP4 $568
JUMPV
LABELV $598
line 1418
;1417:
;1418:	if (ent->item->giType == IT_POWERUP &&
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $600
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 12
EQI4 $602
ADDRLP4 56
INDIRI4
CNSTI4 13
NEI4 $600
LABELV $602
line 1420
;1419:		(ent->item->giTag == PW_FORCE_ENLIGHTENED_LIGHT || ent->item->giTag == PW_FORCE_ENLIGHTENED_DARK))
;1420:	{
line 1421
;1421:		if (ent->item->giTag == PW_FORCE_ENLIGHTENED_LIGHT)
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 12
NEI4 $603
line 1422
;1422:		{
line 1423
;1423:			if (other->client->ps.fd.forceSide != FORCE_LIGHTSIDE)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1188
ADDP4
INDIRI4
CNSTI4 1
EQI4 $604
line 1424
;1424:			{
line 1425
;1425:				return;
ADDRGP4 $568
JUMPV
line 1427
;1426:			}
;1427:		}
LABELV $603
line 1429
;1428:		else
;1429:		{
line 1430
;1430:			if (other->client->ps.fd.forceSide != FORCE_DARKSIDE)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1188
ADDP4
INDIRI4
CNSTI4 2
EQI4 $607
line 1431
;1431:			{
line 1432
;1432:				return;
ADDRGP4 $568
JUMPV
LABELV $607
line 1434
;1433:			}
;1434:		}
LABELV $604
line 1435
;1435:	}
LABELV $600
line 1438
;1436:
;1437:	// the same pickup rules are used for client side and server side
;1438:	if ( !BG_CanItemBeGrabbed( g_gametype.integer, &ent->s, &other->client->ps, other->client->sess.mode ) ) {
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BG_CanItemBeGrabbed
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $609
line 1439
;1439:		if (other->client->sess.mode == MODE_IRONMAN) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
CNSTI4 5
NEI4 $568
line 1440
;1440:			gitem_t * item = &bg_itemlist[ent->s.modelindex];
ADDRLP4 68
CNSTI4 52
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 1441
;1441:			if (item->giType != IT_TEAM) { // allow ironmanners to grab flags
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
EQI4 $613
line 1442
;1442:				return;
ADDRGP4 $568
JUMPV
line 1444
;1443:			}
;1444:		}
line 1445
;1445:		else {
line 1446
;1446:			return;
LABELV $613
line 1448
;1447:		}
;1448:	}
LABELV $609
line 1450
;1449:
;1450:	G_LogPrintf( "Item: %i %s\n", other->s.number, ent->item->classname );
ADDRGP4 $616
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1452
;1451:
;1452:	predict = other->client->pers.predictItemPickup;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1420
ADDP4
INDIRI4
ASGNI4
line 1455
;1453:
;1454:	// call the item-specific pickup function
;1455:	switch( ent->item->giType ) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
LTI4 $568
ADDRLP4 68
INDIRI4
CNSTI4 8
GTI4 $568
ADDRLP4 68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $637-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $637
address $620
address $621
address $632
address $633
address $634
address $636
address $568
address $635
code
LABELV $620
line 1457
;1456:	case IT_WEAPON:
;1457:		respawn = Pickup_Weapon(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 Pickup_Weapon
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 76
INDIRI4
ASGNI4
line 1459
;1458://		predict = qfalse;
;1459:		predict = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1460
;1460:		break;
ADDRGP4 $618
JUMPV
LABELV $621
line 1462
;1461:	case IT_AMMO:
;1462:		respawn = Pickup_Ammo(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 Pickup_Ammo
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 80
INDIRI4
ASGNI4
line 1463
;1463:		if (ent->item->giTag == AMMO_THERMAL || ent->item->giTag == AMMO_TRIPMINE || ent->item->giTag == AMMO_DETPACK)
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 7
EQI4 $625
ADDRLP4 84
INDIRI4
CNSTI4 8
EQI4 $625
ADDRLP4 84
INDIRI4
CNSTI4 9
NEI4 $622
LABELV $625
line 1464
;1464:		{
line 1465
;1465:			int weapForAmmo = 0;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 1467
;1466:
;1467:			if (ent->item->giTag == AMMO_THERMAL)
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $626
line 1468
;1468:			{
line 1469
;1469:				weapForAmmo = WP_THERMAL;
ADDRLP4 88
CNSTI4 11
ASGNI4
line 1470
;1470:			}
ADDRGP4 $627
JUMPV
LABELV $626
line 1471
;1471:			else if (ent->item->giTag == AMMO_TRIPMINE)
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $628
line 1472
;1472:			{
line 1473
;1473:				weapForAmmo = WP_TRIP_MINE;
ADDRLP4 88
CNSTI4 12
ASGNI4
line 1474
;1474:			}
ADDRGP4 $629
JUMPV
LABELV $628
line 1476
;1475:			else
;1476:			{
line 1477
;1477:				weapForAmmo = WP_DET_PACK;
ADDRLP4 88
CNSTI4 13
ASGNI4
line 1478
;1478:			}
LABELV $629
LABELV $627
line 1480
;1479:
;1480:			if (other && other->client && other->client->ps.ammo[weaponData[weapForAmmo].ammoIndex] > 0 )
ADDRLP4 92
ADDRFP4 4
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
EQU4 $630
ADDRLP4 100
CNSTI4 408
ASGNI4
ADDRLP4 104
ADDRLP4 92
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CVPU4 4
ADDRLP4 96
INDIRU4
EQU4 $630
CNSTI4 56
ADDRLP4 88
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 104
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
ADDP4
INDIRI4
CNSTI4 0
LEI4 $630
line 1481
;1481:			{
line 1482
;1482:				other->client->ps.stats[STAT_WEAPONS] |= (1 << weapForAmmo);
ADDRLP4 108
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 88
INDIRI4
LSHI4
BORI4
ASGNI4
line 1483
;1483:			}
LABELV $630
line 1484
;1484:		}
LABELV $622
line 1486
;1485://		predict = qfalse;
;1486:		predict = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1487
;1487:		break;
ADDRGP4 $618
JUMPV
LABELV $632
line 1489
;1488:	case IT_ARMOR:
;1489:		respawn = Pickup_Armor(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 Pickup_Armor
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 88
INDIRI4
ASGNI4
line 1491
;1490://		predict = qfalse;
;1491:		predict = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1492
;1492:		break;
ADDRGP4 $618
JUMPV
LABELV $633
line 1494
;1493:	case IT_HEALTH:
;1494:		respawn = Pickup_Health(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 Pickup_Health
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 92
INDIRI4
ASGNI4
line 1496
;1495://		predict = qfalse;
;1496:		predict = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1497
;1497:		break;
ADDRGP4 $618
JUMPV
LABELV $634
line 1499
;1498:	case IT_POWERUP:
;1499:		respawn = Pickup_Powerup(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 Pickup_Powerup
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 96
INDIRI4
ASGNI4
line 1500
;1500:		predict = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1502
;1501://		predict = qtrue;
;1502:		break;
ADDRGP4 $618
JUMPV
LABELV $635
line 1504
;1503:	case IT_TEAM:
;1504:		respawn = Pickup_Team(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 Pickup_Team
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 100
INDIRI4
ASGNI4
line 1505
;1505:		break;
ADDRGP4 $618
JUMPV
LABELV $636
line 1507
;1506:	case IT_HOLDABLE:
;1507:		respawn = Pickup_Holdable(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 Pickup_Holdable
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 104
INDIRI4
ASGNI4
line 1508
;1508:		break;
line 1510
;1509:	default:
;1510:		return;
LABELV $618
line 1513
;1511:	}
;1512:
;1513:	if ( !respawn ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $639
line 1514
;1514:		return;
ADDRGP4 $568
JUMPV
LABELV $639
line 1518
;1515:	}
;1516:
;1517:	// play the normal pickup sound
;1518:	if (predict) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $641
line 1519
;1519:		if (other && other->client)
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
EQU4 $643
ADDRLP4 76
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $643
line 1520
;1520:		{
line 1521
;1521:			BG_AddPredictableEventToPlayerstate( EV_ITEM_PICKUP, ent->s.number, &other->client->ps);
CNSTI4 20
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 1522
;1522:		}
ADDRGP4 $642
JUMPV
LABELV $643
line 1524
;1523:		else
;1524:		{
line 1525
;1525:			G_AddPredictableEvent( other, EV_ITEM_PICKUP, ent->s.number );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_AddPredictableEvent
CALLV
pop
line 1526
;1526:		}
line 1527
;1527:	} else {
ADDRGP4 $642
JUMPV
LABELV $641
line 1528
;1528:		G_AddEvent( other, EV_ITEM_PICKUP, ent->s.number );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1529
;1529:	}
LABELV $642
line 1532
;1530:
;1531:	// powerup pickups are global broadcasts
;1532:	if ( /*ent->item->giType == IT_POWERUP ||*/ ent->item->giType == IT_TEAM) {
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $645
line 1534
;1533:		// if we want the global sound to play
;1534:		if (!ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
CNSTF4 0
NEF4 $647
line 1537
;1535:			gentity_t	*te;
;1536:
;1537:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 21
ARGI4
ADDRLP4 80
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 76
ADDRLP4 80
INDIRP4
ASGNP4
line 1538
;1538:			te->s.eventParm = ent->s.modelindex;
ADDRLP4 76
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 1539
;1539:			te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 84
ADDRLP4 76
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1540
;1540:		} else {
ADDRGP4 $648
JUMPV
LABELV $647
line 1543
;1541:			gentity_t	*te;
;1542:
;1543:			te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 21
ARGI4
ADDRLP4 80
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 76
ADDRLP4 80
INDIRP4
ASGNP4
line 1544
;1544:			te->s.eventParm = ent->s.modelindex;
ADDRLP4 76
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 1546
;1545:			// only send this temp entity to a single client
;1546:			te->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 84
ADDRLP4 76
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 1547
;1547:			te->r.singleClient = other->s.number;
ADDRLP4 76
INDIRP4
CNSTI4 308
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1548
;1548:		}
LABELV $648
line 1549
;1549:	}
LABELV $645
line 1552
;1550:
;1551:	// fire item targets
;1552:	G_UseTargets (ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1555
;1553:
;1554:	// wait of -1 will not respawn
;1555:	if ( ent->wait == -1) {
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 3212836864
NEF4 $649
line 1556
;1556:		if (!g_defrag.integer) {
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
NEI4 $651
line 1557
;1557:			ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1558
;1558:			ent->s.eFlags |= EF_NODRAW;
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1559
;1559:			ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 1560
;1560:			ent->unlinkAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 1561
;1561:		}
ADDRGP4 $568
JUMPV
LABELV $651
line 1562
;1562:		else {
line 1563
;1563:			if (isRacer) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $654
line 1564
;1564:				other->client->entityStates[ent-g_entities] = 1;
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 48036
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 1565
;1565:			}
ADDRGP4 $568
JUMPV
LABELV $654
line 1566
;1566:			else {
line 1567
;1567:				ent->goneForNonRacers = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 2344
ADDP4
CNSTI4 1
ASGNI4
line 1568
;1568:			}
line 1569
;1569:		}
line 1570
;1570:		return;
ADDRGP4 $568
JUMPV
LABELV $649
line 1574
;1571:	}
;1572:
;1573:	// non zero wait overrides respawn time
;1574:	if ( ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
EQF4 $656
line 1575
;1575:		respawn = ent->wait;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1576
;1576:	}
LABELV $656
line 1579
;1577:
;1578:	// random can be used to vary the respawn time
;1579:	if ( ent->random && !(other->client && other->client->sess.raceMode)) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CNSTF4 0
EQF4 $658
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $660
ADDRLP4 76
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $658
LABELV $660
line 1580
;1580:		respawn += (crandom() * ent->random);
ADDRLP4 80
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1073741824
ADDRLP4 80
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
ADDF4
CVFI4 4
ASGNI4
line 1581
;1581:		if ( respawn < 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
GEI4 $661
line 1582
;1582:			respawn = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1583
;1583:		}
LABELV $661
line 1584
;1584:	}
LABELV $658
line 1587
;1585:
;1586:	// dropped items will not respawn
;1587:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $663
line 1588
;1588:		ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 1
ASGNI4
line 1589
;1589:	}
LABELV $663
line 1594
;1590:
;1591:	// picked up items still stay around, they just don't
;1592:	// draw anything.  This allows respawnable items
;1593:	// to be placed on movers.
;1594:	if (g_defrag.integer) {
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
EQI4 $665
line 1596
;1595:
;1596:		if (!isRacer) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $668
line 1597
;1597:			ent->availableTimeForNonRacers = level.time + respawn * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 2348
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDRLP4 4
INDIRI4
MULI4
ADDI4
ASGNI4
line 1598
;1598:		}
ADDRGP4 $666
JUMPV
LABELV $668
line 1599
;1599:		else {
line 1600
;1600:			other->client->triggerTimes[ent - g_entities] = nowTime + respawn * 1000;
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43940
ADDP4
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 1000
ADDRLP4 4
INDIRI4
MULI4
ADDI4
ASGNI4
line 1601
;1601:		}
line 1602
;1602:	} else {
ADDRGP4 $666
JUMPV
LABELV $665
line 1603
;1603:		if (!(ent->flags & FL_DROPPED_ITEM) && (ent->item->giType == IT_WEAPON || ent->item->giType == IT_POWERUP))
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $671
ADDRLP4 84
ADDRLP4 80
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 1
EQI4 $673
ADDRLP4 84
INDIRI4
CNSTI4 5
NEI4 $671
LABELV $673
line 1604
;1604:		{
line 1605
;1605:			ent->s.eFlags |= EF_ITEMPLACEHOLDER;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 4194304
BORI4
ASGNI4
line 1606
;1606:			ent->s.eFlags &= ~EF_NODRAW;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1607
;1607:		}
ADDRGP4 $672
JUMPV
LABELV $671
line 1609
;1608:		else
;1609:		{
line 1610
;1610:			ent->s.eFlags |= EF_NODRAW;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1611
;1611:			ent->r.svFlags |= SVF_NOCLIENT;
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
CNSTI4 1
BORI4
ASGNI4
line 1612
;1612:		}
LABELV $672
line 1613
;1613:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 1619
;1614:
;1615:		// ZOID
;1616:		// A negative respawn times means to never respawn this item (but don't 
;1617:		// delete it).  This is used by items that are respawned by third party 
;1618:		// events such as ctf flags
;1619:		if (respawn <= 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $674
line 1620
;1620:			ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 1621
;1621:			ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTP4 0
ASGNP4
line 1622
;1622:		}
ADDRGP4 $675
JUMPV
LABELV $674
line 1623
;1623:		else {
line 1624
;1624:			ent->nextthink = level.time + respawn * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDRLP4 4
INDIRI4
MULI4
ADDI4
ASGNI4
line 1625
;1625:			ent->think = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 1626
;1626:		}
LABELV $675
line 1627
;1627:	}
LABELV $666
line 1629
;1628:
;1629:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1630
;1630:}
LABELV $568
endproc Touch_Item 112 16
export LaunchItem
proc LaunchItem 36 8
line 1642
;1631:
;1632:
;1633://======================================================================
;1634:
;1635:/*
;1636:================
;1637:LaunchItem
;1638:
;1639:Spawns an item and tosses it forward
;1640:================
;1641:*/
;1642:gentity_t *LaunchItem(gentity_t* oldOwner, gitem_t *item, vec3_t origin, vec3_t velocity ) {
line 1645
;1643:	gentity_t	*dropped;
;1644:
;1645:	dropped = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1647
;1646:
;1647:	dropped->s.eType = ET_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 1648
;1648:	dropped->s.modelindex = item - bg_itemlist;	// store item number in modelindex
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 1649
;1649:	if (dropped->s.modelindex < 0)
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
GEI4 $678
line 1650
;1650:	{
line 1651
;1651:		dropped->s.modelindex = 0;
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 1652
;1652:	}
LABELV $678
line 1653
;1653:	dropped->s.modelindex2 = 1; // This is non-zero is it's a dropped item
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 1
ASGNI4
line 1655
;1654:
;1655:	G_SetClassName(dropped, item->classname);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 1656
;1656:	dropped->item = item;
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1657
;1657:	VectorSet (dropped->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3245342720
ASGNF4
line 1658
;1658:	VectorSet (dropped->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1097859072
ASGNF4
line 1660
;1659:
;1660:	dropped->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 1662
;1661:
;1662:	dropped->touch = Touch_Item;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 1664
;1663:
;1664:	G_SetOrigin( dropped, origin );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1665
;1665:	dropped->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1666
;1666:	dropped->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1667
;1667:	VectorCopy( velocity, dropped->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1669
;1668:
;1669:	dropped->s.eFlags |= EF_BOUNCE_HALF;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1670
;1670:	if (oldOwner && oldOwner->client && oldOwner->client->sess.mode == MODE_IRONMAN && item->giType == IT_TEAM) { // Ironman flags are simplified
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
EQU4 $681
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $681
ADDRLP4 20
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
CNSTI4 5
NEI4 $681
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $681
line 1671
;1671:		dropped->think = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1672
;1672:		dropped->nextthink = level.time + IRONMAN_FLAGRESPAWNTIME;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 3000
ADDI4
CNSTI4 500
SUBI4
ASGNI4
line 1674
;1673:
;1674:	} else if ((g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY) && item->giType == IT_TEAM) { // Special case for CTF flags
ADDRGP4 $682
JUMPV
LABELV $681
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $688
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $684
LABELV $688
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $684
line 1675
;1675:		dropped->think = Team_DroppedFlagThink;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 Team_DroppedFlagThink
ASGNP4
line 1676
;1676:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 1677
;1677:		Team_CheckDroppedItem( dropped );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Team_CheckDroppedItem
CALLV
pop
line 1680
;1678:
;1679:		//rww - so bots know
;1680:		if (strcmp(dropped->classname, "team_CTF_redflag") == 0)
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $692
ARGP4
ADDRLP4 24
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $690
line 1681
;1681:		{
line 1682
;1682:			droppedRedFlag = dropped;
ADDRGP4 droppedRedFlag
ADDRLP4 0
INDIRP4
ASGNP4
line 1683
;1683:		}
ADDRGP4 $685
JUMPV
LABELV $690
line 1684
;1684:		else if (strcmp(dropped->classname, "team_CTF_blueflag") == 0)
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $695
ARGP4
ADDRLP4 28
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $685
line 1685
;1685:		{
line 1686
;1686:			droppedBlueFlag = dropped;
ADDRGP4 droppedBlueFlag
ADDRLP4 0
INDIRP4
ASGNP4
line 1687
;1687:		}
line 1688
;1688:	} else { // auto-remove after 30 seconds
ADDRGP4 $685
JUMPV
LABELV $684
line 1689
;1689:		dropped->think = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1690
;1690:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 1691
;1691:	}
LABELV $685
LABELV $682
line 1693
;1692:
;1693:	dropped->flags = FL_DROPPED_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 4096
ASGNI4
line 1695
;1694:
;1695:	if (item->giType == IT_WEAPON || item->giType == IT_POWERUP)
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
EQI4 $699
ADDRLP4 24
INDIRI4
CNSTI4 5
NEI4 $697
LABELV $699
line 1696
;1696:	{
line 1697
;1697:		dropped->s.eFlags |= EF_DROPPEDWEAPON;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 16777216
BORI4
ASGNI4
line 1698
;1698:	}
LABELV $697
line 1700
;1699:
;1700:	vectoangles(velocity, dropped->s.angles);
ADDRFP4 12
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
line 1701
;1701:	dropped->s.angles[PITCH] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 1703
;1702:
;1703:	if (item->giTag == WP_TRIP_MINE ||
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 12
EQI4 $702
ADDRLP4 28
INDIRI4
CNSTI4 13
NEI4 $700
LABELV $702
line 1705
;1704:		item->giTag == WP_DET_PACK)
;1705:	{
line 1706
;1706:		dropped->s.angles[PITCH] = -90;
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 3266576384
ASGNF4
line 1707
;1707:	}
LABELV $700
line 1709
;1708:
;1709:	if (item->giTag != WP_BOWCASTER &&
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 6
EQI4 $703
ADDRLP4 32
INDIRI4
CNSTI4 13
EQI4 $703
ADDRLP4 32
INDIRI4
CNSTI4 11
EQI4 $703
line 1712
;1710:		item->giTag != WP_DET_PACK &&
;1711:		item->giTag != WP_THERMAL)
;1712:	{
line 1713
;1713:		dropped->s.angles[ROLL] = -90;
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 3266576384
ASGNF4
line 1714
;1714:	}
LABELV $703
line 1716
;1715:
;1716:	dropped->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 1718
;1717:
;1718:	trap_LinkEntity (dropped);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1720
;1719:
;1720:	return dropped;
ADDRLP4 0
INDIRP4
RETP4
LABELV $677
endproc LaunchItem 36 8
export Drop_Item
proc Drop_Item 52 16
line 1730
;1721:}
;1722:
;1723:/*
;1724:================
;1725:Drop_Item
;1726:
;1727:Spawns an item and tosses it forward
;1728:================
;1729:*/
;1730:gentity_t *Drop_Item( gentity_t *ent, gitem_t *item, float angle ) {
line 1734
;1731:	vec3_t	velocity;
;1732:	vec3_t	angles;
;1733:
;1734:	VectorCopy( ent->s.apos.trBase, angles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 1735
;1735:	angles[YAW] += angle;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ASGNF4
line 1736
;1736:	angles[PITCH] = 0;	// always forward
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1738
;1737:
;1738:	AngleVectors( angles, velocity, NULL, NULL );
ADDRLP4 12
ARGP4
ADDRLP4 0
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
line 1739
;1739:	VectorScale( velocity, 150, velocity );
ADDRLP4 28
CNSTF4 1125515264
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1125515264
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 1740
;1740:	velocity[2] += 200 + ((ent->client && ent->client->sess.raceMode) ? 0 : (crandom() * 50));
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $713
ADDRLP4 36
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $713
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRGP4 $714
JUMPV
LABELV $713
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 32
CNSTF4 1112014848
CNSTF4 1073741824
ADDRLP4 40
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
ASGNF4
LABELV $714
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 32
INDIRF4
CNSTF4 1128792064
ADDF4
ADDF4
ASGNF4
line 1742
;1741:	
;1742:	return LaunchItem( ent, item, ent->s.pos.trBase, velocity );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 48
ADDRGP4 LaunchItem
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
RETP4
LABELV $705
endproc Drop_Item 52 16
export Use_Item
proc Use_Item 0 4
line 1753
;1743:}
;1744:
;1745:
;1746:/*
;1747:================
;1748:Use_Item
;1749:
;1750:Respawn the item
;1751:================
;1752:*/
;1753:void Use_Item( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 1754
;1754:	RespawnItem( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 1755
;1755:}
LABELV $715
endproc Use_Item 0 4
export FinishSpawningItem
proc FinishSpawningItem 1120 28
line 1767
;1756:
;1757://======================================================================
;1758:
;1759:/*
;1760:================
;1761:FinishSpawningItem
;1762:
;1763:Traces down to find where an item should rest, instead of letting them
;1764:free fall from their spawn points
;1765:================
;1766:*/
;1767:void FinishSpawningItem( gentity_t *ent ) {
line 1775
;1768:	trace_t		tr;
;1769:	vec3_t		dest;
;1770://	gitem_t		*item;
;1771:
;1772://	VectorSet( ent->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS );
;1773://	VectorSet( ent->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS );
;1774:
;1775:	if (g_gametype.integer != GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $717
line 1776
;1776:	{
line 1777
;1777:		if (HasSetSaberOnly())
ADDRLP4 1092
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
EQI4 $718
line 1778
;1778:		{
line 1779
;1779:			if (ent->item->giType == IT_AMMO)
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $722
line 1780
;1780:			{
line 1781
;1781:				G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1782
;1782:				return;
ADDRGP4 $716
JUMPV
LABELV $722
line 1785
;1783:			}
;1784:
;1785:			if (ent->item->giType == IT_HOLDABLE)
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $718
line 1786
;1786:			{
line 1787
;1787:				if (ent->item->giTag == HI_SEEKER ||
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 1
EQI4 $729
ADDRLP4 1096
INDIRI4
CNSTI4 2
EQI4 $729
ADDRLP4 1096
INDIRI4
CNSTI4 6
NEI4 $718
LABELV $729
line 1790
;1788:					ent->item->giTag == HI_SHIELD ||
;1789:					ent->item->giTag == HI_SENTRY_GUN)
;1790:				{
line 1791
;1791:					G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1792
;1792:					return;
ADDRGP4 $716
JUMPV
line 1794
;1793:				}
;1794:			}
line 1795
;1795:		}
line 1796
;1796:	}
LABELV $717
line 1798
;1797:	else
;1798:	{ //no powerups in jedi master
line 1799
;1799:		if (ent->item->giType == IT_POWERUP)
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $730
line 1800
;1800:		{
line 1801
;1801:			G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1802
;1802:			return;
ADDRGP4 $716
JUMPV
LABELV $730
line 1804
;1803:		}
;1804:	}
LABELV $718
line 1806
;1805:
;1806:	if (g_gametype.integer == GT_HOLOCRON)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $732
line 1807
;1807:	{
line 1808
;1808:		if (ent->item->giType == IT_POWERUP)
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $735
line 1809
;1809:		{
line 1810
;1810:			if (ent->item->giTag == PW_FORCE_ENLIGHTENED_LIGHT ||
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 12
EQI4 $739
ADDRLP4 1092
INDIRI4
CNSTI4 13
NEI4 $737
LABELV $739
line 1812
;1811:				ent->item->giTag == PW_FORCE_ENLIGHTENED_DARK)
;1812:			{
line 1813
;1813:				G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1814
;1814:				return;
ADDRGP4 $716
JUMPV
LABELV $737
line 1816
;1815:			}
;1816:		}
LABELV $735
line 1817
;1817:	}
LABELV $732
line 1819
;1818:
;1819:	if (g_forcePowerDisable.integer)
ADDRGP4 g_forcePowerDisable+12
INDIRI4
CNSTI4 0
EQI4 $740
line 1820
;1820:	{ //if force powers disabled, don't add force powerups
line 1821
;1821:		if (ent->item->giType == IT_POWERUP)
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $743
line 1822
;1822:		{
line 1823
;1823:			if (ent->item->giTag == PW_FORCE_ENLIGHTENED_LIGHT ||
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 12
EQI4 $748
ADDRLP4 1092
INDIRI4
CNSTI4 13
EQI4 $748
ADDRLP4 1092
INDIRI4
CNSTI4 14
NEI4 $745
LABELV $748
line 1826
;1824:				ent->item->giTag == PW_FORCE_ENLIGHTENED_DARK ||
;1825:				ent->item->giTag == PW_FORCE_BOON)
;1826:			{
line 1827
;1827:				G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1828
;1828:				return;
ADDRGP4 $716
JUMPV
LABELV $745
line 1830
;1829:			}
;1830:		}
LABELV $743
line 1831
;1831:	}
LABELV $740
line 1833
;1832:
;1833:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $749
line 1834
;1834:	{
line 1835
;1835:		if ( ent->item->giType == IT_ARMOR ||
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1096
ADDRLP4 1092
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1100
CNSTI4 3
ASGNI4
ADDRLP4 1096
INDIRI4
ADDRLP4 1100
INDIRI4
EQI4 $755
ADDRLP4 1096
INDIRI4
CNSTI4 4
EQI4 $755
ADDRLP4 1096
INDIRI4
CNSTI4 6
NEI4 $752
ADDRLP4 1092
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ADDRLP4 1100
INDIRI4
NEI4 $752
LABELV $755
line 1838
;1836:			ent->item->giType == IT_HEALTH ||
;1837:			(ent->item->giType == IT_HOLDABLE && ent->item->giTag == HI_MEDPAC) )
;1838:		{
line 1839
;1839:			G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1840
;1840:			return;
ADDRGP4 $716
JUMPV
LABELV $752
line 1842
;1841:		}
;1842:	}
LABELV $749
line 1844
;1843:
;1844:	if (g_gametype.integer != GT_CTF &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $756
ADDRLP4 1092
CNSTI4 8
ASGNI4
ADDRGP4 g_gametype+12
INDIRI4
ADDRLP4 1092
INDIRI4
EQI4 $756
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 1092
INDIRI4
NEI4 $756
line 1847
;1845:		g_gametype.integer != GT_CTY &&
;1846:		ent->item->giType == IT_TEAM)
;1847:	{
line 1848
;1848:		int killMe = 0;
ADDRLP4 1096
CNSTI4 0
ASGNI4
line 1850
;1849:
;1850:		switch (ent->item->giTag)
ADDRLP4 1100
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 4
EQI4 $763
ADDRLP4 1100
INDIRI4
CNSTI4 5
EQI4 $764
ADDRLP4 1100
INDIRI4
CNSTI4 6
EQI4 $765
ADDRGP4 $761
JUMPV
line 1851
;1851:		{
LABELV $763
line 1853
;1852:		case PW_REDFLAG:
;1853:			killMe = 1;
ADDRLP4 1096
CNSTI4 1
ASGNI4
line 1854
;1854:			break;
ADDRGP4 $761
JUMPV
LABELV $764
line 1856
;1855:		case PW_BLUEFLAG:
;1856:			killMe = 1;
ADDRLP4 1096
CNSTI4 1
ASGNI4
line 1857
;1857:			break;
ADDRGP4 $761
JUMPV
LABELV $765
line 1859
;1858:		case PW_NEUTRALFLAG:
;1859:			killMe = 1;
ADDRLP4 1096
CNSTI4 1
ASGNI4
line 1860
;1860:			break;
line 1862
;1861:		default:
;1862:			break;
LABELV $761
line 1865
;1863:		}
;1864:
;1865:		if (killMe)
ADDRLP4 1096
INDIRI4
CNSTI4 0
EQI4 $766
line 1866
;1866:		{
line 1867
;1867:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1868
;1868:			return;
ADDRGP4 $716
JUMPV
LABELV $766
line 1870
;1869:		}
;1870:	}
LABELV $756
line 1872
;1871:
;1872:	VectorSet (ent->r.mins, -8, -8, -0);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 0
ASGNF4
line 1873
;1873:	VectorSet (ent->r.maxs, 8, 8, 16);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1098907648
ASGNF4
line 1875
;1874:
;1875:	ent->s.eType = ET_ITEM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 1876
;1876:	ent->s.modelindex = ent->item - bg_itemlist;		// store item number in modelindex
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 1096
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 1877
;1877:	ent->s.modelindex2 = 0; // zero indicates this isn't a dropped item
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 0
ASGNI4
line 1879
;1878:
;1879:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 1880
;1880:	ent->touch = Touch_Item;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 1882
;1881:	// useing an item causes it to respawn
;1882:	ent->use = Use_Item;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 Use_Item
ASGNP4
line 1892
;1883:
;1884:	// create a Ghoul2 model if the world model is a glm
;1885:/*	item = &bg_itemlist[ ent->s.modelindex ];
;1886:	if (!stricmp(&item->world_model[0][strlen(item->world_model[0]) - 4], ".glm"))
;1887:	{
;1888:		trap_G2API_InitGhoul2Model(&ent->s, item->world_model[0], G_ModelIndex(item->world_model[0] ), 0, 0, 0, 0);
;1889:		ent->s.radius = 60;
;1890:	}
;1891:*/
;1892:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $768
line 1894
;1893:		// suspended
;1894:		G_SetOrigin( ent, ent->s.origin );
ADDRLP4 1100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1100
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1895
;1895:	} else {
ADDRGP4 $769
JUMPV
LABELV $768
line 1900
;1896:		// drop to floor
;1897:
;1898:		//if it is directly even with the floor it will return startsolid, so raise up by 0.1
;1899:		//and temporarily subtract 0.1 from the z maxs so that going up doesn't push into the ceiling
;1900:		ent->s.origin[2] += 0.1f;
ADDRLP4 1100
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 1100
INDIRP4
ADDRLP4 1100
INDIRP4
INDIRF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 1901
;1901:		ent->r.maxs[2] -= 0.1f;
ADDRLP4 1104
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 1104
INDIRP4
ADDRLP4 1104
INDIRP4
INDIRF4
CNSTF4 1036831949
SUBF4
ASGNF4
line 1903
;1902:
;1903:		VectorSet( dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096 );
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
ADDRLP4 1108
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1108
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ASGNF4
ADDRLP4 1080+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 1904
;1904:		JP_Trace( &tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID );
ADDRLP4 0
ARGP4
ADDRLP4 1112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1112
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1112
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1112
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1905
;1905:		if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $772
line 1906
;1906:			G_Printf ("FinishSpawningItem: %s startsolid at %s\n", ent->classname, vtos(ent->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1116
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $775
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 1116
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1907
;1907:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1908
;1908:			return;
ADDRGP4 $716
JUMPV
LABELV $772
line 1912
;1909:		}
;1910:
;1911:		//add the 0.1 back after the trace
;1912:		ent->r.maxs[2] += 0.1f;
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 1915
;1913:
;1914:		// allow to ride movers
;1915:		ent->s.groundEntityNum = tr.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 1917
;1916:
;1917:		G_SetOrigin( ent, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1918
;1918:	}
LABELV $769
line 1921
;1919:
;1920:	// team slaves and targeted items aren't present at start
;1921:	if ( ( ent->flags & FL_TEAMSLAVE ) || ent->targetname ) {
ADDRLP4 1100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $780
ADDRLP4 1100
INDIRP4
CNSTI4 596
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $778
LABELV $780
line 1922
;1922:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 1104
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 1104
INDIRP4
ADDRLP4 1104
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1923
;1923:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 1924
;1924:		return;
ADDRGP4 $716
JUMPV
LABELV $778
line 1941
;1925:	}
;1926:
;1927:	// powerups don't spawn in for a while
;1928:	/*
;1929:	if ( ent->item->giType == IT_POWERUP ) {
;1930:		float	respawn;
;1931:
;1932:		respawn = 45 + crandom() * 15;
;1933:		ent->s.eFlags |= EF_NODRAW;
;1934:		ent->r.contents = 0;
;1935:		ent->nextthink = level.time + respawn * 1000;
;1936:		ent->think = RespawnItem;
;1937:		return;
;1938:	}
;1939:	*/
;1940:
;1941:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1942
;1942:}
LABELV $716
endproc FinishSpawningItem 1120 28
export G_CheckTeamItems
proc G_CheckTeamItems 20 4
line 1952
;1943:
;1944:
;1945:qboolean	itemRegistered[MAX_ITEMS];
;1946:
;1947:/*
;1948:==================
;1949:G_CheckTeamItems
;1950:==================
;1951:*/
;1952:void G_CheckTeamItems( void ) {
line 1955
;1953:
;1954:	// Set up team stuff
;1955:	Team_InitGame();
ADDRGP4 Team_InitGame
CALLV
pop
line 1957
;1956:
;1957:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $786
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $782
LABELV $786
line 1961
;1958:		gitem_t	*item;
;1959:
;1960:		// check for the two flags
;1961:		item = BG_FindItem( "team_CTF_redflag" );
ADDRGP4 $692
ARGP4
ADDRLP4 4
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1962
;1962:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 8
INDIRU4
CNSTU4 0
EQU4 $789
ADDRLP4 8
INDIRU4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
NEI4 $787
LABELV $789
line 1963
;1963:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map\n" );
ADDRGP4 $790
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1964
;1964:		}
LABELV $787
line 1965
;1965:		item = BG_FindItem( "team_CTF_blueflag" );
ADDRGP4 $695
ARGP4
ADDRLP4 12
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1966
;1966:		if ( !item || !itemRegistered[ item - bg_itemlist ] ) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
CNSTU4 0
EQU4 $793
ADDRLP4 16
INDIRU4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
NEI4 $791
LABELV $793
line 1967
;1967:			G_Printf( S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map\n" );
ADDRGP4 $794
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1968
;1968:		}
LABELV $791
line 1969
;1969:	}
LABELV $782
line 1970
;1970:}
LABELV $781
endproc G_CheckTeamItems 20 4
export ClearRegisteredItems
proc ClearRegisteredItems 12 12
line 1977
;1971:
;1972:/*
;1973:==============
;1974:ClearRegisteredItems
;1975:==============
;1976:*/
;1977:void ClearRegisteredItems( void ) {
line 1978
;1978:	memset( itemRegistered, 0, sizeof( itemRegistered ) );
ADDRGP4 itemRegistered
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1024
ARGU4
ADDRGP4 memset
CALLP4
pop
line 1981
;1979:
;1980:	// players always start with the base weapon
;1981:	RegisterItem( BG_FindItemForWeapon( WP_BRYAR_PISTOL ) );
CNSTI4 3
ARGI4
ADDRLP4 0
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 1982
;1982:	RegisterItem( BG_FindItemForWeapon( WP_STUN_BATON ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 1983
;1983:	RegisterItem( BG_FindItemForWeapon( WP_SABER ) );
CNSTI4 2
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 1984
;1984:}
LABELV $795
endproc ClearRegisteredItems 12 12
export RegisterItem
proc RegisterItem 0 4
line 1993
;1985:
;1986:/*
;1987:===============
;1988:RegisterItem
;1989:
;1990:The item will be added to the precache list
;1991:===============
;1992:*/
;1993:void RegisterItem( gitem_t *item ) {
line 1994
;1994:	if ( !item ) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $797
line 1995
;1995:		G_Error( "RegisterItem: NULL" );
ADDRGP4 $799
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 1996
;1996:	}
LABELV $797
line 1997
;1997:	itemRegistered[ item - bg_itemlist ] = qtrue;
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
CNSTI4 1
ASGNI4
line 1998
;1998:}
LABELV $796
endproc RegisterItem 0 4
export SaveRegisteredItems
proc SaveRegisteredItems 268 8
line 2009
;1999:
;2000:
;2001:/*
;2002:===============
;2003:SaveRegisteredItems
;2004:
;2005:Write the needed items to a config string
;2006:so the client will know which ones to precache
;2007:===============
;2008:*/
;2009:void SaveRegisteredItems( void ) {
line 2014
;2010:	char	string[MAX_ITEMS+1];
;2011:	int		i;
;2012:	int		count;
;2013:
;2014:	count = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 2015
;2015:	for ( i = 0 ; i < bg_numItems ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $804
JUMPV
LABELV $801
line 2016
;2016:		if ( itemRegistered[i] ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
EQI4 $805
line 2017
;2017:			count++;
ADDRLP4 264
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2018
;2018:			string[i] = '1';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 49
ASGNI1
line 2019
;2019:		} else {
ADDRGP4 $806
JUMPV
LABELV $805
line 2020
;2020:			string[i] = '0';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 48
ASGNI1
line 2021
;2021:		}
LABELV $806
line 2022
;2022:	}
LABELV $802
line 2015
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $804
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $801
line 2023
;2023:	string[ bg_numItems ] = 0;
ADDRGP4 bg_numItems
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 2025
;2024:
;2025:	G_Printf( "%i items registered\n", count );
ADDRGP4 $807
ARGP4
ADDRLP4 264
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 2026
;2026:	trap_SetConfigstring(CS_ITEMS, string);
CNSTI4 27
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 2027
;2027:}
LABELV $800
endproc SaveRegisteredItems 268 8
export G_ItemDisabled
proc G_ItemDisabled 132 16
line 2034
;2028:
;2029:/*
;2030:============
;2031:G_ItemDisabled
;2032:============
;2033:*/
;2034:int G_ItemDisabled( gitem_t *item ) {
line 2038
;2035:
;2036:	char name[128];
;2037:
;2038:	Com_sprintf(name, sizeof(name), "disable_%s", item->classname);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $809
ARGP4
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 2039
;2039:	return trap_Cvar_VariableIntegerValue( name );
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
RETI4
LABELV $808
endproc G_ItemDisabled 132 16
export G_SpawnItem
proc G_SpawnItem 24 12
line 2052
;2040:}
;2041:
;2042:/*
;2043:============
;2044:G_SpawnItem
;2045:
;2046:Sets the clipping size and plants the object on the floor.
;2047:
;2048:Items can't be immediately dropped to floor, because they might
;2049:be on an entity that hasn't spawned yet.
;2050:============
;2051:*/
;2052:void G_SpawnItem (gentity_t *ent, gitem_t *item) {
line 2053
;2053:	int wDisable = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2055
;2054:
;2055:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $811
ARGP4
ADDRGP4 $812
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 2056
;2056:	G_SpawnFloat( "wait", "0", &ent->wait );
ADDRGP4 $813
ARGP4
ADDRGP4 $812
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 2061
;2057:
;2058:	// Register the item even if we're going to remove it, as unpatched clients
;2059:	// don't update their item registration on map_restart and we might enable
;2060:	// weapons after a map_restart.
;2061:	RegisterItem( item );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 2063
;2062:
;2063:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $814
line 2064
;2064:	{
line 2065
;2065:		wDisable = g_duelWeaponDisable.integer;
ADDRLP4 0
ADDRGP4 g_duelWeaponDisable+12
INDIRI4
ASGNI4
line 2066
;2066:	}
ADDRGP4 $815
JUMPV
LABELV $814
line 2068
;2067:	else
;2068:	{
line 2069
;2069:		wDisable = g_weaponDisable.integer;
ADDRLP4 0
ADDRGP4 g_weaponDisable+12
INDIRI4
ASGNI4
line 2070
;2070:	}
LABELV $815
line 2072
;2071:
;2072:	if (item->giType == IT_WEAPON &&
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $819
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $819
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BANDI4
ADDRLP4 16
INDIRI4
EQI4 $819
line 2075
;2073:		wDisable &&
;2074:		(wDisable & (1 << item->giTag)))
;2075:	{
line 2076
;2076:		if (g_gametype.integer != GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $821
line 2077
;2077:		{
line 2078
;2078:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2079
;2079:			return;
ADDRGP4 $810
JUMPV
LABELV $821
line 2081
;2080:		}
;2081:	}
LABELV $819
line 2083
;2082:
;2083:	if ( G_ItemDisabled(item) )
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_ItemDisabled
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $824
line 2084
;2084:		return;
ADDRGP4 $810
JUMPV
LABELV $824
line 2086
;2085:
;2086:	ent->item = item;
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 2089
;2087:	// some movers spawn on the second frame, so delay item
;2088:	// spawns until the third frame so they can ride trains
;2089:	ent->nextthink = level.time + FRAMETIME * 2;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 2090
;2090:	ent->think = FinishSpawningItem;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 FinishSpawningItem
ASGNP4
line 2092
;2091:
;2092:	ent->physicsBounce = 0.50;		// items are bouncy
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTF4 1056964608
ASGNF4
line 2094
;2093:
;2094:	if ( item->giType == IT_POWERUP ) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $827
line 2095
;2095:		G_SoundIndex( "sound/items/respawn1" );
ADDRGP4 $567
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 2096
;2096:		G_SpawnFloat( "noglobalsound", "0", &ent->speed);
ADDRGP4 $829
ARGP4
ADDRGP4 $812
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 2097
;2097:	}
LABELV $827
line 2098
;2098:}
LABELV $810
endproc G_SpawnItem 24 12
export G_BounceItem
proc G_BounceItem 92 12
line 2107
;2099:
;2100:
;2101:/*
;2102:================
;2103:G_BounceItem
;2104:
;2105:================
;2106:*/
;2107:void G_BounceItem( gentity_t *ent, trace_t *trace ) {
line 2113
;2108:	vec3_t	velocity;
;2109:	float	dot;
;2110:	int		hitTime;
;2111:
;2112:	// reflect the velocity on the trace plane
;2113:	hitTime = level.previousTime + ( level.time - level.previousTime ) * trace->fraction;
ADDRLP4 16
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
line 2114
;2114:	BG_EvaluateTrajectoryDelta( &ent->s.pos, hitTime, velocity );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 2115
;2115:	dot = DotProduct( velocity, trace->plane.normal );
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2116
;2116:	VectorMA( velocity, -2*dot, trace->plane.normal, ent->s.pos.trDelta );
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
ADDRLP4 12
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 2119
;2117:
;2118:	// cut the velocity to keep from bouncing forever
;2119:	VectorScale( ent->s.pos.trDelta, ent->physicsBounce, ent->s.pos.trDelta );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
MULF4
ASGNF4
line 2121
;2120:
;2121:	if ((ent->s.weapon == WP_DET_PACK && ent->s.eType == ET_GENERAL && ent->physicsObject))
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 13
NEI4 $838
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $838
ADDRLP4 48
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $838
line 2122
;2122:	{ //detpacks only
line 2123
;2123:		if (ent->touch)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $840
line 2124
;2124:		{
line 2125
;2125:			ent->touch(ent, &g_entities[trace->entityNum], trace);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
CNSTI4 2352
ADDRLP4 60
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CALLV
pop
line 2126
;2126:			return;
ADDRGP4 $830
JUMPV
LABELV $840
line 2128
;2127:		}
;2128:	}
LABELV $838
line 2131
;2129:
;2130:	// check for stop
;2131:	if ( trace->plane.normal[2] > 0 && ent->s.pos.trDelta[2] < 40 ) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
LEF4 $842
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 1109393408
GEF4 $842
line 2132
;2132:		trace->endpos[2] += 1.0;	// make sure it is off ground
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2133
;2133:		SnapVector( trace->endpos );
ADDRLP4 60
ADDRFP4 4
INDIRP4
CNSTI4 12
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
ADDRFP4 4
INDIRP4
CNSTI4 16
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
ADDRFP4 4
INDIRP4
CNSTI4 20
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
line 2134
;2134:		G_SetOrigin( ent, trace->endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2135
;2135:		ent->s.groundEntityNum = trace->entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 2136
;2136:		return;
ADDRGP4 $830
JUMPV
LABELV $842
line 2139
;2137:	}
;2138:
;2139:	VectorAdd( ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 372
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2140
;2140:	VectorCopy( ent->r.currentOrigin, ent->s.pos.trBase );
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
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2141
;2141:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2143
;2142:
;2143:	if (ent->s.eType == ET_HOLOCRON ||
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 5
EQI4 $847
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $845
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $845
ADDRLP4 72
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $845
LABELV $847
line 2145
;2144:		(ent->s.shouldtarget && ent->s.eType == ET_GENERAL && ent->physicsObject))
;2145:	{ //holocrons and sentry guns
line 2146
;2146:		if (ent->touch)
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $848
line 2147
;2147:		{
line 2148
;2148:			ent->touch(ent, &g_entities[trace->entityNum], trace);
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
CNSTI4 2352
ADDRLP4 88
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CALLV
pop
line 2149
;2149:		}
LABELV $848
line 2150
;2150:	}
LABELV $845
line 2151
;2151:}
LABELV $830
endproc G_BounceItem 92 12
export G_RunItem
proc G_RunItem 1112 28
line 2160
;2152:
;2153:
;2154:/*
;2155:================
;2156:G_RunItem
;2157:
;2158:================
;2159:*/
;2160:void G_RunItem( gentity_t *ent ) {
line 2167
;2161:	vec3_t		origin;
;2162:	trace_t		tr;
;2163:	int			contents;
;2164:	int			mask;
;2165:
;2166:	// if groundentity has been set to -1, it may have been pushed off an edge
;2167:	if ( ent->s.groundEntityNum == -1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $851
line 2168
;2168:		if ( ent->s.pos.trType != TR_GRAVITY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
EQI4 $853
line 2169
;2169:			ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 2170
;2170:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2171
;2171:		}
LABELV $853
line 2172
;2172:	}
LABELV $851
line 2174
;2173:
;2174:	if ( ent->s.pos.trType == TR_STATIONARY ) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $856
line 2176
;2175:		// check think function
;2176:		G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 2177
;2177:		return;
ADDRGP4 $850
JUMPV
LABELV $856
line 2181
;2178:	}
;2179:
;2180:	// get current position
;2181:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 1080
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2183
;2182:
;2183:	trap_UnlinkEntity(ent);	// In the case of my engine trace mod: don't let the entity block itself
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 2186
;2184:
;2185:	// trace a line from the previous position to the current position
;2186:	if ( ent->clipmask ) {
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 0
EQI4 $859
line 2187
;2187:		mask = ent->clipmask;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 2188
;2188:	} else {
ADDRGP4 $860
JUMPV
LABELV $859
line 2189
;2189:		mask = MASK_PLAYERSOLID & ~CONTENTS_BODY;//MASK_SOLID;
ADDRLP4 1096
CNSTI4 17
ASGNI4
line 2190
;2190:	}
LABELV $860
line 2191
;2191:	JP_Trace( &tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, 
ADDRLP4 0
ARGP4
ADDRLP4 1100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1100
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1100
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1100
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2194
;2192:		ent->r.ownerNum, mask );
;2193:
;2194:	VectorCopy( tr.endpos, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2196
;2195:
;2196:	if ( tr.startsolid ) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $862
line 2197
;2197:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2198
;2198:	}
LABELV $862
line 2200
;2199:
;2200:	trap_LinkEntity( ent );	// FIXME: avoid this for stationary?
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2203
;2201:
;2202:	// check think function
;2203:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 2205
;2204:
;2205:	if ( tr.fraction == 1 ) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $866
line 2206
;2206:		return;
ADDRGP4 $850
JUMPV
LABELV $866
line 2210
;2207:	}
;2208:
;2209:	// if it is in a nodrop volume, remove it
;2210:	contents = trap_PointContents( ent->r.currentOrigin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 1104
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 1092
ADDRLP4 1104
INDIRI4
ASGNI4
line 2211
;2211:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 1092
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $869
line 2212
;2212:		if (ent->item && ent->item->giType == IT_TEAM) {
ADDRLP4 1108
ADDRFP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $871
ADDRLP4 1108
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $871
line 2213
;2213:			Team_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_FreeEntity
CALLV
pop
line 2214
;2214:		} else {
ADDRGP4 $850
JUMPV
LABELV $871
line 2215
;2215:			G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2216
;2216:		}
line 2217
;2217:		return;
ADDRGP4 $850
JUMPV
LABELV $869
line 2220
;2218:	}
;2219:
;2220:	G_BounceItem( ent, &tr );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_BounceItem
CALLV
pop
line 2221
;2221:}
LABELV $850
endproc G_RunItem 1112 28
bss
export itemRegistered
align 4
LABELV itemRegistered
skip 1024
import droppedBlueFlag
import droppedRedFlag
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
import ArmorIndex
import Think_Weapon
import SetRespawn
import PrecacheItem
import UseHoldableItem
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
LABELV $829
byte 1 110
byte 1 111
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $813
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $812
byte 1 48
byte 1 0
align 1
LABELV $811
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $809
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $807
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $799
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $794
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 78
byte 1 111
byte 1 32
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
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $790
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 78
byte 1 111
byte 1 32
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
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $775
byte 1 70
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 111
byte 1 108
byte 1 105
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
LABELV $695
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
LABELV $692
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
LABELV $616
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $567
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 49
byte 1 0
align 1
LABELV $554
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $450
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
LABELV $449
byte 1 115
byte 1 101
byte 1 110
byte 1 116
byte 1 114
byte 1 121
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $331
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 47
byte 1 115
byte 1 104
byte 1 117
byte 1 116
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $307
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 117
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $273
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 116
byte 1 47
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $202
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
LABELV $201
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
byte 1 0
align 1
LABELV $200
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
byte 1 0
align 1
LABELV $199
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
LABELV $198
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
byte 1 0
