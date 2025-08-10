export Use_Target_Give
code
proc Use_Target_Give 1088 12
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_target.c"
line 10
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5://==========================================================
;6:
;7:/*QUAKED target_give (1 0 0) (-8 -8 -8) (8 8 8)
;8:Gives the activator all the items pointed to.
;9:*/
;10:void Use_Target_Give( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 14
;11:	gentity_t	*t;
;12:	trace_t		trace;
;13:
;14:	if ( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $123
line 15
;15:		return;
ADDRGP4 $122
JUMPV
LABELV $123
line 18
;16:	}
;17:
;18:	if ( !ent->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $125
line 19
;19:		return;
ADDRGP4 $122
JUMPV
LABELV $125
line 22
;20:	}
;21:
;22:	memset( &trace, 0, sizeof( trace ) );
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1080
ARGU4
ADDRGP4 memset
CALLP4
pop
line 23
;23:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $128
JUMPV
LABELV $127
line 24
;24:	while ( (t = G_Find (t, FOFS(targetname), ent->target)) != NULL ) {
line 25
;25:		if ( !t->item ) {
ADDRLP4 0
INDIRP4
CNSTI4 868
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $130
line 26
;26:			continue;
ADDRGP4 $128
JUMPV
LABELV $130
line 28
;27:		}
;28:		Touch_Item( t, activator, &trace );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 31
;29:
;30:		// make sure it isn't going to respawn or show any events
;31:		t->nextthink = 0;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 32
;32:		trap_UnlinkEntity( t );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 33
;33:	}
LABELV $128
line 24
ADDRLP4 0
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
ADDRLP4 1084
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1084
INDIRP4
ASGNP4
ADDRLP4 1084
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $127
line 34
;34:}
LABELV $122
endproc Use_Target_Give 1088 12
export SP_target_give
proc SP_target_give 0 0
line 36
;35:
;36:void SP_target_give( gentity_t *ent ) {
line 37
;37:	ent->use = Use_Target_Give;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 Use_Target_Give
ASGNP4
line 38
;38:}
LABELV $132
endproc SP_target_give 0 0
export Use_target_remove_powerups
proc Use_target_remove_powerups 0 12
line 47
;39:
;40:
;41://==========================================================
;42:
;43:/*QUAKED target_remove_powerups (1 0 0) (-8 -8 -8) (8 8 8)
;44:takes away all the activators powerups.
;45:Used to drop flight powerups into death puts.
;46:*/
;47:void Use_target_remove_powerups( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 48
;48:	if( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $134
line 49
;49:		return;
ADDRGP4 $133
JUMPV
LABELV $134
line 52
;50:	}
;51:
;52:	if( activator->client->ps.powerups[PW_REDFLAG] ) {
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $136
line 53
;53:		Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 54
;54:	} else if( activator->client->ps.powerups[PW_BLUEFLAG] ) {
ADDRGP4 $137
JUMPV
LABELV $136
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $138
line 55
;55:		Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 56
;56:	} else if( activator->client->ps.powerups[PW_NEUTRALFLAG] ) {
ADDRGP4 $139
JUMPV
LABELV $138
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $140
line 57
;57:		Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 58
;58:	}
LABELV $140
LABELV $139
LABELV $137
line 60
;59:
;60:	memset( activator->client->ps.powerups, 0, sizeof( activator->client->ps.powerups ) );
ADDRFP4 8
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
line 61
;61:}
LABELV $133
endproc Use_target_remove_powerups 0 12
export SP_target_remove_powerups
proc SP_target_remove_powerups 0 0
line 63
;62:
;63:void SP_target_remove_powerups( gentity_t *ent ) {
line 64
;64:	ent->use = Use_target_remove_powerups;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 Use_target_remove_powerups
ASGNP4
line 65
;65:}
LABELV $142
endproc SP_target_remove_powerups 0 0
export Think_Target_Delay
proc Think_Target_Delay 4 8
line 78
;66:
;67:
;68://==========================================================
;69:
;70:/*QUAKED target_delay (1 0 0) (-8 -8 -8) (8 8 8) NO_RETRIGGER
;71:
;72:NO_RETRIGGER - Keeps the delay from resetting the time if it is
;73:activated again while it is counting down to an event.
;74:
;75:"wait" seconds to pause before firing targets.
;76:"random" delay variance, total delay = delay +/- random seconds
;77:*/
;78:void Think_Target_Delay( gentity_t *ent ) {
line 79
;79:	G_UseTargets( ent, ent->activator );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 80
;80:}
LABELV $143
endproc Think_Target_Delay 4 8
export Use_Target_Delay
proc Use_Target_Delay 16 8
line 82
;81:
;82:void Use_Target_Delay( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 83
;83:	if (ent->nextthink > level.time && (ent->spawnflags & 1))
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $145
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $145
line 84
;84:	{ //Leave me alone, I am thinking.
line 85
;85:		return;
ADDRGP4 $144
JUMPV
LABELV $145
line 87
;86:	}
;87:	if (activator->client && activator->client->sess.raceMode) {
ADDRLP4 4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $148
ADDRLP4 4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $148
line 88
;88:		ent->nextthink = level.time + ( ent->wait ) * 1000;
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
CVIF4 4
CNSTF4 1148846080
ADDRLP4 8
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 89
;89:	}
ADDRGP4 $149
JUMPV
LABELV $148
line 90
;90:	else {
line 91
;91:		ent->nextthink = level.time + ( ent->wait + ent->random * crandom() ) * 1000;
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 12
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 8
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
MULF4
ADDF4
CVFI4 4
ASGNI4
line 92
;92:	}
LABELV $149
line 93
;93:	ent->think = Think_Target_Delay;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 Think_Target_Delay
ASGNP4
line 95
;94:	//ent->activator = activator;
;95:	G_SetActivator(ent, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 96
;96:}
LABELV $144
endproc Use_Target_Delay 16 8
export SP_target_delay
proc SP_target_delay 4 12
line 98
;97:
;98:void SP_target_delay( gentity_t *ent ) {
line 100
;99:	// check delay for backwards compatability
;100:	if ( !G_SpawnFloat( "delay", "0", &ent->wait ) ) {
ADDRGP4 $155
ARGP4
ADDRGP4 $156
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $153
line 101
;101:		G_SpawnFloat( "wait", "1", &ent->wait );
ADDRGP4 $157
ARGP4
ADDRGP4 $158
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 102
;102:	}
LABELV $153
line 104
;103:
;104:	if ( !ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
NEF4 $159
line 105
;105:		ent->wait = 1;
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
CNSTF4 1065353216
ASGNF4
line 106
;106:	}
LABELV $159
line 107
;107:	ent->use = Use_Target_Delay;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 Use_Target_Delay
ASGNP4
line 108
;108:}
LABELV $152
endproc SP_target_delay 4 12
export Use_Target_Score
proc Use_Target_Score 24 28
line 118
;109:
;110:
;111://==========================================================
;112:
;113:/*QUAKED target_score (1 0 0) (-8 -8 -8) (8 8 8)
;114:"count" number of points to add, default 1
;115:
;116:The activator is given this many points.
;117:*/
;118:void Use_Target_Score (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 119
;119:	if (activator->client && activator->client->sess.raceMode) {
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $162
ADDRLP4 0
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $162
line 120
;120:		activator->client->pers.stats.score += ent->count; // checkpoint score, kinda.
ADDRLP4 4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 42676
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ADDI4
ASGNI4
line 121
;121:		G_CenterPrint(activator -g_entities,3, va("^7Checkpoint score ^%c%s%d: %d", ent->count > 0 ? '3' : '1', ent->count > 0 ? "+" : "", ent->count, activator->client->pers.stats.score),qfalse,qtrue,qfalse,NULL);
ADDRGP4 $164
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
LEI4 $169
ADDRLP4 8
CNSTI4 51
ASGNI4
ADDRGP4 $170
JUMPV
LABELV $169
ADDRLP4 8
CNSTI4 49
ASGNI4
LABELV $170
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
LEI4 $171
ADDRLP4 12
ADDRGP4 $166
ASGNP4
ADDRGP4 $172
JUMPV
LABELV $171
ADDRLP4 12
ADDRGP4 $167
ASGNP4
LABELV $172
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 42676
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
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
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_CenterPrint
CALLV
pop
line 122
;122:		return;
ADDRGP4 $161
JUMPV
LABELV $162
line 124
;123:	}
;124:	AddScore( activator, ent->r.currentOrigin, ent->count );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 125
;125:}
LABELV $161
endproc Use_Target_Score 24 28
export SP_target_score
proc SP_target_score 0 0
line 127
;126:
;127:void SP_target_score( gentity_t *ent ) {
line 128
;128:	if ( !ent->count ) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CNSTI4 0
NEI4 $174
line 129
;129:		ent->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 1
ASGNI4
line 130
;130:	}
LABELV $174
line 131
;131:	ent->use = Use_Target_Score;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 Use_Target_Score
ASGNP4
line 132
;132:}
LABELV $173
endproc SP_target_score 0 0
export DF_target_fragsFilter_use
proc DF_target_fragsFilter_use 56 28
line 136
;133:
;134:
;135:// ignore this outside racemode
;136:void DF_target_fragsFilter_use(gentity_t* ent, gentity_t* other, gentity_t* activator) {
line 138
;137:
;138:	if (!activator || !activator->client || !activator->client->sess.raceMode) {
ADDRLP4 0
ADDRFP4 8
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
EQU4 $180
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
EQU4 $180
ADDRLP4 8
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $177
LABELV $180
line 139
;139:		return;
ADDRGP4 $176
JUMPV
LABELV $177
line 143
;140:	}
;141:
;142:	// TODO global fragsfilter? i guess ppl arent supposed to be using it anyway tho, as its supposedly broken?
;143:	if (activator->client) {
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $181
line 144
;144:		gclient_t* cl = activator->client;
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 145
;145:		int* clientScore = cl->sess.raceMode ? &cl->pers.stats.score : &cl->ps.persistant[PERS_SCORE]; // technically not needed since we dont allow it outside defrag but maybe we change our mind someday.
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $184
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 42676
ADDP4
ASGNP4
ADDRGP4 $185
JUMPV
LABELV $184
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
LABELV $185
ADDRLP4 16
ADDRLP4 20
INDIRP4
ASGNP4
line 146
;146:		if (*clientScore == ent->count || !(ent->spawnflags & Q3SPAWNFLAG_TARGET_FRAGSFILTER_MATCH) && *clientScore > ent->count) {
ADDRLP4 24
ADDRLP4 16
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $188
ADDRLP4 28
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $186
ADDRLP4 24
INDIRI4
ADDRLP4 32
INDIRI4
LEI4 $186
LABELV $188
line 147
;147:			if (ent->spawnflags & Q3SPAWNFLAG_TARGET_FRAGSFILTER_REMOVER) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $189
line 148
;148:				*clientScore -= ent->count;
ADDRLP4 36
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
SUBI4
ASGNI4
line 149
;149:			}
LABELV $189
line 150
;150:			if (ent->spawnflags & Q3SPAWNFLAG_TARGET_FRAGSFILTER_RESET) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $191
line 151
;151:				*clientScore = 0;
ADDRLP4 16
INDIRP4
CNSTI4 0
ASGNI4
line 152
;152:			}
LABELV $191
line 153
;153:			G_UseTargets(ent, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 154
;154:		}
ADDRGP4 $187
JUMPV
LABELV $186
line 155
;155:		else if (!(ent->spawnflags & Q3SPAWNFLAG_TARGET_FRAGSFILTER_SILENT) && !(ent->spawnflags & Q3SPAWNFLAG_TARGET_FRAGSFILTER_MATCH)) {
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 4
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $193
ADDRLP4 36
INDIRI4
CNSTI4 16
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $193
line 156
;156:			G_CenterPrint(activator - g_entities, 3, va("^1Your checkpoint score is too %s: %d/%d", *clientScore > ent->count ? "high" : "low", cl->pers.stats.score, ent->count), qfalse, qtrue, qfalse, NULL);
ADDRGP4 $195
ARGP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
LEI4 $199
ADDRLP4 44
ADDRGP4 $196
ASGNP4
ADDRGP4 $200
JUMPV
LABELV $199
ADDRLP4 44
ADDRGP4 $197
ASGNP4
LABELV $200
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 42676
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
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
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_CenterPrint
CALLV
pop
line 157
;157:		}
LABELV $193
LABELV $187
line 159
;158:		
;159:	}
LABELV $181
line 160
;160:}
LABELV $176
endproc DF_target_fragsFilter_use 56 28
export DF_target_fragsFilter
proc DF_target_fragsFilter 0 12
line 162
;161:
;162:void DF_target_fragsFilter(gentity_t* ent) {
line 163
;163:	if (!g_defrag.integer) {
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
NEI4 $202
line 164
;164:		G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 165
;165:		return;
ADDRGP4 $201
JUMPV
LABELV $202
line 167
;166:	}
;167:	G_SpawnInt("frags", "1", &ent->count);
ADDRGP4 $205
ARGP4
ADDRGP4 $158
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 171
;168:	//if (!ent->targetname || !ent->targetname[0]) {
;169:	//	ent->s.generic1 = 1;
;170:	//}
;171:	ent->use = DF_target_fragsFilter_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 DF_target_fragsFilter_use
ASGNP4
line 172
;172:}
LABELV $201
endproc DF_target_fragsFilter 0 12
export DF_target_speed_husk
proc DF_target_speed_husk 4 12
line 175
;173:
;174:// this is just a husk, we will convert it to a trigger_push_velocity.
;175:void DF_target_speed_husk(gentity_t* ent) {
line 176
;176:	if (!G_SpawnFloat("speed", "100", &ent->speed)) {
ADDRGP4 $209
ARGP4
ADDRGP4 $210
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $207
line 177
;177:		ent->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTF4 1120403456
ASGNF4
line 178
;178:	}
LABELV $207
line 179
;179:}
LABELV $206
endproc DF_target_speed_husk 4 12
export Use_Target_Print
proc Use_Target_Print 4 28
line 188
;180:
;181:
;182://==========================================================
;183:
;184:/*QUAKED target_print (1 0 0) (-8 -8 -8) (8 8 8) redteam blueteam private
;185:"message"	text to print
;186:If "private", only the activator gets the message.  If no checks, all clients get the message.
;187:*/
;188:void Use_Target_Print (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 189
;189:	if ( activator->client && ( ent->spawnflags & 4 ) ) {
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $212
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $212
line 190
;190:		G_CenterPrint( activator-g_entities,3, ent->message,qfalse,qtrue,qfalse, NULL);
ADDRFP4 8
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
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_CenterPrint
CALLV
pop
line 191
;191:		return;
ADDRGP4 $211
JUMPV
LABELV $212
line 194
;192:	}
;193:
;194:	if ( ent->spawnflags & 3 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $214
line 195
;195:		if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $216
line 196
;196:			G_TeamCommand( TEAM_RED, va("cp \"%s\"", ent->message) );
ADDRGP4 $218
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 197
;197:		}
LABELV $216
line 198
;198:		if ( ent->spawnflags & 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $211
line 199
;199:			G_TeamCommand( TEAM_BLUE, va("cp \"%s\"", ent->message) );
ADDRGP4 $218
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_TeamCommand
CALLV
pop
line 200
;200:		}
line 201
;201:		return;
ADDRGP4 $211
JUMPV
LABELV $214
line 204
;202:	}
;203:
;204:	G_CenterPrint( -1, 3,ent->message,qfalse,qfalse ,qfalse, NULL);
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_CenterPrint
CALLV
pop
line 205
;205:}
LABELV $211
endproc Use_Target_Print 4 28
export SP_target_print
proc SP_target_print 0 0
line 207
;206:
;207:void SP_target_print( gentity_t *ent ) {
line 208
;208:	ent->use = Use_Target_Print;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 Use_Target_Print
ASGNP4
line 209
;209:}
LABELV $221
endproc SP_target_print 0 0
export Use_Target_Speaker
proc Use_Target_Speaker 4 12
line 227
;210:
;211:
;212://==========================================================
;213:
;214:
;215:/*QUAKED target_speaker (1 0 0) (-8 -8 -8) (8 8 8) looped-on looped-off global activator
;216:"noise"		wav file to play
;217:
;218:A global sound will play full volume throughout the level.
;219:Activator sounds will play on the player that activated the target.
;220:Global and activator sounds can't be combined with looping.
;221:Normal sounds play each time the target is used.
;222:Looped sounds will be toggled by use functions.
;223:Multiple identical looping sounds will just increase volume without any speed cost.
;224:"wait" : Seconds between auto triggerings, 0 = don't auto trigger
;225:"random"	wait variance, default is 0
;226:*/
;227:void Use_Target_Speaker (gentity_t *ent, gentity_t *other, gentity_t *activator) {
line 228
;228:	if (ent->spawnflags & 3) {	// looping sound toggles
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $223
line 229
;229:		if (ent->s.loopSound)
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 0
EQI4 $225
line 230
;230:		{
line 231
;231:			ent->s.loopSound = 0;	// turn it off
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 232
;232:			ent->s.trickedentindex = 1;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 233
;233:		}
ADDRGP4 $224
JUMPV
LABELV $225
line 235
;234:		else
;235:		{
line 236
;236:			ent->s.loopSound = ent->noise_index;	// start it
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ASGNI4
line 237
;237:			ent->s.trickedentindex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 238
;238:		}
line 239
;239:	}else {	// normal sound
ADDRGP4 $224
JUMPV
LABELV $223
line 240
;240:		if ( ent->spawnflags & 8 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $227
line 241
;241:			G_AddEvent( activator, EV_GENERAL_SOUND, ent->noise_index );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 242
;242:		} else if (ent->spawnflags & 4) {
ADDRGP4 $228
JUMPV
LABELV $227
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $229
line 243
;243:			G_AddEvent( ent, EV_GLOBAL_SOUND, ent->noise_index );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 67
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 244
;244:		} else {
ADDRGP4 $230
JUMPV
LABELV $229
line 245
;245:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->noise_index );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 246
;246:		}
LABELV $230
LABELV $228
line 247
;247:	}
LABELV $224
line 248
;248:}
LABELV $222
endproc Use_Target_Speaker 4 12
export SP_target_speaker
proc SP_target_speaker 92 12
line 250
;249:
;250:void SP_target_speaker( gentity_t *ent ) {
line 254
;251:	char	buffer[MAX_QPATH];
;252:	char	*s;
;253:
;254:	G_SpawnFloat( "wait", "0", &ent->wait );
ADDRGP4 $157
ARGP4
ADDRGP4 $156
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 255
;255:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $232
ARGP4
ADDRGP4 $156
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 257
;256:
;257:	if ( !G_SpawnString( "noise", "NOSOUND", &s ) ) {
ADDRGP4 $235
ARGP4
ADDRGP4 $236
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 68
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $233
line 258
;258:		G_Error( "target_speaker without a noise key at %s", vtos( ent->s.origin ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $237
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 259
;259:	}
LABELV $233
line 263
;260:
;261:	// force all client reletive sounds to be "activator" speakers that
;262:	// play on the entity that activates it
;263:	if ( s[0] == '*' ) {
ADDRLP4 64
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $238
line 264
;264:		ent->spawnflags |= 8;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 265
;265:	}
LABELV $238
line 267
;266:
;267:	Q_strncpyz( buffer, s, sizeof(buffer) );
ADDRLP4 0
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 269
;268:
;269:	ent->noise_index = G_SoundIndex(buffer);
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 272
;270:
;271:	// a repeating speaker can be done completely client side
;272:	ent->s.eType = ET_SPEAKER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 9
ASGNI4
line 273
;273:	ent->s.eventParm = ent->noise_index;
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 256
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ASGNI4
line 274
;274:	ent->s.frame = ent->wait * 10;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 224
ADDP4
CNSTF4 1092616192
ADDRLP4 80
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 275
;275:	ent->s.clientNum = ent->random * 10;
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 220
ADDP4
CNSTF4 1092616192
ADDRLP4 84
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 279
;276:
;277:
;278:	// check for prestarted looping sound
;279:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $240
line 280
;280:		ent->s.loopSound = ent->noise_index;
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ASGNI4
line 281
;281:	}
LABELV $240
line 283
;282:
;283:	ent->use = Use_Target_Speaker;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 Use_Target_Speaker
ASGNP4
line 285
;284:
;285:	if (ent->spawnflags & 4) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $242
line 286
;286:		ent->r.svFlags |= SVF_BROADCAST;
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 287
;287:	}
LABELV $242
line 289
;288:
;289:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 293
;290:
;291:	// must link the entity so we get areas and clusters so
;292:	// the server can determine who to send updates to
;293:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 294
;294:}
LABELV $231
endproc SP_target_speaker 92 12
export target_laser_think
proc target_laser_think 1144 32
line 303
;295:
;296:
;297:
;298://==========================================================
;299:
;300:/*QUAKED target_laser (0 .5 .8) (-8 -8 -8) (8 8 8) START_ON
;301:When triggered, fires a laser.  You can either set a target or a direction.
;302:*/
;303:void target_laser_think (gentity_t *self) {
line 309
;304:	vec3_t	end;
;305:	trace_t	tr;
;306:	vec3_t	point;
;307:
;308:	// if pointed at another entity, set movedir to point at it
;309:	if ( self->enemy ) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $245
line 310
;310:		VectorMA (self->enemy->s.origin, 0.5, self->enemy->r.mins, point);
ADDRLP4 1104
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 1108
ADDRLP4 1104
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1112
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 1108
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 1112
INDIRF4
ADDRLP4 1108
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1116
ADDRLP4 1104
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 1116
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 1112
INDIRF4
ADDRLP4 1116
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1120
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 1120
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 1120
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 311
;311:		VectorMA (point, 0.5, self->enemy->r.maxs, point);
ADDRLP4 1124
CNSTF4 1056964608
ASGNF4
ADDRLP4 1128
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 1124
INDIRF4
ADDRLP4 1128
INDIRP4
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1124
INDIRF4
ADDRLP4 1128
INDIRP4
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1056964608
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 312
;312:		VectorSubtract (point, self->s.origin, self->movedir);
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 620
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 1132
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 1136
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 628
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 1140
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 313
;313:		VectorNormalize (self->movedir);
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 314
;314:	}
LABELV $245
line 317
;315:
;316:	// fire forward and see what we hit
;317:	VectorMA (self->s.origin, 2048, self->movedir, end);
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1108
CNSTF4 1157627904
ASGNF4
ADDRLP4 12
ADDRLP4 1104
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 1108
INDIRF4
ADDRLP4 1104
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 1104
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 1108
INDIRF4
ADDRLP4 1104
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 1112
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1157627904
ADDRLP4 1112
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 319
;318:
;319:	JP_Trace( &tr, self->s.origin, NULL, NULL, end, self->s.number, CONTENTS_SOLID|CONTENTS_BODY|CONTENTS_CORPSE);
ADDRLP4 24
ARGP4
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 1120
CNSTP4 0
ASGNP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1116
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 321
;320:
;321:	if ( tr.entityNum ) {
ADDRLP4 24+52
INDIRI4
CNSTI4 0
EQI4 $257
line 323
;322:		// hurt it if we can
;323:		G_Damage ( &g_entities[tr.entityNum], self, self->activator, self->movedir, 
CNSTI4 2352
ADDRLP4 24+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
CNSTI4 620
ADDP4
ARGP4
ADDRLP4 24+12
ARGP4
ADDRLP4 1124
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 36
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 325
;324:			tr.endpos, self->damage, DAMAGE_NO_KNOCKBACK, MOD_TARGET_LASER);
;325:	}
LABELV $257
line 327
;326:
;327:	VectorCopy (tr.endpos, self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 24+12
INDIRB
ASGNB 12
line 329
;328:
;329:	trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 330
;330:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 331
;331:}
LABELV $244
endproc target_laser_think 1144 32
export target_laser_on
proc target_laser_on 4 8
line 334
;332:
;333:void target_laser_on (gentity_t *self)
;334:{
line 335
;335:	if (!self->activator)
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $265
line 336
;336:		G_SetActivator(self, self);
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
ADDRGP4 G_SetActivator
CALLV
pop
LABELV $265
line 338
;337:		//self->activator = self;
;338:	target_laser_think (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_think
CALLV
pop
line 339
;339:}
LABELV $264
endproc target_laser_on 4 8
export target_laser_off
proc target_laser_off 0 4
line 342
;340:
;341:void target_laser_off (gentity_t *self)
;342:{
line 343
;343:	trap_UnlinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 344
;344:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 345
;345:}
LABELV $267
endproc target_laser_off 0 4
export target_laser_use
proc target_laser_use 0 8
line 348
;346:
;347:void target_laser_use (gentity_t *self, gentity_t *other, gentity_t *activator)
;348:{
line 350
;349:	//self->activator = activator;
;350:	G_SetActivator(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 351
;351:	if ( self->nextthink > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
LEI4 $269
line 352
;352:		target_laser_off (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
ADDRGP4 $270
JUMPV
LABELV $269
line 354
;353:	else
;354:		target_laser_on (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
LABELV $270
line 355
;355:}
LABELV $268
endproc target_laser_use 0 8
export target_laser_start
proc target_laser_start 16 16
line 358
;356:
;357:void target_laser_start (gentity_t *self)
;358:{
line 361
;359:	gentity_t *ent;
;360:
;361:	self->s.eType = ET_BEAM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
line 363
;362:
;363:	if (self->target) {
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $272
line 364
;364:		ent = G_Find (NULL, FOFS(targetname), self->target);
CNSTP4 0
ARGP4
CNSTI4 596
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 365
;365:		if (!ent) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $274
line 366
;366:			G_Printf ("%s at %s: %s is a bad target\n", self->classname, vtos(self->s.origin), self->target);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $276
ARGP4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 367
;367:		}
LABELV $274
line 368
;368:		self->enemy = ent;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 369
;369:	} else {
ADDRGP4 $273
JUMPV
LABELV $272
line 370
;370:		G_SetMovedir (self->s.angles, self->movedir);
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
line 371
;371:	}
LABELV $273
line 373
;372:
;373:	self->use = target_laser_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 target_laser_use
ASGNP4
line 374
;374:	self->think = target_laser_think;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 target_laser_think
ASGNP4
line 376
;375:
;376:	if ( !self->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $277
line 377
;377:		self->damage = 1;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 1
ASGNI4
line 378
;378:	}
LABELV $277
line 380
;379:
;380:	if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $279
line 381
;381:		target_laser_on (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_on
CALLV
pop
ADDRGP4 $280
JUMPV
LABELV $279
line 383
;382:	else
;383:		target_laser_off (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 target_laser_off
CALLV
pop
LABELV $280
line 384
;384:}
LABELV $271
endproc target_laser_start 16 16
export SP_target_laser
proc SP_target_laser 4 0
line 387
;385:
;386:void SP_target_laser (gentity_t *self)
;387:{
line 389
;388:	// let everything else get spawned before we start firing
;389:	self->think = target_laser_start;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 target_laser_start
ASGNP4
line 390
;390:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 392
;391:
;392:	level.nonDeterministicEntities++;
ADDRLP4 0
ADDRGP4 level+9148
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 393
;393:}
LABELV $281
endproc SP_target_laser 4 0
export target_teleporter_use
proc target_teleporter_use 16 12
line 398
;394:
;395:
;396://==========================================================
;397:
;398:void target_teleporter_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 401
;399:	gentity_t	*dest;
;400:
;401:	if (!activator->client)
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $285
line 402
;402:		return;
ADDRGP4 $284
JUMPV
LABELV $285
line 403
;403:	if (activator->client->noclip)
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $287
line 404
;404:		return;
ADDRGP4 $284
JUMPV
LABELV $287
line 405
;405:	dest = 	G_PickTarget( self->target, !activator->client->sess.raceMode, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $290
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $291
JUMPV
LABELV $290
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $291
ADDRLP4 4
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 406
;406:	if (!dest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $292
line 407
;407:		G_Printf ("Couldn't find teleporter destination\n");
ADDRGP4 $294
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 408
;408:		return;
ADDRGP4 $284
JUMPV
LABELV $292
line 412
;409:	}
;410:
;411:	//if (!other->client->pers.raceStartCommandTime) {
;412:		activator->client->sess.raceStateSoftInvalidated = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43520
ADDP4
CNSTI4 1
ASGNI4
line 415
;413:	//}
;414:
;415:	TeleportPlayer( activator, dest->s.origin, dest->s.angles );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 416
;416:}
LABELV $284
endproc target_teleporter_use 16 12
export SP_target_teleporter
proc SP_target_teleporter 4 12
line 421
;417:
;418:/*QUAKED target_teleporter (1 0 0) (-8 -8 -8) (8 8 8)
;419:The activator will be teleported away.
;420:*/
;421:void SP_target_teleporter( gentity_t *self ) {
line 422
;422:	if (!self->targetname)
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $296
line 423
;423:		G_Printf("untargeted %s at %s\n", self->classname, vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $298
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $296
line 425
;424:
;425:	self->use = target_teleporter_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 target_teleporter_use
ASGNP4
line 426
;426:}
LABELV $295
endproc SP_target_teleporter 4 12
export target_relay_use
proc target_relay_use 40 12
line 436
;427:
;428://==========================================================
;429:
;430:
;431:/*QUAKED target_relay (.5 .5 .5) (-8 -8 -8) (8 8 8) RED_ONLY BLUE_ONLY RANDOM
;432:This doesn't perform any actions except fire its targets.
;433:The activator can be forced to be from a certain team.
;434:if RANDOM is checked, only one of the targets will be fired, not all of them
;435:*/
;436:void target_relay_use (gentity_t *self, gentity_t *other, gentity_t *activator) {
line 437
;437:	if ( ( self->spawnflags & 1 ) && activator->client 
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
BANDI4
CNSTI4 0
EQI4 $300
ADDRLP4 4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $300
ADDRLP4 4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $300
line 438
;438:		&& activator->client->sess.sessionTeam != TEAM_RED ) {
line 439
;439:		return;
ADDRGP4 $299
JUMPV
LABELV $300
line 441
;440:	}
;441:	if ( ( self->spawnflags & 2 ) && activator->client 
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
BANDI4
CNSTI4 0
EQI4 $302
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $302
ADDRLP4 12
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $302
line 442
;442:		&& activator->client->sess.sessionTeam != TEAM_BLUE ) {
line 443
;443:		return;
ADDRGP4 $299
JUMPV
LABELV $302
line 445
;444:	}
;445:	if ( self->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $304
line 448
;446:		gentity_t	*ent;
;447:
;448:		ent = G_PickTarget( self->target, !activator->client->sess.raceMode, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $307
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $308
JUMPV
LABELV $307
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $308
ADDRLP4 20
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 24
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 24
INDIRP4
ASGNP4
line 449
;449:		if ( ent && ent->use ) {
ADDRLP4 28
ADDRLP4 16
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
EQU4 $299
ADDRLP4 28
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $299
line 450
;450:			ent->use( ent, self, activator );
ADDRLP4 36
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CALLV
pop
line 451
;451:		}
line 452
;452:		return;
ADDRGP4 $299
JUMPV
LABELV $304
line 454
;453:	}
;454:	G_UseTargets (self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 455
;455:}
LABELV $299
endproc target_relay_use 40 12
export SP_target_relay
proc SP_target_relay 4 0
line 457
;456:
;457:void SP_target_relay (gentity_t *self) {
line 458
;458:	self->use = target_relay_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 target_relay_use
ASGNP4
line 460
;459:
;460:	level.nonDeterministicEntities++;
ADDRLP4 0
ADDRGP4 level+9148
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 461
;461:}
LABELV $311
endproc SP_target_relay 4 0
export target_kill_markcallers
proc target_kill_markcallers 16 12
line 469
;462:
;463:
;464://==========================================================
;465:
;466:/*QUAKED target_kill (.5 .5 .5) (-8 -8 -8) (8 8 8)
;467:Kills the activator.
;468:*/
;469:void target_kill_markcallers( gentity_t *self) {
line 471
;470:	gentity_t* caller;
;471:	self->think = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTP4 0
ASGNP4
line 472
;472:	self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 474
;473:
;474:	if (!self->targetname) {
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $314
line 475
;475:		return;
ADDRGP4 $313
JUMPV
LABELV $314
line 478
;476:	}
;477:
;478:	caller = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $317
JUMPV
LABELV $316
line 480
;479:	// find anyone who calls us
;480:	while (caller = G_Find(caller, FOFS(target), self->targetname)) {
line 482
;481:
;482:		if (caller->r.bmodel && (caller->r.contents & CONTENTS_TRIGGER)) { // this is a trigger that calls kill. make sure bubble spawn never spawns us inside this or on top of it
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $319
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $319
line 483
;483:			caller->r.contents |= CONTENTS_NOSPAWN;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIU4 4
CNSTU4 536870912
BORU4
CVUI4 4
ASGNI4
line 484
;484:			if (coolApi & COOL_APIFEATURE_G_SETBRUSHMODELCONTENTFLAGS) {
ADDRGP4 coolApi
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $321
line 486
;485:				// this way our bubble spawn can tell not to spawn on top of or in this
;486:				trap_G_COOL_API_SetBrushModelContentFlags(self, CONTENTS_NOSPAWN, COOLAPI_BMODELCFLAGS_ADD);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 536870912
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_G_COOL_API_SetBrushModelContentFlags
CALLI4
pop
line 487
;487:			}
LABELV $321
line 488
;488:		}
LABELV $319
line 489
;489:	}
LABELV $317
line 480
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 592
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_Find
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
NEU4 $316
line 490
;490:}
LABELV $313
endproc target_kill_markcallers 16 12
export target_kill_use
proc target_kill_use 8 32
line 491
;491:void target_kill_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 492
;492:	G_Damage ( activator, NULL, NULL, NULL, NULL, 100000, DAMAGE_NO_PROTECTION| DAMAGE_IN_RACEMODE, MOD_TELEFRAG);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 4104
ARGI4
CNSTI4 33
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 493
;493:}
LABELV $323
endproc target_kill_use 8 32
export SP_target_kill
proc SP_target_kill 0 0
line 495
;494:
;495:void SP_target_kill( gentity_t *self ) {
line 496
;496:	self->use = target_kill_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 target_kill_use
ASGNP4
line 497
;497:	if (self->targetname) {
ADDRFP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $325
line 498
;498:		self->think = target_kill_markcallers;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 target_kill_markcallers
ASGNP4
line 499
;499:		self->nextthink = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 500
;500:	}
LABELV $325
line 501
;501:}
LABELV $324
endproc SP_target_kill 0 0
export SP_target_position
proc SP_target_position 4 8
line 506
;502:
;503:/*QUAKED target_position (0 0.5 0) (-4 -4 -4) (4 4 4)
;504:Used as a positional target for in-game calculation, like jumppad targets.
;505:*/
;506:void SP_target_position( gentity_t *self ){
line 507
;507:	G_SetOrigin( self, self->s.origin );
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
line 508
;508:}
LABELV $328
endproc SP_target_position 4 8
proc target_location_linkup 16 8
line 511
;509:
;510:static void target_location_linkup(gentity_t *ent)
;511:{
line 515
;512:	int i;
;513:	int n;
;514:
;515:	if (level.locationLinked) 
ADDRGP4 level+9068
INDIRI4
CNSTI4 0
EQI4 $330
line 516
;516:		return;
ADDRGP4 $329
JUMPV
LABELV $330
line 518
;517:
;518:	level.locationLinked = qtrue;
ADDRGP4 level+9068
CNSTI4 1
ASGNI4
line 520
;519:
;520:	level.locationHead = NULL;
ADDRGP4 level+9072
CNSTP4 0
ASGNP4
line 522
;521:
;522:	trap_SetConfigstring( CS_LOCATIONS, "unknown" );
CNSTI4 640
ARGI4
ADDRGP4 $335
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 524
;523:
;524:	for (i = 0, ent = g_entities, n = 1;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $339
JUMPV
LABELV $336
line 526
;525:			i < level.num_entities;
;526:			i++, ent++) {
line 527
;527:		if (ent->classname && !Q_stricmp(ent->classname, "target_location")) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $341
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $343
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $341
line 529
;528:			// lets overload some variables!
;529:			ent->health = n; // use for location marking
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 530
;530:			trap_SetConfigstring( CS_LOCATIONS + n, ent->message );
ADDRLP4 4
INDIRI4
CNSTI4 640
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 531
;531:			n++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 532
;532:			ent->nextTrain = level.locationHead;
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDRGP4 level+9072
INDIRP4
ASGNP4
line 533
;533:			level.locationHead = ent;
ADDRGP4 level+9072
ADDRFP4 0
INDIRP4
ASGNP4
line 534
;534:		}
LABELV $341
line 535
;535:	}
LABELV $337
line 526
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2352
ADDP4
ASGNP4
LABELV $339
line 525
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $336
line 538
;536:
;537:	// All linked together now
;538:}
LABELV $329
endproc target_location_linkup 16 8
export SP_target_location
proc SP_target_location 4 8
line 548
;539:
;540:/*QUAKED target_location (0 0.5 0) (-8 -8 -8) (8 8 8)
;541:Set "message" to the name of this location.
;542:Set "count" to 0-7 for color.
;543:0:white 1:red 2:green 3:yellow 4:blue 5:cyan 6:magenta 7:white
;544:
;545:Closest target_location in sight used for the location, if none
;546:in site, closest in distance
;547:*/
;548:void SP_target_location( gentity_t *self ){
line 549
;549:	self->think = target_location_linkup;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 target_location_linkup
ASGNP4
line 550
;550:	self->nextthink = level.time + 200;  // Let them all spawn first
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 552
;551:
;552:	G_SetOrigin( self, self->s.origin );
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
line 553
;553:}
LABELV $346
endproc SP_target_location 4 8
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
LABELV $343
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $335
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $298
byte 1 117
byte 1 110
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $294
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
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $276
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
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
LABELV $237
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 97
byte 1 107
byte 1 101
byte 1 114
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
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $236
byte 1 78
byte 1 79
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $235
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $232
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $218
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $210
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $209
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $205
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $197
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $196
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $195
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 47
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $167
byte 1 0
align 1
LABELV $166
byte 1 43
byte 1 0
align 1
LABELV $164
byte 1 94
byte 1 55
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 94
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $158
byte 1 49
byte 1 0
align 1
LABELV $157
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $156
byte 1 48
byte 1 0
align 1
LABELV $155
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
