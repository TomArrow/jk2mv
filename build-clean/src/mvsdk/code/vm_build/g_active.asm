data
align 4
LABELV nullUserCmd
byte 4 0
skip 24
export G_UserCmdBuffer_NewFrame
code
proc G_UserCmdBuffer_NewFrame 4 0
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_active.c"
line 10
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:userCmdBuffer_t		userCmdBuffer[MAX_CLIENTS];
;7:
;8:static usercmd_t nullUserCmd={ 0 };
;9:
;10:void G_UserCmdBuffer_NewFrame() {
line 12
;11:	int i;
;12:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $124
JUMPV
LABELV $121
line 13
;13:		userCmdBuffer[i].msecThisFrame = 0;
CNSTI4 28684
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 userCmdBuffer+28680
ADDP4
CNSTI4 0
ASGNI4
line 14
;14:	}
LABELV $122
line 12
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $124
ADDRLP4 0
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $121
line 15
;15:}
LABELV $120
endproc G_UserCmdBuffer_NewFrame 4 0
export P_SetTwitchInfo
proc P_SetTwitchInfo 16 0
line 22
;16:
;17:qboolean PM_SaberInTransition( int move );
;18:qboolean PM_SaberInStart( int move );
;19:qboolean PM_SaberInReturn( int move );
;20:
;21:void P_SetTwitchInfo(gclient_t	*client)
;22:{
line 23
;23:	client->ps.painTime = LEVELTIME(client);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $132
ADDRLP4 8
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $132
ADDRFP4 0
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $134
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $135
JUMPV
LABELV $134
ADDRLP4 4
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $135
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $133
JUMPV
LABELV $132
ADDRLP4 0
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $133
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 24
;24:	client->ps.painDirection ^= 1; // not even sent over the network, kek
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 25
;25:}
LABELV $127
endproc P_SetTwitchInfo 16 0
export P_DamageFeedback
proc P_DamageFeedback 64 12
line 37
;26:
;27:/*
;28:===============
;29:G_DamageFeedback
;30:
;31:Called just before a snapshot is sent to the given player.
;32:Totals up all damage and generates both the player_state_t
;33:damage values to that client for pain blends and kicks, and
;34:global pain sound events for all clients.
;35:===============
;36:*/
;37:void P_DamageFeedback( gentity_t *player ) {
line 41
;38:	gclient_t	*client;
;39:	float	count;
;40:	vec3_t	angles;
;41:	int nowTime = LEVELTIME(player->client);
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
EQU4 $141
ADDRLP4 32
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $141
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $143
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
ADDRGP4 $144
JUMPV
LABELV $143
ADDRLP4 28
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $144
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $142
JUMPV
LABELV $141
ADDRLP4 24
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $142
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 46
;42:
;43:	// all of this stuff seems only relevant for cgame
;44:	// but pain_debounce_time is co-used by other stuff so lets put it in clientthink_real anyway when racemodeing
;45:
;46:	client = player->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 47
;47:	if ( client->ps.pm_type == PM_DEAD ) {
ADDRLP4 36
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $145
line 48
;48:		return;
ADDRGP4 $136
JUMPV
LABELV $145
line 52
;49:	}
;50:
;51:	// total points of damage shot at the player this frame
;52:	count = client->damage_blood + client->damage_armor;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 43624
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 43620
ADDP4
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 53
;53:	if ( count == 0 ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $147
line 54
;54:		return;		// didn't take any damage
ADDRGP4 $136
JUMPV
LABELV $147
line 57
;55:	}
;56:
;57:	if ( count > 255 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1132396544
LEF4 $149
line 58
;58:		count = 255;
ADDRLP4 4
CNSTF4 1132396544
ASGNF4
line 59
;59:	}
LABELV $149
line 65
;60:
;61:	// send the information to the client
;62:
;63:	// world damage (falling, slime, etc) uses a special code
;64:	// to make the blend blob centered instead of positional
;65:	if ( client->damage_fromWorld ) {
ADDRLP4 0
INDIRP4
CNSTI4 43644
ADDP4
INDIRI4
CNSTI4 0
EQI4 $151
line 66
;66:		client->ps.damagePitch = 255;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 255
ASGNI4
line 67
;67:		client->ps.damageYaw = 255;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 255
ASGNI4
line 69
;68:
;69:		client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 43644
ADDP4
CNSTI4 0
ASGNI4
line 70
;70:	} else {
ADDRGP4 $152
JUMPV
LABELV $151
line 71
;71:		vectoangles( client->damage_from, angles );
ADDRLP4 0
INDIRP4
CNSTI4 43632
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 72
;72:		client->ps.damagePitch = angles[PITCH]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 1132462080
ADDRLP4 12
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 73
;73:		client->ps.damageYaw = angles[YAW]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTF4 1132462080
ADDRLP4 12+4
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 74
;74:	}
LABELV $152
line 77
;75:
;76:	// play an apropriate pain sound
;77:	if ( (nowTime > player->pain_debounce_time) && !(player->flags & FL_GODMODE) ) {
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
ADDRLP4 44
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
LEI4 $154
ADDRLP4 44
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $154
line 80
;78:
;79:		// don't do more than two pain sounds a second
;80:		if (nowTime - client->ps.painTime < 500 ) {
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $156
line 81
;81:			return;
ADDRGP4 $136
JUMPV
LABELV $156
line 83
;82:		}
;83:		P_SetTwitchInfo(client); // defrag note:unless im mistaken, this is only used gameside in BG_AddPainTwitch, which is called in BG_G2PlayerAngles, which is actually never used
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 P_SetTwitchInfo
CALLV
pop
line 84
;84:		player->pain_debounce_time = nowTime + 700; // timer also used for sizzle and uh... EV_ROLL?!
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 85
;85:		G_AddEvent( player, EV_PAIN, player->health );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
CNSTI4 77
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 86
;86:		client->ps.damageEvent++;
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 88
;87:
;88:		if (client->damage_armor && !client->damage_blood)
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 43620
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $158
ADDRLP4 0
INDIRP4
CNSTI4 43624
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
NEI4 $158
line 89
;89:		{
line 90
;90:			client->ps.damageType = 1; //pure shields
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 1
ASGNI4
line 91
;91:		}
ADDRGP4 $159
JUMPV
LABELV $158
line 92
;92:		else if (client->damage_armor)
ADDRLP4 0
INDIRP4
CNSTI4 43620
ADDP4
INDIRI4
CNSTI4 0
EQI4 $160
line 93
;93:		{
line 94
;94:			client->ps.damageType = 2; //shields and health
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 2
ASGNI4
line 95
;95:		}
ADDRGP4 $161
JUMPV
LABELV $160
line 97
;96:		else
;97:		{
line 98
;98:			client->ps.damageType = 0; //pure health
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 99
;99:		}
LABELV $161
LABELV $159
line 100
;100:	}
LABELV $154
line 103
;101:
;102:
;103:	client->ps.damageCount = count;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 108
;104:
;105:	//
;106:	// clear totals
;107:	//
;108:	client->damage_blood = 0;
ADDRLP4 0
INDIRP4
CNSTI4 43624
ADDP4
CNSTI4 0
ASGNI4
line 109
;109:	client->damage_armor = 0;
ADDRLP4 0
INDIRP4
CNSTI4 43620
ADDP4
CNSTI4 0
ASGNI4
line 110
;110:	client->damage_knockback = 0;
ADDRLP4 0
INDIRP4
CNSTI4 43628
ADDP4
CNSTI4 0
ASGNI4
line 111
;111:}
LABELV $136
endproc P_DamageFeedback 64 12
export P_WorldEffects
proc P_WorldEffects 60 32
line 122
;112:
;113:
;114:
;115:/*
;116:=============
;117:P_WorldEffects
;118:
;119:Check for lava / slime contents and drowning
;120:=============
;121:*/
;122:void P_WorldEffects( gentity_t *ent ) {
line 125
;123:	qboolean	envirosuit;
;124:	int			waterlevel;
;125:	int			nowTime = LEVELTIME(ent->client);
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
EQU4 $167
ADDRLP4 20
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $167
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $169
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
ADDRGP4 $170
JUMPV
LABELV $169
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $170
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
ADDRGP4 $168
JUMPV
LABELV $167
ADDRLP4 12
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $168
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 127
;126:
;127:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $171
line 128
;128:		ent->client->airOutTime = nowTime + 12000;	// don't need air
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43712
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 129
;129:		return;
ADDRGP4 $162
JUMPV
LABELV $171
line 132
;130:	}
;131:
;132:	waterlevel = ent->waterlevel;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
ASGNI4
line 134
;133:
;134:	envirosuit = ent->client->ps.powerups[PW_BATTLESUIT] > nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 352
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $174
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $174
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $175
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 139
;135:
;136:	//
;137:	// check for drowning
;138:	//
;139:	if ( waterlevel == 3 ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $176
line 141
;140:		// envirosuit give air
;141:		if ( envirosuit ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $178
line 142
;142:			ent->client->airOutTime = nowTime + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43712
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 143
;143:		}
LABELV $178
line 146
;144:
;145:		// if out of air, start drowning
;146:		if ( ent->client->airOutTime < nowTime) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43712
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $177
line 148
;147:			// drown!
;148:			ent->client->airOutTime += 1000;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43712
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 149
;149:			if ( ent->health > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
LEI4 $177
line 150
;150:				int damageFlags = DAMAGE_NO_ARMOR;
ADDRLP4 32
CNSTI4 2
ASGNI4
line 152
;151:
;152:				if (ent->client->sess.raceMode) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $184
line 153
;153:					if (ent->client->sess.raceStyle.runFlags & RFL_LAVAPROTECT) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $186
line 154
;154:						damageFlags |= FAKE_DAMAGE_IN_RACEMODE;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 155
;155:					}
ADDRGP4 $187
JUMPV
LABELV $186
line 156
;156:					else {
line 157
;157:						damageFlags |= DAMAGE_IN_RACEMODE;
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 158
;158:					}
LABELV $187
line 159
;159:				}
LABELV $184
line 162
;160:
;161:				// take more damage the longer underwater
;162:				ent->damage += 2;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 163
;163:				if (ent->damage > 15)
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
CNSTI4 15
LEI4 $188
line 164
;164:					ent->damage = 15;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 15
ASGNI4
LABELV $188
line 167
;165:
;166:				// play a gurp sound instead of a normal pain sound
;167:				if (ent->health <= ent->damage) {
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
GTI4 $190
line 168
;168:					G_Sound(ent, CHAN_VOICE, G_SoundIndex(/*"*drown.wav"*/"sound/player/gurp1.wav"));
ADDRGP4 $192
ARGP4
ADDRLP4 44
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 169
;169:				} else if (rand()&1) {
ADDRGP4 $191
JUMPV
LABELV $190
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $193
line 170
;170:					G_Sound(ent, CHAN_VOICE, G_SoundIndex("sound/player/gurp1.wav"));
ADDRGP4 $192
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 171
;171:				} else {
ADDRGP4 $194
JUMPV
LABELV $193
line 172
;172:					G_Sound(ent, CHAN_VOICE, G_SoundIndex("sound/player/gurp2.wav"));
ADDRGP4 $195
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 173
;173:				}
LABELV $194
LABELV $191
line 176
;174:
;175:				// don't play a normal pain sound
;176:				ent->pain_debounce_time = nowTime + 200;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 178
;177:
;178:				G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
CNSTP4 0
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
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
ADDRLP4 48
INDIRP4
CNSTI4 704
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
CNSTI4 29
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 180
;179:					ent->damage, damageFlags, MOD_WATER);
;180:			}
line 181
;181:		}
line 182
;182:	} else {
ADDRGP4 $177
JUMPV
LABELV $176
line 183
;183:		ent->client->airOutTime = nowTime + 12000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43712
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 184
;184:		ent->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 2
ASGNI4
line 185
;185:	}
LABELV $177
line 190
;186:
;187:	//
;188:	// check for sizzle damage (move to pmove?)
;189:	//
;190:	if (waterlevel && 
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $196
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 131074
BANDI4
ADDRLP4 28
INDIRI4
EQI4 $196
line 191
;191:		(ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
line 192
;192:		if (ent->health > 0
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
LEI4 $198
ADDRLP4 32
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GTI4 $198
line 193
;193:			&& ent->pain_debounce_time <= nowTime) {
line 195
;194:
;195:			if ( envirosuit ) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $200
line 196
;196:				G_AddEvent( ent, EV_POWERUP_BATTLESUIT, 0 );
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
line 197
;197:			} else {
ADDRGP4 $201
JUMPV
LABELV $200
line 198
;198:				int damageFlags = ent->client && ent->client->sess.raceMode && (ent->client->sess.raceStyle.runFlags & RFL_LAVAPROTECT) ? FAKE_DAMAGE_IN_RACEMODE : DAMAGE_IN_RACEMODE;
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
EQU4 $203
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $203
ADDRLP4 44
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 1024
BANDI4
ADDRLP4 48
INDIRI4
EQI4 $203
ADDRLP4 40
CNSTI4 8192
ASGNI4
ADDRGP4 $204
JUMPV
LABELV $203
ADDRLP4 40
CNSTI4 4096
ASGNI4
LABELV $204
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
line 200
;199:				//if (!ent->client || !ent->client->sess.raceMode) { //No sizzle dmg in racemode?
;200:					if (ent->watertype & CONTENTS_LAVA) {
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $205
line 201
;201:						G_Damage(ent, NULL, NULL, NULL, NULL,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
CNSTP4 0
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
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
CNSTI4 30
ADDRLP4 4
INDIRI4
MULI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 31
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 203
;202:							30 * waterlevel, damageFlags, MOD_LAVA);
;203:					}
LABELV $205
line 205
;204:
;205:					if (ent->watertype & CONTENTS_SLIME) {
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $207
line 206
;206:						G_Damage(ent, NULL, NULL, NULL, NULL,
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
CNSTP4 0
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
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
CNSTI4 10
ADDRLP4 4
INDIRI4
MULI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 30
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 208
;207:							10 * waterlevel, damageFlags, MOD_SLIME);
;208:					}
LABELV $207
line 210
;209:				//}
;210:			}
LABELV $201
line 211
;211:		}
LABELV $198
line 212
;212:	}
LABELV $196
line 213
;213:}
LABELV $162
endproc P_WorldEffects 60 32
export DoImpact
proc DoImpact 116 32
line 222
;214:
;215:
;216:
;217:
;218:
;219://==============================================================
;220:extern void G_ApplyKnockback( gentity_t *targ, vec3_t newDir, float knockback );
;221:void DoImpact( gentity_t *self, gentity_t *other, qboolean damageSelf )
;222:{
line 226
;223:	float magnitude, my_mass;
;224:	vec3_t	velocity;
;225:	int cont;
;226:	int nowTime = LEVELTIME(self->client);
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
EQU4 $214
ADDRLP4 36
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $214
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $216
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
ADDRGP4 $217
JUMPV
LABELV $216
ADDRLP4 32
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $217
ADDRLP4 28
ADDRLP4 32
INDIRI4
ASGNI4
ADDRGP4 $215
JUMPV
LABELV $214
ADDRLP4 28
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $215
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 228
;227:
;228:	if( self->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $218
line 229
;229:	{
line 230
;230:		VectorCopy( self->client->ps.velocity, velocity );
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 231
;231:		my_mass = self->mass;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ASGNF4
line 232
;232:	}
ADDRGP4 $219
JUMPV
LABELV $218
line 234
;233:	else 
;234:	{
line 235
;235:		VectorCopy( self->s.pos.trDelta, velocity );
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 236
;236:		if ( self->s.pos.trType == TR_GRAVITY )
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
NEI4 $220
line 237
;237:		{
line 238
;238:			velocity[2] -= 0.25f * g_gravity.value;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
CNSTF4 1048576000
ADDRGP4 g_gravity+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 239
;239:		}
LABELV $220
line 240
;240:		if( !self->mass )
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
CNSTF4 0
NEF4 $224
line 241
;241:		{
line 242
;242:			my_mass = 1;
ADDRLP4 20
CNSTF4 1065353216
ASGNF4
line 243
;243:		}
ADDRGP4 $225
JUMPV
LABELV $224
line 244
;244:		else if ( self->mass <= 10 )
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
CNSTF4 1092616192
GTF4 $226
line 245
;245:		{
line 246
;246:			my_mass = 10;
ADDRLP4 20
CNSTF4 1092616192
ASGNF4
line 247
;247:		}
ADDRGP4 $227
JUMPV
LABELV $226
line 249
;248:		else
;249:		{
line 250
;250:			my_mass = self->mass;///10;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ASGNF4
line 251
;251:		}
LABELV $227
LABELV $225
line 252
;252:	}
LABELV $219
line 254
;253:
;254:	magnitude = VectorLength( velocity ) * my_mass / 10;
ADDRLP4 8
ARGP4
ADDRLP4 40
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 40
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
CNSTF4 1092616192
DIVF4
ASGNF4
line 267
;255:
;256:	/*
;257:	if(pointcontents(self.absmax)==CONTENT_WATER)//FIXME: or other watertypes
;258:		magnitude/=3;							//water absorbs 2/3 velocity
;259:
;260:	if(self.classname=="barrel"&&self.aflag)//rolling barrels are made for impacts!
;261:		magnitude*=3;
;262:
;263:	if(self.frozen>0&&magnitude<300&&self.flags&FL_ONGROUND&&loser==world&&self.velocity_z<-20&&self.last_onground+0.3<time)
;264:		magnitude=300;
;265:	*/
;266:
;267:	if ( !self->client || self->client->ps.lastOnGround+300< nowTime || ( self->client->ps.lastOnGround+100 < nowTime && other->material >= MAT_GLASS ) )
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
EQU4 $231
ADDRLP4 48
ADDRLP4 44
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 300
ADDI4
ADDRLP4 4
INDIRI4
LTI4 $231
ADDRLP4 48
INDIRI4
CNSTI4 100
ADDI4
ADDRLP4 4
INDIRI4
GEI4 $228
ADDRFP4 4
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CNSTI4 1
LTI4 $228
LABELV $231
line 268
;268:	{
line 270
;269:		vec3_t dir1, dir2;
;270:		float force = 0, dot;
ADDRLP4 56
CNSTF4 0
ASGNF4
line 272
;271:
;272:		if ( other->material >= MAT_GLASS )
ADDRFP4 4
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CNSTI4 1
LTI4 $232
line 273
;273:			magnitude *= 2;
ADDRLP4 0
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
LABELV $232
line 276
;274:
;275:		//damage them
;276:		if ( magnitude >= 100 && other->s.number < ENTITYNUM_WORLD )
ADDRLP4 0
INDIRF4
CNSTF4 1120403456
LTF4 $234
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 1022
GEI4 $234
line 277
;277:		{
line 278
;278:			VectorCopy( velocity, dir1 );
ADDRLP4 72
ADDRLP4 8
INDIRB
ASGNB 12
line 279
;279:			VectorNormalize( dir1 );
ADDRLP4 72
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 280
;280:			if( VectorCompare( other->r.currentOrigin, vec3_origin ) )
ADDRFP4 4
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 88
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $236
line 281
;281:			{//a brush with no origin
line 282
;282:				VectorCopy ( dir1, dir2 );
ADDRLP4 60
ADDRLP4 72
INDIRB
ASGNB 12
line 283
;283:			}
ADDRGP4 $237
JUMPV
LABELV $236
line 285
;284:			else
;285:			{
line 286
;286:				VectorSubtract( other->r.currentOrigin, self->r.currentOrigin, dir2 );
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 96
CNSTI4 368
ASGNI4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 92
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
ADDRLP4 100
INDIRP4
ADDRLP4 96
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 104
CNSTI4 372
ASGNI4
ADDRLP4 60+4
ADDRLP4 92
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
ADDRLP4 100
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 108
CNSTI4 376
ASGNI4
ADDRLP4 60+8
ADDRFP4 4
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 287
;287:				VectorNormalize( dir2 );
ADDRLP4 60
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 288
;288:			}
LABELV $237
line 290
;289:
;290:			dot = DotProduct( dir1, dir2 );
ADDRLP4 84
ADDRLP4 72
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ADDRLP4 72+4
INDIRF4
ADDRLP4 60+4
INDIRF4
MULF4
ADDF4
ADDRLP4 72+8
INDIRF4
ADDRLP4 60+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 292
;291:
;292:			if ( dot >= 0.2 )
ADDRLP4 84
INDIRF4
CNSTF4 1045220557
LTF4 $244
line 293
;293:			{
line 294
;294:				force = dot;
ADDRLP4 56
ADDRLP4 84
INDIRF4
ASGNF4
line 295
;295:			}
ADDRGP4 $245
JUMPV
LABELV $244
line 297
;296:			else
;297:			{
line 298
;298:				force = 0;
ADDRLP4 56
CNSTF4 0
ASGNF4
line 299
;299:			}
LABELV $245
line 301
;300:
;301:			force *= (magnitude/50);
ADDRLP4 56
ADDRLP4 56
INDIRF4
ADDRLP4 0
INDIRF4
CNSTF4 1112014848
DIVF4
MULF4
ASGNF4
line 303
;302:
;303:			cont = trap_PointContents( other->r.absmax, other->s.number );
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 356
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 96
INDIRI4
ASGNI4
line 304
;304:			if( (cont&CONTENTS_WATER) )//|| (self.classname=="barrel"&&self.aflag))//FIXME: or other watertypes
ADDRLP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $246
line 305
;305:			{
line 306
;306:				force /= 3;							//water absorbs 2/3 velocity
ADDRLP4 56
ADDRLP4 56
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 307
;307:			}
LABELV $246
line 314
;308:
;309:			/*
;310:			if(self.frozen>0&&force>10)
;311:				force=10;
;312:			*/
;313:
;314:			if( ( force >= 1 && other->s.number != 0 ) || force >= 10)
ADDRLP4 56
INDIRF4
CNSTF4 1065353216
LTF4 $251
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $250
LABELV $251
ADDRLP4 56
INDIRF4
CNSTF4 1092616192
LTF4 $248
LABELV $250
line 315
;315:			{
line 323
;316:	/*			
;317:				dprint("Damage other (");
;318:				dprint(loser.classname);
;319:				dprint("): ");
;320:				dprint(ftos(force));
;321:				dprint("\n");
;322:	*/
;323:				if ( other->r.svFlags & SVF_GLASS_BRUSH )
ADDRFP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 134217728
BANDI4
CNSTI4 0
EQI4 $252
line 324
;324:				{
line 325
;325:					other->splashRadius = (float)(self->r.maxs[0] - self->r.mins[0])/4.0f;
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 100
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
SUBF4
CNSTF4 1082130432
DIVF4
CVFI4 4
ASGNI4
line 326
;326:				}
LABELV $252
line 327
;327:				if ( other->takedamage )
ADDRFP4 4
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $254
line 328
;328:				{
line 329
;329:					G_Damage( other, self, self, velocity, self->r.currentOrigin, force, DAMAGE_NO_ARMOR, MOD_CRUSH);//FIXME: MOD_IMPACT
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 56
INDIRF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 330
;330:				}
ADDRGP4 $255
JUMPV
LABELV $254
line 332
;331:				else
;332:				{
line 333
;333:					G_ApplyKnockback( other, dir2, force );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 56
INDIRF4
ARGF4
ADDRGP4 G_ApplyKnockback
CALLV
pop
line 334
;334:				}
LABELV $255
line 335
;335:			}
LABELV $248
line 336
;336:		}
LABELV $234
line 338
;337:
;338:		if ( damageSelf && self->takedamage )
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $256
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $256
line 339
;339:		{
line 342
;340:			//Now damage me
;341:			//FIXME: more lenient falling damage, especially for when driving a vehicle
;342:			if ( self->client && self->client->ps.fd.forceJumpZStart )
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
EQU4 $258
ADDRLP4 92
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
CNSTF4 0
EQF4 $258
line 343
;343:			{//we were force-jumping
line 344
;344:				if ( self->r.currentOrigin[2] >= self->client->ps.fd.forceJumpZStart )
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
LTF4 $260
line 345
;345:				{//we landed at same height or higher than we landed
line 346
;346:					magnitude = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 347
;347:				}
ADDRGP4 $261
JUMPV
LABELV $260
line 349
;348:				else
;349:				{//FIXME: take off some of it, at least?
line 350
;350:					magnitude = (self->client->ps.fd.forceJumpZStart-self->r.currentOrigin[2])/3;
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 100
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1092
ADDP4
INDIRF4
ADDRLP4 100
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 351
;351:				}
LABELV $261
line 352
;352:			}
LABELV $258
line 354
;353:			//if(self.classname!="monster_mezzoman"&&self.netname!="spider")//Cats always land on their feet
;354:				if( ( magnitude >= 100 + self->health && self->s.number != 0 && self->s.weapon != WP_SABER ) || ( magnitude >= 700 ) )//&& self.safe_time < level.time ))//health here is used to simulate structural integrity
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
LTF4 $266
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $266
ADDRLP4 96
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $264
LABELV $266
ADDRLP4 0
INDIRF4
CNSTF4 1143930880
LTF4 $262
LABELV $264
line 355
;355:				{
line 356
;356:					if ( (self->s.weapon == WP_SABER || self->s.number == 0) && self->client && self->client->ps.groundEntityNum < ENTITYNUM_NONE && magnitude < 1000 )
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
EQI4 $269
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $267
LABELV $269
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $267
ADDRLP4 104
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
GEI4 $267
ADDRLP4 0
INDIRF4
CNSTF4 1148846080
GEF4 $267
line 357
;357:					{//players and jedi take less impact damage
line 359
;358:						//allow for some lenience on high falls
;359:						magnitude /= 2;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 366
;360:						/*
;361:						if ( self.absorb_time >= time )//crouching on impact absorbs 1/2 the damage
;362:						{
;363:							magnitude/=2;
;364:						}
;365:						*/
;366:					}
LABELV $267
line 367
;367:					magnitude /= 40;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1109393408
DIVF4
ASGNF4
line 368
;368:					magnitude = magnitude - force/2;//If damage other, subtract half of that damage off of own injury
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 56
INDIRF4
CNSTF4 1073741824
DIVF4
SUBF4
ASGNF4
line 369
;369:					if ( magnitude >= 1 )
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
LTF4 $270
line 370
;370:					{
line 383
;371:		//FIXME: Put in a thingtype impact sound function
;372:		/*					
;373:						dprint("Damage self (");
;374:						dprint(self.classname);
;375:						dprint("): ");
;376:						dprint(ftos(magnitude));
;377:						dprint("\n");
;378:		*/
;379:						/*
;380:						if ( self.classname=="player_sheep "&& self.flags&FL_ONGROUND && self.velocity_z > -50 )
;381:							return;
;382:						*/
;383:						G_Damage( self, NULL, NULL, NULL, self->r.currentOrigin, magnitude/2, DAMAGE_NO_ARMOR, MOD_FALLING );//FIXME: MOD_IMPACT
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 112
CNSTP4 0
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 108
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
DIVF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 34
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 384
;384:					}
LABELV $270
line 385
;385:				}
LABELV $262
line 386
;386:		}
LABELV $256
line 397
;387:
;388:		//FIXME: slow my velocity some?
;389:
;390:		// NOTENOTE We don't use lastimpact as of yet
;391://		self->lastImpact = level.time;
;392:
;393:		/*
;394:		if(self.flags&FL_ONGROUND)
;395:			self.last_onground=time;
;396:		*/
;397:	}
LABELV $228
line 398
;398:}
LABELV $209
endproc DoImpact 116 32
export G_SetClientSound
proc G_SetClientSound 8 0
line 405
;399:
;400:/*
;401:===============
;402:G_SetClientSound
;403:===============
;404:*/
;405:void G_SetClientSound( gentity_t *ent ) {
line 406
;406:	if (ent->waterlevel && (ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $273
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 131074
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $273
line 407
;407:		ent->client->ps.loopSound = level.snd_fry;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 level+232
INDIRI4
ASGNI4
line 408
;408:	} else {
ADDRGP4 $274
JUMPV
LABELV $273
line 409
;409:		ent->client->ps.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 0
ASGNI4
line 410
;410:	}
LABELV $274
line 411
;411:}
LABELV $272
endproc G_SetClientSound 8 0
export ClientImpacts
proc ClientImpacts 1100 12
line 422
;412:
;413:
;414:
;415://==============================================================
;416:
;417:/*
;418:==============
;419:ClientImpacts
;420:==============
;421:*/
;422:void ClientImpacts( gentity_t *ent, pmove_t *pm ) {
line 427
;423:	int		i, j;
;424:	trace_t	trace;
;425:	gentity_t	*other;
;426:
;427:	memset( &trace, 0, sizeof( trace ) );
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1080
ARGU4
ADDRGP4 memset
CALLP4
pop
line 428
;428:	for (i=0 ; i<pm->numtouch ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $280
JUMPV
LABELV $277
line 429
;429:		for (j=0 ; j<i ; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $284
JUMPV
LABELV $281
line 430
;430:			if (pm->touchents[j] == pm->touchents[i] ) {
ADDRLP4 1092
CNSTI4 2
ASGNI4
ADDRLP4 1096
ADDRFP4 4
INDIRP4
CNSTI4 88
ADDP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 1092
INDIRI4
LSHI4
ADDRLP4 1096
INDIRP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 1092
INDIRI4
LSHI4
ADDRLP4 1096
INDIRP4
ADDP4
INDIRI4
NEI4 $285
line 431
;431:				break;
ADDRGP4 $283
JUMPV
LABELV $285
line 433
;432:			}
;433:		}
LABELV $282
line 429
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $284
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $281
LABELV $283
line 434
;434:		if (j != i) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $287
line 435
;435:			continue;	// duplicated
ADDRGP4 $278
JUMPV
LABELV $287
line 437
;436:		}
;437:		other = &g_entities[ pm->touchents[i] ];
ADDRLP4 8
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 439
;438:
;439:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 1092
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $289
ADDRLP4 1092
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $289
line 440
;440:			ent->touch( ent, other, &trace );
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CALLV
pop
line 441
;441:		}
LABELV $289
line 443
;442:
;443:		if ( !other->touch ) {
ADDRLP4 8
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $291
line 444
;444:			continue;
ADDRGP4 $278
JUMPV
LABELV $291
line 447
;445:		}
;446:
;447:		other->touch( other, ent, &trace );
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CALLV
pop
line 448
;448:	}
LABELV $278
line 428
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $280
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
LTI4 $277
line 450
;449:
;450:}
LABELV $276
endproc ClientImpacts 1100 12
proc int_cmp 8 0
line 452
;451:
;452:static int int_cmp(const void* a, const void* b) {
line 453
;453:	int* aa = (int*)a;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 454
;454:	int* bb = (int*)b;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 456
;455:
;456:	if (*aa > *bb) return 1;
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
LEI4 $294
CNSTI4 1
RETI4
ADDRGP4 $293
JUMPV
LABELV $294
line 457
;457:	else if (*aa == *bb) return 0;
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
NEI4 $296
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $296
line 458
;458:	else return -1;
CNSTI4 -1
RETI4
LABELV $293
endproc int_cmp 8 0
data
align 4
LABELV $299
byte 4 1109393408
byte 4 1109393408
byte 4 1112539136
align 4
LABELV $300
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV $301
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
export G_TouchTriggers
code
proc G_TouchTriggers 13660 28
line 469
;459:}
;460:
;461:/*
;462:============
;463:G_TouchTriggers
;464:
;465:Find all trigger entities that ent's current position touches.
;466:Spectators will only interact with teleporters.
;467:============
;468:*/
;469:void	G_TouchTriggers( gentity_t *ent ) {
line 482
;470:	int			i, num, numTraced;
;471:	int			touch[MAX_GENTITIES];
;472:	qboolean	touchViaTrace[MAX_GENTITIES];
;473:	gentity_t	*hit;
;474:	trace_t		trace;
;475:	vec3_t		mins, maxs;
;476:	vec3_t		minsPrev, maxsPrev;
;477:	vec3_t		minsTotal, maxsTotal;
;478:	vec3_t		minsPlayer, maxsPlayer;
;479:	static vec3_t	range = { 40, 40, 52 };
;480:	static vec3_t	playerMinsDefault = { -15, -15, DEFAULT_MINS_2 };
;481:	static vec3_t	playerMaxsDefault = { 15, 15, DEFAULT_MAXS_2 };
;482:	qboolean	robustTriggerEvaluation = qfalse;
ADDRLP4 5188
CNSTI4 0
ASGNI4
line 484
;483:	qboolean	isTraced;
;484:	int			nowTime = LEVELTIME(ent->client);
ADDRLP4 9404
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9404
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $306
ADDRLP4 9404
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $306
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $308
ADDRLP4 9400
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $309
JUMPV
LABELV $308
ADDRLP4 9400
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $309
ADDRLP4 9396
ADDRLP4 9400
INDIRI4
ASGNI4
ADDRGP4 $307
JUMPV
LABELV $306
ADDRLP4 9396
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $307
ADDRLP4 9364
ADDRLP4 9396
INDIRI4
ASGNI4
line 486
;485:
;486:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $310
line 487
;487:		return;
ADDRGP4 $298
JUMPV
LABELV $310
line 491
;488:	}
;489:
;490:	// dead clients don't activate triggers!
;491:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $312
line 492
;492:		return;
ADDRGP4 $298
JUMPV
LABELV $312
line 495
;493:	}
;494:
;495:	robustTriggerEvaluation = g_triggersRobust.integer && ent->client->prePmovePositionSet && !((ent->client->ps.eFlags ^ ent->client->prePmoveEFlags) & EF_TELEPORT_BIT);
ADDRLP4 9412
CNSTI4 0
ASGNI4
ADDRGP4 g_triggersRobust+12
INDIRI4
ADDRLP4 9412
INDIRI4
EQI4 $316
ADDRLP4 9416
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9416
INDIRP4
CNSTI4 43884
ADDP4
INDIRI4
ADDRLP4 9412
INDIRI4
EQI4 $316
ADDRLP4 9416
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 9416
INDIRP4
CNSTI4 43888
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
ADDRLP4 9412
INDIRI4
NEI4 $316
ADDRLP4 9408
CNSTI4 1
ASGNI4
ADDRGP4 $317
JUMPV
LABELV $316
ADDRLP4 9408
CNSTI4 0
ASGNI4
LABELV $317
ADDRLP4 5188
ADDRLP4 9408
INDIRI4
ASGNI4
line 500
;496:
;497:	// if we have a past position, move from that to the current one. 
;498:	// teleport bit check may not be needed since there doesn't appear to be any respawn/teleport
;499:	// between pmove and G_TouchTriggers, but that may change and i may have overlooked sth
;500:	if (robustTriggerEvaluation) {
ADDRLP4 5188
INDIRI4
CNSTI4 0
EQI4 $318
line 501
;501:		qboolean finished = qfalse;
ADDRLP4 9424
CNSTI4 0
ASGNI4
line 502
;502:		qboolean reverse = qfalse;
ADDRLP4 9420
CNSTI4 0
ASGNI4
line 503
;503:		qboolean needExtraCheck = qfalse;
ADDRLP4 9428
CNSTI4 0
ASGNI4
line 504
;504:		qboolean startIsEnd = VectorCompare(ent->client->postPmovePosition, ent->client->prePmovePosition);
ADDRLP4 9436
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9436
INDIRP4
CNSTI4 43848
ADDP4
ARGP4
ADDRLP4 9436
INDIRP4
CNSTI4 43812
ADDP4
ARGP4
ADDRLP4 9440
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 9432
ADDRLP4 9440
INDIRI4
ASGNI4
line 506
;505:
;506:		memset(&touchViaTrace, 0, sizeof(touchViaTrace));
ADDRLP4 5244
ARGP4
CNSTI4 0
ARGI4
CNSTU4 4096
ARGU4
ADDRGP4 memset
CALLP4
pop
line 510
;507:
;508:		// we want to find the smallest bounding box between last and current frame
;509:		// to minimize some weird crouch hacking to reach triggers with the trace trigger evaluataion
;510:		VectorMax(ent->client->prePmoveMins, ent->client->postPmoveMins, minsPlayer); 
ADDRLP4 9456
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9456
INDIRP4
CNSTI4 43824
ADDP4
INDIRF4
ADDRLP4 9456
INDIRP4
CNSTI4 43860
ADDP4
INDIRF4
LEF4 $325
ADDRLP4 9444
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43824
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $326
JUMPV
LABELV $325
ADDRLP4 9444
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43860
ADDP4
INDIRF4
ASGNF4
LABELV $326
ADDRLP4 9340
ADDRLP4 9444
INDIRF4
ASGNF4
ADDRLP4 9460
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9460
INDIRP4
CNSTI4 43828
ADDP4
INDIRF4
ADDRLP4 9460
INDIRP4
CNSTI4 43864
ADDP4
INDIRF4
LEF4 $327
ADDRLP4 9448
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43828
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $328
JUMPV
LABELV $327
ADDRLP4 9448
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43864
ADDP4
INDIRF4
ASGNF4
LABELV $328
ADDRLP4 9340+4
ADDRLP4 9448
INDIRF4
ASGNF4
ADDRLP4 9464
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9464
INDIRP4
CNSTI4 43832
ADDP4
INDIRF4
ADDRLP4 9464
INDIRP4
CNSTI4 43868
ADDP4
INDIRF4
LEF4 $329
ADDRLP4 9452
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43832
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $330
JUMPV
LABELV $329
ADDRLP4 9452
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43868
ADDP4
INDIRF4
ASGNF4
LABELV $330
ADDRLP4 9340+8
ADDRLP4 9452
INDIRF4
ASGNF4
line 511
;511:		VectorMin(ent->client->prePmoveMaxs, ent->client->postPmoveMaxs, maxsPlayer);
ADDRLP4 9480
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9480
INDIRP4
CNSTI4 43836
ADDP4
INDIRF4
ADDRLP4 9480
INDIRP4
CNSTI4 43872
ADDP4
INDIRF4
GEF4 $336
ADDRLP4 9468
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43836
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $337
JUMPV
LABELV $336
ADDRLP4 9468
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43872
ADDP4
INDIRF4
ASGNF4
LABELV $337
ADDRLP4 9352
ADDRLP4 9468
INDIRF4
ASGNF4
ADDRLP4 9484
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9484
INDIRP4
CNSTI4 43840
ADDP4
INDIRF4
ADDRLP4 9484
INDIRP4
CNSTI4 43876
ADDP4
INDIRF4
GEF4 $338
ADDRLP4 9472
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43840
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $339
JUMPV
LABELV $338
ADDRLP4 9472
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43876
ADDP4
INDIRF4
ASGNF4
LABELV $339
ADDRLP4 9352+4
ADDRLP4 9472
INDIRF4
ASGNF4
ADDRLP4 9488
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9488
INDIRP4
CNSTI4 43844
ADDP4
INDIRF4
ADDRLP4 9488
INDIRP4
CNSTI4 43880
ADDP4
INDIRF4
GEF4 $340
ADDRLP4 9476
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43844
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $341
JUMPV
LABELV $340
ADDRLP4 9476
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43880
ADDP4
INDIRF4
ASGNF4
LABELV $341
ADDRLP4 9352+8
ADDRLP4 9476
INDIRF4
ASGNF4
line 513
;512:
;513:		VectorCopy(minsPlayer,ent->client->triggerMins);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43896
ADDP4
ADDRLP4 9340
INDIRB
ASGNB 12
line 514
;514:		VectorCopy(maxsPlayer,ent->client->triggerMaxs);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43908
ADDP4
ADDRLP4 9352
INDIRB
ASGNB 12
line 516
;515:
;516:		VectorAdd(ent->client->postPmovePosition, minsPlayer, mins);
ADDRLP4 9492
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 5196
ADDRLP4 9492
INDIRP4
INDIRP4
CNSTI4 43848
ADDP4
INDIRF4
ADDRLP4 9340
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5196+4
ADDRLP4 9492
INDIRP4
INDIRP4
CNSTI4 43852
ADDP4
INDIRF4
ADDRLP4 9340+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5196+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43856
ADDP4
INDIRF4
ADDRLP4 9340+8
INDIRF4
ADDF4
ASGNF4
line 517
;517:		VectorAdd(ent->client->postPmovePosition, maxsPlayer, maxs);
ADDRLP4 9496
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 5208
ADDRLP4 9496
INDIRP4
INDIRP4
CNSTI4 43848
ADDP4
INDIRF4
ADDRLP4 9352
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5208+4
ADDRLP4 9496
INDIRP4
INDIRP4
CNSTI4 43852
ADDP4
INDIRF4
ADDRLP4 9352+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5208+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43856
ADDP4
INDIRF4
ADDRLP4 9352+8
INDIRF4
ADDF4
ASGNF4
line 518
;518:		VectorAdd(ent->client->prePmovePosition, minsPlayer, minsPrev);
ADDRLP4 9500
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 5220
ADDRLP4 9500
INDIRP4
INDIRP4
CNSTI4 43812
ADDP4
INDIRF4
ADDRLP4 9340
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5220+4
ADDRLP4 9500
INDIRP4
INDIRP4
CNSTI4 43816
ADDP4
INDIRF4
ADDRLP4 9340+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5220+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43820
ADDP4
INDIRF4
ADDRLP4 9340+8
INDIRF4
ADDF4
ASGNF4
line 519
;519:		VectorAdd(ent->client->prePmovePosition, maxsPlayer, maxsPrev);
ADDRLP4 9504
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 5232
ADDRLP4 9504
INDIRP4
INDIRP4
CNSTI4 43812
ADDP4
INDIRF4
ADDRLP4 9352
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5232+4
ADDRLP4 9504
INDIRP4
INDIRP4
CNSTI4 43816
ADDP4
INDIRF4
ADDRLP4 9352+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5232+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43820
ADDP4
INDIRF4
ADDRLP4 9352+8
INDIRF4
ADDF4
ASGNF4
line 520
;520:		num = 0;
ADDRLP4 5192
CNSTI4 0
ASGNI4
line 525
;521:
;522:		// if start == end, trace will return entitynum even if startsolid apparently, and we don't wanna mark triggers as traced
;523:		// if we are fully in them from start to finish
;524:		// also waste of time to do so many traces then..
;525:		if(!startIsEnd){
ADDRLP4 9432
INDIRI4
CNSTI4 0
NEI4 $358
ADDRGP4 $361
JUMPV
LABELV $360
line 527
;526:			qboolean somethingInTheWay; // either something is in the way (some solid) or we are inside the trigger. either requires an extra check in classical way.
;527:			while (!finished && num < MAX_GENTITIES) {
line 528
;528:				memset(&trace, 0, sizeof(trace));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1080
ARGU4
ADDRGP4 memset
CALLP4
pop
line 529
;529:				if (reverse) {
ADDRLP4 9420
INDIRI4
CNSTI4 0
EQI4 $363
line 534
;530:					// use precise non-epsilon trace here or we can end up with a hit if we are technically outside the bounds of 
;531:					// the target brush but the brush side is within 0.125f of the ending. this makes entitycontact return false
;532:					// even though we hit it. it also means that traces may only find something in one direction, but not the other,
;533:					// because this "advantage" goes only in one direction.
;534:					JP_TracePrecise(&trace, ent->client->postPmovePosition, minsPlayer, maxsPlayer, ent->client->prePmovePosition, ent->client->ps.clientNum, CONTENTS_TRIGGER|CONTENTS_SOLID);
ADDRLP4 8
ARGP4
ADDRLP4 9512
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9512
INDIRP4
CNSTI4 43848
ADDP4
ARGP4
ADDRLP4 9340
ARGP4
ADDRLP4 9352
ARGP4
ADDRLP4 9512
INDIRP4
CNSTI4 43812
ADDP4
ARGP4
ADDRLP4 9512
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 1025
ARGI4
ADDRGP4 JP_TracePrecise
CALLV
pop
line 535
;535:				}
ADDRGP4 $364
JUMPV
LABELV $363
line 536
;536:				else {
line 537
;537:					JP_TracePrecise(&trace, ent->client->prePmovePosition, minsPlayer, maxsPlayer, ent->client->postPmovePosition, ent->client->ps.clientNum, CONTENTS_TRIGGER | CONTENTS_SOLID);
ADDRLP4 8
ARGP4
ADDRLP4 9512
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9512
INDIRP4
CNSTI4 43812
ADDP4
ARGP4
ADDRLP4 9340
ARGP4
ADDRLP4 9352
ARGP4
ADDRLP4 9512
INDIRP4
CNSTI4 43848
ADDP4
ARGP4
ADDRLP4 9512
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 1025
ARGI4
ADDRGP4 JP_TracePrecise
CALLV
pop
line 538
;538:				}
LABELV $364
line 539
;539:				somethingInTheWay = trace.allsolid || trace.startsolid || (trace.contents & CONTENTS_SOLID);
ADDRLP4 9516
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 9516
INDIRI4
NEI4 $371
ADDRLP4 8+4
INDIRI4
ADDRLP4 9516
INDIRI4
NEI4 $371
ADDRLP4 8+48
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 9516
INDIRI4
EQI4 $368
LABELV $371
ADDRLP4 9512
CNSTI4 1
ASGNI4
ADDRGP4 $369
JUMPV
LABELV $368
ADDRLP4 9512
CNSTI4 0
ASGNI4
LABELV $369
ADDRLP4 9508
ADDRLP4 9512
INDIRI4
ASGNI4
line 540
;540:				if (trace.fraction < 1.0f && !somethingInTheWay) { //startsolid and allsolid don't return a valid entityNum
ADDRLP4 8+8
INDIRF4
CNSTF4 1065353216
GEF4 $372
ADDRLP4 9508
INDIRI4
CNSTI4 0
NEI4 $372
line 541
;541:					hit = &g_entities[trace.entityNum];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 8+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 542
;542:					hit->r.contents &= ~CONTENTS_TRIGGER; // exclude it from next trace.
ADDRLP4 9520
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
ASGNP4
ADDRLP4 9520
INDIRP4
ADDRLP4 9520
INDIRP4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 543
;543:					touch[num++] = trace.entityNum;
ADDRLP4 9524
ADDRLP4 5192
INDIRI4
ASGNI4
ADDRLP4 5192
ADDRLP4 9524
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 9524
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1088
ADDP4
ADDRLP4 8+52
INDIRI4
ASGNI4
line 544
;544:					touchViaTrace[trace.entityNum] = qtrue;
ADDRLP4 8+52
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 5244
ADDP4
CNSTI4 1
ASGNI4
line 545
;545:				}
ADDRGP4 $373
JUMPV
LABELV $372
line 546
;546:				else {
line 547
;547:					if (reverse) {
ADDRLP4 9420
INDIRI4
CNSTI4 0
EQI4 $378
line 548
;548:						finished = qtrue;
ADDRLP4 9424
CNSTI4 1
ASGNI4
line 549
;549:					}
ADDRGP4 $379
JUMPV
LABELV $378
line 550
;550:					else {
line 551
;551:						reverse = qtrue;
ADDRLP4 9420
CNSTI4 1
ASGNI4
line 552
;552:					}
LABELV $379
line 553
;553:					if (somethingInTheWay) {
ADDRLP4 9508
INDIRI4
CNSTI4 0
EQI4 $380
line 554
;554:						needExtraCheck = qtrue;
ADDRLP4 9428
CNSTI4 1
ASGNI4
line 555
;555:					}
LABELV $380
line 556
;556:				}
LABELV $373
line 557
;557:			}
LABELV $361
line 527
ADDRLP4 9424
INDIRI4
CNSTI4 0
NEI4 $382
ADDRLP4 5192
INDIRI4
CNSTI4 1024
LTI4 $360
LABELV $382
line 558
;558:		}
ADDRGP4 $359
JUMPV
LABELV $358
line 560
;559:		else
;560:		{
line 561
;561:			needExtraCheck = qtrue;
ADDRLP4 9428
CNSTI4 1
ASGNI4
line 562
;562:		}
LABELV $359
line 563
;563:		numTraced = num;
ADDRLP4 9368
ADDRLP4 5192
INDIRI4
ASGNI4
line 564
;564:		if (needExtraCheck) {
ADDRLP4 9428
INDIRI4
CNSTI4 0
EQI4 $383
line 569
;565:			int num2;
;566:			int	touch2[MAX_GENTITIES];
;567:			qboolean preContact;
;568:			qboolean postContact;
;569:			VectorMin(minsPrev, mins, minsTotal);
ADDRLP4 5220
INDIRF4
ADDRLP4 5196
INDIRF4
GEF4 $398
ADDRLP4 13616
ADDRLP4 5220
INDIRF4
ASGNF4
ADDRGP4 $399
JUMPV
LABELV $398
ADDRLP4 13616
ADDRLP4 5196
INDIRF4
ASGNF4
LABELV $399
ADDRLP4 9372
ADDRLP4 13616
INDIRF4
ASGNF4
ADDRLP4 5220+4
INDIRF4
ADDRLP4 5196+4
INDIRF4
GEF4 $400
ADDRLP4 13620
ADDRLP4 5220+4
INDIRF4
ASGNF4
ADDRGP4 $401
JUMPV
LABELV $400
ADDRLP4 13620
ADDRLP4 5196+4
INDIRF4
ASGNF4
LABELV $401
ADDRLP4 9372+4
ADDRLP4 13620
INDIRF4
ASGNF4
ADDRLP4 5220+8
INDIRF4
ADDRLP4 5196+8
INDIRF4
GEF4 $402
ADDRLP4 13624
ADDRLP4 5220+8
INDIRF4
ASGNF4
ADDRGP4 $403
JUMPV
LABELV $402
ADDRLP4 13624
ADDRLP4 5196+8
INDIRF4
ASGNF4
LABELV $403
ADDRLP4 9372+8
ADDRLP4 13624
INDIRF4
ASGNF4
line 570
;570:			VectorMax(maxsPrev, maxs, maxsTotal);
ADDRLP4 5232
INDIRF4
ADDRLP4 5208
INDIRF4
LEF4 $417
ADDRLP4 13628
ADDRLP4 5232
INDIRF4
ASGNF4
ADDRGP4 $418
JUMPV
LABELV $417
ADDRLP4 13628
ADDRLP4 5208
INDIRF4
ASGNF4
LABELV $418
ADDRLP4 9384
ADDRLP4 13628
INDIRF4
ASGNF4
ADDRLP4 5232+4
INDIRF4
ADDRLP4 5208+4
INDIRF4
LEF4 $419
ADDRLP4 13632
ADDRLP4 5232+4
INDIRF4
ASGNF4
ADDRGP4 $420
JUMPV
LABELV $419
ADDRLP4 13632
ADDRLP4 5208+4
INDIRF4
ASGNF4
LABELV $420
ADDRLP4 9384+4
ADDRLP4 13632
INDIRF4
ASGNF4
ADDRLP4 5232+8
INDIRF4
ADDRLP4 5208+8
INDIRF4
LEF4 $421
ADDRLP4 13636
ADDRLP4 5232+8
INDIRF4
ASGNF4
ADDRGP4 $422
JUMPV
LABELV $421
ADDRLP4 13636
ADDRLP4 5208+8
INDIRF4
ASGNF4
LABELV $422
ADDRLP4 9384+8
ADDRLP4 13636
INDIRF4
ASGNF4
line 572
;571:			// basically do the oldschool one after all... this is needed for anything we are fully inside of or if any solids were involved
;572:			num2 = trap_EntitiesInBox(minsTotal, maxsTotal, touch2, MAX_GENTITIES); // this is guaranteed to get the remaining stuff because 
ADDRLP4 9372
ARGP4
ADDRLP4 9384
ARGP4
ADDRLP4 9508
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 13640
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 13612
ADDRLP4 13640
INDIRI4
ASGNI4
line 573
;573:			for (i = 0; i < num2; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $426
JUMPV
LABELV $423
line 574
;574:				hit = &g_entities[touch2[i]];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 9508
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 575
;575:				if (!(hit->r.contents & CONTENTS_TRIGGER)) { 
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $427
line 576
;576:					continue; // no need to worry about dupes since we removed CONTENTS_TRIGGER from the already done ones
ADDRGP4 $424
JUMPV
LABELV $427
line 578
;577:				}
;578:				preContact = trap_EntityContact(minsPrev, maxsPrev, hit);
ADDRLP4 5220
ARGP4
ADDRLP4 5232
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 13644
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 13604
ADDRLP4 13644
INDIRI4
ASGNI4
line 579
;579:				postContact = trap_EntityContact(mins, maxs, hit);
ADDRLP4 5196
ARGP4
ADDRLP4 5208
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 13648
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 13608
ADDRLP4 13648
INDIRI4
ASGNI4
line 580
;580:				if (preContact!= postContact) {
ADDRLP4 13604
INDIRI4
ADDRLP4 13608
INDIRI4
EQI4 $429
line 581
;581:					touchViaTrace[touch2[i]] = qtrue; // sorta. really what touchviatrace is supposed to mean is, we either went in or got out. this serves that.
ADDRLP4 13652
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 13652
INDIRI4
LSHI4
ADDRLP4 9508
ADDP4
INDIRI4
ADDRLP4 13652
INDIRI4
LSHI4
ADDRLP4 5244
ADDP4
CNSTI4 1
ASGNI4
line 582
;582:				}
ADDRGP4 $430
JUMPV
LABELV $429
line 583
;583:				else if (!preContact) {
ADDRLP4 13604
INDIRI4
CNSTI4 0
NEI4 $431
line 584
;584:					continue;
ADDRGP4 $424
JUMPV
LABELV $431
LABELV $430
line 586
;585:				}
;586:				touch[num++] = touch2[i];
ADDRLP4 13652
ADDRLP4 5192
INDIRI4
ASGNI4
ADDRLP4 5192
ADDRLP4 13652
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 13656
CNSTI4 2
ASGNI4
ADDRLP4 13652
INDIRI4
ADDRLP4 13656
INDIRI4
LSHI4
ADDRLP4 1088
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 13656
INDIRI4
LSHI4
ADDRLP4 9508
ADDP4
INDIRI4
ASGNI4
line 587
;587:				if (num == MAX_GENTITIES) break; // oh well :(
ADDRLP4 5192
INDIRI4
CNSTI4 1024
NEI4 $433
ADDRGP4 $425
JUMPV
LABELV $433
line 588
;588:			}
LABELV $424
line 573
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $426
ADDRLP4 4
INDIRI4
ADDRLP4 13612
INDIRI4
LTI4 $423
LABELV $425
line 589
;589:		}
LABELV $383
line 591
;590:
;591:		for (i = 0; i < numTraced; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $438
JUMPV
LABELV $435
line 592
;592:			hit = &g_entities[touch[i]];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1088
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 593
;593:			hit->r.contents |= CONTENTS_TRIGGER; // give back the content flag.
ADDRLP4 9508
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
ASGNP4
ADDRLP4 9508
INDIRP4
ADDRLP4 9508
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 594
;594:		}
LABELV $436
line 591
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $438
ADDRLP4 4
INDIRI4
ADDRLP4 9368
INDIRI4
LTI4 $435
line 597
;595:		
;596:		// put them all in the right order so it respects order of entities in map
;597:		qsort(touch,num,sizeof(touch[0]), int_cmp);
ADDRLP4 1088
ARGP4
ADDRLP4 5192
INDIRI4
CVIU4 4
ARGU4
CNSTU4 4
ARGU4
ADDRGP4 int_cmp
ARGP4
ADDRGP4 qsort
CALLV
pop
line 599
;598:
;599:	}
ADDRGP4 $319
JUMPV
LABELV $318
line 600
;600:	else {
line 601
;601:		if (g_triggersRobust.integer) {
ADDRGP4 g_triggersRobust+12
INDIRI4
CNSTI4 0
EQI4 $439
line 602
;602:			VectorAdd(ent->client->ps.origin, playerMinsDefault, mins);
ADDRLP4 9420
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 5196
ADDRLP4 9420
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $300
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5196+4
ADDRLP4 9420
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $300+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5196+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $300+8
INDIRF4
ADDF4
ASGNF4
line 603
;603:			VectorAdd(ent->client->ps.origin, playerMaxsDefault, maxs);
ADDRLP4 9424
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 5208
ADDRLP4 9424
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $301
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5208+4
ADDRLP4 9424
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $301+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5208+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $301+8
INDIRF4
ADDF4
ASGNF4
line 604
;604:		}
ADDRGP4 $440
JUMPV
LABELV $439
line 605
;605:		else {
line 606
;606:			VectorSubtract(ent->client->ps.origin, range, mins);
ADDRLP4 9420
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 5196
ADDRLP4 9420
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $299
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5196+4
ADDRLP4 9420
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $299+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5196+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $299+8
INDIRF4
SUBF4
ASGNF4
line 607
;607:			VectorAdd(ent->client->ps.origin, range, maxs);
ADDRLP4 9424
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 5208
ADDRLP4 9424
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $299
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5208+4
ADDRLP4 9424
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $299+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5208+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $299+8
INDIRF4
ADDF4
ASGNF4
line 608
;608:		}
LABELV $440
line 610
;609:
;610:		num = trap_EntitiesInBox(mins, maxs, touch, MAX_GENTITIES);
ADDRLP4 5196
ARGP4
ADDRLP4 5208
ARGP4
ADDRLP4 1088
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 9420
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 5192
ADDRLP4 9420
INDIRI4
ASGNI4
line 613
;611:
;612:		// can't use ent->r.absmin, because that has a one unit pad
;613:		VectorAdd(ent->client->ps.origin, ent->r.mins, mins);
ADDRLP4 9424
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9428
ADDRLP4 9424
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 5196
ADDRLP4 9428
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 9424
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5196+4
ADDRLP4 9428
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 9424
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 9432
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5196+8
ADDRLP4 9432
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 9432
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 614
;614:		VectorAdd(ent->client->ps.origin, ent->r.maxs, maxs); // TODO uhm how does this relate to g_triggersrobust? think about this...
ADDRLP4 9436
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9440
ADDRLP4 9436
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 5208
ADDRLP4 9440
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 9436
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5208+4
ADDRLP4 9440
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 9436
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 9444
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5208+8
ADDRLP4 9444
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 9444
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 615
;615:	}
LABELV $319
line 617
;616:
;617:	for ( i=0 ; i<num ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $465
JUMPV
LABELV $462
line 618
;618:		hit = &g_entities[touch[i]];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1088
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 620
;619:
;620:		if (hit->triggerClientSpecific && hit->parent != ent) continue; // custom checkpoints
ADDRLP4 0
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 0
EQI4 $466
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $466
ADDRGP4 $463
JUMPV
LABELV $466
line 622
;621:
;622:		isTraced = robustTriggerEvaluation && touchViaTrace[touch[i]];
ADDRLP4 9428
CNSTI4 0
ASGNI4
ADDRLP4 5188
INDIRI4
ADDRLP4 9428
INDIRI4
EQI4 $469
ADDRLP4 9432
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 9432
INDIRI4
LSHI4
ADDRLP4 1088
ADDP4
INDIRI4
ADDRLP4 9432
INDIRI4
LSHI4
ADDRLP4 5244
ADDP4
INDIRI4
ADDRLP4 9428
INDIRI4
EQI4 $469
ADDRLP4 9424
CNSTI4 1
ASGNI4
ADDRGP4 $470
JUMPV
LABELV $469
ADDRLP4 9424
CNSTI4 0
ASGNI4
LABELV $470
ADDRLP4 5184
ADDRLP4 9424
INDIRI4
ASGNI4
line 626
;623:
;624:		// special kind of trigger (like for defrag start timer) that starts when we leave it.
;625:		// requires robust trigger evaluation
;626:		if (hit->r.contents & CONTENTS_TRIGGER_EXIT) {
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 1073741824
BANDI4
CNSTI4 0
EQI4 $471
line 627
;627:			if (!robustTriggerEvaluation || !hit->leave) {
ADDRLP4 5188
INDIRI4
CNSTI4 0
EQI4 $475
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $473
LABELV $475
line 628
;628:				continue;
ADDRGP4 $463
JUMPV
LABELV $473
line 630
;629:			}
;630:			if (trap_EntityContact(mins, maxs, hit)) {
ADDRLP4 5196
ARGP4
ADDRLP4 5208
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 9436
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 9436
INDIRI4
CNSTI4 0
EQI4 $476
line 632
;631:				// Still in trigger, ignore. 
;632:				continue;
ADDRGP4 $463
JUMPV
LABELV $476
line 634
;633:			}
;634:			memset(&trace, 0, sizeof(trace)); // what is this even for?
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1080
ARGU4
ADDRGP4 memset
CALLP4
pop
line 636
;635:
;636:			if (isTraced || !hit->triggerOnlyTraced) {
ADDRLP4 9440
CNSTI4 0
ASGNI4
ADDRLP4 5184
INDIRI4
ADDRLP4 9440
INDIRI4
NEI4 $480
ADDRLP4 0
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
ADDRLP4 9440
INDIRI4
NEI4 $463
LABELV $480
line 637
;637:				if (hit->leave) {
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $463
line 638
;638:					hit->leave(hit, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CALLV
pop
line 639
;639:				}
line 640
;640:			}
line 641
;641:			continue;
ADDRGP4 $463
JUMPV
LABELV $471
line 645
;642:		}
;643:
;644:		// rest is mostly normal trigger code
;645:		if ( !hit->touch && !ent->touch ) {
ADDRLP4 9436
CNSTI4 656
ASGNI4
ADDRLP4 9440
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
ADDRLP4 9436
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 9440
INDIRU4
NEU4 $483
ADDRFP4 0
INDIRP4
ADDRLP4 9436
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 9440
INDIRU4
NEU4 $483
line 646
;646:			continue;
ADDRGP4 $463
JUMPV
LABELV $483
line 648
;647:		}
;648:		if ( !( hit->r.contents & CONTENTS_TRIGGER )) {
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $485
line 649
;649:			continue;
ADDRGP4 $463
JUMPV
LABELV $485
line 653
;650:		}
;651:
;652:		// ignore most entities if a spectator
;653:		if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $487
line 654
;654:			if ( hit->s.eType != ET_TELEPORT_TRIGGER &&
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 11
EQI4 $489
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 Touch_DoorTrigger
CVPU4 4
EQU4 $489
line 657
;655:				// this is ugly but adding a new ET_? type will
;656:				// most likely cause network incompatibilities
;657:				hit->touch != Touch_DoorTrigger) {
line 658
;658:				continue;
ADDRGP4 $463
JUMPV
LABELV $489
line 660
;659:			}
;660:		}
LABELV $487
line 664
;661:
;662:		// use seperate code for determining if an item is picked up
;663:		// so you don't have to actually contact its bounding box
;664:		if ( hit->s.eType == ET_ITEM ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $491
line 665
;665:			if ( !BG_PlayerTouchesItem( &ent->client->ps, &hit->s, level.time ) ) { // TODO should it be based on client's cmd serverTime for raceMode?
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 9444
ADDRGP4 BG_PlayerTouchesItem
CALLI4
ASGNI4
ADDRLP4 9444
INDIRI4
CNSTI4 0
NEI4 $492
line 666
;666:				continue;
ADDRGP4 $463
JUMPV
line 668
;667:			}
;668:		} else {
LABELV $491
line 669
;669:			if (!robustTriggerEvaluation && !trap_EntityContact( mins, maxs, hit )) { // no need with robust trigger evaluation, we already checked via trace
ADDRLP4 5188
INDIRI4
CNSTI4 0
NEI4 $496
ADDRLP4 5196
ARGP4
ADDRLP4 5208
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 9444
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 9444
INDIRI4
CNSTI4 0
NEI4 $496
line 670
;670:				continue;
ADDRGP4 $463
JUMPV
LABELV $496
line 672
;671:			}
;672:		}
LABELV $492
line 674
;673:
;674:		memset( &trace, 0, sizeof(trace) );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1080
ARGU4
ADDRGP4 memset
CALLP4
pop
line 676
;675:
;676:		if (!hit->triggerOnlyTraced || (isTraced && !trap_EntityContact(minsPrev, maxsPrev, hit))) {
ADDRLP4 9448
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
ADDRLP4 9448
INDIRI4
EQI4 $500
ADDRLP4 5184
INDIRI4
ADDRLP4 9448
INDIRI4
EQI4 $498
ADDRLP4 5220
ARGP4
ADDRLP4 5232
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 9452
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 9452
INDIRI4
CNSTI4 0
NEI4 $498
LABELV $500
line 681
;677:			// if trigger requires only traced, this means we should only hit this trigger when ENTERING it. aka we are in the trigger now, but weren't on last frame.
;678:			// so if the trigger is traced (not allsolid), and we are not in it right now, then we are exiting it, but hit->triggerOnlyTraced should only be hit when entering a trigger.
;679:			// hence, with robust trigger evaluation, we skip when the trigger requires traced touch and we are exiting instead of entering it. 
;680:
;681:			if (hit->touch) {
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $501
line 682
;682:				hit->touch(hit, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CALLV
pop
line 683
;683:			}
LABELV $501
line 685
;684:
;685:			hit->triggerLastPlayerContact[ent - g_entities] = nowTime;
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
ADDRLP4 0
INDIRP4
CNSTI4 872
ADDP4
ADDP4
ADDRLP4 9364
INDIRI4
ASGNI4
line 686
;686:		}
LABELV $498
line 688
;687:
;688:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 9456
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9456
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $503
ADDRLP4 9456
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $503
line 689
;689:			ent->touch( ent, hit, &trace );
ADDRLP4 9460
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 9460
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 9460
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CALLV
pop
line 690
;690:		}
LABELV $503
line 691
;691:	}
LABELV $463
line 617
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $465
ADDRLP4 4
INDIRI4
ADDRLP4 5192
INDIRI4
LTI4 $462
line 694
;692:
;693:	// if we didn't touch a jump pad this pmove frame
;694:	if ( ent->client->ps.jumppad_frame != ent->client->ps.pmove_framecount ) {
ADDRLP4 9420
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9420
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
ADDRLP4 9420
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
EQI4 $505
line 695
;695:		ent->client->ps.jumppad_frame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
line 696
;696:		ent->client->ps.jumppad_ent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 0
ASGNI4
line 697
;697:	}
LABELV $505
line 698
;698:}
LABELV $298
endproc G_TouchTriggers 13660 28
lit
align 4
LABELV $508
byte 4 1109393408
byte 4 1109393408
byte 4 1112539136
export G_MoverTouchPushTriggers
code
proc G_MoverTouchPushTriggers 5328 16
line 710
;699:
;700:
;701:/*
;702:============
;703:G_MoverTouchTriggers
;704:
;705:Find all trigger entities that ent's current position touches.
;706:Spectators will only interact with teleporters.
;707:============
;708:*/
;709:void G_MoverTouchPushTriggers( gentity_t *ent, vec3_t oldOrg ) 
;710:{
line 717
;711:	int			i, num;
;712:	float		step, stepSize, dist;
;713:	int			touch[MAX_GENTITIES];
;714:	gentity_t	*hit;
;715:	trace_t		trace;
;716:	vec3_t		mins, maxs, dir, size, checkSpot;
;717:	const vec3_t	range = { 40, 40, 52 };
ADDRLP4 5224
ADDRGP4 $508
INDIRB
ASGNB 12
line 720
;718:
;719:	// non-moving movers don't hit triggers!
;720:	if ( !VectorLengthSquared( ent->s.pos.trDelta ) ) 
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 5272
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 5272
INDIRF4
CNSTF4 0
NEF4 $509
line 721
;721:	{
line 722
;722:		return;
ADDRGP4 $507
JUMPV
LABELV $509
line 725
;723:	}
;724:
;725:	VectorSubtract( ent->r.mins, ent->r.maxs, size );
ADDRLP4 5276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5260
ADDRLP4 5276
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDRLP4 5276
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5260+4
ADDRLP4 5276
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDRLP4 5276
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5260+8
ADDRLP4 5280
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDRLP4 5280
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
SUBF4
ASGNF4
line 726
;726:	stepSize = VectorLength( size );
ADDRLP4 5260
ARGP4
ADDRLP4 5284
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 5252
ADDRLP4 5284
INDIRF4
ASGNF4
line 727
;727:	if ( stepSize < 1 )
ADDRLP4 5252
INDIRF4
CNSTF4 1065353216
GEF4 $513
line 728
;728:	{
line 729
;729:		stepSize = 1;
ADDRLP4 5252
CNSTF4 1065353216
ASGNF4
line 730
;730:	}
LABELV $513
line 732
;731:
;732:	VectorSubtract( ent->r.currentOrigin, oldOrg, dir );
ADDRLP4 5288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 5240
ADDRLP4 5288
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 5292
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5240+4
ADDRLP4 5288
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 5292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5240+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 733
;733:	dist = VectorNormalize( dir );
ADDRLP4 5240
ARGP4
ADDRLP4 5296
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 5256
ADDRLP4 5296
INDIRF4
ASGNF4
line 734
;734:	for ( step = 0; step <= dist; step += stepSize )
ADDRLP4 5236
CNSTF4 0
ASGNF4
ADDRGP4 $520
JUMPV
LABELV $517
line 735
;735:	{
line 736
;736:		VectorMA( ent->r.currentOrigin, step, dir, checkSpot );
ADDRLP4 5300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
ADDRLP4 5300
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 5240
INDIRF4
ADDRLP4 5236
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+4
ADDRLP4 5300
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 5240+4
INDIRF4
ADDRLP4 5236
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 5240+8
INDIRF4
ADDRLP4 5236
INDIRF4
MULF4
ADDF4
ASGNF4
line 737
;737:		VectorSubtract( checkSpot, range, mins );
ADDRLP4 1088
ADDRLP4 1112
INDIRF4
ADDRLP4 5224
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 5224+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+8
ADDRLP4 1112+8
INDIRF4
ADDRLP4 5224+8
INDIRF4
SUBF4
ASGNF4
line 738
;738:		VectorAdd( checkSpot, range, maxs );
ADDRLP4 1100
ADDRLP4 1112
INDIRF4
ADDRLP4 5224
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 5224+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1112+8
INDIRF4
ADDRLP4 5224+8
INDIRF4
ADDF4
ASGNF4
line 740
;739:
;740:		num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 1088
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1128
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 5308
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 1124
ADDRLP4 5308
INDIRI4
ASGNI4
line 743
;741:
;742:		// can't use ent->r.absmin, because that has a one unit pad
;743:		VectorAdd( checkSpot, ent->r.mins, mins );
ADDRLP4 5312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
ADDRLP4 1112
INDIRF4
ADDRLP4 5312
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1088+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 5312
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1088+8
ADDRLP4 1112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 744
;744:		VectorAdd( checkSpot, ent->r.maxs, maxs );
ADDRLP4 5316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1112
INDIRF4
ADDRLP4 5316
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 5316
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 746
;745:
;746:		for ( i=0 ; i<num ; i++ ) 
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $548
JUMPV
LABELV $545
line 747
;747:		{
line 748
;748:			hit = &g_entities[touch[i]];
ADDRLP4 0
CNSTI4 2352
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1128
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 750
;749:
;750:			if ( hit->s.eType != ET_PUSH_TRIGGER )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 10
EQI4 $549
line 751
;751:			{
line 752
;752:				continue;
ADDRGP4 $546
JUMPV
LABELV $549
line 755
;753:			}
;754:
;755:			if ( hit->touch == NULL ) 
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $551
line 756
;756:			{
line 757
;757:				continue;
ADDRGP4 $546
JUMPV
LABELV $551
line 760
;758:			}
;759:
;760:			if ( !( hit->r.contents & CONTENTS_TRIGGER ) ) 
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $553
line 761
;761:			{
line 762
;762:				continue;
ADDRGP4 $546
JUMPV
LABELV $553
line 766
;763:			}
;764:
;765:
;766:			if ( !trap_EntityContact( mins, maxs, hit ) ) 
ADDRLP4 1088
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 5320
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 5320
INDIRI4
CNSTI4 0
NEI4 $555
line 767
;767:			{
line 768
;768:				continue;
ADDRGP4 $546
JUMPV
LABELV $555
line 771
;769:			}
;770:
;771:			memset( &trace, 0, sizeof(trace) );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1080
ARGU4
ADDRGP4 memset
CALLP4
pop
line 773
;772:
;773:			if ( hit->touch != NULL ) 
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $557
line 774
;774:			{
line 775
;775:				hit->touch(hit, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CALLV
pop
line 776
;776:			}
LABELV $557
line 777
;777:		}
LABELV $546
line 746
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $548
ADDRLP4 4
INDIRI4
ADDRLP4 1124
INDIRI4
LTI4 $545
line 778
;778:	}
LABELV $518
line 734
ADDRLP4 5236
ADDRLP4 5236
INDIRF4
ADDRLP4 5252
INDIRF4
ADDF4
ASGNF4
LABELV $520
ADDRLP4 5236
INDIRF4
ADDRLP4 5256
INDIRF4
LEF4 $517
line 779
;779:}
LABELV $507
endproc G_MoverTouchPushTriggers 5328 16
export SpectatorThink
proc SpectatorThink 608 12
line 786
;780:
;781:/*
;782:=================
;783:SpectatorThink
;784:=================
;785:*/
;786:void SpectatorThink( gentity_t *ent, usercmd_t *ucmd ) {
line 790
;787:	pmove_t	pm;
;788:	gclient_t	*client;
;789:
;790:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 792
;791:
;792:	if ( client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 0
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 2
EQI4 $560
line 793
;793:		client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 794
;794:		client->ps.speed = 400;	// faster than normal
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 400
ASGNI4
line 795
;795:		client->ps.basespeed = 400;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 400
ASGNI4
line 798
;796:
;797:		// set up for pmove
;798:		memset (&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 576
ARGU4
ADDRGP4 memset
CALLP4
pop
line 799
;799:		pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 800
;800:		pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 28
line 801
;801:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;	// spectators can fly through bodies
ADDRLP4 4+64
CNSTI4 17
ASGNI4
line 802
;802:		if (ent->client->noclip) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $564
line 803
;803:			pm.tracemask = 0;
ADDRLP4 4+64
CNSTI4 0
ASGNI4
line 804
;804:		}
LABELV $564
line 805
;805:		pm.trace = JP_Trace;
ADDRLP4 4+300
ADDRGP4 JP_Trace
ASGNP4
line 806
;806:		pm.rawtrace = trap_Trace;
ADDRLP4 4+472
ADDRGP4 trap_Trace
ASGNP4
line 807
;807:		pm.pointcontents = trap_PointContents;
ADDRLP4 4+308
ADDRGP4 trap_PointContents
ASGNP4
line 809
;808:
;809:		pm.animations = NULL;
ADDRLP4 4+260
CNSTP4 0
ASGNP4
line 812
;810:
;811:		//Set up bg entity data
;812:		pm.baseEnt = (bgEntity_t*)g_entities;
ADDRLP4 4+464
ADDRGP4 g_entities
ASGNP4
line 813
;813:		pm.entSize = sizeof(gentity_t);
ADDRLP4 4+468
CNSTI4 2352
ASGNI4
line 814
;814:		pm.positionChangedOutsidePmove = !VectorCompare(ent->client->ps.origin, client->oldPostPmovePosition);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 52140
ADDP4
ARGP4
ADDRLP4 584
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 584
INDIRI4
CNSTI4 0
NEI4 $575
ADDRLP4 580
CNSTI4 1
ASGNI4
ADDRGP4 $576
JUMPV
LABELV $575
ADDRLP4 580
CNSTI4 0
ASGNI4
LABELV $576
ADDRLP4 4+320
ADDRLP4 580
INDIRI4
ASGNI4
line 815
;815:		pm.oldButtons = ent->client->oldbuttons;
ADDRLP4 4+60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43612
ADDP4
INDIRI4
ASGNI4
line 816
;816:		pm.unlockRandom = g_unlockRandom.integer;
ADDRLP4 4+564
ADDRGP4 g_unlockRandom+12
INDIRI4
ASGNI4
line 818
;817:
;818:		pm.highFpsFix = g_fixHighFPSAbuse.integer;
ADDRLP4 4+572
ADDRGP4 g_fixHighFPSAbuse+12
INDIRI4
ASGNI4
line 820
;819:
;820:		pm.mod = SVMOD_TOMMYTERNAL;
ADDRLP4 4+280
CNSTI4 2
ASGNI4
line 823
;821:
;822:		// perform a pmove
;823:		Pmove (&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 825
;824:		// save results of pmove
;825:		VectorCopy( client->ps.origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 826
;826:		VectorCopy( client->ps.origin, client->oldPostPmovePosition ); // for q2 snapping mode
ADDRLP4 0
INDIRP4
CNSTI4 52140
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 828
;827:
;828:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 829
;829:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 830
;830:	}
LABELV $560
line 832
;831:
;832:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 43612
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 43608
ADDP4
INDIRI4
ASGNI4
line 833
;833:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 43608
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 836
;834:
;835:	// attack button cycles through spectators
;836:	if ( ( client->buttons & BUTTON_ATTACK ) && ! ( client->oldbuttons & BUTTON_ATTACK ) ) {
ADDRLP4 588
CNSTI4 1
ASGNI4
ADDRLP4 592
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 43608
ADDP4
INDIRI4
ADDRLP4 588
INDIRI4
BANDI4
ADDRLP4 592
INDIRI4
EQI4 $583
ADDRLP4 0
INDIRP4
CNSTI4 43612
ADDP4
INDIRI4
ADDRLP4 588
INDIRI4
BANDI4
ADDRLP4 592
INDIRI4
NEI4 $583
line 837
;837:		Cmd_FollowCycle_f( ent, 1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
line 838
;838:	}
LABELV $583
line 841
;839:
;840:	// alt attack button cycles backwards
;841:	if ( client->sess.spectatorState == SPECTATOR_FOLLOW && (client->buttons & BUTTON_ALT_ATTACK) && !(client->oldbuttons & BUTTON_ALT_ATTACK) )
ADDRLP4 0
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 2
NEI4 $585
ADDRLP4 600
CNSTI4 128
ASGNI4
ADDRLP4 604
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 43608
ADDP4
INDIRI4
ADDRLP4 600
INDIRI4
BANDI4
ADDRLP4 604
INDIRI4
EQI4 $585
ADDRLP4 0
INDIRP4
CNSTI4 43612
ADDP4
INDIRI4
ADDRLP4 600
INDIRI4
BANDI4
ADDRLP4 604
INDIRI4
NEI4 $585
line 842
;842:	{
line 843
;843:		Cmd_FollowCycle_f( ent, -1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
line 844
;844:	}
LABELV $585
line 846
;845:
;846:	if (client->sess.spectatorState == SPECTATOR_FOLLOW && (ucmd->upmove > 0))
ADDRLP4 0
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 2
NEI4 $587
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $587
line 847
;847:	{ //jump now removes you from follow mode
line 848
;848:		StopFollowing(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 849
;849:	}
LABELV $587
line 850
;850:}
LABELV $559
endproc SpectatorThink 608 12
export ClientInactivityTimer
proc ClientInactivityTimer 12 12
line 861
;851:
;852:
;853:
;854:/*
;855:=================
;856:ClientInactivityTimer
;857:
;858:Returns qfalse if the client is dropped
;859:=================
;860:*/
;861:qboolean ClientInactivityTimer( gclient_t *client ) {
line 862
;862:	if ( ! g_inactivity.integer ) {
ADDRGP4 g_inactivity+12
INDIRI4
CNSTI4 0
NEI4 $590
line 865
;863:		// give everyone some time, so if the operator sets g_inactivity during
;864:		// gameplay, everyone isn't kicked
;865:		client->inactivityTime = level.time + 60 * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 43688
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 60000
ADDI4
ASGNI4
line 866
;866:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 43704
ADDP4
CNSTI4 0
ASGNI4
line 867
;867:	} else if ( client->pers.cmd.forwardmove || 
ADDRGP4 $591
JUMPV
LABELV $590
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1408
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $598
ADDRLP4 0
INDIRP4
CNSTI4 1409
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $598
ADDRLP4 0
INDIRP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $598
ADDRLP4 0
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 129
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $594
LABELV $598
line 870
;868:		client->pers.cmd.rightmove || 
;869:		client->pers.cmd.upmove ||
;870:		(client->pers.cmd.buttons & (BUTTON_ATTACK|BUTTON_ALT_ATTACK)) ) {
line 871
;871:		client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRFP4 0
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
line 872
;872:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 43704
ADDP4
CNSTI4 0
ASGNI4
line 873
;873:	} else if ( !client->pers.localClient ) {
ADDRGP4 $595
JUMPV
LABELV $594
ADDRFP4 0
INDIRP4
CNSTI4 1412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $601
line 874
;874:		if ( level.time > client->inactivityTime ) {
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 43688
ADDP4
INDIRI4
LEI4 $603
line 875
;875:			trap_DropClient( client - level.clients, "Dropped due to inactivity" );
ADDRFP4 0
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
ADDRGP4 $606
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 876
;876:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $589
JUMPV
LABELV $603
line 878
;877:		}
;878:		if ( level.time > client->inactivityTime - 10000 && !client->inactivityWarning ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 43688
ADDP4
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $607
ADDRLP4 8
INDIRP4
CNSTI4 43704
ADDP4
INDIRI4
CNSTI4 0
NEI4 $607
line 879
;879:			client->inactivityWarning = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 43704
ADDP4
CNSTI4 1
ASGNI4
line 880
;880:			G_SendServerCommand( client - level.clients, "cp \"Ten seconds until inactivity drop!\n\"" ,qtrue);
ADDRFP4 0
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
ADDRGP4 $610
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 881
;881:		}
LABELV $607
line 882
;882:	}
LABELV $601
LABELV $595
LABELV $591
line 883
;883:	return qtrue;
CNSTI4 1
RETI4
LABELV $589
endproc ClientInactivityTimer 12 12
export ClientInactivitySpecTimerReset
proc ClientInactivitySpecTimerReset 12 8
line 893
;884:}
;885:
;886:/*
;887:=================
;888:ClientInactivitySpecTimerReset
;889:
;890:Call manually to reset the timer for sending a player to spec. E.g. on /kill
;891:=================
;892:*/
;893:qboolean ClientInactivitySpecTimerReset(gentity_t* ent) {
line 894
;894:	gclient_t* client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 895
;895:	if (g_inactivityToSpec.integer <= 0) {
ADDRGP4 g_inactivityToSpec+12
INDIRI4
CNSTI4 0
GTI4 $612
line 898
;896:		// give everyone some time, so if the operator sets g_inactivityToSpec during
;897:		// gameplay, everyone isn't spectated
;898:		client->inactivityToSpecTime = clampedIntAdd(level.time, 60 * 1000);
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTI4 60000
ARGI4
ADDRLP4 4
ADDRGP4 clampedIntAdd
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 43692
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 899
;899:	}
ADDRGP4 $613
JUMPV
LABELV $612
line 900
;900:	else {
line 901
;901:		client->inactivityToSpecTime = clampedIntAdd(level.time, clampedIntMult(g_inactivityToSpec.integer, 1000));
ADDRGP4 g_inactivityToSpec+12
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 4
ADDRGP4 clampedIntMult
CALLI4
ASGNI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 clampedIntAdd
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 43692
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 902
;902:	}
LABELV $613
line 903
;903:	return qtrue;
CNSTI4 1
RETI4
LABELV $611
endproc ClientInactivitySpecTimerReset 12 8
export ClientInactivitySpecTimer
proc ClientInactivitySpecTimer 44 28
line 913
;904:}
;905:
;906:/*
;907:=================
;908:ClientInactivitySpecTimer
;909:
;910:Returns qfalse if the client is put to spec
;911:=================
;912:*/
;913:qboolean ClientInactivitySpecTimer( gentity_t* ent ) {
line 914
;914:	gclient_t* client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 915
;915:	qboolean wasInactive = client->markedAsInactive;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 43696
ADDP4
INDIRI4
ASGNI4
line 916
;916:	client->markedAsInactive = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 43696
ADDP4
CNSTI4 0
ASGNI4
line 917
;917:	if (g_inactivityToSpec.integer <= 0 || client->sess.sessionTeam == TEAM_SPECTATOR || level.intermissiontime) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 g_inactivityToSpec+12
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $624
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $624
ADDRGP4 level+9028
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $619
LABELV $624
line 920
;918:		// give everyone some time, so if the operator sets g_inactivityToSpec during
;919:		// gameplay, everyone isn't spectated
;920:		client->inactivityToSpecTime = clampedIntAdd(level.time, 60 * 1000);
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTI4 60000
ARGI4
ADDRLP4 12
ADDRGP4 clampedIntAdd
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 43692
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 921
;921:	}
ADDRGP4 $620
JUMPV
LABELV $619
line 922
;922:	else if (client->pers.cmd.forwardmove ||
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1408
ADDP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
NEI4 $630
ADDRLP4 0
INDIRP4
CNSTI4 1409
ADDP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
NEI4 $630
ADDRLP4 0
INDIRP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
NEI4 $630
ADDRLP4 0
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 129
BANDI4
ADDRLP4 16
INDIRI4
EQI4 $626
LABELV $630
line 925
;923:		client->pers.cmd.rightmove ||
;924:		client->pers.cmd.upmove ||
;925:		(client->pers.cmd.buttons & (BUTTON_ATTACK | BUTTON_ALT_ATTACK))) {
line 926
;926:		client->inactivityToSpecTime = clampedIntAdd( level.time , clampedIntMult(g_inactivityToSpec.integer, 1000));
ADDRGP4 g_inactivityToSpec+12
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 20
ADDRGP4 clampedIntMult
CALLI4
ASGNI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 clampedIntAdd
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 43692
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 927
;927:	}
ADDRGP4 $627
JUMPV
LABELV $626
line 928
;928:	else if(level.numPlayingClients > 1){ // dont bother sending to spec or marking as inactive if only 1 player is in anyway
ADDRGP4 level+92
INDIRI4
CNSTI4 1
LEI4 $633
line 929
;929:		if (ent->client->sess.raceMode && (ent->client->pers.raceStartCommandTime || ent->client->pers.recordingDemo && ent->client->pers.keepDemoMaybe) && !g_inactivityToSpecRacers.integer) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $636
ADDRLP4 20
INDIRP4
CNSTI4 22064
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $639
ADDRLP4 20
INDIRP4
CNSTI4 43088
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $636
ADDRLP4 20
INDIRP4
CNSTI4 43092
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $636
LABELV $639
ADDRGP4 g_inactivityToSpecRacers+12
INDIRI4
CNSTI4 0
NEI4 $636
line 931
;930:			// dont spec ppl in the middle of a run, but mark them as inactive
;931:			if (level.time > client->inactivityToSpecTime) {
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 43692
ADDP4
INDIRI4
LEI4 $637
line 932
;932:				client->markedAsInactive = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 43696
ADDP4
CNSTI4 1
ASGNI4
line 933
;933:			}
line 934
;934:		}
ADDRGP4 $637
JUMPV
LABELV $636
line 935
;935:		else {
line 936
;936:			if (level.time > client->inactivityToSpecTime) {
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 43692
ADDP4
INDIRI4
LEI4 $643
line 937
;937:				G_Printf("^3g_inactivityToSpec: Sending client %d to spec.\n", ent - g_entities);
ADDRGP4 $646
ARGP4
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
ADDRGP4 G_Printf
CALLV
pop
line 938
;938:				trap_SendServerCommand(-1, va("print \"^3Sending %s ^3to spec for being AFK.\n\"",client->pers.netname));
ADDRGP4 $647
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1428
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 939
;939:				SetTeam(ent, "s");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $648
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 940
;940:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $618
JUMPV
LABELV $643
line 943
;941:			}
;942:
;943:			if (level.time > client->inactivityToSpecTime - 20000 && (level.time - client->randomLastCenterprint > 1000 || level.time < client->randomLastCenterprint)) {
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 43692
ADDP4
INDIRI4
CNSTI4 20000
SUBI4
LEI4 $649
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 52132
ADDP4
INDIRI4
ASGNI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
CNSTI4 1000
GTI4 $654
ADDRGP4 level+36
INDIRI4
ADDRLP4 32
INDIRI4
GEI4 $649
LABELV $654
line 944
;944:				client->randomLastCenterprint = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 52132
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 945
;945:				G_CenterPrint(client - level.clients, 3, va("^1%d seconds until you are sent to spec for being AFK!", (client->inactivityToSpecTime - level.time) / 1000), qfalse, qtrue, qfalse, NULL);
ADDRGP4 $656
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 43692
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
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
CNSTI4 3
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_CenterPrint
CALLV
pop
line 946
;946:			}
LABELV $649
line 947
;947:		}
LABELV $637
line 948
;948:	}
LABELV $633
LABELV $627
LABELV $620
line 949
;949:	if (client->markedAsInactive != wasInactive) {
ADDRLP4 0
INDIRP4
CNSTI4 43696
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $658
line 951
;950:
;951:		G_Printf("^3g_inactivityToSpec: Client %d inactivity status changed to %d.\n", ent - g_entities, client->markedAsInactive);
ADDRGP4 $660
ARGP4
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
ADDRLP4 0
INDIRP4
CNSTI4 43696
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 952
;952:		G_ResetClientVote(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetClientVote
CALLV
pop
line 953
;953:		CalculateRanks(); // need to let the game know this client won't vote :)
ADDRGP4 CalculateRanks
CALLV
pop
line 954
;954:	}
LABELV $658
line 955
;955:	return qtrue;
CNSTI4 1
RETI4
LABELV $618
endproc ClientInactivitySpecTimer 44 28
proc ClientCheckNotifyPhysicsFps 36 12
line 960
;956:}
;957:
;958:void SetClientPhysicsFps(gentity_t* ent, int clientSetting);
;959:
;960:static qboolean ClientCheckNotifyPhysicsFps(gentity_t* ent) {
line 961
;961:	gclient_t* client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 962
;962:	const char* notification = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 963
;963:	int timeToNextChange = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 965
;964:
;965:	if (!client) return qfalse;
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $662
CNSTI4 0
RETI4
ADDRGP4 $661
JUMPV
LABELV $662
line 967
;966:
;967:	if (client->sess.raceMode) {
ADDRLP4 0
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $664
line 969
;968:
;969:		if (client->pers.physicsFps.clientSetting && client->pers.physicsFps.clientSetting == client->pers.physicsFps.acceptedSetting && (client->sess.raceStyle.msec < 0 || client->sess.raceStyle.msec == client->pers.physicsFps.acceptedSettingMsec)) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 42504
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $666
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 42512
ADDP4
INDIRI4
NEI4 $666
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $668
ADDRLP4 24
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 42516
ADDP4
INDIRI4
NEI4 $666
LABELV $668
line 972
;970:
;971:			// All good.
;972:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $661
JUMPV
LABELV $666
line 974
;973:		}
;974:		else if(client->pers.physicsFps.clientSettingValid) {
ADDRLP4 0
INDIRP4
CNSTI4 42508
ADDP4
INDIRI4
CNSTI4 0
EQI4 $669
line 977
;975:
;976:			// If the new requested value was valid in principle, recheck if we are outside of a run now to set it
;977:			if (client->sess.raceStyle.msec < 0 || !client->pers.raceStartCommandTime) {
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
ADDRLP4 32
INDIRI4
LTI4 $673
ADDRLP4 0
INDIRP4
CNSTI4 22064
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $671
LABELV $673
line 979
;978:				// Give it another try.
;979:				SetClientPhysicsFps(ent, client->pers.physicsFps.clientSetting);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 42504
ADDP4
INDIRI4
ARGI4
ADDRGP4 SetClientPhysicsFps
CALLV
pop
line 980
;980:			}
LABELV $671
line 981
;981:		}
LABELV $669
line 983
;982:
;983:		if (client->sess.raceStyle.msec < 0) {
ADDRLP4 0
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
CNSTI4 0
GEI4 $674
line 984
;984:			return qtrue; // -1 is toggle, -2 is float. Don't care, anything is allowed.
CNSTI4 1
RETI4
ADDRGP4 $661
JUMPV
LABELV $674
line 993
;985:		}
;986:
;987:		// anything below this assumes toggle mode is not active
;988:
;989:		// Time to notify the client if something isn't right.
;990:		//if ((client->pers.physicsFps.lastNotification + 1000) > level.time && client->pers.physicsFps.lastNotification < level.time) {
;991:		//	return; // Don't spam. Once every 1 second is enough to stay constant on the screen of the client
;992:		//}
;993:		if (client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $676
line 994
;994:			return qtrue; // We don't enforce anything on spectators
CNSTI4 1
RETI4
ADDRGP4 $661
JUMPV
LABELV $676
line 996
;995:		}
;996:		if (!client->pers.physicsFps.clientSetting) {
ADDRLP4 0
INDIRP4
CNSTI4 42504
ADDP4
INDIRI4
CNSTI4 0
NEI4 $678
line 998
;997:			//notification = "cp \"^2Toggle disabled.\n^7Please set com_physicsFps to a valid \nFPS setting you wish to play with\nor use ^2/togglefps ^7for toggle mode.\n\"";
;998:			if (client->pers.physicsFps.clientSendsPhysicsFps) {
ADDRLP4 0
INDIRP4
CNSTI4 42528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $680
line 999
;999:				notification = "cp \"^2Toggle disabled.\n^1Invalid ^7com_physicsFps value detected.\nYour movement may be restricted.\nPlease set a valid value\nor use ^2/togglefps ^7for toggle mode.\n\"";
ADDRLP4 4
ADDRGP4 $682
ASGNP4
line 1000
;1000:			}
ADDRGP4 $665
JUMPV
LABELV $680
line 1001
;1001:			else {
line 1002
;1002:				notification = "cp \"^2Toggle disabled.\n^1No ^7com_physicsFps value detected.\nYour movement may be restricted.\nPlease use a client with com_physicsFps\n^3(dev note: must be CVAR_USERINFO)\n^7or use ^2/togglefps ^7for toggle mode.\n\"";
ADDRLP4 4
ADDRGP4 $683
ASGNP4
line 1003
;1003:			}
line 1004
;1004:		}
ADDRGP4 $665
JUMPV
LABELV $678
line 1005
;1005:		else if (client->pers.physicsFps.clientSetting != client->pers.physicsFps.acceptedSetting) {
ADDRLP4 0
INDIRP4
CNSTI4 42504
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 42512
ADDP4
INDIRI4
EQI4 $665
line 1006
;1006:			if (!client->pers.physicsFps.clientSettingValid) {
ADDRLP4 0
INDIRP4
CNSTI4 42508
ADDP4
INDIRI4
CNSTI4 0
NEI4 $686
line 1008
;1007:				// Seems like the client set an invalid value as it hasn't been accepted
;1008:				if (client->pers.physicsFps.clientSendsPhysicsFps) {
ADDRLP4 0
INDIRP4
CNSTI4 42528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $688
line 1009
;1009:					notification = "cp \"^2Toggle disabled.\n^1Invalid ^7com_physicsFps value detected.\nYour movement may be restricted.\nPlease set a valid value\nor use ^2/togglefps ^7for toggle mode.\n\"";
ADDRLP4 4
ADDRGP4 $682
ASGNP4
line 1010
;1010:				}
ADDRGP4 $665
JUMPV
LABELV $688
line 1011
;1011:				else {
line 1012
;1012:					notification = "cp \"^2Toggle disabled.\n^1No ^7com_physicsFps value detected.\nYour movement may be restricted.\nPlease use a client with com_physicsFps\n^3(dev note: must be CVAR_USERINFO)\n^7or use ^2/togglefps ^7for toggle mode.\n\"";
ADDRLP4 4
ADDRGP4 $683
ASGNP4
line 1013
;1013:				}
line 1014
;1014:			}
ADDRGP4 $665
JUMPV
LABELV $686
line 1015
;1015:			else {
line 1016
;1016:				if (client->pers.physicsFps.acceptedSetting) {
ADDRLP4 0
INDIRP4
CNSTI4 42512
ADDP4
INDIRI4
CNSTI4 0
EQI4 $690
line 1017
;1017:					notification = va("cp \"^2Toggle disabled.\n^7End your run to change com_physicsFps. \nPlease go back to %d fps.\n\"", client->pers.physicsFps.acceptedSetting);
ADDRGP4 $692
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 42512
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 1018
;1018:				}
ADDRGP4 $665
JUMPV
LABELV $690
line 1019
;1019:				else {
line 1023
;1020:					// Should never happen?
;1021:					// Somehow we have a valid client setting, no accepted setting yet, and yet the value was not formally accepted.
;1022:					// Only adding this for debugging in case strange things happen.
;1023:					notification = va("cp \"^2Toggle disabled.\n^7Anomaly detected. Please try setting com_physicsFps again\n and respawn.\n\"");
ADDRGP4 $693
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 1024
;1024:				}
line 1025
;1025:			}
line 1026
;1026:		}
line 1028
;1027:
;1028:	}
ADDRGP4 $665
JUMPV
LABELV $664
line 1029
;1029:	else {
line 1031
;1030:		
;1031:		if (!g_fpsToggleDelay.integer) {
ADDRGP4 g_fpsToggleDelay+12
INDIRI4
CNSTI4 0
NEI4 $694
line 1032
;1032:			return qtrue; // We are not limiting anything, don't care.
CNSTI4 1
RETI4
ADDRGP4 $661
JUMPV
LABELV $694
line 1035
;1033:		}
;1034:	
;1035:		if (client->pers.physicsFps.clientSetting && client->pers.physicsFps.clientSetting == client->pers.physicsFps.acceptedSetting) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 42504
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $697
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 42512
ADDP4
INDIRI4
NEI4 $697
line 1038
;1036:
;1037:			// All good.
;1038:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $661
JUMPV
LABELV $697
line 1040
;1039:		}
;1040:		else if(client->pers.physicsFps.clientSettingValid) {
ADDRLP4 0
INDIRP4
CNSTI4 42508
ADDP4
INDIRI4
CNSTI4 0
EQI4 $699
line 1043
;1041:
;1042:			// If the new requested value was valid in principle, recheck if enough time has passed now to accept the client's new com_physicsFps setting.
;1043:			if ((client->pers.physicsFps.lastChange + g_fpsToggleDelay.integer * 1000) < level.time || client->pers.physicsFps.lastChange > level.time) {
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 42520
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1000
ADDRGP4 g_fpsToggleDelay+12
INDIRI4
MULI4
ADDI4
ADDRGP4 level+36
INDIRI4
LTI4 $706
ADDRLP4 20
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $701
LABELV $706
line 1045
;1044:				// Give it another try.
;1045:				SetClientPhysicsFps(ent, client->pers.physicsFps.clientSetting);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 42504
ADDP4
INDIRI4
ARGI4
ADDRGP4 SetClientPhysicsFps
CALLV
pop
line 1046
;1046:			}
LABELV $701
line 1047
;1047:		}
LABELV $699
line 1053
;1048:
;1049:		// Time to notify the client if something isn't right.
;1050:		//if ((client->pers.physicsFps.lastNotification + 1000) > level.time && client->pers.physicsFps.lastNotification < level.time) {
;1051:		//	return; // Don't spam. Once every 1 second is enough to stay constant on the screen of the client
;1052:		//}
;1053:		if (client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRLP4 0
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $707
line 1054
;1054:			return qtrue; // We don't enforce anything on spectators
CNSTI4 1
RETI4
ADDRGP4 $661
JUMPV
LABELV $707
line 1056
;1055:		}
;1056:		if (!client->pers.physicsFps.clientSetting) {
ADDRLP4 0
INDIRP4
CNSTI4 42504
ADDP4
INDIRI4
CNSTI4 0
NEI4 $709
line 1057
;1057:			notification = "cp \"^2Anti-Toggle active.\n^7Please set com_physicsFps to a valid \nFPS setting you wish to play with.\n\"";
ADDRLP4 4
ADDRGP4 $711
ASGNP4
line 1058
;1058:		}
ADDRGP4 $710
JUMPV
LABELV $709
line 1059
;1059:		else if (client->pers.physicsFps.clientSetting != client->pers.physicsFps.acceptedSetting) {
ADDRLP4 0
INDIRP4
CNSTI4 42504
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 42512
ADDP4
INDIRI4
EQI4 $712
line 1060
;1060:			if (!client->pers.physicsFps.clientSettingValid) {
ADDRLP4 0
INDIRP4
CNSTI4 42508
ADDP4
INDIRI4
CNSTI4 0
NEI4 $714
line 1062
;1061:				// Seems like the client set an invalid value as it hasn't been accepted
;1062:				notification = "cp \"^2Anti-Toggle active.\n^1Invalid ^7com_physicsFps value detected. \nPlease set a valid value.\n\"";
ADDRLP4 4
ADDRGP4 $716
ASGNP4
line 1063
;1063:			}
ADDRGP4 $715
JUMPV
LABELV $714
line 1064
;1064:			else {
line 1065
;1065:				timeToNextChange = level.time > client->pers.physicsFps.lastChange ? g_fpsToggleDelay.integer*1000 - (level.time - client->pers.physicsFps.lastChange) : -1;
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 42520
ADDP4
INDIRI4
LEI4 $721
ADDRLP4 24
CNSTI4 1000
ADDRGP4 g_fpsToggleDelay+12
INDIRI4
MULI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 42520
ADDP4
INDIRI4
SUBI4
SUBI4
ASGNI4
ADDRGP4 $722
JUMPV
LABELV $721
ADDRLP4 24
CNSTI4 -1
ASGNI4
LABELV $722
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 1066
;1066:				if (client->pers.physicsFps.acceptedSetting) {
ADDRLP4 0
INDIRP4
CNSTI4 42512
ADDP4
INDIRI4
CNSTI4 0
EQI4 $723
line 1067
;1067:					notification = va("cp \"^2Anti-Toggle active.\n^7Next com_physicsFps change allowed in %d seconds. \nPlease go back to %d fps.\n\"", timeToNextChange / 1000, client->pers.physicsFps.acceptedSetting);
ADDRGP4 $725
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 1000
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 42512
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
ASGNP4
line 1068
;1068:				}
ADDRGP4 $724
JUMPV
LABELV $723
line 1069
;1069:				else {
line 1073
;1070:					// Should never happen?
;1071:					// Somehow we have a valid client setting, no accepted setting yet, and yet the value was not formally accepted.
;1072:					// Only adding this for debugging in case strange things happen.
;1073:					notification = va("cp \"^2Anti-Toggle active.\n^7Anomaly detected. Please try setting com_physicsFps again \n(time to next allowed change: %d).\n\"", timeToNextChange);
ADDRGP4 $726
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
ASGNP4
line 1074
;1074:				}
LABELV $724
line 1075
;1075:			}
LABELV $715
line 1076
;1076:		}
LABELV $712
LABELV $710
line 1077
;1077:	}
LABELV $665
line 1079
;1078:
;1079:	if (notification) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $727
line 1080
;1080:		if ((client->pers.physicsFps.lastNotification + 1000) > level.time && client->pers.physicsFps.lastNotification <= level.time) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 42524
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1000
ADDI4
ADDRGP4 level+36
INDIRI4
LEI4 $729
ADDRLP4 12
INDIRI4
ADDRGP4 level+36
INDIRI4
GTI4 $729
line 1081
;1081:			return qfalse; // Don't spam. Once every 1 second is enough to stay constant on the screen of the client
CNSTI4 0
RETI4
ADDRGP4 $661
JUMPV
LABELV $729
line 1083
;1082:		}
;1083:		else {
line 1084
;1084:			G_SendServerCommand(client - level.clients, notification,qtrue);
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
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 1085
;1085:			client->pers.physicsFps.lastNotification = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 42524
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1086
;1086:		}
line 1087
;1087:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $661
JUMPV
LABELV $727
line 1089
;1088:	}
;1089:	else {
line 1090
;1090:		return qtrue;
CNSTI4 1
RETI4
LABELV $661
endproc ClientCheckNotifyPhysicsFps 36 12
export ClientTimerActions
proc ClientTimerActions 20 0
line 1101
;1091:	}
;1092:}
;1093:
;1094:/*
;1095:==================
;1096:ClientTimerActions
;1097:
;1098:Actions that happen once a second
;1099:==================
;1100:*/
;1101:void ClientTimerActions( gentity_t *ent, int msec ) {
line 1104
;1102:	gclient_t	*client;
;1103:
;1104:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1105
;1105:	client->timeResidual += msec;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 43732
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $736
JUMPV
LABELV $735
line 1108
;1106:
;1107:	while ( client->timeResidual >= 1000 ) 
;1108:	{
line 1109
;1109:		client->timeResidual -= 1000;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 43732
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 1112
;1110:
;1111:		// count down health when over max
;1112:		if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $738
line 1113
;1113:			ent->health--;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1114
;1114:		}
LABELV $738
line 1117
;1115:
;1116:		// count down armor when over max
;1117:		if ( client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $740
line 1118
;1118:			client->ps.stats[STAT_ARMOR]--;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1119
;1119:		}
LABELV $740
line 1120
;1120:	}
LABELV $736
line 1107
ADDRLP4 0
INDIRP4
CNSTI4 43732
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $735
line 1121
;1121:}
LABELV $734
endproc ClientTimerActions 20 0
export ClientIntermissionThink
proc ClientIntermissionThink 24 0
line 1128
;1122:
;1123:/*
;1124:====================
;1125:ClientIntermissionThink
;1126:====================
;1127:*/
;1128:void ClientIntermissionThink( gclient_t *client ) {
line 1129
;1129:	client->ps.eFlags &= ~EF_TALK;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 1130
;1130:	client->ps.eFlags &= ~EF_FIRING;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 1135
;1131:
;1132:	// the level will exit when everyone wants to or after timeouts
;1133:
;1134:	// swap and latch button actions
;1135:	client->oldbuttons = client->buttons;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 43612
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 43608
ADDP4
INDIRI4
ASGNI4
line 1136
;1136:	client->buttons = client->pers.cmd.buttons;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 43608
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
ASGNI4
line 1137
;1137:	if ( client->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) & ( client->oldbuttons ^ client->buttons ) ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 43608
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
BANDI4
ADDRLP4 16
INDIRP4
CNSTI4 43612
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
BXORI4
BANDI4
CNSTI4 0
EQI4 $743
line 1139
;1138:		// this used to be an ^1 but once a player says ready, it should stick
;1139:		client->readyToExit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 43596
ADDP4
CNSTI4 1
ASGNI4
line 1140
;1140:	}
LABELV $743
line 1141
;1141:}
LABELV $742
endproc ClientIntermissionThink 24 0
export ClientEvents
proc ClientEvents 68 32
line 1152
;1142:
;1143:
;1144:/*
;1145:================
;1146:ClientEvents
;1147:
;1148:Events will be passed on to the clients for presentation,
;1149:but any server game effects are handled here
;1150:================
;1151:*/
;1152:void ClientEvents( gentity_t *ent, int oldEventSequence ) {
line 1161
;1153:	int		i;//, j;
;1154:	int		event;
;1155:	gclient_t *client;
;1156:	int		damage;
;1157://	vec3_t	origin, angles;
;1158://	qboolean	fired;
;1159://	gitem_t *item;
;1160://	gentity_t *drop;
;1161:	int nowTime = LEVELTIME(ent->client);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $750
ADDRLP4 28
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $750
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $752
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $753
JUMPV
LABELV $752
ADDRLP4 24
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $753
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
ADDRGP4 $751
JUMPV
LABELV $750
ADDRLP4 20
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $751
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
line 1163
;1162:
;1163:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1165
;1164:
;1165:	if ( !client ) return;
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $754
ADDRGP4 $745
JUMPV
LABELV $754
line 1167
;1166:
;1167:	if ( oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS ) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $756
line 1168
;1168:		oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 1169
;1169:	}
LABELV $756
line 1170
;1170:	for ( i = oldEventSequence ; i < client->ps.eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $761
JUMPV
LABELV $758
line 1171
;1171:		event = client->ps.events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 116
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1173
;1172:
;1173:		switch ( event ) {
ADDRLP4 36
CNSTI4 15
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $764
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
GTI4 $786
LABELV $785
ADDRLP4 4
INDIRI4
CNSTI4 11
EQI4 $764
ADDRGP4 $763
JUMPV
LABELV $786
ADDRLP4 44
CNSTI4 24
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $776
ADDRLP4 4
INDIRI4
CNSTI4 25
EQI4 $777
ADDRLP4 4
INDIRI4
CNSTI4 26
EQI4 $778
ADDRLP4 4
INDIRI4
ADDRLP4 44
INDIRI4
LTI4 $763
LABELV $787
ADDRLP4 4
INDIRI4
CNSTI4 41
LTI4 $763
ADDRLP4 4
INDIRI4
CNSTI4 46
GTI4 $763
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $788-164
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $788
address $779
address $780
address $781
address $763
address $783
address $784
code
LABELV $764
line 1176
;1174:		case EV_FALL:
;1175:		case EV_ROLL:
;1176:			{
line 1177
;1177:				int delta = client->ps.eventParms[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 52
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 124
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1179
;1178:
;1179:				if ( client->ps.fallingToDeath )
ADDRLP4 8
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $765
line 1180
;1180:				{
line 1181
;1181:					break;
ADDRGP4 $763
JUMPV
LABELV $765
line 1184
;1182:				}
;1183:
;1184:				if (client && client->sess.raceMode)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $767
ADDRLP4 8
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $767
line 1185
;1185:					break;
ADDRGP4 $763
JUMPV
LABELV $767
line 1187
;1186:
;1187:				if ( ent->s.eType != ET_PLAYER )
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $769
line 1188
;1188:				{
line 1189
;1189:					break;		// not in the player model
ADDRGP4 $763
JUMPV
LABELV $769
line 1192
;1190:				}
;1191:				
;1192:				if ( g_dmflags.integer & DF_NO_FALLING )
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $771
line 1193
;1193:				{
line 1194
;1194:					break;
ADDRGP4 $763
JUMPV
LABELV $771
line 1197
;1195:				}
;1196:
;1197:				if (delta <= 44)
ADDRLP4 52
INDIRI4
CNSTI4 44
GTI4 $774
line 1198
;1198:				{
line 1199
;1199:					break;
ADDRGP4 $763
JUMPV
LABELV $774
line 1202
;1200:				}
;1201:
;1202:				damage = delta*0.16; //good enough for now, I guess
ADDRLP4 16
CNSTF4 1042536202
ADDRLP4 52
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1204
;1203:
;1204:				ent->pain_debounce_time = nowTime + 200;	// no normal pain sound
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1205
;1205:				G_Damage (ent, NULL, NULL, NULL, NULL, damage, DAMAGE_NO_ARMOR, MOD_FALLING);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
CNSTP4 0
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
CNSTP4 0
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 34
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1206
;1206:			}
line 1207
;1207:			break;
ADDRGP4 $763
JUMPV
LABELV $776
line 1209
;1208:		case EV_FIRE_WEAPON:
;1209:			FireWeapon( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 FireWeapon
CALLV
pop
line 1210
;1210:			ent->client->dangerTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43800
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1211
;1211:			ent->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 1212
;1212:			ent->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43588
ADDP4
CNSTI4 0
ASGNI4
line 1213
;1213:			break;
ADDRGP4 $763
JUMPV
LABELV $777
line 1216
;1214:
;1215:		case EV_ALT_FIRE:
;1216:			FireWeapon( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 FireWeapon
CALLV
pop
line 1217
;1217:			ent->client->dangerTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43800
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1218
;1218:			ent->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 1219
;1219:			ent->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43588
ADDP4
CNSTI4 0
ASGNI4
line 1220
;1220:			break;
ADDRGP4 $763
JUMPV
LABELV $778
line 1223
;1221:
;1222:		case EV_SABER_ATTACK:
;1223:			ent->client->dangerTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43800
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1224
;1224:			ent->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 1225
;1225:			ent->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43588
ADDP4
CNSTI4 0
ASGNI4
line 1226
;1226:			break;
ADDRGP4 $763
JUMPV
LABELV $779
line 1230
;1227:
;1228:		//rww - Note that these must be in the same order (ITEM#-wise) as they are in holdable_t
;1229:		case EV_USE_ITEM1: //seeker droid
;1230:			ItemUse_Seeker(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Seeker
CALLV
pop
line 1231
;1231:			break;
ADDRGP4 $763
JUMPV
LABELV $780
line 1233
;1232:		case EV_USE_ITEM2: //shield
;1233:			ItemUse_Shield(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Shield
CALLV
pop
line 1234
;1234:			break;
ADDRGP4 $763
JUMPV
LABELV $781
line 1236
;1235:		case EV_USE_ITEM3: //medpack
;1236:			ItemUse_MedPack(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_MedPack
CALLV
pop
line 1237
;1237:			break;
ADDRGP4 $763
JUMPV
line 1240
;1238:		case EV_USE_ITEM4: //datapad
;1239:			//G_Printf("Used Datapad\n");
;1240:			break;
LABELV $783
line 1242
;1241:		case EV_USE_ITEM5: //binoculars
;1242:			ItemUse_Binoculars(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Binoculars
CALLV
pop
line 1243
;1243:			break;
ADDRGP4 $763
JUMPV
LABELV $784
line 1245
;1244:		case EV_USE_ITEM6: //sentry gun
;1245:			ItemUse_Sentry(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Sentry
CALLV
pop
line 1246
;1246:			break;
line 1249
;1247:
;1248:		default:
;1249:			break;
LABELV $763
line 1251
;1250:		}
;1251:	}
LABELV $759
line 1170
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $761
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
LTI4 $758
line 1253
;1252:
;1253:}
LABELV $745
endproc ClientEvents 68 32
export SendPendingPredictableEvents
proc SendPendingPredictableEvents 40 12
line 1260
;1254:
;1255:/*
;1256:==============
;1257:SendPendingPredictableEvents
;1258:==============
;1259:*/
;1260:void SendPendingPredictableEvents( playerState_t *ps ) {
line 1266
;1261:	gentity_t *t;
;1262:	int event, seq;
;1263:	int extEvent, number;
;1264:
;1265:	// if there are still events pending
;1266:	if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
GEI4 $791
line 1269
;1267:		// create a temporary entity for this event which is sent to everyone
;1268:		// except the client who generated the event
;1269:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 1270
;1270:		event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 116
ADDP4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 1272
;1271:		// set external event to zero before calling BG_PlayerStateToEntityState
;1272:		extEvent = ps->externalEvent;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 1273
;1273:		ps->externalEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTI4 0
ASGNI4
line 1275
;1274:		// create temporary entity for event
;1275:		t = G_TempEntity( ps->origin, event );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1276
;1276:		number = t->s.number;
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 1277
;1277:		BG_PlayerStateToEntityState( ps, &t->s, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1278
;1278:		t->s.number = number;
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1279
;1279:		t->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1280
;1280:		t->s.eFlags |= EF_PLAYER_EVENT;
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
CNSTI4 16
BORI4
ASGNI4
line 1281
;1281:		t->s.otherEntityNum = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 1283
;1282:		// send to everyone except the client who generated the event
;1283:		t->r.svFlags |= SVF_NOTSINGLECLIENT;
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
CNSTI4 2048
BORI4
ASGNI4
line 1284
;1284:		t->r.singleClient = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 308
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 1286
;1285:		// set back external event
;1286:		ps->externalEvent = extEvent;
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1287
;1287:	}
LABELV $791
line 1288
;1288:}
LABELV $790
endproc SendPendingPredictableEvents 40 12
proc G_UpdateForceSightBroadcasts 72 12
line 1308
;1289:
;1290:extern int saberOffSound;
;1291:extern int saberOnSound;
;1292:
;1293:/*
;1294:==================
;1295:G_UpdateClientBroadcasts
;1296:
;1297:Determines whether this client should be broadcast to any other clients.  
;1298:A client is broadcast when another client is using force sight or is
;1299:==================
;1300:*/
;1301:#define MAX_JEDIMASTER_DISTANCE	2500
;1302:#define MAX_JEDIMASTER_FOV		100
;1303:
;1304:#define MAX_SIGHT_DISTANCE		1500
;1305:#define MAX_SIGHT_FOV			100
;1306:
;1307:static void G_UpdateForceSightBroadcasts ( gentity_t *self )
;1308:{
line 1312
;1309:	int i;
;1310:
;1311:	// Any clients with force sight on should see this client
;1312:	for ( i = 0; i < level.numConnectedClients; i ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $797
JUMPV
LABELV $794
line 1313
;1313:	{
line 1314
;1314:		gentity_t *ent = &g_entities[level.sortedClients[i]];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+96
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1318
;1315:		float	  dist;
;1316:		vec3_t	  angles;
;1317:	
;1318:		if ( ent == self )
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $800
line 1319
;1319:		{
line 1320
;1320:			continue;
ADDRGP4 $795
JUMPV
LABELV $800
line 1324
;1321:		}
;1322:
;1323:		// Not using force sight so we shouldnt broadcast to this one
;1324:		if ( !(ent->client->ps.fd.forcePowersActive & (1<<FP_SEE) ) )
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 848
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
NEI4 $802
line 1325
;1325:		{
line 1326
;1326:			continue;
ADDRGP4 $795
JUMPV
LABELV $802
line 1329
;1327:		}
;1328:
;1329:		VectorSubtract( self->client->ps.origin, ent->client->ps.origin, angles );
ADDRLP4 24
CNSTI4 408
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
CNSTI4 20
ASGNI4
ADDRLP4 36
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 24
ASGNI4
ADDRLP4 8+4
ADDRLP4 28
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 408
ASGNI4
ADDRLP4 48
CNSTI4 28
ASGNI4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1330
;1330:		dist = VectorLengthSquared ( angles );
ADDRLP4 8
ARGP4
ADDRLP4 52
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 1331
;1331:		vectoangles ( angles, angles );
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1334
;1332:
;1333:		// Too far away then just forget it
;1334:		if ( dist > MAX_SIGHT_DISTANCE * MAX_SIGHT_DISTANCE )
ADDRLP4 20
INDIRF4
CNSTF4 1242125376
LEF4 $806
line 1335
;1335:		{
line 1336
;1336:			continue;
ADDRGP4 $795
JUMPV
LABELV $806
line 1340
;1337:		}
;1338:		
;1339:		// If not within the field of view then forget it
;1340:		if ( !InFieldOfVision ( ent->client->ps.viewangles, MAX_SIGHT_FOV, angles ) )
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
ARGP4
ADDRLP4 56
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $808
line 1341
;1341:		{
line 1342
;1342:			break;
ADDRGP4 $796
JUMPV
LABELV $808
line 1347
;1343:		}
;1344:
;1345:		// Turn on the broadcast bit for the master and since there is only one
;1346:		// master we are done
;1347:		self->r.broadcastClients[ent->s.number/32] |= (1 << (ent->s.number%32));
ADDRLP4 60
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 64
CNSTI4 32
ASGNI4
ADDRLP4 68
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
DIVI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
MODI4
LSHI4
BORI4
ASGNI4
line 1349
;1348:	
;1349:		break;
ADDRGP4 $796
JUMPV
LABELV $795
line 1312
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $797
ADDRLP4 0
INDIRI4
ADDRGP4 level+80
INDIRI4
LTI4 $794
LABELV $796
line 1351
;1350:	}
;1351:}
LABELV $793
endproc G_UpdateForceSightBroadcasts 72 12
proc G_UpdateJediMasterBroadcasts 72 12
line 1354
;1352:
;1353:static void G_UpdateJediMasterBroadcasts ( gentity_t *self )
;1354:{
line 1358
;1355:	int i;
;1356:
;1357:	// Not jedi master mode then nothing to do
;1358:	if ( g_gametype.integer != GT_JEDIMASTER )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $811
line 1359
;1359:	{
line 1360
;1360:		return;
ADDRGP4 $810
JUMPV
LABELV $811
line 1364
;1361:	}
;1362:
;1363:	// This client isnt the jedi master so it shouldnt broadcast
;1364:	if ( !self->client->ps.isJediMaster )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
NEI4 $814
line 1365
;1365:	{
line 1366
;1366:		return;
ADDRGP4 $810
JUMPV
LABELV $814
line 1370
;1367:	}
;1368:
;1369:	// Broadcast ourself to all clients within range
;1370:	for ( i = 0; i < level.numConnectedClients; i ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $819
JUMPV
LABELV $816
line 1371
;1371:	{
line 1372
;1372:		gentity_t *ent = &g_entities[level.sortedClients[i]];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+96
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1376
;1373:		float	  dist;
;1374:		vec3_t	  angles;
;1375:
;1376:		if ( ent == self )
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $822
line 1377
;1377:		{
line 1378
;1378:			continue;
ADDRGP4 $817
JUMPV
LABELV $822
line 1381
;1379:		}
;1380:
;1381:		VectorSubtract( self->client->ps.origin, ent->client->ps.origin, angles );
ADDRLP4 24
CNSTI4 408
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
CNSTI4 20
ASGNI4
ADDRLP4 36
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 24
ASGNI4
ADDRLP4 8+4
ADDRLP4 28
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 408
ASGNI4
ADDRLP4 48
CNSTI4 28
ASGNI4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1382
;1382:		dist = VectorLengthSquared ( angles );
ADDRLP4 8
ARGP4
ADDRLP4 52
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 1383
;1383:		vectoangles ( angles, angles );
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1386
;1384:
;1385:		// Too far away then just forget it
;1386:		if ( dist > MAX_JEDIMASTER_DISTANCE * MAX_JEDIMASTER_DISTANCE )
ADDRLP4 20
INDIRF4
CNSTF4 1254013984
LEF4 $826
line 1387
;1387:		{
line 1388
;1388:			continue;
ADDRGP4 $817
JUMPV
LABELV $826
line 1392
;1389:		}
;1390:		
;1391:		// If not within the field of view then forget it
;1392:		if ( !InFieldOfVision ( ent->client->ps.viewangles, MAX_JEDIMASTER_FOV, angles ) )
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
ARGP4
ADDRLP4 56
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $828
line 1393
;1393:		{
line 1394
;1394:			continue;
ADDRGP4 $817
JUMPV
LABELV $828
line 1399
;1395:		}
;1396:
;1397:		// Turn on the broadcast bit for the master and since there is only one
;1398:		// master we are done
;1399:		self->r.broadcastClients[ent->s.number/32] |= (1 << (ent->s.number%32));
ADDRLP4 60
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 64
CNSTI4 32
ASGNI4
ADDRLP4 68
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
DIVI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
MODI4
LSHI4
BORI4
ASGNI4
line 1400
;1400:	}
LABELV $817
line 1370
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $819
ADDRLP4 0
INDIRI4
ADDRGP4 level+80
INDIRI4
LTI4 $816
line 1401
;1401:}
LABELV $810
endproc G_UpdateJediMasterBroadcasts 72 12
proc G_UpdateIronmanBroadcasts 36 4
line 1404
;1402:
;1403:static void G_UpdateIronmanBroadcasts ( gentity_t *self )
;1404:{
line 1408
;1405:	int i;
;1406:
;1407:	// Not iron man mode then nothing to do
;1408:	if ( self->client->sess.mode != MODE_IRONMAN )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
CNSTI4 5
EQI4 $831
line 1409
;1409:	{
line 1410
;1410:		return;
ADDRGP4 $830
JUMPV
LABELV $831
line 1414
;1411:	}
;1412:
;1413:	// This client isnt the ironman so it shouldnt broadcast
;1414:	if ( !self->client->isIronMan )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 53188
ADDP4
INDIRI4
CNSTI4 0
NEI4 $833
line 1415
;1415:	{
line 1417
;1416:		// check if we are at least close to the ironman
;1417:		if (level.ironManCurrentPositionSet) {
ADDRGP4 level+30592
INDIRI4
CNSTI4 0
EQI4 $830
line 1419
;1418:			vec3_t delta;
;1419:			VectorSubtract(level.ironManCurrentPosition,self->client->ps.origin,delta);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 4
ADDRGP4 level+30580
INDIRF4
ADDRLP4 16
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRGP4 level+30580+4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRGP4 level+30580+8
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
line 1420
;1420:			if (VectorLengthSquared(delta) > IRONMAN_NEARBYBROADCASTRANGE* IRONMAN_NEARBYBROADCASTRANGE) {
ADDRLP4 4
ARGP4
ADDRLP4 20
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 20
INDIRF4
CNSTF4 1232348160
LEF4 $836
line 1423
;1421:				// broadcast players near the ironman as well. so demos dont miss out on any cool dbs :)
;1422:				// we don't rly care about wallhack or anything in ironman anyway
;1423:				return;
ADDRGP4 $830
JUMPV
line 1425
;1424:			}
;1425:		}
line 1426
;1426:		else {
line 1427
;1427:			return;
LABELV $836
line 1429
;1428:		}
;1429:	}
LABELV $833
line 1432
;1430:
;1431:	// Broadcast ourself to all iron manners
;1432:	for ( i = 0; i < level.numConnectedClients; i ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $850
JUMPV
LABELV $847
line 1433
;1433:	{
line 1434
;1434:		gentity_t *ent = &g_entities[level.sortedClients[i]];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+96
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1438
;1435:		float	  dist;
;1436:		vec3_t	  angles;
;1437:
;1438:		if ( ent == self )
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $853
line 1439
;1439:		{
line 1440
;1440:			continue;
ADDRGP4 $848
JUMPV
LABELV $853
line 1443
;1441:		}
;1442:
;1443:		if (ent->client->sess.mode != MODE_IRONMAN) {
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
CNSTI4 5
EQI4 $855
line 1444
;1444:			continue;
ADDRGP4 $848
JUMPV
LABELV $855
line 1466
;1445:		}
;1446:
;1447:		// for ironman ignore distance. does it matter?
;1448:		/*VectorSubtract(self->client->ps.origin, ent->client->ps.origin, angles);
;1449:		dist = VectorLengthSquared ( angles );
;1450:		vectoangles ( angles, angles );
;1451:
;1452:		// Too far away then just forget it
;1453:		if ( dist > MAX_JEDIMASTER_DISTANCE * MAX_JEDIMASTER_DISTANCE )
;1454:		{
;1455:			continue;
;1456:		}
;1457:		
;1458:		// If not within the field of view then forget it
;1459:		if ( !InFieldOfVision ( ent->client->ps.viewangles, MAX_JEDIMASTER_FOV, angles ) )
;1460:		{
;1461:			continue;
;1462:		}*/
;1463:
;1464:		// Turn on the broadcast bit for the master and since there is only one
;1465:		// master we are done
;1466:		self->r.broadcastClients[ent->s.number/32] |= (1 << (ent->s.number%32));
ADDRLP4 24
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
CNSTI4 32
ASGNI4
ADDRLP4 32
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
DIVI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 24
INDIRI4
ADDRLP4 28
INDIRI4
MODI4
LSHI4
BORI4
ASGNI4
line 1467
;1467:	}
LABELV $848
line 1432
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $850
ADDRLP4 0
INDIRI4
ADDRGP4 level+80
INDIRI4
LTI4 $847
line 1468
;1468:}
LABELV $830
endproc G_UpdateIronmanBroadcasts 36 4
export G_UpdateClientBroadcasts
proc G_UpdateClientBroadcasts 0 12
line 1471
;1469:
;1470:void G_UpdateClientBroadcasts ( gentity_t *self )
;1471:{
line 1473
;1472:	// Clear all the broadcast bits for this client
;1473:	memset ( self->r.broadcastClients, 0, sizeof ( self->r.broadcastClients ) );
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 8
ARGU4
ADDRGP4 memset
CALLP4
pop
line 1476
;1474:
;1475:	// The jedi master is broadcast to everyone in range
;1476:	G_UpdateJediMasterBroadcasts ( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UpdateJediMasterBroadcasts
CALLV
pop
line 1479
;1477:
;1478:	// The ironman is broadcast to everyone
;1479:	G_UpdateIronmanBroadcasts( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UpdateIronmanBroadcasts
CALLV
pop
line 1482
;1480:
;1481:	// Anyone with force sight on should see this client
;1482:	G_UpdateForceSightBroadcasts ( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UpdateForceSightBroadcasts
CALLV
pop
line 1483
;1483:}
LABELV $857
endproc G_UpdateClientBroadcasts 0 12
export UpdateClientPastFpsStats
proc UpdateClientPastFpsStats 84 4
line 1487
;1484:
;1485:qboolean DF_PrePmoveValid(gentity_t* ent);
;1486:
;1487:void UpdateClientPastFpsStats(gentity_t* ent, int msec) {
line 1488
;1488:	entityState_t* stats = &level.playerStats[ent-g_entities]->s;
ADDRLP4 4
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
ADDRGP4 level+9152
ADDP4
INDIRP4
ASGNP4
line 1489
;1489:	fpsMeasure_t* fpsMeasure = &ent->client->pers.fpsMeasure;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43276
ADDP4
ASGNP4
line 1490
;1490:	ent->client->lastMsecValue = msec;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43920
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1491
;1491:	if (stats->pastFpsUnionArray[0] != msec || // if fps is stable and unchanging, dont spam index changes, what for...
ADDRLP4 12
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $864
ADDRLP4 4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $864
ADDRLP4 4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $864
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $860
LABELV $864
line 1494
;1492:		stats->pastFpsUnionArray[1] != msec ||
;1493:		stats->pastFpsUnionArray[2] != msec ||
;1494:		stats->pastFpsUnionArray[3] != msec) {
line 1496
;1495:
;1496:		stats->pastFpsUnionArray[stats->fireflag++] = msec;
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 1497
;1497:		stats->fireflag = stats->fireflag & (PLAYERSTATS_PAST_MSEC - 1);
ADDRLP4 24
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 3
BANDI4
ASGNI4
line 1498
;1498:	}
LABELV $860
line 1500
;1499:
;1500:	fpsMeasure->frameTimes[fpsMeasure->index++ % MAX_FPSMEASURE_FRAMECOUNT] = msec;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 32
MODI4
CNSTI4 1
LSHI4
ADDRLP4 0
INDIRP4
ADDP4
ADDRFP4 4
INDIRI4
CVII2 4
ASGNI2
line 1501
;1501:	if (fpsMeasure->index < MAX_FPSMEASURE_FRAMECOUNT) return;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 32
GEI4 $865
ADDRGP4 $858
JUMPV
LABELV $865
line 1502
;1502:	if (ent->client->sess.raceMode && ent->client->pers.raceStartCommandTime) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $867
ADDRLP4 24
INDIRP4
CNSTI4 22064
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $867
line 1504
;1503:		int i;
;1504:		int total = 0, totalShort = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 40
CNSTI4 0
ASGNI4
line 1506
;1505:		int guess, guessShort;
;1506:		for (i = 0; i < MAX_FPSMEASURE_FRAMECOUNT; i++) {
ADDRLP4 32
CNSTI4 0
ASGNI4
LABELV $869
line 1507
;1507:			total += fpsMeasure->frameTimes[i];
ADDRLP4 36
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI2
CVII4 2
ADDI4
ASGNI4
line 1508
;1508:		}
LABELV $870
line 1506
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 32
LTI4 $869
line 1509
;1509:		for (i = fpsMeasure->index - MAX_FPSMEASURE_SHORT_FRAMECOUNT; i < fpsMeasure->index; i++) {
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
ADDRGP4 $876
JUMPV
LABELV $873
line 1510
;1510:			totalShort += fpsMeasure->frameTimes[i % MAX_FPSMEASURE_FRAMECOUNT];
ADDRLP4 40
ADDRLP4 40
INDIRI4
ADDRLP4 32
INDIRI4
CNSTI4 32
MODI4
CNSTI4 1
LSHI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI2
CVII4 2
ADDI4
ASGNI4
line 1511
;1511:		}
LABELV $874
line 1509
ADDRLP4 32
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $876
ADDRLP4 32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
LTI4 $873
line 1512
;1512:		guess = (int)(roundf((float)total / (float)MAX_FPSMEASURE_FRAMECOUNT) + 0.5f);
ADDRLP4 36
INDIRI4
CVIF4 4
CNSTF4 1107296256
DIVF4
ARGF4
ADDRLP4 52
ADDRGP4 roundf
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 52
INDIRF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1513
;1513:		guessShort = (int)(roundf((float)totalShort / (float)MAX_FPSMEASURE_SHORT_FRAMECOUNT) + 0.5f);
ADDRLP4 40
INDIRI4
CVIF4 4
CNSTF4 1090519040
DIVF4
ARGF4
ADDRLP4 56
ADDRGP4 roundf
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 56
INDIRF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 1514
;1514:		if (guess == guessShort) {
ADDRLP4 44
INDIRI4
ADDRLP4 48
INDIRI4
NEI4 $877
line 1520
;1515:			// we compare a short sequence average to a long sequence average and thus combine their strengths and reduce their weaknesses
;1516:			// long sequence is reliable (can even be 0% error if client fps is stable) but fps toggles will cause ~2-5% false readings during the transition
;1517:			// short sequences are more dynamic but have an error rate above 0%, up to 5% typically (assuming stable-ish framerate in client again)
;1518:			// When we compare the long and short average, we reduce the overall error rate to something like 0.1-0.2% per fps toggle.
;1519:			// We lose some samples that might have been good but false readings are significantly reduced.
;1520:			ent->client->pers.stats.fpsStats.msecCounts[fpsTableMsecToIndex[MAX(0, MIN(FPSTABLE_OVERFLOW_MSECVALUE, guess))]]++;
CNSTI4 1001
ADDRLP4 44
INDIRI4
GEI4 $884
ADDRLP4 64
CNSTI4 1001
ASGNI4
ADDRGP4 $885
JUMPV
LABELV $884
ADDRLP4 64
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $885
CNSTI4 0
ADDRLP4 64
INDIRI4
LEI4 $882
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRGP4 $883
JUMPV
LABELV $882
CNSTI4 1001
ADDRLP4 44
INDIRI4
GEI4 $886
ADDRLP4 68
CNSTI4 1001
ASGNI4
ADDRGP4 $887
JUMPV
LABELV $886
ADDRLP4 68
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $887
ADDRLP4 60
ADDRLP4 68
INDIRI4
ASGNI4
LABELV $883
ADDRLP4 72
CNSTI4 2
ASGNI4
ADDRLP4 76
ADDRLP4 60
INDIRI4
ADDRLP4 72
INDIRI4
LSHI4
ADDRGP4 fpsTableMsecToIndex
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 42744
ADDP4
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1521
;1521:			ent->client->pers.stats.fpsStats.totalCount++;
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43000
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1522
;1522:		}
LABELV $877
line 1523
;1523:	}
LABELV $867
line 1525
;1524:
;1525:}
LABELV $858
endproc UpdateClientPastFpsStats 84 4
export GetUpdatedViewAngles
proc GetUpdatedViewAngles 16 0
line 1528
;1526:
;1527:// Simplified version of PM_UpdateViewAngles. Just to see where we are looking right now without doing pmove first
;1528:void GetUpdatedViewAngles(gentity_t* ent, vec3_t out) {
line 1541
;1529:		short		temp;
;1530:		int		i;
;1531:
;1532:		//if (ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPINTERMISSION) {
;1533:		//	return;		// no view changes at all
;1534:		//}
;1535:
;1536:		//if (ps->pm_type != PM_SPECTATOR && ps->stats[STAT_HEALTH] <= 0) {
;1537:		//	return;		// no view changes at all
;1538:		//}
;1539:
;1540:		// circularly clamp the angles with deltas
;1541:		for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $889
line 1542
;1542:			temp = ent->client->pers.cmd.angles[i] + ent->client->ps.delta_angles[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 1388
ADDP4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 68
ADDP4
ADDP4
INDIRI4
ADDI4
CVII2 4
ASGNI2
line 1543
;1543:			if (i == PITCH) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $893
line 1544
;1544:				if (temp > 16000) {
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 16000
LEI4 $895
line 1545
;1545:					temp = 16000;
ADDRLP4 4
CNSTI2 16000
ASGNI2
line 1546
;1546:				}
ADDRGP4 $896
JUMPV
LABELV $895
line 1547
;1547:				else if (temp < -16000) {
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 -16000
GEI4 $897
line 1548
;1548:					temp = -16000;
ADDRLP4 4
CNSTI2 -16000
ASGNI2
line 1549
;1549:				}
LABELV $897
LABELV $896
line 1550
;1550:			}
LABELV $893
line 1551
;1551:			out[i] = SHORT2ANGLE(temp);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTF4 1001652224
ADDRLP4 4
INDIRI2
CVII4 2
CVIF4 4
MULF4
ASGNF4
line 1552
;1552:		}
LABELV $890
line 1541
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $889
line 1554
;1553:
;1554:}
LABELV $888
endproc GetUpdatedViewAngles 16 0
export checkLaserpointerValid
proc checkLaserpointerValid 20 4
line 1557
;1555:
;1556:// sanity check that the client still exists and knows about this checkpoint andsuch.
;1557:void checkLaserpointerValid(gentity_t* ent) {
line 1562
;1558:	gentity_t* owner;
;1559:	int i;
;1560:	int lpNum;
;1561:
;1562:	if (!ent->parent) {
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $900
line 1563
;1563:		goto freeme;
ADDRGP4 $902
JUMPV
line 1564
;1564:		return;
LABELV $900
line 1566
;1565:	}
;1566:	owner = ent->parent;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
line 1568
;1567:
;1568:	if (!owner->inuse || !owner->client || owner->client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $906
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
CNSTU4 0
EQU4 $906
ADDRLP4 16
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $903
LABELV $906
line 1569
;1569:		goto freeme;
ADDRGP4 $902
JUMPV
line 1570
;1570:		return;
LABELV $903
line 1573
;1571:	}
;1572:
;1573:	lpNum = ent - g_entities;
ADDRLP4 4
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
line 1574
;1574:	if (owner->client->pers.laserPointerNum == lpNum) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43084
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $907
line 1577
;1575:
;1576:		// ok the client is still active and still knows about this checkpoint. keep it.
;1577:		ent->think = checkLaserpointerValid;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 checkLaserpointerValid
ASGNP4
line 1578
;1578:		ent->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1579
;1579:		return;
ADDRGP4 $899
JUMPV
LABELV $907
LABELV $902
line 1583
;1580:	}
;1581:
;1582:freeme:
;1583:	ent->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
CNSTP4 0
ASGNP4
line 1584
;1584:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
CNSTI4 0
ASGNI4
line 1585
;1585:	G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1587
;1586:
;1587:}
LABELV $899
endproc checkLaserpointerValid 20 4
export ClientLaserPointer
proc ClientLaserPointer 1160 28
line 1589
;1588:
;1589:void ClientLaserPointer(gentity_t* ent) {
line 1591
;1590:	vec3_t viewAngles,fwd,end;
;1591:	gentity_t* lp = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1592
;1592:	qboolean eventflip = qfalse;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 1594
;1593:	trace_t tr;
;1594:	int flipDelay = 1000/g_sv_fps.integer;
ADDRLP4 1112
CNSTI4 1000
ADDRGP4 g_sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 1595
;1595:	if (ent->client->pers.laserPointerNum) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43084
ADDP4
INDIRI4
CNSTI4 0
EQI4 $912
line 1596
;1596:		lp = g_entities + ent->client->pers.laserPointerNum;
ADDRLP4 0
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43084
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1597
;1597:		if (!(lp->s.eType == ET_BEAM && lp->parent == ent && lp->s.generic1 == 3)) { // hmm sth went wrong
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 7
NEI4 $917
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $917
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 3
EQI4 $914
LABELV $917
line 1598
;1598:			lp = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 1599
;1599:			ent->client->pers.laserPointerNum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43084
ADDP4
CNSTI4 0
ASGNI4
line 1600
;1600:		}
LABELV $914
line 1601
;1601:	}
LABELV $912
line 1604
;1602:
;1603:
;1604:	GetUpdatedViewAngles(ent, viewAngles); // less delay than using ps.viewangles because pmove hasnt happened yet
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1116
ARGP4
ADDRGP4 GetUpdatedViewAngles
CALLV
pop
line 1605
;1605:	AngleVectors(viewAngles, fwd, NULL, NULL);
ADDRLP4 1116
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1128
CNSTP4 0
ASGNP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1606
;1606:	VectorMA(ent->client->ps.origin,3000.0f, fwd, end);
ADDRLP4 1132
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1136
CNSTF4 1161527296
ASGNF4
ADDRLP4 16
ADDRLP4 1132
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 1132
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1161527296
ADDRLP4 4+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1607
;1607:	JP_Trace(&tr, ent->client->ps.origin, NULL, NULL, end, ent->s.number, CONTENTS_SOLID | CONTENTS_BODY | CONTENTS_CORPSE);
ADDRLP4 32
ARGP4
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
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
ADDRLP4 16
ARGP4
ADDRLP4 1140
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1609
;1608:
;1609:	if (tr.startsolid) {
ADDRLP4 32+4
INDIRI4
CNSTI4 0
EQI4 $922
line 1610
;1610:		if (lp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $910
line 1611
;1611:			G_FreeEntity(lp);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1612
;1612:			ent->client->pers.laserPointerNum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43084
ADDP4
CNSTI4 0
ASGNI4
line 1613
;1613:		}
line 1614
;1614:		return;
ADDRGP4 $910
JUMPV
LABELV $922
line 1617
;1615:	}
;1616:
;1617:	if (!lp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $927
line 1618
;1618:		lp = G_Spawn();
ADDRLP4 1148
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1148
INDIRP4
ASGNP4
line 1619
;1619:		ent->client->pers.laserPointerNum = lp - g_entities;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43084
ADDP4
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
line 1620
;1620:		lp->s.eType = ET_BEAM;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
line 1621
;1621:		lp->s.generic1 = 3;
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
CNSTI4 3
ASGNI4
line 1622
;1622:		lp->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1623
;1623:		lp->s.owner = ent - g_entities;
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
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
line 1624
;1624:	}
LABELV $927
line 1626
;1625:
;1626:	VectorCopy(ent->client->ps.origin,lp->r.currentOrigin);
ADDRLP4 0
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
line 1627
;1627:	VectorCopy(ent->client->ps.origin,lp->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
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
line 1628
;1628:	VectorCopy(ent->client->ps.origin,lp->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
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
line 1629
;1629:	VectorCopy(tr.endpos,lp->s.origin2); 
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 32+12
INDIRB
ASGNB 12
line 1632
;1630:
;1631:	// these dont need to be that precise. snap them to save network bandwidth.
;1632:	trap_SnapVector(lp->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 1633
;1633:	trap_SnapVector(lp->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 1634
;1634:	trap_SnapVector(lp->s.origin2);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 1639
;1635:
;1636:
;1637:	//mv_entities[ent->client->pers.laserPointerNum].snapshotIgnore;
;1638:
;1639:	eventflip = (level.time >= lp->laserPointerLastEventFlip + flipDelay) || level.time < lp->laserPointerLastEventFlip;
ADDRLP4 1152
ADDRLP4 0
INDIRP4
CNSTI4 2312
ADDP4
INDIRI4
ASGNI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 1152
INDIRI4
ADDRLP4 1112
INDIRI4
ADDI4
GEI4 $935
ADDRGP4 level+36
INDIRI4
ADDRLP4 1152
INDIRI4
GEI4 $933
LABELV $935
ADDRLP4 1148
CNSTI4 1
ASGNI4
ADDRGP4 $934
JUMPV
LABELV $933
ADDRLP4 1148
CNSTI4 0
ASGNI4
LABELV $934
ADDRLP4 28
ADDRLP4 1148
INDIRI4
ASGNI4
line 1640
;1640:	if (eventflip || !lp->s.event) {
ADDRLP4 1156
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 1156
INDIRI4
NEI4 $938
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ADDRLP4 1156
INDIRI4
NEI4 $936
LABELV $938
line 1641
;1641:		G_AddEvent(lp, EV_TESTLINE,0);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 99
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1642
;1642:		lp->laserPointerLastEventFlip = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 2312
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1643
;1643:	}
LABELV $936
line 1644
;1644:	lp->s.time2 = flipDelay*4;
ADDRLP4 0
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 1112
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 1645
;1645:	lp->s.weapon = 0x0000ff;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 255
ASGNI4
line 1646
;1646:	lp->eventTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1649
;1647:	//lp->r.svFlags |= SVF_BROADCAST;
;1648:	
;1649:	ent->think = checkLaserpointerValid; // Is this really needed? can we do it better? idk
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 checkLaserpointerValid
ASGNP4
line 1650
;1650:	ent->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1652
;1651:
;1652:	trap_LinkEntity(lp);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1653
;1653:}
LABELV $910
endproc ClientLaserPointer 1160 28
export ClientKillLaserPointer
proc ClientKillLaserPointer 8 4
line 1654
;1654:void ClientKillLaserPointer(gentity_t* ent) {
line 1655
;1655:	if (ent->client->pers.laserPointerNum) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43084
ADDP4
INDIRI4
CNSTI4 0
EQI4 $943
line 1656
;1656:		gentity_t* lp = g_entities + ent->client->pers.laserPointerNum;
ADDRLP4 0
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43084
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1657
;1657:		if (lp->s.eType == ET_BEAM && lp->parent == ent && lp->s.generic1==3) { // generic1 == 3 just means its a laserpointer *shrug*
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 7
NEI4 $945
ADDRLP4 4
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $945
ADDRLP4 4
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
CNSTI4 3
NEI4 $945
line 1658
;1658:			G_FreeEntity(lp);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1659
;1659:		}
LABELV $945
line 1660
;1660:		ent->client->pers.laserPointerNum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43084
ADDP4
CNSTI4 0
ASGNI4
line 1661
;1661:	}
LABELV $943
line 1662
;1662:}
LABELV $942
endproc ClientKillLaserPointer 8 4
export HandleClientLaserPointer
proc HandleClientLaserPointer 4 4
line 1664
;1663:
;1664:void HandleClientLaserPointer(gentity_t* ent) {
line 1665
;1665:	if (!g_defrag.integer) {
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
NEI4 $948
line 1666
;1666:		return;
ADDRGP4 $947
JUMPV
LABELV $948
line 1668
;1667:	}
;1668:	if ((ent->client->pers.cmd.buttons & BUTTON_LASERPOINTER) && ent->client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $951
ADDRLP4 0
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 2
EQI4 $951
line 1669
;1669:		ClientLaserPointer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientLaserPointer
CALLV
pop
line 1670
;1670:	}
ADDRGP4 $952
JUMPV
LABELV $951
line 1671
;1671:	else {
line 1672
;1672:		ClientKillLaserPointer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientKillLaserPointer
CALLV
pop
line 1673
;1673:	}
LABELV $952
line 1674
;1674:}
LABELV $947
endproc HandleClientLaserPointer 4 4
data
align 4
LABELV $954
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
align 4
LABELV $955
byte 4 1097859072
byte 4 1097859072
byte 4 1109393408
export G_MaybeSaveIronmanPos
code
proc G_MaybeSaveIronmanPos 1120 28
line 1677
;1675:
;1676:// save positions of the iron man so we can respawn his chasers at a reasonable distance to him and not make them run half a minute to reach him again
;1677:void G_MaybeSaveIronmanPos(gentity_t* ent) {
line 1678
;1678:	gclient_t* client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1684
;1679:	vec3_t diffToOld;
;1680:	trace_t trace;
;1681:	static vec3_t	playerMins = { -15, -15, DEFAULT_MINS_2 };
;1682:	static vec3_t	playerMaxs = { 15, 15, DEFAULT_MAXS_2 };
;1683:
;1684:	VectorCopy(client->ps.origin,level.ironManCurrentPosition);
ADDRGP4 level+30580
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1685
;1685:	level.ironManCurrentPositionSet = qtrue;
ADDRGP4 level+30592
CNSTI4 1
ASGNI4
line 1687
;1686:
;1687:	if (!client->isIronMan || client->sess.mode != MODE_IRONMAN || client->ps.groundEntityNum != ENTITYNUM_WORLD) {
ADDRLP4 0
INDIRP4
CNSTI4 53188
ADDP4
INDIRI4
CNSTI4 0
EQI4 $961
ADDRLP4 0
INDIRP4
CNSTI4 43484
ADDP4
INDIRI4
CNSTI4 5
NEI4 $961
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1022
EQI4 $958
LABELV $961
line 1688
;1688:		return;
ADDRGP4 $953
JUMPV
LABELV $958
line 1691
;1689:	}
;1690:
;1691:	if (level.ironManPosCount > 0) {
ADDRGP4 level+32600
INDIRI4
CNSTI4 0
LEI4 $962
line 1692
;1692:		VectorSubtract(level.ironManPos[(level.ironManPosCount - 1) % IRONMAN_MAX_PAST_POSITIONS_COUNT].origin, client->ps.origin, diffToOld);
ADDRLP4 1100
CNSTI4 40
ASGNI4
ADDRLP4 1104
CNSTI4 1
ASGNI4
ADDRLP4 1108
CNSTI4 50
ASGNI4
ADDRLP4 1084
ADDRLP4 1100
INDIRI4
ADDRGP4 level+32600
INDIRI4
ADDRLP4 1104
INDIRI4
SUBI4
ADDRLP4 1108
INDIRI4
MODI4
MULI4
ADDRGP4 level+30600
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1084+4
ADDRLP4 1100
INDIRI4
ADDRGP4 level+32600
INDIRI4
ADDRLP4 1104
INDIRI4
SUBI4
ADDRLP4 1108
INDIRI4
MODI4
MULI4
ADDRGP4 level+30600+4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1084+8
CNSTI4 40
ADDRGP4 level+32600
INDIRI4
CNSTI4 1
SUBI4
CNSTI4 50
MODI4
MULI4
ADDRGP4 level+30600+8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1694
;1693:
;1694:		if (level.lastIronManPosSaved + IRONMAN_SAVEPOSITION_MINTIMEFORCE > level.time) {
ADDRGP4 level+32604
INDIRI4
CNSTI4 3000
ADDI4
ADDRGP4 level+36
INDIRI4
LEI4 $975
line 1696
;1695:			// not been long enough since last, so just check if maybe we traveled a long distance, otherwise skip.
;1696:			if (VectorLengthSquared(diffToOld) < IRONMAN_SAVEPOSITION_MINDISTANCE * IRONMAN_SAVEPOSITION_MINDISTANCE) {
ADDRLP4 1084
ARGP4
ADDRLP4 1116
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1116
INDIRF4
CNSTF4 1242125376
GEF4 $976
line 1697
;1697:				return;
ADDRGP4 $953
JUMPV
line 1699
;1698:			}
;1699:		}
LABELV $975
line 1700
;1700:		else if (level.lastIronManPosSaved + IRONMAN_SAVEPOSITION_MINTIMEFORCESURELY > level.time) {
ADDRGP4 level+32604
INDIRI4
CNSTI4 6000
ADDI4
ADDRGP4 level+36
INDIRI4
LEI4 $981
line 1703
;1701:			// even if enough time passed, let's make surer we travel at least a BIT.
;1702:			// there MIGHT be a way to abuse this with maybe some specially designed complicated labyrinth or sth idk. gonne be mostly ok tho.
;1703:			if (VectorLengthSquared(diffToOld) < IRONMAN_SAVEPOSITION_MINDISTANCE_SHORT * IRONMAN_SAVEPOSITION_MINDISTANCE_SHORT) {
ADDRLP4 1084
ARGP4
ADDRLP4 1116
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1116
INDIRF4
CNSTF4 1176256512
GEF4 $982
line 1704
;1704:				return;
ADDRGP4 $953
JUMPV
line 1706
;1705:			}
;1706:		}
LABELV $981
line 1707
;1707:		else {
line 1709
;1708:			// well now TRULY a lot of time passed. just go.
;1709:		}
LABELV $982
LABELV $976
line 1710
;1710:	}
LABELV $962
line 1712
;1711:	
;1712:	JP_Trace(&trace, client->ps.origin, playerMins, playerMaxs, client->ps.origin,ent-g_entities, MASK_PLAYERSOLID);
ADDRLP4 4
ARGP4
ADDRLP4 1100
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRGP4 $954
ARGP4
ADDRGP4 $955
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
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
CNSTI4 273
ARGI4
ADDRGP4 JP_Trace
CALLV
pop
line 1714
;1713:
;1714:	if (trace.allsolid || trace.startsolid) {
ADDRLP4 1104
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 1104
INDIRI4
NEI4 $990
ADDRLP4 4+4
INDIRI4
ADDRLP4 1104
INDIRI4
EQI4 $987
LABELV $990
line 1715
;1715:		return; // maybe hes crouching somewhere in a hole or sth. Can't save it because anyone spawning would get stuck.
ADDRGP4 $953
JUMPV
LABELV $987
line 1718
;1716:	}
;1717:
;1718:	VectorCopy(client->ps.origin,level.ironManPos[level.ironManPosCount % IRONMAN_MAX_PAST_POSITIONS_COUNT].origin);
CNSTI4 40
ADDRGP4 level+32600
INDIRI4
CNSTI4 50
MODI4
MULI4
ADDRGP4 level+30600
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1719
;1719:	VectorCopy(client->ps.velocity,level.ironManPos[level.ironManPosCount % IRONMAN_MAX_PAST_POSITIONS_COUNT].velocity);
CNSTI4 40
ADDRGP4 level+32600
INDIRI4
CNSTI4 50
MODI4
MULI4
ADDRGP4 level+30600+12
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 1720
;1720:	VectorCopy(client->ps.viewangles,level.ironManPos[level.ironManPosCount % IRONMAN_MAX_PAST_POSITIONS_COUNT].angles);
CNSTI4 40
ADDRGP4 level+32600
INDIRI4
CNSTI4 50
MODI4
MULI4
ADDRGP4 level+30600+24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1722
;1721:	/* record timestamp (previously had a stray comma expression causing warning) */
;1722:	level.ironManPos[level.ironManPosCount % IRONMAN_MAX_PAST_POSITIONS_COUNT].when = level.time;
CNSTI4 40
ADDRGP4 level+32600
INDIRI4
CNSTI4 50
MODI4
MULI4
ADDRGP4 level+30600+36
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1724
;1723:
;1724:	if (g_developer.integer) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
EQI4 $1003
line 1725
;1725:		Com_Printf("Saving ironman position: %f %f %f", client->ps.origin[0], client->ps.origin[1], client->ps.origin[2]);
ADDRGP4 $1006
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 Com_Printf
CALLV
pop
line 1726
;1726:	}
LABELV $1003
line 1728
;1727:
;1728:	level.ironManPosCount++;
ADDRLP4 1108
ADDRGP4 level+32600
ASGNP4
ADDRLP4 1108
INDIRP4
ADDRLP4 1108
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1729
;1729:	level.lastIronManPosSaved = level.time;
ADDRGP4 level+32604
ADDRGP4 level+36
INDIRI4
ASGNI4
line 1731
;1730:
;1731:}
LABELV $953
endproc G_MaybeSaveIronmanPos 1120 28
export ClientThink_real
proc ClientThink_real 1048 32
line 1752
;1732:
;1733:void DF_CheckRollSpeed(gentity_t* ent);
;1734:
;1735:/*
;1736:==============
;1737:ClientThink
;1738:
;1739:This will be called once for each client frame, which will
;1740:usually be a couple times for each server frame on fast clients.
;1741:
;1742:If "g_synchronousClients 1" is set, this will be called exactly
;1743:once for each server frame, which makes for smooth demo recording.
;1744:==============
;1745:*/
;1746:void DF_HandleSegmentedRunPre(gentity_t* ent);
;1747:posHashType_t DF_GetPositionHash(playerState_t* ps);
;1748:void UpdateClientRaceVars(gclient_t* client);
;1749://void DF_SetRaceMode(gentity_t* ent, qboolean value); 
;1750:void ResetClientModeIfInvalid(gentity_t* ent, qboolean allowDefrag);
;1751:void DF_RaceStateInvalidated(gentity_t* ent, qboolean print);
;1752:void ClientThink_real( gentity_t *ent ) {
line 1761
;1753:	gclient_t	*client;
;1754:	gentity_t	*otherClientEnt;
;1755:	pmove_t		pm;
;1756:	int			oldEventSequence;
;1757:	int			msec;
;1758:	int			i;
;1759:	usercmd_t	*ucmd;
;1760:	//int			oldTeleportBit;
;1761:	int			nowTime = LEVELTIME(ent->client); // when racing, make everything relative to commandtime
ADDRLP4 636
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 636
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1015
ADDRLP4 636
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1015
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1017
ADDRLP4 632
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1018
JUMPV
LABELV $1017
ADDRLP4 632
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1018
ADDRLP4 628
ADDRLP4 632
INDIRI4
ASGNI4
ADDRGP4 $1016
JUMPV
LABELV $1015
ADDRLP4 628
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1016
ADDRLP4 588
ADDRLP4 628
INDIRI4
ASGNI4
line 1764
;1762:	int	moveStyle;
;1763:	qboolean	clientFpsOk;
;1764:	qboolean	inactivityToSpec = qfalse;
ADDRLP4 604
CNSTI4 0
ASGNI4
line 1767
;1765:	vec3_t		prePmoveVelocity;
;1766:
;1767:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1769
;1768:
;1769:	if ( !ent || !ent->client ) return;
ADDRLP4 640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 644
CNSTU4 0
ASGNU4
ADDRLP4 640
INDIRP4
CVPU4 4
ADDRLP4 644
INDIRU4
EQU4 $1021
ADDRLP4 640
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 644
INDIRU4
NEU4 $1019
LABELV $1021
ADDRGP4 $1010
JUMPV
LABELV $1019
line 1771
;1770:
;1771:	G_BufferedSendOrPrintFlushIfNeeded(ent,qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_BufferedSendOrPrintFlushIfNeeded
CALLV
pop
line 1773
;1772:
;1773:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1025
JUMPV
LABELV $1022
line 1774
;1774:		otherClientEnt = g_entities + i;
ADDRLP4 584
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1779
;1775:		// this is for snapshot limiting (avoiding dupe snapshots when no commandtime update has happened for smoother demos)
;1776:		// if we are in follow mode, we wont set it for ourselves otherwise we might override the snapshot limiting. it will think something moved,
;1777:		// but it was just us as spectator sending usercmds that did nothing relevant. dont set it for others either then i guess?
;1778:		// also if we are a free floating spectator, don't count our movement for others
;1779:		if (!otherClientEnt->client || !otherClientEnt->inuse || (/*otherClientEnt == ent &&*/ ent->client->sess.spectatorState == SPECTATOR_FOLLOW) || (ent->client->sess.sessionTeam == TEAM_SPECTATOR && otherClientEnt != ent)) continue;
ADDRLP4 652
CNSTI4 408
ASGNI4
ADDRLP4 584
INDIRP4
ADDRLP4 652
INDIRI4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1031
ADDRLP4 584
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1031
ADDRLP4 656
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 660
ADDRLP4 656
INDIRP4
ADDRLP4 652
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 660
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1031
ADDRLP4 660
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1027
ADDRLP4 584
INDIRP4
CVPU4 4
ADDRLP4 656
INDIRP4
CVPU4 4
EQU4 $1027
LABELV $1031
ADDRGP4 $1023
JUMPV
LABELV $1027
line 1780
;1780:		otherClientEnt->client->anyClientMovedSinceSnapshot = qtrue;
ADDRLP4 584
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43932
ADDP4
CNSTI4 1
ASGNI4
line 1781
;1781:	}
LABELV $1023
line 1773
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1025
ADDRLP4 0
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $1022
line 1783
;1782:
;1783:	if (ent->client->sess.rollAngleInvalidated) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1032
line 1784
;1784:		if (!ent->client->pers.cmd.angles[ROLL]) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1396
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1034
line 1785
;1785:			ent->client->sess.rollAngleInvalidated = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43524
ADDP4
CNSTI4 0
ASGNI4
line 1786
;1786:			DF_RaceStateInvalidated(ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 DF_RaceStateInvalidated
CALLV
pop
line 1787
;1787:		}
LABELV $1034
line 1788
;1788:		ent->client->pers.cmd.angles[ROLL] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1396
ADDP4
CNSTI4 0
ASGNI4
line 1789
;1789:	}
LABELV $1032
line 1792
;1790:
;1791:
;1792:	moveStyle = client->sess.raceMode ? client->sess.raceStyle.movementStyle : MV_JK2;
ADDRLP4 4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1037
ADDRLP4 648
ADDRLP4 4
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
ADDRGP4 $1038
JUMPV
LABELV $1037
ADDRLP4 648
CNSTI4 0
ASGNI4
LABELV $1038
ADDRLP4 608
ADDRLP4 648
INDIRI4
ASGNI4
line 1795
;1793:
;1794:	// don't think if the client is not yet connected (and thus not yet spawned in)
;1795:	if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1039
line 1796
;1796:		return;
ADDRGP4 $1010
JUMPV
LABELV $1039
line 1799
;1797:	}
;1798:	// mark the time, so the connection sprite can be removed
;1799:	ucmd = &ent->client->pers.cmd;
ADDRLP4 592
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ASGNP4
line 1801
;1800:
;1801:	DF_HandleSegmentedRunPre(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DF_HandleSegmentedRunPre
CALLV
pop
line 1804
;1802:
;1803:	// moved this under DF_HandleSegmentedRunPre. makes more sense?
;1804:	if (ent->client->sess.raceMode) { // in racemode we want all things to be consistent and deterministic, so we do this on every CLIENT frame and change level.time references to cmd.servertime where possible
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1041
line 1806
;1805:		// uh should we do this after handlesegmentedrunpre?
;1806:		if ((!level.intermissiontime) && !(ent->client->ps.pm_flags & PMF_FOLLOW) && ent->client->sess.sessionTeam != TEAM_SPECTATOR)
ADDRLP4 652
CNSTI4 0
ASGNI4
ADDRGP4 level+9028
INDIRI4
ADDRLP4 652
INDIRI4
NEI4 $1043
ADDRLP4 656
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 656
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 652
INDIRI4
NEI4 $1043
ADDRLP4 656
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1043
line 1807
;1807:		{
line 1808
;1808:			WP_ForcePowersUpdate(ent, &ent->client->pers.cmd);
ADDRLP4 660
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 660
INDIRP4
ARGP4
ADDRLP4 660
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
ADDRGP4 WP_ForcePowersUpdate
CALLV
pop
line 1809
;1809:			WP_SaberPositionUpdate(ent, &ent->client->pers.cmd);
ADDRLP4 664
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 664
INDIRP4
ARGP4
ADDRLP4 664
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
ADDRGP4 WP_SaberPositionUpdate
CALLV
pop
line 1810
;1810:		}
LABELV $1043
line 1811
;1811:	}
LABELV $1041
line 1814
;1812:
;1813:	// sanity check the command time to prevent speedup cheating
;1814:	if ( ucmd->serverTime > level.time + 200 ) {
ADDRLP4 592
INDIRP4
INDIRI4
ADDRGP4 level+36
INDIRI4
CNSTI4 200
ADDI4
LEI4 $1046
line 1815
;1815:		ucmd->serverTime = level.time + 200;
ADDRLP4 592
INDIRP4
ADDRGP4 level+36
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1817
;1816://		G_Printf("serverTime <<<<<\n" );
;1817:	}
LABELV $1046
line 1818
;1818:	if ( ucmd->serverTime < level.time - (ent->client->sess.raceMode ? 1500:1000) ) { // bit higher limit for racemoders to avoid extreme lags killing runs
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1054
ADDRLP4 652
CNSTI4 1500
ASGNI4
ADDRGP4 $1055
JUMPV
LABELV $1054
ADDRLP4 652
CNSTI4 1000
ASGNI4
LABELV $1055
ADDRLP4 592
INDIRP4
INDIRI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 652
INDIRI4
SUBI4
GEI4 $1050
line 1819
;1819:		if (ent->client->sess.raceMode && (ent->client->sess.raceStyle.msec == 1000 || ent->client->sess.raceStyle.msec == -1) && (ucmd->serverTime - client->ps.commandTime) == 1000 && ucmd->serverTime >= level.time - 2000) {
ADDRLP4 656
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 656
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1056
ADDRLP4 660
ADDRLP4 656
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 1000
EQI4 $1059
ADDRLP4 660
INDIRI4
CNSTI4 -1
NEI4 $1056
LABELV $1059
ADDRLP4 664
ADDRLP4 592
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 664
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
SUBI4
CNSTI4 1000
NEI4 $1056
ADDRLP4 664
INDIRI4
ADDRGP4 level+36
INDIRI4
CNSTI4 2000
SUBI4
LTI4 $1056
line 1822
;1820:			// special exception for 1 fps defragging (for very funny people)
;1821:			// increase the limit even more for them
;1822:		}
ADDRGP4 $1057
JUMPV
LABELV $1056
line 1823
;1823:		else {
line 1824
;1824:			ucmd->serverTime = level.time - (ent->client->sess.raceMode ? 1500 : 1000);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1062
ADDRLP4 668
CNSTI4 1500
ASGNI4
ADDRGP4 $1063
JUMPV
LABELV $1062
ADDRLP4 668
CNSTI4 1000
ASGNI4
LABELV $1063
ADDRLP4 592
INDIRP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 668
INDIRI4
SUBI4
ASGNI4
line 1825
;1825:		}
LABELV $1057
line 1827
;1826://		G_Printf("serverTime >>>>>\n" );
;1827:	}
LABELV $1050
line 1829
;1828:
;1829:	msec = ucmd->serverTime - client->ps.commandTime;
ADDRLP4 596
ADDRLP4 592
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 1832
;1830:	// following others may result in bad times, but we still want
;1831:	// to check for follow toggles
;1832:	if ( msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 596
INDIRI4
CNSTI4 1
GEI4 $1064
ADDRLP4 4
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1064
line 1833
;1833:		return;
ADDRGP4 $1010
JUMPV
LABELV $1064
line 1835
;1834:	}
;1835:	if ( msec > 200) {
ADDRLP4 596
INDIRI4
CNSTI4 200
LEI4 $1066
line 1836
;1836:		if (ent->client->sess.raceMode && (ent->client->sess.raceStyle.msec > 200 || ent->client->sess.raceStyle.msec == -1) ) {
ADDRLP4 656
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 656
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1068
ADDRLP4 660
ADDRLP4 656
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 200
GTI4 $1070
ADDRLP4 660
INDIRI4
CNSTI4 -1
NEI4 $1068
LABELV $1070
line 1838
;1837:			// racemode is more lenient, we wanna allow 1 fps runs and nonsense like that
;1838:			if (msec > 1000) {
ADDRLP4 596
INDIRI4
CNSTI4 1000
LEI4 $1069
line 1839
;1839:				msec = 1000;
ADDRLP4 596
CNSTI4 1000
ASGNI4
line 1840
;1840:			}
line 1841
;1841:		}
ADDRGP4 $1069
JUMPV
LABELV $1068
line 1842
;1842:		else {
line 1843
;1843:			msec = 200;
ADDRLP4 596
CNSTI4 200
ASGNI4
line 1844
;1844:		}
LABELV $1069
line 1845
;1845:	}
LABELV $1066
line 1847
;1846:	
;1847:	if (g_defrag.integer && client->sess.raceMode && ent->activatedEntities) {
ADDRLP4 656
CNSTI4 0
ASGNI4
ADDRGP4 g_defrag+12
INDIRI4
ADDRLP4 656
INDIRI4
EQI4 $1073
ADDRLP4 4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 656
INDIRI4
EQI4 $1073
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1073
line 1848
;1848:		gentity_t* actEnt = ent->activatedEntities;
ADDRLP4 660
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1077
JUMPV
LABELV $1076
line 1849
;1849:		while (actEnt) {
line 1850
;1850:			if (actEnt->s.eType == ET_MOVER && actEnt->inuse && !ent->freeAfterEvent && (ent->r.linked || !ent->neverFree) ) {
ADDRLP4 660
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $1079
ADDRLP4 668
CNSTI4 0
ASGNI4
ADDRLP4 660
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 668
INDIRI4
EQI4 $1079
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 668
INDIRI4
NEI4 $1079
ADDRLP4 672
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRLP4 668
INDIRI4
NEI4 $1081
ADDRLP4 672
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
ADDRLP4 668
INDIRI4
NEI4 $1079
LABELV $1081
line 1852
;1851:				// run movers on client time
;1852:				G_RunMover(actEnt);
ADDRLP4 660
INDIRP4
ARGP4
ADDRGP4 G_RunMover
CALLV
pop
line 1853
;1853:			}
LABELV $1079
line 1854
;1854:			actEnt = actEnt->nextActivatedEntity;
ADDRLP4 660
ADDRLP4 660
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ASGNP4
line 1855
;1855:		}
LABELV $1077
line 1849
ADDRLP4 660
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1076
line 1857
;1856:
;1857:	}
LABELV $1073
line 1859
;1858:
;1859:	if ( g_pmove_msec.integer < 1 ) {
ADDRGP4 g_pmove_msec+12
INDIRI4
CNSTI4 1
GEI4 $1082
line 1860
;1860:		trap_Cvar_Set("pmove_msec", "1");
ADDRGP4 $1085
ARGP4
ADDRGP4 $1086
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1861
;1861:	}
ADDRGP4 $1083
JUMPV
LABELV $1082
line 1862
;1862:	else if (g_pmove_msec.integer > 33) {
ADDRGP4 g_pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $1087
line 1863
;1863:		trap_Cvar_Set("pmove_msec", "33");
ADDRGP4 $1085
ARGP4
ADDRGP4 $1090
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1864
;1864:	}
LABELV $1087
LABELV $1083
line 1866
;1865:
;1866:	if ( g_pmove_fixed.integer || client->pers.pmoveFixed ) {
ADDRLP4 660
CNSTI4 0
ASGNI4
ADDRGP4 g_pmove_fixed+12
INDIRI4
ADDRLP4 660
INDIRI4
NEI4 $1094
ADDRLP4 4
INDIRP4
CNSTI4 1424
ADDP4
INDIRI4
ADDRLP4 660
INDIRI4
EQI4 $1091
LABELV $1094
line 1867
;1867:		ucmd->serverTime = ((ucmd->serverTime + g_pmove_msec.integer-1) / g_pmove_msec.integer) * g_pmove_msec.integer;
ADDRLP4 592
INDIRP4
ADDRLP4 592
INDIRP4
INDIRI4
ADDRGP4 g_pmove_msec+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 g_pmove_msec+12
INDIRI4
DIVI4
ADDRGP4 g_pmove_msec+12
INDIRI4
MULI4
ASGNI4
line 1870
;1868:		//if (ucmd->serverTime - client->ps.commandTime <= 0)
;1869:		//	return;
;1870:	}
LABELV $1091
line 1878
;1871:
;1872:	//if (client->sess.sessionTeam == TEAM_FREE && !g_defrag.integer) {
;1873:	//	if (client->sess.raceMode || g_gametype.integer >= GT_TEAM) {
;1874:	//		SetTeam(ent, "spectator");// , qtrue);
;1875:	//		DF_SetRaceMode(ent,qfalse);
;1876:	//	}
;1877:	//}
;1878:	if (client->sess.sessionTeam == TEAM_FREE) {
ADDRLP4 4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1098
line 1879
;1879:		ResetClientModeIfInvalid(ent, (qboolean)!(ent->r.svFlags& SVF_BOT));
ADDRLP4 668
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 668
INDIRP4
ARGP4
ADDRLP4 668
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $1101
ADDRLP4 664
CNSTI4 1
ASGNI4
ADDRGP4 $1102
JUMPV
LABELV $1101
ADDRLP4 664
CNSTI4 0
ASGNI4
LABELV $1102
ADDRLP4 664
INDIRI4
ARGI4
ADDRGP4 ResetClientModeIfInvalid
CALLV
pop
line 1880
;1880:	}
LABELV $1098
line 1899
;1881:
;1882:	//if (client->ps.stats[STAT_RACEMODE]) {//Is this really needed..
;1883:	//	if (client->ps.stats[STAT_MOVEMENTSTYLE] == MV_OCPM) {
;1884:	//		ucmd->serverTime = ((ucmd->serverTime + 7) / 8) * 8;
;1885:	//	}
;1886:	//	else {
;1887:	//		if (msec < 3)
;1888:	//			ucmd->serverTime = ((ucmd->serverTime + 2) / 3) * 3;//Integer math was making this bad, but is this even really needed? I guess for 125fps bhop height it is?
;1889:	//		else if (msec > 16 && client->pers.practice)
;1890:	//			ucmd->serverTime = ((ucmd->serverTime + 15) / 16) * 16;
;1891:	//	}
;1892:	//}
;1893:	//else if (pmove_fixed.integer || client->pers.pmoveFixed)
;1894:	//	ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer - 1) / pmove_msec.integer) * pmove_msec.integer;
;1895:
;1896:	//if ((client->sess.sessionTeam != TEAM_SPECTATOR) && !client->ps.stats[STAT_RACEMODE] && ((g_movementStyle.integer >= MV_SIEGE && g_movementStyle.integer <= MV_WSW) || g_movementStyle.integer == MV_SP || g_movementStyle.integer == MV_SLICK || g_movementStyle.integer == MV_TRIBES)) { //Ok,, this should be like every frame, right??
;1897:	//	client->sess.movementStyle = g_movementStyle.integer;
;1898:	//}
;1899:	UpdateClientRaceVars(client);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 UpdateClientRaceVars
CALLV
pop
line 1915
;1900:	//client->ps.stats[STAT_MOVEMENTSTYLE] = client->sess.raceStyle.movementStyle;
;1901:	//client->ps.stats[STAT_RUNFLAGS] = client->sess.raceStyle.runFlags;
;1902:	//client->ps.stats[STAT_RACEMODE] = client->sess.raceMode; // can get lost sometimes after death? idk happened once but i had another bug then
;1903:
;1904:	//if ((g_neutralFlag.integer < 4) && client->ps.powerups[PW_NEUTRALFLAG]) {
;1905:	//	if (client->ps.fd.forcePowerLevel[FP_LEVITATION] > 1) {
;1906:	//		client->savedJumpLevel = client->ps.fd.forcePowerLevel[FP_LEVITATION];
;1907:	//		client->ps.fd.forcePowerLevel[FP_LEVITATION] = 1;
;1908:	//	}
;1909:	//}
;1910:	//else if (client->savedJumpLevel) {
;1911:	//	client->ps.fd.forcePowerLevel[FP_LEVITATION] = client->savedJumpLevel;
;1912:	//}
;1913:	//if (client->ps.stats[STAT_RACEMODE]) {
;1914:
;1915:	HandleClientLaserPointer(ent); // logically should be after intermission but eh, can use some memes
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 HandleClientLaserPointer
CALLV
pop
line 1917
;1916:
;1917:	inactivityToSpec = !ClientInactivitySpecTimer(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 668
ADDRGP4 ClientInactivitySpecTimer
CALLI4
ASGNI4
ADDRLP4 668
INDIRI4
CNSTI4 0
NEI4 $1104
ADDRLP4 664
CNSTI4 1
ASGNI4
ADDRGP4 $1105
JUMPV
LABELV $1104
ADDRLP4 664
CNSTI4 0
ASGNI4
LABELV $1105
ADDRLP4 604
ADDRLP4 664
INDIRI4
ASGNI4
line 1922
;1918:
;1919:	//
;1920:	// check for exiting intermission
;1921:	//
;1922:	if ( level.intermissiontime ) {
ADDRGP4 level+9028
INDIRI4
CNSTI4 0
EQI4 $1106
line 1923
;1923:		ClientIntermissionThink( client );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientIntermissionThink
CALLV
pop
line 1924
;1924:		return;
ADDRGP4 $1010
JUMPV
LABELV $1106
line 1928
;1925:	}
;1926:
;1927:	// spectators don't do much
;1928:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1109
line 1929
;1929:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 4
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1111
line 1930
;1930:			return;
ADDRGP4 $1010
JUMPV
LABELV $1111
line 1932
;1931:		}
;1932:		SpectatorThink( ent, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 SpectatorThink
CALLV
pop
line 1933
;1933:		return;
ADDRGP4 $1010
JUMPV
LABELV $1109
line 1936
;1934:	}
;1935:
;1936:	if (ent && ent->client && (ent->client->ps.eFlags & EF_INVULNERABLE))
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 676
CNSTU4 0
ASGNU4
ADDRLP4 672
INDIRP4
CVPU4 4
ADDRLP4 676
INDIRU4
EQU4 $1113
ADDRLP4 680
ADDRLP4 672
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 680
INDIRP4
CVPU4 4
ADDRLP4 676
INDIRU4
EQU4 $1113
ADDRLP4 680
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $1113
line 1937
;1937:	{
line 1938
;1938:		if (ent->client->invulnerableTimer <= nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43588
ADDP4
INDIRI4
ADDRLP4 588
INDIRI4
GTI4 $1115
line 1939
;1939:		{
line 1940
;1940:			ent->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 684
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 684
INDIRP4
ADDRLP4 684
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 1941
;1941:		}
LABELV $1115
line 1942
;1942:	}
LABELV $1113
line 1944
;1943:
;1944:	if (ent && ent->client && ent->client->sess.raceMode) {
ADDRLP4 684
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 688
CNSTU4 0
ASGNU4
ADDRLP4 684
INDIRP4
CVPU4 4
ADDRLP4 688
INDIRU4
EQU4 $1117
ADDRLP4 692
ADDRLP4 684
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 692
INDIRP4
CVPU4 4
ADDRLP4 688
INDIRU4
EQU4 $1117
ADDRLP4 692
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1117
line 1945
;1945:		const int movementStyle = ent->client->sess.raceStyle.movementStyle;
ADDRLP4 696
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 1976
;1946:		//if (movementStyle == MV_RJCPM || movementStyle == MV_RJQ3) {
;1947:		//	ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_MELEE) + (1 << WP_SABER) + (1 << WP_ROCKET_LAUNCHER);
;1948:		//	ent->client->ps.ammo[AMMO_ROCKETS] = 2;
;1949:		//	if (ent->health > 0)
;1950:		//		ent->client->ps.stats[STAT_ARMOR] = ent->client->ps.stats[STAT_HEALTH] = ent->health = 100;
;1951:		//}
;1952:		//else if (movementStyle == MV_JETPACK) {
;1953:		//	ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_MELEE) + (1 << WP_SABER) + (1 << WP_DET_PACK);
;1954:		//	if (!ent->client->pers.stats.startTime)
;1955:		//		ent->client->ps.ammo[AMMO_DETPACK] = 4; //Dont drop their ammo before the course starts? qol
;1956:		//	if (ent->health > 0)
;1957:		//		ent->client->ps.stats[STAT_ARMOR] = ent->client->ps.stats[STAT_HEALTH] = ent->health = 100;
;1958:		//}
;1959:		//else if (movementStyle == MV_TRIBES) {
;1960:		//	ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_MELEE) + (1 << WP_CONCUSSION);
;1961:		//	if (!ent->client->pers.stats.startTime)
;1962:		//		ent->client->ps.ammo[AMMO_METAL_BOLTS] = 120; //Dont drop their ammo before the course starts? qol
;1963:		//	if (ent->health > 0)
;1964:		//		ent->client->ps.stats[STAT_ARMOR] = ent->client->ps.stats[STAT_HEALTH] = ent->health = 100;
;1965:		//}
;1966:		//else if (movementStyle == MV_COOP_JKA) {
;1967:		//	//ent->client->ps.fd.forcePowerLevel[FP_LEVITATION] = 1;
;1968:		//	ent->client->ps.fd.forcePowerLevel[FP_LIGHTNING] = ent->client->ps.fd.forcePowerLevel[FP_DRAIN] = 2;
;1969:		//	ent->client->ps.fd.forcePowerLevel[FP_SPEED] = ent->client->ps.fd.forcePowerLevel[FP_GRIP] = ent->client->ps.fd.forcePowerLevel[FP_PUSH] = ent->client->ps.fd.forcePowerLevel[FP_PULL] = 3;
;1970:		//	ent->client->ps.fd.forcePowersKnown = (1 << FP_PULL) + (1 << FP_PUSH) + (1 << FP_SPEED) + (1 << FP_GRIP) + (1 << FP_DRAIN) + (1 << FP_LIGHTNING);
;1971:		//	ent->client->ps.stats[STAT_WEAPONS] = (1 << 16) - 1 - (1 << WP_DET_PACK) - (1 << WP_TRIP_MINE) - (1 << WP_THERMAL); //all weapons? w/o tripmine detpack.
;1972:		//	if (ent->health > 0)
;1973:		//		ent->client->ps.stats[STAT_ARMOR] = ent->client->ps.stats[STAT_HEALTH] = ent->health = 999;
;1974:		//}
;1975:		//else 
;1976:		{
line 1977
;1977:			client->ps.ammo[AMMO_POWERCELL] = 300;
ADDRLP4 4
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 300
ASGNI4
line 1979
;1978:
;1979:			if (movementStyle == MV_JK2){// || movementStyle == MV_SIEGE || movementStyle == MV_QW || movementStyle == MV_PJK || movementStyle == MV_SP || movementStyle == MV_SPEED || movementStyle == MV_JETPACK) {
ADDRLP4 696
INDIRI4
CNSTI4 0
NEI4 $1119
line 1980
;1980:				ent->client->ps.stats[STAT_WEAPONS] = /*(1 << WP_MELEE) +*/ (1 << WP_SABER) + (1 << WP_DISRUPTOR) + (1 << WP_STUN_BATON);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 38
ASGNI4
line 1981
;1981:			}
ADDRGP4 $1120
JUMPV
LABELV $1119
line 1982
;1982:			else {
line 1983
;1983:				ent->client->ps.stats[STAT_WEAPONS] = /*(1 << WP_MELEE) +*/ (1 << WP_SABER) + (1 << WP_DISRUPTOR) + (1 << WP_STUN_BATON);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 38
ASGNI4
line 1984
;1984:			}
LABELV $1120
line 1985
;1985:		}
line 1991
;1986:
;1987:		//if (movementStyle == MV_JETPACK || movementStyle == MV_TRIBES) //always give jetpack style a jetpack, and non jetpack styles no jetpack, maybe this should just be in clientspawn ?
;1988:		//	ent->client->ps.stats[STAT_HOLDABLE_ITEMS] |= (1 << HI_JETPACK);
;1989:		//else
;1990:		//	ent->client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_JETPACK);
;1991:	}
LABELV $1117
line 1994
;1992:
;1993:	// check for inactivity timer, but never drop the local client of a non-dedicated server
;1994:	if ( !ClientInactivityTimer( client ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 696
ADDRGP4 ClientInactivityTimer
CALLI4
ASGNI4
ADDRLP4 696
INDIRI4
CNSTI4 0
NEI4 $1121
line 1995
;1995:		return;
ADDRGP4 $1010
JUMPV
LABELV $1121
line 1997
;1996:	}
;1997:	if (inactivityToSpec) {
ADDRLP4 604
INDIRI4
CNSTI4 0
EQI4 $1123
line 1998
;1998:		return;
ADDRGP4 $1010
JUMPV
LABELV $1123
line 2001
;1999:	}
;2000:
;2001:	if (client->sess.login.forceLoggedIn && (level.time - client->randomLastCenterprint > 1000 || level.time < client->randomLastCenterprint)) {
ADDRLP4 4
INDIRP4
CNSTI4 43564
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1125
ADDRLP4 704
ADDRLP4 4
INDIRP4
CNSTI4 52132
ADDP4
INDIRI4
ASGNI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 704
INDIRI4
SUBI4
CNSTI4 1000
GTI4 $1129
ADDRGP4 level+36
INDIRI4
ADDRLP4 704
INDIRI4
GEI4 $1125
LABELV $1129
line 2002
;2002:		client->randomLastCenterprint = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 52132
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2003
;2003:		G_CenterPrint(client - level.clients, 3, "^3You were force-logged in by an admin. Please change your password with /changepassword, log out and log in again.", qfalse, qtrue, qfalse, NULL);
ADDRLP4 4
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
CNSTI4 3
ARGI4
ADDRGP4 $1131
ARGP4
ADDRLP4 708
CNSTI4 0
ASGNI4
ADDRLP4 708
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 708
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_CenterPrint
CALLV
pop
line 2004
;2004:	}
LABELV $1125
line 2006
;2005:
;2006:	if (client->sess.sessionTeam != TEAM_SPECTATOR) {
ADDRLP4 4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1132
line 2007
;2007:		BG_UserCmdToUserStats(&client->pers.cmd, &level.playerStats[ent - g_entities]->s);
ADDRLP4 4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
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
ADDRGP4 level+9152
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_UserCmdToUserStats
CALLV
pop
line 2008
;2008:	}
ADDRGP4 $1133
JUMPV
LABELV $1132
line 2009
;2009:	else { // dont waste demo space on commands of spectators, what for...
line 2010
;2010:		BG_UserCmdToUserStats(&nullUserCmd, &level.playerStats[ent - g_entities]->s);
ADDRGP4 nullUserCmd
ARGP4
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
ADDRGP4 level+9152
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_UserCmdToUserStats
CALLV
pop
line 2011
;2011:	}
LABELV $1133
line 2013
;2012:
;2013:	BG_RaceStyleToUserStats(&client->sess.raceStyle,&level.playerStats[ent-g_entities]->s);
ADDRLP4 4
INDIRP4
CNSTI4 43492
ADDP4
ARGP4
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
ADDRGP4 level+9152
ADDP4
INDIRP4
ARGP4
ADDRGP4 BG_RaceStyleToUserStats
CALLV
pop
line 2014
;2014:	level.playerStats[ent - g_entities]->s.activeForcePass = classifyLeaderBoard(&client->sess.raceStyle,&level.mapDefaultRaceStyle );
ADDRLP4 4
INDIRP4
CNSTI4 43492
ADDP4
ARGP4
ADDRGP4 level+9116
ARGP4
ADDRLP4 708
ADDRGP4 classifyLeaderBoard
CALLI4
ASGNI4
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
ADDRGP4 level+9152
ADDP4
INDIRP4
CNSTI4 176
ADDP4
ADDRLP4 708
INDIRI4
ASGNI4
line 2016
;2015:
;2016:	clientFpsOk = ClientCheckNotifyPhysicsFps(ent); // Let the client know about his need to set a different com_physicsFps value if needed
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 712
ADDRGP4 ClientCheckNotifyPhysicsFps
CALLI4
ASGNI4
ADDRLP4 612
ADDRLP4 712
INDIRI4
ASGNI4
line 2019
;2017:
;2018:	// race mode toggle restrictions
;2019:	if (client->sess.raceMode && (client->sess.raceStyle.msec == 0 || client->sess.raceStyle.msec > 0 && client->sess.raceStyle.msec != msec)) {
ADDRLP4 720
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 720
INDIRI4
EQI4 $1139
ADDRLP4 724
ADDRLP4 4
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
ASGNI4
ADDRLP4 724
INDIRI4
ADDRLP4 720
INDIRI4
EQI4 $1141
ADDRLP4 724
INDIRI4
ADDRLP4 720
INDIRI4
LEI4 $1139
ADDRLP4 724
INDIRI4
ADDRLP4 596
INDIRI4
EQI4 $1139
LABELV $1141
line 2021
;2020:		// something weird/disallowed is going on with the client fps. best case scenario, it's dropped packets. 
;2021:		if (client->pers.raceStartCommandTime) {
ADDRLP4 4
INDIRP4
CNSTI4 22064
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1142
line 2022
;2022:			client->pers.raceDropped.msecTime += client->pers.cmd.serverTime - client->ps.commandTime;
ADDRLP4 732
ADDRLP4 4
INDIRP4
CNSTI4 43020
ADDP4
ASGNP4
ADDRLP4 732
INDIRP4
ADDRLP4 732
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 2023
;2023:			client->pers.raceDropped.packetCount++;
ADDRLP4 736
ADDRLP4 4
INDIRP4
CNSTI4 43024
ADDP4
ASGNP4
ADDRLP4 736
INDIRP4
ADDRLP4 736
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2024
;2024:		}
LABELV $1142
line 2025
;2025:		client->ps.commandTime = client->pers.cmd.serverTime;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
line 2027
;2026:		//client->lastMsecValue = msec;
;2027:		UpdateClientPastFpsStats(ent, msec);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 596
INDIRI4
ARGI4
ADDRGP4 UpdateClientPastFpsStats
CALLV
pop
line 2028
;2028:		return;
ADDRGP4 $1010
JUMPV
LABELV $1139
line 2031
;2029:	}
;2030:
;2031:	if (clientFpsOk // if we are already notifying about physicsfps settings issues, ignore these errors.
ADDRLP4 612
INDIRI4
CNSTI4 0
EQI4 $1144
ADDRLP4 4
INDIRP4
CNSTI4 43020
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 43032
ADDP4
INDIRI4
NEI4 $1148
ADDRLP4 4
INDIRP4
CNSTI4 43024
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 43036
ADDP4
INDIRI4
EQI4 $1144
LABELV $1148
ADDRLP4 732
ADDRLP4 4
INDIRP4
CNSTI4 43028
ADDP4
INDIRI4
ASGNI4
ADDRLP4 732
INDIRI4
CNSTI4 1000
ADDI4
ADDRGP4 level+36
INDIRI4
LTI4 $1149
ADDRLP4 732
INDIRI4
ADDRGP4 level+36
INDIRI4
LEI4 $1144
LABELV $1149
line 2034
;2032:		&& (client->pers.raceDropped.msecTime != client->pers.raceDropped.lastNotificationMsecTime || client->pers.raceDropped.packetCount != client->pers.raceDropped.lastNotificationPacketCount)
;2033:		&& ((client->pers.raceDropped.lastNotification + 1000) < level.time || client->pers.raceDropped.lastNotification > level.time)
;2034:		) {
line 2035
;2035:		G_SendServerCommand(ent - g_entities, va("print \"^1%d ^7msec from ^1%d ^7packets soft-dropped due to wrong packet timing. Packet loss? Try a higher cl_packetdup value.\n\"", (client->pers.raceDropped.msecTime - client->pers.raceDropped.lastNotificationMsecTime), (client->pers.raceDropped.packetCount - client->pers.raceDropped.lastNotificationPacketCount)),qtrue);
ADDRGP4 $1150
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 43020
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 43032
ADDP4
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 43024
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 43036
ADDP4
INDIRI4
SUBI4
ARGI4
ADDRLP4 740
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 740
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 2036
;2036:		client->pers.raceDropped.lastNotification = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 43028
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2037
;2037:		client->pers.raceDropped.lastNotificationMsecTime = client->pers.raceDropped.msecTime;
ADDRLP4 4
INDIRP4
CNSTI4 43032
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 43020
ADDP4
INDIRI4
ASGNI4
line 2038
;2038:		client->pers.raceDropped.lastNotificationPacketCount = client->pers.raceDropped.packetCount;
ADDRLP4 4
INDIRP4
CNSTI4 43036
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 43024
ADDP4
INDIRI4
ASGNI4
line 2039
;2039:	}
LABELV $1144
line 2042
;2040:
;2041:	// clear the rewards if time
;2042:	if (nowTime > client->rewardTime ) {
ADDRLP4 588
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 43708
ADDP4
INDIRI4
LEI4 $1152
line 2043
;2043:		client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 736
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 736
INDIRP4
ADDRLP4 736
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 2044
;2044:	}
LABELV $1152
line 2046
;2045:
;2046:	if ( client->noclip ) {
ADDRLP4 4
INDIRP4
CNSTI4 43600
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1154
line 2047
;2047:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 2048
;2048:	} else if ( client->ps.eFlags & EF_DISINTEGRATION ) {
ADDRGP4 $1155
JUMPV
LABELV $1154
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $1156
line 2049
;2049:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 2050
;2050:	} else if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 $1157
JUMPV
LABELV $1156
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1158
line 2051
;2051:		client->ps.pm_type = PM_DEAD;
ADDRLP4 736
CNSTI4 4
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 736
INDIRI4
ADDP4
ADDRLP4 736
INDIRI4
ASGNI4
line 2052
;2052:	} else {
ADDRGP4 $1159
JUMPV
LABELV $1158
line 2053
;2053:		if (client->ps.forceGripChangeMovetype)
ADDRLP4 4
INDIRP4
CNSTI4 1288
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1160
line 2054
;2054:		{
line 2055
;2055:			client->ps.pm_type = client->ps.forceGripChangeMovetype;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1288
ADDP4
INDIRI4
ASGNI4
line 2056
;2056:		}
ADDRGP4 $1161
JUMPV
LABELV $1160
line 2058
;2057:		else
;2058:		{
line 2059
;2059:			client->ps.pm_type = PM_NORMAL;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2060
;2060:		}
LABELV $1161
line 2061
;2061:	}
LABELV $1159
LABELV $1157
LABELV $1155
line 2063
;2062:
;2063:	client->ps.gravity = g_gravity.value;
ADDRLP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDRGP4 g_gravity+8
INDIRF4
CVFI4 4
ASGNI4
line 2067
;2064:
;2065:	// set speed
;2066:	//client->ps.speed = g_speed.value;
;2067:	client->ps.basespeed = g_speed.value; 
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CVFI4 4
ASGNI4
line 2069
;2068:	
;2069:	if (client->sess.raceMode /* || client->ps.stats[STAT_RACEMODE]*/) {
ADDRLP4 4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1164
line 2071
;2070:		//client->ps.speed = 250.0f;
;2071:		client->ps.basespeed = 250.0f;
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 250
ASGNI4
line 2072
;2072:		client->ps.gravity = 800.0f;
ADDRLP4 4
INDIRP4
CNSTI4 56
ADDP4
CNSTI4 800
ASGNI4
line 2076
;2073:		//if (client->sess.raceStyle.movementStyle == MV_PINBALL) {
;2074:		//	client->ps.gravity = 200.0f;
;2075:		//}
;2076:	}
LABELV $1164
line 2078
;2077:
;2078:	if (MovementIsQuake3Based(moveStyle)) {
ADDRLP4 608
INDIRI4
ARGI4
ADDRLP4 736
ADDRGP4 MovementIsQuake3Based
CALLI4
ASGNI4
ADDRLP4 736
INDIRI4
CNSTI4 0
EQI4 $1166
line 2080
;2079:		//client->ps.speed = 320.0f;
;2080:		client->ps.basespeed = 320.0f;
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 320
ASGNI4
line 2081
;2081:	}
LABELV $1166
line 2083
;2082:
;2083:	if (ent->client->ps.duelInProgress)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1168
line 2084
;2084:	{
line 2085
;2085:		gentity_t *duelAgainst = &g_entities[ent->client->ps.duelIndex];
ADDRLP4 740
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2090
;2086:
;2087:		//Keep the time updated, so once this duel ends this player can't engage in a duel for another
;2088:		//10 seconds. This will give other people a chance to engage in duels in case this player wants
;2089:		//to engage again right after he's done fighting and someone else is waiting.
;2090:		if (!ent->client->sess.raceMode) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1170
line 2092
;2091:
;2092:			ent->client->ps.fd.privateDuelTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1240
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 2094
;2093:
;2094:			if (ent->client->ps.duelTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1173
line 2095
;2095:			{
line 2097
;2096:				//Bring out the sabers
;2097:				if (ent->client->ps.weapon == WP_SABER && ent->client->ps.saberHolstered &&
ADDRLP4 744
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 744
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1176
ADDRLP4 748
CNSTI4 0
ASGNI4
ADDRLP4 744
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ADDRLP4 748
INDIRI4
EQI4 $1176
ADDRLP4 744
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 748
INDIRI4
EQI4 $1176
line 2099
;2098:					ent->client->ps.duelTime)
;2099:				{
line 2100
;2100:					if (!saberOffSound || !saberOnSound)
ADDRLP4 752
CNSTI4 0
ASGNI4
ADDRGP4 saberOffSound
INDIRI4
ADDRLP4 752
INDIRI4
EQI4 $1180
ADDRGP4 saberOnSound
INDIRI4
ADDRLP4 752
INDIRI4
NEI4 $1178
LABELV $1180
line 2101
;2101:					{
line 2102
;2102:						saberOffSound = G_SoundIndex("sound/weapons/saber/saberoffquick.wav");
ADDRGP4 $1181
ARGP4
ADDRLP4 756
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOffSound
ADDRLP4 756
INDIRI4
ASGNI4
line 2103
;2103:						saberOnSound = G_SoundIndex("sound/weapons/saber/saberon.wav");
ADDRGP4 $1182
ARGP4
ADDRLP4 760
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOnSound
ADDRLP4 760
INDIRI4
ASGNI4
line 2104
;2104:					}
LABELV $1178
line 2106
;2105:
;2106:					ent->client->ps.saberHolstered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 0
ASGNI4
line 2107
;2107:					G_Sound(ent, CHAN_AUTO, saberOnSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberOnSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2109
;2108:
;2109:					G_AddEvent(ent, EV_PRIVATE_DUEL, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2111
;2110:
;2111:					ent->client->ps.duelTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
CNSTI4 0
ASGNI4
line 2112
;2112:				}
LABELV $1176
line 2114
;2113:
;2114:				if (duelAgainst && duelAgainst->client && duelAgainst->inuse &&
ADDRLP4 756
CNSTU4 0
ASGNU4
ADDRLP4 740
INDIRP4
CVPU4 4
ADDRLP4 756
INDIRU4
EQU4 $1174
ADDRLP4 760
ADDRLP4 740
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 760
INDIRP4
CVPU4 4
ADDRLP4 756
INDIRU4
EQU4 $1174
ADDRLP4 764
CNSTI4 0
ASGNI4
ADDRLP4 740
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 764
INDIRI4
EQI4 $1174
ADDRLP4 760
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1174
ADDRLP4 760
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
ADDRLP4 764
INDIRI4
EQI4 $1174
ADDRLP4 760
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 764
INDIRI4
EQI4 $1174
line 2117
;2115:					duelAgainst->client->ps.weapon == WP_SABER && duelAgainst->client->ps.saberHolstered &&
;2116:					duelAgainst->client->ps.duelTime)
;2117:				{
line 2118
;2118:					if (!saberOffSound || !saberOnSound)
ADDRLP4 768
CNSTI4 0
ASGNI4
ADDRGP4 saberOffSound
INDIRI4
ADDRLP4 768
INDIRI4
EQI4 $1187
ADDRGP4 saberOnSound
INDIRI4
ADDRLP4 768
INDIRI4
NEI4 $1185
LABELV $1187
line 2119
;2119:					{
line 2120
;2120:						saberOffSound = G_SoundIndex("sound/weapons/saber/saberoffquick.wav");
ADDRGP4 $1181
ARGP4
ADDRLP4 772
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOffSound
ADDRLP4 772
INDIRI4
ASGNI4
line 2121
;2121:						saberOnSound = G_SoundIndex("sound/weapons/saber/saberon.wav");
ADDRGP4 $1182
ARGP4
ADDRLP4 776
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOnSound
ADDRLP4 776
INDIRI4
ASGNI4
line 2122
;2122:					}
LABELV $1185
line 2124
;2123:
;2124:					duelAgainst->client->ps.saberHolstered = qfalse;
ADDRLP4 740
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 0
ASGNI4
line 2125
;2125:					G_Sound(duelAgainst, CHAN_AUTO, saberOnSound);
ADDRLP4 740
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberOnSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2127
;2126:
;2127:					G_AddEvent(duelAgainst, EV_PRIVATE_DUEL, 2);
ADDRLP4 740
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2129
;2128:
;2129:					duelAgainst->client->ps.duelTime = 0;
ADDRLP4 740
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
CNSTI4 0
ASGNI4
line 2130
;2130:				}
line 2131
;2131:			}
ADDRGP4 $1174
JUMPV
LABELV $1173
line 2133
;2132:			else
;2133:			{
line 2134
;2134:				client->ps.speed = 0;
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 0
ASGNI4
line 2135
;2135:				client->ps.basespeed = 0;
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 0
ASGNI4
line 2136
;2136:				ucmd->forwardmove = 0;
ADDRLP4 592
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 0
ASGNI1
line 2137
;2137:				ucmd->rightmove = 0;
ADDRLP4 592
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 2138
;2138:				ucmd->upmove = 0;
ADDRLP4 592
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 2139
;2139:			}
LABELV $1174
line 2140
;2140:		}
LABELV $1170
line 2142
;2141:
;2142:		if (!duelAgainst || !duelAgainst->client || !duelAgainst->inuse ||
ADDRLP4 748
CNSTU4 0
ASGNU4
ADDRLP4 740
INDIRP4
CVPU4 4
ADDRLP4 748
INDIRU4
EQU4 $1192
ADDRLP4 752
ADDRLP4 740
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 752
INDIRP4
CVPU4 4
ADDRLP4 748
INDIRU4
EQU4 $1192
ADDRLP4 740
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1192
ADDRLP4 752
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $1188
LABELV $1192
line 2144
;2143:			duelAgainst->client->ps.duelIndex != ent->s.number)
;2144:		{
line 2145
;2145:			ent->client->ps.duelInProgress = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 0
ASGNI4
line 2146
;2146:			G_AddEvent(ent, EV_PRIVATE_DUEL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2147
;2147:		}
ADDRGP4 $1189
JUMPV
LABELV $1188
line 2148
;2148:		else if (duelAgainst->health < 1 || duelAgainst->client->ps.stats[STAT_HEALTH] < 1)
ADDRLP4 760
CNSTI4 1
ASGNI4
ADDRLP4 740
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 760
INDIRI4
LTI4 $1195
ADDRLP4 740
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 760
INDIRI4
GEI4 $1193
LABELV $1195
line 2149
;2149:		{
line 2150
;2150:			ent->client->ps.duelInProgress = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 0
ASGNI4
line 2151
;2151:			duelAgainst->client->ps.duelInProgress = 0;
ADDRLP4 740
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 0
ASGNI4
line 2153
;2152:
;2153:			G_AddEvent(ent, EV_PRIVATE_DUEL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2154
;2154:			G_AddEvent(duelAgainst, EV_PRIVATE_DUEL, 0);
ADDRLP4 740
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2157
;2155:
;2156:			//Winner gets full health.. providing he's still alive
;2157:			if (!ent->client->sess.raceMode) { // did i port this right?
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1194
line 2158
;2158:				if (ent->health > 0 && ent->client->ps.stats[STAT_HEALTH] > 0)
ADDRLP4 764
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 768
CNSTI4 0
ASGNI4
ADDRLP4 764
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 768
INDIRI4
LEI4 $1198
ADDRLP4 764
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 768
INDIRI4
LEI4 $1198
line 2159
;2159:				{
line 2160
;2160:					if (ent->health < ent->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 772
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 772
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 772
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
GEI4 $1200
line 2161
;2161:					{
line 2162
;2162:						ent->client->ps.stats[STAT_HEALTH] = ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 776
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 780
ADDRLP4 776
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 784
ADDRLP4 780
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 776
INDIRP4
CNSTI4 688
ADDP4
ADDRLP4 784
INDIRI4
ASGNI4
ADDRLP4 780
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 784
INDIRI4
ASGNI4
line 2163
;2163:					}
LABELV $1200
line 2165
;2164:
;2165:					if (g_spawnInvulnerability.integer)
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
CNSTI4 0
EQI4 $1202
line 2166
;2166:					{
line 2167
;2167:						ent->client->ps.eFlags |= EF_INVULNERABLE;
ADDRLP4 776
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 776
INDIRP4
ADDRLP4 776
INDIRP4
INDIRI4
CNSTI4 67108864
BORI4
ASGNI4
line 2168
;2168:						ent->client->invulnerableTimer = nowTime + g_spawnInvulnerability.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43588
ADDP4
ADDRLP4 588
INDIRI4
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
ADDI4
ASGNI4
line 2169
;2169:					}
LABELV $1202
line 2170
;2170:				}
LABELV $1198
line 2177
;2171:
;2172:				/*
;2173:				trap_SendServerCommand( ent-g_entities, va("print \"%s" S_COLOR_WHITE " %s\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELWINNER")) );
;2174:				trap_SendServerCommand( duelAgainst-g_entities, va("print \"%s" S_COLOR_WHITE " %s\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELWINNER")) );
;2175:				*/
;2176:				//Private duel announcements are now made globally because we only want one duel at a time.
;2177:				if (ent->health > 0 && ent->client->ps.stats[STAT_HEALTH] > 0)
ADDRLP4 772
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 776
CNSTI4 0
ASGNI4
ADDRLP4 772
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 776
INDIRI4
LEI4 $1206
ADDRLP4 772
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 776
INDIRI4
LEI4 $1206
line 2178
;2178:				{
line 2179
;2179:					G_CenterPrint( -1, 3, va("%s" S_COLOR_WHITE " %s %s" S_COLOR_WHITE "!", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELWINNER"), duelAgainst->client->pers.netname) , qtrue,qfalse,qtrue, NULL);
ADDRGP4 $1209
ARGP4
ADDRGP4 $1210
ARGP4
ADDRLP4 780
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1208
ARGP4
ADDRLP4 784
CNSTI4 408
ASGNI4
ADDRLP4 788
CNSTI4 1428
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 784
INDIRI4
ADDP4
INDIRP4
ADDRLP4 788
INDIRI4
ADDP4
ARGP4
ADDRLP4 780
INDIRP4
ARGP4
ADDRLP4 740
INDIRP4
ADDRLP4 784
INDIRI4
ADDP4
INDIRP4
ADDRLP4 788
INDIRI4
ADDP4
ARGP4
ADDRLP4 792
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 792
INDIRP4
ARGP4
ADDRLP4 796
CNSTI4 1
ASGNI4
ADDRLP4 796
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 796
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_CenterPrint
CALLV
pop
line 2180
;2180:				}
ADDRGP4 $1194
JUMPV
LABELV $1206
line 2182
;2181:				else
;2182:				{ //it was a draw, because we both managed to die in the same frame
line 2183
;2183:					G_CenterPrint( -1, 3, va("%s", G_GetStripEdString("SVINGAME", "PLDUELTIE")), qtrue, qfalse,qtrue, NULL);
ADDRGP4 $1209
ARGP4
ADDRGP4 $1212
ARGP4
ADDRLP4 780
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1211
ARGP4
ADDRLP4 780
INDIRP4
ARGP4
ADDRLP4 784
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 784
INDIRP4
ARGP4
ADDRLP4 788
CNSTI4 1
ASGNI4
ADDRLP4 788
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 788
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_CenterPrint
CALLV
pop
line 2184
;2184:				}
line 2185
;2185:			}
line 2186
;2186:		}
ADDRGP4 $1194
JUMPV
LABELV $1193
line 2187
;2187:		else if(!ent->client->sess.raceMode)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1213
line 2188
;2188:		{
line 2190
;2189:			vec3_t vSub;
;2190:			float subLen = 0;
ADDRLP4 764
CNSTF4 0
ASGNF4
line 2192
;2191:
;2192:			VectorSubtract(ent->client->ps.origin, duelAgainst->client->ps.origin, vSub);
ADDRLP4 780
CNSTI4 408
ASGNI4
ADDRLP4 784
ADDRFP4 0
INDIRP4
ADDRLP4 780
INDIRI4
ADDP4
ASGNP4
ADDRLP4 788
CNSTI4 20
ASGNI4
ADDRLP4 792
ADDRLP4 740
INDIRP4
ADDRLP4 780
INDIRI4
ADDP4
ASGNP4
ADDRLP4 768
ADDRLP4 784
INDIRP4
INDIRP4
ADDRLP4 788
INDIRI4
ADDP4
INDIRF4
ADDRLP4 792
INDIRP4
INDIRP4
ADDRLP4 788
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 796
CNSTI4 24
ASGNI4
ADDRLP4 768+4
ADDRLP4 784
INDIRP4
INDIRP4
ADDRLP4 796
INDIRI4
ADDP4
INDIRF4
ADDRLP4 792
INDIRP4
INDIRP4
ADDRLP4 796
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 800
CNSTI4 408
ASGNI4
ADDRLP4 804
CNSTI4 28
ASGNI4
ADDRLP4 768+8
ADDRFP4 0
INDIRP4
ADDRLP4 800
INDIRI4
ADDP4
INDIRP4
ADDRLP4 804
INDIRI4
ADDP4
INDIRF4
ADDRLP4 740
INDIRP4
ADDRLP4 800
INDIRI4
ADDP4
INDIRP4
ADDRLP4 804
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2193
;2193:			subLen = VectorLength(vSub);
ADDRLP4 768
ARGP4
ADDRLP4 808
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 764
ADDRLP4 808
INDIRF4
ASGNF4
line 2195
;2194:
;2195:			if (subLen >= 1024)
ADDRLP4 764
INDIRF4
CNSTF4 1149239296
LTF4 $1217
line 2196
;2196:			{
line 2197
;2197:				ent->client->ps.duelInProgress = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 0
ASGNI4
line 2198
;2198:				duelAgainst->client->ps.duelInProgress = 0;
ADDRLP4 740
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
CNSTI4 0
ASGNI4
line 2200
;2199:
;2200:				G_AddEvent(ent, EV_PRIVATE_DUEL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2201
;2201:				G_AddEvent(duelAgainst, EV_PRIVATE_DUEL, 0);
ADDRLP4 740
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2203
;2202:
;2203:				trap_SendServerCommand( -1, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "PLDUELSTOP")) );
ADDRGP4 $1209
ARGP4
ADDRGP4 $1220
ARGP4
ADDRLP4 812
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1219
ARGP4
ADDRLP4 812
INDIRP4
ARGP4
ADDRLP4 816
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 816
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2204
;2204:			}
LABELV $1217
line 2205
;2205:		}
LABELV $1213
LABELV $1194
LABELV $1189
line 2206
;2206:	}
LABELV $1168
line 2214
;2207:
;2208:	/*
;2209:	if ( client->ps.powerups[PW_HASTE] ) {
;2210:		client->ps.speed *= 1.3;
;2211:	}
;2212:	*/
;2213:
;2214:	if (client->ps.usingATST && ent->health > 0)
ADDRLP4 740
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1316
ADDP4
INDIRI4
ADDRLP4 740
INDIRI4
EQI4 $1221
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 740
INDIRI4
LEI4 $1221
line 2215
;2215:	{ //we have special shot clip boxes as an ATST
line 2216
;2216:		ent->r.contents |= CONTENTS_NOSHOT;
ADDRLP4 744
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
ASGNP4
ADDRLP4 744
INDIRP4
ADDRLP4 744
INDIRP4
INDIRI4
CNSTI4 2097152
BORI4
ASGNI4
line 2217
;2217:		ATST_ManageDamageBoxes(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ATST_ManageDamageBoxes
CALLV
pop
line 2218
;2218:	}
ADDRGP4 $1222
JUMPV
LABELV $1221
line 2220
;2219:	else
;2220:	{
line 2221
;2221:		ent->r.contents &= ~CONTENTS_NOSHOT;
ADDRLP4 744
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
ASGNP4
ADDRLP4 744
INDIRP4
ADDRLP4 744
INDIRP4
INDIRI4
CNSTI4 -2097153
BANDI4
ASGNI4
line 2222
;2222:		client->damageBoxHandle_Head = 0;
ADDRLP4 4
INDIRP4
CNSTI4 43648
ADDP4
CNSTI4 0
ASGNI4
line 2223
;2223:		client->damageBoxHandle_RLeg = 0;
ADDRLP4 4
INDIRP4
CNSTI4 43652
ADDP4
CNSTI4 0
ASGNI4
line 2224
;2224:		client->damageBoxHandle_LLeg = 0;
ADDRLP4 4
INDIRP4
CNSTI4 43656
ADDP4
CNSTI4 0
ASGNI4
line 2225
;2225:	}
LABELV $1222
line 2231
;2226:
;2227:	//rww - moved this stuff into the pmove code so that it's predicted properly
;2228:	//BG_AdjustClientSpeed(&client->ps, &client->pers.cmd, nowTime);
;2229:
;2230:	// set up for pmove
;2231:	oldEventSequence = client->ps.eventSequence;
ADDRLP4 600
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ASGNI4
line 2233
;2232:
;2233:	memset (&pm, 0, sizeof(pm));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTU4 576
ARGU4
ADDRGP4 memset
CALLP4
pop
line 2235
;2234:
;2235:	if ( ent->flags & FL_FORCE_GESTURE ) {
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $1223
line 2236
;2236:		ent->flags &= ~FL_FORCE_GESTURE;
ADDRLP4 744
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ASGNP4
ADDRLP4 744
INDIRP4
ADDRLP4 744
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 2237
;2237:		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 748
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1400
ADDP4
ASGNP4
ADDRLP4 748
INDIRP4
ADDRLP4 748
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2238
;2238:	}
LABELV $1223
line 2240
;2239:
;2240:	if (ent->client && ent->client->ps.fallingToDeath &&
ADDRLP4 744
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 744
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1225
ADDRLP4 748
ADDRLP4 744
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
ASGNI4
ADDRLP4 748
INDIRI4
CNSTI4 0
EQI4 $1225
ADDRLP4 588
INDIRI4
CNSTI4 3000
SUBI4
ADDRLP4 748
INDIRI4
LEI4 $1225
line 2242
;2241:		(nowTime - FALL_FADE_TIME) > ent->client->ps.fallingToDeath)
;2242:	{ //die!
line 2243
;2243:		player_die(ent, ent, ent, 100000, MOD_FALLING);
ADDRLP4 752
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 752
INDIRP4
ARGP4
ADDRLP4 752
INDIRP4
ARGP4
ADDRLP4 752
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 34
ARGI4
ADDRGP4 player_die
CALLV
pop
line 2244
;2244:		respawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 2245
;2245:		ent->client->ps.fallingToDeath = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
CNSTI4 0
ASGNI4
line 2247
;2246:
;2247:		G_MuteSound(ent->s.number, CHAN_VOICE); //stop screaming, because you are dead!
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 2248
;2248:	}
LABELV $1225
line 2250
;2249:
;2250:	if (ent->client->ps.otherKillerTime > nowTime &&
ADDRLP4 752
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 756
ADDRLP4 752
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 756
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDRLP4 588
INDIRI4
LEI4 $1227
ADDRLP4 756
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $1227
ADDRLP4 756
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ADDRLP4 588
INDIRI4
GEI4 $1227
ADDRLP4 764
CNSTI4 0
ASGNI4
ADDRLP4 752
INDIRP4
CNSTI4 780
ADDP4
INDIRI4
ADDRLP4 764
INDIRI4
EQI4 $1229
ADDRLP4 752
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 131074
BANDI4
ADDRLP4 764
INDIRI4
NEI4 $1227
LABELV $1229
line 2254
;2251:		ent->client->ps.groundEntityNum != ENTITYNUM_NONE &&
;2252:		ent->client->ps.otherKillerDebounceTime < nowTime &&
;2253:		(!ent->waterlevel || !(ent->watertype & (CONTENTS_LAVA | CONTENTS_SLIME))))
;2254:	{
line 2255
;2255:		ent->client->ps.otherKillerTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 0
ASGNI4
line 2256
;2256:		ent->client->ps.otherKiller = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1023
ASGNI4
line 2257
;2257:	}
ADDRGP4 $1228
JUMPV
LABELV $1227
line 2258
;2258:	else if (ent->client->ps.otherKillerTime > nowTime &&
ADDRLP4 768
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 768
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDRLP4 588
INDIRI4
LEI4 $1230
ADDRLP4 768
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $1230
line 2260
;2259:		ent->client->ps.groundEntityNum == ENTITYNUM_NONE)
;2260:	{
line 2261
;2261:		if (ent->client->ps.otherKillerDebounceTime < (nowTime + 100))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ADDRLP4 588
INDIRI4
CNSTI4 100
ADDI4
GEI4 $1232
line 2262
;2262:		{
line 2263
;2263:			ent->client->ps.otherKillerDebounceTime = nowTime + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 588
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2264
;2264:		}
LABELV $1232
line 2265
;2265:	}
LABELV $1230
LABELV $1228
line 2270
;2266:
;2267://	WP_ForcePowersUpdate( ent, msec, ucmd); //update any active force powers
;2268://	WP_SaberPositionUpdate(ent, ucmd); //check the server-side saber point, do apprioriate server-side actions (effects are cs-only)
;2269:
;2270:	if ((ent->client->pers.cmd.buttons & BUTTON_USE) && ent->client->ps.useDelay < nowTime)
ADDRLP4 772
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 772
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1234
ADDRLP4 772
INDIRP4
CNSTI4 1356
ADDP4
INDIRI4
ADDRLP4 588
INDIRI4
GEI4 $1234
line 2271
;2271:	{
line 2272
;2272:		TryUse(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TryUse
CALLV
pop
line 2273
;2273:		ent->client->ps.useDelay = nowTime + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1356
ADDP4
ADDRLP4 588
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2274
;2274:	}
LABELV $1234
line 2276
;2275:
;2276:	pm.ps = &client->ps;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
line 2277
;2277:	pm.cmd = *ucmd;
ADDRLP4 8+4
ADDRLP4 592
INDIRP4
INDIRB
ASGNB 28
line 2278
;2278:	if ( pm.ps->pm_type == PM_DEAD ) {
ADDRLP4 776
CNSTI4 4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 776
INDIRI4
ADDP4
INDIRI4
ADDRLP4 776
INDIRI4
NEI4 $1237
line 2279
;2279:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRLP4 8+64
CNSTI4 17
ASGNI4
line 2280
;2280:	}
ADDRGP4 $1238
JUMPV
LABELV $1237
line 2281
;2281:	else if ( ent->r.svFlags & SVF_BOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1240
line 2282
;2282:		pm.tracemask = MASK_PLAYERSOLID | CONTENTS_MONSTERCLIP;
ADDRLP4 8+64
CNSTI4 305
ASGNI4
line 2283
;2283:	}
ADDRGP4 $1241
JUMPV
LABELV $1240
line 2284
;2284:	else {
line 2285
;2285:		pm.tracemask = MASK_PLAYERSOLID;
ADDRLP4 8+64
CNSTI4 273
ASGNI4
line 2286
;2286:	}
LABELV $1241
LABELV $1238
line 2287
;2287:	pm.trace = JP_Trace;
ADDRLP4 8+300
ADDRGP4 JP_Trace
ASGNP4
line 2288
;2288:	pm.q2trace = g_q2trace.integer == 2 ? JP_TraceCustomEpsilonQ2 : (g_q2trace.integer ? JP_TraceCustomEpsilonQ2Lite : 0);
ADDRGP4 g_q2trace+12
INDIRI4
CNSTI4 2
NEI4 $1250
ADDRLP4 780
ADDRGP4 JP_TraceCustomEpsilonQ2
ASGNP4
ADDRGP4 $1251
JUMPV
LABELV $1250
ADDRGP4 g_q2trace+12
INDIRI4
CNSTI4 0
EQI4 $1252
ADDRLP4 784
ADDRGP4 JP_TraceCustomEpsilonQ2Lite
ASGNP4
ADDRGP4 $1253
JUMPV
LABELV $1252
ADDRLP4 784
CNSTP4 0
ASGNP4
LABELV $1253
ADDRLP4 780
ADDRLP4 784
INDIRP4
ASGNP4
LABELV $1251
ADDRLP4 8+304
ADDRLP4 780
INDIRP4
ASGNP4
line 2289
;2289:	pm.q2TraceStyle = g_q2trace.integer;
ADDRLP4 8+312
ADDRGP4 g_q2trace+12
INDIRI4
ASGNI4
line 2290
;2290:	pm.q2Skims = g_q2Skims.integer;
ADDRLP4 8+316
ADDRGP4 g_q2Skims+12
INDIRI4
ASGNI4
line 2291
;2291:	pm.rawtrace = trap_Trace;
ADDRLP4 8+472
ADDRGP4 trap_Trace
ASGNP4
line 2292
;2292:	pm.pointcontents = trap_PointContents;
ADDRLP4 8+308
ADDRGP4 trap_PointContents
ASGNP4
line 2293
;2293:	pm.debugLevel = g_debugMove.integer;
ADDRLP4 8+68
ADDRGP4 g_debugMove+12
INDIRI4
ASGNI4
line 2294
;2294:	pm.noFootsteps = ( g_dmflags.integer & DF_NO_FOOTSTEPS ) > 0;
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
LEI4 $1265
ADDRLP4 788
CNSTI4 1
ASGNI4
ADDRGP4 $1266
JUMPV
LABELV $1265
ADDRLP4 788
CNSTI4 0
ASGNI4
LABELV $1266
ADDRLP4 8+72
ADDRLP4 788
INDIRI4
ASGNI4
line 2295
;2295:	pm.unlockRandom = g_unlockRandom.integer;
ADDRLP4 8+564
ADDRGP4 g_unlockRandom+12
INDIRI4
ASGNI4
line 2296
;2296:	pm.mineSwitchFix = g_mineSwitchFix.integer;
ADDRLP4 8+568
ADDRGP4 g_mineSwitchFix+12
INDIRI4
ASGNI4
line 2298
;2297:
;2298:	pm.pmove_fixed = g_pmove_fixed.integer | client->pers.pmoveFixed;
ADDRLP4 8+268
ADDRGP4 g_pmove_fixed+12
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1424
ADDP4
INDIRI4
BORI4
ASGNI4
line 2299
;2299:	pm.pmove_msec = g_pmove_msec.integer;
ADDRLP4 8+272
ADDRGP4 g_pmove_msec+12
INDIRI4
ASGNI4
line 2300
;2300:	pm.pmove_float = g_pmove_float.integer;
ADDRLP4 8+276
ADDRGP4 g_pmove_float+12
INDIRI4
ASGNI4
line 2302
;2301:
;2302:	pm.mod = SVMOD_TOMMYTERNAL;
ADDRLP4 8+280
CNSTI4 2
ASGNI4
line 2304
;2303:
;2304:	pm.highFpsFix = g_fixHighFPSAbuse.integer;
ADDRLP4 8+572
ADDRGP4 g_fixHighFPSAbuse+12
INDIRI4
ASGNI4
line 2306
;2305:
;2306:	pm.animations = bgGlobalAnimations;//NULL;
ADDRLP4 8+260
ADDRGP4 bgGlobalAnimations
ASGNP4
line 2308
;2307:
;2308:	pm.gametype = g_gametype.integer;
ADDRLP4 8+252
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
line 2310
;2309:
;2310:	pm.debugMelee = g_debugMelee.integer;
ADDRLP4 8+256
ADDRGP4 g_debugMelee+12
INDIRI4
ASGNI4
line 2312
;2311:
;2312:	if (g_fpsToggleDelay.integer && !client->sess.raceMode) { // TODO unify requiredCmdMsec and STAT_MSECRESTRICT and maybe all the other stuff related to this 
ADDRLP4 792
CNSTI4 0
ASGNI4
ADDRGP4 g_fpsToggleDelay+12
INDIRI4
ADDRLP4 792
INDIRI4
EQI4 $1285
ADDRLP4 4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 792
INDIRI4
NEI4 $1285
line 2313
;2313:		pm.requiredCmdMsec = client->pers.physicsFps.acceptedSettingMsec ? client->pers.physicsFps.acceptedSettingMsec : -1;
ADDRLP4 4
INDIRP4
CNSTI4 42516
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1290
ADDRLP4 796
ADDRLP4 4
INDIRP4
CNSTI4 42516
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1291
JUMPV
LABELV $1290
ADDRLP4 796
CNSTI4 -1
ASGNI4
LABELV $1291
ADDRLP4 8+456
ADDRLP4 796
INDIRI4
ASGNI4
line 2314
;2314:	}
LABELV $1285
line 2317
;2315:
;2316:	//Set up bg entity data
;2317:	pm.baseEnt = (bgEntity_t*)g_entities;
ADDRLP4 8+464
ADDRGP4 g_entities
ASGNP4
line 2318
;2318:	pm.entSize = sizeof(gentity_t);
ADDRLP4 8+468
CNSTI4 2352
ASGNI4
line 2322
;2319:
;2320:	//VectorCopy( client->ps.origin, client->oldOrigin );
;2321:
;2322:	if (level.intermissionQueued != 0 && g_singlePlayer.integer) {
ADDRLP4 796
CNSTI4 0
ASGNI4
ADDRGP4 level+9024
INDIRI4
ADDRLP4 796
INDIRI4
EQI4 $1294
ADDRGP4 g_singlePlayer+12
INDIRI4
ADDRLP4 796
INDIRI4
EQI4 $1294
line 2323
;2323:		if ( level.time - level.intermissionQueued >= 1000  ) {
ADDRGP4 level+36
INDIRI4
ADDRGP4 level+9024
INDIRI4
SUBI4
CNSTI4 1000
LTI4 $1298
line 2324
;2324:			pm.cmd.buttons = 0;
ADDRLP4 8+4+16
CNSTI4 0
ASGNI4
line 2325
;2325:			pm.cmd.forwardmove = 0;
ADDRLP4 8+4+24
CNSTI1 0
ASGNI1
line 2326
;2326:			pm.cmd.rightmove = 0;
ADDRLP4 8+4+25
CNSTI1 0
ASGNI1
line 2327
;2327:			pm.cmd.upmove = 0;
ADDRLP4 8+4+26
CNSTI1 0
ASGNI1
line 2328
;2328:			if ( level.time - level.intermissionQueued >= 2000 && level.time - level.intermissionQueued <= 2500 ) {
ADDRGP4 level+36
INDIRI4
ADDRGP4 level+9024
INDIRI4
SUBI4
CNSTI4 2000
LTI4 $1310
ADDRGP4 level+36
INDIRI4
ADDRGP4 level+9024
INDIRI4
SUBI4
CNSTI4 2500
GTI4 $1310
line 2329
;2329:				trap_SendConsoleCommand( EXEC_APPEND, "centerview\n");
CNSTI4 2
ARGI4
ADDRGP4 $1316
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2330
;2330:			}
LABELV $1310
line 2331
;2331:			ent->client->ps.pm_type = PM_SPINTERMISSION;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
line 2332
;2332:		}
LABELV $1298
line 2333
;2333:	}
LABELV $1294
line 2335
;2334:
;2335:	for ( i = 0 ; i < MAX_CLIENTS ; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1317
line 2336
;2336:	{
line 2337
;2337:		if (g_entities[i].inuse && g_entities[i].client)
ADDRLP4 800
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 800
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1321
ADDRLP4 800
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1321
line 2338
;2338:		{
line 2339
;2339:			pm.bgClients[i] = &g_entities[i].client->ps;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8+324
ADDP4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ASGNP4
line 2340
;2340:		}
LABELV $1321
line 2341
;2341:	}
LABELV $1318
line 2335
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $1317
line 2343
;2342:
;2343:	if (ent->client->ps.saberLockTime > nowTime)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRLP4 588
INDIRI4
LEI4 $1327
line 2344
;2344:	{
line 2345
;2345:		gentity_t *blockOpp = &g_entities[ent->client->ps.saberLockEnemy];
ADDRLP4 800
CNSTI4 2352
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2347
;2346:
;2347:		if (blockOpp && blockOpp->inuse && blockOpp->client)
ADDRLP4 808
CNSTU4 0
ASGNU4
ADDRLP4 800
INDIRP4
CVPU4 4
ADDRLP4 808
INDIRU4
EQU4 $1329
ADDRLP4 800
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1329
ADDRLP4 800
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 808
INDIRU4
EQU4 $1329
line 2348
;2348:		{
line 2352
;2349:			vec3_t lockDir, lockAng;
;2350:
;2351:			//VectorClear( ent->client->ps.velocity );
;2352:			VectorSubtract( blockOpp->r.currentOrigin, ent->r.currentOrigin, lockDir );
ADDRLP4 840
CNSTI4 368
ASGNI4
ADDRLP4 844
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 812
ADDRLP4 800
INDIRP4
ADDRLP4 840
INDIRI4
ADDP4
INDIRF4
ADDRLP4 844
INDIRP4
ADDRLP4 840
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 848
CNSTI4 372
ASGNI4
ADDRLP4 812+4
ADDRLP4 800
INDIRP4
ADDRLP4 848
INDIRI4
ADDP4
INDIRF4
ADDRLP4 844
INDIRP4
ADDRLP4 848
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 852
CNSTI4 376
ASGNI4
ADDRLP4 812+8
ADDRLP4 800
INDIRP4
ADDRLP4 852
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 852
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2354
;2353:			//lockAng[YAW] = vectoyaw( defDir );
;2354:			vectoangles(lockDir, lockAng);
ADDRLP4 812
ARGP4
ADDRLP4 824
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2355
;2355:			DF_PreDeltaAngleChange(ent->client);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 DF_PreDeltaAngleChange
CALLV
pop
line 2356
;2356:			SetClientViewAngle( ent, lockAng );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 824
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 2357
;2357:			DF_PreDeltaAngleChange(ent->client);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 DF_PreDeltaAngleChange
CALLV
pop
line 2358
;2358:		}
LABELV $1329
line 2360
;2359:
;2360:		if ( ( ent->client->buttons & BUTTON_ATTACK ) && ! ( ent->client->oldbuttons & BUTTON_ATTACK ) )
ADDRLP4 812
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 816
CNSTI4 1
ASGNI4
ADDRLP4 820
CNSTI4 0
ASGNI4
ADDRLP4 812
INDIRP4
CNSTI4 43608
ADDP4
INDIRI4
ADDRLP4 816
INDIRI4
BANDI4
ADDRLP4 820
INDIRI4
EQI4 $1333
ADDRLP4 812
INDIRP4
CNSTI4 43612
ADDP4
INDIRI4
ADDRLP4 816
INDIRI4
BANDI4
ADDRLP4 820
INDIRI4
NEI4 $1333
line 2361
;2361:		{
line 2362
;2362:			ent->client->ps.saberLockHits++;
ADDRLP4 824
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 824
INDIRP4
ADDRLP4 824
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2363
;2363:		}
LABELV $1333
line 2364
;2364:		if (ent->client->ps.saberLockHits > 2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 2
LEI4 $1328
line 2365
;2365:		{
line 2366
;2366:			if (!ent->client->ps.saberLockAdvance)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1337
line 2367
;2367:			{
line 2368
;2368:				ent->client->ps.saberLockHits -= 3;
ADDRLP4 824
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 824
INDIRP4
ADDRLP4 824
INDIRP4
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 2369
;2369:			}
LABELV $1337
line 2370
;2370:			ent->client->ps.saberLockAdvance = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 1
ASGNI4
line 2371
;2371:		}
line 2372
;2372:	}
ADDRGP4 $1328
JUMPV
LABELV $1327
line 2374
;2373:	else
;2374:	{
line 2375
;2375:		ent->client->ps.saberLockFrame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 2377
;2376:		//check for taunt
;2377:		if ( (pm.cmd.generic_cmd == GENCMD_ENGAGE_DUEL) && (g_gametype.integer == GT_TOURNAMENT) )
ADDRLP4 8+4+23
INDIRU1
CVUI4 1
CNSTI4 2
NEI4 $1339
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1339
line 2378
;2378:		{//already in a duel, make it a taunt command
line 2379
;2379:			pm.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 8+4+16
ADDRLP4 8+4+16
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2380
;2380:		}
LABELV $1339
line 2381
;2381:	}
LABELV $1328
line 2384
;2382:
;2383:	// Save some value for robust trigger application
;2384:	VectorCopy(ent->client->ps.origin,ent->client->prePmovePosition);
ADDRLP4 800
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 800
INDIRP4
CNSTI4 43812
ADDP4
ADDRLP4 800
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2385
;2385:	VectorCopy(ent->r.mins,ent->client->prePmoveMins); // this is -8 -8 -8 8 8 8 sometimes?!?!?! when rolling?
ADDRLP4 804
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 804
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43824
ADDP4
ADDRLP4 804
INDIRP4
CNSTI4 316
ADDP4
INDIRB
ASGNB 12
line 2386
;2386:	VectorCopy(ent->r.maxs,ent->client->prePmoveMaxs);
ADDRLP4 808
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 808
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43836
ADDP4
ADDRLP4 808
INDIRP4
CNSTI4 328
ADDP4
INDIRB
ASGNB 12
line 2387
;2387:	VectorCopy(ent->client->ps.velocity,prePmoveVelocity);
ADDRLP4 616
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2388
;2388:	ent->client->prePmoveEFlags = ent->client->ps.eFlags;
ADDRLP4 812
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 812
INDIRP4
CNSTI4 43888
ADDP4
ADDRLP4 812
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 2389
;2389:	ent->client->prePmovePositionSet = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43884
ADDP4
CNSTI4 1
ASGNI4
line 2390
;2390:	ent->client->prePmoveCommandTime = ent->client->ps.commandTime;
ADDRLP4 816
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 816
INDIRP4
CNSTI4 43892
ADDP4
ADDRLP4 816
INDIRP4
INDIRI4
ASGNI4
line 2392
;2391:
;2392:	pm.handleStrafebotSlopes = g_strafebotSlopeHandling.integer;
ADDRLP4 8+560
ADDRGP4 g_strafebotSlopeHandling+12
INDIRI4
ASGNI4
line 2393
;2393:	pm.roll = ent->client->pers.roll;
ADDRLP4 8+476
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43348
ADDP4
INDIRB
ASGNB 60
line 2394
;2394:	pm.antiLoop = ent->client->pers.antiLoop;
ADDRLP4 8+536
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43344
ADDP4
INDIRB
ASGNB 4
line 2395
;2395:	pm.oldButtons = ent->client->oldbuttons;
ADDRLP4 8+60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43612
ADDP4
INDIRI4
ASGNI4
line 2396
;2396:	DF_PreDeltaAngleChange(ent->client);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 DF_PreDeltaAngleChange
CALLV
pop
line 2397
;2397:	pm.positionChangedOutsidePmove = !VectorCompare(ent->client->ps.origin, client->oldPostPmovePosition);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 52140
ADDP4
ARGP4
ADDRLP4 824
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 824
INDIRI4
CNSTI4 0
NEI4 $1353
ADDRLP4 820
CNSTI4 1
ASGNI4
ADDRGP4 $1354
JUMPV
LABELV $1353
ADDRLP4 820
CNSTI4 0
ASGNI4
LABELV $1354
ADDRLP4 8+320
ADDRLP4 820
INDIRI4
ASGNI4
line 2398
;2398:	Pmove (&pm);
ADDRLP4 8
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 2399
;2399:	DF_PostDeltaAngleChange(ent->client,!(ent->client->sess.raceStyle.runFlags & RFL_BOT)); // qfalse if strafebot
ADDRLP4 832
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 832
INDIRP4
ARGP4
ADDRLP4 832
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $1356
ADDRLP4 828
CNSTI4 1
ASGNI4
ADDRGP4 $1357
JUMPV
LABELV $1356
ADDRLP4 828
CNSTI4 0
ASGNI4
LABELV $1357
ADDRLP4 828
INDIRI4
ARGI4
ADDRGP4 DF_PostDeltaAngleChange
CALLV
pop
line 2400
;2400:	ent->client->pers.roll = pm.roll;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43348
ADDP4
ADDRLP4 8+476
INDIRB
ASGNB 60
line 2401
;2401:	ent->client->pers.antiLoop = pm.antiLoop;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43344
ADDP4
ADDRLP4 8+536
INDIRB
ASGNB 4
line 2403
;2402:
;2403:	if (client->isIronMan) {
ADDRLP4 4
INDIRP4
CNSTI4 53188
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1360
line 2404
;2404:		G_MaybeSaveIronmanPos(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_MaybeSaveIronmanPos
CALLV
pop
line 2405
;2405:	}
LABELV $1360
line 2407
;2406:
;2407:	if (ent->client->sess.raceStateInvalidated) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43516
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1362
line 2408
;2408:		ent->client->pers.roll.rollDisqualified = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43352
ADDP4
CNSTI4 1
ASGNI4
line 2409
;2409:	}
LABELV $1362
line 2411
;2410:
;2411:	level.playerStats[ent - g_entities]->s.pos.trBase[1] = ent->client->ps.fd.forceSpeedSmash; // for nicer force speed client prediction
ADDRLP4 836
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 836
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
ADDRGP4 level+9152
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 836
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1136
ADDP4
INDIRF4
ASGNF4
line 2412
;2412:	level.playerStats[ent - g_entities]->s.pos.trDelta[0] = ent->client->ps.fd.forceJumpCharge; // for chargejump movement prediction
ADDRLP4 840
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 840
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
ADDRGP4 level+9152
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 840
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1096
ADDP4
INDIRF4
ASGNF4
line 2416
;2413:	//level.playerStats[ent - g_entities]->s.pos.trDelta[1] = intfloat(ent->client->ps.groundTime); // for chargejump movement prediction. nvm got rid of the groundtime thingie kinda
;2414:
;2415:	//DF_AntiLoop_NewAngle(&ent->client->pers.antiLoop,prePmoveVelocity,ent->client->ps.velocity,ent->client->ps.basespeed,ent->client->sess.raceMode && ent->client->pers.raceStartCommandTime);
;2416:	DF_AntiLoop_NewAngle(&ent->client->pers.antiLoop,pm.lastAntiLoopVelocity,ent->client->ps.velocity,ent->client->ps.basespeed,ent->client->sess.raceMode && ent->client->pers.raceStartCommandTime);
ADDRLP4 848
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 848
INDIRP4
CNSTI4 43344
ADDP4
ARGP4
ADDRLP4 8+540
ARGP4
ADDRLP4 848
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 848
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 852
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 856
CNSTI4 0
ASGNI4
ADDRLP4 852
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 856
INDIRI4
EQI4 $1368
ADDRLP4 852
INDIRP4
CNSTI4 22064
ADDP4
INDIRI4
ADDRLP4 856
INDIRI4
EQI4 $1368
ADDRLP4 844
CNSTI4 1
ASGNI4
ADDRGP4 $1369
JUMPV
LABELV $1368
ADDRLP4 844
CNSTI4 0
ASGNI4
LABELV $1369
ADDRLP4 844
INDIRI4
ARGI4
ADDRGP4 DF_AntiLoop_NewAngle
CALLV
pop
line 2417
;2417:	level.playerStats[ent - g_entities]->s.pos.trBase[0] = ent->client->pers.antiLoop.yawAngleChangeSinceBaseSpeed;
ADDRLP4 860
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 860
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
ADDRGP4 level+9152
ADDP4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 860
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43344
ADDP4
INDIRF4
ASGNF4
line 2418
;2418:	DF_CheckRollSpeed(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DF_CheckRollSpeed
CALLV
pop
line 2420
;2419:
;2420:	VectorCopy(ent->client->ps.origin,ent->client->postPmovePosition);
ADDRLP4 864
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 864
INDIRP4
CNSTI4 43848
ADDP4
ADDRLP4 864
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2421
;2421:	VectorCopy(pm.mins, ent->client->postPmoveMins);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43860
ADDP4
ADDRLP4 8+220
INDIRB
ASGNB 12
line 2422
;2422:	VectorCopy(pm.maxs, ent->client->postPmoveMaxs);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43872
ADDP4
ADDRLP4 8+232
INDIRB
ASGNB 12
line 2423
;2423:	VectorCopy(client->ps.origin, client->oldPostPmovePosition); // for q2 snapping mode
ADDRLP4 4
INDIRP4
CNSTI4 52140
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2425
;2424:
;2425:	UpdateClientPastFpsStats(ent,msec);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 596
INDIRI4
ARGI4
ADDRGP4 UpdateClientPastFpsStats
CALLV
pop
line 2428
;2426:	//client->lastMsecValue = msec;
;2427:
;2428:	if (client->pers.raceStartCommandTime && DF_PrePmoveValid(ent)) { // is this accurate? can there be any movement outside of pmove? other than teleport, that is.
ADDRLP4 4
INDIRP4
CNSTI4 22064
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1373
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 872
ADDRGP4 DF_PrePmoveValid
CALLI4
ASGNI4
ADDRLP4 872
INDIRI4
CNSTI4 0
EQI4 $1373
line 2430
;2429:		vec3_t displacementAdd;
;2430:		float currentXYSpeed = XYSPEED(client->ps.velocity);
ADDRLP4 896
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
ADDRLP4 900
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ASGNF4
ADDRLP4 896
INDIRF4
ADDRLP4 896
INDIRF4
MULF4
ADDRLP4 900
INDIRF4
ADDRLP4 900
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 904
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 888
ADDRLP4 904
INDIRF4
ASGNF4
line 2431
;2431:		VectorSubtract(client->postPmovePosition, client->prePmovePosition, displacementAdd);
ADDRLP4 876
ADDRLP4 4
INDIRP4
CNSTI4 43848
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 43812
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 876+4
ADDRLP4 4
INDIRP4
CNSTI4 43852
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 43816
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 876+8
ADDRLP4 4
INDIRP4
CNSTI4 43856
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 43820
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2432
;2432:		client->pers.stats.distanceTraveled += VectorLength(displacementAdd);
ADDRLP4 876
ARGP4
ADDRLP4 916
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 920
ADDRLP4 4
INDIRP4
CNSTI4 42540
ADDP4
ASGNP4
ADDRLP4 920
INDIRP4
ADDRLP4 920
INDIRP4
INDIRF4
ADDRLP4 916
INDIRF4
ADDF4
ASGNF4
line 2433
;2433:		displacementAdd[2] = 0;
ADDRLP4 876+8
CNSTF4 0
ASGNF4
line 2434
;2434:		client->pers.stats.distanceTraveled2D += VectorLength(displacementAdd);
ADDRLP4 876
ARGP4
ADDRLP4 924
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 928
ADDRLP4 4
INDIRP4
CNSTI4 42544
ADDP4
ASGNP4
ADDRLP4 928
INDIRP4
ADDRLP4 928
INDIRP4
INDIRF4
ADDRLP4 924
INDIRF4
ADDF4
ASGNF4
line 2435
;2435:		if (currentXYSpeed > client->pers.stats.topSpeed) {
ADDRLP4 888
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 42548
ADDP4
INDIRF4
LEF4 $1378
line 2436
;2436:			client->pers.stats.topSpeed = currentXYSpeed;
ADDRLP4 4
INDIRP4
CNSTI4 42548
ADDP4
ADDRLP4 888
INDIRF4
ASGNF4
line 2437
;2437:		}
LABELV $1378
line 2438
;2438:	}
LABELV $1373
line 2440
;2439:
;2440:	if (pm.checkDuelLoss)
ADDRLP4 8+452
INDIRI4
CNSTI4 0
EQI4 $1380
line 2441
;2441:	{
line 2442
;2442:		if (pm.checkDuelLoss > 0 && pm.checkDuelLoss <= MAX_CLIENTS)
ADDRLP4 8+452
INDIRI4
CNSTI4 0
LEI4 $1383
ADDRLP4 8+452
INDIRI4
CNSTI4 32
GTI4 $1383
line 2443
;2443:		{
line 2444
;2444:			gentity_t *clientLost = &g_entities[pm.checkDuelLoss-1];
ADDRLP4 876
CNSTI4 2352
ADDRLP4 8+452
INDIRI4
MULI4
ADDRGP4 g_entities-2352
ADDP4
ASGNP4
line 2446
;2445:
;2446:			if (clientLost && clientLost->inuse && clientLost->client && Q_irand(0, 40 + gRandomUnlockAdd, clientLost->client->sess.raceMode, 20) > clientLost->health)
ADDRLP4 884
CNSTU4 0
ASGNU4
ADDRLP4 876
INDIRP4
CVPU4 4
ADDRLP4 884
INDIRU4
EQU4 $1389
ADDRLP4 888
CNSTI4 0
ASGNI4
ADDRLP4 876
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 888
INDIRI4
EQI4 $1389
ADDRLP4 892
ADDRLP4 876
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 892
INDIRP4
CVPU4 4
ADDRLP4 884
INDIRU4
EQU4 $1389
ADDRLP4 888
INDIRI4
ARGI4
ADDRGP4 gRandomUnlockAdd
INDIRI4
CNSTI4 40
ADDI4
ARGI4
ADDRLP4 892
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ARGI4
CNSTI4 20
ARGI4
ADDRLP4 896
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 896
INDIRI4
ADDRLP4 876
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
LEI4 $1389
line 2447
;2447:			{
line 2449
;2448:				vec3_t attDir;
;2449:				VectorSubtract(ent->client->ps.origin, clientLost->client->ps.origin, attDir);
ADDRLP4 912
CNSTI4 408
ASGNI4
ADDRLP4 916
ADDRFP4 0
INDIRP4
ADDRLP4 912
INDIRI4
ADDP4
ASGNP4
ADDRLP4 920
CNSTI4 20
ASGNI4
ADDRLP4 924
ADDRLP4 876
INDIRP4
ADDRLP4 912
INDIRI4
ADDP4
ASGNP4
ADDRLP4 900
ADDRLP4 916
INDIRP4
INDIRP4
ADDRLP4 920
INDIRI4
ADDP4
INDIRF4
ADDRLP4 924
INDIRP4
INDIRP4
ADDRLP4 920
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 928
CNSTI4 24
ASGNI4
ADDRLP4 900+4
ADDRLP4 916
INDIRP4
INDIRP4
ADDRLP4 928
INDIRI4
ADDP4
INDIRF4
ADDRLP4 924
INDIRP4
INDIRP4
ADDRLP4 928
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 932
CNSTI4 408
ASGNI4
ADDRLP4 936
CNSTI4 28
ASGNI4
ADDRLP4 900+8
ADDRFP4 0
INDIRP4
ADDRLP4 932
INDIRI4
ADDP4
INDIRP4
ADDRLP4 936
INDIRI4
ADDP4
INDIRF4
ADDRLP4 876
INDIRP4
ADDRLP4 932
INDIRI4
ADDP4
INDIRP4
ADDRLP4 936
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2450
;2450:				VectorNormalize(attDir);
ADDRLP4 900
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2452
;2451:
;2452:				VectorClear(clientLost->client->ps.velocity);
ADDRLP4 940
ADDRLP4 876
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 944
CNSTF4 0
ASGNF4
ADDRLP4 940
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 944
INDIRF4
ASGNF4
ADDRLP4 940
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 944
INDIRF4
ASGNF4
ADDRLP4 940
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 944
INDIRF4
ASGNF4
line 2453
;2453:				clientLost->client->ps.forceHandExtend = HANDEXTEND_NONE;
ADDRLP4 876
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 0
ASGNI4
line 2454
;2454:				clientLost->client->ps.forceHandExtendTime = 0;
ADDRLP4 876
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
CNSTI4 0
ASGNI4
line 2456
;2455:
;2456:				gGAvoidDismember = 1;
ADDRGP4 gGAvoidDismember
CNSTI4 1
ASGNI4
line 2457
;2457:				G_Damage(clientLost, ent, ent, attDir, clientLost->client->ps.origin, 9999, DAMAGE_NO_PROTECTION, MOD_SABER);
ADDRLP4 876
INDIRP4
ARGP4
ADDRLP4 952
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 952
INDIRP4
ARGP4
ADDRLP4 952
INDIRP4
ARGP4
ADDRLP4 900
ARGP4
ADDRLP4 876
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 9999
ARGI4
CNSTI4 8
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2459
;2458:
;2459:				if (clientLost->health < 1)
ADDRLP4 876
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1393
line 2460
;2460:				{
line 2461
;2461:					gGAvoidDismember = 2;
ADDRGP4 gGAvoidDismember
CNSTI4 2
ASGNI4
line 2462
;2462:					G_CheckForDismemberment(clientLost, clientLost->client->ps.origin, 999, (clientLost->client->ps.legsAnim&~ANIM_TOGGLEBIT));
ADDRLP4 876
INDIRP4
ARGP4
ADDRLP4 960
ADDRLP4 876
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 960
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 999
ARGI4
ADDRLP4 960
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRGP4 G_CheckForDismemberment
CALLV
pop
line 2463
;2463:				}
LABELV $1393
line 2465
;2464:
;2465:				gGAvoidDismember = 0;
ADDRGP4 gGAvoidDismember
CNSTI4 0
ASGNI4
line 2466
;2466:			}
LABELV $1389
line 2467
;2467:		}
LABELV $1383
line 2469
;2468:
;2469:		pm.checkDuelLoss = 0;
ADDRLP4 8+452
CNSTI4 0
ASGNI4
line 2470
;2470:	}
LABELV $1380
line 2472
;2471:
;2472:	switch(pm.cmd.generic_cmd)
ADDRLP4 876
ADDRLP4 8+4+23
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 876
INDIRI4
CNSTI4 0
LTI4 $1397
ADDRLP4 876
INDIRI4
CNSTI4 20
GTI4 $1397
ADDRLP4 876
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1441
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1441
address $1397
address $1402
address $1403
address $1407
address $1408
address $1409
address $1410
address $1411
address $1412
address $1413
address $1414
address $1415
address $1416
address $1417
address $1418
address $1421
address $1424
address $1427
address $1432
address $1437
address $1440
code
line 2473
;2473:	{
line 2475
;2474:	case 0:
;2475:		break;
LABELV $1402
line 2477
;2476:	case GENCMD_SABERSWITCH:
;2477:		Cmd_ToggleSaber_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_ToggleSaber_f
CALLV
pop
line 2478
;2478:		break;
ADDRGP4 $1397
JUMPV
LABELV $1403
line 2480
;2479:	case GENCMD_ENGAGE_DUEL:
;2480:		if ( g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1404
line 2481
;2481:		{//already in a duel, made it a taunt command
line 2482
;2482:		}
ADDRGP4 $1397
JUMPV
LABELV $1404
line 2484
;2483:		else
;2484:		{
line 2485
;2485:			Cmd_EngageDuel_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_EngageDuel_f
CALLV
pop
line 2486
;2486:		}
line 2487
;2487:		break;
ADDRGP4 $1397
JUMPV
LABELV $1407
line 2489
;2488:	case GENCMD_FORCE_HEAL:
;2489:		ForceHeal(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceHeal
CALLV
pop
line 2490
;2490:		break;
ADDRGP4 $1397
JUMPV
LABELV $1408
line 2492
;2491:	case GENCMD_FORCE_SPEED:
;2492:		ForceSpeed(ent, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ForceSpeed
CALLV
pop
line 2493
;2493:		break;
ADDRGP4 $1397
JUMPV
LABELV $1409
line 2495
;2494:	case GENCMD_FORCE_THROW:
;2495:		ForceThrow(ent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ForceThrow
CALLV
pop
line 2496
;2496:		break;
ADDRGP4 $1397
JUMPV
LABELV $1410
line 2498
;2497:	case GENCMD_FORCE_PULL:
;2498:		ForceThrow(ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ForceThrow
CALLV
pop
line 2499
;2499:		break;
ADDRGP4 $1397
JUMPV
LABELV $1411
line 2501
;2500:	case GENCMD_FORCE_DISTRACT:
;2501:		ForceTelepathy(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTelepathy
CALLV
pop
line 2502
;2502:		break;
ADDRGP4 $1397
JUMPV
LABELV $1412
line 2504
;2503:	case GENCMD_FORCE_RAGE:
;2504:		ForceRage(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceRage
CALLV
pop
line 2505
;2505:		break;
ADDRGP4 $1397
JUMPV
LABELV $1413
line 2507
;2506:	case GENCMD_FORCE_PROTECT:
;2507:		ForceProtect(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceProtect
CALLV
pop
line 2508
;2508:		break;
ADDRGP4 $1397
JUMPV
LABELV $1414
line 2510
;2509:	case GENCMD_FORCE_ABSORB:
;2510:		ForceAbsorb(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceAbsorb
CALLV
pop
line 2511
;2511:		break;
ADDRGP4 $1397
JUMPV
LABELV $1415
line 2513
;2512:	case GENCMD_FORCE_HEALOTHER:
;2513:		ForceTeamHeal(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTeamHeal
CALLV
pop
line 2514
;2514:		break;
ADDRGP4 $1397
JUMPV
LABELV $1416
line 2516
;2515:	case GENCMD_FORCE_FORCEPOWEROTHER:
;2516:		ForceTeamForceReplenish(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTeamForceReplenish
CALLV
pop
line 2517
;2517:		break;
ADDRGP4 $1397
JUMPV
LABELV $1417
line 2519
;2518:	case GENCMD_FORCE_SEEING:
;2519:		ForceSeeing(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceSeeing
CALLV
pop
line 2520
;2520:		break;
ADDRGP4 $1397
JUMPV
LABELV $1418
line 2522
;2521:	case GENCMD_USE_SEEKER:
;2522:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SEEKER)) &&
ADDRLP4 884
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 888
ADDRLP4 884
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 888
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1397
ADDRLP4 888
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 884
INDIRP4
ARGP4
ADDRLP4 892
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 892
INDIRI4
CNSTI4 0
EQI4 $1397
line 2524
;2523:			G_ItemUsable(&ent->client->ps, HI_SEEKER,ent) )
;2524:		{
line 2525
;2525:			ItemUse_Seeker(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Seeker
CALLV
pop
line 2526
;2526:			G_AddEvent(ent, EV_USE_ITEM0+HI_SEEKER, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 41
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2527
;2527:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_SEEKER);
ADDRLP4 896
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 896
INDIRP4
ADDRLP4 896
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2528
;2528:		}
line 2529
;2529:		break;
ADDRGP4 $1397
JUMPV
LABELV $1421
line 2531
;2530:	case GENCMD_USE_FIELD:
;2531:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SHIELD)) &&
ADDRLP4 896
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 900
ADDRLP4 896
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 900
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1397
ADDRLP4 900
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 896
INDIRP4
ARGP4
ADDRLP4 904
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 904
INDIRI4
CNSTI4 0
EQI4 $1397
line 2533
;2532:			G_ItemUsable(&ent->client->ps, HI_SHIELD, ent) )
;2533:		{
line 2534
;2534:			ItemUse_Shield(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Shield
CALLV
pop
line 2535
;2535:			G_AddEvent(ent, EV_USE_ITEM0+HI_SHIELD, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 42
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2536
;2536:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_SHIELD);
ADDRLP4 908
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 908
INDIRP4
ADDRLP4 908
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 2537
;2537:		}
line 2538
;2538:		break;
ADDRGP4 $1397
JUMPV
LABELV $1424
line 2540
;2539:	case GENCMD_USE_BACTA:
;2540:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_MEDPAC)) &&
ADDRLP4 908
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 912
ADDRLP4 908
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 912
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1397
ADDRLP4 912
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 908
INDIRP4
ARGP4
ADDRLP4 916
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 916
INDIRI4
CNSTI4 0
EQI4 $1397
line 2542
;2541:			G_ItemUsable(&ent->client->ps, HI_MEDPAC, ent) )
;2542:		{
line 2543
;2543:			ItemUse_MedPack(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_MedPack
CALLV
pop
line 2544
;2544:			G_AddEvent(ent, EV_USE_ITEM0+HI_MEDPAC, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 43
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2545
;2545:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_MEDPAC);
ADDRLP4 920
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 920
INDIRP4
ADDRLP4 920
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 2546
;2546:		}
line 2547
;2547:		break;
ADDRGP4 $1397
JUMPV
LABELV $1427
line 2549
;2548:	case GENCMD_USE_ELECTROBINOCULARS:
;2549:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_BINOCULARS)) &&
ADDRLP4 920
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 924
ADDRLP4 920
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 924
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1397
ADDRLP4 924
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 920
INDIRP4
ARGP4
ADDRLP4 928
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 928
INDIRI4
CNSTI4 0
EQI4 $1397
line 2551
;2550:			G_ItemUsable(&ent->client->ps, HI_BINOCULARS, ent) )
;2551:		{
line 2552
;2552:			ItemUse_Binoculars(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Binoculars
CALLV
pop
line 2553
;2553:			if (ent->client->ps.zoomMode == 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1430
line 2554
;2554:			{
line 2555
;2555:				G_AddEvent(ent, EV_USE_ITEM0+HI_BINOCULARS, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2556
;2556:			}
ADDRGP4 $1397
JUMPV
LABELV $1430
line 2558
;2557:			else
;2558:			{
line 2559
;2559:				G_AddEvent(ent, EV_USE_ITEM0+HI_BINOCULARS, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2560
;2560:			}
line 2561
;2561:		}
line 2562
;2562:		break;
ADDRGP4 $1397
JUMPV
LABELV $1432
line 2564
;2563:	case GENCMD_ZOOM:
;2564:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_BINOCULARS)) &&
ADDRLP4 932
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 936
ADDRLP4 932
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 936
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1397
ADDRLP4 936
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 932
INDIRP4
ARGP4
ADDRLP4 940
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 940
INDIRI4
CNSTI4 0
EQI4 $1397
line 2566
;2565:			G_ItemUsable(&ent->client->ps, HI_BINOCULARS, ent) )
;2566:		{
line 2567
;2567:			ItemUse_Binoculars(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Binoculars
CALLV
pop
line 2568
;2568:			if (ent->client->ps.zoomMode == 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1332
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1435
line 2569
;2569:			{
line 2570
;2570:				G_AddEvent(ent, EV_USE_ITEM0+HI_BINOCULARS, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2571
;2571:			}
ADDRGP4 $1397
JUMPV
LABELV $1435
line 2573
;2572:			else
;2573:			{
line 2574
;2574:				G_AddEvent(ent, EV_USE_ITEM0+HI_BINOCULARS, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2575
;2575:			}
line 2576
;2576:		}
line 2577
;2577:		break;
ADDRGP4 $1397
JUMPV
LABELV $1437
line 2579
;2578:	case GENCMD_USE_SENTRY:
;2579:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SENTRY_GUN)) &&
ADDRLP4 944
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 948
ADDRLP4 944
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 948
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1397
ADDRLP4 948
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 944
INDIRP4
ARGP4
ADDRLP4 952
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 952
INDIRI4
CNSTI4 0
EQI4 $1397
line 2581
;2580:			G_ItemUsable(&ent->client->ps, HI_SENTRY_GUN, ent) )
;2581:		{
line 2582
;2582:			ItemUse_Sentry(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Sentry
CALLV
pop
line 2583
;2583:			G_AddEvent(ent, EV_USE_ITEM0+HI_SENTRY_GUN, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 46
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2584
;2584:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_SENTRY_GUN);
ADDRLP4 956
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 956
INDIRP4
ADDRLP4 956
INDIRP4
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 2585
;2585:		}
line 2586
;2586:		break;
ADDRGP4 $1397
JUMPV
LABELV $1440
line 2588
;2587:	case GENCMD_SABERATTACKCYCLE:
;2588:		Cmd_SaberAttackCycle_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_SaberAttackCycle_f
CALLV
pop
line 2589
;2589:		break;
line 2591
;2590:	default:
;2591:		break;
LABELV $1397
line 2595
;2592:	}
;2593:
;2594:	// save results of pmove
;2595:	if ( ent->client->ps.eventSequence != oldEventSequence ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 600
INDIRI4
EQI4 $1442
line 2596
;2596:		ent->eventTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 588
INDIRI4
ASGNI4
line 2597
;2597:	}
LABELV $1442
line 2598
;2598:	if (g_smoothClients.integer) {
ADDRGP4 g_smoothClients+12
INDIRI4
CNSTI4 0
EQI4 $1444
line 2599
;2599:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
ADDRLP4 884
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 888
ADDRLP4 884
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 888
INDIRP4
ARGP4
ADDRLP4 884
INDIRP4
ARGP4
ADDRLP4 888
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityStateExtraPolate
CALLV
pop
line 2600
;2600:	}
ADDRGP4 $1445
JUMPV
LABELV $1444
line 2601
;2601:	else {
line 2602
;2602:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 884
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 884
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 884
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 2603
;2603:	}
LABELV $1445
line 2604
;2604:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 2606
;2605:
;2606:	if ( !( ent->client->ps.eFlags & EF_FIRING ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $1447
line 2607
;2607:		client->fireHeld = qfalse;		// for grapple
ADDRLP4 4
INDIRP4
CNSTI4 43720
ADDP4
CNSTI4 0
ASGNI4
line 2608
;2608:	}
LABELV $1447
line 2611
;2609:
;2610:	// use the snapped origin for linking so it matches client predicted versions
;2611:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 884
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 884
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 884
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 2613
;2612:
;2613:	VectorCopy (pm.mins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 8+220
INDIRB
ASGNB 12
line 2614
;2614:	VectorCopy (pm.maxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 8+232
INDIRB
ASGNB 12
line 2616
;2615:
;2616:	ent->waterlevel = pm.waterlevel;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 8+248
INDIRI4
ASGNI4
line 2617
;2617:	ent->watertype = pm.watertype;
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 8+244
INDIRI4
ASGNI4
line 2620
;2618:
;2619:	// execute client events
;2620:	ClientEvents( ent, oldEventSequence );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 600
INDIRI4
ARGI4
ADDRGP4 ClientEvents
CALLV
pop
line 2622
;2621:
;2622:	if ( pm.useEvent )
ADDRLP4 8+216
INDIRI4
CNSTI4 0
EQI4 $1453
line 2623
;2623:	{
line 2626
;2624:		//TODO: Use
;2625://		TryUse( ent );
;2626:	}
LABELV $1453
line 2629
;2627:
;2628:	// link entity now, after any personal teleporters have been used
;2629:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2630
;2630:	if ( !ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43600
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1456
line 2631
;2631:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 2632
;2632:	}
LABELV $1456
line 2635
;2633:
;2634:	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
;2635:	VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 888
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 888
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 888
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2641
;2636:
;2637:	//test for solid areas in the AAS file
;2638://	BotTestAAS(ent->r.currentOrigin);
;2639:
;2640:	// touch other objects
;2641:	ClientImpacts( ent, &pm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 ClientImpacts
CALLV
pop
line 2644
;2642:
;2643:	// save results of triggers and client events
;2644:	if (ent->client->ps.eventSequence != oldEventSequence) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 600
INDIRI4
EQI4 $1458
line 2645
;2645:		ent->eventTime = nowTime;
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 588
INDIRI4
ASGNI4
line 2646
;2646:	}
LABELV $1458
line 2649
;2647:
;2648:	// swap and latch button actions
;2649:	client->oldbuttons = client->buttons;
ADDRLP4 4
INDIRP4
CNSTI4 43612
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 43608
ADDP4
INDIRI4
ASGNI4
line 2650
;2650:	client->buttons = ucmd->buttons;
ADDRLP4 4
INDIRP4
CNSTI4 43608
ADDP4
ADDRLP4 592
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 2651
;2651:	client->latched_buttons |= client->buttons & ~client->oldbuttons;
ADDRLP4 900
ADDRLP4 4
INDIRP4
CNSTI4 43616
ADDP4
ASGNP4
ADDRLP4 900
INDIRP4
ADDRLP4 900
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 43608
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 43612
ADDP4
INDIRI4
BCOMI4
BANDI4
BORI4
ASGNI4
line 2654
;2652:
;2653:	// Did we kick someone in our pmove sequence?
;2654:	if (client->ps.forceKickFlip && !client->sess.raceMode)
ADDRLP4 908
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
ADDRLP4 908
INDIRI4
EQI4 $1460
ADDRLP4 4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 908
INDIRI4
NEI4 $1460
line 2655
;2655:	{
line 2656
;2656:		gentity_t *faceKicked = &g_entities[client->ps.forceKickFlip-1];
ADDRLP4 912
CNSTI4 2352
ADDRLP4 4
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities-2352
ADDP4
ASGNP4
line 2658
;2657:
;2658:		if (faceKicked && faceKicked->client && (!OnSameTeam(ent, faceKicked) || g_friendlyFire.integer) &&
ADDRLP4 920
CNSTU4 0
ASGNU4
ADDRLP4 912
INDIRP4
CVPU4 4
ADDRLP4 920
INDIRU4
EQU4 $1463
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 920
INDIRU4
EQU4 $1463
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 912
INDIRP4
ARGP4
ADDRLP4 924
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 928
CNSTI4 0
ASGNI4
ADDRLP4 924
INDIRI4
ADDRLP4 928
INDIRI4
EQI4 $1466
ADDRGP4 g_friendlyFire+12
INDIRI4
ADDRLP4 928
INDIRI4
EQI4 $1463
LABELV $1466
ADDRLP4 932
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 932
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1467
ADDRLP4 932
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $1463
LABELV $1467
ADDRLP4 936
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 936
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1468
ADDRLP4 936
INDIRP4
CNSTI4 1296
ADDP4
INDIRI4
ADDRLP4 912
INDIRP4
INDIRI4
NEI4 $1463
LABELV $1468
line 2661
;2659:			(!faceKicked->client->ps.duelInProgress || faceKicked->client->ps.duelIndex == ent->s.number) &&
;2660:			(!ent->client->ps.duelInProgress || ent->client->ps.duelIndex == faceKicked->s.number))
;2661:		{
line 2662
;2662:			if ( faceKicked && faceKicked->client && faceKicked->health && faceKicked->takedamage && !faceKicked->client->sess.raceMode && !faceKicked->client->noclip)
ADDRLP4 944
CNSTU4 0
ASGNU4
ADDRLP4 912
INDIRP4
CVPU4 4
ADDRLP4 944
INDIRU4
EQU4 $1469
ADDRLP4 948
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 948
INDIRP4
CVPU4 4
ADDRLP4 944
INDIRU4
EQU4 $1469
ADDRLP4 952
CNSTI4 0
ASGNI4
ADDRLP4 912
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 952
INDIRI4
EQI4 $1469
ADDRLP4 912
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 952
INDIRI4
EQI4 $1469
ADDRLP4 948
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 952
INDIRI4
NEI4 $1469
ADDRLP4 948
INDIRP4
CNSTI4 43600
ADDP4
INDIRI4
ADDRLP4 952
INDIRI4
NEI4 $1469
line 2663
;2663:			{//push them away and do pain
line 2665
;2664:				vec3_t oppDir;
;2665:				int strength = (int)VectorNormalize2( client->ps.velocity, oppDir );
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 960
ARGP4
ADDRLP4 972
ADDRGP4 VectorNormalize2
CALLF4
ASGNF4
ADDRLP4 956
ADDRLP4 972
INDIRF4
CVFI4 4
ASGNI4
line 2667
;2666:
;2667:				strength *= 0.05;
ADDRLP4 956
CNSTF4 1028443341
ADDRLP4 956
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 2669
;2668:
;2669:				VectorScale( oppDir, -1, oppDir );
ADDRLP4 976
CNSTF4 3212836864
ASGNF4
ADDRLP4 960
ADDRLP4 976
INDIRF4
ADDRLP4 960
INDIRF4
MULF4
ASGNF4
ADDRLP4 960+4
ADDRLP4 976
INDIRF4
ADDRLP4 960+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 960+8
CNSTF4 3212836864
ADDRLP4 960+8
INDIRF4
MULF4
ASGNF4
line 2671
;2670:
;2671:				G_Damage( faceKicked, ent, ent, oppDir, client->ps.origin, strength, DAMAGE_NO_ARMOR, MOD_MELEE );
ADDRLP4 912
INDIRP4
ARGP4
ADDRLP4 980
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 980
INDIRP4
ARGP4
ADDRLP4 980
INDIRP4
ARGP4
ADDRLP4 960
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 956
INDIRI4
ARGI4
ADDRLP4 984
CNSTI4 2
ASGNI4
ADDRLP4 984
INDIRI4
ARGI4
ADDRLP4 984
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 2673
;2672:
;2673:				if ( (faceKicked->client->ps.weapon != WP_SABER ||
ADDRLP4 988
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 988
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1477
ADDRLP4 988
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1477
ADDRLP4 988
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 992
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 992
INDIRI4
CNSTI4 0
NEI4 $1480
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 996
ADDRGP4 PM_SaberInStart
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
NEI4 $1480
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1000
ADDRGP4 PM_SaberInReturn
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 0
NEI4 $1480
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 1004
ADDRGP4 PM_SaberInTransition
CALLI4
ASGNI4
ADDRLP4 1004
INDIRI4
CNSTI4 0
EQI4 $1477
LABELV $1480
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $1475
LABELV $1477
line 2677
;2674:					 faceKicked->client->ps.fd.saberAnimLevel < FORCE_LEVEL_3 ||
;2675:					 (!BG_SaberInAttack(faceKicked->client->ps.saberMove) && !PM_SaberInStart(faceKicked->client->ps.saberMove) && !PM_SaberInReturn(faceKicked->client->ps.saberMove) && !PM_SaberInTransition(faceKicked->client->ps.saberMove)))
;2676:					 || jk2gameplay == VERSION_1_02 )
;2677:				{
line 2678
;2678:					if (faceKicked->health > 0 &&
ADDRLP4 1012
CNSTI4 0
ASGNI4
ADDRLP4 912
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 1012
INDIRI4
LEI4 $1481
ADDRLP4 1016
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1016
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 1012
INDIRI4
LEI4 $1481
ADDRLP4 1016
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
CNSTI4 8
EQI4 $1481
line 2681
;2679:						faceKicked->client->ps.stats[STAT_HEALTH] > 0 &&
;2680:						faceKicked->client->ps.forceHandExtend != HANDEXTEND_KNOCKDOWN)
;2681:					{
line 2682
;2682:						if (Q_irand(1, 10, faceKicked->client->sess.raceMode,5) <= 3)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 1020
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1020
INDIRI4
CNSTI4 3
GTI4 $1483
line 2683
;2683:						{ //only actually knock over sometimes, but always do velocity hit
line 2684
;2684:							faceKicked->client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 8
ASGNI4
line 2685
;2685:							faceKicked->client->ps.forceHandExtendTime = LEVELTIME(faceKicked->client) + 1100;
ADDRLP4 1032
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1489
ADDRLP4 1032
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1489
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1491
ADDRLP4 1028
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1492
JUMPV
LABELV $1491
ADDRLP4 1028
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1492
ADDRLP4 1024
ADDRLP4 1028
INDIRI4
ASGNI4
ADDRGP4 $1490
JUMPV
LABELV $1489
ADDRLP4 1024
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1490
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1252
ADDP4
ADDRLP4 1024
INDIRI4
CNSTI4 1100
ADDI4
ASGNI4
line 2686
;2686:							faceKicked->client->ps.forceDodgeAnim = 0; //this toggles between 1 and 0, when it's 1 we should play the get up anim
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 0
ASGNI4
line 2687
;2687:						}
LABELV $1483
line 2689
;2688:
;2689:						faceKicked->client->ps.otherKiller = ent->s.number;
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 760
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 2690
;2690:						faceKicked->client->ps.otherKillerTime = LEVELTIME(faceKicked->client) + 5000;
ADDRLP4 1032
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1497
ADDRLP4 1032
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1497
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1499
ADDRLP4 1028
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1500
JUMPV
LABELV $1499
ADDRLP4 1028
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1500
ADDRLP4 1024
ADDRLP4 1028
INDIRI4
ASGNI4
ADDRGP4 $1498
JUMPV
LABELV $1497
ADDRLP4 1024
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1498
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 764
ADDP4
ADDRLP4 1024
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 2691
;2691:						faceKicked->client->ps.otherKillerDebounceTime = LEVELTIME(faceKicked->client) + 100;
ADDRLP4 1044
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1044
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1505
ADDRLP4 1044
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1505
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1507
ADDRLP4 1040
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1508
JUMPV
LABELV $1507
ADDRLP4 1040
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1508
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
ADDRGP4 $1506
JUMPV
LABELV $1505
ADDRLP4 1036
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1506
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 1036
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2693
;2692:
;2693:						faceKicked->client->ps.velocity[0] = oppDir[0]*(strength*40);
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 960
INDIRF4
CNSTI4 40
ADDRLP4 956
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 2694
;2694:						faceKicked->client->ps.velocity[1] = oppDir[1]*(strength*40);
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 960+4
INDIRF4
CNSTI4 40
ADDRLP4 956
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 2695
;2695:						faceKicked->client->ps.velocity[2] = 200;
ADDRLP4 912
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1128792064
ASGNF4
line 2696
;2696:					}
LABELV $1481
line 2697
;2697:				}
LABELV $1475
line 2699
;2698:
;2699:				G_Sound( faceKicked, CHAN_AUTO, G_SoundIndex( va("sound/weapons/melee/punch%d", Q_irand(1, 4,qfalse,2)) ) );
CNSTI4 1
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 1008
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $1510
ARGP4
ADDRLP4 1008
INDIRI4
ARGI4
ADDRLP4 1012
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1012
INDIRP4
ARGP4
ADDRLP4 1016
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 912
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1016
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 2700
;2700:			}
LABELV $1469
line 2701
;2701:		}
LABELV $1463
line 2703
;2702:
;2703:		client->ps.forceKickFlip = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1292
ADDP4
CNSTI4 0
ASGNI4
line 2704
;2704:	}
LABELV $1460
line 2707
;2705:
;2706:	// check for respawning
;2707:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1511
line 2708
;2708:		if (client->sess.raceMode) { // respawn immediately in racemode
ADDRLP4 4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1513
line 2709
;2709:			respawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 2710
;2710:			return;
ADDRGP4 $1010
JUMPV
LABELV $1513
line 2714
;2711:		}
;2712:
;2713:		// wait for the attack button to be pressed
;2714:		if (nowTime > client->respawnTime && !gDoSlowMoDuel ) {
ADDRLP4 588
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 43684
ADDP4
INDIRI4
LEI4 $1515
ADDRGP4 gDoSlowMoDuel
INDIRI4
CNSTI4 0
NEI4 $1515
line 2716
;2715:			// forcerespawn is to prevent users from waiting out powerups
;2716:			if ( g_forcerespawn.integer > 0 && 
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 0
LEI4 $1517
ADDRLP4 588
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 43684
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_forcerespawn+12
INDIRI4
MULI4
LEI4 $1517
line 2717
;2717:				(nowTime - client->respawnTime ) > g_forcerespawn.integer * 1000 ) {
line 2718
;2718:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 2719
;2719:				return;
ADDRGP4 $1010
JUMPV
LABELV $1517
line 2723
;2720:			}
;2721:		
;2722:			// pressing attack or use is the normal respawn method
;2723:			if ( ucmd->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) ) {
ADDRLP4 592
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
EQI4 $1010
line 2724
;2724:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 2725
;2725:			}
line 2726
;2726:		}
ADDRGP4 $1010
JUMPV
LABELV $1515
line 2727
;2727:		else if (gDoSlowMoDuel)
ADDRGP4 gDoSlowMoDuel
INDIRI4
CNSTI4 0
EQI4 $1010
line 2728
;2728:		{
line 2729
;2729:			client->respawnTime = nowTime + 1000;
ADDRLP4 4
INDIRP4
CNSTI4 43684
ADDP4
ADDRLP4 588
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2730
;2730:		}
line 2731
;2731:		return;
ADDRGP4 $1010
JUMPV
LABELV $1511
line 2735
;2732:	}
;2733:
;2734:	// perform once-a-second actions
;2735:	ClientTimerActions( ent, msec );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 596
INDIRI4
ARGI4
ADDRGP4 ClientTimerActions
CALLV
pop
line 2737
;2736:
;2737:	G_UpdateClientBroadcasts ( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UpdateClientBroadcasts
CALLV
pop
line 2741
;2738:
;2739:
;2740:
;2741:	if (ent->client->sess.sessionTeam != TEAM_SPECTATOR) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1525
line 2742
;2742:		ClientEndFrameInClientThink(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrameInClientThink
CALLV
pop
line 2743
;2743:	}
LABELV $1525
line 2744
;2744:}
LABELV $1010
endproc ClientThink_real 1048 32
export G_CheckClientTimeouts
proc G_CheckClientTimeouts 32 12
line 2754
;2745:
;2746:/*
;2747:==================
;2748:G_CheckClientTimeouts
;2749:
;2750:Checks whether a client has exceded any timeouts and act accordingly
;2751:==================
;2752:*/
;2753:void G_CheckClientTimeouts ( gentity_t *ent )
;2754:{
line 2757
;2755:	qboolean isReplaying;
;2756:	// Only timeout supported right now is the timeout to spectator mode
;2757:	if ( g_timeouttospec.integer <= 0 ) // one may accidentally set 9999999999999 and cause overflow and that would lead to unintended consequences
ADDRGP4 g_timeouttospec+12
INDIRI4
CNSTI4 0
GTI4 $1528
line 2758
;2758:	{
line 2759
;2759:		return;
ADDRGP4 $1527
JUMPV
LABELV $1528
line 2763
;2760:	}
;2761:
;2762:	// Already a spectator, no need to boot them to spectator
;2763:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1531
line 2764
;2764:	{
line 2765
;2765:		return;
ADDRGP4 $1527
JUMPV
LABELV $1531
line 2768
;2766:	}
;2767:
;2768:	isReplaying = ent->client->sess.raceMode && (ent->client->sess.raceStyle.runFlags & RFL_SEGMENTED) && ent->client->pers.segmented.state == SEG_REPLAY;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1534
ADDRLP4 8
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 32
BANDI4
ADDRLP4 12
INDIRI4
EQI4 $1534
ADDRLP4 8
INDIRP4
CNSTI4 22084
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1534
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $1535
JUMPV
LABELV $1534
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1535
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2770
;2769:
;2770:	if ((isReplaying || ent->client->pers.recordingDemo && ent->client->pers.keepDemoMaybe && !ent->client->pers.raceStartCommandTime)) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $1538
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 43088
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1536
ADDRLP4 20
INDIRP4
CNSTI4 43092
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1536
ADDRLP4 20
INDIRP4
CNSTI4 22064
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $1536
LABELV $1538
line 2771
;2771:		return; // dont send zombies to spec until dmeo is finished
ADDRGP4 $1527
JUMPV
LABELV $1536
line 2776
;2772:	}
;2773:
;2774:	// See how long its been since a command was received by the client and if its 
;2775:	// longer than the timeout to spectator then force this client into spectator mode
;2776:	if ( level.time - ent->client->pers.cmd.serverTime > clampedIntMult(g_timeouttospec.integer ,1000) )
ADDRGP4 g_timeouttospec+12
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 24
ADDRGP4 clampedIntMult
CALLI4
ASGNI4
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
SUBI4
ADDRLP4 24
INDIRI4
LEI4 $1539
line 2777
;2777:	{
line 2778
;2778:		G_Printf("^3g_timeouttospec: Sending client %d to spec. %d time delta.\n",ent-g_entities, level.time - ent->client->pers.cmd.serverTime);
ADDRGP4 $1543
ARGP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
SUBI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 2779
;2779:		SetTeam ( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1545
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 2780
;2780:	}
LABELV $1539
line 2781
;2781:}
LABELV $1527
endproc G_CheckClientTimeouts 32 12
export G_ResetUserCmdStore
proc G_ResetUserCmdStore 8 0
line 2783
;2782:
;2783:void G_ResetUserCmdStore(int clientNum) {
line 2784
;2784:	userCmdBuffer[clientNum].nextBufferIndex = userCmdBuffer[clientNum].nextToExecute = userCmdBuffer[clientNum].msecThisFrame = 0;
ADDRLP4 0
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 userCmdBuffer+28680
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 userCmdBuffer+28676
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 userCmdBuffer+28672
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 2785
;2785:}
LABELV $1546
endproc G_ResetUserCmdStore 8 0
export G_GetUserCmd
proc G_GetUserCmd 148 36
line 2788
;2786:
;2787:// we implement a buffering here to smooth out demos if ppl have extreme lag (causing a LOT of packets to get executed at once)
;2788:qboolean G_GetUserCmd(int clientNum, usercmd_t* ucmd, getUserCmdType_t advance) {
line 2789
;2789:	usercmd_t* newCmd = &userCmdBuffer[clientNum].buf[userCmdBuffer[clientNum].nextBufferIndex % USERCMD_BUFFER_MAX];
ADDRLP4 32
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
CNSTI4 28
ADDRLP4 32
INDIRI4
ADDRGP4 userCmdBuffer+28672
ADDP4
INDIRI4
CNSTI4 1024
MODI4
MULI4
ADDRLP4 32
INDIRI4
ADDRGP4 userCmdBuffer
ADDP4
ADDP4
ASGNP4
line 2790
;2790:	usercmd_t* oldCmd = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 2791
;2791:	gentity_t* userEnt = clientNum >= 0 && clientNum < MAX_CLIENTS?  g_entities + clientNum : NULL;
ADDRLP4 40
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
LTI4 $1553
ADDRLP4 40
INDIRI4
CNSTI4 32
GEI4 $1553
ADDRLP4 36
CNSTI4 2352
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $1554
JUMPV
LABELV $1553
ADDRLP4 36
CNSTP4 0
ASGNP4
LABELV $1554
ADDRLP4 12
ADDRLP4 36
INDIRP4
ASGNP4
line 2792
;2792:	qboolean superSmooth = g_userCmdBufferSmoothen.integer > 1 || g_userCmdBufferSmoothen.integer == 1 && userEnt && userEnt->client && userEnt->client->sess.raceMode; // reduces how much client can advance per frame and also keeps a 3-4 frame buffer to smooth out clients with low maxpackets. think of it a bit similar to double/triple buffering on GPUS. Bit of delay but smoother. TODO make it buffer only up to 50ms in this case? TODO dynamically adjust the amount of buffering up if someone is lagging a LOT?
ADDRLP4 48
CNSTI4 1
ASGNI4
ADDRGP4 g_userCmdBufferSmoothen+12
INDIRI4
ADDRLP4 48
INDIRI4
GTI4 $1560
ADDRGP4 g_userCmdBufferSmoothen+12
INDIRI4
ADDRLP4 48
INDIRI4
NEI4 $1558
ADDRLP4 56
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 56
INDIRU4
EQU4 $1558
ADDRLP4 60
ADDRLP4 12
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
EQU4 $1558
ADDRLP4 60
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1558
LABELV $1560
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRGP4 $1559
JUMPV
LABELV $1558
ADDRLP4 44
CNSTI4 0
ASGNI4
LABELV $1559
ADDRLP4 20
ADDRLP4 44
INDIRI4
ASGNI4
line 2793
;2793:	int baseFrameAdvanceMultiplier = superSmooth ? 2 : 5;
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1562
ADDRLP4 64
CNSTI4 2
ASGNI4
ADDRGP4 $1563
JUMPV
LABELV $1562
ADDRLP4 64
CNSTI4 5
ASGNI4
LABELV $1563
ADDRLP4 16
ADDRLP4 64
INDIRI4
ASGNI4
line 2794
;2794:	int maxFrameAdvance = level.frameTimeMsec ? ((level.frameTimeMsec* baseFrameAdvanceMultiplier) > USERCMD_BUFFER_MAX_FRAMEADVANCE_MAX ? MAX(level.frameTimeMsec*2, USERCMD_BUFFER_MAX_FRAMEADVANCE_MAX) : (level.frameTimeMsec * baseFrameAdvanceMultiplier)) : INT_MAX;
ADDRGP4 level+44
INDIRI4
CNSTI4 0
EQI4 $1572
ADDRGP4 level+44
INDIRI4
ADDRLP4 16
INDIRI4
MULI4
CNSTI4 100
LEI4 $1574
ADDRGP4 level+44
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 100
LEI4 $1576
ADDRLP4 76
ADDRGP4 level+44
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
ADDRGP4 $1577
JUMPV
LABELV $1576
ADDRLP4 76
CNSTI4 100
ASGNI4
LABELV $1577
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
ADDRGP4 $1575
JUMPV
LABELV $1574
ADDRLP4 72
ADDRGP4 level+44
INDIRI4
ADDRLP4 16
INDIRI4
MULI4
ASGNI4
LABELV $1575
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
ADDRGP4 $1573
JUMPV
LABELV $1572
ADDRLP4 68
CNSTI4 2147483647
ASGNI4
LABELV $1573
ADDRLP4 28
ADDRLP4 68
INDIRI4
ASGNI4
line 2795
;2795:	qboolean didAdvance = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2798
;2796:	int currentServerTime;
;2797:
;2798:	if (!g_userCmdBuffer.integer && userCmdBuffer[clientNum].nextBufferIndex <= 1) {
ADDRGP4 g_userCmdBuffer+12
INDIRI4
CNSTI4 0
NEI4 $1578
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 userCmdBuffer+28672
ADDP4
INDIRI4
CNSTI4 1
GTI4 $1578
line 2799
;2799:		trap_GetUsercmd(clientNum, ucmd);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 2800
;2800:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1550
JUMPV
LABELV $1578
line 2803
;2801:	}
;2802:
;2803:	if (userCmdBuffer[clientNum].nextBufferIndex > 0) {
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 userCmdBuffer+28672
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1582
line 2804
;2804:		oldCmd = &userCmdBuffer[clientNum].buf[(userCmdBuffer[clientNum].nextBufferIndex - 1) % USERCMD_BUFFER_MAX];
ADDRLP4 80
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 28
ADDRLP4 80
INDIRI4
ADDRGP4 userCmdBuffer+28672
ADDP4
INDIRI4
CNSTI4 1
SUBI4
CNSTI4 1024
MODI4
MULI4
ADDRLP4 80
INDIRI4
ADDRGP4 userCmdBuffer
ADDP4
ADDP4
ASGNP4
line 2805
;2805:	}
ADDRGP4 $1583
JUMPV
LABELV $1582
line 2806
;2806:	else {
line 2807
;2807:		didAdvance = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2808
;2808:	}
LABELV $1583
line 2811
;2809:
;2810:	// first check if there's a new cmd available so we don't lose it
;2811:	trap_GetUsercmd(clientNum, newCmd);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 2812
;2812:	if (!oldCmd || newCmd->serverTime != oldCmd->serverTime) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1588
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
EQI4 $1586
LABELV $1588
line 2814
;2813:		// they are different -> it's a new one. save it.
;2814:		userCmdBuffer[clientNum].nextBufferIndex++;
ADDRLP4 84
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 userCmdBuffer+28672
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2815
;2815:	}
LABELV $1586
line 2817
;2816:
;2817:	currentServerTime = newCmd->serverTime;
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 2820
;2818:
;2819:
;2820:	if ((userCmdBuffer[clientNum].nextBufferIndex - userCmdBuffer[clientNum].nextToExecute) > USERCMD_BUFFER_MAX) {
ADDRLP4 84
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 84
INDIRI4
ADDRGP4 userCmdBuffer+28672
ADDP4
INDIRI4
ADDRLP4 84
INDIRI4
ADDRGP4 userCmdBuffer+28676
ADDP4
INDIRI4
SUBI4
CNSTI4 1024
LEI4 $1590
line 2822
;2821:		// overflowed
;2822:		G_SendServerCommand(clientNum, "print \"^1Server usercmd buffer overflowed. Very bad internet?\n\"", qtrue);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $1594
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 2823
;2823:		G_Printf("^1Usercmd buffer overflowed for client %d.\n", clientNum);
ADDRGP4 $1595
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 2824
;2824:		userCmdBuffer[clientNum].nextToExecute = userCmdBuffer[clientNum].nextBufferIndex - USERCMD_BUFFER_MAX;
ADDRLP4 88
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 88
INDIRI4
ADDRGP4 userCmdBuffer+28676
ADDP4
ADDRLP4 88
INDIRI4
ADDRGP4 userCmdBuffer+28672
ADDP4
INDIRI4
CNSTI4 1024
SUBI4
ASGNI4
line 2825
;2825:		didAdvance = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2826
;2826:	}
LABELV $1590
line 2830
;2827:
;2828:
;2829:	// check if we want to & can advance
;2830:	if (!didAdvance && advance && userCmdBuffer[clientNum].nextToExecute < (userCmdBuffer[clientNum].nextBufferIndex-1)) {
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $1598
ADDRFP4 8
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $1598
ADDRLP4 92
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 92
INDIRI4
ADDRGP4 userCmdBuffer+28676
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
ADDRGP4 userCmdBuffer+28672
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $1598
line 2833
;2831:		int nextMsec;
;2832:		qboolean superSmoothAllows;
;2833:		oldCmd = &userCmdBuffer[clientNum].buf[(userCmdBuffer[clientNum].nextToExecute) % USERCMD_BUFFER_MAX]; // we just keep reusing these pointers like dirty animals :)
ADDRLP4 104
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 28
ADDRLP4 104
INDIRI4
ADDRGP4 userCmdBuffer+28676
ADDP4
INDIRI4
CNSTI4 1024
MODI4
MULI4
ADDRLP4 104
INDIRI4
ADDRGP4 userCmdBuffer
ADDP4
ADDP4
ASGNP4
line 2834
;2834:		newCmd = &userCmdBuffer[clientNum].buf[(userCmdBuffer[clientNum].nextToExecute+1) % USERCMD_BUFFER_MAX];
ADDRLP4 108
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
CNSTI4 28
ADDRLP4 108
INDIRI4
ADDRGP4 userCmdBuffer+28676
ADDP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 1024
MODI4
MULI4
ADDRLP4 108
INDIRI4
ADDRGP4 userCmdBuffer
ADDP4
ADDP4
ASGNP4
line 2835
;2835:		nextMsec = newCmd->serverTime - oldCmd->serverTime;
ADDRLP4 96
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 2836
;2836:		superSmoothAllows = !superSmooth || (userCmdBuffer[clientNum].nextBufferIndex - userCmdBuffer[clientNum].nextToExecute) > 4; // in super smooth mode, always keep 4 packets on the back burner.
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $1609
ADDRLP4 116
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 116
INDIRI4
ADDRGP4 userCmdBuffer+28672
ADDP4
INDIRI4
ADDRLP4 116
INDIRI4
ADDRGP4 userCmdBuffer+28676
ADDP4
INDIRI4
SUBI4
CNSTI4 4
LEI4 $1607
LABELV $1609
ADDRLP4 112
CNSTI4 1
ASGNI4
ADDRGP4 $1608
JUMPV
LABELV $1607
ADDRLP4 112
CNSTI4 0
ASGNI4
LABELV $1608
ADDRLP4 100
ADDRLP4 112
INDIRI4
ASGNI4
line 2837
;2837:		if (nextMsec <= 0 // something weird is happening. best not to interfere, just go
ADDRLP4 120
ADDRLP4 96
INDIRI4
ASGNI4
ADDRLP4 124
CNSTI4 0
ASGNI4
ADDRLP4 120
INDIRI4
ADDRLP4 124
INDIRI4
LEI4 $1622
ADDRLP4 128
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 128
INDIRI4
ADDRGP4 userCmdBuffer+28680
ADDP4
INDIRI4
ADDRLP4 124
INDIRI4
EQI4 $1622
ADDRLP4 128
INDIRI4
ADDRGP4 userCmdBuffer+28680
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
ADDI4
ADDRLP4 28
INDIRI4
GEI4 $1620
ADDRLP4 100
INDIRI4
ADDRLP4 124
INDIRI4
NEI4 $1622
LABELV $1620
ADDRLP4 24
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
SUBI4
CNSTI4 800
GTI4 $1622
ADDRLP4 132
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 132
INDIRI4
ADDRGP4 userCmdBuffer+28672
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
ADDRGP4 userCmdBuffer+28676
ADDP4
INDIRI4
SUBI4
CNSTI4 896
GTI4 $1622
ADDRGP4 g_userCmdBuffer+12
INDIRI4
CNSTI4 0
NEI4 $1610
LABELV $1622
line 2843
;2838:			|| !userCmdBuffer[clientNum].msecThisFrame // no cmds have been executed this frame yet, just go
;2839:			|| (userCmdBuffer[clientNum].msecThisFrame + nextMsec) < maxFrameAdvance && superSmoothAllows // we still have some room to squeeze it in this frame, go.
;2840:			|| (currentServerTime- oldCmd->serverTime) > USERCMD_BUFFER_MAX_DELAY // delay is too big, just go
;2841:			|| (userCmdBuffer[clientNum].nextBufferIndex - userCmdBuffer[clientNum].nextToExecute) > USERCMD_BUFFER_MAX_BLOCKING // let's keep ~10% as buffer so we never overflow. just go.
;2842:			|| !g_userCmdBuffer.integer
;2843:			) {
line 2844
;2844:			userCmdBuffer[clientNum].nextToExecute++;
ADDRLP4 136
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 userCmdBuffer+28676
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2845
;2845:			userCmdBuffer[clientNum].msecThisFrame += nextMsec;
ADDRLP4 140
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 userCmdBuffer+28680
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
ADDRLP4 96
INDIRI4
ADDI4
ASGNI4
line 2846
;2846:			didAdvance = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2847
;2847:		}
ADDRGP4 $1611
JUMPV
LABELV $1610
line 2848
;2848:		else {
line 2849
;2849:			if (g_developer.integer > 10) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 10
LEI4 $1625
line 2850
;2850:				G_Printf("^1frame advance delayed (%s) for client %d; level.time %d, msecThisFrame %d, nextMsec %d, delay %d, buffer size %d, nextToExecute %d\n", advance == GETUSERCMD_ADVANCERUNCLIENT ? "RunClient" : "ClientThink", clientNum, level.time, userCmdBuffer[clientNum].msecThisFrame, nextMsec, (currentServerTime - oldCmd->serverTime), userCmdBuffer[clientNum].nextBufferIndex - userCmdBuffer[clientNum].nextToExecute, userCmdBuffer[clientNum].nextToExecute);
ADDRGP4 $1628
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $1637
ADDRLP4 136
ADDRGP4 $1629
ASGNP4
ADDRGP4 $1638
JUMPV
LABELV $1637
ADDRLP4 136
ADDRGP4 $1630
ASGNP4
LABELV $1638
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 140
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 144
CNSTI4 28684
ADDRLP4 140
INDIRI4
MULI4
ASGNI4
ADDRLP4 144
INDIRI4
ADDRGP4 userCmdBuffer+28680
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
SUBI4
ARGI4
ADDRLP4 144
INDIRI4
ADDRGP4 userCmdBuffer+28672
ADDP4
INDIRI4
ADDRLP4 144
INDIRI4
ADDRGP4 userCmdBuffer+28676
ADDP4
INDIRI4
SUBI4
ARGI4
ADDRLP4 144
INDIRI4
ADDRGP4 userCmdBuffer+28676
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 2851
;2851:			}
LABELV $1625
line 2852
;2852:		}
LABELV $1611
line 2853
;2853:	}
LABELV $1598
line 2856
;2854:
;2855:
;2856:	newCmd = &userCmdBuffer[clientNum].buf[userCmdBuffer[clientNum].nextToExecute % USERCMD_BUFFER_MAX]; // whatever, just reuse the pointer for this;
ADDRLP4 96
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
CNSTI4 28
ADDRLP4 96
INDIRI4
ADDRGP4 userCmdBuffer+28676
ADDP4
INDIRI4
CNSTI4 1024
MODI4
MULI4
ADDRLP4 96
INDIRI4
ADDRGP4 userCmdBuffer
ADDP4
ADDP4
ASGNP4
line 2858
;2857:
;2858:	if (didAdvance || !advance) { // if we wanted to advance, but didn't, act like nothing happened.
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $1642
ADDRFP4 8
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $1640
LABELV $1642
line 2859
;2859:		*ucmd = *newCmd;
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 28
line 2860
;2860:	}
LABELV $1640
line 2862
;2861:
;2862:	if (userCmdBuffer[clientNum].nextToExecute && userCmdBuffer[clientNum].nextToExecute == (userCmdBuffer[clientNum].nextBufferIndex - 1)) {
ADDRLP4 104
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 104
INDIRI4
ADDRGP4 userCmdBuffer+28676
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1643
ADDRLP4 104
INDIRI4
ADDRGP4 userCmdBuffer+28676
ADDP4
INDIRI4
ADDRLP4 104
INDIRI4
ADDRGP4 userCmdBuffer+28672
ADDP4
INDIRI4
CNSTI4 1
SUBI4
NEI4 $1643
line 2868
;2863:		// ok we got nothing buffered rn, reset everything a bit.
;2864:		//if (g_developer.integer > 2) {
;2865:		//	G_Printf("^2resetting command buffer for client %d\n", clientNum);
;2866:		//}
;2867:		// is this needed?
;2868:		if (userCmdBuffer[clientNum].nextToExecute % USERCMD_BUFFER_MAX) {
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 userCmdBuffer+28676
ADDP4
INDIRI4
CNSTI4 1024
MODI4
CNSTI4 0
EQI4 $1648
line 2869
;2869:			userCmdBuffer[clientNum].buf[0] = *newCmd;
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 userCmdBuffer
ADDP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 28
line 2870
;2870:		}
LABELV $1648
line 2871
;2871:		userCmdBuffer[clientNum].nextToExecute = 0;
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 userCmdBuffer+28676
ADDP4
CNSTI4 0
ASGNI4
line 2872
;2872:		userCmdBuffer[clientNum].nextBufferIndex = 1;
CNSTI4 28684
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 userCmdBuffer+28672
ADDP4
CNSTI4 1
ASGNI4
line 2873
;2873:	}
LABELV $1643
line 2875
;2874:
;2875:	return didAdvance;
ADDRLP4 4
INDIRI4
RETI4
LABELV $1550
endproc G_GetUserCmd 148 36
export ClientThink
proc ClientThink 68 40
line 2885
;2876:}
;2877:
;2878:/*
;2879:==================
;2880:ClientThink
;2881:
;2882:A new command has arrived from the client
;2883:==================
;2884:*/
;2885:void ClientThink( int clientNum ) {
line 2886
;2886:	gentity_t *ent = g_entities + clientNum;
ADDRLP4 0
CNSTI4 2352
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2888
;2887:	usercmd_t tmpCmdForAfkCheck; // only used for checking if player is active or afk, rest is handled via G_GetUserCmd
;2888:	qboolean segmentedReplay = DF_ClientInSegmentedRunMode(ent->client) && ent->client->pers.segmented.state == SEG_REPLAY;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 DF_ClientInSegmentedRunMode
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $1655
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 22084
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1655
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $1656
JUMPV
LABELV $1655
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $1656
ADDRLP4 32
ADDRLP4 36
INDIRI4
ASGNI4
line 2890
;2889:
;2890:	trap_GetUsercmd(clientNum, &tmpCmdForAfkCheck);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 2892
;2891:	//if (tmpCmdForAfkCheck.forwardmove || tmpCmdForAfkCheck.rightmove || tmpCmdForAfkCheck.upmove || (tmpCmdForAfkCheck.buttons & (BUTTON_ATTACK | BUTTON_ALT_ATTACK)) || ((tmpCmdForAfkCheck.buttons^ ent->client->sess.oldbuttons_immediate) & BUTTON_TALK)) {
;2892:	tmpCmdForAfkCheck.buttons &= ~65536; // netcode for usercmds is a bit weird. encoding does 1 bit less than decoding. buttons is a 16 bit val so 16th bit ends up "random", so we can't use it for afk detection
ADDRLP4 4+16
ADDRLP4 4+16
INDIRI4
CNSTI4 -65537
BANDI4
ASGNI4
line 2893
;2893:	if (tmpCmdForAfkCheck.forwardmove || tmpCmdForAfkCheck.rightmove || tmpCmdForAfkCheck.upmove || ent->client->sess.sessionInitialized && (tmpCmdForAfkCheck.buttons^ ent->client->sess.oldbuttons_immediate)) {
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 4+24
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
NEI4 $1666
ADDRLP4 4+25
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
NEI4 $1666
ADDRLP4 4+26
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
NEI4 $1666
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 43580
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $1658
ADDRLP4 4+16
INDIRI4
ADDRLP4 48
INDIRP4
CNSTI4 43576
ADDP4
INDIRI4
BXORI4
ADDRLP4 44
INDIRI4
EQI4 $1658
LABELV $1666
line 2894
;2894:		if (g_developer.integer) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 0
EQI4 $1667
line 2895
;2895:			if ((level.time - ent->client->sess.lastHereTime) > 30000) {
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43572
ADDP4
INDIRI4
SUBI4
CNSTI4 30000
LEI4 $1670
line 2896
;2896:				Com_Printf("^3Client %d came back from AFK after %d milliseconds, fm %d, rm %d, um %d, btnchange %d, oldbuttons %d, buttons %d.\n",ent-g_entities, level.time - ent->client->sess.lastHereTime,tmpCmdForAfkCheck.forwardmove,tmpCmdForAfkCheck.rightmove,tmpCmdForAfkCheck.upmove, tmpCmdForAfkCheck.buttons ^ ent->client->sess.oldbuttons_immediate, ent->client->sess.oldbuttons_immediate, tmpCmdForAfkCheck.buttons);
ADDRGP4 $1673
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 43572
ADDP4
INDIRI4
SUBI4
ARGI4
ADDRLP4 4+24
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4+25
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4+26
INDIRI1
CVII4 1
ARGI4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 43576
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4+16
INDIRI4
ADDRLP4 60
INDIRI4
BXORI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2897
;2897:			}
ADDRGP4 $1671
JUMPV
LABELV $1670
line 2898
;2898:			else if (level.time < ent->client->sess.lastHereTime) {
ADDRGP4 level+36
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43572
ADDP4
INDIRI4
GEI4 $1680
line 2899
;2899:				Com_Printf("^3Client %d came back from AFK (glitch %d<%d), fm %d, rm %d, um %d, btnchange %d, oldbuttons %d, buttons %d.\n", ent - g_entities, level.time, ent->client->sess.lastHereTime, tmpCmdForAfkCheck.forwardmove, tmpCmdForAfkCheck.rightmove, tmpCmdForAfkCheck.upmove, tmpCmdForAfkCheck.buttons ^ ent->client->sess.oldbuttons_immediate, ent->client->sess.oldbuttons_immediate, tmpCmdForAfkCheck.buttons);
ADDRGP4 $1683
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRGP4 level+36
INDIRI4
ARGI4
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 43572
ADDP4
INDIRI4
ARGI4
ADDRLP4 4+24
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4+25
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4+26
INDIRI1
CVII4 1
ARGI4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 43576
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4+16
INDIRI4
ADDRLP4 60
INDIRI4
BXORI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2900
;2900:			}
LABELV $1680
LABELV $1671
line 2901
;2901:		}
LABELV $1667
line 2902
;2902:		ent->client->sess.lastHereTime = level.time; // for afk tracking for players
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43572
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2903
;2903:	}
LABELV $1658
line 2904
;2904:	ent->client->sess.oldbuttons_immediate = tmpCmdForAfkCheck.buttons;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43576
ADDP4
ADDRLP4 4+16
INDIRI4
ASGNI4
line 2912
;2905:
;2906:	//if (!segmentedReplay) {
;2907:	//	canRun = G_GetUserCmd(clientNum, &ent->client->pers.cmd,qtrue);
;2908:	//}
;2909:
;2910:	// mark the time we got info, so we can display the
;2911:	// phone jack if they don't get any for a while
;2912:	ent->client->lastCmdTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43604
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2914
;2913:
;2914:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer && !segmentedReplay) {
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 52
INDIRI4
NEI4 $1693
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $1693
ADDRLP4 32
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $1693
line 2915
;2915:		int index = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRGP4 $1697
JUMPV
LABELV $1696
line 2916
;2916:		while (G_GetUserCmd(clientNum, &ent->client->pers.cmd, GETUSERCMD_ADVANCECLIENTTHINK) || !g_userCmdBuffer.integer && !index) {
line 2918
;2917:
;2918:			ClientThink_real(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 2919
;2919:			index++;
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2920
;2920:		}
LABELV $1697
line 2916
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 60
ADDRGP4 G_GetUserCmd
CALLI4
ASGNI4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $1696
ADDRGP4 g_userCmdBuffer+12
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $1700
ADDRLP4 56
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $1696
LABELV $1700
line 2921
;2921:	}
ADDRGP4 $1694
JUMPV
LABELV $1693
line 2922
;2922:	else if (!segmentedReplay){
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $1701
line 2923
;2923:		ent->client->pers.cmd = tmpCmdForAfkCheck; // make sure bots work.
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ADDRLP4 4
INDIRB
ASGNB 28
line 2924
;2924:	}
LABELV $1701
LABELV $1694
line 2925
;2925:}
LABELV $1653
endproc ClientThink 68 40
proc ForceClientUpdate 28 12
line 2928
;2926:
;2927:
;2928:static void ForceClientUpdate(gentity_t* ent) {
line 2929
;2929:	if (ent->client->sess.spectatorState == SPECTATOR_FOLLOW) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1704
line 2930
;2930:		return; // or we get stuck in endless loop :)
ADDRGP4 $1703
JUMPV
LABELV $1704
line 2933
;2931:	}
;2932:
;2933:	ent->client->lastCmdTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43604
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2946
;2934:
;2935:	// fill with seemingly valid data
;2936:	//ent->client->pers.cmd.serverTime = level.time;
;2937:
;2938:	//ent->client->pers.cmd.buttons = 0;
;2939:	//ent->client->pers.cmd.forwardmove = ent->client->pers.cmd.rightmove = ent->client->pers.cmd.upmove = 0;
;2940:
;2941:	//ent->client->pers.cmd.buttons = ent->client->pers.lastCmd.buttons;
;2942:	//ent->client->pers.cmd.forwardmove = ent->client->pers.lastCmd.forwardmove;
;2943:	//ent->client->pers.cmd.rightmove = ent->client->pers.lastCmd.rightmove;
;2944:	//ent->client->pers.cmd.upmove = ent->client->pers.lastCmd.upmove;
;2945:
;2946:	if (ent->client->sess.raceMode && ent->client->sess.raceStyle.msec > 0) {
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
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1707
ADDRLP4 0
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
ADDRLP4 4
INDIRI4
LEI4 $1707
ADDRGP4 $1710
JUMPV
LABELV $1709
line 2947
;2947:		while (ent->client->ps.commandTime < (level.time+ent->client->pers.segmented.playbackStartedCommandTimeOffset)) {
line 2948
;2948:			ent->client->pers.cmd.serverTime = ent->client->ps.commandTime + ent->client->sess.raceStyle.msec;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1384
ADDP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 43494
ADDP4
INDIRI2
CVII4 2
ADDI4
ASGNI4
line 2949
;2949:			ClientThink_real(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 2950
;2950:			if (ent->client->ps.commandTime != ent->client->pers.cmd.serverTime) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
EQI4 $1713
line 2951
;2951:				trap_SendServerCommand(-1,va("^1ForceClientUpdate: WTF. ClientThink_real returned with commandTime %d but cmd.serverTime was %d", ent->client->ps.commandTime, ent->client->pers.cmd.serverTime));
ADDRGP4 $1715
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2952
;2952:				ent->client->ps.commandTime = ent->client->pers.cmd.serverTime;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
ASGNI4
line 2953
;2953:			}
LABELV $1713
line 2954
;2954:		}
LABELV $1710
line 2947
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 42480
ADDP4
INDIRI4
ADDI4
LTI4 $1709
line 2955
;2955:	}
ADDRGP4 $1708
JUMPV
LABELV $1707
line 2956
;2956:	else {
line 2957
;2957:		ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 2958
;2958:		ClientThink_real(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 2959
;2959:	}
LABELV $1708
line 2961
;2960:
;2961:}
LABELV $1703
endproc ForceClientUpdate 28 12
export G_RunClient
proc G_RunClient 120 20
line 2964
;2962:
;2963:extern void RestorePosition(gentity_t* client, savedPosition_t* savedPosition, veci_t* diffAccum);
;2964:void G_RunClient( gentity_t *ent ) {
line 2965
;2965:	qboolean areSegReplaying = DF_ClientInSegmentedRunMode(ent->client) && ent->client->pers.segmented.state == SEG_REPLAY;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 DF_ClientInSegmentedRunMode
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1719
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 22084
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1719
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $1720
JUMPV
LABELV $1719
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1720
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 2968
;2966:
;2967:	// check if we should execute a few client frames that got buffered
;2968:	if (!(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer && !areSegReplaying && g_userCmdBuffer.integer && ent->client->pers.connected == CON_CONNECTED) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $1721
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $1721
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $1721
ADDRGP4 g_userCmdBuffer+12
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1721
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1721
ADDRGP4 $1726
JUMPV
LABELV $1725
line 2969
;2969:		while (G_GetUserCmd(ent - g_entities, &ent->client->pers.cmd, GETUSERCMD_ADVANCERUNCLIENT)) {
line 2970
;2970:			if (g_developer.integer > 10) {
ADDRGP4 g_developer+12
INDIRI4
CNSTI4 10
LEI4 $1728
line 2971
;2971:				G_Printf("^3executing buffered cmd for client %d\n", ent-g_entities);
ADDRGP4 $1731
ARGP4
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
ADDRGP4 G_Printf
CALLV
pop
line 2972
;2972:			}
LABELV $1728
line 2973
;2973:			ClientThink_real(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 2974
;2974:		}
LABELV $1726
line 2969
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 24
ADDRGP4 G_GetUserCmd
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $1725
line 2975
;2975:	}
LABELV $1721
line 2981
;2976:
;2977:	//If racemode , do forceclientupdaterate hardcoded at like 4/5 hz ?
;2978:
;2979:	// force client updates if they're not sending packets at roughly 4hz
;2980:
;2981:	if (ent->client->pers.recordingDemo) { //(ent->client->ps.pm_flags & PMF_FOLLOW) ?
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43088
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1732
line 2982
;2982:		if (g_cheats.integer || !ent->client->sess.raceMode || (ent->client->sess.sessionTeam == TEAM_SPECTATOR)) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 g_cheats+12
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $1738
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $1738
ADDRLP4 24
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1734
LABELV $1738
line 2984
;2983:			//Their demo is bad, dont keep telling game to keep it
;2984:		}
ADDRGP4 $1735
JUMPV
LABELV $1734
line 2985
;2985:		else if (!areSegReplaying && (!ent->client->pers.stats.startLevelTime ||
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $1739
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 42532
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $1743
ADDRLP4 32
INDIRP4
CNSTI4 43700
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
CNSTI4 3600000
SUBI4
GEI4 $1739
ADDRGP4 level+36
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 43164
ADDP4
INDIRI4
SUBI4
CNSTI4 10000
LEI4 $1739
LABELV $1743
line 2989
;2986:			((ent->client->lastHereTime < level.time - 60 * 60 * 1000) && (level.time - ent->client->pers.demoStoppedTime > 10000)))
;2987:			//  || (trap_Milliseconds() - ent->client->pers.stats.startTime > 240 * 60 * 1000)) // just give up on races longer than 4 hours lmao
;2988:			)
;2989:		{
line 2991
;2990:			//Their demo is bad, dont keep telling game to keep it
;2991:		}
ADDRGP4 $1740
JUMPV
LABELV $1739
line 2993
;2992:		else
;2993:			ent->client->pers.stopRecordingTime = level.time + 10000; //Their demo is good! tell game not to delete it yet
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43168
ADDP4
ADDRGP4 level+36
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
LABELV $1740
LABELV $1735
line 2994
;2994:	}
LABELV $1732
line 2996
;2995:
;2996:	if (ent->client->pers.recordingDemo && (ent->client->pers.stopRecordingTime < level.time)) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 43088
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1745
ADDRLP4 20
INDIRP4
CNSTI4 43168
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
GEI4 $1745
line 2997
;2997:		ent->client->pers.recordingDemo = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43088
ADDP4
CNSTI4 0
ASGNI4
line 2998
;2998:		ent->client->pers.demoStoppedTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43164
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3000
;2999:
;3000:		if (ent->client->pers.keepDemoMaybe) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1749
line 3002
;3001:			// rename happens automatically
;3002:			trap_SendConsoleCommand(EXEC_APPEND, va("svstoprecord %i\n", ent->s.number));
ADDRGP4 $1751
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 3003
;3003:		}
ADDRGP4 $1750
JUMPV
LABELV $1749
line 3004
;3004:		else {
line 3005
;3005:			trap_SendConsoleCommand(EXEC_APPEND, va("svstoprecord %i;svrenamedemo \"%s\" \"%strash/trash%d\"\n", ent->s.number, ent->client->pers.tempDemoName, level.tempDemoNamePrefix, ent->s.number));
ADDRGP4 $1752
ARGP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43096
ADDP4
ARGP4
ADDRGP4 level+32612
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 3006
;3006:		}
LABELV $1750
line 3007
;3007:	}
LABELV $1745
line 3009
;3008:	
;3009:	if (ent->client->pers.cmd.forwardmove || ent->client->pers.cmd.rightmove || ent->client->pers.cmd.upmove || (ent->client->pers.cmd.buttons & (BUTTON_ATTACK | BUTTON_ALT_ATTACK))) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 1408
ADDP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
NEI4 $1758
ADDRLP4 24
INDIRP4
CNSTI4 1409
ADDP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
NEI4 $1758
ADDRLP4 24
INDIRP4
CNSTI4 1410
ADDP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
NEI4 $1758
ADDRLP4 24
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 129
BANDI4
ADDRLP4 28
INDIRI4
EQI4 $1754
LABELV $1758
line 3010
;3010:		ent->client->lastHereTime = level.time; // for demo stuff
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43700
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3011
;3011:	}
LABELV $1754
line 3013
;3012:
;3013:	if (g_autoScoresInterval.integer && (ent->client->lastScoresMessage < (level.time-clampedIntMult(g_autoScoresInterval.integer,1000)) || level.time < ent->client->lastScoresMessage)) {
ADDRGP4 g_autoScoresInterval+12
INDIRI4
CNSTI4 0
EQI4 $1760
ADDRGP4 g_autoScoresInterval+12
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 32
ADDRGP4 clampedIntMult
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 53184
ADDP4
INDIRI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
LTI4 $1766
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 53184
ADDP4
INDIRI4
GEI4 $1760
LABELV $1766
line 3014
;3014:		DeathmatchScoreboardMessage(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 3015
;3015:	}
LABELV $1760
line 3018
;3016:
;3017:	//if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer && (!DF_ClientInSegmentedRunMode(ent->client) || ent->client->pers.segmented.state != SEG_REPLAY)) {
;3018:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer && !areSegReplaying) {
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 36
INDIRI4
NEI4 $1767
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1767
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $1767
line 3019
;3019:		entityState_t* stats = &level.playerStats[ent - g_entities]->s;
ADDRLP4 40
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
ADDRGP4 level+9152
ADDP4
INDIRP4
ASGNP4
line 3020
;3020:		stats->apos.trTime = 0;
ADDRLP4 40
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3021
;3021:		stats->pos.trTime = 0;
ADDRLP4 40
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 3022
;3022:		stats->frame = 0;
ADDRLP4 40
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
line 3023
;3023:		if (ent->client->clientIsZombified) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 52136
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1717
line 3024
;3024:			ForceClientUpdate(ent); // client is officially disconnected. we are likely just after a segmented run replay. just move him a lil bit.
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceClientUpdate
CALLV
pop
line 3025
;3025:		}
line 3026
;3026:		return;
ADDRGP4 $1717
JUMPV
LABELV $1767
line 3029
;3027:	}
;3028:
;3029:	if ( ent->client->pers.botDelayed )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1704
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1773
line 3030
;3030:	{ // Call ClientBegin for delayed bots now
line 3031
;3031:		ClientBegin( ent-g_entities, qtrue );
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
CNSTI4 1
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 3032
;3032:		ent->client->pers.botDelayed = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1704
ADDP4
CNSTI4 0
ASGNI4
line 3033
;3033:	}
LABELV $1773
line 3036
;3034:
;3035:	//if (DF_ClientInSegmentedRunMode(ent->client) && ent->client->pers.segmented.state == SEG_REPLAY) {
;3036:	if (areSegReplaying) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1775
line 3038
;3037:		usercmd_t ucmd;
;3038:		gclient_t* cl = ent->client;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 3039
;3039:		if (!cl->pers.segmented.playbackNextCmdIndex) {
ADDRLP4 68
INDIRP4
CNSTI4 42484
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1780
line 3040
;3040:			RestorePosition(ent, &cl->pers.segmented.startPos, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 22096
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 RestorePosition
CALLV
pop
line 3041
;3041:			VectorCopy(cl->pers.segmented.startPos.ps.delta_angles, cl->ps.delta_angles); //keep this so we can replay properly. we won't let the person move anyway.
ADDRLP4 68
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 22164
ADDP4
INDIRB
ASGNB 12
line 3042
;3042:		}
ADDRGP4 $1780
JUMPV
LABELV $1779
line 3043
;3043:		while (qtrue) {
line 3044
;3044:			qboolean success=qtrue;
ADDRLP4 72
CNSTI4 1
ASGNI4
line 3045
;3045:			posHashType_t posHash =0,currentPosHash=0;
ADDRLP4 76
CNSTU1 0
ASGNU1
ADDRLP4 84
CNSTU1 0
ASGNU1
line 3047
;3046:			int targetServerTime;
;3047:			ucmd.serverTime = -1;
ADDRLP4 40
CNSTI4 -1
ASGNI4
ADDRGP4 $1783
JUMPV
LABELV $1782
line 3048
;3048:			while (success && (ucmd.serverTime == -1 || ucmd.serverTime == -2)) { // -1 is just a marker for cuts
line 3049
;3049:				success = trap_G_COOL_API_PlayerUserCmdGet(ent - g_entities, cl->pers.segmented.playbackNextCmdIndex, &ucmd, &posHash);
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
ADDRLP4 68
INDIRP4
CNSTI4 42484
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 88
ADDRGP4 trap_G_COOL_API_PlayerUserCmdGet
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 88
INDIRI4
ASGNI4
line 3050
;3050:				if (success && (ucmd.serverTime == -1 || ucmd.serverTime == -2)) {
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $1785
ADDRLP4 92
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 -1
EQI4 $1787
ADDRLP4 92
INDIRI4
CNSTI4 -2
NEI4 $1785
LABELV $1787
line 3051
;3051:					entityState_t* stats = &level.playerStats[ent - g_entities]->s;
ADDRLP4 96
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
ADDRGP4 level+9152
ADDP4
INDIRP4
ASGNP4
line 3052
;3052:					switch (ucmd.serverTime) {
ADDRLP4 100
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 -2
EQI4 $1799
ADDRLP4 100
INDIRI4
CNSTI4 -1
EQI4 $1792
ADDRGP4 $1789
JUMPV
LABELV $1792
line 3054
;3053:					case -1:
;3054:						stats->apos.trTime = cl->pers.segmented.playbackNextCmdIndex == 0 ? cl->pers.segmented.playbackStartedTime + cl->pers.segmented.playbackStartedCommandTimeOffset : cl->ps.commandTime;
ADDRLP4 68
INDIRP4
CNSTI4 42484
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1794
ADDRLP4 108
ADDRLP4 68
INDIRP4
CNSTI4 42476
ADDP4
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 42480
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $1795
JUMPV
LABELV $1794
ADDRLP4 108
ADDRLP4 68
INDIRP4
INDIRI4
ASGNI4
LABELV $1795
ADDRLP4 96
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 108
INDIRI4
ASGNI4
line 3055
;3055:						stats->frame = cl->pers.segmented.playbackNextCmdIndex == 0 ? 1 : stats->frame + 1;
ADDRLP4 68
INDIRP4
CNSTI4 42484
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1797
ADDRLP4 116
CNSTI4 1
ASGNI4
ADDRGP4 $1798
JUMPV
LABELV $1797
ADDRLP4 116
ADDRLP4 96
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1798
ADDRLP4 96
INDIRP4
CNSTI4 224
ADDP4
ADDRLP4 116
INDIRI4
ASGNI4
line 3056
;3056:						stats->pos.trTime = 0;
ADDRLP4 96
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 3057
;3057:						break;
ADDRGP4 $1790
JUMPV
LABELV $1799
line 3059
;3058:					case -2:
;3059:						stats->pos.trTime = ucmd.buttons; // this isnt time. this is count of respos of this point. will usually follow right after the -1 one.
ADDRLP4 96
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 40+16
INDIRI4
ASGNI4
line 3060
;3060:						break;
LABELV $1789
LABELV $1790
line 3062
;3061:					}
;3062:					cl->pers.segmented.playbackNextCmdIndex++;
ADDRLP4 108
ADDRLP4 68
INDIRP4
CNSTI4 42484
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3063
;3063:				} else if (success && ucmd.serverTime == -2) {
ADDRGP4 $1786
JUMPV
LABELV $1785
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $1801
ADDRLP4 40
INDIRI4
CNSTI4 -2
NEI4 $1801
line 3064
;3064:					entityState_t* stats = &level.playerStats[ent - g_entities]->s;
ADDRLP4 96
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
ADDRGP4 level+9152
ADDP4
INDIRP4
ASGNP4
line 3065
;3065:					stats->apos.trTime = cl->pers.segmented.playbackNextCmdIndex == 0 ? cl->pers.segmented.playbackStartedTime + cl->pers.segmented.playbackStartedCommandTimeOffset : cl->ps.commandTime;
ADDRLP4 68
INDIRP4
CNSTI4 42484
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1805
ADDRLP4 100
ADDRLP4 68
INDIRP4
CNSTI4 42476
ADDP4
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 42480
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $1806
JUMPV
LABELV $1805
ADDRLP4 100
ADDRLP4 68
INDIRP4
INDIRI4
ASGNI4
LABELV $1806
ADDRLP4 96
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 3066
;3066:					stats->frame = cl->pers.segmented.playbackNextCmdIndex == 0 ? 1 : stats->frame + 1;
ADDRLP4 68
INDIRP4
CNSTI4 42484
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1808
ADDRLP4 108
CNSTI4 1
ASGNI4
ADDRGP4 $1809
JUMPV
LABELV $1808
ADDRLP4 108
ADDRLP4 96
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1809
ADDRLP4 96
INDIRP4
CNSTI4 224
ADDP4
ADDRLP4 108
INDIRI4
ASGNI4
line 3067
;3067:					cl->pers.segmented.playbackNextCmdIndex++;
ADDRLP4 112
ADDRLP4 68
INDIRP4
CNSTI4 42484
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3068
;3068:				}
LABELV $1801
LABELV $1786
line 3069
;3069:			}
LABELV $1783
line 3048
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $1810
ADDRLP4 88
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 -1
EQI4 $1782
ADDRLP4 88
INDIRI4
CNSTI4 -2
EQI4 $1782
LABELV $1810
line 3070
;3070:			if (!success) {
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $1811
line 3071
;3071:				trap_G_COOL_API_PlayerUserCmdClear(ent-g_entities);
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
ADDRGP4 trap_G_COOL_API_PlayerUserCmdClear
CALLI4
pop
line 3072
;3072:				cl->pers.segmented.lastPosResposCount = 0;
ADDRLP4 68
INDIRP4
CNSTI4 42444
ADDP4
CNSTI4 0
ASGNI4
line 3076
;3073:#if SEGMENTEDDEBUG
;3074:				memset(cl->pers.segmented.debugTime, 0, sizeof(cl->pers.segmented.debugTime));
;3075:#endif
;3076:				G_ResetUserCmdStore(ent - g_entities); // clear this so it doesn't execute very old ones now.
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
ADDRGP4 G_ResetUserCmdStore
CALLV
pop
line 3077
;3077:				G_GetUserCmd(ent - g_entities, &ent->client->pers.cmd, GETUSERCMD_NOADVANCE);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2352
DIVI4
ARGI4
ADDRLP4 92
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
line 3078
;3078:				SetClientViewAngle(ent,ent->client->ps.viewangles); // make a smooth transition back to player-controlled gameplay
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 3080
;3079:				//ent->client->ps.commandTime = ent->client->pers.cmd.serverTime; // fuck it, we apply the offset at the start now so... whatever.
;3080:				ent->client->pers.segmented.state = SEG_DISABLED; // done
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 22084
ADDP4
CNSTI4 0
ASGNI4
line 3081
;3081:				if (coolApi & COOL_APIFEATURE_SENDBACKUCMD_GAMEGENERATED) {
ADDRGP4 coolApi
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1813
line 3083
;3082:					// during replay, we are providing usercmds for server to send to spectators and player for demos
;3083:					ent->r.svFlags &= ~SVF_COOLAPI_GAMEGENERATEDSENDBACKUSERCMD;
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 3084
;3084:				}
LABELV $1813
line 3085
;3085:				ent->s.eFlags &= ~EF_SEGMENTEDREPLAY;
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 -134217729
BANDI4
ASGNI4
line 3086
;3086:				cl->ps.eFlags &= ~EF_SEGMENTEDREPLAY;
ADDRLP4 104
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 -134217729
BANDI4
ASGNI4
line 3087
;3087:				break;
ADDRGP4 $1776
JUMPV
LABELV $1811
line 3089
;3088:			}
;3089:			targetServerTime = cl->pers.segmented.playbackStartedTime + cl->pers.segmented.playbackStartedCommandTimeOffset + ucmd.serverTime;
ADDRLP4 80
ADDRLP4 68
INDIRP4
CNSTI4 42476
ADDP4
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 42480
ADDP4
INDIRI4
ADDI4
ADDRLP4 40
INDIRI4
ADDI4
ASGNI4
line 3091
;3090:
;3091:			currentPosHash = DF_GetPositionHash(&cl->ps);
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 DF_GetPositionHash
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 96
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 3092
;3092:			if (coolApi_userCmdVersion >= 1 && currentPosHash != posHash) {
ADDRGP4 coolApi_userCmdVersion
INDIRI4
CNSTI4 1
LTI4 $1815
ADDRLP4 84
INDIRU1
CVUI4 1
ADDRLP4 76
INDIRU1
CVUI4 1
EQI4 $1815
line 3093
;3093:				if (!cl->pers.segmented.playbackErrored) {
ADDRLP4 68
INDIRP4
CNSTI4 42496
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1817
line 3094
;3094:					G_SendServerCommand(ent - g_entities, va("print \"^3Segmented replay failing. You can try ^2/resseg^3 to restart the replay. (position hash does not match: ^1%d -> %d^3, further failed frame messages will be suppressed)\n\"", (int)posHash, (int)currentPosHash), qtrue);
ADDRGP4 $1819
ARGP4
ADDRLP4 76
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 84
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
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
ADDRLP4 100
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SendServerCommand
CALLV
pop
line 3095
;3095:				}
LABELV $1817
line 3096
;3096:				cl->pers.segmented.playbackErrored = qtrue;
ADDRLP4 68
INDIRP4
CNSTI4 42496
ADDP4
CNSTI4 1
ASGNI4
line 3097
;3097:			}
LABELV $1815
line 3099
;3098:
;3099:			if (targetServerTime <= (level.time + cl->pers.segmented.playbackStartedCommandTimeOffset)) {
ADDRLP4 80
INDIRI4
ADDRGP4 level+36
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 42480
ADDP4
INDIRI4
ADDI4
GTI4 $1776
line 3100
;3100:				cl->pers.cmd = ucmd;
ADDRLP4 68
INDIRP4
CNSTI4 1384
ADDP4
ADDRLP4 40
INDIRB
ASGNB 28
line 3192
;3101:#if SEGMENTEDDEBUG
;3102:				{
;3103:					int timeIndex = ucmd.serverTime / 100;
;3104:					if (timeIndex >= 0 && timeIndex < 1000) {
;3105:						if (cl->pers.segmented.debugTime[timeIndex] == ucmd.serverTime) {
;3106:							int i;
;3107:							for (i = 0; i < segDebugFieldsCount; i++) {
;3108:								void* ptrSrc = ((byte*)cl) + segDebugFields[i].offset;
;3109:								void* ptrDst = ((byte*)&cl->pers.segmented.debugVars[timeIndex]) + segDebugFields[i].offsetDebugVars;
;3110:								if (memcmp(ptrDst, ptrSrc, segDebugFields[i].typeSize)) {
;3111:									switch (segDebugFields[i].type) {
;3112:									case dbgtype_float:
;3113:									{
;3114:										float* current = ptrSrc;
;3115:										float* compare = ptrDst;
;3116:										float diff;
;3117:										diff = *current - *compare;
;3118:										G_SendServerCommand(ent - g_entities, va("print \"^1SEGDEBUG: ^%d%s^7(float) CHANGED: %f diff, %f -> %f \n\"", i, segDebugFields[i].name,
;3119:											fabsf(diff),
;3120:											(*current),
;3121:											(*compare)
;3122:										),qtrue);
;3123:									}
;3124:									break;
;3125:									case dbgtype_int:
;3126:									{
;3127:										int* current = ptrSrc;
;3128:										int* compare = ptrDst;
;3129:										int diff;
;3130:										diff = *current - *compare;
;3131:										G_SendServerCommand(ent - g_entities, va("print \"^1SEGDEBUG: ^%d%s^7(%s) CHANGED: %i diff, %i -> %i \n\"", i, segDebugFields[i].name, segDebugFields[i].typeName,
;3132:											abs(diff),
;3133:											(*current),
;3134:											(*compare)
;3135:										),qtrue);
;3136:									}
;3137:									case dbgtype_schar_t:
;3138:									{
;3139:										schar_t* current = ptrSrc;
;3140:										schar_t* compare = ptrDst;
;3141:										int diff;
;3142:										diff = *current - *compare;
;3143:										G_SendServerCommand(ent - g_entities, va("print \"^1SEGDEBUG: ^%d%s^7(%s) CHANGED: %i diff, %i -> %i \n\"", i, segDebugFields[i].name, segDebugFields[i].typeName,
;3144:											abs(diff),
;3145:											(*current),
;3146:											(*compare)
;3147:										),qtrue);
;3148:									}
;3149:									break;
;3150:									case dbgtype_vec3_t:
;3151:									{
;3152:										vec3_t* current = ptrSrc;
;3153:										vec3_t* compare = ptrDst;
;3154:										vec3_t diff;
;3155:										VectorSubtract(*current, *compare, diff);
;3156:										G_SendServerCommand(ent - g_entities, va("print \"^1SEGDEBUG: ^%d%s^7(vec3_t) CHANGED: %f diff, %f %f %f -> %f %f %f \n\"", i, segDebugFields[i].name,
;3157:											VectorLength(diff),
;3158:											(*current)[0],
;3159:											(*current)[1],
;3160:											(*current)[2],
;3161:											(*compare)[0],
;3162:											(*compare)[1],
;3163:											(*compare)[2]
;3164:										), qtrue);
;3165:									}
;3166:									break;
;3167:									case dbgtype_veci3_t:
;3168:									{
;3169:										veci3_t* current = ptrSrc;
;3170:										veci3_t* compare = ptrDst;
;3171:										vec3_t diff;
;3172:										VectorSubtract(*current, *compare, diff);
;3173:										G_SendServerCommand(ent - g_entities, va("print \"^1SEGDEBUG: ^%d%s^7(veci3_t) CHANGED: %f diff, %i %i %i -> %i %i %i \n\"", i, segDebugFields[i].name,
;3174:											VectorLength(diff),
;3175:											(*current)[0],
;3176:											(*current)[1],
;3177:											(*current)[2],
;3178:											(*compare)[0],
;3179:											(*compare)[1],
;3180:											(*compare)[2]
;3181:										),qtrue);
;3182:									}
;3183:									break;
;3184:									}
;3185:								}
;3186:							}
;3187:
;3188:						}
;3189:					}
;3190:				}
;3191:#endif
;3192:				cl->pers.cmd.serverTime = targetServerTime;
ADDRLP4 68
INDIRP4
CNSTI4 1384
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 3193
;3193:				if (cl->pers.segmented.playbackNextCmdIndex == 0) {
ADDRLP4 68
INDIRP4
CNSTI4 42484
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1823
line 3194
;3194:					cl->ps.commandTime = cl->pers.segmented.playbackStartedTime + cl->pers.segmented.playbackStartedCommandTimeOffset; // shouldn't change anything? but be safe.
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
CNSTI4 42476
ADDP4
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 42480
ADDP4
INDIRI4
ADDI4
ASGNI4
line 3195
;3195:				}
LABELV $1823
line 3196
;3196:				if (coolApi & COOL_APIFEATURE_SENDBACKUCMD_GAMEGENERATED) {
ADDRGP4 coolApi
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1825
line 3198
;3197:					// during replay, we are providing usercmds for server to send to spectators and player for demos
;3198:					trap_G_COOL_API_SendBackUCMD_GameGenerated(ent-g_entities,&cl->pers.cmd);
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
ADDRLP4 68
INDIRP4
CNSTI4 1384
ADDP4
ARGP4
ADDRGP4 trap_G_COOL_API_SendBackUCMD_GameGenerated
CALLV
pop
line 3199
;3199:				}
LABELV $1825
line 3200
;3200:				ClientThink_real(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 3201
;3201:				cl->pers.segmented.playbackNextCmdIndex++;
ADDRLP4 100
ADDRLP4 68
INDIRP4
CNSTI4 42484
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3202
;3202:			}
line 3203
;3203:			else {
line 3204
;3204:				break;
LABELV $1821
line 3206
;3205:			}
;3206:		}
LABELV $1780
line 3043
ADDRGP4 $1779
JUMPV
line 3208
;3207:
;3208:	}
ADDRGP4 $1776
JUMPV
LABELV $1775
line 3209
;3209:	else {
line 3210
;3210:		entityState_t* stats = &level.playerStats[ent - g_entities]->s;
ADDRLP4 40
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
ADDRGP4 level+9152
ADDP4
INDIRP4
ASGNP4
line 3211
;3211:		stats->apos.trTime = 0;
ADDRLP4 40
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3212
;3212:		stats->pos.trTime = 0;
ADDRLP4 40
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 3213
;3213:		stats->frame = 0;
ADDRLP4 40
INDIRP4
CNSTI4 224
ADDP4
CNSTI4 0
ASGNI4
line 3215
;3214:	
;3215:		ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
ADDRGP4 level+36
INDIRI4
ASGNI4
line 3216
;3216:		ClientThink_real(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 3217
;3217:	}
LABELV $1776
line 3218
;3218:}
LABELV $1717
endproc G_RunClient 120 20
export SpectatorClientEndFrame
proc SpectatorClientEndFrame 28 12
line 3227
;3219:
;3220:
;3221:/*
;3222:==================
;3223:SpectatorClientEndFrame
;3224:
;3225:==================
;3226:*/
;3227:void SpectatorClientEndFrame( gentity_t *ent ) {
line 3231
;3228:	gclient_t	*cl;
;3229:
;3230:	// if we are doing a chase cam or a remote view, grab the latest info
;3231:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1830
line 3235
;3232:		int		clientNum, flags;
;3233:		int		savedPing;
;3234:
;3235:		clientNum = ent->client->sess.spectatorClient;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43452
ADDP4
INDIRI4
ASGNI4
line 3238
;3236:
;3237:		// team follow1 and team follow2 go to whatever clients are playing
;3238:		if ( clientNum == -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $1832
line 3239
;3239:			clientNum = level.follow1;
ADDRLP4 4
ADDRGP4 level+224
INDIRI4
ASGNI4
line 3240
;3240:		} else if ( clientNum == -2 ) {
ADDRGP4 $1833
JUMPV
LABELV $1832
ADDRLP4 4
INDIRI4
CNSTI4 -2
NEI4 $1835
line 3241
;3241:			clientNum = level.follow2;
ADDRLP4 4
ADDRGP4 level+228
INDIRI4
ASGNI4
line 3242
;3242:		}
LABELV $1835
LABELV $1833
line 3243
;3243:		if ( clientNum >= 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1838
line 3244
;3244:			cl = &level.clients[ clientNum ];
ADDRLP4 0
CNSTI4 53196
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 3245
;3245:			if ( cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 1380
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1840
ADDRLP4 16
INDIRP4
CNSTI4 43440
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1840
line 3246
;3246:				flags = (cl->ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (ent->client->ps.eFlags & (EF_VOTED | EF_TEAMVOTED));
ADDRLP4 20
CNSTI4 108
ASGNI4
ADDRLP4 8
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
CNSTI4 -540673
BANDI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
CNSTI4 540672
BANDI4
BORI4
ASGNI4
line 3247
;3247:				savedPing = ent->client->ps.ping;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
ASGNI4
line 3248
;3248:				ent->client->ps = cl->ps;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 1380
line 3249
;3249:				ent->client->ps.ping = savedPing;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 3252
;3250:				// let's not overwrite ps ping, let that be the real one. but still overwrite this one to replicate old behavior
;3251:				// this is ok because ps->ping isn't networked anyway so we can just handle it differently internally
;3252:				ent->client->pers.normalFollowerPing = cl->ps.ping;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43436
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
ASGNI4
line 3253
;3253:				ent->client->ps.pm_flags |= PMF_FOLLOW;
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
CNSTI4 4096
BORI4
ASGNI4
line 3254
;3254:				ent->client->ps.eFlags = flags;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 3255
;3255:				return;
ADDRGP4 $1829
JUMPV
LABELV $1840
line 3256
;3256:			} else {
line 3258
;3257:				// drop them to free spectators unless they are dedicated camera followers
;3258:				if ( ent->client->sess.spectatorClient >= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43452
ADDP4
INDIRI4
CNSTI4 0
LTI4 $1842
line 3259
;3259:					ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43448
ADDP4
CNSTI4 1
ASGNI4
line 3260
;3260:					memset( ent->client->ps.powerups, 0, sizeof(ent->client->ps.powerups) ); // Ensure following spectators don't take flags or such into ClientBegin and trigger the FlagEatingFix
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
line 3261
;3261:					ClientBegin( ent->client - level.clients, qtrue );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
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
CNSTI4 1
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 3262
;3262:				}
LABELV $1842
line 3263
;3263:			}
line 3264
;3264:		}
LABELV $1838
line 3265
;3265:	}
LABELV $1830
line 3267
;3266:
;3267:	if ( ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43448
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1844
line 3268
;3268:		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 3269
;3269:	} else {
ADDRGP4 $1845
JUMPV
LABELV $1844
line 3270
;3270:		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 3271
;3271:	}
LABELV $1845
line 3272
;3272:}
LABELV $1829
endproc SpectatorClientEndFrame 28 12
export ClientEndFrameRaceCritical
proc ClientEndFrameRaceCritical 20 4
line 3274
;3273:
;3274:void ClientEndFrameRaceCritical(gentity_t* ent) {
line 3276
;3275:	int i;
;3276:	int			nowTime = LEVELTIME(ent->client);
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
EQU4 $1851
ADDRLP4 16
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1851
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1384
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1853
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
ADDRGP4 $1854
JUMPV
LABELV $1853
ADDRLP4 12
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1854
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $1852
JUMPV
LABELV $1851
ADDRLP4 8
ADDRGP4 level+36
INDIRI4
ASGNI4
LABELV $1852
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 3279
;3277:
;3278:	// turn off any expired powerups
;3279:	for (i = 0; i < MAX_POWERUPS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1855
line 3280
;3280:		if (ent->client->ps.powerups[i] < nowTime) {
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
ADDRLP4 4
INDIRI4
GEI4 $1859
line 3281
;3281:			ent->client->ps.powerups[i] = 0;
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
CNSTI4 0
ASGNI4
line 3282
;3282:		}
LABELV $1859
line 3283
;3283:	}
LABELV $1856
line 3279
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1855
line 3297
;3284:
;3285:	// save network bandwidth
;3286:#if 0
;3287:	if (!g_synchronousClients->integer && (ent->client->ps.pm_type == PM_NORMAL || ent->client->ps.pm_type == PM_FLOAT)) {
;3288:		// FIXME: this must change eventually for non-sync demo recording
;3289:		VectorClear(ent->client->ps.viewangles);
;3290:	}
;3291:#endif
;3292:
;3293:	//
;3294:	// If the end of unit layout is displayed, don't give
;3295:	// the player any normal movement attributes
;3296:	//
;3297:	if (level.intermissiontime) {
ADDRGP4 level+9028
INDIRI4
CNSTI4 0
EQI4 $1861
line 3298
;3298:		return;
ADDRGP4 $1846
JUMPV
LABELV $1861
line 3302
;3299:	}
;3300:
;3301:	// burn from lava, etc
;3302:	P_WorldEffects(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_WorldEffects
CALLV
pop
line 3305
;3303:
;3304:	// apply all the damage taken this frame
;3305:	P_DamageFeedback(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_DamageFeedback
CALLV
pop
line 3307
;3306:
;3307:	G_SetClientSound(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetClientSound
CALLV
pop
line 3308
;3308:}
LABELV $1846
endproc ClientEndFrameRaceCritical 20 4
export ClientEndFrameServerFrame
proc ClientEndFrameServerFrame 24 16
line 3310
;3309:
;3310:void ClientEndFrameServerFrame(gentity_t* ent) {
line 3313
;3311:	// defrag: keep stuff below in a loop that is actually at the end to have up to date values.
;3312:
;3313:	ent->client->ps.stats[STAT_HEALTH] = ent->health;	// FIXME: get rid of ent->health...
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ASGNI4
line 3316
;3314:
;3315:	// add the EF_CONNECTION flag if we haven't gotten commands recently
;3316:	if (level.time - ent->client->lastCmdTime > 1000 && !(ent->client->sess.raceMode && (ent->client->sess.raceStyle.runFlags & RFL_SEGMENTED) && ent->client->pers.segmented.state == SEG_REPLAY)) { // let it be ok during replays (if ppl time out/ disconnect)
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRGP4 level+36
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 43604
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $1865
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1869
ADDRLP4 4
INDIRP4
CNSTI4 43500
ADDP4
INDIRI2
CVII4 2
CNSTI4 32
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $1869
ADDRLP4 4
INDIRP4
CNSTI4 22084
ADDP4
INDIRI4
CNSTI4 4
EQI4 $1865
LABELV $1869
line 3317
;3317:		ent->s.eFlags |= EF_CONNECTION;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 3318
;3318:		if (level.time - ent->client->lastCmdTime > 3000) {
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43604
ADDP4
INDIRI4
SUBI4
CNSTI4 3000
LEI4 $1866
line 3319
;3319:			G_ClearActivatedEntities(ent); // dont let this client bug out all the movers he touched while he's having connection issues
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ClearActivatedEntities
CALLV
pop
line 3320
;3320:		}
line 3321
;3321:	}
ADDRGP4 $1866
JUMPV
LABELV $1865
line 3322
;3322:	else {
line 3323
;3323:		ent->s.eFlags &= ~EF_CONNECTION;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 3324
;3324:	}
LABELV $1866
line 3327
;3325:
;3326:	// set the latest infor
;3327:	if (g_smoothClients.integer) {
ADDRGP4 g_smoothClients+12
INDIRI4
CNSTI4 0
EQI4 $1873
line 3328
;3328:		BG_PlayerStateToEntityStateExtraPolate(&ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityStateExtraPolate
CALLV
pop
line 3329
;3329:	}
ADDRGP4 $1874
JUMPV
LABELV $1873
line 3330
;3330:	else {
line 3331
;3331:		BG_PlayerStateToEntityState(&ent->client->ps, &ent->s, qtrue);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 3332
;3332:	}
LABELV $1874
line 3337
;3333:	
;3334:	// Pack health and armor into generic1 for universal client access
;3335:	// This provides real-time health/armor visibility without server restrictions
;3336:	// Format: (health & 0xFFFF) | ((armor & 0xFFFF) << 16)
;3337:	{
line 3338
;3338:		int health = ent->client->ps.stats[STAT_HEALTH];
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 3339
;3339:		int armor = ent->client->ps.stats[STAT_ARMOR];
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 3340
;3340:		if (health < 0) health = 0;
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $1876
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $1876
line 3341
;3341:		if (armor < 0) armor = 0;
ADDRLP4 16
INDIRI4
CNSTI4 0
GEI4 $1878
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $1878
line 3342
;3342:		if (health > 65535) health = 65535;
ADDRLP4 12
INDIRI4
CNSTI4 65535
LEI4 $1880
ADDRLP4 12
CNSTI4 65535
ASGNI4
LABELV $1880
line 3343
;3343:		if (armor > 65535) armor = 65535;
ADDRLP4 16
INDIRI4
CNSTI4 65535
LEI4 $1882
ADDRLP4 16
CNSTI4 65535
ASGNI4
LABELV $1882
line 3344
;3344:		ent->s.generic1 = (health & 0xFFFF) | ((armor & 0xFFFF) << 16);
ADDRLP4 20
CNSTI4 65535
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
BANDI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
BANDI4
CNSTI4 16
LSHI4
BORI4
ASGNI4
line 3345
;3345:	}
line 3347
;3346:	
;3347:	SendPendingPredictableEvents(&ent->client->ps);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 3352
;3348:
;3349:	// set the bit for the reachability area the client is currently in
;3350://	i = trap_AAS_PointReachabilityAreaIndex( ent->client->ps.origin );
;3351://	ent->client->areabits[i >> 3] |= 1 << (i & 7);
;3352:}
LABELV $1864
endproc ClientEndFrameServerFrame 24 16
export ClientEndFrame
proc ClientEndFrame 4 4
line 3362
;3353:/*
;3354:==============
;3355:ClientEndFrame
;3356:
;3357:Called at the end of each server frame for each connected client
;3358:A fast client will have multiple ClientThink for each ClientEdFrame,
;3359:while a slow client may have multiple ClientEndFrame between ClientThink.
;3360:==============
;3361:*/
;3362:void ClientEndFrame( gentity_t *ent, qboolean forceFull) {
line 3372
;3363:	//int			i;
;3364:	//int			nowTime = LEVELTIME(ent->client);
;3365:
;3366:	// this gets its own loop now.
;3367:	//if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
;3368:	//	SpectatorClientEndFrame( ent );
;3369:	//	return;
;3370:	//}
;3371:
;3372:	if (!ent->client->sess.raceMode || forceFull) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1887
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1885
LABELV $1887
line 3373
;3373:		ClientEndFrameRaceCritical(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrameRaceCritical
CALLV
pop
line 3374
;3374:	}
LABELV $1885
line 3375
;3375:	ClientEndFrameServerFrame(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrameServerFrame
CALLV
pop
line 3376
;3376:}
LABELV $1884
endproc ClientEndFrame 4 4
export ClientEndFrameInClientThink
proc ClientEndFrameInClientThink 0 4
line 3378
;3377:
;3378:void ClientEndFrameInClientThink( gentity_t *ent ) {
line 3388
;3379:	//int			i;
;3380:	//int			nowTime = LEVELTIME(ent->client);
;3381:
;3382:	// this gets its own loop now.
;3383:	//if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
;3384:	//	SpectatorClientEndFrame( ent );
;3385:	//	return;
;3386:	//}
;3387:
;3388:	if (ent->client->sess.raceMode) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 43488
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1889
line 3389
;3389:		ClientEndFrameRaceCritical(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrameRaceCritical
CALLV
pop
line 3390
;3390:	}
LABELV $1889
line 3391
;3391:}
LABELV $1888
endproc ClientEndFrameInClientThink 0 4
import RestorePosition
import DF_RaceStateInvalidated
import ResetClientModeIfInvalid
import UpdateClientRaceVars
import DF_GetPositionHash
import DF_HandleSegmentedRunPre
import DF_CheckRollSpeed
import DF_PrePmoveValid
import saberOnSound
import saberOffSound
import SetClientPhysicsFps
import G_ApplyKnockback
import PM_SaberInReturn
import PM_SaberInStart
import PM_SaberInTransition
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
bss
export userCmdBuffer
align 4
LABELV userCmdBuffer
skip 917888
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
LABELV $1819
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 83
byte 1 101
byte 1 103
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 94
byte 1 50
byte 1 47
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 101
byte 1 103
byte 1 94
byte 1 51
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 46
byte 1 32
byte 1 40
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 104
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 58
byte 1 32
byte 1 94
byte 1 49
byte 1 37
byte 1 100
byte 1 32
byte 1 45
byte 1 62
byte 1 32
byte 1 37
byte 1 100
byte 1 94
byte 1 51
byte 1 44
byte 1 32
byte 1 102
byte 1 117
byte 1 114
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 115
byte 1 117
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1752
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
LABELV $1751
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
LABELV $1731
byte 1 94
byte 1 51
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 109
byte 1 100
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
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1715
byte 1 94
byte 1 49
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 85
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 87
byte 1 84
byte 1 70
byte 1 46
byte 1 32
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 84
byte 1 104
byte 1 105
byte 1 110
byte 1 107
byte 1 95
byte 1 114
byte 1 101
byte 1 97
byte 1 108
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 46
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1683
byte 1 94
byte 1 51
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 65
byte 1 70
byte 1 75
byte 1 32
byte 1 40
byte 1 103
byte 1 108
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 37
byte 1 100
byte 1 60
byte 1 37
byte 1 100
byte 1 41
byte 1 44
byte 1 32
byte 1 102
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 114
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 98
byte 1 116
byte 1 110
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 111
byte 1 108
byte 1 100
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1673
byte 1 94
byte 1 51
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 65
byte 1 70
byte 1 75
byte 1 32
byte 1 97
byte 1 102
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 44
byte 1 32
byte 1 102
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 114
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 98
byte 1 116
byte 1 110
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 111
byte 1 108
byte 1 100
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1630
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 84
byte 1 104
byte 1 105
byte 1 110
byte 1 107
byte 1 0
align 1
LABELV $1629
byte 1 82
byte 1 117
byte 1 110
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $1628
byte 1 94
byte 1 49
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 118
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
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
byte 1 32
byte 1 37
byte 1 100
byte 1 59
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 46
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 70
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 77
byte 1 115
byte 1 101
byte 1 99
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 84
byte 1 111
byte 1 69
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1595
byte 1 94
byte 1 49
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
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
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1594
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 102
byte 1 102
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 46
byte 1 32
byte 1 86
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 116
byte 1 63
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1545
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1543
byte 1 94
byte 1 51
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 58
byte 1 32
byte 1 83
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 46
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 116
byte 1 97
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1510
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
byte 1 109
byte 1 101
byte 1 108
byte 1 101
byte 1 101
byte 1 47
byte 1 112
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1316
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 10
byte 1 0
align 1
LABELV $1220
byte 1 80
byte 1 76
byte 1 68
byte 1 85
byte 1 69
byte 1 76
byte 1 83
byte 1 84
byte 1 79
byte 1 80
byte 1 0
align 1
LABELV $1219
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
LABELV $1212
byte 1 80
byte 1 76
byte 1 68
byte 1 85
byte 1 69
byte 1 76
byte 1 84
byte 1 73
byte 1 69
byte 1 0
align 1
LABELV $1211
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1210
byte 1 80
byte 1 76
byte 1 68
byte 1 85
byte 1 69
byte 1 76
byte 1 87
byte 1 73
byte 1 78
byte 1 78
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $1209
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
LABELV $1208
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
byte 1 94
byte 1 55
byte 1 33
byte 1 0
align 1
LABELV $1182
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
LABELV $1181
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
LABELV $1150
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 37
byte 1 100
byte 1 32
byte 1 94
byte 1 55
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 94
byte 1 49
byte 1 37
byte 1 100
byte 1 32
byte 1 94
byte 1 55
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 115
byte 1 111
byte 1 102
byte 1 116
byte 1 45
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
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 32
byte 1 80
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 63
byte 1 32
byte 1 84
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 100
byte 1 117
byte 1 112
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1131
byte 1 94
byte 1 51
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 45
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 44
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 46
byte 1 0
align 1
LABELV $1090
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $1086
byte 1 49
byte 1 0
align 1
LABELV $1085
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $1006
byte 1 83
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 114
byte 1 111
byte 1 110
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $726
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 65
byte 1 110
byte 1 116
byte 1 105
byte 1 45
byte 1 84
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 10
byte 1 94
byte 1 55
byte 1 65
byte 1 110
byte 1 111
byte 1 109
byte 1 97
byte 1 108
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
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
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 10
byte 1 40
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 41
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $725
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 65
byte 1 110
byte 1 116
byte 1 105
byte 1 45
byte 1 84
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 10
byte 1 94
byte 1 55
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 32
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
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 32
byte 1 10
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 103
byte 1 111
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 112
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $716
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 65
byte 1 110
byte 1 116
byte 1 105
byte 1 45
byte 1 84
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 10
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 94
byte 1 55
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
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 32
byte 1 10
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $711
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 65
byte 1 110
byte 1 116
byte 1 105
byte 1 45
byte 1 84
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 10
byte 1 94
byte 1 55
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
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
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 10
byte 1 70
byte 1 80
byte 1 83
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 105
byte 1 115
byte 1 104
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $693
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 84
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 94
byte 1 55
byte 1 65
byte 1 110
byte 1 111
byte 1 109
byte 1 97
byte 1 108
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
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
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 10
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $692
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 84
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 94
byte 1 55
byte 1 69
byte 1 110
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
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
byte 1 46
byte 1 32
byte 1 10
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 103
byte 1 111
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 112
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $683
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 84
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 94
byte 1 49
byte 1 78
byte 1 111
byte 1 32
byte 1 94
byte 1 55
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
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 121
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
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
byte 1 10
byte 1 94
byte 1 51
byte 1 40
byte 1 100
byte 1 101
byte 1 118
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 95
byte 1 85
byte 1 83
byte 1 69
byte 1 82
byte 1 73
byte 1 78
byte 1 70
byte 1 79
byte 1 41
byte 1 10
byte 1 94
byte 1 55
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 94
byte 1 50
byte 1 47
byte 1 116
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 102
byte 1 112
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $682
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 50
byte 1 84
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 94
byte 1 55
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
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 121
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 10
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 94
byte 1 50
byte 1 47
byte 1 116
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 102
byte 1 112
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 103
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $660
byte 1 94
byte 1 51
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 84
byte 1 111
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 58
byte 1 32
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $656
byte 1 94
byte 1 49
byte 1 37
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 98
byte 1 101
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 65
byte 1 70
byte 1 75
byte 1 33
byte 1 0
align 1
LABELV $648
byte 1 115
byte 1 0
align 1
LABELV $647
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 83
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 51
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 98
byte 1 101
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 65
byte 1 70
byte 1 75
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $646
byte 1 94
byte 1 51
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 84
byte 1 111
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 58
byte 1 32
byte 1 83
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $610
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 110
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $606
byte 1 68
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
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $195
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
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $192
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
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
