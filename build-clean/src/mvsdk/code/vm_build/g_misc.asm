export SP_info_camp
code
proc SP_info_camp 4 8
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_misc.c"
line 24
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_misc.c
;4:
;5:#include "g_local.h"
;6:
;7:#include "ai_main.h" //for the g2animents
;8:
;9:#define HOLOCRON_RESPAWN_TIME 30000
;10:#define MAX_AMMO_GIVE 2
;11:#define STATION_RECHARGE_TIME 3000//800
;12:
;13:void HolocronThink(gentity_t *ent);
;14:extern vmCvar_t g_MaxHolocronCarry;
;15:
;16:/*QUAKED func_group (0 0 0) ?
;17:Used to group brushes together just for editor convenience.  They are turned into normal brushes by the utilities.
;18:*/
;19:
;20:
;21:/*QUAKED info_camp (0 0.5 0) (-4 -4 -4) (4 4 4)
;22:Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
;23:*/
;24:void SP_info_camp( gentity_t *self ) {
line 25
;25:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 26
;26:}
LABELV $123
endproc SP_info_camp 4 8
export SP_info_null
proc SP_info_null 0 4
line 32
;27:
;28:
;29:/*QUAKED info_null (0 0.5 0) (-4 -4 -4) (4 4 4)
;30:Used as a positional target for calculations in the utilities (spotlights, etc), but removed during gameplay.
;31:*/
;32:void SP_info_null( gentity_t *self ) {
line 33
;33:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 34
;34:}
LABELV $124
endproc SP_info_null 0 4
export SP_info_notnull
proc SP_info_notnull 4 8
line 41
;35:
;36:
;37:/*QUAKED info_notnull (0 0.5 0) (-4 -4 -4) (4 4 4)
;38:Used as a positional target for in-game calculation, like jumppad targets.
;39:target_position does the same thing
;40:*/
;41:void SP_info_notnull( gentity_t *self ){
line 42
;42:	G_SetOrigin( self, self->s.origin );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 43
;43:}
LABELV $125
endproc SP_info_notnull 4 8
export SP_light
proc SP_light 0 4
line 53
;44:
;45:
;46:/*QUAKED light (0 1 0) (-8 -8 -8) (8 8 8) linear
;47:Non-displayed light.
;48:"light" overrides the default 300 intensity.
;49:Linear checbox gives linear falloff instead of inverse square
;50:Lights pointed at a target will be spotlights.
;51:"radius" overrides the default 64 unit radius of a spotlight at the target point.
;52:*/
;53:void SP_light( gentity_t *self ) {
line 54
;54:	G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 55
;55:}
LABELV $126
endproc SP_light 0 4
export TeleportPlayer
proc TeleportPlayer 44 16
line 67
;56:
;57:
;58:
;59:/*
;60:=================================================================================
;61:
;62:TELEPORTERS
;63:
;64:=================================================================================
;65:*/
;66:
;67:void TeleportPlayer( gentity_t *player, vec3_t origin, vec3_t angles ) {
line 70
;68:	gentity_t	*tent;
;69:
;70:	if ( player->client->sess.spectatorState == SPECTATOR_FOLLOW )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 2
NEI4 $128
line 71
;71:	{ // Follow spectators don't need to teleport. And calling BG_PlayerStateToEntityState on them corrupts their s.number.
line 72
;72:		return;
ADDRGP4 $127
JUMPV
LABELV $128
line 75
;73:	}
;74:
;75:	player->client->pers.roll.segmentDisqualified = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43356
ADDP4
CNSTI4 1
ASGNI4
line 79
;76:
;77:	// use temp events at source and destination to prevent the effect
;78:	// from getting dropped by a second player event
;79:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $130
line 80
;80:		tent = G_TempEntity( player->client->ps.origin, EV_PLAYER_TELEPORT_OUT );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 60
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 81
;81:		tent->s.clientNum = player->s.clientNum;
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
line 83
;82:
;83:		tent = G_TempEntity( origin, EV_PLAYER_TELEPORT_IN );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 84
;84:		tent->s.clientNum = player->s.clientNum;
ADDRLP4 16
CNSTI4 220
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 85
;85:	}
LABELV $130
line 88
;86:
;87:	// unlink to make sure it can't possibly interfere with G_KillBox
;88:	trap_UnlinkEntity (player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 90
;89:
;90:	VectorCopy ( origin, player->client->ps.origin );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 91
;91:	player->client->ps.origin[2] += 1;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 94
;92:
;93:	// spit the player out
;94:	AngleVectors( angles, player->client->ps.velocity, NULL, NULL );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 95
;95:	VectorScale( player->client->ps.velocity, 400, player->client->ps.velocity );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTF4 1137180672
ADDRLP4 12
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTF4 1137180672
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTF4 1137180672
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ASGNF4
line 96
;96:	player->client->ps.pm_time = 160;		// hold time
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 160
ASGNI4
line 97
;97:	player->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 100
;98:
;99:	// toggle the teleport bit so the client knows to not lerp
;100:	player->client->ps.eFlags ^= EF_TELEPORT_BIT;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 103
;101:
;102:	// set angles
;103:	DF_PreDeltaAngleChange(player->client);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 DF_PreDeltaAngleChange
CALLV
pop
line 104
;104:	SetClientViewAngle( player, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 105
;105:	DF_PostDeltaAngleChange(player->client, qtrue);
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
line 108
;106:
;107:	// kill anything at the destination
;108:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR && !player->client->sess.raceMode) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $132
ADDRLP4 32
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $132
line 109
;109:		G_KillBox (player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
line 110
;110:	}
LABELV $132
line 113
;111:
;112:	// save results of pmove
;113:	BG_PlayerStateToEntityState( &player->client->ps, &player->s, qtrue );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 116
;114:
;115:	// use the precise origin for linking
;116:	VectorCopy( player->client->ps.origin, player->r.currentOrigin );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 118
;117:
;118:	if ( player->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $134
line 119
;119:		trap_LinkEntity (player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 120
;120:	}
LABELV $134
line 122
;121:
;122:	if (player->client->sess.raceMode) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $136
line 124
;123:		//player->client->ps.powerups[PW_YSALAMIRI] = 0; //Fuck
;124:		player->client->ps.powerups[PW_FORCE_BOON] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 400
ADDP4
CNSTI4 0
ASGNI4
line 136
;125:		//if (player->client->sess.movementStyle == MV_RJQ3 || player->client->sess.movementStyle == MV_RJCPM || player->client->sess.movementStyle == MV_TRIBES) //Get rid of their rockets when they tele/noclip..?
;126:		//	DeletePlayerProjectiles(player);
;127:		//if (player->client->sess.movementStyle == MV_COOP_JKA && player->client->ps.duelInProgress) { //clean this up..
;128:		//	gentity_t* gripEnt;
;129:		//	WP_ForcePowerStop(player, FP_GRIP);
;130:		//
;131:		//	gripEnt = &g_entities[player->client->ps.duelIndex];
;132:		//	if (gripEnt && gripEnt->client) {
;133:		//		WP_ForcePowerStop(gripEnt, FP_GRIP);
;134:		//	}
;135:		//}
;136:	}
LABELV $136
line 137
;137:}
LABELV $127
endproc TeleportPlayer 44 16
export SP_misc_teleporter_dest
proc SP_misc_teleporter_dest 0 0
line 145
;138:
;139:
;140:/*QUAKED misc_teleporter_dest (1 0 0) (-32 -32 -24) (32 32 -16)
;141:Point teleporters at these.
;142:Now that we don't have teleport destination pads, this is just
;143:an info_notnull
;144:*/
;145:void SP_misc_teleporter_dest( gentity_t *ent ) {
line 146
;146:}
LABELV $138
endproc SP_misc_teleporter_dest 0 0
export SP_misc_model
proc SP_misc_model 0 4
line 154
;147:
;148:
;149://===========================================================
;150:
;151:/*QUAKED misc_model (1 0 0) (-16 -16 -16) (16 16 16)
;152:"model"		arbitrary .md3 file to display
;153:*/
;154:void SP_misc_model( gentity_t *ent ) {
line 165
;155:
;156:#if 0
;157:	ent->s.modelindex = G_ModelIndex( ent->model );
;158:	VectorSet (ent->mins, -16, -16, -16);
;159:	VectorSet (ent->maxs, 16, 16, 16);
;160:	trap_LinkEntity (ent);
;161:
;162:	G_SetOrigin( ent, ent->s.origin );
;163:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
;164:#else
;165:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 167
;166:#endif
;167:}
LABELV $139
endproc SP_misc_model 0 4
export SP_misc_G2model
proc SP_misc_G2model 0 4
line 173
;168:
;169:
;170:/*QUAKED misc_G2model (1 0 0) (-16 -16 -16) (16 16 16)
;171:"model"		arbitrary .glm file to display
;172:*/
;173:void SP_misc_G2model( gentity_t *ent ) {
line 187
;174:
;175:#if 0
;176:	char name1[200] = "models/players/kyle/modelmp.glm";
;177:	trap_G2API_InitGhoul2Model(&ent->s, name1, G_ModelIndex( name1 ), 0, 0, 0, 0);
;178:	trap_G2API_SetBoneAnim(ent->s.ghoul2, 0, "model_root", 0, 12, BONE_ANIM_OVERRIDE_LOOP, 1.0f, level.time, -1, -1);
;179:	ent->s.radius = 150;
;180://	VectorSet (ent->mins, -16, -16, -16);
;181://	VectorSet (ent->maxs, 16, 16, 16);
;182:	trap_LinkEntity (ent);
;183:
;184:	G_SetOrigin( ent, ent->s.origin );
;185:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
;186:#else
;187:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 189
;188:#endif
;189:}
LABELV $140
endproc SP_misc_G2model 0 4
export locateCamera
proc locateCamera 60 12
line 193
;190:
;191://===========================================================
;192:
;193:void locateCamera( gentity_t *ent ) {
line 198
;194:	vec3_t		dir;
;195:	gentity_t	*target;
;196:	gentity_t	*owner;
;197:
;198:	owner = G_PickTarget( ent->target, !g_defrag.integer, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
NEI4 $144
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $145
JUMPV
LABELV $144
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $145
ADDRLP4 20
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 24
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 199
;199:	if ( !owner ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $146
line 200
;200:		G_Printf( "Couldn't find target for misc_partal_surface\n" );
ADDRGP4 $148
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 201
;201:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 202
;202:		return;
ADDRGP4 $141
JUMPV
LABELV $146
line 204
;203:	}
;204:	ent->r.ownerNum = owner->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 207
;205:
;206:	// frame holds the rotate speed
;207:	if ( owner->spawnflags & 1 ) {
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $149
line 208
;208:		ent->s.frame = 25;
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 25
ASGNI4
line 209
;209:	} else if ( owner->spawnflags & 2 ) {
ADDRGP4 $150
JUMPV
LABELV $149
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $151
line 210
;210:		ent->s.frame = 75;
ADDRFP4 0
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 75
ASGNI4
line 211
;211:	}
LABELV $151
LABELV $150
line 214
;212:
;213:	// swing camera ?
;214:	if ( owner->spawnflags & 4 ) {
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $153
line 216
;215:		// set to 0 for no rotation at all
;216:		ent->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 0
ASGNI4
line 217
;217:	}
ADDRGP4 $154
JUMPV
LABELV $153
line 218
;218:	else {
line 219
;219:		ent->s.powerups = 1;
ADDRFP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1
ASGNI4
line 220
;220:	}
LABELV $154
line 223
;221:
;222:	// clientNum holds the rotate offset
;223:	ent->s.clientNum = owner->s.clientNum;
ADDRLP4 28
CNSTI4 220
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 225
;224:
;225:	VectorCopy( owner->s.origin, ent->s.origin2 );
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 228
;226:
;227:	// see if the portal_camera has a target
;228:	target = G_PickTarget( owner->target, !g_defrag.integer, NULL);
ADDRLP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
NEI4 $157
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRGP4 $158
JUMPV
LABELV $157
ADDRLP4 32
CNSTI4 0
ASGNI4
LABELV $158
ADDRLP4 32
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 36
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 36
INDIRP4
ASGNP4
line 229
;229:	if ( target ) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $159
line 230
;230:		VectorSubtract( target->s.origin, owner->s.origin, dir );
ADDRLP4 44
CNSTI4 92
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
CNSTI4 96
ASGNI4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56
CNSTI4 100
ASGNI4
ADDRLP4 4+8
ADDRLP4 16
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 231
;231:		VectorNormalize( dir );
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 232
;232:	} else {
ADDRGP4 $160
JUMPV
LABELV $159
line 233
;233:		G_SetMovedir( owner->s.angles, dir );
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 234
;234:	}
LABELV $160
line 236
;235:
;236:	ent->s.eventParm = DirToByte( dir );
ADDRLP4 4
ARGP4
ADDRLP4 40
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 237
;237:}
LABELV $141
endproc locateCamera 60 12
export SP_misc_portal_surface
proc SP_misc_portal_surface 20 4
line 243
;238:
;239:/*QUAKED misc_portal_surface (0 0 1) (-8 -8 -8) (8 8 8)
;240:The portal surface nearest this entity will show a view from the targeted misc_portal_camera, or a mirror view if untargeted.
;241:This must be within 64 world units of the surface!
;242:*/
;243:void SP_misc_portal_surface(gentity_t *ent) {
line 244
;244:	VectorClear( ent->r.mins );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 245
;245:	VectorClear( ent->r.maxs );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 246
;246:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 248
;247:
;248:	ent->r.svFlags = SVF_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 64
ASGNI4
line 249
;249:	ent->s.eType = ET_PORTAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 8
ASGNI4
line 251
;250:
;251:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $164
line 252
;252:		VectorCopy( ent->s.origin, ent->s.origin2 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 253
;253:	} else {
ADDRGP4 $165
JUMPV
LABELV $164
line 254
;254:		ent->think = locateCamera;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 locateCamera
ASGNP4
line 255
;255:		ent->nextthink = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 256
;256:	}
LABELV $165
line 257
;257:}
LABELV $163
endproc SP_misc_portal_surface 20 4
export SP_misc_portal_camera
proc SP_misc_portal_camera 20 12
line 263
;258:
;259:/*QUAKED misc_portal_camera (0 0 1) (-8 -8 -8) (8 8 8) slowrotate fastrotate noswing
;260:The target for a misc_portal_director.  You can set either angles or target another entity to determine the direction of view.
;261:"roll" an angle modifier to orient the camera around the target vector;
;262:*/
;263:void SP_misc_portal_camera(gentity_t *ent) {
line 266
;264:	float	roll;
;265:
;266:	VectorClear( ent->r.mins );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 267
;267:	VectorClear( ent->r.maxs );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
line 268
;268:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 270
;269:
;270:	G_SpawnFloat( "roll", "0", &roll );
ADDRGP4 $168
ARGP4
ADDRGP4 $169
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 272
;271:
;272:	ent->s.clientNum = roll/360.0 * 256;
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTF4 1132462080
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 273
;273:}
LABELV $167
endproc SP_misc_portal_camera 20 12
export HolocronRespawn
proc HolocronRespawn 4 0
line 319
;274:
;275:/*QUAKED misc_holocron (0 0 1) (-8 -8 -8) (8 8 8)
;276:count	Set to type of holocron (based on force power value)
;277:	HEAL = 0
;278:	JUMP = 1
;279:	SPEED = 2
;280:	PUSH = 3
;281:	PULL = 4
;282:	TELEPATHY = 5
;283:	GRIP = 6
;284:	LIGHTNING = 7
;285:	RAGE = 8
;286:	PROTECT = 9
;287:	ABSORB = 10
;288:	TEAM HEAL = 11
;289:	TEAM FORCE = 12
;290:	DRAIN = 13
;291:	SEE = 14
;292:	SABERATTACK = 15
;293:	SABERDEFEND = 16
;294:	SABERTHROW = 17
;295:*/
;296:
;297:/*char *holocronTypeModels[] = {
;298:	"models/chunks/rock/rock_big.md3",//FP_HEAL,
;299:	"models/chunks/rock/rock_big.md3",//FP_LEVITATION,
;300:	"models/chunks/rock/rock_big.md3",//FP_SPEED,
;301:	"models/chunks/rock/rock_big.md3",//FP_PUSH,
;302:	"models/chunks/rock/rock_big.md3",//FP_PULL,
;303:	"models/chunks/rock/rock_big.md3",//FP_TELEPATHY,
;304:	"models/chunks/rock/rock_big.md3",//FP_GRIP,
;305:	"models/chunks/rock/rock_big.md3",//FP_LIGHTNING,
;306:	"models/chunks/rock/rock_big.md3",//FP_RAGE,
;307:	"models/chunks/rock/rock_big.md3",//FP_PROTECT,
;308:	"models/chunks/rock/rock_big.md3",//FP_ABSORB,
;309:	"models/chunks/rock/rock_big.md3",//FP_TEAM_HEAL,
;310:	"models/chunks/rock/rock_big.md3",//FP_TEAM_FORCE,
;311:	"models/chunks/rock/rock_big.md3",//FP_DRAIN,
;312:	"models/chunks/rock/rock_big.md3",//FP_SEE
;313:	"models/chunks/rock/rock_big.md3",//FP_SABERATTACK
;314:	"models/chunks/rock/rock_big.md3",//FP_SABERDEFEND
;315:	"models/chunks/rock/rock_big.md3"//FP_SABERTHROW
;316:};*/
;317:
;318:void HolocronRespawn(gentity_t *self)
;319:{
line 320
;320:	self->s.modelindex = (self->count - 128);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 128
SUBI4
ASGNI4
line 321
;321:}
LABELV $170
endproc HolocronRespawn 4 0
export HolocronPopOut
proc HolocronPopOut 12 16
line 324
;322:
;323:void HolocronPopOut(gentity_t *self)
;324:{
line 325
;325:	if (Q_irand(1, 10, g_defrag.integer, 5) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 0
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
GEI4 $172
line 326
;326:	{
line 327
;327:		self->s.pos.trDelta[0] = 150 + Q_irand(1, 100, g_defrag.integer, 50);
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 50
ARGI4
ADDRLP4 4
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 150
ADDI4
CVIF4 4
ASGNF4
line 328
;328:	}
ADDRGP4 $173
JUMPV
LABELV $172
line 330
;329:	else
;330:	{
line 331
;331:		self->s.pos.trDelta[0] = -150 - Q_irand(1, 100, g_defrag.integer, 50);
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 50
ARGI4
ADDRLP4 4
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTI4 -150
ADDRLP4 4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 332
;332:	}
LABELV $173
line 333
;333:	if (Q_irand(1, 10, g_defrag.integer, 5) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 4
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
GEI4 $177
line 334
;334:	{
line 335
;335:		self->s.pos.trDelta[1] = 150 + Q_irand(1, 100, g_defrag.integer, 50);
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 50
ARGI4
ADDRLP4 8
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 150
ADDI4
CVIF4 4
ASGNF4
line 336
;336:	}
ADDRGP4 $178
JUMPV
LABELV $177
line 338
;337:	else
;338:	{
line 339
;339:		self->s.pos.trDelta[1] = -150 - Q_irand(1, 100, g_defrag.integer, 50);
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 50
ARGI4
ADDRLP4 8
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 -150
ADDRLP4 8
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 340
;340:	}
LABELV $178
line 341
;341:	self->s.pos.trDelta[2] = 150 + Q_irand(1, 100, g_defrag.integer, 50);
CNSTI4 1
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 50
ARGI4
ADDRLP4 8
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 150
ADDI4
CVIF4 4
ASGNF4
line 342
;342:}
LABELV $171
endproc HolocronPopOut 12 16
export HolocronTouch
proc HolocronTouch 60 12
line 345
;343:
;344:void HolocronTouch(gentity_t *self, gentity_t *other, trace_t *trace)
;345:{
line 346
;346:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 347
;347:	int othercarrying = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 348
;348:	float time_lowest = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 349
;349:	int index_lowest = -1;
ADDRLP4 4
CNSTI4 -1
ASGNI4
line 350
;350:	int hasall = 1;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 351
;351:	int forceReselect = WP_NONE;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 353
;352:
;353:	if (trace)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $184
line 354
;354:	{
line 355
;355:		self->s.groundEntityNum = trace->entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 356
;356:	}
LABELV $184
line 358
;357:
;358:	if (!other || !other->client || other->health < 1)
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
EQU4 $189
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $189
ADDRLP4 24
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $186
LABELV $189
line 359
;359:	{
line 360
;360:		return;
ADDRGP4 $183
JUMPV
LABELV $186
line 363
;361:	}
;362:
;363:	if (!self->s.modelindex)
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
NEI4 $190
line 364
;364:	{
line 365
;365:		return;
ADDRGP4 $183
JUMPV
LABELV $190
line 368
;366:	}
;367:
;368:	if (self->enemy)
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $192
line 369
;369:	{
line 370
;370:		return;
ADDRGP4 $183
JUMPV
LABELV $192
line 373
;371:	}
;372:
;373:	if (other->client->ps.holocronsCarried[self->count])
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
CNSTF4 0
EQF4 $194
line 374
;374:	{
line 375
;375:		return;
ADDRGP4 $183
JUMPV
LABELV $194
line 378
;376:	}
;377:
;378:	if (other->client->ps.holocronCantTouch == self->s.number && other->client->ps.holocronCantTouchTime > LEVELTIME(other->client))
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $207
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $202
ADDRLP4 40
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $202
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $204
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $205
JUMPV
LABELV $204
ADDRLP4 36
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $205
ADDRLP4 32
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 $203
JUMPV
LABELV $202
ADDRLP4 32
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $203
ADDRLP4 40
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
ADDRLP4 32
INDIRI4
CVIF4 4
LEF4 $207
line 379
;379:	{
line 380
;380:		return;
ADDRGP4 $183
JUMPV
LABELV $206
line 384
;381:	}
;382:
;383:	while (i < NUM_FORCE_POWERS)
;384:	{
line 385
;385:		if (other->client->ps.holocronsCarried[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
CNSTF4 0
EQF4 $209
line 386
;386:		{
line 387
;387:			othercarrying++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 389
;388:
;389:			if (index_lowest == -1 || other->client->ps.holocronsCarried[i] < time_lowest)
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $213
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $210
LABELV $213
line 390
;390:			{
line 391
;391:				index_lowest = i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 392
;392:				time_lowest = other->client->ps.holocronsCarried[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
ASGNF4
line 393
;393:			}
line 394
;394:		}
ADDRGP4 $210
JUMPV
LABELV $209
line 395
;395:		else if (i != self->count)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
EQI4 $214
line 396
;396:		{
line 397
;397:			hasall = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 398
;398:		}
LABELV $214
LABELV $210
line 399
;399:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 400
;400:	}
LABELV $207
line 383
ADDRLP4 0
INDIRI4
CNSTI4 18
LTI4 $206
line 402
;401:
;402:	if (hasall)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $216
line 403
;403:	{ //once we pick up this holocron we'll have all of them, so give us super special best prize!
line 405
;404:		//G_Printf("You deserve a pat on the back.\n");
;405:	}
LABELV $216
line 407
;406:
;407:	if (!(other->client->ps.fd.forcePowersActive & (1 << other->client->ps.fd.forcePowerSelected)))
ADDRLP4 44
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 44
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $218
line 408
;408:	{ //If the player isn't using his currently selected force power, select this one
line 409
;409:		if (self->count != FP_SABERATTACK && self->count != FP_SABERDEFEND && self->count != FP_SABERTHROW && self->count != FP_LEVITATION)
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 15
EQI4 $220
ADDRLP4 48
INDIRI4
CNSTI4 16
EQI4 $220
ADDRLP4 48
INDIRI4
CNSTI4 17
EQI4 $220
ADDRLP4 48
INDIRI4
CNSTI4 1
EQI4 $220
line 410
;410:		{
line 411
;411:			other->client->ps.fd.forcePowerSelected = self->count;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 852
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 412
;412:		}
LABELV $220
line 413
;413:	}
LABELV $218
line 415
;414:
;415:	if (g_MaxHolocronCarry.integer && othercarrying >= g_MaxHolocronCarry.integer)
ADDRGP4 g_MaxHolocronCarry+12
INDIRI4
CNSTI4 0
EQI4 $222
ADDRLP4 12
INDIRI4
ADDRGP4 g_MaxHolocronCarry+12
INDIRI4
LTI4 $222
line 416
;416:	{ //make the oldest holocron carried by the player pop out to make room for this one
line 417
;417:		other->client->ps.holocronsCarried[index_lowest] = 0;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 432
;418:
;419:		/*
;420:		if (index_lowest == FP_SABERATTACK && !HasSetSaberOnly())
;421:		{ //you lost your saberattack holocron, so no more saber for you
;422:			other->client->ps.stats[STAT_WEAPONS] |= (1 << WP_STUN_BATON);
;423:			other->client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_SABER);
;424:
;425:			if (other->client->ps.weapon == WP_SABER)
;426:			{
;427:				forceReselect = WP_SABER;
;428:			}
;429:		}
;430:		*/
;431:		//NOTE: No longer valid as we are now always giving a force level 1 saber attack level in holocron
;432:	}
LABELV $222
line 435
;433:
;434:	//G_Sound(other, CHAN_AUTO, G_SoundIndex("sound/weapons/w_pkup.wav"));
;435:	G_AddEvent( other, EV_ITEM_PICKUP, self->s.number );
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
line 437
;436:
;437:	other->client->ps.holocronsCarried[self->count] = LEVELTIME(other->client);
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
EQU4 $230
ADDRLP4 56
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $230
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $232
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
ADDRGP4 $233
JUMPV
LABELV $232
ADDRLP4 52
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $233
ADDRLP4 48
ADDRLP4 52
INDIRI4
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $230
ADDRLP4 48
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $231
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
line 438
;438:	self->s.modelindex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
CNSTI4 0
ASGNI4
line 439
;439:	self->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 441
;440:
;441:	self->pos2[0] = 1;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTF4 1065353216
ASGNF4
line 442
;442:	self->pos2[1] = level.time + HOLOCRON_RESPAWN_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 30000
ADDI4
CVIF4 4
ASGNF4
line 457
;443:
;444:	/*
;445:	if (self->count == FP_SABERATTACK && !HasSetSaberOnly())
;446:	{ //player gets a saber
;447:		other->client->ps.stats[STAT_WEAPONS] |= (1 << WP_SABER);
;448:		other->client->ps.stats[STAT_WEAPONS] &= ~(1 << WP_STUN_BATON);
;449:
;450:		if (other->client->ps.weapon == WP_STUN_BATON)
;451:		{
;452:			forceReselect = WP_STUN_BATON;
;453:		}
;454:	}
;455:	*/
;456:
;457:	if (forceReselect != WP_NONE)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $235
line 458
;458:	{
line 459
;459:		G_AddEvent(other, EV_NOAMMO, forceReselect);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 22
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 460
;460:	}
LABELV $235
line 463
;461:
;462:	//G_Printf("DON'T TOUCH ME\n");
;463:}
LABELV $183
endproc HolocronTouch 60 12
export HolocronThink
proc HolocronThink 64 4
line 466
;464:
;465:void HolocronThink(gentity_t *ent)
;466:{
line 467
;467:	if (ent->pos2[0] && (!ent->enemy || !ent->enemy->client || ent->enemy->health < 1))
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
EQF4 $238
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 744
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
EQU4 $241
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $241
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $238
LABELV $241
line 468
;468:	{
line 469
;469:		if (ent->enemy && ent->enemy->client)
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 744
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
EQU4 $239
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $239
line 470
;470:		{
line 471
;471:			HolocronRespawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HolocronRespawn
CALLV
pop
line 472
;472:			VectorCopy(ent->enemy->client->ps.origin, ent->s.pos.trBase);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 20
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
line 473
;473:			VectorCopy(ent->enemy->client->ps.origin, ent->s.origin);
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
line 474
;474:			VectorCopy(ent->enemy->client->ps.origin, ent->r.currentOrigin);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 28
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
line 476
;475:			//copy to person carrying's origin before popping out of them
;476:			HolocronPopOut(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HolocronPopOut
CALLV
pop
line 477
;477:			ent->enemy->client->ps.holocronsCarried[ent->count] = 0;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 478
;478:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTP4 0
ASGNP4
line 480
;479:			
;480:			goto justthink;
ADDRGP4 $244
JUMPV
line 482
;481:		}
;482:	}
LABELV $238
line 483
;483:	else if (ent->pos2[0] && ent->enemy && ent->enemy->client)
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
CNSTF4 0
EQF4 $245
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 744
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
EQU4 $245
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $245
line 484
;484:	{
line 485
;485:		ent->pos2[1] = level.time + HOLOCRON_RESPAWN_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 30000
ADDI4
CVIF4 4
ASGNF4
line 486
;486:	}
LABELV $245
LABELV $239
line 488
;487:
;488:	if (ent->enemy && ent->enemy->client)
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 744
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
EQU4 $248
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $248
line 489
;489:	{
line 490
;490:		if (!ent->enemy->client->ps.holocronsCarried[ent->count])
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
INDIRF4
CNSTF4 0
NEF4 $250
line 491
;491:		{
line 492
;492:			ent->enemy->client->ps.holocronCantTouch = ent->s.number;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 36
INDIRP4
INDIRI4
ASGNI4
line 493
;493:			ent->enemy->client->ps.holocronCantTouchTime = LEVELTIME(ent->enemy->client) + 5000;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $256
ADDRLP4 48
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $256
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $258
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $259
JUMPV
LABELV $258
ADDRLP4 44
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $259
ADDRLP4 40
ADDRLP4 44
INDIRI4
ASGNI4
ADDRGP4 $257
JUMPV
LABELV $256
ADDRLP4 40
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $257
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 40
INDIRI4
CNSTI4 5000
ADDI4
CVIF4 4
ASGNF4
line 495
;494:
;495:			HolocronRespawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HolocronRespawn
CALLV
pop
line 496
;496:			VectorCopy(ent->enemy->client->ps.origin, ent->s.pos.trBase);
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
line 497
;497:			VectorCopy(ent->enemy->client->ps.origin, ent->s.origin);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 56
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
line 498
;498:			VectorCopy(ent->enemy->client->ps.origin, ent->r.currentOrigin);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 60
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
line 500
;499:			//copy to person carrying's origin before popping out of them
;500:			HolocronPopOut(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HolocronPopOut
CALLV
pop
line 501
;501:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTP4 0
ASGNP4
line 503
;502:
;503:			goto justthink;
ADDRGP4 $244
JUMPV
LABELV $250
line 506
;504:		}
;505:
;506:		if (!ent->enemy->inuse || (ent->enemy->client && ent->enemy->client->ps.fallingToDeath))
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $262
ADDRLP4 44
ADDRLP4 36
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $260
ADDRLP4 44
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $260
LABELV $262
line 507
;507:		{
line 508
;508:			if (ent->enemy->inuse && ent->enemy->client)
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $263
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $263
line 509
;509:			{
line 510
;510:				ent->enemy->client->ps.holocronBits &= ~(1 << ent->count);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 52
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 52
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
LSHI4
BCOMI4
BANDI4
ASGNI4
line 511
;511:				ent->enemy->client->ps.holocronsCarried[ent->count] = 0;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 60
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ADDP4
CNSTF4 0
ASGNF4
line 512
;512:			}
LABELV $263
line 513
;513:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTP4 0
ASGNP4
line 514
;514:			HolocronRespawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HolocronRespawn
CALLV
pop
line 515
;515:			VectorCopy(ent->s.origin2, ent->s.pos.trBase);
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
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 516
;516:			VectorCopy(ent->s.origin2, ent->s.origin);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 517
;517:			VectorCopy(ent->s.origin2, ent->r.currentOrigin);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 519
;518:
;519:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 521
;520:
;521:			ent->pos2[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTF4 0
ASGNF4
line 523
;522:
;523:			trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 525
;524:
;525:			goto justthink;
ADDRGP4 $244
JUMPV
LABELV $260
line 527
;526:		}
;527:	}
LABELV $248
line 529
;528:
;529:	if (ent->pos2[0] && ent->pos2[1] < level.time)
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
CNSTF4 0
EQF4 $266
ADDRLP4 32
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $266
line 530
;530:	{ //isn't in original place and has been there for (HOLOCRON_RESPAWN_TIME) seconds without being picked up, so respawn
line 531
;531:		VectorCopy(ent->s.origin2, ent->s.pos.trBase);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 532
;532:		VectorCopy(ent->s.origin2, ent->s.origin);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 533
;533:		VectorCopy(ent->s.origin2, ent->r.currentOrigin);
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
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 535
;534:
;535:		ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 537
;536:
;537:		ent->pos2[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTF4 0
ASGNF4
line 539
;538:
;539:		trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 540
;540:	}
LABELV $266
LABELV $244
line 543
;541:
;542:justthink:
;543:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 545
;544:
;545:	if (ent->s.pos.trDelta[0] || ent->s.pos.trDelta[1] || ent->s.pos.trDelta[2])
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
NEF4 $274
ADDRLP4 36
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
NEF4 $274
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
EQF4 $271
LABELV $274
line 546
;546:	{
line 547
;547:		G_RunObject(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 548
;548:	}
LABELV $271
line 549
;549:}
LABELV $237
endproc HolocronThink 64 4
export SP_misc_holocron
proc SP_misc_holocron 1132 28
line 552
;550:
;551:void SP_misc_holocron(gentity_t *ent)
;552:{
line 556
;553:	vec3_t dest;
;554:	trace_t tr;
;555:
;556:	if (g_gametype.integer != GT_HOLOCRON)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $276
line 557
;557:	{
line 558
;558:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 559
;559:		return;
ADDRGP4 $275
JUMPV
LABELV $276
line 562
;560:	}
;561:
;562:	if (HasSetSaberOnly())
ADDRLP4 1092
ADDRGP4 HasSetSaberOnly
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
EQI4 $279
line 563
;563:	{
line 564
;564:		if (ent->count == FP_SABERATTACK ||
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 15
EQI4 $284
ADDRLP4 1096
INDIRI4
CNSTI4 16
EQI4 $284
ADDRLP4 1096
INDIRI4
CNSTI4 17
NEI4 $281
LABELV $284
line 567
;565:			ent->count == FP_SABERDEFEND ||
;566:			ent->count == FP_SABERTHROW)
;567:		{ //having saber holocrons in saber only mode is pointless
line 568
;568:			G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 569
;569:			return;
ADDRGP4 $275
JUMPV
LABELV $281
line 571
;570:		}
;571:	}
LABELV $279
line 573
;572:
;573:	ent->s.isJediMaster = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 244
ADDP4
CNSTI4 1
ASGNI4
line 575
;574:
;575:	VectorSet( ent->r.maxs, 8, 8, 8 );
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
CNSTF4 1090519040
ASGNF4
line 576
;576:	VectorSet( ent->r.mins, -8, -8, -8 );
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
CNSTF4 3238002688
ASGNF4
line 578
;577:
;578:	ent->s.origin[2] += 0.1f;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 1096
INDIRP4
ADDRLP4 1096
INDIRP4
INDIRF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 579
;579:	ent->r.maxs[2] -= 0.1f;
ADDRLP4 1100
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 1100
INDIRP4
ADDRLP4 1100
INDIRP4
INDIRF4
CNSTF4 1036831949
SUBF4
ASGNF4
line 581
;580:
;581:	VectorSet( dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096 );
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1104
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1104
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 582
;582:	JP_Trace( &tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1108
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1108
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1108
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 583
;583:	if ( tr.startsolid )
ADDRLP4 12+4
INDIRI4
CNSTI4 0
EQI4 $287
line 584
;584:	{
line 585
;585:		G_Printf ("SP_misc_holocron: misc_holocron startsolid at %s\n", vtos(ent->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1112
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $290
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 586
;586:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 587
;587:		return;
ADDRGP4 $275
JUMPV
LABELV $287
line 591
;588:	}
;589:
;590:	//add the 0.1 back after the trace
;591:	ent->r.maxs[2] += 0.1f;
ADDRLP4 1112
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 1112
INDIRP4
ADDRLP4 1112
INDIRP4
INDIRF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 596
;592:
;593:	// allow to ride movers
;594://	ent->s.groundEntityNum = tr.entityNum;
;595:
;596:	G_SetOrigin( ent, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 598
;597:
;598:	if (ent->count < 0)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
GEI4 $292
line 599
;599:	{
line 600
;600:		ent->count = 0;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 0
ASGNI4
line 601
;601:	}
LABELV $292
line 603
;602:
;603:	if (ent->count >= NUM_FORCE_POWERS)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 18
LTI4 $294
line 604
;604:	{
line 605
;605:		ent->count = NUM_FORCE_POWERS-1;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 17
ASGNI4
line 606
;606:	}
LABELV $294
line 618
;607:/*
;608:	if (g_forcePowerDisable.integer &&
;609:		(g_forcePowerDisable.integer & (1 << ent->count)))
;610:	{
;611:		G_FreeEntity(ent);
;612:		return;
;613:	}
;614:*/
;615:	//No longer doing this, causing too many complaints about accidentally setting no force powers at all
;616:	//and starting a holocron game (making it basically just FFA)
;617:
;618:	ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTP4 0
ASGNP4
line 620
;619:
;620:	ent->s.eFlags = EF_BOUNCE_HALF;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 622
;621:
;622:	ent->s.modelindex = (ent->count - 128);//G_ModelIndex(holocronTypeModels[ent->count]);
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 1116
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 128
SUBI4
ASGNI4
line 623
;623:	ent->s.eType = ET_HOLOCRON;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 5
ASGNI4
line 624
;624:	ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 625
;625:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 627
;626:
;627:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 628
;628:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 1
ASGNI4
line 630
;629:
;630:	ent->s.trickedentindex4 = ent->count;
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 1120
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 632
;631:
;632:	if (forcePowerDarkLight[ent->count] == FORCE_DARKSIDE)
ADDRLP4 1124
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ADDRLP4 1124
INDIRI4
LSHI4
ADDRGP4 forcePowerDarkLight
ADDP4
INDIRI4
ADDRLP4 1124
INDIRI4
NEI4 $297
line 633
;633:	{
line 634
;634:		ent->s.trickedentindex3 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 1
ASGNI4
line 635
;635:	}
ADDRGP4 $298
JUMPV
LABELV $297
line 636
;636:	else if (forcePowerDarkLight[ent->count] == FORCE_LIGHTSIDE)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 forcePowerDarkLight
ADDP4
INDIRI4
CNSTI4 1
NEI4 $299
line 637
;637:	{
line 638
;638:		ent->s.trickedentindex3 = 2;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 2
ASGNI4
line 639
;639:	}
ADDRGP4 $300
JUMPV
LABELV $299
line 641
;640:	else
;641:	{
line 642
;642:		ent->s.trickedentindex3 = 3;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 3
ASGNI4
line 643
;643:	}
LABELV $300
LABELV $298
line 645
;644:
;645:	ent->physicsObject = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 647
;646:
;647:	VectorCopy(ent->s.pos.trBase, ent->s.origin2); //remember the spawn spot
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 1128
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 649
;648:
;649:	ent->touch = HolocronTouch;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 HolocronTouch
ASGNP4
line 651
;650:
;651:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 653
;652:
;653:	ent->think = HolocronThink;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 HolocronThink
ASGNP4
line 654
;654:	ent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 655
;655:}
LABELV $275
endproc SP_misc_holocron 1132 28
export Use_Shooter
proc Use_Shooter 64 16
line 665
;656:
;657:/*
;658:======================================================================
;659:
;660:  SHOOTERS
;661:
;662:======================================================================
;663:*/
;664:
;665:void Use_Shooter( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 671
;666:	vec3_t		dir;
;667:	float		deg;
;668:	vec3_t		up, right;
;669:
;670:	// see if we have a target
;671:	if ( ent->enemy ) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $303
line 672
;672:		VectorSubtract( ent->enemy->r.currentOrigin, ent->s.origin, dir );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 48
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 673
;673:		VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 674
;674:	} else {
ADDRGP4 $304
JUMPV
LABELV $303
line 675
;675:		VectorCopy( ent->movedir, dir );
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRB
ASGNB 12
line 676
;676:	}
LABELV $304
line 679
;677:
;678:	// randomize a bit
;679:	PerpendicularVector( up, dir );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 680
;680:	CrossProduct( up, dir, right );
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 682
;681:
;682:	deg = crandom() * ent->random;
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
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
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
MULF4
ASGNF4
line 683
;683:	VectorMA( dir, deg, up, dir );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 685
;684:
;685:	deg = crandom() * ent->random;
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
CNSTF4 1073741824
ADDRLP4 48
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
ASGNF4
line 686
;686:	VectorMA( dir, deg, right, dir );
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 688
;687:
;688:	VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 690
;689:
;690:	switch ( ent->s.weapon ) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 4
EQI4 $322
ADDRGP4 $319
JUMPV
LABELV $322
line 692
;691:	case WP_BLASTER:
;692:		WP_FireBlasterMissile( ent, ent->s.origin, dir, qfalse );
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_FireBlasterMissile
CALLV
pop
line 693
;693:		break;
LABELV $319
LABELV $320
line 696
;694:	}
;695:
;696:	G_AddEvent( ent, EV_FIRE_WEAPON, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 24
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 697
;697:}
LABELV $302
endproc Use_Shooter 64 16
proc InitShooter_Finish 8 12
line 700
;698:
;699:
;700:static void InitShooter_Finish( gentity_t *ent ) {
line 701
;701:	ent->enemy = G_PickTarget( ent->target, qtrue/* !g_defrag.integer*/, NULL);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 4
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 702
;702:	ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTP4 0
ASGNP4
line 703
;703:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 704
;704:}
LABELV $323
endproc InitShooter_Finish 8 12
export InitShooter
proc InitShooter 16 8
line 706
;705:
;706:void InitShooter( gentity_t *ent, int weapon ) {
line 707
;707:	ent->use = Use_Shooter;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 Use_Shooter
ASGNP4
line 708
;708:	ent->s.weapon = weapon;
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 710
;709:
;710:	RegisterItem( BG_FindItemForWeapon( weapon ) );
ADDRFP4 4
INDIRI4
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
line 712
;711:
;712:	G_SetMovedir( ent->s.angles, ent->movedir );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 620
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 714
;713:
;714:	if ( !ent->random ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CNSTF4 0
NEF4 $325
line 715
;715:		ent->random = 1.0;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
CNSTF4 1065353216
ASGNF4
line 716
;716:	}
LABELV $325
line 717
;717:	ent->random = sin( M_PI * ent->random / 180 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ASGNP4
CNSTF4 1078530011
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
CNSTF4 1127481344
DIVF4
ARGF4
ADDRLP4 12
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 719
;718:	// target might be a moving object, so we can't set movedir for it
;719:	if ( ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $327
line 720
;720:		ent->think = InitShooter_Finish;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 InitShooter_Finish
ASGNP4
line 721
;721:		ent->nextthink = level.time + 500;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 722
;722:	}
LABELV $327
line 723
;723:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 724
;724:}
LABELV $324
endproc InitShooter 16 8
export SP_shooter_blaster
proc SP_shooter_blaster 0 8
line 730
;725:
;726:/*QUAKED shooter_blaster (1 0 0) (-16 -16 -16) (16 16 16)
;727:Fires at either the target or the current direction.
;728:"random" is the number of degrees of deviance from the taget. (1.0 default)
;729:*/
;730:void SP_shooter_blaster( gentity_t *ent ) {
line 731
;731:	InitShooter( ent, WP_BLASTER);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 InitShooter
CALLV
pop
line 732
;732:}
LABELV $330
endproc SP_shooter_blaster 0 8
export check_recharge
proc check_recharge 8 0
line 735
;733:
;734:void check_recharge(gentity_t *ent)
;735:{
line 736
;736:	if (ent->fly_sound_debounce_time < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $332
line 737
;737:	{
line 738
;738:		ent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 739
;739:	}
LABELV $332
line 741
;740:
;741:	if (ent->count < ent->boltpoint4)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
GEI4 $335
line 742
;742:	{
line 743
;743:		ent->count++;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 728
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
line 744
;744:	}
LABELV $335
line 746
;745:
;746:	ent->nextthink = level.time + ent->bolt_Head;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
ADDI4
ASGNI4
line 747
;747:}
LABELV $331
endproc check_recharge 8 0
export EnergyShieldStationSettings
proc EnergyShieldStationSettings 0 12
line 755
;748:
;749:/*
;750:================
;751:EnergyShieldStationSettings
;752:================
;753:*/
;754:void EnergyShieldStationSettings(gentity_t *ent)
;755:{
line 756
;756:	G_SpawnInt( "count", "0", &ent->count );
ADDRGP4 $339
ARGP4
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 758
;757:
;758:	if (!ent->count)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
NEI4 $340
line 759
;759:	{
line 760
;760:		ent->count = 50; 
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 50
ASGNI4
line 761
;761:	}
LABELV $340
line 763
;762:
;763:	G_SpawnInt("chargerate", "0", &ent->bolt_Head);
ADDRGP4 $342
ARGP4
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 765
;764:
;765:	if (!ent->bolt_Head)
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 0
NEI4 $343
line 766
;766:	{
line 767
;767:		ent->bolt_Head = STATION_RECHARGE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 3000
ASGNI4
line 768
;768:	}
LABELV $343
line 769
;769:}
LABELV $338
endproc EnergyShieldStationSettings 0 12
export shield_power_converter_use
proc shield_power_converter_use 32 12
line 777
;770:
;771:/*
;772:================
;773:shield_power_converter_use
;774:================
;775:*/
;776:void shield_power_converter_use( gentity_t *self, gentity_t *other, gentity_t *activator)
;777:{
line 779
;778:	int dif,add;
;779:	int stop = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 781
;780:
;781:	if (!activator || !activator->client)
ADDRLP4 12
ADDRFP4 8
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
EQU4 $348
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $346
LABELV $348
line 782
;782:	{
line 783
;783:		return;
ADDRGP4 $345
JUMPV
LABELV $346
line 786
;784:	}
;785:
;786:	if (self->setTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $349
line 787
;787:	{
line 788
;788:		if (!self->s.loopSound)
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 0
NEI4 $352
line 789
;789:		{
line 790
;790:			self->s.loopSound = G_SoundIndex("sound/interface/shieldcon_run.wav");
ADDRGP4 $354
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 791
;791:		}
LABELV $352
line 792
;792:		self->setTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 794
;793:
;794:		dif = activator->client->ps.stats[STAT_MAX_HEALTH] - activator->client->ps.stats[STAT_ARMOR];
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
SUBI4
ASGNI4
line 796
;795:
;796:		if (dif > 0)					// Already at full armor?
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $356
line 797
;797:		{
line 798
;798:			if (dif >MAX_AMMO_GIVE)
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $358
line 799
;799:			{
line 800
;800:				add = MAX_AMMO_GIVE;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 801
;801:			}
ADDRGP4 $359
JUMPV
LABELV $358
line 803
;802:			else
;803:			{
line 804
;804:				add = dif;
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
line 805
;805:			}
LABELV $359
line 807
;806:
;807:			if (self->count<add)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $360
line 808
;808:			{
line 809
;809:				add = self->count;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 810
;810:			}
LABELV $360
line 812
;811:
;812:			self->count -= add;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 813
;813:			if (self->count <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
GTI4 $362
line 814
;814:			{
line 815
;815:				self->setTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTI4 0
ASGNI4
line 816
;816:			}
LABELV $362
line 817
;817:			stop = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 819
;818:
;819:			self->fly_sound_debounce_time = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 821
;820:
;821:			activator->client->ps.stats[STAT_ARMOR] += add;
ADDRLP4 28
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 236
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 822
;822:		}
LABELV $356
line 823
;823:	}
LABELV $349
line 825
;824:
;825:	if (stop || self->count <= 0)
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $367
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
GTI4 $365
LABELV $367
line 826
;826:	{
line 827
;827:		if (self->s.loopSound && self->setTime < level.time)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 0
EQI4 $368
ADDRLP4 24
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $368
line 828
;828:		{
line 829
;829:			G_Sound(self, CHAN_AUTO, G_SoundIndex("sound/interface/shieldcon_done.mp3"));
ADDRGP4 $371
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 830
;830:		}
LABELV $368
line 831
;831:		self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 832
;832:		if (self->setTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $372
line 833
;833:		{
line 834
;834:			self->setTime = level.time + self->bolt_Head+100;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
ADDI4
CNSTI4 100
ADDI4
ASGNI4
line 835
;835:		}
LABELV $372
line 836
;836:	}
LABELV $365
line 837
;837:}
LABELV $345
endproc shield_power_converter_use 32 12
export SP_misc_shield_floor_unit
proc SP_misc_shield_floor_unit 1136 28
line 842
;838:
;839://QED comment is in bg_misc
;840://------------------------------------------------------------
;841:void SP_misc_shield_floor_unit( gentity_t *ent )
;842:{
line 846
;843:	vec3_t dest;
;844:	trace_t tr;
;845:
;846:	if (g_gametype.integer != GT_CTF &&
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $377
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
EQI4 $377
line 848
;847:		g_gametype.integer != GT_CTY)
;848:	{
line 849
;849:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 850
;850:		return;
ADDRGP4 $376
JUMPV
LABELV $377
line 853
;851:	}
;852:
;853:	VectorSet( ent->r.mins, -16, -16, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 0
ASGNF4
line 854
;854:	VectorSet( ent->r.maxs, 16, 16, 40 );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1109393408
ASGNF4
line 856
;855:
;856:	ent->s.origin[2] += 0.1f;
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 1092
INDIRP4
ADDRLP4 1092
INDIRP4
INDIRF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 857
;857:	ent->r.maxs[2] -= 0.1f;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 1096
INDIRP4
ADDRLP4 1096
INDIRP4
INDIRF4
CNSTF4 1036831949
SUBF4
ASGNF4
line 859
;858:
;859:	VectorSet( dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096 );
ADDRLP4 1100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1100
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1100
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 860
;860:	JP_Trace( &tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1104
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1104
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1104
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 861
;861:	if ( tr.startsolid )
ADDRLP4 12+4
INDIRI4
CNSTI4 0
EQI4 $383
line 862
;862:	{
line 863
;863:		G_Printf ("SP_misc_shield_floor_unit: misc_shield_floor_unit startsolid at %s\n", vtos(ent->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1108
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $386
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 864
;864:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 865
;865:		return;
ADDRGP4 $376
JUMPV
LABELV $383
line 869
;866:	}
;867:
;868:	//add the 0.1 back after the trace
;869:	ent->r.maxs[2] += 0.1f;
ADDRLP4 1108
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRF4
CNSTF4 1036831949
ADDF4
ASGNF4
line 872
;870:
;871:	// allow to ride movers
;872:	ent->s.groundEntityNum = tr.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 12+52
INDIRI4
ASGNI4
line 874
;873:
;874:	G_SetOrigin( ent, tr.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 876
;875:
;876:	if (!ent->health)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $389
line 877
;877:	{
line 878
;878:		ent->health = 60;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 60
ASGNI4
line 879
;879:	}
LABELV $389
line 881
;880:
;881:	if (!ent->model || !ent->model[0])
ADDRLP4 1112
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $393
ADDRLP4 1112
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $391
LABELV $393
line 882
;882:	{
line 883
;883:		ent->model = "/models/items/a_shield_converter.md3";
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
ADDRGP4 $394
ASGNP4
line 884
;884:	}
LABELV $391
line 886
;885:
;886:	ent->s.modelindex = G_ModelIndex( ent->model );
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRLP4 1120
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 1116
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 1120
INDIRI4
ASGNI4
line 888
;887:
;888:	ent->s.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 889
;889:	ent->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 1124
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 1124
INDIRP4
ADDRLP4 1124
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 890
;890:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 891
;891:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 1
ASGNI4
line 893
;892:
;893:	EnergyShieldStationSettings(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 EnergyShieldStationSettings
CALLV
pop
line 895
;894:
;895:	ent->boltpoint4 = ent->count; //initial value
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 1128
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 896
;896:	ent->think = check_recharge;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 check_recharge
ASGNP4
line 897
;897:	ent->nextthink = level.time + STATION_RECHARGE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 899
;898:
;899:	ent->use = shield_power_converter_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 shield_power_converter_use
ASGNP4
line 901
;900:
;901:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 1132
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 902
;902:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 904
;903:
;904:	G_SoundIndex("sound/interface/shieldcon_run.wav");
ADDRGP4 $354
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 905
;905:	G_SoundIndex("sound/interface/shieldcon_done.mp3");
ADDRGP4 $371
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 906
;906:	G_SoundIndex("sound/interface/shieldcon_empty.mp3");
ADDRGP4 $396
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 907
;907:}
LABELV $376
endproc SP_misc_shield_floor_unit 1136 28
export SP_misc_model_shield_power_converter
proc SP_misc_model_shield_power_converter 28 8
line 918
;908:
;909:
;910:/*QUAKED misc_model_shield_power_converter (1 0 0) (-16 -16 -16) (16 16 16)
;911:#MODELNAME="models/items/psd_big.md3"
;912:Gives shield energy when used.
;913:
;914:"count" - the amount of ammo given when used (default 100)
;915:*/
;916://------------------------------------------------------------
;917:void SP_misc_model_shield_power_converter( gentity_t *ent )
;918:{
line 919
;919:	if (!ent->health)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $398
line 920
;920:	{
line 921
;921:		ent->health = 60;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 60
ASGNI4
line 922
;922:	}
LABELV $398
line 924
;923:
;924:	VectorSet (ent->r.mins, -16, -16, -16);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3246391296
ASGNF4
line 925
;925:	VectorSet (ent->r.maxs, 16, 16, 16);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1098907648
ASGNF4
line 927
;926:
;927:	ent->s.modelindex = G_ModelIndex( ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 929
;928:
;929:	ent->s.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 930
;930:	ent->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 931
;931:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 932
;932:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 1
ASGNI4
line 934
;933:
;934:	EnergyShieldStationSettings(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 EnergyShieldStationSettings
CALLV
pop
line 936
;935:
;936:	ent->boltpoint4 = ent->count; //initial value
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 937
;937:	ent->think = check_recharge;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 check_recharge
ASGNP4
line 938
;938:	ent->nextthink = level.time + STATION_RECHARGE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 940
;939:
;940:	ent->use = shield_power_converter_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 shield_power_converter_use
ASGNP4
line 942
;941:
;942:	G_SetOrigin( ent, ent->s.origin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 943
;943:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 944
;944:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 946
;945:
;946:	G_SoundIndex("sound/movers/objects/useshieldstation.wav");
ADDRGP4 $401
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 948
;947:
;948:	ent->s.modelindex2 = G_ModelIndex("/models/items/psd_big.md3");	// Precache model
ADDRGP4 $402
ARGP4
ADDRLP4 24
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 949
;949:}
LABELV $397
endproc SP_misc_model_shield_power_converter 28 8
export EnergyAmmoStationSettings
proc EnergyAmmoStationSettings 0 12
line 958
;950:
;951:
;952:/*
;953:================
;954:EnergyAmmoShieldStationSettings
;955:================
;956:*/
;957:void EnergyAmmoStationSettings(gentity_t *ent)
;958:{
line 959
;959:	G_SpawnInt( "count", "0", &ent->count );
ADDRGP4 $339
ARGP4
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 961
;960:
;961:	if (!ent->count)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
NEI4 $404
line 962
;962:	{
line 963
;963:		ent->count = 100; 
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 100
ASGNI4
line 964
;964:	}
LABELV $404
line 965
;965:}
LABELV $403
endproc EnergyAmmoStationSettings 0 12
export ammo_power_converter_use
proc ammo_power_converter_use 48 4
line 973
;966:
;967:/*
;968:================
;969:ammo_power_converter_use
;970:================
;971:*/
;972:void ammo_power_converter_use( gentity_t *self, gentity_t *other, gentity_t *activator)
;973:{
line 976
;974:	int			add,highest;
;975:	int			difBlaster,difPowerCell,difMetalBolts;
;976:	int			stop = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 978
;977:
;978:	if (!activator || !activator->client)
ADDRLP4 24
ADDRFP4 8
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
EQU4 $409
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
NEU4 $407
LABELV $409
line 979
;979:	{
line 980
;980:		return;
ADDRGP4 $406
JUMPV
LABELV $407
line 983
;981:	}
;982:
;983:	if (self->setTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $410
line 984
;984:	{
line 985
;985:		if (!self->s.loopSound)
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 0
NEI4 $413
line 986
;986:		{
line 987
;987:			self->s.loopSound = G_SoundIndex("sound/player/pickupshield.wav");
ADDRGP4 $415
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 988
;988:		}
LABELV $413
line 990
;989:
;990:		self->setTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 992
;991:
;992:		if (self->count)	// Has it got any power left?
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
EQI4 $417
line 993
;993:		{
line 994
;994:			if (self->count > MAX_AMMO_GIVE)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 2
LEI4 $419
line 995
;995:			{
line 996
;996:				add = MAX_AMMO_GIVE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 997
;997:			}
ADDRGP4 $420
JUMPV
LABELV $419
line 998
;998:			else if (self->count<0)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
GEI4 $421
line 999
;999:			{
line 1000
;1000:				add = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1001
;1001:			}
ADDRGP4 $422
JUMPV
LABELV $421
line 1003
;1002:			else
;1003:			{
line 1004
;1004:				add = self->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 1005
;1005:			}
LABELV $422
LABELV $420
line 1007
;1006:
;1007:			activator->client->ps.ammo[AMMO_BLASTER] += add;
ADDRLP4 32
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 416
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1008
;1008:			activator->client->ps.ammo[AMMO_POWERCELL] += add;
ADDRLP4 36
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 420
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
line 1009
;1009:			activator->client->ps.ammo[AMMO_METAL_BOLTS] += add;
ADDRLP4 40
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1011
;1010:
;1011:			self->count -= add;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1012
;1012:			stop = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1014
;1013:
;1014:			self->fly_sound_debounce_time = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1016
;1015:
;1016:			difBlaster = activator->client->ps.ammo[AMMO_BLASTER] - ammoData[AMMO_BLASTER].max;
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ADDRGP4 ammoData+8
INDIRI4
SUBI4
ASGNI4
line 1017
;1017:			difPowerCell = activator->client->ps.ammo[AMMO_POWERCELL] - ammoData[AMMO_POWERCELL].max;
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ADDRGP4 ammoData+12
INDIRI4
SUBI4
ASGNI4
line 1018
;1018:			difMetalBolts = activator->client->ps.ammo[AMMO_METAL_BOLTS] - ammoData[AMMO_METAL_BOLTS].max;
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ADDRGP4 ammoData+16
INDIRI4
SUBI4
ASGNI4
line 1021
;1019:
;1020:			// Find the highest one
;1021:			highest = difBlaster;
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 1022
;1022:			if (difPowerCell>difBlaster)
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $427
line 1023
;1023:			{
line 1024
;1024:				highest = difPowerCell;
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 1025
;1025:			}
LABELV $427
line 1027
;1026:
;1027:			if (difMetalBolts > highest)
ADDRLP4 20
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $429
line 1028
;1028:			{
line 1029
;1029:				highest = difMetalBolts;
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 1030
;1030:			}
LABELV $429
line 1031
;1031:		}
LABELV $417
line 1032
;1032:	}
LABELV $410
line 1034
;1033:
;1034:	if (stop)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $431
line 1035
;1035:	{
line 1036
;1036:		self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 1037
;1037:	}
LABELV $431
line 1038
;1038:}
LABELV $406
endproc ammo_power_converter_use 48 4
export SP_misc_model_ammo_power_converter
proc SP_misc_model_ammo_power_converter 24 8
line 1049
;1039:
;1040:
;1041:/*QUAKED misc_model_ammo_power_converter (1 0 0) (-16 -16 -16) (16 16 16)
;1042:#MODELNAME="models/items/power_converter.md3"
;1043:Gives ammo energy when used.
;1044:
;1045:"count" - the amount of ammo given when used (default 100)
;1046:*/
;1047://------------------------------------------------------------
;1048:void SP_misc_model_ammo_power_converter( gentity_t *ent )
;1049:{
line 1050
;1050:	if (!ent->health)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $434
line 1051
;1051:	{
line 1052
;1052:		ent->health = 60;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 60
ASGNI4
line 1053
;1053:	}
LABELV $434
line 1055
;1054:
;1055:	VectorSet (ent->r.mins, -16, -16, -16);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3246391296
ASGNF4
line 1056
;1056:	VectorSet (ent->r.maxs, 16, 16, 16);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1098907648
ASGNF4
line 1058
;1057:
;1058:	ent->s.modelindex = G_ModelIndex( ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1060
;1059:
;1060:	ent->s.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1061
;1061:	ent->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1062
;1062:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 1063
;1063:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 1
ASGNI4
line 1065
;1064:
;1065:	ent->use = ammo_power_converter_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 ammo_power_converter_use
ASGNP4
line 1067
;1066:
;1067:	EnergyAmmoStationSettings(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 EnergyAmmoStationSettings
CALLV
pop
line 1069
;1068:
;1069:	ent->boltpoint4 = ent->count; //initial value
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 1070
;1070:	ent->think = check_recharge;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 check_recharge
ASGNP4
line 1071
;1071:	ent->nextthink = level.time + STATION_RECHARGE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1073
;1072:
;1073:	G_SetOrigin( ent, ent->s.origin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1074
;1074:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1075
;1075:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1077
;1076:
;1077:	G_SoundIndex("sound/movers/objects/useshieldstation.wav");
ADDRGP4 $401
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1078
;1078:}
LABELV $433
endproc SP_misc_model_ammo_power_converter 24 8
export EnergyHealthStationSettings
proc EnergyHealthStationSettings 0 12
line 1086
;1079:
;1080:/*
;1081:================
;1082:EnergyHealthStationSettings
;1083:================
;1084:*/
;1085:void EnergyHealthStationSettings(gentity_t *ent)
;1086:{
line 1087
;1087:	G_SpawnInt( "count", "0", &ent->count );
ADDRGP4 $339
ARGP4
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1089
;1088:
;1089:	if (!ent->count)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
NEI4 $438
line 1090
;1090:	{
line 1091
;1091:		ent->count = 100; 
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 100
ASGNI4
line 1092
;1092:	}
LABELV $438
line 1093
;1093:}
LABELV $437
endproc EnergyHealthStationSettings 0 12
export health_power_converter_use
proc health_power_converter_use 32 4
line 1101
;1094:
;1095:/*
;1096:================
;1097:health_power_converter_use
;1098:================
;1099:*/
;1100:void health_power_converter_use( gentity_t *self, gentity_t *other, gentity_t *activator)
;1101:{
line 1103
;1102:	int dif,add;
;1103:	int stop = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1105
;1104:
;1105:	if (!activator || !activator->client)
ADDRLP4 12
ADDRFP4 8
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
EQU4 $443
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $441
LABELV $443
line 1106
;1106:	{
line 1107
;1107:		return;
ADDRGP4 $440
JUMPV
LABELV $441
line 1110
;1108:	}
;1109:
;1110:	if (self->setTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $444
line 1111
;1111:	{
line 1112
;1112:		if (!self->s.loopSound)
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 0
NEI4 $447
line 1113
;1113:		{
line 1114
;1114:			self->s.loopSound = G_SoundIndex("sound/player/pickuphealth.wav");
ADDRGP4 $449
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1115
;1115:		}
LABELV $447
line 1116
;1116:		self->setTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1118
;1117:
;1118:		dif = activator->client->ps.stats[STAT_MAX_HEALTH] - activator->health;
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1120
;1119:
;1120:		if (dif > 0)					// Already at full armor?
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $451
line 1121
;1121:		{
line 1122
;1122:			if (dif >MAX_AMMO_GIVE)
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $453
line 1123
;1123:			{
line 1124
;1124:				add = MAX_AMMO_GIVE;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 1125
;1125:			}
ADDRGP4 $454
JUMPV
LABELV $453
line 1127
;1126:			else
;1127:			{
line 1128
;1128:				add = dif;
ADDRLP4 8
ADDRLP4 4
INDIRI4
ASGNI4
line 1129
;1129:			}
LABELV $454
line 1131
;1130:
;1131:			if (self->count<add)
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $455
line 1132
;1132:			{
line 1133
;1133:				add = self->count;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 1134
;1134:			}
LABELV $455
line 1136
;1135:
;1136:			self->count -= add;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1137
;1137:			stop = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1139
;1138:
;1139:			self->fly_sound_debounce_time = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1141
;1140:
;1141:			activator->health += add;
ADDRLP4 28
ADDRFP4 8
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 1142
;1142:		}
LABELV $451
line 1143
;1143:	}
LABELV $444
line 1145
;1144:
;1145:	if (stop)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $458
line 1146
;1146:	{
line 1147
;1147:		self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 1148
;1148:	}
LABELV $458
line 1149
;1149:}
LABELV $440
endproc health_power_converter_use 32 4
export SP_misc_model_health_power_converter
proc SP_misc_model_health_power_converter 24 8
line 1160
;1150:
;1151:
;1152:/*QUAKED misc_model_health_power_converter (1 0 0) (-16 -16 -16) (16 16 16)
;1153:#MODELNAME="models/items/power_converter.md3"
;1154:Gives ammo energy when used.
;1155:
;1156:"count" - the amount of ammo given when used (default 100)
;1157:*/
;1158://------------------------------------------------------------
;1159:void SP_misc_model_health_power_converter( gentity_t *ent )
;1160:{
line 1161
;1161:	if (!ent->health)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $461
line 1162
;1162:	{
line 1163
;1163:		ent->health = 60;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 60
ASGNI4
line 1164
;1164:	}
LABELV $461
line 1166
;1165:
;1166:	VectorSet (ent->r.mins, -16, -16, -16);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3246391296
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3246391296
ASGNF4
line 1167
;1167:	VectorSet (ent->r.maxs, 16, 16, 16);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1098907648
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1098907648
ASGNF4
line 1169
;1168:
;1169:	ent->s.modelindex = G_ModelIndex( ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1171
;1170:
;1171:	ent->s.eFlags = 0;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1172
;1172:	ent->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1173
;1173:	ent->r.contents = CONTENTS_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1
ASGNI4
line 1174
;1174:	ent->clipmask = MASK_SOLID;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 1
ASGNI4
line 1176
;1175:
;1176:	ent->use = health_power_converter_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 health_power_converter_use
ASGNP4
line 1178
;1177:
;1178:	EnergyHealthStationSettings(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 EnergyHealthStationSettings
CALLV
pop
line 1180
;1179:
;1180:	ent->boltpoint4 = ent->count; //initial value
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 824
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
line 1181
;1181:	ent->think = check_recharge;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 check_recharge
ASGNP4
line 1182
;1182:	ent->nextthink = level.time + STATION_RECHARGE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1184
;1183:
;1184:	G_SetOrigin( ent, ent->s.origin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1185
;1185:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1186
;1186:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1188
;1187:
;1188:	G_SoundIndex("sound/movers/objects/useshieldstation.wav");
ADDRGP4 $401
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1189
;1189:}
LABELV $460
endproc SP_misc_model_health_power_converter 24 8
export DmgBoxHit
proc DmgBoxHit 0 0
line 1192
;1190:
;1191:void DmgBoxHit( gentity_t *self, gentity_t *other, trace_t *trace )
;1192:{
line 1193
;1193:	return;
LABELV $464
endproc DmgBoxHit 0 0
export DmgBoxUpdateSelf
proc DmgBoxUpdateSelf 24 4
line 1197
;1194:}
;1195:
;1196:void DmgBoxUpdateSelf(gentity_t *self)
;1197:{
line 1198
;1198:	gentity_t *owner = &g_entities[self->r.ownerNum];
ADDRLP4 0
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
line 1200
;1199:
;1200:	if (!owner || !owner->client || !owner->inuse)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $469
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $469
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $466
LABELV $469
line 1201
;1201:	{
line 1202
;1202:		goto killMe;
ADDRGP4 $470
JUMPV
LABELV $466
line 1205
;1203:	}
;1204:
;1205:	if (self->damageRedirect == DAMAGEREDIRECT_HEAD &&
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 1
NEI4 $471
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43648
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
INDIRI4
EQI4 $471
line 1207
;1206:		owner->client->damageBoxHandle_Head != self->s.number)
;1207:	{
line 1208
;1208:		goto killMe;
ADDRGP4 $470
JUMPV
LABELV $471
line 1211
;1209:	}
;1210:
;1211:	if (self->damageRedirect == DAMAGEREDIRECT_RLEG &&
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 2
NEI4 $473
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43652
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
INDIRI4
EQI4 $473
line 1213
;1212:		owner->client->damageBoxHandle_RLeg != self->s.number)
;1213:	{
line 1214
;1214:		goto killMe;
ADDRGP4 $470
JUMPV
LABELV $473
line 1217
;1215:	}
;1216:
;1217:	if (self->damageRedirect == DAMAGEREDIRECT_LLEG &&
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 860
ADDP4
INDIRI4
CNSTI4 3
NEI4 $475
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43656
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
INDIRI4
EQI4 $475
line 1219
;1218:		owner->client->damageBoxHandle_LLeg != self->s.number)
;1219:	{
line 1220
;1220:		goto killMe;
ADDRGP4 $470
JUMPV
LABELV $475
line 1223
;1221:	}
;1222:
;1223:	if (owner->health < 1)
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $477
line 1224
;1224:	{
line 1225
;1225:		goto killMe;
ADDRGP4 $470
JUMPV
LABELV $477
line 1230
;1226:	}
;1227:
;1228:	//G_TestLine(self->r.currentOrigin, owner->client->ps.origin, 0x0000ff, 100);
;1229:
;1230:	trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1232
;1231:
;1232:	self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1233
;1233:	return;
ADDRGP4 $465
JUMPV
LABELV $470
line 1236
;1234:
;1235:killMe:
;1236:	self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1237
;1237:	self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1238
;1238:}
LABELV $465
endproc DmgBoxUpdateSelf 24 4
export DmgBoxAbsorb_Die
proc DmgBoxAbsorb_Die 0 0
line 1241
;1239:
;1240:void DmgBoxAbsorb_Die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod )
;1241:{
line 1242
;1242:	self->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
line 1243
;1243:}
LABELV $481
endproc DmgBoxAbsorb_Die 0 0
export DmgBoxAbsorb_Pain
proc DmgBoxAbsorb_Pain 0 0
line 1246
;1244:
;1245:void DmgBoxAbsorb_Pain(gentity_t *self, gentity_t *attacker, int damage)
;1246:{
line 1247
;1247:	self->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
line 1248
;1248:}
LABELV $482
endproc DmgBoxAbsorb_Pain 0 0
export CreateNewDamageBox
proc CreateNewDamageBox 16 8
line 1251
;1249:
;1250:gentity_t *CreateNewDamageBox( gentity_t *ent )
;1251:{
line 1256
;1252:	gentity_t *dmgBox;
;1253:
;1254:	//We do not want the client to have any real knowledge of the entity whatsoever. It will only
;1255:	//ever be used on the server.
;1256:	dmgBox = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1257
;1257:	G_SetClassName(dmgBox, "dmg_box");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $484
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 1259
;1258:			
;1259:	dmgBox->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 1260
;1260:	dmgBox->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1262
;1261:
;1262:	dmgBox->clipmask = 0;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 1263
;1263:	dmgBox->r.contents = MASK_PLAYERSOLID;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 273
ASGNI4
line 1265
;1264:
;1265:	dmgBox->mass = 5000;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTF4 1167867904
ASGNF4
line 1267
;1266:
;1267:	dmgBox->s.eFlags |= EF_NODRAW;
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
CNSTI4 128
BORI4
ASGNI4
line 1268
;1268:	dmgBox->r.svFlags |= SVF_NOCLIENT;
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
CNSTI4 1
BORI4
ASGNI4
line 1270
;1269:
;1270:	dmgBox->touch = DmgBoxHit;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 DmgBoxHit
ASGNP4
line 1272
;1271:
;1272:	dmgBox->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 1274
;1273:
;1274:	dmgBox->health = 1;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
line 1276
;1275:
;1276:	dmgBox->pain = DmgBoxAbsorb_Pain;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRGP4 DmgBoxAbsorb_Pain
ASGNP4
line 1277
;1277:	dmgBox->die = DmgBoxAbsorb_Die;
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 DmgBoxAbsorb_Die
ASGNP4
line 1279
;1278:
;1279:	dmgBox->think = DmgBoxUpdateSelf;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 DmgBoxUpdateSelf
ASGNP4
line 1280
;1280:	dmgBox->nextthink = level.time + 50;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1282
;1281:
;1282:	return dmgBox;
ADDRLP4 0
INDIRP4
RETP4
LABELV $483
endproc CreateNewDamageBox 16 8
export ATST_ManageDamageBoxes
proc ATST_ManageDamageBoxes 92 16
line 1286
;1283:}
;1284:
;1285:void ATST_ManageDamageBoxes(gentity_t *ent)
;1286:{
line 1290
;1287:	vec3_t headOrg, lLegOrg, rLegOrg;
;1288:	vec3_t fwd, right, up, flatAngle;
;1289:
;1290:	if (!ent->client->damageBoxHandle_Head)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43648
ADDP4
INDIRI4
CNSTI4 0
NEI4 $487
line 1291
;1291:	{
line 1292
;1292:		gentity_t *dmgBox = CreateNewDamageBox(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 CreateNewDamageBox
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 88
INDIRP4
ASGNP4
line 1294
;1293:
;1294:		if (dmgBox)
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $489
line 1295
;1295:		{
line 1296
;1296:			VectorSet( dmgBox->r.mins, ATST_MINS0, ATST_MINS1, ATST_MINS2 );
ADDRLP4 84
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3256877056
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3256877056
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3250585600
ASGNF4
line 1297
;1297:			VectorSet( dmgBox->r.maxs, ATST_MAXS0, ATST_MAXS1, ATST_HEADSIZE );
ADDRLP4 84
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1109393408
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1109393408
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1119092736
ASGNF4
line 1299
;1298:
;1299:			ent->client->damageBoxHandle_Head = dmgBox->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43648
ADDP4
ADDRLP4 84
INDIRP4
INDIRI4
ASGNI4
line 1300
;1300:			dmgBox->damageRedirect = DAMAGEREDIRECT_HEAD;
ADDRLP4 84
INDIRP4
CNSTI4 860
ADDP4
CNSTI4 1
ASGNI4
line 1301
;1301:			dmgBox->damageRedirectTo = ent->s.number;
ADDRLP4 84
INDIRP4
CNSTI4 864
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1302
;1302:		}
LABELV $489
line 1303
;1303:	}
LABELV $487
line 1304
;1304:	if (!ent->client->damageBoxHandle_RLeg)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43652
ADDP4
INDIRI4
CNSTI4 0
NEI4 $491
line 1305
;1305:	{
line 1306
;1306:		gentity_t *dmgBox = CreateNewDamageBox(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 CreateNewDamageBox
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 88
INDIRP4
ASGNP4
line 1308
;1307:
;1308:		if (dmgBox)
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $493
line 1309
;1309:		{
line 1310
;1310:			VectorSet( dmgBox->r.mins, ATST_MINS0/4, ATST_MINS1/4, ATST_MINS2 );
ADDRLP4 84
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3250585600
ASGNF4
line 1311
;1311:			VectorSet( dmgBox->r.maxs, ATST_MAXS0/4, ATST_MAXS1/4, ATST_MAXS2-ATST_HEADSIZE );
ADDRLP4 84
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1126039552
ASGNF4
line 1313
;1312:
;1313:			ent->client->damageBoxHandle_RLeg = dmgBox->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43652
ADDP4
ADDRLP4 84
INDIRP4
INDIRI4
ASGNI4
line 1314
;1314:			dmgBox->damageRedirect = DAMAGEREDIRECT_RLEG;
ADDRLP4 84
INDIRP4
CNSTI4 860
ADDP4
CNSTI4 2
ASGNI4
line 1315
;1315:			dmgBox->damageRedirectTo = ent->s.number;
ADDRLP4 84
INDIRP4
CNSTI4 864
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1316
;1316:		}
LABELV $493
line 1317
;1317:	}
LABELV $491
line 1318
;1318:	if (!ent->client->damageBoxHandle_LLeg)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43656
ADDP4
INDIRI4
CNSTI4 0
NEI4 $495
line 1319
;1319:	{
line 1320
;1320:		gentity_t *dmgBox = CreateNewDamageBox(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 CreateNewDamageBox
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 88
INDIRP4
ASGNP4
line 1322
;1321:
;1322:		if (dmgBox)
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $497
line 1323
;1323:		{
line 1324
;1324:			VectorSet( dmgBox->r.mins, ATST_MINS0/4, ATST_MINS1/4, ATST_MINS2 );
ADDRLP4 84
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3240099840
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3250585600
ASGNF4
line 1325
;1325:			VectorSet( dmgBox->r.maxs, ATST_MAXS0/4, ATST_MAXS1/4, ATST_MAXS2-ATST_HEADSIZE );
ADDRLP4 84
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1092616192
ASGNF4
ADDRLP4 84
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1126039552
ASGNF4
line 1327
;1326:
;1327:			ent->client->damageBoxHandle_LLeg = dmgBox->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43656
ADDP4
ADDRLP4 84
INDIRP4
INDIRI4
ASGNI4
line 1328
;1328:			dmgBox->damageRedirect = DAMAGEREDIRECT_LLEG;
ADDRLP4 84
INDIRP4
CNSTI4 860
ADDP4
CNSTI4 3
ASGNI4
line 1329
;1329:			dmgBox->damageRedirectTo = ent->s.number;
ADDRLP4 84
INDIRP4
CNSTI4 864
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1330
;1330:		}
LABELV $497
line 1331
;1331:	}
LABELV $495
line 1333
;1332:
;1333:	if (!ent->client->damageBoxHandle_Head ||
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 84
INDIRP4
CNSTI4 43648
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $502
ADDRLP4 84
INDIRP4
CNSTI4 43656
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $502
ADDRLP4 84
INDIRP4
CNSTI4 43652
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $499
LABELV $502
line 1336
;1334:		!ent->client->damageBoxHandle_LLeg ||
;1335:		!ent->client->damageBoxHandle_RLeg)
;1336:	{
line 1337
;1337:		return;
ADDRGP4 $486
JUMPV
LABELV $499
line 1340
;1338:	}
;1339:
;1340:	VectorCopy(ent->client->ps.origin, headOrg);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1341
;1341:	headOrg[2] += (ATST_MAXS2-ATST_HEADSIZE);
ADDRLP4 48+8
ADDRLP4 48+8
INDIRF4
CNSTF4 1126039552
ADDF4
ASGNF4
line 1343
;1342:
;1343:	VectorCopy(ent->client->ps.viewangles, flatAngle);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1344
;1344:	flatAngle[PITCH] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
line 1345
;1345:	flatAngle[ROLL] = 0;
ADDRLP4 36+8
CNSTF4 0
ASGNF4
line 1347
;1346:
;1347:	AngleVectors(flatAngle, fwd, right, up);
ADDRLP4 36
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1349
;1348:
;1349:	VectorCopy(ent->client->ps.origin, lLegOrg);
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
line 1350
;1350:	VectorCopy(ent->client->ps.origin, rLegOrg);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1352
;1351:
;1352:	lLegOrg[0] -= right[0]*32;
ADDRLP4 12
ADDRLP4 12
INDIRF4
CNSTF4 1107296256
ADDRLP4 0
INDIRF4
MULF4
SUBF4
ASGNF4
line 1353
;1353:	lLegOrg[1] -= right[1]*32;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 0+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1354
;1354:	lLegOrg[2] -= right[2]*32;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1107296256
ADDRLP4 0+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 1356
;1355:
;1356:	rLegOrg[0] += right[0]*32;
ADDRLP4 24
ADDRLP4 24
INDIRF4
CNSTF4 1107296256
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1357
;1357:	rLegOrg[1] += right[1]*32;
ADDRLP4 24+4
ADDRLP4 24+4
INDIRF4
CNSTF4 1107296256
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1358
;1358:	rLegOrg[2] += right[2]*32;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1107296256
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1360
;1359:
;1360:	G_SetOrigin(&g_entities[ent->client->damageBoxHandle_Head], headOrg);
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
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1361
;1361:	G_SetOrigin(&g_entities[ent->client->damageBoxHandle_LLeg], lLegOrg);
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43656
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1362
;1362:	G_SetOrigin(&g_entities[ent->client->damageBoxHandle_RLeg], rLegOrg);
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43652
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1363
;1363:}
LABELV $486
endproc ATST_ManageDamageBoxes 92 16
export G_PlayerBecomeATST
proc G_PlayerBecomeATST 8 0
line 1366
;1364:
;1365:int G_PlayerBecomeATST(gentity_t *ent)
;1366:{
line 1367
;1367:	if (!ent || !ent->client)
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
EQU4 $516
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $514
LABELV $516
line 1368
;1368:	{
line 1369
;1369:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $513
JUMPV
LABELV $514
line 1372
;1370:	}
;1371:
;1372:	if (ent->client->ps.weaponTime > 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $517
line 1373
;1373:	{
line 1374
;1374:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $513
JUMPV
LABELV $517
line 1377
;1375:	}
;1376:
;1377:	if (ent->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $519
line 1378
;1378:	{
line 1379
;1379:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $513
JUMPV
LABELV $519
line 1382
;1380:	}
;1381:
;1382:	if (ent->client->ps.zoomMode)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $521
line 1383
;1383:	{
line 1384
;1384:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $513
JUMPV
LABELV $521
line 1387
;1385:	}
;1386:
;1387:	if (ent->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $523
line 1388
;1388:	{
line 1389
;1389:		ent->client->ps.usingATST = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
CNSTI4 0
ASGNI4
line 1390
;1390:		ent->client->ps.forceHandExtend = HANDEXTEND_WEAPONREADY;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 6
ASGNI4
line 1391
;1391:	}
ADDRGP4 $524
JUMPV
LABELV $523
line 1393
;1392:	else
;1393:	{
line 1394
;1394:		ent->client->ps.usingATST = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
CNSTI4 1
ASGNI4
line 1395
;1395:	}
LABELV $524
line 1397
;1396:
;1397:	ent->client->ps.weaponTime = 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 1000
ASGNI4
line 1399
;1398:
;1399:	return 1;
CNSTI4 1
RETI4
LABELV $513
endproc G_PlayerBecomeATST 8 0
export fx_runner_think
proc fx_runner_think 16 12
line 1419
;1400:}
;1401:
;1402:/*QUAKED fx_runner (0 0 1) (-8 -8 -8) (8 8 8) STARTOFF ONESHOT
;1403:	STARTOFF - effect starts off, toggles on/off when used
;1404:	ONESHOT - effect fires only when used
;1405:
;1406:    "angles"   - 3-float vector, angle the effect should play (unless fxTarget is supplied)
;1407:	"fxFile"   - name of the effect file to play
;1408:	"fxTarget" - aim the effect toward this object, otherwise defaults to up
;1409:	"target"   - uses its target when the fx gets triggered
;1410:	"delay"    - how often to call the effect, don't over-do this ( default 400 )
;1411:			     note that it has to send an event each time it plays, so don't kill bandwidth or I will cry
;1412:	"random"   - random amount of time to add to delay, ( default 0, 200 = 0ms to 200ms )
;1413:*/
;1414:#define FX_RUNNER_RESERVED 0x800000
;1415:#define FX_ENT_RADIUS 8 //32
;1416:
;1417://----------------------------------------------------------
;1418:void fx_runner_think( gentity_t *ent )
;1419:{
line 1421
;1420:	// call the effect with the desired position and orientation
;1421:	G_AddEvent( ent, EV_PLAY_EFFECT_ID, ent->bolt_Head );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1423
;1422:
;1423:	ent->nextthink = level.time + ent->delay + random() * ent->random;
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ADDI4
CVIF4 4
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1191181824
DIVF4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1425
;1424:
;1425:	if ( ent->target )
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $527
line 1426
;1426:	{
line 1428
;1427:		// let our target know that we have spawned an effect
;1428:		G_UseTargets( ent, ent );
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
ADDRGP4 G_UseTargets
CALLV
pop
line 1429
;1429:	}
LABELV $527
line 1430
;1430:}
LABELV $525
endproc fx_runner_think 16 12
export fx_runner_use
proc fx_runner_use 4 8
line 1434
;1431:
;1432://----------------------------------------------------------
;1433:void fx_runner_use( gentity_t *self, gentity_t *other, gentity_t *activator )
;1434:{
line 1435
;1435:	if ( self->spawnflags & 2 ) // ONESHOT
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $530
line 1436
;1436:	{
line 1439
;1437:		// call the effect with the desired position and orientation, as a safety thing,
;1438:		//	make sure we aren't thinking at all.
;1439:		fx_runner_think( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 fx_runner_think
CALLV
pop
line 1440
;1440:		self->nextthink = -1;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 -1
ASGNI4
line 1442
;1441:
;1442:		if ( self->target )
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $531
line 1443
;1443:		{
line 1445
;1444:			// let our target know that we have spawned an effect
;1445:			G_UseTargets( self, self );
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
ADDRGP4 G_UseTargets
CALLV
pop
line 1446
;1446:		}
line 1447
;1447:	}
ADDRGP4 $531
JUMPV
LABELV $530
line 1449
;1448:	else
;1449:	{
line 1451
;1450:		// ensure we are working with the right think function
;1451:		self->think = fx_runner_think;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 fx_runner_think
ASGNP4
line 1454
;1452:
;1453:		// toggle our state
;1454:		if ( self->nextthink == -1 )
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $534
line 1455
;1455:		{
line 1458
;1456:			// NOTE: we fire the effect immediately on use, the fx_runner_think func will set
;1457:			//	up the nextthink time.
;1458:			fx_runner_think( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 fx_runner_think
CALLV
pop
line 1459
;1459:		}
ADDRGP4 $535
JUMPV
LABELV $534
line 1461
;1460:		else
;1461:		{
line 1463
;1462:			// turn off for now
;1463:			self->nextthink = -1;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 -1
ASGNI4
line 1464
;1464:		}
LABELV $535
line 1465
;1465:	}
LABELV $531
line 1466
;1466:}
LABELV $529
endproc fx_runner_use 4 8
export fx_runner_link
proc fx_runner_link 44 12
line 1470
;1467:
;1468://----------------------------------------------------------
;1469:void fx_runner_link( gentity_t *ent )
;1470:{
line 1473
;1471:	vec3_t	dir;
;1472:
;1473:	if ( ent->roffname && ent->roffname[0] )
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $537
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $537
line 1474
;1474:	{
line 1476
;1475:		// try to use the target to override the orientation
;1476:		gentity_t	*target = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 1478
;1477:
;1478:		target = G_Find( target, FOFS(targetname), ent->roffname );
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 596
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
ASGNP4
line 1480
;1479:
;1480:		if ( !target )
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $539
line 1481
;1481:		{
line 1483
;1482:			// Bah, no good, dump a warning, but continue on and use the UP vector
;1483:			Com_Printf( "fx_runner_link: target specified but not found: %s\n", ent->roffname );
ADDRGP4 $541
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1484
;1484:			Com_Printf( "  -assuming UP orientation.\n" );
ADDRGP4 $542
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1485
;1485:		}
ADDRGP4 $540
JUMPV
LABELV $539
line 1487
;1486:		else
;1487:		{
line 1489
;1488:			// Our target is valid so let's override the default UP vector
;1489:			VectorSubtract( target->s.origin, ent->s.origin, dir );
ADDRLP4 28
CNSTI4 92
ASGNI4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
CNSTI4 96
ASGNI4
ADDRLP4 0+4
ADDRLP4 16
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 100
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1490
;1490:			VectorNormalize( dir );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1491
;1491:			vectoangles( dir, ent->s.angles );
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1492
;1492:		}
LABELV $540
line 1493
;1493:	}
LABELV $537
line 1496
;1494:
;1495:	// don't really do anything with this right now other than do a check to warn the designers if the target is bogus
;1496:	if ( ent->target )
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $545
line 1497
;1497:	{
line 1498
;1498:		gentity_t	*target = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 1500
;1499:
;1500:		target = G_Find( target, FOFS(targetname), ent->target );
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 596
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
ASGNP4
line 1502
;1501:
;1502:		if ( !target )
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $547
line 1503
;1503:		{
line 1505
;1504:			// Target is bogus, but we can still continue
;1505:			Com_Printf( "fx_runner_link: target was specified but is not valid: %s\n", ent->target );
ADDRGP4 $549
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1506
;1506:		}
LABELV $547
line 1507
;1507:	}
LABELV $545
line 1509
;1508:
;1509:	G_SetAngles( ent, ent->s.angles );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 G_SetAngles
CALLV
pop
line 1511
;1510:
;1511:	if ( ent->spawnflags & 1 || ent->spawnflags & 2 ) // STARTOFF || ONESHOT
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $552
ADDRLP4 20
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $550
LABELV $552
line 1512
;1512:	{
line 1514
;1513:		// We won't even consider thinking until we are used
;1514:		ent->nextthink = -1;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 -1
ASGNI4
line 1515
;1515:	}
ADDRGP4 $551
JUMPV
LABELV $550
line 1517
;1516:	else
;1517:	{
line 1519
;1518:		// Let's get to work right now!
;1519:		ent->think = fx_runner_think;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 fx_runner_think
ASGNP4
line 1520
;1520:		ent->nextthink = level.time + 100; // wait a small bit, then start working
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1521
;1521:	}
LABELV $551
line 1522
;1522:}
LABELV $536
endproc fx_runner_link 44 12
export SP_fx_runner
proc SP_fx_runner 36 12
line 1526
;1523:
;1524://----------------------------------------------------------
;1525:void SP_fx_runner( gentity_t *ent )
;1526:{
line 1530
;1527:	char		*fxFile;
;1528:
;1529:	// Get our defaults
;1530:	G_SpawnInt( "delay", "400", &ent->delay );
ADDRGP4 $555
ARGP4
ADDRGP4 $556
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 808
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1531
;1531:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $557
ARGP4
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1533
;1532:
;1533:	if (!ent->s.angles[0] && !ent->s.angles[1] && !ent->s.angles[2])
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $558
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $558
ADDRLP4 4
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
NEF4 $558
line 1534
;1534:	{
line 1536
;1535:		// didn't have angles, so give us the default of up
;1536:		VectorSet( ent->s.angles, -90, 0, 0 );
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 3266576384
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
CNSTF4 0
ASGNF4
line 1537
;1537:	}
LABELV $558
line 1540
;1538:
;1539:	// make us useable if we can be targeted
;1540:	if ( ent->targetname )
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $560
line 1541
;1541:	{
line 1542
;1542:		ent->use = fx_runner_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 fx_runner_use
ASGNP4
line 1543
;1543:	}
LABELV $560
line 1545
;1544:
;1545:	G_SpawnString( "fxFile", "", &fxFile );
ADDRGP4 $562
ARGP4
ADDRGP4 $563
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1547
;1546:
;1547:	G_SpawnString( "fxTarget", "", &ent->roffname );
ADDRGP4 $564
ARGP4
ADDRGP4 $563
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1549
;1548:
;1549:	if ( !fxFile || !fxFile[0] )
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $567
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $565
LABELV $567
line 1550
;1550:	{
line 1551
;1551:		Com_Printf( S_COLOR_RED"ERROR: fx_runner %s at %s has no fxFile specified\n", ent->targetname, vtos(ent->s.origin) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $568
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1552
;1552:		G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1553
;1553:		return;
ADDRGP4 $554
JUMPV
LABELV $565
line 1558
;1554:	}
;1555:
;1556:	// Try and associate an effect file, unfortunately we won't know if this worked or not 
;1557:	//	until the CGAME trys to register it...
;1558:	ent->bolt_Head = G_EffectIndex( fxFile );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_EffectIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1562
;1559:	//It is dirty, yes. But no one likes adding things to the entity structure.
;1560:
;1561:	// Give us a bit of time to spawn in the other entities, since we may have to target one of 'em
;1562:	ent->think = fx_runner_link; 
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 fx_runner_link
ASGNP4
line 1563
;1563:	ent->nextthink = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1566
;1564:
;1565:	// Save our position and link us up!
;1566:	G_SetOrigin( ent, ent->s.origin );
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1568
;1567:
;1568:	VectorSet( ent->r.maxs, FX_ENT_RADIUS, FX_ENT_RADIUS, FX_ENT_RADIUS );
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
CNSTF4 1090519040
ASGNF4
line 1569
;1569:	VectorScale( ent->r.maxs, -1, ent->r.mins );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3212836864
ADDRLP4 24
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3212836864
ADDRLP4 28
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3212836864
ADDRLP4 32
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ASGNF4
line 1571
;1570:
;1571:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1572
;1572:}
LABELV $554
endproc SP_fx_runner 36 12
data
export gAnimEntTypes
align 4
LABELV gAnimEntTypes
byte 4 0
export animEntRoot
align 4
LABELV animEntRoot
byte 4 0
export ExampleAnimEntCustomData
code
proc ExampleAnimEntCustomData 8 0
line 1631
;1573:
;1574://rww - here starts the main example g2animent stuff
;1575:#define ANIMENT_TYPE_STORMTROOPER			0
;1576:#define ANIMENT_TYPE_RODIAN					1
;1577:#define ANIMENT_TYPE_JAN					2
;1578:#define ANIMENT_TYPE_CUSTOM					3
;1579:#define	MAX_ANIMENTS						4
;1580:
;1581:#define TROOPER_PAIN_SOUNDS 4
;1582:#define TROOPER_DEATH_SOUNDS 3
;1583:#define TROOPER_ALERT_SOUNDS 5
;1584:int gTrooperSound_Pain[TROOPER_PAIN_SOUNDS];
;1585:int gTrooperSound_Death[TROOPER_DEATH_SOUNDS];
;1586:int gTrooperSound_Alert[TROOPER_ALERT_SOUNDS];
;1587:
;1588:#define RODIAN_PAIN_SOUNDS 4
;1589:#define RODIAN_DEATH_SOUNDS 3
;1590:#define RODIAN_ALERT_SOUNDS 5
;1591:int gRodianSound_Pain[RODIAN_PAIN_SOUNDS];
;1592:int gRodianSound_Death[RODIAN_DEATH_SOUNDS];
;1593:int gRodianSound_Alert[RODIAN_ALERT_SOUNDS];
;1594:
;1595:#define JAN_PAIN_SOUNDS 4
;1596:#define JAN_DEATH_SOUNDS 3
;1597:#define JAN_ALERT_SOUNDS 5
;1598:int gJanSound_Pain[JAN_PAIN_SOUNDS];
;1599:int gJanSound_Death[JAN_DEATH_SOUNDS];
;1600:int gJanSound_Alert[JAN_ALERT_SOUNDS];
;1601:
;1602:int G_PickDeathAnim( gentity_t *self, vec3_t point, int damage, int mod, int hitLoc );
;1603:void AnimEntFireWeapon( gentity_t *ent, qboolean altFire );
;1604:int GetNearestVisibleWP(vec3_t org, int ignore);
;1605:int InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles);
;1606:extern float gBotEdit;
;1607:
;1608:#define ANIMENT_ALIGNED_UNKNOWN		0
;1609:#define ANIMENT_ALIGNED_BAD			1
;1610:#define ANIMENT_ALIGNED_GOOD		2
;1611:
;1612:#define ANIMENT_CUSTOMSOUND_PAIN	0
;1613:#define ANIMENT_CUSTOMSOUND_DEATH	1
;1614:#define ANIMENT_CUSTOMSOUND_ALERT	2
;1615:
;1616:int gAnimEntTypes = 0;
;1617:
;1618:typedef struct animentCustomInfo_s
;1619:{
;1620:	int							aeAlignment;
;1621:	int							aeIndex;
;1622:	int							aeWeapon;
;1623:	char						*modelPath;
;1624:	char						*soundPath;
;1625:	void						*next;
;1626:} animentCustomInfo_t;
;1627:
;1628:animentCustomInfo_t *animEntRoot = NULL;
;1629:
;1630:animentCustomInfo_t *ExampleAnimEntCustomData(gentity_t *self)
;1631:{
line 1632
;1632:	animentCustomInfo_t *iter = animEntRoot;
ADDRLP4 0
ADDRGP4 animEntRoot
INDIRP4
ASGNP4
line 1633
;1633:	int safetyCheck = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $572
JUMPV
LABELV $571
line 1636
;1634:
;1635:	while (iter && safetyCheck < 30000)
;1636:	{
line 1637
;1637:		if (iter->aeIndex == self->waterlevel)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
NEI4 $574
line 1638
;1638:		{
line 1639
;1639:			return iter;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $570
JUMPV
LABELV $574
line 1642
;1640:		}
;1641:
;1642:		iter = iter->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
ASGNP4
line 1643
;1643:		safetyCheck++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1644
;1644:	}
LABELV $572
line 1635
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $576
ADDRLP4 4
INDIRI4
CNSTI4 30000
LTI4 $571
LABELV $576
line 1646
;1645:
;1646:	return NULL;
CNSTP4 0
RETP4
LABELV $570
endproc ExampleAnimEntCustomData 8 0
export ExampleAnimEntCustomDataExists
proc ExampleAnimEntCustomDataExists 20 8
line 1651
;1647:}
;1648:
;1649:animentCustomInfo_t *ExampleAnimEntCustomDataExists(gentity_t *self, int alignment, int weapon, char *modelname,
;1650:												   char *soundpath)
;1651:{
line 1652
;1652:	animentCustomInfo_t *iter = animEntRoot;
ADDRLP4 0
ADDRGP4 animEntRoot
INDIRP4
ASGNP4
line 1653
;1653:	int safetyCheck = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $579
JUMPV
LABELV $578
line 1656
;1654:
;1655:	while (iter && safetyCheck < 30000)
;1656:	{
line 1657
;1657:		if (iter->aeAlignment == alignment &&
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $581
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $581
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $581
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $581
line 1661
;1658:			iter->aeWeapon == weapon &&
;1659:			!Q_stricmp(iter->modelPath, modelname) &&
;1660:			!Q_stricmp(iter->soundPath, soundpath))
;1661:		{
line 1662
;1662:			return iter;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $577
JUMPV
LABELV $581
line 1665
;1663:		}
;1664:
;1665:		iter = iter->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
ASGNP4
line 1666
;1666:		safetyCheck++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1667
;1667:	}
LABELV $579
line 1655
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $583
ADDRLP4 4
INDIRI4
CNSTI4 30000
LTI4 $578
LABELV $583
line 1669
;1668:
;1669:	return NULL;
CNSTP4 0
RETP4
LABELV $577
endproc ExampleAnimEntCustomDataExists 20 8
export ExampleAnimEntCustomDataEntry
proc ExampleAnimEntCustomDataEntry 64 20
line 1673
;1670:}
;1671:
;1672:void ExampleAnimEntCustomDataEntry(gentity_t *self, int alignment, int weapon, char *modelname, char *soundpath)
;1673:{
line 1674
;1674:	animentCustomInfo_t *find = ExampleAnimEntCustomDataExists(self, alignment, weapon, modelname, soundpath);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 ExampleAnimEntCustomDataExists
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1675
;1675:	animentCustomInfo_t *lastValid = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 1676
;1676:	int safetyCheck = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1678
;1677:
;1678:	if (find)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $585
line 1679
;1679:	{ //data for this guy already exists. Set our waterlevel (aeIndex) to use this.
line 1680
;1680:		self->waterlevel = find->aeIndex;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1681
;1681:		return;
ADDRGP4 $584
JUMPV
LABELV $585
line 1684
;1682:	}
;1683:
;1684:	find = animEntRoot;
ADDRLP4 0
ADDRGP4 animEntRoot
INDIRP4
ASGNP4
ADDRGP4 $588
JUMPV
LABELV $587
line 1687
;1685:
;1686:	while (find && safetyCheck < 30000)
;1687:	{ //find the next null pointer
line 1688
;1688:		lastValid = find;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 1689
;1689:		find = find->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRP4
ASGNP4
line 1690
;1690:		safetyCheck++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1691
;1691:	}
LABELV $588
line 1686
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $590
ADDRLP4 4
INDIRI4
CNSTI4 30000
LTI4 $587
LABELV $590
line 1693
;1692:
;1693:	if (!find)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $591
line 1694
;1694:	{
line 1695
;1695:		find = BG_Alloc(sizeof(animentCustomInfo_t));
CNSTI4 24
ARGI4
ADDRLP4 16
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 1697
;1696:
;1697:		if (!find)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $593
line 1698
;1698:		{ //careful not to exceed the BG_Alloc limit!
line 1699
;1699:			return;
ADDRGP4 $584
JUMPV
LABELV $593
line 1702
;1700:		}
;1701:
;1702:		find->aeAlignment = alignment;
ADDRLP4 0
INDIRP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1703
;1703:		self->waterlevel = gAnimEntTypes;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRGP4 gAnimEntTypes
INDIRI4
ASGNI4
line 1704
;1704:		find->aeIndex = self->waterlevel;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
ASGNI4
line 1705
;1705:		find->aeWeapon = weapon;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1706
;1706:		find->next = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTP4 0
ASGNP4
line 1708
;1707:
;1708:		find->modelPath = BG_Alloc(strlen(modelname)+1);
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 20
INDIRU4
CNSTU4 1
ADDU4
CVUI4 4
ARGI4
ADDRLP4 24
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRP4
ASGNP4
line 1709
;1709:		find->soundPath = BG_Alloc(strlen(soundpath)+1);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 28
INDIRU4
CNSTU4 1
ADDU4
CVUI4 4
ARGI4
ADDRLP4 32
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 32
INDIRP4
ASGNP4
line 1711
;1710:
;1711:		if (!find->modelPath || !find->soundPath)
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $597
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
NEU4 $595
LABELV $597
line 1712
;1712:		{
line 1713
;1713:			find->aeIndex = -1;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 -1
ASGNI4
line 1714
;1714:			return;
ADDRGP4 $584
JUMPV
LABELV $595
line 1717
;1715:		}
;1716:
;1717:		Q_strncpyz(find->modelPath, modelname, strlen(modelname) + 1);
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 44
INDIRU4
CNSTU4 1
ADDU4
CVUI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1718
;1718:		Q_strncpyz(find->soundPath, soundpath, strlen(soundpath) + 1);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 48
INDIRU4
CNSTU4 1
ADDU4
CVUI4 4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1720
;1719:
;1720:		find->modelPath[strlen(modelname)] = 0;
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 52
INDIRU4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1721
;1721:		find->soundPath[strlen(modelname)] = 0;
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 56
INDIRU4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1723
;1722:
;1723:		if (lastValid)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $598
line 1724
;1724:		{
line 1725
;1725:			lastValid->next = find;
ADDRLP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1726
;1726:		}
LABELV $598
line 1728
;1727:
;1728:		if (!animEntRoot)
ADDRGP4 animEntRoot
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $600
line 1729
;1729:		{
line 1730
;1730:			animEntRoot = find;
ADDRGP4 animEntRoot
ADDRLP4 0
INDIRP4
ASGNP4
line 1731
;1731:		}
LABELV $600
line 1733
;1732:
;1733:		gAnimEntTypes++;
ADDRLP4 60
ADDRGP4 gAnimEntTypes
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1734
;1734:	}
LABELV $591
line 1735
;1735:}
LABELV $584
endproc ExampleAnimEntCustomDataEntry 64 20
export AnimEntCustomSoundPrecache
proc AnimEntCustomSoundPrecache 48 8
line 1738
;1736:
;1737:void AnimEntCustomSoundPrecache(animentCustomInfo_t *aeInfo)
;1738:{
line 1739
;1739:	if (!aeInfo)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $603
line 1740
;1740:	{
line 1741
;1741:		return;
ADDRGP4 $602
JUMPV
LABELV $603
line 1744
;1742:	}
;1743:
;1744:	G_SoundIndex(va("%s/pain25", aeInfo->soundPath));
ADDRGP4 $605
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1745
;1745:	G_SoundIndex(va("%s/pain50", aeInfo->soundPath));
ADDRGP4 $606
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1746
;1746:	G_SoundIndex(va("%s/pain75", aeInfo->soundPath));
ADDRGP4 $607
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1747
;1747:	G_SoundIndex(va("%s/pain100", aeInfo->soundPath));
ADDRGP4 $608
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1749
;1748:
;1749:	G_SoundIndex(va("%s/death1", aeInfo->soundPath));
ADDRGP4 $609
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1750
;1750:	G_SoundIndex(va("%s/death2", aeInfo->soundPath));
ADDRGP4 $610
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1751
;1751:	G_SoundIndex(va("%s/death3", aeInfo->soundPath));
ADDRGP4 $611
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1753
;1752:
;1753:	G_SoundIndex(va("%s/detected1", aeInfo->soundPath));
ADDRGP4 $612
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1754
;1754:	G_SoundIndex(va("%s/detected2", aeInfo->soundPath));
ADDRGP4 $613
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1755
;1755:	G_SoundIndex(va("%s/detected3", aeInfo->soundPath));
ADDRGP4 $614
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1756
;1756:	G_SoundIndex(va("%s/detected4", aeInfo->soundPath));
ADDRGP4 $615
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1757
;1757:	G_SoundIndex(va("%s/detected5", aeInfo->soundPath));
ADDRGP4 $616
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1758
;1758:}
LABELV $602
endproc AnimEntCustomSoundPrecache 48 8
export ExampleAnimEntCustomSound
proc ExampleAnimEntCustomSound 116 16
line 1761
;1759:
;1760:void ExampleAnimEntCustomSound(gentity_t *self, int soundType)
;1761:{
line 1762
;1762:	animentCustomInfo_t *aeInfo = ExampleAnimEntCustomData(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 ExampleAnimEntCustomData
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
ASGNP4
line 1764
;1763:	int customSounds[16];
;1764:	int numSounds = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1766
;1765:
;1766:	if (!aeInfo)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $618
line 1767
;1767:	{
line 1768
;1768:		return;
ADDRGP4 $617
JUMPV
LABELV $618
line 1771
;1769:	}
;1770:
;1771:	if (soundType == ANIMENT_CUSTOMSOUND_PAIN)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $620
line 1772
;1772:	{
line 1773
;1773:		customSounds[0] = G_SoundIndex(va("%s/pain25", aeInfo->soundPath));
ADDRGP4 $605
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 80
INDIRI4
ASGNI4
line 1774
;1774:		customSounds[1] = G_SoundIndex(va("%s/pain50", aeInfo->soundPath));
ADDRGP4 $606
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8+4
ADDRLP4 88
INDIRI4
ASGNI4
line 1775
;1775:		customSounds[2] = G_SoundIndex(va("%s/pain75", aeInfo->soundPath));
ADDRGP4 $607
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8+8
ADDRLP4 96
INDIRI4
ASGNI4
line 1776
;1776:		customSounds[3] = G_SoundIndex(va("%s/pain100", aeInfo->soundPath));
ADDRGP4 $608
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8+12
ADDRLP4 104
INDIRI4
ASGNI4
line 1777
;1777:		numSounds = 4;
ADDRLP4 4
CNSTI4 4
ASGNI4
line 1778
;1778:	}
ADDRGP4 $621
JUMPV
LABELV $620
line 1779
;1779:	else if (soundType == ANIMENT_CUSTOMSOUND_DEATH)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $625
line 1780
;1780:	{
line 1781
;1781:		customSounds[0] = G_SoundIndex(va("%s/death1", aeInfo->soundPath));
ADDRGP4 $609
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 80
INDIRI4
ASGNI4
line 1782
;1782:		customSounds[1] = G_SoundIndex(va("%s/death2", aeInfo->soundPath));
ADDRGP4 $610
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8+4
ADDRLP4 88
INDIRI4
ASGNI4
line 1783
;1783:		customSounds[2] = G_SoundIndex(va("%s/death3", aeInfo->soundPath));
ADDRGP4 $611
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8+8
ADDRLP4 96
INDIRI4
ASGNI4
line 1784
;1784:		numSounds = 3;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 1785
;1785:	}
ADDRGP4 $626
JUMPV
LABELV $625
line 1786
;1786:	else if (soundType == ANIMENT_CUSTOMSOUND_ALERT)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $629
line 1787
;1787:	{
line 1788
;1788:		customSounds[0] = G_SoundIndex(va("%s/detected1", aeInfo->soundPath));
ADDRGP4 $612
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 80
INDIRI4
ASGNI4
line 1789
;1789:		customSounds[1] = G_SoundIndex(va("%s/detected2", aeInfo->soundPath));
ADDRGP4 $613
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8+4
ADDRLP4 88
INDIRI4
ASGNI4
line 1790
;1790:		customSounds[2] = G_SoundIndex(va("%s/detected3", aeInfo->soundPath));
ADDRGP4 $614
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8+8
ADDRLP4 96
INDIRI4
ASGNI4
line 1791
;1791:		customSounds[3] = G_SoundIndex(va("%s/detected4", aeInfo->soundPath));
ADDRGP4 $615
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8+12
ADDRLP4 104
INDIRI4
ASGNI4
line 1792
;1792:		customSounds[4] = G_SoundIndex(va("%s/detected5", aeInfo->soundPath));
ADDRGP4 $616
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8+16
ADDRLP4 112
INDIRI4
ASGNI4
line 1793
;1793:		numSounds = 5;
ADDRLP4 4
CNSTI4 5
ASGNI4
line 1794
;1794:	}
LABELV $629
LABELV $626
LABELV $621
line 1796
;1795:
;1796:	if (!numSounds)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $635
line 1797
;1797:	{
line 1798
;1798:		return;
ADDRGP4 $617
JUMPV
LABELV $635
line 1801
;1799:	}
;1800:
;1801:	G_Sound(self, CHAN_AUTO, customSounds[Q_irand(0, numSounds-1 + gRandomUnlockAdd,qfalse, (numSounds-1)/2)]);
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 80
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 80
INDIRI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
ADDI4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 80
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRLP4 84
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 84
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1802
;1802:}
LABELV $617
endproc ExampleAnimEntCustomSound 116 16
export ExampleAnimEntAlignment
proc ExampleAnimEntAlignment 8 4
line 1805
;1803:
;1804:int ExampleAnimEntAlignment(gentity_t *self)
;1805:{
line 1806
;1806:	if (self->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
NEI4 $638
line 1807
;1807:	{
line 1808
;1808:		return ANIMENT_ALIGNED_BAD;
CNSTI4 1
RETI4
ADDRGP4 $637
JUMPV
LABELV $638
line 1811
;1809:	}
;1810:	
;1811:	if (self->watertype == ANIMENT_TYPE_RODIAN)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1
NEI4 $640
line 1812
;1812:	{
line 1813
;1813:		return ANIMENT_ALIGNED_BAD;
CNSTI4 1
RETI4
ADDRGP4 $637
JUMPV
LABELV $640
line 1816
;1814:	}
;1815:
;1816:	if (self->watertype == ANIMENT_TYPE_JAN)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 2
NEI4 $642
line 1817
;1817:	{
line 1818
;1818:		return ANIMENT_ALIGNED_GOOD;
CNSTI4 2
RETI4
ADDRGP4 $637
JUMPV
LABELV $642
line 1821
;1819:	}
;1820:	
;1821:	if (self->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 3
NEI4 $644
line 1822
;1822:	{
line 1823
;1823:		animentCustomInfo_t *aeInfo = ExampleAnimEntCustomData(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 ExampleAnimEntCustomData
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1825
;1824:
;1825:		if (aeInfo)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $646
line 1826
;1826:		{
line 1827
;1827:			return aeInfo->aeAlignment;
ADDRLP4 0
INDIRP4
INDIRI4
RETI4
ADDRGP4 $637
JUMPV
LABELV $646
line 1829
;1828:		}
;1829:	}
LABELV $644
line 1831
;1830:
;1831:	return ANIMENT_ALIGNED_UNKNOWN;
CNSTI4 0
RETI4
LABELV $637
endproc ExampleAnimEntAlignment 8 4
export ExampleAnimEntAlertOthers
proc ExampleAnimEntAlertOthers 32 20
line 1835
;1832:}
;1833:
;1834:void ExampleAnimEntAlertOthers(gentity_t *self)
;1835:{
line 1837
;1836:	//alert all the other animents in the area
;1837:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $650
JUMPV
LABELV $649
line 1840
;1838:
;1839:	while (i < MAX_GENTITIES)
;1840:	{
line 1841
;1841:		if (g_entities[i].inuse &&
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $652
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $652
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $652
line 1844
;1842:			g_entities[i].s.eType == ET_GRAPPLE &&
;1843:			g_entities[i].health > 0)
;1844:		{
line 1845
;1845:			if (g_entities[i].bolt_Motion == ENTITYNUM_NONE && trap_InPVS(self->r.currentOrigin, g_entities[i].r.currentOrigin) &&
ADDRLP4 12
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+852
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $657
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $657
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $657
line 1847
;1846:				ExampleAnimEntAlignment(self) == ExampleAnimEntAlignment(&g_entities[i]))
;1847:			{
line 1848
;1848:				g_entities[i].bolt_Motion = self->bolt_Motion;
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+852
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
line 1849
;1849:				g_entities[i].speed = level.time + 4000; //4 seconds til we forget about the enemy
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+616
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 1850
;1850:				g_entities[i].bolt_RArm = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 500, 1000, qfalse, 750);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 750
ARGI4
ADDRLP4 28
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+836
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 28
INDIRI4
ADDI4
ASGNI4
line 1851
;1851:			}
LABELV $657
line 1852
;1852:		}
LABELV $652
line 1854
;1853:
;1854:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1855
;1855:	}
LABELV $650
line 1839
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $649
line 1856
;1856:}
LABELV $648
endproc ExampleAnimEntAlertOthers 32 20
export ExampleAnimEnt_Die
proc ExampleAnimEnt_Die 52 20
line 1859
;1857:
;1858:void ExampleAnimEnt_Die( gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod )
;1859:{
line 1860
;1860:	self->s.torsoAnim = G_PickDeathAnim(self, self->pos1, damage, mod, HL_NONE);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
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
ADDRLP4 4
ADDRGP4 G_PickDeathAnim
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1862
;1861:
;1862:	if (self->s.torsoAnim <= 0 || self->s.torsoAnim >= MAX_TOTALANIMATIONS)
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $670
ADDRLP4 8
INDIRI4
CNSTI4 1211
LTI4 $668
LABELV $670
line 1863
;1863:	{ //?! (bad)
line 1864
;1864:		self->s.torsoAnim = BOTH_DEATH1;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 1
ASGNI4
line 1865
;1865:	}
LABELV $668
line 1867
;1866:
;1867:	self->s.legsAnim = self->s.torsoAnim;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 280
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ASGNI4
line 1868
;1868:	self->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 1
ASGNI4
line 1869
;1869:	self->s.eFlags |= EF_DEAD;
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
CNSTI4 1
BORI4
ASGNI4
line 1870
;1870:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 1871
;1871:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 1873
;1872:
;1873:	if (self->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
NEI4 $671
line 1874
;1874:	{
line 1875
;1875:		G_Sound(self, CHAN_AUTO, gTrooperSound_Death[Q_irand(0, TROOPER_DEATH_SOUNDS-1 + gRandomUnlockAdd, qfalse, (TROOPER_DEATH_SOUNDS - 1) / 2)]);
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gTrooperSound_Death
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1876
;1876:	}
ADDRGP4 $672
JUMPV
LABELV $671
line 1877
;1877:	else if (self->watertype == ANIMENT_TYPE_RODIAN)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1
NEI4 $673
line 1878
;1878:	{
line 1879
;1879:		G_Sound(self, CHAN_AUTO, gRodianSound_Death[Q_irand(0, RODIAN_DEATH_SOUNDS-1 + gRandomUnlockAdd, qfalse, (RODIAN_DEATH_SOUNDS - 1) / 2)]);
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gRodianSound_Death
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1880
;1880:	}
ADDRGP4 $674
JUMPV
LABELV $673
line 1881
;1881:	else if (self->watertype == ANIMENT_TYPE_JAN)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 2
NEI4 $675
line 1882
;1882:	{
line 1883
;1883:		G_Sound(self, CHAN_AUTO, gJanSound_Death[Q_irand(0, JAN_DEATH_SOUNDS-1 + gRandomUnlockAdd,qfalse,(JAN_DEATH_SOUNDS - 1)/2)]);
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gJanSound_Death
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1884
;1884:	}
ADDRGP4 $676
JUMPV
LABELV $675
line 1885
;1885:	else if (self->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 3
NEI4 $677
line 1886
;1886:	{
line 1887
;1887:		ExampleAnimEntCustomSound(self, ANIMENT_CUSTOMSOUND_DEATH);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ExampleAnimEntCustomSound
CALLV
pop
line 1888
;1888:	}
LABELV $677
LABELV $676
LABELV $674
LABELV $672
line 1890
;1889:
;1890:	if (mod == MOD_SABER)
ADDRFP4 16
INDIRI4
CNSTI4 3
NEI4 $679
line 1891
;1891:	{ //Set the velocity up a bit to make the limb fly up more than it otherwise would.
line 1893
;1892:		vec3_t preDelta;
;1893:		VectorCopy(self->s.pos.trDelta, preDelta);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1895
;1894:
;1895:		if (Q_irand(1, 10, g_defrag.integer, 5) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 32
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 5
GEI4 $681
line 1896
;1896:		{
line 1897
;1897:			self->s.pos.trDelta[0] += Q_irandExpectedIf(gRandomUnlockAdd, 10, 40, g_defrag.integer, 25);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTI4 40
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 25
ARGI4
ADDRLP4 36
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1898
;1898:		}
ADDRGP4 $682
JUMPV
LABELV $681
line 1900
;1899:		else
;1900:		{
line 1901
;1901:			self->s.pos.trDelta[0] -= Q_irandExpectedIf(gRandomUnlockAdd, 10, 40, g_defrag.integer, 25);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTI4 40
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 25
ARGI4
ADDRLP4 36
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 36
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1902
;1902:		}
LABELV $682
line 1903
;1903:		if (Q_irand(1, 10, g_defrag.integer, 5) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 5
GEI4 $686
line 1904
;1904:		{
line 1905
;1905:			self->s.pos.trDelta[1] += Q_irandExpectedIf(gRandomUnlockAdd,10, 40, g_defrag.integer, 25);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 40
CNSTI4 40
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 25
ARGI4
ADDRLP4 44
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 44
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1906
;1906:		}
ADDRGP4 $687
JUMPV
LABELV $686
line 1908
;1907:		else
;1908:		{
line 1909
;1909:			self->s.pos.trDelta[1] -= Q_irandExpectedIf(gRandomUnlockAdd, 10, 40, g_defrag.integer, 25);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 40
CNSTI4 40
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 25
ARGI4
ADDRLP4 44
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 48
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 44
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 1910
;1910:		}
LABELV $687
line 1911
;1911:		self->s.pos.trDelta[2] += 100;
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
CNSTF4 1120403456
ADDF4
ASGNF4
line 1912
;1912:		G_CheckForDismemberment(self, self->pos1, damage, self->s.torsoAnim);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 552
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_CheckForDismemberment
CALLV
pop
line 1914
;1913:		
;1914:		VectorCopy(preDelta, self->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 1915
;1915:	}
LABELV $679
line 1917
;1916:
;1917:	if (self->bolt_Motion == ENTITYNUM_NONE &&
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $691
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $693
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $691
LABELV $693
line 1919
;1918:		(attacker->client || attacker->s.eType == ET_GRAPPLE))
;1919:	{
line 1920
;1920:		self->bolt_Motion = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1921
;1921:	}
LABELV $691
line 1923
;1922:
;1923:	if (self->bolt_Motion != ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $694
line 1924
;1924:	{
line 1925
;1925:		ExampleAnimEntAlertOthers(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ExampleAnimEntAlertOthers
CALLV
pop
line 1926
;1926:	}
LABELV $694
line 1928
;1927:
;1928:	trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1930
;1929:
;1930:	self->bolt_Head = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1931
;1931:}
LABELV $667
endproc ExampleAnimEnt_Die 52 20
export ExampleAnimEnt_Pain
proc ExampleAnimEnt_Pain 40 20
line 1934
;1932:
;1933:void ExampleAnimEnt_Pain(gentity_t *self, gentity_t *attacker, int damage)
;1934:{
line 1935
;1935:	int painAnim = (BOTH_PAIN1 + Q_irand(0, 3 + gRandomUnlockAdd, g_defrag.integer, 2));
CNSTI4 0
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 8
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 97
ADDI4
ASGNI4
line 1936
;1936:	int animLen = (bgGlobalAnimations[painAnim].numFrames * abs(bgGlobalAnimations[painAnim].frameLerp))-50;
ADDRLP4 12
CNSTI4 28
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
MULI4
CNSTI4 50
SUBI4
ASGNI4
ADDRGP4 $702
JUMPV
LABELV $701
line 1939
;1937:
;1938:	while (painAnim == self->s.torsoAnim)
;1939:	{
line 1940
;1940:		painAnim = (BOTH_PAIN1 + Q_irand(0, 3 + gRandomUnlockAdd, g_defrag.integer, 2));
CNSTI4 0
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
CNSTI4 97
ADDI4
ASGNI4
line 1941
;1941:	}
LABELV $702
line 1938
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
EQI4 $701
line 1943
;1942:
;1943:	self->s.torsoAnim = painAnim;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1944
;1944:	self->s.legsAnim = painAnim;
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1945
;1945:	self->bolt_LArm = level.time + animLen;
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1947
;1946:
;1947:	if (self->s.torsoAnim <= 0 || self->s.torsoAnim >= MAX_TOTALANIMATIONS)
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LEI4 $708
ADDRLP4 20
INDIRI4
CNSTI4 1211
LTI4 $706
LABELV $708
line 1948
;1948:	{
line 1949
;1949:		self->s.torsoAnim = self->s.legsAnim = BOTH_PAIN1;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 97
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 280
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 284
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1950
;1950:	}
LABELV $706
line 1952
;1951:
;1952:	if (self->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
NEI4 $709
line 1953
;1953:	{
line 1954
;1954:		G_Sound(self, CHAN_AUTO, gTrooperSound_Pain[Q_irand(0, TROOPER_PAIN_SOUNDS-1 + gRandomUnlockAdd, qfalse, (TROOPER_PAIN_SOUNDS - 1) / 2)]);
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gTrooperSound_Pain
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1955
;1955:	}
ADDRGP4 $710
JUMPV
LABELV $709
line 1956
;1956:	else if (self->watertype == ANIMENT_TYPE_RODIAN)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1
NEI4 $711
line 1957
;1957:	{
line 1958
;1958:		G_Sound(self, CHAN_AUTO, gRodianSound_Pain[Q_irand(0, RODIAN_PAIN_SOUNDS-1 + gRandomUnlockAdd, qfalse, (RODIAN_PAIN_SOUNDS - 1) / 2)]);
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gRodianSound_Pain
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1959
;1959:	}
ADDRGP4 $712
JUMPV
LABELV $711
line 1960
;1960:	else if (self->watertype == ANIMENT_TYPE_JAN)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 2
NEI4 $713
line 1961
;1961:	{
line 1962
;1962:		G_Sound(self, CHAN_AUTO, gJanSound_Pain[Q_irand(0, JAN_PAIN_SOUNDS-1 + gRandomUnlockAdd,qfalse,(JAN_PAIN_SOUNDS - 1)/2)]);
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gJanSound_Pain
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1963
;1963:	}
ADDRGP4 $714
JUMPV
LABELV $713
line 1964
;1964:	else if (self->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 3
NEI4 $715
line 1965
;1965:	{
line 1966
;1966:		ExampleAnimEntCustomSound(self, ANIMENT_CUSTOMSOUND_PAIN);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ExampleAnimEntCustomSound
CALLV
pop
line 1967
;1967:	}
LABELV $715
LABELV $714
LABELV $712
LABELV $710
line 1969
;1968:
;1969:	if (attacker && (attacker->client || attacker->s.eType == ET_GRAPPLE) && self->bolt_Motion == ENTITYNUM_NONE)
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
EQU4 $717
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
NEU4 $719
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $717
LABELV $719
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $717
line 1970
;1970:	{
line 1971
;1971:		if (attacker->s.number >= MAX_CLIENTS || (ExampleAnimEntAlignment(self) != ANIMENT_ALIGNED_GOOD && !(attacker->r.svFlags & SVF_BOT)))
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 32
GEI4 $722
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 2
EQI4 $720
ADDRFP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $720
LABELV $722
line 1972
;1972:		{
line 1973
;1973:			self->bolt_Motion = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 1974
;1974:			self->speed = level.time + 4000; //4 seconds til we forget about the enemy
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 1975
;1975:			ExampleAnimEntAlertOthers(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ExampleAnimEntAlertOthers
CALLV
pop
line 1976
;1976:			self->bolt_RArm = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 500, 1000, g_defrag.integer, 750);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 750
ARGI4
ADDRLP4 36
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 36
INDIRI4
ADDI4
ASGNI4
line 1977
;1977:		}
LABELV $720
line 1978
;1978:	}
LABELV $717
line 1979
;1979:}
LABELV $697
endproc ExampleAnimEnt_Pain 40 20
export ExampleAnimEntTouch
proc ExampleAnimEntTouch 0 0
line 1982
;1980:
;1981:void ExampleAnimEntTouch(gentity_t *self, gentity_t *other, trace_t *trace)
;1982:{
line 1984
;1983:
;1984:}
LABELV $726
endproc ExampleAnimEntTouch 0 0
export ExampleAnimEntMove
proc ExampleAnimEntMove 1220 28
line 1989
;1985:
;1986://We can use this method of movement without horrible choppiness, because
;1987://we are smoothing out the lerpOrigin on the client when rendering this eType.
;1988:int ExampleAnimEntMove(gentity_t *self, vec3_t moveTo, float stepSize)
;1989:{
line 1994
;1990:	trace_t tr;
;1991:	vec3_t stepTo;
;1992:	vec3_t stepSub;
;1993:	vec3_t stepGoal;
;1994:	int didMove = 0;
ADDRLP4 1116
CNSTI4 0
ASGNI4
line 1996
;1995:
;1996:	if (self->s.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $728
line 1997
;1997:	{
line 1998
;1998:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $727
JUMPV
LABELV $728
line 2001
;1999:	}
;2000:
;2001:	VectorCopy(moveTo, stepTo);
ADDRLP4 1104
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2002
;2002:	stepTo[2] = self->r.currentOrigin[2];
ADDRLP4 1104+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ASGNF4
line 2004
;2003:
;2004:	VectorSubtract(stepTo, self->r.currentOrigin, stepSub);
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
ADDRLP4 1104
INDIRF4
ADDRLP4 1120
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1104+4
INDIRF4
ADDRLP4 1120
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1080+8
ADDRLP4 1104+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2006
;2005:
;2006:	if (VectorLength(stepSub) < 32)
ADDRLP4 1080
ARGP4
ADDRLP4 1124
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1124
INDIRF4
CNSTF4 1107296256
GEF4 $735
line 2007
;2007:	{
line 2008
;2008:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $727
JUMPV
LABELV $735
line 2011
;2009:	}
;2010:
;2011:	VectorNormalize(stepSub);
ADDRLP4 1080
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2013
;2012:
;2013:	stepGoal[0] = self->r.currentOrigin[0] + stepSub[0]*stepSize;
ADDRLP4 1092
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 1080
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2014
;2014:	stepGoal[1] = self->r.currentOrigin[1] + stepSub[1]*stepSize;
ADDRLP4 1092+4
ADDRFP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 1080+4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2015
;2015:	stepGoal[2] = self->r.currentOrigin[2] + stepSub[2]*stepSize;
ADDRLP4 1092+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 1080+8
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2017
;2016:
;2017:	JP_Trace(&tr, self->r.currentOrigin, self->r.mins, self->r.maxs, stepGoal, self->s.number, self->clipmask);
ADDRLP4 0
ARGP4
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1128
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1128
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1128
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1128
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2019
;2018:
;2019:	if (!tr.startsolid && !tr.allsolid && tr.fraction)
ADDRLP4 1132
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1132
INDIRI4
NEI4 $741
ADDRLP4 0
INDIRI4
ADDRLP4 1132
INDIRI4
NEI4 $741
ADDRLP4 0+8
INDIRF4
CNSTF4 0
EQF4 $741
line 2020
;2020:	{
line 2022
;2021:		vec3_t vecSub;
;2022:		VectorSubtract(self->r.currentOrigin, tr.endpos, vecSub);
ADDRLP4 1148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
ADDRLP4 1148
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1136+4
ADDRLP4 1148
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1136+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 2024
;2023:
;2024:		if (VectorLength(vecSub) > (stepSize/2))
ADDRLP4 1136
ARGP4
ADDRLP4 1152
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1152
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1073741824
DIVF4
LEF4 $752
line 2025
;2025:		{
line 2026
;2026:			self->r.currentOrigin[0] = tr.endpos[0];
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0+12
INDIRF4
ASGNF4
line 2027
;2027:			self->r.currentOrigin[1] = tr.endpos[1];
ADDRFP4 0
INDIRP4
CNSTI4 372
ADDP4
ADDRLP4 0+12+4
INDIRF4
ASGNF4
line 2028
;2028:			self->s.pos.trBase[0] = tr.endpos[0];
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRF4
ASGNF4
line 2029
;2029:			self->s.pos.trBase[1] = tr.endpos[1];
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 0+12+4
INDIRF4
ASGNF4
line 2030
;2030:			self->s.origin[0] = tr.endpos[0];
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRF4
ASGNF4
line 2031
;2031:			self->s.origin[1] = tr.endpos[1];
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 0+12+4
INDIRF4
ASGNF4
line 2032
;2032:			trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2033
;2033:			didMove = 1;
ADDRLP4 1116
CNSTI4 1
ASGNI4
line 2034
;2034:		}
LABELV $752
line 2035
;2035:	}
LABELV $741
line 2037
;2036:	
;2037:	if (didMove != 1)
ADDRLP4 1116
INDIRI4
CNSTI4 1
EQI4 $763
line 2038
;2038:	{ //stair check
line 2044
;2039:		vec3_t trFrom;
;2040:		vec3_t trTo;
;2041:		vec3_t trDir;
;2042:		vec3_t vecMeasure;
;2043:
;2044:		VectorCopy(tr.endpos, trFrom);
ADDRLP4 1160
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2045
;2045:		trFrom[2] += 16;
ADDRLP4 1160+8
ADDRLP4 1160+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2047
;2046:
;2047:		VectorSubtract(/*tr.endpos*/stepGoal, self->r.currentOrigin, trDir);
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1148
ADDRLP4 1092
INDIRF4
ADDRLP4 1184
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1148+4
ADDRLP4 1092+4
INDIRF4
ADDRLP4 1184
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1148+8
ADDRLP4 1092+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2048
;2048:		VectorNormalize(trDir);
ADDRLP4 1148
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2049
;2049:		trTo[0] = tr.endpos[0] + trDir[0]*2;
ADDRLP4 1136
ADDRLP4 0+12
INDIRF4
CNSTF4 1073741824
ADDRLP4 1148
INDIRF4
MULF4
ADDF4
ASGNF4
line 2050
;2050:		trTo[1] = tr.endpos[1] + trDir[1]*2;
ADDRLP4 1136+4
ADDRLP4 0+12+4
INDIRF4
CNSTF4 1073741824
ADDRLP4 1148+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2051
;2051:		trTo[2] = tr.endpos[2] + trDir[2]*2;
ADDRLP4 1136+8
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1073741824
ADDRLP4 1148+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2052
;2052:		trTo[2] += 16;
ADDRLP4 1136+8
ADDRLP4 1136+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 2054
;2053:
;2054:		VectorSubtract(trFrom, trTo, vecMeasure);
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
line 2056
;2055:
;2056:		if (VectorLength(vecMeasure) > 1)
ADDRLP4 1172
ARGP4
ADDRLP4 1188
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1188
INDIRF4
CNSTF4 1065353216
LEF4 $787
line 2057
;2057:		{
line 2058
;2058:			JP_Trace(&tr, trFrom, self->r.mins, self->r.maxs, trTo, self->s.number, self->clipmask);
ADDRLP4 0
ARGP4
ADDRLP4 1160
ARGP4
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1192
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1192
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1136
ARGP4
ADDRLP4 1192
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1192
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2060
;2059:
;2060:			if (!tr.startsolid && !tr.allsolid && tr.fraction == 1)
ADDRLP4 1196
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1196
INDIRI4
NEI4 $789
ADDRLP4 0
INDIRI4
ADDRLP4 1196
INDIRI4
NEI4 $789
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $789
line 2061
;2061:			{ //clear trace here, probably up a step
line 2063
;2062:				vec3_t trDown;
;2063:				VectorCopy(tr.endpos, trDown);
ADDRLP4 1200
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2064
;2064:				trDown[2] -= 16;
ADDRLP4 1200+8
ADDRLP4 1200+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 2066
;2065:
;2066:				JP_Trace(&tr, trFrom, self->r.mins, self->r.maxs, trTo, self->s.number, self->clipmask);
ADDRLP4 0
ARGP4
ADDRLP4 1160
ARGP4
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1212
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1136
ARGP4
ADDRLP4 1212
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1212
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2068
;2067:
;2068:				if (!tr.startsolid && !tr.allsolid)
ADDRLP4 1216
CNSTI4 0
ASGNI4
ADDRLP4 0+4
INDIRI4
ADDRLP4 1216
INDIRI4
NEI4 $795
ADDRLP4 0
INDIRI4
ADDRLP4 1216
INDIRI4
NEI4 $795
line 2069
;2069:				{ //plop us down on the step after moving up
line 2070
;2070:					VectorCopy(tr.endpos, self->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2071
;2071:					VectorCopy(tr.endpos, self->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2072
;2072:					VectorCopy(tr.endpos, self->s.origin);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2073
;2073:					trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2074
;2074:					didMove = 1;
ADDRLP4 1116
CNSTI4 1
ASGNI4
line 2075
;2075:				}
LABELV $795
line 2076
;2076:			}
LABELV $789
line 2077
;2077:		}
LABELV $787
line 2078
;2078:	}
LABELV $763
line 2080
;2079:
;2080:	return didMove;
ADDRLP4 1116
INDIRI4
RETI4
LABELV $727
endproc ExampleAnimEntMove 1220 28
export ExampleAnimEntYaw
proc ExampleAnimEntYaw 28 8
line 2084
;2081:}
;2082:
;2083:float ExampleAnimEntYaw(gentity_t *self, float idealYaw, float yawSpeed)
;2084:{
line 2085
;2085:	float curYaw = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2086
;2086:	float diffYaw = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 2088
;2087:
;2088:	curYaw = AngleNormalize360(self->s.apos.trBase[YAW]);
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleNormalize360
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 2090
;2089:
;2090:	diffYaw = AngleSubtract( curYaw, idealYaw );
ADDRLP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 12
INDIRF4
ASGNF4
line 2092
;2091:
;2092:	if ( fabs(diffYaw) > 0.25f )
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 1048576000
LEF4 $802
line 2093
;2093:	{
line 2094
;2094:		if ( fabs(diffYaw) > yawSpeed )
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 20
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $804
line 2095
;2095:		{
line 2097
;2096:			// cap max speed
;2097:			curYaw += (diffYaw > 0.0f) ? -yawSpeed : yawSpeed;
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $807
ADDRLP4 24
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
ADDRGP4 $808
JUMPV
LABELV $807
ADDRLP4 24
ADDRFP4 8
INDIRF4
ASGNF4
LABELV $808
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 2098
;2098:		}
ADDRGP4 $805
JUMPV
LABELV $804
line 2100
;2099:		else
;2100:		{
line 2102
;2101:			// small enough
;2102:			curYaw -= diffYaw;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 2103
;2103:		}
LABELV $805
line 2104
;2104:	}
LABELV $802
line 2106
;2105:
;2106:	return curYaw;
ADDRLP4 0
INDIRF4
RETF4
LABELV $801
endproc ExampleAnimEntYaw 28 8
export ExampleAnimEntLook
proc ExampleAnimEntLook 28 12
line 2110
;2107:}
;2108:
;2109:void ExampleAnimEntLook(gentity_t *self, vec3_t lookTo)
;2110:{
line 2113
;2111:	vec3_t lookSub;
;2112:
;2113:	VectorSubtract(lookTo, self->r.currentOrigin, lookSub);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
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
line 2114
;2114:	VectorNormalize(lookSub);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2115
;2115:	vectoangles(lookSub, lookSub);
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2117
;2116:
;2117:	if (lookSub[PITCH] < -180)
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $812
line 2118
;2118:	{
line 2119
;2119:		lookSub[PITCH] -= 90;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1119092736
SUBF4
ASGNF4
line 2120
;2120:	}
LABELV $812
line 2123
;2121:
;2122:	//VectorCopy(lookSub, self->s.apos.trBase);
;2123:	self->s.apos.trBase[PITCH] = lookSub[PITCH];
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 2124
;2124:	self->s.apos.trBase[ROLL] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTF4 0
ASGNF4
line 2125
;2125:	self->s.apos.trBase[YAW] = ExampleAnimEntYaw(self, lookSub[YAW], 20);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1101004800
ARGF4
ADDRLP4 24
ADDRGP4 ExampleAnimEntYaw
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2126
;2126:}
LABELV $809
endproc ExampleAnimEntLook 28 12
export ExampleAnimEntClearLOS
proc ExampleAnimEntClearLOS 1112 28
line 2129
;2127:
;2128:qboolean ExampleAnimEntClearLOS(gentity_t *self, vec3_t point)
;2129:{
line 2132
;2130:	trace_t tr;
;2131:
;2132:	JP_Trace(&tr, self->r.currentOrigin, 0, 0, point, self->s.number, self->clipmask);
ADDRLP4 0
ARGP4
ADDRLP4 1080
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1084
CNSTP4 0
ASGNP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1080
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1080
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2134
;2133:
;2134:	if (ExampleAnimEntAlignment(self) == ANIMENT_ALIGNED_GOOD)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1088
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 2
NEI4 $816
line 2135
;2135:	{
line 2136
;2136:		if (tr.fraction == 1 ||
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $826
ADDRLP4 1092
CNSTI4 2352
ASGNI4
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $827
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1096
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 2
NEI4 $826
LABELV $827
ADDRLP4 1100
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 32
GEI4 $818
ADDRLP4 0+52
INDIRI4
ADDRLP4 1100
INDIRI4
NEI4 $818
LABELV $826
line 2139
;2137:			(g_entities[tr.entityNum].s.eType == ET_GRAPPLE && ExampleAnimEntAlignment(&g_entities[tr.entityNum]) != ANIMENT_ALIGNED_GOOD) ||
;2138:			(self->bolt_Motion < MAX_CLIENTS && tr.entityNum == self->bolt_Motion))
;2139:		{ //clear LOS, or would be hitting a bad animent, so fire.
line 2140
;2140:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $815
JUMPV
LABELV $818
line 2142
;2141:		}
;2142:		else if (g_entities[tr.entityNum].inuse && g_entities[tr.entityNum].client && (g_entities[tr.entityNum].r.svFlags & SVF_BOT))
ADDRLP4 1104
CNSTI4 2352
ASGNI4
ADDRLP4 1108
CNSTI4 0
ASGNI4
ADDRLP4 1104
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1108
INDIRI4
EQI4 $817
ADDRLP4 1104
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $817
ADDRLP4 1104
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 1108
INDIRI4
EQI4 $817
line 2143
;2143:		{
line 2144
;2144:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $815
JUMPV
line 2146
;2145:		}
;2146:	}
LABELV $816
line 2148
;2147:	else
;2148:	{
line 2149
;2149:		if (tr.fraction == 1 ||
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $845
ADDRLP4 0+52
INDIRI4
CNSTI4 32
LTI4 $845
ADDRLP4 1092
CNSTI4 2352
ASGNI4
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $837
ADDRLP4 1092
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1096
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 1
EQI4 $837
LABELV $845
line 2152
;2150:			tr.entityNum < MAX_CLIENTS ||
;2151:			(g_entities[tr.entityNum].s.eType == ET_GRAPPLE && ExampleAnimEntAlignment(&g_entities[tr.entityNum]) != ANIMENT_ALIGNED_BAD))
;2152:		{ //clear LOS, or would be hitting a client (they're all bad!), so fire.
line 2153
;2153:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $815
JUMPV
LABELV $837
line 2155
;2154:		}
;2155:	}
LABELV $817
line 2157
;2156:
;2157:	return qfalse;
CNSTI4 0
RETI4
LABELV $815
endproc ExampleAnimEntClearLOS 1112 28
export ExampleAnimEntWeaponHandling
proc ExampleAnimEntWeaponHandling 8 20
line 2161
;2158:}
;2159:
;2160:void ExampleAnimEntWeaponHandling(gentity_t *self)
;2161:{
line 2162
;2162:	if (self->bolt_RArm > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $847
line 2163
;2163:	{
line 2164
;2164:		return;
ADDRGP4 $846
JUMPV
LABELV $847
line 2167
;2165:	}
;2166:
;2167:	if (self->boltpoint4)
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRI4
CNSTI4 0
EQI4 $850
line 2168
;2168:	{
line 2169
;2169:		if (self->s.weapon == WP_DISRUPTOR)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 5
NEI4 $852
line 2170
;2170:		{
line 2171
;2171:			AnimEntFireWeapon(self, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AnimEntFireWeapon
CALLV
pop
line 2172
;2172:			G_AddEvent(self, EV_FIRE_WEAPON, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 24
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2173
;2173:			self->bolt_RArm = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 1500, 2500, g_defrag.integer, 2000);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 1500
ARGI4
CNSTI4 2500
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 2000
ARGI4
ADDRLP4 0
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 2174
;2174:		}
ADDRGP4 $853
JUMPV
LABELV $852
line 2176
;2175:		else
;2176:		{
line 2177
;2177:			AnimEntFireWeapon(self, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 AnimEntFireWeapon
CALLV
pop
line 2178
;2178:			G_AddEvent(self, EV_FIRE_WEAPON, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 24
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2180
;2179:
;2180:			if (self->s.weapon == WP_REPEATER)
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 7
NEI4 $856
line 2181
;2181:			{
line 2182
;2182:				self->bolt_RArm = level.time + Q_irand(1, 500, g_defrag.integer, 50);
CNSTI4 1
ARGI4
CNSTI4 500
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 50
ARGI4
ADDRLP4 0
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 2183
;2183:			}
ADDRGP4 $857
JUMPV
LABELV $856
line 2184
;2184:			else if (ExampleAnimEntAlignment(self) == ANIMENT_ALIGNED_GOOD)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $860
line 2185
;2185:			{
line 2186
;2186:				self->bolt_RArm = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 200, 400, g_defrag.integer, 300);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 200
ARGI4
CNSTI4 400
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 300
ARGI4
ADDRLP4 4
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 2187
;2187:			}
ADDRGP4 $861
JUMPV
LABELV $860
line 2189
;2188:			else
;2189:			{
line 2190
;2190:				self->bolt_RArm = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 700, 1000, g_defrag.integer, 850);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 700
ARGI4
CNSTI4 1000
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 850
ARGI4
ADDRLP4 4
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 2191
;2191:			}
LABELV $861
LABELV $857
line 2192
;2192:		}
LABELV $853
line 2193
;2193:	}
LABELV $850
line 2194
;2194:}
LABELV $846
endproc ExampleAnimEntWeaponHandling 8 20
export ExampleAnimEntWayValidCheck
proc ExampleAnimEntWayValidCheck 1096 28
line 2197
;2195:
;2196:qboolean ExampleAnimEntWayValidCheck(gentity_t *self)
;2197:{
line 2201
;2198:	wpobject_t *currentWP;
;2199:	trace_t tr;
;2200:
;2201:	if (self->bolt_Waist < 0 ||
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
LTI4 $869
ADDRLP4 1084
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $867
LABELV $869
line 2203
;2202:		self->bolt_Waist >= gWPNum)
;2203:	{
line 2204
;2204:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $866
JUMPV
LABELV $867
line 2207
;2205:	}
;2206:
;2207:	if (self->boltpoint1 < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $870
line 2208
;2208:	{
line 2209
;2209:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $866
JUMPV
LABELV $870
line 2212
;2210:	}
;2211:
;2212:	if (self->boltpoint2 < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $873
line 2213
;2213:	{
line 2214
;2214:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $866
JUMPV
LABELV $873
line 2217
;2215:	}
;2216:
;2217:	currentWP = gWPArray[self->bolt_Waist];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2219
;2218:
;2219:	if (!currentWP)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $876
line 2220
;2220:	{
line 2221
;2221:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $866
JUMPV
LABELV $876
line 2224
;2222:	}
;2223:
;2224:	JP_Trace(&tr, self->r.currentOrigin, 0, 0, currentWP->origin, self->s.number, self->clipmask);
ADDRLP4 4
ARGP4
ADDRLP4 1088
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1092
CNSTP4 0
ASGNP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1088
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1088
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2226
;2225:
;2226:	if (tr.fraction == 1)
ADDRLP4 4+8
INDIRF4
CNSTF4 1065353216
NEF4 $878
line 2227
;2227:	{ //allow one second for time you cannot see the point. If we go beyond that, kill the connection.
line 2228
;2228:		self->boltpoint2 = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2229
;2229:	}
LABELV $878
line 2231
;2230:
;2231:	return qtrue;
CNSTI4 1
RETI4
LABELV $866
endproc ExampleAnimEntWayValidCheck 1096 28
export ExampleAnimEntNavigation
proc ExampleAnimEntNavigation 48 8
line 2237
;2232:}
;2233:
;2234://Simple nav routine utilizing bot path data
;2235://bolt_Waist represents our current indexed waypoint
;2236:void ExampleAnimEntNavigation(gentity_t *self, vec3_t goalPos)
;2237:{
line 2238
;2238:	if (self->bolt_Waist == -1 ||
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $885
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 ExampleAnimEntWayValidCheck
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $883
LABELV $885
line 2240
;2239:		!ExampleAnimEntWayValidCheck(self))
;2240:	{
line 2241
;2241:		int wpIndex = GetNearestVisibleWP(self->r.currentOrigin, self->s.number);
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
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 GetNearestVisibleWP
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 2243
;2242:
;2243:		if (wpIndex >= 0 && wpIndex < gWPNum)
ADDRLP4 20
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $886
ADDRLP4 20
INDIRI4
ADDRGP4 gWPNum
INDIRI4
GEI4 $886
line 2244
;2244:		{
line 2245
;2245:			self->bolt_Waist = wpIndex;
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 2246
;2246:			self->boltpoint1 = level.time + 10000; //10 seconds to get to the point
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 2247
;2247:			self->boltpoint2 = level.time + 1000; //initialize the 1 second allowed visibility
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2248
;2248:		}
ADDRGP4 $887
JUMPV
LABELV $886
line 2250
;2249:		else
;2250:		{
line 2251
;2251:			self->bolt_Waist = -1;
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 -1
ASGNI4
line 2252
;2252:		}
LABELV $887
line 2253
;2253:	}
LABELV $883
line 2255
;2254:
;2255:	if (self->bolt_Waist != -1)
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $890
line 2256
;2256:	{ //we have a point to go to
line 2257
;2257:		wpobject_t *currentWP = gWPArray[self->bolt_Waist];
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2259
;2258:
;2259:		if (currentWP)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $891
line 2260
;2260:		{
line 2262
;2261:			vec3_t subLen;
;2262:			float vecLen = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 2264
;2263:
;2264:			VectorCopy(currentWP->origin, goalPos);
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRP4
INDIRB
ASGNB 12
line 2265
;2265:			VectorSubtract(self->r.currentOrigin, currentWP->origin, subLen);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 28
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2266
;2266:			vecLen = VectorLength(subLen);
ADDRLP4 16
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ASGNF4
line 2268
;2267:
;2268:			if (vecLen <= 40)
ADDRLP4 12
INDIRF4
CNSTF4 1109393408
GTF4 $891
line 2269
;2269:			{
line 2270
;2270:				int desiredIndex = -20;
ADDRLP4 40
CNSTI4 -20
ASGNI4
line 2272
;2271:
;2272:				if (!self->boltpoint3)
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
INDIRI4
CNSTI4 0
NEI4 $898
line 2273
;2273:				{
line 2274
;2274:					desiredIndex = currentWP->index+1;
ADDRLP4 40
ADDRLP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2275
;2275:				}
ADDRGP4 $899
JUMPV
LABELV $898
line 2277
;2276:				else
;2277:				{
line 2278
;2278:					desiredIndex = currentWP->index-1;
ADDRLP4 40
ADDRLP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2279
;2279:				}
LABELV $899
line 2281
;2280:
;2281:				if (desiredIndex != -20)
ADDRLP4 40
INDIRI4
CNSTI4 -20
EQI4 $900
line 2282
;2282:				{
line 2283
;2283:					if (desiredIndex < 0)
ADDRLP4 40
INDIRI4
CNSTI4 0
GEI4 $902
line 2284
;2284:					{
line 2285
;2285:						self->boltpoint3 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTI4 0
ASGNI4
line 2286
;2286:						desiredIndex = currentWP->index+1;
ADDRLP4 40
ADDRLP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2287
;2287:					}
LABELV $902
line 2288
;2288:					if (desiredIndex >= gWPNum)
ADDRLP4 40
INDIRI4
ADDRGP4 gWPNum
INDIRI4
LTI4 $904
line 2289
;2289:					{
line 2290
;2290:						self->boltpoint3 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTI4 1
ASGNI4
line 2291
;2291:						desiredIndex = currentWP->index-1;
ADDRLP4 40
ADDRLP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2292
;2292:					}
LABELV $904
line 2293
;2293:				}
LABELV $900
line 2295
;2294:
;2295:				if (desiredIndex != -1 && desiredIndex >= 0 && desiredIndex < gWPNum)
ADDRLP4 44
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 -1
EQI4 $891
ADDRLP4 44
INDIRI4
CNSTI4 0
LTI4 $891
ADDRLP4 44
INDIRI4
ADDRGP4 gWPNum
INDIRI4
GEI4 $891
line 2296
;2296:				{
line 2297
;2297:					currentWP = gWPArray[desiredIndex];
ADDRLP4 8
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gWPArray
ADDP4
INDIRP4
ASGNP4
line 2299
;2298:
;2299:					if (currentWP)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $891
line 2300
;2300:					{
line 2301
;2301:						self->bolt_Waist = desiredIndex;
ADDRFP4 0
INDIRP4
CNSTI4 848
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2302
;2302:						self->boltpoint1 = level.time + 10000; //every time we grab a new point, set the allowed travel-to time again
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 2303
;2303:						VectorCopy(currentWP->origin, goalPos);
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRP4
INDIRB
ASGNB 12
line 2304
;2304:					}
line 2305
;2305:				}
line 2306
;2306:			}
line 2307
;2307:		}
line 2308
;2308:	}
ADDRGP4 $891
JUMPV
LABELV $890
line 2310
;2309:	else
;2310:	{ //We have no place to go. Run toward the origin mindlessly.
line 2311
;2311:		VectorClear(goalPos);
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 2312
;2312:	}
LABELV $891
line 2313
;2313:}
LABELV $882
endproc ExampleAnimEntNavigation 48 8
export ExampleAnimEntEnemyHandling
proc ExampleAnimEntEnemyHandling 96 20
line 2316
;2314:
;2315:void ExampleAnimEntEnemyHandling(gentity_t *self, float enDist, qboolean enDistSet)
;2316:{
line 2317
;2317:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2318
;2318:	int bestIndex = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 2319
;2319:	float minDist = 0; // We shouldn't need to initialize this, because we're using minDistSet, but gcc doesn't trust it...
ADDRLP4 8
CNSTF4 0
ASGNF4
line 2320
;2320:	qboolean minDistSet = enDistSet;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
line 2322
;2321:
;2322:	if ( minDistSet ) minDist = enDist;
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $912
ADDRLP4 8
ADDRFP4 4
INDIRF4
ASGNF4
LABELV $912
line 2324
;2323:
;2324:	if (ExampleAnimEntAlignment(self) == ANIMENT_ALIGNED_GOOD)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $959
line 2325
;2325:	{
ADDRGP4 $917
JUMPV
LABELV $916
line 2327
;2326:		while (i < MAX_GENTITIES)
;2327:		{
line 2328
;2328:			if (g_entities[i].inuse && (g_entities[i].s.eType == ET_GRAPPLE || (g_entities[i].client && (g_entities[i].r.svFlags & SVF_BOT))) && ExampleAnimEntAlignment(&g_entities[i]) != ANIMENT_ALIGNED_GOOD && g_entities[i].health > 0 && !(g_entities[i].s.eFlags & EF_DEAD))
ADDRLP4 20
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $919
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
EQI4 $928
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $919
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 24
INDIRI4
EQI4 $919
LABELV $928
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $919
ADDRLP4 32
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LEI4 $919
ADDRLP4 32
INDIRI4
ADDRGP4 g_entities+8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 36
INDIRI4
NEI4 $919
line 2329
;2329:			{
line 2333
;2330:				vec3_t checkLen;
;2331:				float fCheckLen;
;2332:
;2333:				VectorSubtract(self->r.currentOrigin, g_entities[i].r.currentOrigin, checkLen);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 40
ADDRLP4 56
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 60
INDIRI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40+4
ADDRLP4 56
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 60
INDIRI4
ADDRGP4 g_entities+296+72+4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2335
;2334:
;2335:				fCheckLen = VectorLength(checkLen);
ADDRLP4 40
ARGP4
ADDRLP4 64
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 64
INDIRF4
ASGNF4
line 2337
;2336:
;2337:				if (!minDistSet || fCheckLen < (minDist - 128))
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $941
ADDRLP4 52
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1124073472
SUBF4
GEF4 $939
LABELV $941
line 2338
;2338:				{
line 2340
;2339:					vec3_t enAngles;
;2340:					VectorSubtract(g_entities[i].r.currentOrigin, self->r.currentOrigin, enAngles);
ADDRLP4 80
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 80
INDIRI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 80
INDIRI4
ADDRGP4 g_entities+296+72+4
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68+8
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2341
;2341:					vectoangles(enAngles, enAngles);
ADDRLP4 68
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2342
;2342:					if ((InFieldOfVision(self->s.apos.trBase, 120, enAngles) || self->s.genericenemyindex > level.time) && ExampleAnimEntClearLOS(self, g_entities[i].r.currentOrigin))
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
CNSTF4 1123024896
ARGF4
ADDRLP4 68
ARGP4
ADDRLP4 88
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $957
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $952
LABELV $957
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 ExampleAnimEntClearLOS
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $952
line 2343
;2343:					{
line 2344
;2344:						minDistSet = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2345
;2345:						minDist = fCheckLen;
ADDRLP4 8
ADDRLP4 52
INDIRF4
ASGNF4
line 2346
;2346:						bestIndex = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 2347
;2347:					}
LABELV $952
line 2348
;2348:				}
LABELV $939
line 2349
;2349:			}
LABELV $919
line 2350
;2350:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2351
;2351:		}
LABELV $917
line 2326
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $916
line 2352
;2352:	}
ADDRGP4 $915
JUMPV
line 2354
;2353:	else
;2354:	{
LABELV $958
line 2356
;2355:		while (i < MAX_CLIENTS)
;2356:		{
line 2357
;2357:			if (g_entities[i].inuse && g_entities[i].client && !(g_entities[i].r.svFlags & SVF_BOT) && g_entities[i].health > 0 && !(g_entities[i].s.eFlags & EF_DEAD) && g_entities[i].client->sess.sessionTeam != TEAM_SPECTATOR)
ADDRLP4 20
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $961
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $961
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $961
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $961
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 24
INDIRI4
NEI4 $961
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $961
line 2358
;2358:			{
line 2362
;2359:				vec3_t checkLen;
;2360:				float fCheckLen;
;2361:
;2362:				VectorSubtract(self->r.currentOrigin, g_entities[i].client->ps.origin, checkLen);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 28
ADDRLP4 44
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 44
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRGP4 g_entities+408
ADDP4
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
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2364
;2363:
;2364:				fCheckLen = VectorLength(checkLen);
ADDRLP4 28
ARGP4
ADDRLP4 52
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 52
INDIRF4
ASGNF4
line 2366
;2365:
;2366:				if (!minDistSet || fCheckLen < (minDist - 128))
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $977
ADDRLP4 40
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1124073472
SUBF4
GEF4 $975
LABELV $977
line 2367
;2367:				{
line 2369
;2368:					vec3_t enAngles;
;2369:					VectorSubtract(g_entities[i].client->ps.origin, self->r.currentOrigin, enAngles);
ADDRLP4 68
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 68
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 68
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+8
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2370
;2370:					vectoangles(enAngles, enAngles);
ADDRLP4 56
ARGP4
ADDRLP4 56
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2371
;2371:					if ((InFieldOfVision(self->s.apos.trBase, 120, enAngles) || self->s.genericenemyindex > level.time) && ExampleAnimEntClearLOS(self, g_entities[i].client->ps.origin))
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
CNSTF4 1123024896
ARGF4
ADDRLP4 56
ARGP4
ADDRLP4 76
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $987
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $983
LABELV $987
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 ExampleAnimEntClearLOS
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $983
line 2372
;2372:					{
line 2373
;2373:						minDistSet = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2374
;2374:						minDist = fCheckLen;
ADDRLP4 8
ADDRLP4 40
INDIRF4
ASGNF4
line 2375
;2375:						bestIndex = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 2376
;2376:					}
LABELV $983
line 2377
;2377:				}
LABELV $975
line 2378
;2378:			}
LABELV $961
line 2379
;2379:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2380
;2380:		}
LABELV $959
line 2355
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $958
line 2382
;2381:
;2382:		if (bestIndex == -1)
ADDRLP4 12
INDIRI4
CNSTI4 -1
NEI4 $988
line 2383
;2383:		{
line 2384
;2384:			i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $991
JUMPV
LABELV $990
line 2387
;2385:
;2386:			while (i < MAX_GENTITIES)
;2387:			{
line 2388
;2388:				if (g_entities[i].inuse && g_entities[i].s.eType == ET_GRAPPLE && ExampleAnimEntAlignment(&g_entities[i]) != ANIMENT_ALIGNED_BAD && g_entities[i].health > 0 && !(g_entities[i].s.eFlags & EF_DEAD))
ADDRLP4 20
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $993
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $993
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $993
ADDRLP4 32
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LEI4 $993
ADDRLP4 32
INDIRI4
ADDRGP4 g_entities+8
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
BANDI4
ADDRLP4 36
INDIRI4
NEI4 $993
line 2389
;2389:				{
line 2393
;2390:					vec3_t checkLen;
;2391:					float fCheckLen;
;2392:
;2393:					VectorSubtract(self->r.currentOrigin, g_entities[i].r.currentOrigin, checkLen);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 40
ADDRLP4 56
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 60
INDIRI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40+4
ADDRLP4 56
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 60
INDIRI4
ADDRGP4 g_entities+296+72+4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2395
;2394:
;2395:					fCheckLen = VectorLength(checkLen);
ADDRLP4 40
ARGP4
ADDRLP4 64
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 64
INDIRF4
ASGNF4
line 2397
;2396:
;2397:					if (!minDistSet || fCheckLen < (minDist - 128))
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1011
ADDRLP4 52
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1124073472
SUBF4
GEF4 $1009
LABELV $1011
line 2398
;2398:					{
line 2400
;2399:						vec3_t enAngles;
;2400:						VectorSubtract(g_entities[i].r.currentOrigin, self->r.currentOrigin, enAngles);
ADDRLP4 80
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 80
INDIRI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 80
INDIRI4
ADDRGP4 g_entities+296+72+4
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68+8
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2401
;2401:						vectoangles(enAngles, enAngles);
ADDRLP4 68
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2402
;2402:						if ((InFieldOfVision(self->s.apos.trBase, 120, enAngles) || self->s.genericenemyindex > level.time) && ExampleAnimEntClearLOS(self, g_entities[i].r.currentOrigin))
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
CNSTF4 1123024896
ARGF4
ADDRLP4 68
ARGP4
ADDRLP4 88
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $1027
ADDRFP4 0
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $1022
LABELV $1027
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 ExampleAnimEntClearLOS
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $1022
line 2403
;2403:						{
line 2404
;2404:							minDistSet = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2405
;2405:							minDist = fCheckLen;
ADDRLP4 8
ADDRLP4 52
INDIRF4
ASGNF4
line 2406
;2406:							bestIndex = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 2407
;2407:						}
LABELV $1022
line 2408
;2408:					}
LABELV $1009
line 2409
;2409:				}
LABELV $993
line 2410
;2410:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2411
;2411:			}
LABELV $991
line 2386
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $990
line 2412
;2412:		}
LABELV $988
line 2413
;2413:	}
LABELV $915
line 2415
;2414:
;2415:	if (bestIndex != -1)
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $1028
line 2416
;2416:	{
line 2417
;2417:		self->bolt_Motion = bestIndex;
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2418
;2418:		self->speed = level.time + 4000; //4 seconds til we forget about the enemy
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 2419
;2419:		ExampleAnimEntAlertOthers(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ExampleAnimEntAlertOthers
CALLV
pop
line 2420
;2420:		self->bolt_RArm = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 500, 1000, g_defrag.integer, 750);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 500
ARGI4
CNSTI4 1000
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 750
ARGI4
ADDRLP4 20
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 836
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 2422
;2421:
;2422:		if (self->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1033
line 2423
;2423:		{
line 2424
;2424:			G_Sound(self, CHAN_AUTO, gTrooperSound_Alert[Q_irand(0, TROOPER_ALERT_SOUNDS-1 + gRandomUnlockAdd, qfalse, (TROOPER_ALERT_SOUNDS - 1) / 2)]);
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gTrooperSound_Alert
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2425
;2425:		}
ADDRGP4 $1034
JUMPV
LABELV $1033
line 2426
;2426:		else if (self->watertype == ANIMENT_TYPE_RODIAN)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1035
line 2427
;2427:		{
line 2428
;2428:			G_Sound(self, CHAN_AUTO, gRodianSound_Alert[Q_irand(0, RODIAN_ALERT_SOUNDS-1 + gRandomUnlockAdd, qfalse, (RODIAN_ALERT_SOUNDS - 1) / 2)]);
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gRodianSound_Alert
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2429
;2429:		}
ADDRGP4 $1036
JUMPV
LABELV $1035
line 2430
;2430:		else if (self->watertype == ANIMENT_TYPE_JAN)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1037
line 2431
;2431:		{
line 2432
;2432:			G_Sound(self, CHAN_AUTO, gJanSound_Alert[Q_irand(0, JAN_ALERT_SOUNDS-1 + gRandomUnlockAdd, qfalse,(JAN_ALERT_SOUNDS - 1)/2)]);
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gJanSound_Alert
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2433
;2433:		}
ADDRGP4 $1038
JUMPV
LABELV $1037
line 2434
;2434:		else if (self->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1039
line 2435
;2435:		{
line 2436
;2436:			ExampleAnimEntCustomSound(self, ANIMENT_CUSTOMSOUND_ALERT);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 ExampleAnimEntCustomSound
CALLV
pop
line 2437
;2437:		}
LABELV $1039
LABELV $1038
LABELV $1036
LABELV $1034
line 2438
;2438:	}
LABELV $1028
line 2439
;2439:}
LABELV $911
endproc ExampleAnimEntEnemyHandling 96 20
export ExampleAnimEntUpdateSelf
proc ExampleAnimEntUpdateSelf 180 20
line 2442
;2440:
;2441:void ExampleAnimEntUpdateSelf(gentity_t *self)
;2442:{
line 2445
;2443:	vec3_t preserveAngles;
;2444:
;2445:	if (gBotEdit || !gWPNum)
ADDRGP4 gBotEdit
INDIRF4
CNSTF4 0
NEF4 $1044
ADDRGP4 gWPNum
INDIRI4
CNSTI4 0
NEI4 $1042
LABELV $1044
line 2446
;2446:	{
line 2447
;2447:		if (!(self->s.eFlags & EF_DEAD))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1045
line 2448
;2448:		{
line 2449
;2449:			if (self->bolt_LArm < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1046
line 2450
;2450:			{
line 2451
;2451:				self->s.torsoAnim = BOTH_ATTACK3;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 120
ASGNI4
line 2452
;2452:				self->s.legsAnim = BOTH_STAND3;
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 576
ASGNI4
line 2453
;2453:			}
line 2454
;2454:		}
ADDRGP4 $1046
JUMPV
LABELV $1045
line 2456
;2455:		else
;2456:		{
line 2457
;2457:			if (self->bolt_Head < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1050
line 2458
;2458:			{
line 2459
;2459:				self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2460
;2460:				self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2461
;2461:				return;
ADDRGP4 $1041
JUMPV
LABELV $1050
line 2463
;2462:			}
;2463:		}
LABELV $1046
line 2465
;2464:
;2465:		VectorCopy(self->s.apos.trBase, preserveAngles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 2466
;2466:		G_RunObject(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 2467
;2467:		VectorCopy(preserveAngles, self->s.apos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 2468
;2468:		return;
ADDRGP4 $1041
JUMPV
LABELV $1042
line 2471
;2469:	}
;2470:
;2471:	if (!(self->s.eFlags & EF_DEAD))
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1054
line 2472
;2472:	{
line 2473
;2473:		if (self->bolt_LArm < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1055
line 2474
;2474:		{
line 2476
;2475:			vec3_t goalPos;
;2476:			int didMove = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2477
;2477:			float enDist = 0; // We shouldn't need to initialize this, because we're using enDistSet, but gcc doesn't trust it...
ADDRLP4 16
CNSTF4 0
ASGNF4
line 2478
;2478:			qboolean enDistSet = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 2479
;2479:			float runSpeed = 18;
ADDRLP4 28
CNSTF4 1099956224
ASGNF4
line 2481
;2480:			vec3_t enemyOrigin;
;2481:			qboolean hasEnemyLOS = qfalse;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 2482
;2482:			int originalEnemyIndex = self->bolt_Motion;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
line 2484
;2483:
;2484:			if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 1023
EQI4 $1059
ADDRLP4 64
CNSTI4 2352
ADDRLP4 60
INDIRI4
MULI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1059
ADDRLP4 64
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1059
line 2487
;2485:				g_entities[self->bolt_Motion].inuse &&
;2486:				g_entities[self->bolt_Motion].client)
;2487:			{
line 2488
;2488:				if (g_entities[self->bolt_Motion].client->sess.sessionTeam == TEAM_SPECTATOR)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1063
line 2489
;2489:				{
line 2490
;2490:					self->bolt_Motion = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
CNSTI4 1023
ASGNI4
line 2491
;2491:				}
LABELV $1063
line 2492
;2492:			}
LABELV $1059
line 2494
;2493:
;2494:			if (self->bolt_Motion < MAX_CLIENTS &&
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 32
GEI4 $1066
ADDRLP4 72
CNSTI4 2352
ADDRLP4 68
INDIRI4
MULI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1070
ADDRLP4 72
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1066
LABELV $1070
line 2497
;2495:				(!g_entities[self->bolt_Motion].inuse ||
;2496:				!g_entities[self->bolt_Motion].client))
;2497:			{
line 2498
;2498:				self->bolt_Motion = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
CNSTI4 1023
ASGNI4
line 2499
;2499:			}
LABELV $1066
line 2501
;2500:
;2501:			if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 1023
EQI4 $1071
ADDRLP4 80
CNSTI4 2352
ADDRLP4 76
INDIRI4
MULI4
ASGNI4
ADDRLP4 80
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1071
ADDRLP4 80
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1076
ADDRLP4 80
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1071
LABELV $1076
line 2504
;2502:				g_entities[self->bolt_Motion].inuse &&
;2503:				(g_entities[self->bolt_Motion].client || g_entities[self->bolt_Motion].s.eType == ET_GRAPPLE))
;2504:			{
line 2505
;2505:				if (g_entities[self->bolt_Motion].health < 1 ||
ADDRLP4 84
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 88
CNSTI4 1
ASGNI4
ADDRLP4 84
INDIRI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
LTI4 $1081
ADDRLP4 84
INDIRI4
ADDRGP4 g_entities+8
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
BANDI4
CNSTI4 0
EQI4 $1077
LABELV $1081
line 2507
;2506:					(g_entities[self->bolt_Motion].s.eFlags & EF_DEAD))
;2507:				{
line 2508
;2508:					self->bolt_Motion = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
CNSTI4 1023
ASGNI4
line 2509
;2509:				}
LABELV $1077
line 2510
;2510:			}
LABELV $1071
line 2512
;2511:
;2512:			if (gWPNum > 0)
ADDRGP4 gWPNum
INDIRI4
CNSTI4 0
LEI4 $1082
line 2513
;2513:			{
line 2514
;2514:				if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 1023
EQI4 $1084
ADDRLP4 88
CNSTI4 2352
ADDRLP4 84
INDIRI4
MULI4
ASGNI4
ADDRLP4 88
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1084
ADDRLP4 88
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1084
line 2517
;2515:					g_entities[self->bolt_Motion].inuse &&
;2516:					g_entities[self->bolt_Motion].client)
;2517:				{
line 2519
;2518:					vec3_t enSubVec;
;2519:					VectorSubtract(self->r.currentOrigin, g_entities[self->bolt_Motion].client->ps.origin, enSubVec);
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
CNSTI4 2352
ASGNI4
ADDRLP4 112
ADDRLP4 104
INDIRP4
CNSTI4 852
ADDP4
ASGNP4
ADDRLP4 92
ADDRLP4 104
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 108
INDIRI4
ADDRLP4 112
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 92+4
ADDRLP4 104
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 108
INDIRI4
ADDRLP4 112
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92+8
ADDRLP4 116
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
CNSTI4 2352
ADDRLP4 116
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2521
;2520:	
;2521:					enDist = VectorLength(enSubVec);
ADDRLP4 92
ARGP4
ADDRLP4 120
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 120
INDIRF4
ASGNF4
line 2522
;2522:					enDistSet = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 2524
;2523:
;2524:					VectorCopy(g_entities[self->bolt_Motion].client->ps.origin, enemyOrigin);
ADDRLP4 48
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2526
;2525:
;2526:					if (g_entities[self->bolt_Motion].client->pers.cmd.upmove < 0)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $1094
line 2527
;2527:					{
line 2528
;2528:						enemyOrigin[2] -= 8;
ADDRLP4 48+8
ADDRLP4 48+8
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 2529
;2529:					}
ADDRGP4 $1095
JUMPV
LABELV $1094
line 2531
;2530:					else
;2531:					{
line 2532
;2532:						enemyOrigin[2] += 8;
ADDRLP4 48+8
ADDRLP4 48+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 2533
;2533:					}
LABELV $1095
line 2535
;2534:
;2535:					hasEnemyLOS = ExampleAnimEntClearLOS(self, enemyOrigin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 124
ADDRGP4 ExampleAnimEntClearLOS
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 124
INDIRI4
ASGNI4
line 2536
;2536:				}
ADDRGP4 $1085
JUMPV
LABELV $1084
line 2537
;2537:				else if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 1023
EQI4 $1099
ADDRLP4 96
CNSTI4 2352
ADDRLP4 92
INDIRI4
MULI4
ASGNI4
ADDRLP4 96
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1099
ADDRLP4 96
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1099
line 2540
;2538:					g_entities[self->bolt_Motion].inuse &&
;2539:					g_entities[self->bolt_Motion].s.eType == ET_GRAPPLE)
;2540:				{
line 2542
;2541:					vec3_t enSubVec;
;2542:					VectorSubtract(self->r.currentOrigin, g_entities[self->bolt_Motion].r.currentOrigin, enSubVec);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
CNSTI4 2352
ASGNI4
ADDRLP4 120
ADDRLP4 112
INDIRP4
CNSTI4 852
ADDP4
ASGNP4
ADDRLP4 100
ADDRLP4 112
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 116
INDIRI4
ADDRLP4 120
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 100+4
ADDRLP4 112
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 116
INDIRI4
ADDRLP4 120
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100+8
ADDRLP4 124
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
CNSTI4 2352
ADDRLP4 124
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2544
;2543:	
;2544:					enDist = VectorLength(enSubVec);
ADDRLP4 100
ARGP4
ADDRLP4 128
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 128
INDIRF4
ASGNF4
line 2545
;2545:					enDistSet = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 2547
;2546:
;2547:					VectorCopy(g_entities[self->bolt_Motion].r.currentOrigin, enemyOrigin);
ADDRLP4 48
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRB
ASGNB 12
line 2549
;2548:
;2549:					hasEnemyLOS = ExampleAnimEntClearLOS(self, enemyOrigin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 132
ADDRGP4 ExampleAnimEntClearLOS
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 132
INDIRI4
ASGNI4
line 2550
;2550:				}
LABELV $1099
LABELV $1085
line 2552
;2551:
;2552:				if (hasEnemyLOS && (enDistSet && enDist < 512) && self->splashRadius < level.time)
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $1115
ADDRLP4 20
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $1115
ADDRLP4 16
INDIRF4
CNSTF4 1140850688
GEF4 $1115
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1115
line 2553
;2553:				{
line 2554
;2554:					if (rand()%10 <= 8)
ADDRLP4 104
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 10
MODI4
CNSTI4 8
GTI4 $1118
line 2555
;2555:					{
line 2556
;2556:						if (self->splashMethodOfDeath)
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1120
line 2557
;2557:						{
line 2558
;2558:							self->splashMethodOfDeath = 0;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 0
ASGNI4
line 2559
;2559:						}
ADDRGP4 $1121
JUMPV
LABELV $1120
line 2561
;2560:						else
;2561:						{
line 2562
;2562:							self->splashMethodOfDeath = 1;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 1
ASGNI4
line 2563
;2563:						}
LABELV $1121
line 2564
;2564:					}
LABELV $1118
line 2566
;2565:
;2566:					if (self->watertype == ANIMENT_TYPE_RODIAN)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1122
line 2567
;2567:					{ //these guys stand still more often because they are "snipers"
line 2568
;2568:						if (rand()%10 <= 7)
ADDRLP4 108
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 10
MODI4
CNSTI4 7
GTI4 $1124
line 2569
;2569:						{
line 2570
;2570:							self->splashMethodOfDeath = 1;
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 1
ASGNI4
line 2571
;2571:						}
LABELV $1124
line 2572
;2572:					}
LABELV $1122
line 2574
;2573:
;2574:					self->splashRadius = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 2000, 5000, g_defrag.integer, 3500);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 2000
ARGI4
CNSTI4 5000
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 3500
ARGI4
ADDRLP4 108
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 108
INDIRI4
ADDI4
ASGNI4
line 2575
;2575:				}
LABELV $1115
line 2577
;2576:
;2577:				if (hasEnemyLOS && ((enDistSet && enDist < 512) || self->watertype == ANIMENT_TYPE_RODIAN) && self->splashMethodOfDeath)
ADDRLP4 104
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $1128
ADDRLP4 20
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $1131
ADDRLP4 16
INDIRF4
CNSTF4 1140850688
LTF4 $1130
LABELV $1131
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1128
LABELV $1130
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1128
line 2578
;2578:				{
line 2579
;2579:					VectorCopy(self->r.currentOrigin, goalPos);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2580
;2580:				}
ADDRGP4 $1083
JUMPV
LABELV $1128
line 2582
;2581:				else
;2582:				{
line 2583
;2583:					ExampleAnimEntNavigation(self, goalPos);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 ExampleAnimEntNavigation
CALLV
pop
line 2584
;2584:				}
line 2585
;2585:			}
ADDRGP4 $1083
JUMPV
LABELV $1082
line 2587
;2586:			else
;2587:			{ //No path data? Eh. Just run toward the origin mindlessly.
line 2588
;2588:				VectorClear(goalPos);
ADDRLP4 84
CNSTF4 0
ASGNF4
ADDRLP4 36+8
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 36
ADDRLP4 84
INDIRF4
ASGNF4
line 2589
;2589:			}
LABELV $1083
line 2591
;2590:
;2591:			if (self->bolt_Motion == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1134
line 2592
;2592:			{
line 2593
;2593:				if (ExampleAnimEntAlignment(self) == ANIMENT_ALIGNED_GOOD)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 2
NEI4 $1136
line 2594
;2594:				{
line 2595
;2595:					runSpeed = 18;
ADDRLP4 28
CNSTF4 1099956224
ASGNF4
line 2596
;2596:				}
ADDRGP4 $1137
JUMPV
LABELV $1136
line 2598
;2597:				else
;2598:				{
line 2599
;2599:					runSpeed = 6;
ADDRLP4 28
CNSTF4 1086324736
ASGNF4
line 2600
;2600:				}
LABELV $1137
line 2601
;2601:			}
LABELV $1134
line 2603
;2602:
;2603:			didMove = ExampleAnimEntMove(self, goalPos, runSpeed);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 84
ADDRGP4 ExampleAnimEntMove
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 84
INDIRI4
ASGNI4
line 2605
;2604:
;2605:			if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 1023
EQI4 $1138
ADDRLP4 92
CNSTI4 2352
ADDRLP4 88
INDIRI4
MULI4
ASGNI4
ADDRLP4 92
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1138
ADDRLP4 92
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1138
line 2608
;2606:				g_entities[self->bolt_Motion].inuse &&
;2607:				g_entities[self->bolt_Motion].client)
;2608:			{
line 2609
;2609:				if (self->speed < level.time || g_entities[self->bolt_Motion].health < 1)
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LTF4 $1146
CNSTI4 2352
ADDRLP4 96
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1142
LABELV $1146
line 2610
;2610:				{
line 2611
;2611:					self->bolt_Motion = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
CNSTI4 1023
ASGNI4
line 2612
;2612:				}
ADDRGP4 $1139
JUMPV
LABELV $1142
line 2614
;2613:				else
;2614:				{
line 2615
;2615:					if (self->bolt_Motion != originalEnemyIndex)
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1139
line 2616
;2616:					{
line 2618
;2617:						vec3_t enSubVec;
;2618:						VectorSubtract(self->r.currentOrigin, g_entities[self->bolt_Motion].client->ps.origin, enSubVec);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
CNSTI4 2352
ASGNI4
ADDRLP4 120
ADDRLP4 112
INDIRP4
CNSTI4 852
ADDP4
ASGNP4
ADDRLP4 100
ADDRLP4 112
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 116
INDIRI4
ADDRLP4 120
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 100+4
ADDRLP4 112
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 116
INDIRI4
ADDRLP4 120
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100+8
ADDRLP4 124
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
CNSTI4 2352
ADDRLP4 124
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2620
;2619:	
;2620:						enDist = VectorLength(enSubVec);
ADDRLP4 100
ARGP4
ADDRLP4 128
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 128
INDIRF4
ASGNF4
line 2621
;2621:						enDistSet = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 2622
;2622:					}
line 2623
;2623:				}
line 2624
;2624:			}
ADDRGP4 $1139
JUMPV
LABELV $1138
line 2625
;2625:			else if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 1023
EQI4 $1154
ADDRLP4 100
CNSTI4 2352
ADDRLP4 96
INDIRI4
MULI4
ASGNI4
ADDRLP4 100
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1154
ADDRLP4 100
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1154
line 2628
;2626:				g_entities[self->bolt_Motion].inuse &&
;2627:				g_entities[self->bolt_Motion].s.eType == ET_GRAPPLE)
;2628:			{
line 2629
;2629:				if (self->speed < level.time || g_entities[self->bolt_Motion].health < 1)
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
LTF4 $1162
CNSTI4 2352
ADDRLP4 104
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1158
LABELV $1162
line 2630
;2630:				{
line 2631
;2631:					self->bolt_Motion = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
CNSTI4 1023
ASGNI4
line 2632
;2632:				}
ADDRGP4 $1159
JUMPV
LABELV $1158
line 2634
;2633:				else
;2634:				{
line 2635
;2635:					if (self->bolt_Motion != originalEnemyIndex)
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1163
line 2636
;2636:					{
line 2638
;2637:						vec3_t enSubVec;
;2638:						VectorSubtract(self->r.currentOrigin, g_entities[self->bolt_Motion].r.currentOrigin, enSubVec);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
CNSTI4 2352
ASGNI4
ADDRLP4 128
ADDRLP4 120
INDIRP4
CNSTI4 852
ADDP4
ASGNP4
ADDRLP4 108
ADDRLP4 120
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 124
INDIRI4
ADDRLP4 128
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 108+4
ADDRLP4 120
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 124
INDIRI4
ADDRLP4 128
INDIRP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108+8
ADDRLP4 132
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
CNSTI4 2352
ADDRLP4 132
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72+8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2640
;2639:	
;2640:						enDist = VectorLength(enSubVec);
ADDRLP4 108
ARGP4
ADDRLP4 136
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 136
INDIRF4
ASGNF4
line 2641
;2641:						enDistSet = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 2642
;2642:					}
LABELV $1163
line 2643
;2643:				}
LABELV $1159
line 2644
;2644:			}
LABELV $1154
LABELV $1139
line 2646
;2645:
;2646:			ExampleAnimEntEnemyHandling(self, enDist, enDistSet);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 ExampleAnimEntEnemyHandling
CALLV
pop
line 2648
;2647:
;2648:			if (self->bolt_Motion != ENTITYNUM_NONE &&
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 1023
EQI4 $1175
ADDRLP4 108
CNSTI4 2352
ADDRLP4 104
INDIRI4
MULI4
ASGNI4
ADDRLP4 108
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1175
ADDRLP4 108
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1180
ADDRLP4 108
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1175
LABELV $1180
line 2651
;2649:				g_entities[self->bolt_Motion].inuse &&
;2650:				(g_entities[self->bolt_Motion].client || g_entities[self->bolt_Motion].s.eType == ET_GRAPPLE))
;2651:			{
line 2654
;2652:				vec3_t enOrigin;
;2653:
;2654:				if (g_entities[self->bolt_Motion].client)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1181
line 2655
;2655:				{
line 2656
;2656:					VectorCopy(g_entities[self->bolt_Motion].client->ps.origin, enOrigin);
ADDRLP4 112
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2657
;2657:				}
ADDRGP4 $1182
JUMPV
LABELV $1181
line 2659
;2658:				else
;2659:				{
line 2660
;2660:					VectorCopy(g_entities[self->bolt_Motion].r.currentOrigin, enOrigin);
ADDRLP4 112
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRB
ASGNB 12
line 2661
;2661:				}
LABELV $1182
line 2663
;2662:
;2663:				if (originalEnemyIndex != self->bolt_Motion)
ADDRLP4 32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
EQI4 $1187
line 2664
;2664:				{
line 2665
;2665:					VectorCopy(enOrigin, enemyOrigin);
ADDRLP4 48
ADDRLP4 112
INDIRB
ASGNB 12
line 2667
;2666:
;2667:					if (g_entities[self->bolt_Motion].client)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1189
line 2668
;2668:					{
line 2669
;2669:						if (g_entities[self->bolt_Motion].client->pers.cmd.upmove < 0)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $1192
line 2670
;2670:						{
line 2671
;2671:							enemyOrigin[2] -= 8;
ADDRLP4 48+8
ADDRLP4 48+8
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 2672
;2672:						}
ADDRGP4 $1193
JUMPV
LABELV $1192
line 2674
;2673:						else
;2674:						{
line 2675
;2675:							enemyOrigin[2] += 8;
ADDRLP4 48+8
ADDRLP4 48+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 2676
;2676:						}
LABELV $1193
line 2677
;2677:					}
LABELV $1189
line 2679
;2678:
;2679:					hasEnemyLOS = ExampleAnimEntClearLOS(self, enemyOrigin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 124
ADDRGP4 ExampleAnimEntClearLOS
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 124
INDIRI4
ASGNI4
line 2680
;2680:				}
LABELV $1187
line 2682
;2681:
;2682:				if (hasEnemyLOS)
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1197
line 2683
;2683:				{
line 2689
;2684:					vec3_t enAngles;
;2685:					vec3_t enAimOrg;
;2686:					vec3_t selfAimOrg;
;2687:					vec3_t myZeroPitchAngles;
;2688:
;2689:					VectorCopy(enOrigin, enAimOrg);
ADDRLP4 136
ADDRLP4 112
INDIRB
ASGNB 12
line 2690
;2690:					VectorCopy(self->r.currentOrigin, selfAimOrg);
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2691
;2691:					enAimOrg[2] = selfAimOrg[2];
ADDRLP4 136+8
ADDRLP4 148+8
INDIRF4
ASGNF4
line 2693
;2692:
;2693:					VectorSubtract(enAimOrg, selfAimOrg, enAngles);
ADDRLP4 124
ADDRLP4 136
INDIRF4
ADDRLP4 148
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 136+4
INDIRF4
ADDRLP4 148+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 136+8
INDIRF4
ADDRLP4 148+8
INDIRF4
SUBF4
ASGNF4
line 2694
;2694:					vectoangles(enAngles, enAngles);
ADDRLP4 124
ARGP4
ADDRLP4 124
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2696
;2695:
;2696:					VectorCopy(self->s.apos.trBase, myZeroPitchAngles);
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 2697
;2697:					myZeroPitchAngles[PITCH] = 0;
ADDRLP4 160
CNSTF4 0
ASGNF4
line 2698
;2698:					if (InFieldOfVision(myZeroPitchAngles, 50, enAngles))
ADDRLP4 160
ARGP4
CNSTF4 1112014848
ARGF4
ADDRLP4 124
ARGP4
ADDRLP4 172
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $1207
line 2699
;2699:					{
line 2700
;2700:						self->boltpoint4 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 1
ASGNI4
line 2701
;2701:					}
LABELV $1207
line 2702
;2702:					self->speed = level.time + 4000; //4 seconds til we forget about the enemy
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 2703
;2703:				}
ADDRGP4 $1198
JUMPV
LABELV $1197
line 2705
;2704:				else
;2705:				{
line 2706
;2706:					self->boltpoint4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 0
ASGNI4
line 2707
;2707:				}
LABELV $1198
line 2708
;2708:				ExampleAnimEntLook(self, enemyOrigin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 ExampleAnimEntLook
CALLV
pop
line 2709
;2709:			}
ADDRGP4 $1176
JUMPV
LABELV $1175
line 2711
;2710:			else
;2711:			{
line 2712
;2712:				self->boltpoint4 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
CNSTI4 0
ASGNI4
line 2713
;2713:				ExampleAnimEntLook(self, goalPos);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 ExampleAnimEntLook
CALLV
pop
line 2714
;2714:			}
LABELV $1176
line 2716
;2715:
;2716:			if (!didMove)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1210
line 2717
;2717:			{ //not just didMove 2, this means we're actually probably stuck
line 2721
;2718:				vec3_t aFwd, aRight;
;2719:				vec3_t newGoalPos;
;2720:
;2721:				AngleVectors(self->s.apos.trBase, aFwd, aRight, 0);
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ARGP4
ADDRLP4 124
ARGP4
ADDRLP4 136
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2722
;2722:				newGoalPos[0] = self->r.currentOrigin[0] + aRight[0]*64 - aFwd[0]*64;
ADDRLP4 148
CNSTF4 1115684864
ASGNF4
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 148
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
ADDF4
ADDRLP4 148
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
SUBF4
ASGNF4
line 2723
;2723:				newGoalPos[1] = self->r.currentOrigin[1] + aRight[1]*64 - aFwd[1]*64;
ADDRLP4 152
CNSTF4 1115684864
ASGNF4
ADDRLP4 112+4
ADDRFP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 152
INDIRF4
ADDRLP4 136+4
INDIRF4
MULF4
ADDF4
ADDRLP4 152
INDIRF4
ADDRLP4 124+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2724
;2724:				newGoalPos[2] = self->r.currentOrigin[2] + aRight[2]*64 - aFwd[2]*64;
ADDRLP4 156
CNSTF4 1115684864
ASGNF4
ADDRLP4 112+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 156
INDIRF4
ADDRLP4 136+8
INDIRF4
MULF4
ADDF4
ADDRLP4 156
INDIRF4
ADDRLP4 124+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 2727
;2725:
;2726:				//Try moving to the right of the direction we're looking, to get around stuff
;2727:				didMove = ExampleAnimEntMove(self, newGoalPos, 18);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ARGP4
CNSTF4 1099956224
ARGF4
ADDRLP4 160
ADDRGP4 ExampleAnimEntMove
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 160
INDIRI4
ASGNI4
line 2729
;2728:
;2729:				if (!didMove)
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $1218
line 2730
;2730:				{ //still? Try to the left.
line 2731
;2731:					newGoalPos[0] = self->r.currentOrigin[0] - aRight[0]*64 - aFwd[0]*64;
ADDRLP4 164
CNSTF4 1115684864
ASGNF4
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 164
INDIRF4
ADDRLP4 136
INDIRF4
MULF4
SUBF4
ADDRLP4 164
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
SUBF4
ASGNF4
line 2732
;2732:					newGoalPos[1] = self->r.currentOrigin[1] - aRight[1]*64 - aFwd[1]*64;
ADDRLP4 168
CNSTF4 1115684864
ASGNF4
ADDRLP4 112+4
ADDRFP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 168
INDIRF4
ADDRLP4 136+4
INDIRF4
MULF4
SUBF4
ADDRLP4 168
INDIRF4
ADDRLP4 124+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 2733
;2733:					newGoalPos[2] = self->r.currentOrigin[2] - aRight[2]*64 - aFwd[2]*64;
ADDRLP4 172
CNSTF4 1115684864
ASGNF4
ADDRLP4 112+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 172
INDIRF4
ADDRLP4 136+8
INDIRF4
MULF4
SUBF4
ADDRLP4 172
INDIRF4
ADDRLP4 124+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 2735
;2734:
;2735:					didMove = ExampleAnimEntMove(self, newGoalPos, 18);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ARGP4
CNSTF4 1099956224
ARGF4
ADDRLP4 176
ADDRGP4 ExampleAnimEntMove
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 176
INDIRI4
ASGNI4
line 2736
;2736:				}
LABELV $1218
line 2737
;2737:			}
LABELV $1210
line 2739
;2738:
;2739:			if (didMove == 1)
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $1226
line 2740
;2740:			{
line 2741
;2741:				if (self->bolt_Motion == ENTITYNUM_NONE && ExampleAnimEntAlignment(self) != ANIMENT_ALIGNED_GOOD)
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1228
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 ExampleAnimEntAlignment
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 2
EQI4 $1228
line 2742
;2742:				{ //Good guys are always on "alert"
line 2743
;2743:					self->s.torsoAnim = BOTH_WALK1;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 822
ASGNI4
line 2744
;2744:					self->s.legsAnim = BOTH_WALK1;
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 822
ASGNI4
line 2745
;2745:				}
ADDRGP4 $1227
JUMPV
LABELV $1228
line 2747
;2746:				else
;2747:				{
line 2748
;2748:					self->s.torsoAnim = BOTH_ATTACK3;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 120
ASGNI4
line 2749
;2749:					self->s.legsAnim = BOTH_RUN2;
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 836
ASGNI4
line 2750
;2750:				}
line 2751
;2751:			}
ADDRGP4 $1227
JUMPV
LABELV $1226
line 2753
;2752:			else
;2753:			{
line 2754
;2754:				self->s.torsoAnim = BOTH_ATTACK3;
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 120
ASGNI4
line 2755
;2755:				self->s.legsAnim = BOTH_STAND3;
ADDRFP4 0
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 576
ASGNI4
line 2756
;2756:			}
LABELV $1227
line 2758
;2757:
;2758:			ExampleAnimEntWeaponHandling(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ExampleAnimEntWeaponHandling
CALLV
pop
line 2759
;2759:		}
line 2760
;2760:	}
ADDRGP4 $1055
JUMPV
LABELV $1054
line 2762
;2761:	else
;2762:	{
line 2763
;2763:		if (self->bolt_Head < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1230
line 2764
;2764:		{
line 2765
;2765:			self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 2766
;2766:			self->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2767
;2767:			return;
ADDRGP4 $1041
JUMPV
LABELV $1230
line 2769
;2768:		}
;2769:	}
LABELV $1055
line 2771
;2770:
;2771:	VectorCopy(self->s.apos.trBase, preserveAngles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 2772
;2772:	G_RunObject(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 2773
;2773:	VectorCopy(preserveAngles, self->s.apos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 2774
;2774:}
LABELV $1041
endproc ExampleAnimEntUpdateSelf 180 20
export G_SpawnExampleAnimEnt
proc G_SpawnExampleAnimEnt 84 20
line 2777
;2775:
;2776:void G_SpawnExampleAnimEnt(vec3_t pos, int aeType, animentCustomInfo_t *aeInfo)
;2777:{
line 2782
;2778:	gentity_t *animEnt;
;2779:	vec3_t playerMins;
;2780:	vec3_t playerMaxs;
;2781:
;2782:	VectorSet(playerMins, -15, -15, DEFAULT_MINS_2);
ADDRLP4 28
CNSTF4 3245342720
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 4+8
CNSTF4 3250585600
ASGNF4
line 2783
;2783:	VectorSet(playerMaxs, 15, 15, DEFAULT_MAXS_2);
ADDRLP4 32
CNSTF4 1097859072
ASGNF4
ADDRLP4 16
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 16+8
CNSTF4 1109393408
ASGNF4
line 2785
;2784:
;2785:	if (aeType == ANIMENT_TYPE_STORMTROOPER)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1239
line 2786
;2786:	{
line 2787
;2787:		if (!gTrooperSound_Pain[0])
ADDRGP4 gTrooperSound_Pain
INDIRI4
CNSTI4 0
NEI4 $1240
line 2788
;2788:		{
line 2789
;2789:			gTrooperSound_Pain[0] = G_SoundIndex("sound/chars/st1/misc/pain25");
ADDRGP4 $1243
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain
ADDRLP4 36
INDIRI4
ASGNI4
line 2790
;2790:			gTrooperSound_Pain[1] = G_SoundIndex("sound/chars/st1/misc/pain50");
ADDRGP4 $1245
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain+4
ADDRLP4 40
INDIRI4
ASGNI4
line 2791
;2791:			gTrooperSound_Pain[2] = G_SoundIndex("sound/chars/st1/misc/pain75");
ADDRGP4 $1247
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain+8
ADDRLP4 44
INDIRI4
ASGNI4
line 2792
;2792:			gTrooperSound_Pain[3] = G_SoundIndex("sound/chars/st1/misc/pain100");
ADDRGP4 $1249
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain+12
ADDRLP4 48
INDIRI4
ASGNI4
line 2794
;2793:
;2794:			gTrooperSound_Death[0] = G_SoundIndex("sound/chars/st1/misc/death1");
ADDRGP4 $1250
ARGP4
ADDRLP4 52
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Death
ADDRLP4 52
INDIRI4
ASGNI4
line 2795
;2795:			gTrooperSound_Death[1] = G_SoundIndex("sound/chars/st1/misc/death2");
ADDRGP4 $1252
ARGP4
ADDRLP4 56
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Death+4
ADDRLP4 56
INDIRI4
ASGNI4
line 2796
;2796:			gTrooperSound_Death[2] = G_SoundIndex("sound/chars/st1/misc/death3");
ADDRGP4 $1254
ARGP4
ADDRLP4 60
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Death+8
ADDRLP4 60
INDIRI4
ASGNI4
line 2798
;2797:
;2798:			gTrooperSound_Alert[0] = G_SoundIndex("sound/chars/st1/misc/detected1");
ADDRGP4 $1255
ARGP4
ADDRLP4 64
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert
ADDRLP4 64
INDIRI4
ASGNI4
line 2799
;2799:			gTrooperSound_Alert[1] = G_SoundIndex("sound/chars/st1/misc/detected2");
ADDRGP4 $1257
ARGP4
ADDRLP4 68
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+4
ADDRLP4 68
INDIRI4
ASGNI4
line 2800
;2800:			gTrooperSound_Alert[2] = G_SoundIndex("sound/chars/st1/misc/detected3");
ADDRGP4 $1259
ARGP4
ADDRLP4 72
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+8
ADDRLP4 72
INDIRI4
ASGNI4
line 2801
;2801:			gTrooperSound_Alert[3] = G_SoundIndex("sound/chars/st1/misc/detected4");
ADDRGP4 $1261
ARGP4
ADDRLP4 76
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+12
ADDRLP4 76
INDIRI4
ASGNI4
line 2802
;2802:			gTrooperSound_Alert[4] = G_SoundIndex("sound/chars/st1/misc/detected5");
ADDRGP4 $1263
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+16
ADDRLP4 80
INDIRI4
ASGNI4
line 2803
;2803:		}
line 2804
;2804:	}
ADDRGP4 $1240
JUMPV
LABELV $1239
line 2805
;2805:	else if (aeType == ANIMENT_TYPE_RODIAN)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $1264
line 2806
;2806:	{
line 2807
;2807:		if (!gRodianSound_Pain[0])
ADDRGP4 gRodianSound_Pain
INDIRI4
CNSTI4 0
NEI4 $1265
line 2808
;2808:		{
line 2809
;2809:			gRodianSound_Pain[0] = G_SoundIndex("sound/chars/rodian1/misc/pain25");
ADDRGP4 $1268
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain
ADDRLP4 36
INDIRI4
ASGNI4
line 2810
;2810:			gRodianSound_Pain[1] = G_SoundIndex("sound/chars/rodian1/misc/pain50");
ADDRGP4 $1270
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain+4
ADDRLP4 40
INDIRI4
ASGNI4
line 2811
;2811:			gRodianSound_Pain[2] = G_SoundIndex("sound/chars/rodian1/misc/pain75");
ADDRGP4 $1272
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain+8
ADDRLP4 44
INDIRI4
ASGNI4
line 2812
;2812:			gRodianSound_Pain[3] = G_SoundIndex("sound/chars/rodian1/misc/pain100");
ADDRGP4 $1274
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain+12
ADDRLP4 48
INDIRI4
ASGNI4
line 2814
;2813:
;2814:			gRodianSound_Death[0] = G_SoundIndex("sound/chars/rodian1/misc/death1");
ADDRGP4 $1275
ARGP4
ADDRLP4 52
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Death
ADDRLP4 52
INDIRI4
ASGNI4
line 2815
;2815:			gRodianSound_Death[1] = G_SoundIndex("sound/chars/rodian1/misc/death2");
ADDRGP4 $1277
ARGP4
ADDRLP4 56
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Death+4
ADDRLP4 56
INDIRI4
ASGNI4
line 2816
;2816:			gRodianSound_Death[2] = G_SoundIndex("sound/chars/rodian1/misc/death3");
ADDRGP4 $1279
ARGP4
ADDRLP4 60
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Death+8
ADDRLP4 60
INDIRI4
ASGNI4
line 2818
;2817:
;2818:			gRodianSound_Alert[0] = G_SoundIndex("sound/chars/rodian1/misc/detected1");
ADDRGP4 $1280
ARGP4
ADDRLP4 64
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert
ADDRLP4 64
INDIRI4
ASGNI4
line 2819
;2819:			gRodianSound_Alert[1] = G_SoundIndex("sound/chars/rodian1/misc/detected2");
ADDRGP4 $1282
ARGP4
ADDRLP4 68
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+4
ADDRLP4 68
INDIRI4
ASGNI4
line 2820
;2820:			gRodianSound_Alert[2] = G_SoundIndex("sound/chars/rodian1/misc/detected3");
ADDRGP4 $1284
ARGP4
ADDRLP4 72
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+8
ADDRLP4 72
INDIRI4
ASGNI4
line 2821
;2821:			gRodianSound_Alert[3] = G_SoundIndex("sound/chars/rodian1/misc/detected4");
ADDRGP4 $1286
ARGP4
ADDRLP4 76
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+12
ADDRLP4 76
INDIRI4
ASGNI4
line 2822
;2822:			gRodianSound_Alert[4] = G_SoundIndex("sound/chars/rodian1/misc/detected5");
ADDRGP4 $1288
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+16
ADDRLP4 80
INDIRI4
ASGNI4
line 2823
;2823:		}
line 2824
;2824:	}
ADDRGP4 $1265
JUMPV
LABELV $1264
line 2825
;2825:	else if (aeType == ANIMENT_TYPE_JAN)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $1289
line 2826
;2826:	{
line 2827
;2827:		if (!gJanSound_Pain[0])
ADDRGP4 gJanSound_Pain
INDIRI4
CNSTI4 0
NEI4 $1291
line 2828
;2828:		{
line 2829
;2829:			gJanSound_Pain[0] = G_SoundIndex("sound/chars/jan/misc/pain25");
ADDRGP4 $1293
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain
ADDRLP4 36
INDIRI4
ASGNI4
line 2830
;2830:			gJanSound_Pain[1] = G_SoundIndex("sound/chars/jan/misc/pain50");
ADDRGP4 $1295
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain+4
ADDRLP4 40
INDIRI4
ASGNI4
line 2831
;2831:			gJanSound_Pain[2] = G_SoundIndex("sound/chars/jan/misc/pain75");
ADDRGP4 $1297
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain+8
ADDRLP4 44
INDIRI4
ASGNI4
line 2832
;2832:			gJanSound_Pain[3] = G_SoundIndex("sound/chars/jan/misc/pain100");
ADDRGP4 $1299
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain+12
ADDRLP4 48
INDIRI4
ASGNI4
line 2834
;2833:
;2834:			gJanSound_Death[0] = G_SoundIndex("sound/chars/jan/misc/death1");
ADDRGP4 $1300
ARGP4
ADDRLP4 52
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Death
ADDRLP4 52
INDIRI4
ASGNI4
line 2835
;2835:			gJanSound_Death[1] = G_SoundIndex("sound/chars/jan/misc/death2");
ADDRGP4 $1302
ARGP4
ADDRLP4 56
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Death+4
ADDRLP4 56
INDIRI4
ASGNI4
line 2836
;2836:			gJanSound_Death[2] = G_SoundIndex("sound/chars/jan/misc/death3");
ADDRGP4 $1304
ARGP4
ADDRLP4 60
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Death+8
ADDRLP4 60
INDIRI4
ASGNI4
line 2838
;2837:
;2838:			gJanSound_Alert[0] = G_SoundIndex("sound/chars/jan/misc/detected1");
ADDRGP4 $1305
ARGP4
ADDRLP4 64
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert
ADDRLP4 64
INDIRI4
ASGNI4
line 2839
;2839:			gJanSound_Alert[1] = G_SoundIndex("sound/chars/jan/misc/detected2");
ADDRGP4 $1307
ARGP4
ADDRLP4 68
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+4
ADDRLP4 68
INDIRI4
ASGNI4
line 2840
;2840:			gJanSound_Alert[2] = G_SoundIndex("sound/chars/jan/misc/detected3");
ADDRGP4 $1309
ARGP4
ADDRLP4 72
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+8
ADDRLP4 72
INDIRI4
ASGNI4
line 2841
;2841:			gJanSound_Alert[3] = G_SoundIndex("sound/chars/jan/misc/detected4");
ADDRGP4 $1311
ARGP4
ADDRLP4 76
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+12
ADDRLP4 76
INDIRI4
ASGNI4
line 2842
;2842:			gJanSound_Alert[4] = G_SoundIndex("sound/chars/jan/misc/detected5");
ADDRGP4 $1313
ARGP4
ADDRLP4 80
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+16
ADDRLP4 80
INDIRI4
ASGNI4
line 2843
;2843:		}
LABELV $1291
line 2844
;2844:	}
LABELV $1289
LABELV $1265
LABELV $1240
line 2846
;2845:
;2846:	animEnt = G_Spawn();
ADDRLP4 36
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
ASGNP4
line 2848
;2847:
;2848:	animEnt->watertype = aeType; //set the animent type
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 2850
;2849:
;2850:	if (aeType == ANIMENT_TYPE_CUSTOM && aeInfo)
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $1314
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1314
line 2851
;2851:	{
line 2852
;2852:		ExampleAnimEntCustomDataEntry(animEnt, aeInfo->aeAlignment, aeInfo->aeWeapon, aeInfo->modelPath, aeInfo->soundPath);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CNSTI4 16
ADDP4
INDIRP4
ARGP4
ADDRGP4 ExampleAnimEntCustomDataEntry
CALLV
pop
line 2853
;2853:		AnimEntCustomSoundPrecache(aeInfo);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnimEntCustomSoundPrecache
CALLV
pop
line 2854
;2854:	}
LABELV $1314
line 2856
;2855:
;2856:	animEnt->s.eType = ET_GRAPPLE; //ET_GRAPPLE is the reserved special type for G2 anim ents.
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 13
ASGNI4
line 2858
;2857:
;2858:	if (animEnt->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1316
line 2859
;2859:	{
line 2860
;2860:		animEnt->s.modelindex = G_ModelIndex( "models/players/stormtrooper/model.glm" );
ADDRGP4 $1318
ARGP4
ADDRLP4 40
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2861
;2861:	}
ADDRGP4 $1317
JUMPV
LABELV $1316
line 2862
;2862:	else if (animEnt->watertype == ANIMENT_TYPE_RODIAN)
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1319
line 2863
;2863:	{
line 2864
;2864:		animEnt->s.modelindex = G_ModelIndex( "models/players/rodian/model.glm" );
ADDRGP4 $1321
ARGP4
ADDRLP4 40
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2865
;2865:	}
ADDRGP4 $1320
JUMPV
LABELV $1319
line 2866
;2866:	else if (animEnt->watertype == ANIMENT_TYPE_JAN)
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1322
line 2867
;2867:	{
line 2868
;2868:		animEnt->s.modelindex = G_ModelIndex( "models/players/jan/model.glm" );
ADDRGP4 $1324
ARGP4
ADDRLP4 40
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 2869
;2869:	}
ADDRGP4 $1323
JUMPV
LABELV $1322
line 2870
;2870:	else if (animEnt->watertype == ANIMENT_TYPE_CUSTOM)
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1325
line 2871
;2871:	{
line 2872
;2872:		animentCustomInfo_t *aeInfo = ExampleAnimEntCustomData(animEnt);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 ExampleAnimEntCustomData
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRP4
ASGNP4
line 2874
;2873:
;2874:		if (aeInfo)
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1327
line 2875
;2875:		{
line 2876
;2876:			animEnt->s.modelindex = G_ModelIndex(aeInfo->modelPath);
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 2877
;2877:		}
ADDRGP4 $1326
JUMPV
LABELV $1327
line 2879
;2878:		else
;2879:		{
line 2880
;2880:			animEnt->s.modelindex = G_ModelIndex( "models/players/stormtrooper/model.glm" );
ADDRGP4 $1318
ARGP4
ADDRLP4 48
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 2881
;2881:		}
line 2882
;2882:	}
ADDRGP4 $1326
JUMPV
LABELV $1325
line 2884
;2883:	else
;2884:	{
line 2885
;2885:		G_Error("Unknown AnimEnt type!");
ADDRGP4 $1329
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 2886
;2886:	}
LABELV $1326
LABELV $1323
LABELV $1320
LABELV $1317
line 2888
;2887:
;2888:	animEnt->s.g2radius = 100;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 100
ASGNI4
line 2890
;2889:
;2890:	if (animEnt->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1330
line 2891
;2891:	{
line 2892
;2892:		animEnt->s.weapon = WP_BLASTER; //This will tell the client to stick a blaster in the model's hands upon model init.
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 2893
;2893:	}
ADDRGP4 $1331
JUMPV
LABELV $1330
line 2894
;2894:	else if (animEnt->watertype == ANIMENT_TYPE_RODIAN)
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1332
line 2895
;2895:	{
line 2896
;2896:		animEnt->s.weapon = WP_DISRUPTOR; //These guys get disruptors instead of blasters.
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 5
ASGNI4
line 2897
;2897:	}
ADDRGP4 $1333
JUMPV
LABELV $1332
line 2898
;2898:	else if (animEnt->watertype == ANIMENT_TYPE_JAN)
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1334
line 2899
;2899:	{
line 2900
;2900:		animEnt->s.weapon = WP_BLASTER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 2901
;2901:	}
ADDRGP4 $1335
JUMPV
LABELV $1334
line 2902
;2902:	else if (animEnt->watertype == ANIMENT_TYPE_CUSTOM)
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1336
line 2903
;2903:	{
line 2904
;2904:		animentCustomInfo_t *aeInfo = ExampleAnimEntCustomData(animEnt);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 ExampleAnimEntCustomData
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRP4
ASGNP4
line 2906
;2905:
;2906:		if (aeInfo)
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1338
line 2907
;2907:		{
line 2908
;2908:			animEnt->s.weapon = aeInfo->aeWeapon;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 2909
;2909:		}
ADDRGP4 $1339
JUMPV
LABELV $1338
line 2911
;2910:		else
;2911:		{
line 2912
;2912:			animEnt->s.weapon = WP_BLASTER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 4
ASGNI4
line 2913
;2913:		}
LABELV $1339
line 2914
;2914:	}
LABELV $1336
LABELV $1335
LABELV $1333
LABELV $1331
line 2916
;2915:
;2916:	animEnt->s.modelGhoul2 = 1; //Deal with it like any other ghoul2 ent, as far as killing instances.
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 2918
;2917:
;2918:	G_SetOrigin(animEnt, pos);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 2920
;2919:
;2920:	G_SetClassName(animEnt, "g2animent");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1340
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 2922
;2921:			
;2922:	VectorCopy (playerMins, animEnt->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2923
;2923:	VectorCopy (playerMaxs, animEnt->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2925
;2924:
;2925:	animEnt->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 2927
;2926:
;2927:	animEnt->clipmask = MASK_PLAYERSOLID;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 273
ASGNI4
line 2928
;2928:	animEnt->r.contents = MASK_PLAYERSOLID;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 273
ASGNI4
line 2930
;2929:
;2930:	animEnt->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 1
ASGNI4
line 2932
;2931:
;2932:	animEnt->health = 60;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 60
ASGNI4
line 2934
;2933:
;2934:	animEnt->s.owner = MAX_CLIENTS+1;
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 33
ASGNI4
line 2935
;2935:	animEnt->s.shouldtarget = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
CNSTI4 1
ASGNI4
line 2936
;2936:	animEnt->s.teamowner = 0;
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
CNSTI4 0
ASGNI4
line 2938
;2937:
;2938:	trap_LinkEntity(animEnt);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2940
;2939:
;2940:	animEnt->pain = ExampleAnimEnt_Pain;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRGP4 ExampleAnimEnt_Pain
ASGNP4
line 2941
;2941:	animEnt->die = ExampleAnimEnt_Die;
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 ExampleAnimEnt_Die
ASGNP4
line 2943
;2942:
;2943:	animEnt->touch = ExampleAnimEntTouch;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 ExampleAnimEntTouch
ASGNP4
line 2945
;2944:
;2945:	animEnt->think = ExampleAnimEntUpdateSelf;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 ExampleAnimEntUpdateSelf
ASGNP4
line 2946
;2946:	animEnt->nextthink = level.time + 50;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 2948
;2947:
;2948:	animEnt->s.torsoAnim = BOTH_ATTACK3;
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 120
ASGNI4
line 2949
;2949:	animEnt->s.legsAnim = BOTH_STAND3;
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
CNSTI4 576
ASGNI4
line 2952
;2950:
;2951:	//initialize the "AI" values
;2952:	animEnt->bolt_Waist = -1; //the waypoint index
ADDRLP4 0
INDIRP4
CNSTI4 848
ADDP4
CNSTI4 -1
ASGNI4
line 2953
;2953:	animEnt->bolt_Motion = ENTITYNUM_NONE; //the enemy index
ADDRLP4 0
INDIRP4
CNSTI4 852
ADDP4
CNSTI4 1023
ASGNI4
line 2954
;2954:	animEnt->splashMethodOfDeath = 0; //don't stand still while you have an enemy
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 0
ASGNI4
line 2955
;2955:	animEnt->splashRadius = 0; //timer for randomly deciding to stand still
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 0
ASGNI4
line 2956
;2956:	animEnt->boltpoint3 = 0; //running forward on the trail
ADDRLP4 0
INDIRP4
CNSTI4 820
ADDP4
CNSTI4 0
ASGNI4
line 2957
;2957:}
LABELV $1234
endproc G_SpawnExampleAnimEnt 84 20
data
export gEscaping
align 4
LABELV gEscaping
byte 4 0
export gEscapeTime
align 4
LABELV gEscapeTime
byte 4 0
export AESpawner_CountAnimEnts
code
proc AESpawner_CountAnimEnts 12 0
line 2964
;2958:
;2959:qboolean gEscaping = qfalse;
;2960:int gEscapeTime = 0;
;2961:
;2962:#ifdef ANIMENT_SPAWNER
;2963:int AESpawner_CountAnimEnts(gentity_t *spawner, qboolean onlySameType)
;2964:{
line 2965
;2965:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2966
;2966:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1344
JUMPV
LABELV $1343
line 2969
;2967:
;2968:	while (i < MAX_GENTITIES)
;2969:	{
line 2970
;2970:		if (g_entities[i].inuse && g_entities[i].s.eType == ET_GRAPPLE)
ADDRLP4 8
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1346
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1346
line 2971
;2971:		{
line 2972
;2972:			if (!onlySameType)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1350
line 2973
;2973:			{
line 2974
;2974:				count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2975
;2975:			}
ADDRGP4 $1351
JUMPV
LABELV $1350
line 2977
;2976:			else
;2977:			{
line 2978
;2978:				if (spawner->watertype == g_entities[i].watertype)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+776
ADDP4
INDIRI4
NEI4 $1352
line 2979
;2979:				{
line 2980
;2980:					if (spawner->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1355
line 2981
;2981:					{
line 2982
;2982:						if (spawner->waterlevel == g_entities[i].waterlevel)
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+780
ADDP4
INDIRI4
NEI4 $1356
line 2983
;2983:						{ //only count it if it's the same custom type template, indicated by equal "waterlevel" value.
line 2984
;2984:							count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2985
;2985:						}
line 2986
;2986:					}
ADDRGP4 $1356
JUMPV
LABELV $1355
line 2988
;2987:					else
;2988:					{
line 2989
;2989:						count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2990
;2990:					}
LABELV $1356
line 2991
;2991:				}
LABELV $1352
line 2992
;2992:			}
LABELV $1351
line 2993
;2993:		}
LABELV $1346
line 2994
;2994:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2995
;2995:	}
LABELV $1344
line 2968
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $1343
line 2997
;2996:
;2997:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $1342
endproc AESpawner_CountAnimEnts 12 0
export AESpawner_NoClientInPVS
proc AESpawner_NoClientInPVS 12 8
line 3001
;2998:}
;2999:
;3000:qboolean AESpawner_NoClientInPVS(gentity_t *ent)
;3001:{
line 3002
;3002:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1362
JUMPV
LABELV $1361
line 3005
;3003:
;3004:	while (i < MAX_CLIENTS)
;3005:	{
line 3006
;3006:		if (g_entities[i].inuse &&
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
EQI4 $1364
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1364
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1364
line 3009
;3007:			g_entities[i].client &&
;3008:			trap_InPVS(ent->s.origin, g_entities[i].client->ps.origin))
;3009:		{
line 3010
;3010:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1360
JUMPV
LABELV $1364
line 3013
;3011:		}
;3012:
;3013:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3014
;3014:	}
LABELV $1362
line 3004
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1361
line 3016
;3015:
;3016:	return qtrue;
CNSTI4 1
RETI4
LABELV $1360
endproc AESpawner_NoClientInPVS 12 8
export AESpawner_PassAnimEntPVSCheck
proc AESpawner_PassAnimEntPVSCheck 16 8
line 3020
;3017:}
;3018:
;3019:qboolean AESpawner_PassAnimEntPVSCheck(gentity_t *ent)
;3020:{
line 3021
;3021:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3022
;3022:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3024
;3023:
;3024:	if (!ent->bolt_LArm)
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1373
line 3025
;3025:	{ //unlimited
line 3026
;3026:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1369
JUMPV
LABELV $1372
line 3030
;3027:	}
;3028:
;3029:	while (i < MAX_GENTITIES)
;3030:	{
line 3031
;3031:		if (g_entities[i].inuse && g_entities[i].s.eType == ET_GRAPPLE &&
ADDRLP4 8
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1375
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1375
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1375
line 3033
;3032:			trap_InPVS(ent->r.currentOrigin, g_entities[i].r.currentOrigin))
;3033:		{
line 3034
;3034:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3035
;3035:		}
LABELV $1375
line 3037
;3036:
;3037:		if (count >= ent->bolt_LArm)
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
LTI4 $1381
line 3038
;3038:		{ //too many in this pvs..
line 3039
;3039:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1369
JUMPV
LABELV $1381
line 3041
;3040:		}
;3041:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3042
;3042:	}
LABELV $1373
line 3029
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $1372
line 3044
;3043:
;3044:	return qtrue;
CNSTI4 1
RETI4
LABELV $1369
endproc AESpawner_PassAnimEntPVSCheck 16 8
export AESpawner_Think
proc AESpawner_Think 1144 28
line 3048
;3045:}
;3046:
;3047:void AESpawner_Think(gentity_t *ent)
;3048:{
line 3050
;3049:	int animEntCount;
;3050:	animentCustomInfo_t *aeInfo = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 3052
;3051:
;3052:	if (gBotEdit)
ADDRGP4 gBotEdit
INDIRF4
CNSTF4 0
EQF4 $1384
line 3053
;3053:	{
line 3054
;3054:		ent->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 3055
;3055:		return;
ADDRGP4 $1383
JUMPV
LABELV $1384
line 3058
;3056:	}
;3057:
;3058:	if (!ent->bolt_LLeg)
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1387
line 3059
;3059:	{
line 3060
;3060:		animEntCount = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 3061
;3061:	}
ADDRGP4 $1388
JUMPV
LABELV $1387
line 3063
;3062:	else
;3063:	{
line 3064
;3064:		qboolean onlySameType = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3066
;3065:
;3066:		if (ent->bolt_RLeg)
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1389
line 3067
;3067:		{
line 3068
;3068:			onlySameType = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 3069
;3069:		}
LABELV $1389
line 3070
;3070:		animEntCount = AESpawner_CountAnimEnts(ent, onlySameType);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 AESpawner_CountAnimEnts
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 3071
;3071:	}
LABELV $1388
line 3073
;3072:
;3073:	if (animEntCount < ent->bolt_LLeg)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
INDIRI4
GEI4 $1391
line 3074
;3074:	{
line 3079
;3075:		trace_t tr;
;3076:		vec3_t playerMins;
;3077:		vec3_t playerMaxs;
;3078:
;3079:		VectorSet(playerMins, -15, -15, DEFAULT_MINS_2);
ADDRLP4 1112
CNSTF4 3245342720
ASGNF4
ADDRLP4 8
ADDRLP4 1112
INDIRF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 1112
INDIRF4
ASGNF4
ADDRLP4 8+8
CNSTF4 3250585600
ASGNF4
line 3080
;3080:		VectorSet(playerMaxs, 15, 15, DEFAULT_MAXS_2);
ADDRLP4 1116
CNSTF4 1097859072
ASGNF4
ADDRLP4 20
ADDRLP4 1116
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 1116
INDIRF4
ASGNF4
ADDRLP4 20+8
CNSTF4 1109393408
ASGNF4
line 3082
;3081:
;3082:		JP_Trace(&tr, ent->s.origin, playerMins, playerMaxs, ent->s.origin, ent->s.number, MASK_PLAYERSOLID);
ADDRLP4 32
ARGP4
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
ADDRLP4 1120
INDIRP4
CNSTI4 92
ADDP4
ASGNP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1120
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3084
;3083:
;3084:		if (tr.fraction == 1)
ADDRLP4 32+8
INDIRF4
CNSTF4 1065353216
NEF4 $1397
line 3085
;3085:		{
line 3086
;3086:			if (ent->bolt_Head || AESpawner_NoClientInPVS(ent))
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1402
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1132
ADDRGP4 AESpawner_NoClientInPVS
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
EQI4 $1400
LABELV $1402
line 3087
;3087:			{
line 3088
;3088:				if (AESpawner_PassAnimEntPVSCheck(ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1136
ADDRGP4 AESpawner_PassAnimEntPVSCheck
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
EQI4 $1403
line 3089
;3089:				{
line 3090
;3090:					if (ent->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1405
line 3091
;3091:					{
line 3092
;3092:						aeInfo = ExampleAnimEntCustomData(ent); //we can get this info from the spawner, because it has its waterlevel set too.
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 ExampleAnimEntCustomData
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1140
INDIRP4
ASGNP4
line 3093
;3093:					}
LABELV $1405
line 3094
;3094:					G_SpawnExampleAnimEnt(ent->s.origin, ent->watertype, aeInfo);
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1140
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SpawnExampleAnimEnt
CALLV
pop
line 3095
;3095:				}
LABELV $1403
line 3096
;3096:			}
LABELV $1400
line 3097
;3097:		}
LABELV $1397
line 3098
;3098:	}
LABELV $1391
line 3100
;3099:
;3100:	ent->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 3101
;3101:}
LABELV $1383
endproc AESpawner_Think 1144 28
export SP_misc_animent_spawner
proc SP_misc_animent_spawner 48 20
line 3104
;3102:
;3103:void SP_misc_animent_spawner(gentity_t *ent)
;3104:{
line 3105
;3105:	if (g_gametype.integer != GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $1409
line 3106
;3106:	{
line 3107
;3107:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 3108
;3108:		return;
ADDRGP4 $1408
JUMPV
LABELV $1409
line 3111
;3109:	}
;3110:
;3111:	G_SpawnInt( "spawninpvs", "0", &ent->bolt_Head );
ADDRGP4 $1412
ARGP4
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3113
;3112:	//If this is non-0, the spawner will spawn even if a client is in the PVS
;3113:	G_SpawnInt( "othersinpvs", "3", &ent->bolt_LArm);
ADDRGP4 $1413
ARGP4
ADDRGP4 $1414
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3116
;3114:	//Don't spawn more than this many animents in the PVS of this spawner.
;3115:	//If 0, the amount is unlimited.
;3116:	G_SpawnInt( "totalspawn", "12", &ent->bolt_LLeg);
ADDRGP4 $1415
ARGP4
ADDRGP4 $1416
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 840
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3119
;3117:	//Only spawn if less than or equal to this many ents active globally.
;3118:	//0 is unlimited, but that could cause horrible disaster.
;3119:	G_SpawnInt( "spawntype", "0", &ent->watertype);
ADDRGP4 $1417
ARGP4
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3121
;3120:	//Spawn type. 0 is stormtrooper, 1 is rodian.
;3121:	G_SpawnInt( "sametype", "1", &ent->bolt_RLeg);
ADDRGP4 $1418
ARGP4
ADDRGP4 $1419
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 844
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3126
;3122:	//If 1, only counts other animates of the same type for deciding whether or not to spawn (as opposed to all types).
;3123:	//Default is 1.
;3124:
;3125:	//Just precache the assets now
;3126:	if (ent->watertype == ANIMENT_TYPE_STORMTROOPER)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1420
line 3127
;3127:	{
line 3128
;3128:		gTrooperSound_Pain[0] = G_SoundIndex("sound/chars/st1/misc/pain25");
ADDRGP4 $1243
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain
ADDRLP4 0
INDIRI4
ASGNI4
line 3129
;3129:		gTrooperSound_Pain[1] = G_SoundIndex("sound/chars/st1/misc/pain50");
ADDRGP4 $1245
ARGP4
ADDRLP4 4
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain+4
ADDRLP4 4
INDIRI4
ASGNI4
line 3130
;3130:		gTrooperSound_Pain[2] = G_SoundIndex("sound/chars/st1/misc/pain75");
ADDRGP4 $1247
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain+8
ADDRLP4 8
INDIRI4
ASGNI4
line 3131
;3131:		gTrooperSound_Pain[3] = G_SoundIndex("sound/chars/st1/misc/pain100");
ADDRGP4 $1249
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Pain+12
ADDRLP4 12
INDIRI4
ASGNI4
line 3133
;3132:
;3133:		gTrooperSound_Death[0] = G_SoundIndex("sound/chars/st1/misc/death1");
ADDRGP4 $1250
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Death
ADDRLP4 16
INDIRI4
ASGNI4
line 3134
;3134:		gTrooperSound_Death[1] = G_SoundIndex("sound/chars/st1/misc/death2");
ADDRGP4 $1252
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Death+4
ADDRLP4 20
INDIRI4
ASGNI4
line 3135
;3135:		gTrooperSound_Death[2] = G_SoundIndex("sound/chars/st1/misc/death3");
ADDRGP4 $1254
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Death+8
ADDRLP4 24
INDIRI4
ASGNI4
line 3137
;3136:
;3137:		gTrooperSound_Alert[0] = G_SoundIndex("sound/chars/st1/misc/detected1");
ADDRGP4 $1255
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert
ADDRLP4 28
INDIRI4
ASGNI4
line 3138
;3138:		gTrooperSound_Alert[1] = G_SoundIndex("sound/chars/st1/misc/detected2");
ADDRGP4 $1257
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+4
ADDRLP4 32
INDIRI4
ASGNI4
line 3139
;3139:		gTrooperSound_Alert[2] = G_SoundIndex("sound/chars/st1/misc/detected3");
ADDRGP4 $1259
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+8
ADDRLP4 36
INDIRI4
ASGNI4
line 3140
;3140:		gTrooperSound_Alert[3] = G_SoundIndex("sound/chars/st1/misc/detected4");
ADDRGP4 $1261
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+12
ADDRLP4 40
INDIRI4
ASGNI4
line 3141
;3141:		gTrooperSound_Alert[4] = G_SoundIndex("sound/chars/st1/misc/detected5");
ADDRGP4 $1263
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrooperSound_Alert+16
ADDRLP4 44
INDIRI4
ASGNI4
line 3143
;3142:
;3143:		G_ModelIndex( "models/players/stormtrooper/model.glm" );
ADDRGP4 $1318
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 3144
;3144:	}
ADDRGP4 $1421
JUMPV
LABELV $1420
line 3145
;3145:	else if (ent->watertype == ANIMENT_TYPE_RODIAN)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1431
line 3146
;3146:	{
line 3147
;3147:		gRodianSound_Pain[0] = G_SoundIndex("sound/chars/rodian1/misc/pain25");
ADDRGP4 $1268
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain
ADDRLP4 0
INDIRI4
ASGNI4
line 3148
;3148:		gRodianSound_Pain[1] = G_SoundIndex("sound/chars/rodian1/misc/pain50");
ADDRGP4 $1270
ARGP4
ADDRLP4 4
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain+4
ADDRLP4 4
INDIRI4
ASGNI4
line 3149
;3149:		gRodianSound_Pain[2] = G_SoundIndex("sound/chars/rodian1/misc/pain75");
ADDRGP4 $1272
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain+8
ADDRLP4 8
INDIRI4
ASGNI4
line 3150
;3150:		gRodianSound_Pain[3] = G_SoundIndex("sound/chars/rodian1/misc/pain100");
ADDRGP4 $1274
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Pain+12
ADDRLP4 12
INDIRI4
ASGNI4
line 3152
;3151:
;3152:		gRodianSound_Death[0] = G_SoundIndex("sound/chars/rodian1/misc/death1");
ADDRGP4 $1275
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Death
ADDRLP4 16
INDIRI4
ASGNI4
line 3153
;3153:		gRodianSound_Death[1] = G_SoundIndex("sound/chars/rodian1/misc/death2");
ADDRGP4 $1277
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Death+4
ADDRLP4 20
INDIRI4
ASGNI4
line 3154
;3154:		gRodianSound_Death[2] = G_SoundIndex("sound/chars/rodian1/misc/death3");
ADDRGP4 $1279
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Death+8
ADDRLP4 24
INDIRI4
ASGNI4
line 3156
;3155:
;3156:		gRodianSound_Alert[0] = G_SoundIndex("sound/chars/rodian1/misc/detected1");
ADDRGP4 $1280
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert
ADDRLP4 28
INDIRI4
ASGNI4
line 3157
;3157:		gRodianSound_Alert[1] = G_SoundIndex("sound/chars/rodian1/misc/detected2");
ADDRGP4 $1282
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+4
ADDRLP4 32
INDIRI4
ASGNI4
line 3158
;3158:		gRodianSound_Alert[2] = G_SoundIndex("sound/chars/rodian1/misc/detected3");
ADDRGP4 $1284
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+8
ADDRLP4 36
INDIRI4
ASGNI4
line 3159
;3159:		gRodianSound_Alert[3] = G_SoundIndex("sound/chars/rodian1/misc/detected4");
ADDRGP4 $1286
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+12
ADDRLP4 40
INDIRI4
ASGNI4
line 3160
;3160:		gRodianSound_Alert[4] = G_SoundIndex("sound/chars/rodian1/misc/detected5");
ADDRGP4 $1288
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gRodianSound_Alert+16
ADDRLP4 44
INDIRI4
ASGNI4
line 3162
;3161:
;3162:		G_ModelIndex( "models/players/rodian/model.glm" );
ADDRGP4 $1321
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 3163
;3163:	}
ADDRGP4 $1432
JUMPV
LABELV $1431
line 3164
;3164:	else if (ent->watertype == ANIMENT_TYPE_JAN)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1442
line 3165
;3165:	{
line 3166
;3166:		gJanSound_Pain[0] = G_SoundIndex("sound/chars/jan/misc/pain25");
ADDRGP4 $1293
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain
ADDRLP4 0
INDIRI4
ASGNI4
line 3167
;3167:		gJanSound_Pain[1] = G_SoundIndex("sound/chars/jan/misc/pain50");
ADDRGP4 $1295
ARGP4
ADDRLP4 4
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain+4
ADDRLP4 4
INDIRI4
ASGNI4
line 3168
;3168:		gJanSound_Pain[2] = G_SoundIndex("sound/chars/jan/misc/pain75");
ADDRGP4 $1297
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain+8
ADDRLP4 8
INDIRI4
ASGNI4
line 3169
;3169:		gJanSound_Pain[3] = G_SoundIndex("sound/chars/jan/misc/pain100");
ADDRGP4 $1299
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Pain+12
ADDRLP4 12
INDIRI4
ASGNI4
line 3171
;3170:
;3171:		gJanSound_Death[0] = G_SoundIndex("sound/chars/jan/misc/death1");
ADDRGP4 $1300
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Death
ADDRLP4 16
INDIRI4
ASGNI4
line 3172
;3172:		gJanSound_Death[1] = G_SoundIndex("sound/chars/jan/misc/death2");
ADDRGP4 $1302
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Death+4
ADDRLP4 20
INDIRI4
ASGNI4
line 3173
;3173:		gJanSound_Death[2] = G_SoundIndex("sound/chars/jan/misc/death3");
ADDRGP4 $1304
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Death+8
ADDRLP4 24
INDIRI4
ASGNI4
line 3175
;3174:
;3175:		gJanSound_Alert[0] = G_SoundIndex("sound/chars/jan/misc/detected1");
ADDRGP4 $1305
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert
ADDRLP4 28
INDIRI4
ASGNI4
line 3176
;3176:		gJanSound_Alert[1] = G_SoundIndex("sound/chars/jan/misc/detected2");
ADDRGP4 $1307
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+4
ADDRLP4 32
INDIRI4
ASGNI4
line 3177
;3177:		gJanSound_Alert[2] = G_SoundIndex("sound/chars/jan/misc/detected3");
ADDRGP4 $1309
ARGP4
ADDRLP4 36
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+8
ADDRLP4 36
INDIRI4
ASGNI4
line 3178
;3178:		gJanSound_Alert[3] = G_SoundIndex("sound/chars/jan/misc/detected4");
ADDRGP4 $1311
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+12
ADDRLP4 40
INDIRI4
ASGNI4
line 3179
;3179:		gJanSound_Alert[4] = G_SoundIndex("sound/chars/jan/misc/detected5");
ADDRGP4 $1313
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gJanSound_Alert+16
ADDRLP4 44
INDIRI4
ASGNI4
line 3181
;3180:
;3181:		G_ModelIndex( "models/players/jan/model.glm" );
ADDRGP4 $1324
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 3182
;3182:	}
ADDRGP4 $1443
JUMPV
LABELV $1442
line 3183
;3183:	else if (ent->watertype == ANIMENT_TYPE_CUSTOM)
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1453
line 3184
;3184:	{
line 3185
;3185:		int alignment = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 3186
;3186:		int weapon = 3;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 3191
;3187:		char *model;
;3188:		char *soundpath;
;3189:		animentCustomInfo_t *aeInfo;
;3190:
;3191:		G_SpawnInt( "ae_aligned", "1", &alignment );
ADDRGP4 $1455
ARGP4
ADDRGP4 $1419
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3193
;3192:		//Alignedment - 1 is bad, 2 is good.
;3193:		G_SpawnInt( "ae_weapon", "3", &weapon);
ADDRGP4 $1456
ARGP4
ADDRGP4 $1414
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3195
;3194:		//Weapon - Same values as normal weapons.
;3195:		G_SpawnString( "ae_model", "models/players/stormtrooper/model.glm", &model);
ADDRGP4 $1457
ARGP4
ADDRGP4 $1318
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 3197
;3196:		//Model to use
;3197:		G_SpawnString( "ae_soundpath", "sound/chars/jan/misc", &soundpath);
ADDRGP4 $1458
ARGP4
ADDRGP4 $1459
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 3200
;3198:		//Sound path to use
;3199:
;3200:		ExampleAnimEntCustomDataEntry(ent, alignment, weapon, model, soundpath);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 ExampleAnimEntCustomDataEntry
CALLV
pop
line 3202
;3201:
;3202:		aeInfo = ExampleAnimEntCustomData(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 ExampleAnimEntCustomData
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 3204
;3203:
;3204:		if (aeInfo)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1460
line 3205
;3205:		{
line 3206
;3206:			AnimEntCustomSoundPrecache(aeInfo);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 AnimEntCustomSoundPrecache
CALLV
pop
line 3207
;3207:			G_ModelIndex( aeInfo->modelPath );
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 3208
;3208:		}
LABELV $1460
line 3209
;3209:	}
LABELV $1453
LABELV $1443
LABELV $1432
LABELV $1421
line 3211
;3210:
;3211:	ent->think = AESpawner_Think;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 AESpawner_Think
ASGNP4
line 3212
;3212:	ent->nextthink = level.time + Q_irandExpectedIf(gRandomUnlockAdd, 50, 500, g_defrag.integer, 250);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 50
ARGI4
CNSTI4 500
ARGI4
ADDRGP4 g_defrag+12
INDIRI4
ARGI4
CNSTI4 250
ARGI4
ADDRLP4 0
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
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
line 3213
;3213:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3214
;3214:}
LABELV $1408
endproc SP_misc_animent_spawner 48 20
export Use_Target_Screenshake
proc Use_Target_Screenshake 8 20
line 3217
;3215:
;3216:void Use_Target_Screenshake( gentity_t *ent, gentity_t *other, gentity_t *activator )
;3217:{
line 3218
;3218:	qboolean bGlobal = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3220
;3219:
;3220:	if (ent->bolt_LArm)
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1465
line 3221
;3221:	{
line 3222
;3222:		bGlobal = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 3223
;3223:	}
LABELV $1465
line 3225
;3224:
;3225:	G_ScreenShake(ent->s.origin, NULL, ent->speed, ent->bolt_Head, bGlobal);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 G_ScreenShake
CALLP4
pop
line 3226
;3226:}
LABELV $1464
endproc Use_Target_Screenshake 8 20
export SP_target_screenshake
proc SP_target_screenshake 0 12
line 3229
;3227:
;3228:void SP_target_screenshake(gentity_t *ent)
;3229:{
line 3230
;3230:	if (g_gametype.integer != GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $1468
line 3231
;3231:	{
line 3232
;3232:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 3233
;3233:		return;
ADDRGP4 $1467
JUMPV
LABELV $1468
line 3236
;3234:	}
;3235:
;3236:	G_SpawnFloat( "intensity", "10", &ent->speed );
ADDRGP4 $1471
ARGP4
ADDRGP4 $1472
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 3238
;3237:	//intensity of the shake
;3238:	G_SpawnInt( "duration", "800", &ent->bolt_Head );
ADDRGP4 $1473
ARGP4
ADDRGP4 $1474
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3240
;3239:	//duration of the shake
;3240:	G_SpawnInt( "globalshake", "1", &ent->bolt_LArm );
ADDRGP4 $1475
ARGP4
ADDRGP4 $1419
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3243
;3241:	//non-0 if shake should be global (all clients). Otherwise, only in the PVS.
;3242:
;3243:	ent->use = Use_Target_Screenshake;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 Use_Target_Screenshake
ASGNP4
line 3244
;3244:}
LABELV $1467
endproc SP_target_screenshake 0 12
export Use_Target_Escapetrig
proc Use_Target_Escapetrig 16 12
line 3249
;3245:
;3246:void LogExit( const char *string );
;3247:
;3248:void Use_Target_Escapetrig( gentity_t *ent, gentity_t *other, gentity_t *activator )
;3249:{
line 3250
;3250:	if (!ent->bolt_LArm)
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1477
line 3251
;3251:	{
line 3252
;3252:		gEscaping = qtrue;
ADDRGP4 gEscaping
CNSTI4 1
ASGNI4
line 3253
;3253:		gEscapeTime = level.time + ent->bolt_Head;
ADDRGP4 gEscapeTime
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
ADDI4
ASGNI4
line 3254
;3254:	}
ADDRGP4 $1478
JUMPV
LABELV $1477
line 3255
;3255:	else if (gEscaping)
ADDRGP4 gEscaping
INDIRI4
CNSTI4 0
EQI4 $1480
line 3256
;3256:	{
line 3257
;3257:		int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 3258
;3258:		gEscaping = qfalse;
ADDRGP4 gEscaping
CNSTI4 0
ASGNI4
ADDRGP4 $1483
JUMPV
LABELV $1482
line 3260
;3259:		while (i < MAX_CLIENTS)
;3260:		{ //all of the survivors get 100 points!
line 3261
;3261:			if (g_entities[i].inuse && g_entities[i].client && g_entities[i].health > 0 &&
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1485
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1485
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $1485
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1485
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 8
INDIRI4
NEI4 $1485
line 3264
;3262:				g_entities[i].client->sess.sessionTeam != TEAM_SPECTATOR &&
;3263:				!(g_entities[i].client->ps.pm_flags & PMF_FOLLOW))
;3264:			{
line 3265
;3265:				AddScore(&g_entities[i], g_entities[i].client->ps.origin, 100);
ADDRLP4 12
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 3266
;3266:			}
LABELV $1485
line 3267
;3267:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3268
;3268:		}
LABELV $1483
line 3259
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1482
line 3269
;3269:		if (activator && activator->inuse && activator->client)
ADDRLP4 4
ADDRFP4 8
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
EQU4 $1493
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1493
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $1493
line 3270
;3270:		{ //the one who escaped gets 500
line 3271
;3271:			AddScore(activator, activator->client->ps.origin, 500);
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 500
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 3272
;3272:		}
LABELV $1493
line 3274
;3273:
;3274:		LogExit("Escaped!");
ADDRGP4 $1495
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 3275
;3275:	}
LABELV $1480
LABELV $1478
line 3276
;3276:}
LABELV $1476
endproc Use_Target_Escapetrig 16 12
export SP_target_escapetrig
proc SP_target_escapetrig 0 12
line 3279
;3277:
;3278:void SP_target_escapetrig(gentity_t *ent)
;3279:{
line 3280
;3280:	if (g_gametype.integer != GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $1497
line 3281
;3281:	{
line 3282
;3282:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 3283
;3283:		return;
ADDRGP4 $1496
JUMPV
LABELV $1497
line 3286
;3284:	}
;3285:
;3286:	G_SpawnInt( "escapetime", "60000", &ent->bolt_Head);
ADDRGP4 $1500
ARGP4
ADDRGP4 $1501
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3288
;3287:	//time given (in ms) for the escape
;3288:	G_SpawnInt( "escapegoal", "0", &ent->bolt_LArm);
ADDRGP4 $1502
ARGP4
ADDRGP4 $169
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 832
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 3291
;3289:	//if non-0, when used, will end an ongoing escape instead of start it
;3290:
;3291:	ent->use = Use_Target_Escapetrig;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 Use_Target_Escapetrig
ASGNP4
line 3292
;3292:}
LABELV $1496
endproc SP_target_escapetrig 0 12
export G_CreateExampleAnimEnt
proc G_CreateExampleAnimEnt 2116 16
line 3297
;3293:
;3294:#endif
;3295:
;3296:void G_CreateExampleAnimEnt(gentity_t *ent)
;3297:{
line 3301
;3298:	vec3_t fwd, fwdPos;
;3299:	animentCustomInfo_t aeInfo;
;3300:	char	arg[MAX_STRING_CHARS];
;3301:	int		iArg = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 3302
;3302:	int		argNum = trap_Argc();
ADDRLP4 1080
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 1080
INDIRI4
ASGNI4
line 3304
;3303:
;3304:	memset(&aeInfo, 0, sizeof(aeInfo));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTU4 24
ARGU4
ADDRGP4 memset
CALLP4
pop
line 3306
;3305:
;3306:	if (argNum > 1)
ADDRLP4 52
INDIRI4
CNSTI4 1
LEI4 $1504
line 3307
;3307:	{
line 3308
;3308:		trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3310
;3309:
;3310:		iArg = atoi(arg);
ADDRLP4 56
ARGP4
ADDRLP4 1084
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 1084
INDIRI4
ASGNI4
line 3312
;3311:
;3312:		if (iArg < 0)
ADDRLP4 24
INDIRI4
CNSTI4 0
GEI4 $1506
line 3313
;3313:		{
line 3314
;3314:			iArg = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 3315
;3315:		}
LABELV $1506
line 3316
;3316:		if (iArg >= MAX_ANIMENTS)
ADDRLP4 24
INDIRI4
CNSTI4 4
LTI4 $1508
line 3317
;3317:		{
line 3318
;3318:			iArg = MAX_ANIMENTS-1;
ADDRLP4 24
CNSTI4 3
ASGNI4
line 3319
;3319:		}
LABELV $1508
line 3320
;3320:	}
LABELV $1504
line 3322
;3321:
;3322:	AngleVectors(ent->client->ps.viewangles, fwd, 0, 0);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 1084
CNSTP4 0
ASGNP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3324
;3323:
;3324:	fwdPos[0] = ent->client->ps.origin[0] + fwd[0]*128;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
line 3325
;3325:	fwdPos[1] = ent->client->ps.origin[1] + fwd[1]*128;
ADDRLP4 40+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 28+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3326
;3326:	fwdPos[2] = ent->client->ps.origin[2] + fwd[2]*128;
ADDRLP4 40+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 28+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3328
;3327:
;3328:	if (iArg == ANIMENT_TYPE_CUSTOM)
ADDRLP4 24
INDIRI4
CNSTI4 3
NEI4 $1514
line 3329
;3329:	{
line 3332
;3330:		char arg2[MAX_STRING_CHARS];
;3331:
;3332:		if (argNum > 2)
ADDRLP4 52
INDIRI4
CNSTI4 2
LEI4 $1516
line 3333
;3333:		{
line 3334
;3334:			trap_Argv( 2, arg, sizeof( arg ) );
CNSTI4 2
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3335
;3335:			aeInfo.aeAlignment = atoi(arg);
ADDRLP4 56
ARGP4
ADDRLP4 2112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2112
INDIRI4
ASGNI4
line 3336
;3336:		}
ADDRGP4 $1517
JUMPV
LABELV $1516
line 3338
;3337:		else
;3338:		{
line 3339
;3339:			aeInfo.aeAlignment = ANIMENT_ALIGNED_BAD;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 3340
;3340:		}
LABELV $1517
line 3342
;3341:
;3342:		if (argNum > 3)
ADDRLP4 52
INDIRI4
CNSTI4 3
LEI4 $1518
line 3343
;3343:		{
line 3344
;3344:			trap_Argv( 3, arg, sizeof( arg ) );
CNSTI4 3
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3345
;3345:			aeInfo.aeWeapon = atoi(arg);
ADDRLP4 56
ARGP4
ADDRLP4 2112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 2112
INDIRI4
ASGNI4
line 3346
;3346:		}
ADDRGP4 $1519
JUMPV
LABELV $1518
line 3348
;3347:		else
;3348:		{
line 3349
;3349:			aeInfo.aeWeapon = WP_BRYAR_PISTOL;
ADDRLP4 0+8
CNSTI4 3
ASGNI4
line 3350
;3350:		}
LABELV $1519
line 3352
;3351:
;3352:		if (argNum > 4)
ADDRLP4 52
INDIRI4
CNSTI4 4
LEI4 $1522
line 3353
;3353:		{
line 3354
;3354:			trap_Argv( 4, arg, sizeof( arg ) );
CNSTI4 4
ARGI4
ADDRLP4 56
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3355
;3355:			aeInfo.modelPath = arg;
ADDRLP4 0+12
ADDRLP4 56
ASGNP4
line 3356
;3356:		}
ADDRGP4 $1523
JUMPV
LABELV $1522
line 3358
;3357:		else
;3358:		{
line 3359
;3359:			aeInfo.modelPath = "models/players/stormtrooper/model.glm";
ADDRLP4 0+12
ADDRGP4 $1318
ASGNP4
line 3360
;3360:		}
LABELV $1523
line 3362
;3361:
;3362:		if (argNum > 5)
ADDRLP4 52
INDIRI4
CNSTI4 5
LEI4 $1526
line 3363
;3363:		{
line 3364
;3364:			trap_Argv( 5, arg2, sizeof( arg2 ) );
CNSTI4 5
ARGI4
ADDRLP4 1088
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 3365
;3365:			aeInfo.soundPath = arg2;
ADDRLP4 0+16
ADDRLP4 1088
ASGNP4
line 3366
;3366:		}
ADDRGP4 $1527
JUMPV
LABELV $1526
line 3368
;3367:		else
;3368:		{
line 3369
;3369:			aeInfo.soundPath = "sound/chars/jan/misc";
ADDRLP4 0+16
ADDRGP4 $1459
ASGNP4
line 3370
;3370:		}
LABELV $1527
line 3371
;3371:	}
LABELV $1514
line 3373
;3372:
;3373:	G_SpawnExampleAnimEnt(fwdPos, iArg, &aeInfo);
ADDRLP4 40
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnExampleAnimEnt
CALLV
pop
line 3374
;3374:}
LABELV $1503
endproc G_CreateExampleAnimEnt 2116 16
import LogExit
import AnimEntFireWeapon
import G_PickDeathAnim
bss
export gJanSound_Alert
align 4
LABELV gJanSound_Alert
skip 20
export gJanSound_Death
align 4
LABELV gJanSound_Death
skip 12
export gJanSound_Pain
align 4
LABELV gJanSound_Pain
skip 16
export gRodianSound_Alert
align 4
LABELV gRodianSound_Alert
skip 20
export gRodianSound_Death
align 4
LABELV gRodianSound_Death
skip 12
export gRodianSound_Pain
align 4
LABELV gRodianSound_Pain
skip 16
export gTrooperSound_Alert
align 4
LABELV gTrooperSound_Alert
skip 20
export gTrooperSound_Death
align 4
LABELV gTrooperSound_Death
skip 12
export gTrooperSound_Pain
align 4
LABELV gTrooperSound_Pain
skip 16
import g_MaxHolocronCarry
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
LABELV $1502
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 112
byte 1 101
byte 1 103
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1501
byte 1 54
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $1500
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 112
byte 1 101
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1495
byte 1 69
byte 1 115
byte 1 99
byte 1 97
byte 1 112
byte 1 101
byte 1 100
byte 1 33
byte 1 0
align 1
LABELV $1475
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 104
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $1474
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $1473
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1472
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $1471
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $1459
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
byte 1 106
byte 1 97
byte 1 110
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 0
align 1
LABELV $1458
byte 1 97
byte 1 101
byte 1 95
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $1457
byte 1 97
byte 1 101
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $1456
byte 1 97
byte 1 101
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1455
byte 1 97
byte 1 101
byte 1 95
byte 1 97
byte 1 108
byte 1 105
byte 1 103
byte 1 110
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $1419
byte 1 49
byte 1 0
align 1
LABELV $1418
byte 1 115
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $1417
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
LABELV $1416
byte 1 49
byte 1 50
byte 1 0
align 1
LABELV $1415
byte 1 116
byte 1 111
byte 1 116
byte 1 97
byte 1 108
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $1414
byte 1 51
byte 1 0
align 1
LABELV $1413
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 112
byte 1 118
byte 1 115
byte 1 0
align 1
LABELV $1412
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 105
byte 1 110
byte 1 112
byte 1 118
byte 1 115
byte 1 0
align 1
LABELV $1340
byte 1 103
byte 1 50
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1329
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 65
byte 1 110
byte 1 105
byte 1 109
byte 1 69
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $1324
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
byte 1 106
byte 1 97
byte 1 110
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
LABELV $1321
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
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 110
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
LABELV $1318
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
byte 1 115
byte 1 116
byte 1 111
byte 1 114
byte 1 109
byte 1 116
byte 1 114
byte 1 111
byte 1 111
byte 1 112
byte 1 101
byte 1 114
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
LABELV $1313
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
byte 1 106
byte 1 97
byte 1 110
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 53
byte 1 0
align 1
LABELV $1311
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
byte 1 106
byte 1 97
byte 1 110
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 52
byte 1 0
align 1
LABELV $1309
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
byte 1 106
byte 1 97
byte 1 110
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1307
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
byte 1 106
byte 1 97
byte 1 110
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $1305
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
byte 1 106
byte 1 97
byte 1 110
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $1304
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
byte 1 106
byte 1 97
byte 1 110
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
byte 1 0
align 1
LABELV $1302
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
byte 1 106
byte 1 97
byte 1 110
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
byte 1 0
align 1
LABELV $1300
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
byte 1 106
byte 1 97
byte 1 110
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 49
byte 1 0
align 1
LABELV $1299
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
byte 1 106
byte 1 97
byte 1 110
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $1297
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
byte 1 106
byte 1 97
byte 1 110
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $1295
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
byte 1 106
byte 1 97
byte 1 110
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $1293
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
byte 1 106
byte 1 97
byte 1 110
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $1288
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
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 110
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 53
byte 1 0
align 1
LABELV $1286
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
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 110
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 52
byte 1 0
align 1
LABELV $1284
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
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 110
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1282
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
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 110
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $1280
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
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 110
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $1279
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
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 110
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
byte 1 0
align 1
LABELV $1277
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
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 110
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
byte 1 0
align 1
LABELV $1275
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
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 110
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 49
byte 1 0
align 1
LABELV $1274
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
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 110
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $1272
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
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 110
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $1270
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
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 110
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $1268
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
byte 1 114
byte 1 111
byte 1 100
byte 1 105
byte 1 97
byte 1 110
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $1263
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
byte 1 115
byte 1 116
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 53
byte 1 0
align 1
LABELV $1261
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
byte 1 115
byte 1 116
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 52
byte 1 0
align 1
LABELV $1259
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
byte 1 115
byte 1 116
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $1257
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
byte 1 115
byte 1 116
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $1255
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
byte 1 115
byte 1 116
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $1254
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
byte 1 115
byte 1 116
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
byte 1 0
align 1
LABELV $1252
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
byte 1 115
byte 1 116
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
byte 1 0
align 1
LABELV $1250
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
byte 1 115
byte 1 116
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 49
byte 1 0
align 1
LABELV $1249
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
byte 1 115
byte 1 116
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $1247
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
byte 1 115
byte 1 116
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $1245
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
byte 1 115
byte 1 116
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $1243
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
byte 1 115
byte 1 116
byte 1 49
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $616
byte 1 37
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 53
byte 1 0
align 1
LABELV $615
byte 1 37
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 52
byte 1 0
align 1
LABELV $614
byte 1 37
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $613
byte 1 37
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $612
byte 1 37
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $611
byte 1 37
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
byte 1 0
align 1
LABELV $610
byte 1 37
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
byte 1 0
align 1
LABELV $609
byte 1 37
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 49
byte 1 0
align 1
LABELV $608
byte 1 37
byte 1 115
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $607
byte 1 37
byte 1 115
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $606
byte 1 37
byte 1 115
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $605
byte 1 37
byte 1 115
byte 1 47
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $568
byte 1 94
byte 1 49
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 102
byte 1 120
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 120
byte 1 70
byte 1 105
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
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $564
byte 1 102
byte 1 120
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $563
byte 1 0
align 1
LABELV $562
byte 1 102
byte 1 120
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $557
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $556
byte 1 52
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $555
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $549
byte 1 102
byte 1 120
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 95
byte 1 108
byte 1 105
byte 1 110
byte 1 107
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $542
byte 1 32
byte 1 32
byte 1 45
byte 1 97
byte 1 115
byte 1 115
byte 1 117
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 85
byte 1 80
byte 1 32
byte 1 111
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $541
byte 1 102
byte 1 120
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 95
byte 1 108
byte 1 105
byte 1 110
byte 1 107
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 110
byte 1 111
byte 1 116
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
byte 1 10
byte 1 0
align 1
LABELV $484
byte 1 100
byte 1 109
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 120
byte 1 0
align 1
LABELV $449
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
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $415
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
byte 1 112
byte 1 105
byte 1 99
byte 1 107
byte 1 117
byte 1 112
byte 1 115
byte 1 104
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
LABELV $402
byte 1 47
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
byte 1 100
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $401
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
byte 1 117
byte 1 115
byte 1 101
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $396
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 46
byte 1 109
byte 1 112
byte 1 51
byte 1 0
align 1
LABELV $394
byte 1 47
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
byte 1 97
byte 1 95
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $386
byte 1 83
byte 1 80
byte 1 95
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 95
byte 1 102
byte 1 108
byte 1 111
byte 1 111
byte 1 114
byte 1 95
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 58
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 95
byte 1 102
byte 1 108
byte 1 111
byte 1 111
byte 1 114
byte 1 95
byte 1 117
byte 1 110
byte 1 105
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
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $371
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 111
byte 1 110
byte 1 101
byte 1 46
byte 1 109
byte 1 112
byte 1 51
byte 1 0
align 1
LABELV $354
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 47
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $342
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $339
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $290
byte 1 83
byte 1 80
byte 1 95
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 111
byte 1 99
byte 1 114
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 111
byte 1 99
byte 1 114
byte 1 111
byte 1 110
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
LABELV $169
byte 1 48
byte 1 0
align 1
LABELV $168
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $148
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
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 115
byte 1 117
byte 1 114
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 10
byte 1 0
