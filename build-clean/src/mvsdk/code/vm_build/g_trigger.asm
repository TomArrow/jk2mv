export InitTrigger
code
proc InitTrigger 12 12
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_trigger.c"
line 7
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:int gTrigFallSound;
;6:
;7:void InitTrigger( gentity_t *self ) {
line 8
;8:	if (!VectorCompare (self->s.angles, vec3_origin))
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $123
line 9
;9:		G_SetMovedir (self->s.angles, self->movedir);
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
LABELV $123
line 11
;10:
;11:	trap_SetBrushModel( self, self->model );
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
line 12
;12:	self->r.contents = CONTENTS_TRIGGER;		// replaces the -1 from trap_SetBrushModel
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 13
;13:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 1
ASGNI4
line 15
;14:
;15:	if (coolApi & COOL_APIFEATURE_G_SETBRUSHMODELCONTENTFLAGS) {
ADDRGP4 coolApi
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $125
line 20
;16:		// It can happen (ported maps from other games or other reasons) that the brushes of a trigger don't end up with 
;17:		// CONTENTS_TRIGGER, which means we cannot trace them.
;18:		// This isn't a problem with classic trigger evaluation, because only the entity's own contents is evaluated (not the contents of all its brushes)
;19:		// but with g_triggersRobust we need to fix this up.
;20:		trap_G_COOL_API_SetBrushModelContentFlags(self, CONTENTS_TRIGGER, COOLAPI_BMODELCFLAGS_ADD);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_G_COOL_API_SetBrushModelContentFlags
CALLI4
pop
line 21
;21:		trap_G_COOL_API_SetBrushModelContentFlags(self, CONTENTS_SOLID, COOLAPI_BMODELCFLAGS_REMOVE); // CONTENTS_SOLID would also mess with our trigger tracing
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_G_COOL_API_SetBrushModelContentFlags
CALLI4
pop
line 22
;22:	}
LABELV $125
line 25
;23:
;24:	// Tunnel high modelindex values through time2
;25:	MV_ModelindexToTime2( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MV_ModelindexToTime2
CALLV
pop
line 26
;26:}
LABELV $122
endproc InitTrigger 12 12
export multi_wait
proc multi_wait 0 0
line 30
;27:
;28:
;29:// the wait time has passed, so set back up for another activation
;30:void multi_wait( gentity_t *ent ) {
line 31
;31:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 32
;32:}
LABELV $127
endproc multi_wait 0 0
export multi_trigger
proc multi_trigger 104 12
line 38
;33:
;34:
;35:// the trigger was just activated
;36:// ent->activator should be set to the activator so it can be held through a delay
;37:// so wait for the delay time before firing
;38:void multi_trigger( gentity_t *ent, gentity_t *activator ) {
line 39
;39:	gentity_t *rofftarget = NULL, *testent = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRLP4 0
CNSTP4 0
ASGNP4
line 41
;40:	gentity_t *te;
;41:	int i = MAX_CLIENTS;
ADDRLP4 4
CNSTI4 32
ASGNI4
line 42
;42:	int nowTime = LEVELTIME(activator->client);
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
EQU4 $133
ADDRLP4 32
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $133
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $135
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $136
JUMPV
LABELV $135
ADDRLP4 28
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $136
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $133
ADDRLP4 24
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $134
ADDRLP4 16
ADDRLP4 24
INDIRI4
ASGNI4
line 43
;43:	qboolean isRacer = activator->client && activator->client->sess.raceMode;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $138
ADDRLP4 40
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $138
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $138
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $139
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 45
;44:
;45:	if (ent->teamnodmg &&
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $140
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 56
CNSTU4 0
ASGNU4
ADDRLP4 52
INDIRP4
CVPU4 4
ADDRLP4 56
INDIRU4
EQU4 $140
ADDRLP4 60
ADDRLP4 52
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRLP4 56
INDIRU4
EQU4 $140
ADDRLP4 44
INDIRI4
ADDRLP4 60
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
NEI4 $140
ADDRGP4 g_ff_objectives+12
INDIRI4
ADDRLP4 48
INDIRI4
NEI4 $140
line 49
;46:		activator && activator->client &&
;47:		ent->teamnodmg == (int)activator->client->sess.sessionTeam &&
;48:		!g_ff_objectives.integer)
;49:	{
line 50
;50:		return;
ADDRGP4 $128
JUMPV
LABELV $140
line 53
;51:	}
;52:
;53:	if (ent->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $143
line 54
;54:	{
line 55
;55:		if (!activator || !activator->client)
ADDRLP4 64
ADDRFP4 4
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
EQU4 $147
ADDRLP4 64
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
NEU4 $145
LABELV $147
line 56
;56:		{
line 57
;57:			return;
ADDRGP4 $128
JUMPV
LABELV $145
line 60
;58:		}
;59:
;60:		if (!(activator->client->pers.cmd.buttons & BUTTON_USE))
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $148
line 61
;61:		{
line 62
;62:			return;
ADDRGP4 $128
JUMPV
LABELV $148
line 64
;63:		}
;64:	}
LABELV $143
line 67
;65:
;66:	//ent->activator = activator;
;67:	G_SetActivator(ent, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 68
;68:	if (g_defrag.integer && ent->wait < 0 && activator->client->entityStates[ent - g_entities]) { // once per respawn in defrag.
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $150
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
GEF4 $150
ADDRLP4 68
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
ADDRLP4 64
INDIRI4
EQI4 $150
line 69
;69:		return;
ADDRGP4 $128
JUMPV
LABELV $150
line 71
;70:	}
;71:	else if (isRacer) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $153
line 72
;72:		if (activator->client->triggerTimes[ent - g_entities] >= nowTime) {
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
ADDRLP4 16
INDIRI4
LTI4 $154
line 73
;73:			return; // i hope this somewhat replicates the behavior accurately while keeping things deterministic?
ADDRGP4 $128
JUMPV
line 75
;74:		}
;75:	}
LABELV $153
line 76
;76:	else {
line 77
;77:		if ( ent->nextthink ) {
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $157
line 78
;78:			return;		// can't retrigger until the wait is over
ADDRGP4 $128
JUMPV
LABELV $157
line 80
;79:		}
;80:	}
LABELV $154
line 82
;81:
;82:	if ( activator && activator->client ) {
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
CNSTU4 0
ASGNU4
ADDRLP4 72
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRU4
EQU4 $159
ADDRLP4 72
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRU4
EQU4 $159
line 83
;83:		if ( ( ent->spawnflags & 2 ) &&
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $161
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 1
EQI4 $161
line 84
;84:			activator->client->sess.sessionTeam != TEAM_RED ) {
line 85
;85:			return;
ADDRGP4 $128
JUMPV
LABELV $161
line 87
;86:		}
;87:		if ( ( ent->spawnflags & 4 ) &&
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $163
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 2
EQI4 $163
line 88
;88:			activator->client->sess.sessionTeam != TEAM_BLUE ) {
line 89
;89:			return;
ADDRGP4 $128
JUMPV
LABELV $163
line 91
;90:		}
;91:	}
LABELV $159
line 93
;92:
;93:	G_UseTargets (ent, ent->activator);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 95
;94:
;95:	if (ent->roffname && ent->roffid != -1)
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 432
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $165
ADDRLP4 84
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $165
line 96
;96:	{
line 97
;97:		if (ent->rofftarget)
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $167
line 98
;98:		{
ADDRGP4 $170
JUMPV
LABELV $169
line 100
;99:			while (i < MAX_GENTITIES)
;100:			{
line 101
;101:				testent = &g_entities[i];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 103
;102:
;103:				if (testent && testent->targetname && strcmp(testent->targetname, ent->rofftarget) == 0)
ADDRLP4 92
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $172
ADDRLP4 96
ADDRLP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $172
ADDRLP4 96
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $172
line 104
;104:				{
line 105
;105:					rofftarget = testent;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 106
;106:					break;
ADDRGP4 $168
JUMPV
LABELV $172
line 108
;107:				}
;108:				i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 109
;109:			}
LABELV $170
line 99
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $169
line 110
;110:		}
ADDRGP4 $168
JUMPV
LABELV $167
line 112
;111:		else
;112:		{
line 113
;113:			rofftarget = activator;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
line 114
;114:		}
LABELV $168
line 116
;115:
;116:		if (rofftarget)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $174
line 117
;117:		{
line 118
;118:			trap_ROFF_Play(rofftarget->s.number, ent->roffid, qfalse);
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_ROFF_Play
CALLI4
pop
line 125
;119:
;120:			//Play it at the same time on the client, so that we can catch client-side notetrack events and not have to send
;121:			//them over from the server (this wouldn't work for things like effects due to lack of ability to precache them
;122:			//on the server)
;123:
;124:			//remember the entity's original position in case of a server-side "loop" notetrack
;125:			VectorCopy(rofftarget->s.pos.trBase, rofftarget->s.origin2);
ADDRLP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 126
;126:			VectorCopy(rofftarget->s.apos.trBase, rofftarget->s.angles2);
ADDRLP4 8
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 128
;127:
;128:			te = G_TempEntity( rofftarget->s.pos.trBase, EV_PLAY_ROFF );
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 70
ARGI4
ADDRLP4 96
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 96
INDIRP4
ASGNP4
line 129
;129:			te->s.eventParm = ent->roffid;
ADDRLP4 20
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 130
;130:			te->s.weapon = rofftarget->s.number;
ADDRLP4 20
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 8
INDIRP4
INDIRI4
ASGNI4
line 131
;131:			te->s.trickedentindex = 0;
ADDRLP4 20
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 135
;132:
;133:			//But.. this may not produce desired results for clients who connect while a ROFF is playing.
;134:
;135:			rofftarget->roffid = ent->roffid; //let this entity know the most recent ROFF played on him
ADDRLP4 100
CNSTI4 468
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRI4
ASGNI4
line 136
;136:		}
LABELV $174
line 137
;137:	}
LABELV $165
line 139
;138:
;139:	if ( ent->wait > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
LEF4 $176
line 140
;140:		if (isRacer) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $178
line 141
;141:			activator->client->triggerTimes[ent-g_entities] = nowTime + (ent->wait /* + ent->random * crandom() */ ) * 1000; // no random stuff in racemode
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
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
ADDRLP4 16
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 88
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 142
;142:		}
ADDRGP4 $177
JUMPV
LABELV $178
line 143
;143:		else {
line 144
;144:			ent->think = multi_wait;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 multi_wait
ASGNP4
line 145
;145:			ent->nextthink = level.time + (ent->wait + ent->random * crandom()) * 1000;
ADDRLP4 88
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 92
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 88
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
line 146
;146:		}
line 147
;147:	} else { // why?!
ADDRGP4 $177
JUMPV
LABELV $176
line 150
;148:		// we can't just remove (self) here, because this is a touch function
;149:		// called while looping through area links...
;150:		if (g_defrag.integer) {
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
EQI4 $181
line 151
;151:			if (activator->client) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $182
line 152
;152:				activator->client->entityStates[ent - g_entities] = 1;
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
line 153
;153:			}
line 154
;154:		}
ADDRGP4 $182
JUMPV
LABELV $181
line 155
;155:		else {
line 156
;156:			ent->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 157
;157:			ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 158
;158:			ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 159
;159:		}
LABELV $182
line 160
;160:	}
LABELV $177
line 161
;161:}
LABELV $128
endproc multi_trigger 104 12
export Use_Multi
proc Use_Multi 0 8
line 163
;162:
;163:void Use_Multi( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 164
;164:	multi_trigger( ent, activator );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 165
;165:}
LABELV $187
endproc Use_Multi 0 8
export Touch_Multi
proc Touch_Multi 0 8
line 167
;166:
;167:void Touch_Multi( gentity_t *self, gentity_t *other, trace_t *trace ) {
line 168
;168:	if( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $189
line 169
;169:		return;
ADDRGP4 $188
JUMPV
LABELV $189
line 171
;170:	}
;171:	multi_trigger( self, other );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 172
;172:}
LABELV $188
endproc Touch_Multi 0 8
export SP_trigger_multiple
proc SP_trigger_multiple 12 12
line 188
;173:
;174:/*QUAKED trigger_multiple (.5 .5 .5) ? USE_BUTTON RED_ONLY BLUE_ONLY
;175:USE_BUTTON - Won't fire unless player is in it and pressing use button (in addition to any other conditions)
;176:RED_ONLY - Only red team can use
;177:BLUE_ONLY - Only blue team can use
;178:
;179:"roffname"		If set, will play a roff upon activation
;180:"rofftarget"	If set with roffname, will activate the roff an entity with
;181:				this as its targetname. Otherwise uses roff on activating entity.
;182:"wait" : Seconds between triggerings, 0.5 default, -1 = one time only.
;183:"random"	wait variance, default is 0
;184:Variable sized repeatable trigger.  Must be targeted at one or more entities.
;185:so, the basic time between firing is a random time between
;186:(wait - random) and (wait + random)
;187:*/
;188:void SP_trigger_multiple( gentity_t *ent ) {
line 189
;189:	if (ent->roffname)
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $192
line 190
;190:	{
line 191
;191:		ent->roffid = trap_ROFF_Cache(ent->roffname);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_ROFF_Cache
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 192
;192:	}
ADDRGP4 $193
JUMPV
LABELV $192
line 194
;193:	else
;194:	{
line 195
;195:		ent->roffid = -1;
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 -1
ASGNI4
line 196
;196:	}
LABELV $193
line 198
;197:
;198:	G_SpawnFloat( "wait", "0.5", &ent->wait );
ADDRGP4 $194
ARGP4
ADDRGP4 $195
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 199
;199:	G_SpawnFloat( "random", "0", &ent->random );
ADDRGP4 $196
ARGP4
ADDRGP4 $197
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 201
;200:
;201:	if ( ent->random >= ent->wait && ent->wait >= 0 ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
LTF4 $198
ADDRLP4 4
INDIRF4
CNSTF4 0
LTF4 $198
line 202
;202:		ent->random = ent->wait - FRAMETIME;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 203
;203:		G_Printf( "trigger_multiple has random >= wait\n" );
ADDRGP4 $200
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 204
;204:	}
LABELV $198
line 206
;205:
;206:	ent->touch = Touch_Multi;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 Touch_Multi
ASGNP4
line 207
;207:	ent->use = Use_Multi;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 Use_Multi
ASGNP4
line 209
;208:
;209:	InitTrigger( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 210
;210:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 211
;211:}
LABELV $191
endproc SP_trigger_multiple 12 12
export trigger_always_think
proc trigger_always_think 4 8
line 223
;212:
;213:
;214:
;215:/*
;216:==============================================================================
;217:
;218:trigger_always
;219:
;220:==============================================================================
;221:*/
;222:
;223:void trigger_always_think( gentity_t *ent ) {
line 224
;224:	G_UseTargets(ent, ent);
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
line 225
;225:	G_FreeEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 226
;226:}
LABELV $201
endproc trigger_always_think 4 8
export SP_trigger_always
proc SP_trigger_always 0 0
line 231
;227:
;228:/*QUAKED trigger_always (.5 .5 .5) (-8 -8 -8) (8 8 8)
;229:This trigger will always fire.  It is activated by the world.
;230:*/
;231:void SP_trigger_always (gentity_t *ent) {
line 233
;232:	// we must have some delay to make sure our use targets are present
;233:	ent->nextthink = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 234
;234:	ent->think = trigger_always_think;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 trigger_always_think
ASGNP4
line 235
;235:}
LABELV $202
endproc SP_trigger_always 0 0
export trigger_push_touch
proc trigger_push_touch 36 20
line 246
;236:
;237:
;238:/*
;239:==============================================================================
;240:
;241:trigger_push
;242:
;243:==============================================================================
;244:*/
;245:
;246:void trigger_push_touch(gentity_t *self, gentity_t *other, trace_t *trace ) {
line 248
;247:
;248:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $205
line 249
;249:		return;
ADDRGP4 $204
JUMPV
LABELV $205
line 252
;250:	}
;251:
;252:	if (other->client->sess.raceMode &&
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $207
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $210
ADDRLP4 0
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 8
ADDRGP4 MovementStyleHasVQ3OnlyJumppads
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $209
LABELV $210
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 0
EQI4 $207
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 12
ADDRGP4 MovementStyleHasCPMOnlyJumppads
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $207
LABELV $209
line 255
;253:		(self->notCPM && !MovementStyleHasVQ3OnlyJumppads(other->client->sess.raceStyle.movementStyle)
;254:			|| self->notVQ3 && !MovementStyleHasCPMOnlyJumppads(other->client->sess.raceStyle.movementStyle))
;255:		) {
line 256
;256:		return;
ADDRGP4 $204
JUMPV
LABELV $207
line 259
;257:	}
;258:
;259:	other->client->pers.roll.segmentDisqualified = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43356
ADDP4
CNSTI4 1
ASGNI4
line 261
;260:
;261:	BG_TouchJumpPad( &other->client->ps, &self->s, (other->client->sess.raceMode && (other->client->sess.raceStyle.runFlags & RFL_JUMPPADCOMPENSATE)) ? (other->client->sess.raceStyle.msec == -2 ? -2 : other->client->lastMsecValue) : 0, level.mapDefaultRaceStyle.msec, other->client->sess.raceMode ? other->client->sess.raceStyle.movementStyle : MV_JK2);
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $216
ADDRLP4 28
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 512
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $216
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
CNSTI4 -2
NEI4 $218
ADDRLP4 20
CNSTI4 -2
ASGNI4
ADDRGP4 $219
JUMPV
LABELV $218
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43920
ADDP4
INDIRI4
ASGNI4
LABELV $219
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $217
JUMPV
LABELV $216
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $217
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 level+9116+2
INDIRI2
CVII4 2
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $220
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $220
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $221
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 BG_TouchJumpPad
CALLV
pop
line 262
;262:}
LABELV $204
endproc trigger_push_touch 36 20
export trigger_push_velocity_touch_wait
proc trigger_push_velocity_touch_wait 0 0
line 264
;263:// the wait time has passed, so set back up for another activation
;264:void trigger_push_velocity_touch_wait(gentity_t* ent) {
line 265
;265:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 266
;266:}
LABELV $222
endproc trigger_push_velocity_touch_wait 0 0
export trigger_push_velocity_touch
proc trigger_push_velocity_touch 72 20
line 268
;267:
;268:void trigger_push_velocity_touch (gentity_t *self, gentity_t *other, trace_t *trace ) {
line 271
;269:
;270:	qboolean isRacer;
;271:	int nowTime = LEVELTIME(other->client);
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $228
ADDRLP4 16
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $228
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $230
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $230
ADDRLP4 12
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $231
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $229
JUMPV
LABELV $228
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $229
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 273
;272:
;273:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $232
line 274
;274:		return;
ADDRGP4 $223
JUMPV
LABELV $232
line 277
;275:	}
;276:
;277:	isRacer = other->client && other->client->sess.raceMode;
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
EQU4 $235
ADDRLP4 24
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $235
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $236
JUMPV
LABELV $235
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $236
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 279
;278:
;279:	if (other->client->sess.raceMode && 
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $237
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $240
ADDRLP4 28
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 36
ADDRGP4 MovementStyleHasVQ3OnlyJumppads
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $239
LABELV $240
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
CNSTI4 0
EQI4 $237
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 40
ADDRGP4 MovementStyleHasCPMOnlyJumppads
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $237
LABELV $239
line 282
;280:		(self->notCPM && !MovementStyleHasVQ3OnlyJumppads(other->client->sess.raceStyle.movementStyle)
;281:			|| self->notVQ3 && !MovementStyleHasCPMOnlyJumppads(other->client->sess.raceStyle.movementStyle)			)
;282:		) {
line 283
;283:		return;
ADDRGP4 $223
JUMPV
LABELV $237
line 286
;284:	}
;285:
;286:	other->client->pers.roll.segmentDisqualified = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43356
ADDP4
CNSTI4 1
ASGNI4
line 288
;287:
;288:	if (self->s.saberInFlight) { // its a target_speed converted to a jumppad, so we must consider what would have been "wait" of the trigger_multiple
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
EQI4 $241
line 290
;289:		// evaluate wait.
;290:		if (g_defrag.integer && self->wait < 0 && other->client->entityStates[self - g_entities]) { // once per respawn in defrag.
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $243
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
GEF4 $243
ADDRLP4 48
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
ADDRLP4 44
INDIRI4
EQI4 $243
line 291
;291:			return;
ADDRGP4 $223
JUMPV
LABELV $243
line 293
;292:		}
;293:		else if (isRacer) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $246
line 294
;294:			if (other->client->triggerTimes[self - g_entities] >= nowTime) {
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
ADDRLP4 4
INDIRI4
LTI4 $247
line 295
;295:				return; // i hope this somewhat replicates the behavior accurately while keeping things deterministic?
ADDRGP4 $223
JUMPV
line 297
;296:			}
;297:		}
LABELV $246
line 298
;298:		else {
line 299
;299:			if (self->nextthink) {
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $250
line 300
;300:				return;		// can't retrigger until the wait is over
ADDRGP4 $223
JUMPV
LABELV $250
line 302
;301:			}
;302:		}
LABELV $247
line 303
;303:	}
LABELV $241
line 305
;304:
;305:	BG_TouchJumpPadVelocity( &other->client->ps, &self->s, (other->client->sess.raceMode && (other->client->sess.raceStyle.runFlags & RFL_JUMPPADCOMPENSATE)) ? (other->client->sess.raceStyle.msec == -2 ? -2 : other->client->lastMsecValue) : 0, level.mapDefaultRaceStyle.msec,other->client->sess.raceMode ? other->client->sess.raceStyle.movementStyle : MV_JK2);
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $257
ADDRLP4 56
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 512
BANDI4
ADDRLP4 60
INDIRI4
EQI4 $257
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
CNSTI4 -2
NEI4 $259
ADDRLP4 48
CNSTI4 -2
ASGNI4
ADDRGP4 $260
JUMPV
LABELV $259
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43920
ADDP4
INDIRI4
ASGNI4
LABELV $260
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
ADDRGP4 $258
JUMPV
LABELV $257
ADDRLP4 44
CNSTI4 0
ASGNI4
LABELV $258
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 level+9116+2
INDIRI2
CVII4 2
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $261
ADDRLP4 52
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRGP4 $262
JUMPV
LABELV $261
ADDRLP4 52
CNSTI4 0
ASGNI4
LABELV $262
ADDRLP4 52
INDIRI4
ARGI4
ADDRGP4 BG_TouchJumpPadVelocity
CALLV
pop
line 307
;306:
;307:	if (self->s.saberInFlight) { // its a target_speed converted to a jumppad, so we must consider what would have been "wait" of the trigger_multiple
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
EQI4 $263
line 308
;308:		if (self->wait > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
LEF4 $265
line 309
;309:			if (isRacer) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $267
line 310
;310:				other->client->triggerTimes[self - g_entities] = nowTime + (self->wait /* + ent->random * crandom() */) * 1000; // no random stuff in racemode
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
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
ADDRLP4 4
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 64
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 311
;311:			}
ADDRGP4 $266
JUMPV
LABELV $267
line 312
;312:			else {
line 313
;313:				self->think = multi_wait;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 multi_wait
ASGNP4
line 314
;314:				self->nextthink = level.time + (self->wait + self->random * crandom()) * 1000;
ADDRLP4 64
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 68
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 64
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
line 315
;315:			}
line 316
;316:		}
ADDRGP4 $266
JUMPV
LABELV $265
line 317
;317:		else { // why?!
line 320
;318:		 // we can't just remove (self) here, because this is a touch function
;319:		 // called while looping through area links...
;320:			if (g_defrag.integer) {
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
EQI4 $270
line 321
;321:				if (other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $271
line 322
;322:					other->client->entityStates[self - g_entities] = 1;
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
line 323
;323:				}
line 324
;324:			}
ADDRGP4 $271
JUMPV
LABELV $270
line 325
;325:			else {
line 326
;326:				self->touch = 0;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
CNSTP4 0
ASGNP4
line 327
;327:				self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 328
;328:				self->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 329
;329:			}
LABELV $271
line 330
;330:		}
LABELV $266
line 331
;331:	}
LABELV $263
line 333
;332:
;333:}
LABELV $223
endproc trigger_push_velocity_touch 72 20
export AimAtTarget
proc AimAtTarget 76 12
line 343
;334:
;335:
;336:/*
;337:=================
;338:AimAtTarget
;339:
;340:Calculate origin2 so the target apogee will be hit
;341:=================
;342:*/
;343:void AimAtTarget( gentity_t *self ) {
line 349
;344:	gentity_t	*ent;
;345:	vec3_t		origin;
;346:	float		height, gravity, time, forward;
;347:	float		dist;
;348:
;349:	VectorAdd( self->r.absmin, self->r.absmax, origin );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDF4
ASGNF4
line 350
;350:	VectorScale ( origin, 0.5, origin );
ADDRLP4 44
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 44
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 44
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
line 352
;351:
;352:	ent = G_PickTarget( self->target, !g_defrag.integer, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
NEI4 $285
ADDRLP4 48
CNSTI4 1
ASGNI4
ADDRGP4 $286
JUMPV
LABELV $285
ADDRLP4 48
CNSTI4 0
ASGNI4
LABELV $286
ADDRLP4 48
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 52
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 52
INDIRP4
ASGNP4
line 353
;353:	if ( !ent ) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $287
line 354
;354:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 355
;355:		return;
ADDRGP4 $276
JUMPV
LABELV $287
line 358
;356:	}
;357:
;358:	height = ent->s.origin[2] - origin[2];
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 359
;359:	if ( height <= 0 ) {
ADDRLP4 20
INDIRF4
CNSTF4 0
GTF4 $290
line 360
;360:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 361
;361:		return;
ADDRGP4 $276
JUMPV
LABELV $290
line 363
;362:	}
;363:	gravity = g_gravity.value;
ADDRLP4 24
ADDRGP4 g_gravity+8
INDIRF4
ASGNF4
line 364
;364:	time = sqrt( height / ( .5 * gravity ) );
ADDRLP4 20
INDIRF4
CNSTF4 1056964608
ADDRLP4 24
INDIRF4
MULF4
DIVF4
ARGF4
ADDRLP4 56
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 56
INDIRF4
ASGNF4
line 367
;365:
;366:	// set s.origin2 to the push velocity
;367:	VectorSubtract ( ent->s.origin, origin, self->s.origin2 );
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 368
;368:	self->s.origin2[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTF4 0
ASGNF4
line 369
;369:	dist = VectorNormalize( self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 60
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 60
INDIRF4
ASGNF4
line 371
;370:
;371:	forward = dist / time;
ADDRLP4 16
ADDRLP4 32
INDIRF4
ADDRLP4 28
INDIRF4
DIVF4
ASGNF4
line 372
;372:	VectorScale( self->s.origin2, forward, self->s.origin2 );
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 374
;373:
;374:	self->s.origin2[2] = time * gravity;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 375
;375:}
LABELV $276
endproc AimAtTarget 76 12
export SP_trigger_push
proc SP_trigger_push 12 4
line 382
;376:
;377:
;378:/*QUAKED trigger_push (.5 .5 .5) ?
;379:Must point at a target_position, which will be the apex of the leap.
;380:This will be client side predicted, unlike target_push
;381:*/
;382:void SP_trigger_push( gentity_t *self ) {
line 383
;383:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 386
;384:
;385:	// unlike other triggers, we need to send this one to the client
;386:	self->r.svFlags &= ~SVF_NOCLIENT;
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
CNSTI4 -2
BANDI4
ASGNI4
line 389
;387:
;388:	// make sure the client precaches this sound
;389:	G_SoundIndex("sound/weapons/force/jump.wav");
ADDRGP4 $296
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 391
;390:
;391:	self->s.eType = ET_PUSH_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 392
;392:	self->s.generic1 = self->notCPM;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ASGNI4
line 393
;393:	self->s.genericenemyindex = self->notVQ3;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
line 394
;394:	self->touch = trigger_push_touch;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 trigger_push_touch
ASGNP4
line 395
;395:	self->think = AimAtTarget;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 AimAtTarget
ASGNP4
line 396
;396:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 397
;397:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 398
;398:}
LABELV $295
endproc SP_trigger_push 12 4
export SP_trigger_push_velocity
proc SP_trigger_push_velocity 28 4
line 400
;399:
;400:void SP_trigger_push_velocity( gentity_t *self ) {
line 401
;401:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 404
;402:
;403:	// unlike other triggers, we need to send this one to the client
;404:	self->r.svFlags &= ~SVF_NOCLIENT;
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
CNSTI4 -2
BANDI4
ASGNI4
line 407
;405:
;406:	// make sure the client precaches this sound
;407:	G_SoundIndex("sound/weapons/force/jump.wav");
ADDRGP4 $296
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 409
;408:
;409:	self->s.eType = ET_PUSH_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 410
;410:	self->touch = trigger_push_velocity_touch;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 trigger_push_velocity_touch
ASGNP4
line 411
;411:	self->think = AimAtTarget;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 AimAtTarget
ASGNP4
line 412
;412:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 413
;413:	self->s.weapon = self->spawnflags;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 414
;414:	self->s.angles2[0] = self->speed;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ASGNF4
line 415
;415:	self->s.angles2[1] = self->speed;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 132
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ASGNF4
line 416
;416:	self->s.angles2[2] = self->count;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 136
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 417
;417:	self->s.generic1 = self->notCPM;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 796
ADDP4
INDIRI4
ASGNI4
line 418
;418:	self->s.genericenemyindex = self->notVQ3;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ASGNI4
line 419
;419:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 420
;420:}
LABELV $298
endproc SP_trigger_push_velocity 28 4
export Use_target_push
proc Use_target_push 28 12
line 423
;421:
;422:
;423:void Use_target_push( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 424
;424:	if ( !activator->client ) {
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $301
line 425
;425:		return;
ADDRGP4 $300
JUMPV
LABELV $301
line 428
;426:	}
;427:
;428:	if ( activator->client->ps.pm_type != PM_NORMAL && activator->client->ps.pm_type != PM_FLOAT ) {
ADDRLP4 0
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $303
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $303
line 429
;429:		return;
ADDRGP4 $300
JUMPV
LABELV $303
line 432
;430:	}
;431:
;432:	VectorCopy (self->s.origin2, activator->client->ps.velocity);
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 435
;433:
;434:	// play fly sound every 1.5 seconds
;435:	if ( activator->fly_sound_debounce_time < LEVELTIME(activator->client) ) {
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
EQU4 $311
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $311
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $313
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $314
JUMPV
LABELV $313
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $314
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $312
JUMPV
LABELV $311
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $312
ADDRFP4 8
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $305
line 436
;436:		activator->fly_sound_debounce_time = LEVELTIME(activator->client) + 1500;
ADDRLP4 24
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $319
ADDRLP4 24
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $319
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $321
ADDRLP4 20
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $322
JUMPV
LABELV $321
ADDRLP4 20
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $322
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $320
JUMPV
LABELV $319
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $320
ADDRFP4 8
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 437
;437:		if (self->noise_index)
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 0
EQI4 $323
line 438
;438:		{
line 439
;439:			G_Sound( activator, CHAN_AUTO, self->noise_index );
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 440
;440:		}
LABELV $323
line 441
;441:	}
LABELV $305
line 442
;442:}
LABELV $300
endproc Use_target_push 28 12
export SP_target_push
proc SP_target_push 36 8
line 449
;443:
;444:/*QUAKED target_push (.5 .5 .5) (-8 -8 -8) (8 8 8) bouncepad
;445:Pushes the activator in the direction.of angle, or towards a target apex.
;446:"speed"		defaults to 1000
;447:if "bouncepad", play bounce noise instead of none
;448:*/
;449:void SP_target_push( gentity_t *self ) {
line 450
;450:	if (!self->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
CNSTF4 0
NEF4 $326
line 451
;451:		self->speed = 1000;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTF4 1148846080
ASGNF4
line 452
;452:	}
LABELV $326
line 453
;453:	G_SetMovedir (self->s.angles, self->s.origin2);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 454
;454:	VectorScale (self->s.origin2, self->speed, self->s.origin2);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
MULF4
ASGNF4
line 456
;455:
;456:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $328
line 457
;457:		self->noise_index = G_SoundIndex("sound/weapons/force/jump.wav");
ADDRGP4 $296
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 458
;458:	} else {
ADDRGP4 $329
JUMPV
LABELV $328
line 459
;459:		self->noise_index = 0;	//G_SoundIndex("sound/misc/windfly.wav");
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 460
;460:	}
LABELV $329
line 461
;461:	if ( self->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $330
line 462
;462:		VectorCopy( self->s.origin, self->r.absmin );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 344
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 463
;463:		VectorCopy( self->s.origin, self->r.absmax );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 356
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 464
;464:		self->think = AimAtTarget;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 AimAtTarget
ASGNP4
line 465
;465:		self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 466
;466:	}
LABELV $330
line 467
;467:	self->use = Use_target_push;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 Use_target_push
ASGNP4
line 468
;468:}
LABELV $325
endproc SP_target_push 36 8
export trigger_teleporter_setupdefaulttarget
proc trigger_teleporter_setupdefaulttarget 12 12
line 478
;469:
;470:/*
;471:==============================================================================
;472:
;473:trigger_teleport
;474:
;475:==============================================================================
;476:*/
;477:
;478:void trigger_teleporter_setupdefaulttarget(gentity_t* self) {
line 480
;479:	gentity_t* dest;
;480:	int numChoices = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 481
;481:	dest = G_PickTarget(self->target, qfalse, &numChoices);
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 482
;482:	if (!dest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $334
line 483
;483:		self->s.trickedentindex3 = 0; // we won't ever be able to do this, therefore don't tell clients to predict.
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 485
;484:		// really may as well free the entity?
;485:		G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 486
;486:		G_Printf("Couldn't set up teleporter destination. Removing teleporter.\n");
ADDRGP4 $336
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 487
;487:		return;
ADDRGP4 $333
JUMPV
LABELV $334
line 491
;488:	}
;489:
;490:	// for racers, just pick the first one.
;491:	VectorCopy(dest->s.origin,self->s.origin2); // could use pos.trBase/apos.trBase too since better network-wise? idk.
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
line 492
;492:	VectorCopy(dest->s.angles,self->s.angles2);
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 494
;493:
;494:	if (numChoices == 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $337
line 495
;495:		self->s.trickedentindex3 = 2; // there's only one possible target, we can ALWAYS predict this. :)
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 2
ASGNI4
line 496
;496:	}
LABELV $337
line 497
;497:}
LABELV $333
endproc trigger_teleporter_setupdefaulttarget 12 12
export trigger_teleporter_touch
proc trigger_teleporter_touch 20 12
line 499
;498:
;499:void trigger_teleporter_touch (gentity_t *self, gentity_t *other, trace_t *trace ) {
line 502
;500:	gentity_t	*dest;
;501:
;502:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $340
line 503
;503:		return;
ADDRGP4 $339
JUMPV
LABELV $340
line 505
;504:	}
;505:	if ( other->client->ps.pm_type == PM_DEAD) {
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $342
line 506
;506:		return;
ADDRGP4 $339
JUMPV
LABELV $342
line 508
;507:	}
;508:	if (other->client->noclip) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $344
line 509
;509:		return;
ADDRGP4 $339
JUMPV
LABELV $344
line 512
;510:	}
;511:	// Spectators only?
;512:	if ( ( self->spawnflags & 1 ) && 
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $346
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $346
line 513
;513:		other->client->sess.sessionTeam != TEAM_SPECTATOR ) {
line 514
;514:		return;
ADDRGP4 $339
JUMPV
LABELV $346
line 517
;515:	}
;516:
;517:	dest = 	G_PickTarget( self->target, !other->client->sess.raceMode, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $349
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $350
JUMPV
LABELV $349
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $350
ADDRLP4 8
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 12
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 518
;518:	if (!dest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $351
line 519
;519:		G_Printf ("Couldn't find teleporter destination\n");
ADDRGP4 $353
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 520
;520:		return;
ADDRGP4 $339
JUMPV
LABELV $351
line 524
;521:	}
;522:
;523:	//if (!other->client->pers.raceStartCommandTime) {
;524:		other->client->sess.raceStateSoftInvalidated = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43520
ADDP4
CNSTI4 1
ASGNI4
line 527
;525:	//}
;526:
;527:	TeleportPlayer( other, dest->s.origin, dest->s.angles );
ADDRFP4 4
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
line 528
;528:}
LABELV $339
endproc trigger_teleporter_touch 20 12
export SP_trigger_teleport
proc SP_trigger_teleport 4 4
line 539
;529:
;530:
;531:/*QUAKED trigger_teleport (.5 .5 .5) ? SPECTATOR
;532:Allows client side prediction of teleportation events.
;533:Must point at a target_position, which will be the teleport destination.
;534:
;535:If spectator is set, only spectators can use this teleport
;536:Spectator teleporters are not normally placed in the editor, but are created
;537:automatically near doors to allow spectators to move through them
;538:*/
;539:void SP_trigger_teleport( gentity_t *self ) {
line 540
;540:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 544
;541:
;542:	// unlike other triggers, we need to send this one to the client
;543:	// unless is a spectator trigger
;544:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $355
line 545
;545:		self->r.svFlags |= SVF_NOCLIENT;
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
CNSTI4 1
BORI4
ASGNI4
line 546
;546:	} else {
ADDRGP4 $356
JUMPV
LABELV $355
line 547
;547:		self->r.svFlags &= ~SVF_NOCLIENT;
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
CNSTI4 -2
BANDI4
ASGNI4
line 548
;548:	}
LABELV $356
line 551
;549:
;550:	// make sure the client precaches this sound
;551:	G_SoundIndex("sound/weapons/force/speed.wav");
ADDRGP4 $357
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 553
;552:
;553:	self->s.eType = ET_TELEPORT_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 11
ASGNI4
line 554
;554:	self->touch = trigger_teleporter_touch;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 trigger_teleporter_touch
ASGNP4
line 557
;555:
;556:	// for cgame prediction:
;557:	self->think = trigger_teleporter_setupdefaulttarget;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 trigger_teleporter_setupdefaulttarget
ASGNP4
line 558
;558:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 559
;559:	self->s.weapon = self->spawnflags;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 560
;560:	self->s.trickedentindex3 = 1; // tell cgame that this one can be predicted
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 1
ASGNI4
line 562
;561:
;562:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 563
;563:}
LABELV $354
endproc SP_trigger_teleport 4 4
export hurt_use
proc hurt_use 8 8
line 587
;564:
;565:
;566:/*
;567:==============================================================================
;568:
;569:trigger_hurt
;570:
;571:==============================================================================
;572:*/
;573:
;574:/*QUAKED trigger_hurt (.5 .5 .5) ? START_OFF CAN_TARGET SILENT NO_PROTECTION SLOW
;575:Any entity that touches this will be hurt.
;576:It does dmg points of damage each server frame
;577:Targeting the trigger will toggle its on / off state.
;578:
;579:SILENT			supresses playing the sound
;580:SLOW			changes the damage rate to once per second
;581:NO_PROTECTION	*nothing* stops the damage
;582:
;583:"dmg"			default 5 (whole numbers only)
;584:If dmg is set to -1 this brush will use the fade-kill method
;585:
;586:*/
;587:void hurt_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 588
;588:	if (activator && activator->inuse && activator->client)
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
EQU4 $360
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $360
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $360
line 589
;589:	{
line 591
;590:		//self->activator = activator;
;591:		G_SetActivator(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 592
;592:	}
ADDRGP4 $361
JUMPV
LABELV $360
line 594
;593:	else
;594:	{
line 596
;595:		//self->activator = NULL;
;596:		G_SetActivator(self, NULL);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 597
;597:	}
LABELV $361
line 599
;598:
;599:	if ( self->r.linked ) {
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 0
EQI4 $362
line 600
;600:		trap_UnlinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 601
;601:	} else {
ADDRGP4 $363
JUMPV
LABELV $362
line 602
;602:		trap_LinkEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 603
;603:	}
LABELV $363
line 604
;604:}
LABELV $359
endproc hurt_use 8 8
export hurt_touch
proc hurt_touch 92 32
line 606
;605:
;606:void hurt_touch( gentity_t *self, gentity_t *other, trace_t *trace ) {
line 608
;607:	int			dflags;
;608:	int			nowTime = LEVELTIME(other->client);
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
EQU4 $369
ADDRLP4 24
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $369
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $371
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
ADDRGP4 $372
JUMPV
LABELV $371
ADDRLP4 20
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $372
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $370
JUMPV
LABELV $369
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $370
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
line 609
;609:	qboolean	raceMode = other->client && other->client->sess.raceMode;
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
EQU4 $374
ADDRLP4 32
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $374
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $375
JUMPV
LABELV $374
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $375
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 610
;610:	int*		timeStamp = raceMode ? &other->client->triggerTimes[self-g_entities] : &self->timestamp;
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $377
ADDRLP4 36
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
ASGNP4
ADDRGP4 $378
JUMPV
LABELV $377
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
ASGNP4
LABELV $378
ADDRLP4 4
ADDRLP4 36
INDIRP4
ASGNP4
line 612
;611:
;612:	if ( !other->takedamage ) {
ADDRFP4 4
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
NEI4 $379
line 613
;613:		return;
ADDRGP4 $364
JUMPV
LABELV $379
line 616
;614:	}
;615:
;616:	if (*timeStamp > nowTime) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $381
line 617
;617:		return;
ADDRGP4 $364
JUMPV
LABELV $381
line 620
;618:	}
;619:
;620:	if (self->damage == -1 && other && other->client && other->health < 1)
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $383
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
CNSTU4 0
ASGNU4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $383
ADDRLP4 40
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRU4
EQU4 $383
ADDRLP4 40
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $383
line 621
;621:	{
line 622
;622:		other->client->ps.fallingToDeath = 0;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
CNSTI4 0
ASGNI4
line 623
;623:		respawn(other);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 624
;624:		return;
ADDRGP4 $364
JUMPV
LABELV $383
line 627
;625:	}
;626:
;627:	if (self->damage == -1 && other && other->client && other->client->ps.fallingToDeath)
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $385
ADDRLP4 48
ADDRFP4 4
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
EQU4 $385
ADDRLP4 56
ADDRLP4 48
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
ADDRLP4 52
INDIRU4
EQU4 $385
ADDRLP4 56
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $385
line 628
;628:	{
line 629
;629:		return;
ADDRGP4 $364
JUMPV
LABELV $385
line 632
;630:	}
;631:
;632:	if ( self->spawnflags & 16 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $387
line 633
;633:		*timeStamp = nowTime + 1000;
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 634
;634:	} else {
ADDRGP4 $388
JUMPV
LABELV $387
line 635
;635:		*timeStamp = nowTime + FRAMETIME;
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 636
;636:	}
LABELV $388
line 639
;637:
;638:	// play sound
;639:	if ( !(self->spawnflags & 4) && self->damage != -1 ) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $389
ADDRLP4 60
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $389
line 640
;640:		G_Sound( other, CHAN_AUTO, self->noise_index );
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 641
;641:	}
LABELV $389
line 643
;642:
;643:	if (self->spawnflags & 8)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $391
line 644
;644:		dflags = DAMAGE_NO_PROTECTION;
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRGP4 $392
JUMPV
LABELV $391
line 646
;645:	else
;646:		dflags = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $392
line 648
;647:
;648:	if (self->damage == -1 && other && other->client)
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $393
ADDRLP4 64
ADDRFP4 4
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
EQU4 $393
ADDRLP4 64
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 68
INDIRU4
EQU4 $393
line 649
;649:	{
line 650
;650:		if (other->client->ps.otherKillerTime > nowTime)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $395
line 651
;651:		{ //we're as good as dead, so if someone pushed us into this then remember them
line 652
;652:			other->client->ps.otherKillerTime = nowTime + 20000;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 20000
ADDI4
ASGNI4
line 653
;653:			other->client->ps.otherKillerDebounceTime = nowTime + 10000;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 654
;654:		}
LABELV $395
line 655
;655:		other->client->ps.fallingToDeath = nowTime;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 657
;656:
;657:		*timeStamp = 0; //do not ignore others
ADDRLP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 658
;658:		G_EntitySound(other, CHAN_VOICE, G_SoundIndex("*falling1.wav"));
ADDRGP4 $397
ARGP4
ADDRLP4 72
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 G_EntitySound
CALLV
pop
line 659
;659:	}
ADDRGP4 $394
JUMPV
LABELV $393
line 661
;660:	else	
;661:	{
line 662
;662:		int dmg = self->damage;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
ASGNI4
line 664
;663:
;664:		if (dmg == -1)
ADDRLP4 72
INDIRI4
CNSTI4 -1
NEI4 $398
line 665
;665:		{ //so fall-to-blackness triggers destroy evertyhing
line 666
;666:			dmg = 99999;
ADDRLP4 72
CNSTI4 99999
ASGNI4
line 667
;667:			*timeStamp = 0;
ADDRLP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 668
;668:		}
LABELV $398
line 669
;669:		if (self->activator && self->activator->inuse && self->activator->client)
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
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
EQU4 $400
ADDRLP4 76
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $400
ADDRLP4 76
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $400
line 670
;670:		{
line 671
;671:			G_Damage (other, self->activator, self->activator, NULL, NULL, dmg, dflags|DAMAGE_NO_PROTECTION, MOD_TRIGGER_HURT);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
CNSTP4 0
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 8
BORI4
ARGI4
CNSTI4 37
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 672
;672:		}
ADDRGP4 $401
JUMPV
LABELV $400
line 674
;673:		else
;674:		{
line 675
;675:			G_Damage (other, self, self, NULL, NULL, dmg, dflags|DAMAGE_NO_PROTECTION, MOD_TRIGGER_HURT);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
CNSTP4 0
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 8
BORI4
ARGI4
CNSTI4 37
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 676
;676:		}
LABELV $401
line 677
;677:	}
LABELV $394
line 678
;678:}
LABELV $364
endproc hurt_touch 92 32
export SP_trigger_hurt
proc SP_trigger_hurt 8 12
line 680
;679:
;680:void SP_trigger_hurt( gentity_t *self ) {
line 681
;681:	InitTrigger (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 683
;682:
;683:	gTrigFallSound = G_SoundIndex("*falling1.wav");
ADDRGP4 $397
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gTrigFallSound
ADDRLP4 0
INDIRI4
ASGNI4
line 685
;684:
;685:	self->noise_index = G_SoundIndex( "sound/weapons/force/speed.wav" );
ADDRGP4 $357
ARGP4
ADDRLP4 4
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 686
;686:	self->touch = hurt_touch;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 hurt_touch
ASGNP4
line 688
;687:
;688:	if ( !self->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $403
line 689
;689:		self->damage = 5;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 5
ASGNI4
line 690
;690:	}
LABELV $403
line 692
;691:
;692:	self->r.contents = CONTENTS_TRIGGER | CONTENTS_NOSPAWN;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 536871936
ASGNI4
line 694
;693:
;694:	if (coolApi & COOL_APIFEATURE_G_SETBRUSHMODELCONTENTFLAGS) {
ADDRGP4 coolApi
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $405
line 696
;695:		// this way our bubble spawn can tell not to spawn on top of or in this
;696:		trap_G_COOL_API_SetBrushModelContentFlags(self, CONTENTS_NOSPAWN, COOLAPI_BMODELCFLAGS_ADD);
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
line 697
;697:	}
LABELV $405
line 699
;698:
;699:	if ( self->spawnflags & 2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $407
line 700
;700:		self->use = hurt_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 hurt_use
ASGNP4
line 701
;701:	}
LABELV $407
line 704
;702:
;703:	// link in to the world if starting active
;704:	if ( ! (self->spawnflags & 1) ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $409
line 705
;705:		trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 706
;706:	}
ADDRGP4 $410
JUMPV
LABELV $409
line 707
;707:	else if (self->r.linked)
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 0
EQI4 $411
line 708
;708:	{
line 709
;709:		trap_UnlinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 710
;710:	}
LABELV $411
LABELV $410
line 711
;711:}
LABELV $402
endproc SP_trigger_hurt 8 12
export func_timer_think
proc func_timer_think 12 8
line 734
;712:
;713:
;714:/*
;715:==============================================================================
;716:
;717:timer
;718:
;719:==============================================================================
;720:*/
;721:
;722:
;723:/*QUAKED func_timer (0.3 0.1 0.6) (-8 -8 -8) (8 8 8) START_ON
;724:This should be renamed trigger_timer...
;725:Repeatedly fires its targets.
;726:Can be turned on or off by using.
;727:
;728:"wait"			base time between triggering all targets, default is 1
;729:"random"		wait variance, default is 0
;730:so, the basic time between firing is a random time between
;731:(wait - random) and (wait + random)
;732:
;733:*/
;734:void func_timer_think( gentity_t *self ) {
line 735
;735:	G_UseTargets (self, self->activator);
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
line 737
;736:	// set time before next firing
;737:	if (g_defrag.integer) {
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
EQI4 $414
line 738
;738:		self->nextthink = level.time + 1000 * ( self->wait );
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
CVIF4 4
CNSTF4 1148846080
ADDRLP4 4
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 739
;739:	}
ADDRGP4 $415
JUMPV
LABELV $414
line 740
;740:	else {
line 741
;741:		self->nextthink = level.time + 1000 * ( self->wait + crandom() * self->random );
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
CVIF4 4
CNSTF4 1148846080
ADDRLP4 8
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 4
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
MULF4
ADDF4
CVFI4 4
ASGNI4
line 742
;742:	}
LABELV $415
line 743
;743:}
LABELV $413
endproc func_timer_think 12 8
export func_timer_use
proc func_timer_use 0 8
line 745
;744:
;745:void func_timer_use( gentity_t *self, gentity_t *other, gentity_t *activator ) {
line 747
;746:	//self->activator = activator;
;747:	G_SetActivator(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 750
;748:
;749:	// if on, turn it off
;750:	if ( self->nextthink ) {
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
CNSTI4 0
EQI4 $420
line 751
;751:		self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 752
;752:		return;
ADDRGP4 $419
JUMPV
LABELV $420
line 756
;753:	}
;754:
;755:	// turn it on
;756:	func_timer_think (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 func_timer_think
CALLV
pop
line 757
;757:}
LABELV $419
endproc func_timer_use 0 8
export SP_func_timer
proc SP_func_timer 12 12
line 759
;758:
;759:void SP_func_timer( gentity_t *self ) {
line 760
;760:	G_SpawnFloat( "random", "1", &self->random);
ADDRGP4 $196
ARGP4
ADDRGP4 $423
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 761
;761:	G_SpawnFloat( "wait", "1", &self->wait );
ADDRGP4 $194
ARGP4
ADDRGP4 $423
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 763
;762:
;763:	self->use = func_timer_use;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 func_timer_use
ASGNP4
line 764
;764:	self->think = func_timer_think;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 func_timer_think
ASGNP4
line 766
;765:
;766:	if ( self->random >= self->wait ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
LTF4 $424
line 767
;767:		self->random = self->wait - FRAMETIME;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 768
;768:		G_Printf( "func_timer at %s has random >= wait\n", vtos( self->s.origin ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $426
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 769
;769:	}
LABELV $424
line 771
;770:
;771:	if ( self->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $427
line 772
;772:		self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 774
;773:
;774:		G_SetActivator(self, self);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetActivator
CALLV
pop
line 776
;775:		//self->activator = self;
;776:	}
LABELV $427
line 778
;777:
;778:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 1
ASGNI4
line 780
;779:
;780:	level.nonDeterministicEntities++;
ADDRLP4 4
ADDRGP4 level+9148
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 781
;781:}
LABELV $422
endproc SP_func_timer 12 12
bss
export gTrigFallSound
align 4
LABELV gTrigFallSound
skip 4
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
LABELV $426
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
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
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $423
byte 1 49
byte 1 0
align 1
LABELV $397
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $357
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
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 47
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $353
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
LABELV $336
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 117
byte 1 112
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
byte 1 46
byte 1 32
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 105
byte 1 110
byte 1 103
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
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $296
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
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $200
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $197
byte 1 48
byte 1 0
align 1
LABELV $196
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $195
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $194
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
