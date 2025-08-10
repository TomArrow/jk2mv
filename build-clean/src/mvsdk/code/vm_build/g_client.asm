data
align 4
LABELV playerMins
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV playerMaxs
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
export SP_info_player_deathmatch
code
proc SP_info_player_deathmatch 28 16
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_client.c"
line 20
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:#include "../ghoul2/G2.h"
;5:
;6:// g_client.c -- client functions that don't happen every frame
;7:
;8:static vec3_t	playerMins = {-15, -15, DEFAULT_MINS_2};
;9:static vec3_t	playerMaxs = {15, 15, DEFAULT_MAXS_2};
;10:
;11:forcedata_t Client_Force[MAX_CLIENTS];
;12:
;13:/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
;14:potential spawning position for deathmatch games.
;15:The first time a player enters the game, they will be at an 'initial' spot.
;16:Targets will be fired when someone spawns in on them.
;17:"nobots" will prevent bots from using this spot.
;18:"nohumans" will prevent non-bots from using this spot.
;19:*/
;20:void SP_info_player_deathmatch( gentity_t *ent ) {
line 24
;21:	int			i;
;22:	char* s;
;23:
;24:	ent->specialType = "playerspawn";
ADDRFP4 0
INDIRP4
CNSTI4 2304
ADDP4
ADDRGP4 $121
ASGNP4
line 25
;25:	G_SpawnInt( "nobots", "0", &i);
ADDRGP4 $122
ARGP4
ADDRGP4 $123
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 26
;26:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $124
line 27
;27:		ent->flags |= FL_NO_BOTS;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 28
;28:	}
LABELV $124
line 29
;29:	G_SpawnInt( "nohumans", "0", &i );
ADDRGP4 $126
ARGP4
ADDRGP4 $123
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 30
;30:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $127
line 31
;31:		ent->flags |= FL_NO_HUMANS;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 32
;32:	}
LABELV $127
line 33
;33:	G_SpawnString("spawntype", "", &s);
ADDRGP4 $129
ARGP4
ADDRGP4 $130
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 34
;34:	if (s && !Q_stricmp(s,"defrag")) {
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $131
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $133
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $131
line 35
;35:		ent->spawnDefragPriority = 2;
ADDRFP4 0
INDIRP4
CNSTI4 2328
ADDP4
CNSTI4 2
ASGNI4
line 36
;36:	}
LABELV $131
line 37
;37:	if (level.highestDefragSpawnPriority < ent->spawnDefragPriority) {
ADDRGP4 level+32608
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2328
ADDP4
INDIRI4
GEI4 $134
line 38
;38:		level.highestDefragSpawnPriority = ent->spawnDefragPriority;
ADDRGP4 level+32608
ADDRFP4 0
INDIRP4
CNSTI4 2328
ADDP4
INDIRI4
ASGNI4
line 39
;39:	}
LABELV $134
line 40
;40:	if (ent->notVQ3 || ent->notCPM) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $140
ADDRLP4 16
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $138
LABELV $140
line 41
;41:		G_Printf("^3Q3 style specific spawn found: %s, notvq3 %d, notcpm %d\n",ent->classname,ent->notVQ3,ent->notCPM);
ADDRGP4 $141
ARGP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 42
;42:		level.hasQ3StyleSpecificSpawns = qtrue;
ADDRGP4 level+29504
CNSTI4 1
ASGNI4
line 43
;43:	}
LABELV $138
line 44
;44:}
LABELV $120
endproc SP_info_player_deathmatch 28 16
export SP_info_player_start
proc SP_info_player_start 0 8
line 49
;45:
;46:/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
;47:equivelant to info_player_deathmatch
;48:*/
;49:void SP_info_player_start(gentity_t *ent) {
line 50
;50:	G_SetClassName(ent, "info_player_deathmatch");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 51
;51:	ent->spawnDefragPriority = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2328
ADDP4
CNSTI4 1
ASGNI4
line 52
;52:	SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 53
;53:}
LABELV $143
endproc SP_info_player_start 0 8
export SP_info_player_imperial
proc SP_info_player_imperial 0 8
line 58
;54:
;55:/*QUAKED info_player_imperial (1 0 0) (-16 -16 -24) (16 16 32)
;56:saga start point - imperial
;57:*/
;58:void SP_info_player_imperial(gentity_t *ent) {
line 59
;59:	if (g_gametype.integer != GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $146
line 60
;60:	{ //turn into a DM spawn if not in saga game mode
line 61
;61:		G_SetClassName(ent, "info_player_deathmatch");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 62
;62:		SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 63
;63:	}
LABELV $146
line 64
;64:}
LABELV $145
endproc SP_info_player_imperial 0 8
export SP_info_player_rebel
proc SP_info_player_rebel 0 8
line 69
;65:
;66:/*QUAKED info_player_rebel (1 0 0) (-16 -16 -24) (16 16 32)
;67:saga start point - rebel
;68:*/
;69:void SP_info_player_rebel(gentity_t *ent) {
line 70
;70:	if (g_gametype.integer != GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
EQI4 $150
line 71
;71:	{ //turn into a DM spawn if not in saga game mode
line 72
;72:		G_SetClassName(ent, "info_player_deathmatch");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 73
;73:		SP_info_player_deathmatch( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 74
;74:	}
LABELV $150
line 75
;75:}
LABELV $149
endproc SP_info_player_rebel 0 8
export SP_info_player_intermission
proc SP_info_player_intermission 0 0
line 80
;76:
;77:/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;78:The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;79:*/
;80:void SP_info_player_intermission( gentity_t *ent ) {
line 82
;81:
;82:}
LABELV $153
endproc SP_info_player_intermission 0 0
export ThrowSaberToAttacker
proc ThrowSaberToAttacker 68 8
line 87
;83:
;84:#define JMSABER_RESPAWN_TIME 20000 //in case it gets stuck somewhere no one can reach
;85:
;86:void ThrowSaberToAttacker(gentity_t *self, gentity_t *attacker)
;87:{
line 88
;88:	gentity_t *ent = &g_entities[self->client->ps.saberIndex];
ADDRLP4 0
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 90
;89:	vec3_t a;
;90:	int altVelocity = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 92
;91:
;92:	if (!ent || ent->enemy != self)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $157
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $155
LABELV $157
line 93
;93:	{ //something has gone very wrong (this should never happen)
line 98
;94:		//but in case it does.. find the saber manually
;95:#ifdef _DEBUG
;96:		Com_Printf("Lost the saber! Attempting to use global pointer..\n");
;97:#endif
;98:		ent = gJMSaberEnt;
ADDRLP4 0
ADDRGP4 gJMSaberEnt
INDIRP4
ASGNP4
line 100
;99:
;100:		if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $158
line 101
;101:		{
line 105
;102:#ifdef _DEBUG
;103:			Com_Printf("The global pointer was NULL. This is a bad thing.\n");
;104:#endif
;105:			return;
ADDRGP4 $154
JUMPV
LABELV $158
line 112
;106:		}
;107:
;108:#ifdef _DEBUG
;109:		Com_Printf("Got it (%i). Setting enemy to client %i.\n", ent->s.number, self->s.number);
;110:#endif
;111:
;112:		ent->enemy = self;
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 113
;113:		self->client->ps.saberIndex = ent->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 114
;114:	}
LABELV $155
line 116
;115:
;116:	trap_SetConfigstring ( CS_CLIENT_JEDIMASTER, "-1" );
CNSTI4 28
ARGI4
ADDRGP4 $160
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 118
;117:
;118:	if (attacker && attacker->client && self->client->ps.saberInFlight)
ADDRLP4 24
ADDRFP4 4
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
EQU4 $161
ADDRLP4 32
CNSTI4 408
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $161
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $161
line 119
;119:	{ //someone killed us and we had the saber thrown, so actually move this saber to the saber location
line 122
;120:	  //if we killed ourselves with saber thrown, however, same suicide rules of respawning at spawn spot still
;121:	  //apply.
;122:		gentity_t *flyingsaber = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 36
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
ADDRGP4 g_entities
ADDP4
ASGNP4
line 124
;123:
;124:		if (flyingsaber && flyingsaber->inuse)
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $163
ADDRLP4 36
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $163
line 125
;125:		{
line 126
;126:			VectorCopy(flyingsaber->s.pos.trBase, ent->s.pos.trBase);
ADDRLP4 44
CNSTI4 24
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 127
;127:			VectorCopy(flyingsaber->s.pos.trDelta, ent->s.pos.trDelta);
ADDRLP4 48
CNSTI4 36
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 128
;128:			VectorCopy(flyingsaber->s.apos.trBase, ent->s.apos.trBase);
ADDRLP4 52
CNSTI4 60
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 129
;129:			VectorCopy(flyingsaber->s.apos.trDelta, ent->s.apos.trDelta);
ADDRLP4 56
CNSTI4 72
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 131
;130:
;131:			VectorCopy(flyingsaber->r.currentOrigin, ent->r.currentOrigin);
ADDRLP4 60
CNSTI4 368
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 132
;132:			VectorCopy(flyingsaber->r.currentAngles, ent->r.currentAngles);
ADDRLP4 64
CNSTI4 380
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
ADDRLP4 36
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 133
;133:			altVelocity = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 134
;134:		}
LABELV $163
line 135
;135:	}
LABELV $161
line 137
;136:
;137:	self->client->ps.saberInFlight = qtrue; //say he threw it anyway in order to properly remove from dead body
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 139
;138:
;139:	ent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $165
ARGP4
ADDRLP4 36
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 140
;140:	ent->s.eFlags &= ~(EF_NODRAW);
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 141
;141:	ent->s.modelGhoul2 = 1;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 142
;142:	ent->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 143
;143:	ent->enemy = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTP4 0
ASGNP4
line 145
;144:
;145:	if (!attacker || !attacker->client)
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
EQU4 $168
ADDRLP4 44
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 48
INDIRU4
NEU4 $166
LABELV $168
line 146
;146:	{
line 147
;147:		VectorCopy(ent->s.origin2, ent->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 148
;148:		VectorCopy(ent->s.origin2, ent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 149
;149:		VectorCopy(ent->s.origin2, ent->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 150
;150:		ent->pos2[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTF4 0
ASGNF4
line 151
;151:		trap_LinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 152
;152:		return;
ADDRGP4 $154
JUMPV
LABELV $166
line 155
;153:	}
;154:
;155:	if (!altVelocity)
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $169
line 156
;156:	{
line 157
;157:		VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
ADDRLP4 52
CNSTI4 24
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 158
;158:		VectorCopy(self->s.pos.trBase, ent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 159
;159:		VectorCopy(self->s.pos.trBase, ent->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 161
;160:
;161:		VectorSubtract(attacker->client->ps.origin, ent->s.pos.trBase, a);
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 64
CNSTI4 24
ASGNI4
ADDRLP4 4
ADDRLP4 56
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 56
INDIRP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 163
;162:
;163:		VectorNormalize(a);
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 165
;164:
;165:		ent->s.pos.trDelta[0] = a[0]*256;
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1132462080
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 166
;166:		ent->s.pos.trDelta[1] = a[1]*256;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132462080
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
line 167
;167:		ent->s.pos.trDelta[2] = 256;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1132462080
ASGNF4
line 168
;168:	}
LABELV $169
line 170
;169:
;170:	trap_LinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 171
;171:}
LABELV $154
endproc ThrowSaberToAttacker 68 8
export JMSaberThink
proc JMSaberThink 28 4
line 174
;172:
;173:void JMSaberThink(gentity_t *ent)
;174:{
line 175
;175:	gJMSaberEnt = ent;
ADDRGP4 gJMSaberEnt
ADDRFP4 0
INDIRP4
ASGNP4
line 177
;176:
;177:	if (ent->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $175
line 178
;178:	{
line 179
;179:		if (!ent->enemy->client || !ent->enemy->inuse)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $179
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $177
LABELV $179
line 180
;180:		{ //disconnected?
line 181
;181:			VectorCopy(ent->enemy->s.pos.trBase, ent->s.pos.trBase);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 24
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 182
;182:			VectorCopy(ent->enemy->s.pos.trBase, ent->s.origin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 183
;183:			VectorCopy(ent->enemy->s.pos.trBase, ent->r.currentOrigin);
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
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 184
;184:			ent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $165
ARGP4
ADDRLP4 20
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 185
;185:			ent->s.eFlags &= ~(EF_NODRAW);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 8
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
line 186
;186:			ent->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 187
;187:			ent->s.eType = ET_MISSILE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 188
;188:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTP4 0
ASGNP4
line 190
;189:
;190:			ent->pos2[0] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTF4 1065353216
ASGNF4
line 191
;191:			ent->pos2[1] = 0; //respawn next think
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTF4 0
ASGNF4
line 192
;192:			trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 193
;193:		}
ADDRGP4 $176
JUMPV
LABELV $177
line 195
;194:		else
;195:		{
line 196
;196:			ent->pos2[1] = level.time + JMSABER_RESPAWN_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 20000
ADDI4
CVIF4 4
ASGNF4
line 197
;197:		}
line 198
;198:	}
ADDRGP4 $176
JUMPV
LABELV $175
line 199
;199:	else if (ent->pos2[0] && ent->pos2[1] < level.time)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
CNSTF4 0
EQF4 $181
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $181
line 200
;200:	{
line 201
;201:		VectorCopy(ent->s.origin2, ent->s.pos.trBase);
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
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 202
;202:		VectorCopy(ent->s.origin2, ent->s.origin);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 203
;203:		VectorCopy(ent->s.origin2, ent->r.currentOrigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 204
;204:		ent->pos2[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTF4 0
ASGNF4
line 205
;205:		trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 206
;206:	}
LABELV $181
LABELV $176
line 208
;207:
;208:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 209
;209:	G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 210
;210:}
LABELV $174
endproc JMSaberThink 28 4
export JMSaberTouch
proc JMSaberTouch 40 28
line 213
;211:
;212:void JMSaberTouch(gentity_t *self, gentity_t *other, trace_t *trace)
;213:{
line 214
;214:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 217
;215://	gentity_t *te;
;216:
;217:	if (!other || !other->client || other->health < 1)
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
EQU4 $189
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $189
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $186
LABELV $189
line 218
;218:	{
line 219
;219:		return;
ADDRGP4 $185
JUMPV
LABELV $186
line 222
;220:	}
;221:
;222:	if (self->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $190
line 223
;223:	{
line 224
;224:		return;
ADDRGP4 $185
JUMPV
LABELV $190
line 227
;225:	}
;226:
;227:	if (!self->s.modelindex)
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
NEI4 $192
line 228
;228:	{
line 229
;229:		return;
ADDRGP4 $185
JUMPV
LABELV $192
line 232
;230:	}
;231:
;232:	if (other->client->ps.stats[STAT_WEAPONS] & (1 << WP_SABER))
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $194
line 233
;233:	{
line 234
;234:		return;
ADDRGP4 $185
JUMPV
LABELV $194
line 237
;235:	}
;236:
;237:	if (other->client->ps.isJediMaster)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $196
line 238
;238:	{
line 239
;239:		return;
ADDRGP4 $185
JUMPV
LABELV $196
line 242
;240:	}
;241:
;242:	self->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 243
;243:	other->client->ps.stats[STAT_WEAPONS] = (1 << WP_SABER);
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 4
ASGNI4
line 244
;244:	other->client->ps.weapon = WP_SABER;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 245
;245:	other->s.weapon = WP_SABER;
ADDRFP4 4
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 246
;246:	G_AddEvent(other, EV_BECOME_JEDIMASTER, 0);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 30
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 249
;247:
;248:	// Track the jedi master 
;249:	trap_SetConfigstring ( CS_CLIENT_JEDIMASTER, va("%i", other->s.number ) );
ADDRGP4 $198
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 28
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 251
;250:
;251:	if (g_spawnInvulnerability.integer)
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
CNSTI4 0
EQI4 $199
line 252
;252:	{
line 253
;253:		other->client->ps.eFlags |= EF_INVULNERABLE;
ADDRLP4 16
ADDRFP4 4
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
CNSTI4 67108864
BORI4
ASGNI4
line 254
;254:		other->client->invulnerableTimer = LEVELTIME(other->client) + g_spawnInvulnerability.integer;
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
EQU4 $207
ADDRLP4 28
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $207
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $209
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $210
JUMPV
LABELV $209
ADDRLP4 24
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $210
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $207
ADDRLP4 20
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $208
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43588
ADDP4
ADDRLP4 20
INDIRI4
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
ADDI4
ASGNI4
line 255
;255:	}
LABELV $199
line 257
;256:
;257:	G_CenterPrint( -1, 3, va("%s" S_COLOR_WHITE " %s", other->client->pers.netname, G_GetStripEdString("SVINGAME", "BECOMEJM")), qtrue, qfalse,qtrue, NULL);
ADDRGP4 $212
ARGP4
ADDRGP4 $213
ARGP4
ADDRLP4 16
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $211
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_CenterPrint
CALLV
pop
line 259
;258:
;259:	other->client->ps.isJediMaster = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 1
ASGNI4
line 260
;260:	other->client->ps.saberIndex = self->s.number;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 620
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 262
;261:
;262:	if (other->health < 200 && other->health > 0)
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 200
GEI4 $214
ADDRLP4 28
INDIRI4
CNSTI4 0
LEI4 $214
line 263
;263:	{ //full health when you become the Jedi Master
line 264
;264:		other->client->ps.stats[STAT_HEALTH] = other->health = 200;
ADDRLP4 32
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 200
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 265
;265:	}
LABELV $214
line 267
;266:
;267:	if (other->client->ps.fd.forcePower < 100)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 100
GEI4 $219
line 268
;268:	{
line 269
;269:		other->client->ps.fd.forcePower = 100;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 100
ASGNI4
line 270
;270:	}
ADDRGP4 $219
JUMPV
LABELV $218
line 273
;271:
;272:	while (i < NUM_FORCE_POWERS)
;273:	{
line 274
;274:		other->client->ps.fd.forcePowersKnown |= (1 << i);
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 844
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 275
;275:		other->client->ps.fd.forcePowerLevel[i] = FORCE_LEVEL_3;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 944
ADDP4
ADDP4
CNSTI4 3
ASGNI4
line 277
;276:
;277:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 278
;278:	}
LABELV $219
line 272
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $218
line 280
;279:
;280:	self->pos2[0] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTF4 1065353216
ASGNF4
line 281
;281:	self->pos2[1] = level.time + JMSABER_RESPAWN_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 20000
ADDI4
CVIF4 4
ASGNF4
line 283
;282:
;283:	self->s.modelindex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 284
;284:	self->s.eFlags |= EF_NODRAW;
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
line 285
;285:	self->s.modelGhoul2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 286
;286:	self->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 293
;287:
;288:	/*
;289:	te = G_TempEntity( vec3_origin, EV_DESTROY_GHOUL2_INSTANCE );
;290:	te->r.svFlags |= SVF_BROADCAST;
;291:	te->s.eventParm = self->s.number;
;292:	*/
;293:	G_KillG2Queue(self->s.number);
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_KillG2Queue
CALLV
pop
line 295
;294:
;295:	return;
LABELV $185
endproc JMSaberTouch 40 28
data
export gJMSaberEnt
align 4
LABELV gJMSaberEnt
byte 4 0
export SP_info_jedimaster_start
code
proc SP_info_jedimaster_start 8 4
line 304
;296:}
;297:
;298:gentity_t *gJMSaberEnt = NULL;
;299:
;300:/*QUAKED info_jedimaster_start (1 0 0) (-16 -16 -24) (16 16 32)
;301:"jedi master" saber spawn point
;302:*/
;303:void SP_info_jedimaster_start(gentity_t *ent)
;304:{
line 305
;305:	if (g_gametype.integer != GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $223
line 306
;306:	{
line 307
;307:		gJMSaberEnt = NULL;
ADDRGP4 gJMSaberEnt
CNSTP4 0
ASGNP4
line 308
;308:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 309
;309:		return;
ADDRGP4 $222
JUMPV
LABELV $223
line 312
;310:	}
;311:
;312:	ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTP4 0
ASGNP4
line 314
;313:
;314:	ent->s.eFlags = EF_BOUNCE_HALF;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 316
;315:
;316:	ent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $165
ARGP4
ADDRLP4 0
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 317
;317:	ent->s.modelGhoul2 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 318
;318:	ent->s.g2radius = 20;
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 20
ASGNI4
line 320
;319:	//ent->s.eType = ET_GENERAL;
;320:	ent->s.eType = ET_MISSILE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 321
;321:	ent->s.weapon = WP_SABER;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 322
;322:	ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 323
;323:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 324
;324:	VectorSet( ent->r.maxs, 3, 3, 3 );
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
line 325
;325:	VectorSet( ent->r.mins, -3, -3, -3 );
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
line 326
;326:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 327
;327:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 1
ASGNI4
line 329
;328:
;329:	ent->isSaberEntity = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 856
ADDP4
CNSTI4 1
ASGNI4
line 331
;330:
;331:	ent->bounceCount = -5;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -5
ASGNI4
line 333
;332:
;333:	ent->physicsObject = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 335
;334:
;335:	VectorCopy(ent->s.pos.trBase, ent->s.origin2); //remember the spawn spot
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 337
;336:
;337:	ent->touch = JMSaberTouch;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 JMSaberTouch
ASGNP4
line 339
;338:
;339:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 341
;340:
;341:	ent->think = JMSaberThink;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 JMSaberThink
ASGNP4
line 342
;342:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 343
;343:}
LABELV $222
endproc SP_info_jedimaster_start 8 4
export SpotWouldTelefrag
proc SpotWouldTelefrag 4152 16
line 359
;344:
;345:/*
;346:=======================================================================
;347:
;348:  SelectSpawnPoint
;349:
;350:=======================================================================
;351:*/
;352:qboolean ShouldNotCollide(gentity_t* entity, gentity_t* other);
;353:/*
;354:================
;355:SpotWouldTelefrag
;356:
;357:================
;358:*/
;359:qboolean SpotWouldTelefrag( vec3_t origin, gentity_t* spawningEnt) {
line 365
;360:	int			i, num;
;361:	int			touch[MAX_GENTITIES];
;362:	gentity_t	*hit;
;363:	vec3_t		mins, maxs;
;364:
;365:	VectorAdd(origin, playerMins, mins );
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4132
INDIRP4
INDIRF4
ADDRGP4 playerMins
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4132
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 playerMins+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 playerMins+8
INDIRF4
ADDF4
ASGNF4
line 366
;366:	VectorAdd(origin, playerMaxs, maxs );
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4136
INDIRP4
INDIRF4
ADDRGP4 playerMaxs
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4136
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 playerMaxs+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 playerMaxs+8
INDIRF4
ADDF4
ASGNF4
line 367
;367:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4140
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4140
INDIRI4
ASGNI4
line 369
;368:
;369:	for (i=0 ; i<num ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $240
JUMPV
LABELV $237
line 370
;370:		hit = &g_entities[touch[i]];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 372
;371:		//if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
;372:		if ( hit->client) {
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $241
line 373
;373:			if (spawningEnt && !ShouldNotCollide(spawningEnt,hit)) {
ADDRLP4 4144
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $243
ADDRLP4 4144
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4148
ADDRGP4 ShouldNotCollide
CALLI4
ASGNI4
ADDRLP4 4148
INDIRI4
CNSTI4 0
NEI4 $243
line 374
;374:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $228
JUMPV
LABELV $243
line 376
;375:			}
;376:		}
LABELV $241
line 378
;377:
;378:	}
LABELV $238
line 369
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $240
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $237
line 380
;379:
;380:	return qfalse;
CNSTI4 0
RETI4
LABELV $228
endproc SpotWouldTelefrag 4152 16
export WiggleSpotTelefrag
proc WiggleSpotTelefrag 1148 28
line 385
;381:}
;382:
;383:#define	MIN_WALK_NORMAL	0.7f		// can't walk on very steep slopes
;384:#define BUBBLESPAWN_DOWNTRACE 120.0f // we can get up this much with force jump even at 1000fps (121)
;385:qboolean WiggleSpotTelefrag(vec3_t origin, gentity_t* spawningEnt) {
line 392
;386:	vec3_t		original;
;387:	vec3_t		test,testdown;
;388:	trace_t		groundTrace;
;389:	int			height;
;390:	int			right;
;391:	int			front;
;392:	qboolean	errorMsgShown = qfalse;
ADDRLP4 1120
CNSTI4 0
ASGNI4
line 394
;393:
;394:	VectorCopy(origin, original);
ADDRLP4 1108
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 395
;395:	for (height = 0; height < 3; height++) {
ADDRLP4 1128
CNSTI4 0
ASGNI4
LABELV $246
line 396
;396:		test[2] = original[2]+64.0f*height;
ADDRLP4 1080+8
ADDRLP4 1108+8
INDIRF4
CNSTF4 1115684864
ADDRLP4 1128
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 397
;397:		testdown[2] = original[2] - BUBBLESPAWN_DOWNTRACE;
ADDRLP4 1096+8
ADDRLP4 1108+8
INDIRF4
CNSTF4 1123024896
SUBF4
ASGNF4
line 398
;398:		for (front = -1; front < 2; front++) {
ADDRLP4 1124
CNSTI4 -1
ASGNI4
LABELV $254
line 399
;399:			testdown[0] = test[0] = original[0]+32.0f*front;
ADDRLP4 1132
ADDRLP4 1108
INDIRF4
CNSTF4 1107296256
ADDRLP4 1124
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRLP4 1080
ADDRLP4 1132
INDIRF4
ASGNF4
ADDRLP4 1096
ADDRLP4 1132
INDIRF4
ASGNF4
line 400
;400:			for (right = -1; right < 2; right++) {
ADDRLP4 1092
CNSTI4 -1
ASGNI4
LABELV $258
line 401
;401:				testdown[1] = test[1] = original[1]+32.0f*right;
ADDRLP4 1136
ADDRLP4 1108+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 1092
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1136
INDIRF4
ASGNF4
ADDRLP4 1096+4
ADDRLP4 1136
INDIRF4
ASGNF4
line 402
;402:				if (!SpotWouldTelefrag(test, spawningEnt)) { // cool, we could spawn here and not kill anyone.
ADDRLP4 1080
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $265
line 403
;403:					JP_Trace(&groundTrace,test,playerMins,playerMaxs,testdown,-1, MASK_PLAYERSOLID | MASK_WATER | CONTENTS_NOSPAWN);
ADDRLP4 0
ARGP4
ADDRLP4 1080
ARGP4
ADDRGP4 playerMins
ARGP4
ADDRGP4 playerMaxs
ARGP4
ADDRLP4 1096
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 537002263
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 404
;404:					if (groundTrace.startsolid || groundTrace.allsolid || (groundTrace.contents & (MASK_WATER | CONTENTS_NOSPAWN))) {
ADDRLP4 1144
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1144
INDIRI4
NEI4 $272
ADDRLP4 0
INDIRI4
ADDRLP4 1144
INDIRI4
NEI4 $272
ADDRLP4 0+48
INDIRI4
CVIU4 4
CNSTU4 537001990
BANDU4
CNSTU4 0
EQU4 $267
LABELV $272
line 405
;405:						continue; // welp, we can't spawn here, in a wall/water/lava/kill trigger or sth
ADDRGP4 $259
JUMPV
LABELV $267
line 407
;406:					}
;407:					if (groundTrace.fraction == 1.0f) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $273
line 408
;408:						continue; // nah therer's no ground to stand on
ADDRGP4 $259
JUMPV
LABELV $273
line 410
;409:					}
;410:					if (groundTrace.fraction == 0.0f) {
ADDRLP4 0+8
INDIRF4
CNSTF4 0
NEF4 $276
line 413
;411:						// this is a weird bug on at least one map i found where you dont get the proper startsolid/allsolid but you get 0 here. its really really odd.
;412:						//if (g_developer.integer) {
;413:						if (!errorMsgShown) {
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $259
line 414
;414:							Com_Printf("^1WiggleSpotTelefrag: Fraction is 0 but startsolid and allsolid are false. Skipping spawn.\n"); // debug buut it spams :/ screw it
ADDRGP4 $281
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 415
;415:							errorMsgShown = qtrue;
ADDRLP4 1120
CNSTI4 1
ASGNI4
line 416
;416:						}
line 418
;417:						//}
;418:						continue;
ADDRGP4 $259
JUMPV
LABELV $276
line 420
;419:					}
;420:					if (groundTrace.plane.normal[2] < MIN_WALK_NORMAL) {
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $282
line 421
;421:						continue; // we'd slide down.
ADDRGP4 $259
JUMPV
LABELV $282
line 423
;422:					}
;423:					VectorCopy(test, origin);
ADDRFP4 0
INDIRP4
ADDRLP4 1080
INDIRB
ASGNB 12
line 425
;424:					//JP_Trace(&groundTrace, test, playerMins, playerMaxs, testdown, -1, MASK_PLAYERSOLID | CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_NOSPAWN); // debug
;425:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $245
JUMPV
LABELV $265
line 427
;426:				}
;427:			}
LABELV $259
line 400
ADDRLP4 1092
ADDRLP4 1092
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 2
LTI4 $258
line 428
;428:		}
LABELV $255
line 398
ADDRLP4 1124
ADDRLP4 1124
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 2
LTI4 $254
line 429
;429:	}
LABELV $247
line 395
ADDRLP4 1128
ADDRLP4 1128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 3
LTI4 $246
line 430
;430:	VectorCopy(original, origin);
ADDRFP4 0
INDIRP4
ADDRLP4 1108
INDIRB
ASGNB 12
line 431
;431:	return qfalse;
CNSTI4 0
RETI4
LABELV $245
endproc WiggleSpotTelefrag 1148 28
export SelectNearestDeathmatchSpawnPoint
proc SelectNearestDeathmatchSpawnPoint 40 8
line 442
;432:}
;433:
;434:/*
;435:================
;436:SelectNearestDeathmatchSpawnPoint
;437:
;438:Find the spot that we DON'T want to use
;439:================
;440:*/
;441:#define	MAX_SPAWN_POINTS	128
;442:gentity_t *SelectNearestDeathmatchSpawnPoint( vec3_t from ) {
line 448
;443:	gentity_t	*spot;
;444:	vec3_t		delta;
;445:	float		dist, nearestDist;
;446:	gentity_t	*nearestSpot;
;447:
;448:	nearestDist = 999999;
ADDRLP4 20
CNSTF4 1232348144
ASGNF4
line 449
;449:	nearestSpot = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 450
;450:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $288
JUMPV
LABELV $287
line 452
;451:
;452:	while ((spot = G_FindByClassNameFast(spot, "info_player_deathmatch")) != NULL) {
line 454
;453:
;454:		VectorSubtract( spot->s.origin, from, delta );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 455
;455:		dist = VectorLength( delta );
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 36
INDIRF4
ASGNF4
line 456
;456:		if ( dist < nearestDist ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
GEF4 $292
line 457
;457:			nearestDist = dist;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 458
;458:			nearestSpot = spot;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 459
;459:		}
LABELV $292
line 460
;460:	}
LABELV $288
line 452
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 28
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $287
line 462
;461:
;462:	return nearestSpot;
ADDRLP4 24
INDIRP4
RETP4
LABELV $286
endproc SelectNearestDeathmatchSpawnPoint 40 8
export SelectRandomDeathmatchSpawnPoint
proc SelectRandomDeathmatchSpawnPoint 532 8
line 474
;463:}
;464:
;465:
;466:/*
;467:================
;468:SelectRandomDeathmatchSpawnPoint
;469:
;470:go to a random point that doesn't telefrag
;471:================
;472:*/
;473:#define	MAX_SPAWN_POINTS	128
;474:gentity_t *SelectRandomDeathmatchSpawnPoint( gentity_t* spawningEnt ) {
line 480
;475:	gentity_t	*spot;
;476:	int			count;
;477:	int			selection;
;478:	gentity_t	*spots[MAX_SPAWN_POINTS];
;479:
;480:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 481
;481:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $296
JUMPV
LABELV $295
line 483
;482:
;483:	while ((spot = G_FindByClassNameFast(spot, "info_player_deathmatch")) != NULL) {
line 484
;484:		if ( SpotWouldTelefrag( spot->s.origin, spawningEnt) ) {
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
CNSTI4 0
EQI4 $298
line 485
;485:			continue;
ADDRGP4 $296
JUMPV
LABELV $298
line 487
;486:		}
;487:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 488
;488:		count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 489
;489:	}
LABELV $296
line 483
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 524
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 524
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $295
line 491
;490:
;491:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $300
line 492
;492:		return G_FindByClassNameFast( NULL, "info_player_deathmatch");
CNSTP4 0
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 528
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $294
JUMPV
LABELV $300
line 495
;493:	}
;494:
;495:	selection = rand() % count;
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 520
ADDRLP4 528
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 496
;496:	return spots[ selection ];
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $294
endproc SelectRandomDeathmatchSpawnPoint 532 8
export SelectDefragSpawnPoint
proc SelectDefragSpawnPoint 36 8
line 501
;497:}
;498:
;499:
;500:gentity_t* SelectDefragSpawnPoint(gentity_t* spawningEnt, vec3_t avoidPoint, vec3_t origin, vec3_t angles)
;501:{
line 505
;502:	gentity_t* spot,*startSpot;
;503:	int			 i, j;
;504:
;505:	if (spawningEnt->client->pers.chosenDefragSpawnPoint) { // for maps where /savespawn isn't possible
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43432
ADDP4
INDIRI4
CNSTI4 0
EQI4 $303
line 506
;506:		spot = g_entities + spawningEnt->client->pers.chosenDefragSpawnPoint;
ADDRLP4 0
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43432
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 507
;507:		if (!Q_stricmp(spot->classname, "info_player_deathmatch")) {
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $305
line 508
;508:			if (!SpotWouldTelefrag(spot->s.origin, spawningEnt)) {
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $307
line 510
;509:
;510:				VectorCopy(spot->s.origin, origin);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 511
;511:				origin[2] += 9;
ADDRLP4 24
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 512
;512:				VectorCopy(spot->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 513
;513:				return spot;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $302
JUMPV
LABELV $307
line 515
;514:			}
;515:		}
LABELV $305
line 516
;516:	}
LABELV $303
line 518
;517:
;518:	startSpot = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 520
;519:
;520:	if (spawningEnt->client->pers.lastSpawnPoint) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43428
ADDP4
INDIRI4
CNSTI4 0
EQI4 $309
line 521
;521:		startSpot = g_entities + spawningEnt->client->pers.lastSpawnPoint;
ADDRLP4 8
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43428
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 522
;522:	}
LABELV $309
line 524
;523:
;524:	spot = startSpot;
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 525
;525:	for (i = 0; i < 2; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $316
JUMPV
LABELV $315
line 528
;526:		// we start out at startSpot and try to find the next in line, so that there's a clean "cycling" through them instead of randomness
;527:		// if there is none after, spot will be NULL and we do a second round as a "wrap around" from the start of g_entities
;528:		while ((spot = G_FindByClassNameFast(spot, "info_player_deathmatch")) != NULL) {
line 529
;529:			if (SpotWouldTelefrag(spot->s.origin, spawningEnt)) {
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $318
line 530
;530:				continue;
ADDRGP4 $316
JUMPV
LABELV $318
line 532
;531:			}
;532:			if (spot->spawnDefragPriority < level.highestDefragSpawnPriority) {
ADDRLP4 0
INDIRP4
CNSTI4 2328
ADDP4
INDIRI4
ADDRGP4 level+32608
INDIRI4
GEI4 $317
line 533
;533:				continue; // some types of spawns get priority in defrag
line 538
;534:			}
;535:			//if (spot == startSpot) { // not rly needed
;536:			//	break;
;537:			//}
;538:			break;
LABELV $316
line 528
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 16
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $315
LABELV $317
line 540
;539:		}
;540:		if (spot || !spot && !startSpot) {
ADDRLP4 20
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRU4
ADDRLP4 24
INDIRU4
NEU4 $325
ADDRLP4 20
INDIRU4
ADDRLP4 24
INDIRU4
NEU4 $323
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
NEU4 $323
LABELV $325
line 541
;541:			break;
ADDRGP4 $313
JUMPV
LABELV $323
line 543
;542:		}
;543:	}
LABELV $312
line 525
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LTI4 $316
LABELV $313
line 545
;544:
;545:	if (!spot) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $326
line 546
;546:		spot = G_FindByClassNameFast(NULL, "info_player_deathmatch");
CNSTP4 0
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 16
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 547
;547:		if (!spot)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $328
line 548
;548:		{
line 549
;549:			G_Error("Couldn't find a defrag spawn point");
ADDRGP4 $330
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 550
;550:		}
LABELV $328
line 551
;551:		VectorCopy(spot->s.origin, origin);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 552
;552:		if (g_bubbleSpawn.integer && !(spawningEnt->client && spawningEnt->client->sess.raceMode) && SpotWouldTelefrag(origin, spawningEnt)) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 g_bubbleSpawn+12
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $331
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
EQU4 $334
ADDRLP4 24
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $331
LABELV $334
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $331
line 553
;553:			WiggleSpotTelefrag(origin, spawningEnt);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WiggleSpotTelefrag
CALLI4
pop
line 554
;554:		}
LABELV $331
line 555
;555:		origin[2] += 9;
ADDRLP4 32
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 556
;556:		VectorCopy(spot->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 557
;557:		return spot;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $302
JUMPV
LABELV $326
line 560
;558:	}
;559:
;560:	VectorCopy(spot->s.origin, origin);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 561
;561:	origin[2] += 9;
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 562
;562:	VectorCopy(spot->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 563
;563:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $302
endproc SelectDefragSpawnPoint 36 8
export SelectRandomFurthestSpawnPoint
proc SelectRandomFurthestSpawnPoint 596 16
line 572
;564:}
;565:/*
;566:===========
;567:SelectRandomFurthestSpawnPoint
;568:
;569:Chooses a player start, deathmatch start, etc
;570:============
;571:*/
;572:gentity_t *SelectRandomFurthestSpawnPoint (gentity_t* spawningEnt,vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 580
;573:	gentity_t	*spot;
;574:	vec3_t		delta;
;575:	float		dist;
;576:	float		list_dist[64];
;577:	gentity_t	*list_spot[64];
;578:	int			numSpots, rnd, i, j;
;579:
;580:	numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 581
;581:	spot = NULL;
ADDRLP4 528
CNSTP4 0
ASGNP4
line 583
;582:
;583:	if (spawningEnt && spawningEnt->client && spawningEnt->client->sess.raceMode) {
ADDRLP4 548
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 552
CNSTU4 0
ASGNU4
ADDRLP4 548
INDIRP4
CVPU4 4
ADDRLP4 552
INDIRU4
EQU4 $339
ADDRLP4 556
ADDRLP4 548
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 556
INDIRP4
CVPU4 4
ADDRLP4 552
INDIRU4
EQU4 $339
ADDRLP4 556
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $339
line 584
;584:		return SelectDefragSpawnPoint(spawningEnt,avoidPoint,origin,angles);
ADDRFP4 0
INDIRP4
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
ADDRLP4 560
ADDRGP4 SelectDefragSpawnPoint
CALLP4
ASGNP4
ADDRLP4 560
INDIRP4
RETP4
ADDRGP4 $335
JUMPV
LABELV $338
line 587
;585:	}
;586:
;587:	while ((spot = G_FindByClassNameFast(spot, "info_player_deathmatch")) != NULL) {
line 588
;588:		if ( SpotWouldTelefrag( spot->s.origin, spawningEnt) ) {
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 560
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 560
INDIRI4
CNSTI4 0
EQI4 $341
line 589
;589:			continue;
ADDRGP4 $339
JUMPV
LABELV $341
line 591
;590:		}
;591:		if (spawningEnt && spawningEnt->client && spawningEnt->client->sess.raceMode && spot->spawnDefragPriority < level.highestDefragSpawnPriority) {
ADDRLP4 564
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 568
CNSTU4 0
ASGNU4
ADDRLP4 564
INDIRP4
CVPU4 4
ADDRLP4 568
INDIRU4
EQU4 $343
ADDRLP4 572
ADDRLP4 564
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 572
INDIRP4
CVPU4 4
ADDRLP4 568
INDIRU4
EQU4 $343
ADDRLP4 572
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $343
ADDRLP4 528
INDIRP4
CNSTI4 2328
ADDP4
INDIRI4
ADDRGP4 level+32608
INDIRI4
GEI4 $343
line 592
;592:			continue; // some types of spawns get priority in defrag
ADDRGP4 $339
JUMPV
LABELV $343
line 594
;593:		}
;594:		VectorSubtract( spot->s.origin, avoidPoint, delta );
ADDRLP4 580
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 580
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 580
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 595
;595:		dist = VectorLength( delta );
ADDRLP4 532
ARGP4
ADDRLP4 584
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 584
INDIRF4
ASGNF4
line 596
;596:		for (i = 0; i < numSpots; i++) {
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $351
JUMPV
LABELV $348
line 597
;597:			if ( dist > list_dist[i] ) {
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $352
line 598
;598:				if ( numSpots >= 64 )
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $354
line 599
;599:					numSpots = 64-1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $354
line 600
;600:				for (j = numSpots; j > i; j--) {
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $359
JUMPV
LABELV $356
line 601
;601:					list_dist[j] = list_dist[j-1];
ADDRLP4 588
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 588
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 588
INDIRI4
ADDRLP4 4-4
ADDP4
INDIRF4
ASGNF4
line 602
;602:					list_spot[j] = list_spot[j-1];
ADDRLP4 592
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 592
INDIRI4
ADDRLP4 260
ADDP4
ADDRLP4 592
INDIRI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 603
;603:				}
LABELV $357
line 600
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $359
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $356
line 604
;604:				list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 605
;605:				list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 606
;606:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 607
;607:				if (numSpots > 64)
ADDRLP4 520
INDIRI4
CNSTI4 64
LEI4 $350
line 608
;608:					numSpots = 64;
ADDRLP4 520
CNSTI4 64
ASGNI4
line 609
;609:				break;
ADDRGP4 $350
JUMPV
LABELV $352
line 611
;610:			}
;611:		}
LABELV $349
line 596
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $351
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $348
LABELV $350
line 612
;612:		if (i >= numSpots && numSpots < 64) {
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $364
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $364
line 613
;613:			list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 614
;614:			list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 615
;615:			numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 616
;616:		}
LABELV $364
line 617
;617:	}
LABELV $339
line 587
ADDRLP4 528
INDIRP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 560
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 560
INDIRP4
ASGNP4
ADDRLP4 560
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $338
line 618
;618:	if (!numSpots) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $366
line 619
;619:		spot = G_FindByClassNameFast( NULL, "info_player_deathmatch");
CNSTP4 0
ARGP4
ADDRGP4 $144
ARGP4
ADDRLP4 564
ADDRGP4 G_FindByClassNameFast
CALLP4
ASGNP4
ADDRLP4 528
ADDRLP4 564
INDIRP4
ASGNP4
line 620
;620:		if (!spot)
ADDRLP4 528
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $368
line 621
;621:		{
line 622
;622:			G_Error( "Couldn't find a spawn point" );
ADDRGP4 $370
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 623
;623:		}
LABELV $368
line 624
;624:		VectorCopy (spot->s.origin, origin);
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 625
;625:		if (g_bubbleSpawn.integer && !(spawningEnt && spawningEnt->client && spawningEnt->client->sess.raceMode) && SpotWouldTelefrag(origin, spawningEnt)) {
ADDRLP4 568
CNSTI4 0
ASGNI4
ADDRGP4 g_bubbleSpawn+12
INDIRI4
ADDRLP4 568
INDIRI4
EQI4 $371
ADDRLP4 572
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 576
CNSTU4 0
ASGNU4
ADDRLP4 572
INDIRP4
CVPU4 4
ADDRLP4 576
INDIRU4
EQU4 $375
ADDRLP4 580
ADDRLP4 572
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 580
INDIRP4
CVPU4 4
ADDRLP4 576
INDIRU4
EQU4 $375
ADDRLP4 580
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 568
INDIRI4
NEI4 $371
LABELV $375
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 584
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 584
INDIRI4
CNSTI4 0
EQI4 $371
line 626
;626:			WiggleSpotTelefrag(origin, spawningEnt);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WiggleSpotTelefrag
CALLI4
pop
line 627
;627:		}
LABELV $371
line 628
;628:		origin[2] += 9;
ADDRLP4 588
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 588
INDIRP4
ADDRLP4 588
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 629
;629:		VectorCopy (spot->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 630
;630:		return spot;
ADDRLP4 528
INDIRP4
RETP4
ADDRGP4 $335
JUMPV
LABELV $366
line 634
;631:	}
;632:
;633:	// select a random spot from the spawn points furthest away
;634:	rnd = random() * (numSpots / 2);
ADDRLP4 564
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 544
ADDRLP4 564
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRLP4 520
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 636
;635:
;636:	VectorCopy (list_spot[rnd]->s.origin, origin);
ADDRFP4 8
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 637
;637:	origin[2] += 9;
ADDRLP4 568
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 568
INDIRP4
ADDRLP4 568
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 638
;638:	VectorCopy (list_spot[rnd]->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 640
;639:
;640:	return list_spot[rnd];
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
RETP4
LABELV $335
endproc SelectRandomFurthestSpawnPoint 596 16
export SelectSpawnPoint
proc SelectSpawnPoint 4 16
line 650
;641:}
;642:
;643:/*
;644:===========
;645:SelectSpawnPoint
;646:
;647:Chooses a player start, deathmatch start, etc
;648:============
;649:*/
;650:gentity_t *SelectSpawnPoint (gentity_t* spawningEnt,vec3_t avoidPoint, vec3_t origin, vec3_t angles ) {
line 651
;651:	return SelectRandomFurthestSpawnPoint(spawningEnt,avoidPoint, origin, angles );
ADDRFP4 0
INDIRP4
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
ADDRLP4 0
ADDRGP4 SelectRandomFurthestSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $376
endproc SelectSpawnPoint 4 16
export SelectInitialSpawnPoint
proc SelectInitialSpawnPoint 20 16
line 690
;652:
;653:	/*
;654:	gentity_t	*spot;
;655:	gentity_t	*nearestSpot;
;656:
;657:	nearestSpot = SelectNearestDeathmatchSpawnPoint( avoidPoint );
;658:
;659:	spot = SelectRandomDeathmatchSpawnPoint ( );
;660:	if ( spot == nearestSpot ) {
;661:		// roll again if it would be real close to point of death
;662:		spot = SelectRandomDeathmatchSpawnPoint ( );
;663:		if ( spot == nearestSpot ) {
;664:			// last try
;665:			spot = SelectRandomDeathmatchSpawnPoint ( );
;666:		}		
;667:	}
;668:
;669:	// find a single player start spot
;670:	if (!spot) {
;671:		G_Error( "Couldn't find a spawn point" );
;672:	}
;673:
;674:	VectorCopy (spot->s.origin, origin);
;675:	origin[2] += 9;
;676:	VectorCopy (spot->s.angles, angles);
;677:
;678:	return spot;
;679:	*/
;680:}
;681:
;682:/*
;683:===========
;684:SelectInitialSpawnPoint
;685:
;686:Try to find a spawn point marked 'initial', otherwise
;687:use normal spawn selection.
;688:============
;689:*/
;690:gentity_t *SelectInitialSpawnPoint(gentity_t* spawningEnt, vec3_t origin, vec3_t angles ) {
line 693
;691:	gentity_t	*spot;
;692:
;693:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $379
JUMPV
LABELV $378
line 694
;694:	while ((spot = G_FindByClassNameFast(spot, "info_player_deathmatch")) != NULL) {
line 695
;695:		if ( spot->spawnflags & 1 && (!(spawningEnt->client && spawningEnt->client->sess.raceMode) || spot->spawnDefragPriority == level.highestDefragSpawnPriority)) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $381
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
EQU4 $384
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $384
ADDRLP4 0
INDIRP4
CNSTI4 2328
ADDP4
INDIRI4
ADDRGP4 level+32608
INDIRI4
NEI4 $381
LABELV $384
line 696
;696:			break;
ADDRGP4 $380
JUMPV
LABELV $381
line 698
;697:		}
;698:	}
LABELV $379
line 694
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $144
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
NEU4 $378
LABELV $380
line 700
;699:
;700:	if ( !spot || SpotWouldTelefrag( spot->s.origin, spawningEnt) ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $387
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $385
LABELV $387
line 701
;701:		return SelectSpawnPoint(spawningEnt,vec3_origin, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $377
JUMPV
LABELV $385
line 704
;702:	}
;703:
;704:	VectorCopy (spot->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 705
;705:	origin[2] += 9;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 706
;706:	VectorCopy (spot->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 708
;707:
;708:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $377
endproc SelectInitialSpawnPoint 20 16
export SelectSpectatorSpawnPoint
proc SelectSpectatorSpawnPoint 0 0
line 717
;709:}
;710:
;711:/*
;712:===========
;713:SelectSpectatorSpawnPoint
;714:
;715:============
;716:*/
;717:gentity_t *SelectSpectatorSpawnPoint( vec3_t origin, vec3_t angles ) {
line 718
;718:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 720
;719:
;720:	VectorCopy( level.intermission_origin, origin );
ADDRFP4 0
INDIRP4
ADDRGP4 level+9044
INDIRB
ASGNB 12
line 721
;721:	VectorCopy( level.intermission_angle, angles );
ADDRFP4 4
INDIRP4
ADDRGP4 level+9056
INDIRB
ASGNB 12
line 723
;722:
;723:	return NULL;
CNSTP4 0
RETP4
LABELV $388
endproc SelectSpectatorSpawnPoint 0 0
export InitBodyQue
proc InitBodyQue 12 8
line 749
;724:}
;725:
;726:/*
;727:=======================================================================
;728:
;729:BODYQUE
;730:
;731:=======================================================================
;732:*/
;733:
;734:/*
;735:=======================================================================
;736:
;737:BODYQUE
;738:
;739:=======================================================================
;740:*/
;741:
;742:#define BODY_SINK_TIME		45000
;743:
;744:/*
;745:===============
;746:InitBodyQue
;747:===============
;748:*/
;749:void InitBodyQue (void) {
line 753
;750:	int		i;
;751:	gentity_t	*ent;
;752:
;753:	level.bodyQueIndex = 0;
ADDRGP4 level+9076
CNSTI4 0
ASGNI4
line 754
;754:	for (i=0; i<BODY_QUEUE_SIZE ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $393
line 755
;755:		ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 756
;756:		G_SetClassName(ent, "bodyque");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $397
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 757
;757:		ent->neverFree = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
CNSTI4 1
ASGNI4
line 758
;758:		level.bodyQue[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9080
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 759
;759:	}
LABELV $394
line 754
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $393
line 760
;760:}
LABELV $391
endproc InitBodyQue 12 8
export InitPlayerStats
proc InitPlayerStats 16 8
line 767
;761:
;762:/*
;763:===============
;764:InitPlayerStats
;765:===============
;766:*/
;767:void InitPlayerStats(void) {
line 771
;768:	int		i;
;769:	gentity_t* ent;
;770:
;771:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $400
line 773
;772:		//if (g_defrag.integer) {
;773:			ent = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 774
;774:			G_SetClassName(ent, "playerstats");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $404
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 775
;775:			ent->neverFree = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
CNSTI4 1
ASGNI4
line 776
;776:			ent->s.eType = ET_INVISIBLE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 12
ASGNI4
line 777
;777:			ent->s.clientNum = i;
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 778
;778:			ent->s.modelGhoul2 = 15; // tell tommyternal cgame that this is a player stats object :)
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 15
ASGNI4
line 779
;779:			ent->r.svFlags |= SVF_BROADCAST;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 780
;780:			level.playerStats[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9152
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 781
;781:			trap_LinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 786
;782:		//}
;783:		//else {
;784:		//	level.playerStats[i] = 0;
;785:		//}
;786:	}
LABELV $401
line 771
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $400
line 787
;787:}
LABELV $399
endproc InitPlayerStats 16 8
export BodySink
proc BodySink 4 4
line 796
;788:
;789:/*
;790:=============
;791:BodySink
;792:
;793:After sitting around for five seconds, fall into the ground and dissapear
;794:=============
;795:*/
;796:void BodySink( gentity_t *ent ) {
line 797
;797:	if ( level.time - ent->timestamp > BODY_SINK_TIME + 1500 ) {
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
SUBI4
CNSTI4 46500
LEI4 $407
line 799
;798:		// the body ques are never actually freed, they are just unlinked
;799:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 800
;800:		ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 801
;801:		return;	
ADDRGP4 $406
JUMPV
LABELV $407
line 803
;802:	}
;803:	ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 804
;804:	ent->s.pos.trBase[2] -= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 805
;805:}
LABELV $406
endproc BodySink 4 4
export CopyToBodyQue
proc CopyToBodyQue 64 12
line 815
;806:
;807:/*
;808:=============
;809:CopyToBodyQue
;810:
;811:A player is respawning, so make an entity that looks
;812:just like the existing corpse to leave behind.
;813:=============
;814:*/
;815:void CopyToBodyQue( gentity_t *ent ) {
line 819
;816:	gentity_t		*body;
;817:	int			contents;
;818:
;819:	if (level.intermissiontime)
ADDRGP4 level+9028
INDIRI4
CNSTI4 0
EQI4 $412
line 820
;820:	{
line 821
;821:		return;
ADDRGP4 $411
JUMPV
LABELV $412
line 824
;822:	}
;823:
;824:	if ( !ent || !ent->client ) return;
ADDRLP4 8
ADDRFP4 0
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
EQU4 $417
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
NEU4 $415
LABELV $417
ADDRGP4 $411
JUMPV
LABELV $415
line 826
;825:
;826:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 829
;827:
;828:	// if client is in a nodrop area, don't leave the body
;829:	contents = trap_PointContents( ent->s.origin, -1 );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 16
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 830
;830:	if ( contents & CONTENTS_NODROP ) {
ADDRLP4 4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $418
line 831
;831:		return;
ADDRGP4 $411
JUMPV
LABELV $418
line 834
;832:	}
;833:
;834:	if (ent->client->ps.eFlags & EF_DISINTEGRATION)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $420
line 835
;835:	{ //for now, just don't spawn a body if you got disint'd
line 836
;836:		return;
ADDRGP4 $411
JUMPV
LABELV $420
line 840
;837:	}
;838:
;839:	// grab a body que and cycle to the next one
;840:	body = level.bodyQue[ level.bodyQueIndex ];
ADDRLP4 0
ADDRGP4 level+9076
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+9080
ADDP4
INDIRP4
ASGNP4
line 841
;841:	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+9076
ADDRGP4 level+9076
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 8
MODI4
ASGNI4
line 843
;842:
;843:	trap_UnlinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 844
;844:	body->s = ent->s;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 296
line 845
;845:	if (g_entHUDFields.integer) {
ADDRGP4 g_entHUDFields+12
INDIRI4
CNSTI4 0
EQI4 $426
line 846
;846:		body->s.generic1 = 0;
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
CNSTI4 0
ASGNI4
line 847
;847:		body->s.trickedentindex3 = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 848
;848:		body->s.trickedentindex4 = 0;
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 849
;849:	}
LABELV $426
line 852
;850:
;851:	//avoid oddly angled corpses floating around
;852:	body->s.angles[PITCH] = body->s.angles[ROLL] = body->s.apos.trBase[PITCH] = body->s.apos.trBase[ROLL] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
line 854
;853:
;854:	body->s.g2radius = 100;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 100
ASGNI4
line 856
;855:
;856:	body->s.eType = ET_BODY;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 15
ASGNI4
line 857
;857:	body->s.eFlags = EF_DEAD;		// clear EF_TALK, etc
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 859
;858:
;859:	if (ent->client->ps.eFlags & EF_DISINTEGRATION)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $429
line 860
;860:	{
line 861
;861:		body->s.eFlags |= EF_DISINTEGRATION;
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
CNSTI4 33554432
BORI4
ASGNI4
line 862
;862:	}
LABELV $429
line 864
;863:
;864:	VectorCopy(ent->client->ps.lastHitLoc, body->s.origin2);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1368
ADDP4
INDIRB
ASGNB 12
line 866
;865:
;866:	body->s.powerups = 0;	// clear powerups
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 867
;867:	body->s.loopSound = 0;	// clear lava burning
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 868
;868:	body->s.number = body - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ASGNI4
line 869
;869:	body->timestamp = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 584
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 870
;870:	body->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 871
;871:	body->physicsBounce = 0;		// don't bounce
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTF4 0
ASGNF4
line 872
;872:	if ( body->s.groundEntityNum == ENTITYNUM_NONE ) {
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $432
line 873
;873:		body->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 874
;874:		body->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 875
;875:		VectorCopy( ent->client->ps.velocity, body->s.pos.trDelta );
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 876
;876:	} else {
ADDRGP4 $433
JUMPV
LABELV $432
line 877
;877:		body->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 878
;878:	}
LABELV $433
line 879
;879:	body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
CNSTI4 0
ASGNI4
line 881
;880:
;881:	body->s.weapon = ent->s.bolt2;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 883
;882:
;883:	if (body->s.weapon == WP_SABER && ent->client->ps.saberInFlight)
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $435
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $435
line 884
;884:	{
line 885
;885:		body->s.weapon = WP_BLASTER; //lie to keep from putting a saber on the corpse, because it was thrown at death
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 886
;886:	}
LABELV $435
line 888
;887:
;888:	G_AddEvent(body, EV_BODY_QUEUE_COPY, ent->s.clientNum);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 109
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 890
;889:
;890:	body->r.svFlags = ent->r.svFlags | SVF_BROADCAST;
ADDRLP4 32
CNSTI4 304
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 891
;891:	VectorCopy (ent->r.mins, body->r.mins);
ADDRLP4 36
CNSTI4 316
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 892
;892:	VectorCopy (ent->r.maxs, body->r.maxs);
ADDRLP4 40
CNSTI4 328
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 893
;893:	VectorCopy (ent->r.absmin, body->r.absmin);
ADDRLP4 44
CNSTI4 344
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 894
;894:	VectorCopy (ent->r.absmax, body->r.absmax);
ADDRLP4 48
CNSTI4 356
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 896
;895:
;896:	body->s.torsoAnim = body->s.legsAnim = ent->client->ps.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 56
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
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 898
;897:
;898:	body->clipmask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 17
ASGNI4
line 899
;899:	body->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 512
ASGNI4
line 900
;900:	body->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 902
;901:
;902:	body->nextthink = level.time + BODY_SINK_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 45000
ADDI4
ASGNI4
line 903
;903:	body->think = BodySink;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 BodySink
ASGNP4
line 905
;904:
;905:	body->die = body_die;
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 body_die
ASGNP4
line 908
;906:
;907:	// don't take more damage if already gibbed
;908:	if ( ent->health <= GIB_HEALTH ) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $438
line 909
;909:		body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 910
;910:	} else {
ADDRGP4 $439
JUMPV
LABELV $438
line 911
;911:		body->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 912
;912:	}
LABELV $439
line 914
;913:
;914:	VectorCopy ( body->s.pos.trBase, body->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 915
;915:	trap_LinkEntity (body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 916
;916:}
LABELV $411
endproc CopyToBodyQue 64 12
export SetClientViewAngle
proc SetClientViewAngle 36 0
line 927
;917:
;918://======================================================================
;919:
;920:
;921:/*
;922:==================
;923:SetClientViewAngle
;924:
;925:==================
;926:*/
;927:void SetClientViewAngle( gentity_t *ent, vec3_t angle ) {
line 930
;928:	int			i;
;929:	int			oldRoll;
;930:	qboolean	strafebot = ent->client->sess.raceMode && (ent->client->sess.raceStyle.runFlags & RFL_BOT) || ent->client->sess.rollAngleInvalidated;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $445
ADDRLP4 16
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 16
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $444
LABELV $445
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $442
LABELV $444
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $443
JUMPV
LABELV $442
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $443
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 932
;931:
;932:	if (strafebot) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $446
line 933
;933:		oldRoll = ent->client->pers.cmd.angles[ROLL];
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1396
ADDP4
INDIRI4
ASGNI4
line 934
;934:		ent->client->pers.cmd.angles[ROLL] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1396
ADDP4
CNSTI4 0
ASGNI4
line 935
;935:	}
LABELV $446
line 938
;936:
;937:	// set the delta angle
;938:	for (i=0 ; i<3 ; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $448
line 941
;939:		int		cmdAngle;
;940:
;941:		cmdAngle = ANGLE2SHORT(angle[i]);
ADDRLP4 24
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
line 942
;942:		ent->client->ps.delta_angles[i] = cmdAngle - ent->client->pers.cmd.angles[i];
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 68
ADDP4
ADDP4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 1388
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 943
;943:	}
LABELV $449
line 938
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $448
line 944
;944:	VectorCopy( angle, ent->s.angles );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 945
;945:	VectorCopy (ent->s.angles, ent->client->ps.viewangles);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 947
;946:
;947:	if (strafebot) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $452
line 948
;948:		ent->client->pers.cmd.angles[ROLL] = oldRoll;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1396
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 949
;949:	}
LABELV $452
line 950
;950:}
LABELV $440
endproc SetClientViewAngle 36 0
export respawn
proc respawn 12 8
line 957
;951:
;952:/*
;953:================
;954:respawn
;955:================
;956:*/
;957:void respawn( gentity_t *ent ) {
line 960
;958:	gentity_t	*tent;
;959:
;960:	if (!ent->client->sess.raceMode) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $455
line 961
;961:		CopyToBodyQue(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 962
;962:	}
LABELV $455
line 964
;963:
;964:	if (gEscaping)
ADDRGP4 gEscaping
INDIRI4
CNSTI4 0
EQI4 $457
line 965
;965:	{
line 966
;966:		ent->client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
CNSTI4 3
ASGNI4
line 967
;967:		ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43448
ADDP4
CNSTI4 1
ASGNI4
line 968
;968:		ent->client->sess.spectatorClient = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43452
ADDP4
CNSTI4 0
ASGNI4
line 970
;969:
;970:		ent->client->pers.teamState.state = TEAM_BEGIN;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1640
ADDP4
CNSTI4 0
ASGNI4
line 971
;971:	}
LABELV $457
line 973
;972:
;973:	trap_UnlinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 974
;974:	ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 977
;975:
;976:	// add a teleportation effect
;977:	if (!ent->client->sess.raceMode) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $459
line 978
;978:		tent = G_TempEntity(ent->client->ps.origin, EV_PLAYER_TELEPORT_IN);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 979
;979:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 8
CNSTI4 220
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 980
;980:	}
LABELV $459
line 981
;981:}
LABELV $454
endproc respawn 12 8
export ClientRespawn
proc ClientRespawn 0 4
line 983
;982:
;983:void ClientRespawn(gentity_t* ent) {
line 988
;984:
;985:	//MaintainBodyQueue(ent);
;986:
;987:	// i dont even know what this does :)
;988:	if (gEscaping)// || g_gametype == GT_POWERDUEL) 
ADDRGP4 gEscaping
INDIRI4
CNSTI4 0
EQI4 $462
line 989
;989:	{
line 990
;990:		ent->client->sess.sessionTeam = TEAM_SPECTATOR;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
CNSTI4 3
ASGNI4
line 991
;991:		ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43448
ADDP4
CNSTI4 1
ASGNI4
line 992
;992:		ent->client->sess.spectatorClient = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43452
ADDP4
CNSTI4 0
ASGNI4
line 994
;993:
;994:		ent->client->pers.teamState.state = TEAM_BEGIN;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1640
ADDP4
CNSTI4 0
ASGNI4
line 996
;995:		//AddTournamentQueue(ent->client);
;996:		ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 998
;997:		//ent->client->iAmALoser = qtrue;
;998:		return;
ADDRGP4 $461
JUMPV
LABELV $462
line 1001
;999:	}
;1000:
;1001:	trap_UnlinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1004
;1002:
;1003:
;1004:	ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 1005
;1005:}
LABELV $461
endproc ClientRespawn 0 4
export TeamCount
proc TeamCount 8 0
line 1015
;1006:
;1007:
;1008:/*
;1009:================
;1010:TeamCount
;1011:
;1012:Returns number of players on a team
;1013:================
;1014:*/
;1015:team_t TeamCount( int ignoreClientNum, team_t team ) {
line 1017
;1016:	int		i;
;1017:	int		count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1019
;1018:
;1019:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $468
JUMPV
LABELV $465
line 1020
;1020:		if ( i == ignoreClientNum ) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $470
line 1021
;1021:			continue;
ADDRGP4 $466
JUMPV
LABELV $470
line 1023
;1022:		}
;1023:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $472
line 1024
;1024:			continue;
ADDRGP4 $466
JUMPV
LABELV $472
line 1026
;1025:		}
;1026:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $474
line 1027
;1027:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1028
;1028:		}
LABELV $474
line 1029
;1029:	}
LABELV $466
line 1019
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $468
ADDRLP4 0
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $465
line 1031
;1030:
;1031:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $464
endproc TeamCount 8 0
export TeamLeader
proc TeamLeader 4 0
line 1041
;1032:}
;1033:
;1034:/*
;1035:================
;1036:TeamLeader
;1037:
;1038:Returns the client number of the team leader
;1039:================
;1040:*/
;1041:int TeamLeader( team_t team ) {
line 1044
;1042:	int		i;
;1043:
;1044:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $480
JUMPV
LABELV $477
line 1045
;1045:		if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $482
line 1046
;1046:			continue;
ADDRGP4 $478
JUMPV
LABELV $482
line 1048
;1047:		}
;1048:		if ( level.clients[i].sess.sessionTeam == team ) {
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $484
line 1049
;1049:			if ( level.clients[i].sess.teamLeader )
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43480
ADDP4
INDIRI4
CNSTI4 0
EQI4 $486
line 1050
;1050:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $476
JUMPV
LABELV $486
line 1051
;1051:		}
LABELV $484
line 1052
;1052:	}
LABELV $478
line 1044
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $480
ADDRLP4 0
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $477
line 1054
;1053:
;1054:	return -1;
CNSTI4 -1
RETI4
LABELV $476
endproc TeamLeader 4 0
export PickTeam
proc PickTeam 24 8
line 1064
;1055:}
;1056:
;1057:
;1058:/*
;1059:================
;1060:PickTeam
;1061:
;1062:================
;1063:*/
;1064:team_t PickTeam( int ignoreClientNum ) {
line 1067
;1065:	int		counts[TEAM_NUM_TEAMS];
;1066:
;1067:	counts[TEAM_BLUE] = TeamCount( ignoreClientNum, TEAM_BLUE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
ASGNI4
line 1068
;1068:	counts[TEAM_RED] = TeamCount( ignoreClientNum, TEAM_RED );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
ASGNI4
line 1070
;1069:
;1070:	if ( counts[TEAM_BLUE] > counts[TEAM_RED] ) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $491
line 1071
;1071:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $488
JUMPV
LABELV $491
line 1073
;1072:	}
;1073:	if ( counts[TEAM_RED] > counts[TEAM_BLUE] ) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $495
line 1074
;1074:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $488
JUMPV
LABELV $495
line 1077
;1075:	}
;1076:	// equal team count, so join the team with the lowest score
;1077:	if ( level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED] ) {
ADDRGP4 level+52+8
INDIRI4
ADDRGP4 level+52+4
INDIRI4
LEI4 $499
line 1078
;1078:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $488
JUMPV
LABELV $499
line 1080
;1079:	}
;1080:	return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $488
endproc PickTeam 24 8
proc ClientCleanName 40 12
line 1108
;1081:}
;1082:
;1083:/*
;1084:===========
;1085:ForceClientSkin
;1086:
;1087:Forces a client's skin (for teamplay)
;1088:===========
;1089:*/
;1090:/*
;1091:static void ForceClientSkin( gclient_t *client, char *model, const char *skin ) {
;1092:	char *p;
;1093:
;1094:	if ((p = Q_strrchr(model, '/')) != 0) {
;1095:		*p = 0;
;1096:	}
;1097:
;1098:	Q_strcat(model, MAX_QPATH, "/");
;1099:	Q_strcat(model, MAX_QPATH, skin);
;1100:}
;1101:*/
;1102:
;1103:/*
;1104:===========
;1105:ClientCheckName
;1106:============
;1107:*/
;1108:static void ClientCleanName( const char *in, char *out, int outSize ) {
line 1115
;1109:	int		len, colorlessLen;
;1110:	char	ch;
;1111:	char	*p;
;1112:	int		spaces;
;1113:
;1114:	//save room for trailing null byte
;1115:	outSize--;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1117
;1116:
;1117:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1118
;1118:	colorlessLen = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1119
;1119:	p = out;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
line 1120
;1120:	*p = 0;
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
line 1121
;1121:	spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $507
JUMPV
LABELV $506
line 1123
;1122:
;1123:	while( 1 ) {
line 1124
;1124:		ch = *in++;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
INDIRI1
ASGNI1
line 1125
;1125:		if( !ch ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $509
line 1126
;1126:			break;
ADDRGP4 $508
JUMPV
LABELV $509
line 1130
;1127:		}
;1128:
;1129:		// don't allow leading spaces
;1130:		if( !*p && ch == ' ' ) {
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $511
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $511
line 1131
;1131:			continue;
ADDRGP4 $507
JUMPV
LABELV $511
line 1135
;1132:		}
;1133:
;1134:		// check colors
;1135:		if( ch == Q_COLOR_ESCAPE ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $513
line 1137
;1136:			// solo trailing carat is not a color prefix
;1137:			if( !*in ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $515
line 1138
;1138:				break;
ADDRGP4 $508
JUMPV
LABELV $515
line 1148
;1139:			}
;1140:
;1141:			// don't allow black in a name, period
;1142:			/*if( ColorIndex(*in) == 0 ) {
;1143:				in++;
;1144:				continue;
;1145:			}*/
;1146:
;1147:			// make sure room in dest for both chars
;1148:			if( len > outSize - 2 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 2
SUBI4
LEI4 $517
line 1149
;1149:				break;
ADDRGP4 $508
JUMPV
LABELV $517
line 1152
;1150:			}
;1151:
;1152:			*out++ = ch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 1153
;1153:			*out++ = *in++;
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 28
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI1
ASGNI1
line 1154
;1154:			len += 2;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 1155
;1155:			continue;
ADDRGP4 $507
JUMPV
LABELV $513
line 1159
;1156:		}
;1157:
;1158:		// don't allow too many consecutive spaces
;1159:		if( ch == ' ' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $519
line 1160
;1160:			spaces++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1161
;1161:			if( spaces > 3 ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
LEI4 $520
line 1162
;1162:				continue;
ADDRGP4 $507
JUMPV
line 1164
;1163:			}
;1164:		}
LABELV $519
line 1165
;1165:		else {
line 1166
;1166:			spaces = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1167
;1167:		}
LABELV $520
line 1169
;1168:
;1169:		if( len > outSize - 1 ) {
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
LEI4 $523
line 1170
;1170:			break;
ADDRGP4 $508
JUMPV
LABELV $523
line 1173
;1171:		}
;1172:
;1173:		*out++ = ch;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 4
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 0
INDIRI1
ASGNI1
line 1174
;1174:		colorlessLen++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1175
;1175:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1176
;1176:	}
LABELV $507
line 1123
ADDRGP4 $506
JUMPV
LABELV $508
line 1177
;1177:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1180
;1178:
;1179:	// don't allow empty names
;1180:	if( *p == 0 || colorlessLen == 0 ) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
EQI4 $527
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $525
LABELV $527
line 1181
;1181:		Q_strncpyz( p, "Padawan", outSize );
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $528
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1182
;1182:	}
LABELV $525
line 1183
;1183:}
LABELV $505
endproc ClientCleanName 40 12
data
align 4
LABELV knownClanTags
address $529
skip 4
address $530
skip 4
address $531
skip 4
address $532
skip 4
address $533
skip 4
address $534
skip 4
address $535
skip 4
address $536
skip 4
address $537
skip 4
address $538
skip 4
address $539
skip 4
address $540
skip 4
address $541
skip 4
address $542
skip 4
address $543
skip 4
address $544
skip 4
address $543
skip 4
address $545
skip 4
address $546
skip 4
address $547
skip 4
address $548
skip 4
address $549
skip 4
address $550
skip 4
address $551
skip 4
address $552
skip 4
address $553
skip 4
address $554
skip 4
address $555
skip 4
address $556
skip 4
address $557
skip 4
address $558
skip 4
address $559
skip 4
address $560
skip 4
address $561
skip 4
address $562
skip 4
address $563
skip 4
address $564
skip 4
address $565
skip 4
address $566
skip 4
address $567
skip 4
address $568
skip 4
address $569
skip 4
address $570
skip 4
address $571
skip 4
address $572
skip 4
address $573
skip 4
address $574
skip 4
address $575
skip 4
address $576
skip 4
address $577
skip 4
address $578
skip 4
address $579
skip 4
address $580
skip 4
address $581
skip 4
address $582
skip 4
address $583
skip 4
address $584
skip 4
address $585
skip 4
address $586
skip 4
address $587
skip 4
address $588
skip 4
address $589
skip 4
address $590
skip 4
address $591
skip 4
address $592
skip 4
address $593
skip 4
address $594
skip 4
address $595
skip 4
address $596
skip 4
address $597
skip 4
address $598
skip 4
address $599
skip 4
address $600
skip 4
address $601
skip 4
address $602
skip 4
address $603
skip 4
address $604
skip 4
address $605
skip 4
address $606
skip 4
address $607
skip 4
address $608
skip 4
address $609
skip 4
address $610
skip 4
address $611
skip 4
address $612
skip 4
address $613
skip 4
address $614
skip 4
address $615
skip 4
address $616
skip 4
address $617
skip 4
address $618
skip 4
address $619
skip 4
lit
align 4
LABELV clanTagCount
byte 4 92
data
export clanTagHashTable
align 4
LABELV clanTagHashTable
byte 4 0
skip 1020
align 4
LABELV $621
byte 4 0
export InitClanTagHashTable
code
proc InitClanTagHashTable 12 8
line 1203
;1184:
;1185:
;1186:#define CLANTAG_HASHSIZE 256
;1187:static hashEntry_t knownClanTags[] = {
;1188:	{"freedom"},{"cos"},{"pi"},{"oc9"},{"eos"},{"fos"},{"bbb"},{"dbd"},{"174"},{"pureness"},{"believers"},
;1189:	{"fou"},{"jof"},{"jofa"},{"gog"},{"jip"},{"gog"},{"rrr"},{"ft"},{"bdsm"},{"motf"},{"circus"},
;1190:	{"suffix"},{"defiance"},{"el"},{"d2w"},{"coz"},{"fod"},{"ah"},{"jotr"},{"ros"},
;1191:	{"ats"},{"lm"},{"sol"},{"wCw"},{"SL"},{"TFJ"},{"ColdThugz"},{"EC"},{"rj"},
;1192:	{"KR"},{"93o"},{"930"},{"dA"},{"nWo"},{"ez"},{"GotA"},{"CjS"},{"BOMS"},{"ca"},
;1193:	{"eot"},{"bulldozer"},{"WAR"},{"ToD"},{"TB"},{"SPQR"},{"SC"},{"R"},{"NA"},
;1194:	{"DARK"},{"NATO"},{"LoD"},{"g"},{"EU"},{"MAD"},{"E621"},{"AFK"},{"Hecc"},{"hvn"},
;1195:	{"LSS"},{"vvv"},{"il"},{"so"},{"sf"},{"rodia"},{"tnf"},{"tft"},{"gg"},{"Templar"},{"PlayboyZ"},{"PARADiGM"},
;1196:	{"LoC"},{"Lions"},{"lil"},{"LGBTQ"},{"i"},{"dts"},{"dOR"},{"TOR"},{"e"},{"JAWA"},{"Ub"},
;1197:};
;1198:
;1199:static const int clanTagCount = sizeof(knownClanTags) / sizeof(knownClanTags[0]);
;1200:
;1201:hashEntry_t* clanTagHashTable[CLANTAG_HASHSIZE] = { 0 };
;1202:
;1203:void InitClanTagHashTable() {
line 1207
;1204:	int i;
;1205:	int hash;
;1206:	static qboolean inited = qfalse;
;1207:	if (!inited) {
ADDRGP4 $621
INDIRI4
CNSTI4 0
NEI4 $622
line 1208
;1208:		for (i = 0; i < clanTagCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $627
JUMPV
LABELV $624
line 1209
;1209:			hash = generateHashValue(knownClanTags[i].text, CLANTAG_HASHSIZE);
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 knownClanTags
ADDP4
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 8
ADDRGP4 generateHashValue
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 1210
;1210:			knownClanTags[i].next = clanTagHashTable[hash];
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 knownClanTags+4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 clanTagHashTable
ADDP4
INDIRP4
ASGNP4
line 1211
;1211:			clanTagHashTable[hash] = &knownClanTags[i];
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 clanTagHashTable
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 knownClanTags
ADDP4
ASGNP4
line 1212
;1212:		}
LABELV $625
line 1208
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $627
ADDRLP4 0
INDIRI4
ADDRGP4 clanTagCount
INDIRI4
LTI4 $624
line 1213
;1213:		inited = qtrue;
ADDRGP4 $621
CNSTI4 1
ASGNI4
line 1214
;1214:	}
LABELV $622
line 1215
;1215:}
LABELV $620
endproc InitClanTagHashTable 12 8
proc CheckIsClanTag 20 8
line 1217
;1216:
;1217:static qboolean CheckIsClanTag(const char* text) {
line 1221
;1218:	int i;
;1219:	int hash;
;1220:	hashEntry_t* hashEntry;
;1221:	InitClanTagHashTable();
ADDRGP4 InitClanTagHashTable
CALLV
pop
line 1222
;1222:	hash = generateHashValue(text, CLANTAG_HASHSIZE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 12
ADDRGP4 generateHashValue
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 1223
;1223:	for (hashEntry = clanTagHashTable[hash]; hashEntry; hashEntry = hashEntry->next) {
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 clanTagHashTable
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $633
JUMPV
LABELV $630
line 1224
;1224:		if (!Q_stricmp(text,hashEntry->text)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $634
line 1225
;1225:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $629
JUMPV
LABELV $634
line 1227
;1226:		}
;1227:	}
LABELV $631
line 1223
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ASGNP4
LABELV $633
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $630
line 1228
;1228:	return qfalse;
CNSTI4 0
RETI4
LABELV $629
endproc CheckIsClanTag 20 8
export ApplyNameTag
proc ApplyNameTag 144 16
line 1231
;1229:}
;1230:
;1231:void ApplyNameTag(char* name, int bufferSize, nameTagType_t type) {
line 1233
;1232:	char	tmp[MAX_NETNAME];
;1233:	char*	s = tmp;
ADDRLP4 0
ADDRLP4 12
ASGNP4
line 1234
;1234:	int		inlen=0;// = strlen(name);
ADDRLP4 76
CNSTI4 0
ASGNI4
line 1236
;1235:	int		i,j;
;1236:	char*	shortest = NULL;
ADDRLP4 108
CNSTP4 0
ASGNP4
line 1237
;1237:	int		shortestLen = INT_MAX;
ADDRLP4 100
CNSTI4 2147483647
ASGNI4
line 1238
;1238:	char*	clanTag = NULL;
ADDRLP4 96
CNSTP4 0
ASGNP4
line 1243
;1239:	qboolean	shortestIsMaybeClanTag;
;1240:	qboolean	clanTagFound;
;1241:	char*	tmp2;
;1242:	int		tmpLen;
;1243:	char	lastLetter = '\0';
ADDRLP4 80
CNSTI1 0
ASGNI1
line 1244
;1244:	int		pieceIndex = 0;
ADDRLP4 112
CNSTI4 0
ASGNI4
line 1245
;1245:	char	*s2 = name;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $638
JUMPV
LABELV $637
line 1248
;1246:	
;1247:	//Q_strncpyz(tmp, name, sizeof(tmp)); 
;1248:	while (*s2 && inlen<(sizeof(tmp)-1)) {
line 1249
;1249:		if (*s2 == Q_COLOR_ESCAPE && *(s2+1)) { // strip colors so we don't pull apart names
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $640
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $640
line 1250
;1250:			s2++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1251
;1251:		}
ADDRGP4 $641
JUMPV
LABELV $640
line 1252
;1252:		else {
line 1253
;1253:			*s = *s2;
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI1
ASGNI1
line 1254
;1254:			inlen++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1255
;1255:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1256
;1256:		}
LABELV $641
line 1257
;1257:		s2++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1258
;1258:	}
LABELV $638
line 1248
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $642
ADDRLP4 76
INDIRI4
CVIU4 4
CNSTU4 63
LTU4 $637
LABELV $642
line 1261
;1259:
;1260:
;1261:	*s = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1262
;1262:	s = tmp;
ADDRLP4 0
ADDRLP4 12
ASGNP4
ADDRGP4 $644
JUMPV
LABELV $643
line 1265
;1263:
;1264:	// NULL out any non-letter or digit char
;1265:	while (*s) {
line 1266
;1266:		if (*s == Q_COLOR_ESCAPE) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $646
line 1267
;1267:			*(s++) = '\0';
ADDRLP4 120
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 120
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI1 0
ASGNI1
line 1268
;1268:			if (*s == '\0') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $648
line 1269
;1269:				s--; // don't accidentally overflow if this is already the end of the string
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 1270
;1270:			}
ADDRGP4 $647
JUMPV
LABELV $648
line 1271
;1271:			else {
line 1272
;1272:				*s = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1273
;1273:			}
line 1274
;1274:		}
ADDRGP4 $647
JUMPV
LABELV $646
line 1275
;1275:		else if (!(*s >= 'a' && *s <= 'z' || *s >= 'A' && *s <= 'Z' || *s >= '0' && *s <= '9')) {
ADDRLP4 120
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 97
LTI4 $652
ADDRLP4 120
INDIRI4
CNSTI4 122
LEI4 $650
LABELV $652
ADDRLP4 124
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 65
LTI4 $653
ADDRLP4 124
INDIRI4
CNSTI4 90
LEI4 $650
LABELV $653
ADDRLP4 128
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 48
LTI4 $654
ADDRLP4 128
INDIRI4
CNSTI4 57
LEI4 $650
LABELV $654
line 1276
;1276:			*s = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1277
;1277:		}
ADDRGP4 $651
JUMPV
LABELV $650
line 1278
;1278:		else if (*s >= 'A' && *s <= 'Z') {
ADDRLP4 132
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 65
LTI4 $655
ADDRLP4 132
INDIRI4
CNSTI4 90
GTI4 $655
line 1279
;1279:			*s = tolower(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 140
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 140
INDIRI4
CVII1 4
ASGNI1
line 1280
;1280:		}
LABELV $655
LABELV $651
LABELV $647
line 1281
;1281:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1282
;1282:	}
LABELV $644
line 1265
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $643
line 1284
;1283:	// find shortest bit
;1284:	for (i = 0; i < inlen; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $660
JUMPV
LABELV $657
line 1285
;1285:		if (!lastLetter && tmp[i]) {
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRI1
CVII4 1
ADDRLP4 120
INDIRI4
NEI4 $661
ADDRLP4 4
INDIRI4
ADDRLP4 12
ADDP4
INDIRI1
CVII4 1
ADDRLP4 120
INDIRI4
EQI4 $661
line 1286
;1286:			tmp2 = &tmp[i];
ADDRLP4 84
ADDRLP4 4
INDIRI4
ADDRLP4 12
ADDP4
ASGNP4
line 1287
;1287:			tmpLen = strlen(tmp2);
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 88
ADDRLP4 124
INDIRU4
CVUI4 4
ASGNI4
line 1288
;1288:			clanTagFound = CheckIsClanTag(tmp2);
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 CheckIsClanTag
CALLI4
ASGNI4
ADDRLP4 92
ADDRLP4 128
INDIRI4
ASGNI4
line 1289
;1289:			if (clanTagFound && !clanTag) {
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $663
ADDRLP4 96
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $663
line 1290
;1290:				clanTag = tmp2;
ADDRLP4 96
ADDRLP4 84
INDIRP4
ASGNP4
line 1291
;1291:			}
ADDRGP4 $664
JUMPV
LABELV $663
line 1292
;1292:			else if ((tmpLen < shortestLen || shortestIsMaybeClanTag) && tmpLen > 1 && !clanTagFound) {
ADDRLP4 88
INDIRI4
ADDRLP4 100
INDIRI4
LTI4 $667
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $665
LABELV $667
ADDRLP4 88
INDIRI4
CNSTI4 1
LEI4 $665
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $665
line 1293
;1293:				shortest = tmp2;
ADDRLP4 108
ADDRLP4 84
INDIRP4
ASGNP4
line 1294
;1294:				shortestLen = tmpLen;
ADDRLP4 100
ADDRLP4 88
INDIRI4
ASGNI4
line 1295
;1295:				shortestIsMaybeClanTag = pieceIndex == 0 && tmpLen >= 2 && tmpLen <= 3;
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $669
ADDRLP4 88
INDIRI4
CNSTI4 2
LTI4 $669
ADDRLP4 88
INDIRI4
CNSTI4 3
GTI4 $669
ADDRLP4 132
CNSTI4 1
ASGNI4
ADDRGP4 $670
JUMPV
LABELV $669
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $670
ADDRLP4 104
ADDRLP4 132
INDIRI4
ASGNI4
line 1296
;1296:				pieceIndex++;
ADDRLP4 112
ADDRLP4 112
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1297
;1297:			}
LABELV $665
LABELV $664
line 1298
;1298:			i += tmpLen;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 88
INDIRI4
ADDI4
ASGNI4
line 1299
;1299:		}
LABELV $661
line 1300
;1300:		lastLetter = tmp[i];
ADDRLP4 80
ADDRLP4 4
INDIRI4
ADDRLP4 12
ADDP4
INDIRI1
ASGNI1
line 1301
;1301:	}
LABELV $658
line 1284
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $660
ADDRLP4 4
INDIRI4
ADDRLP4 76
INDIRI4
LTI4 $657
line 1303
;1302:
;1303:	if (!shortest) {
ADDRLP4 108
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $671
line 1305
;1304:		// can't apply nametag, no suitable bit found.
;1305:		if (!clanTag) {
ADDRLP4 96
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $673
line 1306
;1306:			return;
ADDRGP4 $636
JUMPV
LABELV $673
line 1308
;1307:		}
;1308:		else {
line 1309
;1309:			shortest = clanTag;
ADDRLP4 108
ADDRLP4 96
INDIRP4
ASGNP4
line 1310
;1310:		}
line 1311
;1311:	}
LABELV $671
line 1313
;1312:
;1313:	switch (type) {
ADDRLP4 120
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 1
EQI4 $678
ADDRLP4 120
INDIRI4
CNSTI4 2
EQI4 $680
ADDRGP4 $636
JUMPV
line 1315
;1314:	default:
;1315:		return;
line 1316
;1316:		break;
LABELV $678
line 1318
;1317:	case NAMETAG_FREEDOM:
;1318:		Com_sprintf(name, bufferSize,"^7^7^4freedom^4^4^7#^7^7^4%s^4^4^7'",shortest);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $679
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1319
;1319:		break;
ADDRGP4 $676
JUMPV
LABELV $680
line 1321
;1320:	case NAMETAG_OC9:
;1321:		Com_sprintf(name, bufferSize, "^5oc9^7#^5%s", shortest);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $681
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1322
;1322:		break;
LABELV $676
line 1325
;1323:	}
;1324:
;1325:}
LABELV $636
endproc ApplyNameTag 144 16
data
export g2SaberInstance
align 4
LABELV g2SaberInstance
byte 4 0
lit
align 4
LABELV $683
byte 4 0
byte 4 0
byte 4 0
export SetupGameGhoul2Model
code
proc SetupGameGhoul2Model 204 44
line 1350
;1326:
;1327:#ifdef _DEBUG
;1328:void G_DebugWrite(const char *path, const char *text)
;1329:{
;1330:	fileHandle_t f;
;1331:
;1332:	trap_FS_FOpenFile( path, &f, FS_APPEND );
;1333:	trap_FS_Write(text, strlen(text), f);
;1334:	trap_FS_FCloseFile(f);
;1335:}
;1336:#endif
;1337:
;1338:/*
;1339:===========
;1340:SetupGameGhoul2Model
;1341:
;1342:There are two ghoul2 model instances per player (actually three).  One is on the clientinfo (the base for the client side 
;1343:player, and copied for player spawns and for corpses).  One is attached to the centity itself, which is the model acutally 
;1344:animated and rendered by the system.  The final is the game ghoul2 model.  This is animated by pmove on the server, and
;1345:is used for determining where the lightsaber should be, and for per-poly collision tests.
;1346:===========
;1347:*/
;1348:void *g2SaberInstance = NULL;
;1349:void SetupGameGhoul2Model(gclient_t *client, char *modelname)
;1350:{
line 1355
;1351:	int handle;
;1352:	char		afilename[MAX_QPATH];
;1353:	char		/**GLAName,*/ *slash;
;1354:	char		GLAName[MAX_QPATH];
;1355:	vec3_t	tempVec = {0,0,0};
ADDRLP4 64
ADDRGP4 $683
INDIRB
ASGNB 12
line 1356
;1356:	int	nowTime = LEVELTIME(client);
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $688
ADDRLP4 160
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $688
ADDRFP4 0
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $690
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $691
JUMPV
LABELV $690
ADDRLP4 156
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $691
ADDRLP4 152
ADDRLP4 156
INDIRI4
ASGNI4
ADDRGP4 $689
JUMPV
LABELV $688
ADDRLP4 152
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $689
ADDRLP4 148
ADDRLP4 152
INDIRI4
ASGNI4
line 1359
;1357:
;1358:	// First things first.  If this is a ghoul2 model, then let's make sure we demolish this first.
;1359:	if (client->ghoul2 && trap_G2_HaveWeGhoul2Models(client->ghoul2))
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $692
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 168
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
EQI4 $692
line 1360
;1360:	{
line 1361
;1361:		trap_G2API_CleanGhoul2Models(&(client->ghoul2));
ADDRFP4 0
INDIRP4
CNSTI4 43740
ADDP4
ARGP4
ADDRGP4 trap_G2API_CleanGhoul2Models
INDIRP4
CALLV
pop
line 1362
;1362:	}
LABELV $692
line 1380
;1363:
;1364:	/*
;1365:	Com_sprintf( afilename, sizeof( afilename ), "models/players/%s/model.glm", modelname );
;1366:	handle = trap_G2API_InitGhoul2Model(&client->ghoul2, afilename, 0, 0, -20, 0, 0);
;1367:	if (handle<0)
;1368:	{
;1369:		Com_sprintf( afilename, sizeof( afilename ), "models/players/kyle/model.glm" );
;1370:		handle = trap_G2API_InitGhoul2Model(&client->ghoul2, afilename, 0, 0, -20, 0, 0);
;1371:
;1372:		if (handle<0)
;1373:		{
;1374:			return;
;1375:		}
;1376:	}
;1377:	*/
;1378:
;1379:	//rww - just load the "standard" model for the server"
;1380:	if (!precachedKyle)
ADDRGP4 precachedKyle
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $694
line 1381
;1381:	{
line 1382
;1382:		Com_sprintf( afilename, sizeof( afilename ), "models/players/kyle/model.glm" );
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $696
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1383
;1383:		handle = trap_G2API_InitGhoul2Model(&precachedKyle, afilename, 0, 0, -20, 0, 0);
ADDRGP4 precachedKyle
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 172
CNSTI4 0
ASGNI4
ADDRLP4 172
INDIRI4
ARGI4
ADDRLP4 172
INDIRI4
ARGI4
CNSTI4 -20
ARGI4
ADDRLP4 172
INDIRI4
ARGI4
ADDRLP4 172
INDIRI4
ARGI4
ADDRLP4 176
ADDRGP4 trap_G2API_InitGhoul2Model
INDIRP4
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 176
INDIRI4
ASGNI4
line 1385
;1384:
;1385:		if (handle<0)
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $697
line 1386
;1386:		{
line 1387
;1387:			return;
ADDRGP4 $682
JUMPV
LABELV $697
line 1389
;1388:		}
;1389:	}
LABELV $694
line 1391
;1390:
;1391:	if (precachedKyle && trap_G2_HaveWeGhoul2Models(precachedKyle))
ADDRLP4 172
ADDRGP4 precachedKyle
INDIRP4
ASGNP4
ADDRLP4 172
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $682
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 trap_G2_HaveWeGhoul2Models
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
EQI4 $682
line 1392
;1392:	{
line 1393
;1393:		trap_G2API_DuplicateGhoul2Instance(precachedKyle, &client->ghoul2);
ADDRGP4 precachedKyle
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 43740
ADDP4
ARGP4
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
INDIRP4
CALLV
pop
line 1394
;1394:	}
line 1396
;1395:	else
;1396:	{
line 1397
;1397:		return;
LABELV $700
line 1402
;1398:	}
;1399:
;1400:	// The model is now loaded.
;1401:
;1402:	GLAName[0] = 0;
ADDRLP4 76
CNSTI1 0
ASGNI1
line 1404
;1403:
;1404:	if (!BGPAFtextLoaded)
ADDRGP4 BGPAFtextLoaded
INDIRI4
CNSTI4 0
NEI4 $701
line 1405
;1405:	{
line 1408
;1406:		//get the location of the animation.cfg
;1407:		//GLAName = trap_G2API_GetGLAName( client->ghoul2, 0);
;1408:		trap_G2API_GetGLAName( client->ghoul2, 0, GLAName);
ADDRFP4 0
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 76
ARGP4
ADDRGP4 trap_G2API_GetGLAName
INDIRP4
CALLV
pop
line 1410
;1409:
;1410:		if (!GLAName[0])
ADDRLP4 76
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $703
line 1411
;1411:		{
line 1412
;1412:			if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg"))
ADDRGP4 $707
ARGP4
ADDRLP4 180
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $682
line 1413
;1413:			{
line 1414
;1414:				Com_Printf( "Failed to load animation file %s\n", afilename );
ADDRGP4 $708
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1415
;1415:				return;
ADDRGP4 $682
JUMPV
line 1417
;1416:			}
;1417:			return;
LABELV $703
line 1419
;1418:		}
;1419:		Q_strncpyz( afilename, GLAName, sizeof( afilename ));
ADDRLP4 0
ARGP4
ADDRLP4 76
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1420
;1420:		slash = Q_strrchr( afilename, '/' );
ADDRLP4 0
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 180
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 180
INDIRP4
ASGNP4
line 1421
;1421:		if ( slash )
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $682
line 1422
;1422:		{
line 1423
;1423:			Q_strncpyz(slash, "/animation.cfg",sizeof(afilename) - (slash-afilename));
ADDRLP4 184
ADDRLP4 140
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
ARGP4
ADDRGP4 $711
ARGP4
CNSTU4 64
ADDRLP4 184
INDIRP4
CVPU4 4
ADDRLP4 0
CVPU4 4
SUBU4
CVUI4 4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1424
;1424:		}	// Now afilename holds just the path to the animation.cfg
line 1426
;1425:		else 
;1426:		{	// Didn't find any slashes, this is a raw filename right in base (whish isn't a good thing)
line 1427
;1427:			return;
LABELV $710
line 1431
;1428:		}
;1429:
;1430:		// Try to load the animation.cfg for this model then.
;1431:		if ( !BG_ParseAnimationFile( afilename ) )
ADDRLP4 0
ARGP4
ADDRLP4 184
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
NEI4 $712
line 1432
;1432:		{	// The GLA's animations failed
line 1433
;1433:			if (!BG_ParseAnimationFile("models/players/_humanoid/animation.cfg"))
ADDRGP4 $707
ARGP4
ADDRLP4 188
ADDRGP4 BG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
NEI4 $714
line 1434
;1434:			{
line 1435
;1435:				Com_Printf( "Failed to load animation file %s\n", afilename );
ADDRGP4 $708
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1436
;1436:				return;
ADDRGP4 $682
JUMPV
LABELV $714
line 1438
;1437:			}
;1438:		}
LABELV $712
line 1439
;1439:	}
LABELV $701
line 1441
;1440:
;1441:	trap_G2API_AddBolt(client->ghoul2, 0, "*r_hand");
ADDRFP4 0
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $716
ARGP4
ADDRGP4 trap_G2API_AddBolt
INDIRP4
CALLI4
pop
line 1442
;1442:	trap_G2API_AddBolt(client->ghoul2, 0, "*l_hand");
ADDRFP4 0
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $717
ARGP4
ADDRGP4 trap_G2API_AddBolt
INDIRP4
CALLI4
pop
line 1445
;1443:
;1444:	// NOTE - ensure this sequence of bolt and bone accessing are always the same because the client expects them in a certain order
;1445:	trap_G2API_SetBoneAnim(client->ghoul2, 0, "model_root", 0, 12, BONE_ANIM_OVERRIDE_LOOP, 1.0f, level.time, -1, -1);
ADDRFP4 0
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
ADDRLP4 180
CNSTI4 0
ASGNI4
ADDRLP4 180
INDIRI4
ARGI4
ADDRGP4 $718
ARGP4
ADDRLP4 180
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTI4 16
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 -1
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
INDIRP4
CALLI4
pop
line 1446
;1446:	trap_G2API_SetBoneAngles(client->ghoul2, 0, "upper_lumbar", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time);
ADDRFP4 0
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
ADDRLP4 184
CNSTI4 0
ASGNI4
ADDRLP4 184
INDIRI4
ARGI4
ADDRGP4 $720
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 184
INDIRI4
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
INDIRP4
CALLI4
pop
line 1447
;1447:	trap_G2API_SetBoneAngles(client->ghoul2, 0, "cranium", tempVec, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, NULL, 0, level.time); // not using nowTime here because using it on G2 made the server have extreme hitches and idk the cause
ADDRFP4 0
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
ADDRLP4 188
CNSTI4 0
ASGNI4
ADDRLP4 188
INDIRI4
ARGI4
ADDRGP4 $722
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 192
CNSTI4 2
ASGNI4
ADDRLP4 192
INDIRI4
ARGI4
ADDRLP4 192
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 188
INDIRI4
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
INDIRP4
CALLI4
pop
line 1449
;1448:
;1449:	if (!g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $724
line 1450
;1450:	{
line 1451
;1451:		trap_G2API_InitGhoul2Model(&g2SaberInstance, "models/weapons2/saber/saber_w.glm", 0, 0, -20, 0, 0);
ADDRGP4 g2SaberInstance
ARGP4
ADDRGP4 $165
ARGP4
ADDRLP4 196
CNSTI4 0
ASGNI4
ADDRLP4 196
INDIRI4
ARGI4
ADDRLP4 196
INDIRI4
ARGI4
CNSTI4 -20
ARGI4
ADDRLP4 196
INDIRI4
ARGI4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
INDIRP4
CALLI4
pop
line 1453
;1452:
;1453:		if (g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $726
line 1454
;1454:		{
line 1456
;1455:			// indicate we will be bolted to model 0 (ie the player) on bolt 0 (always the right hand) when we get copied
;1456:			trap_G2API_SetBoltInfo(g2SaberInstance, 0, 0);
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRI4
ARGI4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoltInfo
INDIRP4
CALLV
pop
line 1458
;1457:			// now set up the gun bolt on it
;1458:			trap_G2API_AddBolt(g2SaberInstance, 0, "*flash");
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $728
ARGP4
ADDRGP4 trap_G2API_AddBolt
INDIRP4
CALLI4
pop
line 1459
;1459:		}
LABELV $726
line 1460
;1460:	}
LABELV $724
line 1462
;1461:
;1462:	if (g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $729
line 1463
;1463:	{
line 1464
;1464:		trap_G2API_CopySpecificGhoul2Model(g2SaberInstance, 0, client->ghoul2, 1); 
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_G2API_CopySpecificGhoul2Model
INDIRP4
CALLV
pop
line 1465
;1465:	}
LABELV $729
line 1466
;1466:}
LABELV $682
endproc SetupGameGhoul2Model 204 44
proc AcceptClientPhysicsFps 48 8
line 1470
;1467:
;1468:extern void DF_RaceStateInvalidated(gentity_t* ent, qboolean print);
;1469:
;1470:static void AcceptClientPhysicsFps(gentity_t* ent, int clientSetting) {
line 1471
;1471:	gclient_t* client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1472
;1472:	client->pers.physicsFps.lastChange = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 42520
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1473
;1473:	client->pers.physicsFps.acceptedSetting = clientSetting;
ADDRLP4 0
INDIRP4
CNSTI4 42512
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1474
;1474:	client->pers.physicsFps.acceptedSettingMsec = (MAX(1, MIN(1000, 1000 / MAX(1, clientSetting))));
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRLP4 32
INDIRI4
ADDRFP4 4
INDIRI4
LEI4 $744
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $745
JUMPV
LABELV $744
ADDRLP4 12
ADDRFP4 4
INDIRI4
ASGNI4
LABELV $745
ADDRLP4 36
CNSTI4 1000
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 36
INDIRI4
ADDRLP4 12
INDIRI4
DIVI4
GEI4 $742
ADDRLP4 8
CNSTI4 1000
ASGNI4
ADDRGP4 $743
JUMPV
LABELV $742
CNSTI4 1
ADDRFP4 4
INDIRI4
LEI4 $746
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $747
JUMPV
LABELV $746
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
LABELV $747
ADDRLP4 8
CNSTI4 1000
ADDRLP4 16
INDIRI4
DIVI4
ASGNI4
LABELV $743
ADDRLP4 32
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $740
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $741
JUMPV
LABELV $740
CNSTI4 1
ADDRFP4 4
INDIRI4
LEI4 $750
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $751
JUMPV
LABELV $750
ADDRLP4 24
ADDRFP4 4
INDIRI4
ASGNI4
LABELV $751
ADDRLP4 40
CNSTI4 1000
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 40
INDIRI4
ADDRLP4 24
INDIRI4
DIVI4
GEI4 $748
ADDRLP4 20
CNSTI4 1000
ASGNI4
ADDRGP4 $749
JUMPV
LABELV $748
CNSTI4 1
ADDRFP4 4
INDIRI4
LEI4 $752
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $753
JUMPV
LABELV $752
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
LABELV $753
ADDRLP4 20
CNSTI4 1000
ADDRLP4 28
INDIRI4
DIVI4
ASGNI4
LABELV $749
ADDRLP4 4
ADDRLP4 20
INDIRI4
ASGNI4
LABELV $741
ADDRLP4 0
INDIRP4
CNSTI4 42516
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1475
;1475:	if (client->sess.raceStyle.msec >= 0) { // -1 = toggle, -2 = float
ADDRLP4 0
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
CNSTI4 0
LTI4 $754
line 1476
;1476:		client->sess.raceStyle.msec = client->pers.physicsFps.acceptedSettingMsec;
ADDRLP4 0
INDIRP4
CNSTI4 43494
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 42516
ADDP4
INDIRI4
CVII2 4
ASGNI2
line 1477
;1477:		DF_RaceStateInvalidated(ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 DF_RaceStateInvalidated
CALLV
pop
line 1478
;1478:	}
LABELV $754
line 1479
;1479:}
LABELV $731
endproc AcceptClientPhysicsFps 48 8
proc ValidateClientPhysicsFps 8 0
line 1481
;1480:
;1481:static qboolean ValidateClientPhysicsFps(gclient_t* client, int clientSetting) {
line 1486
;1482:	// Do validation of the client com_physicsFps setting here.
;1483:	// For example check if the value he set is sensible and allowed by the game settings.
;1484:	// Return qfalse if invalid.
;1485:
;1486:	if (client->sess.raceMode) {
ADDRFP4 0
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $757
line 1488
;1487:		// TODO What if someone uses this to get a setting "validated" but then switches out of racemode? catch that more elegantly?
;1488:		return clientSetting > 0 && clientSetting <=1000; // racemode allows all (just doesnt allow toggle outside toggle mode)
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $760
ADDRLP4 4
INDIRI4
CNSTI4 1000
GTI4 $760
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $761
JUMPV
LABELV $760
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $761
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $756
JUMPV
LABELV $757
line 1491
;1489:	}
;1490:
;1491:	if (g_fixHighFPSAbuse.integer && (clientSetting >= 250 || clientSetting < 40)) {
ADDRGP4 g_fixHighFPSAbuse+12
INDIRI4
CNSTI4 0
EQI4 $762
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 250
GEI4 $765
ADDRLP4 0
INDIRI4
CNSTI4 40
GEI4 $762
LABELV $765
line 1492
;1492:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $756
JUMPV
LABELV $762
line 1495
;1493:	}
;1494:
;1495:	return qtrue;
CNSTI4 1
RETI4
LABELV $756
endproc ValidateClientPhysicsFps 8 0
export SetClientPhysicsFps
proc SetClientPhysicsFps 28 8
line 1508
;1496:}
;1497:
;1498:/*
;1499:===========
;1500:HandleClientPhysicsFps
;1501:
;1502:Handle com_physicsFps setting of clients.
;1503:
;1504:If g_fpsToggleDelay is enabled, we limit fps toggling by clients by only allowing 
;1505:a change in the client's fps setting every X seconds (set by g_fpsToggleDelay)
;1506:============
;1507:*/
;1508:void SetClientPhysicsFps(gentity_t* ent, int clientSetting) {
line 1509
;1509:	gclient_t* client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1511
;1510:	
;1511:	if (!ent->client) return;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $767
ADDRGP4 $766
JUMPV
LABELV $767
line 1512
;1512:	client->pers.physicsFps.clientSetting = clientSetting;
ADDRLP4 0
INDIRP4
CNSTI4 42504
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1513
;1513:	client->pers.physicsFps.clientSettingValid = ValidateClientPhysicsFps(client,clientSetting);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 ValidateClientPhysicsFps
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 42508
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1515
;1514:
;1515:	if (!client->pers.physicsFps.clientSettingValid) {
ADDRLP4 0
INDIRP4
CNSTI4 42508
ADDP4
INDIRI4
CNSTI4 0
NEI4 $769
line 1517
;1516:		// Tried to set an invalid setting
;1517:		return;
ADDRGP4 $766
JUMPV
LABELV $769
line 1520
;1518:	}
;1519:
;1520:	if (client->pers.physicsFps.acceptedSetting == clientSetting && (!client->sess.raceMode || client->sess.raceStyle.msec < 0 || client->sess.raceStyle.msec == client->pers.physicsFps.acceptedSettingMsec)) {
ADDRLP4 0
INDIRP4
CNSTI4 42512
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $771
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $774
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $774
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 42516
ADDP4
INDIRI4
NEI4 $771
LABELV $774
line 1522
;1521:		// Don't care, nothing changed
;1522:		return;
ADDRGP4 $766
JUMPV
LABELV $771
line 1526
;1523:	}
;1524:
;1525:	// quick check for situations that are always ok
;1526:	if (client->sess.raceMode) {
ADDRLP4 0
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $775
line 1527
;1527:		if (client->sess.raceStyle.msec < 0) { // float or toggle mode. doesnt matter then
ADDRLP4 0
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
CNSTI4 0
GEI4 $776
line 1529
;1528:			// Toggle limiting disabled, or no value accepted yet. Just accept.
;1529:			AcceptClientPhysicsFps(ent, clientSetting);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 AcceptClientPhysicsFps
CALLV
pop
line 1530
;1530:			return;
ADDRGP4 $766
JUMPV
line 1532
;1531:		}
;1532:	}
LABELV $775
line 1533
;1533:	else {
line 1534
;1534:		if (!g_fpsToggleDelay.integer || !client->pers.physicsFps.acceptedSetting) {
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 g_fpsToggleDelay+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $782
ADDRLP4 0
INDIRP4
CNSTI4 42512
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $779
LABELV $782
line 1536
;1535:			// Toggle limiting disabled, or no value accepted yet. Just accept.
;1536:			AcceptClientPhysicsFps(ent, clientSetting);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 AcceptClientPhysicsFps
CALLV
pop
line 1537
;1537:			return;
ADDRGP4 $766
JUMPV
LABELV $779
line 1539
;1538:		}
;1539:	}
LABELV $776
line 1541
;1540:
;1541:	if (!clientSetting) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $783
line 1543
;1542:		// Client has it disabled. Don't do anything.
;1543:		return;
ADDRGP4 $766
JUMPV
LABELV $783
line 1547
;1544:	}
;1545:
;1546:	// mode specific checks.
;1547:	if (client->sess.raceMode) {
ADDRLP4 0
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $785
line 1548
;1548:		if (!client->pers.raceStartCommandTime) {
ADDRLP4 0
INDIRP4
CNSTI4 22064
ADDP4
INDIRI4
CNSTI4 0
NEI4 $786
line 1551
;1549:			// Change allowed.
;1550:			// Client is not currently in a run.
;1551:			AcceptClientPhysicsFps(ent, clientSetting);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 AcceptClientPhysicsFps
CALLV
pop
line 1552
;1552:		}
line 1553
;1553:	}
ADDRGP4 $786
JUMPV
LABELV $785
line 1554
;1554:	else {
line 1555
;1555:		if ((client->pers.physicsFps.lastChange + g_fpsToggleDelay.integer * 1000) < level.time || client->pers.physicsFps.lastChange > level.time) {
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 42520
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1000
ADDRGP4 g_fpsToggleDelay+12
INDIRI4
MULI4
ADDI4
ADDRGP4 level+36
INDIRI4
LTI4 $794
ADDRLP4 24
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $789
LABELV $794
line 1558
;1556:			// Change allowed.
;1557:			// Either the minimum time delay has passed or level.time has been reset
;1558:			AcceptClientPhysicsFps(ent, clientSetting);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 AcceptClientPhysicsFps
CALLV
pop
line 1559
;1559:		}
LABELV $789
line 1560
;1560:	}
LABELV $786
line 1561
;1561:}
LABELV $766
endproc SetClientPhysicsFps 28 8
export NameDedupe_SanitizeString
proc NameDedupe_SanitizeString 16 4
line 1565
;1562:
;1563:
;1564:
;1565:void NameDedupe_SanitizeString(char* in, char* out) {
ADDRGP4 $797
JUMPV
LABELV $796
line 1566
;1566:	while (*in) {
line 1567
;1567:		if (*in == 94) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $799
line 1568
;1568:			in += 2;		// skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 1569
;1569:			continue;
ADDRGP4 $797
JUMPV
LABELV $799
line 1571
;1570:		}
;1571:		if (*in < 32) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $801
line 1572
;1572:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1573
;1573:			continue;
ADDRGP4 $797
JUMPV
LABELV $801
line 1575
;1574:		}
;1575:		*out++ = tolower(*in++);
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
CVII1 4
ASGNI1
line 1576
;1576:	}
LABELV $797
line 1566
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $796
line 1578
;1577:
;1578:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1579
;1579:}
LABELV $795
endproc NameDedupe_SanitizeString 16 4
export G_SetModelColor
proc G_SetModelColor 56 12
line 1582
;1580:
;1581:void G_SetModelColor(char color[9], const char *userinfo)
;1582:{
line 1586
;1583:	byte serverColor[4];
;1584:	char clientColor[4][4];
;1585:
;1586:	Q_strncpyz(clientColor[0], Info_ValueForKey(userinfo, "char_color_red"), sizeof(clientColor[0]));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $804
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1587
;1587:	Q_strncpyz(clientColor[1], Info_ValueForKey(userinfo, "char_color_green"), sizeof(clientColor[1]));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $806
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0+4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1588
;1588:	Q_strncpyz(clientColor[2], Info_ValueForKey(userinfo, "char_color_blue"), sizeof(clientColor[2]));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $809
ARGP4
ADDRLP4 28
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0+8
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1589
;1589:	Q_strncpyz(clientColor[3], Info_ValueForKey(userinfo, "char_color_alpha"), sizeof(clientColor[3]));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $812
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0+12
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1591
;1590:
;1591:	if (clientColor[0][0] == '\0' || clientColor[1][0] == '\0' || clientColor[2][0] == '\0' || clientColor[3][0] == '\0')
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
EQI4 $821
ADDRLP4 0+4
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
EQI4 $821
ADDRLP4 0+8
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
EQI4 $821
ADDRLP4 0+12
INDIRI1
CVII4 1
ADDRLP4 36
INDIRI4
NEI4 $814
LABELV $821
line 1592
;1592:	{
line 1593
;1593:		serverColor[0] = 255;
ADDRLP4 16
CNSTU1 255
ASGNU1
line 1594
;1594:		serverColor[1] = 255;
ADDRLP4 16+1
CNSTU1 255
ASGNU1
line 1595
;1595:		serverColor[2] = 255;
ADDRLP4 16+2
CNSTU1 255
ASGNU1
line 1596
;1596:		serverColor[3] = 255;
ADDRLP4 16+3
CNSTU1 255
ASGNU1
line 1597
;1597:	}
ADDRGP4 $815
JUMPV
LABELV $814
line 1599
;1598:	else
;1599:	{
line 1600
;1600:		serverColor[0] = atoi(clientColor[0]);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 40
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 1601
;1601:		serverColor[1] = atoi(clientColor[1]);
ADDRLP4 0+4
ARGP4
ADDRLP4 44
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16+1
ADDRLP4 44
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 1602
;1602:		serverColor[2] = atoi(clientColor[2]);
ADDRLP4 0+8
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16+2
ADDRLP4 48
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 1603
;1603:		serverColor[3] = atoi(clientColor[3]);
ADDRLP4 0+12
ARGP4
ADDRLP4 52
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16+3
ADDRLP4 52
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 1604
;1604:	}
LABELV $815
line 1606
;1605:
;1606:	Q_strncpyz(color, colorToHex(serverColor), 9);
ADDRLP4 16
ARGP4
ADDRLP4 40
ADDRGP4 colorToHex
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1607
;1607:}
LABELV $803
endproc G_SetModelColor 56 12
export G_SetSaberName
proc G_SetSaberName 12 12
line 1610
;1608:
;1609:void G_SetSaberName(char saberName[MAX_QPATH], const char *userinfo)
;1610:{
line 1614
;1611:	const char *serverSaberName;
;1612:	const char *clientSaberName;
;1613:
;1614:	clientSaberName = Info_ValueForKey(userinfo, "saber1");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $832
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1616
;1615:
;1616:	if (clientSaberName[0] == '\0')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $833
line 1617
;1617:	{
line 1618
;1618:		serverSaberName = DEFAULT_SABER1;
ADDRLP4 4
ADDRGP4 $835
ASGNP4
line 1619
;1619:	}
ADDRGP4 $834
JUMPV
LABELV $833
line 1621
;1620:	else
;1621:	{
line 1622
;1622:		serverSaberName = clientSaberName;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 1623
;1623:	}
LABELV $834
line 1625
;1624:
;1625:	Q_strncpyz(saberName, serverSaberName, MAX_QPATH);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1626
;1626:}
LABELV $831
endproc G_SetSaberName 12 12
lit
align 1
LABELV $837
byte 1 32
byte 1 126
byte 1 81
byte 1 113
byte 1 87
byte 1 119
byte 1 69
byte 1 101
byte 1 82
byte 1 114
byte 1 84
byte 1 116
byte 1 89
byte 1 121
byte 1 85
byte 1 117
byte 1 73
byte 1 105
byte 1 79
byte 1 111
byte 1 80
byte 1 112
byte 1 65
byte 1 97
byte 1 83
byte 1 115
byte 1 68
byte 1 100
byte 1 70
byte 1 102
byte 1 71
byte 1 103
byte 1 72
byte 1 104
byte 1 74
byte 1 106
byte 1 75
byte 1 107
byte 1 76
byte 1 108
byte 1 90
byte 1 122
byte 1 88
byte 1 120
byte 1 67
byte 1 99
byte 1 86
byte 1 118
byte 1 66
byte 1 98
byte 1 78
byte 1 110
byte 1 77
byte 1 109
byte 1 49
byte 1 50
byte 1 51
byte 1 52
byte 1 53
byte 1 54
byte 1 55
byte 1 56
byte 1 57
byte 1 48
byte 1 60
byte 1 62
byte 1 63
byte 1 44
byte 1 46
byte 1 47
byte 1 39
byte 1 59
byte 1 58
byte 1 93
byte 1 91
byte 1 123
byte 1 125
byte 1 96
byte 1 45
byte 1 61
byte 1 33
byte 1 64
byte 1 35
byte 1 36
byte 1 94
byte 1 38
byte 1 42
byte 1 40
byte 1 41
byte 1 95
byte 1 43
byte 1 124
byte 1 11
byte 1 127
byte 1 0
export ClientUserinfoChanged
code
proc ClientUserinfoChanged 6600 76
line 1639
;1627:
;1628:/*
;1629:===========
;1630:ClientUserInfoChanged
;1631:
;1632:Called from ClientConnect when the player first connects and
;1633:directly by the server system when the player updates a userinfo variable.
;1634:
;1635:The game can override any of the settings and call trap_SetUserinfo
;1636:if desired.
;1637:============
;1638:*/
;1639:void ClientUserinfoChanged( int clientNum ) {
line 1661
;1640:	gentity_t *ent;
;1641:	int		teamTask, teamLeader, team, health;
;1642:	char	*s;
;1643:	char	model[MAX_QPATH];
;1644:	char	modelColor[9];
;1645:	char	saberName[MAX_QPATH];
;1646:	//char	headModel[MAX_QPATH];
;1647:	char	forcePowers[MAX_QPATH];
;1648:	char	oldname[MAX_STRING_CHARS];
;1649:	gclient_t	*client;
;1650:	char	c1[MAX_INFO_STRING];
;1651:	char	c2[MAX_INFO_STRING];
;1652:	char	redTeam[MAX_INFO_STRING];
;1653:	char	blueTeam[MAX_INFO_STRING];
;1654:	char	userinfo[MAX_INFO_STRING];
;1655:
;1656:	// NameCrashFix (whitelisted characters)
;1657:	static const char	validChars[]  = " ~QqWwEeRrTtYyUuIiOoPpAaSsDdFfGgHhJjKkLlZzXxCcVvBbNnMm1234567890<>?,./';:][{}`-=!@#$^&*()_+|";
;1658:	int					i, j, isValidChar;
;1659:	char				*ptr;
;1660:
;1661:	ent = g_entities + clientNum;
ADDRLP4 1112
CNSTI4 2352
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1662
;1662:	client = ent->client;
ADDRLP4 16
ADDRLP4 1112
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1664
;1663:
;1664:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1667
;1665:
;1666:	// check for malformed or illegal info strings
;1667:	if ( !Info_Validate(userinfo) ) {
ADDRLP4 24
ARGP4
ADDRLP4 6392
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 6392
INDIRI4
CNSTI4 0
NEI4 $838
line 1668
;1668:		Q_strncpyz (userinfo, "\\name\\badinfo",sizeof(userinfo));
ADDRLP4 24
ARGP4
ADDRGP4 $840
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1669
;1669:	}
LABELV $838
line 1672
;1670:
;1671:	// check for local client
;1672:	s = Info_ValueForKey( userinfo, "ip" );
ADDRLP4 24
ARGP4
ADDRGP4 $841
ARGP4
ADDRLP4 6396
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6396
INDIRP4
ASGNP4
line 1673
;1673:	if ( !strcmp( s, "localhost" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $844
ARGP4
ADDRLP4 6400
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6400
INDIRI4
CNSTI4 0
NEI4 $842
line 1674
;1674:		client->pers.localClient = qtrue;
ADDRLP4 16
INDIRP4
CNSTI4 1412
ADDP4
CNSTI4 1
ASGNI4
line 1675
;1675:	}
LABELV $842
line 1678
;1676:
;1677:	// check the item prediction
;1678:	s = Info_ValueForKey( userinfo, "cg_predictItems" );
ADDRLP4 24
ARGP4
ADDRGP4 $845
ARGP4
ADDRLP4 6404
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6404
INDIRP4
ASGNP4
line 1679
;1679:	if ( !atoi( s ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 6408
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6408
INDIRI4
CNSTI4 0
NEI4 $846
line 1680
;1680:		client->pers.predictItemPickup = qfalse;
ADDRLP4 16
INDIRP4
CNSTI4 1420
ADDP4
CNSTI4 0
ASGNI4
line 1681
;1681:	} else {
ADDRGP4 $847
JUMPV
LABELV $846
line 1682
;1682:		client->pers.predictItemPickup = qtrue;
ADDRLP4 16
INDIRP4
CNSTI4 1420
ADDP4
CNSTI4 1
ASGNI4
line 1683
;1683:	}
LABELV $847
line 1686
;1684:
;1685:	// check for com_physicsFps setting
;1686:	s = Info_ValueForKey( userinfo, "com_physicsFps" );
ADDRLP4 24
ARGP4
ADDRGP4 $848
ARGP4
ADDRLP4 6412
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6412
INDIRP4
ASGNP4
line 1687
;1687:	client->pers.physicsFps.clientSendsPhysicsFps = *s != '\0';
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $850
ADDRLP4 6416
CNSTI4 1
ASGNI4
ADDRGP4 $851
JUMPV
LABELV $850
ADDRLP4 6416
CNSTI4 0
ASGNI4
LABELV $851
ADDRLP4 16
INDIRP4
CNSTI4 42528
ADDP4
ADDRLP4 6416
INDIRI4
ASGNI4
line 1688
;1688:	if ( atoi( s ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 6420
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6420
INDIRI4
CNSTI4 0
EQI4 $852
line 1689
;1689:		SetClientPhysicsFps(ent, atoi(s));
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 6424
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRLP4 6424
INDIRI4
ARGI4
ADDRGP4 SetClientPhysicsFps
CALLV
pop
line 1690
;1690:	} else {
ADDRGP4 $853
JUMPV
LABELV $852
line 1691
;1691:		SetClientPhysicsFps(ent, 0);
ADDRLP4 1112
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 SetClientPhysicsFps
CALLV
pop
line 1692
;1692:	}
LABELV $853
line 1695
;1693:
;1694:	// set name
;1695:	Q_strncpyz ( oldname, client->pers.netname, sizeof( oldname ) );
ADDRLP4 3164
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1696
;1696:	s = Info_ValueForKey (userinfo, "name");
ADDRLP4 24
ARGP4
ADDRGP4 $854
ARGP4
ADDRLP4 6424
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6424
INDIRP4
ASGNP4
line 1699
;1697:		
;1698:	// NameCrashFix
;1699:	for ( i = 0; i < (int)strlen(s); i++ )
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $858
JUMPV
LABELV $855
line 1700
;1700:	{
line 1701
;1701:		isValidChar = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1703
;1702:
;1703:		for ( j = 0; validChars[j]; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $862
JUMPV
LABELV $859
line 1704
;1704:		{
line 1705
;1705:			if ( s[i] == validChars[j] ) isValidChar = 1; //The char is on the whitelist - it's a valid Char...
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 0
INDIRI4
ADDRGP4 $837
ADDP4
INDIRI1
CVII4 1
NEI4 $863
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $863
line 1706
;1706:		}
LABELV $860
line 1703
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $862
ADDRLP4 0
INDIRI4
ADDRGP4 $837
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $859
line 1708
;1707:
;1708:		if ( !isValidChar )	s[i] = '.';
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $865
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI1 46
ASGNI1
LABELV $865
line 1709
;1709:	}
LABELV $856
line 1699
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $858
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 6428
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 8
INDIRI4
ADDRLP4 6428
INDIRU4
CVUI4 4
LTI4 $855
line 1712
;1710:	
;1711:	// Don't let players use @@@ in their names (multi-language strings)
;1712:	ptr = strstr( s, "@@@" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $867
ARGP4
ADDRLP4 6432
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 6432
INDIRP4
ASGNP4
ADDRGP4 $869
JUMPV
LABELV $868
line 1714
;1713:	while ( ptr )
;1714:	{
line 1715
;1715:		memset( ptr, '.', 3 );
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 46
ARGI4
CNSTU4 3
ARGU4
ADDRGP4 memset
CALLP4
pop
line 1716
;1716:		ptr = strstr( s, "@@@" );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $867
ARGP4
ADDRLP4 6436
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 6436
INDIRP4
ASGNP4
line 1717
;1717:	}
LABELV $869
line 1713
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $868
line 1719
;1718:	
;1719:	ClientCleanName( s, ent->client->pers.netname, sizeof(ent->client->pers.netname) );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1112
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 ClientCleanName
CALLV
pop
line 1720
;1720:	Info_RemoveKey( userinfo, "name" );
ADDRLP4 24
ARGP4
ADDRGP4 $854
ARGP4
ADDRGP4 Info_RemoveKey
CALLV
pop
line 1721
;1721:	Info_SetValueForKey( userinfo, "name", ent->client->pers.netname );
ADDRLP4 24
ARGP4
ADDRGP4 $854
ARGP4
ADDRLP4 1112
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 1722
;1722:	trap_SetUserinfo( clientNum, userinfo );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 1724
;1723:
;1724:	if (ent->client->sess.nameTag > 0 && ent->client->sess.nameTag < NAMETAG_COUNT) {
ADDRLP4 6436
ADDRLP4 1112
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43584
ADDP4
INDIRI4
ASGNI4
ADDRLP4 6436
INDIRI4
CNSTI4 0
LEI4 $871
ADDRLP4 6436
INDIRI4
CNSTI4 3
GEI4 $871
line 1725
;1725:		ApplyNameTag(ent->client->pers.netname, sizeof(ent->client->pers.netname), ent->client->sess.nameTag);
ADDRLP4 6440
ADDRLP4 1112
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 6440
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 6440
INDIRP4
CNSTI4 43584
ADDP4
INDIRI4
ARGI4
ADDRGP4 ApplyNameTag
CALLV
pop
line 1726
;1726:	}
LABELV $871
line 1728
;1727:
;1728:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 16
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $873
line 1729
;1729:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 16
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 3
NEI4 $875
line 1730
;1730:			Q_strncpyz( client->pers.netname, "scoreboard", sizeof(client->pers.netname) );
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRGP4 $877
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1731
;1731:		}
LABELV $875
line 1732
;1732:	}
LABELV $873
line 1735
;1733:
;1734:	// thanks to anonymous donor
;1735:	if (!g_allowNameDupes.integer)
ADDRGP4 g_allowNameDupes+12
INDIRI4
CNSTI4 0
NEI4 $878
line 1736
;1736:	{
line 1740
;1737:		int i;
;1738:		char		temp[64];
;1739:		char		temp2[64];
;1740:		client->pers.nameNumber = 0;
ADDRLP4 16
INDIRP4
CNSTI4 1620
ADDP4
CNSTI4 0
ASGNI4
line 1742
;1741:
;1742:		for (i = strlen(client->pers.netname) - 1; i >= 0; i--)
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6572
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 6440
ADDRLP4 6572
INDIRU4
CNSTU4 1
SUBU4
CVUI4 4
ASGNI4
ADDRGP4 $884
JUMPV
LABELV $881
line 1743
;1743:		{
line 1744
;1744:			if (client->pers.netname[i] == ' ')
ADDRLP4 6440
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $883
line 1745
;1745:				client->pers.netname[i] = '\0';
ADDRLP4 6440
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 1747
;1746:			else
;1747:				break;
LABELV $886
line 1748
;1748:		}
LABELV $882
line 1742
ADDRLP4 6440
ADDRLP4 6440
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $884
ADDRLP4 6440
INDIRI4
CNSTI4 0
GEI4 $881
LABELV $883
line 1750
;1749:
;1750:		NameDedupe_SanitizeString(client->pers.netname, temp);
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6444
ARGP4
ADDRGP4 NameDedupe_SanitizeString
CALLV
pop
line 1751
;1751:		Q_strncpyz(client->pers.wantedNameColor, client->pers.netname, sizeof(client->pers.wantedNameColor));
ADDRLP4 16
INDIRP4
CNSTI4 1492
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1752
;1752:		Q_strncpyz(client->pers.wantedNameBlank, temp, sizeof(client->pers.wantedNameBlank));
ADDRLP4 16
INDIRP4
CNSTI4 1556
ADDP4
ARGP4
ADDRLP4 6444
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1754
;1753:
;1754:		if (strlen(client->pers.netname) < sizeof(client->pers.netname) - 11)
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6580
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 6580
INDIRU4
CNSTU4 53
GEU4 $887
line 1755
;1755:		{
line 1756
;1756:			for (i = 0; i < level.maxclients; i++)
ADDRLP4 6440
CNSTI4 0
ASGNI4
ADDRGP4 $892
JUMPV
LABELV $889
line 1757
;1757:			{
line 1758
;1758:				if (g_entities[i].client == NULL)
CNSTI4 2352
ADDRLP4 6440
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $894
line 1759
;1759:					continue;
ADDRGP4 $890
JUMPV
LABELV $894
line 1760
;1760:				if (!g_entities[i].inuse) {
CNSTI4 2352
ADDRLP4 6440
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $897
line 1761
;1761:					continue;
ADDRGP4 $890
JUMPV
LABELV $897
line 1763
;1762:				}
;1763:				if (i == clientNum)
ADDRLP4 6440
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $900
line 1764
;1764:					continue;
ADDRGP4 $890
JUMPV
LABELV $900
line 1765
;1765:				if (!Q_stricmp(g_entities[i].client->pers.wantedNameBlank, client->pers.wantedNameBlank))
ADDRLP4 6584
CNSTI4 1556
ASGNI4
CNSTI4 2352
ADDRLP4 6440
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 6584
INDIRI4
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ADDRLP4 6584
INDIRI4
ADDP4
ARGP4
ADDRLP4 6588
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6588
INDIRI4
CNSTI4 0
NEI4 $902
line 1766
;1766:				{
line 1767
;1767:					if (g_entities[i].client->pers.nameNumber == client->pers.nameNumber)
ADDRLP4 6592
CNSTI4 1620
ASGNI4
CNSTI4 2352
ADDRLP4 6440
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 6592
INDIRI4
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
ADDRLP4 6592
INDIRI4
ADDP4
INDIRI4
NEI4 $905
line 1768
;1768:					{
line 1769
;1769:						client->pers.nameNumber = client->pers.nameNumber + 1;
ADDRLP4 6596
ADDRLP4 16
INDIRP4
CNSTI4 1620
ADDP4
ASGNP4
ADDRLP4 6596
INDIRP4
ADDRLP4 6596
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1770
;1770:						i = 0;
ADDRLP4 6440
CNSTI4 0
ASGNI4
line 1771
;1771:					}
LABELV $905
line 1772
;1772:				}
LABELV $902
line 1773
;1773:				NameDedupe_SanitizeString(client->pers.netname, temp);
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6444
ARGP4
ADDRGP4 NameDedupe_SanitizeString
CALLV
pop
line 1774
;1774:				NameDedupe_SanitizeString(g_entities[i].client->pers.netname, temp2);
CNSTI4 2352
ADDRLP4 6440
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6508
ARGP4
ADDRGP4 NameDedupe_SanitizeString
CALLV
pop
line 1775
;1775:				if (!Q_stricmp(temp2, temp))
ADDRLP4 6508
ARGP4
ADDRLP4 6444
ARGP4
ADDRLP4 6592
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6592
INDIRI4
CNSTI4 0
NEI4 $909
line 1776
;1776:				{
line 1777
;1777:					client->pers.nameNumber = client->pers.nameNumber + 1;
ADDRLP4 6596
ADDRLP4 16
INDIRP4
CNSTI4 1620
ADDP4
ASGNP4
ADDRLP4 6596
INDIRP4
ADDRLP4 6596
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1778
;1778:					i = 0;
ADDRLP4 6440
CNSTI4 0
ASGNI4
line 1779
;1779:				}
LABELV $909
line 1780
;1780:				if (client->pers.nameNumber)
ADDRLP4 16
INDIRP4
CNSTI4 1620
ADDP4
INDIRI4
CNSTI4 0
EQI4 $911
line 1781
;1781:				{
line 1782
;1782:					Q_strncpyz(temp, client->pers.wantedNameColor, sizeof(temp));
ADDRLP4 6444
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 1492
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1783
;1783:					Q_strcat(temp, sizeof(temp), va("^7[^2%i^7]", client->pers.nameNumber));
ADDRGP4 $913
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 1620
ADDP4
INDIRI4
ARGI4
ADDRLP4 6596
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 6444
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 6596
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1784
;1784:					Q_strncpyz(client->pers.netname, temp, sizeof(client->pers.netname));
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6444
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1785
;1785:				}
LABELV $911
line 1786
;1786:			}
LABELV $890
line 1756
ADDRLP4 6440
ADDRLP4 6440
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $892
ADDRLP4 6440
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $889
line 1787
;1787:		}
LABELV $887
line 1790
;1788:
;1789:
;1790:	}
LABELV $878
line 1792
;1791:
;1792:	if ( client->pers.connected == CON_CONNECTED ) {
ADDRLP4 16
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $914
line 1793
;1793:		if ( strcmp( oldname, client->pers.netname ) ) {
ADDRLP4 3164
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6440
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 6440
INDIRI4
CNSTI4 0
EQI4 $916
line 1794
;1794:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " %s %s\n\"", oldname, G_GetStripEdString("SVINGAME", "PLRENAME"),
ADDRGP4 $212
ARGP4
ADDRGP4 $919
ARGP4
ADDRLP4 6444
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $918
ARGP4
ADDRLP4 3164
ARGP4
ADDRLP4 6444
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6448
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 6448
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1796
;1795:				client->pers.netname) );
;1796:		}
LABELV $916
line 1797
;1797:	}
LABELV $914
line 1800
;1798:
;1799:	// set max health
;1800:	health = 100; //atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 6244
CNSTI4 100
ASGNI4
line 1801
;1801:	client->pers.maxHealth = health;
ADDRLP4 16
INDIRP4
CNSTI4 1624
ADDP4
ADDRLP4 6244
INDIRI4
ASGNI4
line 1802
;1802:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 6440
ADDRLP4 16
INDIRP4
CNSTI4 1624
ADDP4
INDIRI4
ASGNI4
ADDRLP4 6440
INDIRI4
CNSTI4 1
LTI4 $922
ADDRLP4 6440
INDIRI4
CNSTI4 100
LEI4 $920
LABELV $922
line 1803
;1803:		client->pers.maxHealth = 100;
ADDRLP4 16
INDIRP4
CNSTI4 1624
ADDP4
CNSTI4 100
ASGNI4
line 1804
;1804:	}
LABELV $920
line 1805
;1805:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 16
INDIRP4
CNSTI4 248
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 1624
ADDP4
INDIRI4
ASGNI4
line 1808
;1806:
;1807:	// set model
;1808:	if( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $923
line 1809
;1809:		Q_strncpyz( model, Info_ValueForKey (userinfo, "team_model"), sizeof( model ) );
ADDRLP4 24
ARGP4
ADDRGP4 $926
ARGP4
ADDRLP4 6448
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
ARGP4
ADDRLP4 6448
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1811
;1810:		//Q_strncpyz( headModel, Info_ValueForKey (userinfo, "team_headmodel"), sizeof( headModel ) );
;1811:	} else {
ADDRGP4 $924
JUMPV
LABELV $923
line 1812
;1812:		Q_strncpyz( model, Info_ValueForKey (userinfo, "model"), sizeof( model ) );
ADDRLP4 24
ARGP4
ADDRGP4 $927
ARGP4
ADDRLP4 6448
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
ARGP4
ADDRLP4 6448
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1814
;1813:		//Q_strncpyz( headModel, Info_ValueForKey (userinfo, "headmodel"), sizeof( headModel ) );
;1814:	}
LABELV $924
line 1817
;1815:	
;1816:	// GalakingFix
;1817:	if ( g_mv_fixgalaking.integer && (!Q_stricmp(model, "galak_mech") || !Q_stricmpn(model, "galak_mech/", strlen("galak_mech/"))) )
ADDRGP4 g_mv_fixgalaking+12
INDIRI4
CNSTI4 0
EQI4 $928
ADDRLP4 1048
ARGP4
ADDRGP4 $931
ARGP4
ADDRLP4 6448
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6448
INDIRI4
CNSTI4 0
EQI4 $933
ADDRGP4 $932
ARGP4
ADDRLP4 6452
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 1048
ARGP4
ADDRGP4 $932
ARGP4
ADDRLP4 6452
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 6456
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 6456
INDIRI4
CNSTI4 0
NEI4 $928
LABELV $933
line 1818
;1818:	{
line 1819
;1819:		Q_strncpyz( model, "galak/default", sizeof(model) );
ADDRLP4 1048
ARGP4
ADDRGP4 $934
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1820
;1820:	}
LABELV $928
line 1822
;1821:	
;1822:	if ( g_mv_fixbrokenmodels.integer && (!Q_stricmpn(model, "kyle/fpls", strlen("kyle/fpls")) || !Q_stricmp(model, "morgan") || (!Q_stricmpn(model, "morgan/", strlen("morgan/")) && (Q_stricmp(model, "morgan/default_mp") && Q_stricmp(model, "morgan/red") && Q_stricmp(model, "morgan/blue")))) )
ADDRGP4 g_mv_fixbrokenmodels+12
INDIRI4
CNSTI4 0
EQI4 $935
ADDRGP4 $938
ARGP4
ADDRLP4 6460
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 1048
ARGP4
ADDRGP4 $938
ARGP4
ADDRLP4 6460
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 6464
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 6464
INDIRI4
CNSTI4 0
EQI4 $945
ADDRLP4 1048
ARGP4
ADDRGP4 $939
ARGP4
ADDRLP4 6468
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6468
INDIRI4
CNSTI4 0
EQI4 $945
ADDRGP4 $940
ARGP4
ADDRLP4 6472
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 1048
ARGP4
ADDRGP4 $940
ARGP4
ADDRLP4 6472
INDIRU4
CVUI4 4
ARGI4
ADDRLP4 6476
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 6476
INDIRI4
CNSTI4 0
NEI4 $935
ADDRLP4 1048
ARGP4
ADDRGP4 $941
ARGP4
ADDRLP4 6480
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6480
INDIRI4
CNSTI4 0
EQI4 $935
ADDRLP4 1048
ARGP4
ADDRGP4 $942
ARGP4
ADDRLP4 6484
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6484
INDIRI4
CNSTI4 0
EQI4 $935
ADDRLP4 1048
ARGP4
ADDRGP4 $943
ARGP4
ADDRLP4 6488
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 6488
INDIRI4
CNSTI4 0
EQI4 $935
LABELV $945
line 1823
;1823:	{
line 1824
;1824:		Q_strncpyz( model, "kyle/default", sizeof(model) );
ADDRLP4 1048
ARGP4
ADDRGP4 $946
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1825
;1825:	}
LABELV $935
line 1828
;1826:
;1827:	// model color
;1828:	G_SetModelColor(modelColor, userinfo);
ADDRLP4 6248
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 G_SetModelColor
CALLV
pop
line 1831
;1829:
;1830:	// saber name
;1831:	G_SetSaberName(saberName, userinfo);
ADDRLP4 6257
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 G_SetSaberName
CALLV
pop
line 1833
;1832:
;1833:	Q_strncpyz( forcePowers, Info_ValueForKey (userinfo, "forcepowers"), sizeof( forcePowers ) );
ADDRLP4 24
ARGP4
ADDRGP4 $947
ARGP4
ADDRLP4 6492
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 6321
ARGP4
ADDRLP4 6492
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1835
;1834:
;1835:	team = client->sess.sessionTeam;
ADDRLP4 6388
ADDRLP4 16
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 1862
;1836:
;1837:/*	NOTE: all client side now
;1838:
;1839:	// team
;1840:	switch( team ) {
;1841:	case TEAM_RED:
;1842:		ForceClientSkin(client, model, "red");
;1843://		ForceClientSkin(client, headModel, "red");
;1844:		break;
;1845:	case TEAM_BLUE:
;1846:		ForceClientSkin(client, model, "blue");
;1847://		ForceClientSkin(client, headModel, "blue");
;1848:		break;
;1849:	}
;1850:	// don't ever use a default skin in teamplay, it would just waste memory
;1851:	// however bots will always join a team but they spawn in as spectator
;1852:	if ( g_gametype.integer >= GT_TEAM && team == TEAM_SPECTATOR) {
;1853:		ForceClientSkin(client, model, "red");
;1854://		ForceClientSkin(client, headModel, "red");
;1855:	}
;1856:*/
;1857:
;1858:	// Always enable teamInfo so that health/armor is broadcast via tinfo for all gametypes (FFA, Duel, etc.)
;1859:	// Original code only enabled outside team modes if userinfo teamoverlay cvar allowed it.
;1860:	// By forcing this on, the server will include every non-spectator player in periodic TeamplayInfoMessage
;1861:	// (after corresponding change in g_team.c) allowing client ESP-style displays of health/armor.
;1862:	client->pers.teamInfo = qtrue;
ADDRLP4 16
INDIRP4
CNSTI4 1700
ADDP4
CNSTI4 1
ASGNI4
line 1874
;1863:	/*
;1864:	s = Info_ValueForKey( userinfo, "cg_pmove_fixed" );
;1865:	if ( !*s || atoi( s ) == 0 ) {
;1866:		client->pers.pmoveFixed = qfalse;
;1867:	}
;1868:	else {
;1869:		client->pers.pmoveFixed = qtrue;
;1870:	}
;1871:	*/
;1872:
;1873:	// team task (0 = none, 1 = offence, 2 = defence)
;1874:	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 24
ARGP4
ADDRGP4 $948
ARGP4
ADDRLP4 6496
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 6496
INDIRP4
ARGP4
ADDRLP4 6500
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 6236
ADDRLP4 6500
INDIRI4
ASGNI4
line 1876
;1875:	// team Leader (1 = leader, 0 is normal player)
;1876:	teamLeader = client->sess.teamLeader;
ADDRLP4 6240
ADDRLP4 16
INDIRP4
CNSTI4 43480
ADDP4
INDIRI4
ASGNI4
line 1879
;1877:
;1878:	// colors
;1879:	Q_strncpyz(c1, Info_ValueForKey( userinfo, "color1" ),sizeof(c1));
ADDRLP4 24
ARGP4
ADDRGP4 $949
ARGP4
ADDRLP4 6504
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1116
ARGP4
ADDRLP4 6504
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1880
;1880:	Q_strncpyz(c2, Info_ValueForKey( userinfo, "color2" ),sizeof(c2));
ADDRLP4 24
ARGP4
ADDRGP4 $950
ARGP4
ADDRLP4 6508
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2140
ARGP4
ADDRLP4 6508
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1882
;1881:
;1882:	Q_strncpyz(redTeam, Info_ValueForKey( userinfo, "g_redteam" ),sizeof(redTeam));
ADDRLP4 24
ARGP4
ADDRGP4 $951
ARGP4
ADDRLP4 6512
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4188
ARGP4
ADDRLP4 6512
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1883
;1883:	Q_strncpyz(blueTeam, Info_ValueForKey( userinfo, "g_blueteam" ),sizeof(blueTeam));
ADDRLP4 24
ARGP4
ADDRGP4 $952
ARGP4
ADDRLP4 6516
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 5212
ARGP4
ADDRLP4 6516
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1887
;1884:
;1885:	// send over a subset of the userinfo keys so other clients can
;1886:	// print scoreboards, display models, and play custom sounds
;1887:	if ( ent->r.svFlags & SVF_BOT ) {
ADDRLP4 1112
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $953
line 1888
;1888:		s = va("n\\%s\\t\\%i\\model\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d\\mvgp\\%i\\bot\\1\\mc\\%s\\st\\%s",
ADDRLP4 24
ARGP4
ADDRGP4 $956
ARGP4
ADDRLP4 6520
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $955
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 6388
INDIRI4
ARGI4
ADDRLP4 1048
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 2140
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 1624
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 43456
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 43460
ADDP4
INDIRI4
ARGI4
ADDRLP4 6520
INDIRP4
ARGP4
ADDRLP4 6236
INDIRI4
ARGI4
ADDRLP4 6240
INDIRI4
ARGI4
ADDRGP4 jk2gameplay
INDIRI4
ARGI4
ADDRLP4 6248
ARGP4
ADDRLP4 6257
ARGP4
ADDRLP4 6528
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6528
INDIRP4
ASGNP4
line 1892
;1889:			client->pers.netname, team, model,  c1, c2, 
;1890:			client->pers.maxHealth, client->sess.wins, client->sess.losses,
;1891:			Info_ValueForKey( userinfo, "skill" ), teamTask, teamLeader, jk2gameplay, modelColor, saberName );
;1892:	} else {
ADDRGP4 $954
JUMPV
LABELV $953
line 1893
;1893:		s = va("n\\%s\\un\\%s\\t\\%i\\model\\%s\\g_redteam\\%s\\g_blueteam\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d\\mvgp\\%i\\jkrace\\%i\\mode\\%i\\mc\\%s\\st\\%s",
ADDRGP4 $957
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 43548
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ARGI4
ADDRLP4 1048
ARGP4
ADDRLP4 4188
ARGP4
ADDRLP4 5212
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 2140
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 1624
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 43456
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 43460
ADDP4
INDIRI4
ARGI4
ADDRLP4 6236
INDIRI4
ARGI4
ADDRLP4 6240
INDIRI4
ARGI4
ADDRGP4 jk2gameplay
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 22076
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
ARGI4
ADDRLP4 6248
ARGP4
ADDRLP4 6257
ARGP4
ADDRLP4 6524
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 6524
INDIRP4
ASGNP4
line 1896
;1894:			client->pers.netname, client->sess.login.name, client->sess.sessionTeam, model, redTeam, blueTeam, c1, c2,
;1895:			client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader, jk2gameplay, client->pers.raceBestTime, client->sess.mode, modelColor, saberName);
;1896:	}
LABELV $954
line 1898
;1897:
;1898:	trap_SetConfigstring( CS_PLAYERS+clientNum, s );
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1900
;1899:
;1900:	if (g_logClientInfo.integer)
ADDRGP4 g_logClientInfo+12
INDIRI4
CNSTI4 0
EQI4 $958
line 1901
;1901:	{
line 1902
;1902:		G_LogPrintf( "ClientUserinfoChanged: %i %s\n", clientNum, s );
ADDRGP4 $961
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1903
;1903:	}
LABELV $958
line 1904
;1904:}
LABELV $836
endproc ClientUserinfoChanged 6600 76
export ClientPhysicsFpsChanged
proc ClientPhysicsFpsChanged 1052 12
line 1907
;1905:
;1906:// super simplified versin of clientuserinfochanged, allowing for faster toggle
;1907:qboolean ClientPhysicsFpsChanged( int clientNum ) {
line 1913
;1908:	gentity_t *ent;
;1909:	gclient_t* client;
;1910:	char	*s;
;1911:	char	userinfo[MAX_INFO_STRING];
;1912:
;1913:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 2352
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1914
;1914:	client = ent->client;
ADDRLP4 1032
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1916
;1915:
;1916:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1919
;1917:
;1918:	// check for com_physicsFps setting
;1919:	s = Info_ValueForKey( userinfo, "com_physicsFps" );
ADDRLP4 8
ARGP4
ADDRGP4 $848
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
line 1920
;1920:	client->pers.physicsFps.clientSendsPhysicsFps = *s != '\0';
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $964
ADDRLP4 1040
CNSTI4 1
ASGNI4
ADDRGP4 $965
JUMPV
LABELV $964
ADDRLP4 1040
CNSTI4 0
ASGNI4
LABELV $965
ADDRLP4 1032
INDIRP4
CNSTI4 42528
ADDP4
ADDRLP4 1040
INDIRI4
ASGNI4
line 1921
;1921:	if ( atoi( s ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $966
line 1922
;1922:		SetClientPhysicsFps(ent, atoi(s));
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRGP4 SetClientPhysicsFps
CALLV
pop
line 1923
;1923:	} else {
ADDRGP4 $967
JUMPV
LABELV $966
line 1924
;1924:		SetClientPhysicsFps(ent, 0);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 SetClientPhysicsFps
CALLV
pop
line 1925
;1925:	}
LABELV $967
line 1927
;1926:	
;1927:	return qtrue;
CNSTI4 1
RETI4
LABELV $962
endproc ClientPhysicsFpsChanged 1052 12
export MV_SetClientIP
proc MV_SetClientIP 36 12
line 1952
;1928:}
;1929:
;1930:
;1931:/*
;1932:===========
;1933:ClientConnect
;1934:
;1935:Called when a player begins connecting to the server.
;1936:Called again for every map change or tournement restart.
;1937:
;1938:The session information will be valid after exit.
;1939:
;1940:Return NULL if the client should be allowed, otherwise return
;1941:a string with the reason for denial.
;1942:
;1943:Otherwise, the client will be sent the current gamestate
;1944:and will eventually get to ClientBegin.
;1945:
;1946:firstTime will be qtrue the very first time a client connects
;1947:to the server machine, but qfalse on map changes and tournement
;1948:restarts.
;1949:============
;1950:*/
;1951:qboolean MV_SetClientIP( int clientNum, char *value )
;1952:{
line 1953
;1953:	mvclientSession_t *mvSess = &mv_clientSessions[clientNum];
ADDRLP4 16
CNSTI4 20
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 mv_clientSessions
ADDP4
ASGNP4
line 1954
;1954:	int i, j = 0, step = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1957
;1955:	char temp[4];
;1956:
;1957:	if ( !value || !strlen(value) ) return qfalse;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $971
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 24
INDIRU4
CNSTU4 0
NEU4 $969
LABELV $971
CNSTI4 0
RETI4
ADDRGP4 $968
JUMPV
LABELV $969
line 1959
;1958:	
;1959:	memset( temp, 0, sizeof(temp) );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTU4 4
ARGU4
ADDRGP4 memset
CALLP4
pop
line 1961
;1960:
;1961:	for ( i = 0; i < (int)strlen(value); i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $975
JUMPV
LABELV $972
line 1962
;1962:	{
line 1963
;1963:		if ( value[i] == '.' || (value[i] == ':' && step == 3) )
ADDRLP4 28
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 46
EQI4 $978
ADDRLP4 28
INDIRI4
CNSTI4 58
NEI4 $976
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $976
LABELV $978
line 1964
;1964:		{
line 1965
;1965:			mvSess->clientIP[step] = atoi(temp);
ADDRLP4 8
ARGP4
ADDRLP4 32
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1967
;1966:
;1967:			memset( temp, 0, sizeof(temp) );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTU4 4
ARGU4
ADDRGP4 memset
CALLP4
pop
line 1968
;1968:			step++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1969
;1969:			j = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1971
;1970:
;1971:			if ( step == 4 ) break;
ADDRLP4 4
INDIRI4
CNSTI4 4
NEI4 $977
ADDRGP4 $974
JUMPV
line 1972
;1972:		}
LABELV $976
line 1973
;1973:		else if ( value[i] >= '0' && value[i] <= '9' && j < (int)sizeof(temp)-1 )
ADDRLP4 32
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 48
LTI4 $981
ADDRLP4 32
INDIRI4
CNSTI4 57
GTI4 $981
ADDRLP4 12
INDIRI4
CNSTI4 3
GEI4 $981
line 1974
;1974:		{
line 1975
;1975:			temp[j] = value[i];
ADDRLP4 12
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 1976
;1976:			j++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1977
;1977:		}
ADDRGP4 $982
JUMPV
LABELV $981
line 1978
;1978:		else return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $968
JUMPV
LABELV $982
LABELV $977
line 1979
;1979:	}
LABELV $973
line 1961
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $975
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRU4
CVUI4 4
LTI4 $972
LABELV $974
line 1980
;1980:	mvSess->localClient = qfalse;
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1981
;1981:	return qtrue;
CNSTI4 1
RETI4
LABELV $968
endproc MV_SetClientIP 36 12
bss
align 1
LABELV $1045
skip 1024
export ClientConnect
code
proc ClientConnect 1128 12
line 1989
;1982:}
;1983:
;1984:extern void DF_ClearCheckPointTimes(gentity_t* playerent);
;1985:
;1986:extern int GetDefaultPlayerMode(qboolean allowDefrag);
;1987:void ClientSetDefaultMode(gentity_t* ent, qboolean allowDefrag);
;1988:
;1989:char *ClientConnect( int clientNum, qboolean firstTime, qboolean isBot ) {
line 1996
;1990:	char		*value;
;1991://	char		*areabits;
;1992:	gclient_t	*client;
;1993:	char		userinfo[MAX_INFO_STRING];
;1994:	gentity_t	*ent;
;1995:	gentity_t	*te;
;1996:	mvclientSession_t *mvSess = &mv_clientSessions[clientNum];
ADDRLP4 0
CNSTI4 20
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 mv_clientSessions
ADDP4
ASGNP4
line 1998
;1997:
;1998:	ent = &g_entities[ clientNum ];
ADDRLP4 4
CNSTI4 2352
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2000
;1999:
;2000:	trap_GetUserinfo( clientNum, userinfo, sizeof( userinfo ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 2003
;2001:
;2002:	// check to see if they are on the banned IP list
;2003:	value = Info_ValueForKey (userinfo, "ip");
ADDRLP4 16
ARGP4
ADDRGP4 $841
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 1044
INDIRP4
ASGNP4
line 2004
;2004:	if ( G_FilterPacket( value ) ) {
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 G_FilterPacket
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $984
line 2005
;2005:		return "Banned.";
ADDRGP4 $986
RETP4
ADDRGP4 $983
JUMPV
LABELV $984
line 2008
;2006:	}
;2007:
;2008:	memset( &userCmdBuffer[clientNum],0,sizeof(userCmdBuffer[clientNum]));
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 userCmdBuffer
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 28684
ARGU4
ADDRGP4 memset
CALLP4
pop
line 2009
;2009:	memset( &mv_clientSessions[clientNum], 0, sizeof(mv_clientSessions[clientNum]) );
CNSTI4 20
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 mv_clientSessions
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 20
ARGU4
ADDRGP4 memset
CALLP4
pop
line 2010
;2010:	G_ResetUserCmdStore(ent - g_entities);
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 G_ResetUserCmdStore
CALLV
pop
line 2011
;2011:	if ( (ent->r.svFlags & SVF_BOT) || isBot || !Q_stricmp(value, "localhost") )
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 1052
INDIRI4
NEI4 $990
ADDRFP4 8
INDIRI4
ADDRLP4 1052
INDIRI4
NEI4 $990
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $844
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $987
LABELV $990
line 2012
;2012:	{ // Bots and localhost get 127.0.0.1
line 2013
;2013:		mvSess->clientIP[0] = 127;
ADDRLP4 0
INDIRP4
CNSTI4 127
ASGNI4
line 2014
;2014:		mvSess->clientIP[1] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2015
;2015:		mvSess->clientIP[2] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 2016
;2016:		mvSess->clientIP[3] = 1;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 2018
;2017:
;2018:		mvSess->localClient = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 1
ASGNI4
line 2019
;2019:	}
ADDRGP4 $988
JUMPV
LABELV $987
line 2020
;2020:	else if ( firstTime && !MV_SetClientIP( clientNum, value ) ) return "Please wait...";
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $991
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 MV_SetClientIP
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $991
ADDRGP4 $993
RETP4
ADDRGP4 $983
JUMPV
LABELV $991
LABELV $988
line 2022
;2021:
;2022:	if ( !firstTime ) MV_ReadSessionData( clientNum ); // If this isn't a "firstTime" read the stored IPs...
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $994
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 MV_ReadSessionData
CALLV
pop
LABELV $994
line 2023
;2023:	if ( mvSess->clientIP[0] == 0 && mvSess->clientIP[1] == 0 && mvSess->clientIP[2] == 0 && mvSess->clientIP[3] == 0 ) return "was dropped due to an internal error."; // Should never happen, but just in case...
ADDRLP4 1068
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $996
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $996
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $996
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 1068
INDIRI4
NEI4 $996
ADDRGP4 $998
RETP4
ADDRGP4 $983
JUMPV
LABELV $996
line 2025
;2024:	
;2025:	if ( g_connectionlimit.integer && firstTime && !mvSess->localClient )
ADDRLP4 1072
CNSTI4 0
ASGNI4
ADDRGP4 g_connectionlimit+12
INDIRI4
ADDRLP4 1072
INDIRI4
EQI4 $999
ADDRFP4 4
INDIRI4
ADDRLP4 1072
INDIRI4
EQI4 $999
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 1072
INDIRI4
NEI4 $999
line 2026
;2026:	{
line 2032
;2027:		mvclientSession_t	*mvSessOther;
;2028:		gentity_t			*other;
;2029:		int					sameip;
;2030:		int					i;
;2031:
;2032:		sameip = 0;
ADDRLP4 1088
CNSTI4 0
ASGNI4
line 2034
;2033:
;2034:		for ( i = 0; i < MAX_CLIENTS; i++ )
ADDRLP4 1080
CNSTI4 0
ASGNI4
LABELV $1002
line 2035
;2035:		{
line 2036
;2036:			if ( i == clientNum ) continue;
ADDRLP4 1080
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1006
ADDRGP4 $1003
JUMPV
LABELV $1006
line 2038
;2037:
;2038:			other = &g_entities[i];
ADDRLP4 1076
CNSTI4 2352
ADDRLP4 1080
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2039
;2039:			mvSessOther = &mv_clientSessions[i];
ADDRLP4 1084
CNSTI4 20
ADDRLP4 1080
INDIRI4
MULI4
ADDRGP4 mv_clientSessions
ADDP4
ASGNP4
line 2041
;2040:
;2041:			if ( other && other->client && (other->client->pers.connected == CON_CONNECTING || other->client->pers.connected == CON_CONNECTED || other->client->pers.connected != CON_DISCONNECTED)/*&& other->inuse*/ )
ADDRLP4 1096
CNSTU4 0
ASGNU4
ADDRLP4 1076
INDIRP4
CVPU4 4
ADDRLP4 1096
INDIRU4
EQU4 $1008
ADDRLP4 1100
ADDRLP4 1076
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1100
INDIRP4
CVPU4 4
ADDRLP4 1096
INDIRU4
EQU4 $1008
ADDRLP4 1104
ADDRLP4 1100
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 1
EQI4 $1011
ADDRLP4 1104
INDIRI4
CNSTI4 2
EQI4 $1011
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $1008
LABELV $1011
line 2042
;2042:			{
line 2043
;2043:				if ( ((mvSessOther->clientIP[0] == mvSess->clientIP[0]) && (mvSessOther->clientIP[1] == mvSess->clientIP[1]) && (mvSessOther->clientIP[2] == mvSess->clientIP[2]) && (mvSessOther->clientIP[3] == mvSess->clientIP[3])))
ADDRLP4 1084
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
NEI4 $1012
ADDRLP4 1116
CNSTI4 4
ASGNI4
ADDRLP4 1084
INDIRP4
ADDRLP4 1116
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 1116
INDIRI4
ADDP4
INDIRI4
NEI4 $1012
ADDRLP4 1120
CNSTI4 8
ASGNI4
ADDRLP4 1084
INDIRP4
ADDRLP4 1120
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 1120
INDIRI4
ADDP4
INDIRI4
NEI4 $1012
ADDRLP4 1124
CNSTI4 12
ASGNI4
ADDRLP4 1084
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
NEI4 $1012
line 2044
;2044:				{
line 2045
;2045:					sameip++;
ADDRLP4 1088
ADDRLP4 1088
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2046
;2046:				}
LABELV $1012
line 2047
;2047:			}
LABELV $1008
line 2048
;2048:		}
LABELV $1003
line 2034
ADDRLP4 1080
ADDRLP4 1080
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 32
LTI4 $1002
line 2049
;2049:		if ( sameip >= g_connectionlimit.integer )
ADDRLP4 1088
INDIRI4
ADDRGP4 g_connectionlimit+12
INDIRI4
LTI4 $1014
line 2050
;2050:		{
line 2051
;2051:			return "Too many connections from your IP.";
ADDRGP4 $1017
RETP4
ADDRGP4 $983
JUMPV
LABELV $1014
line 2053
;2052:		}
;2053:	}
LABELV $999
line 2055
;2054:
;2055:	if ( g_connectinglimit.integer != 0 && firstTime && !mvSess->localClient )
ADDRLP4 1076
CNSTI4 0
ASGNI4
ADDRGP4 g_connectinglimit+12
INDIRI4
ADDRLP4 1076
INDIRI4
EQI4 $1018
ADDRFP4 4
INDIRI4
ADDRLP4 1076
INDIRI4
EQI4 $1018
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 1076
INDIRI4
NEI4 $1018
line 2056
;2056:	{
line 2062
;2057:		mvclientSession_t	*mvSessOther;
;2058:		gentity_t			*other;
;2059:		int					alreadyConnecting;
;2060:		int					i;
;2061:
;2062:		alreadyConnecting = 0;
ADDRLP4 1092
CNSTI4 0
ASGNI4
line 2064
;2063:
;2064:		for ( i = 0; i < MAX_CLIENTS; i++ )
ADDRLP4 1080
CNSTI4 0
ASGNI4
LABELV $1021
line 2065
;2065:		{
line 2066
;2066:			if ( i == clientNum ) continue;
ADDRLP4 1080
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1025
ADDRGP4 $1022
JUMPV
LABELV $1025
line 2068
;2067:
;2068:			other = &g_entities[i];
ADDRLP4 1084
CNSTI4 2352
ADDRLP4 1080
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2069
;2069:			mvSessOther = &mv_clientSessions[i];
ADDRLP4 1088
CNSTI4 20
ADDRLP4 1080
INDIRI4
MULI4
ADDRGP4 mv_clientSessions
ADDP4
ASGNP4
line 2071
;2070:
;2071:			if ( other && other->client && other->client->pers.connected == CON_CONNECTING )
ADDRLP4 1100
CNSTU4 0
ASGNU4
ADDRLP4 1084
INDIRP4
CVPU4 4
ADDRLP4 1100
INDIRU4
EQU4 $1027
ADDRLP4 1104
ADDRLP4 1084
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CVPU4 4
ADDRLP4 1100
INDIRU4
EQU4 $1027
ADDRLP4 1104
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1027
line 2072
;2072:			{
line 2073
;2073:				if ( ((mvSessOther->clientIP[0] == mvSess->clientIP[0]) && (mvSessOther->clientIP[1] == mvSess->clientIP[1]) && (mvSessOther->clientIP[2] == mvSess->clientIP[2]) && (mvSessOther->clientIP[3] == mvSess->clientIP[3])) )
ADDRLP4 1088
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
NEI4 $1029
ADDRLP4 1116
CNSTI4 4
ASGNI4
ADDRLP4 1088
INDIRP4
ADDRLP4 1116
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 1116
INDIRI4
ADDP4
INDIRI4
NEI4 $1029
ADDRLP4 1120
CNSTI4 8
ASGNI4
ADDRLP4 1088
INDIRP4
ADDRLP4 1120
INDIRI4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
ADDRLP4 1120
INDIRI4
ADDP4
INDIRI4
NEI4 $1029
ADDRLP4 1124
CNSTI4 12
ASGNI4
ADDRLP4 1088
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
NEI4 $1029
line 2074
;2074:				{
line 2075
;2075:					alreadyConnecting++;
ADDRLP4 1092
ADDRLP4 1092
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2076
;2076:				}
LABELV $1029
line 2077
;2077:			}
LABELV $1027
line 2078
;2078:		}
LABELV $1022
line 2064
ADDRLP4 1080
ADDRLP4 1080
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 32
LTI4 $1021
line 2079
;2079:		if ( alreadyConnecting >= g_connectinglimit.integer )
ADDRLP4 1092
INDIRI4
ADDRGP4 g_connectinglimit+12
INDIRI4
LTI4 $1031
line 2080
;2080:		{
line 2081
;2081:			return "Too many players from your IP are trying to connect at the same time.";
ADDRGP4 $1034
RETP4
ADDRGP4 $983
JUMPV
LABELV $1031
line 2083
;2082:		}
;2083:	}
LABELV $1018
line 2085
;2084:
;2085:	if ( !( ent->r.svFlags & SVF_BOT ) && !isBot && g_needpass.integer ) {
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 1080
INDIRI4
NEI4 $1035
ADDRFP4 8
INDIRI4
ADDRLP4 1080
INDIRI4
NEI4 $1035
ADDRGP4 g_needpass+12
INDIRI4
ADDRLP4 1080
INDIRI4
EQI4 $1035
line 2087
;2086:		// check for a password
;2087:		value = Info_ValueForKey (userinfo, "password");
ADDRLP4 16
ARGP4
ADDRGP4 $1038
ARGP4
ADDRLP4 1084
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 1084
INDIRP4
ASGNP4
line 2088
;2088:		if ( g_password.string[0] && Q_stricmp( g_password.string, "none" ) &&
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1039
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $1043
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $1039
ADDRGP4 g_password+16
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
EQI4 $1039
line 2089
;2089:			strcmp( g_password.string, value) != 0) {
line 2091
;2090:			static char sTemp[1024];
;2091:			Q_strncpyz(sTemp, G_GetStripEdString("SVINGAME","INVALID_PASSWORD"), sizeof (sTemp) );
ADDRGP4 $212
ARGP4
ADDRGP4 $1046
ARGP4
ADDRLP4 1096
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1045
ARGP4
ADDRLP4 1096
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2092
;2092:			return sTemp;// return "Invalid password";
ADDRGP4 $1045
RETP4
ADDRGP4 $983
JUMPV
LABELV $1039
line 2094
;2093:		}
;2094:	}
LABELV $1035
line 2097
;2095:
;2096:	// they can connect
;2097:	ent->client = level.clients + clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 53196
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 2098
;2098:	client = ent->client;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 2102
;2099:
;2100://	areabits = client->areabits;
;2101:
;2102:	memset( client, 0, sizeof(*client) );
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 53196
ARGU4
ADDRGP4 memset
CALLP4
pop
line 2104
;2103:
;2104:	client->pers.connected = CON_CONNECTING;
ADDRLP4 8
INDIRP4
CNSTI4 1380
ADDP4
CNSTI4 1
ASGNI4
line 2107
;2105:
;2106:	// read or initialize the session data
;2107:	if ( firstTime || level.newSession ) {
ADDRLP4 1084
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 1084
INDIRI4
NEI4 $1050
ADDRGP4 level+72
INDIRI4
ADDRLP4 1084
INDIRI4
EQI4 $1047
LABELV $1050
line 2108
;2108:		G_InitSessionData( client, userinfo, isBot );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_InitSessionData
CALLV
pop
line 2109
;2109:		ClientSetDefaultMode(ent,!isBot);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $1052
ADDRLP4 1088
CNSTI4 1
ASGNI4
ADDRGP4 $1053
JUMPV
LABELV $1052
ADDRLP4 1088
CNSTI4 0
ASGNI4
LABELV $1053
ADDRLP4 1088
INDIRI4
ARGI4
ADDRGP4 ClientSetDefaultMode
CALLV
pop
line 2110
;2110:	}
LABELV $1047
line 2111
;2111:	G_ReadSessionData( client );
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 2113
;2112:
;2113:	if( isBot ) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1054
line 2114
;2114:		ent->r.svFlags |= SVF_BOT;
ADDRLP4 1088
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1088
INDIRP4
ADDRLP4 1088
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2115
;2115:		ent->inuse = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 2116
;2116:		if( !G_BotConnect( clientNum, !firstTime ) ) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1059
ADDRLP4 1092
CNSTI4 1
ASGNI4
ADDRGP4 $1060
JUMPV
LABELV $1059
ADDRLP4 1092
CNSTI4 0
ASGNI4
LABELV $1060
ADDRLP4 1092
INDIRI4
ARGI4
ADDRLP4 1096
ADDRGP4 G_BotConnect
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1056
line 2117
;2117:			return "BotConnectfailed";
ADDRGP4 $1061
RETP4
ADDRGP4 $983
JUMPV
LABELV $1056
line 2119
;2118:		}
;2119:		if (ent->client->sess.mode == MODE_DEFRAG) {
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1062
line 2121
;2120:			// bots cant race
;2121:			ClientSetDefaultMode(ent, qfalse);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ClientSetDefaultMode
CALLV
pop
line 2122
;2122:		}
LABELV $1062
line 2123
;2123:	}
LABELV $1054
line 2126
;2124:
;2125:	// get and distribute relevent paramters
;2126:	G_LogPrintf( "ClientConnect: %i\n", clientNum );
ADDRGP4 $1064
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2127
;2127:	ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2130
;2128:
;2129:	// don't do the "xxx connected" messages if they were caried over from previous level
;2130:	if ( firstTime ) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1065
line 2131
;2131:		trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " %s\n\"", client->pers.netname, G_GetStripEdString("SVINGAME", "PLCONNECT")) );
ADDRGP4 $212
ARGP4
ADDRGP4 $1068
ARGP4
ADDRLP4 1088
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1067
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1092
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2132
;2132:	}
LABELV $1065
line 2134
;2133:
;2134:	if ( g_gametype.integer >= GT_TEAM &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $1069
ADDRLP4 8
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1069
line 2135
;2135:		client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 2136
;2136:		BroadcastTeamChange( client, -1 );
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 2137
;2137:	}
LABELV $1069
line 2140
;2138:
;2139:	// count current clients and rank for scoreboard
;2140:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 2142
;2141:
;2142:	te = G_TempEntity( vec3_origin, EV_CLIENTJOIN );
ADDRGP4 vec3_origin
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1088
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1088
INDIRP4
ASGNP4
line 2143
;2143:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 1092
ADDRLP4 1040
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 2144
;2144:	te->s.eventParm = clientNum;
ADDRLP4 1040
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 2146
;2145:
;2146:	memset( &ent->client->ps, 0, sizeof(ent->client->ps) ); // Make sure we always use a fresh playerState for new clients (this allows us to check for powerups in the playerState to prevent flagEating when calling ClientBegin)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1380
ARGU4
ADDRGP4 memset
CALLP4
pop
line 2152
;2147:	// for statistics
;2148://	client->areabits = areabits;
;2149://	if ( !client->areabits )
;2150://		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;2151:
;2152:	DF_ClearCheckPointTimes(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 DF_ClearCheckPointTimes
CALLV
pop
line 2154
;2153:
;2154:	return NULL;
CNSTP4 0
RETP4
LABELV $983
endproc ClientConnect 1128 12
export ClientBegin
proc ClientBegin 1124 12
line 2170
;2155:}
;2156:
;2157:void G_WriteClientSessionData( gclient_t *client );
;2158:extern void UpdateClientRaceVars(gclient_t* client);
;2159://void DF_SetRaceMode(gentity_t* ent, qboolean value);
;2160:void ResetClientModeIfInvalid(gentity_t* ent, qboolean allowDefrag);
;2161:/*
;2162:===========
;2163:ClientBegin
;2164:
;2165:called when a client has finished connecting, and is ready
;2166:to be placed into the level.  This will happen every level load,
;2167:and on transition between teams, but doesn't happen on respawns
;2168:============
;2169:*/
;2170:void ClientBegin( int clientNum, qboolean allowTeamReset ) {
line 2178
;2171:	gentity_t	*ent;
;2172:	gclient_t	*client;
;2173:	gentity_t	*tent;
;2174:	int			flags, i;
;2175:	char		userinfo[MAX_INFO_VALUE], *modelname;
;2176:	int			nowTime;
;2177:
;2178:	ent = g_entities + clientNum;
ADDRLP4 4
CNSTI4 2352
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2179
;2179:	nowTime = LEVELTIME(ent->client); // TODO does that even make sense here? idk.
ADDRLP4 1060
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1060
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1077
ADDRLP4 1060
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1077
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1079
ADDRLP4 1056
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1080
JUMPV
LABELV $1079
ADDRLP4 1056
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1080
ADDRLP4 1052
ADDRLP4 1056
INDIRI4
ASGNI4
ADDRGP4 $1078
JUMPV
LABELV $1077
ADDRLP4 1052
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1078
ADDRLP4 1036
ADDRLP4 1052
INDIRI4
ASGNI4
line 2182
;2180:	
;2181:	// FlagEatingFix - We must ensure that powerups are cleared on ClientConnect and before team changes. Otherwise we might accidently trigger a flag duplication here.
;2182:	for ( i = PW_REDFLAG; i <= PW_NEUTRALFLAG; i++ )
ADDRLP4 0
CNSTI4 4
ASGNI4
LABELV $1081
line 2183
;2183:	{
line 2184
;2184:		if ( ent->client->ps.powerups[i] )
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1085
line 2185
;2185:		{
line 2189
;2186:			gitem_t		*item;
;2187:			gentity_t	*drop;
;2188:
;2189:			item = BG_FindItemForPowerup( i );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1072
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 1064
ADDRLP4 1072
INDIRP4
ASGNP4
line 2190
;2190:			if ( item )
ADDRLP4 1064
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1087
line 2191
;2191:			{
line 2192
;2192:				drop = Drop_Item( ent, item, 45 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
CNSTF4 1110704128
ARGF4
ADDRLP4 1076
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 1068
ADDRLP4 1076
INDIRP4
ASGNP4
line 2194
;2193:				// decide how many seconds it has left
;2194:				drop->count = ( ent->client->ps.powerups[ i ] - nowTime ) / 1000;
ADDRLP4 1068
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
ADDRLP4 1036
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2195
;2195:				if ( drop->count < 1 ) {
ADDRLP4 1068
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1089
line 2196
;2196:					drop->count = 1;
ADDRLP4 1068
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 1
ASGNI4
line 2197
;2197:				}
LABELV $1089
line 2201
;2198:				//if ( drop->count > 1000 ) { // in case of any weird confusion with nowTime?
;2199:				//	drop->count = 1000;
;2200:				//}
;2201:			}
LABELV $1087
line 2203
;2202:
;2203:			ent->client->ps.powerups[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 2204
;2204:		}
LABELV $1085
line 2205
;2205:	}
LABELV $1082
line 2182
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $1081
line 2207
;2206:
;2207:	if ((ent->r.svFlags & SVF_BOT) && g_gametype.integer >= GT_TEAM)
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1091
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $1091
line 2208
;2208:	{
line 2209
;2209:		if (allowTeamReset && g_botTeamAutoBalance.integer)
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 1064
INDIRI4
EQI4 $1094
ADDRGP4 g_botTeamAutoBalance+12
INDIRI4
ADDRLP4 1064
INDIRI4
EQI4 $1094
line 2210
;2210:		{
line 2211
;2211:			const char *team = "Red";
ADDRLP4 1068
ADDRGP4 $1097
ASGNP4
line 2214
;2212:			int preSess;
;2213:
;2214:			if ( !ent->client->pers.botDelayed )
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1098
line 2215
;2215:			{ // Delay bots until all clients are connected
line 2216
;2216:				ent->client->pers.botDelayed = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1704
ADDP4
CNSTI4 1
ASGNI4
line 2217
;2217:				return;
ADDRGP4 $1072
JUMPV
LABELV $1098
line 2221
;2218:			}
;2219:
;2220:			//SetTeam(ent, "");
;2221:			ent->client->sess.sessionTeam = PickTeam(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
ADDRLP4 1076
INDIRI4
ASGNI4
line 2222
;2222:			trap_GetUserinfo(clientNum, userinfo, MAX_INFO_STRING);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 2224
;2223:
;2224:			if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1100
line 2225
;2225:			{
line 2226
;2226:				ent->client->sess.sessionTeam = TEAM_RED;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
CNSTI4 1
ASGNI4
line 2227
;2227:			}
LABELV $1100
line 2229
;2228:
;2229:			if (ent->client->sess.sessionTeam == TEAM_RED)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1102
line 2230
;2230:			{
line 2231
;2231:				team = "Red";
ADDRLP4 1068
ADDRGP4 $1097
ASGNP4
line 2232
;2232:			}
ADDRGP4 $1103
JUMPV
LABELV $1102
line 2234
;2233:			else
;2234:			{
line 2235
;2235:				team = "Blue";
ADDRLP4 1068
ADDRGP4 $1104
ASGNP4
line 2236
;2236:			}
LABELV $1103
line 2238
;2237:
;2238:			Info_SetValueForKey( userinfo, "team", team );
ADDRLP4 12
ARGP4
ADDRGP4 $1105
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 2240
;2239:
;2240:			trap_SetUserinfo( clientNum, userinfo );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 2242
;2241:
;2242:			ent->client->ps.persistant[ PERS_TEAM ] = ent->client->sess.sessionTeam;
ADDRLP4 1080
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1080
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 1080
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 2244
;2243:
;2244:			preSess = ent->client->sess.sessionTeam;
ADDRLP4 1072
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 2245
;2245:			G_ReadSessionData( ent->client );
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ReadSessionData
CALLV
pop
line 2246
;2246:			ent->client->sess.sessionTeam = preSess;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
ADDRLP4 1072
INDIRI4
ASGNI4
line 2247
;2247:			G_WriteClientSessionData(ent->client);
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 2248
;2248:			ClientUserinfoChanged( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2249
;2249:			ClientBegin(clientNum, qfalse);
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 2250
;2250:			return;
ADDRGP4 $1072
JUMPV
LABELV $1094
line 2252
;2251:		}
;2252:	}
LABELV $1091
line 2254
;2253:
;2254:	client = level.clients + clientNum;
ADDRLP4 8
CNSTI4 53196
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 2256
;2255:
;2256:	if ( ent->r.linked ) {
ADDRLP4 4
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1106
line 2257
;2257:		trap_UnlinkEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 2258
;2258:	}
LABELV $1106
line 2259
;2259:	G_InitGentity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 2260
;2260:	ent->touch = 0;
ADDRLP4 4
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 2261
;2261:	ent->pain = 0;
ADDRLP4 4
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 2262
;2262:	ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 2264
;2263:
;2264:	client->pers.connected = CON_CONNECTED;
ADDRLP4 8
INDIRP4
CNSTI4 1380
ADDP4
CNSTI4 2
ASGNI4
line 2265
;2265:	client->pers.enterTime = level.time;
ADDRLP4 8
INDIRP4
CNSTI4 1628
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2266
;2266:	if (!client->pers.firstEnterTimeSet) {
ADDRLP4 8
INDIRP4
CNSTI4 1636
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1109
line 2267
;2267:		client->pers.firstEnterTime = level.time;
ADDRLP4 8
INDIRP4
CNSTI4 1632
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2268
;2268:		client->pers.firstEnterTimeSet = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 1636
ADDP4
CNSTI4 1
ASGNI4
line 2269
;2269:	}
LABELV $1109
line 2270
;2270:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 8
INDIRP4
CNSTI4 1640
ADDP4
CNSTI4 0
ASGNI4
line 2277
;2271:
;2272:	// save eflags around this, because changing teams will
;2273:	// cause this to happen with a valid entity, and we
;2274:	// want to make sure the teleport bit is set right
;2275:	// so the viewpoint doesn't interpolate through the
;2276:	// world to the new position
;2277:	flags = client->ps.eFlags;
ADDRLP4 1040
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 2279
;2278:
;2279:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1113
JUMPV
LABELV $1112
line 2282
;2280:
;2281:	while (i < NUM_FORCE_POWERS)
;2282:	{
line 2283
;2283:		if (ent->client->ps.fd.forcePowersActive & (1 << i))
ADDRLP4 4
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
EQI4 $1115
line 2284
;2284:		{
line 2285
;2285:			WP_ForcePowerStop(ent, i);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 2286
;2286:		}
LABELV $1115
line 2287
;2287:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2288
;2288:	}
LABELV $1113
line 2281
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $1112
line 2290
;2289:
;2290:	i = TRACK_CHANNEL_1;
ADDRLP4 0
CNSTI4 51
ASGNI4
ADDRGP4 $1118
JUMPV
LABELV $1117
line 2293
;2291:
;2292:	while (i < NUM_TRACK_CHANNELS)
;2293:	{
line 2294
;2294:		if (ent->client->ps.fd.killSoundEntIndex[i-50] && ent->client->ps.fd.killSoundEntIndex[i-50] < MAX_GENTITIES && ent->client->ps.fd.killSoundEntIndex[i-50] > 0)
ADDRLP4 1064
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1068
CNSTI4 0
ASGNI4
ADDRLP4 1064
INDIRI4
ADDRLP4 1068
INDIRI4
EQI4 $1120
ADDRLP4 1064
INDIRI4
CNSTI4 1024
GEI4 $1120
ADDRLP4 1064
INDIRI4
ADDRLP4 1068
INDIRI4
LEI4 $1120
line 2295
;2295:		{
line 2296
;2296:			G_MuteSound(ent->client->ps.fd.killSoundEntIndex[i-50], CHAN_VOICE);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 2297
;2297:		}
LABELV $1120
line 2298
;2298:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2299
;2299:	}
LABELV $1118
line 2292
ADDRLP4 0
INDIRI4
CNSTI4 56
LTI4 $1117
line 2300
;2300:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2302
;2301:
;2302:	memset( &client->ps, 0, sizeof( client->ps ) );
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1380
ARGU4
ADDRGP4 memset
CALLP4
pop
line 2303
;2303:	client->ps.eFlags = flags;
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 1040
INDIRI4
ASGNI4
line 2305
;2304:
;2305:	client->ps.hasDetPackPlanted = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 2308
;2306:
;2307:	//first-time force power initialization
;2308:	WP_InitForcePowers( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 WP_InitForcePowers
CALLV
pop
line 2311
;2309:
;2310:	//init saber ent
;2311:	WP_SaberInitBladeData( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 WP_SaberInitBladeData
CALLV
pop
line 2314
;2312:
;2313:	// First time model setup for that player.
;2314:	trap_GetUserinfo( clientNum, userinfo, sizeof(userinfo) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 2315
;2315:	modelname = Info_ValueForKey (userinfo, "model");
ADDRLP4 12
ARGP4
ADDRGP4 $927
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1064
INDIRP4
ASGNP4
line 2316
;2316:	SetupGameGhoul2Model(client, modelname);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 SetupGameGhoul2Model
CALLV
pop
line 2318
;2317:
;2318:	if (ent->client->ghoul2)
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1122
line 2319
;2319:	{
line 2320
;2320:		ent->bolt_Head = trap_G2API_AddBolt(ent->client->ghoul2, 0, "cranium");
ADDRLP4 4
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
ADDRGP4 $722
ARGP4
ADDRLP4 1072
ADDRGP4 trap_G2API_AddBolt
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 1072
INDIRI4
ASGNI4
line 2321
;2321:		ent->bolt_Waist = trap_G2API_AddBolt(ent->client->ghoul2, 0, "thoracic");
ADDRLP4 4
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
ADDRGP4 $1124
ARGP4
ADDRLP4 1080
ADDRGP4 trap_G2API_AddBolt
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 848
ADDP4
ADDRLP4 1080
INDIRI4
ASGNI4
line 2322
;2322:		ent->bolt_LArm = trap_G2API_AddBolt(ent->client->ghoul2, 0, "lradius");
ADDRLP4 4
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
ADDRGP4 $1125
ARGP4
ADDRLP4 1088
ADDRGP4 trap_G2API_AddBolt
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 832
ADDP4
ADDRLP4 1088
INDIRI4
ASGNI4
line 2323
;2323:		ent->bolt_RArm = trap_G2API_AddBolt(ent->client->ghoul2, 0, "rradius");
ADDRLP4 4
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
ADDRGP4 $1126
ARGP4
ADDRLP4 1096
ADDRGP4 trap_G2API_AddBolt
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 836
ADDP4
ADDRLP4 1096
INDIRI4
ASGNI4
line 2324
;2324:		ent->bolt_LLeg = trap_G2API_AddBolt(ent->client->ghoul2, 0, "ltibia");
ADDRLP4 4
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
ADDRGP4 $1127
ARGP4
ADDRLP4 1104
ADDRGP4 trap_G2API_AddBolt
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 840
ADDP4
ADDRLP4 1104
INDIRI4
ASGNI4
line 2325
;2325:		ent->bolt_RLeg = trap_G2API_AddBolt(ent->client->ghoul2, 0, "rtibia");
ADDRLP4 4
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
ADDRGP4 $1128
ARGP4
ADDRLP4 1112
ADDRGP4 trap_G2API_AddBolt
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 844
ADDP4
ADDRLP4 1112
INDIRI4
ASGNI4
line 2326
;2326:		ent->bolt_Motion = trap_G2API_AddBolt(ent->client->ghoul2, 0, "Motion");
ADDRLP4 4
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
ADDRGP4 $1129
ARGP4
ADDRLP4 1120
ADDRGP4 trap_G2API_AddBolt
INDIRP4
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 1120
INDIRI4
ASGNI4
line 2327
;2327:	}
LABELV $1122
line 2336
;2328:
;2329:	//if (client->sess.raceMode && !g_defrag.integer) {
;2330:	//	client->sess.raceMode = g_defrag.integer;
;2331:	//	Cmd_ForceChanged_f(ent);
;2332:	//} else {
;2333:	//	client->sess.raceMode = g_defrag.integer;
;2334:	//}
;2335:	//DF_SetRaceMode(ent,g_defrag.integer);
;2336:	ResetClientModeIfInvalid(ent,(qboolean)!(ent->r.svFlags& SVF_BOT));
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $1131
ADDRLP4 1068
CNSTI4 1
ASGNI4
ADDRGP4 $1132
JUMPV
LABELV $1131
ADDRLP4 1068
CNSTI4 0
ASGNI4
LABELV $1132
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 ResetClientModeIfInvalid
CALLV
pop
line 2345
;2337:
;2338:	//if (client->sess.raceMode)
;2339:	//	client->ps.stats[STAT_RACEMODE] = 1;
;2340:	//else
;2341:	//	client->ps.stats[STAT_RACEMODE] = 0;
;2342:
;2343:	//client->ps.stats[STAT_MOVEMENTSTYLE] = client->sess.raceStyle.movementStyle;
;2344:	//client->ps.stats[STAT_RUNFLAGS] = client->sess.raceStyle.runFlags;
;2345:	UpdateClientRaceVars(client);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UpdateClientRaceVars
CALLV
pop
line 2348
;2346:
;2347:	// locate ent at a spawn point
;2348:	G_GetUserCmd(client - level.clients, &ent->client->pers.cmd, GETUSERCMD_NOADVANCE); // make sure LEVELTIME() inside ClientSpawn gets a valid serverTime value
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 53196
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_GetUserCmd
CALLI4
pop
line 2349
;2349:	ClientSpawn( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 2351
;2350:
;2351:	if ( client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1133
line 2353
;2352:		// send event
;2353:		tent = G_TempEntity( ent->client->ps.origin, EV_PLAYER_TELEPORT_IN );
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 1076
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1076
INDIRP4
ASGNP4
line 2354
;2354:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 1080
CNSTI4 220
ASGNI4
ADDRLP4 1048
INDIRP4
ADDRLP4 1080
INDIRI4
ADDP4
ADDRLP4 4
INDIRP4
ADDRLP4 1080
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 2356
;2355:
;2356:		if ( g_gametype.integer != GT_TOURNAMENT  ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $1135
line 2357
;2357:			trap_SendServerCommand( -1, va("print \"%s" S_COLOR_WHITE " %s\n\"", client->pers.netname, G_GetStripEdString("SVINGAME", "PLENTER")) );
ADDRGP4 $212
ARGP4
ADDRGP4 $1138
ARGP4
ADDRLP4 1084
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1067
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRLP4 1088
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2358
;2358:		}
LABELV $1135
line 2359
;2359:	}
LABELV $1133
line 2360
;2360:	G_LogPrintf( "ClientBegin: %i\n", clientNum );
ADDRGP4 $1139
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 2363
;2361:
;2362:	// count current clients and rank for scoreboard
;2363:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 2365
;2364:
;2365:	G_ClearClientLog(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_ClearClientLog
CALLV
pop
line 2367
;2366:
;2367:	trap_SendServerCommand(clientNum, "print \"Welcome. Type ^2/help^7 for info about commands and how to play.\n\"");
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $1140
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2368
;2368:}
LABELV $1072
endproc ClientBegin 1124 12
proc AllForceDisabled 4 0
line 2371
;2369:
;2370:static qboolean AllForceDisabled(int force)
;2371:{
line 2374
;2372:	int i;
;2373:
;2374:	if (force)
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1142
line 2375
;2375:	{
line 2376
;2376:		for (i=0;i<NUM_FORCE_POWERS;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1144
line 2377
;2377:		{
line 2378
;2378:			if (!(force & (1<<i)))
ADDRFP4 0
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $1148
line 2379
;2379:			{
line 2380
;2380:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1141
JUMPV
LABELV $1148
line 2382
;2381:			}
;2382:		}
LABELV $1145
line 2376
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $1144
line 2384
;2383:
;2384:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1141
JUMPV
LABELV $1142
line 2387
;2385:	}
;2386:
;2387:	return qfalse;
CNSTI4 0
RETI4
LABELV $1141
endproc AllForceDisabled 4 0
export G_CheckForCloserIronmanSpawn
proc G_CheckForCloserIronmanSpawn 1180 28
line 2391
;2388:}
;2389:
;2390:
;2391:qboolean G_CheckForCloserIronmanSpawn(gentity_t* ent, vec3_t spawn_origin, vec3_t spawn_angles, vec3_t spawn_velocity) {
line 2393
;2392:	int				i;
;2393:	int				allowShortPos = 0;
ADDRLP4 1104
CNSTI4 0
ASGNI4
line 2397
;2394:	vec3_t			delta;
;2395:	//float normalSpawnDist; // wanted to check if normal spawn dist is closer but that might be too simplistic for complex level architectures
;2396:	float			currentDist;
;2397:	qboolean		good = qfalse;
ADDRLP4 1084
CNSTI4 0
ASGNI4
line 2401
;2398:	simplePos_t*	pos;
;2399:	trace_t			trace;
;2400:	//vec3_t			velNorm;
;2401:	if (!level.ironManPosCount || !level.ironManCurrentPositionSet || level.ironManClientNum == -1) {
ADDRLP4 1112
CNSTI4 0
ASGNI4
ADDRGP4 level+32600
INDIRI4
ADDRLP4 1112
INDIRI4
EQI4 $1157
ADDRGP4 level+30592
INDIRI4
ADDRLP4 1112
INDIRI4
EQI4 $1157
ADDRGP4 level+30596
INDIRI4
CNSTI4 -1
NEI4 $1151
LABELV $1157
line 2402
;2402:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1150
JUMPV
LABELV $1151
LABELV $1158
line 2409
;2403:	}
;2404:
;2405:	//VectorSubtract(level.ironManCurrentPosition, spawn_origin, delta);
;2406:	//normalSpawnDist = VectorLengthSquared(delta);
;2407:
;2408:retry:
;2409:	for (i = level.ironManPosCount - 1; i >= MAX(0, level.ironManPosCount - IRONMAN_MAX_PAST_POSITIONS_COUNT + 1); i--) {
ADDRLP4 1100
ADDRGP4 level+32600
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1162
JUMPV
LABELV $1159
line 2410
;2410:		pos = &level.ironManPos[i % IRONMAN_MAX_PAST_POSITIONS_COUNT];
ADDRLP4 1080
CNSTI4 40
ADDRLP4 1100
INDIRI4
CNSTI4 50
MODI4
MULI4
ADDRGP4 level+30600
ADDP4
ASGNP4
line 2411
;2411:		if (pos->when + IRONMAN_RESPAWNPOSITION_MAXPOSITIONAGE < level.time) {
ADDRLP4 1080
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 10000
ADDI4
ADDRGP4 level+36
INDIRI4
GEI4 $1168
line 2413
;2412:			// position is too old
;2413:			if (allowShortPos < 2) {
ADDRLP4 1104
INDIRI4
CNSTI4 2
GEI4 $1171
line 2415
;2414:				// let's try with allowing shorter distances
;2415:				allowShortPos++;
ADDRLP4 1104
ADDRLP4 1104
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2416
;2416:				goto retry;
ADDRGP4 $1158
JUMPV
LABELV $1171
line 2418
;2417:			}
;2418:			else {
line 2420
;2419:				// fuck it
;2420:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1150
JUMPV
LABELV $1168
line 2424
;2421:			}
;2422:		}
;2423:
;2424:		VectorSubtract(pos->origin, level.ironManCurrentPosition, delta);
ADDRLP4 1088
ADDRLP4 1080
INDIRP4
INDIRF4
ADDRGP4 level+30580
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+4
ADDRLP4 1080
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 level+30580+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+8
ADDRLP4 1080
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 level+30580+8
INDIRF4
SUBF4
ASGNF4
line 2425
;2425:		currentDist = VectorLengthSquared(delta);
ADDRLP4 1088
ARGP4
ADDRLP4 1120
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1108
ADDRLP4 1120
INDIRF4
ASGNF4
line 2427
;2426:		
;2427:		if (allowShortPos == 2) {
ADDRLP4 1104
INDIRI4
CNSTI4 2
NEI4 $1180
line 2429
;2428:			// we are desperate. spawn right on top of his head if needed! maybe hes camping or sth xd
;2429:			good = qtrue;
ADDRLP4 1084
CNSTI4 1
ASGNI4
line 2430
;2430:		}
ADDRGP4 $1181
JUMPV
LABELV $1180
line 2431
;2431:		else if (currentDist > IRONMAN_RESPAWNPOSITION_MINDISTANCE* IRONMAN_RESPAWNPOSITION_MINDISTANCE) {
ADDRLP4 1108
INDIRF4
CNSTF4 1242125376
LEF4 $1182
line 2432
;2432:			good = qtrue;
ADDRLP4 1084
CNSTI4 1
ASGNI4
line 2433
;2433:		}
ADDRGP4 $1183
JUMPV
LABELV $1182
line 2434
;2434:		else if (allowShortPos && currentDist > IRONMAN_RESPAWNPOSITION_MINDISTANCE_SHORT* IRONMAN_RESPAWNPOSITION_MINDISTANCE_SHORT) {
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $1184
ADDRLP4 1108
INDIRF4
CNSTF4 1206862336
LEF4 $1184
line 2435
;2435:			good = qtrue;
ADDRLP4 1084
CNSTI4 1
ASGNI4
line 2436
;2436:		}
LABELV $1184
LABELV $1183
LABELV $1181
line 2438
;2437:
;2438:		if (good) {
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $1186
line 2442
;2439:			vec3_t goodOrigin;
;2440:			float speed;
;2441:
;2442:			if (allowShortPos == 2) {
ADDRLP4 1104
INDIRI4
CNSTI4 2
NEI4 $1188
line 2444
;2443:				int side, front, up, dist, skipvis;
;2444:				float traceDist = IRONMAN_RESPAWNPOSITION_MINDISTANCE_SHORT * 2.0f;
ADDRLP4 1148
CNSTF4 1143930880
ASGNF4
line 2445
;2445:				float fracRequired = 0.4;
ADDRLP4 1160
CNSTF4 1053609165
ASGNF4
line 2446
;2446:				good = qfalse;
ADDRLP4 1084
CNSTI4 0
ASGNI4
line 2447
;2447:				VectorCopy(pos->origin, goodOrigin);
ADDRLP4 1124
ADDRLP4 1080
INDIRP4
INDIRB
ASGNB 12
line 2450
;2448:				// we might spawn right on the capper's ass
;2449:				// try to move us a bit away if we can?
;2450:				for (skipvis = 0; skipvis < 2 && !good; skipvis++) { // in emergency, dont require visual contact to capper
ADDRLP4 1156
CNSTI4 0
ASGNI4
ADDRGP4 $1193
JUMPV
LABELV $1190
line 2451
;2451:					for (dist = 0; dist < 2 && !good; dist++) { // try shorter distance if nothing fouund
ADDRLP4 1164
CNSTI4 0
ASGNI4
ADDRGP4 $1197
JUMPV
LABELV $1194
line 2452
;2452:						if (dist == 1) {
ADDRLP4 1164
INDIRI4
CNSTI4 1
NEI4 $1198
line 2453
;2453:							traceDist = IRONMAN_RESPAWNPOSITION_MINDISTANCE_SHORT;
ADDRLP4 1148
CNSTF4 1135542272
ASGNF4
line 2454
;2454:							fracRequired = 0.8f;
ADDRLP4 1160
CNSTF4 1061997773
ASGNF4
line 2455
;2455:						}
LABELV $1198
line 2456
;2456:						for (up = 0; up < 2 && !good; up++) {
ADDRLP4 1152
CNSTI4 0
ASGNI4
ADDRGP4 $1203
JUMPV
LABELV $1200
line 2457
;2457:							for (side = -1; side < 2 && !good; side++) {
ADDRLP4 1144
CNSTI4 -1
ASGNI4
ADDRGP4 $1207
JUMPV
LABELV $1204
line 2458
;2458:								for (front = -1; front < 2 && !good; front++) {
ADDRLP4 1140
CNSTI4 -1
ASGNI4
ADDRGP4 $1211
JUMPV
LABELV $1208
line 2459
;2459:									if (side == 0 && front == 0) {
ADDRLP4 1168
CNSTI4 0
ASGNI4
ADDRLP4 1144
INDIRI4
ADDRLP4 1168
INDIRI4
NEI4 $1212
ADDRLP4 1140
INDIRI4
ADDRLP4 1168
INDIRI4
NEI4 $1212
line 2460
;2460:										continue;
ADDRGP4 $1209
JUMPV
LABELV $1212
line 2462
;2461:									}
;2462:									goodOrigin[0] = pos->origin[0] + (float)front * traceDist;
ADDRLP4 1124
ADDRLP4 1080
INDIRP4
INDIRF4
ADDRLP4 1140
INDIRI4
CVIF4 4
ADDRLP4 1148
INDIRF4
MULF4
ADDF4
ASGNF4
line 2463
;2463:									goodOrigin[1] = pos->origin[1] + (float)side * traceDist;
ADDRLP4 1124+4
ADDRLP4 1080
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 1144
INDIRI4
CVIF4 4
ADDRLP4 1148
INDIRF4
MULF4
ADDF4
ASGNF4
line 2464
;2464:									goodOrigin[2] = pos->origin[2] + (float)up * 64.0f;
ADDRLP4 1124+8
ADDRLP4 1080
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 1152
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 2467
;2465:									//if (WiggleSpotTelefrag(goodOrigin, ent)) {
;2466:
;2467:									if (skipvis) {
ADDRLP4 1156
INDIRI4
CNSTI4 0
EQI4 $1216
line 2468
;2468:										if (WiggleSpotTelefrag(goodOrigin, ent)) {
ADDRLP4 1124
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1172
ADDRGP4 WiggleSpotTelefrag
CALLI4
ASGNI4
ADDRLP4 1172
INDIRI4
CNSTI4 0
EQI4 $1217
line 2469
;2469:											good = qtrue;
ADDRLP4 1084
CNSTI4 1
ASGNI4
line 2470
;2470:											break;
ADDRGP4 $1210
JUMPV
line 2472
;2471:										}
;2472:									}
LABELV $1216
line 2473
;2473:									else {
line 2474
;2474:										JP_Trace(&trace, level.ironManCurrentPosition, playerMins, playerMaxs, goodOrigin, level.ironManClientNum, MASK_PLAYERSOLID | CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_NOSPAWN);
ADDRLP4 0
ARGP4
ADDRGP4 level+30580
ARGP4
ADDRGP4 playerMins
ARGP4
ADDRGP4 playerMaxs
ARGP4
ADDRLP4 1124
ARGP4
ADDRGP4 level+30596
INDIRI4
ARGI4
CNSTI4 537002259
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2476
;2475:										// make sure we could actually reach the capper from that place
;2476:										if (!trace.allsolid && !trace.startsolid && !(trace.contents & (CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_NOSPAWN)) && trace.fraction > fracRequired) { // let's be at least 0.6*min distance away
ADDRLP4 1172
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 1172
INDIRI4
NEI4 $1222
ADDRLP4 0+4
INDIRI4
ADDRLP4 1172
INDIRI4
NEI4 $1222
ADDRLP4 0+48
INDIRI4
CVIU4 4
CNSTU4 537001986
BANDU4
CNSTU4 0
NEU4 $1222
ADDRLP4 0+8
INDIRF4
ADDRLP4 1160
INDIRF4
LEF4 $1222
line 2478
;2477:											// trace back in other direction (due to patches/1-way clips only being recognized in one direction)
;2478:											VectorCopy(trace.endpos, goodOrigin);
ADDRLP4 1124
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2479
;2479:											JP_Trace(&trace, goodOrigin, playerMins, playerMaxs, level.ironManCurrentPosition, level.ironManClientNum, MASK_PLAYERSOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1124
ARGP4
ADDRGP4 playerMins
ARGP4
ADDRGP4 playerMaxs
ARGP4
ADDRGP4 level+30580
ARGP4
ADDRGP4 level+30596
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2480
;2480:											if (trace.fraction == 1.0f) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $1230
line 2481
;2481:												if (WiggleSpotTelefrag(goodOrigin, ent)) {
ADDRLP4 1124
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1176
ADDRGP4 WiggleSpotTelefrag
CALLI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 0
EQI4 $1233
line 2482
;2482:													good = qtrue;
ADDRLP4 1084
CNSTI4 1
ASGNI4
line 2483
;2483:													break;
ADDRGP4 $1210
JUMPV
LABELV $1233
line 2485
;2484:												}
;2485:											}
LABELV $1230
line 2486
;2486:										}
LABELV $1222
line 2487
;2487:									}
LABELV $1217
line 2488
;2488:								}
LABELV $1209
line 2458
ADDRLP4 1140
ADDRLP4 1140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1211
ADDRLP4 1140
INDIRI4
CNSTI4 2
GEI4 $1235
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $1208
LABELV $1235
LABELV $1210
line 2489
;2489:							}
LABELV $1205
line 2457
ADDRLP4 1144
ADDRLP4 1144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1207
ADDRLP4 1144
INDIRI4
CNSTI4 2
GEI4 $1236
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $1204
LABELV $1236
line 2490
;2490:						}
LABELV $1201
line 2456
ADDRLP4 1152
ADDRLP4 1152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1203
ADDRLP4 1152
INDIRI4
CNSTI4 2
GEI4 $1237
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $1200
LABELV $1237
line 2491
;2491:					}
LABELV $1195
line 2451
ADDRLP4 1164
ADDRLP4 1164
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1197
ADDRLP4 1164
INDIRI4
CNSTI4 2
GEI4 $1238
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $1194
LABELV $1238
line 2492
;2492:				}
LABELV $1191
line 2450
ADDRLP4 1156
ADDRLP4 1156
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1193
ADDRLP4 1156
INDIRI4
CNSTI4 2
GEI4 $1239
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $1190
LABELV $1239
line 2493
;2493:				if (!good) {
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1189
line 2494
;2494:					VectorCopy(pos->origin, goodOrigin);
ADDRLP4 1124
ADDRLP4 1080
INDIRP4
INDIRB
ASGNB 12
line 2495
;2495:					good = WiggleSpotTelefrag(goodOrigin, ent);
ADDRLP4 1124
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 WiggleSpotTelefrag
CALLI4
ASGNI4
ADDRLP4 1084
ADDRLP4 1168
INDIRI4
ASGNI4
line 2496
;2496:				}
line 2497
;2497:			}
ADDRGP4 $1189
JUMPV
LABELV $1188
line 2498
;2498:			else {
line 2499
;2499:				VectorCopy(pos->origin, goodOrigin);
ADDRLP4 1124
ADDRLP4 1080
INDIRP4
INDIRB
ASGNB 12
line 2500
;2500:				good = WiggleSpotTelefrag(goodOrigin, ent);
ADDRLP4 1124
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 WiggleSpotTelefrag
CALLI4
ASGNI4
ADDRLP4 1084
ADDRLP4 1140
INDIRI4
ASGNI4
line 2501
;2501:			}
LABELV $1189
line 2505
;2502:
;2503:
;2504:
;2505:			if (good) {
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $1242
line 2507
;2506:				// ok found a good pos
;2507:				VectorCopy(pos->velocity, spawn_velocity);
ADDRFP4 12
INDIRP4
ADDRLP4 1080
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 2508
;2508:				VectorSubtract(level.ironManCurrentPosition,goodOrigin,delta);
ADDRLP4 1088
ADDRGP4 level+30580
INDIRF4
ADDRLP4 1124
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+4
ADDRGP4 level+30580+4
INDIRF4
ADDRLP4 1124+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+8
ADDRGP4 level+30580+8
INDIRF4
ADDRLP4 1124+8
INDIRF4
SUBF4
ASGNF4
line 2509
;2509:				VectorNormalize(delta);
ADDRLP4 1088
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2510
;2510:				vectoangles(delta, spawn_angles); // look at the iron man
ADDRLP4 1088
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2511
;2511:				spawn_angles[ROLL] = spawn_angles[PITCH] = 0;
ADDRLP4 1140
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1144
CNSTF4 0
ASGNF4
ADDRLP4 1140
INDIRP4
ADDRLP4 1144
INDIRF4
ASGNF4
ADDRLP4 1140
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 1144
INDIRF4
ASGNF4
line 2522
;2512:
;2513:				//VectorCopy(pos->velocity, velNorm);
;2514:				//speed = VectorNormalize(velNorm);
;2515:				//if (speed > 10) {
;2516:				//	vectoangles(velNorm, spawn_angles);
;2517:				//	spawn_angles[ROLL] = spawn_angles[PITCH] = 0;
;2518:				//}
;2519:				//else {
;2520:				//	VectorCopy(pos->angles,spawn_angles);
;2521:				//}
;2522:				VectorCopy(goodOrigin, spawn_origin);
ADDRFP4 4
INDIRP4
ADDRLP4 1124
INDIRB
ASGNB 12
line 2523
;2523:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1150
JUMPV
LABELV $1242
line 2526
;2524:			}
;2525:
;2526:		}
LABELV $1186
line 2528
;2527:
;2528:	}
LABELV $1160
line 2409
ADDRLP4 1100
ADDRLP4 1100
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1162
CNSTI4 0
ADDRGP4 level+32600
INDIRI4
CNSTI4 50
SUBI4
CNSTI4 1
ADDI4
LEI4 $1253
ADDRLP4 1116
CNSTI4 0
ASGNI4
ADDRGP4 $1254
JUMPV
LABELV $1253
ADDRLP4 1116
ADDRGP4 level+32600
INDIRI4
CNSTI4 50
SUBI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1254
ADDRLP4 1100
INDIRI4
ADDRLP4 1116
INDIRI4
GEI4 $1159
line 2529
;2529:	return qfalse;
CNSTI4 0
RETI4
LABELV $1150
endproc G_CheckForCloserIronmanSpawn 1180 28
bss
align 4
LABELV $1256
skip 42060
export ClientSpawn
code
proc ClientSpawn 968 28
line 2545
;2530:
;2531:	
;2532:}
;2533:
;2534:/*
;2535:===========
;2536:ClientSpawn
;2537:
;2538:Called every time a client is placed fresh in the world:
;2539:after the first ClientBegin, and after each respawn
;2540:Initializes all non-persistant parts of playerState
;2541:============
;2542:*/
;2543:extern qboolean WP_HasForcePowers( const playerState_t *ps );
;2544:extern void RestorePosition(gentity_t* client, savedPosition_t* savedPosition, veci_t* diffAccum);
;2545:void ClientSpawn(gentity_t *ent) {
line 2559
;2546:	int		index;
;2547:	vec3_t	spawn_origin, spawn_angles;
;2548:	gclient_t	*client;
;2549:	int		i;
;2550:#if SEGMENTEDDEBUG
;2551:	static clientPersistant_t	saved;
;2552:#else
;2553:	static clientPersistant_t	saved;
;2554:#endif
;2555:	clientSession_t		savedSess;
;2556:	vec3_t				savedDeltaAngles;
;2557:	int		persistant[MAX_PERSISTANT];
;2558:	gentity_t	*spawnPoint;
;2559:	qboolean	lastSpawnPointRaceValid = qfalse;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 2569
;2560:	int		flags;
;2561:	int		savedPing;
;2562:	int		savedCommandTime;
;2563://	char	*savedAreaBits;
;2564:	int		accuracy_hits, accuracy_shots;
;2565:	int		eventSequence;
;2566://	char	userinfo[MAX_INFO_STRING];
;2567:	forcedata_t			savedForce;
;2568:	void		*ghoul2save;
;2569:	int		saveSaberNum = ENTITYNUM_NONE;
ADDRLP4 128
CNSTI4 1023
ASGNI4
line 2570
;2570:	int		wDisable = 0;
ADDRLP4 100
CNSTI4 0
ASGNI4
line 2571
;2571:	qboolean	inSegmentedRun = qfalse;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 2572
;2572:	qboolean	raceSpawnPossible = qfalse;
ADDRLP4 104
CNSTI4 0
ASGNI4
line 2573
;2573:	qboolean	useSavedSpawn = qfalse;
ADDRLP4 88
CNSTI4 0
ASGNI4
line 2574
;2574:	int			nowTime = LEVELTIME(ent->client); // at the start of a client (ClientBegin) pers.cmd.serverTime is empty
ADDRLP4 816
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 816
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1261
ADDRLP4 816
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1261
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1263
ADDRLP4 812
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1264
JUMPV
LABELV $1263
ADDRLP4 812
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1264
ADDRLP4 808
ADDRLP4 812
INDIRI4
ASGNI4
ADDRGP4 $1262
JUMPV
LABELV $1261
ADDRLP4 808
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1262
ADDRLP4 92
ADDRLP4 808
INDIRI4
ASGNI4
line 2576
;2575:	vec3_t		spawn_velocity;
;2576:	qboolean	spawn_velocity_set = qfalse;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 2578
;2577:
;2578:	index = ent - g_entities;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ASGNI4
line 2579
;2579:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 2581
;2580:
;2581:	if ( ent->client->ps.saberInFlight && ent->client->ps.saberEntityNum >= MAX_CLIENTS && ent->client->ps.saberEntityNum < MAX_GENTITIES )
ADDRLP4 820
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 820
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1265
ADDRLP4 824
ADDRLP4 820
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
ADDRLP4 824
INDIRI4
CNSTI4 32
LTI4 $1265
ADDRLP4 824
INDIRI4
CNSTI4 1024
GEI4 $1265
line 2582
;2582:	{
line 2583
;2583:		gentity_t *saberent = &g_entities[ent->client->ps.saberEntityNum];
ADDRLP4 828
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
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2585
;2584:
;2585:		if ( saberent && saberent->inuse && saberent->r.ownerNum == ent-g_entities && saberent->touch == thrownSaberTouch )
ADDRLP4 828
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1267
ADDRLP4 828
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1267
ADDRLP4 828
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
NEI4 $1267
ADDRLP4 828
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 thrownSaberTouch
CVPU4 4
NEU4 $1267
line 2586
;2586:		{
line 2587
;2587:			saberent->touch = SaberGotHit;
ADDRLP4 828
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 SaberGotHit
ASGNP4
line 2588
;2588:			saberent->think = SaberUpdateSelf;
ADDRLP4 828
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 2589
;2589:			/*if ( jk2gameplay == VERSION_1_04 )*/ saberent->bolt_Head = 0; // MVSDK: This shouldn't affect gameplay.
ADDRLP4 828
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 0
ASGNI4
line 2590
;2590:			saberent->nextthink = level.time;
ADDRLP4 828
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2592
;2591:
;2592:			MakeDeadSaber(saberent);
ADDRLP4 828
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 2594
;2593:
;2594:			saberent->r.svFlags |= (SVF_NOCLIENT);
ADDRLP4 836
ADDRLP4 828
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 836
INDIRP4
ADDRLP4 836
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2595
;2595:			saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRLP4 828
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 2596
;2596:			VectorSet( saberent->r.mins, -SABER_BOX_SIZE, -SABER_BOX_SIZE, -SABER_BOX_SIZE );
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1273
ADDRLP4 840
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1274
JUMPV
LABELV $1273
ADDRLP4 840
CNSTF4 1098907648
ASGNF4
LABELV $1274
ADDRLP4 828
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 840
INDIRF4
NEGF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1275
ADDRLP4 844
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1276
JUMPV
LABELV $1275
ADDRLP4 844
CNSTF4 1098907648
ASGNF4
LABELV $1276
ADDRLP4 828
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 844
INDIRF4
NEGF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1277
ADDRLP4 848
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1278
JUMPV
LABELV $1277
ADDRLP4 848
CNSTF4 1098907648
ASGNF4
LABELV $1278
ADDRLP4 828
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 848
INDIRF4
NEGF4
ASGNF4
line 2597
;2597:			VectorSet( saberent->r.maxs, SABER_BOX_SIZE, SABER_BOX_SIZE, SABER_BOX_SIZE );
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1282
ADDRLP4 852
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1283
JUMPV
LABELV $1282
ADDRLP4 852
CNSTF4 1098907648
ASGNF4
LABELV $1283
ADDRLP4 828
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 852
INDIRF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1284
ADDRLP4 856
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1285
JUMPV
LABELV $1284
ADDRLP4 856
CNSTF4 1098907648
ASGNF4
LABELV $1285
ADDRLP4 828
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 856
INDIRF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1286
ADDRLP4 860
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1287
JUMPV
LABELV $1286
ADDRLP4 860
CNSTF4 1098907648
ASGNF4
LABELV $1287
ADDRLP4 828
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 860
INDIRF4
ASGNF4
line 2598
;2598:			saberent->s.loopSound = 0;
ADDRLP4 828
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 2600
;2599:
;2600:			ent->client->ps.saberInFlight = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 2601
;2601:			ent->client->ps.saberThrowDelay = nowTime + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
ADDRLP4 92
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2602
;2602:			ent->client->ps.saberCanThrow = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 2603
;2603:		}
LABELV $1267
line 2604
;2604:	}
LABELV $1265
line 2606
;2605:
;2606:	if (client->ps.fd.forceDoInit)
ADDRLP4 0
INDIRP4
CNSTI4 1184
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1288
line 2607
;2607:	{ //force a reread of force powers
line 2608
;2608:		WP_InitForcePowers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_InitForcePowers
CALLV
pop
line 2609
;2609:		client->ps.fd.forceDoInit = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1184
ADDP4
CNSTI4 0
ASGNI4
line 2610
;2610:	}
LABELV $1288
line 2612
;2611:
;2612:	inSegmentedRun = client->sess.sessionTeam != TEAM_SPECTATOR && DF_ClientInSegmentedRunMode(client) && client->pers.segmented.state >= SEG_RECORDING_HAVELASTPOS && client->pers.segmented.state < SEG_REPLAY;
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1291
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 836
ADDRGP4 DF_ClientInSegmentedRunMode
CALLI4
ASGNI4
ADDRLP4 836
INDIRI4
CNSTI4 0
EQI4 $1291
ADDRLP4 840
ADDRLP4 0
INDIRP4
CNSTI4 22084
ADDP4
INDIRI4
ASGNI4
ADDRLP4 840
INDIRI4
CNSTI4 2
LTI4 $1291
ADDRLP4 840
INDIRI4
CNSTI4 4
GEI4 $1291
ADDRLP4 828
CNSTI4 1
ASGNI4
ADDRGP4 $1292
JUMPV
LABELV $1291
ADDRLP4 828
CNSTI4 0
ASGNI4
LABELV $1292
ADDRLP4 72
ADDRLP4 828
INDIRI4
ASGNI4
line 2614
;2613:
;2614:	raceSpawnPossible = client->sess.sessionTeam != TEAM_SPECTATOR && client->sess.raceMode && client->pers.savedSpawnUsed;
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1294
ADDRLP4 852
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 852
INDIRI4
EQI4 $1294
ADDRLP4 0
INDIRP4
CNSTI4 22048
ADDP4
INDIRI4
ADDRLP4 852
INDIRI4
EQI4 $1294
ADDRLP4 844
CNSTI4 1
ASGNI4
ADDRGP4 $1295
JUMPV
LABELV $1294
ADDRLP4 844
CNSTI4 0
ASGNI4
LABELV $1295
ADDRLP4 104
ADDRLP4 844
INDIRI4
ASGNI4
line 2615
;2615:	useSavedSpawn = raceSpawnPossible && !inSegmentedRun && !memcmp(&client->sess.raceStyle, &client->pers.savedSpawnRaceStyle, sizeof(client->sess.raceStyle));
ADDRLP4 860
CNSTI4 0
ASGNI4
ADDRLP4 104
INDIRI4
ADDRLP4 860
INDIRI4
EQI4 $1297
ADDRLP4 72
INDIRI4
ADDRLP4 860
INDIRI4
NEI4 $1297
ADDRLP4 0
INDIRP4
CNSTI4 43492
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 22052
ADDP4
ARGP4
CNSTU4 12
ARGU4
ADDRLP4 868
ADDRGP4 memcmp
CALLI4
ASGNI4
ADDRLP4 868
INDIRI4
CNSTI4 0
NEI4 $1297
ADDRLP4 856
CNSTI4 1
ASGNI4
ADDRGP4 $1298
JUMPV
LABELV $1297
ADDRLP4 856
CNSTI4 0
ASGNI4
LABELV $1298
ADDRLP4 88
ADDRLP4 856
INDIRI4
ASGNI4
line 2617
;2616:
;2617:	if (raceSpawnPossible && !useSavedSpawn && !inSegmentedRun) {
ADDRLP4 872
CNSTI4 0
ASGNI4
ADDRLP4 104
INDIRI4
ADDRLP4 872
INDIRI4
EQI4 $1299
ADDRLP4 88
INDIRI4
ADDRLP4 872
INDIRI4
NEI4 $1299
ADDRLP4 72
INDIRI4
ADDRLP4 872
INDIRI4
NEI4 $1299
line 2618
;2618:		G_CenterPrint(ent - g_entities,3, "^1Warning: ^7Your spawn point is not valid for your changed race settings.",qfalse,qtrue,qfalse,NULL);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 $1301
ARGP4
ADDRLP4 876
CNSTI4 0
ASGNI4
ADDRLP4 876
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 876
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_CenterPrint
CALLV
pop
line 2619
;2619:	}
LABELV $1299
line 2624
;2620:
;2621:	// find a spawn point
;2622:	// do it before setting health back up, so farthest
;2623:	// ranging doesn't count this client
;2624:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1302
line 2625
;2625:		spawnPoint = SelectSpectatorSpawnPoint ( 
ADDRLP4 108
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 876
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 96
ADDRLP4 876
INDIRP4
ASGNP4
line 2627
;2626:						spawn_origin, spawn_angles);
;2627:		lastSpawnPointRaceValid = qfalse;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 2628
;2628:	} else if (inSegmentedRun) {
ADDRGP4 $1303
JUMPV
LABELV $1302
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $1304
line 2629
;2629:		spawnPoint = NULL;
ADDRLP4 96
CNSTP4 0
ASGNP4
line 2630
;2630:		VectorCopy(client->pers.segmented.lastPos.ps.origin, spawn_origin);
ADDRLP4 108
ADDRLP4 0
INDIRP4
CNSTI4 32288
ADDP4
INDIRB
ASGNB 12
line 2631
;2631:		VectorCopy(client->pers.segmented.lastPos.ps.viewangles, spawn_angles);
ADDRLP4 140
ADDRLP4 0
INDIRP4
CNSTI4 32424
ADDP4
INDIRB
ASGNB 12
line 2632
;2632:		client->pers.segmented.respos = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 22092
ADDP4
CNSTI4 1
ASGNI4
line 2633
;2633:	} else if (useSavedSpawn) {
ADDRGP4 $1305
JUMPV
LABELV $1304
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $1306
line 2634
;2634:		spawnPoint = NULL;
ADDRLP4 96
CNSTP4 0
ASGNP4
line 2635
;2635:		VectorCopy(client->pers.savedSpawn.ps.origin, spawn_origin);
ADDRLP4 108
ADDRLP4 0
INDIRP4
CNSTI4 11900
ADDP4
INDIRB
ASGNB 12
line 2636
;2636:		VectorCopy(client->pers.savedSpawn.ps.viewangles, spawn_angles);
ADDRLP4 140
ADDRLP4 0
INDIRP4
CNSTI4 12036
ADDP4
INDIRB
ASGNB 12
line 2637
;2637:	} else if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY) {
ADDRGP4 $1307
JUMPV
LABELV $1306
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $1312
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $1308
LABELV $1312
line 2639
;2638:		// all base oriented team games use the CTF spawn points
;2639:		spawnPoint = SelectCTFSpawnPoint ( ent,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1640
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 880
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 96
ADDRLP4 880
INDIRP4
ASGNP4
line 2643
;2640:						client->sess.sessionTeam, 
;2641:						client->pers.teamState.state, 
;2642:						spawn_origin, spawn_angles);
;2643:		lastSpawnPointRaceValid = qfalse;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 2644
;2644:	}
ADDRGP4 $1309
JUMPV
LABELV $1308
line 2645
;2645:	else if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $1313
line 2646
;2646:	{
line 2647
;2647:		spawnPoint = SelectSagaSpawnPoint ( ent,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1640
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 880
ADDRGP4 SelectSagaSpawnPoint
CALLP4
ASGNP4
ADDRLP4 96
ADDRLP4 880
INDIRP4
ASGNP4
line 2651
;2648:						client->sess.sessionTeam, 
;2649:						client->pers.teamState.state, 
;2650:						spawn_origin, spawn_angles);
;2651:		lastSpawnPointRaceValid = qfalse;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 2652
;2652:	}
ADDRGP4 $1314
JUMPV
LABELV $1313
line 2653
;2653:	else {
line 2654
;2654:		int iters = 1;
ADDRLP4 876
CNSTI4 1
ASGNI4
LABELV $1316
line 2655
;2655:		do {
line 2657
;2656:			// the first spawn should be at a good looking spot
;2657:			if ( !client->pers.initialSpawn && client->pers.localClient ) {
ADDRLP4 884
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1416
ADDP4
INDIRI4
ADDRLP4 884
INDIRI4
NEI4 $1319
ADDRLP4 0
INDIRP4
CNSTI4 1412
ADDP4
INDIRI4
ADDRLP4 884
INDIRI4
EQI4 $1319
line 2658
;2658:				client->pers.initialSpawn = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1416
ADDP4
CNSTI4 1
ASGNI4
line 2659
;2659:				spawnPoint = SelectInitialSpawnPoint( ent,spawn_origin, spawn_angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 888
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 96
ADDRLP4 888
INDIRP4
ASGNP4
line 2660
;2660:			} else {
ADDRGP4 $1320
JUMPV
LABELV $1319
line 2662
;2661:				// don't spawn near existing origin if possible
;2662:				spawnPoint = SelectSpawnPoint ( ent,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 888
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 96
ADDRLP4 888
INDIRP4
ASGNP4
line 2665
;2663:					client->ps.origin, 
;2664:					spawn_origin, spawn_angles);
;2665:			}
LABELV $1320
line 2669
;2666:
;2667:			// Tim needs to prevent bots from spawning at the initial point
;2668:			// on q3dm0...
;2669:			if ( ( spawnPoint->flags & FL_NO_BOTS ) && ( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 888
CNSTI4 0
ASGNI4
ADDRLP4 96
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
ADDRLP4 888
INDIRI4
EQI4 $1321
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 888
INDIRI4
EQI4 $1321
line 2670
;2670:				continue;	// try again
ADDRGP4 $1317
JUMPV
LABELV $1321
line 2673
;2671:			}
;2672:			// just to be symetric, we have a nohumans option...
;2673:			if ( ( spawnPoint->flags & FL_NO_HUMANS ) && !( ent->r.svFlags & SVF_BOT ) ) {
ADDRLP4 892
CNSTI4 0
ASGNI4
ADDRLP4 96
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
ADDRLP4 892
INDIRI4
EQI4 $1323
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 892
INDIRI4
NEI4 $1323
line 2674
;2674:				continue;	// try again
ADDRGP4 $1317
JUMPV
LABELV $1323
line 2677
;2675:			}
;2676:
;2677:			lastSpawnPointRaceValid = qtrue;
ADDRLP4 132
CNSTI4 1
ASGNI4
line 2679
;2678:
;2679:			break;
ADDRGP4 $1318
JUMPV
LABELV $1317
line 2681
;2680:
;2681:		} while (iters-- > 0); // TA: this looks like it could potentially cause an infinite loop. limit it to 2.
ADDRLP4 880
ADDRLP4 876
INDIRI4
ASGNI4
ADDRLP4 876
ADDRLP4 880
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 880
INDIRI4
CNSTI4 0
GTI4 $1316
LABELV $1318
line 2682
;2682:		if (!spawnPoint) {
ADDRLP4 96
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1325
line 2684
;2683:
;2684:			G_Error("Couldn't find a spawn point (#3)");
ADDRGP4 $1327
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 2685
;2685:		}
LABELV $1325
line 2686
;2686:	}
LABELV $1314
LABELV $1309
LABELV $1307
LABELV $1305
LABELV $1303
line 2688
;2687:
;2688:	if (client->sess.mode == MODE_IRONMAN && !client->isIronMan) {
ADDRLP4 0
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1328
ADDRLP4 0
INDIRP4
CNSTI4 53188
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1328
line 2689
;2689:		if (G_CheckForCloserIronmanSpawn(ent,spawn_origin,spawn_angles,spawn_velocity)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 796
ARGP4
ADDRLP4 880
ADDRGP4 G_CheckForCloserIronmanSpawn
CALLI4
ASGNI4
ADDRLP4 880
INDIRI4
CNSTI4 0
EQI4 $1330
line 2690
;2690:			spawnPoint = NULL;
ADDRLP4 96
CNSTP4 0
ASGNP4
line 2691
;2691:			spawn_velocity_set = qtrue;
ADDRLP4 136
CNSTI4 1
ASGNI4
line 2692
;2692:		}
LABELV $1330
line 2693
;2693:	}
LABELV $1328
line 2695
;2694:
;2695:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 0
INDIRP4
CNSTI4 1640
ADDP4
CNSTI4 1
ASGNI4
line 2697
;2696:
;2697:	if (g_arenaAutoGen.integer && !level.hasArenaInfo) {
ADDRLP4 880
CNSTI4 0
ASGNI4
ADDRGP4 g_arenaAutoGen+12
INDIRI4
ADDRLP4 880
INDIRI4
EQI4 $1332
ADDRGP4 level+29500
INDIRI4
ADDRLP4 880
INDIRI4
NEI4 $1332
line 2698
;2698:		level.mustGenerateArena = qtrue;
ADDRGP4 level+29508
CNSTI4 1
ASGNI4
line 2699
;2699:	}
LABELV $1332
line 2703
;2700:
;2701:	// toggle the teleport bit so the client knows to not lerp
;2702:	// and never clear the voted flag
;2703:	flags = ent->client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 2704
;2704:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 124
ADDRLP4 124
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 2708
;2705:
;2706:	// clear everything but the persistant data
;2707:
;2708:	saved = client->pers;
ADDRGP4 $1256
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
INDIRB
ASGNB 42060
line 2709
;2709:	savedSess = client->sess;
ADDRLP4 152
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRB
ASGNB 148
line 2710
;2710:	VectorCopySafe(client->ps.delta_angles, savedDeltaAngles);
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 76+4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 76+8
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 2711
;2711:	savedPing = client->ps.ping;
ADDRLP4 300
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
ASGNI4
line 2712
;2712:	savedCommandTime = client->ps.commandTime;
ADDRLP4 304
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 2714
;2713://	savedAreaBits = client->areabits;
;2714:	accuracy_hits = client->accuracy_hits;
ADDRLP4 308
ADDRLP4 0
INDIRP4
CNSTI4 43668
ADDP4
INDIRI4
ASGNI4
line 2715
;2715:	accuracy_shots = client->accuracy_shots;
ADDRLP4 312
ADDRLP4 0
INDIRP4
CNSTI4 43664
ADDP4
INDIRI4
ASGNI4
line 2716
;2716:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1339
line 2717
;2717:		persistant[i] = client->ps.persistant[i];
ADDRLP4 888
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 888
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 888
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDP4
INDIRI4
ASGNI4
line 2718
;2718:	}
LABELV $1340
line 2716
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $1339
line 2719
;2719:	eventSequence = client->ps.eventSequence;
ADDRLP4 316
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ASGNI4
line 2721
;2720:
;2721:	savedForce = client->ps.fd;
ADDRLP4 320
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRB
ASGNB 472
line 2723
;2722:
;2723:	ghoul2save = client->ghoul2;
ADDRLP4 792
ADDRLP4 0
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ASGNP4
line 2725
;2724:
;2725:	saveSaberNum = client->ps.saberEntityNum;
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 2727
;2726:
;2727:	G_BufferedSendOrPrintFlush(ent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_BufferedSendOrPrintFlush
CALLV
pop
line 2728
;2728:	memset (client, 0, sizeof(*client)); // bk FIXME: Com_Memset?
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 53196
ARGU4
ADDRGP4 memset
CALLP4
pop
line 2730
;2729:
;2730:	VectorCopySafe(savedDeltaAngles, client->ps.delta_angles); // to make sure my segmented runs work
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 76
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 76+4
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 76+8
INDIRF4
CVFI4 4
ASGNI4
line 2733
;2731:
;2732:	//rww - Don't wipe the ghoul2 instance or the animation data
;2733:	client->ghoul2 = ghoul2save;
ADDRLP4 0
INDIRP4
CNSTI4 43740
ADDP4
ADDRLP4 792
INDIRP4
ASGNP4
line 2736
;2734:
;2735:	//or the saber ent num
;2736:	client->ps.saberEntityNum = saveSaberNum;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 128
INDIRI4
ASGNI4
line 2738
;2737:
;2738:	client->ps.fd = savedForce;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRLP4 320
INDIRB
ASGNB 472
line 2740
;2739:
;2740:	client->ps.duelIndex = ENTITYNUM_NONE;
ADDRLP4 0
INDIRP4
CNSTI4 1296
ADDP4
CNSTI4 1023
ASGNI4
line 2742
;2741:
;2742:	client->pers = saved;
ADDRLP4 0
INDIRP4
CNSTI4 1380
ADDP4
ADDRGP4 $1256
INDIRB
ASGNB 42060
line 2743
;2743:	client->sess = savedSess;
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
ADDRLP4 152
INDIRB
ASGNB 148
line 2744
;2744:	client->ps.ping = savedPing;
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 300
INDIRI4
ASGNI4
line 2746
;2745://	client->areabits = savedAreaBits;
;2746:	client->accuracy_hits = accuracy_hits;
ADDRLP4 0
INDIRP4
CNSTI4 43668
ADDP4
ADDRLP4 308
INDIRI4
ASGNI4
line 2747
;2747:	client->accuracy_shots = accuracy_shots;
ADDRLP4 0
INDIRP4
CNSTI4 43664
ADDP4
ADDRLP4 312
INDIRI4
ASGNI4
line 2748
;2748:	client->lastkilled_client = -1;
ADDRLP4 0
INDIRP4
CNSTI4 43672
ADDP4
CNSTI4 -1
ASGNI4
line 2750
;2749:
;2750:	for ( i = 0 ; i < MAX_PERSISTANT ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1345
line 2751
;2751:		client->ps.persistant[i] = persistant[i];
ADDRLP4 888
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 888
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDP4
ADDRLP4 888
INDIRI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 2752
;2752:	}
LABELV $1346
line 2750
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $1345
line 2753
;2753:	client->ps.eventSequence = eventSequence;
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 316
INDIRI4
ASGNI4
line 2755
;2754:	// increment the spawncount so the client will detect the respawn
;2755:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 888
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 888
INDIRP4
ADDRLP4 888
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2756
;2756:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 2758
;2757:
;2758:	client->airOutTime = nowTime + 12000;
ADDRLP4 0
INDIRP4
CNSTI4 43712
ADDP4
ADDRLP4 92
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 2762
;2759:
;2760://	trap_GetUserinfo( index, userinfo, sizeof(userinfo) );
;2761:	// set max health
;2762:	client->pers.maxHealth = 100;//atoi( Info_ValueForKey( userinfo, "handicap" ) );
ADDRLP4 0
INDIRP4
CNSTI4 1624
ADDP4
CNSTI4 100
ASGNI4
line 2763
;2763:	if ( client->pers.maxHealth < 1 || client->pers.maxHealth > 100 ) {
ADDRLP4 896
ADDRLP4 0
INDIRP4
CNSTI4 1624
ADDP4
INDIRI4
ASGNI4
ADDRLP4 896
INDIRI4
CNSTI4 1
LTI4 $1351
ADDRLP4 896
INDIRI4
CNSTI4 100
LEI4 $1349
LABELV $1351
line 2764
;2764:		client->pers.maxHealth = 100;
ADDRLP4 0
INDIRP4
CNSTI4 1624
ADDP4
CNSTI4 100
ASGNI4
line 2765
;2765:	}
LABELV $1349
line 2767
;2766:	// clear entity values
;2767:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1624
ADDP4
INDIRI4
ASGNI4
line 2768
;2768:	client->ps.eFlags = flags;
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 124
INDIRI4
ASGNI4
line 2770
;2769:
;2770:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 1023
ASGNI4
line 2771
;2771:	ent->client = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
CNSTI4 53196
ADDRLP4 120
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 2772
;2772:	ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 2773
;2773:	ent->inuse = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 2774
;2774:	G_SetClassName(ent, "player");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1352
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 2775
;2775:	ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 256
ASGNI4
line 2776
;2776:	ent->clipmask = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 273
ASGNI4
line 2777
;2777:	ent->die = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 player_die
ASGNP4
line 2778
;2778:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 0
ASGNI4
line 2779
;2779:	ent->watertype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
CNSTI4 0
ASGNI4
line 2780
;2780:	ent->flags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 0
ASGNI4
line 2782
;2781:
;2782:	ResetClientModeIfInvalid(ent, (qboolean)!(ent->r.svFlags& SVF_BOT));
ADDRLP4 908
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 908
INDIRP4
ARGP4
ADDRLP4 908
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $1354
ADDRLP4 904
CNSTI4 1
ASGNI4
ADDRGP4 $1355
JUMPV
LABELV $1354
ADDRLP4 904
CNSTI4 0
ASGNI4
LABELV $1355
ADDRLP4 904
INDIRI4
ARGI4
ADDRGP4 ResetClientModeIfInvalid
CALLV
pop
line 2801
;2783:	//if (!g_defrag.integer) {
;2784:	//	DF_SetRaceMode(ent,qfalse);
;2785:	//	//if (client->sess.raceMode) {
;2786:	//	//	client->sess.raceMode = qfalse;
;2787:	//	//	Cmd_ForceChanged_f(ent);
;2788:	//	//}
;2789:	//	//else {
;2790:	//	//	client->sess.raceMode = qfalse;
;2791:	//	//}
;2792:	//}
;2793:
;2794:	//if (client->sess.raceMode)
;2795:	//	client->ps.stats[STAT_RACEMODE] = 1;
;2796:	//else
;2797:	//	client->ps.stats[STAT_RACEMODE] = 0;
;2798:
;2799:	//client->ps.stats[STAT_MOVEMENTSTYLE] = client->sess.raceStyle.movementStyle;
;2800:	//client->ps.stats[STAT_RUNFLAGS] = client->sess.raceStyle.runFlags;
;2801:	UpdateClientRaceVars(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 UpdateClientRaceVars
CALLV
pop
line 2803
;2802:
;2803:	if (client->sess.raceMode && client->sess.raceStyle.movementStyle == MV_BOUNCE) {
ADDRLP4 0
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1356
ADDRLP4 0
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
CNSTI4 6
NEI4 $1356
line 2804
;2804:		client->ps.stats[STAT_BOUNCEPOWER] = BOUNCEPOWER_MAX;
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
CNSTI4 500
ASGNI4
line 2805
;2805:	}
ADDRGP4 $1357
JUMPV
LABELV $1356
line 2806
;2806:	else if (client->sess.raceMode && client->sess.raceStyle.movementStyle == MV_CHARGEJUMP) {
ADDRLP4 0
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1358
ADDRLP4 0
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
CNSTI4 12
NEI4 $1358
line 2807
;2807:		client->ps.stats[STAT_CHARGEJUMPDATA] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
CNSTI4 0
ASGNI4
line 2808
;2808:	}
ADDRGP4 $1359
JUMPV
LABELV $1358
line 2809
;2809:	else {
line 2810
;2810:		client->ps.stats[STAT_BOUNCEPOWER] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
CNSTI4 0
ASGNI4
line 2811
;2811:	}
LABELV $1359
LABELV $1357
line 2814
;2812:
;2813:	
;2814:	VectorCopy (playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 2815
;2815:	VectorCopy (playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 2817
;2816:
;2817:	client->ps.clientNum = index;
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 120
INDIRI4
ASGNI4
line 2819
;2818:	//give default weapons
;2819:	client->ps.stats[STAT_WEAPONS] = ( 1 << WP_NONE );
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 1
ASGNI4
line 2821
;2820:
;2821:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1360
line 2822
;2822:	{
line 2823
;2823:		wDisable = g_duelWeaponDisable.integer;
ADDRLP4 100
ADDRGP4 g_duelWeaponDisable+12
INDIRI4
ASGNI4
line 2824
;2824:	}
ADDRGP4 $1361
JUMPV
LABELV $1360
line 2826
;2825:	else
;2826:	{
line 2827
;2827:		wDisable = g_weaponDisable.integer;
ADDRLP4 100
ADDRGP4 g_weaponDisable+12
INDIRI4
ASGNI4
line 2828
;2828:	}
LABELV $1361
line 2830
;2829:
;2830:	if ( jk2gameplay == VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1365
line 2831
;2831:	{
line 2832
;2832:		if (g_gametype.integer == GT_HOLOCRON)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $1367
line 2833
;2833:		{
line 2835
;2834:			//always get free saber level 1 in holocron
;2835:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SABER );	//these are precached in g_items, ClearRegisteredItems()
ADDRLP4 920
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 920
INDIRP4
ADDRLP4 920
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 2836
;2836:		}
ADDRGP4 $1368
JUMPV
LABELV $1367
line 2838
;2837:		else
;2838:		{
line 2839
;2839:			if (client->ps.fd.forcePowerLevel[FP_SABERATTACK])
ADDRLP4 0
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1370
line 2840
;2840:			{
line 2841
;2841:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SABER );	//these are precached in g_items, ClearRegisteredItems()
ADDRLP4 920
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 920
INDIRP4
ADDRLP4 920
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 2842
;2842:			}
ADDRGP4 $1371
JUMPV
LABELV $1370
line 2844
;2843:			else
;2844:			{ //if you don't have saber attack rank then you don't get a saber
line 2845
;2845:				client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 920
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 920
INDIRP4
ADDRLP4 920
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 2846
;2846:			}
LABELV $1371
line 2847
;2847:		}
LABELV $1368
line 2849
;2848:		
;2849:		if (!wDisable || !(wDisable & (1 << WP_BRYAR_PISTOL)))
ADDRLP4 924
CNSTI4 0
ASGNI4
ADDRLP4 100
INDIRI4
ADDRLP4 924
INDIRI4
EQI4 $1374
ADDRLP4 100
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 924
INDIRI4
NEI4 $1372
LABELV $1374
line 2850
;2850:		{
line 2851
;2851:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 928
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 928
INDIRP4
ADDRLP4 928
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2852
;2852:		}
ADDRGP4 $1373
JUMPV
LABELV $1372
line 2853
;2853:		else if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $1375
line 2854
;2854:		{
line 2855
;2855:			client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 928
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 928
INDIRP4
ADDRLP4 928
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2856
;2856:		}
LABELV $1375
LABELV $1373
line 2858
;2857:
;2858:		if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $1378
line 2859
;2859:		{
line 2860
;2860:			client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_SABER);
ADDRLP4 928
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 928
INDIRP4
ADDRLP4 928
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2861
;2861:			client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 932
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 932
INDIRP4
ADDRLP4 932
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 2862
;2862:		}
LABELV $1378
line 2864
;2863:
;2864:		if (client->ps.stats[STAT_WEAPONS] & (1 << WP_BRYAR_PISTOL) && (!g_defrag.integer || !(client->ps.stats[STAT_WEAPONS] & (1 << WP_SABER))))
ADDRLP4 928
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
ADDRLP4 932
CNSTI4 0
ASGNI4
ADDRLP4 928
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 932
INDIRI4
EQI4 $1381
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 932
INDIRI4
EQI4 $1384
ADDRLP4 928
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 932
INDIRI4
NEI4 $1381
LABELV $1384
line 2865
;2865:		{
line 2866
;2866:			client->ps.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 2867
;2867:		}
ADDRGP4 $1366
JUMPV
LABELV $1381
line 2868
;2868:		else if (client->ps.stats[STAT_WEAPONS] & (1 << WP_SABER))
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1385
line 2869
;2869:		{
line 2870
;2870:			client->ps.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 2871
;2871:		}
ADDRGP4 $1366
JUMPV
LABELV $1385
line 2873
;2872:		else
;2873:		{
line 2874
;2874:			client->ps.weapon = WP_STUN_BATON;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 2875
;2875:		}
line 2876
;2876:	}
ADDRGP4 $1366
JUMPV
LABELV $1365
line 2878
;2877:	else
;2878:	{
line 2879
;2879:		if ( g_gametype.integer != GT_HOLOCRON 
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $1387
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $1387
ADDRLP4 920
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 920
INDIRI4
CNSTI4 0
NEI4 $1387
ADDRGP4 g_forcePowerDisable+12
INDIRI4
ARGI4
ADDRLP4 924
ADDRGP4 AllForceDisabled
CALLI4
ASGNI4
ADDRLP4 928
CNSTI4 0
ASGNI4
ADDRLP4 924
INDIRI4
ADDRLP4 928
INDIRI4
NEI4 $1387
ADDRGP4 g_trueJedi+12
INDIRI4
ADDRLP4 928
INDIRI4
EQI4 $1387
line 2884
;2880:			&& g_gametype.integer != GT_JEDIMASTER 
;2881:			&& !HasSetSaberOnly()
;2882:			&& !AllForceDisabled( g_forcePowerDisable.integer )
;2883:			&& g_trueJedi.integer )
;2884:		{
line 2885
;2885:			if ( jk2gameplay == VERSION_1_04 && g_gametype.integer >= GT_TEAM && (client->sess.sessionTeam == TEAM_BLUE || client->sess.sessionTeam == TEAM_RED) )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1393
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $1393
ADDRLP4 932
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
ADDRLP4 932
INDIRI4
CNSTI4 2
EQI4 $1396
ADDRLP4 932
INDIRI4
CNSTI4 1
NEI4 $1393
LABELV $1396
line 2886
;2886:			{//In Team games, force one side to be merc and other to be jedi
line 2887
;2887:				if ( level.numPlayingClients > 0 )
ADDRGP4 level+92
INDIRI4
CNSTI4 0
LEI4 $1397
line 2888
;2888:				{//already someone in the game
line 2890
;2889:					int		i;
;2890:					team_t	forceTeam = TEAM_SPECTATOR;
ADDRLP4 940
CNSTI4 3
ASGNI4
line 2891
;2891:					for ( i = 0 ; i < level.maxclients ; i++ ) 
ADDRLP4 936
CNSTI4 0
ASGNI4
ADDRGP4 $1403
JUMPV
LABELV $1400
line 2892
;2892:					{
line 2893
;2893:						if ( level.clients[i].pers.connected == CON_DISCONNECTED ) {
CNSTI4 53196
ADDRLP4 936
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1405
line 2894
;2894:							continue;
ADDRGP4 $1401
JUMPV
LABELV $1405
line 2896
;2895:						}
;2896:						if ( level.clients[i].sess.sessionTeam == TEAM_BLUE || level.clients[i].sess.sessionTeam == TEAM_RED ) 
ADDRLP4 944
CNSTI4 53196
ADDRLP4 936
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
ADDRLP4 944
INDIRI4
CNSTI4 2
EQI4 $1409
ADDRLP4 944
INDIRI4
CNSTI4 1
NEI4 $1407
LABELV $1409
line 2897
;2897:						{//in-game
line 2898
;2898:							if ( WP_HasForcePowers( &level.clients[i].ps ) )
CNSTI4 53196
ADDRLP4 936
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ARGP4
ADDRLP4 948
ADDRGP4 WP_HasForcePowers
CALLI4
ASGNI4
ADDRLP4 948
INDIRI4
CNSTI4 0
EQI4 $1410
line 2899
;2899:							{//this side is using force
line 2900
;2900:								forceTeam = level.clients[i].sess.sessionTeam;
ADDRLP4 940
CNSTI4 53196
ADDRLP4 936
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
ASGNI4
line 2901
;2901:							}
ADDRGP4 $1402
JUMPV
LABELV $1410
line 2903
;2902:							else
;2903:							{//other team is using force
line 2904
;2904:								if ( level.clients[i].sess.sessionTeam == TEAM_BLUE )
CNSTI4 53196
ADDRLP4 936
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1412
line 2905
;2905:								{
line 2906
;2906:									forceTeam = TEAM_RED;
ADDRLP4 940
CNSTI4 1
ASGNI4
line 2907
;2907:								}
ADDRGP4 $1402
JUMPV
LABELV $1412
line 2909
;2908:								else
;2909:								{
line 2910
;2910:									forceTeam = TEAM_BLUE;
ADDRLP4 940
CNSTI4 2
ASGNI4
line 2911
;2911:								}
line 2912
;2912:							}
line 2913
;2913:							break;
ADDRGP4 $1402
JUMPV
LABELV $1407
line 2915
;2914:						}
;2915:					}
LABELV $1401
line 2891
ADDRLP4 936
ADDRLP4 936
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1403
ADDRLP4 936
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $1400
LABELV $1402
line 2916
;2916:					if ( WP_HasForcePowers( &client->ps ) && client->sess.sessionTeam != forceTeam )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 944
ADDRGP4 WP_HasForcePowers
CALLI4
ASGNI4
ADDRLP4 944
INDIRI4
CNSTI4 0
EQI4 $1414
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRLP4 940
INDIRI4
EQI4 $1414
line 2917
;2917:					{//using force but not on right team, switch him over
line 2918
;2918:						const char *teamName = TeamName( forceTeam );
ADDRLP4 940
INDIRI4
ARGI4
ADDRLP4 952
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRLP4 948
ADDRLP4 952
INDIRP4
ASGNP4
line 2920
;2919:						//client->sess.sessionTeam = forceTeam;
;2920:						SetTeam( ent, (char *)teamName );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 948
INDIRP4
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 2921
;2921:						return;
ADDRGP4 $1255
JUMPV
LABELV $1414
line 2923
;2922:					}
;2923:				}
LABELV $1397
line 2924
;2924:			}
LABELV $1393
line 2926
;2925:
;2926:			if ( WP_HasForcePowers( &client->ps ) )
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 936
ADDRGP4 WP_HasForcePowers
CALLI4
ASGNI4
ADDRLP4 936
INDIRI4
CNSTI4 0
EQI4 $1416
line 2927
;2927:			{
line 2928
;2928:				client->ps.trueNonJedi = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 2929
;2929:				client->ps.trueJedi = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 2931
;2930:				//make sure they only use the saber
;2931:				client->ps.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 2932
;2932:				client->ps.stats[STAT_WEAPONS] = (1 << WP_SABER);
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 4
ASGNI4
line 2933
;2933:			}
ADDRGP4 $1388
JUMPV
LABELV $1416
line 2935
;2934:			else
;2935:			{//no force powers set
line 2936
;2936:				client->ps.trueNonJedi = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 1
ASGNI4
line 2937
;2937:				client->ps.trueJedi = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 2938
;2938:				if (!wDisable || !(wDisable & (1 << WP_BRYAR_PISTOL)))
ADDRLP4 944
CNSTI4 0
ASGNI4
ADDRLP4 100
INDIRI4
ADDRLP4 944
INDIRI4
EQI4 $1420
ADDRLP4 100
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 944
INDIRI4
NEI4 $1418
LABELV $1420
line 2939
;2939:				{
line 2940
;2940:					client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 948
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 948
INDIRP4
ADDRLP4 948
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2941
;2941:				}
LABELV $1418
line 2942
;2942:				if ( jk2gameplay == VERSION_1_04 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1421
line 2943
;2943:				{
line 2944
;2944:					if (!wDisable || !(wDisable & (1 << WP_BLASTER)))
ADDRLP4 952
CNSTI4 0
ASGNI4
ADDRLP4 100
INDIRI4
ADDRLP4 952
INDIRI4
EQI4 $1425
ADDRLP4 100
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 952
INDIRI4
NEI4 $1423
LABELV $1425
line 2945
;2945:					{
line 2946
;2946:						client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BLASTER );
ADDRLP4 956
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 956
INDIRP4
ADDRLP4 956
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 2947
;2947:					}
LABELV $1423
line 2948
;2948:					if (!wDisable || !(wDisable & (1 << WP_BOWCASTER)))
ADDRLP4 960
CNSTI4 0
ASGNI4
ADDRLP4 100
INDIRI4
ADDRLP4 960
INDIRI4
EQI4 $1428
ADDRLP4 100
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 960
INDIRI4
NEI4 $1426
LABELV $1428
line 2949
;2949:					{
line 2950
;2950:						client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BOWCASTER );
ADDRLP4 964
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 964
INDIRP4
ADDRLP4 964
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 2951
;2951:					}
LABELV $1426
line 2952
;2952:				}
LABELV $1421
line 2953
;2953:				client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_SABER);
ADDRLP4 948
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 948
INDIRP4
ADDRLP4 948
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2954
;2954:				client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 952
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 952
INDIRP4
ADDRLP4 952
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 2955
;2955:				client->ps.ammo[AMMO_POWERCELL] = ammoData[AMMO_POWERCELL].max;
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
ADDRGP4 ammoData+12
INDIRI4
ASGNI4
line 2956
;2956:				if (g_defrag.integer && (client->ps.stats[STAT_WEAPONS] & (1 << WP_SABER))) {
ADDRLP4 956
CNSTI4 0
ASGNI4
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 956
INDIRI4
EQI4 $1430
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 956
INDIRI4
EQI4 $1430
line 2957
;2957:					client->ps.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 2958
;2958:				}
ADDRGP4 $1388
JUMPV
LABELV $1430
line 2959
;2959:				else {
line 2960
;2960:					client->ps.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 2961
;2961:				}
line 2962
;2962:			}
line 2963
;2963:		}
ADDRGP4 $1388
JUMPV
LABELV $1387
line 2965
;2964:		else
;2965:		{//jediVmerc is incompatible with this gametype, turn it off!
line 2966
;2966:			if ( jk2gameplay == VERSION_1_04 ) trap_Cvar_Set( "g_jediVmerc", "0" ); // MVSDK: I don't know what happens if you try jediVmerc with one of the incompatible gametypes, but maybe you end up with some special kind of jedi-master gametype... // FIXME: Check if jediVmerc with incompatible gametypes has some bad side-effects.
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1433
ADDRGP4 $1435
ARGP4
ADDRGP4 $123
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $1433
line 2967
;2967:			if (g_gametype.integer == GT_HOLOCRON)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $1436
line 2968
;2968:			{
line 2970
;2969:				//always get free saber level 1 in holocron
;2970:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SABER );	//these are precached in g_items, ClearRegisteredItems()
ADDRLP4 932
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 932
INDIRP4
ADDRLP4 932
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 2971
;2971:			}
ADDRGP4 $1437
JUMPV
LABELV $1436
line 2973
;2972:			else
;2973:			{
line 2974
;2974:				if (client->ps.fd.forcePowerLevel[FP_SABERATTACK])
ADDRLP4 0
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1439
line 2975
;2975:				{
line 2976
;2976:					client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_SABER );	//these are precached in g_items, ClearRegisteredItems()
ADDRLP4 932
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 932
INDIRP4
ADDRLP4 932
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 2977
;2977:				}
ADDRGP4 $1440
JUMPV
LABELV $1439
line 2979
;2978:				else
;2979:				{ //if you don't have saber attack rank then you don't get a saber
line 2980
;2980:					client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 932
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 932
INDIRP4
ADDRLP4 932
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 2981
;2981:				}
LABELV $1440
line 2982
;2982:			}
LABELV $1437
line 2984
;2983:
;2984:			if (!wDisable || !(wDisable & (1 << WP_BRYAR_PISTOL)))
ADDRLP4 936
CNSTI4 0
ASGNI4
ADDRLP4 100
INDIRI4
ADDRLP4 936
INDIRI4
EQI4 $1443
ADDRLP4 100
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 936
INDIRI4
NEI4 $1441
LABELV $1443
line 2985
;2985:			{
line 2986
;2986:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 940
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 940
INDIRP4
ADDRLP4 940
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2987
;2987:			}
ADDRGP4 $1442
JUMPV
LABELV $1441
line 2988
;2988:			else if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $1444
line 2989
;2989:			{
line 2990
;2990:				client->ps.stats[STAT_WEAPONS] |= ( 1 << WP_BRYAR_PISTOL );
ADDRLP4 940
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 940
INDIRP4
ADDRLP4 940
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2991
;2991:			}
LABELV $1444
LABELV $1442
line 2993
;2992:
;2993:			if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $1447
line 2994
;2994:			{
line 2995
;2995:				client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_SABER);
ADDRLP4 940
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 940
INDIRP4
ADDRLP4 940
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2996
;2996:				client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
ADDRLP4 944
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 944
INDIRP4
ADDRLP4 944
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 2997
;2997:			}
LABELV $1447
line 2999
;2998:
;2999:			if (client->ps.stats[STAT_WEAPONS] & (1 << WP_BRYAR_PISTOL) && (!g_defrag.integer || !(client->ps.stats[STAT_WEAPONS] & (1 << WP_SABER))))
ADDRLP4 940
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
ADDRLP4 944
CNSTI4 0
ASGNI4
ADDRLP4 940
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 944
INDIRI4
EQI4 $1450
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 944
INDIRI4
EQI4 $1453
ADDRLP4 940
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 944
INDIRI4
NEI4 $1450
LABELV $1453
line 3000
;3000:			{
line 3001
;3001:				client->ps.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 3002
;3002:			}
ADDRGP4 $1451
JUMPV
LABELV $1450
line 3003
;3003:			else if (client->ps.stats[STAT_WEAPONS] & (1 << WP_SABER))
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1454
line 3004
;3004:			{
line 3005
;3005:				client->ps.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 3006
;3006:			}
ADDRGP4 $1455
JUMPV
LABELV $1454
line 3008
;3007:			else
;3008:			{
line 3009
;3009:				client->ps.weapon = WP_STUN_BATON;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 3010
;3010:			}
LABELV $1455
LABELV $1451
line 3011
;3011:		}
LABELV $1388
line 3012
;3012:	}
LABELV $1366
line 3015
;3013:
;3014:
;3015:	switch (client->sess.mode) {
ADDRLP4 920
ADDRLP4 0
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
ASGNI4
ADDRLP4 920
INDIRI4
CNSTI4 1
LTI4 $1457
ADDRLP4 920
INDIRI4
CNSTI4 5
GTI4 $1457
ADDRLP4 920
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1462-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1462
address $1457
address $1460
address $1461
address $1461
address $1461
code
line 3018
;3016:		case MODE_NORMAL:
;3017:		default:
;3018:			break;
LABELV $1460
line 3020
;3019:		case MODE_DEFRAG:
;3020:			client->ps.stats[STAT_WEAPONS] = (1 << WP_SABER) + (1 << WP_DISRUPTOR) + (1 << WP_STUN_BATON);
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 38
ASGNI4
line 3021
;3021:			client->ps.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 3022
;3022:			break;
ADDRGP4 $1457
JUMPV
LABELV $1461
line 3026
;3023:		case MODE_DUEL:
;3024:		case MODE_ALLFORCE:
;3025:		case MODE_IRONMAN:
;3026:			client->ps.stats[STAT_WEAPONS] = 1 << WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 4
ASGNI4
line 3027
;3027:			client->ps.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 3028
;3028:			break;
LABELV $1457
line 3036
;3029:	}
;3030:
;3031:	/*
;3032:	client->ps.stats[STAT_HOLDABLE_ITEMS] |= ( 1 << HI_BINOCULARS );
;3033:	client->ps.stats[STAT_HOLDABLE_ITEM] = BG_GetItemIndexByTag(HI_BINOCULARS, IT_HOLDABLE);
;3034:	*/
;3035:
;3036:	client->ps.stats[STAT_HOLDABLE_ITEMS] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
line 3037
;3037:	client->ps.stats[STAT_HOLDABLE_ITEM] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 0
ASGNI4
line 3039
;3038:
;3039:	if ( client->sess.sessionTeam == TEAM_SPECTATOR )
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1464
line 3040
;3040:	{
line 3041
;3041:		client->ps.stats[STAT_WEAPONS] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 0
ASGNI4
line 3042
;3042:		client->ps.stats[STAT_HOLDABLE_ITEMS] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
line 3043
;3043:		client->ps.stats[STAT_HOLDABLE_ITEM] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 0
ASGNI4
line 3044
;3044:	}
LABELV $1464
line 3046
;3045:
;3046:	client->ps.ammo[AMMO_BLASTER] = 100; //ammoData[AMMO_BLASTER].max; //100 seems fair.
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 100
ASGNI4
line 3059
;3047://	client->ps.ammo[AMMO_POWERCELL] = ammoData[AMMO_POWERCELL].max;
;3048://	client->ps.ammo[AMMO_FORCE] = ammoData[AMMO_FORCE].max;
;3049://	client->ps.ammo[AMMO_METAL_BOLTS] = ammoData[AMMO_METAL_BOLTS].max;
;3050://	client->ps.ammo[AMMO_ROCKETS] = ammoData[AMMO_ROCKETS].max;
;3051:/*
;3052:	client->ps.stats[STAT_WEAPONS] = ( 1 << WP_BRYAR_PISTOL);
;3053:	if ( g_gametype.integer == GT_TEAM ) {
;3054:		client->ps.ammo[WP_BRYAR_PISTOL] = 50;
;3055:	} else {
;3056:		client->ps.ammo[WP_BRYAR_PISTOL] = 100;
;3057:	}
;3058:*/
;3059:	client->ps.rocketLockIndex = MAX_CLIENTS;
ADDRLP4 0
INDIRP4
CNSTI4 580
ADDP4
CNSTI4 32
ASGNI4
line 3060
;3060:	client->ps.rocketLockTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 3071
;3061:
;3062:	//rww - Set here to initialize the circling seeker drone to off.
;3063:	//A quick note about this so I don't forget how it works again:
;3064:	//ps.genericEnemyIndex is kept in sync between the server and client.
;3065:	//When it gets set then an entitystate value of the same name gets
;3066:	//set along with an entitystate flag in the shared bg code. Which
;3067:	//is why a value needs to be both on the player state and entity state.
;3068:	//(it doesn't seem to just carry over the entitystate value automatically
;3069:	//because entity state value is derived from player state data or some
;3070:	//such)
;3071:	client->ps.genericEnemyIndex = -1;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 -1
ASGNI4
line 3073
;3072:
;3073:	client->ps.isJediMaster = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
CNSTI4 0
ASGNI4
line 3075
;3074:
;3075:	client->ps.fallingToDeath = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1352
ADDP4
CNSTI4 0
ASGNI4
line 3078
;3076:
;3077:	//Do per-spawn force power initialization
;3078:	WP_SpawnInitForcePowers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_SpawnInitForcePowers
CALLV
pop
line 3081
;3079:
;3080:	// health will count down towards max_health
;3081:	ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] * 1.25;
ADDRLP4 932
CNSTF4 1067450368
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 932
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 932
INDIRI4
ASGNI4
line 3084
;3082:
;3083:	// Start with a small amount of armor as well.
;3084:	client->ps.stats[STAT_ARMOR] = client->ps.stats[STAT_MAX_HEALTH] * 0.25;
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
CNSTF4 1048576000
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 3086
;3085:
;3086:	G_SetOrigin( ent, spawn_origin );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 3087
;3087:	VectorCopy( spawn_origin, client->ps.origin );
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 108
INDIRB
ASGNB 12
line 3090
;3088:
;3089:	// the respawned flag will be cleared after the attack and jump keys come up
;3090:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 940
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 940
INDIRP4
ADDRLP4 940
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 3092
;3091:
;3092:	G_GetUserCmd(client - level.clients, &ent->client->pers.cmd, GETUSERCMD_NOADVANCE);
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 53196
DIVI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_GetUserCmd
CALLI4
pop
line 3093
;3093:	if(!useSavedSpawn){
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $1466
line 3094
;3094:		DF_PreDeltaAngleChange(ent->client);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 DF_PreDeltaAngleChange
CALLV
pop
line 3095
;3095:		SetClientViewAngle(ent, spawn_angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 3096
;3096:		DF_PostDeltaAngleChange(ent->client,qtrue);
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
line 3097
;3097:	}
LABELV $1466
line 3099
;3098:
;3099:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1468
line 3101
;3100:
;3101:	} else {
ADDRGP4 $1469
JUMPV
LABELV $1468
line 3102
;3102:		G_KillBox( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 3103
;3103:		trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3106
;3104:
;3105:		// force the base weapon up
;3106:		client->ps.weapon = WP_BRYAR_PISTOL;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 3107
;3107:		client->ps.weaponstate = FIRST_WEAPON;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 3
ASGNI4
line 3109
;3108:
;3109:	}
LABELV $1469
line 3112
;3110:
;3111:	// don't allow full run speed for a bit
;3112:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 944
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 944
INDIRP4
ADDRLP4 944
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 3113
;3113:	client->ps.pm_time = 100;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 3115
;3114:
;3115:	client->respawnTime = nowTime;
ADDRLP4 0
INDIRP4
CNSTI4 43684
ADDP4
ADDRLP4 92
INDIRI4
ASGNI4
line 3116
;3116:	client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRLP4 0
INDIRP4
CNSTI4 43688
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3117
;3117:	client->inactivityToSpecTime = level.time + g_inactivityToSpec.integer * 1000;
ADDRLP4 0
INDIRP4
CNSTI4 43692
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivityToSpec+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 3118
;3118:	client->latched_buttons = 0;
ADDRLP4 0
INDIRP4
CNSTI4 43616
ADDP4
CNSTI4 0
ASGNI4
line 3121
;3119:
;3120:	// set default animations
;3121:	client->ps.torsoAnim = WeaponReadyAnim[client->ps.weapon];
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ASGNI4
line 3122
;3122:	client->ps.legsAnim = WeaponReadyAnim[client->ps.weapon];
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
ASGNI4
line 3124
;3123:
;3124:	if ( level.intermissiontime ) {
ADDRGP4 level+9028
INDIRI4
CNSTI4 0
EQI4 $1474
line 3125
;3125:		MoveClientToIntermission( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 3126
;3126:	} else {
ADDRGP4 $1475
JUMPV
LABELV $1474
line 3128
;3127:		// fire the targets of the spawn point
;3128:		if (spawnPoint) {
ADDRLP4 96
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1477
line 3129
;3129:			G_UseTargets(spawnPoint, ent);
ADDRLP4 96
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 3130
;3130:		}
LABELV $1477
line 3132
;3131:
;3132:		client->ps.weapon = 1;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 3133
;3133:		if ((client->ps.stats[STAT_WEAPONS] & (1 << WP_SABER)) && (client->sess.raceMode || g_startWeaponAlwaysSaber.integer)) { // TA: Always prefer saber
ADDRLP4 960
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 960
INDIRI4
EQI4 $1479
ADDRLP4 0
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 960
INDIRI4
NEI4 $1482
ADDRGP4 g_startWeaponAlwaysSaber+12
INDIRI4
ADDRLP4 960
INDIRI4
EQI4 $1479
LABELV $1482
line 3134
;3134:			client->ps.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 3135
;3135:		}
ADDRGP4 $1480
JUMPV
LABELV $1479
line 3136
;3136:		else {
line 3140
;3137:			// select the highest weapon number available, after any
;3138:			// spawn given items have fired
;3139:			// TA: this is chaotic. ps.weapon is set like 3 times in this whole function or more wtf. first with logic, then hard to bryar, and then here
;3140:			for (i = WP_NUM_WEAPONS - 1; i > 0; i--) {
ADDRLP4 4
CNSTI4 15
ASGNI4
LABELV $1483
line 3141
;3141:				if (client->ps.stats[STAT_WEAPONS] & (1 << i)) {
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $1487
line 3142
;3142:					client->ps.weapon = i;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 3143
;3143:					break;
ADDRGP4 $1485
JUMPV
LABELV $1487
line 3145
;3144:				}
;3145:			}
LABELV $1484
line 3140
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
GTI4 $1483
LABELV $1485
line 3146
;3146:		}
LABELV $1480
line 3147
;3147:	}
LABELV $1475
line 3149
;3148:
;3149:	if (spawn_velocity_set) {
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $1489
line 3150
;3150:		VectorCopy(spawn_velocity, client->ps.velocity);
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 796
INDIRB
ASGNB 12
line 3151
;3151:	}
LABELV $1489
line 3153
;3152:
;3153:	if (spawnPoint && lastSpawnPointRaceValid) {
ADDRLP4 96
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1491
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $1491
line 3154
;3154:		client->pers.lastSpawnPoint = spawnPoint - g_entities;
ADDRLP4 0
INDIRP4
CNSTI4 43428
ADDP4
ADDRLP4 96
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ASGNI4
line 3155
;3155:	}
LABELV $1491
line 3159
;3156:
;3157:	// run a client frame to drop exactly to the floor,
;3158:	// initialize animations and other things
;3159:	if (!inSegmentedRun) {
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $1493
line 3161
;3160:		// dont do in racemode in segmented runs and with start spawn
;3161:		client->ps.commandTime = nowTime - 100;
ADDRLP4 0
INDIRP4
ADDRLP4 92
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 3162
;3162:		ent->client->pers.cmd.serverTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ADDRLP4 92
INDIRI4
ASGNI4
line 3163
;3163:		if (spawn_velocity_set) {
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $1495
line 3164
;3164:			ent->client->pers.cmd.upmove = 127; // jump to preserve the velocity if needed? might need more tweaking
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1410
ADDP4
CNSTI1 127
ASGNI1
line 3165
;3165:		}
LABELV $1495
line 3166
;3166:		ClientThink(ent - g_entities);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 3167
;3167:	}
ADDRGP4 $1494
JUMPV
LABELV $1493
line 3168
;3168:	else {
line 3169
;3169:		client->ps.commandTime = (savedCommandTime >0) ? savedCommandTime : nowTime; // how will things work out when fps anti toggle is active?
ADDRLP4 304
INDIRI4
CNSTI4 0
LEI4 $1498
ADDRLP4 956
ADDRLP4 304
INDIRI4
ASGNI4
ADDRGP4 $1499
JUMPV
LABELV $1498
ADDRLP4 956
ADDRLP4 92
INDIRI4
ASGNI4
LABELV $1499
ADDRLP4 0
INDIRP4
ADDRLP4 956
INDIRI4
ASGNI4
line 3170
;3170:	}
LABELV $1494
line 3174
;3171:	
;3172:
;3173:	// positively link the client, even if the command times are weird
;3174:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1500
line 3175
;3175:		BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 3176
;3176:		VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 956
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 956
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 956
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3177
;3177:		trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3178
;3178:	}
LABELV $1500
line 3180
;3179:
;3180:	if (g_spawnInvulnerability.integer && !ent->client->sess.raceMode)
ADDRLP4 956
CNSTI4 0
ASGNI4
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
ADDRLP4 956
INDIRI4
EQI4 $1502
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 956
INDIRI4
NEI4 $1502
line 3181
;3181:	{
line 3182
;3182:		ent->client->ps.eFlags |= EF_INVULNERABLE;
ADDRLP4 960
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 960
INDIRP4
ADDRLP4 960
INDIRP4
INDIRI4
CNSTI4 67108864
BORI4
ASGNI4
line 3183
;3183:		ent->client->invulnerableTimer = nowTime + g_spawnInvulnerability.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43588
ADDP4
ADDRLP4 92
INDIRI4
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
ADDI4
ASGNI4
line 3184
;3184:	}
LABELV $1502
line 3187
;3185:
;3186:	// run the presend to set anything else
;3187:	if ( ent->client->sess.spectatorState != SPECTATOR_FOLLOW )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1506
line 3188
;3188:	{ // Only do this if we're not dealing with follow spectators to prevent two bugs:
line 3191
;3189:	  // 1) follow spectators turning into free spectators at map_restart, because the client they were following has a higher client number and isn't ingame, yet
;3190:	  // 2) follow spectators corrupting their s.number in BG_PlayerStateToEntityState, cause they get the other client's playerState in ClientEndFrame
;3191:		if (ent->client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1508
line 3192
;3192:			SpectatorClientEndFrame(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpectatorClientEndFrame
CALLV
pop
line 3193
;3193:		}
ADDRGP4 $1509
JUMPV
LABELV $1508
line 3194
;3194:		else {
line 3195
;3195:			ClientEndFrame(ent,qtrue); // is the qtrue logical? just trying to keep things consistent with how they were while making defrag more deterministic
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ClientEndFrame
CALLV
pop
line 3196
;3196:		}
LABELV $1509
line 3197
;3197:	}
LABELV $1506
line 3199
;3198:
;3199:	if (useSavedSpawn) {
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $1510
line 3200
;3200:		RestorePosition(ent, &client->pers.savedSpawn, client->pers.segmented.anglesDiffAccum);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 11880
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 42448
ADDP4
ARGP4
ADDRGP4 RestorePosition
CALLV
pop
line 3201
;3201:	}
LABELV $1510
line 3204
;3202:
;3203:	// clear entity state values
;3204:	BG_PlayerStateToEntityState( &client->ps, &ent->s, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 3206
;3205:
;3206:	if (!inSegmentedRun) {
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $1512
line 3207
;3207:		DF_RaceStateInvalidated(ent,qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 DF_RaceStateInvalidated
CALLV
pop
line 3208
;3208:		ent->client->sess.raceStateInvalidated = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43516
ADDP4
CNSTI4 0
ASGNI4
line 3209
;3209:		ent->client->pers.antiLoop.yawAngleChangeSinceBaseSpeed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43344
ADDP4
CNSTF4 0
ASGNF4
line 3210
;3210:		if (ent->client->pers.lastRaceTimerStartedCP > level.time-3000) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43408
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
CNSTI4 3000
SUBI4
LEI4 $1514
line 3211
;3211:			G_CenterPrint(ent - g_entities, 3, "", qfalse, qtrue, qfalse, NULL); // just send an empty cp to clear the screen of the old "Timer started!"
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 $130
ARGP4
ADDRLP4 960
CNSTI4 0
ASGNI4
ADDRLP4 960
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 960
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_CenterPrint
CALLV
pop
line 3212
;3212:			ent->client->pers.lastRaceTimerStartedCP = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43408
ADDP4
CNSTI4 0
ASGNI4
line 3213
;3213:		}
LABELV $1514
line 3214
;3214:	}
LABELV $1512
line 3215
;3215:}
LABELV $1255
endproc ClientSpawn 968 28
export ClientDisconnectFinish
proc ClientDisconnectFinish 20 20
line 3219
;3216:
;3217:extern qboolean DF_RemoveCheckPoints(gentity_t* playerent);
;3218:
;3219:void ClientDisconnectFinish(int clientNum, gentity_t* ent) {
line 3226
;3220:	gentity_t* tent;
;3221:	int			i;
;3222:
;3223:	// remove this player as the activator from any activated ents
;3224:	// is this actually safe? what if some ent just expects the activator to be a valid ent?
;3225:	// yea better just check activator->inuse...
;3226:	G_ClearEntityActivator(ent); // this one not needed prolly cuz client has no activator, but lets be safe.
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_ClearEntityActivator
CALLV
pop
line 3227
;3227:	G_ClearActivatedEntities(ent);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_ClearActivatedEntities
CALLV
pop
line 3228
;3228:	DF_ClearCheckPointTimes(ent);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 DF_ClearCheckPointTimes
CALLV
pop
line 3229
;3229:	G_ResetUserCmdStore(ent - g_entities);
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 G_ResetUserCmdStore
CALLV
pop
line 3231
;3230:
;3231:	DF_RemoveCheckPoints(ent);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 DF_RemoveCheckPoints
CALLI4
pop
line 3233
;3232:
;3233:	if (ent->client->pers.recordingDemo) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43088
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1518
line 3235
;3234:
;3235:		ent->client->pers.recordingDemo = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43088
ADDP4
CNSTI4 0
ASGNI4
line 3236
;3236:		ent->client->pers.demoStoppedTime = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43164
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3237
;3237:		if (!ent->client->pers.keepDemoMaybe) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43092
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1521
line 3238
;3238:			trap_SendConsoleCommand(EXEC_APPEND, va("svstoprecord %i;svrenamedemo \"%s\" \"%strash/trash%d\"\n", ent - g_entities, ent->client->pers.tempDemoName, level.tempDemoNamePrefix, ent - g_entities));
ADDRGP4 $1523
ARGP4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ASGNI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43096
ADDP4
ARGP4
ADDRGP4 level+32612
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 3239
;3239:		}
ADDRGP4 $1522
JUMPV
LABELV $1521
line 3240
;3240:		else {
line 3241
;3241:			trap_SendConsoleCommand(EXEC_APPEND, va("svstoprecord %i\n", ent - g_entities, ent->client->pers.tempDemoName, ent - g_entities));
ADDRGP4 $1525
ARGP4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ASGNI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43096
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 3242
;3242:		}
LABELV $1522
line 3243
;3243:	}
LABELV $1518
line 3245
;3244:
;3245:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1527
JUMPV
LABELV $1526
line 3248
;3246:
;3247:	while (i < NUM_FORCE_POWERS)
;3248:	{
line 3249
;3249:		if (ent->client->ps.fd.forcePowersActive & (1 << i))
ADDRFP4 4
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
EQI4 $1529
line 3250
;3250:		{
line 3251
;3251:			WP_ForcePowerStop(ent, i);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 WP_ForcePowerStop
CALLV
pop
line 3252
;3252:		}
LABELV $1529
line 3253
;3253:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3254
;3254:	}
LABELV $1527
line 3247
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $1526
line 3256
;3255:
;3256:	i = TRACK_CHANNEL_1;
ADDRLP4 0
CNSTI4 51
ASGNI4
ADDRGP4 $1532
JUMPV
LABELV $1531
line 3259
;3257:
;3258:	while (i < NUM_TRACK_CHANNELS)
;3259:	{
line 3260
;3260:		if (ent->client->ps.fd.killSoundEntIndex[i - 50] && ent->client->ps.fd.killSoundEntIndex[i - 50] < MAX_GENTITIES && ent->client->ps.fd.killSoundEntIndex[i - 50] > 0)
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1534
ADDRLP4 8
INDIRI4
CNSTI4 1024
GEI4 $1534
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $1534
line 3261
;3261:		{
line 3262
;3262:			G_MuteSound(ent->client->ps.fd.killSoundEntIndex[i - 50], CHAN_VOICE);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 200
SUBI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1200
ADDP4
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 3263
;3263:		}
LABELV $1534
line 3264
;3264:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3265
;3265:	}
LABELV $1532
line 3258
ADDRLP4 0
INDIRI4
CNSTI4 56
LTI4 $1531
line 3266
;3266:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3269
;3267:
;3268:	// stop any following clients
;3269:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1539
JUMPV
LABELV $1536
line 3270
;3270:		if (level.clients[i].sess.sessionTeam == TEAM_SPECTATOR
ADDRLP4 8
CNSTI4 53196
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1541
ADDRLP4 8
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1541
ADDRLP4 8
INDIRP4
CNSTI4 43452
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1541
line 3272
;3271:			&& level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW
;3272:			&& level.clients[i].sess.spectatorClient == clientNum) {
line 3273
;3273:			StopFollowing(&g_entities[i]);
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 3274
;3274:		}
LABELV $1541
line 3275
;3275:	}
LABELV $1537
line 3269
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1539
ADDRLP4 0
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $1536
line 3278
;3276:
;3277:	// send effect if they were completely connected
;3278:	if (ent->client->pers.connected == CON_CONNECTED
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1543
ADDRLP4 8
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1543
line 3279
;3279:		&& ent->client->sess.sessionTeam != TEAM_SPECTATOR) {
line 3280
;3280:		tent = G_TempEntity(ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT);
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 60
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 3281
;3281:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 16
CNSTI4 220
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 3285
;3282:
;3283:		// They don't get to take powerups with them!
;3284:		// Especially important for stuff like CTF flags
;3285:		TossClientItems(ent);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 3286
;3286:	}
LABELV $1543
line 3288
;3287:
;3288:	G_LogPrintf("ClientDisconnect: %i\n", clientNum);
ADDRGP4 $1545
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 3291
;3289:
;3290:	// if we are playing in tourney mode, give a win to the other player and clear his frags for this round
;3291:	if ((g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1546
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 level+9028
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $1546
ADDRGP4 level+20
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $1546
line 3293
;3292:		&& !level.intermissiontime
;3293:		&& !level.warmupTime) {
line 3294
;3294:		if (level.sortedClients[1] == clientNum) {
ADDRGP4 level+96+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1551
line 3295
;3295:			level.clients[level.sortedClients[0]].ps.persistant[PERS_SCORE] = 0;
CNSTI4 53196
ADDRGP4 level+96
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 280
ADDP4
CNSTI4 0
ASGNI4
line 3296
;3296:			level.clients[level.sortedClients[0]].sess.wins++;
ADDRLP4 16
CNSTI4 53196
ADDRGP4 level+96
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43456
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3297
;3297:			ClientUserinfoChanged(level.sortedClients[0]);
ADDRGP4 level+96
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 3298
;3298:		}
ADDRGP4 $1552
JUMPV
LABELV $1551
line 3299
;3299:		else if (level.sortedClients[0] == clientNum) {
ADDRGP4 level+96
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1558
line 3300
;3300:			level.clients[level.sortedClients[1]].ps.persistant[PERS_SCORE] = 0;
CNSTI4 53196
ADDRGP4 level+96+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 280
ADDP4
CNSTI4 0
ASGNI4
line 3301
;3301:			level.clients[level.sortedClients[1]].sess.wins++;
ADDRLP4 16
CNSTI4 53196
ADDRGP4 level+96+4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 43456
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3302
;3302:			ClientUserinfoChanged(level.sortedClients[1]);
ADDRGP4 level+96+4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 3303
;3303:		}
LABELV $1558
LABELV $1552
line 3304
;3304:	}
LABELV $1546
line 3306
;3305:
;3306:	trap_UnlinkEntity(ent);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 3307
;3307:	ent->s.modelindex = 0;
ADDRFP4 4
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 3308
;3308:	ent->inuse = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 0
ASGNI4
line 3309
;3309:	G_SetClassName(ent, "disconnected");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $1567
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 3310
;3310:	ent->client->pers.connected = CON_DISCONNECTED;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
CNSTI4 0
ASGNI4
line 3311
;3311:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 292
ADDP4
CNSTI4 0
ASGNI4
line 3312
;3312:	ent->client->sess.sessionTeam = TEAM_FREE;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
CNSTI4 0
ASGNI4
line 3314
;3313:
;3314:	trap_SetConfigstring(CS_PLAYERS + clientNum, "");
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRGP4 $130
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 3316
;3315:
;3316:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 3318
;3317:
;3318:	if (ent->r.svFlags & SVF_BOT) {
ADDRFP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1568
line 3319
;3319:		BotAIShutdownClient(clientNum, qfalse);
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 3320
;3320:	}
LABELV $1568
line 3322
;3321:
;3322:	G_ClearClientLog(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_ClearClientLog
CALLV
pop
line 3323
;3323:}
LABELV $1517
endproc ClientDisconnectFinish 20 20
export ClientDisconnect
proc ClientDisconnect 16 8
line 3337
;3324:
;3325:/*
;3326:===========
;3327:ClientDisconnect
;3328:
;3329:Called when a player drops from the server.
;3330:Will not be called between levels.
;3331:
;3332:This should NOT be called directly by any game logic,
;3333:call trap_DropClient(), which will call this and do
;3334:server system housekeeping.
;3335:============
;3336:*/
;3337:void ClientDisconnect( int clientNum ) {
line 3344
;3338:	gentity_t	*ent;
;3339:	gentity_t	*tent;
;3340:	int			i;
;3341:
;3342:	// cleanup if we are kicking a bot that
;3343:	// hasn't spawned yet
;3344:	G_RemoveQueuedBotBegin( clientNum );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 3346
;3345:
;3346:	ent = g_entities + clientNum;
ADDRLP4 0
CNSTI4 2352
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3347
;3347:	if ( !ent->client ) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1571
line 3348
;3348:		return;
ADDRGP4 $1570
JUMPV
LABELV $1571
line 3351
;3349:	}
;3350:
;3351:	G_ResetClientVote(ent->client);
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ResetClientVote
CALLV
pop
line 3353
;3352:
;3353:	if (DF_KeepClientZombie(ent)) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 DF_KeepClientZombie
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1573
line 3354
;3354:		return;
ADDRGP4 $1570
JUMPV
LABELV $1573
line 3357
;3355:	}
;3356:
;3357:	ClientDisconnectFinish(clientNum, ent);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientDisconnectFinish
CALLV
pop
line 3358
;3358:}
LABELV $1570
endproc ClientDisconnect 16 8
export G_SendServerCommand
proc G_SendServerCommand 16 8
line 3360
;3359:
;3360:void G_SendServerCommand(int targetnum, const char* cmd, qboolean alsoFollowers) {
line 3363
;3361:	int i;
;3362:	gentity_t* other;
;3363:	trap_SendServerCommand(targetnum, cmd);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3364
;3364:	if (targetnum == -1 || !alsoFollowers) {
ADDRFP4 0
INDIRI4
CNSTI4 -1
EQI4 $1578
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $1576
LABELV $1578
line 3365
;3365:		return;
ADDRGP4 $1575
JUMPV
LABELV $1576
line 3368
;3366:	}
;3367:	
;3368:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1582
JUMPV
LABELV $1579
line 3369
;3369:		other = g_entities + i;
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3370
;3370:		if (!other->client || !other->inuse || other->client->sess.spectatorState != SPECTATOR_FOLLOW || other->client->sess.spectatorClient != targetnum) continue; // can !other->client happen? no idea lazy to think about it.
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1588
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1588
ADDRLP4 12
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1588
ADDRLP4 12
INDIRP4
CNSTI4 43452
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $1584
LABELV $1588
ADDRGP4 $1580
JUMPV
LABELV $1584
line 3371
;3371:		trap_SendServerCommand(i, cmd);
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3372
;3372:	}
LABELV $1580
line 3368
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1582
ADDRLP4 4
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $1579
line 3373
;3373:}
LABELV $1575
endproc G_SendServerCommand 16 8
export G_CenterPrint
proc G_CenterPrint 1128 16
line 3378
;3374:
;3375:#define MAX_CLIENT_CENTERPRINT_LINELENGTH 50
;3376:#define MAX_CLIENT_CENTERPRINT_LENGTH 1024
;3377:void G_CenterPrint( int targetNum, int autoLineWraps, const char *message, qboolean printInDefrag, qboolean alsoFollowers, qboolean alwaysPrint, const char* extra)
;3378:{
line 3379
;3379:	int len = strlen(message);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ADDRLP4 4
INDIRU4
CVUI4 4
ASGNI4
line 3380
;3380:	if (printInDefrag && g_defrag.integer) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRFP4 12
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1590
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1590
line 3381
;3381:		if (extra) {
ADDRFP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1593
line 3382
;3382:			G_SendServerCommand(targetNum, va("print \"%s\n\" %s", message, extra), alsoFollowers);
ADDRGP4 $1595
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 3383
;3383:		}
ADDRGP4 $1591
JUMPV
LABELV $1593
line 3384
;3384:		else {
line 3385
;3385:			G_SendServerCommand(targetNum, va("print \"%s\n\"", message), alsoFollowers);
ADDRGP4 $1596
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 3386
;3386:		}
line 3387
;3387:	}
ADDRGP4 $1591
JUMPV
LABELV $1590
line 3388
;3388:	else if (!autoLineWraps || len <= MAX_CLIENT_CENTERPRINT_LINELENGTH) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1599
ADDRLP4 0
INDIRI4
CNSTI4 50
GTI4 $1597
LABELV $1599
line 3389
;3389:		if (alwaysPrint) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $1600
line 3390
;3390:			if (extra) {
ADDRFP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1602
line 3391
;3391:				G_SendServerCommand(targetNum, va("print \"%s\n\" %s", message,extra), alsoFollowers);
ADDRGP4 $1595
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 3392
;3392:			}
ADDRGP4 $1603
JUMPV
LABELV $1602
line 3393
;3393:			else {
line 3394
;3394:				G_SendServerCommand(targetNum, va("print \"%s\n\"", message), alsoFollowers);
ADDRGP4 $1596
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 3395
;3395:			}
LABELV $1603
line 3396
;3396:		}
LABELV $1600
line 3397
;3397:		if (extra) {
ADDRFP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1604
line 3398
;3398:			G_SendServerCommand(targetNum, va("cp \"%s\" %s", message, extra), alsoFollowers);
ADDRGP4 $1606
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 3399
;3399:		}
ADDRGP4 $1598
JUMPV
LABELV $1604
line 3400
;3400:		else {
line 3401
;3401:			G_SendServerCommand(targetNum, va("cp \"%s\"", message), alsoFollowers);
ADDRGP4 $1607
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 3402
;3402:		}
line 3403
;3403:	}
ADDRGP4 $1598
JUMPV
LABELV $1597
line 3405
;3404:	else
;3405:	{
line 3408
;3406:		char newMessage[MAX_CLIENT_CENTERPRINT_LENGTH];
;3407:
;3408:		const char *lineStart = message;
ADDRLP4 1056
ADDRFP4 8
INDIRP4
ASGNP4
line 3409
;3409:		const char *lineEnd = lineStart;
ADDRLP4 20
ADDRLP4 1056
INDIRP4
ASGNP4
line 3419
;3410:		const char *wordStart, *wordEnd;
;3411:		const char *ptr;
;3412:
;3413:		int lineLength;
;3414:		int wordLength;
;3415:		int curLength;
;3416:		int reset;
;3417:		int isMultiLang;
;3418:
;3419:		if (alwaysPrint) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $1608
line 3420
;3420:			if (extra) {
ADDRFP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1610
line 3421
;3421:				G_SendServerCommand(targetNum, va("print \"%s\n\" %s", message,extra), alsoFollowers);
ADDRGP4 $1595
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 3422
;3422:			}
ADDRGP4 $1611
JUMPV
LABELV $1610
line 3423
;3423:			else {
line 3424
;3424:				G_SendServerCommand(targetNum, va("print \"%s\n\"", message), alsoFollowers);
ADDRGP4 $1596
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 3425
;3425:			}
LABELV $1611
line 3426
;3426:		}
LABELV $1608
line 3428
;3427:
;3428:		*newMessage = 0;
ADDRLP4 28
CNSTI1 0
ASGNI1
ADDRGP4 $1613
JUMPV
LABELV $1612
line 3431
;3429:
;3430:		while ( *lineStart && (size_t)(lineStart-message) < len)
;3431:		{
line 3432
;3432:			if ( *newMessage ) Q_strcat( newMessage, sizeof(newMessage), "\n" );
ADDRLP4 28
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1619
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1617
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $1619
JUMPV
LABELV $1618
line 3434
;3433:
;3434:			while ( *lineEnd && *lineEnd != '\n' ) lineEnd++;
ADDRLP4 20
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1619
ADDRLP4 1076
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
EQI4 $1621
ADDRLP4 1076
INDIRI4
CNSTI4 10
NEI4 $1618
LABELV $1621
line 3435
;3435:			lineLength = lineEnd - lineStart;
ADDRLP4 1072
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 1056
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 3437
;3436:
;3437:			isMultiLang = 0;
ADDRLP4 1060
CNSTI4 0
ASGNI4
line 3438
;3438:			ptr = lineStart;
ADDRLP4 12
ADDRLP4 1056
INDIRP4
ASGNP4
ADDRGP4 $1623
JUMPV
LABELV $1622
line 3440
;3439:			while ( ptr < lineEnd-2 )
;3440:			{
line 3441
;3441:				if ( *ptr == '@' && *(ptr+1) == '@' && *(ptr+2) == '@' )
ADDRLP4 1084
CNSTI4 64
ASGNI4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 1084
INDIRI4
NEI4 $1625
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 1084
INDIRI4
NEI4 $1625
ADDRLP4 12
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
ADDRLP4 1084
INDIRI4
NEI4 $1625
line 3442
;3442:				{
line 3443
;3443:					isMultiLang = 1;
ADDRLP4 1060
CNSTI4 1
ASGNI4
line 3444
;3444:					break;
ADDRGP4 $1624
JUMPV
LABELV $1625
line 3446
;3445:				}
;3446:				ptr++;
ADDRLP4 12
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 3447
;3447:			}
LABELV $1623
line 3439
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRP4
CNSTI4 -2
ADDP4
CVPU4 4
LTU4 $1622
LABELV $1624
line 3449
;3448:
;3449:			if ( lineLength > MAX_CLIENT_CENTERPRINT_LINELENGTH || isMultiLang )
ADDRLP4 1072
INDIRI4
CNSTI4 50
GTI4 $1629
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $1627
LABELV $1629
line 3450
;3450:			{ // Now we have to cut the line.
line 3451
;3451:				wordStart = wordEnd = lineStart;
ADDRLP4 16
ADDRLP4 1056
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 1056
INDIRP4
ASGNP4
line 3452
;3452:				curLength = 0;
ADDRLP4 1052
CNSTI4 0
ASGNI4
line 3453
;3453:				reset = 0;
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRGP4 $1631
JUMPV
LABELV $1630
line 3456
;3454:
;3455:				while ( lineStart < lineEnd )
;3456:				{
line 3457
;3457:					isMultiLang = 0;
ADDRLP4 1060
CNSTI4 0
ASGNI4
line 3458
;3458:					if ( reset )
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $1633
line 3459
;3459:					{
line 3460
;3460:						curLength = 0;
ADDRLP4 1052
CNSTI4 0
ASGNI4
line 3461
;3461:						Q_strcat( newMessage, sizeof(newMessage), "\n" );
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1617
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 3463
;3462:
;3463:						ptr = wordStart;
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
ADDRGP4 $1636
JUMPV
LABELV $1635
line 3464
;3464:						while ( *ptr && (*ptr == ' ' || *ptr == '\t') ) ptr++;
ADDRLP4 12
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1636
ADDRLP4 1084
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $1638
ADDRLP4 1084
INDIRI4
CNSTI4 32
EQI4 $1635
ADDRLP4 1084
INDIRI4
CNSTI4 9
EQI4 $1635
LABELV $1638
line 3466
;3465:
;3466:						if ( !Q_IsColorString_1_02(ptr) ) // CenterPrint interprets colors like the 1.02 console
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1643
ADDRLP4 1092
CNSTI4 94
ASGNI4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 1092
INDIRI4
NEI4 $1643
ADDRLP4 1096
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
EQI4 $1643
ADDRLP4 1096
INDIRI4
ADDRLP4 1092
INDIRI4
NEI4 $1639
LABELV $1643
line 3467
;3467:						{
line 3469
;3468:							// Find the old color if we don't start with a new color on the next line
;3469:							ptr = wordStart - 1;
ADDRLP4 12
ADDRLP4 24
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $1645
JUMPV
LABELV $1644
line 3471
;3470:							while ( *ptr && ptr >= lineStart )
;3471:							{
line 3472
;3472:								if ( Q_IsColorString_1_02(ptr) )
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1647
ADDRLP4 1104
CNSTI4 94
ASGNI4
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 1104
INDIRI4
NEI4 $1647
ADDRLP4 1108
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
EQI4 $1647
ADDRLP4 1108
INDIRI4
ADDRLP4 1104
INDIRI4
EQI4 $1647
line 3473
;3473:								{
line 3474
;3474:									if ( *(ptr+1) == '7' ) break; // Don't redo white
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 55
NEI4 $1649
ADDRGP4 $1646
JUMPV
LABELV $1649
line 3476
;3475:
;3476:									Q_strcat( newMessage, sizeof(newMessage), va("^%c", *(ptr+1)) );
ADDRGP4 $1651
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 3477
;3477:									curLength += 2;
ADDRLP4 1052
ADDRLP4 1052
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 3478
;3478:									reset = 2;
ADDRLP4 1064
CNSTI4 2
ASGNI4
line 3479
;3479:									break;
ADDRGP4 $1646
JUMPV
LABELV $1647
line 3481
;3480:								}
;3481:								ptr--;
ADDRLP4 12
ADDRLP4 12
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 3482
;3482:							}
LABELV $1645
line 3470
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1652
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 1056
INDIRP4
CVPU4 4
GEU4 $1644
LABELV $1652
LABELV $1646
line 3483
;3483:						}
LABELV $1639
line 3484
;3484:					}
LABELV $1633
line 3485
;3485:					wordEnd = wordStart;
ADDRLP4 16
ADDRLP4 24
INDIRP4
ASGNP4
ADDRGP4 $1654
JUMPV
LABELV $1653
line 3486
;3486:					while ( *wordEnd != ' ' && *wordEnd != '\t' && *wordEnd != '\n' && wordEnd < lineEnd ) wordEnd++;
ADDRLP4 16
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1654
ADDRLP4 1088
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 32
EQI4 $1658
ADDRLP4 1088
INDIRI4
CNSTI4 9
EQI4 $1658
ADDRLP4 1088
INDIRI4
CNSTI4 10
EQI4 $1658
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRP4
CVPU4 4
LTU4 $1653
LABELV $1658
line 3487
;3487:					wordLength = wordEnd - wordStart;
ADDRLP4 1068
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 3489
;3488:
;3489:					if ( wordEnd > lineEnd ) // Make sure the word is still in our line and doesn't exceed it
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRP4
CVPU4 4
LEU4 $1659
line 3490
;3490:						break;
ADDRGP4 $1628
JUMPV
LABELV $1659
line 3492
;3491:
;3492:					if ( wordLength >= 3 && *wordStart == '@' && *(wordStart+1) == '@' && *(wordStart+2) == '@' )
ADDRLP4 1068
INDIRI4
CNSTI4 3
LTI4 $1661
ADDRLP4 1096
CNSTI4 64
ASGNI4
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 1096
INDIRI4
NEI4 $1661
ADDRLP4 24
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ADDRLP4 1096
INDIRI4
NEI4 $1661
ADDRLP4 24
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
ADDRLP4 1096
INDIRI4
NEI4 $1661
line 3493
;3493:						isMultiLang = 1;
ADDRLP4 1060
CNSTI4 1
ASGNI4
LABELV $1661
line 3497
;3494:
;3495:					// & 1: move whole words to the next line (prefered if combined with 2)
;3496:					// & 2: cut words into pieces
;3497:					if ( curLength + wordLength > MAX_CLIENT_CENTERPRINT_LINELENGTH || isMultiLang )
ADDRLP4 1052
INDIRI4
ADDRLP4 1068
INDIRI4
ADDI4
CNSTI4 50
GTI4 $1665
ADDRLP4 1060
INDIRI4
CNSTI4 0
EQI4 $1663
LABELV $1665
line 3498
;3498:					{ // The next word would make the line too long
line 3499
;3499:						if ( (autoLineWraps & 2) && (!curLength || !(autoLineWraps & 1)) && !isMultiLang )
ADDRLP4 1100
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1104
CNSTI4 0
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 1104
INDIRI4
EQI4 $1666
ADDRLP4 1052
INDIRI4
ADDRLP4 1104
INDIRI4
EQI4 $1668
ADDRLP4 1100
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 1104
INDIRI4
NEI4 $1666
LABELV $1668
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1666
line 3500
;3500:						{ // We want to cut the word into pieces
line 3501
;3501:							if ( curLength && !reset ) Q_strcat( newMessage, sizeof(newMessage), " " );
ADDRLP4 1108
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRI4
ADDRLP4 1108
INDIRI4
EQI4 $1669
ADDRLP4 1064
INDIRI4
ADDRLP4 1108
INDIRI4
NEI4 $1669
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1671
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $1669
line 3503
;3502:
;3503:							wordEnd = ptr = wordStart + (MAX_CLIENT_CENTERPRINT_LINELENGTH - curLength);
ADDRLP4 1112
CNSTI4 50
ADDRLP4 1052
INDIRI4
SUBI4
ADDRLP4 24
INDIRP4
ADDP4
ASGNP4
ADDRLP4 12
ADDRLP4 1112
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 1112
INDIRP4
ASGNP4
line 3504
;3504:							ptr = wordEnd - 1;
ADDRLP4 12
ADDRLP4 16
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $1673
JUMPV
LABELV $1672
line 3507
;3505:
;3506:							// Make sure we don't accidently split a colorcode
;3507:							while ( *ptr && ptr > wordStart && *ptr == '^' ) ptr--;
ADDRLP4 12
ADDRLP4 12
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
LABELV $1673
ADDRLP4 1120
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
EQI4 $1676
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRP4
CVPU4 4
LEU4 $1676
ADDRLP4 1120
INDIRI4
CNSTI4 94
EQI4 $1672
LABELV $1676
line 3508
;3508:							if ( ptr == wordStart ) ptr = wordEnd - 1;
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRP4
CVPU4 4
NEU4 $1677
ADDRLP4 12
ADDRLP4 16
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
LABELV $1677
line 3510
;3509:
;3510:							wordEnd = ptr + 1;
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 3512
;3511:
;3512:							G_StringAppendSubstring( newMessage, sizeof(newMessage), wordStart, wordEnd-wordStart );
ADDRLP4 28
ARGP4
CNSTU4 1024
ARGU4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CVIU4 4
ARGU4
ADDRGP4 G_StringAppendSubstring
CALLV
pop
line 3513
;3513:							wordStart = wordEnd;
ADDRLP4 24
ADDRLP4 16
INDIRP4
ASGNP4
line 3514
;3514:						}
ADDRGP4 $1667
JUMPV
LABELV $1666
line 3515
;3515:						else if ( !curLength || reset == 2 )
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $1681
ADDRLP4 1064
INDIRI4
CNSTI4 2
NEI4 $1679
LABELV $1681
line 3516
;3516:						{ // We don't to split it, so just append the whole thing and let the client cut it off
line 3517
;3517:							G_StringAppendSubstring( newMessage, sizeof(newMessage), wordStart, wordLength );
ADDRLP4 28
ARGP4
CNSTU4 1024
ARGU4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 1068
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 G_StringAppendSubstring
CALLV
pop
line 3518
;3518:							wordStart = wordEnd + 1;
ADDRLP4 24
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 3519
;3519:						}
LABELV $1679
LABELV $1667
line 3522
;3520:
;3521:						// Reset the counters
;3522:						reset = 1;
ADDRLP4 1064
CNSTI4 1
ASGNI4
line 3523
;3523:					}
ADDRGP4 $1664
JUMPV
LABELV $1663
line 3525
;3524:					else
;3525:					{ // Append the word
line 3527
;3526:						// If this isn't the first word add a space
;3527:						if ( curLength && !reset ) Q_strcat( newMessage, sizeof(newMessage), " " );
ADDRLP4 1100
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRI4
ADDRLP4 1100
INDIRI4
EQI4 $1682
ADDRLP4 1064
INDIRI4
ADDRLP4 1100
INDIRI4
NEI4 $1682
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1671
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $1682
line 3528
;3528:						G_StringAppendSubstring( newMessage, sizeof(newMessage), wordStart, wordLength );
ADDRLP4 28
ARGP4
CNSTU4 1024
ARGU4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 1068
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 G_StringAppendSubstring
CALLV
pop
line 3529
;3529:						curLength += wordLength + 1;
ADDRLP4 1052
ADDRLP4 1052
INDIRI4
ADDRLP4 1068
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 3530
;3530:						wordStart = wordEnd + 1;
ADDRLP4 24
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 3532
;3531:
;3532:						reset = 0;
ADDRLP4 1064
CNSTI4 0
ASGNI4
line 3533
;3533:					}
LABELV $1664
line 3536
;3534:
;3535:					// Shouldn't get here
;3536:					if ( !*wordEnd ) break;
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1684
ADDRGP4 $1628
JUMPV
LABELV $1684
line 3537
;3537:				}
LABELV $1631
line 3455
ADDRLP4 1056
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRP4
CVPU4 4
LTU4 $1630
line 3538
;3538:			}
ADDRGP4 $1628
JUMPV
LABELV $1627
line 3539
;3539:			else G_StringAppendSubstring( newMessage, sizeof(newMessage), lineStart, lineLength );
ADDRLP4 28
ARGP4
CNSTU4 1024
ARGU4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1072
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 G_StringAppendSubstring
CALLV
pop
LABELV $1628
line 3542
;3540:
;3541:			// Next line
;3542:			lineStart = lineEnd + 1;
ADDRLP4 1056
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 3543
;3543:			lineEnd = lineStart;
ADDRLP4 20
ADDRLP4 1056
INDIRP4
ASGNP4
line 3544
;3544:		}
LABELV $1613
line 3430
ADDRLP4 1056
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1686
ADDRLP4 1056
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CVIU4 4
ADDRLP4 0
INDIRI4
CVIU4 4
LTU4 $1612
LABELV $1686
line 3545
;3545:		if (extra) {
ADDRFP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1687
line 3546
;3546:			G_SendServerCommand(targetNum, va("cp \"%s\" %s", newMessage, extra), alsoFollowers);
ADDRGP4 $1606
ARGP4
ADDRLP4 28
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 3547
;3547:		}
ADDRGP4 $1688
JUMPV
LABELV $1687
line 3548
;3548:		else {
line 3549
;3549:			G_SendServerCommand(targetNum, va("cp \"%s\"", newMessage), alsoFollowers);
ADDRGP4 $1607
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 3550
;3550:		}
LABELV $1688
line 3551
;3551:	}
LABELV $1598
LABELV $1591
line 3552
;3552:}
LABELV $1589
endproc G_CenterPrint 1128 16
import DF_RemoveCheckPoints
import RestorePosition
import WP_HasForcePowers
import ResetClientModeIfInvalid
import UpdateClientRaceVars
import G_WriteClientSessionData
import ClientSetDefaultMode
import GetDefaultPlayerMode
import DF_ClearCheckPointTimes
import DF_RaceStateInvalidated
import ShouldNotCollide
bss
export Client_Force
align 4
LABELV Client_Force
skip 15104
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
import CalculateRanks
import AddScore
import player_die
import G_Kill
import BeginIntermission
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
LABELV $1671
byte 1 32
byte 1 0
align 1
LABELV $1651
byte 1 94
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $1617
byte 1 10
byte 1 0
align 1
LABELV $1607
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $1606
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1596
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1595
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1567
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1545
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 68
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1525
byte 1 115
byte 1 118
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1523
byte 1 115
byte 1 118
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 59
byte 1 115
byte 1 118
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 115
byte 1 104
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 115
byte 1 104
byte 1 37
byte 1 100
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1435
byte 1 103
byte 1 95
byte 1 106
byte 1 101
byte 1 100
byte 1 105
byte 1 86
byte 1 109
byte 1 101
byte 1 114
byte 1 99
byte 1 0
align 1
LABELV $1352
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1327
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 40
byte 1 35
byte 1 51
byte 1 41
byte 1 0
align 1
LABELV $1301
byte 1 94
byte 1 49
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $1140
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 87
byte 1 101
byte 1 108
byte 1 99
byte 1 111
byte 1 109
byte 1 101
byte 1 46
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 94
byte 1 50
byte 1 47
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 97
byte 1 98
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1139
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 66
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1138
byte 1 80
byte 1 76
byte 1 69
byte 1 78
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $1129
byte 1 77
byte 1 111
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1128
byte 1 114
byte 1 116
byte 1 105
byte 1 98
byte 1 105
byte 1 97
byte 1 0
align 1
LABELV $1127
byte 1 108
byte 1 116
byte 1 105
byte 1 98
byte 1 105
byte 1 97
byte 1 0
align 1
LABELV $1126
byte 1 114
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1125
byte 1 108
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $1124
byte 1 116
byte 1 104
byte 1 111
byte 1 114
byte 1 97
byte 1 99
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $1105
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $1104
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $1097
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1068
byte 1 80
byte 1 76
byte 1 67
byte 1 79
byte 1 78
byte 1 78
byte 1 69
byte 1 67
byte 1 84
byte 1 0
align 1
LABELV $1067
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1064
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1061
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1046
byte 1 73
byte 1 78
byte 1 86
byte 1 65
byte 1 76
byte 1 73
byte 1 68
byte 1 95
byte 1 80
byte 1 65
byte 1 83
byte 1 83
byte 1 87
byte 1 79
byte 1 82
byte 1 68
byte 1 0
align 1
LABELV $1043
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $1038
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $1034
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 73
byte 1 80
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $1017
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 73
byte 1 80
byte 1 46
byte 1 0
align 1
LABELV $998
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $993
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 46
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $986
byte 1 66
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $961
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
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
LABELV $957
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 117
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 109
byte 1 118
byte 1 103
byte 1 112
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 106
byte 1 107
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 99
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 115
byte 1 116
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $956
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $955
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 109
byte 1 118
byte 1 103
byte 1 112
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 98
byte 1 111
byte 1 116
byte 1 92
byte 1 49
byte 1 92
byte 1 109
byte 1 99
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 115
byte 1 116
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $952
byte 1 103
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $951
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $950
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $949
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $948
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $947
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
LABELV $946
byte 1 107
byte 1 121
byte 1 108
byte 1 101
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $943
byte 1 109
byte 1 111
byte 1 114
byte 1 103
byte 1 97
byte 1 110
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $942
byte 1 109
byte 1 111
byte 1 114
byte 1 103
byte 1 97
byte 1 110
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $941
byte 1 109
byte 1 111
byte 1 114
byte 1 103
byte 1 97
byte 1 110
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 95
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $940
byte 1 109
byte 1 111
byte 1 114
byte 1 103
byte 1 97
byte 1 110
byte 1 47
byte 1 0
align 1
LABELV $939
byte 1 109
byte 1 111
byte 1 114
byte 1 103
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $938
byte 1 107
byte 1 121
byte 1 108
byte 1 101
byte 1 47
byte 1 102
byte 1 112
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $934
byte 1 103
byte 1 97
byte 1 108
byte 1 97
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $932
byte 1 103
byte 1 97
byte 1 108
byte 1 97
byte 1 107
byte 1 95
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 47
byte 1 0
align 1
LABELV $931
byte 1 103
byte 1 97
byte 1 108
byte 1 97
byte 1 107
byte 1 95
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $927
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $926
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $919
byte 1 80
byte 1 76
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $918
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $913
byte 1 94
byte 1 55
byte 1 91
byte 1 94
byte 1 50
byte 1 37
byte 1 105
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $877
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $867
byte 1 64
byte 1 64
byte 1 64
byte 1 0
align 1
LABELV $854
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $848
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 112
byte 1 104
byte 1 121
byte 1 115
byte 1 105
byte 1 99
byte 1 115
byte 1 70
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $845
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $844
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $841
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $840
byte 1 92
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 92
byte 1 98
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $835
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $832
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $812
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 112
byte 1 104
byte 1 97
byte 1 0
align 1
LABELV $809
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $806
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $804
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $728
byte 1 42
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $722
byte 1 99
byte 1 114
byte 1 97
byte 1 110
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $720
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 95
byte 1 108
byte 1 117
byte 1 109
byte 1 98
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $718
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 114
byte 1 111
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $717
byte 1 42
byte 1 108
byte 1 95
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $716
byte 1 42
byte 1 114
byte 1 95
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $711
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $708
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $707
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 95
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 111
byte 1 105
byte 1 100
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $696
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 107
byte 1 121
byte 1 108
byte 1 101
byte 1 47
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $681
byte 1 94
byte 1 53
byte 1 111
byte 1 99
byte 1 57
byte 1 94
byte 1 55
byte 1 35
byte 1 94
byte 1 53
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $679
byte 1 94
byte 1 55
byte 1 94
byte 1 55
byte 1 94
byte 1 52
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 111
byte 1 109
byte 1 94
byte 1 52
byte 1 94
byte 1 52
byte 1 94
byte 1 55
byte 1 35
byte 1 94
byte 1 55
byte 1 94
byte 1 55
byte 1 94
byte 1 52
byte 1 37
byte 1 115
byte 1 94
byte 1 52
byte 1 94
byte 1 52
byte 1 94
byte 1 55
byte 1 39
byte 1 0
align 1
LABELV $619
byte 1 85
byte 1 98
byte 1 0
align 1
LABELV $618
byte 1 74
byte 1 65
byte 1 87
byte 1 65
byte 1 0
align 1
LABELV $617
byte 1 101
byte 1 0
align 1
LABELV $616
byte 1 84
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $615
byte 1 100
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $614
byte 1 100
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $613
byte 1 105
byte 1 0
align 1
LABELV $612
byte 1 76
byte 1 71
byte 1 66
byte 1 84
byte 1 81
byte 1 0
align 1
LABELV $611
byte 1 108
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $610
byte 1 76
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $609
byte 1 76
byte 1 111
byte 1 67
byte 1 0
align 1
LABELV $608
byte 1 80
byte 1 65
byte 1 82
byte 1 65
byte 1 68
byte 1 105
byte 1 71
byte 1 77
byte 1 0
align 1
LABELV $607
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 98
byte 1 111
byte 1 121
byte 1 90
byte 1 0
align 1
LABELV $606
byte 1 84
byte 1 101
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $605
byte 1 103
byte 1 103
byte 1 0
align 1
LABELV $604
byte 1 116
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $603
byte 1 116
byte 1 110
byte 1 102
byte 1 0
align 1
LABELV $602
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 0
align 1
LABELV $601
byte 1 115
byte 1 102
byte 1 0
align 1
LABELV $600
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $599
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $598
byte 1 118
byte 1 118
byte 1 118
byte 1 0
align 1
LABELV $597
byte 1 76
byte 1 83
byte 1 83
byte 1 0
align 1
LABELV $596
byte 1 104
byte 1 118
byte 1 110
byte 1 0
align 1
LABELV $595
byte 1 72
byte 1 101
byte 1 99
byte 1 99
byte 1 0
align 1
LABELV $594
byte 1 65
byte 1 70
byte 1 75
byte 1 0
align 1
LABELV $593
byte 1 69
byte 1 54
byte 1 50
byte 1 49
byte 1 0
align 1
LABELV $592
byte 1 77
byte 1 65
byte 1 68
byte 1 0
align 1
LABELV $591
byte 1 69
byte 1 85
byte 1 0
align 1
LABELV $590
byte 1 103
byte 1 0
align 1
LABELV $589
byte 1 76
byte 1 111
byte 1 68
byte 1 0
align 1
LABELV $588
byte 1 78
byte 1 65
byte 1 84
byte 1 79
byte 1 0
align 1
LABELV $587
byte 1 68
byte 1 65
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $586
byte 1 78
byte 1 65
byte 1 0
align 1
LABELV $585
byte 1 82
byte 1 0
align 1
LABELV $584
byte 1 83
byte 1 67
byte 1 0
align 1
LABELV $583
byte 1 83
byte 1 80
byte 1 81
byte 1 82
byte 1 0
align 1
LABELV $582
byte 1 84
byte 1 66
byte 1 0
align 1
LABELV $581
byte 1 84
byte 1 111
byte 1 68
byte 1 0
align 1
LABELV $580
byte 1 87
byte 1 65
byte 1 82
byte 1 0
align 1
LABELV $579
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 100
byte 1 111
byte 1 122
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $578
byte 1 101
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $577
byte 1 99
byte 1 97
byte 1 0
align 1
LABELV $576
byte 1 66
byte 1 79
byte 1 77
byte 1 83
byte 1 0
align 1
LABELV $575
byte 1 67
byte 1 106
byte 1 83
byte 1 0
align 1
LABELV $574
byte 1 71
byte 1 111
byte 1 116
byte 1 65
byte 1 0
align 1
LABELV $573
byte 1 101
byte 1 122
byte 1 0
align 1
LABELV $572
byte 1 110
byte 1 87
byte 1 111
byte 1 0
align 1
LABELV $571
byte 1 100
byte 1 65
byte 1 0
align 1
LABELV $570
byte 1 57
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $569
byte 1 57
byte 1 51
byte 1 111
byte 1 0
align 1
LABELV $568
byte 1 75
byte 1 82
byte 1 0
align 1
LABELV $567
byte 1 114
byte 1 106
byte 1 0
align 1
LABELV $566
byte 1 69
byte 1 67
byte 1 0
align 1
LABELV $565
byte 1 67
byte 1 111
byte 1 108
byte 1 100
byte 1 84
byte 1 104
byte 1 117
byte 1 103
byte 1 122
byte 1 0
align 1
LABELV $564
byte 1 84
byte 1 70
byte 1 74
byte 1 0
align 1
LABELV $563
byte 1 83
byte 1 76
byte 1 0
align 1
LABELV $562
byte 1 119
byte 1 67
byte 1 119
byte 1 0
align 1
LABELV $561
byte 1 115
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $560
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $559
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $558
byte 1 114
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $557
byte 1 106
byte 1 111
byte 1 116
byte 1 114
byte 1 0
align 1
LABELV $556
byte 1 97
byte 1 104
byte 1 0
align 1
LABELV $555
byte 1 102
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $554
byte 1 99
byte 1 111
byte 1 122
byte 1 0
align 1
LABELV $553
byte 1 100
byte 1 50
byte 1 119
byte 1 0
align 1
LABELV $552
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $551
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $550
byte 1 115
byte 1 117
byte 1 102
byte 1 102
byte 1 105
byte 1 120
byte 1 0
align 1
LABELV $549
byte 1 99
byte 1 105
byte 1 114
byte 1 99
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $548
byte 1 109
byte 1 111
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $547
byte 1 98
byte 1 100
byte 1 115
byte 1 109
byte 1 0
align 1
LABELV $546
byte 1 102
byte 1 116
byte 1 0
align 1
LABELV $545
byte 1 114
byte 1 114
byte 1 114
byte 1 0
align 1
LABELV $544
byte 1 106
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $543
byte 1 103
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $542
byte 1 106
byte 1 111
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $541
byte 1 106
byte 1 111
byte 1 102
byte 1 0
align 1
LABELV $540
byte 1 102
byte 1 111
byte 1 117
byte 1 0
align 1
LABELV $539
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $538
byte 1 112
byte 1 117
byte 1 114
byte 1 101
byte 1 110
byte 1 101
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $537
byte 1 49
byte 1 55
byte 1 52
byte 1 0
align 1
LABELV $536
byte 1 100
byte 1 98
byte 1 100
byte 1 0
align 1
LABELV $535
byte 1 98
byte 1 98
byte 1 98
byte 1 0
align 1
LABELV $534
byte 1 102
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $533
byte 1 101
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $532
byte 1 111
byte 1 99
byte 1 57
byte 1 0
align 1
LABELV $531
byte 1 112
byte 1 105
byte 1 0
align 1
LABELV $530
byte 1 99
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $529
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $528
byte 1 80
byte 1 97
byte 1 100
byte 1 97
byte 1 119
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $404
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $397
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $370
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $330
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $281
byte 1 94
byte 1 49
byte 1 87
byte 1 105
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 83
byte 1 112
byte 1 111
byte 1 116
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 58
byte 1 32
byte 1 70
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 48
byte 1 32
byte 1 98
byte 1 117
byte 1 116
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
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 46
byte 1 32
byte 1 83
byte 1 107
byte 1 105
byte 1 112
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $213
byte 1 66
byte 1 69
byte 1 67
byte 1 79
byte 1 77
byte 1 69
byte 1 74
byte 1 77
byte 1 0
align 1
LABELV $212
byte 1 83
byte 1 86
byte 1 73
byte 1 78
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $211
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $198
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $165
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
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 47
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 95
byte 1 119
byte 1 46
byte 1 103
byte 1 108
byte 1 109
byte 1 0
align 1
LABELV $160
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $144
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $141
byte 1 94
byte 1 51
byte 1 81
byte 1 51
byte 1 32
byte 1 115
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 99
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 118
byte 1 113
byte 1 51
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 99
byte 1 112
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $133
byte 1 100
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $130
byte 1 0
align 1
LABELV $129
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $126
byte 1 110
byte 1 111
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $123
byte 1 48
byte 1 0
align 1
LABELV $122
byte 1 110
byte 1 111
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $121
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
