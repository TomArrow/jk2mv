data
export saberSpinSound
align 4
LABELV saberSpinSound
byte 4 0
export saberOffSound
align 4
LABELV saberOffSound
byte 4 0
export saberOnSound
align 4
LABELV saberOnSound
byte 4 0
export saberHumSound
align 4
LABELV saberHumSound
byte 4 0
export RandFloat
code
proc RandFloat 8 0
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\w_saber.c"
line 22
;1:#include "g_local.h"
;2:#include "bg_local.h" //Only because we use PM_SetAnim here once.
;3:#include "w_saber.h"
;4:#include "ai_main.h"
;5:#include "../ghoul2/G2.h"
;6:
;7:extern bot_state_t *botstates[MAX_CLIENTS];
;8:extern qboolean InFront( vec3_t spot, vec3_t from, vec3_t fromAngles, float threshHold );
;9:extern int DF_GetRunFlags(gentity_t* ent);
;10:
;11:int saberSpinSound = 0;
;12:int saberOffSound = 0;
;13:int saberOnSound = 0;
;14:int saberHumSound = 0;
;15:
;16://would be cleaner if these were renamed to BG_ and proto'd in a header.
;17:qboolean PM_SaberInTransition( int move );
;18:qboolean PM_SaberInDeflect( int move );
;19:qboolean PM_SaberInBrokenParry( int move );
;20:qboolean PM_SaberInBounce( int move );
;21:
;22:float RandFloat(float min, float max) {
line 23
;23:	return ((myrand() * (max - min)) / 32768.0F) + min; // On linux rand() behaves different than on Winodws or in a qvm, ...
ADDRLP4 0
ADDRGP4 myrand
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
MULF4
CNSTF4 1191182336
DIVF4
ADDRLP4 4
INDIRF4
ADDF4
RETF4
LABELV $127
endproc RandFloat 8 0
export SaberUpdateSelf
proc SaberUpdateSelf 24 4
line 67
;24:}
;25:
;26://#define DEBUG_SABER_BOX
;27:
;28:#ifdef DEBUG_SABER_BOX
;29:void	G_DebugBoxLines(vec3_t mins, vec3_t maxs, int duration)
;30:{
;31:	vec3_t start;
;32:	vec3_t end;
;33:
;34:	float x = maxs[0] - mins[0];
;35:	float y = maxs[1] - mins[1];
;36:
;37:	// top of box
;38:	VectorCopy(maxs, start);
;39:	VectorCopy(maxs, end);
;40:	start[0] -= x;
;41:	G_TestLine(start, end, 0x00000ff, duration);
;42:	end[0] = start[0];
;43:	end[1] -= y;
;44:	G_TestLine(start, end, 0x00000ff, duration);
;45:	start[1] = end[1];
;46:	start[0] += x;
;47:	G_TestLine(start, end, 0x00000ff, duration);
;48:	G_TestLine(start, maxs, 0x00000ff, duration);
;49:	// bottom of box
;50:	VectorCopy(mins, start);
;51:	VectorCopy(mins, end);
;52:	start[0] += x;
;53:	G_TestLine(start, end, 0x00000ff, duration);
;54:	end[0] = start[0];
;55:	end[1] += y;
;56:	G_TestLine(start, end, 0x00000ff, duration);
;57:	start[1] = end[1];
;58:	start[0] -= x;
;59:	G_TestLine(start, end, 0x00000ff, duration);
;60:	G_TestLine(start, mins, 0x00000ff, duration);
;61:}
;62:#endif
;63:
;64:#define PROPER_THROWN_VALUE 999 //Ah, well.. 
;65:
;66:void SaberUpdateSelf(gentity_t *ent)
;67:{
line 68
;68:	if (ent->r.ownerNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $129
line 69
;69:	{
line 70
;70:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 71
;71:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 72
;72:		return;
ADDRGP4 $128
JUMPV
LABELV $129
line 75
;73:	}
;74:
;75:	if (!g_entities[ent->r.ownerNum].inuse ||
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $140
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $140
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $140
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
EQI4 $132
LABELV $140
line 79
;76:		!g_entities[ent->r.ownerNum].client ||
;77:		g_entities[ent->r.ownerNum].client->sess.sessionTeam == TEAM_SPECTATOR ||
;78:		g_entities[ent->r.ownerNum].client->ps.saberEntityNum != ent-g_entities)
;79:	{
line 80
;80:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 81
;81:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 82
;82:		return;
ADDRGP4 $128
JUMPV
LABELV $132
line 85
;83:	}
;84:
;85:	if (g_entities[ent->r.ownerNum].client->ps.saberInFlight && g_entities[ent->r.ownerNum].health > 0)
ADDRLP4 8
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $142
ADDRLP4 8
INDIRI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $142
line 86
;86:	{ //let The Master take care of us now (we'll get treated like a missile until we return)
line 87
;87:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 88
;88:		/*if ( jk2gameplay == VERSION_1_04 )*/ ent->bolt_Head = PROPER_THROWN_VALUE; // MVSDK: This shouldn't affect gameplay.
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 999
ASGNI4
line 89
;89:		return;
ADDRGP4 $128
JUMPV
LABELV $142
line 92
;90:	}
;91:
;92:	/*if ( jk2gameplay == VERSION_1_04 )*/ ent->bolt_Head = 0; // MVSDK: This shouldn't affect gameplay.
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 0
ASGNI4
line 94
;93:
;94:	if (g_entities[ent->r.ownerNum].client->ps.usingATST)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $147
line 95
;95:	{ //using atst
line 96
;96:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 97
;97:		ent->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 98
;98:	}
ADDRGP4 $148
JUMPV
LABELV $147
line 99
;99:	else if (g_entities[ent->r.ownerNum].client->ps.weapon != WP_SABER ||
ADDRLP4 16
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $160
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 20
INDIRI4
NEI4 $160
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
CNSTI4 1
LTI4 $160
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $160
ADDRLP4 16
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $150
LABELV $160
line 104
;100:		(g_entities[ent->r.ownerNum].client->ps.pm_flags & PMF_FOLLOW) ||
;101:		g_entities[ent->r.ownerNum].health < 1 ||
;102:		g_entities[ent->r.ownerNum].client->ps.saberHolstered ||
;103:		!g_entities[ent->r.ownerNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK])
;104:	{ //owner is not using saber, spectating, dead, saber holstered, or has no attack level
line 105
;105:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 106
;106:		ent->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 107
;107:	}
ADDRGP4 $151
JUMPV
LABELV $150
line 109
;108:	else
;109:	{ //Standard contents (saber is active)
line 123
;110:#ifdef DEBUG_SABER_BOX
;111:		vec3_t dbgMins;
;112:		vec3_t dbgMaxs;
;113:
;114:		if (ent->r.ownerNum == 0)
;115:		{
;116:			VectorAdd( ent->r.currentOrigin, ent->r.mins, dbgMins );
;117:			VectorAdd( ent->r.currentOrigin, ent->r.maxs, dbgMaxs );
;118:
;119:			G_DebugBoxLines(dbgMins, dbgMaxs, 100);
;120:		}
;121:#endif
;122:
;123:		ent->r.contents = CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 124
;124:		ent->clipmask = MASK_PLAYERSOLID | CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 262417
ASGNI4
line 125
;125:	}
LABELV $151
LABELV $148
line 127
;126:
;127:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 129
;128:
;129:	ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 130
;130:}
LABELV $128
endproc SaberUpdateSelf 24 4
export SaberGotHit
proc SaberGotHit 12 0
line 133
;131:
;132:void SaberGotHit( gentity_t *self, gentity_t *other, trace_t *trace )
;133:{
line 134
;134:	gentity_t *own = &g_entities[self->r.ownerNum];
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
line 136
;135:
;136:	if (!own || !own->client)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $165
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $163
LABELV $165
line 137
;137:	{
line 138
;138:		return;
LABELV $163
line 142
;139:	}
;140:
;141:	//Do something here..? Was handling projectiles here, but instead they're now handled in their own functions.
;142:}
LABELV $162
endproc SaberGotHit 12 0
export WP_SaberInitBladeData
proc WP_SaberInitBladeData 56 8
line 145
;143:
;144:void WP_SaberInitBladeData( gentity_t *ent )
;145:{
line 150
;146:	gentity_t *saberent;
;147:
;148:	//We do not want the client to have any real knowledge of the entity whatsoever. It will only
;149:	//ever be used on the server.
;150:	saberent = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 151
;151:	ent->client->ps.saberEntityNum = saberent->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 152
;152:	G_SetClassName(saberent, "lightsaber");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $167
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 154
;153:			
;154:	saberent->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 155
;155:	saberent->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 157
;156:
;157:	saberent->clipmask = MASK_PLAYERSOLID | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 262417
ASGNI4
line 158
;158:	saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 160
;159:
;160:	VectorSet( saberent->r.mins, -SABER_BOX_SIZE, -SABER_BOX_SIZE, -SABER_BOX_SIZE );
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $171
ADDRLP4 8
CNSTF4 1090519040
ASGNF4
ADDRGP4 $172
JUMPV
LABELV $171
ADDRLP4 8
CNSTF4 1098907648
ASGNF4
LABELV $172
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $173
ADDRLP4 12
CNSTF4 1090519040
ASGNF4
ADDRGP4 $174
JUMPV
LABELV $173
ADDRLP4 12
CNSTF4 1098907648
ASGNF4
LABELV $174
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $175
ADDRLP4 16
CNSTF4 1090519040
ASGNF4
ADDRGP4 $176
JUMPV
LABELV $175
ADDRLP4 16
CNSTF4 1098907648
ASGNF4
LABELV $176
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 16
INDIRF4
NEGF4
ASGNF4
line 161
;161:	VectorSet( saberent->r.maxs, SABER_BOX_SIZE, SABER_BOX_SIZE, SABER_BOX_SIZE );
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $180
ADDRLP4 20
CNSTF4 1090519040
ASGNF4
ADDRGP4 $181
JUMPV
LABELV $180
ADDRLP4 20
CNSTF4 1098907648
ASGNF4
LABELV $181
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $182
ADDRLP4 24
CNSTF4 1090519040
ASGNF4
ADDRGP4 $183
JUMPV
LABELV $182
ADDRLP4 24
CNSTF4 1098907648
ASGNF4
LABELV $183
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $184
ADDRLP4 28
CNSTF4 1090519040
ASGNF4
ADDRGP4 $185
JUMPV
LABELV $184
ADDRLP4 28
CNSTF4 1098907648
ASGNF4
LABELV $185
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
line 163
;162:
;163:	saberent->mass = 10;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTF4 1092616192
ASGNF4
line 165
;164:
;165:	saberent->s.eFlags |= EF_NODRAW;
ADDRLP4 32
ADDRLP4 0
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
line 166
;166:	saberent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 168
;167:
;168:	saberent->touch = SaberGotHit;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 SaberGotHit
ASGNP4
line 170
;169:
;170:	saberent->think = SaberUpdateSelf;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 171
;171:	/*if ( jk2gameplay == VERSION_1_04 )*/ saberent->bolt_Head = 0; // MVSDK: This shouldn't affect gameplay.
ADDRLP4 0
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 0
ASGNI4
line 172
;172:	saberent->nextthink = level.time + 50;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 174
;173:
;174:	saberSpinSound = G_SoundIndex("sound/weapons/saber/saberspin.wav");
ADDRGP4 $187
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberSpinSound
ADDRLP4 40
INDIRI4
ASGNI4
line 175
;175:	saberOffSound = G_SoundIndex("sound/weapons/saber/saberoffquick.wav");
ADDRGP4 $188
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOffSound
ADDRLP4 44
INDIRI4
ASGNI4
line 176
;176:	saberOnSound = G_SoundIndex("sound/weapons/saber/saberon.wav");
ADDRGP4 $189
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOnSound
ADDRLP4 48
INDIRI4
ASGNI4
line 177
;177:	saberHumSound = G_SoundIndex("sound/weapons/saber/saberhum1.wav");
ADDRGP4 $190
ARGP4
ADDRLP4 52
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberHumSound
ADDRLP4 52
INDIRI4
ASGNI4
line 178
;178:}
LABELV $166
endproc WP_SaberInitBladeData 56 8
export G_G2ClientSpineAngles_1_02
proc G_G2ClientSpineAngles_1_02 192 36
line 182
;179:
;180://NOTE: If C` is modified this function should be modified as well (and vice versa)
;181:void G_G2ClientSpineAngles_1_02( gentity_t *ent, vec3_t viewAngles, const vec3_t angles, vec3_t thoracicAngles, vec3_t ulAngles, vec3_t llAngles )
;182:{
line 183
;183:	int ang = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 184
;184:	const int runFlags = DF_GetRunFlags(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 DF_GetRunFlags
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 185
;185:	int nowTime = LEVELTIME(ent->client);
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
EQU4 $196
ADDRLP4 24
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $196
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $198
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $199
JUMPV
LABELV $198
ADDRLP4 20
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $199
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
ADDRGP4 $197
JUMPV
LABELV $196
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $197
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 187
;186:
;187:	VectorClear(ulAngles);
ADDRLP4 28
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRF4
ASGNF4
line 188
;188:	VectorClear(llAngles);
ADDRLP4 36
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRF4
ASGNF4
line 190
;189:
;190:	viewAngles[YAW] = AngleDelta( ent->client->ps.viewangles[YAW], angles[YAW] );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ARGF4
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 192
;191:
;192:	if ( !BG_FlippingAnim( ent->client->ps.legsAnim ) &&
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $200
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $200
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $200
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $200
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $200
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $200
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $200
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $200
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $200
line 201
;193:		!BG_SpinningSaberAnim( ent->client->ps.legsAnim ) &&
;194:		!BG_SpinningSaberAnim( ent->client->ps.torsoAnim ) &&
;195:		!BG_InSpecialJump( ent->client->ps.legsAnim , runFlags) &&
;196:		!BG_InSpecialJump( ent->client->ps.torsoAnim , runFlags) &&
;197:		!BG_InRoll(&ent->client->ps, ent->client->ps.legsAnim) &&
;198:		!BG_SaberInSpecial(ent->client->ps.saberMove) &&
;199:		!BG_SaberInSpecialAttack(ent->client->ps.torsoAnim) &&
;200:		!BG_SaberInSpecialAttack(ent->client->ps.legsAnim) )
;201:	{
line 206
;202:		//adjust for motion offset
;203:		mdxaBone_t	boltMatrix;
;204:		vec3_t		motionFwd, motionAngles;
;205:
;206:		trap_G2API_GetBoltMatrix_NoReconstruct( ent->client->ghoul2, 0, ent->bolt_Motion, &boltMatrix, vec3_origin, ent->client->ps.origin, level.time, /*cgs.gameModels*/0, vec3_origin); // not using nowTime here because using it on G2 made the server have extreme hitches and idk the cause
ADDRLP4 164
ADDRFP4 0
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
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 164
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ARGP4
ADDRLP4 172
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 168
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix_NoReconstruct
CALLI4
pop
line 217
;207:		//trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, POSITIVE_X, motionFwd );
;208:		//POSITIVE_X:
;209:		/*
;210:		motionFwd[0] = boltMatrix.matrix[0][0];
;211:		motionFwd[1] = boltMatrix.matrix[1][0];
;212:		motionFwd[2] = boltMatrix.matrix[2][0];
;213:		*/
;214:		
;215:
;216:		//NEGATIVE_Y:
;217:		motionFwd[0] = -boltMatrix.matrix[0][1];
ADDRLP4 152
ADDRLP4 104+4
INDIRF4
NEGF4
ASGNF4
line 218
;218:		motionFwd[1] = -boltMatrix.matrix[1][1];
ADDRLP4 152+4
ADDRLP4 104+16+4
INDIRF4
NEGF4
ASGNF4
line 219
;219:		motionFwd[2] = -boltMatrix.matrix[2][1];
ADDRLP4 152+8
ADDRLP4 104+32+4
INDIRF4
NEGF4
ASGNF4
line 221
;220:
;221:		vectoangles( motionFwd, motionAngles );
ADDRLP4 152
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 222
;222:		for ( ang = 0; ang < 3; ang++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $210
line 223
;223:		{
line 224
;224:			viewAngles[ang] = AngleNormalize180( viewAngles[ang] - AngleNormalize180( motionAngles[ang] ) );
ADDRLP4 176
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 176
INDIRI4
ADDRLP4 92
ADDP4
INDIRF4
ARGF4
ADDRLP4 180
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 184
ADDRLP4 176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
INDIRF4
ADDRLP4 180
INDIRF4
SUBF4
ARGF4
ADDRLP4 188
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 184
INDIRP4
ADDRLP4 188
INDIRF4
ASGNF4
line 225
;225:		}
LABELV $211
line 222
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $210
line 227
;226:
;227:		if (viewAngles[YAW] < -90)
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 3266576384
GEF4 $214
line 228
;228:		{
line 229
;229:			viewAngles[YAW] += 360;
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
CNSTF4 1135869952
ADDF4
ASGNF4
line 230
;230:		}
LABELV $214
line 232
;231:
;232:		viewAngles[YAW] -= 90;
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
CNSTF4 1119092736
SUBF4
ASGNF4
line 233
;233:	}
LABELV $200
line 236
;234:	//distribute the angles differently up the spine
;235:	//NOTE: each of these distributions must add up to 1.0f
;236:	thoracicAngles[PITCH] = 0;//viewAngles[PITCH]*0.20f;
ADDRFP4 12
INDIRP4
CNSTF4 0
ASGNF4
line 237
;237:	llAngles[PITCH] = 0;//viewAngles[PITCH]*0.40f;
ADDRFP4 20
INDIRP4
CNSTF4 0
ASGNF4
line 238
;238:	ulAngles[PITCH] = 0;//viewAngles[PITCH]*0.40f;
ADDRFP4 16
INDIRP4
CNSTF4 0
ASGNF4
line 240
;239:
;240:	thoracicAngles[YAW] = viewAngles[YAW]*0.20f - (viewAngles[PITCH]*(viewAngles[YAW]*.020f));
ADDRLP4 92
CNSTI4 4
ASGNI4
ADDRLP4 96
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 96
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRLP4 100
INDIRF4
MULF4
ADDRLP4 96
INDIRP4
INDIRF4
CNSTF4 1017370378
ADDRLP4 100
INDIRF4
MULF4
MULF4
SUBF4
ASGNF4
line 241
;241:	ulAngles[YAW] = viewAngles[YAW]*0.25f - (viewAngles[PITCH]*(viewAngles[YAW]*.0005f));
ADDRLP4 104
CNSTI4 4
ASGNI4
ADDRLP4 108
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 112
ADDRLP4 108
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
CNSTF4 1048576000
ADDRLP4 112
INDIRF4
MULF4
ADDRLP4 108
INDIRP4
INDIRF4
CNSTF4 973279855
ADDRLP4 112
INDIRF4
MULF4
MULF4
SUBF4
ASGNF4
line 242
;242:	llAngles[YAW] = viewAngles[YAW]*0.25f - (viewAngles[PITCH]*(viewAngles[YAW]*.0005f));
ADDRLP4 116
CNSTI4 4
ASGNI4
ADDRLP4 120
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 120
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 20
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
CNSTF4 1048576000
ADDRLP4 124
INDIRF4
MULF4
ADDRLP4 120
INDIRP4
INDIRF4
CNSTF4 973279855
ADDRLP4 124
INDIRF4
MULF4
MULF4
SUBF4
ASGNF4
line 244
;243:
;244:	if (thoracicAngles[YAW] > 20)
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $216
line 245
;245:	{
line 246
;246:		thoracicAngles[YAW] = 20;
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1101004800
ASGNF4
line 247
;247:	}
LABELV $216
line 248
;248:	if (ulAngles[YAW] > 20)
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $218
line 249
;249:	{
line 250
;250:		ulAngles[YAW] = 20;
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1101004800
ASGNF4
line 251
;251:	}
LABELV $218
line 252
;252:	if (llAngles[YAW] > 20)
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $220
line 253
;253:	{
line 254
;254:		llAngles[YAW] = 20;
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1101004800
ASGNF4
line 255
;255:	}
LABELV $220
line 257
;256:
;257:	thoracicAngles[ROLL] = viewAngles[ROLL]*0.20f;
ADDRLP4 128
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 258
;258:	ulAngles[ROLL] = viewAngles[ROLL]*0.35f;
ADDRLP4 132
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
CNSTF4 1051931443
ADDRFP4 4
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 259
;259:	llAngles[ROLL] = viewAngles[ROLL]*0.45f;
ADDRLP4 136
CNSTI4 8
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
CNSTF4 1055286886
ADDRFP4 4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 261
;260:
;261:	for ( ang = 0; ang < 3; ang++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $222
line 262
;262:	{
line 263
;263:		if (ulAngles[ang] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $226
line 264
;264:		{
line 265
;265:			ulAngles[ang] += 360;
ADDRLP4 140
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 266
;266:		}
LABELV $226
line 267
;267:	}
LABELV $223
line 261
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $222
line 276
;268:
;269:	//thoracic is added modified again by neckAngle calculations, so don't set it until then
;270://	BG_G2SetBoneAngles( cent, cent->gent, cent->gent->upperLumbarBone, ulAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.model_draw); 
;271://	BG_G2SetBoneAngles( cent, cent->gent, cent->gent->lowerLumbarBone, llAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.model_draw); 
;272:
;273://	trap_G2API_SetBoneAngles(cent->ghoul2, 0, "upper_lumbar", ulAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
;274://	trap_G2API_SetBoneAngles(cent->ghoul2, 0, "lower_lumbar", llAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
;275://	trap_G2API_SetBoneAngles(cent->ghoul2, 0, "thoracic", thoracicAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
;276:}
LABELV $191
endproc G_G2ClientSpineAngles_1_02 192 36
export G_G2ClientSpineAngles
proc G_G2ClientSpineAngles 172 36
line 278
;277:void G_G2ClientSpineAngles( gentity_t *ent, vec3_t viewAngles, const vec3_t angles, vec3_t thoracicAngles, vec3_t ulAngles, vec3_t llAngles )
;278:{
line 279
;279:	int nowTime = LEVELTIME(ent->client);
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
EQU4 $233
ADDRLP4 12
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $233
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $235
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
ADDRGP4 $236
JUMPV
LABELV $235
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $236
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $234
JUMPV
LABELV $233
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $234
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 280
;280:	if ( jk2version == VERSION_1_02 || jk2gameplay == VERSION_1_02 ) // If either the gameplay demands 1.02 here or if the jk2version is 1.02 and doesn't offer the neccessary syscalls for 1.04 behaviour we are going to call 1.02 behaviour.
ADDRLP4 16
CNSTI4 2
ASGNI4
ADDRGP4 jk2version
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $239
ADDRGP4 jk2gameplay
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $237
LABELV $239
line 281
;281:	{
line 282
;282:		G_G2ClientSpineAngles_1_02( ent, viewAngles, angles, thoracicAngles, ulAngles, llAngles );
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
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 G_G2ClientSpineAngles_1_02
CALLV
pop
line 283
;283:		return;
ADDRGP4 $228
JUMPV
LABELV $237
line 285
;284:	}
;285:	viewAngles[YAW] = AngleDelta( ent->client->ps.viewangles[YAW], angles[YAW] );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
line 287
;286:
;287:	if ( !BG_FlippingAnim( ent->client->ps.legsAnim ) 
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $240
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $240
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $240
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
EQI4 $240
line 291
;288:		&& !BG_SpinningSaberAnim( ent->client->ps.legsAnim ) 
;289:		&& !BG_SpinningSaberAnim( ent->client->ps.torsoAnim )
;290:		&& ent->client->ps.legsAnim != ent->client->ps.torsoAnim )//NOTE: presumes your legs & torso are on the same frame, though they *should* be because PM_SetAnimFinal tries to keep them in synch
;291:	{//FIXME: no need to do this if legs and torso on are same frame
line 298
;292:		//adjust for motion offset
;293:		mdxaBone_t	boltMatrix;
;294:		vec3_t		motionFwd, motionAngles;
;295:		vec3_t		motionRt, tempAng;
;296:		int			ang;
;297:
;298:		trap_G2API_GetBoltMatrix_NoRecNoRot( ent->client->ghoul2, 0, ent->bolt_Motion, &boltMatrix, vec3_origin, ent->client->ps.origin, level.time, /*cgs.gameModels*/0, vec3_origin); // not using nowTime here because using it on G2 made the server have extreme hitches and idk the cause
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
ADDRLP4 144
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 852
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ARGP4
ADDRLP4 152
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix_NoRecNoRot
INDIRP4
CALLI4
pop
line 300
;299:		//trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, NEGATIVE_Y, motionFwd );
;300:		motionFwd[0] = -boltMatrix.matrix[0][1];
ADDRLP4 108
ADDRLP4 60+4
INDIRF4
NEGF4
ASGNF4
line 301
;301:		motionFwd[1] = -boltMatrix.matrix[1][1];
ADDRLP4 108+4
ADDRLP4 60+16+4
INDIRF4
NEGF4
ASGNF4
line 302
;302:		motionFwd[2] = -boltMatrix.matrix[2][1];
ADDRLP4 108+8
ADDRLP4 60+32+4
INDIRF4
NEGF4
ASGNF4
line 304
;303:
;304:		vectoangles( motionFwd, motionAngles );
ADDRLP4 108
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 307
;305:
;306:		//trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, NEGATIVE_X, motionRt );
;307:		motionRt[0] = -boltMatrix.matrix[0][0];
ADDRLP4 120
ADDRLP4 60
INDIRF4
NEGF4
ASGNF4
line 308
;308:		motionRt[1] = -boltMatrix.matrix[1][0];
ADDRLP4 120+4
ADDRLP4 60+16
INDIRF4
NEGF4
ASGNF4
line 309
;309:		motionRt[2] = -boltMatrix.matrix[2][0];
ADDRLP4 120+8
ADDRLP4 60+32
INDIRF4
NEGF4
ASGNF4
line 310
;310:		vectoangles( motionRt, tempAng );
ADDRLP4 120
ARGP4
ADDRLP4 132
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 311
;311:		motionAngles[ROLL] = -tempAng[PITCH];
ADDRLP4 48+8
ADDRLP4 132
INDIRF4
NEGF4
ASGNF4
line 313
;312:
;313:		for ( ang = 0; ang < 3; ang++ )
ADDRLP4 44
CNSTI4 0
ASGNI4
LABELV $255
line 314
;314:		{
line 315
;315:			viewAngles[ang] = AngleNormalize180( viewAngles[ang] - AngleNormalize180( motionAngles[ang] ) );
ADDRLP4 156
ADDRLP4 44
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRLP4 48
ADDP4
INDIRF4
ARGF4
ADDRLP4 160
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 164
ADDRLP4 156
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
INDIRF4
ADDRLP4 160
INDIRF4
SUBF4
ARGF4
ADDRLP4 168
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 164
INDIRP4
ADDRLP4 168
INDIRF4
ASGNF4
line 316
;316:		}
LABELV $256
line 313
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 3
LTI4 $255
line 317
;317:	}
LABELV $240
line 320
;318:	//distribute the angles differently up the spine
;319:	//NOTE: each of these distributions must add up to 1.0f
;320:	thoracicAngles[PITCH] = viewAngles[PITCH]*0.20f;
ADDRFP4 12
INDIRP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 321
;321:	llAngles[PITCH] = viewAngles[PITCH]*0.40f;
ADDRFP4 20
INDIRP4
CNSTF4 1053609165
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 322
;322:	ulAngles[PITCH] = viewAngles[PITCH]*0.40f;
ADDRFP4 16
INDIRP4
CNSTF4 1053609165
ADDRFP4 4
INDIRP4
INDIRF4
MULF4
ASGNF4
line 324
;323:
;324:	thoracicAngles[YAW] = viewAngles[YAW]*0.20f;
ADDRLP4 44
CNSTI4 4
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 325
;325:	ulAngles[YAW] = viewAngles[YAW]*0.35f;
ADDRLP4 48
CNSTI4 4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
CNSTF4 1051931443
ADDRFP4 4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 326
;326:	llAngles[YAW] = viewAngles[YAW]*0.45f;
ADDRLP4 52
CNSTI4 4
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
CNSTF4 1055286886
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 328
;327:
;328:	thoracicAngles[ROLL] = viewAngles[ROLL]*0.20f;
ADDRLP4 56
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 329
;329:	ulAngles[ROLL] = viewAngles[ROLL]*0.35f;
ADDRLP4 60
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
CNSTF4 1051931443
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 330
;330:	llAngles[ROLL] = viewAngles[ROLL]*0.45f;
ADDRLP4 64
CNSTI4 8
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
CNSTF4 1055286886
ADDRFP4 4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 331
;331:}
LABELV $228
endproc G_G2ClientSpineAngles 172 36
data
align 4
LABELV $260
byte 4 0
byte 4 22
byte 4 45
byte 4 -22
byte 4 0
byte 4 22
byte 4 -45
byte 4 -22
lit
align 4
LABELV $261
byte 4 0
byte 4 0
byte 4 0
export G_G2PlayerAngles
code
proc G_G2PlayerAngles 232 44
line 333
;332:
;333:void G_G2PlayerAngles( gentity_t *ent, vec3_t legs[3], vec3_t legsAngles){
line 341
;334:	vec3_t		torsoAngles, headAngles;
;335:	// float		dest;
;336:	static	int	movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;337:	vec3_t		velocity;
;338:	float		speed;
;339:	int			dir;
;340:	vec3_t		velPos, velAng;
;341:	int			adddir = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 343
;342:	float		dif;
;343:	float		degrees_negative = 0;
ADDRLP4 132
CNSTF4 0
ASGNF4
line 344
;344:	float		degrees_positive = 0;
ADDRLP4 136
CNSTF4 0
ASGNF4
line 345
;345:	vec3_t		ulAngles, llAngles, viewAngles, angles, thoracicAngles = {0,0,0};
ADDRLP4 76
ADDRGP4 $261
INDIRB
ASGNB 12
line 346
;346:	int nowTime = LEVELTIME(ent->client);
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
EQU4 $266
ADDRLP4 156
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $266
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $268
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $269
JUMPV
LABELV $268
ADDRLP4 152
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $269
ADDRLP4 148
ADDRLP4 152
INDIRI4
ASGNI4
ADDRGP4 $267
JUMPV
LABELV $266
ADDRLP4 148
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $267
ADDRLP4 144
ADDRLP4 148
INDIRI4
ASGNI4
line 348
;347:
;348:	VectorCopy( ent->client->ps.viewangles, headAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 349
;349:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 24+4
INDIRF4
ARGF4
ADDRLP4 160
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 160
INDIRF4
ASGNF4
line 350
;350:	VectorClear( legsAngles );
ADDRLP4 164
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 168
CNSTF4 0
ASGNF4
ADDRLP4 164
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 168
INDIRF4
ASGNF4
ADDRLP4 164
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 168
INDIRF4
ASGNF4
ADDRLP4 164
INDIRP4
ADDRLP4 168
INDIRF4
ASGNF4
line 351
;351:	VectorClear( torsoAngles );
ADDRLP4 172
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 172
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 172
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 172
INDIRF4
ASGNF4
line 356
;352:
;353:	// --------- yaw -------------
;354:
;355:	// adjust legs for movement dir
;356:	dir = ent->s.angles2[YAW];
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 357
;357:	if ( dir < 0 || dir > 7 ) {
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $276
ADDRLP4 72
INDIRI4
CNSTI4 7
LEI4 $274
LABELV $276
line 358
;358:		return;
ADDRGP4 $259
JUMPV
LABELV $274
line 361
;359:	}
;360:
;361:	torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $260
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 374
;362:
;363:	// --------- pitch -------------
;364:
;365:	/*
;366:	// only show a fraction of the pitch angle in the torso
;367:	if ( headAngles[PITCH] > 180 ) {
;368:		dest = (-360 + headAngles[PITCH]) * 0.75;
;369:	} else {
;370:		dest = headAngles[PITCH] * 0.75;
;371:	}
;372:	*/
;373:
;374:	torsoAngles[PITCH] = ent->client->ps.viewangles[PITCH];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ASGNF4
line 380
;375:
;376:	// --------- roll -------------
;377:
;378:
;379:	// lean towards the direction of travel
;380:	VectorCopy( ent->s.pos.trDelta, velocity );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 381
;381:	speed = VectorNormalize( velocity );
ADDRLP4 12
ARGP4
ADDRLP4 180
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 88
ADDRLP4 180
INDIRF4
ASGNF4
line 383
;382:
;383:	if ( speed ) {
ADDRLP4 88
INDIRF4
CNSTF4 0
EQF4 $279
line 387
;384:		vec3_t	axis[3];
;385:		float	side;
;386:
;387:		speed *= 0.05f;
ADDRLP4 88
CNSTF4 1028443341
ADDRLP4 88
INDIRF4
MULF4
ASGNF4
line 389
;388:
;389:		AnglesToAxis( legsAngles, axis );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 184
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 390
;390:		side = speed * DotProduct( velocity, axis[1] );
ADDRLP4 220
ADDRLP4 88
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 184+12
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 184+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 184+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 391
;391:		legsAngles[ROLL] -= side;
ADDRLP4 224
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 224
INDIRP4
ADDRLP4 224
INDIRP4
INDIRF4
ADDRLP4 220
INDIRF4
SUBF4
ASGNF4
line 393
;392:
;393:		side = speed * DotProduct( velocity, axis[0] );
ADDRLP4 220
ADDRLP4 88
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 184+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 184+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 394
;394:		legsAngles[PITCH] += side;
ADDRLP4 228
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
ADDRLP4 228
INDIRP4
INDIRF4
ADDRLP4 220
INDIRF4
ADDF4
ASGNF4
line 395
;395:	}
LABELV $279
line 398
;396:
;397:	//rww - crazy velocity-based leg angle calculation
;398:	legsAngles[YAW] = headAngles[YAW];
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 24+4
INDIRF4
ASGNF4
line 399
;399:	velPos[0] = ent->client->ps.origin[0] + velocity[0];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 400
;400:	velPos[1] = ent->client->ps.origin[1] + velocity[1];
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDF4
ASGNF4
line 401
;401:	velPos[2] = ent->client->ps.origin[2] + velocity[2];
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDF4
ASGNF4
line 403
;402:
;403:	if (ent->client->ps.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $297
line 404
;404:	{ //off the ground, no direction-based leg angles
line 405
;405:		VectorCopy(ent->client->ps.origin, velPos);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 406
;406:	}
LABELV $297
line 408
;407:
;408:	VectorSubtract(ent->client->ps.origin, velPos, velAng);
ADDRLP4 184
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 48
ADDRLP4 184
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 184
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 36+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 36+8
INDIRF4
SUBF4
ASGNF4
line 410
;409:
;410:	if (!VectorCompare(velAng, vec3_origin))
ADDRLP4 48
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 188
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
NEI4 $303
line 411
;411:	{
line 412
;412:		vectoangles(velAng, velAng);
ADDRLP4 48
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 414
;413:
;414:		if (velAng[YAW] <= legsAngles[YAW])
ADDRLP4 48+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
GTF4 $305
line 415
;415:		{
line 416
;416:			degrees_negative = (legsAngles[YAW] - velAng[YAW]);
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 48+4
INDIRF4
SUBF4
ASGNF4
line 417
;417:			degrees_positive = (360 - legsAngles[YAW]) + velAng[YAW];
ADDRLP4 136
CNSTF4 1135869952
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ADDRLP4 48+4
INDIRF4
ADDF4
ASGNF4
line 418
;418:		}
ADDRGP4 $306
JUMPV
LABELV $305
line 420
;419:		else
;420:		{
line 421
;421:			degrees_negative = legsAngles[YAW] + (360 - velAng[YAW]);
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1135869952
ADDRLP4 48+4
INDIRF4
SUBF4
ADDF4
ASGNF4
line 422
;422:			degrees_positive = (velAng[YAW] - legsAngles[YAW]);
ADDRLP4 136
ADDRLP4 48+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 423
;423:		}
LABELV $306
line 425
;424:
;425:		if (degrees_negative < degrees_positive)
ADDRLP4 132
INDIRF4
ADDRLP4 136
INDIRF4
GEF4 $312
line 426
;426:		{
line 427
;427:			dif = degrees_negative;
ADDRLP4 116
ADDRLP4 132
INDIRF4
ASGNF4
line 428
;428:			adddir = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 429
;429:		}
ADDRGP4 $313
JUMPV
LABELV $312
line 431
;430:		else
;431:		{
line 432
;432:			dif = degrees_positive;
ADDRLP4 116
ADDRLP4 136
INDIRF4
ASGNF4
line 433
;433:			adddir = 1;
ADDRLP4 140
CNSTI4 1
ASGNI4
line 434
;434:		}
LABELV $313
line 436
;435:
;436:		if (dif > 90)
ADDRLP4 116
INDIRF4
CNSTF4 1119092736
LEF4 $314
line 437
;437:		{
line 438
;438:			dif = (180 - dif);
ADDRLP4 116
CNSTF4 1127481344
ADDRLP4 116
INDIRF4
SUBF4
ASGNF4
line 439
;439:		}
LABELV $314
line 441
;440:
;441:		if (dif > 60)
ADDRLP4 116
INDIRF4
CNSTF4 1114636288
LEF4 $316
line 442
;442:		{
line 443
;443:			dif = 60;
ADDRLP4 116
CNSTF4 1114636288
ASGNF4
line 444
;444:		}
LABELV $316
line 447
;445:
;446:		//Slight hack for when playing is running backward
;447:		if (dir == 3 || dir == 5)
ADDRLP4 72
INDIRI4
CNSTI4 3
EQI4 $320
ADDRLP4 72
INDIRI4
CNSTI4 5
NEI4 $318
LABELV $320
line 448
;448:		{
line 449
;449:			dif = -dif;
ADDRLP4 116
ADDRLP4 116
INDIRF4
NEGF4
ASGNF4
line 450
;450:		}
LABELV $318
line 452
;451:
;452:		if (adddir)
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $321
line 453
;453:		{
line 454
;454:			legsAngles[YAW] -= dif;
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
ADDRLP4 116
INDIRF4
SUBF4
ASGNF4
line 455
;455:		}
ADDRGP4 $322
JUMPV
LABELV $321
line 457
;456:		else
;457:		{
line 458
;458:			legsAngles[YAW] += dif;
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
ADDRLP4 116
INDIRF4
ADDF4
ASGNF4
line 459
;459:		}
LABELV $322
line 460
;460:	}
LABELV $303
line 466
;461:
;462:
;463:	// at ridiculously high speeds this can happen
;464:	// causes asasertion fail in anglesubtract
;465:	// idk if this is the right solution
;466:	if (fabsf(legsAngles[PITCH]) >= 1800) {
ADDRFP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 192
ADDRGP4 fabsf
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 1800
LTI4 $323
line 467
;467:		legsAngles[PITCH] = AngleNormalize180(legsAngles[PITCH]);
ADDRLP4 196
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
INDIRF4
ARGF4
ADDRLP4 200
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 196
INDIRP4
ADDRLP4 200
INDIRF4
ASGNF4
line 468
;468:	}
LABELV $323
line 469
;469:	if (fabsf(legsAngles[ROLL]) >= 1800) {
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 196
ADDRGP4 fabsf
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 1800
LTI4 $325
line 470
;470:		legsAngles[ROLL] = AngleNormalize180(legsAngles[ROLL]);
ADDRLP4 200
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 200
INDIRP4
INDIRF4
ARGF4
ADDRLP4 204
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 200
INDIRP4
ADDRLP4 204
INDIRF4
ASGNF4
line 471
;471:	}
LABELV $325
line 473
;472:
;473:	legsAngles[YAW] = ent->client->ps.viewangles[YAW];
ADDRFP4 8
INDIRP4
CNSTI4 4
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
line 475
;474:
;475:	legsAngles[ROLL] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 476
;476:	torsoAngles[ROLL] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 479
;477:
;478:	// pull the angles back out of the hierarchial chain
;479:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 480
;480:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 481
;481:	AnglesToAxis( legsAngles, legs );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 484
;482:	// we assume that model 0 is the player model.
;483:
;484:	VectorCopy( ent->client->ps.viewangles, viewAngles );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 486
;485:
;486:	if (viewAngles[PITCH] > 290)
ADDRLP4 60
INDIRF4
CNSTF4 1133576192
LEF4 $328
line 487
;487:	{ //keep the same general range as lerpAngles on the client so we can use the same spine correction
line 488
;488:		viewAngles[PITCH] -= 360;
ADDRLP4 60
ADDRLP4 60
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 489
;489:	}
LABELV $328
line 491
;490:
;491:	viewAngles[YAW] = viewAngles[ROLL] = 0;
ADDRLP4 200
CNSTF4 0
ASGNF4
ADDRLP4 60+8
ADDRLP4 200
INDIRF4
ASGNF4
ADDRLP4 60+4
ADDRLP4 200
INDIRF4
ASGNF4
line 492
;492:	viewAngles[PITCH] *= 0.5;
ADDRLP4 60
CNSTF4 1056964608
ADDRLP4 60
INDIRF4
MULF4
ASGNF4
line 494
;493:
;494:	if ( jk2gameplay != VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $332
line 495
;495:	{
line 496
;496:		VectorCopy(legsAngles, angles);
ADDRLP4 120
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 497
;497:	}
ADDRGP4 $333
JUMPV
LABELV $332
line 499
;498:	else
;499:	{
line 500
;500:		VectorCopy( ent->client->ps.viewangles, angles );
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 501
;501:		angles[PITCH] = 0;
ADDRLP4 120
CNSTF4 0
ASGNF4
line 502
;502:	}
LABELV $333
line 504
;503:
;504:	G_G2ClientSpineAngles(ent, viewAngles, angles, thoracicAngles, ulAngles, llAngles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 104
ARGP4
ADDRGP4 G_G2ClientSpineAngles
CALLV
pop
line 506
;505:
;506:	if ( jk2gameplay == VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $334
line 507
;507:	{
line 508
;508:		ulAngles[YAW] += torsoAngles[YAW]*0.3;
ADDRLP4 92+4
ADDRLP4 92+4
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 509
;509:		llAngles[YAW] += torsoAngles[YAW]*0.3;
ADDRLP4 104+4
ADDRLP4 104+4
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 510
;510:		thoracicAngles[YAW] += torsoAngles[YAW]*0.4;
ADDRLP4 76+4
ADDRLP4 76+4
INDIRF4
CNSTF4 1053609165
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 512
;511:
;512:		ulAngles[PITCH] = torsoAngles[PITCH]*0.3;
ADDRLP4 92
CNSTF4 1050253722
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 513
;513:		llAngles[PITCH] = torsoAngles[PITCH]*0.3;
ADDRLP4 104
CNSTF4 1050253722
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 514
;514:		thoracicAngles[PITCH] = torsoAngles[PITCH]*0.4;
ADDRLP4 76
CNSTF4 1053609165
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 516
;515:
;516:		ulAngles[ROLL] += torsoAngles[ROLL]*0.3;
ADDRLP4 92+8
ADDRLP4 92+8
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 517
;517:		llAngles[ROLL] += torsoAngles[ROLL]*0.3;
ADDRLP4 104+8
ADDRLP4 104+8
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 518
;518:		thoracicAngles[ROLL] += torsoAngles[ROLL]*0.4;
ADDRLP4 76+8
ADDRLP4 76+8
INDIRF4
CNSTF4 1053609165
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 519
;519:	}
LABELV $334
line 521
;520:
;521:	trap_G2API_SetBoneAngles(ent->client->ghoul2, 0, "upper_lumbar", ulAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 $348
ARGP4
ADDRLP4 92
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
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
INDIRP4
CALLI4
pop
line 522
;522:	trap_G2API_SetBoneAngles(ent->client->ghoul2, 0, "lower_lumbar", llAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
ADDRLP4 208
CNSTI4 0
ASGNI4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 $350
ARGP4
ADDRLP4 104
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
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
INDIRP4
CALLI4
pop
line 523
;523:	trap_G2API_SetBoneAngles(ent->client->ghoul2, 0, "thoracic", thoracicAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time);  // not using nowTime here because using it on G2 made the server have extreme hitches and idk the cause
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
ADDRLP4 212
CNSTI4 0
ASGNI4
ADDRLP4 212
INDIRI4
ARGI4
ADDRGP4 $352
ARGP4
ADDRLP4 76
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
ADDRLP4 212
INDIRI4
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
INDIRP4
CALLI4
pop
line 524
;524:}
LABELV $259
endproc G_G2PlayerAngles 232 44
export SaberAttacking
proc SaberAttacking 28 4
line 527
;525:
;526:qboolean SaberAttacking(gentity_t *self)
;527:{
line 528
;528:	if ( jk2gameplay == VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $355
line 529
;529:	{
line 530
;530:		if (BG_SaberInAttack(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $357
line 531
;531:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $354
JUMPV
LABELV $357
line 533
;532:		else
;533:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $354
JUMPV
LABELV $355
line 535
;534:	}
;535:	if (PM_SaberInParry(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $359
line 536
;536:	{
line 537
;537:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $354
JUMPV
LABELV $359
line 539
;538:	}
;539:	if (PM_SaberInBrokenParry(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $361
line 540
;540:	{
line 541
;541:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $354
JUMPV
LABELV $361
line 543
;542:	}
;543:	if (PM_SaberInDeflect(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $363
line 544
;544:	{
line 545
;545:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $354
JUMPV
LABELV $363
line 547
;546:	}
;547:	if (PM_SaberInBounce(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $365
line 548
;548:	{
line 549
;549:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $354
JUMPV
LABELV $365
line 551
;550:	}
;551:	if (PM_SaberInKnockaway(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 PM_SaberInKnockaway
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $367
line 552
;552:	{
line 553
;553:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $354
JUMPV
LABELV $367
line 556
;554:	}
;555:
;556:	if (BG_SaberInAttack(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $369
line 557
;557:	{
line 558
;558:		if (self->client->ps.weaponstate == WEAPON_FIRING && self->client->ps.saberBlocked == BLOCKED_NONE)
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 3
NEI4 $371
ADDRLP4 24
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $371
line 559
;559:		{ //if we're firing and not blocking, then we're attacking.
line 560
;560:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $354
JUMPV
LABELV $371
line 562
;561:		}
;562:	}
LABELV $369
line 564
;563:
;564:	return qfalse;
CNSTI4 0
RETI4
LABELV $354
endproc SaberAttacking 28 4
export WP_SabersCheckLock2
proc WP_SabersCheckLock2 1904 28
line 587
;565:}
;566:
;567:typedef enum
;568:{
;569:	LOCK_FIRST = 0,
;570:	LOCK_TOP = LOCK_FIRST,
;571:	LOCK_DIAG_TR,
;572:	LOCK_DIAG_TL,
;573:	LOCK_DIAG_BR,
;574:	LOCK_DIAG_BL,
;575:	LOCK_R,
;576:	LOCK_L,
;577:	LOCK_RANDOM
;578:} sabersLockMode_t;
;579:
;580:#define LOCK_IDEAL_DIST_TOP 32.0f
;581:#define LOCK_IDEAL_DIST_CIRCLE 48.0f
;582:
;583:#define SABER_HITDAMAGE 35
;584:void WP_SaberBlockNonRandom( gentity_t *self, vec3_t hitloc, qboolean missileBlock );
;585:
;586:qboolean WP_SabersCheckLock2( gentity_t *attacker, gentity_t *defender, sabersLockMode_t lockMode )
;587:{
line 588
;588:	int		attAnim, defAnim = 0;
ADDRLP4 1708
CNSTI4 0
ASGNI4
line 589
;589:	float	idealDist = 48.0f;
ADDRLP4 1724
CNSTF4 1111490560
ASGNF4
line 593
;590:	vec3_t	attAngles, defAngles, defDir;
;591:	vec3_t	newOrg;
;592:	vec3_t	attDir;
;593:	float	diff = 0;
ADDRLP4 576
CNSTF4 0
ASGNF4
line 596
;594:	trace_t trace;
;595:	pmove_t		pmv; 
;596:	int		nowTime = LEVELTIME(attacker->client);
ADDRLP4 1748
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1748
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $379
ADDRLP4 1748
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $379
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $381
ADDRLP4 1744
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $382
JUMPV
LABELV $381
ADDRLP4 1744
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $382
ADDRLP4 1740
ADDRLP4 1744
INDIRI4
ASGNI4
ADDRGP4 $380
JUMPV
LABELV $379
ADDRLP4 1740
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $380
ADDRLP4 1732
ADDRLP4 1740
INDIRI4
ASGNI4
line 597
;597:	int		nowTimeDefender = LEVELTIME(defender->client);
ADDRLP4 1760
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1760
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $387
ADDRLP4 1760
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $387
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $389
ADDRLP4 1756
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $390
JUMPV
LABELV $389
ADDRLP4 1756
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $390
ADDRLP4 1752
ADDRLP4 1756
INDIRI4
ASGNI4
ADDRGP4 $388
JUMPV
LABELV $387
ADDRLP4 1752
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $388
ADDRLP4 1736
ADDRLP4 1752
INDIRI4
ASGNI4
line 600
;598:
;599:	//MATCH ANIMS
;600:	if ( lockMode == LOCK_RANDOM )
ADDRFP4 8
INDIRI4
CNSTI4 7
NEI4 $391
line 601
;601:	{
line 602
;602:		lockMode = (sabersLockMode_t)Q_irand( (int)LOCK_FIRST, (int)(LOCK_RANDOM)-1 + gRandomUnlockAdd, qfalse, (int)LOCK_FIRST);
ADDRLP4 1764
CNSTI4 0
ASGNI4
ADDRLP4 1764
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 6
ADDI4
ARGI4
ADDRLP4 1764
INDIRI4
ARGI4
ADDRLP4 1764
INDIRI4
ARGI4
ADDRLP4 1768
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 8
ADDRLP4 1768
INDIRI4
ASGNI4
line 603
;603:	}
LABELV $391
line 604
;604:	switch ( lockMode )
ADDRLP4 1764
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 1764
INDIRI4
CNSTI4 0
LTI4 $393
ADDRLP4 1764
INDIRI4
CNSTI4 6
GTI4 $393
ADDRLP4 1764
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $403
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $403
address $396
address $397
address $398
address $399
address $400
address $401
address $402
code
line 605
;605:	{
LABELV $396
line 607
;606:	case LOCK_TOP:
;607:		attAnim = BOTH_BF2LOCK;
ADDRLP4 1728
CNSTI4 550
ASGNI4
line 608
;608:		defAnim = BOTH_BF1LOCK;
ADDRLP4 1708
CNSTI4 553
ASGNI4
line 609
;609:		idealDist = LOCK_IDEAL_DIST_TOP;
ADDRLP4 1724
CNSTF4 1107296256
ASGNF4
line 610
;610:		break;
ADDRGP4 $394
JUMPV
LABELV $397
line 612
;611:	case LOCK_DIAG_TR:
;612:		attAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1728
CNSTI4 561
ASGNI4
line 613
;613:		defAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1708
CNSTI4 560
ASGNI4
line 614
;614:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1724
CNSTF4 1111490560
ASGNF4
line 615
;615:		break;
ADDRGP4 $394
JUMPV
LABELV $398
line 617
;616:	case LOCK_DIAG_TL:
;617:		attAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1728
CNSTI4 560
ASGNI4
line 618
;618:		defAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1708
CNSTI4 561
ASGNI4
line 619
;619:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1724
CNSTF4 1111490560
ASGNF4
line 620
;620:		break;
ADDRGP4 $394
JUMPV
LABELV $399
line 622
;621:	case LOCK_DIAG_BR:
;622:		attAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1728
CNSTI4 560
ASGNI4
line 623
;623:		defAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1708
CNSTI4 561
ASGNI4
line 624
;624:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1724
CNSTF4 1111490560
ASGNF4
line 625
;625:		break;
ADDRGP4 $394
JUMPV
LABELV $400
line 627
;626:	case LOCK_DIAG_BL:
;627:		attAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1728
CNSTI4 561
ASGNI4
line 628
;628:		defAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1708
CNSTI4 560
ASGNI4
line 629
;629:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1724
CNSTF4 1111490560
ASGNF4
line 630
;630:		break;
ADDRGP4 $394
JUMPV
LABELV $401
line 632
;631:	case LOCK_R:
;632:		attAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1728
CNSTI4 561
ASGNI4
line 633
;633:		defAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1708
CNSTI4 560
ASGNI4
line 634
;634:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1724
CNSTF4 1111490560
ASGNF4
line 635
;635:		break;
ADDRGP4 $394
JUMPV
LABELV $402
line 637
;636:	case LOCK_L:
;637:		attAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1728
CNSTI4 560
ASGNI4
line 638
;638:		defAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1708
CNSTI4 561
ASGNI4
line 639
;639:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1724
CNSTF4 1111490560
ASGNF4
line 640
;640:		break;
ADDRGP4 $394
JUMPV
LABELV $393
line 642
;641:	default:
;642:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $374
JUMPV
line 643
;643:		break;
LABELV $394
line 646
;644:	}
;645:
;646:	memset (&pmv, 0, sizeof(pmv));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTU4 576
ARGU4
ADDRGP4 memset
CALLP4
pop
line 647
;647:	pmv.ps = &attacker->client->ps;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 648
;648:	pmv.animations = bgGlobalAnimations;
ADDRLP4 0+260
ADDRGP4 bgGlobalAnimations
ASGNP4
line 649
;649:	pmv.cmd = attacker->client->pers.cmd;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRB
ASGNB 28
line 650
;650:	pmv.trace = JP_Trace;
ADDRLP4 0+300
ADDRGP4 JP_Trace
ASGNP4
line 651
;651:	pmv.rawtrace = trap_Trace;
ADDRLP4 0+472
ADDRGP4 trap_Trace
ASGNP4
line 652
;652:	pmv.pointcontents = trap_PointContents;
ADDRLP4 0+308
ADDRGP4 trap_PointContents
ASGNP4
line 653
;653:	pmv.gametype = g_gametype.integer;
ADDRLP4 0+252
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
line 656
;654:
;655:	//This is a rare exception, you should never really call PM_ utility functions from game or cgame (despite the fact that it's technically possible)
;656:	pm = &pmv;
ADDRGP4 pm
ADDRLP4 0
ASGNP4
line 657
;657:	PM_SetAnim(SETANIM_BOTH, attAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0);
ADDRLP4 1772
CNSTI4 3
ASGNI4
ADDRLP4 1772
INDIRI4
ARGI4
ADDRLP4 1728
INDIRI4
ARGI4
ADDRLP4 1772
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 658
;658:	attacker->client->ps.saberLockFrame = bgGlobalAnimations[attAnim].firstFrame+(bgGlobalAnimations[attAnim].numFrames*0.5);
ADDRLP4 1776
CNSTI4 28
ADDRLP4 1728
INDIRI4
MULI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 1776
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 1776
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 660
;659:
;660:	pmv.ps = &defender->client->ps;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 661
;661:	pmv.animations = bgGlobalAnimations;
ADDRLP4 0+260
ADDRGP4 bgGlobalAnimations
ASGNP4
line 662
;662:	pmv.cmd = defender->client->pers.cmd;
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRB
ASGNB 28
line 664
;663:
;664:	pm = &pmv;
ADDRGP4 pm
ADDRLP4 0
ASGNP4
line 665
;665:	PM_SetAnim(SETANIM_BOTH, defAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0);
ADDRLP4 1780
CNSTI4 3
ASGNI4
ADDRLP4 1780
INDIRI4
ARGI4
ADDRLP4 1708
INDIRI4
ARGI4
ADDRLP4 1780
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 666
;666:	defender->client->ps.saberLockFrame = bgGlobalAnimations[defAnim].firstFrame+(bgGlobalAnimations[defAnim].numFrames*0.5);
ADDRLP4 1784
CNSTI4 28
ADDRLP4 1708
INDIRI4
MULI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 1784
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 1784
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 668
;667:
;668:	attacker->client->ps.saberLockHits = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 0
ASGNI4
line 669
;669:	defender->client->ps.saberLockHits = 0;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 0
ASGNI4
line 671
;670:
;671:	attacker->client->ps.saberLockAdvance = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 0
ASGNI4
line 672
;672:	defender->client->ps.saberLockAdvance = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 0
ASGNI4
line 674
;673:
;674:	VectorClear( attacker->client->ps.velocity );
ADDRLP4 1788
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1792
CNSTF4 0
ASGNF4
ADDRLP4 1788
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1792
INDIRF4
ASGNF4
ADDRLP4 1788
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1792
INDIRF4
ASGNF4
ADDRLP4 1788
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1792
INDIRF4
ASGNF4
line 675
;675:	VectorClear( defender->client->ps.velocity );
ADDRLP4 1796
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1800
CNSTF4 0
ASGNF4
ADDRLP4 1796
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1800
INDIRF4
ASGNF4
ADDRLP4 1796
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1800
INDIRF4
ASGNF4
ADDRLP4 1796
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1800
INDIRF4
ASGNF4
line 676
;676:	attacker->client->ps.saberLockTime = nowTime + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 1732
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 677
;677:	defender->client->ps.saberLockTime = nowTimeDefender + 10000;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 1736
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 678
;678:	attacker->client->ps.saberLockEnemy = defender->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 528
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 679
;679:	defender->client->ps.saberLockEnemy = attacker->s.number;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 528
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 680
;680:	attacker->client->ps.weaponTime = defender->client->ps.weaponTime = Q_irandExpectedIf(gRandomUnlockAdd, 1000, 3000, qfalse, 2000);//delay 1 to 3 seconds before pushing
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 3000
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2000
ARGI4
ADDRLP4 1804
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 1808
CNSTI4 408
ASGNI4
ADDRLP4 1812
CNSTI4 44
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 1808
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1812
INDIRI4
ADDP4
ADDRLP4 1804
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1808
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1812
INDIRI4
ADDP4
ADDRLP4 1804
INDIRI4
ASGNI4
line 682
;681:
;682:	VectorSubtract( defender->r.currentOrigin, attacker->r.currentOrigin, defDir );
ADDRLP4 1816
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1820
CNSTI4 368
ASGNI4
ADDRLP4 1824
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 580
ADDRLP4 1816
INDIRP4
ADDRLP4 1820
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1824
INDIRP4
ADDRLP4 1820
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1828
CNSTI4 372
ASGNI4
ADDRLP4 580+4
ADDRLP4 1816
INDIRP4
ADDRLP4 1828
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1824
INDIRP4
ADDRLP4 1828
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1832
CNSTI4 376
ASGNI4
ADDRLP4 580+8
ADDRFP4 4
INDIRP4
ADDRLP4 1832
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 1832
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 683
;683:	VectorCopy( attacker->client->ps.viewangles, attAngles );
ADDRLP4 1696
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 684
;684:	attAngles[YAW] = vectoyaw( defDir );
ADDRLP4 580
ARGP4
ADDRLP4 1836
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRLP4 1696+4
ADDRLP4 1836
INDIRF4
ASGNF4
line 685
;685:	DF_PreDeltaAngleChange(attacker->client);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 DF_PreDeltaAngleChange
CALLV
pop
line 686
;686:	SetClientViewAngle( attacker, attAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1696
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 687
;687:	DF_PostDeltaAngleChange(attacker->client, qtrue);
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
line 688
;688:	defAngles[PITCH] = attAngles[PITCH]*-1;
ADDRLP4 1712
CNSTF4 3212836864
ADDRLP4 1696
INDIRF4
MULF4
ASGNF4
line 689
;689:	defAngles[YAW] = AngleNormalize180( attAngles[YAW] + 180);
ADDRLP4 1696+4
INDIRF4
CNSTF4 1127481344
ADDF4
ARGF4
ADDRLP4 1840
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 1712+4
ADDRLP4 1840
INDIRF4
ASGNF4
line 690
;690:	defAngles[ROLL] = 0;
ADDRLP4 1712+8
CNSTF4 0
ASGNF4
line 691
;691:	DF_PreDeltaAngleChange(attacker->client);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 DF_PreDeltaAngleChange
CALLV
pop
line 692
;692:	SetClientViewAngle( defender, defAngles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 693
;693:	DF_PostDeltaAngleChange(attacker->client, qtrue);
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
line 696
;694:	
;695:	//MATCH POSITIONS
;696:	diff = VectorNormalize( defDir ) - idealDist;//diff will be the total error in dist
ADDRLP4 580
ARGP4
ADDRLP4 1844
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 576
ADDRLP4 1844
INDIRF4
ADDRLP4 1724
INDIRF4
SUBF4
ASGNF4
line 698
;697:	//try to move attacker half the diff towards the defender
;698:	VectorMA( attacker->r.currentOrigin, diff*0.5f, defDir, newOrg );
ADDRLP4 1848
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1852
CNSTF4 1056964608
ADDRLP4 576
INDIRF4
MULF4
ASGNF4
ADDRLP4 592
ADDRLP4 1848
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 580
INDIRF4
ADDRLP4 1852
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 592+4
ADDRLP4 1848
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 580+4
INDIRF4
ADDRLP4 1852
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 592+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 580+8
INDIRF4
CNSTF4 1056964608
ADDRLP4 576
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 700
;699:
;700:	JP_Trace( &trace, attacker->r.currentOrigin, attacker->r.mins, attacker->r.maxs, newOrg, attacker->s.number, attacker->clipmask );
ADDRLP4 616
ARGP4
ADDRLP4 1856
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1856
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1856
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1856
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 592
ARGP4
ADDRLP4 1856
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1856
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 701
;701:	if ( !trace.startsolid && !trace.allsolid )
ADDRLP4 1860
CNSTI4 0
ASGNI4
ADDRLP4 616+4
INDIRI4
ADDRLP4 1860
INDIRI4
NEI4 $425
ADDRLP4 616
INDIRI4
ADDRLP4 1860
INDIRI4
NEI4 $425
line 702
;702:	{
line 703
;703:		G_SetOrigin( attacker, trace.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 616+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 704
;704:		trap_LinkEntity( attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 705
;705:	}
LABELV $425
line 707
;706:	//now get the defender's dist and do it for him too
;707:	VectorSubtract( attacker->r.currentOrigin, defender->r.currentOrigin, attDir );
ADDRLP4 1864
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1868
CNSTI4 368
ASGNI4
ADDRLP4 1872
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 604
ADDRLP4 1864
INDIRP4
ADDRLP4 1868
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1872
INDIRP4
ADDRLP4 1868
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1876
CNSTI4 372
ASGNI4
ADDRLP4 604+4
ADDRLP4 1864
INDIRP4
ADDRLP4 1876
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1872
INDIRP4
ADDRLP4 1876
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1880
CNSTI4 376
ASGNI4
ADDRLP4 604+8
ADDRFP4 0
INDIRP4
ADDRLP4 1880
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 1880
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 708
;708:	diff = VectorNormalize( attDir ) - idealDist;//diff will be the total error in dist
ADDRLP4 604
ARGP4
ADDRLP4 1884
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 576
ADDRLP4 1884
INDIRF4
ADDRLP4 1724
INDIRF4
SUBF4
ASGNF4
line 710
;709:	//try to move defender all of the remaining diff towards the attacker
;710:	VectorMA( defender->r.currentOrigin, diff, attDir, newOrg );
ADDRLP4 1888
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 592
ADDRLP4 1888
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 604
INDIRF4
ADDRLP4 576
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 592+4
ADDRLP4 1888
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 604+4
INDIRF4
ADDRLP4 576
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 592+8
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 604+8
INDIRF4
ADDRLP4 576
INDIRF4
MULF4
ADDF4
ASGNF4
line 711
;711:	JP_Trace( &trace, defender->r.currentOrigin, defender->r.mins, defender->r.maxs, newOrg, defender->s.number, defender->clipmask );
ADDRLP4 616
ARGP4
ADDRLP4 1896
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1896
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1896
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1896
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 592
ARGP4
ADDRLP4 1896
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1896
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 712
;712:	if ( !trace.startsolid && !trace.allsolid )
ADDRLP4 1900
CNSTI4 0
ASGNI4
ADDRLP4 616+4
INDIRI4
ADDRLP4 1900
INDIRI4
NEI4 $435
ADDRLP4 616
INDIRI4
ADDRLP4 1900
INDIRI4
NEI4 $435
line 713
;713:	{
line 714
;714:		G_SetOrigin( defender, trace.endpos );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 616+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 715
;715:		trap_LinkEntity( defender );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 716
;716:	}
LABELV $435
line 719
;717:
;718:	//DONE!
;719:	return qtrue;
CNSTI4 1
RETI4
LABELV $374
endproc WP_SabersCheckLock2 1904 28
export WP_SabersCheckLock
proc WP_SabersCheckLock 260 16
line 723
;720:}
;721:
;722:qboolean WP_SabersCheckLock( gentity_t *ent1, gentity_t *ent2 )
;723:{
line 725
;724:	float dist;
;725:	qboolean	ent1BlockingPlayer = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 726
;726:	qboolean	ent2BlockingPlayer = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 727
;727:	const int runFlags = DF_GetRunFlags(ent1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 DF_GetRunFlags
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
line 728
;728:	const int runFlags2 = DF_GetRunFlags(ent2);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 DF_GetRunFlags
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 24
INDIRI4
ASGNI4
line 730
;729:
;730:	if (!g_saberLocking.integer)
ADDRGP4 g_saberLocking+12
INDIRI4
CNSTI4 0
NEI4 $440
line 731
;731:	{
line 732
;732:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $440
line 735
;733:	}
;734:
;735:	if (!ent1->client || !ent2->client)
ADDRLP4 28
CNSTI4 408
ASGNI4
ADDRLP4 32
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
EQU4 $445
ADDRFP4 4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRU4
NEU4 $443
LABELV $445
line 736
;736:	{
line 737
;737:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $443
line 740
;738:	}
;739:
;740:	if (!ent1->client->ps.duelInProgress ||
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 408
ASGNI4
ADDRLP4 44
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 1304
ASGNI4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $450
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $450
ADDRLP4 64
CNSTI4 1296
ASGNI4
ADDRLP4 44
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRLP4 56
INDIRP4
INDIRI4
NEI4 $450
ADDRLP4 60
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
INDIRI4
EQI4 $446
LABELV $450
line 744
;741:		!ent2->client->ps.duelInProgress ||
;742:		ent1->client->ps.duelIndex != ent2->s.number ||
;743:		ent2->client->ps.duelIndex != ent1->s.number)
;744:	{ //only allow saber locking if two players are dueling with each other directly
line 745
;745:		if (g_gametype.integer != GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $451
line 746
;746:		{
line 747
;747:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $451
line 749
;748:		}
;749:	}
LABELV $446
line 751
;750:
;751:	if ( fabs( ent1->r.currentOrigin[2]-ent2->r.currentOrigin[2] ) > 16 )
ADDRLP4 68
CNSTI4 376
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRLP4 72
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 72
INDIRF4
CNSTF4 1098907648
LEF4 $454
line 752
;752:	{
line 753
;753:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $454
line 755
;754:	}
;755:	if ( ent1->client->ps.groundEntityNum == ENTITYNUM_NONE ||
ADDRLP4 76
CNSTI4 408
ASGNI4
ADDRLP4 80
CNSTI4 84
ASGNI4
ADDRLP4 84
CNSTI4 1023
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
EQI4 $458
ADDRFP4 4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $456
LABELV $458
line 757
;756:		ent2->client->ps.groundEntityNum == ENTITYNUM_NONE )
;757:	{
line 758
;758:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $456
line 760
;759:	}
;760:	dist = DistanceSquared(ent1->r.currentOrigin,ent2->r.currentOrigin);
ADDRLP4 88
CNSTI4 368
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 DistanceSquared
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 92
INDIRF4
ASGNF4
line 761
;761:	if ( dist < 64 || dist > 6400 )
ADDRLP4 8
INDIRF4
CNSTF4 1115684864
LTF4 $461
ADDRLP4 8
INDIRF4
CNSTF4 1170735104
LEF4 $459
LABELV $461
line 762
;762:	{//between 8 and 80 from each other
line 763
;763:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $459
line 766
;764:	}
;765:
;766:	if (BG_InSpecialJump(ent1->client->ps.legsAnim, runFlags))
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
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $462
line 767
;767:	{
line 768
;768:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $462
line 770
;769:	}
;770:	if (BG_InSpecialJump(ent2->client->ps.legsAnim, runFlags2))
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $464
line 771
;771:	{
line 772
;772:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $464
line 775
;773:	}
;774:
;775:	if (BG_InRoll(&ent1->client->ps, ent1->client->ps.legsAnim))
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $466
line 776
;776:	{
line 777
;777:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $466
line 779
;778:	}
;779:	if (BG_InRoll(&ent2->client->ps, ent2->client->ps.legsAnim))
ADDRLP4 116
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $468
line 780
;780:	{
line 781
;781:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $468
line 784
;782:	}
;783:
;784:	if (ent1->client->ps.forceHandExtend != HANDEXTEND_NONE ||
ADDRLP4 124
CNSTI4 408
ASGNI4
ADDRLP4 128
CNSTI4 1248
ASGNI4
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $472
ADDRFP4 4
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
EQI4 $470
LABELV $472
line 786
;785:		ent2->client->ps.forceHandExtend != HANDEXTEND_NONE)
;786:	{
line 787
;787:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $470
line 790
;788:	}
;789:
;790:	if ((ent1->client->ps.pm_flags & PMF_DUCKED) ||
ADDRLP4 136
CNSTI4 408
ASGNI4
ADDRLP4 140
CNSTI4 12
ASGNI4
ADDRLP4 144
CNSTI4 1
ASGNI4
ADDRLP4 148
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
BANDI4
ADDRLP4 148
INDIRI4
NEI4 $475
ADDRFP4 4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
BANDI4
ADDRLP4 148
INDIRI4
EQI4 $473
LABELV $475
line 792
;791:		(ent2->client->ps.pm_flags & PMF_DUCKED))
;792:	{
line 793
;793:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $473
line 796
;794:	}
;795:
;796:	if (!InFront( ent1->client->ps.origin, ent2->client->ps.origin, ent2->client->ps.viewangles, 0.4f ))
ADDRLP4 152
CNSTI4 408
ASGNI4
ADDRLP4 156
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
ADDRFP4 4
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1053609165
ARGF4
ADDRLP4 164
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $476
line 797
;797:	{
line 798
;798:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $476
line 800
;799:	}
;800:	if (!InFront( ent2->client->ps.origin, ent1->client->ps.origin, ent1->client->ps.viewangles, 0.4f ))
ADDRLP4 168
CNSTI4 408
ASGNI4
ADDRLP4 172
CNSTI4 20
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
ARGP4
ADDRLP4 176
ADDRFP4 0
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 172
INDIRI4
ADDP4
ARGP4
ADDRLP4 176
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1053609165
ARGF4
ADDRLP4 180
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $478
line 801
;801:	{
line 802
;802:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $478
line 806
;803:	}
;804:
;805:	//T to B lock
;806:	if ( ent1->client->ps.torsoAnim == BOTH_A1_T__B_ ||
ADDRLP4 184
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 138
EQI4 $485
ADDRLP4 184
INDIRI4
CNSTI4 215
EQI4 $485
ADDRLP4 184
INDIRI4
CNSTI4 292
EQI4 $485
ADDRLP4 184
INDIRI4
CNSTI4 369
EQI4 $485
ADDRLP4 184
INDIRI4
CNSTI4 446
NEI4 $480
LABELV $485
line 811
;807:		ent1->client->ps.torsoAnim == BOTH_A2_T__B_ ||
;808:		ent1->client->ps.torsoAnim == BOTH_A3_T__B_ ||
;809:		ent1->client->ps.torsoAnim == BOTH_A4_T__B_ ||
;810:		ent1->client->ps.torsoAnim == BOTH_A5_T__B_ )
;811:	{//ent1 is attacking top-down
line 812
;812:		return WP_SabersCheckLock2( ent1, ent2, LOCK_TOP );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 188
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $480
line 815
;813:	}
;814:
;815:	if ( ent2->client->ps.torsoAnim == BOTH_A1_T__B_ ||
ADDRLP4 188
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 138
EQI4 $491
ADDRLP4 188
INDIRI4
CNSTI4 215
EQI4 $491
ADDRLP4 188
INDIRI4
CNSTI4 292
EQI4 $491
ADDRLP4 188
INDIRI4
CNSTI4 369
EQI4 $491
ADDRLP4 188
INDIRI4
CNSTI4 446
NEI4 $486
LABELV $491
line 820
;816:		ent2->client->ps.torsoAnim == BOTH_A2_T__B_ ||
;817:		ent2->client->ps.torsoAnim == BOTH_A3_T__B_ ||
;818:		ent2->client->ps.torsoAnim == BOTH_A4_T__B_ ||
;819:		ent2->client->ps.torsoAnim == BOTH_A5_T__B_ )
;820:	{//ent2 is attacking top-down
line 821
;821:		return WP_SabersCheckLock2( ent2, ent1, LOCK_TOP );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 192
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $486
line 824
;822:	}
;823:
;824:	if ( ent1->s.number == 0 &&
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
CNSTI4 0
ASGNI4
ADDRLP4 192
INDIRP4
INDIRI4
ADDRLP4 196
INDIRI4
NEI4 $492
ADDRLP4 200
ADDRLP4 192
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 2
NEI4 $492
ADDRLP4 200
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 196
INDIRI4
GTI4 $492
line 826
;825:		ent1->client->ps.saberBlocking == BLK_WIDE && ent1->client->ps.weaponTime <= 0 )
;826:	{
line 827
;827:		ent1BlockingPlayer = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 828
;828:	}
LABELV $492
line 829
;829:	if ( ent2->s.number == 0 &&
ADDRLP4 204
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 208
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRP4
INDIRI4
ADDRLP4 208
INDIRI4
NEI4 $494
ADDRLP4 212
ADDRLP4 204
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 212
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 2
NEI4 $494
ADDRLP4 212
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 208
INDIRI4
GTI4 $494
line 831
;830:		ent2->client->ps.saberBlocking == BLK_WIDE && ent2->client->ps.weaponTime <= 0 )
;831:	{
line 832
;832:		ent2BlockingPlayer = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 833
;833:	}
LABELV $494
line 836
;834:
;835:	//TR to BL lock
;836:	if ( ent1->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 216
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 144
EQI4 $501
ADDRLP4 216
INDIRI4
CNSTI4 221
EQI4 $501
ADDRLP4 216
INDIRI4
CNSTI4 298
EQI4 $501
ADDRLP4 216
INDIRI4
CNSTI4 375
EQI4 $501
ADDRLP4 216
INDIRI4
CNSTI4 452
NEI4 $496
LABELV $501
line 841
;837:		ent1->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;838:		ent1->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;839:		ent1->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;840:		ent1->client->ps.torsoAnim == BOTH_A5_TR_BL )
;841:	{//ent1 is attacking diagonally
line 842
;842:		if ( ent2BlockingPlayer )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $502
line 843
;843:		{//player will block this anyway
line 844
;844:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_TR );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 220
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $502
line 846
;845:		}
;846:		if ( ent2->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 220
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 144
EQI4 $510
ADDRLP4 220
INDIRI4
CNSTI4 221
EQI4 $510
ADDRLP4 220
INDIRI4
CNSTI4 298
EQI4 $510
ADDRLP4 220
INDIRI4
CNSTI4 375
EQI4 $510
ADDRLP4 220
INDIRI4
CNSTI4 452
EQI4 $510
ADDRLP4 220
INDIRI4
CNSTI4 525
NEI4 $504
LABELV $510
line 852
;847:			ent2->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;848:			ent2->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;849:			ent2->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;850:			ent2->client->ps.torsoAnim == BOTH_A5_TR_BL ||
;851:			ent2->client->ps.torsoAnim == BOTH_P1_S1_TL )
;852:		{//ent2 is attacking in the opposite diagonal
line 853
;853:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_TR );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 224
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $504
line 855
;854:		}
;855:		if ( ent2->client->ps.torsoAnim == BOTH_A1_BR_TL ||
ADDRLP4 224
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 142
EQI4 $517
ADDRLP4 224
INDIRI4
CNSTI4 219
EQI4 $517
ADDRLP4 224
INDIRI4
CNSTI4 296
EQI4 $517
ADDRLP4 224
INDIRI4
CNSTI4 373
EQI4 $517
ADDRLP4 224
INDIRI4
CNSTI4 450
EQI4 $517
ADDRLP4 224
INDIRI4
CNSTI4 526
NEI4 $511
LABELV $517
line 861
;856:			ent2->client->ps.torsoAnim == BOTH_A2_BR_TL ||
;857:			ent2->client->ps.torsoAnim == BOTH_A3_BR_TL ||
;858:			ent2->client->ps.torsoAnim == BOTH_A4_BR_TL ||
;859:			ent2->client->ps.torsoAnim == BOTH_A5_BR_TL ||
;860:			ent2->client->ps.torsoAnim == BOTH_P1_S1_BL )
;861:		{//ent2 is attacking in the opposite diagonal
line 862
;862:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_BL );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 228
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $511
line 864
;863:		}
;864:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $496
line 867
;865:	}
;866:
;867:	if ( ent2->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 220
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 144
EQI4 $523
ADDRLP4 220
INDIRI4
CNSTI4 221
EQI4 $523
ADDRLP4 220
INDIRI4
CNSTI4 298
EQI4 $523
ADDRLP4 220
INDIRI4
CNSTI4 375
EQI4 $523
ADDRLP4 220
INDIRI4
CNSTI4 452
NEI4 $518
LABELV $523
line 872
;868:		ent2->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;869:		ent2->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;870:		ent2->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;871:		ent2->client->ps.torsoAnim == BOTH_A5_TR_BL )
;872:	{//ent2 is attacking diagonally
line 873
;873:		if ( ent1BlockingPlayer )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $524
line 874
;874:		{//player will block this anyway
line 875
;875:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_TR );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 224
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $524
line 877
;876:		}
;877:		if ( ent1->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 144
EQI4 $532
ADDRLP4 224
INDIRI4
CNSTI4 221
EQI4 $532
ADDRLP4 224
INDIRI4
CNSTI4 298
EQI4 $532
ADDRLP4 224
INDIRI4
CNSTI4 375
EQI4 $532
ADDRLP4 224
INDIRI4
CNSTI4 452
EQI4 $532
ADDRLP4 224
INDIRI4
CNSTI4 525
NEI4 $526
LABELV $532
line 883
;878:			ent1->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;879:			ent1->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;880:			ent1->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;881:			ent1->client->ps.torsoAnim == BOTH_A5_TR_BL ||
;882:			ent1->client->ps.torsoAnim == BOTH_P1_S1_TL )
;883:		{//ent1 is attacking in the opposite diagonal
line 884
;884:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_TR );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 228
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $526
line 886
;885:		}
;886:		if ( ent1->client->ps.torsoAnim == BOTH_A1_BR_TL ||
ADDRLP4 228
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 142
EQI4 $539
ADDRLP4 228
INDIRI4
CNSTI4 219
EQI4 $539
ADDRLP4 228
INDIRI4
CNSTI4 296
EQI4 $539
ADDRLP4 228
INDIRI4
CNSTI4 373
EQI4 $539
ADDRLP4 228
INDIRI4
CNSTI4 450
EQI4 $539
ADDRLP4 228
INDIRI4
CNSTI4 526
NEI4 $533
LABELV $539
line 892
;887:			ent1->client->ps.torsoAnim == BOTH_A2_BR_TL ||
;888:			ent1->client->ps.torsoAnim == BOTH_A3_BR_TL ||
;889:			ent1->client->ps.torsoAnim == BOTH_A4_BR_TL ||
;890:			ent1->client->ps.torsoAnim == BOTH_A5_BR_TL ||
;891:			ent1->client->ps.torsoAnim == BOTH_P1_S1_BL )
;892:		{//ent1 is attacking in the opposite diagonal
line 893
;893:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_BL );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 232
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $533
line 895
;894:		}
;895:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $518
line 899
;896:	}
;897:
;898:	//TL to BR lock
;899:	if ( ent1->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 141
EQI4 $545
ADDRLP4 224
INDIRI4
CNSTI4 218
EQI4 $545
ADDRLP4 224
INDIRI4
CNSTI4 295
EQI4 $545
ADDRLP4 224
INDIRI4
CNSTI4 372
EQI4 $545
ADDRLP4 224
INDIRI4
CNSTI4 449
NEI4 $540
LABELV $545
line 904
;900:		ent1->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;901:		ent1->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;902:		ent1->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;903:		ent1->client->ps.torsoAnim == BOTH_A5_TL_BR )
;904:	{//ent1 is attacking diagonally
line 905
;905:		if ( ent2BlockingPlayer )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $546
line 906
;906:		{//player will block this anyway
line 907
;907:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_TL );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 228
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $546
line 909
;908:		}
;909:		if ( ent2->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 228
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 141
EQI4 $554
ADDRLP4 228
INDIRI4
CNSTI4 218
EQI4 $554
ADDRLP4 228
INDIRI4
CNSTI4 295
EQI4 $554
ADDRLP4 228
INDIRI4
CNSTI4 372
EQI4 $554
ADDRLP4 228
INDIRI4
CNSTI4 449
EQI4 $554
ADDRLP4 228
INDIRI4
CNSTI4 524
NEI4 $548
LABELV $554
line 915
;910:			ent2->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;911:			ent2->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;912:			ent2->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;913:			ent2->client->ps.torsoAnim == BOTH_A5_TL_BR ||
;914:			ent2->client->ps.torsoAnim == BOTH_P1_S1_TR )
;915:		{//ent2 is attacking in the opposite diagonal
line 916
;916:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_TL );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 232
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $548
line 918
;917:		}
;918:		if ( ent2->client->ps.torsoAnim == BOTH_A1_BL_TR ||
ADDRLP4 232
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 143
EQI4 $561
ADDRLP4 232
INDIRI4
CNSTI4 220
EQI4 $561
ADDRLP4 232
INDIRI4
CNSTI4 297
EQI4 $561
ADDRLP4 232
INDIRI4
CNSTI4 374
EQI4 $561
ADDRLP4 232
INDIRI4
CNSTI4 451
EQI4 $561
ADDRLP4 232
INDIRI4
CNSTI4 527
NEI4 $555
LABELV $561
line 924
;919:			ent2->client->ps.torsoAnim == BOTH_A2_BL_TR ||
;920:			ent2->client->ps.torsoAnim == BOTH_A3_BL_TR ||
;921:			ent2->client->ps.torsoAnim == BOTH_A4_BL_TR ||
;922:			ent2->client->ps.torsoAnim == BOTH_A5_BL_TR ||
;923:			ent2->client->ps.torsoAnim == BOTH_P1_S1_BR )
;924:		{//ent2 is attacking in the opposite diagonal
line 925
;925:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_BR );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 236
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $555
line 927
;926:		}
;927:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $540
line 930
;928:	}
;929:
;930:	if ( ent2->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 228
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 141
EQI4 $567
ADDRLP4 228
INDIRI4
CNSTI4 218
EQI4 $567
ADDRLP4 228
INDIRI4
CNSTI4 295
EQI4 $567
ADDRLP4 228
INDIRI4
CNSTI4 372
EQI4 $567
ADDRLP4 228
INDIRI4
CNSTI4 449
NEI4 $562
LABELV $567
line 935
;931:		ent2->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;932:		ent2->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;933:		ent2->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;934:		ent2->client->ps.torsoAnim == BOTH_A5_TL_BR )
;935:	{//ent2 is attacking diagonally
line 936
;936:		if ( ent1BlockingPlayer )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $568
line 937
;937:		{//player will block this anyway
line 938
;938:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_TL );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 232
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $568
line 940
;939:		}
;940:		if ( ent1->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 232
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 141
EQI4 $576
ADDRLP4 232
INDIRI4
CNSTI4 218
EQI4 $576
ADDRLP4 232
INDIRI4
CNSTI4 295
EQI4 $576
ADDRLP4 232
INDIRI4
CNSTI4 372
EQI4 $576
ADDRLP4 232
INDIRI4
CNSTI4 449
EQI4 $576
ADDRLP4 232
INDIRI4
CNSTI4 524
NEI4 $570
LABELV $576
line 946
;941:			ent1->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;942:			ent1->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;943:			ent1->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;944:			ent1->client->ps.torsoAnim == BOTH_A5_TL_BR ||
;945:			ent1->client->ps.torsoAnim == BOTH_P1_S1_TR )
;946:		{//ent1 is attacking in the opposite diagonal
line 947
;947:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_TL );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 236
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $570
line 949
;948:		}
;949:		if ( ent1->client->ps.torsoAnim == BOTH_A1_BL_TR ||
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 143
EQI4 $583
ADDRLP4 236
INDIRI4
CNSTI4 220
EQI4 $583
ADDRLP4 236
INDIRI4
CNSTI4 297
EQI4 $583
ADDRLP4 236
INDIRI4
CNSTI4 374
EQI4 $583
ADDRLP4 236
INDIRI4
CNSTI4 451
EQI4 $583
ADDRLP4 236
INDIRI4
CNSTI4 527
NEI4 $577
LABELV $583
line 955
;950:			ent1->client->ps.torsoAnim == BOTH_A2_BL_TR ||
;951:			ent1->client->ps.torsoAnim == BOTH_A3_BL_TR ||
;952:			ent1->client->ps.torsoAnim == BOTH_A4_BL_TR ||
;953:			ent1->client->ps.torsoAnim == BOTH_A5_BL_TR ||
;954:			ent1->client->ps.torsoAnim == BOTH_P1_S1_BR )
;955:		{//ent1 is attacking in the opposite diagonal
line 956
;956:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_BR );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 240
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 240
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $577
line 958
;957:		}
;958:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $562
line 961
;959:	}
;960:	//L to R lock
;961:	if ( ent1->client->ps.torsoAnim == BOTH_A1__L__R ||
ADDRLP4 232
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 139
EQI4 $589
ADDRLP4 232
INDIRI4
CNSTI4 216
EQI4 $589
ADDRLP4 232
INDIRI4
CNSTI4 293
EQI4 $589
ADDRLP4 232
INDIRI4
CNSTI4 370
EQI4 $589
ADDRLP4 232
INDIRI4
CNSTI4 447
NEI4 $584
LABELV $589
line 966
;962:		ent1->client->ps.torsoAnim == BOTH_A2__L__R ||
;963:		ent1->client->ps.torsoAnim == BOTH_A3__L__R ||
;964:		ent1->client->ps.torsoAnim == BOTH_A4__L__R ||
;965:		ent1->client->ps.torsoAnim == BOTH_A5__L__R )
;966:	{//ent1 is attacking l to r
line 967
;967:		if ( ent2BlockingPlayer )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $590
line 968
;968:		{//player will block this anyway
line 969
;969:			return WP_SabersCheckLock2( ent1, ent2, LOCK_L );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 236
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $590
line 971
;970:		}
;971:		if ( ent2->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 236
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 141
EQI4 $599
ADDRLP4 236
INDIRI4
CNSTI4 218
EQI4 $599
ADDRLP4 236
INDIRI4
CNSTI4 295
EQI4 $599
ADDRLP4 236
INDIRI4
CNSTI4 372
EQI4 $599
ADDRLP4 236
INDIRI4
CNSTI4 449
EQI4 $599
ADDRLP4 236
INDIRI4
CNSTI4 524
EQI4 $599
ADDRLP4 236
INDIRI4
CNSTI4 526
NEI4 $592
LABELV $599
line 978
;972:			ent2->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;973:			ent2->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;974:			ent2->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;975:			ent2->client->ps.torsoAnim == BOTH_A5_TL_BR ||
;976:			ent2->client->ps.torsoAnim == BOTH_P1_S1_TR ||
;977:			ent2->client->ps.torsoAnim == BOTH_P1_S1_BL )
;978:		{//ent2 is attacking or blocking on the r
line 979
;979:			return WP_SabersCheckLock2( ent1, ent2, LOCK_L );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 240
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 240
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $592
line 981
;980:		}
;981:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $584
line 983
;982:	}
;983:	if ( ent2->client->ps.torsoAnim == BOTH_A1__L__R ||
ADDRLP4 236
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 139
EQI4 $605
ADDRLP4 236
INDIRI4
CNSTI4 216
EQI4 $605
ADDRLP4 236
INDIRI4
CNSTI4 293
EQI4 $605
ADDRLP4 236
INDIRI4
CNSTI4 370
EQI4 $605
ADDRLP4 236
INDIRI4
CNSTI4 447
NEI4 $600
LABELV $605
line 988
;984:		ent2->client->ps.torsoAnim == BOTH_A2__L__R ||
;985:		ent2->client->ps.torsoAnim == BOTH_A3__L__R ||
;986:		ent2->client->ps.torsoAnim == BOTH_A4__L__R ||
;987:		ent2->client->ps.torsoAnim == BOTH_A5__L__R )
;988:	{//ent2 is attacking l to r
line 989
;989:		if ( ent1BlockingPlayer )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $606
line 990
;990:		{//player will block this anyway
line 991
;991:			return WP_SabersCheckLock2( ent2, ent1, LOCK_L );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 240
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 240
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $606
line 993
;992:		}
;993:		if ( ent1->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 240
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 141
EQI4 $615
ADDRLP4 240
INDIRI4
CNSTI4 218
EQI4 $615
ADDRLP4 240
INDIRI4
CNSTI4 295
EQI4 $615
ADDRLP4 240
INDIRI4
CNSTI4 372
EQI4 $615
ADDRLP4 240
INDIRI4
CNSTI4 449
EQI4 $615
ADDRLP4 240
INDIRI4
CNSTI4 524
EQI4 $615
ADDRLP4 240
INDIRI4
CNSTI4 526
NEI4 $608
LABELV $615
line 1000
;994:			ent1->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;995:			ent1->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;996:			ent1->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;997:			ent1->client->ps.torsoAnim == BOTH_A5_TL_BR ||
;998:			ent1->client->ps.torsoAnim == BOTH_P1_S1_TR ||
;999:			ent1->client->ps.torsoAnim == BOTH_P1_S1_BL )
;1000:		{//ent1 is attacking or blocking on the r
line 1001
;1001:			return WP_SabersCheckLock2( ent2, ent1, LOCK_L );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 244
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $608
line 1003
;1002:		}
;1003:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $600
line 1006
;1004:	}
;1005:	//R to L lock
;1006:	if ( ent1->client->ps.torsoAnim == BOTH_A1__R__L ||
ADDRLP4 240
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 140
EQI4 $621
ADDRLP4 240
INDIRI4
CNSTI4 217
EQI4 $621
ADDRLP4 240
INDIRI4
CNSTI4 294
EQI4 $621
ADDRLP4 240
INDIRI4
CNSTI4 371
EQI4 $621
ADDRLP4 240
INDIRI4
CNSTI4 448
NEI4 $616
LABELV $621
line 1011
;1007:		ent1->client->ps.torsoAnim == BOTH_A2__R__L ||
;1008:		ent1->client->ps.torsoAnim == BOTH_A3__R__L ||
;1009:		ent1->client->ps.torsoAnim == BOTH_A4__R__L ||
;1010:		ent1->client->ps.torsoAnim == BOTH_A5__R__L )
;1011:	{//ent1 is attacking r to l
line 1012
;1012:		if ( ent2BlockingPlayer )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $622
line 1013
;1013:		{//player will block this anyway
line 1014
;1014:			return WP_SabersCheckLock2( ent1, ent2, LOCK_R );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 244
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $622
line 1016
;1015:		}
;1016:		if ( ent2->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 244
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 144
EQI4 $631
ADDRLP4 244
INDIRI4
CNSTI4 221
EQI4 $631
ADDRLP4 244
INDIRI4
CNSTI4 298
EQI4 $631
ADDRLP4 244
INDIRI4
CNSTI4 375
EQI4 $631
ADDRLP4 244
INDIRI4
CNSTI4 452
EQI4 $631
ADDRLP4 244
INDIRI4
CNSTI4 525
EQI4 $631
ADDRLP4 244
INDIRI4
CNSTI4 527
NEI4 $624
LABELV $631
line 1023
;1017:			ent2->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;1018:			ent2->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;1019:			ent2->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;1020:			ent2->client->ps.torsoAnim == BOTH_A5_TR_BL ||
;1021:			ent2->client->ps.torsoAnim == BOTH_P1_S1_TL ||
;1022:			ent2->client->ps.torsoAnim == BOTH_P1_S1_BR )
;1023:		{//ent2 is attacking or blocking on the l
line 1024
;1024:			return WP_SabersCheckLock2( ent1, ent2, LOCK_R );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 248
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $624
line 1026
;1025:		}
;1026:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $616
line 1028
;1027:	}
;1028:	if ( ent2->client->ps.torsoAnim == BOTH_A1__R__L ||
ADDRLP4 244
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 140
EQI4 $637
ADDRLP4 244
INDIRI4
CNSTI4 217
EQI4 $637
ADDRLP4 244
INDIRI4
CNSTI4 294
EQI4 $637
ADDRLP4 244
INDIRI4
CNSTI4 371
EQI4 $637
ADDRLP4 244
INDIRI4
CNSTI4 448
NEI4 $632
LABELV $637
line 1033
;1029:		ent2->client->ps.torsoAnim == BOTH_A2__R__L ||
;1030:		ent2->client->ps.torsoAnim == BOTH_A3__R__L ||
;1031:		ent2->client->ps.torsoAnim == BOTH_A4__R__L ||
;1032:		ent2->client->ps.torsoAnim == BOTH_A5__R__L )
;1033:	{//ent2 is attacking r to l
line 1034
;1034:		if ( ent1BlockingPlayer )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $638
line 1035
;1035:		{//player will block this anyway
line 1036
;1036:			return WP_SabersCheckLock2( ent2, ent1, LOCK_R );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 248
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $638
line 1038
;1037:		}
;1038:		if ( ent1->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 248
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 144
EQI4 $647
ADDRLP4 248
INDIRI4
CNSTI4 221
EQI4 $647
ADDRLP4 248
INDIRI4
CNSTI4 298
EQI4 $647
ADDRLP4 248
INDIRI4
CNSTI4 375
EQI4 $647
ADDRLP4 248
INDIRI4
CNSTI4 452
EQI4 $647
ADDRLP4 248
INDIRI4
CNSTI4 525
EQI4 $647
ADDRLP4 248
INDIRI4
CNSTI4 527
NEI4 $640
LABELV $647
line 1045
;1039:			ent1->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;1040:			ent1->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;1041:			ent1->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;1042:			ent1->client->ps.torsoAnim == BOTH_A5_TR_BL ||
;1043:			ent1->client->ps.torsoAnim == BOTH_P1_S1_TL ||
;1044:			ent1->client->ps.torsoAnim == BOTH_P1_S1_BR )
;1045:		{//ent1 is attacking or blocking on the l
line 1046
;1046:			return WP_SabersCheckLock2( ent2, ent1, LOCK_R );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 252
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 252
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $640
line 1048
;1047:		}
;1048:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $439
JUMPV
LABELV $632
line 1050
;1049:	}
;1050:	if ( !Q_irand( 0, 10 + gRandomUnlockAdd, qfalse, 5) )
ADDRLP4 248
CNSTI4 0
ASGNI4
ADDRLP4 248
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 248
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 252
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 252
INDIRI4
CNSTI4 0
NEI4 $648
line 1051
;1051:	{
line 1052
;1052:		return WP_SabersCheckLock2( ent1, ent2, LOCK_RANDOM );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 256
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
RETI4
ADDRGP4 $439
JUMPV
LABELV $648
line 1054
;1053:	}
;1054:	return qfalse;
CNSTI4 0
RETI4
LABELV $439
endproc WP_SabersCheckLock 260 16
export G_GetParryForBlock
proc G_GetParryForBlock 4 0
line 1058
;1055:}
;1056:
;1057:int G_GetParryForBlock(int block)
;1058:{
line 1059
;1059:	switch (block)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $652
ADDRLP4 0
INDIRI4
CNSTI4 13
GTI4 $652
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $663-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $663
address $653
address $655
address $657
address $659
address $661
address $654
address $656
address $658
address $660
address $662
code
line 1060
;1060:	{
LABELV $653
line 1062
;1061:		case BLOCKED_UPPER_RIGHT:
;1062:			return LS_PARRY_UR;
CNSTI4 109
RETI4
ADDRGP4 $650
JUMPV
line 1063
;1063:			break;
LABELV $654
line 1065
;1064:		case BLOCKED_UPPER_RIGHT_PROJ:
;1065:			return LS_REFLECT_UR;
CNSTI4 114
RETI4
ADDRGP4 $650
JUMPV
line 1066
;1066:			break;
LABELV $655
line 1068
;1067:		case BLOCKED_UPPER_LEFT:
;1068:			return LS_PARRY_UL;
CNSTI4 110
RETI4
ADDRGP4 $650
JUMPV
line 1069
;1069:			break;
LABELV $656
line 1071
;1070:		case BLOCKED_UPPER_LEFT_PROJ:
;1071:			return LS_REFLECT_UL;
CNSTI4 115
RETI4
ADDRGP4 $650
JUMPV
line 1072
;1072:			break;
LABELV $657
line 1074
;1073:		case BLOCKED_LOWER_RIGHT:
;1074:			return LS_PARRY_LR;
CNSTI4 111
RETI4
ADDRGP4 $650
JUMPV
line 1075
;1075:			break;
LABELV $658
line 1077
;1076:		case BLOCKED_LOWER_RIGHT_PROJ:
;1077:			return LS_REFLECT_LR;
CNSTI4 116
RETI4
ADDRGP4 $650
JUMPV
line 1078
;1078:			break;
LABELV $659
line 1080
;1079:		case BLOCKED_LOWER_LEFT:
;1080:			return LS_PARRY_LL;
CNSTI4 112
RETI4
ADDRGP4 $650
JUMPV
line 1081
;1081:			break;
LABELV $660
line 1083
;1082:		case BLOCKED_LOWER_LEFT_PROJ:
;1083:			return LS_REFLECT_LL;
CNSTI4 117
RETI4
ADDRGP4 $650
JUMPV
line 1084
;1084:			break;
LABELV $661
line 1086
;1085:		case BLOCKED_TOP:
;1086:			return LS_PARRY_UP;
CNSTI4 108
RETI4
ADDRGP4 $650
JUMPV
line 1087
;1087:			break;
LABELV $662
line 1089
;1088:		case BLOCKED_TOP_PROJ:
;1089:			return LS_REFLECT_UP;
CNSTI4 113
RETI4
ADDRGP4 $650
JUMPV
line 1090
;1090:			break;
line 1092
;1091:		default:
;1092:			break;
LABELV $652
line 1095
;1093:	}
;1094:
;1095:	return LS_NONE;
CNSTI4 0
RETI4
LABELV $650
endproc G_GetParryForBlock 4 0
export WP_GetSaberDeflectionAngle
proc WP_GetSaberDeflectionAngle 156 16
line 1102
;1096:}
;1097:
;1098:int PM_SaberBounceForAttack( int move );
;1099:int PM_SaberDeflectionForQuad( int quad );
;1100:extern stringID_table_t animTable[MAX_ANIMATIONS+1];
;1101:qboolean WP_GetSaberDeflectionAngle( gentity_t *attacker, gentity_t *defender, float saberHitFraction )
;1102:{
line 1103
;1103:	qboolean animBasedDeflection = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1105
;1104:
;1105:	if ( !attacker || !attacker->client || !attacker->client->ghoul2 )
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
EQU4 $669
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $669
ADDRLP4 12
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $666
LABELV $669
line 1106
;1106:	{
line 1107
;1107:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $665
JUMPV
LABELV $666
line 1109
;1108:	}
;1109:	if ( !defender || !defender->client || !defender->client->ghoul2 )
ADDRLP4 16
ADDRFP4 4
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
EQU4 $673
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
EQU4 $673
ADDRLP4 24
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
NEU4 $670
LABELV $673
line 1110
;1110:	{
line 1111
;1111:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $665
JUMPV
LABELV $670
line 1114
;1112:	}
;1113:
;1114:	if ((LEVELTIME(attacker->client) - attacker->client->lastSaberStorageTime) > 500)
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
EQU4 $680
ADDRLP4 36
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $680
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $682
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $683
JUMPV
LABELV $682
ADDRLP4 32
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $683
ADDRLP4 28
ADDRLP4 32
INDIRI4
ASGNI4
ADDRGP4 $681
JUMPV
LABELV $680
ADDRLP4 28
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $681
ADDRLP4 28
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43792
ADDP4
INDIRI4
SUBI4
CNSTI4 500
LEI4 $674
line 1115
;1115:	{ //last update was too long ago, something is happening to this client to prevent his saber from updating
line 1116
;1116:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $665
JUMPV
LABELV $674
line 1118
;1117:	}
;1118:	if ((LEVELTIME(defender->client) - defender->client->lastSaberStorageTime) > 500)
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
EQU4 $690
ADDRLP4 48
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $690
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $692
ADDRLP4 44
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $693
JUMPV
LABELV $692
ADDRLP4 44
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $693
ADDRLP4 40
ADDRLP4 44
INDIRI4
ASGNI4
ADDRGP4 $691
JUMPV
LABELV $690
ADDRLP4 40
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $691
ADDRLP4 40
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43792
ADDP4
INDIRI4
SUBI4
CNSTI4 500
LEI4 $684
line 1119
;1119:	{ //ditto
line 1120
;1120:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $665
JUMPV
LABELV $684
line 1123
;1121:	}
;1122:
;1123:	if ( animBasedDeflection )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $694
line 1124
;1124:	{
line 1126
;1125:		//Hmm, let's try just basing it off the anim
;1126:		int attQuadStart = saberMoveData[attacker->client->ps.saberMove].startQuad;
ADDRLP4 60
CNSTI4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
ASGNI4
line 1127
;1127:		int attQuadEnd = saberMoveData[attacker->client->ps.saberMove].endQuad;
ADDRLP4 64
CNSTI4 40
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
ASGNI4
line 1128
;1128:		int defQuad = saberMoveData[defender->client->ps.saberMove].endQuad;
ADDRLP4 56
CNSTI4 40
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
ASGNI4
line 1129
;1129:		int quadDiff = abs(defQuad-attQuadStart);
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
SUBI4
ARGI4
ADDRLP4 68
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 68
INDIRI4
ASGNI4
line 1131
;1130:
;1131:		if ( defender->client->ps.saberMove == LS_READY )
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
NEI4 $699
line 1132
;1132:		{
line 1140
;1133:			//FIXME: we should probably do SOMETHING here...
;1134:			//I have this return qfalse here in the hopes that
;1135:			//the defender will pick a parry and the attacker
;1136:			//will hit the defender's saber again.
;1137:			//But maybe this func call should come *after*
;1138:			//it's decided whether or not the defender is
;1139:			//going to parry.
;1140:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $665
JUMPV
LABELV $699
line 1144
;1141:		}
;1142:
;1143:		//reverse the left/right of the defQuad because of the mirrored nature of facing each other in combat
;1144:		switch ( defQuad )
ADDRLP4 72
ADDRLP4 56
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $701
ADDRLP4 72
INDIRI4
CNSTI4 6
GTI4 $701
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $709
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $709
address $703
address $704
address $705
address $701
address $706
address $707
address $708
code
line 1145
;1145:		{
LABELV $703
line 1147
;1146:		case Q_BR:
;1147:			defQuad = Q_BL;
ADDRLP4 56
CNSTI4 6
ASGNI4
line 1148
;1148:			break;
ADDRGP4 $702
JUMPV
LABELV $704
line 1150
;1149:		case Q_R:
;1150:			defQuad = Q_L;
ADDRLP4 56
CNSTI4 5
ASGNI4
line 1151
;1151:			break;
ADDRGP4 $702
JUMPV
LABELV $705
line 1153
;1152:		case Q_TR:
;1153:			defQuad = Q_TL;
ADDRLP4 56
CNSTI4 4
ASGNI4
line 1154
;1154:			break;
ADDRGP4 $702
JUMPV
LABELV $706
line 1156
;1155:		case Q_TL:
;1156:			defQuad = Q_TR;
ADDRLP4 56
CNSTI4 2
ASGNI4
line 1157
;1157:			break;
ADDRGP4 $702
JUMPV
LABELV $707
line 1159
;1158:		case Q_L:
;1159:			defQuad = Q_R;
ADDRLP4 56
CNSTI4 1
ASGNI4
line 1160
;1160:			break;
ADDRGP4 $702
JUMPV
LABELV $708
line 1162
;1161:		case Q_BL:
;1162:			defQuad = Q_BR;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 1163
;1163:			break;
LABELV $701
LABELV $702
line 1166
;1164:		}
;1165:
;1166:		if ( quadDiff > 4 )
ADDRLP4 52
INDIRI4
CNSTI4 4
LEI4 $710
line 1167
;1167:		{//wrap around so diff is never greater than 180 (4 * 45)
line 1168
;1168:			quadDiff = 4 - (quadDiff - 4);
ADDRLP4 76
CNSTI4 4
ASGNI4
ADDRLP4 52
ADDRLP4 76
INDIRI4
ADDRLP4 52
INDIRI4
ADDRLP4 76
INDIRI4
SUBI4
SUBI4
ASGNI4
line 1169
;1169:		}
LABELV $710
line 1171
;1170:		//have the quads, find a good anim to use
;1171:		if ( (!quadDiff || (quadDiff == 1 && Q_irand(0,1 + gRandomUnlockAdd, qfalse, 0))) //defender pretty much stopped the attack at a 90 degree angle
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $714
ADDRLP4 84
CNSTI4 1
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 84
INDIRI4
NEI4 $712
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
ADDRLP4 84
INDIRI4
ADDI4
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $712
LABELV $714
ADDRLP4 92
CNSTI4 408
ASGNI4
ADDRLP4 96
CNSTI4 1228
ASGNI4
ADDRLP4 100
ADDRFP4 4
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
ADDRFP4 0
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
ADDRLP4 104
INDIRI4
EQI4 $715
ADDRLP4 108
CNSTI4 0
ASGNI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRLP4 100
INDIRI4
ADDRLP4 104
INDIRI4
SUBI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
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
LTI4 $712
LABELV $715
line 1173
;1172:			&& (defender->client->ps.fd.saberAnimLevel == attacker->client->ps.fd.saberAnimLevel || Q_irand( 0, defender->client->ps.fd.saberAnimLevel-attacker->client->ps.fd.saberAnimLevel + gRandomUnlockAdd, qfalse, 0) >= 0) )//and the defender's style is stronger
;1173:		{
line 1175
;1174:			//bounce straight back
;1175:			int attMove = attacker->client->ps.saberMove;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 1176
;1176:			attacker->client->ps.saberMove = PM_SaberBounceForAttack( attacker->client->ps.saberMove );
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 PM_SaberBounceForAttack
CALLI4
ASGNI4
ADDRLP4 120
INDIRP4
ADDRLP4 124
INDIRI4
ASGNI4
line 1177
;1177:			if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $716
line 1178
;1178:			{
line 1179
;1179:				Com_Printf( "attack %s vs. parry %s bounced to %s\n", 
ADDRGP4 $719
ARGP4
ADDRLP4 128
CNSTI4 40
ASGNI4
ADDRLP4 132
CNSTI4 3
ASGNI4
ADDRLP4 136
ADDRGP4 animTable
ASGNP4
ADDRLP4 128
INDIRI4
ADDRLP4 116
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
LSHI4
ADDRLP4 136
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 140
CNSTI4 408
ASGNI4
ADDRLP4 144
CNSTI4 512
ASGNI4
ADDRLP4 128
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
LSHI4
ADDRLP4 136
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 128
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
LSHI4
ADDRLP4 136
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1183
;1180:					animTable[saberMoveData[attMove].animToUse].name, 
;1181:					animTable[saberMoveData[defender->client->ps.saberMove].animToUse].name,
;1182:					animTable[saberMoveData[attacker->client->ps.saberMove].animToUse].name );
;1183:			}
LABELV $716
line 1184
;1184:			attacker->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 1185
;1185:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $665
JUMPV
LABELV $712
line 1188
;1186:		}
;1187:		else
;1188:		{//attack hit at an angle, figure out what angle it should bounce off att
line 1190
;1189:			int newQuad;
;1190:			quadDiff = defQuad - attQuadEnd;
ADDRLP4 52
ADDRLP4 56
INDIRI4
ADDRLP4 64
INDIRI4
SUBI4
ASGNI4
line 1192
;1191:			//add half the diff of between the defense and attack end to the attack end
;1192:			if ( quadDiff > 4 )
ADDRLP4 52
INDIRI4
CNSTI4 4
LEI4 $723
line 1193
;1193:			{
line 1194
;1194:				quadDiff = 4 - (quadDiff - 4);
ADDRLP4 120
CNSTI4 4
ASGNI4
ADDRLP4 52
ADDRLP4 120
INDIRI4
ADDRLP4 52
INDIRI4
ADDRLP4 120
INDIRI4
SUBI4
SUBI4
ASGNI4
line 1195
;1195:			}
ADDRGP4 $724
JUMPV
LABELV $723
line 1196
;1196:			else if ( quadDiff < -4 )
ADDRLP4 52
INDIRI4
CNSTI4 -4
GEI4 $725
line 1197
;1197:			{
line 1198
;1198:				quadDiff = -4 + (quadDiff + 4);
ADDRLP4 52
ADDRLP4 52
INDIRI4
CNSTI4 4
ADDI4
CNSTI4 -4
ADDI4
ASGNI4
line 1199
;1199:			}
LABELV $725
LABELV $724
line 1200
;1200:			newQuad = attQuadEnd + ceil( ((float)quadDiff)/2.0f );
ADDRLP4 52
INDIRI4
CVIF4 4
CNSTF4 1073741824
DIVF4
ARGF4
ADDRLP4 120
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 116
ADDRLP4 64
INDIRI4
CVIF4 4
ADDRLP4 120
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 1201
;1201:			if ( newQuad < Q_BR )
ADDRLP4 116
INDIRI4
CNSTI4 0
GEI4 $727
line 1202
;1202:			{//less than zero wraps around
line 1203
;1203:				newQuad = Q_B + newQuad;
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 7
ADDI4
ASGNI4
line 1204
;1204:			}
LABELV $727
line 1205
;1205:			if ( newQuad == attQuadStart )
ADDRLP4 116
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $729
line 1206
;1206:			{//never come off at the same angle that we would have if the attack was not interrupted
line 1207
;1207:				if ( Q_irand(0, 1 + gRandomUnlockAdd, qfalse, 0) )
ADDRLP4 124
CNSTI4 0
ASGNI4
ADDRLP4 124
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 124
INDIRI4
ARGI4
ADDRLP4 124
INDIRI4
ARGI4
ADDRLP4 128
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $731
line 1208
;1208:				{
line 1209
;1209:					newQuad--;
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1210
;1210:				}
ADDRGP4 $732
JUMPV
LABELV $731
line 1212
;1211:				else
;1212:				{
line 1213
;1213:					newQuad++;
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1214
;1214:				}
LABELV $732
line 1215
;1215:				if ( newQuad < Q_BR )
ADDRLP4 116
INDIRI4
CNSTI4 0
GEI4 $733
line 1216
;1216:				{
line 1217
;1217:					newQuad = Q_B;
ADDRLP4 116
CNSTI4 7
ASGNI4
line 1218
;1218:				}
ADDRGP4 $734
JUMPV
LABELV $733
line 1219
;1219:				else if ( newQuad > Q_B )
ADDRLP4 116
INDIRI4
CNSTI4 7
LEI4 $735
line 1220
;1220:				{
line 1221
;1221:					newQuad = Q_BR;
ADDRLP4 116
CNSTI4 0
ASGNI4
line 1222
;1222:				}
LABELV $735
LABELV $734
line 1223
;1223:			}
LABELV $729
line 1224
;1224:			if ( newQuad == defQuad )
ADDRLP4 116
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $737
line 1225
;1225:			{//bounce straight back
line 1226
;1226:				int attMove = attacker->client->ps.saberMove;
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 1227
;1227:				attacker->client->ps.saberMove = PM_SaberBounceForAttack( attacker->client->ps.saberMove );
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 PM_SaberBounceForAttack
CALLI4
ASGNI4
ADDRLP4 128
INDIRP4
ADDRLP4 132
INDIRI4
ASGNI4
line 1228
;1228:				if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $739
line 1229
;1229:				{
line 1230
;1230:					Com_Printf( "attack %s vs. parry %s bounced to %s\n", 
ADDRGP4 $719
ARGP4
ADDRLP4 136
CNSTI4 40
ASGNI4
ADDRLP4 140
CNSTI4 3
ASGNI4
ADDRLP4 144
ADDRGP4 animTable
ASGNP4
ADDRLP4 136
INDIRI4
ADDRLP4 124
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
LSHI4
ADDRLP4 144
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 148
CNSTI4 408
ASGNI4
ADDRLP4 152
CNSTI4 512
ASGNI4
ADDRLP4 136
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
LSHI4
ADDRLP4 144
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 136
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
LSHI4
ADDRLP4 144
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1234
;1231:						animTable[saberMoveData[attMove].animToUse].name, 
;1232:						animTable[saberMoveData[defender->client->ps.saberMove].animToUse].name,
;1233:						animTable[saberMoveData[attacker->client->ps.saberMove].animToUse].name );
;1234:				}
LABELV $739
line 1235
;1235:				attacker->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 1236
;1236:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $665
JUMPV
LABELV $737
line 1240
;1237:			}
;1238:			//else, pick a deflection
;1239:			else
;1240:			{
line 1241
;1241:				int attMove = attacker->client->ps.saberMove;
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 1242
;1242:				attacker->client->ps.saberMove = PM_SaberDeflectionForQuad( newQuad );
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 128
ADDRGP4 PM_SaberDeflectionForQuad
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 128
INDIRI4
ASGNI4
line 1243
;1243:				if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $745
line 1244
;1244:				{
line 1245
;1245:					Com_Printf( "attack %s vs. parry %s deflected to %s\n", 
ADDRGP4 $748
ARGP4
ADDRLP4 132
CNSTI4 40
ASGNI4
ADDRLP4 136
CNSTI4 3
ASGNI4
ADDRLP4 140
ADDRGP4 animTable
ASGNP4
ADDRLP4 132
INDIRI4
ADDRLP4 124
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 136
INDIRI4
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 144
CNSTI4 408
ASGNI4
ADDRLP4 148
CNSTI4 512
ASGNI4
ADDRLP4 132
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 136
INDIRI4
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 132
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 136
INDIRI4
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1249
;1246:						animTable[saberMoveData[attMove].animToUse].name, 
;1247:						animTable[saberMoveData[defender->client->ps.saberMove].animToUse].name,
;1248:						animTable[saberMoveData[attacker->client->ps.saberMove].animToUse].name );
;1249:				}
LABELV $745
line 1250
;1250:				attacker->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1251
;1251:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $665
JUMPV
LABELV $694
line 1256
;1252:			}
;1253:		}
;1254:	}
;1255:	else
;1256:	{ //old math-based method (probably broken)
line 1260
;1257:		vec3_t	att_HitDir, def_BladeDir, temp;
;1258:		float	hitDot;
;1259:
;1260:		VectorCopy(attacker->client->lastSaberBase_Always, temp);
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43780
ADDP4
INDIRB
ASGNB 12
line 1262
;1261:
;1262:		AngleVectors(attacker->client->lastSaberDir_Always, att_HitDir, 0, 0);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43768
ADDP4
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 92
CNSTP4 0
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1264
;1263:
;1264:		AngleVectors(defender->client->lastSaberDir_Always, def_BladeDir, 0, 0);
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43768
ADDP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 96
CNSTP4 0
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1267
;1265:
;1266:		//now compare
;1267:		hitDot = DotProduct( att_HitDir, def_BladeDir );
ADDRLP4 88
ADDRLP4 64
INDIRF4
ADDRLP4 76
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 76+4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 76+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1268
;1268:		if ( hitDot < 0.25f && hitDot > -0.25f )
ADDRLP4 100
ADDRLP4 88
INDIRF4
ASGNF4
ADDRLP4 100
INDIRF4
CNSTF4 1048576000
GEF4 $756
ADDRLP4 100
INDIRF4
CNSTF4 3196059648
LEF4 $756
line 1269
;1269:		{//hit pretty much perpendicular, pop straight back
line 1270
;1270:			attacker->client->ps.saberMove = PM_SaberBounceForAttack( attacker->client->ps.saberMove );
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 PM_SaberBounceForAttack
CALLI4
ASGNI4
ADDRLP4 104
INDIRP4
ADDRLP4 108
INDIRI4
ASGNI4
line 1271
;1271:			attacker->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 1272
;1272:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $665
JUMPV
LABELV $756
line 1275
;1273:		}
;1274:		else 
;1275:		{//a deflection
line 1280
;1276:			vec3_t	att_Right, att_Up, att_DeflectionDir;
;1277:			float	swingRDot, swingUDot;
;1278:
;1279:			//get the direction of the deflection
;1280:			VectorScale( def_BladeDir, hitDot, att_DeflectionDir );
ADDRLP4 148
ADDRLP4 88
INDIRF4
ASGNF4
ADDRLP4 104
ADDRLP4 76
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+4
ADDRLP4 76+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+8
ADDRLP4 76+8
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ASGNF4
line 1282
;1281:			//get our bounce straight back direction
;1282:			VectorScale( att_HitDir, -1.0f, temp );
ADDRLP4 152
CNSTF4 3212836864
ASGNF4
ADDRLP4 52
ADDRLP4 152
INDIRF4
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 152
INDIRF4
ADDRLP4 64+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 52+8
CNSTF4 3212836864
ADDRLP4 64+8
INDIRF4
MULF4
ASGNF4
line 1284
;1283:			//add the bounce back and deflection
;1284:			VectorAdd( att_DeflectionDir, temp, att_DeflectionDir );
ADDRLP4 104
ADDRLP4 104
INDIRF4
ADDRLP4 52
INDIRF4
ADDF4
ASGNF4
ADDRLP4 104+4
ADDRLP4 104+4
INDIRF4
ADDRLP4 52+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 104+8
ADDRLP4 104+8
INDIRF4
ADDRLP4 52+8
INDIRF4
ADDF4
ASGNF4
line 1286
;1285:			//normalize the result to determine what direction our saber should bounce back toward
;1286:			VectorNormalize( att_DeflectionDir );
ADDRLP4 104
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1289
;1287:
;1288:			//need to know the direction of the deflectoin relative to the attacker's facing
;1289:			VectorSet( temp, 0, attacker->client->ps.viewangles[YAW], 0 );//presumes no pitch!
ADDRLP4 52
CNSTF4 0
ASGNF4
ADDRLP4 52+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52+8
CNSTF4 0
ASGNF4
line 1290
;1290:			AngleVectors( temp, NULL, att_Right, att_Up );
ADDRLP4 52
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 116
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1291
;1291:			swingRDot = DotProduct( att_Right, att_DeflectionDir );
ADDRLP4 140
ADDRLP4 116
INDIRF4
ADDRLP4 104
INDIRF4
MULF4
ADDRLP4 116+4
INDIRF4
ADDRLP4 104+4
INDIRF4
MULF4
ADDF4
ADDRLP4 116+8
INDIRF4
ADDRLP4 104+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1292
;1292:			swingUDot = DotProduct( att_Up, att_DeflectionDir );
ADDRLP4 144
ADDRLP4 128
INDIRF4
ADDRLP4 104
INDIRF4
MULF4
ADDRLP4 128+4
INDIRF4
ADDRLP4 104+4
INDIRF4
MULF4
ADDF4
ADDRLP4 128+8
INDIRF4
ADDRLP4 104+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1294
;1293:
;1294:			if ( swingRDot > 0.25f )
ADDRLP4 140
INDIRF4
CNSTF4 1048576000
LEF4 $782
line 1295
;1295:			{//deflect to right
line 1296
;1296:				if ( swingUDot > 0.25f )
ADDRLP4 144
INDIRF4
CNSTF4 1048576000
LEF4 $784
line 1297
;1297:				{//deflect to top
line 1298
;1298:					attacker->client->ps.saberMove = LS_D1_TR;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 83
ASGNI4
line 1299
;1299:				}
ADDRGP4 $783
JUMPV
LABELV $784
line 1300
;1300:				else if ( swingUDot < -0.25f )
ADDRLP4 144
INDIRF4
CNSTF4 3196059648
GEF4 $786
line 1301
;1301:				{//deflect to bottom
line 1302
;1302:					attacker->client->ps.saberMove = LS_D1_BR;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 81
ASGNI4
line 1303
;1303:				}
ADDRGP4 $783
JUMPV
LABELV $786
line 1305
;1304:				else
;1305:				{//deflect horizontally
line 1306
;1306:					attacker->client->ps.saberMove = LS_D1__R;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 82
ASGNI4
line 1307
;1307:				}
line 1308
;1308:			}
ADDRGP4 $783
JUMPV
LABELV $782
line 1309
;1309:			else if ( swingRDot < -0.25f )
ADDRLP4 140
INDIRF4
CNSTF4 3196059648
GEF4 $788
line 1310
;1310:			{//deflect to left
line 1311
;1311:				if ( swingUDot > 0.25f )
ADDRLP4 144
INDIRF4
CNSTF4 1048576000
LEF4 $790
line 1312
;1312:				{//deflect to top
line 1313
;1313:					attacker->client->ps.saberMove = LS_D1_TL;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 85
ASGNI4
line 1314
;1314:				}
ADDRGP4 $789
JUMPV
LABELV $790
line 1315
;1315:				else if ( swingUDot < -0.25f )
ADDRLP4 144
INDIRF4
CNSTF4 3196059648
GEF4 $792
line 1316
;1316:				{//deflect to bottom
line 1317
;1317:					attacker->client->ps.saberMove = LS_D1_BL;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 87
ASGNI4
line 1318
;1318:				}
ADDRGP4 $789
JUMPV
LABELV $792
line 1320
;1319:				else
;1320:				{//deflect horizontally
line 1321
;1321:					attacker->client->ps.saberMove = LS_D1__L;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 86
ASGNI4
line 1322
;1322:				}
line 1323
;1323:			}
ADDRGP4 $789
JUMPV
LABELV $788
line 1325
;1324:			else
;1325:			{//deflect in middle
line 1326
;1326:				if ( swingUDot > 0.25f )
ADDRLP4 144
INDIRF4
CNSTF4 1048576000
LEF4 $794
line 1327
;1327:				{//deflect to top
line 1328
;1328:					attacker->client->ps.saberMove = LS_D1_T_;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 84
ASGNI4
line 1329
;1329:				}
ADDRGP4 $795
JUMPV
LABELV $794
line 1330
;1330:				else if ( swingUDot < -0.25f )
ADDRLP4 144
INDIRF4
CNSTF4 3196059648
GEF4 $796
line 1331
;1331:				{//deflect to bottom
line 1332
;1332:					attacker->client->ps.saberMove = LS_D1_B_;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 88
ASGNI4
line 1333
;1333:				}
ADDRGP4 $797
JUMPV
LABELV $796
line 1335
;1334:				else
;1335:				{//deflect horizontally?  Well, no such thing as straight back in my face, so use top
line 1336
;1336:					if ( swingRDot > 0 )
ADDRLP4 140
INDIRF4
CNSTF4 0
LEF4 $798
line 1337
;1337:					{
line 1338
;1338:						attacker->client->ps.saberMove = LS_D1_TR;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 83
ASGNI4
line 1339
;1339:					}
ADDRGP4 $799
JUMPV
LABELV $798
line 1340
;1340:					else if ( swingRDot < 0 )
ADDRLP4 140
INDIRF4
CNSTF4 0
GEF4 $800
line 1341
;1341:					{
line 1342
;1342:						attacker->client->ps.saberMove = LS_D1_TL;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 85
ASGNI4
line 1343
;1343:					}
ADDRGP4 $801
JUMPV
LABELV $800
line 1345
;1344:					else
;1345:					{
line 1346
;1346:						attacker->client->ps.saberMove = LS_D1_T_;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 84
ASGNI4
line 1347
;1347:					}
LABELV $801
LABELV $799
line 1348
;1348:				}
LABELV $797
LABELV $795
line 1349
;1349:			}
LABELV $789
LABELV $783
line 1351
;1350:
;1351:			attacker->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1352
;1352:			return qtrue;
CNSTI4 1
RETI4
LABELV $665
endproc WP_GetSaberDeflectionAngle 156 16
export G_KnockawayForParry
proc G_KnockawayForParry 4 0
line 1358
;1353:		}
;1354:	}
;1355:}
;1356:
;1357:int G_KnockawayForParry( int move )
;1358:{
line 1361
;1359:	//FIXME: need actual anims for this
;1360:	//FIXME: need to know which side of the saber was hit!  For now, we presume the saber gets knocked away from the center
;1361:	switch ( move )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 108
LTI4 $803
ADDRLP4 0
INDIRI4
CNSTI4 112
GTI4 $803
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $810-432
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $810
address $805
address $806
address $807
address $808
address $809
code
line 1362
;1362:	{
LABELV $805
line 1364
;1363:	case LS_PARRY_UP:
;1364:		return LS_K1_T_;//push up
CNSTI4 103
RETI4
ADDRGP4 $802
JUMPV
line 1365
;1365:		break;
LABELV $806
LABELV $803
line 1368
;1366:	case LS_PARRY_UR:
;1367:	default://case LS_READY:
;1368:		return LS_K1_TR;//push up, slightly to right
CNSTI4 104
RETI4
ADDRGP4 $802
JUMPV
line 1369
;1369:		break;
LABELV $807
line 1371
;1370:	case LS_PARRY_UL:
;1371:		return LS_K1_TL;//push up and to left
CNSTI4 105
RETI4
ADDRGP4 $802
JUMPV
line 1372
;1372:		break;
LABELV $808
line 1374
;1373:	case LS_PARRY_LR:
;1374:		return LS_K1_BR;//push down and to left
CNSTI4 106
RETI4
ADDRGP4 $802
JUMPV
line 1375
;1375:		break;
LABELV $809
line 1377
;1376:	case LS_PARRY_LL:
;1377:		return LS_K1_BL;//push down and to right
CNSTI4 107
RETI4
line 1378
;1378:		break;
LABELV $802
endproc G_KnockawayForParry 4 0
export G_GetAttackDamage
proc G_GetAttackDamage 52 12
line 1386
;1379:	}
;1380:}
;1381:
;1382:#define SABER_NONATTACK_DAMAGE 1
;1383:
;1384://For strong attacks, we ramp damage based on the point in the attack animation
;1385:int G_GetAttackDamage(gentity_t *self, int minDmg, int maxDmg, float multPoint)
;1386:{
line 1388
;1387:	// int peakDif = 0;
;1388:	int speedDif = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1389
;1389:	int totalDamage = maxDmg;
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
line 1390
;1390:	float peakPoint = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1392
;1391:	float attackAnimLength;
;1392:	float currentPoint = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 1393
;1393:	float damageFactor = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1394
;1394:	float animSpeedFactor = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 1396
;1395:
;1396:	if ( jk2gameplay == VERSION_1_04 ) attackAnimLength = bgGlobalAnimations[self->client->ps.torsoAnim&~ANIM_TOGGLEBIT].numFrames * abs(bgGlobalAnimations[self->client->ps.torsoAnim&~ANIM_TOGGLEBIT].frameLerp);
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $813
ADDRLP4 28
CNSTI4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
MULI4
CVIF4 4
ASGNF4
ADDRGP4 $814
JUMPV
LABELV $813
line 1397
;1397:	else							   attackAnimLength = bgGlobalAnimations[self->client->ps.torsoAnim].numFrames * abs(bgGlobalAnimations[self->client->ps.torsoAnim].frameLerp);
ADDRLP4 36
CNSTI4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
MULI4
CVIF4 4
ASGNF4
LABELV $814
line 1400
;1398:
;1399:	//Be sure to scale by the proper anim speed just as if we were going to play the animation
;1400:	BG_SaberStartTransAnim(self->client->ps.fd.saberAnimLevel, self->client->ps.torsoAnim&~ANIM_TOGGLEBIT, &animSpeedFactor);
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 BG_SaberStartTransAnim
CALLV
pop
line 1401
;1401:	speedDif = attackAnimLength - (attackAnimLength * animSpeedFactor);
ADDRLP4 16
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 1402
;1402:	attackAnimLength += speedDif;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1403
;1403:	peakPoint = attackAnimLength;
ADDRLP4 12
ADDRLP4 4
INDIRF4
ASGNF4
line 1404
;1404:	peakPoint -= attackAnimLength*multPoint;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 4
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
SUBF4
ASGNF4
line 1407
;1405:
;1406:	//we treat torsoTimer as the point in the animation (closer it is to attackAnimLength, closer it is to beginning)
;1407:	currentPoint = self->client->ps.torsoTimer;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1420
;1408:
;1409:	/*
;1410:	if (peakPoint > currentPoint)
;1411:	{
;1412:		peakDif = (peakPoint - currentPoint);
;1413:	}
;1414:	else
;1415:	{
;1416:		peakDif = (currentPoint - peakPoint);
;1417:	}
;1418:	*/
;1419:
;1420:	damageFactor = (float)((currentPoint/peakPoint));
ADDRLP4 8
ADDRLP4 20
INDIRF4
ADDRLP4 12
INDIRF4
DIVF4
ASGNF4
line 1421
;1421:	if (damageFactor > 1)
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
LEF4 $819
line 1422
;1422:	{
line 1423
;1423:		damageFactor = (2.0f - damageFactor);
ADDRLP4 8
CNSTF4 1073741824
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 1424
;1424:	}
LABELV $819
line 1426
;1425:
;1426:	totalDamage *= damageFactor;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1427
;1427:	if (totalDamage < minDmg)
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
GEI4 $821
line 1428
;1428:	{
line 1429
;1429:		totalDamage = minDmg;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 1430
;1430:	}
LABELV $821
line 1431
;1431:	if (totalDamage > maxDmg)
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $823
line 1432
;1432:	{
line 1433
;1433:		totalDamage = maxDmg;
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
line 1434
;1434:	}
LABELV $823
line 1438
;1435:
;1436:	//Com_Printf("%i\n", totalDamage);
;1437:
;1438:	return totalDamage;
ADDRLP4 0
INDIRI4
RETI4
LABELV $812
endproc G_GetAttackDamage 52 12
export G_GetAnimPoint
proc G_GetAnimPoint 44 12
line 1443
;1439:}
;1440:
;1441://Get the point in the animation and return a percentage of the current point in the anim between 0 and the total anim length (0.0f - 1.0f)
;1442:float G_GetAnimPoint(gentity_t *self)
;1443:{
line 1444
;1444:	int speedDif = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1446
;1445:	float attackAnimLength;
;1446:	float currentPoint = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1447
;1447:	float animSpeedFactor = 1.0f;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1448
;1448:	float animPercentage = 0;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 1450
;1449:
;1450:	if ( jk2gameplay == VERSION_1_04 ) attackAnimLength = bgGlobalAnimations[self->client->ps.torsoAnim&~ANIM_TOGGLEBIT].numFrames * abs(bgGlobalAnimations[self->client->ps.torsoAnim&~ANIM_TOGGLEBIT].frameLerp);
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $826
ADDRLP4 20
CNSTI4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
MULI4
CVIF4 4
ASGNF4
ADDRGP4 $827
JUMPV
LABELV $826
line 1451
;1451:	else							   attackAnimLength = bgGlobalAnimations[self->client->ps.torsoAnim].numFrames * abs(bgGlobalAnimations[self->client->ps.torsoAnim].frameLerp);
ADDRLP4 28
CNSTI4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
MULI4
CVIF4 4
ASGNF4
LABELV $827
line 1454
;1452:
;1453:	//Be sure to scale by the proper anim speed just as if we were going to play the animation
;1454:	BG_SaberStartTransAnim(self->client->ps.fd.saberAnimLevel, self->client->ps.torsoAnim&~ANIM_TOGGLEBIT, &animSpeedFactor);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_SaberStartTransAnim
CALLV
pop
line 1455
;1455:	speedDif = attackAnimLength - (attackAnimLength * animSpeedFactor);
ADDRLP4 4
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
SUBF4
CVFI4 4
ASGNI4
line 1456
;1456:	attackAnimLength += speedDif;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1458
;1457:
;1458:	currentPoint = self->client->ps.torsoTimer;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1460
;1459:
;1460:	animPercentage = currentPoint/attackAnimLength;
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
DIVF4
ASGNF4
line 1464
;1461:
;1462:	//Com_Printf("%f\n", animPercentage);
;1463:
;1464:	return animPercentage;
ADDRLP4 16
INDIRF4
RETF4
LABELV $825
endproc G_GetAnimPoint 44 12
export G_ClientIdleInWorld
proc G_ClientIdleInWorld 12 0
line 1468
;1465:}
;1466:
;1467:qboolean G_ClientIdleInWorld(gentity_t *ent)
;1468:{
line 1469
;1469:	if (!ent->client->pers.cmd.upmove &&
ADDRLP4 0
ADDRFP4 0
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
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $833
ADDRLP4 0
INDIRP4
CNSTI4 1408
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $833
ADDRLP4 0
INDIRP4
CNSTI4 1409
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $833
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $833
ADDRLP4 8
INDIRI4
CNSTI4 64
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $833
ADDRLP4 8
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $833
ADDRLP4 8
INDIRI4
CNSTI4 512
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $833
ADDRLP4 8
INDIRI4
CNSTI4 1024
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $833
ADDRLP4 8
INDIRI4
CNSTI4 2048
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $833
ADDRLP4 8
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $833
line 1479
;1470:		!ent->client->pers.cmd.forwardmove &&
;1471:		!ent->client->pers.cmd.rightmove &&
;1472:		!(ent->client->pers.cmd.buttons & BUTTON_GESTURE) &&
;1473:		!(ent->client->pers.cmd.buttons & BUTTON_FORCEGRIP) &&
;1474:		!(ent->client->pers.cmd.buttons & BUTTON_ALT_ATTACK) &&
;1475:		!(ent->client->pers.cmd.buttons & BUTTON_FORCEPOWER) &&
;1476:		!(ent->client->pers.cmd.buttons & BUTTON_FORCE_LIGHTNING) &&
;1477:		!(ent->client->pers.cmd.buttons & BUTTON_FORCE_DRAIN) &&
;1478:		!(ent->client->pers.cmd.buttons & BUTTON_ATTACK))
;1479:	{
line 1480
;1480:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $832
JUMPV
LABELV $833
line 1483
;1481:	}
;1482:
;1483:	return qfalse;
CNSTI4 0
RETI4
LABELV $832
endproc G_ClientIdleInWorld 12 0
lit
align 4
LABELV $842
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export G_G2TraceCollide
code
proc G_G2TraceCollide 1112 48
line 1488
;1484:}
;1485:
;1486:#ifdef G2_COLLISION_ENABLED
;1487:qboolean G_G2TraceCollide(trace_t *tr, vec3_t lastValidStart, vec3_t lastValidEnd, vec3_t traceMins, vec3_t traceMaxs)
;1488:{
line 1489
;1489:	if (!g_saberGhoul2Collision.integer || jk2version == VERSION_1_02)
ADDRGP4 g_saberGhoul2Collision+12
INDIRI4
CNSTI4 0
EQI4 $839
ADDRGP4 jk2version
INDIRI4
CNSTI4 2
NEI4 $836
LABELV $839
line 1490
;1490:	{
line 1491
;1491:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $835
JUMPV
LABELV $836
line 1494
;1492:	}
;1493:
;1494:	if (tr->entityNum < MAX_CLIENTS)
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 32
GEI4 $840
line 1495
;1495:	{ //Hit a client with the normal trace, try the collision trace.
line 1498
;1496:		G2Trace_t		G2Trace;
;1497:		gentity_t		*g2Hit;
;1498:		vec3_t			vIdentity = {1.0f, 1.0f, 1.0f};
ADDRLP4 1036
ADDRGP4 $842
INDIRB
ASGNB 12
line 1500
;1499:		vec3_t			angles;
;1500:		int				tN = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1501
;1501:		float			fRadius = 0;
ADDRLP4 1032
CNSTF4 0
ASGNF4
line 1503
;1502:
;1503:		if (traceMins[0] ||
ADDRLP4 1060
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 1064
CNSTF4 0
ASGNF4
ADDRLP4 1060
INDIRP4
INDIRF4
ADDRLP4 1064
INDIRF4
NEF4 $849
ADDRLP4 1068
CNSTI4 4
ASGNI4
ADDRLP4 1060
INDIRP4
ADDRLP4 1068
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1064
INDIRF4
NEF4 $849
ADDRLP4 1072
CNSTI4 8
ASGNI4
ADDRLP4 1060
INDIRP4
ADDRLP4 1072
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1064
INDIRF4
NEF4 $849
ADDRLP4 1076
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1076
INDIRP4
INDIRF4
ADDRLP4 1064
INDIRF4
NEF4 $849
ADDRLP4 1076
INDIRP4
ADDRLP4 1068
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1064
INDIRF4
NEF4 $849
ADDRLP4 1076
INDIRP4
ADDRLP4 1072
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1064
INDIRF4
EQF4 $843
LABELV $849
line 1509
;1504:			traceMins[1] ||
;1505:			traceMins[2] ||
;1506:			traceMaxs[0] ||
;1507:			traceMaxs[1] ||
;1508:			traceMaxs[2])
;1509:		{
line 1510
;1510:			fRadius=(traceMaxs[0]-traceMins[0])/2.0f;
ADDRLP4 1032
ADDRFP4 16
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
SUBF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1511
;1511:		}
LABELV $843
line 1513
;1512:
;1513:		memset (&G2Trace, 0, sizeof(G2Trace));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1024
ARGU4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 $851
JUMPV
LABELV $850
line 1516
;1514:
;1515:		while (tN < MAX_G2_COLLISIONS)
;1516:		{
line 1517
;1517:			G2Trace[tN].mEntityNum = -1;
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 4+4
ADDP4
CNSTI4 -1
ASGNI4
line 1518
;1518:			tN++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1519
;1519:		}
LABELV $851
line 1515
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $850
line 1520
;1520:		g2Hit = &g_entities[tr->entityNum];
ADDRLP4 1028
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1522
;1521:
;1522:		if (g2Hit && g2Hit->inuse && g2Hit->client && g2Hit->client->ghoul2)
ADDRLP4 1084
CNSTU4 0
ASGNU4
ADDRLP4 1028
INDIRP4
CVPU4 4
ADDRLP4 1084
INDIRU4
EQU4 $854
ADDRLP4 1028
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $854
ADDRLP4 1088
ADDRLP4 1028
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1088
INDIRP4
CVPU4 4
ADDRLP4 1084
INDIRU4
EQU4 $854
ADDRLP4 1088
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1084
INDIRU4
EQU4 $854
line 1523
;1523:		{
line 1524
;1524:			angles[ROLL] = angles[PITCH] = 0;
ADDRLP4 1092
CNSTF4 0
ASGNF4
ADDRLP4 1048
ADDRLP4 1092
INDIRF4
ASGNF4
ADDRLP4 1048+8
ADDRLP4 1092
INDIRF4
ASGNF4
line 1525
;1525:			angles[YAW] = g2Hit->client->ps.viewangles[YAW];
ADDRLP4 1048+4
ADDRLP4 1028
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 1527
;1526:
;1527:			trap_G2API_CollisionDetect ( G2Trace, g2Hit->client->ghoul2, angles, g2Hit->client->ps.origin, LEVELTIME(g2Hit->client), g2Hit->s.number, lastValidStart, lastValidEnd, vIdentity, 0, 2, fRadius );
ADDRLP4 4
ARGP4
ADDRLP4 1104
ADDRLP4 1028
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1104
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1108
ADDRLP4 1028
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $862
ADDRLP4 1108
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $862
ADDRLP4 1028
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $864
ADDRLP4 1100
ADDRLP4 1028
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $865
JUMPV
LABELV $864
ADDRLP4 1100
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $865
ADDRLP4 1096
ADDRLP4 1100
INDIRI4
ASGNI4
ADDRGP4 $863
JUMPV
LABELV $862
ADDRLP4 1096
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $863
ADDRLP4 1096
INDIRI4
ARGI4
ADDRLP4 1028
INDIRP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1036
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 1032
INDIRF4
ARGF4
ADDRGP4 trap_G2API_CollisionDetect
INDIRP4
CALLV
pop
line 1529
;1528:
;1529:			if (G2Trace[0].mEntityNum != g2Hit->s.number)
ADDRLP4 4+4
INDIRI4
ADDRLP4 1028
INDIRP4
INDIRI4
EQI4 $866
line 1530
;1530:			{
line 1531
;1531:				tr->fraction = 1.0f;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 1532
;1532:				tr->entityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 1023
ASGNI4
line 1533
;1533:				tr->startsolid = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1534
;1534:				tr->allsolid = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1535
;1535:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $835
JUMPV
LABELV $866
line 1538
;1536:			}
;1537:			else
;1538:			{ //The ghoul2 trace result matches, so copy the collision position into the trace endpos and send it back.
line 1539
;1539:				VectorCopy(G2Trace[0].mCollisionPosition, tr->endpos);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4+20
INDIRB
ASGNB 12
line 1540
;1540:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $835
JUMPV
LABELV $854
line 1543
;1541:			}
;1542:		}
;1543:	}
LABELV $840
line 1545
;1544:
;1545:	return qfalse;
CNSTI4 0
RETI4
LABELV $835
endproc G_G2TraceCollide 1112 48
export G_SaberInBackAttack
proc G_SaberInBackAttack 4 0
line 1550
;1546:}
;1547:#endif
;1548:
;1549:qboolean G_SaberInBackAttack(int move)
;1550:{
line 1551
;1551:	switch (move)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $873
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $873
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $873
ADDRGP4 $871
JUMPV
line 1552
;1552:	{
LABELV $873
line 1556
;1553:	case LS_A_BACK:
;1554:	case LS_A_BACK_CR:
;1555:	case LS_A_BACKSTAB:
;1556:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $870
JUMPV
LABELV $871
line 1559
;1557:	}
;1558:
;1559:	return qfalse;
CNSTI4 0
RETI4
LABELV $870
endproc G_SaberInBackAttack 4 0
export CheckSaberDamage_1_02
proc CheckSaberDamage_1_02 1296 32
line 1568
;1560:}
;1561:
;1562://rww - MP version of the saber damage function. This is where all the things like blocking, triggering a parry,
;1563://triggering a broken parry, doing actual damage, etc. are done for the saber. It doesn't resemble the SP
;1564://version very much, but functionality is (hopefully) about the same.
;1565:
;1566:
;1567:qboolean CheckSaberDamage_1_02(gentity_t *self, vec3_t saberStart, vec3_t saberEnd, qboolean doInterpolate)
;1568:{ // MVSDK: This functions seems to be very different in 1.02, it even has less parameters than in 1.03 or 1.04...
line 1571
;1569:	trace_t tr;
;1570:	vec3_t dir;
;1571:	int dmg = 0;
ADDRLP4 1080
CNSTI4 0
ASGNI4
line 1572
;1572:	int attackStr = 0;
ADDRLP4 1104
CNSTI4 0
ASGNI4
line 1573
;1573:	qboolean idleDamage = qfalse;
ADDRLP4 1108
CNSTI4 0
ASGNI4
line 1574
;1574:	qboolean didHit = qfalse;
ADDRLP4 1100
CNSTI4 0
ASGNI4
line 1575
;1575:	int nowTime = LEVELTIME(self->client);
ADDRLP4 1120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $879
ADDRLP4 1120
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $879
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $881
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $882
JUMPV
LABELV $881
ADDRLP4 1116
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $882
ADDRLP4 1112
ADDRLP4 1116
INDIRI4
ASGNI4
ADDRGP4 $880
JUMPV
LABELV $879
ADDRLP4 1112
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $880
ADDRLP4 1096
ADDRLP4 1112
INDIRI4
ASGNI4
line 1577
;1576:
;1577:	if (self->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
EQI4 $883
line 1578
;1578:	{
line 1579
;1579:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $874
JUMPV
LABELV $883
line 1582
;1580:	}
;1581:
;1582:	if (doInterpolate)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $885
line 1583
;1583:	{ //This didn't quite work out like I hoped. But it's better than nothing. Sort of.
line 1585
;1584:		vec3_t oldSaberStart, oldSaberEnd, saberDif, oldSaberDif;
;1585:		int traceTests = 0;
ADDRLP4 1176
CNSTI4 0
ASGNI4
line 1586
;1586:		float trDif = 8;
ADDRLP4 1124
CNSTF4 1090519040
ASGNF4
line 1588
;1587:
;1588:		VectorCopy(self->client->lastSaberBase, oldSaberStart);
ADDRLP4 1128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43756
ADDP4
INDIRB
ASGNB 12
line 1589
;1589:		VectorCopy(self->client->lastSaberTip, oldSaberEnd);
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43744
ADDP4
INDIRB
ASGNB 12
line 1591
;1590:
;1591:		VectorSubtract(saberStart, saberEnd, saberDif);
ADDRLP4 1180
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1184
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1152
ADDRLP4 1180
INDIRP4
INDIRF4
ADDRLP4 1184
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1188
CNSTI4 4
ASGNI4
ADDRLP4 1152+4
ADDRLP4 1180
INDIRP4
ADDRLP4 1188
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1184
INDIRP4
ADDRLP4 1188
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1192
CNSTI4 8
ASGNI4
ADDRLP4 1152+8
ADDRFP4 4
INDIRP4
ADDRLP4 1192
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 1192
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1592
;1592:		VectorSubtract(oldSaberStart, oldSaberEnd, oldSaberDif);
ADDRLP4 1164
ADDRLP4 1128
INDIRF4
ADDRLP4 1140
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1164+4
ADDRLP4 1128+4
INDIRF4
ADDRLP4 1140+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1164+8
ADDRLP4 1128+8
INDIRF4
ADDRLP4 1140+8
INDIRF4
SUBF4
ASGNF4
line 1594
;1593:
;1594:		VectorNormalize(saberDif);
ADDRLP4 1152
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1595
;1595:		VectorNormalize(oldSaberDif);
ADDRLP4 1164
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1597
;1596:
;1597:		saberEnd[0] = saberStart[0] - (saberDif[0]*trDif);
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 1152
INDIRF4
ADDRLP4 1124
INDIRF4
MULF4
SUBF4
ASGNF4
line 1598
;1598:		saberEnd[1] = saberStart[1] - (saberDif[1]*trDif);
ADDRLP4 1196
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1152+4
INDIRF4
ADDRLP4 1124
INDIRF4
MULF4
SUBF4
ASGNF4
line 1599
;1599:		saberEnd[2] = saberStart[2] - (saberDif[2]*trDif);
ADDRLP4 1200
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1200
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1200
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1152+8
INDIRF4
ADDRLP4 1124
INDIRF4
MULF4
SUBF4
ASGNF4
line 1601
;1600:
;1601:		oldSaberEnd[0] = oldSaberStart[0] - (oldSaberDif[0]*trDif);
ADDRLP4 1140
ADDRLP4 1128
INDIRF4
ADDRLP4 1164
INDIRF4
ADDRLP4 1124
INDIRF4
MULF4
SUBF4
ASGNF4
line 1602
;1602:		oldSaberEnd[1] = oldSaberStart[1] - (oldSaberDif[1]*trDif);
ADDRLP4 1140+4
ADDRLP4 1128+4
INDIRF4
ADDRLP4 1164+4
INDIRF4
ADDRLP4 1124
INDIRF4
MULF4
SUBF4
ASGNF4
line 1603
;1603:		oldSaberEnd[2] = oldSaberStart[2] - (oldSaberDif[2]*trDif);
ADDRLP4 1140+8
ADDRLP4 1128+8
INDIRF4
ADDRLP4 1164+8
INDIRF4
ADDRLP4 1124
INDIRF4
MULF4
SUBF4
ASGNF4
line 1607
;1604:
;1605:		//G_TestLine(oldSaberEnd, saberEnd, 0x0000ff, 50);
;1606:
;1607:		JP_Trace(&tr, saberEnd, NULL, NULL, saberStart, self->s.number, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER));
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1204
CNSTP4 0
ASGNP4
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1204
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 262417
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1609
;1608:
;1609:		trDif++;
ADDRLP4 1124
ADDRLP4 1124
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
ADDRGP4 $904
JUMPV
LABELV $903
line 1612
;1610:
;1611:		while (tr.fraction == 1.0 && traceTests < 4 && tr.entityNum >= ENTITYNUM_NONE)
;1612:		{
line 1613
;1613:			VectorCopy(self->client->lastSaberBase, oldSaberStart);
ADDRLP4 1128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43756
ADDP4
INDIRB
ASGNB 12
line 1614
;1614:			VectorCopy(self->client->lastSaberTip, oldSaberEnd);
ADDRLP4 1140
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43744
ADDP4
INDIRB
ASGNB 12
line 1616
;1615:
;1616:			VectorSubtract(saberStart, saberEnd, saberDif);
ADDRLP4 1208
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1212
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1152
ADDRLP4 1208
INDIRP4
INDIRF4
ADDRLP4 1212
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1216
CNSTI4 4
ASGNI4
ADDRLP4 1152+4
ADDRLP4 1208
INDIRP4
ADDRLP4 1216
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1212
INDIRP4
ADDRLP4 1216
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1220
CNSTI4 8
ASGNI4
ADDRLP4 1152+8
ADDRFP4 4
INDIRP4
ADDRLP4 1220
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 1220
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1617
;1617:			VectorSubtract(oldSaberStart, oldSaberEnd, oldSaberDif);
ADDRLP4 1164
ADDRLP4 1128
INDIRF4
ADDRLP4 1140
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1164+4
ADDRLP4 1128+4
INDIRF4
ADDRLP4 1140+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1164+8
ADDRLP4 1128+8
INDIRF4
ADDRLP4 1140+8
INDIRF4
SUBF4
ASGNF4
line 1619
;1618:
;1619:			VectorNormalize(saberDif);
ADDRLP4 1152
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1620
;1620:			VectorNormalize(oldSaberDif);
ADDRLP4 1164
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1622
;1621:
;1622:			saberEnd[0] = saberStart[0] - (saberDif[0]*trDif);
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 1152
INDIRF4
ADDRLP4 1124
INDIRF4
MULF4
SUBF4
ASGNF4
line 1623
;1623:			saberEnd[1] = saberStart[1] - (saberDif[1]*trDif);
ADDRLP4 1224
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1224
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1224
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1152+4
INDIRF4
ADDRLP4 1124
INDIRF4
MULF4
SUBF4
ASGNF4
line 1624
;1624:			saberEnd[2] = saberStart[2] - (saberDif[2]*trDif);
ADDRLP4 1228
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1228
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1228
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1152+8
INDIRF4
ADDRLP4 1124
INDIRF4
MULF4
SUBF4
ASGNF4
line 1626
;1625:
;1626:			oldSaberEnd[0] = oldSaberStart[0] - (oldSaberDif[0]*trDif);
ADDRLP4 1140
ADDRLP4 1128
INDIRF4
ADDRLP4 1164
INDIRF4
ADDRLP4 1124
INDIRF4
MULF4
SUBF4
ASGNF4
line 1627
;1627:			oldSaberEnd[1] = oldSaberStart[1] - (oldSaberDif[1]*trDif);
ADDRLP4 1140+4
ADDRLP4 1128+4
INDIRF4
ADDRLP4 1164+4
INDIRF4
ADDRLP4 1124
INDIRF4
MULF4
SUBF4
ASGNF4
line 1628
;1628:			oldSaberEnd[2] = oldSaberStart[2] - (oldSaberDif[2]*trDif);
ADDRLP4 1140+8
ADDRLP4 1128+8
INDIRF4
ADDRLP4 1164+8
INDIRF4
ADDRLP4 1124
INDIRF4
MULF4
SUBF4
ASGNF4
line 1632
;1629:
;1630:			//G_TestLine(oldSaberEnd, saberEnd, 0x0000ff, 50);
;1631:
;1632:			JP_Trace(&tr, saberEnd, NULL, NULL, saberStart, self->s.number, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER));
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1232
CNSTP4 0
ASGNP4
ADDRLP4 1232
INDIRP4
ARGP4
ADDRLP4 1232
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 262417
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1634
;1633:
;1634:			traceTests++;
ADDRLP4 1176
ADDRLP4 1176
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1635
;1635:			trDif += 8;
ADDRLP4 1124
ADDRLP4 1124
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1636
;1636:		}
LABELV $904
line 1611
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $925
ADDRLP4 1176
INDIRI4
CNSTI4 4
GEI4 $925
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
GEI4 $903
LABELV $925
line 1637
;1637:	}
ADDRGP4 $886
JUMPV
LABELV $885
line 1639
;1638:	else
;1639:	{
line 1640
;1640:		JP_Trace(&tr, saberStart, NULL, NULL, saberEnd, self->s.number, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER));
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1124
CNSTP4 0
ASGNP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 262417
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1641
;1641:	}
LABELV $886
line 1643
;1642:
;1643:	if (SaberAttacking(self) &&
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1124
ADDRGP4 SaberAttacking
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
EQI4 $926
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
ADDRLP4 1096
INDIRI4
GEI4 $926
line 1645
;1644:		self->client->ps.saberAttackWound < nowTime)
;1645:	{ //this animation is that of the last attack movement, and so it should do full damage
line 1646
;1646:		dmg = SABER_HITDAMAGE;//*self->client->ps.fd.saberAnimLevel;
ADDRLP4 1080
CNSTI4 35
ASGNI4
line 1648
;1647:
;1648:		if (self->client->ps.fd.saberAnimLevel == 3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $928
line 1649
;1649:		{
line 1650
;1650:			dmg = 100;
ADDRLP4 1080
CNSTI4 100
ASGNI4
line 1651
;1651:		}
ADDRGP4 $929
JUMPV
LABELV $928
line 1652
;1652:		else if (self->client->ps.fd.saberAnimLevel == 2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
NEI4 $930
line 1653
;1653:		{
line 1654
;1654:			dmg = 60;
ADDRLP4 1080
CNSTI4 60
ASGNI4
line 1655
;1655:		}
LABELV $930
LABELV $929
line 1657
;1656:
;1657:		attackStr = self->client->ps.fd.saberAnimLevel;
ADDRLP4 1104
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 1658
;1658:	}
ADDRGP4 $927
JUMPV
LABELV $926
line 1659
;1659:	else if (self->client->ps.saberIdleWound < nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 1096
INDIRI4
GEI4 $932
line 1660
;1660:	{ //just touching, do minimal damage and only check for it every 200ms (mainly to cut down on network traffic for hit events)
line 1661
;1661:		dmg = 5;
ADDRLP4 1080
CNSTI4 5
ASGNI4
line 1662
;1662:		self->client->ps.saberIdleWound = nowTime + 200;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 1096
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1663
;1663:		idleDamage = qtrue;
ADDRLP4 1108
CNSTI4 1
ASGNI4
line 1664
;1664:	}
LABELV $932
LABELV $927
line 1666
;1665:
;1666:	if (!dmg)
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $934
line 1667
;1667:	{
line 1668
;1668:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $874
JUMPV
LABELV $934
line 1671
;1669:	}
;1670:
;1671:	if (dmg > 5 && self->client->ps.isJediMaster)
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $936
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $936
line 1672
;1672:	{ //give the Jedi Master more saber attack power
line 1673
;1673:		dmg *= 2;
ADDRLP4 1080
ADDRLP4 1080
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1674
;1674:	}
LABELV $936
line 1676
;1675:
;1676:	VectorSubtract(saberEnd, saberStart, dir);
ADDRLP4 1128
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1132
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1128
INDIRP4
INDIRF4
ADDRLP4 1132
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1136
CNSTI4 4
ASGNI4
ADDRLP4 1084+4
ADDRLP4 1128
INDIRP4
ADDRLP4 1136
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1132
INDIRP4
ADDRLP4 1136
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1140
CNSTI4 8
ASGNI4
ADDRLP4 1084+8
ADDRFP4 8
INDIRP4
ADDRLP4 1140
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 1140
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1677
;1677:	VectorNormalize(dir);
ADDRLP4 1084
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1683
;1678:
;1679:	//rww - I'm saying || tr.startsolid here, because otherwise your saber tends to skip positions and go through
;1680:	//people, and the compensation traces start in their bbox too. Which results in the saber passing through people
;1681:	//when you visually cut right through them. Which sucks.
;1682:
;1683:	if ((tr.fraction != 1 || tr.startsolid) &&
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $947
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $940
LABELV $947
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $940
ADDRLP4 0+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $940
line 1688
;1684:		/*(!g_entities[tr.entityNum].client || !g_entities[tr.entityNum].client->ps.usingATST) &&*/
;1685:		//g_entities[tr.entityNum].client &&
;1686:		g_entities[tr.entityNum].takedamage &&
;1687:		tr.entityNum != self->s.number)
;1688:	{
line 1690
;1689:		gentity_t *te;
;1690:		qboolean unblockable = qfalse;
ADDRLP4 1148
CNSTI4 0
ASGNI4
line 1692
;1691:
;1692:		if (idleDamage &&
ADDRLP4 1108
INDIRI4
CNSTI4 0
EQI4 $948
ADDRLP4 1152
CNSTI4 2352
ASGNI4
ADDRLP4 1152
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $948
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1152
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1156
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1160
CNSTI4 0
ASGNI4
ADDRLP4 1156
INDIRI4
ADDRLP4 1160
INDIRI4
EQI4 $948
ADDRGP4 g_friendlySaber+12
INDIRI4
ADDRLP4 1160
INDIRI4
NEI4 $948
line 1696
;1693:			g_entities[tr.entityNum].client &&
;1694:			OnSameTeam(self, &g_entities[tr.entityNum]) &&
;1695:			!g_friendlySaber.integer)
;1696:		{
line 1697
;1697:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $874
JUMPV
LABELV $948
line 1700
;1698:		}
;1699:
;1700:		if (g_entities[tr.entityNum].inuse && g_entities[tr.entityNum].client &&
ADDRLP4 1164
CNSTI4 2352
ASGNI4
ADDRLP4 1168
CNSTI4 0
ASGNI4
ADDRLP4 1164
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1168
INDIRI4
EQI4 $954
ADDRLP4 1164
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $954
ADDRLP4 1164
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 1168
INDIRI4
EQI4 $954
ADDRLP4 1164
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $954
line 1703
;1701:			g_entities[tr.entityNum].client->ps.duelInProgress &&
;1702:			g_entities[tr.entityNum].client->ps.duelIndex != self->s.number)
;1703:		{
line 1704
;1704:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $874
JUMPV
LABELV $954
line 1707
;1705:		}
;1706:
;1707:		if (g_entities[tr.entityNum].inuse && g_entities[tr.entityNum].client &&
ADDRLP4 1172
CNSTI4 2352
ASGNI4
ADDRLP4 1176
CNSTI4 0
ASGNI4
ADDRLP4 1172
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $964
ADDRLP4 1172
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $964
ADDRLP4 1180
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $964
ADDRLP4 1180
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 1172
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
INDIRI4
EQI4 $964
line 1710
;1708:			self->client->ps.duelInProgress &&
;1709:			self->client->ps.duelIndex != g_entities[tr.entityNum].s.number)
;1710:		{
line 1711
;1711:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $874
JUMPV
LABELV $964
line 1714
;1712:		}
;1713:
;1714:		didHit = qtrue;
ADDRLP4 1100
CNSTI4 1
ASGNI4
line 1716
;1715:
;1716:		if (self->client->ps.saberMove == LS_A_BACK ||
ADDRLP4 1184
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1184
INDIRI4
CNSTI4 12
EQI4 $975
ADDRLP4 1184
INDIRI4
CNSTI4 13
EQI4 $975
ADDRLP4 1184
INDIRI4
CNSTI4 11
EQI4 $975
ADDRLP4 1184
INDIRI4
CNSTI4 15
NEI4 $971
LABELV $975
line 1720
;1717:			self->client->ps.saberMove == LS_A_BACK_CR ||
;1718:			self->client->ps.saberMove == LS_A_BACKSTAB ||
;1719:			self->client->ps.saberMove == LS_A_JUMP_T__B_)
;1720:		{
line 1721
;1721:			unblockable = qtrue;
ADDRLP4 1148
CNSTI4 1
ASGNI4
line 1722
;1722:			if (self->client->ps.saberMove == LS_A_JUMP_T__B_)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 15
NEI4 $976
line 1723
;1723:			{ //do extra damage for special unblockables
line 1724
;1724:				dmg += 40;
ADDRLP4 1080
ADDRLP4 1080
INDIRI4
CNSTI4 40
ADDI4
ASGNI4
line 1725
;1725:			}
ADDRGP4 $977
JUMPV
LABELV $976
line 1727
;1726:			else
;1727:			{
line 1728
;1728:				dmg += 20;
ADDRLP4 1080
ADDRLP4 1080
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 1729
;1729:			}
LABELV $977
line 1730
;1730:		}
LABELV $971
line 1732
;1731:
;1732:		if (g_entities[tr.entityNum].client && !unblockable && WP_SaberCanBlock(&g_entities[tr.entityNum], tr.endpos, 0, MOD_SABER, qfalse, attackStr))
ADDRLP4 1188
CNSTI4 2352
ASGNI4
ADDRLP4 1188
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $978
ADDRLP4 1192
CNSTI4 0
ASGNI4
ADDRLP4 1148
INDIRI4
ADDRLP4 1192
INDIRI4
NEI4 $978
ADDRLP4 1188
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 1192
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1192
INDIRI4
ARGI4
ADDRLP4 1104
INDIRI4
ARGI4
ADDRLP4 1196
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 0
EQI4 $978
line 1733
;1733:		{
line 1734
;1734:			te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 0+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1200
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1144
ADDRLP4 1200
INDIRP4
ASGNP4
line 1735
;1735:			VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1144
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1736
;1736:			VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1144
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 1737
;1737:			te->s.eventParm = 1;
ADDRLP4 1144
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1739
;1738:
;1739:			if (dmg > 5)
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $987
line 1740
;1740:			{
line 1741
;1741:				if ((g_entities[tr.entityNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK] - self->client->ps.fd.forcePowerLevel[FP_SABERATTACK]) > 1 &&
ADDRLP4 1204
CNSTI4 1004
ASGNI4
ADDRLP4 1208
CNSTI4 1
ASGNI4
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 1204
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 1204
INDIRI4
ADDP4
INDIRI4
SUBI4
ADDRLP4 1208
INDIRI4
LEI4 $989
ADDRLP4 1208
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1212
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 9
GEI4 $989
line 1743
;1742:					Q_irand(1, 10, qfalse, 5) < 9) //used to be < 7
;1743:				{ //Just got blocked by someone with a decently higher attack level, so enter into a lock (where they have the advantage due to a higher attack lev)
line 1744
;1744:					if (WP_SabersCheckLock(self, &g_entities[tr.entityNum]))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1216
ADDRGP4 WP_SabersCheckLock
CALLI4
ASGNI4
ADDRLP4 1216
INDIRI4
CNSTI4 0
EQI4 $990
line 1745
;1745:					{	
line 1746
;1746:						self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1747
;1747:						g_entities[tr.entityNum].client->ps.saberBlocked = BLOCKED_NONE;
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1748
;1748:						return didHit;
ADDRLP4 1100
INDIRI4
RETI4
ADDRGP4 $874
JUMPV
line 1750
;1749:					}
;1750:				}
LABELV $989
line 1751
;1751:				else if (Q_irand(1, 10, qfalse, 5) < 3)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1216
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1216
INDIRI4
CNSTI4 3
GEI4 $998
line 1752
;1752:				{ //Just got blocked by someone with a decently higher attack level, so enter into a lock (where they have the advantage due to a higher attack lev)
line 1753
;1753:					if (WP_SabersCheckLock(self, &g_entities[tr.entityNum]))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1220
ADDRGP4 WP_SabersCheckLock
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 0
EQI4 $1000
line 1754
;1754:					{	
line 1755
;1755:						self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1756
;1756:						g_entities[tr.entityNum].client->ps.saberBlocked = BLOCKED_NONE;
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1757
;1757:						return didHit;
ADDRLP4 1100
INDIRI4
RETI4
ADDRGP4 $874
JUMPV
LABELV $1000
line 1759
;1758:					}
;1759:				}
LABELV $998
LABELV $990
line 1760
;1760:			}
LABELV $987
line 1763
;1761:
;1762:			//our attack was blocked, so bounce back?
;1763:			if (dmg > 5)
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $1005
line 1764
;1764:			{
line 1765
;1765:				self->client->ps.weaponTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1766
;1766:				self->client->ps.weaponstate = WEAPON_READY;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1767
;1767:				self->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 1769
;1768:
;1769:				self->client->ps.saberBlockTime = nowTime + (350 - (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND]*100));//300;
ADDRLP4 1204
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 1096
INDIRI4
CNSTI4 350
CNSTI4 100
ADDRLP4 1204
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
MULI4
SUBI4
ADDI4
ASGNI4
line 1770
;1770:			}
LABELV $1005
line 1771
;1771:			self->client->ps.saberAttackWound = nowTime + 300;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRLP4 1096
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1773
;1772:
;1773:			if (self->client->ps.fd.saberAnimLevel >= FORCE_LEVEL_3 && dmg > 5 && g_entities[tr.entityNum].client->ps.saberMove != LS_READY && g_entities[tr.entityNum].client->ps.saberMove != LS_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
LTI4 $941
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $941
ADDRLP4 1204
CNSTI4 2352
ASGNI4
ADDRLP4 1208
CNSTI4 512
ASGNI4
ADDRLP4 1204
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 1208
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $941
ADDRLP4 1204
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 1208
INDIRI4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $941
line 1774
;1774:			{
line 1775
;1775:				g_entities[tr.entityNum].client->ps.weaponTime = 0;
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1776
;1776:				g_entities[tr.entityNum].client->ps.weaponstate = WEAPON_READY;
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1777
;1777:				g_entities[tr.entityNum].client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 1779
;1778:
;1779:				g_entities[tr.entityNum].client->ps.saberBlockTime = LEVELTIME(g_entities[tr.entityNum].client) + (350 - (g_entities[tr.entityNum].client->ps.fd.forcePowerLevel[FP_SABERDEFEND]*100));//300;
ADDRLP4 1220
CNSTI4 2352
ASGNI4
ADDRLP4 1220
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1035
ADDRLP4 1220
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1035
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1037
ADDRLP4 1216
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1038
JUMPV
LABELV $1037
ADDRLP4 1216
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1038
ADDRLP4 1212
ADDRLP4 1216
INDIRI4
ASGNI4
ADDRGP4 $1036
JUMPV
LABELV $1035
ADDRLP4 1212
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1036
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 1212
INDIRI4
CNSTI4 350
CNSTI4 100
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
MULI4
SUBI4
ADDI4
ASGNI4
line 1780
;1780:			}
line 1802
;1781:
;1782:			//NOTE: Actual blocking is handled in WP_SaberCanBlock
;1783:			/*
;1784:			if (dmg > 5)
;1785:			{ //play block anim on other person
;1786:				gentity_t *otherhit = &g_entities[tr.entityNum];
;1787:
;1788:				if (otherhit && otherhit->client)
;1789:				{
;1790:				//	WP_SaberBlockNonRandom(otherhit, tr.endpos, qfalse);
;1791:
;1792:					otherhit->client->ps.weaponTime = 0;
;1793:					otherhit->client->ps.weaponstate = WEAPON_READY;
;1794:					otherhit->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
;1795:
;1796:					self->client->ps.saberBlockTime = nowTime + 300;
;1797:
;1798:					otherhit->client->ps.saberAttackWound = LEVELTIME(otherhit->client) + 300;
;1799:				}
;1800:			}
;1801:			*/
;1802:		}
ADDRGP4 $941
JUMPV
LABELV $978
line 1804
;1803:		else
;1804:		{
line 1805
;1805:			if (g_entities[tr.entityNum].client && g_entities[tr.entityNum].client->ps.usingATST)
ADDRLP4 1200
CNSTI4 2352
ASGNI4
ADDRLP4 1200
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1039
ADDRLP4 1200
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1039
line 1806
;1806:			{
line 1807
;1807:				dmg *= 0.1;
ADDRLP4 1080
CNSTF4 1036831949
ADDRLP4 1080
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1808
;1808:			}
LABELV $1039
line 1810
;1809:
;1810:			if (g_entities[tr.entityNum].client && !g_entities[tr.entityNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK])
ADDRLP4 1204
CNSTI4 2352
ASGNI4
ADDRLP4 1204
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1045
ADDRLP4 1204
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1045
line 1811
;1811:			{ //not a "jedi", so make them suffer more
line 1812
;1812:				if (dmg > 5)
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $1051
line 1813
;1813:				{ //don't bother increasing just for idle touch damage
line 1814
;1814:					dmg *= 1.5;
ADDRLP4 1080
CNSTF4 1069547520
ADDRLP4 1080
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1815
;1815:				}
LABELV $1051
line 1816
;1816:			}
LABELV $1045
line 1818
;1817:
;1818:			G_Damage(&g_entities[tr.entityNum], self, self, dir, tr.endpos, dmg, 0, MOD_SABER);
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 1080
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1820
;1819:
;1820:			te = G_TempEntity( tr.endpos, EV_SABER_HIT );
ADDRLP4 0+12
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 1212
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1144
ADDRLP4 1212
INDIRP4
ASGNP4
line 1821
;1821:			VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1144
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1822
;1822:			VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1144
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 1824
;1823:			
;1824:			if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1216
ADDRLP4 1144
INDIRP4
ASGNP4
ADDRLP4 1220
CNSTF4 0
ASGNF4
ADDRLP4 1216
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1220
INDIRF4
NEF4 $1058
ADDRLP4 1216
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1220
INDIRF4
NEF4 $1058
ADDRLP4 1216
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1220
INDIRF4
NEF4 $1058
line 1825
;1825:			{ //don't let it play with no direction
line 1826
;1826:				te->s.angles[1] = 1;
ADDRLP4 1144
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 1827
;1827:			}
LABELV $1058
line 1829
;1828:
;1829:			if (g_entities[tr.entityNum].client)
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1060
line 1830
;1830:			{
line 1831
;1831:				te->s.eventParm = 1;
ADDRLP4 1144
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1832
;1832:			}
ADDRGP4 $1061
JUMPV
LABELV $1060
line 1834
;1833:			else
;1834:			{
line 1835
;1835:				te->s.eventParm = 0;
ADDRLP4 1144
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 1836
;1836:			}
LABELV $1061
line 1838
;1837:
;1838:			self->client->ps.saberAttackWound = nowTime + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRLP4 1096
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1839
;1839:		}
line 1840
;1840:	}
ADDRGP4 $941
JUMPV
LABELV $940
line 1841
;1841:	else if ((tr.fraction != 1 || tr.startsolid) &&
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $1074
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $1064
LABELV $1074
ADDRLP4 1144
CNSTI4 2352
ASGNI4
ADDRLP4 1144
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
EQI4 $1064
ADDRLP4 1144
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1064
line 1844
;1842:		(g_entities[tr.entityNum].r.contents & CONTENTS_LIGHTSABER) &&
;1843:		g_entities[tr.entityNum].r.contents != -1)
;1844:	{ //saber clash
line 1846
;1845:		gentity_t *te;
;1846:		gentity_t *otherOwner = &g_entities[g_entities[tr.entityNum].r.ownerNum];
ADDRLP4 1156
CNSTI4 2352
ASGNI4
ADDRLP4 1148
ADDRLP4 1156
INDIRI4
ADDRLP4 1156
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+100
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1848
;1847:
;1848:		if (otherOwner &&
ADDRLP4 1164
CNSTU4 0
ASGNU4
ADDRLP4 1148
INDIRP4
CVPU4 4
ADDRLP4 1164
INDIRU4
EQU4 $1078
ADDRLP4 1148
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1078
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1164
INDIRU4
EQU4 $1078
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1168
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1172
CNSTI4 0
ASGNI4
ADDRLP4 1168
INDIRI4
ADDRLP4 1172
INDIRI4
EQI4 $1078
ADDRGP4 g_friendlySaber+12
INDIRI4
ADDRLP4 1172
INDIRI4
NEI4 $1078
line 1853
;1849:			otherOwner->inuse &&
;1850:			otherOwner->client &&
;1851:			OnSameTeam(self, otherOwner) &&
;1852:			!g_friendlySaber.integer)
;1853:		{
line 1854
;1854:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $874
JUMPV
LABELV $1078
line 1857
;1855:		}
;1856:
;1857:		if (otherOwner && otherOwner->client &&
ADDRLP4 1180
CNSTU4 0
ASGNU4
ADDRLP4 1148
INDIRP4
CVPU4 4
ADDRLP4 1180
INDIRU4
EQU4 $1081
ADDRLP4 1184
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1184
INDIRP4
CVPU4 4
ADDRLP4 1180
INDIRU4
EQU4 $1081
ADDRLP4 1184
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1081
ADDRLP4 1184
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $1081
line 1860
;1858:			otherOwner->client->ps.duelInProgress &&
;1859:			otherOwner->client->ps.duelIndex != self->s.number)
;1860:		{
line 1861
;1861:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $874
JUMPV
LABELV $1081
line 1864
;1862:		}
;1863:
;1864:		if (otherOwner && otherOwner->client &&
ADDRLP4 1192
CNSTU4 0
ASGNU4
ADDRLP4 1148
INDIRP4
CVPU4 4
ADDRLP4 1192
INDIRU4
EQU4 $1083
ADDRLP4 1196
CNSTI4 408
ASGNI4
ADDRLP4 1148
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1192
INDIRU4
EQU4 $1083
ADDRLP4 1200
ADDRFP4 0
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1083
ADDRLP4 1200
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 1148
INDIRP4
INDIRI4
EQI4 $1083
line 1867
;1865:			self->client->ps.duelInProgress &&
;1866:			self->client->ps.duelIndex != otherOwner->s.number)
;1867:		{
line 1868
;1868:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $874
JUMPV
LABELV $1083
line 1871
;1869:		}
;1870:
;1871:		if (self->client && otherOwner->client && (self->s.bolt1 != otherOwner->s.bolt1))//JAPRO fix clients being able to block sabers in other dimensions (duel/racemode)?
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1208
CNSTI4 408
ASGNI4
ADDRLP4 1212
CNSTU4 0
ASGNU4
ADDRLP4 1204
INDIRP4
ADDRLP4 1208
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1212
INDIRU4
EQU4 $1085
ADDRLP4 1148
INDIRP4
ADDRLP4 1208
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1212
INDIRU4
EQU4 $1085
ADDRLP4 1220
CNSTI4 140
ASGNI4
ADDRLP4 1204
INDIRP4
ADDRLP4 1220
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1148
INDIRP4
ADDRLP4 1220
INDIRI4
ADDP4
INDIRI4
EQI4 $1085
line 1872
;1872:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $874
JUMPV
LABELV $1085
line 1873
;1873:		if (self->client && self->client->ps.stats[STAT_RACEMODE])//Racemode ppl shouldnt even be able to block other racemode ppls sabers
ADDRLP4 1224
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1224
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1087
ADDRLP4 1224
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1087
line 1874
;1874:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $874
JUMPV
LABELV $1087
line 1875
;1875:		if (otherOwner->client && otherOwner->client->ps.stats[STAT_RACEMODE])
ADDRLP4 1228
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1228
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1089
ADDRLP4 1228
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1089
line 1876
;1876:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $874
JUMPV
LABELV $1089
line 1878
;1877:
;1878:		didHit = qtrue;
ADDRLP4 1100
CNSTI4 1
ASGNI4
line 1880
;1879:
;1880:		te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 0+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1232
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1152
ADDRLP4 1232
INDIRP4
ASGNP4
line 1882
;1881:
;1882:		VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1152
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1883
;1883:		VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1152
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 1884
;1884:		te->s.eventParm = 1;
ADDRLP4 1152
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1888
;1885:
;1886:		//WP_SaberBlockNonRandom(self, tr.endpos, qfalse);
;1887:
;1888:		if (otherOwner && otherOwner->client && otherOwner->client->ps.saberInFlight)
ADDRLP4 1240
CNSTU4 0
ASGNU4
ADDRLP4 1148
INDIRP4
CVPU4 4
ADDRLP4 1240
INDIRU4
EQU4 $1094
ADDRLP4 1244
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1244
INDIRP4
CVPU4 4
ADDRLP4 1240
INDIRU4
EQU4 $1094
ADDRLP4 1244
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1094
line 1889
;1889:		{
line 1890
;1890:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $874
JUMPV
LABELV $1094
line 1893
;1891:		}
;1892:
;1893:		if (self->client->ps.fd.saberAnimLevel < FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
GEI4 $1096
line 1894
;1894:		{
line 1895
;1895:			self->client->ps.weaponTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1896
;1896:			self->client->ps.weaponstate = WEAPON_READY;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1897
;1897:			self->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 1898
;1898:			self->client->ps.saberBlockTime = nowTime + (350 - (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND]*100));//300;
ADDRLP4 1248
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1248
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 1096
INDIRI4
CNSTI4 350
CNSTI4 100
ADDRLP4 1248
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
MULI4
SUBI4
ADDI4
ASGNI4
line 1900
;1899:
;1900:			if (otherOwner && otherOwner->client)
ADDRLP4 1256
CNSTU4 0
ASGNU4
ADDRLP4 1148
INDIRP4
CVPU4 4
ADDRLP4 1256
INDIRU4
EQU4 $1097
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1256
INDIRU4
EQU4 $1097
line 1901
;1901:			{
line 1902
;1902:				if (otherOwner->client->ps.weaponTime < 1 || otherOwner->client->ps.fd.saberAnimLevel < FORCE_LEVEL_3)
ADDRLP4 1260
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1260
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1
LTI4 $1102
ADDRLP4 1260
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
GEI4 $1097
LABELV $1102
line 1903
;1903:				{
line 1904
;1904:					WP_SaberCanBlock(otherOwner, tr.endpos, 0, MOD_SABER, qfalse, 1);
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 1264
CNSTI4 0
ASGNI4
ADDRLP4 1264
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1264
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 WP_SaberCanBlock
CALLI4
pop
line 1905
;1905:				}
line 1906
;1906:			}
line 1907
;1907:		}
ADDRGP4 $1097
JUMPV
LABELV $1096
line 1908
;1908:		else if (otherOwner && otherOwner->client && otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] <= self->client->ps.fd.saberAnimLevel)
ADDRLP4 1252
CNSTU4 0
ASGNU4
ADDRLP4 1148
INDIRP4
CVPU4 4
ADDRLP4 1252
INDIRU4
EQU4 $1104
ADDRLP4 1256
CNSTI4 408
ASGNI4
ADDRLP4 1260
ADDRLP4 1148
INDIRP4
ADDRLP4 1256
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1260
INDIRP4
CVPU4 4
ADDRLP4 1252
INDIRU4
EQU4 $1104
ADDRLP4 1260
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 1256
INDIRI4
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
GTI4 $1104
line 1909
;1909:		{ //block
line 1910
;1910:			if (otherOwner->client->ps.weaponTime < 1 || otherOwner->client->ps.fd.saberAnimLevel < FORCE_LEVEL_3)
ADDRLP4 1264
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1264
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1
LTI4 $1108
ADDRLP4 1264
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
GEI4 $1106
LABELV $1108
line 1911
;1911:			{
line 1912
;1912:				if (WP_SaberCanBlock(otherOwner, tr.endpos, 0, MOD_SABER, qfalse, 1) && dmg > 5)
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 1268
CNSTI4 0
ASGNI4
ADDRLP4 1268
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1268
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1272
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1272
INDIRI4
CNSTI4 0
EQI4 $1109
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $1109
line 1913
;1913:				{
line 1914
;1914:					otherOwner->client->ps.weaponTime = 0;
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1915
;1915:					otherOwner->client->ps.weaponstate = WEAPON_READY;
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1916
;1916:					otherOwner->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 1917
;1917:					otherOwner->client->ps.saberBlockTime = LEVELTIME(otherOwner->client) + (350 - (otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND]*100));//300;
ADDRLP4 1284
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1284
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1116
ADDRLP4 1284
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1116
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1118
ADDRLP4 1280
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1119
JUMPV
LABELV $1118
ADDRLP4 1280
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1119
ADDRLP4 1276
ADDRLP4 1280
INDIRI4
ASGNI4
ADDRGP4 $1117
JUMPV
LABELV $1116
ADDRLP4 1276
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1117
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 1276
INDIRI4
CNSTI4 350
CNSTI4 100
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
MULI4
SUBI4
ADDI4
ASGNI4
line 1918
;1918:				}
LABELV $1109
line 1919
;1919:			}
LABELV $1106
line 1920
;1920:		}
LABELV $1104
LABELV $1097
line 1922
;1921:
;1922:		self->client->ps.saberAttackWound = nowTime + 300;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRLP4 1096
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1924
;1923:
;1924:		if (dmg > 5)
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $1120
line 1925
;1925:		{
line 1926
;1926:			if (Q_irand(1, 10, qfalse, 5) < 9) //used to be < 7
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1264
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 9
GEI4 $1122
line 1927
;1927:			{
line 1928
;1928:				if (WP_SabersCheckLock(self, otherOwner))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1148
INDIRP4
ARGP4
ADDRLP4 1268
ADDRGP4 WP_SabersCheckLock
CALLI4
ASGNI4
ADDRLP4 1268
INDIRI4
CNSTI4 0
EQI4 $1124
line 1929
;1929:				{
line 1930
;1930:					self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1931
;1931:					otherOwner->client->ps.saberBlocked = BLOCKED_NONE;
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1932
;1932:					return didHit;
ADDRLP4 1100
INDIRI4
RETI4
ADDRGP4 $874
JUMPV
LABELV $1124
line 1934
;1933:				}
;1934:			}
LABELV $1122
line 1935
;1935:		}
LABELV $1120
line 1937
;1936:
;1937:		if (dmg > 5)
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $1126
line 1938
;1938:		{ //we clashed into this person's saber while attacking, so make them feel it too
line 1939
;1939:			if (otherOwner && otherOwner->client && otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] <= self->client->ps.fd.saberAnimLevel)
ADDRLP4 1268
CNSTU4 0
ASGNU4
ADDRLP4 1148
INDIRP4
CVPU4 4
ADDRLP4 1268
INDIRU4
EQU4 $1128
ADDRLP4 1272
CNSTI4 408
ASGNI4
ADDRLP4 1276
ADDRLP4 1148
INDIRP4
ADDRLP4 1272
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1276
INDIRP4
CVPU4 4
ADDRLP4 1268
INDIRU4
EQU4 $1128
ADDRLP4 1276
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 1272
INDIRI4
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
GTI4 $1128
line 1940
;1940:			{
line 1943
;1941:			//	WP_SaberBlockNonRandom(otherOwner, tr.endpos, qfalse);
;1942:
;1943:				otherOwner->client->ps.weaponTime = 0;
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1944
;1944:				otherOwner->client->ps.weaponstate = WEAPON_READY;
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1945
;1945:				otherOwner->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 1947
;1946:
;1947:				self->client->ps.saberBlockTime = nowTime + (350 - (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND]*100));//300;
ADDRLP4 1280
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1280
INDIRP4
CNSTI4 756
ADDP4
ADDRLP4 1096
INDIRI4
CNSTI4 350
CNSTI4 100
ADDRLP4 1280
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
MULI4
SUBI4
ADDI4
ASGNI4
line 1949
;1948:
;1949:				otherOwner->client->ps.saberAttackWound = LEVELTIME(otherOwner->client) + 300;
ADDRLP4 1292
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1292
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1134
ADDRLP4 1292
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1134
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1136
ADDRLP4 1288
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1137
JUMPV
LABELV $1136
ADDRLP4 1288
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1137
ADDRLP4 1284
ADDRLP4 1288
INDIRI4
ASGNI4
ADDRGP4 $1135
JUMPV
LABELV $1134
ADDRLP4 1284
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1135
ADDRLP4 1148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRLP4 1284
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1950
;1950:			}
LABELV $1128
line 1951
;1951:		}
LABELV $1126
line 1952
;1952:	}
LABELV $1064
LABELV $941
line 1954
;1953:
;1954:	return didHit;
ADDRLP4 1100
INDIRI4
RETI4
LABELV $874
endproc CheckSaberDamage_1_02 1296 32
export CheckSaberDamage
proc CheckSaberDamage 1680 32
line 1958
;1955:}
;1956:
;1957:qboolean CheckSaberDamage(gentity_t *self, vec3_t saberStart, vec3_t saberEnd, qboolean doInterpolate, int trMask)
;1958:{
line 1966
;1959:	trace_t tr;
;1960:	vec3_t dir;
;1961:	vec3_t saberTrMins, saberTrMaxs;
;1962:#ifdef G2_COLLISION_ENABLED
;1963:	vec3_t lastValidStart;
;1964:	vec3_t lastValidEnd;
;1965:#endif
;1966:	int dmg = 0;
ADDRLP4 1136
CNSTI4 0
ASGNI4
line 1967
;1967:	int attackStr = 0;
ADDRLP4 1172
CNSTI4 0
ASGNI4
line 1968
;1968:	float saberBoxSize = g_saberBoxTraceSize.value;
ADDRLP4 1140
ADDRGP4 g_saberBoxTraceSize+8
INDIRF4
ASGNF4
line 1969
;1969:	qboolean idleDamage = qfalse;
ADDRLP4 1176
CNSTI4 0
ASGNI4
line 1970
;1970:	qboolean didHit = qfalse;
ADDRLP4 1164
CNSTI4 0
ASGNI4
line 1971
;1971:	qboolean sabersClashed = qfalse;
ADDRLP4 1180
CNSTI4 0
ASGNI4
line 1972
;1972:	qboolean unblockable = qfalse;
ADDRLP4 1160
CNSTI4 0
ASGNI4
line 1973
;1973:	qboolean didDefense = qfalse;
ADDRLP4 1192
CNSTI4 0
ASGNI4
line 1974
;1974:	qboolean didOffense = qfalse;
ADDRLP4 1184
CNSTI4 0
ASGNI4
line 1975
;1975:	qboolean saberTraceDone = qfalse;
ADDRLP4 1128
CNSTI4 0
ASGNI4
line 1976
;1976:	qboolean otherUnblockable = qfalse;
ADDRLP4 1168
CNSTI4 0
ASGNI4
line 1977
;1977:	qboolean tryDeflectAgain = qfalse;
ADDRLP4 1188
CNSTI4 0
ASGNI4
line 1978
;1978:	int nowTime = LEVELTIME(self->client);
ADDRLP4 1204
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1144
ADDRLP4 1204
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1144
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1146
ADDRLP4 1200
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1147
JUMPV
LABELV $1146
ADDRLP4 1200
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1147
ADDRLP4 1196
ADDRLP4 1200
INDIRI4
ASGNI4
ADDRGP4 $1145
JUMPV
LABELV $1144
ADDRLP4 1196
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1145
ADDRLP4 1156
ADDRLP4 1196
INDIRI4
ASGNI4
line 1982
;1979:
;1980:	gentity_t *otherOwner;
;1981:
;1982:	if ( jk2gameplay == VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1148
line 1983
;1983:	{
line 1984
;1984:		return CheckSaberDamage_1_02( self, saberStart, saberEnd, doInterpolate );
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
INDIRI4
ARGI4
ADDRLP4 1208
ADDRGP4 CheckSaberDamage_1_02
CALLI4
ASGNI4
ADDRLP4 1208
INDIRI4
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1148
line 1987
;1985:	}
;1986:
;1987:	if (self->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1150
line 1988
;1988:	{
line 1989
;1989:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1150
line 1992
;1990:	}
;1991:
;1992:	memset (&tr, 0, sizeof(tr)); //make the compiler happy
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1080
ARGU4
ADDRGP4 memset
CALLP4
pop
line 1994
;1993:#ifdef G2_COLLISION_ENABLED
;1994:	if (g_saberGhoul2Collision.integer)
ADDRGP4 g_saberGhoul2Collision+12
INDIRI4
CNSTI4 0
EQI4 $1152
line 1995
;1995:	{
line 1996
;1996:		VectorSet(saberTrMins, -saberBoxSize*3, -saberBoxSize*3, -saberBoxSize*3);
ADDRLP4 1208
CNSTF4 1077936128
ADDRLP4 1140
INDIRF4
NEGF4
MULF4
ASGNF4
ADDRLP4 1080
ADDRLP4 1208
INDIRF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1208
INDIRF4
ASGNF4
ADDRLP4 1080+8
CNSTF4 1077936128
ADDRLP4 1140
INDIRF4
NEGF4
MULF4
ASGNF4
line 1997
;1997:		VectorSet(saberTrMaxs, saberBoxSize*3, saberBoxSize*3, saberBoxSize*3);
ADDRLP4 1212
CNSTF4 1077936128
ADDRLP4 1140
INDIRF4
MULF4
ASGNF4
ADDRLP4 1092
ADDRLP4 1212
INDIRF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1212
INDIRF4
ASGNF4
ADDRLP4 1092+8
CNSTF4 1077936128
ADDRLP4 1140
INDIRF4
MULF4
ASGNF4
line 1998
;1998:	}
ADDRGP4 $1177
JUMPV
LABELV $1152
line 2001
;1999:	else
;2000:#endif
;2001:	if (self->client->ps.fd.saberAnimLevel < FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
GEI4 $1159
line 2002
;2002:	{ //box trace for fast, because it doesn't get updated so often
line 2003
;2003:		VectorSet(saberTrMins, -saberBoxSize, -saberBoxSize, -saberBoxSize);
ADDRLP4 1208
ADDRLP4 1140
INDIRF4
NEGF4
ASGNF4
ADDRLP4 1080
ADDRLP4 1208
INDIRF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1208
INDIRF4
ASGNF4
ADDRLP4 1080+8
ADDRLP4 1140
INDIRF4
NEGF4
ASGNF4
line 2004
;2004:		VectorSet(saberTrMaxs, saberBoxSize, saberBoxSize, saberBoxSize);
ADDRLP4 1092
ADDRLP4 1140
INDIRF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1140
INDIRF4
ASGNF4
ADDRLP4 1092+8
ADDRLP4 1140
INDIRF4
ASGNF4
line 2005
;2005:	}
ADDRGP4 $1177
JUMPV
LABELV $1159
line 2006
;2006:	else if (g_saberAlwaysBoxTrace.integer)
ADDRGP4 g_saberAlwaysBoxTrace+12
INDIRI4
CNSTI4 0
EQI4 $1165
line 2007
;2007:	{
line 2008
;2008:		VectorSet(saberTrMins, -saberBoxSize, -saberBoxSize, -saberBoxSize);
ADDRLP4 1208
ADDRLP4 1140
INDIRF4
NEGF4
ASGNF4
ADDRLP4 1080
ADDRLP4 1208
INDIRF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1208
INDIRF4
ASGNF4
ADDRLP4 1080+8
ADDRLP4 1140
INDIRF4
NEGF4
ASGNF4
line 2009
;2009:		VectorSet(saberTrMaxs, saberBoxSize, saberBoxSize, saberBoxSize);
ADDRLP4 1092
ADDRLP4 1140
INDIRF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1140
INDIRF4
ASGNF4
ADDRLP4 1092+8
ADDRLP4 1140
INDIRF4
ASGNF4
line 2010
;2010:	}
ADDRGP4 $1177
JUMPV
LABELV $1165
line 2012
;2011:	else
;2012:	{
line 2013
;2013:		VectorClear(saberTrMins);
ADDRLP4 1208
CNSTF4 0
ASGNF4
ADDRLP4 1080+8
ADDRLP4 1208
INDIRF4
ASGNF4
ADDRLP4 1080+4
ADDRLP4 1208
INDIRF4
ASGNF4
ADDRLP4 1080
ADDRLP4 1208
INDIRF4
ASGNF4
line 2014
;2014:		VectorClear(saberTrMaxs);
ADDRLP4 1212
CNSTF4 0
ASGNF4
ADDRLP4 1092+8
ADDRLP4 1212
INDIRF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1212
INDIRF4
ASGNF4
ADDRLP4 1092
ADDRLP4 1212
INDIRF4
ASGNF4
line 2015
;2015:	}
ADDRGP4 $1177
JUMPV
LABELV $1176
line 2018
;2016:
;2017:	while (!saberTraceDone)
;2018:	{
line 2019
;2019:		if (doInterpolate)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $1179
line 2020
;2020:		{ //This didn't quite work out like I hoped. But it's better than nothing. Sort of.
line 2022
;2021:			vec3_t oldSaberStart, oldSaberEnd, saberDif, oldSaberDif;
;2022:			int traceTests = 0;
ADDRLP4 1260
CNSTI4 0
ASGNI4
line 2023
;2023:			float trDif = 8;
ADDRLP4 1208
CNSTF4 1090519040
ASGNF4
line 2025
;2024:
;2025:			VectorCopy(self->client->lastSaberBase, oldSaberStart);
ADDRLP4 1212
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43756
ADDP4
INDIRB
ASGNB 12
line 2026
;2026:			VectorCopy(self->client->lastSaberTip, oldSaberEnd);
ADDRLP4 1224
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43744
ADDP4
INDIRB
ASGNB 12
line 2028
;2027:
;2028:			VectorSubtract(saberStart, saberEnd, saberDif);
ADDRLP4 1264
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1268
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1236
ADDRLP4 1264
INDIRP4
INDIRF4
ADDRLP4 1268
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1272
CNSTI4 4
ASGNI4
ADDRLP4 1236+4
ADDRLP4 1264
INDIRP4
ADDRLP4 1272
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1268
INDIRP4
ADDRLP4 1272
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1276
CNSTI4 8
ASGNI4
ADDRLP4 1236+8
ADDRFP4 4
INDIRP4
ADDRLP4 1276
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 1276
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2029
;2029:			VectorSubtract(oldSaberStart, oldSaberEnd, oldSaberDif);
ADDRLP4 1248
ADDRLP4 1212
INDIRF4
ADDRLP4 1224
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1248+4
ADDRLP4 1212+4
INDIRF4
ADDRLP4 1224+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1248+8
ADDRLP4 1212+8
INDIRF4
ADDRLP4 1224+8
INDIRF4
SUBF4
ASGNF4
line 2031
;2030:
;2031:			VectorNormalize(saberDif);
ADDRLP4 1236
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2032
;2032:			VectorNormalize(oldSaberDif);
ADDRLP4 1248
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2034
;2033:
;2034:			saberEnd[0] = saberStart[0] - (saberDif[0]*trDif);
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 1236
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
SUBF4
ASGNF4
line 2035
;2035:			saberEnd[1] = saberStart[1] - (saberDif[1]*trDif);
ADDRLP4 1280
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1280
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1280
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1236+4
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
SUBF4
ASGNF4
line 2036
;2036:			saberEnd[2] = saberStart[2] - (saberDif[2]*trDif);
ADDRLP4 1284
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1284
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1284
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1236+8
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
SUBF4
ASGNF4
line 2038
;2037:
;2038:			oldSaberEnd[0] = oldSaberStart[0] - (oldSaberDif[0]*trDif);
ADDRLP4 1224
ADDRLP4 1212
INDIRF4
ADDRLP4 1248
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
SUBF4
ASGNF4
line 2039
;2039:			oldSaberEnd[1] = oldSaberStart[1] - (oldSaberDif[1]*trDif);
ADDRLP4 1224+4
ADDRLP4 1212+4
INDIRF4
ADDRLP4 1248+4
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
SUBF4
ASGNF4
line 2040
;2040:			oldSaberEnd[2] = oldSaberStart[2] - (oldSaberDif[2]*trDif);
ADDRLP4 1224+8
ADDRLP4 1212+8
INDIRF4
ADDRLP4 1248+8
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
SUBF4
ASGNF4
line 2042
;2041:
;2042:			JP_Trace(&tr, saberEnd, saberTrMins, saberTrMaxs, saberStart, self->s.number, trMask);
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2044
;2043:#ifdef G2_COLLISION_ENABLED
;2044:			VectorCopy(saberEnd, lastValidStart);
ADDRLP4 1104
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 2045
;2045:			VectorCopy(saberStart, lastValidEnd);
ADDRLP4 1116
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2046
;2046:			if (tr.entityNum < MAX_CLIENTS)
ADDRLP4 0+52
INDIRI4
CNSTI4 32
GEI4 $1197
line 2047
;2047:			{
line 2048
;2048:				G_G2TraceCollide(&tr, lastValidStart, lastValidEnd, saberTrMins, saberTrMaxs);
ADDRLP4 0
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRGP4 G_G2TraceCollide
CALLI4
pop
line 2049
;2049:			}
LABELV $1197
line 2052
;2050:#endif
;2051:
;2052:			trDif++;
ADDRLP4 1208
ADDRLP4 1208
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
ADDRGP4 $1201
JUMPV
LABELV $1200
line 2055
;2053:
;2054:			while (tr.fraction == 1.0 && traceTests < 4 && tr.entityNum >= ENTITYNUM_NONE)
;2055:			{
line 2056
;2056:				VectorCopy(self->client->lastSaberBase, oldSaberStart);
ADDRLP4 1212
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43756
ADDP4
INDIRB
ASGNB 12
line 2057
;2057:				VectorCopy(self->client->lastSaberTip, oldSaberEnd);
ADDRLP4 1224
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43744
ADDP4
INDIRB
ASGNB 12
line 2059
;2058:
;2059:				VectorSubtract(saberStart, saberEnd, saberDif);
ADDRLP4 1288
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1292
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1236
ADDRLP4 1288
INDIRP4
INDIRF4
ADDRLP4 1292
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1296
CNSTI4 4
ASGNI4
ADDRLP4 1236+4
ADDRLP4 1288
INDIRP4
ADDRLP4 1296
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1292
INDIRP4
ADDRLP4 1296
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1300
CNSTI4 8
ASGNI4
ADDRLP4 1236+8
ADDRFP4 4
INDIRP4
ADDRLP4 1300
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 1300
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2060
;2060:				VectorSubtract(oldSaberStart, oldSaberEnd, oldSaberDif);
ADDRLP4 1248
ADDRLP4 1212
INDIRF4
ADDRLP4 1224
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1248+4
ADDRLP4 1212+4
INDIRF4
ADDRLP4 1224+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1248+8
ADDRLP4 1212+8
INDIRF4
ADDRLP4 1224+8
INDIRF4
SUBF4
ASGNF4
line 2062
;2061:
;2062:				VectorNormalize(saberDif);
ADDRLP4 1236
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2063
;2063:				VectorNormalize(oldSaberDif);
ADDRLP4 1248
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2065
;2064:
;2065:				saberEnd[0] = saberStart[0] - (saberDif[0]*trDif);
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 1236
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
SUBF4
ASGNF4
line 2066
;2066:				saberEnd[1] = saberStart[1] - (saberDif[1]*trDif);
ADDRLP4 1304
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1304
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1304
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1236+4
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
SUBF4
ASGNF4
line 2067
;2067:				saberEnd[2] = saberStart[2] - (saberDif[2]*trDif);
ADDRLP4 1308
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1308
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1308
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1236+8
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
SUBF4
ASGNF4
line 2069
;2068:
;2069:				oldSaberEnd[0] = oldSaberStart[0] - (oldSaberDif[0]*trDif);
ADDRLP4 1224
ADDRLP4 1212
INDIRF4
ADDRLP4 1248
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
SUBF4
ASGNF4
line 2070
;2070:				oldSaberEnd[1] = oldSaberStart[1] - (oldSaberDif[1]*trDif);
ADDRLP4 1224+4
ADDRLP4 1212+4
INDIRF4
ADDRLP4 1248+4
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
SUBF4
ASGNF4
line 2071
;2071:				oldSaberEnd[2] = oldSaberStart[2] - (oldSaberDif[2]*trDif);
ADDRLP4 1224+8
ADDRLP4 1212+8
INDIRF4
ADDRLP4 1248+8
INDIRF4
ADDRLP4 1208
INDIRF4
MULF4
SUBF4
ASGNF4
line 2073
;2072:
;2073:				JP_Trace(&tr, saberEnd, saberTrMins, saberTrMaxs, saberStart, self->s.number, trMask);
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2075
;2074:#ifdef G2_COLLISION_ENABLED
;2075:				VectorCopy(saberEnd, lastValidStart);
ADDRLP4 1104
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 2076
;2076:				VectorCopy(saberStart, lastValidEnd);
ADDRLP4 1116
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2077
;2077:				if (tr.entityNum < MAX_CLIENTS)
ADDRLP4 0+52
INDIRI4
CNSTI4 32
GEI4 $1221
line 2078
;2078:				{
line 2079
;2079:					G_G2TraceCollide(&tr, lastValidStart, lastValidEnd, saberTrMins, saberTrMaxs);
ADDRLP4 0
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRGP4 G_G2TraceCollide
CALLI4
pop
line 2080
;2080:				}
LABELV $1221
line 2082
;2081:#endif
;2082:				traceTests++;
ADDRLP4 1260
ADDRLP4 1260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2083
;2083:				trDif += 8;
ADDRLP4 1208
ADDRLP4 1208
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 2084
;2084:			}
LABELV $1201
line 2054
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $1225
ADDRLP4 1260
INDIRI4
CNSTI4 4
GEI4 $1225
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
GEI4 $1200
LABELV $1225
line 2085
;2085:		}
ADDRGP4 $1180
JUMPV
LABELV $1179
line 2087
;2086:		else
;2087:		{
line 2088
;2088:			JP_Trace(&tr, saberStart, saberTrMins, saberTrMaxs, saberEnd, self->s.number, trMask);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2090
;2089:#ifdef G2_COLLISION_ENABLED
;2090:			VectorCopy(saberStart, lastValidStart);
ADDRLP4 1104
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2091
;2091:			VectorCopy(saberEnd, lastValidEnd);
ADDRLP4 1116
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 2092
;2092:			if (tr.entityNum < MAX_CLIENTS)
ADDRLP4 0+52
INDIRI4
CNSTI4 32
GEI4 $1226
line 2093
;2093:			{
line 2094
;2094:				G_G2TraceCollide(&tr, lastValidStart, lastValidEnd, saberTrMins, saberTrMaxs);
ADDRLP4 0
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1092
ARGP4
ADDRGP4 G_G2TraceCollide
CALLI4
pop
line 2095
;2095:			}
LABELV $1226
line 2097
;2096:#endif
;2097:		}
LABELV $1180
line 2099
;2098:
;2099:		saberTraceDone = qtrue;
ADDRLP4 1128
CNSTI4 1
ASGNI4
line 2100
;2100:	}
LABELV $1177
line 2017
ADDRLP4 1128
INDIRI4
CNSTI4 0
EQI4 $1176
line 2102
;2101:
;2102:	if (SaberAttacking(self) &&
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1208
ADDRGP4 SaberAttacking
CALLI4
ASGNI4
ADDRLP4 1208
INDIRI4
CNSTI4 0
EQI4 $1229
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
ADDRLP4 1156
INDIRI4
GEI4 $1229
line 2104
;2103:		self->client->ps.saberAttackWound < nowTime)
;2104:	{ //this animation is that of the last attack movement, and so it should do full damage
line 2105
;2105:		qboolean saberInSpecial = BG_SaberInSpecial(self->client->ps.saberMove);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1220
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1212
ADDRLP4 1220
INDIRI4
ASGNI4
line 2106
;2106:		qboolean inBackAttack = G_SaberInBackAttack(self->client->ps.saberMove);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1224
ADDRGP4 G_SaberInBackAttack
CALLI4
ASGNI4
ADDRLP4 1216
ADDRLP4 1224
INDIRI4
ASGNI4
line 2108
;2107:
;2108:		dmg = SABER_HITDAMAGE;
ADDRLP4 1136
CNSTI4 35
ASGNI4
line 2110
;2109:
;2110:		if (self->client->ps.fd.saberAnimLevel == 3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1231
line 2111
;2111:		{
line 2113
;2112:			//new damage-ramping system
;2113:			if (!saberInSpecial && (!inBackAttack || jk2gameplay != VERSION_1_04))
ADDRLP4 1228
CNSTI4 0
ASGNI4
ADDRLP4 1212
INDIRI4
ADDRLP4 1228
INDIRI4
NEI4 $1233
ADDRLP4 1216
INDIRI4
ADDRLP4 1228
INDIRI4
EQI4 $1235
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $1233
LABELV $1235
line 2114
;2114:			{
line 2115
;2115:				dmg = G_GetAttackDamage(self, 2, 120, 0.5f);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 120
ARGI4
CNSTF4 1056964608
ARGF4
ADDRLP4 1232
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1232
INDIRI4
ASGNI4
line 2116
;2116:			}
ADDRGP4 $1232
JUMPV
LABELV $1233
line 2117
;2117:			else if (saberInSpecial &&
ADDRLP4 1212
INDIRI4
CNSTI4 0
EQI4 $1236
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 15
NEI4 $1236
line 2119
;2118:					 (self->client->ps.saberMove == LS_A_JUMP_T__B_))
;2119:			{
line 2120
;2120:				dmg = G_GetAttackDamage(self, 2, 180, 0.65f);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 180
ARGI4
CNSTF4 1059481190
ARGF4
ADDRLP4 1232
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1232
INDIRI4
ASGNI4
line 2121
;2121:			}
ADDRGP4 $1232
JUMPV
LABELV $1236
line 2122
;2122:			else if (inBackAttack && jk2gameplay == VERSION_1_04)
ADDRLP4 1216
INDIRI4
CNSTI4 0
EQI4 $1238
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1238
line 2123
;2123:			{
line 2124
;2124:				dmg = G_GetAttackDamage(self, 2, 30, 0.5f); //can hit multiple times (and almost always does), so..
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 30
ARGI4
CNSTF4 1056964608
ARGF4
ADDRLP4 1232
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1232
INDIRI4
ASGNI4
line 2125
;2125:			}
ADDRGP4 $1232
JUMPV
LABELV $1238
line 2127
;2126:			else
;2127:			{
line 2128
;2128:				dmg = 100;
ADDRLP4 1136
CNSTI4 100
ASGNI4
line 2129
;2129:			}
line 2130
;2130:		}
ADDRGP4 $1232
JUMPV
LABELV $1231
line 2131
;2131:		else if (self->client->ps.fd.saberAnimLevel == 2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1240
line 2132
;2132:		{
line 2133
;2133:			if (saberInSpecial &&
ADDRLP4 1212
INDIRI4
CNSTI4 0
EQI4 $1242
ADDRLP4 1228
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 16
EQI4 $1244
ADDRLP4 1228
INDIRI4
CNSTI4 17
NEI4 $1242
LABELV $1244
line 2135
;2134:				(self->client->ps.saberMove == LS_A_FLIP_STAB || self->client->ps.saberMove == LS_A_FLIP_SLASH))
;2135:			{ //a well-timed hit with this can do a full 85
line 2136
;2136:				if ( jk2gameplay == VERSION_1_04 ) dmg = G_GetAttackDamage(self, 2, 80, 0.5f);
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1245
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 80
ARGI4
CNSTF4 1056964608
ARGF4
ADDRLP4 1232
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1232
INDIRI4
ASGNI4
ADDRGP4 $1241
JUMPV
LABELV $1245
line 2137
;2137:				else							   dmg = G_GetAttackDamage(self, 2, 100, 0.5f);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 100
ARGI4
CNSTF4 1056964608
ARGF4
ADDRLP4 1236
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1236
INDIRI4
ASGNI4
line 2138
;2138:			}
ADDRGP4 $1241
JUMPV
LABELV $1242
line 2139
;2139:			else if (inBackAttack && jk2gameplay == VERSION_1_04)
ADDRLP4 1216
INDIRI4
CNSTI4 0
EQI4 $1247
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1247
line 2140
;2140:			{
line 2141
;2141:				dmg = G_GetAttackDamage(self, 2, 25, 0.5f);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 25
ARGI4
CNSTF4 1056964608
ARGF4
ADDRLP4 1232
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1232
INDIRI4
ASGNI4
line 2142
;2142:			}
ADDRGP4 $1241
JUMPV
LABELV $1247
line 2144
;2143:			else
;2144:			{
line 2145
;2145:				dmg = 60;
ADDRLP4 1136
CNSTI4 60
ASGNI4
line 2146
;2146:			}
line 2147
;2147:		}
ADDRGP4 $1241
JUMPV
LABELV $1240
line 2148
;2148:		else if (self->client->ps.fd.saberAnimLevel == 1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1249
line 2149
;2149:		{
line 2150
;2150:			if (saberInSpecial &&
ADDRLP4 1212
INDIRI4
CNSTI4 0
EQI4 $1251
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 14
NEI4 $1251
line 2152
;2151:				(self->client->ps.saberMove == LS_A_LUNGE))
;2152:			{
line 2153
;2153:				dmg = G_GetAttackDamage(self, 2, SABER_HITDAMAGE-5, 0.3f);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 30
ARGI4
CNSTF4 1050253722
ARGF4
ADDRLP4 1228
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1228
INDIRI4
ASGNI4
line 2154
;2154:			}
ADDRGP4 $1252
JUMPV
LABELV $1251
line 2155
;2155:			else if (inBackAttack && jk2gameplay == VERSION_1_04)
ADDRLP4 1216
INDIRI4
CNSTI4 0
EQI4 $1253
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1253
line 2156
;2156:			{
line 2157
;2157:				dmg = G_GetAttackDamage(self, 2, 30, 0.5f);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
CNSTI4 30
ARGI4
CNSTF4 1056964608
ARGF4
ADDRLP4 1228
ADDRGP4 G_GetAttackDamage
CALLI4
ASGNI4
ADDRLP4 1136
ADDRLP4 1228
INDIRI4
ASGNI4
line 2158
;2158:			}
ADDRGP4 $1254
JUMPV
LABELV $1253
line 2160
;2159:			else
;2160:			{
line 2161
;2161:				dmg = SABER_HITDAMAGE;
ADDRLP4 1136
CNSTI4 35
ASGNI4
line 2162
;2162:			}
LABELV $1254
LABELV $1252
line 2163
;2163:		}
LABELV $1249
LABELV $1241
LABELV $1232
line 2165
;2164:
;2165:		attackStr = self->client->ps.fd.saberAnimLevel;
ADDRLP4 1172
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 2166
;2166:	}
ADDRGP4 $1230
JUMPV
LABELV $1229
line 2167
;2167:	else if (self->client->ps.saberIdleWound < nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 1156
INDIRI4
GEI4 $1255
line 2168
;2168:	{ //just touching, do minimal damage and only check for it every 200ms (mainly to cut down on network traffic for hit events)
line 2169
;2169:		dmg = SABER_NONATTACK_DAMAGE;
ADDRLP4 1136
CNSTI4 1
ASGNI4
line 2170
;2170:		idleDamage = qtrue;
ADDRLP4 1176
CNSTI4 1
ASGNI4
line 2171
;2171:	}
LABELV $1255
LABELV $1230
line 2173
;2172:
;2173:	if (BG_SaberInSpecial(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1212
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1212
INDIRI4
CNSTI4 0
EQI4 $1257
line 2174
;2174:	{
line 2175
;2175:		qboolean inBackAttack = G_SaberInBackAttack(self->client->ps.saberMove);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1220
ADDRGP4 G_SaberInBackAttack
CALLI4
ASGNI4
ADDRLP4 1216
ADDRLP4 1220
INDIRI4
ASGNI4
line 2177
;2176:
;2177:		unblockable = qtrue;
ADDRLP4 1160
CNSTI4 1
ASGNI4
line 2178
;2178:		self->client->ps.saberBlocked = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 2180
;2179:
;2180:		if (!inBackAttack || jk2gameplay != VERSION_1_04)
ADDRLP4 1216
INDIRI4
CNSTI4 0
EQI4 $1261
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $1259
LABELV $1261
line 2181
;2181:		{
line 2182
;2182:			if (self->client->ps.saberMove == LS_A_JUMP_T__B_)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 15
NEI4 $1262
line 2183
;2183:			{ //do extra damage for special unblockables
line 2184
;2184:				dmg += 5; //This is very tiny, because this move has a huge damage ramp
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 2185
;2185:			}
ADDRGP4 $1263
JUMPV
LABELV $1262
line 2186
;2186:			else if (self->client->ps.saberMove == LS_A_FLIP_STAB || self->client->ps.saberMove == LS_A_FLIP_SLASH)
ADDRLP4 1224
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 16
EQI4 $1266
ADDRLP4 1224
INDIRI4
CNSTI4 17
NEI4 $1264
LABELV $1266
line 2187
;2187:			{
line 2188
;2188:				dmg += 5; //ditto
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 2189
;2189:				if (dmg <= 40 || G_GetAnimPoint(self) <= 0.4f)
ADDRLP4 1136
INDIRI4
CNSTI4 40
LEI4 $1269
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1228
ADDRGP4 G_GetAnimPoint
CALLF4
ASGNF4
ADDRLP4 1228
INDIRF4
CNSTF4 1053609165
GTF4 $1265
LABELV $1269
line 2190
;2190:				{ //sort of a hack, don't want it doing big damage in the off points of the anim
line 2191
;2191:					dmg = 2;
ADDRLP4 1136
CNSTI4 2
ASGNI4
line 2192
;2192:				}
line 2193
;2193:			}
ADDRGP4 $1265
JUMPV
LABELV $1264
line 2194
;2194:			else if (self->client->ps.saberMove == LS_A_LUNGE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 14
NEI4 $1270
line 2195
;2195:			{
line 2196
;2196:				dmg += 2; //and ditto again
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 2197
;2197:				if (G_GetAnimPoint(self) <= 0.4f)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1228
ADDRGP4 G_GetAnimPoint
CALLF4
ASGNF4
ADDRLP4 1228
INDIRF4
CNSTF4 1053609165
GTF4 $1271
line 2198
;2198:				{ //same as above
line 2199
;2199:					dmg = 2;
ADDRLP4 1136
CNSTI4 2
ASGNI4
line 2200
;2200:				}
line 2201
;2201:			}
ADDRGP4 $1271
JUMPV
LABELV $1270
line 2203
;2202:			else
;2203:			{
line 2204
;2204:				dmg += 20;
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 2205
;2205:			}
LABELV $1271
LABELV $1265
LABELV $1263
line 2206
;2206:		}
LABELV $1259
line 2207
;2207:	}
LABELV $1257
line 2209
;2208:
;2209:	if (!dmg)
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $1274
line 2210
;2210:	{
line 2211
;2211:		if (tr.entityNum < MAX_CLIENTS ||
ADDRLP4 0+52
INDIRI4
CNSTI4 32
LTI4 $1284
ADDRLP4 1216
CNSTI4 2352
ASGNI4
ADDRLP4 1220
CNSTI4 0
ASGNI4
ADDRLP4 1216
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1220
INDIRI4
EQI4 $1276
ADDRLP4 1216
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
ADDRLP4 1220
INDIRI4
EQI4 $1276
LABELV $1284
line 2213
;2212:			(g_entities[tr.entityNum].inuse && (g_entities[tr.entityNum].r.contents & CONTENTS_LIGHTSABER)))
;2213:		{
line 2214
;2214:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1276
line 2216
;2215:		}
;2216:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1274
line 2219
;2217:	}
;2218:
;2219:	if (dmg > SABER_NONATTACK_DAMAGE && jk2gameplay == VERSION_1_04)
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1285
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1285
line 2220
;2220:	{
line 2221
;2221:		dmg *= g_saberDamageScale.value;
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CVIF4 4
ADDRGP4 g_saberDamageScale+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 2222
;2222:	}
LABELV $1285
line 2224
;2223:
;2224:	if (dmg > SABER_NONATTACK_DAMAGE && self->client->ps.isJediMaster)
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1288
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1288
line 2225
;2225:	{ //give the Jedi Master more saber attack power
line 2226
;2226:		dmg *= 2;
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 2227
;2227:	}
LABELV $1288
line 2229
;2228:
;2229:	VectorSubtract(saberEnd, saberStart, dir);
ADDRLP4 1216
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1220
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1144
ADDRLP4 1216
INDIRP4
INDIRF4
ADDRLP4 1220
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1224
CNSTI4 4
ASGNI4
ADDRLP4 1144+4
ADDRLP4 1216
INDIRP4
ADDRLP4 1224
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1220
INDIRP4
ADDRLP4 1224
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1228
CNSTI4 8
ASGNI4
ADDRLP4 1144+8
ADDRFP4 8
INDIRP4
ADDRLP4 1228
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 1228
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2230
;2230:	VectorNormalize(dir);
ADDRLP4 1144
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2236
;2231:
;2232:	//rww - I'm saying || tr.startsolid here, because otherwise your saber tends to skip positions and go through
;2233:	//people, and the compensation traces start in their bbox too. Which results in the saber passing through people
;2234:	//when you visually cut right through them. Which sucks.
;2235:
;2236:	if ((tr.fraction != 1 || tr.startsolid) &&
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $1303
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $1292
LABELV $1303
ADDRLP4 1232
CNSTI4 2352
ASGNI4
ADDRLP4 1236
CNSTI4 0
ASGNI4
ADDRLP4 1232
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+692
ADDP4
INDIRI4
ADDRLP4 1236
INDIRI4
EQI4 $1292
ADDRLP4 1232
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
ADDRLP4 1236
INDIRI4
GTI4 $1304
ADDRLP4 1232
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+8
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
ADDRLP4 1236
INDIRI4
EQI4 $1304
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $1292
LABELV $1304
ADDRLP4 0+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $1292
line 2240
;2237:		g_entities[tr.entityNum].takedamage &&
;2238:		((g_entities[tr.entityNum].health > 0 || !(g_entities[tr.entityNum].s.eFlags & EF_DISINTEGRATION)) || jk2gameplay != VERSION_1_04) &&
;2239:		tr.entityNum != self->s.number)
;2240:	{
line 2243
;2241:		gentity_t *te;
;2242:
;2243:		if (idleDamage &&
ADDRLP4 1176
INDIRI4
CNSTI4 0
EQI4 $1305
ADDRLP4 1244
CNSTI4 2352
ASGNI4
ADDRLP4 1244
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1305
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1244
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1248
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1252
CNSTI4 0
ASGNI4
ADDRLP4 1248
INDIRI4
ADDRLP4 1252
INDIRI4
EQI4 $1305
ADDRGP4 g_friendlySaber+12
INDIRI4
ADDRLP4 1252
INDIRI4
NEI4 $1305
line 2247
;2244:			g_entities[tr.entityNum].client &&
;2245:			OnSameTeam(self, &g_entities[tr.entityNum]) &&
;2246:			!g_friendlySaber.integer)
;2247:		{
line 2248
;2248:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1305
line 2251
;2249:		}
;2250:
;2251:		if (g_entities[tr.entityNum].inuse && g_entities[tr.entityNum].client &&
ADDRLP4 1256
CNSTI4 2352
ASGNI4
ADDRLP4 1260
CNSTI4 0
ASGNI4
ADDRLP4 1256
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1260
INDIRI4
EQI4 $1311
ADDRLP4 1256
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1311
ADDRLP4 1256
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 1260
INDIRI4
EQI4 $1311
ADDRLP4 1256
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $1311
line 2254
;2252:			g_entities[tr.entityNum].client->ps.duelInProgress &&
;2253:			g_entities[tr.entityNum].client->ps.duelIndex != self->s.number)
;2254:		{
line 2255
;2255:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1311
line 2258
;2256:		}
;2257:
;2258:		if (g_entities[tr.entityNum].inuse && g_entities[tr.entityNum].client &&
ADDRLP4 1264
CNSTI4 2352
ASGNI4
ADDRLP4 1268
CNSTI4 0
ASGNI4
ADDRLP4 1264
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1268
INDIRI4
EQI4 $1321
ADDRLP4 1264
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1321
ADDRLP4 1272
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1272
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 1268
INDIRI4
EQI4 $1321
ADDRLP4 1272
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 1264
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
INDIRI4
EQI4 $1321
line 2261
;2259:			self->client->ps.duelInProgress &&
;2260:			self->client->ps.duelIndex != g_entities[tr.entityNum].s.number)
;2261:		{
line 2262
;2262:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1321
line 2265
;2263:		}
;2264:
;2265:		self->client->ps.saberIdleWound = nowTime + g_saberDmgDelay_Idle.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 1156
INDIRI4
ADDRGP4 g_saberDmgDelay_Idle+12
INDIRI4
ADDI4
ASGNI4
line 2267
;2266:
;2267:		didHit = qtrue;
ADDRLP4 1164
CNSTI4 1
ASGNI4
line 2269
;2268:
;2269:		if (g_entities[tr.entityNum].client && !unblockable && WP_SaberCanBlock(&g_entities[tr.entityNum], tr.endpos, 0, MOD_SABER, qfalse, attackStr))
ADDRLP4 1276
CNSTI4 2352
ASGNI4
ADDRLP4 1276
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1329
ADDRLP4 1280
CNSTI4 0
ASGNI4
ADDRLP4 1160
INDIRI4
ADDRLP4 1280
INDIRI4
NEI4 $1329
ADDRLP4 1276
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 1280
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1280
INDIRI4
ARGI4
ADDRLP4 1172
INDIRI4
ARGI4
ADDRLP4 1284
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1284
INDIRI4
CNSTI4 0
EQI4 $1329
line 2270
;2270:		{
line 2271
;2271:			te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 0+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1288
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1240
ADDRLP4 1288
INDIRP4
ASGNP4
line 2272
;2272:			if (dmg <= SABER_NONATTACK_DAMAGE)
ADDRLP4 1136
INDIRI4
CNSTI4 1
GTI4 $1336
line 2273
;2273:			{
line 2274
;2274:				self->client->ps.saberIdleWound = nowTime + g_saberDmgDelay_Idle.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 1156
INDIRI4
ADDRGP4 g_saberDmgDelay_Idle+12
INDIRI4
ADDI4
ASGNI4
line 2275
;2275:			}
LABELV $1336
line 2276
;2276:			VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1240
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2277
;2277:			VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1240
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 2278
;2278:			te->s.eventParm = 1;
ADDRLP4 1240
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 2280
;2279:
;2280:			if (dmg > SABER_NONATTACK_DAMAGE)
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1341
line 2281
;2281:			{
line 2282
;2282:				int lockFactor = g_saberLockFactor.integer;
ADDRLP4 1292
ADDRGP4 g_saberLockFactor+12
INDIRI4
ASGNI4
line 2284
;2283:
;2284:				if ((g_entities[tr.entityNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK] - self->client->ps.fd.forcePowerLevel[FP_SABERATTACK]) > 1 &&
ADDRLP4 1296
CNSTI4 1004
ASGNI4
ADDRLP4 1300
CNSTI4 1
ASGNI4
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 1296
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 1296
INDIRI4
ADDP4
INDIRI4
SUBI4
ADDRLP4 1300
INDIRI4
LEI4 $1344
ADDRLP4 1300
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1304
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1304
INDIRI4
ADDRLP4 1292
INDIRI4
CNSTI4 1
LSHI4
GEI4 $1344
line 2286
;2285:					Q_irand(1, 10, qfalse, 5) < lockFactor*2)
;2286:				{ //Just got blocked by someone with a decently higher attack level, so enter into a lock (where they have the advantage due to a higher attack lev)
line 2287
;2287:					if (!G_ClientIdleInWorld(&g_entities[tr.entityNum]))
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1308
ADDRGP4 G_ClientIdleInWorld
CALLI4
ASGNI4
ADDRLP4 1308
INDIRI4
CNSTI4 0
NEI4 $1345
line 2288
;2288:					{
line 2289
;2289:						if (WP_SabersCheckLock(self, &g_entities[tr.entityNum]))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1312
ADDRGP4 WP_SabersCheckLock
CALLI4
ASGNI4
ADDRLP4 1312
INDIRI4
CNSTI4 0
EQI4 $1345
line 2290
;2290:						{	
line 2291
;2291:							self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 2292
;2292:							g_entities[tr.entityNum].client->ps.saberBlocked = BLOCKED_NONE;
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 2293
;2293:							return didHit;
ADDRLP4 1164
INDIRI4
RETI4
ADDRGP4 $1138
JUMPV
line 2295
;2294:						}
;2295:					}
line 2296
;2296:				}
LABELV $1344
line 2297
;2297:				else if (Q_irand(1, 20, qfalse, 10) < lockFactor)
CNSTI4 1
ARGI4
CNSTI4 20
ARGI4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1308
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1308
INDIRI4
ADDRLP4 1292
INDIRI4
GEI4 $1356
line 2298
;2298:				{
line 2299
;2299:					if (!G_ClientIdleInWorld(&g_entities[tr.entityNum]))
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1312
ADDRGP4 G_ClientIdleInWorld
CALLI4
ASGNI4
ADDRLP4 1312
INDIRI4
CNSTI4 0
NEI4 $1358
line 2300
;2300:					{
line 2301
;2301:						if (WP_SabersCheckLock(self, &g_entities[tr.entityNum]))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1316
ADDRGP4 WP_SabersCheckLock
CALLI4
ASGNI4
ADDRLP4 1316
INDIRI4
CNSTI4 0
EQI4 $1361
line 2302
;2302:						{	
line 2303
;2303:							self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 2304
;2304:							g_entities[tr.entityNum].client->ps.saberBlocked = BLOCKED_NONE;
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 2305
;2305:							return didHit;
ADDRLP4 1164
INDIRI4
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1361
line 2307
;2306:						}
;2307:					}
LABELV $1358
line 2308
;2308:				}
LABELV $1356
LABELV $1345
line 2309
;2309:			}
LABELV $1341
line 2310
;2310:			otherOwner = &g_entities[tr.entityNum];
ADDRLP4 1132
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2311
;2311:			goto blockStuff;
ADDRGP4 $1367
JUMPV
LABELV $1329
line 2314
;2312:		}
;2313:		else
;2314:		{
line 2315
;2315:			if (g_entities[tr.entityNum].client && g_entities[tr.entityNum].client->ps.usingATST)
ADDRLP4 1288
CNSTI4 2352
ASGNI4
ADDRLP4 1288
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1368
ADDRLP4 1288
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1368
line 2316
;2316:			{
line 2317
;2317:				dmg *= 0.1;
ADDRLP4 1136
CNSTF4 1036831949
ADDRLP4 1136
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 2318
;2318:			}
LABELV $1368
line 2320
;2319:
;2320:			if (g_entities[tr.entityNum].client && !g_entities[tr.entityNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK])
ADDRLP4 1292
CNSTI4 2352
ASGNI4
ADDRLP4 1292
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1374
ADDRLP4 1292
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1374
line 2321
;2321:			{ //not a "jedi", so make them suffer more
line 2322
;2322:				if (dmg > SABER_NONATTACK_DAMAGE)
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1380
line 2323
;2323:				{ //don't bother increasing just for idle touch damage
line 2324
;2324:					dmg *= 1.5;
ADDRLP4 1136
CNSTF4 1069547520
ADDRLP4 1136
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 2325
;2325:				}
LABELV $1380
line 2326
;2326:			}
LABELV $1374
line 2328
;2327:
;2328:			if (g_entities[tr.entityNum].client && g_entities[tr.entityNum].client->ps.weapon == WP_SABER)
ADDRLP4 1296
CNSTI4 2352
ASGNI4
ADDRLP4 1296
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1382
ADDRLP4 1296
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1382
line 2329
;2329:			{ //for jedi using the saber, half the damage (this comes with the increased default dmg debounce time)
line 2330
;2330:				if (dmg > SABER_NONATTACK_DAMAGE && !unblockable)
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1388
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $1388
line 2331
;2331:				{ //don't reduce damage if it's only 1, or if this is an unblockable attack
line 2332
;2332:					if (dmg == SABER_HITDAMAGE)
ADDRLP4 1136
INDIRI4
CNSTI4 35
NEI4 $1390
line 2333
;2333:					{ //level 1 attack
line 2334
;2334:						dmg *= 0.7;
ADDRLP4 1136
CNSTF4 1060320051
ADDRLP4 1136
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 2335
;2335:					}
ADDRGP4 $1391
JUMPV
LABELV $1390
line 2337
;2336:					else
;2337:					{
line 2338
;2338:						dmg *= 0.5;
ADDRLP4 1136
CNSTF4 1056964608
ADDRLP4 1136
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 2339
;2339:					}
LABELV $1391
line 2340
;2340:				}
LABELV $1388
line 2341
;2341:			}
LABELV $1382
line 2343
;2342:
;2343:			G_Damage(&g_entities[tr.entityNum], self, self, dir, tr.endpos, dmg, 0, MOD_SABER);
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1300
INDIRP4
ARGP4
ADDRLP4 1300
INDIRP4
ARGP4
ADDRLP4 1144
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 1136
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2345
;2344:
;2345:			te = G_TempEntity( tr.endpos, EV_SABER_HIT );
ADDRLP4 0+12
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 1304
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1240
ADDRLP4 1304
INDIRP4
ASGNP4
line 2347
;2346:
;2347:			VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1240
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2348
;2348:			VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1240
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 2350
;2349:			
;2350:			if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1308
ADDRLP4 1240
INDIRP4
ASGNP4
ADDRLP4 1312
CNSTF4 0
ASGNF4
ADDRLP4 1308
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1312
INDIRF4
NEF4 $1397
ADDRLP4 1308
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1312
INDIRF4
NEF4 $1397
ADDRLP4 1308
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1312
INDIRF4
NEF4 $1397
line 2351
;2351:			{ //don't let it play with no direction
line 2352
;2352:				te->s.angles[1] = 1;
ADDRLP4 1240
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 2353
;2353:			}
LABELV $1397
line 2355
;2354:
;2355:			if (g_entities[tr.entityNum].client)
CNSTI4 2352
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1399
line 2356
;2356:			{
line 2357
;2357:				te->s.eventParm = 1;
ADDRLP4 1240
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 2358
;2358:			}
ADDRGP4 $1400
JUMPV
LABELV $1399
line 2360
;2359:			else
;2360:			{
line 2361
;2361:				te->s.eventParm = 0;
ADDRLP4 1240
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 2362
;2362:			}
LABELV $1400
line 2364
;2363:
;2364:			self->client->ps.saberAttackWound = nowTime + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRLP4 1156
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2365
;2365:		}
line 2366
;2366:	}
ADDRGP4 $1293
JUMPV
LABELV $1292
line 2367
;2367:	else if ((tr.fraction != 1 || tr.startsolid) &&
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $1413
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $1403
LABELV $1413
ADDRLP4 1240
CNSTI4 2352
ASGNI4
ADDRLP4 1240
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
EQI4 $1403
ADDRLP4 1240
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1403
line 2370
;2368:		(g_entities[tr.entityNum].r.contents & CONTENTS_LIGHTSABER) &&
;2369:		g_entities[tr.entityNum].r.contents != -1)
;2370:	{ //saber clash
line 2372
;2371:		gentity_t *te;
;2372:		otherOwner = &g_entities[g_entities[tr.entityNum].r.ownerNum];
ADDRLP4 1248
CNSTI4 2352
ASGNI4
ADDRLP4 1132
ADDRLP4 1248
INDIRI4
ADDRLP4 1248
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+100
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2374
;2373:
;2374:		if (otherOwner &&
ADDRLP4 1256
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1256
INDIRU4
EQU4 $1417
ADDRLP4 1132
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1417
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1256
INDIRU4
EQU4 $1417
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1260
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1264
CNSTI4 0
ASGNI4
ADDRLP4 1260
INDIRI4
ADDRLP4 1264
INDIRI4
EQI4 $1417
ADDRGP4 g_friendlySaber+12
INDIRI4
ADDRLP4 1264
INDIRI4
NEI4 $1417
line 2379
;2375:			otherOwner->inuse &&
;2376:			otherOwner->client &&
;2377:			OnSameTeam(self, otherOwner) &&
;2378:			!g_friendlySaber.integer)
;2379:		{
line 2380
;2380:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1417
line 2383
;2381:		}
;2382:
;2383:		if (otherOwner && otherOwner->client &&
ADDRLP4 1272
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1272
INDIRU4
EQU4 $1420
ADDRLP4 1276
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1276
INDIRP4
CVPU4 4
ADDRLP4 1272
INDIRU4
EQU4 $1420
ADDRLP4 1276
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1420
ADDRLP4 1276
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $1420
line 2386
;2384:			otherOwner->client->ps.duelInProgress &&
;2385:			otherOwner->client->ps.duelIndex != self->s.number)
;2386:		{
line 2387
;2387:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1420
line 2390
;2388:		}
;2389:
;2390:		if (otherOwner && otherOwner->client &&
ADDRLP4 1284
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1284
INDIRU4
EQU4 $1422
ADDRLP4 1288
CNSTI4 408
ASGNI4
ADDRLP4 1132
INDIRP4
ADDRLP4 1288
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1284
INDIRU4
EQU4 $1422
ADDRLP4 1292
ADDRFP4 0
INDIRP4
ADDRLP4 1288
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1292
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1422
ADDRLP4 1292
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 1132
INDIRP4
INDIRI4
EQI4 $1422
line 2393
;2391:			self->client->ps.duelInProgress &&
;2392:			self->client->ps.duelIndex != otherOwner->s.number)
;2393:		{
line 2394
;2394:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1422
line 2397
;2395:		}
;2396:
;2397:		if (self->client && otherOwner->client && (self->s.bolt1 != otherOwner->s.bolt1))//JAPRO fix clients being able to block sabers in other dimensions (duel/racemode)?
ADDRLP4 1296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1300
CNSTI4 408
ASGNI4
ADDRLP4 1304
CNSTU4 0
ASGNU4
ADDRLP4 1296
INDIRP4
ADDRLP4 1300
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1304
INDIRU4
EQU4 $1424
ADDRLP4 1132
INDIRP4
ADDRLP4 1300
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1304
INDIRU4
EQU4 $1424
ADDRLP4 1312
CNSTI4 140
ASGNI4
ADDRLP4 1296
INDIRP4
ADDRLP4 1312
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1132
INDIRP4
ADDRLP4 1312
INDIRI4
ADDP4
INDIRI4
EQI4 $1424
line 2398
;2398:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1424
line 2399
;2399:		if (self->client && self->client->ps.stats[STAT_RACEMODE])//Racemode ppl shouldnt even be able to block other racemode ppls sabers
ADDRLP4 1316
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1316
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1426
ADDRLP4 1316
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1426
line 2400
;2400:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1426
line 2401
;2401:		if (otherOwner->client && otherOwner->client->ps.stats[STAT_RACEMODE])
ADDRLP4 1320
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1320
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1428
ADDRLP4 1320
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1428
line 2402
;2402:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1428
line 2404
;2403:
;2404:		didHit = qtrue;
ADDRLP4 1164
CNSTI4 1
ASGNI4
line 2405
;2405:		self->client->ps.saberIdleWound = nowTime + g_saberDmgDelay_Idle.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 1156
INDIRI4
ADDRGP4 g_saberDmgDelay_Idle+12
INDIRI4
ADDI4
ASGNI4
line 2407
;2406:
;2407:		te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 0+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1324
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1244
ADDRLP4 1324
INDIRP4
ASGNP4
line 2408
;2408:		if (dmg <= SABER_NONATTACK_DAMAGE)
ADDRLP4 1136
INDIRI4
CNSTI4 1
GTI4 $1432
line 2409
;2409:		{
line 2410
;2410:			self->client->ps.saberIdleWound = nowTime + g_saberDmgDelay_Idle.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 1156
INDIRI4
ADDRGP4 g_saberDmgDelay_Idle+12
INDIRI4
ADDI4
ASGNI4
line 2411
;2411:		}
LABELV $1432
line 2413
;2412:
;2413:		VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1244
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2414
;2414:		VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1244
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 2415
;2415:		te->s.eventParm = 1;
ADDRLP4 1244
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 2417
;2416:
;2417:		sabersClashed = qtrue;
ADDRLP4 1180
CNSTI4 1
ASGNI4
LABELV $1367
line 2420
;2418:
;2419:blockStuff:
;2420:		otherUnblockable = qfalse;
ADDRLP4 1168
CNSTI4 0
ASGNI4
line 2422
;2421:
;2422:		if (otherOwner && otherOwner->client && otherOwner->client->ps.saberInFlight)
ADDRLP4 1332
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1332
INDIRU4
EQU4 $1437
ADDRLP4 1336
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1336
INDIRP4
CVPU4 4
ADDRLP4 1332
INDIRU4
EQU4 $1437
ADDRLP4 1336
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1437
line 2423
;2423:		{
line 2424
;2424:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1437
line 2427
;2425:		}
;2426:
;2427:		if (dmg > SABER_NONATTACK_DAMAGE && !unblockable && !otherUnblockable)
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1439
ADDRLP4 1340
CNSTI4 0
ASGNI4
ADDRLP4 1160
INDIRI4
ADDRLP4 1340
INDIRI4
NEI4 $1439
ADDRLP4 1168
INDIRI4
ADDRLP4 1340
INDIRI4
NEI4 $1439
line 2428
;2428:		{
line 2429
;2429:			int lockFactor = g_saberLockFactor.integer;
ADDRLP4 1344
ADDRGP4 g_saberLockFactor+12
INDIRI4
ASGNI4
line 2431
;2430:
;2431:			if (sabersClashed && Q_irand(1, 20, qfalse, 10) <= lockFactor)
ADDRLP4 1348
CNSTI4 0
ASGNI4
ADDRLP4 1180
INDIRI4
ADDRLP4 1348
INDIRI4
EQI4 $1442
CNSTI4 1
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 1348
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1352
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1352
INDIRI4
ADDRLP4 1344
INDIRI4
GTI4 $1442
line 2432
;2432:			{
line 2433
;2433:				if (!G_ClientIdleInWorld(otherOwner))
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1356
ADDRGP4 G_ClientIdleInWorld
CALLI4
ASGNI4
ADDRLP4 1356
INDIRI4
CNSTI4 0
NEI4 $1444
line 2434
;2434:				{
line 2435
;2435:					if (WP_SabersCheckLock(self, otherOwner))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1360
ADDRGP4 WP_SabersCheckLock
CALLI4
ASGNI4
ADDRLP4 1360
INDIRI4
CNSTI4 0
EQI4 $1446
line 2436
;2436:					{
line 2437
;2437:						self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 2438
;2438:						otherOwner->client->ps.saberBlocked = BLOCKED_NONE;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 2439
;2439:						return didHit;
ADDRLP4 1164
INDIRI4
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1446
line 2441
;2440:					}
;2441:				}
LABELV $1444
line 2442
;2442:			}
LABELV $1442
line 2443
;2443:		}
LABELV $1439
line 2445
;2444:
;2445:		if (!otherOwner || !otherOwner->client)
ADDRLP4 1348
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1348
INDIRU4
EQU4 $1450
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1348
INDIRU4
NEU4 $1448
LABELV $1450
line 2446
;2446:		{
line 2447
;2447:			return didHit;
ADDRLP4 1164
INDIRI4
RETI4
ADDRGP4 $1138
JUMPV
LABELV $1448
line 2450
;2448:		}
;2449:
;2450:		if (BG_SaberInSpecial(otherOwner->client->ps.saberMove))
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1352
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1352
INDIRI4
CNSTI4 0
EQI4 $1451
line 2451
;2451:		{
line 2452
;2452:			otherUnblockable = qtrue;
ADDRLP4 1168
CNSTI4 1
ASGNI4
line 2453
;2453:			otherOwner->client->ps.saberBlocked = 0;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 2454
;2454:		}
LABELV $1451
line 2456
;2455:
;2456:		if ( sabersClashed &&
ADDRLP4 1180
INDIRI4
CNSTI4 0
EQI4 $1453
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1453
ADDRLP4 1356
CNSTI4 408
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1356
INDIRI4
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
GEI4 $1453
ADDRLP4 1132
INDIRP4
ADDRLP4 1356
INDIRI4
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1360
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1360
INDIRI4
CNSTI4 0
NEI4 $1453
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1364
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1364
INDIRI4
CNSTI4 0
NEI4 $1453
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1368
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1368
INDIRI4
CNSTI4 0
NEI4 $1453
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1372
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1372
INDIRI4
CNSTI4 0
NEI4 $1453
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1376
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1376
INDIRI4
CNSTI4 0
NEI4 $1453
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1380
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1380
INDIRI4
CNSTI4 0
NEI4 $1453
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1384
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1388
CNSTI4 0
ASGNI4
ADDRLP4 1384
INDIRI4
ADDRLP4 1388
INDIRI4
NEI4 $1453
ADDRLP4 1160
INDIRI4
ADDRLP4 1388
INDIRI4
NEI4 $1453
line 2467
;2457:			dmg > SABER_NONATTACK_DAMAGE &&
;2458:			 self->client->ps.fd.saberAnimLevel < FORCE_LEVEL_3 &&
;2459:			 !PM_SaberInBounce(otherOwner->client->ps.saberMove) &&
;2460:			 !PM_SaberInParry(self->client->ps.saberMove) &&
;2461:			 !PM_SaberInBrokenParry(self->client->ps.saberMove) &&
;2462:			 !BG_SaberInSpecial(self->client->ps.saberMove) &&
;2463:			 !PM_SaberInBounce(self->client->ps.saberMove) &&
;2464:			 !PM_SaberInDeflect(self->client->ps.saberMove) &&
;2465:			 !PM_SaberInReflect(self->client->ps.saberMove) &&
;2466:			 !unblockable )
;2467:		{
line 2469
;2468:			//if (Q_irand(1, 10) <= 6)
;2469:			if (1) //for now, just always try a deflect. (deflect func can cause bounces too)
line 2470
;2470:			{
line 2471
;2471:				if (!WP_GetSaberDeflectionAngle(self, otherOwner, tr.fraction))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 1392
ADDRGP4 WP_GetSaberDeflectionAngle
CALLI4
ASGNI4
ADDRLP4 1392
INDIRI4
CNSTI4 0
NEI4 $1457
line 2472
;2472:				{
line 2473
;2473:					tryDeflectAgain = qtrue; //Failed the deflect, try it again if we can if the guy we're smashing goes into a parry and we don't break it
ADDRLP4 1188
CNSTI4 1
ASGNI4
line 2474
;2474:				}
ADDRGP4 $1456
JUMPV
LABELV $1457
line 2476
;2475:				else
;2476:				{
line 2477
;2477:					self->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 2478
;2478:					didOffense = qtrue;
ADDRLP4 1184
CNSTI4 1
ASGNI4
line 2479
;2479:				}
line 2480
;2480:			}
ADDRGP4 $1456
JUMPV
LABELV $1455
line 2482
;2481:			else
;2482:			{
line 2483
;2483:				self->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 2484
;2484:				didOffense = qtrue;
ADDRLP4 1184
CNSTI4 1
ASGNI4
line 2486
;2485:
;2486:				if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1460
line 2487
;2487:				{
line 2488
;2488:					Com_Printf("Client %i clashed into client %i's saber, did BLOCKED_ATK_BOUNCE\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1463
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2489
;2489:				}
LABELV $1460
line 2490
;2490:			}
LABELV $1456
line 2491
;2491:		}
LABELV $1453
line 2493
;2492:
;2493:		if ( ((self->client->ps.fd.saberAnimLevel < FORCE_LEVEL_3 && ((tryDeflectAgain && Q_irand(1, 10, qfalse, 5) <= 3) || (!tryDeflectAgain && Q_irand(1, 10, qfalse, 5) <= 7))) || (Q_irand(1, 10, qfalse, 5) <= 1 && otherOwner->client->ps.fd.saberAnimLevel >= FORCE_LEVEL_3))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
GEI4 $1469
ADDRLP4 1392
CNSTI4 0
ASGNI4
ADDRLP4 1188
INDIRI4
ADDRLP4 1392
INDIRI4
EQI4 $1468
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1392
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1396
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1396
INDIRI4
CNSTI4 3
LEI4 $1466
LABELV $1468
ADDRLP4 1400
CNSTI4 0
ASGNI4
ADDRLP4 1188
INDIRI4
ADDRLP4 1400
INDIRI4
NEI4 $1469
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1400
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1404
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1404
INDIRI4
CNSTI4 7
LEI4 $1466
LABELV $1469
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1408
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1408
INDIRI4
CNSTI4 1
GTI4 $1464
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1464
LABELV $1466
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1412
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1412
INDIRI4
CNSTI4 0
NEI4 $1464
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1416
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1416
INDIRI4
CNSTI4 0
NEI4 $1464
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1420
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1420
INDIRI4
CNSTI4 0
NEI4 $1464
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1424
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1424
INDIRI4
CNSTI4 0
NEI4 $1464
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1428
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1428
INDIRI4
CNSTI4 0
NEI4 $1464
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1432
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1436
CNSTI4 0
ASGNI4
ADDRLP4 1432
INDIRI4
ADDRLP4 1436
INDIRI4
NEI4 $1464
ADDRLP4 1440
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1444
ADDRLP4 1440
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1444
INDIRI4
CNSTI4 2
GTI4 $1470
ADDRLP4 1440
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1464
ADDRLP4 1436
INDIRI4
ARGI4
ADDRLP4 1444
INDIRI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
ADDI4
ARGI4
ADDRLP4 1436
INDIRI4
ARGI4
ADDRLP4 1436
INDIRI4
ARGI4
ADDRLP4 1448
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1448
INDIRI4
CNSTI4 0
EQI4 $1464
LABELV $1470
ADDRLP4 1452
CNSTI4 0
ASGNI4
ADDRLP4 1160
INDIRI4
ADDRLP4 1452
INDIRI4
NEI4 $1464
ADDRLP4 1168
INDIRI4
ADDRLP4 1452
INDIRI4
NEI4 $1464
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1464
ADDRLP4 1184
INDIRI4
ADDRLP4 1452
INDIRI4
NEI4 $1464
line 2507
;2494:			&& !PM_SaberInBounce(self->client->ps.saberMove)
;2495:
;2496:			&& !PM_SaberInBrokenParry(otherOwner->client->ps.saberMove)
;2497:			&& !BG_SaberInSpecial(otherOwner->client->ps.saberMove)
;2498:			&& !PM_SaberInBounce(otherOwner->client->ps.saberMove)
;2499:			&& !PM_SaberInDeflect(otherOwner->client->ps.saberMove)
;2500:			&& !PM_SaberInReflect(otherOwner->client->ps.saberMove)
;2501:
;2502:			&& (otherOwner->client->ps.fd.saberAnimLevel > FORCE_LEVEL_2 || ( otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= 3 && Q_irand(0, otherOwner->client->ps.fd.saberAnimLevel + gRandomUnlockAdd, qfalse, 0) ))
;2503:			&& !unblockable
;2504:			&& !otherUnblockable
;2505:			&& dmg > SABER_NONATTACK_DAMAGE
;2506:			&& !didOffense) //don't allow the person we're attacking to do this if we're making an unblockable attack
;2507:		{//knockaways can make fast-attacker go into a broken parry anim if the ent is using fast or med. In MP, we also randomly decide this for level 3 attacks.
line 2510
;2508:			//Going to go ahead and let idle damage do simple knockaways. Looks sort of good that way.
;2509:			//turn the parry into a knockaway
;2510:			if (!PM_SaberInParry(otherOwner->client->ps.saberMove))
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1456
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1456
INDIRI4
CNSTI4 0
NEI4 $1471
line 2511
;2511:			{
line 2512
;2512:				WP_SaberBlockNonRandom(otherOwner, tr.endpos, qfalse);
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_SaberBlockNonRandom
CALLV
pop
line 2513
;2513:				otherOwner->client->ps.saberMove = BG_KnockawayForParry( otherOwner->client->ps.saberBlocked );
ADDRLP4 1460
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1460
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 1464
ADDRGP4 BG_KnockawayForParry
CALLI4
ASGNI4
ADDRLP4 1460
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 1464
INDIRI4
ASGNI4
line 2514
;2514:				otherOwner->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 2515
;2515:			}
ADDRGP4 $1472
JUMPV
LABELV $1471
line 2517
;2516:			else
;2517:			{
line 2518
;2518:				otherOwner->client->ps.saberMove = G_KnockawayForParry(otherOwner->client->ps.saberMove); //BG_KnockawayForParry( otherOwner->client->ps.saberBlocked );
ADDRLP4 1460
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1464
ADDRGP4 G_KnockawayForParry
CALLI4
ASGNI4
ADDRLP4 1460
INDIRP4
ADDRLP4 1464
INDIRI4
ASGNI4
line 2519
;2519:				otherOwner->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 2520
;2520:			}
LABELV $1472
line 2523
;2521:	
;2522:			//make them (me) go into a broken parry
;2523:			self->client->ps.saberMove = BG_BrokenParryForAttack( self->client->ps.saberMove );
ADDRLP4 1460
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1464
ADDRGP4 BG_BrokenParryForAttack
CALLI4
ASGNI4
ADDRLP4 1460
INDIRP4
ADDRLP4 1464
INDIRI4
ASGNI4
line 2524
;2524:			self->client->ps.saberBlocked = BLOCKED_BOUNCE_MOVE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 2526
;2525:
;2526:			if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1474
line 2527
;2527:			{
line 2528
;2528:				Com_Printf("Client %i sent client %i into a reflected attack with a knockaway\n", otherOwner->s.number, self->s.number);
ADDRGP4 $1477
ARGP4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2529
;2529:			}
LABELV $1474
line 2531
;2530:
;2531:			didDefense = qtrue;
ADDRLP4 1192
CNSTI4 1
ASGNI4
line 2532
;2532:		}
ADDRGP4 $1465
JUMPV
LABELV $1464
line 2533
;2533:		else if ((self->client->ps.fd.saberAnimLevel > FORCE_LEVEL_2 || unblockable) && //if we're doing a special attack, we can send them into a broken parry too (MP only)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
GTI4 $1481
ADDRLP4 1160
INDIRI4
CNSTI4 0
EQI4 $1478
LABELV $1481
ADDRLP4 1460
CNSTI4 408
ASGNI4
ADDRLP4 1464
ADDRLP4 1132
INDIRP4
ADDRLP4 1460
INDIRI4
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1468
ADDRFP4 0
INDIRP4
ADDRLP4 1460
INDIRI4
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1464
INDIRI4
ADDRLP4 1468
INDIRI4
LTI4 $1483
ADDRLP4 1464
INDIRI4
ADDRLP4 1468
INDIRI4
NEI4 $1478
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1472
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $1484
ADDRLP4 1456
CNSTF4 1069547520
ASGNF4
ADDRGP4 $1485
JUMPV
LABELV $1484
ADDRLP4 1456
CNSTF4 1077936128
ASGNF4
LABELV $1485
ADDRLP4 1472
INDIRI4
CVIF4 4
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 1456
INDIRF4
MULF4
GEF4 $1483
ADDRLP4 1160
INDIRI4
CNSTI4 0
EQI4 $1478
LABELV $1483
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1476
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1476
INDIRI4
CNSTI4 0
EQI4 $1478
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1480
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1480
INDIRI4
CNSTI4 0
NEI4 $1478
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1484
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1484
INDIRI4
CNSTI4 0
NEI4 $1478
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1488
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1488
INDIRI4
CNSTI4 0
NEI4 $1478
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1492
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1496
CNSTI4 0
ASGNI4
ADDRLP4 1492
INDIRI4
ADDRLP4 1496
INDIRI4
NEI4 $1478
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1478
ADDRLP4 1184
INDIRI4
ADDRLP4 1496
INDIRI4
NEI4 $1478
ADDRLP4 1168
INDIRI4
ADDRLP4 1496
INDIRI4
NEI4 $1478
line 2543
;2534:				 ( otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] < self->client->ps.fd.saberAnimLevel || (otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] == self->client->ps.fd.saberAnimLevel && (Q_irand(1, 10, qfalse, 5) >= otherOwner->client->ps.fd.saberAnimLevel*(jk2gameplay == VERSION_1_04 ? 1.5 : 3) || unblockable)) ) &&
;2535:				 PM_SaberInParry(otherOwner->client->ps.saberMove) &&
;2536:				 !PM_SaberInBrokenParry(otherOwner->client->ps.saberMove) &&
;2537:				 !PM_SaberInParry(self->client->ps.saberMove) &&
;2538:				 !PM_SaberInBrokenParry(self->client->ps.saberMove) &&
;2539:				 !PM_SaberInBounce(self->client->ps.saberMove) &&
;2540:				 dmg > SABER_NONATTACK_DAMAGE &&
;2541:				 !didOffense &&
;2542:				 !otherUnblockable)
;2543:		{ //they are in a parry, and we are slamming down on them with a move of equal or greater force than their defense, so send them into a broken parry.. unless they are already in one.
line 2544
;2544:			if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1486
line 2545
;2545:			{
line 2546
;2546:				Com_Printf("Client %i sent client %i into a broken parry\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1489
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2547
;2547:			}
LABELV $1486
line 2549
;2548:
;2549:			otherOwner->client->ps.saberMove = BG_BrokenParryForParry( otherOwner->client->ps.saberMove, otherOwner->client->sess.raceMode );
ADDRLP4 1500
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1504
ADDRLP4 1500
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 1504
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1500
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ARGI4
ADDRLP4 1508
ADDRGP4 BG_BrokenParryForParry
CALLI4
ASGNI4
ADDRLP4 1504
INDIRP4
ADDRLP4 1508
INDIRI4
ASGNI4
line 2550
;2550:			otherOwner->client->ps.saberBlocked = BLOCKED_PARRY_BROKEN;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 2552
;2551:
;2552:			didDefense = qtrue;
ADDRLP4 1192
CNSTI4 1
ASGNI4
line 2553
;2553:		}
ADDRGP4 $1479
JUMPV
LABELV $1478
line 2554
;2554:		else if ((self->client->ps.fd.saberAnimLevel > FORCE_LEVEL_2) && //if we're doing a special attack, we can send them into a broken parry too (MP only)
ADDRLP4 1500
CNSTI4 408
ASGNI4
ADDRLP4 1504
CNSTI4 1228
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1500
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1504
INDIRI4
ADDP4
INDIRI4
CNSTI4 2
LEI4 $1490
ADDRLP4 1508
ADDRLP4 1132
INDIRP4
ADDRLP4 1500
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1508
INDIRP4
ADDRLP4 1504
INDIRI4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1490
ADDRLP4 1508
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1512
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1512
INDIRI4
CNSTI4 0
EQI4 $1490
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1516
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1516
INDIRI4
CNSTI4 0
NEI4 $1490
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1520
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1520
INDIRI4
CNSTI4 0
NEI4 $1490
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1524
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1524
INDIRI4
CNSTI4 0
NEI4 $1490
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1528
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1528
INDIRI4
CNSTI4 0
NEI4 $1490
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1532
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1532
INDIRI4
CNSTI4 0
NEI4 $1490
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1536
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1540
CNSTI4 0
ASGNI4
ADDRLP4 1536
INDIRI4
ADDRLP4 1540
INDIRI4
NEI4 $1490
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1490
ADDRLP4 1184
INDIRI4
ADDRLP4 1540
INDIRI4
NEI4 $1490
ADDRLP4 1160
INDIRI4
ADDRLP4 1540
INDIRI4
NEI4 $1490
line 2567
;2555:				 //( otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] < self->client->ps.fd.saberAnimLevel || (otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] == self->client->ps.fd.saberAnimLevel && (Q_irand(1, 10) >= otherOwner->client->ps.fd.saberAnimLevel*3 || unblockable)) ) &&
;2556:				 otherOwner->client->ps.fd.saberAnimLevel >= FORCE_LEVEL_3 &&
;2557:				 PM_SaberInParry(otherOwner->client->ps.saberMove) &&
;2558:				 !PM_SaberInBrokenParry(otherOwner->client->ps.saberMove) &&
;2559:				 !PM_SaberInParry(self->client->ps.saberMove) &&
;2560:				 !PM_SaberInBrokenParry(self->client->ps.saberMove) &&
;2561:				 !PM_SaberInBounce(self->client->ps.saberMove) &&
;2562:				 !PM_SaberInDeflect(self->client->ps.saberMove) &&
;2563:				 !PM_SaberInReflect(self->client->ps.saberMove) &&
;2564:				 dmg > SABER_NONATTACK_DAMAGE &&
;2565:				 !didOffense &&
;2566:				 !unblockable)
;2567:		{ //they are in a parry, and we are slamming down on them with a move of equal or greater force than their defense, so send them into a broken parry.. unless they are already in one.
line 2568
;2568:			if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1492
line 2569
;2569:			{
line 2570
;2570:				Com_Printf("Client %i bounced off of client %i's saber\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1495
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2571
;2571:			}
LABELV $1492
line 2573
;2572:
;2573:			if (!tryDeflectAgain)
ADDRLP4 1188
INDIRI4
CNSTI4 0
NEI4 $1496
line 2574
;2574:			{
line 2575
;2575:				if (!WP_GetSaberDeflectionAngle(self, otherOwner, tr.fraction))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 1544
ADDRGP4 WP_GetSaberDeflectionAngle
CALLI4
ASGNI4
ADDRLP4 1544
INDIRI4
CNSTI4 0
NEI4 $1498
line 2576
;2576:				{
line 2577
;2577:					tryDeflectAgain = qtrue;
ADDRLP4 1188
CNSTI4 1
ASGNI4
line 2578
;2578:				}
LABELV $1498
line 2579
;2579:			}
LABELV $1496
line 2581
;2580:
;2581:			didOffense = qtrue;
ADDRLP4 1184
CNSTI4 1
ASGNI4
line 2582
;2582:		}
ADDRGP4 $1491
JUMPV
LABELV $1490
line 2583
;2583:		else if (SaberAttacking(otherOwner) && dmg > SABER_NONATTACK_DAMAGE && !BG_SaberInSpecial(otherOwner->client->ps.saberMove) && !didOffense && !otherUnblockable)
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1544
ADDRGP4 SaberAttacking
CALLI4
ASGNI4
ADDRLP4 1544
INDIRI4
CNSTI4 0
EQI4 $1501
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1501
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1548
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1552
CNSTI4 0
ASGNI4
ADDRLP4 1548
INDIRI4
ADDRLP4 1552
INDIRI4
NEI4 $1501
ADDRLP4 1184
INDIRI4
ADDRLP4 1552
INDIRI4
NEI4 $1501
ADDRLP4 1168
INDIRI4
ADDRLP4 1552
INDIRI4
NEI4 $1501
line 2584
;2584:		{ //they were attacking and our saber hit their saber, make them bounce. But if they're in a special attack, leave them.
line 2585
;2585:			if (!PM_SaberInBounce(self->client->ps.saberMove) &&
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1556
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1556
INDIRI4
CNSTI4 0
NEI4 $1503
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1560
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1560
INDIRI4
CNSTI4 0
NEI4 $1503
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1564
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1564
INDIRI4
CNSTI4 0
NEI4 $1503
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1568
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1568
INDIRI4
CNSTI4 0
NEI4 $1503
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1572
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1572
INDIRI4
CNSTI4 0
NEI4 $1503
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1576
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1576
INDIRI4
CNSTI4 0
NEI4 $1503
line 2592
;2586:				!PM_SaberInBounce(otherOwner->client->ps.saberMove) &&
;2587:				!PM_SaberInDeflect(self->client->ps.saberMove) &&
;2588:				!PM_SaberInDeflect(otherOwner->client->ps.saberMove) &&
;2589:
;2590:				!PM_SaberInReflect(self->client->ps.saberMove) &&
;2591:				!PM_SaberInReflect(otherOwner->client->ps.saberMove))
;2592:			{
line 2593
;2593:				if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1505
line 2594
;2594:				{
line 2595
;2595:					Com_Printf("Client %i and client %i bounced off of each other's sabers\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1508
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2596
;2596:				}
LABELV $1505
line 2598
;2597:
;2598:				self->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 2599
;2599:				otherOwner->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 2601
;2600:
;2601:				didOffense = qtrue;
ADDRLP4 1184
CNSTI4 1
ASGNI4
line 2602
;2602:			}
LABELV $1503
line 2603
;2603:		}
LABELV $1501
LABELV $1491
LABELV $1479
LABELV $1465
line 2606
;2604:		
;2605:#ifdef G2_COLLISION_ENABLED
;2606:		if (g_saberGhoul2Collision.integer && !didDefense && dmg <= SABER_NONATTACK_DAMAGE && !otherUnblockable) //with perpoly, it looks pretty weird to have clash flares coming off the guy's face and whatnot
ADDRLP4 1556
CNSTI4 0
ASGNI4
ADDRGP4 g_saberGhoul2Collision+12
INDIRI4
ADDRLP4 1556
INDIRI4
EQI4 $1509
ADDRLP4 1192
INDIRI4
ADDRLP4 1556
INDIRI4
NEI4 $1509
ADDRLP4 1136
INDIRI4
CNSTI4 1
GTI4 $1509
ADDRLP4 1168
INDIRI4
ADDRLP4 1556
INDIRI4
NEI4 $1509
line 2607
;2607:		{
line 2608
;2608:			if (!PM_SaberInParry(otherOwner->client->ps.saberMove) &&
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1560
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1560
INDIRI4
CNSTI4 0
NEI4 $1510
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1564
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1564
INDIRI4
CNSTI4 0
NEI4 $1510
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1568
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1568
INDIRI4
CNSTI4 0
NEI4 $1510
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1572
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1572
INDIRI4
CNSTI4 0
NEI4 $1510
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1576
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1576
INDIRI4
CNSTI4 0
NEI4 $1510
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1580
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1580
INDIRI4
CNSTI4 0
NEI4 $1510
line 2614
;2609:				!PM_SaberInBrokenParry(otherOwner->client->ps.saberMove) &&
;2610:				!BG_SaberInSpecial(otherOwner->client->ps.saberMove) &&
;2611:				!PM_SaberInBounce(otherOwner->client->ps.saberMove) &&
;2612:				!PM_SaberInDeflect(otherOwner->client->ps.saberMove) &&
;2613:				!PM_SaberInReflect(otherOwner->client->ps.saberMove))
;2614:			{
line 2615
;2615:				WP_SaberBlockNonRandom(otherOwner, tr.endpos, qfalse);
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_SaberBlockNonRandom
CALLV
pop
line 2616
;2616:			}
line 2617
;2617:		}
ADDRGP4 $1510
JUMPV
LABELV $1509
line 2620
;2618:		else 
;2619:#endif
;2620:		if (!didDefense && dmg > SABER_NONATTACK_DAMAGE && !otherUnblockable) //if not more than idle damage, don't even bother blocking.
ADDRLP4 1560
CNSTI4 0
ASGNI4
ADDRLP4 1192
INDIRI4
ADDRLP4 1560
INDIRI4
NEI4 $1515
ADDRLP4 1136
INDIRI4
CNSTI4 1
LEI4 $1515
ADDRLP4 1168
INDIRI4
ADDRLP4 1560
INDIRI4
NEI4 $1515
line 2621
;2621:		{ //block
line 2622
;2622:			if (!PM_SaberInParry(otherOwner->client->ps.saberMove) &&
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1564
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1564
INDIRI4
CNSTI4 0
NEI4 $1517
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1568
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1568
INDIRI4
CNSTI4 0
NEI4 $1517
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1572
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1572
INDIRI4
CNSTI4 0
NEI4 $1517
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1576
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1576
INDIRI4
CNSTI4 0
NEI4 $1517
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1580
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1580
INDIRI4
CNSTI4 0
NEI4 $1517
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1584
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1584
INDIRI4
CNSTI4 0
NEI4 $1517
line 2628
;2623:				!PM_SaberInBrokenParry(otherOwner->client->ps.saberMove) &&
;2624:				!BG_SaberInSpecial(otherOwner->client->ps.saberMove) &&
;2625:				!PM_SaberInBounce(otherOwner->client->ps.saberMove) &&
;2626:				!PM_SaberInDeflect(otherOwner->client->ps.saberMove) &&
;2627:				!PM_SaberInReflect(otherOwner->client->ps.saberMove))
;2628:			{
line 2629
;2629:				qboolean crushTheParry = qfalse;
ADDRLP4 1588
CNSTI4 0
ASGNI4
line 2631
;2630:
;2631:				if (unblockable)
ADDRLP4 1160
INDIRI4
CNSTI4 0
EQI4 $1519
line 2632
;2632:				{ //It's unblockable. So send us into a broken parry immediately.
line 2633
;2633:					crushTheParry = qtrue;
ADDRLP4 1588
CNSTI4 1
ASGNI4
line 2634
;2634:				}
LABELV $1519
line 2636
;2635:
;2636:				if (!SaberAttacking(otherOwner))
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1592
ADDRGP4 SaberAttacking
CALLI4
ASGNI4
ADDRLP4 1592
INDIRI4
CNSTI4 0
NEI4 $1521
line 2637
;2637:				{
line 2638
;2638:					WP_SaberBlockNonRandom(otherOwner, tr.endpos, qfalse);
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_SaberBlockNonRandom
CALLV
pop
line 2639
;2639:				}
ADDRGP4 $1522
JUMPV
LABELV $1521
line 2640
;2640:				else if (self->client->ps.fd.saberAnimLevel > otherOwner->client->ps.fd.saberAnimLevel ||
ADDRLP4 1596
CNSTI4 408
ASGNI4
ADDRLP4 1600
CNSTI4 1228
ASGNI4
ADDRLP4 1604
ADDRFP4 0
INDIRP4
ADDRLP4 1596
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1600
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1608
ADDRLP4 1132
INDIRP4
ADDRLP4 1596
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1600
INDIRI4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1604
INDIRI4
ADDRLP4 1608
INDIRI4
GTI4 $1526
ADDRLP4 1604
INDIRI4
ADDRLP4 1608
INDIRI4
NEI4 $1524
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1612
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1612
INDIRI4
CNSTI4 2
GTI4 $1524
LABELV $1526
line 2642
;2641:					(self->client->ps.fd.saberAnimLevel == otherOwner->client->ps.fd.saberAnimLevel && Q_irand(1, 10, qfalse, 5) <= 2))
;2642:				{ //they are attacking, and we managed to make them break
line 2644
;2643:					//Give them a parry, so we can later break it.
;2644:					WP_SaberBlockNonRandom(otherOwner, tr.endpos, qfalse);
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_SaberBlockNonRandom
CALLV
pop
line 2645
;2645:					crushTheParry = qtrue;
ADDRLP4 1588
CNSTI4 1
ASGNI4
line 2647
;2646:
;2647:					if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1525
line 2648
;2648:					{
line 2649
;2649:						Com_Printf("Client %i forced client %i into a broken parry with a stronger attack\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1531
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2650
;2650:					}
line 2651
;2651:				}
ADDRGP4 $1525
JUMPV
LABELV $1524
line 2653
;2652:				else
;2653:				{ //They are attacking, so are we, and obviously they have an attack level higher than or equal to ours
line 2654
;2654:					if (self->client->ps.fd.saberAnimLevel == otherOwner->client->ps.fd.saberAnimLevel)
ADDRLP4 1616
CNSTI4 408
ASGNI4
ADDRLP4 1620
CNSTI4 1228
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1616
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1620
INDIRI4
ADDP4
INDIRI4
ADDRLP4 1132
INDIRP4
ADDRLP4 1616
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1620
INDIRI4
ADDP4
INDIRI4
NEI4 $1532
line 2655
;2655:					{ //equal level, try to bounce off each other's sabers
line 2656
;2656:						if (!didOffense &&
ADDRLP4 1184
INDIRI4
CNSTI4 0
NEI4 $1534
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1624
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1624
INDIRI4
CNSTI4 0
NEI4 $1534
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1628
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1628
INDIRI4
CNSTI4 0
NEI4 $1534
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1632
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1632
INDIRI4
CNSTI4 0
NEI4 $1534
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1636
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1636
INDIRI4
CNSTI4 0
NEI4 $1534
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1640
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1640
INDIRI4
CNSTI4 0
NEI4 $1534
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1644
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1648
CNSTI4 0
ASGNI4
ADDRLP4 1644
INDIRI4
ADDRLP4 1648
INDIRI4
NEI4 $1534
ADDRLP4 1160
INDIRI4
ADDRLP4 1648
INDIRI4
NEI4 $1534
line 2664
;2657:							!PM_SaberInParry(self->client->ps.saberMove) &&
;2658:							!PM_SaberInBrokenParry(self->client->ps.saberMove) &&
;2659:							!BG_SaberInSpecial(self->client->ps.saberMove) &&
;2660:							!PM_SaberInBounce(self->client->ps.saberMove) &&
;2661:							!PM_SaberInDeflect(self->client->ps.saberMove) &&
;2662:							!PM_SaberInReflect(self->client->ps.saberMove) &&
;2663:							!unblockable)
;2664:						{
line 2665
;2665:							self->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 2666
;2666:							didOffense = qtrue;
ADDRLP4 1184
CNSTI4 1
ASGNI4
line 2667
;2667:						}
LABELV $1534
line 2668
;2668:						if (!didDefense &&
ADDRLP4 1192
INDIRI4
CNSTI4 0
NEI4 $1536
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1652
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1652
INDIRI4
CNSTI4 0
NEI4 $1536
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1656
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 1656
INDIRI4
CNSTI4 0
NEI4 $1536
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1660
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 1660
INDIRI4
CNSTI4 0
NEI4 $1536
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1664
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 1664
INDIRI4
CNSTI4 0
NEI4 $1536
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1668
ADDRGP4 PM_SaberInDeflect
CALLI4
ASGNI4
ADDRLP4 1668
INDIRI4
CNSTI4 0
NEI4 $1536
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1672
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 1676
CNSTI4 0
ASGNI4
ADDRLP4 1672
INDIRI4
ADDRLP4 1676
INDIRI4
NEI4 $1536
ADDRLP4 1160
INDIRI4
ADDRLP4 1676
INDIRI4
NEI4 $1536
line 2676
;2669:							!PM_SaberInParry(otherOwner->client->ps.saberMove) &&
;2670:							!PM_SaberInBrokenParry(otherOwner->client->ps.saberMove) &&
;2671:							!BG_SaberInSpecial(otherOwner->client->ps.saberMove) &&
;2672:							!PM_SaberInBounce(otherOwner->client->ps.saberMove) &&
;2673:							!PM_SaberInDeflect(otherOwner->client->ps.saberMove) &&
;2674:							!PM_SaberInReflect(otherOwner->client->ps.saberMove) &&
;2675:							!unblockable)
;2676:						{
line 2677
;2677:							otherOwner->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 2678
;2678:						}
LABELV $1536
line 2679
;2679:						if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1533
line 2680
;2680:						{
line 2681
;2681:							Com_Printf("Equal attack level bounce/deflection for clients %i and %i\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1541
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2682
;2682:						}
line 2683
;2683:					}
ADDRGP4 $1533
JUMPV
LABELV $1532
line 2684
;2684:					else if ((nowTime - otherOwner->client->lastSaberStorageTime) < 500 && !unblockable) //make sure the stored saber data is updated
ADDRLP4 1156
INDIRI4
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43792
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $1542
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $1542
line 2685
;2685:					{ //They are higher, this means they can actually smash us into a broken parry
line 2687
;2686:						//Using reflected anims instead now
;2687:						self->client->ps.saberMove = BG_BrokenParryForAttack(self->client->ps.saberMove);
ADDRLP4 1624
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ASGNP4
ADDRLP4 1624
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1628
ADDRGP4 BG_BrokenParryForAttack
CALLI4
ASGNI4
ADDRLP4 1624
INDIRP4
ADDRLP4 1628
INDIRI4
ASGNI4
line 2688
;2688:						self->client->ps.saberBlocked = BLOCKED_PARRY_BROKEN;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 2690
;2689:
;2690:						if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1544
line 2691
;2691:						{
line 2692
;2692:							Com_Printf("Client %i hit client %i's stronger attack, was forced into a broken parry\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1547
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2693
;2693:						}
LABELV $1544
line 2695
;2694:
;2695:						didOffense = qtrue;
ADDRLP4 1184
CNSTI4 1
ASGNI4
line 2696
;2696:					}
LABELV $1542
LABELV $1533
line 2697
;2697:				}
LABELV $1525
LABELV $1522
line 2699
;2698:
;2699:				if (crushTheParry && PM_SaberInParry(G_GetParryForBlock(otherOwner->client->ps.saberBlocked)))
ADDRLP4 1588
INDIRI4
CNSTI4 0
EQI4 $1548
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 1616
ADDRGP4 G_GetParryForBlock
CALLI4
ASGNI4
ADDRLP4 1616
INDIRI4
ARGI4
ADDRLP4 1620
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1620
INDIRI4
CNSTI4 0
EQI4 $1548
line 2700
;2700:				{ //This means that the attack actually hit our saber, and we went to block it.
line 2702
;2701:				  //But, one of the above cases says we actually can't. So we will be smashed into a broken parry instead.
;2702:					otherOwner->client->ps.saberMove = BG_BrokenParryForParry( G_GetParryForBlock(otherOwner->client->ps.saberBlocked), otherOwner->client->sess.raceMode);
ADDRLP4 1624
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1624
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 1628
ADDRGP4 G_GetParryForBlock
CALLI4
ASGNI4
ADDRLP4 1628
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ARGI4
ADDRLP4 1632
ADDRGP4 BG_BrokenParryForParry
CALLI4
ASGNI4
ADDRLP4 1624
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 1632
INDIRI4
ASGNI4
line 2703
;2703:					otherOwner->client->ps.saberBlocked = BLOCKED_PARRY_BROKEN;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 2705
;2704:
;2705:					if (g_saberDebugPrint.integer)
ADDRGP4 g_saberDebugPrint+12
INDIRI4
CNSTI4 0
EQI4 $1549
line 2706
;2706:					{
line 2707
;2707:						Com_Printf("Client %i broke through %i's parry with a special or stronger attack\n", self->s.number, otherOwner->s.number);
ADDRGP4 $1553
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1132
INDIRP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2708
;2708:					}
line 2709
;2709:				}
ADDRGP4 $1549
JUMPV
LABELV $1548
line 2710
;2710:				else if (PM_SaberInParry(G_GetParryForBlock(otherOwner->client->ps.saberBlocked)) && !didOffense && tryDeflectAgain)
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 1624
ADDRGP4 G_GetParryForBlock
CALLI4
ASGNI4
ADDRLP4 1624
INDIRI4
ARGI4
ADDRLP4 1628
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 1632
CNSTI4 0
ASGNI4
ADDRLP4 1628
INDIRI4
ADDRLP4 1632
INDIRI4
EQI4 $1554
ADDRLP4 1184
INDIRI4
ADDRLP4 1632
INDIRI4
NEI4 $1554
ADDRLP4 1188
INDIRI4
ADDRLP4 1632
INDIRI4
EQI4 $1554
line 2711
;2711:				{ //We want to try deflecting again because the other is in the parry and we haven't made any new moves
line 2712
;2712:					int preMove = otherOwner->client->ps.saberMove;
ADDRLP4 1636
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 2714
;2713:
;2714:					otherOwner->client->ps.saberMove = G_GetParryForBlock(otherOwner->client->ps.saberBlocked);
ADDRLP4 1640
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1640
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRLP4 1644
ADDRGP4 G_GetParryForBlock
CALLI4
ASGNI4
ADDRLP4 1640
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 1644
INDIRI4
ASGNI4
line 2715
;2715:					WP_GetSaberDeflectionAngle(self, otherOwner, tr.fraction);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRGP4 WP_GetSaberDeflectionAngle
CALLI4
pop
line 2716
;2716:					otherOwner->client->ps.saberMove = preMove;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ADDRLP4 1636
INDIRI4
ASGNI4
line 2717
;2717:				}
LABELV $1554
LABELV $1549
line 2718
;2718:			}
LABELV $1517
line 2719
;2719:		}
LABELV $1515
LABELV $1510
line 2721
;2720:
;2721:		self->client->ps.saberAttackWound = nowTime + g_saberDmgDelay_Wound.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRLP4 1156
INDIRI4
ADDRGP4 g_saberDmgDelay_Wound+12
INDIRI4
ADDI4
ASGNI4
line 2722
;2722:	}
LABELV $1403
LABELV $1293
line 2724
;2723:
;2724:	return didHit;
ADDRLP4 1164
INDIRI4
RETI4
LABELV $1138
endproc CheckSaberDamage 1680 32
export CheckThrownSaberDamaged
proc CheckThrownSaberDamaged 1292 32
line 2737
;2725:}
;2726:
;2727:#define MIN_SABER_SLICE_DISTANCE 50
;2728:
;2729:#define MIN_SABER_SLICE_RETURN_DISTANCE 30
;2730:
;2731:#define SABER_THROWN_HIT_DAMAGE 30
;2732:#define SABER_THROWN_RETURN_HIT_DAMAGE 5
;2733:
;2734:void thrownSaberTouch (gentity_t *saberent, gentity_t *other, trace_t *trace);
;2735:
;2736:qboolean CheckThrownSaberDamaged(gentity_t *saberent, gentity_t *saberOwner, gentity_t *ent, int dist, int returning)
;2737:{
line 2741
;2738:	vec3_t vecsub;
;2739:	float veclen;
;2740:	gentity_t *te;
;2741:	int nowTime = LEVELTIME(saberOwner->client);
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
EQU4 $1563
ADDRLP4 32
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1563
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1565
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
ADDRGP4 $1566
JUMPV
LABELV $1565
ADDRLP4 28
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1566
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $1564
JUMPV
LABELV $1563
ADDRLP4 24
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1564
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 2743
;2742:
;2743:	if (saberOwner && saberOwner->client && saberOwner->client->ps.saberAttackWound > nowTime)
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
EQU4 $1567
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
ADDRLP4 40
INDIRU4
EQU4 $1567
ADDRLP4 44
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $1567
line 2744
;2744:	{
line 2745
;2745:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1558
JUMPV
LABELV $1567
line 2748
;2746:	}
;2747:
;2748:	if (ent->client && ent->inuse && (saberOwner->client->sess.raceMode || ent->client->sess.raceMode || ent->client->sess.mode != saberOwner->client->sess.mode)) {
ADDRLP4 48
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 408
ASGNI4
ADDRLP4 56
ADDRLP4 48
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1569
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $1569
ADDRLP4 64
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 43488
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $1572
ADDRLP4 56
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $1572
ADDRLP4 72
CNSTI4 43484
ASGNI4
ADDRLP4 56
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
INDIRI4
EQI4 $1569
LABELV $1572
line 2749
;2749:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1558
JUMPV
LABELV $1569
line 2752
;2750:	}
;2751:
;2752:	if (ent && ent->client && ent->inuse && saberOwner && ent->s.number != saberOwner->s.number &&
ADDRLP4 76
ADDRFP4 8
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
EQU4 $1573
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
EQU4 $1573
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $1573
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CVPU4 4
ADDRLP4 80
INDIRU4
EQU4 $1573
ADDRLP4 76
INDIRP4
INDIRI4
ADDRLP4 92
INDIRP4
INDIRI4
EQI4 $1573
ADDRLP4 76
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
LEI4 $1573
ADDRLP4 76
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $1573
ADDRLP4 84
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 96
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRLP4 96
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $1573
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1573
ADDRLP4 104
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $1573
line 2757
;2753:		ent->health > 0 && ent->takedamage &&
;2754:		trap_InPVS(ent->client->ps.origin, saberent->r.currentOrigin) &&
;2755:		ent->client->sess.sessionTeam != TEAM_SPECTATOR &&
;2756:		ent->client->pers.connected)
;2757:	{ //hit a client
line 2758
;2758:		if (ent->inuse && ent->client &&
ADDRLP4 108
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 108
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $1575
ADDRLP4 116
ADDRLP4 108
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1575
ADDRLP4 116
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $1575
ADDRLP4 116
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $1575
line 2761
;2759:			ent->client->ps.duelInProgress &&
;2760:			ent->client->ps.duelIndex != saberOwner->s.number)
;2761:		{
line 2762
;2762:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1558
JUMPV
LABELV $1575
line 2765
;2763:		}
;2764:
;2765:		if (ent->inuse && ent->client &&
ADDRLP4 120
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 124
CNSTI4 0
ASGNI4
ADDRLP4 120
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $1577
ADDRLP4 128
CNSTI4 408
ASGNI4
ADDRLP4 132
CNSTU4 0
ASGNU4
ADDRLP4 120
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 132
INDIRU4
EQU4 $1577
ADDRLP4 136
ADDRFP4 4
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 136
INDIRP4
CVPU4 4
ADDRLP4 132
INDIRU4
EQU4 $1577
ADDRLP4 136
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $1577
ADDRLP4 136
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 120
INDIRP4
INDIRI4
EQI4 $1577
line 2769
;2766:			saberOwner->client &&
;2767:			saberOwner->client->ps.duelInProgress &&
;2768:			saberOwner->client->ps.duelIndex != ent->s.number)
;2769:		{
line 2770
;2770:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1558
JUMPV
LABELV $1577
line 2773
;2771:		}
;2772:
;2773:		VectorSubtract(saberent->r.currentOrigin, ent->client->ps.origin, vecsub);
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 140
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 144
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 140
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 144
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2774
;2774:		veclen = VectorLength(vecsub);
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 148
INDIRF4
ASGNF4
line 2776
;2775:
;2776:		if (veclen < dist)
ADDRLP4 16
INDIRF4
ADDRFP4 12
INDIRI4
CVIF4 4
GEF4 $1574
line 2777
;2777:		{ //within range
line 2780
;2778:			trace_t tr;
;2779:
;2780:			JP_Trace(&tr, saberent->r.currentOrigin, NULL, NULL, ent->client->ps.origin, saberent->s.number, MASK_SHOT);
ADDRLP4 152
ARGP4
ADDRLP4 1232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1232
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1236
CNSTP4 0
ASGNP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1232
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2782
;2781:
;2782:			if (tr.fraction == 1 || tr.entityNum == ent->s.number)
ADDRLP4 152+8
INDIRF4
CNSTF4 1065353216
EQF4 $1587
ADDRLP4 152+52
INDIRI4
ADDRFP4 8
INDIRP4
INDIRI4
NEI4 $1574
LABELV $1587
line 2783
;2783:			{ //Slice them
line 2784
;2784:				if (saberOwner->client && !saberOwner->client->ps.isJediMaster && WP_SaberCanBlock(ent, tr.endpos, 0, MOD_SABER, qfalse, 8))
ADDRLP4 1240
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1240
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1588
ADDRLP4 1244
CNSTI4 0
ASGNI4
ADDRLP4 1240
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 1244
INDIRI4
NEI4 $1588
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 152+12
ARGP4
ADDRLP4 1244
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1244
INDIRI4
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 1248
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1248
INDIRI4
CNSTI4 0
EQI4 $1588
line 2785
;2785:				{ //they blocked it
line 2786
;2786:					if ( jk2gameplay != VERSION_1_02 ) WP_SaberBlockNonRandom(ent, tr.endpos, qfalse);
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1591
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 152+12
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 WP_SaberBlockNonRandom
CALLV
pop
LABELV $1591
line 2788
;2787:
;2788:					te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 152+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1252
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 1252
INDIRP4
ASGNP4
line 2789
;2789:					VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 20
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 152+12
INDIRB
ASGNB 12
line 2790
;2790:					VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 152+24
INDIRB
ASGNB 12
line 2791
;2791:					if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1256
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 1260
CNSTF4 0
ASGNF4
ADDRLP4 1256
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1260
INDIRF4
NEF4 $1597
ADDRLP4 1256
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1260
INDIRF4
NEF4 $1597
ADDRLP4 1256
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1260
INDIRF4
NEF4 $1597
line 2792
;2792:					{
line 2793
;2793:						te->s.angles[1] = 1;
ADDRLP4 20
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 2794
;2794:					}
LABELV $1597
line 2795
;2795:					te->s.eventParm = 1;
ADDRLP4 20
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 2797
;2796:
;2797:					if (!returning)
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $1599
line 2798
;2798:					{ //return to owner if blocked
line 2799
;2799:						thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 1264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1264
INDIRP4
ARGP4
ADDRLP4 1264
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 2800
;2800:					}
LABELV $1599
line 2802
;2801:
;2802:					saberOwner->client->ps.saberAttackWound = nowTime + 500;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2803
;2803:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1558
JUMPV
LABELV $1588
line 2806
;2804:				}
;2805:				else
;2806:				{ //a good hit
line 2809
;2807:					vec3_t dir;
;2808:
;2809:					VectorSubtract(tr.endpos, saberent->r.currentOrigin, dir);
ADDRLP4 1264
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1252
ADDRLP4 152+12
INDIRF4
ADDRLP4 1264
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1252+4
ADDRLP4 152+12+4
INDIRF4
ADDRLP4 1264
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1252+8
ADDRLP4 152+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2810
;2810:					VectorNormalize(dir);
ADDRLP4 1252
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2812
;2811:
;2812:					if (!dir[0] && !dir[1] && !dir[2])
ADDRLP4 1268
CNSTF4 0
ASGNF4
ADDRLP4 1252
INDIRF4
ADDRLP4 1268
INDIRF4
NEF4 $1608
ADDRLP4 1252+4
INDIRF4
ADDRLP4 1268
INDIRF4
NEF4 $1608
ADDRLP4 1252+8
INDIRF4
ADDRLP4 1268
INDIRF4
NEF4 $1608
line 2813
;2813:					{
line 2814
;2814:						dir[1] = 1;
ADDRLP4 1252+4
CNSTF4 1065353216
ASGNF4
line 2815
;2815:					}
LABELV $1608
line 2817
;2816:
;2817:					if (saberOwner->client && saberOwner->client->ps.isJediMaster)
ADDRLP4 1272
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1272
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1613
ADDRLP4 1272
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1613
line 2818
;2818:					{ //2x damage for the Jedi Master
line 2819
;2819:						G_Damage(ent, saberOwner, saberOwner, dir, tr.endpos, saberent->damage*2, 0, MOD_SABER);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1276
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1276
INDIRP4
ARGP4
ADDRLP4 1276
INDIRP4
ARGP4
ADDRLP4 1252
ARGP4
ADDRLP4 152+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2820
;2820:					}
ADDRGP4 $1614
JUMPV
LABELV $1613
line 2822
;2821:					else
;2822:					{
line 2823
;2823:						G_Damage(ent, saberOwner, saberOwner, dir, tr.endpos, saberent->damage, 0, MOD_SABER);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1276
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1276
INDIRP4
ARGP4
ADDRLP4 1276
INDIRP4
ARGP4
ADDRLP4 1252
ARGP4
ADDRLP4 152+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2824
;2824:					}
LABELV $1614
line 2826
;2825:
;2826:					te = G_TempEntity( tr.endpos, EV_SABER_HIT );
ADDRLP4 152+12
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 1276
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 1276
INDIRP4
ASGNP4
line 2827
;2827:					VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 20
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 152+12
INDIRB
ASGNB 12
line 2828
;2828:					VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 152+24
INDIRB
ASGNB 12
line 2829
;2829:					if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1280
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 1284
CNSTF4 0
ASGNF4
ADDRLP4 1280
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1284
INDIRF4
NEF4 $1620
ADDRLP4 1280
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1284
INDIRF4
NEF4 $1620
ADDRLP4 1280
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1284
INDIRF4
NEF4 $1620
line 2830
;2830:					{
line 2831
;2831:						te->s.angles[1] = 1;
ADDRLP4 20
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 2832
;2832:					}
LABELV $1620
line 2834
;2833:
;2834:					te->s.eventParm = 1;
ADDRLP4 20
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 2836
;2835:
;2836:					if (!returning)
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $1622
line 2837
;2837:					{ //return to owner if blocked
line 2838
;2838:						thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 1288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1288
INDIRP4
ARGP4
ADDRLP4 1288
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 2839
;2839:					}
LABELV $1622
line 2840
;2840:				}
line 2842
;2841:
;2842:				if ( saberOwner->client ) saberOwner->client->ps.saberAttackWound = nowTime + 500;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1574
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2843
;2843:			}
line 2844
;2844:		}
line 2845
;2845:	}
ADDRGP4 $1574
JUMPV
LABELV $1573
line 2846
;2846:	else if (ent && !ent->client && ent->inuse && ent->takedamage && ent->health > 0 && saberOwner && ent->s.number != saberOwner->s.number &&
ADDRLP4 108
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 112
CNSTU4 0
ASGNU4
ADDRLP4 108
INDIRP4
CVPU4 4
ADDRLP4 112
INDIRU4
EQU4 $1626
ADDRLP4 108
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 112
INDIRU4
NEU4 $1626
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRLP4 108
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 116
INDIRI4
EQI4 $1626
ADDRLP4 108
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 116
INDIRI4
EQI4 $1626
ADDRLP4 108
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 116
INDIRI4
LEI4 $1626
ADDRLP4 120
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CVPU4 4
ADDRLP4 112
INDIRU4
EQU4 $1626
ADDRLP4 124
ADDRLP4 108
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 124
INDIRI4
ADDRLP4 120
INDIRP4
INDIRI4
EQI4 $1626
ADDRLP4 128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
INDIRI4
ADDRLP4 128
INDIRP4
INDIRI4
EQI4 $1626
ADDRLP4 132
CNSTI4 368
ASGNI4
ADDRLP4 108
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
ARGP4
ADDRLP4 128
INDIRP4
ADDRLP4 132
INDIRI4
ADDP4
ARGP4
ADDRLP4 136
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $1626
line 2848
;2847:		ent->s.number != saberent->s.number && trap_InPVS(ent->r.currentOrigin, saberent->r.currentOrigin))
;2848:	{ //hit a non-client
line 2849
;2849:		VectorSubtract(saberent->r.currentOrigin, ent->r.currentOrigin, vecsub);
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
CNSTI4 368
ASGNI4
ADDRLP4 148
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 140
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
ADDRLP4 148
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 152
CNSTI4 372
ASGNI4
ADDRLP4 0+4
ADDRLP4 140
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRF4
ADDRLP4 148
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 156
CNSTI4 376
ASGNI4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2850
;2850:		veclen = VectorLength(vecsub);
ADDRLP4 0
ARGP4
ADDRLP4 160
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 160
INDIRF4
ASGNF4
line 2852
;2851:
;2852:		if (veclen < dist)
ADDRLP4 16
INDIRF4
ADDRFP4 12
INDIRI4
CVIF4 4
GEF4 $1630
line 2853
;2853:		{
line 2856
;2854:			trace_t tr;
;2855:
;2856:			JP_Trace(&tr, saberent->r.currentOrigin, NULL, NULL, ent->r.currentOrigin, saberent->s.number, MASK_SHOT);
ADDRLP4 164
ARGP4
ADDRLP4 1244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1248
CNSTI4 368
ASGNI4
ADDRLP4 1244
INDIRP4
ADDRLP4 1248
INDIRI4
ADDP4
ARGP4
ADDRLP4 1252
CNSTP4 0
ASGNP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 1248
INDIRI4
ADDP4
ARGP4
ADDRLP4 1244
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 2858
;2857:
;2858:			if (tr.fraction == 1 || tr.entityNum == ent->s.number)
ADDRLP4 164+8
INDIRF4
CNSTF4 1065353216
EQF4 $1636
ADDRLP4 164+52
INDIRI4
ADDRFP4 8
INDIRP4
INDIRI4
NEI4 $1632
LABELV $1636
line 2859
;2859:			{
line 2862
;2860:				vec3_t dir;
;2861:
;2862:				VectorSubtract(tr.endpos, saberent->r.currentOrigin, dir);
ADDRLP4 1268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1256
ADDRLP4 164+12
INDIRF4
ADDRLP4 1268
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1256+4
ADDRLP4 164+12+4
INDIRF4
ADDRLP4 1268
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1256+8
ADDRLP4 164+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2863
;2863:				VectorNormalize(dir);
ADDRLP4 1256
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2865
;2864:
;2865:				if (ent->s.eType == ET_GRAPPLE)
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
NEI4 $1644
line 2866
;2866:				{ //an animent
line 2867
;2867:					G_Damage(ent, saberOwner, saberOwner, dir, tr.endpos, 40, 0, MOD_SABER);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1272
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1272
INDIRP4
ARGP4
ADDRLP4 1272
INDIRP4
ARGP4
ADDRLP4 1256
ARGP4
ADDRLP4 164+12
ARGP4
CNSTI4 40
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2868
;2868:				}
ADDRGP4 $1645
JUMPV
LABELV $1644
line 2870
;2869:				else
;2870:				{
line 2871
;2871:					G_Damage(ent, saberOwner, saberOwner, dir, tr.endpos, 5, 0, MOD_SABER);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1272
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1272
INDIRP4
ARGP4
ADDRLP4 1272
INDIRP4
ARGP4
ADDRLP4 1256
ARGP4
ADDRLP4 164+12
ARGP4
CNSTI4 5
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2872
;2872:				}
LABELV $1645
line 2874
;2873:
;2874:				te = G_TempEntity( tr.endpos, EV_SABER_HIT );
ADDRLP4 164+12
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 1272
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 1272
INDIRP4
ASGNP4
line 2875
;2875:				VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 20
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 164+12
INDIRB
ASGNB 12
line 2876
;2876:				VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 20
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 164+24
INDIRB
ASGNB 12
line 2877
;2877:				if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1276
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 1280
CNSTF4 0
ASGNF4
ADDRLP4 1276
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1280
INDIRF4
NEF4 $1651
ADDRLP4 1276
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1280
INDIRF4
NEF4 $1651
ADDRLP4 1276
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1280
INDIRF4
NEF4 $1651
line 2878
;2878:				{
line 2879
;2879:					te->s.angles[1] = 1;
ADDRLP4 20
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 2880
;2880:				}
LABELV $1651
line 2882
;2881:
;2882:				te->s.eventParm = 1;
ADDRLP4 20
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 2884
;2883:
;2884:				if (!returning)
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $1653
line 2885
;2885:				{ //return to owner if blocked
line 2886
;2886:					thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 1284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1284
INDIRP4
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 2887
;2887:				}
LABELV $1653
line 2889
;2888:
;2889:				if ( saberOwner && saberOwner->client ) saberOwner->client->ps.saberAttackWound = nowTime + 500;
ADDRLP4 1284
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1288
CNSTU4 0
ASGNU4
ADDRLP4 1284
INDIRP4
CVPU4 4
ADDRLP4 1288
INDIRU4
EQU4 $1655
ADDRLP4 1284
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1288
INDIRU4
EQU4 $1655
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
LABELV $1655
line 2890
;2890:			}
LABELV $1632
line 2891
;2891:		}
LABELV $1630
line 2892
;2892:	}
LABELV $1626
LABELV $1574
line 2894
;2893:
;2894:	return qtrue;
CNSTI4 1
RETI4
LABELV $1558
endproc CheckThrownSaberDamaged 1292 32
export saberCheckRadiusDamage
proc saberCheckRadiusDamage 44 20
line 2898
;2895:}
;2896:
;2897:void saberCheckRadiusDamage(gentity_t *saberent, int returning)
;2898:{ //we're going to cheat and damage players within the saber's radius, just for the sake of doing things more "efficiently" (and because the saber entity has no server g2 instance)
line 2899
;2899:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2900
;2900:	int dist = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2902
;2901:	gentity_t *ent;
;2902:	gentity_t *saberOwner = &g_entities[saberent->r.ownerNum];
ADDRLP4 8
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
line 2903
;2903:	int nowTime = LEVELTIME(saberOwner->client);
ADDRLP4 28
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1662
ADDRLP4 28
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1662
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1664
ADDRLP4 24
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1665
JUMPV
LABELV $1664
ADDRLP4 24
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1665
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
ADDRGP4 $1663
JUMPV
LABELV $1662
ADDRLP4 20
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1663
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 2905
;2904:
;2905:	if (returning && returning != 2)
ADDRLP4 32
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $1666
ADDRLP4 32
INDIRI4
CNSTI4 2
EQI4 $1666
line 2906
;2906:	{
line 2907
;2907:		dist = MIN_SABER_SLICE_RETURN_DISTANCE;
ADDRLP4 12
CNSTI4 30
ASGNI4
line 2908
;2908:	}
ADDRGP4 $1667
JUMPV
LABELV $1666
line 2910
;2909:	else
;2910:	{
line 2911
;2911:		dist = MIN_SABER_SLICE_DISTANCE;
ADDRLP4 12
CNSTI4 50
ASGNI4
line 2912
;2912:	}
LABELV $1667
line 2914
;2913:
;2914:	if (!saberOwner || !saberOwner->client)
ADDRLP4 40
CNSTU4 0
ASGNU4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
EQU4 $1670
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 40
INDIRU4
NEU4 $1668
LABELV $1670
line 2915
;2915:	{
line 2916
;2916:		return;
ADDRGP4 $1657
JUMPV
LABELV $1668
line 2919
;2917:	}
;2918:
;2919:	if (saberOwner->client->ps.saberAttackWound > nowTime)
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $1674
line 2920
;2920:	{
line 2921
;2921:		return;
ADDRGP4 $1657
JUMPV
LABELV $1673
line 2925
;2922:	}
;2923:
;2924:	while (i < MAX_GENTITIES)
;2925:	{
line 2926
;2926:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2928
;2927:
;2928:		CheckThrownSaberDamaged(saberent, saberOwner, ent, dist, returning);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CheckThrownSaberDamaged
CALLI4
pop
line 2930
;2929:
;2930:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2931
;2931:	}
LABELV $1674
line 2924
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $1673
line 2932
;2932:}
LABELV $1657
endproc saberCheckRadiusDamage 44 20
export saberMoveBack
proc saberMoveBack 16 12
line 2937
;2933:
;2934://#define THROWN_SABER_COMP
;2935:
;2936:void saberMoveBack( gentity_t *ent, qboolean goingBack ) 
;2937:{
line 2940
;2938:	vec3_t		origin;
;2939:
;2940:	ent->s.pos.trType = TR_LINEAR;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 2943
;2941:
;2942:	// get current position
;2943:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2945
;2944:	//Get current angles?
;2945:	BG_EvaluateTrajectory( &ent->s.apos, level.time, ent->r.currentAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 380
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 2990
;2946:
;2947:	//compensation test code..
;2948:#ifdef THROWN_SABER_COMP
;2949:	if (!goingBack)
;2950:	{ //acts as a fallback in case touch code fails, keeps saber from going through things between predictions
;2951:		float originalLength = 0;
;2952:		int iCompensationLength = 32;
;2953:		trace_t tr;
;2954:		vec3_t mins, maxs;
;2955:		vec3_t calcComp, compensatedOrigin;
;2956:		vec3_t oldOrg;
;2957:
;2958:		VectorCopy( ent->r.currentOrigin, oldOrg );
;2959:
;2960:		VectorSet( mins, -24.0f, -24.0f, -8.0f );
;2961:		VectorSet( maxs, 24.0f, 24.0f, 8.0f );
;2962:
;2963:		VectorSubtract(origin, oldOrg, calcComp);
;2964:		originalLength = VectorLength(calcComp);
;2965:
;2966:		VectorNormalize(calcComp);
;2967:
;2968:		compensatedOrigin[0] = oldOrg[0] + calcComp[0]*(originalLength+iCompensationLength);		
;2969:		compensatedOrigin[1] = oldOrg[1] + calcComp[1]*(originalLength+iCompensationLength);
;2970:		compensatedOrigin[2] = oldOrg[2] + calcComp[2]*(originalLength+iCompensationLength);
;2971:
;2972:		JP_Trace(&tr, oldOrg, mins, maxs, compensatedOrigin, ent->r.ownerNum, MASK_PLAYERSOLID);
;2973:
;2974:		if ((tr.fraction != 1 || tr.startsolid || tr.allsolid) && tr.entityNum != ent->r.ownerNum)
;2975:		{
;2976:			VectorClear(ent->s.pos.trDelta);
;2977:
;2978:			//Unfortunately doing this would defeat the purpose of the compensation. We will have to settle for a jerk on the client.
;2979:			//VectorCopy( origin, ent->r.currentOrigin );
;2980:
;2981:			CheckThrownSaberDamaged(ent, &g_entities[ent->r.ownerNum], &g_entities[tr.entityNum], 256, 0);
;2982:
;2983:			tr.startsolid = 0;
;2984:			thrownSaberTouch(ent, &g_entities[tr.entityNum], &tr);
;2985:			return;
;2986:		}
;2987:	}
;2988:#endif
;2989:
;2990:	VectorCopy( origin, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 2991
;2991:}
LABELV $1676
endproc saberMoveBack 16 12
export SaberBounceSound
proc SaberBounceSound 4 0
line 2994
;2992:
;2993:void SaberBounceSound( gentity_t *self, gentity_t *other, trace_t *trace )
;2994:{
line 2995
;2995:	VectorCopy(self->r.currentAngles, self->s.apos.trBase);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
INDIRB
ASGNB 12
line 2996
;2996:	self->s.apos.trBase[PITCH] = 90;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 1119092736
ASGNF4
line 2997
;2997:}
LABELV $1679
endproc SaberBounceSound 4 0
export DeadSaberThink
proc DeadSaberThink 0 4
line 3000
;2998:
;2999:void DeadSaberThink(gentity_t *saberent)
;3000:{
line 3001
;3001:	if (saberent->speed < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1681
line 3002
;3002:	{
line 3003
;3003:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 3004
;3004:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3005
;3005:		return;
ADDRGP4 $1680
JUMPV
LABELV $1681
line 3008
;3006:	}
;3007:
;3008:	G_RunObject(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 3009
;3009:}
LABELV $1680
endproc DeadSaberThink 0 4
export MakeDeadSaber
proc MakeDeadSaber 52 20
line 3012
;3010:
;3011:void MakeDeadSaber(gentity_t *ent)
;3012:{	//spawn a "dead" saber entity here so it looks like the saber fell out of the air.
line 3018
;3013:	//This entity will remove itself after a very short time period.
;3014:	vec3_t startorg;
;3015:	vec3_t startang;
;3016:	gentity_t *saberent;
;3017:	
;3018:	if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $1686
line 3019
;3019:	{ //never spawn a dead saber in JM, because the only saber on the level is really a world object
line 3020
;3020:		G_Sound(ent, CHAN_AUTO, saberOffSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberOffSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 3021
;3021:		return;
ADDRGP4 $1685
JUMPV
LABELV $1686
line 3024
;3022:	}
;3023:
;3024:	saberent = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 3026
;3025:
;3026:	VectorCopy(ent->r.currentOrigin, startorg);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 3027
;3027:	VectorCopy(ent->r.currentAngles, startang);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 380
ADDP4
INDIRB
ASGNB 12
line 3029
;3028:
;3029:	G_SetClassName(saberent, "deadsaber");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $1689
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 3031
;3030:			
;3031:	saberent->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 3032
;3032:	saberent->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 3034
;3033:
;3034:	saberent->clipmask = MASK_PLAYERSOLID;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 273
ASGNI4
line 3035
;3035:	saberent->r.contents = CONTENTS_TRIGGER;//0;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 3037
;3036:
;3037:	VectorSet( saberent->r.mins, -3.0f, -3.0f, -3.0f );
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
line 3038
;3038:	VectorSet( saberent->r.maxs, 3.0f, 3.0f, 3.0f );
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
line 3040
;3039:
;3040:	saberent->touch = SaberBounceSound;
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 SaberBounceSound
ASGNP4
line 3042
;3041:
;3042:	saberent->think = DeadSaberThink;
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 DeadSaberThink
ASGNP4
line 3043
;3043:	saberent->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3045
;3044:
;3045:	VectorCopy(startorg, saberent->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 3046
;3046:	VectorCopy(startang, saberent->s.apos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 3048
;3047:
;3048:	VectorCopy(startorg, saberent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 3049
;3049:	VectorCopy(startang, saberent->s.angles);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 3051
;3050:
;3051:	VectorCopy(startorg, saberent->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 3052
;3052:	VectorCopy(startang, saberent->r.currentAngles);
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 3054
;3053:
;3054:	saberent->s.apos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 5
ASGNI4
line 3055
;3055:	saberent->s.apos.trDelta[0] = Q_irandExpectedIf(gRandomUnlockAdd, 200, 800, qfalse, 500);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 200
ARGI4
CNSTI4 800
ARGI4
CNSTI4 0
ARGI4
CNSTI4 500
ARGI4
ADDRLP4 32
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 32
INDIRI4
CVIF4 4
ASGNF4
line 3056
;3056:	saberent->s.apos.trDelta[1] = Q_irandExpectedIf(gRandomUnlockAdd, 200, 800, qfalse, 500);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 200
ARGI4
CNSTI4 800
ARGI4
CNSTI4 0
ARGI4
CNSTI4 500
ARGI4
ADDRLP4 36
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 36
INDIRI4
CVIF4 4
ASGNF4
line 3057
;3057:	saberent->s.apos.trDelta[2] = Q_irandExpectedIf(gRandomUnlockAdd, 200, 800, qfalse, 500);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 200
ARGI4
CNSTI4 800
ARGI4
CNSTI4 0
ARGI4
CNSTI4 500
ARGI4
ADDRLP4 40
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 40
INDIRI4
CVIF4 4
ASGNF4
line 3058
;3058:	saberent->s.apos.trTime = level.time-50;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 3060
;3059:
;3060:	saberent->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 3061
;3061:	saberent->s.pos.trTime = level.time-50;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 3062
;3062:	saberent->s.eFlags = EF_BOUNCE_HALF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 3063
;3063:	saberent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $1693
ARGP4
ADDRLP4 44
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 3064
;3064:	saberent->s.modelGhoul2 = 1;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 3065
;3065:	saberent->s.g2radius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 20
ASGNI4
line 3067
;3066:
;3067:	saberent->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 3068
;3068:	saberent->s.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 3070
;3069:
;3070:	saberent->speed = level.time + 4000;
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 3072
;3071:
;3072:	saberent->bounceCount = 12;
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 12
ASGNI4
line 3075
;3073:
;3074:	//fall off in the direction the real saber was headed
;3075:	VectorCopy(ent->s.pos.trDelta, saberent->s.pos.trDelta);
ADDRLP4 48
CNSTI4 36
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
line 3077
;3076:
;3077:	saberMoveBack(saberent, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 saberMoveBack
CALLV
pop
line 3078
;3078:	saberent->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 3080
;3079:
;3080:	trap_LinkEntity(saberent);	
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3081
;3081:}
LABELV $1685
endproc MakeDeadSaber 52 20
export saberBackToOwner
proc saberBackToOwner 88 8
line 3084
;3082:
;3083:void saberBackToOwner(gentity_t *saberent)
;3084:{
line 3085
;3085:	gentity_t *saberOwner = &g_entities[saberent->r.ownerNum];
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
line 3088
;3086:	vec3_t dir;
;3087:	float ownerLen;
;3088:	int nowTime = LEVELTIME(saberOwner->client);
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1700
ADDRLP4 32
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1700
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1702
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1703
JUMPV
LABELV $1702
ADDRLP4 28
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1703
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $1701
JUMPV
LABELV $1700
ADDRLP4 24
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1701
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 3090
;3089:
;3090:	if (saberent->r.ownerNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1704
line 3091
;3091:	{
line 3092
;3092:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 3094
;3093:
;3094:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 3095
;3095:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3096
;3096:		return;
ADDRGP4 $1695
JUMPV
LABELV $1704
line 3099
;3097:	}
;3098:
;3099:	if (!g_entities[saberent->r.ownerNum].inuse ||
ADDRLP4 36
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1713
ADDRLP4 36
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1713
ADDRLP4 36
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1707
LABELV $1713
line 3102
;3100:		!g_entities[saberent->r.ownerNum].client ||
;3101:		g_entities[saberent->r.ownerNum].client->sess.sessionTeam == TEAM_SPECTATOR)
;3102:	{
line 3103
;3103:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 3105
;3104:
;3105:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 3106
;3106:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3107
;3107:		return;
ADDRGP4 $1695
JUMPV
LABELV $1707
line 3110
;3108:	}
;3109:
;3110:	if (g_entities[saberent->r.ownerNum].health < 1 || !g_entities[saberent->r.ownerNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK] || !g_entities[saberent->r.ownerNum].client->ps.fd.forcePowerLevel[FP_SABERTHROW])
ADDRLP4 40
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 40
INDIRI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
CNSTI4 1
LTI4 $1721
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $1721
ADDRLP4 40
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $1715
LABELV $1721
line 3111
;3111:	{ //He's dead, just go back to our normal saber status
line 3112
;3112:		saberent->touch = SaberGotHit;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 SaberGotHit
ASGNP4
line 3113
;3113:		saberent->think = SaberUpdateSelf;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 3114
;3114:		/*if ( jk2gameplay == VERSION_1_04 )*/ saberent->bolt_Head = 0; // MVSDK: This shouldn't affect gameplay.
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 0
ASGNI4
line 3115
;3115:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3117
;3116:
;3117:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 3119
;3118:
;3119:		saberent->r.svFlags |= (SVF_NOCLIENT);
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
CNSTI4 1
BORI4
ASGNI4
line 3120
;3120:		saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 3121
;3121:		VectorSet( saberent->r.mins, -SABER_BOX_SIZE, -SABER_BOX_SIZE, -SABER_BOX_SIZE );
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1726
ADDRLP4 52
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1727
JUMPV
LABELV $1726
ADDRLP4 52
CNSTF4 1098907648
ASGNF4
LABELV $1727
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 52
INDIRF4
NEGF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1728
ADDRLP4 56
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1729
JUMPV
LABELV $1728
ADDRLP4 56
CNSTF4 1098907648
ASGNF4
LABELV $1729
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 56
INDIRF4
NEGF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1730
ADDRLP4 60
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1731
JUMPV
LABELV $1730
ADDRLP4 60
CNSTF4 1098907648
ASGNF4
LABELV $1731
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 60
INDIRF4
NEGF4
ASGNF4
line 3122
;3122:		VectorSet( saberent->r.maxs, SABER_BOX_SIZE, SABER_BOX_SIZE, SABER_BOX_SIZE );
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1735
ADDRLP4 64
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1736
JUMPV
LABELV $1735
ADDRLP4 64
CNSTF4 1098907648
ASGNF4
LABELV $1736
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 64
INDIRF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1737
ADDRLP4 68
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1738
JUMPV
LABELV $1737
ADDRLP4 68
CNSTF4 1098907648
ASGNF4
LABELV $1738
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 68
INDIRF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1739
ADDRLP4 72
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1740
JUMPV
LABELV $1739
ADDRLP4 72
CNSTF4 1098907648
ASGNF4
LABELV $1740
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 72
INDIRF4
ASGNF4
line 3123
;3123:		saberent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 3125
;3124:
;3125:		g_entities[saberent->r.ownerNum].client->ps.saberInFlight = qfalse;
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 3126
;3126:		g_entities[saberent->r.ownerNum].client->ps.saberThrowDelay = LEVELTIME(g_entities[saberent->r.ownerNum].client) + 500;
ADDRLP4 84
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 84
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1751
ADDRLP4 84
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1751
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1753
ADDRLP4 80
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1754
JUMPV
LABELV $1753
ADDRLP4 80
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1754
ADDRLP4 76
ADDRLP4 80
INDIRI4
ASGNI4
ADDRGP4 $1752
JUMPV
LABELV $1751
ADDRLP4 76
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1752
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
ADDRLP4 76
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3127
;3127:		g_entities[saberent->r.ownerNum].client->ps.saberCanThrow = qfalse;
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 3129
;3128:
;3129:		return;
ADDRGP4 $1695
JUMPV
LABELV $1715
line 3132
;3130:	}
;3131:
;3132:	saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 3134
;3133:
;3134:	VectorSubtract(saberent->pos1, saberent->r.currentOrigin, dir);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 48
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 48
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 52
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3136
;3135:
;3136:	ownerLen = VectorLength(dir);
ADDRLP4 4
ARGP4
ADDRLP4 56
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 56
INDIRF4
ASGNF4
line 3138
;3137:
;3138:	if (saberent->speed < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1758
line 3139
;3139:	{
line 3140
;3140:		VectorNormalize(dir);
ADDRLP4 4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3142
;3141:
;3142:		saberMoveBack(saberent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 saberMoveBack
CALLV
pop
line 3143
;3143:		VectorCopy(saberent->r.currentOrigin, saberent->s.pos.trBase);
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
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 3145
;3144:
;3145:		if (g_entities[saberent->r.ownerNum].client->ps.fd.forcePowerLevel[FP_SABERTHROW] >= FORCE_LEVEL_3)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1761
line 3146
;3146:		{ //allow players with high saber throw rank to control the return speed of the saber
line 3147
;3147:			if (g_entities[saberent->r.ownerNum].client->buttons & BUTTON_ATTACK)
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 43608
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1764
line 3148
;3148:			{
line 3149
;3149:				VectorScale(dir, 1200, saberent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1150681088
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1150681088
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1150681088
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 3150
;3150:				saberent->speed = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
CVIF4 4
ASGNF4
line 3151
;3151:			}
ADDRGP4 $1762
JUMPV
LABELV $1764
line 3153
;3152:			else
;3153:			{
line 3154
;3154:				VectorScale(dir, 700, saberent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1143930880
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 3155
;3155:				saberent->speed = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 200
ADDI4
CVIF4 4
ASGNF4
line 3156
;3156:			}
line 3157
;3157:		}
ADDRGP4 $1762
JUMPV
LABELV $1761
line 3159
;3158:		else
;3159:		{
line 3160
;3160:			VectorScale(dir, 700, saberent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1143930880
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 3161
;3161:			saberent->speed = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 200
ADDI4
CVIF4 4
ASGNF4
line 3162
;3162:		}
LABELV $1762
line 3163
;3163:		saberent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3164
;3164:	}
LABELV $1758
line 3166
;3165:
;3166:	if (ownerLen <= 512)
ADDRLP4 16
INDIRF4
CNSTF4 1140850688
GTF4 $1777
line 3167
;3167:	{
line 3168
;3168:		saberent->s.saberInFlight = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
CNSTI4 0
ASGNI4
line 3169
;3169:		saberent->s.loopSound = saberHumSound;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRGP4 saberHumSound
INDIRI4
ASGNI4
line 3170
;3170:	}
LABELV $1777
line 3172
;3171:
;3172:	if (ownerLen <= 32)
ADDRLP4 16
INDIRF4
CNSTF4 1107296256
GTF4 $1779
line 3173
;3173:	{
line 3174
;3174:		saberOwner->client->ps.saberInFlight = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 3175
;3175:		saberOwner->client->ps.saberCanThrow = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 3176
;3176:		saberOwner->client->ps.saberThrowDelay = nowTime + 300;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
ADDRLP4 20
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 3178
;3177:
;3178:		saberent->touch = SaberGotHit;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 SaberGotHit
ASGNP4
line 3180
;3179:
;3180:		saberent->think = SaberUpdateSelf;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 3181
;3181:		/*if ( jk2gameplay == VERSION_1_04 )*/ saberent->bolt_Head = 0; // MVSDK: This shouldn't affect gameplay.
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 0
ASGNI4
line 3182
;3182:		saberent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 3184
;3183:
;3184:		return;
ADDRGP4 $1695
JUMPV
LABELV $1779
line 3187
;3185:	}
;3186:
;3187:	if (!saberent->s.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1782
line 3188
;3188:	{
line 3189
;3189:		saberCheckRadiusDamage(saberent, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 saberCheckRadiusDamage
CALLV
pop
line 3190
;3190:	}
ADDRGP4 $1783
JUMPV
LABELV $1782
line 3192
;3191:	else
;3192:	{
line 3193
;3193:		saberCheckRadiusDamage(saberent, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 saberCheckRadiusDamage
CALLV
pop
line 3194
;3194:	}
LABELV $1783
line 3196
;3195:
;3196:	saberMoveBack(saberent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 saberMoveBack
CALLV
pop
line 3198
;3197:
;3198:	saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3199
;3199:}
LABELV $1695
endproc saberBackToOwner 88 8
export thrownSaberTouch
proc thrownSaberTouch 44 20
line 3204
;3200:
;3201:void saberFirstThrown(gentity_t *saberent);
;3202:
;3203:void thrownSaberTouch (gentity_t *saberent, gentity_t *other, trace_t *trace)
;3204:{
line 3205
;3205:	gentity_t *hitEnt = other;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
line 3207
;3206:
;3207:	if (other && other->s.number == saberent->r.ownerNum)
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1786
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
NEI4 $1786
line 3208
;3208:	{
line 3209
;3209:		return;
ADDRGP4 $1785
JUMPV
LABELV $1786
line 3211
;3210:	}
;3211:	VectorClear(saberent->s.pos.trDelta);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 3212
;3212:	saberent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3214
;3213:
;3214:	saberent->s.apos.trType = TR_LINEAR;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 3215
;3215:	saberent->s.apos.trDelta[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 0
ASGNF4
line 3216
;3216:	saberent->s.apos.trDelta[1] = 800;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
CNSTF4 1145569280
ASGNF4
line 3217
;3217:	saberent->s.apos.trDelta[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
line 3219
;3218:
;3219:	VectorCopy(saberent->r.currentOrigin, saberent->s.pos.trBase);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 3221
;3220:
;3221:	saberent->think = saberBackToOwner;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 saberBackToOwner
ASGNP4
line 3222
;3222:	saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3224
;3223:
;3224:	if (other && other->r.ownerNum < MAX_CLIENTS &&
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $1790
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 32
GEI4 $1790
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $1790
ADDRLP4 36
CNSTI4 2352
ADDRLP4 28
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $1790
ADDRLP4 36
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1790
line 3228
;3225:		(other->r.contents & CONTENTS_LIGHTSABER) &&
;3226:		g_entities[other->r.ownerNum].client &&
;3227:		g_entities[other->r.ownerNum].inuse)
;3228:	{
line 3229
;3229:		hitEnt = &g_entities[other->r.ownerNum];
ADDRLP4 0
CNSTI4 2352
ADDRFP4 4
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3230
;3230:	}
LABELV $1790
line 3232
;3231:
;3232:	CheckThrownSaberDamaged(saberent, &g_entities[saberent->r.ownerNum], hitEnt, 256, 0);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 2352
ADDRLP4 40
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 256
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CheckThrownSaberDamaged
CALLI4
pop
line 3234
;3233:
;3234:	saberent->speed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTF4 0
ASGNF4
line 3235
;3235:}
LABELV $1785
endproc thrownSaberTouch 44 20
export saberFirstThrown
proc saberFirstThrown 1220 28
line 3240
;3236:
;3237:#define SABER_MAX_THROW_DISTANCE 700
;3238:
;3239:void saberFirstThrown(gentity_t *saberent)
;3240:{
line 3243
;3241:	vec3_t		vSub;
;3242:	float		vLen;
;3243:	gentity_t	*saberOwn = &g_entities[saberent->r.ownerNum]; 
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
line 3246
;3244:	int			nowTime;
;3245:
;3246:	if (saberent->r.ownerNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1795
line 3247
;3247:	{
line 3248
;3248:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 3250
;3249:
;3250:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 3251
;3251:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3252
;3252:		return;
ADDRGP4 $1794
JUMPV
LABELV $1795
line 3255
;3253:	}
;3254:
;3255:	if (!saberOwn ||
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $1802
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1802
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $1802
ADDRLP4 32
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1798
LABELV $1802
line 3259
;3256:		!saberOwn->inuse ||
;3257:		!saberOwn->client ||
;3258:		saberOwn->client->sess.sessionTeam == TEAM_SPECTATOR)
;3259:	{
line 3260
;3260:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 3262
;3261:
;3262:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 3263
;3263:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3264
;3264:		return;
ADDRGP4 $1794
JUMPV
LABELV $1798
line 3266
;3265:	}
;3266:	nowTime = LEVELTIME(saberOwn->client);
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1808
ADDRLP4 44
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1808
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1810
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1811
JUMPV
LABELV $1810
ADDRLP4 40
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1811
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
ADDRGP4 $1809
JUMPV
LABELV $1808
ADDRLP4 36
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1809
ADDRLP4 16
ADDRLP4 36
INDIRI4
ASGNI4
line 3268
;3267:
;3268:	if (saberOwn->health < 1 || !saberOwn->client->ps.fd.forcePowerLevel[FP_SABERATTACK] || !saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW])
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
LTI4 $1815
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $1815
ADDRLP4 52
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $1812
LABELV $1815
line 3269
;3269:	{ //He's dead, just go back to our normal saber status
line 3270
;3270:		saberent->touch = SaberGotHit;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 SaberGotHit
ASGNP4
line 3271
;3271:		saberent->think = SaberUpdateSelf;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 3272
;3272:		/*if ( jk2gameplay == VERSION_1_04 )*/ saberent->bolt_Head = 0; // MVSDK: This shouldn't affect gameplay.
ADDRFP4 0
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 0
ASGNI4
line 3273
;3273:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3275
;3274:
;3275:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 3277
;3276:
;3277:		saberent->r.svFlags |= (SVF_NOCLIENT);
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 3278
;3278:		saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 3279
;3279:		VectorSet( saberent->r.mins, -SABER_BOX_SIZE, -SABER_BOX_SIZE, -SABER_BOX_SIZE );
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1820
ADDRLP4 64
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1821
JUMPV
LABELV $1820
ADDRLP4 64
CNSTF4 1098907648
ASGNF4
LABELV $1821
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 64
INDIRF4
NEGF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1822
ADDRLP4 68
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1823
JUMPV
LABELV $1822
ADDRLP4 68
CNSTF4 1098907648
ASGNF4
LABELV $1823
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 68
INDIRF4
NEGF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1824
ADDRLP4 72
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1825
JUMPV
LABELV $1824
ADDRLP4 72
CNSTF4 1098907648
ASGNF4
LABELV $1825
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 72
INDIRF4
NEGF4
ASGNF4
line 3280
;3280:		VectorSet( saberent->r.maxs, SABER_BOX_SIZE, SABER_BOX_SIZE, SABER_BOX_SIZE );
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1829
ADDRLP4 76
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1830
JUMPV
LABELV $1829
ADDRLP4 76
CNSTF4 1098907648
ASGNF4
LABELV $1830
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 76
INDIRF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1831
ADDRLP4 80
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1832
JUMPV
LABELV $1831
ADDRLP4 80
CNSTF4 1098907648
ASGNF4
LABELV $1832
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 80
INDIRF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1833
ADDRLP4 84
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1834
JUMPV
LABELV $1833
ADDRLP4 84
CNSTF4 1098907648
ASGNF4
LABELV $1834
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 84
INDIRF4
ASGNF4
line 3281
;3281:		saberent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 3283
;3282:
;3283:		saberOwn->client->ps.saberInFlight = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 3284
;3284:		saberOwn->client->ps.saberThrowDelay = nowTime + 500;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
ADDRLP4 16
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3285
;3285:		saberOwn->client->ps.saberCanThrow = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 3287
;3286:
;3287:		return;
ADDRGP4 $1794
JUMPV
LABELV $1812
line 3290
;3288:	}
;3289:
;3290:	if ((nowTime - saberOwn->client->ps.saberDidThrowTime) > 500)
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
SUBI4
CNSTI4 500
LEI4 $1835
line 3291
;3291:	{
line 3292
;3292:		if (!(saberOwn->client->buttons & BUTTON_ALT_ATTACK))
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43608
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $1837
line 3293
;3293:		{ //If owner releases altattack 500ms or later after throwing saber, it autoreturns
line 3294
;3294:			thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 3295
;3295:			goto runMin;
ADDRGP4 $1839
JUMPV
LABELV $1837
line 3297
;3296:		}
;3297:		else if ((nowTime - saberOwn->client->ps.saberDidThrowTime) > 6000)
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
SUBI4
CNSTI4 6000
LEI4 $1840
line 3298
;3298:		{ //if it's out longer than 6 seconds, return it
line 3299
;3299:			thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 3300
;3300:			goto runMin;
ADDRGP4 $1839
JUMPV
LABELV $1840
line 3302
;3301:		}
;3302:	}
LABELV $1835
line 3304
;3303:
;3304:	if (BG_HasYsalamiri(g_gametype.integer, &saberOwn->client->ps))
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $1842
line 3305
;3305:	{
line 3306
;3306:		thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 3307
;3307:		goto runMin;
ADDRGP4 $1839
JUMPV
LABELV $1842
line 3310
;3308:	}
;3309:	
;3310:	if (!BG_CanUseFPNow(g_gametype.integer, &saberOwn->client->ps, nowTime, FP_SABERTHROW))
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
CNSTI4 17
ARGI4
ADDRLP4 64
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $1845
line 3311
;3311:	{
line 3312
;3312:		thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 3313
;3313:		goto runMin;
ADDRGP4 $1839
JUMPV
LABELV $1845
line 3316
;3314:	}
;3315:
;3316:	VectorSubtract(saberOwn->client->ps.origin, saberent->r.currentOrigin, vSub);
ADDRLP4 68
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 68
INDIRP4
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
ADDRLP4 4+4
ADDRLP4 68
INDIRP4
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
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 408
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
line 3317
;3317:	vLen = VectorLength(vSub);
ADDRLP4 4
ARGP4
ADDRLP4 76
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 76
INDIRF4
ASGNF4
line 3319
;3318:
;3319:	if (vLen >= (SABER_MAX_THROW_DISTANCE*saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW]))
ADDRLP4 20
INDIRF4
CNSTI4 700
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
MULI4
CVIF4 4
LTF4 $1850
line 3320
;3320:	{
line 3321
;3321:		thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 3322
;3322:		goto runMin;
ADDRGP4 $1839
JUMPV
LABELV $1850
line 3325
;3323:	}
;3324:
;3325:	if (saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW] >= FORCE_LEVEL_2 &&
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
CNSTI4 2
LTI4 $1852
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRGP4 level+36
INDIRI4
CVIF4 4
GEF4 $1852
line 3327
;3326:		saberent->speed < level.time)
;3327:	{ //if owner is rank 3 in saber throwing, the saber goes where he points
line 3331
;3328:		vec3_t fwd, traceFrom, traceTo, dir;
;3329:		trace_t tr;
;3330:
;3331:		AngleVectors(saberOwn->client->ps.viewangles, fwd, 0, 0);
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 1208
CNSTP4 0
ASGNP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3333
;3332:
;3333:		VectorCopy(saberOwn->client->ps.origin, traceFrom);
ADDRLP4 116
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3334
;3334:		traceFrom[2] += saberOwn->client->ps.viewheight;
ADDRLP4 116+8
ADDRLP4 116+8
INDIRF4
ADDRLP4 0
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
line 3336
;3335:
;3336:		VectorCopy(traceFrom, traceTo);
ADDRLP4 92
ADDRLP4 116
INDIRB
ASGNB 12
line 3337
;3337:		traceTo[0] += fwd[0]*4096;
ADDRLP4 92
ADDRLP4 92
INDIRF4
CNSTF4 1166016512
ADDRLP4 104
INDIRF4
MULF4
ADDF4
ASGNF4
line 3338
;3338:		traceTo[1] += fwd[1]*4096;
ADDRLP4 92+4
ADDRLP4 92+4
INDIRF4
CNSTF4 1166016512
ADDRLP4 104+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3339
;3339:		traceTo[2] += fwd[2]*4096;
ADDRLP4 92+8
ADDRLP4 92+8
INDIRF4
CNSTF4 1166016512
ADDRLP4 104+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3341
;3340:
;3341:		saberMoveBack(saberent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberMoveBack
CALLV
pop
line 3342
;3342:		VectorCopy(saberent->r.currentOrigin, saberent->s.pos.trBase);
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 1212
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 3344
;3343:
;3344:		if (saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW] >= FORCE_LEVEL_3)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1860
line 3345
;3345:		{ //if highest saber throw rank, we can direct the saber toward players directly by looking at them
line 3346
;3346:			JP_Trace(&tr, traceFrom, NULL, NULL, traceTo, saberOwn->s.number, MASK_PLAYERSOLID);
ADDRLP4 128
ARGP4
ADDRLP4 116
ARGP4
ADDRLP4 1216
CNSTP4 0
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3347
;3347:		}
ADDRGP4 $1861
JUMPV
LABELV $1860
line 3349
;3348:		else
;3349:		{
line 3350
;3350:			JP_Trace(&tr, traceFrom, NULL, NULL, traceTo, saberOwn->s.number, MASK_SOLID);
ADDRLP4 128
ARGP4
ADDRLP4 116
ARGP4
ADDRLP4 1216
CNSTP4 0
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 3351
;3351:		}
LABELV $1861
line 3353
;3352:
;3353:		VectorSubtract(tr.endpos, saberent->r.currentOrigin, dir);
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 128+12
INDIRF4
ADDRLP4 1216
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 128+12+4
INDIRF4
ADDRLP4 1216
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 80+8
ADDRLP4 128+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3355
;3354:
;3355:		VectorNormalize(dir);
ADDRLP4 80
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3357
;3356:
;3357:		VectorScale(dir, 500, saberent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1140457472
ADDRLP4 80
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1140457472
ADDRLP4 80+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1140457472
ADDRLP4 80+8
INDIRF4
MULF4
ASGNF4
line 3358
;3358:		saberent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3360
;3359:
;3360:		if (saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW] >= FORCE_LEVEL_3)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1872
line 3361
;3361:		{ //we'll treat them to a quicker update rate if their throw rank is high enough
line 3362
;3362:			saberent->speed = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 3363
;3363:		}
ADDRGP4 $1873
JUMPV
LABELV $1872
line 3365
;3364:		else
;3365:		{
line 3366
;3366:			saberent->speed = level.time + 400;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 400
ADDI4
CVIF4 4
ASGNF4
line 3367
;3367:		}
LABELV $1873
line 3368
;3368:	}
LABELV $1852
LABELV $1839
line 3372
;3369:
;3370:runMin:
;3371:
;3372:	saberCheckRadiusDamage(saberent, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberCheckRadiusDamage
CALLV
pop
line 3373
;3373:	G_RunObject(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 3374
;3374:}
LABELV $1794
endproc saberFirstThrown 1220 28
export WP_SaberPositionUpdate
proc WP_SaberPositionUpdate 592 40
line 3377
;3375:
;3376:void WP_SaberPositionUpdate( gentity_t *self, usercmd_t *ucmd)
;3377:{ //rww - keep the saber position as updated as possible on the server so that we can try to do realistic-looking contact stuff
line 3385
;3378:	mdxaBone_t	boltMatrix;
;3379:	vec3_t properAngles, properOrigin;
;3380:	vec3_t boltAngles, boltOrigin;
;3381:	vec3_t end;
;3382:	vec3_t legAxis[3];
;3383:	vec3_t addVel;
;3384:	vec3_t rawAngles;
;3385:	float fVSpeed = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 3389
;3386:	int f;
;3387:	int torsoAnim;
;3388:	int legsAnim;
;3389:	int returnAfterUpdate = 0;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 3390
;3390:	float animSpeedScale = 1;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 3391
;3391:	qboolean setTorso = qfalse;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 3392
;3392:	const int runFlags = DF_GetRunFlags(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 DF_GetRunFlags
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 204
INDIRI4
ASGNI4
line 3393
;3393:	int		nowTime = LEVELTIME(self->client);
ADDRLP4 216
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 216
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1881
ADDRLP4 216
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1881
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1883
ADDRLP4 212
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1884
JUMPV
LABELV $1883
ADDRLP4 212
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1884
ADDRLP4 208
ADDRLP4 212
INDIRI4
ASGNI4
ADDRGP4 $1882
JUMPV
LABELV $1881
ADDRLP4 208
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1882
ADDRLP4 140
ADDRLP4 208
INDIRI4
ASGNI4
line 3395
;3394:
;3395:	if (self && self->inuse && self->client)
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
CNSTU4 0
ASGNU4
ADDRLP4 220
INDIRP4
CVPU4 4
ADDRLP4 224
INDIRU4
EQU4 $1885
ADDRLP4 220
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1885
ADDRLP4 220
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 224
INDIRU4
EQU4 $1885
line 3396
;3396:	{
line 3397
;3397:		if (self->client->saberCycleQueue)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43592
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1887
line 3398
;3398:		{
line 3399
;3399:			self->client->ps.fd.saberDrawAnimLevel = self->client->saberCycleQueue;
ADDRLP4 228
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 1232
ADDP4
ADDRLP4 228
INDIRP4
CNSTI4 43592
ADDP4
INDIRI4
ASGNI4
line 3400
;3400:		}
ADDRGP4 $1888
JUMPV
LABELV $1887
line 3402
;3401:		else
;3402:		{
line 3403
;3403:			self->client->ps.fd.saberDrawAnimLevel = self->client->ps.fd.saberAnimLevel;
ADDRLP4 228
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 1232
ADDP4
ADDRLP4 228
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ASGNI4
line 3404
;3404:		}
LABELV $1888
line 3405
;3405:	}
LABELV $1885
line 3407
;3406:
;3407:	if (self &&
ADDRLP4 228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
CNSTU4 0
ASGNU4
ADDRLP4 228
INDIRP4
CVPU4 4
ADDRLP4 232
INDIRU4
EQU4 $1889
ADDRLP4 236
CNSTI4 0
ASGNI4
ADDRLP4 228
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 236
INDIRI4
EQI4 $1889
ADDRLP4 240
ADDRLP4 228
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 240
INDIRP4
CVPU4 4
ADDRLP4 232
INDIRU4
EQU4 $1889
ADDRLP4 240
INDIRP4
CNSTI4 43592
ADDP4
INDIRI4
ADDRLP4 236
INDIRI4
EQI4 $1889
ADDRLP4 240
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 236
INDIRI4
LEI4 $1891
ADDRLP4 228
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1889
LABELV $1891
line 3412
;3408:		self->inuse &&
;3409:		self->client &&
;3410:		self->client->saberCycleQueue &&
;3411:		(self->client->ps.weaponTime <= 0 || self->health < 1))
;3412:	{ //we cycled attack levels while we were busy, so update now that we aren't (even if that means we're dead)
line 3413
;3413:		self->client->ps.fd.saberAnimLevel = self->client->saberCycleQueue;
ADDRLP4 244
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
CNSTI4 1228
ADDP4
ADDRLP4 244
INDIRP4
CNSTI4 43592
ADDP4
INDIRI4
ASGNI4
line 3414
;3414:		self->client->saberCycleQueue = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43592
ADDP4
CNSTI4 0
ASGNI4
line 3415
;3415:	}
LABELV $1889
line 3417
;3416:
;3417:	if (!self ||
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
CNSTU4 0
ASGNU4
ADDRLP4 244
INDIRP4
CVPU4 4
ADDRLP4 248
INDIRU4
EQU4 $1896
ADDRLP4 252
ADDRLP4 244
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CVPU4 4
ADDRLP4 248
INDIRU4
EQU4 $1896
ADDRLP4 252
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 248
INDIRU4
EQU4 $1896
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
ADDRLP4 248
INDIRU4
NEU4 $1892
LABELV $1896
line 3421
;3418:		!self->client ||
;3419:		!self->client->ghoul2 ||
;3420:		!g2SaberInstance)
;3421:	{
line 3422
;3422:		return;
ADDRGP4 $1876
JUMPV
LABELV $1892
line 3425
;3423:	}
;3424:
;3425:	if (self->health < 1)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1897
line 3426
;3426:	{ //we don't want to waste precious CPU time calculating saber positions for corpses. But we want to avoid the saber ent position lagging on spawn, so..
line 3427
;3427:		gentity_t *mySaber = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 256
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
line 3430
;3428:
;3429:		//I guess it's good to keep the position updated even when contents are 0
;3430:		if (mySaber && ((mySaber->r.contents & CONTENTS_LIGHTSABER) || mySaber->r.contents == 0) && !self->client->ps.saberInFlight)
ADDRLP4 260
ADDRLP4 256
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1876
ADDRLP4 264
ADDRLP4 260
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ASGNI4
ADDRLP4 268
CNSTI4 0
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 262144
BANDI4
ADDRLP4 268
INDIRI4
NEI4 $1901
ADDRLP4 264
INDIRI4
ADDRLP4 268
INDIRI4
NEI4 $1876
LABELV $1901
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1876
line 3431
;3431:		{ //Since we haven't got a bolt position, place it on top of the player origin.
line 3432
;3432:			VectorCopy(self->client->ps.origin, mySaber->r.currentOrigin);
ADDRLP4 256
INDIRP4
CNSTI4 368
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
line 3433
;3433:		}
line 3434
;3434:		return;
ADDRGP4 $1876
JUMPV
LABELV $1897
line 3437
;3435:	}
;3436:
;3437:	if (self->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1902
line 3438
;3438:	{ //we don't update the server's G2 instance in the case of ATST use, so..
line 3439
;3439:		return;
ADDRGP4 $1876
JUMPV
LABELV $1902
line 3442
;3440:	}
;3441:
;3442:	if (self->client->ps.weapon != WP_SABER ||
ADDRLP4 256
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 260
CNSTI4 2
ASGNI4
ADDRLP4 256
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 260
INDIRI4
NEI4 $1907
ADDRLP4 264
ADDRLP4 256
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 1
EQI4 $1907
ADDRLP4 264
INDIRI4
ADDRLP4 260
INDIRI4
NEI4 $1904
LABELV $1907
line 3445
;3443:		self->client->ps.weaponstate == WEAPON_RAISING ||
;3444:		self->client->ps.weaponstate == WEAPON_DROPPING)
;3445:	{
line 3446
;3446:		returnAfterUpdate = 1;
ADDRLP4 148
CNSTI4 1
ASGNI4
line 3447
;3447:	}
LABELV $1904
line 3449
;3448:
;3449:	if (self->client->ps.saberThrowDelay < nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
GEI4 $1908
line 3450
;3450:	{
line 3451
;3451:		self->client->ps.saberCanThrow = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 3452
;3452:	}
LABELV $1908
line 3454
;3453:
;3454:	if (self->client->ps.fd.forcePowersActive & (1 << FP_RAGE))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1910
line 3455
;3455:	{
line 3456
;3456:		animSpeedScale = 2;
ADDRLP4 28
CNSTF4 1073741824
ASGNF4
line 3457
;3457:	}
LABELV $1910
line 3459
;3458:	
;3459:	torsoAnim = (self->client->ps.torsoAnim & ~ANIM_TOGGLEBIT );
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 3460
;3460:	legsAnim = (self->client->ps.legsAnim & ~ANIM_TOGGLEBIT );
ADDRLP4 120
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
line 3462
;3461:
;3462:	VectorCopy(self->client->ps.origin, properOrigin);
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3463
;3463:	VectorCopy(self->client->ps.viewangles, properAngles);
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 3466
;3464:
;3465:	//try to predict the origin based on velocity so it's more like what the client is seeing
;3466:	VectorCopy(self->client->ps.velocity, addVel);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 3467
;3467:	VectorNormalize(addVel);
ADDRLP4 108
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3469
;3468:
;3469:	if (self->client->ps.velocity[0] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1912
line 3470
;3470:	{
line 3471
;3471:		fVSpeed += (-self->client->ps.velocity[0]);
ADDRLP4 24
ADDRLP4 24
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
line 3472
;3472:	}
ADDRGP4 $1913
JUMPV
LABELV $1912
line 3474
;3473:	else
;3474:	{
line 3475
;3475:		fVSpeed += self->client->ps.velocity[0];
ADDRLP4 24
ADDRLP4 24
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
line 3476
;3476:	}
LABELV $1913
line 3477
;3477:	if (self->client->ps.velocity[1] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1914
line 3478
;3478:	{
line 3479
;3479:		fVSpeed += (-self->client->ps.velocity[1]);
ADDRLP4 24
ADDRLP4 24
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
line 3480
;3480:	}
ADDRGP4 $1915
JUMPV
LABELV $1914
line 3482
;3481:	else
;3482:	{
line 3483
;3483:		fVSpeed += self->client->ps.velocity[1];
ADDRLP4 24
ADDRLP4 24
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
line 3484
;3484:	}
LABELV $1915
line 3485
;3485:	if (self->client->ps.velocity[2] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1916
line 3486
;3486:	{
line 3487
;3487:		fVSpeed += (-self->client->ps.velocity[2]);
ADDRLP4 24
ADDRLP4 24
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
line 3488
;3488:	}
ADDRGP4 $1917
JUMPV
LABELV $1916
line 3490
;3489:	else
;3490:	{
line 3491
;3491:		fVSpeed += self->client->ps.velocity[2];
ADDRLP4 24
ADDRLP4 24
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
line 3492
;3492:	}
LABELV $1917
line 3494
;3493:
;3494:	fVSpeed *= 0.08f;
ADDRLP4 24
CNSTF4 1034147594
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 3496
;3495:
;3496:	properOrigin[0] += addVel[0]*fVSpeed;
ADDRLP4 96
ADDRLP4 96
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 3497
;3497:	properOrigin[1] += addVel[1]*fVSpeed;
ADDRLP4 96+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 108+4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 3498
;3498:	properOrigin[2] += addVel[2]*fVSpeed;
ADDRLP4 96+8
ADDRLP4 96+8
INDIRF4
ADDRLP4 108+8
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 3500
;3499:
;3500:	properAngles[0] = 0;
ADDRLP4 80
CNSTF4 0
ASGNF4
line 3501
;3501:	properAngles[1] = self->client->ps.viewangles[YAW];
ADDRLP4 80+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 3502
;3502:	properAngles[2] = 0;
ADDRLP4 80+8
CNSTF4 0
ASGNF4
line 3504
;3503:
;3504:	AnglesToAxis( properAngles, legAxis );
ADDRLP4 80
ARGP4
ADDRLP4 156
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 3505
;3505:	G_G2PlayerAngles( self, legAxis, properAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 G_G2PlayerAngles
CALLV
pop
line 3507
;3506:
;3507:	if (returnAfterUpdate)
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1924
line 3508
;3508:	{ //We don't even need to do GetBoltMatrix if we're only in here to keep the g2 server instance in sync
line 3510
;3509:		//but keep our saber entity in sync too, just copy it over our origin.
;3510:		gentity_t *mySaber = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 268
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
line 3513
;3511:
;3512:		//I guess it's good to keep the position updated even when contents are 0
;3513:		if (mySaber && ((mySaber->r.contents & CONTENTS_LIGHTSABER) || mySaber->r.contents == 0) && !self->client->ps.saberInFlight)
ADDRLP4 272
ADDRLP4 268
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1929
ADDRLP4 276
ADDRLP4 272
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ASGNI4
ADDRLP4 280
CNSTI4 0
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 262144
BANDI4
ADDRLP4 280
INDIRI4
NEI4 $1928
ADDRLP4 276
INDIRI4
ADDRLP4 280
INDIRI4
NEI4 $1929
LABELV $1928
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1929
line 3514
;3514:		{ //Since we haven't got a bolt position, place it on top of the player origin.
line 3515
;3515:			VectorCopy(self->client->ps.origin, mySaber->r.currentOrigin);
ADDRLP4 268
INDIRP4
CNSTI4 368
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
line 3516
;3516:		}
line 3518
;3517:
;3518:		goto finalUpdate;
ADDRGP4 $1929
JUMPV
LABELV $1924
line 3521
;3519:	}
;3520:
;3521:	trap_G2API_GetBoltMatrix(self->client->ghoul2, 1, 0, &boltMatrix, properAngles, properOrigin, level.time, NULL, vec3_origin); // not using nowTime here because using it on G2 made the server have extreme hitches and idk the cause
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
ADDRLP4 32
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 96
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
line 3523
;3522:
;3523:	boltOrigin[0] = boltMatrix.matrix[0][3];
ADDRLP4 0
ADDRLP4 32+12
INDIRF4
ASGNF4
line 3524
;3524:	boltOrigin[1] = boltMatrix.matrix[1][3];
ADDRLP4 0+4
ADDRLP4 32+16+12
INDIRF4
ASGNF4
line 3525
;3525:	boltOrigin[2] = boltMatrix.matrix[2][3];
ADDRLP4 0+8
ADDRLP4 32+32+12
INDIRF4
ASGNF4
line 3527
;3526:
;3527:	boltAngles[0] = -boltMatrix.matrix[0][1];
ADDRLP4 12
ADDRLP4 32+4
INDIRF4
NEGF4
ASGNF4
line 3528
;3528:	boltAngles[1] = -boltMatrix.matrix[1][1];
ADDRLP4 12+4
ADDRLP4 32+16+4
INDIRF4
NEGF4
ASGNF4
line 3529
;3529:	boltAngles[2] = -boltMatrix.matrix[2][1];
ADDRLP4 12+8
ADDRLP4 32+32+4
INDIRF4
NEGF4
ASGNF4
line 3532
;3530:
;3531:	//immediately store these values so we don't have to recalculate this again
;3532:	if ( jk2gameplay != VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $1945
line 3533
;3533:	{ // MVSDK: FIXME: As I do not know for sure if this is just an optimization or actually affects gameplay I am going to disable this in 1.02...
line 3534
;3534:		VectorCopy(boltOrigin, self->client->lastSaberBase_Always);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43780
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3535
;3535:		VectorCopy(boltOrigin, self->client->lastSaberDir_Always);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43768
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3536
;3536:		self->client->lastSaberStorageTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43792
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 3537
;3537:	}
LABELV $1945
line 3539
;3538:
;3539:	VectorCopy(boltAngles, rawAngles);
ADDRLP4 192
ADDRLP4 12
INDIRB
ASGNB 12
line 3541
;3540:
;3541:	VectorMA( boltOrigin, 40, boltAngles, end );
ADDRLP4 268
CNSTF4 1109393408
ASGNF4
ADDRLP4 124
ADDRLP4 0
INDIRF4
ADDRLP4 268
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 268
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1109393408
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3543
;3542:
;3543:	if (self->client->ps.saberEntityNum)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1953
line 3544
;3544:	{
line 3545
;3545:		gentity_t *mySaber = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 272
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
line 3548
;3546:
;3547:		//I guess it's good to keep the position updated even when contents are 0
;3548:		if (mySaber && ((mySaber->r.contents & CONTENTS_LIGHTSABER) || mySaber->r.contents == 0) && !self->client->ps.saberInFlight)
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1955
ADDRLP4 280
ADDRLP4 272
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ASGNI4
ADDRLP4 284
CNSTI4 0
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 262144
BANDI4
ADDRLP4 284
INDIRI4
NEI4 $1957
ADDRLP4 280
INDIRI4
ADDRLP4 284
INDIRI4
NEI4 $1955
LABELV $1957
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1955
line 3549
;3549:		{ //place it roughly in the middle of the saber..
line 3550
;3550:			VectorMA( boltOrigin, 20, boltAngles, mySaber->r.currentOrigin );
ADDRLP4 272
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 272
INDIRP4
CNSTI4 372
ADDP4
ADDRLP4 0+4
INDIRF4
CNSTF4 1101004800
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 272
INDIRP4
CNSTI4 376
ADDP4
ADDRLP4 0+8
INDIRF4
CNSTF4 1101004800
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3552
;3551:
;3552:			if (self->client->ps.dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1962
line 3553
;3553:			{
line 3554
;3554:				VectorCopy(boltOrigin, mySaber->r.currentOrigin);
ADDRLP4 272
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3555
;3555:			}
LABELV $1962
line 3556
;3556:		}
LABELV $1955
line 3557
;3557:	}
LABELV $1953
line 3559
;3558:
;3559:	boltAngles[YAW] = self->client->ps.viewangles[YAW];
ADDRLP4 12+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 3563
;3560:
;3561:	//G_TestLine(boltOrigin, end, 0x000000ff, 50);
;3562:
;3563:	if (self->client->ps.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1965
line 3564
;3564:	{ //do the thrown-saber stuff
line 3565
;3565:		gentity_t *saberent = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 272
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
line 3567
;3566:
;3567:		if (saberent)
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1966
line 3568
;3568:		{
line 3569
;3569:			if (!self->client->ps.saberEntityState)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1969
line 3570
;3570:			{
line 3573
;3571:				vec3_t startorg, startang, dir;
;3572:
;3573:				VectorCopy(boltOrigin, saberent->r.currentOrigin);
ADDRLP4 272
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3575
;3574:
;3575:				VectorCopy(boltOrigin, startorg);
ADDRLP4 288
ADDRLP4 0
INDIRB
ASGNB 12
line 3576
;3576:				VectorCopy(boltAngles, startang);
ADDRLP4 300
ADDRLP4 12
INDIRB
ASGNB 12
line 3582
;3577:
;3578:				//startang[0] = 90;
;3579:				//Instead of this we'll sort of fake it and slowly tilt it down on the client via
;3580:				//a perframe method (which doesn't actually affect where or how the saber hits)
;3581:
;3582:				saberent->r.svFlags &= ~(SVF_NOCLIENT);
ADDRLP4 312
ADDRLP4 272
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 312
INDIRP4
ADDRLP4 312
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 3583
;3583:				VectorCopy(startorg, saberent->s.pos.trBase);
ADDRLP4 272
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 288
INDIRB
ASGNB 12
line 3584
;3584:				VectorCopy(startang, saberent->s.apos.trBase);
ADDRLP4 272
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 300
INDIRB
ASGNB 12
line 3586
;3585:
;3586:				VectorCopy(startorg, saberent->s.origin);
ADDRLP4 272
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 288
INDIRB
ASGNB 12
line 3587
;3587:				VectorCopy(startang, saberent->s.angles);
ADDRLP4 272
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 300
INDIRB
ASGNB 12
line 3589
;3588:
;3589:				saberent->s.saberInFlight = qtrue;
ADDRLP4 272
INDIRP4
CNSTI4 228
ADDP4
CNSTI4 1
ASGNI4
line 3591
;3590:
;3591:				saberent->s.apos.trType = TR_LINEAR;
ADDRLP4 272
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 3592
;3592:				saberent->s.apos.trDelta[0] = 0;
ADDRLP4 272
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 0
ASGNF4
line 3593
;3593:				saberent->s.apos.trDelta[1] = 800;
ADDRLP4 272
INDIRP4
CNSTI4 76
ADDP4
CNSTF4 1145569280
ASGNF4
line 3594
;3594:				saberent->s.apos.trDelta[2] = 0;
ADDRLP4 272
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
line 3596
;3595:
;3596:				saberent->s.pos.trType = TR_LINEAR;
ADDRLP4 272
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 3597
;3597:				saberent->s.eType = ET_GENERAL;
ADDRLP4 272
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 3598
;3598:				saberent->s.eFlags = 0;
ADDRLP4 272
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 3599
;3599:				saberent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $1693
ARGP4
ADDRLP4 316
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 272
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 316
INDIRI4
ASGNI4
line 3600
;3600:				saberent->s.modelGhoul2 = 127;
ADDRLP4 272
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 127
ASGNI4
line 3602
;3601:
;3602:				saberent->parent = self;
ADDRLP4 272
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 3604
;3603:
;3604:				self->client->ps.saberEntityState = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 1
ASGNI4
line 3607
;3605:
;3606:				//Projectile stuff:
;3607:				AngleVectors(self->client->ps.viewangles, dir, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 320
CNSTP4 0
ASGNP4
ADDRLP4 320
INDIRP4
ARGP4
ADDRLP4 320
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3609
;3608:
;3609:				saberent->nextthink = level.time + FRAMETIME;
ADDRLP4 272
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 3610
;3610:				saberent->think = saberFirstThrown;
ADDRLP4 272
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 saberFirstThrown
ASGNP4
line 3612
;3611:
;3612:				saberent->damage = SABER_THROWN_HIT_DAMAGE;
ADDRLP4 272
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 30
ASGNI4
line 3613
;3613:				saberent->methodOfDeath = MOD_SABER;
ADDRLP4 272
INDIRP4
CNSTI4 720
ADDP4
CNSTI4 3
ASGNI4
line 3614
;3614:				saberent->splashMethodOfDeath = MOD_SABER;
ADDRLP4 272
INDIRP4
CNSTI4 724
ADDP4
CNSTI4 3
ASGNI4
line 3615
;3615:				saberent->s.solid = 2;
ADDRLP4 272
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 3616
;3616:				saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRLP4 272
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 3618
;3617:
;3618:				/*if ( jk2gameplay == VERSION_1_04 )*/ saberent->bolt_Head = 0; // MVSDK: This shouldn't affect gameplay.
ADDRLP4 272
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 0
ASGNI4
line 3620
;3619:
;3620:				VectorSet( saberent->r.mins, -24.0f, -24.0f, -8.0f );
ADDRLP4 272
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3250585600
ASGNF4
ADDRLP4 272
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3250585600
ASGNF4
ADDRLP4 272
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3238002688
ASGNF4
line 3621
;3621:				VectorSet( saberent->r.maxs, 24.0f, 24.0f, 8.0f );
ADDRLP4 272
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1103101952
ASGNF4
ADDRLP4 272
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1103101952
ASGNF4
ADDRLP4 272
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1090519040
ASGNF4
line 3623
;3622:
;3623:				saberent->s.genericenemyindex = self->s.number+1024;
ADDRLP4 272
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1024
ADDI4
ASGNI4
line 3625
;3624:
;3625:				saberent->touch = thrownSaberTouch;
ADDRLP4 272
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 thrownSaberTouch
ASGNP4
line 3627
;3626:
;3627:				saberent->s.weapon = WP_SABER;
ADDRLP4 272
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 3629
;3628:
;3629:				VectorScale(dir, 400, saberent->s.pos.trDelta );
ADDRLP4 272
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1137180672
ADDRLP4 276
INDIRF4
MULF4
ASGNF4
ADDRLP4 272
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1137180672
ADDRLP4 276+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 272
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1137180672
ADDRLP4 276+8
INDIRF4
MULF4
ASGNF4
line 3630
;3630:				saberent->s.pos.trTime = level.time;
ADDRLP4 272
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3632
;3631:
;3632:				saberent->s.loopSound = saberSpinSound;
ADDRLP4 272
INDIRP4
CNSTI4 200
ADDP4
ADDRGP4 saberSpinSound
INDIRI4
ASGNI4
line 3634
;3633:
;3634:				self->client->ps.saberDidThrowTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 3636
;3635:
;3636:				self->client->dangerTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43800
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 3637
;3637:				self->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 324
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 324
INDIRP4
ADDRLP4 324
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 3638
;3638:				self->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43588
ADDP4
CNSTI4 0
ASGNI4
line 3640
;3639:
;3640:				trap_LinkEntity(saberent);
ADDRLP4 272
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3641
;3641:			}
ADDRGP4 $1966
JUMPV
LABELV $1969
line 3643
;3642:			else
;3643:			{
line 3644
;3644:				VectorCopy(boltOrigin, saberent->pos1);
ADDRLP4 272
INDIRP4
CNSTI4 552
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3645
;3645:				trap_LinkEntity(saberent);
ADDRLP4 272
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 3647
;3646:
;3647:				if (saberent->bolt_Head == PROPER_THROWN_VALUE)
ADDRLP4 272
INDIRP4
CNSTI4 828
ADDP4
INDIRI4
CNSTI4 999
NEI4 $1966
line 3648
;3648:				{ //return to the owner now, this is a bad state to be in for here..
line 3649
;3649:					saberent->bolt_Head = 0;
ADDRLP4 272
INDIRP4
CNSTI4 828
ADDP4
CNSTI4 0
ASGNI4
line 3650
;3650:					saberent->think = SaberUpdateSelf;
ADDRLP4 272
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 3651
;3651:					saberent->nextthink = level.time;
ADDRLP4 272
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3652
;3652:					self->client->ps.saberInFlight = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 3653
;3653:					self->client->ps.saberThrowDelay = nowTime + 500;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
ADDRLP4 140
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 3654
;3654:					self->client->ps.saberCanThrow = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 3655
;3655:				}
line 3656
;3656:			}
line 3657
;3657:		}
line 3658
;3658:	}
ADDRGP4 $1966
JUMPV
LABELV $1965
line 3659
;3659:	else if (!self->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1978
line 3660
;3660:	{
line 3661
;3661:		gentity_t *saberent = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 272
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
line 3663
;3662:
;3663:		if (saberent)
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1980
line 3664
;3664:		{
line 3665
;3665:			saberent->r.svFlags |= (SVF_NOCLIENT);
ADDRLP4 276
ADDRLP4 272
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 276
INDIRP4
ADDRLP4 276
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 3666
;3666:			saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRLP4 272
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 3667
;3667:			VectorSet( saberent->r.mins, -SABER_BOX_SIZE, -SABER_BOX_SIZE, -SABER_BOX_SIZE );
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1985
ADDRLP4 280
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1986
JUMPV
LABELV $1985
ADDRLP4 280
CNSTF4 1098907648
ASGNF4
LABELV $1986
ADDRLP4 272
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 280
INDIRF4
NEGF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1987
ADDRLP4 284
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1988
JUMPV
LABELV $1987
ADDRLP4 284
CNSTF4 1098907648
ASGNF4
LABELV $1988
ADDRLP4 272
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 284
INDIRF4
NEGF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1989
ADDRLP4 288
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1990
JUMPV
LABELV $1989
ADDRLP4 288
CNSTF4 1098907648
ASGNF4
LABELV $1990
ADDRLP4 272
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 288
INDIRF4
NEGF4
ASGNF4
line 3668
;3668:			VectorSet( saberent->r.maxs, SABER_BOX_SIZE, SABER_BOX_SIZE, SABER_BOX_SIZE );
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1994
ADDRLP4 292
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1995
JUMPV
LABELV $1994
ADDRLP4 292
CNSTF4 1098907648
ASGNF4
LABELV $1995
ADDRLP4 272
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 292
INDIRF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1996
ADDRLP4 296
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1997
JUMPV
LABELV $1996
ADDRLP4 296
CNSTF4 1098907648
ASGNF4
LABELV $1997
ADDRLP4 272
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 296
INDIRF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1998
ADDRLP4 300
CNSTF4 1090519040
ASGNF4
ADDRGP4 $1999
JUMPV
LABELV $1998
ADDRLP4 300
CNSTF4 1098907648
ASGNF4
LABELV $1999
ADDRLP4 272
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 300
INDIRF4
ASGNF4
line 3669
;3669:			saberent->s.loopSound = 0;
ADDRLP4 272
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 3670
;3670:		}
LABELV $1980
line 3672
;3671:
;3672:		if (self->client->ps.saberLockTime > nowTime && self->client->ps.saberEntityNum)
ADDRLP4 276
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
LEI4 $2000
ADDRLP4 276
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2000
line 3673
;3673:		{
line 3674
;3674:			if (self->client->ps.saberIdleWound < nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
GEI4 $2002
line 3675
;3675:			{
line 3678
;3676:				gentity_t *te;
;3677:				vec3_t dir;
;3678:				te = G_TempEntity( g_entities[self->client->ps.saberEntityNum].r.currentOrigin, EV_SABER_BLOCK );
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
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 296
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 280
ADDRLP4 296
INDIRP4
ASGNP4
line 3679
;3679:				VectorSet( dir, 0, 1, 0 );
ADDRLP4 284
CNSTF4 0
ASGNF4
ADDRLP4 284+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 284+8
CNSTF4 0
ASGNF4
line 3680
;3680:				VectorCopy(g_entities[self->client->ps.saberEntityNum].r.currentOrigin, te->s.origin);
ADDRLP4 280
INDIRP4
CNSTI4 92
ADDP4
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
ADDRGP4 g_entities+296+72
ADDP4
INDIRB
ASGNB 12
line 3681
;3681:				VectorCopy(dir, te->s.angles);
ADDRLP4 280
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 284
INDIRB
ASGNB 12
line 3682
;3682:				te->s.eventParm = 1;
ADDRLP4 280
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 3684
;3683:
;3684:				self->client->ps.saberIdleWound = nowTime + (self->client->sess.raceMode ? 500 : Q_irandExpectedIf(gRandomUnlockAdd, 400, 600, qfalse, 500));
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 304
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2011
ADDRLP4 300
CNSTI4 500
ASGNI4
ADDRGP4 $2012
JUMPV
LABELV $2011
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 400
ARGI4
CNSTI4 600
ARGI4
CNSTI4 0
ARGI4
CNSTI4 500
ARGI4
ADDRLP4 308
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 300
ADDRLP4 308
INDIRI4
ASGNI4
LABELV $2012
ADDRLP4 304
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 140
INDIRI4
ADDRLP4 300
INDIRI4
ADDI4
ASGNI4
line 3685
;3685:			}
LABELV $2002
line 3687
;3686:
;3687:			VectorCopy(boltOrigin, self->client->lastSaberBase);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43756
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3688
;3688:			VectorCopy(end, self->client->lastSaberTip);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43744
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 3689
;3689:			self->client->hasCurrentPosition = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43796
ADDP4
CNSTI4 1
ASGNI4
line 3691
;3690:
;3691:			self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 3693
;3692:
;3693:			goto finalUpdate;
ADDRGP4 $1929
JUMPV
LABELV $2000
line 3696
;3694:		}
;3695:
;3696:		if (self->client->ps.dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2013
line 3697
;3697:		{
line 3698
;3698:			self->client->ps.saberIdleWound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 0
ASGNI4
line 3699
;3699:			self->client->ps.saberAttackWound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 3700
;3700:		}
LABELV $2013
line 3702
;3701:
;3702:		if (self->client->hasCurrentPosition && g_saberInterpolate.integer)
ADDRLP4 280
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43796
ADDP4
INDIRI4
ADDRLP4 280
INDIRI4
EQI4 $2015
ADDRGP4 g_saberInterpolate+12
INDIRI4
ADDRLP4 280
INDIRI4
EQI4 $2015
line 3703
;3703:		{
line 3704
;3704:			if (g_saberInterpolate.integer == 1 && jk2gameplay != VERSION_1_02)
ADDRGP4 g_saberInterpolate+12
INDIRI4
CNSTI4 1
NEI4 $2018
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $2018
line 3705
;3705:			{
line 3706
;3706:				int trMask = CONTENTS_LIGHTSABER|CONTENTS_BODY;
ADDRLP4 420
CNSTI4 262400
ASGNI4
line 3707
;3707:				int sN = 0;
ADDRLP4 284
CNSTI4 0
ASGNI4
line 3708
;3708:				qboolean gotHit = qfalse;
ADDRLP4 416
CNSTI4 0
ASGNI4
line 3710
;3709:				qboolean clientUnlinked[MAX_CLIENTS];
;3710:				qboolean skipSaberTrace = qfalse;
ADDRLP4 424
CNSTI4 0
ASGNI4
line 3712
;3711:
;3712:				if (!g_saberTraceSaberFirst.integer)
ADDRGP4 g_saberTraceSaberFirst+12
INDIRI4
CNSTI4 0
NEI4 $2021
line 3713
;3713:				{
line 3714
;3714:					skipSaberTrace = qtrue;
ADDRLP4 424
CNSTI4 1
ASGNI4
line 3715
;3715:				}
ADDRGP4 $2022
JUMPV
LABELV $2021
line 3716
;3716:				else if (g_saberTraceSaberFirst.integer >= 2 &&
ADDRGP4 g_saberTraceSaberFirst+12
INDIRI4
CNSTI4 2
LTI4 $2024
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $2024
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2024
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
NEI4 $2024
line 3719
;3717:					g_gametype.integer != GT_TOURNAMENT &&
;3718:					!self->client->ps.duelInProgress && jk2gameplay == VERSION_1_04)
;3719:				{ //if value is >= 2, and not in a duel, skip
line 3720
;3720:					skipSaberTrace = qtrue;
ADDRLP4 424
CNSTI4 1
ASGNI4
line 3721
;3721:				}
LABELV $2024
LABELV $2022
line 3723
;3722:
;3723:				if (skipSaberTrace)
ADDRLP4 424
INDIRI4
CNSTI4 0
EQI4 $2031
line 3724
;3724:				{ //skip the saber-contents-only trace and get right to the full trace
line 3725
;3725:					trMask = (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT);
ADDRLP4 420
CNSTI4 262929
ASGNI4
line 3726
;3726:				}
ADDRGP4 $2044
JUMPV
line 3728
;3727:				else
;3728:				{
LABELV $2030
line 3730
;3729:					while (sN < MAX_CLIENTS)
;3730:					{
line 3731
;3731:						if (g_entities[sN].inuse && g_entities[sN].client && g_entities[sN].r.linked && g_entities[sN].health > 0 && (g_entities[sN].r.contents & CONTENTS_BODY))
ADDRLP4 428
CNSTI4 2352
ADDRLP4 284
INDIRI4
MULI4
ASGNI4
ADDRLP4 432
CNSTI4 0
ASGNI4
ADDRLP4 428
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 432
INDIRI4
EQI4 $2033
ADDRLP4 428
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2033
ADDRLP4 428
INDIRI4
ADDRGP4 g_entities+296
ADDP4
INDIRI4
ADDRLP4 432
INDIRI4
EQI4 $2033
ADDRLP4 428
INDIRI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
ADDRLP4 432
INDIRI4
LEI4 $2033
ADDRLP4 428
INDIRI4
ADDRGP4 g_entities+296+44
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 432
INDIRI4
EQI4 $2033
line 3732
;3732:						{ //Take this mask off before the saber trace, because we want to hit the saber first
line 3733
;3733:							g_entities[sN].r.contents &= ~CONTENTS_BODY;
ADDRLP4 436
CNSTI4 2352
ADDRLP4 284
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
ASGNP4
ADDRLP4 436
INDIRP4
ADDRLP4 436
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 3734
;3734:							clientUnlinked[sN] = qtrue;
ADDRLP4 284
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 288
ADDP4
CNSTI4 1
ASGNI4
line 3735
;3735:						}
ADDRGP4 $2034
JUMPV
LABELV $2033
line 3737
;3736:						else
;3737:						{
line 3738
;3738:							clientUnlinked[sN] = qfalse;
ADDRLP4 284
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 288
ADDP4
CNSTI4 0
ASGNI4
line 3739
;3739:						}
LABELV $2034
line 3740
;3740:						sN++;
ADDRLP4 284
ADDRLP4 284
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3741
;3741:					}
LABELV $2031
line 3729
ADDRLP4 284
INDIRI4
CNSTI4 32
LTI4 $2030
line 3742
;3742:				}
ADDRGP4 $2044
JUMPV
LABELV $2043
line 3745
;3743:
;3744:				while (!gotHit)
;3745:				{
line 3746
;3746:					if (!CheckSaberDamage(self, boltOrigin, end, qfalse, trMask))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 420
INDIRI4
ARGI4
ADDRLP4 428
ADDRGP4 CheckSaberDamage
CALLI4
ASGNI4
ADDRLP4 428
INDIRI4
CNSTI4 0
NEI4 $2046
line 3747
;3747:					{
line 3748
;3748:						if (!CheckSaberDamage(self, boltOrigin, end, qtrue, trMask))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 420
INDIRI4
ARGI4
ADDRLP4 432
ADDRGP4 CheckSaberDamage
CALLI4
ASGNI4
ADDRLP4 432
INDIRI4
CNSTI4 0
NEI4 $2048
line 3749
;3749:						{
line 3761
;3750:							vec3_t oldSaberStart;
;3751:							vec3_t oldSaberEnd;
;3752:							vec3_t saberAngleNow;
;3753:							vec3_t saberAngleBefore;
;3754:							vec3_t saberMidDir;
;3755:							vec3_t saberMidAngle;
;3756:							vec3_t saberMidPoint;
;3757:							vec3_t saberMidEnd;
;3758:							vec3_t saberSubBase;
;3759:							float deltaX, deltaY, deltaZ;
;3760:
;3761:							VectorCopy(self->client->lastSaberBase, oldSaberStart);
ADDRLP4 460
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43756
ADDP4
INDIRB
ASGNB 12
line 3762
;3762:							VectorCopy(self->client->lastSaberTip, oldSaberEnd);
ADDRLP4 472
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43744
ADDP4
INDIRB
ASGNB 12
line 3764
;3763:
;3764:							VectorSubtract(oldSaberEnd, oldSaberStart, saberAngleBefore);
ADDRLP4 436
ADDRLP4 472
INDIRF4
ADDRLP4 460
INDIRF4
SUBF4
ASGNF4
ADDRLP4 436+4
ADDRLP4 472+4
INDIRF4
ADDRLP4 460+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 436+8
ADDRLP4 472+8
INDIRF4
ADDRLP4 460+8
INDIRF4
SUBF4
ASGNF4
line 3765
;3765:							vectoangles(saberAngleBefore, saberAngleBefore);
ADDRLP4 436
ARGP4
ADDRLP4 436
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3767
;3766:
;3767:							VectorSubtract(end, boltOrigin, saberAngleNow);
ADDRLP4 448
ADDRLP4 124
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 448+4
ADDRLP4 124+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 448+8
ADDRLP4 124+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 3768
;3768:							vectoangles(saberAngleNow, saberAngleNow);
ADDRLP4 448
ARGP4
ADDRLP4 448
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3770
;3769:
;3770:							deltaX = AngleDelta(saberAngleBefore[0], saberAngleNow[0]);
ADDRLP4 436
INDIRF4
ARGF4
ADDRLP4 448
INDIRF4
ARGF4
ADDRLP4 556
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 496
ADDRLP4 556
INDIRF4
ASGNF4
line 3771
;3771:							deltaY = AngleDelta(saberAngleBefore[1], saberAngleNow[1]);
ADDRLP4 436+4
INDIRF4
ARGF4
ADDRLP4 448+4
INDIRF4
ARGF4
ADDRLP4 560
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 500
ADDRLP4 560
INDIRF4
ASGNF4
line 3772
;3772:							deltaZ = AngleDelta(saberAngleBefore[2], saberAngleNow[2]);
ADDRLP4 436+8
INDIRF4
ARGF4
ADDRLP4 448+8
INDIRF4
ARGF4
ADDRLP4 564
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 504
ADDRLP4 564
INDIRF4
ASGNF4
line 3774
;3773:
;3774:							if ( (deltaX != 0 || deltaY != 0 || deltaZ != 0) && deltaX < 180 && deltaY < 180 && deltaZ < 180 && (BG_SaberInAttack(self->client->ps.saberMove) || PM_SaberInTransition(self->client->ps.saberMove)) )
ADDRLP4 568
CNSTF4 0
ASGNF4
ADDRLP4 496
INDIRF4
ADDRLP4 568
INDIRF4
NEF4 $2069
ADDRLP4 500
INDIRF4
ADDRLP4 568
INDIRF4
NEF4 $2069
ADDRLP4 504
INDIRF4
ADDRLP4 568
INDIRF4
EQF4 $2047
LABELV $2069
ADDRLP4 572
CNSTF4 1127481344
ASGNF4
ADDRLP4 496
INDIRF4
ADDRLP4 572
INDIRF4
GEF4 $2047
ADDRLP4 500
INDIRF4
ADDRLP4 572
INDIRF4
GEF4 $2047
ADDRLP4 504
INDIRF4
ADDRLP4 572
INDIRF4
GEF4 $2047
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 576
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 576
INDIRI4
CNSTI4 0
NEI4 $2070
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 580
ADDRGP4 PM_SaberInTransition
CALLI4
ASGNI4
ADDRLP4 580
INDIRI4
CNSTI4 0
EQI4 $2047
LABELV $2070
line 3775
;3775:							{ //don't go beyond here if we aren't attacking/transitioning or the angle is too large.
line 3777
;3776:							  //and don't bother if the angle is the same
;3777:								saberMidAngle[0] = saberAngleBefore[0] + (deltaX/2);
ADDRLP4 532
ADDRLP4 436
INDIRF4
ADDRLP4 496
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 3778
;3778:								saberMidAngle[1] = saberAngleBefore[1] + (deltaY/2);
ADDRLP4 532+4
ADDRLP4 436+4
INDIRF4
ADDRLP4 500
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 3779
;3779:								saberMidAngle[2] = saberAngleBefore[2] + (deltaZ/2);
ADDRLP4 532+8
ADDRLP4 436+8
INDIRF4
ADDRLP4 504
INDIRF4
CNSTF4 1073741824
DIVF4
ADDF4
ASGNF4
line 3783
;3780:
;3781:								//Now that I have the angle, I'll just say the base for it is the difference between the two start
;3782:								//points (even though that's quite possibly completely false)
;3783:								VectorSubtract(boltOrigin, oldSaberStart, saberSubBase);
ADDRLP4 508
ADDRLP4 0
INDIRF4
ADDRLP4 460
INDIRF4
SUBF4
ASGNF4
ADDRLP4 508+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 460+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 508+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 460+8
INDIRF4
SUBF4
ASGNF4
line 3784
;3784:								saberMidPoint[0] = boltOrigin[0] + (saberSubBase[0]*0.5);
ADDRLP4 484
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
ADDRLP4 508
INDIRF4
MULF4
ADDF4
ASGNF4
line 3785
;3785:								saberMidPoint[1] = boltOrigin[1] + (saberSubBase[1]*0.5);
ADDRLP4 484+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1056964608
ADDRLP4 508+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3786
;3786:								saberMidPoint[2] = boltOrigin[2] + (saberSubBase[2]*0.5);
ADDRLP4 484+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1056964608
ADDRLP4 508+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3788
;3787:
;3788:								AngleVectors(saberMidAngle, saberMidDir, 0, 0);
ADDRLP4 532
ARGP4
ADDRLP4 520
ARGP4
ADDRLP4 584
CNSTP4 0
ASGNP4
ADDRLP4 584
INDIRP4
ARGP4
ADDRLP4 584
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3789
;3789:								saberMidEnd[0] = saberMidPoint[0] + saberMidDir[0]*40; //40 == saber length
ADDRLP4 544
ADDRLP4 484
INDIRF4
CNSTF4 1109393408
ADDRLP4 520
INDIRF4
MULF4
ADDF4
ASGNF4
line 3790
;3790:								saberMidEnd[1] = saberMidPoint[1] + saberMidDir[1]*40;
ADDRLP4 544+4
ADDRLP4 484+4
INDIRF4
CNSTF4 1109393408
ADDRLP4 520+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3791
;3791:								saberMidEnd[2] = saberMidPoint[2] + saberMidDir[2]*40;
ADDRLP4 544+8
ADDRLP4 484+8
INDIRF4
CNSTF4 1109393408
ADDRLP4 520+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3816
;3792:
;3793:								//Now that we have the difference points, check from them to both the old position and the new
;3794:								/*
;3795:								if (!CheckSaberDamage(self, saberMidPoint, saberMidEnd, qtrue, trMask)) //this checks between mid and old
;3796:								{ //that didn't hit, so copy the mid over the old and check between the new and mid
;3797:									VectorCopy(saberMidPoint, self->client->lastSaberBase);
;3798:									VectorCopy(saberMidEnd, self->client->lastSaberTip);
;3799:
;3800:									if (CheckSaberDamage(self, boltOrigin, end, qtrue, trMask))
;3801:									{
;3802:										gotHit = qtrue;
;3803:									}
;3804:
;3805:									//Then copy the old oldpoints in back for good measure
;3806:									VectorCopy(oldSaberStart, self->client->lastSaberBase);
;3807:									VectorCopy(oldSaberEnd, self->client->lastSaberTip);
;3808:								}
;3809:								else
;3810:								{
;3811:									gotHit = qtrue;
;3812:								}
;3813:								*/
;3814:								//The above was more aggressive in approach, but it did add way too many traces unfortunately.
;3815:								//I'll just trace straight out and not even trace between positions instead.
;3816:								if (CheckSaberDamage(self, saberMidPoint, saberMidEnd, qfalse, trMask))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 484
ARGP4
ADDRLP4 544
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 420
INDIRI4
ARGI4
ADDRLP4 588
ADDRGP4 CheckSaberDamage
CALLI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 0
EQI4 $2047
line 3817
;3817:								{
line 3818
;3818:									gotHit = qtrue;
ADDRLP4 416
CNSTI4 1
ASGNI4
line 3819
;3819:								}
line 3820
;3820:							}
line 3821
;3821:						}
ADDRGP4 $2047
JUMPV
LABELV $2048
line 3823
;3822:						else
;3823:						{
line 3824
;3824:							gotHit = qtrue;
ADDRLP4 416
CNSTI4 1
ASGNI4
line 3825
;3825:						}
line 3826
;3826:					}
ADDRGP4 $2047
JUMPV
LABELV $2046
line 3828
;3827:					else
;3828:					{
line 3829
;3829:						gotHit = qtrue;
ADDRLP4 416
CNSTI4 1
ASGNI4
line 3830
;3830:					}
LABELV $2047
line 3832
;3831:
;3832:					if (!skipSaberTrace)
ADDRLP4 424
INDIRI4
CNSTI4 0
NEI4 $2095
line 3833
;3833:					{
line 3834
;3834:						sN = 0;
ADDRLP4 284
CNSTI4 0
ASGNI4
ADDRGP4 $2098
JUMPV
LABELV $2097
line 3836
;3835:						while (sN < MAX_CLIENTS)
;3836:						{
line 3837
;3837:							if (clientUnlinked[sN])
ADDRLP4 284
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 288
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2100
line 3838
;3838:							{ //Make clients clip properly again.
line 3839
;3839:								if (g_entities[sN].inuse && g_entities[sN].health > 0)
ADDRLP4 432
CNSTI4 2352
ADDRLP4 284
INDIRI4
MULI4
ASGNI4
ADDRLP4 436
CNSTI4 0
ASGNI4
ADDRLP4 432
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 436
INDIRI4
EQI4 $2102
ADDRLP4 432
INDIRI4
ADDRGP4 g_entities+688
ADDP4
INDIRI4
ADDRLP4 436
INDIRI4
LEI4 $2102
line 3840
;3840:								{
line 3841
;3841:									g_entities[sN].r.contents |= CONTENTS_BODY;
ADDRLP4 440
CNSTI4 2352
ADDRLP4 284
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
ASGNP4
ADDRLP4 440
INDIRP4
ADDRLP4 440
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 3842
;3842:								}
LABELV $2102
line 3843
;3843:							}
LABELV $2100
line 3844
;3844:							sN++;
ADDRLP4 284
ADDRLP4 284
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3845
;3845:						}
LABELV $2098
line 3835
ADDRLP4 284
INDIRI4
CNSTI4 32
LTI4 $2097
line 3846
;3846:					}
LABELV $2095
line 3848
;3847:
;3848:					if (!gotHit)
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $2108
line 3849
;3849:					{
line 3850
;3850:						if (trMask != (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT))
ADDRLP4 420
INDIRI4
CNSTI4 262929
EQI4 $2110
line 3851
;3851:						{
line 3852
;3852:							trMask = (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT);
ADDRLP4 420
CNSTI4 262929
ASGNI4
line 3853
;3853:						}
ADDRGP4 $2111
JUMPV
LABELV $2110
line 3855
;3854:						else
;3855:						{
line 3856
;3856:							gotHit = qtrue; //break out of the loop
ADDRLP4 416
CNSTI4 1
ASGNI4
line 3857
;3857:						}
LABELV $2111
line 3858
;3858:					}
LABELV $2108
line 3859
;3859:				}
LABELV $2044
line 3744
ADDRLP4 416
INDIRI4
CNSTI4 0
EQI4 $2043
line 3860
;3860:			}
ADDRGP4 $2016
JUMPV
LABELV $2018
line 3861
;3861:			else if (g_saberInterpolate.integer || jk2gameplay == VERSION_1_02) //anything but 0 or 1, use the old plain method.
ADDRGP4 g_saberInterpolate+12
INDIRI4
CNSTI4 0
NEI4 $2115
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $2016
LABELV $2115
line 3862
;3862:			{
line 3863
;3863:				if (!CheckSaberDamage(self, boltOrigin, end, qfalse, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 0
ARGI4
CNSTI4 262929
ARGI4
ADDRLP4 284
ADDRGP4 CheckSaberDamage
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $2016
line 3864
;3864:				{
line 3865
;3865:					CheckSaberDamage(self, boltOrigin, end, qtrue, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 1
ARGI4
CNSTI4 262929
ARGI4
ADDRGP4 CheckSaberDamage
CALLI4
pop
line 3866
;3866:				}
line 3867
;3867:			}
line 3868
;3868:		}
ADDRGP4 $2016
JUMPV
LABELV $2015
line 3870
;3869:		else
;3870:		{
line 3871
;3871:			CheckSaberDamage(self, boltOrigin, end, qfalse, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 0
ARGI4
CNSTI4 262929
ARGI4
ADDRGP4 CheckSaberDamage
CALLI4
pop
line 3872
;3872:		}
LABELV $2016
line 3874
;3873:
;3874:		if (self->client->ps.dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1364
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2118
line 3875
;3875:		{
line 3878
;3876:			vec3_t otherOrg, otherEnd;
;3877:
;3878:			VectorMA( boltOrigin, -12, rawAngles, otherOrg );
ADDRLP4 308
CNSTF4 3242196992
ASGNF4
ADDRLP4 284
ADDRLP4 0
INDIRF4
ADDRLP4 308
INDIRF4
ADDRLP4 192
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 284+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 308
INDIRF4
ADDRLP4 192+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 284+8
ADDRLP4 0+8
INDIRF4
CNSTF4 3242196992
ADDRLP4 192+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3879
;3879:			VectorMA( otherOrg, -40, rawAngles, otherEnd );
ADDRLP4 312
CNSTF4 3256877056
ASGNF4
ADDRLP4 296
ADDRLP4 284
INDIRF4
ADDRLP4 312
INDIRF4
ADDRLP4 192
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 296+4
ADDRLP4 284+4
INDIRF4
ADDRLP4 312
INDIRF4
ADDRLP4 192+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 296+8
ADDRLP4 284+8
INDIRF4
CNSTF4 3256877056
ADDRLP4 192+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3881
;3880:
;3881:			self->client->ps.saberIdleWound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 0
ASGNI4
line 3882
;3882:			self->client->ps.saberAttackWound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 3884
;3883:
;3884:			CheckSaberDamage(self, otherOrg, otherEnd, qfalse, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER|MASK_SHOT));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 284
ARGP4
ADDRLP4 296
ARGP4
CNSTI4 0
ARGI4
CNSTI4 262929
ARGI4
ADDRGP4 CheckSaberDamage
CALLI4
pop
line 3885
;3885:		}
LABELV $2118
line 3887
;3886:
;3887:		VectorCopy(boltOrigin, self->client->lastSaberBase);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43756
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 3888
;3888:		VectorCopy(end, self->client->lastSaberTip);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43744
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 3889
;3889:		self->client->hasCurrentPosition = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43796
ADDP4
CNSTI4 1
ASGNI4
line 3891
;3890:
;3891:		self->client->ps.saberEntityState = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 3892
;3892:	}
LABELV $1978
LABELV $1966
LABELV $1929
line 3894
;3893:finalUpdate:
;3894:	if (self->client->ps.saberLockFrame)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2132
line 3895
;3895:	{
line 3896
;3896:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "model_root", self->client->ps.saberLockFrame, self->client->ps.saberLockFrame+1, BONE_ANIM_OVERRIDE_FREEZE|BONE_ANIM_BLEND, animSpeedScale, level.time, -1, 150);
ADDRLP4 272
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $2134
ARGP4
ADDRLP4 276
ADDRLP4 272
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 276
INDIRI4
ARGI4
ADDRLP4 276
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 200
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
INDIRP4
CALLI4
pop
line 3897
;3897:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, (jk2gameplay == VERSION_1_02 ? "upper_lumbar" : "lower_lumbar"), self->client->ps.saberLockFrame, self->client->ps.saberLockFrame+1, BONE_ANIM_OVERRIDE_FREEZE|BONE_ANIM_BLEND, animSpeedScale, level.time, -1, 150); // not using nowTime here because using it on G2 made the server have extreme hitches and idk the cause
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
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $2138
ADDRLP4 280
ADDRGP4 $348
ASGNP4
ADDRGP4 $2139
JUMPV
LABELV $2138
ADDRLP4 280
ADDRGP4 $350
ASGNP4
LABELV $2139
ADDRLP4 280
INDIRP4
ARGP4
ADDRLP4 284
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 284
INDIRI4
ARGI4
ADDRLP4 284
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 200
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
INDIRP4
CALLI4
pop
line 3898
;3898:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "Motion", self->client->ps.saberLockFrame, self->client->ps.saberLockFrame+1, BONE_ANIM_OVERRIDE_FREEZE|BONE_ANIM_BLEND, animSpeedScale, level.time, -1, 150);  // not using nowTime here because using it on G2 made the server have extreme hitches and idk the cause
ADDRLP4 288
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 288
INDIRP4
CNSTI4 43740
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $2140
ARGP4
ADDRLP4 292
ADDRLP4 288
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 292
INDIRI4
ARGI4
ADDRLP4 292
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 200
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
INDIRP4
CALLI4
pop
line 3899
;3899:		return;
ADDRGP4 $1876
JUMPV
LABELV $2132
line 3902
;3900:	}
;3901:
;3902:	if (self->client->ps.legsAnimExecute != legsAnim)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 728
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $2142
line 3903
;3903:	{
line 3904
;3904:		float animSpeed = 50.0f / bgGlobalAnimations[legsAnim].frameLerp;
ADDRLP4 272
CNSTF4 1112014848
CNSTI4 28
ADDRLP4 120
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 3906
;3905:		int aFlags;
;3906:		animSpeedScale = (animSpeed *= animSpeedScale);
ADDRLP4 280
ADDRLP4 272
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 272
ADDRLP4 280
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 280
INDIRF4
ASGNF4
line 3908
;3907:
;3908:		if (bgGlobalAnimations[legsAnim].loopFrames != -1)
CNSTI4 28
ADDRLP4 120
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2145
line 3909
;3909:		{
line 3910
;3910:			aFlags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 276
CNSTI4 16
ASGNI4
line 3911
;3911:		}
ADDRGP4 $2146
JUMPV
LABELV $2145
line 3913
;3912:		else
;3913:		{
line 3914
;3914:			aFlags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 276
CNSTI4 72
ASGNI4
line 3915
;3915:		}
LABELV $2146
line 3917
;3916:
;3917:		aFlags |= BONE_ANIM_BLEND; //since client defaults to blend. Not sure if this will make much difference if any on server position, but it's here just for the sake of matching them.
ADDRLP4 276
ADDRLP4 276
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 3919
;3918:
;3919:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "model_root", bgGlobalAnimations[legsAnim].firstFrame, bgGlobalAnimations[legsAnim].firstFrame+bgGlobalAnimations[legsAnim].numFrames, aFlags, animSpeedScale, level.time, -1, 150);  // not using nowTime here because using it on G2 made the server have extreme hitches and idk the cause
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
ADDRGP4 $2134
ARGP4
ADDRLP4 284
CNSTI4 28
ADDRLP4 120
INDIRI4
MULI4
ASGNI4
ADDRLP4 288
ADDRLP4 284
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ASGNI4
ADDRLP4 288
INDIRI4
ARGI4
ADDRLP4 288
INDIRI4
ADDRLP4 284
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 276
INDIRI4
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
INDIRP4
CALLI4
pop
line 3920
;3920:		self->client->ps.legsAnimExecute = legsAnim;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 120
INDIRI4
ASGNI4
line 3921
;3921:	}
LABELV $2142
line 3922
;3922:	if (self->client->ps.torsoAnimExecute != torsoAnim)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $2150
line 3923
;3923:	{
line 3925
;3924:		int initialFrame;
;3925:		int aFlags = 0;
ADDRLP4 272
CNSTI4 0
ASGNI4
line 3926
;3926:		float animSpeed = 0;
ADDRLP4 276
CNSTF4 0
ASGNF4
line 3928
;3927:
;3928:		f = torsoAnim;
ADDRLP4 136
ADDRLP4 92
INDIRI4
ASGNI4
line 3930
;3929:
;3930:		initialFrame = bgGlobalAnimations[f].firstFrame;
ADDRLP4 280
CNSTI4 28
ADDRLP4 136
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ASGNI4
line 3932
;3931:	
;3932:		BG_SaberStartTransAnim(self->client->ps.fd.saberAnimLevel, f, &animSpeedScale);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_SaberStartTransAnim
CALLV
pop
line 3934
;3933:
;3934:		animSpeed = 50.0f / bgGlobalAnimations[f].frameLerp;
ADDRLP4 276
CNSTF4 1112014848
CNSTI4 28
ADDRLP4 136
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 3935
;3935:		animSpeedScale = (animSpeed *= animSpeedScale);
ADDRLP4 284
ADDRLP4 276
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 276
ADDRLP4 284
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 284
INDIRF4
ASGNF4
line 3937
;3936:
;3937:		if (bgGlobalAnimations[f].loopFrames != -1)
CNSTI4 28
ADDRLP4 136
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2153
line 3938
;3938:		{
line 3939
;3939:			aFlags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 272
CNSTI4 16
ASGNI4
line 3940
;3940:		}
ADDRGP4 $2154
JUMPV
LABELV $2153
line 3942
;3941:		else
;3942:		{
line 3943
;3943:			aFlags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 272
CNSTI4 72
ASGNI4
line 3944
;3944:		}
LABELV $2154
line 3946
;3945:
;3946:		aFlags |= BONE_ANIM_BLEND; //since client defaults to blend. Not sure if this will make much difference if any on client position, but it's here just for the sake of matching them.
ADDRLP4 272
ADDRLP4 272
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 3948
;3947:
;3948:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, (jk2gameplay == VERSION_1_02 ? "upper_lumbar" : "lower_lumbar"), initialFrame, bgGlobalAnimations[f].firstFrame+bgGlobalAnimations[f].numFrames, aFlags, animSpeedScale, level.time, initialFrame, 150); // not using nowTime here because using it on G2 made the server have extreme hitches and idk the cause
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
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $2159
ADDRLP4 288
ADDRGP4 $348
ASGNP4
ADDRGP4 $2160
JUMPV
LABELV $2159
ADDRLP4 288
ADDRGP4 $350
ASGNP4
LABELV $2160
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 292
ADDRLP4 280
INDIRI4
ASGNI4
ADDRLP4 292
INDIRI4
ARGI4
ADDRLP4 296
CNSTI4 28
ADDRLP4 136
INDIRI4
MULI4
ASGNI4
ADDRLP4 296
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ADDRLP4 296
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 292
INDIRI4
CVIF4 4
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
INDIRP4
CALLI4
pop
line 3950
;3949:
;3950:		self->client->ps.torsoAnimExecute = torsoAnim;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 92
INDIRI4
ASGNI4
line 3952
;3951:		
;3952:		setTorso = qtrue;
ADDRLP4 152
CNSTI4 1
ASGNI4
line 3953
;3953:	}
LABELV $2150
line 3955
;3954:
;3955:	if (!BG_FlippingAnim( self->client->ps.legsAnim ) &&
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 272
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $2161
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 276
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $2161
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $2161
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 284
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $2161
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 288
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $2161
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRI4
ARGI4
ADDRLP4 292
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $2161
ADDRLP4 296
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 300
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
NEI4 $2161
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 304
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
NEI4 $2161
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 308
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 308
INDIRI4
CNSTI4 0
NEI4 $2161
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 316
CNSTI4 0
ASGNI4
ADDRLP4 312
INDIRI4
ADDRLP4 316
INDIRI4
NEI4 $2161
ADDRLP4 152
INDIRI4
ADDRLP4 316
INDIRI4
EQI4 $2161
line 3966
;3956:		!BG_FlippingAnim( self->client->ps.torsoAnim ) &&
;3957:		!BG_SpinningSaberAnim( self->client->ps.legsAnim ) &&
;3958:		!BG_SpinningSaberAnim( self->client->ps.torsoAnim ) &&
;3959:		!BG_InSpecialJump( self->client->ps.legsAnim, runFlags ) &&
;3960:		!BG_InSpecialJump( self->client->ps.torsoAnim, runFlags ) &&
;3961:		!BG_InRoll(&self->client->ps, self->client->ps.legsAnim) &&
;3962:		!BG_SaberInSpecial(self->client->ps.saberMove) &&
;3963:		!BG_SaberInSpecialAttack(self->client->ps.legsAnim) &&
;3964:		!BG_SaberInSpecialAttack(self->client->ps.torsoAnim) &&
;3965:		setTorso )
;3966:	{
line 3967
;3967:		float animSpeed = 50.0f / bgGlobalAnimations[torsoAnim].frameLerp;
ADDRLP4 320
CNSTF4 1112014848
CNSTI4 28
ADDRLP4 92
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 3969
;3968:		int aFlags;
;3969:		animSpeedScale = (animSpeed *= animSpeedScale);
ADDRLP4 328
ADDRLP4 320
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 320
ADDRLP4 328
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 328
INDIRF4
ASGNF4
line 3971
;3970:
;3971:		if (bgGlobalAnimations[torsoAnim].loopFrames != -1)
CNSTI4 28
ADDRLP4 92
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $2164
line 3972
;3972:		{
line 3973
;3973:			aFlags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 324
CNSTI4 16
ASGNI4
line 3974
;3974:		}
ADDRGP4 $2165
JUMPV
LABELV $2164
line 3976
;3975:		else
;3976:		{
line 3977
;3977:			aFlags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 324
CNSTI4 72
ASGNI4
line 3978
;3978:		}
LABELV $2165
line 3980
;3979:
;3980:		aFlags |= BONE_ANIM_BLEND; //since client defaults to blend. Not sure if this will make much difference if any on client position, but it's here just for the sake of matching them.
ADDRLP4 324
ADDRLP4 324
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 3982
;3981:
;3982:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "Motion", bgGlobalAnimations[torsoAnim].firstFrame, bgGlobalAnimations[torsoAnim].firstFrame+bgGlobalAnimations[torsoAnim].numFrames, aFlags, animSpeedScale, level.time, -1, 150);
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
ADDRGP4 $2140
ARGP4
ADDRLP4 332
CNSTI4 28
ADDRLP4 92
INDIRI4
MULI4
ASGNI4
ADDRLP4 336
ADDRLP4 332
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ASGNI4
ADDRLP4 336
INDIRI4
ARGI4
ADDRLP4 336
INDIRI4
ADDRLP4 332
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 324
INDIRI4
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
INDIRP4
CALLI4
pop
line 3983
;3983:	}
LABELV $2161
line 3984
;3984:}
LABELV $1876
endproc WP_SaberPositionUpdate 592 40
export WP_MissileBlockForBlock
proc WP_MissileBlockForBlock 4 0
line 3987
;3985:
;3986:int WP_MissileBlockForBlock( int saberBlock )
;3987:{
line 3988
;3988:	switch( saberBlock )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $2170
ADDRLP4 0
INDIRI4
CNSTI4 8
GTI4 $2170
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2177-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2177
address $2172
address $2173
address $2174
address $2175
address $2176
code
line 3989
;3989:	{
LABELV $2172
line 3991
;3990:	case BLOCKED_UPPER_RIGHT:
;3991:		return BLOCKED_UPPER_RIGHT_PROJ;
CNSTI4 9
RETI4
ADDRGP4 $2169
JUMPV
line 3992
;3992:		break;
LABELV $2173
line 3994
;3993:	case BLOCKED_UPPER_LEFT:
;3994:		return BLOCKED_UPPER_LEFT_PROJ;
CNSTI4 10
RETI4
ADDRGP4 $2169
JUMPV
line 3995
;3995:		break;
LABELV $2174
line 3997
;3996:	case BLOCKED_LOWER_RIGHT:
;3997:		return BLOCKED_LOWER_RIGHT_PROJ;
CNSTI4 11
RETI4
ADDRGP4 $2169
JUMPV
line 3998
;3998:		break;
LABELV $2175
line 4000
;3999:	case BLOCKED_LOWER_LEFT:
;4000:		return BLOCKED_LOWER_LEFT_PROJ;
CNSTI4 12
RETI4
ADDRGP4 $2169
JUMPV
line 4001
;4001:		break;
LABELV $2176
line 4003
;4002:	case BLOCKED_TOP:
;4003:		return BLOCKED_TOP_PROJ;
CNSTI4 13
RETI4
ADDRGP4 $2169
JUMPV
line 4004
;4004:		break;
LABELV $2170
line 4006
;4005:	}
;4006:	return saberBlock;
ADDRFP4 0
INDIRI4
RETI4
LABELV $2169
endproc WP_MissileBlockForBlock 4 0
lit
align 4
LABELV $2180
byte 4 0
byte 4 0
byte 4 0
export WP_SaberBlockNonRandom
code
proc WP_SaberBlockNonRandom 72 16
line 4010
;4007:}
;4008:
;4009:void WP_SaberBlockNonRandom( gentity_t *self, vec3_t hitloc, qboolean missileBlock )
;4010:{
line 4011
;4011:	vec3_t diff, fwdangles={0,0,0}, right;
ADDRLP4 36
ADDRGP4 $2180
INDIRB
ASGNB 12
line 4016
;4012:	vec3_t clEye;
;4013:	float rightdot;
;4014:	float zdiff;
;4015:
;4016:	VectorCopy(self->client->ps.origin, clEye);
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
line 4017
;4017:	clEye[2] += self->client->ps.viewheight;
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
line 4019
;4018:
;4019:	VectorSubtract( hitloc, clEye, diff );
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 56
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
line 4020
;4020:	diff[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4021
;4021:	VectorNormalize( diff );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 4023
;4022:
;4023:	fwdangles[1] = self->client->ps.viewangles[1];
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
line 4025
;4024:	// Ultimately we might care if the shot was ahead or behind, but for now, just quadrant is fine.
;4025:	AngleVectors( fwdangles, NULL, right, NULL );
ADDRLP4 36
ARGP4
ADDRLP4 60
CNSTP4 0
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4027
;4026:
;4027:	rightdot = DotProduct(right, diff);
ADDRLP4 52
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
line 4028
;4028:	zdiff = hitloc[2] - clEye[2];
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 4030
;4029:	
;4030:	if ( zdiff > 0 )
ADDRLP4 48
INDIRF4
CNSTF4 0
LEF4 $2193
line 4031
;4031:	{
line 4032
;4032:		if ( rightdot > 0.3 )
ADDRLP4 52
INDIRF4
CNSTF4 1050253722
LEF4 $2195
line 4033
;4033:		{
line 4034
;4034:			self->client->ps.saberBlocked = BLOCKED_UPPER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 4
ASGNI4
line 4035
;4035:		}
ADDRGP4 $2194
JUMPV
LABELV $2195
line 4036
;4036:		else if ( rightdot < -0.3 )
ADDRLP4 52
INDIRF4
CNSTF4 3197737370
GEF4 $2197
line 4037
;4037:		{
line 4038
;4038:			self->client->ps.saberBlocked = BLOCKED_UPPER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 5
ASGNI4
line 4039
;4039:		}
ADDRGP4 $2194
JUMPV
LABELV $2197
line 4041
;4040:		else
;4041:		{
line 4042
;4042:			self->client->ps.saberBlocked = BLOCKED_TOP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 8
ASGNI4
line 4043
;4043:		}
line 4044
;4044:	}
ADDRGP4 $2194
JUMPV
LABELV $2193
line 4045
;4045:	else if ( zdiff > -20 )//20 )
ADDRLP4 48
INDIRF4
CNSTF4 3248488448
LEF4 $2199
line 4046
;4046:	{
line 4047
;4047:		if ( zdiff < -10 )//30 )
ADDRLP4 48
INDIRF4
CNSTF4 3240099840
GEF4 $2201
line 4048
;4048:		{//hmm, pretty low, but not low enough to use the low block, so we need to duck
line 4050
;4049:			
;4050:		}
LABELV $2201
line 4051
;4051:		if ( rightdot > 0.1 )
ADDRLP4 52
INDIRF4
CNSTF4 1036831949
LEF4 $2203
line 4052
;4052:		{
line 4053
;4053:			self->client->ps.saberBlocked = BLOCKED_UPPER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 4
ASGNI4
line 4054
;4054:		}
ADDRGP4 $2200
JUMPV
LABELV $2203
line 4055
;4055:		else if ( rightdot < -0.1 )
ADDRLP4 52
INDIRF4
CNSTF4 3184315597
GEF4 $2205
line 4056
;4056:		{
line 4057
;4057:			self->client->ps.saberBlocked = BLOCKED_UPPER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 5
ASGNI4
line 4058
;4058:		}
ADDRGP4 $2200
JUMPV
LABELV $2205
line 4060
;4059:		else
;4060:		{
line 4061
;4061:			self->client->ps.saberBlocked = BLOCKED_TOP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 8
ASGNI4
line 4062
;4062:		}
line 4063
;4063:	}
ADDRGP4 $2200
JUMPV
LABELV $2199
line 4065
;4064:	else
;4065:	{
line 4066
;4066:		if ( rightdot >= 0 )
ADDRLP4 52
INDIRF4
CNSTF4 0
LTF4 $2207
line 4067
;4067:		{
line 4068
;4068:			self->client->ps.saberBlocked = BLOCKED_LOWER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 6
ASGNI4
line 4069
;4069:		}
ADDRGP4 $2208
JUMPV
LABELV $2207
line 4071
;4070:		else
;4071:		{
line 4072
;4072:			self->client->ps.saberBlocked = BLOCKED_LOWER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 7
ASGNI4
line 4073
;4073:		}
LABELV $2208
line 4074
;4074:	}
LABELV $2200
LABELV $2194
line 4076
;4075:
;4076:	if ( missileBlock )
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $2209
line 4077
;4077:	{
line 4078
;4078:		self->client->ps.saberBlocked = WP_MissileBlockForBlock( self->client->ps.saberBlocked );
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 WP_MissileBlockForBlock
CALLI4
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ASGNI4
line 4079
;4079:	}
LABELV $2209
line 4080
;4080:}
LABELV $2179
endproc WP_SaberBlockNonRandom 72 16
lit
align 4
LABELV $2212
byte 4 0
byte 4 0
byte 4 0
export WP_SaberBlock
code
proc WP_SaberBlock 88 20
line 4083
;4081:
;4082:void WP_SaberBlock( gentity_t *playerent, vec3_t hitloc, qboolean missileBlock )
;4083:{
line 4084
;4084:	vec3_t diff, fwdangles={0,0,0}, right;
ADDRLP4 24
ADDRGP4 $2212
INDIRB
ASGNB 12
line 4088
;4085:	float rightdot;
;4086:	float zdiff;
;4087:
;4088:	VectorSubtract(hitloc, playerent->client->ps.origin, diff);
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 24
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
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4089
;4089:	VectorNormalize(diff);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 4091
;4090:
;4091:	fwdangles[1] = playerent->client->ps.viewangles[1];
ADDRLP4 24+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 4093
;4092:	// Ultimately we might care if the shot was ahead or behind, but for now, just quadrant is fine.
;4093:	AngleVectors( fwdangles, NULL, right, NULL );
ADDRLP4 24
ARGP4
ADDRLP4 52
CNSTP4 0
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4095
;4094:
;4095:	rightdot = DotProduct(right, diff) + RandFloat(-0.2f,0.2f);
CNSTF4 3192704205
ARGF4
CNSTF4 1045220557
ARGF4
ADDRLP4 56
ADDRGP4 RandFloat
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ADDRLP4 56
INDIRF4
ADDF4
ASGNF4
line 4096
;4096:	zdiff = hitloc[2] - playerent->client->ps.origin[2] + Q_irandExpectedIf(gRandomUnlockAdd,-8,8, qfalse, 0);
ADDRGP4 gRandomUnlockAdd
INDIRI4
ARGI4
CNSTI4 -8
ARGI4
ADDRLP4 60
CNSTI4 8
ASGNI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 Q_irandExpectedIf
CALLI4
ASGNI4
ADDRLP4 36
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ADDRLP4 68
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 4099
;4097:	
;4098:	// Figure out what quadrant the block was in.
;4099:	if (zdiff > 24)
ADDRLP4 36
INDIRF4
CNSTF4 1103101952
LEF4 $2220
line 4100
;4100:	{	// Attack from above
line 4101
;4101:		if (Q_irand(0,1 + gRandomUnlockAdd, qfalse, 0))
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $2222
line 4102
;4102:		{
line 4103
;4103:			playerent->client->ps.saberBlocked = BLOCKED_TOP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 8
ASGNI4
line 4104
;4104:		}
ADDRGP4 $2221
JUMPV
LABELV $2222
line 4106
;4105:		else
;4106:		{
line 4107
;4107:			playerent->client->ps.saberBlocked = BLOCKED_UPPER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 5
ASGNI4
line 4108
;4108:		}
line 4109
;4109:	}
ADDRGP4 $2221
JUMPV
LABELV $2220
line 4110
;4110:	else if (zdiff > 13)
ADDRLP4 36
INDIRF4
CNSTF4 1095761920
LEF4 $2224
line 4111
;4111:	{	// The upper half has three viable blocks...
line 4112
;4112:		if (rightdot > 0.25)
ADDRLP4 40
INDIRF4
CNSTF4 1048576000
LEF4 $2226
line 4113
;4113:		{	// In the right quadrant...
line 4114
;4114:			if (Q_irand(0,1 + gRandomUnlockAdd, qfalse, 0))
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $2228
line 4115
;4115:			{
line 4116
;4116:				playerent->client->ps.saberBlocked = BLOCKED_UPPER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 5
ASGNI4
line 4117
;4117:			}
ADDRGP4 $2225
JUMPV
LABELV $2228
line 4119
;4118:			else
;4119:			{
line 4120
;4120:				playerent->client->ps.saberBlocked = BLOCKED_LOWER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 7
ASGNI4
line 4121
;4121:			}
line 4122
;4122:		}
ADDRGP4 $2225
JUMPV
LABELV $2226
line 4124
;4123:		else
;4124:		{
line 4125
;4125:			switch(Q_irand(0,3 + gRandomUnlockAdd, qfalse, 1))
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 80
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $2225
ADDRLP4 72
INDIRI4
CNSTI4 3
GTI4 $2225
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2236
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2236
address $2233
address $2234
address $2234
address $2235
code
line 4126
;4126:			{
LABELV $2233
line 4128
;4127:			case 0:
;4128:				playerent->client->ps.saberBlocked = BLOCKED_UPPER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 4
ASGNI4
line 4129
;4129:				break;
ADDRGP4 $2225
JUMPV
LABELV $2234
line 4132
;4130:			case 1:
;4131:			case 2:
;4132:				playerent->client->ps.saberBlocked = BLOCKED_LOWER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 6
ASGNI4
line 4133
;4133:				break;
ADDRGP4 $2225
JUMPV
LABELV $2235
line 4135
;4134:			case 3:
;4135:				playerent->client->ps.saberBlocked = BLOCKED_TOP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 8
ASGNI4
line 4136
;4136:				break;
line 4138
;4137:			}
;4138:		}
line 4139
;4139:	}
ADDRGP4 $2225
JUMPV
LABELV $2224
line 4141
;4140:	else
;4141:	{	// The lower half is a bit iffy as far as block coverage.  Pick one of the "low" ones at random.
line 4142
;4142:		if (Q_irand(0,1 + gRandomUnlockAdd, qfalse, 0))
ADDRLP4 72
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $2237
line 4143
;4143:		{
line 4144
;4144:			playerent->client->ps.saberBlocked = BLOCKED_LOWER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 6
ASGNI4
line 4145
;4145:		}
ADDRGP4 $2238
JUMPV
LABELV $2237
line 4147
;4146:		else
;4147:		{
line 4148
;4148:			playerent->client->ps.saberBlocked = BLOCKED_LOWER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 7
ASGNI4
line 4149
;4149:		}
LABELV $2238
line 4150
;4150:	}
LABELV $2225
LABELV $2221
line 4152
;4151:
;4152:	if ( missileBlock )
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $2239
line 4153
;4153:	{
line 4154
;4154:		playerent->client->ps.saberBlocked = WP_MissileBlockForBlock( playerent->client->ps.saberBlocked );
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 WP_MissileBlockForBlock
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 76
INDIRI4
ASGNI4
line 4155
;4155:	}
LABELV $2239
line 4156
;4156:}
LABELV $2211
endproc WP_SaberBlock 88 20
export WP_SaberCanBlock
proc WP_SaberCanBlock 76 16
line 4159
;4157:
;4158:int WP_SaberCanBlock(gentity_t *self, vec3_t point, int dflags, int mod, qboolean projectile, int attackStr)
;4159:{
line 4160
;4160:	qboolean thrownSaber = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4161
;4161:	float blockFactor = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4162
;4162:	int nowTime = LEVELTIME(self->client);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2246
ADDRLP4 20
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2246
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2248
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $2249
JUMPV
LABELV $2248
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $2249
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
ADDRGP4 $2247
JUMPV
LABELV $2246
ADDRLP4 12
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $2247
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 4164
;4163:
;4164:	if (!self || !self->client || !point)
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
EQU4 $2253
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $2253
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
NEU4 $2250
LABELV $2253
line 4165
;4165:	{
line 4166
;4166:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2250
line 4169
;4167:	}
;4168:
;4169:	if (attackStr == 8)
ADDRFP4 20
INDIRI4
CNSTI4 8
NEI4 $2254
line 4170
;4170:	{
line 4171
;4171:		attackStr = 0;
ADDRFP4 20
CNSTI4 0
ASGNI4
line 4172
;4172:		thrownSaber = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 4173
;4173:	}
LABELV $2254
line 4175
;4174:
;4175:	if (BG_SaberInAttack(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $2256
line 4176
;4176:	{
line 4177
;4177:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2256
line 4180
;4178:	}
;4179:
;4180:	if (PM_InSaberAnim(self->client->ps.torsoAnim) && !self->client->ps.saberBlocked &&
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 PM_InSaberAnim
CALLI4
ASGNI4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $2258
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $2258
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
EQI4 $2258
ADDRLP4 48
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $2258
line 4182
;4181:		self->client->ps.saberMove != LS_READY && self->client->ps.saberMove != LS_NONE)
;4182:	{
line 4183
;4183:		if ( self->client->ps.saberMove < LS_PARRY_UP || self->client->ps.saberMove > LS_REFLECT_LL )
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 108
LTI4 $2262
ADDRLP4 52
INDIRI4
CNSTI4 117
LEI4 $2260
LABELV $2262
line 4184
;4184:		{
line 4185
;4185:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2260
line 4187
;4186:		}
;4187:	}
LABELV $2258
line 4189
;4188:
;4189:	if (PM_SaberInBrokenParry(self->client->ps.saberMove) && jk2gameplay != VERSION_1_02)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $2263
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $2263
line 4190
;4190:	{
line 4191
;4191:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2263
line 4194
;4192:	}
;4193:
;4194:	if (self->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2265
line 4195
;4195:	{
line 4196
;4196:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2265
line 4199
;4197:	}
;4198:
;4199:	if (self->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2267
line 4200
;4200:	{
line 4201
;4201:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2267
line 4204
;4202:	}
;4203:
;4204:	if (self->client->ps.weapon != WP_SABER)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2269
line 4205
;4205:	{
line 4206
;4206:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2269
line 4209
;4207:	}
;4208:
;4209:	if (self->client->ps.weaponstate == WEAPON_RAISING)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2271
line 4210
;4210:	{
line 4211
;4211:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2271
line 4214
;4212:	}
;4213:
;4214:	if (self->client->ps.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2273
line 4215
;4215:	{
line 4216
;4216:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2273
line 4219
;4217:	}
;4218:
;4219:	if ((self->client->pers.cmd.buttons & BUTTON_ATTACK)/* &&
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $2275
line 4221
;4220:		(projectile || attackStr == FORCE_LEVEL_3)*/)
;4221:	{ //don't block when the player is trying to slash, if it's a projectile or he's doing a very strong attack
line 4222
;4222:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2275
line 4227
;4223:	}
;4224:
;4225:	//Removed this for now, the new broken parry stuff should handle it. This is how
;4226:	//blocks were decided before the 1.03 patch (as you can see, it was STUPID.. for the most part)
;4227:	if ( jk2gameplay == VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $2277
line 4228
;4228:	{
line 4229
;4229:		if (attackStr == FORCE_LEVEL_3)
ADDRFP4 20
INDIRI4
CNSTI4 3
NEI4 $2279
line 4230
;4230:		{
line 4231
;4231:			if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 3
LTI4 $2281
line 4232
;4232:			{
line 4233
;4233:				if (Q_irand(1, 10, qfalse, 1) < 3)
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 3
GEI4 $2282
line 4234
;4234:				{
line 4235
;4235:					return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
line 4237
;4236:				}
;4237:			}
LABELV $2281
line 4239
;4238:			else
;4239:			{
line 4240
;4240:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2282
line 4242
;4241:			}
;4242:		}
LABELV $2279
line 4244
;4243:
;4244:		if (attackStr == FORCE_LEVEL_2 && Q_irand(1, 10, qfalse, 1) < 3)
ADDRFP4 20
INDIRI4
CNSTI4 2
NEI4 $2285
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 3
GEI4 $2285
line 4245
;4245:		{
line 4246
;4246:			if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 3
LTI4 $2287
line 4247
;4247:			{
line 4249
;4248:				//do nothing for now
;4249:			}
ADDRGP4 $2288
JUMPV
LABELV $2287
line 4250
;4250:			else if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 2
LTI4 $2289
line 4251
;4251:			{
line 4252
;4252:				if (Q_irand(1, 10, qfalse, 6) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 64
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 5
GEI4 $2290
line 4253
;4253:				{
line 4254
;4254:					return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
line 4256
;4255:				}
;4256:			}
LABELV $2289
line 4258
;4257:			else
;4258:			{
line 4259
;4259:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2290
LABELV $2288
line 4261
;4260:			}
;4261:		}
LABELV $2285
line 4263
;4262:	
;4263:		if (attackStr == FORCE_LEVEL_1 && !self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] &&
ADDRLP4 64
CNSTI4 1
ASGNI4
ADDRFP4 20
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $2293
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $2293
ADDRLP4 64
INDIRI4
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 3
GEI4 $2293
line 4265
;4264:			Q_irand(1, 40, qfalse, 1) < 3)
;4265:		{ //if I have no defense level at all then I might be unable to block a level 1 attack (but very rarely)
line 4266
;4266:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2293
line 4268
;4267:		}
;4268:	}
LABELV $2277
line 4270
;4269:
;4270:	if (SaberAttacking(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 SaberAttacking
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $2295
line 4271
;4271:	{ //attacking, can't block now
line 4272
;4272:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2295
line 4275
;4273:	}
;4274:
;4275:	if (self->client->ps.saberMove != LS_READY &&
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
EQI4 $2297
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2297
line 4277
;4276:		!self->client->ps.saberBlocking)
;4277:	{
line 4278
;4278:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2297
line 4281
;4279:	}
;4280:
;4281:	if (self->client->ps.saberBlockTime >= nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $2299
line 4282
;4282:	{
line 4283
;4283:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2299
line 4286
;4284:	}
;4285:
;4286:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2301
line 4287
;4287:	{
line 4288
;4288:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2301
line 4291
;4289:	}
;4290:
;4291:	if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2303
line 4292
;4292:	{
line 4294
;4293:#ifdef G2_COLLISION_ENABLED
;4294:		if (g_saberGhoul2Collision.integer && jk2version != VERSION_1_02)
ADDRGP4 g_saberGhoul2Collision+12
INDIRI4
CNSTI4 0
EQI4 $2305
ADDRGP4 jk2version
INDIRI4
CNSTI4 2
EQI4 $2305
line 4295
;4295:		{
line 4296
;4296:			blockFactor = 0.3f;
ADDRLP4 0
CNSTF4 1050253722
ASGNF4
line 4297
;4297:		}
ADDRGP4 $2304
JUMPV
LABELV $2305
line 4299
;4298:		else
;4299:		{
line 4300
;4300:			blockFactor = 0.05f;
ADDRLP4 0
CNSTF4 1028443341
ASGNF4
line 4301
;4301:		}
line 4305
;4302:#else
;4303:		blockFactor = 0.05f;
;4304:#endif
;4305:	}
ADDRGP4 $2304
JUMPV
LABELV $2303
line 4306
;4306:	else if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2308
line 4307
;4307:	{
line 4308
;4308:		blockFactor = 0.6f;
ADDRLP4 0
CNSTF4 1058642330
ASGNF4
line 4309
;4309:	}
ADDRGP4 $2309
JUMPV
LABELV $2308
line 4310
;4310:	else if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1008
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2310
line 4311
;4311:	{
line 4312
;4312:		blockFactor = 0.9f;
ADDRLP4 0
CNSTF4 1063675494
ASGNF4
line 4313
;4313:	}
ADDRGP4 $2311
JUMPV
LABELV $2310
line 4315
;4314:	else
;4315:	{ //for now we just don't get to autoblock with no def
line 4316
;4316:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2311
LABELV $2309
LABELV $2304
line 4319
;4317:	}
;4318:
;4319:	if (thrownSaber)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $2312
line 4320
;4320:	{
line 4321
;4321:		blockFactor -= 0.25f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 4322
;4322:	}
LABELV $2312
line 4324
;4323:
;4324:	if (attackStr && jk2gameplay != VERSION_1_02)
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $2314
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $2314
line 4325
;4325:	{ //blocking a saber, not a projectile.
line 4326
;4326:		blockFactor -= 0.25f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 4327
;4327:	}
LABELV $2314
line 4329
;4328:
;4329:	if (!InFront( point, self->client->ps.origin, self->client->ps.viewangles, blockFactor )) //orig 0.2f
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $2316
line 4330
;4330:	{
line 4331
;4331:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $2241
JUMPV
LABELV $2316
line 4334
;4332:	}
;4333:
;4334:	if (projectile || jk2gameplay == VERSION_1_02)
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $2320
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $2318
LABELV $2320
line 4335
;4335:	{
line 4336
;4336:		WP_SaberBlockNonRandom(self, point, projectile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 WP_SaberBlockNonRandom
CALLV
pop
line 4337
;4337:	}
LABELV $2318
line 4338
;4338:	return 1;
CNSTI4 1
RETI4
LABELV $2241
endproc WP_SaberCanBlock 76 16
export HasSetSaberOnly
proc HasSetSaberOnly 16 0
line 4342
;4339:}
;4340:
;4341:qboolean HasSetSaberOnly(void)
;4342:{
line 4343
;4343:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4344
;4344:	int wDisable = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 4346
;4345:
;4346:	if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $2322
line 4347
;4347:	{ //set to 0 
line 4348
;4348:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2321
JUMPV
LABELV $2322
line 4351
;4349:	}
;4350:
;4351:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $2325
line 4352
;4352:	{
line 4353
;4353:		wDisable = g_duelWeaponDisable.integer;
ADDRLP4 4
ADDRGP4 g_duelWeaponDisable+12
INDIRI4
ASGNI4
line 4354
;4354:	}
ADDRGP4 $2331
JUMPV
LABELV $2325
line 4356
;4355:	else
;4356:	{
line 4357
;4357:		wDisable = g_weaponDisable.integer;
ADDRLP4 4
ADDRGP4 g_weaponDisable+12
INDIRI4
ASGNI4
line 4358
;4358:	}
ADDRGP4 $2331
JUMPV
LABELV $2330
line 4361
;4359:
;4360:	while (i < WP_NUM_WEAPONS)
;4361:	{
line 4362
;4362:		if (!(wDisable & (1 << i)) &&
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
ADDRLP4 12
INDIRI4
NEI4 $2333
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $2333
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $2333
line 4364
;4363:			i != WP_SABER && i != WP_NONE)
;4364:		{
line 4365
;4365:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2321
JUMPV
LABELV $2333
line 4368
;4366:		}
;4367:
;4368:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4369
;4369:	}
LABELV $2331
line 4360
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $2330
line 4371
;4370:
;4371:	return qtrue;
CNSTI4 1
RETI4
LABELV $2321
endproc HasSetSaberOnly 16 0
import fabsf
import animTable
import PM_SaberDeflectionForQuad
import PM_SaberBounceForAttack
import PM_SaberInBounce
import PM_SaberInBrokenParry
import PM_SaberInDeflect
import PM_SaberInTransition
import DF_GetRunFlags
import InFront
import botstates
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
import forceJumpStrength
import forceJumpHeightMax
import forceJumpHeight
import g_MaxHolocronCarry
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
import PM_StepSlideMove
import PM_SlideMove
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
import WP_ForcePowerStop
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
LABELV $2140
byte 1 77
byte 1 111
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2134
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
LABELV $1693
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
LABELV $1689
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1553
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 114
byte 1 111
byte 1 107
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 114
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $1547
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 44
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 114
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $1541
byte 1 69
byte 1 113
byte 1 117
byte 1 97
byte 1 108
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1531
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 114
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 10
byte 1 0
align 1
LABELV $1508
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 32
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1495
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $1489
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 114
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $1477
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 97
byte 1 119
byte 1 97
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $1463
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 44
byte 1 32
byte 1 100
byte 1 105
byte 1 100
byte 1 32
byte 1 66
byte 1 76
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 68
byte 1 95
byte 1 65
byte 1 84
byte 1 75
byte 1 95
byte 1 66
byte 1 79
byte 1 85
byte 1 78
byte 1 67
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $748
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 118
byte 1 115
byte 1 46
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $719
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 118
byte 1 115
byte 1 46
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $352
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
LABELV $350
byte 1 108
byte 1 111
byte 1 119
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
LABELV $348
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
LABELV $190
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
byte 1 104
byte 1 117
byte 1 109
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $189
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
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $188
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
byte 1 111
byte 1 102
byte 1 102
byte 1 113
byte 1 117
byte 1 105
byte 1 99
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $187
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
byte 1 115
byte 1 112
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $167
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 97
byte 1 98
byte 1 101
byte 1 114
byte 1 0
